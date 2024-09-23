@implementation CKRecord

- (id)fc_sentinel_encryptionKey
{
  void *v1;
  void *v2;

  if (a1)
  {
    objc_msgSend(a1, "encryptedValuesByKey");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("encryptionKey"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (void)setFc_sentinel_encryptionKey:(void *)a1
{
  id v3;
  id v4;

  if (a1)
  {
    v3 = a2;
    objc_msgSend(a1, "encryptedValuesByKey");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, CFSTR("encryptionKey"));

  }
}

- (void)fc_sentinel_finishedMigration
{
  void *v1;
  void *v2;
  uint64_t v3;

  if (result)
  {
    objc_msgSend(result, "valuesByKey");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("migratedUnencryptedData"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "BOOLValue");

    return (void *)v3;
  }
  return result;
}

- (void)setFc_sentinel_finishedMigration:(void *)a1
{
  void *v4;
  id v5;

  if (a1)
  {
    if (-[CKRecord fc_sentinel_finishedMigration](a1) != (_DWORD)a2)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "valuesByKey");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("migratedUnencryptedData"));

    }
  }
}

- (void)fc_sentinel_finishedDeletion
{
  void *v1;
  void *v2;
  uint64_t v3;

  if (result)
  {
    objc_msgSend(result, "valuesByKey");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("deletedUnencryptedData"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "BOOLValue");

    return (void *)v3;
  }
  return result;
}

- (void)setFc_sentinel_finishedDeletion:(void *)a1
{
  void *v4;
  id v5;

  if (a1)
  {
    if (-[CKRecord fc_sentinel_finishedDeletion](a1) != (_DWORD)a2)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "valuesByKey");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("deletedUnencryptedData"));

    }
  }
}

- (void)fc_sentinel_finishedSubscriptionMigration
{
  void *v1;
  void *v2;
  uint64_t v3;

  if (result)
  {
    objc_msgSend(result, "valuesByKey");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("migratedSubscriptions"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "BOOLValue");

    return (void *)v3;
  }
  return result;
}

- (void)setFc_sentinel_finishedSubscriptionMigration:(void *)a1
{
  void *v4;
  id v5;

  if (a1)
  {
    if (-[CKRecord fc_sentinel_finishedSubscriptionMigration](a1) != (_DWORD)a2)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "valuesByKey");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("migratedSubscriptions"));

    }
  }
}

- (void)fc_sentinel_finishedSubscriptionDeletion
{
  void *v1;
  void *v2;
  uint64_t v3;

  if (result)
  {
    objc_msgSend(result, "valuesByKey");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("deletedSubscriptions"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "BOOLValue");

    return (void *)v3;
  }
  return result;
}

- (void)setFc_sentinel_finishedSubscriptionDeletion:(void *)a1
{
  void *v4;
  id v5;

  if (a1)
  {
    if (-[CKRecord fc_sentinel_finishedSubscriptionDeletion](a1) != (_DWORD)a2)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "valuesByKey");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("deletedSubscriptions"));

    }
  }
}

- (void)fc_sentinel_finishedMigrationToVersion
{
  void *v1;
  void *v2;
  uint64_t v3;

  if (result)
  {
    objc_msgSend(result, "encryptedValuesByKey");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("migratedToVersion"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "unsignedIntegerValue");

    return (void *)v3;
  }
  return result;
}

- (void)setFc_sentinel_finishedMigrationToVersion:(void *)a1
{
  void *v4;
  id v5;

  if (a1)
  {
    if (-[CKRecord fc_sentinel_finishedMigrationToVersion](a1) != a2)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "encryptedValuesByKey");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("migratedToVersion"));

    }
  }
}

- (void)fc_sentinel_finishedDeletionToVersion
{
  void *v1;
  void *v2;
  uint64_t v3;

  if (result)
  {
    objc_msgSend(result, "encryptedValuesByKey");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("deletedToVersion"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "integerValue");

    return (void *)v3;
  }
  return result;
}

- (void)setFc_sentinel_finishedDeletionToVersion:(void *)a1
{
  void *v4;
  id v5;

  if (a1)
  {
    if (-[CKRecord fc_sentinel_finishedDeletionToVersion](a1) != a2)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "encryptedValuesByKey");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("deletedToVersion"));

    }
  }
}

- (void)setFc_sentinel_version:(void *)a1
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  if (a1)
  {
    objc_msgSend(a1, "valuesByKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("version"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "integerValue");

    if (v6 != a2)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "valuesByKey");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("version"));

    }
  }
}

+ (id)secureSentinelRecordWithEncryptionKey:(uint64_t)a1
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v2 = a2;
  objc_opt_self();
  v3 = objc_alloc(MEMORY[0x1E0C95048]);
  +[CKRecordID fc_staticSecureSentinelRecordID]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithRecordType:recordID:", CFSTR("SentinelSecure"), v4);

  if (!v5)
    goto LABEL_4;
  v6 = v2;
  objc_msgSend(v5, "encryptedValuesByKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("encryptionKey"));

  objc_msgSend(v5, "valuesByKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("version"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedIntegerValue");

  if (v10 != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 1);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "valuesByKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v2, CFSTR("version"));

LABEL_4:
  }
  return v5;
}

- (id)fc_secureSentinel_encryptionKey
{
  void *v1;
  void *v2;

  if (a1)
  {
    objc_msgSend(a1, "encryptedValuesByKey");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("encryptionKey"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (uint64_t)fc_sentinel_databaseVersion
{
  void *v1;

  if (result)
  {
    v1 = (void *)result;
    if (-[CKRecord fc_sentinel_finishedMigrationToVersion]((void *)result))
    {
      return (uint64_t)-[CKRecord fc_sentinel_finishedMigrationToVersion](v1);
    }
    else if ((-[CKRecord fc_sentinel_finishedSubscriptionMigration](v1) & 1) != 0)
    {
      return 2;
    }
    else
    {
      return -[CKRecord fc_sentinel_finishedMigration](v1);
    }
  }
  return result;
}

- (void)setFc_sentinel_databaseVersion:(void *)a1
{
  if (a1)
  {
    -[CKRecord setFc_sentinel_finishedMigrationToVersion:](a1, (void *)a2);
    if (a2 <= 3)
    {
      -[CKRecord setFc_sentinel_finishedMigration:](a1, (0xEu >> (a2 & 0xF)) & 1);
      -[CKRecord setFc_sentinel_finishedSubscriptionMigration:](a1, (0xCu >> (a2 & 0xF)) & 1);
    }
  }
}

- (uint64_t)fc_sentinel_deletedToDatabaseVersion
{
  void *v1;

  if (result)
  {
    v1 = (void *)result;
    if (-[CKRecord fc_sentinel_finishedDeletionToVersion]((void *)result))
    {
      return (uint64_t)-[CKRecord fc_sentinel_finishedDeletionToVersion](v1);
    }
    else if ((-[CKRecord fc_sentinel_finishedSubscriptionDeletion](v1) & 1) != 0)
    {
      return 2;
    }
    else
    {
      return -[CKRecord fc_sentinel_finishedDeletion](v1);
    }
  }
  return result;
}

- (void)setFc_sentinel_deletedToDatabaseVersion:(void *)a1
{
  if (a1)
  {
    -[CKRecord setFc_sentinel_finishedDeletionToVersion:](a1, (void *)a2);
    if (a2 <= 3)
    {
      -[CKRecord setFc_sentinel_finishedDeletion:](a1, (0xEu >> (a2 & 0xF)) & 1);
      -[CKRecord setFc_sentinel_finishedSubscriptionDeletion:](a1, (0xCu >> (a2 & 0xF)) & 1);
    }
  }
}

@end
