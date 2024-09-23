@implementation BRCRecentsChangeToken

+ (id)changeTokenFromData:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v9;
  uint64_t v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (!v3)
  {
LABEL_7:
    v5 = 0;
    goto LABEL_8;
  }
  v9 = 0;
  v10 = 0;
  if (objc_msgSend(v3, "length") != 16)
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v12 = v4;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_1CBD43000, v7, OS_LOG_TYPE_DEFAULT, "[WARNING] invalid change token format: %@%@", buf, 0x16u);
    }

    goto LABEL_7;
  }
  objc_msgSend(v4, "getBytes:length:", &v9, 16);
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setNotifRank:", v9);
  objc_msgSend(v5, "setDatabaseID:", v10);
LABEL_8:

  return v5;
}

- (id)toData
{
  __int128 v3;

  v3 = *(_OWORD *)&self->_notifRank;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v3, 16);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("dbID:%llu rank:%llu"), self->_databaseID, self->_notifRank);
}

- (unint64_t)notifRank
{
  return self->_notifRank;
}

- (void)setNotifRank:(unint64_t)a3
{
  self->_notifRank = a3;
}

- (unint64_t)databaseID
{
  return self->_databaseID;
}

- (void)setDatabaseID:(unint64_t)a3
{
  self->_databaseID = a3;
}

@end
