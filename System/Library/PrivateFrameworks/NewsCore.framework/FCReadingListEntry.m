@implementation FCReadingListEntry

- (id)initWithEntryID:(void *)a3 dictionaryRepresentation:
{
  id *v3;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id *v12;

  v3 = a1;
  if (a1)
  {
    v5 = a3;
    v6 = a2;
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("articleID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("dateAdded"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("origin"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "unsignedIntegerValue");
    if ((unint64_t)(v10 - 1) >= 3)
      v11 = 0;
    else
      v11 = (void *)v10;

    v12 = -[FCReadingListEntry initWithEntryID:articleID:dateAdded:origin:](v3, v6, v7, v8, v11);
    v3 = v12;

  }
  return v3;
}

- (id)initWithEntryID:(void *)a3 articleID:(void *)a4 dateAdded:(void *)a5 origin:
{
  id v9;
  id v10;
  id v11;
  id *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  id v16;
  void *v18;
  void *v19;
  objc_super v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  if (!a1)
    goto LABEL_12;
  if (!v9 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("reading list entry must have an identifier"));
    *(_DWORD *)buf = 136315906;
    v22 = "-[FCReadingListEntry initWithEntryID:articleID:dateAdded:origin:]";
    v23 = 2080;
    v24 = "FCReadingListEntry.m";
    v25 = 1024;
    v26 = 18;
    v27 = 2114;
    v28 = v18;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (!v10)
    {
LABEL_5:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("reading list entry must have an article ID"));
        *(_DWORD *)buf = 136315906;
        v22 = "-[FCReadingListEntry initWithEntryID:articleID:dateAdded:origin:]";
        v23 = 2080;
        v24 = "FCReadingListEntry.m";
        v25 = 1024;
        v26 = 19;
        v27 = 2114;
        v28 = v19;
        _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      }
    }
  }
  else if (!v10)
  {
    goto LABEL_5;
  }
  v20.receiver = a1;
  v20.super_class = (Class)FCReadingListEntry;
  v12 = (id *)objc_msgSendSuper2(&v20, sel_init);
  a1 = v12;
  if (v12)
  {
    if (v9 && v10)
    {
      v13 = objc_msgSend(v9, "copy");
      v14 = a1[1];
      a1[1] = (id)v13;

      v15 = objc_msgSend(v10, "copy");
      v16 = a1[2];
      a1[2] = (id)v15;

      objc_storeStrong(a1 + 3, a4);
      a1[4] = a5;
    }
    else
    {

      a1 = 0;
    }
  }
LABEL_12:

  return a1;
}

- (id)asCKRecord
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  if (a1)
  {
    if (qword_1ED0F86F0 != -1)
      dispatch_once(&qword_1ED0F86F0, &__block_literal_global_149);
    v2 = objc_alloc(MEMORY[0x1E0C95070]);
    v3 = (void *)objc_msgSend(v2, "initWithRecordName:zoneID:", a1[1], _MergedGlobals_199);
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95048]), "initWithRecordType:recordID:", CFSTR("ReadingListEntry"), v3);
    objc_msgSend(v4, "setObject:forKeyedSubscript:", a1[2], CFSTR("articleID"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", a1[3], CFSTR("dateAdded"));
    if ((unint64_t)(a1[4] - 1) >= 3)
      v5 = 0;
    else
      v5 = a1[4];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("origin"));

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

void __32__FCReadingListEntry_asCKRecord__block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;

  v0 = objc_alloc(MEMORY[0x1E0C95098]);
  v1 = objc_msgSend(v0, "initWithZoneName:ownerName:", CFSTR("ReadingList"), *MEMORY[0x1E0C94730]);
  v2 = (void *)_MergedGlobals_199;
  _MergedGlobals_199 = v1;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateAdded, 0);
  objc_storeStrong((id *)&self->_articleID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
