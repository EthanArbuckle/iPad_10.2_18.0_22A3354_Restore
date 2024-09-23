@implementation MFMailboxUid(NNMKAdditions)

- (id)nano_mailboxId
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;

  objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getActivePairedDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("D8A5B9F1-722E-436E-B616-1398AEB94F1B"));
  v5 = objc_msgSend(v3, "supportsCapability:", v4);

  if (v5)
  {
    objc_msgSend(a1, "URL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "absoluteString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 && objc_msgSend(v7, "length"))
    {
      v8 = v7;
    }
    else
    {
      objc_msgSend(a1, "account");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "nano_accountId");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[NNMKMailbox generateLegacyMailboxIdWithAccountId:mailboxName:](NNMKMailbox, "generateLegacyMailboxIdWithAccountId:mailboxName:", v13, v14);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = qword_253E87A90;
      if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
        -[MFMailboxUid(NNMKAdditions) nano_mailboxId].cold.1((uint64_t)v8, v15);
    }
  }
  else
  {
    objc_msgSend(a1, "account");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "nano_accountId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[NNMKMailbox generateLegacyMailboxIdWithAccountId:mailboxName:](NNMKMailbox, "generateLegacyMailboxIdWithAccountId:mailboxName:", v10, v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

+ (uint64_t)nano_toMailboxType:()NNMKAdditions
{
  if (a3 > 9)
    return 1;
  else
    return qword_22E1DAAC0[a3];
}

- (id)nano_displayName
{
  if (objc_msgSend(a1, "type") == 7)
    objc_msgSend(a1, "displayNameUsingSpecialNames");
  else
    objc_msgSend(a1, "displayName");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NNMKMailbox)nano_mailbox
{
  NNMKMailbox *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = objc_alloc_init(NNMKMailbox);
  objc_msgSend(a1, "displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKMailbox setCustomName:](v2, "setCustomName:", v3);

  objc_msgSend(a1, "nano_mailboxId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKMailbox setMailboxId:](v2, "setMailboxId:", v4);

  -[NNMKMailbox setType:](v2, "setType:", objc_msgSend(a1, "nano_mailboxType"));
  objc_msgSend(a1, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKMailbox setUrl:](v2, "setUrl:", v5);

  if (-[NNMKMailbox type](v2, "type") == 1)
  {
    objc_msgSend(a1, "account");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NNMKMailbox setCustomName:](v2, "setCustomName:", v7);

  }
  objc_msgSend(a1, "account");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "nano_accountId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKMailbox setAccountId:](v2, "setAccountId:", v9);

  return v2;
}

- (uint64_t)nano_mailboxType
{
  uint64_t v2;
  uint64_t result;

  v2 = objc_msgSend(a1, "type");
  result = 5;
  switch(v2)
  {
    case 0:
      if (objc_msgSend(a1, "isNotesMailboxUid"))
        result = 0;
      else
        result = 9;
      break;
    case 1:
      return result;
    case 2:
LABEL_7:
      result = 3;
      break;
    case 3:
LABEL_8:
      result = 4;
      break;
    case 4:
LABEL_9:
      result = 2;
      break;
    case 5:
LABEL_10:
      result = 6;
      break;
    case 6:
LABEL_11:
      result = 7;
      break;
    case 7:
LABEL_6:
      result = 1;
      break;
    case 8:
      result = 8;
      break;
    default:
      switch(v2)
      {
        case 'd':
          goto LABEL_6;
        case 'e':
          return result;
        case 'f':
          goto LABEL_7;
        case 'g':
          goto LABEL_8;
        case 'h':
          goto LABEL_9;
        case 'i':
          goto LABEL_10;
        case 'j':
          goto LABEL_11;
        default:
          result = 0;
          break;
      }
      break;
  }
  return result;
}

- (void)nano_mailboxId
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_22E161000, a2, OS_LOG_TYPE_ERROR, "Missing mailbox url and falling back to legacy id: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
