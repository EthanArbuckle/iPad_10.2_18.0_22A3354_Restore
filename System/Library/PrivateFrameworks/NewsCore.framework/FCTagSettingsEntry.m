@implementation FCTagSettingsEntry

- (FCTagSettingsEntry)initWithEntryID:(id)a3 tagID:(id)a4 fontMultiplier:(id)a5 fontMultiplierMacOS:(id)a6 contentScale:(id)a7 contentScaleMacOS:(id)a8 accessToken:(id)a9 webAccessOptIn:(BOOL)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  FCTagSettingsEntry *v23;
  FCTagSettingsEntry *v24;
  uint64_t v25;
  NSString *identifier;
  uint64_t v27;
  NSString *tagID;
  uint64_t v29;
  NSNumber *fontMultiplier;
  uint64_t v31;
  NSNumber *fontMultiplierMacOS;
  uint64_t v33;
  NSNumber *contentScale;
  uint64_t v35;
  NSNumber *contentScaleMacOS;
  uint64_t v37;
  NSString *accessToken;
  void *v40;
  void *v41;
  objc_super v42;
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  char *v46;
  __int16 v47;
  int v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  if (!v16 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("tag settings list entry must have an identifier"));
    *(_DWORD *)buf = 136315906;
    v44 = "-[FCTagSettingsEntry initWithEntryID:tagID:fontMultiplier:fontMultiplierMacOS:contentScale:contentScaleMacOS:a"
          "ccessToken:webAccessOptIn:]";
    v45 = 2080;
    v46 = "FCTagSettingsEntry.m";
    v47 = 1024;
    v48 = 24;
    v49 = 2114;
    v50 = v40;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v17)
      goto LABEL_6;
  }
  else if (v17)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("tag settings list entry must have a tag identifier"));
    *(_DWORD *)buf = 136315906;
    v44 = "-[FCTagSettingsEntry initWithEntryID:tagID:fontMultiplier:fontMultiplierMacOS:contentScale:contentScaleMacOS:a"
          "ccessToken:webAccessOptIn:]";
    v45 = 2080;
    v46 = "FCTagSettingsEntry.m";
    v47 = 1024;
    v48 = 25;
    v49 = 2114;
    v50 = v41;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  v42.receiver = self;
  v42.super_class = (Class)FCTagSettingsEntry;
  v23 = -[FCTagSettingsEntry init](&v42, sel_init);
  v24 = v23;
  if (v23)
  {
    if (v16 && v17)
    {
      v25 = objc_msgSend(v16, "copy");
      identifier = v24->_identifier;
      v24->_identifier = (NSString *)v25;

      v27 = objc_msgSend(v17, "copy");
      tagID = v24->_tagID;
      v24->_tagID = (NSString *)v27;

      v29 = objc_msgSend(v18, "copy");
      fontMultiplier = v24->_fontMultiplier;
      v24->_fontMultiplier = (NSNumber *)v29;

      v31 = objc_msgSend(v19, "copy");
      fontMultiplierMacOS = v24->_fontMultiplierMacOS;
      v24->_fontMultiplierMacOS = (NSNumber *)v31;

      v33 = objc_msgSend(v20, "copy");
      contentScale = v24->_contentScale;
      v24->_contentScale = (NSNumber *)v33;

      v35 = objc_msgSend(v21, "copy");
      contentScaleMacOS = v24->_contentScaleMacOS;
      v24->_contentScaleMacOS = (NSNumber *)v35;

      v37 = objc_msgSend(v22, "copy");
      accessToken = v24->_accessToken;
      v24->_accessToken = (NSString *)v37;

      v24->_webAccessOptIn = a10;
    }
    else
    {

      v24 = 0;
    }
  }

  return v24;
}

- (CKRecord)asCKRecord
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  if (qword_1ED0F7D78 != -1)
    dispatch_once(&qword_1ED0F7D78, &__block_literal_global_9);
  v3 = objc_alloc(MEMORY[0x1E0C95070]);
  -[FCTagSettingsEntry identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithRecordName:zoneID:", v4, _MergedGlobals_139);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95048]), "initWithRecordType:recordID:", CFSTR("TagSettings"), v5);
  -[FCTagSettingsEntry tagID](self, "tagID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v7, CFSTR("tagID"));

  -[FCTagSettingsEntry fontMultiplier](self, "fontMultiplier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v8, CFSTR("fontMultiplier"));

  -[FCTagSettingsEntry fontMultiplierMacOS](self, "fontMultiplierMacOS");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v9, CFSTR("fontMultiplierMacOS"));

  -[FCTagSettingsEntry contentScale](self, "contentScale");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v10, CFSTR("contentScale"));

  -[FCTagSettingsEntry contentScaleMacOS](self, "contentScaleMacOS");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v11, CFSTR("contentScaleMacOS"));

  -[FCTagSettingsEntry accessToken](self, "accessToken");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v12, CFSTR("accessToken"));

  if (-[FCTagSettingsEntry webAccessOptIn](self, "webAccessOptIn"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[FCTagSettingsEntry webAccessOptIn](self, "webAccessOptIn"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forKey:", v13, CFSTR("webAccessOptIn"));

  }
  return (CKRecord *)v6;
}

void __32__FCTagSettingsEntry_asCKRecord__block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;

  v0 = objc_alloc(MEMORY[0x1E0C95098]);
  v1 = objc_msgSend(v0, "initWithZoneName:ownerName:", CFSTR("UserInfo"), *MEMORY[0x1E0C94730]);
  v2 = (void *)_MergedGlobals_139;
  _MergedGlobals_139 = v1;

}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)tagID
{
  return self->_tagID;
}

- (NSNumber)fontMultiplier
{
  return self->_fontMultiplier;
}

- (NSNumber)fontMultiplierMacOS
{
  return self->_fontMultiplierMacOS;
}

- (NSNumber)contentScale
{
  return self->_contentScale;
}

- (NSNumber)contentScaleMacOS
{
  return self->_contentScaleMacOS;
}

- (NSString)accessToken
{
  return self->_accessToken;
}

- (BOOL)webAccessOptIn
{
  return self->_webAccessOptIn;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessToken, 0);
  objc_storeStrong((id *)&self->_contentScaleMacOS, 0);
  objc_storeStrong((id *)&self->_contentScale, 0);
  objc_storeStrong((id *)&self->_fontMultiplierMacOS, 0);
  objc_storeStrong((id *)&self->_fontMultiplier, 0);
  objc_storeStrong((id *)&self->_tagID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (id)initWithEntryID:(void *)a1 dictionaryRepresentation:(void *)a2
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;

  v2 = a1;
  if (a1)
  {
    v3 = a2;
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("tagID"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("fontMultiplier"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("fontMultiplierMacOS"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("contentScale"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("contentScaleMacOS"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("accessToken"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("webAccessOptIn"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ts-%@"), v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v13) = objc_msgSend(v10, "BOOLValue");
    v2 = (id)objc_msgSend(v2, "initWithEntryID:tagID:fontMultiplier:fontMultiplierMacOS:contentScale:contentScaleMacOS:accessToken:webAccessOptIn:", v11, v4, v5, v6, v7, v8, v9, v13);

  }
  return v2;
}

- (id)dictionaryRepresentation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "tagID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("tagID"));

  objc_msgSend(a1, "fontMultiplier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(a1, "fontMultiplier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v5, CFSTR("fontMultiplier"));

  }
  objc_msgSend(a1, "fontMultiplierMacOS");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(a1, "fontMultiplierMacOS");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v7, CFSTR("fontMultiplierMacOS"));

  }
  objc_msgSend(a1, "contentScale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(a1, "contentScale");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v9, CFSTR("contentScale"));

  }
  objc_msgSend(a1, "contentScaleMacOS");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(a1, "contentScaleMacOS");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v11, CFSTR("contentScaleMacOS"));

  }
  objc_msgSend(a1, "accessToken");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(a1, "accessToken");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v13, CFSTR("accessToken"));

  }
  if (objc_msgSend(a1, "webAccessOptIn"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1, "webAccessOptIn"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v14, CFSTR("webAccessOptIn"));

  }
  v15 = (void *)objc_msgSend(v2, "copy");

  return v15;
}

@end
