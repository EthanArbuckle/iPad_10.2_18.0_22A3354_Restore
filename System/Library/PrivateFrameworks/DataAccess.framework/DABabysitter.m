@implementation DABabysitter

+ (id)sharedBabysitter
{
  if (sharedBabysitter_onceToken != -1)
    dispatch_once(&sharedBabysitter_onceToken, &__block_literal_global_15);
  return (id)sharedBabysitter_sBabysitter;
}

void __32__DABabysitter_sharedBabysitter__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[DABabysitter _init]([DABabysitter alloc], "_init");
  v1 = (void *)sharedBabysitter_sBabysitter;
  sharedBabysitter_sBabysitter = (uint64_t)v0;

}

- (void)_reloadBabysitterProperties
{
  NSString *v3;
  NSString *buildVersion;
  CFPropertyListRef v5;
  NSObject *v6;
  os_log_type_t v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *refreshingWaiters;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  CFPropertyListRef v18;
  void *v19;
  NSMutableDictionary *v20;
  NSMutableDictionary *failedWaiters;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  uint64_t v27;
  void *v28;
  void *v29;
  NSMutableDictionary *v30;
  CFPropertyListRef v31;
  void *v32;
  NSMutableDictionary *v33;
  NSMutableDictionary *restrictedWaiters;
  os_log_type_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t k;
  uint64_t v45;
  void *v46;
  void *v47;
  NSObject *v48;
  int v49;
  DABabysitter *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t m;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  NSMutableDictionary *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t n;
  uint64_t v78;
  void *v79;
  void *v80;
  int v81;
  NSObject *v82;
  _BOOL4 v83;
  int v84;
  NSObject *v85;
  os_log_type_t v86;
  const char *v87;
  int v88;
  NSObject *v89;
  os_log_type_t v90;
  NSMutableDictionary *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  id obj;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  DABabysitter *v103;
  uint64_t v104;
  os_log_type_t type[8];
  os_log_type_t typea[8];
  os_log_type_t typeb;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  _BYTE v136[128];
  _QWORD v137[2];
  _QWORD v138[2];
  const __CFString *v139;
  uint64_t v140;
  _BYTE v141[128];
  uint8_t v142[128];
  uint8_t buf[4];
  _BYTE v144[14];
  __int16 v145;
  uint64_t v146;
  _BYTE v147[128];
  _BYTE v148[128];
  _BYTE v149[128];
  _BYTE v150[128];
  uint64_t v151;

  v151 = *MEMORY[0x1E0C80C00];
  if (DAIsRunningInDataAccessD())
  {
    CFPreferencesAppSynchronize(CFSTR("com.apple.dataaccess.babysitter"));
    v3 = (NSString *)MGCopyAnswer();
    buildVersion = self->_buildVersion;
    self->_buildVersion = v3;

    v5 = CFPreferencesCopyAppValue(CFSTR("LastSystemVersion"), CFSTR("com.apple.dataaccess.babysitter"));
    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && !-[NSString isEqualToString:](self->_buildVersion, "isEqualToString:", v5))
      {
        DALoggingwithCategory();
        v6 = objc_claimAutoreleasedReturnValue();
        v7 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 6);
        if (os_log_type_enabled(v6, v7))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B51E4000, v6, v7, "Babysitter: The OS version is different. Giving all accounts a second chance at life.", buf, 2u);
        }

        CFPreferencesSetAppValue(CFSTR("LastSystemVersion"), 0, CFSTR("com.apple.dataaccess.babysitter"));
        CFPreferencesSetAppValue(CFSTR("RestrictedWaiters"), 0, CFSTR("com.apple.dataaccess.babysitter"));
        CFPreferencesSetAppValue(CFSTR("RefreshingWaiters"), 0, CFSTR("com.apple.dataaccess.babysitter"));
        CFPreferencesSetAppValue(CFSTR("FailedWaiters"), 0, CFSTR("com.apple.dataaccess.babysitter"));
        CFPreferencesAppSynchronize(CFSTR("com.apple.dataaccess.babysitter"));
      }
    }
    v8 = (NSMutableDictionary *)objc_opt_new();
    refreshingWaiters = self->_refreshingWaiters;
    self->_refreshingWaiters = v8;

    v103 = self;
    v95 = (void *)CFPreferencesCopyAppValue(CFSTR("RefreshingWaiters"), CFSTR("com.apple.dataaccess.babysitter"));
    if (v95)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v134 = 0u;
        v135 = 0u;
        v132 = 0u;
        v133 = 0u;
        objc_msgSend(v95, "allKeys");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v132, v150, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v133;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v133 != v13)
                objc_enumerationMutation(v10);
              v15 = *(_QWORD *)(*((_QWORD *)&v132 + 1) + 8 * i);
              objc_msgSend(v95, "objectForKeyedSubscript:", v15);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v17 = (void *)objc_msgSend(v16, "mutableCopy");
                -[NSMutableDictionary setObject:forKeyedSubscript:](v103->_refreshingWaiters, "setObject:forKeyedSubscript:", v17, v15);

              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v132, v150, 16);
          }
          while (v12);
        }

        self = v103;
      }
    }
    v18 = CFPreferencesCopyAppValue(CFSTR("FailedWaiters"), CFSTR("com.apple.dataaccess.babysitter"));
    v94 = (void *)v18;
    if (v18 && (v19 = (void *)v18, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v20 = (NSMutableDictionary *)objc_opt_new();
      failedWaiters = self->_failedWaiters;
      self->_failedWaiters = v20;

      v130 = 0u;
      v131 = 0u;
      v128 = 0u;
      v129 = 0u;
      objc_msgSend(v19, "allKeys");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v128, v149, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v129;
        do
        {
          for (j = 0; j != v24; ++j)
          {
            if (*(_QWORD *)v129 != v25)
              objc_enumerationMutation(v22);
            v27 = *(_QWORD *)(*((_QWORD *)&v128 + 1) + 8 * j);
            objc_msgSend(v19, "objectForKeyedSubscript:", v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v29 = (void *)objc_msgSend(v28, "mutableCopy");
              -[NSMutableDictionary setObject:forKeyedSubscript:](v103->_failedWaiters, "setObject:forKeyedSubscript:", v29, v27);

              v19 = v94;
            }

          }
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v128, v149, 16);
        }
        while (v24);
        self = v103;
      }
    }
    else
    {
      v30 = (NSMutableDictionary *)objc_opt_new();
      v22 = self->_failedWaiters;
      self->_failedWaiters = v30;
    }

    v31 = CFPreferencesCopyAppValue(CFSTR("RestrictedWaiters"), CFSTR("com.apple.dataaccess.babysitter"));
    v92 = (void *)v31;
    if (v31 && (v32 = (void *)v31, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v33 = (NSMutableDictionary *)objc_msgSend(v32, "mutableCopy");
    else
      v33 = (NSMutableDictionary *)objc_opt_new();
    restrictedWaiters = self->_restrictedWaiters;
    self->_restrictedWaiters = v33;
    v93 = (void *)v5;

    v126 = 0u;
    v127 = 0u;
    v124 = 0u;
    v125 = 0u;
    -[NSMutableDictionary allKeys](self->_refreshingWaiters, "allKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v99 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v124, v148, 16);
    if (v99)
    {
      v97 = *(_QWORD *)v125;
      v35 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 6);
      do
      {
        v36 = 0;
        do
        {
          if (*(_QWORD *)v125 != v97)
            objc_enumerationMutation(obj);
          v101 = v36;
          v37 = *(_QWORD *)(*((_QWORD *)&v124 + 1) + 8 * v36);
          -[NSMutableDictionary objectForKeyedSubscript:](v103->_refreshingWaiters, "objectForKeyedSubscript:", v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)type = v37;
          -[NSMutableDictionary objectForKeyedSubscript:](v103->_failedWaiters, "objectForKeyedSubscript:", v37);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v39)
          {
            objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKeyedSubscript:](v103->_failedWaiters, "setObject:forKeyedSubscript:", v39, v37);
          }
          v122 = 0u;
          v123 = 0u;
          v120 = 0u;
          v121 = 0u;
          v40 = v38;
          v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v120, v147, 16);
          if (v41)
          {
            v42 = v41;
            v43 = *(_QWORD *)v121;
            do
            {
              for (k = 0; k != v42; ++k)
              {
                if (*(_QWORD *)v121 != v43)
                  objc_enumerationMutation(v40);
                v45 = *(_QWORD *)(*((_QWORD *)&v120 + 1) + 8 * k);
                objc_msgSend(v39, "objectForKeyedSubscript:", v45);
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v46, "intValue") + 1);
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v39, "setObject:forKeyedSubscript:", v47, v45);
                DALoggingwithCategory();
                v48 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v48, v35))
                {
                  v49 = objc_msgSend(v46, "intValue");
                  *(_DWORD *)buf = 138412802;
                  *(_QWORD *)v144 = *(_QWORD *)type;
                  *(_WORD *)&v144[8] = 1024;
                  *(_DWORD *)&v144[10] = v49;
                  v145 = 2112;
                  v146 = v45;
                  _os_log_impl(&dword_1B51E4000, v48, v35, "Babysitter: Noting that waiter %@ failed %d times for operation %@", buf, 0x1Cu);
                }

              }
              v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v120, v147, 16);
            }
            while (v42);
          }

          v36 = v101 + 1;
        }
        while (v101 + 1 != v99);
        v99 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v124, v148, 16);
      }
      while (v99);
    }

    v118 = 0u;
    v119 = 0u;
    v116 = 0u;
    v117 = 0u;
    v50 = v103;
    -[NSMutableDictionary allKeys](v103->_failedWaiters, "allKeys");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v116, v142, 16);
    if (v51)
    {
      v52 = v51;
      v53 = *(_QWORD *)v117;
      v98 = *(_QWORD *)v117;
      do
      {
        v54 = 0;
        v100 = v52;
        do
        {
          if (*(_QWORD *)v117 != v53)
            objc_enumerationMutation(v102);
          *(_QWORD *)typea = *(_QWORD *)(*((_QWORD *)&v116 + 1) + 8 * v54);
          -[NSMutableDictionary objectForKeyedSubscript:](v50->_failedWaiters, "objectForKeyedSubscript:");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v104 = v54;
            v114 = 0u;
            v115 = 0u;
            v112 = 0u;
            v113 = 0u;
            objc_msgSend(v55, "allKeys");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v112, v141, 16);
            if (v57)
            {
              v58 = v57;
              v59 = *(_QWORD *)v113;
              do
              {
                for (m = 0; m != v58; ++m)
                {
                  if (*(_QWORD *)v113 != v59)
                    objc_enumerationMutation(v56);
                  v61 = *(_QWORD *)(*((_QWORD *)&v112 + 1) + 8 * m);
                  objc_msgSend(v55, "objectForKeyedSubscript:", v61);
                  v62 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v63 = objc_msgSend(v62, "intValue");
                    if ((int)v63 >= 3)
                    {
                      v64 = v63;
                      -[NSMutableDictionary objectForKeyedSubscript:](v50->_restrictedWaiters, "objectForKeyedSubscript:", *(_QWORD *)typea);
                      v65 = (void *)objc_claimAutoreleasedReturnValue();

                      if (!v65)
                      {
                        v139 = CFSTR("failedOp");
                        v140 = v61;
                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v140, &v139, 1);
                        v66 = (void *)objc_claimAutoreleasedReturnValue();
                        AnalyticsSendEvent();

                        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", (double)(arc4random() % 0x384 + 3598 * (_DWORD)v64));
                        v67 = (void *)objc_claimAutoreleasedReturnValue();
                        if ((objc_msgSend(MEMORY[0x1E0D1C3E8], "babysitterEnabled") & 1) == 0)
                        {
                          objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
                          v68 = objc_claimAutoreleasedReturnValue();

                          v67 = (void *)v68;
                        }
                        v137[0] = CFSTR("RestrictionTimeout");
                        v69 = (void *)MEMORY[0x1E0CB37E8];
                        objc_msgSend(v67, "timeIntervalSinceReferenceDate");
                        objc_msgSend(v69, "numberWithDouble:");
                        v70 = (void *)objc_claimAutoreleasedReturnValue();
                        v138[0] = v70;
                        v137[1] = CFSTR("NumFailures");
                        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v64);
                        v71 = (void *)objc_claimAutoreleasedReturnValue();
                        v138[1] = v71;
                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v138, v137, 2);
                        v72 = (void *)objc_claimAutoreleasedReturnValue();

                        -[NSMutableDictionary setValue:forKey:](v103->_restrictedWaiters, "setValue:forKey:", v72, *(_QWORD *)typea);
                        v50 = v103;

                      }
                    }
                  }

                }
                v58 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v112, v141, 16);
              }
              while (v58);
            }

            v53 = v98;
            v52 = v100;
            v54 = v104;
          }

          ++v54;
        }
        while (v54 != v52);
        v52 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v116, v142, 16);
      }
      while (v52);
    }

    v110 = 0u;
    v111 = 0u;
    v108 = 0u;
    v109 = 0u;
    v73 = v50->_restrictedWaiters;
    v74 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v73, "countByEnumeratingWithState:objects:count:", &v108, v136, 16);
    if (v74)
    {
      v75 = v74;
      v76 = *(_QWORD *)v109;
      typeb = *(_BYTE *)(MEMORY[0x1E0D1C448] + 3);
      do
      {
        for (n = 0; n != v75; ++n)
        {
          if (*(_QWORD *)v109 != v76)
            objc_enumerationMutation(v73);
          v78 = *(_QWORD *)(*((_QWORD *)&v108 + 1) + 8 * n);
          -[NSMutableDictionary objectForKeyedSubscript:](v103->_restrictedWaiters, "objectForKeyedSubscript:", v78);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v79, "objectForKeyedSubscript:", CFSTR("NumFailures"));
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v81 = objc_msgSend(MEMORY[0x1E0D1C3E8], "babysitterEnabled");
              DALoggingwithCategory();
              v82 = objc_claimAutoreleasedReturnValue();
              v83 = os_log_type_enabled(v82, typeb);
              if (v81)
              {
                if (v83)
                {
                  v84 = objc_msgSend(v80, "intValue");
                  *(_DWORD *)buf = 67109378;
                  *(_DWORD *)v144 = v84;
                  *(_WORD *)&v144[4] = 2112;
                  *(_QWORD *)&v144[6] = v78;
                  v85 = v82;
                  v86 = typeb;
                  v87 = "===================\n"
                        "\n"
                        "\n"
                        "\n"
                        "Babysitter: You're once, twice, %d times a failure. Disabling account with ID %@ until it stops "
                        "crashing. Please file a bug for any dataaccessd crashes you find.\n"
                        "\n"
                        "\n"
                        "===================\n";
                  goto LABEL_89;
                }
              }
              else if (v83)
              {
                v88 = objc_msgSend(v80, "intValue");
                *(_DWORD *)buf = 138412546;
                *(_QWORD *)v144 = v78;
                *(_WORD *)&v144[8] = 1024;
                *(_DWORD *)&v144[10] = v88;
                v85 = v82;
                v86 = typeb;
                v87 = "===================\n"
                      "\n"
                      "\n"
                      "\n"
                      "Babysitter: Waiter %@ has crashed %d times now. Since you have the babysitter disabled, we're goin"
                      "g to assume you know what you're doing and not disable the waiter. Consider yourself warned.\n"
                      "\n"
                      "\n"
                      "===================\n";
LABEL_89:
                _os_log_impl(&dword_1B51E4000, v85, v86, v87, buf, 0x12u);
              }

            }
          }

        }
        v75 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v73, "countByEnumeratingWithState:objects:count:", &v108, v136, 16);
      }
      while (v75);
    }

    -[NSMutableDictionary removeAllObjects](v103->_refreshingWaiters, "removeAllObjects");
    if (-[NSMutableDictionary count](v103->_restrictedWaiters, "count"))
    {
      DALoggingwithCategory();
      v89 = objc_claimAutoreleasedReturnValue();
      v90 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 6);
      if (os_log_type_enabled(v89, v90))
      {
        v91 = v103->_restrictedWaiters;
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v144 = v91;
        _os_log_impl(&dword_1B51E4000, v89, v90, "Restricted accounts are: %@", buf, 0xCu);
      }

    }
    CFPreferencesSetAppValue(CFSTR("LastSystemVersion"), v103->_buildVersion, CFSTR("com.apple.dataaccess.babysitter"));
    CFPreferencesSetAppValue(CFSTR("RefreshingWaiters"), v103->_refreshingWaiters, CFSTR("com.apple.dataaccess.babysitter"));
    CFPreferencesSetAppValue(CFSTR("FailedWaiters"), v103->_failedWaiters, CFSTR("com.apple.dataaccess.babysitter"));
    CFPreferencesSetAppValue(CFSTR("RestrictedWaiters"), v103->_restrictedWaiters, CFSTR("com.apple.dataaccess.babysitter"));
    CFPreferencesAppSynchronize(CFSTR("com.apple.dataaccess.babysitter"));

  }
}

- (id)_init
{
  DABabysitter *v2;
  DABabysitter *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DABabysitter;
  v2 = -[DABabysitter init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[DABabysitter _reloadBabysitterProperties](v2, "_reloadBabysitterProperties");
    objc_msgSend(MEMORY[0x1E0D0C2E0], "addObserver:selector:name:", v3, sel__reloadBabysitterProperties, CFSTR("DataAccessBabysitterPrefsChanged"));
  }
  return v3;
}

- (DABabysitter)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DABabysitter.m"), 187, CFSTR("Use the shared babysitter, jerk."));

  return 0;
}

- (void)_incrementRefreshCountForWaiterID:(id)a3 operationName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  os_log_type_t v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_refreshingWaiters, "objectForKeyedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_refreshingWaiters, "setObject:forKeyedSubscript:", v8, v6);
    }
    objc_msgSend(v8, "objectForKeyedSubscript:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v9, "intValue") + 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    DALoggingwithCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 7);
    if (os_log_type_enabled(v11, v12))
    {
      v13 = 138412802;
      v14 = v6;
      v15 = 2112;
      v16 = v7;
      v17 = 1024;
      v18 = objc_msgSend(v10, "intValue");
      _os_log_impl(&dword_1B51E4000, v11, v12, "Babysitter: Marking waiter %@ as performing operation \"%@\" (attempt #%d)", (uint8_t *)&v13, 0x1Cu);
    }

    objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, v7);
    CFPreferencesSetAppValue(CFSTR("RefreshingWaiters"), self->_refreshingWaiters, CFSTR("com.apple.dataaccess.babysitter"));
    CFPreferencesAppSynchronize(CFSTR("com.apple.dataaccess.babysitter"));

  }
}

- (void)_decrementRefreshCountForWaiter:(id)a3 forOperationWithName:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_refreshingWaiters, "objectForKeyedSubscript:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((int)objc_msgSend(v9, "intValue") < 2)
    {
      objc_msgSend(v8, "removeObjectForKey:", v6);
      -[NSMutableDictionary objectForKeyedSubscript:](self->_failedWaiters, "objectForKeyedSubscript:", v13);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((int)objc_msgSend(v11, "intValue") < 2)
      {
        objc_msgSend(v10, "removeObjectForKey:", v6);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v11, "intValue") - 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, v6);

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v9, "intValue") - 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, v6);
    }

  }
}

- (void)_decrementRefreshCountForWaiterID:(id)a3 operationName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  os_log_type_t v10;
  _BOOL4 v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_refreshingWaiters, "objectForKeyedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    DALoggingwithCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 7);
    v11 = os_log_type_enabled(v9, v10);
    if (v7)
    {
      if (v11)
      {
        *(_DWORD *)buf = 138412546;
        v24 = v7;
        v25 = 2112;
        v26 = v6;
        _os_log_impl(&dword_1B51E4000, v9, v10, "Babysitter: Decrementing refresh count for operation \"%@\" on account %@", buf, 0x16u);
      }

      -[DABabysitter _decrementRefreshCountForWaiter:forOperationWithName:](self, "_decrementRefreshCountForWaiter:forOperationWithName:", v6, v7);
    }
    else
    {
      if (v11)
      {
        *(_DWORD *)buf = 138412290;
        v24 = v6;
        _os_log_impl(&dword_1B51E4000, v9, v10, "Babysitter: Decrementing refresh count for all operations on account %@", buf, 0xCu);
      }

      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      objc_msgSend(v8, "allKeys", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v20;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v20 != v15)
              objc_enumerationMutation(v12);
            -[DABabysitter _decrementRefreshCountForWaiter:forOperationWithName:](self, "_decrementRefreshCountForWaiter:forOperationWithName:", v6, *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i));
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        }
        while (v14);
      }

    }
    if (!objc_msgSend(v8, "count"))
      -[NSMutableDictionary removeObjectForKey:](self->_refreshingWaiters, "removeObjectForKey:", v6);
    -[NSMutableDictionary objectForKeyedSubscript:](self->_failedWaiters, "objectForKeyedSubscript:", v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "count");

    if (!v18)
      -[NSMutableDictionary removeObjectForKey:](self->_failedWaiters, "removeObjectForKey:", v6);
    CFPreferencesSetAppValue(CFSTR("RefreshingWaiters"), self->_refreshingWaiters, CFSTR("com.apple.dataaccess.babysitter"));
    CFPreferencesSetAppValue(CFSTR("FailedWaiters"), self->_failedWaiters, CFSTR("com.apple.dataaccess.babysitter"));
    CFPreferencesAppSynchronize(CFSTR("com.apple.dataaccess.babysitter"));

  }
}

- (BOOL)registerAccount:(id)a3 forOperationWithName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;

  v6 = a3;
  v7 = a4;
  if (DAIsRunningInDataAccessD())
  {
    if (!-[DABabysitter accountShouldContinue:](self, "accountShouldContinue:", v6))
    {
      v9 = 0;
      goto LABEL_6;
    }
    objc_msgSend(v6, "waiterID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DABabysitter _incrementRefreshCountForWaiterID:operationName:](self, "_incrementRefreshCountForWaiterID:operationName:", v8, v7);

  }
  v9 = 1;
LABEL_6:

  return v9;
}

- (void)unregisterAccount:(id)a3 forOperationWithName:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (DAIsRunningInDataAccessD()
    && -[DABabysitter accountShouldContinue:](self, "accountShouldContinue:", v8))
  {
    objc_msgSend(v8, "waiterID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[DABabysitter _decrementRefreshCountForWaiterID:operationName:](self, "_decrementRefreshCountForWaiterID:operationName:", v7, v6);

  }
}

- (BOOL)accountWithIDShouldContinue:(id)a3
{
  id v4;
  int v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  NSObject *v15;
  os_log_type_t v16;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = DAIsRunningInDataAccessD();
  v6 = 1;
  if (v4 && v5)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_restrictedWaiters, "objectForKeyedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("RestrictionTimeout"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "doubleValue");
      objc_msgSend(v9, "dateWithTimeIntervalSinceReferenceDate:");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "timeIntervalSinceDate:", v11);
      v14 = v13;

      v6 = v14 >= 0.0;
      if (v14 >= 0.0)
      {
        DALoggingwithCategory();
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 4);
        if (os_log_type_enabled(v15, v16))
        {
          v18 = 138412290;
          v19 = v4;
          _os_log_impl(&dword_1B51E4000, v15, v16, "Babysitter: It's been long enough, we're going to give account %@ another try. Let's hope it doesn't crash this time.", (uint8_t *)&v18, 0xCu);
        }

        -[NSMutableDictionary removeObjectForKey:](self->_refreshingWaiters, "removeObjectForKey:", v4);
        CFPreferencesSetAppValue(CFSTR("RefreshingWaiters"), self->_refreshingWaiters, CFSTR("com.apple.dataaccess.babysitter"));
        -[NSMutableDictionary removeObjectForKey:](self->_restrictedWaiters, "removeObjectForKey:", v4);
        CFPreferencesSetAppValue(CFSTR("RestrictedWaiters"), self->_restrictedWaiters, CFSTR("com.apple.dataaccess.babysitter"));
        CFPreferencesAppSynchronize(CFSTR("com.apple.dataaccess.babysitter"));
      }

    }
  }

  return v6;
}

- (BOOL)accountShouldContinue:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D1C3E8], "babysitterEnabled") && DAIsRunningInDataAccessD())
  {
    objc_msgSend(v4, "waiterID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[DABabysitter accountWithIDShouldContinue:](self, "accountWithIDShouldContinue:", v5);

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (void)giveAccountWithIDAnotherChance:(id)a3
{
  DABabysitter *v4;
  id v5;

  v5 = a3;
  if (DAIsRunningInDataAccessD() && objc_msgSend(MEMORY[0x1E0D1C3E8], "babysitterEnabled"))
  {
    v4 = self;
    objc_sync_enter(v4);
    -[NSMutableDictionary removeObjectForKey:](v4->_refreshingWaiters, "removeObjectForKey:", v5);
    -[NSMutableDictionary removeObjectForKey:](v4->_restrictedWaiters, "removeObjectForKey:", v5);
    CFPreferencesSetAppValue(CFSTR("RefreshingWaiters"), v4->_refreshingWaiters, CFSTR("com.apple.dataaccess.babysitter"));
    -[NSMutableDictionary removeObjectForKey:](v4->_failedWaiters, "removeObjectForKey:", v5);
    CFPreferencesSetAppValue(CFSTR("FailedWaiters"), v4->_failedWaiters, CFSTR("com.apple.dataaccess.babysitter"));
    CFPreferencesSetAppValue(CFSTR("RestrictedWaiters"), v4->_restrictedWaiters, CFSTR("com.apple.dataaccess.babysitter"));
    CFPreferencesAppSynchronize(CFSTR("com.apple.dataaccess.babysitter"));
    objc_sync_exit(v4);

  }
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (void)setBuildVersion:(id)a3
{
  objc_storeStrong((id *)&self->_buildVersion, a3);
}

- (NSMutableDictionary)refreshingWaiters
{
  return self->_refreshingWaiters;
}

- (void)setRefreshingWaiters:(id)a3
{
  objc_storeStrong((id *)&self->_refreshingWaiters, a3);
}

- (NSMutableDictionary)failedWaiters
{
  return self->_failedWaiters;
}

- (void)setFailedWaiters:(id)a3
{
  objc_storeStrong((id *)&self->_failedWaiters, a3);
}

- (NSMutableDictionary)restrictedWaiters
{
  return self->_restrictedWaiters;
}

- (void)setRestrictedWaiters:(id)a3
{
  objc_storeStrong((id *)&self->_restrictedWaiters, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restrictedWaiters, 0);
  objc_storeStrong((id *)&self->_failedWaiters, 0);
  objc_storeStrong((id *)&self->_refreshingWaiters, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
}

@end
