@implementation ABAssistantSyncWorker

- (ABAssistantSyncWorker)initWithDelegate:(id)a3
{
  id v4;
  ABAssistantSyncWorker *v5;
  const char *v6;
  ABAssistantSyncWorker *v7;
  const char *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ABAssistantSyncWorker;
  v5 = -[ABAssistantSyncWorker init](&v10, sel_init);
  v7 = v5;
  if (v5)
  {
    objc_msgSend_setDelegate_(v5, v6, (uint64_t)v4);
    objc_msgSend_setSyncAvailable_(v7, v8, 1);
  }

  return v7;
}

- (void)beginSyncWithAnchor:(id)a3 validity:(id)a4 forKey:(id)a5 beginInfo:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  os_log_t *v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  const char *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  os_log_t v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  const char *v50;
  const char *v51;
  uint64_t v52;
  os_log_t v53;
  const char *v54;
  const char *v55;
  uint64_t v56;
  NSObject *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  NSObject *v77;
  const char *v78;
  uint64_t v79;
  NSObject *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  const char *v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  const char *v103;
  char *v104;
  uint64_t v105;
  const char *v106;
  uint64_t v107;
  NSObject *v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  const char *v117;
  uint64_t v118;
  const char *v119;
  uint64_t v120;
  void *v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  const char *v125;
  void *v126;
  const char *v127;
  uint64_t v128;
  int v129;
  const char *v130;
  uint64_t v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  const char *v135;
  NSObject *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  void *v144;
  NSObject *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  os_log_t v151;
  uint64_t v152;
  void *v153;
  uint64_t v154;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  void *v158;
  const char *v159;
  void *v160;
  const char *v161;
  uint64_t v162;
  int v163;
  ABAssistantSyncAnchor *v164;
  const char *v165;
  uint64_t v166;
  uint64_t v167;
  const char *v168;
  NSObject *v169;
  const char *v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  const char *v177;
  void *v178;
  const char *v179;
  const char *v180;
  uint64_t v181;
  void *v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  const char *v186;
  os_log_t v187;
  const char *v188;
  uint64_t v189;
  const char *v190;
  uint64_t v191;
  NSObject *v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  id v200;
  void *v201;
  id v202;
  void *v203;
  id v204;
  uint8_t buf[4];
  const char *v206;
  __int16 v207;
  id v208;
  __int16 v209;
  id v210;
  __int16 v211;
  id v212;
  uint64_t v213;

  v213 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (os_log_t *)MEMORY[0x24BE08FE8];
  v15 = *MEMORY[0x24BE08FE8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FE8], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    v206 = "-[ABAssistantSyncWorker beginSyncWithAnchor:validity:forKey:beginInfo:]";
    v207 = 2112;
    v208 = v10;
    v209 = 2112;
    v210 = v11;
    v211 = 2112;
    v212 = v12;
    _os_log_debug_impl(&dword_21633D000, v15, OS_LOG_TYPE_DEBUG, "%s > beginSyncWithAnchor:%@ validity:%@ forKey:%@", buf, 0x2Au);
  }
  objc_msgSend_delegate(self, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_validateKey_(self, v19, (uint64_t)v12);
  objc_msgSend_setChangeHistoryClientIdentifier_(v18, v20, (uint64_t)v12);
  objc_msgSend_registerChangeHistoryClientIdentifier_(self, v21, (uint64_t)v12);
  objc_msgSend_getCurrentValidity(self, v22, v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v204 = v11;
    if ((objc_msgSend_isEqualToString_(v11, v24, (uint64_t)v25) & 1) == 0)
    {
      if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEBUG))
        sub_2163457E4();
      objc_msgSend_resetWithValidity_(v13, v28, (uint64_t)v25);
      objc_msgSend_resetCurrentSyncSnapshot(v18, v29, v30);

      v10 = 0;
    }
    objc_msgSend_contactStore(v18, v26, v27);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v202 = v10;
    objc_msgSend_anchorWithString_forContactStore_(ABAssistantSyncAnchor, v32, (uint64_t)v10, v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEBUG))
      sub_216345774();
    objc_msgSend_getLastClearedSyncAnchor(v18, v34, v35);
    v36 = objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_shouldFullSync(v33, v37, v38) & 1) == 0
      && objc_msgSend_isOlderThanAnchor_(v33, v39, v36))
    {
      v41 = *v14;
      if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEBUG))
        sub_2163456E0(v41);
      objc_msgSend_resetSync(v33, v42, v43);
    }
    if (objc_msgSend_shouldResetSync(v33, v39, v40)
      && objc_msgSend_hasContactsForFullSync(v18, v44, v45))
    {
      if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEBUG))
        sub_216345670();
      objc_msgSend_resetWithValidity_(v13, v46, (uint64_t)v25);
      objc_msgSend_resetCurrentSyncSnapshot(v18, v47, v48);
      objc_msgSend_unregisterChangeHistoryClientIdentifier_(self, v49, (uint64_t)v12);
      objc_msgSend_registerChangeHistoryClientIdentifier_(self, v50, (uint64_t)v12);
    }
    if (objc_msgSend_shouldClearChangeHistoryForPreviouslySyncedContacts(v33, v44, v45))
    {
      v53 = *v14;
      if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEBUG))
        sub_2163455DC(v53);
      objc_msgSend_clearChangeHistoryToSyncAnchor_(v18, v54, (uint64_t)v33);
    }
    v203 = (void *)v36;
    if (objc_msgSend_shouldFullSync(v33, v51, v52))
    {
      v57 = *v14;
      if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEBUG))
        sub_21634556C(v57, (uint64_t)v58, v59, v60, v61, v62, v63, v64);
      v200 = v13;
      if ((objc_msgSend_shouldResumePreviousFullSync(v33, v58, v59) & 1) == 0)
      {
        objc_msgSend_contactStore(v18, v65, v66);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = objc_msgSend_saveSequenceCount(v67, v68, v69);

        objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v71, v70);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_fullSyncSnapshotProperty(v18, v73, v74);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_saveValue_forKey_(ABAssistantSyncInfoPersistence, v76, (uint64_t)v72, v75);

        v77 = *v14;
        if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEBUG))
          sub_2163454E8(v70, v77);
        objc_msgSend_resetCurrentSyncSnapshot(v18, v78, v79, v200);
      }
      v80 = *v14;
      if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEBUG))
        sub_216345478(v80, (uint64_t)v81, v82, v83, v84, v85, v86, v87);
      objc_msgSend_clearSyncCache(self, v81, v82, v200);
      objc_msgSend_contactsForFullSync(v18, v88, v89);
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setAllContacts_(self, v91, (uint64_t)v90);

      objc_msgSend_allContacts(self, v92, v93);
      v94 = (void *)objc_claimAutoreleasedReturnValue();

      if (v94)
      {
        objc_msgSend_setSyncIndex_(self, v95, 0);
        objc_msgSend_allContacts(self, v97, v98);
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        v102 = objc_msgSend_count(v99, v100, v101);
        objc_msgSend_setSyncCount_(self, v103, v102);

        v104 = *v14;
        if (os_log_type_enabled((os_log_t)v104, OS_LOG_TYPE_DEBUG))
          sub_21634536C(self, v104, v105);

        if (objc_msgSend_shouldResumePreviousFullSync(v33, v106, v107))
        {
          v108 = *v14;
          if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEBUG))
            sub_2163452FC(v108, (uint64_t)v109, v110, v111, v112, v113, v114, v115);
          while (1)
          {
            v116 = objc_msgSend_syncIndex(self, v109, v110);
            if (v116 >= objc_msgSend_syncCount(self, v117, v118))
              break;
            objc_msgSend_allContacts(self, v119, v120);
            v121 = (void *)objc_claimAutoreleasedReturnValue();
            v124 = objc_msgSend_syncIndex(self, v122, v123);
            objc_msgSend_objectAtIndexedSubscript_(v121, v125, v124);
            v126 = (void *)objc_claimAutoreleasedReturnValue();
            v129 = objc_msgSend_iOSLegacyIdentifier(v126, v127, v128);

            if (v129 > (int)objc_msgSend_contactLegacyIdentifier(v33, v130, v131))
            {
              v151 = *v14;
              if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEBUG))
                sub_2163451E4(v151, self, v129);
              goto LABEL_49;
            }
            v134 = objc_msgSend_syncIndex(self, v132, v133);
            objc_msgSend_setSyncIndex_(self, v135, v134 + 1);
          }
          v145 = *v14;
          if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEBUG))
            sub_21634528C(v145, (uint64_t)v95, v96, v146, v147, v148, v149, v150);
        }
      }
LABEL_49:
      objc_msgSend_allContacts(self, v95, v96);
      v152 = objc_claimAutoreleasedReturnValue();
      if (v152
        && (v153 = (void *)v152,
            v154 = objc_msgSend_syncIndex(self, v55, v56),
            v157 = objc_msgSend_syncCount(self, v155, v156),
            v153,
            v154 != v157))
      {
        v144 = v33;
      }
      else
      {
        objc_msgSend_fullSyncSnapshotProperty(v18, v55, v56);
        v158 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_valueForKey_(ABAssistantSyncInfoPersistence, v159, (uint64_t)v158);
        v160 = (void *)objc_claimAutoreleasedReturnValue();
        v163 = objc_msgSend_intValue(v160, v161, v162);

        v164 = [ABAssistantSyncAnchor alloc];
        v167 = objc_msgSend_contactLegacyIdentifier(v33, v165, v166);
        v144 = (void *)objc_msgSend_initWithSequenceNumber_contactLegacyIdentifier_(v164, v168, v163, v167);

        if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEBUG))
          sub_216345174();
      }
      v13 = v201;
      v10 = v202;
    }
    else
    {
      v144 = v33;
      v10 = v202;
    }
    if (!objc_msgSend_syncCount(self, v55, v56))
    {
      v169 = *v14;
      if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEBUG))
        sub_216345104(v169, (uint64_t)v170, v171, v172, v173, v174, v175, v176);
      objc_msgSend_clearSyncCache(self, v170, v171);
      v178 = (void *)objc_msgSend_copyChangeHistoryAfterSyncAnchor_(v18, v177, (uint64_t)v144);
      objc_msgSend_setContactsChanges_(self, v179, (uint64_t)v178);

      objc_msgSend_contactsChanges(self, v180, v181);
      v182 = (void *)objc_claimAutoreleasedReturnValue();
      v185 = objc_msgSend_count(v182, v183, v184);
      objc_msgSend_setSyncCount_(self, v186, v185);

      v187 = *v14;
      if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEBUG))
        sub_21634507C(v187);
      if (!objc_msgSend_syncCount(self, v188, v189))
        objc_msgSend_clearSyncCache(self, v190, v191);
    }
    v192 = *v14;
    if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEBUG))
      sub_21634500C(v192, v193, v194, v195, v196, v197, v198, v199);

    v11 = v204;
  }
  else
  {
    v136 = *v14;
    if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEBUG))
      sub_216344F9C(v136, v137, v138, v139, v140, v141, v142, v143);
  }

}

- (id)_saDomainObjectWithReadactMeCard:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  char isKindOfClass;
  id v9;
  const char *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend_delegate(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v9 = v4;
  v11 = v9;
  v12 = v9;
  if ((isKindOfClass & 1) != 0)
  {
    v13 = (void *)MEMORY[0x24BE19118];
    v24[0] = v9;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v10, (uint64_t)v24, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_contactStore(v7, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_markMeContactInPeople_usingStore_(v13, v18, (uint64_t)v14, v17);

    objc_msgSend_me(v11, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = v11;
    if (v21)
    {
      v22 = (void *)*MEMORY[0x24BE08FE8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FE8], OS_LOG_TYPE_DEBUG))
        sub_216345854(v22);
      _AFRedactedCopyPerson();
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v12;
}

- (void)getChangeAfterAnchor:(id)a3 changeInfo:(id)a4
{
  id v6;
  id v7;
  os_log_t *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  os_log_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  void *v37;
  const char *v38;
  void *v39;
  const char *v40;
  void *v41;
  const char *v42;
  os_log_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  void *v53;
  const char *v54;
  os_log_t v55;
  const char *v56;
  uint64_t v57;
  NSObject *v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  NSObject *v62;
  const char *v63;
  void *v64;
  const char *v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  int v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  void *v74;
  const char *v75;
  os_log_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  NSObject *v82;
  const char *v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  NSObject *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  NSObject *v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  const char *v110;
  const char *v111;
  uint64_t v112;
  void *v113;
  os_log_t v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  const char *v118;
  uint64_t v119;
  const char *v120;
  uint64_t v121;
  void *v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  const char *v126;
  void *v127;
  os_log_t v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  const char *v132;
  uint64_t v133;
  const char *v134;
  void *v135;
  void *v136;
  const char *v137;
  void *v138;
  const char *v139;
  const char *v140;
  os_log_t v141;
  const char *v142;
  uint64_t v143;
  NSObject *v144;
  const char *v145;
  uint64_t v146;
  void *v147;
  const char *v148;
  uint64_t v149;
  void *v150;
  NSObject *v151;
  const char *v152;
  void *v153;
  const char *v154;
  void *v155;
  const char *v156;
  os_log_t v157;
  void *v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  const char *v162;
  uint64_t v163;
  uint64_t v164;
  const char *v165;
  void *v166;
  const char *v167;
  os_log_t v168;
  const char *v169;
  uint64_t v170;
  void *v171;
  const char *v172;
  uint64_t v173;
  uint64_t v174;
  const char *v175;
  const char *v176;
  uint64_t v177;
  uint64_t v178;
  const char *v179;
  uint64_t v180;
  void *v181;
  const char *v182;
  uint64_t v183;
  uint64_t v184;
  const char *v185;
  uint64_t v186;
  void *v187;
  const char *v188;
  uint64_t v189;
  uint64_t v190;
  NSObject *v191;
  const char *v192;
  uint64_t v193;
  void *v194;
  const char *v195;
  uint64_t v196;
  const char *v197;
  uint64_t v198;
  NSObject *v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  NSObject *v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  NSObject *v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  NSObject *log;
  id v224;
  uint8_t buf[4];
  const char *v226;
  __int16 v227;
  uint64_t v228;
  __int16 v229;
  void *v230;
  __int16 v231;
  uint64_t v232;
  __int16 v233;
  uint64_t v234;
  uint64_t v235;

  v235 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (os_log_t *)MEMORY[0x24BE08FE8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FE8], OS_LOG_TYPE_DEBUG))
    sub_216345C30();
  objc_msgSend_delegate(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_syncAvailable(self, v12, v13) & 1) != 0)
  {
    v16 = objc_msgSend_syncIndex(self, v14, v15);
    v224 = v6;
    if (v16 < objc_msgSend_syncCount(self, v17, v18))
    {
      objc_msgSend_allContacts(self, v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        v24 = *v8;
        if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEBUG))
          sub_216345AC4(v24);
        while (1)
        {
          v27 = objc_msgSend_syncIndex(self, v25, v26);
          if (v27 >= objc_msgSend_syncCount(self, v28, v29))
          {
            v199 = *v8;
            if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEBUG))
              sub_216345A54(v199, v200, v201, v202, v203, v204, v205, v206);
            goto LABEL_44;
          }
          objc_msgSend_allContacts(self, v30, v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend_syncIndex(self, v33, v34);
          objc_msgSend_objectAtIndexedSubscript_(v32, v36, v35);
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          v39 = (void *)objc_msgSend_newSADomainObjectFromCNContact_(v11, v38, (uint64_t)v37);
          objc_msgSend__saDomainObjectWithReadactMeCard_(self, v40, (uint64_t)v39);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_(v7, v42, (uint64_t)v41);

          v43 = *v8;
          if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEBUG))
          {
            v82 = v43;
            objc_msgSend_object(v7, v83, v84);
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_identifier(v85, v86, v87);
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_postAnchor(v7, v89, v90);
            v91 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315650;
            v226 = "-[ABAssistantSyncWorker getChangeAfterAnchor:changeInfo:]";
            v227 = 2112;
            v228 = (uint64_t)v88;
            v229 = 2112;
            v230 = v91;
            _os_log_debug_impl(&dword_21633D000, v82, OS_LOG_TYPE_DEBUG, "%s change sync found next contact to sync, changeInfo.object=%@, changeInfo.postAnchor=%@", buf, 0x20u);

          }
          v46 = objc_msgSend_syncIndex(self, v44, v45);
          if (v46 >= objc_msgSend_syncCount(self, v47, v48) - 1)
          {
            objc_msgSend_fullSyncSnapshotProperty(v11, v49, v50);
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_valueForKey_(ABAssistantSyncInfoPersistence, v65, (uint64_t)v64);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            v69 = objc_msgSend_intValue(v66, v67, v68);

            v72 = objc_msgSend_iOSLegacyIdentifier(v37, v70, v71);
            objc_msgSend_stringValueWithSequenceNumber_contactLegacyIdentifier_(ABAssistantSyncAnchor, v73, v69, v72);
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setPostAnchor_(v7, v75, (uint64_t)v74);

            v76 = *v8;
            if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEBUG))
            {
              v58 = v76;
              objc_msgSend_postAnchor(v7, v92, v93);
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315394;
              v226 = "-[ABAssistantSyncWorker getChangeAfterAnchor:changeInfo:]";
              v227 = 2112;
              v228 = (uint64_t)v61;
              v62 = v58;
              v63 = "%s full sync synthesizing end anchor, changeInfo.postAnchor = %@";
              goto LABEL_18;
            }
          }
          else
          {
            v51 = objc_msgSend_iOSLegacyIdentifier(v37, v49, v50);
            objc_msgSend_stringValueForFullSyncWithContactLegacyIdentifier_(ABAssistantSyncAnchor, v52, v51);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setPostAnchor_(v7, v54, (uint64_t)v53);

            v55 = *v8;
            if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEBUG))
            {
              v58 = v55;
              objc_msgSend_postAnchor(v7, v59, v60);
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315394;
              v226 = "-[ABAssistantSyncWorker getChangeAfterAnchor:changeInfo:]";
              v227 = 2112;
              v228 = (uint64_t)v61;
              v62 = v58;
              v63 = "%s full sync record anchor, changeInfo.postAnchor = %@";
LABEL_18:
              _os_log_debug_impl(&dword_21633D000, v62, OS_LOG_TYPE_DEBUG, v63, buf, 0x16u);

            }
          }
          objc_msgSend_object(v7, v56, v57);
          v77 = (void *)objc_claimAutoreleasedReturnValue();

          v80 = objc_msgSend_syncIndex(self, v78, v79);
          objc_msgSend_setSyncIndex_(self, v81, v80 + 1);

          if (v77)
            goto LABEL_44;
        }
      }
      objc_msgSend_contactsChanges(self, v22, v23);
      v113 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v113)
        goto LABEL_44;
      v114 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEBUG))
        sub_2163459C8(v114);
      while (1)
      {
        v117 = objc_msgSend_syncIndex(self, v115, v116);
        if (v117 >= objc_msgSend_syncCount(self, v118, v119))
        {
          v207 = *v8;
          if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEBUG))
            sub_216345958(v207, v208, v209, v210, v211, v212, v213, v214);
          goto LABEL_44;
        }
        objc_msgSend_contactsChanges(self, v120, v121);
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        v125 = objc_msgSend_syncIndex(self, v123, v124);
        objc_msgSend_objectAtIndexedSubscript_(v122, v126, v125);
        v127 = (void *)objc_claimAutoreleasedReturnValue();

        v128 = *v8;
        if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEBUG))
        {
          log = v128;
          v178 = objc_msgSend_syncIndex(self, v176, v177);
          objc_msgSend_contactIdentifier(v127, v179, v180);
          v181 = (void *)objc_claimAutoreleasedReturnValue();
          v184 = objc_msgSend_changeType(v127, v182, v183);
          objc_msgSend_changeAnchor(v127, v185, v186);
          v187 = (void *)objc_claimAutoreleasedReturnValue();
          v190 = objc_msgSend_sequenceNumber(v187, v188, v189);
          *(_DWORD *)buf = 136316162;
          v226 = "-[ABAssistantSyncWorker getChangeAfterAnchor:changeInfo:]";
          v227 = 2048;
          v228 = v178;
          v229 = 2112;
          v230 = v181;
          v231 = 2048;
          v232 = v184;
          v233 = 2048;
          v234 = v190;
          _os_log_debug_impl(&dword_21633D000, log, OS_LOG_TYPE_DEBUG, "%s self.syncIndex = %li, contactIdentifier = %@, changeType = %li, sequenceNumber = %li", buf, 0x34u);

        }
        v131 = objc_msgSend_changeType(v127, v129, v130);
        objc_msgSend_contactIdentifier(v127, v132, v133);
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        if (v131 == 2)
        {
          v136 = (void *)objc_msgSend_newSADomainObjectFromDeletedContactIdentifier_(v11, v134, (uint64_t)v135);
          objc_msgSend__saDomainObjectWithReadactMeCard_(self, v137, (uint64_t)v136);
          v138 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_(v7, v139, (uint64_t)v138);

          objc_msgSend_setIsDelete_(v7, v140, 1);
          v141 = *v8;
          if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEBUG))
          {
            v144 = v141;
            objc_msgSend_object(v7, v145, v146);
            v147 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_identifier(v147, v148, v149);
            v150 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315394;
            v226 = "-[ABAssistantSyncWorker getChangeAfterAnchor:changeInfo:]";
            v227 = 2112;
            v228 = (uint64_t)v150;
            v151 = v144;
            v152 = "%s change sync found next contact to sync, changeInfo.isDelete=YES, changeInfo.object=%@";
LABEL_39:
            _os_log_debug_impl(&dword_21633D000, v151, OS_LOG_TYPE_DEBUG, v152, buf, 0x16u);

          }
        }
        else
        {
          v153 = (void *)objc_msgSend_newSADomainObjectFromCNContactWithIdentifier_(v11, v134, (uint64_t)v135);
          objc_msgSend__saDomainObjectWithReadactMeCard_(self, v154, (uint64_t)v153);
          v155 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_(v7, v156, (uint64_t)v155);

          v157 = *v8;
          if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEBUG))
          {
            v144 = v157;
            objc_msgSend_object(v7, v195, v196);
            v147 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_identifier(v147, v197, v198);
            v150 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315394;
            v226 = "-[ABAssistantSyncWorker getChangeAfterAnchor:changeInfo:]";
            v227 = 2112;
            v228 = (uint64_t)v150;
            v151 = v144;
            v152 = "%s change sync found next contact to sync, changeInfo.object=%@";
            goto LABEL_39;
          }
        }
        objc_msgSend_changeAnchor(v127, v142, v143);
        v158 = (void *)objc_claimAutoreleasedReturnValue();
        v161 = objc_msgSend_sequenceNumber(v158, v159, v160);
        v164 = objc_msgSend_iOSLegacyIdentifier(v127, v162, v163);
        objc_msgSend_stringValueWithSequenceNumber_contactLegacyIdentifier_(ABAssistantSyncAnchor, v165, v161, v164);
        v166 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setPostAnchor_(v7, v167, (uint64_t)v166);

        v168 = *v8;
        if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEBUG))
        {
          v191 = v168;
          objc_msgSend_postAnchor(v7, v192, v193);
          v194 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v226 = "-[ABAssistantSyncWorker getChangeAfterAnchor:changeInfo:]";
          v227 = 2112;
          v228 = (uint64_t)v194;
          _os_log_debug_impl(&dword_21633D000, v191, OS_LOG_TYPE_DEBUG, "%s change sync anchor, changeInfo.postAnchor = %@", buf, 0x16u);

        }
        objc_msgSend_object(v7, v169, v170);
        v171 = (void *)objc_claimAutoreleasedReturnValue();

        v174 = objc_msgSend_syncIndex(self, v172, v173);
        objc_msgSend_setSyncIndex_(self, v175, v174 + 1);

        if (v171)
          goto LABEL_44;
      }
    }
    v102 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEBUG))
      sub_216345B50(v102, (uint64_t)v103, v104, v105, v106, v107, v108, v109);
    objc_msgSend_setPostAnchor_(v7, v103, (uint64_t)v6);
    objc_msgSend_setObject_(v7, v110, 0);
    objc_msgSend_clearSyncCache(self, v111, v112);
LABEL_44:
    v215 = *v8;
    v6 = v224;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEBUG))
      sub_2163458E8(v215, v216, v217, v218, v219, v220, v221, v222);
  }
  else
  {
    v94 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEBUG))
      sub_216345BC0(v94, v95, v96, v97, v98, v99, v100, v101);
  }

}

- (void)syncDidEnd
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = *MEMORY[0x24BE08FE8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FE8], OS_LOG_TYPE_DEBUG))
    sub_216345CA0(v3, (uint64_t)v4, v5, v6, v7, v8, v9, v10);
  objc_msgSend_clearSyncCache(self, v4, v5);
}

- (id)syncSnapshotForKey:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;

  v4 = a3;
  objc_msgSend_delegate(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setChangeHistoryClientIdentifier_(v7, v8, (uint64_t)v4);
  v9 = objc_alloc_init(MEMORY[0x24BE09380]);
  objc_msgSend_getCurrentValidity(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValidity_(v9, v13, (uint64_t)v12);

  v16 = objc_msgSend_currentSyncSnapshotCount(v7, v14, v15);
  objc_msgSend_setCount_(v9, v17, v16);
  objc_msgSend_currentSyncSnapshotAnchorString(v7, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAnchor_(v9, v21, (uint64_t)v20);

  v22 = (void *)*MEMORY[0x24BE08FE8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FE8], OS_LOG_TYPE_DEBUG))
    sub_216345D10((uint64_t)v4, v22, v9);

  return v9;
}

- (id)syncVerificationKeyForKey:(id)a3
{
  return (id)MEMORY[0x24BEDD108](a3, sel_stringByAppendingString_, CFSTR(".verification"));
}

- (void)clearSyncCache
{
  const char *v3;
  const char *v4;
  const char *v5;

  objc_msgSend_setSyncIndex_(self, a2, 0);
  objc_msgSend_setSyncCount_(self, v3, 0);
  objc_msgSend_setAllContacts_(self, v4, 0);
  objc_msgSend_setContactsChanges_(self, v5, 0);
}

- (id)getCurrentValidity
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  id v10;
  const char *v11;
  void *v12;
  id v14;

  objc_msgSend_delegate(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_contactStore(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend_identifierWithError_(v7, v8, (uint64_t)&v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v14;

  if (v9)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v11, (uint64_t)CFSTR("%i %@"), 16, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v10)
    {
      objc_msgSend_setSyncAvailable_(self, v11, 0);
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FE8], OS_LOG_TYPE_DEBUG))
        sub_216345E18();
    }
    v12 = 0;
  }

  return v12;
}

- (BOOL)validateKey:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  char hasPrefix;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;

  v4 = a3;
  objc_msgSend_delegate(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_expectedSyncKeyPrefix(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  hasPrefix = objc_msgSend_hasPrefix_(v4, v11, (uint64_t)v10);

  if ((hasPrefix & 1) == 0)
  {
    v13 = (void *)*MEMORY[0x24BE08FE8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FE8], OS_LOG_TYPE_DEBUG))
      sub_216345E88(v13);
    v16 = (void *)MEMORY[0x24BDBCE88];
    objc_msgSend_expectedSyncKeyPrefix(v7, v14, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v16, v18, (uint64_t)CFSTR("wrong key"), CFSTR("expecting key prefix %@"), v17);

  }
  return 1;
}

- (void)registerChangeHistoryClientIdentifier:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  id v12;
  const char *v13;
  id v14;

  v4 = a3;
  objc_msgSend_delegate(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_contactStore(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend_registerChangeHistoryClientIdentifier_error_(v10, v11, (uint64_t)v4, &v14);
  v12 = v14;

  if (v12)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FE8], OS_LOG_TYPE_DEBUG))
      sub_216345F1C();
    objc_msgSend_setSyncAvailable_(self, v13, 0);
  }

}

- (void)unregisterChangeHistoryClientIdentifier:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  id v12;
  const char *v13;
  id v14;

  v4 = a3;
  objc_msgSend_delegate(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_contactStore(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend_unregisterChangeHistoryClientIdentifier_error_(v10, v11, (uint64_t)v4, &v14);
  v12 = v14;

  if (v12)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FE8], OS_LOG_TYPE_DEBUG))
      sub_216345F94();
    objc_msgSend_setSyncAvailable_(self, v13, 0);
  }

}

- (ABAssistantSyncDelegate)delegate
{
  return (ABAssistantSyncDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)allContacts
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAllContacts:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSArray)contactsChanges
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setContactsChanges:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (int64_t)syncIndex
{
  return self->_syncIndex;
}

- (void)setSyncIndex:(int64_t)a3
{
  self->_syncIndex = a3;
}

- (int64_t)syncCount
{
  return self->_syncCount;
}

- (void)setSyncCount:(int64_t)a3
{
  self->_syncCount = a3;
}

- (BOOL)syncAvailable
{
  return self->_syncAvailable;
}

- (void)setSyncAvailable:(BOOL)a3
{
  self->_syncAvailable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactsChanges, 0);
  objc_storeStrong((id *)&self->_allContacts, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
