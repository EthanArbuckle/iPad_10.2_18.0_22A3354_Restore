@implementation BCSCloudKitQueryProvider

- (id)queryForFetchConfigItemWithType:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  const __CFString *v7;
  void *v8;

  switch(a3)
  {
    case 1:
      v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB91E8]), "initWithRecordName:", CFSTR("config-v1"));
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB9218]), "initWithRecordID:action:", v3, 0);
      objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("recordID"), v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_alloc(MEMORY[0x24BDB91B8]);
      v7 = CFSTR("ChatSuggestConfig");
      goto LABEL_7;
    case 2:
      v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB91E8]), "initWithRecordName:", CFSTR("config-v2"));
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB9218]), "initWithRecordID:action:", v3, 0);
      objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("recordID"), v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_alloc(MEMORY[0x24BDB91B8]);
      v7 = CFSTR("DomainLinkConfig");
      goto LABEL_7;
    case 3:
      v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB91E8]), "initWithRecordName:", CFSTR("caller-id-config-v1"));
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB9218]), "initWithRecordID:action:", v3, 0);
      objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("recordID"), v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_alloc(MEMORY[0x24BDB91B8]);
      v7 = CFSTR("CallerIdConfig");
      goto LABEL_7;
    case 4:
      v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB91E8]), "initWithRecordName:", CFSTR("BrandedEmail-config-v1"));
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB9218]), "initWithRecordID:action:", v3, 0);
      objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K == %@ AND %K == %@"), CFSTR("recordID"), v4, CFSTR("assetType"), CFSTR("BrandedEmail"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_alloc(MEMORY[0x24BDB91B8]);
      v7 = CFSTR("BcaConfig");
LABEL_7:
      v8 = (void *)objc_msgSend(v6, "initWithRecordType:predicate:", v7, v5);

      break;
    default:
      v8 = 0;
      break;
  }
  return v8;
}

- (id)queryForFetchShardIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v4 = a3;
  -[BCSCloudKitQueryProvider _shardRecordNameForType:index:count:](self, "_shardRecordNameForType:index:count:", objc_msgSend(v4, "type"), objc_msgSend(v4, "startIndex"), objc_msgSend(v4, "shardCount"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB91E8]), "initWithRecordName:", v5);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB9218]), "initWithRecordID:action:", v6, 0);
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("recordID"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x24BDB91B8]);
  v10 = objc_msgSend(v4, "type");

  -[BCSCloudKitQueryProvider _shardRecordTypeForType:](self, "_shardRecordTypeForType:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithRecordType:predicate:", v11, v8);

  return v12;
}

- (id)queryForFetchItemsWithStartIndex:(int64_t)a3 endIndex:(int64_t)a4 type:(int64_t)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  switch(a5)
  {
    case 3:
      v12 = (void *)MEMORY[0x24BDD1758];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", a4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "predicateWithFormat:", CFSTR("%K >= %@ AND %K <= %@"), CFSTR("hash"), v13, CFSTR("hash"), v14);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = objc_alloc(MEMORY[0x24BDB91B8]);
      v11 = CFSTR("CallerId");
      break;
    case 2:
      v15 = (void *)MEMORY[0x24BDD1758];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", a3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", a4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "predicateWithFormat:", CFSTR("%K >= %@ AND %K <= %@"), CFSTR("hashPrefix"), v16, CFSTR("hashPrefix"), v17);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = objc_alloc(MEMORY[0x24BDB91B8]);
      v11 = CFSTR("BusinessLink");
      break;
    case 1:
      v6 = (void *)MEMORY[0x24BDD1758];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", a3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", a4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "predicateWithFormat:", CFSTR("%K >= %@ AND %K <= %@"), CFSTR("hash"), v7, CFSTR("hash"), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = objc_alloc(MEMORY[0x24BDB91B8]);
      v11 = CFSTR("ChatSuggest");
      break;
    default:
      v18 = 0;
      return v18;
  }
  v18 = (void *)objc_msgSend(v10, "initWithRecordType:predicate:", v11, v9);

  return v18;
}

- (id)_shardRecordNameForType:(int64_t)a3 index:(int64_t)a4 count:(int64_t)a5
{
  uint64_t v5;
  uint64_t v6;

  if ((unint64_t)(a3 - 1) <= 4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", off_24C39CF98[a3 - 1], a4, a5, v5, v6);
    self = (BCSCloudKitQueryProvider *)objc_claimAutoreleasedReturnValue();
  }
  return self;
}

- (id)_shardRecordTypeForType:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) > 3)
    return CFSTR("ChatSuggestFilter");
  else
    return off_24C39CFC0[a3 - 2];
}

@end
