@implementation HFAccessoryItem

- (HFAccessoryItem)initWithAccessory:(id)a3 valueSource:(id)a4
{
  id v7;
  id v8;
  HFAccessoryItem *v9;
  HFAccessoryItem *v10;
  NSObject *v11;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;
  uint8_t buf[4];
  _BOOL4 v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HFAccessoryItem;
  v9 = -[HFAccessoryItem init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accessory, a3);
    objc_storeStrong((id *)&v10->_valueSource, a4);
    HFLogForCategory(0x3CuLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v13 = -[HFAccessoryItem isSiriEndpointAccessory](v10, "isSiriEndpointAccessory");
      -[HFAccessoryItem accessories](v10, "accessories");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "anyObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "mediaProfile");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "hf_siriLanguageOptionsManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109378;
      v20 = v13;
      v21 = 2112;
      v22 = v17;
      _os_log_debug_impl(&dword_1DD34E000, v11, OS_LOG_TYPE_DEBUG, "isSiriEndPoint %{BOOL}d siriLanguageOptionsManager = %@", buf, 0x12u);

    }
  }

  return v10;
}

- (HFAccessoryItem)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFAccessoryItem.m"), 59, CFSTR("Use -initWithAccessory:valueSource:"));

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  id v5;

  -[HFAccessoryItem valueSource](self, "valueSource", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HFAccessoryItem copyWithValueSource:](self, "copyWithValueSource:", v4);

  return v5;
}

- (id)copyWithValueSource:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  -[HFAccessoryItem accessory](self, "accessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithAccessory:valueSource:", v6, v4);

  objc_msgSend(v7, "copyLatestResultsFromItem:", self);
  return v7;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFAccessoryItem accessory](self, "accessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hf_prettyDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItem latestResults](self, "latestResults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, %@ %@>"), v5, self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  HFServiceLikeItemUpdateRequest *v14;
  void *v15;
  void *v16;
  void *v17;
  HFServiceLikeItemUpdateRequest *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  HFAccessoryItem *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  HFAccessoryItem *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[HFAccessoryItem _buildServiceItems](self, "_buildServiceItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFAccessoryItem setServiceItems:](self, "setServiceItems:", v6);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v31;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v31 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v12), "updateWithOptions:", v5);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "na_safeAddObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
    }
    while (v10);
  }

  v14 = [HFServiceLikeItemUpdateRequest alloc];
  -[HFAccessoryItem accessory](self, "accessory");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFAccessoryItem valueSource](self, "valueSource");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[HFServiceLikeItemUpdateRequest initWithAccessory:valueSource:characteristics:](v14, "initWithAccessory:valueSource:characteristics:", v15, v16, v17);

  if (v18)
  {
    -[HFServiceLikeItemUpdateRequest updateWithOptions:](v18, "updateWithOptions:", v5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __47__HFAccessoryItem__subclass_updateWithOptions___block_invoke;
    v26[3] = &unk_1EA7309B8;
    v27 = v7;
    v28 = self;
    v29 = v8;
    objc_msgSend(v19, "flatMap:", v26);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    HFLogForCategory(0x29uLL);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFAccessoryItem accessory](self, "accessory");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v35 = self;
      v36 = 2112;
      v37 = v24;
      v38 = 2112;
      v39 = v25;
      _os_log_error_impl(&dword_1DD34E000, v21, OS_LOG_TYPE_ERROR, "%@:%@ Failed to create HFServiceLikeItemUpdateRequest. Accessory: %@ ", buf, 0x20u);

    }
    v22 = (void *)MEMORY[0x1E0D519C0];
    +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", MEMORY[0x1E0C9AA70]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "futureWithResult:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v20;
}

id __47__HFAccessoryItem__subclass_updateWithOptions___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  id v16;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0D519C0];
  v5 = a1[4];
  objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "combineAllFutures:ignoringErrors:scheduler:", v5, 1, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __47__HFAccessoryItem__subclass_updateWithOptions___block_invoke_2;
  v13[3] = &unk_1EA730990;
  v8 = a1[5];
  v9 = (void *)a1[6];
  v14 = v3;
  v15 = v8;
  v16 = v9;
  v10 = v3;
  objc_msgSend(v7, "flatMap:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __47__HFAccessoryItem__subclass_updateWithOptions___block_invoke_2(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  id *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t j;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  char v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t k;
  void *v82;
  void *v83;
  void *v84;
  int v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  id v90;
  _BOOL8 v91;
  id v92;
  void *v93;
  void *v94;
  void *v95;
  int v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  int v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  id v110;
  void *v111;
  id v112;
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
  void *v124;
  void *v125;
  void *v126;
  id v127;
  void *v128;
  void *v129;
  id *v130;
  id obj;
  uint64_t v132;
  uint64_t v133;
  void *v134;
  void *v135;
  uint64_t v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  _QWORD v149[5];
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  _BYTE v154[128];
  _BYTE v155[128];
  _BYTE v156[128];
  _BYTE v157[128];
  uint64_t v158;

  v158 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(a1[4], "standardResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(a1[5], "accessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hf_serviceNameComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("serviceNameComponents"));
    objc_msgSend(v7, "composedString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("title"));

  }
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("dependentHomeKitObjects"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v135 = v9;
  objc_msgSend(v9, "unionSet:", v10);

  v152 = 0u;
  v153 = 0u;
  v150 = 0u;
  v151 = 0u;
  v130 = a1;
  v11 = a1[6];
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v150, v157, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v151;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v151 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v150 + 1) + 8 * i), "latestResults");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("dependentHomeKitObjects"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
          objc_msgSend(v135, "unionSet:", v17);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v150, v157, 16);
    }
    while (v13);
  }

  v18 = v130;
  if (objc_msgSend(v130[5], "isSiriEndpointAccessory"))
  {
    objc_msgSend(v130[5], "accessories");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "anyObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "hf_siriEndpointProfile");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v135, "na_safeAddObject:", v21);

  }
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v135, CFSTR("dependentHomeKitObjects"));
  objc_msgSend(v130[5], "_unanimousValueForResultsKey:inServiceItems:", CFSTR("hidden"), v130[6]);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v22) = objc_msgSend(v128, "BOOLValue");
  if (objc_msgSend(v130[6], "count"))
    v22 = v22;
  else
    v22 = 1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v23, CFSTR("hidden"));

  objc_msgSend(v130[5], "accessory");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "uniqueIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFURLComponents homeKitObjectURLForDestination:secondaryDestination:UUID:](HFURLComponents, "homeKitObjectURLForDestination:secondaryDestination:UUID:", 4, 1, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v26, CFSTR("itemDetailsURL"));

  if ((v22 & 1) == 0)
  {
    v27 = v130[5];
    objc_msgSend(v27, "accessory");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "hf_primaryService");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "serviceItemForService:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v129 = v30;
    objc_msgSend(v30, "latestResults");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("state"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "integerValue");

    v127 = v3;
    if ((objc_msgSend(v130[5], "isMultiSensorDevice") & 1) != 0)
    {
      v33 = 1;
    }
    else if (objc_msgSend(v130[5], "isMultiLightDevice"))
    {
      objc_msgSend(v130[5], "serviceItems");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "na_any:", &__block_literal_global_71);

      if (v35)
        v33 = 2;
      else
        v33 = 1;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v33);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v36, CFSTR("state"));

    v37 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v130[5], "accessory");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "numberWithUnsignedInteger:", objc_msgSend(v38, "suspendedState"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v39, CFSTR("suspendedState"));

    objc_msgSend(v129, "latestResults");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("icon"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v130[5], "accessory");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v38) = objc_msgSend(v42, "hf_isMultiServiceAccessory");

    if ((_DWORD)v38)
    {
      if (objc_msgSend(v130[5], "isMultiLightDevice"))
      {
        objc_msgSend(v129, "latestResults");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("state"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v44, "integerValue");

        if (v45 != v33)
        {
          objc_msgSend(v130[5], "serviceItems");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v149[0] = MEMORY[0x1E0C809B0];
          v149[1] = 3221225472;
          v149[2] = __47__HFAccessoryItem__subclass_updateWithOptions___block_invoke_4;
          v149[3] = &__block_descriptor_40_e23_B16__0__HFServiceItem_8l;
          v149[4] = v33;
          objc_msgSend(v46, "na_firstObjectPassingTest:", v149);
          v47 = (void *)objc_claimAutoreleasedReturnValue();

          if (v47)
          {
            objc_msgSend(v47, "latestResults");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("icon"));
            v49 = objc_claimAutoreleasedReturnValue();

            v41 = (void *)v49;
          }

        }
      }
      objc_msgSend(v130[5], "accessory");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      +[HFServiceIconFactory overrideIconDescriptorForMultiServiceAccessory:iconDescriptor:](HFServiceIconFactory, "overrideIconDescriptorForMultiServiceAccessory:iconDescriptor:", v50, v41);
      v51 = objc_claimAutoreleasedReturnValue();

      v52 = (void *)v51;
    }
    else
    {
      v52 = v41;
    }
    v125 = v52;
    v126 = v7;
    objc_msgSend(v5, "setObject:forKeyedSubscript:");
    objc_msgSend(v130[5], "_buildControlDescription");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v53, CFSTR("controlDescription"));

    objc_msgSend(v129, "latestResults");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "objectForKeyedSubscript:", CFSTR("persistentWarningDescription"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v55, CFSTR("persistentWarningDescription"));

    objc_msgSend(v129, "latestResults");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("roomIdentifier"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v5;
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v57, CFSTR("roomIdentifier"));

    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    v145 = 0u;
    v146 = 0u;
    v147 = 0u;
    v148 = 0u;
    v59 = v130[6];
    v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v145, v156, 16);
    if (v60)
    {
      v61 = v60;
      v62 = *(_QWORD *)v146;
      do
      {
        for (j = 0; j != v61; ++j)
        {
          if (*(_QWORD *)v146 != v62)
            objc_enumerationMutation(v59);
          objc_msgSend(*(id *)(*((_QWORD *)&v145 + 1) + 8 * j), "latestResults");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("dateAdded"));
          v65 = (void *)objc_claimAutoreleasedReturnValue();

          if (v65)
          {
            objc_msgSend(v134, "earlierDate:", v65);
            v66 = objc_claimAutoreleasedReturnValue();

            v134 = (void *)v66;
          }

        }
        v61 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v145, v156, 16);
      }
      while (v61);
    }

    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = objc_msgSend(v134, "isEqualToDate:", v67);

    v5 = v58;
    if ((v68 & 1) == 0)
      objc_msgSend(v58, "setObject:forKeyedSubscript:", v134, CFSTR("dateAdded"));
    objc_msgSend(v130[5], "_buildControlItems");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setObject:forKeyedSubscript:", v69, CFSTR("childItems"));

    objc_msgSend(v130[5], "_collectAllChildItems");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setObject:forKeyedSubscript:", v70, CFSTR("collatedChildItems"));

    objc_msgSend(v130[5], "_mostCommonValueInServiceItems:valueProvider:", v130[6], &__block_literal_global_19);
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "na_safeSetObject:forKey:");
    if (objc_msgSend(v130[5], "isSiriEndpointAccessory"))
    {
      if (objc_msgSend(v130[5], "shouldShowMutedMicIcon"))
      {
        objc_msgSend(v58, "objectForKeyedSubscript:", CFSTR("descriptionBadge"));
        v71 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v71)
          objc_msgSend(v58, "setObject:forKeyedSubscript:", &unk_1EA7CC058, CFSTR("descriptionBadge"));
      }
    }
    v72 = v130[6];
    objc_msgSend(v130[5], "_sortDescriptorsForServiceItems");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "sortedArrayUsingDescriptors:", v73);
    v74 = (void *)objc_claimAutoreleasedReturnValue();

    v143 = 0u;
    v144 = 0u;
    v141 = 0u;
    v142 = 0u;
    obj = v74;
    v133 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v141, v155, 16);
    if (v133)
    {
      v132 = *(_QWORD *)v142;
      do
      {
        v75 = 0;
        do
        {
          if (*(_QWORD *)v142 != v132)
            objc_enumerationMutation(obj);
          v136 = v75;
          v76 = *(void **)(*((_QWORD *)&v141 + 1) + 8 * v75);
          v137 = 0u;
          v138 = 0u;
          v139 = 0u;
          v140 = 0u;
          objc_msgSend(v76, "latestResults");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          v78 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v137, v154, 16);
          if (v78)
          {
            v79 = v78;
            v80 = *(_QWORD *)v138;
            do
            {
              for (k = 0; k != v79; ++k)
              {
                if (*(_QWORD *)v138 != v80)
                  objc_enumerationMutation(v77);
                v82 = *(void **)(*((_QWORD *)&v137 + 1) + 8 * k);
                objc_msgSend(v5, "objectForKeyedSubscript:", v82);
                v83 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v83)
                {
                  if ((objc_msgSend(v82, "isEqualToString:", CFSTR("priority")) & 1) == 0
                    && !objc_msgSend(v82, "isEqualToString:", CFSTR("descriptionStyle"))
                    || (objc_msgSend(v76, "service"),
                        v84 = (void *)objc_claimAutoreleasedReturnValue(),
                        v85 = objc_msgSend(v84, "isPrimaryService"),
                        v84,
                        v85))
                  {
                    objc_msgSend(v76, "latestResults");
                    v86 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v86, "objectForKeyedSubscript:", v82);
                    v87 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v58, "setObject:forKeyedSubscript:", v87, v82);

                  }
                }
                v5 = v58;
              }
              v79 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v137, v154, 16);
            }
            while (v79);
          }

          v75 = v136 + 1;
        }
        while (v136 + 1 != v133);
        v133 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v141, v155, 16);
      }
      while (v133);
    }

    objc_opt_class();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("underlyingError"));
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v89 = v88;
    else
      v89 = 0;
    v90 = v89;

    if (v90)
      v91 = objc_msgSend(v90, "category") != 1;
    else
      v91 = 1;
    v7 = v126;
    v3 = v127;
    v18 = v130;
    v92 = v130[5];
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("title"));
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "_buildTileDescription:title:", v91, v93);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v94, CFSTR("description"));

    objc_msgSend(v130[5], "accessory");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = objc_msgSend(v95, "hf_hasSetFavorite");

    if (v96)
    {
      v97 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v130[5], "accessory");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "numberWithBool:", objc_msgSend(v98, "hf_isFavorite"));
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v99, CFSTR("isFavorite"));

    }
    else
    {
      objc_msgSend(v5, "setObject:forKeyedSubscript:", 0, CFSTR("isFavorite"));
    }

  }
  objc_msgSend(v18[5], "accessory");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = objc_msgSend(v100, "hf_isVisibleAsBridge");

  if (v101)
  {
    objc_msgSend(v18[5], "accessory");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "room");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "uniqueIdentifier");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "na_safeSetObject:forKey:", v104, CFSTR("roomIdentifier"));

    objc_msgSend(MEMORY[0x1E0CEA650], "configurationPreferringMulticolor");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:", 26.0);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "configurationByApplyingConfiguration:", v105);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18[5], "accessory");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFServiceIconFactory iconDescriptorForAccessory:](HFServiceIconFactory, "iconDescriptorForAccessory:", v108);
    v109 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    v110 = v109;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v111 = v110;
    else
      v111 = 0;
    v112 = v111;

    objc_msgSend(v112, "imageIconDescriptorWithUpdatedImageSymbolConfiguration:", v107);
    v113 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setObject:forKeyedSubscript:", v113, CFSTR("icon"));
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("controlDescription"));
  v114 = (void *)objc_claimAutoreleasedReturnValue();

  if (v114)
  {
    v115 = (void *)MEMORY[0x1E0CB3498];
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("controlDescription"));
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("title"));
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "hf_attributedStringWithInflectableAccessoryStatus:accessoryName:", v116, v117);
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "string");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v119, CFSTR("controlDescription"));

  }
  v120 = (void *)MEMORY[0x1E0D519C0];
  +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v5);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "futureWithResult:", v121);
  v122 = (void *)objc_claimAutoreleasedReturnValue();

  return v122;
}

BOOL __47__HFAccessoryItem__subclass_updateWithOptions___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "latestResults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("state"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue") == 2;

  return v4;
}

BOOL __47__HFAccessoryItem__subclass_updateWithOptions___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _BOOL8 v5;

  objc_msgSend(a2, "latestResults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("state"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue") == *(_QWORD *)(a1 + 32);

  return v5;
}

id __47__HFAccessoryItem__subclass_updateWithOptions___block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a2, "latestResults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("badge"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "isEqual:", &unk_1EA7CC040))
    v4 = 0;
  else
    v4 = v3;
  v5 = v4;

  return v5;
}

- (BOOL)shouldShowMutedMicIcon
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  int v7;
  BOOL v8;
  void *v9;

  -[HFAccessoryItem commonSettingsManager](self, "commonSettingsManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "settingValueForKeyPath:", HFAllowHeySiriSettingKeyPath);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = objc_msgSend(v4, "BOOLValue") ^ 1;
  else
    v5 = 0;
  -[HFAccessoryItem accessory](self, "accessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "supportsAudioAnalysis");

  if (!v7 || !v5)
  {
    if ((v5 & ~v7) != 1)
      goto LABEL_7;
LABEL_9:
    -[HFAccessoryItem home](self, "home");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "audioAnalysisClassifierOptions") != 0;

    goto LABEL_10;
  }
  if (!-[HFAccessoryItem isAudioAnalysisEnabled](self, "isAudioAnalysisEnabled"))
    goto LABEL_9;
LABEL_7:
  v8 = 0;
LABEL_10:

  return v8;
}

- (id)controlItemsForService:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HFAccessoryItem serviceItemForService:](self, "serviceItemForService:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "latestResults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("childItems"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)serviceItemForService:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[HFAccessoryItem serviceItems](self, "serviceItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __41__HFAccessoryItem_serviceItemForService___block_invoke;
  v9[3] = &unk_1EA7309E0;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __41__HFAccessoryItem_serviceItemForService___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)_buildControlItems
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v16;
  int v17;
  HFAccessoryControlItem *v18;
  void *v19;
  void *v20;
  HFAccessoryControlItem *v21;

  -[HFAccessoryItem serviceItems](self, "serviceItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    if (v4 == 1)
    {
      -[HFAccessoryItem serviceItems](self, "serviceItems");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "anyObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "latestResults");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("childItems"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v8, "count") == 1)
      {
        objc_msgSend(v8, "na_map:", &__block_literal_global_29_1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

        return v9;
      }

    }
    -[HFAccessoryItem accessory](self, "accessory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hf_primaryService");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFAccessoryItem serviceItemForService:](self, "serviceItemForService:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "latestResults");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("childItems"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v13, "na_any:", &__block_literal_global_31_1) & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v13, "na_map:", &__block_literal_global_35_1);
      v14 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[HFAccessoryItem serviceItems](self, "serviceItems");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "na_any:", &__block_literal_global_36_0);

      if (v17)
      {
        v18 = [HFAccessoryControlItem alloc];
        -[HFAccessoryItem valueSource](self, "valueSource");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[HFAccessoryItem accessory](self, "accessory");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = -[HFAccessoryControlItem initWithValueSource:parentAccessory:displayResults:](v18, "initWithValueSource:parentAccessory:displayResults:", v19, v20, MEMORY[0x1E0C9AA70]);

        objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v21);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_12;
      }
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v14 = objc_claimAutoreleasedReturnValue();
    }
    v9 = (void *)v14;
LABEL_12:

    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  return v9;
}

id __37__HFAccessoryItem__buildControlItems__block_invoke(uint64_t a1, void *a2)
{
  return (id)objc_msgSend(a2, "copy");
}

uint64_t __37__HFAccessoryItem__buildControlItems__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

id __37__HFAccessoryItem__buildControlItems__block_invoke_3(uint64_t a1, void *a2)
{
  return (id)objc_msgSend(a2, "copy");
}

uint64_t __37__HFAccessoryItem__buildControlItems__block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "latestResults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("childItems"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "na_any:", &__block_literal_global_37);
  return v4;
}

uint64_t __37__HFAccessoryItem__buildControlItems__block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_collectAllChildItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v3 = (void *)MEMORY[0x1E0C99E20];
  -[HFAccessoryItem serviceItems](self, "serviceItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFAccessoryItem serviceItems](self, "serviceItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __40__HFAccessoryItem__collectAllChildItems__block_invoke;
  v9[3] = &unk_1EA730B10;
  v7 = v5;
  v10 = v7;
  objc_msgSend(v6, "na_each:", v9);

  return v7;
}

void __40__HFAccessoryItem__collectAllChildItems__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(a2, "latestResults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("childItems"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__HFAccessoryItem__collectAllChildItems__block_invoke_2;
  v5[3] = &unk_1EA730AE8;
  v6 = *(id *)(a1 + 32);
  objc_msgSend(v4, "na_each:", v5);

}

void __40__HFAccessoryItem__collectAllChildItems__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = (id)objc_msgSend(a2, "copy");
  objc_msgSend(v2, "addObject:", v3);

}

- (id)_buildServiceItems
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[HFAccessoryItem accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hf_visibleServices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__HFAccessoryItem__buildServiceItems__block_invoke;
  v7[3] = &unk_1EA729278;
  v7[4] = self;
  objc_msgSend(v4, "na_map:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __37__HFAccessoryItem__buildServiceItems__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "valueSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFServiceItem serviceItemForService:valueSource:](HFServiceItem, "serviceItemForService:valueSource:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)containsActions
{
  void *v2;
  char v3;

  -[HFAccessoryItem _buildServiceItems](self, "_buildServiceItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "na_any:", &__block_literal_global_44_0);

  return v3;
}

uint64_t __34__HFAccessoryItem_containsActions__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsActions");
}

- (BOOL)actionsMayRequireDeviceUnlock
{
  void *v2;
  char v3;

  -[HFAccessoryItem _buildServiceItems](self, "_buildServiceItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "na_any:", &__block_literal_global_45_0);

  return v3;
}

uint64_t __48__HFAccessoryItem_actionsMayRequireDeviceUnlock__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "actionsMayRequireDeviceUnlock");
}

- (id)currentStateActionBuildersForHome:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  id v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v26 = objc_alloc_init(MEMORY[0x1E0D519C0]);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  -[HFAccessoryItem accessory](self, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_visibleServices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v33;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v33 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v10);
        -[HFAccessoryItem valueSource](self, "valueSource");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[HFServiceItem serviceItemForService:valueSource:](HFServiceItem, "serviceItemForService:valueSource:", v11, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v13, "currentStateActionBuildersForHome:", v4);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
            objc_msgSend(v27, "addObject:", v14);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v8);
  }

  v15 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "combineAllFutures:ignoringErrors:scheduler:", v27, 0, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __53__HFAccessoryItem_currentStateActionBuildersForHome___block_invoke;
  v30[3] = &unk_1EA730B78;
  v19 = v26;
  v31 = v19;
  v20 = (id)objc_msgSend(v17, "addSuccessBlock:", v30);
  v28[0] = v18;
  v28[1] = 3221225472;
  v28[2] = __53__HFAccessoryItem_currentStateActionBuildersForHome___block_invoke_2;
  v28[3] = &unk_1EA726968;
  v21 = v19;
  v29 = v21;
  v22 = (id)objc_msgSend(v17, "addFailureBlock:", v28);
  v23 = v29;
  v24 = v21;

  return v24;
}

void __53__HFAccessoryItem_currentStateActionBuildersForHome___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "unionSet:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", v4);
}

uint64_t __53__HFAccessoryItem_currentStateActionBuildersForHome___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
}

- (HMHome)home
{
  void *v2;
  void *v3;

  -[HFAccessoryItem accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMHome *)v3;
}

- (NSSet)services
{
  void *v2;
  void *v3;

  -[HFAccessoryItem accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_visibleServices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

- (id)accessories
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[HFAccessoryItem accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_setWithSafeObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)serviceLikeBuilderInHome:(id)a3
{
  id v4;
  HFAccessoryBuilder *v5;
  void *v6;
  HFAccessoryBuilder *v7;

  v4 = a3;
  v5 = [HFAccessoryBuilder alloc];
  -[HFAccessoryItem homeKitObject](self, "homeKitObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HFAccessoryBuilder initWithExistingObject:inHome:](v5, "initWithExistingObject:inHome:", v6, v4);

  return v7;
}

- (id)namingComponentForHomeKitObject
{
  void *v2;
  void *v3;

  -[HFAccessoryItem accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFNamingComponents namingComponentFromAccessory:](HFNamingComponents, "namingComponentFromAccessory:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isItemGroup
{
  return 0;
}

- (unint64_t)numberOfItemsContainedWithinGroup
{
  return 0;
}

- (BOOL)isContainedWithinItemGroup
{
  return 0;
}

- (BOOL)isCompoundItem
{
  return -[HFAccessoryItem numberOfCompoundItems](self, "numberOfCompoundItems") > 1;
}

- (unint64_t)numberOfCompoundItems
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[HFAccessoryItem accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_visibleServices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (HFHomeKitObject)primaryHomeKitObject
{
  void *v2;
  void *v3;

  -[HFAccessoryItem accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_primaryService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HFHomeKitObject *)v3;
}

- (NSArray)allHomeKitObjects
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HFAccessoryItem accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_visibleServices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CBA7E0], "hf_serviceComparator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingComparator:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v6;
}

- (HFMediaAccessoryCommonSettingsManager)commonSettingsManager
{
  void *v2;
  void *v3;
  void *v4;

  -[HFAccessoryItem accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hf_mediaAccessoryCommonSettingsManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (HFMediaAccessoryCommonSettingsManager *)v4;
}

- (BOOL)isSiriEndpointAccessory
{
  void *v2;
  char v3;

  -[HFAccessoryItem accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hf_isSiriEndpoint");

  return v3;
}

- (BOOL)isAnnounceEnabled
{
  void *v3;
  void *v4;
  char v5;

  if (!-[HFAccessoryItem isSiriEndpointAccessory](self, "isSiriEndpointAccessory"))
    return 0;
  -[HFAccessoryItem commonSettingsManager](self, "commonSettingsManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "settingValueForKeyPath:", HFAnnounceEnabledKeyPath);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 0;
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (id)setEnableAnnounce:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;

  v3 = a3;
  -[HFAccessoryItem accessory](self, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HFAccessoryItem isSiriEndpointAccessory](self, "isSiriEndpointAccessory"))
  {
    -[HFAccessoryItem commonSettingsManager](self, "commonSettingsManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFAccessoryItem accessory](self, "accessory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "home");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uniqueIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = HFAnnounceEnabledKeyPath;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "updateAccessorySettingWithHomeIdentifier:accessoryIdentifier:keyPath:rawSettingValue:", v10, v6, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (BOOL)isSiriDisabled
{
  void *v2;
  void *v3;
  int v4;

  -[HFAccessoryItem commonSettingsManager](self, "commonSettingsManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "settingValueForKeyPath:", HFAllowHeySiriSettingKeyPath);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "BOOLValue") ^ 1;
  else
    LOBYTE(v4) = 1;

  return v4;
}

- (id)setSiriDisabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;

  v3 = a3;
  -[HFAccessoryItem accessory](self, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HFAccessoryItem isSiriEndpointAccessory](self, "isSiriEndpointAccessory"))
  {
    -[HFAccessoryItem commonSettingsManager](self, "commonSettingsManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFAccessoryItem accessory](self, "accessory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "home");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uniqueIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = HFAllowHeySiriSettingKeyPath;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", !v3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "updateAccessorySettingWithHomeIdentifier:accessoryIdentifier:keyPath:rawSettingValue:", v10, v6, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (BOOL)isAudioAnalysisEnabled
{
  void *v3;
  void *v4;
  char v5;

  if (!-[HFAccessoryItem isSiriEndpointAccessory](self, "isSiriEndpointAccessory"))
    return 0;
  -[HFAccessoryItem commonSettingsManager](self, "commonSettingsManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "settingValueForKeyPath:", HFAudioAnalysisEnabledKeyPath);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 0;
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (id)setEnableAudioAnalysis:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;

  v3 = a3;
  -[HFAccessoryItem accessory](self, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HFAccessoryItem isSiriEndpointAccessory](self, "isSiriEndpointAccessory"))
  {
    -[HFAccessoryItem commonSettingsManager](self, "commonSettingsManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFAccessoryItem accessory](self, "accessory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "home");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uniqueIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = HFAudioAnalysisEnabledKeyPath;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "updateAccessorySettingWithHomeIdentifier:accessoryIdentifier:keyPath:rawSettingValue:", v10, v6, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (BOOL)isDoorbellChimeEnabled
{
  void *v3;
  void *v4;
  char v5;

  if (!-[HFAccessoryItem isSiriEndpointAccessory](self, "isSiriEndpointAccessory"))
    return 0;
  -[HFAccessoryItem commonSettingsManager](self, "commonSettingsManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "settingValueForKeyPath:", HFDoorbellChimeEnabledKeyPath);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 0;
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (id)enableDoorbellChime:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;

  v3 = a3;
  -[HFAccessoryItem accessory](self, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HFAccessoryItem isSiriEndpointAccessory](self, "isSiriEndpointAccessory"))
  {
    -[HFAccessoryItem commonSettingsManager](self, "commonSettingsManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFAccessoryItem accessory](self, "accessory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "home");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uniqueIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = HFDoorbellChimeEnabledKeyPath;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "updateAccessorySettingWithHomeIdentifier:accessoryIdentifier:keyPath:rawSettingValue:", v10, v6, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (id)_buildTileDescription:(BOOL)a3 title:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __CFString *v14;
  char v15;
  uint64_t i;
  void *v17;
  char isKindOfClass;
  void *v19;
  char v20;
  char v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _BOOL4 v38;
  _BOOL4 v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  void *v48;
  int v49;
  void *v50;
  __CFString **v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  void *v63;
  id v64;
  __CFString *v65;
  id v66;
  void *v67;
  void *v68;
  __CFString *v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  uint64_t v75;

  v4 = a3;
  v75 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[HFAccessoryItem accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hf_isMultiServiceAccessory");

  if (!v8 || !v4)
  {
    -[HFAccessoryItem accessory](self, "accessory");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "hf_primaryService");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFAccessoryItem serviceItemForService:](self, "serviceItemForService:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v32, "latestResults");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("description"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = 0;
    goto LABEL_48;
  }
  v66 = v6;
  v68 = (void *)objc_opt_new();
  v9 = (void *)objc_opt_new();
  v67 = (void *)objc_opt_new();
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  -[HFAccessoryItem serviceItems](self, "serviceItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v70, v74, 16);
  if (!v11)
  {
    v15 = 1;
    v14 = &stru_1EA741FF8;
    goto LABEL_26;
  }
  v12 = v11;
  v13 = *(_QWORD *)v71;
  v14 = &stru_1EA741FF8;
  v15 = 1;
  do
  {
    for (i = 0; i != v12; ++i)
    {
      if (*(_QWORD *)v71 != v13)
        objc_enumerationMutation(v10);
      v17 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * i);
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      v19 = v9;
      if ((isKindOfClass & 1) == 0)
      {
        objc_opt_class();
        v20 = objc_opt_isKindOfClass();
        v19 = v9;
        if ((v20 & 1) == 0)
        {
          objc_opt_class();
          v21 = objc_opt_isKindOfClass();
          v19 = v9;
          if ((v21 & 1) == 0)
          {
            objc_opt_class();
            v22 = objc_opt_isKindOfClass();
            v19 = v9;
            if ((v22 & 1) == 0)
            {
              objc_msgSend(v17, "latestResults");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("state"));
              v69 = v14;
              v24 = v9;
              v25 = v10;
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = objc_msgSend(v26, "integerValue");

              v10 = v25;
              v9 = v24;
              v14 = v69;

              if (v27 == 2)
                v19 = v68;
              else
                v19 = v67;
            }
          }
        }
      }
      objc_msgSend(v19, "addObject:", v17);
      if (!-[__CFString length](v14, "length"))
      {
        objc_msgSend(v17, "service");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "serviceType");
        v29 = v14;
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_19;
      }
      if ((v15 & 1) != 0)
      {
        objc_msgSend(v17, "service");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "serviceType");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[__CFString isEqualToString:](v14, "isEqualToString:", v29);
LABEL_19:

        continue;
      }
      v15 = 0;
    }
    v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v70, v74, 16);
  }
  while (v12);
LABEL_26:

  v36 = objc_msgSend(v68, "count");
  v37 = objc_msgSend(v67, "count");
  if ((_DWORD)v37)
    v38 = 0;
  else
    v38 = (int)v36 > 0;
  if ((_DWORD)v36)
    v39 = 0;
  else
    v39 = (int)v37 > 0;
  v40 = objc_msgSend(v9, "count");
  v47 = v37 + v36;
  if (!((_DWORD)v37 + (_DWORD)v36) && (int)v40 >= 1)
  {
    HFLocalizedStringWithFormat(CFSTR("HFAccessoryTileSensorStatus"), CFSTR("%d"), v41, v42, v43, v44, v45, v46, v40);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_46;
  }
  if (v47 != 1)
  {
    if (!(((_DWORD)v36 != 1) | v15 & 1))
      goto LABEL_41;
    if (v47 <= 3)
      v49 = (v47 == 2) & v15;
    else
      v49 = 1;
    if ((int)v36 < 1)
    {
      if ((int)v37 >= 1)
      {
        HFLocalizedStringWithFormat(CFSTR("HFAccessoryTileOffStatus"), CFSTR("%d"), v41, v42, v43, v44, v45, v46, v37);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = 0;
        goto LABEL_57;
      }
      v62 = 0;
    }
    else
    {
      HFLocalizedStringWithFormat(CFSTR("HFAccessoryTileOnStatus"), CFSTR("%d"), v41, v42, v43, v44, v45, v46, v36);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      if ((int)v37 > 0)
      {
        HFLocalizedStringWithFormat(CFSTR("HFAccessoryTileOffStatus"), CFSTR("%d"), v56, v57, v58, v59, v60, v61, v37);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ • %@"), v62, v63);
        v64 = (id)objc_claimAutoreleasedReturnValue();
LABEL_67:
        v34 = v64;
        goto LABEL_68;
      }
    }
    v63 = 0;
LABEL_57:
    if (v38)
    {
      if (v49)
      {
        v64 = v62;
        v62 = v64;
        goto LABEL_67;
      }
      v65 = CFSTR("HFAccessoryTileAllOnStatus");
    }
    else
    {
      if (!v39)
      {
        v34 = 0;
LABEL_68:

        v35 = 1;
        goto LABEL_47;
      }
      if (v49)
      {
        v64 = v63;
        v63 = v64;
        goto LABEL_67;
      }
      v65 = CFSTR("HFAccessoryTileAllOffStatus");
    }
    _HFLocalizedStringWithDefaultValue(v65, v65, 1);
    v64 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_67;
  }
  v48 = v67;
  if ((int)v36 >= 1)
LABEL_41:
    v48 = v68;
  objc_msgSend(v48, "firstObject");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v51 = HFResultDisplayDescriptionKey;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      v51 = HFResultDisplayControlDescriptionKey;
  }
  objc_msgSend(v50, "latestResults");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "objectForKeyedSubscript:", *v51);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_46:
  v35 = 0;
LABEL_47:
  v6 = v66;

LABEL_48:
  objc_msgSend(MEMORY[0x1E0CB3498], "hf_attributedStringWithInflectableAccessoryStatus:accessoryName:forcePluralAgreement:", v34, v6, v35);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "string");
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  return v54;
}

- (id)_buildControlDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[5];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:comparator:", 0, 0, &__block_literal_global_75);
  -[HFAccessoryItem serviceItems](self, "serviceItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingDescriptors:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  -[HFAccessoryItem accessory](self, "accessory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hf_primaryService");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = MEMORY[0x1E0C809B0];
  if (v10)
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __43__HFAccessoryItem__buildControlDescription__block_invoke_2;
    v19[3] = &unk_1EA7309E0;
    v20 = v10;
    objc_msgSend(v8, "na_firstObjectPassingTest:", v19);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 && objc_msgSend(v8, "containsObject:", v12))
    {
      objc_msgSend(v8, "removeObject:", v12);
      objc_msgSend(v8, "insertObject:atIndex:", v12, 0);
    }

  }
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = __43__HFAccessoryItem__buildControlDescription__block_invoke_3;
  v17[3] = &unk_1EA730BE0;
  v17[4] = self;
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v18 = v13;
  objc_msgSend(v8, "na_each:", v17);
  v14 = v18;
  v15 = v13;

  return v15;
}

uint64_t __43__HFAccessoryItem__buildControlDescription__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "service");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v6, "compare:", v8);
  return v9;
}

uint64_t __43__HFAccessoryItem__buildControlDescription__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "hmf_isEqualToUUID:", v5);

  return v6;
}

void __43__HFAccessoryItem__buildControlDescription__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  id v19;

  v3 = a2;
  objc_msgSend(v3, "latestResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("state"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  objc_opt_class();
  v19 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v19;
  else
    v7 = 0;
  v8 = v7;

  if (!v8
    || (objc_msgSend(*(id *)(a1 + 32), "accessory"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "hf_isMultiServiceAccessory"),
        v9,
        !v10)
    || v6 == 2)
  {
    objc_msgSend(v19, "latestResults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("controlDescription"));
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)v12;

    }
    else
    {
      objc_msgSend(v19, "latestResults");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("description"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
      {
LABEL_14:

        goto LABEL_15;
      }
    }
    if (objc_msgSend(*(id *)(a1 + 40), "length"))
    {
      objc_msgSend(*(id *)(a1 + 32), "_repeatingDescriptionsToCoalesce");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "containsObject:", v13);

      if ((v16 & 1) == 0)
      {
        v17 = *(void **)(a1 + 40);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" • %@"), v13);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "appendString:", v18);

      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "appendString:", v13);
    }
    goto LABEL_14;
  }
LABEL_15:

}

- (id)_repeatingDescriptionsToCoalesce
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E20];
  _HFLocalizedStringWithDefaultValue(CFSTR("HFServiceDescriptionUpdating"), CFSTR("HFServiceDescriptionUpdating"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v4;
  _HFLocalizedStringWithDefaultValue(CFSTR("HFServiceDescriptionAccessoryConnectionError"), CFSTR("HFServiceDescriptionAccessoryConnectionError"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFAccessoryItem accessory](self, "accessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v8, "hf_isTelevision");

  if ((_DWORD)v4)
  {
    _HFLocalizedStringWithDefaultValue(CFSTR("HFCharacteristicValuePowerStateOff"), CFSTR("HFCharacteristicValuePowerStateOff"), 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v9);

  }
  v10 = (void *)objc_msgSend(v7, "copy");

  return v10;
}

- (BOOL)isMultiSensorDevice
{
  void *v3;
  void *v4;
  char v5;

  -[HFAccessoryItem accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hf_isMultiServiceAccessory"))
  {
    -[HFAccessoryItem serviceItems](self, "serviceItems");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "na_all:", &__block_literal_global_86);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __38__HFAccessoryItem_isMultiSensorDevice__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (BOOL)isMultiLightDevice
{
  void *v3;
  void *v4;
  char v5;

  -[HFAccessoryItem accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hf_isMultiServiceAccessory"))
  {
    -[HFAccessoryItem serviceItems](self, "serviceItems");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "na_all:", &__block_literal_global_87);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __37__HFAccessoryItem_isMultiLightDevice__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_unanimousValueForResultsKey:(id)a3 inServiceItems:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = a4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "latestResults", (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v5);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          if (v9)
          {
            if (!objc_msgSend(v9, "isEqual:", v13))
            {

              v14 = 0;
              goto LABEL_16;
            }
          }
          else
          {
            v9 = v13;
          }
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  v9 = v9;
  v14 = v9;
LABEL_16:

  return v14;
}

- (id)_mostCommonValueForResultsKey:(id)a3 inServiceItems:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64__HFAccessoryItem__mostCommonValueForResultsKey_inServiceItems___block_invoke;
  v10[3] = &unk_1EA730C48;
  v11 = v6;
  v7 = v6;
  -[HFAccessoryItem _mostCommonValueInServiceItems:valueProvider:](self, "_mostCommonValueInServiceItems:valueProvider:", a4, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __64__HFAccessoryItem__mostCommonValueForResultsKey_inServiceItems___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "latestResults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_mostCommonValueInServiceItems:(id)a3 valueProvider:(id)a4
{
  id v5;
  void (**v6)(id, _QWORD);
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3550], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          v6[2](v6, *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
            objc_msgSend(v7, "addObject:", v13, (_QWORD)v16);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }

    objc_msgSend(v7, "na_mostCommonObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)_sortDescriptorsForServiceItems
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:comparator:", 0, 0, &__block_literal_global_90_0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:comparator:", 0, 0, &__block_literal_global_94_1);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:comparator:", 0, 0, &__block_literal_global_95_0);
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __50__HFAccessoryItem__sortDescriptorsForServiceItems__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;

  v4 = a3;
  objc_msgSend(a2, "latestResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("priority"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (void *)v6;
  else
    v8 = &unk_1EA7CC070;
  v9 = v8;

  objc_msgSend(v4, "latestResults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("priority"));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = (void *)v11;
  else
    v13 = &unk_1EA7CC070;
  v14 = v13;

  v15 = objc_msgSend(v9, "compare:", v14);
  return v15;
}

uint64_t __50__HFAccessoryItem__sortDescriptorsForServiceItems__block_invoke_93(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "latestResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("errorDescription"));
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    objc_msgSend(v5, "latestResults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("errorDescription"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      v11 = -1;
      goto LABEL_8;
    }
  }
  else
  {

  }
  objc_msgSend(v4, "latestResults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("errorDescription"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {

    v11 = 0;
  }
  else
  {
    objc_msgSend(v5, "latestResults");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("errorDescription"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v15 != 0;

  }
LABEL_8:

  return v11;
}

uint64_t __50__HFAccessoryItem__sortDescriptorsForServiceItems__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;

  v4 = a3;
  objc_msgSend(a2, "latestResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("subPriority"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (void *)v6;
  else
    v8 = &unk_1EA7CC088;
  v9 = v8;

  objc_msgSend(v4, "latestResults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("subPriority"));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = (void *)v11;
  else
    v13 = &unk_1EA7CC088;
  v14 = v13;

  v15 = objc_msgSend(v9, "compare:", v14);
  return v15;
}

- (HMAccessory)accessory
{
  return self->_accessory;
}

- (HFCharacteristicValueSource)valueSource
{
  return self->_valueSource;
}

- (NSSet)serviceItems
{
  return self->_serviceItems;
}

- (void)setServiceItems:(id)a3
{
  objc_storeStrong((id *)&self->_serviceItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceItems, 0);
  objc_storeStrong((id *)&self->_valueSource, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
}

+ (id)itemWithAccessoryRepresentableObject:(id)a3 valueSource:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a4;
  v7 = a3;
  v8 = objc_opt_class();
  objc_msgSend(v7, "hf_homeKitObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v9;
  if (!v10)
    goto LABEL_7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v10;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v8, objc_opt_class());

LABEL_7:
    v12 = 0;
  }

  v15 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAccessory:valueSource:", v12, v6);
  return v15;
}

@end
