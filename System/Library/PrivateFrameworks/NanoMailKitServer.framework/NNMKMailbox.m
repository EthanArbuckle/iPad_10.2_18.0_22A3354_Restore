@implementation NNMKMailbox

+ (id)generateLegacyMailboxIdWithAccountId:(id)a3 mailboxName:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/%@"), a3, a4);
}

- (NNMKMailbox)init
{
  return -[NNMKMailbox initWithFilterType:](self, "initWithFilterType:", 0);
}

- (NNMKMailbox)initWithFilterType:(unint64_t)a3
{
  NNMKMailbox *v4;
  NNMKMailbox *v5;
  NSString *accountId;
  NSURL *url;
  NSString *customName;
  NSString *mailboxId;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NNMKMailbox;
  v4 = -[NNMKMailbox init](&v11, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_filterType = a3;
    accountId = v4->_accountId;
    v4->_accountId = 0;

    url = v5->_url;
    v5->_url = 0;

    customName = v5->_customName;
    v5->_customName = (NSString *)&stru_24F9F9D80;

    mailboxId = v5->_mailboxId;
    v5->_mailboxId = (NSString *)CFSTR("-1");

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NNMKMailbox *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = objc_alloc_init(NNMKMailbox);
  -[NNMKMailbox setType:](v4, "setType:", -[NNMKMailbox type](self, "type"));
  -[NNMKMailbox setFilterType:](v4, "setFilterType:", -[NNMKMailbox filterType](self, "filterType"));
  -[NNMKMailbox mailboxId](self, "mailboxId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKMailbox setMailboxId:](v4, "setMailboxId:", v5);

  -[NNMKMailbox accountId](self, "accountId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKMailbox setAccountId:](v4, "setAccountId:", v6);

  -[NNMKMailbox accountLocalId](self, "accountLocalId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKMailbox setAccountLocalId:](v4, "setAccountLocalId:", v7);

  -[NNMKMailbox url](self, "url");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKMailbox setUrl:](v4, "setUrl:", v8);

  -[NNMKMailbox customName](self, "customName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKMailbox setCustomName:](v4, "setCustomName:", v9);

  -[NNMKMailbox setSyncEnabled:](v4, "setSyncEnabled:", -[NNMKMailbox syncEnabled](self, "syncEnabled"));
  -[NNMKMailbox setSyncRequested:](v4, "setSyncRequested:", -[NNMKMailbox syncRequested](self, "syncRequested"));
  -[NNMKMailbox setSyncActive:](v4, "setSyncActive:", -[NNMKMailbox syncActive](self, "syncActive"));
  -[NNMKMailbox lastUpdate](self, "lastUpdate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKMailbox setLastUpdate:](v4, "setLastUpdate:", v10);

  -[NNMKMailbox setDatabaseContentVerified:](v4, "setDatabaseContentVerified:", -[NNMKMailbox databaseContentVerified](self, "databaseContentVerified"));
  return v4;
}

- (void)setMailboxId:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  NSString *mailboxId;

  v4 = (__CFString *)a3;
  v5 = CFSTR("-1");
  if (v4)
    v5 = v4;
  mailboxId = self->_mailboxId;
  self->_mailboxId = &v5->isa;

}

- (void)setSelected:(BOOL)a3
{
  self->_syncEnabled = a3;
}

- (BOOL)hasSelection
{
  return self->_syncEnabled || self->_syncRequested;
}

- (BOOL)isPushEnabled
{
  return (self->_type & 0xFFFFFFFFFFFFFFF6) == 0;
}

- (BOOL)isSelected
{
  return self->_syncEnabled;
}

- (BOOL)isSelectedForFilterType:(unint64_t)a3
{
  return (self->_syncEnabled || self->_syncRequested) && -[NNMKMailbox hasFilterType:](self, "hasFilterType:", a3);
}

- (BOOL)hasAnyFilter
{
  return self->_filterType != 0;
}

- (BOOL)shouldFilter
{
  unint64_t type;

  type = self->_type;
  return type == 6 || type == 0;
}

+ (id)idsFromMailboxes:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "mailboxId", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NNMKMailbox)initWithCoder:(id)a3
{
  id v4;
  NNMKMailbox *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSString *mailboxId;
  uint64_t v10;
  NSString *accountId;
  uint64_t v12;
  NSString *accountLocalId;
  uint64_t v14;
  NSURL *url;
  uint64_t v16;
  NSString *customName;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSDate *lastUpdate;
  void *v23;

  v4 = a3;
  v5 = -[NNMKMailbox init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNSCodingKeyType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = objc_msgSend(v6, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNSCodingKeyFilterType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_filterType = objc_msgSend(v7, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNSCodingKeyMailboxId"));
    v8 = objc_claimAutoreleasedReturnValue();
    mailboxId = v5->_mailboxId;
    v5->_mailboxId = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNSCodingKeyAccountId"));
    v10 = objc_claimAutoreleasedReturnValue();
    accountId = v5->_accountId;
    v5->_accountId = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNSCodingKeyAccountLocalId"));
    v12 = objc_claimAutoreleasedReturnValue();
    accountLocalId = v5->_accountLocalId;
    v5->_accountLocalId = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNSCodingKeyURL"));
    v14 = objc_claimAutoreleasedReturnValue();
    url = v5->_url;
    v5->_url = (NSURL *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNSCodingKeyCustomName"));
    v16 = objc_claimAutoreleasedReturnValue();
    customName = v5->_customName;
    v5->_customName = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNSCodingKeySyncEnabled"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_syncEnabled = objc_msgSend(v18, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNSCodingKeySyncRequested"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_syncRequested = objc_msgSend(v19, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNSCodingKeySyncActive"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_syncActive = objc_msgSend(v20, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNSCodingKeyLastUpdate"));
    v21 = objc_claimAutoreleasedReturnValue();
    lastUpdate = v5->_lastUpdate;
    v5->_lastUpdate = (NSDate *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNSCodingKeyNeedsDatabaseVerification"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_databaseContentVerified = objc_msgSend(v23, "BOOLValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  unint64_t type;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = (void *)MEMORY[0x24BDD16E0];
  type = self->_type;
  v6 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", type);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v7, CFSTR("kNSCodingKeyType"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_filterType);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v8, CFSTR("kNSCodingKeyFilterType"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_accountId, CFSTR("kNSCodingKeyAccountId"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_accountLocalId, CFSTR("kNSCodingKeyAccountLocalId"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_mailboxId, CFSTR("kNSCodingKeyMailboxId"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_url, CFSTR("kNSCodingKeyURL"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_customName, CFSTR("kNSCodingKeyCustomName"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_syncEnabled);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v9, CFSTR("kNSCodingKeySyncEnabled"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_syncRequested);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v10, CFSTR("kNSCodingKeySyncRequested"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_syncActive);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v11, CFSTR("kNSCodingKeySyncActive"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_lastUpdate, CFSTR("kNSCodingKeyLastUpdate"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_databaseContentVerified);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v12, CFSTR("kNSCodingKeyNeedsDatabaseVerification"));

}

+ (unint64_t)messageStateForMailboxFilterType:(unint64_t)a3
{
  if ((uint64_t)a3 <= 7)
  {
    if (a3 == 2)
      return 64;
    if (a3 == 4)
      return 8;
  }
  else
  {
    switch(a3)
    {
      case 8uLL:
        return 1;
      case 0x10uLL:
        return 32;
      case 0x20uLL:
        return 128;
    }
  }
  return 0;
}

+ (id)generateMailboxIdWithAccountId:(id)a3 mailboxName:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = (void *)MEMORY[0x24BDD14A8];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "URLQueryAllowedCharacterSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAddingPercentEncodingWithAllowedCharacters:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "stringWithFormat:", CFSTR("imap://%@/%@"), v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)hasFilterType:(unint64_t)a3
{
  return (-[NNMKMailbox filterType](self, "filterType") & a3) != 0;
}

- (void)addFilterType:(unint64_t)a3
{
  -[NNMKMailbox setFilterType:](self, "setFilterType:", -[NNMKMailbox filterType](self, "filterType") | a3);
}

- (void)removeFilterType:(unint64_t)a3
{
  if (-[NNMKMailbox hasFilterType:](self, "hasFilterType:"))
    -[NNMKMailbox setFilterType:](self, "setFilterType:", -[NNMKMailbox filterType](self, "filterType") ^ a3);
}

- (BOOL)hasCompoundFilters
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = objc_msgSend(&unk_24FA10E00, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(&unk_24FA10E00);
        v5 += -[NNMKMailbox hasFilterType:](self, "hasFilterType:", objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7), "unsignedIntegerValue"));
        if (v5 > 1)
        {
          LOBYTE(v3) = 1;
          return v3;
        }
        ++v7;
      }
      while (v4 != v7);
      v3 = objc_msgSend(&unk_24FA10E00, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      v4 = v3;
      if (v3)
        continue;
      break;
    }
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    && (v5 = objc_msgSend(v4, "type"), v5 == -[NNMKMailbox type](self, "type"))
    && (v6 = objc_msgSend(v4, "filterType"), v6 == -[NNMKMailbox filterType](self, "filterType")))
  {
    objc_msgSend(v4, "mailboxId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NNMKMailbox mailboxId](self, "mailboxId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", v8))
    {
      objc_msgSend(v4, "customName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NNMKMailbox customName](self, "customName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqualToString:", v10);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[NNMKMailbox mailboxId](self, "mailboxId");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Mailbox Id: %@, Type: %lu, Filter: %lu, Account: %@, URL: %@, Name: %@, Enabled: %lu, Active: %lu, Requested: %lu"), self->_mailboxId, self->_type, self->_filterType, self->_accountId, self->_url, self->_customName, self->_syncEnabled, self->_syncActive, self->_syncRequested);
}

+ (unint64_t)syncedTypeFromMailbox:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v8;

  v4 = a3;
  objc_msgSend(v4, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_msgSend(v4, "type");

    if (v6 == 1)
      return 100;
    else
      return 200;
  }
  else
  {
    v8 = objc_msgSend(v4, "filterType");

    return objc_msgSend(a1, "syncedTypeFromFilterType:", v8);
  }
}

+ (unint64_t)syncedTypeFromFilterType:(unint64_t)a3
{
  unint64_t result;

  result = a3;
  if ((uint64_t)a3 > 15)
  {
    switch(a3)
    {
      case 0x10uLL:
        return 5;
      case 0x20uLL:
        return 6;
      case 0x40uLL:
        return 7;
      default:
        return 0;
    }
  }
  else
  {
    switch(a3)
    {
      case 1uLL:
        result = 1;
        break;
      case 2uLL:
        return result;
      case 4uLL:
        result = 3;
        break;
      case 8uLL:
        result = 4;
        break;
      default:
        return 0;
    }
  }
  return result;
}

+ (unint64_t)defaultFilterTypes
{
  return 31;
}

- (void)resetURL
{
  NSURL *url;

  url = self->_url;
  self->_url = 0;

}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (unint64_t)filterType
{
  return self->_filterType;
}

- (void)setFilterType:(unint64_t)a3
{
  self->_filterType = a3;
}

- (NSString)mailboxId
{
  return self->_mailboxId;
}

- (NSString)accountId
{
  return self->_accountId;
}

- (void)setAccountId:(id)a3
{
  objc_storeStrong((id *)&self->_accountId, a3);
}

- (NSString)accountLocalId
{
  return self->_accountLocalId;
}

- (void)setAccountLocalId:(id)a3
{
  objc_storeStrong((id *)&self->_accountLocalId, a3);
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (NSString)customName
{
  return self->_customName;
}

- (void)setCustomName:(id)a3
{
  objc_storeStrong((id *)&self->_customName, a3);
}

- (NSDate)syncRequestedDate
{
  return self->_syncRequestedDate;
}

- (void)setSyncRequestedDate:(id)a3
{
  objc_storeStrong((id *)&self->_syncRequestedDate, a3);
}

- (BOOL)syncRequested
{
  return self->_syncRequested;
}

- (void)setSyncRequested:(BOOL)a3
{
  self->_syncRequested = a3;
}

- (BOOL)syncEnabled
{
  return self->_syncEnabled;
}

- (void)setSyncEnabled:(BOOL)a3
{
  self->_syncEnabled = a3;
}

- (BOOL)syncActive
{
  return self->_syncActive;
}

- (void)setSyncActive:(BOOL)a3
{
  self->_syncActive = a3;
}

- (NSDate)lastUpdate
{
  return self->_lastUpdate;
}

- (void)setLastUpdate:(id)a3
{
  objc_storeStrong((id *)&self->_lastUpdate, a3);
}

- (void)setHasSelection:(BOOL)a3
{
  self->_hasSelection = a3;
}

- (void)setIsPushEnabled:(BOOL)a3
{
  self->_isPushEnabled = a3;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (BOOL)databaseContentVerified
{
  return self->_databaseContentVerified;
}

- (void)setDatabaseContentVerified:(BOOL)a3
{
  self->_databaseContentVerified = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_lastUpdate, 0);
  objc_storeStrong((id *)&self->_syncRequestedDate, 0);
  objc_storeStrong((id *)&self->_customName, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_accountLocalId, 0);
  objc_storeStrong((id *)&self->_accountId, 0);
  objc_storeStrong((id *)&self->_mailboxId, 0);
}

- (void)initWithCoder:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_22E161000, log, OS_LOG_TYPE_ERROR, "NNMKMailbox entity is unable to decode some of the fields (possible Message.framework API changes): %{public}@", buf, 0xCu);

}

@end
