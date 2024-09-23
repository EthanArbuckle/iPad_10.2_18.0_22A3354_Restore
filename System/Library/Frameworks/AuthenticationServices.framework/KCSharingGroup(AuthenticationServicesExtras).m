@implementation KCSharingGroup(AuthenticationServicesExtras)

- (id)as_groupMemberTableViewCellDescription
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;

  objc_msgSend(a1, "participants");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3 != 1)
  {
    +[_ASAccountSharingGroupMemberDataManager sharedManager](_ASAccountSharingGroupMemberDataManager, "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "groupMemberDataForGroup:", a1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "count");
    v9 = v8 + ~objc_msgSend(v7, "count");
    v10 = objc_msgSend(v7, "count");
    switch(v10)
    {
      case 2:
        v11 = (void *)MEMORY[0x24BDD17C8];
        if (!v9)
        {
          _WBSLocalizedString();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "stringWithFormat:", v12, v13, v14);
          v19 = objc_claimAutoreleasedReturnValue();
          goto LABEL_19;
        }
        _WBSLocalizedString();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "localizedStringWithFormat:", v12, v13, v14, v9);
        break;
      case 1:
        v15 = (void *)MEMORY[0x24BDD17C8];
        _WBSLocalizedString();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          objc_msgSend(v15, "localizedStringWithFormat:", v12, v13, v9);
        else
          objc_msgSend(v15, "stringWithFormat:", v12, v13);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_21;
      case 0:
        objc_msgSend(a1, "_subtitleForNumberOfGroupMembersNotSavedAsContacts:", objc_msgSend(v6, "count"));
        v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_22:

        return v4;
      default:
        v16 = objc_msgSend(v7, "count");
        v17 = (void *)MEMORY[0x24BDD17C8];
        if (v16 == 3 && !v9)
        {
          _WBSLocalizedString();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "objectAtIndexedSubscript:", 2);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "stringWithFormat:", v12, v13, v14, v18);
          v4 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_20:
LABEL_21:

          goto LABEL_22;
        }
        _WBSLocalizedString();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "localizedStringWithFormat:", v12, v13, v14, objc_msgSend(v6, "count") - 3);
        break;
    }
    v19 = objc_claimAutoreleasedReturnValue();
LABEL_19:
    v4 = (void *)v19;
    goto LABEL_20;
  }
  _WBSLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  return v4;
}

- (id)_subtitleForNumberOfGroupMembersNotSavedAsContacts:()AuthenticationServicesExtras
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  if (a3 == 2 || (v3 = a3 - 1, a3 == 1))
  {
    _WBSLocalizedString();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x24BDD17C8];
    _WBSLocalizedString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringWithFormat:", v6, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

@end
