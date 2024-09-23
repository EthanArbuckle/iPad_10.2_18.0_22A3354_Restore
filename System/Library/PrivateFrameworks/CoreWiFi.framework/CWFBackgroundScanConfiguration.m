@implementation CWFBackgroundScanConfiguration

- (id)JSONCompatibleKeyValueMap
{
  id v3;
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  id v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  void *v98;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  _BYTE v108[128];
  _BYTE v109[128];
  uint64_t v110;

  v110 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v104 = 0u;
  v105 = 0u;
  v106 = 0u;
  v107 = 0u;
  objc_msgSend_networks(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v104, (uint64_t)v109, 16);
  if (v11)
  {
    v16 = v11;
    v17 = *(_QWORD *)v105;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v105 != v17)
          objc_enumerationMutation(v9);
        objc_msgSend_JSONCompatibleKeyValueMap(*(void **)(*((_QWORD *)&v104 + 1) + 8 * i), v12, v13, v14, v15);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v4, v20, (uint64_t)v19, v21, v22);

      }
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v104, (uint64_t)v109, 16);
    }
    while (v16);
  }

  objc_msgSend_setObject_forKeyedSubscript_(v3, v23, (uint64_t)v4, (uint64_t)CFSTR("networks"), v24);
  v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v100 = 0u;
  v101 = 0u;
  v102 = 0u;
  v103 = 0u;
  objc_msgSend_channels(self, v26, v27, v28, v29, 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v31, (uint64_t)&v100, (uint64_t)v108, 16);
  if (v32)
  {
    v37 = v32;
    v38 = *(_QWORD *)v101;
    do
    {
      for (j = 0; j != v37; ++j)
      {
        if (*(_QWORD *)v101 != v38)
          objc_enumerationMutation(v30);
        objc_msgSend_JSONCompatibleKeyValueMap(*(void **)(*((_QWORD *)&v100 + 1) + 8 * j), v33, v34, v35, v36);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v25, v41, (uint64_t)v40, v42, v43);

      }
      v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v33, (uint64_t)&v100, (uint64_t)v108, 16);
    }
    while (v37);
  }

  objc_msgSend_setObject_forKeyedSubscript_(v3, v44, (uint64_t)v25, (uint64_t)CFSTR("channels"), v45);
  v46 = (void *)MEMORY[0x1E0CB37E8];
  v51 = objc_msgSend_cacheEnabled(self, v47, v48, v49, v50);
  objc_msgSend_numberWithBool_(v46, v52, v51, v53, v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v56, (uint64_t)v55, (uint64_t)CFSTR("cacheEnabled"), v57);

  v58 = (void *)MEMORY[0x1E0CB37E8];
  v63 = objc_msgSend_cacheRollover(self, v59, v60, v61, v62);
  objc_msgSend_numberWithBool_(v58, v64, v63, v65, v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v68, (uint64_t)v67, (uint64_t)CFSTR("cacheRollover"), v69);

  v70 = (void *)MEMORY[0x1E0CB37E8];
  v75 = objc_msgSend_scanFrequency(self, v71, v72, v73, v74);
  objc_msgSend_numberWithUnsignedInteger_(v70, v76, v75, v77, v78);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v80, (uint64_t)v79, (uint64_t)CFSTR("scanFrequency"), v81);

  v82 = (void *)MEMORY[0x1E0CB37E8];
  v87 = objc_msgSend_lostNetworkScanCount(self, v83, v84, v85, v86);
  objc_msgSend_numberWithUnsignedInteger_(v82, v88, v87, v89, v90);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v92, (uint64_t)v91, (uint64_t)CFSTR("lostNetworkScanCount"), v93);

  sub_1B06475A8(v3, 0, 1u);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  if (v97)
  {
    objc_msgSend_dictionaryWithDictionary_(MEMORY[0x1E0C99D80], v94, (uint64_t)v97, v95, v96);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v98 = 0;
  }

  return v98;
}

- (BOOL)modified
{
  return *(&self->_cacheRollover + 1);
}

- (void)merge:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  int v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unsigned int v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  int v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  unsigned int v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  unint64_t v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  BOOL v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  CWFBackgroundScanConfiguration *v106;
  uint64_t v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  unint64_t v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  CWFBackgroundScanConfiguration *v124;
  uint64_t v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  CWFBackgroundScanConfiguration *v129;

  v129 = (CWFBackgroundScanConfiguration *)a3;
  if ((objc_msgSend_modifyMap(v129, v4, v5, v6, v7) & 2) != 0)
  {
    objc_msgSend_orderedSet(MEMORY[0x1E0C99E10], v8, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_networks(self, v13, v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObjectsFromArray_(v12, v18, (uint64_t)v17, v19, v20);

    objc_msgSend_networks(v129, v21, v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObjectsFromArray_(v12, v26, (uint64_t)v25, v27, v28);

    objc_msgSend_array(v12, v29, v30, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setNetworks_(self, v34, (uint64_t)v33, v35, v36);

  }
  if ((objc_msgSend_modifyMap(v129, v8, v9, v10, v11) & 1) != 0)
  {
    objc_msgSend_orderedSet(MEMORY[0x1E0C99E10], v37, v38, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_channels(self, v42, v43, v44, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObjectsFromArray_(v41, v47, (uint64_t)v46, v48, v49);

    objc_msgSend_channels(v129, v50, v51, v52, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObjectsFromArray_(v41, v55, (uint64_t)v54, v56, v57);

    objc_msgSend_array(v41, v58, v59, v60, v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setChannels_(self, v63, (uint64_t)v62, v64, v65);

  }
  if ((objc_msgSend_modifyMap(v129, v37, v38, v39, v40) & 4) != 0)
  {
    v70 = objc_msgSend_cacheEnabled(v129, v66, v67, v68, v69);
    v75 = objc_msgSend_cacheEnabled(self, v71, v72, v73, v74);
    objc_msgSend_setCacheEnabled_(self, v76, v70 | v75, v77, v78);
  }
  if ((objc_msgSend_modifyMap(v129, v66, v67, v68, v69) & 8) != 0)
  {
    v83 = objc_msgSend_cacheRollover(v129, v79, v80, v81, v82);
    v88 = objc_msgSend_cacheRollover(self, v84, v85, v86, v87);
    objc_msgSend_setCacheRollover_(self, v89, v83 | v88, v90, v91);
  }
  if ((objc_msgSend_modifyMap(v129, v79, v80, v81, v82) & 0x10) != 0)
  {
    v96 = objc_msgSend_scanFrequency(self, v92, v93, v94, v95);
    v101 = v96 >= objc_msgSend_scanFrequency(v129, v97, v98, v99, v100);
    v106 = v129;
    if (!v101)
      v106 = self;
    v107 = objc_msgSend_scanFrequency(v106, v102, v103, v104, v105);
    objc_msgSend_setScanFrequency_(self, v108, v107, v109, v110);
  }
  if ((objc_msgSend_modifyMap(v129, v92, v93, v94, v95) & 0x20) != 0)
  {
    v115 = objc_msgSend_lostNetworkScanCount(self, v111, v112, v113, v114);
    v101 = v115 >= objc_msgSend_lostNetworkScanCount(v129, v116, v117, v118, v119);
    v124 = v129;
    if (!v101)
      v124 = self;
    v125 = objc_msgSend_lostNetworkScanCount(v124, v120, v121, v122, v123);
    objc_msgSend_setLostNetworkScanCount_(self, v126, v125, v127, v128);
  }

}

- (void)setChannels:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned __int8 v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSArray *v17;
  NSArray *channels;

  v4 = a3;
  v9 = objc_msgSend_modifyMap(self, v5, v6, v7, v8);
  objc_msgSend_setModifyMap_(self, v10, v9 | 1u, v11, v12);
  v17 = (NSArray *)objc_msgSend_copy(v4, v13, v14, v15, v16);

  channels = self->_channels;
  self->_channels = v17;

}

- (void)setNetworks:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned __int8 v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSArray *v17;
  NSArray *networks;

  v4 = a3;
  v9 = objc_msgSend_modifyMap(self, v5, v6, v7, v8);
  objc_msgSend_setModifyMap_(self, v10, v9 | 2u, v11, v12);
  v17 = (NSArray *)objc_msgSend_copy(v4, v13, v14, v15, v16);

  networks = self->_networks;
  self->_networks = v17;

}

- (void)setCacheEnabled:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = objc_msgSend_modifyMap(self, a2, a3, v3, v4);
  objc_msgSend_setModifyMap_(self, v8, v7 | 4u, v9, v10);
  self->_cacheEnabled = a3;
}

- (void)setCacheRollover:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = objc_msgSend_modifyMap(self, a2, a3, v3, v4);
  objc_msgSend_setModifyMap_(self, v8, v7 | 8u, v9, v10);
  self->_cacheRollover = a3;
}

- (void)setScanFrequency:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = objc_msgSend_modifyMap(self, a2, a3, v3, v4);
  objc_msgSend_setModifyMap_(self, v8, v7 | 0x10u, v9, v10);
  self->_scanFrequency = a3;
}

- (void)setLostNetworkScanCount:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = objc_msgSend_modifyMap(self, a2, a3, v3, v4);
  objc_msgSend_setModifyMap_(self, v8, v7 | 0x20u, v9, v10);
  self->_lostNetworkScanCount = a3;
}

- (NSString)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  unsigned int v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  unsigned int v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v67;
  const char *v68;
  const char *v69;
  void *v70;

  v70 = (void *)MEMORY[0x1E0CB3940];
  v10 = "";
  if ((objc_msgSend_modifyMap(self, a2, v2, v3, v4) & 1) != 0)
    v11 = "*";
  else
    v11 = "";
  v69 = v11;
  objc_msgSend_channels(self, v6, v7, v8, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_modifyMap(self, v13, v14, v15, v16) & 2) != 0)
    v21 = "*";
  else
    v21 = "";
  v68 = v21;
  objc_msgSend_networks(self, v17, v18, v19, v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_modifyMap(self, v23, v24, v25, v26) & 4) != 0)
    v31 = "*";
  else
    v31 = "";
  v67 = v31;
  v32 = objc_msgSend_cacheEnabled(self, v27, v28, v29, v30);
  if ((objc_msgSend_modifyMap(self, v33, v34, v35, v36) & 8) != 0)
    v41 = "*";
  else
    v41 = "";
  v42 = objc_msgSend_cacheRollover(self, v37, v38, v39, v40);
  if ((objc_msgSend_modifyMap(self, v43, v44, v45, v46) & 0x10) != 0)
    v51 = "*";
  else
    v51 = "";
  v52 = objc_msgSend_scanFrequency(self, v47, v48, v49, v50);
  if ((objc_msgSend_modifyMap(self, v53, v54, v55, v56) & 0x20) != 0)
    v10 = "*";
  v61 = objc_msgSend_lostNetworkScanCount(self, v57, v58, v59, v60);
  objc_msgSend_stringWithFormat_(v70, v62, (uint64_t)CFSTR("channels%s=%@, networks%s=%@, cache%s=%d, rollover%s=%d, freq%s=%lu, lostNetScan%s=%lu"), v63, v64, v69, v12, v68, v22, v67, v32, v41, v42, v51, v52, v10, v61);
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v65;
}

- (BOOL)isEqualToBackgroundScanConfiguration:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v7;
  NSArray *channels;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSArray *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSArray *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  BOOL v28;
  NSArray *networks;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSArray *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSArray *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  int cacheEnabled;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  int cacheRollover;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t scanFrequency;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t lostNetworkScanCount;
  BOOL v60;
  void *v62;

  v7 = a3;
  channels = self->_channels;
  objc_msgSend_channels(v7, v9, v10, v11, v12);
  v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
  if (channels == v17)
    goto LABEL_7;
  if (self->_channels)
  {
    objc_msgSend_channels(v7, v13, v14, v15, v16);
    v18 = objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v3 = (void *)v18;
      v23 = self->_channels;
      objc_msgSend_channels(v7, v19, v20, v21, v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend_isEqual_(v23, v25, (uint64_t)v24, v26, v27))
      {
        v28 = 0;
LABEL_25:

        goto LABEL_26;
      }
      v62 = v24;
LABEL_7:
      networks = self->_networks;
      objc_msgSend_networks(v7, v13, v14, v15, v16);
      v34 = (NSArray *)objc_claimAutoreleasedReturnValue();
      if (networks != v34)
      {
        if (!self->_networks)
          goto LABEL_21;
        objc_msgSend_networks(v7, v30, v31, v32, v33);
        v35 = objc_claimAutoreleasedReturnValue();
        if (!v35)
          goto LABEL_19;
        v4 = (void *)v35;
        v40 = self->_networks;
        objc_msgSend_networks(v7, v36, v37, v38, v39);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend_isEqual_(v40, v41, (uint64_t)v5, v42, v43))
        {
          v28 = 0;
          v24 = v62;
LABEL_16:

          goto LABEL_22;
        }
      }
      cacheEnabled = self->_cacheEnabled;
      if (cacheEnabled == objc_msgSend_cacheEnabled(v7, v30, v31, v32, v33))
      {
        cacheRollover = self->_cacheRollover;
        if (cacheRollover == objc_msgSend_cacheRollover(v7, v45, v46, v47, v48))
        {
          scanFrequency = self->_scanFrequency;
          if (scanFrequency == objc_msgSend_scanFrequency(v7, v50, v51, v52, v53))
          {
            lostNetworkScanCount = self->_lostNetworkScanCount;
            v28 = lostNetworkScanCount == objc_msgSend_lostNetworkScanCount(v7, v55, v56, v57, v58);
            v60 = networks == v34;
            v24 = v62;
            if (v60)
              goto LABEL_22;
            goto LABEL_16;
          }
        }
      }
      if (networks != v34)
      {

LABEL_19:
        v28 = 0;
        v24 = v62;
        if (channels == v17)
          goto LABEL_26;
        goto LABEL_25;
      }
LABEL_21:
      v28 = 0;
      v24 = v62;
LABEL_22:

      if (channels == v17)
        goto LABEL_26;
      goto LABEL_25;
    }
  }
  v28 = 0;
LABEL_26:

  return v28;
}

- (BOOL)isEqual:(id)a3
{
  CWFBackgroundScanConfiguration *v4;
  CWFBackgroundScanConfiguration *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  char isEqualToBackgroundScanConfiguration;

  v4 = (CWFBackgroundScanConfiguration *)a3;
  v5 = v4;
  if (v4 == self)
  {
    isEqualToBackgroundScanConfiguration = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isEqualToBackgroundScanConfiguration = objc_msgSend_isEqualToBackgroundScanConfiguration_(self, v6, (uint64_t)v5, v7, v8);
  }
  else
  {
    isEqualToBackgroundScanConfiguration = 0;
  }

  return isEqualToBackgroundScanConfiguration;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = objc_msgSend_hash(self->_channels, a2, v2, v3, v4);
  return objc_msgSend_hash(self->_networks, v7, v8, v9, v10) ^ v6 ^ self->_cacheEnabled ^ (unint64_t)self->_cacheRollover ^ self->_scanFrequency ^ self->_lostNetworkScanCount;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;

  v6 = (void *)objc_msgSend_allocWithZone_(CWFBackgroundScanConfiguration, a2, (uint64_t)a3, v3, v4);
  v11 = (void *)objc_msgSend_init(v6, v7, v8, v9, v10);
  objc_msgSend_setChannels_(v11, v12, (uint64_t)self->_channels, v13, v14);
  objc_msgSend_setNetworks_(v11, v15, (uint64_t)self->_networks, v16, v17);
  objc_msgSend_setCacheEnabled_(v11, v18, self->_cacheEnabled, v19, v20);
  objc_msgSend_setCacheRollover_(v11, v21, self->_cacheRollover, v22, v23);
  objc_msgSend_setScanFrequency_(v11, v24, self->_scanFrequency, v25, v26);
  objc_msgSend_setLostNetworkScanCount_(v11, v27, self->_lostNetworkScanCount, v28, v29);
  objc_msgSend_setModifyMap_(v11, v30, *((unsigned __int8 *)&self->_cacheRollover + 1), v31, v32);
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *channels;
  id v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  id v30;

  channels = self->_channels;
  v5 = a3;
  objc_msgSend_encodeObject_forKey_(v5, v6, (uint64_t)channels, (uint64_t)CFSTR("_channels"), v7);
  objc_msgSend_encodeObject_forKey_(v5, v8, (uint64_t)self->_networks, (uint64_t)CFSTR("_networks"), v9);
  objc_msgSend_encodeBool_forKey_(v5, v10, self->_cacheEnabled, (uint64_t)CFSTR("_cacheEnabled"), v11);
  objc_msgSend_encodeBool_forKey_(v5, v12, self->_cacheRollover, (uint64_t)CFSTR("_cacheRollover"), v13);
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v14, self->_scanFrequency, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v18, (uint64_t)v17, (uint64_t)CFSTR("_scanFrequency"), v19);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v20, self->_lostNetworkScanCount, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v24, (uint64_t)v23, (uint64_t)CFSTR("_lostNetworkScanCount"), v25);

  objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v26, (uint64_t)(&self->_cacheRollover + 1), 1, v27);
  v30 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v28, (uint64_t)v30, (uint64_t)CFSTR("_modifyMap"), v29);

}

- (CWFBackgroundScanConfiguration)initWithCoder:(id)a3
{
  id v4;
  CWFBackgroundScanConfiguration *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  NSArray *channels;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  NSArray *networks;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  objc_super v57;

  v4 = a3;
  v57.receiver = self;
  v57.super_class = (Class)CWFBackgroundScanConfiguration;
  v5 = -[CWFBackgroundScanConfiguration init](&v57, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend_setWithObjects_(v6, v9, v7, v10, v11, v8, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v13, (uint64_t)v12, (uint64_t)CFSTR("_channels"), v14);
    v15 = objc_claimAutoreleasedReturnValue();
    channels = v5->_channels;
    v5->_channels = (NSArray *)v15;

    v17 = (void *)MEMORY[0x1E0C99E60];
    v18 = objc_opt_class();
    v19 = objc_opt_class();
    objc_msgSend_setWithObjects_(v17, v20, v18, v21, v22, v19, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v24, (uint64_t)v23, (uint64_t)CFSTR("_networks"), v25);
    v26 = objc_claimAutoreleasedReturnValue();
    networks = v5->_networks;
    v5->_networks = (NSArray *)v26;

    v5->_cacheEnabled = objc_msgSend_decodeBoolForKey_(v4, v28, (uint64_t)CFSTR("_cacheEnabled"), v29, v30);
    v5->_cacheRollover = objc_msgSend_decodeBoolForKey_(v4, v31, (uint64_t)CFSTR("_cacheRollover"), v32, v33);
    v34 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v35, v34, (uint64_t)CFSTR("_scanFrequency"), v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_scanFrequency = objc_msgSend_unsignedIntegerValue(v37, v38, v39, v40, v41);

    v42 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v43, v42, (uint64_t)CFSTR("_lostNetworkScanCount"), v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_lostNetworkScanCount = objc_msgSend_unsignedIntegerValue(v45, v46, v47, v48, v49);

    v50 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v51, v50, (uint64_t)CFSTR("_modifyMap"), v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_getBytes_length_(v53, v54, (uint64_t)(&v5->_cacheRollover + 1), 1, v55);

  }
  return v5;
}

- (NSArray)networks
{
  return self->_networks;
}

- (NSArray)channels
{
  return self->_channels;
}

- (BOOL)cacheEnabled
{
  return self->_cacheEnabled;
}

- (BOOL)cacheRollover
{
  return self->_cacheRollover;
}

- (unint64_t)scanFrequency
{
  return self->_scanFrequency;
}

- (unint64_t)lostNetworkScanCount
{
  return self->_lostNetworkScanCount;
}

- ($A4FF59F43F4B20644E55A5E6B3BB4A05)modifyMap
{
  return ($A4FF59F43F4B20644E55A5E6B3BB4A05)*((unsigned __int8 *)&self->_cacheRollover + 1);
}

- (void)setModifyMap:(id)a3
{
  *(&self->_cacheRollover + 1) = (BOOL)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channels, 0);
  objc_storeStrong((id *)&self->_networks, 0);
}

@end
