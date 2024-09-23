@implementation ICAuthenticationPrompt

- (NSString)customAccountName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0D639C8];
  -[ICAuthenticationPrompt object](self, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allActiveAccountsInContext:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v6, "count") < 2)
  {
    v9 = 0;
  }
  else
  {
    -[ICAuthenticationPrompt account](self, "account");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ic_trimmedString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v9;
}

- (NSString)deviceAccountName
{
  return 0;
}

- (NSString)cloudAccountName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0D64180], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accountStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationPrompt account](self, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountWithIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "username");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (void)updateStrings
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;

  -[ICAuthenticationPrompt setTitle:](self, "setTitle:", &stru_1E5C2F8C0);
  -[ICAuthenticationPrompt setReason:](self, "setReason:", 0);
  -[ICAuthenticationPrompt setFallbackButtonTitle:](self, "setFallbackButtonTitle:", 0);
  -[ICAuthenticationPrompt setTouchBarReason:](self, "setTouchBarReason:", 0);
  if (-[ICAuthenticationPrompt authenticationMechanism](self, "authenticationMechanism") == 1
    || -[ICAuthenticationPrompt authenticationMechanism](self, "authenticationMechanism") == 3)
  {
    if (-[ICAuthenticationPrompt allowsCustomPasswordAuthentication](self, "allowsCustomPasswordAuthentication"))
    {
      -[ICAuthenticationPrompt customAccountName](self, "customAccountName");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      if (v3)
      {
        objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Try again or enter the notes password for your “%@” account."), CFSTR("Try again or enter the notes password for your “%@” account."), 0, 1);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = (void *)MEMORY[0x1E0CB3940];
        -[ICAuthenticationPrompt customAccountName](self, "customAccountName");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "localizedStringWithFormat:", v4, v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICAuthenticationPrompt setReason:](self, "setReason:", v7);

LABEL_11:
        goto LABEL_12;
      }
    }
    if (-[ICAuthenticationPrompt allowsCustomPasswordAuthentication](self, "allowsCustomPasswordAuthentication"))
    {
      v8 = (void *)MEMORY[0x1E0D64218];
      v9 = CFSTR("Try again or enter your notes password.");
LABEL_10:
      objc_msgSend(v8, "localizedFrameworkStringForKey:value:table:allowSiri:", v9, v9, 0, 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICAuthenticationPrompt setReason:](self, "setReason:", v4);
      goto LABEL_11;
    }
    if (-[ICAuthenticationPrompt allowsDevicePasswordAuthentication](self, "allowsDevicePasswordAuthentication"))
    {
      v8 = (void *)MEMORY[0x1E0D64218];
      v9 = CFSTR("Try again or enter the device passcode.");
      goto LABEL_10;
    }
  }
LABEL_12:
  if (-[ICAuthenticationPrompt authenticationMechanism](self, "authenticationMechanism") == 1
    || -[ICAuthenticationPrompt authenticationMechanism](self, "authenticationMechanism") == 2
    || -[ICAuthenticationPrompt authenticationMechanism](self, "authenticationMechanism") == 3)
  {
    if (-[ICAuthenticationPrompt allowsDevicePasswordAuthentication](self, "allowsDevicePasswordAuthentication"))
      v10 = CFSTR("Enter Passcode");
    else
      v10 = CFSTR("Enter Password");
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", v10, v10, 0, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAuthenticationPrompt setFallbackButtonTitle:](self, "setFallbackButtonTitle:", v11);

  }
  switch(-[ICAuthenticationPrompt intent](self, "intent"))
  {
    case 0uLL:
      -[ICAuthenticationPrompt updateStringsForViewNote](self, "updateStringsForViewNote");
      break;
    case 1uLL:
      -[ICAuthenticationPrompt updateStringsForViewAttachment](self, "updateStringsForViewAttachment");
      break;
    case 2uLL:
      -[ICAuthenticationPrompt updateStringsForAddLock](self, "updateStringsForAddLock");
      break;
    case 3uLL:
      -[ICAuthenticationPrompt updateStringsForRemoveLock](self, "updateStringsForRemoveLock");
      break;
    case 4uLL:
      -[ICAuthenticationPrompt updateStringsForDeleteNotes](self, "updateStringsForDeleteNotes");
      break;
    case 5uLL:
      -[ICAuthenticationPrompt updateStringsForChangePassword](self, "updateStringsForChangePassword");
      break;
    case 6uLL:
      -[ICAuthenticationPrompt updateStringsForResetPassword](self, "updateStringsForResetPassword");
      break;
    case 7uLL:
      -[ICAuthenticationPrompt updateStringsForChangeMode](self, "updateStringsForChangeMode");
      break;
    case 8uLL:
      -[ICAuthenticationPrompt updateStringsForToggleBiometrics](self, "updateStringsForToggleBiometrics");
      break;
    default:
      return;
  }
}

- (void)updateStringsForViewNote
{
  void *v3;
  uint64_t v4;
  void *v5;
  BOOL v6;
  void *v7;
  const __CFString *v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("View Note"), CFSTR("View Note"), 0, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationPrompt setTitle:](self, "setTitle:", v3);

  if (-[ICAuthenticationPrompt authenticationMechanism](self, "authenticationMechanism") != 2)
  {
    if (-[ICAuthenticationPrompt authenticationMechanism](self, "authenticationMechanism") != 4)
    {
      if (-[ICAuthenticationPrompt authenticationMechanism](self, "authenticationMechanism") == 5)
      {
        v7 = (void *)MEMORY[0x1E0D64218];
        v8 = CFSTR("View this note.");
        goto LABEL_15;
      }
      return;
    }
    -[ICAuthenticationPrompt customAccountName](self, "customAccountName");
    v9 = objc_claimAutoreleasedReturnValue();
    if (!v9
      || (v10 = (void *)v9,
          v11 = -[ICAuthenticationPrompt hasDivergedKey](self, "hasDivergedKey"),
          v10,
          v11))
    {
      v7 = (void *)MEMORY[0x1E0D64218];
      v8 = CFSTR("Enter your locked notes password.");
      goto LABEL_15;
    }
    v12 = (void *)MEMORY[0x1E0D64218];
    v13 = CFSTR("Enter the password you created for notes in your “%@” account.");
LABEL_20:
    objc_msgSend(v12, "localizedFrameworkStringForKey:value:table:allowSiri:", v13, v13, 0, 1);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0CB3940];
    -[ICAuthenticationPrompt customAccountName](self, "customAccountName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringWithFormat:", v17, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAuthenticationPrompt setReason:](self, "setReason:", v16);

    goto LABEL_16;
  }
  if (-[ICAuthenticationPrompt allowsCustomPasswordAuthentication](self, "allowsCustomPasswordAuthentication"))
  {
    -[ICAuthenticationPrompt customAccountName](self, "customAccountName");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      v6 = -[ICAuthenticationPrompt hasDivergedKey](self, "hasDivergedKey");

      if (!v6)
      {
        v12 = (void *)MEMORY[0x1E0D64218];
        v13 = CFSTR("Use your fingerprint or enter the password you created for notes in your “%@” account to view this note.");
        goto LABEL_20;
      }
    }
  }
  if (-[ICAuthenticationPrompt allowsCustomPasswordAuthentication](self, "allowsCustomPasswordAuthentication"))
  {
    v7 = (void *)MEMORY[0x1E0D64218];
    v8 = CFSTR("Use your fingerprint or enter your notes password to view this note.");
LABEL_15:
    objc_msgSend(v7, "localizedFrameworkStringForKey:value:table:allowSiri:", v8, v8, 0, 1);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    -[ICAuthenticationPrompt setReason:](self, "setReason:", v17);
LABEL_16:

    return;
  }
  if (-[ICAuthenticationPrompt allowsDevicePasswordAuthentication](self, "allowsDevicePasswordAuthentication"))
  {
    v7 = (void *)MEMORY[0x1E0D64218];
    v8 = CFSTR("Use your fingerprint or enter the device passcode to view locked notes.");
    goto LABEL_15;
  }
}

- (void)updateStringsForViewAttachment
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("View Attachment"), CFSTR("View Attachment"), 0, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationPrompt setTitle:](self, "setTitle:", v3);

  if (-[ICAuthenticationPrompt authenticationMechanism](self, "authenticationMechanism") == 4)
  {
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("This attachment is locked using a previous password."), CFSTR("This attachment is locked using a previous password."), 0, 1);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[ICAuthenticationPrompt setReason:](self, "setReason:", v4);

  }
}

- (void)updateStringsForAddLock
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  id v12;

  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Lock Note"), CFSTR("Lock Note"), 0, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationPrompt setTitle:](self, "setTitle:", v3);

  if (-[ICAuthenticationPrompt authenticationMechanism](self, "authenticationMechanism") == 2)
  {
    if (-[ICAuthenticationPrompt allowsCustomPasswordAuthentication](self, "allowsCustomPasswordAuthentication"))
    {
      -[ICAuthenticationPrompt customAccountName](self, "customAccountName");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
      {
        v5 = (void *)MEMORY[0x1E0D64218];
        v6 = CFSTR("Use your fingerprint or enter the password you created for notes in your “%@” account to lock this note.");
LABEL_8:
        objc_msgSend(v5, "localizedFrameworkStringForKey:value:table:allowSiri:", v6, v6, 0, 1);
        v12 = (id)objc_claimAutoreleasedReturnValue();
        v8 = (void *)MEMORY[0x1E0CB3940];
        -[ICAuthenticationPrompt customAccountName](self, "customAccountName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "localizedStringWithFormat:", v12, v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICAuthenticationPrompt setReason:](self, "setReason:", v10);

LABEL_18:
        return;
      }
    }
    if (-[ICAuthenticationPrompt allowsCustomPasswordAuthentication](self, "allowsCustomPasswordAuthentication"))
    {
      v5 = (void *)MEMORY[0x1E0D64218];
      v11 = CFSTR("Use your fingerprint or enter your notes password to lock this note.");
      goto LABEL_17;
    }
    if (-[ICAuthenticationPrompt allowsDevicePasswordAuthentication](self, "allowsDevicePasswordAuthentication"))
    {
      v5 = (void *)MEMORY[0x1E0D64218];
      v11 = CFSTR("Use your fingerprint or enter the device passcode to lock this note.");
      goto LABEL_17;
    }
  }
  else
  {
    if (-[ICAuthenticationPrompt authenticationMechanism](self, "authenticationMechanism") == 4)
    {
      -[ICAuthenticationPrompt customAccountName](self, "customAccountName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = (void *)MEMORY[0x1E0D64218];
      if (v7)
      {
        v6 = CFSTR("Enter the password you created for notes in your “%@” account.");
        goto LABEL_8;
      }
      v11 = CFSTR("Enter your locked notes password.");
LABEL_17:
      objc_msgSend(v5, "localizedFrameworkStringForKey:value:table:allowSiri:", v11, v11, 0, 1);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      -[ICAuthenticationPrompt setReason:](self, "setReason:", v12);
      goto LABEL_18;
    }
    if (-[ICAuthenticationPrompt authenticationMechanism](self, "authenticationMechanism") == 5)
    {
      v5 = (void *)MEMORY[0x1E0D64218];
      v11 = CFSTR("Lock this note.");
      goto LABEL_17;
    }
  }
}

- (void)updateStringsForRemoveLock
{
  void *v3;
  uint64_t v4;
  void *v5;
  BOOL v6;
  void *v7;
  const __CFString *v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Remove Lock"), CFSTR("Remove Lock"), 0, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationPrompt setTitle:](self, "setTitle:", v3);

  if (-[ICAuthenticationPrompt authenticationMechanism](self, "authenticationMechanism") != 2)
  {
    if (-[ICAuthenticationPrompt authenticationMechanism](self, "authenticationMechanism") != 4)
    {
      if (-[ICAuthenticationPrompt authenticationMechanism](self, "authenticationMechanism") == 5)
      {
        v7 = (void *)MEMORY[0x1E0D64218];
        v8 = CFSTR("Remove the lock.");
        goto LABEL_15;
      }
      return;
    }
    -[ICAuthenticationPrompt customAccountName](self, "customAccountName");
    v9 = objc_claimAutoreleasedReturnValue();
    if (!v9
      || (v10 = (void *)v9,
          v11 = -[ICAuthenticationPrompt hasDivergedKey](self, "hasDivergedKey"),
          v10,
          v11))
    {
      v7 = (void *)MEMORY[0x1E0D64218];
      v8 = CFSTR("Enter your locked notes password.");
      goto LABEL_15;
    }
    v12 = (void *)MEMORY[0x1E0D64218];
    v13 = CFSTR("Enter the password you created for notes in your “%@” account.");
LABEL_20:
    objc_msgSend(v12, "localizedFrameworkStringForKey:value:table:allowSiri:", v13, v13, 0, 1);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0CB3940];
    -[ICAuthenticationPrompt customAccountName](self, "customAccountName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringWithFormat:", v17, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAuthenticationPrompt setReason:](self, "setReason:", v16);

    goto LABEL_16;
  }
  if (-[ICAuthenticationPrompt allowsCustomPasswordAuthentication](self, "allowsCustomPasswordAuthentication"))
  {
    -[ICAuthenticationPrompt customAccountName](self, "customAccountName");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      v6 = -[ICAuthenticationPrompt hasDivergedKey](self, "hasDivergedKey");

      if (!v6)
      {
        v12 = (void *)MEMORY[0x1E0D64218];
        v13 = CFSTR("Use your fingerprint or enter the password you created for notes in your “%@” account to remove the lock from this note.");
        goto LABEL_20;
      }
    }
  }
  if (-[ICAuthenticationPrompt allowsCustomPasswordAuthentication](self, "allowsCustomPasswordAuthentication"))
  {
    v7 = (void *)MEMORY[0x1E0D64218];
    v8 = CFSTR("Use your fingerprint or enter your notes password to remove the lock from this note.");
LABEL_15:
    objc_msgSend(v7, "localizedFrameworkStringForKey:value:table:allowSiri:", v8, v8, 0, 1);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    -[ICAuthenticationPrompt setReason:](self, "setReason:", v17);
LABEL_16:

    return;
  }
  if (-[ICAuthenticationPrompt allowsDevicePasswordAuthentication](self, "allowsDevicePasswordAuthentication"))
  {
    v7 = (void *)MEMORY[0x1E0D64218];
    v8 = CFSTR("Use your fingerprint or enter the device passcode to remove the lock from this note.");
    goto LABEL_15;
  }
}

- (void)updateStringsForDeleteNotes
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;

  -[ICAuthenticationPrompt unauthenticatedNotes](self, "unauthenticatedNotes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    -[ICAuthenticationPrompt notes](self, "notes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");
    -[ICAuthenticationPrompt unauthenticatedNotes](self, "unauthenticatedNotes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v5 > v7)
    {
      -[ICAuthenticationPrompt updateStringsForDeleteMixedNotes](self, "updateStringsForDeleteMixedNotes");
      return;
    }
  }
  else
  {

  }
  -[ICAuthenticationPrompt unauthenticatedNotes](self, "unauthenticatedNotes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9 == 1)
    -[ICAuthenticationPrompt updateStringsForDeleteSingleNote](self, "updateStringsForDeleteSingleNote");
  else
    -[ICAuthenticationPrompt updateStringsForDeleteMultipleNotes](self, "updateStringsForDeleteMultipleNotes");
}

- (void)updateStringsForDeleteMixedNotes
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  id v13;

  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Delete Notes"), CFSTR("Delete Notes"), 0, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationPrompt setTitle:](self, "setTitle:", v3);

  if (-[ICAuthenticationPrompt authenticationMechanism](self, "authenticationMechanism") == 2)
  {
    if (-[ICAuthenticationPrompt allowsCustomPasswordAuthentication](self, "allowsCustomPasswordAuthentication"))
    {
      -[ICAuthenticationPrompt customAccountName](self, "customAccountName");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
      {
        v5 = (void *)MEMORY[0x1E0D64218];
        v6 = CFSTR("One or more notes are locked. Use your fingerprint or enter the password you created for notes in your “%@” account to delete these locked notes.");
LABEL_8:
        objc_msgSend(v5, "localizedFrameworkStringForKey:value:table:allowSiri:", v6, v6, 0, 1);
        v13 = (id)objc_claimAutoreleasedReturnValue();
        v8 = (void *)MEMORY[0x1E0CB3940];
        -[ICAuthenticationPrompt customAccountName](self, "customAccountName");
        v9 = objc_claimAutoreleasedReturnValue();
LABEL_9:
        v10 = (void *)v9;
        objc_msgSend(v8, "localizedStringWithFormat:", v13, v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICAuthenticationPrompt setReason:](self, "setReason:", v11);

LABEL_21:
        return;
      }
    }
    if (-[ICAuthenticationPrompt allowsCustomPasswordAuthentication](self, "allowsCustomPasswordAuthentication"))
    {
      v5 = (void *)MEMORY[0x1E0D64218];
      v12 = CFSTR("One or more notes are locked. Use your fingerprint or enter your password to delete these locked notes.");
      goto LABEL_20;
    }
    if (-[ICAuthenticationPrompt allowsDevicePasswordAuthentication](self, "allowsDevicePasswordAuthentication"))
    {
      v5 = (void *)MEMORY[0x1E0D64218];
      v12 = CFSTR("One or more notes are locked. Use your fingerprint or enter the device passcode to delete these locked notes.");
      goto LABEL_20;
    }
  }
  else
  {
    if (-[ICAuthenticationPrompt authenticationMechanism](self, "authenticationMechanism") == 4)
    {
      -[ICAuthenticationPrompt customAccountName](self, "customAccountName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = (void *)MEMORY[0x1E0D64218];
      if (v7)
      {
        v6 = CFSTR("One or more notes are locked. Enter the password you created for notes in your “%@” account.");
        goto LABEL_8;
      }
      v12 = CFSTR("One or more notes are locked. Enter your locked notes password.");
LABEL_20:
      objc_msgSend(v5, "localizedFrameworkStringForKey:value:table:allowSiri:", v12, v12, 0, 1);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      -[ICAuthenticationPrompt setReason:](self, "setReason:");
      goto LABEL_21;
    }
    if (-[ICAuthenticationPrompt authenticationMechanism](self, "authenticationMechanism") == 5)
    {
      v5 = (void *)MEMORY[0x1E0D64218];
      v12 = CFSTR("Delete these notes.");
      goto LABEL_20;
    }
    if (-[ICAuthenticationPrompt authenticationMechanism](self, "authenticationMechanism") == 6)
    {
      objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("One or more notes are locked. Enter the password for “%@” to delete these notes."), CFSTR("One or more notes are locked. Enter the password for “%@” to delete these notes."), 0, 1);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0CB3940];
      -[ICAuthenticationPrompt cloudAccountName](self, "cloudAccountName");
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
  }
}

- (void)updateStringsForDeleteSingleNote
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  id v13;

  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Delete Note"), CFSTR("Delete Note"), 0, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationPrompt setTitle:](self, "setTitle:", v3);

  if (-[ICAuthenticationPrompt authenticationMechanism](self, "authenticationMechanism") == 2)
  {
    if (-[ICAuthenticationPrompt allowsCustomPasswordAuthentication](self, "allowsCustomPasswordAuthentication"))
    {
      -[ICAuthenticationPrompt customAccountName](self, "customAccountName");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
      {
        v5 = (void *)MEMORY[0x1E0D64218];
        v6 = CFSTR("Use your fingerprint or enter the password you created for notes in your “%@” account to delete this locked note.");
LABEL_8:
        objc_msgSend(v5, "localizedFrameworkStringForKey:value:table:allowSiri:", v6, v6, 0, 1);
        v13 = (id)objc_claimAutoreleasedReturnValue();
        v8 = (void *)MEMORY[0x1E0CB3940];
        -[ICAuthenticationPrompt customAccountName](self, "customAccountName");
        v9 = objc_claimAutoreleasedReturnValue();
LABEL_9:
        v10 = (void *)v9;
        objc_msgSend(v8, "localizedStringWithFormat:", v13, v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICAuthenticationPrompt setReason:](self, "setReason:", v11);

LABEL_21:
        return;
      }
    }
    if (-[ICAuthenticationPrompt allowsCustomPasswordAuthentication](self, "allowsCustomPasswordAuthentication"))
    {
      v5 = (void *)MEMORY[0x1E0D64218];
      v12 = CFSTR("Use your fingerprint or enter your password to delete this locked note.");
      goto LABEL_20;
    }
    if (-[ICAuthenticationPrompt allowsDevicePasswordAuthentication](self, "allowsDevicePasswordAuthentication"))
    {
      v5 = (void *)MEMORY[0x1E0D64218];
      v12 = CFSTR("Use your fingerprint or enter the device passcode to delete this locked note.");
      goto LABEL_20;
    }
  }
  else
  {
    if (-[ICAuthenticationPrompt authenticationMechanism](self, "authenticationMechanism") == 4)
    {
      -[ICAuthenticationPrompt customAccountName](self, "customAccountName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = (void *)MEMORY[0x1E0D64218];
      if (v7)
      {
        v6 = CFSTR("Enter the password you created for notes in your “%@” account.");
        goto LABEL_8;
      }
      v12 = CFSTR("Enter your locked notes password.");
LABEL_20:
      objc_msgSend(v5, "localizedFrameworkStringForKey:value:table:allowSiri:", v12, v12, 0, 1);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      -[ICAuthenticationPrompt setReason:](self, "setReason:");
      goto LABEL_21;
    }
    if (-[ICAuthenticationPrompt authenticationMechanism](self, "authenticationMechanism") == 5)
    {
      v5 = (void *)MEMORY[0x1E0D64218];
      v12 = CFSTR("Delete this note.");
      goto LABEL_20;
    }
    if (-[ICAuthenticationPrompt authenticationMechanism](self, "authenticationMechanism") == 6)
    {
      objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Enter the password for “%@” to delete this note."), CFSTR("Enter the password for “%@” to delete this note."), 0, 1);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0CB3940];
      -[ICAuthenticationPrompt cloudAccountName](self, "cloudAccountName");
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
  }
}

- (void)updateStringsForDeleteMultipleNotes
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  id v13;

  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Delete Notes"), CFSTR("Delete Notes"), 0, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationPrompt setTitle:](self, "setTitle:", v3);

  if (-[ICAuthenticationPrompt authenticationMechanism](self, "authenticationMechanism") == 2)
  {
    if (-[ICAuthenticationPrompt allowsCustomPasswordAuthentication](self, "allowsCustomPasswordAuthentication"))
    {
      -[ICAuthenticationPrompt customAccountName](self, "customAccountName");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
      {
        v5 = (void *)MEMORY[0x1E0D64218];
        v6 = CFSTR("Use your fingerprint or enter the password you created for notes in your “%@” account to delete these locked notes.");
LABEL_8:
        objc_msgSend(v5, "localizedFrameworkStringForKey:value:table:allowSiri:", v6, v6, 0, 1);
        v13 = (id)objc_claimAutoreleasedReturnValue();
        v8 = (void *)MEMORY[0x1E0CB3940];
        -[ICAuthenticationPrompt customAccountName](self, "customAccountName");
        v9 = objc_claimAutoreleasedReturnValue();
LABEL_9:
        v10 = (void *)v9;
        objc_msgSend(v8, "localizedStringWithFormat:", v13, v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICAuthenticationPrompt setReason:](self, "setReason:", v11);

LABEL_21:
        return;
      }
    }
    if (-[ICAuthenticationPrompt allowsCustomPasswordAuthentication](self, "allowsCustomPasswordAuthentication"))
    {
      v5 = (void *)MEMORY[0x1E0D64218];
      v12 = CFSTR("Use your fingerprint or enter your password to delete these locked notes.");
      goto LABEL_20;
    }
    if (-[ICAuthenticationPrompt allowsDevicePasswordAuthentication](self, "allowsDevicePasswordAuthentication"))
    {
      v5 = (void *)MEMORY[0x1E0D64218];
      v12 = CFSTR("Use your fingerprint or enter the device passcode to delete these locked notes.");
      goto LABEL_20;
    }
  }
  else
  {
    if (-[ICAuthenticationPrompt authenticationMechanism](self, "authenticationMechanism") == 4)
    {
      -[ICAuthenticationPrompt customAccountName](self, "customAccountName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = (void *)MEMORY[0x1E0D64218];
      if (v7)
      {
        v6 = CFSTR("Enter the password you created for notes in your “%@” account.");
        goto LABEL_8;
      }
      v12 = CFSTR("Enter your locked notes password.");
LABEL_20:
      objc_msgSend(v5, "localizedFrameworkStringForKey:value:table:allowSiri:", v12, v12, 0, 1);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      -[ICAuthenticationPrompt setReason:](self, "setReason:");
      goto LABEL_21;
    }
    if (-[ICAuthenticationPrompt authenticationMechanism](self, "authenticationMechanism") == 5)
    {
      v5 = (void *)MEMORY[0x1E0D64218];
      v12 = CFSTR("Delete these notes.");
      goto LABEL_20;
    }
    if (-[ICAuthenticationPrompt authenticationMechanism](self, "authenticationMechanism") == 6)
    {
      objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Enter the password for “%@” to delete these notes."), CFSTR("Enter the password for “%@” to delete these notes."), 0, 1);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0CB3940];
      -[ICAuthenticationPrompt cloudAccountName](self, "cloudAccountName");
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
  }
}

- (void)updateStringsForChangePassword
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  id v12;

  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Change Notes Password"), CFSTR("Change Notes Password"), 0, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationPrompt setTitle:](self, "setTitle:", v3);

  if (-[ICAuthenticationPrompt authenticationMechanism](self, "authenticationMechanism") == 2)
  {
    if (-[ICAuthenticationPrompt allowsCustomPasswordAuthentication](self, "allowsCustomPasswordAuthentication"))
    {
      -[ICAuthenticationPrompt customAccountName](self, "customAccountName");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
      {
        v5 = (void *)MEMORY[0x1E0D64218];
        v6 = CFSTR("Use your fingerprint or enter the password you created for notes in your “%@” account to change the password.");
LABEL_8:
        objc_msgSend(v5, "localizedFrameworkStringForKey:value:table:allowSiri:", v6, v6, 0, 1);
        v12 = (id)objc_claimAutoreleasedReturnValue();
        v8 = (void *)MEMORY[0x1E0CB3940];
        -[ICAuthenticationPrompt customAccountName](self, "customAccountName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "localizedStringWithFormat:", v12, v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICAuthenticationPrompt setReason:](self, "setReason:", v10);

LABEL_16:
        return;
      }
    }
    if (-[ICAuthenticationPrompt allowsCustomPasswordAuthentication](self, "allowsCustomPasswordAuthentication"))
    {
      v5 = (void *)MEMORY[0x1E0D64218];
      v11 = CFSTR("Use your fingerprint or enter your notes password to change the password.");
      goto LABEL_15;
    }
    if (-[ICAuthenticationPrompt allowsDevicePasswordAuthentication](self, "allowsDevicePasswordAuthentication"))
    {
      v5 = (void *)MEMORY[0x1E0D64218];
      v11 = CFSTR("Use your fingerprint or enter the device passcode to change the password.");
      goto LABEL_15;
    }
  }
  else if (-[ICAuthenticationPrompt authenticationMechanism](self, "authenticationMechanism") == 4)
  {
    -[ICAuthenticationPrompt customAccountName](self, "customAccountName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = (void *)MEMORY[0x1E0D64218];
    if (v7)
    {
      v6 = CFSTR("Enter the password you created for notes in your “%@” account.");
      goto LABEL_8;
    }
    v11 = CFSTR("Enter your locked notes password.");
LABEL_15:
    objc_msgSend(v5, "localizedFrameworkStringForKey:value:table:allowSiri:", v11, v11, 0, 1);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    -[ICAuthenticationPrompt setReason:](self, "setReason:", v12);
    goto LABEL_16;
  }
}

- (void)updateStringsForResetPassword
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Reset Notes Password"), CFSTR("Reset Notes Password"), 0, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationPrompt setTitle:](self, "setTitle:", v3);

  if (-[ICAuthenticationPrompt authenticationMechanism](self, "authenticationMechanism") == 5)
  {
    -[ICAuthenticationPrompt customAccountName](self, "customAccountName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Reset your notes password."), CFSTR("Reset your notes password."), 0, 1);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      -[ICAuthenticationPrompt setReason:](self, "setReason:", v13);
LABEL_12:

      return;
    }
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Reset the notes password for your “%@” account."), CFSTR("Reset the notes password for your “%@” account."), 0, 1);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1E0CB3940];
    -[ICAuthenticationPrompt customAccountName](self, "customAccountName");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if (-[ICAuthenticationPrompt authenticationMechanism](self, "authenticationMechanism") == 6)
  {
    -[ICAuthenticationPrompt customAccountName](self, "customAccountName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Enter the password for “%@” to reset the notes password for your “%@” account."), CFSTR("Enter the password for “%@” to reset the notes password for your “%@” account."), 0, 1);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0CB3940];
      -[ICAuthenticationPrompt cloudAccountName](self, "cloudAccountName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICAuthenticationPrompt customAccountName](self, "customAccountName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringWithFormat:", v13, v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICAuthenticationPrompt setReason:](self, "setReason:", v11);

LABEL_11:
      goto LABEL_12;
    }
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Enter the password for “%@” to reset your notes password."), CFSTR("Enter the password for “%@” to reset your notes password."), 0, 1);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1E0CB3940];
    -[ICAuthenticationPrompt cloudAccountName](self, "cloudAccountName");
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v9 = (void *)v6;
    objc_msgSend(v5, "localizedStringWithFormat:", v13, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAuthenticationPrompt setReason:](self, "setReason:", v12);

    goto LABEL_11;
  }
}

- (void)updateStringsForChangeMode
{
  if (-[ICAuthenticationPrompt usesSecondaryAuthenticationIfAvailable](self, "usesSecondaryAuthenticationIfAvailable")
    || -[ICAuthenticationPrompt forcesSecondaryAuthentication](self, "forcesSecondaryAuthentication"))
  {
    -[ICAuthenticationPrompt updateStringsForChangeModeTo](self, "updateStringsForChangeModeTo");
  }
  else
  {
    -[ICAuthenticationPrompt updateStringsForChangeModeFrom](self, "updateStringsForChangeModeFrom");
  }
}

- (void)updateStringsForChangeModeFrom
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  id v14;

  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Current Notes Password"), CFSTR("Current Notes Password"), 0, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationPrompt setTitle:](self, "setTitle:", v3);

  if (-[ICAuthenticationPrompt authenticationMechanism](self, "authenticationMechanism") == 2)
  {
    if (-[ICAuthenticationPrompt allowsCustomPasswordAuthentication](self, "allowsCustomPasswordAuthentication"))
    {
      -[ICAuthenticationPrompt customAccountName](self, "customAccountName");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
      {
        objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Current Notes Password"), CFSTR("Current Notes Password"), 0, 1);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICAuthenticationPrompt setTitle:](self, "setTitle:", v5);

        v6 = (void *)MEMORY[0x1E0D64218];
        v7 = CFSTR("Use your fingerprint or enter the password you created for notes in your “%@” account.");
LABEL_8:
        objc_msgSend(v6, "localizedFrameworkStringForKey:value:table:allowSiri:", v7, v7, 0, 1);
        v14 = (id)objc_claimAutoreleasedReturnValue();
        v9 = (void *)MEMORY[0x1E0CB3940];
        -[ICAuthenticationPrompt customAccountName](self, "customAccountName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "localizedStringWithFormat:", v14, v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICAuthenticationPrompt setReason:](self, "setReason:", v11);

LABEL_16:
        return;
      }
    }
    if (-[ICAuthenticationPrompt allowsCustomPasswordAuthentication](self, "allowsCustomPasswordAuthentication"))
    {
      objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Current Notes Password"), CFSTR("Current Notes Password"), 0, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICAuthenticationPrompt setTitle:](self, "setTitle:", v12);

      v6 = (void *)MEMORY[0x1E0D64218];
      v13 = CFSTR("Use your fingerprint or enter your notes password.");
      goto LABEL_15;
    }
    if (-[ICAuthenticationPrompt allowsDevicePasswordAuthentication](self, "allowsDevicePasswordAuthentication"))
    {
      v6 = (void *)MEMORY[0x1E0D64218];
      v13 = CFSTR("Use your fingerprint or enter the device passcode.");
      goto LABEL_15;
    }
  }
  else if (-[ICAuthenticationPrompt authenticationMechanism](self, "authenticationMechanism") == 4)
  {
    -[ICAuthenticationPrompt customAccountName](self, "customAccountName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (void *)MEMORY[0x1E0D64218];
    if (v8)
    {
      v7 = CFSTR("Enter the password you created for notes in your “%@” account.");
      goto LABEL_8;
    }
    v13 = CFSTR("Enter your locked notes password.");
LABEL_15:
    objc_msgSend(v6, "localizedFrameworkStringForKey:value:table:allowSiri:", v13, v13, 0, 1);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    -[ICAuthenticationPrompt setReason:](self, "setReason:", v14);
    goto LABEL_16;
  }
}

- (void)updateStringsForChangeModeTo
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  id v13;

  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Change Method"), CFSTR("Change Method"), 0, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationPrompt setTitle:](self, "setTitle:", v3);

  if (-[ICAuthenticationPrompt authenticationMechanism](self, "authenticationMechanism") != 2)
  {
    if (-[ICAuthenticationPrompt authenticationMechanism](self, "authenticationMechanism") == 4)
    {
      -[ICAuthenticationPrompt customAccountName](self, "customAccountName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = (void *)MEMORY[0x1E0D64218];
      if (v7)
      {
        v6 = CFSTR("Enter the password you created for notes in your “%@” account.");
        goto LABEL_10;
      }
      v12 = CFSTR("Enter your locked notes password.");
    }
    else
    {
      if (-[ICAuthenticationPrompt authenticationMechanism](self, "authenticationMechanism") != 5)
        return;
      -[ICAuthenticationPrompt customAccountName](self, "customAccountName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = (void *)MEMORY[0x1E0D64218];
      if (v8)
      {
        v6 = CFSTR("Lock “%@” notes with passcode.");
        goto LABEL_10;
      }
      v12 = CFSTR("Lock notes with passcode.");
    }
LABEL_18:
    objc_msgSend(v5, "localizedFrameworkStringForKey:value:table:allowSiri:", v12, v12, 0, 1);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    -[ICAuthenticationPrompt setReason:](self, "setReason:", v13);
    goto LABEL_19;
  }
  -[ICAuthenticationPrompt customAccountName](self, "customAccountName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0D64218];
    v6 = CFSTR("Use your fingerprint or enter the password you created for notes in your “%@” account.");
LABEL_10:
    objc_msgSend(v5, "localizedFrameworkStringForKey:value:table:allowSiri:", v6, v6, 0, 1);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0CB3940];
    -[ICAuthenticationPrompt customAccountName](self, "customAccountName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringWithFormat:", v13, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAuthenticationPrompt setReason:](self, "setReason:", v11);

LABEL_19:
    return;
  }
  if (-[ICAuthenticationPrompt allowsCustomPasswordAuthentication](self, "allowsCustomPasswordAuthentication"))
  {
    v5 = (void *)MEMORY[0x1E0D64218];
    v12 = CFSTR("Use your fingerprint or enter your notes password.");
    goto LABEL_18;
  }
  if (-[ICAuthenticationPrompt allowsDevicePasswordAuthentication](self, "allowsDevicePasswordAuthentication"))
  {
    v5 = (void *)MEMORY[0x1E0D64218];
    v12 = CFSTR("Use your fingerprint or enter the device passcode.");
    goto LABEL_18;
  }
}

- (void)updateStringsForToggleBiometrics
{
  void *v3;
  BOOL v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  BOOL v8;
  ICAuthenticationPrompt *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  BOOL v17;
  id v18;

  if (objc_msgSend(MEMORY[0x1E0D63B90], "biometricsType") == 4)
  {
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Optic ID for “Notes”"), CFSTR("Optic ID for “Notes”"), 0, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAuthenticationPrompt setTitle:](self, "setTitle:", v3);

    if (-[ICAuthenticationPrompt authenticationMechanism](self, "authenticationMechanism") != 4)
    {
      if (-[ICAuthenticationPrompt authenticationMechanism](self, "authenticationMechanism") == 5)
      {
        v4 = -[ICAuthenticationPrompt isBiometricAuthenticationEnabled](self, "isBiometricAuthenticationEnabled");
        v5 = (void *)MEMORY[0x1E0D64218];
        if (v4)
        {
          v6 = CFSTR("Turn off Optic ID for locked notes.");
LABEL_11:
          objc_msgSend(v5, "localizedFrameworkStringForKey:value:table:allowSiri:", v6, v6, 0, 1);
          v18 = (id)objc_claimAutoreleasedReturnValue();
          -[ICAuthenticationPrompt setReason:](self, "setReason:", v18);
          v9 = self;
          v10 = (uint64_t)v18;
LABEL_26:
          -[ICAuthenticationPrompt setReason:](v9, "setReason:", v10);
          goto LABEL_27;
        }
        v16 = CFSTR("Turn on Optic ID for locked notes.");
        goto LABEL_25;
      }
      return;
    }
    goto LABEL_14;
  }
  if (objc_msgSend(MEMORY[0x1E0D63B90], "biometricsType") != 2)
  {
    if (objc_msgSend(MEMORY[0x1E0D63B90], "biometricsType") != 1)
    {
      objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Change Biometrics Status"), CFSTR("Change Biometrics Status"), 0, 1);
      v18 = (id)objc_claimAutoreleasedReturnValue();
      -[ICAuthenticationPrompt setTitle:](self, "setTitle:", v18);
      goto LABEL_27;
    }
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Touch ID for “Notes”"), CFSTR("Touch ID for “Notes”"), 0, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAuthenticationPrompt setTitle:](self, "setTitle:", v11);

    if (-[ICAuthenticationPrompt authenticationMechanism](self, "authenticationMechanism") != 4)
    {
      if (-[ICAuthenticationPrompt authenticationMechanism](self, "authenticationMechanism") == 5)
      {
        v17 = -[ICAuthenticationPrompt isBiometricAuthenticationEnabled](self, "isBiometricAuthenticationEnabled");
        v5 = (void *)MEMORY[0x1E0D64218];
        if (v17)
          v16 = CFSTR("Turn off Touch ID for locked notes.");
        else
          v16 = CFSTR("Turn on Touch ID for locked notes.");
        goto LABEL_25;
      }
      return;
    }
LABEL_14:
    -[ICAuthenticationPrompt customAccountName](self, "customAccountName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = (void *)MEMORY[0x1E0D64218];
    if (!v12)
    {
      v16 = CFSTR("Enter your locked notes password.");
      goto LABEL_25;
    }
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Enter the password you created for notes in your “%@” account."), CFSTR("Enter the password you created for notes in your “%@” account."), 0, 1);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0CB3940];
    -[ICAuthenticationPrompt customAccountName](self, "customAccountName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringWithFormat:", v18, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAuthenticationPrompt setReason:](self, "setReason:", v15);

LABEL_27:
    return;
  }
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Face ID for “Notes”"), CFSTR("Face ID for “Notes”"), 0, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationPrompt setTitle:](self, "setTitle:", v7);

  if (-[ICAuthenticationPrompt authenticationMechanism](self, "authenticationMechanism") == 4)
    goto LABEL_14;
  if (-[ICAuthenticationPrompt authenticationMechanism](self, "authenticationMechanism") == 5)
  {
    v8 = -[ICAuthenticationPrompt isBiometricAuthenticationEnabled](self, "isBiometricAuthenticationEnabled");
    v5 = (void *)MEMORY[0x1E0D64218];
    if (v8)
    {
      v6 = CFSTR("Turn off Face ID for locked notes.");
      goto LABEL_11;
    }
    v16 = CFSTR("Turn on Face ID for locked notes.");
LABEL_25:
    objc_msgSend(v5, "localizedFrameworkStringForKey:value:table:allowSiri:", v16, v16, 0, 1);
    v10 = objc_claimAutoreleasedReturnValue();
    v18 = (id)v10;
    v9 = self;
    goto LABEL_26;
  }
}

- (ICAuthenticationPrompt)initWithIntent:(unint64_t)a3 object:(id)a4
{
  id v7;
  ICAuthenticationPrompt *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  NSArray *notes;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v29.receiver = self;
  v29.super_class = (Class)ICAuthenticationPrompt;
  v8 = -[ICAuthenticationPrompt init](&v29, sel_init);
  if (v8)
  {
    objc_opt_class();
    ICDynamicCast();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      objc_msgSend(v7, "cloudAccount");
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = v11;

    objc_opt_class();
    ICDynamicCast();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v15 = v13;
    }
    else
    {
      objc_opt_class();
      ICDynamicCast();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "note");
      v15 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x1E0D63B90], "refreshBiometricsContext");
    objc_msgSend(MEMORY[0x1E0D63B90], "refreshHasPasscode");
    v8->_intent = a3;
    objc_storeStrong((id *)&v8->_object, a4);
    objc_storeStrong((id *)&v8->_account, v12);
    objc_storeStrong((id *)&v8->_note, v15);
    if (v15)
    {
      v30[0] = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
      v17 = objc_claimAutoreleasedReturnValue();
      notes = v8->_notes;
      v8->_notes = (NSArray *)v17;
    }
    else
    {
      notes = v8->_notes;
      v8->_notes = (NSArray *)MEMORY[0x1E0C9AA60];
    }

    *(_WORD *)&v8->_usesBiometricAuthenticationIfAvailable = 257;
    v8->_internetReachable = objc_msgSend(MEMORY[0x1E0D64290], "isInternetReachable");
    objc_msgSend(MEMORY[0x1E0D63A58], "sharedState");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "biometricsEnabledForAccount:", v12))
    {
      objc_msgSend(MEMORY[0x1E0D63A58], "sharedState");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v20, "checkSupportsBiometrics"))
        v21 = objc_msgSend(MEMORY[0x1E0D63B90], "biometricsLockedOut") ^ 1;
      else
        v21 = 0;
      v8->_biometricAuthenticationEnabled = v21;

    }
    else
    {
      v8->_biometricAuthenticationEnabled = 0;
    }

    v8->_biometricAuthenticationType = objc_msgSend(MEMORY[0x1E0D63B90], "biometricsType");
    v8->_keychainAvailable = objc_msgSend(MEMORY[0x1E0D63B60], "isSyncAvailableForAccount:", v12);
    objc_msgSend(MEMORY[0x1E0D63A58], "sharedState");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAuthenticationPrompt authenticationObject](v8, "authenticationObject");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "mainKeyFromKeychainForObject:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_hasKeychainItem = v24 != 0;

    objc_msgSend(MEMORY[0x1E0D64180], "sharedInstance");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "accountStore");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "aa_primaryAppleAccount");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_hasCloudAccount = v27 != 0;

    v8->_hasDevicePassword = objc_msgSend(MEMORY[0x1E0D63B90], "hasPasscode");
    v8->_authenticationAction = 1;
    if (!v8->_account)
      objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "_account", "-[ICAuthenticationPrompt initWithIntent:object:]", 1, 0, CFSTR("Nil authentication prompt account"));

  }
  return v8;
}

- (id)description
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
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
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  v22 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromAuthenticationIntent(-[ICAuthenticationPrompt intent](self, "intent"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromAuthenticationAction(-[ICAuthenticationPrompt authenticationAction](self, "authenticationAction"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromAuthenticationMechanism(-[ICAuthenticationPrompt authenticationMechanism](self, "authenticationMechanism"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationPrompt account](self, "account");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "shortLoggingDescription");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationPrompt account](self, "account");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "accountData");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "lockedNotesMode");
  NSStringFromAccountDataLockedNotesMode();
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[ICAuthenticationPrompt account](self, "account");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "accountData");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithBool:", objc_msgSend(v19, "supportsV1Neo"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationPrompt object](self, "object");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "shortLoggingDescription");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0D63AB8];
  -[ICAuthenticationPrompt object](self, "object");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cipherVersionForObject:", v17);
  ICCipherNameForCipherVersion();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICAuthenticationPrompt isInternetReachable](self, "isInternetReachable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICAuthenticationPrompt isBiometricAuthenticationEnabled](self, "isBiometricAuthenticationEnabled"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICAuthenticationPrompt isKeychainAvailable](self, "isKeychainAvailable"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICAuthenticationPrompt hasKeychainItem](self, "hasKeychainItem"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICAuthenticationPrompt hasCloudAccount](self, "hasCloudAccount"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICAuthenticationPrompt hasDevicePassword](self, "hasDevicePassword"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICAuthenticationPrompt hasDivergedKey](self, "hasDivergedKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICAuthenticationPrompt needsUserRecordUpdate](self, "needsUserRecordUpdate"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stringWithFormat:", CFSTR("<%@: %p, intent: %@, action: %@, mechanism: %@, account: %@, account.lockedNotesMode: %@, account.supportsV1Neo: %@, object: %@, object.cipherVersion: %@, isInternetReachable: %@, isBiometricAuthenticationEnabled: %@, isKeychainAvailable: %@, hasKeychainItem: %@, hasCloudAccount: %@, hasDevicePassword: %@, hasDivergedKey: %@, needsUserRecordUpdate: %@>"), v21, self, v32, v30, v31, v28, v29, v27, v16, v15, v6, v7, v14, v8, v9, v10,
    v11,
    v12);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;

  if (a3 == self)
    return 1;
  v4 = a3;
  objc_opt_class();
  ICDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "intent");
  if (v6 == -[ICAuthenticationPrompt intent](self, "intent"))
  {
    objc_msgSend(v5, "object");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAuthenticationPrompt object](self, "object");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 == v8)
    {
      objc_msgSend(v5, "notes");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICAuthenticationPrompt notes](self, "notes");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "isEqualToArray:", v11))
      {
        objc_msgSend(v5, "unauthenticatedNotes");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICAuthenticationPrompt unauthenticatedNotes](self, "unauthenticatedNotes");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "isEqualToArray:", v13))
        {
          v14 = objc_msgSend(v5, "secondaryAuthenticationMode");
          v9 = v14 == -[ICAuthenticationPrompt secondaryAuthenticationMode](self, "secondaryAuthenticationMode");
        }
        else
        {
          v9 = 0;
        }

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  char v4;
  id v5;
  objc_class *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  id v14;
  objc_class *v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v32 = -[ICAuthenticationPrompt intent](self, "intent");
  -[ICAuthenticationPrompt object](self, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[ICAuthenticationPrompt notes](self, "notes");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v34 != v12)
          objc_enumerationMutation(v9);
        v8 = ICHashWithObject(*(void **)(*((_QWORD *)&v33 + 1) + 8 * i)) - v8 + 32 * v8;
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v11);
  }

  -[ICAuthenticationPrompt unauthenticatedNotes](self, "unauthenticatedNotes");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v15 = (objc_class *)objc_opt_class();
  NSStringFromClass(v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "hash");

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v18 = v14;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v34;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v34 != v21)
          objc_enumerationMutation(v18);
        v17 = ICHashWithObject(*(void **)(*((_QWORD *)&v33 + 1) + 8 * j)) - v17 + 32 * v17;
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v20);
  }

  -[ICAuthenticationPrompt secondaryAuthenticationMode](self, "secondaryAuthenticationMode");
  v30 = ICHashWithHashKeys(v32, v23, v24, v25, v26, v27, v28, v29, v4);

  return v30;
}

+ (id)promptForIntent:(unint64_t)a3 object:(id)a4
{
  id v5;
  ICAuthenticationPrompt *v6;

  v5 = a4;
  v6 = -[ICAuthenticationPrompt initWithIntent:object:]([ICAuthenticationPrompt alloc], "initWithIntent:object:", a3, v5);

  -[ICAuthenticationPrompt update](v6, "update");
  return v6;
}

+ (id)promptForDeletingNotes:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  ICAuthenticationPrompt *v11;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v3, "ic_compactMap:", &__block_literal_global_94);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count") != 1)
  {
    v9 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[ICAuthenticationPrompt promptForDeletingNotes:].cold.1(v9);

  }
  objc_msgSend(v3, "ic_objectsPassingTest:", &__block_literal_global_29_1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[ICAuthenticationPrompt initWithIntent:object:]([ICAuthenticationPrompt alloc], "initWithIntent:object:", 4, v8);
  -[ICAuthenticationPrompt setNotes:](v11, "setNotes:", v10);
  -[ICAuthenticationPrompt update](v11, "update");

  return v11;
}

uint64_t __49__ICAuthenticationPrompt_promptForDeletingNotes___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "account");
}

uint64_t __49__ICAuthenticationPrompt_promptForDeletingNotes___block_invoke_27(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isDeletedOrInTrash") ^ 1;
}

+ (id)promptForChangingMode:(signed __int16)a3 account:(id)a4
{
  uint64_t v4;
  id v5;
  ICAuthenticationPrompt *v6;

  v4 = a3;
  v5 = a4;
  v6 = -[ICAuthenticationPrompt initWithIntent:object:]([ICAuthenticationPrompt alloc], "initWithIntent:object:", 7, v5);

  -[ICAuthenticationPrompt setSecondaryAuthenticationMode:](v6, "setSecondaryAuthenticationMode:", v4);
  -[ICAuthenticationPrompt update](v6, "update");
  return v6;
}

- (void)setUsesSecondaryAuthenticationIfAvailable:(BOOL)a3
{
  self->_usesSecondaryAuthenticationIfAvailable = a3;
  -[ICAuthenticationPrompt update](self, "update");
}

- (void)setUsesBiometricAuthenticationIfAvailable:(BOOL)a3
{
  self->_usesBiometricAuthenticationIfAvailable = a3;
  -[ICAuthenticationPrompt update](self, "update");
}

- (void)setUsesAlternativeAuthenticationIfAvailable:(BOOL)a3
{
  self->_usesAlternativeAuthenticationIfAvailable = a3;
  -[ICAuthenticationPrompt update](self, "update");
}

- (void)setUpdatesUserRecordIfNeeded:(BOOL)a3
{
  self->_updatesUserRecordIfNeeded = a3;
  -[ICAuthenticationPrompt update](self, "update");
}

- (NSArray)unauthenticatedNotes
{
  void *v2;
  void *v3;

  -[ICAuthenticationPrompt notes](self, "notes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ic_objectsPassingTest:", &__block_literal_global_30_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

uint64_t __46__ICAuthenticationPrompt_unauthenticatedNotes__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isPasswordProtectedAndLocked");
}

- (ICCloudSyncingObject)authenticationObject
{
  unint64_t v3;

  v3 = -[ICAuthenticationPrompt intent](self, "intent");
  if (v3 <= 8)
  {
    if (((1 << v3) & 0x1F4) != 0)
      -[ICAuthenticationPrompt account](self, "account");
    else
      -[ICAuthenticationPrompt object](self, "object");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  return (ICCloudSyncingObject *)(id)v3;
}

- (BOOL)allowsAuthentication
{
  unint64_t v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = -[ICAuthenticationPrompt intent](self, "intent");
  LOBYTE(v4) = 1;
  if (v3 <= 6)
  {
    if (((1 << v3) & 0xB) != 0)
    {
      -[ICAuthenticationPrompt object](self, "object");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isPasswordProtected"))
      {
        -[ICAuthenticationPrompt object](self, "object");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "primaryEncryptedData");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v9)
        {
          -[ICAuthenticationPrompt object](self, "object");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "cryptoWrappedKey");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v4) = v11 != 0;

        }
        goto LABEL_13;
      }
      goto LABEL_10;
    }
    if (((1 << v3) & 0x60) != 0)
    {
      v5 = (void *)MEMORY[0x1E0D63AB8];
      -[ICAuthenticationPrompt authenticationObject](self, "authenticationObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "shouldAuthenticateWithCustomPasswordForObject:", v6))
      {
        -[ICAuthenticationPrompt account](self, "account");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v4) = objc_msgSend(v7, "hasPassphraseSet");

LABEL_13:
        return v4;
      }
LABEL_10:
      LOBYTE(v4) = 0;
      goto LABEL_13;
    }
    if (v3 == 2)
    {
      -[ICAuthenticationPrompt object](self, "object");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v6, "isPasswordProtected") ^ 1;
      goto LABEL_13;
    }
  }
  return v4;
}

- (BOOL)needsAuthentication
{
  ICAuthenticationPrompt *v2;
  void *v3;
  void *v4;

  v2 = self;
  switch(-[ICAuthenticationPrompt intent](self, "intent"))
  {
    case 0uLL:
    case 1uLL:
    case 3uLL:
      -[ICAuthenticationPrompt authenticationObject](v2, "authenticationObject");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v3, "isPasswordProtected"))
        goto LABEL_6;
      -[ICAuthenticationPrompt authenticationObject](v2, "authenticationObject");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v2) = objc_msgSend(v4, "isAuthenticated") ^ 1;

      goto LABEL_10;
    case 2uLL:
      -[ICAuthenticationPrompt authenticationObject](v2, "authenticationObject");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v2) = objc_msgSend(v3, "isAuthenticated") ^ 1;
      goto LABEL_10;
    case 4uLL:
      -[ICAuthenticationPrompt unauthenticatedNotes](v2, "unauthenticatedNotes");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v2) = objc_msgSend(v3, "count") != 0;
      goto LABEL_10;
    case 5uLL:
    case 6uLL:
      -[ICAuthenticationPrompt authenticationObject](v2, "authenticationObject");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v3, "hasPassphraseSet"))
        LOBYTE(v2) = -[ICAuthenticationPrompt allowsCustomPasswordAuthentication](v2, "allowsCustomPasswordAuthentication");
      else
LABEL_6:
        LOBYTE(v2) = 0;
LABEL_10:

      break;
    default:
      LOBYTE(v2) = 1;
      break;
  }
  return (char)v2;
}

- (BOOL)needsSecondaryAuthentication
{
  void *v3;
  int v4;
  char v5;
  void *v6;

  if (-[ICAuthenticationPrompt intent](self, "intent") != 7)
    return 0;
  -[ICAuthenticationPrompt account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "resolvedLockedNotesMode");
  if (v4 == -[ICAuthenticationPrompt secondaryAuthenticationMode](self, "secondaryAuthenticationMode"))
  {
    v5 = 0;
  }
  else if (-[ICAuthenticationPrompt allowsCustomPasswordAuthentication](self, "allowsCustomPasswordAuthentication"))
  {
    -[ICAuthenticationPrompt authenticationObject](self, "authenticationObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "hasPassphraseSet");

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (BOOL)forcesSecondaryAuthentication
{
  void *v3;
  int v4;
  void *v5;
  int v6;

  if (-[ICAuthenticationPrompt intent](self, "intent") == 7)
  {
    -[ICAuthenticationPrompt account](self, "account");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "resolvedLockedNotesMode");
    if (v4 == -[ICAuthenticationPrompt secondaryAuthenticationMode](self, "secondaryAuthenticationMode")
      || !-[ICAuthenticationPrompt allowsCustomPasswordAuthentication](self, "allowsCustomPasswordAuthentication"))
    {
      LOBYTE(v6) = 0;
    }
    else
    {
      -[ICAuthenticationPrompt authenticationObject](self, "authenticationObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "hasPassphraseSet") ^ 1;

    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (BOOL)needsKeychain
{
  unint64_t v3;

  v3 = -[ICAuthenticationPrompt intent](self, "intent");
  if (v3 == 7)
  {
    if (-[ICAuthenticationPrompt secondaryAuthenticationMode](self, "secondaryAuthenticationMode") == 2)
      return -[ICAuthenticationPrompt hasCloudAccount](self, "hasCloudAccount");
  }
  else if (v3 == 2
         && -[ICAuthenticationPrompt allowsDevicePasswordAuthentication](self, "allowsDevicePasswordAuthentication"))
  {
    return -[ICAuthenticationPrompt hasCloudAccount](self, "hasCloudAccount");
  }
  return 0;
}

- (BOOL)needsCloudAccount
{
  unint64_t v3;

  v3 = -[ICAuthenticationPrompt intent](self, "intent");
  if (v3 == 7)
    return -[ICAuthenticationPrompt secondaryAuthenticationMode](self, "secondaryAuthenticationMode") == 2;
  if (v3 == 2)
    return -[ICAuthenticationPrompt allowsDevicePasswordAuthentication](self, "allowsDevicePasswordAuthentication");
  return 0;
}

- (BOOL)needsDevicePassword
{
  unint64_t v3;

  v3 = -[ICAuthenticationPrompt intent](self, "intent");
  if (v3 == 7)
    return -[ICAuthenticationPrompt secondaryAuthenticationMode](self, "secondaryAuthenticationMode") == 2;
  if (v3 == 2)
    return -[ICAuthenticationPrompt allowsDevicePasswordAuthentication](self, "allowsDevicePasswordAuthentication");
  return 0;
}

- (BOOL)allowsAlternativeAuthentication
{
  unint64_t v3;
  BOOL v4;
  void *v5;

  v3 = -[ICAuthenticationPrompt intent](self, "intent");
  if (v3 - 5 < 2)
    return 1;
  if (v3 != 4)
    return 0;
  -[ICAuthenticationPrompt account](self, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v5, "accountType") != 3
    || -[ICAuthenticationPrompt hasDevicePassword](self, "hasDevicePassword");

  return v4;
}

- (BOOL)forcesAlternativeAuthentication
{
  unint64_t v3;
  void *v4;
  int v5;

  v3 = -[ICAuthenticationPrompt intent](self, "intent");
  if (v3 == 6)
  {
    LOBYTE(v5) = 1;
  }
  else if (v3 == 4
         && -[ICAuthenticationPrompt allowsCustomPasswordAuthentication](self, "allowsCustomPasswordAuthentication"))
  {
    -[ICAuthenticationPrompt authenticationObject](self, "authenticationObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "hasPassphraseSet") ^ 1;

  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (BOOL)allowsCustomPasswordAuthentication
{
  _BOOL4 v3;
  void *v4;
  void *v5;

  v3 = -[ICAuthenticationPrompt allowsAuthentication](self, "allowsAuthentication");
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0D63AB8];
    -[ICAuthenticationPrompt authenticationObject](self, "authenticationObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v4) = objc_msgSend(v4, "shouldAuthenticateWithCustomPasswordForObject:", v5);

    LOBYTE(v3) = (_BYTE)v4;
  }
  return v3;
}

- (BOOL)allowsDevicePasswordAuthentication
{
  _BOOL4 v3;
  void *v4;
  void *v5;

  v3 = -[ICAuthenticationPrompt allowsAuthentication](self, "allowsAuthentication");
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0D63AB8];
    -[ICAuthenticationPrompt authenticationObject](self, "authenticationObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v4) = objc_msgSend(v4, "shouldAuthenticateWithDevicePasswordForObject:", v5);

    LOBYTE(v3) = (_BYTE)v4;
  }
  return v3;
}

- (BOOL)allowsBiometricAuthentication
{
  unint64_t v3;

  v3 = -[ICAuthenticationPrompt intent](self, "intent");
  if (v3 <= 7 && ((1 << v3) & 0xBD) != 0)
  {
    if (-[ICAuthenticationPrompt allowsCustomPasswordAuthentication](self, "allowsCustomPasswordAuthentication"))
    {
      if (-[ICAuthenticationPrompt isBiometricAuthenticationEnabled](self, "isBiometricAuthenticationEnabled")
        && -[ICAuthenticationPrompt hasPassphrase](self, "hasPassphrase"))
      {
        return -[ICAuthenticationPrompt hasKeychainItem](self, "hasKeychainItem");
      }
    }
    else if (-[ICAuthenticationPrompt allowsDevicePasswordAuthentication](self, "allowsDevicePasswordAuthentication"))
    {
      return -[ICAuthenticationPrompt isBiometricAuthenticationEnabled](self, "isBiometricAuthenticationEnabled");
    }
  }
  return 0;
}

- (BOOL)forcesBiometricAuthentication
{
  return -[ICAuthenticationPrompt intent](self, "intent") == 5;
}

- (BOOL)hasPassphrase
{
  void *v3;
  char v4;
  void *v5;

  -[ICAuthenticationPrompt authenticationObject](self, "authenticationObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "hasPassphraseSet") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[ICAuthenticationPrompt account](self, "account");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "hasPassphraseSet");

  }
  return v4;
}

- (BOOL)hasDivergedKey
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[ICAuthenticationPrompt account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cryptoStrategy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationPrompt object](self, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "hasSameKeyAsObject:", v5) ^ 1;

  return v6;
}

- (BOOL)unlocksNotes
{
  return ((-[ICAuthenticationPrompt intent](self, "intent") - 6) & 0xFFFFFFFFFFFFFFFDLL) != 0;
}

- (BOOL)needsUserRecordUpdate
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;

  if (-[ICAuthenticationPrompt isInternetReachable](self, "isInternetReachable"))
  {
    v3 = (void *)MEMORY[0x1E0D63AB8];
    -[ICAuthenticationPrompt authenticationObject](self, "authenticationObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "cipherVersionForObject:", v4);

    -[ICAuthenticationPrompt account](self, "account");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v4) = objc_msgSend(v6, "accountType");

    LOBYTE(v6) = 0;
    if ((_DWORD)v4 == 1 && !v5)
    {
      v7 = -[ICAuthenticationPrompt intent](self, "intent");
      LOBYTE(v6) = 1;
      if (v7 <= 8 && ((1 << v7) & 0x11B) != 0)
      {
        -[ICAuthenticationPrompt account](self, "account");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v6) = objc_msgSend(v8, "hasPassphraseSet") ^ 1;

      }
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return (char)v6;
}

- (void)update
{
  uint64_t v3;
  ICAuthenticationPrompt *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
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
  int v22;
  ICAuthenticationPrompt *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  char v32;
  _BOOL4 v33;

  objc_msgSend(MEMORY[0x1E0D63B90], "refreshBiometricsContext");
  objc_msgSend(MEMORY[0x1E0D63B90], "refreshHasPasscode");
  objc_msgSend(MEMORY[0x1E0D63B90], "checkBiometricsPolicyState");
  -[ICAuthenticationPrompt setAuthenticationAction:](self, "setAuthenticationAction:", 1);
  -[ICAuthenticationPrompt setAuthenticationMechanism:](self, "setAuthenticationMechanism:", 0);
  v3 = MEMORY[0x1E0C9AA60];
  -[ICAuthenticationPrompt setSuccessAlerts:](self, "setSuccessAlerts:", MEMORY[0x1E0C9AA60]);
  -[ICAuthenticationPrompt setFailureAlerts:](self, "setFailureAlerts:", v3);
  if (-[ICAuthenticationPrompt needsAuthentication](self, "needsAuthentication")
    && -[ICAuthenticationPrompt allowsCustomPasswordAuthentication](self, "allowsCustomPasswordAuthentication")
    && !-[ICAuthenticationPrompt hasPassphrase](self, "hasPassphrase")
    && !-[ICAuthenticationPrompt allowsAlternativeAuthentication](self, "allowsAlternativeAuthentication")
    && !-[ICAuthenticationPrompt forcesSecondaryAuthentication](self, "forcesSecondaryAuthentication"))
  {
    goto LABEL_18;
  }
  if (-[ICAuthenticationPrompt allowsAuthentication](self, "allowsAuthentication"))
  {
    if (-[ICAuthenticationPrompt needsDevicePassword](self, "needsDevicePassword")
      && !-[ICAuthenticationPrompt hasDevicePassword](self, "hasDevicePassword"))
    {
      -[ICAuthenticationPrompt setAuthenticationAction:](self, "setAuthenticationAction:", 1);
      -[ICAuthenticationPrompt failureAlerts](self, "failureAlerts");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[ICAuthenticationAlert setDevicePasswordActionAlert](ICAuthenticationAlert, "setDevicePasswordActionAlert");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!-[ICAuthenticationPrompt needsAuthentication](self, "needsAuthentication"))
      {
        v4 = self;
        v5 = 0;
        goto LABEL_24;
      }
      if (-[ICAuthenticationPrompt needsCloudAccount](self, "needsCloudAccount")
        && !-[ICAuthenticationPrompt hasCloudAccount](self, "hasCloudAccount"))
      {
        -[ICAuthenticationPrompt setAuthenticationAction:](self, "setAuthenticationAction:", 1);
        -[ICAuthenticationPrompt failureAlerts](self, "failureAlerts");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICAuthenticationPrompt account](self, "account");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        +[ICAuthenticationAlert signIntoCloudAccountActionAlertWithAccount:](ICAuthenticationAlert, "signIntoCloudAccountActionAlertWithAccount:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "arrayByAddingObject:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICAuthenticationPrompt setFailureAlerts:](self, "setFailureAlerts:", v20);

        goto LABEL_22;
      }
      if (-[ICAuthenticationPrompt needsKeychain](self, "needsKeychain")
        && !-[ICAuthenticationPrompt isKeychainAvailable](self, "isKeychainAvailable"))
      {
        -[ICAuthenticationPrompt setAuthenticationAction:](self, "setAuthenticationAction:", 1);
        -[ICAuthenticationPrompt failureAlerts](self, "failureAlerts");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (-[ICAuthenticationPrompt usesSecondaryAuthenticationIfAvailable](self, "usesSecondaryAuthenticationIfAvailable")&& -[ICAuthenticationPrompt needsSecondaryAuthentication](self, "needsSecondaryAuthentication")|| -[ICAuthenticationPrompt forcesSecondaryAuthentication](self, "forcesSecondaryAuthentication"))
        {
          if (-[ICAuthenticationPrompt secondaryAuthenticationMode](self, "secondaryAuthenticationMode") == 1)
          {
LABEL_18:
            v4 = self;
            v5 = 3;
LABEL_24:
            -[ICAuthenticationPrompt setAuthenticationAction:](v4, "setAuthenticationAction:", v5);
            goto LABEL_25;
          }
          if (-[ICAuthenticationPrompt secondaryAuthenticationMode](self, "secondaryAuthenticationMode") == 2)
          {
            -[ICAuthenticationPrompt setAuthenticationAction:](self, "setAuthenticationAction:", 2);
            goto LABEL_53;
          }
          v29 = (void *)MEMORY[0x1E0D641A0];
          v30 = CFSTR("Invalid secondary authentication mode while attempting secondary authentication");
LABEL_61:
          objc_msgSend(v29, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICAuthenticationPrompt update]", 1, 0, v30);
          goto LABEL_25;
        }
        if (-[ICAuthenticationPrompt usesAlternativeAuthenticationIfAvailable](self, "usesAlternativeAuthenticationIfAvailable")&& -[ICAuthenticationPrompt allowsAlternativeAuthentication](self, "allowsAlternativeAuthentication")|| -[ICAuthenticationPrompt forcesAlternativeAuthentication](self, "forcesAlternativeAuthentication"))
        {
          -[ICAuthenticationPrompt setAuthenticationAction:](self, "setAuthenticationAction:", 2);
          if (-[ICAuthenticationPrompt allowsCustomPasswordAuthentication](self, "allowsCustomPasswordAuthentication"))
          {
            -[ICAuthenticationPrompt account](self, "account");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "accountType");

            if (v22 == 3)
            {
LABEL_53:
              v23 = self;
              v24 = 5;
LABEL_72:
              -[ICAuthenticationPrompt setAuthenticationMechanism:](v23, "setAuthenticationMechanism:", v24);
              goto LABEL_25;
            }
          }
          else if (!-[ICAuthenticationPrompt allowsDevicePasswordAuthentication](self, "allowsDevicePasswordAuthentication"))
          {
            v23 = self;
            v24 = 0;
            goto LABEL_72;
          }
          v23 = self;
          v24 = 6;
          goto LABEL_72;
        }
        -[ICAuthenticationPrompt setAuthenticationAction:](self, "setAuthenticationAction:", 2);
        if (-[ICAuthenticationPrompt allowsCustomPasswordAuthentication](self, "allowsCustomPasswordAuthentication"))
        {
          v23 = self;
          v24 = 4;
          goto LABEL_72;
        }
        if (!-[ICAuthenticationPrompt allowsDevicePasswordAuthentication](self, "allowsDevicePasswordAuthentication"))
        {
          v29 = (void *)MEMORY[0x1E0D641A0];
          v30 = CFSTR("Neither custom nor device authentication allowed while attempting primary authentication");
          goto LABEL_61;
        }
        -[ICAuthenticationPrompt setAuthenticationMechanism:](self, "setAuthenticationMechanism:", 5);
        if (-[ICAuthenticationPrompt intent](self, "intent"))
          goto LABEL_25;
        -[ICAuthenticationPrompt authenticationObject](self, "authenticationObject");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "canAuthenticate");

        if ((v32 & 1) != 0)
        {
          if (-[ICAuthenticationPrompt hasDevicePassword](self, "hasDevicePassword"))
            goto LABEL_25;
          -[ICAuthenticationPrompt successAlerts](self, "successAlerts");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          +[ICAuthenticationAlert setDevicePasswordInfoAlert](ICAuthenticationAlert, "setDevicePasswordInfoAlert");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "arrayByAddingObject:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICAuthenticationPrompt setSuccessAlerts:](self, "setSuccessAlerts:", v9);
          goto LABEL_21;
        }
        -[ICAuthenticationPrompt setAuthenticationAction:](self, "setAuthenticationAction:", 1);
        -[ICAuthenticationPrompt setAuthenticationMechanism:](self, "setAuthenticationMechanism:", 0);
        v33 = -[ICAuthenticationPrompt isKeychainAvailable](self, "isKeychainAvailable");
        -[ICAuthenticationPrompt failureAlerts](self, "failureAlerts");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (v33)
        {
          +[ICAuthenticationAlert keychainItemMissingInfoAlert](ICAuthenticationAlert, "keychainItemMissingInfoAlert");
          v7 = objc_claimAutoreleasedReturnValue();
          goto LABEL_20;
        }
      }
      +[ICAuthenticationAlert enableKeychainActionAlert](ICAuthenticationAlert, "enableKeychainActionAlert");
      v7 = objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    -[ICAuthenticationPrompt setAuthenticationAction:](self, "setAuthenticationAction:", 1);
    -[ICAuthenticationPrompt failureAlerts](self, "failureAlerts");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICAuthenticationAlert cannotUnlockInfoAlert](ICAuthenticationAlert, "cannotUnlockInfoAlert");
    v7 = objc_claimAutoreleasedReturnValue();
  }
LABEL_20:
  v8 = (void *)v7;
  objc_msgSend(v6, "arrayByAddingObject:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationPrompt setFailureAlerts:](self, "setFailureAlerts:", v9);
LABEL_21:

LABEL_22:
LABEL_25:
  if (-[ICAuthenticationPrompt usesBiometricAuthenticationIfAvailable](self, "usesBiometricAuthenticationIfAvailable")
    && -[ICAuthenticationPrompt allowsBiometricAuthentication](self, "allowsBiometricAuthentication")
    && -[ICAuthenticationPrompt authenticationAction](self, "authenticationAction") == 2)
  {
    if (-[ICAuthenticationPrompt biometricAuthenticationType](self, "biometricAuthenticationType") == 4)
    {
      v10 = 3;
    }
    else if (-[ICAuthenticationPrompt biometricAuthenticationType](self, "biometricAuthenticationType") == 2)
    {
      v10 = 1;
    }
    else
    {
      if (-[ICAuthenticationPrompt biometricAuthenticationType](self, "biometricAuthenticationType") != 1)
      {
LABEL_57:
        if (-[ICAuthenticationPrompt allowsCustomPasswordAuthentication](self, "allowsCustomPasswordAuthentication")
          && !-[ICAuthenticationPrompt intent](self, "intent"))
        {
          -[ICAuthenticationPrompt account](self, "account");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          +[ICAuthenticationAlert rememberCustomPasswordInfoAlertWithAccount:](ICAuthenticationAlert, "rememberCustomPasswordInfoAlertWithAccount:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          -[ICAuthenticationPrompt successAlerts](self, "successAlerts");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "arrayByAddingObject:", v26);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICAuthenticationPrompt setSuccessAlerts:](self, "setSuccessAlerts:", v28);

        }
        goto LABEL_32;
      }
      v10 = 2;
    }
    -[ICAuthenticationPrompt setAuthenticationMechanism:](self, "setAuthenticationMechanism:", v10);
    goto LABEL_57;
  }
  if (-[ICAuthenticationPrompt forcesBiometricAuthentication](self, "forcesBiometricAuthentication"))
    -[ICAuthenticationPrompt setAuthenticationAction:](self, "setAuthenticationAction:", 1);
LABEL_32:
  if (-[ICAuthenticationPrompt intent](self, "intent") == 2 || -[ICAuthenticationPrompt intent](self, "intent") == 7)
  {
    if (!-[ICAuthenticationPrompt allowsBiometricAuthentication](self, "allowsBiometricAuthentication")
      && objc_msgSend(MEMORY[0x1E0D63B90], "biometricsAvailable"))
    {
      -[ICAuthenticationPrompt account](self, "account");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[ICAuthenticationAlert enableBiometricsActionAlertWithAccount:](ICAuthenticationAlert, "enableBiometricsActionAlertWithAccount:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      -[ICAuthenticationPrompt successAlerts](self, "successAlerts");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "arrayByAddingObject:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICAuthenticationPrompt setSuccessAlerts:](self, "setSuccessAlerts:", v14);

    }
    -[ICAuthenticationPrompt successAlerts](self, "successAlerts");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICAuthenticationAlert aboutLockedNotesInfoAlert](ICAuthenticationAlert, "aboutLockedNotesInfoAlert");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "arrayByAddingObject:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAuthenticationPrompt setSuccessAlerts:](self, "setSuccessAlerts:", v17);

  }
  -[ICAuthenticationPrompt updateStrings](self, "updateStrings");
}

- (unint64_t)intent
{
  return self->_intent;
}

- (signed)secondaryAuthenticationMode
{
  return self->_secondaryAuthenticationMode;
}

- (void)setSecondaryAuthenticationMode:(signed __int16)a3
{
  self->_secondaryAuthenticationMode = a3;
}

- (ICCloudSyncingObject)object
{
  return self->_object;
}

- (ICAccount)account
{
  return self->_account;
}

- (ICNote)note
{
  return self->_note;
}

- (BOOL)usesSecondaryAuthenticationIfAvailable
{
  return self->_usesSecondaryAuthenticationIfAvailable;
}

- (BOOL)usesAlternativeAuthenticationIfAvailable
{
  return self->_usesAlternativeAuthenticationIfAvailable;
}

- (BOOL)usesBiometricAuthenticationIfAvailable
{
  return self->_usesBiometricAuthenticationIfAvailable;
}

- (BOOL)updatesUserRecordIfNeeded
{
  return self->_updatesUserRecordIfNeeded;
}

- (unint64_t)authenticationAction
{
  return self->_authenticationAction;
}

- (void)setAuthenticationAction:(unint64_t)a3
{
  self->_authenticationAction = a3;
}

- (unint64_t)authenticationMechanism
{
  return self->_authenticationMechanism;
}

- (void)setAuthenticationMechanism:(unint64_t)a3
{
  self->_authenticationMechanism = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)fallbackButtonTitle
{
  return self->_fallbackButtonTitle;
}

- (void)setFallbackButtonTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSArray)successAlerts
{
  return self->_successAlerts;
}

- (void)setSuccessAlerts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSArray)failureAlerts
{
  return self->_failureAlerts;
}

- (void)setFailureAlerts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (BOOL)isInternetReachable
{
  return self->_internetReachable;
}

- (void)setInternetReachable:(BOOL)a3
{
  self->_internetReachable = a3;
}

- (NSArray)notes
{
  return self->_notes;
}

- (void)setNotes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (BOOL)isBiometricAuthenticationEnabled
{
  return self->_biometricAuthenticationEnabled;
}

- (void)setBiometricAuthenticationEnabled:(BOOL)a3
{
  self->_biometricAuthenticationEnabled = a3;
}

- (int64_t)biometricAuthenticationType
{
  return self->_biometricAuthenticationType;
}

- (void)setBiometricAuthenticationType:(int64_t)a3
{
  self->_biometricAuthenticationType = a3;
}

- (BOOL)isKeychainAvailable
{
  return self->_keychainAvailable;
}

- (void)setKeychainAvailable:(BOOL)a3
{
  self->_keychainAvailable = a3;
}

- (BOOL)hasKeychainItem
{
  return self->_hasKeychainItem;
}

- (void)setHasKeychainItem:(BOOL)a3
{
  self->_hasKeychainItem = a3;
}

- (BOOL)hasCloudAccount
{
  return self->_hasCloudAccount;
}

- (void)setHasCloudAccount:(BOOL)a3
{
  self->_hasCloudAccount = a3;
}

- (BOOL)hasDevicePassword
{
  return self->_hasDevicePassword;
}

- (void)setHasDevicePassword:(BOOL)a3
{
  self->_hasDevicePassword = a3;
}

- (NSString)touchBarReason
{
  return self->_touchBarReason;
}

- (void)setTouchBarReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchBarReason, 0);
  objc_storeStrong((id *)&self->_notes, 0);
  objc_storeStrong((id *)&self->_failureAlerts, 0);
  objc_storeStrong((id *)&self->_successAlerts, 0);
  objc_storeStrong((id *)&self->_fallbackButtonTitle, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_note, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_object, 0);
}

+ (void)promptForDeletingNotes:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AC7A1000, log, OS_LOG_TYPE_ERROR, "Notes to delete belong to different accounts", v1, 2u);
}

@end
