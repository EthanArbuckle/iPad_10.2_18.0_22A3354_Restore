@implementation EMMessage

- (EMMessageRepository)repository
{
  void *v4;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EMMessage;
  -[EMBaseMessageListItem repository](&v7, sel_repository);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMMessage.m"), 37, CFSTR("Wrong repository type"));

    }
  }
  return (EMMessageRepository *)v4;
}

- (void)setRepository:(id)a3
{
  id v5;
  void *v6;
  objc_super v7;

  v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMMessage.m"), 37, CFSTR("Wrong repository type"));

    }
  }
  v7.receiver = self;
  v7.super_class = (Class)EMMessage;
  -[EMBaseMessageListItem setRepository:](&v7, sel_setRepository_, v5);

}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __16__EMMessage_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_22 != -1)
    dispatch_once(&log_onceToken_22, block);
  return (OS_os_log *)(id)log_log_22;
}

void __16__EMMessage_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_22;
  log_log_22 = (uint64_t)v1;

}

- (EMMessage)initWithObjectID:(id)a3
{
  id v5;

  v5 = a3;
  -[EMMessage doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EMMessage initWithObjectID:]", "EMMessage.m", 63, "0");
}

- (EMMessage)initWithObjectID:(id)a3 builder:(id)a4
{
  id v7;
  id v8;
  id v9;
  EMMessage *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  EMMessage *v15;
  void *v17;
  objc_super v18;
  _QWORD v19[4];
  EMMessage *v20;
  id v21;
  uint8_t buf[24];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMMessage.m"), 67, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("builderBlock"));

  }
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __38__EMMessage_initWithObjectID_builder___block_invoke;
  v19[3] = &unk_1E70F3D68;
  v20 = self;
  v9 = v8;
  v21 = v9;
  v18.receiver = v20;
  v18.super_class = (Class)EMMessage;
  v10 = -[EMBaseMessageListItem initWithObjectID:baseBuilder:](&v18, sel_initWithObjectID_baseBuilder_, v7, v19);
  if (!-[EMBaseMessageListItem conversationID](v10, "conversationID"))
  {
    +[EMMessage log](EMMessage, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      v12 = -[EMBaseMessageListItem conversationID](v10, "conversationID");
      -[EMMessage description](v10, "description");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[EMMessage initWithObjectID:builder:].cold.1(v13, buf, v12, v11);
    }

  }
  v14 = v21;
  v15 = v10;

  return v15;
}

uint64_t __38__EMMessage_initWithObjectID_builder___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_commonInitWithBuilder:", *(_QWORD *)(a1 + 40));
}

- (void)_commonInitWithBuilder:(id)a3
{
  (*((void (**)(id, EMMessage *))a3 + 2))(a3, self);
}

+ (id)combinedFlagsForMessageListItems:(id)a3
{
  +[EMMessage combinedFlagsForMessageListItems:forDisplay:](EMMessage, "combinedFlagsForMessageListItems:forDisplay:", a3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)combinedFlagsForMessageListItems:(id)a3 forDisplay:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;

  v4 = a4;
  objc_msgSend(a3, "ef_map:", &__block_literal_global_28);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "combinedFlagsForMessageListItemFlags:forDisplay:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __57__EMMessage_combinedFlagsForMessageListItems_forDisplay___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "flags");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)combinedFlagsForMessageListItemFlags:(id)a3 forDisplay:(BOOL)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  BOOL v12;

  v5 = a3;
  v6 = objc_alloc(MEMORY[0x1E0D1E780]);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61__EMMessage_combinedFlagsForMessageListItemFlags_forDisplay___block_invoke;
  v10[3] = &unk_1E70F3DB0;
  v7 = v5;
  v11 = v7;
  v12 = a4;
  v8 = (void *)objc_msgSend(v6, "initWithBuilder:", v10);

  return v8;
}

void __61__EMMessage_combinedFlagsForMessageListItemFlags_forDisplay___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t k;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t m;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t n;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t ii;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t jj;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t kk;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t mm;
  uint64_t v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  BOOL v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t nn;
  void *v51;
  uint64_t v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _BYTE v94[128];
  _BYTE v95[128];
  _BYTE v96[128];
  _BYTE v97[128];
  _BYTE v98[128];
  _BYTE v99[128];
  _BYTE v100[128];
  _BYTE v101[128];
  _BYTE v102[128];
  _BYTE v103[128];
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v90, v103, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v91;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v91 != v6)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v90 + 1) + 8 * i), "read") & 1) == 0)
        {
          v8 = 0;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v90, v103, 16);
      if (v5)
        continue;
      break;
    }
  }
  v8 = 1;
LABEL_11:

  objc_msgSend(v3, "setRead:", v8);
  v88 = 0u;
  v89 = 0u;
  v86 = 0u;
  v87 = 0u;
  v9 = *(id *)(a1 + 32);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v86, v102, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v87;
    while (2)
    {
      for (j = 0; j != v10; ++j)
      {
        if (*(_QWORD *)v87 != v11)
          objc_enumerationMutation(v9);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v86 + 1) + 8 * j), "deleted") & 1) == 0)
        {
          v13 = 0;
          goto LABEL_21;
        }
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v86, v102, 16);
      if (v10)
        continue;
      break;
    }
  }
  v13 = 1;
LABEL_21:

  objc_msgSend(v3, "setDeleted:", v13);
  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  v14 = *(id *)(a1 + 32);
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v82, v101, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v83;
    while (2)
    {
      for (k = 0; k != v15; ++k)
      {
        if (*(_QWORD *)v83 != v16)
          objc_enumerationMutation(v14);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v82 + 1) + 8 * k), "replied") & 1) != 0)
        {
          v15 = 1;
          goto LABEL_31;
        }
      }
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v82, v101, 16);
      if (v15)
        continue;
      break;
    }
  }
LABEL_31:

  objc_msgSend(v3, "setReplied:", v15);
  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  v18 = *(id *)(a1 + 32);
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v78, v100, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v79;
    while (2)
    {
      for (m = 0; m != v19; ++m)
      {
        if (*(_QWORD *)v79 != v20)
          objc_enumerationMutation(v18);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v78 + 1) + 8 * m), "draft") & 1) != 0)
        {
          v19 = 1;
          goto LABEL_41;
        }
      }
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v78, v100, 16);
      if (v19)
        continue;
      break;
    }
  }
LABEL_41:

  objc_msgSend(v3, "setDraft:", v19);
  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  v22 = *(id *)(a1 + 32);
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v74, v99, 16);
  if (v23)
  {
    v24 = *(_QWORD *)v75;
    while (2)
    {
      for (n = 0; n != v23; ++n)
      {
        if (*(_QWORD *)v75 != v24)
          objc_enumerationMutation(v22);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v74 + 1) + 8 * n), "forwarded") & 1) != 0)
        {
          v23 = 1;
          goto LABEL_51;
        }
      }
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v74, v99, 16);
      if (v23)
        continue;
      break;
    }
  }
LABEL_51:

  objc_msgSend(v3, "setForwarded:", v23);
  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v26 = *(id *)(a1 + 32);
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v70, v98, 16);
  if (v27)
  {
    v28 = *(_QWORD *)v71;
    while (2)
    {
      for (ii = 0; ii != v27; ++ii)
      {
        if (*(_QWORD *)v71 != v28)
          objc_enumerationMutation(v26);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v70 + 1) + 8 * ii), "redirected") & 1) != 0)
        {
          v27 = 1;
          goto LABEL_61;
        }
      }
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v70, v98, 16);
      if (v27)
        continue;
      break;
    }
  }
LABEL_61:

  objc_msgSend(v3, "setRedirected:", v27);
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v30 = *(id *)(a1 + 32);
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v66, v97, 16);
  if (v31)
  {
    v32 = *(_QWORD *)v67;
    while (2)
    {
      for (jj = 0; jj != v31; ++jj)
      {
        if (*(_QWORD *)v67 != v32)
          objc_enumerationMutation(v30);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v66 + 1) + 8 * jj), "junkLevelSetByUser") & 1) != 0)
        {
          v31 = 1;
          goto LABEL_71;
        }
      }
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v66, v97, 16);
      if (v31)
        continue;
      break;
    }
  }
LABEL_71:

  objc_msgSend(v3, "setJunkLevelSetByUser:", v31);
  if (*(_BYTE *)(a1 + 40))
  {
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v34 = *(id *)(a1 + 32);
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v62, v96, 16);
    if (v35)
    {
      v36 = *(_QWORD *)v63;
      while (2)
      {
        for (kk = 0; kk != v35; ++kk)
        {
          if (*(_QWORD *)v63 != v36)
            objc_enumerationMutation(v34);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * kk), "flagged") & 1) != 0)
          {
            v35 = 1;
            goto LABEL_82;
          }
        }
        v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v62, v96, 16);
        if (v35)
          continue;
        break;
      }
    }
LABEL_82:

    objc_msgSend(v3, "setFlagged:", v35);
  }
  else
  {
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v38 = *(id *)(a1 + 32);
    v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v58, v95, 16);
    if (v39)
    {
      v40 = *(_QWORD *)v59;
      while (2)
      {
        for (mm = 0; mm != v39; ++mm)
        {
          if (*(_QWORD *)v59 != v40)
            objc_enumerationMutation(v38);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * mm), "flagged") & 1) == 0)
          {
            v42 = 0;
            goto LABEL_93;
          }
        }
        v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v58, v95, 16);
        if (v39)
          continue;
        break;
      }
    }
    v42 = 1;
LABEL_93:

    objc_msgSend(v3, "setFlagged:", v42);
  }
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v43 = *(id *)(a1 + 32);
  v53 = v3;
  v44 = 0;
  v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v54, v94, 16);
  if (v45)
  {
    v46 = 0;
    v47 = 0;
    v48 = *(_QWORD *)v55;
    v49 = 1;
    while (1)
    {
      for (nn = 0; nn != v45; ++nn)
      {
        if (*(_QWORD *)v55 != v48)
          objc_enumerationMutation(v43);
        v51 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * nn);
        if (v46)
        {
          v46 = 1;
          if ((v47 & 1) != 0)
            goto LABEL_101;
        }
        else
        {
          v52 = objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * nn), "junkLevel");
          v46 = (v52 & 0xFFFFFFFFFFFFFFFDLL) == 0;
          if ((v52 & 0xFFFFFFFFFFFFFFFDLL) == 0)
            v49 = 2;
          if ((v47 & 1) != 0)
          {
LABEL_101:
            if (v46)
              goto LABEL_114;
LABEL_108:
            v47 = 1;
            continue;
          }
        }
        if (objc_msgSend(v51, "flagged"))
        {
          v44 = objc_msgSend(v51, "flagColor");
          if (v46)
            goto LABEL_114;
          goto LABEL_108;
        }
        v47 = 0;
      }
      v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v54, v94, 16);
      if (!v45)
        goto LABEL_114;
    }
  }
  v49 = 1;
LABEL_114:

  objc_msgSend(v53, "setJunkLevel:", v49);
  objc_msgSend(v53, "setFlagColor:", v44);

}

- (NSString)mailProviderDisplayNameForBIMI
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[EMBaseMessageListItem mailboxes](self, "mailboxes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v14;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v7), "account", (_QWORD)v13);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "hostname");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
          objc_msgSend(v3, "addObject:", v9);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

  objc_msgSend(v3, "ef_anyPassingTest:", &__block_literal_global_26);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  EMBIMIMailProviderDisplayNameForIncomingMailServer((uint64_t)v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

uint64_t __43__EMMessage_mailProviderDisplayNameForBIMI__block_invoke(uint64_t a1, uint64_t a2)
{
  return EMBIMIIncomingServerIsAllowlisted(a2);
}

- (void)setCachedMetadata:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _BYTE v18[24];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[EMMessage repository](self, "repository");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6;
  v10 = v7;
  if (v9)
  {
    v17 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v9, 12, &v17);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v17;
    if (!v11)
    {
      +[EMMessage log](EMMessage, "log");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v12, "ef_publicDescription");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[EMMessage setCachedMetadata:forKey:].cold.1((uint64_t)v10, v14, (uint64_t)v18);
      }

    }
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v11, 4);

  }
  else
  {
    v15 = 0;
  }

  -[EMObject objectID](self, "objectID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCachedMetadataJSON:forKey:messageID:", v15, v10, v16);

}

- (id)cachedMetadataOfClass:(Class)a3 forKey:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  id v21;
  _BYTE v22[24];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[EMMessage repository](self, "repository");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMObject objectID](self, "objectID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cachedMetadataJSONForKey:messageID:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v8;
  v10 = v5;
  if (!v9)
  {
    v12 = 0;
    goto LABEL_12;
  }
  objc_msgSend(v9, "dataUsingEncoding:", 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    +[EMMessage log](EMMessage, "log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[EMMessage cachedMetadataOfClass:forKey:].cold.2((uint64_t)v10, v13, v16);
    goto LABEL_10;
  }
  v21 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v11, 4, &v21);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v21;
  if (!v12)
  {
    +[EMMessage log](EMMessage, "log");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      -[NSObject ef_publicDescription](v13, "ef_publicDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[EMMessage cachedMetadataOfClass:forKey:].cold.3((uint64_t)v10, v15, (uint64_t)v22);
    }

LABEL_10:
    v12 = 0;
  }

LABEL_12:
  if (!v12)
  {
LABEL_18:
    v17 = 0;
    goto LABEL_19;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    +[EMMessage log](EMMessage, "log");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[EMMessage cachedMetadataOfClass:forKey:].cold.1((uint64_t)v10, v18, v19);

    goto LABEL_18;
  }
  v17 = v12;
LABEL_19:

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMMessage)initWithCoder:(id)a3
{
  id v4;
  EMMessage *v5;
  _QWORD v7[4];
  id v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EMMessage;
  v5 = -[EMBaseMessageListItem initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __27__EMMessage_initWithCoder___block_invoke;
    v7[3] = &unk_1E70F3DD8;
    v8 = v4;
    -[EMMessage _commonInitWithBuilder:](v5, "_commonInitWithBuilder:", v7);

  }
  return v5;
}

void __27__EMMessage_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_documentID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDocumentID:", v3);

  objc_msgSend(*(id *)(a1 + 32), "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_searchableMessageID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSearchableMessageID:", v4);

}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)EMMessage;
  -[EMBaseMessageListItem encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[EMMessage documentID](self, "documentID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("EFPropertyKey_documentID"));

  -[EMMessage searchableMessageID](self, "searchableMessageID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("EFPropertyKey_searchableMessageID"));

}

- (NSString)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)EMMessage;
  -[EMBaseMessageListItem debugDescription](&v8, sel_debugDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMMessage searchableMessageID](self, "searchableMessageID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n\tsearchableMessageID:%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)ef_publicDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)EMMessage;
  -[EMBaseMessageListItem ef_publicDescription](&v8, sel_ef_publicDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMMessage searchableMessageID](self, "searchableMessageID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n\tsearchableMessageID:%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (EMCollectionItemID)itemID
{
  void *v2;
  void *v3;

  -[EMObject objectID](self, "objectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "collectionItemID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (EMCollectionItemID *)v3;
}

- (NSArray)availableRepresentations
{
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("raw");
  v3[1] = CFSTR("text/plain");
  v3[2] = CFSTR("text/html");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setAvailableRepresentations:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMMessage.m"), 285, CFSTR("EMMessage has a static set of availableRepresentations"));

}

- (NSString)uniformTypeIdentifier
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "uniformTypeIdentifier");
}

- (void)setUniformTypeIdentifier:(id)a3
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (v9)
  {
    objc_msgSend((id)objc_opt_class(), "uniformTypeIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v9, "isEqualToString:", v5);

    if ((v6 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "uniformTypeIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMMessage.m"), 293, CFSTR("%@ can not be changed."), v8);

    }
  }

}

- (UTType)type
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[EMMessage uniformTypeIdentifier](self, "uniformTypeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CEC3F8];
    -[EMMessage uniformTypeIdentifier](self, "uniformTypeIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "typeWithIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return (UTType *)v6;
}

- (NSString)contentID
{
  void *v2;
  void *v3;
  void *v4;

  -[EMObject objectID](self, "objectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringHash");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setContentID:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMMessage.m"), 305, CFSTR("EMMessage has an unmodifiable content identifier"));

}

- (NSString)displayName
{
  void *v2;
  void *v3;

  -[EMBaseMessageListItem subject](self, "subject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subjectString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setDisplayName:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMMessage.m"), 313, CFSTR("EMMessage has an unmodifiable display name"));

}

- (id)requestRepresentationWithOptions:(id)a3 completionHandler:(id)a4
{
  -[EMMessage requestRepresentationWithOptions:delegate:completionHandler:](self, "requestRepresentationWithOptions:delegate:completionHandler:", a3, 0, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)requestRepresentationWithOptions:(id)a3 delegate:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void (**v19)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  _QWORD v25[5];
  id v26;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = _os_activity_create(&dword_1B99BB000, "message content representation request", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v11, &state);
  EMLogCategoryMessageLoading();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "requestedRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMMessage ef_publicDescription](self, "ef_publicDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMObject objectID](self, "objectID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v29 = v13;
    v30 = 2114;
    v31 = v14;
    v32 = 2114;
    v33 = v15;
    _os_log_impl(&dword_1B99BB000, v12, OS_LOG_TYPE_DEFAULT, "requesting %{public}@ content for message %{public}@ (%{public}@)", buf, 0x20u);

  }
  -[EMMessage availableRepresentations](self, "availableRepresentations");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "requestedRepresentation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "containsObject:", v17);

  if ((v18 & 1) != 0)
  {
    -[EMMessage loaderBlock](self, "loaderBlock");
    v19 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __73__EMMessage_requestRepresentationWithOptions_delegate_completionHandler___block_invoke;
    v25[3] = &unk_1E70F1F18;
    v25[4] = self;
    v26 = v10;
    ((void (**)(_QWORD, id, id, _QWORD *))v19)[2](v19, v8, v9, v25);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[EMMessage log](EMMessage, "log");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      -[EMMessage availableRepresentations](self, "availableRepresentations");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "componentsJoinedByString:", CFSTR(", "));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[EMMessage requestRepresentationWithOptions:delegate:completionHandler:].cold.1(v23, (uint64_t)buf, v21, v22);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("EMErrorDomain"), 2048, 0);
    v19 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v20 = 0;
    (*((void (**)(id, _QWORD, void (**)(_QWORD, _QWORD, _QWORD, _QWORD)))v10 + 2))(v10, 0, v19);
  }

  os_activity_scope_leave(&state);
  return v20;
}

void __73__EMMessage_requestRepresentationWithOptions_delegate_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  objc_msgSend(v6, "setContentItem:", *(_QWORD *)(a1 + 32));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)loaderBlock
{
  _QWORD *loaderBlock;
  _QWORD v4[5];

  if (self->_loaderBlock)
  {
    loaderBlock = self->_loaderBlock;
  }
  else
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __24__EMMessage_loaderBlock__block_invoke;
    v4[3] = &unk_1E70F3E00;
    v4[4] = self;
    loaderBlock = v4;
  }
  return (id)MEMORY[0x1BCCC8C10](loaderBlock, a2);
}

id __24__EMMessage_loaderBlock__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(*(id *)(a1 + 32), "repository");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "requestRepresentationForMessageWithID:options:delegate:completionHandler:", v11, v7, v8, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)isAvailableLocally
{
  return self->_isAvailableLocally;
}

- (void)setIsAvailableLocally:(BOOL)a3
{
  self->_isAvailableLocally = a3;
}

- (int64_t)dataTransferByteCount
{
  return self->_dataTransferByteCount;
}

- (void)setDataTransferByteCount:(int64_t)a3
{
  self->_dataTransferByteCount = a3;
}

- (int64_t)storageByteCount
{
  return self->_storageByteCount;
}

- (void)setStorageByteCount:(int64_t)a3
{
  self->_storageByteCount = a3;
}

- (EMMailDropMetadata)mailDropMetadata
{
  return self->_mailDropMetadata;
}

- (void)setMailDropMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (int)exchangeEventUID
{
  return self->_exchangeEventUID;
}

- (void)setExchangeEventUID:(int)a3
{
  self->_exchangeEventUID = a3;
}

- (void)setLoaderBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (NSUUID)documentID
{
  return self->_documentID;
}

- (void)setDocumentID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (EMSearchableMessageID)searchableMessageID
{
  return self->_searchableMessageID;
}

- (void)setSearchableMessageID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchableMessageID, 0);
  objc_storeStrong((id *)&self->_documentID, 0);
  objc_storeStrong(&self->_loaderBlock, 0);
  objc_storeStrong((id *)&self->_mailDropMetadata, 0);
}

+ (NSString)uniformTypeIdentifier
{
  return (NSString *)(id)*MEMORY[0x1E0D1ED50];
}

+ (NSArray)externalDataTypeIdentifiers
{
  if (externalDataTypeIdentifiers_onceToken != -1)
    dispatch_once(&externalDataTypeIdentifiers_onceToken, &__block_literal_global_418);
  return (NSArray *)(id)externalDataTypeIdentifiers_identifiers;
}

void __59__EMMessage_ExternalDataTypes__externalDataTypeIdentifiers__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[EMMessage uniformTypeIdentifier](EMMessage, "uniformTypeIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", v1);

  objc_msgSend((id)*MEMORY[0x1E0CEC4D0], "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", v2);

  objc_msgSend(MEMORY[0x1E0C99E98], "writableTypeIdentifiersForItemProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObjectsFromArray:", v3);

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v0, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E0CB3498], "performSelector:", sel_writableTypeIdentifiersForItemProvider));
  objc_msgSend(MEMORY[0x1E0CB3940], "writableTypeIdentifiersForItemProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObjectsFromArray:", v4);

  v5 = (void *)externalDataTypeIdentifiers_identifiers;
  externalDataTypeIdentifiers_identifiers = (uint64_t)v0;

}

- (BOOL)isInManagedAccountWithSourceMailboxScope:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  char v20;

  v4 = a3;
  -[EMBaseMessageListItem mailboxes](self, "mailboxes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ef_filter:", &__block_literal_global_429);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    +[EMMailboxScope allMailboxesScope](EMMailboxScope, "allMailboxesScope");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7 == v4)
    {
      v14 = 1;
    }
    else
    {
      v20 = 0;
      -[EMMessage repository](self, "repository");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "mailboxRepository");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "allMailboxObjectIDsWithMailboxTypeResolver:forExclusion:", v9, &v20);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        v11 = objc_alloc(MEMORY[0x1E0C99E20]);
        -[EMBaseMessageListItem mailboxObjectIDs](self, "mailboxObjectIDs");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v11, "initWithArray:", v12);

        objc_msgSend(v13, "minusSet:", v10);
      }
      else
      {
        v15 = objc_alloc(MEMORY[0x1E0C99E20]);
        -[EMBaseMessageListItem mailboxObjectIDs](self, "mailboxObjectIDs");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v15, "initWithArray:", v16);

        objc_msgSend(v13, "intersectSet:", v10);
      }
      if (objc_msgSend(v13, "count"))
      {
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __69__EMMessage_ManagedSource__isInManagedAccountWithSourceMailboxScope___block_invoke_2;
        v18[3] = &unk_1E70F3E68;
        v19 = v13;
        v14 = objc_msgSend(v6, "ef_any:", v18);

      }
      else
      {
        v14 = 1;
      }

    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

uint64_t __69__EMMessage_ManagedSource__isInManagedAccountWithSourceMailboxScope___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sourceIsManaged");

  return v3;
}

uint64_t __69__EMMessage_ManagedSource__isInManagedAccountWithSourceMailboxScope___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

- (id)senderDisplayNameUsingContactStore:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    -[EMBaseMessageListItem senderList](self, "senderList");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count") == 1)
    {
      objc_msgSend(v5, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "displayNameForEmailAddress:abbreviated:", v6, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)shouldShowReplyAll
{
  void *v3;
  uint64_t v4;
  void *v5;
  BOOL v6;

  if (!_os_feature_enabled_impl())
    return 1;
  -[EMBaseMessageListItem toList](self, "toList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  -[EMBaseMessageListItem ccList](self, "ccList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (unint64_t)(objc_msgSend(v5, "count") + v4) > 1;

  return v6;
}

+ (id)predicateForMessageWithItemID:(id)a3 mailboxPredicate:(id)a4 mailboxTypeResolver:(id)a5
{
  id v9;
  id v10;
  id v11;
  EMMessageObjectID *v12;
  void *v13;
  void *v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("EMMessageQueryAdditions.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[itemID isKindOfClass:[EMMessageCollectionItemID class]]"));

  }
  v12 = -[EMMessageObjectID initWithCollectionItemID:predicate:mailboxTypeResolver:]([EMMessageObjectID alloc], "initWithCollectionItemID:predicate:mailboxTypeResolver:", v9, v10, v11);
  objc_msgSend(a1, "predicateForMessageWithObjectID:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)predicateForMessageWithObjectID:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v9;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("EMMessageQueryAdditions.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[objectID isKindOfClass:[EMMessageObjectID class]]"));

  }
  objc_msgSend(v5, "serializedRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_predicateForMessagesWithObjectIDConstantValue:operatorType:", v6, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)predicateForMessagesWithObjectIDs:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "ef_filter:", &__block_literal_global_33);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ef_map:", &__block_literal_global_17);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_predicateForMessagesWithObjectIDConstantValue:operatorType:", v5, 10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __65__EMMessage_EMQueryAdditions__predicateForMessagesWithObjectIDs___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

id __65__EMMessage_EMQueryAdditions__predicateForMessagesWithObjectIDs___block_invoke_2(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "serializedRepresentation");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)predicateForExcludingMessageWithObjectID:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v9;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("EMMessageQueryAdditions.m"), 44, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[objectID isKindOfClass:[EMMessageObjectID class]]"));

  }
  objc_msgSend(v5, "serializedRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_predicateForMessagesWithObjectIDConstantValue:operatorType:", v6, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)predicateForExcludingMessagesWithObjectIDs:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(a1, "predicateForMessagesWithObjectIDs:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "notPredicateWithSubpredicate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_predicateForMessagesWithObjectIDConstantValue:(id)a3 operatorType:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = (void *)MEMORY[0x1E0CB3518];
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("objectID.serializedRepresentation"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v7, v8, 0, a4, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)initWithObjectID:(uint64_t)a3 builder:(os_log_t)log .cold.1(void *a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 134218242;
  *(_QWORD *)(buf + 4) = a3;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a1;
  _os_log_fault_impl(&dword_1B99BB000, log, OS_LOG_TYPE_FAULT, "Error Message has NO conversationID:%llu, please check previous logs for more info %@", buf, 0x16u);

  OUTLINED_FUNCTION_3_0();
}

- (void)setCachedMetadata:(uint64_t)a3 forKey:.cold.1(uint64_t a1, void *a2, uint64_t a3)
{
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_0_3(a1, (uint64_t)a2, a3, 5.8382e-34);
  OUTLINED_FUNCTION_1_1(&dword_1B99BB000, "Unable to encode object for key '%{public}@': %{public}@", v4, v5);

  OUTLINED_FUNCTION_3_0();
}

- (void)cachedMetadataOfClass:(uint64_t)a3 forKey:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_1_2(&dword_1B99BB000, a2, a3, "Cached metadata for key '%{public}@' is of unexpected class.", (uint8_t *)&v3);
}

- (void)cachedMetadataOfClass:(uint64_t)a3 forKey:.cold.2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_1_2(&dword_1B99BB000, a2, a3, "Found invalid JSON for key '%{public}@'.", (uint8_t *)&v3);
}

- (void)cachedMetadataOfClass:(uint64_t)a3 forKey:.cold.3(uint64_t a1, void *a2, uint64_t a3)
{
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_0_3(a1, (uint64_t)a2, a3, 5.8382e-34);
  OUTLINED_FUNCTION_1_1(&dword_1B99BB000, "Unable to decode cached metadata for key '%{public}@': %{public}@", v4, v5);

  OUTLINED_FUNCTION_3_0();
}

- (void)requestRepresentationWithOptions:(NSObject *)a3 delegate:(void *)a4 completionHandler:.cold.1(void *a1, uint64_t a2, NSObject *a3, void *a4)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_1_2(&dword_1B99BB000, a3, (uint64_t)a3, "available representations does not contain requested representation: {%{public}@}", (uint8_t *)a2);

  OUTLINED_FUNCTION_3_0();
}

@end
