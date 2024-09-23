@implementation BBBulletinRequest

- (void)setContextValue:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x24BDAC8D0];
  v20 = a3;
  v6 = a4;
  if (v20 && v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v9 = (void *)MEMORY[0x24BDBCE88];
      v10 = *MEMORY[0x24BDBCAB8];
      v23[0] = CFSTR("value");
      v23[1] = CFSTR("key");
      v24[0] = v20;
      v24[1] = v6;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "exceptionWithName:reason:userInfo:", v10, CFSTR("key must be of type NSString"), v11);
      v12 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v12);
    }
    if ((BBIsValueAllowed(v20) & 1) == 0)
    {
      v13 = (void *)MEMORY[0x24BDBCE88];
      v14 = *MEMORY[0x24BDBCAB8];
      v15 = (void *)MEMORY[0x24BDD17C8];
      BBAllowedClasses();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", CFSTR("value must be one of and contain only the following types: %@"), v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = CFSTR("value");
      v21[1] = CFSTR("key");
      v22[0] = v20;
      v22[1] = v6;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "exceptionWithName:reason:userInfo:", v14, v17, v18);
      v19 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v19);
    }
    -[BBBulletin context](self, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v7, "count") + 1);
    objc_msgSend(v8, "addEntriesFromDictionary:", v7);
    objc_msgSend(v8, "setValue:forKey:", v20, v6);
    -[BBBulletin setContext:](self, "setContext:", v8);

  }
}

- (void)setPrimaryAttachmentType:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  BBMutableAttachmentMetadata *v8;
  BBMutableAttachmentMetadata *v9;

  -[BBBulletin primaryAttachment](self, "primaryAttachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = objc_alloc_init(BBMutableAttachmentMetadata);
  v9 = v8;

  -[BBMutableAttachmentMetadata setType:](v9, "setType:", a3);
  -[BBBulletin setPrimaryAttachment:](self, "setPrimaryAttachment:", v9);

}

- (void)addAttachmentOfType:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  BBMutableAttachmentMetadata *v10;

  v10 = objc_alloc_init(BBMutableAttachmentMetadata);
  -[BBMutableAttachmentMetadata setType:](v10, "setType:", a3);
  -[BBBulletin additionalAttachments](self, "additionalAttachments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  objc_msgSend(v8, "arrayByAddingObject:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[BBBulletin setAdditionalAttachments:](self, "setAdditionalAttachments:", v9);
}

- (void)addButton:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BBBulletinRequest.m"), 151, CFSTR("%@-addButton -> cannot be nil"), objc_opt_class());

  }
  -[BBBulletin buttons](self, "buttons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  objc_msgSend(v6, "addObjectsFromArray:", v5);
  objc_msgSend(v6, "addObject:", v8);
  -[BBBulletin setButtons:](self, "setButtons:", v6);

}

- (void)publish:(BOOL)a3
{
  NSLog(CFSTR("You can no longer publish a bulletin by calling -publish on it. You must go through the data provider functions."), a2, a3);
}

- (void)publish
{
  -[BBBulletinRequest publish:](self, "publish:", 1);
}

- (void)withdraw
{
  NSLog(CFSTR("You can no longer withdraw a bulletin by calling -withdraw on it. You must got through the data provider functions."), a2);
}

- (void)setSupplementaryActions:(id)a3
{
  -[BBBulletinRequest setSupplementaryActions:forLayout:](self, "setSupplementaryActions:forLayout:", a3, 0);
}

- (void)setSupplementaryActions:(id)a3 forLayout:(int64_t)a4
{
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __55__BBBulletinRequest_setSupplementaryActions_forLayout___block_invoke;
  v9[3] = &unk_24C562DB0;
  v9[4] = self;
  objc_msgSend(a3, "bs_mapNoNulls:", v9);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[BBBulletin supplementaryActionsByLayout](self, "supplementaryActionsByLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v6, "setObject:forKey:", v8, v7);
  else
    objc_msgSend(v6, "removeObjectForKey:", v7);

}

id __55__BBBulletinRequest_setSupplementaryActions_forLayout___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v4 = (void *)objc_msgSend(v3, "copy");
    objc_msgSend(*(id *)(a1 + 32), "_updateSupplementaryAction:", v4);
  }

  return v4;
}

- (void)_updateSupplementaryAction:(id)a3
{
  id v4;
  void *v5;
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

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "setActionType:", 7);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    objc_msgSend(v4, "actions", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
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
          -[BBBulletinRequest _updateSupplementaryAction:](self, "_updateSupplementaryAction:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
}

- (void)addAlertSuppressionAppID:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BBBulletinRequest.m"), 216, CFSTR("%@-addAlertSuppressionAppID must be passed a string -> %@"), objc_opt_class(), v10);

    }
    v5 = objc_alloc(MEMORY[0x24BDBCEF0]);
    -[BBBulletin alertSuppressionAppIDs_deprecated](self, "alertSuppressionAppIDs_deprecated");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithSet:", v6);

    v8 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v7, "addObject:", v8);
    -[BBBulletin setAlertSuppressionAppIDs_deprecated:](self, "setAlertSuppressionAppIDs_deprecated:", v7);

  }
}

- (BOOL)showsUnreadIndicator
{
  return 0;
}

- (BOOL)tentative
{
  return 0;
}

- (unint64_t)expirationEvents
{
  return self->_expirationEvents;
}

- (void)setExpirationEvents:(unint64_t)a3
{
  self->_expirationEvents = a3;
}

- (BOOL)hasContentModificationsRelativeTo:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  BBBulletinRequest *v17;
  void *v18;
  BBBulletinRequest *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  int v42;
  int v43;
  int v44;
  int v45;
  int v46;
  int v47;
  int64_t v48;
  int v49;
  int v50;
  int64_t v51;
  int64_t v52;
  int v53;
  int64_t v54;
  uint64_t v55;
  int v56;
  int v57;
  unint64_t v58;
  int64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  int v66;
  void *v67;
  void *v68;
  int v69;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  int v74;
  uint64_t v75;
  unint64_t v76;
  float v77;
  float v78;
  float v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
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
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
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
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  int v159;
  int v160;
  int v161;
  int v162;
  int v163;
  int v164;
  uint64_t v165;
  int v166;
  int v167;
  uint64_t v168;
  int v169;
  _BYTE v170[12];
  __int128 v171;
  int v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  int v176;
  _BOOL4 v177;
  int v178;
  _BOOL4 v179;
  int v180;
  _BOOL4 v181;
  int v182;
  _BOOL4 v183;
  int v184;
  _BOOL4 v185;
  _BYTE v186[36];
  int v187;
  int v188;

  v5 = a3;
  -[BBBulletin content](self, "content");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 || (objc_msgSend(v5, "content"), (v153 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[BBBulletin content](self, "content");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "content");
    v158 = v7;
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 1;
    if (!objc_msgSend(v7, "isEqualToContent:"))
    {
      v187 = 1;
      v188 = 0;
      v171 = 0uLL;
      memset(v186, 0, sizeof(v186));
      v169 = 0;
      v184 = 0;
      v166 = 0;
      v185 = 0;
      v182 = 0;
      v163 = 0;
      v183 = 0;
      v180 = 0;
      v162 = 0;
      v181 = 0;
      v178 = 0;
      v160 = 0;
      v179 = 0;
      v176 = 0;
      v159 = 0;
      v177 = 0;
      v175 = 0;
      v9 = 0;
      v174 = 0;
      v10 = 0;
      v173 = 0;
      v11 = 0;
      v172 = 0;
      v161 = 0;
      v164 = 0;
      v165 = 0;
      v167 = 0;
      v168 = 0;
      memset(v170, 0, sizeof(v170));
      v12 = 0;
      goto LABEL_117;
    }
  }
  else
  {
    v153 = 0;
    v8 = 0;
  }
  -[BBBulletin modalAlertContent](self, "modalAlertContent");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)&v186[32] = v156 == 0;
  v187 = v8;
  if (v156 || (objc_msgSend(v5, "modalAlertContent"), (v151 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[BBBulletin modalAlertContent](self, "modalAlertContent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "modalAlertContent");
    v155 = v13;
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v13, "isEqualToContent:"))
    {
      v188 = 1;
      v171 = 0uLL;
      *(_QWORD *)&v186[24] = 0;
      memset(v186, 0, 20);
      v169 = 0;
      v184 = 0;
      v166 = 0;
      v185 = 0;
      v182 = 0;
      v163 = 0;
      v183 = 0;
      v180 = 0;
      v162 = 0;
      v181 = 0;
      v178 = 0;
      v160 = 0;
      v179 = 0;
      v176 = 0;
      v159 = 0;
      v177 = 0;
      v175 = 0;
      v9 = 0;
      v174 = 0;
      v10 = 0;
      v173 = 0;
      v11 = 0;
      v172 = 0;
      v161 = 0;
      v164 = 0;
      v165 = 0;
      v167 = 0;
      v168 = 0;
      memset(v170, 0, sizeof(v170));
      v12 = 0;
      *(_DWORD *)&v186[20] = 1;
      goto LABEL_117;
    }
    v14 = 1;
  }
  else
  {
    v151 = 0;
    v14 = 0;
  }
  -[BBBulletin starkBannerContent](self, "starkBannerContent");
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)&v186[28] = v152 == 0;
  *(_DWORD *)&v186[20] = v14;
  if (v152 || (objc_msgSend(v5, "starkBannerContent"), (v147 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[BBBulletin starkBannerContent](self, "starkBannerContent");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "starkBannerContent");
    v150 = v15;
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v15, "isEqualToContent:"))
    {
      v188 = 1;
      *(_QWORD *)&v171 = 0;
      *(_DWORD *)&v186[24] = 0;
      *(_QWORD *)&v186[8] = 0;
      *(_QWORD *)v186 = 0;
      v169 = 0;
      v184 = 0;
      v166 = 0;
      v185 = 0;
      v182 = 0;
      v163 = 0;
      v183 = 0;
      v180 = 0;
      v162 = 0;
      v181 = 0;
      v178 = 0;
      v160 = 0;
      v179 = 0;
      v176 = 0;
      v159 = 0;
      v177 = 0;
      v175 = 0;
      v9 = 0;
      v174 = 0;
      v10 = 0;
      v173 = 0;
      v11 = 0;
      v172 = 0;
      v161 = 0;
      v164 = 0;
      v165 = 0;
      v167 = 0;
      v168 = 0;
      memset(v170, 0, sizeof(v170));
      v12 = 0;
      *((_QWORD *)&v171 + 1) = 1;
      *(_DWORD *)&v186[16] = 1;
      goto LABEL_117;
    }
    *(_DWORD *)&v186[16] = 1;
  }
  else
  {
    v147 = 0;
    *(_DWORD *)&v186[16] = 0;
  }
  -[BBBulletin icon](self, "icon");
  v16 = objc_claimAutoreleasedReturnValue();
  *(_DWORD *)&v186[24] = v16 == 0;
  v148 = (void *)v16;
  if (v16 || (objc_msgSend(v5, "icon"), (v145 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v17 = self;
    v18 = v6;
    v19 = v17;
    -[BBBulletin icon](v17, "icon");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "icon");
    v146 = v20;
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v20, "isEqual:"))
    {
      v188 = 1;
      *(_QWORD *)&v171 = 0x100000000;
      *(_QWORD *)v186 = 0;
      v169 = 0;
      v184 = 0;
      v166 = 0;
      v185 = 0;
      v182 = 0;
      v163 = 0;
      v183 = 0;
      v180 = 0;
      v162 = 0;
      v181 = 0;
      v178 = 0;
      v160 = 0;
      v179 = 0;
      v176 = 0;
      v159 = 0;
      v177 = 0;
      v175 = 0;
      v9 = 0;
      v174 = 0;
      v10 = 0;
      v173 = 0;
      v11 = 0;
      v172 = 0;
      v161 = 0;
      v164 = 0;
      v165 = 0;
      v167 = 0;
      v168 = 0;
      memset(v170, 0, sizeof(v170));
      *((_QWORD *)&v171 + 1) = 1;
      *(_QWORD *)&v186[8] = 1;
      v6 = v18;
      self = v19;
      v12 = 0;
      goto LABEL_117;
    }
    *(_DWORD *)&v186[8] = 1;
    v6 = v18;
    self = v19;
  }
  else
  {
    v145 = 0;
    *(_DWORD *)&v186[8] = 0;
  }
  v21 = -[BBBulletin hasEventDate](self, "hasEventDate");
  if (v21 != objc_msgSend(v5, "hasEventDate"))
  {
    *(_QWORD *)&v171 = 0x100000000;
    *(_DWORD *)&v186[12] = 0;
    *(_QWORD *)v186 = 0;
    v169 = 0;
    v184 = 0;
    v166 = 0;
    v185 = 0;
    v182 = 0;
    v163 = 0;
    v183 = 0;
    v180 = 0;
    v162 = 0;
    v181 = 0;
    v178 = 0;
    v160 = 0;
    v179 = 0;
    v176 = 0;
    v159 = 0;
    v177 = 0;
    v175 = 0;
    v9 = 0;
    v174 = 0;
    v10 = 0;
    v173 = 0;
    v11 = 0;
    v172 = 0;
    v161 = 0;
    v164 = 0;
    v165 = 0;
    v167 = 0;
    v168 = 0;
    memset(v170, 0, sizeof(v170));
    v12 = 0;
    v188 = 1;
    *((_QWORD *)&v171 + 1) = 1;
    goto LABEL_117;
  }
  -[BBBulletin date](self, "date");
  v22 = objc_claimAutoreleasedReturnValue();
  *(_DWORD *)&v186[12] = v22 == 0;
  v144 = (void *)v22;
  if (v22 || (objc_msgSend(v5, "date"), (v140 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[BBBulletin date](self, "date");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "date");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    v143 = v23;
    if (!objc_msgSend(v23, "isEqualToDate:"))
    {
      v188 = 1;
      v169 = 0;
      v184 = 0;
      v166 = 0;
      v185 = 0;
      v182 = 0;
      v163 = 0;
      v183 = 0;
      v180 = 0;
      v162 = 0;
      v181 = 0;
      v178 = 0;
      v160 = 0;
      v179 = 0;
      v176 = 0;
      v159 = 0;
      v177 = 0;
      v175 = 0;
      v9 = 0;
      v174 = 0;
      v10 = 0;
      v173 = 0;
      v11 = 0;
      v172 = 0;
      v161 = 0;
      v164 = 0;
      v165 = 0;
      v167 = 0;
      v168 = 0;
      memset(v170, 0, sizeof(v170));
      v12 = 0;
      *((_QWORD *)&v171 + 1) = 1;
      *(_QWORD *)&v171 = 0x100000001;
      *(_QWORD *)v186 = 1;
      goto LABEL_117;
    }
    *(_DWORD *)v186 = 1;
  }
  else
  {
    v140 = 0;
    *(_DWORD *)v186 = 0;
  }
  -[BBBulletin endDate](self, "endDate");
  v24 = objc_claimAutoreleasedReturnValue();
  *(_DWORD *)&v186[4] = v24 == 0;
  v141 = (void *)v24;
  if (v24 || (objc_msgSend(v5, "endDate"), (v136 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[BBBulletin endDate](self, "endDate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endDate");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    v139 = v25;
    if (!objc_msgSend(v25, "isEqualToDate:"))
    {
      v188 = 1;
      v166 = 0;
      v185 = 0;
      v182 = 0;
      v163 = 0;
      v183 = 0;
      v180 = 0;
      v162 = 0;
      v181 = 0;
      v178 = 0;
      v160 = 0;
      v179 = 0;
      v176 = 0;
      v159 = 0;
      v177 = 0;
      v175 = 0;
      v9 = 0;
      v174 = 0;
      v10 = 0;
      v173 = 0;
      v11 = 0;
      v172 = 0;
      v161 = 0;
      v164 = 0;
      v165 = 0;
      v167 = 0;
      v168 = 0;
      memset(v170, 0, sizeof(v170));
      v12 = 0;
      *((_QWORD *)&v171 + 1) = 1;
      *(_QWORD *)&v171 = 0x100000001;
      v169 = 1;
      v184 = 1;
      goto LABEL_117;
    }
    v184 = 1;
  }
  else
  {
    v136 = 0;
    v184 = 0;
  }
  -[BBBulletin recencyDate](self, "recencyDate");
  v26 = objc_claimAutoreleasedReturnValue();
  v185 = v26 == 0;
  v137 = (void *)v26;
  if (v26 || (objc_msgSend(v5, "recencyDate"), (v132 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[BBBulletin recencyDate](self, "recencyDate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "recencyDate");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    v135 = v27;
    if (!objc_msgSend(v27, "isEqualToDate:"))
    {
      v188 = 1;
      v163 = 0;
      v183 = 0;
      v180 = 0;
      v162 = 0;
      v181 = 0;
      v178 = 0;
      v160 = 0;
      v179 = 0;
      v176 = 0;
      v159 = 0;
      v177 = 0;
      v175 = 0;
      v9 = 0;
      v174 = 0;
      v10 = 0;
      v173 = 0;
      v11 = 0;
      v172 = 0;
      v161 = 0;
      v164 = 0;
      v165 = 0;
      v167 = 0;
      v168 = 0;
      memset(v170, 0, sizeof(v170));
      v12 = 0;
      *((_QWORD *)&v171 + 1) = 1;
      *(_QWORD *)&v171 = 0x100000001;
      v169 = 1;
      v166 = 1;
      v182 = 1;
      goto LABEL_117;
    }
    v182 = 1;
  }
  else
  {
    v132 = 0;
    v182 = 0;
  }
  -[BBBulletin timeZone](self, "timeZone");
  v28 = objc_claimAutoreleasedReturnValue();
  v183 = v28 == 0;
  v133 = (void *)v28;
  if (v28 || (objc_msgSend(v5, "timeZone"), (v128 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[BBBulletin timeZone](self, "timeZone");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeZone");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    v131 = v29;
    if (!objc_msgSend(v29, "isEqualToTimeZone:"))
    {
      v188 = 1;
      v162 = 0;
      v181 = 0;
      v178 = 0;
      v160 = 0;
      v179 = 0;
      v176 = 0;
      v159 = 0;
      v177 = 0;
      v175 = 0;
      v9 = 0;
      v174 = 0;
      v10 = 0;
      v173 = 0;
      v11 = 0;
      v172 = 0;
      v161 = 0;
      v164 = 0;
      v165 = 0;
      v167 = 0;
      v168 = 0;
      memset(v170, 0, sizeof(v170));
      v12 = 0;
      *((_QWORD *)&v171 + 1) = 1;
      *(_QWORD *)&v171 = 0x100000001;
      v169 = 1;
      v166 = 1;
      v163 = 1;
      v180 = 1;
      goto LABEL_117;
    }
    v180 = 1;
  }
  else
  {
    v128 = 0;
    v180 = 0;
  }
  -[BBBulletin context](self, "context");
  v30 = objc_claimAutoreleasedReturnValue();
  v181 = v30 == 0;
  v129 = (void *)v30;
  if (v30 || (objc_msgSend(v5, "context"), (v124 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[BBBulletin context](self, "context");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "context");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    v127 = v31;
    if (!objc_msgSend(v31, "isEqualToDictionary:"))
    {
      v188 = 1;
      v160 = 0;
      v179 = 0;
      v176 = 0;
      v159 = 0;
      v177 = 0;
      v175 = 0;
      v9 = 0;
      v174 = 0;
      v10 = 0;
      v173 = 0;
      v11 = 0;
      v172 = 0;
      v161 = 0;
      v164 = 0;
      v165 = 0;
      v167 = 0;
      v168 = 0;
      memset(v170, 0, sizeof(v170));
      v12 = 0;
      *((_QWORD *)&v171 + 1) = 1;
      *(_QWORD *)&v171 = 0x100000001;
      v169 = 1;
      v166 = 1;
      v163 = 1;
      v162 = 1;
      v178 = 1;
      goto LABEL_117;
    }
    v178 = 1;
  }
  else
  {
    v124 = 0;
    v178 = 0;
  }
  -[BBBulletin primaryAttachment](self, "primaryAttachment");
  v32 = objc_claimAutoreleasedReturnValue();
  v179 = v32 == 0;
  v125 = (void *)v32;
  if (v32 || (objc_msgSend(v5, "primaryAttachment"), (v121 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[BBBulletin primaryAttachment](self, "primaryAttachment");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "primaryAttachment");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    v123 = v33;
    if ((objc_msgSend(v33, "hasContentModificationsRelativeTo:") & 1) != 0)
    {
      v188 = 1;
      v159 = 0;
      v177 = 0;
      v175 = 0;
      v9 = 0;
      v174 = 0;
      v10 = 0;
      v173 = 0;
      v11 = 0;
      v172 = 0;
      v161 = 0;
      v164 = 0;
      v165 = 0;
      v167 = 0;
      v168 = 0;
      memset(v170, 0, sizeof(v170));
      v12 = 0;
      *((_QWORD *)&v171 + 1) = 1;
      *(_QWORD *)&v171 = 0x100000001;
      v169 = 1;
      v166 = 1;
      v163 = 1;
      v162 = 1;
      v160 = 1;
      v176 = 1;
      goto LABEL_117;
    }
    v176 = 1;
  }
  else
  {
    v121 = 0;
    v176 = 0;
  }
  if (-[BBBulletinRequest hasAdditionalAttachmentsModificationsRelativeTo:](self, "hasAdditionalAttachmentsModificationsRelativeTo:", v5))
  {
    v159 = 0;
    v177 = 0;
    v175 = 0;
    v9 = 0;
    v174 = 0;
    v10 = 0;
    v173 = 0;
    v11 = 0;
    v172 = 0;
    v161 = 0;
    v164 = 0;
    v165 = 0;
    v167 = 0;
    v168 = 0;
    memset(v170, 0, sizeof(v170));
    v12 = 0;
    v188 = 1;
    *((_QWORD *)&v171 + 1) = 1;
    *(_QWORD *)&v171 = 0x100000001;
    v169 = 1;
    v166 = 1;
    v163 = 1;
    v162 = 1;
    v160 = 1;
    goto LABEL_117;
  }
  -[BBBulletin alertSuppressionContexts](self, "alertSuppressionContexts");
  v34 = objc_claimAutoreleasedReturnValue();
  v177 = v34 == 0;
  v120 = (void *)v34;
  if (v34
    || (objc_msgSend(v5, "alertSuppressionContexts"), (v116 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[BBBulletin alertSuppressionContexts](self, "alertSuppressionContexts");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "alertSuppressionContexts");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    v119 = v35;
    if (!objc_msgSend(v35, "isEqualToSet:"))
    {
      v188 = 1;
      v9 = 0;
      v174 = 0;
      v10 = 0;
      v173 = 0;
      v11 = 0;
      v172 = 0;
      v161 = 0;
      v164 = 0;
      v165 = 0;
      v167 = 0;
      v168 = 0;
      memset(v170, 0, sizeof(v170));
      v12 = 0;
      *((_QWORD *)&v171 + 1) = 1;
      *(_QWORD *)&v171 = 0x100000001;
      v169 = 1;
      v166 = 1;
      v163 = 1;
      v162 = 1;
      v160 = 1;
      v159 = 1;
      v175 = 1;
      goto LABEL_117;
    }
    LODWORD(v175) = 1;
  }
  else
  {
    v116 = 0;
    LODWORD(v175) = 0;
  }
  -[BBBulletin accessoryIconMask](self, "accessoryIconMask");
  v36 = objc_claimAutoreleasedReturnValue();
  HIDWORD(v175) = v36 == 0;
  v117 = (void *)v36;
  if (v36 || (objc_msgSend(v5, "accessoryIconMask"), (v112 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[BBBulletin accessoryIconMask](self, "accessoryIconMask");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accessoryIconMask");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    v115 = v37;
    if (!objc_msgSend(v37, "isEqual:"))
    {
      v188 = 1;
      v10 = 0;
      v173 = 0;
      v11 = 0;
      v172 = 0;
      v161 = 0;
      v164 = 0;
      v165 = 0;
      v167 = 0;
      v168 = 0;
      memset(v170, 0, sizeof(v170));
      v12 = 0;
      *((_QWORD *)&v171 + 1) = 1;
      *(_QWORD *)&v171 = 0x100000001;
      v169 = 1;
      v166 = 1;
      v163 = 1;
      v162 = 1;
      v160 = 1;
      v159 = 1;
      v9 = 1;
      v174 = 1;
      goto LABEL_117;
    }
    LODWORD(v174) = 1;
  }
  else
  {
    v112 = 0;
    LODWORD(v174) = 0;
  }
  -[BBBulletin accessoryImage](self, "accessoryImage");
  v38 = objc_claimAutoreleasedReturnValue();
  HIDWORD(v174) = v38 == 0;
  v113 = (void *)v38;
  if (v38 || (objc_msgSend(v5, "accessoryImage"), (v108 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[BBBulletin accessoryImage](self, "accessoryImage");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accessoryImage");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    v111 = v39;
    if (!objc_msgSend(v39, "isEqual:"))
    {
      v188 = 1;
      v11 = 0;
      v172 = 0;
      v161 = 0;
      v164 = 0;
      v165 = 0;
      v167 = 0;
      v168 = 0;
      memset(v170, 0, sizeof(v170));
      v12 = 0;
      *((_QWORD *)&v171 + 1) = 1;
      *(_QWORD *)&v171 = 0x100000001;
      v169 = 1;
      v166 = 1;
      v163 = 1;
      v162 = 1;
      v160 = 1;
      v159 = 1;
      v9 = 1;
      v10 = 1;
      v173 = 1;
      goto LABEL_117;
    }
    LODWORD(v173) = 1;
  }
  else
  {
    v108 = 0;
    LODWORD(v173) = 0;
  }
  -[BBBulletin supplementaryActionsByLayout](self, "supplementaryActionsByLayout");
  v40 = objc_claimAutoreleasedReturnValue();
  HIDWORD(v173) = v40 == 0;
  v109 = (void *)v40;
  if (v40
    || (objc_msgSend(v5, "supplementaryActionsByLayout"), (v105 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[BBBulletin supplementaryActionsByLayout](self, "supplementaryActionsByLayout");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "supplementaryActionsByLayout");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = v41;
    v188 = 1;
    if (!objc_msgSend(v41, "isEqualToDictionary:"))
    {
      v161 = 0;
      v164 = 0;
      v165 = 0;
      v167 = 0;
      v168 = 0;
      memset(v170, 0, sizeof(v170));
      v12 = 0;
      *((_QWORD *)&v171 + 1) = 1;
      *(_QWORD *)&v171 = 0x100000001;
      v169 = 1;
      v166 = 1;
      v163 = 1;
      v162 = 1;
      v160 = 1;
      v159 = 1;
      v9 = 1;
      v10 = 1;
      v11 = 1;
      v172 = 1;
      goto LABEL_117;
    }
    v172 = 1;
  }
  else
  {
    v105 = 0;
    v172 = 0;
  }
  v42 = -[BBBulletin wantsFullscreenPresentation](self, "wantsFullscreenPresentation");
  if (v42 != objc_msgSend(v5, "wantsFullscreenPresentation"))
  {
    v161 = 0;
    v164 = 0;
    v165 = 0;
    v167 = 0;
    v168 = 0;
    memset(v170, 0, sizeof(v170));
    v12 = 0;
    v188 = 1;
    *((_QWORD *)&v171 + 1) = 1;
    *(_QWORD *)&v171 = 0x100000001;
    v169 = 1;
    v166 = 1;
    v163 = 1;
    v162 = 1;
    v160 = 1;
    v159 = 1;
    v9 = 1;
    v10 = 1;
    v11 = 1;
    goto LABEL_117;
  }
  v43 = -[BBBulletin ignoresQuietMode](self, "ignoresQuietMode");
  v82 = v5;
  if (v43 != objc_msgSend(v5, "ignoresQuietMode"))
    goto LABEL_115;
  v44 = -[BBBulletin ignoresDowntime](self, "ignoresDowntime");
  if (v44 != objc_msgSend(v5, "ignoresDowntime"))
    goto LABEL_115;
  v45 = -[BBBulletin preemptsPresentedAlert](self, "preemptsPresentedAlert");
  if (v45 != objc_msgSend(v5, "preemptsPresentedAlert"))
    goto LABEL_115;
  v46 = -[BBBulletin displaysActionsInline](self, "displaysActionsInline");
  if (v46 != objc_msgSend(v5, "displaysActionsInline"))
    goto LABEL_115;
  v47 = -[BBBulletin dateIsAllDay](self, "dateIsAllDay");
  if (v47 != objc_msgSend(v5, "dateIsAllDay")
    || (v48 = -[BBBulletin dateFormatStyle](self, "dateFormatStyle"), v48 != objc_msgSend(v5, "dateFormatStyle"))
    || (v49 = -[BBBulletin clearable](self, "clearable"), v49 != objc_msgSend(v5, "clearable"))
    || (v50 = -[BBBulletin turnsOnDisplay](self, "turnsOnDisplay"),
        v50 != objc_msgSend(v5, "turnsOnDisplay"))
    || (v51 = -[BBBulletin sectionSubtype](self, "sectionSubtype"), v51 != objc_msgSend(v5, "sectionSubtype"))
    || (v52 = -[BBBulletin contentPreviewSetting](self, "contentPreviewSetting"),
        v52 != objc_msgSend(v5, "contentPreviewSetting"))
    || (v53 = -[BBBulletin preventAutomaticRemovalFromLockScreen](self, "preventAutomaticRemovalFromLockScreen"),
        v53 != objc_msgSend(v5, "preventAutomaticRemovalFromLockScreen"))
    || (v54 = -[BBBulletin lockScreenPriority](self, "lockScreenPriority"), v54 != objc_msgSend(v5, "lockScreenPriority")))
  {
LABEL_115:
    v161 = 0;
    v164 = 0;
    v165 = 0;
    v167 = 0;
    v168 = 0;
    memset(v170, 0, sizeof(v170));
    v12 = 0;
    v188 = 1;
    *((_QWORD *)&v171 + 1) = 1;
    *(_QWORD *)&v171 = 0x100000001;
    v169 = 1;
    v166 = 1;
    v163 = 1;
    v162 = 1;
    v160 = 1;
    v159 = 1;
    v9 = 1;
    v10 = 1;
    v11 = 1;
    goto LABEL_116;
  }
  -[BBBulletin summaryArgument](self, "summaryArgument");
  v55 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "summaryArgument");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = (void *)v55;
  if (!BSEqualStrings()
    || (v56 = -[BBBulletin hasCriticalIcon](self, "hasCriticalIcon"),
        v56 != objc_msgSend(v82, "hasCriticalIcon"))
    || (v57 = -[BBBulletin hasSubordinateIcon](self, "hasSubordinateIcon"),
        v57 != objc_msgSend(v82, "hasSubordinateIcon"))
    || (v58 = -[BBBulletin summaryArgumentCount](self, "summaryArgumentCount"),
        v58 != objc_msgSend(v82, "summaryArgumentCount"))
    || (v59 = -[BBBulletin backgroundStyle](self, "backgroundStyle"), v59 != objc_msgSend(v82, "backgroundStyle")))
  {
    v164 = 0;
    v165 = 0;
    v167 = 0;
    v168 = 0;
    memset(v170, 0, sizeof(v170));
    v12 = 0;
    v188 = 1;
    *((_QWORD *)&v171 + 1) = 1;
    *(_QWORD *)&v171 = 0x100000001;
    v169 = 1;
    v166 = 1;
    v163 = 1;
    v162 = 1;
    v160 = 1;
    v159 = 1;
    v9 = 1;
    v10 = 1;
    v11 = 1;
    v161 = 1;
    goto LABEL_116;
  }
  -[BBBulletin header](self, "header");
  v60 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "header");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = (void *)v60;
  if (!BSEqualStrings())
  {
    v165 = 0;
    v167 = 0;
    v168 = 0;
    memset(v170, 0, sizeof(v170));
    v12 = 0;
    v188 = 1;
    *((_QWORD *)&v171 + 1) = 1;
    *(_QWORD *)&v171 = 0x100000001;
    v169 = 1;
    v166 = 1;
    v163 = 1;
    v162 = 1;
    v160 = 1;
    v159 = 1;
    v9 = 1;
    v10 = 1;
    v11 = 1;
    v161 = 1;
    v164 = 1;
    goto LABEL_116;
  }
  -[BBBulletin footer](self, "footer");
  v61 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "footer");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = (void *)v61;
  if (!BSEqualStrings())
  {
    v167 = 0;
    v168 = 0;
    memset(v170, 0, sizeof(v170));
    v12 = 0;
    v188 = 1;
    *((_QWORD *)&v171 + 1) = 1;
    *(_QWORD *)&v171 = 0x100000001;
    v169 = 1;
    v166 = 1;
    v163 = 1;
    v162 = 1;
    v160 = 1;
    v159 = 1;
    v9 = 1;
    v10 = 1;
    v11 = 1;
    v161 = 1;
    v164 = 1;
    v165 = 1;
    goto LABEL_116;
  }
  -[BBBulletin threadSummary](self, "threadSummary");
  v62 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "threadSummary");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = (void *)v62;
  if (!BSEqualObjects())
  {
    v167 = 0;
    v168 = 0;
    memset(v170, 0, sizeof(v170));
    v12 = 0;
    v188 = 1;
    *((_QWORD *)&v171 + 1) = 1;
    *(_QWORD *)&v171 = 0x100000001;
    v169 = 1;
    v166 = 1;
    v163 = 1;
    v162 = 1;
    v160 = 1;
    v159 = 1;
    v9 = 1;
    v10 = 1;
    v11 = 1;
    v161 = 1;
    v164 = 1;
    v165 = 0x100000001;
    goto LABEL_116;
  }
  -[BBBulletin summary](self, "summary");
  v63 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "summary");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = (void *)v63;
  if (!BSEqualObjects())
  {
    v168 = 0;
    memset(v170, 0, sizeof(v170));
    v12 = 0;
    v188 = 1;
    *((_QWORD *)&v171 + 1) = 1;
    *(_QWORD *)&v171 = 0x100000001;
    v169 = 1;
    v166 = 1;
    v163 = 1;
    v162 = 1;
    v160 = 1;
    v159 = 1;
    v9 = 1;
    v10 = 1;
    v11 = 1;
    v161 = 1;
    v164 = 1;
    v165 = 0x100000001;
    v167 = 1;
    goto LABEL_116;
  }
  -[BBBulletin attributedMessage](self, "attributedMessage");
  v64 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "attributedMessage");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = (void *)v64;
  if (!BSEqualObjects())
  {
    memset(v170, 0, sizeof(v170));
    v12 = 0;
    v188 = 1;
    *((_QWORD *)&v171 + 1) = 1;
    *(_QWORD *)&v171 = 0x100000001;
    v169 = 1;
    v166 = 1;
    v163 = 1;
    v162 = 1;
    v160 = 1;
    v159 = 1;
    v9 = 1;
    v10 = 1;
    v11 = 1;
    v161 = 1;
    v164 = 1;
    v165 = 0x100000001;
    v167 = 1;
    v168 = 1;
    goto LABEL_116;
  }
  -[BBBulletin eventBehavior](self, "eventBehavior");
  v65 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "eventBehavior");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = (void *)v65;
  if (!BSEqualObjects()
    || (v66 = -[BBBulletin isHighlight](self, "isHighlight"), v66 != objc_msgSend(v82, "isHighlight")))
  {
    memset(v170, 0, sizeof(v170));
    v12 = 0;
    v188 = 1;
    *((_QWORD *)&v171 + 1) = 1;
    *(_QWORD *)&v171 = 0x100000001;
    v169 = 1;
    v166 = 1;
    v163 = 1;
    v162 = 1;
    v160 = 1;
    v159 = 1;
    v9 = 1;
    v10 = 1;
    v11 = 1;
    v161 = 1;
    v164 = 1;
    v165 = 0x100000001;
    v167 = 1;
    v168 = 0x100000001;
LABEL_116:
    v5 = v82;
    goto LABEL_117;
  }
  -[BBBulletin spotlightIdentifier](self, "spotlightIdentifier");
  v71 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "spotlightIdentifier");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = (void *)v71;
  if (!BSEqualObjects())
  {
    *(_QWORD *)&v170[4] = 0;
    v12 = 0;
    v188 = 1;
    *((_QWORD *)&v171 + 1) = 1;
    *(_QWORD *)&v171 = 0x100000001;
    v169 = 1;
    v166 = 1;
    v163 = 1;
    v162 = 1;
    v160 = 1;
    v159 = 1;
    v9 = 1;
    v10 = 1;
    v11 = 1;
    v161 = 1;
    v164 = 1;
    v165 = 0x100000001;
    v167 = 1;
    v168 = 0x100000001;
    *(_DWORD *)v170 = 1;
    goto LABEL_116;
  }
  -[BBBulletin categoryID](self, "categoryID");
  v72 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "categoryID");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = (void *)v72;
  if (!BSEqualStrings())
  {
    v12 = 0;
    v188 = 1;
    *((_QWORD *)&v171 + 1) = 1;
    *(_DWORD *)&v170[8] = 0;
    *(_QWORD *)&v171 = 0x100000001;
    v169 = 1;
    v166 = 1;
    v163 = 1;
    v162 = 1;
    v160 = 1;
    v159 = 1;
    v9 = 1;
    v10 = 1;
    v11 = 1;
    v161 = 1;
    v164 = 1;
    v165 = 0x100000001;
    v167 = 1;
    v168 = 0x100000001;
    *(_QWORD *)v170 = 0x100000001;
    goto LABEL_116;
  }
  -[BBBulletin contentType](self, "contentType");
  v73 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "contentType");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = (void *)v73;
  if (!BSEqualStrings()
    || (v74 = -[BBBulletin screenCaptureProhibited](self, "screenCaptureProhibited"),
        v74 != objc_msgSend(v82, "screenCaptureProhibited")))
  {
    v12 = 0;
    v188 = 1;
    *((_QWORD *)&v171 + 1) = 1;
    *(_QWORD *)&v171 = 0x100000001;
    v169 = 1;
    v166 = 1;
    v163 = 1;
    v162 = 1;
    v160 = 1;
    v159 = 1;
    v9 = 1;
    v10 = 1;
    v11 = 1;
    v161 = 1;
    v164 = 1;
    v165 = 0x100000001;
    v167 = 1;
    v168 = 0x100000001;
    *(_QWORD *)v170 = 0x100000001;
    *(_DWORD *)&v170[8] = 1;
    goto LABEL_116;
  }
  -[BBBulletin communicationContext](self, "communicationContext");
  v75 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "communicationContext");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = (void *)v75;
  if (!BSEqualObjects()
    || (v76 = -[BBBulletin interruptionLevel](self, "interruptionLevel"), v76 != objc_msgSend(v82, "interruptionLevel"))
    || (-[BBBulletin relevanceScore](self, "relevanceScore"), v78 = v77, objc_msgSend(v82, "relevanceScore"), v78 != v79))
  {
    v188 = 1;
    *((_QWORD *)&v171 + 1) = 1;
    *(_QWORD *)&v171 = 0x100000001;
    v169 = 1;
    v166 = 1;
    v163 = 1;
    v162 = 1;
    v160 = 1;
    v159 = 1;
    v9 = 1;
    v10 = 1;
    v11 = 1;
    v161 = 1;
    v164 = 1;
    v165 = 0x100000001;
    v167 = 1;
    v168 = 0x100000001;
    *(_QWORD *)v170 = 0x100000001;
    *(_DWORD *)&v170[8] = 1;
    v12 = 1;
    goto LABEL_116;
  }
  -[BBBulletin filterCriteria](self, "filterCriteria");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v82;
  objc_msgSend(v82, "filterCriteria");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v188 = 1;
  DWORD2(v171) = 1;
  HIDWORD(v171) = BSEqualStrings();
  *(_QWORD *)&v171 = 0x100000001;
  v169 = 1;
  v166 = 1;
  v163 = 1;
  v162 = 1;
  v160 = 1;
  v159 = 1;
  v9 = 1;
  v10 = 1;
  v11 = 1;
  v161 = 1;
  v164 = 1;
  v165 = 0x100000001;
  v167 = 1;
  v168 = 0x100000001;
  *(_QWORD *)v170 = 0x100000001;
  *(_DWORD *)&v170[8] = 1;
  v12 = 1;

LABEL_117:
  if (v12)
  {

  }
  if (*(_DWORD *)&v170[8])
  {

  }
  if (*(_DWORD *)&v170[4])
  {

  }
  if (*(_DWORD *)v170)
  {

  }
  if (HIDWORD(v168))
  {

  }
  if ((_DWORD)v168)
  {

  }
  if (v167)
  {

  }
  if (HIDWORD(v165))
  {

  }
  if ((_DWORD)v165)
  {

  }
  if (v164)
  {

  }
  if (v161)
  {

  }
  if (v172)
  {

  }
  if (HIDWORD(v173))

  if (v11)
  if ((_DWORD)v173)
  {

  }
  if (HIDWORD(v174))

  if (v10)
  if ((_DWORD)v174)
  {

  }
  if (HIDWORD(v175))

  if (v9)
  if ((_DWORD)v175)
  {

  }
  if (v177)

  if (v159)
  if (v176)
  {

  }
  if (v179)

  if (v160)
  if (v178)
  {

  }
  if (v181)

  if (v162)
  if (v180)
  {

  }
  if (v183)

  if (v163)
  if (v182)
  {

  }
  if (v185)

  if (v166)
  if (v184)
  {

  }
  if (*(_DWORD *)&v186[4])

  if (v169)
  if (*(_DWORD *)v186)
  {

  }
  if (*(_DWORD *)&v186[12])

  if ((_DWORD)v171)
  if (*(_DWORD *)&v186[8])
  {

  }
  if (*(_DWORD *)&v186[24])

  if (DWORD1(v171))
  {

    if (!*(_DWORD *)&v186[16])
    {
LABEL_205:
      if (!*(_DWORD *)&v186[28])
        goto LABEL_207;
      goto LABEL_206;
    }
  }
  else if (!*(_DWORD *)&v186[16])
  {
    goto LABEL_205;
  }

  if (*(_DWORD *)&v186[28])
LABEL_206:

LABEL_207:
  if (DWORD2(v171))
  {

    if (!*(_DWORD *)&v186[20])
    {
LABEL_209:
      if (!*(_DWORD *)&v186[32])
        goto LABEL_211;
      goto LABEL_210;
    }
  }
  else if (!*(_DWORD *)&v186[20])
  {
    goto LABEL_209;
  }

  if (*(_DWORD *)&v186[32])
LABEL_210:

LABEL_211:
  if (!v188)
  {
    if (!v187)
      goto LABEL_213;
LABEL_223:

    if (v6)
      goto LABEL_214;
    goto LABEL_224;
  }

  if (v187)
    goto LABEL_223;
LABEL_213:
  if (v6)
    goto LABEL_214;
LABEL_224:

LABEL_214:
  if (HIDWORD(v171))
  {
    -[BBBulletin speechLanguage](self, "speechLanguage");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "speechLanguage");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = BSEqualStrings() ^ 1;

  }
  else
  {
    LOBYTE(v69) = 1;
  }

  return v69;
}

- (BOOL)hasAdditionalAttachmentsModificationsRelativeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  int v11;

  v4 = a3;
  -[BBBulletin additionalAttachments](self, "additionalAttachments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "additionalAttachments");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "count");
  if (v7 == objc_msgSend(v6, "count"))
  {
    if (objc_msgSend(v5, "count"))
    {
      v8 = 0;
      do
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectAtIndexedSubscript:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "hasContentModificationsRelativeTo:", v10);

        if (v11)
          break;
        ++v8;
      }
      while (v8 < objc_msgSend(v5, "count"));
    }
    else
    {
      LOBYTE(v11) = 0;
    }
  }
  else
  {
    LOBYTE(v11) = 1;
  }

  return v11;
}

- (void)generateNewBulletinID
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBBulletin setBulletinID:](self, "setBulletinID:", v3);

}

@end
