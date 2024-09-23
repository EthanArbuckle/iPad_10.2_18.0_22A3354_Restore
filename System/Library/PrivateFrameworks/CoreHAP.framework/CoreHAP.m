HAPService *_parseSerializedService(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  HAPCharacteristic *v5;
  uint64_t v6;
  HAPCharacteristic *v7;
  __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  void *v13;
  id v14;
  HAPCharacteristic *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  id v24;
  HAPCharacteristic *v25;
  uint64_t v26;
  void *v27;
  __CFString *v28;
  __CFString *v29;
  __CFString *v30;
  id v31;
  char isKindOfClass;
  id v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  NSObject *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  NSObject *v47;
  __CFString *v48;
  void *v49;
  __CFString *v50;
  __CFString *v51;
  void *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  id v56;
  __CFString *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  __CFString *v61;
  id v62;
  char v63;
  void *v64;
  HAPMetadataConstraints *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  __CFString *v74;
  unint64_t v75;
  void *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  char v80;
  void *v81;
  void *v83;
  NSObject *v84;
  void *v85;
  void *v86;
  void *v87;
  HAPMetadataConstraints *v88;
  HAPCharacteristicMetadata *v89;
  void *v90;
  uint64_t v91;
  void *v92;
  void *v93;
  NSObject *v94;
  void *v95;
  __CFString *v96;
  void *v97;
  NSObject *v98;
  const char *v99;
  __CFString *v100;
  void *v101;
  uint64_t v102;
  __CFString *v103;
  void *v104;
  __CFString *v105;
  id v106;
  void *v107;
  NSObject *v108;
  void *v109;
  void *v110;
  void *v111;
  NSObject *v112;
  void *v113;
  void *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  void *v122;
  id v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t i;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  void *v131;
  HAPService *v132;
  HAPService *v133;
  HAPService *v134;
  void *v135;
  NSObject *v136;
  void *v137;
  __CFString *v138;
  void *v139;
  NSObject *v140;
  void *v141;
  NSObject *v142;
  void *v143;
  id v144;
  void *v145;
  NSObject *v146;
  void *v147;
  void *v148;
  NSObject *v149;
  void *v150;
  __CFString *v151;
  void *v152;
  NSObject *v153;
  void *v154;
  __CFString *v155;
  void *v156;
  NSObject *v157;
  void *v158;
  void *v160;
  void *v161;
  id v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  __CFString *v169;
  uint64_t v170;
  HAPCharacteristic *v171;
  uint64_t v172;
  __CFString *v173;
  HAPMetadataConstraints *v174;
  uint64_t v175;
  uint64_t v176;
  void *v177;
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
  __int128 v188;
  __int128 v189;
  _BYTE v190[128];
  uint8_t v191[128];
  uint8_t v192[4];
  void *v193;
  __int16 v194;
  unint64_t v195;
  uint8_t buf[4];
  void *v197;
  __int16 v198;
  __CFString *v199;
  __int16 v200;
  id v201;
  uint64_t v202;

  v202 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v135 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v136 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v136, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v137 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v197 = v137;
      v198 = 2114;
      v199 = (__CFString *)objc_opt_class();
      v138 = v199;
      _os_log_impl(&dword_1CCE01000, v136, OS_LOG_TYPE_ERROR, "%{public}@[HAPAccessoryServerIP] Expected service object to be a dictionary in the attribute database, instead it is a %{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v135);
    v133 = 0;
    goto LABEL_175;
  }
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("characteristics"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v139 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v140 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v140, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v197 = v141;
      _os_log_impl(&dword_1CCE01000, v140, OS_LOG_TYPE_ERROR, "%{public}@[HAPAccessoryServerIP] No characteristics found when parsing service object in attribute database", buf, 0xCu);

    }
    goto LABEL_158;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v139 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v142 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v142, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v197 = v143;
      v198 = 2114;
      v199 = CFSTR("characteristics");
      v200 = 2114;
      v201 = (id)objc_opt_class();
      v144 = v201;
      _os_log_impl(&dword_1CCE01000, v142, OS_LOG_TYPE_ERROR, "%{public}@[HAPAccessoryServerIP] Expected '%{public}@' to be an array in the service object of the attribute database, instead it is a %{public}@", buf, 0x20u);

    }
LABEL_158:
    objc_autoreleasePoolPop(v139);
    v133 = 0;
    goto LABEL_174;
  }
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v2, "count"));
  v182 = 0u;
  v183 = 0u;
  v184 = 0u;
  v185 = 0u;
  v4 = v2;
  v161 = v2;
  v163 = v3;
  v176 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v182, v191, 16);
  if (!v176)
  {
LABEL_133:

    objc_msgSend(v1, "hmf_numberForKey:", CFSTR("iid"));
    v117 = objc_claimAutoreleasedReturnValue();
    v4 = (id)v117;
    if (v117)
    {
      v118 = (void *)v117;
      v119 = objc_msgSend(v1, "hmf_BOOLForKey:", CFSTR("primary"));
      if (objc_msgSend(v1, "hmf_BOOLForKey:", CFSTR("hidden")))
        v120 = v119 | 2;
      else
        v120 = v119;
      v160 = v1;
      objc_msgSend(v1, "hmf_arrayForKey:", CFSTR("linked"));
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v121, "count"));
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      v178 = 0u;
      v179 = 0u;
      v180 = 0u;
      v181 = 0u;
      v123 = v121;
      v124 = objc_msgSend(v123, "countByEnumeratingWithState:objects:count:", &v178, v190, 16);
      if (v124)
      {
        v125 = v124;
        v126 = *(_QWORD *)v179;
        do
        {
          for (i = 0; i != v125; ++i)
          {
            if (*(_QWORD *)v179 != v126)
              objc_enumerationMutation(v123);
            v128 = *(_QWORD *)(*((_QWORD *)&v178 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              objc_msgSend(v122, "addObject:", v128);
          }
          v125 = objc_msgSend(v123, "countByEnumeratingWithState:objects:count:", &v178, v190, 16);
        }
        while (v125);
      }

      objc_msgSend(v122, "removeObject:", v118);
      v1 = v160;
      objc_msgSend(v160, "hmf_stringForKey:", CFSTR("type"));
      v129 = objc_claimAutoreleasedReturnValue();
      if (v129)
      {
        v130 = (void *)v129;
        objc_msgSend(MEMORY[0x1E0D28630], "hmf_cachedInstanceForString:", v129);
        v131 = (void *)objc_claimAutoreleasedReturnValue();

        v132 = -[HAPService initWithType:instanceID:parsedCharacteristics:serviceProperties:linkedServices:]([HAPService alloc], "initWithType:instanceID:parsedCharacteristics:serviceProperties:linkedServices:", v131, v118, v163, v120, v122);
        v133 = v132;
        if (v132)
        {
          v134 = v132;
        }
        else
        {
          v156 = (void *)MEMORY[0x1D17B7244]();
          HMFGetOSLogHandle();
          v157 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v157, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v158 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v197 = v158;
            _os_log_impl(&dword_1CCE01000, v157, OS_LOG_TYPE_ERROR, "%{public}@[HAPAccessoryServerIP] Unable to parse serialized service.", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v156);
          v1 = v160;
        }
        v2 = v161;

      }
      else
      {
        v152 = (void *)MEMORY[0x1D17B7244]();
        HMFGetOSLogHandle();
        v153 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v153, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v154 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v160, "objectForKeyedSubscript:", CFSTR("type"));
          v155 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v197 = v154;
          v198 = 2112;
          v199 = v155;
          _os_log_impl(&dword_1CCE01000, v153, OS_LOG_TYPE_ERROR, "%{public}@[HAPAccessoryServerIP] Unable to parse serialized service type: %@.", buf, 0x16u);

          v1 = v160;
        }

        objc_autoreleasePoolPop(v152);
        v133 = 0;
        v2 = v161;
      }
      v3 = v163;
      v4 = v118;

    }
    else
    {
      v148 = (void *)MEMORY[0x1D17B7244]();
      HMFGetOSLogHandle();
      v149 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v149, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v150 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("iid"));
        v151 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v197 = v150;
        v198 = 2112;
        v199 = v151;
        _os_log_impl(&dword_1CCE01000, v149, OS_LOG_TYPE_ERROR, "%{public}@[HAPAccessoryServerIP] Unable to parse serialized service instanceID: %@.", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v148);
      v133 = 0;
    }
    goto LABEL_173;
  }
  v5 = 0;
  v175 = *(_QWORD *)v183;
  v162 = v4;
LABEL_6:
  v6 = 0;
  v7 = v5;
  while (1)
  {
    if (*(_QWORD *)v183 != v175)
      objc_enumerationMutation(v4);
    v8 = (__CFString *)*(id *)(*((_QWORD *)&v182 + 1) + 8 * v6);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[__CFString hmf_numberForKey:](v8, "hmf_numberForKey:", CFSTR("iid"));
      v9 = objc_claimAutoreleasedReturnValue();
      -[__CFString hmf_stringForKey:](v8, "hmf_stringForKey:", CFSTR("type"));
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      v177 = (void *)v9;
      if (v9)
        v12 = v10 == 0;
      else
        v12 = 1;
      if (v12)
      {
        v13 = v3;
        v14 = v4;
        v15 = v7;
        v16 = v6;
        v17 = (void *)MEMORY[0x1D17B7244]();
        HMFGetOSLogHandle();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v19 = v8;
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v197 = v20;
          v198 = 2112;
          v199 = v19;
          _os_log_impl(&dword_1CCE01000, v18, OS_LOG_TYPE_ERROR, "%{public}@[HAPAccessoryServerIP] unable to parse characteristic: %@", buf, 0x16u);

          v8 = v19;
        }

        objc_autoreleasePoolPop(v17);
        v5 = 0;
        v6 = v16;
        v7 = v15;
        v4 = v14;
        v3 = v13;
        goto LABEL_123;
      }
      v170 = v6;
      objc_msgSend(MEMORY[0x1E0D28630], "hmf_cachedInstanceForString:", v10);
      v172 = objc_claimAutoreleasedReturnValue();

      -[__CFString objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", CFSTR("perms"));
      v31 = (id)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      v171 = v7;
      v173 = v8;
      if ((isKindOfClass & 1) != 0)
      {
        v188 = 0u;
        v189 = 0u;
        v186 = 0u;
        v187 = 0u;
        v33 = v31;
        v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v186, buf, 16);
        if (v34)
        {
          v35 = v34;
          v36 = 0;
          v37 = *(_QWORD *)v187;
LABEL_24:
          v38 = 0;
          while (1)
          {
            if (*(_QWORD *)v187 != v37)
              objc_enumerationMutation(v33);
            v39 = *(void **)(*((_QWORD *)&v186 + 1) + 8 * v38);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v52 = (void *)MEMORY[0x1D17B7244]();
              HMFGetOSLogHandle();
              v53 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                v55 = (void *)objc_opt_class();
                *(_DWORD *)v192 = 138543618;
                v193 = v54;
                v194 = 2114;
                v195 = (unint64_t)v55;
                v56 = v55;
                _os_log_impl(&dword_1CCE01000, v53, OS_LOG_TYPE_ERROR, "%{public}@[HAPAccessoryServerIP] Expected characteristic property to be a string in the properties array in the attribute database, instead it is a %{public}@", v192, 0x16u);

              }
              objc_autoreleasePoolPop(v52);

              v36 = 0;
              goto LABEL_64;
            }
            if (objc_msgSend(v39, "isEqualToString:", CFSTR("pr")))
            {
              v36 |= 2uLL;
            }
            else if (objc_msgSend(v39, "isEqualToString:", CFSTR("pw")))
            {
              v36 |= 4uLL;
            }
            else if (objc_msgSend(v39, "isEqualToString:", CFSTR("ev")))
            {
              v36 |= 1uLL;
            }
            else if (objc_msgSend(v39, "isEqualToString:", CFSTR("bonjour")))
            {
              v36 |= 8uLL;
            }
            else
            {
              if (objc_msgSend(v39, "isEqualToString:", CFSTR("aa")))
              {
                v36 |= 0x10uLL;
                v40 = (void *)MEMORY[0x1D17B7244]();
                HMFGetOSLogHandle();
                v41 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
                {
                  HMFGetLogIdentifier();
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)v192 = 138543618;
                  v193 = v42;
                  v194 = 2048;
                  v195 = v36;
                  v43 = v41;
                  v44 = "%{public}@[HAPAccessoryServerIP] Characteristic with AAD Properties: %lu";
                  goto LABEL_45;
                }
                goto LABEL_46;
              }
              if (!objc_msgSend(v39, "isEqualToString:", CFSTR("tw")))
              {
                if ((objc_msgSend(v39, "isEqualToString:", CFSTR("hd")) & 1) == 0
                  && !objc_msgSend(v39, "isEqualToString:", CFSTR("hidden")))
                {
                  if (objc_msgSend(v39, "isEqualToString:", CFSTR("wr")))
                  {
                    v36 |= 0x80uLL;
                  }
                  else if (objc_msgSend(v39, "isEqualToString:", CFSTR("enc")))
                  {
                    v36 |= 0x100uLL;
                  }
                  goto LABEL_47;
                }
                v36 |= 0x40uLL;
                v40 = (void *)MEMORY[0x1D17B7244]();
                HMFGetOSLogHandle();
                v41 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
                {
                  HMFGetLogIdentifier();
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)v192 = 138543618;
                  v193 = v42;
                  v194 = 2048;
                  v195 = v36;
                  v43 = v41;
                  v44 = "%{public}@[HAPAccessoryServerIP] Characteristic which is hidden: %lu";
LABEL_45:
                  _os_log_impl(&dword_1CCE01000, v43, OS_LOG_TYPE_DEFAULT, v44, v192, 0x16u);

                }
LABEL_46:

                objc_autoreleasePoolPop(v40);
                goto LABEL_47;
              }
              v36 |= 0x20uLL;
            }
LABEL_47:
            if (v35 == ++v38)
            {
              v45 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v186, buf, 16);
              v35 = v45;
              if (v45)
                goto LABEL_24;
              goto LABEL_63;
            }
          }
        }
        v36 = 0;
LABEL_63:

LABEL_64:
        v8 = v173;
      }
      else
      {
        v46 = (void *)MEMORY[0x1D17B7244]();
        HMFGetOSLogHandle();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v48 = v8;
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = (__CFString *)objc_opt_class();
          *(_DWORD *)buf = 138543618;
          v197 = v49;
          v198 = 2114;
          v199 = v50;
          v51 = v50;
          _os_log_impl(&dword_1CCE01000, v47, OS_LOG_TYPE_ERROR, "%{public}@[HAPAccessoryServerIP] Expected characteristic properties to be an array in the attribute database, instead it is a %{public}@", buf, 0x16u);

          v8 = v48;
        }

        objc_autoreleasePoolPop(v46);
        v36 = 0;
      }

      -[__CFString hmf_numberForKey:](v8, "hmf_numberForKey:", CFSTR("ev"));
      v164 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = v8;
      -[__CFString hmf_stringForKey:](v57, "hmf_stringForKey:", CFSTR("description"));
      v58 = objc_claimAutoreleasedReturnValue();
      -[__CFString hmf_stringForKey:](v57, "hmf_stringForKey:", CFSTR("format"));
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString hmf_stringForKey:](v57, "hmf_stringForKey:", CFSTR("unit"));
      v60 = objc_claimAutoreleasedReturnValue();
      v61 = v57;
      v62 = v59;
      v174 = objc_alloc_init(HAPMetadataConstraints);
      v166 = v62;
      if ((objc_msgSend(v62, "isEqualToString:", CFSTR("int")) & 1) != 0
        || (objc_msgSend(v62, "isEqualToString:", CFSTR("float")) & 1) != 0
        || (objc_msgSend(v62, "isEqualToString:", CFSTR("BOOL")) & 1) != 0
        || (objc_msgSend(v62, "isEqualToString:", CFSTR("int8")) & 1) != 0
        || (objc_msgSend(v62, "isEqualToString:", CFSTR("int16")) & 1) != 0
        || (objc_msgSend(v62, "isEqualToString:", CFSTR("int64")) & 1) != 0
        || (objc_msgSend(v62, "isEqualToString:", CFSTR("uint8")) & 1) != 0
        || (objc_msgSend(v62, "isEqualToString:", CFSTR("uint16")) & 1) != 0
        || (objc_msgSend(v62, "isEqualToString:", CFSTR("uint32")) & 1) != 0
        || objc_msgSend(v62, "isEqualToString:", CFSTR("uint64")))
      {
        v63 = objc_msgSend(v62, "isEqualToString:", CFSTR("string"));
        -[__CFString hmf_numberForKey:](v61, "hmf_numberForKey:", CFSTR("minValue"));
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = v174;
        -[HAPMetadataConstraints setMinimumValue:](v174, "setMinimumValue:", v64);

        -[__CFString hmf_numberForKey:](v61, "hmf_numberForKey:", CFSTR("maxValue"));
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPMetadataConstraints setMaximumValue:](v174, "setMaximumValue:", v66);

        -[__CFString hmf_numberForKey:](v61, "hmf_numberForKey:", CFSTR("minStep"));
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPMetadataConstraints setStepValue:](v174, "setStepValue:", v67);

        if ((v63 & 1) == 0)
          goto LABEL_78;
      }
      else
      {
        v65 = v174;
        if (!objc_msgSend(v62, "isEqualToString:", CFSTR("string")))
          goto LABEL_78;
      }
      -[__CFString hmf_numberForKey:](v61, "hmf_numberForKey:", CFSTR("maxLen"));
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPMetadataConstraints setMaxLength:](v65, "setMaxLength:", v68);

      -[HAPMetadataConstraints maxLength](v65, "maxLength");
      v69 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v69)
        -[HAPMetadataConstraints setMaxLength:](v65, "setMaxLength:", &unk_1E8989410);
LABEL_78:
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString hmf_arrayForKey:ofClasses:](v61, "hmf_arrayForKey:ofClasses:", CFSTR("valid-values"), v70);
      v71 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v169 = v61;
      -[__CFString hmf_arrayForKey:ofClasses:](v61, "hmf_arrayForKey:ofClasses:", CFSTR("valid-values-range"), v72);
      v73 = (void *)objc_claimAutoreleasedReturnValue();

      v167 = (void *)v60;
      v168 = (void *)v58;
      v165 = v71;
      if (objc_msgSend(v71, "count") || objc_msgSend(v73, "count"))
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v71);
        v74 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v74 = 0;
      }
      if (objc_msgSend(v73, "count") && (objc_msgSend(v73, "count") & 1) == 0 && objc_msgSend(v73, "count"))
      {
        v75 = 0;
        do
        {
          objc_msgSend(v73, "objectAtIndexedSubscript:", v75);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "objectAtIndexedSubscript:", v75 | 1);
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          v78 = objc_msgSend(v76, "integerValue");
          if (v78 <= objc_msgSend(v77, "integerValue"))
          {
            do
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v78);
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              v80 = -[__CFString containsObject:](v74, "containsObject:", v79);

              if ((v80 & 1) == 0)
              {
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v78);
                v81 = (void *)objc_claimAutoreleasedReturnValue();
                -[__CFString addObject:](v74, "addObject:", v81);

              }
            }
            while (v78++ < objc_msgSend(v77, "integerValue"));
          }

          v75 += 2;
        }
        while (objc_msgSend(v73, "count") > v75);
      }
      if (-[__CFString count](v74, "count"))
      {
        v83 = (void *)MEMORY[0x1D17B7244](-[__CFString sortUsingComparator:](v74, "sortUsingComparator:", &__block_literal_global_1150));
        HMFGetOSLogHandle();
        v84 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v197 = v85;
          v198 = 2112;
          v199 = v74;
          _os_log_impl(&dword_1CCE01000, v84, OS_LOG_TYPE_DEBUG, "%{public}@[HAPAccessoryServerIP] Setting valid values: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v83);
        -[HAPMetadataConstraints setValidValues:](v174, "setValidValues:", v74);
      }
      -[HAPMetadataConstraints minimumValue](v174, "minimumValue");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      if (v86
        || (-[HAPMetadataConstraints maximumValue](v174, "maximumValue"),
            (v86 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
        || (-[HAPMetadataConstraints stepValue](v174, "stepValue"),
            (v86 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
        || (-[HAPMetadataConstraints maxLength](v174, "maxLength"),
            (v86 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {

        v87 = v165;
      }
      else
      {
        -[HAPMetadataConstraints validValues](v174, "validValues");
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        v115 = objc_msgSend(v114, "count");

        v87 = v165;
        if (!v115)
        {
          v88 = 0;
LABEL_100:
          v8 = v173;

          v89 = -[HAPCharacteristicMetadata initWithConstraints:description:format:units:]([HAPCharacteristicMetadata alloc], "initWithConstraints:description:format:units:", v88, v168, v166, v167);
          +[HMFObjectCacheHAPCharacteristicMetadata hap_cacheInstanceForMetadata:](HMFObjectCacheHAPCharacteristicMetadata, "hap_cacheInstanceForMetadata:", v89);
          v90 = (void *)objc_claimAutoreleasedReturnValue();

          -[__CFString objectForKeyedSubscript:](v169, "objectForKeyedSubscript:", CFSTR("value"));
          v91 = objc_claimAutoreleasedReturnValue();
          v92 = (void *)v91;
          if ((v36 & 2) != 0)
          {
            v7 = v171;
            if (!v91)
            {
              v93 = (void *)MEMORY[0x1D17B7244]();
              HMFGetOSLogHandle();
              v94 = objc_claimAutoreleasedReturnValue();
              v95 = v90;
              if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v96 = v173;
                v97 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v197 = v97;
                v98 = v94;
                v99 = "%{public}@[HAPAccessoryServerIP] Readable characteristics must contain 'value' key";
                goto LABEL_113;
              }
LABEL_114:

              objc_autoreleasePoolPop(v93);
              v5 = 0;
LABEL_115:
              v110 = v164;
LABEL_122:

              v4 = v162;
              v3 = v163;
              v6 = v170;
              v11 = (void *)v172;
LABEL_123:

              goto LABEL_124;
            }
            v100 = v173;
            v95 = v90;
            objc_msgSend(v90, "format");
            v101 = (void *)objc_claimAutoreleasedReturnValue();
            v102 = HAPCharacteristicFormatFromString(v101);

            -[__CFString objectForKeyedSubscript:](v169, "objectForKeyedSubscript:", CFSTR("value"));
            v103 = (__CFString *)objc_claimAutoreleasedReturnValue();
            if (v102)
            {
              +[HAPJSONValueTransformer defaultJSONValueTransformer](HAPJSONValueTransformer, "defaultJSONValueTransformer");
              v104 = (void *)objc_claimAutoreleasedReturnValue();
              *(_QWORD *)&v186 = 0;
              objc_msgSend(v104, "reverseTransformedValue:format:error:", v103, v102, &v186);
              v105 = (__CFString *)objc_claimAutoreleasedReturnValue();
              v106 = (id)v186;

              if (v106)
              {
                v107 = (void *)MEMORY[0x1D17B7244]();
                HMFGetOSLogHandle();
                v108 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
                {
                  HMFGetLogIdentifier();
                  v109 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543874;
                  v197 = v109;
                  v198 = 2114;
                  v199 = v103;
                  v200 = 2114;
                  v201 = v106;
                  _os_log_impl(&dword_1CCE01000, v108, OS_LOG_TYPE_ERROR, "%{public}@[HAPAccessoryServerIP] Failed to transform the value '%{public}@' with error: %{public}@", buf, 0x20u);

                }
                objc_autoreleasePoolPop(v107);

                v5 = 0;
                v7 = v171;
                v8 = v173;
                goto LABEL_115;
              }
            }
            else
            {
              v111 = (void *)MEMORY[0x1D17B7244]();
              HMFGetOSLogHandle();
              v112 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v112, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v113 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v197 = v113;
                _os_log_impl(&dword_1CCE01000, v112, OS_LOG_TYPE_ERROR, "%{public}@[HAPAccessoryServerIP] The characteristic has not specified a characteristic format type. This may cause the characteristic value to contain an object of an unexpected type. For now, the value will be passed through without transformation into an appropriate type. At some point in the future, support for this accessory may be dropped.", buf, 0xCu);

              }
              objc_autoreleasePoolPop(v111);
              v105 = v103;
            }

          }
          else
          {
            v7 = v171;
            if (v91)
            {
              v93 = (void *)MEMORY[0x1D17B7244]();
              HMFGetOSLogHandle();
              v94 = objc_claimAutoreleasedReturnValue();
              v95 = v90;
              if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v96 = v173;
                v97 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v197 = v97;
                v98 = v94;
                v99 = "%{public}@[HAPAccessoryServerIP] Non-readable characteristics must not contain 'value' key";
LABEL_113:
                _os_log_impl(&dword_1CCE01000, v98, OS_LOG_TYPE_ERROR, v99, buf, 0xCu);

                v8 = v96;
                goto LABEL_114;
              }
              goto LABEL_114;
            }
            v100 = v173;
            v105 = 0;
            v95 = v90;
          }
          v110 = v164;
          v5 = -[HAPCharacteristic initWithType:instanceID:value:stateNumber:properties:eventNotificationsEnabled:metadata:]([HAPCharacteristic alloc], "initWithType:instanceID:value:stateNumber:properties:eventNotificationsEnabled:metadata:", v172, v177, v105, 0, v36, objc_msgSend(v164, "BOOLValue"), v95);

          v8 = v100;
          goto LABEL_122;
        }
      }
      v88 = v174;
      goto LABEL_100;
    }
    v21 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = v3;
      v24 = v4;
      v25 = v7;
      v26 = v6;
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (__CFString *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v197 = v27;
      v198 = 2114;
      v199 = v28;
      v29 = v8;
      v30 = v28;
      _os_log_impl(&dword_1CCE01000, v22, OS_LOG_TYPE_ERROR, "%{public}@[HAPAccessoryServerIP] Expected characteristic object to be a dictionary in the attribute database, instead it is a %{public}@", buf, 0x16u);

      v8 = v29;
      v6 = v26;
      v7 = v25;
      v4 = v24;
      v3 = v23;
    }

    objc_autoreleasePoolPop(v21);
    v5 = 0;
LABEL_124:

    if (!v5)
      break;
    objc_msgSend(v3, "addObject:", v5);
    ++v6;
    v7 = v5;
    if (v6 == v176)
    {
      v116 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v182, v191, 16);
      v176 = v116;
      if (!v116)
      {

        v2 = v161;
        goto LABEL_133;
      }
      goto LABEL_6;
    }
  }
  v145 = (void *)MEMORY[0x1D17B7244]();
  HMFGetOSLogHandle();
  v146 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v146, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v197 = v147;
    _os_log_impl(&dword_1CCE01000, v146, OS_LOG_TYPE_ERROR, "%{public}@[HAPAccessoryServerIP] Unable to parse serialized characteristic.", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v145);
  v133 = 0;
  v2 = v161;
LABEL_173:

LABEL_174:
LABEL_175:

  return v133;
}

void sub_1CCE04EBC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)&hap_cacheInstanceForMetadata__lock);
  _Unwind_Resume(a1);
}

uint64_t isValidInstanceID(void *a1)
{
  id v1;
  double v2;
  double v3;
  uint64_t v4;
  double v5;
  void *v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (v1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v1, "doubleValue");
      v3 = floor(v2);
      v4 = objc_msgSend(v1, "doubleValue");
      if (v3 == ceil(v5))
      {
        if (objc_msgSend(v1, "unsignedLongLongValue"))
        {
          v10 = 1;
          goto LABEL_12;
        }
        v6 = (void *)MEMORY[0x1D17B7244]();
        HMFGetOSLogHandle();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = 138543362;
          v13 = v8;
          v9 = "%{public}@### instance ID is not > 0";
          goto LABEL_10;
        }
      }
      else
      {
        v6 = (void *)MEMORY[0x1D17B7244](v4);
        HMFGetOSLogHandle();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = 138543362;
          v13 = v8;
          v9 = "%{public}@### instance ID is not an integer";
LABEL_10:
          _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v12, 0xCu);

        }
      }
    }
    else
    {
      v6 = (void *)MEMORY[0x1D17B7244]();
      HMFGetOSLogHandle();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138543362;
        v13 = v8;
        v9 = "%{public}@### instance ID is not a number";
        goto LABEL_10;
      }
    }
  }
  else
  {
    v6 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v8;
      v9 = "%{public}@### nil instance ID";
      goto LABEL_10;
    }
  }

  objc_autoreleasePoolPop(v6);
  v10 = 0;
LABEL_12:

  return v10;
}

uint64_t isValidTypeName(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  NSObject *v4;
  void *v5;
  const char *v6;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (!v1)
  {
    v3 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v5;
    v6 = "%{public}@### Type name is nil";
LABEL_11:
    _os_log_impl(&dword_1CCE01000, v4, OS_LOG_TYPE_ERROR, v6, (uint8_t *)&v8, 0xCu);

    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v3 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v5;
    v6 = "%{public}@### Type name is not a string";
    goto LABEL_11;
  }
  if (!objc_msgSend(v1, "length"))
  {
    v3 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v5;
      v6 = "%{public}@### Type name is an empty string";
      goto LABEL_11;
    }
LABEL_12:

    objc_autoreleasePoolPop(v3);
    v2 = 0;
    goto LABEL_13;
  }
  v2 = 1;
LABEL_13:

  return v2;
}

id HAPShortUUIDType(void *a1)
{
  id v1;
  id v2;
  void *v3;

  v1 = a1;
  if (objc_msgSend(v1, "hasSuffix:", CFSTR("-0000-1000-8000-0026BB765291")))
  {
    objc_msgSend(v1, "substringToIndex:", objc_msgSend(v1, "length") - objc_msgSend(CFSTR("-0000-1000-8000-0026BB765291"), "length"));
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = v1;
  }
  v3 = v2;

  return v3;
}

uint64_t HAPCharacteristicFormatFromString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("uint8")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("uint16")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("uint32")) & 1) != 0)
  {
    v2 = 3;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("uint64")) & 1) != 0)
  {
    v2 = 4;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("int8")) & 1) != 0)
  {
    v2 = 5;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("int16")) & 1) != 0)
  {
    v2 = 6;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("int")) & 1) != 0)
  {
    v2 = 7;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("int64")) & 1) != 0)
  {
    v2 = 8;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("BOOL")) & 1) != 0)
  {
    v2 = 9;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("float")) & 1) != 0)
  {
    v2 = 10;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("string")) & 1) != 0)
  {
    v2 = 11;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("data")) & 1) != 0)
  {
    v2 = 12;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("tlv8")) & 1) != 0)
  {
    v2 = 13;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("array")) & 1) != 0)
  {
    v2 = 14;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("dict")))
  {
    v2 = 15;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

uint64_t numbersAreNotEqualNilSafe(void *a1, void *a2)
{
  unint64_t v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  float v7;
  float v8;
  float v9;

  v3 = a1;
  v4 = a2;
  v5 = (void *)v4;
  if (v3 | v4)
  {
    v6 = 1;
    if (v3 && v4)
    {
      if (CFNumberIsFloatType((CFNumberRef)v3) || CFNumberIsFloatType((CFNumberRef)v5))
      {
        objc_msgSend((id)v3, "floatValue");
        v8 = v7;
        objc_msgSend(v5, "floatValue");
        v6 = vabds_f32(v8, v9) >= 0.00000011921;
      }
      else
      {
        v6 = objc_msgSend((id)v3, "isEqualToNumber:", v5) ^ 1;
      }
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

BOOL HAPIsInternalBuild()
{
  void *v0;
  _BOOL8 v1;

  objc_msgSend(MEMORY[0x1E0D28690], "productInfo");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "productVariant") == 3;

  return v1;
}

uint64_t HAPTLVParseUInt64(unsigned __int8 *a1, uint64_t a2, int *a3)
{
  uint64_t result;
  int v5;

  result = 0;
  v5 = -6743;
  switch(a2)
  {
    case 1:
      v5 = 0;
      result = *a1;
      if (a3)
        goto LABEL_8;
      return result;
    case 2:
      v5 = 0;
      result = *(unsigned __int16 *)a1;
      if (a3)
        goto LABEL_8;
      return result;
    case 4:
      v5 = 0;
      result = *(unsigned int *)a1;
      goto LABEL_7;
    case 8:
      v5 = 0;
      result = *(_QWORD *)a1;
      if (!a3)
        return result;
      goto LABEL_8;
    default:
LABEL_7:
      if (a3)
LABEL_8:
        *a3 = v5;
      return result;
  }
}

uint64_t HAPCompareStateNumberWithRollover(void *a1, void *a2, unint64_t a3)
{
  id v5;
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v5 = a1;
  v6 = a2;
  v7 = v6;
  if (v5 && v6)
  {
    if (objc_msgSend(v5, "compare:", v6) == 1
      && (v8 = objc_msgSend(v5, "unsignedIntValue"), v8 - objc_msgSend(v7, "unsignedIntValue") <= a3 >> 1))
    {
      v9 = 1;
    }
    else if (objc_msgSend(v5, "compare:", v7))
    {
      v9 = -1;
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    if (v6)
      v10 = -1;
    else
      v10 = 0;
    if (v5)
      v9 = 1;
    else
      v9 = v10;
  }

  return v9;
}

void sub_1CCE0C590(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCE0C664(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCE0C6E4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCE0CC6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
  id *v16;
  uint64_t v17;

  objc_destroyWeak(v16);
  objc_destroyWeak((id *)(v17 - 56));
  _Unwind_Resume(a1);
}

void sub_1CCE0D33C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  __HMFActivityScopeLeave();
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1CCE0D62C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1CCE0D9A0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

void sub_1CCE0DB10(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1CCE0DC0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCE0DD44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCE0DE14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCE0DEE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCE0E5B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id HAPTLVParseContiguousTlvs(uint64_t a1, unint64_t a2, unint64_t a3, unint64_t *a4, _QWORD *a5)
{
  uint64_t Next;
  id v9;
  void *v10;
  id v12;
  void *v13;

  if (a2 < a3)
  {
    Next = TLV8GetNext();
    if ((_DWORD)Next)
    {
      if (a5)
      {
        HMErrorFromOSStatus(Next);
        v12 = (id)objc_claimAutoreleasedReturnValue();
        v10 = 0;
LABEL_11:
        v9 = 0;
        *a5 = v12;
        goto LABEL_5;
      }
      v10 = 0;
LABEL_13:
      v9 = 0;
      goto LABEL_5;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v10 = v13;
      if (a5)
      {
        v12 = objc_retainAutorelease(v13);
        v10 = v12;
        goto LABEL_11;
      }
      goto LABEL_13;
    }
  }
  *a4 = a2;
  v9 = 0;
  v10 = 0;
LABEL_5:

  return v9;
}

void sub_1CCE0F5AC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCE0F718(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

__CFString *HAPAccessorySuspendedStateDescription(unint64_t a1)
{
  __CFString *v1;
  void *v2;
  void *v3;

  if (a1 >= 4)
  {
    v2 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringWithFormat:", CFSTR("unknown (%@)"), v3);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v1 = off_1E894CCE8[a1];
  }
  return v1;
}

const __CFString *HAPAuthMethodToString(unint64_t a1)
{
  if (a1 > 6)
    return CFSTR("HAPAuthMethodUnknown");
  else
    return off_1E8948F80[a1];
}

void sub_1CCE0FBBC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1CCE10098(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCE11A9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

id HAPAuthFeaturesToString(char a1)
{
  __CFString *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v7;

  if ((a1 & 1) != 0)
  {
    objc_msgSend(CFSTR("<"), "stringByAppendingString:", CFSTR(" AuthV2"));
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if ((a1 & 4) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  v2 = CFSTR("<");
  if ((a1 & 4) != 0)
  {
LABEL_5:
    -[__CFString stringByAppendingString:](v2, "stringByAppendingString:", CFSTR(" AuthV3"));
    v3 = objc_claimAutoreleasedReturnValue();

    v2 = (__CFString *)v3;
  }
LABEL_6:
  if ((a1 & 2) != 0)
  {
    -[__CFString stringByAppendingString:](v2, "stringByAppendingString:", CFSTR(" Token"));
    v7 = objc_claimAutoreleasedReturnValue();

    v2 = (__CFString *)v7;
    if ((a1 & 8) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  if ((a1 & 8) != 0)
  {
LABEL_8:
    -[__CFString stringByAppendingString:](v2, "stringByAppendingString:", CFSTR(" SWCert"));
    v4 = objc_claimAutoreleasedReturnValue();

    v2 = (__CFString *)v4;
  }
LABEL_9:
  -[__CFString stringByAppendingString:](v2, "stringByAppendingString:", CFSTR(" >"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t HAPGetPreferredAuthMethod(int a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = 2;
  v2 = 4;
  v3 = 5;
  if ((a1 & 0x10) != 0)
    v3 = 6;
  if ((a1 & 8) == 0)
    v2 = v3;
  if ((a1 & 2) == 0)
    v1 = v2;
  if ((a1 & 1) != 0)
    v4 = 1;
  else
    v4 = v1;
  if (a1)
    return v4;
  else
    return 0;
}

void sub_1CCE15DEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCE15F40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCE1617C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1CCE16240(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1CCE16354(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1CCE16468(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1CCE165F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
  id *v16;
  uint64_t v17;

  objc_destroyWeak(v16);
  objc_destroyWeak((id *)(v17 - 56));
  _Unwind_Resume(a1);
}

void sub_1CCE16760(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CCE17134(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CCE18554(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1CCE18684(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__309(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__310(uint64_t a1)
{

}

void sub_1CCE187B0(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

__CFString *HAPAudioCodecBitRateAsString(uint64_t a1)
{
  __CFString *v1;

  if (!a1)
    return CFSTR("HAPAudioCodecBitRateVariable");
  if (a1 == 1)
  {
    v1 = CFSTR("HAPAudioCodecBitRateConstant");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown HAPAudioCodecBitRate %ld"), a1);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

__CFString *HAPAudioCodecSampleRateAsString(unint64_t a1)
{
  if (a1 < 3)
    return off_1E8949008[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown HAPAudioCodecSampleRate %ld"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *HAPAudioCodecTypeAsString(unint64_t a1)
{
  if (a1 < 7)
    return off_1E8949020[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown HAPAudioCodecType %ld"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

void sub_1CCE1A2C0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCE1A420(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCE1AFF4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCE1BC40(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCE1C5FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CCE1D22C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCE1D334(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCE1D72C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCE1DBB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CCE1ECC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CCE1EF14(_Unwind_Exception *a1)
{
  __HMFActivityScopeLeave();
  _Unwind_Resume(a1);
}

void sub_1CCE1F6DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CCE1FB60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CCE200E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CCE202E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CCE20514(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CCE208AC(_Unwind_Exception *a1)
{
  __HMFActivityScopeLeave();
  _Unwind_Resume(a1);
}

void sub_1CCE21158(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, id *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id a30)
{
  id *v30;
  id *v31;
  uint64_t v32;

  objc_destroyWeak(v31);
  objc_destroyWeak(v30);
  objc_destroyWeak(a11);
  objc_destroyWeak(&a30);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v32 - 160));
  _Unwind_Resume(a1);
}

void sub_1CCE22778(_Unwind_Exception *a1)
{
  __HMFActivityScopeLeave();
  _Unwind_Resume(a1);
}

void sub_1CCE231F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *a10, id *a11, id *location, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,id a35)
{
  id *v35;
  uint64_t v36;

  objc_destroyWeak(v35);
  objc_destroyWeak(location);
  objc_destroyWeak(a11);
  objc_destroyWeak(&a35);
  objc_destroyWeak(a10);
  objc_destroyWeak((id *)(v36 - 192));
  _Unwind_Resume(a1);
}

void sub_1CCE236C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *a11, id *a12, id *a13, id *a14, id *location, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,id a55,id a56)
{
  objc_destroyWeak(location);
  objc_destroyWeak(a14);
  objc_destroyWeak(a13);
  objc_destroyWeak(a12);
  objc_destroyWeak(a11);
  objc_destroyWeak(&a55);
  objc_destroyWeak(&a56);
  _Unwind_Resume(a1);
}

void sub_1CCE23A54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id a19)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a19);
  _Unwind_Resume(a1);
}

void sub_1CCE297FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_1CCE2AC70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCE2B06C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CCE2C68C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CCE2CE8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location)
{
  id *v27;

  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CCE2D9A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CCE2DD60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CCE2E330(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  id *v26;

  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

void sub_1CCE2EB70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1CCE2EE94(_Unwind_Exception *a1)
{
  __HMFActivityScopeLeave();
  _Unwind_Resume(a1);
}

void sub_1CCE2F55C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location)
{
  id *v26;
  uint64_t v27;

  objc_destroyWeak(v26);
  objc_destroyWeak((id *)(v27 - 128));
  _Unwind_Resume(a1);
}

void sub_1CCE30B3C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(a1);
}

void sub_1CCE34AB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CCE34F74(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

uint64_t _SavePairedPeerDelegateCallback_f(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7;
  char isKindOfClass;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  id v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if (v7 && (isKindOfClass & 1) != 0)
  {
    objc_msgSend(v7, "server");
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v9;
  }
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", a3, 32);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", a1, a2, 4);
  objc_msgSend(v7, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", v11);

  if (v13)
  {
    v14 = (void *)MEMORY[0x1D17B7244]();
    v15 = v7;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v24 = v17;
      _os_log_impl(&dword_1CCE01000, v16, OS_LOG_TYPE_INFO, "%{public}@Pair-Setup - Saving KeyChain for accessory", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v14);
    objc_msgSend(v15, "keyStore");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    objc_msgSend(v18, "savePublicKey:forAccessoryName:error:", v10, v11, &v22);
    v19 = v22;

    objc_msgSend(v15, "associateAccessoryWithControllerKeyUsingAccessoryPublicKey:", v10);
    v20 = objc_msgSend(v19, "code");

  }
  else
  {
    v20 = 4294960591;
  }

  return v20;
}

uint64_t _FindPairedPeerDelegateCallback_f(uint64_t a1, uint64_t a2, _OWORD *a3, void *a4)
{
  id v7;
  char isKindOfClass;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  _OWORD *v17;
  __int128 v18;
  id v20;

  v7 = a4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if (v7 && (isKindOfClass & 1) != 0)
  {
    objc_msgSend(v7, "server");
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v9;
  }
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", a1, a2, 4);
  objc_msgSend(v7, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", v10);

  if (v12)
  {
    objc_msgSend(v7, "keyStore");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    objc_msgSend(v13, "readPublicKeyForAccessoryName:registeredWithHomeKit:error:", v10, 0, &v20);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v15 = v20;

    v16 = objc_msgSend(v15, "code");
    if (!(_DWORD)v16)
    {
      if (v14)
      {
        if (objc_msgSend(v14, "length") == 32)
        {
          v14 = objc_retainAutorelease(v14);
          v17 = (_OWORD *)objc_msgSend(v14, "bytes");
          v16 = 0;
          v18 = v17[1];
          *a3 = *v17;
          a3[1] = v18;
        }
        else
        {
          v16 = 4294960553;
        }
      }
      else
      {
        v16 = 4294960569;
      }
    }
  }
  else
  {
    v14 = 0;
    v15 = 0;
    v16 = 4294960542;
  }

  return v16;
}

uint64_t _CopyPairingIdentityDelegateCallback_f(int a1, char **a2, _OWORD *a3, _OWORD *a4, void *a5)
{
  id v9;
  char isKindOfClass;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  _OWORD *v30;
  __int128 v31;
  _OWORD *v32;
  __int128 v33;
  uint64_t v34;
  size_t v35;
  char *v36;
  char *v37;
  char **v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if (v9 && (isKindOfClass & 1) != 0)
  {
    objc_msgSend(v9, "server");
    v11 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v11;
  }
  objc_msgSend(v9, "pairingRequest");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "pairingIdentity");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;

  }
  else
  {
    objc_msgSend(v9, "keyBag");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "currentIdentity");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      v39 = a2;
      objc_msgSend(v9, "keyStore");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (a4)
      {
        v45 = 0;
        v46 = 0;
        v44 = 0;
        objc_msgSend(v9, "identifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = 0;
        objc_msgSend(v24, "getControllerPublicKey:secretKey:username:allowCreation:forAccessory:error:", &v46, &v45, &v44, a1 != 0, v27, &v43);
        v22 = v46;
        v25 = v45;
        v23 = v44;
        v26 = v43;

        v14 = 0;
      }
      else
      {
        v41 = 0;
        v42 = 0;
        objc_msgSend(v9, "identifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = 0;
        objc_msgSend(v24, "getControllerPublicKey:secretKey:username:allowCreation:forAccessory:error:", &v42, 0, &v41, a1 != 0, v28, &v40);
        v22 = v42;
        v23 = v41;
        v26 = v40;

        v14 = 0;
        v25 = 0;
      }
      a2 = v39;
      goto LABEL_16;
    }
  }
  v16 = (void *)MEMORY[0x1D17B7244]();
  v17 = v9;
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v48 = v19;
    v49 = 2114;
    v50 = v20;
    _os_log_impl(&dword_1CCE01000, v18, OS_LOG_TYPE_INFO, "%{public}@Using Pairing Identity for PV/PS : %{public}@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v16);
  objc_msgSend(v14, "publicKey");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "data");
  v22 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "identifier");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    objc_msgSend(v14, "privateKey");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "data");
    v25 = (id)objc_claimAutoreleasedReturnValue();
    v26 = 0;
LABEL_16:

    goto LABEL_17;
  }
  v26 = 0;
  v25 = 0;
LABEL_17:
  v29 = objc_msgSend(v26, "code");
  if ((_DWORD)v29)
    goto LABEL_29;
  if (!v22)
    goto LABEL_31;
  if (objc_msgSend(v22, "length") != 32)
    goto LABEL_30;
  v30 = (_OWORD *)objc_msgSend(objc_retainAutorelease(v22), "bytes");
  v31 = v30[1];
  *a3 = *v30;
  a3[1] = v31;
  if (!a4)
    goto LABEL_24;
  if (!v25)
  {
LABEL_31:
    v29 = 4294960569;
    goto LABEL_29;
  }
  if (objc_msgSend(v25, "length") != 32)
    goto LABEL_30;
  v32 = (_OWORD *)objc_msgSend(objc_retainAutorelease(v25), "bytes");
  v33 = v32[1];
  *a4 = *v32;
  a4[1] = v33;
LABEL_24:
  v29 = 0;
  if (a2 && v23)
  {
    v34 = objc_msgSend(v23, "lengthOfBytesUsingEncoding:", 4);
    if (v34)
    {
      v35 = v34 + 1;
      v36 = (char *)malloc_type_calloc(v34 + 1, 1uLL, 0x100004077774924uLL);
      if (v36)
      {
        v37 = v36;
        strlcpy(v36, (const char *)objc_msgSend(objc_retainAutorelease(v23), "UTF8String"), v35);
        v29 = 0;
        *a2 = v37;
      }
      else
      {
        v29 = 4294960568;
      }
      goto LABEL_29;
    }
LABEL_30:
    v29 = 4294960553;
  }
LABEL_29:

  return v29;
}

void sub_1CCE36794(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(a1);
}

void sub_1CCE36E20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CCE37444(_Unwind_Exception *a1)
{
  __HMFActivityScopeLeave();
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__649(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__650(uint64_t a1)
{

}

void sub_1CCE37A3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t _PairSetupPromptForSetupCodeDelegateCallback_f(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;

  v5 = a3;
  v6 = objc_msgSend(v5, "_promptForSetupCodeWithFlags:delaySeconds:pairingFlags:isWAC:", a1, a2, PairingSessionGetPeerFlags(), 0);

  return v6;
}

uint64_t _PairSetupEventHandler(uint64_t result, uint64_t a2, void *a3)
{
  if ((_DWORD)result == 3)
    return objc_msgSend(a3, "_handlePairSetupAfterM4Callback");
  return result;
}

id _parseNotificationContextFromCharacteristicResponse(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(v1, "hmf_stringForKey:", CFSTR("context"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v2, 0);
  }
  else
  {
    v4 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v6;
      _os_log_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_INFO, "%{public}@[HAPAccessoryServerIP] Notification context not present in response", (uint8_t *)&v8, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    v3 = 0;
  }

  return v3;
}

void sub_1CCE3A8C0(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1CCE3AB04(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1CCE3AFD4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1CCE3BB80(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1CCE3C6A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CCE3D304(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1CCE3D3F4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t _WACPairSetupPromptForSetupCodeDelegateCallback_f(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "_promptForSetupCodeWithFlags:delaySeconds:pairingFlags:isWAC:", a1, a2, 0, 1);
}

uint64_t ___parseSerializedCharacteristicConstraints_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

void sub_1CCE410E0(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_1CCE416B8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

uint64_t HAPAccessoryServerDiscoveryMethod(uint64_t a1)
{
  if (a1)
    return 2;
  else
    return 1;
}

void sub_1CCE45910(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CCE459FC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

uint64_t verifyResponseStateAndError(void *a1)
{
  id v1;
  uint64_t result;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");

  result = TLV8Get();
  if (!(_DWORD)result)
    return 4294960553;
  return result;
}

uint64_t appendRequestMethodAndState()
{
  uint64_t result;

  result = TLV8BufferAppendUInt64();
  if (!(_DWORD)result)
    return TLV8BufferAppendUInt64();
  return result;
}

void hap2LogInitialize()
{
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
}

void __hap2LogInitialize_block_invoke()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;
  os_log_t v4;
  void *v5;
  os_log_t v6;
  void *v7;

  v0 = os_log_create("com.apple.CoreHAP", "HAP");
  v1 = (void *)hap2Log_default;
  hap2Log_default = (uint64_t)v0;

  v2 = os_log_create("com.apple.CoreHAP", "Browser");
  v3 = (void *)hap2Log_browser;
  hap2Log_browser = (uint64_t)v2;

  v4 = os_log_create("com.apple.CoreHAP", "Accessory");
  v5 = (void *)hap2Log_accessory;
  hap2Log_accessory = (uint64_t)v4;

  v6 = os_log_create("com.apple.CoreHAP", "CoAP");
  v7 = (void *)hap2Log_coap;
  hap2Log_coap = (uint64_t)v6;

}

void sub_1CCE4A168(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCE4A340(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCE4A4C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCE4A648(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCE4C7C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCE4C9F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1871(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1872(uint64_t a1)
{

}

void sub_1CCE4E2FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCE4FACC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  uint64_t v6;
  va_list va;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  va_list va1;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va2;

  va_start(va2, a5);
  va_start(va1, a5);
  va_start(va, a5);
  v6 = va_arg(va1, _QWORD);
  v8 = va_arg(va1, _QWORD);
  v9 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  va_copy(va2, va1);
  v11 = va_arg(va2, _QWORD);
  v13 = va_arg(va2, _QWORD);
  v14 = va_arg(va2, _QWORD);
  v15 = va_arg(va2, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose(va2, 8);
  _Unwind_Resume(a1);
}

void sub_1CCE55D30(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCE55EE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1CCE561A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2514(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2515(uint64_t a1)
{

}

uint64_t _CopyPairingIdentityDelegateCallback_f_2554(uint64_t a1, char **a2, void *a3, void *a4, void *a5)
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  size_t v13;
  char *v14;
  char *v15;
  id v16;
  uint64_t *v17;
  void *v18;
  void *v19;
  void *v20;
  size_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  size_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  uint64_t v32;
  int v34;
  unsigned int v35;

  v35 = 0;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = 0;
    goto LABEL_17;
  }
  objc_msgSend(v8, "_handleLocalPairingIdentityRequestWithStatus:", &v35);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v35)
    goto LABEL_15;
  if (a2)
  {
    objc_msgSend(v9, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "lengthOfBytesUsingEncoding:", 4);

    if (!v12)
      goto LABEL_18;
    v13 = v12 + 1;
    v14 = (char *)malloc_type_calloc(v13, 1uLL, 0x100004077774924uLL);
    if (!v14)
    {
      v34 = -6728;
      goto LABEL_20;
    }
    v15 = v14;
    objc_msgSend(v10, "identifier");
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    strlcpy(v15, (const char *)objc_msgSend(v16, "UTF8String"), v13);

    *a2 = v15;
  }
  v17 = (uint64_t *)MEMORY[0x1E0D28030];
  if (!a3)
    goto LABEL_11;
  objc_msgSend(v10, "publicKey");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
    goto LABEL_17;
  objc_msgSend(v10, "publicKey");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "data");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "length");
  v22 = *v17;

  if (v21 != v22)
  {
LABEL_18:
    v34 = -6743;
    goto LABEL_20;
  }
  objc_msgSend(v10, "publicKey");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "data");
  v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  memcpy(a3, (const void *)objc_msgSend(v24, "bytes"), v21);

LABEL_11:
  if (a4)
  {
    objc_msgSend(v10, "privateKey");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      objc_msgSend(v10, "privateKey");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "data");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "length");
      v29 = *v17;

      if (v28 == v29)
      {
        objc_msgSend(v10, "privateKey");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "data");
        v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        memcpy(a4, (const void *)objc_msgSend(v31, "bytes"), v28);

        goto LABEL_15;
      }
      goto LABEL_18;
    }
LABEL_17:
    v34 = -6727;
LABEL_20:
    v35 = v34;
  }
LABEL_15:
  v32 = v35;

  return v32;
}

uint64_t _FindPairedPeerDelegateCallback_f_2555(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  size_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  int v22;
  unsigned int v23;

  v23 = 0;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = 0;
    v8 = 0;
    goto LABEL_11;
  }
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", a1, a2, 4);
  if (!v8)
  {
    v10 = 0;
    v22 = -6705;
    goto LABEL_15;
  }
  objc_msgSend(v7, "_handlePeerPairingIdentityRequestWithIdentifier:status:", v8, &v23);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v23)
  {
    objc_msgSend(v9, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v8, "isEqualToString:", v11);

    if ((v12 & 1) == 0)
    {
      v22 = -6748;
      goto LABEL_15;
    }
    if (a3)
    {
      objc_msgSend(v10, "publicKey");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(v10, "publicKey");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "data");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "length");
        v17 = *MEMORY[0x1E0D28030];

        if (v16 == v17)
        {
          objc_msgSend(v10, "publicKey");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "data");
          v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          memcpy(a3, (const void *)objc_msgSend(v19, "bytes"), v16);

          goto LABEL_9;
        }
        v22 = -6743;
LABEL_15:
        v23 = v22;
        goto LABEL_9;
      }
LABEL_11:
      v22 = -6727;
      goto LABEL_15;
    }
  }
LABEL_9:
  v20 = v23;

  return v20;
}

__CFString *HAPWiFiConfigurationOperationTypeAsString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) < 4)
    return off_1E8949ED8[a1 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown HAPWiFiConfigurationOperationType %ld"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *HAPWiFiSecurityModeAsString(uint64_t a1)
{
  __CFString *v1;

  if (!a1)
    return CFSTR("HAPWiFiSecurityModeNone");
  if (a1 == 1)
  {
    v1 = CFSTR("HAPWiFiSecurityModeWPA2PSK");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown HAPWiFiSecurityMode %ld"), a1);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

void sub_1CCE5BBDC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

__CFString *HAPDiagnosticsSnapshotAudioAsString(unint64_t a1)
{
  id v2;
  uint64_t v3;
  unint64_t v4;
  const __CFString *v5;
  void *v6;
  __CFString *v7;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (!a1)
    goto LABEL_12;
  v3 = 1;
  v4 = a1;
  do
  {
    if ((v3 & a1) == 0)
      goto LABEL_9;
    if (v3 == 1)
    {
      v5 = CFSTR("HAPDiagnosticsSnapshotAudioAudioRecording");
    }
    else
    {
      if (v3 != 2)
        goto LABEL_9;
      v5 = CFSTR("HAPDiagnosticsSnapshotAudioAudioClips");
    }
    v4 &= ~v3;
    objc_msgSend(v2, "addObject:", v5);
LABEL_9:
    v3 *= 2;
  }
  while (v3 - 1 < a1);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown options %lu"), v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v6);

  }
LABEL_12:
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "componentsJoinedByString:", CFSTR(", "));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = CFSTR("None");
  }

  return v7;
}

__CFString *HAPDiagnosticsSnapshotOptionsAsString(unint64_t a1)
{
  id v2;
  uint64_t v3;
  unint64_t v4;
  const __CFString *v5;
  void *v6;
  __CFString *v7;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (!a1)
    goto LABEL_12;
  v3 = 1;
  v4 = a1;
  do
  {
    if ((v3 & a1) == 0)
      goto LABEL_9;
    if (v3 == 1)
    {
      v5 = CFSTR("HAPDiagnosticsSnapshotOptionDelay");
    }
    else
    {
      if (v3 != 2)
        goto LABEL_9;
      v5 = CFSTR("HAPDiagnosticsSnapshotOptionConfigurableMaxSize");
    }
    v4 &= ~v3;
    objc_msgSend(v2, "addObject:", v5);
LABEL_9:
    v3 *= 2;
  }
  while (v3 - 1 < a1);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown options %lu"), v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v6);

  }
LABEL_12:
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "componentsJoinedByString:", CFSTR(", "));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = CFSTR("None");
  }

  return v7;
}

__CFString *HAPDiagnosticsSnapshotTypeAsString(unint64_t a1)
{
  id v2;
  uint64_t v3;
  unint64_t v4;
  const __CFString *v5;
  void *v6;
  __CFString *v7;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (!a1)
    goto LABEL_12;
  v3 = 1;
  v4 = a1;
  do
  {
    if ((v3 & a1) == 0)
      goto LABEL_9;
    if (v3 == 1)
    {
      v5 = CFSTR("HAPDiagnosticsSnapshotTypeManufacturerSnapshot");
    }
    else
    {
      if (v3 != 2)
        goto LABEL_9;
      v5 = CFSTR("HAPDiagnosticsSnapshotTypeADKSnapshot");
    }
    v4 &= ~v3;
    objc_msgSend(v2, "addObject:", v5);
LABEL_9:
    v3 *= 2;
  }
  while (v3 - 1 < a1);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown options %lu"), v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v6);

  }
LABEL_12:
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "componentsJoinedByString:", CFSTR(", "));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = CFSTR("None");
  }

  return v7;
}

void sub_1CCE65588(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCE656E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCE658A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCE6597C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCE65B10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCE65C9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCE65D90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCE65FC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCE660E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCE66530(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCE66638(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4013(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4014(uint64_t a1)
{

}

void sub_1CCE66D88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCE670AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCE67364(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCE67520(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCE67794(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23)
{
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a23, 8);
  _Unwind_Resume(a1);
}

void sub_1CCE67CE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_1CCE68040(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *HAPNFCAccessKeyStateAsString(uint64_t a1)
{
  __CFString *v1;

  if (!a1)
    return CFSTR("HAPNFCAccessKeyStateSuspended");
  if (a1 == 1)
  {
    v1 = CFSTR("HAPNFCAccessKeyStateActive");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown HAPNFCAccessKeyState %ld"), a1);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

__CFString *HAPNFCAccessKeyTypeAsString(uint64_t a1)
{
  __CFString *v1;

  if (a1 == 1)
    return CFSTR("HAPNFCAccessKeyTypeEd25519");
  if (a1 == 2)
  {
    v1 = CFSTR("HAPNFCAccessKeyTypeNIST256");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown HAPNFCAccessKeyType %ld"), a1);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

__CFString *HAPNFCAccessOperationTypeAsString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) < 3)
    return off_1E894A008[a1 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown HAPNFCAccessOperationType %ld"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *HAPNFCAccessResponseStatusAsString(unint64_t a1)
{
  if (a1 < 5)
    return off_1E894A020[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown HAPNFCAccessResponseStatus %ld"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

const __CFString *HAPAccessoryServerDiscoveryMethodToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2)
    return CFSTR("Keystore");
  else
    return off_1E894A048[a1 - 1];
}

__CFString *HAPAccessCodeOperationTypeAsString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) < 5)
    return off_1E894A060[a1 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown HAPAccessCodeOperationType %ld"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *HAPAccessCodeResponseStatusAsString(unint64_t a1)
{
  if (a1 < 0xA)
    return off_1E894A088[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown HAPAccessCodeResponseStatus %ld"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *HAP2TLVErrorsAsString(uint64_t a1)
{
  __CFString *v1;

  if (a1 == 1)
    return CFSTR("HAP2TLVErrorsUnknown");
  if (a1 == 2)
  {
    v1 = CFSTR("HAP2TLVErrorsAuthentication");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown HAP2TLVErrors %ld"), a1);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

__CFString *HAP2TLVPairingStateAsString(uint64_t a1)
{
  __CFString *v1;

  if (a1 == 1)
    return CFSTR("HAP2TLVPairingStateM1");
  if (a1 == 2)
  {
    v1 = CFSTR("HAP2TLVPairingStateM2");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown HAP2TLVPairingState %ld"), a1);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

void sub_1CCE6A420(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CCE6ADE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
  uint64_t v36;

  _Block_object_dispose(&a24, 8);
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose(&a36, 8);
  _Block_object_dispose((const void *)(v36 - 216), 8);
  _Block_object_dispose((const void *)(v36 - 168), 8);
  _Block_object_dispose((const void *)(v36 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_1CCE6C0B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1CCE6C598(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  uint64_t v32;

  _Block_object_dispose(&a20, 8);
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose((const void *)(v32 - 168), 8);
  _Block_object_dispose((const void *)(v32 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_1CCE6CAE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCE6CBC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCE6CE48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCE6D1C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  uint64_t v13;
  va_list va;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v13 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  v19 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 160), 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1CCE6D318(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1CCE6D558(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCE6D988(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1CCE6DF64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1CCE6E804(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1CCE6E954(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1CCE6EA80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1CCE6ED00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCE7053C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1CCE70914(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  uint64_t v14;
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v14 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_1CCE70A64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1CCE70D50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1CCE71100(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCE71220(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1CCE72614(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_1CCE7283C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _deserializeDataToKeyPair(void *a1, uint64_t a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v5 = a1;
  v6 = 0;
  v7 = 4294960591;
  if (!v5 || !a2)
  {
    v8 = 0;
    v9 = 0;
    v10 = 0;
    goto LABEL_14;
  }
  v8 = 0;
  v9 = 0;
  v10 = 0;
  if (!a3)
    goto LABEL_14;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v5, 4);
  v6 = v11;
  if (!v11)
  {
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v7 = 4294960563;
    goto LABEL_14;
  }
  if (objc_msgSend(v11, "length") != 129)
  {
    v8 = 0;
    v9 = 0;
    v10 = 0;
    goto LABEL_21;
  }
  objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("+"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v12;
  if (!v12)
  {
    v8 = 0;
    v9 = 0;
    v7 = 4294960579;
    goto LABEL_14;
  }
  if (objc_msgSend(v12, "count") != 2)
  {
    v8 = 0;
    v9 = 0;
    v7 = 4294960532;
    goto LABEL_14;
  }
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length") != 64)
  {
    v9 = 0;
    goto LABEL_21;
  }
  objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length") != 64)
    goto LABEL_21;
  v8 = objc_retainAutorelease(v8);
  v13 = _deserializePublicKey(objc_msgSend(v8, "UTF8String"), objc_msgSend(v8, "length"));
  if ((_DWORD)v13)
  {
    v7 = v13;
    goto LABEL_14;
  }
  v9 = objc_retainAutorelease(v9);
  objc_msgSend(v9, "UTF8String");
  if (objc_msgSend(v9, "length") != 64 || (v7 = HexToData(), !(_DWORD)v7))
LABEL_21:
    v7 = 4294960553;
LABEL_14:

  return v7;
}

uint64_t _deserializePublicKey(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2 != 64)
    return 4294960553;
  LODWORD(result) = HexToData();
  if ((_DWORD)result)
    return result;
  else
    return 4294960553;
}

uint64_t _serializeKeyPairToData(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t result;
  void *v6;
  id v7;
  _BYTE __s[65];
  _BYTE v9[65];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  result = 4294960591;
  if (a1 && a2)
  {
    if (a3)
    {
      DataToHexCStringEx();
      DataToHexCStringEx();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s+%s"), v9, __s);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dataUsingEncoding:", 4);
      v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a3 = v7;
      memset_s(__s, 0x41uLL, 0, 0x41uLL);

      return 0;
    }
  }
  return result;
}

id __viewHintForKeyType(void *a1)
{
  uint64_t v1;
  id v2;
  uint64_t v3;
  id *v4;

  v1 = objc_msgSend(a1, "unsignedIntegerValue");
  v2 = 0;
  if (v1 <= 1752001329)
  {
    if (v1 <= 1751998828)
    {
      if (v1 != 1651209584)
      {
        if (v1 == 1751216227)
        {
          v4 = (id *)MEMORY[0x1E0CD6828];
LABEL_15:
          v2 = *v4;
          return v2;
        }
        return v2;
      }
    }
    else if ((unint64_t)(v1 - 1751998829) >= 2)
    {
      v3 = 1751999337;
      goto LABEL_13;
    }
LABEL_14:
    v4 = (id *)MEMORY[0x1E0CD6808];
    goto LABEL_15;
  }
  if (v1 > 1852203848)
  {
    if (v1 == 1852203858)
      goto LABEL_14;
    v3 = 1852203849;
  }
  else
  {
    if (v1 == 1752001330)
      goto LABEL_14;
    v3 = 1836348530;
  }
LABEL_13:
  if (v1 == v3)
    goto LABEL_14;
  return v2;
}

const char *KeyTypeDescription(void *a1)
{
  uint64_t v1;

  v1 = objc_msgSend(a1, "unsignedIntegerValue");
  if (v1 <= 1751998828)
  {
    if (v1 <= 1751216194)
    {
      switch(v1)
      {
        case 1651209584:
          return "bkup";
        case 1751216193:
          return "hapA";
        case 1751216194:
          return "hapB";
      }
    }
    else if (v1 > 1751216210)
    {
      if (v1 == 1751216211)
        return "hapS";
      if (v1 == 1751216227)
        return "hapc";
    }
    else
    {
      if (v1 == 1751216195)
        return "hapC";
      if (v1 == 1751216205)
        return "hapM";
    }
  }
  else if (v1 > 1752001640)
  {
    if (v1 > 1852203848)
    {
      if (v1 == 1852203849)
        return "nfcI";
      if (v1 == 1852203858)
        return "nfcR";
    }
    else
    {
      if (v1 == 1752001641)
        return "hmli";
      if (v1 == 1836348530)
        return "mttr";
    }
  }
  else if (v1 > 1751999336)
  {
    if (v1 == 1751999337)
      return "hmci";
    if (v1 == 1752001330)
      return "hmk2";
  }
  else
  {
    if (v1 == 1751998829)
      return "hmam";
    if (v1 == 1751998830)
      return "hmams";
  }
  return "unknown";
}

uint64_t __Block_byref_object_copy__4793(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4794(uint64_t a1)
{

}

void sub_1CCE78384(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _deserializeUUID(void *a1, _QWORD *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a1;
  v4 = 4294960591;
  if (v3 && a2)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", objc_msgSend(objc_retainAutorelease(v3), "bytes"));
    if (v5)
    {
      v6 = objc_retainAutorelease(v5);
      *a2 = v6;

      v4 = 0;
    }
    else
    {
      v4 = 4294960579;
    }
  }

  return v4;
}

uint64_t deviceSupportsKeychainSync()
{
  void *v0;
  NSObject *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  unint64_t v5;
  int v7;
  void *v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (HAPIsHH2Enabled_onceToken != -1)
    dispatch_once(&HAPIsHH2Enabled_onceToken, &__block_literal_global_11472);
  if (HAPIsHH2Enabled_hh2Enabled == 1)
  {
    v0 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543618;
      v8 = v2;
      v9 = 2080;
      v10 = "BOOL deviceSupportsKeychainSync(void)";
      _os_log_impl(&dword_1CCE01000, v1, OS_LOG_TYPE_INFO, "%{public}@%s always returns YES because HAPIsHH2Enabled() is true)", (uint8_t *)&v7, 0x16u);

    }
    objc_autoreleasePoolPop(v0);
    return 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D286B8], "systemInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "productPlatform");
    v3 = (v5 < 6) & (0x26u >> v5);

  }
  return v3;
}

void sub_1CCE7B07C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1CCE7B28C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5044(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5045(uint64_t a1)
{

}

void sub_1CCE81BD4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(a1);
}

void sub_1CCE82660(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCE842B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, id *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,char a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,id a58)
{
  objc_destroyWeak(location);
  objc_destroyWeak(a12);
  _Block_object_dispose(&a46, 8);
  _Block_object_dispose(&a52, 8);
  objc_destroyWeak(&a58);
  _Unwind_Resume(a1);
}

id mapUnderlyingErrorToHAPError(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = v1;
  if (v1)
  {
    v10 = *MEMORY[0x1E0CB3388];
    v11[0] = v1;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  objc_msgSend(v2, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)*MEMORY[0x1E0CB2F90];

  if (v4 != v5)
    goto LABEL_5;
  v9 = objc_msgSend(v2, "code");
  if (v9 <= 52)
  {
    if (v9 == -6722)
    {
      v6 = 25;
      goto LABEL_6;
    }
    if (v9 == -3936 || v9 == 5)
    {
      v6 = 26;
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  v6 = 8;
  if ((unint64_t)(v9 - 53) >= 2 && v9 != 61)
LABEL_5:
    v6 = 22;
LABEL_6:
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), v6, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __Block_byref_object_copy__5472(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5473(uint64_t a1)
{

}

void sub_1CCE85A80(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1CCE85EA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CCE86308(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1CCE866E0(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void joinComplete(int a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  int v8;

  v3 = a2;
  objc_msgSend(v3, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __joinComplete_block_invoke;
  v6[3] = &unk_1E894D748;
  v7 = v3;
  v8 = a1;
  v5 = v3;
  dispatch_async(v4, v6);

}

uint64_t __joinComplete_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_joinCompleteWithStatus:", *(unsigned int *)(a1 + 40));
}

Class __getCWFInterfaceClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!CoreWiFiLibraryCore_frameworkLibrary)
  {
    CoreWiFiLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!CoreWiFiLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("CWFInterface");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)abort_report_np();
    free(v3);
  }
  getCWFInterfaceClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1CCE86FF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  id *v24;

  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CCE87360(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1CCE87800(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1CCE87944(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1CCE8A1BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCE8EF84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location)
{
  uint64_t v11;

  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v11 - 160));
  _Unwind_Resume(a1);
}

void sub_1CCE90224(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CCE930F8(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCE9329C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCE93448(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCE934E4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCE93688(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCE93834(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCE952E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id _notificationContextTLVDataFromPayload(uint64_t a1, unint64_t a2, uint64_t a3, void *a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  HAPTLVUnsignedNumberValue *v21;
  void *v22;
  HAPTLVUnsignedNumberValue *v23;
  HAPNotificationContextSourceWrapper *v24;
  HAPCharacteristicNotificationContext *v25;
  id v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  _BYTE v36[10];
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a3 + 5;
  if (a3 + 5 <= a2)
  {
    v14 = a1 + a3;
    v15 = *(unsigned int *)(a1 + a3);
    v16 = *(unsigned __int8 *)(v14 + 4);
    v17 = (void *)MEMORY[0x1D17B7244]();
    v18 = v7;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v34 = v20;
      v35 = 1024;
      *(_DWORD *)v36 = v15;
      *(_WORD *)&v36[4] = 1024;
      *(_DWORD *)&v36[6] = v16;
      _os_log_impl(&dword_1CCE01000, v19, OS_LOG_TYPE_DEBUG, "%{public}@Notification context identifier: 0x%x source: 0x%x", buf, 0x18u);

    }
    objc_autoreleasePoolPop(v17);
    v21 = [HAPTLVUnsignedNumberValue alloc];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v15);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[HAPTLVNumberValueBase initWithValue:](v21, "initWithValue:", v22);

    v24 = -[HAPNotificationContextSourceWrapper initWithValue:]([HAPNotificationContextSourceWrapper alloc], "initWithValue:", v16);
    v25 = -[HAPCharacteristicNotificationContext initWithContextIdentifier:source:clockTickCounter:]([HAPCharacteristicNotificationContext alloc], "initWithContextIdentifier:source:clockTickCounter:", v23, v24, 0);
    v32 = 0;
    -[HAPCharacteristicNotificationContext serializeWithError:](v25, "serializeWithError:", &v32);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v32;
    if (v26)
    {
      v27 = (void *)MEMORY[0x1D17B7244]();
      v28 = v18;
      HMFGetOSLogHandle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v34 = v30;
        v35 = 2114;
        *(_QWORD *)v36 = v26;
        _os_log_impl(&dword_1CCE01000, v29, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode notification context with error: %{public}@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v27);
    }

  }
  else
  {
    v9 = (void *)MEMORY[0x1D17B7244]();
    v10 = v7;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v34 = v12;
      v35 = 2048;
      *(_QWORD *)v36 = a2;
      *(_WORD *)&v36[8] = 2048;
      v37 = v8;
      _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_ERROR, "%{public}@Received notification context of invalid length:%lu:%lu in payload", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
    v13 = 0;
  }

  return v13;
}

uint64_t __Block_byref_object_copy__6128(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6129(uint64_t a1)
{

}

void sub_1CCE98A70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCE98B34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCE99570(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCE99D20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CCE9A008(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6303(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6304(uint64_t a1)
{

}

void sub_1CCE9A854(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CCE9ACF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1CCE9B370(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CCE9B920(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a25, 8);
  _Unwind_Resume(a1);
}

__CFString *HAPCharacteristicValueTransitionEndBehaviorAsString(uint64_t a1)
{
  __CFString *v1;

  if (!a1)
    return CFSTR("HAPCharacteristicValueTransitionEndBehaviorNoChange");
  if (a1 == 1)
  {
    v1 = CFSTR("HAPCharacteristicValueTransitionEndBehaviorLoop");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown HAPCharacteristicValueTransitionEndBehavior %ld"), a1);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

__CFString *HAPCharacteristicValueTransitionLinearStartConditionAsString(unint64_t a1)
{
  if (a1 < 3)
    return off_1E894A990[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown HAPCharacteristicValueTransitionLinearStartCondition %ld"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *HAPFirmwareUpdateStateAsString(unint64_t a1)
{
  if (a1 < 5)
    return off_1E894A9A8[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown HAPFirmwareUpdateState %ld"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *HAPOTAProviderStateAsString(unint64_t a1)
{
  if (a1 < 7)
    return off_1E894A9D0[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown HAPOTAProviderState %ld"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

void sub_1CCE9E648(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

void sub_1CCE9FC0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  id *v24;
  id *v25;

  objc_destroyWeak(v25);
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CCEA7D74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location,uint64_t a22,char a23)
{
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  __HMFActivityScopeLeave();
  _Unwind_Resume(a1);
}

void sub_1CCEA8580(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location)
{
  id *v27;

  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  __HMFActivityScopeLeave();
  _Unwind_Resume(a1);
}

void sub_1CCEA89F8(_Unwind_Exception *a1)
{
  __HMFActivityScopeLeave();
  _Unwind_Resume(a1);
}

void sub_1CCEA8CFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,id location)
{
  id *v25;

  objc_destroyWeak(v25);
  __HMFActivityScopeLeave();
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CCEA9FE8(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x3D0], 8);
  _Unwind_Resume(a1);
}

void sub_1CCEAAE44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CCEAB310(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CCEAB668(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a20);
  _Unwind_Resume(a1);
}

void sub_1CCEACC08(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_1CCEACF08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CCEAD048(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1CCEAD568(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  id *v4;
  uint64_t v5;

  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v5 - 112));
  objc_destroyWeak((id *)(v5 - 104));
  _Unwind_Resume(a1);
}

void sub_1CCEAF2C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CCEB0304(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CCEB08B0(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1CCEB1484(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCEB1C24(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1CCEB37F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCEB8DD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CCEB9654(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1CCEBA424(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1CCEBA778(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1CCEBB328(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

void _callCharacteristicOperationCompletion(void *a1, void *a2, int a3, void *a4, void *a5)
{
  void (**v9)(id, id, void *);
  unint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a1;
  v9 = a2;
  v10 = a4;
  v11 = a5;
  v12 = (void *)v11;
  if (v9)
  {
    if (!(v10 | v11))
    {
      v17 = 0;
LABEL_14:
      v9[2](v9, v20, v17);

      goto LABEL_15;
    }
    switch(a3)
    {
      case 3:
        v18 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v20, "shortDescription");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stringWithFormat:", CFSTR("Failed to configure characteristic %@."), v14);
        break;
      case 2:
        v19 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v20, "shortDescription");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "stringWithFormat:", CFSTR("Failed to write to characteristic %@."), v14);
        break;
      case 1:
        v13 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v20, "shortDescription");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringWithFormat:", CFSTR("Failed to read from characteristic %@."), v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 14;
LABEL_11:

LABEL_13:
        objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", v16, v15, v12, 0, v10);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_14;
      default:
        v15 = 0;
        v16 = 1;
        goto LABEL_13;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 13;
    goto LABEL_11;
  }
LABEL_15:

}

void sub_1CCEBEAB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7162(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7163(uint64_t a1)
{

}

void sub_1CCEC1CD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  id *v25;

  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id _parseCharacteristicInstanceID(void *a1, _QWORD *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v9;

  v3 = a1;
  +[HAPDataValueTransformer defaultDataValueTransformer](HAPDataValueTransformer, "defaultDataValueTransformer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 0;
  objc_msgSend(v4, "reverseTransformedValue:format:error:", v5, 2, &v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v9;

  if (a2 && !v6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 12, CFSTR("Invalid Characteristic Instance ID value."), 0, 0, v7);
    *a2 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

uint64_t _isServiceInstanceIDCharacteristic(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v1 = a1;
  objc_msgSend(v1, "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("E604E95D-A759-4817-87D3-AA005083A0D1"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqual:", v3) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(v1, "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("00000051-0000-1000-8000-0026BB765291"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isEqual:", v6);

  }
  return v4;
}

id _parseServiceInstanceID(void *a1, _QWORD *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v9;

  v3 = a1;
  +[HAPDataValueTransformer defaultDataValueTransformer](HAPDataValueTransformer, "defaultDataValueTransformer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 0;
  objc_msgSend(v4, "reverseTransformedValue:format:error:", v5, 2, &v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v9;

  if (a2 && !v6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 12, CFSTR("Invalid Service Instance ID value."), 0, 0, v7);
    *a2 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

uint64_t _isServiceSignatureCharacteristic(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "UUID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("000000A5-0000-1000-8000-0026BB765291"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "isEqual:", v2);

  return v3;
}

void sub_1CCEC3184(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CCEC33C8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1CCEC34F8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id _createCharacteristicWriteBody(void *a1, uint64_t a2, void *a3, int a4, void *a5, _QWORD *a6, double a7)
{
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t appended;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;

  v13 = a3;
  v14 = a5;
  v15 = a1;
  TLV8BufferInit();
  +[HAPDataValueTransformer defaultDataValueTransformer](HAPDataValueTransformer, "defaultDataValueTransformer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "transformedValue:format:error:", v15, a2, a6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    v21 = 0;
LABEL_18:
    v20 = 0;
    goto LABEL_4;
  }
  v18 = objc_retainAutorelease(v17);
  objc_msgSend(v18, "bytes");
  objc_msgSend(v18, "length");
  appended = TLV8BufferAppend();
  if (!(_DWORD)appended)
  {
    if (!v13
      || (v25 = objc_retainAutorelease(v13),
          objc_msgSend(v25, "bytes"),
          objc_msgSend(v25, "length"),
          appended = TLV8BufferAppend(),
          !(_DWORD)appended))
    {
      if (a7 <= 0.0)
        goto LABEL_24;
      if (!(unint64_t)(a7 * 10.0))
      {
        v21 = 0;
        v20 = 4294960559;
        goto LABEL_4;
      }
      appended = TLV8BufferAppendUInt64();
      if (!(_DWORD)appended)
      {
LABEL_24:
        if (!a4 || (appended = TLV8BufferAppendUInt64(), !(_DWORD)appended))
        {
          if (!objc_msgSend(v14, "length", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                  0,
                  0,
                  0,
                  0,
                  0,
                  0,
                  0,
                  0,
                  0,
                  0,
                  0,
                  0,
                  0,
                  0,
                  0,
                  0,
                  0,
                  0,
                  0,
                  0,
                  0,
                  0,
                  0,
                  0,
                  0)
            || (v26 = objc_retainAutorelease(v14),
                objc_msgSend(v26, "bytes"),
                objc_msgSend(v26, "length"),
                appended = TLV8BufferAppend(),
                !(_DWORD)appended))
          {
            objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v27, v28);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v21)
            {
              v20 = 4294960568;
              goto LABEL_4;
            }
            goto LABEL_18;
          }
        }
      }
    }
  }
  v20 = appended;
  v21 = 0;
LABEL_4:
  TLV8BufferFree();
  if (a6 && (_DWORD)v20)
  {
    v22 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithOSStatus:", v20);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "hapErrorWithCode:description:reason:suggestion:underlyingError:", 12, CFSTR("Write failed."), CFSTR("Failed to create write request body."), 0, v23);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v21;
}

uint64_t _parseLinkedServices(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unsigned __int16 v11;

  v5 = a1;
  v6 = a2;
  if ((unint64_t)objc_msgSend(v5, "length") < 2 || (objc_msgSend(v5, "length") & 1) != 0)
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 12, CFSTR("Linked services has invalid value field."), 0, 0, 0);
      v9 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    if ((unint64_t)objc_msgSend(v5, "length") >= 2)
    {
      do
      {
        v7 = v5;
        v11 = 0;
        objc_msgSend(v5, "getBytes:length:", &v11, 2);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v8);

        objc_msgSend(v7, "subdataWithRange:", 2, objc_msgSend(v7, "length") - 2);
        v5 = (id)objc_claimAutoreleasedReturnValue();

      }
      while ((unint64_t)objc_msgSend(v5, "length") > 1);
    }
    v9 = 1;
  }

  return v9;
}

uint64_t _parseBTLEPresentationFormat(void *a1, uint64_t a2, _QWORD *a3)
{
  id v5;
  uint64_t v6;
  int v7;
  int v8;
  int v9;
  char v11;
  unsigned __int8 v12;
  __int16 v13;
  unsigned __int8 v14;
  unsigned __int16 v15;

  v5 = a1;
  if ((unint64_t)objc_msgSend(v5, "length") > 6)
  {
    if (!a2)
      goto LABEL_11;
    objc_msgSend(v5, "getBytes:length:", &v11, 7);
    *(_BYTE *)a2 = v11;
    v7 = v12;
    *(_BYTE *)(a2 + 1) = v12;
    *(_WORD *)(a2 + 2) = v13;
    v8 = v14;
    *(_BYTE *)(a2 + 4) = v14;
    v9 = v15;
    *(_WORD *)(a2 + 6) = v15;
    if (!v7 && v8 == 1 && !v9)
    {
LABEL_11:
      v6 = 1;
      goto LABEL_12;
    }
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 12, CFSTR("Invalid characteristic format descriptor value."), 0, 0, 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_8;
  }
  if (!a3)
  {
LABEL_8:
    v6 = 0;
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 12, CFSTR("Invalid characteristic format descriptor value length."), 0, 0, 0);
  v6 = 0;
  *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v6;
}

uint64_t _parseHAPCharacteristicFormat(unsigned __int8 a1, _QWORD *a2, _QWORD *a3)
{
  void *v4;

  if ((a1 - 1) < 0x1Bu && ((0x50AAAA9u >> (a1 - 1)) & 1) != 0)
  {
    if (a2)
      *a2 = qword_1CCFA3188[(a1 - 1)];
    return 1;
  }
  else
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid characteristic format type, %u"), a1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 12, v4, 0, 0, 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
    return 0;
  }
}

uint64_t _parseHAPCharacteristicUnit(int a1, uint64_t *a2, _QWORD *a3)
{
  uint64_t v4;
  void *v6;

  if (HIWORD(a1) > 0x2730u)
  {
    switch(HIWORD(a1))
    {
      case 0x2731u:
        v4 = 5;
        if (!a2)
          return 1;
        break;
      case 0x2763u:
        v4 = 2;
        if (!a2)
          return 1;
        break;
      case 0x27ADu:
        v4 = 4;
        if (!a2)
          return 1;
        break;
      default:
        goto LABEL_21;
    }
LABEL_19:
    *a2 = v4;
    return 1;
  }
  switch(HIWORD(a1))
  {
    case 0x2700u:
      v4 = 0;
      if (!a2)
        return 1;
      goto LABEL_19;
    case 0x2703u:
      v4 = 1;
      if (!a2)
        return 1;
      goto LABEL_19;
    case 0x272Fu:
      v4 = 3;
      if (!a2)
        return 1;
      goto LABEL_19;
  }
LABEL_21:
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid characteristic unit type, %04x"), HIWORD(a1));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 12, v6, 0, 0, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

BOOL _parseCharacteristicValidRange(void *a1, uint64_t a2, void *a3, _QWORD *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  NSObject *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  unint64_t v36;
  id v37;
  id v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a3;
  if (!objc_msgSend(v7, "length") || (objc_msgSend(v7, "length") & 1) != 0)
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 12, CFSTR("The characteristic valid range value length must be a multiple of 2."), 0, 0, 0);
      v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
LABEL_8:
    v12 = 0;
    goto LABEL_9;
  }
  if ((unint64_t)(a2 - 12) < 4 || a2 == 9)
  {
    if (a4)
    {
      v9 = (void *)MEMORY[0x1E0CB3940];
      HAPCharacteristicFormatToString(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("Characteristics with format type '%@' do not support valid ranges"), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 12, v11, 0, 0, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_8;
  }
  v14 = (unint64_t)objc_msgSend(v7, "length") >> 1;
  v15 = (unint64_t)objc_msgSend(v7, "length") >> 1;
  objc_msgSend(v7, "subdataWithRange:", 0, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "subdataWithRange:", v14, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = a2 - 11;
  if ((unint64_t)(a2 - 11) >= 3)
    v18 = a2;
  else
    v18 = 2;
  +[HAPDataValueTransformer defaultDataValueTransformer](HAPDataValueTransformer, "defaultDataValueTransformer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0;
  objc_msgSend(v19, "reverseTransformedValue:format:error:", v16, v18, &v38);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v38;

  if (v20)
  {
    v35 = v16;
    +[HAPDataValueTransformer defaultDataValueTransformer](HAPDataValueTransformer, "defaultDataValueTransformer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v21;
    v34 = v17;
    objc_msgSend(v22, "reverseTransformedValue:format:error:", v17, v18, &v37);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v37;

    v12 = v23 != 0;
    if (v23)
    {
      if (v36 > 2)
      {
        v25 = v20;
        objc_msgSend(v8, "setMinimumValue:", v20);
        objc_msgSend(v8, "setMaximumValue:", v23);
      }
      else
      {
        v25 = v20;
        if (objc_msgSend(v20, "longLongValue") >= 1)
          objc_msgSend(v8, "setMinLength:", v20);
        objc_msgSend(v8, "setMaxLength:", v23);
      }
    }
    else
    {
      v31 = (void *)MEMORY[0x1D17B7244]();
      HMFGetOSLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v40 = v33;
        v41 = 2112;
        v42 = v24;
        _os_log_impl(&dword_1CCE01000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@[HAPBTLE] Failed to transform upper value with error: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v31);
      v17 = v34;
      v25 = v20;
      if (a4)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 12, CFSTR("Failed to parse upper value"), 0, 0, v24);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }

    v16 = v35;
  }
  else
  {
    v26 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = v21;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v29 = v16;
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v40 = v30;
      v41 = 2112;
      v42 = v28;
      _os_log_impl(&dword_1CCE01000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@[HAPBTLE] Failed to transform lower value with error: %@", buf, 0x16u);

      v16 = v29;
    }

    objc_autoreleasePoolPop(v26);
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 12, CFSTR("Failed to parse lower value"), 0, 0, v28);
      v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
    v24 = v28;
    v25 = 0;
  }

LABEL_9:
  return v12;
}

BOOL _parseCharacteristicStepValue(void *a1, uint64_t a2, void *a3, _QWORD *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a3;
  if (!objc_msgSend(v7, "length"))
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 12, CFSTR("The characteristic step value length must be greater than 0."), 0, 0, 0);
      v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
LABEL_7:
    v12 = 0;
    goto LABEL_8;
  }
  if ((unint64_t)(a2 - 11) < 5 || a2 == 9)
  {
    if (a4)
    {
      v9 = (void *)MEMORY[0x1E0CB3940];
      HAPCharacteristicFormatToString(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("Characteristics with format type '%@' do not support step value"), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 12, v11, 0, 0, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_7;
  }
  +[HAPDataValueTransformer defaultDataValueTransformer](HAPDataValueTransformer, "defaultDataValueTransformer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  objc_msgSend(v14, "reverseTransformedValue:format:error:", v7, a2, &v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v20;

  v12 = v15 != 0;
  if (v15)
  {
    objc_msgSend(v8, "setStepValue:", v15);
  }
  else
  {
    v17 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v19;
      v23 = 2112;
      v24 = v16;
      _os_log_impl(&dword_1CCE01000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@[HAPBTLE] Failed to transform step value with error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 12, CFSTR("Failed to parse step value"), 0, 0, v16);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

LABEL_8:
  return v12;
}

BOOL _parseCharacteristicValidValues(void *a1, uint64_t a2, void *a3, _QWORD *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  const __CFString *v15;
  _BOOL8 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a3;
  if (!objc_msgSend(v7, "length"))
  {
    if (a4)
    {
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v14 = CFSTR("The characteristic valid values length must be greater than 0.");
      v15 = 0;
      goto LABEL_11;
    }
LABEL_14:
    v16 = 0;
    goto LABEL_15;
  }
  if ((unint64_t)(a2 - 16) >= 0xFFFFFFFFFFFFFFF5)
  {
    if (a4)
    {
      v17 = (void *)MEMORY[0x1E0CB3940];
      HAPCharacteristicFormatToString(a2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringWithFormat:", CFSTR("Characteristics with format type '%@' do not support valid values"), v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 12, v19, 0, 0, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_14;
  }
  if ((unint64_t)(a2 - 1) > 3 || (v9 = qword_1CCFA3260[a2 - 1], (objc_msgSend(v7, "length") & v9) != 0))
  {
    v10 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v12;
      _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@[HAPBTLE] Failed to extract valid values, total size is not a multiple of the format size", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    if (a4)
    {
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v14 = CFSTR("Failed to extract valid values");
      v15 = CFSTR("Total size is not a multiple of the format's size");
LABEL_11:
      objc_msgSend(v13, "hapErrorWithCode:description:reason:suggestion:underlyingError:", 12, v14, v15, 0, 0);
      v16 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  _getValuesFromData(v7, a2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count");
  v16 = v22 != 0;
  if (v22)
  {
    v23 = (void *)MEMORY[0x1D17B7244](objc_msgSend(v21, "sortUsingComparator:", &__block_literal_global_7448));
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v25;
      v31 = 2112;
      v32 = v21;
      _os_log_impl(&dword_1CCE01000, v24, OS_LOG_TYPE_DEBUG, "%{public}@[HAPBTLE] Setting valid values to : %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v23);
    objc_msgSend(v8, "setValidValues:", v21);
  }
  else
  {
    v26 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v28;
      _os_log_impl(&dword_1CCE01000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@[HAPBTLE] Failed to extract valid values", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v26);
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 12, CFSTR("Failed to extract valid values"), 0, 0, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

LABEL_15:
  return v16;
}

uint64_t _parseCharacteristicValidValuesRange(void *a1, uint64_t a2, void *a3, _QWORD *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  char v27;
  void *v28;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  _QWORD *v40;
  void *v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a3;
  if (objc_msgSend(v7, "length") && (objc_msgSend(v7, "length") & 1) == 0)
  {
    if ((unint64_t)(a2 - 16) < 0xFFFFFFFFFFFFFFF5)
    {
      v9 = (void *)MEMORY[0x1E0C99DE8];
      objc_msgSend(v8, "validValues");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "arrayWithArray:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if ((unint64_t)(a2 - 1) > 3 || (v12 = qword_1CCFA3260[a2 - 1], (objc_msgSend(v7, "length") & v12) != 0))
      {
        v13 = (void *)MEMORY[0x1D17B7244]();
        HMFGetOSLogHandle();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v43 = v15;
          _os_log_impl(&dword_1CCE01000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@[HAPBTLE] Failed to extract valid value range, total size is not a multiple of the format's size", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v13);
        if (a4)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 12, CFSTR("Failed to extract valid value range"), CFSTR("Total size is not a multiple of the format's size"), 0, 0);
          v16 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v16 = 0;
        }
        goto LABEL_38;
      }
      _getValuesFromData(v7, a2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v20, "count") & 1) != 0)
      {
        v33 = (void *)MEMORY[0x1D17B7244]();
        HMFGetOSLogHandle();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v43 = v35;
          _os_log_impl(&dword_1CCE01000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@[HAPBTLE] Failed to extract valid value range, valid value ranges are not pairs", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v33);
        if (a4)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 12, CFSTR("Failed to extract valid value range"), CFSTR("Valid value ranges are not pairs"), 0, 0);
          v16 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_37:

LABEL_38:
          goto LABEL_39;
        }
      }
      else
      {
        v40 = a4;
        v41 = v8;
        if (objc_msgSend(v20, "count"))
        {
          v21 = 0;
          do
          {
            objc_msgSend(v20, "objectAtIndex:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = v20;
            objc_msgSend(v20, "objectAtIndex:", v21 | 1);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v22, "integerValue");
            if (v25 <= objc_msgSend(v24, "integerValue"))
            {
              do
              {
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v25);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = objc_msgSend(v11, "containsObject:", v26);

                if ((v27 & 1) == 0)
                {
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v25);
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v11, "addObject:", v28);

                }
              }
              while (v25++ < objc_msgSend(v24, "integerValue"));
            }

            v21 += 2;
            v20 = v23;
          }
          while (v21 < objc_msgSend(v23, "count"));
        }
        if (objc_msgSend(v11, "count"))
        {
          v30 = (void *)MEMORY[0x1D17B7244](objc_msgSend(v11, "sortUsingComparator:", &__block_literal_global_1290));
          HMFGetOSLogHandle();
          v31 = objc_claimAutoreleasedReturnValue();
          v8 = v41;
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v43 = v32;
            v44 = 2112;
            v45 = v11;
            _os_log_impl(&dword_1CCE01000, v31, OS_LOG_TYPE_DEBUG, "%{public}@[HAPBTLE] Setting valid values to : %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v30);
          objc_msgSend(v41, "setValidValues:", v11);
          v16 = 1;
          goto LABEL_37;
        }
        v36 = (void *)MEMORY[0x1D17B7244]();
        HMFGetOSLogHandle();
        v37 = objc_claimAutoreleasedReturnValue();
        v8 = v41;
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v43 = v38;
          _os_log_impl(&dword_1CCE01000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@[HAPBTLE] Failed to extract valid values", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v36);
        if (v40)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 12, CFSTR("Failed to extract valid values"), 0, 0, 0);
          v16 = 0;
          *v40 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_37;
        }
      }
      v16 = 0;
      goto LABEL_37;
    }
    if (a4)
    {
      v17 = (void *)MEMORY[0x1E0CB3940];
      HAPCharacteristicFormatToString(a2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringWithFormat:", CFSTR("Characteristics with format type '%@' do not support valid values"), v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 12, v19, 0, 0, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_14;
  }
  if (!a4)
  {
LABEL_14:
    v16 = 0;
    goto LABEL_39;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 12, CFSTR("The characteristic valid values range length must be even"), 0, 0, 0);
  v16 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_39:

  return v16;
}

id _getValuesFromData(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v12;

  v3 = a1;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "length"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)(a2 - 1) > 3)
    v5 = 0;
  else
    v5 = qword_1CCFA3280[a2 - 1];
  if (objc_msgSend(v3, "length"))
  {
    v6 = 0;
    do
    {
      objc_msgSend(v3, "subdataWithRange:", v6, v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[HAPDataValueTransformer defaultDataValueTransformer](HAPDataValueTransformer, "defaultDataValueTransformer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 0;
      objc_msgSend(v8, "reverseTransformedValue:format:error:", v7, a2, &v12);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v12;

      if (!v10 && (objc_msgSend(v4, "containsObject:", v9) & 1) == 0)
        objc_msgSend(v4, "addObject:", v9);

      v6 += v5;
    }
    while (v6 < objc_msgSend(v3, "length"));
  }

  return v4;
}

uint64_t ___parseCharacteristicValidValuesRange_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t ___parseCharacteristicValidValues_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

id HAPTLVWriteSInt64(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  if (a1 == (char)a1)
  {
    LOBYTE(v3[0]) = a1;
    v1 = 1;
  }
  else
  {
    v3[0] = a1;
    v1 = 8;
  }
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v3, v1);
  return (id)objc_claimAutoreleasedReturnValue();
}

unint64_t HAPTLVParseSInt64(unsigned __int8 *a1, uint64_t a2, int *a3)
{
  unint64_t result;
  int v5;

  result = 0;
  v5 = -6743;
  switch(a2)
  {
    case 1:
      v5 = 0;
      result = (char)*a1;
      if (a3)
        goto LABEL_8;
      return result;
    case 2:
      v5 = 0;
      result = (__int16)(a1[1] << 8) | (unint64_t)*a1;
      if (a3)
        goto LABEL_8;
      return result;
    case 4:
      v5 = 0;
      result = *(int *)a1;
      goto LABEL_7;
    case 8:
      v5 = 0;
      result = *(_QWORD *)a1;
      if (!a3)
        return result;
      goto LABEL_8;
    default:
LABEL_7:
      if (a3)
LABEL_8:
        *a3 = v5;
      return result;
  }
}

id HAPTLVWriteUInt64(unint64_t a1)
{
  uint64_t v1;
  int v3;
  char v4;
  char v5;
  char v6;
  char v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a1 > 0xFF)
  {
    if (a1 >> 16)
    {
      v3 = a1;
      if (HIDWORD(a1))
      {
        v4 = BYTE4(a1);
        v5 = BYTE5(a1);
        v6 = BYTE6(a1);
        v7 = HIBYTE(a1);
        v1 = 8;
      }
      else
      {
        v1 = 4;
      }
    }
    else
    {
      LOWORD(v3) = a1;
      v1 = 2;
    }
  }
  else
  {
    LOBYTE(v3) = a1;
    v1 = 1;
  }
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v3, v1);
  return (id)objc_claimAutoreleasedReturnValue();
}

id HAPTLVCreateParseArrayToString(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\n%@["), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:", v6);

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v11), "descriptionWithIndent:", v4);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringWithFormat:", CFSTR(" %@"), v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendString:", v14);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\n%@]"), v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:", v15);

  v16 = (void *)objc_msgSend(v5, "copy");
  return v16;
}

id HAPDateWithTimeIntervalSince1970(void *a1)
{
  void *v1;
  void *v2;
  void *v3;

  if (a1)
  {
    v1 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(a1, "value");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "dateWithTimeIntervalSince1970:", (double)objc_msgSend(v2, "longLongValue"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

void sub_1CCECE648(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id HMErrorFromHAPIPStatusErrorCode(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v3 = 17;
  switch((unint64_t)a1)
  {
    case 0xFFFFFFFFFFFEECF3:
      v3 = 2405;
      goto LABEL_16;
    case 0xFFFFFFFFFFFEECF4:
      v3 = 48;
      goto LABEL_16;
    case 0xFFFFFFFFFFFEECF5:
      v3 = 87;
      goto LABEL_16;
    case 0xFFFFFFFFFFFEECF6:
      v3 = 3;
      goto LABEL_16;
    case 0xFFFFFFFFFFFEECF7:
      v3 = 2;
      goto LABEL_16;
    case 0xFFFFFFFFFFFEECF8:
      v3 = 8;
      goto LABEL_16;
    case 0xFFFFFFFFFFFEECF9:
      v3 = 16;
      goto LABEL_16;
    case 0xFFFFFFFFFFFEECFALL:
      v3 = 7;
      goto LABEL_16;
    case 0xFFFFFFFFFFFEECFBLL:
      v3 = 6;
      goto LABEL_16;
    case 0xFFFFFFFFFFFEECFCLL:
      v3 = 5;
      goto LABEL_16;
    case 0xFFFFFFFFFFFEECFDLL:
      v3 = 14;
      goto LABEL_16;
    case 0xFFFFFFFFFFFEECFELL:
      v3 = 88;
      goto LABEL_16;
    case 0xFFFFFFFFFFFEECFFLL:
      goto LABEL_16;
    default:
      if (!a1)
        return a1;
      v3 = 52;
LABEL_16:
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:", v3, v1, v2);
      a1 = (void *)objc_claimAutoreleasedReturnValue();
      return a1;
  }
}

id HMErrorFromOSStatus(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  _OWORD *v16;
  _QWORD v17[2];
  _QWORD v18[2];
  _OWORD v19[6];
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!(_DWORD)a1)
    return 0;
  v20 = 0;
  memset(v19, 0, sizeof(v19));
  DebugGetErrorString();
  v17[0] = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed with OSStatus code %d (%s)"), a1, v19);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v2;
  v17[1] = *MEMORY[0x1E0CB3388];
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithOSStatus:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((int)a1 > -6761)
  {
    v5 = 3;
    switch(a1)
    {
      case 0xFFFFE598:
      case 0xFFFFE599:
      case 0xFFFFE59A:
      case 0xFFFFE59F:
      case 0xFFFFE5A0:
      case 0xFFFFE5BB:
      case 0xFFFFE5BC:
      case 0xFFFFE5BD:
      case 0xFFFFE5BE:
        v5 = 54;
        break;
      case 0xFFFFE59B:
      case 0xFFFFE59C:
      case 0xFFFFE59D:
      case 0xFFFFE5A3:
      case 0xFFFFE5A5:
      case 0xFFFFE5A6:
      case 0xFFFFE5A7:
      case 0xFFFFE5A8:
      case 0xFFFFE5AA:
      case 0xFFFFE5AB:
      case 0xFFFFE5AC:
      case 0xFFFFE5AD:
      case 0xFFFFE5AE:
      case 0xFFFFE5AF:
      case 0xFFFFE5B0:
      case 0xFFFFE5B1:
      case 0xFFFFE5B4:
      case 0xFFFFE5B5:
      case 0xFFFFE5B6:
      case 0xFFFFE5B7:
      case 0xFFFFE5B8:
      case 0xFFFFE5B9:
      case 0xFFFFE5BA:
      case 0xFFFFE5BF:
      case 0xFFFFE5C0:
      case 0xFFFFE5C1:
      case 0xFFFFE5C2:
      case 0xFFFFE5C3:
      case 0xFFFFE5C5:
      case 0xFFFFE5C6:
      case 0xFFFFE5C8:
      case 0xFFFFE5C9:
      case 0xFFFFE5CD:
      case 0xFFFFE5CE:
      case 0xFFFFE5D1:
        goto LABEL_15;
      case 0xFFFFE59E:
        v5 = 55;
        break;
      case 0xFFFFE5A1:
      case 0xFFFFE5A2:
      case 0xFFFFE5A9:
        v5 = 56;
        break;
      case 0xFFFFE5A4:
      case 0xFFFFE5B3:
      case 0xFFFFE5C4:
      case 0xFFFFE5C7:
      case 0xFFFFE5CC:
        goto LABEL_6;
      case 0xFFFFE5B2:
        v5 = 66;
        break;
      case 0xFFFFE5CA:
      case 0xFFFFE5CF:
      case 0xFFFFE5D0:
        break;
      case 0xFFFFE5CB:
        goto LABEL_14;
      case 0xFFFFE5D2:
        v5 = 48;
        break;
      default:
        if ((a1 - 35) > 0x1E || ((1 << (a1 - 35)) & 0x42010001) == 0)
          goto LABEL_15;
LABEL_14:
        v5 = 4;
        break;
    }
  }
  else
  {
    switch((_DWORD)a1)
    {
      case 0xFFFEEA18:
        v5 = 96;
        break;
      case 0xFFFFE58B:
        v5 = 10;
        break;
      case 0xFFFFE590:
LABEL_6:
        v5 = 53;
        break;
      default:
LABEL_15:
        if ((a1 - 200400) >= 0x64)
        {
          if ((a1 - 200500) >= 0x64)
          {
            if ((a1 + 25298) <= 0xFFFFFFFD)
            {
              v7 = (void *)MEMORY[0x1D17B7244]();
              HMFGetOSLogHandle();
              v8 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v9 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v12 = v9;
                v13 = 1024;
                v14 = a1;
                v15 = 2080;
                v16 = v19;
                _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_ERROR, "%{public}@Treating OSStatus %d (%s) as Generic error", buf, 0x1Cu);

              }
              objc_autoreleasePoolPop(v7);
            }
            v5 = 52;
          }
          else
          {
            v5 = 59;
          }
        }
        else
        {
          v5 = 58;
        }
        break;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:userInfo:", v5, v4);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  return v10;
}

id HMErrorFromHAPErrorCode(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed with HAP Error code %ld"), a1, *MEMORY[0x1E0CB2D50]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v7[1] = *MEMORY[0x1E0CB3388];
  objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HMErrorDomain"), a1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void sub_1CCECFD30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCECFE84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCECFFD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCED00B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCED0204(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1CCED0314(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1CCED0424(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1CCED0560(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1CCED0670(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1CCED0788(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCED086C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1CCED0DD8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1CCED0F70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CCED16F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1CCED1804(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1CCED1914(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1CCED1A4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CCED1B84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CCED1CAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CCED2150(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8600(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8601(uint64_t a1)
{

}

void sub_1CCED2540(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCED2754(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCED2E54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1CCED4050(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8897(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8898(uint64_t a1)
{

}

void sub_1CCED430C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCED4408(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9085(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9086(uint64_t a1)
{

}

__CFString *HAPAccessCodeCharacterSetAsString(unint64_t a1)
{
  id v2;
  uint64_t v3;
  unint64_t v4;
  void *v5;
  __CFString *v6;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (a1)
  {
    v3 = 1;
    v4 = a1;
    do
    {
      if (v3 == 1 && (a1 & 1) != 0)
      {
        v4 &= ~1uLL;
        objc_msgSend(v2, "addObject:", CFSTR("HAPAccessCodeCharacterSetArabicNumerals"));
      }
      v3 *= 2;
    }
    while (v3 - 1 < a1);
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown options %lu"), v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:", v5);

    }
  }
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "componentsJoinedByString:", CFSTR(", "));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = CFSTR("None");
  }

  return v6;
}

__CFString *HAPAccessCodeFlagsAsString(unint64_t a1)
{
  id v2;
  uint64_t v3;
  unint64_t v4;
  void *v5;
  __CFString *v6;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (a1)
  {
    v3 = 1;
    v4 = a1;
    do
    {
      if (v3 == 1 && (a1 & 1) != 0)
      {
        v4 &= ~1uLL;
        objc_msgSend(v2, "addObject:", CFSTR("HAPAccessCodeFlagHasRestrictions"));
      }
      v3 *= 2;
    }
    while (v3 - 1 < a1);
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown options %lu"), v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:", v5);

    }
  }
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "componentsJoinedByString:", CFSTR(", "));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = CFSTR("None");
  }

  return v6;
}

void sub_1CCED82A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CCEDAEA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CCEDC828(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCEDC9A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__10047(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10048(uint64_t a1)
{

}

void sub_1CCEDF0E0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1CCEDF69C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1CCEDF8B0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCEDF9A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  os_unfair_lock_s *v15;

  os_unfair_lock_unlock(v15);
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_1CCEDFCEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CCEE02B0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1CCEE0388(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1CCEE045C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1CCEE0600(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1CCEE06F4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1CCEE07E4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1CCEE0AF4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1CCEE0E34(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1CCEE0F34(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1CCEE0FFC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1CCEE154C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_1CCEE19B8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_1CCEE1DC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCEE1FF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCEE26CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a10);
  va_start(va, a10);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1CCEE29BC(_Unwind_Exception *a1)
{
  __HMFActivityScopeLeave();
  _Unwind_Resume(a1);
}

void sub_1CCEE309C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCEE3470(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1CCEE357C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CCEE3688(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CCEE3784(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1CCEE38D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CCEE3A2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CCEE3B28(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1CCEE3C7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CCEE3DF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CCEE3F8C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__10342(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10343(uint64_t a1)
{

}

void sub_1CCEE5EA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCEE6514(_Unwind_Exception *a1)
{
  __HMFActivityScopeLeave();
  _Unwind_Resume(a1);
}

void sub_1CCEE66EC(_Unwind_Exception *a1)
{
  __HMFActivityScopeLeave();
  _Unwind_Resume(a1);
}

void sub_1CCEE7460(_Unwind_Exception *a1)
{
  __HMFActivityScopeLeave();
  _Unwind_Resume(a1);
}

void sub_1CCEF245C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCEF25B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCEF2E3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCEF30E0(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 88));
  _Unwind_Resume(a1);
}

HAP2AccessoryServerDiscoveryAccessoryInfo *accessoryInfoForBonjourDevice(void *a1, void *a2, void *a3)
{
  __CFString *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  __CFString *v10;
  HAPDeviceID *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  NSObject *v17;
  HAP2AccessoryServerDiscoveryAccessoryInfo *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  __CFString *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  __CFString *v29;
  NSObject *v30;
  const char *v31;
  char *v32;
  void *v33;
  uint64_t v34;
  __CFString *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  HAP2AccessoryServerDiscoveryHAPAccessoryInfo *v41;
  HAP2AccessoryServerDiscoveryAccessoryInfo *v42;
  NSObject *v44;
  __CFString *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *log;
  os_log_t loga;
  uint64_t v53;
  unsigned __int8 v54;
  __CFString *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  HAPDeviceID *v59;
  id v60;
  HAPDeviceID *v61;
  id v62;
  _QWORD v63[4];
  _QWORD v64[4];
  uint8_t buf[4];
  const __CFString *v66;
  __int16 v67;
  __CFString *v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  -[__CFString name](v5, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[__CFString txtDictionary](v5, "txtDictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v19 = hap2Log_browser;
      if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v66 = v5;
        _os_log_impl(&dword_1CCE01000, v19, OS_LOG_TYPE_INFO, "Received bonjour device that has no TXT record: %@", buf, 0xCu);
      }
      v18 = 0;
      goto LABEL_65;
    }
    -[__CFString identifierStr](v5, "identifierStr");
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v20 = hap2Log_browser;
      if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v66 = v5;
        _os_log_impl(&dword_1CCE01000, v20, OS_LOG_TYPE_INFO, "Received bonjour device that has a no device id: %@", buf, 0xCu);
      }
      v18 = 0;
      goto LABEL_64;
    }
    v11 = -[HAPDeviceID initWithDeviceIDString:]([HAPDeviceID alloc], "initWithDeviceIDString:", v10);
    if (!v11)
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v21 = hap2Log_browser;
      if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v66 = v10;
        v67 = 2112;
        v68 = v5;
        _os_log_impl(&dword_1CCE01000, v21, OS_LOG_TYPE_INFO, "Received bonjour device that has an invalid device id '%@': %@", buf, 0x16u);
      }
      v18 = 0;
      goto LABEL_63;
    }
    v63[0] = CFSTR("bonjourServiceName");
    v63[1] = CFSTR("bonjourServiceType");
    v64[0] = v8;
    v64[1] = v6;
    v63[2] = CFSTR("bonjourServiceDomain");
    v63[3] = CFSTR("bonjourTXTRecord");
    v64[2] = v7;
    v64[3] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v64, v63, 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = v11;
    v62 = v12;
    v60 = v8;
    v13 = v9;
    -[__CFString objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", CFSTR("sf"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
      v16 = objc_msgSend(v14, "intValue");
    else
      v16 = 0;

    -[__CFString objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", CFSTR("ci"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v22)
      v58 = objc_msgSend(v22, "longLongValue");
    else
      v58 = 1;

    v24 = CFSTR("c#");
    -[__CFString objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", CFSTR("c#"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = v11;
    if (v25)
    {
      v26 = v25;
      v27 = objc_msgSend(v25, "longLongValue");
      if ((unint64_t)(v27 - 0x100000000) <= 0xFFFFFFFF00000000)
      {
        if (hap2LogInitialize_onceToken != -1)
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
        v28 = hap2Log_browser;
        v29 = CFSTR("c#");
        if (!os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_INFO))
          goto LABEL_58;
        *(_DWORD *)buf = 138412546;
        v66 = CFSTR("c#");
        v67 = 2112;
        v68 = v13;
        goto LABEL_37;
      }
      v57 = v27;

      -[__CFString objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", CFSTR("s#"));
      v32 = (char *)objc_claimAutoreleasedReturnValue();
      v33 = v32;
      if (v32)
        v32 = (char *)objc_msgSend(v32, "longLongValue");
      if ((unint64_t)(v32 - 0x100000000) < 0xFFFFFFFF00000001)
        v34 = 1;
      else
        v34 = (uint64_t)v32;
      v56 = v34;

      v35 = CFSTR("pv");
      -[__CFString objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", CFSTR("pv"));
      v36 = objc_claimAutoreleasedReturnValue();
      if (v36)
      {
        v26 = (void *)v36;
        v37 = objc_msgSend(objc_alloc(MEMORY[0x1E0D286E0]), "initWithVersionString:", v36);
        if (v37)
        {
          v54 = v16;
          v55 = (__CFString *)v37;

          -[__CFString objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", CFSTR("md"));
          v38 = objc_claimAutoreleasedReturnValue();
          if (v38)
          {
            v26 = (void *)v38;
            -[__CFString objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", CFSTR("ff"));
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = v39;
            if (v39)
              v53 = objc_msgSend(v39, "longLongValue");
            else
              v53 = 0;

            v45 = CFSTR("sh");
            -[__CFString objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", CFSTR("sh"));
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            if (v46)
            {
              v47 = v46;
              v48 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v46, 0);
              v46 = v47;
              if (!v48)
              {
                if (hap2LogInitialize_onceToken != -1)
                  dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
                log = hap2Log_browser;
                if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412546;
                  v66 = CFSTR("sh");
                  v67 = 2112;
                  v68 = v13;
                  _os_log_impl(&dword_1CCE01000, log, OS_LOG_TYPE_INFO, "Received txtRecord that has a bad value for key '%@': %@", buf, 0x16u);
                }
                v48 = 0;
                v46 = v47;
              }
            }
            else
            {
              v48 = 0;
            }
            v49 = v48;
            loga = (os_log_t)v48;

            v50 = v49;
            v29 = v55;
            v41 = -[HAP2AccessoryServerDiscoveryHAPAccessoryInfo initWithDeviceID:rawDiscoveryInfo:name:model:status:category:configurationNumber:stateNumber:protocolVersion:featureFlags:setupHash:]([HAP2AccessoryServerDiscoveryHAPAccessoryInfo alloc], "initWithDeviceID:rawDiscoveryInfo:name:model:status:category:configurationNumber:stateNumber:protocolVersion:featureFlags:setupHash:", v61, v62, v60, v26, v54, v58, v57, v56, v55, v53, v50);

          }
          else
          {
            if (hap2LogInitialize_onceToken != -1)
              dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
            v44 = hap2Log_browser;
            if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v66 = CFSTR("md");
              _os_log_error_impl(&dword_1CCE01000, v44, OS_LOG_TYPE_ERROR, "Received txtRecord that doesn't include key '%@'", buf, 0xCu);
            }
            v26 = 0;
            v41 = 0;
            v29 = v55;
          }
          goto LABEL_59;
        }
        if (hap2LogInitialize_onceToken != -1)
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
        v28 = hap2Log_browser;
        v29 = CFSTR("pv");
        if (!os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_INFO))
        {
LABEL_58:
          v41 = 0;
LABEL_59:

          if (v41)
            v42 = v41;
          else
            v42 = -[HAP2AccessoryServerDiscoveryAccessoryInfo initWithDeviceID:rawDiscoveryInfo:]([HAP2AccessoryServerDiscoveryAccessoryInfo alloc], "initWithDeviceID:rawDiscoveryInfo:", v61, v62);
          v18 = v42;
          v11 = v59;

LABEL_63:
LABEL_64:

LABEL_65:
          goto LABEL_66;
        }
        *(_DWORD *)buf = 138412546;
        v66 = CFSTR("pv");
        v67 = 2112;
        v68 = v13;
LABEL_37:
        _os_log_impl(&dword_1CCE01000, v28, OS_LOG_TYPE_INFO, "Received txtRecord that has a bad value for key '%@': %@", buf, 0x16u);
        goto LABEL_58;
      }
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v30 = hap2Log_browser;
      v29 = CFSTR("pv");
      if (!os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_INFO))
      {
LABEL_57:
        v26 = 0;
        goto LABEL_58;
      }
      *(_DWORD *)buf = 138412546;
      v66 = CFSTR("pv");
      v67 = 2112;
      v68 = v13;
      v31 = "Received txtRecord that has no value for key '%@': %@";
    }
    else
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v30 = hap2Log_browser;
      v29 = CFSTR("c#");
      if (!os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_INFO))
        goto LABEL_57;
      *(_DWORD *)buf = 138412546;
      v66 = CFSTR("c#");
      v67 = 2112;
      v68 = v13;
      v31 = "Received txtRecord that has a no value for key '%@': %@";
    }
    _os_log_impl(&dword_1CCE01000, v30, OS_LOG_TYPE_INFO, v31, buf, 0x16u);
    goto LABEL_57;
  }
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v17 = hap2Log_browser;
  if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v66 = v5;
    _os_log_error_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_ERROR, "Received bonjour device that has no service name: %@", buf, 0xCu);
  }
  v18 = 0;
LABEL_66:

  return v18;
}

uint64_t __Block_byref_object_copy__11138(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11139(uint64_t a1)
{

}

__CFString *HAPOperatingStateAbnormalReasonsAsString(unint64_t a1)
{
  id v2;
  uint64_t v3;
  unint64_t v4;
  const __CFString *v5;
  void *v6;
  __CFString *v7;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (!a1)
    goto LABEL_14;
  v3 = 1;
  v4 = a1;
  do
  {
    if ((v3 & a1) == 0)
      goto LABEL_11;
    switch(v3)
    {
      case 1:
        v5 = CFSTR("HAPOperatingStateAbnormalReasonOther");
        break;
      case 4:
        v5 = CFSTR("HAPOperatingStateAbnormalReasonHighTemperature");
        break;
      case 2:
        v5 = CFSTR("HAPOperatingStateAbnormalReasonLowTemperature");
        break;
      default:
        goto LABEL_11;
    }
    v4 &= ~v3;
    objc_msgSend(v2, "addObject:", v5);
LABEL_11:
    v3 *= 2;
  }
  while (v3 - 1 < a1);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown options %lu"), v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v6);

  }
LABEL_14:
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "componentsJoinedByString:", CFSTR(", "));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = CFSTR("None");
  }

  return v7;
}

void sub_1CCEF4E78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCEF4FCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCEF5634(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1CCEF6018(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__11314(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11315(uint64_t a1)
{

}

HAP2AccessoryServerDiscoveryAccessoryInfo *accessoryInfoForBrowseResult(void *a1)
{
  NSObject *v1;
  NSObject *v2;
  NSObject *v3;
  nw_endpoint_type_t type;
  const char *bonjour_service_name;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *bonjour_service_type;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *bonjour_service_domain;
  const char *v14;
  uint64_t v15;
  void *v16;
  nw_txt_record_t v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  const char *v25;
  nw_endpoint_type_t v26;
  uint64_t v27;
  NSObject *v28;
  uint32_t v29;
  uint64_t v30;
  HAP2AccessoryServerDiscoveryAccessoryInfo *v31;
  uint64_t v33;
  const char *v34;
  NSObject *v35;
  uint32_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  NSObject *v40;
  uint32_t v41;
  uint64_t v42;
  NSObject *v43;
  NSObject *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  NSObject *v50;
  int v51;
  char v52;
  __CFString *v53;
  __CFString *v54;
  void *v55;
  HAPDeviceID *v56;
  void *v57;
  __CFString *v58;
  NSObject *v59;
  NSObject *v60;
  NSObject *v61;
  __CFString *v62;
  void *v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  char v67;
  _QWORD access_bytes[5];
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t (*v72)(uint64_t, uint64_t);
  void (*v73)(uint64_t);
  id v74;
  _QWORD v75[4];
  _QWORD v76[4];
  _BYTE applier[24];
  void *v78;
  NSObject *v79;
  id v80;
  uint64_t *v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = nw_browse_result_copy_endpoint(v1);
  v3 = v2;
  if (!v2)
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v24 = hap2Log_browser;
    if (!os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_ERROR))
      goto LABEL_30;
    *(_DWORD *)applier = 138412290;
    *(_QWORD *)&applier[4] = v1;
    v25 = "Received browse result that has no endpoint: %@";
LABEL_25:
    v28 = v24;
    v29 = 12;
LABEL_26:
    _os_log_error_impl(&dword_1CCE01000, v28, OS_LOG_TYPE_ERROR, v25, applier, v29);
    goto LABEL_30;
  }
  type = nw_endpoint_get_type(v2);
  if (type != nw_endpoint_type_bonjour_service)
  {
    v26 = type;
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v27 = hap2Log_browser;
    if (!os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_ERROR))
      goto LABEL_30;
    *(_DWORD *)applier = 67109378;
    *(_DWORD *)&applier[4] = v26;
    *(_WORD *)&applier[8] = 2112;
    *(_QWORD *)&applier[10] = v1;
    v25 = "Received browse result that has unhandled endpoint type %u: %@";
    v28 = v27;
    v29 = 18;
    goto LABEL_26;
  }
  bonjour_service_name = nw_endpoint_get_bonjour_service_name(v3);
  if (!bonjour_service_name)
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v24 = hap2Log_browser;
    if (!os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_ERROR))
      goto LABEL_30;
    *(_DWORD *)applier = 138412290;
    *(_QWORD *)&applier[4] = v1;
    v25 = "Received browse result that has no service name: %@";
    goto LABEL_25;
  }
  v6 = bonjour_service_name;
  v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", bonjour_service_name);
  if (v7)
  {
    v8 = (void *)v7;
    bonjour_service_type = nw_endpoint_get_bonjour_service_type(v3);
    if (bonjour_service_type)
    {
      v10 = bonjour_service_type;
      v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", bonjour_service_type);
      if (v11)
      {
        v12 = (void *)v11;
        bonjour_service_domain = nw_endpoint_get_bonjour_service_domain(v3);
        if (bonjour_service_domain)
        {
          v14 = bonjour_service_domain;
          v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", bonjour_service_domain);
          if (v15)
          {
            v16 = (void *)v15;
            v17 = nw_browse_result_copy_txt_record_object(v1);
            if (v17)
            {
              v18 = v17;
              v63 = v16;
              if (nw_txt_record_is_dictionary(v18))
              {
                v19 = v18;
                objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", nw_txt_record_get_key_count(v19));
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                *(_QWORD *)applier = MEMORY[0x1E0C809B0];
                *(_QWORD *)&applier[8] = 3221225472;
                *(_QWORD *)&applier[16] = __txtRecordDictionaryForNetworkTxtRecordDictionary_block_invoke;
                v78 = &unk_1E894B878;
                v79 = v19;
                v21 = v20;
                v80 = v21;
                v22 = v19;
                if (nw_txt_record_apply(v22, applier))
                  v23 = (void *)objc_msgSend(v21, "copy");
                else
                  v23 = 0;

              }
              else
              {
                v44 = v18;
                v69 = 0;
                v70 = &v69;
                v71 = 0x3032000000;
                v72 = __Block_byref_object_copy__11314;
                v73 = __Block_byref_object_dispose__11315;
                v45 = MEMORY[0x1E0C809B0];
                v74 = 0;
                access_bytes[0] = MEMORY[0x1E0C809B0];
                access_bytes[1] = 3221225472;
                access_bytes[2] = __txtRecordDictionaryForNetworkTxtRecordData_block_invoke;
                access_bytes[3] = &unk_1E894B8A0;
                access_bytes[4] = &v69;
                nw_txt_record_access_bytes(v44, access_bytes);
                v46 = (void *)v70[5];
                if (v46)
                {
                  v61 = v44;
                  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v46, "count"));
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  v64 = 0;
                  v65 = &v64;
                  v66 = 0x2020000000;
                  v67 = 1;
                  v48 = (void *)v70[5];
                  *(_QWORD *)applier = v45;
                  *(_QWORD *)&applier[8] = 3221225472;
                  *(_QWORD *)&applier[16] = __txtRecordDictionaryForNetworkTxtRecordData_block_invoke_184;
                  v78 = &unk_1E894B8C8;
                  v79 = v61;
                  v81 = &v64;
                  v49 = v47;
                  v80 = v49;
                  objc_msgSend(v48, "enumerateKeysAndObjectsUsingBlock:", applier);
                  if (*((_BYTE *)v65 + 24))
                    v23 = (void *)objc_msgSend(v49, "copy");
                  else
                    v23 = 0;

                  v44 = v61;
                  _Block_object_dispose(&v64, 8);

                }
                else
                {
                  if (hap2LogInitialize_onceToken != -1)
                    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
                  v50 = hap2Log_browser;
                  if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)applier = 138412290;
                    *(_QWORD *)&applier[4] = v44;
                    _os_log_error_impl(&dword_1CCE01000, v50, OS_LOG_TYPE_ERROR, "Received txtRecord with data that couldn't be parsed: %@", applier, 0xCu);
                  }
                  v23 = 0;
                }
                _Block_object_dispose(&v69, 8);

              }
              if (v23)
              {
                v51 = objc_msgSend(v12, "isEqualToString:", CFSTR("_airplay._tcp"));
                v52 = v51;
                v53 = CFSTR("deviceid");
                if (!v51)
                  v53 = CFSTR("id");
                v54 = v53;
                objc_msgSend(v23, "objectForKeyedSubscript:", v54);
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                if (v55)
                {
                  v56 = -[HAPDeviceID initWithDeviceIDString:]([HAPDeviceID alloc], "initWithDeviceIDString:", v55);
                  if (v56)
                  {
                    v75[0] = CFSTR("bonjourServiceName");
                    v75[1] = CFSTR("bonjourServiceType");
                    v76[0] = v8;
                    v76[1] = v12;
                    v75[2] = CFSTR("bonjourServiceDomain");
                    v75[3] = CFSTR("bonjourTXTRecord");
                    v76[2] = v63;
                    v76[3] = v23;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v76, v75, 4);
                    v57 = (void *)objc_claimAutoreleasedReturnValue();
                    if ((v52 & 1) != 0
                      || (hapAccessoryInfoWithDeviceID(v56, v57, v8, v23),
                          (v31 = (HAP2AccessoryServerDiscoveryAccessoryInfo *)objc_claimAutoreleasedReturnValue()) == 0))
                    {
                      v31 = -[HAP2AccessoryServerDiscoveryAccessoryInfo initWithDeviceID:rawDiscoveryInfo:]([HAP2AccessoryServerDiscoveryAccessoryInfo alloc], "initWithDeviceID:rawDiscoveryInfo:", v56, v57);
                    }

                  }
                  else
                  {
                    v62 = v54;
                    if (hap2LogInitialize_onceToken != -1)
                      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
                    v60 = hap2Log_browser;
                    if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)applier = 138412546;
                      *(_QWORD *)&applier[4] = CFSTR("id");
                      *(_WORD *)&applier[12] = 2112;
                      *(_QWORD *)&applier[14] = v23;
                      _os_log_impl(&dword_1CCE01000, v60, OS_LOG_TYPE_INFO, "Received txtRecord that has an invalid '%@' value: %@", applier, 0x16u);
                    }
                    v31 = 0;
                    v54 = v62;
                  }

                }
                else
                {
                  v58 = v54;
                  if (hap2LogInitialize_onceToken != -1)
                    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
                  v59 = hap2Log_browser;
                  if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)applier = 138412546;
                    *(_QWORD *)&applier[4] = CFSTR("id");
                    *(_WORD *)&applier[12] = 2112;
                    *(_QWORD *)&applier[14] = v23;
                    _os_log_impl(&dword_1CCE01000, v59, OS_LOG_TYPE_INFO, "Received txtRecord that has a no '%@': %@", applier, 0x16u);
                  }
                  v31 = 0;
                  v54 = v58;
                }

              }
              else
              {
                v31 = 0;
              }
              v16 = v63;
            }
            else
            {
              if (hap2LogInitialize_onceToken != -1)
                dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
              v43 = hap2Log_browser;
              if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)applier = 138412290;
                *(_QWORD *)&applier[4] = v1;
                _os_log_impl(&dword_1CCE01000, v43, OS_LOG_TYPE_INFO, "Received browse result that has no TXT record: %@", applier, 0xCu);
              }
              v31 = 0;
            }

            goto LABEL_93;
          }
          if (hap2LogInitialize_onceToken != -1)
            dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
          v42 = hap2Log_browser;
          if (!os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_ERROR))
          {
LABEL_47:
            v31 = 0;
LABEL_93:

            goto LABEL_94;
          }
          *(_DWORD *)applier = 136315394;
          *(_QWORD *)&applier[4] = v14;
          *(_WORD *)&applier[12] = 2112;
          *(_QWORD *)&applier[14] = v1;
          v39 = "Received browse result that has bad service name '%s': %@";
          v40 = v42;
          v41 = 22;
        }
        else
        {
          if (hap2LogInitialize_onceToken != -1)
            dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
          v38 = hap2Log_browser;
          if (!os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_ERROR))
            goto LABEL_47;
          *(_DWORD *)applier = 138412290;
          *(_QWORD *)&applier[4] = v1;
          v39 = "Received browse result that has no service domain: %@";
          v40 = v38;
          v41 = 12;
        }
        _os_log_error_impl(&dword_1CCE01000, v40, OS_LOG_TYPE_ERROR, v39, applier, v41);
        goto LABEL_47;
      }
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v37 = hap2Log_browser;
      if (!os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_ERROR))
      {
LABEL_39:
        v31 = 0;
LABEL_94:

        goto LABEL_31;
      }
      *(_DWORD *)applier = 136315394;
      *(_QWORD *)&applier[4] = v10;
      *(_WORD *)&applier[12] = 2112;
      *(_QWORD *)&applier[14] = v1;
      v34 = "Received browse result that has bad service name '%s': %@";
      v35 = v37;
      v36 = 22;
    }
    else
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v33 = hap2Log_browser;
      if (!os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_ERROR))
        goto LABEL_39;
      *(_DWORD *)applier = 138412290;
      *(_QWORD *)&applier[4] = v1;
      v34 = "Received browse result that has no service type: %@";
      v35 = v33;
      v36 = 12;
    }
    _os_log_error_impl(&dword_1CCE01000, v35, OS_LOG_TYPE_ERROR, v34, applier, v36);
    goto LABEL_39;
  }
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v30 = hap2Log_browser;
  if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)applier = 136315394;
    *(_QWORD *)&applier[4] = v6;
    *(_WORD *)&applier[12] = 2112;
    *(_QWORD *)&applier[14] = v1;
    v25 = "Received browse result that has bad service name '%s': %@";
    v28 = v30;
    v29 = 22;
    goto LABEL_26;
  }
LABEL_30:
  v31 = 0;
LABEL_31:

  return v31;
}

void sub_1CCEF6EA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  uint64_t v5;
  va_list va;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a4);
  va_start(va, a4);
  v5 = va_arg(va1, _QWORD);
  v7 = va_arg(va1, _QWORD);
  v8 = va_arg(va1, _QWORD);
  v9 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __txtRecordDictionaryForNetworkTxtRecordDictionary_block_invoke(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v19;
  uint64_t v20;
  int v21;
  _BYTE v22[24];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", a2);
  if (!v10)
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v13 = hap2Log_browser;
    if (!os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_INFO))
      goto LABEL_11;
    v14 = *(_QWORD *)(a1 + 32);
    v21 = 136315394;
    *(_QWORD *)v22 = a2;
    *(_WORD *)&v22[8] = 2112;
    *(_QWORD *)&v22[10] = v14;
    v15 = "Received txtRecord that has a bad key '%s': %@";
    goto LABEL_10;
  }
  if (a3 == 3)
  {
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", &stru_1E894EFE8, v10);
    goto LABEL_17;
  }
  if (a3 != 4)
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v17 = hap2Log_browser;
    if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_DEBUG))
    {
      v20 = *(_QWORD *)(a1 + 32);
      v21 = 67109634;
      *(_DWORD *)v22 = a3;
      *(_WORD *)&v22[4] = 2112;
      *(_QWORD *)&v22[6] = v10;
      *(_WORD *)&v22[14] = 2112;
      *(_QWORD *)&v22[16] = v20;
      _os_log_debug_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_DEBUG, "Received txtRecord that has a bad state (%d) for key '%@': %@", (uint8_t *)&v21, 0x1Cu);
    }
    goto LABEL_17;
  }
  v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", a4, a5, 4);
  if (v11)
  {
    v12 = (void *)v11;
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v11, v10);

LABEL_17:
    v16 = 1;
    goto LABEL_18;
  }
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v13 = hap2Log_browser;
  if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_INFO))
  {
    v19 = *(_QWORD *)(a1 + 32);
    v21 = 138412546;
    *(_QWORD *)v22 = v10;
    *(_WORD *)&v22[8] = 2112;
    *(_QWORD *)&v22[10] = v19;
    v15 = "Received txtRecord that has a bad value for '%@': %@";
LABEL_10:
    _os_log_impl(&dword_1CCE01000, v13, OS_LOG_TYPE_INFO, v15, (uint8_t *)&v21, 0x16u);
  }
LABEL_11:
  v16 = 0;
LABEL_18:

  return v16;
}

uint64_t __txtRecordDictionaryForNetworkTxtRecordData_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:", a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37B0], "dictionaryFromTXTRecordData:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  return 1;
}

void __txtRecordDictionaryForNetworkTxtRecordData_block_invoke_184(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  objc_class *v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  int v13;
  id v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = (objc_class *)MEMORY[0x1E0CB3940];
  v9 = a3;
  v10 = (void *)objc_msgSend([v8 alloc], "initWithData:encoding:", v9, 4);

  if (v10)
  {
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v10, v7);
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v11 = hap2Log_browser;
    if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_INFO))
    {
      v12 = *(_QWORD *)(a1 + 32);
      v13 = 138412546;
      v14 = v7;
      v15 = 2112;
      v16 = v12;
      _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_INFO, "Received txtRecord that has a bad key '%@': %@", (uint8_t *)&v13, 0x16u);
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    *a4 = 1;
  }

}

HAP2AccessoryServerDiscoveryHAPAccessoryInfo *hapAccessoryInfoWithDeviceID(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  void *v15;
  uint64_t v16;
  __CFString *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  char *v26;
  void *v27;
  uint64_t v28;
  __CFString *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  HAP2AccessoryServerDiscoveryHAPAccessoryInfo *v35;
  NSObject *v37;
  __CFString *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint8_t buf[4];
  const __CFString *v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = a4;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("sf"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
    v13 = objc_msgSend(v11, "intValue");
  else
    v13 = 0;

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ci"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
    v16 = objc_msgSend(v14, "longLongValue");
  else
    v16 = 1;

  v17 = CFSTR("c#");
  v18 = CFSTR("c#");
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("c#"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v23 = hap2Log_browser;
    if (!os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_INFO))
      goto LABEL_33;
    *(_DWORD *)buf = 138412546;
    v45 = CFSTR("c#");
    v46 = 2112;
    v47 = v10;
    v24 = "Received txtRecord that has a no value for key '%@': %@";
LABEL_32:
    _os_log_impl(&dword_1CCE01000, v23, OS_LOG_TYPE_INFO, v24, buf, 0x16u);
LABEL_33:
    v20 = 0;
    goto LABEL_34;
  }
  v20 = v19;
  v21 = objc_msgSend(v19, "longLongValue");
  if ((unint64_t)(v21 - 0x100000000) <= 0xFFFFFFFF00000000)
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v22 = hap2Log_browser;
    if (!os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_INFO))
      goto LABEL_34;
    *(_DWORD *)buf = 138412546;
    v45 = CFSTR("c#");
    v46 = 2112;
    v47 = v10;
    goto LABEL_13;
  }
  v25 = v21;

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("s#"));
  v26 = (char *)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (v26)
    v26 = (char *)objc_msgSend(v26, "longLongValue");
  if ((unint64_t)(v26 - 0x100000000) < 0xFFFFFFFF00000001)
    v28 = 1;
  else
    v28 = (uint64_t)v26;

  v17 = CFSTR("pv");
  v29 = CFSTR("pv");
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("pv"));
  v30 = objc_claimAutoreleasedReturnValue();
  if (!v30)
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v23 = hap2Log_browser;
    if (!os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_INFO))
      goto LABEL_33;
    *(_DWORD *)buf = 138412546;
    v45 = CFSTR("pv");
    v46 = 2112;
    v47 = v10;
    v24 = "Received txtRecord that has no value for key '%@': %@";
    goto LABEL_32;
  }
  v20 = (void *)v30;
  v31 = objc_msgSend(objc_alloc(MEMORY[0x1E0D286E0]), "initWithVersionString:", v30);
  if (!v31)
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v22 = hap2Log_browser;
    if (!os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_INFO))
      goto LABEL_34;
    *(_DWORD *)buf = 138412546;
    v45 = CFSTR("pv");
    v46 = 2112;
    v47 = v10;
LABEL_13:
    _os_log_impl(&dword_1CCE01000, v22, OS_LOG_TYPE_INFO, "Received txtRecord that has a bad value for key '%@': %@", buf, 0x16u);
LABEL_34:
    v35 = 0;
    goto LABEL_35;
  }
  v17 = (__CFString *)v31;
  v43 = v28;

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("md"));
  v32 = objc_claimAutoreleasedReturnValue();
  if (!v32)
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v37 = hap2Log_browser;
    if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v45 = CFSTR("md");
      _os_log_error_impl(&dword_1CCE01000, v37, OS_LOG_TYPE_ERROR, "Received txtRecord that doesn't include key '%@'", buf, 0xCu);
    }
    goto LABEL_33;
  }
  v20 = (void *)v32;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ff"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v33;
  if (v33)
    v42 = objc_msgSend(v33, "longLongValue");
  else
    v42 = 0;

  v38 = CFSTR("sh");
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("sh"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v39;
  if (v39)
  {
    v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v39, 0);
    if (!v39)
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v40 = hap2Log_browser;
      if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v45 = CFSTR("sh");
        v46 = 2112;
        v47 = v10;
        _os_log_impl(&dword_1CCE01000, v40, OS_LOG_TYPE_INFO, "Received txtRecord that has a bad value for key '%@': %@", buf, 0x16u);
      }
      v39 = 0;
    }
  }

  v35 = -[HAP2AccessoryServerDiscoveryHAPAccessoryInfo initWithDeviceID:rawDiscoveryInfo:name:model:status:category:configurationNumber:stateNumber:protocolVersion:featureFlags:setupHash:]([HAP2AccessoryServerDiscoveryHAPAccessoryInfo alloc], "initWithDeviceID:rawDiscoveryInfo:name:model:status:category:configurationNumber:stateNumber:protocolVersion:featureFlags:setupHash:", v7, v8, v9, v20, v13, v16, v25, v43, v17, v42, v39);
LABEL_35:

  return v35;
}

uint64_t HAPDispatchQueueName(void *a1, void *a2)
{
  void *v3;
  __CFString *v4;
  id v5;
  objc_class *v6;
  void *v7;
  const __CFString *v8;
  const __CFString *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a2;
  v5 = a1;
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v8 = CFSTR(".");
  else
    v8 = &stru_1E894EFE8;
  if (v4)
    v9 = v4;
  else
    v9 = &stru_1E894EFE8;
  v10 = objc_msgSend(v5, "hash");

  objc_msgSend(v3, "stringWithFormat:", CFSTR("com.apple.CoreHAP.%@%@%@.%tu"), v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_retainAutorelease(v11);
  v13 = objc_msgSend(v12, "UTF8String");

  return v13;
}

BOOL HAPAccessoryHasPairings(char a1)
{
  return (a1 & 1) == 0;
}

uint64_t HAPValidateSetupHash(void *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  v7 = 0;
  if (a1 && a2 && v5)
  {
    v8 = a1;
    objc_msgSend(a2, "uppercaseString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingString:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dataUsingEncoding:", 4, 0, 0, 0, 0, 0, 0, 0, 0);
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    if (CC_SHA512((const void *)objc_msgSend(v11, "bytes"), objc_msgSend(v11, "length"), (unsigned __int8 *)&v14))
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v14, 4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }

    v7 = objc_msgSend(v12, "isEqual:", v8);
  }

  return v7;
}

id HAPGetHAPMetadataVersion()
{
  void *v0;
  void *v1;

  +[HAPMetadata getSharedInstance](HAPMetadata, "getSharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "version");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

uint64_t HAPIsHH2Enabled()
{
  if (HAPIsHH2Enabled_onceToken != -1)
    dispatch_once(&HAPIsHH2Enabled_onceToken, &__block_literal_global_11472);
  return HAPIsHH2Enabled_hh2Enabled;
}

BOOL HAPIsHomePod()
{
  void *v0;
  _BOOL8 v1;

  objc_msgSend(MEMORY[0x1E0D28690], "productInfo");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "productClass") == 6;

  return v1;
}

__CFString *HAPOperatingStateAsString(unint64_t a1)
{
  if (a1 < 3)
    return off_1E894B948[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown HAPOperatingState %ld"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

void sub_1CCEFBC08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *HAPStagingNotReadyReasonsAsString(unint64_t a1)
{
  id v2;
  uint64_t v3;
  unint64_t v4;
  const __CFString *v5;
  void *v6;
  __CFString *v7;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (!a1)
    goto LABEL_14;
  v3 = 1;
  v4 = a1;
  do
  {
    if ((v3 & a1) == 0)
      goto LABEL_11;
    switch(v3)
    {
      case 1:
        v5 = CFSTR("HAPStagingNotReadyReasonOther");
        break;
      case 4:
        v5 = CFSTR("HAPStagingNotReadyReasonConnectivity");
        break;
      case 2:
        v5 = CFSTR("HAPStagingNotReadyReasonLowBattery");
        break;
      default:
        goto LABEL_11;
    }
    v4 &= ~v3;
    objc_msgSend(v2, "addObject:", v5);
LABEL_11:
    v3 *= 2;
  }
  while (v3 - 1 < a1);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown options %lu"), v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v6);

  }
LABEL_14:
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "componentsJoinedByString:", CFSTR(", "));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = CFSTR("None");
  }

  return v7;
}

__CFString *HAPUpdateNotReadyReasonsAsString(unint64_t a1)
{
  id v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (a1)
  {
    v3 = 1;
    v4 = a1;
    do
    {
      if ((v3 & a1) != 0)
      {
        v5 = v3 - 1;
        if ((unint64_t)(v3 - 1) <= 7 && ((0x8Bu >> v5) & 1) != 0)
        {
          v4 &= ~v3;
          objc_msgSend(v2, "addObject:", off_1E894B988[v5]);
        }
      }
      v3 *= 2;
    }
    while (v3 - 1 < a1);
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown options %lu"), v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:", v6);

    }
  }
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "componentsJoinedByString:", CFSTR(", "));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = CFSTR("None");
  }

  return v7;
}

uint64_t __Block_byref_object_copy__12268(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__12269(uint64_t a1)
{

}

uint64_t __cleanUpOperationDependencies_block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeDependency:", a2);
}

void sub_1CCEFE8AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCEFFA0C(_Unwind_Exception *a1)
{
  __HMFActivityScopeLeave();
  _Unwind_Resume(a1);
}

void sub_1CCEFFB48(_Unwind_Exception *a1)
{
  __HMFActivityScopeLeave();
  _Unwind_Resume(a1);
}

void sub_1CCEFFC78(_Unwind_Exception *a1)
{
  __HMFActivityScopeLeave();
  _Unwind_Resume(a1);
}

void sub_1CCEFFDA8(_Unwind_Exception *a1)
{
  __HMFActivityScopeLeave();
  _Unwind_Resume(a1);
}

void sub_1CCF003F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  _Block_object_dispose(&a30, 8);
  _Unwind_Resume(a1);
}

void _HandleEvent_f(uint64_t a1, void *a2)
{
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;
  uint64_t v8;
  int v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD block[4];
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1D17B7244]();
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v26 = v6;
    _os_log_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@[HAP HTTP Client] Received event message", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  v23 = 0;
  v24 = 0;
  v7 = a2;
  v8 = *(unsigned int *)(a1 + 9648);
  if ((_DWORD)v8)
    goto LABEL_8;
  v9 = *(_DWORD *)(a1 + 8456);
  if ((v9 - 200) >= 0x64)
  {
    v10 = 0;
    v8 = (v9 + 200000);
  }
  else if (*(_QWORD *)(a1 + 8528) && *(_QWORD *)(a1 + 8520))
  {
    v8 = HTTPGetHeaderField();
    if ((_DWORD)v8)
    {
LABEL_8:
      v10 = 0;
      goto LABEL_9;
    }
    v10 = 0;
    v8 = 4294960579;
  }
  else
  {
    v10 = 0;
    v8 = 4294960558;
  }
LABEL_9:
  HMErrorFromOSStatus(v8);
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    v13 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v15;
      v27 = 2112;
      v28 = v12;
      _os_log_impl(&dword_1CCE01000, v14, OS_LOG_TYPE_ERROR, "%{public}@[HAP HTTP Client] ### Received event but failed to deliver it due to %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
  }
  else
  {
    if (objc_msgSend(v7, "_delegateRespondsToSelector:", sel_httpClient_didReceiveEvent_))
    {
      objc_msgSend(v7, "delegateQueue");
      v16 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = ___HandleEvent_f_block_invoke;
      block[3] = &unk_1E894E0F8;
      v21 = v7;
      v10 = 0;
      v22 = v10;
      dispatch_async(v16, block);

    }
    v12 = 0;
  }
  objc_msgSend(v7, "delegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v18 = v17;
  else
    v18 = 0;
  v19 = v18;

  if (v19)
    objc_msgSend(v19, "incrementHAPIPHTTPEventsCount");

}

void _Invalidated_f(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t ErrorString;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD block[4];
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  _OWORD *v21;
  _OWORD v22[6];
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v23 = 0;
  memset(v22, 0, sizeof(v22));
  v3 = a2;
  objc_msgSend(v3, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ErrorString = DebugGetErrorString();
  v6 = (void *)MEMORY[0x1D17B7244](ErrorString);
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v15 = v8;
    v16 = 2112;
    v17 = v9;
    v18 = 1024;
    v19 = a1;
    v20 = 2080;
    v21 = v22;
    _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@[HAP HTTP Client] Received invalidate callback from CoreUtils HTTPClient %@ due to %d (%s)", buf, 0x26u);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(v3, "setInvalidated:", 1);
  HMErrorFromOSStatus(a1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInvalidateReason:", v10);

  if (objc_msgSend(v3, "invalidateRequested"))
  {
    objc_msgSend(v3, "setInvalidateRequested:", 0);
  }
  else if (objc_msgSend(v3, "_delegateRespondsToSelector:", sel_httpClientDidCloseConnectionDueToServer_))
  {
    objc_msgSend(v3, "delegateQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = ___Invalidated_f_block_invoke;
    block[3] = &unk_1E894DD08;
    v13 = v3;
    dispatch_async(v11, block);

  }
}

void _HandleSocketEvent_f(unsigned int a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1D17B7244]();
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    CUPrintFlags32();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    _os_log_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@[HAP HTTP Client] Received socket event with flags %@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  if (v4)
    objc_msgSend(v4, "httpClient:didReceiveSocketEvent:", v3, (a1 >> 1) & 2 | (a1 >> 11) & 1);

}

void _HandleDidReceiveMessage_f(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;

  v9 = a5;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", a1, a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  if (a3 && a4)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", a3, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v9, "_debugDelegateRespondsToSelector:", sel_httpClient_didReceiveHTTPMessageWithHeaders_body_))
  {
    objc_msgSend(v9, "debugDelegateQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = ___HandleDidReceiveMessage_f_block_invoke;
    block[3] = &unk_1E894E120;
    v14 = v9;
    v15 = v10;
    v16 = v11;
    dispatch_async(v12, block);

  }
}

void _HandleWillSendMessage_f(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;

  v9 = a5;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", a1, a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  if (a3 && a4)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", a3, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v9, "_debugDelegateRespondsToSelector:", sel_httpClient_willSendHTTPMessageWithHeaders_body_))
  {
    objc_msgSend(v9, "debugDelegateQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = ___HandleWillSendMessage_f_block_invoke;
    block[3] = &unk_1E894E120;
    v14 = v9;
    v15 = v10;
    v16 = v11;
    dispatch_async(v12, block);

  }
}

const __CFString *HAPHTTPSerializationTypeDescription(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3)
    return CFSTR("Invalid");
  else
    return off_1E894BB00[a1 - 1];
}

__CFString *HAPNotificationContextSourceAsString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) < 3)
    return off_1E894BB20[a1 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown HAPNotificationContextSource %ld"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

void sub_1CCF0398C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCF03AEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCF03C2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCF03D44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCF04EFC(_Unwind_Exception *a1)
{
  __HMFActivityScopeLeave();
  _Unwind_Resume(a1);
}

void sub_1CCF05044(_Unwind_Exception *a1)
{
  __HMFActivityScopeLeave();
  _Unwind_Resume(a1);
}

void sub_1CCF05944(_Unwind_Exception *a1)
{
  __HMFActivityScopeLeave();
  _Unwind_Resume(a1);
}

void sub_1CCF05DB4(_Unwind_Exception *a1)
{
  __HMFActivityScopeLeave();
  _Unwind_Resume(a1);
}

id _stringForMessage(uint64_t a1, int a2)
{
  char v2;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const char *v11;
  uint64_t v12;

  v2 = a2;
  v4 = *(unsigned __int16 *)(a1 + 6);
  if (!*(_BYTE *)a1 && !*(_BYTE *)(a1 + 1) && !*(_BYTE *)(a1 + 4) && !*(_QWORD *)(a1 + 48))
  {
    v11 = "Ping";
    if (a2)
      v11 = "Pong";
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%s id=%lu>"), v11, v4);
    goto LABEL_14;
  }
  if (!*(_BYTE *)(a1 + 4))
  {
    if (!a2)
      goto LABEL_13;
    v6 = 0;
LABEL_11:
    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%u.%02u"), *(unsigned __int8 *)(a1 + 1) >> 5, *(_BYTE *)(a1 + 1) & 0x1F);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("<Response id=%lu, token=%@, code=%@, size=%lu>"), v4, v6, v9, *(_QWORD *)(a1 + 24) + *(unsigned __int8 *)(a1 + 3));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hmf_hexadecimalStringWithOptions:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v2 & 1) != 0)
    goto LABEL_11;
  if (!v6)
  {
LABEL_13:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<Event id=%lu>"), v4, v12);
LABEL_14:
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    return v7;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<Request id=%lu, token=%@, size=%lu>"), v4, v6, *(_QWORD *)(a1 + 24) + *(unsigned __int8 *)(a1 + 3));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v7;
}

id stringForToken(int a1)
{
  void *v1;
  void *v2;
  int v4;

  v4 = a1;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", &v4, 4, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "hmf_hexadecimalStringWithOptions:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void sub_1CCF069BC(_Unwind_Exception *a1)
{
  __HMFActivityScopeLeave();
  _Unwind_Resume(a1);
}

void sub_1CCF06A3C(_Unwind_Exception *a1)
{
  __HMFActivityScopeLeave();
  _Unwind_Resume(a1);
}

void sub_1CCF06C94(_Unwind_Exception *a1)
{
  __HMFActivityScopeLeave();
  _Unwind_Resume(a1);
}

void sub_1CCF06F14(_Unwind_Exception *a1)
{
  __HMFActivityScopeLeave();
  _Unwind_Resume(a1);
}

void sub_1CCF071C4(_Unwind_Exception *a1)
{
  __HMFActivityScopeLeave();
  _Unwind_Resume(a1);
}

void sub_1CCF07594(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CCF07928(_Unwind_Exception *a1)
{
  __HMFActivityScopeLeave();
  _Unwind_Resume(a1);
}

void sub_1CCF07A48(_Unwind_Exception *a1)
{
  __HMFActivityScopeLeave();
  _Unwind_Resume(a1);
}

void sub_1CCF08488(_Unwind_Exception *a1)
{
  __HMFActivityScopeLeave();
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__12987(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__12988(uint64_t a1)
{

}

void sub_1CCF09C88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v8;
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v8 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1CCF0A2F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCF0A3E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__13201(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__13202(uint64_t a1)
{

}

void sub_1CCF0AA70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCF0B140(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCF0B3E0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

__CFString *HAPWiFiConfigurationUpdateStatusAsString(unint64_t a1)
{
  id v2;
  uint64_t v3;
  unint64_t v4;
  const __CFString *v5;
  void *v6;
  __CFString *v7;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (!a1)
    goto LABEL_26;
  v3 = 1;
  v4 = a1;
  do
  {
    if ((v3 & a1) == 0)
      goto LABEL_23;
    if (v3 >= 0x100000)
    {
      if (v3 >= 0x400000)
      {
        if (v3 == 0x400000)
        {
          v5 = CFSTR("HAPWiFiConfigurationUpdateStatusNetworkConfigured");
        }
        else
        {
          if (v3 != 0x800000)
            goto LABEL_23;
          v5 = CFSTR("HAPWiFiConfigurationUpdateStatusConnectionVerified");
        }
      }
      else if (v3 == 0x100000)
      {
        v5 = CFSTR("HAPWiFiConfigurationUpdateStatusAuthenticationFailed");
      }
      else
      {
        if (v3 != 0x200000)
          goto LABEL_23;
        v5 = CFSTR("HAPWiFiConfigurationUpdateStatusLinkEstablished");
      }
    }
    else if (v3 >= 0x40000)
    {
      if (v3 == 0x40000)
      {
        v5 = CFSTR("HAPWiFiConfigurationUpdateStatusUpdateSuccessful");
      }
      else
      {
        if (v3 != 0x80000)
          goto LABEL_23;
        v5 = CFSTR("HAPWiFiConfigurationUpdateStatusUpdateFailed");
      }
    }
    else
    {
      v5 = CFSTR("HAPWiFiConfigurationUpdateStatusUpdatePending");
      if (v3 != 0x10000)
      {
        if (v3 != 0x20000)
          goto LABEL_23;
        v5 = CFSTR("HAPWiFiConfigurationUpdateStatusSessionRestartRequired");
      }
    }
    v4 &= ~v3;
    objc_msgSend(v2, "addObject:", v5);
LABEL_23:
    v3 *= 2;
  }
  while (v3 - 1 < a1);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown options %lu"), v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v6);

  }
LABEL_26:
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "componentsJoinedByString:", CFSTR(", "));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = CFSTR("None");
  }

  return v7;
}

void sub_1CCF15FAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCF1626C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCF1845C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCF18518(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCF186D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1CCF18994(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__14169(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__14170(uint64_t a1)
{

}

uint64_t _CopyPairingIdentityDelegateCallback_f_14239(uint64_t a1, char **a2, void *a3, void *a4, void *a5)
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  size_t v13;
  char *v14;
  char *v15;
  id v16;
  uint64_t *v17;
  void *v18;
  void *v19;
  void *v20;
  size_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  size_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  uint64_t v32;
  int v34;
  unsigned int v35;

  v35 = 0;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = 0;
    goto LABEL_17;
  }
  objc_msgSend(v8, "_handleLocalPairingIdentityRequestWithStatus:", &v35);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v35)
    goto LABEL_15;
  if (a2)
  {
    objc_msgSend(v9, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "lengthOfBytesUsingEncoding:", 4);

    if (!v12)
      goto LABEL_18;
    v13 = v12 + 1;
    v14 = (char *)malloc_type_calloc(v13, 1uLL, 0x100004077774924uLL);
    if (!v14)
    {
      v34 = -6728;
      goto LABEL_20;
    }
    v15 = v14;
    objc_msgSend(v10, "identifier");
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    strlcpy(v15, (const char *)objc_msgSend(v16, "UTF8String"), v13);

    *a2 = v15;
  }
  v17 = (uint64_t *)MEMORY[0x1E0D28030];
  if (!a3)
    goto LABEL_11;
  objc_msgSend(v10, "publicKey");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
    goto LABEL_17;
  objc_msgSend(v10, "publicKey");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "data");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "length");
  v22 = *v17;

  if (v21 != v22)
  {
LABEL_18:
    v34 = -6743;
    goto LABEL_20;
  }
  objc_msgSend(v10, "publicKey");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "data");
  v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  memcpy(a3, (const void *)objc_msgSend(v24, "bytes"), v21);

LABEL_11:
  if (a4)
  {
    objc_msgSend(v10, "privateKey");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      objc_msgSend(v10, "privateKey");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "data");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "length");
      v29 = *v17;

      if (v28 == v29)
      {
        objc_msgSend(v10, "privateKey");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "data");
        v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        memcpy(a4, (const void *)objc_msgSend(v31, "bytes"), v28);

        goto LABEL_15;
      }
      goto LABEL_18;
    }
LABEL_17:
    v34 = -6727;
LABEL_20:
    v35 = v34;
  }
LABEL_15:
  v32 = v35;

  return v32;
}

uint64_t _SavePairedPeerDelegateCallback_f_14240(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  uint64_t v12;
  void *v13;
  HAPPairingIdentity *v14;
  HAPPairingIdentity *v15;

  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", a1, a2, 4);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", a3, 32);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v8)
      v11 = v9 == 0;
    else
      v11 = 1;
    if (v11)
    {
      v12 = 4294960591;
    }
    else
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28658]), "initWithPairingKeyData:", v9);
      v14 = -[HAPPairingIdentity initWithIdentifier:publicKey:privateKey:permissions:]([HAPPairingIdentity alloc], "initWithIdentifier:publicKey:privateKey:permissions:", v8, v13, 0, 0);
      v15 = v14;
      v12 = 4294960596;
      if (v14)
      {
        if (objc_msgSend(v7, "handleSavePeerRequestWithPeerIdentity:error:", v14, 0))
          v12 = 0;
        else
          v12 = 4294960596;
      }

    }
  }
  else
  {
    v12 = 4294960569;
  }

  return v12;
}

uint64_t _PromptForSetupCodeDelegateCallback_f(int a1, int a2, void *a3)
{
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint64_t v10;
  int v12;
  void *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1D17B7244]();
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v8;
    v14 = 1024;
    v15 = a1;
    _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_DEBUG, "%{public}@_PromptForSetupCodeDelegateCallback_f with flags: %u", (uint8_t *)&v12, 0x12u);

  }
  objc_autoreleasePoolPop(v6);
  v9 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((a1 & 0x20000) != 0)
    {
      objc_msgSend(v9, "handleBackoffRequestWithTimeout:", (double)a2);
    }
    else if ((a1 & 0x10000) != 0 && (objc_msgSend(v9, "isHandlingInvalidSetupCode") & 1) == 0)
    {
      objc_msgSend(v9, "handleInvalidSetupCodeAndRestart:", 1);
    }
    else
    {
      objc_msgSend(v9, "handleSetupCodeRequest");
    }
    v10 = 0;
  }
  else
  {
    v10 = 4294960569;
  }

  return v10;
}

uint64_t _PairingShowSetupCode_f(int a1, void *a2, uint64_t a3, void *a4)
{
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  size_t v15;
  uint64_t v16;
  size_t v17;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = (void *)MEMORY[0x1D17B7244]();
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v21 = v10;
    v22 = 1024;
    v23 = a1;
    _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_DEBUG, "%{public}@_PairingShowSetupCode_f with flags: %u", buf, 0x12u);

  }
  objc_autoreleasePoolPop(v8);
  v11 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v19 = 0;
    objc_msgSend(v11, "_showSetupCodeWithError:", &v19);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v19;
    v14 = v13;
    if (v12)
    {
      v15 = objc_msgSend(v12, "lengthOfBytesUsingEncoding:", 4);
      if (v15 <= a3 - 1)
      {
        v17 = v15;
        memcpy(a2, (const void *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String"), v15);
        v16 = 0;
        *((_BYTE *)a2 + v17) = 0;
      }
      else
      {
        v16 = 4294960553;
      }
    }
    else
    {
      v16 = objc_msgSend(v13, "code");
    }

  }
  else
  {
    v16 = 4294960591;
  }

  return v16;
}

void _PairSetupAfterM4(int a1, uint64_t a2, void *a3)
{
  id v4;
  int PeerFlags;
  void *v6;
  CFTypeID v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (a1 == 3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "pairingSession");
      PeerFlags = PairingSessionGetPeerFlags();
      objc_msgSend(v4, "pairingSession");
      v6 = (void *)PairingSessionCopyProperty();
      v7 = CFGetTypeID(v6);
      if (v7 == CFDataGetTypeID())
      {
        v8 = v6;
        v9 = (void *)MEMORY[0x1D17B7244]();
        v10 = v4;
        HMFGetOSLogHandle();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "shortDescription");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v16 = v12;
          v17 = 1024;
          v18 = PeerFlags;
          v19 = 2112;
          v20 = v13;
          _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_INFO, "%{public}@Pair-setup after M4, flags %08X  productData %@", buf, 0x1Cu);

        }
        objc_autoreleasePoolPop(v9);
        +[HAPAccessory productDataStringFromData:](HAPAccessory, "productDataStringFromData:", v8);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "_handleProductData:", v14);

        if (!v6)
          goto LABEL_8;
      }
      else
      {
        v8 = 0;
        if (!v6)
          goto LABEL_8;
      }
      CFRelease(v6);
LABEL_8:

    }
  }

}

__CFString *StringForSystemPowerChangedMessage(uint64_t a1)
{
  unsigned int v1;
  unint64_t v2;
  __CFString *v3;

  HIDWORD(v2) = a1;
  LODWORD(v2) = a1 + 536870288;
  v1 = v2 >> 4;
  if (v1 < 0xC && ((0xA07u >> v1) & 1) != 0)
  {
    v3 = off_1E894BF40[v1];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing string for IOSystemMessage: 0x%X"), a1);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

void sub_1CCF1CC20(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCF1CCA0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCF1CE8C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCF1D028(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCF1D618(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCF1D674(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCF1D6DC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCF1EC3C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCF1ED88(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCF1F1B8(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCF1F324(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCF1F788(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCF1FC80(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCF21114(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

const __CFString *HAPAccessoryServerPairSetupTypeToString(unint64_t a1)
{
  if (a1 > 7)
    return &stru_1E894EFE8;
  else
    return off_1E894C098[a1];
}

id HAPPairingStateFromData(void *a1)
{
  id v1;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");

  TLV8Get();
  return 0;
}

__CFString *HAPUserPermissionTypeDescription(unint64_t a1)
{
  if (a1 < 6)
    return off_1E894C0D8[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<Unknown value: %ld>"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *HAPLinkTypeDescription(unint64_t a1)
{
  if (a1 < 3)
    return off_1E894C108[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<Unknown value: %ld>"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *HAPCommunicationProtocolDescription(unint64_t a1)
{
  if (a1 < 3)
    return off_1E894C120[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<Unknown value: %ld>"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

const __CFString *HAPLinkLayerTypeDescription(unint64_t a1)
{
  if (a1 > 4)
    return CFSTR("Ethernet");
  else
    return off_1E894C138[a1];
}

__CFString *HAPCharacteristicValueTransitionTypesAsString(unint64_t a1)
{
  id v2;
  uint64_t v3;
  unint64_t v4;
  const __CFString *v5;
  void *v6;
  __CFString *v7;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (!a1)
    goto LABEL_12;
  v3 = 1;
  v4 = a1;
  do
  {
    if ((v3 & a1) == 0)
      goto LABEL_9;
    if (v3 == 1)
    {
      v5 = CFSTR("HAPCharacteristicValueTransitionTypeLinear");
    }
    else
    {
      if (v3 != 2)
        goto LABEL_9;
      v5 = CFSTR("HAPCharacteristicValueTransitionTypeLinearDerived");
    }
    v4 &= ~v3;
    objc_msgSend(v2, "addObject:", v5);
LABEL_9:
    v3 *= 2;
  }
  while (v3 - 1 < a1);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown options %lu"), v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v6);

  }
LABEL_12:
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "componentsJoinedByString:", CFSTR(", "));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = CFSTR("None");
  }

  return v7;
}

__CFString *HAPCharacteristicFormatToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0xE)
    return (__CFString *)0;
  else
    return *off_1E894C390[a1 - 1];
}

__CFString *HAPCharacteristicUnitToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 4)
    return (__CFString *)0;
  else
    return *off_1E894C408[a1 - 1];
}

uint64_t HAPCharacteristicUnitFromString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("seconds")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("arcdegrees")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("celsius")) & 1) != 0)
  {
    v2 = 3;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("percentage")) & 1) != 0)
  {
    v2 = 4;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("lux")))
  {
    v2 = 5;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

void sub_1CCF289FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCF28B7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1CCF28D08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  uint64_t v13;
  va_list va;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v13 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1CCF28E5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCF28F64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__16034(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__16035(uint64_t a1)
{

}

void sub_1CCF294AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCF29768(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCF29EDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCF2A054(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCF2A1CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCF2A344(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCF2A4BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCF2A680(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCF2A80C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCF2A984(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCF2B2B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__16245(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__16246(uint64_t a1)
{

}

void sub_1CCF2C20C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  uint64_t v33;

  _Block_object_dispose((const void *)(v33 - 144), 8);
  _Block_object_dispose((const void *)(v33 - 112), 8);
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

void sub_1CCF2C678(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  uint64_t v34;

  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose((const void *)(v34 - 216), 8);
  _Block_object_dispose((const void *)(v34 - 184), 8);
  _Block_object_dispose((const void *)(v34 - 152), 8);
  _Block_object_dispose((const void *)(v34 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_1CCF2C834(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void __validateAccessoryRuntimeInformationService_block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  uint8_t v14[16];
  uint8_t buf[16];

  v6 = a2;
  objc_msgSend(v6, "type");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("0000023C-0000-1000-8000-0026BB765291"));

  if (v8)
  {
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v9 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_ERROR, "Accessory Runtime Information service contains more than one Ping characteristic", buf, 2u);
      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      *a4 = 1;
    }
    objc_msgSend(v6, "metadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "format");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = HAPCharacteristicFormatFromString(v11);

    if (v12 != 12)
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v13 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v14 = 0;
        _os_log_error_impl(&dword_1CCE01000, v13, OS_LOG_TYPE_ERROR, "Accessory Runtime Information service contains an invalid Ping characteristic", v14, 2u);
      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      *a4 = 1;
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }

}

void sub_1CCF2F83C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_unfair_lock_t lock)
{
  os_unfair_lock_s *v10;

  os_unfair_lock_unlock(v10);
  _Unwind_Resume(a1);
}

void sub_1CCF30034(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCF30098(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCF30120(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCF3170C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  id *v25;

  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CCF31BA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCF3244C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,char a58)
{
  _Block_object_dispose(&a58, 8);
  _Unwind_Resume(a1);
}

void sub_1CCF327E8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1CCF32D7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  uint64_t v21;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Block_object_dispose((const void *)(v21 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1CCF33284(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 144));
  _Unwind_Resume(a1);
}

void sub_1CCF33744(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

void sub_1CCF33A60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  id *v25;

  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CCF33F60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCF34060(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CCF34510(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCF34E54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__17240(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__17241(uint64_t a1)
{

}

id cacheFileIdentifierForAccessoryServer(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a1;
  objc_msgSend(a2, "deviceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingFormat:", CFSTR("+%@"), v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void sub_1CCF366E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1CCF37790(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a21, 8);
  _Unwind_Resume(a1);
}

void __characteristicDescriptionsFromRequest_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "characteristic");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  characteristicDescriptionFromCharacteristic(v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

id characteristicDescriptionFromCharacteristic(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = a1;
  objc_msgSend(v2, "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HAPCharacteristic hap2_shortTypeFromUUID:](HAPCharacteristic, "hap2_shortTypeFromUUID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "instanceID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@ [%@]"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void sub_1CCF37FF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCF3933C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCF39FF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  uint64_t v32;

  _Block_object_dispose(&a32, 8);
  _Block_object_dispose((const void *)(v32 - 184), 8);
  _Block_object_dispose((const void *)(v32 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1CCF3AEBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_list va;

  va_start(va, a5);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCF3B308(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCF3B3EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCF3C318(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_1CCF3C708(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCF3C880(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCF3C960(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCF3CA40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCF3CBB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCF3CD30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCF3CFCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CCF3D198(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1CCF3D4A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CCF3D63C(_Unwind_Exception *a1)
{
  __HMFActivityScopeLeave();
  _Unwind_Resume(a1);
}

void sub_1CCF3DA40(_Unwind_Exception *a1)
{
  __HMFActivityScopeLeave();
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__17805(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__17806(uint64_t a1)
{

}

void sub_1CCF41878(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCF45358(_Unwind_Exception *a1)
{
  __HMFActivityScopeLeave();
  _Unwind_Resume(a1);
}

void sub_1CCF45448(_Unwind_Exception *a1)
{
  __HMFActivityScopeLeave();
  _Unwind_Resume(a1);
}

void sub_1CCF4556C(_Unwind_Exception *a1)
{
  __HMFActivityScopeLeave();
  _Unwind_Resume(a1);
}

void sub_1CCF4565C(_Unwind_Exception *a1)
{
  __HMFActivityScopeLeave();
  _Unwind_Resume(a1);
}

void sub_1CCF486B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  __HMFActivityScopeLeave();
  _Block_object_dispose(&a29, 8);
  __HMFActivityScopeLeave();
  _Block_object_dispose(&a41, 8);
  _Unwind_Resume(a1);
}

void sub_1CCF488E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1CCF48BA4(_Unwind_Exception *a1)
{
  __HMFActivityScopeLeave();
  _Unwind_Resume(a1);
}

void sub_1CCF48D44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  __HMFActivityScopeLeave();
  _Unwind_Resume(a1);
}

void sub_1CCF48EE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  __HMFActivityScopeLeave();
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__18826(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__18827(uint64_t a1)
{

}

void sub_1CCF49940(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t coapNetworkRead(uint64_t a1, _BYTE *a2)
{
  uint64_t result;

  result = coap_network_read(a1, (uint64_t)a2);
  if (a2[37] == 30)
    a2[36] = 0;
  if (a2[5] == 30)
    a2[4] = 0;
  return result;
}

void coapResponseHandler(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  id v8;
  void *v9;
  NSObject *v10;
  _DWORD v11[2];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!a2)
    __assert_rtn("coap_session_get_app_data", "coap_session.c", 92, "session");
  v8 = *(id *)(a2 + 344);
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "didReceiveResponseInSession:messageID:response:", a2, a5, a4);
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v10 = hap2Log_coap;
    if (os_log_type_enabled((os_log_t)hap2Log_coap, OS_LOG_TYPE_ERROR))
    {
      v11[0] = 67109120;
      v11[1] = a5;
      _os_log_error_impl(&dword_1CCE01000, v10, OS_LOG_TYPE_ERROR, "Received response with message id %i but session has no app data", (uint8_t *)v11, 8u);
    }
  }

}

uint64_t coapEventHandler(uint64_t a1, int a2)
{
  NSObject *v3;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v3 = hap2Log_coap;
  if (os_log_type_enabled((os_log_t)hap2Log_coap, OS_LOG_TYPE_DEBUG))
  {
    v5[0] = 67109120;
    v5[1] = a2;
    _os_log_debug_impl(&dword_1CCE01000, v3, OS_LOG_TYPE_DEBUG, "Received event %u", (uint8_t *)v5, 8u);
  }
  return 0;
}

void coapNackHandler(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, int a5)
{
  id v9;
  void *v10;
  NSObject *v11;
  _DWORD v12[2];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!a2)
    __assert_rtn("coap_session_get_app_data", "coap_session.c", 92, "session");
  v9 = *(id *)(a2 + 344);
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "didFailToSendMessageInSession:messageID:message:reason:", a2, a5, a3, a4);
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v11 = hap2Log_coap;
    if (os_log_type_enabled((os_log_t)hap2Log_coap, OS_LOG_TYPE_ERROR))
    {
      v12[0] = 67109120;
      v12[1] = a5;
      _os_log_error_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_ERROR, "Received nack for message id %i but session has no app data", (uint8_t *)v12, 8u);
    }
  }

}

void coapPongHandler(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  id v6;
  void *v7;
  NSObject *v8;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (!a2)
    __assert_rtn("coap_session_get_app_data", "coap_session.c", 92, "session");
  v6 = *(id *)(a2 + 344);
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "didReceivePongInSession:messageID:", a2, a4);
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v8 = hap2Log_coap;
    if (os_log_type_enabled((os_log_t)hap2Log_coap, OS_LOG_TYPE_ERROR))
    {
      v9[0] = 67109120;
      v9[1] = a4;
      _os_log_error_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_ERROR, "Received pong with message id %i but session has no app data", (uint8_t *)v9, 8u);
    }
  }

}

void coapRequestHandler(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  id v10;
  void *v11;
  NSObject *v12;
  int v13;
  _DWORD v14[2];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!a3)
    __assert_rtn("coap_session_get_app_data", "coap_session.c", 92, "session");
  v10 = *(id *)(a3 + 344);
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "didReceiveRequestInSession:messageID:request:response:", a3, *(unsigned __int16 *)(a4 + 6), a4, a7);
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v12 = hap2Log_coap;
    if (os_log_type_enabled((os_log_t)hap2Log_coap, OS_LOG_TYPE_ERROR))
    {
      v13 = *(unsigned __int16 *)(a4 + 6);
      v14[0] = 67109120;
      v14[1] = v13;
      _os_log_error_impl(&dword_1CCE01000, v12, OS_LOG_TYPE_ERROR, "Received request with message id %i but session has no app data", (uint8_t *)v14, 8u);
    }
  }

}

void coapLogHandler(unsigned int a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL4 v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  int v14;
  _DWORD v15[7];

  *(_QWORD *)&v15[5] = *MEMORY[0x1E0C80C00];
  if (a1 == 6)
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v5 = hap2Log_coap;
    if (os_log_type_enabled((os_log_t)hap2Log_coap, OS_LOG_TYPE_INFO))
    {
      v14 = 136380675;
      *(_QWORD *)v15 = a2;
      v6 = v5;
      v7 = OS_LOG_TYPE_INFO;
LABEL_16:
      _os_log_impl(&dword_1CCE01000, v6, v7, "<libcoap> %{private}s", (uint8_t *)&v14, 0xCu);
    }
  }
  else
  {
    if (a1 == 7)
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v4 = hap2Log_coap;
      if (os_log_type_enabled((os_log_t)hap2Log_coap, OS_LOG_TYPE_DEBUG))
      {
        v14 = 136380675;
        *(_QWORD *)v15 = a2;
        _os_log_debug_impl(&dword_1CCE01000, v4, OS_LOG_TYPE_DEBUG, "<libcoap> %{private}s", (uint8_t *)&v14, 0xCu);
      }
      return;
    }
    if ((a1 & 0xFFFFFFFE) != 4)
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v9 = hap2Log_coap;
      v10 = os_log_type_enabled((os_log_t)hap2Log_coap, OS_LOG_TYPE_ERROR);
      if (a1 > 3)
      {
        if (!v10)
          return;
        v14 = 67109379;
        v15[0] = a1;
        LOWORD(v15[1]) = 2081;
        *(_QWORD *)((char *)&v15[1] + 2) = a2;
        v11 = "<libcoap> Unknown log level (%u) for message: %{private}s";
        v12 = v9;
        v13 = 18;
      }
      else
      {
        if (!v10)
          return;
        v14 = 136380675;
        *(_QWORD *)v15 = a2;
        v11 = "<libcoap> %{private}s";
        v12 = v9;
        v13 = 12;
      }
      _os_log_error_impl(&dword_1CCE01000, v12, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v14, v13);
      return;
    }
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v8 = hap2Log_coap;
    if (os_log_type_enabled((os_log_t)hap2Log_coap, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 136380675;
      *(_QWORD *)v15 = a2;
      v6 = v8;
      v7 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_16;
    }
  }
}

BOOL fd_set_flag(int a1)
{
  int v2;

  v2 = fcntl(a1, 3, 0);
  return v2 != -1 && fcntl(a1, 4, v2 | 0x1000004u) != -1;
}

void sub_1CCF4B538(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCF4B754(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCF4C1D4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCF4C288(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCF4CA48(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCF4CABC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCF4CB5C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCF4DAAC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCF4F0D4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCF4F5D8(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

__CFString *HAPWiProxScanStateString(uint64_t a1)
{
  __CFString *v1;
  void *v2;

  if ((unint64_t)(a1 - 1) >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringValue");
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v1 = off_1E894CED0[a1 - 1];
  }
  return v1;
}

void sub_1CCF5014C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1CCF5024C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1CCF50328(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1CCF505A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23)
{
  id *v23;
  id *v24;
  uint64_t v25;

  objc_destroyWeak(v24);
  objc_destroyWeak(v23);
  objc_destroyWeak((id *)(v25 - 96));
  _Block_object_dispose(&a23, 8);
  _Unwind_Resume(a1);
}

void sub_1CCF50A90(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1CCF50C0C(_Unwind_Exception *a1)
{
  __HMFActivityScopeLeave();
  _Unwind_Resume(a1);
}

void sub_1CCF51234(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1CCF512F8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1CCF51CD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a16, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__19616(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__19617(uint64_t a1)
{

}

void sub_1CCF520E4(_Unwind_Exception *a1)
{
  __HMFActivityScopeLeave();
  _Unwind_Resume(a1);
}

void sub_1CCF52428(_Unwind_Exception *a1)
{
  __HMFActivityScopeLeave();
  _Unwind_Resume(a1);
}

void sub_1CCF52724(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 168), 8);
  __HMFActivityScopeLeave();
  _Unwind_Resume(a1);
}

void sub_1CCF53618(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1CCF539D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCF54590(_Unwind_Exception *a1)
{
  __HMFActivityScopeLeave();
  _Unwind_Resume(a1);
}

void sub_1CCF55118(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a11);
  _Unwind_Resume(a1);
}

void sub_1CCF55B44(_Unwind_Exception *a1)
{
  __HMFActivityScopeLeave();
  _Unwind_Resume(a1);
}

void sub_1CCF56D90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,char a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61,uint64_t a62,uint64_t a63)
{
  char a67;

  _Block_object_dispose(&STACK[0x228], 8);
  _Block_object_dispose(&a61, 8);
  _Block_object_dispose(&a67, 8);
  _Block_object_dispose(&a41, 8);
  _Block_object_dispose(&a50, 8);
  __HMFActivityScopeLeave();
  __HMFActivityScopeLeave();
  _Unwind_Resume(a1);
}

void sub_1CCF577D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id HAPStringFromAccessoryServerSession(uint64_t a1)
{
  void *v2;
  uint64_t i;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (a1 >= 1)
  {
    for (i = 1; i <= a1 && i; i *= 2)
    {
      if ((i & a1) == 0)
        continue;
      if (i <= 15)
      {
        v4 = CFSTR("CameraStreaming");
        switch(i)
        {
          case 1:
            goto LABEL_15;
          case 2:
            v4 = CFSTR("FirmwareDownloading");
            goto LABEL_15;
          case 4:
            v4 = CFSTR("LogUploading");
            goto LABEL_15;
          case 8:
            v4 = CFSTR("TargetController");
            goto LABEL_15;
          default:
            continue;
        }
        continue;
      }
      switch(i)
      {
        case 16:
          v4 = CFSTR("SiriEndpoint");
          break;
        case 32:
          v4 = CFSTR("DiagnosticsTransfer");
          break;
        case 64:
          v4 = CFSTR("ForegroundClientNotifications");
          break;
        default:
          continue;
      }
LABEL_15:
      objc_msgSend(v2, "addObject:", v4);
    }
  }
  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v2, "componentsJoinedByString:", CFSTR(","));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@>"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t HAPAccessoryServerSessionTypesFromString(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  char v4;
  void *v5;
  char v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  void *v15;
  int v16;

  v1 = a1;
  v2 = 1;
  HAPStringFromAccessoryServerSession(1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v1, "isEqual:", v3);

  if ((v4 & 1) == 0)
  {
    v2 = 2;
    HAPStringFromAccessoryServerSession(2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v1, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      v2 = 4;
      HAPStringFromAccessoryServerSession(4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v1, "isEqual:", v7);

      if ((v8 & 1) == 0)
      {
        v2 = 8;
        HAPStringFromAccessoryServerSession(8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v1, "isEqual:", v9);

        if ((v10 & 1) == 0)
        {
          v2 = 16;
          HAPStringFromAccessoryServerSession(16);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v1, "isEqual:", v11);

          if ((v12 & 1) == 0)
          {
            v2 = 32;
            HAPStringFromAccessoryServerSession(32);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v1, "isEqual:", v13);

            if ((v14 & 1) == 0)
            {
              HAPStringFromAccessoryServerSession(64);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v1, "isEqual:", v15);

              if (v16)
                v2 = 64;
              else
                v2 = 0;
            }
          }
        }
      }
    }
  }

  return v2;
}

void sub_1CCF589B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CCF58AA4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1CCF58CDC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1CCF59860(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void __shouldLogPrivateInformation_block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "preferenceForKey:", CFSTR("shouldLogPrivateInformation"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  shouldLogPrivateInformation_shouldLogPrivateInformation = objc_msgSend(v0, "BOOLValue");

}

void sub_1CCF660E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t _PairSetupPromptForSetupCodeDelegateCallback_f_20425(int a1, int a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD block[5];
  _QWORD v15[5];
  int v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1D17B7244]();
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v18 = v8;
    _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_INFO, "%{public}@Pair-setup prompting for password...\n", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(v5, "_cancelConnectionLifetimeTimer");
  if ((a1 & 0x30000) == 0)
  {
    if (objc_msgSend(v5, "_delegateRespondsToSelector:", sel_accessoryServer_promptUserForPasswordWithType_))
    {
      objc_msgSend(v5, "delegateQueue");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = v9;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = ___PairSetupPromptForSetupCodeDelegateCallback_f_block_invoke_2;
      block[3] = &unk_1E894DD08;
      block[4] = v5;
      v11 = block;
      goto LABEL_8;
    }
LABEL_9:
    v12 = 4294960594;
    goto LABEL_10;
  }
  if (!objc_msgSend(v5, "_delegateRespondsToSelector:", sel_accessoryServer_didReceiveBadPasswordThrottleAttemptsWithDelay_))goto LABEL_9;
  objc_msgSend(v5, "delegateQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = ___PairSetupPromptForSetupCodeDelegateCallback_f_block_invoke;
  v15[3] = &unk_1E894D748;
  v15[4] = v5;
  v16 = a2;
  v11 = v15;
LABEL_8:
  dispatch_async(v9, v11);

  v12 = 0;
LABEL_10:

  return v12;
}

uint64_t _CopyPairingIdentityDelegateCallback_f_20426(int a1, char **a2, _OWORD *a3, _OWORD *a4, void *a5)
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id *v24;
  id *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  _OWORD *v33;
  __int128 v34;
  _OWORD *v35;
  __int128 v36;
  uint64_t v37;
  size_t v38;
  char *v39;
  char *v40;
  _OWORD *v42;
  _OWORD *v43;
  id v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  id v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  objc_msgSend(v8, "pairingRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pairingIdentity");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;

  }
  else
  {
    objc_msgSend(v8, "keyBag");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "currentIdentity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      v30 = 0;
      v31 = 0;
      v28 = 0;
      v26 = 0;
      goto LABEL_23;
    }
  }
  v42 = a3;
  v13 = (void *)MEMORY[0x1D17B7244]();
  v14 = v8;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v54 = v16;
    v55 = 2112;
    v56 = v11;
    _os_log_impl(&dword_1CCE01000, v15, OS_LOG_TYPE_DEBUG, "%{public}@Using Pairing Identity : %@", buf, 0x16u);

  }
  v45 = v8;

  objc_autoreleasePoolPop(v13);
  objc_msgSend(v11, "publicKey");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "data");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = a4;
  if (a4)
  {
    objc_msgSend(v11, "privateKey");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "data");
    v21 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "keyStore");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = (void *)v21;
    v52 = v18;
    v50 = v19;
    objc_msgSend(v14, "identifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = 0;
    v24 = &v50;
    v25 = (id *)&v49;
    objc_msgSend(v22, "getControllerPublicKey:secretKey:username:allowCreation:forAccessory:error:", &v52, &v51, &v50, a1 != 0, v23, &v49);
    v26 = v52;

    v27 = v51;
    v18 = (void *)v21;
    v28 = v51;
  }
  else
  {
    objc_msgSend(v14, "keyStore");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v19;
    v48 = v18;
    objc_msgSend(v14, "identifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0;
    v24 = &v47;
    v25 = (id *)&v46;
    objc_msgSend(v22, "getControllerPublicKey:secretKey:username:allowCreation:forAccessory:error:", &v48, 0, &v47, a1 != 0, v23, &v46);
    v28 = 0;
    v27 = v48;
    v26 = v48;
  }
  v29 = v27;

  v30 = *v24;
  v31 = *v25;

  v32 = objc_msgSend(v31, "code");
  if ((_DWORD)v32)
  {
    v8 = v45;
    goto LABEL_24;
  }
  v8 = v45;
  if (!v26)
    goto LABEL_23;
  if (objc_msgSend(v26, "length") != 32)
    goto LABEL_25;
  v26 = objc_retainAutorelease(v26);
  v33 = (_OWORD *)objc_msgSend(v26, "bytes");
  v34 = v33[1];
  *v42 = *v33;
  v42[1] = v34;
  if (!v43)
    goto LABEL_17;
  if (!v28)
  {
LABEL_23:
    v32 = 4294960569;
    goto LABEL_24;
  }
  if (objc_msgSend(v28, "length") != 32)
    goto LABEL_25;
  v35 = (_OWORD *)objc_msgSend(objc_retainAutorelease(v28), "bytes");
  v36 = v35[1];
  *v43 = *v35;
  v43[1] = v36;
LABEL_17:
  v32 = 0;
  if (a2 && v30)
  {
    v37 = objc_msgSend(v30, "lengthOfBytesUsingEncoding:", 4);
    if (v37)
    {
      v38 = v37 + 1;
      v39 = (char *)malloc_type_calloc(v37 + 1, 1uLL, 0x100004077774924uLL);
      if (v39)
      {
        v40 = v39;
        v30 = objc_retainAutorelease(v30);
        strlcpy(v40, (const char *)objc_msgSend(v30, "UTF8String"), v38);
        v32 = 0;
        *a2 = v40;
      }
      else
      {
        v32 = 4294960568;
      }
      goto LABEL_24;
    }
LABEL_25:
    v32 = 4294960553;
  }
LABEL_24:

  return v32;
}

uint64_t _SavePairedPeerDelegateCallback_f_20427(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", a1, a2, 4);
  objc_msgSend(v7, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if ((v10 & 1) != 0)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", a3, 32);
    objc_msgSend(v7, "keyStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    objc_msgSend(v12, "savePublicKey:forAccessoryName:error:", v11, v8, &v28);
    v13 = v28;

    v14 = objc_msgSend(v13, "code");
    if (!(_DWORD)v14)
    {
      objc_msgSend(v7, "associateAccessoryWithControllerKeyUsingAccessoryPublicKey:", v11);
      objc_msgSend(v7, "keyStore");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_opt_respondsToSelector();

      if ((v16 & 1) != 0)
      {
        objc_msgSend(v7, "keyStore");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "peripheral");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "identifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v13;
        objc_msgSend(v17, "updatePeripheralIdentifier:forAccessoryIdentifier:protocolVersion:previousVersion:resumeSessionID:error:", v19, v20, objc_msgSend(v7, "hapBLEProtocolVersion"), 0, 0, &v27);
        v21 = v27;

        v13 = v21;
        v14 = objc_msgSend(v21, "code");
      }
      else
      {
        v14 = 0;
      }
    }

  }
  else
  {
    v22 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "identifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v30 = v24;
      v31 = 2080;
      v32 = "OSStatus _SavePairedPeerDelegateCallback_f(const void *, size_t, const uint8_t *, void *)";
      v33 = 2112;
      v34 = v8;
      v35 = 2112;
      v36 = v25;
      _os_log_impl(&dword_1CCE01000, v23, OS_LOG_TYPE_ERROR, "%{public}@%s: Accessory username provided by Pair Setup, %@, doesn't match username provided by BTLE advertisement data, %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v22);
    v14 = 4294960548;
  }

  return v14;
}

id _convertFromBTLEToHAPValue(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v5 = HAPCharacteristicFormatFromString(v3);
  if (v5)
  {
    v6 = v5;
    +[HAPDataValueTransformer defaultDataValueTransformer](HAPDataValueTransformer, "defaultDataValueTransformer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    objc_msgSend(v7, "reverseTransformedValue:format:error:", v4, v6, &v21);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v21;

    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = v8;
LABEL_14:

        goto LABEL_15;
      }
      v14 = (void *)MEMORY[0x1D17B7244]();
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v23 = v16;
        v24 = 2112;
        v25 = v3;
        v17 = "%{public}@[HAPAccessoryServerBTLE] Invalid Format %@ for StepValue";
        v18 = v15;
        v19 = 22;
        goto LABEL_12;
      }
    }
    else
    {
      v14 = (void *)MEMORY[0x1D17B7244]();
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v23 = v16;
        v24 = 2112;
        v25 = v4;
        v26 = 2112;
        v27 = v3;
        v28 = 2112;
        v29 = v9;
        v17 = "%{public}@[HAPAccessoryServerBTLE] Failed to transform value, %@, with format, %@, with error: %@";
        v18 = v15;
        v19 = 42;
LABEL_12:
        _os_log_impl(&dword_1CCE01000, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);

      }
    }

    objc_autoreleasePoolPop(v14);
    v10 = 0;
    goto LABEL_14;
  }
  v11 = (void *)MEMORY[0x1D17B7244]();
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v23 = v13;
    v24 = 2112;
    v25 = v3;
    _os_log_impl(&dword_1CCE01000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@[HAPAccessoryServerBTLE] Invalid format type string '%@'", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v11);
  v10 = 0;
LABEL_15:

  return v10;
}

void _updateHAPConstraintsFromBTLEValidRange(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  HAPMetadataConstraints *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  if ((objc_msgSend(v4, "length") & 1) != 0)
  {
    v18 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543618;
      v26 = v20;
      v27 = 2048;
      v28 = objc_msgSend(v4, "length");
      _os_log_impl(&dword_1CCE01000, v19, OS_LOG_TYPE_ERROR, "%{public}@### Invalid Range data length: %ld", (uint8_t *)&v25, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
  }
  else
  {
    objc_msgSend(v3, "constraints");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v6 = objc_alloc_init(HAPMetadataConstraints);
      objc_msgSend(v3, "setConstraints:", v6);

    }
    v7 = (unint64_t)objc_msgSend(v4, "length") >> 1;
    v8 = (unint64_t)objc_msgSend(v4, "length") >> 1;
    v9 = (unint64_t)objc_msgSend(v4, "length") >> 1;
    objc_msgSend(v4, "subdataWithRange:", 0, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subdataWithRange:", v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "format");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("string"));

    if (v13)
    {
      _convertFromBTLEToHAPValue(CFSTR("uint16"), v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "constraints");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setMinLength:", v14);

      _convertFromBTLEToHAPValue(CFSTR("uint16"), v11);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "constraints");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setMaxLength:", v16);
    }
    else
    {
      objc_msgSend(v3, "format");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      _convertFromBTLEToHAPValue(v21, v10);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "constraints");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setMinimumValue:", v22);

      objc_msgSend(v3, "format");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      _convertFromBTLEToHAPValue(v16, v11);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "constraints");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setMaximumValue:", v17);

    }
  }

}

void sub_1CCF6BAE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CCF6C9F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CCF6CD60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CCF709B4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

id HAPWACWiFiBandToString(char a1)
{
  __CFString *v2;
  uint64_t v3;
  void *v4;

  if ((a1 & 1) == 0)
  {
    v2 = CFSTR("<");
    if ((a1 & 2) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  objc_msgSend(CFSTR("<"), "stringByAppendingString:", CFSTR(" 2.4"));
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ((a1 & 2) != 0)
  {
LABEL_5:
    -[__CFString stringByAppendingString:](v2, "stringByAppendingString:", CFSTR(" 5"));
    v3 = objc_claimAutoreleasedReturnValue();

    v2 = (__CFString *)v3;
  }
LABEL_6:
  -[__CFString stringByAppendingString:](v2, "stringByAppendingString:", CFSTR(" GHz >"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void sub_1CCF71380(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 56));
  _Unwind_Resume(a1);
}

void sub_1CCF7706C(_Unwind_Exception *a1)
{
  __HMFActivityScopeLeave();
  _Unwind_Resume(a1);
}

void sub_1CCF79770(_Unwind_Exception *a1)
{
  __HMFActivityScopeLeave();
  _Unwind_Resume(a1);
}

__CFString *HAPDiagnosticsSnapshotFormatAsString(uint64_t a1)
{
  __CFString *v1;

  if (!a1)
    return CFSTR("HAPDiagnosticsSnapshotFormatZip");
  if (a1 == 1)
  {
    v1 = CFSTR("HAPDiagnosticsSnapshotFormatText");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown HAPDiagnosticsSnapshotFormat %ld"), a1);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

__CFString *HAP2TLVThreadOperationTypeAsString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) < 4)
    return off_1E894DBA8[a1 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown HAP2TLVThreadOperationType %ld"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

void sub_1CCF7A9F8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1CCF7AB94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CCF7AC88(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1CCF7AD88(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1CCF7AEAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CCF7AFA8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1CCF7B0D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CCF7B1EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CCF7B300(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CCF7B454(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CCF7B5A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CCF7B6A4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1CCF7B7F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CCF7B970(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CCF7C1B0(_Unwind_Exception *a1)
{
  __HMFActivityScopeLeave();
  _Unwind_Resume(a1);
}

const __CFString *HAP2UnpairedAccessoryServerPermissionTypeToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3)
    return CFSTR("Unknown Type");
  else
    return off_1E894DCB8[a1 - 1];
}

void sub_1CCF7CA40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CCF7CB90(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1CCF7CD38(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sessionEventCallback(uint64_t a1, int a2, int a3, uint64_t a4)
{
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int Default;
  int v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v7 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543874;
      v19 = v9;
      v20 = 1024;
      v21 = a2;
      v22 = 1024;
      v23 = a3;
      _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@[CBConnectionsObserver] sessionEventCallback: BTServer detached, event ID 0x%08x with error 0x%08x", (uint8_t *)&v18, 0x18u);

    }
    objc_autoreleasePoolPop(v7);
    *(_QWORD *)(a4 + 40) = 0;
    *(_QWORD *)(a4 + 48) = 0;
  }
  else
  {
    if (a3)
    {
      v10 = (void *)MEMORY[0x1D17B7244]();
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543618;
        v19 = v12;
        v20 = 1024;
        v21 = a3;
        _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_ERROR, "%{public}@[CBConnectionsObserver] (BTServer) sessionEventCallback: Failed to attach to BTServer with error 0x%08x", (uint8_t *)&v18, 0x12u);

      }
    }
    else
    {
      *(_QWORD *)(a4 + 40) = a1;
      Default = BTLocalDeviceGetDefault();
      if (Default)
      {
        v14 = Default;
        v10 = (void *)MEMORY[0x1D17B7244]();
        HMFGetOSLogHandle();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = 138543618;
          v19 = v16;
          v20 = 1024;
          v21 = v14;
          _os_log_impl(&dword_1CCE01000, v15, OS_LOG_TYPE_ERROR, "%{public}@[CBConnectionsObserver] (BTServer) sessionEventCallback: failed to get local device handle with error 0x%08x", (uint8_t *)&v18, 0x12u);

        }
      }
      else
      {
        *(_BYTE *)(a4 + 248) = 0;
        v10 = (void *)MEMORY[0x1D17B7244]();
        HMFGetOSLogHandle();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = 138543362;
          v19 = v17;
          _os_log_impl(&dword_1CCE01000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@[CBConnectionsObserver] (BTServer) sessionEventCallback: attached.", (uint8_t *)&v18, 0xCu);

        }
      }

    }
    objc_autoreleasePoolPop(v10);
  }
}

void serviceEventCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1D17B7244]();
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)btServiceEvent2String;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543874;
    v14 = v9;
    v15 = 2112;
    v16 = v12;
    v17 = 1024;
    v18 = a5;
    _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@[CBConnectionsObserver] serviceEventCallbackwith event %@  result 0x%08x", (uint8_t *)&v13, 0x1Cu);

  }
  objc_autoreleasePoolPop(v7);
}

void localDeviceCallback(uint64_t a1, uint64_t a2, int a3)
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1D17B7244]();
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)btLocalDeviceState2String;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543874;
    v12 = v7;
    v13 = 2112;
    v14 = v10;
    v15 = 1024;
    v16 = a3;
    _os_log_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_ERROR, "%{public}@[CBConnectionsObserver] localDeviceCallback with event %@ and result 0x%08x", (uint8_t *)&v11, 0x1Cu);

  }
  objc_autoreleasePoolPop(v5);
}

void sub_1CCF7F55C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1CCF7F8A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CCF7FD2C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1CCF7FE54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CCF7FF7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CCF80078(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1CCF801A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CCF80450(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1CCF80534(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1CCF80654(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1CCF80830(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1CCF80914(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1CCF80A70(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1CCF80CA4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1CCF815D4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCF825F0(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

id _extractResponseHeaderFields(void *a1, _BYTE *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  int v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  if ((unint64_t)objc_msgSend(v7, "length") > 2)
  {
    objc_msgSend(v7, "getBytes:length:", a2, 1);
    objc_msgSend(v7, "subdataWithRange:", 1, objc_msgSend(v7, "length") - 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if ((*a2 & 2) != 0)
    {
      objc_msgSend(v12, "getBytes:length:", a3, 1);
      objc_msgSend(v12, "subdataWithRange:", 1, objc_msgSend(v12, "length") - 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "getBytes:length:", a4, 1);
      objc_msgSend(v17, "subdataWithRange:", 1, objc_msgSend(v17, "length") - 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = v18;
      v11 = v7;
    }
    else
    {
      v13 = (void *)MEMORY[0x1D17B7244]();
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = *a2;
        v20 = 138543618;
        v21 = v15;
        v22 = 1024;
        LODWORD(v23) = v16;
        _os_log_impl(&dword_1CCE01000, v14, OS_LOG_TYPE_ERROR, "%{public}@Unexpected PDU Type in controlfield 0x%02x - expecting a response", (uint8_t *)&v20, 0x12u);

      }
      objc_autoreleasePoolPop(v13);
      v11 = 0;
      v7 = v12;
    }
  }
  else
  {
    v8 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v10;
      v22 = 2048;
      v23 = objc_msgSend(v7, "length");
      _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_ERROR, "%{public}@Insufficient length %tu - dropping", (uint8_t *)&v20, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    v11 = 0;
  }

  return v11;
}

void sub_1CCF85DF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__23312(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__23313(uint64_t a1)
{

}

void sub_1CCF86258(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1CCF86764(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCF86934(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1CCF86A30(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1CCF86B2C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1CCF86C18(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1CCF86D28(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1CCF86E24(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1CCF86EFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CCF86FE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CCF87700(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__23477(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__23478(uint64_t a1)
{

}

__CFString *HAPDataStreamTransportCommandAsString(uint64_t a1)
{
  if (!a1)
    return CFSTR("HAPDataStreamTransportCommandStartSession");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown HAPDataStreamTransportCommand %ld"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *HAPDataStreamTransportCommandStatusAsString(unint64_t a1)
{
  if (a1 < 3)
    return off_1E894E098[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown HAPDataStreamTransportCommandStatus %ld"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *HAPDataStreamTransportProtocolAsString(uint64_t a1)
{
  __CFString *v1;

  if (!a1)
    return CFSTR("HAPDataStreamTransportProtocolTCP");
  if (a1 == 1)
  {
    v1 = CFSTR("HAPDataStreamTransportProtocolHAP");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown HAPDataStreamTransportProtocol %ld"), a1);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

double coap_ticks(_QWORD *a1)
{
  double result;
  timeval v3;

  v3.tv_sec = 0;
  *(_QWORD *)&v3.tv_usec = 0;
  gettimeofday(&v3, 0);
  result = (double)v3.tv_usec * 1.024 + 512.0;
  *a1 = 1000 * (v3.tv_sec - coap_clock_offset) + ((unint64_t)result >> 10);
  return result;
}

size_t coap_session_str(uint64_t a1)
{
  size_t result;
  int *v3;
  const char *v4;
  int v5;

  result = coap_print_addr(a1 + 136, (char *)&coap_session_str_szSession, 0x100uLL);
  if (result)
  {
    result = strlen((const char *)&coap_session_str_szSession);
    v3 = (int *)((char *)&coap_session_str_szSession + result);
  }
  else
  {
    v3 = &coap_session_str_szSession;
  }
  if ((int *)((char *)v3 + 6) < &coap_endpoint_str_szEndpoint)
  {
    strcpy((char *)v3, " <-> ");
    v3 = (int *)((char *)v3 + 5);
  }
  if ((int *)((char *)v3 + 1) < &coap_endpoint_str_szEndpoint)
  {
    result = coap_print_addr(a1 + 104, (char *)v3, (char *)&coap_session_str_szSession - (char *)v3 + 256);
    if (result)
    {
      result = strlen((const char *)v3);
      v3 = (int *)((char *)v3 + result);
    }
  }
  if (*(int *)(a1 + 168) >= 1 && (int *)((char *)v3 + 1) < &coap_endpoint_str_szEndpoint)
  {
    result = snprintf((char *)v3, (char *)&coap_session_str_szSession - (char *)v3 + 256, " (if%d)", *(_DWORD *)(a1 + 168));
    v3 = (int *)((char *)v3 + (int)result);
  }
  if ((int *)((char *)v3 + 6) < &coap_endpoint_str_szEndpoint)
  {
    if ((*(_BYTE *)a1 - 1) > 3u)
      v4 = " NONE";
    else
      v4 = off_1E894E140[(*(_BYTE *)a1 - 1)];
    v5 = *(_DWORD *)v4;
    *((_WORD *)v3 + 2) = *((_WORD *)v4 + 2);
    *v3 = v5;
  }
  return result;
}

void coap_session_release(uint64_t a1)
{
  int v1;
  int v2;

  if (a1)
  {
    v1 = *(_DWORD *)(a1 + 4);
    if (!v1)
      __assert_rtn("coap_session_release", "coap_session.c", 76, "session->ref > 0");
    v2 = v1 - 1;
    *(_DWORD *)(a1 + 4) = v2;
    if (!v2 && *(_BYTE *)(a1 + 1) == 1)
      coap_session_free((_DWORD *)a1);
  }
}

void coap_session_free(_DWORD *a1)
{
  _QWORD *v2;
  int v3;
  void *v4;
  void *v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  void (*v9)(void);
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  if (!a1)
    return;
  if (a1[1])
    __assert_rtn("coap_session_free", "coap_session.c", 171, "session->ref == 0");
  v2 = (_QWORD *)*((_QWORD *)a1 + 33);
  if (v2)
    coap_delete_pdu(v2);
  if (*((_WORD *)a1 + 90))
  {
    v3 = a1[44];
    if (v3 != -1)
    {
      *((_QWORD *)a1 + 23) = 0;
      *((_QWORD *)a1 + 24) = 0;
      close(v3);
      a1[44] = -1;
    }
    *((_WORD *)a1 + 90) = 0;
  }
  v4 = (void *)*((_QWORD *)a1 + 39);
  if (v4)
    free(v4);
  v5 = (void *)*((_QWORD *)a1 + 41);
  if (v5)
    free(v5);
  v6 = (_QWORD *)*((_QWORD *)a1 + 29);
  while (v6)
  {
    v7 = v6;
    v6 = (_QWORD *)*v6;
    if (!*(_BYTE *)v7[5])
    {
      v8 = *((_QWORD *)a1 + 26);
      if (v8)
      {
        v9 = *(void (**)(void))(v8 + 80);
        if (v9)
          v9();
      }
    }
    coap_delete_node((_QWORD **)v7);
  }
  v10 = *((_QWORD *)a1 + 25);
  if (v10)
  {
    v11 = *(_QWORD *)(v10 + 80);
    if (v11)
    {
      v12 = (char *)(a1 + 12);
      if (*((_QWORD *)a1 + 6))
      {
        v13 = *((_QWORD *)a1 + 7);
        if (v13 || *((_QWORD *)a1 + 8))
        {
          v14 = *(_QWORD *)(v11 + 48);
          if (v12 == *(char **)(v14 + 24))
            *(_QWORD *)(v14 + 24) = v13 + *(_QWORD *)(v14 + 32);
          v15 = *((_QWORD *)a1 + 8);
          if (!v13)
          {
            *(_QWORD *)(v10 + 80) = v15;
LABEL_42:
            v14 = *(_QWORD *)(v15 + 48);
LABEL_43:
            *(_QWORD *)(v15 + *(_QWORD *)(v14 + 32) + 8) = v13;
LABEL_44:
            v18 = *(_QWORD *)v14 + 16 * ((*(_DWORD *)(v14 + 8) - 1) & a1[25]);
            --*(_DWORD *)(v18 + 8);
            if (*(char **)v18 == v12)
              *(_QWORD *)v18 = *((_QWORD *)a1 + 10);
            v19 = *((_QWORD *)a1 + 9);
            if (v19)
              *(_QWORD *)(v19 + 32) = *((_QWORD *)a1 + 10);
            v20 = *((_QWORD *)a1 + 10);
            if (v20)
              *(_QWORD *)(v20 + 24) = v19;
            --*(_DWORD *)(v14 + 16);
            goto LABEL_51;
          }
          goto LABEL_38;
        }
        free(**(void ***)(v11 + 48));
        free(*(void **)(*(_QWORD *)(*((_QWORD *)a1 + 25) + 80) + 48));
        *(_QWORD *)(*((_QWORD *)a1 + 25) + 80) = 0;
      }
    }
  }
  else
  {
    v16 = *((_QWORD *)a1 + 26);
    if (v16)
    {
      v17 = *(_QWORD *)(v16 + 64);
      if (v17)
      {
        v12 = (char *)(a1 + 12);
        if (*((_QWORD *)a1 + 6))
        {
          v13 = *((_QWORD *)a1 + 7);
          if (v13 || *((_QWORD *)a1 + 8))
          {
            v14 = *(_QWORD *)(v17 + 48);
            if (v12 == *(char **)(v14 + 24))
              *(_QWORD *)(v14 + 24) = v13 + *(_QWORD *)(v14 + 32);
            v15 = *((_QWORD *)a1 + 8);
            if (!v13)
            {
              *(_QWORD *)(v16 + 64) = v15;
              goto LABEL_42;
            }
LABEL_38:
            *(_QWORD *)(v13 + *(_QWORD *)(v14 + 32) + 16) = v15;
            v15 = *((_QWORD *)a1 + 8);
            if (!v15)
              goto LABEL_44;
            goto LABEL_43;
          }
          free(**(void ***)(v17 + 48));
          free(*(void **)(*(_QWORD *)(*((_QWORD *)a1 + 26) + 64) + 48));
          *(_QWORD *)(*((_QWORD *)a1 + 26) + 64) = 0;
        }
      }
    }
  }
LABEL_51:
  if (maxlog >= 7)
  {
    coap_session_str((uint64_t)a1);
    coap_log_impl(7, "***%s: session closed\n", (const char *)&coap_session_str_szSession);
  }
  free(a1);
}

uint64_t coap_session_max_pdu_size(unsigned __int8 *a1)
{
  uint64_t v1;

  v1 = (*((_DWORD *)a1 + 3) - *((_DWORD *)a1 + 2));
  if (*a1 - 1 > 1)
  {
    if (v1 >= 3)
    {
      if (v1 > 0xE)
      {
        if (v1 > 0x10F)
        {
          if (v1 > 0x10110)
            return v1 - 6;
          else
            return v1 - 4;
        }
        else
        {
          return v1 - 3;
        }
      }
      else
      {
        return v1 - 2;
      }
    }
    else
    {
      return 0;
    }
  }
  else if (v1 <= 4)
  {
    return 0;
  }
  else
  {
    return v1 - 4;
  }
}

uint64_t coap_session_write(uint64_t a1, const void *a2, int64_t a3)
{
  ssize_t v5;
  uint64_t v6;
  char *v7;
  int *v8;
  char *v9;
  timeval v11;

  *(_WORD *)(a1 + 180) &= 0xFDDFu;
  v5 = send(*(_DWORD *)(a1 + 176), a2, a3, 0);
  if (v5 == -1)
  {
    if (*__error() == 35 || *__error() == 4)
    {
      v6 = 0;
      *(_WORD *)(a1 + 180) |= 0x20u;
      return v6;
    }
    if (maxlog < 4)
      return -1;
    v8 = __error();
    v9 = strerror(*v8);
    coap_log_impl(4, "coap_socket_write: send: %s\n", v9);
    v6 = -1;
  }
  else
  {
    v6 = v5;
    if (v5 < a3)
      *(_WORD *)(a1 + 180) |= 0x20u;
    if (v5 >= 1)
    {
      v11.tv_sec = 0;
      *(_QWORD *)&v11.tv_usec = 0;
      gettimeofday(&v11, 0);
      *(_QWORD *)(a1 + 272) = 1000 * (v11.tv_sec - coap_clock_offset)
                            + ((unint64_t)((double)v11.tv_usec * 1.024 + 512.0) >> 10);
      if (maxlog > 6)
      {
        v7 = "*  %s: sent %zd bytes\n";
LABEL_16:
        coap_session_str(a1);
        coap_log_impl(7, v7, &coap_session_str_szSession, a3);
        return v6;
      }
      return v6;
    }
    if ((v5 & 0x8000000000000000) == 0)
      return v6;
  }
  if (maxlog >= 7)
  {
    v7 = "*   %s: failed to send %zd bytes\n";
    goto LABEL_16;
  }
  return v6;
}

uint64_t coap_session_delay_pdu(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  _OWORD *v4;
  _QWORD *v5;
  _QWORD *i;
  unsigned __int8 *v9;
  _OWORD *v10;
  unsigned __int8 __buf;
  _OWORD *v12;

  if (a3)
  {
    v4 = (_OWORD *)a3;
    v12 = 0;
    coap_remove_from_queue((_QWORD **)(*((_QWORD *)a1 + 26) + 48), (uint64_t)a1, *(_DWORD *)(a3 + 32), &v12);
    if (v12 != v4)
      __assert_rtn("coap_session_delay_pdu", "coap_session.c", 257, "removed == node");
    coap_session_release(*((_QWORD *)v4 + 3));
    *((_QWORD *)v4 + 3) = 0;
    *((_QWORD *)v4 + 1) = 0;
  }
  else
  {
    v9 = a1 + 232;
    while (1)
    {
      v9 = *(unsigned __int8 **)v9;
      if (!v9)
        break;
      if (*((_DWORD *)v9 + 8) == *(unsigned __int16 *)(a2 + 6))
      {
        if (maxlog >= 3)
        {
          coap_session_str((uint64_t)a1);
          coap_log_impl(3, "**  %s: tid=%d: already in-use - dropped\n", (const char *)&coap_session_str_szSession, *(unsigned __int16 *)(a2 + 6));
        }
        return -1;
      }
    }
    v10 = coap_new_node();
    if (!v10)
      return -1;
    v4 = v10;
    *((_DWORD *)v10 + 8) = *(unsigned __int16 *)(a2 + 6);
    *((_QWORD *)v10 + 5) = a2;
    if (!*(_BYTE *)a2 && *a1 - 1 <= 1)
    {
      __buf = 0;
      arc4random_buf(&__buf, 1uLL);
      *((_DWORD *)v4 + 5) = coap_calc_timeout(a1, __buf);
    }
  }
  *(_QWORD *)v4 = 0;
  v5 = a1 + 232;
  for (i = (_QWORD *)*((_QWORD *)a1 + 29); i; i = (_QWORD *)*i)
    v5 = i;
  *v5 = v4;
  if (maxlog >= 7)
  {
    coap_session_str((uint64_t)a1);
    coap_log_impl(7, "** %s: tid=%d: delayed\n", (const char *)&coap_session_str_szSession, *((_DWORD *)v4 + 8));
  }
  return -3;
}

void coap_session_send_csm(unsigned __int8 *a1)
{
  unsigned __int8 *v2;
  uint64_t v3;
  unsigned int v4;
  _BYTE v5[4];

  if (*a1 - 5 <= 0xFFFFFFFD)
    __assert_rtn("coap_session_send_csm", "coap_session.c", 291, "COAP_PROTO_RELIABLE(session->proto)");
  if (maxlog >= 7)
  {
    coap_session_str((uint64_t)a1);
    coap_log_impl(7, "***%s: sending CSM\n", (const char *)&coap_session_str_szSession);
  }
  a1[2] = 3;
  *((_QWORD *)a1 + 30) = 0;
  if (!*((_DWORD *)a1 + 3))
    *((_DWORD *)a1 + 3) = 1152;
  v2 = coap_pdu_init(0, 0xE1u, 0, 0x10uLL);
  if (v2)
  {
    v3 = (uint64_t)v2;
    v4 = coap_encode_var_safe((uint64_t)v5, 0x800100u);
    if (!coap_add_option(v3, 2u, v4, v5)
      || !coap_pdu_encode_header(v3, *a1)
      || coap_session_send_pdu(a1, v3) != *(_QWORD *)(v3 + 24) + *(unsigned __int8 *)(v3 + 3))
    {
      coap_session_disconnected(a1, 1);
    }
    coap_delete_pdu((_QWORD *)v3);
  }
  else
  {
    coap_session_disconnected(a1, 1);
  }
}

void coap_session_disconnected(unsigned __int8 *a1, int a2)
{
  int v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD **v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  BOOL v11;
  void *v12;
  int v13;
  _QWORD *v14;
  uint64_t i;
  int v16;
  void (*v17)(void);
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  void (*v21)(uint64_t, unsigned __int8 *);
  void (*v22)(uint64_t, unsigned __int8 *);
  int v23;
  uint64_t v24;
  uint64_t v25;

  v4 = a1[2];
  if (maxlog >= 7)
  {
    coap_session_str((uint64_t)a1);
    coap_log_impl(7, "***%s: session disconnected (reason %d)\n", (const char *)&coap_session_str_szSession, a2);
  }
  v5 = *(_QWORD *)(*((_QWORD *)a1 + 26) + 16);
  while (v5)
  {
    v7 = (_QWORD **)(v5 + 128);
    v6 = *(_QWORD **)(v5 + 128);
    v5 = *(_QWORD *)(v5 + 80);
    if (v6)
    {
      do
      {
        v8 = (_QWORD *)*v6;
        if ((unsigned __int8 *)v6[1] == a1)
        {
          v9 = *v7;
          v10 = v7;
          if (*v7 == v6)
            goto LABEL_13;
          do
          {
            v10 = v9;
            v9 = (_QWORD *)*v9;
            if (v9)
              v11 = v9 == v6;
            else
              v11 = 1;
          }
          while (!v11);
          if (v9)
LABEL_13:
            *v10 = v8;
          coap_session_release((uint64_t)a1);
          v12 = (void *)v6[6];
          if (v12)
            free(v12);
          free(v6);
        }
        v6 = v8;
      }
      while (v8);
    }
  }
  v13 = *a1;
  if (*((_QWORD *)a1 + 27))
    *((_QWORD *)a1 + 27) = 0;
  a1[2] = 4 * (v13 == 1);
  a1[226] = 0;
  v14 = (_QWORD *)*((_QWORD *)a1 + 33);
  if (v14)
  {
    coap_delete_pdu(v14);
    *((_QWORD *)a1 + 33) = 0;
  }
  *((_QWORD *)a1 + 32) = 0;
  for (i = *((_QWORD *)a1 + 29); i; i = *((_QWORD *)a1 + 29))
  {
    *((_QWORD *)a1 + 29) = *(_QWORD *)i;
    *(_QWORD *)i = 0;
    if (maxlog >= 7)
    {
      coap_session_str((uint64_t)a1);
      coap_log_impl(7, "** %s: tid=%d: not transmitted after disconnect\n", (const char *)&coap_session_str_szSession, *(_DWORD *)(i + 32));
    }
    if (**(_BYTE **)(i + 40))
      goto LABEL_27;
    v16 = *a1;
    if (v16 == 1)
    {
      if (a2 != 4)
        goto LABEL_37;
    }
    else if (a2 != 4 || v16 != 2)
    {
      goto LABEL_37;
    }
    if ((coap_wait_ack(*((_QWORD *)a1 + 26), (uint64_t)a1, i) & 0x80000000) == 0)
      continue;
    if (!**(_BYTE **)(i + 40))
    {
LABEL_37:
      v17 = *(void (**)(void))(*((_QWORD *)a1 + 26) + 80);
      if (v17)
        v17();
    }
LABEL_27:
    coap_delete_node((_QWORD **)i);
  }
  if (a2 != 4)
  {
    v18 = *((_QWORD *)a1 + 26);
    v19 = *(_QWORD **)(v18 + 48);
    if (v19)
    {
      while (1)
      {
        v20 = (_QWORD *)*v19;
        if ((unsigned __int8 *)v19[3] != a1)
          break;
        *(_QWORD *)(v18 + 48) = v20;
        if (maxlog >= 7)
        {
          coap_session_str((uint64_t)a1);
          coap_log_impl(7, "** %s: tid=%d: removed\n", (const char *)&coap_session_str_szSession, *((_DWORD *)v19 + 8));
        }
        if (!*(_BYTE *)v19[5])
        {
          v21 = *(void (**)(uint64_t, unsigned __int8 *))(v18 + 80);
          if (v21)
            v21(v18, a1);
        }
        coap_delete_node((_QWORD **)v19);
        v19 = *(_QWORD **)(v18 + 48);
        if (!v19)
          goto LABEL_59;
      }
      if (v20)
      {
        do
        {
          if ((unsigned __int8 *)v20[3] == a1)
          {
            *v19 = *v20;
            if (maxlog >= 7)
            {
              coap_session_str((uint64_t)a1);
              coap_log_impl(7, "** %s: tid=%d: removed\n", (const char *)&coap_session_str_szSession, *((_DWORD *)v20 + 8));
            }
            if (!*(_BYTE *)v20[5])
            {
              v22 = *(void (**)(uint64_t, unsigned __int8 *))(v18 + 80);
              if (v22)
                v22(v18, a1);
            }
            coap_delete_node((_QWORD **)v20);
          }
          else
          {
            v19 = v20;
          }
          v20 = (_QWORD *)*v19;
        }
        while (*v19);
      }
    }
  }
LABEL_59:
  if (*a1 - 3 <= 1)
  {
    if (*((_WORD *)a1 + 90))
    {
      v23 = *((_DWORD *)a1 + 44);
      if (v23 != -1)
      {
        *((_QWORD *)a1 + 23) = 0;
        *((_QWORD *)a1 + 24) = 0;
        close(v23);
        *((_DWORD *)a1 + 44) = -1;
      }
      *((_WORD *)a1 + 90) = 0;
      if (v4 == 1)
        v24 = 4099;
      else
        v24 = 4098;
      coap_handle_event(*((_QWORD *)a1 + 26), v24, (uint64_t)a1);
    }
    if (v4)
    {
      if (v4 == 4)
        v25 = 8194;
      else
        v25 = 8195;
      coap_handle_event(*((_QWORD *)a1 + 26), v25, (uint64_t)a1);
    }
  }
}

void coap_session_connected(unsigned __int8 *a1)
{
  int v2;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  unsigned __int8 v7;
  BOOL v8;

  v2 = a1[2];
  if (v2 != 4)
  {
    if (maxlog >= 7)
    {
      coap_session_str((uint64_t)a1);
      coap_log_impl(7, "***%s: session connected\n", (const char *)&coap_session_str_szSession);
      v2 = a1[2];
    }
    if (v2 == 3)
      coap_handle_event(*((_QWORD *)a1 + 26), 8193, (uint64_t)a1);
  }
  a1[2] = 4;
  *((_QWORD *)a1 + 30) = 0;
  if (*a1 == 2)
  {
    *((_DWORD *)a1 + 2) = 0;
    if (!*((_DWORD *)a1 + 3) && maxlog >= 3)
      coap_log_impl(3, "DTLS overhead exceeds MTU\n");
  }
  v4 = *((_QWORD *)a1 + 29);
  if (v4)
  {
    while (a1[2] == 4)
    {
      v5 = *(_BYTE **)(v4 + 40);
      if (!*v5 && *a1 - 1 <= 1)
      {
        if (a1[226])
          return;
        a1[226] = 1;
      }
      *((_QWORD *)a1 + 29) = *(_QWORD *)v4;
      *(_QWORD *)v4 = 0;
      if (maxlog >= 7)
      {
        coap_session_str((uint64_t)a1);
        coap_log_impl(7, "** %s: tid=%d: transmitted after delay\n", (const char *)&coap_session_str_szSession, *(unsigned __int16 *)(*(_QWORD *)(v4 + 40) + 6));
        v5 = *(_BYTE **)(v4 + 40);
      }
      v6 = coap_session_send_pdu(a1, (uint64_t)v5);
      v7 = *a1 - 1;
      if (**(_BYTE **)(v4 + 40))
        v8 = 1;
      else
        v8 = (*a1 - 1) > 1u;
      if (!v8)
      {
        if ((int)coap_wait_ack(*((_QWORD *)a1 + 26), (uint64_t)a1, v4) >= 0)
          v4 = 0;
        v7 = *a1 - 1;
      }
      if (v7 > 1u)
      {
        if (v6 < 1)
        {
          *(_QWORD *)v4 = *((_QWORD *)a1 + 29);
          *((_QWORD *)a1 + 29) = v4;
          return;
        }
        if (v6 < *(_QWORD *)(*(_QWORD *)(v4 + 40) + 24)
                + (unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v4 + 40) + 3))
        {
          *(_QWORD *)v4 = *((_QWORD *)a1 + 29);
          *((_QWORD *)a1 + 29) = v4;
          *((_QWORD *)a1 + 30) = v6;
          return;
        }
        coap_delete_node((_QWORD **)v4);
      }
      else
      {
        if (v4)
          coap_delete_node((_QWORD **)v4);
        if (v6 < 0)
          return;
      }
      v4 = *((_QWORD *)a1 + 29);
      if (!v4)
        return;
    }
  }
}

char *coap_make_session(int a1, char a2, unsigned int *a3, unsigned int *a4, unsigned int *a5, int a6, uint64_t a7, uint64_t a8)
{
  char *v16;
  char *v17;
  _OWORD *v18;
  int v19;
  _OWORD *v20;
  int v21;
  _OWORD *v22;
  int v23;
  unsigned int v24;

  v16 = (char *)malloc_type_malloc(0x178uLL, 0x9D9A23A2uLL);
  v17 = v16;
  if (!v16)
    return v17;
  *((_QWORD *)v16 + 46) = 0;
  *(_OWORD *)(v16 + 242) = 0u;
  *(_OWORD *)(v16 + 226) = 0u;
  *(_OWORD *)(v16 + 210) = 0u;
  *(_OWORD *)(v16 + 194) = 0u;
  *(_OWORD *)(v16 + 178) = 0u;
  *(_OWORD *)(v16 + 162) = 0u;
  *(_OWORD *)(v16 + 146) = 0u;
  *(_OWORD *)(v16 + 130) = 0u;
  *(_OWORD *)(v16 + 114) = 0u;
  *(_OWORD *)(v16 + 98) = 0u;
  *(_OWORD *)(v16 + 82) = 0u;
  *(_OWORD *)(v16 + 66) = 0u;
  *(_OWORD *)(v16 + 50) = 0u;
  *(_OWORD *)(v16 + 34) = 0u;
  *(_OWORD *)(v16 + 18) = 0u;
  *(_OWORD *)(v16 + 2) = 0u;
  *(_OWORD *)(v16 + 338) = 0u;
  *(_OWORD *)(v16 + 354) = 0u;
  *(_OWORD *)(v16 + 306) = 0u;
  *(_OWORD *)(v16 + 322) = 0u;
  *(_OWORD *)(v16 + 274) = 0u;
  *(_OWORD *)(v16 + 290) = 0u;
  *(_OWORD *)(v16 + 258) = 0u;
  *v16 = a1;
  v16[1] = a2;
  if (a3)
  {
    *((_OWORD *)v16 + 1) = 0uLL;
    *((_OWORD *)v16 + 2) = 0uLL;
    *((_DWORD *)v16 + 4) = *a3;
    v18 = a3 + 1;
    v19 = *((unsigned __int8 *)a3 + 5);
    if (v19 == 2)
    {
      *(_OWORD *)(v16 + 20) = *v18;
      if (!a4)
        goto LABEL_15;
    }
    else if (v19 == 30)
    {
      v16[21] = 30;
      *(_OWORD *)(v16 + 28) = *(_OWORD *)(a3 + 3);
      *((_WORD *)v16 + 11) = *((_WORD *)a3 + 3);
      *((_DWORD *)v16 + 11) = a3[7];
      if (!a4)
        goto LABEL_15;
    }
    else
    {
      memcpy(v16 + 20, v18, *a3);
      if (!a4)
        goto LABEL_15;
    }
  }
  else
  {
    *(_QWORD *)(v16 + 28) = 0;
    *(_QWORD *)(v16 + 20) = 0;
    *((_DWORD *)v16 + 11) = 0;
    *(_QWORD *)(v16 + 36) = 0;
    *((_DWORD *)v16 + 4) = 28;
    if (!a4)
    {
LABEL_15:
      *(_QWORD *)(v17 + 148) = 0;
      *(_QWORD *)(v17 + 140) = 0;
      *((_DWORD *)v17 + 41) = 0;
      *(_QWORD *)(v17 + 156) = 0;
      *((_DWORD *)v17 + 34) = 28;
      if (!a5)
        goto LABEL_22;
LABEL_18:
      *(_OWORD *)(v17 + 104) = 0u;
      *(_OWORD *)(v17 + 120) = 0u;
      *((_DWORD *)v17 + 26) = *a5;
      v22 = a5 + 1;
      v23 = *((unsigned __int8 *)a5 + 5);
      if (v23 == 2)
      {
        *(_OWORD *)(v17 + 108) = *v22;
      }
      else if (v23 == 30)
      {
        v17[109] = 30;
        *(_OWORD *)(v17 + 116) = *(_OWORD *)(a5 + 3);
        *((_WORD *)v17 + 55) = *((_WORD *)a5 + 3);
        *((_DWORD *)v17 + 33) = a5[7];
      }
      else
      {
        memcpy(v17 + 108, v22, *a5);
      }
      goto LABEL_25;
    }
  }
  *(_OWORD *)(v17 + 136) = 0u;
  *(_OWORD *)(v17 + 152) = 0u;
  *((_DWORD *)v17 + 34) = *a4;
  v20 = a4 + 1;
  v21 = *((unsigned __int8 *)a4 + 5);
  if (v21 == 2)
  {
    *(_OWORD *)(v17 + 140) = *v20;
    if (a5)
      goto LABEL_18;
  }
  else if (v21 == 30)
  {
    v17[141] = 30;
    *(_OWORD *)(v17 + 148) = *(_OWORD *)(a4 + 3);
    *((_WORD *)v17 + 71) = *((_WORD *)a4 + 3);
    *((_DWORD *)v17 + 41) = a4[7];
    if (a5)
      goto LABEL_18;
  }
  else
  {
    memcpy(v17 + 140, v20, *a4);
    if (a5)
      goto LABEL_18;
  }
LABEL_22:
  *(_QWORD *)(v17 + 116) = 0;
  *(_QWORD *)(v17 + 108) = 0;
  *((_DWORD *)v17 + 33) = 0;
  *(_QWORD *)(v17 + 124) = 0;
  *((_DWORD *)v17 + 26) = 28;
LABEL_25:
  *((_DWORD *)v17 + 42) = a6;
  *((_QWORD *)v17 + 25) = a8;
  *((_QWORD *)v17 + 26) = a7;
  if (a8)
  {
    v24 = *(unsigned __int16 *)(a8 + 18);
    *((_DWORD *)v17 + 3) = v24;
    if (a1 == 2)
    {
      *((_DWORD *)v17 + 2) = 29;
      if (v24 <= 0x1D)
      {
        *((_DWORD *)v17 + 2) = v24;
        if (maxlog >= 3)
          coap_log_impl(3, "DTLS overhead exceeds MTU\n");
      }
    }
  }
  else
  {
    *((_DWORD *)v17 + 3) = 1152;
    if (a1 == 2)
      *((_DWORD *)v17 + 2) = 29;
  }
  *((_DWORD *)v17 + 88) = 4;
  *(_QWORD *)(v17 + 356) = 0x1F4000100000002;
  *((_DWORD *)v17 + 92) = -1;
  *((_DWORD *)v17 + 57) = -1;
  arc4random_buf(v17 + 224, 2uLL);
  return v17;
}

uint64_t coap_get_log_level()
{
  return maxlog;
}

uint64_t coap_set_log_level(uint64_t result)
{
  maxlog = result;
  return result;
}

size_t coap_print_addr(uint64_t a1, char *__dst, unint64_t a3)
{
  size_t v3;
  int v6;
  const void *v7;
  int v8;
  unint64_t v9;
  char *v10;
  unsigned int v11;
  socklen_t v12;
  char *v13;

  v3 = a3;
  v6 = *(unsigned __int8 *)(a1 + 5);
  if (v6 == 30)
  {
    if (a3 < 7)
      return 0;
    *__dst = 91;
    v10 = __dst + 1;
    v7 = (const void *)(a1 + 12);
    v8 = *(unsigned __int8 *)(a1 + 5);
    v9 = 46;
LABEL_6:
    v11 = *(unsigned __int16 *)(a1 + 6);
    if (v9 >= a3)
      v12 = a3;
    else
      v12 = v9;
    if (inet_ntop(v8, v7, v10, v12))
    {
      v13 = &v10[strnlen(v10, v3)];
      if (*(_BYTE *)(a1 + 5) != 30)
        return &__dst[v3] - &v13[snprintf(v13, &__dst[v3] - v13 + 1, ":%d", bswap32(v11) >> 16)];
      if (v13 < &__dst[v3])
      {
        *v13++ = 93;
        return &__dst[v3] - &v13[snprintf(v13, &__dst[v3] - v13 + 1, ":%d", bswap32(v11) >> 16)];
      }
    }
    else
    {
      perror("coap_print_addr");
    }
    return 0;
  }
  if (v6 == 2)
  {
    v7 = (const void *)(a1 + 8);
    v8 = 2;
    v9 = 16;
    v10 = __dst;
    goto LABEL_6;
  }
  if (a3 >= 0x16)
    v3 = 22;
  memcpy(__dst, "(unknown address type)", v3);
  return v3;
}

unsigned __int8 *coap_show_pdu(unsigned __int8 *result)
{
  uint64_t v1;
  unsigned int v2;
  const char *v3;
  unint64_t v4;
  const char *v5;
  unint64_t v6;
  int v7;
  int v8;
  int v9;
  int v10;
  char i;
  unsigned __int8 *v12;
  unsigned __int8 *v13;
  int v14;
  int v15;
  _BYTE *v16;
  unsigned int v17;
  int v18;
  uint64_t v19;
  int v20;
  int v21;
  _BYTE *v22;
  unsigned int v23;
  int v24;
  uint64_t v25;
  int v26;
  _BYTE *v27;
  uint64_t v28;
  _BYTE *v29;
  int v30;
  _BYTE *v31;
  unsigned int v32;
  int v33;
  uint64_t v34;
  int v35;
  _BYTE *v36;
  unsigned int v37;
  int v38;
  uint64_t v39;
  int v40;
  int v41;
  _BYTE *v42;
  int v43;
  int v44;
  uint64_t v45;
  char v46;
  char v47;
  const char *v48;
  __int16 *v49;
  uint64_t v50;
  char v51;
  char v52;
  uint64_t v53;
  __int16 *v54;
  int v55;
  _BYTE *v56;
  unsigned int v57;
  uint64_t v58;
  int v59;
  uint64_t v60;
  int *v61;
  int v62;
  int v63;
  unsigned __int8 *v64;
  FILE **v65;
  uint64_t v66;
  int v67;
  int v68;
  int v69;
  uint64_t v70;
  unsigned __int8 *v71;
  int v72;
  int v73;
  int v74;
  uint64_t v75;
  int v76;
  uint64_t v77;
  uint64_t v78;
  int v79;
  unsigned int v80;
  int v81;
  uint64_t v82;
  int v83;
  int v84;
  _OWORD v85[2];
  uint64_t v86;
  char __str[2056];
  char v88[1024];
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  if (maxlog < 7)
    return result;
  v1 = (uint64_t)result;
  v2 = *result;
  if (v2 >= 4)
    v2 = 4;
  v3 = msg_type_string_types[v2];
  v4 = result[1];
  if (v4 > 7)
  {
    if ((v4 - 224) > 5)
    {
      v5 = msg_code_string_buf;
      snprintf(msg_code_string_buf, 5uLL, "%u.%02u", v4 >> 5, v4 & 0x1F);
    }
    else
    {
      v5 = msg_code_string_signals[(v4 - 224)];
    }
  }
  else
  {
    v5 = msg_code_string_methods[v4];
  }
  v86 = 0;
  memset(v85, 0, sizeof(v85));
  snprintf(__str, 0x808uLL, "v:%d t:%s c:%s i:%04x {", 1, v3, v5, *(unsigned __int16 *)(v1 + 6));
  if (*(_BYTE *)(v1 + 4))
  {
    v6 = 0;
    do
    {
      v7 = strlen(__str);
      snprintf(&__str[v7], 2056 - v7, "%02x", *(unsigned __int8 *)(*(_QWORD *)(v1 + 40) + v6++));
    }
    while (v6 < *(unsigned __int8 *)(v1 + 4));
  }
  v8 = strlen(__str);
  snprintf(&__str[v8], 2056 - v8, "}");
  coap_option_iterator_init(v1, (uint64_t)v85, 0);
  v9 = strlen(__str);
  snprintf(&__str[v9], 2056 - v9, " [");
  v10 = -1;
  for (i = 1; ; i = 0)
  {
    v12 = coap_option_next((uint64_t)v85);
    if (!v12)
      break;
    v13 = v12;
    if ((i & 1) == 0)
    {
      v14 = strlen(__str);
      snprintf(&__str[v14], 2056 - v14, ",");
    }
    v15 = 0;
    switch(*(_BYTE *)(v1 + 1))
    {
      case 0xE1:
        if (WORD4(v85[0]) != 2)
          goto LABEL_35;
        v16 = coap_opt_value(v13);
        v17 = coap_opt_length(v13);
        v18 = 0;
        if (v17)
        {
          v19 = v17;
          do
          {
            v20 = *v16++;
            v18 = v20 | (v18 << 8);
            --v19;
          }
          while (v19);
        }
        goto LABEL_39;
      case 0xE2:
      case 0xE3:
        goto LABEL_46;
      case 0xE4:
        if (WORD4(v85[0]) != 4)
        {
          if (WORD4(v85[0]) == 2)
          {
            v27 = coap_opt_value(v13);
            v28 = coap_opt_length(v13);
            v29 = v27;
            v30 = 0;
LABEL_45:
            v15 = print_readable(v29, v28, v88, v30);
          }
          else
          {
LABEL_35:
            v15 = 0;
          }
          goto LABEL_46;
        }
        v36 = coap_opt_value(v13);
        v37 = coap_opt_length(v13);
        v38 = 0;
        if (v37)
        {
          v39 = v37;
          do
          {
            v40 = *v36++;
            v38 = v40 | (v38 << 8);
            --v39;
          }
          while (v39);
        }
LABEL_39:
        v41 = snprintf(v88, 0x400uLL, "%u");
        goto LABEL_40;
      case 0xE5:
        if (WORD4(v85[0]) != 2)
          goto LABEL_35;
        v31 = coap_opt_value(v13);
        v32 = coap_opt_length(v13);
        v33 = 0;
        if (v32)
        {
          v34 = v32;
          do
          {
            v35 = *v31++;
            v33 = v35 | (v33 << 8);
            --v34;
          }
          while (v34);
        }
        goto LABEL_39;
      default:
        v21 = 0;
        switch(WORD4(v85[0]))
        {
          case 6:
          case 7:
          case 0xE:
          case 0x1C:
            goto LABEL_23;
          case 8:
          case 0xB:
          case 0xF:
          case 0x14:
          case 0x23:
            goto LABEL_44;
          case 9:
          case 0xA:
          case 0xD:
          case 0x10:
          case 0x11:
          case 0x12:
          case 0x13:
          case 0x15:
          case 0x16:
          case 0x18:
          case 0x19:
          case 0x1A:
          case 0x1D:
          case 0x1E:
          case 0x1F:
          case 0x20:
          case 0x21:
          case 0x22:
            goto LABEL_43;
          case 0xC:
            v56 = coap_opt_value(v13);
            v57 = coap_opt_length(v13);
            v10 = 0;
            if (v57)
            {
              v58 = v57;
              do
              {
                v59 = *v56++;
                v10 = v59 | (v10 << 8);
                --v58;
              }
              while (v58);
            }
            v60 = 0;
            v61 = &print_content_format_formats;
            break;
          case 0x17:
          case 0x1B:
            coap_opt_block_num(v13);
            if (coap_opt_length(v13))
            {
              coap_opt_length(v13);
              coap_opt_value(v13);
              coap_opt_length(v13);
            }
            if (coap_opt_length(v13))
            {
              coap_opt_length(v13);
              coap_opt_value(v13);
              coap_opt_length(v13);
            }
            v41 = snprintf(v88, 0x400uLL, "%u/%c/%u");
            goto LABEL_40;
          default:
            if (WORD4(v85[0]) == 3)
              goto LABEL_44;
            if (WORD4(v85[0]) == 60)
            {
LABEL_23:
              v22 = coap_opt_value(v13);
              v23 = coap_opt_length(v13);
              v24 = 0;
              if (v23)
              {
                v25 = v23;
                do
                {
                  v26 = *v22++;
                  v24 = v26 | (v24 << 8);
                  --v25;
                }
                while (v25);
              }
              goto LABEL_39;
            }
LABEL_43:
            v21 = 1;
LABEL_44:
            v42 = coap_opt_value(v13);
            v28 = coap_opt_length(v13);
            v29 = v42;
            v30 = v21;
            goto LABEL_45;
        }
        break;
    }
    while (1)
    {
      v62 = *v61;
      v61 += 4;
      if (v62 == v10)
        break;
      if (++v60 == 24)
      {
        v41 = snprintf(v88, 0x400uLL, "%d");
        goto LABEL_40;
      }
    }
    v41 = snprintf(v88, 0x400uLL, "%s");
LABEL_40:
    v15 = v41;
LABEL_46:
    v43 = strlen(__str);
    v44 = *(unsigned __int8 *)(v1 + 1);
    if (v44 == 225)
    {
      v45 = 0;
      v46 = 1;
      while (1)
      {
        v47 = v46;
        if ((unsigned __int16)msg_option_string_options_csm[8 * v45] == WORD4(v85[0]))
          break;
        v46 = 0;
        v45 = 1;
        if ((v47 & 1) == 0)
          goto LABEL_63;
      }
      v49 = &msg_option_string_options_csm[8 * v45];
LABEL_54:
      v48 = (const char *)*((_QWORD *)v49 + 1);
      goto LABEL_64;
    }
    if ((v44 & 0xFE) == 0xE2)
    {
      v48 = "Custody";
    }
    else
    {
      if (v44 != 229)
      {
        if (v44 == 228)
        {
          v50 = 0;
          v51 = 1;
          while (1)
          {
            v52 = v51;
            if ((unsigned __int16)msg_option_string_options_release[8 * v50] == WORD4(v85[0]))
              break;
            v51 = 0;
            v50 = 1;
            if ((v52 & 1) == 0)
              goto LABEL_63;
          }
          v49 = &msg_option_string_options_release[8 * v50];
        }
        else
        {
          v53 = 0;
          v54 = msg_option_string_options;
          while (1)
          {
            v55 = (unsigned __int16)*v54;
            v54 += 8;
            if (v55 == WORD4(v85[0]))
              break;
            if (++v53 == 20)
              goto LABEL_63;
          }
          v49 = &msg_option_string_options[8 * v53];
        }
        goto LABEL_54;
      }
      v48 = "Bad-CSM-Option";
    }
    if (WORD4(v85[0]) != 2)
    {
LABEL_63:
      v48 = msg_option_string_buf;
      snprintf(msg_option_string_buf, 6uLL, "%u", WORD4(v85[0]));
    }
LABEL_64:
    snprintf(&__str[v43], 2056 - v43, " %s:%.*s", v48, v15, v88);
  }
  v63 = strlen(__str);
  snprintf(&__str[v63], 2056 - v63, " ]");
  v64 = *(unsigned __int8 **)(v1 + 48);
  v65 = (FILE **)MEMORY[0x1E0C80C20];
  if (v64)
  {
    v66 = *(_QWORD *)(v1 + 24) - (_QWORD)v64 + *(_QWORD *)(v1 + 40);
    v67 = strlen(__str);
    snprintf(&__str[v67], 2056 - v67, " :: ");
    if ((v10 + 1) <= 0x33 && ((1 << (v10 + 1)) & 0x8060000000003) != 0)
    {
      if (print_readable(v64, v66, v88, 0))
      {
        v68 = strlen(__str);
        if (snprintf(&__str[v68], 2056 - v68, "'%s'", v88) >= 2056 - v68)
          __str[2055] = 0;
      }
    }
    else
    {
      v69 = strlen(__str);
      snprintf(&__str[v69], 2056 - v69, "binary data length %zu\n", v66);
      fputs(__str, *v65);
      strcpy(__str, "<<");
      if (v66)
      {
        v70 = v66;
        v71 = v64;
        do
        {
          --v70;
          v72 = strlen(__str);
          v73 = *v71++;
          snprintf(&__str[v72], 2056 - v72, "%02x", v73);
        }
        while (v70);
      }
      v74 = strlen(__str);
      snprintf(&__str[v74], 2056 - v74, ">>");
      v75 = v66 << 32;
      v76 = strlen(__str);
      snprintf(&__str[v76], 2056 - v76, "\n");
      fputs(__str, *v65);
      strcpy(__str, "<<");
      if (v75)
      {
        v77 = v75 >> 32;
        v78 = MEMORY[0x1E0C80978];
        do
        {
          v79 = strlen(__str);
          v80 = *v64;
          if ((v80 & 0x80) != 0)
            v81 = __maskrune(*v64, 0x40000uLL);
          else
            v81 = *(_DWORD *)(v78 + 4 * *v64 + 60) & 0x40000;
          --v77;
          if (v81)
            v82 = v80;
          else
            v82 = 46;
          snprintf(&__str[v79], 2056 - v79, "%c ", v82);
          ++v64;
        }
        while (v77);
      }
      v83 = strlen(__str);
      snprintf(&__str[v83], 2056 - v83, ">>");
      v65 = (FILE **)MEMORY[0x1E0C80C20];
    }
  }
  v84 = strlen(__str);
  snprintf(&__str[v84], 2056 - v84, "\n");
  return (unsigned __int8 *)fputs(__str, *v65);
}

uint64_t print_readable(_BYTE *a1, uint64_t a2, _BYTE *a3, int a4)
{
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;

  v6 = a2;
  v7 = a1;
  if (!a1 && a2)
    __assert_rtn("print_readable", "coap_debug.c", 124, "data || len == 0");
  v8 = 0;
  if (a2)
  {
    v9 = MEMORY[0x1E0C80978];
    do
    {
      if (!a4)
      {
        v11 = (char)*v7;
        if (v11 < 0)
        {
          if (__maskrune(*v7, 0x40000uLL))
          {
LABEL_12:
            v10 = v8 + 1;
            if ((unint64_t)(v8 + 1) > 0x3FF)
              break;
            *a3++ = v11;
            goto LABEL_14;
          }
        }
        else if ((*(_DWORD *)(v9 + 4 * *v7 + 60) & 0x40000) != 0)
        {
          goto LABEL_12;
        }
      }
      v10 = v8 + 4;
      if ((unint64_t)(v8 + 4) > 0x3FF)
        break;
      *(_WORD *)a3 = 30812;
      a3[2] = a0123456789abcd_0[(unint64_t)*v7 >> 4];
      a3[3] = a0123456789abcd_0[*v7 & 0xF];
      a3 += 4;
LABEL_14:
      v8 = v10;
      ++v7;
      --v6;
    }
    while (v6);
  }
  *a3 = 0;
  return v8;
}

void coap_log_impl(signed int a1, char *__format, ...)
{
  FILE **v4;
  FILE *v5;
  tm *v6;
  time_t v7;
  timeval __str[128];
  uint64_t v9;
  va_list va;

  va_start(va, __format);
  v9 = *MEMORY[0x1E0C80C00];
  if (maxlog >= a1)
  {
    if (log_handler)
    {
      va_copy((va_list)v7, va);
      vsnprintf((char *)__str, 0x808uLL, __format, va);
      coapLogHandler(a1, (uint64_t)__str);
    }
    else
    {
      v4 = (FILE **)MEMORY[0x1E0C80C10];
      if (a1 >= 3)
        v4 = (FILE **)MEMORY[0x1E0C80C20];
      v5 = *v4;
      __str[0].tv_sec = 0;
      *(_QWORD *)&__str[0].tv_usec = 0;
      gettimeofday(__str, 0);
      v7 = coap_clock_offset
         + (1000 * (__str[0].tv_sec - coap_clock_offset)
          + ((unint64_t)((double)__str[0].tv_usec * 1.024 + 512.0) >> 10))
         / 0x3E8;
      v6 = localtime(&v7);
      if (strftime((char *)__str, 0x20uLL, "%b %d %H:%M:%S", v6))
        fprintf(v5, "%s ", (const char *)__str);
      if (a1 <= 9)
        fprintf(v5, "%s ", loglevels[a1]);
      vfprintf(v5, __format, va);
      fflush(v5);
    }
  }
}

unint64_t coap_opt_parse(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  unint64_t v4;
  unsigned __int8 *v5;
  uint64_t v6;
  unsigned __int8 *v7;
  int v8;
  __int16 v9;
  unsigned int v10;
  unsigned int v11;
  unsigned __int8 *v12;
  const char *v14;

  if (!a1)
  {
    v14 = "opt";
    goto LABEL_34;
  }
  if (!a3)
  {
    v14 = "result";
LABEL_34:
    __assert_rtn("coap_opt_parse", "option.c", 39, v14);
  }
  if (!a2)
    return 0;
  v3 = *a1 >> 4;
  *(_WORD *)a3 = v3;
  v4 = *a1 & 0xF;
  *(_QWORD *)(a3 + 8) = v4;
  if (v3 == 13)
  {
    v7 = a1;
LABEL_13:
    if (!--a2)
      return 0;
    v9 = v7[1];
    v5 = v7 + 1;
    *(_WORD *)a3 = v3 + v9;
LABEL_15:
    if (v4 != 13)
    {
      if (v4 != 14)
      {
        if (v4 == 15)
        {
          if (maxlog >= 7)
            coap_log_impl(7, "found reserved option length 15\n");
          return 0;
        }
LABEL_24:
        v12 = v5 + 1;
        *(_QWORD *)(a3 + 16) = v12;
        if (a2 - 1 < v4)
        {
          if (maxlog >= 7)
            coap_log_impl(7, "invalid option length\n");
          return 0;
        }
        return &v12[v4] - a1;
      }
      if (!--a2)
        return 0;
      v10 = *++v5;
      v4 = ((unint64_t)v10 << 8) + 269;
      *(_QWORD *)(a3 + 8) = v4;
    }
    if (!--a2)
      return 0;
    v11 = *++v5;
    v4 += v11;
    *(_QWORD *)(a3 + 8) = v4;
    goto LABEL_24;
  }
  if (v3 == 14)
  {
    if (!--a2)
      return 0;
    v7 = a1 + 1;
    v8 = a1[1];
    LOWORD(v3) = ((_WORD)v8 << 8) + 269;
    *(_WORD *)a3 = v3;
    if (v8 == 255)
    {
      if (maxlog >= 7)
        coap_log_impl(7, "delta too large\n");
      return 0;
    }
    goto LABEL_13;
  }
  v5 = a1;
  if (v3 != 15)
    goto LABEL_15;
  v6 = 0;
  if (*a1 != 255 && maxlog >= 7)
  {
    coap_log_impl(7, "ignored reserved option delta 15\n");
    return 0;
  }
  return v6;
}

uint64_t coap_option_iterator_init(uint64_t result, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  if (!result)
    __assert_rtn("coap_option_iterator_init", "option.c", 112, "pdu");
  if (!*(_QWORD *)(result + 40))
    __assert_rtn("coap_option_iterator_init", "option.c", 113, "pdu->token");
  if (!a2)
    __assert_rtn("coap_option_iterator_init", "option.c", 114, "oi");
  *(_QWORD *)(a2 + 32) = 0;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  v3 = *(unsigned __int8 *)(result + 4);
  *(_QWORD *)(a2 + 16) = *(_QWORD *)(result + 40) + v3;
  v4 = *(_QWORD *)(result + 24);
  v5 = v4 <= v3;
  v6 = v4 - v3;
  if (v5)
  {
    v8 = 1;
  }
  else
  {
    *(_QWORD *)a2 = v6;
    if (!a3)
      return result;
    v7 = *a3;
    *(_DWORD *)(a2 + 32) = *((_DWORD *)a3 + 2);
    *(_QWORD *)(a2 + 24) = v7;
    v8 = 2;
  }
  *(_BYTE *)(a2 + 10) = v8;
  return result;
}

unsigned __int8 *coap_option_next(uint64_t a1)
{
  char v2;
  unsigned __int8 *v3;
  unsigned __int8 *v4;
  unint64_t v5;
  unint64_t v6;
  unsigned __int16 v7;
  _QWORD v9[3];

  if (!a1)
    __assert_rtn("coap_option_next", "option.c", 152, "oi");
  v2 = *(_BYTE *)(a1 + 10);
  if ((v2 & 1) == 0)
  {
    if (*(_QWORD *)a1)
    {
      v3 = *(unsigned __int8 **)(a1 + 16);
      if (v3)
      {
        memset(v9, 0, sizeof(v9));
        if (*v3 != 255)
        {
          while (1)
          {
            v4 = *(unsigned __int8 **)(a1 + 16);
            v5 = coap_opt_parse(v4, *(_QWORD *)a1, (uint64_t)v9);
            if (!v5)
              break;
            v6 = *(_QWORD *)a1 - v5;
            if (*(_QWORD *)a1 < v5)
              __assert_rtn("coap_option_next", "option.c", 167, "optsize <= oi->length");
            *(_QWORD *)(a1 + 16) += v5;
            *(_QWORD *)a1 = v6;
            v7 = *(_WORD *)(a1 + 8) + LOWORD(v9[0]);
            *(_WORD *)(a1 + 8) = v7;
            if ((*(_BYTE *)(a1 + 10) & 2) == 0 || coap_option_filter_op((_WORD *)(a1 + 24), v7, 2))
              return v4;
          }
          v2 = *(_BYTE *)(a1 + 10);
        }
      }
    }
  }
  v4 = 0;
  *(_BYTE *)(a1 + 10) = v2 | 1;
  return v4;
}

uint64_t coap_option_filter_op(_WORD *a1, unsigned int a2, int a3)
{
  int v3;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;
  int v8;
  char v9;
  char v10;
  unint64_t v11;
  int v12;
  int v13;
  BOOL v14;
  uint64_t v15;

  v3 = (unsigned __int16)*a1;
  if (a2 >= 0x100)
  {
    v7 = 0;
    v8 = 1;
    v9 = 1;
    while (1)
    {
      v10 = v9;
      if ((v8 & v3) != 0 && (unsigned __int16)a1[v7 + 1] == a2)
        break;
      v9 = 0;
      v8 = 2 * (unsigned __int16)v8;
      v7 = 1;
      if ((v10 & 1) == 0)
      {
        v6 = 3;
LABEL_12:
        if ((a3 - 1) < 2)
          return 0;
        v11 = v6 & ~v3;
        if ((v6 & ~v3) == 0)
          return 0;
        v12 = -1;
        do
        {
          v13 = v12++;
          v14 = v11 > 1;
          v11 >>= 1;
        }
        while (v14);
        v15 = (v13 + 2);
        if (a2 >= 0x100)
          a1[v15] = a2;
        else
          *((_BYTE *)a1 + v15 + 3) = a2;
        v3 |= 1 << v12;
        goto LABEL_25;
      }
    }
    if (a3 != 1)
      return 1;
    LOWORD(v3) = v3 & ~(_WORD)v8;
  }
  else
  {
    v4 = 0;
    v5 = 4;
    while ((v5 & v3) == 0 || *((unsigned __int8 *)a1 + v4 + 6) != a2)
    {
      v5 = (2 * v5) & 0x1FFF8;
      if (++v4 == 6)
      {
        v6 = 252;
        goto LABEL_12;
      }
    }
    if (a3 != 1)
      return 1;
    LOWORD(v3) = v3 & ~(_WORD)v5;
  }
LABEL_25:
  *a1 = v3;
  return 1;
}

unsigned __int8 *coap_check_option(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  v6 = 0;
  coap_option_filter_op(&v6, a2, 0);
  coap_option_iterator_init(a1, a3, &v6);
  return coap_option_next(a3);
}

uint64_t coap_opt_length(_BYTE *a1)
{
  char v1;
  int v2;
  int v3;
  unsigned __int8 *v4;

  v1 = *a1;
  v2 = *a1 & 0xF0;
  switch(v2)
  {
    case 208:
      goto LABEL_7;
    case 224:
      ++a1;
LABEL_7:
      ++a1;
      break;
    case 240:
      if (maxlog >= 7)
        coap_log_impl(7, "illegal option delta\n");
LABEL_13:
      LOWORD(v3) = 0;
      return (unsigned __int16)v3;
  }
  v3 = v1 & 0xF;
  switch(v3)
  {
    case 13:
      v4 = a1 + 1;
LABEL_16:
      LOWORD(v3) = v3 + *v4;
      return (unsigned __int16)v3;
    case 14:
      v4 = a1 + 2;
      LOWORD(v3) = (a1[1] << 8) + 269;
      goto LABEL_16;
    case 15:
      if (maxlog >= 7)
        coap_log_impl(7, "illegal option length\n");
      goto LABEL_13;
  }
  return (unsigned __int16)v3;
}

_BYTE *coap_opt_value(_BYTE *a1)
{
  int v1;
  uint64_t v2;
  int v3;

  v1 = *a1 & 0xF0;
  switch(v1)
  {
    case 208:
      v2 = 2;
      break;
    case 224:
      v2 = 3;
      break;
    case 240:
      if (maxlog >= 7)
        coap_log_impl(7, "illegal option delta\n");
      return 0;
    default:
      v2 = 1;
      break;
  }
  v3 = *a1 & 0xF;
  switch(v3)
  {
    case 13:
      return &a1[++v2];
    case 14:
      ++v2;
      return &a1[++v2];
    case 15:
      if (maxlog >= 7)
        coap_log_impl(7, "illegal option length\n");
      return 0;
  }
  return &a1[v2];
}

uint64_t coap_opt_block_num(_BYTE *a1)
{
  uint64_t result;
  _BYTE *v3;
  int v4;
  uint64_t v5;
  int v6;
  int v7;
  int v8;
  _BYTE *v9;

  result = coap_opt_length(a1);
  if ((_DWORD)result)
  {
    if ((_DWORD)result == 1
      || (v3 = coap_opt_value(a1), v4 = coap_opt_length(a1), v5 = (v4 - 1), v4 == 1))
    {
      v8 = 0;
    }
    else
    {
      v6 = 0;
      do
      {
        v7 = *v3++;
        v6 = v7 | (v6 << 8);
        --v5;
      }
      while (v5);
      v8 = 16 * v6;
    }
    coap_opt_length(a1);
    v9 = coap_opt_value(a1);
    return v8 | (v9[coap_opt_length(a1) - 1] >> 4);
  }
  return result;
}

uint64_t coap_get_block(uint64_t result, uint64_t a2)
{
  _BYTE *v3;
  _BYTE *v4;
  char v5;
  _BYTE *v6;
  unsigned int v7;
  _OWORD v8[2];
  uint64_t v9;

  if (!a2)
    __assert_rtn("coap_get_block", "block.c", 40, "block");
  *(_QWORD *)a2 = 0;
  if (result)
  {
    v9 = 0;
    memset(v8, 0, sizeof(v8));
    result = (uint64_t)coap_check_option(result, 0x17u, (uint64_t)v8);
    if (result)
    {
      v3 = (_BYTE *)result;
      if (coap_opt_length((_BYTE *)result))
      {
        coap_opt_length(v3);
        v4 = coap_opt_value(v3);
        v5 = 2 * (v4[coap_opt_length(v3) - 1] & 7);
      }
      else
      {
        v5 = 0;
      }
      *(_BYTE *)(a2 + 4) = *(_BYTE *)(a2 + 4) & 0xF1 | v5;
      if (coap_opt_length(v3))
      {
        coap_opt_length(v3);
        v6 = coap_opt_value(v3);
        if ((v6[coap_opt_length(v3) - 1] & 8) != 0)
          *(_BYTE *)(a2 + 4) |= 1u;
      }
      v7 = coap_opt_block_num(v3);
      if (v7 >> 20)
      {
        return 0;
      }
      else
      {
        *(_DWORD *)a2 = v7;
        return 1;
      }
    }
  }
  return result;
}

uint64_t coap_encode_var_safe(uint64_t a1, unsigned int a2)
{
  uint64_t v2;
  unsigned int v3;
  uint64_t v4;

  if (!a2)
    return 0;
  v2 = -1;
  v3 = a2;
  do
  {
    ++v2;
    if (v3 < 0x100)
      break;
    v3 >>= 8;
  }
  while (v2 < 3);
  v4 = (v2 + 1);
  do
  {
    *(_BYTE *)(a1 + v2) = a2;
    a2 >>= 8;
  }
  while ((unint64_t)v2--);
  return v4;
}

_QWORD *coap_new_string(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;

  v2 = malloc_type_malloc(a1 + 17, 0x9D9A23A2uLL);
  v3 = v2;
  if (v2)
  {
    *v2 = 0;
    v2[1] = v2 + 2;
    *((_BYTE *)v2 + a1 + 16) = 0;
  }
  else if (maxlog >= 2)
  {
    coap_log_impl(2, "coap_new_string: malloc: failed\n");
  }
  return v3;
}

ssize_t coap_network_send(uint64_t a1, uint64_t a2, void *a3, size_t a4)
{
  int v5;
  int v6;
  ssize_t v7;
  unint64_t v8;
  unint64_t v9;
  int v10;
  int v11;
  int v12;
  ssize_t v13;
  int *v14;
  char *v15;
  msghdr v17;
  _QWORD v18[2];
  _OWORD v19[2];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  ++send_packet_count;
  if ((*(_BYTE *)(a1 + 4) & 4) == 0)
  {
    if (!a2)
      __assert_rtn("coap_network_send", "coap_io.c", 870, "session");
    v18[0] = a3;
    v18[1] = a4;
    memset(v19, 0, sizeof(v19));
    memset(&v17.msg_namelen, 0, 40);
    v17.msg_name = (void *)(a2 + 108);
    v17.msg_namelen = *(_DWORD *)(a2 + 104);
    v17.msg_iov = (iovec *)v18;
    v17.msg_iovlen = 1;
    v5 = *(unsigned __int8 *)(a2 + 141);
    if (v5 == 30)
    {
      v8 = bswap64(*MEMORY[0x1E0C83920]);
      v9 = bswap64(*(_QWORD *)(a2 + 148));
      if (v8 == v9
        && (v8 = bswap64(*(_QWORD *)(MEMORY[0x1E0C83920] + 8)), v9 = bswap64(*(_QWORD *)(a2 + 156)), v8 == v9))
      {
        v6 = 0;
      }
      else if (v8 < v9)
      {
        v6 = -1;
      }
      else
      {
        v6 = 1;
      }
    }
    else
    {
      if (v5 != 2)
      {
        if (maxlog >= 4)
          coap_log_impl(4, "protocol not supported\n");
        goto LABEL_26;
      }
      v6 = *(_DWORD *)(a2 + 144);
    }
    if (v6)
    {
      if (v5 == 2)
      {
        if ((*(_DWORD *)(a2 + 144) & 0xF0) != 0xE0)
        {
          v17.msg_control = v19;
          v17.msg_controllen = 24;
          *(_QWORD *)&v19[0] = 24;
          v12 = *(_DWORD *)(a2 + 168);
          DWORD2(v19[0]) = 26;
          HIDWORD(v19[0]) = v12;
          v11 = *(_DWORD *)(a2 + 144);
LABEL_24:
          LODWORD(v19[1]) = v11;
        }
      }
      else if (*(unsigned __int8 *)(a2 + 148) != 255)
      {
        if (*(_DWORD *)(a2 + 148) || *(_DWORD *)(a2 + 152) || *(_DWORD *)(a2 + 156) != -65536)
        {
          v17.msg_control = v19;
          v17.msg_controllen = 32;
          DWORD2(v19[0]) = 46;
          *(_QWORD *)&v19[0] = 0x2900000020;
          HIDWORD(v19[1]) = *(_DWORD *)(a2 + 168);
          *(_OWORD *)((char *)v19 + 12) = *(_OWORD *)(a2 + 148);
          goto LABEL_26;
        }
        v17.msg_control = v19;
        v17.msg_controllen = 24;
        *(_QWORD *)&v19[0] = 24;
        v10 = *(_DWORD *)(a2 + 168);
        DWORD2(v19[0]) = 26;
        HIDWORD(v19[0]) = v10;
        v11 = *(_DWORD *)(a2 + 160);
        goto LABEL_24;
      }
    }
LABEL_26:
    v7 = sendmsg(*(_DWORD *)a1, &v17, 0);
    goto LABEL_27;
  }
  v7 = send(*(_DWORD *)a1, a3, a4, 0);
LABEL_27:
  v13 = v7;
  if (v7 < 0 && maxlog >= 2)
  {
    v14 = __error();
    v15 = strerror(*v14);
    coap_log_impl(2, "coap_network_send: %s\n", v15);
  }
  return v13;
}

uint64_t coap_network_read(uint64_t a1, uint64_t a2)
{
  __int16 v4;
  ssize_t v5;
  ssize_t v7;
  uint64_t msg_controllen;
  char *msg_control;
  unsigned int *v10;
  unsigned int v11;
  unsigned int v12;
  int v14;
  ssize_t v15;
  int *v16;
  int v17;
  int *v18;
  char *v19;
  msghdr v20;
  _QWORD v21[2];
  uint64_t v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (!a1)
    __assert_rtn("coap_network_read", "coap_io.c", 1027, "sock");
  if (!a2)
    __assert_rtn("coap_network_read", "coap_io.c", 1028, "packet");
  v4 = *(_WORD *)(a1 + 4);
  if ((v4 & 0x100) == 0)
    return -1;
  *(_WORD *)(a1 + 4) = v4 & 0xFEFF;
  if ((v4 & 4) != 0)
  {
    v15 = recv(*(_DWORD *)a1, (void *)(a2 + 80), 0x1000uLL, 0);
    if ((v15 & 0x8000000000000000) == 0)
    {
      v5 = v15;
      if (v15)
        *(_QWORD *)(a2 + 72) = v15;
      return v5;
    }
    v16 = __error();
    v17 = maxlog;
    if (*v16 == 61)
    {
      if (maxlog >= 4)
        coap_log_impl(4, "coap_network_read: unreachable\n");
      return -2;
    }
LABEL_38:
    if (v17 >= 4)
    {
      v18 = __error();
      v19 = strerror(*v18);
      coap_log_impl(4, "coap_network_read: %s\n", v19);
    }
    return -1;
  }
  v21[0] = a2 + 80;
  v21[1] = 4096;
  *(&v20.msg_namelen + 1) = 0;
  *(&v20.msg_iovlen + 1) = 0;
  v20.msg_name = (void *)(a2 + 4);
  v20.msg_namelen = 28;
  v20.msg_iov = (iovec *)v21;
  v20.msg_iovlen = 1;
  v20.msg_control = &v22;
  v20.msg_flags = 0;
  v20.msg_controllen = 32;
  v22 = -4294967252;
  v23 = -1;
  v7 = recvmsg(*(_DWORD *)a1, &v20, 0);
  if (v7 < 0)
  {
    if (*__error() == 61)
      return 0;
    v17 = maxlog;
    goto LABEL_38;
  }
  v5 = v7;
  msg_controllen = v20.msg_controllen;
  *(_DWORD *)a2 = v20.msg_namelen;
  *(_QWORD *)(a2 + 72) = v7;
  if (msg_controllen >= 0xC)
  {
    msg_control = (char *)v20.msg_control;
    if (v20.msg_control)
    {
      v10 = (unsigned int *)v20.msg_control;
      do
      {
        v11 = v10[1];
        if (v11 != -1)
        {
          if (v11)
          {
            if (v11 == 41)
            {
              v12 = v10[2];
              if (v12 == 46)
              {
                *(_DWORD *)(a2 + 64) = v10[7];
                *(_OWORD *)(a2 + 44) = *(_OWORD *)(v10 + 3);
                return v5;
              }
            }
            else
            {
              v12 = v10[2];
            }
          }
          else
          {
            v12 = v10[2];
            if (v12 == 26)
            {
              *(_DWORD *)(a2 + 64) = v10[3];
              if (*(_BYTE *)(a2 + 37) == 30)
              {
                *(_QWORD *)(a2 + 44) = 0;
                *(_DWORD *)(a2 + 52) = -65536;
                *(_DWORD *)(a2 + 56) = v10[5];
              }
              else
              {
                *(_DWORD *)(a2 + 40) = v10[5];
              }
              return v5;
            }
          }
          if (v12 != -1 && maxlog >= 7)
          {
            coap_log_impl(7, "cmsg_level = %d and cmsg_type = %d not supported - fix\n", v10[1], v12);
            msg_control = (char *)v20.msg_control;
            msg_controllen = v20.msg_controllen;
          }
        }
        v10 = (unsigned int *)((char *)v10 + ((*v10 + 3) & 0x1FFFFFFFCLL));
      }
      while (v10 + 3 <= (unsigned int *)&msg_control[msg_controllen]);
    }
  }
  v14 = *(_DWORD *)a1;
  *(_DWORD *)(a2 + 64) = *(_DWORD *)a1;
  if (getsockname(v14, (sockaddr *)(a2 + 36), (socklen_t *)(a2 + 32)) < 0 && maxlog >= 7)
    coap_log_impl(7, "Cannot determine local port\n");
  return v5;
}

unsigned __int8 *coap_pdu_init(unsigned __int8 a1, unsigned __int8 a2, __int16 a3, unint64_t a4)
{
  unsigned __int8 *v8;
  unsigned __int8 *v9;
  uint64_t v10;
  char *v11;
  unint64_t v12;

  v8 = (unsigned __int8 *)malloc_type_malloc(0x38uLL, 0x9D9A23A2uLL);
  v9 = v8;
  if (v8)
  {
    v8[2] = 6;
    v10 = 256;
    if (a4 < 0x100)
      v10 = a4;
    *((_QWORD *)v8 + 2) = v10;
    v11 = (char *)malloc_type_malloc(v10 + 6, 0x9D9A23A2uLL);
    if (v11)
    {
      v12 = v9[2];
      *((_QWORD *)v9 + 5) = &v11[v12];
      if (v12 <= 3)
        __assert_rtn("coap_pdu_clear", "pdu.c", 37, "pdu->max_hdr_size >= COAP_PDU_MAX_UDP_HEADER_SIZE");
      if (*((_QWORD *)v9 + 2) > a4)
        *((_QWORD *)v9 + 2) = a4;
      *(_WORD *)(v9 + 3) = 0;
      *((_WORD *)v9 + 4) = 0;
      *((_QWORD *)v9 + 3) = 0;
      *((_QWORD *)v9 + 4) = a4;
      *((_QWORD *)v9 + 6) = 0;
      *((_WORD *)v9 + 3) = a3;
      *v9 = a1;
      v9[1] = a2;
    }
    else
    {
      free(v9);
      return 0;
    }
  }
  return v9;
}

void coap_delete_pdu(_QWORD *a1)
{
  uint64_t v2;

  if (a1)
  {
    v2 = a1[5];
    if (v2)
      free((void *)(v2 - *((unsigned __int8 *)a1 + 2)));
    free(a1);
  }
}

uint64_t coap_pdu_resize(uint64_t a1, unint64_t a2)
{
  unint64_t v4;
  BOOL v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  char *v9;
  char *v10;
  char *v11;

  if (*(_QWORD *)(a1 + 16) >= a2)
    goto LABEL_17;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v5 = v4 >= a2;
  else
    v5 = 1;
  if (v5)
  {
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    if (v7)
    {
      v8 = v7 - v6;
      if (v7 <= v6)
        __assert_rtn("coap_pdu_resize", "pdu.c", 152, "pdu->data > pdu->token");
    }
    else
    {
      v8 = 0;
    }
    v9 = (char *)malloc_type_realloc((void *)(v6 - *(unsigned __int8 *)(a1 + 2)), *(unsigned __int8 *)(a1 + 2) + a2, 0xDE4B050DuLL);
    if (!v9)
    {
      if (maxlog >= 4)
        coap_log_impl(4, "coap_pdu_resize: realloc failed\n");
      return 0;
    }
    v10 = &v9[*(unsigned __int8 *)(a1 + 2)];
    v11 = &v10[v8];
    if (!v8)
      v11 = 0;
    *(_QWORD *)(a1 + 40) = v10;
    *(_QWORD *)(a1 + 48) = v11;
LABEL_17:
    *(_QWORD *)(a1 + 16) = a2;
    return 1;
  }
  if (maxlog >= 4)
    coap_log_impl(4, "coap_pdu_resize: pdu too big\n");
  return 0;
}

uint64_t coap_add_token(uint64_t a1, unint64_t a2, const void *a3)
{
  uint64_t result;

  result = 0;
  if (a1 && a2 <= 8)
  {
    if (*(_QWORD *)(a1 + 24))
    {
      if (maxlog >= 4)
        coap_log_impl(4, "coap_add_token: The token must defined first. Token ignored\n");
      return 0;
    }
    else
    {
      result = coap_pdu_check_resize(a1, a2);
      if ((_DWORD)result)
      {
        *(_BYTE *)(a1 + 4) = a2;
        if (a2)
          memcpy(*(void **)(a1 + 40), a3, a2);
        *(_WORD *)(a1 + 8) = 0;
        *(_QWORD *)(a1 + 24) = a2;
        result = 1;
        *(_QWORD *)(a1 + 48) = 0;
      }
    }
  }
  return result;
}

uint64_t coap_pdu_check_resize(uint64_t a1, unint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  BOOL v7;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= a2)
    return 1;
  v3 = 2 * v2;
  v4 = 256;
  if (v3 > 0x100)
    v4 = v3;
  do
  {
    v5 = v4;
    v4 *= 2;
  }
  while (v5 < a2);
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    v7 = v5 > v6;
  else
    v7 = 0;
  if (v7)
  {
    v5 = *(_QWORD *)(a1 + 32);
    if (v6 < a2)
      return 0;
  }
  result = coap_pdu_resize(a1, v5);
  if ((_DWORD)result)
    return 1;
  return result;
}

unint64_t coap_add_option(uint64_t a1, unsigned int a2, size_t a3, const void *a4)
{
  unsigned int v4;
  BOOL v5;
  unsigned __int16 v6;
  __int16 v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int16 v17;
  unint64_t result;
  _BYTE *v19;
  unint64_t v20;
  unsigned __int16 v21;
  unint64_t v22;
  char v23;
  unint64_t v24;

  *(_QWORD *)(a1 + 48) = 0;
  v4 = *(unsigned __int16 *)(a1 + 8);
  v5 = a2 >= v4;
  v6 = a2 - v4;
  if (!v5)
  {
    if (maxlog >= 4)
      coap_log_impl(4, "coap_add_option: options are not in correct order\n");
    return 0;
  }
  v9 = a2;
  v11 = 2;
  if (v6 >= 0x10Du)
    v11 = 3;
  if (v6 <= 0xCu)
    v12 = 1;
  else
    v12 = v11;
  v13 = v12 + 2;
  if (a3 <= 0x10C)
    v13 = v12 + 1;
  if (a3 >= 0xD)
    v12 = v13;
  if (!coap_pdu_check_resize(a1, v12 + a3 + *(_QWORD *)(a1 + 24)))
    return 0;
  v14 = *(_QWORD *)(a1 + 40);
  if (!v14)
    __assert_rtn("coap_opt_setheader", "option.c", 322, "opt");
  v16 = *(_QWORD *)(a1 + 16);
  v15 = *(_QWORD *)(a1 + 24);
  if (v16 == v15)
    goto LABEL_16;
  v19 = (_BYTE *)(v14 + v15);
  v20 = v16 - v15;
  v21 = v9 - *(_WORD *)(a1 + 8);
  if (v21 > 0xCu)
  {
    if (v21 > 0x10Cu)
    {
      if (v20 <= 2)
        goto LABEL_44;
      v23 = -32;
      *v19 = -32;
      v19[1] = (unsigned __int16)(v21 - 269) >> 8;
      v19[2] = v21 - 13;
      v22 = 2;
    }
    else
    {
      if (v20 <= 1)
        goto LABEL_44;
      v23 = -48;
      *v19 = -48;
      v19[1] = v21 - 13;
      v22 = 1;
    }
  }
  else
  {
    v22 = 0;
    v23 = 16 * v21;
    *v19 = 16 * v21;
  }
  if (a3 <= 0xC)
  {
    *v19 = v23 | a3;
    goto LABEL_31;
  }
  if (a3 > 0x10C)
  {
    if (v22 + 3 <= v20)
    {
      *v19 = v23 | 0xE;
      v19[v22 + 1] = (unsigned __int16)(a3 - 269) >> 8;
      v22 += 2;
      v19[v22] = a3 - 13;
      goto LABEL_31;
    }
LABEL_44:
    v17 = maxlog;
    if (maxlog < 7)
      goto LABEL_19;
    coap_log_impl(7, "insufficient space to encode option delta %d\n");
LABEL_16:
    v17 = maxlog;
    if (maxlog <= 6)
      goto LABEL_19;
    coap_log_impl(7, "coap_opt_encode: cannot set option header\n");
    goto LABEL_18;
  }
  if (v22 + 2 > v20)
  {
    v17 = maxlog;
    if (maxlog < 7)
      goto LABEL_19;
    coap_log_impl(7, "insufficient space to encode option length %zu\n");
    goto LABEL_16;
  }
  *v19 = v23 | 0xD;
  v19[++v22] = a3 - 13;
LABEL_31:
  if (v22 >= v20)
    __assert_rtn("coap_opt_encode", "option.c", 403, "l <= maxlen");
  v24 = v22 + 1;
  if (v20 - (v22 + 1) < a3)
  {
    v17 = maxlog;
    if (maxlog > 6)
    {
      coap_log_impl(7, "coap_opt_encode: option too large for buffer\n");
LABEL_18:
      v17 = maxlog;
    }
LABEL_19:
    if (v17 >= 4)
      coap_log_impl(4, "coap_add_option: cannot add option\n");
    return 0;
  }
  if (a4)
    memcpy(&v19[v24], a4, a3);
  result = v24 + a3;
  if (!(v24 + a3))
    goto LABEL_18;
  *(_WORD *)(a1 + 8) = v9;
  *(_QWORD *)(a1 + 24) += result;
  return result;
}

uint64_t coap_add_data_after(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  if (a1[6])
    __assert_rtn("coap_add_data_after", "pdu.c", 302, "pdu->data == NULL");
  a1[6] = 0;
  if (!a2 || !coap_pdu_resize((uint64_t)a1, a2 + a1[3] + 1))
    return 0;
  v4 = a1[5];
  v5 = a1[3];
  a1[3] = v5 + 1;
  *(_BYTE *)(v4 + v5) = -1;
  v6 = a1[3];
  result = a1[5] + v6;
  a1[6] = result;
  a1[3] = v6 + a2;
  return result;
}

uint64_t coap_get_data(_QWORD *a1, uint64_t *a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t result;

  if (!a1)
    __assert_rtn("coap_get_data", "pdu.c", 319, "pdu");
  if (!a2)
    __assert_rtn("coap_get_data", "pdu.c", 320, "len");
  if (!a3)
    __assert_rtn("coap_get_data", "pdu.c", 321, "data");
  *a3 = a1[6];
  v3 = a1[6];
  if (v3)
  {
    v3 = a1[3] - v3 + a1[5];
    result = 1;
  }
  else
  {
    result = 0;
  }
  *a2 = v3;
  return result;
}

uint64_t coap_pdu_parse_header_size(int a1, unsigned __int8 *a2)
{
  unsigned int v2;
  uint64_t v3;
  uint64_t v4;

  if (!a2)
    __assert_rtn("coap_pdu_parse_header_size", "pdu.c", 407, "data");
  if ((a1 - 3) > 1)
    return 4 * ((a1 - 1) < 2);
  v2 = *a2;
  v3 = 6;
  if (v2 >> 4 == 14)
    v3 = 4;
  v4 = 3;
  if (v2 >> 4 != 13)
    v4 = v3;
  if (v2 >= 0xD0)
    return v4;
  else
    return 2;
}

uint64_t coap_pdu_parse_header(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  unint64_t v8;
  uint64_t result;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(unsigned __int8 *)(a1 + 3);
  v5 = v3 - v4;
  if ((a2 - 1) > 1)
  {
    if ((a2 - 3) <= 1)
    {
      if ((v4 - 7) <= 0xFFFFFFFA)
        __assert_rtn("coap_pdu_parse_header", "pdu.c", 473, "pdu->hdr_size >= 2 && pdu->hdr_size <= 6");
      LOWORD(v7) = 0;
      *(_BYTE *)a1 = 0;
      v6 = *(_BYTE *)v5 & 0xF;
      *(_BYTE *)(a1 + 4) = v6;
      *(_BYTE *)(a1 + 1) = *(_BYTE *)(v3 - 1);
      goto LABEL_8;
    }
    if (maxlog >= 7)
      coap_log_impl(7, "coap_pdu_parse: unsupported protocol\n");
    return 0;
  }
  if ((_DWORD)v4 != 4)
    __assert_rtn("coap_pdu_parse_header", "pdu.c", 463, "pdu->hdr_size == 4");
  if ((*(_BYTE *)v5 & 0xC0) != 0x40)
  {
    if (maxlog >= 7)
      coap_log_impl(7, "coap_pdu_parse: UDP version not supported\n");
    return 0;
  }
  *(_BYTE *)a1 = (*(_BYTE *)v5 >> 4) & 3;
  v6 = *(_BYTE *)v5 & 0xF;
  *(_BYTE *)(a1 + 4) = v6;
  *(_BYTE *)(a1 + 1) = *(_BYTE *)(v5 + 1);
  v7 = bswap32(*(unsigned __int16 *)(v5 + 2)) >> 16;
LABEL_8:
  *(_WORD *)(a1 + 6) = v7;
  v8 = *(_QWORD *)(a1 + 16);
  if (v8 >= v6)
    return 1;
  if (maxlog >= 7)
  {
    coap_log_impl(7, "coap_pdu_parse: PDU header token size broken\n");
    v8 = *(_QWORD *)(a1 + 16);
  }
  result = 0;
  *(_BYTE *)(a1 + 4) = v8;
  return result;
}

uint64_t coap_pdu_parse_opt(uint64_t a1)
{
  unint64_t v2;
  unint64_t v3;
  BOOL v4;
  unint64_t v6;
  unsigned __int8 *v7;
  unint64_t v8;
  _QWORD v9[3];

  if (*(_BYTE *)(a1 + 1))
  {
    v2 = *(unsigned __int8 *)(a1 + 4);
    v3 = *(_QWORD *)(a1 + 24);
    v4 = v2 <= 8 && v3 >= v2;
    if (!v4)
    {
      if (maxlog >= 7)
        coap_log_impl(7, "coap_pdu_parse: invalid Token\n");
      return 0;
    }
    v6 = v3 - v2;
    if (v3 != v2)
    {
      v7 = (unsigned __int8 *)(*(_QWORD *)(a1 + 40) + v2);
      while (*v7 != 255)
      {
        memset(v9, 0, sizeof(v9));
        v8 = coap_opt_parse(v7, v6, (uint64_t)v9);
        if (!v8)
        {
          if (maxlog >= 7)
            coap_log_impl(7, "coap_pdu_parse: missing payload start code\n");
          return 0;
        }
        v4 = v6 >= v8;
        v6 -= v8;
        if (!v4)
          __assert_rtn("next_option_safe", "pdu.c", 395, "optsize <= *length");
        v7 += v8;
        if (!v6)
          goto LABEL_27;
      }
      if (v6 != 1)
      {
        *(_QWORD *)(a1 + 48) = v7 + 1;
        return 1;
      }
      if (maxlog >= 7)
        coap_log_impl(7, "coap_pdu_parse: message ending in payload start marker\n");
      return 0;
    }
  }
  else
  {
    if (*(_QWORD *)(a1 + 24) || *(_BYTE *)(a1 + 4))
    {
      if (maxlog >= 7)
        coap_log_impl(7, "coap_pdu_parse: empty message is not empty\n");
      return 0;
    }
    *(_QWORD *)(a1 + 24) = 0;
  }
LABEL_27:
  *(_QWORD *)(a1 + 48) = 0;
  return 1;
}

uint64_t coap_pdu_encode_header(uint64_t a1, int a2)
{
  char v3;
  char v4;
  unint64_t v6;
  unint64_t v7;
  BOOL v8;
  unint64_t v9;
  unsigned int v10;
  __int16 v11;
  int v12;

  if ((a2 - 1) <= 1)
  {
    if (*(unsigned __int8 *)(a1 + 2) <= 3u)
      __assert_rtn("coap_pdu_encode_header", "pdu.c", 570, "pdu->max_hdr_size >= 4");
    *(_BYTE *)(*(_QWORD *)(a1 + 40) - 4) = *(_BYTE *)(a1 + 4) | (16 * *(_BYTE *)a1) | 0x40;
    *(_BYTE *)(*(_QWORD *)(a1 + 40) - 3) = *(_BYTE *)(a1 + 1);
    *(_BYTE *)(*(_QWORD *)(a1 + 40) - 2) = *(_BYTE *)(a1 + 7);
    v3 = *(_BYTE *)(a1 + 6);
    goto LABEL_4;
  }
  if ((a2 - 3) <= 1)
  {
    v6 = *(_QWORD *)(a1 + 24);
    v7 = *(unsigned __int8 *)(a1 + 4);
    v8 = v6 >= v7;
    v9 = v6 - v7;
    if (!v8)
      __assert_rtn("coap_pdu_encode_header", "pdu.c", 585, "pdu->used_size >= pdu->token_length");
    if (v9 <= 0xC)
    {
      if (*(unsigned __int8 *)(a1 + 2) <= 1u)
        __assert_rtn("coap_pdu_encode_header", "pdu.c", 592, "pdu->max_hdr_size >= 2");
      *(_BYTE *)(*(_QWORD *)(a1 + 40) - 2) = v7 | (16 * v9);
      *(_BYTE *)(*(_QWORD *)(a1 + 40) - 1) = *(_BYTE *)(a1 + 1);
      v4 = 2;
      goto LABEL_5;
    }
    if (v9 <= 0x10C)
    {
      if (*(unsigned __int8 *)(a1 + 2) <= 2u)
        __assert_rtn("coap_pdu_encode_header", "pdu.c", 603, "pdu->max_hdr_size >= 3");
      *(_BYTE *)(*(_QWORD *)(a1 + 40) - 3) = v7 | 0xD0;
      *(_BYTE *)(*(_QWORD *)(a1 + 40) - 2) = v9 - 13;
      *(_BYTE *)(*(_QWORD *)(a1 + 40) - 1) = *(_BYTE *)(a1 + 1);
      v4 = 3;
      goto LABEL_5;
    }
    v10 = *(unsigned __int8 *)(a1 + 2);
    if (v9 > 0x1010C)
    {
      if (v10 <= 5)
        __assert_rtn("coap_pdu_encode_header", "pdu.c", 626, "pdu->max_hdr_size >= 6");
      *(_BYTE *)(*(_QWORD *)(a1 + 40) - 6) = v7 | 0xF0;
      v12 = v9 - 65805;
      *(_BYTE *)(*(_QWORD *)(a1 + 40) - 5) = HIBYTE(v12);
      *(_BYTE *)(*(_QWORD *)(a1 + 40) - 4) = BYTE2(v12);
      *(_BYTE *)(*(_QWORD *)(a1 + 40) - 3) = BYTE1(v12);
      *(_BYTE *)(*(_QWORD *)(a1 + 40) - 2) = v12;
      *(_BYTE *)(*(_QWORD *)(a1 + 40) - 1) = *(_BYTE *)(a1 + 1);
      v4 = 6;
      goto LABEL_5;
    }
    if (v10 <= 3)
      __assert_rtn("coap_pdu_encode_header", "pdu.c", 614, "pdu->max_hdr_size >= 4");
    *(_BYTE *)(*(_QWORD *)(a1 + 40) - 4) = v7 | 0xE0;
    v11 = v9 - 269;
    *(_BYTE *)(*(_QWORD *)(a1 + 40) - 3) = HIBYTE(v11);
    *(_BYTE *)(*(_QWORD *)(a1 + 40) - 2) = v11;
    v3 = *(_BYTE *)(a1 + 1);
LABEL_4:
    *(_BYTE *)(*(_QWORD *)(a1 + 40) - 1) = v3;
    v4 = 4;
LABEL_5:
    *(_BYTE *)(a1 + 3) = v4;
    return *(unsigned __int8 *)(a1 + 3);
  }
  if (maxlog >= 4)
    coap_log_impl(4, "coap_pdu_encode_header: unsupported protocol\n");
  return *(unsigned __int8 *)(a1 + 3);
}

uint64_t coap_print_wellknown(uint64_t a1, _BYTE *a2, _QWORD *a3, uint64_t a4, _BYTE *a5)
{
  uint64_t v8;
  size_t i;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  const char *v15;
  _BYTE *v16;
  size_t v17;
  uint64_t v18;
  size_t v19;
  uint64_t v20;
  int v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  _BYTE *v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  __int128 *v31;
  _BYTE *v32;
  unint64_t *v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *j;
  unint64_t *v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t *v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t k;
  unint64_t v46;
  unsigned int v47;
  _QWORD *v49;
  uint64_t v50;
  unsigned int v52;
  unsigned int v53;
  _BYTE *__s1;
  __int128 v55;
  size_t v56;
  _BYTE *v57;

  v8 = *a3;
  v56 = 0;
  v57 = 0;
  if (!a5)
  {
    i = 0;
    __s1 = 0;
LABEL_10:
    v13 = 0;
    goto LABEL_26;
  }
  __s1 = coap_opt_value(a5);
  for (i = 0; i < coap_opt_length(a5) && __s1[i] != 61; ++i)
    ;
  if (i >= coap_opt_length(a5))
    goto LABEL_10;
  v11 = a4;
  v12 = i == 4 && *(_DWORD *)__s1 == 1717924456;
  v14 = &coap_print_wellknown__rt_attributes;
  v15 = "rt";
  while (i != *v14 || memcmp(__s1, v15, i))
  {
    v15 = (const char *)v14[3];
    v14 += 2;
    if (!v15)
      goto LABEL_18;
  }
  v12 = v12 | 4;
LABEL_18:
  v16 = &coap_opt_value(a5)[i];
  v57 = v16 + 1;
  if (i >= coap_opt_length(a5))
    __assert_rtn("coap_print_wellknown", "resource.c", 212, "(resource_param.length + 1) <= coap_opt_length(query_filter)");
  v17 = ~i + coap_opt_length(a5);
  v56 = v17;
  v18 = 1;
  if ((v12 & 1) != 0 && v16[1] == 47)
  {
    v56 = --v17;
    v57 = v16 + 2;
    v18 = 2;
  }
  v13 = v12;
  if (v17)
  {
    v19 = v17 - 1;
    if (v16[v18 + v19] == 42)
    {
      v56 = v19;
      v13 = v12 | 2;
    }
  }
  a4 = v11;
LABEL_26:
  v49 = a3;
  v50 = a4;
  v20 = *(_QWORD *)(a1 + 16);
  if (v20)
  {
    v21 = 0;
    v22 = 0;
    v23 = (unint64_t)&a2[v8];
    v52 = v13 >> 2;
    v53 = (v13 >> 1) & 1;
    v24 = a4;
    v25 = a2;
    while (1)
    {
      v26 = v20;
      v20 = *(_QWORD *)(v20 + 80);
      if (!i)
        goto LABEL_36;
      if ((v13 & 1) != 0)
        break;
      v27 = v22;
      v28 = v13;
      v55 = 0uLL;
      v29 = *(_QWORD **)(v26 + 120);
      if (!v29)
        goto LABEL_34;
      while (1)
      {
        v30 = v29[1];
        if (*(_QWORD *)v30 == i && !memcmp(*(const void **)(v30 + 8), __s1, i))
          break;
        v29 = (_QWORD *)*v29;
        if (!v29)
          goto LABEL_34;
      }
      v31 = (__int128 *)v29[2];
      if (!v31)
        goto LABEL_34;
      v55 = *v31;
      if (**((_BYTE **)v31 + 1) == 34)
      {
        *(_QWORD *)&v55 = v55 - 2;
        ++*((_QWORD *)&v55 + 1);
      }
      if (!match((uint64_t)&v55, (uint64_t)&v56, v53, v52))
      {
LABEL_34:
        v13 = v28;
        v22 = v27;
        goto LABEL_108;
      }
      v13 = v28;
      v22 = v27;
      if (v21)
        goto LABEL_37;
LABEL_47:
      if ((uint64_t)(v23 - (_QWORD)v25) >= 1)
      {
        if (!v24)
        {
          *v25 = 60;
          v32 = v25 + 1;
          if ((unint64_t)(v25 + 1) >= v23)
          {
            v24 = 0;
            goto LABEL_57;
          }
LABEL_55:
          v24 = 0;
          *v32++ = 47;
          goto LABEL_57;
        }
        --v24;
      }
      if ((unint64_t)v25 < v23)
      {
        v32 = v25;
        if (!v24)
          goto LABEL_55;
        --v24;
      }
      v32 = v25;
LABEL_57:
      v33 = *(unint64_t **)(v26 + 136);
      v34 = *v33;
      if (*v33)
      {
        v35 = 0;
        do
        {
          if ((unint64_t)v32 < v23)
          {
            if (v24)
            {
              --v24;
            }
            else
            {
              *v32++ = *(_BYTE *)(v33[1] + v35);
              v33 = *(unint64_t **)(v26 + 136);
              v34 = *v33;
            }
          }
          ++v35;
        }
        while (v35 < v34);
        v36 = v35 + 2;
      }
      else
      {
        v36 = 2;
      }
      if ((unint64_t)v32 < v23)
      {
        if (v24)
          --v24;
        else
          *v32++ = 62;
      }
      v37 = v36 + 1;
      for (j = *(_QWORD **)(v26 + 120); j; j = (_QWORD *)*j)
      {
        if ((unint64_t)v32 < v23)
        {
          if (v24)
            --v24;
          else
            *v32++ = 59;
        }
        ++v37;
        v39 = (unint64_t *)j[1];
        v40 = *v39;
        if (*v39)
        {
          v41 = 0;
          do
          {
            if ((unint64_t)v32 < v23)
            {
              if (v24)
              {
                --v24;
              }
              else
              {
                *v32++ = *(_BYTE *)(v39[1] + v41);
                v39 = (unint64_t *)j[1];
                v40 = *v39;
              }
            }
            ++v41;
          }
          while (v41 < v40);
          v37 += v41;
        }
        v42 = (unint64_t *)j[2];
        if (v42 && v42[1])
        {
          if ((unint64_t)v32 < v23)
          {
            if (v24)
            {
              --v24;
            }
            else
            {
              *v32++ = 61;
              v42 = (unint64_t *)j[2];
            }
          }
          ++v37;
          v43 = *v42;
          if (*v42)
          {
            v44 = 0;
            do
            {
              if ((unint64_t)v32 < v23)
              {
                if (v24)
                {
                  --v24;
                }
                else
                {
                  *v32++ = *(_BYTE *)(v42[1] + v44);
                  v42 = (unint64_t *)j[2];
                  v43 = *v42;
                }
              }
              ++v44;
            }
            while (v44 < v43);
            v37 += v44;
          }
        }
      }
      if ((*(_BYTE *)v26 & 4) != 0)
      {
        for (k = 0; k != 4; ++k)
        {
          if ((unint64_t)v32 < v23)
          {
            if (v24)
              --v24;
            else
              *v32++ = aObs[k];
          }
        }
        v37 += 4;
      }
      v46 = v32 - v25;
      if (v46 >> 28)
        goto LABEL_111;
      v25 += v46 & 0xFFFFFFF;
      v22 += v37;
      v21 = 1;
LABEL_108:
      if (!v20)
        goto LABEL_111;
    }
    if (!match(*(_QWORD *)(v26 + 136), (uint64_t)&v56, v53, v52))
      goto LABEL_108;
LABEL_36:
    if (!v21)
      goto LABEL_47;
LABEL_37:
    if ((unint64_t)v25 < v23)
    {
      if (v24)
        --v24;
      else
        *v25++ = 44;
    }
    ++v22;
    goto LABEL_47;
  }
  v22 = 0;
  v24 = a4;
  v25 = a2;
LABEL_111:
  *v49 = v22;
  v47 = (_DWORD)v25 - (_DWORD)a2;
  if (v25 - a2 + v50 - v24 < v22)
    v47 = ((_DWORD)v25 - (_DWORD)a2) | 0x40000000;
  if ((unint64_t)(v25 - a2) >> 28)
    return 0x80000000;
  else
    return v47;
}

BOOL match(uint64_t a1, uint64_t a2, int a3, int a4)
{
  size_t v5;
  size_t v6;
  _BOOL8 result;
  void *v9;
  _BYTE *v10;
  _BYTE *v11;
  int64_t v12;
  uint64_t v13;
  size_t v14;
  const char *v15;

  if (!a1)
  {
    v15 = "text";
    goto LABEL_27;
  }
  if (!a2)
  {
    v15 = "pattern";
LABEL_27:
    __assert_rtn("match", "resource.c", 102, v15);
  }
  v5 = *(_QWORD *)a1;
  v6 = *(_QWORD *)a2;
  if (*(_QWORD *)a1 < *(_QWORD *)a2)
    return 0;
  if (!a4)
  {
    if (a3 || v6 == v5)
      return memcmp(*(const void **)(a1 + 8), *(const void **)(a2 + 8), *(_QWORD *)a2) == 0;
    return 0;
  }
  if (!v5)
    return 0;
  v9 = *(void **)(a1 + 8);
  while (1)
  {
    v10 = memchr(v9, 32, v5);
    v11 = v10;
    v12 = v10 - (_BYTE *)v9;
    v13 = v10 ? (uint64_t)(v10 + 1) : 0;
    v14 = v10 ? v10 - (_BYTE *)v9 : v5;
    if ((a3 || v6 == v14) && !memcmp(v9, *(const void **)(a2 + 8), v6))
      break;
    result = 0;
    if (v11)
    {
      v9 = (void *)v13;
      v5 += ~v12;
      if (v5)
        continue;
    }
    return result;
  }
  return 1;
}

void coap_free_resource(uint64_t a1)
{
  void **v2;
  void **v3;
  void *v4;
  _QWORD *v5;
  _QWORD *v6;
  void *v7;

  v2 = *(void ***)(a1 + 120);
  if (v2)
  {
    do
    {
      v3 = (void **)*v2;
      free(v2[1]);
      v4 = v2[2];
      if (v4)
        free(v4);
      free(v2);
      v2 = v3;
    }
    while (v3);
  }
  free(*(void **)(a1 + 136));
  v5 = *(_QWORD **)(a1 + 128);
  if (v5)
  {
    do
    {
      v6 = (_QWORD *)*v5;
      coap_session_release(v5[1]);
      v7 = (void *)v5[6];
      if (v7)
        free(v7);
      free(v5);
      v5 = v6;
    }
    while (v6);
  }
  free((void *)a1);
}

uint64_t coap_get_resource_from_uri_path(uint64_t a1, size_t __n, unsigned __int8 *__s2)
{
  int v5;
  unsigned int v6;
  unsigned __int8 *v7;
  unsigned int v8;
  int v9;
  unsigned int v10;
  unsigned int v11;
  int v12;
  unsigned int v13;
  unsigned int v14;
  int v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  uint64_t v19;
  int v20;
  unsigned int v21;
  unsigned int v22;
  int v23;
  unsigned int v24;
  unsigned int v25;
  int v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v5 = -17973521;
  v6 = -1640531527;
  if (__n < 0xC)
  {
    v9 = -1640531527;
    v8 = __n;
    v7 = __s2;
  }
  else
  {
    v7 = __s2;
    v8 = __n;
    v9 = -1640531527;
    do
    {
      v10 = *((_DWORD *)v7 + 1) + v6;
      v11 = *((_DWORD *)v7 + 2) + v5;
      v12 = (*(_DWORD *)v7 + v9 - (v10 + v11)) ^ (v11 >> 13);
      v13 = (v10 - v11 - v12) ^ (v12 << 8);
      v14 = (v11 - v12 - v13) ^ (v13 >> 13);
      v15 = (v12 - v13 - v14) ^ (v14 >> 12);
      v16 = (v13 - v14 - v15) ^ (v15 << 16);
      v17 = (v14 - v15 - v16) ^ (v16 >> 5);
      v9 = (v15 - v16 - v17) ^ (v17 >> 3);
      v6 = (v16 - v17 - v9) ^ (v9 << 10);
      v5 = (v17 - v9 - v6) ^ (v6 >> 15);
      v7 += 12;
      v8 -= 12;
    }
    while (v8 > 0xB);
  }
  v18 = v5 + __n;
  switch(v8)
  {
    case 1u:
      goto LABEL_17;
    case 2u:
      goto LABEL_16;
    case 3u:
      goto LABEL_15;
    case 4u:
      goto LABEL_14;
    case 5u:
      goto LABEL_13;
    case 6u:
      goto LABEL_12;
    case 7u:
      goto LABEL_11;
    case 8u:
      goto LABEL_10;
    case 9u:
      goto LABEL_9;
    case 0xAu:
      goto LABEL_8;
    case 0xBu:
      v18 += v7[10] << 24;
LABEL_8:
      v18 += v7[9] << 16;
LABEL_9:
      v18 += v7[8] << 8;
LABEL_10:
      v6 += v7[7] << 24;
LABEL_11:
      v6 += v7[6] << 16;
LABEL_12:
      v6 += v7[5] << 8;
LABEL_13:
      v6 += v7[4];
LABEL_14:
      v9 += v7[3] << 24;
LABEL_15:
      v9 += v7[2] << 16;
LABEL_16:
      v9 += v7[1] << 8;
LABEL_17:
      v9 += *v7;
      break;
    default:
      break;
  }
  v19 = *(_QWORD *)(a1 + 16);
  if (!v19)
    return 0;
  v20 = (v9 - v18 - v6) ^ (v18 >> 13);
  v21 = (v6 - v18 - v20) ^ (v20 << 8);
  v22 = (v18 - v20 - v21) ^ (v21 >> 13);
  v23 = (v20 - v21 - v22) ^ (v22 >> 12);
  v24 = (v21 - v22 - v23) ^ (v23 << 16);
  v25 = (v22 - v23 - v24) ^ (v24 >> 5);
  v26 = (v23 - v24 - v25) ^ (v25 >> 3);
  v27 = (v25 - v26 - ((v24 - v25 - v26) ^ (v26 << 10))) ^ (((v24 - v25 - v26) ^ (v26 << 10)) >> 15);
  v28 = *(_QWORD *)(v19 + 64);
  v29 = *(_QWORD *)(*(_QWORD *)v28 + 16 * ((*(_DWORD *)(v28 + 8) - 1) & v27));
  if (!v29)
    return 0;
  v30 = -*(_QWORD *)(v28 + 32);
  while (1)
  {
    v31 = v29 + v30;
    if (*(_DWORD *)(v29 + v30 + 116) == v27
      && *(_DWORD *)(v31 + 112) == __n
      && !memcmp(*(const void **)(v31 + 104), __s2, __n))
    {
      break;
    }
    v29 = *(_QWORD *)(v31 + 96);
    if (!v29)
      return 0;
  }
  return v31;
}

_QWORD *coap_find_observer(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *i;

  if (!a1)
    __assert_rtn("coap_find_observer", "resource.c", 586, "resource");
  if (!a2)
    __assert_rtn("coap_find_observer", "resource.c", 587, "session");
  for (i = *(_QWORD **)(a1 + 128); i; i = (_QWORD *)*i)
  {
    if (i[1] == a2 && (!a3 || *(_QWORD *)a3 == i[4] && !memcmp(*(const void **)(a3 + 8), i + 5, *(_QWORD *)a3)))
      break;
  }
  return i;
}

_QWORD *coap_add_observer(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, char a5, uint64_t a6)
{
  _QWORD *observer;
  _QWORD *v13;
  void *v14;
  _QWORD *i;
  uint64_t v17;
  size_t v18;
  _QWORD *v19;
  unint64_t v20;
  void *v21;
  size_t v22;
  _QWORD v23[2];

  observer = coap_find_observer(a1, a2, a3);
  if (observer)
  {
    v13 = observer;
    v14 = (void *)observer[6];
    if (v14)
      free(v14);
    v13[6] = a4;
  }
  else
  {
    for (i = *(_QWORD **)(a1 + 128); i; i = (_QWORD *)*i)
    {
      if (i[1] == a2)
      {
        v17 = i[6];
        if (a4)
        {
          if (v17)
          {
            v18 = *(_QWORD *)a4;
            if (*(_QWORD *)a4 == *(_QWORD *)v17
              && (!v18 || !memcmp(*((const void **)a4 + 1), *(const void **)(v17 + 8), v18)))
            {
LABEL_17:
              v23[0] = i[4];
              v23[1] = i + 5;
              coap_delete_observer(a1, a2, (uint64_t)v23);
              break;
            }
          }
        }
        else if (!v17)
        {
          goto LABEL_17;
        }
      }
    }
    v19 = malloc_type_malloc(0x38uLL, 0x9D9A23A2uLL);
    if (v19)
    {
      v13 = v19;
      v19[6] = 0;
      *((_OWORD *)v19 + 1) = 0u;
      *((_OWORD *)v19 + 2) = 0u;
      *(_OWORD *)v19 = 0u;
      ++*(_DWORD *)(a2 + 4);
      v19[1] = a2;
      if (a3)
      {
        v20 = *(_QWORD *)a3;
        if (*(_QWORD *)a3)
        {
          v19[4] = v20;
          v21 = v19 + 5;
          if (v20 >= 8)
            v22 = 8;
          else
            v22 = v20;
          memcpy(v21, *(const void **)(a3 + 8), v22);
        }
      }
      v13[6] = a4;
      *((_BYTE *)v13 + 16) = v13[2] & 0x7F | (a5 << 7);
      *(_QWORD *)((char *)v13 + 20) = a6;
      *v13 = *(_QWORD *)(a1 + 128);
      *(_QWORD *)(a1 + 128) = v13;
      if (maxlog >= 7)
        coap_log_impl(7, "create new subscription\n");
    }
    else
    {
      if (a4)
        free(a4);
      return 0;
    }
  }
  return v13;
}

void coap_delete_observer(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *observer;
  _QWORD *v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  BOOL v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  BOOL v14;
  void *v15;
  _QWORD v16[2];
  char v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  observer = coap_find_observer(a1, a2, a3);
  if (observer)
  {
    v6 = observer;
    if (maxlog >= 7)
    {
      v16[0] = 0;
      v16[1] = 0;
      v17 = 0;
      if (!observer[4])
        goto LABEL_7;
      v7 = 0;
      v8 = 0;
      v9 = 1;
      do
      {
        snprintf((char *)v16 + v7, 3uLL, "%02x", *((unsigned __int8 *)v6 + v8 + 40));
        v8 = v9;
        v10 = v6[4] > (unint64_t)v9++;
        v7 += 2;
      }
      while (v10);
      if (maxlog >= 7)
LABEL_7:
        coap_log_impl(7, "removed observer tid %s\n", (const char *)v16);
    }
    v13 = *(_QWORD **)(a1 + 128);
    v12 = (_QWORD *)(a1 + 128);
    v11 = v13;
    if (v13)
    {
      if (v11 == v6)
        goto LABEL_16;
      do
      {
        v12 = v11;
        v11 = (_QWORD *)*v11;
        if (v11)
          v14 = v11 == v6;
        else
          v14 = 1;
      }
      while (!v14);
      if (v11)
LABEL_16:
        *v12 = *v6;
      coap_session_release(a2);
      v15 = (void *)v6[6];
      if (v15)
        free(v15);
      free(v6);
    }
  }
}

_QWORD *coap_touch_observer(_QWORD *result, uint64_t a2, uint64_t a3)
{
  _QWORD *v5;
  uint64_t v6;

  if (result)
  {
    v5 = result;
    do
    {
      v6 = (uint64_t)v5;
      v5 = (_QWORD *)v5[10];
      result = coap_find_observer(v6, a2, a3);
      if (result)
        *((_BYTE *)result + 16) &= 0xCFu;
    }
    while (v5);
  }
  return result;
}

_QWORD *coap_insert_node(_QWORD *result, _QWORD *a2)
{
  _QWORD *v2;
  unint64_t v3;
  unint64_t v4;
  _QWORD *v5;

  if (result)
  {
    v2 = (_QWORD *)*result;
    if (*result)
    {
      v3 = a2[1];
      v4 = v2[1];
      if (v4 <= v3)
      {
        while (1)
        {
          v5 = v2;
          v3 -= v4;
          a2[1] = v3;
          v2 = (_QWORD *)*v2;
          if (!v2)
            break;
          v4 = v2[1];
          if (v4 > v3)
          {
            v2[1] = v4 - v3;
            break;
          }
        }
        *a2 = v2;
        *v5 = a2;
      }
      else
      {
        *a2 = v2;
        *result = a2;
        v2[1] = v4 - v3;
      }
    }
    else
    {
      *result = a2;
    }
  }
  return result;
}

void coap_delete_node(_QWORD **a1)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  BOOL v7;

  if (a1)
  {
    coap_delete_pdu(a1[5]);
    v2 = a1[3];
    if (v2)
    {
      v3 = v2[26];
      v6 = *(_QWORD **)(v3 + 48);
      v4 = (_QWORD *)(v3 + 48);
      v5 = v6;
      if (v6)
      {
        if (v5 == a1)
          goto LABEL_11;
        do
        {
          v4 = v5;
          v5 = (_QWORD *)*v5;
          if (v5)
            v7 = v5 == a1;
          else
            v7 = 1;
        }
        while (!v7);
        if (v5)
LABEL_11:
          *v4 = *a1;
      }
      coap_session_release();
    }
    free(a1);
  }
}

void coap_delete_all(_QWORD **a1)
{
  if (a1)
  {
    coap_delete_all(*a1);
    coap_delete_node(a1);
  }
}

_OWORD *coap_new_node()
{
  _OWORD *v0;
  _OWORD *v1;

  v0 = malloc_type_malloc(0x30uLL, 0x9D9A23A2uLL);
  v1 = v0;
  if (v0)
  {
    v0[1] = 0u;
    v0[2] = 0u;
    *v0 = 0u;
  }
  else if (maxlog >= 4)
  {
    coap_log_impl(4, "coap_new_node: malloc failed\n");
  }
  return v1;
}

uint64_t coap_startup()
{
  uint64_t result;
  timeval v1;

  if ((coap_started & 1) == 0)
  {
    coap_started = 1;
    v1.tv_sec = 0;
    *(_QWORD *)&v1.tv_usec = 0;
    gettimeofday(&v1, 0);
    coap_clock_offset = v1.tv_sec;
    v1.tv_sec = 0;
    *(_QWORD *)&v1.tv_usec = 0;
    return gettimeofday(&v1, 0);
  }
  return result;
}

void coap_free_context(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _DWORD *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD *v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;

  if (!a1)
    return;
  coap_delete_all(*(_QWORD ***)(a1 + 48));
  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
    goto LABEL_23;
  while (1)
  {
    v3 = *(_QWORD *)(v2 + 72);
    v4 = *(_QWORD *)(v2 + 80);
    if (v3)
    {
      v5 = *(_QWORD *)(a1 + 16);
      goto LABEL_6;
    }
    v5 = *(_QWORD *)(a1 + 16);
    if (!v4)
      break;
LABEL_6:
    v6 = *(_QWORD *)(v5 + 64);
    if (v2 + 64 == *(_QWORD *)(v6 + 24))
    {
      *(_QWORD *)(v6 + 24) = v3 + *(_QWORD *)(v6 + 32);
      if (v3)
      {
LABEL_8:
        *(_QWORD *)(v3 + *(_QWORD *)(v6 + 32) + 16) = v4;
        v7 = *(_QWORD *)(v2 + 80);
        if (!v7)
          goto LABEL_13;
        goto LABEL_12;
      }
    }
    else if (v3)
    {
      goto LABEL_8;
    }
    *(_QWORD *)(a1 + 16) = v4;
    v6 = *(_QWORD *)(v4 + 64);
    v7 = v4;
LABEL_12:
    *(_QWORD *)(v7 + *(_QWORD *)(v6 + 32) + 8) = v3;
LABEL_13:
    v8 = *(_QWORD *)v6 + 16 * ((*(_DWORD *)(v6 + 8) - 1) & *(_DWORD *)(v2 + 116));
    --*(_DWORD *)(v8 + 8);
    if (*(_QWORD *)v8 == v2 + 64)
      *(_QWORD *)v8 = *(_QWORD *)(v2 + 96);
    v9 = *(_QWORD *)(v2 + 88);
    if (v9)
      *(_QWORD *)(v9 + 32) = *(_QWORD *)(v2 + 96);
    v10 = *(_QWORD *)(v2 + 96);
    if (v10)
      *(_QWORD *)(v10 + 24) = v9;
    --*(_DWORD *)(v6 + 16);
    coap_free_resource(v2);
    v2 = v4;
    if (!v4)
      goto LABEL_23;
  }
  free(**(void ***)(v5 + 64));
  free(*(void **)(*(_QWORD *)(a1 + 16) + 64));
  *(_QWORD *)(a1 + 16) = 0;
  coap_free_resource(v2);
LABEL_23:
  *(_QWORD *)(a1 + 16) = 0;
  v11 = *(_QWORD *)(a1 + 24);
  if (v11)
  {
    coap_free_resource(v11);
    *(_QWORD *)(a1 + 24) = 0;
  }
  v12 = *(_QWORD **)(a1 + 56);
  while (v12)
  {
    v13 = v12;
    v12 = (_QWORD *)*v12;
    if (*((_WORD *)v13 + 14))
    {
      v14 = v13[6];
      if (v14 != -1)
      {
        *((_QWORD *)v13 + 4) = 0;
        *((_QWORD *)v13 + 5) = 0;
        close(v14);
        v13[6] = -1;
      }
      *((_WORD *)v13 + 14) = 0;
    }
    v15 = *((_QWORD *)v13 + 10);
    if (v15)
    {
      do
      {
        if (*(_DWORD *)(v15 + 4))
          __assert_rtn("coap_free_endpoint", "coap_session.c", 1014, "session->ref == 0");
        v16 = *(_QWORD *)(v15 + 64);
        coap_session_free((_DWORD *)v15);
        v15 = v16;
      }
      while (v16);
    }
    v17 = *((_QWORD *)v13 + 1);
    if (v17)
    {
      v20 = *(_QWORD **)(v17 + 56);
      v18 = (_QWORD *)(v17 + 56);
      v19 = v20;
      if (v20 == (_QWORD *)v13)
        goto LABEL_41;
      do
      {
        v18 = v19;
        v19 = (_QWORD *)*v19;
        if (v19)
          v21 = v19 == (_QWORD *)v13;
        else
          v21 = 1;
      }
      while (!v21);
      if (v19)
LABEL_41:
        *v18 = *(_QWORD *)v13;
    }
    free(v13);
  }
  v22 = *(_QWORD *)(a1 + 64);
  if (v22)
  {
    do
    {
      v23 = *(_QWORD *)(v22 + 64);
      coap_session_release(v22);
      v22 = v23;
    }
    while (v23);
  }
  v24 = *(void **)(a1 + 160);
  if (v24)
    free(v24);
  v25 = *(void **)(a1 + 176);
  if (v25)
    free(v25);
  free((void *)a1);
}

uint64_t coap_get_session_client_psk(uint64_t a1, int a2, int a3, void *__dst, _QWORD *a5, size_t a6, void *a7, unint64_t a8)
{
  const void *v11;
  size_t v12;
  unint64_t v13;
  uint64_t result;
  uint64_t v15;
  const void *v16;

  v11 = *(const void **)(a1 + 312);
  if (v11 && (v12 = *(_QWORD *)(a1 + 320)) != 0 && *(_QWORD *)(a1 + 328) && (v13 = *(_QWORD *)(a1 + 336)) != 0)
  {
    if (v12 <= a6 && v13 <= a8)
    {
      memcpy(__dst, v11, v12);
      memcpy(a7, *(const void **)(a1 + 328), *(_QWORD *)(a1 + 336));
      *a5 = *(_QWORD *)(a1 + 320);
      return *(_QWORD *)(a1 + 336);
    }
  }
  else
  {
    v15 = *(_QWORD *)(a1 + 208);
    if (v15)
    {
      v16 = *(const void **)(v15 + 176);
      if (v16)
      {
        if (*(_QWORD *)(v15 + 184) - 1 < a8)
        {
          *a5 = 0;
          memcpy(a7, v16, *(_QWORD *)(v15 + 184));
          return *(_QWORD *)(*(_QWORD *)(a1 + 208) + 184);
        }
      }
    }
  }
  result = 0;
  *a5 = 0;
  return result;
}

uint64_t coap_get_context_server_psk(uint64_t a1, int a2, int a3, void *__dst, unint64_t a5)
{
  uint64_t v5;
  const void *v6;
  size_t v7;

  v5 = *(_QWORD *)(a1 + 208);
  if (!v5)
    return 0;
  v6 = *(const void **)(v5 + 176);
  if (!v6)
    return 0;
  v7 = *(_QWORD *)(v5 + 184);
  if (v7 - 1 >= a5)
    return 0;
  memcpy(__dst, v6, v7);
  return *(_QWORD *)(v5 + 184);
}

uint64_t coap_get_context_server_hint(uint64_t a1, void *__dst, unint64_t a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 208);
  if (!v3 || !*(_QWORD *)(v3 + 160) || *(_QWORD *)(v3 + 168) - 1 >= a3)
    return 0;
  memcpy(__dst, *(const void **)(v3 + 160), *(_QWORD *)(v3 + 168));
  return *(_QWORD *)(v3 + 168);
}

uint64_t coap_option_check_critical(_WORD *a1, uint64_t a2, _WORD *a3)
{
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  unint64_t v8;
  BOOL v9;
  int v10;
  BOOL v11;
  _OWORD v13[2];
  uint64_t v14;

  v14 = 0;
  memset(v13, 0, sizeof(v13));
  coap_option_iterator_init(a2, (uint64_t)v13, 0);
  v5 = 1;
  while (coap_option_next((uint64_t)v13))
  {
    v6 = WORD4(v13[0]);
    if ((BYTE8(v13[0]) & 1) != 0)
    {
      HIDWORD(v8) = WORD4(v13[0]) - 1;
      LODWORD(v8) = HIDWORD(v8);
      v7 = v8 >> 1;
      v9 = v7 > 0x13;
      v10 = (1 << v7) & 0xA29AF;
      v11 = v9 || v10 == 0;
      if (v11 && !coap_option_filter_op(a1, WORD4(v13[0]), 2))
      {
        if (maxlog >= 7)
        {
          coap_log_impl(7, "unknown critical option %d\n", v6);
          v6 = WORD4(v13[0]);
        }
        coap_option_filter_op(a3, v6, 0);
        v5 = 0;
      }
    }
  }
  return v5;
}

uint64_t coap_send(unsigned __int8 *a1, uint64_t a2)
{
  unint64_t v4;
  unint64_t v5;
  _OWORD *v6;
  uint64_t v7;
  unsigned __int8 __buf;

  if (!coap_pdu_encode_header(a2, *a1))
    goto LABEL_16;
  v4 = coap_send_pdu(a1, (_BYTE *)a2, 0);
  if (v4 != -3)
  {
    v5 = v4;
    if ((v4 & 0x8000000000000000) == 0)
    {
      if (*a1 - 3 > 1)
      {
        if (!*(_BYTE *)a2)
        {
          v6 = coap_new_node();
          if (v6)
          {
            v7 = (uint64_t)v6;
            __buf = 0;
            *((_DWORD *)v6 + 8) = *(unsigned __int16 *)(a2 + 6);
            *((_QWORD *)v6 + 5) = a2;
            arc4random_buf(&__buf, 1uLL);
            *(_DWORD *)(v7 + 20) = coap_calc_timeout(a1, __buf);
            return coap_wait_ack(*((_QWORD *)a1 + 26), (uint64_t)a1, v7);
          }
          if (maxlog >= 7)
            coap_log_impl(7, "coap_wait_ack: insufficient memory\n");
          goto LABEL_16;
        }
      }
      else if (v4 < *(_QWORD *)(a2 + 24) + (unint64_t)*(unsigned __int8 *)(a2 + 3))
      {
        if (coap_session_delay_pdu(a1, a2, 0) == -3)
        {
          *((_QWORD *)a1 + 30) = v5;
          return *(unsigned __int16 *)(a2 + 6);
        }
LABEL_16:
        coap_delete_pdu((_QWORD *)a2);
        return 0xFFFFFFFFLL;
      }
      v5 = *(unsigned __int16 *)(a2 + 6);
    }
    coap_delete_pdu((_QWORD *)a2);
    return v5;
  }
  return *(unsigned __int16 *)(a2 + 6);
}

uint64_t coap_send_pdu(unsigned __int8 *a1, _BYTE *a2, uint64_t a3)
{
  int v6;
  int v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  unsigned int v12;
  int v13;
  int v14;
  int *v15;
  char *v16;
  int v17;
  char *v18;
  int *v19;
  int v20;
  _OWORD *v21;
  size_t v22;
  int *v23;
  char *v24;
  socklen_t v25;
  int *v26;
  char *v27;
  __int16 v28;
  int *v29;
  char *v30;
  int *v31;
  char *v32;
  int v33;
  _BYTE v34[28];
  int v35;
  int v36;
  int v37;

  v6 = a1[141];
  if (v6 == 2)
  {
    if ((*((_DWORD *)a1 + 36) & 0xF0) != 0xE0)
      goto LABEL_8;
  }
  else if (v6 != 30 || a1[148] != 255)
  {
    goto LABEL_8;
  }
  if (a2[1] > 0x5Fu)
    return -2;
LABEL_8:
  if (!a1[2])
  {
    v8 = *a1;
    if (v8 == 2)
    {
      if (*((_QWORD *)a1 + 27))
        return -1;
      *((_QWORD *)a1 + 27) = 0;
      v9 = *((_QWORD *)a1 + 26);
      v10 = 512;
LABEL_87:
      coap_handle_event(v9, v10, (uint64_t)a1);
      return -1;
    }
    if ((v8 - 3) > 1)
      return -1;
    if (v8 == 4)
      v12 = 5684;
    else
      v12 = 5683;
    v36 = 0;
    v37 = 1;
    memset(&v34[4], 0, 24);
    v35 = 0;
    *(_DWORD *)v34 = *((_DWORD *)a1 + 26);
    v13 = a1[109];
    if (v13 == 2)
    {
      *(_OWORD *)&v34[4] = *(_OWORD *)(a1 + 108);
    }
    else if (v13 == 30)
    {
      v34[5] = 30;
      *(_OWORD *)&v34[12] = *(_OWORD *)(a1 + 116);
      *(_WORD *)&v34[6] = *((_WORD *)a1 + 55);
      v35 = *((_DWORD *)a1 + 33);
    }
    else
    {
      __memcpy_chk();
    }
    *((_WORD *)a1 + 90) &= ~4u;
    v14 = socket(v13, 1, 0);
    *((_DWORD *)a1 + 44) = v14;
    if (v14 == -1)
    {
      if (maxlog <= 3)
      {
LABEL_86:
        *((_WORD *)a1 + 90) = 0;
        v9 = *((_QWORD *)a1 + 26);
        v10 = 4099;
        goto LABEL_87;
      }
      v18 = "coap_socket_connect_tcp1: socket: %s\n";
    }
    else
    {
      if (ioctl(v14, 0x8004667EuLL, &v37) == -1 && maxlog >= 4)
      {
        v15 = __error();
        v16 = strerror(*v15);
        coap_log_impl(4, "coap_socket_connect_tcp1: ioctl FIONBIO: %s\n", v16);
      }
      v17 = a1[109];
      if (v17 == 30)
      {
        if (!*(_WORD *)&v34[6])
          *(_WORD *)&v34[6] = bswap32(v12) >> 16;
        if (setsockopt(*((_DWORD *)a1 + 44), 41, 27, &v36, 4u) == -1 && maxlog >= 4)
        {
          v19 = __error();
          strerror(*v19);
          coap_log_impl(4, "coap_socket_connect_tcp1: setsockopt IPV6_V6ONLY: %s\n");
        }
      }
      else if (v17 == 2)
      {
        if (!*(_WORD *)&v34[6])
          *(_WORD *)&v34[6] = bswap32(v12) >> 16;
      }
      else if (maxlog >= 1)
      {
        coap_log_impl(1, "coap_socket_connect_tcp1: unsupported sa_family\n");
      }
      v20 = a1[21];
      if (!a1[21])
      {
        a1[141] = a1[109];
LABEL_64:
        if (connect(*((_DWORD *)a1 + 44), (const sockaddr *)&v34[4], *(socklen_t *)v34) != -1)
        {
          if (getsockname(*((_DWORD *)a1 + 44), (sockaddr *)(a1 + 140), (socklen_t *)a1 + 34) == -1 && maxlog >= 4)
          {
            v26 = __error();
            v27 = strerror(*v26);
            coap_log_impl(4, "coap_socket_connect_tcp1: getsockname: %s\n", v27);
          }
          v28 = 4;
          if (getpeername(*((_DWORD *)a1 + 44), (sockaddr *)(a1 + 108), (socklen_t *)a1 + 26) == -1 && maxlog >= 4)
          {
            v29 = __error();
            v30 = strerror(*v29);
            coap_log_impl(4, "coap_socket_connect_tcp1: getpeername: %s\n", v30);
          }
          goto LABEL_73;
        }
        if (*__error() == 36)
        {
          v28 = 132;
LABEL_73:
          *((_WORD *)a1 + 90) |= v28;
          *((_QWORD *)a1 + 36) = 0;
          *((_QWORD *)a1 + 37) = 0;
          *((_QWORD *)a1 + 38) = 0;
          *(_QWORD *)v34 = 0;
          *(_QWORD *)&v34[8] = 0;
          gettimeofday((timeval *)v34, 0);
          *((_QWORD *)a1 + 34) = 1000 * (*(_QWORD *)v34 - coap_clock_offset)
                               + ((unint64_t)((double)*(int *)&v34[8] * 1.024 + 512.0) >> 10);
          if ((*((_WORD *)a1 + 90) & 0x80) != 0)
          {
            a1[2] = 1;
            return coap_session_delay_pdu(a1, (uint64_t)a2, a3);
          }
          coap_handle_event(*((_QWORD *)a1 + 26), 4097, (uint64_t)a1);
          if (*a1 == 4)
          {
            a1[2] = 2;
            *((_QWORD *)a1 + 27) = 0;
            coap_handle_event(*((_QWORD *)a1 + 26), 512, (uint64_t)a1);
            coap_session_disconnected(a1, 3);
            return -1;
          }
          coap_session_send_csm(a1);
          goto LABEL_9;
        }
        if (maxlog <= 3)
          goto LABEL_84;
        v18 = "coap_socket_connect_tcp1: connect: %s\n";
        goto LABEL_83;
      }
      *(_QWORD *)(a1 + 140) = 0;
      v21 = a1 + 140;
      *((_DWORD *)a1 + 41) = 0;
      *(_QWORD *)(a1 + 148) = 0;
      *(_QWORD *)(a1 + 156) = 0;
      v22 = *((unsigned int *)a1 + 4);
      *((_DWORD *)a1 + 34) = v22;
      if (v20 == 2)
      {
        *v21 = *(_OWORD *)(a1 + 20);
      }
      else if (v20 == 30)
      {
        a1[141] = 30;
        *(_OWORD *)(a1 + 148) = *(_OWORD *)(a1 + 28);
        *((_WORD *)a1 + 71) = *((_WORD *)a1 + 11);
        *((_DWORD *)a1 + 41) = *((_DWORD *)a1 + 11);
      }
      else
      {
        memcpy(v21, a1 + 20, v22);
      }
      if (setsockopt(*((_DWORD *)a1 + 44), 0xFFFF, 4, &v37, 4u) == -1 && maxlog >= 4)
      {
        v23 = __error();
        v24 = strerror(*v23);
        coap_log_impl(4, "coap_socket_connect_tcp1: setsockopt SO_REUSEADDR: %s\n", v24);
      }
      if (a1[21] == 2)
        v25 = 16;
      else
        v25 = *((_DWORD *)a1 + 4);
      if (bind(*((_DWORD *)a1 + 44), (const sockaddr *)(a1 + 20), v25) != -1)
        goto LABEL_64;
      if (maxlog <= 3)
        goto LABEL_84;
      v18 = "coap_socket_connect_tcp1: bind: %s\n";
    }
LABEL_83:
    v31 = __error();
    v32 = strerror(*v31);
    coap_log_impl(4, v18, v32);
LABEL_84:
    v33 = *((_DWORD *)a1 + 44);
    if (v33 != -1)
    {
      *((_QWORD *)a1 + 23) = 0;
      *((_QWORD *)a1 + 24) = 0;
      close(v33);
      *((_DWORD *)a1 + 44) = -1;
    }
    goto LABEL_86;
  }
LABEL_9:
  if (*a2)
  {
    if (a1[2] == 4 && (~*((unsigned __int16 *)a1 + 90) & 0x21) != 0)
      return coap_session_send_pdu(a1, (uint64_t)a2);
    return coap_session_delay_pdu(a1, (uint64_t)a2, a3);
  }
  v11 = *((unsigned __int16 *)a1 + 90);
  if ((~v11 & 0x1001) != 0)
  {
    if (a1[2] == 4 && !a1[226] && (~v11 & 0x21) != 0)
    {
      if (*a1 - 1 <= 1)
        a1[226] = 1;
      return coap_session_send_pdu(a1, (uint64_t)a2);
    }
    return coap_session_delay_pdu(a1, (uint64_t)a2, a3);
  }
  if (maxlog >= 3)
    coap_log_impl(3, "Multicast requests cannot be Confirmable (RFC7252 8.1)\n");
  return -1;
}

unint64_t coap_calc_timeout(_WORD *a1, int a2)
{
  return (1000
        * (unint64_t)(((((((unsigned __int16)(((8589935
                                                     * (unint64_t)(((unsigned __int16)a1[181] << 6) + 500)) >> 33)
                                                   + (a1[180] << 6))
                                - 64)
                               * a2
                               + 128) >> 8)
                             + 64)
                            * (unsigned __int16)(((8589935
                                                               * (unint64_t)(((unsigned __int16)a1[179] << 6)
                                                                                  + 500)) >> 33)
                                                             + (a1[178] << 6))
                            + 32) >> 6)
        + 32) >> 6;
}

uint64_t coap_wait_ack(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v5;
  unint64_t v6;
  timeval v8;

  ++*(_DWORD *)(a2 + 4);
  *(_QWORD *)(a3 + 24) = a2;
  v8.tv_sec = 0;
  *(_QWORD *)&v8.tv_usec = 0;
  gettimeofday(&v8, 0);
  v5 = 1000 * (v8.tv_sec - coap_clock_offset) + ((unint64_t)((double)v8.tv_usec * 1.024 + 512.0) >> 10);
  if (*(_QWORD *)(a1 + 48))
  {
    v6 = v5 - *(_QWORD *)(a1 + 40) + (*(_DWORD *)(a3 + 20) << *(_BYTE *)(a3 + 16));
  }
  else
  {
    v6 = (*(_DWORD *)(a3 + 20) << *(_BYTE *)(a3 + 16));
    *(_QWORD *)(a1 + 40) = v5;
  }
  *(_QWORD *)(a3 + 8) = v6;
  coap_insert_node((_QWORD *)(a1 + 48), (_QWORD *)a3);
  if (maxlog >= 7)
  {
    coap_session_str(*(_QWORD *)(a3 + 24));
    coap_log_impl(7, "** %s: tid=%d: added to retransmit queue (%ums)\n", (const char *)&coap_session_str_szSession, *(_DWORD *)(a3 + 32), (unint64_t)((((125 * *(_QWORD *)(a3 + 8)) & 0x1FFFFFFFFFFFFFFFLL)* (unsigned __int128)0x20C49BA5E353F7CFuLL) >> 64) >> 4);
  }
  return *(unsigned int *)(a3 + 32);
}

void coap_handle_event(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void (*v6)(uint64_t, uint64_t, uint64_t);

  if (maxlog >= 7)
    coap_log_impl(7, "***EVENT: 0x%04x\n", a2);
  v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 104);
  if (v6)
    v6(a1, a2, a3);
}

uint64_t coap_session_send_pdu(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v2;
  int v5;
  unsigned __int8 *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  timeval v12;

  v2 = *(unsigned __int8 *)(a2 + 3);
  if (!*(_BYTE *)(a2 + 3))
    __assert_rtn("coap_session_send_pdu", "net.c", 685, "pdu->hdr_size > 0");
  v5 = *a1;
  if (v5 == 3)
  {
    v7 = coap_session_write((uint64_t)a1, (const void *)(*(_QWORD *)(a2 + 40) - v2), *(_QWORD *)(a2 + 24) + v2);
  }
  else if (v5 == 1)
  {
    if (*((_WORD *)a1 + 90))
    {
      v6 = a1 + 176;
    }
    else
    {
      v8 = *((_QWORD *)a1 + 25);
      if (!v8)
        __assert_rtn("coap_session_send", "coap_session.c", 221, "session->endpoint != NULL");
      v6 = (unsigned __int8 *)(v8 + 24);
    }
    v9 = *(_QWORD *)(a2 + 24) + v2;
    v7 = (*(uint64_t (**)(unsigned __int8 *, unsigned __int8 *, uint64_t, uint64_t))(*((_QWORD *)a1 + 26) + 112))(v6, a1, *(_QWORD *)(a2 + 40) - v2, v9);
    if (v7 == v9)
    {
      v12.tv_sec = 0;
      *(_QWORD *)&v12.tv_usec = 0;
      gettimeofday(&v12, 0);
      *((_QWORD *)a1 + 34) = 1000 * (v12.tv_sec - coap_clock_offset)
                           + ((unint64_t)((double)v12.tv_usec * 1.024 + 512.0) >> 10);
      if (maxlog <= 6)
      {
        v7 = v9;
        goto LABEL_17;
      }
      v10 = "*  %s: sent %zd bytes\n";
      goto LABEL_15;
    }
    if (maxlog >= 7)
    {
      v10 = "*  %s: failed to send %zd bytes\n";
LABEL_15:
      coap_session_str((uint64_t)a1);
      coap_log_impl(7, v10, &coap_session_str_szSession, v9);
    }
  }
  else
  {
    v7 = -1;
  }
LABEL_17:
  coap_show_pdu((unsigned __int8 *)a2);
  return v7;
}

unsigned __int8 *coap_new_error_response(unsigned __int8 *a1, int a2, uint64_t *a3)
{
  unsigned __int8 v4;
  uint64_t v6;
  unint64_t v7;
  unsigned __int8 v8;
  char *v9;
  char v10;
  const char *v11;
  char v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  __int16 i;
  unsigned __int8 *v18;
  unsigned __int8 *v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  unsigned __int8 v24;
  unsigned __int8 *v25;
  unsigned __int8 *v26;
  unsigned __int8 *v27;
  unsigned __int8 *v28;
  unsigned int v29;
  size_t v30;
  _BYTE *v31;
  size_t v32;
  size_t v33;
  void *v34;
  _OWORD v36[2];
  uint64_t v37;

  v4 = a2;
  v6 = 0;
  v7 = a1[4];
  v8 = 65;
  v9 = &byte_1E894E558;
  while (a2 != v8)
  {
    ++v6;
    v10 = *v9;
    v9 += 16;
    v8 = v10;
    if (v6 == 23)
    {
      v11 = 0;
      v12 = 1;
      goto LABEL_6;
    }
  }
  v11 = (const char *)coap_error[2 * v6 + 1];
  v12 = 0;
  v7 += strlen(v11) + 1;
LABEL_6:
  v37 = 0;
  memset(v36, 0, sizeof(v36));
  v13 = *a1;
  v14 = *(unsigned __int16 *)a3;
  v15 = 4;
  v16 = 6;
  while ((v15 & v14) == 0 || *((_BYTE *)a3 + v16) != 12)
  {
    v15 = (2 * v15) & 0x1FFF8;
    if (++v16 == 12)
      goto LABEL_12;
  }
  *(_WORD *)a3 = v14 & ~(_WORD)v15;
LABEL_12:
  coap_option_iterator_init((uint64_t)a1, (uint64_t)v36, a3);
  for (i = 0; ; i = WORD4(v36[0]))
  {
    v18 = coap_option_next((uint64_t)v36);
    if (!v18)
      break;
    v19 = v18;
    v20 = (unsigned __int16)(WORD4(v36[0]) - i);
    if (v20 < 0x10D)
      v21 = 2;
    else
      v21 = 3;
    if (v20 < 0xD)
      v22 = 1;
    else
      v22 = v21;
    v7 += v22 + coap_opt_length(v18);
    v23 = *v19 & 0xF;
    if (v23 != 13)
    {
      if (v23 != 14)
        continue;
      ++v7;
    }
    ++v7;
  }
  if (v13)
    v24 = 1;
  else
    v24 = 2;
  v25 = coap_pdu_init(v24, v4, *((_WORD *)a1 + 3), v7);
  v26 = v25;
  if (v25)
  {
    if (coap_add_token((uint64_t)v25, a1[4], *((const void **)a1 + 5)))
    {
      coap_option_iterator_init((uint64_t)a1, (uint64_t)v36, a3);
      while (1)
      {
        v27 = coap_option_next((uint64_t)v36);
        if (!v27)
          break;
        v28 = v27;
        v29 = WORD4(v36[0]);
        v30 = coap_opt_length(v27);
        v31 = coap_opt_value(v28);
        coap_add_option((uint64_t)v26, v29, v30, v31);
      }
      if ((v12 & 1) == 0)
      {
        v32 = strlen(v11);
        if (v32)
        {
          v33 = v32;
          v34 = (void *)coap_add_data_after(v26, v32);
          if (v34)
            memcpy(v34, v11, v33);
        }
      }
    }
    else
    {
      if (maxlog >= 7)
        coap_log_impl(7, "cannot add token to error response\n", *(_QWORD *)&v36[0]);
      coap_delete_pdu(v26);
      return 0;
    }
  }
  return v26;
}

unsigned __int8 *coap_send_message_type(unsigned __int8 *result, uint64_t a2)
{
  unsigned __int8 *v2;

  if (a2)
  {
    v2 = result;
    result = coap_pdu_init(3u, 0, *(_WORD *)(a2 + 6), 0);
    if (result)
      return (unsigned __int8 *)coap_send(v2, (uint64_t)result);
  }
  return result;
}

void coap_handle_dgram_for_proto(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  size_t v6;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  int v9;
  unint64_t v10;
  unint64_t v11;

  if (*a2 == 1)
  {
    v6 = *(_QWORD *)(a3 + 72);
    v7 = coap_pdu_init(0, 0, 0, v6 - 4);
    if (v7)
    {
      if (v6
        && (v8 = (unsigned __int8 *)(a3 + 80), v9 = *a2, v10 = coap_pdu_parse_header_size(v9, v8), v10 - 1 < v6)
        && (v11 = v10, v10 <= v7[2])
        && coap_pdu_resize((uint64_t)v7, v6 - v10)
        && (memcpy((void *)(*((_QWORD *)v7 + 5) - v11), v8, v6),
            v7[3] = v11,
            *((_QWORD *)v7 + 3) = v6 - v11,
            coap_pdu_parse_header((uint64_t)v7, v9))
        && coap_pdu_parse_opt((uint64_t)v7))
      {
        coap_dispatch(a1, a2, (uint64_t)v7);
      }
      else if (maxlog >= 4)
      {
        coap_log_impl(4, "discard malformed PDU\n");
      }
    }
    coap_delete_pdu(v7);
  }
}

void coap_read_session()
{
  uint64_t v0;
  unsigned __int8 *v1;
  uint64_t v2;
  unsigned __int8 *v3;
  int *v4;
  int v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  unsigned __int8 *v12;
  uint64_t *v13;
  unsigned __int8 *v14;
  ssize_t v15;
  ssize_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  size_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  size_t v28;
  unint64_t v29;
  size_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unsigned int v34;
  unint64_t v35;
  unint64_t v36;
  unsigned __int8 *v37;
  unsigned __int8 *v38;
  int v39;
  int *v40;
  char *v41;
  int *v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _OWORD v50[256];
  uint64_t v51;

  v0 = MEMORY[0x1E0C80A78]();
  v43 = v2;
  v44 = v0;
  v51 = *MEMORY[0x1E0C80C00];
  if ((*((_WORD *)v1 + 90) & 0x1004) == 0)
    __assert_rtn("coap_read_session", "net.c", 1218, "session->sock.flags & (COAP_SOCKET_CONNECTED | COAP_SOCKET_MULTICAST)");
  v3 = v1;
  v4 = (int *)(v1 + 176);
  v49 = 0u;
  memset(v50, 0, 432);
  v47 = 0u;
  v48 = 0u;
  v5 = *v1;
  v45 = 0u;
  v46 = 0u;
  if ((v5 - 1) <= 1)
  {
    v6 = *(_OWORD *)(v1 + 120);
    v45 = *(_OWORD *)(v1 + 104);
    v46 = v6;
    v7 = *(_OWORD *)(v1 + 152);
    v47 = *(_OWORD *)(v1 + 136);
    v48 = v7;
    v8 = (*(uint64_t (**)(int *, __int128 *))(v0 + 120))(v4, &v45);
    v9 = v8;
    if (v8 < 0)
    {
      if (v8 == -2)
      {
        v38 = v3;
        v39 = 4;
LABEL_91:
        coap_session_disconnected(v38, v39);
      }
      else if (maxlog >= 4)
      {
        coap_session_str((uint64_t)v3);
        coap_log_impl(4, "*  %s: read error\n", (const char *)&coap_session_str_szSession);
      }
    }
    else if (v8)
    {
      *((_QWORD *)v3 + 34) = v43;
      v10 = v46;
      *(_OWORD *)(v3 + 104) = v45;
      *(_OWORD *)(v3 + 120) = v10;
      v11 = v48;
      *(_OWORD *)(v3 + 136) = v47;
      *(_OWORD *)(v3 + 152) = v11;
      if (maxlog >= 7)
      {
        coap_session_str((uint64_t)v3);
        coap_log_impl(7, "*  %s: received %zd bytes\n", (const char *)&coap_session_str_szSession, v9);
      }
      coap_handle_dgram_for_proto(v44, v3, (uint64_t)&v45);
    }
    return;
  }
  v12 = (unsigned __int8 *)v50;
  v13 = (uint64_t *)(v1 + 256);
  v14 = v1 + 248;
  v42 = (int *)(v1 + 176);
LABEL_9:
  if (v5 != 3)
  {
    if (v5 != 4)
      return;
    goto LABEL_90;
  }
  v15 = recv(*v4, v50, 0x1000uLL, 0);
  if (v15 != -1)
  {
    v16 = v15;
    if (!v15)
    {
      *((_WORD *)v3 + 90) &= ~0x100u;
      goto LABEL_90;
    }
    if (v15 <= 4095)
    {
      *((_WORD *)v3 + 90) &= ~0x100u;
      if (v15 < 1)
      {
        v17 = v15;
LABEL_89:
        if ((v17 & 0x8000000000000000) == 0)
          return;
LABEL_90:
        v38 = v3;
        v39 = 1;
        goto LABEL_91;
      }
    }
    if (maxlog >= 7)
    {
      coap_session_str((uint64_t)v3);
      coap_log_impl(7, "*  %s: received %zd bytes\n", (const char *)&coap_session_str_szSession, v16);
    }
    *((_QWORD *)v3 + 34) = v43;
    v17 = v16;
    while (1)
    {
      v18 = *((_QWORD *)v3 + 33);
      if (v18)
      {
        v19 = *(unsigned __int8 *)(v18 + 3);
        v20 = *(_QWORD *)(v18 + 24) + v19 - *v13;
        if (v20 >= v17)
          v21 = v17;
        else
          v21 = *(_QWORD *)(v18 + 24) + v19 - *v13;
        memcpy((void *)(*(_QWORD *)(v18 + 40) - v19 + *v13), v12, v21);
        if (v20 <= v17)
        {
          if (coap_pdu_parse_header(*((_QWORD *)v3 + 33), *v3)
            && coap_pdu_parse_opt(*((_QWORD *)v3 + 33)))
          {
            coap_dispatch(v44, v3, *((_QWORD *)v3 + 33));
          }
          coap_delete_pdu(*((_QWORD **)v3 + 33));
          v22 = 0;
          *((_QWORD *)v3 + 33) = 0;
        }
        else
        {
          v22 = *v13 + v21;
        }
        v17 -= v21;
        v12 += v21;
      }
      else
      {
        v23 = *v13;
        if (*v13)
        {
          v24 = *v3;
          if ((v24 - 3) > 1)
          {
            v28 = 4 * ((v24 - 1) < 2);
          }
          else
          {
            v25 = *v14;
            v26 = 6;
            if (v25 >> 4 == 14)
              v26 = 4;
            v27 = 3;
            if (v25 >> 4 != 13)
              v27 = v26;
            if (v25 >= 0xD0)
              v28 = v27;
            else
              v28 = 2;
          }
          v29 = v28 - v23;
          if (v28 - v23 >= v17)
            v30 = v17;
          else
            v30 = v28 - v23;
          memcpy(&v14[v23], v12, v30);
          v31 = v17 - v30;
          v12 += v30;
          if (v29 > v17)
          {
            *v13 += v31;
LABEL_71:
            v17 = v31;
            goto LABEL_72;
          }
          if (*v3 - 3 >= 2)
            __assert_rtn("coap_pdu_parse_size", "pdu.c", 432, "proto == COAP_PROTO_TCP || proto == COAP_PROTO_TLS");
          v32 = *v14;
          if (v32 <= 0xCF)
          {
            if (v28 < 2)
              goto LABEL_94;
            v33 = v32 >> 4;
            goto LABEL_63;
          }
          v34 = v32 >> 4;
          v35 = 6;
          if (v32 >> 4 == 14)
            v35 = 4;
          if (v34 == 13)
            v35 = 3;
          if (v35 > v28)
LABEL_94:
            __assert_rtn("coap_pdu_parse_size", "pdu.c", 433, "coap_pdu_parse_header_size(proto, data) <= length");
          if (v34 == 13)
          {
            v33 = v3[249] + 13;
LABEL_63:
            v36 = v33 + (v32 & 0xF);
            v37 = coap_pdu_init(0, 0, 0, v36);
            *((_QWORD *)v3 + 33) = v37;
            if (!v37)
              goto LABEL_90;
            if (*((_QWORD *)v37 + 2) < v36)
            {
              if (!coap_pdu_resize((uint64_t)v37, v36))
                goto LABEL_90;
              v37 = (unsigned __int8 *)*((_QWORD *)v3 + 33);
            }
            v37[3] = v28;
            *((_QWORD *)v37 + 3) = v36;
            memcpy((void *)(*((_QWORD *)v37 + 5) - v28), v3 + 248, v28);
            *v13 = v28;
            if (!v36)
            {
              if (coap_pdu_parse_header(*((_QWORD *)v3 + 33), *v3))
                coap_dispatch(v44, v3, *((_QWORD *)v3 + 33));
              coap_delete_pdu(*((_QWORD **)v3 + 33));
              *v13 = 0;
              *((_QWORD *)v3 + 33) = 0;
            }
            goto LABEL_71;
          }
          if (v28 >= 3)
          {
            if (v34 == 14)
            {
              v33 = __rev16(*(unsigned __int16 *)(v3 + 249)) + 269;
              goto LABEL_63;
            }
            if (v28 >= 5)
            {
              v33 = bswap32(*(_DWORD *)(v3 + 249)) + 65805;
              goto LABEL_63;
            }
          }
          v33 = 0;
          goto LABEL_63;
        }
        v3[248] = *v12;
        if (*v3 - 1 > 3)
          goto LABEL_90;
        --v17;
        ++v12;
        v22 = 1;
      }
      *v13 = v22;
LABEL_72:
      if ((uint64_t)v17 <= 0)
      {
        if (v16 != 4096 || v17)
          goto LABEL_89;
        v5 = *v3;
        v12 = (unsigned __int8 *)v50;
        v4 = v42;
        goto LABEL_9;
      }
    }
  }
  *((_WORD *)v3 + 90) &= ~0x100u;
  if (*__error() != 35 && *__error() != 4)
  {
    if (*__error() != 54 && maxlog >= 4)
    {
      v40 = __error();
      v41 = strerror(*v40);
      coap_log_impl(4, "coap_socket_read: recv: %s\n", v41);
    }
    goto LABEL_90;
  }
}

void coap_write_session(uint64_t a1, uint64_t a2)
{
  uint64_t i;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if ((*(_WORD *)(a1 + 180) & 4) == 0)
    __assert_rtn("coap_write_session", "net.c", 1164, "session->sock.flags & COAP_SOCKET_CONNECTED");
  for (i = *(_QWORD *)(a1 + 232); i; i = *(_QWORD *)(a1 + 232))
  {
    if (maxlog >= 7)
    {
      coap_session_str(a1);
      coap_log_impl(7, "** %s: tid=%d: transmitted after delay\n", (const char *)&coap_session_str_szSession, *(unsigned __int16 *)(*(_QWORD *)(i + 40) + 6));
    }
    v5 = *(_QWORD *)(a1 + 240);
    v6 = *(_QWORD *)(i + 40);
    v7 = *(unsigned __int8 *)(v6 + 3);
    v8 = *(_QWORD *)(v6 + 24) + v7;
    if (v8 <= v5)
      __assert_rtn("coap_write_session", "net.c", 1171, "session->partial_write < q->pdu->used_size + q->pdu->hdr_size");
    if (*(_BYTE *)a1 != 3)
      break;
    v9 = coap_session_write(a1, (const void *)(*(_QWORD *)(v6 + 40) - v7 - v5), v8 - v5);
    if (v9 < 1)
      break;
    *(_QWORD *)(a1 + 272) = a2;
    v10 = *(_QWORD *)(a1 + 240);
    if (v9 < *(_QWORD *)(*(_QWORD *)(i + 40) + 24)
            + (unint64_t)*(unsigned __int8 *)(*(_QWORD *)(i + 40) + 3)
            - v10)
    {
      *(_QWORD *)(a1 + 240) = v10 + v9;
      return;
    }
    *(_QWORD *)(a1 + 232) = *(_QWORD *)i;
    *(_QWORD *)(a1 + 240) = 0;
    coap_delete_node((_QWORD **)i);
  }
}

void coap_dispatch(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t i;
  unsigned __int8 *v12;
  unsigned __int8 *v13;
  unsigned int v14;
  _BYTE *v15;
  uint64_t v16;
  int v17;
  int v18;
  unsigned int v19;
  BOOL v20;
  BOOL v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  size_t *v25;
  _BYTE *v26;
  int v27;
  unsigned __int8 *v28;
  unsigned __int8 *v29;
  unsigned int v30;
  _BYTE *v31;
  uint64_t v32;
  int v33;
  BOOL v34;
  BOOL v35;
  size_t *v36;
  size_t v37;
  size_t v38;
  _BYTE *resource_from_uri_path;
  _BYTE *v40;
  uint64_t v41;
  unsigned __int8 *v42;
  unsigned __int8 *v43;
  void (*v44)(uint64_t, unsigned __int8 *, uint64_t, _QWORD);
  int v45;
  BOOL v46;
  uint64_t v47;
  uint64_t v48;
  unsigned __int8 *v49;
  int v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void (*v56)(uint64_t, _QWORD);
  uint64_t v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t *v60;
  void (*v61)(uint64_t, unsigned __int8 *, uint64_t, _QWORD);
  unsigned __int8 *v62;
  unsigned __int8 *v63;
  _BYTE *v64;
  unsigned int v65;
  unsigned int v66;
  uint64_t v67;
  int v68;
  unsigned __int8 *v69;
  void (*v70)(uint64_t, unsigned __int8 *, uint64_t, _QWORD);
  void (*v71)(uint64_t, unsigned __int8 *, uint64_t, _QWORD);
  unsigned __int8 *v72;
  void (*v73)(uint64_t, unsigned __int8 *, uint64_t, uint64_t, _QWORD);
  uint64_t v74;
  _QWORD *v75;
  uint64_t v76;
  unsigned __int8 *v77;
  unint64_t v78;
  void (*v79)(uint64_t, uint64_t, unsigned __int8 *, unsigned __int8 *, uint64_t *, unsigned __int8 *, unsigned __int8 *);
  unint64_t j;
  unsigned __int8 *v81;
  unsigned __int8 *v82;
  unsigned int v83;
  _BYTE *v84;
  uint64_t v85;
  int v86;
  int v87;
  unsigned int v88;
  unsigned int v89;
  _BOOL4 v90;
  uint64_t v91;
  int v93;
  int v95;
  int v96;
  uint64_t *v97;
  uint64_t v98;
  uint64_t v99;
  BOOL v100;
  unsigned __int8 *v101;
  _QWORD *v102;
  uint64_t v103;
  unsigned __int8 *v104;
  _BYTE *v105;
  unsigned __int8 *v106;
  unsigned __int8 *v107;
  unsigned int v108;
  _BYTE *v109;
  uint64_t v110;
  int v111;
  BOOL v112;
  BOOL v113;
  unsigned __int8 *v114;
  int v115;
  __int16 v116;
  unint64_t v117;
  unsigned __int8 v118;
  unsigned __int8 *v119;
  uint64_t v120;
  unsigned __int8 *v121;
  uint64_t v122;
  unsigned __int8 *v123;
  _BYTE *v124;
  int v125;
  uint64_t k;
  uint64_t v127;
  char v128;
  int v129;
  int v130;
  int v131;
  uint64_t v132;
  void (*v133)(uint64_t, uint64_t, unsigned __int8 *, unsigned __int8 *, uint64_t *, unsigned __int8 *, unsigned __int8 *);
  unsigned __int8 *v134;
  size_t *v135;
  unsigned __int8 *v136;
  uint64_t v137;
  uint64_t v138;
  __int128 v139;
  __int128 v140;
  uint64_t v141;
  uint64_t v142;
  int v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  int v147;
  uint64_t v148;

  v148 = *MEMORY[0x1E0C80C00];
  v137 = 0;
  if (maxlog >= 7)
    coap_show_pdu((unsigned __int8 *)a3);
  v143 = 0;
  v142 = 0;
  switch(*(_BYTE *)a3)
  {
    case 0:
      if (coap_option_check_critical((_WORD *)a1, a3, &v142))
        goto LABEL_5;
      v43 = coap_new_error_response((unsigned __int8 *)a3, 130, &v142);
      if (!v43)
      {
        if (maxlog >= 4)
          coap_log_impl(4, "coap_dispatch: cannot create error response\n");
        goto LABEL_142;
      }
      v6 = 0;
      if (coap_send(a2, (uint64_t)v43) == -1 && maxlog >= 4)
      {
        coap_log_impl(4, "coap_dispatch: error sending response\n");
        goto LABEL_142;
      }
      goto LABEL_285;
    case 1:
      v6 = 0;
      if (coap_option_check_critical((_WORD *)a1, a3, &v142))
        goto LABEL_15;
      goto LABEL_285;
    case 2:
      coap_remove_from_queue((_QWORD **)(a1 + 48), (uint64_t)a2, *(unsigned __int16 *)(a3 + 6), &v137);
      if (a2[226])
      {
        --a2[226];
        if (a2[2] == 4)
          coap_session_connected(a2);
      }
      v6 = v137;
      if (*(_BYTE *)(a3 + 1))
      {
        if (v137)
        {
          v7 = *(_QWORD *)(v137 + 40);
          if ((*(_BYTE *)(v7 + 1) & 0xE0) == 0x40)
          {
            v139 = 0uLL;
            v8 = *(unsigned __int8 *)(v7 + 4);
            v9 = *(_QWORD *)(v7 + 40);
            *(_QWORD *)&v139 = v8;
            *((_QWORD *)&v139 + 1) = v9;
            coap_touch_observer(*(_QWORD **)(a1 + 16), *(_QWORD *)(v137 + 24), (uint64_t)&v139);
          }
        }
        goto LABEL_15;
      }
      goto LABEL_285;
    case 3:
      if (*((_DWORD *)a2 + 57) == *(unsigned __int16 *)(a3 + 6) && *(_DWORD *)(a1 + 204) && *((_QWORD *)a2 + 36))
      {
        v22 = 0;
      }
      else
      {
        v22 = 1;
        if (maxlog >= 1)
          coap_log_impl(1, "got RST for message %d\n", *(unsigned __int16 *)(a3 + 6));
      }
      if (a2[226])
      {
        --a2[226];
        if (a2[2] == 4)
          coap_session_connected(a2);
      }
      coap_remove_from_queue((_QWORD **)(a1 + 48), (uint64_t)a2, *(unsigned __int16 *)(a3 + 6), &v137);
      v6 = v137;
      if (v137)
      {
        v51 = *(_QWORD *)(v137 + 40);
        v52 = *(unsigned __int8 *)(v51 + 4);
        v53 = *(_QWORD *)(v51 + 40);
        *(_QWORD *)&v139 = v52;
        *((_QWORD *)&v139 + 1) = v53;
        v54 = *(_QWORD *)(a1 + 16);
        if (v54)
        {
          do
          {
            v55 = *(_QWORD *)(v54 + 80);
            coap_cancel_all_messages(a1, *(_QWORD *)(v6 + 24), *((void **)&v139 + 1), v139);
            coap_delete_observer(v54, *(_QWORD *)(v6 + 24), (uint64_t)&v139);
            v54 = v55;
          }
          while (v55);
        }
        if (v22)
        {
          if (!**(_BYTE **)(v6 + 40))
          {
            v56 = *(void (**)(uint64_t, _QWORD))(a1 + 80);
            if (v56)
              v56(a1, *(_QWORD *)(v6 + 24));
          }
        }
        else
        {
          v61 = *(void (**)(uint64_t, unsigned __int8 *, uint64_t, _QWORD))(a1 + 96);
          if (v61)
            v61(a1, a2, a3, *(unsigned __int16 *)(a3 + 6));
          *((_QWORD *)a2 + 37) = *((_QWORD *)a2 + 34);
          *((_DWORD *)a2 + 57) = -1;
        }
      }
      else
      {
        v57 = *(_QWORD *)(a1 + 16);
        if (v57)
        {
          while (1)
          {
            v58 = *(_QWORD *)(v57 + 80);
            v59 = *(uint64_t **)(v57 + 128);
            if (v59)
              break;
LABEL_116:
            v6 = 0;
            v57 = *(_QWORD *)(v57 + 80);
            if (!v58)
              goto LABEL_285;
          }
          while (1)
          {
            v60 = (uint64_t *)*v59;
            if (*((unsigned __int16 *)v59 + 9) == *(unsigned __int16 *)(a3 + 6) && (unsigned __int8 *)v59[1] == a2)
              break;
            v59 = (uint64_t *)*v59;
            if (!v60)
              goto LABEL_116;
          }
          *(_QWORD *)&v139 = v59[4];
          *((_QWORD *)&v139 + 1) = v59 + 5;
          coap_delete_observer(v57, (uint64_t)a2, (uint64_t)&v139);
        }
LABEL_142:
        v6 = 0;
      }
      goto LABEL_285;
    default:
LABEL_5:
      v6 = 0;
LABEL_15:
      v10 = *(unsigned __int8 *)(a3 + 1);
      if (v10 >= 0xE0)
      {
        v141 = 0;
        v139 = 0u;
        v140 = 0u;
        coap_option_iterator_init(a3, (uint64_t)&v139, 0);
        switch(*(_BYTE *)(a3 + 1))
        {
          case 0xE1:
            goto LABEL_121;
          case 0xE2:
            v69 = coap_pdu_init(0, 0xE3u, 0, 1uLL);
            v70 = *(void (**)(uint64_t, unsigned __int8 *, uint64_t, _QWORD))(a1 + 88);
            if (v70)
              v70(a1, a2, a3, *(unsigned __int16 *)(a3 + 6));
            if (v69)
            {
              coap_add_option((uint64_t)v69, 2u, 0, 0);
              coap_send(a2, (uint64_t)v69);
            }
            goto LABEL_285;
          case 0xE3:
            *((_QWORD *)a2 + 37) = *((_QWORD *)a2 + 34);
            v71 = *(void (**)(uint64_t, unsigned __int8 *, uint64_t, _QWORD))(a1 + 96);
            if (v71)
              v71(a1, a2, a3, *(unsigned __int16 *)(a3 + 6));
            goto LABEL_285;
          case 0xE4:
          case 0xE5:
            coap_session_disconnected(a2, 2);
            goto LABEL_285;
          default:
            goto LABEL_285;
        }
        while (1)
        {
          do
          {
LABEL_121:
            v62 = coap_option_next((uint64_t)&v139);
            if (!v62)
            {
              if (a2[2] == 3)
                coap_session_connected(a2);
              goto LABEL_285;
            }
          }
          while (WORD4(v139) != 2);
          v63 = v62;
          v64 = coap_opt_value(v62);
          v65 = coap_opt_length(v63);
          v66 = 0;
          if (!v65)
            break;
          v67 = v65;
          do
          {
            v68 = *v64++;
            v66 = v68 | (v66 << 8);
            --v67;
          }
          while (v67);
          *((_DWORD *)a2 + 3) = v66;
          if (*((_DWORD *)a2 + 2) >= v66)
          {
LABEL_129:
            *((_DWORD *)a2 + 2) = v66;
            if (maxlog >= 3)
              coap_log_impl(3, "DTLS overhead exceeds MTU\n");
          }
        }
        *((_DWORD *)a2 + 3) = 0;
        goto LABEL_129;
      }
      if (v10 - 1 > 0x1E)
      {
        if (v10 < 0x40)
        {
          if (!*(_BYTE *)(a3 + 1))
          {
            v44 = *(void (**)(uint64_t, unsigned __int8 *, uint64_t, _QWORD))(a1 + 88);
            if (v44)
              v44(a1, a2, a3, *(unsigned __int16 *)(a3 + 6));
          }
          if (maxlog >= 7)
            coap_log_impl(7, "dropped message with invalid code (%d.%02d)\n", *(unsigned __int8 *)(a3 + 1) >> 5, *(_BYTE *)(a3 + 1) & 0x1F);
          v45 = a2[141];
          if (v45 == 2)
          {
            if ((*((_DWORD *)a2 + 36) & 0xF0) == 0xE0)
              goto LABEL_285;
          }
          else if (v45 == 30 && a2[148] == 255)
          {
            goto LABEL_285;
          }
          if (*(_BYTE *)(a3 + 1))
          {
            coap_send_message_type(a2, a3);
          }
          else if (*a2 - 3 >= 2)
          {
            *(_QWORD *)&v139 = 0;
            coap_ticks(&v139);
            v74 = v139;
            if (*((_QWORD *)a2 + 35) + 250 < (unint64_t)v139)
            {
              coap_send_message_type(a2, a3);
              *((_QWORD *)a2 + 35) = v74;
            }
          }
        }
        else
        {
          if (v6)
            v23 = *(_QWORD *)(v6 + 40);
          else
            v23 = 0;
          if (!*(_BYTE *)a3 && *a2 - 1 <= 1)
          {
            v72 = coap_pdu_init(2u, 0, *(_WORD *)(a3 + 6), 0);
            if (v72)
              coap_send(a2, (uint64_t)v72);
          }
          coap_cancel_all_messages(a1, (uint64_t)a2, *(void **)(a3 + 40), *(unsigned __int8 *)(a3 + 4));
          v73 = *(void (**)(uint64_t, unsigned __int8 *, uint64_t, uint64_t, _QWORD))(a1 + 72);
          if (v73)
            v73(a1, a2, v23, a3, *(unsigned __int16 *)(a3 + 6));
        }
      }
      else
      {
        v147 = 0;
        v146 = 0;
        v141 = 0;
        v139 = 0u;
        v140 = 0u;
        LODWORD(v145) = 0;
        v144 = 0;
        coap_option_filter_op(&v144, 0xBu, 0);
        coap_option_iterator_init(a3, (uint64_t)&v139, &v144);
        for (i = 0; ; ++i)
        {
          v12 = coap_option_next((uint64_t)&v139);
          if (!v12)
            break;
          v13 = v12;
          v14 = coap_opt_length(v12);
          v15 = coap_opt_value(v13);
          if (v14)
          {
            v16 = v14;
            do
            {
              v18 = *v15++;
              v17 = v18;
              v19 = (v18 & 0xFFFFFFDF) - 65;
              v20 = (v18 - 48) >= 0xA && v19 >= 0x1A;
              if (v20
                && ((v17 - 33) <= 0x3E
                  ? (v21 = ((1 << (v17 - 33)) & 0x4000000096003FC9) == 0)
                  : (v21 = 1),
                    v21 && v17 != 126))
              {
                if (v17 == 38)
                  ++i;
                else
                  i += 3;
              }
              else
              {
                ++i;
              }
              --v16;
            }
            while (v16);
          }
        }
        if (i)
          v24 = i - 1;
        else
          v24 = 0;
        v25 = coap_new_string(v24);
        if (v25)
        {
          v134 = a2;
          v135 = v25;
          *v25 = v24;
          v26 = (_BYTE *)v25[1];
          v136 = (unsigned __int8 *)a3;
          coap_option_iterator_init(a3, (uint64_t)&v139, &v144);
          v27 = 0;
          while (1)
          {
            v28 = coap_option_next((uint64_t)&v139);
            if (!v28)
              break;
            v29 = v28;
            if (v27)
              *v26++ = 47;
            ++v27;
            v30 = coap_opt_length(v28);
            v31 = coap_opt_value(v29);
            if (v30)
            {
              v32 = v30;
              do
              {
                v33 = *v31;
                v34 = (v33 - 48) >= 0xA && (v33 & 0xFFFFFFDF) - 65 >= 0x1A;
                if (v34
                  && ((v33 - 33) <= 0x3E
                    ? (v35 = ((1 << (v33 - 33)) & 0x4000000096003FE9) == 0)
                    : (v35 = 1),
                      v35 && v33 != 126))
                {
                  *v26 = 37;
                  v26[1] = a0123456789abcd_0[(unint64_t)*v31 >> 4];
                  v26[2] = a0123456789abcd_0[*v31 & 0xF];
                  v26 += 3;
                }
                else
                {
                  *v26++ = v33;
                }
                ++v31;
                --v32;
              }
              while (v32);
            }
          }
          v36 = v135;
          v37 = *v135;
          v38 = v135[1];
          resource_from_uri_path = (_BYTE *)coap_get_resource_from_uri_path(a1, *v135, (unsigned __int8 *)v38);
          v40 = resource_from_uri_path;
          if (resource_from_uri_path && (*resource_from_uri_path & 0x10) == 0)
          {
            v41 = (uint64_t)resource_from_uri_path;
            v42 = v134;
            goto LABEL_171;
          }
          v42 = v134;
          if (v37 == 16
            && (*(_QWORD *)v38 == 0x6E6B2D6C6C65772ELL
              ? (v46 = *(_QWORD *)(v38 + 8) == 0x65726F632F6E776FLL)
              : (v46 = 0),
                v46))
          {
            v48 = (uint64_t)v136;
            if (v136[1] == 1)
            {
              if (maxlog >= 6)
                coap_log_impl(6, "create default response for %s\n", ".well-known/core");
              v75 = (_QWORD *)coap_wellknown_response(a1, v134, v136);
              goto LABEL_167;
            }
            if (maxlog >= 7)
              coap_log_impl(7, "method not allowed for .well-known/core\n");
            v49 = v136;
            v50 = 133;
          }
          else
          {
            v41 = *(_QWORD *)(a1 + 24);
            v47 = v136[1];
            if (v41 && (unint64_t)(v47 - 1) <= 6 && *(_QWORD *)(v41 + 8 * (v47 - 1) + 8))
              goto LABEL_171;
            if ((_DWORD)v47 == 4)
            {
              if (maxlog >= 7)
                coap_log_impl(7, "request for unknown resource '%*.*s', return 2.02\n", v37, v37, (const char *)v38);
              v48 = (uint64_t)v136;
              v49 = v136;
              v50 = 66;
            }
            else
            {
              if (maxlog >= 7)
                coap_log_impl(7, "request for unknown resource '%*.*s', return 4.04\n", v37, v37, (const char *)v38);
              v48 = (uint64_t)v136;
              v49 = v136;
              v50 = 132;
            }
          }
          v75 = coap_new_error_response(v49, v50, &v146);
LABEL_167:
          v76 = (uint64_t)v75;
          if (!v40)
          {
            if (!v75)
            {
LABEL_284:
              free(v36);
              goto LABEL_285;
            }
            if (no_response(v48, (uint64_t)v75) != 1)
            {
              if (coap_send(v134, v76) == -1 && maxlog >= 4)
                coap_log_impl(4, "cannot send response for transaction %u\n");
              goto LABEL_284;
            }
            v102 = (_QWORD *)v76;
LABEL_271:
            coap_delete_pdu(v102);
            goto LABEL_284;
          }
          if (v75)
            coap_delete_pdu(v75);
          v41 = (uint64_t)v40;
LABEL_171:
          v77 = v136;
          v78 = v136[1] - 1;
          if (v78 > 6
            || (v79 = *(void (**)(uint64_t, uint64_t, unsigned __int8 *, unsigned __int8 *, uint64_t *, unsigned __int8 *, unsigned __int8 *))(v41 + 8 * v78 + 8)) == 0)
          {
            if (*v135 == 16
              && ((v97 = (uint64_t *)v135[1], v99 = *v97, v98 = v97[1], v99 == 0x6E6B2D6C6C65772ELL)
                ? (v100 = v98 == 0x65726F632F6E776FLL)
                : (v100 = 0),
                  v100))
            {
              if (maxlog >= 7)
                coap_log_impl(7, "create default response for %s\n", ".well-known/core");
              v114 = (unsigned __int8 *)coap_wellknown_response(a1, v42, v136);
              v101 = v114;
              if (maxlog >= 7)
                coap_log_impl(7, "have wellknown response %p\n", v114);
            }
            else
            {
              v101 = coap_new_error_response(v136, 133, &v146);
            }
            if (!v101)
              goto LABEL_284;
            if (no_response((uint64_t)v136, (uint64_t)v101) != 1)
            {
              if (coap_send(v42, (uint64_t)v101) == -1 && maxlog >= 7)
                coap_log_impl(7, "cannot send response for transaction %d\n");
              goto LABEL_284;
            }
            v102 = v101;
            goto LABEL_271;
          }
          v133 = v79;
          v141 = 0;
          v139 = 0u;
          v140 = 0u;
          LODWORD(v145) = 0;
          v144 = 0;
          coap_option_filter_op(&v144, 0xFu, 0);
          coap_option_iterator_init((uint64_t)v136, (uint64_t)&v139, &v144);
          for (j = 0; ; ++j)
          {
            v81 = coap_option_next((uint64_t)&v139);
            v82 = v81;
            if (!v81)
              break;
            v83 = coap_opt_length(v81);
            v84 = coap_opt_value(v82);
            if (v83)
            {
              v85 = v83;
              do
              {
                v87 = *v84++;
                v86 = v87;
                v88 = (v87 & 0xFFFFFFDF) - 65;
                v89 = v87 - 48;
                v90 = v87 == 126;
                v91 = (1 << (v87 - 33)) & 0x4000000096003FE9;
                v93 = (v87 - 33) <= 0x3E && v91 != 0 || v90;
                if (v89 >= 0xA && v88 >= 0x1A)
                  v95 = v93;
                else
                  v95 = 1;
                if ((v86 & 0xFFFFFFEF) == 0x2F)
                  v96 = 1;
                else
                  v96 = v95;
                if (v96)
                  ++j;
                else
                  j += 3;
                --v85;
              }
              while (v85);
            }
          }
          if (j)
            v103 = j - 1;
          else
            v103 = 0;
          v36 = v135;
          if (j >= 2)
          {
            v104 = (unsigned __int8 *)coap_new_string(v103);
            v82 = v104;
            if (v104)
            {
              v132 = v41;
              *(_QWORD *)v104 = v103;
              v105 = (_BYTE *)*((_QWORD *)v104 + 1);
              coap_option_iterator_init((uint64_t)v136, (uint64_t)&v139, &v144);
              while (1)
              {
                v106 = coap_option_next((uint64_t)&v139);
                if (!v106)
                  break;
                v107 = v106;
                if (v105 != *((_BYTE **)v82 + 1))
                  *v105++ = 38;
                v108 = coap_opt_length(v106);
                v109 = coap_opt_value(v107);
                if (v108)
                {
                  v110 = v108;
                  do
                  {
                    v111 = *v109;
                    v112 = (v111 - 48) >= 0xA && (v111 & 0xFFFFFFDF) - 65 >= 0x1A;
                    if (!v112
                      || ((v111 - 33) <= 0x3E
                        ? (v113 = ((1 << (v111 - 33)) & 0x4000000096003FE9) == 0)
                        : (v113 = 1),
                          !v113 || v111 == 126 || (v111 & 0xFFFFFFEF) == 0x2F))
                    {
                      *v105++ = v111;
                    }
                    else
                    {
                      *v105 = 37;
                      v105[1] = a0123456789abcd_0[(unint64_t)*v109 >> 4];
                      v105[2] = a0123456789abcd_0[*v109 & 0xF];
                      v105 += 3;
                    }
                    ++v109;
                    --v110;
                  }
                  while (v110);
                }
              }
              v42 = v134;
              v36 = v135;
              v77 = v136;
              v41 = v132;
            }
          }
          if (maxlog >= 7)
            coap_log_impl(7, "call custom handler for resource '%*.*s'\n", **(_QWORD **)(v41 + 136), **(_QWORD **)(v41 + 136), *(const char **)(*(_QWORD *)(v41 + 136) + 8));
          v115 = *v77;
          v116 = *((_WORD *)v77 + 3);
          v117 = coap_session_max_pdu_size(v42);
          if (v115)
            v118 = 1;
          else
            v118 = 2;
          v119 = coap_pdu_init(v118, 0, v116, v117);
          if (!coap_add_token((uint64_t)v119, v77[4], *((const void **)v77 + 5)))
          {
            if (maxlog >= 4)
              coap_log_impl(4, "cannot generate response\r\n");
            if (v119)
              __assert_rtn("handle_request", "net.c", 2310, "response == NULL");
            goto LABEL_284;
          }
          v120 = (uint64_t)v77;
          v121 = 0;
          v122 = *(_QWORD *)(v120 + 40);
          v144 = *(unsigned __int8 *)(v120 + 4);
          v145 = v122;
          v141 = 0;
          v139 = 0u;
          v140 = 0u;
          if ((*(_BYTE *)v41 & 4) != 0)
          {
            v123 = coap_check_option(v120, 6u, (uint64_t)&v139);
            v121 = v123;
            if (v123)
            {
              v124 = coap_opt_value(v123);
              v125 = coap_opt_length(v121);
              if (!v125)
                goto LABEL_255;
              for (k = 0; k != v125; v127 = k++)
                ;
              if ((v124[v127] & 1) == 0)
              {
LABEL_255:
                v138 = 0;
                v128 = coap_get_block((uint64_t)v136, (uint64_t)&v138) != 0;
                if (coap_add_observer(v41, (uint64_t)v42, (uint64_t)&v144, v82, v128, v138))
                  coap_touch_observer(*(_QWORD **)(a1 + 16), (uint64_t)v42, (uint64_t)&v144);
                v133(a1, v41, v42, v136, &v144, v82, v119);
                goto LABEL_269;
              }
              coap_delete_observer(v41, (uint64_t)v42, (uint64_t)&v144);
            }
            v120 = (uint64_t)v136;
          }
          v133(a1, v41, v42, (unsigned __int8 *)v120, &v144, v82, v119);
          if (v82)
            free(v82);
LABEL_269:
          v129 = no_response((uint64_t)v136, (uint64_t)v119);
          if (v129 == 1)
          {
LABEL_270:
            v102 = v119;
            goto LABEL_271;
          }
          v130 = v129;
          if (v121 && v119[1] >= 0x60u)
            coap_delete_observer(v41, (uint64_t)v42, (uint64_t)&v144);
          v131 = *v119;
          if (v131 == 2)
          {
            if (!v119[1])
            {
              v119[4] = 0;
              *((_QWORD *)v119 + 3) = 0;
            }
          }
          else if (v130 != 2 && v131 == 1 && v119[1] < 0x40u)
          {
            goto LABEL_270;
          }
          if (coap_send(v42, (uint64_t)v119) == -1 && maxlog >= 7)
            coap_log_impl(7, "cannot send response for message %d\n");
          goto LABEL_284;
        }
      }
LABEL_285:
      coap_delete_node((_QWORD **)v6);
      return;
  }
}

void coap_remove_from_queue(_QWORD **a1, uint64_t a2, int a3, _QWORD *a4)
{
  _QWORD *v4;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t *v8;
  _QWORD *v9;
  uint64_t *v10;

  if (!a1)
    return;
  v4 = *a1;
  if (!*a1)
    return;
  if (v4[3] == a2 && *((_DWORD *)v4 + 8) == a3)
  {
    *a4 = v4;
    v6 = (_QWORD *)**a1;
    *a1 = v6;
    v7 = (_QWORD *)*a4;
    if (v6)
      v6[1] += v7[1];
    *v7 = 0;
    if (maxlog <= 6)
      return;
LABEL_17:
    coap_session_str(a2);
    coap_log_impl(7, "** %s: tid=%d: removed\n", (const char *)&coap_session_str_szSession, a3);
    return;
  }
  v8 = (uint64_t *)*v4;
  if (*v4)
  {
    while (1)
    {
      v9 = v8;
      if (v8[3] == a2 && *((_DWORD *)v8 + 8) == a3)
        break;
      v8 = (uint64_t *)*v8;
      v4 = v9;
      if (!*v9)
        return;
    }
    v10 = (uint64_t *)*v8;
    *v4 = *v9;
    if (v10)
      v10[1] += v9[1];
    *v9 = 0;
    *a4 = v9;
    if (maxlog >= 7)
      goto LABEL_17;
  }
}

void coap_cancel_all_messages(uint64_t a1, uint64_t a2, void *__s1, size_t __n)
{
  _QWORD *v4;
  uint64_t v9;
  _QWORD *i;
  uint64_t v11;

  v4 = *(_QWORD **)(a1 + 48);
  if (v4)
  {
    while (v4[3] == a2)
    {
      v9 = v4[5];
      if (*(unsigned __int8 *)(v9 + 4) != __n || __n && memcmp(__s1, *(const void **)(v9 + 40), __n))
        break;
      *(_QWORD *)(a1 + 48) = *v4;
      if (maxlog >= 7)
      {
        coap_session_str(a2);
        coap_log_impl(7, "** %s: tid=%d: removed\n", (const char *)&coap_session_str_szSession, *((_DWORD *)v4 + 8));
      }
      coap_delete_node((_QWORD **)v4);
      v4 = *(_QWORD **)(a1 + 48);
      if (!v4)
        return;
    }
    for (i = (_QWORD *)*v4; *v4; i = (_QWORD *)*v4)
    {
      if (i[3] == a2
        && (v11 = i[5], *(unsigned __int8 *)(v11 + 4) == __n)
        && (!__n || !memcmp(__s1, *(const void **)(v11 + 40), __n)))
      {
        *v4 = *i;
        if (maxlog >= 7)
        {
          coap_session_str(a2);
          coap_log_impl(7, "** %s: tid=%d: removed\n", (const char *)&coap_session_str_szSession, *((_DWORD *)i + 8));
        }
        coap_delete_node((_QWORD **)i);
      }
      else
      {
        v4 = i;
      }
    }
  }
}

uint64_t coap_wellknown_response(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  int v5;
  __int16 v6;
  unint64_t v7;
  unsigned __int8 v8;
  unsigned __int8 *v9;
  uint64_t v10;
  unsigned __int8 *v11;
  size_t v12;
  int v13;
  char v14;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unsigned int v19;
  int v20;
  unsigned int v21;
  unsigned int v22;
  unint64_t v23;
  uint64_t v24;
  unsigned int v25;
  char v26;
  unsigned int v27;
  unsigned int v28;
  unint64_t v29;
  uint64_t v30;
  int v31;
  char v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  int v39;
  uint64_t v40;
  BOOL v41;
  int v42;
  unsigned int v43;
  unsigned int v44;
  unsigned int v45;
  char v46;
  unint64_t v47;
  size_t v48;
  _BYTE *v49;
  uint64_t v50;
  _BYTE v51[4];
  size_t v52;
  _OWORD v53[2];
  uint64_t v54;
  size_t v55;

  v5 = *a3;
  v6 = *((_WORD *)a3 + 3);
  v7 = coap_session_max_pdu_size(a2);
  if (v5)
    v8 = 1;
  else
    v8 = 2;
  v9 = coap_pdu_init(v8, 0x45u, v6, v7);
  v10 = (uint64_t)v9;
  if (v9)
  {
    v54 = 0;
    memset(v53, 0, sizeof(v53));
    v52 = 0;
    v50 = 0;
    if (!coap_add_token((uint64_t)v9, a3[4], *((const void **)a3 + 5)))
    {
      if (maxlog >= 7)
        coap_log_impl(7, "coap_wellknown_response: cannot add token\n");
      goto LABEL_19;
    }
    v11 = coap_check_option((uint64_t)a3, 0xFu, (uint64_t)v53);
    v55 = 0;
    if ((coap_print_wellknown(a1, v51, &v55, 0xFFFFFFFFLL, v11) & 0x80000000) != 0)
    {
      if (maxlog >= 4)
        coap_log_impl(4, "cannot determine length of /.well-known/core\n");
    }
    else
    {
      v12 = v55;
      if (maxlog >= 7)
        coap_log_impl(7, "get_wkc_len: coap_print_wellknown() returned %zu\n", v55);
      if (v12)
      {
        if (coap_get_block((uint64_t)a3, (uint64_t)&v50))
        {
          if (maxlog >= 7)
            coap_log_impl(7, "create block\n");
          v13 = (BYTE4(v50) >> 1) & 7;
          if (v13 == 7)
          {
            *(_BYTE *)(v10 + 1) = 0x80;
            return v10;
          }
          v22 = (_DWORD)v50 << (v13 + 4);
          v23 = *(_QWORD *)(v10 + 32);
          if (!v23 || v23 > *(_QWORD *)(v10 + 24) + 8)
          {
LABEL_38:
            v24 = v22;
            v25 = coap_encode_var_safe((uint64_t)v51, v12);
            coap_add_option(v10, 4u, v25, v51);
            v26 = 0;
            goto LABEL_42;
          }
LABEL_39:
          if (maxlog >= 7)
            coap_log_impl(7, "coap_wellknown_response: insufficient storage space\n");
          goto LABEL_19;
        }
        v16 = *(_QWORD *)(v10 + 32);
        if (v16)
        {
          v17 = *(_QWORD *)(v10 + 24);
          if (v16 <= v17 + 8)
            goto LABEL_39;
          v18 = v16 - v17;
          if (v16 - v17 < v12 + 1)
          {
            if (v16 < v17)
              __assert_rtn("coap_wellknown_response", "net.c", 1903, "resp->used_size <= resp->max_size");
            LODWORD(v50) = 0;
            v19 = BYTE4(v50) & 0xF0 | 0xC;
            if (v18 <= 0x405)
            {
              LOBYTE(v20) = 6;
              while ((_BYTE)v20)
              {
                v21 = v19 + 14;
                v19 = (v19 + 14) & 0xE | v19 & 0xFFFFFFF1;
                v20 = (v21 >> 1) & 7;
                if (v18 >= ((16 << v20) | 6u))
                  goto LABEL_35;
              }
              BYTE4(v50) = v19;
              if (maxlog >= 7)
                coap_log_impl(7, "coap_wellknown_response: message to small even for szx == 0\n");
              goto LABEL_19;
            }
LABEL_35:
            v22 = 0;
            BYTE4(v50) = v19;
            goto LABEL_38;
          }
        }
        v24 = 0;
        v26 = 1;
LABEL_42:
        if (coap_encode_var_safe((uint64_t)v51, 0x28u) != 1)
          __assert_rtn("coap_wellknown_response", "net.c", 1934, "coap_encode_var_safe(buf, sizeof(buf), COAP_MEDIATYPE_APPLICATION_LINK_FORMAT) == 1");
        v27 = coap_encode_var_safe((uint64_t)v51, 0x28u);
        coap_add_option(v10, 0xCu, v27, v51);
        if ((v26 & 1) != 0)
        {
          v28 = coap_encode_var_safe((uint64_t)v51, v12);
          coap_add_option(v10, 0x1Cu, v28, v51);
          v29 = *(_QWORD *)(v10 + 32);
          if (v29)
          {
            v30 = *(_QWORD *)(v10 + 24);
            if (v12 + v30 + 1 > v29)
              v12 = v29 + ~v30;
          }
LABEL_67:
          v52 = v12;
          v49 = (_BYTE *)coap_add_data_after((_QWORD *)v10, v12);
          if (v49)
          {
            if ((coap_print_wellknown(a1, v49, &v52, v24, v11) & 0x80000000) == 0)
              return v10;
            if (maxlog >= 7)
              coap_log_impl(7, "coap_print_wellknown failed\n");
          }
          else if (maxlog >= 7)
          {
            coap_log_impl(7, "coap_wellknown_response: coap_add_data failed\n");
          }
          goto LABEL_19;
        }
        v31 = v50;
        v32 = BYTE4(v50);
        v33 = ((unint64_t)BYTE4(v50) >> 1) & 7;
        v34 = ((_DWORD)v50 << (v33 + 4));
        v35 = v12 - v34;
        if (v12 > v34)
        {
          v36 = *(_QWORD *)(v10 + 32);
          if (!v36)
            __assert_rtn("coap_write_block_opt", "block.c", 77, "pdu->max_size > 0");
          v37 = v36 - *(_QWORD *)(v10 + 24) - 4;
          v38 = 1 << (v33 + 4);
          if (v38 <= v37)
          {
            v43 = BYTE4(v50) & 0xFE | (v38 < v35);
          }
          else
          {
            if (v35 > v37)
            {
              if (v37 >= 0x10)
              {
                v39 = -1;
                v40 = v37;
                do
                {
                  ++v39;
                  v41 = (unint64_t)v40 > 1;
                  v40 >>= 1;
                }
                while (v41);
                v42 = v39 - 4;
                if (maxlog >= 7)
                {
                  coap_log_impl(7, "decrease block size for %zu to %d\n", v37, v42);
                  v32 = BYTE4(v50);
                  v31 = v50;
                  LODWORD(v33) = (BYTE4(v50) >> 1) & 7;
                }
                v43 = v32 & 0xF0 | (2 * (v42 & 7)) | 1;
                BYTE4(v50) = v43;
                v31 <<= v33 - (v42 & 7);
                LODWORD(v50) = v31;
                goto LABEL_64;
              }
              if (maxlog > 6)
              {
                coap_log_impl(7, "not enough space, even the smallest block does not fit");
LABEL_59:
                if (maxlog >= 7)
                  coap_log_impl(7, "coap_wellknown_response: cannot add Block2 option\n");
                goto LABEL_19;
              }
              goto LABEL_19;
            }
            v43 = BYTE4(v50) & 0xFE;
          }
          BYTE4(v50) = v43;
LABEL_64:
          v44 = coap_encode_var_safe((uint64_t)&v55, (8 * (v43 & 1)) | (16 * v31) | (v43 >> 1) & 7);
          coap_add_option(v10, 0x17u, v44, &v55);
          v45 = coap_encode_var_safe((uint64_t)v51, v12);
          coap_add_option(v10, 0x1Cu, v45, v51);
          v46 = ((BYTE4(v50) >> 1) & 7) + 4;
          v47 = 1 << v46;
          v48 = v12 - ((_DWORD)v50 << v46);
          if (v48 >= v47)
            v12 = v47;
          else
            v12 = v48;
          goto LABEL_67;
        }
        if (maxlog > 6)
        {
          coap_log_impl(7, "illegal block requested\n");
          goto LABEL_59;
        }
LABEL_19:
        v14 = -93;
LABEL_25:
        *(_BYTE *)(v10 + 1) = v14;
        *(_QWORD *)(v10 + 24) = *(unsigned __int8 *)(v10 + 4);
        return v10;
      }
    }
    if (maxlog >= 7)
      coap_log_impl(7, "coap_wellknown_response: undefined resource\n");
    v14 = 0x80;
    goto LABEL_25;
  }
  if (maxlog >= 7)
    coap_log_impl(7, "coap_wellknown_response: cannot create PDU\n");
  return v10;
}

uint64_t no_response(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  _BYTE *v4;
  _BYTE *v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  int v9;
  _OWORD v10[2];
  uint64_t v11;

  if (!a1)
    __assert_rtn("no_response", "net.c", 2054, "request");
  if (!a2)
    __assert_rtn("no_response", "net.c", 2055, "response");
  if (*(unsigned __int8 *)(a2 + 1) < 0x20u)
    return 0;
  v11 = 0;
  memset(v10, 0, sizeof(v10));
  result = (uint64_t)coap_check_option(a1, 0x102u, (uint64_t)v10);
  if (result)
  {
    v4 = (_BYTE *)result;
    v5 = coap_opt_value((_BYTE *)result);
    v6 = coap_opt_length(v4);
    v7 = 0;
    if (v6)
    {
      v8 = v6;
      do
      {
        v9 = *v5++;
        v7 = v9 | (v7 << 8);
        --v8;
      }
      while (v8);
    }
    if (((v7 >> ((*(_BYTE *)(a2 + 1) >> 5) - 1)) & 1) != 0)
      return 1;
    else
      return 2;
  }
  return result;
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1E0D15428]();
}

uint64_t AsyncConnection_Connect()
{
  return MEMORY[0x1E0D1A7A0]();
}

uint64_t AsyncConnection_Release()
{
  return MEMORY[0x1E0D1A7B0]();
}

uint64_t BTDeviceGetConnectedServices()
{
  return MEMORY[0x1E0D4E200]();
}

uint64_t BTDeviceGetDeviceId()
{
  return MEMORY[0x1E0D4E218]();
}

uint64_t BTLocalDeviceGetConnectable()
{
  return MEMORY[0x1E0D4E298]();
}

uint64_t BTLocalDeviceGetConnectedDevices()
{
  return MEMORY[0x1E0D4E2A8]();
}

uint64_t BTLocalDeviceGetDefault()
{
  return MEMORY[0x1E0D4E2C0]();
}

uint64_t BTLocalDeviceGetDiscoverable()
{
  return MEMORY[0x1E0D4E2D0]();
}

uint64_t BTLocalDeviceGetModulePower()
{
  return MEMORY[0x1E0D4E2D8]();
}

uint64_t BTLocalDeviceGetScanning()
{
  return MEMORY[0x1E0D4E2E8]();
}

uint64_t BTSessionAttachWithQueue()
{
  return MEMORY[0x1E0D4E3B0]();
}

uint64_t BTSessionDetachWithQueue()
{
  return MEMORY[0x1E0D4E3C8]();
}

uint64_t BonjourBrowser_Create()
{
  return MEMORY[0x1E0D1A840]();
}

uint64_t BonjourBrowser_SetDispatchQueue()
{
  return MEMORY[0x1E0D1A858]();
}

uint64_t BonjourBrowser_SetEventHandlerBlock()
{
  return MEMORY[0x1E0D1A868]();
}

uint64_t BonjourBrowser_Start()
{
  return MEMORY[0x1E0D1A878]();
}

uint64_t BonjourBrowser_Stop()
{
  return MEMORY[0x1E0D1A880]();
}

uint64_t BonjourDevice_CopyCFString()
{
  return MEMORY[0x1E0D1A888]();
}

uint64_t BonjourDevice_GetDNSName()
{
  return MEMORY[0x1E0D1A8A0]();
}

uint64_t BonjourDevice_Reconfirm()
{
  return MEMORY[0x1E0D1A8C0]();
}

unsigned __int8 *__cdecl CC_SHA512(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C803A8](data, *(_QWORD *)&len, md);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1E0C97D90]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

CFDataRef CFDataCreateCopy(CFAllocatorRef allocator, CFDataRef theData)
{
  return (CFDataRef)MEMORY[0x1E0C983B0](allocator, theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x1E0C98418]();
}

CFTypeID CFDateGetTypeID(void)
{
  return MEMORY[0x1E0C984E8]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98500](theDict, key, value);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1E0C985A8]();
}

uint64_t CFDictionaryGetTypedValue()
{
  return MEMORY[0x1E0D1A990]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1E0C989B8]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

Boolean CFNumberIsFloatType(CFNumberRef number)
{
  return MEMORY[0x1E0C989D0](number);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x1E0C98F78](alloc, theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

uint64_t CUPrintFlags32()
{
  return MEMORY[0x1E0D1AB98]();
}

uint64_t CUPrintNSObjectMasked()
{
  return MEMORY[0x1E0D1ABD8]();
}

uint64_t CreateUsableInterfaceList()
{
  return MEMORY[0x1E0D1ACC8]();
}

uint64_t DataToHexCStringEx()
{
  return MEMORY[0x1E0D1AD80]();
}

uint64_t DebugGetErrorString()
{
  return MEMORY[0x1E0D1AD88]();
}

uint64_t HMFBooleanToString()
{
  return MEMORY[0x1E0D27E00]();
}

uint64_t HMFCreateOSLogHandle()
{
  return MEMORY[0x1E0D27E08]();
}

uint64_t HMFEqualObjects()
{
  return MEMORY[0x1E0D27FC0]();
}

uint64_t HMFGetLogIdentifier()
{
  return MEMORY[0x1E0D27FD0]();
}

uint64_t HMFGetOSLogHandle()
{
  return MEMORY[0x1E0D27FD8]();
}

uint64_t HMFMethodDescription()
{
  return MEMORY[0x1E0D28018]();
}

uint64_t HMFObjectDescription()
{
  return MEMORY[0x1E0D28020]();
}

uint64_t HMFRandomDataWithLength()
{
  return MEMORY[0x1E0D28500]();
}

uint64_t HTTPClientCreate()
{
  return MEMORY[0x1E0D1AE60]();
}

uint64_t HTTPClientGetPeerAddress()
{
  return MEMORY[0x1E0D1AE78]();
}

uint64_t HTTPClientInvalidate()
{
  return MEMORY[0x1E0D1AE88]();
}

uint64_t HTTPClientSendMessage()
{
  return MEMORY[0x1E0D1AE90]();
}

uint64_t HTTPClientSetDebugDelegate()
{
  return MEMORY[0x1E0D1AEA0]();
}

uint64_t HTTPClientSetDelegate()
{
  return MEMORY[0x1E0D1AEA8]();
}

uint64_t HTTPClientSetDestination()
{
  return MEMORY[0x1E0D1AEB0]();
}

uint64_t HTTPClientSetDispatchQueue()
{
  return MEMORY[0x1E0D1AEB8]();
}

uint64_t HTTPClientSetFlags()
{
  return MEMORY[0x1E0D1AEC0]();
}

uint64_t HTTPClientSetTimeout()
{
  return MEMORY[0x1E0D1AED0]();
}

uint64_t HTTPClientSetTransportDelegate()
{
  return MEMORY[0x1E0D1AED8]();
}

uint64_t HTTPGetHeaderField()
{
  return MEMORY[0x1E0D1AF30]();
}

uint64_t HTTPGetReasonPhrase()
{
  return MEMORY[0x1E0D1AF38]();
}

uint64_t HTTPHeader_InitRequest()
{
  return MEMORY[0x1E0D1AF40]();
}

uint64_t HTTPHeader_SetField()
{
  return MEMORY[0x1E0D1AF48]();
}

uint64_t HTTPMessageCreate()
{
  return MEMORY[0x1E0D1AF60]();
}

uint64_t HTTPMessageSetBody()
{
  return MEMORY[0x1E0D1AF70]();
}

uint64_t HTTPMessageSetCompletionBlock()
{
  return MEMORY[0x1E0D1AF80]();
}

uint64_t HardwareAddressToCString()
{
  return MEMORY[0x1E0D1AFD8]();
}

uint64_t HexToData()
{
  return MEMORY[0x1E0D1AFE8]();
}

IOReturn IOAllowPowerChange(io_connect_t kernelPort, intptr_t notificationID)
{
  return MEMORY[0x1E0CBAD20](*(_QWORD *)&kernelPort, notificationID);
}

IOReturn IODeregisterForSystemPower(io_object_t *notifier)
{
  return MEMORY[0x1E0CBAE38](notifier);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
  MEMORY[0x1E0CBB6A0](notify);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
  MEMORY[0x1E0CBB6B8](notify, queue);
}

io_connect_t IORegisterForSystemPower(void *refcon, IONotificationPortRef *thePortRef, IOServiceInterestCallback callback, io_object_t *notifier)
{
  return MEMORY[0x1E0CBB8D8](refcon, thePortRef, callback, notifier);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x1E0CBB9D0](*(_QWORD *)&connect);
}

uint64_t IsAppleTV()
{
  return MEMORY[0x1E0D1B008]();
}

uint64_t MFiPlatform_VerifySignature()
{
  return MEMORY[0x1E0D1B0C8]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

uint64_t NetTransportChaCha20Poly1305Configure()
{
  return MEMORY[0x1E0D1B2F8]();
}

uint64_t NormalizeUUIDString()
{
  return MEMORY[0x1E0D1B310]();
}

uint64_t PairingSessionCopyProperty()
{
  return MEMORY[0x1E0D1B508]();
}

uint64_t PairingSessionCreate()
{
  return MEMORY[0x1E0D1B510]();
}

uint64_t PairingSessionDeriveKey()
{
  return MEMORY[0x1E0D1B528]();
}

uint64_t PairingSessionExchange()
{
  return MEMORY[0x1E0D1B530]();
}

uint64_t PairingSessionGetPeerFlags()
{
  return MEMORY[0x1E0D1B550]();
}

uint64_t PairingSessionGetResumeInfo()
{
  return MEMORY[0x1E0D1B558]();
}

uint64_t PairingSessionSetEventHandler()
{
  return MEMORY[0x1E0D1B568]();
}

uint64_t PairingSessionSetFlags()
{
  return MEMORY[0x1E0D1B570]();
}

uint64_t PairingSessionSetIdentifier()
{
  return MEMORY[0x1E0D1B578]();
}

uint64_t PairingSessionSetMTU()
{
  return MEMORY[0x1E0D1B590]();
}

uint64_t PairingSessionSetProperty()
{
  return MEMORY[0x1E0D1B5B8]();
}

uint64_t PairingSessionSetResumeInfo()
{
  return MEMORY[0x1E0D1B5C0]();
}

uint64_t PairingSessionSetSetupCode()
{
  return MEMORY[0x1E0D1B5C8]();
}

uint64_t ReleaseUsableInterfaceList()
{
  return MEMORY[0x1E0D1B608]();
}

uint64_t SNScanF()
{
  return MEMORY[0x1E0D1B620]();
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x1E0CD6290](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x1E0CD6298](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x1E0CD62A0](query);
}

OSStatus SecItemUpdate(CFDictionaryRef query, CFDictionaryRef attributesToUpdate)
{
  return MEMORY[0x1E0CD62D8](query, attributesToUpdate);
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x1E0CD65A0](rnd, count, bytes);
}

uint64_t SockAddrGetPort()
{
  return MEMORY[0x1E0D1B678]();
}

uint64_t SockAddrToString()
{
  return MEMORY[0x1E0D1B698]();
}

uint64_t SocketGetInterfaceInfo()
{
  return MEMORY[0x1E0D1B6B0]();
}

uint64_t StringToSockAddr()
{
  return MEMORY[0x1E0D1B710]();
}

uint64_t TLV8BufferAppend()
{
  return MEMORY[0x1E0D1B728]();
}

uint64_t TLV8BufferAppendUInt64()
{
  return MEMORY[0x1E0D1B730]();
}

uint64_t TLV8BufferDetach()
{
  return MEMORY[0x1E0D1B738]();
}

uint64_t TLV8BufferFree()
{
  return MEMORY[0x1E0D1B740]();
}

uint64_t TLV8BufferInit()
{
  return MEMORY[0x1E0D1B748]();
}

uint64_t TLV8Get()
{
  return MEMORY[0x1E0D1B750]();
}

uint64_t TLV8GetBytes()
{
  return MEMORY[0x1E0D1B758]();
}

uint64_t TLV8GetNext()
{
  return MEMORY[0x1E0D1B760]();
}

uint64_t TLV8GetOrCopyCoalesced()
{
  return MEMORY[0x1E0D1B768]();
}

uint64_t TLV8GetUInt64()
{
  return MEMORY[0x1E0D1B770]();
}

uint64_t TextToHardwareAddress()
{
  return MEMORY[0x1E0D1B798]();
}

uint64_t UpTicksToMilliseconds()
{
  return MEMORY[0x1E0D1B7F0]();
}

uint64_t WiFiCopyCurrentNetworkInfoEx()
{
  return MEMORY[0x1E0D1B828]();
}

uint64_t WiFiCopyNetworkInfo()
{
  return MEMORY[0x1E0D1B830]();
}

uint64_t WiFiJoinNetwork()
{
  return MEMORY[0x1E0D1B838]();
}

uint64_t WiFiManagerClientCreate()
{
  return MEMORY[0x1E0D4FC08]();
}

uint64_t WiFiManagerClientRemoveNetwork()
{
  return MEMORY[0x1E0D4FC80]();
}

uint64_t WiFiNetworkDisableAutoJoinUntilFirstUserJoin()
{
  return MEMORY[0x1E0D4FCE8]();
}

uint64_t WiFiNetworkGetOperatingBand()
{
  return MEMORY[0x1E0D4FD18]();
}

uint64_t WiFiRestoreNetwork()
{
  return MEMORY[0x1E0D1B860]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _HMFPreconditionFailure()
{
  return MEMORY[0x1E0D28700]();
}

uint64_t _HTTPClientSetProperty()
{
  return MEMORY[0x1E0D1B870]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

uint64_t __HMFActivityScopeLeave()
{
  return MEMORY[0x1E0D28710]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

int __darwin_check_fd_set_overflow(int a1, const void *a2, int a3)
{
  return MEMORY[0x1E0C80AA0](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1E0C80B50](*(_QWORD *)&a1, a2);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1E0C80B68]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

int accept(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x1E0C813C8](*(_QWORD *)&a1, a2, a3);
}

uint32_t arc4random(void)
{
  return MEMORY[0x1E0C81570]();
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
  MEMORY[0x1E0C81580](__buf, __nbytes);
}

int bind(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x1E0C816F0](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

uint64_t cced25519_make_key_pair_compat()
{
  return MEMORY[0x1E0D1B890]();
}

uint64_t chacha20_poly1305_decrypt_all_64x64()
{
  return MEMORY[0x1E0D1B8D0]();
}

uint64_t chacha20_poly1305_decrypt_all_64x64_ex()
{
  return MEMORY[0x1E0D1B8D8]();
}

uint64_t chacha20_poly1305_encrypt_all_64x64()
{
  return MEMORY[0x1E0D1B8F0]();
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x1E0C826D8](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C60](flags, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D38](group, queue, block);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E50](label, attr, target);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x1E0C82FC8](when, delta);
}

void exit(int a1)
{
  MEMORY[0x1E0C83278](*(_QWORD *)&a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1E0C83300](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int fflush(FILE *a1)
{
  return MEMORY[0x1E0C83370](a1);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C83478](a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x1E0C83490](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int getpeername(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x1E0C83748](*(_QWORD *)&a1, a2, a3);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1E0C83778]();
}

int getsockname(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x1E0C83810](*(_QWORD *)&a1, a2, a3);
}

int getsockopt(int a1, int a2, int a3, void *a4, socklen_t *a5)
{
  return MEMORY[0x1E0C83818](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3, a4, a5);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x1E0C83820](a1, a2);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return (const char *)MEMORY[0x1E0C83968](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

int inet_pton(int a1, const char *a2, void *a3)
{
  return MEMORY[0x1E0C83970](*(_QWORD *)&a1, a2, a3);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x1E0C83980](*(_QWORD *)&a1, a2);
}

tm *__cdecl localtime(const time_t *a1)
{
  return (tm *)MEMORY[0x1E0C83BA8](a1);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F10](ptr, size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1E0C84070](__s, *(_QWORD *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x1E0C840D0](__s, __smax, *(_QWORD *)&__c, __n);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

nw_browse_descriptor_t nw_browse_descriptor_create_bonjour_service(const char *type, const char *domain)
{
  return (nw_browse_descriptor_t)MEMORY[0x1E0CCEF08](type, domain);
}

void nw_browse_descriptor_set_include_txt_record(nw_browse_descriptor_t descriptor, BOOL include_txt_record)
{
  MEMORY[0x1E0CCEF18](descriptor, include_txt_record);
}

nw_endpoint_t nw_browse_result_copy_endpoint(nw_browse_result_t result)
{
  return (nw_endpoint_t)MEMORY[0x1E0CCEF20](result);
}

nw_txt_record_t nw_browse_result_copy_txt_record_object(nw_browse_result_t result)
{
  return (nw_txt_record_t)MEMORY[0x1E0CCEF28](result);
}

nw_browse_result_change_t nw_browse_result_get_changes(nw_browse_result_t old_result, nw_browse_result_t new_result)
{
  return MEMORY[0x1E0CCEF30](old_result, new_result);
}

void nw_browser_cancel(nw_browser_t browser)
{
  MEMORY[0x1E0CCEF38](browser);
}

nw_browser_t nw_browser_create(nw_browse_descriptor_t descriptor, nw_parameters_t parameters)
{
  return (nw_browser_t)MEMORY[0x1E0CCEF40](descriptor, parameters);
}

void nw_browser_set_browse_results_changed_handler(nw_browser_t browser, nw_browser_browse_results_changed_handler_t handler)
{
  MEMORY[0x1E0CCEF48](browser, handler);
}

void nw_browser_set_queue(nw_browser_t browser, dispatch_queue_t queue)
{
  MEMORY[0x1E0CCEF50](browser, queue);
}

void nw_browser_set_state_changed_handler(nw_browser_t browser, nw_browser_state_changed_handler_t state_changed_handler)
{
  MEMORY[0x1E0CCEF58](browser, state_changed_handler);
}

void nw_browser_start(nw_browser_t browser)
{
  MEMORY[0x1E0CCEF60](browser);
}

void nw_connection_cancel(nw_connection_t connection)
{
  MEMORY[0x1E0CCEFB8](connection);
}

void nw_connection_cancel_current_endpoint(nw_connection_t connection)
{
  MEMORY[0x1E0CCEFC0](connection);
}

nw_path_t nw_connection_copy_current_path(nw_connection_t connection)
{
  return (nw_path_t)MEMORY[0x1E0CCEFE8](connection);
}

nw_connection_t nw_connection_create(nw_endpoint_t endpoint, nw_parameters_t parameters)
{
  return (nw_connection_t)MEMORY[0x1E0CCF030](endpoint, parameters);
}

void nw_connection_set_queue(nw_connection_t connection, dispatch_queue_t queue)
{
  MEMORY[0x1E0CCF1B0](connection, queue);
}

void nw_connection_set_state_changed_handler(nw_connection_t connection, nw_connection_state_changed_handler_t handler)
{
  MEMORY[0x1E0CCF1C0](connection, handler);
}

void nw_connection_start(nw_connection_t connection)
{
  MEMORY[0x1E0CCF1D8](connection);
}

nw_endpoint_t nw_endpoint_create_bonjour_service(const char *name, const char *type, const char *domain)
{
  return (nw_endpoint_t)MEMORY[0x1E0CCF3A0](name, type, domain);
}

const sockaddr *__cdecl nw_endpoint_get_address(nw_endpoint_t endpoint)
{
  return (const sockaddr *)MEMORY[0x1E0CCF3D8](endpoint);
}

const char *__cdecl nw_endpoint_get_bonjour_service_domain(nw_endpoint_t endpoint)
{
  return (const char *)MEMORY[0x1E0CCF3E8](endpoint);
}

const char *__cdecl nw_endpoint_get_bonjour_service_name(nw_endpoint_t endpoint)
{
  return (const char *)MEMORY[0x1E0CCF3F0](endpoint);
}

const char *__cdecl nw_endpoint_get_bonjour_service_type(nw_endpoint_t endpoint)
{
  return (const char *)MEMORY[0x1E0CCF3F8](endpoint);
}

nw_endpoint_type_t nw_endpoint_get_type(nw_endpoint_t endpoint)
{
  return MEMORY[0x1E0CCF440](endpoint);
}

CFErrorRef nw_error_copy_cf_error(nw_error_t error)
{
  return (CFErrorRef)MEMORY[0x1E0CCF458](error);
}

uint64_t nw_interface_create_with_name()
{
  return MEMORY[0x1E0CCF6F8]();
}

nw_parameters_t nw_parameters_create_secure_tcp(nw_parameters_configure_protocol_block_t configure_tls, nw_parameters_configure_protocol_block_t configure_tcp)
{
  return (nw_parameters_t)MEMORY[0x1E0CCF980](configure_tls, configure_tcp);
}

nw_parameters_t nw_parameters_create_secure_udp(nw_parameters_configure_protocol_block_t configure_dtls, nw_parameters_configure_protocol_block_t configure_udp)
{
  return (nw_parameters_t)MEMORY[0x1E0CCF990](configure_dtls, configure_udp);
}

void nw_parameters_prohibit_interface(nw_parameters_t parameters, nw_interface_t interface)
{
  MEMORY[0x1E0CCFA30](parameters, interface);
}

uint64_t nw_path_copy_endpoint()
{
  return MEMORY[0x1E0CCFCC0]();
}

BOOL nw_txt_record_access_bytes(nw_txt_record_t txt_record, nw_txt_record_access_bytes_t access_bytes)
{
  return MEMORY[0x1E0CD03D8](txt_record, access_bytes);
}

BOOL nw_txt_record_apply(nw_txt_record_t txt_record, nw_txt_record_applier_t applier)
{
  return MEMORY[0x1E0CD03E0](txt_record, applier);
}

size_t nw_txt_record_get_key_count(nw_txt_record_t txt_record)
{
  return MEMORY[0x1E0CD03F0](txt_record);
}

BOOL nw_txt_record_is_dictionary(nw_txt_record_t txt_record)
{
  return MEMORY[0x1E0CD03F8](txt_record);
}

uint64_t nw_udp_options_set_no_metadata()
{
  return MEMORY[0x1E0CD0410]();
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

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
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

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x1E0C84990](lock);
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x1E0C849A0]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

void perror(const char *a1)
{
  MEMORY[0x1E0C84AF0](a1);
}

int pipe(int a1[2])
{
  return MEMORY[0x1E0C84B10](a1);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1E0C85000](*(_QWORD *)&a1, a2, a3);
}

ssize_t recv(int a1, void *a2, size_t a3, int a4)
{
  return MEMORY[0x1E0C85060](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

ssize_t recvmsg(int a1, msghdr *a2, int a3)
{
  return MEMORY[0x1E0C85070](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

int select(int a1, fd_set *a2, fd_set *a3, fd_set *a4, timeval *a5)
{
  return MEMORY[0x1E0C85280](*(_QWORD *)&a1, a2, a3, a4, a5);
}

ssize_t send(int a1, const void *a2, size_t a3, int a4)
{
  return MEMORY[0x1E0C852F8](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

ssize_t sendmsg(int a1, const msghdr *a2, int a3)
{
  return MEMORY[0x1E0C85300](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x1E0C85388](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3, a4, *(_QWORD *)&a5);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x1E0C85450](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x1E0C85558](a1, a2, a3, a4);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1E0C85570](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

uint64_t strnicmp_prefix()
{
  return MEMORY[0x1E0D1B9A0]();
}

uint64_t strnicmpx()
{
  return MEMORY[0x1E0D1B9A8]();
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1E0C855C0](__s1, __n);
}

int vfprintf(FILE *a1, const char *a2, va_list a3)
{
  return MEMORY[0x1E0C85A68](a1, a2, a3);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x1E0C85B98](__str, __size, __format, a4);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1E0C85D40](*(_QWORD *)&__fd, __buf, __nbyte);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x1E0C86390](xdict, key, string);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

uint64_t xpc_set_event()
{
  return MEMORY[0x1E0C866E0]();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
  MEMORY[0x1E0C866E8](stream, targetq, handler);
}

