@implementation GKPlayer(Contact)

- (void)initWithContact:()Contact
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D252B0], "internalRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(a1, "initWithInternalRepresentation:", v5);
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "setContact:", v4);

  return v7;
}

- (id)contact
{
  return objc_getAssociatedObject(a1, CFSTR("_gkCNContact"));
}

- (void)setContact:()Contact
{
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
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  objc_setAssociatedObject(a1, CFSTR("_gkCNContact"), v22, (void *)0x301);
  v4 = v22;
  if (v22)
  {
    objc_msgSend(v22, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "internal");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPlayerID:", v5);

    objc_msgSend(a1, "internal");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "playerID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "UUIDString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "internal");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setPlayerID:", v10);

    }
    objc_msgSend(v22, "givenName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "internal");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFirstName:", v12);

    objc_msgSend(v22, "familyName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "internal");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setLastName:", v14);

    objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v22, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "internal");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setCompositeName:", v16);

    objc_msgSend(a1, "internal");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAlias:", 0);

    objc_msgSend(a1, "internal");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setAvatarType:", &unk_1E5A5E628);

    +[GKMessageUtilities messagesRecipientHandleForContact:](GKMessageUtilities, "messagesRecipientHandleForContact:", v22);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(a1, "internal");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setMessagesID:", v20);

    }
    v4 = v22;
  }

}

@end
