@implementation _ASPasswordManagerDeleteAlertConfiguration

+ (id)configurationForDeleting:(unint64_t)a3 fromSavedAccount:(id)a4 isUndoable:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  uint64_t v9;
  void *v10;

  v5 = a5;
  v8 = a4;
  switch(a3)
  {
    case 0uLL:
      objc_msgSend(a1, "_configurationForAlertToDeletePasswordFromSavedAccount:isUndoable:", v8, v5);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 1uLL:
      objc_msgSend(a1, "_configurationForAlertToDeleteVerificationCodeFromSavedAccount:isUndoable:", v8, v5);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 2uLL:
      objc_msgSend(a1, "_configurationForAlertToDeletePasskeyFromSavedAccount:isUndoable:", v8, v5);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 3uLL:
      objc_msgSend(a1, "_configurationForAlertToStopUsingSignInWithAppleFromSavedAccount:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 4uLL:
      objc_msgSend(a1, "_configurationForAlertToDeletePasswordAndPasskeyFromSavedAccount:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v10 = (void *)v9;
      break;
    default:
      v10 = 0;
      break;
  }

  return v10;
}

+ (id)configurationForDeleting:(unint64_t)a3 fromSavedAccount:(id)a4
{
  return (id)objc_msgSend(a1, "configurationForDeleting:fromSavedAccount:isUndoable:", a3, a4, 0);
}

- (id)_initWithTitle:(id)a3 subtitle:(id)a4 buttonTitle:(id)a5 cancelButtonTitle:(id)a6 isPermanentlyRemovingFromRecentlyDeleted:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  _ASPasswordManagerDeleteAlertConfiguration *v16;
  uint64_t v17;
  NSString *title;
  uint64_t v19;
  NSString *subtitle;
  uint64_t v21;
  NSString *buttonTitle;
  uint64_t v23;
  NSString *cancelButtonTitle;
  _ASPasswordManagerDeleteAlertConfiguration *v25;
  objc_super v27;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v27.receiver = self;
  v27.super_class = (Class)_ASPasswordManagerDeleteAlertConfiguration;
  v16 = -[_ASPasswordManagerDeleteAlertConfiguration init](&v27, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v12, "copy");
    title = v16->_title;
    v16->_title = (NSString *)v17;

    v19 = objc_msgSend(v13, "copy");
    subtitle = v16->_subtitle;
    v16->_subtitle = (NSString *)v19;

    v21 = objc_msgSend(v14, "copy");
    buttonTitle = v16->_buttonTitle;
    v16->_buttonTitle = (NSString *)v21;

    v23 = objc_msgSend(v15, "copy");
    cancelButtonTitle = v16->_cancelButtonTitle;
    v16->_cancelButtonTitle = (NSString *)v23;

    v16->_isPermanentlyRemovingFromRecentlyDeleted = a7;
    v25 = v16;
  }

  return v16;
}

+ (id)_configurationForAlertToDeletePasswordFromSavedAccount:(id)a3 isUndoable:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;

  v4 = a4;
  v6 = a3;
  objc_msgSend(a1, "_titleStringForAlertToDeletePasswordFromSavedAccount:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_subtitleStringForAlertToDeletePasswordFromSavedAccount:isUndoable:", v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(a1, "_isPermanentlyDeletingSavedAccount:", v6);

  v11 = objc_alloc((Class)a1);
  objc_msgSend(a1, "_cancelButtonTitleStringForAlertToDeleteAccount");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "_initWithTitle:subtitle:buttonTitle:cancelButtonTitle:isPermanentlyRemovingFromRecentlyDeleted:", v7, v8, v9, v12, v10);

  return v13;
}

+ (id)_configurationForAlertToDeletePasskeyFromSavedAccount:(id)a3 isUndoable:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;

  v4 = a4;
  v6 = a3;
  objc_msgSend(a1, "_titleStringForAlertToDeletePasskeyFromSavedAccount:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_subtitleStringForAlertToDeletePasskeyFromSavedAccount:isUndoable:", v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(a1, "_isPermanentlyDeletingSavedAccount:", v6);

  v11 = objc_alloc((Class)a1);
  objc_msgSend(a1, "_cancelButtonTitleStringForAlertToDeleteAccount");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "_initWithTitle:subtitle:buttonTitle:cancelButtonTitle:isPermanentlyRemovingFromRecentlyDeleted:", v7, v8, v9, v12, v10);

  return v13;
}

+ (id)_configurationForAlertToDeleteVerificationCodeFromSavedAccount:(id)a3 isUndoable:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;

  v4 = a4;
  v6 = a3;
  objc_msgSend(a1, "_titleStringForAlertToDeleteVerificationCodeFromSavedAccount:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_subtitleStringForAlertToDeleteVerificationCodeFromSavedAccount:isUndoable:", v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(a1, "_isPermanentlyDeletingSavedAccount:", v6);

  v11 = objc_alloc((Class)a1);
  objc_msgSend(a1, "_cancelButtonTitleStringForAlertToDeleteAccount");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "_initWithTitle:subtitle:buttonTitle:cancelButtonTitle:isPermanentlyRemovingFromRecentlyDeleted:", v7, v8, v9, v12, v10);

  return v13;
}

+ (id)_configurationForAlertToStopUsingSignInWithAppleFromSavedAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(a1, "_titleStringForAlertToStopUsingSignInWithAppleForSavedAccount:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_subtitleStringForAlertToStopUsingSignInWithAppleForSavedAccount:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_buttonTitleStringForAlertToStopUsingSignInWithAppleForSavedAccount:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_cancelButtonTitleStringForAlertToStopUsingSignInWithAppleForSavedAccount:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithTitle:subtitle:buttonTitle:cancelButtonTitle:isPermanentlyRemovingFromRecentlyDeleted:", v5, v6, v7, v8, 1);
  return v9;
}

+ (id)_titleStringForAlertToStopUsingSignInWithAppleForSavedAccount:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  if ((objc_msgSend(v3, "isCurrentUserOriginalContributor") & 1) != 0)
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    _WBSLocalizedString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "signInWithAppleAccount");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedAppName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _WBSLocalizedString();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

+ (id)_subtitleStringForAlertToStopUsingSignInWithAppleForSavedAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if ((objc_msgSend(v4, "isCurrentUserOriginalContributor") & 1) != 0)
  {
    _WBSLocalizedString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    _WBSLocalizedString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_originalContributorDisplayNameForSavedAccount:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", v7, v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

+ (id)_originalContributorDisplayNameForSavedAccount:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  +[_ASAccountSharingGroupMemberDataManager sharedManager](_ASAccountSharingGroupMemberDataManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "originalContributorParticipantID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sharedGroupID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "displayNameForOriginalContributorParticipantID:inGroupID:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_buttonTitleStringForAlertToStopUsingSignInWithAppleForSavedAccount:(id)a3
{
  objc_msgSend(a3, "isCurrentUserOriginalContributor");
  _WBSLocalizedString();
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_cancelButtonTitleStringForAlertToStopUsingSignInWithAppleForSavedAccount:(id)a3
{
  objc_msgSend(a3, "isCurrentUserOriginalContributor");
  _WBSLocalizedString();
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_configurationForAlertToDeletePasswordAndPasskeyFromSavedAccount:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v4 = (void *)MEMORY[0x24BDBCE30];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "configurationForDeletingSavedAccounts:", v6, v9, v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)configurationForDeletingSavedAccounts:(id)a3
{
  id v4;
  uint64_t v5;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;
  unsigned __int8 v18;
  uint64_t v19;

  v4 = a3;
  v19 = 0;
  v18 = 0;
  v16 = 0;
  v17 = 0;
  v5 = objc_msgSend(a1, "_isPermanentlyDeletingSavedAccounts:", v4);
  v15 = 0;
  objc_msgSend(a1, "_getInformationForSavedAccountsToDelete:numberOfPasswords:numberOfPasskeys:numberOfSiwaAccounts:isDeletingVerificationCodes:hasSharedAccounts:areAllAccountsShared:", v4, &v19, &v17, &v16, &v18, (char *)&v15 + 1, &v15);
  if (v16 == 1 && v17 == 0 && v19 == 0)
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "configurationForDeleting:fromSavedAccount:", 3, v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "_titleStringForAlertToDeleteNumberOfPasswords:numberOfPasskeys:numberOfSiwaAccounts:isDeletingSharedAccounts:isPermanentlyDeleting:", v19);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_subtitleStringForAlertToDeleteNumberOfPasswords:numberOfPasskeys:numberOfSiwaAccounts:isDeletingVerificationCodes:isDeletingSharedAccounts:isPermanentlyDeleting:", v19, v17, v16, v18, HIBYTE(v15), v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_buttonTitleStringForAlertToDeleteNumberOfPasswords:numberOfPasskeys:numberOfSiwaAccounts:isDeletingSharedAccounts:", v19, v17, v16, v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_alloc((Class)a1);
    objc_msgSend(a1, "_cancelButtonTitleStringForAlertToDeleteAccount");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "_initWithTitle:subtitle:buttonTitle:cancelButtonTitle:isPermanentlyRemovingFromRecentlyDeleted:", v8, v9, v10, v12, v5);

  }
  return v13;
}

+ (BOOL)_isPermanentlyDeletingSavedAccounts:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  void *v9;
  char v10;

  v4 = a3;
  objc_msgSend(v4, "safari_filterObjectsUsingBlock:", &__block_literal_global_10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  v7 = objc_msgSend(v4, "count");
  if (v6 >= 2 && v6 == v7)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(v4, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(a1, "_isPermanentlyDeletingSavedAccount:", v9);

  }
  return v10;
}

+ (BOOL)_isPermanentlyDeletingSavedAccount:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = (objc_msgSend(v3, "isRecentlyDeleted") & 1) != 0
    || (objc_msgSend(v3, "userIsNeverSaveMarker") & 1) != 0
    || objc_msgSend(v3, "credentialTypes") == 4;

  return v4;
}

+ (id)_titleStringForAlertToDeletePasswordFromSavedAccount:(id)a3
{
  void *v3;

  objc_msgSend(a3, "isSavedInSharedGroup");
  if (objc_msgSend(MEMORY[0x24BE0B290], "isPad"))
  {
    _WBSLocalizedString();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

+ (id)_titleStringForAlertToDeleteVerificationCodeFromSavedAccount:(id)a3
{
  void *v3;

  objc_msgSend(a3, "isSavedInSharedGroup");
  if (objc_msgSend(MEMORY[0x24BE0B290], "isPad"))
  {
    _WBSLocalizedString();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

+ (id)_titleStringForAlertToDeletePasskeyFromSavedAccount:(id)a3
{
  void *v3;

  objc_msgSend(a3, "isSavedInSharedGroup");
  if (objc_msgSend(MEMORY[0x24BE0B290], "isPad"))
  {
    _WBSLocalizedString();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

+ (id)_subtitleStringForAlertToDeletePasswordFromSavedAccount:(id)a3 isUndoable:(BOOL)a4
{
  id v5;
  void *v6;

  v5 = a3;
  if (objc_msgSend(v5, "isRecentlyDeleted"))
    objc_msgSend(a1, "_subtitleStringForAlertToPermanentlyDeletePasswordFromSavedAccount:", v5);
  else
    objc_msgSend(a1, "_subtitleStringForAlertToSoftDeletePasswordFromSavedAccount:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_subtitleStringForAlertToPermanentlyDeletePasswordFromSavedAccount:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if ((objc_msgSend(a1, "_isKeychainSyncEnabled") & 1) != 0)
    objc_msgSend(v4, "isSavedInSharedGroup");
  _WBSLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_subtitleStringForAlertToSoftDeletePasswordFromSavedAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v4 = a3;
  if ((objc_msgSend(v4, "hasValidWebsite") & 1) != 0)
    objc_msgSend(v4, "highLevelDomain");
  else
    objc_msgSend(v4, "effectiveTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(a1, "_isKeychainSyncEnabled") & 1) != 0)
  {
    objc_msgSend(v4, "isSavedInSharedGroup");
    objc_msgSend(v4, "totpGenerators");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      v8 = (void *)MEMORY[0x24BDD17C8];
LABEL_10:
      _WBSLocalizedString();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", v12, v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_11;
    }
  }
  else
  {
    objc_msgSend(v4, "totpGenerators");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (v10)
    {
      v8 = (void *)MEMORY[0x24BDD17C8];
      goto LABEL_10;
    }
  }
  _WBSLocalizedString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v11;
}

+ (id)_subtitleStringForAlertToDeleteVerificationCodeFromSavedAccount:(id)a3 isUndoable:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = a3;
  objc_msgSend(v5, "customTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(v5, "serviceName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      objc_msgSend(v5, "highLevelDomain");
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v11;

  }
  if ((objc_msgSend(a1, "_isKeychainSyncEnabled") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BE82CC8], "isPasswordManagerAppEnabled");
    objc_msgSend(v5, "isSavedInSharedGroup");
  }
  v12 = (void *)MEMORY[0x24BDD17C8];
  _WBSLocalizedString();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", v13, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)_subtitleStringForAlertToDeletePasskeyFromSavedAccount:(id)a3 isUndoable:(BOOL)a4
{
  id v5;
  void *v6;

  v5 = a3;
  if (objc_msgSend(v5, "isRecentlyDeleted"))
    objc_msgSend(a1, "_subtitleStringForAlertToPermanentlyDeletePasskeyFromSavedAccount:", v5);
  else
    objc_msgSend(a1, "_subtitleStringForAlertToSoftDeletePasskeyFromSavedAccount:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_subtitleStringForAlertToPermanentlyDeletePasskeyFromSavedAccount:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if ((objc_msgSend(a1, "_isKeychainSyncEnabled") & 1) != 0)
    objc_msgSend(v4, "isSavedInSharedGroup");
  _WBSLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_subtitleStringForAlertToSoftDeletePasskeyFromSavedAccount:(id)a3
{
  return (id)_WBSLocalizedString();
}

+ (id)_cancelButtonTitleStringForAlertToDeleteAccount
{
  return (id)_WBSLocalizedString();
}

+ (id)_titleStringForAlertToDeleteNumberOfPasswords:(unint64_t)a3 numberOfPasskeys:(unint64_t)a4 numberOfSiwaAccounts:(unint64_t)a5 isDeletingSharedAccounts:(BOOL)a6 isPermanentlyDeleting:(BOOL)a7
{
  void *v7;

  if (objc_msgSend(MEMORY[0x24BE0B290], "isPad", a3, a4, a5, a6, a7))
  {
    _WBSLocalizedString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

+ (id)_subtitleStringForAlertToDeleteNumberOfPasswords:(unint64_t)a3 numberOfPasskeys:(unint64_t)a4 numberOfSiwaAccounts:(unint64_t)a5 isDeletingVerificationCodes:(BOOL)a6 isDeletingSharedAccounts:(BOOL)a7 isPermanentlyDeleting:(BOOL)a8
{
  _BOOL4 v8;
  _BOOL4 v9;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v8 = a8;
  v9 = a6;
  objc_msgSend(a1, "_credentialDeletionStringForAlertToDeleteNumberOfPasswords:numberOfPasskeys:numberOfSiwaAccounts:isDeletingSharedAccounts:isPermanentlyDeleting:", a3, a4, a5, a7, a8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (a3 && v9 && !v8)
  {
    v14 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(a1, "_subtitleForDeletingNumberOfPasswordsWithVerificationCodes:", a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringWithFormat:", CFSTR("%@\n\n%@"), v15, v13);
    v16 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = v12;
  }

  return v16;
}

+ (id)_credentialDeletionStringForAlertToDeleteNumberOfPasswords:(unint64_t)a3 numberOfPasskeys:(unint64_t)a4 numberOfSiwaAccounts:(unint64_t)a5 isDeletingSharedAccounts:(BOOL)a6 isPermanentlyDeleting:(BOOL)a7
{
  id v9;
  void *v10;
  void *v11;
  void *v12;

  if (!a5 || a4 | a3)
  {
    objc_msgSend(a1, "_deletionStringForAlertToDeleteNumberOfPasswords:numberOfPasskeys:isDeletingSharedAccounts:isPermanentlyDeleting:", a3, a4, a6, a7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (a5)
    {
      objc_msgSend(a1, "_credentialDeletionStringForAlertToDeleteNumberOfSiwaAccounts:", a5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", CFSTR("%@\n\n%@"), v11, v12);
      v9 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = v10;
    }

  }
  else
  {
    objc_msgSend(a1, "_credentialDeletionStringForAlertToDeleteNumberOfSiwaAccounts:", a5);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

+ (id)_credentialDeletionStringForAlertToDeleteNumberOfSiwaAccounts:(unint64_t)a3
{
  _WBSLocalizedString();
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_deletionStringForAlertToDeleteNumberOfPasswords:(unint64_t)a3 numberOfPasskeys:(unint64_t)a4 isDeletingSharedAccounts:(BOOL)a5 isPermanentlyDeleting:(BOOL)a6
{
  int v8;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;

  v8 = objc_msgSend(a1, "_isKeychainSyncEnabled");
  v10 = a3 == 1 && a4 == 1;
  if (!v8)
  {
    if (v10)
      goto LABEL_18;
    if (a3 == 1 && a4)
    {
      v11 = (void *)MEMORY[0x24BDD17C8];
      goto LABEL_25;
    }
    if (a3 && a4 == 1)
    {
      v13 = (void *)MEMORY[0x24BDD17C8];
    }
    else
    {
      if (a3 && a4)
      {
        v16 = (void *)MEMORY[0x24BDD17C8];
        _WBSLocalizedString();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "localizedStringWithFormat:", v14, a4, a3);
        goto LABEL_33;
      }
      if (a4 == 1)
        goto LABEL_18;
      if (a4)
      {
        v11 = (void *)MEMORY[0x24BDD17C8];
        goto LABEL_25;
      }
      if (a3 == 1)
        goto LABEL_18;
      v13 = (void *)MEMORY[0x24BDD17C8];
    }
LABEL_32:
    _WBSLocalizedString();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringWithFormat:", v14, a3, v18);
    goto LABEL_33;
  }
  if (!v10)
  {
    if (a3 == 1 && a4)
    {
      v11 = (void *)MEMORY[0x24BDD17C8];
LABEL_25:
      _WBSLocalizedString();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedStringWithFormat:", v14, a4, v18);
LABEL_33:
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      return v12;
    }
    if (a3 && a4 == 1)
    {
      v13 = (void *)MEMORY[0x24BDD17C8];
    }
    else
    {
      if (a3 && a4)
      {
        v15 = (void *)MEMORY[0x24BDD17C8];
        _WBSLocalizedString();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "localizedStringWithFormat:", v14, a4, a3);
        goto LABEL_33;
      }
      if (a4 == 1)
        goto LABEL_18;
      if (a4)
      {
        v11 = (void *)MEMORY[0x24BDD17C8];
        goto LABEL_25;
      }
      if (a3 == 1)
        goto LABEL_18;
      v13 = (void *)MEMORY[0x24BDD17C8];
    }
    goto LABEL_32;
  }
LABEL_18:
  _WBSLocalizedString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  return v12;
}

+ (id)_subtitleForDeletingNumberOfPasswordsWithVerificationCodes:(unint64_t)a3
{
  void *v3;
  void *v5;
  void *v6;

  if (a3 == 1)
  {
    _WBSLocalizedString();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x24BDD17C8];
    _WBSLocalizedString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringWithFormat:", v6, a3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

+ (id)_buttonTitleStringForAlertToDeleteNumberOfPasswords:(unint64_t)a3 numberOfPasskeys:(unint64_t)a4 numberOfSiwaAccounts:(unint64_t)a5 isDeletingSharedAccounts:(BOOL)a6
{
  void *v8;
  void *v10;
  void *v11;
  void *v12;

  if ((a4 | a3 || !a5) && (!a3 || !a4) && a4 != 1)
  {
    if (a4)
    {
      v10 = (void *)MEMORY[0x24BDD17C8];
      _WBSLocalizedString();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localizedStringWithFormat:", v11, a4);
LABEL_12:
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      return v8;
    }
    if (a3 != 1)
    {
      v12 = (void *)MEMORY[0x24BDD17C8];
      _WBSLocalizedString();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringWithFormat:", v11, a3);
      goto LABEL_12;
    }
  }
  _WBSLocalizedString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  return v8;
}

+ (void)_getInformationForSavedAccountsToDelete:(id)a3 numberOfPasswords:(unint64_t *)a4 numberOfPasskeys:(unint64_t *)a5 numberOfSiwaAccounts:(unint64_t *)a6 isDeletingVerificationCodes:(BOOL *)a7 hasSharedAccounts:(BOOL *)a8 areAllAccountsShared:(BOOL *)a9
{
  uint64_t v9;
  uint64_t v10;
  char v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  BOOL v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  char v21;
  char v22;
  uint64_t v23;
  uint64_t v29;
  id obj;
  unint64_t v31;
  unint64_t v32;
  char v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = a3;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = *(_QWORD *)v35;
    v17 = 1;
    while (1)
    {
      v18 = 0;
      v29 = v10;
      do
      {
        if (*(_QWORD *)v35 != v16)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v18);
        v33 = objc_msgSend(v19, "credentialTypes");
        v32 = objc_msgSend(v19, "credentialTypes");
        v31 = objc_msgSend(v19, "credentialTypes");
        if (v15)
        {
          v15 = 1;
          if ((v11 & 1) == 0)
            goto LABEL_8;
        }
        else
        {
          objc_msgSend(v19, "totpGenerators");
          v20 = v16;
          v21 = v17;
          v22 = v11;
          v23 = objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend((id)v23, "count") != 0;

          LOBYTE(v23) = v22;
          v17 = v21;
          v16 = v20;
          v10 = v29;
          if ((v23 & 1) == 0)
          {
LABEL_8:
            v11 = objc_msgSend(v19, "isSavedInSharedGroup");
            if ((v17 & 1) == 0)
              goto LABEL_9;
            goto LABEL_12;
          }
        }
        v11 = 1;
        if ((v17 & 1) == 0)
        {
LABEL_9:
          v17 = 0;
          goto LABEL_13;
        }
LABEL_12:
        v17 = objc_msgSend(v19, "isSavedInSharedGroup");
LABEL_13:
        v12 += v33 & 1;
        v13 += (v32 >> 1) & 1;
        v14 += (v31 >> 2) & 1;
        ++v18;
      }
      while (v10 != v18);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      if (!v10)
        goto LABEL_17;
    }
  }
  v11 = 0;
  v12 = 0;
  v13 = 0;
  v14 = 0;
  v15 = 0;
  v17 = 1;
LABEL_17:
  *a4 = v12;
  *a5 = v13;
  *a6 = v14;
  *a7 = v15;
  *a8 = v11;
  *a9 = v17;

}

+ (BOOL)_isKeychainSyncEnabled
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x24BE82CF0], "sharedMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "keychainSyncSettingValue") == 2;

  return v3;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)buttonTitle
{
  return self->_buttonTitle;
}

- (NSString)cancelButtonTitle
{
  return self->_cancelButtonTitle;
}

- (BOOL)isPermanentlyRemovingFromRecentlyDeleted
{
  return self->_isPermanentlyRemovingFromRecentlyDeleted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelButtonTitle, 0);
  objc_storeStrong((id *)&self->_buttonTitle, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
