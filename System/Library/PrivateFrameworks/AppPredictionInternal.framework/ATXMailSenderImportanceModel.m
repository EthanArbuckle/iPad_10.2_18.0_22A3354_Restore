@implementation ATXMailSenderImportanceModel

- (id)calculateSenderImportanceForMailWithContextRequest:(id)a3 contactStore:(id)a4 contactRelationships:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  void *v22;
  void *v23;
  unsigned int v24;
  void *v25;
  void *v26;
  unsigned int v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  unsigned int v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
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
  id v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  ATXSenderImportance *v69;
  unsigned int v71;
  unsigned int v72;
  unsigned int v73;
  id v74;
  id v75;
  int v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v7, "mailMessage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sender");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXSenderImportanceUtils contactFromHandle:contactStore:](ATXSenderImportanceUtils, "contactFromHandle:contactStore:");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = 0.0;
  v14 = 0.0;
  v15 = 0.0;
  v16 = 0.0;
  v17 = 0.0;
  v80 = (void *)v12;
  if (v12)
  {
    v18 = (void *)v12;
    v77 = v11;
    objc_msgSend(v9, "cnContactIdsOfFavoriteContacts");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "containsObject:", v20);

    objc_msgSend(v9, "cnContactIdsOfEmergencyContacts");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "identifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v22, "containsObject:", v23);

    objc_msgSend(v9, "cnContactIdsOfICloudFamilyMembers");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "identifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "containsObject:", v26);

    v83 = 0u;
    v84 = 0u;
    v81 = 0u;
    v82 = 0u;
    objc_msgSend(v18, "emailAddresses");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v81, v85, 16);
    if (v29)
    {
      v30 = v29;
      v71 = v27;
      v72 = v24;
      v73 = v21;
      v74 = v8;
      v75 = v7;
      v31 = 0;
      v32 = *(_QWORD *)v82;
      do
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v82 != v32)
            objc_enumerationMutation(v28);
          v34 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * i);
          objc_msgSend(v9, "vipContactEmailAddresses");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "value");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v35, "containsObject:", v36);

          if (v37)
            v31 = 1;
        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v81, v85, 16);
      }
      while (v30);
      v14 = (double)(v31 & 1);
      v8 = v74;
      v7 = v75;
      v24 = v72;
      v21 = v73;
      v27 = v71;
    }

    v17 = (double)v21;
    v16 = (double)v24;
    v15 = (double)v27;
    v11 = v77;
  }
  objc_msgSend(v7, "contextRequestSignals");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "entityID");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "mailID");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v39, "isEqualToString:", v40);

  if (v41)
  {
    objc_msgSend(v38, "isFromMailingList");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "BOOLValue");

    objc_msgSend(v38, "isFromPinnedMessage");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v44, "BOOLValue"))
    {

      v45 = v80;
LABEL_19:
      v13 = 1.0;
      goto LABEL_21;
    }
    v78 = v11;
    v45 = v80;
    objc_msgSend(v80, "identifier");
    v46 = objc_claimAutoreleasedReturnValue();
    if (!v46)
    {

      goto LABEL_21;
    }
    v47 = (void *)v46;
    objc_msgSend(v9, "cnContactIdsOfPinnedChatsInMessage");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "identifier");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = objc_msgSend(v48, "containsObject:", v49);

    v45 = v80;
    v11 = v78;
    if (v76)
      goto LABEL_19;
  }
  else
  {
    v43 = 0;
    v45 = v80;
  }
LABEL_21:
  objc_msgSend(v10, "isFavoriteContact");
  v51 = v17 * v50;
  objc_msgSend(v10, "isEmergencyContact");
  v53 = v16 * v52;
  objc_msgSend(v10, "isiCloudFamilyMember");
  v55 = v15 * v54;
  objc_msgSend(v10, "isVIP");
  v57 = v14 * v56;
  objc_msgSend(v10, "isFromMailingList");
  v59 = v58 * (double)v43;
  objc_msgSend(v10, "isContactChatPinnedInMessage");
  v61 = v13 * v60;
  v62 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v51);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setObject:forKeyedSubscript:", v63, CFSTR("isFavorite"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v53);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setObject:forKeyedSubscript:", v64, CFSTR("isEmergency"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v55);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setObject:forKeyedSubscript:", v65, CFSTR("isFamily"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v57);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setObject:forKeyedSubscript:", v66, CFSTR("isVIP"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v59);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setObject:forKeyedSubscript:", v67, CFSTR("isFromMailingList"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v61);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setObject:forKeyedSubscript:", v68, CFSTR("isFromPinnedContactInMessage"));

  v69 = -[ATXSenderImportance initWithSenderImportanceScore:featureDictionary:]([ATXSenderImportance alloc], "initWithSenderImportanceScore:featureDictionary:", v62, fmin(fmax(v51 + v53 + v55 + v57 + v59 + v61 + 0.0, 0.0), 1.0));
  return v69;
}

@end
