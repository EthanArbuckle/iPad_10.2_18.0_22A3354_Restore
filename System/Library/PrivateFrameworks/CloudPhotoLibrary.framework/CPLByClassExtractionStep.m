@implementation CPLByClassExtractionStep

- (CPLByClassExtractionStep)initWithStorage:(id)a3 scopeIdentifier:(id)a4 description:(id)a5 class:(Class)a6 maximumCount:(unint64_t)a7 query:(void *)a8
{
  id v14;
  CPLByClassExtractionStep *v15;
  uint64_t v16;
  NSString *queryDescription;
  objc_super v19;

  v14 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CPLByClassExtractionStep;
  v15 = -[CPLBatchExtractionStep initWithStorage:scopeIdentifier:](&v19, sel_initWithStorage_scopeIdentifier_, a3, a4);
  if (v15)
  {
    v16 = objc_msgSend(v14, "copy");
    queryDescription = v15->_queryDescription;
    v15->_queryDescription = (NSString *)v16;

    v15->_extractionClass = a6;
    v15->_maximumCount = a7;
    v15->_query = a8;
  }

  return v15;
}

- (BOOL)extractToBatch:(id)a3 maximumCount:(unint64_t)a4 maximumResourceSize:(unint64_t)a5 error:(id *)a6
{
  id v10;
  void *v11;
  unint64_t maximumCount;
  id v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  unint64_t v22;
  void *v23;
  unint64_t v24;
  int v25;
  BOOL v26;
  void *v27;
  id *v29;
  uint64_t v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  -[CPLBatchExtractionStep storage](self, "storage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_maximumCount >= a4)
    maximumCount = a4;
  else
    maximumCount = self->_maximumCount;
  ((void (*)(CPLByClassExtractionStep *))self->_query)(self);
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v14)
  {
    v29 = a6;
    v15 = 0;
    v16 = 0;
    v17 = *(_QWORD *)v39;
    v31 = v10;
    v32 = v13;
    v35 = a5;
    v18 = v14;
    while (2)
    {
      v19 = 0;
      v36 = v15 + 1;
      v30 = v15 + v18;
      v20 = v16;
      v34 = v18;
      do
      {
        if (*(_QWORD *)v39 != v17)
          objc_enumerationMutation(v13);
        v21 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v19);
        if (objc_msgSend(v21, "supportsResources")
          && objc_msgSend(v21, "hasChangeType:", 8))
        {
          v22 = objc_msgSend(v21, "effectiveResourceSizeToUploadUsingStorage:", v11);
          if (v22 > v35)
          {
            objc_msgSend(v10, "batch");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = objc_msgSend(v23, "count");

            v10 = v31;
            v13 = v32;
            if (v33)
            {
              v16 = v20;
LABEL_27:
              objc_msgSend(v10, "setFull:", 1);
              goto LABEL_28;
            }
          }
          v24 = v35 - v22;
          if (v35 < v22)
            v24 = 0;
          v35 = v24;
          v18 = v34;
        }
        objc_msgSend(v10, "addChange:fromStorage:", v21, v11);
        v37 = v20;
        v25 = objc_msgSend(v11, "removeChange:error:", v21, &v37);
        v16 = v37;

        if (!v25)
        {

          if (v29)
          {
            v16 = objc_retainAutorelease(v16);
            v26 = 0;
            *v29 = v16;
          }
          else
          {
            v26 = 0;
          }
          v27 = v32;
          goto LABEL_29;
        }
        if (v36 + v19 >= maximumCount)
          goto LABEL_27;
        ++v19;
        v20 = v16;
      }
      while (v18 != v19);
      v18 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      v15 = v30;
      if (v18)
        continue;
      break;
    }
  }
  else
  {
    v16 = 0;
  }
LABEL_28:

  v27 = v13;
  v26 = 1;
LABEL_29:

  return v26;
}

- (BOOL)shouldResetFromThisStepWithIncomingChange:(id)a3
{
  Class extractionClass;

  extractionClass = self->_extractionClass;
  return !extractionClass || extractionClass == (Class)objc_opt_class();
}

- (id)shortDescription
{
  return self->_queryDescription;
}

- (Class)extractionClass
{
  return self->_extractionClass;
}

- (unint64_t)maximumCount
{
  return self->_maximumCount;
}

- (NSString)queryDescription
{
  return self->_queryDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryDescription, 0);
}

@end
