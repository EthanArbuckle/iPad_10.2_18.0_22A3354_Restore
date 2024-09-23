@implementation MCFeatureFlagsPayload

+ (id)typeStrings
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("com.apple.system.featureflags");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)localizedSingularForm
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  return MCLocalizedFormat(CFSTR("FEATURE_FLAGS_DESCRIPTION_SINGULAR_FORMAT"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

+ (id)localizedPluralForm
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  return MCLocalizedFormat(CFSTR("FEATURE_FLAGS_DESCRIPTION_PLURAL_FORMAT"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

+ (BOOL)isConfigurationValid:(id)a3 error:(id *)a4
{
  return FFConfigurationValidateProfilePayload();
}

- (BOOL)isAllowedToWriteFeatureFlags
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v8;

  v8 = 0;
  -[MCPayload profile](self, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "signatureVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[MCPayload profile](self, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "signerCertificates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCProfile evaluateTrustOfCertificateChain:signatureVersion:outIsAllowedToWriteDefaults:](MCProfile, "evaluateTrustOfCertificateChain:signatureVersion:outIsAllowedToWriteDefaults:", v6, v4, &v8);

  LOBYTE(v5) = v8;
  return (char)v5;
}

- (id)invalidConfigurationErrorWithUnderlyingError:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v4 = (void *)MEMORY[0x1E0CB35C8];
  v5 = a3;
  -[MCPayload identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  MCErrorArray(CFSTR("ERROR_FEATURE_FLAGS_INVALID_CONFIGURATION_P_ID"), v7, v8, v9, v10, v11, v12, v13, v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", CFSTR("MCFeatureFlagsErrorDomain"), 58001, v14, v5, CFSTR("MCFatalError"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (MCFeatureFlagsPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  id v8;
  id v9;
  MCFeatureFlagsPayload *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v33;
  uint64_t v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t i;
  void *v47;
  uint64_t v48;
  void *v49;
  id v50;
  uint64_t v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  NSObject *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  NSObject *v64;
  void *v65;
  unint64_t v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  void *v71;
  id v72;
  uint64_t v73;
  void *v74;
  id v75;
  uint64_t v76;
  void *v77;
  id v78;
  int v79;
  uint64_t v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  char v85;
  uint64_t v86;
  uint64_t v87;
  NSDictionary *featureFlagsConfiguration;
  char v89;
  void *v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  void *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  void *v109;
  id v110;
  void *v111;
  void *v112;
  id *v113;
  void *v114;
  void *v115;
  id obj;
  uint64_t v117;
  void *v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  void *v122;
  void *v123;
  uint64_t v124;
  uint64_t v125;
  id v126;
  id v127;
  id v128;
  id v129;
  id v130;
  id v131;
  id v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  id v137;
  id v138;
  id v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  id v144;
  id v145;
  id v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  id v151;
  id v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  id v157;
  objc_super v158;
  uint8_t buf[4];
  void *v160;
  __int16 v161;
  id v162;
  _QWORD v163[2];
  _QWORD v164[2];
  _QWORD v165[2];
  _QWORD v166[2];
  _BYTE v167[128];
  _QWORD v168[2];
  _QWORD v169[2];
  _BYTE v170[128];
  _QWORD v171[2];
  _QWORD v172[2];
  _QWORD v173[2];
  _QWORD v174[2];
  _BYTE v175[128];
  _BYTE v176[128];
  uint64_t v177;

  v177 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v158.receiver = self;
  v158.super_class = (Class)MCFeatureFlagsPayload;
  v10 = -[MCPayload initWithDictionary:profile:outError:](&v158, sel_initWithDictionary_profile_outError_, v8, v9, a5);
  if (!v10)
    goto LABEL_73;
  v113 = a5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v157 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("Features"), 0, &v157);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v157;
  if (v13)
  {
    v14 = v13;

    goto LABEL_64;
  }
  v112 = v11;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v153 = 0u;
  v154 = 0u;
  v155 = 0u;
  v156 = 0u;
  v16 = v12;
  obj = v16;
  v117 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v153, v176, 16);
  if (!v117)
  {

    goto LABEL_32;
  }
  v110 = v9;
  v14 = 0;
  v119 = *(_QWORD *)v154;
  v114 = v15;
LABEL_6:
  v17 = 0;
LABEL_7:
  if (*(_QWORD *)v154 != v119)
    objc_enumerationMutation(obj);
  v18 = *(void **)(*((_QWORD *)&v153 + 1) + 8 * v17);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v124 = v17;
    v19 = objc_opt_class();
    v152 = v14;
    objc_msgSend(v18, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", v19, CFSTR("Domain"), 1, &v152);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v152;

    if (v21)
    {
      v122 = v20;
      v39 = obj;
      v14 = v21;
      v9 = v110;

      goto LABEL_62;
    }
    v22 = objc_opt_class();
    v151 = 0;
    objc_msgSend(v18, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", v22, CFSTR("Features"), 1, &v151);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    v24 = v151;
    if (v24)
    {
      v14 = v24;
      v123 = v20;
      v39 = obj;
      v9 = v110;
      goto LABEL_61;
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v147 = 0u;
    v148 = 0u;
    v149 = 0u;
    v150 = 0u;
    v126 = v23;
    v26 = objc_msgSend(v126, "countByEnumeratingWithState:objects:count:", &v147, v175, 16);
    if (!v26)
    {
      v14 = 0;
      goto LABEL_28;
    }
    v27 = v26;
    v28 = *(_QWORD *)v148;
    v121 = v20;
LABEL_14:
    v29 = 0;
    while (1)
    {
      if (*(_QWORD *)v148 != v28)
        objc_enumerationMutation(v126);
      v30 = *(void **)(*((_QWORD *)&v147 + 1) + 8 * v29);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        break;
      v31 = objc_opt_class();
      v146 = 0;
      objc_msgSend(v30, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", v31, CFSTR("FeatureName"), 1, &v146);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v146;
      if (v33)
      {
        v14 = v33;

        goto LABEL_26;
      }
      v34 = objc_opt_class();
      v145 = 0;
      objc_msgSend(v30, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", v34, CFSTR("Enabled"), 1, &v145);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v145;
      if (v36)
      {
        v14 = v36;

        v15 = v114;
        v20 = v121;
        goto LABEL_28;
      }
      v173[0] = CFSTR("FeatureName");
      v173[1] = CFSTR("Enabled");
      v174[0] = v32;
      v174[1] = v35;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v174, v173, 2);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addObject:", v37);

      ++v10->_featureFlagCount;
      if (v27 == ++v29)
      {
        v27 = objc_msgSend(v126, "countByEnumeratingWithState:objects:count:", &v147, v175, 16);
        v14 = 0;
        v15 = v114;
        v20 = v121;
        if (v27)
          goto LABEL_14;
LABEL_28:

        v171[0] = CFSTR("Domain");
        v171[1] = CFSTR("Features");
        v172[0] = v20;
        v172[1] = v25;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v172, v171, 2);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObject:", v38);

        v17 = v124 + 1;
        if (v124 + 1 == v117)
        {
          v117 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v153, v176, 16);
          if (!v117)
            goto LABEL_37;
          goto LABEL_6;
        }
        goto LABEL_7;
      }
    }
    -[MCFeatureFlagsPayload invalidConfigurationErrorWithUnderlyingError:](v10, "invalidConfigurationErrorWithUnderlyingError:", 0);
    v14 = (id)objc_claimAutoreleasedReturnValue();
LABEL_26:
    v15 = v114;
    v20 = v121;
    goto LABEL_28;
  }
  -[MCFeatureFlagsPayload invalidConfigurationErrorWithUnderlyingError:](v10, "invalidConfigurationErrorWithUnderlyingError:", 0);
  v41 = objc_claimAutoreleasedReturnValue();

  v14 = (id)v41;
LABEL_37:

  v9 = v110;
  if (v14)
    goto LABEL_63;
LABEL_32:
  if (objc_msgSend(v15, "count"))
    objc_msgSend(v112, "setObject:forKey:", v15, CFSTR("Features"));
  v144 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("Disclosures"), 0, &v144);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v144;
  if (v40)
  {
    v14 = v40;
    goto LABEL_62;
  }
  v115 = v15;
  v109 = v8;
  v111 = v9;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v140 = 0u;
  v141 = 0u;
  v142 = 0u;
  v143 = 0u;
  v127 = v39;
  v43 = objc_msgSend(v127, "countByEnumeratingWithState:objects:count:", &v140, v170, 16);
  v123 = v42;
  if (!v43)
  {
    v55 = 0;
    goto LABEL_58;
  }
  v44 = v43;
  v45 = *(_QWORD *)v141;
  while (2)
  {
    for (i = 0; i != v44; ++i)
    {
      if (*(_QWORD *)v141 != v45)
        objc_enumerationMutation(v127);
      v47 = *(void **)(*((_QWORD *)&v140 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        -[MCFeatureFlagsPayload invalidConfigurationErrorWithUnderlyingError:](v10, "invalidConfigurationErrorWithUnderlyingError:", 0);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_57:
        v42 = v123;
        goto LABEL_58;
      }
      v48 = objc_opt_class();
      v139 = 0;
      objc_msgSend(v47, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", v48, CFSTR("DisclosureName"), 1, &v139);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v139;
      if (v50)
      {
        v55 = v50;
LABEL_56:

        goto LABEL_57;
      }
      v51 = objc_opt_class();
      v138 = 0;
      objc_msgSend(v47, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", v51, CFSTR("Disclosed"), 1, &v138);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = v138;
      if (v53)
      {
        v55 = v53;

        goto LABEL_56;
      }
      v168[0] = CFSTR("DisclosureName");
      v168[1] = CFSTR("Disclosed");
      v169[0] = v49;
      v169[1] = v52;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v169, v168, 2);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v123, "addObject:", v54);

      ++v10->_disclosureCount;
    }
    v44 = objc_msgSend(v127, "countByEnumeratingWithState:objects:count:", &v140, v170, 16);
    v55 = 0;
    v42 = v123;
    if (v44)
      continue;
    break;
  }
LABEL_58:
  v39 = v127;

  if (objc_msgSend(v42, "count"))
    objc_msgSend(v112, "setObject:forKey:", v42, CFSTR("Disclosures"));
  v137 = v55;
  v8 = v109;
  objc_msgSend(v109, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("Subscriptions"), 0, &v137);
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v14 = v137;

  v9 = v111;
  v15 = v115;
  if (v14)
    goto LABEL_61;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v133 = 0u;
  v134 = 0u;
  v135 = 0u;
  v136 = 0u;
  v23 = v23;
  v120 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v133, v167, 16);
  v14 = 0;
  if (!v120)
    goto LABEL_97;
  v67 = 0x1E0C99000uLL;
  v125 = *(_QWORD *)v134;
  while (2)
  {
    v68 = 0;
    while (2)
    {
      if (*(_QWORD *)v134 != v125)
        objc_enumerationMutation(v23);
      v69 = *(void **)(*((_QWORD *)&v133 + 1) + 8 * v68);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        -[MCFeatureFlagsPayload invalidConfigurationErrorWithUnderlyingError:](v10, "invalidConfigurationErrorWithUnderlyingError:", 0);
        v72 = (id)objc_claimAutoreleasedReturnValue();
LABEL_95:

        v14 = v72;
LABEL_96:
        v8 = v109;
        goto LABEL_97;
      }
      v70 = objc_opt_class();
      v132 = v14;
      objc_msgSend(v69, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", v70, CFSTR("SubscriptionClass"), 1, &v132);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = v132;

      if (v72)
        goto LABEL_94;
      v73 = objc_opt_class();
      v131 = 0;
      objc_msgSend(v69, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", v73, CFSTR("SubscriptionContents"), 1, &v131);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = v131;
      if (v75)
      {
        v72 = v75;

LABEL_94:
        v14 = v71;
        goto LABEL_95;
      }
      v76 = objc_opt_class();
      v130 = 0;
      objc_msgSend(v74, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", v76, CFSTR("TargetRelease"), 1, &v130);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = v130;
      if (v78)
      {
        v14 = v78;
        v79 = 10;
      }
      else
      {
        v80 = objc_opt_class();
        v129 = 0;
        objc_msgSend(v74, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", v80, CFSTR("MinimumPhase"), 1, &v129);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v129;
        if (v14)
        {
          v79 = 10;
        }
        else
        {
          v166[0] = v71;
          v165[0] = CFSTR("SubscriptionClass");
          v165[1] = CFSTR("SubscriptionContents");
          v163[0] = CFSTR("TargetRelease");
          v163[1] = CFSTR("MinimumPhase");
          v164[0] = v77;
          v164[1] = v81;
          objc_msgSend(*(id *)(v67 + 3456), "dictionaryWithObjects:forKeys:count:", v164, v163, 2);
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          v166[1] = v82;
          objc_msgSend(*(id *)(v67 + 3456), "dictionaryWithObjects:forKeys:count:", v166, v165, 2);
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v118, "addObject:", v83);

          v39 = v127;
          v79 = 0;
          ++v10->_subscriptionCount;
        }

      }
      if (v79)
        goto LABEL_96;
      ++v68;
      v67 = 0x1E0C99000;
      if (v120 != v68)
        continue;
      break;
    }
    v8 = v109;
    v120 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v133, v167, 16);
    if (v120)
      continue;
    break;
  }
LABEL_97:

  if (objc_msgSend(v118, "count"))
    objc_msgSend(v112, "setObject:forKey:", v118, CFSTR("Subscriptions"));
  -[MCPayload profile](v10, "profile");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = objc_msgSend(v84, "isStub");

  v9 = v111;
  if ((v85 & 1) != 0)
  {
LABEL_100:
    v15 = v115;
    if (!v14)
    {
      v86 = objc_msgSend(v112, "copy");
      v87 = 0;
      featureFlagsConfiguration = v10->_featureFlagsConfiguration;
      v10->_featureFlagsConfiguration = (NSDictionary *)v86;
      goto LABEL_108;
    }
  }
  else
  {
    v128 = 0;
    v89 = objc_msgSend((id)objc_opt_class(), "isConfigurationValid:error:", v112, &v128);
    featureFlagsConfiguration = (NSDictionary *)v128;
    if ((v89 & 1) != 0)
    {
      if (-[MCFeatureFlagsPayload isAllowedToWriteFeatureFlags](v10, "isAllowedToWriteFeatureFlags"))
      {

        goto LABEL_100;
      }
      v100 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(v111, "friendlyName");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      MCErrorArray(CFSTR("ERROR_PROFILE_DEFAULTS_BAD_SIGNATURE_P_ID"), v101, v102, v103, v104, v105, v106, v107, v91);
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCFeatureFlagsErrorDomain"), 58000, v99, CFSTR("MCFatalError"));
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      v87 = objc_msgSend(v108, "MCCopyAsPrimaryError");

      v14 = v108;
    }
    else
    {
      v90 = (void *)MEMORY[0x1E0CB35C8];
      -[MCPayload identifier](v10, "identifier");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      MCErrorArray(CFSTR("ERROR_FEATURE_FLAGS_INVALID_CONFIGURATION_P_ID"), v92, v93, v94, v95, v96, v97, v98, v91);
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", CFSTR("MCFeatureFlagsErrorDomain"), 58001, v99, featureFlagsConfiguration, CFSTR("MCFatalError"));
      v87 = objc_claimAutoreleasedReturnValue();
    }

    v15 = v115;
    v39 = v127;
LABEL_108:

    v14 = (id)v87;
  }

LABEL_61:
LABEL_62:

LABEL_63:
  if (v14)
  {
LABEL_64:
    -[MCPayload malformedPayloadErrorWithError:](v10, "malformedPayloadErrorWithError:", v14);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v56;
    if (v113)
      *v113 = objc_retainAutorelease(v56);
    v58 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      v59 = v58;
      v60 = (void *)objc_opt_class();
      v61 = v60;
      objc_msgSend(v57, "MCVerboseDescription");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v160 = v60;
      v161 = 2114;
      v162 = v62;
      _os_log_impl(&dword_19ECC4000, v59, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);

    }
    v10 = 0;
  }
  if (objc_msgSend(v8, "count"))
  {
    v63 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
    {
      v64 = v63;
      -[MCPayload friendlyName](v10, "friendlyName");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v160 = v65;
      v161 = 2114;
      v162 = v8;
      _os_log_impl(&dword_19ECC4000, v64, OS_LOG_TYPE_INFO, "Payload “%{public}@” contains ignored fields. They are: %{public}@", buf, 0x16u);

    }
  }

LABEL_73:
  return v10;
}

- (id)stubDictionary
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MCFeatureFlagsPayload;
  -[MCPayload stubDictionary](&v6, sel_stubDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCFeatureFlagsPayload featureFlagsConfiguration](self, "featureFlagsConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v4);

  return v3;
}

- (id)verboseDescription
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MCFeatureFlagsPayload;
  -[MCPayload verboseDescription](&v8, sel_verboseDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[MCFeatureFlagsPayload featureFlagsConfiguration](self, "featureFlagsConfiguration");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    objc_msgSend(v4, "appendFormat:", CFSTR("\nconfiguration: %@"), v5);

  return v4;
}

- (id)title
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  MCLocalizedString(CFSTR("FEATURE_FLAGS_DESCRIPTION_PLURAL_FORMAT"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)payloadDescriptionKeyValueSections
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  MCKeyValue *v7;
  void *v8;
  void *v9;
  void *v10;
  MCKeyValue *v11;
  MCKeyValue *v12;
  void *v13;
  void *v14;
  void *v15;
  MCKeyValue *v16;
  MCKeyValue *v17;
  void *v18;
  void *v19;
  void *v20;
  MCKeyValue *v21;
  void *v22;
  void *v23;
  void *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  -[MCFeatureFlagsPayload featureFlagsConfiguration](self, "featureFlagsConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("Disclosures"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("Features"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("Subscriptions"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  v25 = v3;
  if (v4)
  {
    v7 = [MCKeyValue alloc];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    MCFormattedStringForNumber(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("FEATURE_FLAG_DOMAINS"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[MCKeyValue initWithLocalizedString:localizedKey:](v7, "initWithLocalizedString:localizedKey:", v9, v10);

    v3 = v25;
    objc_msgSend(v6, "addObject:", v11);

  }
  if (v3)
  {
    v12 = [MCKeyValue alloc];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "count"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    MCFormattedStringForNumber(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("FEATURE_FLAG_DISCLOSURES"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[MCKeyValue initWithLocalizedString:localizedKey:](v12, "initWithLocalizedString:localizedKey:", v14, v15);

    v3 = v25;
    objc_msgSend(v6, "addObject:", v16);

  }
  if (v5)
  {
    v17 = [MCKeyValue alloc];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    MCFormattedStringForNumber(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("FEATURE_FLAG_SUBSCRIPTIONS"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[MCKeyValue initWithLocalizedString:localizedKey:](v17, "initWithLocalizedString:localizedKey:", v19, v20);

    v3 = v25;
    objc_msgSend(v6, "addObject:", v21);

  }
  if (objc_msgSend(v6, "count"))
  {
    +[MCKeyValueSection sectionWithKeyValues:](MCKeyValueSection, "sectionWithKeyValues:", v6);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (NSDictionary)featureFlagsConfiguration
{
  return self->_featureFlagsConfiguration;
}

- (unint64_t)featureFlagCount
{
  return self->_featureFlagCount;
}

- (unint64_t)disclosureCount
{
  return self->_disclosureCount;
}

- (unint64_t)subscriptionCount
{
  return self->_subscriptionCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureFlagsConfiguration, 0);
}

@end
