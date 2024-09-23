@implementation HMDSettingsMetadataParser

- (HMDSettingsMetadataParser)initWithDependency:(id)a3
{
  id v4;
  HMDSettingsMetadataParser *v5;
  HMDSettingsMetadataParser *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HMDSettingsMetadataParser;
  v5 = -[HMDSettingsMetadataParser init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_dependency, v4);

  return v6;
}

- (id)modelsFromMetadata:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  HMDSettingsMetadataParser *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  __int128 v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  uint64_t v42;
  void *v43;
  void *v44;
  HMDSettingsMetadataParser *v45;
  NSObject *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  id v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  id v65;
  uint64_t v66;
  void *v67;
  HMDSettingConstraintModel *v68;
  void *v69;
  HMDSettingConstraintModel *v70;
  void *v71;
  char v72;
  HMDSettingConstraintModel *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  void *v82;
  int v83;
  int v84;
  void *v85;
  HMDSettingsMetadataParser *v86;
  NSObject *v87;
  void *v88;
  void *v89;
  HMDSettingsMetadataParser *v90;
  NSObject *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  HMDSettingsMetadataParser *v96;
  NSObject *v97;
  void *v98;
  HMDSettingsMetadataParser *v99;
  NSObject *v100;
  id v101;
  void *v102;
  void *v103;
  HMDSettingsMetadataParser *v104;
  NSObject *v105;
  void *v106;
  id v107;
  void *v108;
  void *v109;
  HMDSettingsMetadataParser *v110;
  void *v111;
  void *v112;
  HMDSettingsMetadataParser *v113;
  NSObject *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  HMDSettingsMetadataParser *v119;
  NSObject *v120;
  void *v121;
  void *v122;
  HMDSettingsMetadataParser *v123;
  NSObject *v124;
  void *v125;
  void *v126;
  void *v127;
  id v128;
  void *v129;
  void *v130;
  __int128 v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  id v137;
  void *v138;
  id v139;
  id v140;
  id v141;
  void *v142;
  void *v143;
  id v144;
  HMDSettingsMetadataParser *v145;
  void *v146;
  uint64_t v147;
  uint64_t v148;
  void *v149;
  void *v150;
  void *v151;
  uint64_t v152;
  void *v153;
  void *v154;
  uint64_t v155;
  id obj;
  void *v157;
  void *v158;
  id v159;
  id v160;
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
  _BYTE v173[128];
  _QWORD v174[2];
  _QWORD v175[2];
  _BYTE v176[128];
  _QWORD v177[2];
  _QWORD v178[2];
  uint8_t buf[4];
  void *v180;
  __int16 v181;
  void *v182;
  __int16 v183;
  id v184;
  __int16 v185;
  void *v186;
  uint64_t v187;

  v187 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v137 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v138 = v4;
  objc_msgSend(v4, "hmf_dictionaryForKey:", CFSTR("Info"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v136 = v5;
  if (v5)
  {
    objc_msgSend(v5, "hmf_numberForKey:", CFSTR("Version"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v135 = (void *)v6;
    if (v6)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v180 = v11;
        v181 = 2112;
        v182 = v135;
        _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Loading setting version %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v7);
      objc_msgSend(v138, "hmf_dictionaryForKey:", CFSTR("Data"));
      v12 = objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        v117 = 0;
        v118 = (void *)MEMORY[0x1D17BA0A0]();
        v119 = v8;
        HMFGetOSLogHandle();
        v120 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v180 = v121;
          _os_log_impl(&dword_1CD062000, v120, OS_LOG_TYPE_ERROR, "%{public}@Missing data section in metadata", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v118);
        v128 = 0;
        goto LABEL_104;
      }
      v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v140 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v139 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      -[HMDSettingsMetadataParser dependency](v8, "dependency");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "parentIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "createSettingRootGroupModelWithParentModelID:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "addObject:", v16);
      v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v177[0] = CFSTR("parentUUID");
      v133 = v16;
      objc_msgSend(v16, "hmbModelID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v177[1] = CFSTR("group");
      v178[0] = v18;
      v178[1] = v12;
      v134 = (void *)v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v178, v177, 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObject:", v19);

      *(_QWORD *)&v20 = 138543874;
      v132 = v20;
      v141 = v13;
      v145 = v8;
      v146 = v14;
      v157 = v17;
LABEL_7:
      if (objc_msgSend(v17, "count", v132))
      {
        objc_msgSend(v17, "objectAtIndex:", 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "hmf_UUIDForKey:", CFSTR("parentUUID"));
        v158 = (void *)objc_claimAutoreleasedReturnValue();
        v142 = v21;
        objc_msgSend(v21, "hmf_dictionaryForKey:", CFSTR("group"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "removeObjectAtIndex:", 0);
        v143 = v22;
        objc_msgSend(v22, "hmf_arrayForKey:", CFSTR("Groups"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v165 = 0u;
        v166 = 0u;
        v167 = 0u;
        v168 = 0u;
        obj = v23;
        v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v165, v176, 16);
        if (v24)
        {
          v25 = v24;
          v26 = *(_QWORD *)v166;
          do
          {
            for (i = 0; i != v25; ++i)
            {
              if (*(_QWORD *)v166 != v26)
                objc_enumerationMutation(obj);
              v28 = *(void **)(*((_QWORD *)&v165 + 1) + 8 * i);
              objc_msgSend(v28, "hmf_stringForKey:", CFSTR("Key"));
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v29)
              {
                v89 = (void *)MEMORY[0x1D17BA0A0]();
                v90 = v8;
                HMFGetOSLogHandle();
                v91 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
                {
                  HMFGetLogIdentifier();
                  v92 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v180 = v92;
                  v181 = 2112;
                  v182 = v28;
                  _os_log_impl(&dword_1CD062000, v91, OS_LOG_TYPE_ERROR, "%{public}@A group is missing a name attribute: %@", buf, 0x16u);

                }
                objc_autoreleasePoolPop(v89);
                v84 = 1;
                v34 = obj;
                v93 = obj;
                goto LABEL_87;
              }
              v30 = v29;
              objc_msgSend(v14, "createSettingGroupModelWithName:parent:", v30, v158);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "addObject:", v31);
              v174[0] = CFSTR("parentUUID");
              objc_msgSend(v31, "hmbModelID");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v174[1] = CFSTR("group");
              v175[0] = v32;
              v175[1] = v28;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v175, v174, 2);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v157, "addObject:", v33);

            }
            v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v165, v176, 16);
          }
          while (v25);
        }
        v34 = obj;

        objc_msgSend(v143, "hmf_arrayForKey:", CFSTR("Settings"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v161 = 0u;
        v162 = 0u;
        v163 = 0u;
        v164 = 0u;
        v144 = v35;
        v147 = objc_msgSend(v144, "countByEnumeratingWithState:objects:count:", &v161, v173, 16);
        if (!v147)
        {
          v84 = 0;
          goto LABEL_86;
        }
        v148 = *(_QWORD *)v162;
LABEL_18:
        v36 = 0;
        while (1)
        {
          if (*(_QWORD *)v162 != v148)
            objc_enumerationMutation(v144);
          v37 = *(void **)(*((_QWORD *)&v161 + 1) + 8 * v36);
          objc_msgSend(v37, "hmf_stringForKey:", CFSTR("Key"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          if (v38)
            break;
          v43 = v37;
          v44 = (void *)MEMORY[0x1D17BA0A0]();
          v45 = v8;
          HMFGetOSLogHandle();
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v47 = v36;
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v180 = v48;
            v181 = 2112;
            v182 = v43;
            _os_log_impl(&dword_1CD062000, v46, OS_LOG_TYPE_DEFAULT, "%{public}@A setting is missing a name: %@", buf, 0x16u);

            v36 = v47;
          }

          objc_autoreleasePoolPop(v44);
LABEL_67:
          if (++v36 == v147)
          {
            v84 = 0;
            v147 = objc_msgSend(v144, "countByEnumeratingWithState:objects:count:", &v161, v173, 16);
            if (!v147)
              goto LABEL_86;
            goto LABEL_18;
          }
        }
        v39 = v38;
        objc_msgSend(v37, "hmf_stringForKey:", CFSTR("Type"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v40)
        {
          v94 = v37;
          v95 = (void *)MEMORY[0x1D17BA0A0]();
          v96 = v8;
          HMFGetOSLogHandle();
          v97 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v98 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v180 = v98;
            v181 = 2112;
            v182 = v94;
            _os_log_impl(&dword_1CD062000, v97, OS_LOG_TYPE_ERROR, "%{public}@A setting is missing type attribute %@", buf, 0x16u);

          }
          v41 = 0;
LABEL_77:

LABEL_81:
          objc_autoreleasePoolPop(v95);
LABEL_85:

          v84 = 1;
          goto LABEL_86;
        }
        v152 = v36;
        v41 = v40;
        if ((objc_msgSend(v41, "isEqualToString:", CFSTR("data")) & 1) != 0)
        {
          v42 = 1;
        }
        else if ((objc_msgSend(v41, "isEqualToString:", CFSTR("number")) & 1) != 0)
        {
          v42 = 2;
        }
        else if ((objc_msgSend(v41, "isEqualToString:", CFSTR("string")) & 1) != 0)
        {
          v42 = 3;
        }
        else if ((objc_msgSend(v41, "isEqualToString:", CFSTR("selection")) & 1) != 0)
        {
          v42 = 4;
        }
        else
        {
          if ((objc_msgSend(v41, "isEqualToString:", CFSTR("collection")) & 1) == 0)
          {
            v109 = v37;

            v95 = (void *)MEMORY[0x1D17BA0A0]();
            v110 = v8;
            HMFGetOSLogHandle();
            v97 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v111 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v180 = v111;
              v181 = 2112;
              v182 = v109;
              _os_log_impl(&dword_1CD062000, v97, OS_LOG_TYPE_ERROR, "%{public}@Decoded setting with unrecognized type %@", buf, 0x16u);

            }
            goto LABEL_77;
          }
          v42 = 5;
        }
        v155 = v42;

        v154 = v37;
        objc_msgSend(v37, "hmf_arrayForKey:", CFSTR("Properties"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v49)
        {
          v95 = (void *)MEMORY[0x1D17BA0A0]();
          v99 = v8;
          HMFGetOSLogHandle();
          v100 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v101 = v41;
            v102 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v180 = v102;
            v181 = 2112;
            v182 = v154;
            v183 = 2112;
            v184 = v39;
            v185 = 2112;
            v186 = 0;
            _os_log_impl(&dword_1CD062000, v100, OS_LOG_TYPE_ERROR, "%{public}@A setting is missing a required attribute %@ name: %@, propertiesArray %@", buf, 0x2Au);

            v41 = v101;
          }

          goto LABEL_81;
        }
        v50 = v49;
        v151 = v41;
        v51 = objc_msgSend(v49, "containsObject:", CFSTR("r"));
        v150 = v50;
        if (objc_msgSend(v50, "containsObject:", CFSTR("w")))
          v51 |= 2uLL;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v155);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v51);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "createSettingModelWithName:parent:type:properties:", v39, v158, v52, v53);
        v54 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v54)
        {
          v103 = (void *)MEMORY[0x1D17BA0A0]();
          v104 = v8;
          HMFGetOSLogHandle();
          v105 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v106 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v155);
            v107 = v39;
            v108 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v132;
            v180 = v106;
            v181 = 2112;
            v182 = v107;
            v183 = 2112;
            v184 = v108;
            _os_log_impl(&dword_1CD062000, v105, OS_LOG_TYPE_ERROR, "%{public}@Unable to create setting model for setting %@ with type %@", buf, 0x20u);

            v39 = v107;
          }

          objc_autoreleasePoolPop(v103);
          v41 = v151;
          goto LABEL_85;
        }
        v149 = v39;
        objc_msgSend(v154, "hmf_arrayForKey:", CFSTR("Constraints"));
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v153 = v54;
        objc_msgSend(v54, "hmbModelID");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = v55;
        v58 = v56;
        v59 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v169 = 0u;
        v170 = 0u;
        v171 = 0u;
        v172 = 0u;
        v159 = v57;
        v60 = objc_msgSend(v159, "countByEnumeratingWithState:objects:count:", &v169, buf, 16);
        if (!v60)
          goto LABEL_61;
        v61 = v60;
        v62 = *(_QWORD *)v170;
        while (1)
        {
          v63 = 0;
          do
          {
            if (*(_QWORD *)v170 != v62)
              objc_enumerationMutation(v159);
            v64 = *(void **)(*((_QWORD *)&v169 + 1) + 8 * v63);
            objc_msgSend(v64, "hmf_stringForKey:", CFSTR("Type"));
            v65 = (id)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v65, "isEqualToString:", CFSTR("minimumValue")) & 1) != 0)
            {
              v66 = 1;
LABEL_51:

              objc_msgSend(v64, "objectForKey:", CFSTR("Value"));
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              v68 = [HMDSettingConstraintModel alloc];
              objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              v70 = -[HMBModel initWithModelID:parentModelID:](v68, "initWithModelID:parentModelID:", v69, v58);

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v66);
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              -[HMDSettingConstraintModel setType:](v70, "setType:", v71);

              -[HMDSettingConstraintModel setNumberValue:](v70, "setNumberValue:", v67);
LABEL_52:
              objc_msgSend(v59, "addObject:", v70);

              goto LABEL_53;
            }
            if ((objc_msgSend(v65, "isEqualToString:", CFSTR("maximumValue")) & 1) != 0)
            {
              v66 = 2;
              goto LABEL_51;
            }
            if ((objc_msgSend(v65, "isEqualToString:", CFSTR("stepValue")) & 1) != 0)
            {
              v66 = 3;
              goto LABEL_51;
            }
            v72 = objc_msgSend(v65, "isEqualToString:", CFSTR("validValue"));

            objc_msgSend(v64, "objectForKey:", CFSTR("Value"));
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            if ((v72 & 1) != 0)
            {
              v73 = [HMDSettingConstraintModel alloc];
              objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              v70 = -[HMBModel initWithModelID:parentModelID:](v73, "initWithModelID:parentModelID:", v74, v58);

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 4);
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              -[HMDSettingConstraintModel setType:](v70, "setType:", v75);

              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                -[HMDSettingConstraintModel setDataValue:](v70, "setDataValue:", v67);
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  -[HMDSettingConstraintModel setStringValue:](v70, "setStringValue:", v67);
              }
              goto LABEL_52;
            }
LABEL_53:

            ++v63;
          }
          while (v61 != v63);
          v76 = objc_msgSend(v159, "countByEnumeratingWithState:objects:count:", &v169, buf, 16);
          v61 = v76;
          if (!v76)
          {
LABEL_61:

            v77 = (void *)objc_msgSend(v59, "copy");
            objc_msgSend(v154, "objectForKey:", CFSTR("Value"));
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v155);
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            v160 = 0;
            v14 = v146;
            objc_msgSend(v146, "settingValueForValue:type:constraintModels:error:", v78, v79, v77, &v160);
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            v81 = v160;

            v82 = v153;
            v83 = objc_msgSend(v153, "setSettingValue:", v80);
            if ((v83 & 1) != 0)
            {
              objc_msgSend(v140, "addObject:", v153);
              objc_msgSend(v139, "addObjectsFromArray:", v77);
              v84 = 0;
              v13 = v141;
              v8 = v145;
            }
            else
            {
              v85 = (void *)MEMORY[0x1D17BA0A0]();
              v86 = v145;
              HMFGetOSLogHandle();
              v87 = objc_claimAutoreleasedReturnValue();
              v13 = v141;
              if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v88 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138544130;
                v180 = v88;
                v181 = 2112;
                v182 = v78;
                v183 = 2112;
                v184 = v80;
                v185 = 2112;
                v186 = v153;
                _os_log_impl(&dword_1CD062000, v87, OS_LOG_TYPE_ERROR, "%{public}@Unable to set value %@(%@) on model %@", buf, 0x2Au);

              }
              objc_autoreleasePoolPop(v85);
              v84 = 1;
              v8 = v145;
              v14 = v146;
              v82 = v153;
            }

            v34 = obj;
            v36 = v152;
            if (v83)
              goto LABEL_67;
LABEL_86:

            v93 = v144;
LABEL_87:
            v17 = v157;

            if (v84)
            {
              v128 = 0;
              v130 = v139;
              v129 = v140;
              goto LABEL_103;
            }
            goto LABEL_7;
          }
        }
      }
      v122 = (void *)MEMORY[0x1D17BA0A0]();
      v123 = v8;
      HMFGetOSLogHandle();
      v124 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v124, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v13, "count"));
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v140, "count"));
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = v132;
        v180 = v125;
        v181 = 2112;
        v182 = v126;
        v183 = 2112;
        v184 = v127;
        _os_log_impl(&dword_1CD062000, v124, OS_LOG_TYPE_INFO, "%{public}@Parsed %@ groups and %@ settings", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v122);
      objc_msgSend(v137, "addObjectsFromArray:", v13);
      v129 = v140;
      objc_msgSend(v137, "addObjectsFromArray:", v140);
      v130 = v139;
      objc_msgSend(v137, "addObjectsFromArray:", v139);
      v128 = v137;
LABEL_103:

      v117 = v134;
LABEL_104:

    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v180 = v116;
        _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Missing version number in metadata", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v7);
      v128 = 0;
    }

  }
  else
  {
    v112 = (void *)MEMORY[0x1D17BA0A0]();
    v113 = self;
    HMFGetOSLogHandle();
    v114 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v180 = v115;
      _os_log_impl(&dword_1CD062000, v114, OS_LOG_TYPE_ERROR, "%{public}@Missing info section in metadata", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v112);
    v128 = 0;
  }

  return v128;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDSettingsMetadataParser dependency](self, "dependency");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "parentIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (HMDSettingsControllerDependency)dependency
{
  return (HMDSettingsControllerDependency *)objc_loadWeakRetained((id *)&self->_dependency);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dependency);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t14_56438 != -1)
    dispatch_once(&logCategory__hmf_once_t14_56438, &__block_literal_global_56439);
  return (id)logCategory__hmf_once_v15_56440;
}

void __40__HMDSettingsMetadataParser_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v15_56440;
  logCategory__hmf_once_v15_56440 = v0;

}

@end
