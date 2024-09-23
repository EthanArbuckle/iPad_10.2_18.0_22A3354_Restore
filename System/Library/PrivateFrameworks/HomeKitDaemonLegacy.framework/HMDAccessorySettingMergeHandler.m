@implementation HMDAccessorySettingMergeHandler

+ (BOOL)mergeFirst:(id)a3 second:(id)a4 mergeStrategy:(id)a5 shouldAddMissing:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  unint64_t v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  const char *v24;
  NSObject *v25;
  os_log_type_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  BOOL v31;
  void *v32;
  id v33;
  NSObject *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v41;
  id v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  id v50;
  id v51;
  void *v52;
  id v53;
  void *v54;
  id v55;
  NSObject *v56;
  void *v57;
  void *v58;
  id v59;
  NSObject *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  char v65;
  void *v66;
  id v67;
  NSObject *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  char v75;
  void *v76;
  void *v77;
  id v78;
  NSObject *v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t i;
  void *v86;
  void *v87;
  char v88;
  void *v89;
  id v90;
  NSObject *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  unint64_t v97;
  void *v98;
  unint64_t v99;
  void *v100;
  id v101;
  NSObject *v102;
  void *v103;
  void *v104;
  uint64_t v105;
  void *v106;
  id v107;
  NSObject *v108;
  void *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  void *v115;
  char v116;
  void *v117;
  id v118;
  NSObject *v119;
  void *v120;
  void *v121;
  id v122;
  NSObject *v123;
  void *v124;
  void *v125;
  id v126;
  NSObject *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  id v135;
  NSObject *v136;
  void *v137;
  void *v138;
  void *v139;
  char v140;
  void *v141;
  id v142;
  NSObject *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  char v150;
  void *v151;
  void *v152;
  id v153;
  NSObject *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  id v160;
  NSObject *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  id v173;
  id v174;
  id v175;
  id v176;
  id obj;
  id obja;
  id objb;
  id v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  uint8_t buf[4];
  id v196;
  __int16 v197;
  id v198;
  __int16 v199;
  id v200;
  __int16 v201;
  void *v202;
  __int16 v203;
  void *v204;
  _BYTE v205[128];
  _BYTE v206[128];
  uint64_t v207;

  v6 = a6;
  v207 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v10, "value");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "value");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v10, "type");
  if (v15 != objc_msgSend(v11, "type"))
  {
    v20 = (void *)MEMORY[0x1D17BA0A0]();
    v21 = v10;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v186 = v13;
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "type");
      HMAccessorySettingTypeToString();
      v180 = v12;
      v28 = v14;
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "type");
      HMAccessorySettingTypeToString();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v196 = v27;
      v197 = 2112;
      v198 = v29;
      v199 = 2112;
      v200 = v30;
      _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_INFO, "%{public}@Value types are not matching: self %@, second %@", buf, 0x20u);

      v14 = v28;
      v12 = v180;

      v13 = v186;
    }
    goto LABEL_10;
  }
  v185 = v13;
  objc_msgSend(v10, "name");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "name");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "isEqualToString:", v17);

  if ((v18 & 1) != 0)
  {
    v19 = objc_msgSend(v10, "type");
    if (!v12 && v19 <= 3)
    {
      v20 = (void *)MEMORY[0x1D17BA0A0]();
      v21 = v10;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      v13 = v185;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v196 = v23;
        v24 = "%{public}@No merge strategy, cannot merge";
        v25 = v22;
        v26 = OS_LOG_TYPE_INFO;
LABEL_7:
        _os_log_impl(&dword_1CD062000, v25, v26, v24, buf, 0xCu);

      }
LABEL_10:

      objc_autoreleasePoolPop(v20);
LABEL_11:
      v31 = 0;
      goto LABEL_15;
    }
    v13 = v185;
    switch(objc_msgSend(v10, "type"))
    {
      case 0:
        v20 = (void *)MEMORY[0x1D17BA0A0]();
        v21 = v10;
        HMFGetOSLogHandle();
        v22 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          goto LABEL_10;
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v196 = v23;
        v24 = "%{public}@Setting type is unknown, cannot merge";
        v25 = v22;
        v26 = OS_LOG_TYPE_ERROR;
        goto LABEL_7;
      case 1:
      case 3:
        v41 = (void *)MEMORY[0x1D17BA0A0]();
        v42 = v10;
        HMFGetOSLogHandle();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "type");
          HMAccessorySettingTypeToString();
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v196 = v44;
          v197 = 2112;
          v198 = v45;
          _os_log_impl(&dword_1CD062000, v43, OS_LOG_TYPE_INFO, "%{public}@Setting type is %@, keeping the values", buf, 0x16u);

          v13 = v185;
        }

        objc_autoreleasePoolPop(v41);
        goto LABEL_64;
      case 2:
        +[HMDAccessorySettingMergeHandler _mergeRangeConstraintsFirst:second:shouldAddMissing:](HMDAccessorySettingMergeHandler, "_mergeRangeConstraintsFirst:second:shouldAddMissing:", v10, v11, v6);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        if (v46)
        {
          v47 = v185;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v48 = v47;
          else
            v48 = 0;
          v49 = v48;

          v170 = v14;
          v50 = v49;
          v51 = v14;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v52 = v51;
          else
            v52 = 0;
          v53 = v52;

          v54 = (void *)MEMORY[0x1D17BA0A0]();
          v55 = v10;
          HMFGetOSLogHandle();
          v56 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v196 = v57;
            v197 = 2112;
            v198 = v50;
            v199 = 2112;
            v200 = v53;
            _os_log_impl(&dword_1CD062000, v56, OS_LOG_TYPE_INFO, "%{public}@Comparing the values: self %@, second %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v54);
          obj = v53;
          v181 = v50;
          if ((HMFEqualObjects() & 1) == 0)
          {
            v58 = (void *)MEMORY[0x1D17BA0A0]();
            v59 = v55;
            HMFGetOSLogHandle();
            v60 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v196 = v61;
              _os_log_impl(&dword_1CD062000, v60, OS_LOG_TYPE_INFO, "%{public}@Values are not matching, going to compute the value", buf, 0xCu);

            }
            objc_autoreleasePoolPop(v58);
            +[HMDAccessorySettingMergeHandler _mergeFirst:second:mergedConstraints:mergeStrategy:](HMDAccessorySettingMergeHandler, "_mergeFirst:second:mergedConstraints:mergeStrategy:", v59, v11, v46, v12);
            v62 = objc_claimAutoreleasedReturnValue();
            if (!v62)
            {
              v159 = (void *)MEMORY[0x1D17BA0A0]();
              v160 = v59;
              HMFGetOSLogHandle();
              v161 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v161, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v162 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v196 = v162;
                _os_log_impl(&dword_1CD062000, v161, OS_LOG_TYPE_ERROR, "%{public}@Cannot come up with the merged value", buf, 0xCu);

              }
              objc_autoreleasePoolPop(v159);
              v31 = 0;
              v14 = v170;
              v13 = v185;
              goto LABEL_103;
            }
            v63 = (void *)v62;
            objc_msgSend(v59, "value");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            v65 = HMFEqualObjects();

            if ((v65 & 1) == 0)
            {
              v66 = (void *)MEMORY[0x1D17BA0A0]();
              v67 = v59;
              HMFGetOSLogHandle();
              v68 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v69 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v67, "value");
                v173 = v66;
                v70 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v196 = v69;
                v197 = 2112;
                v198 = v70;
                v199 = 2112;
                v200 = v63;
                _os_log_impl(&dword_1CD062000, v68, OS_LOG_TYPE_INFO, "%{public}@Updating the value from %@ to %@", buf, 0x20u);

                v66 = v173;
              }

              objc_autoreleasePoolPop(v66);
              objc_msgSend(v67, "setValue:", v63);
            }

          }
          objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          v72 = (void *)MEMORY[0x1E0C99E60];
          objc_msgSend(v55, "constraints");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "setWithArray:", v73);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          v75 = objc_msgSend(v71, "isEqualToSet:", v74);

          if ((v75 & 1) != 0)
          {
            v31 = 1;
            v13 = v185;
            v14 = v170;
          }
          else
          {
            v125 = (void *)MEMORY[0x1D17BA0A0]();
            v126 = v55;
            HMFGetOSLogHandle();
            v127 = objc_claimAutoreleasedReturnValue();
            v13 = v185;
            if (os_log_type_enabled(v127, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v163 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v46);
              v128 = (void *)objc_claimAutoreleasedReturnValue();
              v169 = v125;
              v129 = (void *)MEMORY[0x1E0C99E60];
              objc_msgSend(v126, "constraints");
              v165 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v129, "setWithArray:", v165);
              v130 = (void *)objc_claimAutoreleasedReturnValue();
              v131 = (void *)MEMORY[0x1E0C99E60];
              objc_msgSend(v11, "constraints");
              v132 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v131, "setWithArray:", v132);
              v133 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544130;
              v196 = v163;
              v197 = 2112;
              v198 = v128;
              v199 = 2112;
              v200 = v130;
              v201 = 2112;
              v202 = v133;
              _os_log_impl(&dword_1CD062000, v127, OS_LOG_TYPE_INFO, "%{public}@Numerical Constraints are not matching (merged: %@) (first: %@), (second: %@) updating the constraints", buf, 0x2Au);

              v13 = v185;
              v125 = v169;

            }
            objc_autoreleasePoolPop(v125);
            objc_msgSend(v126, "setConstraints:", v46);
            v31 = 1;
            v14 = v170;
          }
LABEL_103:

          goto LABEL_104;
        }
        v117 = (void *)MEMORY[0x1D17BA0A0]();
        v118 = v10;
        HMFGetOSLogHandle();
        v119 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v196 = v120;
          _os_log_impl(&dword_1CD062000, v119, OS_LOG_TYPE_ERROR, "%{public}@Merged constraints is invalid, cannot merge this setting", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v117);
        v31 = 0;
        v13 = v185;
LABEL_104:

        break;
      case 4:
        +[HMDAccessorySettingMergeHandler _mergeValidValueConstraintsFirst:second:shouldAddMissing:](HMDAccessorySettingMergeHandler, "_mergeValidValueConstraintsFirst:second:shouldAddMissing:", v10, v11, v6);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = (void *)MEMORY[0x1D17BA0A0]();
        v78 = v10;
        HMFGetOSLogHandle();
        v79 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v196 = v80;
          v197 = 2112;
          v198 = v76;
          _os_log_impl(&dword_1CD062000, v79, OS_LOG_TYPE_INFO, "%{public}@Setting type is selection, merged constraints: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v77);
        v81 = objc_msgSend(v76, "count");
        v31 = v81 != 0;
        v168 = v76;
        if (v81)
        {
          v182 = v78;
          v171 = v14;
          v193 = 0u;
          v194 = 0u;
          v191 = 0u;
          v192 = 0u;
          obja = v76;
          v82 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v191, v206, 16);
          if (!v82)
            goto LABEL_53;
          v83 = v82;
          v84 = *(_QWORD *)v192;
          while (1)
          {
            for (i = 0; i != v83; ++i)
            {
              if (*(_QWORD *)v192 != v84)
                objc_enumerationMutation(obja);
              objc_msgSend(*(id *)(*((_QWORD *)&v191 + 1) + 8 * i), "value");
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v182, "value");
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              v88 = HMFEqualObjects();

              if ((v88 & 1) != 0)
              {
                objc_msgSend(v182, "value");
                v105 = objc_claimAutoreleasedReturnValue();

                if (!v105)
                  goto LABEL_66;
                goto LABEL_90;
              }
            }
            v83 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v191, v206, 16);
            if (!v83)
            {
LABEL_53:

LABEL_66:
              v106 = (void *)MEMORY[0x1D17BA0A0]();
              v107 = v182;
              HMFGetOSLogHandle();
              v108 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v108, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v109 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v196 = v109;
                _os_log_impl(&dword_1CD062000, v108, OS_LOG_TYPE_INFO, "%{public}@Did not find first's selection in merged list", buf, 0xCu);

              }
              v164 = v107;

              objc_autoreleasePoolPop(v106);
              v189 = 0u;
              v190 = 0u;
              v187 = 0u;
              v188 = 0u;
              v175 = obja;
              v110 = objc_msgSend(v175, "countByEnumeratingWithState:objects:count:", &v187, v205, 16);
              if (!v110)
              {
LABEL_76:

                goto LABEL_87;
              }
              v111 = v110;
              v112 = *(_QWORD *)v188;
LABEL_70:
              v113 = 0;
              while (1)
              {
                if (*(_QWORD *)v188 != v112)
                  objc_enumerationMutation(v175);
                objc_msgSend(*(id *)(*((_QWORD *)&v187 + 1) + 8 * v113), "value");
                v114 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v11, "value");
                v115 = (void *)objc_claimAutoreleasedReturnValue();
                v116 = HMFEqualObjects();

                if ((v116 & 1) != 0)
                  break;
                if (v111 == ++v113)
                {
                  v111 = objc_msgSend(v175, "countByEnumeratingWithState:objects:count:", &v187, v205, 16);
                  if (!v111)
                    goto LABEL_76;
                  goto LABEL_70;
                }
              }
              objc_msgSend(v11, "value");
              v105 = objc_claimAutoreleasedReturnValue();

              if (!v105)
              {
LABEL_87:
                v134 = (void *)MEMORY[0x1D17BA0A0]();
                v135 = v164;
                HMFGetOSLogHandle();
                v136 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v136, OS_LOG_TYPE_INFO))
                {
                  HMFGetLogIdentifier();
                  v137 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543362;
                  v196 = v137;
                  _os_log_impl(&dword_1CD062000, v136, OS_LOG_TYPE_INFO, "%{public}@Did not find second's selection in merged list, updating the selected value to nil", buf, 0xCu);

                }
                objc_autoreleasePoolPop(v134);
                v105 = 0;
              }
LABEL_90:
              v138 = v182;
              objc_msgSend(v182, "value");
              v139 = (void *)objc_claimAutoreleasedReturnValue();
              v140 = HMFEqualObjects();

              v176 = (id)v105;
              if ((v140 & 1) == 0)
              {
                v141 = (void *)MEMORY[0x1D17BA0A0]();
                v142 = v182;
                HMFGetOSLogHandle();
                v143 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v143, OS_LOG_TYPE_INFO))
                {
                  HMFGetLogIdentifier();
                  v166 = v141;
                  v144 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v142, "value");
                  v145 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543874;
                  v196 = v144;
                  v197 = 2112;
                  v198 = v145;
                  v199 = 2112;
                  v200 = v176;
                  _os_log_impl(&dword_1CD062000, v143, OS_LOG_TYPE_INFO, "%{public}@Updating the value from %@ to %@", buf, 0x20u);

                  v105 = (uint64_t)v176;
                  v141 = v166;
                }

                objc_autoreleasePoolPop(v141);
                objc_msgSend(v142, "setValue:", v105);
                v138 = v182;
              }
              objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", obja);
              v146 = (void *)objc_claimAutoreleasedReturnValue();
              v147 = (void *)MEMORY[0x1E0C99E60];
              objc_msgSend(v138, "constraints");
              v148 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v147, "setWithArray:", v148);
              v149 = (void *)objc_claimAutoreleasedReturnValue();
              v150 = objc_msgSend(v146, "isEqualToSet:", v149);

              v151 = v176;
              if ((v150 & 1) == 0)
              {
                v152 = (void *)MEMORY[0x1D17BA0A0]();
                v153 = v138;
                HMFGetOSLogHandle();
                v154 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v154, OS_LOG_TYPE_INFO))
                {
                  HMFGetLogIdentifier();
                  v155 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", obja);
                  v184 = v152;
                  v156 = (void *)objc_claimAutoreleasedReturnValue();
                  v157 = (void *)MEMORY[0x1E0C99E60];
                  objc_msgSend(v153, "constraints");
                  v167 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v157, "setWithArray:", v167);
                  v158 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543874;
                  v196 = v155;
                  v197 = 2112;
                  v198 = v156;
                  v199 = 2112;
                  v200 = v158;
                  _os_log_impl(&dword_1CD062000, v154, OS_LOG_TYPE_INFO, "%{public}@Selection Constraints are not matching (merged: %@) (first: %@), updating the constraints", buf, 0x20u);

                  v151 = v176;
                  v152 = v184;

                }
                objc_autoreleasePoolPop(v152);
                objc_msgSend(v153, "setConstraints:", obja);
              }

              v14 = v171;
              goto LABEL_99;
            }
          }
        }
        v121 = (void *)MEMORY[0x1D17BA0A0]();
        v122 = v78;
        HMFGetOSLogHandle();
        v123 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v123, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v124 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v196 = v124;
          _os_log_impl(&dword_1CD062000, v123, OS_LOG_TYPE_ERROR, "%{public}@There are no elements in the intersection of selection list", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v121);
LABEL_99:
        v13 = v185;

        break;
      case 5:
        if (objc_msgSend(v10, "isConstraintMergeStrategyReflection")
          && objc_msgSend(v11, "isConstraintMergeStrategyReflection"))
        {
          v89 = (void *)MEMORY[0x1D17BA0A0]();
          v90 = a1;
          HMFGetOSLogHandle();
          v91 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v91, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            objb = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "name");
            v172 = v14;
            v174 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "constraints");
            v183 = v89;
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "name");
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "constraints");
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544386;
            v196 = objb;
            v197 = 2112;
            v198 = v174;
            v199 = 2112;
            v200 = v92;
            v201 = 2112;
            v202 = v93;
            v203 = 2112;
            v204 = v94;
            _os_log_impl(&dword_1CD062000, v91, OS_LOG_TYPE_DEBUG, "%{public}@merge constraints first: %@, %@, second: %@, %@", buf, 0x34u);

            v13 = v185;
            v89 = v183;

            v14 = v172;
          }

          objc_autoreleasePoolPop(v89);
          objc_msgSend(v11, "constraints");
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "mergeConstraintsFromOther:", v95);
        }
        else
        {
          objc_msgSend(v10, "constraints");
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          v97 = objc_msgSend(v96, "count");
          objc_msgSend(v11, "constraints");
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          v99 = objc_msgSend(v98, "count");

          if (v97 >= v99)
            goto LABEL_64;
          v100 = (void *)MEMORY[0x1D17BA0A0]();
          v101 = v10;
          HMFGetOSLogHandle();
          v102 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v102, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v103 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "constraints");
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v196 = v103;
            v197 = 2112;
            v198 = v104;
            _os_log_impl(&dword_1CD062000, v102, OS_LOG_TYPE_INFO, "%{public}@Updating constraints to %@", buf, 0x16u);

            v13 = v185;
          }

          objc_autoreleasePoolPop(v100);
          objc_msgSend(v11, "constraints");
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v101, "setConstraints:", v95);
        }

LABEL_64:
        v31 = 1;
        break;
      default:
        goto LABEL_11;
    }
  }
  else
  {
    v32 = (void *)MEMORY[0x1D17BA0A0]();
    v33 = v10;
    HMFGetOSLogHandle();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "name");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "name");
      v37 = v12;
      v38 = v14;
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v196 = v35;
      v197 = 2112;
      v198 = v36;
      v199 = 2112;
      v200 = v39;
      _os_log_impl(&dword_1CD062000, v34, OS_LOG_TYPE_INFO, "%{public}@Setting names are not matching: self %@, second %@", buf, 0x20u);

      v14 = v38;
      v12 = v37;

    }
    objc_autoreleasePoolPop(v32);
    v31 = 0;
    v13 = v185;
  }
LABEL_15:

  return v31;
}

+ (id)_mergeFirst:(id)a3 second:(id)a4 mergedConstraints:(id)a5 mergeStrategy:(id)a6
{
  id v10;
  id v11;
  __CFString *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  char v19;
  __CFString *v20;
  void *v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  unint64_t v31;
  __CFString *v32;
  void *v33;
  id v34;
  NSObject *v35;
  __CFString *v36;
  void *v37;
  __CFString *v38;
  __CFString *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  id v43;
  NSObject *v44;
  NSObject *v45;
  void *v46;
  __CFString *v47;
  int v48;
  int v49;
  void *v50;
  id v51;
  NSObject *v52;
  _BOOL4 v53;
  void *v54;
  __CFString *v55;
  uint64_t v56;
  void *v57;
  id v58;
  NSObject *v59;
  _BOOL4 v60;
  void *v61;
  int v62;
  int v63;
  void *v64;
  _BOOL4 v65;
  void *v66;
  uint64_t v67;
  void *v68;
  id v69;
  NSObject *v70;
  _BOOL4 v71;
  void *v72;
  void *v73;
  void *v74;
  __CFString *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  __CFString *v81;
  void *v82;
  void *v83;
  __CFString *v85;
  __CFString *v86;
  __CFString *v87;
  __CFString *v88;
  __CFString *v89;
  __CFString *v90;
  id v91;
  __CFString *v92;
  id v93;
  id v94;
  id v95;
  uint8_t buf[4];
  void *v97;
  __int16 v98;
  __CFString *v99;
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = (__CFString *)a5;
  v13 = a6;
  objc_msgSend(v10, "value");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v15 = v14;
  else
    v15 = 0;
  v90 = v15;

  objc_msgSend(v11, "value");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v17 = v16;
  else
    v17 = 0;
  v18 = v17;

  v94 = 0;
  v95 = 0;
  v93 = 0;
  v19 = objc_msgSend(a1, "_extractMinMaxStep:minConstraint:maxConstraint:stepConstraint:first:", v12, &v95, &v94, &v93, v10);
  v20 = (__CFString *)v95;
  v92 = (__CFString *)v94;
  v91 = v93;
  if ((v19 & 1) != 0)
  {
    v21 = (void *)MEMORY[0x1D17BA0A0]();
    v22 = v10;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v23;
    v89 = v20;
    if (!v20 || !v92 || !v91)
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v39 = v18;
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v97 = v40;
        _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_ERROR, "%{public}@Min, max or step is nil", buf, 0xCu);

        v18 = v39;
      }

      objc_autoreleasePoolPop(v21);
LABEL_20:
      v38 = 0;
LABEL_80:
      v20 = v89;
      goto LABEL_81;
    }
    v25 = v13;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v85 = v18;
      v26 = v11;
      HMFGetLogIdentifier();
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = v25;
      v29 = (void *)v27;
      v30 = v28;
      v31 = objc_msgSend(v28, "strategy");
      if (v31 >= 5)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown HMDAccessorySettingMergeStrategyType %tu"), v31);
        v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v32 = off_1E89A9698[v31];
      }
      *(_DWORD *)buf = 138543618;
      v97 = v29;
      v98 = 2112;
      v99 = v32;
      _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_INFO, "%{public}@Merge strategy is %@", buf, 0x16u);

      v25 = v30;
      v11 = v26;
      v18 = v85;
    }

    objc_autoreleasePoolPop(v21);
    v41 = objc_msgSend(v25, "strategy");
    if (v41 == 4)
    {
      v62 = objc_msgSend(a1, "_isNumber:betweenStart:andEnd:first:", v90, v89, v92, v22);
      v63 = objc_msgSend(a1, "_isNumber:betweenStart:andEnd:first:", v18, v89, v92, v22);
      v64 = (void *)MEMORY[0x1D17BA0A0]();
      v51 = v22;
      HMFGetOSLogHandle();
      v52 = objc_claimAutoreleasedReturnValue();
      v65 = os_log_type_enabled(v52, OS_LOG_TYPE_INFO);
      if (v62 && v63)
      {
        if (v65)
        {
          HMFGetLogIdentifier();
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v97 = v66;
          _os_log_impl(&dword_1CD062000, v52, OS_LOG_TYPE_INFO, "%{public}@Current values are within the merged range", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v64);
        v87 = v18;
        v67 = -[__CFString compare:](v90, "compare:", v18);
        v68 = (void *)MEMORY[0x1D17BA0A0]();
        v69 = v51;
        HMFGetOSLogHandle();
        v70 = objc_claimAutoreleasedReturnValue();
        v71 = os_log_type_enabled(v70, OS_LOG_TYPE_INFO);
        v13 = v25;
        if (v67 != -1)
        {
          if (v71)
          {
            HMFGetLogIdentifier();
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v97 = v72;
            v98 = 2112;
            v99 = v90;
            _os_log_impl(&dword_1CD062000, v70, OS_LOG_TYPE_INFO, "%{public}@Retaining current value %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v68);
          v38 = v90;
          v18 = v87;
          goto LABEL_80;
        }
        if (v71)
        {
          HMFGetLogIdentifier();
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v97 = v80;
          v98 = 2112;
          v99 = v87;
          _os_log_impl(&dword_1CD062000, v70, OS_LOG_TYPE_INFO, "%{public}@Choosing second setting's value %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v68);
        v18 = v87;
        goto LABEL_71;
      }
      if (v62)
      {
        v73 = v64;
        v13 = v25;
        if (v65)
        {
LABEL_52:
          HMFGetLogIdentifier();
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v97 = v74;
          v98 = 2112;
          v99 = v90;
          _os_log_impl(&dword_1CD062000, v52, OS_LOG_TYPE_INFO, "%{public}@Only current value %@ is within the merged range", buf, 0x16u);

        }
LABEL_53:

        objc_autoreleasePoolPop(v73);
        v75 = v90;
LABEL_78:
        v81 = v75;
        goto LABEL_79;
      }
      v77 = v64;
      v13 = v25;
      if (!v63)
      {
        if (v65)
        {
          HMFGetLogIdentifier();
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v97 = v83;
          v98 = 2112;
          v99 = v92;
          _os_log_impl(&dword_1CD062000, v52, OS_LOG_TYPE_INFO, "%{public}@Neither of the values are within the merged range, choosing the max %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v77);
        v75 = v92;
        goto LABEL_78;
      }
      if (v65)
        goto LABEL_63;
      goto LABEL_64;
    }
    if (v41 != 3)
    {
      if (v41 == 1)
      {
        objc_msgSend(v25, "conflictValue");
        v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v42 = (void *)MEMORY[0x1D17BA0A0]();
        v43 = v22;
        HMFGetOSLogHandle();
        v44 = objc_claimAutoreleasedReturnValue();
        v45 = v44;
        if (v38)
        {
          if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v86 = v18;
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v97 = v46;
            v98 = 2112;
            v99 = v38;
            _os_log_impl(&dword_1CD062000, v45, OS_LOG_TYPE_INFO, "%{public}@Using the conflict value %@ as a merged value", buf, 0x16u);

            v18 = v86;
          }
          v13 = v25;

          objc_autoreleasePoolPop(v42);
          v47 = v38;
        }
        else
        {
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v88 = v18;
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v97 = v76;
            _os_log_impl(&dword_1CD062000, v45, OS_LOG_TYPE_ERROR, "%{public}@Cannot find the conflict value", buf, 0xCu);

            v18 = v88;
          }
          v13 = v25;

          objc_autoreleasePoolPop(v42);
        }

        goto LABEL_80;
      }
      v13 = v25;
      goto LABEL_20;
    }
    v48 = objc_msgSend(a1, "_isNumber:betweenStart:andEnd:first:", v90, v89, v92, v22);
    v49 = objc_msgSend(a1, "_isNumber:betweenStart:andEnd:first:", v18, v89, v92, v22);
    v50 = (void *)MEMORY[0x1D17BA0A0]();
    v51 = v22;
    HMFGetOSLogHandle();
    v52 = objc_claimAutoreleasedReturnValue();
    v53 = os_log_type_enabled(v52, OS_LOG_TYPE_INFO);
    if (v48 && v49)
    {
      if (v53)
      {
        HMFGetLogIdentifier();
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v97 = v54;
        _os_log_impl(&dword_1CD062000, v52, OS_LOG_TYPE_INFO, "%{public}@Current values are within the merged range", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v50);
      v55 = v18;
      v56 = -[__CFString compare:](v90, "compare:", v18);
      v57 = (void *)MEMORY[0x1D17BA0A0]();
      v58 = v51;
      HMFGetOSLogHandle();
      v59 = objc_claimAutoreleasedReturnValue();
      v60 = os_log_type_enabled(v59, OS_LOG_TYPE_INFO);
      v13 = v25;
      if (v56 == -1)
      {
        if (v60)
        {
          HMFGetLogIdentifier();
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v97 = v79;
          v98 = 2112;
          v99 = v90;
          _os_log_impl(&dword_1CD062000, v59, OS_LOG_TYPE_INFO, "%{public}@Retaining current value %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v57);
        v38 = v90;
        v18 = v55;
        goto LABEL_80;
      }
      if (v60)
      {
        HMFGetLogIdentifier();
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v97 = v61;
        v98 = 2112;
        v99 = v55;
        _os_log_impl(&dword_1CD062000, v59, OS_LOG_TYPE_INFO, "%{public}@Choosing second setting's value %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v57);
      v18 = v55;
      goto LABEL_71;
    }
    if (v48)
    {
      v73 = v50;
      v13 = v25;
      if (v53)
        goto LABEL_52;
      goto LABEL_53;
    }
    v77 = v50;
    v13 = v25;
    if (v49)
    {
      if (v53)
      {
LABEL_63:
        HMFGetLogIdentifier();
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v97 = v78;
        v98 = 2112;
        v99 = v18;
        _os_log_impl(&dword_1CD062000, v52, OS_LOG_TYPE_INFO, "%{public}@Only second setting's value %@ is within the merged range", buf, 0x16u);

      }
LABEL_64:

      objc_autoreleasePoolPop(v77);
LABEL_71:
      v81 = v18;
LABEL_79:
      v38 = v81;
      goto LABEL_80;
    }
    if (v53)
    {
      HMFGetLogIdentifier();
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v97 = v82;
      v98 = 2112;
      v99 = v89;
      _os_log_impl(&dword_1CD062000, v52, OS_LOG_TYPE_INFO, "%{public}@Neither of the values are within the merged range, choosing the min %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v77);
    v20 = v89;
    v38 = v89;
  }
  else
  {
    v33 = (void *)MEMORY[0x1D17BA0A0]();
    v34 = v10;
    HMFGetOSLogHandle();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v36 = v18;
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v97 = v37;
      v98 = 2112;
      v99 = v12;
      _os_log_impl(&dword_1CD062000, v35, OS_LOG_TYPE_ERROR, "%{public}@Cannot extract min, max and step from merged constraints %@", buf, 0x16u);

      v18 = v36;
    }

    objc_autoreleasePoolPop(v33);
    v38 = 0;
  }
LABEL_81:

  return v38;
}

+ (BOOL)_isNumber:(id)a3 betweenStart:(id)a4 andEnd:(id)a5 first:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  BOOL v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (!v9)
  {
    v14 = (void *)MEMORY[0x1D17BA0A0]();
    v15 = v12;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v17;
      _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_ERROR, "%{public}@Given value is nil, cannot determine whether within the range", (uint8_t *)&v19, 0xCu);

    }
    objc_autoreleasePoolPop(v14);
    goto LABEL_10;
  }
  if (objc_msgSend(v10, "compare:", v9) != -1 && objc_msgSend(v10, "compare:", v9)
    || objc_msgSend(v9, "compare:", v11) != -1 && objc_msgSend(v9, "compare:", v11))
  {
LABEL_10:
    v13 = 0;
    goto LABEL_11;
  }
  v13 = 1;
LABEL_11:

  return v13;
}

+ (id)_mergeRangeConstraintsFirst:(id)a3 second:(id)a4 shouldAddMissing:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  void *v9;
  void *v10;
  BOOL v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  id v33;
  NSObject *v34;
  void *v35;
  void *v36;
  id v37;
  NSObject *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  id v46;
  NSObject *v47;
  void *v48;
  double v49;
  double v50;
  uint64_t v51;
  double v52;
  double v53;
  void *v54;
  BOOL v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  NSObject *v63;
  void *v64;
  const char *v65;
  id v67;
  void *v68;
  id v69;
  NSObject *v70;
  void *v71;
  const char *v72;
  void *v73;
  id v74;
  void *v75;
  id v76;
  void *v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  uint8_t buf[4];
  void *v89;
  __int16 v90;
  double v91;
  __int16 v92;
  id v93;
  __int16 v94;
  void *v95;
  uint64_t v96;

  v5 = a5;
  v96 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "constraints");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  v86 = 0;
  v87 = 0;
  v85 = 0;
  v11 = +[HMDAccessorySettingMergeHandler _extractMinMaxStep:minConstraint:maxConstraint:stepConstraint:first:](HMDAccessorySettingMergeHandler, "_extractMinMaxStep:minConstraint:maxConstraint:stepConstraint:first:", v10, &v87, &v86, &v85, v7);
  v81 = v87;
  v80 = v86;
  v12 = v85;

  if (v11)
    goto LABEL_5;
  v13 = (void *)MEMORY[0x1D17BA0A0]();
  v14 = v7;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraints");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v89 = v16;
    v90 = 2112;
    v91 = *(double *)&v17;
    _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_ERROR, "%{public}@Cannot extract min, max and step from this setting's constraints %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v13);
  if (v5)
  {
LABEL_5:
    v18 = v8;
    objc_msgSend(v8, "constraints");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v19, "copy");
    v83 = 0;
    v84 = 0;
    v82 = 0;
    v21 = +[HMDAccessorySettingMergeHandler _extractMinMaxStep:minConstraint:maxConstraint:stepConstraint:first:](HMDAccessorySettingMergeHandler, "_extractMinMaxStep:minConstraint:maxConstraint:stepConstraint:first:", v20, &v84, &v83, &v82, v7);
    v22 = v84;
    v23 = v83;
    v79 = v82;

    if (v21)
    {
      if (v22 && v23 && v79)
      {
        if (v5)
        {
          if (!v81)
          {
            v24 = (void *)MEMORY[0x1D17BA0A0]();
            v25 = v7;
            HMFGetOSLogHandle();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v89 = v27;
              v90 = 2112;
              v91 = *(double *)&v8;
              _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_INFO, "%{public}@Taking min constraint from %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v24);
            v81 = v22;
            v18 = v8;
          }
          if (!v80)
          {
            v28 = (void *)MEMORY[0x1D17BA0A0]();
            v29 = v7;
            HMFGetOSLogHandle();
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v89 = v31;
              v90 = 2112;
              v91 = *(double *)&v8;
              _os_log_impl(&dword_1CD062000, v30, OS_LOG_TYPE_INFO, "%{public}@Taking max constraint from %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v28);
            v80 = v23;
            v18 = v8;
          }
          if (!v12)
          {
            v32 = (void *)MEMORY[0x1D17BA0A0]();
            v33 = v7;
            HMFGetOSLogHandle();
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v89 = v35;
              v90 = 2112;
              v91 = *(double *)&v18;
              _os_log_impl(&dword_1CD062000, v34, OS_LOG_TYPE_INFO, "%{public}@Taking step constraint from %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v32);
            v12 = v79;
          }
        }
        if (v81 && v80 && v12)
          goto LABEL_28;
        v36 = (void *)MEMORY[0x1D17BA0A0]();
        v37 = v7;
        HMFGetOSLogHandle();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v75 = v36;
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v89 = v39;
          _os_log_impl(&dword_1CD062000, v38, OS_LOG_TYPE_ERROR, "%{public}@Min, max or step is nil", buf, 0xCu);

          v36 = v75;
        }

        objc_autoreleasePoolPop(v36);
        if (v5)
        {
LABEL_28:
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v81, "compare:", v22) == -1)
            v40 = v22;
          else
            v40 = v81;
          v41 = v40;
          if (objc_msgSend(v12, "compare:", v79) == -1)
            v42 = v79;
          else
            v42 = v12;
          v76 = v42;
          v74 = v23;
          if (objc_msgSend(v80, "compare:", v23) == -1)
            v43 = v80;
          else
            v43 = v23;
          v44 = v43;
          v45 = (void *)MEMORY[0x1D17BA0A0]();
          v46 = a1;
          HMFGetOSLogHandle();
          v47 = objc_claimAutoreleasedReturnValue();
          v78 = v44;
          if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v89 = v48;
            v90 = 2112;
            v91 = *(double *)&v41;
            v92 = 2112;
            v93 = v76;
            v94 = 2112;
            v95 = v78;
            _os_log_impl(&dword_1CD062000, v47, OS_LOG_TYPE_INFO, "%{public}@Chosen min: %@, step: %@, max: %@", buf, 0x2Au);

            v44 = v78;
          }

          objc_autoreleasePoolPop(v45);
          objc_msgSend(v44, "doubleValue");
          v50 = v49;
          v51 = objc_msgSend(v41, "doubleValue");
          v53 = v50 - v52;
          if (v53 <= 0.0)
          {
            v67 = v41;
            v68 = (void *)MEMORY[0x1D17BA0A0](v51);
            v69 = v46;
            HMFGetOSLogHandle();
            v70 = objc_claimAutoreleasedReturnValue();
            v23 = v74;
            if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v89 = v71;
              v90 = 2048;
              v91 = v53;
              v72 = "%{public}@Chosen max constraint is not compatible with min constraint: %lf";
LABEL_56:
              _os_log_impl(&dword_1CD062000, v70, OS_LOG_TYPE_ERROR, v72, buf, 0x16u);

            }
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v53);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            v55 = compareCharacteristicValue(v76, v54, (void *)1, &unk_1E8B36CE8);

            v23 = v74;
            if (v55)
            {
              v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA2C0]), "initWithType:value:", 1, v41);
              v57 = v73;
              objc_msgSend(v73, "addObject:", v56);

              v58 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA2C0]), "initWithType:value:", 3, v76);
              objc_msgSend(v73, "addObject:", v58);

              v18 = v8;
              v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA2C0]), "initWithType:value:", 2, v78);
              objc_msgSend(v73, "addObject:", v59);

              v60 = (void *)objc_msgSend(v73, "copy");
LABEL_58:

              goto LABEL_50;
            }
            v67 = v41;
            v68 = (void *)MEMORY[0x1D17BA0A0]();
            v69 = v46;
            HMFGetOSLogHandle();
            v70 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v89 = v71;
              v90 = 2048;
              v91 = v53;
              v72 = "%{public}@New max-min cannot fit in the new step value: %lf";
              goto LABEL_56;
            }
          }

          objc_autoreleasePoolPop(v68);
          v60 = 0;
          v57 = v73;
          v41 = v67;
          goto LABEL_58;
        }
LABEL_49:
        v60 = 0;
LABEL_50:

        goto LABEL_51;
      }
      v61 = (void *)MEMORY[0x1D17BA0A0]();
      v62 = v7;
      HMFGetOSLogHandle();
      v63 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v89 = v64;
        v65 = "%{public}@second min, max or step is nil";
        goto LABEL_47;
      }
    }
    else
    {
      v61 = (void *)MEMORY[0x1D17BA0A0]();
      v62 = v7;
      HMFGetOSLogHandle();
      v63 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v89 = v64;
        v65 = "%{public}@Cannot extract min, max and step from second setting's constraints";
LABEL_47:
        _os_log_impl(&dword_1CD062000, v63, OS_LOG_TYPE_ERROR, v65, buf, 0xCu);

      }
    }

    objc_autoreleasePoolPop(v61);
    goto LABEL_49;
  }
  v60 = 0;
  v18 = v8;
LABEL_51:

  return v60;
}

+ (BOOL)_extractMinMaxStep:(id)a3 minConstraint:(id *)a4 maxConstraint:(id *)a5 stepConstraint:(id *)a6 first:(id)a7
{
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  id *v20;
  void *v21;
  void *v22;
  id v23;
  BOOL v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  void *v35;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  id v44;
  __int16 v45;
  id v46;
  __int16 v47;
  id v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a7;
  v12 = v11;
  if (!a4 || !a5 || !a6)
  {
    v25 = (void *)MEMORY[0x1D17BA0A0]();
    v26 = v12;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v42 = v28;
      _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_ERROR, "%{public}@Cannot return result in invalid data", buf, 0xCu);

    }
    goto LABEL_28;
  }
  v35 = v11;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v13 = v10;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v38 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        v19 = objc_msgSend(v18, "type");
        v20 = a4;
        if (v19 != 1)
        {
          if (v19 == 3)
          {
            v20 = a6;
          }
          else
          {
            v20 = a5;
            if (v19 != 2)
              continue;
          }
        }
        objc_msgSend(v18, "value");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v22 = v21;
        else
          v22 = 0;
        v23 = objc_retainAutorelease(v22);

        *v20 = v23;
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
    }
    while (v15);
  }

  if (!*a4 || !*a5 || !*a6)
  {
    v25 = (void *)MEMORY[0x1D17BA0A0]();
    v12 = v35;
    v29 = v35;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = *a4;
      v32 = *a5;
      v33 = *a6;
      *(_DWORD *)buf = 138544130;
      v42 = v30;
      v43 = 2112;
      v44 = v31;
      v45 = 2112;
      v46 = v32;
      v47 = 2112;
      v48 = v33;
      _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_ERROR, "%{public}@Could not find min %@ or max %@ or step %@", buf, 0x2Au);

    }
LABEL_28:

    objc_autoreleasePoolPop(v25);
    v24 = 0;
    goto LABEL_29;
  }
  v24 = 1;
  v12 = v35;
LABEL_29:

  return v24;
}

+ (id)_mergeValidValueConstraintsFirst:(id)a3 second:(id)a4 shouldAddMissing:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  const char *v26;
  id v27;
  uint64_t v28;
  void *v29;
  int v31;
  void *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v5 = a5;
  v37 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v7, "constraints");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  v13 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v8, "constraints");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWithArray:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "mutableCopy");

  v17 = (void *)MEMORY[0x1D17BA0A0]();
  v18 = v7;
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 138543874;
    v32 = v20;
    v33 = 2048;
    v34 = objc_msgSend(v12, "count");
    v35 = 2048;
    v36 = objc_msgSend(v16, "count");
    _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_INFO, "%{public}@Valid value constraints: this: %lu, second: %lu", (uint8_t *)&v31, 0x20u);

  }
  objc_autoreleasePoolPop(v17);
  if (v5)
  {
    v21 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(v12, "unionSet:", v16));
    v22 = v18;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v12, "count");
      v31 = 138543618;
      v32 = v24;
      v33 = 2048;
      v34 = v25;
      v26 = "%{public}@Combined: %lu";
LABEL_8:
      _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_INFO, v26, (uint8_t *)&v31, 0x16u);

    }
  }
  else
  {
    v21 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(v12, "intersectSet:", v16));
    v27 = v18;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v12, "count");
      v31 = 138543618;
      v32 = v24;
      v33 = 2048;
      v34 = v28;
      v26 = "%{public}@Intersected: %lu";
      goto LABEL_8;
    }
  }

  objc_autoreleasePoolPop(v21);
  objc_msgSend(v12, "allObjects");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

@end
