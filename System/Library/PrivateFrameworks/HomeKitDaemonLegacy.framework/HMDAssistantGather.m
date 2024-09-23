@implementation HMDAssistantGather

- (HMDAssistantGather)initWithHomeManager:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  HMDAssistantGather *v8;
  HMDAssistantGather *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HMDAssistantGather;
  v8 = -[HMDAssistantGather init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_manager, v6);
    objc_storeStrong((id *)&v9->_workQueue, a4);
  }

  return v9;
}

- (id)_getPrimaryHome
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[HMDAssistantGather manager](self, "manager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "primaryHomeUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v2, "homes", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "uuid");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v3, "isEqual:", v10);

        if (v11)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_getCurrentHome
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[HMDAssistantGather manager](self, "manager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentHomeUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v2, "homes", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "uuid");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v3, "isEqual:", v10);

        if (v11)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (int64_t)homeCount
{
  void *v2;
  void *v3;
  int64_t v4;

  -[HMDAssistantGather manager](self, "manager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (NSString)primaryHomeName
{
  void *v2;
  void *v3;

  -[HMDAssistantGather _getPrimaryHome](self, "_getPrimaryHome");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)primaryHomeAssistantIdentifier
{
  void *v2;
  void *v3;

  -[HMDAssistantGather _getPrimaryHome](self, "_getPrimaryHome");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "urlString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)currentHomeName
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDAssistantGather _getCurrentHome](self, "_getCurrentHome");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSString *)v4;
}

- (NSString)currentHomeAssistantIdentifier
{
  void *v2;
  void *v3;

  -[HMDAssistantGather _getCurrentHome](self, "_getCurrentHome");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "urlString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)_gatherHomeKitObjects
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  char v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  void *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  char isKindOfClass;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  HMDAssistantGather *v61;
  NSObject *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t m;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  void *v84;
  uint64_t v85;
  void *v86;
  void *v87;
  HMDAssistantGather *v88;
  NSObject *v89;
  void *v90;
  void *v91;
  uint64_t v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t n;
  void *v102;
  void *v103;
  void *v104;
  uint64_t v105;
  void *v106;
  HMDAssistantGather *v107;
  NSObject *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t ii;
  void *v120;
  void *v121;
  HMDAssistantGather *v122;
  NSObject *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  id obj;
  uint64_t v130;
  uint64_t v131;
  void *v132;
  uint64_t v133;
  void *v134;
  id v135;
  HMDAssistantGather *v136;
  uint64_t v137;
  uint64_t v138;
  void *v139;
  uint64_t v140;
  uint64_t v141;
  void *v142;
  uint64_t v143;
  id v144;
  void *v145;
  uint64_t v146;
  void *v147;
  void *v148;
  uint64_t v149;
  void *v150;
  void *v151;
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
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  _BYTE v188[128];
  _BYTE v189[128];
  _BYTE v190[128];
  uint8_t v191[128];
  uint8_t buf[4];
  void *v193;
  __int16 v194;
  void *v195;
  __int16 v196;
  void *v197;
  __int16 v198;
  void *v199;
  _BYTE v200[128];
  _BYTE v201[128];
  _BYTE v202[128];
  _BYTE v203[128];
  _BYTE v204[128];
  uint64_t v205;

  v205 = *MEMORY[0x1E0C80C00];
  v128 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28628]), "initWithName:", CFSTR("com.apple.homed.gather-home-objects"));
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v184 = 0u;
  v185 = 0u;
  v186 = 0u;
  v187 = 0u;
  v136 = self;
  -[HMDAssistantGather manager](self, "manager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "homes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  obj = v6;
  v131 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v184, v204, 16);
  if (v131)
  {
    v130 = *(_QWORD *)v185;
    v137 = *MEMORY[0x1E0CB8238];
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v185 != v130)
          objc_enumerationMutation(obj);
        v133 = v7;
        v8 = *(void **)(*((_QWORD *)&v184 + 1) + 8 * v7);
        objc_msgSend(v8, "assistantObject");
        v9 = objc_claimAutoreleasedReturnValue();
        v134 = v8;
        v132 = (void *)v9;
        if (!v9)
        {
          v121 = (void *)MEMORY[0x1D17BA0A0]();
          v122 = v136;
          HMFGetOSLogHandle();
          v123 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v123, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v124 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v134, "name");
            v125 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v134, "uuid");
            v126 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v126, "UUIDString");
            v127 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v193 = v124;
            v194 = 2112;
            v195 = v125;
            v196 = 2112;
            v197 = v127;
            _os_log_impl(&dword_1CD062000, v123, OS_LOG_TYPE_DEFAULT, "%{public}@Cannot create an assistant object for home %@/%@; skipping all objects in home",
              buf,
              0x20u);

          }
          objc_autoreleasePoolPop(v121);
          goto LABEL_134;
        }
        objc_msgSend(v3, "addObject:", v9);
        v182 = 0u;
        v183 = 0u;
        v180 = 0u;
        v181 = 0u;
        objc_msgSend(v8, "accessories");
        v135 = (id)objc_claimAutoreleasedReturnValue();
        v140 = objc_msgSend(v135, "countByEnumeratingWithState:objects:count:", &v180, v203, 16);
        if (!v140)
          goto LABEL_66;
        v138 = *(_QWORD *)v181;
        do
        {
          for (i = 0; i != v140; ++i)
          {
            if (*(_QWORD *)v181 != v138)
              objc_enumerationMutation(v135);
            v11 = *(id *)(*((_QWORD *)&v180 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v12 = v11;
            else
              v12 = 0;
            v13 = v12;

            v148 = v13;
            if (v13)
            {
              objc_msgSend(v13, "mediaProfile");
              v14 = (void *)objc_claimAutoreleasedReturnValue();

              if (v14)
              {
                objc_msgSend(v13, "mediaProfile");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "assistantObject");
                v16 = (void *)objc_claimAutoreleasedReturnValue();

                if (v16)
                {
                  objc_msgSend(v3, "addObject:", v16);
                  v17 = 1;
                }
                else
                {
                  v17 = 0;
                }

              }
              else
              {
                v17 = 0;
              }
              v178 = 0u;
              v179 = 0u;
              v176 = 0u;
              v177 = 0u;
              objc_msgSend(v13, "services");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v176, v202, 16);
              if (v20)
              {
                v21 = v20;
                v22 = *(_QWORD *)v177;
                do
                {
                  for (j = 0; j != v21; ++j)
                  {
                    if (*(_QWORD *)v177 != v22)
                      objc_enumerationMutation(v19);
                    v24 = *(void **)(*((_QWORD *)&v176 + 1) + 8 * j);
                    if ((objc_msgSend(v24, "isHidden") & 1) == 0)
                    {
                      objc_msgSend(v24, "assistantObject");
                      v25 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v25)
                      {
                        objc_msgSend(v3, "addObject:", v25);
                        v17 = 1;
                      }

                    }
                  }
                  v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v176, v202, 16);
                }
                while (v21);
              }

              v18 = v17 & 1;
              v13 = v148;
            }
            else
            {
              v18 = 0;
            }
            v174 = 0u;
            v175 = 0u;
            v172 = 0u;
            v173 = 0u;
            objc_msgSend(v13, "cameraProfiles");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v172, v201, 16);
            if (v27)
            {
              v28 = v27;
              v29 = *(_QWORD *)v173;
              do
              {
                for (k = 0; k != v28; ++k)
                {
                  if (*(_QWORD *)v173 != v29)
                    objc_enumerationMutation(v26);
                  objc_msgSend(*(id *)(*((_QWORD *)&v172 + 1) + 8 * k), "assistantObject");
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v31)
                  {
                    objc_msgSend(v3, "addObject:", v31);
                    v18 = 1;
                  }

                }
                v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v172, v201, 16);
              }
              while (v28);
            }

            v32 = v11;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v33 = v32;
            else
              v33 = 0;
            v34 = v33;

            if (v34)
            {
              objc_msgSend(v34, "mediaProfile");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "assistantObject");
              v36 = (void *)objc_claimAutoreleasedReturnValue();

              if (v36)
              {
                objc_msgSend(v3, "addObject:", v36);
                v18 = 1;
              }

            }
            v37 = v32;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v38 = v37;
            else
              v38 = 0;
            v39 = v38;

            objc_msgSend(v39, "audioDestinationController");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "data");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "destinationIdentifier");
            v42 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v42)
              goto LABEL_58;
            v144 = v34;
            v43 = i;
            objc_msgSend(v39, "home");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "name");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "assistantObjectWithHome:name:", v44, v45);
            v46 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v46)
            {
              i = v43;
              v34 = v144;
LABEL_58:
              if ((v18 & 1) == 0)
                goto LABEL_64;
              goto LABEL_59;
            }
            objc_msgSend(v3, "addObject:", v46);

            i = v43;
            v34 = v144;
LABEL_59:
            objc_msgSend(v148, "hostAccessory");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            isKindOfClass = objc_opt_isKindOfClass();

            if ((isKindOfClass & 1) == 0 || !v47)
            {
              objc_msgSend(v37, "assistantObject");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              if (v49)
                objc_msgSend(v3, "addObject:", v49);

            }
LABEL_64:

          }
          v140 = objc_msgSend(v135, "countByEnumeratingWithState:objects:count:", &v180, v203, 16);
        }
        while (v140);
LABEL_66:

        v170 = 0u;
        v171 = 0u;
        v168 = 0u;
        v169 = 0u;
        objc_msgSend(v134, "serviceGroups");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = (void *)objc_msgSend(v50, "copy");

        v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v168, v200, 16);
        if (v52)
        {
          v53 = v52;
          v54 = *(_QWORD *)v169;
          v141 = *(_QWORD *)v169;
          v145 = v51;
          do
          {
            v55 = 0;
            v149 = v53;
            do
            {
              if (*(_QWORD *)v169 != v54)
                objc_enumerationMutation(v51);
              v56 = *(void **)(*((_QWORD *)&v168 + 1) + 8 * v55);
              objc_msgSend(v56, "serviceUUIDs");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              v58 = objc_msgSend(v57, "count");

              if (v58)
              {
                objc_msgSend(v56, "assistantObject");
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                if (v59)
                  objc_msgSend(v3, "addObject:", v59);

              }
              else
              {
                v60 = (void *)MEMORY[0x1D17BA0A0]();
                v61 = v136;
                HMFGetOSLogHandle();
                v62 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
                {
                  HMFGetLogIdentifier();
                  v63 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v56, "name");
                  v64 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v134, "name");
                  v65 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v134, "uuid");
                  v66 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v66, "UUIDString");
                  v67 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138544130;
                  v193 = v63;
                  v194 = 2112;
                  v195 = v64;
                  v196 = 2112;
                  v197 = v65;
                  v198 = 2112;
                  v199 = v67;
                  _os_log_impl(&dword_1CD062000, v62, OS_LOG_TYPE_INFO, "%{public}@Dropping empty service group %@ in home %@/%@ from sync data", buf, 0x2Au);

                  v51 = v145;
                  v54 = v141;

                  v53 = v149;
                }

                objc_autoreleasePoolPop(v60);
              }
              ++v55;
            }
            while (v53 != v55);
            v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v168, v200, 16);
          }
          while (v53);
        }

        v166 = 0u;
        v167 = 0u;
        v164 = 0u;
        v165 = 0u;
        objc_msgSend(v134, "rooms");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = (void *)objc_msgSend(v68, "copy");

        v70 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v164, v191, 16);
        if (v70)
        {
          v71 = v70;
          v72 = *(_QWORD *)v165;
          do
          {
            for (m = 0; m != v71; ++m)
            {
              if (*(_QWORD *)v165 != v72)
                objc_enumerationMutation(v69);
              objc_msgSend(*(id *)(*((_QWORD *)&v164 + 1) + 8 * m), "assistantObject");
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              if (v74)
                objc_msgSend(v3, "addObject:", v74);

            }
            v71 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v164, v191, 16);
          }
          while (v71);
        }

        objc_msgSend(v134, "roomForEntireHome");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "assistantObject");
        v76 = objc_claimAutoreleasedReturnValue();

        if (v76)
          objc_msgSend(v3, "addObject:", v76);
        v139 = (void *)v76;
        v162 = 0u;
        v163 = 0u;
        v160 = 0u;
        v161 = 0u;
        objc_msgSend(v134, "zones");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v78 = (void *)objc_msgSend(v77, "copy");

        v79 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v160, v190, 16);
        if (v79)
        {
          v80 = v79;
          v81 = *(_QWORD *)v161;
          v142 = v78;
          do
          {
            v82 = 0;
            v146 = v80;
            do
            {
              if (*(_QWORD *)v161 != v81)
                objc_enumerationMutation(v78);
              v83 = *(void **)(*((_QWORD *)&v160 + 1) + 8 * v82);
              objc_msgSend(v83, "roomUUIDs");
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              v85 = objc_msgSend(v84, "count");

              if (v85)
              {
                objc_msgSend(v83, "assistantObject");
                v86 = (void *)objc_claimAutoreleasedReturnValue();
                if (v86)
                  objc_msgSend(v3, "addObject:", v86);

              }
              else
              {
                v87 = (void *)MEMORY[0x1D17BA0A0]();
                v88 = v136;
                HMFGetOSLogHandle();
                v89 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
                {
                  HMFGetLogIdentifier();
                  v90 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v83, "name");
                  v91 = (void *)objc_claimAutoreleasedReturnValue();
                  v150 = v87;
                  v92 = v81;
                  objc_msgSend(v134, "name");
                  v93 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v134, "uuid");
                  v94 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v94, "UUIDString");
                  v95 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138544130;
                  v193 = v90;
                  v194 = 2112;
                  v195 = v91;
                  v196 = 2112;
                  v197 = v93;
                  v198 = 2112;
                  v199 = v95;
                  _os_log_impl(&dword_1CD062000, v89, OS_LOG_TYPE_INFO, "%{public}@Dropping empty zone %@ in home %@/%@ from sync data", buf, 0x2Au);

                  v81 = v92;
                  v87 = v150;

                  v78 = v142;
                  v80 = v146;
                }

                objc_autoreleasePoolPop(v87);
              }
              ++v82;
            }
            while (v80 != v82);
            v80 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v160, v190, 16);
          }
          while (v80);
        }

        v158 = 0u;
        v159 = 0u;
        v156 = 0u;
        v157 = 0u;
        objc_msgSend(v134, "actionSets");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        v97 = (void *)objc_msgSend(v96, "copy");

        v98 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v156, v189, 16);
        if (v98)
        {
          v99 = v98;
          v100 = *(_QWORD *)v157;
          v143 = *(_QWORD *)v157;
          v147 = v97;
          do
          {
            for (n = 0; n != v99; ++n)
            {
              if (*(_QWORD *)v157 != v100)
                objc_enumerationMutation(v97);
              v102 = *(void **)(*((_QWORD *)&v156 + 1) + 8 * n);
              objc_msgSend(v102, "type");
              v103 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v103, "isEqualToString:", v137) & 1) != 0)
              {
                objc_msgSend(v102, "actions");
                v104 = (void *)objc_claimAutoreleasedReturnValue();
                v105 = objc_msgSend(v104, "count");

                if (!v105)
                {
                  v106 = (void *)MEMORY[0x1D17BA0A0]();
                  v107 = v136;
                  HMFGetOSLogHandle();
                  v108 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v108, OS_LOG_TYPE_INFO))
                  {
                    HMFGetLogIdentifier();
                    v151 = v106;
                    v109 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v102, "name");
                    v110 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v134, "name");
                    v111 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v134, "uuid");
                    v112 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v112, "UUIDString");
                    v113 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138544130;
                    v193 = v109;
                    v194 = 2112;
                    v195 = v110;
                    v196 = 2112;
                    v197 = v111;
                    v198 = 2112;
                    v199 = v113;
                    _os_log_impl(&dword_1CD062000, v108, OS_LOG_TYPE_INFO, "%{public}@Dropping empty user-defined actionSet %@ in home %@/%@ from sync data", buf, 0x2Au);

                    v97 = v147;
                    v100 = v143;

                    v106 = v151;
                  }

                  objc_autoreleasePoolPop(v106);
                  continue;
                }
              }
              else
              {

              }
              objc_msgSend(v102, "assistantObject");
              v114 = (void *)objc_claimAutoreleasedReturnValue();
              if (v114)
                objc_msgSend(v3, "addObject:", v114);

            }
            v99 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v156, v189, 16);
          }
          while (v99);
        }

        v154 = 0u;
        v155 = 0u;
        v152 = 0u;
        v153 = 0u;
        objc_msgSend(v134, "mediaSystems");
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        v116 = objc_msgSend(v115, "countByEnumeratingWithState:objects:count:", &v152, v188, 16);
        if (v116)
        {
          v117 = v116;
          v118 = *(_QWORD *)v153;
          do
          {
            for (ii = 0; ii != v117; ++ii)
            {
              if (*(_QWORD *)v153 != v118)
                objc_enumerationMutation(v115);
              objc_msgSend(*(id *)(*((_QWORD *)&v152 + 1) + 8 * ii), "assistantObject");
              v120 = (void *)objc_claimAutoreleasedReturnValue();
              if (v120)
                objc_msgSend(v3, "addObject:", v120);

            }
            v117 = objc_msgSend(v115, "countByEnumeratingWithState:objects:count:", &v152, v188, 16);
          }
          while (v117);
        }

LABEL_134:
        v7 = v133 + 1;
      }
      while (v133 + 1 != v131);
      v131 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v184, v204, 16);
    }
    while (v131);
  }

  -[HMDAssistantGather setCurrentHomekitObjects:](v136, "setCurrentHomekitObjects:", v3);
}

- (void)gatherHomeKitObjectsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDAssistantGather workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__HMDAssistantGather_gatherHomeKitObjectsWithCompletion___block_invoke;
  v7[3] = &unk_1E89C1D68;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (NSArray)homeKitObjects
{
  void *v2;
  void *v3;

  -[HMDAssistantGather currentHomekitObjects](self, "currentHomekitObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (void)getSyncEntityObjectsWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDAssistantGather workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__HMDAssistantGather_getSyncEntityObjectsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E89C1D68;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (HMDHomeManager)manager
{
  return (HMDHomeManager *)objc_loadWeakRetained((id *)&self->_manager);
}

- (void)setManager:(id)a3
{
  objc_storeWeak((id *)&self->_manager, a3);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (NSArray)currentHomekitObjects
{
  return self->_currentHomekitObjects;
}

- (void)setCurrentHomekitObjects:(id)a3
{
  objc_storeStrong((id *)&self->_currentHomekitObjects, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentHomekitObjects, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_manager);
}

void __64__HMDAssistantGather_getSyncEntityObjectsWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "homeKitObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        entityFromObject(*(void **)(*((_QWORD *)&v12 + 1) + 8 * v8), 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v9)
        {
          objc_msgSend(v9, "dictionary", (_QWORD)v12);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v11);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __57__HMDAssistantGather_gatherHomeKitObjectsWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)MEMORY[0x1D17BA0A0]();
  objc_msgSend(*(id *)(a1 + 32), "_gatherHomeKitObjects");
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "currentHomekitObjects");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, objc_msgSend(v4, "count"));

  }
  objc_autoreleasePoolPop(v2);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_129185 != -1)
    dispatch_once(&logCategory__hmf_once_t0_129185, &__block_literal_global_129186);
  return (id)logCategory__hmf_once_v1_129187;
}

void __33__HMDAssistantGather_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_129187;
  logCategory__hmf_once_v1_129187 = v0;

}

@end
