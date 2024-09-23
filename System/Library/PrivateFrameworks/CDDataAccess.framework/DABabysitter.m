@implementation DABabysitter

+ (id)sharedBabysitter
{
  if (sharedBabysitter_onceToken != -1)
    dispatch_once(&sharedBabysitter_onceToken, &__block_literal_global_9);
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

- (void)_l_reloadBabysitterWaitersWithRefreshingWaitersPrefs:(id)a3 failedWaitersPrefs:(id)a4 restrictedWaitersPrefs:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *l_refreshingWaiters;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  NSMutableDictionary *v21;
  NSMutableDictionary *l_failedWaiters;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  uint64_t v28;
  void *v29;
  void *v30;
  NSMutableDictionary *v31;
  NSMutableDictionary *v32;
  NSMutableDictionary *l_restrictedWaiters;
  os_log_type_t v34;
  uint64_t v35;
  NSMutableDictionary *v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t k;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  int v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t m;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  uint64_t v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  NSMutableDictionary *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t n;
  NSMutableDictionary *v77;
  void *v78;
  void *v79;
  void *v80;
  int v81;
  NSObject *v82;
  _BOOL4 v83;
  int v84;
  void *v85;
  void *v86;
  int v87;
  void *v88;
  void *v89;
  NSObject *v90;
  os_log_type_t v91;
  NSMutableDictionary *v92;
  void *v93;
  void *v94;
  void *v95;
  uint64_t v96;
  id obj;
  id obja;
  id v99;
  id v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  DABabysitter *v105;
  uint64_t v106;
  NSMutableDictionary *v107;
  NSMutableDictionary *v108;
  id v109;
  os_log_type_t v110;
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
  __int128 v136;
  __int128 v137;
  __int128 v138;
  _BYTE v139[128];
  _QWORD v140[3];
  _QWORD v141[3];
  _BYTE v142[128];
  uint8_t v143[128];
  uint8_t buf[4];
  NSMutableDictionary *v145;
  __int16 v146;
  int v147;
  __int16 v148;
  void *v149;
  _BYTE v150[128];
  _BYTE v151[128];
  _BYTE v152[128];
  _BYTE v153[128];
  uint64_t v154;

  v154 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (NSMutableDictionary *)objc_opt_new();
  l_refreshingWaiters = self->_l_refreshingWaiters;
  self->_l_refreshingWaiters = v11;

  v94 = v10;
  v95 = v9;
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v137 = 0u;
      v138 = 0u;
      v135 = 0u;
      v136 = 0u;
      objc_msgSend(v8, "allKeys");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v135, v153, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v136;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v136 != v16)
              objc_enumerationMutation(v13);
            v18 = *(_QWORD *)(*((_QWORD *)&v135 + 1) + 8 * i);
            objc_msgSend(v8, "objectForKeyedSubscript:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v20 = (void *)objc_msgSend(v19, "mutableCopy");
              -[NSMutableDictionary setObject:forKeyedSubscript:](self->_l_refreshingWaiters, "setObject:forKeyedSubscript:", v20, v18);

            }
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v135, v153, 16);
        }
        while (v15);
      }

      v10 = v94;
      v9 = v95;
    }
  }
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v21 = (NSMutableDictionary *)objc_opt_new();
    l_failedWaiters = self->_l_failedWaiters;
    self->_l_failedWaiters = v21;

    v133 = 0u;
    v134 = 0u;
    v131 = 0u;
    v132 = 0u;
    objc_msgSend(v9, "allKeys");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v131, v152, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v132;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v132 != v26)
            objc_enumerationMutation(v23);
          v28 = *(_QWORD *)(*((_QWORD *)&v131 + 1) + 8 * j);
          objc_msgSend(v95, "objectForKeyedSubscript:", v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v30 = (void *)objc_msgSend(v29, "mutableCopy");
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_l_failedWaiters, "setObject:forKeyedSubscript:", v30, v28);

          }
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v131, v152, 16);
      }
      while (v25);
      v10 = v94;
    }
  }
  else
  {
    v31 = (NSMutableDictionary *)objc_opt_new();
    v23 = self->_l_failedWaiters;
    self->_l_failedWaiters = v31;
  }

  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v32 = (NSMutableDictionary *)objc_msgSend(v10, "mutableCopy");
  else
    v32 = (NSMutableDictionary *)objc_opt_new();
  l_restrictedWaiters = self->_l_restrictedWaiters;
  self->_l_restrictedWaiters = v32;
  v93 = v8;

  v129 = 0u;
  v130 = 0u;
  v127 = 0u;
  v128 = 0u;
  -[NSMutableDictionary allKeys](self->_l_refreshingWaiters, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v105 = self;
  v101 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v127, v151, 16);
  if (v101)
  {
    v99 = *(id *)v128;
    v34 = *(_BYTE *)(MEMORY[0x1E0D03918] + 3);
    do
    {
      v35 = 0;
      do
      {
        if (*(id *)v128 != v99)
          objc_enumerationMutation(obj);
        v103 = v35;
        v36 = *(NSMutableDictionary **)(*((_QWORD *)&v127 + 1) + 8 * v35);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_l_refreshingWaiters, "objectForKeyedSubscript:", v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v108 = v36;
        -[NSMutableDictionary objectForKeyedSubscript:](self->_l_failedWaiters, "objectForKeyedSubscript:", v36);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v38)
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_l_failedWaiters, "setObject:forKeyedSubscript:", v38, v36);
        }
        v125 = 0u;
        v126 = 0u;
        v123 = 0u;
        v124 = 0u;
        v39 = v37;
        v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v123, v150, 16);
        if (v40)
        {
          v41 = v40;
          v42 = *(_QWORD *)v124;
          do
          {
            for (k = 0; k != v41; ++k)
            {
              if (*(_QWORD *)v124 != v42)
                objc_enumerationMutation(v39);
              v44 = *(void **)(*((_QWORD *)&v123 + 1) + 8 * k);
              objc_msgSend(v38, "objectForKeyedSubscript:", v44);
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v45, "intValue") + 1);
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "setObject:forKeyedSubscript:", v46, v44);
              DALoggingwithCategory();
              v47 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v47, v34))
              {
                v48 = objc_msgSend(v46, "intValue");
                *(_DWORD *)buf = 138543874;
                v145 = v108;
                v146 = 1024;
                v147 = v48;
                v148 = 2114;
                v149 = v44;
                _os_log_impl(&dword_1C1CD1000, v47, v34, "Babysitter: Noting that waiter %{public}@ failed %d times for operation %{public}@", buf, 0x1Cu);
              }

            }
            v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v123, v150, 16);
          }
          while (v41);
        }

        v35 = v103 + 1;
        self = v105;
      }
      while (v103 + 1 != v101);
      v101 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v127, v151, 16);
    }
    while (v101);
  }

  v121 = 0u;
  v122 = 0u;
  v119 = 0u;
  v120 = 0u;
  -[NSMutableDictionary allKeys](self->_l_failedWaiters, "allKeys");
  v100 = (id)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v100, "countByEnumeratingWithState:objects:count:", &v119, v143, 16);
  v50 = 0x1E0C99000uLL;
  if (v49)
  {
    v51 = v49;
    v52 = *(_QWORD *)v120;
    v96 = *(_QWORD *)v120;
    do
    {
      v53 = 0;
      obja = (id)v51;
      do
      {
        if (*(_QWORD *)v120 != v52)
          objc_enumerationMutation(v100);
        v106 = *(_QWORD *)(*((_QWORD *)&v119 + 1) + 8 * v53);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_l_failedWaiters, "objectForKeyedSubscript:");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v102 = v53;
          v117 = 0u;
          v118 = 0u;
          v115 = 0u;
          v116 = 0u;
          objc_msgSend(v54, "allKeys");
          v109 = (id)objc_claimAutoreleasedReturnValue();
          v55 = objc_msgSend(v109, "countByEnumeratingWithState:objects:count:", &v115, v142, 16);
          if (v55)
          {
            v56 = v55;
            v57 = *(_QWORD *)v116;
            v104 = v54;
            do
            {
              for (m = 0; m != v56; ++m)
              {
                if (*(_QWORD *)v116 != v57)
                  objc_enumerationMutation(v109);
                v59 = *(_QWORD *)(*((_QWORD *)&v115 + 1) + 8 * m);
                objc_msgSend(v54, "objectForKeyedSubscript:", v59);
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v61 = objc_msgSend(v60, "intValue");
                  if ((int)v61 >= 5)
                  {
                    v62 = v61;
                    -[NSMutableDictionary objectForKeyedSubscript:](self->_l_restrictedWaiters, "objectForKeyedSubscript:", v106);
                    v63 = (void *)objc_claimAutoreleasedReturnValue();

                    if (!v63)
                    {
                      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.caldavsyncd.babysitter.timeout.%@"), v59);
                      ADClientAddValueForScalarKey();
                      objc_msgSend(*(id *)(v50 + 3432), "dateWithTimeIntervalSinceNow:", fmin((double)(3600 * (int)v62 - 14400), 86400.0) + (double)(arc4random() % 0x384));
                      v64 = (void *)objc_claimAutoreleasedReturnValue();
                      if ((objc_msgSend(MEMORY[0x1E0D03908], "babysitterEnabled") & 1) == 0)
                      {
                        objc_msgSend(*(id *)(v50 + 3432), "distantPast");
                        v65 = objc_claimAutoreleasedReturnValue();

                        v64 = (void *)v65;
                      }
                      v66 = objc_alloc_init(MEMORY[0x1E0CB3578]);
                      objc_msgSend(v66, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss Z"));
                      objc_msgSend(v66, "stringFromDate:", v64);
                      v67 = (void *)objc_claimAutoreleasedReturnValue();
                      v140[0] = CFSTR("RestrictionTimeout");
                      v68 = (void *)MEMORY[0x1E0CB37E8];
                      objc_msgSend(v64, "timeIntervalSinceReferenceDate");
                      objc_msgSend(v68, "numberWithDouble:");
                      v69 = (void *)objc_claimAutoreleasedReturnValue();
                      v141[0] = v69;
                      v141[1] = v67;
                      v140[1] = CFSTR("RestrictionTimeoutDate");
                      v140[2] = CFSTR("NumFailures");
                      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v62);
                      v70 = (void *)objc_claimAutoreleasedReturnValue();
                      v141[2] = v70;
                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v141, v140, 3);
                      v71 = (void *)objc_claimAutoreleasedReturnValue();

                      -[NSMutableDictionary setValue:forKey:](v105->_l_restrictedWaiters, "setValue:forKey:", v71, v106);
                      self = v105;

                      v50 = 0x1E0C99000;
                      v54 = v104;
                    }
                  }
                }

              }
              v56 = objc_msgSend(v109, "countByEnumeratingWithState:objects:count:", &v115, v142, 16);
            }
            while (v56);
          }

          v52 = v96;
          v51 = (uint64_t)obja;
          v53 = v102;
        }

        ++v53;
      }
      while (v53 != v51);
      v51 = objc_msgSend(v100, "countByEnumeratingWithState:objects:count:", &v119, v143, 16);
    }
    while (v51);
  }

  v113 = 0u;
  v114 = 0u;
  v111 = 0u;
  v112 = 0u;
  v72 = self->_l_restrictedWaiters;
  v73 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v72, "countByEnumeratingWithState:objects:count:", &v111, v139, 16);
  if (v73)
  {
    v74 = v73;
    v75 = *(_QWORD *)v112;
    v110 = *(_BYTE *)(MEMORY[0x1E0D03918] + 3);
    v107 = v72;
    do
    {
      for (n = 0; n != v74; ++n)
      {
        if (*(_QWORD *)v112 != v75)
          objc_enumerationMutation(v72);
        v77 = *(NSMutableDictionary **)(*((_QWORD *)&v111 + 1) + 8 * n);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_l_restrictedWaiters, "objectForKeyedSubscript:", v77);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v78, "objectForKeyedSubscript:", CFSTR("NumFailures"));
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v78, "objectForKeyedSubscript:", CFSTR("RestrictionTimeout"));
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

              v80 = 0;
            }
            v81 = objc_msgSend(MEMORY[0x1E0D03908], "babysitterEnabled");
            DALoggingwithCategory();
            v82 = objc_claimAutoreleasedReturnValue();
            v83 = os_log_type_enabled(v82, v110);
            if (v81)
            {
              if (v83)
              {
                v84 = objc_msgSend(v79, "intValue");
                v85 = (void *)MEMORY[0x1E0C99D68];
                objc_msgSend(v80, "doubleValue");
                objc_msgSend(v85, "dateWithTimeIntervalSinceReferenceDate:");
                v86 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v145 = v77;
                v146 = 1024;
                v147 = v84;
                v148 = 2114;
                v149 = v86;
                _os_log_impl(&dword_1C1CD1000, v82, v110, "===================\n\n\n\nBabysitter: Account with ID %{public}@ had previously failed %d times and is from now restricted until it stops crashing. Please file a bug for any remindd crashes you find. (Timeout: %{public}@)\n\n\n===================\n", buf, 0x1Cu);

                v72 = v107;
              }

              -[DABabysitter _diagnosticReportWithWaiterID:failureCount:](v105, "_diagnosticReportWithWaiterID:failureCount:", v77, objc_msgSend(v79, "intValue"));
            }
            else
            {
              if (v83)
              {
                v87 = objc_msgSend(v79, "intValue");
                v88 = (void *)MEMORY[0x1E0C99D68];
                objc_msgSend(v80, "doubleValue");
                objc_msgSend(v88, "dateWithTimeIntervalSinceReferenceDate:");
                v89 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v145 = v77;
                v146 = 1024;
                v147 = v87;
                v148 = 2114;
                v149 = v89;
                _os_log_impl(&dword_1C1CD1000, v82, v110, "===================\n\n\n\nBabysitter: Waiter with ID %{public}@ had crashed %d times. Since you have the babysitter disabled, we're going to assume you know what you're doing and not disable the waiter. Consider yourself warned. (Timeout: %{public}@)\n\n\n===================\n", buf, 0x1Cu);

                v72 = v107;
              }

            }
            self = v105;
          }

        }
      }
      v74 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v72, "countByEnumeratingWithState:objects:count:", &v111, v139, 16);
    }
    while (v74);
  }

  -[NSMutableDictionary removeAllObjects](self->_l_refreshingWaiters, "removeAllObjects");
  if (-[NSMutableDictionary count](self->_l_restrictedWaiters, "count"))
  {
    DALoggingwithCategory();
    v90 = objc_claimAutoreleasedReturnValue();
    v91 = *(_BYTE *)(MEMORY[0x1E0D03918] + 5);
    if (os_log_type_enabled(v90, v91))
    {
      v92 = self->_l_restrictedWaiters;
      *(_DWORD *)buf = 138543362;
      v145 = v92;
      _os_log_impl(&dword_1C1CD1000, v90, v91, "Babysitter: Restricted accounts are: %{public}@", buf, 0xCu);
    }

  }
}

- (void)_reloadBabysitterProperties
{
  NSString *v3;
  NSString *buildVersion;
  void *v5;
  NSObject *v6;
  os_log_type_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t v14[16];

  CFPreferencesAppSynchronize(CFSTR("com.apple.remindd.babysitter"));
  v3 = (NSString *)MGCopyAnswer();
  buildVersion = self->_buildVersion;
  self->_buildVersion = v3;

  v5 = (void *)CFPreferencesCopyAppValue(CFSTR("LastSystemVersion"), CFSTR("com.apple.remindd.babysitter"));
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && !-[NSString isEqualToString:](self->_buildVersion, "isEqualToString:", v5))
    {
      DALoggingwithCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(_BYTE *)(MEMORY[0x1E0D03918] + 5);
      if (os_log_type_enabled(v6, v7))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_1C1CD1000, v6, v7, "Babysitter: The OS version is different. Giving all accounts a second chance at life.", v14, 2u);
      }

      CFPreferencesSetAppValue(CFSTR("LastSystemVersion"), 0, CFSTR("com.apple.remindd.babysitter"));
      CFPreferencesSetAppValue(CFSTR("RestrictedWaiters"), 0, CFSTR("com.apple.remindd.babysitter"));
      CFPreferencesSetAppValue(CFSTR("RefreshingWaiters"), 0, CFSTR("com.apple.remindd.babysitter"));
      CFPreferencesSetAppValue(CFSTR("FailedWaiters"), 0, CFSTR("com.apple.remindd.babysitter"));
      CFPreferencesAppSynchronize(CFSTR("com.apple.remindd.babysitter"));
    }
  }
  v8 = (void *)CFPreferencesCopyAppValue(CFSTR("RefreshingWaiters"), CFSTR("com.apple.remindd.babysitter"));
  v9 = (void *)CFPreferencesCopyAppValue(CFSTR("FailedWaiters"), CFSTR("com.apple.remindd.babysitter"));
  v10 = (void *)CFPreferencesCopyAppValue(CFSTR("RestrictedWaiters"), CFSTR("com.apple.remindd.babysitter"));
  os_unfair_lock_lock(&self->_lock);
  -[DABabysitter _l_reloadBabysitterWaitersWithRefreshingWaitersPrefs:failedWaitersPrefs:restrictedWaitersPrefs:](self, "_l_reloadBabysitterWaitersWithRefreshingWaitersPrefs:failedWaitersPrefs:restrictedWaitersPrefs:", v8, v9, v10);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:copyItems:", self->_l_refreshingWaiters, 1);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:copyItems:", self->_l_failedWaiters, 1);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:copyItems:", self->_l_restrictedWaiters, 1);
  os_unfair_lock_unlock(&self->_lock);
  CFPreferencesSetAppValue(CFSTR("LastSystemVersion"), self->_buildVersion, CFSTR("com.apple.remindd.babysitter"));
  CFPreferencesSetAppValue(CFSTR("RefreshingWaiters"), v11, CFSTR("com.apple.remindd.babysitter"));
  CFPreferencesSetAppValue(CFSTR("FailedWaiters"), v12, CFSTR("com.apple.remindd.babysitter"));
  CFPreferencesSetAppValue(CFSTR("RestrictedWaiters"), v13, CFSTR("com.apple.remindd.babysitter"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.remindd.babysitter"));

}

- (id)_init
{
  DABabysitter *v2;
  DABabysitter *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DABabysitter;
  v2 = -[DABabysitter init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    -[DABabysitter _reloadBabysitterProperties](v2, "_reloadBabysitterProperties");
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)_reloadBabysitterProperties, CFSTR("DataAccessBabysitterPrefsChanged"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v3;
}

- (DABabysitter)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DABabysitter.m"), 242, CFSTR("Use the shared babysitter, jerk."));

  return 0;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("DataAccessBabysitterPrefsChanged"), 0);
  v4.receiver = self;
  v4.super_class = (Class)DABabysitter;
  -[DABabysitter dealloc](&v4, sel_dealloc);
}

- (void)_l_incrementRefreshCountForWaiterID:(id)a3 operationName:(id)a4
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
  -[NSMutableDictionary objectForKeyedSubscript:](self->_l_refreshingWaiters, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_l_refreshingWaiters, "setObject:forKeyedSubscript:", v8, v6);
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v9, "intValue") + 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  DALoggingwithCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_BYTE *)(MEMORY[0x1E0D03918] + 7);
  if (os_log_type_enabled(v11, v12))
  {
    v13 = 138412802;
    v14 = v6;
    v15 = 2112;
    v16 = v7;
    v17 = 1024;
    v18 = objc_msgSend(v10, "intValue");
    _os_log_impl(&dword_1C1CD1000, v11, v12, "Babysitter: Marking waiter %@ as performing operation \"%@\" (attempt #%d)", (uint8_t *)&v13, 0x1Cu);
  }

  objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, v7);
}

- (void)_incrementRefreshCountForWaiterID:(id)a3 operationName:(id)a4
{
  os_unfair_lock_s *p_lock;
  id v7;
  id v8;
  void *value;

  if (a3)
  {
    p_lock = &self->_lock;
    v7 = a4;
    v8 = a3;
    os_unfair_lock_lock(p_lock);
    -[DABabysitter _l_incrementRefreshCountForWaiterID:operationName:](self, "_l_incrementRefreshCountForWaiterID:operationName:", v8, v7);

    value = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:copyItems:", self->_l_refreshingWaiters, 1);
    os_unfair_lock_unlock(p_lock);
    CFPreferencesSetAppValue(CFSTR("RefreshingWaiters"), value, CFSTR("com.apple.remindd.babysitter"));
    CFPreferencesAppSynchronize(CFSTR("com.apple.remindd.babysitter"));

  }
}

- (void)_l_decrementRefreshCountForWaiter:(id)a3 forOperationWithName:(id)a4
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
  -[NSMutableDictionary objectForKeyedSubscript:](self->_l_refreshingWaiters, "objectForKeyedSubscript:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((int)objc_msgSend(v9, "intValue") < 2)
    {
      objc_msgSend(v8, "removeObjectForKey:", v6);
      -[NSMutableDictionary objectForKeyedSubscript:](self->_l_failedWaiters, "objectForKeyedSubscript:", v13);
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

- (void)_l_decrementRefreshCountForWaiterID:(id)a3 operationName:(id)a4
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
    -[NSMutableDictionary objectForKeyedSubscript:](self->_l_refreshingWaiters, "objectForKeyedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    DALoggingwithCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_BYTE *)(MEMORY[0x1E0D03918] + 7);
    v11 = os_log_type_enabled(v9, v10);
    if (v7)
    {
      if (v11)
      {
        *(_DWORD *)buf = 138412546;
        v24 = v7;
        v25 = 2112;
        v26 = v6;
        _os_log_impl(&dword_1C1CD1000, v9, v10, "Babysitter: Decrementing refresh count for operation \"%@\" on account %@", buf, 0x16u);
      }

      -[DABabysitter _l_decrementRefreshCountForWaiter:forOperationWithName:](self, "_l_decrementRefreshCountForWaiter:forOperationWithName:", v6, v7);
    }
    else
    {
      if (v11)
      {
        *(_DWORD *)buf = 138412290;
        v24 = v6;
        _os_log_impl(&dword_1C1CD1000, v9, v10, "Babysitter: Decrementing refresh count for all operations on account %@", buf, 0xCu);
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
            -[DABabysitter _l_decrementRefreshCountForWaiter:forOperationWithName:](self, "_l_decrementRefreshCountForWaiter:forOperationWithName:", v6, *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i));
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        }
        while (v14);
      }

    }
    if (!objc_msgSend(v8, "count"))
      -[NSMutableDictionary removeObjectForKey:](self->_l_refreshingWaiters, "removeObjectForKey:", v6);
    -[NSMutableDictionary objectForKeyedSubscript:](self->_l_failedWaiters, "objectForKeyedSubscript:", v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "count");

    if (!v18)
      -[NSMutableDictionary removeObjectForKey:](self->_l_failedWaiters, "removeObjectForKey:", v6);

  }
}

- (BOOL)registerAccount:(id)a3 forOperationWithName:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = -[DABabysitter accountShouldContinue:](self, "accountShouldContinue:", v6);
  if (v8)
  {
    objc_msgSend(v6, "waiterID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[DABabysitter _incrementRefreshCountForWaiterID:operationName:](self, "_incrementRefreshCountForWaiterID:operationName:", v9, v7);

  }
  return v8;
}

- (id)tokenByRegisteringAccount:(id)a3 forOperationWithName:(id)a4
{
  id v6;
  id v7;
  DABabysitterRegistrationToken *v8;
  DABabysitterRegistrationToken *v9;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  if (-[DABabysitter registerAccount:forOperationWithName:](self, "registerAccount:forOperationWithName:", v6, v7))
  {
    v8 = [DABabysitterRegistrationToken alloc];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __63__DABabysitter_tokenByRegisteringAccount_forOperationWithName___block_invoke;
    v11[3] = &unk_1E7B92198;
    v11[4] = self;
    v12 = v6;
    v13 = v7;
    v9 = -[DABabysitterRegistrationToken initWithBlock:](v8, "initWithBlock:", v11);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t __63__DABabysitter_tokenByRegisteringAccount_forOperationWithName___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "unregisterAccount:forOperationWithName:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)unregisterAccount:(id)a3 forOperationWithName:(id)a4
{
  id v6;
  os_unfair_lock_s *p_lock;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (-[DABabysitter accountShouldContinue:](self, "accountShouldContinue:", v11))
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    objc_msgSend(v11, "waiterID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DABabysitter _l_decrementRefreshCountForWaiterID:operationName:](self, "_l_decrementRefreshCountForWaiterID:operationName:", v8, v6);

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:copyItems:", self->_l_refreshingWaiters, 1);
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:copyItems:", self->_l_failedWaiters, 1);
    os_unfair_lock_unlock(p_lock);
    CFPreferencesSetAppValue(CFSTR("RefreshingWaiters"), v9, CFSTR("com.apple.remindd.babysitter"));
    CFPreferencesSetAppValue(CFSTR("FailedWaiters"), v10, CFSTR("com.apple.remindd.babysitter"));
    CFPreferencesAppSynchronize(CFSTR("com.apple.remindd.babysitter"));

  }
}

- (BOOL)accountWithIDShouldContinue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  BOOL v14;
  NSObject *v15;
  os_log_type_t v16;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lock);
    -[NSMutableDictionary objectForKeyedSubscript:](self->_l_restrictedWaiters, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("RestrictionTimeout"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "doubleValue");
      v9 = v8;

      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "timeIntervalSinceDate:", v10);
      v13 = v12;

      v14 = v13 >= 0.0;
      if (v13 >= 0.0)
      {
        DALoggingwithCategory();
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = *(_BYTE *)(MEMORY[0x1E0D03918] + 4);
        if (os_log_type_enabled(v15, v16))
        {
          v18 = 138543362;
          v19 = v4;
          _os_log_impl(&dword_1C1CD1000, v15, v16, "Babysitter: It's been long enough, we're going to give account %{public}@ another try. Let's hope it doesn't crash this time.", (uint8_t *)&v18, 0xCu);
        }

        -[NSMutableDictionary removeObjectForKey:](self->_l_refreshingWaiters, "removeObjectForKey:", v4);
        -[NSMutableDictionary removeObjectForKey:](self->_l_restrictedWaiters, "removeObjectForKey:", v4);
        CFPreferencesSetAppValue(CFSTR("RefreshingWaiters"), self->_l_refreshingWaiters, CFSTR("com.apple.remindd.babysitter"));
        CFPreferencesSetAppValue(CFSTR("RestrictedWaiters"), self->_l_restrictedWaiters, CFSTR("com.apple.remindd.babysitter"));
        CFPreferencesAppSynchronize(CFSTR("com.apple.remindd.babysitter"));
      }

    }
    else
    {
      v14 = 1;
    }
    os_unfair_lock_unlock(&self->_lock);

  }
  else
  {
    v14 = 1;
  }

  return v14;
}

- (BOOL)accountShouldContinue:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D03908], "babysitterEnabled"))
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

- (void)_l_giveAccountWithIDAnotherChance:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D03908], "babysitterEnabled"))
  {
    -[NSMutableDictionary removeObjectForKey:](self->_l_refreshingWaiters, "removeObjectForKey:", v4);
    -[NSMutableDictionary removeObjectForKey:](self->_l_restrictedWaiters, "removeObjectForKey:", v4);
    CFPreferencesSetAppValue(CFSTR("RefreshingWaiters"), self->_l_refreshingWaiters, CFSTR("com.apple.remindd.babysitter"));
    -[NSMutableDictionary removeObjectForKey:](self->_l_failedWaiters, "removeObjectForKey:", v4);
    CFPreferencesSetAppValue(CFSTR("FailedWaiters"), self->_l_failedWaiters, CFSTR("com.apple.remindd.babysitter"));
    CFPreferencesSetAppValue(CFSTR("RestrictedWaiters"), self->_l_restrictedWaiters, CFSTR("com.apple.remindd.babysitter"));
    CFPreferencesAppSynchronize(CFSTR("com.apple.remindd.babysitter"));
  }

}

- (void)giveAccountWithIDAnotherChance:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[DABabysitter _l_giveAccountWithIDAnotherChance:](self, "_l_giveAccountWithIDAnotherChance:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)_diagnosticReportWithWaiterID:(id)a3 failureCount:(int)a4
{
  uint64_t v4;
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v4 = *(_QWORD *)&a4;
    v5 = (objc_class *)MEMORY[0x1E0DAFF28];
    v6 = a3;
    v7 = objc_alloc_init(v5);
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "processName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "signatureWithDomain:type:subType:detectedProcess:triggerThresholdValues:", CFSTR("ReminderKit"), CFSTR("DABabysitter"), &stru_1E7B93480, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v13[0] = CFSTR("watierID");
    v13[1] = CFSTR("failureCount");
    v14[0] = v6;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "snapshotWithSignature:duration:event:payload:reply:", v10, v12, 0, &__block_literal_global_52, 0.0);
  }
}

void __59__DABabysitter__diagnosticReportWithWaiterID_failureCount___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  os_log_type_t v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  DALoggingwithCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_BYTE *)(MEMORY[0x1E0D03918] + 5);
  if (os_log_type_enabled(v3, v4))
  {
    v5 = 138412290;
    v6 = v2;
    _os_log_impl(&dword_1C1CD1000, v3, v4, "AutoBugCapture did reply {response: %@}", (uint8_t *)&v5, 0xCu);
  }

}

- (void)statusReportWithCompletionBlock:(id)a3
{
  os_unfair_lock_s *p_lock;
  void (**v5)(id, id);
  void *v6;
  void *v7;
  void *v8;
  id v9;

  p_lock = &self->_lock;
  v5 = (void (**)(id, id))a3;
  os_unfair_lock_lock(p_lock);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[DABabysitter _populatedStringDictionaryWithWaitersDictionary:](self, "_populatedStringDictionaryWithWaitersDictionary:", self->_l_refreshingWaiters);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DABabysitter _populatedStringDictionaryWithWaitersDictionary:](self, "_populatedStringDictionaryWithWaitersDictionary:", self->_l_failedWaiters);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DABabysitter _populatedStringDictionaryWithWaitersDictionary:](self, "_populatedStringDictionaryWithWaitersDictionary:", self->_l_restrictedWaiters);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setValue:forKey:", v6, CFSTR("refreshingWaiters"));
  objc_msgSend(v9, "setValue:forKey:", v7, CFSTR("failedWaiters"));
  objc_msgSend(v9, "setValue:forKey:", v8, CFSTR("restrictedWaiters"));
  os_unfair_lock_unlock(p_lock);
  v5[2](v5, v9);

}

- (id)_populatedStringDictionaryWithWaitersDictionary:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  BOOL v14;
  void *v15;
  id v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        v10 = (void *)MEMORY[0x1E0CB36D8];
        objc_msgSend(v3, "objectForKeyedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 0;
        objc_msgSend(v10, "dataWithJSONObject:options:error:", v11, 8, &v18);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v18;

        if (v12)
          v14 = v13 == 0;
        else
          v14 = 0;
        if (v14)
        {
          v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v12, 4);
          if (v15)
            objc_msgSend(v17, "setValue:forKey:", v15, v9);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v6);
  }

  return v17;
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (void)setBuildVersion:(id)a3
{
  objc_storeStrong((id *)&self->_buildVersion, a3);
}

- (NSMutableDictionary)l_refreshingWaiters
{
  return self->_l_refreshingWaiters;
}

- (void)setL_refreshingWaiters:(id)a3
{
  objc_storeStrong((id *)&self->_l_refreshingWaiters, a3);
}

- (NSMutableDictionary)l_failedWaiters
{
  return self->_l_failedWaiters;
}

- (void)setL_failedWaiters:(id)a3
{
  objc_storeStrong((id *)&self->_l_failedWaiters, a3);
}

- (NSMutableDictionary)l_restrictedWaiters
{
  return self->_l_restrictedWaiters;
}

- (void)setL_restrictedWaiters:(id)a3
{
  objc_storeStrong((id *)&self->_l_restrictedWaiters, a3);
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_l_restrictedWaiters, 0);
  objc_storeStrong((id *)&self->_l_failedWaiters, 0);
  objc_storeStrong((id *)&self->_l_refreshingWaiters, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
}

@end
