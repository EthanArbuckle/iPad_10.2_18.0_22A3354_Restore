@implementation ICInvitation

+ (id)predicateForPendingInvitationsInAccount:(id)a3 receivedSince:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0CB3528];
  v7 = a4;
  objc_msgSend(a1, "predicateForPendingInvitationsInAccount:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("receivedDate >= %@"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v13[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "andPredicateWithSubpredicates:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)predicateForPendingInvitationsInAccount:(id)a3
{
  uint64_t v4;

  if (a3)
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("account == %@ AND rootObject == NIL"), a3);
  else
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("rootObject == NIL"), v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)invitationsMatchingPredicate:(id)a3 context:(id)a4
{
  void *v4;
  void *v5;
  id v6;

  +[ICInvitation ic_objectsMatchingPredicate:context:](ICInvitation, "ic_objectsMatchingPredicate:context:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = (void *)MEMORY[0x1E0C9AA60];
  v6 = v4;

  return v6;
}

+ (NSValueTransformer)shareSystemFieldsTransformer
{
  if (shareSystemFieldsTransformer_onceToken_0 != -1)
    dispatch_once(&shareSystemFieldsTransformer_onceToken_0, &__block_literal_global_40);
  return (NSValueTransformer *)(id)shareSystemFieldsTransformer_transformer;
}

void __44__ICInvitation_shareSystemFieldsTransformer__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C95110], "ic_systemFieldsValueTransformer");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)shareSystemFieldsTransformer_transformer;
  shareSystemFieldsTransformer_transformer = v0;

}

- (CKShare)serverShare
{
  CKShare *serverShare;
  void *v4;
  void *v5;
  void *v6;
  CKShare *v7;
  CKShare *v8;

  serverShare = self->_serverShare;
  if (!serverShare)
  {
    -[ICInvitation serverShareData](self, "serverShareData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend((id)objc_opt_class(), "shareSystemFieldsTransformer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICInvitation serverShareData](self, "serverShareData");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "reverseTransformedValue:", v6);
      v7 = (CKShare *)objc_claimAutoreleasedReturnValue();
      v8 = self->_serverShare;
      self->_serverShare = v7;

    }
    else
    {
      v5 = self->_serverShare;
      self->_serverShare = 0;
    }

    serverShare = self->_serverShare;
  }
  return serverShare;
}

- (void)setServerShare:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if ((-[CKShare isEqual:](self->_serverShare, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_serverShare, a3);
    if (v7)
    {
      objc_msgSend((id)objc_opt_class(), "shareSystemFieldsTransformer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "transformedValue:", v7);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICInvitation setServerShareData:](self, "setServerShareData:", v6);

    }
    else
    {
      -[ICInvitation setServerShareData:](self, "setServerShareData:", 0);
    }
  }

}

+ (id)makeInvitationWithShareURL:(id)a3 account:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C97B20], "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("ICInvitation"), v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "persistentStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assignObject:toPersistentStore:", v11, v12);

  objc_msgSend(v9, "URLByDeletingFragment");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setShareURL:", v13);
  objc_msgSend(v11, "setAccount:", v8);

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setReceivedDate:", v14);

  return v11;
}

+ (id)makeInvitationIfNeededWithShareURL:(id)a3 account:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "URLByDeletingFragment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "invitationWithShareURL:context:", v11, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    objc_msgSend(v8, "URLByDeletingFragment");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "makeInvitationWithShareURL:account:context:", v15, v9, v10);
    v14 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v14;
}

+ (id)allInvitationsInContext:(id)a3
{
  return (id)objc_msgSend(a1, "invitationsMatchingPredicate:context:", 0, a3);
}

+ (ICInvitation)invitationWithShareURL:(id)a3 context:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = (void *)MEMORY[0x1E0CB3880];
  v7 = a4;
  objc_msgSend(a3, "URLByDeletingFragment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("shareURL == %@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "invitationsMatchingPredicate:context:", v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICInvitation *)v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverShare, 0);
}

@end
