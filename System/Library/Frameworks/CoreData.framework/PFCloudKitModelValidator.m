@implementation PFCloudKitModelValidator

- (PFCloudKitModelValidator)initWithManagedObjectModel:(id)a3 configuration:(id)a4 mirroringDelegateOptions:(id)a5
{
  PFCloudKitModelValidator *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PFCloudKitModelValidator;
  v8 = -[PFCloudKitModelValidator init](&v10, sel_init);
  if (v8)
  {
    v8->_model = (NSManagedObjectModel *)a3;
    v8->_configurationName = (NSString *)a4;
    v8->_options = (NSCloudKitMirroringDelegateOptions *)a5;
    *(_WORD *)&v8->_skipValueTransformerValidation = 0;
    v8->_supportsMergeableTransformable = 0;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  self->_model = 0;
  self->_configurationName = 0;

  self->_options = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFCloudKitModelValidator;
  -[PFCloudKitModelValidator dealloc](&v3, sel_dealloc);
}

- (uint64_t)_validateManagedObjectModel:(_QWORD *)a3 error:
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  uint64_t v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  objc_class *v45;
  NSString *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  objc_class *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t *v68;
  uint64_t *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  NSObject *v79;
  id v80;
  id v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  NSObject *v89;
  uint64_t v90;
  id v91;
  void *context;
  _QWORD *v93;
  id v94;
  id v95;
  id v96;
  uint64_t v97;
  id v98;
  id v99;
  uint64_t v100;
  id v101;
  id v102;
  void *v103;
  id v104;
  id v105;
  void *v106;
  id v107;
  id v108;
  id v109;
  id v110;
  uint64_t v111;
  id obj;
  void *v113;
  uint64_t v114;
  id v115;
  _QWORD v116[5];
  _QWORD v117[5];
  _QWORD v118[5];
  _QWORD v119[5];
  _QWORD v120[5];
  _QWORD v121[5];
  _QWORD v122[5];
  _QWORD v123[5];
  _QWORD v124[5];
  _QWORD v125[5];
  _QWORD v126[5];
  _QWORD v127[5];
  _QWORD v128[5];
  _QWORD v129[5];
  _QWORD v130[5];
  _QWORD v131[5];
  _QWORD v132[5];
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  _QWORD v137[6];
  _QWORD v138[13];
  _QWORD v139[13];
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint8_t v150[4];
  const char *v151;
  __int16 v152;
  int v153;
  uint64_t v154;
  uint64_t v155;
  uint8_t v156[128];
  uint8_t buf[4];
  const char *v158;
  __int16 v159;
  int v160;
  uint64_t v161;

  v161 = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  if (a2)
  {
    v4 = result;
    v5 = (void *)objc_msgSend(a2, "entitiesForConfiguration:", *(_QWORD *)(result + 16));
    if (v5)
    {
      v6 = v5;
      if (objc_msgSend(v5, "count") || !objc_msgSend(*(id *)(v4 + 16), "length"))
      {
        v100 = v4;
        v93 = a3;
        context = (void *)MEMORY[0x18D76B4E4]();
        v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v6);
        v91 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v109 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v108 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v107 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v115 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v95 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v110 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v102 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v104 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v96 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v105 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v101 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v94 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v140 = 0u;
        v141 = 0u;
        v142 = 0u;
        v143 = 0u;
        obj = (id)v7;
        v13 = (void *)v7;
        v14 = v11;
        v103 = v10;
        v106 = v11;
        v113 = v12;
        v111 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v140, buf, 16);
        if (v111)
        {
          v97 = *(_QWORD *)v141;
          v98 = v9;
          v99 = v8;
          do
          {
            v15 = 0;
            do
            {
              if (*(_QWORD *)v141 != v97)
                objc_enumerationMutation(obj);
              v114 = v15;
              v16 = *(void **)(*((_QWORD *)&v140 + 1) + 8 * v15);
              v17 = objc_alloc_init(MEMORY[0x1E0C99E20]);
              v18 = objc_alloc_init(MEMORY[0x1E0C99E20]);
              if (objc_msgSend((id)objc_msgSend(v16, "userInfo"), "objectForKey:", CFSTR("NSPersistentCloudKitContainerEncryptedAttributeKey")))
              {
                v19 = (void *)MEMORY[0x1E0CB3940];
                v90 = objc_msgSend(v16, "name");
                v20 = v19;
                v12 = v113;
                objc_msgSend(v96, "addObject:", objc_msgSend(v20, "stringWithFormat:", CFSTR("%@: %@ cannot be applied to an entity type'"), v90, CFSTR("NSPersistentCloudKitContainerEncryptedAttributeKey"), v91, context));
              }
              v21 = (void *)objc_msgSend(v16, "attributesByName");
              v22 = MEMORY[0x1E0C809B0];
              v139[0] = MEMORY[0x1E0C809B0];
              v139[1] = 3221225472;
              v139[2] = __51__PFCloudKitModelValidator_validateEntities_error___block_invoke;
              v139[3] = &unk_1E1EDD2D0;
              v139[4] = v100;
              v139[5] = v10;
              v139[6] = v16;
              v139[7] = v107;
              v139[8] = v12;
              v139[9] = v110;
              v139[10] = v17;
              v139[11] = v109;
              v139[12] = v105;
              objc_msgSend(v21, "enumerateKeysAndObjectsUsingBlock:", v139);
              v23 = (void *)objc_msgSend(v16, "relationshipsByName");
              v138[0] = v22;
              v138[1] = 3221225472;
              v138[2] = __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_2;
              v138[3] = &unk_1E1EDD2F8;
              v138[4] = v8;
              v138[5] = v16;
              v138[6] = v9;
              v138[7] = v108;
              v138[8] = obj;
              v138[9] = v14;
              v138[10] = v102;
              v138[11] = v104;
              v138[12] = v101;
              objc_msgSend(v23, "enumerateKeysAndObjectsUsingBlock:", v138);
              objc_opt_self();
              if (qword_1ECD8D8A8 != -1)
                dispatch_once(&qword_1ECD8D8A8, &__block_literal_global_130);
              if ((_MergedGlobals_65 & 1) == 0 && objc_msgSend((id)objc_msgSend(v16, "uniquenessConstraints"), "count"))
              {
                v24 = (void *)objc_msgSend(v16, "uniquenessConstraints");
                v137[0] = MEMORY[0x1E0C809B0];
                v137[1] = 3221225472;
                v137[2] = __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_3;
                v137[3] = &unk_1E1EDD348;
                v137[4] = v16;
                v137[5] = v94;
                objc_msgSend(v24, "enumerateObjectsUsingBlock:", v137);
              }
              if (qword_1ECD8D898 != -1)
                dispatch_once(&qword_1ECD8D898, &__block_literal_global_0);
              v25 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v16, "userInfo"), "objectForKey:", CFSTR("NSPersistentHistoryTombstoneAttributes")), "componentsSeparatedByString:", CFSTR(","));
              if (v25)
              {
                v26 = v25;
                if (objc_msgSend(v25, "count"))
                  objc_msgSend(v17, "addObjectsFromArray:", v26);
              }
              v135 = 0u;
              v136 = 0u;
              v133 = 0u;
              v134 = 0u;
              v27 = (void *)qword_1ECD8D8A0;
              v28 = objc_msgSend((id)qword_1ECD8D8A0, "countByEnumeratingWithState:objects:count:", &v133, v156, 16);
              if (v28)
              {
                v29 = v28;
                v30 = *(_QWORD *)v134;
                do
                {
                  for (i = 0; i != v29; ++i)
                  {
                    if (*(_QWORD *)v134 != v30)
                      objc_enumerationMutation(v27);
                    v32 = *(_QWORD *)(*((_QWORD *)&v133 + 1) + 8 * i);
                    if (objc_msgSend(v18, "containsObject:", v32)
                      && (objc_msgSend(v17, "containsObject:", v32) & 1) == 0)
                    {
                      v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@:%@ - preservesValueInHistoryOnDeletion should be YES"), objc_msgSend(v16, "name"), v32);
                      objc_msgSend(v115, "addObject:", v33);

                    }
                  }
                  v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v133, v156, 16);
                }
                while (v29);
              }

              v34 = objc_alloc((Class)getCloudKitCKRecordZoneIDClass[0]());
              v35 = (void *)objc_msgSend(v34, "initWithZoneName:ownerName:", CFSTR("com.apple.coredata.cloudkit.zone"), getCloudKitCKCurrentUserDefaultName[0]());
              v36 = +[PFCloudKitSchemaGenerator newRepresentativeRecordForStaticFieldsInEntity:inZoneWithID:]((uint64_t)PFCloudKitSchemaGenerator, v16, (uint64_t)v35);
              if ((unint64_t)objc_msgSend(v36, "size") > 0xAAE60)
              {
                v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@: Estimated size %lu bytes"), objc_msgSend(v16, "name"), objc_msgSend(v36, "size"));
                objc_msgSend(v95, "addObject:", v37);

              }
              v12 = v113;
              v15 = v114 + 1;
              v9 = v98;
              v8 = v99;
              v10 = v103;
              v14 = v106;
            }
            while (v114 + 1 != v111);
            v111 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v140, buf, 16);
          }
          while (v111);
        }
        v38 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        if (objc_msgSend(v9, "count"))
        {
          objc_msgSend(v9, "sortUsingSelector:", sel_localizedCaseInsensitiveCompare_);
          v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("CloudKit integration requires that all relationships have an inverse, the following do not:"));
          v132[0] = MEMORY[0x1E0C809B0];
          v132[1] = 3221225472;
          v132[2] = __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_2_76;
          v132[3] = &unk_1E1EDD370;
          v132[4] = v39;
          objc_msgSend(v9, "enumerateObjectsUsingBlock:", v132);
          objc_msgSend(v38, "addObject:", v39);

        }
        if (objc_msgSend(v108, "count"))
        {
          objc_msgSend(v108, "sortUsingSelector:", sel_localizedCaseInsensitiveCompare_);
          v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("CloudKit integration does not support ordered relationships. The following relationships are marked ordered:"));
          v131[0] = MEMORY[0x1E0C809B0];
          v131[1] = 3221225472;
          v131[2] = __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_3_82;
          v131[3] = &unk_1E1EDD370;
          v131[4] = v40;
          objc_msgSend(v108, "enumerateObjectsUsingBlock:", v131);
          objc_msgSend(v38, "addObject:", v40);

        }
        if (objc_msgSend(v109, "count"))
        {
          objc_msgSend(v109, "sortUsingSelector:", sel_localizedCaseInsensitiveCompare_);
          v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("CloudKit integration requires that all attributes be optional, or have a default value set. The following attributes are marked non-optional but do not have a default value:"));
          v130[0] = MEMORY[0x1E0C809B0];
          v130[1] = 3221225472;
          v130[2] = __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_4_85;
          v130[3] = &unk_1E1EDD370;
          v130[4] = v41;
          objc_msgSend(v109, "enumerateObjectsUsingBlock:", v130);
          objc_msgSend(v38, "addObject:", v41);

        }
        if (objc_msgSend(v8, "count"))
        {
          objc_msgSend(v8, "sortUsingSelector:", sel_localizedCaseInsensitiveCompare_);
          v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("CloudKit integration requires that all relationships be optional, the following are not:"));
          v129[0] = MEMORY[0x1E0C809B0];
          v129[1] = 3221225472;
          v129[2] = __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_5;
          v129[3] = &unk_1E1EDD370;
          v129[4] = v42;
          objc_msgSend(v8, "enumerateObjectsUsingBlock:", v129);
          objc_msgSend(v38, "addObject:", v42);

        }
        if (objc_msgSend(v107, "count"))
        {
          objc_msgSend(v107, "sortUsingSelector:", sel_localizedCaseInsensitiveCompare_);
          v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("CloudKit integration does not support all attribute types. The following entities have attributes of an unsupported type:"));
          v128[0] = MEMORY[0x1E0C809B0];
          v128[1] = 3221225472;
          v128[2] = __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_6;
          v128[3] = &unk_1E1EDD370;
          v128[4] = v43;
          objc_msgSend(v107, "enumerateObjectsUsingBlock:", v128);
          objc_msgSend(v38, "addObject:", v43);

        }
        if (objc_msgSend(v10, "count"))
        {
          objc_msgSend(v10, "sortUsingSelector:", sel_localizedCaseInsensitiveCompare_);
          v44 = objc_alloc(MEMORY[0x1E0CB37A0]);
          v45 = (objc_class *)objc_opt_class();
          v46 = NSStringFromClass(v45);
          v47 = (void *)objc_msgSend(v44, "initWithFormat:", CFSTR("CloudKit integration requires that the value transformers for transformable attributes are available via +[%@ %@] and allow reverse transformation:"), v46, NSStringFromSelector(sel_valueTransformerForName_));
          v127[0] = MEMORY[0x1E0C809B0];
          v127[1] = 3221225472;
          v127[2] = __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_7;
          v127[3] = &unk_1E1EDD370;
          v127[4] = v47;
          objc_msgSend(v103, "enumerateObjectsUsingBlock:", v127);
          objc_msgSend(v38, "addObject:", v47);

        }
        if (objc_msgSend(v106, "count"))
        {
          objc_msgSend(v106, "sortUsingSelector:", sel_localizedCaseInsensitiveCompare_);
          v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("CloudKit integration does not allow relationships to objects that aren't sync'd. The following relationships have destination entities that not in the specified configuration."));
          v126[0] = MEMORY[0x1E0C809B0];
          v126[1] = 3221225472;
          v126[2] = __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_8;
          v126[3] = &unk_1E1EDD370;
          v126[4] = v48;
          objc_msgSend(v106, "enumerateObjectsUsingBlock:", v126);
          objc_msgSend(v38, "addObject:", v48);

        }
        if (objc_msgSend(v115, "count"))
        {
          objc_msgSend(v115, "sortUsingSelector:", sel_localizedCaseInsensitiveCompare_);
          v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("CloudKit integration requires that all entities tombstone %@ and %@ on delete if configured. The following entities are not properly configured:"), CFSTR("ckRecordID"), CFSTR("ckRecordSystemFields"));
          v125[0] = MEMORY[0x1E0C809B0];
          v125[1] = 3221225472;
          v125[2] = __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_9;
          v125[3] = &unk_1E1EDD370;
          v125[4] = v49;
          objc_msgSend(v115, "enumerateObjectsUsingBlock:", v125);
          objc_msgSend(v38, "addObject:", v49);

        }
        if (objc_msgSend(v95, "count"))
        {
          objc_msgSend(v95, "sortUsingSelector:", sel_localizedCaseInsensitiveCompare_);
          v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("CloudKit integration requires that all entities can be materialized in a CKRecord of less than %lu bytes. The following entities cannot:"), 700000);
          v124[0] = MEMORY[0x1E0C809B0];
          v124[1] = 3221225472;
          v124[2] = __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_10;
          v124[3] = &unk_1E1EDD370;
          v124[4] = v50;
          objc_msgSend(v95, "enumerateObjectsUsingBlock:", v124);
          objc_msgSend(v38, "addObject:", v50);

        }
        if (objc_msgSend(v113, "count"))
        {
          objc_msgSend(v113, "sortUsingSelector:", sel_localizedCaseInsensitiveCompare_);
          v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("The following attributes have invalid values for '%@':"), CFSTR("NSCloudKitMirroringDelegateIgnoredPropertyKey"));
          v123[0] = MEMORY[0x1E0C809B0];
          v123[1] = 3221225472;
          v123[2] = __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_11;
          v123[3] = &unk_1E1EDD370;
          v123[4] = v51;
          objc_msgSend(v113, "enumerateObjectsUsingBlock:", v123);
          objc_msgSend(v38, "addObject:", v51);

        }
        if (objc_msgSend(v102, "count"))
        {
          objc_msgSend(v102, "sortUsingSelector:", sel_localizedCaseInsensitiveCompare_);
          v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("CloudKit integration does not support ignored relationships. The following entities and relationships are marked ignored using '%@':"), CFSTR("NSCloudKitMirroringDelegateIgnoredPropertyKey"));
          v122[0] = MEMORY[0x1E0C809B0];
          v122[1] = 3221225472;
          v122[2] = __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_12;
          v122[3] = &unk_1E1EDD370;
          v122[4] = v52;
          objc_msgSend(v102, "enumerateObjectsUsingBlock:", v122);
          objc_msgSend(v38, "addObject:", v52);

        }
        if (objc_msgSend(v96, "count"))
        {
          objc_msgSend(v96, "sortUsingSelector:", sel_localizedCaseInsensitiveCompare_);
          v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("The following entities have invalid values:"));
          v121[0] = MEMORY[0x1E0C809B0];
          v121[1] = 3221225472;
          v121[2] = __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_13;
          v121[3] = &unk_1E1EDD370;
          v121[4] = v53;
          objc_msgSend(v96, "enumerateObjectsUsingBlock:", v121);
          objc_msgSend(v38, "addObject:", v53);

        }
        v54 = v110;
        if (objc_msgSend(v110, "count"))
        {
          objc_msgSend(v110, "sortUsingSelector:", sel_localizedCaseInsensitiveCompare_);
          v55 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("The following attributes have invalid values:"));
          v120[0] = MEMORY[0x1E0C809B0];
          v120[1] = 3221225472;
          v120[2] = __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_14;
          v120[3] = &unk_1E1EDD370;
          v120[4] = v55;
          objc_msgSend(v110, "enumerateObjectsUsingBlock:", v120);
          objc_msgSend(v38, "addObject:", v55);

          v54 = v110;
        }
        if (objc_msgSend(v104, "count"))
        {
          objc_msgSend(v104, "sortUsingSelector:", sel_localizedCaseInsensitiveCompare_);
          v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("CloudKit integration does not support encrypted relationships. The following entities and relationships are marked with '%@':"), CFSTR("NSPersistentCloudKitContainerEncryptedAttributeKey"));
          v119[0] = MEMORY[0x1E0C809B0];
          v119[1] = 3221225472;
          v119[2] = __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_15;
          v119[3] = &unk_1E1EDD370;
          v119[4] = v56;
          objc_msgSend(v104, "enumerateObjectsUsingBlock:", v119);
          objc_msgSend(v38, "addObject:", v56);

          v54 = v110;
        }
        if (objc_msgSend(v105, "count"))
        {
          objc_msgSend(v105, "sortUsingSelector:", sel_localizedCaseInsensitiveCompare_);
          v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("The following attributes use mergeable storage with CloudKit which is unsupported:"));
          v118[0] = MEMORY[0x1E0C809B0];
          v118[1] = 3221225472;
          v118[2] = __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_16;
          v118[3] = &unk_1E1EDD370;
          v118[4] = v57;
          objc_msgSend(v105, "enumerateObjectsUsingBlock:", v118);
          objc_msgSend(v38, "addObject:", v57);

          v54 = v110;
        }
        if (objc_msgSend(v101, "count"))
        {
          objc_msgSend(v101, "sortUsingSelector:", sel_localizedCaseInsensitiveCompare_);
          v58 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("The following relationships are configured with unsupported delete rules:"));
          v117[0] = MEMORY[0x1E0C809B0];
          v117[1] = 3221225472;
          v117[2] = __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_17;
          v117[3] = &unk_1E1EDD370;
          v117[4] = v58;
          objc_msgSend(v101, "enumerateObjectsUsingBlock:", v117);
          objc_msgSend(v38, "addObject:", v58);

          v54 = v110;
        }
        if (objc_msgSend(v94, "count"))
        {
          objc_msgSend(v94, "sortUsingSelector:", sel_localizedCaseInsensitiveCompare_);
          v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("CloudKit integration does not support unique constraints. The following entities are constrained:"));
          v116[0] = MEMORY[0x1E0C809B0];
          v116[1] = 3221225472;
          v116[2] = __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_18;
          v116[3] = &unk_1E1EDD370;
          v116[4] = v59;
          objc_msgSend(v94, "enumerateObjectsUsingBlock:", v116);
          objc_msgSend(v38, "addObject:", v59);

          v54 = v110;
        }

        v60 = objc_msgSend(v38, "count");
        if (v60)
        {
          if ((unint64_t)objc_msgSend(v38, "count") < 2)
            v61 = objc_msgSend(v38, "lastObject");
          else
            v61 = objc_msgSend(v38, "componentsJoinedByString:", CFSTR("\n"));
          v71 = *MEMORY[0x1E0CB28A8];
          v154 = *MEMORY[0x1E0CB2D68];
          v155 = v61;
          v70 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v71, 134060, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v155, &v154, 1));

          if (!v70)
          {
            v72 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
            _NSCoreDataLog(17, v72, v73, v74, v75, v76, v77, v78, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitModelValidator.m");
            v79 = __pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)v150 = 136315394;
              v151 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitModelValidator.m";
              v152 = 1024;
              v153 = 563;
              _os_log_fault_impl(&dword_18A253000, v79, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", v150, 0x12u);
            }
            v70 = 0;
          }
        }
        else
        {

          v70 = 0;
        }
        v80 = v70;

        objc_autoreleasePoolPop(context);
        v81 = v70;
        a3 = v93;
        if (!v60)
          return 1;
        goto LABEL_85;
      }
      v65 = (void *)MEMORY[0x1E0CB35C8];
      v66 = *MEMORY[0x1E0CB28A8];
      v146 = *MEMORY[0x1E0CB2D68];
      v147 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The configuration named '%@' does not contain any entities."), *(_QWORD *)(v4 + 16));
      v67 = (void *)MEMORY[0x1E0C99D80];
      v68 = &v147;
      v69 = &v146;
    }
    else
    {
      v65 = (void *)MEMORY[0x1E0CB35C8];
      v66 = *MEMORY[0x1E0CB28A8];
      v148 = *MEMORY[0x1E0CB2D68];
      v149 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to find a configuration named '%@' in the specified managed object model."), *(_QWORD *)(v4 + 16));
      v67 = (void *)MEMORY[0x1E0C99D80];
      v68 = &v149;
      v69 = &v148;
    }
  }
  else
  {
    v62 = (void *)MEMORY[0x1E0CB3940];
    v63 = (objc_class *)objc_opt_class();
    v64 = objc_msgSend(v62, "stringWithFormat:", CFSTR("Cannot be used without an instance of %@."), NSStringFromClass(v63));
    v65 = (void *)MEMORY[0x1E0CB35C8];
    v66 = *MEMORY[0x1E0CB28A8];
    v144 = *MEMORY[0x1E0CB2D68];
    v145 = v64;
    v67 = (void *)MEMORY[0x1E0C99D80];
    v68 = &v145;
    v69 = &v144;
  }
  v70 = (void *)objc_msgSend(v65, "errorWithDomain:code:userInfo:", v66, 134060, objc_msgSend(v67, "dictionaryWithObjects:forKeys:count:", v68, v69, 1));
LABEL_85:
  if (v70)
  {
    if (a3)
    {
      result = 0;
      *a3 = v70;
      return result;
    }
  }
  else
  {
    v82 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
    _NSCoreDataLog(17, v82, v83, v84, v85, v86, v87, v88, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitModelValidator.m");
    v89 = __pflogFaultLog;
    result = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
    if (!(_DWORD)result)
      return result;
    *(_DWORD *)buf = 136315394;
    v158 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitModelValidator.m";
    v159 = 1024;
    v160 = 108;
    _os_log_fault_impl(&dword_18A253000, v89, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
  }
  return 0;
}

uint64_t __51__PFCloudKitModelValidator_validateEntities_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  objc_class *v20;
  NSString *v21;
  objc_class *v22;
  NSString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  objc_class *v30;
  NSString *v31;
  objc_class *v32;
  NSString *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 25))
  {
    result = +[PFCloudKitSerializer isPrivateAttribute:]((uint64_t)PFCloudKitSerializer, a3);
    if ((result & 1) != 0)
      return result;
  }
  v7 = objc_msgSend(a3, "attributeType");
  if (v7 > 799)
  {
    if (v7 <= 1099)
    {
      if (v7 != 800 && v7 != 900 && v7 != 1000)
        goto LABEL_32;
    }
    else if (v7 > 1799)
    {
      if (v7 == 2100)
        goto LABEL_34;
      if (v7 != 1800)
        goto LABEL_32;
      if (objc_msgSend((id)objc_msgSend(a3, "valueTransformerName"), "length")
        && !*(_BYTE *)(*(_QWORD *)(a1 + 32) + 24))
      {
        if (objc_msgSend(MEMORY[0x1E0CB3B20], "valueTransformerForName:", objc_msgSend(a3, "valueTransformerName")))
        {
          if ((objc_msgSend((id)objc_opt_class(), "allowsReverseTransformation") & 1) != 0)
            goto LABEL_34;
          v8 = *(void **)(a1 + 40);
          v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %@ - Doesn't allow reverse transformation"), objc_msgSend(*(id *)(a1 + 48), "name"), a2, v34);
        }
        else
        {
          v8 = *(void **)(a1 + 40);
          v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %@ - Cannot locate value transformer with name '%@'"), objc_msgSend(*(id *)(a1 + 48), "name"), a2, objc_msgSend(a3, "valueTransformerName"));
        }
        v11 = v9;
        v12 = v8;
        goto LABEL_33;
      }
    }
    else if (v7 != 1100 && v7 != 1200)
    {
      goto LABEL_32;
    }
  }
  else if (v7 <= 399)
  {
    if (v7 != 100 && v7 != 200 && v7 != 300)
      goto LABEL_32;
  }
  else if (v7 > 599)
  {
    if (v7 != 600 && v7 != 700)
      goto LABEL_32;
  }
  else if (v7 != 400 && v7 != 500)
  {
LABEL_32:
    v10 = *(void **)(a1 + 56);
    v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %@ - Unsupported attribute type (%@)"), objc_msgSend(*(id *)(a1 + 48), "name"), a2, +[NSAttributeDescription stringForAttributeType:](NSAttributeDescription, "stringForAttributeType:", v7));
    v12 = v10;
LABEL_33:
    objc_msgSend(v12, "addObject:", v11);
  }
LABEL_34:
  v13 = (void *)objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", CFSTR("NSCloudKitMirroringDelegateIgnoredPropertyKey"));
  if (v13)
  {
    v14 = v13;
    if ((objc_msgSend(v13, "isNSNumber") & 1) != 0 || (objc_msgSend(v14, "isNSString") & 1) != 0)
    {
      if (!objc_msgSend(v14, "BOOLValue") || (objc_msgSend(a3, "isOptional") & 1) != 0)
        goto LABEL_42;
      v15 = *(void **)(a1 + 64);
      v16 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %@ - attribute is not optional"), objc_msgSend(*(id *)(a1 + 48), "name"), a2, v34, v35, v36);
    }
    else
    {
      v15 = *(void **)(a1 + 64);
      v17 = (void *)MEMORY[0x1E0CB3940];
      v18 = objc_msgSend(*(id *)(a1 + 48), "name");
      v19 = objc_msgSend(a3, "name");
      v20 = (objc_class *)objc_opt_class();
      v21 = NSStringFromClass(v20);
      v22 = (objc_class *)objc_opt_class();
      v23 = NSStringFromClass(v22);
      v16 = objc_msgSend(v17, "stringWithFormat:", CFSTR("%@: %@ - Value must be an instance of '%@' or '%@' that evalutes to YES or NO using '%@'"), v18, v19, v21, v23, NSStringFromSelector(sel_BOOLValue));
    }
    objc_msgSend(v15, "addObject:", v16);
  }
LABEL_42:
  v24 = (void *)objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", CFSTR("NSPersistentCloudKitContainerEncryptedAttributeKey"));
  if (v24)
  {
    v25 = v24;
    if ((objc_msgSend(v24, "isNSNumber") & 1) == 0 && (objc_msgSend(v25, "isNSString") & 1) == 0)
    {
      v26 = *(void **)(a1 + 72);
      v27 = (void *)MEMORY[0x1E0CB3940];
      v28 = objc_msgSend(*(id *)(a1 + 48), "name");
      v29 = objc_msgSend(a3, "name");
      v30 = (objc_class *)objc_opt_class();
      v31 = NSStringFromClass(v30);
      v32 = (objc_class *)objc_opt_class();
      v33 = NSStringFromClass(v32);
      objc_msgSend(v26, "addObject:", objc_msgSend(v27, "stringWithFormat:", CFSTR("%@: %@ - Value for %@ must be an instance of '%@' or '%@' that evalutes to YES or NO using '%@'"), v28, v29, CFSTR("NSPersistentCloudKitContainerEncryptedAttributeKey"), v31, v33, NSStringFromSelector(sel_BOOLValue)));
    }
    if (objc_msgSend(a3, "allowsCloudEncryption"))
      objc_msgSend(*(id *)(a1 + 72), "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@ - Encryption value should be set via -[NSAttributeDescription allowsCloudEncryption], please remove usage of 'NSPersistentCloudKitContainerEncryptedAttributeKey'"), objc_msgSend(*(id *)(a1 + 48), "name"), objc_msgSend(a3, "name")));
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "useDeviceToDeviceEncryption"))
      objc_msgSend(*(id *)(a1 + 72), "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@ - Partial encryption cannot be used with device-to-device encryption"), objc_msgSend(*(id *)(a1 + 48), "name"), objc_msgSend(a3, "name")));
  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "useDeviceToDeviceEncryption")
    && objc_msgSend(a3, "allowsCloudEncryption"))
  {
    objc_msgSend(*(id *)(a1 + 72), "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@ - Device-to-Device encryption cannot be used with partial encryption"), objc_msgSend(*(id *)(a1 + 48), "name"), objc_msgSend(a3, "name")));
  }
  if (objc_msgSend(a3, "preservesValueInHistoryOnDeletion"))
    objc_msgSend(*(id *)(a1 + 80), "addObject:", a2);
  if ((objc_msgSend(a3, "isOptional") & 1) == 0 && !objc_msgSend(a3, "defaultValue"))
    objc_msgSend(*(id *)(a1 + 88), "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %@"), objc_msgSend(*(id *)(a1 + 48), "name"), objc_msgSend(a3, "name")));
  result = objc_msgSend(a3, "usesMergeableStorage");
  if ((_DWORD)result)
  {
    if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 40))
      return objc_msgSend(*(id *)(a1 + 96), "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Attributes that use mergeable storage (%@: %@) are unsupported in CloudKit. Please file a radar to Core Data to request support."), objc_msgSend(*(id *)(a1 + 48), "name"), objc_msgSend(a3, "name")));
  }
  return result;
}

uint64_t __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  __CFString *v12;

  if ((objc_msgSend(a3, "isOptional") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %@"), objc_msgSend(*(id *)(a1 + 40), "name"), a2));
  if (!objc_msgSend(a3, "inverseRelationship"))
    objc_msgSend(*(id *)(a1 + 48), "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %@"), objc_msgSend(*(id *)(a1 + 40), "name"), a2));
  if (objc_msgSend(a3, "isOrdered"))
    objc_msgSend(*(id *)(a1 + 56), "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %@"), objc_msgSend(*(id *)(a1 + 40), "name"), a2));
  if (objc_msgSend(a3, "destinationEntity")
    && (objc_msgSend(*(id *)(a1 + 64), "containsObject:", objc_msgSend(a3, "destinationEntity")) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 72), "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %@ - %@"), objc_msgSend(*(id *)(a1 + 40), "name"), a2, objc_msgSend((id)objc_msgSend(a3, "destinationEntity"), "name")));
  }
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", CFSTR("NSCloudKitMirroringDelegateIgnoredPropertyKey")), "BOOLValue"))objc_msgSend(*(id *)(a1 + 80), "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), objc_msgSend(*(id *)(a1 + 40), "name"), objc_msgSend(a3, "name")));
  if (objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", CFSTR("NSPersistentCloudKitContainerEncryptedAttributeKey")))
  {
    objc_msgSend(*(id *)(a1 + 88), "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), objc_msgSend(*(id *)(a1 + 40), "name"), objc_msgSend(a3, "name")));
  }
  result = objc_msgSend(a3, "deleteRule");
  if (result == 3)
  {
    v7 = *(void **)(a1 + 96);
    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = objc_msgSend(*(id *)(a1 + 40), "name");
    v10 = objc_msgSend(a3, "name");
    v11 = objc_msgSend(a3, "deleteRule");
    objc_opt_self();
    if (v11 > 3)
      v12 = 0;
    else
      v12 = off_1E1EDD3B0[v11];
    return objc_msgSend(v7, "addObject:", objc_msgSend(v8, "stringWithFormat:", CFSTR("%@:%@ - %@"), v9, v10, v12));
  }
  return result;
}

void __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v4;
  _QWORD v5[6];

  v4 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_4;
  v5[3] = &unk_1E1EDD320;
  v5[4] = *(_QWORD *)(a1 + 32);
  v5[5] = v4;
  objc_msgSend(a2, "enumerateObjectsUsingBlock:", v5);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %@"), objc_msgSend(*(id *)(a1 + 32), "name"), v4));

}

void __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v2 = a2;
  v19 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a2, "isNSString") & 1) != 0)
  {
LABEL_4:
    if (v2)
    {
      if (objc_msgSend(*(id *)(a1 + 40), "length"))
        objc_msgSend(*(id *)(a1 + 40), "appendString:", CFSTR(", "));
      objc_msgSend(*(id *)(a1 + 40), "appendString:", v2);
    }
    return;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = (void *)objc_msgSend(v2, "name");
    goto LABEL_4;
  }
  v4 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "PFCloudKitModelValidator was handed an entity with unique constraints that aren't attributes or strings: %@ - %@");
  v5 = objc_msgSend(*(id *)(a1 + 32), "name");
  objc_msgSend(*(id *)(a1 + 32), "uniquenessConstraints");
  _NSCoreDataLog(17, v4, v6, v7, v8, v9, v10, v11, v5);
  v12 = __pflogFaultLog;
  if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
  {
    v13 = objc_msgSend(*(id *)(a1 + 32), "name");
    v14 = objc_msgSend(*(id *)(a1 + 32), "uniquenessConstraints");
    *(_DWORD *)buf = 138412546;
    v16 = v13;
    v17 = 2112;
    v18 = v14;
    _os_log_fault_impl(&dword_18A253000, v12, OS_LOG_TYPE_FAULT, "CoreData: PFCloudKitModelValidator was handed an entity with unique constraints that aren't attributes or strings: %@ - %@", buf, 0x16u);
  }
}

void __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_60()
{
  void *v0;
  _QWORD v1[3];

  v1[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x18D76B4E4]();
  v1[0] = CFSTR("ckRecordID");
  v1[1] = CFSTR("ckRecordSystemFields");
  qword_1ECD8D8A0 = (uint64_t)(id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1, 2);
  objc_autoreleasePoolPop(v0);
}

uint64_t __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_2_76(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));
  return objc_msgSend(*(id *)(a1 + 32), "appendString:", a2);
}

uint64_t __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_3_82(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));
  return objc_msgSend(*(id *)(a1 + 32), "appendString:", a2);
}

uint64_t __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_4_85(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));
  return objc_msgSend(*(id *)(a1 + 32), "appendString:", a2);
}

uint64_t __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_5(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));
  return objc_msgSend(*(id *)(a1 + 32), "appendString:", a2);
}

uint64_t __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_6(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));
  return objc_msgSend(*(id *)(a1 + 32), "appendString:", a2);
}

uint64_t __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_7(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));
  return objc_msgSend(*(id *)(a1 + 32), "appendString:", a2);
}

uint64_t __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_8(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));
  return objc_msgSend(*(id *)(a1 + 32), "appendString:", a2);
}

uint64_t __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_9(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));
  return objc_msgSend(*(id *)(a1 + 32), "appendString:", a2);
}

uint64_t __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_10(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));
  return objc_msgSend(*(id *)(a1 + 32), "appendString:", a2);
}

uint64_t __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_11(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));
  return objc_msgSend(*(id *)(a1 + 32), "appendString:", a2);
}

uint64_t __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_12(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));
  return objc_msgSend(*(id *)(a1 + 32), "appendString:", a2);
}

uint64_t __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_13(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));
  return objc_msgSend(*(id *)(a1 + 32), "appendString:", a2);
}

uint64_t __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_14(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));
  return objc_msgSend(*(id *)(a1 + 32), "appendString:", a2);
}

uint64_t __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_15(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));
  return objc_msgSend(*(id *)(a1 + 32), "appendString:", a2);
}

uint64_t __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_16(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));
  return objc_msgSend(*(id *)(a1 + 32), "appendString:", a2);
}

uint64_t __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_17(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));
  return objc_msgSend(*(id *)(a1 + 32), "appendString:", a2);
}

uint64_t __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_18(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));
  return objc_msgSend(*(id *)(a1 + 32), "appendString:", a2);
}

void __57__PFCloudKitModelValidator_enforceUniqueConstraintChecks__block_invoke()
{
  const char *v0;

  if (!(_BYTE)dword_1ECD8DE20 || (v0 = getprogname()) != 0 && !strncmp("routined", v0, 8uLL))
    _MergedGlobals_65 = 1;
}

@end
