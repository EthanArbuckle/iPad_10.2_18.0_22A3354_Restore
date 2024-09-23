@implementation NTPBAudioPlaylistItem(CK)

+ (uint64_t)identifierFromArticleID:()CK
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("apl-"), a3);
}

+ (id)articleIDFromIdentifier:()CK
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(v3, "substringFromIndex:", objc_msgSend(CFSTR("apl-"), "length"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)initWithCKRecord:()CK
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = a1;
  v13.super_class = (Class)&off_1EE6C9760;
  v5 = objc_msgSendSuper2(&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "recordID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "recordName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setIdentifier:", v7);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("articleID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setArticleID:", v8);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dateAdded"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pbDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDateAdded:", v10);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("order"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setListOrder:", objc_msgSend(v11, "longLongValue"));

  }
  return v5;
}

- (id)asCKRecord
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (qword_1ED0F8570 != -1)
    dispatch_once(&qword_1ED0F8570, &__block_literal_global_121);
  v2 = objc_alloc(MEMORY[0x1E0C95070]);
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithRecordName:zoneID:", v3, _MergedGlobals_189);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95048]), "initWithRecordType:recordID:", CFSTR("AudioPlaylistItem"), v4);
  objc_msgSend(a1, "articleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("articleID"));

  v7 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(a1, "dateAdded");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateWithPBDate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("dateAdded"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(a1, "listOrder"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("order"));

  return v5;
}

@end
