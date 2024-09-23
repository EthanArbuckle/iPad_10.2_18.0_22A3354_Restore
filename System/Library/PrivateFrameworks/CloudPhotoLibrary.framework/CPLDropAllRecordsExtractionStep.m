@implementation CPLDropAllRecordsExtractionStep

- (BOOL)extractToBatch:(id)a3 maximumCount:(unint64_t)a4 maximumResourceSize:(unint64_t)a5 error:(id *)a6
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  int v20;
  BOOL v21;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[CPLBatchExtractionStep storage](self, "storage", a3, a4, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLBatchExtractionStep storage](self, "storage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLBatchExtractionStep scopeIdentifier](self, "scopeIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allChangesWithScopeIdentifier:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v13)
  {
    v14 = v13;
    v15 = 0;
    v16 = *(_QWORD *)v25;
    while (2)
    {
      v17 = 0;
      v18 = v15;
      do
      {
        if (*(_QWORD *)v25 != v16)
          objc_enumerationMutation(v12);
        v19 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v17);
        v23 = v18;
        v20 = objc_msgSend(v8, "removeChange:error:", v19, &v23);
        v15 = v23;

        if (!v20)
        {

          if (a6)
          {
            v15 = objc_retainAutorelease(v15);
            v21 = 0;
            *a6 = v15;
          }
          else
          {
            v21 = 0;
          }
          goto LABEL_15;
        }
        ++v17;
        v18 = v15;
      }
      while (v14 != v17);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v14)
        continue;
      break;
    }
  }
  else
  {
    v15 = 0;
  }

  v21 = 1;
LABEL_15:

  return v21;
}

- (BOOL)shouldResetFromThisStepWithIncomingChange:(id)a3
{
  return 1;
}

- (id)shortDescription
{
  return CFSTR("DropAll");
}

@end
