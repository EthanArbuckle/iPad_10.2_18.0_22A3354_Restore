@implementation DMCProfilePayloadsSummary

+ (id)summaryForProfile:(id)a3 showManagedPayloads:(BOOL)a4 dataSource:(unint64_t)a5
{
  _BOOL4 v5;
  id v6;
  void *v7;
  id v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  DMCApplicationProxy *v23;
  DMCPayloadViewModel *v24;
  DMCManagedAppPayload *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  uint64_t v33;
  DMCPayloadViewModel *v34;
  DMCManagedBookPayload *v35;
  DMCProfilePayloadSection *v36;
  DMCProfilePayloadSection *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t k;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t m;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  BOOL v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  DMCProfilePayloadSection *v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  id v79;
  void *v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  void *v84;
  void *v85;
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
  id v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t n;
  void *v101;
  void *v102;
  char v103;
  __CFString *v104;
  void *v105;
  DMCProfilePayloadSection *v106;
  void *v107;
  void *v108;
  id v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t ii;
  uint64_t v114;
  void *v115;
  void *v116;
  __CFString *v117;
  void *v118;
  DMCProfilePayloadSection *v119;
  void *v120;
  void *v121;
  void *v122;
  uint64_t v123;
  void *v124;
  DMCProfileInfoSection *v125;
  void *v126;
  DMCProfileInfoSection *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  DMCProfileInfoSection *v132;
  void *v133;
  void *v134;
  uint64_t v135;
  void *v136;
  void *v137;
  void *v138;
  DMCProfileInfoSection *v139;
  void *v140;
  DMCProfileInfoSection *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  id v146;
  DMCProfilePayloadSection *v148;
  DMCProfilePayloadSection *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  uint64_t v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  uint64_t v161;
  void *v163;
  void *v164;
  void *v165;
  id obj;
  uint64_t v167;
  void *v168;
  uint64_t v169;
  uint64_t v171;
  void *v172;
  uint64_t v173;
  void *v174;
  DMCProfilePayloadSection *v175;
  unsigned int context;
  void *contexta;
  void *contextb;
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
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  _BYTE v203[128];
  _BYTE v204[128];
  _BYTE v205[128];
  _BYTE v206[128];
  DMCProfilePayloadSection *v207;
  DMCProfilePayloadSection *v208;
  uint8_t v209[128];
  uint8_t buf[4];
  uint64_t v211;
  _BYTE v212[128];
  uint64_t v213;

  v5 = a4;
  v213 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)objc_opt_new();
  v172 = (void *)objc_opt_new();
  if (v5)
    objc_msgSend(v6, "managedPayloads");
  else
    objc_msgSend(v6, "payloads");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v151 = v8;
  objc_msgSend(v172, "addObjectsFromArray:", v8);
  context = objc_msgSend(a1, "_isMDMProfile:", v6);
  v9 = objc_msgSend(a1, "_isInstalledMDMProfile:", v6);
  v10 = (void *)objc_opt_new();
  v11 = (void *)objc_opt_new();
  objc_msgSend(v6, "payloadsOfKindOfClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "assignedManagedAppleID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    v16 = v14;
  }
  else
  {
    objc_msgSend(v13, "managedAppleID");
    v16 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend(v16, "length"))
    objc_msgSend(v7, "setManagedAppleID:", v16);
  objc_msgSend(v7, "setFinalInstallationWarningStyle:", context);
  v164 = v10;
  v165 = v6;
  v163 = v11;
  v157 = v7;
  v152 = v13;
  v150 = v16;
  if ((v9 & v5) == 1)
  {
    objc_msgSend(a1, "_installedManagedAppIDs");
    v199 = 0u;
    v200 = 0u;
    v201 = 0u;
    v202 = 0u;
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v199, v212, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v200;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v200 != v20)
            objc_enumerationMutation(v17);
          v22 = *(_QWORD *)(*((_QWORD *)&v199 + 1) + 8 * i);
          v23 = -[DMCApplicationProxy initWithBundleID:dataSource:]([DMCApplicationProxy alloc], "initWithBundleID:dataSource:", v22, a5);
          v24 = -[DMCPayloadViewModel initWithManagedApp:]([DMCPayloadViewModel alloc], "initWithManagedApp:", v23);
          objc_msgSend(v164, "addObject:", v24);
          v25 = -[DMCManagedAppPayload initWithManagedAppID:profile:]([DMCManagedAppPayload alloc], "initWithManagedAppID:profile:", v22, v165);
          objc_msgSend(v172, "addObject:", v25);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v199, v212, 16);
      }
      while (v19);
    }

    v26 = *(id *)DMCLogObjects();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = objc_msgSend(v17, "count");
      *(_DWORD *)buf = 134217984;
      v211 = v27;
      _os_log_impl(&dword_216358000, v26, OS_LOG_TYPE_DEFAULT, "DMCProfileViewModel: number of installed managed apps: %lu.", buf, 0xCu);
    }

    v197 = 0u;
    v198 = 0u;
    v195 = 0u;
    v196 = 0u;
    objc_msgSend(a1, "_managedBooks");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v195, v209, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v196;
      do
      {
        for (j = 0; j != v30; ++j)
        {
          if (*(_QWORD *)v196 != v31)
            objc_enumerationMutation(v28);
          v33 = *(_QWORD *)(*((_QWORD *)&v195 + 1) + 8 * j);
          v34 = -[DMCPayloadViewModel initWithManagedBook:]([DMCPayloadViewModel alloc], "initWithManagedBook:", v33);
          objc_msgSend(v163, "addObject:", v34);
          v35 = -[DMCManagedBookPayload initWithBook:]([DMCManagedBookPayload alloc], "initWithBook:", v33);
          objc_msgSend(v172, "addObject:", v35);

        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v195, v209, 16);
      }
      while (v30);
    }

    v11 = v163;
    v10 = v164;
  }
  if (objc_msgSend(v10, "count"))
    v36 = -[DMCProfilePayloadSection initWithSectionTitle:footer:payloadViewModels:]([DMCProfilePayloadSection alloc], "initWithSectionTitle:footer:payloadViewModels:", 0, 0, v10);
  else
    v36 = 0;
  if (objc_msgSend(v11, "count"))
    v37 = -[DMCProfilePayloadSection initWithSectionTitle:footer:payloadViewModels:]([DMCProfilePayloadSection alloc], "initWithSectionTitle:footer:payloadViewModels:", 0, 0, v11);
  else
    v37 = 0;
  v149 = v36;
  if (v36)
  {
    v208 = v36;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v208, 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setManagedAppSections:", v38);

  }
  else
  {
    objc_msgSend(v7, "setManagedAppSections:", 0);
  }
  v148 = v37;
  if (v37)
  {
    v207 = v37;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v207, 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setManagedBookSections:", v39);

  }
  else
  {
    objc_msgSend(v7, "setManagedBookSections:", 0);
  }
  objc_msgSend(a1, "_sortedPayloads:", v172);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_alloc_init(MEMORY[0x24BDD14E0]);
  v191 = 0u;
  v192 = 0u;
  v193 = 0u;
  v194 = 0u;
  v42 = v40;
  v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v191, v206, 16);
  if (v43)
  {
    v44 = v43;
    v45 = *(_QWORD *)v192;
    do
    {
      for (k = 0; k != v44; ++k)
      {
        if (*(_QWORD *)v192 != v45)
          objc_enumerationMutation(v42);
        objc_msgSend(v41, "addObject:", objc_opt_class());
      }
      v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v191, v206, 16);
    }
    while (v44);
  }
  v158 = v41;

  v156 = (void *)objc_opt_new();
  v154 = (void *)objc_opt_new();
  v153 = (void *)objc_opt_new();
  v159 = (void *)objc_opt_new();
  v47 = objc_opt_new();
  v187 = 0u;
  v188 = 0u;
  v189 = 0u;
  v190 = 0u;
  obj = v42;
  v173 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v187, v205, 16);
  v48 = 0;
  if (v173)
  {
    v174 = 0;
    v175 = 0;
    v49 = 0;
    v50 = 0;
    v51 = 0;
    v171 = *(_QWORD *)v188;
    v161 = *MEMORY[0x24BE638D0];
    v52 = 2;
    if (context)
      v52 = 3;
    v155 = v52;
    v53 = 0x24D52D000uLL;
    v167 = v47;
    do
    {
      for (m = 0; m != v173; ++m)
      {
        if (*(_QWORD *)v188 != v171)
          objc_enumerationMutation(obj);
        v55 = *(void **)(*((_QWORD *)&v187 + 1) + 8 * m);
        contexta = (void *)MEMORY[0x2199F76C8]();
        v56 = objc_opt_class();
        v57 = objc_msgSend(*(id *)(v53 + 1632), "payloadTypeForPayloadClass:", v56);
        if (v56 != objc_opt_class())
        {
          objc_msgSend(*(id *)(v53 + 1632), "payloadViewModelsFromPayload:", v55);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          if (v56 == objc_opt_class())
          {
            v168 = v58;
            v59 = v49;
            v60 = (void *)MEMORY[0x24BE63CD0];
            objc_msgSend(v55, "restrictions");
            v61 = v55;
            v62 = v48;
            v63 = v51;
            v64 = v50;
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v60) = objc_msgSend(v60, "restrictedBoolForFeature:withRestrictionsDictionary:", v161, v65);

            v50 = v64;
            v51 = v63;
            v48 = v62;
            v55 = v61;
            v66 = (_DWORD)v60 == 2;
            v49 = v59;
            v58 = v168;
            v53 = 0x24D52D000uLL;
            if (v66)
              objc_msgSend(v157, "setFinalInstallationWarningStyle:", v155);
          }
          if (v51 == (void *)v56)
          {
            v73 = v175;
          }
          else
          {
            v169 = v49;
            if (v48)
            {
              if (v51 == (void *)objc_opt_class())
              {
                if (v175)
                {
                  v67 = *(void **)(v53 + 1632);
                  -[DMCProfilePayloadSection payloadViewModels](v175, "payloadViewModels");
                  v68 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v67, "removeDuplicatesFromRestrictionPayloadViewModels:", v68);
                  v69 = (void *)objc_claimAutoreleasedReturnValue();

                  v70 = (void *)objc_msgSend(v69, "mutableCopy");
                  -[DMCProfilePayloadSection setPayloadViewModels:](v175, "setPayloadViewModels:", v70);

                }
                -[DMCProfilePayloadSection payloadViewModels](v175, "payloadViewModels");
                v71 = (void *)objc_claimAutoreleasedReturnValue();
                v48 = objc_msgSend(v71, "count");

              }
              objc_msgSend(v51, "localizedDescriptionForPayloadCount:", v48);
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              if (v72)
                objc_msgSend(v159, "addObject:", v72);
              if (v175)
              {
                if ((unint64_t)objc_msgSend(v158, "countForObject:", v51) > 1)
                  objc_msgSend(v51, "localizedPluralForm");
                else
                  objc_msgSend(v51, "localizedSingularForm");
                v74 = (void *)objc_claimAutoreleasedReturnValue();
                -[DMCProfilePayloadSection setSectionTitle:](v175, "setSectionTitle:", v74);

                objc_msgSend(a1, "_warningTextFromPayload:", v50);
                v75 = (void *)objc_claimAutoreleasedReturnValue();
                -[DMCProfilePayloadSection setSectionFooter:](v175, "setSectionFooter:", v75);

                objc_msgSend(v174, "addObject:", v175);
              }

              v53 = 0x24D52D000;
            }
            v73 = objc_alloc_init(DMCProfilePayloadSection);

            v48 = 0;
            v49 = v169;
          }
          if (v49 != v57)
          {
            if (objc_msgSend(v174, "count") && (unint64_t)(v49 - 2) >= 2)
            {
              v76 = v156;
              if (v49 != 1)
              {
                v76 = v154;
                if (v49 != 4)
                  v76 = v153;
              }
              objc_msgSend(v76, "addObjectsFromArray:", v174);
            }
            v77 = objc_opt_new();

            v174 = (void *)v77;
          }
          v48 += objc_msgSend(v58, "count");
          v175 = v73;
          -[DMCProfilePayloadSection payloadViewModels](v73, "payloadViewModels");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "addObjectsFromArray:", v58);

          v79 = v55;
          v50 = v79;
          v49 = v57;
          v51 = (void *)v56;
          v47 = v167;
        }
        objc_autoreleasePoolPop(contexta);
      }
      v173 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v187, v205, 16);
    }
    while (v173);
  }
  else
  {
    v174 = 0;
    v175 = 0;
    v49 = 0;
    v50 = 0;
    v51 = 0;
  }
  v80 = (void *)v47;
  v81 = v49;

  -[DMCProfilePayloadSection payloadViewModels](v175, "payloadViewModels");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = objc_msgSend(v82, "count");

  v84 = v165;
  if (v83 && v51)
  {
    if (v51 == (void *)objc_opt_class())
    {
      -[DMCProfilePayloadSection payloadViewModels](v175, "payloadViewModels");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      +[DMCPayloadViewModel removeDuplicatesFromRestrictionPayloadViewModels:](DMCPayloadViewModel, "removeDuplicatesFromRestrictionPayloadViewModels:", v85);
      v86 = (void *)objc_claimAutoreleasedReturnValue();

      v87 = (void *)objc_msgSend(v86, "mutableCopy");
      -[DMCProfilePayloadSection setPayloadViewModels:](v175, "setPayloadViewModels:", v87);

      -[DMCProfilePayloadSection payloadViewModels](v175, "payloadViewModels");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v88, "count");

    }
    objc_msgSend(v51, "localizedDescriptionForPayloadCount:", v48);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v159, "addObject:", v89);
    objc_msgSend(v51, "localizedParenthesizedFormDescriptionForPayloadCount:", objc_msgSend(v158, "countForObject:", v51));
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCProfilePayloadSection setSectionTitle:](v175, "setSectionTitle:", v90);
    objc_msgSend(a1, "_warningTextFromPayload:", v50);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCProfilePayloadSection setSectionFooter:](v175, "setSectionFooter:", v91);

    objc_msgSend(v174, "addObject:", v175);
  }
  v160 = v50;
  if (objc_msgSend(v174, "count") && (unint64_t)(v81 - 2) >= 2)
  {
    v92 = v154;
    if (v81 != 4)
      v92 = v153;
    if (v81 == 1)
      v93 = v156;
    else
      v93 = v92;
    objc_msgSend(v93, "addObjectsFromArray:", v174);
  }
  if (a5 != 1)
  {
    objc_msgSend(v165, "signerCertificates");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = (void *)objc_opt_new();
    v183 = 0u;
    v184 = 0u;
    v185 = 0u;
    v186 = 0u;
    v96 = v94;
    v97 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v183, v204, 16);
    if (v97)
    {
      v98 = v97;
      v99 = *(_QWORD *)v184;
      do
      {
        for (n = 0; n != v98; ++n)
        {
          if (*(_QWORD *)v184 != v99)
            objc_enumerationMutation(v96);
          v101 = *(void **)(*((_QWORD *)&v183 + 1) + 8 * n);
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          v103 = objc_msgSend(v101, "isEqual:", v102);

          if ((v103 & 1) == 0)
            objc_msgSend(v95, "addObject:", v101);
        }
        v98 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v183, v204, 16);
      }
      while (v98);
    }

    objc_opt_class();
    v84 = v165;
    if ((objc_opt_isKindOfClass() & 1) == 0 && objc_msgSend(v95, "count"))
    {
      if ((unint64_t)objc_msgSend(v95, "count") <= 1)
        v104 = CFSTR("DMC_SIGNING_CERTIFICATE");
      else
        v104 = CFSTR("DMC_SIGNING_CERTIFICATES");
      DMCEnrollmentLocalizedString(v104);
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      v106 = -[DMCProfilePayloadSection initWithSectionTitle:footer:payloadViewModels:]([DMCProfilePayloadSection alloc], "initWithSectionTitle:footer:payloadViewModels:", v105, 0, v95);
      objc_msgSend(v153, "addObject:", v106);

    }
  }
  objc_msgSend(v84, "localizedManagedProfileConsentTexts");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v107, "count"))
  {
    v108 = (void *)objc_opt_new();
    v179 = 0u;
    v180 = 0u;
    v181 = 0u;
    v182 = 0u;
    v109 = v107;
    v110 = objc_msgSend(v109, "countByEnumeratingWithState:objects:count:", &v179, v203, 16);
    if (v110)
    {
      v111 = v110;
      v112 = *(_QWORD *)v180;
      do
      {
        for (ii = 0; ii != v111; ++ii)
        {
          if (*(_QWORD *)v180 != v112)
            objc_enumerationMutation(v109);
          v114 = *(_QWORD *)(*((_QWORD *)&v179 + 1) + 8 * ii);
          objc_msgSend(v109, "objectForKeyedSubscript:", v114);
          v115 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "_consentModelWithProfileName:consentString:", v114, v115);
          v116 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v108, "addObject:", v116);
        }
        v111 = objc_msgSend(v109, "countByEnumeratingWithState:objects:count:", &v179, v203, 16);
      }
      while (v111);
    }

    if ((unint64_t)objc_msgSend(v109, "count") <= 1)
      v117 = CFSTR("DMC_CONSENT_NOTICE");
    else
      v117 = CFSTR("DMC_CONSENT_NOTICES");
    DMCEnrollmentLocalizedString(v117);
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    v119 = -[DMCProfilePayloadSection initWithSectionTitle:footer:payloadViewModels:]([DMCProfilePayloadSection alloc], "initWithSectionTitle:footer:payloadViewModels:", v118, 0, v108);
    objc_msgSend(v153, "addObject:", v119);
    if ((unint64_t)objc_msgSend(v109, "count") >= 2)
    {
      v120 = (void *)MEMORY[0x24BDD17C8];
      DMCEnrollmentLocalizedString(CFSTR("DMC_CONSENT_NOTICES_%@"));
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v109, "count"));
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v120, "stringWithFormat:", v121, v122);
      v123 = objc_claimAutoreleasedReturnValue();

      v118 = (void *)v123;
    }
    objc_msgSend(v159, "addObject:", v118);

    v84 = v165;
  }
  contextb = v107;
  +[DMCEnrollmentFlowManagedConfigurationHelper organizationNameFromProfile:payload:](DMCEnrollmentFlowManagedConfigurationHelper, "organizationNameFromProfile:payload:", v84, v152);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v125 = [DMCProfileInfoSection alloc];
  DMCEnrollmentLocalizedString(CFSTR("DMC_ORGANIZATION"));
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v127 = -[DMCProfileInfoSection initWithSectionTitle:footer:text:](v125, "initWithSectionTitle:footer:text:", v126, 0, v124);
  objc_msgSend(v80, "addObject:", v127);

  v128 = (void *)MEMORY[0x24BDD17C8];
  DMCEnrollmentLocalizedString(CFSTR("DMC_SIGNED_BY"));
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "stringWithFormat:", CFSTR("%@ "), v129);
  v130 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_signedByStringFromProfile:", v84);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  v132 = -[DMCProfileInfoSection initWithSectionTitle:footer:attributedText:]([DMCProfileInfoSection alloc], "initWithSectionTitle:footer:attributedText:", v130, 0, v131);
  objc_msgSend(v80, "addObject:", v132);

  objc_msgSend(v84, "localizedConsentText");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  v134 = v84;
  v135 = objc_msgSend(v133, "length");

  if (v135)
  {
    v136 = (void *)MEMORY[0x24BDD17C8];
    DMCEnrollmentLocalizedString(CFSTR("DMC_INSTALL_CONSENT_MESSAGE_FROM_%@"));
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v136, "stringWithFormat:", v137, v124);
    v138 = (void *)objc_claimAutoreleasedReturnValue();

    v139 = [DMCProfileInfoSection alloc];
    objc_msgSend(v134, "localizedConsentText");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    v141 = -[DMCProfileInfoSection initWithSectionTitle:footer:text:](v139, "initWithSectionTitle:footer:text:", v138, 0, v140);
    objc_msgSend(v80, "addObject:", v141);

  }
  if (objc_msgSend(v156, "count"))
    v142 = v156;
  else
    v142 = 0;
  objc_msgSend(v157, "setAccountSections:", v142);
  if (objc_msgSend(v153, "count"))
    v143 = v153;
  else
    v143 = 0;
  objc_msgSend(v157, "setMoreDetailsSections:", v143);
  if (objc_msgSend(v154, "count"))
    v144 = v154;
  else
    v144 = 0;
  objc_msgSend(v157, "setRestrictionSections:", v144);
  if (objc_msgSend(v159, "count"))
    v145 = v159;
  else
    v145 = 0;
  objc_msgSend(v157, "setPayloadInfoSectionSummaries:", v145);
  objc_msgSend(v157, "setByodInfoSections:", v80);
  v146 = v157;

  return v146;
}

+ (BOOL)_isInstalledMDMProfile:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unverifiedInstalledMDMProfileIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(a1, "_isMDMProfile:", v4))
  {
    objc_msgSend(v4, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", v6);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)_isMDMProfile:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v4 = objc_msgSend(v3, "isMDMProfile");
  else
    v4 = 0;

  return v4;
}

+ (id)_installedManagedAppIDs
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE60DA0], "managedAppIDsExcludeDDMApps:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    v3 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = v2;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
          if (objc_msgSend(v4, "applicationIsInstalled:", v10, (_QWORD)v12))
            objc_msgSend(v3, "addObject:", v10);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
  else
  {
    v3 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v3;
}

+ (id)_managedBooks
{
  return (id)objc_msgSend(MEMORY[0x24BE60DA0], "managedBooks");
}

+ (id)_sortedPayloads:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  id v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    if (!_sortedPayloads__classSortOrder)
    {
      v48 = (void *)MEMORY[0x24BDBCE30];
      v47 = objc_opt_class();
      v46 = objc_opt_class();
      v45 = objc_opt_class();
      v44 = objc_opt_class();
      v43 = objc_opt_class();
      v42 = objc_opt_class();
      v41 = objc_opt_class();
      v40 = objc_opt_class();
      v39 = objc_opt_class();
      v38 = objc_opt_class();
      v37 = objc_opt_class();
      v36 = objc_opt_class();
      v35 = objc_opt_class();
      v34 = objc_opt_class();
      v33 = objc_opt_class();
      v32 = objc_opt_class();
      v31 = objc_opt_class();
      v30 = objc_opt_class();
      v29 = objc_opt_class();
      v28 = objc_opt_class();
      v27 = objc_opt_class();
      v26 = objc_opt_class();
      v5 = objc_opt_class();
      v6 = objc_opt_class();
      v7 = objc_opt_class();
      v8 = objc_opt_class();
      v9 = objc_opt_class();
      v10 = objc_opt_class();
      v11 = objc_opt_class();
      v12 = objc_opt_class();
      objc_msgSend(v48, "arrayWithObjects:", v47, v46, v45, v44, v43, v42, v41, v40, v39, v38, v37, v36, v35, v34, v33, v32, v31,
        v30,
        v29,
        v28,
        v27,
        v26,
        v5,
        v6,
        v7,
        v8,
        v9,
        v10,
        v11,
        v12,
        objc_opt_class(),
        0);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)_sortedPayloads__classSortOrder;
      _sortedPayloads__classSortOrder = v13;

    }
    v15 = (void *)objc_msgSend(v4, "mutableCopy");
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v17 = (id)_sortedPayloads__classSortOrder;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v50;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v50 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(a1, "_addObjectsOfClass:fromArray:toArray:", *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * v21++), v15, v16);
        }
        while (v19 != v21);
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
      }
      while (v19);
    }

    while (objc_msgSend(v15, "count"))
    {
      objc_msgSend(v15, "objectAtIndex:", 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_opt_class();

      objc_msgSend(a1, "_addObjectsOfClass:fromArray:toArray:", v23, v15, v16);
    }
    v24 = (id)objc_msgSend(v16, "copy");

  }
  else
  {
    v24 = v4;
  }

  return v24;
}

+ (void)_addObjectsOfClass:(Class)a3 fromArray:(id)a4 toArray:(id)a5
{
  id v7;
  unint64_t v8;
  void *v9;
  id v10;

  v10 = a4;
  v7 = a5;
  if (objc_msgSend(v10, "count") && objc_msgSend(v10, "count"))
  {
    v8 = 0;
    do
    {
      if (v8 >= objc_msgSend(v10, "count"))
        break;
      objc_msgSend(v10, "objectAtIndex:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (Class)objc_opt_class() == a3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        ++v8;
      }
      else
      {
        objc_msgSend(v7, "addObject:", v9);
        objc_msgSend(v10, "removeObjectAtIndex:", v8);
      }

    }
    while (objc_msgSend(v10, "count"));
  }

}

+ (id)_localizedPayloadSummaryByType:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  v7 = v5;
  if (!v6)
    goto LABEL_18;
  v8 = v6;
  v9 = 0;
  v10 = 0;
  v11 = *(_QWORD *)v17;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v17 != v11)
        objc_enumerationMutation(v5);
      v13 = objc_opt_class();
      if (v13 != objc_opt_class())
      {
        if (v10 == (void *)v13)
        {
          ++v9;
        }
        else
        {
          if (v10 && v9)
          {
            objc_msgSend(v10, "localizedDescriptionForPayloadCount:", v9, v16);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v14);

          }
          v9 = 1;
          v10 = (void *)v13;
        }
      }
    }
    v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  }
  while (v8);

  if (v10 && v9)
  {
    objc_msgSend(v10, "localizedDescriptionForPayloadCount:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v7);
LABEL_18:

  }
  return v4;
}

+ (id)_warningTextFromPayload:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;

  objc_msgSend(a3, "installationWarnings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __53__DMCProfilePayloadsSummary__warningTextFromPayload___block_invoke;
  v9[3] = &unk_24D52ECA0;
  v10 = v4;
  v5 = v4;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v9);
  if (objc_msgSend(v5, "length"))
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

void __53__DMCProfilePayloadsSummary__warningTextFromPayload___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if (a3)
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v7, "localizedBody");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:", v6);

}

+ (id)_signedByStringFromProfile:(id)a3
{
  id v3;
  __CFString *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "signerSummary");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!-[__CFString length](v4, "length"))
  {

    v4 = &stru_24D52F990;
  }
  v5 = (void *)objc_opt_new();
  if (objc_msgSend(v3, "isSigned"))
  {
    v6 = objc_alloc(MEMORY[0x24BDD1458]);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ · "), v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithString:", v7);
    objc_msgSend(v5, "appendAttributedString:", v8);

  }
  +[DMCProfileViewModel trustTextForProfile:](DMCProfileViewModel, "trustTextForProfile:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v5, "appendAttributedString:", v9);

  return v5;
}

+ (id)_consentModelWithProfileName:(id)a3 consentString:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v5 = (objc_class *)MEMORY[0x24BE63C68];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithLocalizedString:localizedKey:", 0, v6);

  v9 = (void *)MEMORY[0x24BE63C70];
  v17[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sectionWithKeyValues:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  DMCEnrollmentLocalizedString(CFSTR("DMC_CONSENT_NOTICE"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSectionTitle:", v12);

  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setType:", 5);
  objc_msgSend(v13, "setTitle:", v7);
  objc_msgSend(v13, "setFriendlyName:", v7);

  objc_msgSend(v13, "setShowIcon:", 0);
  objc_msgSend(v13, "setHasDetails:", 1);
  v16 = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v16, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setPayloadDescriptionKeyValueSections:", v14);

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  -[DMCProfilePayloadsSummary managedAppleID](self, "managedAppleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("managedAppleID"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[DMCProfilePayloadsSummary finalInstallationWarningStyle](self, "finalInstallationWarningStyle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("finalInstallationWarningStyle"));

  -[DMCProfilePayloadsSummary accountSections](self, "accountSections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("accountSections"));

  -[DMCProfilePayloadsSummary managedAppSections](self, "managedAppSections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("managedAppSections"));

  -[DMCProfilePayloadsSummary managedBookSections](self, "managedBookSections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("managedBookSections"));

  -[DMCProfilePayloadsSummary moreDetailsSections](self, "moreDetailsSections");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("moreDetailsSections"));

  -[DMCProfilePayloadsSummary restrictionSections](self, "restrictionSections");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("restrictionSections"));

  -[DMCProfilePayloadsSummary byodInfoSections](self, "byodInfoSections");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("byodInfoSections"));

  -[DMCProfilePayloadsSummary payloadInfoSectionSummaries](self, "payloadInfoSectionSummaries");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("payloadInfoSectionSummaries"));

}

- (DMCProfilePayloadsSummary)initWithCoder:(id)a3
{
  id v4;
  DMCProfilePayloadsSummary *v5;
  void *v6;
  uint64_t v7;
  NSString *managedAppleID;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSArray *accountSections;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSArray *managedAppSections;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSArray *managedBookSections;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  NSArray *moreDetailsSections;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  NSArray *restrictionSections;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  NSArray *byodInfoSections;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  NSArray *payloadInfoSectionSummaries;
  objc_super v46;

  v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)DMCProfilePayloadsSummary;
  v5 = -[DMCProfilePayloadsSummary init](&v46, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("managedAppleID"));
    v7 = objc_claimAutoreleasedReturnValue();
    managedAppleID = v5->_managedAppleID;
    v5->_managedAppleID = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("finalInstallationWarningStyle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_finalInstallationWarningStyle = objc_msgSend(v9, "integerValue");

    v10 = (void *)MEMORY[0x24BDBCF20];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("accountSections"));
    v13 = objc_claimAutoreleasedReturnValue();
    accountSections = v5->_accountSections;
    v5->_accountSections = (NSArray *)v13;

    v15 = (void *)MEMORY[0x24BDBCF20];
    v16 = objc_opt_class();
    objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("managedAppSections"));
    v18 = objc_claimAutoreleasedReturnValue();
    managedAppSections = v5->_managedAppSections;
    v5->_managedAppSections = (NSArray *)v18;

    v20 = (void *)MEMORY[0x24BDBCF20];
    v21 = objc_opt_class();
    objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v22, CFSTR("managedBookSections"));
    v23 = objc_claimAutoreleasedReturnValue();
    managedBookSections = v5->_managedBookSections;
    v5->_managedBookSections = (NSArray *)v23;

    v25 = (void *)MEMORY[0x24BDBCF20];
    v26 = objc_opt_class();
    objc_msgSend(v25, "setWithObjects:", v26, objc_opt_class(), 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v27, CFSTR("moreDetailsSections"));
    v28 = objc_claimAutoreleasedReturnValue();
    moreDetailsSections = v5->_moreDetailsSections;
    v5->_moreDetailsSections = (NSArray *)v28;

    v30 = (void *)MEMORY[0x24BDBCF20];
    v31 = objc_opt_class();
    objc_msgSend(v30, "setWithObjects:", v31, objc_opt_class(), 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v32, CFSTR("restrictionSections"));
    v33 = objc_claimAutoreleasedReturnValue();
    restrictionSections = v5->_restrictionSections;
    v5->_restrictionSections = (NSArray *)v33;

    v35 = (void *)MEMORY[0x24BDBCF20];
    v36 = objc_opt_class();
    objc_msgSend(v35, "setWithObjects:", v36, objc_opt_class(), 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v37, CFSTR("byodInfoSections"));
    v38 = objc_claimAutoreleasedReturnValue();
    byodInfoSections = v5->_byodInfoSections;
    v5->_byodInfoSections = (NSArray *)v38;

    v40 = (void *)MEMORY[0x24BDBCF20];
    v41 = objc_opt_class();
    objc_msgSend(v40, "setWithObjects:", v41, objc_opt_class(), 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v42, CFSTR("payloadInfoSectionSummaries"));
    v43 = objc_claimAutoreleasedReturnValue();
    payloadInfoSectionSummaries = v5->_payloadInfoSectionSummaries;
    v5->_payloadInfoSectionSummaries = (NSArray *)v43;

  }
  return v5;
}

- (NSString)managedAppleID
{
  return self->_managedAppleID;
}

- (void)setManagedAppleID:(id)a3
{
  objc_storeStrong((id *)&self->_managedAppleID, a3);
}

- (int64_t)finalInstallationWarningStyle
{
  return self->_finalInstallationWarningStyle;
}

- (void)setFinalInstallationWarningStyle:(int64_t)a3
{
  self->_finalInstallationWarningStyle = a3;
}

- (NSArray)accountSections
{
  return self->_accountSections;
}

- (void)setAccountSections:(id)a3
{
  objc_storeStrong((id *)&self->_accountSections, a3);
}

- (NSArray)managedAppSections
{
  return self->_managedAppSections;
}

- (void)setManagedAppSections:(id)a3
{
  objc_storeStrong((id *)&self->_managedAppSections, a3);
}

- (NSArray)managedBookSections
{
  return self->_managedBookSections;
}

- (void)setManagedBookSections:(id)a3
{
  objc_storeStrong((id *)&self->_managedBookSections, a3);
}

- (NSArray)moreDetailsSections
{
  return self->_moreDetailsSections;
}

- (void)setMoreDetailsSections:(id)a3
{
  objc_storeStrong((id *)&self->_moreDetailsSections, a3);
}

- (NSArray)restrictionSections
{
  return self->_restrictionSections;
}

- (void)setRestrictionSections:(id)a3
{
  objc_storeStrong((id *)&self->_restrictionSections, a3);
}

- (NSArray)byodInfoSections
{
  return self->_byodInfoSections;
}

- (void)setByodInfoSections:(id)a3
{
  objc_storeStrong((id *)&self->_byodInfoSections, a3);
}

- (NSArray)payloadInfoSectionSummaries
{
  return self->_payloadInfoSectionSummaries;
}

- (void)setPayloadInfoSectionSummaries:(id)a3
{
  objc_storeStrong((id *)&self->_payloadInfoSectionSummaries, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadInfoSectionSummaries, 0);
  objc_storeStrong((id *)&self->_byodInfoSections, 0);
  objc_storeStrong((id *)&self->_restrictionSections, 0);
  objc_storeStrong((id *)&self->_moreDetailsSections, 0);
  objc_storeStrong((id *)&self->_managedBookSections, 0);
  objc_storeStrong((id *)&self->_managedAppSections, 0);
  objc_storeStrong((id *)&self->_accountSections, 0);
  objc_storeStrong((id *)&self->_managedAppleID, 0);
}

@end
