@implementation ICWidget(Visibility)

- (uint64_t)hidesObject:()Visibility
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
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
  void *v22;
  void *v23;
  void *v24;

  v3 = a3;
  if ((objc_msgSend(v3, "isDeleted") & 1) == 0)
  {
    objc_opt_class();
    ICDynamicCast();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v4 = objc_msgSend(v5, "markedForDeletion");
LABEL_9:

      goto LABEL_10;
    }
    objc_opt_class();
    ICDynamicCast();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "account");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "markedForDeletion");
      goto LABEL_7;
    }
    ICProtocolCast();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v12;
    if (v12)
    {
      if (!objc_msgSend(v12, "enabled"))
      {
        v4 = 1;
        goto LABEL_8;
      }
      v10 = objc_msgSend(v9, "didChooseToMigrate");
LABEL_7:
      v4 = v10;
LABEL_8:

      goto LABEL_9;
    }
    objc_opt_class();
    ICDynamicCast();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      if ((objc_msgSend(v13, "markedForDeletion") & 1) != 0 || (objc_msgSend(v14, "isTrashFolder") & 1) != 0)
      {
        v4 = 1;
LABEL_44:

        goto LABEL_8;
      }
      objc_msgSend(v14, "account");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        objc_msgSend(v14, "account");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = objc_msgSend(v17, "markedForDeletion");
LABEL_42:

        goto LABEL_43;
      }
LABEL_26:
      v4 = 1;
LABEL_43:

      goto LABEL_44;
    }
    ICProtocolCast();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      if ((objc_msgSend(v15, "isDeletedOrInTrash") & 1) != 0 || (objc_msgSend(v16, "isTrashFolder") & 1) != 0)
        goto LABEL_26;
      objc_msgSend(v16, "account");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "enabled"))
      {
        objc_msgSend(v16, "account");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = objc_msgSend(v18, "didChooseToMigrate");
LABEL_41:

        goto LABEL_42;
      }
LABEL_29:
      v4 = 1;
      goto LABEL_42;
    }
    objc_opt_class();
    ICDynamicCast();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v19;
    if (v19)
    {
      if ((objc_msgSend(v19, "isDeletedOrInTrash") & 1) != 0)
        goto LABEL_29;
      objc_msgSend(v17, "account");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        objc_msgSend(v17, "account");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = objc_msgSend(v21, "markedForDeletion");
LABEL_40:

        goto LABEL_41;
      }
    }
    else
    {
      ICProtocolCast();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v20;
      if (v20
        && (objc_msgSend(v20, "isMarkedForDeletion") & 1) == 0
        && (objc_msgSend(v18, "isDeletedOrInTrash") & 1) == 0)
      {
        objc_msgSend(v18, "folder");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "account");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v24, "enabled"))
        {
          objc_msgSend(v18, "folder");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "account");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v4 = objc_msgSend(v22, "didChooseToMigrate");

        }
        else
        {
          v4 = 1;
        }

        goto LABEL_40;
      }
    }
    v4 = 1;
    goto LABEL_41;
  }
  v4 = 1;
LABEL_10:

  return v4;
}

@end
