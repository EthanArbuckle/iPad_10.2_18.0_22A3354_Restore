@implementation CPLNewChainedRecordExtractionStep

- (CPLNewChainedRecordExtractionStep)initWithStorage:(id)a3 class:(Class)a4 classDescription:(id)a5 scopeIdentifier:(id)a6 maximumCount:(unint64_t)a7
{
  id v13;
  id v14;
  id v15;
  CPLNewChainedRecordExtractionStep *v16;
  uint64_t v17;
  NSString *classDescription;
  NSObject *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  objc_super v25;
  uint8_t buf[4];
  Class v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a5;
  v15 = a6;
  v25.receiver = self;
  v25.super_class = (Class)CPLNewChainedRecordExtractionStep;
  v16 = -[CPLBatchExtractionStep initWithStorage:scopeIdentifier:](&v25, sel_initWithStorage_scopeIdentifier_, v13, v15);
  if (v16)
  {
    if ((Class)-[objc_class relatedRecordClass](a4, "relatedRecordClass") != a4)
    {
      if (!_CPLSilentLogging)
      {
        __CPLGenericOSLogDomain();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v21 = (void *)-[objc_class relatedRecordClass](a4, "relatedRecordClass");
          *(_DWORD *)buf = 138412546;
          v27 = a4;
          v28 = 2112;
          v29 = v21;
          v22 = v21;
          _os_log_impl(&dword_1B03C2000, v20, OS_LOG_TYPE_ERROR, "Trying to extract new %@ chained but their related record class is %@", buf, 0x16u);

        }
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLBatchExtractionStep.m");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, v16, v24, 174, CFSTR("Trying to extract new %@ chained but their related record class is %@"), a4, -[objc_class relatedRecordClass](a4, "relatedRecordClass"));

      abort();
    }
    objc_storeStrong((id *)&v16->_recordClass, a4);
    v17 = objc_msgSend(v14, "copy");
    classDescription = v16->_classDescription;
    v16->_classDescription = (NSString *)v17;

    v16->_maximumCount = a7;
  }

  return v16;
}

- (BOOL)extractToBatch:(id)a3 maximumCount:(unint64_t)a4 maximumResourceSize:(unint64_t)a5 error:(id *)a6
{
  unint64_t maximumCount;
  void *v10;
  Class recordClass;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  int v34;
  void *v35;
  BOOL v36;
  char v37;
  id *v39;
  id v40;
  id v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  id v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v50 = a3;
  maximumCount = self->_maximumCount;
  if (maximumCount >= a4)
    maximumCount = a4;
  v46 = maximumCount;
  -[CPLBatchExtractionStep storage](self, "storage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  recordClass = self->_recordClass;
  -[CPLBatchExtractionStep scopeIdentifier](self, "scopeIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allChangesWithClass:scopeIdentifier:changeType:", recordClass, v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v15 = v13;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
  if (v16)
  {
    v17 = v16;
    v18 = 0;
    v19 = 0;
    v20 = *(_QWORD *)v58;
    v44 = *(_QWORD *)v58;
    v39 = a6;
    v40 = v15;
    v41 = v14;
    while (2)
    {
      v21 = 0;
      v45 = v17;
      do
      {
        if (*(_QWORD *)v58 != v20)
          objc_enumerationMutation(v15);
        v22 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v21);
        objc_msgSend(v22, "scopedIdentifier", v39);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v14, "containsObject:", v23) & 1) == 0)
        {
          objc_msgSend(v14, "addObject:", v23);
          objc_msgSend(v22, "relatedScopedIdentifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = v22;
          v48 = v23;
          if (v24 && (objc_msgSend(v14, "containsObject:", v24) & 1) == 0)
          {
            v49 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            while ((objc_msgSend(v14, "containsObject:", v24) & 1) == 0)
            {
              objc_msgSend(v10, "changeWithScopedIdentifier:", v24);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "addObject:", v24);
              if (!v25 || (objc_msgSend(v25, "isDelete") & 1) != 0 || (objc_msgSend(v25, "isFullRecord") & 1) == 0)
              {

                break;
              }
              objc_msgSend(v49, "addObject:", v25);
              objc_msgSend(v25, "relatedScopedIdentifier");
              v26 = objc_claimAutoreleasedReturnValue();

              v24 = (void *)v26;
              if (!v26)
                break;
            }
            v55 = 0u;
            v56 = 0u;
            v53 = 0u;
            v54 = 0u;
            objc_msgSend(v49, "reverseObjectEnumerator");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
            if (v28)
            {
              v29 = v28;
              v30 = *(_QWORD *)v54;
              while (2)
              {
                v31 = 0;
                v42 = v18 + v29;
                v43 = v18 + 1;
                v32 = v19;
                do
                {
                  if (*(_QWORD *)v54 != v30)
                    objc_enumerationMutation(v27);
                  v33 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * v31);
                  objc_msgSend(v50, "addChange:fromStorage:", v33, v10);
                  v52 = v32;
                  v34 = objc_msgSend(v10, "removeChange:error:", v33, &v52);
                  v19 = v52;

                  if (!v34)
                  {
                    v18 = v43 + v31;

                    v15 = v40;
                    v14 = v41;
                    goto LABEL_37;
                  }
                  ++v31;
                  v32 = v19;
                }
                while (v29 != v31);
                v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
                v18 = v42;
                if (v29)
                  continue;
                break;
              }
            }

            v15 = v40;
            v14 = v41;
          }
          v35 = v19;
          ++v18;
          objc_msgSend(v50, "addChange:fromStorage:", v47, v10);
          v51 = v19;
          v34 = objc_msgSend(v10, "removeChange:error:", v47, &v51);
          v19 = v51;

          if (v34)
            v36 = v18 >= v46;
          else
            v36 = 1;
          if (v36)
          {
LABEL_37:

            a6 = v39;
            goto LABEL_39;
          }

          v20 = v44;
          v17 = v45;
          v23 = v48;
        }

        ++v21;
      }
      while (v21 != v17);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
      v34 = 1;
      a6 = v39;
      if (v17)
        continue;
      break;
    }
  }
  else
  {
    v18 = 0;
    v19 = 0;
    v34 = 1;
  }
LABEL_39:

  if (v34 && v18 >= v46)
    objc_msgSend(v50, "setFull:", 1);
  if (a6)
    v37 = v34;
  else
    v37 = 1;
  if ((v37 & 1) == 0)
    *a6 = objc_retainAutorelease(v19);

  return v34;
}

- (BOOL)shouldResetFromThisStepWithIncomingChange:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = (objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v3, "isFullRecord") & 1) != 0;

  return v4;
}

- (id)shortDescription
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("New(%@, chained)"), self->_classDescription);
}

- (Class)recordClass
{
  return self->_recordClass;
}

- (NSString)classDescription
{
  return self->_classDescription;
}

- (unint64_t)maximumCount
{
  return self->_maximumCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classDescription, 0);
  objc_storeStrong((id *)&self->_recordClass, 0);
}

@end
