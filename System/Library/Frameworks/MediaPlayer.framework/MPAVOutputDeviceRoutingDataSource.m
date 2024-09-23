@implementation MPAVOutputDeviceRoutingDataSource

void __57__MPAVOutputDeviceRoutingDataSource_setDiscoverySession___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
  if (v2)
  {
    objc_msgSend(v2, "unwrappedValue");
    v3 = (id)MRAVOutputContextCopyUniqueIdentifier();
    objc_msgSend(*(id *)(a1 + 40), "setRoutingContextUID:", v3);

  }
}

- (id)getRoutesForCategory:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t m;
  void *v37;
  void *v38;
  void *v39;
  char v40;
  NSObject *v41;
  id v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t n;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  NSObject *v52;
  id v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t jj;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  uint64_t v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t ii;
  id v69;
  id v70;
  char v71;
  id v72;
  void *v73;
  id v74;
  void *v75;
  char v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t kk;
  void *v80;
  uint64_t v81;
  void *v82;
  id v83;
  id v84;
  void *v85;
  char v86;
  id v87;
  void *v88;
  NSObject *serialQueue;
  id v90;
  id v91;
  id v92;
  id v93;
  uint64_t v94;
  void *v95;
  void *v96;
  uint64_t v97;
  void *v98;
  void *v99;
  id v100;
  char v102;
  uint64_t v103;
  id v104;
  id v105;
  void *v106;
  id v107;
  void *v108;
  id v109;
  MPAVOutputDeviceRoutingDataSource *v110;
  id obj;
  id v112;
  id v113;
  id v114;
  void *v115;
  _QWORD block[5];
  id v117;
  id v118;
  id v119;
  id v120;
  id v121;
  char v122;
  _QWORD v123[5];
  id v124;
  id v125;
  __int128 *p_buf;
  uint64_t v127;
  char v128;
  char v129;
  char v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
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
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  uint64_t v163;
  uint64_t v164;
  void (*v165)(uint64_t);
  void *v166;
  MPAVOutputDeviceRoutingDataSource *v167;
  id v168;
  uint64_t *v169;
  uint64_t v170;
  uint64_t *v171;
  uint64_t v172;
  uint64_t (*v173)(uint64_t, uint64_t);
  void (*v174)(uint64_t);
  id v175;
  __int128 buf;
  uint64_t v177;
  char v178;
  _BYTE v179[128];
  _BYTE v180[128];
  _BYTE v181[128];
  _BYTE v182[128];
  _BYTE v183[128];
  _BYTE v184[128];
  _BYTE v185[128];
  _BYTE v186[128];
  _QWORD v187[4];

  v187[1] = *MEMORY[0x1E0C80C00];
  v104 = a3;
  v105 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v110 = self;
  -[MPAVOutputDeviceRoutingDataSource endpointRoute](self, "endpointRoute");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPAVOutputDeviceRoutingDataSource applicationOutputContext](self, "applicationOutputContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v170 = 0;
  v171 = &v170;
  v172 = 0x3032000000;
  v173 = __Block_byref_object_copy__44550;
  v174 = __Block_byref_object_dispose__44551;
  v175 = 0;
  v163 = MEMORY[0x1E0C809B0];
  v164 = 3221225472;
  v165 = __58__MPAVOutputDeviceRoutingDataSource_getRoutesForCategory___block_invoke;
  v166 = &unk_1E31635A8;
  v169 = &v170;
  v167 = v110;
  v6 = v4;
  v168 = v6;
  msv_dispatch_sync_on_queue();
  v108 = v6;
  if (v6)
  {
    objc_msgSend(v6, "endpointObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "resolvedOutputDevices");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v108, "isDeviceRoute") ^ 1;
  }
  else if (v5)
  {
    objc_msgSend(objc_retainAutorelease(v5), "unwrappedValue");
    v8 = (void *)MRAVOutputContextCopyOutputDevices();
    v9 = 0;
  }
  else
  {
    v8 = 0;
    v9 = 1;
  }
  v107 = objc_retainAutorelease(v5);
  objc_msgSend(v107, "unwrappedValue");
  v10 = MRAVOutputContextCopyPredictedOutputDevice();
  v11 = (void *)v10;
  v106 = (void *)v10;
  if (v10)
  {
    v187[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v187, 1);
    v12 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v12;
    v11 = v106;
  }
  -[MPAVOutputDeviceRoutingDataSource setPredictedDevice:](v110, "setPredictedDevice:", v11);
  v13 = objc_msgSend(v8, "count");
  v112 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v103 = v13;
  if (v9)
  {
    v14 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v161 = 0u;
    v162 = 0u;
    v159 = 0u;
    v160 = 0u;
    v15 = v8;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v159, v186, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v160;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v160 != v17)
            objc_enumerationMutation(v15);
          v19 = *(void **)(*((_QWORD *)&v159 + 1) + 8 * i);
          objc_msgSend(v19, "logicalDeviceID");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v19, "isProxyGroupPlayer") && objc_msgSend(v20, "length"))
            objc_msgSend(v14, "addObject:", v20);

        }
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v159, v186, 16);
      }
      while (v16);
    }

    v157 = 0u;
    v158 = 0u;
    v155 = 0u;
    v156 = 0u;
    v21 = v15;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v155, v185, 16);
    if (v22)
    {
      v23 = *(_QWORD *)v156;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v156 != v23)
            objc_enumerationMutation(v21);
          v25 = *(void **)(*((_QWORD *)&v155 + 1) + 8 * j);
          objc_msgSend(v25, "uid");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          MRComputeBaseRouteUID();
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v25, "logicalDeviceID");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if (v27
            && (objc_msgSend(v25, "isProxyGroupPlayer") & 1) == 0
            && (!objc_msgSend(v28, "length") || (objc_msgSend(v14, "containsObject:", v28) & 1) == 0))
          {
            objc_msgSend(v112, "addObject:", v27);
          }

        }
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v155, v185, 16);
      }
      while (v22);
    }

  }
  else
  {
    v153 = 0u;
    v154 = 0u;
    v151 = 0u;
    v152 = 0u;
    v14 = v8;
    v29 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v151, v184, 16);
    if (v29)
    {
      v30 = *(_QWORD *)v152;
      do
      {
        for (k = 0; k != v29; ++k)
        {
          if (*(_QWORD *)v152 != v30)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v151 + 1) + 8 * k), "uid");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          MRComputeBaseRouteUID();
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          if (v33)
            objc_msgSend(v112, "addObject:", v33);

        }
        v29 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v151, v184, 16);
      }
      while (v29);
    }
  }

  v149 = 0u;
  v150 = 0u;
  v147 = 0u;
  v148 = 0u;
  obj = v8;
  v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v147, v183, 16);
  if (v34)
  {
    v35 = *(_QWORD *)v148;
    while (2)
    {
      for (m = 0; m != v34; ++m)
      {
        if (*(_QWORD *)v148 != v35)
          objc_enumerationMutation(obj);
        v37 = *(void **)(*((_QWORD *)&v147 + 1) + 8 * m);
        objc_msgSend(v37, "uid");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        MRComputeBaseRouteUID();
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v39)
        {
          v41 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf) = 138543362;
            *(_QWORD *)((char *)&buf + 4) = v37;
            _os_log_impl(&dword_193B9B000, v41, OS_LOG_TYPE_DEFAULT, "Found picked device with nil UID: %{public}@", (uint8_t *)&buf, 0xCu);
          }

          v40 = 0;
          goto LABEL_53;
        }

      }
      v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v147, v183, 16);
      if (v34)
        continue;
      break;
    }
  }
  v40 = 1;
LABEL_53:

  v42 = objc_alloc(MEMORY[0x1E0C99E20]);
  v43 = (void *)objc_msgSend(v42, "initWithCapacity:", objc_msgSend((id)v171[5], "count"));
  v145 = 0u;
  v146 = 0u;
  v143 = 0u;
  v144 = 0u;
  v44 = (id)v171[5];
  v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v143, v182, 16);
  if (v45)
  {
    v115 = 0;
    v46 = *(_QWORD *)v144;
    do
    {
      for (n = 0; n != v45; ++n)
      {
        if (*(_QWORD *)v144 != v46)
          objc_enumerationMutation(v44);
        v48 = *(void **)(*((_QWORD *)&v143 + 1) + 8 * n);
        if (objc_msgSend(v48, "isLocalDevice"))
        {
          v49 = v48;

          v115 = v49;
        }
        objc_msgSend(v48, "uid");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        MRComputeBaseRouteUID();
        v51 = (void *)objc_claimAutoreleasedReturnValue();

        if (v51)
        {
          objc_msgSend(v43, "addObject:", v51);
        }
        else
        {
          v52 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf) = 138543362;
            *(_QWORD *)((char *)&buf + 4) = v48;
            _os_log_impl(&dword_193B9B000, v52, OS_LOG_TYPE_DEFAULT, "Found discovery device with nil UID: %{public}@", (uint8_t *)&buf, 0xCu);
          }

          v40 = 0;
        }

      }
      v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v143, v182, 16);
    }
    while (v45);
  }
  else
  {
    v115 = 0;
  }

  -[MPAVOutputDeviceRoutingDataSource _setShouldSourceOutputDevicesFromAVODDS:](v110, "_setShouldSourceOutputDevicesFromAVODDS:", (objc_msgSend((id)v171[5], "count") != 0) & v40);
  if (!v110->_shouldSourceOutputDevicesFromAVODDS)
  {
    v137 = 0u;
    v138 = 0u;
    v135 = 0u;
    v136 = 0u;
    v65 = obj;
    v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v135, v180, 16);
    if (v66)
    {
      v67 = *(_QWORD *)v136;
      while (2)
      {
        for (ii = 0; ii != v66; ++ii)
        {
          if (*(_QWORD *)v136 != v67)
            objc_enumerationMutation(v65);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v135 + 1) + 8 * ii), "isLocalDevice"))
          {

            v53 = v65;
            v71 = 1;
            goto LABEL_95;
          }
        }
        v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v135, v180, 16);
        if (v66)
          continue;
        break;
      }
    }

    v69 = v65;
    v53 = v69;
    if (!v115)
    {
      v71 = 0;
      goto LABEL_95;
    }
    objc_msgSend(v69, "arrayByAddingObject:");
    v70 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_92;
  }
  v53 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(obj, "count"));
  v141 = 0u;
  v142 = 0u;
  v139 = 0u;
  v140 = 0u;
  v54 = obj;
  v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v139, v181, 16);
  if (v55)
  {
    v56 = *(_QWORD *)v140;
    do
    {
      for (jj = 0; jj != v55; ++jj)
      {
        if (*(_QWORD *)v140 != v56)
          objc_enumerationMutation(v54);
        v58 = *(void **)(*((_QWORD *)&v139 + 1) + 8 * jj);
        objc_msgSend(v58, "uid");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        MRComputeBaseRouteUID();
        v60 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v43, "containsObject:", v60) & 1) == 0)
          objc_msgSend(v53, "addObject:", v58);

      }
      v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v139, v181, 16);
    }
    while (v55);
  }

  v61 = objc_msgSend(v53, "count");
  v62 = (void *)v171[5];
  if (!v61)
  {
    v70 = v62;
LABEL_92:
    v64 = (uint64_t)v70;
    goto LABEL_93;
  }
  v63 = (void *)objc_msgSend(v62, "mutableCopy");
  objc_msgSend(v63, "arrayByAddingObjectsFromArray:", v53);
  v64 = objc_claimAutoreleasedReturnValue();

LABEL_93:
  v71 = 0;
  v53 = (id)v64;
LABEL_95:
  v72 = objc_alloc(MEMORY[0x1E0C99E08]);
  v73 = (void *)objc_msgSend(v72, "initWithCapacity:", objc_msgSend((id)v171[5], "count"));
  v102 = v71;
  v74 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v75 = (void *)objc_msgSend(v74, "initWithCapacity:", objc_msgSend((id)v171[5], "count"));
  v133 = 0u;
  v134 = 0u;
  v131 = 0u;
  v132 = 0u;
  v114 = v53;
  v76 = 0;
  v77 = objc_msgSend(v114, "countByEnumeratingWithState:objects:count:", &v131, v179, 16);
  if (!v77)
    goto LABEL_109;
  v78 = *(_QWORD *)v132;
  do
  {
    for (kk = 0; kk != v77; ++kk)
    {
      if (*(_QWORD *)v132 != v78)
        objc_enumerationMutation(v114);
      v80 = *(void **)(*((_QWORD *)&v131 + 1) + 8 * kk);
      objc_msgSend(v80, "logicalDeviceID");
      v81 = objc_claimAutoreleasedReturnValue();
      v82 = (void *)v81;
      if ((v76 & 1) != 0)
      {
        v76 = 1;
        if (!v81)
          goto LABEL_106;
      }
      else
      {
        v76 = objc_msgSend(v80, "isPickedOnPairedDevice");
        if (!v82)
        {
LABEL_106:
          objc_msgSend(v75, "addObject:", v80);
          goto LABEL_107;
        }
      }
      objc_msgSend(v73, "objectForKey:", v82);
      v83 = (id)objc_claimAutoreleasedReturnValue();
      if (!v83)
      {
        v83 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_msgSend(v73, "setObject:forKey:", v83, v82);
      }
      objc_msgSend(v83, "addObject:", v80);

LABEL_107:
    }
    v77 = objc_msgSend(v114, "countByEnumeratingWithState:objects:count:", &v131, v179, 16);
  }
  while (v77);
LABEL_109:

  v84 = v108;
  v85 = v84;
  if (v108)
    v86 = objc_msgSend(v84, "isDeviceRoute");
  else
    v86 = 1;

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v177 = 0x2020000000;
  v178 = 0;
  v123[0] = MEMORY[0x1E0C809B0];
  v123[1] = 3221225472;
  v123[2] = __58__MPAVOutputDeviceRoutingDataSource_getRoutesForCategory___block_invoke_20;
  v123[3] = &unk_1E3161670;
  v123[4] = v110;
  v128 = v86;
  v129 = v76;
  p_buf = &buf;
  v127 = v103;
  v113 = v112;
  v124 = v113;
  v130 = v102;
  v87 = v105;
  v125 = v87;
  v88 = (void *)MEMORY[0x19403A810](v123);
  serialQueue = v110->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__MPAVOutputDeviceRoutingDataSource_getRoutesForCategory___block_invoke_3;
  block[3] = &unk_1E31616D8;
  block[4] = v110;
  v90 = v87;
  v117 = v90;
  v91 = v73;
  v118 = v91;
  v92 = v88;
  v121 = v92;
  v93 = v75;
  v119 = v93;
  v109 = v104;
  v120 = v109;
  v122 = v86;
  dispatch_sync(serialQueue, block);
  v94 = -[MPAVRoutingDataSource filterMode](v110, "filterMode");
  switch(v94)
  {
    case 1:
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_26_44587);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "filteredArrayUsingPredicate:", v95);
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      v97 = objc_msgSend(v96, "mutableCopy");
LABEL_118:
      v98 = (void *)v97;

      goto LABEL_120;
    case 2:
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_28_44589);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "filteredArrayUsingPredicate:", v95);
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      v97 = objc_msgSend(v96, "mutableCopy");
      goto LABEL_118;
    case 3:
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_27_44588);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "filteredArrayUsingPredicate:", v95);
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      v97 = objc_msgSend(v96, "mutableCopy");
      goto LABEL_118;
  }
  v98 = v90;
LABEL_120:
  v99 = v120;
  v100 = v98;

  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(&v170, 8);

  return v100;
}

- (void)setPredictedDevice:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__MPAVOutputDeviceRoutingDataSource_setPredictedDevice___block_invoke;
  block[3] = &unk_1E31635F8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(serialQueue, block);

}

- (MPAVEndpointRoute)endpointRoute
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__44550;
  v8 = __Block_byref_object_dispose__44551;
  v9 = 0;
  msv_dispatch_sync_on_queue();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (MPAVEndpointRoute *)v2;
}

- (MPMRAVOutputContextWrapper)applicationOutputContext
{
  NSObject *serialQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__44550;
  v10 = __Block_byref_object_dispose__44551;
  v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __61__MPAVOutputDeviceRoutingDataSource_applicationOutputContext__block_invoke;
  v5[3] = &unk_1E3163580;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (MPMRAVOutputContextWrapper *)v3;
}

- (void)_setShouldSourceOutputDevicesFromAVODDS:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v4;
  _BOOL4 v5;
  const char *v6;
  uint8_t *v7;
  __int16 v8;
  __int16 v9;

  if (self->_shouldSourceOutputDevicesFromAVODDS != a3)
  {
    v3 = a3;
    self->_shouldSourceOutputDevicesFromAVODDS = a3;
    v4 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v5)
      {
        v9 = 0;
        v6 = "Output device UIDs determined to be available. Output devices from AVODDS will no longer be ignored.";
        v7 = (uint8_t *)&v9;
LABEL_7:
        _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
      }
    }
    else if (v5)
    {
      v8 = 0;
      v6 = "Output device UIDs determined to be unavailable. Output devices from AVODDS will be ignored.";
      v7 = (uint8_t *)&v8;
      goto LABEL_7;
    }

  }
}

void __45__MPAVOutputDeviceRoutingDataSource_endpoint__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "endpointWrapper");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v5, "unwrappedValue");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_initWithEndpointRoute:(id)a3
{
  id v5;
  MPAVOutputDeviceRoutingDataSource *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *serialQueue;
  dispatch_queue_t v9;
  OS_dispatch_queue *discoverySessionQueue;
  void *SharedAudioPresentationContext;
  MPMRAVOutputContextWrapper *v12;
  MPMRAVOutputContextWrapper *applicationOutputContext;
  NSObject *v14;
  objc_super v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  MPAVOutputDeviceRoutingDataSource *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MPAVOutputDeviceRoutingDataSource;
  v6 = -[MPAVRoutingDataSource init](&v16, sel_init);
  if (v6)
  {
    v7 = dispatch_queue_create("com.apple.MediaPlayer.MPAVOutputDeviceRoutingDataSource/serialQueue", 0);
    serialQueue = v6->_serialQueue;
    v6->_serialQueue = (OS_dispatch_queue *)v7;

    v9 = dispatch_queue_create("com.apple.MediaPlayer.MPAVOutputDeviceRoutingDataSource/discoverySessionQueue", 0);
    discoverySessionQueue = v6->_discoverySessionQueue;
    v6->_discoverySessionQueue = (OS_dispatch_queue *)v9;

    v6->_attemptedToInitializeAppOutputContext = 0;
    v6->_shouldSourceOutputDevicesFromAVODDS = 1;
    v6->_supportsMultipleSelection = 1;
    v6->_supportsQueueHandoff = 1;
    objc_storeStrong((id *)&v6->_endpointRoute, a3);
    SharedAudioPresentationContext = (void *)MRAVOutputContextGetSharedAudioPresentationContext();
    if (SharedAudioPresentationContext)
    {
      v12 = -[MPMRAVOutputContextWrapper initWithMRAVOutputContext:]([MPMRAVOutputContextWrapper alloc], "initWithMRAVOutputContext:", SharedAudioPresentationContext);
      applicationOutputContext = v6->_applicationOutputContext;
      v6->_applicationOutputContext = v12;

      SharedAudioPresentationContext = (void *)MRAVOutputContextCopyUniqueIdentifier();
    }
    v14 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v18 = SharedAudioPresentationContext;
      v19 = 2114;
      v20 = v6;
      _os_log_impl(&dword_193B9B000, v14, OS_LOG_TYPE_DEFAULT, "Created new application output context: %{public}@ for data source: %{public}@", buf, 0x16u);
    }

    -[MPAVOutputDeviceRoutingDataSource _registerNotifications](v6, "_registerNotifications");
    -[MPAVOutputDeviceRoutingDataSource _generateDiscoverySession](v6, "_generateDiscoverySession");

  }
  return v6;
}

- (void)_registerNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__outputDevicesDidChangeNotification_, *MEMORY[0x1E0D4C690], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__routeStatusDidChangeNotification_, *MEMORY[0x1E0D4CDA0], 0);

}

- (void)_generateDiscoverySession
{
  NSObject *discoverySessionQueue;
  _QWORD block[5];

  discoverySessionQueue = self->_discoverySessionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__MPAVOutputDeviceRoutingDataSource__generateDiscoverySession__block_invoke;
  block[3] = &unk_1E3163508;
  block[4] = self;
  dispatch_async(discoverySessionQueue, block);
}

- (MPAVOutputDeviceRoutingDataSource)init
{
  return (MPAVOutputDeviceRoutingDataSource *)-[MPAVOutputDeviceRoutingDataSource _initWithEndpointRoute:](self, "_initWithEndpointRoute:", 0);
}

uint64_t __62__MPAVOutputDeviceRoutingDataSource__generateDiscoverySession__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onDiscoverySessionQueue_generateDiscoverySession");
}

void __50__MPAVOutputDeviceRoutingDataSource_endpointRoute__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 160));
}

uint64_t __63__MPAVOutputDeviceRoutingDataSource_didReceiveDiscoveryResults__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 129);
  return result;
}

void __61__MPAVOutputDeviceRoutingDataSource_applicationOutputContext__block_invoke(uint64_t a1)
{
  void *v1;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "endpoint");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!v4
    || (objc_msgSend(*(id *)(a1 + 32), "endpoint"),
        v1 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v1, "isLocalEndpoint")))
  {
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
  }
  else
  {
    v3 = 0;
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
  if (v4)

}

- (void)_onDiscoverySessionQueue_generateDiscoverySession
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_discoverySessionQueue);
  -[MPAVOutputDeviceRoutingDataSource endpoint](self, "endpoint");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isCompanionEndpoint"))
  {
    -[MPAVOutputDeviceRoutingDataSource discoverySessionConfiguration](self, "discoverySessionConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v7;
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0D4C500];
    -[MPAVOutputDeviceRoutingDataSource discoverySessionConfiguration](self, "discoverySessionConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5;
  }
  objc_msgSend(v4, "discoverySessionWithConfiguration:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPAVOutputDeviceRoutingDataSource setDiscoverySession:](self, "setDiscoverySession:", v6);

}

void __58__MPAVOutputDeviceRoutingDataSource_getRoutesForCategory___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  MPAVOutputDeviceRoute *v10;
  void *v11;
  MPAVOutputDeviceRoute *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "endpoint");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "personalOutputDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v42 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i);
        v10 = [MPAVOutputDeviceRoute alloc];
        v48 = v9;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v48, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[MPAVOutputDeviceRoute initWithOutputDevices:](v10, "initWithOutputDevices:", v11);

        objc_msgSend(*(id *)(a1 + 40), "addObject:", v12);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    }
    while (v6);
  }

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  objc_msgSend(*(id *)(a1 + 48), "objectEnumerator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v38;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v38 != v16)
          objc_enumerationMutation(v13);
        (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
    }
    while (v15);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v18 = *(id *)(a1 + 56);
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v34;
    do
    {
      for (k = 0; k != v20; ++k)
      {
        if (*(_QWORD *)v34 != v21)
          objc_enumerationMutation(v18);
        v23 = *(_QWORD *)(a1 + 72);
        v45 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * k);
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1, (_QWORD)v33);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *))(v23 + 16))(v23, v24);

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
    }
    while (v20);
  }

  v25 = *(void **)(a1 + 64);
  if (v25)
  {
    v26 = v25;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "activeAudioCategory");
    v26 = (id)objc_claimAutoreleasedReturnValue();
  }
  v27 = v26;
  if (*(_BYTE *)(a1 + 80)
    && objc_msgSend(v26, "isEqualToString:", *MEMORY[0x1E0C89698])
    && !*(_QWORD *)(a1 + 32))
  {
    v28 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_44591);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "filterUsingPredicate:", v29);

  }
  v30 = objc_msgSend(*(id *)(a1 + 40), "copy", (_QWORD)v33);
  v31 = *(_QWORD *)(a1 + 32);
  v32 = *(void **)(v31 + 120);
  *(_QWORD *)(v31 + 120) = v30;

}

- (MRAVEndpoint)endpoint
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__44550;
  v8 = __Block_byref_object_dispose__44551;
  v9 = 0;
  msv_dispatch_sync_on_queue();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (MRAVEndpoint *)v2;
}

- (BOOL)supportsMultipleSelection
{
  return self->_supportsMultipleSelection;
}

- (void)setDiscoverySession:(id)a3
{
  id v5;
  NSObject *serialQueue;
  uint64_t v7;
  id v8;
  MRAVRoutingDiscoverySession *discoverySession;
  id v10;
  void *v11;
  id callbackToken;
  unint64_t v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;
  _QWORD block[5];
  id v20;

  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_discoverySessionQueue);
  -[MRAVRoutingDiscoverySession removeOutputDevicesChangedCallback:](self->_discoverySession, "removeOutputDevicesChangedCallback:", self->_callbackToken);
  -[MRAVRoutingDiscoverySession setDiscoveryMode:](self->_discoverySession, "setDiscoveryMode:", 0);
  serialQueue = self->_serialQueue;
  v7 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__MPAVOutputDeviceRoutingDataSource_setDiscoverySession___block_invoke;
  block[3] = &unk_1E31635F8;
  block[4] = self;
  v8 = v5;
  v20 = v8;
  dispatch_sync(serialQueue, block);
  objc_storeStrong((id *)&self->_discoverySession, a3);
  self->_devicePresenceDetected = -[MRAVRoutingDiscoverySession devicePresenceDetected](self->_discoverySession, "devicePresenceDetected");
  self->_didReceiveDiscoveryResults = 0;
  objc_initWeak(&location, self);
  discoverySession = self->_discoverySession;
  v15[0] = v7;
  v15[1] = 3221225472;
  v15[2] = __57__MPAVOutputDeviceRoutingDataSource_setDiscoverySession___block_invoke_2;
  v15[3] = &unk_1E3163648;
  objc_copyWeak(&v17, &location);
  v10 = v8;
  v16 = v10;
  -[MRAVRoutingDiscoverySession addOutputDevicesChangedCallback:](discoverySession, "addOutputDevicesChangedCallback:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  callbackToken = self->_callbackToken;
  self->_callbackToken = v11;

  v13 = -[MPAVOutputDeviceRoutingDataSource discoveryMode](self, "discoveryMode") - 1;
  if (v13 < 3)
    v14 = (v13 + 1);
  else
    v14 = 0;
  -[MRAVRoutingDiscoverySession setDiscoveryMode:](self->_discoverySession, "setDiscoveryMode:", v14);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

void *__57__MPAVOutputDeviceRoutingDataSource_setDiscoverySession___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *result;

  v2 = *(void **)(a1 + 40);
  result = *(void **)(*(_QWORD *)(a1 + 32) + 192);
  if (result == v2)
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 113) = objc_msgSend(result, "devicePresenceDetected");
    result = (void *)objc_msgSend(*(id *)(a1 + 48), "count");
    if (result)
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 129) = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }
  return result;
}

- (MRAVRoutingDiscoverySessionConfiguration)discoverySessionConfiguration
{
  void *v3;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4C508]), "initWithEndpointFeatures:", 1);
  objc_msgSend(v3, "setTargetAudioSessionID:", -[MPAVOutputDeviceRoutingDataSource targetSessionID](self, "targetSessionID"));
  return (MRAVRoutingDiscoverySessionConfiguration *)v3;
}

- (unsigned)targetSessionID
{
  return self->_targetSessionID;
}

- (int64_t)discoveryMode
{
  return self->_discoveryMode;
}

- (BOOL)didReceiveDiscoveryResults
{
  NSObject *discoverySessionQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  discoverySessionQueue = self->_discoverySessionQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__MPAVOutputDeviceRoutingDataSource_didReceiveDiscoveryResults__block_invoke;
  v5[3] = &unk_1E3163580;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(discoverySessionQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __58__MPAVOutputDeviceRoutingDataSource_getRoutesForCategory___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 192);
  objc_msgSend(*(id *)(a1 + 40), "endpointObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "availableOutputDevicesForEndpoint:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __57__MPAVOutputDeviceRoutingDataSource_setDiscoverySession___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 0;
    v7 = MEMORY[0x1E0C809B0];
    v8 = WeakRetained;
    v9 = *(id *)(a1 + 32);
    v6 = v3;
    v10 = v6;
    msv_dispatch_sync_on_queue();
    if (*((_BYTE *)v12 + 24))
      objc_msgSend(v5, "_outputDevicesDidChange:", v6, v7, 3221225472, __57__MPAVOutputDeviceRoutingDataSource_setDiscoverySession___block_invoke_3, &unk_1E31615D0, v8, v9, v6, &v11);

    _Block_object_dispose(&v11, 8);
  }

}

- (void)_outputDevicesDidChange:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("MPAVRoutingDataSourceRoutesDidChangeNotification"), self);

}

void __56__MPAVOutputDeviceRoutingDataSource_setPredictedDevice___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  char v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 152);
  v3 = *(id *)(a1 + 40);
  if (v2 == v3)
  {

  }
  else
  {
    v4 = v3;
    v5 = v2;
    v6 = objc_msgSend(v5, "isEqual:", v4);

    if ((v6 & 1) == 0)
    {
      v7 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = (void *)objc_opt_class();
        v9 = *(_QWORD *)(a1 + 32);
        v10 = *(_QWORD *)(a1 + 40);
        v12 = 138543874;
        v13 = v8;
        v14 = 2048;
        v15 = v9;
        v16 = 2112;
        v17 = v10;
        v11 = v8;
        _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Setting predicted device: %@", (uint8_t *)&v12, 0x20u);

      }
    }
  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 152), *(id *)(a1 + 40));
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  void *v7;
  MPAVOutputDeviceRoutingDataSource *v8;

  v4 = MEMORY[0x1E0C809B0];
  v5 = 3221225472;
  v6 = __44__MPAVOutputDeviceRoutingDataSource_dealloc__block_invoke;
  v7 = &unk_1E3163508;
  v8 = self;
  msv_dispatch_sync_on_queue();
  -[MPAVOutputDeviceRoutingDataSource _unregisterNotifications](self, "_unregisterNotifications");
  v3.receiver = self;
  v3.super_class = (Class)MPAVOutputDeviceRoutingDataSource;
  -[MPAVRoutingDataSource dealloc](&v3, sel_dealloc);
}

- (NSString)routingContextUID
{
  id v2;
  void *v3;

  -[MPAVOutputDeviceRoutingDataSource applicationOutputContext](self, "applicationOutputContext");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v2, "unwrappedValue");
  v3 = (void *)MRAVOutputContextCopyUniqueIdentifier();

  return (NSString *)v3;
}

- (void)setRoutingContextUID:(id)a3
{
  id v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  NSObject *serialQueue;
  id v10;
  void *v11;
  void *v12;
  _QWORD block[5];
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  MPAVOutputDeviceRoutingDataSource *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPAVOutputDeviceRoutingDataSource.m"), 160, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("routingContextUID"));

  }
  v6 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v16 = v8;
    v17 = 2048;
    v18 = self;
    v19 = 2114;
    v20 = v5;
    _os_log_impl(&dword_193B9B000, v6, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> setting routing context UID = %{public}@", buf, 0x20u);

  }
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__MPAVOutputDeviceRoutingDataSource_setRoutingContextUID___block_invoke;
  block[3] = &unk_1E31635F8;
  block[4] = self;
  v14 = v5;
  v10 = v5;
  dispatch_sync(serialQueue, block);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "postNotificationName:object:", CFSTR("MPAVRoutingDataSourceRoutesDidChangeNotification"), self);
  objc_msgSend(v11, "postNotificationName:object:", CFSTR("MPAVRoutingDataSourceActiveAudioRouteDidChangeNotification"), self);

}

- (void)setEndpointRoute:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v4 = a3;
  msv_dispatch_sync_on_queue();
  if (*((_BYTE *)v7 + 24))
  {
    -[MPAVOutputDeviceRoutingDataSource setDidReceiveDiscoveryResults:](self, "setDidReceiveDiscoveryResults:", 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("MPAVRouteDidChangeNotification"), 0);
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__personalRoutesDidChange, CFSTR("MPAVRouteDidChangeNotification"), v4);
    objc_msgSend(v5, "postNotificationName:object:", CFSTR("MPAVRoutingDataSourceRoutesDidChangeNotification"), self);
    objc_msgSend(v5, "postNotificationName:object:", CFSTR("MPAVRoutingDataSourceActiveAudioRouteDidChangeNotification"), self);
    -[MPAVOutputDeviceRoutingDataSource _generateDiscoverySession](self, "_generateDiscoverySession");

  }
  _Block_object_dispose(&v6, 8);

}

- (void)setTargetSessionID:(unsigned int)a3
{
  NSObject *discoverySessionQueue;
  _QWORD v4[5];
  unsigned int v5;

  if (self->_targetSessionID != a3)
  {
    self->_targetSessionID = a3;
    discoverySessionQueue = self->_discoverySessionQueue;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __56__MPAVOutputDeviceRoutingDataSource_setTargetSessionID___block_invoke;
    v4[3] = &unk_1E31632A0;
    v4[4] = self;
    v5 = a3;
    dispatch_async(discoverySessionQueue, v4);
  }
}

- (MRAVOutputDevice)predictedDevice
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__44550;
  v8 = __Block_byref_object_dispose__44551;
  v9 = 0;
  msv_dispatch_sync_on_queue();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (MRAVOutputDevice *)v2;
}

- (void)setDidReceiveDiscoveryResults:(BOOL)a3
{
  NSObject *discoverySessionQueue;
  _QWORD v4[5];
  BOOL v5;

  discoverySessionQueue = self->_discoverySessionQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __67__MPAVOutputDeviceRoutingDataSource_setDidReceiveDiscoveryResults___block_invoke;
  v4[3] = &unk_1E3163468;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(discoverySessionQueue, v4);
}

- (void)setCompanionDiscoverySession:(id)a3
{
  id v5;
  MRAVRoutingDiscoverySession *companionDiscoverySession;
  void *v7;
  id companionCallbackToken;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  id location;

  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_discoverySessionQueue);
  -[MRAVRoutingDiscoverySession removeEndpointsChangedCallback:](self->_companionDiscoverySession, "removeEndpointsChangedCallback:", self->_companionCallbackToken);
  objc_storeStrong((id *)&self->_companionDiscoverySession, a3);
  self->_didFindCompanion = 0;
  objc_initWeak(&location, self);
  companionDiscoverySession = self->_companionDiscoverySession;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __66__MPAVOutputDeviceRoutingDataSource_setCompanionDiscoverySession___block_invoke;
  v12 = &unk_1E31615F8;
  objc_copyWeak(&v13, &location);
  -[MRAVRoutingDiscoverySession addEndpointsChangedCallback:](companionDiscoverySession, "addEndpointsChangedCallback:", &v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  companionCallbackToken = self->_companionCallbackToken;
  self->_companionCallbackToken = v7;

  -[MRAVRoutingDiscoverySession setDiscoveryMode:](self->_companionDiscoverySession, "setDiscoveryMode:", 3, v9, v10, v11, v12);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

- (void)setDiscoveryMode:(int64_t)a3
{
  NSObject *discoverySessionQueue;
  _QWORD v4[6];

  discoverySessionQueue = self->_discoverySessionQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__MPAVOutputDeviceRoutingDataSource_setDiscoveryMode___block_invoke;
  v4[3] = &unk_1E3161620;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(discoverySessionQueue, v4);
}

- (void)setPickedRoute:(id)a3 withPassword:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  objc_class *v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  void *v46;
  id v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD block[5];
  id v54;
  id v55;
  id v56;
  NSObject *v57;
  id v58;
  id v59;
  _QWORD v60[4];
  id v61;
  id v62;
  id location;
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v45 = a4;
  v10 = a5;
  -[MPAVOutputDeviceRoutingDataSource applicationOutputContext](self, "applicationOutputContext");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = v9;
    objc_msgSend(v11, "outputDevices");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = (void *)objc_msgSend(v12, "mutableCopy");

    objc_initWeak(&location, self);
    v13 = MEMORY[0x1E0C809B0];
    v60[0] = MEMORY[0x1E0C809B0];
    v60[1] = 3221225472;
    v60[2] = __76__MPAVOutputDeviceRoutingDataSource_setPickedRoute_withPassword_completion___block_invoke;
    v60[3] = &unk_1E31617A8;
    objc_copyWeak(&v62, &location);
    v14 = v10;
    v61 = v14;
    v43 = (void *)MEMORY[0x19403A810](v60);
    dispatch_get_global_queue(21, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPAVOutputDeviceRoutingDataSource endpoint](self, "endpoint");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "outputDevices");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    -[MPAVOutputDeviceRoutingDataSource endpointRoute](self, "endpointRoute");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17
      && (-[MPAVOutputDeviceRoutingDataSource endpoint](self, "endpoint"),
          v18 = (void *)objc_claimAutoreleasedReturnValue(),
          v19 = objc_msgSend(v18, "isLocalEndpoint"),
          v18,
          v17,
          (v19 & 1) == 0))
    {
      if (self->_supportsQueueHandoff
        || (objc_msgSend(MEMORY[0x1E0D4C558], "sharedManager"),
            v35 = (void *)objc_claimAutoreleasedReturnValue(),
            -[MPAVOutputDeviceRoutingDataSource presentingAppBundleID](self, "presentingAppBundleID"),
            v36 = (void *)objc_claimAutoreleasedReturnValue(),
            v37 = objc_msgSend(v35, "activeActivityExistsForBundle:", v36),
            v36,
            v35,
            v37))
      {
        -[MPAVOutputDeviceRoutingDataSource endpoint](self, "endpoint");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "outputDevices");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "migrateToOrSetOutputDevices:initiator:withReplyQueue:completion:", v38, self->_initiator, v15, v43);

      }
      else
      {
        -[MPAVOutputDeviceRoutingDataSource endpoint](self, "endpoint");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "outputDevices");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setOutputDevices:initiator:withReplyQueue:completion:", v40, self->_initiator, v15, v43);

      }
    }
    else if (v46)
    {
      block[0] = v13;
      block[1] = 3221225472;
      block[2] = __76__MPAVOutputDeviceRoutingDataSource_setPickedRoute_withPassword_completion___block_invoke_3;
      block[3] = &unk_1E31617D0;
      v59 = v43;
      block[4] = self;
      v54 = v42;
      v55 = v46;
      v56 = v41;
      v57 = v15;
      v58 = v11;
      dispatch_async(v57, block);

      v20 = v59;
    }
    else
    {
      if (!v14)
      {
LABEL_29:

        objc_destroyWeak(&v62);
        objc_destroyWeak(&location);

        goto LABEL_30;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MPAVRoutingControllerErrorDomain"), 5, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v14 + 2))(v14, v20);
    }

    goto LABEL_29;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v21 = v46;
    if (v46)
    {
      v44 = v9;
      objc_msgSend(v44, "endpointWrapper");
      v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v22, "unwrappedValue");
      v23 = (void *)MRAVEndpointCopyOutputDevices();

      v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v49 = 0u;
      v50 = 0u;
      v51 = 0u;
      v52 = 0u;
      v25 = v23;
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v49, v64, 16);
      if (v26)
      {
        v27 = *(_QWORD *)v50;
        do
        {
          for (i = 0; i != v26; ++i)
          {
            if (*(_QWORD *)v50 != v27)
              objc_enumerationMutation(v25);
            v29 = (void *)MRAVOutputDeviceCopyUniqueIdentifier();
            MRComputeBaseRouteUID();
            v30 = (void *)objc_claimAutoreleasedReturnValue();

            if (v30)
              objc_msgSend(v24, "addObject:", v30);

          }
          v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v49, v64, 16);
        }
        while (v26);
      }

      MRAVReconnaissanceSessionCreateWithEndpointFeatures();
      v47 = v46;
      v48 = v10;
      MRAVReconnaissanceSessionBeginSearch();

      goto LABEL_30;
    }
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MPAVRoutingControllerErrorDomain"), 5, 0);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v10 + 2))(v10, v39);

LABEL_30:
      v21 = v46;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (objc_class *)objc_opt_class();
    NSStringFromClass(v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPAVOutputDeviceRoutingDataSource.m"), 783, CFSTR("invalid class for %@ (%@)"), v32, v34);

    v21 = v46;
    if (v10)
      (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
  }

}

- (void)createGroupFromOutputDevices:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v11 = v7;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v22;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v15), "uid");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v13);
  }

  v17 = (void *)MEMORY[0x1E0D4C4D0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __83__MPAVOutputDeviceRoutingDataSource_createGroupFromOutputDevices_queue_completion___block_invoke;
  v19[3] = &unk_1E3161850;
  v20 = v9;
  v18 = v9;
  objc_msgSend(v17, "createEndpointWithOutputDeviceUIDs:queue:completion:", v10, v8, v19);

}

- (void)addRouteToGroup:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPAVOutputDeviceRoutingDataSource.m"), 804, CFSTR("invalid class for %@"), v11);

  }
  v12[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPAVOutputDeviceRoutingDataSource addRoutesToGroup:completion:](self, "addRoutesToGroup:completion:", v9, v8);

}

- (void)addRoutesToGroup:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  MPAVOutputDeviceRoutingDataSource *v22;
  id v23;

  v6 = a4;
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __65__MPAVOutputDeviceRoutingDataSource_addRoutesToGroup_completion___block_invoke;
  v21 = &unk_1E3161878;
  v22 = self;
  v7 = v6;
  v23 = v7;
  v8 = a3;
  v9 = (void *)MEMORY[0x19403A810](&v18);
  -[MPAVOutputDeviceRoutingDataSource outputDevicesForRoutes:](self, "outputDevicesForRoutes:", v8, v18, v19, v20, v21, v22);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  LODWORD(v10) = -[MPAVOutputDeviceRoutingDataSource _shouldAddPredictedDeviceToOuputDevices:](self, "_shouldAddPredictedDeviceToOuputDevices:", v8);
  if ((_DWORD)v10)
  {
    -[MPAVOutputDeviceRoutingDataSource predictedDevice](self, "predictedDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v12);

  }
  dispatch_get_global_queue(21, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_supportsQueueHandoff
    || (objc_msgSend(MEMORY[0x1E0D4C558], "sharedManager"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        -[MPAVOutputDeviceRoutingDataSource presentingAppBundleID](self, "presentingAppBundleID"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v16 = objc_msgSend(v14, "activeActivityExistsForBundle:", v15),
        v15,
        v14,
        v16))
  {
    -[MPAVOutputDeviceRoutingDataSource endpoint](self, "endpoint");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "migrateToOrAddOutputDevices:initiator:withReplyQueue:completion:", v11, self->_initiator, v13, v9);
  }
  else
  {
    -[MPAVOutputDeviceRoutingDataSource endpoint](self, "endpoint");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addOutputDevices:initiator:withReplyQueue:completion:", v11, self->_initiator, v13, v9);
  }

}

- (void)removeRouteFromGroup:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPAVOutputDeviceRoutingDataSource.m"), 835, CFSTR("invalid class for %@"), v11);

  }
  v12[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPAVOutputDeviceRoutingDataSource removeRoutesFromGroup:completion:](self, "removeRoutesFromGroup:completion:", v9, v8);

}

- (void)removeRoutesFromGroup:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  unint64_t v20;
  id v21;
  NSObject *v22;
  id v23;
  void *v24;
  MPAVOutputDeviceRoutingDataSource *v25;
  void *v26;
  void *v27;
  void (**v28)(id, _QWORD);
  _QWORD block[5];
  id v30;
  id v31;
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[4];
  void (**v39)(id, _QWORD);
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, _QWORD))a4;
  -[MPAVOutputDeviceRoutingDataSource outputDevicesForRoutes:](self, "outputDevicesForRoutes:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MPAVOutputDeviceRoutingDataSource _isRemovingPredictedDevice:](self, "_isRemovingPredictedDevice:", v7))
  {
    -[MPAVOutputDeviceRoutingDataSource _resetPredictedOutputDevice](self, "_resetPredictedOutputDevice");
    v6[2](v6, 0);
  }
  else
  {
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __70__MPAVOutputDeviceRoutingDataSource_removeRoutesFromGroup_completion___block_invoke;
    v38[3] = &unk_1E3162300;
    v28 = v6;
    v39 = v6;
    v8 = (void *)MEMORY[0x19403A810](v38);
    dispatch_get_global_queue(21, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPAVOutputDeviceRoutingDataSource endpoint](self, "endpoint");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v10 = v7;
    v11 = (id)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    if (v11)
    {
      v24 = v8;
      v25 = self;
      v26 = v7;
      v12 = *(_QWORD *)v35;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v35 != v12)
            objc_enumerationMutation(v10);
          v14 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v14, "uid", v24, v25, v26);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "designatedGroupLeader");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "uid");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v15, "isEqualToString:", v17);

          if (v18)
          {
            v11 = v14;
            goto LABEL_13;
          }
        }
        v11 = (id)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
        if (v11)
          continue;
        break;
      }
LABEL_13:
      self = v25;
      v7 = v26;
      v8 = v24;
    }

    v19 = (void *)objc_msgSend(v10, "mutableCopy");
    v20 = objc_msgSend(v10, "count");
    if (v11 && v20 >= 2)
      objc_msgSend(v19, "removeObject:", v11);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __70__MPAVOutputDeviceRoutingDataSource_removeRoutesFromGroup_completion___block_invoke_3;
    block[3] = &unk_1E31618C8;
    block[4] = self;
    v30 = v19;
    v31 = v27;
    v32 = v10;
    v33 = v8;
    v21 = v8;
    v22 = v27;
    v23 = v19;
    dispatch_async(v22, block);

    v6 = v28;
  }

}

- (BOOL)routeIsLeaderOfEndpoint:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v16;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPAVOutputDeviceRoutingDataSource.m"), 894, CFSTR("must be an MPAVOutputDeviceRoute"));

  }
  if (objc_msgSend(v5, "isGroupLeader")
    && (-[MPAVOutputDeviceRoutingDataSource endpointRoute](self, "endpointRoute"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    v7 = (void *)MEMORY[0x1E0C99E60];
    -[MPAVOutputDeviceRoutingDataSource endpoint](self, "endpoint");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "outputDevices");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v5, "outputDevices");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v10, "intersectsSet:", v13);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)_endpointsDidChangeNotification:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0CB37D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "postNotificationName:object:", v6, self);
}

- (void)_outputDevicesDidChangeNotification:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("MPAVRoutingDataSourceRoutesDidChangeNotification"), self);

}

- (void)_routeStatusDidChangeNotification:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;

  v4 = (objc_class *)MEMORY[0x1E0C99E08];
  v5 = a3;
  v17 = objc_alloc_init(v4);
  objc_msgSend(v5, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D4CD98]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("RouteUID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D4CDA8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPAVOutputDeviceRoutingDataSource _outputDeviceRouteWithUID:](self, "_outputDeviceRouteWithUID:", v8);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v9)
    v12 = v10 == 0;
  else
    v12 = 1;
  if (!v12)
  {
    objc_msgSend(v17, "setObject:forKey:", v10, CFSTR("Route"));
    v13 = objc_msgSend(v9, "integerValue");
    if ((unint64_t)(v13 - 2) <= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MPAVRoutingControllerErrorDomain"), v13, 0);
      v14 = objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        v15 = (void *)v14;
        objc_msgSend(v17, "setObject:forKey:", v14, CFSTR("Error"));

      }
    }
  }
  if (objc_msgSend(v17, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "postNotificationName:object:userInfo:", CFSTR("MPAVRoutingDataSourceFailureNotification"), self, v17);

  }
}

- (id)outputDevicesForRoutes:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "outputDevices", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObjectsFromArray:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)_detachableDevicesInOutputDevices:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "msv_filter:", &__block_literal_global_50_44555);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MPAVOutputDeviceRoutingDataSource _shouldDetachOutputDevicesToGroup:](self, "_shouldDetachOutputDevicesToGroup:", v4))
  {
    v5 = v4;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  return v6;
}

- (BOOL)_shouldDetachOutputDevicesToGroup:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t i;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_detachesRoutesToGroup)
  {
    -[MPAVOutputDeviceRoutingDataSource endpointRoute](self, "endpointRoute");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endpointWrapper");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v6, "unwrappedValue");
    MRAVEndpointGetDesignatedGroupLeader();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v4, "containsObject:", v7) & 1) == 0)
    {
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v8 = v4;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v17;
        v12 = 1;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v17 != v11)
              objc_enumerationMutation(v8);
            v12 &= objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "isGroupable", (_QWORD)v16);
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v10);

        if ((v12 & 1) == 0)
          goto LABEL_11;
      }
      else
      {

      }
      v14 = (unint64_t)objc_msgSend(v8, "count", (_QWORD)v16) > 1;
      goto LABEL_15;
    }
LABEL_11:
    v14 = 0;
LABEL_15:

    goto LABEL_16;
  }
  v14 = 0;
LABEL_16:

  return v14;
}

- (BOOL)_shouldAddPredictedDeviceToOuputDevices:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  char v14;

  v4 = a3;
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "count");

  if (v6 == 1)
    v7 = objc_msgSend(v5, "isSplitterCapable");
  else
    v7 = 0;
  -[MPAVOutputDeviceRoutingDataSource predictedDevice](self, "predictedDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "supportsBluetoothSharing");

  objc_msgSend(v5, "routeUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPAVOutputDeviceRoutingDataSource predictedDevice](self, "predictedDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "uid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v10, "isEqualToString:", v12);

  if (v7)
    v14 = v9 & (v13 ^ 1);
  else
    v14 = 0;

  return v14;
}

- (BOOL)_isRemovingPredictedDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "count") == 1)
  {
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPAVOutputDeviceRoutingDataSource predictedDevice](self, "predictedDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_unregisterNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0D4C690], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0D4CDA0], 0);

}

- (void)_personalRoutesDidChange
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("MPAVRoutingDataSourceRoutesDidChangeNotification"), self);

}

- (id)_outputDeviceRouteWithUID:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__44550;
  v16 = __Block_byref_object_dispose__44551;
  v17 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__MPAVOutputDeviceRoutingDataSource__outputDeviceRouteWithUID___block_invoke;
  block[3] = &unk_1E31635A8;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(serialQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)_onDiscoverySessionQueue_generateCompanionDiscoverySession
{
  void *v3;
  id v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_discoverySessionQueue);
  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D4C508]), "initWithEndpointFeatures:", 8);
  objc_msgSend(MEMORY[0x1E0D4C500], "discoverySessionWithConfiguration:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPAVOutputDeviceRoutingDataSource setCompanionDiscoverySession:](self, "setCompanionDiscoverySession:", v3);

}

- (void)_resetPredictedOutputDevice
{
  NSObject *v3;
  id v4;
  void *v5;
  uint8_t v6[16];

  v3 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_193B9B000, v3, OS_LOG_TYPE_DEFAULT, "Reset predicted outputDevice", v6, 2u);
  }

  -[MPAVOutputDeviceRoutingDataSource applicationOutputContext](self, "applicationOutputContext");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v4, "unwrappedValue");
  MRAVOutputContextResetPredictedOutputDevice();
  -[MRAVRoutingDiscoverySession availableOutputDevices](self->_discoverySession, "availableOutputDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPAVOutputDeviceRoutingDataSource _outputDevicesDidChange:](self, "_outputDevicesDidChange:", v5);

}

- (id)_stateDumpObject
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  id v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  id v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  _QWORD v17[4];
  _QWORD v18[5];

  v18[4] = *MEMORY[0x1E0C80C00];
  v17[0] = CFSTR("_obj");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p>"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v3;
  v17[1] = CFSTR("predictedDevice");
  -[MPAVOutputDeviceRoutingDataSource predictedDevice](self, "predictedDevice");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (const __CFString *)v4;
  else
    v6 = CFSTR("<NONE>");
  v18[1] = v6;
  v17[2] = CFSTR("AVOutputContext.predictedDevice");
  -[MPAVOutputDeviceRoutingDataSource applicationOutputContext](self, "applicationOutputContext");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "unwrappedValue");
  v8 = MRAVOutputContextCopyPredictedOutputDevice();
  v9 = (void *)v8;
  if (v8)
    v10 = (const __CFString *)v8;
  else
    v10 = CFSTR("<NONE>");
  v18[2] = v10;
  v17[3] = CFSTR("AVOutputContext.outputDeviceUIDs");
  -[MPAVOutputDeviceRoutingDataSource applicationOutputContext](self, "applicationOutputContext");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v11, "unwrappedValue");
  v12 = MRAVOutputContextCopyOutputDevices();
  v13 = (void *)v12;
  if (v12)
    v14 = (const __CFString *)v12;
  else
    v14 = CFSTR("<NONE>");
  v18[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)setApplicationOutputContext:(id)a3
{
  objc_storeStrong((id *)&self->_applicationOutputContext, a3);
}

- (void)setSupportsMultipleSelection:(BOOL)a3
{
  self->_supportsMultipleSelection = a3;
}

- (BOOL)devicePresenceDetected
{
  return self->_devicePresenceDetected;
}

- (BOOL)detachesRoutesToGroup
{
  return self->_detachesRoutesToGroup;
}

- (void)setDetachesRoutesToGroup:(BOOL)a3
{
  self->_detachesRoutesToGroup = a3;
}

- (BOOL)supportsQueueHandoff
{
  return self->_supportsQueueHandoff;
}

- (void)setSupportsQueueHandoff:(BOOL)a3
{
  self->_supportsQueueHandoff = a3;
}

- (NSString)presentingAppBundleID
{
  return self->_presentingAppBundleID;
}

- (void)setPresentingAppBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSString)initiator
{
  return self->_initiator;
}

- (void)setInitiator:(id)a3
{
  objc_storeStrong((id *)&self->_initiator, a3);
}

- (MRAVRoutingDiscoverySession)companionDiscoverySession
{
  return self->_companionDiscoverySession;
}

- (MRAVRoutingDiscoverySession)discoverySession
{
  return self->_discoverySession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discoverySession, 0);
  objc_storeStrong((id *)&self->_companionDiscoverySession, 0);
  objc_storeStrong((id *)&self->_initiator, 0);
  objc_storeStrong((id *)&self->_presentingAppBundleID, 0);
  objc_storeStrong((id *)&self->_endpointRoute, 0);
  objc_storeStrong((id *)&self->_predictedDevice, 0);
  objc_storeStrong((id *)&self->_applicationOutputContext, 0);
  objc_storeStrong((id *)&self->_outputDeviceRoutes, 0);
  objc_storeStrong(&self->_callbackToken, 0);
  objc_storeStrong(&self->_companionCallbackToken, 0);
  objc_storeStrong((id *)&self->_discoverySessionQueue, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

void __63__MPAVOutputDeviceRoutingDataSource__outputDeviceRouteWithUID___block_invoke(_QWORD *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  int v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = *(id *)(a1[4] + 120);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(v7, "routeUID", (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isEqualToString:", a1[5]);

        if (v9)
        {
          objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), v7);
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

}

uint64_t __71__MPAVOutputDeviceRoutingDataSource__detachableDevicesInOutputDevices___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEligibleForWHAPlayback");
}

void __70__MPAVOutputDeviceRoutingDataSource_removeRoutesFromGroup_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v3 = (void *)objc_msgSend(a2, "copy");
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    v6 = v4;
    v5 = v3;
    msv_dispatch_on_main_queue();

  }
}

void __70__MPAVOutputDeviceRoutingDataSource_removeRoutesFromGroup_completion___block_invoke_3(id *a1)
{
  void *v2;
  id v3;
  id v4;
  id v5;
  id v6;

  objc_msgSend(a1[4], "endpointRoute");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endpointWrapper");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "unwrappedValue");
  v4 = a1[7];
  v5 = a1[6];
  v6 = a1[8];
  MRAVEndpointRemoveOutputDevicesWithInitiator();

}

void __70__MPAVOutputDeviceRoutingDataSource_removeRoutesFromGroup_completion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:", CFSTR("MPAVRoutingDataSourceActiveAudioRouteDidChangeNotification"), *(_QWORD *)(a1 + 32));
  objc_msgSend(v6, "postNotificationName:object:", CFSTR("MPAVRoutingDataSourceRoutesDidChangeNotification"), *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "_detachableDevicesInOutputDevices:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a2 || !objc_msgSend(v4, "count"))
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  else
    objc_msgSend(*(id *)(a1 + 32), "createGroupFromOutputDevices:queue:completion:", v5, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

uint64_t __70__MPAVOutputDeviceRoutingDataSource_removeRoutesFromGroup_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __65__MPAVOutputDeviceRoutingDataSource_addRoutesToGroup_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("MPAVRoutingDataSourceActiveAudioRouteDidChangeNotification"), *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("MPAVRoutingDataSourceRoutesDidChangeNotification"), *(_QWORD *)(a1 + 32));
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);

}

uint64_t __83__MPAVOutputDeviceRoutingDataSource_createGroupFromOutputDevices_queue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __76__MPAVOutputDeviceRoutingDataSource_setPickedRoute_withPassword_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  id v6;
  void *v7;
  id v8;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = v3;
  v8 = *(id *)(a1 + 32);
  v5 = v3;
  v6 = WeakRetained;
  msv_dispatch_on_main_queue();

}

void __76__MPAVOutputDeviceRoutingDataSource_setPickedRoute_withPassword_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __76__MPAVOutputDeviceRoutingDataSource_setPickedRoute_withPassword_completion___block_invoke_4;
  v8[3] = &unk_1E3162300;
  v9 = *(id *)(a1 + 80);
  v2 = (void *)MEMORY[0x19403A810](v8);
  objc_msgSend(*(id *)(a1 + 32), "_detachableDevicesInOutputDevices:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 48)), "unwrappedValue");
    v7 = v2;
    v5 = v3;
    v6 = *(id *)(a1 + 64);
    MRAVOutputContextSetOutputDevicesWithInitiator();

  }
  else
  {
    if (objc_msgSend(*(id *)(a1 + 72), "isDeviceSpeakerRoute"))
    {
      objc_msgSend(*(id *)(a1 + 32), "predictedDevice");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
        objc_msgSend(*(id *)(a1 + 32), "_resetPredictedOutputDevice");
    }
    objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 48)), "unwrappedValue");
    MRAVOutputContextSetOutputDevicesWithInitiator();
  }

}

void __76__MPAVOutputDeviceRoutingDataSource_setPickedRoute_withPassword_completion___block_invoke_6(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;

  v6 = a2;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "unwrappedValue");
    dispatch_get_global_queue(21, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(id *)(a1 + 48);
    MRAVOutputContextSetOutputDevicesWithInitiator();

  }
  else
  {
    v8 = *(_QWORD *)(a1 + 48);
    if (v8)
      (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v8, a4);
  }
  CFRelease(*(CFTypeRef *)(a1 + 56));

}

void __76__MPAVOutputDeviceRoutingDataSource_setPickedRoute_withPassword_completion___block_invoke_7(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v4 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v9 = a2;
      _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_ERROR, "picked endpoint route, set devices: %{public}@", buf, 0xCu);
    }

    v5 = *(_QWORD *)(a1 + 40);
    if (v5)
      (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, a2);
  }
  else
  {
    dispatch_get_global_queue(21, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(id *)(a1 + 40);
    MRAVEndpointUpdateActiveSystemEndpointWithReason();

  }
}

uint64_t __76__MPAVOutputDeviceRoutingDataSource_setPickedRoute_withPassword_completion___block_invoke_36(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t result;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v4 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 138543362;
      v7 = a2;
      _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_ERROR, "picked endpoint route, clear system endpoint: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = objc_claimAutoreleasedReturnValue();
    -[NSObject postNotificationName:object:](v4, "postNotificationName:object:", CFSTR("MPAVRoutingDataSourceActiveAudioRouteDidChangeNotification"), *(_QWORD *)(a1 + 32));
    -[NSObject postNotificationName:object:](v4, "postNotificationName:object:", CFSTR("MPAVRoutingDataSourceRoutesDidChangeNotification"), *(_QWORD *)(a1 + 32));
  }

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

uint64_t __76__MPAVOutputDeviceRoutingDataSource_setPickedRoute_withPassword_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __76__MPAVOutputDeviceRoutingDataSource_setPickedRoute_withPassword_completion___block_invoke_5(uint64_t a1, uint64_t a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  else
    return objc_msgSend(*(id *)(a1 + 32), "createGroupFromOutputDevices:queue:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __76__MPAVOutputDeviceRoutingDataSource_setPickedRoute_withPassword_completion___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("MPAVRoutingDataSourceActiveAudioRouteDidChangeNotification"), a1[4]);
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("MPAVRoutingDataSourceRoutesDidChangeNotification"), a1[4]);
  v2 = a1[6];
  if (v2)
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, a1[5]);

}

void __58__MPAVOutputDeviceRoutingDataSource_getRoutesForCategory___block_invoke_20(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  MPAVOutputDeviceRoute *v7;
  MPAVOutputDeviceRoute *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[4];
  id v23;
  _BYTE v24[128];
  _QWORD v25[3];

  v25[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if ((objc_msgSend(*(id *)(a1 + 32), "supportsMultipleSelection") & 1) == 0)
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __58__MPAVOutputDeviceRoutingDataSource_getRoutesForCategory___block_invoke_2;
    v22[3] = &unk_1E3161648;
    v23 = *(id *)(a1 + 40);
    objc_msgSend(v3, "sortedArrayUsingComparator:", v22);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v7 = -[MPAVOutputDeviceRoute initWithOutputDevices:]([MPAVOutputDeviceRoute alloc], "initWithOutputDevices:", v4);
  v8 = v7;
  if (*(_BYTE *)(a1 + 72)
    || !-[MPAVOutputDeviceRoute isDeviceRoute](v7, "isDeviceRoute") && -[MPAVRoute isSmartAudio](v8, "isSmartAudio"))
  {
    if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 128))
    {
      if (*(_BYTE *)(a1 + 73))
      {
        v9 = -[MPAVOutputDeviceRoute isPickedOnPairedDevice](v8, "isPickedOnPairedDevice");
      }
      else if (*(_QWORD *)(a1 + 64)
             || !-[MPAVOutputDeviceRoute isDeviceRoute](v8, "isDeviceRoute")
             || (v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8), *(_BYTE *)(v10 + 24)))
      {
        v20 = 0u;
        v21 = 0u;
        v18 = 0u;
        v19 = 0u;
        -[MPAVOutputDeviceRoute outputDevices](v8, "outputDevices", 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v19;
          while (2)
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v19 != v14)
                objc_enumerationMutation(v11);
              objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "uid");
              v16 = objc_claimAutoreleasedReturnValue();
              MRComputeBaseRouteUID();
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              LOBYTE(v16) = objc_msgSend(*(id *)(a1 + 40), "containsObject:", v17);
              if ((v16 & 1) != 0)
              {

                goto LABEL_25;
              }
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
            if (v13)
              continue;
            break;
          }
        }

        v9 = 0;
      }
      else
      {
        v9 = 1;
        *(_BYTE *)(v10 + 24) = 1;
      }
    }
    else if (-[MPAVOutputDeviceRoute isDeviceRoute](v8, "isDeviceRoute"))
    {
      v9 = *(_BYTE *)(a1 + 74) != 0;
    }
    else
    {
LABEL_25:
      v9 = 1;
    }
    -[MPAVRoute setPicked:](v8, "setPicked:", v9);
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v8);
  }

}

uint64_t __58__MPAVOutputDeviceRoutingDataSource_getRoutesForCategory___block_invoke_7(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if ((objc_msgSend(v2, "isTVRoute") & 1) != 0 || (objc_msgSend(v2, "isAppleTVRoute") & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(v2, "containsDeviceWithSubtype:", 18);

  return v3;
}

uint64_t __58__MPAVOutputDeviceRoutingDataSource_getRoutesForCategory___block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isSmartAudio");
}

uint64_t __58__MPAVOutputDeviceRoutingDataSource_getRoutesForCategory___block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if ((objc_msgSend(v2, "isTVRoute") & 1) != 0 || (objc_msgSend(v2, "isAppleTVRoute") & 1) != 0)
    v3 = 0;
  else
    v3 = objc_msgSend(v2, "containsDeviceWithSubtype:", 18) ^ 1;

  return v3;
}

BOOL __58__MPAVOutputDeviceRoutingDataSource_getRoutesForCategory___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "routeSubtype") != 1;
}

uint64_t __58__MPAVOutputDeviceRoutingDataSource_getRoutesForCategory___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  uint64_t v12;

  v5 = a3;
  objc_msgSend(a2, "uid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  MRComputeBaseRouteUID();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "uid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  MRComputeBaseRouteUID();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v7);
  v11 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v9);
  if (!v10 || v11)
  {
    if ((v10 | v11 ^ 1) == 1)
      v12 = objc_msgSend(v7, "compare:", v9);
    else
      v12 = 1;
  }
  else
  {
    v12 = -1;
  }

  return v12;
}

uint64_t __54__MPAVOutputDeviceRoutingDataSource_setDiscoveryMode___block_invoke(uint64_t a1)
{
  uint64_t v2;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144) = *(_QWORD *)(a1 + 40);
  if ((unint64_t)(*(_QWORD *)(a1 + 40) - 1) < 3)
    v2 = *(unsigned int *)(a1 + 40);
  else
    v2 = 0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "setDiscoveryMode:", v2);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "setDiscoveryMode:", v2);
}

void __66__MPAVOutputDeviceRoutingDataSource_setCompanionDiscoverySession___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BYTE *WeakRetained;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          if (!WeakRetained[96]
            && objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "isCompanionEndpoint"))
          {
            msv_dispatch_sync_on_queue();
            goto LABEL_13;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_13:

  }
}

void __66__MPAVOutputDeviceRoutingDataSource_setCompanionDiscoverySession___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "discoverySessionConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "discoverySessionWithConfiguration:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setDiscoverySession:", v4);

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 96) = 1;
}

uint64_t __67__MPAVOutputDeviceRoutingDataSource_setDidReceiveDiscoveryResults___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 129) = *(_BYTE *)(result + 40);
  return result;
}

void __52__MPAVOutputDeviceRoutingDataSource_predictedDevice__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 152));
}

uint64_t __56__MPAVOutputDeviceRoutingDataSource_setTargetSessionID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "setTargetAudioSessionID:", *(unsigned int *)(a1 + 40));
}

void __54__MPAVOutputDeviceRoutingDataSource_setEndpointRoute___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  char v4;
  id v5;

  v5 = *(id *)(*(_QWORD *)(a1 + 32) + 160);
  v2 = *(id *)(a1 + 40);
  if (v5 == v2)
  {

  }
  else
  {
    v3 = v5;
    v4 = objc_msgSend(v3, "isEqual:", v2);

    if ((v4 & 1) == 0)
    {
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 160), *(id *)(a1 + 40));
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    }
  }
}

void __58__MPAVOutputDeviceRoutingDataSource_setRoutingContextUID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t RoutingContext;
  const void *v6;
  MPMRAVOutputContextWrapper *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[5];
  id v14;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 136);
  *(_QWORD *)(v2 + 136) = 0;

  objc_msgSend((id)objc_opt_class(), "_globalAudioSessionLock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lock");
  RoutingContext = MRAVOutputContextCreateRoutingContext();
  if (RoutingContext)
  {
    v6 = (const void *)RoutingContext;
    v7 = -[MPMRAVOutputContextWrapper initWithMRAVOutputContext:]([MPMRAVOutputContextWrapper alloc], "initWithMRAVOutputContext:", RoutingContext);
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 136);
    *(_QWORD *)(v8 + 136) = v7;

    CFRelease(v6);
  }
  objc_msgSend(v4, "unlock");
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(a1 + 40);
  v12 = *(NSObject **)(v10 + 72);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __58__MPAVOutputDeviceRoutingDataSource_setRoutingContextUID___block_invoke_2;
  v13[3] = &unk_1E31635F8;
  v13[4] = v10;
  v14 = v11;
  dispatch_async(v12, v13);

}

uint64_t __58__MPAVOutputDeviceRoutingDataSource_setRoutingContextUID___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "setRoutingContextUID:", *(_QWORD *)(a1 + 40));
}

uint64_t __44__MPAVOutputDeviceRoutingDataSource_dealloc__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "removeOutputDevicesChangedCallback:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "setDiscoveryMode:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "removeEndpointsChangedCallback:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "setDiscoveryMode:", 0);
}

+ (id)_globalAudioSessionLock
{
  if (_globalAudioSessionLock___once != -1)
    dispatch_once(&_globalAudioSessionLock___once, &__block_literal_global_51_44610);
  return (id)_globalAudioSessionLock___globalAudioSessionLock;
}

void __60__MPAVOutputDeviceRoutingDataSource__globalAudioSessionLock__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3740]);
  v1 = (void *)_globalAudioSessionLock___globalAudioSessionLock;
  _globalAudioSessionLock___globalAudioSessionLock = (uint64_t)v0;

}

@end
