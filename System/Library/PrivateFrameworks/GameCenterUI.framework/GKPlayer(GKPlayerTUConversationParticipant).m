@implementation GKPlayer(GKPlayerTUConversationParticipant)

- (void)initWithParticipant:()GKPlayerTUConversationParticipant forBundleID:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D252B0], "internalRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(a1, "initWithInternalRepresentation:", v8);
  v10 = v9;
  if (v9)
    objc_msgSend(v9, "setTuParticipant:forBundleID:", v6, v7);

  return v10;
}

- (id)tuParticipant
{
  return objc_getAssociatedObject(a1, CFSTR("_gkTUParticipant"));
}

- (void)setTuParticipant:()GKPlayerTUConversationParticipant
{
  objc_setAssociatedObject(a1, CFSTR("_gkTUParticipant"), a3, (void *)0x301);
}

- (void)setTuParticipant:()GKPlayerTUConversationParticipant forBundleID:
{
  id v6;
  void *v7;
  uint64_t v8;
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
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id value;

  value = a3;
  v6 = a4;
  objc_setAssociatedObject(a1, CFSTR("_gkTUParticipant"), value, (void *)0x301);
  if (value)
  {
    objc_msgSend(value, "identifier");
    objc_msgSend(v6, "dataUsingEncoding:", 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = IDSIDAliasHashUInt64();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "internal");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setPlayerID:", v9);

    objc_msgSend(a1, "internal");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "playerID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "UUIDString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "internal");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setPlayerID:", v14);

    }
    objc_msgSend(a1, "setTuParticipant:", value);
    objc_msgSend(a1, "internal");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAlias:", 0);

    v17 = (void *)objc_opt_new();
    objc_msgSend(value, "handle");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "value");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[GKMessageUtilities contactFromEmailOrPhoneNumber:fromContactStore:](GKMessageUtilities, "contactFromEmailOrPhoneNumber:fromContactStore:", v19, v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v21 = objc_alloc_init(MEMORY[0x1E0C97218]);
      objc_msgSend(v21, "stringFromContact:", v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1, "internal");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setAlias:", v22);

      objc_msgSend(a1, "internal");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setContact:", v20);

    }
    objc_msgSend(value, "handle");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "value");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "internal");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setCompositeName:", v26);

    objc_msgSend(a1, "internal");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setAvatarType:", &unk_1E5A5E5B0);

    objc_msgSend(value, "handle");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "value");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "internal");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setMessagesID:", v30);

  }
}

@end
