@implementation HDUserDomainConceptEntity

+ (id)databaseTable
{
  return CFSTR("user_domain_concepts");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 15;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_93;
}

+ (id)privateSubEntities
{
  _QWORD v3[7];

  v3[6] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  v3[2] = objc_opt_class();
  v3[3] = objc_opt_class();
  v3[4] = objc_opt_class();
  v3[5] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 6);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)joinClausesForProperty:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char **v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *i;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  BOOL v32;
  void *v33;
  void *v34;
  void *v35;
  char *v37;
  id v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  objc_super v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "containsString:", CFSTR("||")) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    +[HDUserDomainConceptEntityRegistry sharedInstance](HDUserDomainConceptEntityRegistry, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "registeredUserDomainConceptEntityClasses");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
    if (v8)
    {
      v9 = v8;
      v10 = &selRef__loadFeatureEvaluators;
      v11 = *(_QWORD *)v50;
      v39 = v7;
      v40 = v4;
      v38 = a1;
      v42 = *(_QWORD *)v50;
LABEL_5:
      v12 = 0;
      v37 = v10[24];
      v41 = v9;
      while (1)
      {
        if (*(_QWORD *)v50 != v11)
          objc_enumerationMutation(v7);
        v13 = *(id *)(*((_QWORD *)&v49 + 1) + 8 * v12);
        if (objc_msgSend(v13, "hasColumnWithName:", v4))
          break;
        if (objc_msgSend(v4, "rangeOfString:", CFSTR(".")) != 0x7FFFFFFFFFFFFFFFLL)
        {
          v46 = v12;
          v14 = v4;
          v15 = objc_opt_self();
          objc_msgSend(v14, "componentsSeparatedByString:", CFSTR("."));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v16, "count") != 2)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", v37, v15, CFSTR("HDUserDomainConceptEntity.m"), 193, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[components count] == 2"));

            v9 = v41;
          }
          objc_msgSend(v16, "firstObject");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = v16;
          objc_msgSend(v16, "lastObject");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = 0u;
          v54 = 0u;
          v55 = 0u;
          v56 = 0u;
          v44 = v13;
          objc_msgSend(v13, "privateSubEntities");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v5 = (id)objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
          if (v5)
          {
            v43 = (void *)v15;
            v19 = *(_QWORD *)v54;
            while (2)
            {
              for (i = 0; i != v5; i = (char *)i + 1)
              {
                if (*(_QWORD *)v54 != v19)
                  objc_enumerationMutation(v18);
                v21 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)i);
                objc_msgSend(v21, "joinClausesForProperty:", v14);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "databaseTable");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v23, "isEqualToString:", v17))
                  v24 = objc_msgSend(v21, "hasColumnWithName:", v47);
                else
                  v24 = 0;

                if ((v24 & 1) != 0 || v22)
                {
                  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
                  if (v43 != v44)
                  {
                    v25 = (void *)MEMORY[0x1E0D29870];
                    objc_msgSend(v43, "disambiguatedDatabaseTable");
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v25, "leftJoinClauseFromTable:toTargetEntity:as:localReference:targetKey:", v26, v44, 0, CFSTR("udc_id"), CFSTR("udc_id"));
                    v27 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v5, "addObject:", v27);
                  }
                  v7 = v39;
                  if (objc_msgSend(v21, "hasColumnWithName:", CFSTR("udc_id")))
                  {
                    v28 = (void *)MEMORY[0x1E0D29870];
                    objc_msgSend(v44, "disambiguatedDatabaseTable");
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v28, "leftJoinClauseFromTable:toTargetEntity:as:localReference:targetKey:", v29, v21, 0, CFSTR("udc_id"), CFSTR("udc_id"));
                    v30 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v5, "addObject:", v30);
                  }
                  objc_msgSend(v5, "unionSet:", v22);

                  v4 = v40;
                  a1 = v38;
                  goto LABEL_30;
                }
              }
              v5 = (id)objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
              if (v5)
                continue;
              break;
            }
            v7 = v39;
            v4 = v40;
            a1 = v38;
LABEL_30:
            v9 = v41;
          }

          v11 = v42;
          v12 = v46;
          if (v5)
            goto LABEL_41;
        }
        if (++v12 == v9)
        {
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
          v10 = &selRef__loadFeatureEvaluators;
          if (v9)
            goto LABEL_5;
          goto LABEL_40;
        }
      }
      if (v13)
        v32 = v13 == a1;
      else
        v32 = 1;
      if (!v32)
      {
        v33 = (void *)MEMORY[0x1E0D29870];
        objc_msgSend(a1, "disambiguatedDatabaseTable");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "leftJoinClauseFromTable:toTargetEntity:as:localReference:targetKey:", v34, v13, 0, CFSTR("udc_id"), CFSTR("udc_id"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v35);
        v5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_41:
        goto LABEL_42;
      }
    }
LABEL_40:

    v48.receiver = a1;
    v48.super_class = (Class)&OBJC_METACLASS___HDUserDomainConceptEntity;
    objc_msgSendSuper2(&v48, sel_joinClausesForProperty_, v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_42:

  return v5;
}

+ (id)disambiguatedSQLForProperty:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D29618]))
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(a1, "disambiguatedDatabaseTable");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@.%@"), v6, CFSTR("udc_id"));
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = v4;
    objc_opt_self();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    +[HDUserDomainConceptEntityRegistry sharedInstance](HDUserDomainConceptEntityRegistry, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "registeredUserDomainConceptEntityClasses");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (id)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v20 != v12)
            objc_enumerationMutation(v10);
          v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
          if ((objc_msgSend(v14, "hasColumnWithName:", v8) & 1) != 0)
          {
            v11 = v14;
            goto LABEL_13;
          }
        }
        v11 = (id)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v11)
          continue;
        break;
      }
    }
LABEL_13:

    v15 = v11;
    if (v15)
    {
      v16 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v15, "disambiguatedDatabaseTable");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithFormat:", CFSTR("%@.%@"), v17, v8);
      v7 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = v8;
    }
  }

  return v7;
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)defaultForeignKey
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D29858]), "initWithEntityClass:property:deletionAction:", a1, CFSTR("udc_id"), 2);
}

+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  _HDUserDomainConceptEncoder *v15;

  v11 = a7;
  v12 = a6;
  v13 = a4;
  v14 = a3;
  v15 = -[HDEntityEncoder initWithHealthEntityClass:profile:transaction:purpose:encodingOptions:authorizationFilter:]([_HDUserDomainConceptEncoder alloc], "initWithHealthEntityClass:profile:transaction:purpose:encodingOptions:authorizationFilter:", objc_opt_class(), v14, v13, a5, v12, v11);

  return v15;
}

+ (id)propertyForSyncProvenance
{
  return CFSTR("sync_provenance");
}

+ (id)propertyForSyncAnchor
{
  return CFSTR("sync_anchor");
}

+ (id)propertyForSyncIdentity
{
  return CFSTR("sync_identity");
}

+ (int64_t)storeUserDomainConcept:(id)a3 method:(int64_t)a4 syncProvenance:(int64_t)a5 syncIdentity:(int64_t)a6 syncVersion:(id)a7 profile:(id)a8 transaction:(id)a9 error:(id *)a10
{
  return +[HDUserDomainConceptEntity _storeUserDomainConcept:method:syncProvenance:syncIdentity:syncVersion:profile:transaction:error:]((uint64_t)a1, a3, a4, a5, a6, *(_QWORD *)&a7, a8, a9, a10);
}

+ (uint64_t)_storeUserDomainConcept:(uint64_t)a3 method:(uint64_t)a4 syncProvenance:(uint64_t)a5 syncIdentity:(uint64_t)a6 syncVersion:(void *)a7 profile:(void *)a8 transaction:(_QWORD *)a9 error:
{
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  void *v42;
  uint64_t v43;
  void *v44;
  BOOL v45;
  id v46;
  uint64_t v47;
  char v48;
  char v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  uint64_t (*v51)(uint64_t, uint64_t);
  id v52;
  id v53;
  id v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  id v61;
  void *v62;
  id v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  uint64_t v66;
  NSObject *v67;
  uint64_t (*v68)(uint64_t, uint64_t);
  id v69;
  double v70;
  double v71;
  double v72;
  uint64_t (*v73)(uint64_t, uint64_t);
  id v74;
  uint64_t (*v75)(uint64_t, uint64_t);
  void *v76;
  uint64_t (*v77)(uint64_t, uint64_t);
  void *v78;
  void *v79;
  id v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  id v85;
  void *v86;
  void *v87;
  id v88;
  id v89;
  void *v90;
  id v91;
  void *v92;
  void *v93;
  void *v94;
  uint64_t (*v95)(uint64_t, uint64_t);
  NSObject *v96;
  _BOOL4 v97;
  NSObject *v98;
  uint64_t (*v99)(uint64_t, uint64_t);
  id v100;
  id v101;
  uint64_t (*v102)(uint64_t, uint64_t);
  id v103;
  uint64_t (*v104)(uint64_t, uint64_t);
  void *v105;
  uint64_t v106;
  void *v107;
  void *v108;
  uint64_t v109;
  id v110;
  void *v111;
  void *v112;
  uint64_t i;
  objc_class *v114;
  void *v115;
  uint64_t v116;
  void *v117;
  void *v118;
  id v119;
  id v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  BOOL v128;
  uint64_t v129;
  id v130;
  id v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  __CFString *v136;
  void *v137;
  void *v138;
  void *v139;
  id v140;
  char v141;
  void *v142;
  int v143;
  void *v144;
  id v145;
  void *v146;
  void *v147;
  uint64_t v148;
  int v149;
  id v150;
  void *v151;
  void *v152;
  void *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t j;
  objc_class *v157;
  void *v158;
  void *v159;
  int v160;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  id v166;
  id v167;
  id v168;
  int v169;
  void *v170;
  id v171;
  void **v172;
  id v173;
  id v174;
  char v175;
  void *v176;
  void *v177;
  id v178;
  uint64_t v179;
  void *v180;
  id v181;
  void *v182;
  id v183;
  id obj;
  id obja;
  uint64_t v186;
  void *v187;
  uint64_t (*v188)(uint64_t, uint64_t);
  uint64_t v189;
  void *v190;
  id v191;
  uint64_t (*v192)(uint64_t, uint64_t);
  uint64_t v193;
  uint64_t (*v194)(uint64_t, uint64_t);
  id v195;
  id v196;
  id v197;
  uint64_t (*v198)(uint64_t, uint64_t);
  uint64_t v199;
  id v200;
  int v201;
  id v202;
  uint64_t v203;
  id v204;
  void *v205;
  id v206;
  id v207;
  uint64_t v208;
  id v209;
  void *v210;
  void *v211;
  id v213;
  id v214;
  id v215;
  void *v216;
  id v217;
  uint64_t v218;
  uint64_t v219;
  void *v220;
  void *v221;
  void **v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  void *v227;
  void **v228;
  uint64_t v229;
  char v230;
  const __CFString *v231;
  _BYTE buf[24];
  uint64_t (*v233)(uint64_t, uint64_t);
  _BYTE v234[32];
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;

  v237 = *MEMORY[0x1E0C80C00];
  v14 = a2;
  v15 = a7;
  v16 = a8;
  v17 = objc_opt_self();
  v208 = a5;
  objc_msgSend(v14, "setHealthd_use_only_syncEntityIdentity:", a5);
  v217 = 0;
  v18 = v14;
  v214 = v15;
  v19 = v16;
  v203 = v17;
  v20 = (void *)objc_opt_self();
  v21 = v18;
  v215 = v19;
  v22 = objc_opt_self();
  v216 = v21;
  objc_msgSend(v21, "linkCollection");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    +[HDUserDomainConceptEntity _linkCollectionToPersistGivenLinkCollection:transaction:error:](v22, v23, v215, (uint64_t)&v217);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v24)
    {
      v25 = 0;
      goto LABEL_11;
    }
  }
  else
  {
    v24 = 0;
  }
  objc_msgSend(v215, "protectedDatabase");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&v223 = MEMORY[0x1E0C809B0];
  *((_QWORD *)&v223 + 1) = 3221225472;
  *(_QWORD *)&v224 = __104__HDUserDomainConceptEntity__insertBaseUserDomainConcept_syncProvenance_syncIdentity_transaction_error___block_invoke;
  *((_QWORD *)&v224 + 1) = &__block_descriptor_40_e15___NSString_8__0l;
  *(_QWORD *)&v225 = v22;
  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = __104__HDUserDomainConceptEntity__insertBaseUserDomainConcept_syncProvenance_syncIdentity_transaction_error___block_invoke_2;
  v233 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E6D0D5C0;
  v27 = v216;
  *(_QWORD *)v234 = v27;
  *(_QWORD *)&v234[16] = a4;
  *(_QWORD *)&v234[24] = v208;
  v235 = v22;
  v28 = v24;
  *(_QWORD *)&v234[8] = v28;
  if (!objc_msgSend(v26, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &_insertBaseUserDomainConcept_syncProvenance_syncIdentity_transaction_error__statementKey, &v217, &v223, buf, 0))goto LABEL_9;
  if ((int)objc_msgSend(v26, "getChangesCount") < 1)
  {
    v29 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(v27, "UUID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "hk_assignError:code:format:", &v217, 115, CFSTR("Duplicate User Domain Concept with UUID %@"), v30);

LABEL_9:
    v25 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v26, "lastInsertRowID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

LABEL_11:
  if (!v25)
    goto LABEL_24;
  if (!objc_msgSend(v216, "isDeleted")
    || (objc_msgSend(v216, "UUID"),
        v31 = (void *)objc_claimAutoreleasedReturnValue(),
        v32 = +[HDUserDomainConceptEntity _updateLinkCollectionDataByRemovingTargetUUID:syncProvenance:syncIdentity:transaction:error:]((uint64_t)v20, v31, a4, v208, v215, (uint64_t)&v217), v31, v32))
  {
    v33 = objc_msgSend(v25, "longLongValue");
    if (objc_msgSend(v20, "insertPrivateDataEnitiesForUserDomainConcept:userDomainConceptID:transaction:error:", v216, v33, v215, &v217))
    {
      objc_msgSend(v214, "daemon");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "userDomainConceptEntityRegistry");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v216, "identifier");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = (void *)objc_msgSend(v35, "userDomainConceptEntityClassForTypeIdentifier:", v36);

      if (!v37 || v37 == (void *)objc_opt_class())
      {
        v32 = 1;
        goto LABEL_25;
      }
      v38 = v216;
      v39 = v215;
      objc_opt_self();
      if (!objc_msgSend(v37, "insertConcreteUserDomainConcept:userDomainConceptID:transaction:error:", v38, v33, v39, &v217)|| !objc_msgSend(v37, "insertPrivateDataEnitiesForUserDomainConcept:userDomainConceptID:transaction:error:", v38, v33, v39, &v217))
      {
        goto LABEL_61;
      }
      if (!objc_msgSend(v37, "supportsHidingSemanticDuplicates"))
        goto LABEL_59;
      v40 = v38;
      v41 = v39;
      v42 = (void *)objc_opt_self();
      v43 = objc_msgSend(v42, "evaluateIsCanonicalConcept:entityClass:transaction:error:", v40, v37, v41, &v217);
      if (!v43)
        goto LABEL_60;
      if (v43 == 2)
      {
        v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6CF0]), "initWithType:version:BOOLValue:", 2, 1, 1);
        v45 = +[HDUserDomainConceptPropertyEntity insertDeviceLocalProperty:userDomainConceptID:transaction:error:](HDUserDomainConceptPropertyEntity, "insertDeviceLocalProperty:userDomainConceptID:transaction:error:", v44, v33, v41, &v217);

        if (!v45)
          goto LABEL_61;
LABEL_59:
        v32 = 1;
LABEL_62:

        goto LABEL_25;
      }
      if (+[HDUserDomainConceptEntity _removeIsHiddenDeviceLocalPropertyForUserDomainConceptWithPersistentID:transaction:error:]((uint64_t)v42, v33, v41, (uint64_t)&v217))
      {
        v80 = v41;
        v213 = v40;
        v81 = (void *)objc_opt_self();
        v82 = (void *)MEMORY[0x1E0D29840];
        objc_msgSend(v37, "predicateMatchingSemanticDuplicatesOf:", v213);
        v83 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v81, "ignoreHiddenConceptsPredicate");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "compoundPredicateWithPredicate:otherPredicate:", v83, v84);
        v211 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v80, "databaseForEntityClass:", v81);
        v205 = (void *)objc_claimAutoreleasedReturnValue();
        v85 = objc_alloc_init(MEMORY[0x1E0D298A0]);
        objc_msgSend(v85, "setEntityClass:", v81);
        objc_msgSend(v85, "setPredicate:", v211);
        objc_msgSend(v85, "setReturnsDistinctEntities:", 1);
        v86 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D29898]), "initWithDatabase:descriptor:", v205, v85);
        v87 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6CF0]), "initWithType:version:BOOLValue:", 2, 1, 1);
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __92__HDUserDomainConceptEntity__hideSemanticDuplicatesOfConcept_entityClass_transaction_error___block_invoke;
        v233 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E6CF5F50;
        *(_QWORD *)v234 = v87;
        *(_QWORD *)&v234[8] = v80;
        v88 = v80;
        v89 = v87;
        v201 = objc_msgSend(v86, "enumeratePersistentIDsAndProperties:error:enumerationHandler:", MEMORY[0x1E0C9AA60], &v217, buf);

        if (v201)
          goto LABEL_59;
      }
      else
      {
LABEL_60:

      }
LABEL_61:
      v32 = 0;
      goto LABEL_62;
    }
LABEL_24:
    v32 = 0;
  }
LABEL_25:

  v46 = v217;
  v210 = v46;
  if (v32)
  {
    +[HDUserDomainConceptEntity _notifyObserversForUserDomainConcept:update:profile:transaction:](v203, v216, 0, v214, v215);
    v47 = 1;
    goto LABEL_152;
  }
  v48 = objc_msgSend(v46, "hk_isDuplicateObjectError");
  if (a3 == 1)
    v49 = 0;
  else
    v49 = v48;
  if ((v49 & 1) == 0)
  {
    v59 = v210;
    v60 = v59;
    if (v59)
    {
      if (a9)
        *a9 = objc_retainAutorelease(v59);
      else
        _HKLogDroppedError();
    }

    v47 = 0;
    goto LABEL_152;
  }
  v50 = v216;
  if (a3 != 2)
    goto LABEL_87;
  v51 = v50;
  v52 = v215;
  v53 = v214;
  objc_opt_self();
  objc_msgSend(v51, "UUID");
  v54 = (id)objc_claimAutoreleasedReturnValue();
  v204 = v53;
  v55 = v52;
  v56 = (void *)objc_opt_self();
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v233 = __Block_byref_object_copy__185;
  *(_QWORD *)v234 = __Block_byref_object_dispose__185;
  *(_QWORD *)&v234[8] = 0;
  objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:value:comparisonType:", CFSTR("uuid"), v54, 1);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&v223 = MEMORY[0x1E0C809B0];
  *((_QWORD *)&v223 + 1) = 3221225472;
  *(_QWORD *)&v224 = __82__HDUserDomainConceptEntity__userDomainConceptWithUUID_profile_transaction_error___block_invoke;
  *((_QWORD *)&v224 + 1) = &unk_1E6D019C0;
  *(_QWORD *)&v225 = buf;
  if (objc_msgSend(v56, "enumerateUserDomainConceptsWithPredicate:profile:transaction:error:enumerationHandler:", v57, v204, v55, a9, &v223))v58 = *(void **)(*(_QWORD *)&buf[8] + 40);
  else
    v58 = 0;
  v61 = v58;

  _Block_object_dispose(buf, 8);
  v62 = v61;
  if (v61)
  {
    v198 = v51;
    v200 = v61;
    v63 = v55;
    v64 = objc_opt_self();
    if (objc_msgSend(v200, "isDeleted"))
    {
      v65 = (uint64_t (*)(uint64_t, uint64_t))v200;
      v66 = 1;
LABEL_82:

      v62 = v61;
      goto LABEL_83;
    }
    if (objc_msgSend(v198, "isDeleted"))
    {
      _HKInitializeLogging();
      HKLogHealthOntology();
      v67 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138544642;
        *(_QWORD *)&buf[4] = v64;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v200;
        *(_WORD *)&buf[22] = 2114;
        v233 = v198;
        *(_WORD *)v234 = 2048;
        *(_QWORD *)&v234[2] = a4;
        *(_WORD *)&v234[10] = 2048;
        *(_QWORD *)&v234[12] = (int)a6;
        *(_WORD *)&v234[20] = 2048;
        *(_QWORD *)&v234[22] = a6 >> 32;
        _os_log_impl(&dword_1B7802000, v67, OS_LOG_TYPE_DEFAULT, "%{public}@: replace %{public}@ with %{public}@. sync_provenance=%ld, syncVersion=(%ld, %ld)", buf, 0x3Eu);
      }

      v65 = v198;
      v66 = 2;
      goto LABEL_82;
    }
    v68 = v198;
    v69 = v200;
    v186 = objc_opt_self();
    v196 = v69;
    v192 = v68;
    objc_msgSend(v192, "modificationTimestamp");
    v71 = v70;
    objc_msgSend(v196, "modificationTimestamp");
    if (v71 <= v72)
    {
      v66 = 1;
      v194 = (uint64_t (*)(uint64_t, uint64_t))v196;
      v73 = v192;
    }
    else
    {

      v73 = v196;
      v66 = 2;
      v194 = v192;
    }
    v190 = v73;
    if (SHIDWORD(a6) > 3)
    {
      v77 = (uint64_t (*)(uint64_t, uint64_t))objc_msgSend(v194, "copyUserDomainConceptByMergingInConcept:", v73);
LABEL_75:
      v95 = v194;
      if (v77 != v194)
      {
        _HKInitializeLogging();
        HKLogHealthOntology();
        v96 = objc_claimAutoreleasedReturnValue();
        v97 = os_log_type_enabled(v96, OS_LOG_TYPE_INFO);

        if (v97)
        {
          HKLogHealthOntology();
          v98 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v98, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)&buf[4] = v186;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v194;
            *(_WORD *)&buf[22] = 2114;
            v233 = v77;
            _os_log_impl(&dword_1B7802000, v98, OS_LOG_TYPE_INFO, "%{public}@: Update UDC %{public}@ -> %{public}@", buf, 0x20u);
          }

        }
        v66 = 3;
        v95 = v77;
      }
      v65 = v95;

      goto LABEL_82;
    }
    obj = v196;
    v188 = v194;
    v74 = v73;
    v75 = v192;
    objc_opt_self();
    objc_msgSend(v74, "propertyCollection");
    v76 = (void *)objc_claimAutoreleasedReturnValue();

    v77 = (uint64_t (*)(uint64_t, uint64_t))objc_msgSend(v188, "copyUserDomainConceptByMergingInPropertyCollection:", v76);
    if (v188 != v75)
    {
LABEL_74:

      goto LABEL_75;
    }
    objc_msgSend(obj, "linkCollection");
    v182 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "linkCollection");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v180 = v78;
    if (v78)
    {
      objc_msgSend(v78, "links");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v182, "collectionByMergingInLegacyArrayOfLinks:", v79);
      v177 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v182, "collectionByRemovingAllLinks");
      v177 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v90 = v180;
    if (v182)
      v90 = v177;
    v178 = v90;
    objc_msgSend(v77, "linkCollection");
    v91 = (id)objc_claimAutoreleasedReturnValue();
    if (v178 == v91)
    {

    }
    else
    {
      objc_msgSend(v77, "linkCollection");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      if (v92)
      {
        objc_msgSend(v77, "linkCollection");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        v175 = objc_msgSend(v178, "isEqual:", v93);

        if ((v175 & 1) != 0)
          goto LABEL_73;
      }
      else
      {

      }
      objc_msgSend(v77, "modificationCopy");
      v94 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v94, "_setLinkCollection:", v178);
      v77 = (uint64_t (*)(uint64_t, uint64_t))v94;
    }
LABEL_73:

    goto LABEL_74;
  }
  v65 = 0;
  v66 = 1;
LABEL_83:

  v50 = v65;
  if (!v65)
  {
    v47 = 0;
    goto LABEL_151;
  }
  if (v66 == 1)
  {
    v47 = 3;
    goto LABEL_151;
  }
  if (v66 == 3)
  {
    v208 = objc_msgSend(v204, "currentSyncIdentityPersistentID");
    a4 = 0;
    v50 = v65;
  }
LABEL_87:
  v99 = v50;
  v100 = v214;
  v101 = v215;
  v176 = (void *)objc_opt_self();
  v102 = v99;
  v183 = v100;
  v103 = v101;
  v179 = objc_opt_self();
  v104 = v102;
  v191 = v103;
  objc_opt_self();
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v233 = __Block_byref_object_copy__185;
  *(_QWORD *)v234 = __Block_byref_object_dispose__185;
  *(_QWORD *)&v234[8] = 0;
  objc_msgSend(v191, "protectedDatabase");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = MEMORY[0x1E0C809B0];
  *(_QWORD *)&v223 = MEMORY[0x1E0C809B0];
  *((_QWORD *)&v223 + 1) = 3221225472;
  *(_QWORD *)&v224 = __88__HDUserDomainConceptEntity__userDomainConceptIDForUserDomainConcept_transaction_error___block_invoke_2;
  *((_QWORD *)&v224 + 1) = &unk_1E6CE9508;
  *(_QWORD *)&v225 = v104;
  v218 = v106;
  v219 = 3221225472;
  v220 = __88__HDUserDomainConceptEntity__userDomainConceptIDForUserDomainConcept_transaction_error___block_invoke_3;
  v221 = &unk_1E6CE8540;
  v222 = (void **)buf;
  v202 = (id)v225;
  if (objc_msgSend(v105, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &_userDomainConceptIDForUserDomainConcept_transaction_error__statementKey, a9, &__block_literal_global_324, &v223, &v218))v107 = *(void **)(*(_QWORD *)&buf[8] + 40);
  else
    v107 = 0;
  v181 = v107;

  _Block_object_dispose(buf, 8);
  if (!v181)
  {
    v209 = 0;
    goto LABEL_135;
  }
  objc_msgSend(v202, "linkCollection");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  if (v108)
  {
    +[HDUserDomainConceptEntity _linkCollectionToPersistGivenLinkCollection:transaction:error:](v179, v108, v191, (uint64_t)a9);
    v109 = objc_claimAutoreleasedReturnValue();

    if (!v109)
    {
      v110 = 0;
      v209 = 0;
      goto LABEL_134;
    }
  }
  else
  {
    v109 = 0;
  }
  v170 = (void *)v109;
  if (!objc_msgSend(v202, "isDeleted"))
    goto LABEL_127;
  v199 = objc_msgSend(v181, "longLongValue");
  v173 = v183;
  v174 = v191;
  objc_opt_self();
  objc_msgSend(v174, "databaseForEntityClass:", objc_opt_class());
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  v225 = 0u;
  v226 = 0u;
  v223 = 0u;
  v224 = 0u;
  objc_msgSend(v173, "daemon");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "userDomainConceptEntityRegistry");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "registeredUserDomainConceptEntityClasses");
  obja = (id)objc_claimAutoreleasedReturnValue();

  v193 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v223, buf, 16);
  if (!v193)
    goto LABEL_126;
  v189 = *(_QWORD *)v224;
  while (2)
  {
    for (i = 0; i != v193; ++i)
    {
      if (*(_QWORD *)v224 != v189)
        objc_enumerationMutation(obja);
      v114 = *(objc_class **)(*((_QWORD *)&v223 + 1) + 8 * i);
      if (v114 != (objc_class *)objc_opt_class())
      {
        v115 = (void *)objc_msgSend([v114 alloc], "initWithPersistentID:", v199);
        if (!objc_msgSend(v115, "existsInDatabase:", v187))
        {
LABEL_123:

          continue;
        }
        v206 = v174;
        v195 = v173;
        v116 = objc_opt_self();
        -[objc_class entityEncoderForProfile:transaction:purpose:encodingOptions:authorizationFilter:](v114, "entityEncoderForProfile:transaction:purpose:encodingOptions:authorizationFilter:", v195, v206, 1, 0, 0);
        v117 = (void *)objc_claimAutoreleasedReturnValue();

        +[HDUserDomainConceptEntity _userDomainConceptWithPersistentID:encoder:transaction:error:](v116, v199, v117, v206, a9);
        v118 = (void *)objc_claimAutoreleasedReturnValue();

        if (v118)
        {
          -[objc_class userDomainConceptClass](v114, "userDomainConceptClass");
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v197 = v118;
LABEL_110:

            if (!v197
              || !-[objc_class willDeleteConcreteUserDomainConcept:userDomainConceptID:syncProvenance:profile:transaction:error:](v114, "willDeleteConcreteUserDomainConcept:userDomainConceptID:syncProvenance:profile:transaction:error:", v197, v199, a4, v195, v206, a9))
            {
              goto LABEL_132;
            }
            if (-[objc_class supportsHidingSemanticDuplicates](v114, "supportsHidingSemanticDuplicates"))
            {
              v171 = v197;
              v119 = v206;
              objc_opt_self();
              v120 = v119;
              objc_opt_self();
              v227 = 0;
              v228 = &v227;
              v229 = 0x2020000000;
              v230 = 0;
              HDUserDomainConceptPropertyEntityPredicateForPropertiesWithType(2, 1);
              v121 = (void *)objc_claimAutoreleasedReturnValue();
              v122 = (void *)MEMORY[0x1E0D29838];
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v199);
              v123 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v122, "predicateWithProperty:equalToValue:", CFSTR("udc_id"), v123);
              v124 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(MEMORY[0x1E0D29840], "compoundPredicateWithPredicate:otherPredicate:", v124, v121);
              v125 = (void *)objc_claimAutoreleasedReturnValue();
              v231 = CFSTR("number_value");
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v231, 1);
              v126 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v120, "database");
              v127 = (void *)objc_claimAutoreleasedReturnValue();
              v218 = MEMORY[0x1E0C809B0];
              v219 = 3221225472;
              v220 = __95__HDUserDomainConceptEntity__isConceptHiddenFromEnumerationWithPersistentID_transaction_error___block_invoke;
              v221 = &unk_1E6D0D550;
              v222 = &v227;
              v128 = +[HDHealthEntity enumerateProperties:withPredicate:healthDatabase:error:enumerationHandler:](HDUserDomainConceptPropertyEntity, "enumerateProperties:withPredicate:healthDatabase:error:enumerationHandler:", v126, v125, v127, a9, &v218);

              if (v128)
                v129 = *((_BYTE *)v228 + 24) ? 1 : 2;
              else
                v129 = 0;

              _Block_object_dispose(&v227, 8);
              if (v129 == 2)
              {
                v130 = v120;
                v131 = v171;
                objc_opt_self();
                objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", CFSTR("deleted"), MEMORY[0x1E0C9AAA0]);
                v172 = (void **)objc_claimAutoreleasedReturnValue();
                v132 = (void *)MEMORY[0x1E0D29840];
                -[objc_class predicateMatchingSemanticDuplicatesOf:](v114, "predicateMatchingSemanticDuplicatesOf:", v131);
                v133 = (void *)objc_claimAutoreleasedReturnValue();

                v227 = v133;
                v228 = v172;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v227, 2);
                v134 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v132, "predicateMatchingAllPredicates:", v134);
                v135 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(MEMORY[0x1E0D29888], "orderingTermWithProperty:entityClass:ascending:", CFSTR("creation_date"), objc_opt_class(), 1);
                v136 = (__CFString *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v130, "protectedDatabase");
                v137 = (void *)objc_claimAutoreleasedReturnValue();
                v231 = v136;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v231, 1);
                v138 = (void *)objc_claimAutoreleasedReturnValue();
                +[HDSQLiteEntity queryWithDatabase:predicate:limit:orderingTerms:groupBy:](HDUserDomainConceptEntity, "queryWithDatabase:predicate:limit:orderingTerms:groupBy:", v137, v135, 1, v138, 0);
                v139 = (void *)objc_claimAutoreleasedReturnValue();

                v218 = MEMORY[0x1E0C809B0];
                v219 = 3221225472;
                v220 = __163__HDUserDomainConceptEntity__findNewDeviceLocalCanonicalConceptForConceptThatWillBeDeletedWithPersistentID_entityClass_conceptThatWillBeDeleted_transaction_error___block_invoke;
                v221 = &unk_1E6CE9FC0;
                v222 = (void **)v130;
                v140 = v130;
                v141 = objc_msgSend(v139, "enumeratePersistentIDsAndProperties:error:enumerationHandler:", MEMORY[0x1E0C9AA60], a9, &v218);

              }
              else
              {
                v141 = v129 == 1;

              }
              if ((v141 & 1) == 0)
              {
LABEL_132:

                goto LABEL_133;
              }
            }

            goto LABEL_123;
          }
          objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a9, 3, CFSTR("Concept of class %@ should not be inflated for entity %@"), objc_opt_class(), v114);
        }
        v197 = 0;
        goto LABEL_110;
      }
    }
    v193 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v223, buf, 16);
    if (v193)
      continue;
    break;
  }
LABEL_126:

  objc_msgSend(v202, "UUID");
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  v143 = +[HDUserDomainConceptEntity _updateLinkCollectionDataByRemovingTargetUUID:syncProvenance:syncIdentity:transaction:error:](v179, v142, a4, v208, v174, (uint64_t)a9);

  if (v143)
  {
LABEL_127:
    objc_msgSend(v191, "protectedDatabase");
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&v223 = MEMORY[0x1E0C809B0];
    *((_QWORD *)&v223 + 1) = 3221225472;
    *(_QWORD *)&v224 = __112__HDUserDomainConceptEntity__updateBaseUserDomainConcept_syncProvenance_syncIdentity_profile_transaction_error___block_invoke;
    *((_QWORD *)&v224 + 1) = &__block_descriptor_40_e15___NSString_8__0l;
    *(_QWORD *)&v225 = v179;
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __112__HDUserDomainConceptEntity__updateBaseUserDomainConcept_syncProvenance_syncIdentity_profile_transaction_error___block_invoke_2;
    v233 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E6D0D608;
    *(_QWORD *)v234 = v202;
    *(_QWORD *)&v234[24] = a4;
    v235 = v208;
    v236 = v179;
    v110 = v170;
    *(_QWORD *)&v234[8] = v110;
    v145 = v181;
    *(_QWORD *)&v234[16] = v145;
    if (objc_msgSend(v144, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &_updateBaseUserDomainConcept_syncProvenance_syncIdentity_profile_transaction_error__statementKey, a9, &v223, buf, 0))v146 = v145;
    else
      v146 = 0;
    v209 = v146;

  }
  else
  {
LABEL_133:
    v209 = 0;
    v110 = v170;
  }
LABEL_134:

LABEL_135:
  v147 = v209;
  if (!v209
    || (v148 = objc_msgSend(v209, "longLongValue"),
        v149 = objc_msgSend(v176, "updatePrivateDataEnitiesForUserDomainConcept:userDomainConceptID:syncProvenance:profile:transaction:error:", v202, v148, a4, v183, v191, a9), v147 = v209, !v149))
  {

LABEL_149:
    v47 = 0;
    goto LABEL_150;
  }
  v202 = v202;
  v207 = v183;
  v150 = v191;
  objc_opt_self();
  if (!objc_msgSend(v202, "isDeleted"))
  {
    objc_msgSend(v207, "daemon");
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v162, "userDomainConceptEntityRegistry");
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v202, "identifier");
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    v165 = (void *)objc_msgSend(v163, "userDomainConceptEntityClassForTypeIdentifier:", v164);

    if (!v165 || v165 == (void *)objc_opt_class())
      goto LABEL_157;
    v166 = v202;
    v167 = v207;
    v168 = v150;
    objc_opt_self();
    if ((objc_msgSend(v165, "updateConcreteUserDomainConcept:userDomainConceptID:transaction:error:", v166, v148, v168, a9) & 1) != 0)
    {
      v169 = objc_msgSend(v165, "updatePrivateDataEnitiesForUserDomainConcept:userDomainConceptID:syncProvenance:profile:transaction:error:", v166, v148, a4, v167, v168, a9);

      if (v169)
      {
LABEL_157:

        goto LABEL_158;
      }
    }
    else
    {

    }
    v47 = 0;
    v50 = (uint64_t (*)(uint64_t, uint64_t))v166;
    goto LABEL_151;
  }
  v225 = 0u;
  v226 = 0u;
  v223 = 0u;
  v224 = 0u;
  objc_msgSend(v207, "daemon");
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v151, "userDomainConceptEntityRegistry");
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v152, "registeredUserDomainConceptEntityClasses");
  v153 = (void *)objc_claimAutoreleasedReturnValue();

  v154 = objc_msgSend(v153, "countByEnumeratingWithState:objects:count:", &v223, buf, 16);
  if (v154)
  {
    v155 = *(_QWORD *)v224;
    while (2)
    {
      for (j = 0; j != v154; ++j)
      {
        if (*(_QWORD *)v224 != v155)
          objc_enumerationMutation(v153);
        v157 = *(objc_class **)(*((_QWORD *)&v223 + 1) + 8 * j);
        if (v157 != (objc_class *)objc_opt_class())
        {
          v158 = (void *)objc_msgSend([v157 alloc], "initWithPersistentID:", v148);
          objc_msgSend(v150, "protectedDatabase");
          v159 = (void *)objc_claimAutoreleasedReturnValue();
          v160 = objc_msgSend(v158, "deleteFromDatabase:error:", v159, a9);

          if (!v160)
          {

            goto LABEL_149;
          }
        }
      }
      v154 = objc_msgSend(v153, "countByEnumeratingWithState:objects:count:", &v223, buf, 16);
      if (v154)
        continue;
      break;
    }
  }

LABEL_158:
  +[HDUserDomainConceptEntity _notifyObserversForUserDomainConcept:update:profile:transaction:](v203, v202, 1, v207, v150);
  v47 = 2;
LABEL_150:
  v50 = (uint64_t (*)(uint64_t, uint64_t))v202;
LABEL_151:

LABEL_152:
  return v47;
}

+ (int64_t)storeUserDomainConcept:(id)a3 method:(int64_t)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  int64_t v15;

  v12 = a6;
  v13 = a5;
  v14 = a3;
  v15 = objc_msgSend(a1, "storeUserDomainConcept:method:syncProvenance:syncIdentity:syncVersion:profile:transaction:error:", v14, a4, 0, objc_msgSend(v13, "currentSyncIdentityPersistentID"), 0x400000000, v13, v12, a7);

  return v15;
}

+ (BOOL)deleteUserDomainConcept:(id)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  int v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a4;
  _HKInitializeLogging();
  HKLogHealthOntology();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138543618;
    v18 = a1;
    v19 = 2114;
    v20 = v10;
    _os_log_impl(&dword_1B7802000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: deleteUserDomainConcept: %{public}@", (uint8_t *)&v17, 0x16u);
  }

  objc_msgSend(v10, "deletedUserDomainConcept");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(a1, "storeUserDomainConcept:method:profile:transaction:error:", v14, 3, v12, v11, a6);

  return v15 != 0;
}

+ (BOOL)enumerateUserDomainConceptsWithPredicate:(id)a3 limit:(int64_t)a4 orderingTerms:(id)a5 profile:(id)a6 transaction:(id)a7 error:(id *)a8 enumerationHandler:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;

  v15 = a6;
  v16 = a7;
  v17 = a9;
  v18 = a5;
  v19 = a3;
  objc_msgSend(v16, "databaseForEntityClass:", a1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_alloc_init(MEMORY[0x1E0D298A0]);
  objc_msgSend(v21, "setEntityClass:", a1);
  objc_msgSend(v21, "setLimitCount:", a4);
  objc_msgSend(v21, "setOrderingTerms:", v18);

  objc_msgSend(v21, "setPredicate:", v19);
  objc_msgSend(v21, "setReturnsDistinctEntities:", 1);
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D29898]), "initWithDatabase:descriptor:", v20, v21);
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __135__HDUserDomainConceptEntity_enumerateUserDomainConceptsWithPredicate_limit_orderingTerms_profile_transaction_error_enumerationHandler___block_invoke;
  v27[3] = &unk_1E6D0D528;
  v28 = v15;
  v29 = v16;
  v30 = v17;
  v31 = a1;
  v23 = v17;
  v24 = v16;
  v25 = v15;
  LOBYTE(a8) = objc_msgSend(v22, "enumeratePersistentIDsAndProperties:error:enumerationHandler:", &unk_1E6DFA508, a8, v27);

  return (char)a8;
}

uint64_t __135__HDUserDomainConceptEntity_enumerateUserDomainConceptsWithPredicate_limit_orderingTerms_profile_transaction_error_enumerationHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;

  MEMORY[0x1BCCAB1D4](a4, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6D48]), "initWithCode:schema:", HDSQLiteColumnAsInt64(), v8);
  HDSQLiteColumnWithNameAsInt64();
  objc_msgSend(*(id *)(a1 + 32), "daemon");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "userDomainConceptEntityRegistry");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "userDomainConceptEntityClassForTypeIdentifier:", v9);

  objc_msgSend(v12, "entityEncoderForProfile:transaction:purpose:encodingOptions:authorizationFilter:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 1, 0, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDUserDomainConceptEntity _userDomainConceptWithPersistentID:encoder:transaction:error:](*(_QWORD *)(a1 + 56), a2, v13, *(void **)(a1 + 40), a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    v15 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  else
    v15 = 0;

  return v15;
}

+ (id)_userDomainConceptWithPersistentID:(void *)a3 encoder:(void *)a4 transaction:(_QWORD *)a5 error:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v8 = a3;
  v9 = a4;
  objc_opt_self();
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__185;
  v34 = __Block_byref_object_dispose__185;
  v35 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__185;
  v28 = __Block_byref_object_dispose__185;
  v29 = 0;
  v10 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v8, "entityClass")), "initWithPersistentID:", a2);
  objc_msgSend(v8, "orderedProperties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "protectedDatabase");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __90__HDUserDomainConceptEntity__userDomainConceptWithPersistentID_encoder_transaction_error___block_invoke;
  v19[3] = &unk_1E6D0D6E0;
  v21 = &v30;
  v13 = v8;
  v20 = v13;
  v22 = &v24;
  v23 = a2;
  LOBYTE(a2) = objc_msgSend(v10, "getValuesForProperties:database:error:handler:", v11, v12, a5, v19);

  if ((a2 & 1) == 0)
  {
LABEL_9:
    v15 = 0;
    goto LABEL_10;
  }
  v14 = (void *)v31[5];
  if (!v14)
  {
    v16 = (id)v25[5];
    v17 = v16;
    if (v16)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v16);
      else
        _HKLogDroppedError();
    }

    goto LABEL_9;
  }
  v15 = v14;
LABEL_10:

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  return v15;
}

+ (BOOL)enumerateUserDomainConceptsWithPredicate:(id)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6 enumerationHandler:(id)a7
{
  return objc_msgSend(a1, "enumerateUserDomainConceptsWithPredicate:limit:orderingTerms:profile:transaction:error:enumerationHandler:", a3, 0, 0, a4, a5, a6, a7);
}

+ (BOOL)updateLinksTargetingUserDomainConceptUUID:(id)a3 toTargetUserDomainConceptUUID:(id)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  id v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  uint64_t v41;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if ((objc_msgSend(v11, "isEqual:", v12) & 1) != 0)
  {
    LOBYTE(v15) = 1;
  }
  else
  {
    v16 = v11;
    v17 = v12;
    v18 = v14;
    v32 = v13;
    v19 = v13;
    v15 = (id)objc_opt_self();
    v20 = a7;
    v21 = objc_msgSend(v19, "currentSyncIdentityPersistentID");

    v22 = MEMORY[0x1E0C809B0];
    v33 = MEMORY[0x1E0C809B0];
    v34 = 3221225472;
    v35 = __94__HDUserDomainConceptEntity__updateLinksDataTargeting_toTargetUUID_profile_transaction_error___block_invoke;
    v36 = &unk_1E6D0D658;
    v37 = v16;
    v38 = v17;
    v40 = v15;
    v41 = v21;
    v39 = v18;
    v23 = v18;
    v24 = v17;
    v25 = v16;
    LODWORD(v15) = +[HDUserDomainConceptEntity _enumerateLinkCollectionsContainingTargetUUID:transaction:error:enumerationHandler:]((uint64_t)v15, v25, v23, (uint64_t)v20, &v33);

    if ((_DWORD)v15)
    {
      v15 = v25;
      v26 = v24;
      v27 = v23;
      objc_opt_self();
      objc_msgSend(v27, "protectedDatabase");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      v33 = v22;
      v34 = 3221225472;
      v35 = __93__HDUserDomainConceptEntity__updateLinksMovingFromTargetUUID_toTargetUUID_transaction_error___block_invoke_2;
      v36 = &unk_1E6CE7750;
      v37 = v26;
      v38 = v15;
      v29 = v15;
      v30 = v26;
      LOBYTE(v15) = objc_msgSend(v28, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &_updateLinksMovingFromTargetUUID_toTargetUUID_transaction_error__statementKey, v20, &__block_literal_global_320_0, &v33, 0);

    }
    v13 = v32;
  }

  return (char)v15;
}

+ (id)privateDataEntities
{
  _QWORD v3[7];

  v3[6] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  v3[2] = objc_opt_class();
  v3[3] = objc_opt_class();
  v3[4] = objc_opt_class();
  v3[5] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 6);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)retrievePrivateDataEntitiesForUserDomainConcept:(id)a3 persistentID:(int64_t)a4 transaction:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  BOOL v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = objc_alloc(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v10, "propertyCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "properties");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v12, "initWithArray:", v14);

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(a1, "privateDataEntities", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v24 != v19)
          objc_enumerationMutation(v16);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "retrieveDataForUserDomainConcept:userDomainConceptID:mutableUserDomainConceptProperties:transaction:error:", v10, a4, v15, v11, a6))
        {
          v21 = 0;
          goto LABEL_12;
        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v18)
        continue;
      break;
    }
  }

  if (objc_msgSend(v15, "count"))
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6D20]), "initWithProperties:", v15);
    objc_msgSend(v10, "_setPropertyCollection:", v16);
    v21 = 1;
LABEL_12:

  }
  else
  {
    v21 = 1;
  }

  return v21;
}

+ (id)userDomainConceptUUIDForCanonicalConceptWithSemanticIdentifierString:(id)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  id v28;
  _QWORD v31[5];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  const __CFString *v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__185;
  v36 = __Block_byref_object_dispose__185;
  v37 = 0;
  objc_msgSend(MEMORY[0x1E0D29890], "falsePredicate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6D38], "semanticIdentifierFromSemanticIdentifierString:profile:", v8, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v9, "daemon");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "userDomainConceptEntityRegistry");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "typeIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "userDomainConceptEntityClassForTypeIdentifier:", v15);

    objc_msgSend(v16, "predicateMatchingSemanticIdentifier:", v12);
    v17 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v17;
  }
  v18 = (void *)MEMORY[0x1E0D29840];
  objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", CFSTR("deleted"), MEMORY[0x1E0C9AAA0]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "compoundPredicateWithPredicate:otherPredicate:", v11, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D29888], "orderingTermWithProperty:entityClass:ascending:", CFSTR("creation_date"), objc_opt_class(), 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "protectedDatabase");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteEntity queryWithDatabase:predicate:limit:orderingTerms:groupBy:](HDUserDomainConceptEntity, "queryWithDatabase:predicate:limit:orderingTerms:groupBy:", v22, v20, 1, v23, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = CFSTR("uuid");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __124__HDUserDomainConceptEntity_userDomainConceptUUIDForCanonicalConceptWithSemanticIdentifierString_profile_transaction_error___block_invoke;
  v31[3] = &unk_1E6D0D550;
  v31[4] = &v32;
  v26 = objc_msgSend(v24, "enumeratePersistentIDsAndProperties:error:enumerationHandler:", v25, a6, v31);

  if (v26)
    v27 = (void *)v33[5];
  else
    v27 = 0;
  v28 = v27;

  _Block_object_dispose(&v32, 8);
  return v28;
}

uint64_t __124__HDUserDomainConceptEntity_userDomainConceptUUIDForCanonicalConceptWithSemanticIdentifierString_profile_transaction_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  HDSQLiteColumnWithNameAsUUID();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return 0;
}

+ (BOOL)incrementSyncAnchorAndAdjustSyncProvenanceIfNotLocalForUserDomainConceptWithUUID:(id)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  uint64_t v17;

  v9 = a3;
  v10 = a5;
  v11 = objc_msgSend(a4, "currentSyncIdentityPersistentID");
  objc_msgSend(v10, "protectedDatabase");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __136__HDUserDomainConceptEntity_incrementSyncAnchorAndAdjustSyncProvenanceIfNotLocalForUserDomainConceptWithUUID_profile_transaction_error___block_invoke_2;
  v15[3] = &unk_1E6CE82D8;
  v16 = v9;
  v17 = v11;
  v13 = v9;
  LOBYTE(a6) = objc_msgSend(v12, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &incrementSyncAnchorAndAdjustSyncProvenanceIfNotLocalForUserDomainConceptWithUUID_profile_transaction_error__statementKeyUDCUpdate, a6, &__block_literal_global_220, v15, 0);

  return (char)a6;
}

const __CFString *__136__HDUserDomainConceptEntity_incrementSyncAnchorAndAdjustSyncProvenanceIfNotLocalForUserDomainConceptWithUUID_profile_transaction_error___block_invoke()
{
  return CFSTR("UPDATE user_domain_concepts SET (sync_provenance, sync_identity, sync_anchor) = (?, ?, COALESCE((SELECT MAX(sync_anchor) + 1 FROM user_domain_concepts), 1)) WHERE uuid = ? AND sync_provenance != ?");
}

uint64_t __136__HDUserDomainConceptEntity_incrementSyncAnchorAndAdjustSyncProvenanceIfNotLocalForUserDomainConceptWithUUID_profile_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, 0);
  sqlite3_bind_int64(a2, 2, *(_QWORD *)(a1 + 40));
  HDSQLiteBindFoundationValueToStatement();
  return sqlite3_bind_int64(a2, 4, 0);
}

+ (int64_t)evaluateIsCanonicalConcept:(id)a3 entityClass:(Class)a4 transaction:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int64_t v21;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a3;
  objc_msgSend(v11, "semanticIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class predicateMatchingSemanticIdentifier:](a4, "predicateMatchingSemanticIdentifier:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0D29840];
  objc_msgSend(v11, "creationDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "timeIntervalSinceReferenceDate");
  HDUserDomainConceptEntityPredicateForConceptsWithCreationDateBefore();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v16;
  v23[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "predicateMatchingAllPredicates:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "databaseForEntityClass:", a4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "countValueForProperty:predicate:database:error:", CFSTR("udc_id"), v18, v19, a6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    if (objc_msgSend(v20, "longLongValue"))
      v21 = 2;
    else
      v21 = 1;
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

+ (id)createAndRefreshOntologyBackedUserDomainConceptWithConceptIdentifier:(id)a3 additionalProperties:(id)a4 userDomainConceptTypeIdentifier:(id)a5 profile:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  _QWORD v30[4];
  id v31;
  id v32;
  uint64_t *v33;
  void *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_msgSend(MEMORY[0x1E0CB6828], "appleOntologyCodingWithIdentifier:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "daemon");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "userDomainConceptEntityRegistry");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "userDomainConceptEntityClassForTypeIdentifier:", v13);

  if (v12)
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6D20]), "initWithProperties:", v12);
  else
    v19 = 0;
  objc_msgSend(MEMORY[0x1E0CB6830], "collectionWithCoding:", v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v18, "newUserDomainConceptForRefreshWithCodingCollection:propertyCollection:", v20, v19);

  if (v21)
  {
    v35 = 0;
    v36 = &v35;
    v37 = 0x3032000000;
    v38 = __Block_byref_object_copy__185;
    v39 = __Block_byref_object_dispose__185;
    v40 = 0;
    objc_msgSend(v14, "database");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __165__HDUserDomainConceptEntity_createAndRefreshOntologyBackedUserDomainConceptWithConceptIdentifier_additionalProperties_userDomainConceptTypeIdentifier_profile_error___block_invoke;
    v30[3] = &unk_1E6D0D598;
    v33 = &v35;
    v34 = v18;
    v31 = v21;
    v32 = v14;
    v23 = objc_msgSend(a1, "performWriteTransactionWithHealthDatabase:error:block:", v22, a7, v30);

    if (v23)
      v24 = (void *)v36[5];
    else
      v24 = 0;
    v27 = v24;

    _Block_object_dispose(&v35, 8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 3, CFSTR("%@{public}: User Domain Concept subclass entity does not currently support creating and refreshing on demand. %@{public}"), a1, v18);
    v25 = (id)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v25)
    {
      if (a7)
        *a7 = objc_retainAutorelease(v25);
      else
        _HKLogDroppedError();
    }

    v27 = 0;
  }

  return v27;
}

uint64_t __165__HDUserDomainConceptEntity_createAndRefreshOntologyBackedUserDomainConceptWithConceptIdentifier_additionalProperties_userDomainConceptTypeIdentifier_profile_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 56), "refreshOntologyContentForUserDomainConcept:profile:transaction:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a2, a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  return 1;
}

+ (id)ignoreHiddenConceptsPredicate
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0D298A0]);
  objc_msgSend(v2, "setEntityClass:", objc_opt_class());
  HDUserDomainConceptEntityPredicateForPropertyType(2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v3);

  objc_msgSend(v2, "setReturnsDistinctEntities:", 1);
  v4 = (void *)MEMORY[0x1E0D29838];
  v9[0] = CFSTR("udc_id");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateWithProperty:comparisonType:subqueryDescriptor:subqueryProperties:", CFSTR("udc_id"), 7, v2, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D29840], "negatedPredicate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)insertConcreteUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 transaction:(id)a5 error:(id *)a6
{
  NSRequestConcreteImplementation();
  return 1;
}

+ (BOOL)updateConcreteUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 transaction:(id)a5 error:(id *)a6
{
  NSRequestConcreteImplementation();
  return 1;
}

+ (BOOL)willDeleteConcreteUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 syncProvenance:(int64_t)a5 profile:(id)a6 transaction:(id)a7 error:(id *)a8
{
  NSRequestConcreteImplementation();
  return 1;
}

+ (Class)userDomainConceptClass
{
  return (Class)objc_opt_class();
}

+ (Class)userDomainConceptSemanticIdentifierClass
{
  return (Class)objc_opt_class();
}

+ (id)predicateMatchingSemanticIdentifier:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:value:comparisonType:", CFSTR("uuid"), v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)newUserDomainConceptForRefreshWithCodingCollection:(id)a3 propertyCollection:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;

  v5 = (objc_class *)MEMORY[0x1E0CB6CE8];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithCodingCollection:linkCollection:propertyCollection:", v7, 0, v6);

  return v8;
}

+ (BOOL)insertPrivateDataEnitiesForUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 transaction:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  BOOL v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(a1, "privateDataEntities", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "insertDataForUserDomainConcept:userDomainConceptID:transaction:error:", v10, a4, v11, a6))
        {
          v17 = 0;
          goto LABEL_11;
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v14)
        continue;
      break;
    }
  }
  v17 = 1;
LABEL_11:

  return v17;
}

+ (BOOL)updatePrivateDataEnitiesForUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 syncProvenance:(int64_t)a5 profile:(id)a6 transaction:(id)a7 error:(id *)a8
{
  uint64_t i;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  id obj;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[5];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v31 = a3;
  v30 = a6;
  v29 = a7;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  objc_msgSend(a1, "privateDataEntities");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v27)
  {
    v28 = *(_QWORD *)v35;
    while (2)
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v35 != v28)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        v13 = v31;
        v14 = v30;
        v15 = v29;
        objc_opt_self();
        if (objc_msgSend(v13, "isDeleted")
          && !objc_msgSend(v12, "willDeleteUserDomainConcept:userDomainConceptID:syncProvenance:profile:transaction:error:", v13, a4, a5, v14, v15, a8))
        {
LABEL_17:

          LOBYTE(v15) = 0;
          goto LABEL_19;
        }
        v16 = v13;
        v17 = v15;
        objc_opt_self();
        if ((objc_msgSend(v16, "isDeleted") & 1) != 0 || (objc_opt_respondsToSelector() & 1) == 0)
        {
          v19 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v12, "disambiguatedDatabaseTable");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "stringWithFormat:", CFSTR("DELETE FROM %@ WHERE udc_id = ?"), v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v17, "protectedDatabase");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v38[0] = MEMORY[0x1E0C809B0];
          v38[1] = 3221225472;
          v38[2] = __111__HDUserDomainConceptEntity__deleteDataForUserDomainConcept_userDomainConceptID_entityClass_transaction_error___block_invoke;
          v38[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
          v38[4] = a4;
          v23 = objc_msgSend(v22, "executeSQL:error:bindingHandler:enumerationHandler:", v21, a8, v38, 0);

          if ((v23 & 1) == 0)
            goto LABEL_17;
        }
        else
        {
          v18 = objc_msgSend(v12, "pruneDataForUpdatedUserDomainConcept:userDomainConceptID:transaction:error:", v16, a4, v17, a8);

          if ((v18 & 1) == 0)
            goto LABEL_17;
        }
        LODWORD(v15) = objc_msgSend(v12, "insertDataForUserDomainConcept:userDomainConceptID:transaction:error:", v16, a4, v17, a8);

        if (!(_DWORD)v15)
          goto LABEL_19;
      }
      LOBYTE(v15) = 1;
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      if (v27)
        continue;
      break;
    }
  }
  else
  {
    LOBYTE(v15) = 1;
  }
LABEL_19:

  return (char)v15;
}

+ (id)predicateMatchingSemanticDuplicatesOf:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0D29890], "falsePredicate", a3);
}

+ (id)deduplicateUserDomainConcept:(id)a3 with:(id)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7
{
  return a3;
}

+ (id)refreshOntologyContentForUserDomainConcept:(id)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6
{
  return a3;
}

+ (BOOL)supportsSyncStore:(id)a3
{
  return 1;
}

+ (BOOL)encodesCodableUserDomainConceptSubclassData
{
  return 1;
}

+ (BOOL)supportsHidingSemanticDuplicates
{
  return 0;
}

+ (BOOL)generateAPIObjectForUserDomainConcept:(id)a3 apiObjectOut:(id *)a4 transaction:(id)a5 error:(id *)a6
{
  if (a4)
    *a4 = 0;
  return 1;
}

+ (void)_notifyObserversForUserDomainConcept:(int)a3 update:(void *)a4 profile:(void *)a5 transaction:
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a2;
  v8 = a5;
  v9 = a4;
  objc_opt_self();
  objc_msgSend(v9, "userDomainConceptManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "isDeleted"))
  {
    objc_msgSend(v10, "notifyObserversForDeletedUDC:transaction:", v11, v8);
  }
  else if (a3)
  {
    objc_msgSend(v10, "notifyObserversForUpdatedUDC:transaction:", v11, v8);
  }
  else
  {
    objc_msgSend(v10, "notifyObserversForAddedUDC:transaction:", v11, v8);
  }

}

+ (uint64_t)_updateLinkCollectionDataByRemovingTargetUUID:(uint64_t)a3 syncProvenance:(uint64_t)a4 syncIdentity:(void *)a5 transaction:(uint64_t)a6 error:
{
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v10 = a2;
  v11 = a5;
  v12 = objc_opt_self();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __121__HDUserDomainConceptEntity__updateLinkCollectionDataByRemovingTargetUUID_syncProvenance_syncIdentity_transaction_error___block_invoke;
  v17[3] = &unk_1E6D0D630;
  v20 = v12;
  v21 = a3;
  v22 = a4;
  v18 = v10;
  v19 = v11;
  v13 = v11;
  v14 = v10;
  v15 = +[HDUserDomainConceptEntity _enumerateLinkCollectionsContainingTargetUUID:transaction:error:enumerationHandler:](v12, v14, v13, a6, v17);

  return v15;
}

+ (id)_linkCollectionToPersistGivenLinkCollection:(void *)a3 transaction:(uint64_t)a4 error:
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v6 = a2;
  v7 = a3;
  objc_opt_self();
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__185;
  v17 = __Block_byref_object_dispose__185;
  v8 = v6;
  v18 = v8;
  objc_msgSend(v7, "protectedDatabase");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __91__HDUserDomainConceptEntity__linkCollectionToPersistGivenLinkCollection_transaction_error___block_invoke_2;
  v12[3] = &unk_1E6CE8540;
  v12[4] = &v13;
  if ((objc_msgSend(v9, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &_linkCollectionToPersistGivenLinkCollection_transaction_error__statementKey, a4, &__block_literal_global_304, 0, v12) & 1) != 0)v10 = (id)v14[5];
  else
    v10 = 0;

  _Block_object_dispose(&v13, 8);
  return v10;
}

const __CFString *__104__HDUserDomainConceptEntity__insertBaseUserDomainConcept_syncProvenance_syncIdentity_transaction_error___block_invoke()
{
  objc_opt_self();
  return CFSTR("INSERT OR IGNORE INTO user_domain_concepts (uuid, schema, type, deleted, creation_date, modification_date, major_version, minor_version, patch_version, build, sync_provenance, sync_identity, sync_anchor, link_collection_data) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, COALESCE((SELECT MAX(sync_anchor) + 1 FROM user_domain_concepts), 1), ?)");
}

void __104__HDUserDomainConceptEntity__insertBaseUserDomainConcept_syncProvenance_syncIdentity_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  sqlite3_int64 v11;
  void *v12;
  sqlite3_int64 v13;
  void *v14;
  sqlite3_int64 v15;
  void *v16;
  sqlite3_int64 v17;
  sqlite3_int64 v18;
  sqlite3_int64 v19;

  objc_msgSend(*(id *)(a1 + 32), "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "schema");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  sqlite3_bind_int64(a2, 3, objc_msgSend(v7, "code"));

  sqlite3_bind_int(a2, 4, objc_msgSend(*(id *)(a1 + 32), "isDeleted"));
  objc_msgSend(*(id *)(a1 + 32), "creationTimestamp");
  sqlite3_bind_double(a2, 5, v8);
  objc_msgSend(*(id *)(a1 + 32), "modificationTimestamp");
  sqlite3_bind_double(a2, 6, v9);
  v10 = *(void **)(a1 + 32);
  if (v10)
  {
    objc_msgSend(v10, "operatingSystemVersion");
    v11 = v19;
  }
  else
  {
    v11 = 0;
  }
  sqlite3_bind_int64(a2, 7, v11);
  v12 = *(void **)(a1 + 32);
  if (v12)
  {
    objc_msgSend(v12, "operatingSystemVersion");
    v13 = v18;
  }
  else
  {
    v13 = 0;
  }
  sqlite3_bind_int64(a2, 8, v13);
  v14 = *(void **)(a1 + 32);
  if (v14)
  {
    objc_msgSend(v14, "operatingSystemVersion");
    v15 = v17;
  }
  else
  {
    v15 = 0;
  }
  sqlite3_bind_int64(a2, 9, v15);
  objc_msgSend(*(id *)(a1 + 32), "build");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  sqlite3_bind_int64(a2, 11, *(_QWORD *)(a1 + 48));
  sqlite3_bind_int64(a2, 12, *(_QWORD *)(a1 + 56));
  +[HDUserDomainConceptEntity _bindToStatement:index:linkCollection:](*(_QWORD *)(a1 + 64), a2, 13, *(void **)(a1 + 40));
}

+ (void)_bindToStatement:(int)a3 index:(void *)a4 linkCollection:
{
  void *v6;
  id v7;

  v7 = a4;
  objc_opt_self();
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    HDSQLiteBindFoundationValueToStatement();

  }
  else
  {
    sqlite3_bind_null(a2, a3);
  }

}

const __CFString *__91__HDUserDomainConceptEntity__linkCollectionToPersistGivenLinkCollection_transaction_error___block_invoke()
{
  return CFSTR("SELECT uuid FROM user_domain_concepts WHERE deleted = 1");
}

uint64_t __91__HDUserDomainConceptEntity__linkCollectionToPersistGivenLinkCollection_transaction_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  MEMORY[0x1BCCAB1E0](a2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "collectionByRemovingLinksWithTargetUUID:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  return 1;
}

const __CFString *__112__HDUserDomainConceptEntity__updateBaseUserDomainConcept_syncProvenance_syncIdentity_profile_transaction_error___block_invoke()
{
  objc_opt_self();
  return CFSTR("UPDATE user_domain_concepts SET (schema, type, deleted, modification_date, major_version, minor_version, patch_version, build, sync_provenance, sync_identity, sync_anchor, link_collection_data) = (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, COALESCE((SELECT MAX(sync_anchor) + 1 FROM user_domain_concepts), 1), ?)WHERE udc_id = ?");
}

uint64_t __112__HDUserDomainConceptEntity__updateBaseUserDomainConcept_syncProvenance_syncIdentity_profile_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  sqlite3_int64 v9;
  void *v10;
  sqlite3_int64 v11;
  void *v12;
  sqlite3_int64 v13;
  void *v14;
  sqlite3_int64 v16;
  sqlite3_int64 v17;
  sqlite3_int64 v18;

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "schema");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  sqlite3_bind_int64(a2, 2, objc_msgSend(v6, "code"));

  sqlite3_bind_int(a2, 3, objc_msgSend(*(id *)(a1 + 32), "isDeleted"));
  objc_msgSend(*(id *)(a1 + 32), "modificationTimestamp");
  sqlite3_bind_double(a2, 4, v7);
  v8 = *(void **)(a1 + 32);
  if (v8)
  {
    objc_msgSend(v8, "operatingSystemVersion");
    v9 = v18;
  }
  else
  {
    v9 = 0;
  }
  sqlite3_bind_int64(a2, 5, v9);
  v10 = *(void **)(a1 + 32);
  if (v10)
  {
    objc_msgSend(v10, "operatingSystemVersion");
    v11 = v17;
  }
  else
  {
    v11 = 0;
  }
  sqlite3_bind_int64(a2, 6, v11);
  v12 = *(void **)(a1 + 32);
  if (v12)
  {
    objc_msgSend(v12, "operatingSystemVersion");
    v13 = v16;
  }
  else
  {
    v13 = 0;
  }
  sqlite3_bind_int64(a2, 7, v13);
  objc_msgSend(*(id *)(a1 + 32), "build");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  sqlite3_bind_int64(a2, 9, *(_QWORD *)(a1 + 56));
  sqlite3_bind_int64(a2, 10, *(_QWORD *)(a1 + 64));
  +[HDUserDomainConceptEntity _bindToStatement:index:linkCollection:](*(_QWORD *)(a1 + 72), a2, 11, *(void **)(a1 + 40));
  return sqlite3_bind_int64(a2, 12, objc_msgSend(*(id *)(a1 + 48), "longLongValue"));
}

uint64_t __121__HDUserDomainConceptEntity__updateLinkCollectionDataByRemovingTargetUUID_syncProvenance_syncIdentity_transaction_error___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;

  v7 = *(_QWORD *)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 64);
  v9 = *(void **)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v11 = v9;
  v12 = a3;
  v13 = objc_opt_self();
  objc_msgSend(v12, "collectionByRemovingLinksWithTargetUUID:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = +[HDUserDomainConceptEntity _updateLinkCollection:userDomainConceptID:syncProvenance:syncIdentity:transaction:error:](v13, v14, a2, v7, v8, v10, a4);
  return v15;
}

+ (uint64_t)_enumerateLinkCollectionsContainingTargetUUID:(void *)a3 transaction:(uint64_t)a4 error:(void *)a5 enumerationHandler:
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;

  v8 = a2;
  v9 = a5;
  v10 = a3;
  v11 = objc_opt_self();
  objc_msgSend(v10, "protectedDatabase");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = v11;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __112__HDUserDomainConceptEntity__enumerateLinkCollectionsContainingTargetUUID_transaction_error_enumerationHandler___block_invoke_2;
  v20[3] = &unk_1E6CE9508;
  v21 = v8;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __112__HDUserDomainConceptEntity__enumerateLinkCollectionsContainingTargetUUID_transaction_error_enumerationHandler___block_invoke_3;
  v17[3] = &unk_1E6CEEDA0;
  v18 = v9;
  v13 = v9;
  v14 = v8;
  v15 = objc_msgSend(v12, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &_enumerateLinkCollectionsContainingTargetUUID_transaction_error_enumerationHandler__statementKey, a4, &__block_literal_global_314, v20, v17);

  return v15;
}

uint64_t __94__HDUserDomainConceptEntity__updateLinksDataTargeting_toTargetUUID_profile_transaction_error___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;

  v8 = *(void **)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 64);
  v10 = *(id *)(a1 + 48);
  v11 = v7;
  v12 = v8;
  v13 = a3;
  v14 = objc_opt_self();
  objc_msgSend(v13, "collectionByRetargetingLinksWithUUID:withNewUUID:", v12, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = +[HDUserDomainConceptEntity _updateLinkCollection:userDomainConceptID:syncProvenance:syncIdentity:transaction:error:](v14, v15, a2, 0, v9, v10, a4);
  return v16;
}

const __CFString *__112__HDUserDomainConceptEntity__enumerateLinkCollectionsContainingTargetUUID_transaction_error_enumerationHandler___block_invoke()
{
  return CFSTR("SELECT udc_id, link_collection_data FROM user_domain_concepts WHERE udc_id IN (SELECT DISTINCT udc_id FROM user_domain_concept_links WHERE target_uuid = ?)");
}

uint64_t __112__HDUserDomainConceptEntity__enumerateLinkCollectionsContainingTargetUUID_transaction_error_enumerationHandler___block_invoke_2()
{
  return HDSQLiteBindFoundationValueToStatement();
}

uint64_t __112__HDUserDomainConceptEntity__enumerateLinkCollectionsContainingTargetUUID_transaction_error_enumerationHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  int v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v12;

  HDSQLiteColumnAsInt64();
  v6 = *(_QWORD *)(a1 + 40);
  v12 = 0;
  v7 = +[HDUserDomainConceptEntity _inflateLinkCollection:row:error:](v6, &v12, a2, a3);
  v8 = v12;
  v9 = v8;
  if (v7)
  {
    if (v8)
      v10 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    else
      v10 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (uint64_t)_inflateLinkCollection:(uint64_t)a3 row:(uint64_t)a4 error:
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  objc_opt_self();
  HDSQLiteColumnWithNameAsData();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v6, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v9 = 0;
      goto LABEL_8;
    }
    v8 = v7;
    if (a2)
      *a2 = objc_retainAutorelease(v7);

  }
  v9 = 1;
LABEL_8:

  return v9;
}

+ (uint64_t)_updateLinkCollection:(uint64_t)a3 userDomainConceptID:(uint64_t)a4 syncProvenance:(uint64_t)a5 syncIdentity:(void *)a6 transaction:(uint64_t)a7 error:
{
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  _QWORD v19[4];
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v12 = a2;
  v13 = a6;
  v14 = objc_opt_self();
  objc_msgSend(v13, "protectedDatabase");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __117__HDUserDomainConceptEntity__updateLinkCollection_userDomainConceptID_syncProvenance_syncIdentity_transaction_error___block_invoke_2;
  v19[3] = &unk_1E6CF1740;
  v22 = a5;
  v23 = v14;
  v20 = v12;
  v21 = a4;
  v24 = a3;
  v16 = v12;
  v17 = objc_msgSend(v15, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &_updateLinkCollection_userDomainConceptID_syncProvenance_syncIdentity_transaction_error__statementKey, a7, &__block_literal_global_317_1, v19, 0);

  return v17;
}

const __CFString *__117__HDUserDomainConceptEntity__updateLinkCollection_userDomainConceptID_syncProvenance_syncIdentity_transaction_error___block_invoke()
{
  return CFSTR("UPDATE user_domain_concepts SET (modification_date, sync_provenance, sync_identity, link_collection_data, sync_anchor) = (?, ?, ?, ?, COALESCE((SELECT MAX(sync_anchor) + 1 FROM user_domain_concepts), 1)) WHERE udc_id = ?");
}

uint64_t __117__HDUserDomainConceptEntity__updateLinkCollection_userDomainConceptID_syncProvenance_syncIdentity_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  double Current;

  Current = CFAbsoluteTimeGetCurrent();
  sqlite3_bind_double(a2, 1, Current);
  sqlite3_bind_int64(a2, 2, *(_QWORD *)(a1 + 40));
  sqlite3_bind_int64(a2, 3, *(_QWORD *)(a1 + 48));
  +[HDUserDomainConceptEntity _bindToStatement:index:linkCollection:](*(_QWORD *)(a1 + 56), a2, 4, *(void **)(a1 + 32));
  return sqlite3_bind_int64(a2, 5, *(_QWORD *)(a1 + 64));
}

const __CFString *__93__HDUserDomainConceptEntity__updateLinksMovingFromTargetUUID_toTargetUUID_transaction_error___block_invoke()
{
  return CFSTR("UPDATE OR REPLACE user_domain_concept_links SET (target_uuid) = (?) WHERE target_uuid = ?");
}

uint64_t __93__HDUserDomainConceptEntity__updateLinksMovingFromTargetUUID_toTargetUUID_transaction_error___block_invoke_2()
{
  HDSQLiteBindFoundationValueToStatement();
  return HDSQLiteBindFoundationValueToStatement();
}

void __90__HDUserDomainConceptEntity__userDomainConceptWithPersistentID_encoder_transaction_error___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id obj;

  v5 = (void *)a1[4];
  v6 = a1[7];
  v7 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v7 + 40);
  objc_msgSend(v5, "objectForPersistentID:row:error:", v6, a3, &obj);
  v8 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v7 + 40), obj);
  v9 = *(_QWORD *)(a1[5] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

const __CFString *__88__HDUserDomainConceptEntity__userDomainConceptIDForUserDomainConcept_transaction_error___block_invoke()
{
  return CFSTR("SELECT udc_id FROM user_domain_concepts WHERE uuid = ?");
}

void __88__HDUserDomainConceptEntity__userDomainConceptIDForUserDomainConcept_transaction_error___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "UUID");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

}

uint64_t __88__HDUserDomainConceptEntity__userDomainConceptIDForUserDomainConcept_transaction_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  MEMORY[0x1BCCAB1C8](a2, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return 1;
}

uint64_t __111__HDUserDomainConceptEntity__deleteDataForUserDomainConcept_userDomainConceptID_entityClass_transaction_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 32));
}

uint64_t __82__HDUserDomainConceptEntity__userDomainConceptWithUUID_profile_transaction_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  return 0;
}

+ (BOOL)_removeIsHiddenDeviceLocalPropertyForUserDomainConceptWithPersistentID:(void *)a3 transaction:(uint64_t)a4 error:
{
  id v6;
  _BOOL8 v7;

  v6 = a3;
  objc_opt_self();
  v7 = +[HDUserDomainConceptPropertyEntity deleteDeviceLocalPropertiesWithType:userDomainConceptID:transaction:error:](HDUserDomainConceptPropertyEntity, "deleteDeviceLocalPropertiesWithType:userDomainConceptID:transaction:error:", 2, a2, v6, a4);

  return v7;
}

BOOL __92__HDUserDomainConceptEntity__hideSemanticDuplicatesOfConcept_entityClass_transaction_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return +[HDUserDomainConceptPropertyEntity insertDeviceLocalProperty:userDomainConceptID:transaction:error:](HDUserDomainConceptPropertyEntity, "insertDeviceLocalProperty:userDomainConceptID:transaction:error:", *(_QWORD *)(a1 + 32), a2, *(_QWORD *)(a1 + 40), a5);
}

uint64_t __95__HDUserDomainConceptEntity__isConceptHiddenFromEnumerationWithPersistentID_transaction_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  HDSQLiteColumnWithNameAsNumber();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    LOBYTE(v2) = objc_msgSend(v2, "BOOLValue");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = (_BYTE)v2;

  return 1;
}

BOOL __163__HDUserDomainConceptEntity__findNewDeviceLocalCanonicalConceptForConceptThatWillBeDeletedWithPersistentID_entityClass_conceptThatWillBeDeleted_transaction_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return +[HDUserDomainConceptEntity _removeIsHiddenDeviceLocalPropertyForUserDomainConceptWithPersistentID:transaction:error:]((uint64_t)HDUserDomainConceptEntity, a2, *(void **)(a1 + 32), a5);
}

void __97__HDUserDomainConceptEntity__codableSubclassForForUserDomainConceptID_encoder_transaction_error___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id obj;

  v5 = (void *)a1[4];
  v6 = a1[7];
  v7 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v7 + 40);
  objc_msgSend(v5, "codableRepresentationForPersistentID:row:error:", v6, a3, &obj);
  v8 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v7 + 40), obj);
  v9 = *(_QWORD *)(a1[5] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

@end
