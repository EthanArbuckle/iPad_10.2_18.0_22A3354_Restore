@implementation ATXMessageSenderImportanceModel

- (id)calculateSenderImportanceForMessageWithContextRequest:(id)a3 contactStore:(id)a4 contactRelationships:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  unsigned int v21;
  void *v22;
  void *v23;
  unsigned int v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  unsigned int v43;
  unsigned int v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  ATXSenderImportance *v74;
  unsigned int v76;
  unsigned int v77;
  id v78;
  unsigned int v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _BYTE v89[128];
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v7, "textMessage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sender");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXSenderImportanceUtils contactFromHandle:contactStore:](ATXSenderImportanceUtils, "contactFromHandle:contactStore:", v12, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0.0;
  v15 = 0.0;
  v16 = 0.0;
  v17 = 0.0;
  v18 = 0.0;
  v83 = v8;
  v84 = v13;
  if (v13)
  {
    v80 = v11;
    objc_msgSend(v9, "cnContactIdsOfFavoriteContacts");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "containsObject:", v20);

    objc_msgSend(v9, "cnContactIdsOfEmergencyContacts");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "identifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v22, "containsObject:", v23);

    objc_msgSend(v9, "cnContactIdsOfICloudFamilyMembers");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "identifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = objc_msgSend(v25, "containsObject:", v26);

    v87 = 0u;
    v88 = 0u;
    v85 = 0u;
    v86 = 0u;
    objc_msgSend(v13, "emailAddresses");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v85, v89, 16);
    if (v28)
    {
      v29 = v28;
      v76 = v24;
      v77 = v21;
      v81 = v12;
      v78 = v7;
      v30 = 0;
      v31 = *(_QWORD *)v86;
      do
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v86 != v31)
            objc_enumerationMutation(v27);
          v33 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * i);
          objc_msgSend(v9, "vipContactEmailAddresses");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "value");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v34, "containsObject:", v35);

          if (v36)
            v30 = 1;
        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v85, v89, 16);
      }
      while (v29);
      v15 = (double)(v30 & 1);
      v7 = v78;
      v12 = v81;
      v13 = v84;
      v24 = v76;
      v21 = v77;
    }

    v18 = (double)v21;
    v17 = (double)v24;
    v16 = (double)v79;
    v11 = v80;
  }
  objc_msgSend(v7, "contextRequestSignals");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "entityID");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "messageID");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v38, "isEqualToString:", v39);

  if (v40)
  {
    v82 = v12;
    v41 = v11;
    objc_msgSend(v37, "isFromPinnedMessage");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v42, "BOOLValue") & 1) != 0)
    {
      v43 = 1;
    }
    else
    {
      objc_msgSend(v13, "identifier");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      if (v45)
      {
        objc_msgSend(v9, "cnContactIdsOfPinnedChatsInMessage");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "identifier");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v46, "containsObject:", v47);

      }
      else
      {
        v43 = 0;
      }

    }
    objc_msgSend(v37, "isAudioMessage");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v48, "BOOLValue");

    objc_msgSend(v37, "isFromGroupMessage");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v49, "BOOLValue") & 1) != 0)
    {
      objc_msgSend(v37, "isMentionedInGroup");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v50, "BOOLValue");

      if (v51)
        v14 = 1.0;
      else
        v14 = 0.0;
    }
    else
    {

    }
    v11 = v41;
    v12 = v82;
  }
  else
  {
    v44 = 0;
    v43 = 0;
  }
  objc_msgSend(v10, "isFavoriteContact");
  v53 = v18 * v52;
  objc_msgSend(v10, "isEmergencyContact");
  v55 = v17 * v54;
  objc_msgSend(v10, "isiCloudFamilyMember");
  v57 = v16 * v56;
  objc_msgSend(v10, "isVIP");
  v59 = v15 * v58;
  objc_msgSend(v10, "isContactChatPinnedInMessage");
  v61 = v60 * (double)v43;
  objc_msgSend(v10, "isAudioMessage");
  v63 = v62 * (double)v44;
  objc_msgSend(v10, "isMentionedInGroupMessage");
  v65 = v14 * v64;
  v66 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v53);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "setObject:forKeyedSubscript:", v67, CFSTR("isFavorite"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v55);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "setObject:forKeyedSubscript:", v68, CFSTR("isEmergency"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v57);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "setObject:forKeyedSubscript:", v69, CFSTR("isFamily"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v59);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "setObject:forKeyedSubscript:", v70, CFSTR("isVIP"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v61);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "setObject:forKeyedSubscript:", v71, CFSTR("isFromPinnedContactInMessage"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v63);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "setObject:forKeyedSubscript:", v72, CFSTR("isAudioMessage"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v65);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "setObject:forKeyedSubscript:", v73, CFSTR("isMentionedInGroupMessage"));

  v74 = -[ATXSenderImportance initWithSenderImportanceScore:featureDictionary:]([ATXSenderImportance alloc], "initWithSenderImportanceScore:featureDictionary:", v66, fmin(fmax(v53 + v55 + v57 + v59 + v61 + v63 + v65 + 0.0, 0.0), 1.0));
  return v74;
}

@end
