@implementation DMFApplicationPolicyMonitor

- (DMFApplicationPolicyMonitor)initWithPolicyChangeHandler:(id)a3
{
  return (DMFApplicationPolicyMonitor *)-[DMFApplicationPolicyMonitor _initWithPolicyChangeHandler:addingRegistration:](self, "_initWithPolicyChangeHandler:addingRegistration:", a3, 1);
}

- (id)requestPoliciesForBundleIdentifiers:(id)a3 withError:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  id v35;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  NSObject *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t j;
  NSObject *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  unint64_t v55;
  void *v56;
  NSObject *v57;
  NSObject *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  NSObject *v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t k;
  NSObject *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v77;
  NSObject *v78;
  void *v79;
  id v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  id v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  id v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  void *v97;
  NSObject *v98;
  void *v99;
  NSObject *v100;
  void *v101;
  void *v102;
  void *v103;
  uint64_t v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
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
  _BYTE v121[128];
  uint8_t v122[128];
  uint8_t buf[4];
  uint64_t v124;
  __int16 v125;
  NSObject *v126;
  __int16 v127;
  void *v128;
  __int16 v129;
  void *v130;
  __int16 v131;
  void *v132;
  uint8_t v133[128];
  uint8_t v134[136];
  uint64_t v135;

  v135 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[DMFPolicyMonitor policyMonitor](DMFPolicyMonitor, "policyMonitor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMFApplicationPolicyMonitor policyTypes](self, "policyTypes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "requestPoliciesForTypes:withError:", v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v6, "count"));
    if (objc_msgSend(v9, "count"))
    {
      objc_msgSend((id)objc_opt_class(), "fetchParentBundleIdentifiersForBundleIdentifiers:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v103 = (void *)objc_opt_new();
      v105 = 0u;
      v106 = 0u;
      v107 = 0u;
      v108 = 0u;
      v83 = v11;
      objc_msgSend(v11, "allValues");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v105, v121, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v106;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v106 != v15)
              objc_enumerationMutation(v12);
            objc_msgSend(v103, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v105 + 1) + 8 * i));
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v105, v121, 16);
        }
        while (v14);
      }

      objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v103);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "_fetchCategoriesForBundleIdentifiers:withError:", v82, a4);
      v17 = objc_claimAutoreleasedReturnValue();
      v81 = (void *)v17;
      if (v17)
      {
        v18 = (void *)v17;
        v78 = v10;
        v80 = v6;
        v19 = v6;
        v79 = v9;
        v20 = v9;
        v21 = v18;
        v93 = v83;
        v100 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v19, "count"));
        objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("applications"));
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("applicationcategories"));
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("categories"));
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = v20;
        objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("websites"));
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        +[DMFEffectivePolicy unblockableBundleIdentifiers](DMFEffectivePolicy, "unblockableBundleIdentifiers");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        +[DMFEffectivePolicy unblockableCategoryIdentifiers](DMFEffectivePolicy, "unblockableCategoryIdentifiers");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        v117 = 0u;
        v118 = 0u;
        v119 = 0u;
        v120 = 0u;
        v23 = v19;
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v117, v134, 16);
        if (v24)
        {
          v25 = v24;
          v26 = *(_QWORD *)v118;
          v86 = *(_QWORD *)v118;
          v87 = v22;
          v88 = v23;
          do
          {
            v27 = 0;
            v94 = v25;
            do
            {
              if (*(_QWORD *)v118 != v26)
                objc_enumerationMutation(v23);
              v28 = *(_QWORD *)(*((_QWORD *)&v117 + 1) + 8 * v27);
              objc_msgSend(v21, "objectForKeyedSubscript:", v28);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = v29;
              if (v29)
              {
                objc_msgSend(v29, "identifier");
                v31 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "webDomains");
                v102 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "equivalentBundleIdentifiers");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                v104 = v28;
                objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v28);
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v32, "count"))
                  objc_msgSend(v33, "addObjectsFromArray:", v32);
                v101 = v32;
                if (objc_msgSend(v22, "containsObject:", v104))
                {
                  DMFPolicyLog();
                  v34 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138543362;
                    v124 = v104;
                    _os_log_impl(&dword_1B8C0C000, v34, OS_LOG_TYPE_DEFAULT, "Requested application %{public}@ is unblockable", buf, 0xCu);
                  }

                  -[NSObject setObject:forKeyedSubscript:](v100, "setObject:forKeyedSubscript:", &unk_1E6EF2C40, v104);
                }
                else if (v31 && objc_msgSend(v84, "containsObject:", v31))
                {
                  v35 = v23;
                  v36 = v31;
                  DMFPolicyLog();
                  v37 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138543618;
                    v124 = v104;
                    v125 = 2114;
                    v126 = v36;
                    _os_log_impl(&dword_1B8C0C000, v37, OS_LOG_TYPE_DEFAULT, "Requested application %{public}@ with associated category %{public}@ is unblockable", buf, 0x16u);
                  }

                  -[NSObject setObject:forKeyedSubscript:](v100, "setObject:forKeyedSubscript:", &unk_1E6EF2C40, v104);
                  v31 = v36;
                  v23 = v35;
                }
                else
                {
                  v38 = (void *)objc_opt_new();
                  objc_msgSend(v93, "objectForKeyedSubscript:", v104);
                  v99 = (void *)objc_claimAutoreleasedReturnValue();
                  v95 = v30;
                  v96 = v27;
                  v39 = v33;
                  v98 = v31;
                  if (objc_msgSend(v99, "count"))
                  {
                    DMFPolicyLog();
                    v40 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
                    {
                      objc_msgSend(v99, "componentsJoinedByString:", CFSTR(","));
                      v41 = objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138543618;
                      v124 = v104;
                      v125 = 2114;
                      v126 = v41;
                      _os_log_impl(&dword_1B8C0C000, v40, OS_LOG_TYPE_DEFAULT, "Requested application %{public}@ has parent applications %{public}@", buf, 0x16u);

                    }
                    v115 = 0u;
                    v116 = 0u;
                    v113 = 0u;
                    v114 = 0u;
                    v42 = v99;
                    v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v113, v133, 16);
                    if (v43)
                    {
                      v44 = v43;
                      v45 = *(_QWORD *)v114;
                      do
                      {
                        for (j = 0; j != v44; ++j)
                        {
                          if (*(_QWORD *)v114 != v45)
                            objc_enumerationMutation(v42);
                          v47 = *(NSObject **)(*((_QWORD *)&v113 + 1) + 8 * j);
                          objc_msgSend(v21, "objectForKeyedSubscript:", v47);
                          v48 = (void *)objc_claimAutoreleasedReturnValue();
                          v49 = v48;
                          if (v48)
                          {
                            objc_msgSend(v48, "identifier");
                            v50 = objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v38, "addObject:", v50);
                          }
                          else
                          {
                            DMFPolicyLog();
                            v50 = objc_claimAutoreleasedReturnValue();
                            if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
                            {
                              *(_DWORD *)buf = 138543618;
                              v124 = v104;
                              v125 = 2114;
                              v126 = v47;
                              _os_log_error_impl(&dword_1B8C0C000, v50, OS_LOG_TYPE_ERROR, "Requested application %{public}@ failed to categorize parent application %{public}@", buf, 0x16u);
                            }
                          }

                        }
                        v39 = v33;
                        v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v113, v133, 16);
                      }
                      while (v44);
                    }

                    v25 = v94;
                    v31 = v98;
                  }
                  if (v31)
                  {
                    objc_msgSend(v38, "arrayByAddingObject:", v31);
                    v51 = (id)objc_claimAutoreleasedReturnValue();
                  }
                  else
                  {
                    v51 = v38;
                  }
                  v52 = v51;
                  objc_msgSend(v39, "allObjects");
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                  v97 = v52;
                  +[DMFPrioritizedPolicy prioritizedPoliciesForAppPolicy:appCategoryPolicy:bundleIdentifiers:categoryPolicy:categoryIdentifiers:webPolicy:webCategoryPolicy:webDomains:](DMFPrioritizedPolicy, "prioritizedPoliciesForAppPolicy:appCategoryPolicy:bundleIdentifiers:categoryPolicy:categoryIdentifiers:webPolicy:webCategoryPolicy:webDomains:", v92, v91, v53, v90, v52, v89, 0, v102);
                  v54 = (void *)objc_claimAutoreleasedReturnValue();

                  v55 = +[DMFPrioritizedPolicy arbitratePolicyForPrioritizedPolicies:](DMFPrioritizedPolicy, "arbitratePolicyForPrioritizedPolicies:", v54);
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v55);
                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NSObject setObject:forKeyedSubscript:](v100, "setObject:forKeyedSubscript:", v56, v104);

                  DMFPolicyLog();
                  v57 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
                  {
                    DMFPolicyUnlocalizedDisplayName(v55);
                    v85 = v54;
                    v58 = objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v52, "componentsJoinedByString:", CFSTR(","));
                    v59 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v102, "componentsJoinedByString:", CFSTR(","));
                    v60 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v33, "allObjects");
                    v61 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v61, "componentsJoinedByString:", CFSTR(","));
                    v62 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138544386;
                    v124 = v104;
                    v125 = 2114;
                    v126 = v58;
                    v127 = 2114;
                    v128 = v59;
                    v129 = 2114;
                    v130 = v60;
                    v131 = 2114;
                    v132 = v62;
                    _os_log_impl(&dword_1B8C0C000, v57, OS_LOG_TYPE_DEFAULT, "Requested application %{public}@ has policy %{public}@, associated categories:%{public}@ associated sites:%{public}@ equivalent bundle identifiers:%{public}@", buf, 0x34u);

                    v25 = v94;
                    v54 = v85;
                  }

                  v26 = v86;
                  v22 = v87;
                  v30 = v95;
                  v27 = v96;
                  v31 = v98;
                  v23 = v88;
                }

              }
              else
              {
                DMFPolicyLog();
                v31 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543362;
                  v124 = v28;
                  _os_log_error_impl(&dword_1B8C0C000, v31, OS_LOG_TYPE_ERROR, "Requested application %{public}@ is missing categorization", buf, 0xCu);
                }
              }

              ++v27;
            }
            while (v27 != v25);
            v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v117, v134, 16);
          }
          while (v25);
        }

        v9 = v79;
        v6 = v80;
        v10 = v78;
      }
      else
      {
        DMFPolicyLog();
        v69 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
          -[DMFApplicationPolicyMonitor requestPoliciesForBundleIdentifiers:withError:].cold.2((uint64_t)a4, v69, v70, v71, v72, v73, v74, v75);

        v100 = 0;
      }

    }
    else
    {
      DMFPolicyLog();
      v63 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v134 = 0;
        _os_log_impl(&dword_1B8C0C000, v63, OS_LOG_TYPE_DEFAULT, "No policies are set, everything is OK", v134, 2u);
      }

      v111 = 0u;
      v112 = 0u;
      v109 = 0u;
      v110 = 0u;
      v64 = v6;
      v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v109, v122, 16);
      if (v65)
      {
        v66 = v65;
        v67 = *(_QWORD *)v110;
        do
        {
          for (k = 0; k != v66; ++k)
          {
            if (*(_QWORD *)v110 != v67)
              objc_enumerationMutation(v64);
            -[NSObject setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", &unk_1E6EF2C40, *(_QWORD *)(*((_QWORD *)&v109 + 1) + 8 * k));
          }
          v66 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v109, v122, 16);
        }
        while (v66);
      }

      v10 = v10;
      v100 = v10;
    }
  }
  else
  {
    DMFPolicyLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[DMFApplicationPolicyMonitor requestPoliciesForBundleIdentifiers:withError:].cold.1(self);
    v100 = 0;
  }

  return v100;
}

- (id)_initWithPolicyChangeHandler:(id)a3 addingRegistration:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  DMFApplicationPolicyMonitor *v7;
  uint64_t v8;
  NSArray *policyTypes;
  uint64_t v10;
  NSUUID *identifier;
  uint64_t v12;
  NSMutableDictionary *lastRequestDateByBundleIdentifiers;
  DMFPolicyRegistration *v14;
  void *v15;
  uint64_t v16;
  DMFPolicyRegistration *registration;
  void *v18;
  DMFPolicyRegistration *v19;
  NSUUID *v20;
  _QWORD v22[4];
  DMFApplicationPolicyMonitor *v23;
  objc_super v24;
  _QWORD v25[6];

  v4 = a4;
  v25[5] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v24.receiver = self;
  v24.super_class = (Class)DMFApplicationPolicyMonitor;
  v7 = -[DMFApplicationPolicyMonitor init](&v24, sel_init);
  if (v7)
  {
    v25[0] = CFSTR("applications");
    v25[1] = CFSTR("applicationcategories");
    v25[2] = CFSTR("categories");
    v25[3] = CFSTR("shield");
    v25[4] = CFSTR("websites");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 5);
    v8 = objc_claimAutoreleasedReturnValue();
    policyTypes = v7->_policyTypes;
    v7->_policyTypes = (NSArray *)v8;

    v10 = objc_opt_new();
    identifier = v7->_identifier;
    v7->_identifier = (NSUUID *)v10;

    v12 = objc_opt_new();
    lastRequestDateByBundleIdentifiers = v7->_lastRequestDateByBundleIdentifiers;
    v7->_lastRequestDateByBundleIdentifiers = (NSMutableDictionary *)v12;

    if (v6)
    {
      v14 = [DMFPolicyRegistration alloc];
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7->_policyTypes);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[DMFPolicyRegistration initWithIdentifier:policyTypes:callback:](v14, "initWithIdentifier:policyTypes:callback:", CFSTR("dmf.policy.monitor.app"), v15, v6);
      registration = v7->_registration;
      v7->_registration = (DMFPolicyRegistration *)v16;

      if (v4)
      {
        +[DMFPolicyMonitor policyMonitor](DMFPolicyMonitor, "policyMonitor");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v7->_identifier;
        v19 = v7->_registration;
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __79__DMFApplicationPolicyMonitor__initWithPolicyChangeHandler_addingRegistration___block_invoke;
        v22[3] = &unk_1E6ED7C28;
        v23 = v7;
        objc_msgSend(v18, "addRegistration:forPolicyMonitorIdentifier:completionHandler:", v19, v20, v22);

      }
    }
  }

  return v7;
}

- (void)requestPoliciesForBundleIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSMutableDictionary *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  id v30;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v6);
  v9 = self->_lastRequestDateByBundleIdentifiers;
  objc_sync_enter(v9);
  v10 = (void *)objc_opt_new();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_lastRequestDateByBundleIdentifiers, "setObject:forKeyedSubscript:", v10, v8);
  objc_sync_exit(v9);

  v11 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __85__DMFApplicationPolicyMonitor_requestPoliciesForBundleIdentifiers_completionHandler___block_invoke;
  v26[3] = &unk_1E6ED7CA0;
  v30 = v7;
  v26[4] = self;
  v27 = v6;
  v12 = v8;
  v28 = v12;
  v13 = v10;
  v29 = v13;
  v14 = v6;
  v15 = v7;
  v16 = (void *)MEMORY[0x1BCCB7F34](v26);
  +[DMFPolicyMonitor policyMonitor](DMFPolicyMonitor, "policyMonitor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMFApplicationPolicyMonitor policyTypes](self, "policyTypes");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v11;
  v22[1] = 3221225472;
  v22[2] = __85__DMFApplicationPolicyMonitor_requestPoliciesForBundleIdentifiers_completionHandler___block_invoke_13;
  v22[3] = &unk_1E6ED7CC8;
  v22[4] = self;
  v23 = v12;
  v24 = v13;
  v25 = v16;
  v19 = v13;
  v20 = v12;
  v21 = v16;
  objc_msgSend(v17, "requestPoliciesForTypes:completionHandler:", v18, v22);

}

- (NSArray)policyTypes
{
  return self->_policyTypes;
}

void __85__DMFApplicationPolicyMonitor_requestPoliciesForBundleIdentifiers_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[8];
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    if (objc_msgSend(v5, "count"))
    {
      objc_msgSend((id)objc_opt_class(), "fetchParentBundleIdentifiersForBundleIdentifiers:", *(_QWORD *)(a1 + 40));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_opt_new();
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      objc_msgSend(v8, "allValues");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v33;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v33 != v13)
              objc_enumerationMutation(v10);
            objc_msgSend(v9, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v14++));
          }
          while (v12 != v14);
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
        }
        while (v12);
      }

      objc_msgSend(*(id *)(a1 + 40), "arrayByAddingObjectsFromArray:", v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_opt_class();
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __85__DMFApplicationPolicyMonitor_requestPoliciesForBundleIdentifiers_completionHandler___block_invoke_12;
      v25[3] = &unk_1E6ED7C78;
      v25[4] = *(_QWORD *)(a1 + 32);
      v26 = *(id *)(a1 + 48);
      v27 = *(id *)(a1 + 56);
      v31 = *(id *)(a1 + 64);
      v28 = *(id *)(a1 + 40);
      v29 = v5;
      v30 = v8;
      v17 = v8;
      objc_msgSend(v16, "_fetchCategoriesForBundleIdentifiers:completionHandler:", v15, v25);

    }
    else
    {
      DMFPolicyLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B8C0C000, v19, OS_LOG_TYPE_DEFAULT, "No policies are set, everything is OK", buf, 2u);
      }

      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v20 = *(id *)(a1 + 40);
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v37;
        do
        {
          v24 = 0;
          do
          {
            if (*(_QWORD *)v37 != v23)
              objc_enumerationMutation(v20);
            objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_1E6EF2C40, *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v24++));
          }
          while (v22 != v24);
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
        }
        while (v22);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    }

  }
  else
  {
    DMFPolicyLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      __85__DMFApplicationPolicyMonitor_requestPoliciesForBundleIdentifiers_completionHandler___block_invoke_cold_1(a1);

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

void __85__DMFApplicationPolicyMonitor_requestPoliciesForBundleIdentifiers_completionHandler___block_invoke_13(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  (*(void (**)(void))(a1[7] + 16))();
  v6 = *(id *)(a1[4] + 8);
  objc_sync_enter(v6);
  objc_msgSend(*(id *)(a1[4] + 8), "objectForKeyedSubscript:", a1[5]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToDate:", a1[6]))
    objc_msgSend(*(id *)(a1[4] + 8), "setObject:forKeyedSubscript:", 0, a1[5]);

  objc_sync_exit(v6);
}

void __79__DMFApplicationPolicyMonitor__initWithPolicyChangeHandler_addingRegistration___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if (!a2)
  {
    DMFPolicyLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __79__DMFApplicationPolicyMonitor__initWithPolicyChangeHandler_addingRegistration___block_invoke_cold_1(a1, (uint64_t)v5, v6);

  }
}

+ (void)createPolicyMonitorWithPolicyChangeHandler:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, void *, uint64_t);
  void *v18;
  id v19;
  id v20;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithPolicyChangeHandler:addingRegistration:", v7, 0);

  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __92__DMFApplicationPolicyMonitor_createPolicyMonitorWithPolicyChangeHandler_completionHandler___block_invoke;
  v18 = &unk_1E6ED7C50;
  v9 = v6;
  v20 = v9;
  v10 = v8;
  v19 = v10;
  v11 = (void *)MEMORY[0x1BCCB7F34](&v15);
  +[DMFPolicyMonitor policyMonitor](DMFPolicyMonitor, "policyMonitor", v15, v16, v17, v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v10, "registration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addRegistration:forPolicyMonitorIdentifier:completionHandler:", v13, v14, v11);

  }
  else
  {
    objc_msgSend(v10, "policyTypes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "requestPoliciesForTypes:completionHandler:", v13, v11);
  }

}

uint64_t __92__DMFApplicationPolicyMonitor_createPolicyMonitorWithPolicyChangeHandler_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t (*v4)(void);

  if (a3)
  {
    v4 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    objc_msgSend(a2, "count");
    v4 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  return v4();
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[DMFPolicyMonitor policyMonitor](DMFPolicyMonitor, "policyMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidatePolicyMonitor:", self->_identifier);

  v4.receiver = self;
  v4.super_class = (Class)DMFApplicationPolicyMonitor;
  -[DMFApplicationPolicyMonitor dealloc](&v4, sel_dealloc);
}

void __85__DMFApplicationPolicyMonitor_requestPoliciesForBundleIdentifiers_completionHandler___block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  unint64_t v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  id obj;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  void *v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  uint8_t v81[4];
  uint64_t v82;
  __int16 v83;
  uint64_t v84;
  __int16 v85;
  void *v86;
  __int16 v87;
  void *v88;
  __int16 v89;
  void *v90;
  uint8_t v91[128];
  uint8_t buf[136];
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v53 = a3;
  v6 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  objc_sync_enter(v6);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v6);

  v52 = v7;
  v51 = v5;
  if (objc_msgSend(v7, "compare:", *(_QWORD *)(a1 + 48)) == 1)
  {
    DMFPolicyLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B8C0C000, v8, OS_LOG_TYPE_DEFAULT, "Canceling current policy request because a more recent request is in-flight", buf, 2u);
    }

    goto LABEL_53;
  }
  if (v5)
  {
    v9 = *(void **)(a1 + 64);
    v10 = *(void **)(a1 + 72);
    v49 = *(_QWORD *)(a1 + 80);
    v11 = *(id *)(a1 + 56);
    v12 = v9;
    v13 = v5;
    v59 = v10;
    v63 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v11, "count"));
    v50 = v12;
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("applications"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("applicationcategories"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("categories"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("websites"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    +[DMFEffectivePolicy unblockableBundleIdentifiers](DMFEffectivePolicy, "unblockableBundleIdentifiers");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    +[DMFEffectivePolicy unblockableCategoryIdentifiers](DMFEffectivePolicy, "unblockableCategoryIdentifiers");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    obj = v11;
    v66 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, buf, 16);
    if (!v66)
      goto LABEL_49;
    v65 = *(_QWORD *)v78;
    while (1)
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v78 != v65)
        {
          v15 = v14;
          objc_enumerationMutation(obj);
          v14 = v15;
        }
        v69 = v14;
        v16 = *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * v14);
        objc_msgSend(v13, "objectForKeyedSubscript:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = v17;
        if (v17)
        {
          objc_msgSend(v17, "identifier");
          v70 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "webDomains");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "equivalentBundleIdentifiers");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v16);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v71, "count"))
            objc_msgSend(v68, "addObjectsFromArray:", v71);
          if (objc_msgSend(v62, "containsObject:", v16))
          {
            DMFPolicyLog();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v81 = 138543362;
              v82 = v16;
              _os_log_impl(&dword_1B8C0C000, v18, OS_LOG_TYPE_DEFAULT, "Requested application %{public}@ is unblockable", v81, 0xCu);
            }
            goto LABEL_17;
          }
          if (v70 && objc_msgSend(v54, "containsObject:", v70))
          {
            DMFPolicyLog();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v81 = 138543618;
              v82 = v16;
              v83 = 2114;
              v84 = v70;
              _os_log_impl(&dword_1B8C0C000, v18, OS_LOG_TYPE_DEFAULT, "Requested application %{public}@ with associated category %{public}@ is unblockable", v81, 0x16u);
            }
LABEL_17:

            objc_msgSend(v63, "setObject:forKeyedSubscript:", &unk_1E6EF2C40, v16);
          }
          else
          {
            v20 = (void *)objc_opt_new();
            objc_msgSend(v59, "objectForKeyedSubscript:", v16);
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v64, "count"))
            {
              DMFPolicyLog();
              v21 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v64, "componentsJoinedByString:", CFSTR(","));
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)v81 = 138543618;
                v82 = v16;
                v83 = 2114;
                v84 = (uint64_t)v22;
                _os_log_impl(&dword_1B8C0C000, v21, OS_LOG_TYPE_DEFAULT, "Requested application %{public}@ has parent applications %{public}@", v81, 0x16u);

              }
              v75 = 0u;
              v76 = 0u;
              v73 = 0u;
              v74 = 0u;
              v23 = v64;
              v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v73, v91, 16);
              if (v24)
              {
                v25 = *(_QWORD *)v74;
                do
                {
                  for (i = 0; i != v24; ++i)
                  {
                    if (*(_QWORD *)v74 != v25)
                      objc_enumerationMutation(v23);
                    v27 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
                    objc_msgSend(v13, "objectForKeyedSubscript:", v27);
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    v29 = v28;
                    if (v28)
                    {
                      objc_msgSend(v28, "identifier");
                      v30 = objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v20, "addObject:", v30);
                    }
                    else
                    {
                      DMFPolicyLog();
                      v30 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)v81 = 138543618;
                        v82 = v16;
                        v83 = 2114;
                        v84 = (uint64_t)v27;
                        _os_log_error_impl(&dword_1B8C0C000, v30, OS_LOG_TYPE_ERROR, "Requested application %{public}@ failed to categorize parent application %{public}@", v81, 0x16u);
                      }
                    }

                  }
                  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v73, v91, 16);
                }
                while (v24);
              }

            }
            if (v70)
            {
              objc_msgSend(v20, "arrayByAddingObject:");
              v31 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v31 = v20;
            }
            v32 = v31;
            objc_msgSend(v68, "allObjects");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            +[DMFPrioritizedPolicy prioritizedPoliciesForAppPolicy:appCategoryPolicy:bundleIdentifiers:categoryPolicy:categoryIdentifiers:webPolicy:webCategoryPolicy:webDomains:](DMFPrioritizedPolicy, "prioritizedPoliciesForAppPolicy:appCategoryPolicy:bundleIdentifiers:categoryPolicy:categoryIdentifiers:webPolicy:webCategoryPolicy:webDomains:", v57, v58, v33, v56, v32, v55, 0, v67);
            v34 = (void *)objc_claimAutoreleasedReturnValue();

            v35 = +[DMFPrioritizedPolicy arbitratePolicyForPrioritizedPolicies:](DMFPrioritizedPolicy, "arbitratePolicyForPrioritizedPolicies:", v34);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v35);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v63, "setObject:forKeyedSubscript:", v36, v16);

            DMFPolicyLog();
            v37 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            {
              DMFPolicyUnlocalizedDisplayName(v35);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "componentsJoinedByString:", CFSTR(","));
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v67, "componentsJoinedByString:", CFSTR(","));
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v68, "allObjects");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "componentsJoinedByString:", CFSTR(","));
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v81 = 138544386;
              v82 = v16;
              v83 = 2114;
              v84 = (uint64_t)v38;
              v85 = 2114;
              v86 = v60;
              v87 = 2114;
              v88 = v39;
              v89 = 2114;
              v90 = v41;
              _os_log_impl(&dword_1B8C0C000, v37, OS_LOG_TYPE_DEFAULT, "Requested application %{public}@ has policy %{public}@, associated categories:%{public}@ associated sites:%{public}@ equivalent bundle identifiers:%{public}@", v81, 0x34u);

            }
          }

          v19 = v70;
          goto LABEL_47;
        }
        DMFPolicyLog();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v81 = 138543362;
          v82 = v16;
          _os_log_error_impl(&dword_1B8C0C000, v19, OS_LOG_TYPE_ERROR, "Requested application %{public}@ is missing categorization", v81, 0xCu);
        }
LABEL_47:

        v14 = v69 + 1;
      }
      while (v69 + 1 != v66);
      v66 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, buf, 16);
      if (!v66)
      {
LABEL_49:

        (*(void (**)(uint64_t, void *, _QWORD))(v49 + 16))(v49, v63, 0);
        goto LABEL_53;
      }
    }
  }
  DMFPolicyLog();
  v42 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    __85__DMFApplicationPolicyMonitor_requestPoliciesForBundleIdentifiers_completionHandler___block_invoke_12_cold_1((uint64_t)v53, v42, v43, v44, v45, v46, v47, v48);

  (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
LABEL_53:

}

+ (id)fetchParentBundleIdentifiersForBundleIdentifiers:(id)a3
{
  id v3;
  uint64_t i;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v22;
  id obj;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  void *v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v3;
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
  if (v25)
  {
    v24 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v34 != v24)
          objc_enumerationMutation(obj);
        v5 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
        v6 = objc_alloc(MEMORY[0x1E0CA5870]);
        v32 = 0;
        v7 = (void *)objc_msgSend(v6, "initWithBundleIdentifier:allowPlaceholder:error:", v5, 1, &v32);
        v8 = v32;
        v9 = v8;
        if (v7)
        {
          v26 = v8;
          v10 = objc_opt_new();
          v27 = v7;
          objc_msgSend(v7, "appClipMetadata");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "parentApplicationIdentifiers");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          v30 = 0u;
          v31 = 0u;
          v28 = 0u;
          v29 = 0u;
          v13 = v12;
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v41, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v29;
            do
            {
              v17 = 0;
              do
              {
                if (*(_QWORD *)v29 != v16)
                  objc_enumerationMutation(v13);
                v18 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v17);
                if (!CPCopyBundleIdentifierAndTeamFromApplicationIdentifier())
                {
                  DMFPolicyLog();
                  v19 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138543618;
                    v38 = v5;
                    v39 = 2114;
                    v40 = v18;
                    _os_log_error_impl(&dword_1B8C0C000, v19, OS_LOG_TYPE_ERROR, "Failed looking up parent bundle identifier for app clip: %{public}@ with parent application identifier %{public}@", buf, 0x16u);
                  }

                }
                ++v17;
              }
              while (v15 != v17);
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v41, 16);
            }
            while (v15);
          }

          if (-[NSObject count](v10, "count"))
            objc_msgSend(v22, "setObject:forKeyedSubscript:", v10, v5);

          v9 = v26;
          v7 = v27;
        }
        else
        {
          DMFPolicyLog();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v38 = v5;
            v39 = 2114;
            v40 = v9;
            _os_log_impl(&dword_1B8C0C000, v10, OS_LOG_TYPE_DEFAULT, "No application record for bundle identifier: %{public}@ with error: %{public}@", buf, 0x16u);
          }
        }

      }
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
    }
    while (v25);
  }

  v20 = (void *)objc_msgSend(v22, "copy");
  return v20;
}

+ (id)_fetchCategoriesForBundleIdentifiers:(id)a3 withError:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  id v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *, void *);
  void *v17;
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3538]), "initWithCondition:", 0);
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy_;
  v32 = __Block_byref_object_dispose_;
  v33 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  v27 = 0;
  objc_msgSend(MEMORY[0x1E0D0D508], "sharedCategories");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __78__DMFApplicationPolicyMonitor__fetchCategoriesForBundleIdentifiers_withError___block_invoke;
  v17 = &unk_1E6ED7CF0;
  v19 = &v28;
  v20 = &v22;
  v8 = v6;
  v18 = v8;
  v21 = 1;
  objc_msgSend(v7, "categoriesForBundleIDs:completionHandler:", v5, &v14);

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 2.0, v14, v15, v16, v17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "lockWhenCondition:beforeDate:", 1, v9);

  if ((v10 & 1) != 0)
  {
    objc_msgSend(v8, "unlock");
    if (a4)
    {
      v11 = (void *)v29[5];
      if (v11)
        *a4 = objc_retainAutorelease(v11);
    }
    v12 = (id)v23[5];
  }
  else if (a4)
  {
    DMFErrorWithCodeAndUserInfo();
    v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v12;
}

void __78__DMFApplicationPolicyMonitor__fetchCategoriesForBundleIdentifiers_withError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void **v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v8 = v5;
  }
  else
  {
    v7 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v8 = v11;
  }
  v9 = v8;
  v10 = *v7;
  *v7 = v9;

  objc_msgSend(*(id *)(a1 + 32), "lock");
  objc_msgSend(*(id *)(a1 + 32), "unlockWithCondition:", *(_QWORD *)(a1 + 56));

}

+ (void)_fetchCategoriesForBundleIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v5 = a4;
  v6 = (void *)MEMORY[0x1E0D0D508];
  v7 = a3;
  objc_msgSend(v6, "sharedCategories");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __86__DMFApplicationPolicyMonitor__fetchCategoriesForBundleIdentifiers_completionHandler___block_invoke;
  v10[3] = &unk_1E6ED7D18;
  v11 = v5;
  v9 = v5;
  objc_msgSend(v8, "categoriesForBundleIDs:completionHandler:", v7, v10);

}

uint64_t __86__DMFApplicationPolicyMonitor__fetchCategoriesForBundleIdentifiers_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (DMFPolicyRegistration)registration
{
  return self->_registration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registration, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_policyTypes, 0);
  objc_storeStrong((id *)&self->_lastRequestDateByBundleIdentifiers, 0);
}

void __79__DMFApplicationPolicyMonitor__initWithPolicyChangeHandler_addingRegistration___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
  v5 = 138543874;
  v6 = v4;
  v7 = 2114;
  v8 = v3;
  v9 = 2114;
  v10 = a2;
  _os_log_error_impl(&dword_1B8C0C000, log, OS_LOG_TYPE_ERROR, "Failed to register application policy monitor with identifier %{public}@ for types %{public}@ with error: %{public}@", (uint8_t *)&v5, 0x20u);
}

- (void)requestPoliciesForBundleIdentifiers:(void *)a1 withError:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "policyTypes");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0(&dword_1B8C0C000, v2, v3, "Failed to request policies for types %{public}@ with error: %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1();
}

- (void)requestPoliciesForBundleIdentifiers:(uint64_t)a3 withError:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1B8C0C000, a2, a3, "Failed fetching categories for bundle identifiers with error: %{public}@", a5, a6, a7, a8, 2u);
}

void __85__DMFApplicationPolicyMonitor_requestPoliciesForBundleIdentifiers_completionHandler___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "policyTypes");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0(&dword_1B8C0C000, v2, v3, "Failed to request policies for types %{public}@ with error: %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1();
}

void __85__DMFApplicationPolicyMonitor_requestPoliciesForBundleIdentifiers_completionHandler___block_invoke_12_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1B8C0C000, a2, a3, "Failed fetching categories for bundle identifiers with error: %{public}@", a5, a6, a7, a8, 2u);
}

@end
