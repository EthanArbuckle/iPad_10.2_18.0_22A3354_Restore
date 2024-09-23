@implementation MCRestrictionsPayload

+ (id)typeStrings
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", CFSTR("com.apple.applicationaccess"));
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

  return MCLocalizedFormat(CFSTR("APPLICATION_ACCESS_DESCRIPTION_SINGULAR_FORMAT"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
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

  return MCLocalizedFormat(CFSTR("APPLICATION_ACCESS_DESCRIPTION_PLURAL_FORMAT"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (id)restrictions
{
  return self->_restrictions;
}

+ (id)_unsupervisedAllowedKeys
{
  if (_unsupervisedAllowedKeys_onceToken != -1)
    dispatch_once(&_unsupervisedAllowedKeys_onceToken, &__block_literal_global_26);
  return (id)_unsupervisedAllowedKeys_dict;
}

void __49__MCRestrictionsPayload__unsupervisedAllowedKeys__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint8_t v11[16];

  v0 = (void *)MEMORY[0x1E0C99D80];
  MCGetBaseResourcePath();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("unsupervisedRestrictionPayloadKeys.plist"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "dictionaryWithContentsOfFile:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_unsupervisedAllowedKeys_dict;
  _unsupervisedAllowedKeys_dict = v3;

  +[MCRestrictionManager allowedGrandfatheredRestrictionPayloadKeysDictionary](MCRestrictionManager, "allowedGrandfatheredRestrictionPayloadKeysDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0D44768], "sharedConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isSupervised");

    if ((v7 & 1) == 0)
    {
      v8 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_19ECC4000, v8, OS_LOG_TYPE_DEFAULT, "Applying deprecated restriction keys to allowed unsupervised keys...", v11, 2u);
      }
      +[MCRestrictionManager addRestrictionPayloadKeysDictionary:toRestrictionPayloadKeysDictionary:](MCRestrictionManager, "addRestrictionPayloadKeysDictionary:toRestrictionPayloadKeysDictionary:", v5, _unsupervisedAllowedKeys_dict);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)_unsupervisedAllowedKeys_dict;
      _unsupervisedAllowedKeys_dict = v9;

    }
  }

}

+ (id)_supervisedAllowedKeys
{
  if (_supervisedAllowedKeys_onceToken != -1)
    dispatch_once(&_supervisedAllowedKeys_onceToken, &__block_literal_global_29);
  return (id)_supervisedAllowedKeys_dict;
}

void __47__MCRestrictionsPayload__supervisedAllowedKeys__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0C99D80];
  MCGetBaseResourcePath();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("supervisedRestrictionPayloadKeys.plist"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "dictionaryWithContentsOfFile:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_supervisedAllowedKeys_dict;
  _supervisedAllowedKeys_dict = v2;

}

+ (id)allAllowedPlatformKeys
{
  if (allAllowedPlatformKeys_onceToken != -1)
    dispatch_once(&allAllowedPlatformKeys_onceToken, &__block_literal_global_32);
  return (id)allAllowedPlatformKeys_dict;
}

void __47__MCRestrictionsPayload_allAllowedPlatformKeys__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;

  +[MCRestrictionsPayload _supervisedAllowedKeys](MCRestrictionsPayload, "_supervisedAllowedKeys");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)objc_msgSend(v0, "mutableCopy");

  +[MCRestrictionsPayload _platformSpecificKeyFilter](MCRestrictionsPayload, "_platformSpecificKeyFilter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "MCFilterRestrictionPayloadKeys:", v3);
  v2 = (void *)allAllowedPlatformKeys_dict;
  allAllowedPlatformKeys_dict = (uint64_t)v1;

}

+ (id)userEnrollmentAllowedKeysFilter
{
  if (userEnrollmentAllowedKeysFilter_onceToken != -1)
    dispatch_once(&userEnrollmentAllowedKeysFilter_onceToken, &__block_literal_global_34_0);
  return (id)userEnrollmentAllowedKeysFilter_dict;
}

void __56__MCRestrictionsPayload_userEnrollmentAllowedKeysFilter__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0C99D80];
  MCGetBaseResourcePath();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("UserEnrollmentRestrictionPayloadKeysFilter.plist"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "dictionaryWithContentsOfFile:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)userEnrollmentAllowedKeysFilter_dict;
  userEnrollmentAllowedKeysFilter_dict = v2;

}

+ (id)_platformSpecificKeyFilter
{
  uint64_t *v2;

  if (MCGestaltIsAppleTV())
  {
    if (_AppleTVAllowedKeysFilter_onceToken != -1)
      dispatch_once(&_AppleTVAllowedKeysFilter_onceToken, &__block_literal_global_483);
    v2 = &_AppleTVAllowedKeysFilter_dict;
  }
  else if (MCGestaltIsWatch())
  {
    if (_WatchAllowedKeysFilter_onceToken != -1)
      dispatch_once(&_WatchAllowedKeysFilter_onceToken, &__block_literal_global_486);
    v2 = &_WatchAllowedKeysFilter_dict;
  }
  else if (MCGestaltIsVisionDevice())
  {
    if (_VisionProAllowedKeysFilter_onceToken != -1)
      dispatch_once(&_VisionProAllowedKeysFilter_onceToken, &__block_literal_global_489);
    v2 = &_VisionProAllowedKeysFilter_dict;
  }
  else if (objc_msgSend(MEMORY[0x1E0D1C1E8], "isSharediPad"))
  {
    if (_ephemeralMultiUserAllowedKeysFilter_onceToken != -1)
      dispatch_once(&_ephemeralMultiUserAllowedKeysFilter_onceToken, &__block_literal_global_492);
    v2 = &_ephemeralMultiUserAllowedKeysFilter_dict;
  }
  else
  {
    if (_singleUserAllowedKeysFilter_onceToken != -1)
      dispatch_once(&_singleUserAllowedKeysFilter_onceToken, &__block_literal_global_495);
    v2 = &_singleUserAllowedKeysFilter_dict;
  }
  return (id)*v2;
}

- (id)_invalidFieldErrorWithFieldName:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v8 = (void *)MEMORY[0x1E0CB35C8];
  MCErrorArray(CFSTR("ERROR_PROFILE_FIELD_INVALID_P_FIELD"), (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCProfileErrorDomain"), 1003, v9, CFSTR("MCFatalError"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (MCRestrictionsPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSMutableDictionary *v19;
  NSMutableDictionary *restrictions;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  int v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  uint64_t v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  int v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  id v72;
  uint64_t k;
  uint64_t v74;
  void *v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  char v82;
  void *v83;
  id v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t m;
  void *v89;
  void *v90;
  void *v91;
  char v92;
  void *v93;
  int v94;
  void *v95;
  int v96;
  void *v97;
  int v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t n;
  void *v103;
  void *v104;
  void *v105;
  char v106;
  void *v107;
  int v108;
  void *v109;
  int v110;
  void *v111;
  int v112;
  void *v113;
  void *v114;
  void *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  id v123;
  void *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  void *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  NSObject *v145;
  void *v146;
  id v147;
  void *v148;
  void *v150;
  uint64_t v151;
  id *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  id v162;
  id v163;
  id v164;
  id v165;
  id v166;
  id v167;
  void *v168;
  id v169;
  id v170;
  id v171;
  id v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  id obj;
  void *v178;
  void *v179;
  MCRestrictionsPayload *v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  objc_super v213;
  uint8_t buf[4];
  void *v215;
  __int16 v216;
  void *v217;
  _BYTE v218[128];
  _BYTE v219[128];
  const __CFString *v220;
  id v221;
  _BYTE v222[128];
  _BYTE v223[128];
  const __CFString *v224;
  id v225;
  const __CFString *v226;
  void *v227;
  _BYTE v228[128];
  _BYTE v229[128];
  _BYTE v230[128];
  _BYTE v231[128];
  uint64_t v232;

  v232 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v213.receiver = self;
  v213.super_class = (Class)MCRestrictionsPayload;
  v180 = -[MCPayload initWithDictionary:profile:outError:](&v213, sel_initWithDictionary_profile_outError_, v8, v9, a5);
  if (!v180)
  {
    v180 = 0;
    goto LABEL_130;
  }
  v152 = a5;
  v159 = v9;
  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "defaultRestrictions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("restrictedBool"));
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  v156 = v11;
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("restrictedValue"));
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D44768], "sharedConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isSupervised"))
  {

  }
  else
  {
    -[MCPayload profile](v180, "profile");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isStub");

    if (!v14)
    {
      buf[0] = 0;
      v68 = (void *)objc_opt_class();
      objc_msgSend(v159, "signerCertificates");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "evaluateTrustOfCertificateChain:signatureVersion:outIsAllowedToInstallUnsupportedPayloads:outIsAllowedToWriteDefaults:outIsAllowedToInstallSupervisedRestrictionsOnUnsupervisedDevices:", v69, 0, 0, 0, buf);

      if (!buf[0])
      {
        +[MCRestrictionsPayload _unsupervisedAllowedKeys](MCRestrictionsPayload, "_unsupervisedAllowedKeys");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      }
    }
  }
  +[MCRestrictionsPayload _supervisedAllowedKeys](MCRestrictionsPayload, "_supervisedAllowedKeys");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
  v16 = v15;
  v17 = (void *)objc_msgSend(v15, "mutableCopy");

  +[MCRestrictionsPayload _platformSpecificKeyFilter](MCRestrictionsPayload, "_platformSpecificKeyFilter");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "MCFilterRestrictionPayloadKeys:");
  v155 = v17;
  v18 = (void *)objc_msgSend(v17, "copy");
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("restrictedBool"));
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("restrictedValue"));
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("intersection"));
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  v153 = v18;
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("union"));
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  restrictions = v180->_restrictions;
  v180->_restrictions = v19;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v21 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v22 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v23 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v24 = objc_claimAutoreleasedReturnValue();
  v175 = (void *)v21;
  -[NSMutableDictionary setObject:forKeyedSubscript:](v180->_restrictions, "setObject:forKeyedSubscript:", v21, CFSTR("restrictedBool"));
  v173 = (void *)v22;
  -[NSMutableDictionary setObject:forKeyedSubscript:](v180->_restrictions, "setObject:forKeyedSubscript:", v22, CFSTR("restrictedValue"));
  v168 = (void *)v23;
  -[NSMutableDictionary setObject:forKeyedSubscript:](v180->_restrictions, "setObject:forKeyedSubscript:", v23, CFSTR("intersection"));
  v161 = (void *)v24;
  -[NSMutableDictionary setObject:forKeyedSubscript:](v180->_restrictions, "setObject:forKeyedSubscript:", v24, CFSTR("union"));
  v211 = 0u;
  v212 = 0u;
  v209 = 0u;
  v210 = 0u;
  obj = v178;
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v209, v231, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v210;
    while (2)
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v210 != v27)
          objc_enumerationMutation(obj);
        v29 = *(_QWORD *)(*((_QWORD *)&v209 + 1) + 8 * i);
        objc_msgSend(v8, "objectForKey:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (v30)
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v176, "objectForKey:", v29);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = (id)objc_msgSend(v31, "MCMutableDeepCopy");

            if (!v32)
              v32 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            objc_msgSend(v32, "setObject:forKey:", v30, CFSTR("value"));
            objc_msgSend(v175, "setObject:forKey:", v32, v29);

          }
          else
          {
            -[MCPayload profile](v180, "profile");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = objc_msgSend(v33, "isStub");

            if (!v34)
            {
              -[MCRestrictionsPayload _invalidFieldErrorWithFieldName:](v180, "_invalidFieldErrorWithFieldName:", v29);
              v35 = (void *)objc_claimAutoreleasedReturnValue();

              if (v35)
                goto LABEL_124;
              goto LABEL_22;
            }
          }
        }

      }
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v209, v231, 16);
      if (v26)
        continue;
      break;
    }
  }

LABEL_22:
  v179 = v8;
  v207 = 0u;
  v208 = 0u;
  v205 = 0u;
  v206 = 0u;
  v36 = v160;
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v205, v230, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v206;
    while (2)
    {
      for (j = 0; j != v38; ++j)
      {
        if (*(_QWORD *)v206 != v39)
          objc_enumerationMutation(v36);
        v41 = *(_QWORD *)(*((_QWORD *)&v205 + 1) + 8 * j);
        objc_msgSend(v8, "objectForKey:", v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        if (v42)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v174, "objectForKey:", v41);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = (id)objc_msgSend(v43, "MCMutableDeepCopy");

            if (!v44)
              v44 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            objc_msgSend(v44, "setObject:forKey:", v42, CFSTR("value"));
            objc_msgSend(v173, "setObject:forKey:", v44, v41);

          }
          else
          {
            -[MCPayload profile](v180, "profile");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = objc_msgSend(v45, "isStub");

            if (!v46)
            {
              -[MCRestrictionsPayload _invalidFieldErrorWithFieldName:](v180, "_invalidFieldErrorWithFieldName:", v41);
              v35 = (void *)objc_claimAutoreleasedReturnValue();

              if (v35)
                goto LABEL_124;
              goto LABEL_37;
            }
          }
        }

      }
      v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v205, v230, 16);
      if (v38)
        continue;
      break;
    }
  }

LABEL_37:
  v203 = 0u;
  v204 = 0u;
  v201 = 0u;
  v202 = 0u;
  v169 = v158;
  v47 = objc_msgSend(v169, "countByEnumeratingWithState:objects:count:", &v201, v229, 16);
  if (!v47)
  {
LABEL_62:

    goto LABEL_66;
  }
  v48 = v47;
  v49 = *(id *)v202;
  v162 = *(id *)v202;
LABEL_39:
  v50 = 0;
  v164 = (id)v48;
  while (1)
  {
    if (*(id *)v202 != v49)
      objc_enumerationMutation(v169);
    v51 = *(_QWORD *)(*((_QWORD *)&v201 + 1) + 8 * v50);
    objc_msgSend(v8, "objectForKeyedSubscript:", v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (v52)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v199 = 0u;
        v200 = 0u;
        v197 = 0u;
        v198 = 0u;
        v53 = v52;
        v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v197, v228, 16);
        if (v54)
        {
          v55 = v54;
          v56 = *(_QWORD *)v198;
LABEL_46:
          v57 = 0;
          while (1)
          {
            if (*(_QWORD *)v198 != v56)
              objc_enumerationMutation(v53);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              break;
            if (v55 == ++v57)
            {
              v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v197, v228, 16);
              if (v55)
                goto LABEL_46;
              goto LABEL_52;
            }
          }
          -[MCRestrictionsPayload _invalidFieldErrorWithFieldName:](v180, "_invalidFieldErrorWithFieldName:", v51);
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v35)
            goto LABEL_56;

          goto LABEL_124;
        }
LABEL_52:

LABEL_56:
        +[MCRestrictionUtilities intersectionFeatureForPayloadRestrictionKey:](MCRestrictionUtilities, "intersectionFeatureForPayloadRestrictionKey:", v51);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v168, "objectForKeyedSubscript:", v60);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        if (v61)
        {
          v62 = objc_alloc(MEMORY[0x1E0C99E20]);
          objc_msgSend(v61, "objectForKeyedSubscript:", CFSTR("values"));
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = (void *)objc_msgSend(v62, "initWithArray:", v63);

          v65 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v53);
          objc_msgSend(v64, "intersectSet:", v65);
          v226 = CFSTR("values");
          objc_msgSend(v64, "allObjects");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          v227 = v66;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v227, &v226, 1);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v168, "setObject:forKeyedSubscript:", v67, v60);

          v8 = v179;
        }
        else
        {
          v224 = CFSTR("values");
          v225 = v53;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v225, &v224, 1);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v168, "setObject:forKeyedSubscript:", v64, v60);
        }
        v48 = (uint64_t)v164;

        v49 = v162;
        goto LABEL_60;
      }
      -[MCPayload profile](v180, "profile");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = objc_msgSend(v58, "isStub");

      if (!v59)
        break;
    }
LABEL_60:

    if (++v50 == v48)
    {
      v48 = objc_msgSend(v169, "countByEnumeratingWithState:objects:count:", &v201, v229, 16);
      if (v48)
        goto LABEL_39;
      goto LABEL_62;
    }
  }
  -[MCRestrictionsPayload _invalidFieldErrorWithFieldName:](v180, "_invalidFieldErrorWithFieldName:", v51);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
    goto LABEL_124;
LABEL_66:
  v195 = 0u;
  v196 = 0u;
  v193 = 0u;
  v194 = 0u;
  v170 = v157;
  v70 = objc_msgSend(v170, "countByEnumeratingWithState:objects:count:", &v193, v223, 16);
  if (v70)
  {
    v71 = v70;
    v72 = *(id *)v194;
    v165 = *(id *)v194;
    while (2)
    {
      for (k = 0; k != v71; ++k)
      {
        if (*(id *)v194 != v72)
          objc_enumerationMutation(v170);
        v74 = *(_QWORD *)(*((_QWORD *)&v193 + 1) + 8 * k);
        objc_msgSend(v179, "objectForKeyedSubscript:", v74);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        if (v75)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v191 = 0u;
            v192 = 0u;
            v189 = 0u;
            v190 = 0u;
            v76 = v75;
            v77 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v189, v222, 16);
            if (v77)
            {
              v78 = v77;
              v79 = *(_QWORD *)v190;
LABEL_75:
              v80 = 0;
              while (1)
              {
                if (*(_QWORD *)v190 != v79)
                  objc_enumerationMutation(v76);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                  break;
                if (v78 == ++v80)
                {
                  v78 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v189, v222, 16);
                  if (v78)
                    goto LABEL_75;
                  goto LABEL_81;
                }
              }
              -[MCRestrictionsPayload _invalidFieldErrorWithFieldName:](v180, "_invalidFieldErrorWithFieldName:", v74);
              v35 = (void *)objc_claimAutoreleasedReturnValue();

              if (v35)
                goto LABEL_91;
            }
            else
            {
LABEL_81:

            }
            v220 = CFSTR("values");
            v221 = v76;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v221, &v220, 1);
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v161, "setObject:forKeyedSubscript:", v83, v74);

            v72 = v165;
          }
          else
          {
            -[MCPayload profile](v180, "profile");
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            v82 = objc_msgSend(v81, "isStub");

            if ((v82 & 1) == 0)
            {
              -[MCRestrictionsPayload _invalidFieldErrorWithFieldName:](v180, "_invalidFieldErrorWithFieldName:", v74);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_91:

              goto LABEL_92;
            }
          }
        }

      }
      v71 = objc_msgSend(v170, "countByEnumeratingWithState:objects:count:", &v193, v223, 16);
      if (v71)
        continue;
      break;
    }
    v35 = 0;
LABEL_92:
    v8 = v179;
  }
  else
  {
    v35 = 0;
  }

  if ((objc_msgSend(v159, "isStub") & 1) == 0)
  {
    +[MCRestrictionManager unionValuesForFeature:withRestrictionsDictionary:](MCRestrictionManager, "unionValuesForFeature:withRestrictionsDictionary:");
    v185 = 0u;
    v186 = 0u;
    v187 = 0u;
    v188 = 0u;
    v84 = (id)objc_claimAutoreleasedReturnValue();
    v85 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v185, v219, 16);
    if (v85)
    {
      v86 = v85;
      v87 = *(_QWORD *)v186;
      v171 = (id)*MEMORY[0x1E0CA57E8];
      v166 = v84;
      while (2)
      {
        for (m = 0; m != v86; ++m)
        {
          if (*(_QWORD *)v186 != v87)
            objc_enumerationMutation(v166);
          v89 = *(void **)(*((_QWORD *)&v185 + 1) + 8 * m);
          objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:", v89);
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v90, "appTags");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          v92 = objc_msgSend(v91, "containsObject:", CFSTR("hidden"));

          objc_msgSend(v90, "bundleType");
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          v94 = objc_msgSend(v93, "isEqualToString:", v171);

          objc_msgSend(v90, "appState");
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          v96 = objc_msgSend(v95, "isAlwaysAvailable");

          if (v96 && (v92 & 1) == 0 && !v94
            || (MCUnrestrictableApps(),
                v97 = (void *)objc_claimAutoreleasedReturnValue(),
                v98 = objc_msgSend(v97, "containsObject:", v89),
                v97,
                v98))
          {
            v123 = v89;

            v84 = v166;
            v124 = (void *)MEMORY[0x1E0CB35C8];
            MCErrorArray(CFSTR("ERROR_PROFILE_FIELD_INVALID_VALUE_P_FIELD_P_VALUE"), v125, v126, v127, v128, v129, v130, v131, CFSTR("blacklistedAppBundleIDs"));
            v113 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v124, "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCPayloadErrorDomain"), 2004, v113, CFSTR("MCFatalError"));
            v115 = v35;
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v8 = v179;
            goto LABEL_122;
          }

        }
        v84 = v166;
        v86 = objc_msgSend(v166, "countByEnumeratingWithState:objects:count:", &v185, v219, 16);
        v8 = v179;
        if (v86)
          continue;
        break;
      }
    }

    +[MCRestrictionManager unionValuesForFeature:withRestrictionsDictionary:](MCRestrictionManager, "unionValuesForFeature:withRestrictionsDictionary:");
    v181 = 0u;
    v182 = 0u;
    v183 = 0u;
    v184 = 0u;
    v163 = (id)objc_claimAutoreleasedReturnValue();
    v99 = objc_msgSend(v163, "countByEnumeratingWithState:objects:count:", &v181, v218, 16);
    if (v99)
    {
      v100 = v99;
      v101 = *(_QWORD *)v182;
      v172 = (id)*MEMORY[0x1E0CA57E8];
      v167 = v84;
      while (2)
      {
        for (n = 0; n != v100; ++n)
        {
          if (*(_QWORD *)v182 != v101)
            objc_enumerationMutation(v163);
          v103 = *(void **)(*((_QWORD *)&v181 + 1) + 8 * n);
          objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:", v103);
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v104, "appTags");
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          v106 = objc_msgSend(v105, "containsObject:", CFSTR("hidden"));

          objc_msgSend(v104, "bundleType");
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          v108 = objc_msgSend(v107, "isEqualToString:", v172);

          objc_msgSend(v104, "appState");
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          v110 = objc_msgSend(v109, "isAlwaysAvailable");

          if (v110 && (v106 & 1) == 0 && !v108
            || (MCUnrestrictableApps(),
                v111 = (void *)objc_claimAutoreleasedReturnValue(),
                v112 = objc_msgSend(v111, "containsObject:", v103),
                v111,
                v112))
          {
            v123 = v103;

            v113 = v163;
            v132 = (void *)MEMORY[0x1E0CB35C8];
            MCErrorArray(CFSTR("ERROR_PROFILE_FIELD_INVALID_VALUE_P_FIELD_P_VALUE"), v133, v134, v135, v136, v137, v138, v139, CFSTR("blockedAppBundleIDs"));
            v115 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v132, "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCPayloadErrorDomain"), 2004, v115, CFSTR("MCFatalError"));
            v140 = objc_claimAutoreleasedReturnValue();
            v8 = v179;
            v84 = v167;
            goto LABEL_121;
          }

        }
        v100 = objc_msgSend(v163, "countByEnumeratingWithState:objects:count:", &v181, v218, 16);
        v8 = v179;
        v84 = v167;
        if (v100)
          continue;
        break;
      }
    }
    v113 = v163;

    +[MCRestrictionManager intersectedValuesForFeature:withRestrictionsDictionary:](MCRestrictionManager, "intersectedValuesForFeature:withRestrictionsDictionary:", CFSTR("appLockBundleIDs"), v180->_restrictions);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    v115 = v114;
    if (v114 && !objc_msgSend(v114, "count"))
    {
      v150 = (void *)MEMORY[0x1E0CB35C8];
      MCErrorArray(CFSTR("ERROR_PROFILE_FIELD_INVALID_VALUE_P_FIELD"), v116, v117, v118, v119, v120, v121, v122, CFSTR("allowListedAppBundleIDs"));
      v151 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v150, "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCPayloadErrorDomain"), 2004, v151, CFSTR("MCFatalError"));
      v140 = objc_claimAutoreleasedReturnValue();

      v123 = 0;
      v35 = (void *)v151;
LABEL_121:

      v35 = (void *)v140;
    }
    else
    {
      v123 = 0;
    }
LABEL_122:

  }
  if (v35)
  {
LABEL_124:
    -[MCPayload malformedPayloadErrorWithError:](v180, "malformedPayloadErrorWithError:", v35);
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    v142 = v141;
    if (v152)
      *v152 = objc_retainAutorelease(v141);
    v143 = (void *)_MCLogObjects;
    v144 = v156;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      v145 = v143;
      v146 = (void *)objc_opt_class();
      v147 = v146;
      objc_msgSend(v142, "MCVerboseDescription");
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v215 = v146;
      v216 = 2114;
      v217 = v148;
      _os_log_impl(&dword_19ECC4000, v145, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);

    }
    v180 = 0;
  }
  else
  {
    v144 = v156;
  }

  v9 = v159;
LABEL_130:

  return v180;
}

- (id)stubDictionary
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t m;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v38;
  MCRestrictionsPayload *v39;
  id obj;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  objc_super v57;
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v57.receiver = self;
  v57.super_class = (Class)MCRestrictionsPayload;
  -[MCPayload stubDictionary](&v57, sel_stubDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = self;
  -[NSMutableDictionary objectForKey:](self->_restrictions, "objectForKey:", CFSTR("restrictedBool"));
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v54;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v54 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * i);
        objc_msgSend(obj, "objectForKey:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKey:", CFSTR("value"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "BOOLValue");

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKey:", v12, v8);

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
    }
    while (v5);
  }
  -[NSMutableDictionary objectForKey:](v39->_restrictions, "objectForKey:", CFSTR("restrictedValue"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v49, v60, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v50;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v50 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * j);
        objc_msgSend(v13, "objectForKey:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKey:", CFSTR("value"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v3, "setObject:forKey:", v20, v18);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v49, v60, 16);
    }
    while (v15);
  }
  -[NSMutableDictionary objectForKeyedSubscript:](v39->_restrictions, "objectForKeyedSubscript:", CFSTR("intersection"), v13);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v45, v59, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v46;
    do
    {
      for (k = 0; k != v23; ++k)
      {
        if (*(_QWORD *)v46 != v24)
          objc_enumerationMutation(v21);
        v26 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * k);
        objc_msgSend(v21, "objectForKeyedSubscript:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("values"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, v26);
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v45, v59, 16);
    }
    while (v23);
  }
  -[NSMutableDictionary objectForKeyedSubscript:](v39->_restrictions, "objectForKeyedSubscript:", CFSTR("union"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v41, v58, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v42;
    do
    {
      for (m = 0; m != v31; ++m)
      {
        if (*(_QWORD *)v42 != v32)
          objc_enumerationMutation(v29);
        v34 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * m);
        objc_msgSend(v29, "objectForKeyedSubscript:", v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("values"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, v34);
      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v41, v58, 16);
    }
    while (v31);
  }

  return v3;
}

- (id)_restrictedFeatureStrings
{
  if (_restrictedFeatureStrings_once != -1)
    dispatch_once(&_restrictedFeatureStrings_once, &__block_literal_global_58_0);
  return (id)_restrictedFeatureStrings_sStrings;
}

void __50__MCRestrictionsPayload__restrictedFeatureStrings__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
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
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  int v70;
  uint64_t v71;
  void *v72;
  int v73;
  uint64_t v74;
  void *v75;
  int HasOysterCapability;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
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
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  _QWORD v147[136];
  _QWORD v148[138];

  v148[136] = *MEMORY[0x1E0C80C00];
  v147[0] = CFSTR("allowExplicitContent");
  MCLocalizedString(CFSTR("EXPLICIT_CONTENT"));
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  v148[0] = v146;
  v147[1] = CFSTR("allowSafari");
  MCLocalizedString(CFSTR("SAFARI"));
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  v148[1] = v145;
  v147[2] = CFSTR("allowiTunes");
  MCLocalizedString(CFSTR("ITUNES"));
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  v148[2] = v144;
  v147[3] = CFSTR("allowAppInstallation");
  MCLocalizedString(CFSTR("APP_INSTALL"));
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  v148[3] = v143;
  v147[4] = CFSTR("allowUIAppInstallation");
  MCLocalizedString(CFSTR("UI_APP_INSTALL"));
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  v148[4] = v142;
  v147[5] = CFSTR("allowAppClips");
  MCLocalizedString(CFSTR("FEATURE_APP_CLIP"));
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  v148[5] = v141;
  v147[6] = CFSTR("allowAppRemoval");
  MCLocalizedString(CFSTR("APP_REMOVAL"));
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  v148[6] = v140;
  v147[7] = CFSTR("allowSystemAppRemoval");
  MCLocalizedString(CFSTR("SYSTEM_APP_REMOVAL"));
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  v148[7] = v139;
  v147[8] = CFSTR("allowCamera");
  MCLocalizedString(CFSTR("CAMERA"));
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  v148[8] = v138;
  v147[9] = CFSTR("allowVideoConferencing");
  MCLocalizedString(CFSTR("FACETIME"));
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  v148[9] = v137;
  v147[10] = CFSTR("allowScreenShot");
  MCLocalizedString(CFSTR("SCREEN_SHOT"));
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  v148[10] = v136;
  v147[11] = CFSTR("allowRemoteScreenObservation");
  MCLocalizedString(CFSTR("REMOTE_SCREEN_OBSERVATION"));
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  v148[11] = v135;
  v147[12] = CFSTR("allowVoiceDialing");
  MCLocalizedString(CFSTR("VOICE_DIALING"));
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  v148[12] = v134;
  v147[13] = CFSTR("allowGlobalBackgroundFetchWhenRoaming");
  MCLocalizedString(CFSTR("ROAMING_FETCH"));
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  v148[13] = v133;
  v147[14] = CFSTR("allowMultiplayerGaming");
  MCLocalizedString(CFSTR("MULTIPLAYER"));
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  v148[14] = v132;
  v147[15] = CFSTR("allowAddingGameCenterFriends");
  MCLocalizedString(CFSTR("FEATURE_ADD_GC_FRIENDS"));
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  v148[15] = v131;
  v147[16] = CFSTR("allowCellularHDUploads");
  MCLocalizedString(CFSTR("FEATURE_HD_VIDEO_OVER_3G"));
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  v148[16] = v130;
  v147[17] = CFSTR("allowAccountModification");
  MCLocalizedString(CFSTR("FEATURE_ACCOUNT_MODIFICATION"));
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  v148[17] = v129;
  v147[18] = CFSTR("allowFindMyFriendsModification");
  MCLocalizedString(CFSTR("FEATURE_FMF_MODIFICATION"));
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  v148[18] = v128;
  v147[19] = CFSTR("allowAssistant");
  MCLocalizedString(CFSTR("FEATURE_ASSISTANT"));
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v148[19] = v127;
  v147[20] = CFSTR("allowGameCenter");
  MCLocalizedString(CFSTR("FEATURE_GAME_CENTER"));
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v148[20] = v126;
  v147[21] = CFSTR("allowChat");
  MCLocalizedString(CFSTR("FEATURE_CHAT"));
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  v148[21] = v125;
  v147[22] = CFSTR("allowCloudBackup");
  MCLocalizedString(CFSTR("FEATURE_CLOUD_BACKUP"));
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v148[22] = v124;
  v147[23] = CFSTR("allowPhotoStream");
  MCLocalizedString(CFSTR("FEATURE_PHOTO_STREAM"));
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v148[23] = v123;
  v147[24] = CFSTR("allowCloudPhotoLibrary");
  MCLocalizedString(CFSTR("FEATURE_CLOUD_PHOTO_LIBRARY"));
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v148[24] = v122;
  v147[25] = CFSTR("allowDiagnosticSubmission");
  MCLocalizedString(CFSTR("FEATURE_DIAGNOSTIC_SUB"));
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v148[25] = v121;
  v147[26] = CFSTR("allowDiagnosticSubmissionModification");
  MCLocalizedString(CFSTR("FEATURE_DIAGNOSTIC_SUB_MODIFICATION"));
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v148[26] = v120;
  v147[27] = CFSTR("allowSiriServerLogging");
  MCLocalizedString(CFSTR("FEATURE_SIRI_SERVER_LOGGING"));
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v148[27] = v119;
  v147[28] = CFSTR("allowUntrustedTLSPrompt");
  MCLocalizedString(CFSTR("FEATURE_UNTRUSTED_TLS"));
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v148[28] = v118;
  v147[29] = CFSTR("allowInAppPurchases");
  MCLocalizedString(CFSTR("FEATURE_IN_APP_PURCHASE"));
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v148[29] = v117;
  v147[30] = CFSTR("allowCloudDocumentSync");
  MCLocalizedString(CFSTR("FEATURE_DOCUMENT_SYNC"));
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v148[30] = v116;
  v147[31] = CFSTR("allowAssistantWhileLocked");
  MCLocalizedString(CFSTR("FEATURE_ASSISTANT_WHILE_LOCKED"));
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v148[31] = v115;
  v147[32] = CFSTR("safariAllowAutoFill");
  MCLocalizedString(CFSTR("FEATURE_SAFARI_AUTO_FILL"));
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v148[32] = v114;
  v147[33] = CFSTR("allowPasswordAutoFill");
  MCLocalizedString(CFSTR("FEATURE_PASSWORD_AUTO_FILL"));
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v148[33] = v113;
  v147[34] = CFSTR("allowPasswordSharing");
  MCLocalizedString(CFSTR("FEATURE_PASSWORD_SHARING"));
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v148[34] = v112;
  v147[35] = CFSTR("allowPasswordProximityRequests");
  MCLocalizedString(CFSTR("FEATURE_PASSWORD_PROXIMITY_REQUESTS"));
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v148[35] = v111;
  v147[36] = CFSTR("safariAllowJavaScript");
  MCLocalizedString(CFSTR("FEATURE_SAFARI_JAVASCRIPT"));
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v148[36] = v110;
  v147[37] = CFSTR("safariAllowPopups");
  MCLocalizedString(CFSTR("FEATURE_SAFARI_POPUPS"));
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v148[37] = v109;
  v147[38] = CFSTR("allowBookstore");
  MCLocalizedString(CFSTR("FEATURE_BOOKSTORE"));
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v148[38] = v108;
  v147[39] = CFSTR("allowBookstoreErotica");
  MCLocalizedString(CFSTR("FEATURE_BOOKSTORE_EROTICA"));
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v148[39] = v107;
  v147[40] = CFSTR("allowPassbookWhileLocked");
  MCLocalizedString(CFSTR("FEATURE_PASSBOOK"));
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v148[40] = v106;
  v147[41] = CFSTR("allowSharedStream");
  MCLocalizedString(CFSTR("FEATURE_SHARED_STREAM"));
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v148[41] = v105;
  v147[42] = CFSTR("allowUIConfigurationProfileInstallation");
  MCLocalizedString(CFSTR("FEATURE_UI_INSTALLATION"));
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v148[42] = v104;
  v147[43] = CFSTR("allowHostPairing");
  MCLocalizedString(CFSTR("FEATURE_HOST_PAIRING"));
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v148[43] = v103;
  v147[44] = CFSTR("allowEraseContentAndSettings");
  MCLocalizedString(CFSTR("FEATURE_ERASE_CONTENT_AND_SETTINGS"));
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v148[44] = v102;
  v147[45] = CFSTR("allowHealth");
  MCLocalizedString(CFSTR("FEATURE_HEALTH"));
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v148[45] = v101;
  v147[46] = CFSTR("allowInstalledAppNearMeSuggestions");
  MCLocalizedString(CFSTR("FEATURE_INSTALLED_APP_NEAR_ME_SUGGESTIONS"));
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v148[46] = v100;
  v147[47] = CFSTR("allowUninstalledAppNearMeSuggestions");
  MCLocalizedString(CFSTR("FEATURE_UNINSTALLED_APP_NEAR_ME_SUGGESTIONS"));
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v148[47] = v99;
  v147[48] = CFSTR("allowPodcasts");
  MCLocalizedString(CFSTR("FEATURE_PODCASTS"));
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v148[48] = v98;
  v147[49] = CFSTR("allowFindMyDevice");
  MCLocalizedString(CFSTR("FEATURE_FIND_MY_DEVICE"));
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v148[49] = v97;
  v147[50] = CFSTR("allowFindMyFriends");
  MCLocalizedString(CFSTR("FEATURE_FIND_MY_FRIENDS"));
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v148[50] = v96;
  v147[51] = CFSTR("allowHome");
  MCLocalizedString(CFSTR("FEATURE_HOME"));
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v148[51] = v95;
  v147[52] = CFSTR("allowEnablingRestrictions");
  MCLocalizedString(CFSTR("FEATURE_ENABLING_RESTRICTIONS"));
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v148[52] = v94;
  v147[53] = CFSTR("allowAppCellularDataModification");
  MCLocalizedString(CFSTR("FEATURE_APP_CELLULAR_MODIFY"));
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v148[53] = v93;
  v147[54] = CFSTR("allowCellularPlanModification");
  MCLocalizedString(CFSTR("FEATURE_CELLULAR_PLAN_MODIFY"));
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v148[54] = v92;
  v147[55] = CFSTR("allowVoiceConferencing");
  MCLocalizedString(CFSTR("FEATURE_AUDIO_CONFERENCE"));
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v148[55] = v91;
  v147[56] = CFSTR("allowOpenFromManagedToUnmanaged");
  MCLocalizedString(CFSTR("FEATURE_OPEN_IN_MANAGED_TO_UNMANAGED"));
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v148[56] = v90;
  v147[57] = CFSTR("allowOpenFromUnmanagedToManaged");
  MCLocalizedString(CFSTR("FEATURE_OPEN_IN_UNMANAGED_TO_MANAGED"));
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v148[57] = v89;
  v147[58] = CFSTR("allowCloudKeychainSync");
  MCLocalizedString(CFSTR("FEATURE_KEYCHAIN_SYNC"));
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v148[58] = v88;
  v147[59] = CFSTR("allowCloudPrivateRelay");
  MCLocalizedString(CFSTR("FEATURE_CLOUD_PRIVATE_RELAY"));
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v148[59] = v87;
  v147[60] = CFSTR("allowOTAPKIUpdates");
  MCLocalizedString(CFSTR("FEATURE_OTA_PKI_UPDATES"));
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v148[60] = v86;
  v147[61] = CFSTR("allowAutomaticAppDownloads");
  MCLocalizedString(CFSTR("FEATURE_AUTOMATIC_APP_DOWNLOADS"));
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v148[61] = v85;
  v147[62] = CFSTR("allowLockScreenTodayView");
  MCLocalizedString(CFSTR("FEATURE_LOCKSCREEN_TODAY_VIEW"));
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v148[62] = v84;
  v147[63] = CFSTR("allowLockScreenNotificationsView");
  MCLocalizedString(CFSTR("FEATURE_LOCKSCREEN_NOTIFICATIONS"));
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v148[63] = v83;
  v147[64] = CFSTR("allowLockScreenControlCenter");
  MCLocalizedString(CFSTR("FEATURE_LOCKSCREEN_CONTROL_CENTER"));
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v148[64] = v82;
  v147[65] = CFSTR("allowAirDrop");
  MCLocalizedString(CFSTR("FEATURE_AIRDROP"));
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v148[65] = v81;
  v147[66] = CFSTR("allowAirPrint");
  MCLocalizedString(CFSTR("FEATURE_AIRPRINT"));
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v148[66] = v80;
  v147[67] = CFSTR("allowAirPrintiBeaconDiscovery");
  MCLocalizedString(CFSTR("FEATURE_AIRPRINT_IBEACON_DISCOVERY"));
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v148[67] = v79;
  v147[68] = CFSTR("allowAirPrintCredentialsStorage");
  MCLocalizedString(CFSTR("FEATURE_AIRPRINT_CREDENTIALS_STORAGE"));
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v148[68] = v78;
  v147[69] = CFSTR("allowAssistantUserGeneratedContent");
  MCLocalizedString(CFSTR("FEATURE_ASSISTANT_UNCURATED"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v148[69] = v77;
  v147[70] = CFSTR("allowFingerprintModification");
  HasOysterCapability = MCGestaltHasOysterCapability();
  if (HasOysterCapability)
  {
    MCLocalizedString(CFSTR("FEATURE_OPTICDATA_MODIFICATION"));
    v0 = objc_claimAutoreleasedReturnValue();
    v74 = 0;
  }
  else if (MCGestaltHasPearlIDCapability())
  {
    MCLocalizedString(CFSTR("FEATURE_FACEDATA_MODIFICATION"));
    v0 = objc_claimAutoreleasedReturnValue();
    v74 = 0x100000000;
  }
  else
  {
    MCLocalizedString(CFSTR("FEATURE_FINGERPRINT_MODIFICATION"));
    v0 = objc_claimAutoreleasedReturnValue();
    v74 = 1;
  }
  v148[70] = v0;
  v147[71] = CFSTR("allowFingerprintForUnlock");
  v73 = MCGestaltHasOysterCapability();
  if (v73)
  {
    MCLocalizedString(CFSTR("FEATURE_OPTICDATA_UNLOCK"));
    v1 = objc_claimAutoreleasedReturnValue();
    v71 = 0;
  }
  else if (MCGestaltHasPearlIDCapability())
  {
    MCLocalizedString(CFSTR("FEATURE_FACEDATA_UNLOCK"));
    v1 = objc_claimAutoreleasedReturnValue();
    v71 = 0x100000000;
  }
  else
  {
    MCLocalizedString(CFSTR("FEATURE_FINGERPRINT_UNLOCK"));
    v1 = objc_claimAutoreleasedReturnValue();
    v71 = 1;
  }
  v148[71] = v1;
  v147[72] = CFSTR("allowFingerprintForContactlessPayment");
  v70 = MCGestaltHasOysterCapability();
  v75 = (void *)v0;
  v72 = (void *)v1;
  if (v70)
  {
    MCLocalizedString(CFSTR("FEATURE_OPTICDATA_INAPP_PAYMENT"));
    v2 = objc_claimAutoreleasedReturnValue();
    v68 = 0;
  }
  else if (MCGestaltHasPearlIDCapability())
  {
    MCLocalizedString(CFSTR("FEATURE_FACEDATA_INAPP_PAYMENT"));
    v2 = objc_claimAutoreleasedReturnValue();
    v68 = 0x100000000;
  }
  else
  {
    MCLocalizedString(CFSTR("FEATURE_FINGERPRINT_INAPP_PAYMENT"));
    v2 = objc_claimAutoreleasedReturnValue();
    v68 = 1;
  }
  v69 = (void *)v2;
  v148[72] = v2;
  v147[73] = CFSTR("allowAutoUnlock");
  MCLocalizedString(CFSTR("FEATURE_AUTO_UNLOCK"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v148[73] = v67;
  v147[74] = CFSTR("allowManagedAppsCloudSync");
  MCLocalizedString(CFSTR("FEATURE_MANAGED_APPS_CLOUD_SYNC"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v148[74] = v66;
  v147[75] = CFSTR("allowGeotagSharing");
  MCLocalizedString(CFSTR("FEATURE_GEOTAG_SHARING"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v148[75] = v65;
  v147[76] = CFSTR("allowSpotlightInternetResults");
  MCLocalizedString(CFSTR("FEATURE_SPOTLIGHT_INTERNET_RESULTS"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v148[76] = v64;
  v147[77] = CFSTR("allowActivityContinuation");
  MCLocalizedString(CFSTR("FEATURE_ACTIVITY_CONTINUATION"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v148[77] = v63;
  v147[78] = CFSTR("allowEnterpriseBookBackup");
  MCLocalizedString(CFSTR("FEATURE_ENTERPRISE_BOOK_BACKUP"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v148[78] = v62;
  v147[79] = CFSTR("allowEnterpriseBookMetadataSync");
  MCLocalizedString(CFSTR("FEATURE_ENTERPRISE_BOOK_METADATA_SYNC"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v148[79] = v61;
  v147[80] = CFSTR("allowPredictiveKeyboard");
  MCLocalizedString(CFSTR("FEATURE_PREDICTIVE_KEYBOARD"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v148[80] = v60;
  v147[81] = CFSTR("allowContinuousPathKeyboard");
  MCLocalizedString(CFSTR("FEATURE_CONTINUOUS_PATH_KEYBOARD"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v148[81] = v59;
  v147[82] = CFSTR("allowKeyboardShortcuts");
  MCLocalizedString(CFSTR("FEATURE_KEYBOARD_SHORTCUTS"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v148[82] = v58;
  v147[83] = CFSTR("allowSpellCheck");
  MCLocalizedString(CFSTR("FEATURE_SPELL_CHECK"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v148[83] = v57;
  v147[84] = CFSTR("allowAutoCorrection");
  MCLocalizedString(CFSTR("FEATURE_AUTOCORRECTION"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v148[84] = v56;
  v147[85] = CFSTR("allowDefinitionLookup");
  MCLocalizedString(CFSTR("FEATURE_DEFINITION_LOOKUP"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v148[85] = v55;
  v147[86] = CFSTR("allowSelectedTextSharing");
  MCLocalizedString(CFSTR("FEATURE_SELECTED_TEXT_SHARING"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v148[86] = v54;
  v147[87] = CFSTR("allowPairedWatch");
  MCLocalizedString(CFSTR("FEATURE_PAIRED_WATCH"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v148[87] = v53;
  v147[88] = CFSTR("allowPasscodeModification");
  MCLocalizedString(CFSTR("FEATURE_PASSCODE_MODIFICATION"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v148[88] = v52;
  v147[89] = CFSTR("allowDeviceNameModification");
  MCLocalizedString(CFSTR("FEATURE_DEVICE_NAME_MODIFICATION"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v148[89] = v51;
  v147[90] = CFSTR("allowWallpaperModification");
  MCLocalizedString(CFSTR("FEATURE_WALLPAPER_MODIFICATION"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v148[90] = v50;
  v147[91] = CFSTR("allowEnterpriseAppTrust");
  MCLocalizedString(CFSTR("FEATURE_ENTERPRISE_APP_TRUST"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v148[91] = v49;
  v147[92] = CFSTR("allowNews");
  MCLocalizedString(CFSTR("FEATURE_NEWS_APP"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v148[92] = v48;
  v147[93] = CFSTR("allowMusicService");
  MCLocalizedString(CFSTR("FEATURE_MUSIC_SERVICE"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v148[93] = v47;
  v147[94] = CFSTR("allowRadioService");
  MCLocalizedString(CFSTR("FEATURE_RADIO_SERVICE"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v148[94] = v46;
  v147[95] = CFSTR("allowBluetoothModification");
  MCLocalizedString(CFSTR("FEATURE_BLUETOOTH_MODIFICATION"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v148[95] = v45;
  v147[96] = CFSTR("allowPersonalHotspotModification");
  MCLocalizedString(CFSTR("FEATURE_PERSONALHOTSPOT_MODIFICATION"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v148[96] = v44;
  v147[97] = CFSTR("allowNFC");
  MCLocalizedString(CFSTR("FEATURE_NFC_ALLOWED"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v148[97] = v43;
  v147[98] = CFSTR("allowNotificationsModification");
  MCLocalizedString(CFSTR("FEATURE_NOTIFICATIONS_MODIFICATION"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v148[98] = v42;
  v147[99] = CFSTR("allowTodayView");
  MCLocalizedString(CFSTR("FEATURE_TODAY_VIEW"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v148[99] = v41;
  v147[100] = CFSTR("allowTodayViewModification");
  MCLocalizedString(CFSTR("FEATURE_TODAY_VIEW_MODIFICATION"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v148[100] = v40;
  v147[101] = CFSTR("allowDictation");
  MCLocalizedString(CFSTR("FEATURE_DICTATION"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v148[101] = v39;
  v147[102] = CFSTR("allowRemoteAppPairing");
  MCLocalizedString(CFSTR("FEATURE_REMOTE_APP_PAIRING"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v148[102] = v38;
  v147[103] = CFSTR("allowAirPlayIncomingRequests");
  MCLocalizedString(CFSTR("FEATURE_AIRPLAY_INCOMING_REQUESTS_ALLOWED"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v148[103] = v37;
  v147[104] = CFSTR("allowVPNCreation");
  MCLocalizedString(CFSTR("FEATURE_VPN_CREATION"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v148[104] = v36;
  v147[105] = CFSTR("allowDriverDoNotDisturbModifications");
  MCLocalizedString(CFSTR("FEATURE_DRIVER_DO_NOT_DISTURB_MODIFICATIONS"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v148[105] = v35;
  v147[106] = CFSTR("allowProximitySetupToNewDevice");
  MCLocalizedString(CFSTR("FEATURE_PROXIMITY_SET_UP"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v148[106] = v34;
  v147[107] = CFSTR("allowUSBRestrictedMode");
  MCLocalizedString(CFSTR("FEATURE_USB_RESTRICTED_MODE"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v148[107] = v33;
  v147[108] = CFSTR("allowESIMModification");
  MCLocalizedString(CFSTR("FEATURE_ESIM_MODIFICATION"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v148[108] = v32;
  v147[109] = CFSTR("allowFilesUSBDriveAccess");
  MCLocalizedString(CFSTR("FEATURE_USB_DRIVE_ACCESS_IN_FILES"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v148[109] = v31;
  v147[110] = CFSTR("allowUSBDriveAccess");
  MCLocalizedString(CFSTR("FEATURE_USB_DRIVE_ACCESS"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v148[110] = v30;
  v147[111] = CFSTR("allowFilesNetworkDriveAccess");
  MCLocalizedString(CFSTR("FEATURE_NETWORK_DRIVE_ACCESS_IN_FILES"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v148[111] = v29;
  v147[112] = CFSTR("allowDeviceSleep");
  MCLocalizedString(CFSTR("FEATURE_DEVICE_SLEEP"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v148[112] = v28;
  v147[113] = CFSTR("allowAutomaticScreenSaver");
  MCLocalizedString(CFSTR("FEATURE_AUTOMATIC_SCREEN_SAVER"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v148[113] = v27;
  v147[114] = CFSTR("allowSharedDeviceTemporarySession");
  MCLocalizedString(CFSTR("FEATURE_SHARED_DEVICE_TEMPORARY_SESSION"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v148[114] = v26;
  v147[115] = CFSTR("allowApplePersonalizedAdvertising");
  MCLocalizedString(CFSTR("FEATURE_APPLE_PERSONALIZED_ADVERTISING"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v148[115] = v25;
  v147[116] = CFSTR("allowMailPrivacyProtection");
  MCLocalizedString(CFSTR("FEATURE_MAIL_PRIVACY_PROTECTION"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v148[116] = v24;
  v147[117] = CFSTR("allowRapidSecurityResponseInstallation");
  MCLocalizedString(CFSTR("FEATURE_RAPID_SECURITY_RESPONSE_INSTALLATION"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v148[117] = v23;
  v147[118] = CFSTR("allowRapidSecurityResponseRemoval");
  MCLocalizedString(CFSTR("FEATURE_RAPID_SECURITY_RESPONSE_REMOVAL"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v148[118] = v22;
  v147[119] = CFSTR("allowiPhoneWidgetsOnMac");
  MCLocalizedString(CFSTR("FEATURE_IPHONE_WIDGETS_ON_MAC"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v148[119] = v21;
  v147[120] = CFSTR("allowAppsToBeHidden");
  MCLocalizedString(CFSTR("FEATURE_HIDDEN_APPS"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v148[120] = v20;
  v147[121] = CFSTR("allowAppsToBeLocked");
  MCLocalizedString(CFSTR("FEATURE_LOCKED_APPS"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v148[121] = v19;
  v147[122] = CFSTR("allowLiveVoicemail");
  MCLocalizedString(CFSTR("FEATURE_LIVE_VOICEMAIL"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v148[122] = v18;
  v147[123] = CFSTR("allowMarketplaceAppInstallation");
  MCLocalizedString(CFSTR("FEATURE_MARKETPLACE_APP_INSTALLATION"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v148[123] = v17;
  v147[124] = CFSTR("allowWebDistributionAppInstallation");
  MCLocalizedString(CFSTR("FEATURE_WEB_APP_INSTALLATION"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v148[124] = v16;
  v147[125] = CFSTR("allowAutoDim");
  MCLocalizedString(CFSTR("FEATURE_AUTO_DIM"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v148[125] = v15;
  v147[126] = CFSTR("allowESIMOutgoingTransfers");
  MCLocalizedString(CFSTR("FEATURE_ESIM_OUTGOING_TRANSFER"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v148[126] = v3;
  v147[127] = CFSTR("allowiPhoneMirroring");
  MCLocalizedString(CFSTR("FEATURE_IPHONE_MIRRORING"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v148[127] = v4;
  v147[128] = CFSTR("allowPersonalizedHandwritingResults");
  MCLocalizedString(CFSTR("FEATURE_PERSONALIZED_HANDWRITING"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v148[128] = v5;
  v147[129] = CFSTR("allowImageGeneration");
  MCLocalizedString(CFSTR("FEATURE_IMAGE_GENERATION"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v148[129] = v6;
  v147[130] = CFSTR("allowGenmoji");
  MCLocalizedString(CFSTR("FEATURE_GENMOJI"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v148[130] = v7;
  v147[131] = CFSTR("allowImagePlayground");
  MCLocalizedString(CFSTR("FEATURE_IMAGE_PLAYGROUND"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v148[131] = v8;
  v147[132] = CFSTR("allowImageWand");
  MCLocalizedString(CFSTR("FEATURE_IMAGE_WAND"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v148[132] = v9;
  v147[133] = CFSTR("allowiPhoneMirroring");
  MCLocalizedString(CFSTR("FEATURE_FEATURE3"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v148[133] = v10;
  v147[134] = CFSTR("allowVideoConferencingRemoteControl");
  MCLocalizedString(CFSTR("FEATURE_VIDEO_CONFERENCING_REMOTE_CONTROL"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v148[134] = v11;
  v147[135] = CFSTR("allowWritingTools");
  MCLocalizedString(CFSTR("FEATURE_WRITING_TOOLS"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v148[135] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v148, v147, 136);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)_restrictedFeatureStrings_sStrings;
  _restrictedFeatureStrings_sStrings = v13;

  if ((_DWORD)v68)
  if (HIDWORD(v68))

  if (v70)
  if ((_DWORD)v71)

  if (HIDWORD(v71))
  if (v73)

  if ((_DWORD)v74)
  if (HIDWORD(v74))

  if (HasOysterCapability)
}

- (id)_enforcedFeatureStrings
{
  if (_enforcedFeatureStrings_onceToken != -1)
    dispatch_once(&_enforcedFeatureStrings_onceToken, &__block_literal_global_343);
  return (id)_enforcedFeatureStrings_sStrings;
}

void __48__MCRestrictionsPayload__enforcedFeatureStrings__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[32];
  _QWORD v38[34];

  v38[32] = *MEMORY[0x1E0C80C00];
  v37[0] = CFSTR("forceITunesStorePasswordEntry");
  MCLocalizedString(CFSTR("FEATURE_ENTER_ITUNES_PASSWORD"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v36;
  v37[1] = CFSTR("forceFIPSVerification");
  MCLocalizedString(CFSTR("FEATURE_FIPS"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v35;
  v37[2] = CFSTR("forceAssistantProfanityFilter");
  MCLocalizedString(CFSTR("FEATURE_ASSISTANT_PROF_FILTER"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v38[2] = v34;
  v37[3] = CFSTR("forceAuthenticationBeforeAutoFill");
  MCLocalizedString(CFSTR("FEATURE_AUTHENTICATE_BEFORE_AUTO_FILL"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v38[3] = v33;
  v37[4] = CFSTR("forceEncryptedBackup");
  MCLocalizedString(CFSTR("FEATURE_ENCRYPTED_BACKUPS"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v38[4] = v32;
  v37[5] = CFSTR("safariForceFraudWarning");
  MCLocalizedString(CFSTR("FEATURE_SAFARI_FRAUD_WARNING"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v38[5] = v31;
  v37[6] = CFSTR("forceLimitAdTracking");
  MCLocalizedString(CFSTR("FEATURE_FORCE_LIMIT_AD_TRACKING"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v38[6] = v30;
  v37[7] = CFSTR("forceAirPlayOutgoingRequestsPairingPassword");
  MCLocalizedString(CFSTR("FEATURE_AIRPLAY_OUTGOING_REQUESTS_PAIRING_PASSWORD"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v38[7] = v29;
  v37[8] = CFSTR("forceAirPlayIncomingRequestsPairingPassword");
  MCLocalizedString(CFSTR("FEATURE_AIRPLAY_INCOMING_REQUESTS_PAIRING_PASSWORD"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v38[8] = v28;
  v37[9] = CFSTR("forceWatchWristDetection");
  MCLocalizedString(CFSTR("FEATURE_WATCH_WRIST_DETECT"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v38[9] = v27;
  v37[10] = CFSTR("forceConferenceRoomDisplay");
  MCLocalizedString(CFSTR("FEATURE_CONFERENCE_ROOM_MODE"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v38[10] = v26;
  v37[11] = CFSTR("forceAirDropUnmanaged");
  MCLocalizedString(CFSTR("FEATURE_AIRDROP_UNMANAGED"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v38[11] = v25;
  v37[12] = CFSTR("forceDelayedSoftwareUpdates");
  MCLocalizedString(CFSTR("FEATURE_DELAYED_SOFTWARE_UPDATES"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v38[12] = v24;
  v37[13] = CFSTR("forceWiFiWhitelisting");
  objc_msgSend(CFSTR("FEATURE_WIFI_ALLOW_LIST"), "MCAppendGreenteaSuffix");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  MCLocalizedString(v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v38[13] = v22;
  v37[14] = CFSTR("forceWiFiToAllowedNetworksOnly");
  objc_msgSend(CFSTR("FEATURE_WIFI_ALLOWED_NETWORKS_ONLY"), "MCAppendGreenteaSuffix");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  MCLocalizedString(v21);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v38[14] = v20;
  v37[15] = CFSTR("forceWiFiPowerOn");
  objc_msgSend(CFSTR("FEATURE_WIFI_POWER_MODIFICATION"), "MCAppendGreenteaSuffix");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  MCLocalizedString(v19);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v38[15] = v18;
  v37[16] = CFSTR("forceAutomaticDateAndTime");
  MCLocalizedString(CFSTR("FEATURE_AUTOMATIC_DATE_TIME"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v38[16] = v17;
  v37[17] = CFSTR("forceAirPrintTrustedTLSRequirement");
  MCLocalizedString(CFSTR("FEATURE_AIRPRINT_TRUSTED_TLS_REQUIREMENT"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v38[17] = v16;
  v37[18] = CFSTR("forceClassroomUnpromptedScreenObservation");
  MCLocalizedString(CFSTR("FEATURE_CLASSROOM_UNPROMPTED_SCREEN_OBSERVATION"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v38[18] = v15;
  v37[19] = CFSTR("forceUnpromptedManagedClassroomScreenObservation");
  MCLocalizedString(CFSTR("FEATURE_CLASSROOM_UNPROMPTED_SCREEN_OBSERVATION"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v38[19] = v14;
  v37[20] = CFSTR("forceClassroomAutomaticallyJoinClasses");
  MCLocalizedString(CFSTR("FEATURE_CLASSROOM_AUTOMATICALLY_JOIN_CLASSES"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v38[20] = v13;
  v37[21] = CFSTR("forceClassroomUnpromptedAppAndDeviceLock");
  MCLocalizedString(CFSTR("FEATURE_CLASSROOM_UNPROMPTED_APP_AND_DEVICE_LOCK"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v38[21] = v12;
  v37[22] = CFSTR("forceClassroomRequestPermissionToLeaveClasses");
  MCLocalizedString(CFSTR("FEATURE_CLASSROOM_REQUEST_PERMISSION_TO_LEAVE_CLASSES"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v38[22] = v0;
  v37[23] = CFSTR("allowManagedToWriteUnmanagedContacts");
  MCLocalizedString(CFSTR("FEATURE_MANAGED_WRITE_UNMANAGED_CONTACTS"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v38[23] = v1;
  v37[24] = CFSTR("allowUnmanagedToReadManagedContacts");
  MCLocalizedString(CFSTR("FEATURE_UNMANAGED_READ_MANAGED_CONTACTS"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v38[24] = v2;
  v37[25] = CFSTR("requireManagedPasteboard");
  MCLocalizedString(CFSTR("FEATURE_MANAGED_PASTEBOARD_REQUIRED"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v38[25] = v3;
  v37[26] = CFSTR("allowDeprecatedWebKitTLS");
  MCLocalizedString(CFSTR("FEATURE_WEBKIT_DEPRECATED_TLS"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v38[26] = v4;
  v37[27] = CFSTR("allowDeprecatedWebKitSynchronousXHRLoads");
  MCLocalizedString(CFSTR("FEATURE_WEBKIT_DEPRECATED_SYNCHRONOUSXHRLOADS"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v38[27] = v5;
  v37[28] = CFSTR("allowUnpairedExternalBootToRecovery");
  MCLocalizedString(CFSTR("FEATURE_UNPAIRED_EXTERNAL_BOOT_TO_RECOVERY"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v38[28] = v6;
  v37[29] = CFSTR("forceOnDeviceOnlyDictation");
  MCLocalizedStringByDevice(CFSTR("FEATURE_ON_DEVICE_ONLY_DICTATION"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v38[29] = v7;
  v37[30] = CFSTR("forceOnDeviceOnlyTranslation");
  MCLocalizedStringByDevice(CFSTR("FEATURE_ON_DEVICE_ONLY_TRANSLATION"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v38[30] = v8;
  v37[31] = CFSTR("forcePreserveESIMOnErase");
  MCLocalizedString(CFSTR("FEATURE_PRESERVE_ESIM_ON_ERASE"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v38[31] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 32);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)_enforcedFeatureStrings_sStrings;
  _enforcedFeatureStrings_sStrings = v10;

}

- (id)_intersectionStrings
{
  if (_intersectionStrings_onceToken != -1)
    dispatch_once(&_intersectionStrings_onceToken, &__block_literal_global_406);
  return (id)_intersectionStrings_sStrings;
}

void __45__MCRestrictionsPayload__intersectionStrings__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("autonomousSingleAppModePermittedAppIDs");
  MCLocalizedString(CFSTR("FEATURE_AUTONOMOUS_SAM_ALLOW_LIST"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v0;
  v4[1] = CFSTR("appLockBundleIDs");
  MCLocalizedString(CFSTR("FEATURE_APP_ALLOW_LIST"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_intersectionStrings_sStrings;
  _intersectionStrings_sStrings = v2;

}

- (id)_unionStrings
{
  if (_unionStrings_onceToken != -1)
    dispatch_once(&_unionStrings_onceToken, &__block_literal_global_411);
  return (id)_unionStrings_sStrings;
}

void __38__MCRestrictionsPayload__unionStrings__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("blacklistedAppBundleIDs");
  MCLocalizedString(CFSTR("FEATURE_PROHIBITED_APPS"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v0;
  v4[1] = CFSTR("blockedAppBundleIDs");
  MCLocalizedString(CFSTR("FEATURE_PROHIBITED_APPS"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_unionStrings_sStrings;
  _unionStrings_sStrings = v2;

}

- (id)_defaultValueRestrictions
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v17[3];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  if (_defaultValueRestrictions_once != -1)
    dispatch_once(&_defaultValueRestrictions_once, &__block_literal_global_420);
  v17[0] = CFSTR("normalMax");
  +[MCRestrictionManager maximumValueForSetting:](MCRestrictionManager, "maximumValueForSetting:", CFSTR("enforcedSoftwareUpdateDelay"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v2;
  v17[1] = CFSTR("normalMin");
  +[MCRestrictionManager minimumValueForSetting:](MCRestrictionManager, "minimumValueForSetting:", CFSTR("enforcedSoftwareUpdateDelay"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v3;
  v17[2] = CFSTR("localizedString");
  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "effectiveValueForSetting:", CFSTR("enforcedSoftwareUpdateDelay"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntValue");
  MCLocalizedFormat(CFSTR("FEATURE_SOFTWARE_UPDATE_DELAY"), v7, v8, v9, v10, v11, v12, v13, v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_defaultValueRestrictions_dict, "setObject:forKeyedSubscript:", v15, CFSTR("enforcedSoftwareUpdateDelay"));

  return (id)_defaultValueRestrictions_dict;
}

void __50__MCRestrictionsPayload__defaultValueRestrictions__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[3];
  _QWORD v20[3];
  _QWORD v21[3];
  _QWORD v22[3];
  _QWORD v23[3];
  _QWORD v24[3];
  _QWORD v25[3];
  _QWORD v26[3];
  _QWORD v27[4];
  _QWORD v28[6];

  v28[4] = *MEMORY[0x1E0C80C00];
  v27[0] = CFSTR("ratingMovies");
  v25[0] = CFSTR("normalMax");
  +[MCRestrictionManager maximumValueForSetting:](MCRestrictionManager, "maximumValueForSetting:", CFSTR("ratingMovies"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v18;
  v25[1] = CFSTR("normalMin");
  +[MCRestrictionManager minimumValueForSetting:](MCRestrictionManager, "minimumValueForSetting:", CFSTR("ratingMovies"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v17;
  v25[2] = CFSTR("localizedString");
  MCLocalizedString(CFSTR("MOVIE_RATING"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v15;
  v27[1] = CFSTR("ratingTVShows");
  v23[0] = CFSTR("normalMax");
  +[MCRestrictionManager maximumValueForSetting:](MCRestrictionManager, "maximumValueForSetting:", CFSTR("ratingTVShows"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v14;
  v23[1] = CFSTR("normalMin");
  +[MCRestrictionManager minimumValueForSetting:](MCRestrictionManager, "minimumValueForSetting:", CFSTR("ratingTVShows"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v13;
  v23[2] = CFSTR("localizedString");
  MCLocalizedString(CFSTR("TV_SHOW_RATING"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 3);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v0;
  v27[2] = CFSTR("ratingApps");
  v21[0] = CFSTR("normalMax");
  +[MCRestrictionManager maximumValueForSetting:](MCRestrictionManager, "maximumValueForSetting:", CFSTR("ratingApps"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v1;
  v21[1] = CFSTR("normalMin");
  +[MCRestrictionManager minimumValueForSetting:](MCRestrictionManager, "minimumValueForSetting:", CFSTR("ratingApps"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v2;
  v21[2] = CFSTR("localizedString");
  MCLocalizedString(CFSTR("APP_RATING"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v4;
  v27[3] = CFSTR("safariAcceptCookies");
  v19[0] = CFSTR("normalMax");
  +[MCRestrictionManager maximumValueForSetting:](MCRestrictionManager, "maximumValueForSetting:", CFSTR("safariAcceptCookies"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v5;
  v19[1] = CFSTR("normalMin");
  +[MCRestrictionManager minimumValueForSetting:](MCRestrictionManager, "minimumValueForSetting:", CFSTR("safariAcceptCookies"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v6;
  v19[2] = CFSTR("localizedString");
  MCLocalizedString(CFSTR("FEATURE_SAFARI_ACCEPT_COOKIES"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28[3] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "mutableCopy");
  v11 = (void *)_defaultValueRestrictions_dict;
  _defaultValueRestrictions_dict = v10;

}

- (id)localizedRestrictionStrings
{
  NSMutableDictionary *v3;
  void *v4;
  char v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  MCRestrictionsPayload *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  uint64_t v34;
  void *v35;
  void *v36;
  MCRestrictionsPayload *v37;
  void *v38;
  void *v39;
  void *v40;
  const __CFString *v41;
  void *v42;
  uint64_t v43;
  int v44;
  uint64_t v45;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t k;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t m;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v66;
  void *v67;
  NSMutableDictionary *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  void *v75;
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
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _BYTE v92[128];
  _BYTE v93[128];
  _BYTE v94[128];
  uint8_t v95[128];
  uint8_t buf[4];
  const char *v97;
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  v75 = (void *)objc_opt_new();
  v3 = self->_restrictions;
  objc_msgSend(MEMORY[0x1E0D44768], "sharedConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isSupervised");

  if ((v5 & 1) == 0)
  {
    v6 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v97 = "-[MCRestrictionsPayload localizedRestrictionStrings]";
      _os_log_impl(&dword_19ECC4000, v6, OS_LOG_TYPE_DEFAULT, "%s, Filter grandfathered restrictions", buf, 0xCu);
    }
    +[MCRestrictionManager filterGrandfatheredRestrictionsIfNeededFromRestrictions:](MCRestrictionManager, "filterGrandfatheredRestrictionsIfNeededFromRestrictions:", self->_restrictions);
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = (NSMutableDictionary *)v7;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", CFSTR("restrictedBool"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  -[NSMutableDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", CFSTR("restrictedValue"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", CFSTR("intersection"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = v3;
  -[NSMutableDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", CFSTR("union"));
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("allowCamera"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", CFSTR("value"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13 && (objc_msgSend(v13, "BOOLValue") & 1) == 0)
    objc_msgSend(v9, "removeObjectForKey:", CFSTR("allowVideoConferencing"));
  objc_msgSend(v9, "objectForKey:", CFSTR("allowAppRemoval"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", CFSTR("value"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15 && (objc_msgSend(v15, "BOOLValue") & 1) == 0)
    objc_msgSend(v9, "removeObjectForKey:", CFSTR("allowSystemAppRemoval"));
  objc_msgSend(v9, "objectForKey:", CFSTR("allowAirPrint"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKey:", CFSTR("value"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v72 = v17;
  if (v17 && (objc_msgSend(v17, "BOOLValue") & 1) == 0)
  {
    objc_msgSend(v9, "removeObjectForKey:", CFSTR("forceAirPrintTrustedTLSRequirement"));
    objc_msgSend(v9, "removeObjectForKey:", CFSTR("allowAirPrintiBeaconDiscovery"));
    objc_msgSend(v9, "removeObjectForKey:", CFSTR("allowAirPrintCredentialsStorage"));
  }
  v67 = v13;
  if ((objc_msgSend(MEMORY[0x1E0D1C1E8], "isSharediPad", v15) & 1) == 0)
    objc_msgSend(v9, "removeObjectForKey:", CFSTR("allowSharedDeviceTemporarySession"));
  v70 = v10;
  v71 = v9;
  v69 = v11;
  if (objc_msgSend(v9, "count"))
  {
    v18 = self;
    v90 = 0u;
    v91 = 0u;
    v88 = 0u;
    v89 = 0u;
    v19 = v9;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v88, v95, 16);
    if (!v20)
      goto LABEL_32;
    v21 = v20;
    v22 = *(_QWORD *)v89;
    while (1)
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v89 != v22)
          objc_enumerationMutation(v19);
        v24 = *(_QWORD *)(*((_QWORD *)&v88 + 1) + 8 * i);
        objc_msgSend(v19, "objectForKey:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectForKey:", CFSTR("value"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26)
        {
          if ((objc_msgSend(v26, "BOOLValue") & 1) != 0)
          {
            if (!objc_msgSend(v26, "BOOLValue"))
              goto LABEL_30;
            -[MCRestrictionsPayload _enforcedFeatureStrings](v18, "_enforcedFeatureStrings");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            -[MCRestrictionsPayload _restrictedFeatureStrings](v18, "_restrictedFeatureStrings");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v28 = v27;
          objc_msgSend(v27, "objectForKey:", v24);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          if (v29)
            objc_msgSend(v75, "addObject:", v29);

        }
LABEL_30:

      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v88, v95, 16);
      if (!v21)
      {
LABEL_32:

        self = v18;
        v10 = v70;
        v9 = v71;
        v11 = v69;
        break;
      }
    }
  }
  if (objc_msgSend(v10, "count"))
  {
    v86 = 0u;
    v87 = 0u;
    v84 = 0u;
    v85 = 0u;
    v30 = v10;
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v84, v94, 16);
    if (v31)
    {
      v32 = v31;
      v74 = *(_QWORD *)v85;
      do
      {
        for (j = 0; j != v32; ++j)
        {
          if (*(_QWORD *)v85 != v74)
            objc_enumerationMutation(v30);
          v34 = *(_QWORD *)(*((_QWORD *)&v84 + 1) + 8 * j);
          -[MCRestrictionsPayload _defaultValueRestrictions](self, "_defaultValueRestrictions");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "objectForKey:", v34);
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          if (v36)
          {
            v37 = self;
            objc_msgSend(v30, "objectForKeyedSubscript:", v34);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("value"));
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("preferSmallerValues"));
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v40, "BOOLValue"))
              v41 = CFSTR("normalMax");
            else
              v41 = CFSTR("normalMin");
            objc_msgSend(v36, "objectForKeyedSubscript:", v41);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            if (v39)
            {
              v43 = objc_msgSend(v39, "compare:", v42);
              v44 = objc_msgSend(v40, "BOOLValue");
              v45 = -1;
              if (!v44)
                v45 = 1;
              if (v43 == v45)
              {
                objc_msgSend(v36, "objectForKey:", CFSTR("localizedString"));
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v75, "addObject:", v46);

              }
            }

            self = v37;
          }

        }
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v84, v94, 16);
      }
      while (v32);
    }

    v10 = v70;
    v9 = v71;
    v11 = v69;
  }
  if (objc_msgSend(v11, "count"))
  {
    v82 = 0u;
    v83 = 0u;
    v80 = 0u;
    v81 = 0u;
    v47 = v11;
    v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v80, v93, 16);
    if (v48)
    {
      v49 = v48;
      v50 = *(_QWORD *)v81;
      do
      {
        for (k = 0; k != v49; ++k)
        {
          if (*(_QWORD *)v81 != v50)
            objc_enumerationMutation(v47);
          v52 = *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * k);
          -[MCRestrictionsPayload _intersectionStrings](self, "_intersectionStrings");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "objectForKeyedSubscript:", v52);
          v54 = (void *)objc_claimAutoreleasedReturnValue();

          if (v54)
            objc_msgSend(v75, "addObject:", v54);

        }
        v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v80, v93, 16);
      }
      while (v49);
    }

  }
  v55 = v73;
  if (objc_msgSend(v73, "count"))
  {
    v78 = 0u;
    v79 = 0u;
    v76 = 0u;
    v77 = 0u;
    v56 = v73;
    v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v76, v92, 16);
    if (v57)
    {
      v58 = v57;
      v59 = *(_QWORD *)v77;
      do
      {
        for (m = 0; m != v58; ++m)
        {
          if (*(_QWORD *)v77 != v59)
            objc_enumerationMutation(v56);
          v61 = *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * m);
          -[MCRestrictionsPayload _unionStrings](self, "_unionStrings");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "objectForKeyedSubscript:", v61);
          v63 = (void *)objc_claimAutoreleasedReturnValue();

          if (v63)
            objc_msgSend(v75, "addObject:", v63);

        }
        v58 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v76, v92, 16);
      }
      while (v58);
    }

    v55 = v73;
  }
  v64 = (void *)objc_msgSend(v75, "copy");

  return v64;
}

- (void)_insertRestrictedBoolForKey:(id)a3 value:(id)a4 preferenc:(BOOL)a5
{
  _BOOL8 v5;
  NSMutableDictionary *restrictions;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v5 = a5;
  v14[2] = *MEMORY[0x1E0C80C00];
  restrictions = self->_restrictions;
  v8 = a4;
  v9 = a3;
  -[NSMutableDictionary objectForKey:](restrictions, "objectForKey:", CFSTR("restrictedBool"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = CFSTR("value");
  v13[1] = CFSTR("preference");
  v14[0] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, v9);
}

- (id)installationWarnings
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  int v7;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  int v21;
  void *v22;
  int v23;
  id v25;
  id v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  __CFString *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  int v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t buf[4];
  unint64_t v58;
  __int16 v59;
  uint64_t v60;
  __int16 v61;
  uint64_t v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "restrictedBoolForFeature:", CFSTR("allowPhotoStream"));

  -[MCRestrictionsPayload restrictions](self, "restrictions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[MCRestrictionManager restrictedBoolForFeature:withRestrictionsDictionary:](MCRestrictionManager, "restrictedBoolForFeature:withRestrictionsDictionary:", CFSTR("allowPhotoStream"), v6);

  if (v5 != 2 && v7 == 2)
  {
    v9 = MCPLPhotoLibraryClass();
    if (v9)
    {
      objc_msgSend(v9, "sharedPhotoLibrary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "photoStreamAlbums");
      v53 = 0u;
      v54 = 0u;
      v55 = 0u;
      v56 = 0u;
      v11 = (id)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
      v13 = v11;
      if (v12)
      {
        v14 = v12;
        v15 = *(_QWORD *)v54;
        while (2)
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v54 != v15)
              objc_enumerationMutation(v11);
            if (!objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * i), "isEmpty"))
            {

              MCLocalizedString(CFSTR("INSTALL_WARNING_PHOTO_STREAM_RESTRICTION"));
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              MCLocalizedStringByDevice(CFSTR("INSTALL_WARNING_PHOTO_STREAM"));
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              +[MCProfileWarning warningWithLocalizedTitle:localizedBody:isLongForm:](MCProfileWarning, "warningWithLocalizedTitle:localizedBody:isLongForm:", v13, v17, 0);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "addObject:", v18);

              goto LABEL_17;
            }
          }
          v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
          if (v14)
            continue;
          break;
        }
        v13 = v11;
      }
LABEL_17:

    }
    else
    {
      v19 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19ECC4000, v19, OS_LOG_TYPE_DEBUG, "Cannot load PLPhotoLibrary class. Not creating Photo Stream warning.", buf, 2u);
      }
    }
  }
  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "restrictedBoolForFeature:", CFSTR("allowCloudPhotoLibrary"));

  -[MCRestrictionsPayload restrictions](self, "restrictions");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = +[MCRestrictionManager restrictedBoolForFeature:withRestrictionsDictionary:](MCRestrictionManager, "restrictedBoolForFeature:withRestrictionsDictionary:", CFSTR("allowCloudPhotoLibrary"), v22);

  if (v21 != 2 && v23 == 2)
  {
    v51 = 0;
    v52 = 0;
    v50 = 0;
    v25 = MCPLManagedAssetClass();
    v26 = MCPLPhotoLibraryClass();
    if (v25 && v26)
    {
      objc_msgSend(v26, "sharedPhotoLibrary");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "countOfAssetsWithRequiredResourcesNotLocallyAvailableInLibrary:outCount:photoCount:videoCount:", v27, &v52, &v51, &v50);

      v28 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218496;
        v58 = v52;
        v59 = 2048;
        v60 = v51;
        v61 = 2048;
        v62 = v50;
        _os_log_impl(&dword_19ECC4000, v28, OS_LOG_TYPE_DEBUG, "Photo library non-local assets: count:%lu photo:%lu video:%lu]", buf, 0x20u);
      }
      if (v52 < 2)
      {
        if (v51 == 1)
        {
          v38 = CFSTR("INSTALL_WARNING_CLOUD_PHOTO_LIBRARY_PHOTO_SINGULAR_DESTRUCTIVE");
        }
        else if (v50 == 1)
        {
          v38 = CFSTR("INSTALL_WARNING_CLOUD_PHOTO_LIBRARY_VIDEO_SINGULAR_DESTRUCTIVE");
        }
        else
        {
          v38 = CFSTR("INSTALL_WARNING_CLOUD_PHOTO_LIBRARY");
        }
        MCLocalizedStringByDevice(v38);
        v36 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        MCLocalizedFormatByDevice(CFSTR("INSTALL_WARNING_CLOUD_PHOTO_LIBRARY_PHOTOS_VIDEOS_DESTRUCTIVE"), v29, v30, v31, v32, v33, v34, v35, v52);
        v36 = objc_claimAutoreleasedReturnValue();
      }
      v39 = (void *)v36;
      MCLocalizedString(CFSTR("INSTALL_WARNING_CLOUD_PHOTO_LIBRARY_RESTRICTION"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      +[MCProfileWarning warningWithLocalizedTitle:localizedBody:isLongForm:](MCProfileWarning, "warningWithLocalizedTitle:localizedBody:isLongForm:", v40, v39, 0);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v41);

    }
    else
    {
      v37 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19ECC4000, v37, OS_LOG_TYPE_DEBUG, "Cannot load PLManagedAssetClass or PLPhotoLibraryClass. Not creating Cloud Photo Library warning.", buf, 2u);
      }
    }
  }
  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "restrictedBoolForFeature:", CFSTR("allowPairedWatch"));

  -[MCRestrictionsPayload restrictions](self, "restrictions");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = +[MCRestrictionManager restrictedBoolForFeature:withRestrictionsDictionary:](MCRestrictionManager, "restrictedBoolForFeature:withRestrictionsDictionary:", CFSTR("allowPairedWatch"), v44);

  if (v43 != 2 && v45 == 2)
  {
    MCLocalizedString(CFSTR("INSTALL_WARNING_PAIRED_WATCH_RESTRICTION"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedStringByDevice(CFSTR("INSTALL_WARNING_PAIRED_WATCH"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    +[MCProfileWarning warningWithLocalizedTitle:localizedBody:isLongForm:](MCProfileWarning, "warningWithLocalizedTitle:localizedBody:isLongForm:", v46, v47, 0);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v48);

  }
  return v3;
}

- (id)filterForUserEnrollmentOutError:(id *)a3
{
  void *v4;
  void *v5;
  NSMutableDictionary *restrictions;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, void *);
  void *v16;
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  +[MCRestrictionsPayload userEnrollmentAllowedKeysFilter](MCRestrictionsPayload, "userEnrollmentAllowedKeysFilter", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  restrictions = self->_restrictions;
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __57__MCRestrictionsPayload_filterForUserEnrollmentOutError___block_invoke;
  v16 = &unk_1E41E37A0;
  v7 = v4;
  v17 = v7;
  v8 = v5;
  v18 = v8;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](restrictions, "enumerateKeysAndObjectsUsingBlock:", &v13);
  if (objc_msgSend(v8, "count", v13, v14, v15, v16))
  {
    objc_msgSend(v8, "sortUsingComparator:", &__block_literal_global_454);
    v9 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
    {
      v10 = v9;
      -[MCPayload friendlyName](self, "friendlyName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v11;
      v21 = 2114;
      v22 = v8;
      _os_log_impl(&dword_19ECC4000, v10, OS_LOG_TYPE_INFO, "Payload “%{public}@” has restrictions that we are ignoring. They are: %{public}@", buf, 0x16u);

    }
  }

  return 0;
}

void __57__MCRestrictionsPayload_filterForUserEnrollmentOutError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v12 = a2;
  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __57__MCRestrictionsPayload_filterForUserEnrollmentOutError___block_invoke_2;
    v13[3] = &unk_1E41E3778;
    v14 = v8;
    v15 = v9;
    v10 = v9;
    v11 = v8;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v13);
    objc_msgSend(v5, "removeObjectsForKeys:", v10);
    objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v10);

  }
}

void __57__MCRestrictionsPayload_filterForUserEnrollmentOutError___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

uint64_t __57__MCRestrictionsPayload_filterForUserEnrollmentOutError___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "compare:options:", a3, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restrictions, 0);
}

@end
