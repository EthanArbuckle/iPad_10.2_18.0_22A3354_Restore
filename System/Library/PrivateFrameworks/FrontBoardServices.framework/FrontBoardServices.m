id FBSSettingForSelector(void *a1, const void *a2)
{
  void *v4;

  FBSSettingForExtensionSelector(a1, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    FBSSettingForLegacySelector((objc_class *)a1, a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

void FBSRealizeSettingsExtension(uint64_t a1, void *a2)
{
  void *v4;
  _QWORD v5[6];

  if (objc_msgSend(a2, "isSubclassOfClass:", objc_opt_class()))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("![extension isSubclassOfClass:[FBSDerivedSettingsExtension class]]"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      FBSRealizeSettingsExtension_cold_1();
    objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
  else if (a2)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __FBSRealizeSettingsExtension_block_invoke;
    v5[3] = &__block_descriptor_48_e5_v8__0lu32l8u40l8;
    v5[4] = a1;
    v5[5] = a2;
    os_unfair_lock_lock(&__ExtensionLock);
    __FBSRealizeSettingsExtension_block_invoke((uint64_t)v5);
    os_unfair_lock_unlock(&__ExtensionLock);
  }
}

void _realizeSettingsExtension()
{
  uint64_t v0;
  objc_class *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  Class v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  int v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  int v35;
  void *v36;
  int v37;
  NSObject *v38;
  _BOOL4 v39;
  uint64_t v40;
  void *v41;
  const void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  BOOL v47;
  SEL v48;
  void (*MethodImplementation)(void);
  void (*v50)(void);
  uint64_t v51;
  _QWORD *v52;
  void *v53;
  char v54;
  id v55;
  char *v56;
  objc_class *v57;
  void *v58;
  const void *v59;
  void *v60;
  void *v61;
  id v62;
  NSString *v63;
  SEL v64;
  void (*v65)(void);
  NSString *v66;
  const char *v67;
  void *v68;
  _QWORD *v69;
  void *v70;
  _QWORD *v71;
  id v72;
  id *v73;
  id *v74;
  id v75;
  char *v76;
  objc_class *v77;
  uint64_t v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t i;
  void *v83;
  objc_method *InstanceMethod;
  objc_method *v85;
  const char *Name;
  void (*Implementation)(void);
  char *TypeEncoding;
  NSObject *v89;
  NSObject *v90;
  NSObject *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  NSObject *v98;
  id v99;
  uint64_t v100;
  void *v101;
  NSObject *v102;
  id v103;
  uint64_t v104;
  void *v105;
  NSObject *v106;
  id v107;
  uint64_t v108;
  void *v109;
  NSObject *v110;
  id v111;
  uint64_t v113;
  void *v114;
  NSObject *v115;
  id v116;
  uint64_t v117;
  void *v118;
  NSObject *v119;
  id v120;
  uint64_t v121;
  void *v122;
  NSObject *v123;
  id v124;
  uint64_t v125;
  void *v126;
  NSObject *v127;
  id v128;
  uint64_t v129;
  void *v130;
  NSObject *v131;
  id v132;
  uint64_t v134;
  void *v135;
  NSObject *v136;
  id v137;
  uint64_t v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  NSObject *v146;
  id v147;
  uint64_t v148;
  void *v149;
  NSObject *v150;
  id v151;
  uint64_t v152;
  void *v153;
  void *v154;
  void *v155;
  NSObject *v156;
  id v157;
  uint64_t v158;
  void *v159;
  void *v160;
  void *v161;
  NSObject *v162;
  id v163;
  uint64_t v164;
  Class v165;
  Protocol *protocol;
  void *v167;
  NSObject *obj;
  void *v169;
  NSMapTable *v170;
  Class cls;
  id v172;
  int v173;
  uint64_t v174;
  uint64_t v175;
  int v176;
  char v177;
  int v178;
  objc_class *v179;
  void *v180;
  void *v181;
  NSMapTable *table;
  uint64_t v183;
  void *v184;
  NSString *aSelectorName;
  Class aClass;
  int v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  _QWORD v192[5];
  _QWORD v193[5];
  _QWORD v194[5];
  _QWORD v195[5];
  _QWORD v196[5];
  _QWORD v197[5];
  _QWORD v198[5];
  NSString *v199;
  void *v200;
  char v201;
  char v202;
  _QWORD v203[6];
  _QWORD v204[6];
  _QWORD v205[6];
  _QWORD v206[5];
  _QWORD v207[5];
  _QWORD v208[5];
  _QWORD v209[5];
  _QWORD v210[5];
  _QWORD v211[5];
  _QWORD v212[6];
  _QWORD v213[6];
  _QWORD v214[6];
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  uint8_t v219[128];
  uint8_t v220[4];
  NSObject *v221;
  __int16 v222;
  NSObject *v223;
  uint8_t v224[128];
  _BYTE buf[3096];
  uint64_t v226;

  v0 = MEMORY[0x1E0C80A78]();
  aClass = v1;
  v2 = (objc_class *)v0;
  v226 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner(&__ExtensionLock);
  v179 = v2;
  cls = (Class)-[objc_class _baseClass](v2, "_baseClass");
  objc_msgSend((id)__SettingsToExtensionsMap, "objectForKey:");
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v169, "containsObject:", aClass) & 1) == 0)
  {
    if (!cls)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("baseClass != ((void *)0)"));
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        _realizeSettingsExtension_cold_1();
      objc_msgSend(objc_retainAutorelease(v139), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A6D867CLL);
    }
    if ((-[objc_class isSubclassOfClass:](cls, "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[baseClass isSubclassOfClass:[FBSSettings class]]"));
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        _realizeSettingsExtension_cold_33();
      objc_msgSend(objc_retainAutorelease(v140), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A6D86D8);
    }
    if ((-[objc_class isSubclassOfClass:](aClass, "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ is not a valid FBSSettingsExtension"), aClass);
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        _realizeSettingsExtension_cold_32();
      objc_msgSend(objc_retainAutorelease(v141), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A6D872CLL);
    }
    v187 = -[objc_class isSubclassOfClass:](aClass, "isSubclassOfClass:", objc_opt_class());
    if (v187)
    {
      if (cls == v2)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("settingsClass != baseClass"));
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          _realizeSettingsExtension_cold_2();
        objc_msgSend(objc_retainAutorelease(v3), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x19A6D6CE4);
      }
    }
    else if (cls != v2)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("settingsClass == baseClass"));
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        _realizeSettingsExtension_cold_31();
      objc_msgSend(objc_retainAutorelease(v142), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A6D8788);
    }
    if (!__SettingsToExtensionsMap)
    {
      objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = (void *)__SettingsToExtensionsMap;
      __SettingsToExtensionsMap = v4;

      objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)__SelectorsToSettingsMap;
      __SelectorsToSettingsMap = v6;

      objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)__LegacySettingsToSettingsMap;
      __LegacySettingsToSettingsMap = v8;

    }
    v10 = v169;
    if (!v169)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)__SettingsToExtensionsMap, "setObject:forKey:", v10, cls);
    }
    v169 = v10;
    objc_msgSend(v10, "addObject:", aClass);
    if (v187)
      v11 = v2;
    else
      v11 = cls;
    v165 = v11;
    objc_msgSend((id)__SelectorsToSettingsMap, "objectForKey:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");

    table = (NSMapTable *)v13;
    if (!v13)
      table = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 258, 0, 32);
    objc_msgSend((id)__LegacySettingsToSettingsMap, "objectForKey:", cls);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "copy");

    v170 = (NSMapTable *)v15;
    if (!v15)
      v170 = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 1282, 0, 32);
    FBLogSceneExtension();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromClass(aClass);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromClass(cls);
      v18 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v17;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v18;
      _os_log_impl(&dword_19A6D4000, v16, OS_LOG_TYPE_DEFAULT, "Realizing settings extension %{public}@ on %{public}@", buf, 0x16u);

    }
    -[objc_class BSObjCProtocol](aClass, "BSObjCProtocol");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v167 = v19;
    if (v19)
    {
      objc_msgSend(v19, "name");
      obj = objc_claimAutoreleasedReturnValue();
      _gatherProperties(v167);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      _gatherMethods(v167);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v180 = (void *)objc_msgSend(v21, "mutableCopy");

      objc_msgSend(v167, "protocol");
      protocol = (Protocol *)objc_claimAutoreleasedReturnValue();
      if (protocol)
        class_addProtocol(cls, protocol);
      bzero(&buf[16], 0xC10uLL);
      *(_QWORD *)buf = cls;
      *(_QWORD *)&buf[8] = aClass;
      objc_storeStrong((id *)&buf[16], obj);
      v218 = 0u;
      v217 = 0u;
      v216 = 0u;
      v215 = 0u;
      v172 = v20;
      v175 = objc_msgSend(v172, "countByEnumeratingWithState:objects:count:", &v215, v224, 16);
      if (v175)
      {
        v174 = *(_QWORD *)v216;
        do
        {
          v183 = 0;
          do
          {
            if (*(_QWORD *)v216 != v174)
              objc_enumerationMutation(v172);
            v22 = *(id *)(*((_QWORD *)&v215 + 1) + 8 * v183);
            v23 = v22;
            if (v187)
            {
              v24 = objc_msgSend(v22, "copyAsReadWrite");

              v23 = (void *)v24;
            }
            else if ((objc_msgSend(v22, "isReadWrite") & 1) == 0)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("property is not readwrite: %@"), v23);
              v126 = (void *)objc_claimAutoreleasedReturnValue();
              v127 = MEMORY[0x1E0C81028];
              v128 = MEMORY[0x1E0C81028];
              if (os_log_type_enabled(v127, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _realizeSettingsExtension(__unsafe_unretained Class, __unsafe_unretained Class)");
                objc_claimAutoreleasedReturnValue();
                _realizeSettingsExtension_cold_30();
              }

              objc_msgSend(objc_retainAutorelease(v126), "UTF8String");
              v129 = _bs_set_crash_log_message();
              _realizeSettingsExtension_cold_3(v129);
            }
            v25 = objc_msgSend(v23, "isRequired");
            v177 = objc_msgSend(v23, "isCopy");
            v176 = objc_msgSend(v23, "isWeak");
            if ((v176 & v25) == 1)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("only @optional properties can be weak: %@"), v23);
              v97 = (void *)objc_claimAutoreleasedReturnValue();
              v98 = MEMORY[0x1E0C81028];
              v99 = MEMORY[0x1E0C81028];
              if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _realizeSettingsExtension(__unsafe_unretained Class, __unsafe_unretained Class)");
                objc_claimAutoreleasedReturnValue();
                _realizeSettingsExtension_cold_4();
              }

              objc_msgSend(objc_retainAutorelease(v97), "UTF8String");
              v100 = _bs_set_crash_log_message();
              _realizeSettingsExtension_cold_3(v100);
            }
            objc_msgSend(v23, "name");
            aSelectorName = (NSString *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "value");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v26, "type");
            v184 = v26;
            v178 = objc_msgSend(v26, "isFloatingPoint");
            if (v187)
            {
              objc_msgSend(v23, "customAttributeForKey:", CFSTR("#"));
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = v28;
              if (v28)
              {
                v30 = objc_msgSend(v28, "integerValue");
                if (!v30)
                {
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("could not convert \"%@\" to an integer"), v29);
                  v130 = (void *)objc_claimAutoreleasedReturnValue();
                  v131 = MEMORY[0x1E0C81028];
                  v132 = MEMORY[0x1E0C81028];
                  if (os_log_type_enabled(v131, OS_LOG_TYPE_ERROR))
                  {
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _realizeSettingsExtension(__unsafe_unretained Class, __unsafe_unretained Class)");
                    objc_claimAutoreleasedReturnValue();
                    _realizeSettingsExtension_cold_28();
                  }

                  objc_msgSend(objc_retainAutorelease(v130), "UTF8String");
                  v134 = _bs_set_crash_log_message();
                  _realizeSettingsExtension_cold_3(v134);
                }
              }
              else
              {
                v30 = 0x7FFFFFFFFFFFFFFFLL;
              }

            }
            else
            {
              v30 = 0x7FFFFFFFFFFFFFFFLL;
            }
            if (v27 > 0x5Du)
            {
              if (v27 == 98)
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("bitfields are not supported"));
                v101 = (void *)objc_claimAutoreleasedReturnValue();
                v102 = MEMORY[0x1E0C81028];
                v103 = MEMORY[0x1E0C81028];
                if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _realizeSettingsExtension(__unsafe_unretained Class, __unsafe_unretained Class)");
                  objc_claimAutoreleasedReturnValue();
                  _realizeSettingsExtension_cold_20();
                }

                objc_msgSend(objc_retainAutorelease(v101), "UTF8String");
                v104 = _bs_set_crash_log_message();
                _realizeSettingsExtension_cold_3(v104);
              }
              if (v27 == 94)
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("pointers are not supported"));
                v114 = (void *)objc_claimAutoreleasedReturnValue();
                v115 = MEMORY[0x1E0C81028];
                v116 = MEMORY[0x1E0C81028];
                if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _realizeSettingsExtension(__unsafe_unretained Class, __unsafe_unretained Class)");
                  objc_claimAutoreleasedReturnValue();
                  _realizeSettingsExtension_cold_26();
                }

                objc_msgSend(objc_retainAutorelease(v114), "UTF8String");
                v117 = _bs_set_crash_log_message();
                _realizeSettingsExtension_cold_3(v117);
              }
            }
            else
            {
              if (v27 == 91)
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("C arrays are not supported"));
                v105 = (void *)objc_claimAutoreleasedReturnValue();
                v106 = MEMORY[0x1E0C81028];
                v107 = MEMORY[0x1E0C81028];
                if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _realizeSettingsExtension(__unsafe_unretained Class, __unsafe_unretained Class)");
                  objc_claimAutoreleasedReturnValue();
                  _realizeSettingsExtension_cold_22();
                }

                objc_msgSend(objc_retainAutorelease(v105), "UTF8String");
                v108 = _bs_set_crash_log_message();
                _realizeSettingsExtension_cold_3(v108);
              }
              if (v27 == 40)
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unions are not supported"));
                v109 = (void *)objc_claimAutoreleasedReturnValue();
                v110 = MEMORY[0x1E0C81028];
                v111 = MEMORY[0x1E0C81028];
                if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _realizeSettingsExtension(__unsafe_unretained Class, __unsafe_unretained Class)");
                  objc_claimAutoreleasedReturnValue();
                  _realizeSettingsExtension_cold_24();
                }

                objc_msgSend(objc_retainAutorelease(v109), "UTF8String");
                v113 = _bs_set_crash_log_message();
                _realizeSettingsExtension_cold_3(v113);
              }
            }
            if ((v187 & 1) == 0
              && -[NSString isEqualToString:](aSelectorName, "isEqualToString:", CFSTR("displayConfigurationRequest")))
            {
              if (NSClassFromString(CFSTR("UIResponder")))
              {
                FBLogSceneExtension();
                v31 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)v220 = 138412290;
                  v221 = obj;
                  _os_log_debug_impl(&dword_19A6D4000, v31, OS_LOG_TYPE_DEBUG, "Skipping property \"displayConfigurationRequest\" from <%@> because it belongs to <UIApplicationSceneClientSettings>", v220, 0xCu);
                }
LABEL_54:

                objc_msgSend(v23, "getter");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v180, "removeObject:", v32);

                objc_msgSend(v23, "setter");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v180, "removeObject:", v33);
                goto LABEL_162;
              }
              FBLogSceneExtension();
              v34 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v220 = 138412290;
                v221 = obj;
                _os_log_error_impl(&dword_19A6D4000, v34, OS_LOG_TYPE_ERROR, "Property \"displayConfigurationRequest\" from <%@> is being defined in a process that does not link UIKit. This probably won't behave correctly.", v220, 0xCu);
              }

            }
            if (v27 == 64)
            {
              v181 = (void *)objc_msgSend(v26, "objectClass");
              if (v25)
              {
                if (v181)
                  v35 = 0;
                else
                  v35 = v187;
                if (v35 == 1)
                {
                  objc_msgSend(v26, "objectProtocols");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  v37 = objc_msgSend(v36, "containsObject:", &unk_1EE3C30E8);

                  if (!v37)
                    goto LABEL_68;
                  v181 = (void *)objc_opt_class();
                  FBLogSceneExtension();
                  v38 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)v220 = 138412546;
                    v221 = aSelectorName;
                    v222 = 2112;
                    v223 = obj;
                    _os_log_debug_impl(&dword_19A6D4000, v38, OS_LOG_TYPE_DEBUG, "Mapping property \"%@\" in <%@> to BSCanonicalOrientationMapResolver", v220, 0x16u);
                  }

                  if (!v181)
                  {
LABEL_68:
                    FBLogSceneExtension();
                    v31 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)v220 = 138543618;
                      v221 = aSelectorName;
                      v222 = 2114;
                      v223 = obj;
                      _os_log_impl(&dword_19A6D4000, v31, OS_LOG_TYPE_DEFAULT, "Ignoring object property \"%{public}@\" in <%{public}@> because it has no defined class.", v220, 0x16u);
                    }
                    goto LABEL_54;
                  }
                }
                else if (!v181)
                {
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Object property \"%@\" in <%@> has an unknown class."), aSelectorName, obj);
                  v135 = (void *)objc_claimAutoreleasedReturnValue();
                  v136 = MEMORY[0x1E0C81028];
                  v137 = MEMORY[0x1E0C81028];
                  if (os_log_type_enabled(v136, OS_LOG_TYPE_ERROR))
                  {
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _realizeSettingsExtension(__unsafe_unretained Class, __unsafe_unretained Class)");
                    objc_claimAutoreleasedReturnValue();
                    _realizeSettingsExtension_cold_18();
                  }

                  objc_msgSend(objc_retainAutorelease(v135), "UTF8String");
                  v138 = _bs_set_crash_log_message();
                  _realizeSettingsExtension_cold_3(v138);
                }
                v39 = v181 == (void *)objc_opt_class()
                   || v181 == (void *)objc_opt_class()
                   || v181 == (void *)objc_opt_class();
              }
              else
              {
                v39 = 0;
              }
            }
            else
            {
              v39 = 0;
              v181 = 0;
            }
            v173 = _structDisposition(v184);
            +[FBSSetting settingWithName:settingsClass:extension:local:type:legacySetting:expectedClass:]((uint64_t)FBSSetting, aSelectorName, (uint64_t)v179, aClass, v25 ^ 1, v27, v30, v181);
            v40 = objc_claimAutoreleasedReturnValue();
            v33 = (void *)v40;
            if ((v25 & v39 & 1) == 0)
              -[FBSSetting setSpecialCollection:](v40, 0);
            objc_msgSend(v23, "getter");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v41)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("no getter for %@"), v23);
              v118 = (void *)objc_claimAutoreleasedReturnValue();
              v119 = MEMORY[0x1E0C81028];
              v120 = MEMORY[0x1E0C81028];
              if (os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _realizeSettingsExtension(__unsafe_unretained Class, __unsafe_unretained Class)");
                objc_claimAutoreleasedReturnValue();
                _realizeSettingsExtension_cold_6();
              }

              objc_msgSend(objc_retainAutorelease(v118), "UTF8String");
              v121 = _bs_set_crash_log_message();
              _realizeSettingsExtension_cold_3(v121);
            }
            objc_msgSend(v180, "removeObjectIdenticalTo:", v41);
            v42 = (const void *)objc_msgSend(v41, "selector");
            NSMapGet(table, v42);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = v43;
            if (v43)
            {
              if (!objc_msgSend(v43, "isEqual:", v33))
              {
                v143 = (void *)MEMORY[0x1E0CB3940];
                NSStringFromClass(aClass);
                v144 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v143, "stringWithFormat:", CFSTR("setting named \"%@\" from \"%@\" already exists as \"%@\""), aSelectorName, v144, v44);
                v145 = (void *)objc_claimAutoreleasedReturnValue();

                v146 = MEMORY[0x1E0C81028];
                v147 = MEMORY[0x1E0C81028];
                if (os_log_type_enabled(v146, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _realizeSettingsExtension(__unsafe_unretained Class, __unsafe_unretained Class)");
                  objc_claimAutoreleasedReturnValue();
                  _realizeSettingsExtension_cold_16();
                }

                objc_msgSend(objc_retainAutorelease(v145), "UTF8String");
                v148 = _bs_set_crash_log_message();
                _realizeSettingsExtension_cold_3(v148);
              }
              v45 = v44;

              v33 = v45;
            }
            else
            {
              objc_msgSend(v41, "name");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              v47 = -[NSString isEqualToString:](aSelectorName, "isEqualToString:", v46);

              if (!v47)
              {
                v48 = NSSelectorFromString(aSelectorName);
                if (!v48)
                  v48 = sel_registerName(-[NSString UTF8String](objc_retainAutorelease(aSelectorName), "UTF8String"));
                NSMapInsert(table, v48, v33);
              }
              NSMapInsert(table, v42, v33);
              if (v30 != 0x7FFFFFFFFFFFFFFFLL)
                NSMapInsert(v170, (const void *)v30, v33);
            }
            if (v187)
            {
              MethodImplementation = class_getMethodImplementation(v179, (SEL)v42);
              if (MethodImplementation != class_getMethodImplementation(cls, (SEL)v42))
                goto LABEL_112;
            }
            else
            {
              v50 = class_getMethodImplementation(aClass, (SEL)v42);
              if (v50 != (void (*)(void))MEMORY[0x1E0DE79B8])
                goto LABEL_106;
            }
            if (v27 == 123)
            {
              v51 = objc_msgSend(v184, "size");
              switch(v173)
              {
                case 3:
                  v212[0] = MEMORY[0x1E0C809B0];
                  v212[1] = 3221225472;
                  v212[2] = ___realizeSettingsExtension_block_invoke_3;
                  v212[3] = &unk_1E38EAFF0;
                  v212[4] = v33;
                  v212[5] = v51;
                  v52 = v212;
                  break;
                case 2:
                  v213[0] = MEMORY[0x1E0C809B0];
                  v213[1] = 3221225472;
                  v213[2] = ___realizeSettingsExtension_block_invoke_2;
                  v213[3] = &unk_1E38EAFC8;
                  v213[4] = v33;
                  v213[5] = v51;
                  v52 = v213;
                  break;
                case 1:
                  v214[0] = MEMORY[0x1E0C809B0];
                  v214[1] = 3221225472;
                  v214[2] = ___realizeSettingsExtension_block_invoke;
                  v214[3] = &unk_1E38EAFA0;
                  v214[4] = v33;
                  v214[5] = v51;
                  v52 = v214;
                  break;
                default:
                  v153 = (void *)MEMORY[0x1E0CB3940];
                  objc_msgSend(v184, "encoding");
                  v154 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v153, "stringWithFormat:", CFSTR("Struct property \"%@\" is not a supported format (%@) and must be explicitly synthesized using SYNTHESIZE_STRUCT_PROPERTY()"), aSelectorName, v154);
                  v155 = (void *)objc_claimAutoreleasedReturnValue();

                  v156 = MEMORY[0x1E0C81028];
                  v157 = MEMORY[0x1E0C81028];
                  if (os_log_type_enabled(v156, OS_LOG_TYPE_ERROR))
                  {
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _realizeSettingsExtension(__unsafe_unretained Class, __unsafe_unretained Class)");
                    objc_claimAutoreleasedReturnValue();
                    _realizeSettingsExtension_cold_8();
                  }

                  objc_msgSend(objc_retainAutorelease(v155), "UTF8String");
                  v158 = _bs_set_crash_log_message();
                  _realizeSettingsExtension_cold_3(v158);
              }
            }
            else if (v27 == 64)
            {
              v211[0] = MEMORY[0x1E0C809B0];
              v211[1] = 3221225472;
              v211[2] = ___realizeSettingsExtension_block_invoke_204;
              v211[3] = &unk_1E38EB018;
              v211[4] = v33;
              v52 = v211;
            }
            else if (v178)
            {
              v210[0] = MEMORY[0x1E0C809B0];
              v210[1] = 3221225472;
              v210[2] = ___realizeSettingsExtension_block_invoke_2_206;
              v210[3] = &unk_1E38EB040;
              v210[4] = v33;
              v52 = v210;
            }
            else if (v27 == 35)
            {
              v208[0] = MEMORY[0x1E0C809B0];
              v208[1] = 3221225472;
              v208[2] = ___realizeSettingsExtension_block_invoke_4;
              v208[3] = &unk_1E38EB090;
              v208[4] = v33;
              v52 = v208;
            }
            else if (v27 == 58)
            {
              v207[0] = MEMORY[0x1E0C809B0];
              v207[1] = 3221225472;
              v207[2] = ___realizeSettingsExtension_block_invoke_5;
              v207[3] = &unk_1E38EB0B8;
              v207[4] = v33;
              v52 = v207;
            }
            else if (v27 == 42)
            {
              v209[0] = MEMORY[0x1E0C809B0];
              v209[1] = 3221225472;
              v209[2] = ___realizeSettingsExtension_block_invoke_3_208;
              v209[3] = &unk_1E38EB068;
              v209[4] = v33;
              v52 = v209;
            }
            else
            {
              v206[0] = MEMORY[0x1E0C809B0];
              v206[1] = 3221225472;
              v206[2] = ___realizeSettingsExtension_block_invoke_6;
              v206[3] = &unk_1E38EB0E0;
              v206[4] = v33;
              v52 = v206;
            }
            v53 = (void *)MEMORY[0x19AECA324](v52);

            v50 = imp_implementationWithBlock(v53);
LABEL_106:
            v54 = 0;
            if (v50 && v50 != (void (*)(void))MEMORY[0x1E0DE79B8])
            {
              objc_msgSend(v41, "encoding");
              v55 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v56 = (char *)objc_msgSend(v55, "UTF8String");

              if (!v187)
              {
                _addBulkMethod((uint64_t)buf, (const char *)v42, v50, v56);
LABEL_112:
                v54 = 0;
                goto LABEL_113;
              }
              _addMethod(v179, aClass, (SEL)v42, v50, v56, 1);
              v57 = (objc_class *)-[objc_class _counterpartClass](v179, "_counterpartClass");
              v54 = 1;
              if (v57)
                _addMethod(v57, aClass, (SEL)v42, v50, v56, 1);
            }
LABEL_113:

            objc_msgSend(v23, "setter");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v58)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("no setter for %@"), v23);
              v122 = (void *)objc_claimAutoreleasedReturnValue();
              v123 = MEMORY[0x1E0C81028];
              v124 = MEMORY[0x1E0C81028];
              if (os_log_type_enabled(v123, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _realizeSettingsExtension(__unsafe_unretained Class, __unsafe_unretained Class)");
                objc_claimAutoreleasedReturnValue();
                _realizeSettingsExtension_cold_10();
              }

              objc_msgSend(objc_retainAutorelease(v122), "UTF8String");
              v125 = _bs_set_crash_log_message();
              _realizeSettingsExtension_cold_3(v125);
            }
            objc_msgSend(v180, "removeObjectIdenticalTo:", v58);
            v59 = (const void *)objc_msgSend(v58, "selector");
            NSMapGet(table, v59);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            v61 = v60;
            if (v60)
            {
              if (!objc_msgSend(v60, "isEqual:", v33))
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("setting named \"%@\" already exists as \"%@\""), aSelectorName, v61);
                v149 = (void *)objc_claimAutoreleasedReturnValue();
                v150 = MEMORY[0x1E0C81028];
                v151 = MEMORY[0x1E0C81028];
                if (os_log_type_enabled(v150, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _realizeSettingsExtension(__unsafe_unretained Class, __unsafe_unretained Class)");
                  objc_claimAutoreleasedReturnValue();
                  _realizeSettingsExtension_cold_14();
                }

                objc_msgSend(objc_retainAutorelease(v149), "UTF8String");
                v152 = _bs_set_crash_log_message();
                _realizeSettingsExtension_cold_3(v152);
              }
              v62 = v61;

              v33 = v62;
            }
            else
            {
              if (v27 == 123)
              {
                -[NSString stringByAppendingString:](aSelectorName, "stringByAppendingString:", CFSTR(":"));
                v63 = (NSString *)objc_claimAutoreleasedReturnValue();
                v64 = NSSelectorFromString(v63);
                if (!v64)
                  v64 = sel_registerName(-[NSString UTF8String](objc_retainAutorelease(v63), "UTF8String"));
                NSMapInsert(table, v64, v33);

              }
              NSMapInsert(table, v59, v33);
            }
            if (!v187)
            {
              v65 = class_getMethodImplementation(aClass, (SEL)v59);
              if (v65 == (void (*)(void))MEMORY[0x1E0DE79B8])
              {
LABEL_126:
                if (v27 == 123)
                {
                  -[NSString stringByAppendingString:](aSelectorName, "stringByAppendingString:", CFSTR(":"));
                  v66 = (NSString *)objc_claimAutoreleasedReturnValue();
                  v67 = NSSelectorFromString(v66);
                  v65 = class_getMethodImplementation(aClass, v67);

                  if (v65 != (void (*)(void))MEMORY[0x1E0DE79B8])
                  {
                    v68 = 0;
                    goto LABEL_154;
                  }
                  objc_msgSend(v184, "encoding");
                  v70 = (void *)objc_claimAutoreleasedReturnValue();
                  switch(v173)
                  {
                    case 3:
                      v203[0] = MEMORY[0x1E0C809B0];
                      v203[1] = 3221225472;
                      v71 = v203;
                      v203[2] = ___realizeSettingsExtension_block_invoke_3_224;
                      v203[3] = &unk_1E38EB158;
                      break;
                    case 2:
                      v204[0] = MEMORY[0x1E0C809B0];
                      v204[1] = 3221225472;
                      v71 = v204;
                      v204[2] = ___realizeSettingsExtension_block_invoke_2_222;
                      v204[3] = &unk_1E38EB130;
                      break;
                    case 1:
                      v205[0] = MEMORY[0x1E0C809B0];
                      v205[1] = 3221225472;
                      v71 = v205;
                      v205[2] = ___realizeSettingsExtension_block_invoke_219;
                      v205[3] = &unk_1E38EB108;
                      break;
                    default:
                      v159 = (void *)MEMORY[0x1E0CB3940];
                      objc_msgSend(v184, "encoding");
                      v160 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v159, "stringWithFormat:", CFSTR("Struct property \"%@\" is not a supported format (%@) and must be explicitly synthesized using SYNTHESIZE_STRUCT_PROPERTY()"), aSelectorName, v160);
                      v161 = (void *)objc_claimAutoreleasedReturnValue();

                      v162 = MEMORY[0x1E0C81028];
                      v163 = MEMORY[0x1E0C81028];
                      if (os_log_type_enabled(v162, OS_LOG_TYPE_ERROR))
                      {
                        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _realizeSettingsExtension(__unsafe_unretained Class, __unsafe_unretained Class)");
                        objc_claimAutoreleasedReturnValue();
                        _realizeSettingsExtension_cold_12();
                      }

                      objc_msgSend(objc_retainAutorelease(v161), "UTF8String");
                      v164 = _bs_set_crash_log_message();
                      _realizeSettingsExtension_cold_3(v164);
                  }
                  v72 = v70;
                  v71[4] = v72;
                  v73 = (id *)(v71 + 4);
                  v71[5] = v33;
                  v74 = (id *)(v71 + 5);
                  v68 = (void *)MEMORY[0x19AECA324](v71);

                }
                else
                {
                  if (v27 == 64)
                  {
                    v198[0] = MEMORY[0x1E0C809B0];
                    v198[1] = 3221225472;
                    v198[2] = ___realizeSettingsExtension_block_invoke_226;
                    v198[3] = &unk_1E38EB180;
                    v200 = v181;
                    v198[4] = v33;
                    v199 = aSelectorName;
                    v201 = v177;
                    v202 = v176;
                    v68 = (void *)MEMORY[0x19AECA324](v198);

                    v69 = v198;
                  }
                  else if (v27 == 42)
                  {
                    v197[0] = MEMORY[0x1E0C809B0];
                    v197[1] = 3221225472;
                    v197[2] = ___realizeSettingsExtension_block_invoke_238;
                    v197[3] = &unk_1E38EB1A8;
                    v197[4] = v33;
                    v68 = (void *)MEMORY[0x19AECA324](v197);
                    v69 = v197;
                  }
                  else if (v178)
                  {
                    v196[0] = MEMORY[0x1E0C809B0];
                    v196[1] = 3221225472;
                    v196[2] = ___realizeSettingsExtension_block_invoke_2_240;
                    v196[3] = &unk_1E38EB1D0;
                    v196[4] = v33;
                    v68 = (void *)MEMORY[0x19AECA324](v196);
                    v69 = v196;
                  }
                  else if (v27 == 66)
                  {
                    v193[0] = MEMORY[0x1E0C809B0];
                    v193[1] = 3221225472;
                    v193[2] = ___realizeSettingsExtension_block_invoke_5_246;
                    v193[3] = &unk_1E38EB248;
                    v193[4] = v33;
                    v68 = (void *)MEMORY[0x19AECA324](v193);
                    v69 = v193;
                  }
                  else if (v27 == 58)
                  {
                    v194[0] = MEMORY[0x1E0C809B0];
                    v194[1] = 3221225472;
                    v194[2] = ___realizeSettingsExtension_block_invoke_4_244;
                    v194[3] = &unk_1E38EB220;
                    v194[4] = v33;
                    v68 = (void *)MEMORY[0x19AECA324](v194);
                    v69 = v194;
                  }
                  else if (v27 == 35)
                  {
                    v195[0] = MEMORY[0x1E0C809B0];
                    v195[1] = 3221225472;
                    v195[2] = ___realizeSettingsExtension_block_invoke_3_242;
                    v195[3] = &unk_1E38EB1F8;
                    v195[4] = v33;
                    v68 = (void *)MEMORY[0x19AECA324](v195);
                    v69 = v195;
                  }
                  else
                  {
                    v192[0] = MEMORY[0x1E0C809B0];
                    v192[1] = 3221225472;
                    v192[2] = ___realizeSettingsExtension_block_invoke_6_248;
                    v192[3] = &unk_1E38EB270;
                    v192[4] = v33;
                    v68 = (void *)MEMORY[0x19AECA324](v192);
                    v69 = v192;
                  }
                  v72 = (id)v69[4];
                }

                if (v68)
                  v65 = imp_implementationWithBlock(v68);
                else
                  v65 = (void (*)(void))MEMORY[0x1E0DE79B8];
LABEL_154:

              }
              if (v65 && v65 != (void (*)(void))MEMORY[0x1E0DE79B8])
              {
                objc_msgSend(v58, "encoding");
                v75 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                v76 = (char *)objc_msgSend(v75, "UTF8String");

                if (v187)
                {
                  _addMethod(v179, aClass, (SEL)v59, v65, v76, 1);
                  v77 = (objc_class *)-[objc_class _counterpartClass](v179, "_counterpartClass");
                  if (v77)
                    _addMethod(v77, aClass, (SEL)v59, v65, v76, 1);
                }
                else
                {
                  _addBulkMethod((uint64_t)buf, (const char *)v59, v65, v76);
                }
              }
              goto LABEL_161;
            }
            if ((v54 & 1) != 0)
              goto LABEL_126;
LABEL_161:

LABEL_162:
            ++v183;
          }
          while (v175 != v183);
          v78 = objc_msgSend(v172, "countByEnumeratingWithState:objects:count:", &v215, v224, 16);
          v175 = v78;
        }
        while (v78);
      }

      v190 = 0u;
      v191 = 0u;
      v188 = 0u;
      v189 = 0u;
      v79 = v180;
      v80 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v188, v219, 16);
      if (v80)
      {
        v81 = *(_QWORD *)v189;
        do
        {
          for (i = 0; i != v80; ++i)
          {
            if (*(_QWORD *)v189 != v81)
              objc_enumerationMutation(v79);
            v83 = *(void **)(*((_QWORD *)&v188 + 1) + 8 * i);
            InstanceMethod = class_getInstanceMethod(aClass, (SEL)objc_msgSend(v83, "selector"));
            v85 = InstanceMethod;
            if (InstanceMethod)
            {
              Name = method_getName(InstanceMethod);
              Implementation = method_getImplementation(v85);
              TypeEncoding = (char *)method_getTypeEncoding(v85);
              _addBulkMethod((uint64_t)buf, Name, Implementation, TypeEncoding);
            }
            else
            {
              FBLogSceneExtension();
              v89 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v83, "name");
                v90 = (id)objc_claimAutoreleasedReturnValue();
                NSStringFromClass(aClass);
                v91 = (id)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)v220 = 138412546;
                v221 = v90;
                v222 = 2112;
                v223 = v91;
                _os_log_error_impl(&dword_19A6D4000, v89, OS_LOG_TYPE_ERROR, "method %@ is not implemented on extension %@; ignoring",
                  v220,
                  0x16u);

              }
            }
          }
          v80 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v188, v219, 16);
        }
        while (v80);
      }

      _flushBulkMethods((uint64_t)buf);
      v92 = (void *)__SelectorsToSettingsMap;
      v93 = (void *)-[NSMapTable copy](table, "copy");
      objc_msgSend(v92, "setObject:forKey:", v93, v165);

      v94 = (void *)__LegacySettingsToSettingsMap;
      v95 = (void *)-[NSMapTable copy](v170, "copy");
      objc_msgSend(v94, "setObject:forKey:", v95, cls);

    }
    else
    {
      FBLogSceneExtension();
      obj = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(obj, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromClass(aClass);
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v96;
        _os_log_impl(&dword_19A6D4000, obj, OS_LOG_TYPE_DEFAULT, "%{public}@ defines no extension protocol!", buf, 0xCu);

      }
    }

  }
}

void sub_19A6D89EC(_Unwind_Exception *a1)
{

  _Unwind_Resume(a1);
}

void _flushBulkMethods(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  uint64_t v4;
  NSObject *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  SEL *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  unint64_t i;
  NSObject *v19;
  id v20;
  id v21;
  void *v22;
  SEL *v23;
  unsigned int v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (*(_DWORD *)(a1 + 24))
  {
    FBLogSceneExtension();
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG);

    if (v3 && *(_DWORD *)(a1 + 24))
    {
      v4 = 4;
      do
      {
        FBLogSceneExtension();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromSelector(*(SEL *)(a1 + 8 * v4));
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromClass(*(Class *)(a1 + 8));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromClass(*(Class *)a1);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v26 = v7;
          v27 = 2112;
          v28 = v8;
          v29 = 2112;
          v30 = v9;
          _os_log_debug_impl(&dword_19A6D4000, v5, OS_LOG_TYPE_DEBUG, "registering method \"%@\" from extension %@ on class \"%@\"", buf, 0x20u);

        }
        v6 = v4 - 3;
        ++v4;
      }
      while (v6 < *(unsigned int *)(a1 + 24));
    }
    v24 = 0;
    v10 = (SEL *)class_addMethodsBulk();
    v23 = v10;
    *(_DWORD *)(a1 + 24) = 0;
    if (v10)
    {
      if (v24)
      {
        for (i = 0; i < v24; ++i)
        {
          FBLogSceneExtension();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(v23[i]);
            v20 = (id)objc_claimAutoreleasedReturnValue();
            NSStringFromClass(*(Class *)(a1 + 8));
            v21 = (id)objc_claimAutoreleasedReturnValue();
            NSStringFromClass(*(Class *)a1);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v26 = v20;
            v27 = 2112;
            v28 = v21;
            v29 = 2112;
            v30 = v22;
            _os_log_error_impl(&dword_19A6D4000, v19, OS_LOG_TYPE_ERROR, "unable to register method \"%@\" from extension %@ on class \"%@\"", buf, 0x20u);

          }
        }
      }
      v11 = (void *)MEMORY[0x1E0CB3940];
      v12 = *(_QWORD *)(a1 + 16);
      NSStringFromClass(*(Class *)a1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("unable to add some methods from <%@> to %@"), v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = MEMORY[0x1E0C81028];
      v16 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _flushBulkMethods(struct BulkMethodContext *)");
        objc_claimAutoreleasedReturnValue();
        _flushBulkMethods_cold_2();
      }

      objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
      v17 = _bs_set_crash_log_message();
      _realizeSettingsExtension_cold_3(v17);
    }
    fbs_free((void **)&v23);
  }
}

void sub_19A6D9FBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_list va;

  va_start(va, a5);
  fbs_free((void **)va);
  _Unwind_Resume(a1);
}

id FBLogAppDataStore()
{
  if (FBLogAppDataStore_onceToken != -1)
    dispatch_once(&FBLogAppDataStore_onceToken, &__block_literal_global_5_0);
  return (id)FBLogAppDataStore___logObj;
}

uint64_t FBSWorkspaceInitialize(void *a1)
{
  id v1;
  void **v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t result;
  void *v8;

  v1 = a1;
  os_unfair_lock_lock(&__sharedInstanceLock);
  if (FBSWorkspaceInitialize_initialized == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot invoke FBSWorkspaceInitialize more than once."));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      FBSWorkspaceInitialize_cold_1((uint64_t)v8);
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    result = _bs_set_crash_log_message();
    __break(0);
  }
  else
  {
    FBSWorkspaceInitialize_initialized = 1;
    v2 = -[FBSWorkspace _initWithOptions:]((void **)[FBSWorkspace alloc], v1);
    v3 = (void *)__sharedInstance;
    __sharedInstance = (uint64_t)v2;

    if (!__sharedInstanceInitializationBlocks)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = (void *)__sharedInstanceInitializationBlocks;
      __sharedInstanceInitializationBlocks = v4;

    }
    if ((objc_msgSend(v1, "_startsInactive") & 1) != 0)
      os_unfair_lock_unlock(&__sharedInstanceLock);
    else
      -[FBSWorkspace _consumeSharedLock_activateWithAlreadyHeldLock:](__sharedInstance, 1);
    v6 = (id)__sharedInstance;

    return (uint64_t)v6;
  }
  return result;
}

void sub_19A6DE468(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id getCADisplayClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getCADisplayClass_softClass;
  v7 = getCADisplayClass_softClass;
  if (!getCADisplayClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getCADisplayClass_block_invoke;
    v3[3] = &unk_1E38ECE40;
    v3[4] = &v4;
    __getCADisplayClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_19A6DE534(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCADisplayClass_block_invoke(uint64_t a1)
{
  Class result;

  QuartzCoreLibrary();
  result = objc_getClass("CADisplay");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCADisplayClass_block_invoke_cold_1();
  getCADisplayClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t QuartzCoreLibrary()
{
  uint64_t result;
  void *v1;

  v1 = 0;
  result = QuartzCoreLibraryCore();
  if (!result)
    QuartzCoreLibrary_cold_1(&v1);
  return result;
}

uint64_t QuartzCoreLibraryCore()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = QuartzCoreLibraryCore_frameworkLibrary;
  v6 = QuartzCoreLibraryCore_frameworkLibrary;
  if (!QuartzCoreLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_1E38EDC88;
    v8 = *(_OWORD *)&off_1E38EDC98;
    v1 = _sl_dlopen();
    v4[3] = v1;
    QuartzCoreLibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19A6DE6A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void FBSRealizeSceneExtension(void *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (!a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("extension != ((void *)0)"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      FBSRealizeSceneExtension_cold_1();
    objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A6DFD4CLL);
  }
  if ((objc_msgSend(a1, "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ is not a FBSSceneExtension"), a1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      FBSRealizeSceneExtension_cold_3();
    objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A6DFDA0);
  }
  if ((void *)objc_opt_class() == a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("FBSSceneExtension should not be realized"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      FBSRealizeSceneExtension_cold_2();
    objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A6DFDF0);
  }
  objc_opt_class();
  objc_opt_class();
  objc_opt_class();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(a1, "settingsExtensions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v27;
    while (1)
    {
      if (*(_QWORD *)v27 != v5)
        objc_enumerationMutation(v2);
      if (!--v4)
      {
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
        if (!v4)
          break;
      }
    }
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(a1, "clientSettingsExtensions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v23;
    while (1)
    {
      if (*(_QWORD *)v23 != v9)
        objc_enumerationMutation(v6);
      if (!--v8)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
        if (!v8)
          break;
      }
    }
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(a1, "transitionContextExtensions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v30, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    while (1)
    {
      if (*(_QWORD *)v19 != v13)
        objc_enumerationMutation(v10);
      if (!--v12)
      {
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v30, 16);
        if (!v12)
          break;
      }
    }
  }

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __FBSRealizeSceneExtension_block_invoke;
  v17[3] = &__block_descriptor_40_e5_v8__0lu32l8;
  v17[4] = a1;
  os_unfair_lock_lock(&__ExtensionLock);
  __FBSRealizeSceneExtension_block_invoke((uint64_t)v17);
  os_unfair_lock_unlock(&__ExtensionLock);
}

void sub_19A6E0A60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _FBSCreateUnsafeObjectFromData(void *a1)
{
  id v1;
  void *v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  id v7;

  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v1, "length"))
  {
    v2 = (void *)MEMORY[0x19AECA15C]();
    v7 = 0;
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v1, &v7);
    v4 = v7;
    if (v3)
    {
      -[NSObject setRequiresSecureCoding:](v3, "setRequiresSecureCoding:", 0);
      -[NSObject decodeObjectOfClasses:forKey:](v3, "decodeObjectOfClasses:forKey:", 0, *MEMORY[0x1E0CB2CD0]);
      v5 = objc_claimAutoreleasedReturnValue();
      -[NSObject finishDecoding](v3, "finishDecoding");
    }
    else
    {
      FBLogAppDataStore();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
        _FBSCreateUnsafeObjectFromData_cold_1();
      v5 = 0;
    }

    objc_autoreleasePoolPop(v2);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void sub_19A6E1834(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

BOOL FBSDisplayHDRModeIsValid(unint64_t a1)
{
  return a1 < 3;
}

BOOL FBSDisplayGamutIsValid(unint64_t a1)
{
  return a1 < 2;
}

BOOL FBSDisplayRotationIsValid(unint64_t a1)
{
  return a1 < 4;
}

uint64_t FBSDisplayTypeIsValid(unint64_t a1)
{
  return (a1 < 9) & (0x1FBu >> a1);
}

BOOL FBSDisplayOverscanCompensationIsValid(unint64_t a1)
{
  return a1 < 3;
}

BOOL FBSDisplayConnectionTypeIsValid(unint64_t a1)
{
  return a1 < 4;
}

uint64_t FBSDisplayRotationFromCADisplayRotation(void *a1)
{
  id v1;
  void *v2;
  char v3;
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;
  int v8;

  v1 = a1;
  if (v1)
  {
    getkCADisplayOrientationRotation90();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v1, "isEqualToString:", v2);

    if ((v3 & 1) != 0)
    {
      v4 = 1;
    }
    else
    {
      getkCADisplayOrientationRotation180();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v1, "isEqualToString:", v5);

      if ((v6 & 1) != 0)
      {
        v4 = 2;
      }
      else
      {
        getkCADisplayOrientationRotation270();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v1, "isEqualToString:", v7);

        if (v8)
          v4 = 3;
        else
          v4 = 0;
      }
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id getkCADisplayOrientationRotation90()
{
  id *v0;

  v0 = (id *)getkCADisplayOrientationRotation90SymbolLoc();
  if (!v0)
    getkCADisplayOrientationRotation90_cold_1();
  return *v0;
}

void *getkCADisplayOrientationRotation90SymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getkCADisplayOrientationRotation90SymbolLoc_ptr;
  v6 = getkCADisplayOrientationRotation90SymbolLoc_ptr;
  if (!getkCADisplayOrientationRotation90SymbolLoc_ptr)
  {
    v1 = (void *)QuartzCoreLibrary();
    v0 = dlsym(v1, "kCADisplayOrientationRotation90");
    v4[3] = (uint64_t)v0;
    getkCADisplayOrientationRotation90SymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19A6E52F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getkCADisplayOrientationRotation270()
{
  id *v0;

  v0 = (id *)getkCADisplayOrientationRotation270SymbolLoc();
  if (!v0)
    getkCADisplayOrientationRotation270_cold_1();
  return *v0;
}

void *getkCADisplayOrientationRotation270SymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getkCADisplayOrientationRotation270SymbolLoc_ptr;
  v6 = getkCADisplayOrientationRotation270SymbolLoc_ptr;
  if (!getkCADisplayOrientationRotation270SymbolLoc_ptr)
  {
    v1 = (void *)QuartzCoreLibrary();
    v0 = dlsym(v1, "kCADisplayOrientationRotation270");
    v4[3] = (uint64_t)v0;
    getkCADisplayOrientationRotation270SymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19A6E53A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getkCADisplayOrientationRotation180()
{
  id *v0;

  v0 = (id *)getkCADisplayOrientationRotation180SymbolLoc();
  if (!v0)
    getkCADisplayOrientationRotation180_cold_1();
  return *v0;
}

void *getkCADisplayOrientationRotation180SymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getkCADisplayOrientationRotation180SymbolLoc_ptr;
  v6 = getkCADisplayOrientationRotation180SymbolLoc_ptr;
  if (!getkCADisplayOrientationRotation180SymbolLoc_ptr)
  {
    v1 = (void *)QuartzCoreLibrary();
    v0 = dlsym(v1, "kCADisplayOrientationRotation180");
    v4[3] = (uint64_t)v0;
    getkCADisplayOrientationRotation180SymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19A6E5450(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t FBSDisplayOverscanCompensationFromCADisplayOverscanAdjustment(void *a1)
{
  id v1;
  void *v2;
  char v3;
  uint64_t v4;
  void *v5;
  int v6;

  v1 = a1;
  if (v1)
  {
    getkCADisplayScaleContent();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v1, "isEqualToString:", v2);

    if ((v3 & 1) != 0)
    {
      v4 = 1;
    }
    else
    {
      getkCADisplayInsetBounds();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v1, "isEqualToString:", v5);

      if (v6)
        v4 = 2;
      else
        v4 = 0;
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id getkCADisplayScaleContent()
{
  id *v0;

  v0 = (id *)getkCADisplayScaleContentSymbolLoc();
  if (!v0)
    getkCADisplayScaleContent_cold_1();
  return *v0;
}

void *getkCADisplayScaleContentSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getkCADisplayScaleContentSymbolLoc_ptr;
  v6 = getkCADisplayScaleContentSymbolLoc_ptr;
  if (!getkCADisplayScaleContentSymbolLoc_ptr)
  {
    v1 = (void *)QuartzCoreLibrary();
    v0 = dlsym(v1, "kCADisplayScaleContent");
    v4[3] = (uint64_t)v0;
    getkCADisplayScaleContentSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19A6E5594(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getkCADisplayInsetBounds()
{
  id *v0;

  v0 = (id *)getkCADisplayInsetBoundsSymbolLoc();
  if (!v0)
    getkCADisplayInsetBounds_cold_1();
  return *v0;
}

void *getkCADisplayInsetBoundsSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getkCADisplayInsetBoundsSymbolLoc_ptr;
  v6 = getkCADisplayInsetBoundsSymbolLoc_ptr;
  if (!getkCADisplayInsetBoundsSymbolLoc_ptr)
  {
    v1 = (void *)QuartzCoreLibrary();
    v0 = dlsym(v1, "kCADisplayInsetBounds");
    v4[3] = (uint64_t)v0;
    getkCADisplayInsetBoundsSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19A6E5644(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_19A6E5AD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_19A6E5C34(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19A6E5E10(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19A6E5EA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_19A6E5F38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_19A6E6068(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_19A6E60EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_19A6E61E0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id FBLogWatchdog()
{
  if (FBLogWatchdog_onceToken != -1)
    dispatch_once(&FBLogWatchdog_onceToken, &__block_literal_global_3_0);
  return (id)FBLogWatchdog___logObj;
}

double FBSProcessResourceTimeIntervalForValue(unint64_t a1)
{
  return (double)a1 / 1000.0;
}

unint64_t FBSProcessResourceValueForTimeInterval(double a1)
{
  if (a1 <= 0.0)
    return 0;
  else
    return (unint64_t)(a1 * 1000.0);
}

uint64_t FBSProcessResourceAllowanceGetValue(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 8);
  return result;
}

id FBSProcessPrettyDescription(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v1 = a1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v1, "identity");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "handle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v2)
    {
      v5 = (void *)MEMORY[0x1E0CB3940];
      if (v3)
        v6 = objc_msgSend(v3, "pid");
      else
        v6 = 0xFFFFFFFFLL;
      objc_msgSend(v5, "stringWithFormat:", CFSTR("%@:%d"), v2, v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

      goto LABEL_16;
    }
    if (v3)
      goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v1;
    if (v4)
    {
LABEL_8:
      v7 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v4, "name");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v2;
      if (!v2)
      {
        objc_msgSend(v4, "bundleIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%@:%d"), v8, objc_msgSend(v4, "pid"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v2)

      goto LABEL_15;
    }
  }
  objc_msgSend(v1, "description");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:

  return v9;
}

id _gatherProperties(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v1, "inheritedProtocols", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v8, "name");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "hasPrefix:", CFSTR("NS"));

        if ((v10 & 1) == 0)
        {
          _gatherProperties(v8);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "addObjectsFromArray:", v11);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v5);
  }

  v12 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v1, "properties");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "minusSet:", v14);
  objc_msgSend(v2, "unionSet:", v14);
  objc_msgSend(v2, "allObjects");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

id _gatherMethods(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v1, "inheritedProtocols", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v8, "name");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "hasPrefix:", CFSTR("NS"));

        if ((v10 & 1) == 0)
        {
          _gatherMethods(v8);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "addObjectsFromArray:", v11);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }

  objc_msgSend(v1, "methods");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v12);

  objc_msgSend(v2, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

void sub_19A6E8BE4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

_QWORD *NSStringFromProcessResourceAllowance(_QWORD *a1)
{
  _QWORD *v1;
  void *v2;
  id v3;
  const __CFString *v4;
  id v5;
  unint64_t v6;
  id v7;
  id v8;
  unint64_t v9;
  id v10;
  id v11;

  v1 = a1;
  if (a1)
  {
    objc_msgSend(off_1E38E9DF0, "builderWithObject:", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (id)objc_msgSend(v2, "appendObject:withName:", CFSTR("FBSProcessResourceAllowance"), 0);
    if (*v1 > 2uLL)
      v4 = CFSTR("(unknown)");
    else
      v4 = *(&off_1E38EDC70 + *v1);
    v5 = (id)objc_msgSend(v2, "appendObject:withName:", v4, CFSTR("type"));
    v6 = v1[1];
    if ((unint64_t)(*v1 - 1) > 1)
      v8 = (id)objc_msgSend(v2, "appendUInt64:withName:", v6, CFSTR("value"));
    else
      v7 = (id)objc_msgSend(v2, "appendTimeInterval:withName:decomposeUnits:", CFSTR("timeValue"), 0, (double)v6 / 1000.0);
    v9 = v1[2];
    if (v9)
    {
      if (*v1 == 2)
        v10 = (id)objc_msgSend(v2, "appendTimeInterval:withName:decomposeUnits:", CFSTR("refreshInterval"), 0, (double)v9 / 1000.0);
      else
        v11 = (id)objc_msgSend(v2, "appendUInt64:withName:");
    }
    objc_msgSend(v2, "build");
    v1 = (_QWORD *)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

void sub_19A6E9588(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __FBSSERIALQUEUE_IS_CALLING_OUT_TO_A_BLOCK__(void *a1)
{
  void *v1;
  void (**v2)(void);

  v2 = a1;
  v1 = (void *)MEMORY[0x19AECA15C]();
  v2[2]();
  objc_autoreleasePoolPop(v1);

}

uint64_t getkMISValidationOptionUnauthoritativeLaunch()
{
  void *v0;

  v0 = getkMISValidationOptionUnauthoritativeLaunchSymbolLoc();
  if (!v0)
    getkMISValidationOptionUnauthoritativeLaunch_cold_1();
  return *(_QWORD *)v0;
}

void *getkMISValidationOptionUnauthoritativeLaunchSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getkMISValidationOptionUnauthoritativeLaunchSymbolLoc_ptr;
  v6 = getkMISValidationOptionUnauthoritativeLaunchSymbolLoc_ptr;
  if (!getkMISValidationOptionUnauthoritativeLaunchSymbolLoc_ptr)
  {
    v1 = (void *)libmisLibrary();
    v0 = dlsym(v1, "kMISValidationOptionUnauthoritativeLaunch");
    v4[3] = (uint64_t)v0;
    getkMISValidationOptionUnauthoritativeLaunchSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19A6EA1B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t soft_MISValidateSignatureAndCopyInfo(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t (*MISValidateSignatureAndCopyInfoSymbolLoc)(uint64_t, uint64_t, uint64_t);

  MISValidateSignatureAndCopyInfoSymbolLoc = (uint64_t (*)(uint64_t, uint64_t, uint64_t))getMISValidateSignatureAndCopyInfoSymbolLoc();
  if (!MISValidateSignatureAndCopyInfoSymbolLoc)
    soft_MISValidateSignatureAndCopyInfo_cold_1();
  return MISValidateSignatureAndCopyInfoSymbolLoc(a1, a2, a3);
}

void *getMISValidateSignatureAndCopyInfoSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getMISValidateSignatureAndCopyInfoSymbolLoc_ptr;
  v6 = getMISValidateSignatureAndCopyInfoSymbolLoc_ptr;
  if (!getMISValidateSignatureAndCopyInfoSymbolLoc_ptr)
  {
    v1 = (void *)libmisLibrary();
    v0 = dlsym(v1, "MISValidateSignatureAndCopyInfo");
    v4[3] = (uint64_t)v0;
    getMISValidateSignatureAndCopyInfoSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19A6EA2E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

void __Block_byref_object_dispose__6(uint64_t a1)
{

}

void __Block_byref_object_dispose__7(uint64_t a1)
{

}

void __Block_byref_object_dispose__8(uint64_t a1)
{

}

void __Block_byref_object_dispose__9(uint64_t a1)
{

}

void __Block_byref_object_dispose__10(uint64_t a1)
{

}

void __Block_byref_object_dispose__11(uint64_t a1)
{

}

void __Block_byref_object_dispose__12(uint64_t a1)
{

}

void __Block_byref_object_dispose__13(uint64_t a1)
{

}

__CFString *FBSDisplayTypeDescription(uint64_t a1)
{
  const __CFString *v1;
  __CFString *v2;
  __CFString *result;

  v1 = CFSTR("Main");
  v2 = CFSTR("<<Invalid>>");
  switch(a1)
  {
    case -1:
      goto LABEL_11;
    case 0:
      goto LABEL_10;
    case 1:
      v1 = CFSTR("AirPlay");
      goto LABEL_10;
    case 3:
      v1 = CFSTR("Car");
      goto LABEL_10;
    case 4:
      v1 = CFSTR("iPodOnly");
      goto LABEL_10;
    case 5:
      v1 = CFSTR("MusicOnly");
      goto LABEL_10;
    case 6:
      v1 = CFSTR("CarInstruments");
      goto LABEL_10;
    case 7:
      v1 = CFSTR("Unknown");
      goto LABEL_10;
    case 8:
      v1 = CFSTR("Continuity");
LABEL_10:
      v2 = (__CFString *)v1;
LABEL_11:
      result = v2;
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%li)"), a1);
      result = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
      break;
  }
  return result;
}

__CFString *FBSDisplayTypeName(unint64_t a1)
{
  if (a1 > 8)
    return 0;
  else
    return off_1E38ED418[a1];
}

const __CFString *NSStringFromProcessResourceType(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("(unknown)");
  else
    return *(&off_1E38EDC70 + a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = MEMORY[0x19AECA324](*(_QWORD *)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__11(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__12(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = MEMORY[0x19AECA324](*(_QWORD *)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

uint64_t __Block_byref_object_copy__13(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_19A6ECA58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  uint64_t v12;
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v12 - 72), 8);
  _Unwind_Resume(a1);
}

_QWORD *FBSProcessResourceAllowanceIsValid(_QWORD *result)
{
  if (result)
  {
    if (*result)
      return (_QWORD *)(result[1] != 0);
    else
      return 0;
  }
  return result;
}

uint64_t FBSProcessResourceAllowanceMake@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  *a4 = result;
  a4[1] = a2;
  a4[2] = a3;
  return result;
}

void sub_19A6EDA04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A6EDA98(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void FBSProcessResourceAllowanceMakeWithRealTimeInterval(_QWORD *a1@<X8>, double a2@<D0>)
{
  unint64_t v2;

  v2 = (unint64_t)(a2 * 1000.0);
  if (a2 <= 0.0)
    v2 = 0;
  *a1 = 1;
  a1[1] = v2;
  a1[2] = 0;
}

id FBLogCommon()
{
  if (FBLogCommon_onceToken != -1)
    dispatch_once(&FBLogCommon_onceToken, &__block_literal_global_13);
  return (id)FBLogCommon___logObj;
}

void sub_19A6F2258(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

__CFString *FBSDisplayHDRModeDescription(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) < 4)
    return off_1E38ED498[a1 + 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%li)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *FBSDisplayGamutDescription(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) < 3)
    return off_1E38ED480[a1 + 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%li)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

uint64_t FBSDisplayHDRModeFromCADisplayHDRMode(void *a1)
{
  id v1;
  void *v2;
  char v3;
  uint64_t v4;
  void *v5;
  int v6;

  v1 = a1;
  if (v1)
  {
    getkCADisplayModeHDR10();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v1, "isEqualToString:", v2);

    if ((v3 & 1) != 0)
    {
      v4 = 1;
    }
    else
    {
      getkCADisplayModeDolby();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v1, "isEqualToString:", v5);

      if (v6)
        v4 = 2;
      else
        v4 = 0;
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id getkCADisplayModeHDR10()
{
  id *v0;

  v0 = (id *)getkCADisplayModeHDR10SymbolLoc();
  if (!v0)
    getkCADisplayModeHDR10_cold_1();
  return *v0;
}

void *getkCADisplayModeHDR10SymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getkCADisplayModeHDR10SymbolLoc_ptr;
  v6 = getkCADisplayModeHDR10SymbolLoc_ptr;
  if (!getkCADisplayModeHDR10SymbolLoc_ptr)
  {
    v1 = (void *)QuartzCoreLibrary();
    v0 = dlsym(v1, "kCADisplayModeHDR10");
    v4[3] = (uint64_t)v0;
    getkCADisplayModeHDR10SymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19A6F2C30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getkCADisplayModeDolby()
{
  id *v0;

  v0 = (id *)getkCADisplayModeDolbySymbolLoc();
  if (!v0)
    getkCADisplayModeDolby_cold_1();
  return *v0;
}

void *getkCADisplayModeDolbySymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getkCADisplayModeDolbySymbolLoc_ptr;
  v6 = getkCADisplayModeDolbySymbolLoc_ptr;
  if (!getkCADisplayModeDolbySymbolLoc_ptr)
  {
    v1 = (void *)QuartzCoreLibrary();
    v0 = dlsym(v1, "kCADisplayModeDolby");
    v4[3] = (uint64_t)v0;
    getkCADisplayModeDolbySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19A6F2CE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void *FBSDisplayGamutFromCADisplayGamut(void *result)
{
  id v1;
  void *v2;
  unsigned int v3;

  if (result)
  {
    v1 = result;
    getkCADisplayModeGamutP3();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v1, "isEqualToString:", v2);

    return (void *)v3;
  }
  return result;
}

id getkCADisplayModeGamutP3()
{
  id *v0;

  v0 = (id *)getkCADisplayModeGamutP3SymbolLoc();
  if (!v0)
    getkCADisplayModeGamutP3_cold_1();
  return *v0;
}

void *getkCADisplayModeGamutP3SymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getkCADisplayModeGamutP3SymbolLoc_ptr;
  v6 = getkCADisplayModeGamutP3SymbolLoc_ptr;
  if (!getkCADisplayModeGamutP3SymbolLoc_ptr)
  {
    v1 = (void *)QuartzCoreLibrary();
    v0 = dlsym(v1, "kCADisplayModeGamutP3");
    v4[3] = (uint64_t)v0;
    getkCADisplayModeGamutP3SymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19A6F2DE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_19A6F3F60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id _NSStringFromFBSDisplayLayoutQOS(signed int a1)
{
  if (a1 < 3)
    return *((id *)&off_1E38EC788 + a1);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%i)"), a1);
  return (id)objc_claimAutoreleasedReturnValue();
}

void sub_19A6F5C24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id FBSOpenApplicationErrorCreate(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;

  v10 = a2;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if ((unint64_t)a1 > 0xA)
      v13 = 0;
    else
      v13 = off_1E38EBA68[(_QWORD)a1 - 1];
    objc_msgSend(v11, "bs_setSafeObject:forKey:", v13, *(_QWORD *)off_1E38E9A78);
    if (v10)
    {
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v10, &a9);
      objc_msgSend(v12, "bs_setSafeObject:forKey:", v14, *MEMORY[0x1E0CB2D68]);

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("FBSOpenApplicationErrorDomain"), a1, v12);
    a1 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return a1;
}

id FBLogInterfaceOrientationObserver()
{
  if (FBLogInterfaceOrientationObserver_onceToken != -1)
    dispatch_once(&FBLogInterfaceOrientationObserver_onceToken, &__block_literal_global_9);
  return (id)FBLogInterfaceOrientationObserver___logObj;
}

__CFString *NSStringFromFBSSceneInterruptionPolicy(unint64_t a1)
{
  if (a1 < 4)
    return off_1E38EC100[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%li)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

void sub_19A6F7E20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __accessProxiesWithBlock(void *a1)
{
  void (**v1)(void);
  uint64_t v2;
  void *v3;
  void (**v4)(void);

  v1 = a1;
  if (v1)
  {
    v4 = v1;
    os_unfair_lock_lock((os_unfair_lock_t)&__accessProxiesWithBlock___lock);
    if (!__accessProxiesWithBlock___endpointToProxy)
    {
      objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 0, 0);
      v2 = objc_claimAutoreleasedReturnValue();
      v3 = (void *)__accessProxiesWithBlock___endpointToProxy;
      __accessProxiesWithBlock___endpointToProxy = v2;

    }
    v4[2]();
    os_unfair_lock_unlock((os_unfair_lock_t)&__accessProxiesWithBlock___lock);
    v1 = v4;
  }

}

void OUTLINED_FUNCTION_7_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_7_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t OUTLINED_FUNCTION_7_3()
{
  return NSRequestConcreteImplementation();
}

__CFString *NSStringFromFBSSceneLayerType(unint64_t a1)
{
  if (a1 < 3)
    return off_1E38ED400[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(undefined: %ld)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

uint64_t _QOSClassForFBSDisplayLayoutQOS(unsigned int a1)
{
  if (a1 >= 3)
    return 9;
  else
    return 4 * a1 + 17;
}

__CFString *NSStringFromFBSSceneActivityMode(uint64_t a1)
{
  uint64_t v1;
  __CFString *v2;

  v1 = (int)a1 + 3;
  if (v1 < 0xB && ((0x40Fu >> v1) & 1) != 0)
  {
    v2 = off_1E38EC120[v1];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(invalid - %d)"), a1);
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

void sub_19A6FB444(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id FBLogSceneClient()
{
  if (FBLogSceneClient_onceToken != -1)
    dispatch_once(&FBLogSceneClient_onceToken, &__block_literal_global_11_0);
  return (id)FBLogSceneClient___logObj;
}

id FBSFrameworkBundle()
{
  if (FBSFrameworkBundle___once != -1)
    dispatch_once(&FBSFrameworkBundle___once, &__block_literal_global);
  return (id)FBSFrameworkBundle___bundle;
}

void sub_19A6FE184(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x3Au);
}

uint64_t OUTLINED_FUNCTION_3()
{
  return objc_opt_class();
}

NSMapTable *FBSSettingForExtensionSelector(void *a1, const void *a2)
{
  NSMapTable *v4;
  NSMapTable *v5;
  NSMapTable *v6;
  void *v8;

  if (!a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("selector != ((void *)0)"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      FBSSettingForExtensionSelector_cold_1();
LABEL_14:
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A6FF03CLL);
  }
  if (!a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("settingsClass != ((void *)0)"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      FBSSettingForExtensionSelector_cold_2();
    goto LABEL_14;
  }
  os_unfair_lock_lock(&__ExtensionLock);
  if (__SelectorsToSettingsMap)
  {
    NSMapGet((NSMapTable *)__SelectorsToSettingsMap, (const void *)objc_msgSend(a1, "_baseClass"));
    v4 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
      v4 = (NSMapTable *)NSMapGet(v4, a2);
    v6 = v4;

  }
  else
  {
    v6 = 0;
  }
  os_unfair_lock_unlock(&__ExtensionLock);
  return v6;
}

void FBSRealizeSubclassExtension(objc_class *a1)
{
  Class Superclass;
  void (*v2)(void);
  void *v3;
  _BOOL4 v4;
  objc_class *Class;
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  objc_method *v11;
  char *name;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  id v32;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  id v39;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  id v47;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  Method *v54;
  unsigned int outCount;
  _BYTE v56[128];
  _QWORD v57[3];

  v57[1] = *MEMORY[0x1E0C80C00];
  if (!a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("settingsClass != ((void *)0)"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      FBSRealizeSubclassExtension_cold_1();
    objc_msgSend(objc_retainAutorelease(v42), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A6FFCD8);
  }
  Superclass = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&__SubclassLock);
  if ((Class)objc_opt_class() == Superclass)
    goto LABEL_52;
  v2 = (void (*)(void))MEMORY[0x1E0DE79B8];
  do
  {
    objc_getAssociatedObject(Superclass, (const void *)_FBSRealizedKey);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3 == 0;

    if (!v4)
      break;
    outCount = 0;
    v54 = 0;
    Class = object_getClass(Superclass);
    v6 = 0;
    v54 = class_copyMethodList(Class, &outCount);
    if (!v54 || !outCount)
      goto LABEL_51;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    do
    {
      v11 = v54[v7];
      if (method_getImplementation(v11) == v2)
        goto LABEL_29;
      name = (char *)method_getDescription(v11)->name;
      if (name == sel_subclassExtension)
      {
        v16 = -[objc_class subclassExtension](Superclass, "subclassExtension");
        if (!v16)
          goto LABEL_29;
        v57[0] = v16;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 1);
        v17 = objc_claimAutoreleasedReturnValue();
        goto LABEL_28;
      }
      if (name == sel_subclassExtensions)
      {
        -[objc_class subclassExtensions](Superclass, "subclassExtensions");
        v17 = objc_claimAutoreleasedReturnValue();
LABEL_28:
        v18 = (void *)v17;

        v10 = v18;
        goto LABEL_29;
      }
      if (name == sel_immutableSubclass)
      {
        v8 = (void *)-[objc_class immutableSubclass](Superclass, "immutableSubclass");
        if (v8
          && objc_msgSend(v8, "isSubclassOfClass:", -[objc_class _mutableClass](Superclass, "_mutableClass")))
        {
          v28 = (void *)MEMORY[0x1E0CB3940];
          NSStringFromClass(Superclass);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "stringWithFormat:", CFSTR("%@ is not immutable"), v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          v31 = MEMORY[0x1E0C81028];
          v32 = MEMORY[0x1E0C81028];
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void FBSRealizeSubclassExtension(__unsafe_unretained Class _Nonnull)");
            objc_claimAutoreleasedReturnValue();
            FBSRealizeSubclassExtension_cold_3();
          }

          objc_msgSend(objc_retainAutorelease(v30), "UTF8String");
          v34 = _bs_set_crash_log_message();
          _realizeSettingsExtension_cold_3(v34);
        }
      }
      else if (name == sel_mutableSubclass)
      {
        v9 = (void *)-[objc_class mutableSubclass](Superclass, "mutableSubclass");
        if (!v9)
        {
          v22 = (void *)MEMORY[0x1E0CB3940];
          NSStringFromClass(Superclass);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "stringWithFormat:", CFSTR("+[%@ mutableSubclass] returned nil"), v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          v25 = MEMORY[0x1E0C81028];
          v26 = MEMORY[0x1E0C81028];
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void FBSRealizeSubclassExtension(__unsafe_unretained Class _Nonnull)");
            objc_claimAutoreleasedReturnValue();
            FBSRealizeSubclassExtension_cold_5();
          }

          objc_msgSend(objc_retainAutorelease(v24), "UTF8String");
          v27 = _bs_set_crash_log_message();
          _realizeSettingsExtension_cold_3(v27);
        }
        if ((objc_msgSend(v9, "isSubclassOfClass:", -[objc_class _mutableClass](Superclass, "_mutableClass")) & 1) == 0)
        {
          v35 = (void *)MEMORY[0x1E0CB3940];
          NSStringFromClass(Superclass);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "stringWithFormat:", CFSTR("%@ is not mutable"), v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          v38 = MEMORY[0x1E0C81028];
          v39 = MEMORY[0x1E0C81028];
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void FBSRealizeSubclassExtension(__unsafe_unretained Class _Nonnull)");
            objc_claimAutoreleasedReturnValue();
            FBSRealizeSubclassExtension_cold_7();
          }

          objc_msgSend(objc_retainAutorelease(v37), "UTF8String");
          v41 = _bs_set_crash_log_message();
          _realizeSettingsExtension_cold_3(v41);
        }
      }
      else if (name == sel_settingForProperty_
             || name == sel_allSettings
             || name == sel_allSettingsFromProtocol_
             || name == sel_allSettingsFromExtension_)
      {
        v43 = (void *)MEMORY[0x1E0CB3940];
        NSStringFromSelector(name);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "stringWithFormat:", CFSTR("+[FBSSettings %@] may not be overridden."), v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();

        v46 = MEMORY[0x1E0C81028];
        v47 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void FBSRealizeSubclassExtension(__unsafe_unretained Class _Nonnull)");
          objc_claimAutoreleasedReturnValue();
          FBSRealizeSubclassExtension_cold_9();
        }

        objc_msgSend(objc_retainAutorelease(v45), "UTF8String");
        v49 = _bs_set_crash_log_message();
        _realizeSettingsExtension_cold_3(v49);
      }
LABEL_29:
      ++v7;
    }
    while (v7 < outCount);
    if (v8 && v9 && v8 != v9)
    {
      objc_msgSend(v8, "_setCounterpartClass:", v9);
      objc_msgSend(v9, "_setCounterpartClass:", v8);
    }
    if (v10)
    {
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      v6 = v10;
      v19 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
      if (v19)
      {
        v20 = *(_QWORD *)v51;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v51 != v20)
              objc_enumerationMutation(v6);
            FBSRealizeSettingsExtension((uint64_t)Superclass, *(void **)(*((_QWORD *)&v50 + 1) + 8 * i));
          }
          v19 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
        }
        while (v19);
      }

    }
    else
    {
      v6 = 0;
    }
LABEL_51:
    objc_setAssociatedObject(Superclass, (const void *)_FBSRealizedKey, &unk_1E390C3F0, 0);
    Superclass = class_getSuperclass(Superclass);
    fbs_free((void **)&v54);

  }
  while (Superclass != (Class)objc_opt_class());
LABEL_52:
  os_unfair_lock_unlock((os_unfair_lock_t)&__SubclassLock);
}

void sub_19A6FFD74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  fbs_free((void **)va);
  _Unwind_Resume(a1);
}

void FBSIngestSubclassProperties(uint64_t a1)
{
  void *v1;
  _QWORD v2[5];

  if (a1)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __FBSIngestSubclassProperties_block_invoke;
    v2[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v2[4] = a1;
    os_unfair_lock_lock((os_unfair_lock_t)&__SubclassLock);
    __FBSIngestSubclassProperties_block_invoke((uint64_t)v2);
    os_unfair_lock_unlock((os_unfair_lock_t)&__SubclassLock);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("settingsClass != ((void *)0)"));
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      FBSIngestSubclassProperties_cold_1();
    objc_msgSend(objc_retainAutorelease(v1), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

void _ingestPropertiesFromSettingsSubclass(objc_class *a1)
{
  Class v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  Class v18;
  NSString *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  int v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  Class v29;
  NSObject *v30;
  _BOOL4 v31;
  unint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  _BOOL4 v37;
  NSObject *v38;
  uint64_t v39;
  void *v40;
  unint64_t v41;
  objc_property *v42;
  NSObject *v43;
  NSObject *v44;
  NSObject *v45;
  id v46;
  NSObject *v47;
  void *v48;
  __CFString *v49;
  void *v50;
  void *v51;
  char v52;
  int v53;
  double v54;
  int v55;
  uint64_t v56;
  objc_class *v57;
  id v58;
  objc_class *v59;
  void *v60;
  int v61;
  void *v62;
  void *v63;
  NSObject *v64;
  uint64_t v65;
  uint64_t v66;
  NSObject *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  NSObject *v73;
  int v74;
  NSObject *v75;
  void *v76;
  NSObject *v77;
  id v78;
  NSObject *v79;
  uint64_t v80;
  void *v81;
  BOOL v82;
  NSObject *v83;
  void *v84;
  objc_class *v85;
  NSObject *v86;
  NSObject *v87;
  void *v88;
  void *v89;
  __CFString *v90;
  void *v91;
  uint64_t v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  NSObject *v97;
  id v98;
  uint64_t v99;
  void *v100;
  NSObject *v101;
  id v102;
  uint64_t v103;
  void *v104;
  void *v105;
  void *v106;
  NSObject *v107;
  id v108;
  uint64_t v109;
  NSObject *v110;
  NSObject *v111;
  __CFString *v112;
  void *v113;
  const char *aSelector;
  char *aSelectora;
  char *aSelectorb;
  char *aSelectorc;
  int v118;
  void *v119;
  NSObject *v120;
  id v121;
  uint64_t v122;
  void *v123;
  _QWORD v124[2];
  void (*v125)();
  void *v126;
  void *v127;
  objc_class *v128;
  _QWORD v129[6];
  uint64_t v130;
  uint64_t *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t *v135;
  uint64_t v136;
  char v137;
  id v138;
  objc_property_t *v139;
  unsigned int outCount;
  const __CFString *v141;
  void *v142;
  uint8_t buf[4];
  NSObject *v144;
  __int16 v145;
  const __CFString *v146;
  __int16 v147;
  _QWORD v148[5];

  v148[2] = *MEMORY[0x1E0C80C00];
  if (!a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("settingsSubclass != ((void *)0)"));
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      _ingestPropertiesFromSettingsSubclass_cold_1();
    objc_msgSend(objc_retainAutorelease(v93), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A701354);
  }
  v1 = a1;
  os_unfair_lock_assert_owner((const os_unfair_lock *)&__SubclassLock);
  os_unfair_lock_assert_not_owner(&__ExtensionLock);
  if (!__BaseToSubclassMap)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)__BaseToSubclassMap;
    __BaseToSubclassMap = v2;

    v4 = (void *)__BaseToSubclassMap;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v5, objc_opt_class());

    v6 = (void *)__BaseToSubclassMap;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v7, objc_opt_class());

    v8 = (void *)__BaseToSubclassMap;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v9, objc_opt_class());

  }
  v10 = -[objc_class _baseClass](v1, "_baseClass");
  objc_msgSend((id)__BaseToSubclassMap, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "containsObject:", v1) & 1) == 0)
  {
    objc_msgSend(v11, "addObject:", v1);
    v12 = -[objc_class _mutableClass](v1, "_mutableClass");
    if ((Class)v10 != v1)
    {
      v13 = v12;
      if ((Class)v12 != v1 && v10 != objc_opt_class())
      {
        NSStringFromClass(v1);
        v14 = objc_claimAutoreleasedReturnValue();
        FBLogSceneExtension();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v144 = v14;
          _os_log_impl(&dword_19A6D4000, v15, OS_LOG_TYPE_DEFAULT, "Ingesting properties from %{public}@...", buf, 0xCu);
        }

        v16 = -[objc_class _counterpartClass](v1, "_counterpartClass");
        if (-[objc_class isSubclassOfClass:](v1, "isSubclassOfClass:", v13))
        {
          if (v10 == v13)
          {
            v17 = v1;
            goto LABEL_17;
          }
          if (v16)
          {
            v17 = (void *)v16;
LABEL_17:
            v18 = v1;
            goto LABEL_44;
          }
          v22 = -[NSObject rangeOfString:](v14, "rangeOfString:", CFSTR("Mutable"));
          if (v22 == 0x7FFFFFFFFFFFFFFFLL)
          {
            FBLogSceneExtension();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
              _ingestPropertiesFromSettingsSubclass_cold_13();

            v17 = 0;
            v24 = 1;
            goto LABEL_47;
          }
          v25 = v21;
          v26 = (void *)MEMORY[0x1E0CB3940];
          -[NSObject substringToIndex:](v14, "substringToIndex:", v22);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject substringFromIndex:](v14, "substringFromIndex:", v22 + v25);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "stringWithFormat:", CFSTR("%@%@"), v27, v28);
          v19 = (NSString *)objc_claimAutoreleasedReturnValue();

          v29 = NSClassFromString(v19);
          FBLogSceneExtension();
          v30 = objc_claimAutoreleasedReturnValue();
          v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG);
          if (v29)
          {
            if (v31)
              _ingestPropertiesFromSettingsSubclass_cold_15();
          }
          else if (v31)
          {
            _ingestPropertiesFromSettingsSubclass_cold_14();
          }
          v18 = v1;
        }
        else
        {
          if (v16)
          {
            v17 = v1;
            v18 = (Class)v16;
            goto LABEL_44;
          }
          objc_msgSend(MEMORY[0x1E0CB3500], "lowercaseLetterCharacterSet");
          v19 = (NSString *)objc_claimAutoreleasedReturnValue();
          if (!-[NSObject length](v14, "length"))
            goto LABEL_28;
          v20 = 0;
          while ((-[NSString characterIsMember:](v19, "characterIsMember:", -[NSObject characterAtIndex:](v14, "characterAtIndex:", v20)) & 1) == 0)
          {
            if (++v20 >= -[NSObject length](v14, "length"))
              goto LABEL_28;
          }
          if (v20 < 2)
          {
LABEL_28:
            v18 = 0;
LABEL_42:

            if (!v1)
            {
              v17 = 0;
              v24 = 1;
              goto LABEL_46;
            }
            v17 = v1;
LABEL_44:
            if (v17 == (void *)objc_msgSend(v17, "_baseClass"))
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("settingsSubclass != [settingsSubclass _baseClass]"));
              v94 = (void *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                _ingestPropertiesFromSettingsSubclass_cold_2();
              objc_msgSend(objc_retainAutorelease(v94), "UTF8String");
              _bs_set_crash_log_message();
              __break(0);
              JUMPOUT(0x19A7013B0);
            }
            objc_msgSend(v11, "addObject:", v17);
            v24 = 0;
LABEL_46:
            v1 = v18;
            if (!v18)
            {
LABEL_49:
              FBLogSceneExtension();
              v38 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v144 = v14;
                _os_log_impl(&dword_19A6D4000, v38, OS_LOG_TYPE_DEFAULT, "Unable to determine counterpart class for %{public}@.", buf, 0xCu);
              }

              goto LABEL_153;
            }
LABEL_47:
            if (v1 == (Class)-[objc_class _mutableClass](v1, "_mutableClass"))
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("mutableSubclass != [mutableSubclass _mutableClass]"));
              v95 = (void *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                _ingestPropertiesFromSettingsSubclass_cold_3();
              objc_msgSend(objc_retainAutorelease(v95), "UTF8String");
              _bs_set_crash_log_message();
              __break(0);
              JUMPOUT(0x19A70140CLL);
            }
            objc_msgSend(v11, "addObject:", v1);
            if (v24)
              goto LABEL_49;
            if (!v16)
            {
              objc_msgSend(v17, "_setCounterpartClass:", v1);
              -[objc_class _setCounterpartClass:](v1, "_setCounterpartClass:", v17);
            }
            outCount = 0;
            v139 = class_copyPropertyList(v1, &outCount);
            if (outCount)
            {
              NSStringFromClass((Class)v17);
              v122 = objc_claimAutoreleasedReturnValue();

              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@[derived]"), v122);
              v39 = objc_claimAutoreleasedReturnValue();
              NSProtocolFromString((NSString *)v39);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v120 = v39;
              LOBYTE(v39) = v40 == 0;

              if ((v39 & 1) == 0)
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("a protocol named \"%@\" already exists"), v120);
                v96 = (void *)objc_claimAutoreleasedReturnValue();
                v97 = MEMORY[0x1E0C81028];
                v98 = MEMORY[0x1E0C81028];
                if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _ingestPropertiesFromSettingsSubclass(__unsafe_unretained Class)");
                  objc_claimAutoreleasedReturnValue();
                  _ingestPropertiesFromSettingsSubclass_cold_12();
                }

                objc_msgSend(objc_retainAutorelease(v96), "UTF8String");
                v99 = _bs_set_crash_log_message();
                _realizeSettingsExtension_cold_3(v99);
              }
              objc_msgSend(off_1E38E9E30, "protocolWithName:", v120);
              v123 = (void *)objc_claimAutoreleasedReturnValue();
              -[objc_class _legacyDescriptionProvider](v1, "_legacyDescriptionProvider");
              v121 = (id)objc_claimAutoreleasedReturnValue();
              if (!v121)
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("mutableInstance != nil"));
                v100 = (void *)objc_claimAutoreleasedReturnValue();
                v101 = MEMORY[0x1E0C81028];
                v102 = MEMORY[0x1E0C81028];
                if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _ingestPropertiesFromSettingsSubclass(__unsafe_unretained Class)");
                  objc_claimAutoreleasedReturnValue();
                  _ingestPropertiesFromSettingsSubclass_cold_6();
                }

                objc_msgSend(objc_retainAutorelease(v100), "UTF8String");
                v103 = _bs_set_crash_log_message();
                _realizeSettingsExtension_cold_3(v103);
              }
              if (outCount)
              {
                v41 = 0;
                v113 = (void *)*MEMORY[0x1E0C9AE50];
                do
                {
                  v42 = v139[v41];
                  objc_msgSend(MEMORY[0x1E0CB3940], "bs_stringWithUTF8String:", property_getName(v42));
                  v43 = objc_claimAutoreleasedReturnValue();
                  FBLogSceneExtension();
                  v44 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412290;
                    v144 = v43;
                    _os_log_debug_impl(&dword_19A6D4000, v44, OS_LOG_TYPE_DEBUG, "Checking property %@...", buf, 0xCu);
                  }

                  if ((-[NSObject isEqualToString:](v43, "isEqualToString:", CFSTR("hash")) & 1) != 0
                    || (-[NSObject isEqualToString:](v43, "isEqualToString:", CFSTR("superclass")) & 1) != 0
                    || (-[NSObject isEqualToString:](v43, "isEqualToString:", CFSTR("description")) & 1) != 0
                    || (-[NSObject isEqualToString:](v43, "isEqualToString:", CFSTR("debugDescription")) & 1) != 0)
                  {
                    goto LABEL_110;
                  }
                  v138 = 0;
                  objc_msgSend(off_1E38E9E48, "propertyWithProperty:error:", v42, &v138);
                  v45 = objc_claimAutoreleasedReturnValue();
                  v46 = v138;
                  v119 = v46;
                  if (v45)
                  {
                    if (-[NSObject isReadOnly](v45, "isReadOnly"))
                    {
                      FBLogSceneExtension();
                      v47 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
                      {
                        *(_DWORD *)buf = 138412290;
                        v144 = v43;
                        _os_log_debug_impl(&dword_19A6D4000, v47, OS_LOG_TYPE_DEBUG, "Skipping %@ since it is readonly", buf, 0xCu);
                      }
                    }
                    else
                    {
                      -[NSObject setter](v45, "setter");
                      v50 = (void *)objc_claimAutoreleasedReturnValue();
                      aSelector = (const char *)objc_msgSend(v50, "selector");

                      v118 = -[objc_class instancesRespondToSelector:](v1, "instancesRespondToSelector:", aSelector);
                      if (!v118
                        || (-[NSObject getter](v45, "getter"),
                            v51 = (void *)objc_claimAutoreleasedReturnValue(),
                            v52 = objc_msgSend(v17, "instancesRespondToSelector:", objc_msgSend(v51, "selector")),
                            v51,
                            (v52 & 1) != 0))
                      {
                        objc_msgSend(v123, "addProperty:", v45);
                        v134 = 0;
                        v135 = &v134;
                        v136 = 0x2020000000;
                        v137 = 0;
                        v130 = 0;
                        v131 = &v130;
                        v132 = 0x2020000000;
                        v133 = 0;
                        if (v118)
                        {
                          if ((objc_opt_respondsToSelector() & 1) == 0)
                          {
                            v104 = (void *)MEMORY[0x1E0CB3940];
                            NSStringFromSelector(aSelector);
                            v105 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v104, "stringWithFormat:", CFSTR("instance doesn't respond to %@"), v105);
                            v106 = (void *)objc_claimAutoreleasedReturnValue();

                            v107 = MEMORY[0x1E0C81028];
                            v108 = MEMORY[0x1E0C81028];
                            if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
                            {
                              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _ingestPropertiesFromSettingsSubclass(__unsafe_unretained Class)");
                              objc_claimAutoreleasedReturnValue();
                              _ingestPropertiesFromSettingsSubclass_cold_10();
                            }

                            objc_msgSend(objc_retainAutorelease(v106), "UTF8String");
                            v109 = _bs_set_crash_log_message();
                            _realizeSettingsExtension_cold_3(v109);
                          }
                          -[NSObject value](v45, "value");
                          v112 = (__CFString *)objc_claimAutoreleasedReturnValue();
                          v53 = -[__CFString type](v112, "type");
                          v55 = v53;
                          v56 = (uint64_t)aSelector;
                          switch((char)v53)
                          {
                            case ':':
                              goto LABEL_86;
                            case ';':
                            case '<':
                            case '=':
                            case '>':
                            case 'A':
                              goto LABEL_112;
                            case '?':
                              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("type cannot be unknown"));
                              v76 = (void *)objc_claimAutoreleasedReturnValue();
                              v77 = MEMORY[0x1E0C81028];
                              v78 = MEMORY[0x1E0C81028];
                              if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
                              {
                                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _ingestPropertiesFromSettingsSubclass(__unsafe_unretained Class)");
                                v79 = objc_claimAutoreleasedReturnValue();
                                *(_DWORD *)buf = 138544130;
                                v144 = v79;
                                v145 = 2114;
                                v146 = CFSTR("FBSSceneExtension.m");
                                v147 = 1024;
                                LODWORD(v148[0]) = 1025;
                                WORD2(v148[0]) = 2114;
                                *(_QWORD *)((char *)v148 + 6) = v76;
                                _os_log_error_impl(&dword_19A6D4000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

                              }
                              objc_msgSend(objc_retainAutorelease(v76), "UTF8String");
                              v80 = _bs_set_crash_log_message();
                              _realizeSettingsExtension_cold_3(v80);
                            case '@':
                              v57 = (objc_class *)-[__CFString objectClass](v112, "objectClass", aSelector);
                              if (v57)
                              {
                                if (v57 == (objc_class *)objc_opt_class())
                                {
                                  v58 = v113;
                                }
                                else
                                {
                                  +[FBSObjectProxy proxyForClass:]((uint64_t)FBSObjectProxy, v57);
                                  v58 = (id)objc_claimAutoreleasedReturnValue();
                                }
                              }
                              else
                              {
                                v59 = (objc_class *)objc_opt_class();
                                +[FBSObjectProxy proxyForClass:]((uint64_t)FBSObjectProxy, v59);
                                v58 = (id)objc_claimAutoreleasedReturnValue();
                              }
                              v60 = v58;
                              objc_msgSend(v121, aSelector, v58);

                              goto LABEL_90;
                            case 'B':
                              goto LABEL_117;
                            default:
                              if (v53 == 35)
                              {
                                v56 = objc_opt_class();
LABEL_86:
                                objc_msgSend(v121, aSelector, v56);
                                goto LABEL_90;
                              }
LABEL_112:
                              if ((v53 & 0xFFFFFFFD) == 0x64)
                              {
                                LODWORD(v54) = 1.0;
                                objc_msgSend(v121, aSelector, aSelector, v54);
LABEL_90:
                                v61 = 0;
                                goto LABEL_91;
                              }
                              v72 = v53 - 40;
                              if (v72 > 0x3A)
                                goto LABEL_126;
                              if (((1 << (v53 - 40)) & 0x448000000000001) != 0)
                              {
                                FBLogSceneExtension();
                                v73 = objc_claimAutoreleasedReturnValue();
                                if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
                                {
                                  *(_DWORD *)buf = 138412546;
                                  v144 = v43;
                                  v145 = 1024;
                                  LODWORD(v146) = v55;
                                  _os_log_debug_impl(&dword_19A6D4000, v73, OS_LOG_TYPE_DEBUG, "Skipping %@ because this type (%d) is not supported", buf, 0x12u);
                                }

                              }
                              else
                              {
                                if (v72 == 2)
                                {
                                  objc_msgSend(v121, aSelector, "scene");
                                  goto LABEL_90;
                                }
LABEL_126:
                                if (v53 != 123)
                                {
LABEL_117:
                                  objc_msgSend(v121, aSelector, 1);
                                  goto LABEL_90;
                                }
                                v74 = _structDisposition(v112);
                                switch(v74)
                                {
                                  case 3:
                                    objc_msgSend(v121, aSelector, 0.0, 0.0, 1.0, 1.0);
                                    goto LABEL_90;
                                  case 2:
                                    objc_msgSend(v121, aSelector, 1.0, 1.0);
                                    goto LABEL_90;
                                  case 1:
                                    objc_msgSend(v121, aSelector, 1, 1);
                                    goto LABEL_90;
                                }
                                FBLogSceneExtension();
                                v75 = objc_claimAutoreleasedReturnValue();
                                if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG))
                                {
                                  *(_DWORD *)buf = 138412546;
                                  v144 = v43;
                                  v145 = 2112;
                                  v146 = v112;
                                  _os_log_debug_impl(&dword_19A6D4000, v75, OS_LOG_TYPE_DEBUG, "Skipping %@ because this struct is not supported: %@", buf, 0x16u);
                                }

                              }
                              v61 = 1;
LABEL_91:
                              -[FBSSettings _legacyOtherSettings]((uint64_t)v121);
                              v62 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v62, "allSettings");
                              v63 = (void *)objc_claimAutoreleasedReturnValue();
                              if (objc_msgSend(v63, "count") == 1)
                              {
                                v129[0] = MEMORY[0x1E0C809B0];
                                v129[1] = 3221225472;
                                v129[2] = ___ingestPropertiesFromSettingsSubclass_block_invoke;
                                v129[3] = &unk_1E38EB298;
                                v129[4] = &v130;
                                v129[5] = &v134;
                                objc_msgSend(v63, "enumerateWithBlock:", v129);
                              }
                              else
                              {
                                if (objc_msgSend(v63, "count"))
                                {
                                  FBLogSceneExtension();
                                  v64 = objc_claimAutoreleasedReturnValue();
                                  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
                                  {
                                    NSStringFromClass(v1);
                                    v110 = (id)objc_claimAutoreleasedReturnValue();
                                    NSStringFromSelector(aSelector);
                                    v65 = objc_claimAutoreleasedReturnValue();
                                    *(_DWORD *)buf = 138412546;
                                    v144 = v110;
                                    v145 = 2112;
                                    aSelectora = (char *)v65;
                                    v146 = (const __CFString *)v65;
                                    _os_log_debug_impl(&dword_19A6D4000, v64, OS_LOG_TYPE_DEBUG, "Calling -[%@ %@] produced multiple settings changes. Ignoring this property.", buf, 0x16u);

                                  }
                                }
                                else if (v61)
                                {
                                  FBLogSceneExtension();
                                  v64 = objc_claimAutoreleasedReturnValue();
                                  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
                                  {
                                    -[__CFString encoding](v112, "encoding");
                                    v66 = objc_claimAutoreleasedReturnValue();
                                    *(_DWORD *)buf = 138543618;
                                    v144 = v43;
                                    v145 = 2114;
                                    aSelectorb = (char *)v66;
                                    v146 = (const __CFString *)v66;
                                    _os_log_debug_impl(&dword_19A6D4000, v64, OS_LOG_TYPE_DEBUG, "Ignoring property %{public}@ because %{public}@ is not a supported encoding.", buf, 0x16u);

                                  }
                                }
                                else
                                {
                                  FBLogSceneExtension();
                                  v64 = objc_claimAutoreleasedReturnValue();
                                  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
                                  {
                                    NSStringFromClass(v1);
                                    v111 = (id)objc_claimAutoreleasedReturnValue();
                                    NSStringFromSelector(aSelector);
                                    aSelectorc = (char *)objc_claimAutoreleasedReturnValue();
                                    *(_DWORD *)buf = 138412546;
                                    v144 = v111;
                                    v145 = 2112;
                                    v146 = (const __CFString *)aSelectorc;
                                    _os_log_debug_impl(&dword_19A6D4000, v64, OS_LOG_TYPE_DEBUG, "Calling -[%@ %@] produced no settings changes. Ignoring this property.", buf, 0x16u);

                                  }
                                }

                              }
                              objc_msgSend(v62, "removeAllSettings");

                              break;
                          }
                        }
                        else
                        {
                          v133 = 0x7FFFFFFFFFFFFFFFLL;
                          v137 = 1;
                        }
                        objc_msgSend(v123, "removeProperty:", v45);
                        if (*((_BYTE *)v135 + 24))
                        {
                          FBLogSceneExtension();
                          v67 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
                          {
                            *(_DWORD *)buf = 138412802;
                            v71 = "modern";
                            if (v118)
                              v71 = "legacy";
                            v144 = v43;
                            v145 = 2080;
                            v146 = (const __CFString *)v71;
                            v147 = 2112;
                            v148[0] = v120;
                            _os_log_debug_impl(&dword_19A6D4000, v67, OS_LOG_TYPE_DEBUG, "Adding %@ as a %s property to %@", buf, 0x20u);
                          }

                          if (v118)
                          {
                            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), v131[3]);
                            v68 = (void *)objc_claimAutoreleasedReturnValue();
                            v141 = CFSTR("#");
                            v142 = v68;
                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v142, &v141, 1);
                            v69 = (void *)objc_claimAutoreleasedReturnValue();
                            v70 = -[NSObject copyAddingCustomAttributes:](v45, "copyAddingCustomAttributes:", v69);

                            v45 = v70;
                          }
                          objc_msgSend(v123, "addProperty:", v45);
                        }
                        _Block_object_dispose(&v130, 8);
                        _Block_object_dispose(&v134, 8);
                        goto LABEL_109;
                      }
                      FBLogSceneExtension();
                      v47 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
                      {
                        *(_DWORD *)buf = 138412290;
                        v144 = v43;
                        _os_log_debug_impl(&dword_19A6D4000, v47, OS_LOG_TYPE_DEBUG, "Skipping %@ since it defines a setter but no getter", buf, 0xCu);
                      }
                    }

                  }
                  else
                  {
                    v48 = v46;
                    FBLogSceneExtension();
                    v45 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
                    {
                      objc_msgSend(v48, "descriptionWithMultilinePrefix:", 0);
                      v49 = (__CFString *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412546;
                      v144 = v43;
                      v145 = 2112;
                      v146 = v49;
                      _os_log_debug_impl(&dword_19A6D4000, v45, OS_LOG_TYPE_DEBUG, "Skipping %@ due to error building property: %@", buf, 0x16u);

                    }
                  }
LABEL_109:

LABEL_110:
                  ++v41;
                }
                while (v41 < outCount);
              }
              objc_msgSend(v123, "properties");
              v81 = (void *)objc_claimAutoreleasedReturnValue();
              v82 = objc_msgSend(v81, "count") == 0;

              if (v82)
              {
                FBLogSceneExtension();
                v86 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v86, OS_LOG_TYPE_DEBUG))
                {
                  NSStringFromClass(v1);
                  v89 = (void *)objc_claimAutoreleasedReturnValue();
                  _ingestPropertiesFromSettingsSubclass_cold_7(v89, (uint64_t)buf, v86);
                }
              }
              else
              {
                FBLogSceneExtension();
                v83 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG))
                {
                  NSStringFromClass(v1);
                  v90 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v123, "properties");
                  v91 = (void *)objc_claimAutoreleasedReturnValue();
                  v92 = objc_msgSend(v91, "count");
                  *(_DWORD *)buf = 138543874;
                  v144 = v120;
                  v145 = 2114;
                  v146 = v90;
                  v147 = 2048;
                  v148[0] = v92;
                  _os_log_debug_impl(&dword_19A6D4000, v83, OS_LOG_TYPE_DEBUG, "Derived protocol <%{public}@> from %{public}@ with %lu properties.", buf, 0x20u);

                }
                v84 = (void *)objc_msgSend(v123, "copy");
                v85 = +[FBSSettingsExtension extensionForBSObjCProtocol:](FBSDerivedSettingsExtension, "extensionForBSObjCProtocol:", v84);

                v124[0] = MEMORY[0x1E0C809B0];
                v124[1] = 3221225472;
                v125 = ___ingestPropertiesFromSettingsSubclass_block_invoke_313;
                v126 = &__block_descriptor_48_e5_v8__0lu32l8u40l8;
                v127 = v17;
                v128 = v85;
                v86 = v124;
                os_unfair_lock_lock(&__ExtensionLock);
                ((void (*))v125)(v86);
                os_unfair_lock_unlock(&__ExtensionLock);
              }

              v87 = v120;
            }
            else
            {
              FBLogSceneExtension();
              v87 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v87, OS_LOG_TYPE_DEBUG))
              {
                NSStringFromClass(v1);
                v88 = (void *)objc_claimAutoreleasedReturnValue();
                _ingestPropertiesFromSettingsSubclass_cold_4(v88, (uint64_t)buf, v87);
              }
              v122 = (uint64_t)v14;
            }

            fbs_free((void **)&v139);
            v14 = v122;
LABEL_153:

            goto LABEL_154;
          }
          v32 = v20 - 1;
          v33 = (void *)MEMORY[0x1E0CB3940];
          -[NSObject substringToIndex:](v14, "substringToIndex:", v20 - 1);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject substringFromIndex:](v14, "substringFromIndex:", v32);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "stringWithFormat:", CFSTR("%@Mutable%@"), v34, v35);
          v30 = objc_claimAutoreleasedReturnValue();

          v18 = NSClassFromString((NSString *)&v30->isa);
          FBLogSceneExtension();
          v36 = objc_claimAutoreleasedReturnValue();
          v37 = os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG);
          if (v18)
          {
            if (v37)
              _ingestPropertiesFromSettingsSubclass_cold_15();
          }
          else if (v37)
          {
            _ingestPropertiesFromSettingsSubclass_cold_16();
          }

          v29 = v1;
        }

        v1 = v29;
        goto LABEL_42;
      }
    }
  }
LABEL_154:

}

void sub_19A7015CC()
{
  uint64_t v0;
  uint64_t v1;

  objc_end_catch();
  _Block_object_dispose(&v1, 8);
  _Block_object_dispose((const void *)(v0 - 232), 8);
  JUMPOUT(0x19A701690);
}

void sub_19A7015DC()
{
  JUMPOUT(0x19A701660);
}

void sub_19A70169C(uint64_t a1, int a2)
{
  if (a2)
    objc_terminate();
  JUMPOUT(0x19A7016A8);
}

uint64_t FBSSubclassHasBeenIngested(void *a1)
{
  void *v2;
  _BOOL8 v3;
  uint64_t result;
  void *v5;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&__SubclassLock);
    objc_getAssociatedObject(a1, (const void *)_FBSIngestedKey);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2 != 0;

    os_unfair_lock_unlock((os_unfair_lock_t)&__SubclassLock);
    return v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("settingsClass != ((void *)0)"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      FBSSubclassHasBeenIngested_cold_1();
    objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
    result = _bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

uint64_t FBSSettingsExtensionIsRealized(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;

  os_unfair_lock_lock(&__ExtensionLock);
  objc_msgSend((id)__SettingsToExtensionsMap, "objectForKey:", a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", a2);
  os_unfair_lock_unlock(&__ExtensionLock);

  return v5;
}

id FBSSettingForLegacySelector(objc_class *a1, const void *a2)
{
  Class Superclass;
  NSMapTable *v4;
  NSMapTable *v5;
  void *v6;
  void *v7;

  Superclass = a1;
  if ((objc_class *)-[objc_class _baseClass](a1, "_baseClass") == a1
    || (Class)-[objc_class _mutableClass](Superclass, "_mutableClass") == Superclass)
  {
    v7 = 0;
  }
  else
  {
    FBSIngestSubclassProperties((uint64_t)Superclass);
    if (-[objc_class isSubclassOfClass:](Superclass, "isSubclassOfClass:", -[objc_class _mutableClass](Superclass, "_mutableClass"))&& -[objc_class _counterpartClass](Superclass, "_counterpartClass"))
    {
      Superclass = (Class)-[objc_class _counterpartClass](Superclass, "_counterpartClass");
    }
    os_unfair_lock_lock(&__ExtensionLock);
    if (__SelectorsToSettingsMap)
    {
      while (Superclass != (Class)objc_opt_class())
      {
        NSMapGet((NSMapTable *)__SelectorsToSettingsMap, Superclass);
        v4 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
        v5 = v4;
        if (v4)
        {
          v6 = NSMapGet(v4, a2);
          if (v6)
          {
            v7 = v6;

            goto LABEL_13;
          }
        }
        Superclass = class_getSuperclass(Superclass);

      }
    }
    v7 = 0;
LABEL_13:
    os_unfair_lock_unlock(&__ExtensionLock);
  }
  return v7;
}

NSMapTable *FBSSettingForLegacySetting(void *a1, const void *a2)
{
  NSMapTable *v4;
  NSMapTable *v5;
  NSMapTable *v6;
  void *v8;

  if (a2 == (const void *)0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("legacySetting != NSNotFound"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      FBSSettingForLegacySetting_cold_1();
LABEL_13:
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A701A4CLL);
  }
  if (!a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("settingsClass != ((void *)0)"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      FBSSettingForLegacySetting_cold_2();
    goto LABEL_13;
  }
  os_unfair_lock_lock(&__ExtensionLock);
  if (__LegacySettingsToSettingsMap)
  {
    v4 = NSMapGet((NSMapTable *)__LegacySettingsToSettingsMap, (const void *)objc_msgSend(a1, "_baseClass"));
    v5 = v4;
    if (v4)
      v4 = (NSMapTable *)NSMapGet(v4, a2);
  }
  else
  {
    v5 = 0;
    v4 = 0;
  }
  v6 = v4;
  os_unfair_lock_unlock(&__ExtensionLock);

  return v6;
}

id FBSAllSettings(void *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSMapTable *v10;
  NSMapTable *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&__ExtensionLock);
  if (__SelectorsToSettingsMap)
  {
    v3 = objc_msgSend(a1, "_baseClass");
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    NSAllMapTableKeys((NSMapTable *)__SelectorsToSettingsMap);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          if (objc_msgSend(v9, "isSubclassOfClass:", v3, (_QWORD)v14))
          {
            NSMapGet((NSMapTable *)__SelectorsToSettingsMap, v9);
            v10 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
            v11 = v10;
            if (v10)
            {
              NSAllMapTableValues(v10);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v12 = 0;
            }
            objc_msgSend(v2, "addObjectsFromArray:", v12);

          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v6);
    }

  }
  os_unfair_lock_unlock(&__ExtensionLock);
  return v2;
}

id FBSAllSettingsFromProtocol(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E38E9E50, "protocolForProtocol:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _gatherProperties(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "getter");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        FBSSettingForSelector(a1, (const void *)objc_msgSend(v11, "selector"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
          objc_msgSend(v4, "addObject:", v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v4;
}

id FBSSettingNameForSelector(void *a1, const void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (a1)
  {
    v3 = (void *)objc_msgSend(a1, "_baseClass");
LABEL_3:
    FBSSettingForExtensionSelector(v3, a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBSSetting name]((uint64_t)v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
  v6 = (void *)objc_opt_class();
  FBSSettingForExtensionSelector(v6, a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSSetting name]((uint64_t)v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v8 = (void *)objc_opt_class();
    FBSSettingForExtensionSelector(v8, a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBSSetting name]((uint64_t)v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v3 = (void *)objc_opt_class();
      goto LABEL_3;
    }
  }
  return v5;
}

uint64_t _structDisposition(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v1 = a1;
  if (objc_msgSend(v1, "isStruct"))
  {
    objc_msgSend(v1, "structFlattenedMembers");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v2, "count") < 2 || objc_msgSend(v3, "count") != 1)
    {
      v6 = 4;
LABEL_20:

      goto LABEL_21;
    }
    objc_msgSend(v3, "anyObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "size") == 8)
    {
      v5 = objc_msgSend(v4, "type");
      if (objc_msgSend(v2, "count") != 2)
      {
        v7 = objc_msgSend(v2, "count");
        if (v5 == 100 && v7 == 4)
          v6 = 3;
        else
          v6 = 4;
        goto LABEL_19;
      }
      v6 = 1;
      if (v5 == 81 || v5 == 113)
      {
LABEL_19:

        goto LABEL_20;
      }
      if (v5 == 100)
      {
        v6 = 2;
        goto LABEL_19;
      }
    }
    v6 = 4;
    goto LABEL_19;
  }
  v6 = 0;
LABEL_21:

  return v6;
}

uint64_t ___realizeSettingsExtension_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v5[2];

  v5[0] = 0;
  v5[1] = 0;
  objc_msgSend(a2, "valueForSetting:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getValue:size:", v5, *(_QWORD *)(a1 + 40));

  return v5[0];
}

double ___realizeSettingsExtension_block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v5[2];

  v5[0] = 0;
  v5[1] = 0;
  objc_msgSend(a2, "valueForSetting:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getValue:size:", v5, *(_QWORD *)(a1 + 40));

  return *(double *)v5;
}

double ___realizeSettingsExtension_block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  _OWORD v5[2];

  memset(v5, 0, sizeof(v5));
  objc_msgSend(a2, "valueForSetting:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getValue:size:", v5, *(_QWORD *)(a1 + 40));

  return *(double *)v5;
}

uint64_t ___realizeSettingsExtension_block_invoke_204(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "valueForSetting:", *(_QWORD *)(a1 + 32));
}

double ___realizeSettingsExtension_block_invoke_2_206(uint64_t a1, void *a2)
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(a2, "valueForSetting:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

uint64_t ___realizeSettingsExtension_block_invoke_3_208(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  objc_msgSend(a2, "valueForSetting:", *(_QWORD *)(a1 + 32));
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = objc_msgSend(v2, "UTF8String");

  return v3;
}

uint64_t ___realizeSettingsExtension_block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "valueForSetting:", *(_QWORD *)(a1 + 32));
}

SEL ___realizeSettingsExtension_block_invoke_5(uint64_t a1, void *a2)
{
  NSString *v2;
  NSString *v3;
  SEL v4;

  objc_msgSend(a2, "valueForSetting:", *(_QWORD *)(a1 + 32));
  v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = NSSelectorFromString(v2);
  else
    v4 = 0;

  return v4;
}

uint64_t ___realizeSettingsExtension_block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "valueForSetting:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedLongLongValue");

  return v3;
}

void _addMethod(objc_class *a1, objc_class *a2, SEL name, IMP imp, char *types, int a6)
{
  void (*v10)(void);
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  NSObject *v16;
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
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (!a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), imp, types, CFSTR("cls"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      _addMethod_cold_1();
    objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    goto LABEL_37;
  }
  if (!a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), imp, types, CFSTR("ext"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      _addMethod_cold_2();
    objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A702460);
  }
  if (!name)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), imp, types, CFSTR("sel"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      _addMethod_cold_3();
    objc_msgSend(objc_retainAutorelease(v19), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7024BCLL);
  }
  if (!imp)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), 0, types, CFSTR("imp"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      _addMethod_cold_4();
    objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A702518);
  }
  if (!types)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("type"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      _addMethod_cold_5();
    objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A702574);
  }
  if (!a6)
  {
    v15 = class_addMethod(a1, name, imp, types);
    FBLogSceneExtension();
    v16 = objc_claimAutoreleasedReturnValue();
    v11 = v16;
    if (v15)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(name);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromClass(a2);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromClass(a1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v31 = v12;
        v32 = 2112;
        v33 = v13;
        v34 = 2112;
        v35 = v14;
        _os_log_debug_impl(&dword_19A6D4000, v11, OS_LOG_TYPE_DEBUG, "registered method \"%@\" from extension %@ on class \"%@\"", buf, 0x20u);
        goto LABEL_16;
      }
LABEL_13:

      return;
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(name);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromClass(a2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromClass(a1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v31 = v22;
      v32 = 2112;
      v33 = v23;
      v34 = 2112;
      v35 = v24;
      _os_log_error_impl(&dword_19A6D4000, v11, OS_LOG_TYPE_ERROR, "unable to register method \"%@\" from extension %@ on class \"%@\"", buf, 0x20u);

    }
    v25 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromSelector(name);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass(a2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass(a1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stringWithFormat:", CFSTR("unable to register method \"%@\" from extension %@ on class \"%@\""), v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      _addMethod_cold_6();
    objc_msgSend(objc_retainAutorelease(v29), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
LABEL_37:
    JUMPOUT(0x19A702404);
  }
  v10 = class_replaceMethod(a1, name, imp, types);
  if (v10 && v10 != imp)
  {
    FBLogSceneExtension();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(name);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromClass(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromClass(a1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v31 = v12;
      v32 = 2114;
      v33 = v13;
      v34 = 2114;
      v35 = v14;
      _os_log_error_impl(&dword_19A6D4000, v11, OS_LOG_TYPE_ERROR, "replaced @selector(%{public}@) from extension %{public}@ that was already implemented on %{public}@.", buf, 0x20u);
LABEL_16:

      goto LABEL_13;
    }
    goto LABEL_13;
  }
}

void _addBulkMethod(uint64_t a1, const char *a2, void (*a3)(void), char *a4)
{
  uint64_t v8;
  int v9;
  _QWORD *v10;

  if ((objc_msgSend(*(id *)(a1 + 8), "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
  {
    _addMethod(*(objc_class **)a1, *(objc_class **)(a1 + 8), a2, a3, a4, 0);
  }
  else
  {
    v8 = *(int *)(a1 + 24);
    v9 = v8 + 1;
    *(_DWORD *)(a1 + 24) = v8 + 1;
    v10 = (_QWORD *)(a1 + 8 * v8);
    v10[4] = a2;
    v10[132] = a3;
    v10[260] = a4;
    if (v9 == 128)
      _flushBulkMethods(a1);
  }
}

void ___realizeSettingsExtension_block_invoke_219(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  v10 = a3;
  v11 = a4;
  v6 = (void *)MEMORY[0x1E0CB3B18];
  v7 = objc_retainAutorelease(*(id *)(a1 + 32));
  v8 = a2;
  objc_msgSend(v6, "valueWithBytes:objCType:", &v10, objc_msgSend(v7, "UTF8String", v10, v11));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSSettings _setValue:forSetting:]((uint64_t)v8, v9, *(void **)(a1 + 40));

}

void ___realizeSettingsExtension_block_invoke_2_222(uint64_t a1, void *a2, double a3, double a4)
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  double v10;
  double v11;

  v10 = a3;
  v11 = a4;
  v6 = (void *)MEMORY[0x1E0CB3B18];
  v7 = objc_retainAutorelease(*(id *)(a1 + 32));
  v8 = a2;
  objc_msgSend(v6, "valueWithBytes:objCType:", &v10, objc_msgSend(v7, "UTF8String", *(_QWORD *)&v10, *(_QWORD *)&v11));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSSettings _setValue:forSetting:]((uint64_t)v8, v9, *(void **)(a1 + 40));

}

void ___realizeSettingsExtension_block_invoke_3_224(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v8 = (void *)MEMORY[0x1E0CB3B18];
  v9 = objc_retainAutorelease(*(id *)(a1 + 32));
  v10 = a2;
  objc_msgSend(v8, "valueWithBytes:objCType:", &v12, objc_msgSend(v9, "UTF8String", *(_QWORD *)&v12, *(_QWORD *)&v13, *(_QWORD *)&v14, *(_QWORD *)&v15));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSSettings _setValue:forSetting:]((uint64_t)v10, v11, *(void **)(a1 + 40));

}

void ___realizeSettingsExtension_block_invoke_226(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  void *v19;

  v5 = a2;
  v6 = a3;
  if (!v6)
    goto LABEL_21;
  if (!*(_QWORD *)(a1 + 48) || (objc_opt_isKindOfClass() & 1) != 0)
  {
    if (-[FBSSetting specialCollection](*(os_unfair_lock_s **)(a1 + 32)) == (os_unfair_lock_s *)0x7FFFFFFFFFFFFFFFLL
      && objc_msgSend(v6, "count"))
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v6, "firstObject");
      else
        objc_msgSend(v6, "anyObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_respondsToSelector();
      v8 = BSSettingFlagForBool();
      -[FBSSetting setSpecialCollection:](*(_QWORD *)(a1 + 32), v8);
      FBLogSceneExtension();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        ___realizeSettingsExtension_block_invoke_226_cold_1(a1, v8, v9);

    }
    if (BSSettingFlagIsYes())
    {
      v10 = objc_alloc((Class)off_1E38E9EB0);
      objc_msgSend(v6, "objectEnumerator");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "allObjects");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v10, "initWithArray:", v12);

      v6 = v11;
    }
    else
    {
      if (*(_BYTE *)(a1 + 56))
      {
        v14 = objc_msgSend(v6, "copy");
      }
      else
      {
        if (!*(_BYTE *)(a1 + 57))
        {
LABEL_21:
          -[FBSSettings _setValue:forSetting:]((uint64_t)v5, v6, *(void **)(a1 + 32));

          return;
        }
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithWeakObject:", v6);
        v14 = objc_claimAutoreleasedReturnValue();
      }
      v13 = v14;
    }

    v6 = (id)v13;
    goto LABEL_21;
  }
  v15 = (void *)MEMORY[0x1E0CB3940];
  v16 = (objc_class *)objc_opt_class();
  NSStringFromClass(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass(*(Class *)(a1 + 48));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("value of class %@ is not of expected class %@"), v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    ___realizeSettingsExtension_block_invoke_226_cold_2();
  objc_msgSend(objc_retainAutorelease(v19), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

void ___realizeSettingsExtension_block_invoke_238(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a2;
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a3);
    a3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[FBSSettings _setValue:forSetting:]((uint64_t)v5, a3, *(void **)(a1 + 32));

}

void ___realizeSettingsExtension_block_invoke_2_240(uint64_t a1, void *a2, double a3)
{
  void *v5;
  id v6;

  v6 = a2;
  if ((-[FBSSetting isNullPreserving](*(_BYTE **)(a1 + 32)) & 1) != 0 || (BSFloatIsZero() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  -[FBSSettings _setValue:forSetting:]((uint64_t)v6, v5, *(void **)(a1 + 32));

}

void ___realizeSettingsExtension_block_invoke_3_242(uint64_t a1, void *a2, objc_class *a3)
{
  id v5;

  v5 = a2;
  if (a3)
  {
    NSStringFromClass(a3);
    a3 = (objc_class *)objc_claimAutoreleasedReturnValue();
  }
  -[FBSSettings _setValue:forSetting:]((uint64_t)v5, a3, *(void **)(a1 + 32));

}

void ___realizeSettingsExtension_block_invoke_4_244(uint64_t a1, void *a2, char *a3)
{
  id v5;

  v5 = a2;
  if (a3)
  {
    NSStringFromSelector(a3);
    a3 = (char *)objc_claimAutoreleasedReturnValue();
  }
  -[FBSSettings _setValue:forSetting:]((uint64_t)v5, a3, *(void **)(a1 + 32));

}

void ___realizeSettingsExtension_block_invoke_5_246(uint64_t a1, void *a2, int a3)
{
  _BYTE *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  id v9;

  v5 = *(_BYTE **)(a1 + 32);
  v9 = a2;
  v6 = -[FBSSetting isNullPreserving](v5);
  v7 = (void *)*MEMORY[0x1E0C9AE40];
  if (!v6)
    v7 = 0;
  if (a3)
    v8 = (void *)*MEMORY[0x1E0C9AE50];
  else
    v8 = v7;
  -[FBSSettings _setValue:forSetting:]((uint64_t)v9, v8, *(void **)(a1 + 32));

}

void ___realizeSettingsExtension_block_invoke_6_248(uint64_t a1, void *a2, uint64_t a3)
{
  unsigned int v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = -[FBSSetting isNullPreserving](*(_BYTE **)(a1 + 32));
  if (a3 || v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  -[FBSSettings _setValue:forSetting:]((uint64_t)v7, v6, *(void **)(a1 + 32));

}

uint64_t ___ingestPropertiesFromSettingsSubclass_block_invoke(uint64_t result, uint64_t a2, _BYTE *a3)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
  *a3 = 1;
  return result;
}

void ___ingestPropertiesFromSettingsSubclass_block_invoke_313()
{
  _realizeSettingsExtension();
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x26u);
}

uint64_t OUTLINED_FUNCTION_2_0(uint64_t result, float a2, uint64_t a3, uint64_t a4)
{
  *(float *)a4 = a2;
  *(_QWORD *)(a4 + 4) = result;
  *(_WORD *)(a4 + 12) = 2114;
  return result;
}

void OUTLINED_FUNCTION_5(uint64_t a1@<X1>, uint64_t a2@<X2>, __int16 a3@<W8>)
{
  int v3;

  *(_DWORD *)(a2 + 24) = v3;
  *(_WORD *)(a2 + 28) = a3;
  *(_QWORD *)(a2 + 30) = a1;
}

void OUTLINED_FUNCTION_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  *(_QWORD *)(a3 + 14) = v3;
  *(_WORD *)(a3 + 22) = 1024;
}

void OUTLINED_FUNCTION_14(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_15(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_22(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

__CFString *NSStringFromFBSApplicationTrustState(unint64_t a1)
{
  if (a1 < 0xB)
    return off_1E38EB2B8[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown (%d)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

void sub_19A7044F4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  fbs_release((const void **)va);
  _Unwind_Resume(a1);
}

void sub_19A704AAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  fbs_release((const void **)va);
  _Unwind_Resume(a1);
}

void sub_19A705EA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_9_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

uint64_t OUTLINED_FUNCTION_11_0()
{
  return objc_opt_class();
}

void sub_19A709A1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A709DAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A70A084(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id FBSLogApplicationLibrary()
{
  if (FBSLogApplicationLibrary_onceToken != -1)
    dispatch_once(&FBSLogApplicationLibrary_onceToken, &__block_literal_global_4);
  return (id)FBSLogApplicationLibrary___logObj;
}

id FBSLogApplicationLibraryObserver()
{
  if (FBSLogApplicationLibraryObserver_onceToken != -1)
    dispatch_once(&FBSLogApplicationLibraryObserver_onceToken, &__block_literal_global_3);
  return (id)FBSLogApplicationLibraryObserver___logObj;
}

id FBSLogApplicationPlaceholder()
{
  if (FBSLogApplicationPlaceholder_onceToken != -1)
    dispatch_once(&FBSLogApplicationPlaceholder_onceToken, &__block_literal_global_5);
  return (id)FBSLogApplicationPlaceholder___logObj;
}

uint64_t UIKitServicesLibraryCore()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = UIKitServicesLibraryCore_frameworkLibrary;
  v6 = UIKitServicesLibraryCore_frameworkLibrary;
  if (!UIKitServicesLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_1E38EB8B0;
    v8 = *(_OWORD *)&off_1E38EB8C0;
    v1 = _sl_dlopen();
    v4[3] = v1;
    UIKitServicesLibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19A70B778(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

objc_class *getUISApplicationStateClass()
{
  Class Class;
  objc_class *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2050000000;
  Class = (Class)getUISApplicationStateClass_softClass;
  v6 = getUISApplicationStateClass_softClass;
  if (!getUISApplicationStateClass_softClass)
  {
    UIKitServicesLibraryCore();
    Class = objc_getClass("UISApplicationState");
    v4[3] = (uint64_t)Class;
    getUISApplicationStateClass_softClass = (uint64_t)Class;
  }
  v1 = Class;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_19A70B80C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__53(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__54(uint64_t a1)
{

}

__CFString *FBSOpenApplicationErrorCodeToString(unint64_t a1)
{
  if (a1 > 0xA)
    return 0;
  else
    return off_1E38EBAB8[a1];
}

__CFString *FBSOpenApplicationServiceErrorCodeToString(unint64_t a1)
{
  if (a1 > 5)
    return 0;
  else
    return off_1E38EBB10[a1];
}

const __CFString *NSStringFromFBSApplicationPlaceholderAction(unint64_t a1)
{
  if (a1 > 8)
    return CFSTR("(unknown)");
  else
    return off_1E38EBCC8[a1];
}

void sub_19A70CD04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  uint64_t v33;

  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 192), 8);
  _Block_object_dispose((const void *)(v33 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_19A70D36C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL FBSInstallTypeIsCloudDemoted(uint64_t a1)
{
  return (unint64_t)(a1 - 7) < 3;
}

uint64_t FBSStringForInstallType(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "NSStringFromLSInstallType:", a1);
}

uint64_t FBSStringForInstallState(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "NSStringFromLSInstallState:", a1);
}

uint64_t FBSStringForInstallPhase(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "NSStringFromLSInstallPhase:", a1);
}

id FBSWorkspaceErrorCreate(void *a1, unint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v11 = a1;
  v12 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromFBSWorkspaceErrorCode(a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    objc_msgSend(v13, "setObject:forKey:", v14, *(_QWORD *)off_1E38E9A78);
  if (v11)
    objc_msgSend(v13, "setObject:forKey:", v11, *MEMORY[0x1E0CB3388]);
  if (v12)
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v12, &a9);
    objc_msgSend(v13, "setObject:forKey:", v15, *MEMORY[0x1E0CB2D68]);

  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("FBSWorkspaceErrorDomain"), a2, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

__CFString *NSStringFromFBSWorkspaceErrorCode(unint64_t a1)
{
  if (a1 < 4)
    return off_1E38EBE90[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown - %ld)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

void sub_19A7116E4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

const __CFString *FBSApplicationTerminationReasonDescription(unint64_t a1)
{
  if (a1 > 9)
    return CFSTR("<unknown termination reason>");
  else
    return off_1E38EBEC8[a1];
}

const __CFString *FBSApplicationTerminationGroupDescription(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("<unknown>");
  if (a1 == 1)
    v1 = CFSTR("all applications");
  if (a1)
    return v1;
  else
    return CFSTR("foreground applications");
}

uint64_t FBSApplicationTerminationReasonIsGraceful(unint64_t a1)
{
  return (a1 < 0xA) & (0x24Au >> a1);
}

const __CFString *NSStringFromFBSOpenApplicationLaunchIntent(unint64_t a1)
{
  if (a1 > 4)
    return CFSTR("(unknown)");
  else
    return off_1E38EC088[a1];
}

__CFString *NSStringFromFBSSceneJetsamMode(uint64_t a1)
{
  __CFString *v1;

  if (!(_DWORD)a1)
    return CFSTR("default");
  if ((_DWORD)a1 == 1)
  {
    v1 = CFSTR("support");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(invalid - %d)"), a1);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

const __CFString *FBSProcessExceptionCodeDescription(uint64_t a1)
{
  const __CFString *v1;
  const __CFString *v2;
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;

  v1 = CFSTR("Force Quit");
  if (a1 != 4227595259)
    v1 = 0;
  if (a1 == 3735943697)
    v2 = CFSTR("User Initiated Quit");
  else
    v2 = v1;
  v3 = CFSTR("Resource Exclusion");
  if (a1 != 3735883980)
    v3 = 0;
  if (a1 == 3221229823)
    v4 = CFSTR("Thermal Pressure");
  else
    v4 = v3;
  if (a1 <= 3735943696)
    v5 = v4;
  else
    v5 = v2;
  v6 = CFSTR("(none)");
  v7 = CFSTR("Watchdog Violation");
  if (a1 != 2343432205)
    v7 = 0;
  if (a1 == 732775916)
    v8 = CFSTR("Security Violation");
  else
    v8 = v7;
  if (a1)
    v6 = v8;
  if (a1 <= 3221229822)
    return v6;
  else
    return v5;
}

void sub_19A71497C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19A714C04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  void *v16;
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_sync_exit(v16);
  _Unwind_Resume(a1);
}

void sub_19A714F4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_19A7150BC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t SecurityLibraryCore()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = SecurityLibraryCore_frameworkLibrary;
  v6 = SecurityLibraryCore_frameworkLibrary;
  if (!SecurityLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_1E38EC210;
    v8 = *(_OWORD *)&off_1E38EC220;
    v1 = _sl_dlopen();
    v4[3] = v1;
    SecurityLibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19A715578(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t SecurityLibrary()
{
  uint64_t result;
  void *v1;

  v1 = 0;
  result = SecurityLibraryCore();
  if (!result)
    SecurityLibrary_cold_1(&v1);
  return result;
}

void *getSecCertificateCreateWithDataSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getSecCertificateCreateWithDataSymbolLoc_ptr;
  v6 = getSecCertificateCreateWithDataSymbolLoc_ptr;
  if (!getSecCertificateCreateWithDataSymbolLoc_ptr)
  {
    v1 = (void *)SecurityLibrary();
    v0 = dlsym(v1, "SecCertificateCreateWithData");
    v4[3] = (uint64_t)v0;
    getSecCertificateCreateWithDataSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19A715658(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t soft_SecCertificateCreateWithData(uint64_t a1, uint64_t a2)
{
  uint64_t (*v4)(uint64_t, uint64_t);

  v4 = (uint64_t (*)(uint64_t, uint64_t))getSecCertificateCreateWithDataSymbolLoc();
  if (!v4)
    soft_SecCertificateCreateWithData_cold_1();
  return v4(a1, a2);
}

void *getSecCertificateCopySubjectSummarySymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getSecCertificateCopySubjectSummarySymbolLoc_ptr;
  v6 = getSecCertificateCopySubjectSummarySymbolLoc_ptr;
  if (!getSecCertificateCopySubjectSummarySymbolLoc_ptr)
  {
    v1 = (void *)SecurityLibrary();
    v0 = dlsym(v1, "SecCertificateCopySubjectSummary");
    v4[3] = (uint64_t)v0;
    getSecCertificateCopySubjectSummarySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19A715720(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t soft_SecCertificateCopySubjectSummary(uint64_t a1)
{
  uint64_t (*SecCertificateCopySubjectSummarySymbolLoc)(uint64_t);

  SecCertificateCopySubjectSummarySymbolLoc = (uint64_t (*)(uint64_t))getSecCertificateCopySubjectSummarySymbolLoc();
  if (!SecCertificateCopySubjectSummarySymbolLoc)
    soft_SecCertificateCopySubjectSummary_cold_1();
  return SecCertificateCopySubjectSummarySymbolLoc(a1);
}

id __displayBuilderError(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;

  if (a2)
  {
    v10 = (void *)MEMORY[0x1E0C99E08];
    v11 = a2;
    objc_msgSend(v10, "dictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v11, &a9);

    objc_msgSend(v12, "setObject:forKey:", v13, *MEMORY[0x1E0CB2D68]);
  }
  else
  {
    v12 = 0;
  }
  v14 = (void *)MEMORY[0x1E0CB35C8];
  v15 = (objc_class *)objc_opt_class();
  NSStringFromClass(v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "errorWithDomain:code:userInfo:", v16, a1, v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

void FBSSetServiceFacilityManager(void *a1)
{
  id v2;
  id v3;

  v2 = a1;
  if ((id)__manager != v2)
  {
    v3 = v2;
    objc_storeStrong((id *)&__manager, a1);
    v2 = v3;
  }

}

id FBSGetServiceFacilityManager()
{
  return (id)__manager;
}

void sub_19A718A74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A718E20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A718FC8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19A7190D8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19A71A310(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_19A71A510(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_19A71A5A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

const __CFString *NSStringFromFBSApplicationLibraryLogStep(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0xD)
    return CFSTR("Uninstall");
  else
    return off_1E38EC3E0[a1 - 1];
}

void FBSApplicationLibraryLogTransactionSetEnabled()
{
  _transactionLogEnabled = 1;
}

uint64_t FBSApplicationLibraryLogTransactionEnabled()
{
  return _transactionLogEnabled;
}

void sub_19A71AF28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_8_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_19A71C9B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_19A71DA78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, id a18)
{
  id *v18;
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a18);
  _Unwind_Resume(a1);
}

void sub_19A71EE68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id FBLogAppLaunch()
{
  if (FBLogAppLaunch_onceToken != -1)
    dispatch_once(&FBLogAppLaunch_onceToken, &__block_literal_global_7);
  return (id)FBLogAppLaunch___logObj;
}

id FBLogSceneExtension()
{
  if (FBLogSceneExtension_onceToken != -1)
    dispatch_once(&FBLogSceneExtension_onceToken, &__block_literal_global_13);
  return (id)FBLogSceneExtension___logObj;
}

void sub_19A72140C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_19A7218F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_9_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

uint64_t OUTLINED_FUNCTION_14_0(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t OUTLINED_FUNCTION_17_0()
{
  return objc_opt_class();
}

const __CFString *FBSProcessSchedulingPolicyDescription(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("(unknown)");
  else
    return off_1E38ECDB8[a1];
}

const __CFString *FBSProcessGraphicsPolicyDescription(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("(unknown)");
  if (a1 == 1)
    v1 = CFSTR("full");
  if (a1)
    return v1;
  else
    return CFSTR("none");
}

const __CFString *FBSProcessJetsamPolicyDescription(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("(unknown)");
  if (a1 == 1)
    v1 = CFSTR("foreground");
  if (a1)
    return v1;
  else
    return CFSTR("default");
}

__CFString *FBSSceneEventSourceDescription(unint64_t a1)
{
  if (a1 > 2)
    return 0;
  else
    return off_1E38ECDF0[a1];
}

uint64_t InstallCoordinationLibraryCore()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = InstallCoordinationLibraryCore_frameworkLibrary;
  v6 = InstallCoordinationLibraryCore_frameworkLibrary;
  if (!InstallCoordinationLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_1E38ECE18;
    v8 = *(_OWORD *)&off_1E38ECE28;
    v1 = _sl_dlopen();
    v4[3] = v1;
    InstallCoordinationLibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19A726050(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t InstallCoordinationLibrary()
{
  uint64_t result;
  void *v1;

  v1 = 0;
  result = InstallCoordinationLibraryCore();
  if (!result)
    InstallCoordinationLibrary_cold_1(&v1);
  return result;
}

id getIXAppInstallCoordinatorClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getIXAppInstallCoordinatorClass_softClass;
  v7 = getIXAppInstallCoordinatorClass_softClass;
  if (!getIXAppInstallCoordinatorClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getIXAppInstallCoordinatorClass_block_invoke;
    v3[3] = &unk_1E38ECE40;
    v3[4] = &v4;
    __getIXAppInstallCoordinatorClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_19A726158(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getIXAppInstallCoordinatorClass_block_invoke(uint64_t a1)
{
  Class result;

  InstallCoordinationLibrary();
  result = objc_getClass("IXAppInstallCoordinator");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getIXAppInstallCoordinatorClass_block_invoke_cold_1();
  getIXAppInstallCoordinatorClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id getIXUninstallOptionsClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getIXUninstallOptionsClass_softClass;
  v7 = getIXUninstallOptionsClass_softClass;
  if (!getIXUninstallOptionsClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getIXUninstallOptionsClass_block_invoke;
    v3[3] = &unk_1E38ECE40;
    v3[4] = &v4;
    __getIXUninstallOptionsClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_19A726264(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getIXUninstallOptionsClass_block_invoke(uint64_t a1)
{
  Class result;

  InstallCoordinationLibrary();
  result = objc_getClass("IXUninstallOptions");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getIXUninstallOptionsClass_block_invoke_cold_1();
  getIXUninstallOptionsClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id getIXApplicationIdentityClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getIXApplicationIdentityClass_softClass;
  v7 = getIXApplicationIdentityClass_softClass;
  if (!getIXApplicationIdentityClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getIXApplicationIdentityClass_block_invoke;
    v3[3] = &unk_1E38ECE40;
    v3[4] = &v4;
    __getIXApplicationIdentityClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_19A726370(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getIXApplicationIdentityClass_block_invoke(uint64_t a1)
{
  Class result;

  InstallCoordinationLibrary();
  result = objc_getClass("IXApplicationIdentity");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getIXApplicationIdentityClass_block_invoke_cold_1();
  getIXApplicationIdentityClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void *getIXStringForUninstallDispositionSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getIXStringForUninstallDispositionSymbolLoc_ptr;
  v6 = getIXStringForUninstallDispositionSymbolLoc_ptr;
  if (!getIXStringForUninstallDispositionSymbolLoc_ptr)
  {
    v1 = (void *)InstallCoordinationLibrary();
    v0 = dlsym(v1, "IXStringForUninstallDisposition");
    v4[3] = (uint64_t)v0;
    getIXStringForUninstallDispositionSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19A726454(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t soft_IXStringForUninstallDisposition(uint64_t a1)
{
  uint64_t (*IXStringForUninstallDispositionSymbolLoc)(uint64_t);

  IXStringForUninstallDispositionSymbolLoc = (uint64_t (*)(uint64_t))getIXStringForUninstallDispositionSymbolLoc();
  if (!IXStringForUninstallDispositionSymbolLoc)
    soft_IXStringForUninstallDisposition_cold_1();
  return IXStringForUninstallDispositionSymbolLoc(a1);
}

uint64_t EmbeddedDataResetLibraryCore()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = EmbeddedDataResetLibraryCore_frameworkLibrary;
  v6 = EmbeddedDataResetLibraryCore_frameworkLibrary;
  if (!EmbeddedDataResetLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_1E38ECE80;
    v8 = *(_OWORD *)&off_1E38ECE90;
    v1 = _sl_dlopen();
    v4[3] = v1;
    EmbeddedDataResetLibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19A7267F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t EmbeddedDataResetLibrary()
{
  uint64_t result;
  void *v1;

  v1 = 0;
  result = EmbeddedDataResetLibraryCore();
  if (!result)
    EmbeddedDataResetLibrary_cold_1(&v1);
  return result;
}

id getDDRResetServiceClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getDDRResetServiceClass_softClass;
  v7 = getDDRResetServiceClass_softClass;
  if (!getDDRResetServiceClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getDDRResetServiceClass_block_invoke;
    v3[3] = &unk_1E38ECE40;
    v3[4] = &v4;
    __getDDRResetServiceClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_19A726900(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getDDRResetServiceClass_block_invoke(uint64_t a1)
{
  Class result;

  EmbeddedDataResetLibrary();
  result = objc_getClass("DDRResetService");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getDDRResetServiceClass_block_invoke_cold_1();
  getDDRResetServiceClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id getDDRResetRequestClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getDDRResetRequestClass_softClass;
  v7 = getDDRResetRequestClass_softClass;
  if (!getDDRResetRequestClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getDDRResetRequestClass_block_invoke;
    v3[3] = &unk_1E38ECE40;
    v3[4] = &v4;
    __getDDRResetRequestClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_19A726A0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getDDRResetRequestClass_block_invoke(uint64_t a1)
{
  Class result;

  EmbeddedDataResetLibrary();
  result = objc_getClass("DDRResetRequest");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getDDRResetRequestClass_block_invoke_cold_1();
  getDDRResetRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id getDDRResetOptionsClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getDDRResetOptionsClass_softClass;
  v7 = getDDRResetOptionsClass_softClass;
  if (!getDDRResetOptionsClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getDDRResetOptionsClass_block_invoke;
    v3[3] = &unk_1E38ECE40;
    v3[4] = &v4;
    __getDDRResetOptionsClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_19A726B18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getDDRResetOptionsClass_block_invoke(uint64_t a1)
{
  Class result;

  EmbeddedDataResetLibrary();
  result = objc_getClass("DDRResetOptions");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getDDRResetOptionsClass_block_invoke_cold_1();
  getDDRResetOptionsClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id FBSSceneSnapshotErrorForCode(uint64_t a1)
{
  void *v2;
  const __CFString *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v2 = 0;
  v3 = CFSTR("invalid parameters");
  switch(a1)
  {
    case 0:
      return v2;
    case 1:
      goto LABEL_6;
    case 2:
      v3 = CFSTR("the request was denied");
      goto LABEL_6;
    case 3:
      v3 = CFSTR("the request was canceled");
      goto LABEL_6;
    case 4:
      v3 = CFSTR("an unrelated condition or state was not satisfied");
      goto LABEL_6;
    default:
      v3 = CFSTR("an unknown error occurred");
LABEL_6:
      v4 = (void *)MEMORY[0x1E0CB35C8];
      v5 = *MEMORY[0x1E0CB2D68];
      v8[0] = *MEMORY[0x1E0CB2D50];
      v8[1] = v5;
      v9[0] = CFSTR("an error occurred during a scene snapshotting operation");
      v9[1] = v3;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("FBSSceneSnapshotErrorDomain"), a1, v6);
      v2 = (void *)objc_claimAutoreleasedReturnValue();

      return v2;
  }
}

id FBSSceneSnapshotActionResponseForErrorCode(uint64_t a1)
{
  void *v1;
  void *v2;

  FBSSceneSnapshotErrorForCode(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E38E9DC0, "responseForError:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id FBSGetDefaultExtensions(void *a1)
{
  id v1;
  Class Class;
  void *v3;

  v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&FBSGetDefaultExtensions___lock);
  Class = object_getClass(v1);
  _lock_getDefaultExtensions(v1, Class);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock((os_unfair_lock_t)&FBSGetDefaultExtensions___lock);
  return v3;
}

id _lock_getDefaultExtensions(void *a1, void *a2)
{
  id v3;
  void *v4;
  Class Superclass;
  uint64_t v6;
  uint64_t v7;
  objc_method *v8;
  IMP Implementation;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id result;
  void *v16;
  Method *v17;
  unsigned int outCount;

  v3 = a1;
  if ((void *)objc_opt_class() == a2)
  {
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  objc_getAssociatedObject(a2, (const void *)_FBSDefaultExtensionsKey);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
LABEL_15:

    return v4;
  }
  Superclass = class_getSuperclass((Class)a2);
  _lock_getDefaultExtensions(v3, Superclass);
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v4 = (void *)v6;
    outCount = 0;
    v17 = class_copyMethodList((Class)a2, &outCount);
    if (outCount)
    {
      v7 = 0;
      while (1)
      {
        v8 = v17[v7];
        if (method_getName(v8) == sel_defaultExtensions)
          break;
        if (++v7 >= (unint64_t)outCount)
          goto LABEL_14;
      }
      Implementation = method_getImplementation(v8);
      v10 = (void *)MEMORY[0x1E0C99E40];
      ((void (*)(id, char *))Implementation)(v3, sel_defaultExtensions);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "orderedSetWithArray:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v12, "count"))
      {
        if ((objc_msgSend(v12, "isSubsetOfOrderedSet:", v4) & 1) == 0)
        {
          v13 = (void *)objc_msgSend(v4, "mutableCopy");
          objc_msgSend(v13, "unionOrderedSet:", v12);
          v14 = objc_msgSend(v13, "copy");

          v4 = (void *)v14;
        }
      }

    }
LABEL_14:
    objc_setAssociatedObject(a2, (const void *)_FBSDefaultExtensionsKey, v4, (void *)1);
    fbs_free((void **)&v17);
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("extensions != nil"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    _lock_getDefaultExtensions_cold_1((uint64_t)v16);
  objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
  result = (id)_bs_set_crash_log_message();
  __break(0);
  return result;
}

void sub_19A727690(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  fbs_free((void **)va);
  _Unwind_Resume(a1);
}

void sub_19A7281C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ManagedConfigurationLibraryCore()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = ManagedConfigurationLibraryCore_frameworkLibrary;
  v6 = ManagedConfigurationLibraryCore_frameworkLibrary;
  if (!ManagedConfigurationLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_1E38ECFD8;
    v8 = *(_OWORD *)&off_1E38ECFE8;
    v1 = _sl_dlopen();
    v4[3] = v1;
    ManagedConfigurationLibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19A72872C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t ManagedConfigurationLibrary()
{
  uint64_t result;
  void *v1;

  v1 = 0;
  result = ManagedConfigurationLibraryCore();
  if (!result)
    ManagedConfigurationLibrary_cold_1(&v1);
  return result;
}

id getMCProfileConnectionClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getMCProfileConnectionClass_softClass;
  v7 = getMCProfileConnectionClass_softClass;
  if (!getMCProfileConnectionClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getMCProfileConnectionClass_block_invoke;
    v3[3] = &unk_1E38ECE40;
    v3[4] = &v4;
    __getMCProfileConnectionClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_19A728834(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getMCProfileConnectionClass_block_invoke(uint64_t a1)
{
  Class result;

  ManagedConfigurationLibrary();
  result = objc_getClass("MCProfileConnection");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getMCProfileConnectionClass_block_invoke_cold_1();
  getMCProfileConnectionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void *getMCManagedAppsChangedNotificationSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getMCManagedAppsChangedNotificationSymbolLoc_ptr;
  v6 = getMCManagedAppsChangedNotificationSymbolLoc_ptr;
  if (!getMCManagedAppsChangedNotificationSymbolLoc_ptr)
  {
    v1 = (void *)ManagedConfigurationLibrary();
    v0 = dlsym(v1, "MCManagedAppsChangedNotification");
    v4[3] = (uint64_t)v0;
    getMCManagedAppsChangedNotificationSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19A728918(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getMCManagedAppsChangedNotification()
{
  id *MCManagedAppsChangedNotificationSymbolLoc;

  MCManagedAppsChangedNotificationSymbolLoc = (id *)getMCManagedAppsChangedNotificationSymbolLoc();
  if (!MCManagedAppsChangedNotificationSymbolLoc)
    getMCManagedAppsChangedNotification_cold_1();
  return *MCManagedAppsChangedNotificationSymbolLoc;
}

uint64_t _handleProfilesChangedNotification(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_reloadProfiles");
}

void sub_19A7292E8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  fbs_release((const void **)va);
  _Unwind_Resume(a1);
}

const __CFString *NSStringFromFBSApplicationPlaceholderProgressState(unint64_t a1)
{
  if (a1 > 6)
    return CFSTR("(unknown)");
  else
    return (const __CFString *)*((_QWORD *)&off_1E38ED048 + a1);
}

void fbs_free(void **a1)
{
  free(*a1);
}

void fbs_release(const void **a1)
{
  const void *v1;

  v1 = *a1;
  if (v1)
    CFRelease(v1);
}

__CFString *FBSApplicationLibraryErrorCodeDescription(unint64_t a1)
{
  if (a1 > 5)
    return 0;
  else
    return off_1E38ED3A8[a1];
}

void sub_19A72B644(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19A72CA98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44)
{
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose(&a38, 8);
  _Block_object_dispose(&a44, 8);
  _Unwind_Resume(a1);
}

uint64_t _proxyPassesInclusionFilter(void *a1, void *a2, void *a3)
{
  id v5;
  uint64_t (**v6)(id, id);
  id v7;
  uint64_t v8;
  void *v9;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  if (v6 && (v6[2](v6, v5) & 1) == 0)
  {
    objc_msgSend(v5, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "containsObject:", v9);

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

uint64_t _proxyPassesIdentityFilter(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t (**v9)(id, id, id);
  id v10;
  uint64_t v11;
  void *v12;

  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = a4;
  if (v9 && (v9[2](v9, v7, v8) & 1) == 0)
  {
    objc_msgSend(v8, "bundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "containsObject:", v12);

  }
  else
  {
    v11 = 1;
  }

  return v11;
}

void sub_19A732034(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a35, 8);
  _Unwind_Resume(a1);
}

void _addResultToArrayCreatingArrayIfNecessary(id *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;

  v3 = a2;
  v4 = v3;
  if (a1 && v3)
  {
    v5 = *a1;
    v6 = v4;
    if (!*a1)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      *a1 = v5;
    }
    objc_msgSend(v5, "addObject:", v6);
    v4 = v6;
  }

}

void sub_19A732EFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose(&a43, 8);
  _Block_object_dispose(&a57, 8);
  _Unwind_Resume(a1);
}

void sub_19A733884(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a41, 8);
  _Unwind_Resume(a1);
}

void sub_19A733DE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
  uint64_t v38;

  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose(&a38, 8);
  _Block_object_dispose((const void *)(v38 - 200), 8);
  _Block_object_dispose((const void *)(v38 - 152), 8);
  _Unwind_Resume(a1);
}

__CFString *NSStringFromFBSSceneLayerAlignment(uint64_t a1)
{
  __CFString *v1;

  if (!a1)
    return CFSTR("scene");
  if (a1 == 1)
  {
    v1 = CFSTR("display");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%li)"), a1);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

__CFString *FBSDisplayOverscanCompensationDescription(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) < 4)
    return off_1E38ED460[a1 + 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%li)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

id FBSDisplayOverscanCompensationToCADisplayOverscanAdjustment(uint64_t a1)
{
  void *v1;

  if (a1 == 2)
  {
    getkCADisplayInsetBounds();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a1 == 1)
  {
    getkCADisplayScaleContent();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a1)
  {
    v1 = 0;
  }
  else
  {
    getkCADisplayNone();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

id FBSDisplayGamutToCADisplayGamut(uint64_t a1)
{
  void *v1;

  if (a1 == 1)
  {
    getkCADisplayModeGamutP3();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a1)
  {
    v1 = 0;
  }
  else
  {
    getkCADisplayModeGamutSRGB();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

id FBSDisplayHDRModeToCADisplayHDRMode(uint64_t a1)
{
  void *v1;

  if (a1 == 2)
  {
    getkCADisplayModeDolby();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a1 == 1)
  {
    getkCADisplayModeHDR10();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a1)
  {
    v1 = 0;
  }
  else
  {
    getkCADisplayModeSDR();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

__CFString *FBSDisplayRotationDescription(unint64_t a1)
{
  if (a1 < 4)
    return off_1E38ED4B8[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%li)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

double FBSDisplayRotationRadians(uint64_t a1)
{
  double result;

  result = 0.0;
  if ((unint64_t)(a1 - 1) <= 2)
    return dbl_19A767FE0[a1 - 1];
  return result;
}

uint64_t FBSDisplayRotationFromRadians()
{
  if ((BSFloatEqualToFloat() & 1) != 0)
    return 1;
  if ((BSFloatEqualToFloat() & 1) != 0)
    return 2;
  if (BSFloatEqualToFloat())
    return 3;
  return 0;
}

id FBSDisplayRotationToCADisplayRotation(uint64_t a1)
{
  void *v1;

  switch(a1)
  {
    case 1:
      getkCADisplayOrientationRotation90();
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      getkCADisplayOrientationRotation180();
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      getkCADisplayOrientationRotation270();
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      getkCADisplayOrientationRotation0();
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v1;
}

__CFString *FBSDisplayConnectionTypeDescription(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) < 5)
    return off_1E38ED4D8[a1 + 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%li)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

void sub_19A736D90(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

__CFString *NSStringFromDiagnosticReportType(unint64_t a1)
{
  if (a1 > 2)
    return 0;
  else
    return off_1E38ED500[a1];
}

void sub_19A73818C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A73835C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_19A738A00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_19A73AD74(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19A73AF74(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19A73B09C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A73B284(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id OUTLINED_FUNCTION_2_1(id a1)
{
  return a1;
}

void sub_19A73D0EC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19A73D7D4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void FBSSettingsSetValueForSetting(uint64_t a1, void *a2, void *a3)
{
  -[FBSSettings _setValue:forSetting:](a1, a3, a2);
}

void sub_19A741F3C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_10_1()
{
  return objc_opt_class();
}

uint64_t libmisLibraryCore()
{
  uint64_t v0;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = 0;
  v3 = &v2;
  v4 = 0x2020000000;
  v0 = libmisLibraryCore_frameworkLibrary;
  v5 = libmisLibraryCore_frameworkLibrary;
  if (!libmisLibraryCore_frameworkLibrary)
  {
    v6 = xmmword_1E38EDB20;
    v7 = 0;
    v0 = _sl_dlopen();
    v3[3] = v0;
    libmisLibraryCore_frameworkLibrary = v0;
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_19A742BE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t libmisLibrary()
{
  uint64_t result;
  void *v1;

  v1 = 0;
  result = libmisLibraryCore();
  if (!result)
    libmisLibrary_cold_1(&v1);
  return result;
}

void *getMISQueryBlacklistForBundleSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getMISQueryBlacklistForBundleSymbolLoc_ptr;
  v6 = getMISQueryBlacklistForBundleSymbolLoc_ptr;
  if (!getMISQueryBlacklistForBundleSymbolLoc_ptr)
  {
    v1 = (void *)libmisLibrary();
    v0 = dlsym(v1, "MISQueryBlacklistForBundle");
    v4[3] = (uint64_t)v0;
    getMISQueryBlacklistForBundleSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19A742CC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t soft_MISQueryBlacklistForBundle(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t (*MISQueryBlacklistForBundleSymbolLoc)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  MISQueryBlacklistForBundleSymbolLoc = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))getMISQueryBlacklistForBundleSymbolLoc();
  if (!MISQueryBlacklistForBundleSymbolLoc)
    soft_MISQueryBlacklistForBundle_cold_1();
  return MISQueryBlacklistForBundleSymbolLoc(a1, a2, a3, a4, a5, a6, a7);
}

void *getMISQueryBlacklistForCdHashSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getMISQueryBlacklistForCdHashSymbolLoc_ptr;
  v6 = getMISQueryBlacklistForCdHashSymbolLoc_ptr;
  if (!getMISQueryBlacklistForCdHashSymbolLoc_ptr)
  {
    v1 = (void *)libmisLibrary();
    v0 = dlsym(v1, "MISQueryBlacklistForCdHash");
    v4[3] = (uint64_t)v0;
    getMISQueryBlacklistForCdHashSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19A742DC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t soft_MISQueryBlacklistForCdHash(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t (*MISQueryBlacklistForCdHashSymbolLoc)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  MISQueryBlacklistForCdHashSymbolLoc = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))getMISQueryBlacklistForCdHashSymbolLoc();
  if (!MISQueryBlacklistForCdHashSymbolLoc)
    soft_MISQueryBlacklistForCdHash_cold_1();
  return MISQueryBlacklistForCdHashSymbolLoc(a1, a2, a3, a4, a5);
}

void *getMISAppApprovalStateSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getMISAppApprovalStateSymbolLoc_ptr;
  v6 = getMISAppApprovalStateSymbolLoc_ptr;
  if (!getMISAppApprovalStateSymbolLoc_ptr)
  {
    v1 = (void *)libmisLibrary();
    v0 = dlsym(v1, "MISAppApprovalState");
    v4[3] = (uint64_t)v0;
    getMISAppApprovalStateSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19A742EB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t soft_MISAppApprovalState(uint64_t a1, uint64_t a2)
{
  uint64_t (*MISAppApprovalStateSymbolLoc)(uint64_t, uint64_t);

  MISAppApprovalStateSymbolLoc = (uint64_t (*)(uint64_t, uint64_t))getMISAppApprovalStateSymbolLoc();
  if (!MISAppApprovalStateSymbolLoc)
    soft_MISAppApprovalState_cold_1();
  return MISAppApprovalStateSymbolLoc(a1, a2);
}

void *getMISValidateUPPSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getMISValidateUPPSymbolLoc_ptr;
  v6 = getMISValidateUPPSymbolLoc_ptr;
  if (!getMISValidateUPPSymbolLoc_ptr)
  {
    v1 = (void *)libmisLibrary();
    v0 = dlsym(v1, "MISValidateUPP");
    v4[3] = (uint64_t)v0;
    getMISValidateUPPSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19A742F80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void soft_MISValidateUPP(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void (*MISValidateUPPSymbolLoc)(uint64_t, id, id);
  id v7;

  v7 = a2;
  v5 = a3;
  MISValidateUPPSymbolLoc = (void (*)(uint64_t, id, id))getMISValidateUPPSymbolLoc();
  if (!MISValidateUPPSymbolLoc)
    soft_MISValidateUPP_cold_1();
  MISValidateUPPSymbolLoc(a1, v7, v5);

}

void *getMISCopyErrorStringForErrorCodeSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getMISCopyErrorStringForErrorCodeSymbolLoc_ptr;
  v6 = getMISCopyErrorStringForErrorCodeSymbolLoc_ptr;
  if (!getMISCopyErrorStringForErrorCodeSymbolLoc_ptr)
  {
    v1 = (void *)libmisLibrary();
    v0 = dlsym(v1, "MISCopyErrorStringForErrorCode");
    v4[3] = (uint64_t)v0;
    getMISCopyErrorStringForErrorCodeSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19A743070(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t soft_MISCopyErrorStringForErrorCode(uint64_t a1)
{
  uint64_t (*MISCopyErrorStringForErrorCodeSymbolLoc)(uint64_t);

  MISCopyErrorStringForErrorCodeSymbolLoc = (uint64_t (*)(uint64_t))getMISCopyErrorStringForErrorCodeSymbolLoc();
  if (!MISCopyErrorStringForErrorCodeSymbolLoc)
    soft_MISCopyErrorStringForErrorCode_cold_1();
  return MISCopyErrorStringForErrorCodeSymbolLoc(a1);
}

void *getMISValidationCopySignatureVersionSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getMISValidationCopySignatureVersionSymbolLoc_ptr;
  v6 = getMISValidationCopySignatureVersionSymbolLoc_ptr;
  if (!getMISValidationCopySignatureVersionSymbolLoc_ptr)
  {
    v1 = (void *)libmisLibrary();
    v0 = dlsym(v1, "MISValidationCopySignatureVersion");
    v4[3] = (uint64_t)v0;
    getMISValidationCopySignatureVersionSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19A743130(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t soft_MISValidationCopySignatureVersion(uint64_t a1, uint64_t a2)
{
  uint64_t (*MISValidationCopySignatureVersionSymbolLoc)(uint64_t, uint64_t);

  MISValidationCopySignatureVersionSymbolLoc = (uint64_t (*)(uint64_t, uint64_t))getMISValidationCopySignatureVersionSymbolLoc();
  if (!MISValidationCopySignatureVersionSymbolLoc)
    soft_MISValidationCopySignatureVersion_cold_1();
  return MISValidationCopySignatureVersionSymbolLoc(a1, a2);
}

void *getkMISValidationOptionAuthoritativeLaunchSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getkMISValidationOptionAuthoritativeLaunchSymbolLoc_ptr;
  v6 = getkMISValidationOptionAuthoritativeLaunchSymbolLoc_ptr;
  if (!getkMISValidationOptionAuthoritativeLaunchSymbolLoc_ptr)
  {
    v1 = (void *)libmisLibrary();
    v0 = dlsym(v1, "kMISValidationOptionAuthoritativeLaunch");
    v4[3] = (uint64_t)v0;
    getkMISValidationOptionAuthoritativeLaunchSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19A7431F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t getkMISValidationOptionAuthoritativeLaunch()
{
  void *v0;

  v0 = getkMISValidationOptionAuthoritativeLaunchSymbolLoc();
  if (!v0)
    getkMISValidationOptionAuthoritativeLaunch_cold_1();
  return *(_QWORD *)v0;
}

void *getkMISValidationOptionOnlineAuthorizationSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getkMISValidationOptionOnlineAuthorizationSymbolLoc_ptr;
  v6 = getkMISValidationOptionOnlineAuthorizationSymbolLoc_ptr;
  if (!getkMISValidationOptionOnlineAuthorizationSymbolLoc_ptr)
  {
    v1 = (void *)libmisLibrary();
    v0 = dlsym(v1, "kMISValidationOptionOnlineAuthorization");
    v4[3] = (uint64_t)v0;
    getkMISValidationOptionOnlineAuthorizationSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19A7432A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t getkMISValidationOptionOnlineAuthorization()
{
  void *v0;

  v0 = getkMISValidationOptionOnlineAuthorizationSymbolLoc();
  if (!v0)
    getkMISValidationOptionOnlineAuthorization_cold_1();
  return *(_QWORD *)v0;
}

void *getkMISValidationOptionOnlineCheckTypeSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getkMISValidationOptionOnlineCheckTypeSymbolLoc_ptr;
  v6 = getkMISValidationOptionOnlineCheckTypeSymbolLoc_ptr;
  if (!getkMISValidationOptionOnlineCheckTypeSymbolLoc_ptr)
  {
    v1 = (void *)libmisLibrary();
    v0 = dlsym(v1, "kMISValidationOptionOnlineCheckType");
    v4[3] = (uint64_t)v0;
    getkMISValidationOptionOnlineCheckTypeSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19A743358(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t getkMISValidationOptionOnlineCheckType()
{
  void *v0;

  v0 = getkMISValidationOptionOnlineCheckTypeSymbolLoc();
  if (!v0)
    getkMISValidationOptionOnlineCheckType_cold_1();
  return *(_QWORD *)v0;
}

void *getkMISMinSupportedSignatureVersionSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getkMISMinSupportedSignatureVersionSymbolLoc_ptr;
  v6 = getkMISMinSupportedSignatureVersionSymbolLoc_ptr;
  if (!getkMISMinSupportedSignatureVersionSymbolLoc_ptr)
  {
    v1 = (void *)libmisLibrary();
    v0 = dlsym(v1, "kMISMinSupportedSignatureVersion");
    v4[3] = (uint64_t)v0;
    getkMISMinSupportedSignatureVersionSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19A743408(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t getkMISMinSupportedSignatureVersion()
{
  unsigned int *v0;

  v0 = (unsigned int *)getkMISMinSupportedSignatureVersionSymbolLoc();
  if (!v0)
    getkMISMinSupportedSignatureVersion_cold_1();
  return *v0;
}

void *getkMISFutureMinSupportedSignatureVersionSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getkMISFutureMinSupportedSignatureVersionSymbolLoc_ptr;
  v6 = getkMISFutureMinSupportedSignatureVersionSymbolLoc_ptr;
  if (!getkMISFutureMinSupportedSignatureVersionSymbolLoc_ptr)
  {
    v1 = (void *)libmisLibrary();
    v0 = dlsym(v1, "kMISFutureMinSupportedSignatureVersion");
    v4[3] = (uint64_t)v0;
    getkMISFutureMinSupportedSignatureVersionSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19A7434B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t getkMISFutureMinSupportedSignatureVersion()
{
  unsigned int *v0;

  v0 = (unsigned int *)getkMISFutureMinSupportedSignatureVersionSymbolLoc();
  if (!v0)
    getkMISFutureMinSupportedSignatureVersion_cold_1();
  return *v0;
}

void *getkMISValidationOptionHintMainExecutablePathSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getkMISValidationOptionHintMainExecutablePathSymbolLoc_ptr;
  v6 = getkMISValidationOptionHintMainExecutablePathSymbolLoc_ptr;
  if (!getkMISValidationOptionHintMainExecutablePathSymbolLoc_ptr)
  {
    v1 = (void *)libmisLibrary();
    v0 = dlsym(v1, "kMISValidationOptionHintMainExecutablePath");
    v4[3] = (uint64_t)v0;
    getkMISValidationOptionHintMainExecutablePathSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19A743568(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t getkMISValidationOptionHintMainExecutablePath()
{
  void *v0;

  v0 = getkMISValidationOptionHintMainExecutablePathSymbolLoc();
  if (!v0)
    getkMISValidationOptionHintMainExecutablePath_cold_1();
  return *(_QWORD *)v0;
}

void *getMISEnumerateInstalledProvisioningProfilesSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getMISEnumerateInstalledProvisioningProfilesSymbolLoc_ptr;
  v6 = getMISEnumerateInstalledProvisioningProfilesSymbolLoc_ptr;
  if (!getMISEnumerateInstalledProvisioningProfilesSymbolLoc_ptr)
  {
    v1 = (void *)libmisLibrary();
    v0 = dlsym(v1, "MISEnumerateInstalledProvisioningProfiles");
    v4[3] = (uint64_t)v0;
    getMISEnumerateInstalledProvisioningProfilesSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19A743618(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t soft_MISEnumerateInstalledProvisioningProfiles(uint64_t a1, void *a2)
{
  id v3;
  uint64_t (*MISEnumerateInstalledProvisioningProfilesSymbolLoc)(uint64_t, id);
  uint64_t v5;

  v3 = a2;
  MISEnumerateInstalledProvisioningProfilesSymbolLoc = (uint64_t (*)(uint64_t, id))getMISEnumerateInstalledProvisioningProfilesSymbolLoc();
  if (!MISEnumerateInstalledProvisioningProfilesSymbolLoc)
    soft_MISEnumerateInstalledProvisioningProfiles_cold_1();
  v5 = MISEnumerateInstalledProvisioningProfilesSymbolLoc(a1, v3);

  return v5;
}

void *getMISProvisioningProfileGetDeveloperCertificatesSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getMISProvisioningProfileGetDeveloperCertificatesSymbolLoc_ptr;
  v6 = getMISProvisioningProfileGetDeveloperCertificatesSymbolLoc_ptr;
  if (!getMISProvisioningProfileGetDeveloperCertificatesSymbolLoc_ptr)
  {
    v1 = (void *)libmisLibrary();
    v0 = dlsym(v1, "MISProvisioningProfileGetDeveloperCertificates");
    v4[3] = (uint64_t)v0;
    getMISProvisioningProfileGetDeveloperCertificatesSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19A7436F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t soft_MISProvisioningProfileGetDeveloperCertificates(uint64_t a1)
{
  uint64_t (*DeveloperCertificatesSymbolLoc)(uint64_t);

  DeveloperCertificatesSymbolLoc = (uint64_t (*)(uint64_t))getMISProvisioningProfileGetDeveloperCertificatesSymbolLoc();
  if (!DeveloperCertificatesSymbolLoc)
    soft_MISProvisioningProfileGetDeveloperCertificates_cold_1();
  return DeveloperCertificatesSymbolLoc(a1);
}

void *getMISProfileGetValueSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getMISProfileGetValueSymbolLoc_ptr;
  v6 = getMISProfileGetValueSymbolLoc_ptr;
  if (!getMISProfileGetValueSymbolLoc_ptr)
  {
    v1 = (void *)libmisLibrary();
    v0 = dlsym(v1, "MISProfileGetValue");
    v4[3] = (uint64_t)v0;
    getMISProfileGetValueSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19A7437B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t soft_MISProfileGetValue(uint64_t a1, uint64_t a2)
{
  uint64_t (*ValueSymbolLoc)(uint64_t, uint64_t);

  ValueSymbolLoc = (uint64_t (*)(uint64_t, uint64_t))getMISProfileGetValueSymbolLoc();
  if (!ValueSymbolLoc)
    soft_MISProfileGetValue_cold_1();
  return ValueSymbolLoc(a1, a2);
}

void *getMISProvisioningProfileGetEntitlementsSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getMISProvisioningProfileGetEntitlementsSymbolLoc_ptr;
  v6 = getMISProvisioningProfileGetEntitlementsSymbolLoc_ptr;
  if (!getMISProvisioningProfileGetEntitlementsSymbolLoc_ptr)
  {
    v1 = (void *)libmisLibrary();
    v0 = dlsym(v1, "MISProvisioningProfileGetEntitlements");
    v4[3] = (uint64_t)v0;
    getMISProvisioningProfileGetEntitlementsSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19A74387C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t soft_MISProvisioningProfileGetEntitlements(uint64_t a1)
{
  uint64_t (*EntitlementsSymbolLoc)(uint64_t);

  EntitlementsSymbolLoc = (uint64_t (*)(uint64_t))getMISProvisioningProfileGetEntitlementsSymbolLoc();
  if (!EntitlementsSymbolLoc)
    soft_MISProvisioningProfileGetEntitlements_cold_1();
  return EntitlementsSymbolLoc(a1);
}

void *getMISProvisioningProfileGetExpirationDateSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getMISProvisioningProfileGetExpirationDateSymbolLoc_ptr;
  v6 = getMISProvisioningProfileGetExpirationDateSymbolLoc_ptr;
  if (!getMISProvisioningProfileGetExpirationDateSymbolLoc_ptr)
  {
    v1 = (void *)libmisLibrary();
    v0 = dlsym(v1, "MISProvisioningProfileGetExpirationDate");
    v4[3] = (uint64_t)v0;
    getMISProvisioningProfileGetExpirationDateSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19A74393C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t soft_MISProvisioningProfileGetExpirationDate(uint64_t a1)
{
  uint64_t (*ExpirationDateSymbolLoc)(uint64_t);

  ExpirationDateSymbolLoc = (uint64_t (*)(uint64_t))getMISProvisioningProfileGetExpirationDateSymbolLoc();
  if (!ExpirationDateSymbolLoc)
    soft_MISProvisioningProfileGetExpirationDate_cold_1();
  return ExpirationDateSymbolLoc(a1);
}

void *getMISProvisioningProfileGetUUIDSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getMISProvisioningProfileGetUUIDSymbolLoc_ptr;
  v6 = getMISProvisioningProfileGetUUIDSymbolLoc_ptr;
  if (!getMISProvisioningProfileGetUUIDSymbolLoc_ptr)
  {
    v1 = (void *)libmisLibrary();
    v0 = dlsym(v1, "MISProvisioningProfileGetUUID");
    v4[3] = (uint64_t)v0;
    getMISProvisioningProfileGetUUIDSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19A7439FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t soft_MISProvisioningProfileGetUUID(uint64_t a1)
{
  uint64_t (*UUIDSymbolLoc)(uint64_t);

  UUIDSymbolLoc = (uint64_t (*)(uint64_t))getMISProvisioningProfileGetUUIDSymbolLoc();
  if (!UUIDSymbolLoc)
    soft_MISProvisioningProfileGetUUID_cold_1();
  return UUIDSymbolLoc(a1);
}

void *getMISProvisioningProfileGrantsEntitlementSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getMISProvisioningProfileGrantsEntitlementSymbolLoc_ptr;
  v6 = getMISProvisioningProfileGrantsEntitlementSymbolLoc_ptr;
  if (!getMISProvisioningProfileGrantsEntitlementSymbolLoc_ptr)
  {
    v1 = (void *)libmisLibrary();
    v0 = dlsym(v1, "MISProvisioningProfileGrantsEntitlement");
    v4[3] = (uint64_t)v0;
    getMISProvisioningProfileGrantsEntitlementSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19A743ABC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t soft_MISProvisioningProfileGrantsEntitlement(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t (*MISProvisioningProfileGrantsEntitlementSymbolLoc)(uint64_t, uint64_t, uint64_t);

  MISProvisioningProfileGrantsEntitlementSymbolLoc = (uint64_t (*)(uint64_t, uint64_t, uint64_t))getMISProvisioningProfileGrantsEntitlementSymbolLoc();
  if (!MISProvisioningProfileGrantsEntitlementSymbolLoc)
    soft_MISProvisioningProfileGrantsEntitlement_cold_1();
  return MISProvisioningProfileGrantsEntitlementSymbolLoc(a1, a2, a3);
}

void *getMISProvisioningProfileIsAppleInternalProfileSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getMISProvisioningProfileIsAppleInternalProfileSymbolLoc_ptr;
  v6 = getMISProvisioningProfileIsAppleInternalProfileSymbolLoc_ptr;
  if (!getMISProvisioningProfileIsAppleInternalProfileSymbolLoc_ptr)
  {
    v1 = (void *)libmisLibrary();
    v0 = dlsym(v1, "MISProvisioningProfileIsAppleInternalProfile");
    v4[3] = (uint64_t)v0;
    getMISProvisioningProfileIsAppleInternalProfileSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19A743B94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t soft_MISProvisioningProfileIsAppleInternalProfile(uint64_t a1)
{
  uint64_t (*MISProvisioningProfileIsAppleInternalProfileSymbolLoc)(uint64_t);

  MISProvisioningProfileIsAppleInternalProfileSymbolLoc = (uint64_t (*)(uint64_t))getMISProvisioningProfileIsAppleInternalProfileSymbolLoc();
  if (!MISProvisioningProfileIsAppleInternalProfileSymbolLoc)
    soft_MISProvisioningProfileIsAppleInternalProfile_cold_1();
  return MISProvisioningProfileIsAppleInternalProfileSymbolLoc(a1);
}

void *getMISProvisioningProfileProvisionsAllDevicesSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getMISProvisioningProfileProvisionsAllDevicesSymbolLoc_ptr;
  v6 = getMISProvisioningProfileProvisionsAllDevicesSymbolLoc_ptr;
  if (!getMISProvisioningProfileProvisionsAllDevicesSymbolLoc_ptr)
  {
    v1 = (void *)libmisLibrary();
    v0 = dlsym(v1, "MISProvisioningProfileProvisionsAllDevices");
    v4[3] = (uint64_t)v0;
    getMISProvisioningProfileProvisionsAllDevicesSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19A743C54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t soft_MISProvisioningProfileProvisionsAllDevices(uint64_t a1)
{
  uint64_t (*MISProvisioningProfileProvisionsAllDevicesSymbolLoc)(uint64_t);

  MISProvisioningProfileProvisionsAllDevicesSymbolLoc = (uint64_t (*)(uint64_t))getMISProvisioningProfileProvisionsAllDevicesSymbolLoc();
  if (!MISProvisioningProfileProvisionsAllDevicesSymbolLoc)
    soft_MISProvisioningProfileProvisionsAllDevices_cold_1();
  return MISProvisioningProfileProvisionsAllDevicesSymbolLoc(a1);
}

id getMISLaunchWarningDatabaseClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getMISLaunchWarningDatabaseClass_softClass;
  v7 = getMISLaunchWarningDatabaseClass_softClass;
  if (!getMISLaunchWarningDatabaseClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getMISLaunchWarningDatabaseClass_block_invoke;
    v3[3] = &unk_1E38ECE40;
    v3[4] = &v4;
    __getMISLaunchWarningDatabaseClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_19A743D3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getMISLaunchWarningDatabaseClass_block_invoke(uint64_t a1)
{
  Class result;

  libmisLibrary();
  result = objc_getClass("MISLaunchWarningDatabase");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getMISLaunchWarningDatabaseClass_block_invoke_cold_1();
  getMISLaunchWarningDatabaseClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

char *OUTLINED_FUNCTION_0_2()
{
  return dlerror();
}

void sub_19A744018(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A744D00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A74554C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

BOOL FBSProcessResourceTypeIsTimeInterval(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 2;
}

uint64_t FBSProcessResourceAllowanceMakeWithValue@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  a3[2] = 0;
  return result;
}

uint64_t FBSProcessResourceAllowanceMakeWithTimeInterval@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>, double a3@<D0>)
{
  unint64_t v3;

  v3 = (unint64_t)(a3 * 1000.0);
  if (a3 <= 0.0)
    v3 = 0;
  *a2 = result;
  a2[1] = v3;
  a2[2] = 0;
  return result;
}

void FBSProcessResourceAllowanceMakeWithScheduledTimeInterval(_QWORD *a1@<X8>, double a2@<D0>)
{
  unint64_t v2;

  v2 = (unint64_t)(a2 * 1000.0);
  if (a2 <= 0.0)
    v2 = 0;
  *a1 = 2;
  a1[1] = v2;
  a1[2] = 0;
}

int8x16_t FBSProcessResourceAllowanceMakeWithScheduledTimeIntervalAndRefreshInterval@<Q0>(uint64_t a1@<X8>, float64x2_t a2@<Q0>, float64_t a3@<D1>)
{
  int8x16_t result;

  a2.f64[1] = a3;
  *(_QWORD *)a1 = 2;
  result = vandq_s8((int8x16_t)vcvtq_u64_f64(vmulq_f64(a2, (float64x2_t)vdupq_n_s64(0x408F400000000000uLL))), (int8x16_t)vcgtzq_f64(a2));
  *(int8x16_t *)(a1 + 8) = result;
  return result;
}

double FBSProcessResourceAllowanceScale@<D0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>, double a3@<D0>)
{
  double result;

  result = (double)(unint64_t)a1[1] * a3;
  *a2 = *a1;
  a2[1] = (unint64_t)result;
  a2[2] = a1[2];
  return result;
}

double FBSProcessResourceAllowanceExtend@<D0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>, double a3@<D0>)
{
  double result;

  result = (double)(unint64_t)a1[1] + a3;
  *a2 = *a1;
  a2[1] = (unint64_t)result;
  a2[2] = a1[2];
  return result;
}

uint64_t FBSProcessResourceAllowanceGetType(uint64_t result)
{
  if (result)
    return *(_QWORD *)result;
  return result;
}

uint64_t FBSProcessResourceAllowanceValue(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 8);
  return result;
}

id NSStringFromProcessResourceValue(uint64_t a1, unint64_t a2)
{
  if ((unint64_t)(a1 - 1) > 1)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), a2);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.3fs"), (double)a2 / 1000.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

void *getkCADisplayNoneSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getkCADisplayNoneSymbolLoc_ptr;
  v6 = getkCADisplayNoneSymbolLoc_ptr;
  if (!getkCADisplayNoneSymbolLoc_ptr)
  {
    v1 = (void *)QuartzCoreLibrary();
    v0 = dlsym(v1, "kCADisplayNone");
    v4[3] = (uint64_t)v0;
    getkCADisplayNoneSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19A7467D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getkCADisplayNone()
{
  id *v0;

  v0 = (id *)getkCADisplayNoneSymbolLoc();
  if (!v0)
    getkCADisplayNone_cold_1();
  return *v0;
}

void *getkCADisplayOrientationRotation0SymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getkCADisplayOrientationRotation0SymbolLoc_ptr;
  v6 = getkCADisplayOrientationRotation0SymbolLoc_ptr;
  if (!getkCADisplayOrientationRotation0SymbolLoc_ptr)
  {
    v1 = (void *)QuartzCoreLibrary();
    v0 = dlsym(v1, "kCADisplayOrientationRotation0");
    v4[3] = (uint64_t)v0;
    getkCADisplayOrientationRotation0SymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19A746884(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getkCADisplayOrientationRotation0()
{
  id *v0;

  v0 = (id *)getkCADisplayOrientationRotation0SymbolLoc();
  if (!v0)
    getkCADisplayOrientationRotation0_cold_1();
  return *v0;
}

void *getkCADisplayModeGamutSRGBSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getkCADisplayModeGamutSRGBSymbolLoc_ptr;
  v6 = getkCADisplayModeGamutSRGBSymbolLoc_ptr;
  if (!getkCADisplayModeGamutSRGBSymbolLoc_ptr)
  {
    v1 = (void *)QuartzCoreLibrary();
    v0 = dlsym(v1, "kCADisplayModeGamutSRGB");
    v4[3] = (uint64_t)v0;
    getkCADisplayModeGamutSRGBSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19A746934(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getkCADisplayModeGamutSRGB()
{
  id *v0;

  v0 = (id *)getkCADisplayModeGamutSRGBSymbolLoc();
  if (!v0)
    getkCADisplayModeGamutSRGB_cold_1();
  return *v0;
}

void *getkCADisplayModeSDRSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getkCADisplayModeSDRSymbolLoc_ptr;
  v6 = getkCADisplayModeSDRSymbolLoc_ptr;
  if (!getkCADisplayModeSDRSymbolLoc_ptr)
  {
    v1 = (void *)QuartzCoreLibrary();
    v0 = dlsym(v1, "kCADisplayModeSDR");
    v4[3] = (uint64_t)v0;
    getkCADisplayModeSDRSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19A7469E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getkCADisplayModeSDR()
{
  id *v0;

  v0 = (id *)getkCADisplayModeSDRSymbolLoc();
  if (!v0)
    getkCADisplayModeSDR_cold_1();
  return *v0;
}

void *getkCASnapshotContextIdSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getkCASnapshotContextIdSymbolLoc_ptr;
  v6 = getkCASnapshotContextIdSymbolLoc_ptr;
  if (!getkCASnapshotContextIdSymbolLoc_ptr)
  {
    v1 = (void *)QuartzCoreLibrary();
    v0 = dlsym(v1, "kCASnapshotContextId");
    v4[3] = (uint64_t)v0;
    getkCASnapshotContextIdSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19A746A94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getkCASnapshotContextId()
{
  id *v0;

  v0 = (id *)getkCASnapshotContextIdSymbolLoc();
  if (!v0)
    getkCASnapshotContextId_cold_1();
  return *v0;
}

void *getkCASnapshotContextListSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getkCASnapshotContextListSymbolLoc_ptr;
  v6 = getkCASnapshotContextListSymbolLoc_ptr;
  if (!getkCASnapshotContextListSymbolLoc_ptr)
  {
    v1 = (void *)QuartzCoreLibrary();
    v0 = dlsym(v1, "kCASnapshotContextList");
    v4[3] = (uint64_t)v0;
    getkCASnapshotContextListSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19A746B44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getkCASnapshotContextList()
{
  id *v0;

  v0 = (id *)getkCASnapshotContextListSymbolLoc();
  if (!v0)
    getkCASnapshotContextList_cold_1();
  return *v0;
}

void *getkCASnapshotDisplayNameSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getkCASnapshotDisplayNameSymbolLoc_ptr;
  v6 = getkCASnapshotDisplayNameSymbolLoc_ptr;
  if (!getkCASnapshotDisplayNameSymbolLoc_ptr)
  {
    v1 = (void *)QuartzCoreLibrary();
    v0 = dlsym(v1, "kCASnapshotDisplayName");
    v4[3] = (uint64_t)v0;
    getkCASnapshotDisplayNameSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19A746BF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getkCASnapshotDisplayName()
{
  id *v0;

  v0 = (id *)getkCASnapshotDisplayNameSymbolLoc();
  if (!v0)
    getkCASnapshotDisplayName_cold_1();
  return *v0;
}

void *getkCASnapshotFormatOpaqueSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getkCASnapshotFormatOpaqueSymbolLoc_ptr;
  v6 = getkCASnapshotFormatOpaqueSymbolLoc_ptr;
  if (!getkCASnapshotFormatOpaqueSymbolLoc_ptr)
  {
    v1 = (void *)QuartzCoreLibrary();
    v0 = dlsym(v1, "kCASnapshotFormatOpaque");
    v4[3] = (uint64_t)v0;
    getkCASnapshotFormatOpaqueSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19A746CA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getkCASnapshotFormatOpaque()
{
  id *v0;

  v0 = (id *)getkCASnapshotFormatOpaqueSymbolLoc();
  if (!v0)
    getkCASnapshotFormatOpaque_cold_1();
  return *v0;
}

void *getkCASnapshotFormatWideGamutSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getkCASnapshotFormatWideGamutSymbolLoc_ptr;
  v6 = getkCASnapshotFormatWideGamutSymbolLoc_ptr;
  if (!getkCASnapshotFormatWideGamutSymbolLoc_ptr)
  {
    v1 = (void *)QuartzCoreLibrary();
    v0 = dlsym(v1, "kCASnapshotFormatWideGamut");
    v4[3] = (uint64_t)v0;
    getkCASnapshotFormatWideGamutSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19A746D54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getkCASnapshotFormatWideGamut()
{
  id *v0;

  v0 = (id *)getkCASnapshotFormatWideGamutSymbolLoc();
  if (!v0)
    getkCASnapshotFormatWideGamut_cold_1();
  return *v0;
}

void *getkCASnapshotModeSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getkCASnapshotModeSymbolLoc_ptr;
  v6 = getkCASnapshotModeSymbolLoc_ptr;
  if (!getkCASnapshotModeSymbolLoc_ptr)
  {
    v1 = (void *)QuartzCoreLibrary();
    v0 = dlsym(v1, "kCASnapshotMode");
    v4[3] = (uint64_t)v0;
    getkCASnapshotModeSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19A746E04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getkCASnapshotMode()
{
  id *v0;

  v0 = (id *)getkCASnapshotModeSymbolLoc();
  if (!v0)
    getkCASnapshotMode_cold_1();
  return *v0;
}

void *getkCASnapshotModeIncludeContextListSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getkCASnapshotModeIncludeContextListSymbolLoc_ptr;
  v6 = getkCASnapshotModeIncludeContextListSymbolLoc_ptr;
  if (!getkCASnapshotModeIncludeContextListSymbolLoc_ptr)
  {
    v1 = (void *)QuartzCoreLibrary();
    v0 = dlsym(v1, "kCASnapshotModeIncludeContextList");
    v4[3] = (uint64_t)v0;
    getkCASnapshotModeIncludeContextListSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19A746EB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getkCASnapshotModeIncludeContextList()
{
  id *v0;

  v0 = (id *)getkCASnapshotModeIncludeContextListSymbolLoc();
  if (!v0)
    getkCASnapshotModeIncludeContextList_cold_1();
  return *v0;
}

void *getkCASnapshotOriginXSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getkCASnapshotOriginXSymbolLoc_ptr;
  v6 = getkCASnapshotOriginXSymbolLoc_ptr;
  if (!getkCASnapshotOriginXSymbolLoc_ptr)
  {
    v1 = (void *)QuartzCoreLibrary();
    v0 = dlsym(v1, "kCASnapshotOriginX");
    v4[3] = (uint64_t)v0;
    getkCASnapshotOriginXSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19A746F64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getkCASnapshotOriginX()
{
  id *v0;

  v0 = (id *)getkCASnapshotOriginXSymbolLoc();
  if (!v0)
    getkCASnapshotOriginX_cold_1();
  return *v0;
}

void *getkCASnapshotOriginYSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getkCASnapshotOriginYSymbolLoc_ptr;
  v6 = getkCASnapshotOriginYSymbolLoc_ptr;
  if (!getkCASnapshotOriginYSymbolLoc_ptr)
  {
    v1 = (void *)QuartzCoreLibrary();
    v0 = dlsym(v1, "kCASnapshotOriginY");
    v4[3] = (uint64_t)v0;
    getkCASnapshotOriginYSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19A747014(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getkCASnapshotOriginY()
{
  id *v0;

  v0 = (id *)getkCASnapshotOriginYSymbolLoc();
  if (!v0)
    getkCASnapshotOriginY_cold_1();
  return *v0;
}

void *getkCASnapshotSizeHeightSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getkCASnapshotSizeHeightSymbolLoc_ptr;
  v6 = getkCASnapshotSizeHeightSymbolLoc_ptr;
  if (!getkCASnapshotSizeHeightSymbolLoc_ptr)
  {
    v1 = (void *)QuartzCoreLibrary();
    v0 = dlsym(v1, "kCASnapshotSizeHeight");
    v4[3] = (uint64_t)v0;
    getkCASnapshotSizeHeightSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19A7470C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getkCASnapshotSizeHeight()
{
  id *v0;

  v0 = (id *)getkCASnapshotSizeHeightSymbolLoc();
  if (!v0)
    getkCASnapshotSizeHeight_cold_1();
  return *v0;
}

void *getkCASnapshotSizeWidthSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getkCASnapshotSizeWidthSymbolLoc_ptr;
  v6 = getkCASnapshotSizeWidthSymbolLoc_ptr;
  if (!getkCASnapshotSizeWidthSymbolLoc_ptr)
  {
    v1 = (void *)QuartzCoreLibrary();
    v0 = dlsym(v1, "kCASnapshotSizeWidth");
    v4[3] = (uint64_t)v0;
    getkCASnapshotSizeWidthSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19A747174(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getkCASnapshotSizeWidth()
{
  id *v0;

  v0 = (id *)getkCASnapshotSizeWidthSymbolLoc();
  if (!v0)
    getkCASnapshotSizeWidth_cold_1();
  return *v0;
}

void *getkCASnapshotTransformSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getkCASnapshotTransformSymbolLoc_ptr;
  v6 = getkCASnapshotTransformSymbolLoc_ptr;
  if (!getkCASnapshotTransformSymbolLoc_ptr)
  {
    v1 = (void *)QuartzCoreLibrary();
    v0 = dlsym(v1, "kCASnapshotTransform");
    v4[3] = (uint64_t)v0;
    getkCASnapshotTransformSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19A747224(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getkCASnapshotTransform()
{
  id *v0;

  v0 = (id *)getkCASnapshotTransformSymbolLoc();
  if (!v0)
    getkCASnapshotTransform_cold_1();
  return *v0;
}

void *getkCASnapshotMapCacheAttributeSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getkCASnapshotMapCacheAttributeSymbolLoc_ptr;
  v6 = getkCASnapshotMapCacheAttributeSymbolLoc_ptr;
  if (!getkCASnapshotMapCacheAttributeSymbolLoc_ptr)
  {
    v1 = (void *)QuartzCoreLibrary();
    v0 = dlsym(v1, "kCASnapshotMapCacheAttribute");
    v4[3] = (uint64_t)v0;
    getkCASnapshotMapCacheAttributeSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19A7472D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getkCASnapshotMapCacheAttribute()
{
  id *v0;

  v0 = (id *)getkCASnapshotMapCacheAttributeSymbolLoc();
  if (!v0)
    getkCASnapshotMapCacheAttribute_cold_1();
  return *v0;
}

void *getCARenderServerCreateSnapshotsSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getCARenderServerCreateSnapshotsSymbolLoc_ptr;
  v6 = getCARenderServerCreateSnapshotsSymbolLoc_ptr;
  if (!getCARenderServerCreateSnapshotsSymbolLoc_ptr)
  {
    v1 = (void *)QuartzCoreLibrary();
    v0 = dlsym(v1, "CARenderServerCreateSnapshots");
    v4[3] = (uint64_t)v0;
    getCARenderServerCreateSnapshotsSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19A747384(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t soft_CARenderServerCreateSnapshots(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7;
  uint64_t (*SnapshotsSymbolLoc)(uint64_t, uint64_t, uint64_t, id);
  uint64_t v9;

  v7 = a4;
  SnapshotsSymbolLoc = (uint64_t (*)(uint64_t, uint64_t, uint64_t, id))getCARenderServerCreateSnapshotsSymbolLoc();
  if (!SnapshotsSymbolLoc)
    soft_CARenderServerCreateSnapshots_cold_1();
  v9 = SnapshotsSymbolLoc(a1, a2, a3, v7);

  return v9;
}

__CFString *FBSDisplayAttachmentDescription(uint64_t a1)
{
  if (a1 < 5)
    return off_1E38EDDD0[(int)a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%i)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

void FBSSettingForExtensionSelector_cold_1()
{
  void *v0;
  uint64_t v1;
  uint8_t v2[40];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "FBSSetting * _Nullable FBSSettingForExtensionSelector(__unsafe_unretained Class _Nonnull, SEL _Nonnull)");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_0_0(&dword_19A6D4000, MEMORY[0x1E0C81028], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2);

  OUTLINED_FUNCTION_3_0();
}

void FBSSettingForExtensionSelector_cold_2()
{
  void *v0;
  uint64_t v1;
  uint8_t v2[40];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "FBSSetting * _Nullable FBSSettingForExtensionSelector(__unsafe_unretained Class _Nonnull, SEL _Nonnull)");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_0_0(&dword_19A6D4000, MEMORY[0x1E0C81028], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2);

  OUTLINED_FUNCTION_3_0();
}

void FBSRealizeSettingsExtension_cold_1()
{
  void *v0;
  uint64_t v1;
  uint8_t v2[40];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void FBSRealizeSettingsExtension(__unsafe_unretained Class _Nonnull, __unsafe_unretained FBSSettingsExtensionType _Nonnull)");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_0_0(&dword_19A6D4000, MEMORY[0x1E0C81028], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2);

  OUTLINED_FUNCTION_3_0();
}

void FBSRealizeSceneExtension_cold_1()
{
  void *v0;
  uint64_t v1;
  uint8_t v2[40];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void FBSRealizeSceneExtension(__unsafe_unretained Class _Nonnull)");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_0_0(&dword_19A6D4000, MEMORY[0x1E0C81028], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2);

  OUTLINED_FUNCTION_3_0();
}

void FBSRealizeSceneExtension_cold_2()
{
  void *v0;
  uint64_t v1;
  uint8_t v2[40];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void FBSRealizeSceneExtension(__unsafe_unretained Class _Nonnull)");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_0_0(&dword_19A6D4000, MEMORY[0x1E0C81028], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2);

  OUTLINED_FUNCTION_3_0();
}

void FBSRealizeSceneExtension_cold_3()
{
  void *v0;
  uint64_t v1;
  uint8_t v2[40];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void FBSRealizeSceneExtension(__unsafe_unretained Class _Nonnull)");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_0_0(&dword_19A6D4000, MEMORY[0x1E0C81028], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2);

  OUTLINED_FUNCTION_3_0();
}

void _realizeSettingsExtension_cold_1()
{
  void *v0;
  uint64_t v1;
  uint8_t v2[40];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _realizeSettingsExtension(__unsafe_unretained Class, __unsafe_unretained Class)");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_0(&dword_19A6D4000, MEMORY[0x1E0C81028], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2);

  OUTLINED_FUNCTION_3_0();
}

void _realizeSettingsExtension_cold_2()
{
  void *v0;
  uint64_t v1;
  uint8_t v2[40];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _realizeSettingsExtension(__unsafe_unretained Class, __unsafe_unretained Class)");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_0(&dword_19A6D4000, MEMORY[0x1E0C81028], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2);

  OUTLINED_FUNCTION_3_0();
}

void _realizeSettingsExtension_cold_4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint8_t *v11;

  OUTLINED_FUNCTION_10();
  v4 = OUTLINED_FUNCTION_2_0(v1, 5.8384e-34, v2, v3);
  OUTLINED_FUNCTION_6(v4, v5, v6);
  OUTLINED_FUNCTION_5(v7, v8, v9);
  OUTLINED_FUNCTION_0_0(&dword_19A6D4000, MEMORY[0x1E0C81028], v10, "failure in %{public}@ (%{public}@:%i) : %{public}@", v11);

  OUTLINED_FUNCTION_9();
}

void _realizeSettingsExtension_cold_6()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint8_t *v11;

  OUTLINED_FUNCTION_10();
  v4 = OUTLINED_FUNCTION_2_0(v1, 5.8384e-34, v2, v3);
  OUTLINED_FUNCTION_6(v4, v5, v6);
  OUTLINED_FUNCTION_5(v7, v8, v9);
  OUTLINED_FUNCTION_0_0(&dword_19A6D4000, MEMORY[0x1E0C81028], v10, "failure in %{public}@ (%{public}@:%i) : %{public}@", v11);

  OUTLINED_FUNCTION_9();
}

void _realizeSettingsExtension_cold_8()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint8_t *v11;

  OUTLINED_FUNCTION_10();
  v4 = OUTLINED_FUNCTION_2_0(v1, 5.8384e-34, v2, v3);
  OUTLINED_FUNCTION_6(v4, v5, v6);
  OUTLINED_FUNCTION_5(v7, v8, v9);
  OUTLINED_FUNCTION_0_0(&dword_19A6D4000, MEMORY[0x1E0C81028], v10, "failure in %{public}@ (%{public}@:%i) : %{public}@", v11);

  OUTLINED_FUNCTION_9();
}

void _realizeSettingsExtension_cold_10()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint8_t *v11;

  OUTLINED_FUNCTION_10();
  v4 = OUTLINED_FUNCTION_2_0(v1, 5.8384e-34, v2, v3);
  OUTLINED_FUNCTION_6(v4, v5, v6);
  OUTLINED_FUNCTION_5(v7, v8, v9);
  OUTLINED_FUNCTION_0_0(&dword_19A6D4000, MEMORY[0x1E0C81028], v10, "failure in %{public}@ (%{public}@:%i) : %{public}@", v11);

  OUTLINED_FUNCTION_9();
}

void _realizeSettingsExtension_cold_12()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint8_t *v11;

  OUTLINED_FUNCTION_10();
  v4 = OUTLINED_FUNCTION_2_0(v1, 5.8384e-34, v2, v3);
  OUTLINED_FUNCTION_6(v4, v5, v6);
  OUTLINED_FUNCTION_5(v7, v8, v9);
  OUTLINED_FUNCTION_0_0(&dword_19A6D4000, MEMORY[0x1E0C81028], v10, "failure in %{public}@ (%{public}@:%i) : %{public}@", v11);

  OUTLINED_FUNCTION_9();
}

void _realizeSettingsExtension_cold_14()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint8_t *v11;

  OUTLINED_FUNCTION_10();
  v4 = OUTLINED_FUNCTION_2_0(v1, 5.8384e-34, v2, v3);
  OUTLINED_FUNCTION_6(v4, v5, v6);
  OUTLINED_FUNCTION_5(v7, v8, v9);
  OUTLINED_FUNCTION_0_0(&dword_19A6D4000, MEMORY[0x1E0C81028], v10, "failure in %{public}@ (%{public}@:%i) : %{public}@", v11);

  OUTLINED_FUNCTION_9();
}

void _realizeSettingsExtension_cold_16()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint8_t *v11;

  OUTLINED_FUNCTION_10();
  v4 = OUTLINED_FUNCTION_2_0(v1, 5.8384e-34, v2, v3);
  OUTLINED_FUNCTION_6(v4, v5, v6);
  OUTLINED_FUNCTION_5(v7, v8, v9);
  OUTLINED_FUNCTION_0_0(&dword_19A6D4000, MEMORY[0x1E0C81028], v10, "failure in %{public}@ (%{public}@:%i) : %{public}@", v11);

  OUTLINED_FUNCTION_9();
}

void _realizeSettingsExtension_cold_18()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint8_t *v11;

  OUTLINED_FUNCTION_10();
  v4 = OUTLINED_FUNCTION_2_0(v1, 5.8384e-34, v2, v3);
  OUTLINED_FUNCTION_6(v4, v5, v6);
  OUTLINED_FUNCTION_5(v7, v8, v9);
  OUTLINED_FUNCTION_0_0(&dword_19A6D4000, MEMORY[0x1E0C81028], v10, "failure in %{public}@ (%{public}@:%i) : %{public}@", v11);

  OUTLINED_FUNCTION_9();
}

void _realizeSettingsExtension_cold_20()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint8_t *v11;

  OUTLINED_FUNCTION_10();
  v4 = OUTLINED_FUNCTION_2_0(v1, 5.8384e-34, v2, v3);
  OUTLINED_FUNCTION_6(v4, v5, v6);
  OUTLINED_FUNCTION_5(v7, v8, v9);
  OUTLINED_FUNCTION_0_0(&dword_19A6D4000, MEMORY[0x1E0C81028], v10, "failure in %{public}@ (%{public}@:%i) : %{public}@", v11);

  OUTLINED_FUNCTION_9();
}

void _realizeSettingsExtension_cold_22()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint8_t *v11;

  OUTLINED_FUNCTION_10();
  v4 = OUTLINED_FUNCTION_2_0(v1, 5.8384e-34, v2, v3);
  OUTLINED_FUNCTION_6(v4, v5, v6);
  OUTLINED_FUNCTION_5(v7, v8, v9);
  OUTLINED_FUNCTION_0_0(&dword_19A6D4000, MEMORY[0x1E0C81028], v10, "failure in %{public}@ (%{public}@:%i) : %{public}@", v11);

  OUTLINED_FUNCTION_9();
}

void _realizeSettingsExtension_cold_24()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint8_t *v11;

  OUTLINED_FUNCTION_10();
  v4 = OUTLINED_FUNCTION_2_0(v1, 5.8384e-34, v2, v3);
  OUTLINED_FUNCTION_6(v4, v5, v6);
  OUTLINED_FUNCTION_5(v7, v8, v9);
  OUTLINED_FUNCTION_0_0(&dword_19A6D4000, MEMORY[0x1E0C81028], v10, "failure in %{public}@ (%{public}@:%i) : %{public}@", v11);

  OUTLINED_FUNCTION_9();
}

void _realizeSettingsExtension_cold_26()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint8_t *v11;

  OUTLINED_FUNCTION_10();
  v4 = OUTLINED_FUNCTION_2_0(v1, 5.8384e-34, v2, v3);
  OUTLINED_FUNCTION_6(v4, v5, v6);
  OUTLINED_FUNCTION_5(v7, v8, v9);
  OUTLINED_FUNCTION_0_0(&dword_19A6D4000, MEMORY[0x1E0C81028], v10, "failure in %{public}@ (%{public}@:%i) : %{public}@", v11);

  OUTLINED_FUNCTION_9();
}

void _realizeSettingsExtension_cold_28()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint8_t *v11;

  OUTLINED_FUNCTION_10();
  v4 = OUTLINED_FUNCTION_2_0(v1, 5.8384e-34, v2, v3);
  OUTLINED_FUNCTION_6(v4, v5, v6);
  OUTLINED_FUNCTION_5(v7, v8, v9);
  OUTLINED_FUNCTION_0_0(&dword_19A6D4000, MEMORY[0x1E0C81028], v10, "failure in %{public}@ (%{public}@:%i) : %{public}@", v11);

  OUTLINED_FUNCTION_9();
}

void _realizeSettingsExtension_cold_30()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint8_t *v11;

  OUTLINED_FUNCTION_10();
  v4 = OUTLINED_FUNCTION_2_0(v1, 5.8384e-34, v2, v3);
  OUTLINED_FUNCTION_6(v4, v5, v6);
  OUTLINED_FUNCTION_5(v7, v8, v9);
  OUTLINED_FUNCTION_0_0(&dword_19A6D4000, MEMORY[0x1E0C81028], v10, "failure in %{public}@ (%{public}@:%i) : %{public}@", v11);

  OUTLINED_FUNCTION_9();
}

void _realizeSettingsExtension_cold_31()
{
  void *v0;
  uint64_t v1;
  uint8_t v2[40];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _realizeSettingsExtension(__unsafe_unretained Class, __unsafe_unretained Class)");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_0(&dword_19A6D4000, MEMORY[0x1E0C81028], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2);

  OUTLINED_FUNCTION_3_0();
}

void _realizeSettingsExtension_cold_32()
{
  void *v0;
  uint64_t v1;
  uint8_t v2[40];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _realizeSettingsExtension(__unsafe_unretained Class, __unsafe_unretained Class)");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_0(&dword_19A6D4000, MEMORY[0x1E0C81028], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2);

  OUTLINED_FUNCTION_3_0();
}

void _realizeSettingsExtension_cold_33()
{
  void *v0;
  uint64_t v1;
  uint8_t v2[40];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _realizeSettingsExtension(__unsafe_unretained Class, __unsafe_unretained Class)");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_0(&dword_19A6D4000, MEMORY[0x1E0C81028], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2);

  OUTLINED_FUNCTION_3_0();
}

void FBSRealizeSubclassExtension_cold_1()
{
  void *v0;
  uint64_t v1;
  uint8_t v2[40];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void FBSRealizeSubclassExtension(__unsafe_unretained Class _Nonnull)");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_0(&dword_19A6D4000, MEMORY[0x1E0C81028], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2);

  OUTLINED_FUNCTION_3_0();
}

void FBSRealizeSubclassExtension_cold_3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint8_t *v11;

  OUTLINED_FUNCTION_10();
  v4 = OUTLINED_FUNCTION_2_0(v1, 5.8384e-34, v2, v3);
  OUTLINED_FUNCTION_6(v4, v5, v6);
  OUTLINED_FUNCTION_5(v7, v8, v9);
  OUTLINED_FUNCTION_0_0(&dword_19A6D4000, MEMORY[0x1E0C81028], v10, "failure in %{public}@ (%{public}@:%i) : %{public}@", v11);

  OUTLINED_FUNCTION_9();
}

void FBSRealizeSubclassExtension_cold_5()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint8_t *v11;

  OUTLINED_FUNCTION_10();
  v4 = OUTLINED_FUNCTION_2_0(v1, 5.8384e-34, v2, v3);
  OUTLINED_FUNCTION_6(v4, v5, v6);
  OUTLINED_FUNCTION_5(v7, v8, v9);
  OUTLINED_FUNCTION_0_0(&dword_19A6D4000, MEMORY[0x1E0C81028], v10, "failure in %{public}@ (%{public}@:%i) : %{public}@", v11);

  OUTLINED_FUNCTION_9();
}

void FBSRealizeSubclassExtension_cold_7()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint8_t *v11;

  OUTLINED_FUNCTION_10();
  v4 = OUTLINED_FUNCTION_2_0(v1, 5.8384e-34, v2, v3);
  OUTLINED_FUNCTION_6(v4, v5, v6);
  OUTLINED_FUNCTION_5(v7, v8, v9);
  OUTLINED_FUNCTION_0_0(&dword_19A6D4000, MEMORY[0x1E0C81028], v10, "failure in %{public}@ (%{public}@:%i) : %{public}@", v11);

  OUTLINED_FUNCTION_9();
}

void FBSRealizeSubclassExtension_cold_9()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint8_t *v11;

  OUTLINED_FUNCTION_10();
  v4 = OUTLINED_FUNCTION_2_0(v1, 5.8384e-34, v2, v3);
  OUTLINED_FUNCTION_6(v4, v5, v6);
  OUTLINED_FUNCTION_5(v7, v8, v9);
  OUTLINED_FUNCTION_0_0(&dword_19A6D4000, MEMORY[0x1E0C81028], v10, "failure in %{public}@ (%{public}@:%i) : %{public}@", v11);

  OUTLINED_FUNCTION_9();
}

void FBSIngestSubclassProperties_cold_1()
{
  void *v0;
  uint64_t v1;
  uint8_t v2[40];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void FBSIngestSubclassProperties(__unsafe_unretained Class _Nonnull)");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_0_0(&dword_19A6D4000, MEMORY[0x1E0C81028], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2);

  OUTLINED_FUNCTION_3_0();
}

void _ingestPropertiesFromSettingsSubclass_cold_1()
{
  void *v0;
  uint64_t v1;
  uint8_t v2[40];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _ingestPropertiesFromSettingsSubclass(__unsafe_unretained Class)");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_0(&dword_19A6D4000, MEMORY[0x1E0C81028], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2);

  OUTLINED_FUNCTION_3_0();
}

void _ingestPropertiesFromSettingsSubclass_cold_2()
{
  void *v0;
  uint64_t v1;
  uint8_t v2[40];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _ingestPropertiesFromSettingsSubclass(__unsafe_unretained Class)");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_0(&dword_19A6D4000, MEMORY[0x1E0C81028], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2);

  OUTLINED_FUNCTION_3_0();
}

void _ingestPropertiesFromSettingsSubclass_cold_3()
{
  void *v0;
  uint64_t v1;
  uint8_t v2[40];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _ingestPropertiesFromSettingsSubclass(__unsafe_unretained Class)");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_0(&dword_19A6D4000, MEMORY[0x1E0C81028], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2);

  OUTLINED_FUNCTION_3_0();
}

void _ingestPropertiesFromSettingsSubclass_cold_4(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_22(&dword_19A6D4000, a2, a3, "Ignoring %{public}@ since it defines no properties.", (uint8_t *)a2);

  OUTLINED_FUNCTION_9();
}

void _ingestPropertiesFromSettingsSubclass_cold_6()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint8_t *v11;

  OUTLINED_FUNCTION_10();
  v4 = OUTLINED_FUNCTION_2_0(v1, 5.8384e-34, v2, v3);
  OUTLINED_FUNCTION_6(v4, v5, v6);
  OUTLINED_FUNCTION_5(v7, v8, v9);
  OUTLINED_FUNCTION_0_0(&dword_19A6D4000, MEMORY[0x1E0C81028], v10, "failure in %{public}@ (%{public}@:%i) : %{public}@", v11);

  OUTLINED_FUNCTION_9();
}

void _ingestPropertiesFromSettingsSubclass_cold_7(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_22(&dword_19A6D4000, a2, a3, "Ignoring %{public}@ as we found no valid properties on the class.", (uint8_t *)a2);

  OUTLINED_FUNCTION_9();
}

void _ingestPropertiesFromSettingsSubclass_cold_10()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint8_t *v11;

  OUTLINED_FUNCTION_10();
  v4 = OUTLINED_FUNCTION_2_0(v1, 5.8384e-34, v2, v3);
  OUTLINED_FUNCTION_6(v4, v5, v6);
  OUTLINED_FUNCTION_5(v7, v8, v9);
  OUTLINED_FUNCTION_0_0(&dword_19A6D4000, MEMORY[0x1E0C81028], v10, "failure in %{public}@ (%{public}@:%i) : %{public}@", v11);

  OUTLINED_FUNCTION_9();
}

void _ingestPropertiesFromSettingsSubclass_cold_12()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint8_t *v11;

  OUTLINED_FUNCTION_10();
  v4 = OUTLINED_FUNCTION_2_0(v1, 5.8384e-34, v2, v3);
  OUTLINED_FUNCTION_6(v4, v5, v6);
  OUTLINED_FUNCTION_5(v7, v8, v9);
  OUTLINED_FUNCTION_0_0(&dword_19A6D4000, MEMORY[0x1E0C81028], v10, "failure in %{public}@ (%{public}@:%i) : %{public}@", v11);

  OUTLINED_FUNCTION_9();
}

void _ingestPropertiesFromSettingsSubclass_cold_13()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_14(&dword_19A6D4000, v0, v1, "Unable to derive immutable class from %{public}@. Please implement +[%{public}@ immutableSubclass]", v2);
  OUTLINED_FUNCTION_21();
}

void _ingestPropertiesFromSettingsSubclass_cold_14()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_14(&dword_19A6D4000, v0, v1, "Found no immutable variant of %{public}@. Please implement +[%{public}@ immutableSubclass].", v2);
  OUTLINED_FUNCTION_21();
}

void _ingestPropertiesFromSettingsSubclass_cold_15()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_14(&dword_19A6D4000, v0, (uint64_t)v0, "Derived %{public}@ from %{public}@.", v1);
  OUTLINED_FUNCTION_21();
}

void _ingestPropertiesFromSettingsSubclass_cold_16()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_14(&dword_19A6D4000, v0, v1, "Found no mutable variant of %{public}@. Please implement +[%{public}@ mutableSubclass].", v2);
  OUTLINED_FUNCTION_21();
}

void FBSSubclassHasBeenIngested_cold_1()
{
  void *v0;
  uint64_t v1;
  uint8_t v2[40];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL FBSSubclassHasBeenIngested(__unsafe_unretained Class _Nonnull)");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_0_0(&dword_19A6D4000, MEMORY[0x1E0C81028], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2);

  OUTLINED_FUNCTION_3_0();
}

void FBSSettingForLegacySetting_cold_1()
{
  void *v0;
  uint64_t v1;
  uint8_t v2[40];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "FBSSetting * _Nullable FBSSettingForLegacySetting(__unsafe_unretained Class _Nonnull, NSUInteger)");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_0_0(&dword_19A6D4000, MEMORY[0x1E0C81028], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2);

  OUTLINED_FUNCTION_3_0();
}

void FBSSettingForLegacySetting_cold_2()
{
  void *v0;
  uint64_t v1;
  uint8_t v2[40];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "FBSSetting * _Nullable FBSSettingForLegacySetting(__unsafe_unretained Class _Nonnull, NSUInteger)");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_0_0(&dword_19A6D4000, MEMORY[0x1E0C81028], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2);

  OUTLINED_FUNCTION_3_0();
}

void _addMethod_cold_1()
{
  void *v0;
  uint64_t v1;
  uint8_t v2[40];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _addMethod(__unsafe_unretained Class, __unsafe_unretained Class, SEL, IMP, const char *, BOOL)");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_0_0(&dword_19A6D4000, MEMORY[0x1E0C81028], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2);

  OUTLINED_FUNCTION_3_0();
}

void _addMethod_cold_2()
{
  void *v0;
  uint64_t v1;
  uint8_t v2[40];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _addMethod(__unsafe_unretained Class, __unsafe_unretained Class, SEL, IMP, const char *, BOOL)");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_0_0(&dword_19A6D4000, MEMORY[0x1E0C81028], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2);

  OUTLINED_FUNCTION_3_0();
}

void _addMethod_cold_3()
{
  void *v0;
  uint64_t v1;
  uint8_t v2[40];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _addMethod(__unsafe_unretained Class, __unsafe_unretained Class, SEL, IMP, const char *, BOOL)");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_0_0(&dword_19A6D4000, MEMORY[0x1E0C81028], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2);

  OUTLINED_FUNCTION_3_0();
}

void _addMethod_cold_4()
{
  void *v0;
  uint64_t v1;
  uint8_t v2[40];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _addMethod(__unsafe_unretained Class, __unsafe_unretained Class, SEL, IMP, const char *, BOOL)");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_0_0(&dword_19A6D4000, MEMORY[0x1E0C81028], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2);

  OUTLINED_FUNCTION_3_0();
}

void _addMethod_cold_5()
{
  void *v0;
  uint64_t v1;
  uint8_t v2[40];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _addMethod(__unsafe_unretained Class, __unsafe_unretained Class, SEL, IMP, const char *, BOOL)");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_0_0(&dword_19A6D4000, MEMORY[0x1E0C81028], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2);

  OUTLINED_FUNCTION_3_0();
}

void _addMethod_cold_6()
{
  void *v0;
  uint64_t v1;
  uint8_t v2[40];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _addMethod(__unsafe_unretained Class, __unsafe_unretained Class, SEL, IMP, const char *, BOOL)");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_0_0(&dword_19A6D4000, MEMORY[0x1E0C81028], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2);

  OUTLINED_FUNCTION_3_0();
}

void ___realizeSettingsExtension_block_invoke_226_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v4;
  int IsYes;
  uint64_t v6;
  const char *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 40);
  IsYes = BSSettingFlagIsYes();
  v7 = "is not";
  if (IsYes)
    v7 = "is";
  v8 = 138412546;
  v9 = v4;
  v10 = 2080;
  v11 = v7;
  OUTLINED_FUNCTION_14(&dword_19A6D4000, a3, v6, "Determined \"%@\" %s a special collection.", (uint8_t *)&v8);
  OUTLINED_FUNCTION_20();
}

void ___realizeSettingsExtension_block_invoke_226_cold_2()
{
  void *v0;
  uint64_t v1;
  uint8_t v2[40];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _realizeSettingsExtension(__unsafe_unretained Class, __unsafe_unretained Class)_block_invoke");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_0_0(&dword_19A6D4000, MEMORY[0x1E0C81028], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2);

  OUTLINED_FUNCTION_3_0();
}

void _flushBulkMethods_cold_2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint8_t *v11;

  OUTLINED_FUNCTION_10();
  v4 = OUTLINED_FUNCTION_2_0(v1, 5.8384e-34, v2, v3);
  OUTLINED_FUNCTION_6(v4, v5, v6);
  OUTLINED_FUNCTION_5(v7, v8, v9);
  OUTLINED_FUNCTION_0_0(&dword_19A6D4000, MEMORY[0x1E0C81028], v10, "failure in %{public}@ (%{public}@:%i) : %{public}@", v11);

  OUTLINED_FUNCTION_9();
}

void FBSWorkspaceInitialize_cold_1(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  __int16 v5;
  const __CFString *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "FBSWorkspace * _Nonnull FBSWorkspaceInitialize(FBSWorkspaceInitializationOptions *__strong _Nonnull)");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 138544130;
  v4 = v2;
  v5 = 2114;
  v6 = CFSTR("FBSWorkspace.m");
  v7 = 1024;
  v8 = 210;
  v9 = 2114;
  v10 = a1;
  _os_log_error_impl(&dword_19A6D4000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", (uint8_t *)&v3, 0x26u);

}

void SecurityLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *SecurityLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("SecuritySoftLinking.m"), 13, CFSTR("%s"), *a1);

  __break(1u);
}

void soft_SecCertificateCreateWithData_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "SecCertificateRef soft_SecCertificateCreateWithData(CFAllocatorRef, CFDataRef)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SecuritySoftLinking.m"), 14, CFSTR("%s"), dlerror());

  __break(1u);
}

void soft_SecCertificateCopySubjectSummary_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFStringRef soft_SecCertificateCopySubjectSummary(SecCertificateRef)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SecuritySoftLinking.m"), 15, CFSTR("%s"), dlerror());

  __break(1u);
}

void _FBSCreateUnsafeObjectFromData_cold_1()
{
  os_log_t v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315394;
  v2 = "id _FBSCreateUnsafeObjectFromData(NSData *__strong)";
  OUTLINED_FUNCTION_10_0();
  _os_log_error_impl(&dword_19A6D4000, v0, OS_LOG_TYPE_ERROR, "%s the unarchiver failed to instantiate with error %{public}@", (uint8_t *)&v1, 0x16u);
  OUTLINED_FUNCTION_21();
}

void _FBSCreateUnsafeObjectFromData_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_8_2(&dword_19A6D4000, v0, v1, "Caught exception during decoding of data: %{public}@", v2);
  OUTLINED_FUNCTION_21();
}

void InstallCoordinationLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *InstallCoordinationLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("InstallCoordinationSoftLinking.m"), 13, CFSTR("%s"), *a1);

  __break(1u);
}

void __getIXAppInstallCoordinatorClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getIXAppInstallCoordinatorClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("InstallCoordinationSoftLinking.m"), 14, CFSTR("Unable to find class %s"), "IXAppInstallCoordinator");

  __break(1u);
}

void __getIXUninstallOptionsClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getIXUninstallOptionsClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("InstallCoordinationSoftLinking.m"), 15, CFSTR("Unable to find class %s"), "IXUninstallOptions");

  __break(1u);
}

void __getIXApplicationIdentityClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getIXApplicationIdentityClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("InstallCoordinationSoftLinking.m"), 16, CFSTR("Unable to find class %s"), "IXApplicationIdentity");

  __break(1u);
}

void soft_IXStringForUninstallDisposition_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *soft_IXStringForUninstallDisposition(IXUninstallDisposition)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("InstallCoordinationSoftLinking.m"), 17, CFSTR("%s"), dlerror());

  __break(1u);
}

void EmbeddedDataResetLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *EmbeddedDataResetLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("EmbeddedDataResetSoftLinking.m"), 13, CFSTR("%s"), *a1);

  __break(1u);
}

void __getDDRResetServiceClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getDDRResetServiceClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("EmbeddedDataResetSoftLinking.m"), 14, CFSTR("Unable to find class %s"), "DDRResetService");

  __break(1u);
}

void __getDDRResetRequestClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getDDRResetRequestClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("EmbeddedDataResetSoftLinking.m"), 15, CFSTR("Unable to find class %s"), "DDRResetRequest");

  __break(1u);
}

void __getDDRResetOptionsClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getDDRResetOptionsClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("EmbeddedDataResetSoftLinking.m"), 16, CFSTR("Unable to find class %s"), "DDRResetOptions");

  __break(1u);
}

void _lock_getDefaultExtensions_cold_1(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  __int16 v5;
  const __CFString *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSOrderedSet *_lock_getDefaultExtensions(FBSSceneSpecification *__strong, __unsafe_unretained Class)");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 138544130;
  v4 = v2;
  v5 = 2114;
  v6 = CFSTR("FBSSceneSpecification.m");
  v7 = 1024;
  v8 = 31;
  v9 = 2114;
  v10 = a1;
  _os_log_error_impl(&dword_19A6D4000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", (uint8_t *)&v3, 0x26u);

}

void ManagedConfigurationLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *ManagedConfigurationLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("ManagedConfigurationSoftLinking.m"), 13, CFSTR("%s"), *a1);

  __break(1u);
}

void __getMCProfileConnectionClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getMCProfileConnectionClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("ManagedConfigurationSoftLinking.m"), 14, CFSTR("Unable to find class %s"), "MCProfileConnection");

  __break(1u);
}

void getMCManagedAppsChangedNotification_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "typeof (((typeof (MCManagedAppsChangedNotification) (*)(void))0)()) getMCManagedAppsChangedNotification(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("ManagedConfigurationSoftLinking.m"), 15, CFSTR("%s"), dlerror());

  __break(1u);
}

void libmisLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *libmisLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("libmisSoftLinking.m"), 13, CFSTR("%s"), *a1);

  __break(1u);
}

void soft_MISQueryBlacklistForBundle_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_Bool soft_MISQueryBlacklistForBundle(CFStringRef _Nonnull, off_t, _Bool, struct MISBlacklistFlags * _Nullable, CFDataRef  _Nullable * _Nullable, MISBlacklistHashType * _Nullable, CFDictionaryRef  _Nullable const)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("libmisSoftLinking.m"), 16, CFSTR("%s"), OUTLINED_FUNCTION_0_2());

  __break(1u);
}

void soft_MISQueryBlacklistForCdHash_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_Bool soft_MISQueryBlacklistForCdHash(CFDataRef  _Nonnull const, MISBlacklistHashType, _Bool, struct MISBlacklistFlags * _Nullable, CFDictionaryRef  _Nullable const)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("libmisSoftLinking.m"), 17, CFSTR("%s"), OUTLINED_FUNCTION_0_2());

  __break(1u);
}

void soft_MISAppApprovalState_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "MISState soft_MISAppApprovalState(CFStringRef, CFDictionaryRef)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("libmisSoftLinking.m"), 18, CFSTR("%s"), OUTLINED_FUNCTION_0_2());

  __break(1u);
}

void soft_MISValidateUPP_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void soft_MISValidateUPP(CFStringRef, __strong dispatch_queue_t, void (^__strong)(MISState, int64_t))");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("libmisSoftLinking.m"), 19, CFSTR("%s"), OUTLINED_FUNCTION_0_2());

  __break(1u);
}

void soft_MISCopyErrorStringForErrorCode_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFStringRef soft_MISCopyErrorStringForErrorCode(MISError)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("libmisSoftLinking.m"), 20, CFSTR("%s"), OUTLINED_FUNCTION_0_2());

  __break(1u);
}

void soft_MISValidateSignatureAndCopyInfo_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "MISError soft_MISValidateSignatureAndCopyInfo(CFStringRef, CFDictionaryRef, CFDictionaryRef *)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("libmisSoftLinking.m"), 21, CFSTR("%s"), OUTLINED_FUNCTION_0_2());

  __break(1u);
}

void soft_MISValidationCopySignatureVersion_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "MISError soft_MISValidationCopySignatureVersion(CFStringRef, CFNumberRef *)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("libmisSoftLinking.m"), 25, CFSTR("%s"), OUTLINED_FUNCTION_0_2());

  __break(1u);
}

void getkMISValidationOptionUnauthoritativeLaunch_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "typeof (((typeof (kMISValidationOptionUnauthoritativeLaunch) (*)(void))0)()) getkMISValidationOptionUnauthoritativeLaunch(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("libmisSoftLinking.m"), 26, CFSTR("%s"), OUTLINED_FUNCTION_0_2());

  __break(1u);
}

void getkMISValidationOptionAuthoritativeLaunch_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "typeof (((typeof (kMISValidationOptionAuthoritativeLaunch) (*)(void))0)()) getkMISValidationOptionAuthoritativeLaunch(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("libmisSoftLinking.m"), 27, CFSTR("%s"), OUTLINED_FUNCTION_0_2());

  __break(1u);
}

void getkMISValidationOptionOnlineAuthorization_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "typeof (((typeof (kMISValidationOptionOnlineAuthorization) (*)(void))0)()) getkMISValidationOptionOnlineAuthorization(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("libmisSoftLinking.m"), 28, CFSTR("%s"), OUTLINED_FUNCTION_0_2());

  __break(1u);
}

void getkMISValidationOptionOnlineCheckType_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "typeof (((typeof (kMISValidationOptionOnlineCheckType) (*)(void))0)()) getkMISValidationOptionOnlineCheckType(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("libmisSoftLinking.m"), 29, CFSTR("%s"), OUTLINED_FUNCTION_0_2());

  __break(1u);
}

void getkMISMinSupportedSignatureVersion_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "typeof (((typeof (kMISMinSupportedSignatureVersion) (*)(void))0)()) getkMISMinSupportedSignatureVersion(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("libmisSoftLinking.m"), 30, CFSTR("%s"), OUTLINED_FUNCTION_0_2());

  __break(1u);
}

void getkMISFutureMinSupportedSignatureVersion_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "typeof (((typeof (kMISFutureMinSupportedSignatureVersion) (*)(void))0)()) getkMISFutureMinSupportedSignatureVersion(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("libmisSoftLinking.m"), 31, CFSTR("%s"), OUTLINED_FUNCTION_0_2());

  __break(1u);
}

void getkMISValidationOptionHintMainExecutablePath_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "typeof (((typeof (kMISValidationOptionHintMainExecutablePath) (*)(void))0)()) getkMISValidationOptionHintMainExecutablePath(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("libmisSoftLinking.m"), 32, CFSTR("%s"), OUTLINED_FUNCTION_0_2());

  __break(1u);
}

void soft_MISEnumerateInstalledProvisioningProfiles_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "MISError soft_MISEnumerateInstalledProvisioningProfiles(CFOptionFlags, _Bool (^__strong)(MISProfileRef))");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("libmisSoftLinking.m"), 35, CFSTR("%s"), OUTLINED_FUNCTION_0_2());

  __break(1u);
}

void soft_MISProvisioningProfileGetDeveloperCertificates_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFArrayRef soft_MISProvisioningProfileGetDeveloperCertificates(MISProfileRef)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("libmisSoftLinking.m"), 36, CFSTR("%s"), OUTLINED_FUNCTION_0_2());

  __break(1u);
}

void soft_MISProfileGetValue_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFTypeRef soft_MISProfileGetValue(MISProfileRef, CFStringRef)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("libmisSoftLinking.m"), 37, CFSTR("%s"), OUTLINED_FUNCTION_0_2());

  __break(1u);
}

void soft_MISProvisioningProfileGetEntitlements_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFDictionaryRef soft_MISProvisioningProfileGetEntitlements(MISProfileRef)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("libmisSoftLinking.m"), 38, CFSTR("%s"), OUTLINED_FUNCTION_0_2());

  __break(1u);
}

void soft_MISProvisioningProfileGetExpirationDate_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFDateRef soft_MISProvisioningProfileGetExpirationDate(MISProfileRef)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("libmisSoftLinking.m"), 39, CFSTR("%s"), OUTLINED_FUNCTION_0_2());

  __break(1u);
}

void soft_MISProvisioningProfileGetUUID_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFStringRef soft_MISProvisioningProfileGetUUID(MISProfileRef)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("libmisSoftLinking.m"), 40, CFSTR("%s"), OUTLINED_FUNCTION_0_2());

  __break(1u);
}

void soft_MISProvisioningProfileGrantsEntitlement_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Boolean soft_MISProvisioningProfileGrantsEntitlement(MISProfileRef, CFStringRef, CFTypeRef)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("libmisSoftLinking.m"), 41, CFSTR("%s"), OUTLINED_FUNCTION_0_2());

  __break(1u);
}

void soft_MISProvisioningProfileIsAppleInternalProfile_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Boolean soft_MISProvisioningProfileIsAppleInternalProfile(MISProfileRef)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("libmisSoftLinking.m"), 43, CFSTR("%s"), OUTLINED_FUNCTION_0_2());

  __break(1u);
}

void soft_MISProvisioningProfileProvisionsAllDevices_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Boolean soft_MISProvisioningProfileProvisionsAllDevices(MISProfileRef)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("libmisSoftLinking.m"), 44, CFSTR("%s"), OUTLINED_FUNCTION_0_2());

  __break(1u);
}

void __getMISLaunchWarningDatabaseClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getMISLaunchWarningDatabaseClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("libmisSoftLinking.m"), 47, CFSTR("Unable to find class %s"), "MISLaunchWarningDatabase");

  __break(1u);
}

void QuartzCoreLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *QuartzCoreLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("QuartzCoreSoftLinking.m"), 11, CFSTR("%s"), *a1);

  __break(1u);
}

void __getCADisplayClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getCADisplayClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("QuartzCoreSoftLinking.m"), 12, CFSTR("Unable to find class %s"), "CADisplay");

  __break(1u);
}

void getkCADisplayNone_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "typeof (((typeof (kCADisplayNone) (*)(void))0)()) getkCADisplayNone(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("QuartzCoreSoftLinking.m"), 13, CFSTR("%s"), OUTLINED_FUNCTION_0_2());

  __break(1u);
}

void getkCADisplayScaleContent_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "typeof (((typeof (kCADisplayScaleContent) (*)(void))0)()) getkCADisplayScaleContent(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("QuartzCoreSoftLinking.m"), 14, CFSTR("%s"), OUTLINED_FUNCTION_0_2());

  __break(1u);
}

void getkCADisplayInsetBounds_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "typeof (((typeof (kCADisplayInsetBounds) (*)(void))0)()) getkCADisplayInsetBounds(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("QuartzCoreSoftLinking.m"), 15, CFSTR("%s"), OUTLINED_FUNCTION_0_2());

  __break(1u);
}

void getkCADisplayOrientationRotation0_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "typeof (((typeof (kCADisplayOrientationRotation0) (*)(void))0)()) getkCADisplayOrientationRotation0(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("QuartzCoreSoftLinking.m"), 16, CFSTR("%s"), OUTLINED_FUNCTION_0_2());

  __break(1u);
}

void getkCADisplayOrientationRotation90_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "typeof (((typeof (kCADisplayOrientationRotation90) (*)(void))0)()) getkCADisplayOrientationRotation90(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("QuartzCoreSoftLinking.m"), 17, CFSTR("%s"), OUTLINED_FUNCTION_0_2());

  __break(1u);
}

void getkCADisplayOrientationRotation180_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "typeof (((typeof (kCADisplayOrientationRotation180) (*)(void))0)()) getkCADisplayOrientationRotation180(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("QuartzCoreSoftLinking.m"), 18, CFSTR("%s"), OUTLINED_FUNCTION_0_2());

  __break(1u);
}

void getkCADisplayOrientationRotation270_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "typeof (((typeof (kCADisplayOrientationRotation270) (*)(void))0)()) getkCADisplayOrientationRotation270(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("QuartzCoreSoftLinking.m"), 19, CFSTR("%s"), OUTLINED_FUNCTION_0_2());

  __break(1u);
}

void getkCADisplayModeGamutSRGB_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "typeof (((typeof (kCADisplayModeGamutSRGB) (*)(void))0)()) getkCADisplayModeGamutSRGB(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("QuartzCoreSoftLinking.m"), 20, CFSTR("%s"), OUTLINED_FUNCTION_0_2());

  __break(1u);
}

void getkCADisplayModeGamutP3_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "typeof (((typeof (kCADisplayModeGamutP3) (*)(void))0)()) getkCADisplayModeGamutP3(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("QuartzCoreSoftLinking.m"), 21, CFSTR("%s"), OUTLINED_FUNCTION_0_2());

  __break(1u);
}

void getkCADisplayModeSDR_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "typeof (((typeof (kCADisplayModeSDR) (*)(void))0)()) getkCADisplayModeSDR(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("QuartzCoreSoftLinking.m"), 22, CFSTR("%s"), OUTLINED_FUNCTION_0_2());

  __break(1u);
}

void getkCADisplayModeHDR10_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "typeof (((typeof (kCADisplayModeHDR10) (*)(void))0)()) getkCADisplayModeHDR10(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("QuartzCoreSoftLinking.m"), 23, CFSTR("%s"), OUTLINED_FUNCTION_0_2());

  __break(1u);
}

void getkCADisplayModeDolby_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "typeof (((typeof (kCADisplayModeDolby) (*)(void))0)()) getkCADisplayModeDolby(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("QuartzCoreSoftLinking.m"), 24, CFSTR("%s"), OUTLINED_FUNCTION_0_2());

  __break(1u);
}

void getkCASnapshotContextId_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "typeof (((typeof (kCASnapshotContextId) (*)(void))0)()) getkCASnapshotContextId(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("QuartzCoreSoftLinking.m"), 29, CFSTR("%s"), OUTLINED_FUNCTION_0_2());

  __break(1u);
}

void getkCASnapshotContextList_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "typeof (((typeof (kCASnapshotContextList) (*)(void))0)()) getkCASnapshotContextList(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("QuartzCoreSoftLinking.m"), 30, CFSTR("%s"), OUTLINED_FUNCTION_0_2());

  __break(1u);
}

void getkCASnapshotDisplayName_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "typeof (((typeof (kCASnapshotDisplayName) (*)(void))0)()) getkCASnapshotDisplayName(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("QuartzCoreSoftLinking.m"), 31, CFSTR("%s"), OUTLINED_FUNCTION_0_2());

  __break(1u);
}

void getkCASnapshotFormatOpaque_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "typeof (((typeof (kCASnapshotFormatOpaque) (*)(void))0)()) getkCASnapshotFormatOpaque(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("QuartzCoreSoftLinking.m"), 32, CFSTR("%s"), OUTLINED_FUNCTION_0_2());

  __break(1u);
}

void getkCASnapshotFormatWideGamut_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "typeof (((typeof (kCASnapshotFormatWideGamut) (*)(void))0)()) getkCASnapshotFormatWideGamut(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("QuartzCoreSoftLinking.m"), 33, CFSTR("%s"), OUTLINED_FUNCTION_0_2());

  __break(1u);
}

void getkCASnapshotMode_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "typeof (((typeof (kCASnapshotMode) (*)(void))0)()) getkCASnapshotMode(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("QuartzCoreSoftLinking.m"), 34, CFSTR("%s"), OUTLINED_FUNCTION_0_2());

  __break(1u);
}

void getkCASnapshotModeIncludeContextList_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "typeof (((typeof (kCASnapshotModeIncludeContextList) (*)(void))0)()) getkCASnapshotModeIncludeContextList(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("QuartzCoreSoftLinking.m"), 35, CFSTR("%s"), OUTLINED_FUNCTION_0_2());

  __break(1u);
}

void getkCASnapshotOriginX_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "typeof (((typeof (kCASnapshotOriginX) (*)(void))0)()) getkCASnapshotOriginX(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("QuartzCoreSoftLinking.m"), 36, CFSTR("%s"), OUTLINED_FUNCTION_0_2());

  __break(1u);
}

void getkCASnapshotOriginY_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "typeof (((typeof (kCASnapshotOriginY) (*)(void))0)()) getkCASnapshotOriginY(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("QuartzCoreSoftLinking.m"), 37, CFSTR("%s"), OUTLINED_FUNCTION_0_2());

  __break(1u);
}

void getkCASnapshotSizeHeight_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "typeof (((typeof (kCASnapshotSizeHeight) (*)(void))0)()) getkCASnapshotSizeHeight(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("QuartzCoreSoftLinking.m"), 38, CFSTR("%s"), OUTLINED_FUNCTION_0_2());

  __break(1u);
}

void getkCASnapshotSizeWidth_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "typeof (((typeof (kCASnapshotSizeWidth) (*)(void))0)()) getkCASnapshotSizeWidth(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("QuartzCoreSoftLinking.m"), 39, CFSTR("%s"), OUTLINED_FUNCTION_0_2());

  __break(1u);
}

void getkCASnapshotTransform_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "typeof (((typeof (kCASnapshotTransform) (*)(void))0)()) getkCASnapshotTransform(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("QuartzCoreSoftLinking.m"), 40, CFSTR("%s"), OUTLINED_FUNCTION_0_2());

  __break(1u);
}

void getkCASnapshotMapCacheAttribute_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "typeof (((typeof (kCASnapshotMapCacheAttribute) (*)(void))0)()) getkCASnapshotMapCacheAttribute(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("QuartzCoreSoftLinking.m"), 42, CFSTR("%s"), OUTLINED_FUNCTION_0_2());

  __break(1u);
}

void soft_CARenderServerCreateSnapshots_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_Bool soft_CARenderServerCreateSnapshots(mach_port_t, IOSurfaceRef *, IOSurfaceRef *, NSDictionary *__strong)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("QuartzCoreSoftLinking.m"), 49, CFSTR("%s"), OUTLINED_FUNCTION_0_2());

  __break(1u);
}

uint64_t BKLogDisplay()
{
  return MEMORY[0x1E0D008B0]();
}

uint64_t BKSDisplayServicesGetExternalDisplayScale()
{
  return MEMORY[0x1E0D00998]();
}

uint64_t BSAtomicGetFlag()
{
  return off_1E38E9958();
}

uint64_t BSAtomicSetFlag()
{
  return off_1E38E9960();
}

uint64_t BSContinuousMachTimeNow()
{
  return off_1E38E9968();
}

uint64_t BSCreateDeserializedArrayFromXPCDictionaryWithKey()
{
  return off_1E38E9970();
}

uint64_t BSCreateDeserializedBSXPCEncodableObjectFromXPCDictionary()
{
  return off_1E38E9978();
}

uint64_t BSCreateDeserializedBSXPCEncodableObjectFromXPCDictionaryWithKey()
{
  return off_1E38E9980();
}

uint64_t BSCreateDeserializedCFValueFromXPCDictionaryWithKey()
{
  return off_1E38E9988();
}

uint64_t BSCreateDeserializedNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey()
{
  return off_1E38E9990();
}

uint64_t BSCreateDeserializedSetOfBSXPCEncodableObjectsFromXPCDictionaryWithKey()
{
  return off_1E38E9998();
}

uint64_t BSCreateDeserializedStringFromXPCDictionaryWithKey()
{
  return off_1E38E99A0();
}

uint64_t BSCreateSerializedBSXPCEncodableObject()
{
  return off_1E38E99A8();
}

uint64_t BSDeserializeArrayOfBSXPCEncodableObjectsFromXPCDictionaryWithKey()
{
  return off_1E38E99B0();
}

uint64_t BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey()
{
  return off_1E38E99B8();
}

uint64_t BSDeserializeCFValueFromXPCDictionaryWithKey()
{
  return off_1E38E99C0();
}

uint64_t BSDeserializeCGFloatFromXPCDictionaryWithKey()
{
  return off_1E38E99C8();
}

uint64_t BSDeserializeCGRectFromXPCDictionaryWithKey()
{
  return off_1E38E99D0();
}

uint64_t BSDeserializeCGRectFromXPCObject()
{
  return off_1E38E99D8();
}

uint64_t BSDeserializeCGSizeFromXPCDictionaryWithKey()
{
  return off_1E38E99E0();
}

uint64_t BSDeserializeCGSizeFromXPCObject()
{
  return off_1E38E99E8();
}

uint64_t BSDeserializeDataFromXPCDictionaryWithKey()
{
  return off_1E38E99F0();
}

uint64_t BSDeserializeDoubleFromXPCDictionaryWithKey()
{
  return off_1E38E99F8();
}

uint64_t BSDeserializeNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey()
{
  return off_1E38E9A00();
}

uint64_t BSDeserializeSetOfBSXPCEncodableObjectsFromXPCDictionaryWithKey()
{
  return off_1E38E9A08();
}

uint64_t BSDeserializeStringFromXPCDictionaryWithKey()
{
  return off_1E38E9A10();
}

uint64_t BSDispatchBlockCreateWithCurrentQualityOfService()
{
  return off_1E38E9A18();
}

uint64_t BSDispatchMain()
{
  return off_1E38E9A20();
}

uint64_t BSDispatchQueueAssert()
{
  return off_1E38E9A28();
}

uint64_t BSDispatchQueueAssertMain()
{
  return off_1E38E9A30();
}

uint64_t BSDispatchQueueAssertNot()
{
  return off_1E38E9A38();
}

uint64_t BSDispatchQueueCreate()
{
  return off_1E38E9A40();
}

uint64_t BSDispatchQueueCreateSerial()
{
  return off_1E38E9A48();
}

uint64_t BSDispatchQueueCreateSerialWithQoS()
{
  return off_1E38E9A50();
}

uint64_t BSDispatchQueueCreateWithQualityOfService()
{
  return off_1E38E9A58();
}

uint64_t BSEqualBools()
{
  return off_1E38E9A60();
}

uint64_t BSEqualObjects()
{
  return off_1E38E9A68();
}

uint64_t BSEqualStrings()
{
  return off_1E38E9A70();
}

uint64_t BSFloatEqualToFloat()
{
  return off_1E38E9A80();
}

uint64_t BSFloatGreaterThanFloat()
{
  return off_1E38E9A88();
}

uint64_t BSFloatGreaterThanOrEqualToFloat()
{
  return off_1E38E9A90();
}

uint64_t BSFloatIsOne()
{
  return off_1E38E9A98();
}

uint64_t BSFloatIsZero()
{
  return off_1E38E9AA0();
}

uint64_t BSFloatLessThanFloat()
{
  return off_1E38E9AA8();
}

uint64_t BSFloatLessThanOrEqualToFloat()
{
  return off_1E38E9AB0();
}

uint64_t BSInterfaceOrientationDescription()
{
  return off_1E38E9AB8();
}

uint64_t BSInterfaceOrientationIsLandscape()
{
  return off_1E38E9AC0();
}

uint64_t BSLogAddStateCaptureBlockWithTitle()
{
  return off_1E38E9AC8();
}

uint64_t BSModificationDateForPath()
{
  return off_1E38E9AD0();
}

uint64_t BSNSStringFromCGRect()
{
  return off_1E38E9AD8();
}

uint64_t BSNSStringFromCGSize()
{
  return off_1E38E9AE0();
}

uint64_t BSObjCClassCreate()
{
  return off_1E38E9AE8();
}

uint64_t BSOrientationRotationDirectionDescription()
{
  return off_1E38E9AF0();
}

uint64_t BSRectEqualToRect()
{
  return off_1E38E9AF8();
}

uint64_t BSRectFromValue()
{
  return off_1E38E9B00();
}

uint64_t BSRectGetCenter()
{
  return off_1E38E9B08();
}

uint64_t BSRectWithSize()
{
  return off_1E38E9B10();
}

uint64_t BSSelfTaskHasEntitlement()
{
  return off_1E38E9B18();
}

uint64_t BSSerializeArrayOfBSXPCEncodableObjectsToXPCDictionaryWithKey()
{
  return off_1E38E9B20();
}

uint64_t BSSerializeArrayToXPCDictionaryWithKey()
{
  return off_1E38E9B28();
}

uint64_t BSSerializeBSXPCEncodableObjectToXPCDictionary()
{
  return off_1E38E9B30();
}

uint64_t BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey()
{
  return off_1E38E9B38();
}

uint64_t BSSerializeCFValueToXPCDictionaryWithKey()
{
  return off_1E38E9B40();
}

uint64_t BSSerializeCGFloatToXPCDictionaryWithKey()
{
  return off_1E38E9B48();
}

uint64_t BSSerializeCGRectToXPCDictionaryWithKey()
{
  return off_1E38E9B50();
}

uint64_t BSSerializeCGSizeToXPCDictionaryWithKey()
{
  return off_1E38E9B58();
}

uint64_t BSSerializeDataToXPCDictionaryWithKey()
{
  return off_1E38E9B60();
}

uint64_t BSSerializeDoubleToXPCDictionaryWithKey()
{
  return off_1E38E9B68();
}

uint64_t BSSerializeNSSecureEncodableObjectToXPCDictionaryWithKey()
{
  return off_1E38E9B70();
}

uint64_t BSSerializeSetOfBSXPCEncodableObjectsToXPCDictionaryWithKey()
{
  return off_1E38E9B78();
}

uint64_t BSSerializeStringToXPCDictionaryWithKey()
{
  return off_1E38E9B80();
}

uint64_t BSSettingFlagForBool()
{
  return off_1E38E9B88();
}

uint64_t BSSettingFlagIfYes()
{
  return off_1E38E9B90();
}

uint64_t BSSettingFlagIsYes()
{
  return off_1E38E9B98();
}

uint64_t BSSettingForKey()
{
  return off_1E38E9BA0();
}

uint64_t BSSettingsDiffIsEmpty()
{
  return off_1E38E9BA8();
}

uint64_t BSSettingsEqualToSettings()
{
  return off_1E38E9BB0();
}

uint64_t BSSettingsIsEmpty()
{
  return off_1E38E9BB8();
}

uint64_t BSSizeEqualToSize()
{
  return off_1E38E9BC0();
}

uint64_t BSSizeFromValue()
{
  return off_1E38E9BC8();
}

uint64_t BSStringFromBOOL()
{
  return off_1E38E9BD0();
}

uint64_t BSValueWithRect()
{
  return off_1E38E9BD8();
}

uint64_t BSValueWithSize()
{
  return off_1E38E9BE0();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
  MEMORY[0x1E0C988F0](center, observer);
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x1E0C98900](center, observer, name, object);
}

CFPropertyListRef CFPropertyListCreateDeepCopy(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFOptionFlags mutabilityOption)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98AB0](allocator, propertyList, mutabilityOption);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98BF8](rl, source, mode);
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x1E0C98C40]();
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x1E0C98CC8](allocator, order, context);
}

void CFRunLoopSourceInvalidate(CFRunLoopSourceRef source)
{
  MEMORY[0x1E0C98CE0](source);
}

void CFRunLoopSourceSignal(CFRunLoopSourceRef source)
{
  MEMORY[0x1E0C98CF0](source);
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
  MEMORY[0x1E0C98D68](rl);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x1E0C9CDA0](image);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D570]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D580]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D588]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1E0C9D608]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsInfinite(CGRect rect)
{
  return MEMORY[0x1E0C9D610]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1E0C9D618]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSArray *__cdecl NSAllMapTableKeys(NSMapTable *table)
{
  return (NSArray *)MEMORY[0x1E0CB2850](table);
}

NSArray *__cdecl NSAllMapTableValues(NSMapTable *table)
{
  return (NSArray *)MEMORY[0x1E0CB2858](table);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

void *__cdecl NSMapGet(NSMapTable *table, const void *key)
{
  return (void *)MEMORY[0x1E0CB2DA0](table, key);
}

void NSMapInsert(NSMapTable *table, const void *key, const void *value)
{
  MEMORY[0x1E0CB2DA8](table, key, value);
}

Protocol *__cdecl NSProtocolFromString(NSString *namestr)
{
  return (Protocol *)MEMORY[0x1E0CB3118](namestr);
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x1E0CB3158]();
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1E0CB3190](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return (NSString *)MEMORY[0x1E0CB3218](proto);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

uint64_t _BSIsInternalInstall()
{
  return off_1E38EA310();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _NSIsNSValue()
{
  return MEMORY[0x1E0C9A8C0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

uint64_t _bs_set_crash_log_message()
{
  return off_1E38EA370();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x1E0C81570]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return MEMORY[0x1E0DE7A50](cls, name, imp, types);
}

uint64_t class_addMethodsBulk()
{
  return MEMORY[0x1E0DE7A58]();
}

BOOL class_addProtocol(Class cls, Protocol *protocol)
{
  return MEMORY[0x1E0DE7A60](cls, protocol);
}

Method *__cdecl class_copyMethodList(Class cls, unsigned int *outCount)
{
  return (Method *)MEMORY[0x1E0DE7A78](cls, outCount);
}

objc_property_t *__cdecl class_copyPropertyList(Class cls, unsigned int *outCount)
{
  return (objc_property_t *)MEMORY[0x1E0DE7A80](cls, outCount);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1E0DE7AA8](cls, name);
}

IMP class_getMethodImplementation(Class cls, SEL name)
{
  return (IMP)MEMORY[0x1E0DE7AC0](cls, name);
}

Class class_getSuperclass(Class cls)
{
  return (Class)MEMORY[0x1E0DE7AD8](cls);
}

IMP class_replaceMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return (IMP)MEMORY[0x1E0DE7AF0](cls, name, imp, types);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
  MEMORY[0x1E0C82BD8](iterations, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_assert_queue_barrier(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BF0](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C08](queue, block);
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C48](queue, block);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C60](flags, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

int dlclose(void *__handle)
{
  return MEMORY[0x1E0C83030](__handle);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

uint64_t dyld_image_header_containing_address()
{
  return MEMORY[0x1E0C830F8]();
}

uint64_t dyld_image_path_containing_address()
{
  return MEMORY[0x1E0C83100]();
}

void exit(int a1)
{
  MEMORY[0x1E0C83278](*(_QWORD *)&a1);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

IMP imp_implementationWithBlock(id block)
{
  return (IMP)MEMORY[0x1E0DE7B10](block);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1E0C83A20]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

objc_method_description *__cdecl method_getDescription(Method m)
{
  return (objc_method_description *)MEMORY[0x1E0DE7B60](m);
}

IMP method_getImplementation(Method m)
{
  return (IMP)MEMORY[0x1E0DE7B68](m);
}

SEL method_getName(Method m)
{
  return (SEL)MEMORY[0x1E0DE7B70](m);
}

const char *__cdecl method_getTypeEncoding(Method m)
{
  return (const char *)MEMORY[0x1E0DE7B88](m);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x1E0DE7C98]();
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x1E0DE7FF8](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

void os_unfair_lock_assert_not_owner(const os_unfair_lock *lock)
{
  MEMORY[0x1E0C84988](lock);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x1E0C84990](lock);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

const char *__cdecl property_getName(objc_property_t property)
{
  return (const char *)MEMORY[0x1E0DE8070](property);
}

SEL sel_registerName(const char *str)
{
  return (SEL)MEMORY[0x1E0DE80E8](str);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x1E0C85F00](xBOOL);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C86260](xdict, key);
}

double xpc_dictionary_get_double(xpc_object_t xdict, const char *key)
{
  double result;

  MEMORY[0x1E0C86298](xdict, key);
  return result;
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862A0](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862D0](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C862E0](xdict, key);
}

uint64_t xpc_dictionary_handoff_reply()
{
  return MEMORY[0x1E0C862F0]();
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x1E0C86310](xdict, key, value);
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
  MEMORY[0x1E0C86348](xdict, key, value);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x1E0C86360](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x1E0C86390](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x1E0C86398](xdict, key, value);
}

double xpc_double_get_value(xpc_object_t xdouble)
{
  double result;

  MEMORY[0x1E0C863E0](xdouble);
  return result;
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x1E0C86570](xint);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1E0C86720](string);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1E0C86758](xstring);
}

