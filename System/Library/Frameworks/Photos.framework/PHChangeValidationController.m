@implementation PHChangeValidationController

- (PHChangeValidationController)initWithInsertRequests:(id)a3 updateRequests:(id)a4 deleteRequests:(id)a5 context:(id)a6 photoLibrary:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  PHChangeValidationController *v17;
  void *v19;
  id v21;
  objc_super v22;

  v21 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)PHChangeValidationController;
  v17 = -[PHChangeValidationController init](&v22, sel_init);
  if (v17)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, v17, CFSTR("PHChangeValidationController.m"), 88, CFSTR("Must provide a managed object context"));

    }
    objc_storeStrong((id *)&v17->_insertRequests, a3);
    objc_storeStrong((id *)&v17->_updateRequests, a4);
    objc_storeStrong((id *)&v17->_deleteRequests, a5);
    objc_storeStrong((id *)&v17->_managedObjectContext, a6);
    objc_storeStrong((id *)&v17->_photoLibrary, a7);
  }

  return v17;
}

- (id)_prepare
{
  PHChangeValidationController *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id *v7;
  void *v8;
  id *v9;
  id *v10;
  id *v11;
  id *v12;
  void *v13;
  PHChangeValidationController *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  id *v20;
  char v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  int v39;
  void *v40;
  char v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  id v51;
  uint64_t v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  id v59;
  void *v60;
  BOOL v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  void *v70;
  PLPhotoLibrary *photoLibrary;
  NSString *v72;
  void *v73;
  uint64_t v74;
  NSArray *renderedContentURLs;
  NSArray *v76;
  NSArray *assetsToChangeContent;
  NSArray *v78;
  NSArray *assetsToRevert;
  NSArray *v80;
  NSArray *assetsToHide;
  NSArray *v82;
  NSArray *assetsToDelete;
  NSArray *v84;
  NSArray *albumsToDelete;
  NSArray *v86;
  NSArray *foldersToDelete;
  NSString *clientName;
  NSString *v89;
  void *v92;
  id v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  id v125;
  void *v126;
  void (**v127)(void *, void *);
  void *v128;
  _QWORD v129[4];
  id v130;
  id v131;
  id v132;
  id v133;
  PHChangeValidationController *v134;
  id v135;
  id v136;
  id v137;
  id v138;
  id v139;
  id v140;
  id v141;
  id v142;
  id v143;
  id v144;
  id v145;
  id v146;
  id v147;
  id v148;
  id v149;
  id v150;
  id v151;
  id v152;
  id v153;
  id v154;
  id v155;
  id v156;
  id v157;
  id v158;
  id v159;
  id v160;
  id v161;
  uint64_t *v162;
  uint64_t *v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  id v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  _QWORD aBlock[4];
  id v178;
  uint64_t *v179;
  uint64_t v180;
  uint64_t *v181;
  uint64_t v182;
  char v183;
  id v184;
  id v185;
  id v186;
  id v187;
  id obj;
  uint64_t v189;
  uint64_t *v190;
  uint64_t v191;
  uint64_t (*v192)(uint64_t, uint64_t);
  void (*v193)(uint64_t);
  id v194;
  uint64_t v195;
  uint64_t *v196;
  uint64_t v197;
  uint64_t (*v198)(uint64_t, uint64_t);
  void (*v199)(uint64_t);
  id v200;
  uint64_t v201;
  void *v202;
  uint64_t v203;
  void *v204;
  _BYTE v205[128];
  _BYTE v206[128];
  _BYTE v207[128];
  uint64_t v208;

  v2 = self;
  v208 = *MEMORY[0x1E0C80C00];
  if (self->_didPrepare)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = self;
    objc_msgSend(v92, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHChangeValidationController.m"), 100, CFSTR("_prepare can only be called once"));

  }
  v2->_didPrepare = 1;
  v195 = 0;
  v196 = &v195;
  v197 = 0x3032000000;
  v198 = __Block_byref_object_copy__1949;
  v199 = __Block_byref_object_dispose__1950;
  v3 = (void *)MEMORY[0x1E0D732B8];
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "successWithResult:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v200 = v5;
  v189 = 0;
  v190 = &v189;
  v191 = 0x3032000000;
  v192 = __Block_byref_object_copy__1949;
  v193 = __Block_byref_object_dispose__1950;
  v194 = 0;
  -[PHChangeValidationController managedObjectContext](self, "managedObjectContext");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHChangeValidationController photoLibrary](self, "photoLibrary");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v124 = (void *)objc_opt_new();
  v102 = (void *)objc_opt_new();
  v101 = (void *)objc_opt_new();
  v100 = (void *)objc_opt_new();
  v99 = (void *)objc_opt_new();
  v98 = (void *)objc_opt_new();
  v97 = (void *)objc_opt_new();
  v96 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0D71880], "entityName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id *)(v190 + 5);
  obj = (id)v190[5];
  PLSafeEntityForNameInManagedObjectContext();
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v7, obj);

  if (!v128)
  {
    -[PHChangeValidationController _failureWithError:](self, "_failureWithError:", v190[5]);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_130;
  }
  objc_msgSend(MEMORY[0x1E0D71778], "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id *)(v190 + 5);
  v187 = (id)v190[5];
  PLSafeEntityForNameInManagedObjectContext();
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v9, v187);

  v10 = (id *)(v190 + 5);
  if (!v110)
  {
    -[PHChangeValidationController _failureWithError:](self, "_failureWithError:", v190[5]);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_129;
  }
  v186 = (id)v190[5];
  PLSafeEntityForNameInManagedObjectContext();
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v10, v186);
  v11 = (id *)(v190 + 5);
  if (!v95)
  {
    -[PHChangeValidationController _failureWithError:](self, "_failureWithError:", v190[5]);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_128;
  }
  v185 = (id)v190[5];
  PLSafeEntityForNameInManagedObjectContext();
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v11, v185);
  v12 = (id *)(v190 + 5);
  if (!v111)
  {
    -[PHChangeValidationController _failureWithError:](self, "_failureWithError:", v190[5]);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_127;
  }
  v184 = (id)v190[5];
  PLSafeEntityForNameInManagedObjectContext();
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v12, v184);
  if (!v117)
  {
    -[PHChangeValidationController _failureWithError:](self, "_failureWithError:", v190[5]);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_126;
  }
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHChangeValidationController _simpleDeleteValidatorsWithManagedObjectContext:](self, "_simpleDeleteValidatorsWithManagedObjectContext:", v115);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v180 = 0;
  v181 = &v180;
  v182 = 0x2020000000;
  v183 = 0;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __40__PHChangeValidationController__prepare__block_invoke;
  aBlock[3] = &unk_1E35D6178;
  v179 = &v180;
  v93 = v13;
  v178 = v93;
  v127 = (void (**)(void *, void *))_Block_copy(aBlock);
  v14 = self;
  if (!objc_msgSend((id)v196[5], "isSuccess"))
    goto LABEL_31;
  v175 = 0u;
  v176 = 0u;
  v173 = 0u;
  v174 = 0u;
  -[PHChangeValidationController insertRequests](self, "insertRequests");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v173, v207, 16);
  if (!v16)
    goto LABEL_30;
  v17 = *(_QWORD *)v174;
  while (2)
  {
    for (i = 0; i != v16; ++i)
    {
      if (*(_QWORD *)v174 != v17)
        objc_enumerationMutation(v15);
      v19 = *(void **)(*((_QWORD *)&v173 + 1) + 8 * i);
      if ((objc_msgSend(v19, "conformsToProtocol:", &unk_1EE357B10) & 1) == 0)
      {
        objc_msgSend(v19, "clientName");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v23, "length"))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid PHInsertChangeRequest from client: %@"), v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          __WriteStackshot(v24);

        }
        else
        {
          __WriteStackshot(CFSTR("Invalid PHInsertChangeRequest"));
        }
        objc_msgSend(MEMORY[0x1E0CB35C8], "ph_genericErrorWithLocalizedDescription:", CFSTR("Invalid insert request"));
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = (void *)v190[5];
        v190[5] = v26;

        -[PHChangeValidationController _failureWithError:](self, "_failureWithError:", v190[5]);
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = (void *)v196[5];
        v196[5] = v28;

        goto LABEL_29;
      }
      v20 = (id *)(v190 + 5);
      v172 = (id)v190[5];
      v21 = objc_msgSend(v19, "validateInsertIntoPhotoLibrary:error:", v105, &v172);
      objc_storeStrong(v20, v172);
      if ((v21 & 1) == 0)
      {
        -[PHChangeValidationController _failureWithError:](self, "_failureWithError:", v190[5]);
        v25 = objc_claimAutoreleasedReturnValue();
        v23 = (void *)v196[5];
        v196[5] = v25;
LABEL_29:

        goto LABEL_30;
      }
    }
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v173, v207, 16);
    if (v16)
      continue;
    break;
  }
LABEL_30:

  v14 = self;
LABEL_31:
  if (!objc_msgSend((id)v196[5], "isSuccess"))
    goto LABEL_60;
  v170 = 0u;
  v171 = 0u;
  v168 = 0u;
  v169 = 0u;
  -[PHChangeValidationController updateRequests](v14, "updateRequests");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v168, v206, 16);
  if (!v31)
    goto LABEL_59;
  v32 = *(_QWORD *)v169;
  v125 = v30;
  while (2)
  {
    v33 = 0;
    while (2)
    {
      if (*(_QWORD *)v169 != v32)
        objc_enumerationMutation(v125);
      v34 = *(void **)(*((_QWORD *)&v168 + 1) + 8 * v33);
      objc_msgSend(v34, "objectID");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "entity");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v36, "isKindOfEntity:", v128)
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v37 = v34;
        objc_msgSend(v37, "contentEditingOutput");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v37, "isHiding");
        if (v39)
          objc_msgSend(v120, "addObject:", v35);
        if (objc_msgSend(v37, "isRevertingContentToOriginal"))
        {
          objc_msgSend(v119, "addObject:", v35);
          v40 = v123;
          if (!v38)
            goto LABEL_54;
LABEL_53:
          objc_msgSend(v40, "addObject:", v35);
          goto LABEL_54;
        }
        if (v38)
          v41 = 0;
        else
          v41 = v39;
        if (v38)
          v40 = v123;
        else
          v40 = v118;
        if ((v41 & 1) == 0)
          goto LABEL_53;
LABEL_54:

      }
      else if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v124, "addObject:", v35);
      }
      if (v35)
        objc_msgSend(v126, "setObject:forKey:", v34, v35);
      v127[2](v127, v34);

      if (v31 != ++v33)
        continue;
      break;
    }
    v30 = v125;
    v31 = objc_msgSend(v125, "countByEnumeratingWithState:objects:count:", &v168, v206, 16);
    if (v31)
      continue;
    break;
  }
LABEL_59:

  v14 = self;
LABEL_60:
  if (!objc_msgSend((id)v196[5], "isSuccess"))
    goto LABEL_120;
  v166 = 0u;
  v167 = 0u;
  v164 = 0u;
  v165 = 0u;
  -[PHChangeValidationController deleteRequests](v14, "deleteRequests");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v164, v205, 16);
  if (!v43)
    goto LABEL_119;
  v44 = *(_QWORD *)v165;
  while (2)
  {
    v45 = 0;
    while (2)
    {
      if (*(_QWORD *)v165 != v44)
        objc_enumerationMutation(v42);
      v46 = *(void **)(*((_QWORD *)&v164 + 1) + 8 * v45);
      objc_msgSend(v46, "objectID");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "entity");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v48, "isKindOfEntity:", v128))
      {
        if (objc_msgSend(v48, "isKindOfEntity:", v117))
        {
          objc_opt_class();
          v54 = v46;
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v55 = v54;
          else
            v55 = 0;
          v51 = v55;

          v56 = v122;
          if (v51)
          {
            if (objc_msgSend(v51, "operation") == 2)
              v56 = v112;
            else
              v56 = v122;
          }
        }
        else if (objc_msgSend(v48, "isKindOfEntity:", v111))
        {
          objc_opt_class();
          v57 = v46;
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v58 = v57;
          else
            v58 = 0;
          v51 = v58;

          v56 = v114;
          if (v51)
          {
            if (objc_msgSend(v51, "operation") == 2)
              v56 = v108;
            else
              v56 = v114;
          }
        }
        else
        {
          if (!objc_msgSend(v48, "isKindOfEntity:", v110))
          {
            if (!-[PHChangeValidationController _recordObjectID:withSimpleDeleteValidators:](self, "_recordObjectID:withSimpleDeleteValidators:", v47, v94))
            {
              v64 = (void *)MEMORY[0x1E0CB35C8];
              if (v47)
              {
                v203 = *MEMORY[0x1E0CB2D50];
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown type %@"), v47);
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                v204 = v65;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v204, &v203, 1);
              }
              else
              {
                v201 = *MEMORY[0x1E0CB2D50];
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown type"));
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                v202 = v65;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v202, &v201, 1);
              }
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v64, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, v66);
              v67 = objc_claimAutoreleasedReturnValue();
              v68 = (void *)v190[5];
              v190[5] = v67;

              -[PHChangeValidationController _failureWithError:](self, "_failureWithError:", v190[5]);
              v69 = objc_claimAutoreleasedReturnValue();
              v70 = (void *)v196[5];
              v196[5] = v69;

              goto LABEL_119;
            }
            goto LABEL_110;
          }
          objc_opt_class();
          v59 = v46;
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v60 = v59;
          else
            v60 = 0;
          v51 = v60;

          if (v51 && objc_msgSend(v51, "operation") == 2)
          {
            v61 = objc_msgSend(v48, "isKindOfEntity:", v95) == 0;
            v63 = v103;
            v62 = v104;
          }
          else
          {
            v61 = objc_msgSend(v48, "isKindOfEntity:", v95) == 0;
            v63 = v106;
            v62 = v107;
          }
          if (v61)
            v56 = v62;
          else
            v56 = v63;
        }
        objc_msgSend(v56, "addObject:", v47);
        goto LABEL_109;
      }
      objc_opt_class();
      v49 = v46;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v50 = v49;
      else
        v50 = 0;
      v51 = v50;

      if (v51)
      {
        v52 = objc_msgSend(v51, "operation");
        v53 = v121;
        if (v52)
        {
          if (v52 == 1)
          {
            objc_msgSend(v121, "addObject:", v47);
            v53 = v109;
          }
          else
          {
            v53 = v113;
            if (v52 != 2)
              goto LABEL_109;
          }
        }
        objc_msgSend(v53, "addObject:", v47);
      }
LABEL_109:

LABEL_110:
      if (v47)
        objc_msgSend(v126, "setObject:forKey:", v46, v47);
      v127[2](v127, v46);

      if (v43 != ++v45)
        continue;
      break;
    }
    v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v164, v205, 16);
    if (v43)
      continue;
    break;
  }
LABEL_119:

  v14 = self;
LABEL_120:
  if (objc_msgSend((id)v196[5], "isSuccess"))
  {
    photoLibrary = v14->_photoLibrary;
    v129[0] = MEMORY[0x1E0C809B0];
    v129[1] = 3221225472;
    v129[2] = __40__PHChangeValidationController__prepare__block_invoke_2;
    v129[3] = &unk_1E35D61A0;
    v162 = &v195;
    v130 = v123;
    v131 = v128;
    v132 = v115;
    v133 = v126;
    v134 = v14;
    v163 = &v189;
    v135 = v101;
    v136 = v102;
    v137 = v119;
    v138 = v100;
    v139 = v120;
    v140 = v99;
    v141 = v118;
    v142 = v113;
    v143 = v121;
    v144 = v98;
    v145 = v109;
    v146 = v108;
    v147 = v111;
    v148 = v114;
    v149 = v96;
    v150 = v104;
    v151 = v110;
    v152 = v107;
    v153 = v97;
    v154 = v103;
    v155 = v95;
    v156 = v106;
    v157 = v122;
    v158 = v117;
    v159 = v112;
    v160 = v124;
    v161 = v94;
    -[PLPhotoLibrary performBlockAndWait:](photoLibrary, "performBlockAndWait:", v129);

    v14 = self;
  }
  if (objc_msgSend(v93, "count") == 1)
  {
    objc_msgSend(v93, "anyObject");
    v72 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v93, "allObjects");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "componentsJoinedByString:", CFSTR(", "));
    v72 = (NSString *)objc_claimAutoreleasedReturnValue();

    v14 = self;
  }
  v74 = objc_msgSend(v102, "copy");
  renderedContentURLs = v14->_renderedContentURLs;
  v14->_renderedContentURLs = (NSArray *)v74;

  v76 = (NSArray *)objc_msgSend(v101, "copy");
  assetsToChangeContent = self->_assetsToChangeContent;
  self->_assetsToChangeContent = v76;

  v78 = (NSArray *)objc_msgSend(v100, "copy");
  assetsToRevert = self->_assetsToRevert;
  self->_assetsToRevert = v78;

  v80 = (NSArray *)objc_msgSend(v99, "copy");
  assetsToHide = self->_assetsToHide;
  self->_assetsToHide = v80;

  v82 = (NSArray *)objc_msgSend(v98, "copy");
  assetsToDelete = self->_assetsToDelete;
  self->_assetsToDelete = v82;

  v84 = (NSArray *)objc_msgSend(v97, "copy");
  albumsToDelete = self->_albumsToDelete;
  self->_albumsToDelete = v84;

  v86 = (NSArray *)objc_msgSend(v96, "copy");
  foldersToDelete = self->_foldersToDelete;
  self->_foldersToDelete = v86;

  clientName = self->_clientName;
  self->_clientName = v72;
  v89 = v72;

  self->_confirmationRequired = *((_BYTE *)v181 + 24);
  v22 = (id)v196[5];

  _Block_object_dispose(&v180, 8);
LABEL_126:

LABEL_127:
LABEL_128:

LABEL_129:
LABEL_130:

  _Block_object_dispose(&v189, 8);
  _Block_object_dispose(&v195, 8);

  return v22;
}

- (id)_simpleDeleteValidatorsWithManagedObjectContext:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = a3;
  pl_dispatch_once();
  v4 = (void *)_simpleDeleteValidatorsWithManagedObjectContext__pl_once_object_16;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __80__PHChangeValidationController__simpleDeleteValidatorsWithManagedObjectContext___block_invoke_2;
  v9[3] = &unk_1E35D61E8;
  v10 = v3;
  v5 = v3;
  v6 = v4;
  objc_msgSend(v6, "_pl_map:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)_recordObjectID:(id)a3 withSimpleDeleteValidators:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = a4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v9)
        objc_enumerationMutation(v6);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10), "recordObjectID:", v5, (_QWORD)v12) & 1) != 0)
        break;
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_11;
      }
    }
  }
  LOBYTE(v8) = 1;
LABEL_11:

  return v8;
}

- (id)_validateSimpleDeletionsWithValidators:(id)a3 requestsByObjectID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  char v17;
  id v18;
  void *v19;
  uint64_t v20;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0D732B8];
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "successWithResult:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v11 = v6;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v24 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v22 = 0;
        v17 = objc_msgSend(v16, "validateForDeleteWithRequestsByObjectID:error:", v7, &v22);
        v18 = v22;
        v19 = v18;
        if ((v17 & 1) == 0)
        {
          -[PHChangeValidationController _failureWithError:](self, "_failureWithError:", v18);
          v20 = objc_claimAutoreleasedReturnValue();

          v10 = (void *)v20;
          goto LABEL_11;
        }

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v13)
        continue;
      break;
    }
  }
LABEL_11:

  return v10;
}

- (id)validate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  PLPhotoLibrary *photoLibrary;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  __int128 v38;
  uint64_t v39;
  _QWORD v40[5];
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  uint64_t *v48;
  uint64_t *v49;
  uint64_t *v50;
  uint64_t *v51;
  uint64_t *v52;
  uint64_t *v53;
  uint64_t *v54;
  uint64_t *v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t);
  id v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t (*v70)(uint64_t, uint64_t);
  void (*v71)(uint64_t);
  id v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t (*v76)(uint64_t, uint64_t);
  void (*v77)(uint64_t);
  id v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t (*v82)(uint64_t, uint64_t);
  void (*v83)(uint64_t);
  id v84;
  uint64_t v85;
  uint64_t *v86;
  uint64_t v87;
  uint64_t (*v88)(uint64_t, uint64_t);
  void (*v89)(uint64_t);
  id v90;
  uint64_t v91;
  uint64_t *v92;
  uint64_t v93;
  uint64_t (*v94)(uint64_t, uint64_t);
  void (*v95)(uint64_t);
  id v96;
  uint64_t v97;
  uint64_t *v98;
  uint64_t v99;
  uint64_t (*v100)(uint64_t, uint64_t);
  void (*v101)(uint64_t);
  id v102;
  uint64_t v103;
  uint64_t *v104;
  uint64_t v105;
  uint64_t (*v106)(uint64_t, uint64_t);
  void (*v107)(uint64_t);
  id v108;
  uint64_t v109;
  uint64_t *v110;
  uint64_t v111;
  uint64_t (*v112)(uint64_t, uint64_t);
  void (*v113)(uint64_t);
  id v114;
  uint64_t v115;
  _QWORD v116[3];

  v116[1] = *MEMORY[0x1E0C80C00];
  -[PHChangeValidationController _prepare](self, "_prepare");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isSuccess")
    && -[PHChangeValidationController confirmationRequired](self, "confirmationRequired"))
  {
    -[PHChangeValidationController assetsToHide](self, "assetsToHide");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHChangeValidationController assetsToDelete](self, "assetsToDelete");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHChangeValidationController albumsToDelete](self, "albumsToDelete");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHChangeValidationController foldersToDelete](self, "foldersToDelete");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v4, "count");
    v39 = objc_msgSend(v5, "count");
    *((_QWORD *)&v38 + 1) = objc_msgSend(v6, "count");
    *(_QWORD *)&v38 = objc_msgSend(v7, "count");
    -[PHChangeValidationController clientName](self, "clientName");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v39);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = 0;
    v110 = &v109;
    v111 = 0x3032000000;
    v112 = __Block_byref_object_copy__1949;
    v113 = __Block_byref_object_dispose__1950;
    v114 = 0;
    v103 = 0;
    v104 = &v103;
    v105 = 0x3032000000;
    v106 = __Block_byref_object_copy__1949;
    v107 = __Block_byref_object_dispose__1950;
    v108 = 0;
    v97 = 0;
    v98 = &v97;
    v99 = 0x3032000000;
    v100 = __Block_byref_object_copy__1949;
    v101 = __Block_byref_object_dispose__1950;
    v102 = 0;
    v90 = 0;
    v91 = 0;
    v92 = &v91;
    v93 = 0x3032000000;
    v94 = __Block_byref_object_copy__1949;
    v95 = __Block_byref_object_dispose__1950;
    v96 = 0;
    v85 = 0;
    v86 = &v85;
    v87 = 0x3032000000;
    v88 = __Block_byref_object_copy__1949;
    v89 = __Block_byref_object_dispose__1950;
    v79 = 0;
    v80 = &v79;
    v81 = 0x3032000000;
    v82 = __Block_byref_object_copy__1949;
    v83 = __Block_byref_object_dispose__1950;
    v84 = 0;
    v73 = 0;
    v74 = &v73;
    v75 = 0x3032000000;
    v76 = __Block_byref_object_copy__1949;
    v77 = __Block_byref_object_dispose__1950;
    v78 = 0;
    v67 = 0;
    v68 = &v67;
    v69 = 0x3032000000;
    v70 = __Block_byref_object_copy__1949;
    v71 = __Block_byref_object_dispose__1950;
    v72 = 0;
    v61 = 0;
    v62 = &v61;
    v63 = 0x3032000000;
    v64 = __Block_byref_object_copy__1949;
    v65 = __Block_byref_object_dispose__1950;
    v66 = 0;
    photoLibrary = self->_photoLibrary;
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __40__PHChangeValidationController_validate__block_invoke;
    v40[3] = &unk_1E35D6210;
    v40[4] = self;
    v31 = v4;
    v41 = v31;
    v57 = v8;
    v11 = v9;
    v42 = v11;
    v48 = &v109;
    v49 = &v103;
    v50 = &v97;
    v37 = v36;
    v43 = v37;
    v32 = v5;
    v44 = v32;
    v12 = v34;
    v45 = v12;
    v51 = &v91;
    v52 = &v85;
    v53 = &v79;
    v59 = *((_QWORD *)&v38 + 1);
    v60 = v38;
    v54 = &v73;
    v55 = &v67;
    v58 = v39;
    v56 = &v61;
    v13 = v6;
    v46 = v13;
    v14 = v7;
    v47 = v14;
    -[PLPhotoLibrary performBlockAndWait:](photoLibrary, "performBlockAndWait:", v40);
    v35 = v13;
    if (!v8 && !v39 && v38 == 0)
    {
      v15 = v11;
LABEL_20:

      _Block_object_dispose(&v61, 8);
      _Block_object_dispose(&v67, 8);

      _Block_object_dispose(&v73, 8);
      _Block_object_dispose(&v79, 8);

      _Block_object_dispose(&v85, 8);
      _Block_object_dispose(&v91, 8);

      _Block_object_dispose(&v97, 8);
      _Block_object_dispose(&v103, 8);

      _Block_object_dispose(&v109, 8);
      return v3;
    }
    objc_opt_class();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v16);
    PLServicesLocalizedFrameworkString();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v11;
    if (v8)
      v17 = -[PHChangeValidationController promptForUserConfirmationWithTitle:message:defaultButtonTitle:alternateButtonTitle:previewAssetLocalIdentifiers:](self, "promptForUserConfirmationWithTitle:message:defaultButtonTitle:alternateButtonTitle:previewAssetLocalIdentifiers:", v110[5], v104[5], v98[5], v33, v11, v31, v32);
    else
      v17 = 1;
    if (v17 && v38 != 0)
    {
      v18 = v74[5];
      v19 = v68[5];
      v20 = v62[5];
      PLServicesLocalizedFrameworkString();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[PHChangeValidationController promptForUserConfirmationWithTitle:message:defaultButtonTitle:alternateButtonTitle:](self, "promptForUserConfirmationWithTitle:message:defaultButtonTitle:alternateButtonTitle:", v18, v19, v20, v21);

    }
    if (v17 && v39)
    {
      v22 = v92[5];
      v23 = v86[5];
      v24 = v80[5];
      PLServicesLocalizedFrameworkString();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v22) = -[PHChangeValidationController promptForUserConfirmationWithTitle:message:defaultButtonTitle:alternateButtonTitle:previewAssetLocalIdentifiers:](self, "promptForUserConfirmationWithTitle:message:defaultButtonTitle:alternateButtonTitle:previewAssetLocalIdentifiers:", v22, v23, v24, v25, v12);

      if ((v22 & 1) != 0)
        goto LABEL_19;
    }
    else if (v17)
    {
LABEL_19:

      objc_sync_exit(v16);
      goto LABEL_20;
    }
    v26 = (void *)MEMORY[0x1E0CB35C8];
    v115 = *MEMORY[0x1E0CB2D50];
    v116[0] = CFSTR("Change request denied by user");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v116, &v115, 1, v31);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3072, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    -[PHChangeValidationController _failureWithError:](self, "_failureWithError:", v28);
    v29 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v29;
    goto LABEL_19;
  }
  return v3;
}

- (id)_failureWithError:(id)a3
{
  return +[PHChangeRequest sanitizedFailureWithError:](PHChangeRequest, "sanitizedFailureWithError:", a3);
}

- (BOOL)promptForUserConfirmationWithTitle:(id)a3 message:(id)a4 defaultButtonTitle:(id)a5 alternateButtonTitle:(id)a6
{
  return -[PHChangeValidationController _promptForUserConfirmationWithTitle:message:defaultButtonTitle:alternateButtonTitle:extensionItem:](self, "_promptForUserConfirmationWithTitle:message:defaultButtonTitle:alternateButtonTitle:extensionItem:", a3, a4, a5, a6, 0);
}

- (BOOL)promptForUserConfirmationWithTitle:(id)a3 message:(id)a4 defaultButtonTitle:(id)a5 alternateButtonTitle:(id)a6 previewAssetLocalIdentifiers:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  objc_class *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  BOOL v26;
  void *v28;
  PHChangeValidationController *v29;
  _QWORD v30[3];
  _QWORD v31[4];

  v31[3] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (a7)
  {
    v16 = (objc_class *)MEMORY[0x1E0CB35E8];
    v17 = a7;
    a7 = objc_alloc_init(v16);
    v30[0] = CFSTR("previewStyle");
    v30[1] = CFSTR("assetLocalIdentifiers");
    v31[0] = CFSTR("currentAssets");
    v31[1] = v17;
    v30[2] = CFSTR("photoLibraryURLString");
    -[PHChangeValidationController photoLibrary](self, "photoLibrary");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "pathManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "libraryURL");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "absoluteString");
    v29 = self;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v31[2] = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 3);
    v21 = v15;
    v22 = v14;
    v23 = v13;
    v24 = v12;
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a7, "setUserInfo:", v25);
    v12 = v24;
    v13 = v23;
    v14 = v22;
    v15 = v21;

    self = v29;
  }
  v26 = -[PHChangeValidationController _promptForUserConfirmationWithTitle:message:defaultButtonTitle:alternateButtonTitle:extensionItem:](self, "_promptForUserConfirmationWithTitle:message:defaultButtonTitle:alternateButtonTitle:extensionItem:", v12, v13, v14, v15, a7);

  return v26;
}

- (BOOL)_promptForUserConfirmationWithTitle:(id)a3 message:(id)a4 defaultButtonTitle:(id)a5 alternateButtonTitle:(id)a6 extensionItem:(id)a7
{
  __CFString *v11;
  __CFString *v12;
  id v13;
  id v14;
  id v15;
  const __CFString *v16;
  uint64_t v17;
  const __CFString *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  __CFUserNotification *v29;
  __CFUserNotification *v30;
  BOOL v31;
  _BYTE v33[12];
  id v34;
  _QWORD v35[7];
  _QWORD v36[8];

  v36[7] = *MEMORY[0x1E0C80C00];
  v11 = (__CFString *)a3;
  v12 = (__CFString *)a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (v11)
    v16 = v11;
  else
    v16 = &stru_1E35DFFF8;
  v17 = *MEMORY[0x1E0C9B810];
  v35[0] = *MEMORY[0x1E0C9B800];
  v35[1] = v17;
  if (v12)
    v18 = v12;
  else
    v18 = &stru_1E35DFFF8;
  v36[0] = v16;
  v36[1] = v18;
  v19 = *MEMORY[0x1E0C9B830];
  v35[2] = *MEMORY[0x1E0C9B838];
  v35[3] = v19;
  v36[2] = v13;
  v36[3] = v14;
  v20 = *MEMORY[0x1E0DABB98];
  v35[4] = *MEMORY[0x1E0C9B820];
  v35[5] = v20;
  v36[4] = MEMORY[0x1E0C9AAB0];
  v36[5] = MEMORY[0x1E0C9AAB0];
  v35[6] = *MEMORY[0x1E0DABBB0];
  v36[6] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 7);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v15)
  {
    v23 = (void *)objc_msgSend(v21, "mutableCopy");
    objc_msgSend(v23, "setObject:forKeyedSubscript:", CFSTR("com.apple.mobileslideshow.DestructiveChangeConfirmation"), *MEMORY[0x1E0DABBB8]);
    v24 = (void *)MEMORY[0x1E0CB36F8];
    v34 = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "archivedDataWithRootObject:requiringSecureCoding:error:", v25, 1, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v26, *MEMORY[0x1E0DABBC0]);

    v27 = objc_msgSend(v23, "copy");
    v22 = (void *)v27;
  }
  PLBackendGetLog();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v33 = 138412290;
    *(_QWORD *)&v33[4] = v22;
    _os_log_impl(&dword_1991EC000, v28, OS_LOG_TYPE_INFO, "Prompting for user confirmation %@", v33, 0xCu);
  }

  v29 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0.0, 0, 0, (CFDictionaryRef)v22);
  if (v29)
  {
    v30 = v29;
    *(_QWORD *)v33 = 0;
    CFUserNotificationReceiveResponse(v29, 0.0, (CFOptionFlags *)v33);
    v31 = (v33[0] & 3) == 0;
    CFRelease(v30);
  }
  else
  {
    v31 = 0;
  }

  return v31;
}

- (NSOrderedSet)insertRequests
{
  return self->_insertRequests;
}

- (NSOrderedSet)updateRequests
{
  return self->_updateRequests;
}

- (NSOrderedSet)deleteRequests
{
  return self->_deleteRequests;
}

- (NSManagedObjectContext)managedObjectContext
{
  return self->_managedObjectContext;
}

- (PLPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (NSArray)renderedContentURLs
{
  return self->_renderedContentURLs;
}

- (NSArray)assetsToChangeContent
{
  return self->_assetsToChangeContent;
}

- (NSArray)assetsToRevert
{
  return self->_assetsToRevert;
}

- (NSArray)assetsToHide
{
  return self->_assetsToHide;
}

- (NSArray)assetsToDelete
{
  return self->_assetsToDelete;
}

- (NSArray)albumsToDelete
{
  return self->_albumsToDelete;
}

- (NSArray)foldersToDelete
{
  return self->_foldersToDelete;
}

- (NSString)clientName
{
  return self->_clientName;
}

- (BOOL)confirmationRequired
{
  return self->_confirmationRequired;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientName, 0);
  objc_storeStrong((id *)&self->_foldersToDelete, 0);
  objc_storeStrong((id *)&self->_albumsToDelete, 0);
  objc_storeStrong((id *)&self->_assetsToDelete, 0);
  objc_storeStrong((id *)&self->_assetsToHide, 0);
  objc_storeStrong((id *)&self->_assetsToRevert, 0);
  objc_storeStrong((id *)&self->_assetsToChangeContent, 0);
  objc_storeStrong((id *)&self->_renderedContentURLs, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
  objc_storeStrong((id *)&self->_deleteRequests, 0);
  objc_storeStrong((id *)&self->_updateRequests, 0);
  objc_storeStrong((id *)&self->_insertRequests, 0);
}

void __40__PHChangeValidationController_validate__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  id v39;
  id v40;
  id obj;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D71BE0]), "initWithPhotoLibrary:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v3 = *(id *)(a1 + 40);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v43;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v43 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * v7), "uuid");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        +[PHObject localIdentifierWithUUID:](PHAsset, "localIdentifierWithUUID:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 48), "addObject:", v9);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    }
    while (v5);
  }

  if (*(_QWORD *)(a1 + 168))
  {
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
    v11 = *(void **)(v10 + 40);
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
    v40 = *(id *)(v12 + 40);
    obj = v11;
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 112) + 8);
    v39 = *(id *)(v13 + 40);
    objc_msgSend(v2, "getWarningTitle:message:buttonTitle:forAssets:operation:clientName:", &obj, &v40, &v39, *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 56));
    objc_storeStrong((id *)(v10 + 40), obj);
    objc_storeStrong((id *)(v12 + 40), v40);
    objc_storeStrong((id *)(v13 + 40), v39);
  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v14 = *(id *)(a1 + 64);
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v46, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v36;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v36 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v18), "uuid");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        +[PHObject localIdentifierWithUUID:](PHAsset, "localIdentifierWithUUID:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 72), "addObject:", v20);
        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v46, 16);
    }
    while (v16);
  }

  if (*(_QWORD *)(a1 + 176))
  {
    v21 = *(_QWORD *)(*(_QWORD *)(a1 + 120) + 8);
    v22 = *(void **)(v21 + 40);
    v23 = *(_QWORD *)(*(_QWORD *)(a1 + 128) + 8);
    v33 = *(id *)(v23 + 40);
    v34 = v22;
    v24 = *(_QWORD *)(*(_QWORD *)(a1 + 136) + 8);
    v32 = *(id *)(v24 + 40);
    objc_msgSend(v2, "getDeletionWarningTitle:message:buttonTitle:forAssets:syndicationAssetCount:clientName:style:", &v34, &v33, &v32, *(_QWORD *)(a1 + 64), 0, *(_QWORD *)(a1 + 56), 1);
    objc_storeStrong((id *)(v21 + 40), v34);
    objc_storeStrong((id *)(v23 + 40), v33);
    objc_storeStrong((id *)(v24 + 40), v32);
  }
  if (*(_QWORD *)(a1 + 184) || *(_QWORD *)(a1 + 192))
  {
    v25 = *(_QWORD *)(*(_QWORD *)(a1 + 144) + 8);
    v26 = *(void **)(v25 + 40);
    v27 = *(_QWORD *)(*(_QWORD *)(a1 + 152) + 8);
    v30 = *(id *)(v27 + 40);
    v31 = v26;
    v28 = *(_QWORD *)(*(_QWORD *)(a1 + 160) + 8);
    v29 = *(id *)(v28 + 40);
    objc_msgSend(v2, "getDeletionWarningTitle:message:buttonTitle:forAlbums:folders:clientName:style:", &v31, &v30, &v29, *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 56), 1);
    objc_storeStrong((id *)(v25 + 40), v31);
    objc_storeStrong((id *)(v27 + 40), v30);
    objc_storeStrong((id *)(v28 + 40), v29);
  }

}

PHObjectDeleteValidator *__80__PHChangeValidationController__simpleDeleteValidatorsWithManagedObjectContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  PHObjectDeleteValidator *v4;

  v3 = a2;
  v4 = -[PHObjectDeleteValidator initWithEntityName:managedObjectContext:]([PHObjectDeleteValidator alloc], "initWithEntityName:managedObjectContext:", v3, *(_QWORD *)(a1 + 32));

  return v4;
}

void __80__PHChangeValidationController__simpleDeleteValidatorsWithManagedObjectContext___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(&unk_1E36570C0, "copy");
  v1 = (void *)_simpleDeleteValidatorsWithManagedObjectContext__pl_once_object_16;
  _simpleDeleteValidatorsWithManagedObjectContext__pl_once_object_16 = v0;

}

void __40__PHChangeValidationController__prepare__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  char v4;
  void *v5;
  id v6;

  v3 = a2;
  objc_msgSend(v3, "clientName");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isClientEntitled");

  if ((v4 & 1) == 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  v5 = v6;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
    v5 = v6;
  }

}

void __40__PHChangeValidationController__prepare__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  int v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t k;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  int v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t m;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  char v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  id v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t n;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  uint64_t v100;
  char v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  id v112;
  uint64_t v113;
  void *v114;
  uint64_t v115;
  unint64_t v116;
  uint64_t v117;
  uint64_t ii;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  uint64_t v123;
  int v124;
  void *v125;
  void *v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  uint64_t v130;
  uint64_t v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  uint64_t v139;
  uint64_t v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  id v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t jj;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  uint64_t v154;
  char v155;
  uint64_t v156;
  uint64_t v157;
  void *v158;
  uint64_t v159;
  uint64_t v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  id v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t kk;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  uint64_t v175;
  int v176;
  uint64_t v177;
  uint64_t v178;
  void *v179;
  uint64_t v180;
  uint64_t v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  id v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t mm;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  uint64_t v196;
  char v197;
  uint64_t v198;
  uint64_t v199;
  void *v200;
  uint64_t v201;
  uint64_t v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  id v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t nn;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  uint64_t v217;
  int v218;
  uint64_t v219;
  uint64_t v220;
  void *v221;
  uint64_t v222;
  uint64_t v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  id v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t i1;
  void *v234;
  void *v235;
  void *v236;
  void *v237;
  uint64_t v238;
  char v239;
  uint64_t v240;
  uint64_t v241;
  void *v242;
  uint64_t v243;
  uint64_t v244;
  void *v245;
  void *v246;
  void *v247;
  void *v248;
  void *v249;
  id v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t i2;
  void *v255;
  void *v256;
  void *v257;
  void *v258;
  uint64_t v259;
  int v260;
  uint64_t v261;
  uint64_t v262;
  void *v263;
  uint64_t v264;
  uint64_t v265;
  void *v266;
  void *v267;
  void *v268;
  void *v269;
  void *v270;
  id v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t v274;
  uint64_t i3;
  void *v276;
  void *v277;
  void *v278;
  void *v279;
  uint64_t v280;
  char v281;
  uint64_t v282;
  uint64_t v283;
  void *v284;
  uint64_t v285;
  uint64_t v286;
  void *v287;
  void *v288;
  void *v289;
  void *v290;
  void *v291;
  id v292;
  uint64_t v293;
  uint64_t v294;
  uint64_t v295;
  uint64_t i4;
  void *v297;
  void *v298;
  void *v299;
  void *v300;
  uint64_t v301;
  char v302;
  uint64_t v303;
  uint64_t v304;
  void *v305;
  uint64_t v306;
  uint64_t v307;
  void *v308;
  id v309;
  uint64_t i5;
  void *v311;
  void *v312;
  void *v313;
  void *v314;
  void *v315;
  void *v316;
  void *v317;
  void *v318;
  id v319;
  void *v320;
  void *v321;
  void *v322;
  uint64_t v323;
  char v324;
  int v325;
  void *v326;
  NSObject *v327;
  uint64_t v328;
  uint64_t v329;
  uint64_t v330;
  uint64_t v331;
  void *v332;
  void *v333;
  id v334;
  void *v335;
  uint64_t v336;
  uint64_t v337;
  void *v338;
  uint64_t v339;
  uint64_t v340;
  uint64_t v341;
  uint64_t v342;
  void *v343;
  uint64_t v344;
  void *v345;
  uint64_t v346;
  uint64_t v347;
  void *v348;
  uint64_t v349;
  id v350;
  id v351;
  __int128 v352;
  __int128 v353;
  __int128 v354;
  __int128 v355;
  id v356;
  __int128 v357;
  __int128 v358;
  __int128 v359;
  __int128 v360;
  id v361;
  __int128 v362;
  __int128 v363;
  __int128 v364;
  __int128 v365;
  id v366;
  __int128 v367;
  __int128 v368;
  __int128 v369;
  __int128 v370;
  id v371;
  __int128 v372;
  __int128 v373;
  __int128 v374;
  __int128 v375;
  id v376;
  __int128 v377;
  __int128 v378;
  __int128 v379;
  __int128 v380;
  id v381;
  __int128 v382;
  __int128 v383;
  __int128 v384;
  __int128 v385;
  id v386;
  __int128 v387;
  __int128 v388;
  __int128 v389;
  __int128 v390;
  id v391;
  __int128 v392;
  __int128 v393;
  __int128 v394;
  __int128 v395;
  id v396;
  __int128 v397;
  __int128 v398;
  __int128 v399;
  __int128 v400;
  id v401;
  __int128 v402;
  __int128 v403;
  __int128 v404;
  __int128 v405;
  id v406;
  __int128 v407;
  __int128 v408;
  __int128 v409;
  __int128 v410;
  id v411;
  __int128 v412;
  __int128 v413;
  __int128 v414;
  __int128 v415;
  id v416;
  __int128 v417;
  __int128 v418;
  __int128 v419;
  __int128 v420;
  id obj;
  __int128 v422;
  __int128 v423;
  __int128 v424;
  __int128 v425;
  uint8_t buf[4];
  id v427;
  uint64_t v428;
  void *v429;
  _BYTE v430[128];
  _BYTE v431[128];
  _BYTE v432[128];
  _BYTE v433[128];
  _BYTE v434[128];
  _BYTE v435[128];
  _BYTE v436[128];
  _BYTE v437[128];
  _BYTE v438[128];
  uint64_t v439;
  void *v440;
  _BYTE v441[128];
  _BYTE v442[128];
  _BYTE v443[128];
  _BYTE v444[128];
  _BYTE v445[128];
  _BYTE v446[128];
  uint64_t v447;

  v447 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 288) + 8) + 40), "isSuccess")
    && objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v2 = (void *)MEMORY[0x1E0C97B48];
    objc_msgSend(*(id *)(a1 + 40), "name");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self IN %@"), *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPredicate:", v5);

    objc_msgSend(*(id *)(a1 + 48), "executeFetchRequest:error:", v4, 0);
    v422 = 0u;
    v423 = 0u;
    v424 = 0u;
    v425 = 0u;
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v422, v446, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v423;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v423 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v422 + 1) + 8 * i);
          v12 = *(void **)(a1 + 56);
          objc_msgSend(v11, "objectID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKey:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
          {
            v15 = *(_QWORD *)(*(_QWORD *)(a1 + 296) + 8);
            obj = *(id *)(v15 + 40);
            v16 = objc_msgSend(v14, "validateMutationsToManagedObject:error:", v11, &obj);
            objc_storeStrong((id *)(v15 + 40), obj);
            if (!v16)
            {
              objc_msgSend(*(id *)(a1 + 64), "_failureWithError:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 296) + 8) + 40));
              v21 = objc_claimAutoreleasedReturnValue();
              v22 = *(_QWORD *)(*(_QWORD *)(a1 + 288) + 8);
              v23 = *(void **)(v22 + 40);
              *(_QWORD *)(v22 + 40) = v21;

              goto LABEL_18;
            }
            objc_msgSend(v14, "contentEditingOutput");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "renderedContentURL");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (v18)
            {
              objc_msgSend(*(id *)(a1 + 72), "addObject:", v11);
              objc_msgSend(*(id *)(a1 + 80), "addObject:", v18);
            }

          }
          else
          {
            objc_msgSend(*(id *)(a1 + 64), "_failureWithError:", 0);
            v19 = objc_claimAutoreleasedReturnValue();
            v20 = *(_QWORD *)(*(_QWORD *)(a1 + 288) + 8);
            v17 = *(void **)(v20 + 40);
            *(_QWORD *)(v20 + 40) = v19;
          }

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v422, v446, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_18:

  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 288) + 8) + 40), "isSuccess")
    && objc_msgSend(*(id *)(a1 + 88), "count"))
  {
    v24 = (void *)MEMORY[0x1E0C97B48];
    objc_msgSend(*(id *)(a1 + 40), "name");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "fetchRequestWithEntityName:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self IN %@"), *(_QWORD *)(a1 + 88));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setPredicate:", v27);

    objc_msgSend(*(id *)(a1 + 48), "executeFetchRequest:error:", v26, 0);
    v417 = 0u;
    v418 = 0u;
    v419 = 0u;
    v420 = 0u;
    v28 = (id)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v417, v445, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v418;
      while (2)
      {
        for (j = 0; j != v30; ++j)
        {
          if (*(_QWORD *)v418 != v31)
            objc_enumerationMutation(v28);
          v33 = *(void **)(*((_QWORD *)&v417 + 1) + 8 * j);
          v34 = *(void **)(a1 + 56);
          objc_msgSend(v33, "objectID");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "objectForKey:", v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          if (v36)
          {
            v37 = *(_QWORD *)(*(_QWORD *)(a1 + 296) + 8);
            v416 = *(id *)(v37 + 40);
            v38 = objc_msgSend(v36, "validateMutationsToManagedObject:error:", v33, &v416);
            objc_storeStrong((id *)(v37 + 40), v416);
            if (!v38)
            {
              objc_msgSend(*(id *)(a1 + 64), "_failureWithError:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 296) + 8) + 40));
              v42 = objc_claimAutoreleasedReturnValue();
              v43 = *(_QWORD *)(*(_QWORD *)(a1 + 288) + 8);
              v44 = *(void **)(v43 + 40);
              *(_QWORD *)(v43 + 40) = v42;

              goto LABEL_34;
            }
            objc_msgSend(*(id *)(a1 + 96), "addObject:", v33);
          }
          else
          {
            objc_msgSend(*(id *)(a1 + 64), "_failureWithError:", 0);
            v39 = objc_claimAutoreleasedReturnValue();
            v40 = *(_QWORD *)(*(_QWORD *)(a1 + 288) + 8);
            v41 = *(void **)(v40 + 40);
            *(_QWORD *)(v40 + 40) = v39;

          }
        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v417, v445, 16);
        if (v30)
          continue;
        break;
      }
    }
LABEL_34:

  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 288) + 8) + 40), "isSuccess")
    && objc_msgSend(*(id *)(a1 + 104), "count"))
  {
    v45 = (void *)MEMORY[0x1E0C97B48];
    objc_msgSend(*(id *)(a1 + 40), "name");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "fetchRequestWithEntityName:", v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self IN %@"), *(_QWORD *)(a1 + 104));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setPredicate:", v48);

    objc_msgSend(*(id *)(a1 + 48), "executeFetchRequest:error:", v47, 0);
    v412 = 0u;
    v413 = 0u;
    v414 = 0u;
    v415 = 0u;
    v49 = (id)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v412, v444, 16);
    if (v50)
    {
      v51 = v50;
      v52 = *(_QWORD *)v413;
      while (2)
      {
        for (k = 0; k != v51; ++k)
        {
          if (*(_QWORD *)v413 != v52)
            objc_enumerationMutation(v49);
          v54 = *(void **)(*((_QWORD *)&v412 + 1) + 8 * k);
          v55 = *(void **)(a1 + 56);
          objc_msgSend(v54, "objectID");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "objectForKey:", v56);
          v57 = (void *)objc_claimAutoreleasedReturnValue();

          if (v57)
          {
            v58 = *(_QWORD *)(*(_QWORD *)(a1 + 296) + 8);
            v411 = *(id *)(v58 + 40);
            v59 = objc_msgSend(v57, "validateMutationsToManagedObject:error:", v54, &v411);
            objc_storeStrong((id *)(v58 + 40), v411);
            if (!v59)
            {
              objc_msgSend(*(id *)(a1 + 64), "_failureWithError:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 296) + 8) + 40));
              v63 = objc_claimAutoreleasedReturnValue();
              v64 = *(_QWORD *)(*(_QWORD *)(a1 + 288) + 8);
              v65 = *(void **)(v64 + 40);
              *(_QWORD *)(v64 + 40) = v63;

              goto LABEL_50;
            }
            objc_msgSend(*(id *)(a1 + 112), "addObject:", v54);
          }
          else
          {
            objc_msgSend(*(id *)(a1 + 64), "_failureWithError:", 0);
            v60 = objc_claimAutoreleasedReturnValue();
            v61 = *(_QWORD *)(*(_QWORD *)(a1 + 288) + 8);
            v62 = *(void **)(v61 + 40);
            *(_QWORD *)(v61 + 40) = v60;

          }
        }
        v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v412, v444, 16);
        if (v51)
          continue;
        break;
      }
    }
LABEL_50:

  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 288) + 8) + 40), "isSuccess")
    && objc_msgSend(*(id *)(a1 + 120), "count"))
  {
    v66 = (void *)MEMORY[0x1E0C97B48];
    objc_msgSend(*(id *)(a1 + 40), "name");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "fetchRequestWithEntityName:", v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self IN %@"), *(_QWORD *)(a1 + 120));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "setPredicate:", v69);

    objc_msgSend(*(id *)(a1 + 48), "executeFetchRequest:error:", v68, 0);
    v407 = 0u;
    v408 = 0u;
    v409 = 0u;
    v410 = 0u;
    v70 = (id)objc_claimAutoreleasedReturnValue();
    v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v407, v443, 16);
    if (v71)
    {
      v72 = v71;
      v73 = *(_QWORD *)v408;
      do
      {
        for (m = 0; m != v72; ++m)
        {
          if (*(_QWORD *)v408 != v73)
            objc_enumerationMutation(v70);
          v75 = *(void **)(*((_QWORD *)&v407 + 1) + 8 * m);
          v76 = *(void **)(a1 + 56);
          objc_msgSend(v75, "objectID");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "objectForKey:", v77);
          v78 = (void *)objc_claimAutoreleasedReturnValue();

          if (v78)
          {
            v79 = *(_QWORD *)(*(_QWORD *)(a1 + 296) + 8);
            v406 = *(id *)(v79 + 40);
            v80 = objc_msgSend(v78, "validateMutationsToManagedObject:error:", v75, &v406);
            objc_storeStrong((id *)(v79 + 40), v406);
            if ((v80 & 1) == 0)
            {
              objc_msgSend(*(id *)(a1 + 64), "_failureWithError:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 296) + 8) + 40));
              v84 = objc_claimAutoreleasedReturnValue();
              v85 = *(_QWORD *)(*(_QWORD *)(a1 + 288) + 8);
              v86 = *(void **)(v85 + 40);
              *(_QWORD *)(v85 + 40) = v84;

              goto LABEL_64;
            }
          }
          else
          {
            objc_msgSend(*(id *)(a1 + 64), "_failureWithError:", 0);
            v81 = objc_claimAutoreleasedReturnValue();
            v82 = *(_QWORD *)(*(_QWORD *)(a1 + 288) + 8);
            v83 = *(void **)(v82 + 40);
            *(_QWORD *)(v82 + 40) = v81;

          }
        }
        v72 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v407, v443, 16);
      }
      while (v72);
    }
LABEL_64:

  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 288) + 8) + 40), "isSuccess")
    && objc_msgSend(*(id *)(a1 + 128), "count"))
  {
    v87 = (void *)MEMORY[0x1E0C97B48];
    objc_msgSend(*(id *)(a1 + 40), "name");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "fetchRequestWithEntityName:", v88);
    v89 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self IN %@"), *(_QWORD *)(a1 + 128));
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "setPredicate:", v90);

    objc_msgSend(*(id *)(a1 + 48), "executeFetchRequest:error:", v89, 0);
    v402 = 0u;
    v403 = 0u;
    v404 = 0u;
    v405 = 0u;
    v91 = (id)objc_claimAutoreleasedReturnValue();
    v92 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v402, v442, 16);
    if (v92)
    {
      v93 = v92;
      v94 = *(_QWORD *)v403;
      do
      {
        for (n = 0; n != v93; ++n)
        {
          if (*(_QWORD *)v403 != v94)
            objc_enumerationMutation(v91);
          v96 = *(void **)(*((_QWORD *)&v402 + 1) + 8 * n);
          v97 = *(void **)(a1 + 56);
          objc_msgSend(v96, "objectID");
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v97, "objectForKey:", v98);
          v99 = (void *)objc_claimAutoreleasedReturnValue();

          if (v99)
          {
            v100 = *(_QWORD *)(*(_QWORD *)(a1 + 296) + 8);
            v401 = *(id *)(v100 + 40);
            v101 = objc_msgSend(v99, "validateForDeleteManagedObject:error:", v96, &v401);
            objc_storeStrong((id *)(v100 + 40), v401);
            if ((v101 & 1) == 0)
            {
              objc_msgSend(*(id *)(a1 + 64), "_failureWithError:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 296) + 8) + 40));
              v105 = objc_claimAutoreleasedReturnValue();
              v106 = *(_QWORD *)(*(_QWORD *)(a1 + 288) + 8);
              v107 = *(void **)(v106 + 40);
              *(_QWORD *)(v106 + 40) = v105;

              goto LABEL_78;
            }
          }
          else
          {
            objc_msgSend(*(id *)(a1 + 64), "_failureWithError:", 0);
            v102 = objc_claimAutoreleasedReturnValue();
            v103 = *(_QWORD *)(*(_QWORD *)(a1 + 288) + 8);
            v104 = *(void **)(v103 + 40);
            *(_QWORD *)(v103 + 40) = v102;

          }
        }
        v93 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v402, v442, 16);
      }
      while (v93);
    }
LABEL_78:

  }
  if (!objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 288) + 8) + 40), "isSuccess")
    || !objc_msgSend(*(id *)(a1 + 136), "count"))
  {
    goto LABEL_98;
  }
  v108 = (void *)MEMORY[0x1E0C97B48];
  objc_msgSend(*(id *)(a1 + 40), "name");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "fetchRequestWithEntityName:", v109);
  v110 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self IN %@"), *(_QWORD *)(a1 + 136));
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "setPredicate:", v111);

  objc_msgSend(*(id *)(a1 + 48), "executeFetchRequest:error:", v110, 0);
  v397 = 0u;
  v398 = 0u;
  v399 = 0u;
  v400 = 0u;
  v112 = (id)objc_claimAutoreleasedReturnValue();
  v113 = objc_msgSend(v112, "countByEnumeratingWithState:objects:count:", &v397, v441, 16);
  v114 = v112;
  if (v113)
  {
    v115 = v113;
    v348 = v110;
    v116 = 0;
    v117 = *(_QWORD *)v398;
    while (2)
    {
      for (ii = 0; ii != v115; ++ii)
      {
        if (*(_QWORD *)v398 != v117)
          objc_enumerationMutation(v112);
        v119 = *(void **)(*((_QWORD *)&v397 + 1) + 8 * ii);
        v120 = *(void **)(a1 + 56);
        objc_msgSend(v119, "objectID");
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v120, "objectForKey:", v121);
        v122 = (void *)objc_claimAutoreleasedReturnValue();

        if (v122)
        {
          v123 = *(_QWORD *)(*(_QWORD *)(a1 + 296) + 8);
          v396 = *(id *)(v123 + 40);
          v124 = objc_msgSend(v122, "validateForDeleteManagedObject:error:", v119, &v396);
          objc_storeStrong((id *)(v123 + 40), v396);
          if (!v124)
          {
            objc_msgSend(*(id *)(a1 + 64), "_failureWithError:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 296) + 8) + 40));
            v130 = objc_claimAutoreleasedReturnValue();
            v131 = *(_QWORD *)(*(_QWORD *)(a1 + 288) + 8);
            v132 = *(void **)(v131 + 40);
            *(_QWORD *)(v131 + 40) = v130;

            goto LABEL_94;
          }
          objc_msgSend(*(id *)(a1 + 144), "addObject:", v119);
          v125 = *(void **)(a1 + 152);
          objc_msgSend(v119, "objectID");
          v126 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v125) = objc_msgSend(v125, "containsObject:", v126);

          v116 += v125;
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 64), "_failureWithError:", 0);
          v127 = objc_claimAutoreleasedReturnValue();
          v128 = *(_QWORD *)(*(_QWORD *)(a1 + 288) + 8);
          v129 = *(void **)(v128 + 40);
          *(_QWORD *)(v128 + 40) = v127;

        }
      }
      v115 = objc_msgSend(v112, "countByEnumeratingWithState:objects:count:", &v397, v441, 16);
      if (v115)
        continue;
      break;
    }
LABEL_94:

    v110 = v348;
    if (v116 < 0xC9)
      goto LABEL_97;
    v133 = (void *)MEMORY[0x1E0CB35C8];
    v439 = *MEMORY[0x1E0CB2938];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Expunging too may assets: %tu, limit %zd"), v116, 200);
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    v440 = v134;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v440, &v439, 1);
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v133, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, v135);
    v136 = objc_claimAutoreleasedReturnValue();
    v137 = *(_QWORD *)(*(_QWORD *)(a1 + 296) + 8);
    v138 = *(void **)(v137 + 40);
    *(_QWORD *)(v137 + 40) = v136;

    objc_msgSend(*(id *)(a1 + 64), "_failureWithError:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 296) + 8) + 40));
    v139 = objc_claimAutoreleasedReturnValue();
    v140 = *(_QWORD *)(*(_QWORD *)(a1 + 288) + 8);
    v114 = *(void **)(v140 + 40);
    *(_QWORD *)(v140 + 40) = v139;
  }

LABEL_97:
LABEL_98:
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 288) + 8) + 40), "isSuccess")
    && objc_msgSend(*(id *)(a1 + 160), "count"))
  {
    v141 = (void *)MEMORY[0x1E0C97B48];
    objc_msgSend(*(id *)(a1 + 168), "name");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v141, "fetchRequestWithEntityName:", v142);
    v143 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self IN %@"), *(_QWORD *)(a1 + 160));
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v143, "setPredicate:", v144);

    objc_msgSend(*(id *)(a1 + 48), "executeFetchRequest:error:", v143, 0);
    v392 = 0u;
    v393 = 0u;
    v394 = 0u;
    v395 = 0u;
    v145 = (id)objc_claimAutoreleasedReturnValue();
    v146 = objc_msgSend(v145, "countByEnumeratingWithState:objects:count:", &v392, v438, 16);
    if (v146)
    {
      v147 = v146;
      v148 = *(_QWORD *)v393;
      do
      {
        for (jj = 0; jj != v147; ++jj)
        {
          if (*(_QWORD *)v393 != v148)
            objc_enumerationMutation(v145);
          v150 = *(void **)(*((_QWORD *)&v392 + 1) + 8 * jj);
          v151 = *(void **)(a1 + 56);
          objc_msgSend(v150, "objectID");
          v152 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v151, "objectForKey:", v152);
          v153 = (void *)objc_claimAutoreleasedReturnValue();

          if (v153)
          {
            v154 = *(_QWORD *)(*(_QWORD *)(a1 + 296) + 8);
            v391 = *(id *)(v154 + 40);
            v155 = objc_msgSend(v153, "validateForDeleteManagedObject:error:", v150, &v391);
            objc_storeStrong((id *)(v154 + 40), v391);
            if ((v155 & 1) == 0)
            {
              objc_msgSend(*(id *)(a1 + 64), "_failureWithError:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 296) + 8) + 40));
              v159 = objc_claimAutoreleasedReturnValue();
              v160 = *(_QWORD *)(*(_QWORD *)(a1 + 288) + 8);
              v161 = *(void **)(v160 + 40);
              *(_QWORD *)(v160 + 40) = v159;

              goto LABEL_111;
            }
          }
          else
          {
            objc_msgSend(*(id *)(a1 + 64), "_failureWithError:", 0);
            v156 = objc_claimAutoreleasedReturnValue();
            v157 = *(_QWORD *)(*(_QWORD *)(a1 + 288) + 8);
            v158 = *(void **)(v157 + 40);
            *(_QWORD *)(v157 + 40) = v156;

          }
        }
        v147 = objc_msgSend(v145, "countByEnumeratingWithState:objects:count:", &v392, v438, 16);
      }
      while (v147);
    }
LABEL_111:

  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 288) + 8) + 40), "isSuccess")
    && objc_msgSend(*(id *)(a1 + 176), "count"))
  {
    v162 = (void *)MEMORY[0x1E0C97B48];
    objc_msgSend(*(id *)(a1 + 168), "name");
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v162, "fetchRequestWithEntityName:", v163);
    v164 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self IN %@"), *(_QWORD *)(a1 + 176));
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v164, "setPredicate:", v165);

    objc_msgSend(*(id *)(a1 + 48), "executeFetchRequest:error:", v164, 0);
    v387 = 0u;
    v388 = 0u;
    v389 = 0u;
    v390 = 0u;
    v166 = (id)objc_claimAutoreleasedReturnValue();
    v167 = objc_msgSend(v166, "countByEnumeratingWithState:objects:count:", &v387, v437, 16);
    if (v167)
    {
      v168 = v167;
      v169 = *(_QWORD *)v388;
      while (2)
      {
        for (kk = 0; kk != v168; ++kk)
        {
          if (*(_QWORD *)v388 != v169)
            objc_enumerationMutation(v166);
          v171 = *(void **)(*((_QWORD *)&v387 + 1) + 8 * kk);
          v172 = *(void **)(a1 + 56);
          objc_msgSend(v171, "objectID");
          v173 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v172, "objectForKey:", v173);
          v174 = (void *)objc_claimAutoreleasedReturnValue();

          if (v174)
          {
            v175 = *(_QWORD *)(*(_QWORD *)(a1 + 296) + 8);
            v386 = *(id *)(v175 + 40);
            v176 = objc_msgSend(v174, "validateForDeleteManagedObject:error:", v171, &v386);
            objc_storeStrong((id *)(v175 + 40), v386);
            if (!v176)
            {
              objc_msgSend(*(id *)(a1 + 64), "_failureWithError:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 296) + 8) + 40));
              v180 = objc_claimAutoreleasedReturnValue();
              v181 = *(_QWORD *)(*(_QWORD *)(a1 + 288) + 8);
              v182 = *(void **)(v181 + 40);
              *(_QWORD *)(v181 + 40) = v180;

              goto LABEL_127;
            }
            objc_msgSend(*(id *)(a1 + 184), "addObject:", v171);
          }
          else
          {
            objc_msgSend(*(id *)(a1 + 64), "_failureWithError:", 0);
            v177 = objc_claimAutoreleasedReturnValue();
            v178 = *(_QWORD *)(*(_QWORD *)(a1 + 288) + 8);
            v179 = *(void **)(v178 + 40);
            *(_QWORD *)(v178 + 40) = v177;

          }
        }
        v168 = objc_msgSend(v166, "countByEnumeratingWithState:objects:count:", &v387, v437, 16);
        if (v168)
          continue;
        break;
      }
    }
LABEL_127:

  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 288) + 8) + 40), "isSuccess")
    && objc_msgSend(*(id *)(a1 + 192), "count"))
  {
    v183 = (void *)MEMORY[0x1E0C97B48];
    objc_msgSend(*(id *)(a1 + 200), "name");
    v184 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v183, "fetchRequestWithEntityName:", v184);
    v185 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self IN %@"), *(_QWORD *)(a1 + 192));
    v186 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v185, "setPredicate:", v186);

    objc_msgSend(*(id *)(a1 + 48), "executeFetchRequest:error:", v185, 0);
    v382 = 0u;
    v383 = 0u;
    v384 = 0u;
    v385 = 0u;
    v187 = (id)objc_claimAutoreleasedReturnValue();
    v188 = objc_msgSend(v187, "countByEnumeratingWithState:objects:count:", &v382, v436, 16);
    if (v188)
    {
      v189 = v188;
      v190 = *(_QWORD *)v383;
      do
      {
        for (mm = 0; mm != v189; ++mm)
        {
          if (*(_QWORD *)v383 != v190)
            objc_enumerationMutation(v187);
          v192 = *(void **)(*((_QWORD *)&v382 + 1) + 8 * mm);
          v193 = *(void **)(a1 + 56);
          objc_msgSend(v192, "objectID");
          v194 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v193, "objectForKey:", v194);
          v195 = (void *)objc_claimAutoreleasedReturnValue();

          if (v195)
          {
            v196 = *(_QWORD *)(*(_QWORD *)(a1 + 296) + 8);
            v381 = *(id *)(v196 + 40);
            v197 = objc_msgSend(v195, "validateForDeleteManagedObject:error:", v192, &v381);
            objc_storeStrong((id *)(v196 + 40), v381);
            if ((v197 & 1) == 0)
            {
              objc_msgSend(*(id *)(a1 + 64), "_failureWithError:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 296) + 8) + 40));
              v201 = objc_claimAutoreleasedReturnValue();
              v202 = *(_QWORD *)(*(_QWORD *)(a1 + 288) + 8);
              v203 = *(void **)(v202 + 40);
              *(_QWORD *)(v202 + 40) = v201;

              goto LABEL_141;
            }
          }
          else
          {
            objc_msgSend(*(id *)(a1 + 64), "_failureWithError:", 0);
            v198 = objc_claimAutoreleasedReturnValue();
            v199 = *(_QWORD *)(*(_QWORD *)(a1 + 288) + 8);
            v200 = *(void **)(v199 + 40);
            *(_QWORD *)(v199 + 40) = v198;

          }
        }
        v189 = objc_msgSend(v187, "countByEnumeratingWithState:objects:count:", &v382, v436, 16);
      }
      while (v189);
    }
LABEL_141:

  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 288) + 8) + 40), "isSuccess")
    && objc_msgSend(*(id *)(a1 + 208), "count"))
  {
    v204 = (void *)MEMORY[0x1E0C97B48];
    objc_msgSend(*(id *)(a1 + 200), "name");
    v205 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v204, "fetchRequestWithEntityName:", v205);
    v206 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self IN %@"), *(_QWORD *)(a1 + 208));
    v207 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v206, "setPredicate:", v207);

    objc_msgSend(*(id *)(a1 + 48), "executeFetchRequest:error:", v206, 0);
    v377 = 0u;
    v378 = 0u;
    v379 = 0u;
    v380 = 0u;
    v208 = (id)objc_claimAutoreleasedReturnValue();
    v209 = objc_msgSend(v208, "countByEnumeratingWithState:objects:count:", &v377, v435, 16);
    if (v209)
    {
      v210 = v209;
      v211 = *(_QWORD *)v378;
      while (2)
      {
        for (nn = 0; nn != v210; ++nn)
        {
          if (*(_QWORD *)v378 != v211)
            objc_enumerationMutation(v208);
          v213 = *(void **)(*((_QWORD *)&v377 + 1) + 8 * nn);
          v214 = *(void **)(a1 + 56);
          objc_msgSend(v213, "objectID");
          v215 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v214, "objectForKey:", v215);
          v216 = (void *)objc_claimAutoreleasedReturnValue();

          if (v216)
          {
            v217 = *(_QWORD *)(*(_QWORD *)(a1 + 296) + 8);
            v376 = *(id *)(v217 + 40);
            v218 = objc_msgSend(v216, "validateForDeleteManagedObject:error:", v213, &v376);
            objc_storeStrong((id *)(v217 + 40), v376);
            if (!v218)
            {
              objc_msgSend(*(id *)(a1 + 64), "_failureWithError:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 296) + 8) + 40));
              v222 = objc_claimAutoreleasedReturnValue();
              v223 = *(_QWORD *)(*(_QWORD *)(a1 + 288) + 8);
              v224 = *(void **)(v223 + 40);
              *(_QWORD *)(v223 + 40) = v222;

              goto LABEL_157;
            }
            objc_msgSend(*(id *)(a1 + 216), "addObject:", v213);
          }
          else
          {
            objc_msgSend(*(id *)(a1 + 64), "_failureWithError:", 0);
            v219 = objc_claimAutoreleasedReturnValue();
            v220 = *(_QWORD *)(*(_QWORD *)(a1 + 288) + 8);
            v221 = *(void **)(v220 + 40);
            *(_QWORD *)(v220 + 40) = v219;

          }
        }
        v210 = objc_msgSend(v208, "countByEnumeratingWithState:objects:count:", &v377, v435, 16);
        if (v210)
          continue;
        break;
      }
    }
LABEL_157:

  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 288) + 8) + 40), "isSuccess")
    && objc_msgSend(*(id *)(a1 + 224), "count"))
  {
    v225 = (void *)MEMORY[0x1E0C97B48];
    objc_msgSend(*(id *)(a1 + 232), "name");
    v226 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v225, "fetchRequestWithEntityName:", v226);
    v227 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self IN %@"), *(_QWORD *)(a1 + 224));
    v228 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v227, "setPredicate:", v228);

    objc_msgSend(*(id *)(a1 + 48), "executeFetchRequest:error:", v227, 0);
    v372 = 0u;
    v373 = 0u;
    v374 = 0u;
    v375 = 0u;
    v229 = (id)objc_claimAutoreleasedReturnValue();
    v230 = objc_msgSend(v229, "countByEnumeratingWithState:objects:count:", &v372, v434, 16);
    if (v230)
    {
      v231 = v230;
      v232 = *(_QWORD *)v373;
      do
      {
        for (i1 = 0; i1 != v231; ++i1)
        {
          if (*(_QWORD *)v373 != v232)
            objc_enumerationMutation(v229);
          v234 = *(void **)(*((_QWORD *)&v372 + 1) + 8 * i1);
          v235 = *(void **)(a1 + 56);
          objc_msgSend(v234, "objectID");
          v236 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v235, "objectForKey:", v236);
          v237 = (void *)objc_claimAutoreleasedReturnValue();

          if (v237)
          {
            v238 = *(_QWORD *)(*(_QWORD *)(a1 + 296) + 8);
            v371 = *(id *)(v238 + 40);
            v239 = objc_msgSend(v237, "validateForDeleteManagedObject:error:", v234, &v371);
            objc_storeStrong((id *)(v238 + 40), v371);
            if ((v239 & 1) == 0)
            {
              objc_msgSend(*(id *)(a1 + 64), "_failureWithError:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 296) + 8) + 40));
              v243 = objc_claimAutoreleasedReturnValue();
              v244 = *(_QWORD *)(*(_QWORD *)(a1 + 288) + 8);
              v245 = *(void **)(v244 + 40);
              *(_QWORD *)(v244 + 40) = v243;

              goto LABEL_171;
            }
          }
          else
          {
            objc_msgSend(*(id *)(a1 + 64), "_failureWithError:", 0);
            v240 = objc_claimAutoreleasedReturnValue();
            v241 = *(_QWORD *)(*(_QWORD *)(a1 + 288) + 8);
            v242 = *(void **)(v241 + 40);
            *(_QWORD *)(v241 + 40) = v240;

          }
        }
        v231 = objc_msgSend(v229, "countByEnumeratingWithState:objects:count:", &v372, v434, 16);
      }
      while (v231);
    }
LABEL_171:

  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 288) + 8) + 40), "isSuccess")
    && objc_msgSend(*(id *)(a1 + 240), "count"))
  {
    v246 = (void *)MEMORY[0x1E0C97B48];
    objc_msgSend(*(id *)(a1 + 232), "name");
    v247 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v246, "fetchRequestWithEntityName:", v247);
    v248 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self IN %@"), *(_QWORD *)(a1 + 240));
    v249 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v248, "setPredicate:", v249);

    objc_msgSend(*(id *)(a1 + 48), "executeFetchRequest:error:", v248, 0);
    v367 = 0u;
    v368 = 0u;
    v369 = 0u;
    v370 = 0u;
    v250 = (id)objc_claimAutoreleasedReturnValue();
    v251 = objc_msgSend(v250, "countByEnumeratingWithState:objects:count:", &v367, v433, 16);
    if (v251)
    {
      v252 = v251;
      v253 = *(_QWORD *)v368;
      while (2)
      {
        for (i2 = 0; i2 != v252; ++i2)
        {
          if (*(_QWORD *)v368 != v253)
            objc_enumerationMutation(v250);
          v255 = *(void **)(*((_QWORD *)&v367 + 1) + 8 * i2);
          v256 = *(void **)(a1 + 56);
          objc_msgSend(v255, "objectID");
          v257 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v256, "objectForKey:", v257);
          v258 = (void *)objc_claimAutoreleasedReturnValue();

          if (v258)
          {
            v259 = *(_QWORD *)(*(_QWORD *)(a1 + 296) + 8);
            v366 = *(id *)(v259 + 40);
            v260 = objc_msgSend(v258, "validateForDeleteManagedObject:error:", v255, &v366);
            objc_storeStrong((id *)(v259 + 40), v366);
            if (!v260)
            {
              objc_msgSend(*(id *)(a1 + 64), "_failureWithError:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 296) + 8) + 40));
              v264 = objc_claimAutoreleasedReturnValue();
              v265 = *(_QWORD *)(*(_QWORD *)(a1 + 288) + 8);
              v266 = *(void **)(v265 + 40);
              *(_QWORD *)(v265 + 40) = v264;

              goto LABEL_187;
            }
            objc_msgSend(*(id *)(a1 + 216), "addObject:", v255);
          }
          else
          {
            objc_msgSend(*(id *)(a1 + 64), "_failureWithError:", 0);
            v261 = objc_claimAutoreleasedReturnValue();
            v262 = *(_QWORD *)(*(_QWORD *)(a1 + 288) + 8);
            v263 = *(void **)(v262 + 40);
            *(_QWORD *)(v262 + 40) = v261;

          }
        }
        v252 = objc_msgSend(v250, "countByEnumeratingWithState:objects:count:", &v367, v433, 16);
        if (v252)
          continue;
        break;
      }
    }
LABEL_187:

  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 288) + 8) + 40), "isSuccess")
    && objc_msgSend(*(id *)(a1 + 248), "count"))
  {
    v267 = (void *)MEMORY[0x1E0C97B48];
    objc_msgSend(*(id *)(a1 + 256), "name");
    v268 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v267, "fetchRequestWithEntityName:", v268);
    v269 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self IN %@"), *(_QWORD *)(a1 + 248));
    v270 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v269, "setPredicate:", v270);

    objc_msgSend(*(id *)(a1 + 48), "executeFetchRequest:error:", v269, 0);
    v362 = 0u;
    v363 = 0u;
    v364 = 0u;
    v365 = 0u;
    v271 = (id)objc_claimAutoreleasedReturnValue();
    v272 = objc_msgSend(v271, "countByEnumeratingWithState:objects:count:", &v362, v432, 16);
    if (v272)
    {
      v273 = v272;
      v274 = *(_QWORD *)v363;
      do
      {
        for (i3 = 0; i3 != v273; ++i3)
        {
          if (*(_QWORD *)v363 != v274)
            objc_enumerationMutation(v271);
          v276 = *(void **)(*((_QWORD *)&v362 + 1) + 8 * i3);
          v277 = *(void **)(a1 + 56);
          objc_msgSend(v276, "objectID");
          v278 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v277, "objectForKey:", v278);
          v279 = (void *)objc_claimAutoreleasedReturnValue();

          if (v279)
          {
            v280 = *(_QWORD *)(*(_QWORD *)(a1 + 296) + 8);
            v361 = *(id *)(v280 + 40);
            v281 = objc_msgSend(v279, "validateForDeleteManagedObject:error:", v276, &v361);
            objc_storeStrong((id *)(v280 + 40), v361);
            if ((v281 & 1) == 0)
            {
              objc_msgSend(*(id *)(a1 + 64), "_failureWithError:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 296) + 8) + 40));
              v285 = objc_claimAutoreleasedReturnValue();
              v286 = *(_QWORD *)(*(_QWORD *)(a1 + 288) + 8);
              v287 = *(void **)(v286 + 40);
              *(_QWORD *)(v286 + 40) = v285;

              goto LABEL_201;
            }
          }
          else
          {
            objc_msgSend(*(id *)(a1 + 64), "_failureWithError:", 0);
            v282 = objc_claimAutoreleasedReturnValue();
            v283 = *(_QWORD *)(*(_QWORD *)(a1 + 288) + 8);
            v284 = *(void **)(v283 + 40);
            *(_QWORD *)(v283 + 40) = v282;

          }
        }
        v273 = objc_msgSend(v271, "countByEnumeratingWithState:objects:count:", &v362, v432, 16);
      }
      while (v273);
    }
LABEL_201:

  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 288) + 8) + 40), "isSuccess")
    && objc_msgSend(*(id *)(a1 + 264), "count"))
  {
    v288 = (void *)MEMORY[0x1E0C97B48];
    objc_msgSend(*(id *)(a1 + 256), "name");
    v289 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v288, "fetchRequestWithEntityName:", v289);
    v290 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self IN %@"), *(_QWORD *)(a1 + 264));
    v291 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v290, "setPredicate:", v291);

    objc_msgSend(*(id *)(a1 + 48), "executeFetchRequest:error:", v290, 0);
    v357 = 0u;
    v358 = 0u;
    v359 = 0u;
    v360 = 0u;
    v292 = (id)objc_claimAutoreleasedReturnValue();
    v293 = objc_msgSend(v292, "countByEnumeratingWithState:objects:count:", &v357, v431, 16);
    if (v293)
    {
      v294 = v293;
      v295 = *(_QWORD *)v358;
      do
      {
        for (i4 = 0; i4 != v294; ++i4)
        {
          if (*(_QWORD *)v358 != v295)
            objc_enumerationMutation(v292);
          v297 = *(void **)(*((_QWORD *)&v357 + 1) + 8 * i4);
          v298 = *(void **)(a1 + 56);
          objc_msgSend(v297, "objectID");
          v299 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v298, "objectForKey:", v299);
          v300 = (void *)objc_claimAutoreleasedReturnValue();

          if (v300)
          {
            v301 = *(_QWORD *)(*(_QWORD *)(a1 + 296) + 8);
            v356 = *(id *)(v301 + 40);
            v302 = objc_msgSend(v300, "validateForDeleteManagedObject:error:", v297, &v356);
            objc_storeStrong((id *)(v301 + 40), v356);
            if ((v302 & 1) == 0)
            {
              objc_msgSend(*(id *)(a1 + 64), "_failureWithError:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 296) + 8) + 40));
              v306 = objc_claimAutoreleasedReturnValue();
              v307 = *(_QWORD *)(*(_QWORD *)(a1 + 288) + 8);
              v308 = *(void **)(v307 + 40);
              *(_QWORD *)(v307 + 40) = v306;

              goto LABEL_215;
            }
          }
          else
          {
            objc_msgSend(*(id *)(a1 + 64), "_failureWithError:", 0);
            v303 = objc_claimAutoreleasedReturnValue();
            v304 = *(_QWORD *)(*(_QWORD *)(a1 + 288) + 8);
            v305 = *(void **)(v304 + 40);
            *(_QWORD *)(v304 + 40) = v303;

          }
        }
        v294 = objc_msgSend(v292, "countByEnumeratingWithState:objects:count:", &v357, v431, 16);
      }
      while (v294);
    }
LABEL_215:

  }
  if (!objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 288) + 8) + 40), "isSuccess")
    || !objc_msgSend(*(id *)(a1 + 272), "count"))
  {
    goto LABEL_240;
  }
  v354 = 0u;
  v355 = 0u;
  v352 = 0u;
  v353 = 0u;
  v309 = *(id *)(a1 + 272);
  v347 = objc_msgSend(v309, "countByEnumeratingWithState:objects:count:", &v352, v430, 16);
  if (!v347)
    goto LABEL_239;
  v346 = *(_QWORD *)v353;
  v344 = *MEMORY[0x1E0CB2938];
  do
  {
    for (i5 = 0; i5 != v347; ++i5)
    {
      if (*(_QWORD *)v353 != v346)
        objc_enumerationMutation(v309);
      v311 = *(void **)(*((_QWORD *)&v352 + 1) + 8 * i5);
      v349 = MEMORY[0x19AEBEADC]();
      v312 = (void *)MEMORY[0x1E0C97B48];
      objc_msgSend(v311, "entity");
      v313 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v313, "name");
      v314 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v312, "fetchRequestWithEntityName:", v314);
      v315 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self == %@"), v311);
      v316 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v315, "setPredicate:", v316);

      v317 = *(void **)(a1 + 48);
      v351 = 0;
      objc_msgSend(v317, "executeFetchRequest:error:", v315, &v351);
      v318 = (void *)objc_claimAutoreleasedReturnValue();
      v319 = v351;
      if (v318)
      {
        objc_msgSend(v318, "firstObject");
        v320 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 56), "objectForKey:", v311);
        v321 = (void *)objc_claimAutoreleasedReturnValue();
        v322 = v321;
        if (v321)
        {
          if (v320)
          {
            v323 = *(_QWORD *)(*(_QWORD *)(a1 + 296) + 8);
            v350 = *(id *)(v323 + 40);
            v324 = objc_msgSend(v321, "validateMutationsToManagedObject:error:", v320, &v350);
            objc_storeStrong((id *)(v323 + 40), v350);
            if ((v324 & 1) != 0)
            {
              v325 = 0;
              v326 = (void *)v349;
LABEL_235:

              goto LABEL_236;
            }
          }
          else
          {
            v345 = (void *)MEMORY[0x1E0CB35C8];
            v428 = v344;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Managed object not found: %@"), v311);
            v333 = (void *)objc_claimAutoreleasedReturnValue();
            v429 = v333;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v429, &v428, 1);
            v334 = v309;
            v335 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v345, "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3110, v335);
            v336 = objc_claimAutoreleasedReturnValue();
            v337 = *(_QWORD *)(*(_QWORD *)(a1 + 296) + 8);
            v338 = *(void **)(v337 + 40);
            *(_QWORD *)(v337 + 40) = v336;

            v309 = v334;
          }
          objc_msgSend(*(id *)(a1 + 64), "_failureWithError:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 296) + 8) + 40));
          v339 = objc_claimAutoreleasedReturnValue();
          v340 = *(_QWORD *)(*(_QWORD *)(a1 + 288) + 8);
          v332 = *(void **)(v340 + 40);
          *(_QWORD *)(v340 + 40) = v339;
          v325 = 30;
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 64), "_failureWithError:", 0);
          v330 = objc_claimAutoreleasedReturnValue();
          v325 = 0;
          v331 = *(_QWORD *)(*(_QWORD *)(a1 + 288) + 8);
          v332 = *(void **)(v331 + 40);
          *(_QWORD *)(v331 + 40) = v330;
        }
        v326 = (void *)v349;

        goto LABEL_235;
      }
      PLPhotoKitGetLog();
      v327 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v327, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v427 = v319;
        _os_log_impl(&dword_1991EC000, v327, OS_LOG_TYPE_ERROR, "managedObjectsNeedingMutationValidations fetch failed: %@", buf, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 64), "_failureWithError:", v319);
      v328 = objc_claimAutoreleasedReturnValue();
      v329 = *(_QWORD *)(*(_QWORD *)(a1 + 288) + 8);
      v320 = *(void **)(v329 + 40);
      *(_QWORD *)(v329 + 40) = v328;
      v325 = 30;
      v326 = (void *)v349;
LABEL_236:

      objc_autoreleasePoolPop(v326);
      if (v325)
        goto LABEL_239;
    }
    v347 = objc_msgSend(v309, "countByEnumeratingWithState:objects:count:", &v352, v430, 16);
  }
  while (v347);
LABEL_239:

LABEL_240:
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 288) + 8) + 40), "isSuccess"))
  {
    objc_msgSend(*(id *)(a1 + 64), "_validateSimpleDeletionsWithValidators:requestsByObjectID:", *(_QWORD *)(a1 + 280), *(_QWORD *)(a1 + 56));
    v341 = objc_claimAutoreleasedReturnValue();
    v342 = *(_QWORD *)(*(_QWORD *)(a1 + 288) + 8);
    v343 = *(void **)(v342 + 40);
    *(_QWORD *)(v342 + 40) = v341;

  }
}

@end
