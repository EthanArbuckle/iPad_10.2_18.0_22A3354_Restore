@implementation CPLDeleteChainedRecordExtractionStep

- (CPLDeleteChainedRecordExtractionStep)initWithStorage:(id)a3 class:(Class)a4 classDescription:(id)a5 scopeIdentifier:(id)a6 maximumCount:(unint64_t)a7
{
  id v13;
  id v14;
  id v15;
  CPLDeleteChainedRecordExtractionStep *v16;
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
  v25.super_class = (Class)CPLDeleteChainedRecordExtractionStep;
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
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, v16, v24, 282, CFSTR("Trying to extract new %@ chained but their related record class is %@"), a4, -[objc_class relatedRecordClass](a4, "relatedRecordClass"));

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
  id v8;
  unint64_t maximumCount;
  void *v10;
  Class recordClass;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  char *v39;
  void *v40;
  uint64_t v41;
  int v42;
  id v43;
  BOOL v44;
  unint64_t v45;
  BOOL v46;
  char v47;
  uint64_t v50;
  id obj;
  uint64_t v52;
  id v53;
  unint64_t v54;
  char *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  unint64_t v59;
  void *v60;
  void *context;
  CPLDeleteChainedRecordExtractionStep *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  id v66;
  char *v67;
  id v68;
  id v69;
  id v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _BYTE v87[128];
  _BYTE v88[128];
  _BYTE v89[128];
  _BYTE v90[128];
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  maximumCount = self->_maximumCount;
  if (maximumCount >= a4)
    maximumCount = a4;
  v58 = v8;
  v59 = maximumCount;
  -[CPLBatchExtractionStep storage](self, "storage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = self;
  recordClass = self->_recordClass;
  -[CPLBatchExtractionStep scopeIdentifier](self, "scopeIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = v10;
  objc_msgSend(v10, "allChangesWithClass:scopeIdentifier:changeType:", recordClass, v12, 1024);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  obj = v13;
  v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v90, 16);
  if (v52)
  {
    v53 = 0;
    v54 = 0;
    v15 = *(_QWORD *)v84;
    v50 = *(_QWORD *)v84;
    while (2)
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v84 != v15)
          objc_enumerationMutation(obj);
        v56 = v16;
        v17 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * v16);
        objc_msgSend(v17, "scopedIdentifier");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v14, "containsObject:") & 1) == 0)
        {
          v60 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 5);
          v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v17, 0);
          v19 = v18;
          while (objc_msgSend(v18, "count"))
          {
            v20 = v19;
            context = (void *)MEMORY[0x1B5E08BF0]();
            objc_msgSend(v60, "addObjectsFromArray:", v19);
            v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            v79 = 0u;
            v80 = 0u;
            v81 = 0u;
            v82 = 0u;
            v66 = v20;
            v21 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v79, v89, 16);
            if (v21)
            {
              v22 = v21;
              v23 = *(_QWORD *)v80;
              v63 = *(_QWORD *)v80;
              do
              {
                v24 = 0;
                v65 = v22;
                do
                {
                  if (*(_QWORD *)v80 != v23)
                    objc_enumerationMutation(v66);
                  objc_msgSend(*(id *)(*((_QWORD *)&v79 + 1) + 8 * v24), "scopedIdentifier");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  if ((objc_msgSend(v14, "containsObject:", v25) & 1) == 0)
                  {
                    objc_msgSend(v14, "addObject:", v25);
                    v77 = 0u;
                    v78 = 0u;
                    v75 = 0u;
                    v76 = 0u;
                    v68 = v25;
                    objc_msgSend(v64, "allChangesWithClass:relatedScopedIdentifier:", v62->_recordClass, v25);
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v75, v88, 16);
                    if (v27)
                    {
                      v28 = v27;
                      v29 = *(_QWORD *)v76;
                      do
                      {
                        for (i = 0; i != v28; ++i)
                        {
                          if (*(_QWORD *)v76 != v29)
                            objc_enumerationMutation(v26);
                          v31 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * i);
                          if (objc_msgSend(v31, "isDelete"))
                          {
                            objc_msgSend(v31, "scopedIdentifier");
                            v32 = (void *)objc_claimAutoreleasedReturnValue();
                            v33 = objc_msgSend(v14, "containsObject:", v32);

                            if ((v33 & 1) == 0)
                              objc_msgSend(v19, "addObject:", v31);
                          }
                        }
                        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v75, v88, 16);
                      }
                      while (v28);
                    }

                    v23 = v63;
                    v22 = v65;
                    v25 = v68;
                  }

                  ++v24;
                }
                while (v24 != v22);
                v22 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v79, v89, 16);
              }
              while (v22);
            }

            objc_autoreleasePoolPop(context);
            v18 = v19;
          }
          v73 = 0u;
          v74 = 0u;
          v71 = 0u;
          v72 = 0u;
          objc_msgSend(v60, "reverseObjectEnumerator");
          v69 = (id)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v71, v87, 16);
          if (v34)
          {
            v35 = v34;
            v36 = *(_QWORD *)v72;
            v37 = (char *)v54;
            while (2)
            {
              v38 = 0;
              v67 = &v37[v35];
              v55 = v37;
              v39 = v37 + 1;
              v40 = v53;
              do
              {
                if (*(_QWORD *)v72 != v36)
                  objc_enumerationMutation(v69);
                v41 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * v38);
                objc_msgSend(v58, "addChange:fromStorage:", v41, v64);
                v70 = v40;
                v42 = objc_msgSend(v64, "removeChange:error:", v41, &v70);
                v43 = v70;

                if (v42)
                  v44 = (unint64_t)&v39[v38] >= v59;
                else
                  v44 = 1;
                if (v44)
                {
                  v53 = v43;
                  v45 = (unint64_t)&v55[v38 + 1];
                  goto LABEL_45;
                }
                ++v38;
                v40 = v43;
              }
              while (v35 != v38);
              v53 = v43;
              v35 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v71, v87, 16);
              v37 = v67;
              if (v35)
                continue;
              break;
            }
            v42 = 1;
            v45 = (unint64_t)v67;
          }
          else
          {
            v42 = 1;
            v45 = v54;
          }
LABEL_45:

          if (v42)
            v46 = v45 >= v59;
          else
            v46 = 1;
          v54 = v45;
          if (v46)
          {

            goto LABEL_56;
          }
          v15 = v50;
        }

        v16 = v56 + 1;
      }
      while (v56 + 1 != v52);
      v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v90, 16);
      if (v52)
        continue;
      break;
    }
  }
  else
  {
    v53 = 0;
    v54 = 0;
  }
  v42 = 1;
LABEL_56:

  if (v42 && v54 >= v59)
    objc_msgSend(v58, "setFull:", 1);
  if (a6)
    v47 = v42;
  else
    v47 = 1;
  if ((v47 & 1) == 0)
    *a6 = objc_retainAutorelease(v53);

  return v42;
}

- (BOOL)shouldResetFromThisStepWithIncomingChange:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = (objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v3, "isDelete") & 1) != 0;

  return v4;
}

- (id)shortDescription
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Deleted(%@, chained)"), self->_classDescription);
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
