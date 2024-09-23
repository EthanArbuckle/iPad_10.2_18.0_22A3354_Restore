@implementation GDEntityTaggingService

- (GDEntityTaggingService)initWithConfig:(id)a3 error:(id *)a4
{
  GDEntityTaggingService *v5;
  GDEntityTagConfigurationInner *v6;
  GDEntityTaggingServiceInner *v7;
  const char *v8;
  uint64_t v9;
  GDEntityTaggingServiceInner *inner;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)GDEntityTaggingService;
  v5 = -[GDEntityTaggingService init](&v12, sel_init, a3);
  if (v5)
  {
    v6 = objc_alloc_init(GDEntityTagConfigurationInner);
    v7 = [GDEntityTaggingServiceInner alloc];
    v9 = objc_msgSend_initWithEtConfig_error_(v7, v8, (uint64_t)v6, a4);
    inner = v5->inner;
    v5->inner = (GDEntityTaggingServiceInner *)v9;

  }
  return v5;
}

- (id)entityTagsForIdentifier:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  GDPersonEntityTaggingOptionsInner *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  dispatch_semaphore_t v16;
  GDEntityTaggingServiceInner *inner;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  dispatch_time_t v21;
  intptr_t v22;
  id v23;
  const char *v24;
  void *v25;
  const char *v26;
  void *v27;
  id v28;
  const char *v29;
  const char *v30;
  id v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  GDScoredPersonEntityTagType *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  void *v47;
  const char *v48;
  const char *v49;
  GDRankedPersonEntityTags *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _QWORD v67[4];
  NSObject *v68;
  uint64_t *v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t (*v74)(uint64_t, uint64_t);
  void (*v75)(uint64_t);
  id v76;
  uint64_t v77;
  uint64_t *v78;
  uint64_t v79;
  uint64_t (*v80)(uint64_t, uint64_t);
  void (*v81)(uint64_t);
  id v82;
  _BYTE v83[128];
  uint64_t v84;
  const __CFString *v85;
  uint64_t v86;
  _QWORD v87[3];

  v87[1] = *MEMORY[0x1E0C80C00];
  v62 = a3;
  v8 = a4;
  v61 = v8;
  if (self->inner)
  {
    v9 = v8;
    v10 = [GDPersonEntityTaggingOptionsInner alloc];
    objc_msgSend_tagThresholds(v9, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend_initWithTagNameThresholds_(v10, v14, (uint64_t)v13);

    v77 = 0;
    v78 = &v77;
    v79 = 0x3032000000;
    v80 = sub_1AE8EC310;
    v81 = sub_1AE8EC320;
    v82 = 0;
    v71 = 0;
    v72 = &v71;
    v73 = 0x3032000000;
    v74 = sub_1AE8EC310;
    v75 = sub_1AE8EC320;
    v76 = 0;
    v16 = dispatch_semaphore_create(0);
    inner = self->inner;
    v67[0] = MEMORY[0x1E0C809B0];
    v67[1] = 3221225472;
    v67[2] = sub_1AE8EC4E0;
    v67[3] = &unk_1E5DD9340;
    v69 = &v77;
    v70 = &v71;
    v18 = v16;
    v68 = v18;
    v59 = (void *)v15;
    objc_msgSend_personEntityTagsFor_options_completionHandler_(inner, v19, (uint64_t)v62, v15, v67);
    v20 = v18;
    v21 = dispatch_time(0, 5000000000);
    v22 = dispatch_semaphore_wait(v20, v21);

    if (v22)
    {
      if (a5)
      {
        v23 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v84 = *MEMORY[0x1E0CB2D50];
        v85 = CFSTR("Timed out waiting for EntityTaggingService to return.");
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v24, (uint64_t)&v85, &v84, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *a5 = (id)objc_msgSend_initWithDomain_code_userInfo_(v23, v26, (uint64_t)CFSTR("GDErrorDomain"), 14, v25);

      }
    }
    else
    {
      if (v78[5])
      {
        v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v65 = 0u;
        v66 = 0u;
        v63 = 0u;
        v64 = 0u;
        objc_msgSend_scoredPersonEntityTags((void *)v78[5], v32, v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v35, (uint64_t)&v63, v83, 16);
        if (v36)
        {
          v37 = *(_QWORD *)v64;
          do
          {
            v38 = 0;
            do
            {
              if (*(_QWORD *)v64 != v37)
                objc_enumerationMutation(v34);
              v39 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v38);
              v40 = [GDScoredPersonEntityTagType alloc];
              v43 = objc_msgSend_gdTag(v39, v41, v42);
              objc_msgSend_score(v39, v44, v45);
              v47 = (void *)objc_msgSend_initWithTag_score_(v40, v46, v43);
              objc_msgSend_addObject_(v31, v48, (uint64_t)v47);

              ++v38;
            }
            while (v36 != v38);
            v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v49, (uint64_t)&v63, v83, 16);
          }
          while (v36);
        }

        v50 = [GDRankedPersonEntityTags alloc];
        v53 = objc_msgSend_idValue((void *)v78[5], v51, v52);
        v56 = objc_msgSend_inferenceEventIdValue((void *)v78[5], v54, v55);
        v27 = (void *)objc_msgSend_initWithIDValue_scoredPersonEntityTags_entityRelevanceInferenceEventId_(v50, v57, v53, v31, v56);

        goto LABEL_20;
      }
      if (a5)
      {
        v27 = 0;
        *a5 = objc_retainAutorelease((id)v72[5]);
LABEL_20:

        _Block_object_dispose(&v71, 8);
        _Block_object_dispose(&v77, 8);

        goto LABEL_22;
      }
    }
    v27 = 0;
    goto LABEL_20;
  }
  if (a5)
  {
    v28 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v86 = *MEMORY[0x1E0CB2D50];
    v87[0] = CFSTR("Error when initializing EntityTaggingService.");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v29, (uint64_t)v87, &v86, 1);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    *a5 = (id)objc_msgSend_initWithDomain_code_userInfo_(v28, v30, (uint64_t)CFSTR("GDErrorDomain"), 1, v60);

  }
  else
  {
    v27 = 0;
  }
LABEL_22:

  return v27;
}

- (id)entitiesForTag:(int64_t)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  GDPersonEntityTaggingOptionsInner *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  dispatch_semaphore_t v16;
  GDEntityTaggingServiceInner *inner;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  dispatch_time_t v21;
  intptr_t v22;
  id v23;
  const char *v24;
  void *v25;
  const char *v26;
  void *v27;
  id v28;
  const char *v29;
  const char *v30;
  id v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  GDScoredPersonEntity *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  void *v47;
  const char *v48;
  const char *v49;
  GDRankedEntityTagPersons *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  id v59;
  void *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _QWORD v65[4];
  NSObject *v66;
  uint64_t *v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t (*v72)(uint64_t, uint64_t);
  void (*v73)(uint64_t);
  id v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t (*v78)(uint64_t, uint64_t);
  void (*v79)(uint64_t);
  id v80;
  _BYTE v81[128];
  uint64_t v82;
  const __CFString *v83;
  uint64_t v84;
  _QWORD v85[3];

  v85[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = v8;
  if (self->inner)
  {
    v10 = [GDPersonEntityTaggingOptionsInner alloc];
    v59 = v9;
    objc_msgSend_tagThresholds(v9, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend_initWithTagNameThresholds_(v10, v14, (uint64_t)v13);

    v75 = 0;
    v76 = &v75;
    v77 = 0x3032000000;
    v78 = sub_1AE8EC310;
    v79 = sub_1AE8EC320;
    v80 = 0;
    v69 = 0;
    v70 = &v69;
    v71 = 0x3032000000;
    v72 = sub_1AE8EC310;
    v73 = sub_1AE8EC320;
    v74 = 0;
    v16 = dispatch_semaphore_create(0);
    inner = self->inner;
    v65[0] = MEMORY[0x1E0C809B0];
    v65[1] = 3221225472;
    v65[2] = sub_1AE8EC458;
    v65[3] = &unk_1E5DD9368;
    v67 = &v75;
    v68 = &v69;
    v18 = v16;
    v66 = v18;
    v60 = (void *)v15;
    objc_msgSend_entitiesForTagWithGdEntityTagType_options_completionHandler_(inner, v19, a3, v15, v65);
    v20 = v18;
    v21 = dispatch_time(0, 5000000000);
    v22 = dispatch_semaphore_wait(v20, v21);

    if (v22)
    {
      if (a5)
      {
        v23 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v82 = *MEMORY[0x1E0CB2D50];
        v83 = CFSTR("Timed out waiting for EntityTaggingService to return.");
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v24, (uint64_t)&v83, &v82, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *a5 = (id)objc_msgSend_initWithDomain_code_userInfo_(v23, v26, (uint64_t)CFSTR("GDErrorDomain"), 14, v25);

      }
    }
    else
    {
      if (v76[5])
      {
        v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v63 = 0u;
        v64 = 0u;
        v61 = 0u;
        v62 = 0u;
        objc_msgSend_scoredEntities((void *)v76[5], v32, v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v35, (uint64_t)&v61, v81, 16);
        if (v36)
        {
          v37 = *(_QWORD *)v62;
          do
          {
            v38 = 0;
            do
            {
              if (*(_QWORD *)v62 != v37)
                objc_enumerationMutation(v34);
              v39 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v38);
              v40 = [GDScoredPersonEntity alloc];
              v43 = objc_msgSend_idValue(v39, v41, v42);
              objc_msgSend_score(v39, v44, v45);
              v47 = (void *)objc_msgSend_initWithIDValue_score_(v40, v46, v43);
              objc_msgSend_addObject_(v31, v48, (uint64_t)v47);

              ++v38;
            }
            while (v36 != v38);
            v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v49, (uint64_t)&v61, v81, 16);
          }
          while (v36);
        }

        v50 = [GDRankedEntityTagPersons alloc];
        v53 = objc_msgSend_gdTag((void *)v76[5], v51, v52);
        v56 = objc_msgSend_inferenceEventIdValue((void *)v76[5], v54, v55);
        v27 = (void *)objc_msgSend_initWithTag_scoredEntities_entityRelevanceInferenceEventId_(v50, v57, v53, v31, v56);

        goto LABEL_20;
      }
      if (a5)
      {
        v27 = 0;
        *a5 = objc_retainAutorelease((id)v70[5]);
        goto LABEL_20;
      }
    }
    v27 = 0;
LABEL_20:

    _Block_object_dispose(&v69, 8);
    _Block_object_dispose(&v75, 8);

    goto LABEL_21;
  }
  if (a5)
  {
    v59 = v8;
    v28 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v84 = *MEMORY[0x1E0CB2D50];
    v85[0] = CFSTR("Error when initializing EntityTaggingService.");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v29, (uint64_t)v85, &v84, 1);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    *a5 = (id)objc_msgSend_initWithDomain_code_userInfo_(v28, v30, (uint64_t)CFSTR("GDErrorDomain"), 1, v60);
LABEL_21:

    v9 = v59;
    goto LABEL_22;
  }
  v27 = 0;
LABEL_22:

  return v27;
}

- (id)entityTagsForIdentifiers:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  GDPersonEntityTaggingOptionsInner *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  dispatch_semaphore_t v16;
  GDEntityTaggingServiceInner *inner;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  dispatch_time_t v21;
  intptr_t v22;
  id v23;
  const char *v24;
  void *v25;
  const char *v26;
  id v27;
  const char *v28;
  const char *v29;
  const char *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  id v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  void *v43;
  GDScoredPersonEntityTagType *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  const char *v50;
  void *v51;
  const char *v52;
  const char *v53;
  GDRankedPersonEntityTags *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  void *v62;
  const char *v63;
  NSObject *v64;
  id v65;
  void *v66;
  id v67;
  id obj;
  uint64_t v69;
  uint64_t v70;
  id v71;
  uint64_t v72;
  uint64_t i;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _QWORD v82[4];
  NSObject *v83;
  uint64_t *v84;
  uint64_t *v85;
  uint64_t v86;
  uint64_t *v87;
  uint64_t v88;
  uint64_t (*v89)(uint64_t, uint64_t);
  void (*v90)(uint64_t);
  id v91;
  uint64_t v92;
  uint64_t *v93;
  uint64_t v94;
  uint64_t (*v95)(uint64_t, uint64_t);
  void (*v96)(uint64_t);
  id v97;
  _BYTE v98[128];
  _BYTE v99[128];
  uint64_t v100;
  const __CFString *v101;
  uint64_t v102;
  _QWORD v103[3];

  v103[1] = *MEMORY[0x1E0C80C00];
  v67 = a3;
  v8 = a4;
  v9 = v8;
  if (self->inner)
  {
    v10 = [GDPersonEntityTaggingOptionsInner alloc];
    v65 = v9;
    objc_msgSend_tagThresholds(v9, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend_initWithTagNameThresholds_(v10, v14, (uint64_t)v13);

    v92 = 0;
    v93 = &v92;
    v94 = 0x3032000000;
    v95 = sub_1AE8EC310;
    v96 = sub_1AE8EC320;
    v97 = 0;
    v86 = 0;
    v87 = &v86;
    v88 = 0x3032000000;
    v89 = sub_1AE8EC310;
    v90 = sub_1AE8EC320;
    v91 = 0;
    v16 = dispatch_semaphore_create(0);
    inner = self->inner;
    v82[0] = MEMORY[0x1E0C809B0];
    v82[1] = 3221225472;
    v82[2] = sub_1AE8EC3D0;
    v82[3] = &unk_1E5DD9390;
    v84 = &v92;
    v85 = &v86;
    v18 = v16;
    v83 = v18;
    v66 = (void *)v15;
    objc_msgSend_peopleEntityTagsFor_options_completionHandler_(inner, v19, (uint64_t)v67, v15, v82);
    v20 = v18;
    v21 = dispatch_time(0, 5000000000);
    v22 = dispatch_semaphore_wait(v20, v21);
    v64 = v20;

    if (v22)
    {
      if (a5)
      {
        v23 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v100 = *MEMORY[0x1E0CB2D50];
        v101 = CFSTR("Timed out waiting for EntityTaggingService to return.");
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v24, (uint64_t)&v101, &v100, 1, v64);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *a5 = (id)objc_msgSend_initWithDomain_code_userInfo_(v23, v26, (uint64_t)CFSTR("GDErrorDomain"), 14, v25);

      }
    }
    else
    {
      if (v93[5])
      {
        v71 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v80 = 0u;
        v81 = 0u;
        v78 = 0u;
        v79 = 0u;
        obj = (id)v93[5];
        v70 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v31, (uint64_t)&v78, v99, 16, v20);
        if (v70)
        {
          v69 = *(_QWORD *)v79;
          do
          {
            for (i = 0; i != v70; ++i)
            {
              if (*(_QWORD *)v79 != v69)
                objc_enumerationMutation(obj);
              v33 = *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * i);
              objc_msgSend_objectForKey_((void *)v93[5], v32, v33);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v72 = v33;
              v35 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              v76 = 0u;
              v77 = 0u;
              v74 = 0u;
              v75 = 0u;
              objc_msgSend_scoredPersonEntityTags(v34, v36, v37);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v39, (uint64_t)&v74, v98, 16);
              if (v40)
              {
                v41 = *(_QWORD *)v75;
                do
                {
                  for (j = 0; j != v40; ++j)
                  {
                    if (*(_QWORD *)v75 != v41)
                      objc_enumerationMutation(v38);
                    v43 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * j);
                    v44 = [GDScoredPersonEntityTagType alloc];
                    v47 = objc_msgSend_gdTag(v43, v45, v46);
                    objc_msgSend_score(v43, v48, v49);
                    v51 = (void *)objc_msgSend_initWithTag_score_(v44, v50, v47);
                    objc_msgSend_addObject_(v35, v52, (uint64_t)v51);

                  }
                  v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v53, (uint64_t)&v74, v98, 16);
                }
                while (v40);
              }

              v54 = [GDRankedPersonEntityTags alloc];
              v57 = objc_msgSend_idValue(v34, v55, v56);
              v60 = objc_msgSend_inferenceEventIdValue(v34, v58, v59);
              v62 = (void *)objc_msgSend_initWithIDValue_scoredPersonEntityTags_entityRelevanceInferenceEventId_(v54, v61, v57, v35, v60);
              objc_msgSend_setObject_forKeyedSubscript_(v71, v63, (uint64_t)v62, v72);

            }
            v70 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v32, (uint64_t)&v78, v99, 16);
          }
          while (v70);
        }

        goto LABEL_6;
      }
      if (a5)
      {
        v71 = 0;
        *a5 = objc_retainAutorelease((id)v87[5]);
        goto LABEL_6;
      }
    }
    v71 = 0;
LABEL_6:

    _Block_object_dispose(&v86, 8);
    _Block_object_dispose(&v92, 8);

    goto LABEL_9;
  }
  if (!a5)
  {
    v71 = 0;
    goto LABEL_10;
  }
  v65 = v8;
  v27 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v102 = *MEMORY[0x1E0CB2D50];
  v103[0] = CFSTR("Error when initializing EntityTaggingService.");
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v28, (uint64_t)v103, &v102, 1);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = 0;
  *a5 = (id)objc_msgSend_initWithDomain_code_userInfo_(v27, v29, (uint64_t)CFSTR("GDErrorDomain"), 1, v66);
LABEL_9:

  v9 = v65;
LABEL_10:

  return v71;
}

- (id)entitiesForTags:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  GDPersonEntityTaggingOptionsInner *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  dispatch_semaphore_t v16;
  GDEntityTaggingServiceInner *inner;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  dispatch_time_t v21;
  intptr_t v22;
  id v23;
  const char *v24;
  void *v25;
  const char *v26;
  id v27;
  const char *v28;
  const char *v29;
  const char *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  id v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  void *v43;
  GDScoredPersonEntity *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  const char *v50;
  void *v51;
  const char *v52;
  const char *v53;
  GDRankedEntityTagPersons *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  void *v62;
  const char *v63;
  NSObject *v64;
  id v65;
  void *v66;
  id v67;
  id obj;
  uint64_t v69;
  uint64_t v70;
  id v71;
  uint64_t v72;
  uint64_t i;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _QWORD v82[4];
  NSObject *v83;
  uint64_t *v84;
  uint64_t *v85;
  uint64_t v86;
  uint64_t *v87;
  uint64_t v88;
  uint64_t (*v89)(uint64_t, uint64_t);
  void (*v90)(uint64_t);
  id v91;
  uint64_t v92;
  uint64_t *v93;
  uint64_t v94;
  uint64_t (*v95)(uint64_t, uint64_t);
  void (*v96)(uint64_t);
  id v97;
  _BYTE v98[128];
  _BYTE v99[128];
  uint64_t v100;
  const __CFString *v101;
  uint64_t v102;
  _QWORD v103[3];

  v103[1] = *MEMORY[0x1E0C80C00];
  v67 = a3;
  v8 = a4;
  v9 = v8;
  if (self->inner)
  {
    v10 = [GDPersonEntityTaggingOptionsInner alloc];
    v65 = v9;
    objc_msgSend_tagThresholds(v9, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend_initWithTagNameThresholds_(v10, v14, (uint64_t)v13);

    v92 = 0;
    v93 = &v92;
    v94 = 0x3032000000;
    v95 = sub_1AE8EC310;
    v96 = sub_1AE8EC320;
    v97 = 0;
    v86 = 0;
    v87 = &v86;
    v88 = 0x3032000000;
    v89 = sub_1AE8EC310;
    v90 = sub_1AE8EC320;
    v91 = 0;
    v16 = dispatch_semaphore_create(0);
    inner = self->inner;
    v82[0] = MEMORY[0x1E0C809B0];
    v82[1] = 3221225472;
    v82[2] = sub_1AE8EC348;
    v82[3] = &unk_1E5DD9390;
    v84 = &v92;
    v85 = &v86;
    v18 = v16;
    v83 = v18;
    v66 = (void *)v15;
    objc_msgSend_personEntitiesFor_options_completionHandler_(inner, v19, (uint64_t)v67, v15, v82);
    v20 = v18;
    v21 = dispatch_time(0, 5000000000);
    v22 = dispatch_semaphore_wait(v20, v21);
    v64 = v20;

    if (v22)
    {
      if (a5)
      {
        v23 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v100 = *MEMORY[0x1E0CB2D50];
        v101 = CFSTR("Timed out waiting for EntityTaggingService to return.");
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v24, (uint64_t)&v101, &v100, 1, v64);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *a5 = (id)objc_msgSend_initWithDomain_code_userInfo_(v23, v26, (uint64_t)CFSTR("GDErrorDomain"), 14, v25);

      }
    }
    else
    {
      if (v93[5])
      {
        v71 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v80 = 0u;
        v81 = 0u;
        v78 = 0u;
        v79 = 0u;
        obj = (id)v93[5];
        v70 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v31, (uint64_t)&v78, v99, 16, v20);
        if (v70)
        {
          v69 = *(_QWORD *)v79;
          do
          {
            for (i = 0; i != v70; ++i)
            {
              if (*(_QWORD *)v79 != v69)
                objc_enumerationMutation(obj);
              v33 = *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * i);
              objc_msgSend_objectForKey_((void *)v93[5], v32, v33);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v72 = v33;
              v35 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              v76 = 0u;
              v77 = 0u;
              v74 = 0u;
              v75 = 0u;
              objc_msgSend_scoredEntities(v34, v36, v37);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v39, (uint64_t)&v74, v98, 16);
              if (v40)
              {
                v41 = *(_QWORD *)v75;
                do
                {
                  for (j = 0; j != v40; ++j)
                  {
                    if (*(_QWORD *)v75 != v41)
                      objc_enumerationMutation(v38);
                    v43 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * j);
                    v44 = [GDScoredPersonEntity alloc];
                    v47 = objc_msgSend_idValue(v43, v45, v46);
                    objc_msgSend_score(v43, v48, v49);
                    v51 = (void *)objc_msgSend_initWithIDValue_score_(v44, v50, v47);
                    objc_msgSend_addObject_(v35, v52, (uint64_t)v51);

                  }
                  v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v53, (uint64_t)&v74, v98, 16);
                }
                while (v40);
              }

              v54 = [GDRankedEntityTagPersons alloc];
              v57 = objc_msgSend_gdTag(v34, v55, v56);
              v60 = objc_msgSend_inferenceEventIdValue(v34, v58, v59);
              v62 = (void *)objc_msgSend_initWithTag_scoredEntities_entityRelevanceInferenceEventId_(v54, v61, v57, v35, v60);
              objc_msgSend_setObject_forKeyedSubscript_(v71, v63, (uint64_t)v62, v72);

            }
            v70 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v32, (uint64_t)&v78, v99, 16);
          }
          while (v70);
        }

        goto LABEL_6;
      }
      if (a5)
      {
        v71 = 0;
        *a5 = objc_retainAutorelease((id)v87[5]);
        goto LABEL_6;
      }
    }
    v71 = 0;
LABEL_6:

    _Block_object_dispose(&v86, 8);
    _Block_object_dispose(&v92, 8);

    goto LABEL_9;
  }
  if (!a5)
  {
    v71 = 0;
    goto LABEL_10;
  }
  v65 = v8;
  v27 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v102 = *MEMORY[0x1E0CB2D50];
  v103[0] = CFSTR("Error when initializing EntityTaggingService.");
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v28, (uint64_t)v103, &v102, 1);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = 0;
  *a5 = (id)objc_msgSend_initWithDomain_code_userInfo_(v27, v29, (uint64_t)CFSTR("GDErrorDomain"), 1, v66);
LABEL_9:

  v9 = v65;
LABEL_10:

  return v71;
}

- (void)recordDirectFeedbackWithGradedTrue:(id)a3 gradedFalse:(id)a4 ignored:(id)a5 neverPresented:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  GDEntityTaggingServiceInner *inner;
  const char *v17;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1AE8EC310;
  v23 = sub_1AE8EC320;
  v24 = 0;
  inner = self->inner;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = sub_1AE8EC338;
  v18[3] = &unk_1E5DDA190;
  v18[4] = &v19;
  objc_msgSend_recordDirectFeedbackWithGradedTrue_gradedFalse_ignored_neverPresented_error_(inner, v17, (uint64_t)v12, v13, v14, v15, v18);
  if (a7)
    *a7 = objc_retainAutorelease((id)v20[5]);
  _Block_object_dispose(&v19, 8);

}

- (void)recordStatefulFeedback:(id)a3 error:(id *)a4
{
  id v6;
  GDEntityTaggingServiceInner *inner;
  const char *v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v6 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = sub_1AE8EC310;
  v14 = sub_1AE8EC320;
  v15 = 0;
  inner = self->inner;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1AE8EC328;
  v9[3] = &unk_1E5DDA190;
  v9[4] = &v10;
  objc_msgSend_recordStatefulFeedbackWithFeedback_error_(inner, v8, (uint64_t)v6, v9);
  if (a4)
    *a4 = objc_retainAutorelease((id)v11[5]);
  _Block_object_dispose(&v10, 8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->inner, 0);
}

@end
