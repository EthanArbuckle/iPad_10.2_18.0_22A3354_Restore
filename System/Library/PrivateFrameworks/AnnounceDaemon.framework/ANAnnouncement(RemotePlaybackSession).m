@implementation ANAnnouncement(RemotePlaybackSession)

- (id)remoteSessionDictionary
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  __CFString *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t j;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _BYTE v93[128];
  _BYTE v94[128];
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, *MEMORY[0x1E0CF7A00]);

  objc_msgSend(a1, "groupID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0CF7C88]);

  objc_msgSend(a1, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "homeUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v82 = v6;
  if (v6)
  {
    +[ANHomeManager shared](ANHomeManager, "shared");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "homeForID:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0CF7C98]);

    objc_msgSend(v8, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0CF7CA8]);

  }
  else
  {
    v8 = 0;
  }
  v11 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "announcer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "numberWithBool:", objc_msgSend(v12, "isAccessory"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0CF7A58]);

  objc_msgSend(a1, "announcer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "homeKitID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0CF7A50]);

  objc_msgSend(a1, "announcer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "homeKitUserID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0CF7A80]);

  v84 = a1;
  if (v8)
  {
    objc_msgSend(a1, "announcer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "name");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19 || objc_msgSend(v19, "isEqualToString:", &stru_1E93913D0))
    {
      objc_msgSend(a1, "announcerNameInHome:", v8);
      v20 = objc_claimAutoreleasedReturnValue();

      v19 = (void *)v20;
    }
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v19, *MEMORY[0x1E0CF7A68]);
    v21 = objc_alloc(MEMORY[0x1E0CB3A28]);
    objc_msgSend(a1, "announcer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "homeKitID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v21, "initWithUUIDString:", v23);
    v25 = a1;
    v26 = (void *)v24;

    objc_msgSend(v25, "announcer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "userID");
    v28 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (!v28)
    {
      objc_msgSend(v8, "hmu_userWithUniqueIdentifier:", v26);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "userID");
      v30 = objc_claimAutoreleasedReturnValue();

      if (v30)
        v28 = (__CFString *)v30;
      else
        v28 = &stru_1E93913D0;
    }
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v28, *MEMORY[0x1E0CF7A70]);

    a1 = v84;
  }
  v83 = v2;
  v31 = (void *)objc_opt_new();
  objc_msgSend(a1, "location");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "roomUUIDs");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v91 = 0u;
  v92 = 0u;
  v89 = 0u;
  v90 = 0u;
  v34 = v33;
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v89, v94, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v90;
    do
    {
      for (i = 0; i != v36; ++i)
      {
        if (*(_QWORD *)v90 != v37)
          objc_enumerationMutation(v34);
        v39 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * i);
        objc_msgSend(v8, "hmu_roomWithUniqueIdentifier:", v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v40;
        if (v40)
        {
          objc_msgSend(v40, "name");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "UUIDString");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setObject:forKeyedSubscript:", v42, v43);

        }
      }
      v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v89, v94, 16);
    }
    while (v36);
  }
  v81 = v34;

  objc_msgSend(v83, "setObject:forKeyedSubscript:", v31, *MEMORY[0x1E0CF7D40]);
  v44 = (void *)objc_opt_new();
  objc_msgSend(v84, "location");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "zoneUUIDs");
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  v47 = v46;
  v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v85, v93, 16);
  if (v48)
  {
    v49 = v48;
    v50 = *(_QWORD *)v86;
    do
    {
      for (j = 0; j != v49; ++j)
      {
        if (*(_QWORD *)v86 != v50)
          objc_enumerationMutation(v47);
        v52 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * j);
        objc_msgSend(v8, "hmu_zoneWithUniqueIdentifier:", v52);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = v53;
        if (v53)
        {
          objc_msgSend(v53, "name");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "UUIDString");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "setObject:forKeyedSubscript:", v55, v56);

        }
      }
      v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v85, v93, 16);
    }
    while (v49);
  }

  objc_msgSend(v83, "setObject:forKeyedSubscript:", v44, *MEMORY[0x1E0CF7DD0]);
  objc_msgSend(v84, "filePath");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "setObject:forKeyedSubscript:", v57, *MEMORY[0x1E0CF7A88]);

  objc_msgSend(v84, "announcer");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "homeKitID");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hmu_accessoryWithUniqueIdentifierUUIDString:", v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v84, "announcer");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v61, "isAccessory"))
    {
      v62 = v60;
      objc_msgSend(v84, "announcer");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "homeKitUserID");
      v64 = objc_claimAutoreleasedReturnValue();
      if (v64)
      {
        v65 = (void *)v64;
        v80 = v62;
        objc_msgSend(v62, "room");
        v66 = (void *)objc_claimAutoreleasedReturnValue();

        v60 = v80;
        if (v66)
        {
          objc_msgSend(v80, "room");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "name");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          ANLocalizedStringWithFormat();
          v68 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_39:
          objc_msgSend(v83, "setObject:forKeyedSubscript:", v68, *MEMORY[0x1E0CF7D68], v79);

          goto LABEL_40;
        }
LABEL_38:
        objc_msgSend(v8, "name");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = v67;
        ANLocalizedStringWithFormat();
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_39;
      }

    }
    goto LABEL_38;
  }
LABEL_40:
  objc_msgSend(v60, "services");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "na_firstObjectPassingTest:", &__block_literal_global_3);
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", objc_msgSend(v84, "productType"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "setObject:forKeyedSubscript:", v71, *MEMORY[0x1E0CF7D20]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v84, "productTypeOverride"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "setObject:forKeyedSubscript:", v72, *MEMORY[0x1E0CF7D30]);

  objc_msgSend(v70, "serviceType");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "setObject:forKeyedSubscript:", v73, *MEMORY[0x1E0CF7D50]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v84, "deviceClass"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "setObject:forKeyedSubscript:", v74, *MEMORY[0x1E0CF7C38]);

  objc_msgSend(v84, "transcriptionText");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "setObject:forKeyedSubscript:", v75, *MEMORY[0x1E0CF7D70]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v84, "hasPlayed"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "setObject:forKeyedSubscript:", v76, *MEMORY[0x1E0CF7D18]);

  v77 = (void *)objc_msgSend(v83, "copy");
  return v77;
}

- (id)sendFailureDictionary
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(a1, "remoteSessionDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dictionaryWithDictionary:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, *MEMORY[0x1E0CF7C38]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, *MEMORY[0x1E0CF7D18]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, *MEMORY[0x1E0CF7A58]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, *MEMORY[0x1E0CF7D20]);
  ANLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0CF7D68]);

  v5 = (void *)objc_msgSend(v3, "copy");
  return v5;
}

- (uint64_t)defaultActionURL
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("com.apple.Home://"));
}

@end
