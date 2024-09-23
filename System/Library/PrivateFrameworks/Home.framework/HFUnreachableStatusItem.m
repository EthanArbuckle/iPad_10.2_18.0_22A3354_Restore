@implementation HFUnreachableStatusItem

uint64_t __55__HFUnreachableStatusItem__subclass_updateWithOptions___block_invoke_10(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isReachable") ^ 1;
}

uint64_t __55__HFUnreachableStatusItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;

  v3 = a2;
  objc_msgSend(v3, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && (objc_msgSend(v3, "hf_isLegacyService") & 1) == 0)
  {
    objc_msgSend(v3, "accessory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isReachable");

    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 32), "home");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "hf_characteristicValueManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "accessory");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __55__HFUnreachableStatusItem__subclass_updateWithOptions___block_invoke_2;
      v14[3] = &unk_1EA739710;
      v12 = v3;
      v13 = *(_QWORD *)(a1 + 32);
      v15 = v12;
      v16 = v13;
      v5 = objc_msgSend(v10, "hasCachedReadErrorForAccessory:passingTest:", v11, v14);

    }
    else
    {
      v5 = 1;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __55__HFUnreachableStatusItem__subclass_updateWithOptions___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a2, "services");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v2, "intersectsSet:", v5);

  return v6;
}

BOOL __55__HFUnreachableStatusItem__subclass_updateWithOptions___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  _BOOL8 v6;
  void *v8;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3) & 1) != 0
    || (objc_msgSend(v3, "hf_standardServices"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "count"),
        v4,
        v5)
    || (objc_msgSend(v3, "hf_isBridge") & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v3, "hf_linkedResidentDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v8 == 0;

  }
  return v6;
}

uint64_t __55__HFUnreachableStatusItem__subclass_updateWithOptions___block_invoke_7(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v18;
  uint64_t v19;
  os_activity_scope_state_s v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!objc_msgSend(v3, "hf_isHomePod"))
    goto LABEL_8;
  v4 = (void *)a1[4];
  v5 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v3, "services");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "intersectsSet:", v7);

  if ((_DWORD)v4)
  {
    v8 = (void *)a1[5];
    if (v8)
    {
      objc_msgSend(v8, "loggerActivity", 0, 0);
      v9 = objc_claimAutoreleasedReturnValue();
      os_activity_scope_enter(v9, &v20);

      HFLogForCategory(0x29uLL);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = a1[6];
        *(_DWORD *)buf = 138412546;
        v22 = v11;
        v23 = 2112;
        v24 = v3;
        _os_log_impl(&dword_1DD34E000, v10, OS_LOG_TYPE_DEFAULT, "%@: Service(s) unreachable for homepod accessory: %@ - excluding homepod from unreachableServiceBasedAccessories", buf, 0x16u);
      }

      os_activity_scope_leave(&v20);
    }
    else
    {
      HFLogForCategory(0x29uLL);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = a1[6];
        *(_DWORD *)buf = 138412546;
        v22 = v19;
        v23 = 2112;
        v24 = v3;
        _os_log_impl(&dword_1DD34E000, v18, OS_LOG_TYPE_DEFAULT, "%@: Service(s) unreachable for homepod accessory: %@ - excluding homepod from unreachableServiceBasedAccessories", buf, 0x16u);
      }

    }
    v12 = 0;
  }
  else
  {
LABEL_8:
    v13 = (void *)a1[4];
    v14 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v3, "services");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setWithArray:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v13, "intersectsSet:", v16);

  }
  return v12;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  id location;
  _QWORD v26[5];
  const __CFString *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", HFItemUpdateOptionFastInitialUpdate);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0D519C0];
    v27 = CFSTR("hidden");
    v28[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "futureWithResult:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[HFStatusItem filteredServices](self, "filteredServices");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __55__HFUnreachableStatusItem__subclass_updateWithOptions___block_invoke;
    v26[3] = &unk_1EA7283A0;
    v26[4] = self;
    objc_msgSend(v11, "na_filter:", v26);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v14 = (void *)MEMORY[0x1E0D519C0];
    v20[0] = v12;
    v20[1] = 3221225472;
    v20[2] = __55__HFUnreachableStatusItem__subclass_updateWithOptions___block_invoke_3;
    v20[3] = &unk_1EA736430;
    objc_copyWeak(&v24, &location);
    v21 = v4;
    v8 = v11;
    v22 = v8;
    v15 = v13;
    v23 = v15;
    objc_msgSend(MEMORY[0x1E0D519E8], "globalAsyncScheduler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "futureWithBlock:scheduler:", v20, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "reschedule:", v18);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);

  }
  return v10;
}

void __55__HFUnreachableStatusItem__subclass_updateWithOptions___block_invoke_3(id *a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  BOOL v48;
  char v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  NSObject *v62;
  NSObject *v63;
  void *v64;
  char v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  NSObject *v74;
  NSObject *v75;
  uint64_t v76;
  const char *v77;
  NSObject *v78;
  NSObject *v79;
  uint64_t v80;
  const char *v81;
  void *v82;
  void *v83;
  void *v84;
  HFImageIconDescriptor *v85;
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
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  NSObject *v103;
  uint64_t v104;
  NSObject *v105;
  uint64_t v106;
  NSObject *v107;
  uint64_t v108;
  uint64_t v109;
  NSObject *v110;
  uint64_t v111;
  uint64_t v112;
  NSObject *v113;
  uint64_t v114;
  uint64_t v115;
  NSObject *v116;
  void *v117;
  NSObject *v118;
  uint64_t v119;
  const char *v120;
  NSObject *v121;
  uint64_t v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  void *v126;
  id *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  os_activity_scope_state_s state;
  _QWORD v138[5];
  _QWORD v139[4];
  id v140;
  id v141;
  void *v142;
  _QWORD v143[5];
  _QWORD v144[4];
  id v145;
  _QWORD v146[4];
  id v147;
  uint8_t buf[4];
  void *v149;
  __int16 v150;
  uint64_t v151;
  __int16 v152;
  uint64_t v153;
  __int16 v154;
  void *v155;
  const __CFString *v156;
  _QWORD v157[4];

  v157[1] = *MEMORY[0x1E0C80C00];
  v3 = a1 + 7;
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  if (!WeakRetained)
  {
    v156 = CFSTR("hidden");
    v157[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v157, &v156, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "finishWithResult:", v10);
    goto LABEL_51;
  }
  objc_msgSend(a1[4], "objectForKeyedSubscript:", HFItemUpdateOptionLogger);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "room");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C99E60];
  v129 = v4;
  if (v7)
    objc_msgSend(WeakRetained, "room");
  else
    objc_msgSend(WeakRetained, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "accessories");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = MEMORY[0x1E0C809B0];
  v146[0] = MEMORY[0x1E0C809B0];
  v146[1] = 3221225472;
  v146[2] = __55__HFUnreachableStatusItem__subclass_updateWithOptions___block_invoke_4;
  v146[3] = &unk_1EA727840;
  v147 = a1[5];
  objc_msgSend(v13, "na_filter:", v146);
  v144[0] = v14;
  v144[1] = 3221225472;
  v144[2] = __55__HFUnreachableStatusItem__subclass_updateWithOptions___block_invoke_5;
  v144[3] = &unk_1EA727840;
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v145 = v15;
  v131 = v13;
  objc_msgSend(v13, "na_filter:", v144);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(WeakRetained, "home");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "residentDevices");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setWithArray:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v143[0] = v14;
  v143[1] = 3221225472;
  v143[2] = __55__HFUnreachableStatusItem__subclass_updateWithOptions___block_invoke_6;
  v143[3] = &unk_1EA72E620;
  v143[4] = WeakRetained;
  objc_msgSend(v20, "na_filter:", v143);
  v136 = WeakRetained;
  v21 = objc_claimAutoreleasedReturnValue();

  v22 = v15;
  v139[0] = v14;
  v139[1] = 3221225472;
  v139[2] = __55__HFUnreachableStatusItem__subclass_updateWithOptions___block_invoke_7;
  v139[3] = &unk_1EA739738;
  v127 = a1;
  v140 = a1[6];
  v23 = v6;
  v141 = v23;
  v142 = v136;
  objc_msgSend(v15, "na_filter:", v139);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v134 = v16;
  objc_msgSend(v16, "na_filter:", &__block_literal_global_162);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  v138[0] = v14;
  v138[1] = 3221225472;
  v138[2] = __55__HFUnreachableStatusItem__subclass_updateWithOptions___block_invoke_2_11;
  v138[3] = &unk_1EA72E620;
  v25 = (void *)v21;
  v26 = v136;
  v138[4] = v136;
  objc_msgSend(v25, "na_filter:", v138);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v133 = v23;
  if (v23)
  {
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    objc_msgSend(v23, "loggerActivity");
    v28 = objc_claimAutoreleasedReturnValue();
    os_activity_scope_enter(v28, &state);

    HFLogForCategory(0x29uLL);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v30 = objc_msgSend(v24, "count");
      v31 = objc_msgSend(v15, "count");
      *(_DWORD *)buf = 138413058;
      v149 = v136;
      v150 = 2048;
      v151 = v30;
      v152 = 2048;
      v153 = v31;
      v154 = 2112;
      v155 = v24;
      _os_log_impl(&dword_1DD34E000, v29, OS_LOG_TYPE_DEFAULT, "%@: %lu of %lu service based accessories unreachable: %@", buf, 0x2Au);
    }

    os_activity_scope_leave(&state);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    objc_msgSend(v23, "loggerActivity");
    v32 = objc_claimAutoreleasedReturnValue();
    os_activity_scope_enter(v32, &state);

    HFLogForCategory(0x29uLL);
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      v34 = objc_msgSend(v135, "count");
      v35 = objc_msgSend(v134, "count");
      *(_DWORD *)buf = 138413058;
      v149 = v136;
      v150 = 2048;
      v151 = v34;
      v152 = 2048;
      v153 = v35;
      v154 = 2112;
      v155 = v135;
      _os_log_impl(&dword_1DD34E000, v33, OS_LOG_TYPE_DEFAULT, "%@: %lu of %lu non-service based accessories unreachable: %@", buf, 0x2Au);
    }

    os_activity_scope_leave(&state);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    objc_msgSend(v23, "loggerActivity");
    v36 = objc_claimAutoreleasedReturnValue();
    os_activity_scope_enter(v36, &state);

    HFLogForCategory(0x29uLL);
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      v38 = objc_msgSend(v27, "count");
      v39 = objc_msgSend(v25, "count");
      *(_DWORD *)buf = 138413058;
      v149 = v136;
      v150 = 2048;
      v151 = v38;
      v152 = 2048;
      v153 = v39;
      v154 = 2112;
      v155 = v27;
      _os_log_impl(&dword_1DD34E000, v37, OS_LOG_TYPE_DEFAULT, "%@: %lu of %lu resident devices unreachable: %@", buf, 0x2Au);
    }

    os_activity_scope_leave(&state);
  }
  else
  {
    HFLogForCategory(0x29uLL);
    v107 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
    {
      v108 = objc_msgSend(v24, "count");
      v109 = objc_msgSend(v15, "count");
      *(_DWORD *)buf = 138413058;
      v149 = v136;
      v150 = 2048;
      v151 = v108;
      v152 = 2048;
      v153 = v109;
      v154 = 2112;
      v155 = v24;
      _os_log_impl(&dword_1DD34E000, v107, OS_LOG_TYPE_DEFAULT, "%@: %lu of %lu service based accessories unreachable: %@", buf, 0x2Au);
    }

    HFLogForCategory(0x29uLL);
    v110 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT))
    {
      v111 = objc_msgSend(v135, "count");
      v112 = objc_msgSend(v134, "count");
      *(_DWORD *)buf = 138413058;
      v149 = v136;
      v150 = 2048;
      v151 = v111;
      v152 = 2048;
      v153 = v112;
      v154 = 2112;
      v155 = v135;
      _os_log_impl(&dword_1DD34E000, v110, OS_LOG_TYPE_DEFAULT, "%@: %lu of %lu non-service based accessories unreachable: %@", buf, 0x2Au);
    }

    HFLogForCategory(0x29uLL);
    v113 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
    {
      v114 = objc_msgSend(v27, "count");
      v115 = objc_msgSend(v25, "count");
      *(_DWORD *)buf = 138413058;
      v149 = v136;
      v150 = 2048;
      v151 = v114;
      v152 = 2048;
      v153 = v115;
      v154 = 2112;
      v155 = v27;
      _os_log_impl(&dword_1DD34E000, v113, OS_LOG_TYPE_DEFAULT, "%@: %lu of %lu resident devices unreachable: %@", buf, 0x2Au);
    }

  }
  objc_msgSend(v24, "setByAddingObjectsFromSet:", v135);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "na_map:", &__block_literal_global_15_11);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setByAddingObjectsFromSet:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  v44 = objc_msgSend(v24, "count");
  v130 = v22;
  v45 = objc_msgSend(v22, "count");
  v46 = objc_msgSend(v135, "count");
  v47 = objc_msgSend(v134, "count");
  v132 = v40;
  if (objc_msgSend(v40, "count"))
    v48 = v44 == v45;
  else
    v48 = 0;
  v50 = !v48 || v46 != v47;
  v51 = objc_msgSend(v27, "count");
  v52 = objc_msgSend(v25, "count");
  v128 = v25;
  if (!+[HFUtilities shouldShowReachabilityErrors](HFUtilities, "shouldShowReachabilityErrors"))
    goto LABEL_40;
  if (objc_msgSend(v43, "count") == 1)
  {
    objc_msgSend(v43, "anyObject");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v136, "displayNameForHomeKitObject:", v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    HFLocalizedStringWithFormat(CFSTR("HFStatusTitleUnreachable_One"), CFSTR("%@"), v55, v56, v57, v58, v59, v60, (uint64_t)v54);
    v61 = objc_claimAutoreleasedReturnValue();
    if (v133)
    {
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      objc_msgSend(v133, "loggerActivity");
      v62 = objc_claimAutoreleasedReturnValue();
      os_activity_scope_enter(v62, &state);

      HFLogForCategory(0x29uLL);
      v63 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v43, "anyObject");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v149 = v136;
        v150 = 2112;
        v151 = (uint64_t)v64;
        _os_log_impl(&dword_1DD34E000, v63, OS_LOG_TYPE_DEFAULT, "%@: Showing unreachable status for single HomeKit object: %@", buf, 0x16u);

      }
      os_activity_scope_leave(&state);
    }
    else
    {
      HFLogForCategory(0x29uLL);
      v116 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v116, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v43, "anyObject");
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v149 = v136;
        v150 = 2112;
        v151 = (uint64_t)v117;
        _os_log_impl(&dword_1DD34E000, v116, OS_LOG_TYPE_DEFAULT, "%@: Showing unreachable status for single HomeKit object: %@", buf, 0x16u);

      }
    }

    goto LABEL_46;
  }
  if (v51 == v52)
    v65 = v50;
  else
    v65 = 1;
  if ((v65 & 1) == 0)
  {
    _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusTitleUnreachable_AllAccessories"), CFSTR("HFStatusTitleUnreachable_AllAccessories"), 1);
    v61 = objc_claimAutoreleasedReturnValue();
    if (v133)
    {
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      objc_msgSend(v133, "loggerActivity");
      v78 = objc_claimAutoreleasedReturnValue();
      os_activity_scope_enter(v78, &state);

      HFLogForCategory(0x29uLL);
      v79 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
      {
LABEL_45:

        os_activity_scope_leave(&state);
LABEL_46:
        v73 = (void *)v61;
        goto LABEL_47;
      }
      v80 = objc_msgSend(v43, "count");
      *(_DWORD *)buf = 138412802;
      v149 = v136;
      v150 = 2048;
      v151 = v80;
      v152 = 2112;
      v153 = (uint64_t)v43;
      v81 = "%@: Showing unreachable status for all HomeKit objects (%lu): %@";
LABEL_44:
      _os_log_impl(&dword_1DD34E000, v79, OS_LOG_TYPE_DEFAULT, v81, buf, 0x20u);
      goto LABEL_45;
    }
    HFLogForCategory(0x29uLL);
    v118 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v118, OS_LOG_TYPE_DEFAULT))
    {
      v119 = objc_msgSend(v43, "count");
      *(_DWORD *)buf = 138412802;
      v149 = v136;
      v150 = 2048;
      v151 = v119;
      v152 = 2112;
      v153 = (uint64_t)v43;
      v120 = "%@: Showing unreachable status for all HomeKit objects (%lu): %@";
LABEL_74:
      _os_log_impl(&dword_1DD34E000, v118, OS_LOG_TYPE_DEFAULT, v120, buf, 0x20u);
    }
LABEL_75:

    v26 = v136;
    goto LABEL_46;
  }
  if ((unint64_t)objc_msgSend(v27, "count") >= 2 && !objc_msgSend(v40, "count"))
  {
    if (v51 != v52
      || (objc_msgSend(v136, "room"), v95 = (void *)objc_claimAutoreleasedReturnValue(), v95, v95))
    {
      v96 = objc_msgSend(v27, "count");
      HFLocalizedStringWithFormat(CFSTR("HFStatusTitleUnreachable_MultipleResidentDevices"), CFSTR("%lu"), v97, v98, v99, v100, v101, v102, v96);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      if (v133)
      {
        state.opaque[0] = 0;
        state.opaque[1] = 0;
        objc_msgSend(v133, "loggerActivity");
        v103 = objc_claimAutoreleasedReturnValue();
        os_activity_scope_enter(v103, &state);

        HFLogForCategory(0x29uLL);
        v75 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
        {
          v104 = objc_msgSend(v27, "count");
          *(_DWORD *)buf = 138412802;
          v149 = v136;
          v150 = 2048;
          v151 = v104;
          v152 = 2112;
          v153 = (uint64_t)v27;
          v77 = "%@: Showing unreachable status for %lu resident devices: %@";
          goto LABEL_57;
        }
LABEL_58:

        os_activity_scope_leave(&state);
        goto LABEL_47;
      }
      HFLogForCategory(0x29uLL);
      v121 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
      {
        v124 = objc_msgSend(v27, "count");
        *(_DWORD *)buf = 138412802;
        v149 = v136;
        v150 = 2048;
        v151 = v124;
        v152 = 2112;
        v153 = (uint64_t)v27;
        v123 = "%@: Showing unreachable status for %lu resident devices: %@";
        goto LABEL_80;
      }
LABEL_81:

      v26 = v136;
      goto LABEL_47;
    }
    _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusTitleUnreachable_AllResidentDevices"), CFSTR("HFStatusTitleUnreachable_AllResidentDevices"), 1);
    v61 = objc_claimAutoreleasedReturnValue();
    if (v133)
    {
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      objc_msgSend(v133, "loggerActivity");
      v105 = objc_claimAutoreleasedReturnValue();
      os_activity_scope_enter(v105, &state);

      HFLogForCategory(0x29uLL);
      v79 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
        goto LABEL_45;
      v106 = objc_msgSend(v43, "count");
      *(_DWORD *)buf = 138412802;
      v149 = v136;
      v150 = 2048;
      v151 = v106;
      v152 = 2112;
      v153 = (uint64_t)v43;
      v81 = "%@: Showing unreachable status for all resident devices (%lu): %@";
      goto LABEL_44;
    }
    HFLogForCategory(0x29uLL);
    v118 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v118, OS_LOG_TYPE_DEFAULT))
    {
      v125 = objc_msgSend(v43, "count");
      *(_DWORD *)buf = 138412802;
      v149 = v136;
      v150 = 2048;
      v151 = v125;
      v152 = 2112;
      v153 = (uint64_t)v43;
      v120 = "%@: Showing unreachable status for all resident devices (%lu): %@";
      goto LABEL_74;
    }
    goto LABEL_75;
  }
  if ((unint64_t)objc_msgSend(v43, "count") >= 2)
  {
    v66 = objc_msgSend(v43, "count");
    HFLocalizedStringWithFormat(CFSTR("HFStatusTitleUnreachable_MultipleAccessories"), CFSTR("%lu"), v67, v68, v69, v70, v71, v72, v66);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    if (v133)
    {
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      objc_msgSend(v133, "loggerActivity");
      v74 = objc_claimAutoreleasedReturnValue();
      os_activity_scope_enter(v74, &state);

      HFLogForCategory(0x29uLL);
      v75 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
      {
        v76 = objc_msgSend(v43, "count");
        *(_DWORD *)buf = 138412802;
        v149 = v136;
        v150 = 2048;
        v151 = v76;
        v152 = 2112;
        v153 = (uint64_t)v43;
        v77 = "%@: Showing unreachable status for %lu HomeKit objects: %@";
LABEL_57:
        _os_log_impl(&dword_1DD34E000, v75, OS_LOG_TYPE_DEFAULT, v77, buf, 0x20u);
        goto LABEL_58;
      }
      goto LABEL_58;
    }
    HFLogForCategory(0x29uLL);
    v121 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
    {
      v122 = objc_msgSend(v43, "count");
      *(_DWORD *)buf = 138412802;
      v149 = v136;
      v150 = 2048;
      v151 = v122;
      v152 = 2112;
      v153 = (uint64_t)v43;
      v123 = "%@: Showing unreachable status for %lu HomeKit objects: %@";
LABEL_80:
      _os_log_impl(&dword_1DD34E000, v121, OS_LOG_TYPE_DEFAULT, v123, buf, 0x20u);
      goto LABEL_81;
    }
    goto LABEL_81;
  }
LABEL_40:
  v73 = 0;
LABEL_47:
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = v82;
  v126 = v24;
  if (v73)
  {
    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:", 24.0);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = -[HFImageIconDescriptor initWithSystemImageNamed:configuration:]([HFImageIconDescriptor alloc], "initWithSystemImageNamed:configuration:", CFSTR("exclamationmark.circle.fill"), v84);
    objc_msgSend(v83, "setObject:forKeyedSubscript:", v85, CFSTR("icon"));

    _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusTitleUnreachable_One"), CFSTR("HFStatusTitleUnreachable_One"), 1);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "shortTitleForFormat:", v86);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "setObject:forKeyedSubscript:", v87, CFSTR("shortTitle"));

    objc_msgSend(v83, "setObject:forKeyedSubscript:", &unk_1EA7CCB80, CFSTR("statusItemCategory"));
    objc_msgSend(v83, "setObject:forKeyedSubscript:", v43, CFSTR("representedHomeKitObjects"));
    objc_msgSend(v83, "setObject:forKeyedSubscript:", v73, CFSTR("title"));
    _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusSortKeyAccessoryUnreachable"), CFSTR("HFStatusSortKeyAccessoryUnreachable"), 1);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "setObject:forKeyedSubscript:", v88, CFSTR("sortKey"));

    objc_msgSend(v83, "setObject:forKeyedSubscript:", &unk_1EA7CCB98, CFSTR("priority"));
  }
  else
  {
    objc_msgSend(v82, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("hidden"));
  }
  v10 = v131;
  objc_msgSend(v127[5], "na_map:", &__block_literal_global_42_2);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "na_setByFlattening");
  v90 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v90, "setByAddingObjectsFromSet:", v127[5]);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "setByAddingObjectsFromSet:", v134);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "setObject:forKeyedSubscript:", v92, CFSTR("dependentHomeKitObjects"));

  objc_msgSend(MEMORY[0x1E0CBA7E0], "hf_standardServiceTypes");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "setObject:forKeyedSubscript:", v93, CFSTR("dependentServiceTypes"));

  +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v83);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "finishWithResult:", v94);

  v4 = v147;
  WeakRetained = v136;
  v9 = v133;
LABEL_51:

}

BOOL __55__HFUnreachableStatusItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  void *v11;
  HFSymptomResultContextProvider *v12;
  void *v13;
  HFSymptomResultContextProvider *v14;
  void *v15;

  v5 = a3;
  objc_msgSend(a2, "service");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 32);

  if (v6 == v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "home");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFCharacteristicValueDisplayError errorWithUnderlyingError:readTraits:contextProvider:](HFCharacteristicValueDisplayError, "errorWithUnderlyingError:readTraits:contextProvider:", v5, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = [HFSymptomResultContextProvider alloc];
      objc_msgSend(*(id *)(a1 + 32), "accessory");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[HFSymptomResultContextProvider initWithAccessory:mediaSystem:](v12, "initWithAccessory:mediaSystem:", v13, 0);

      +[HFErrorResultComponent componentForDisplayError:symptomContextProvider:](HFErrorResultComponent, "componentForDisplayError:symptomContextProvider:", v11, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v15, "category") == 1;

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __55__HFUnreachableStatusItem__subclass_updateWithOptions___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = a2;
  if (objc_msgSend(v3, "isEnabled"))
  {
    objc_msgSend(v3, "hf_linkedAccessory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "room");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        objc_msgSend(*(id *)(a1 + 32), "room");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "hf_linkedAccessory");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "room");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v6, "isEqual:", v8);

      }
      else
      {
        v9 = 1;
      }

    }
    else
    {
      v9 = 1;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t __55__HFUnreachableStatusItem__subclass_updateWithOptions___block_invoke_2_11(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  char v8;
  char v10;
  void *v11;
  int v12;

  v3 = a2;
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "homeManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasOptedToHH2");

  if (v6)
  {
    objc_msgSend(v3, "hf_linkedAccessory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "isReachable");
    if ((v8 & 1) != 0)
      return 0;
  }
  else
  {
    v10 = objc_msgSend(v3, "hf_isReachable");

    if ((v10 & 1) != 0)
      return 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hf_shouldHideResidentDeviceReachabilityIssues");

  return v12 ^ 1u;
}

id __55__HFUnreachableStatusItem__subclass_updateWithOptions___block_invoke_13(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  v2 = a2;
  objc_msgSend(v2, "hf_linkedAccessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = v2;
  v5 = v3;

  return v5;
}

id __55__HFUnreachableStatusItem__subclass_updateWithOptions___block_invoke_40(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a2, "characteristics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
