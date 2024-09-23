@implementation BCSLinkItemPersistentStore

- (BCSLinkItemPersistentStore)init
{
  objc_super v2;

  if (self)
  {
    v2.receiver = self;
    v2.super_class = (Class)BCSLinkItemPersistentStore;
    self = -[BCSPersistentStore init](&v2, sel_init);
    if (self)
      self->_schemaVersion = 3;
  }
  return self;
}

+ (const)debugQueueName
{
  return "com.apple.businesschat.persistentStore.linkItems";
}

- (id)databasePath
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  if (!objc_msgSend((id)databasePath_databasePath, "length"))
  {
    +[BCSPathProvider sharedInstance](BCSPathProvider, "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "documentsURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "path");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("link_items.db"));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)databasePath_databasePath;
    databasePath_databasePath = v5;

  }
  return (id)databasePath_databasePath;
}

- (int64_t)schemaVersion
{
  return self->_schemaVersion;
}

- (void)schemaVersionWillChangeForDatabase:(sqlite3 *)a3 fromSchemaVersion:(int64_t)a4 toSchemaVersion:(int64_t)a5
{
  NSObject *v8;
  NSObject *v9;
  const char *v10;
  sqlite3_stmt *ppStmt;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int64_t v15;
  __int16 v16;
  int64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  ABSLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v13 = "-[BCSLinkItemPersistentStore schemaVersionWillChangeForDatabase:fromSchemaVersion:toSchemaVersion:]";
    v14 = 2048;
    v15 = a4;
    v16 = 2048;
    v17 = a5;
    _os_log_impl(&dword_20ACAD000, v8, OS_LOG_TYPE_DEFAULT, "%s schema version will change from '%ld' to '%ld', dropping link_items table", buf, 0x20u);
  }

  ppStmt = 0;
  if (!sqlite3_prepare_v2(a3, "DROP TABLE IF EXISTS link_items", -1, &ppStmt, 0))
  {
    if (sqlite3_step(ppStmt) != 101)
    {
      ABSLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = sqlite3_errmsg(a3);
        *(_DWORD *)buf = 136315138;
        v13 = v10;
        _os_log_error_impl(&dword_20ACAD000, v9, OS_LOG_TYPE_ERROR, "error while dropping link_items table: %s", buf, 0xCu);
      }

    }
    sqlite3_finalize(ppStmt);
  }
}

- (const)schema
{
  return "create table if not exists link_items (full_hash_string text primary key, link_url_string text, bundle_id_strin"
         "g text, hero_image_url_string text, icon_image_url_string text, redirect_url_string text, action integer, expir"
         "ation_date double, content_item_models blob, is_powered_by int, map_icon_style_attributes blob, map_item_muid blob)";
}

- (id)itemMatching:(id)a3
{
  id *v4;
  BCSLinkItem *v6;
  void *v7;
  void *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  sqlite3_stmt *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  id v19;
  void (**v20)(_QWORD, _QWORD, _QWORD);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  BCSLinkItem *v30;
  BCSLocaleHelper *v31;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  sqlite3_stmt *ppStmt;
  _QWORD v47[5];
  _QWORD v48[5];
  _QWORD v49[4];
  id v50;
  _QWORD v51[4];
  id v52;
  _QWORD v53[4];
  id v54;
  _QWORD v55[5];
  _QWORD v56[4];
  id v57;
  _QWORD v58[5];
  _QWORD v59[3];
  _QWORD v60[3];

  v60[1] = *MEMORY[0x24BDAC8D0];
  v4 = (id *)a3;
  if (objc_msgSend(v4, "type") != 2 || self == 0)
  {
    v6 = 0;
  }
  else
  {
    v7 = (void *)MEMORY[0x24BDD17C8];
    if (v4)
      v8 = (void *)objc_msgSend(v4[1], "copy");
    else
      v8 = 0;
    objc_msgSend(v7, "stringWithFormat:", CFSTR("SELECT link_url_string, bundle_id_string, hero_image_url_string, icon_image_url_string, redirect_url_string, action, expiration_date, content_item_models, is_powered_by, map_icon_style_attributes, map_item_muid FROM link_items WHERE full_hash_string = \"%@\"), v8);
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = (const char *)objc_msgSend(v9, "UTF8String");

    -[BCSPersistentStore beginBatch](self, "beginBatch");
    ppStmt = 0;
    v6 = 0;
    if (!sqlite3_prepare_v2(-[BCSPersistentStore openedDatabase](self, "openedDatabase"), v10, -1, &ppStmt, 0))
    {
      if (sqlite3_step(ppStmt) == 100)
      {
        v11 = MEMORY[0x24BDAC760];
        v12 = ppStmt;
        v58[0] = MEMORY[0x24BDAC760];
        v58[1] = 3221225472;
        v58[2] = __60__BCSLinkItemPersistentStore__extractLinkItemFromStatement___block_invoke;
        v58[3] = &__block_descriptor_40_e18___NSString_12__0i8l;
        v58[4] = ppStmt;
        v13 = (void *)MEMORY[0x20BD30274](v58);
        v56[0] = v11;
        v56[1] = 3221225472;
        v56[2] = __60__BCSLinkItemPersistentStore__extractLinkItemFromStatement___block_invoke_2;
        v56[3] = &unk_24C39C140;
        v14 = v13;
        v57 = v14;
        v15 = MEMORY[0x20BD30274](v56);
        v55[0] = v11;
        v55[1] = 3221225472;
        v55[2] = __60__BCSLinkItemPersistentStore__extractLinkItemFromStatement___block_invoke_3;
        v55[3] = &__block_descriptor_40_e30___NSObject_20__0__NSArray_8i16l;
        v55[4] = v12;
        v16 = (void *)MEMORY[0x20BD30274](v55);
        v53[0] = v11;
        v53[1] = 3221225472;
        v53[2] = __60__BCSLinkItemPersistentStore__extractLinkItemFromStatement___block_invoke_26;
        v53[3] = &unk_24C39C188;
        v17 = v16;
        v54 = v17;
        v18 = MEMORY[0x20BD30274](v53);
        v51[0] = v11;
        v51[1] = 3221225472;
        v51[2] = __60__BCSLinkItemPersistentStore__extractLinkItemFromStatement___block_invoke_29;
        v51[3] = &unk_24C39C1B0;
        v19 = v17;
        v52 = v19;
        v20 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x20BD30274](v51);
        v49[0] = v11;
        v49[1] = 3221225472;
        v49[2] = __60__BCSLinkItemPersistentStore__extractLinkItemFromStatement___block_invoke_32;
        v49[3] = &unk_24C39C1D8;
        v39 = v19;
        v50 = v39;
        v21 = MEMORY[0x20BD30274](v49);
        v48[0] = v11;
        v48[1] = 3221225472;
        v48[2] = __60__BCSLinkItemPersistentStore__extractLinkItemFromStatement___block_invoke_35;
        v48[3] = &__block_descriptor_40_e16___NSDate_12__0i8l;
        v48[4] = v12;
        v22 = MEMORY[0x20BD30274](v48);
        v47[0] = v11;
        v47[1] = 3221225472;
        v47[2] = __60__BCSLinkItemPersistentStore__extractLinkItemFromStatement___block_invoke_2_38;
        v47[3] = &__block_descriptor_40_e8_B12__0i8l;
        v47[4] = v12;
        v23 = MEMORY[0x20BD30274](v47);
        (*(void (**)(uint64_t, _QWORD))(v15 + 16))(v15, 0);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, uint64_t))v14 + 2))(v14, 1);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, uint64_t))v14 + 2))(v14, 2);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, uint64_t))v14 + 2))(v14, 3);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = (void *)v15;
        (*(void (**)(uint64_t, uint64_t))(v15 + 16))(v15, 4);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = sqlite3_column_int(v12, 5);
        v36 = (void *)v22;
        (*(void (**)(uint64_t, uint64_t))(v22 + 16))(v22, 6);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v60[0] = objc_opt_class();
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v60, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = (void *)v18;
        (*(void (**)(uint64_t, void *, uint64_t))(v18 + 16))(v18, v24, 7);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        v35 = (void *)v23;
        LOBYTE(v24) = (*(uint64_t (**)(uint64_t, uint64_t))(v23 + 16))(v23, 8);
        v59[0] = objc_opt_class();
        v59[1] = objc_opt_class();
        v59[2] = objc_opt_class();
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v59, 3);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *, uint64_t))v20)[2](v20, v26, 9);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        v37 = (void *)v21;
        (*(void (**)(uint64_t, uint64_t))(v21 + 16))(v21, 10);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = -[BCSLinkItemModel initWithLinkURL:bundleID:heroImageURLString:iconImageURLString:redirectURL:action:mapIconStyleAttributes:mapItemMUID:businessLinkContentItemModels:isPoweredBy:]([BCSLinkItemModel alloc], v45, v42, v44, v43, v41, v33, v27, v28, v25, (char)v24);
        if (v29)
        {
          v30 = [BCSLinkItem alloc];
          v31 = objc_alloc_init(BCSLocaleHelper);
          v6 = -[BCSLinkItem initWithLinkItemModel:expirationDate:localeHelper:](v30, "initWithLinkItemModel:expirationDate:localeHelper:", v29, v40, v31);

        }
        else
        {
          v6 = 0;
        }

      }
      else
      {
        v6 = 0;
      }
      sqlite3_finalize(ppStmt);
    }
    -[BCSPersistentStore endBatch](self, "endBatch");
  }

  return v6;
}

- (void)updateItem:(id)a3 withItemIdentifier:(id)a4
{
  id v6;
  char isKindOfClass;
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
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
  char v30;
  void *v31;
  sqlite3_stmt *v32;
  sqlite3_stmt *v33;
  void *v34;
  void *v35;
  id v36;
  sqlite3_stmt *v37;
  void *v38;
  id v39;
  sqlite3_stmt *v40;
  void *v41;
  id v42;
  sqlite3_stmt *v43;
  void *v44;
  id v45;
  sqlite3_stmt *v46;
  void *v47;
  void *v48;
  id v49;
  sqlite3_stmt *v50;
  void *v51;
  double v52;
  sqlite3_stmt *v53;
  id v54;
  sqlite3_stmt *v55;
  void *v56;
  sqlite3_stmt *v57;
  id v58;
  sqlite3_stmt *v59;
  id v60;
  int v61;
  NSObject *v62;
  const char *v63;
  id v64;
  id v65;
  id v66;
  id v67;
  sqlite3_stmt *ppStmt;
  uint8_t buf[4];
  uint64_t v70;
  __int16 v71;
  const char *v72;
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  v67 = a3;
  v6 = a4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if (self && (isKindOfClass & 1) != 0)
  {
    v8 = v6;
    v9 = v67;
    -[BCSPersistentStore beginBatch](self, "beginBatch");
    -[BCSLinkItemPersistentStore deleteItemMatching:](self, "deleteItemMatching:", v8);
    v10 = v9;
    v65 = v8;
    -[BCSPersistentStore beginBatch](self, "beginBatch");
    ppStmt = 0;
    v11 = (void *)MEMORY[0x24BDD1618];
    objc_msgSend(v10, "model");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v12)
      v14 = *(void **)(v12 + 88);
    else
      v14 = 0;
    v15 = v14;
    objc_msgSend(v11, "archivedDataWithRootObject:requiringSecureCoding:error:", v15, 1, 0);
    v66 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "model");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "mapIconStyleAttributes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = (void *)MEMORY[0x24BDD1618];
      objc_msgSend(v10, "model");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "mapIconStyleAttributes");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "archivedDataWithRootObject:requiringSecureCoding:error:", v20, 1, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v21 = 0;
    }

    objc_msgSend(v10, "model");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "mapItemMUID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      v24 = (void *)MEMORY[0x24BDD1618];
      objc_msgSend(v10, "model");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "mapItemMUID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "archivedDataWithRootObject:requiringSecureCoding:error:", v26, 1, 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v27 = 0;
    }
    v28 = v65;

    if (!sqlite3_prepare_v2(-[BCSPersistentStore openedDatabase](self, "openedDatabase"), (const char *)objc_msgSend(CFSTR("INSERT INTO link_items (full_hash_string, link_url_string, bundle_id_string, hero_image_url_string, icon_image_url_string, redirect_url_string, action, expiration_date, content_item_models, is_powered_by, map_icon_style_attributes, map_item_muid) VALUES (?,?,?,?,?,?,?,?,?,?, ?, ?)"), "UTF8String"), -1, &ppStmt, 0))
    {
      objc_msgSend(v65, "itemIdentifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v30 = objc_opt_isKindOfClass();

      if ((v30 & 1) != 0)
      {
        objc_msgSend(v65, "itemIdentifier");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = ppStmt;
        v64 = objc_retainAutorelease(v31);
        sqlite3_bind_text(v32, 1, (const char *)objc_msgSend(v64, "UTF8String"), -1, 0);
        v33 = ppStmt;
        objc_msgSend(v10, "model");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "linkURL");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "absoluteString");
        v36 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        sqlite3_bind_text(v33, 2, (const char *)objc_msgSend(v36, "UTF8String"), -1, 0);

        v37 = ppStmt;
        objc_msgSend(v10, "model");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "bundleID");
        v39 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        sqlite3_bind_text(v37, 3, (const char *)objc_msgSend(v39, "UTF8String"), -1, 0);

        v40 = ppStmt;
        objc_msgSend(v10, "model");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "heroImageURLString");
        v42 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        sqlite3_bind_text(v40, 4, (const char *)objc_msgSend(v42, "UTF8String"), -1, 0);

        v43 = ppStmt;
        objc_msgSend(v10, "model");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "iconImageURLString");
        v45 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        sqlite3_bind_text(v43, 5, (const char *)objc_msgSend(v45, "UTF8String"), -1, 0);

        v46 = ppStmt;
        objc_msgSend(v10, "model");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "redirectURL");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "absoluteString");
        v49 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        sqlite3_bind_text(v46, 6, (const char *)objc_msgSend(v49, "UTF8String"), -1, 0);

        sqlite3_bind_int(ppStmt, 7, objc_msgSend(v10, "action"));
        v50 = ppStmt;
        objc_msgSend(v10, "expirationDate");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "timeIntervalSince1970");
        sqlite3_bind_double(v50, 8, v52);

        v53 = ppStmt;
        v54 = objc_retainAutorelease(v66);
        sqlite3_bind_blob(v53, 9, (const void *)objc_msgSend(v54, "bytes"), objc_msgSend(v54, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
        v55 = ppStmt;
        objc_msgSend(v10, "model");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        sqlite3_bind_int(v55, 10, objc_msgSend(v56, "isPoweredBy"));

        v57 = ppStmt;
        v58 = objc_retainAutorelease(v21);
        sqlite3_bind_blob(v57, 11, (const void *)objc_msgSend(v58, "bytes"), objc_msgSend(v58, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
        v59 = ppStmt;
        v60 = objc_retainAutorelease(v27);
        sqlite3_bind_blob(v59, 12, (const void *)objc_msgSend(v60, "bytes"), objc_msgSend(v60, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
        v61 = sqlite3_step(ppStmt);
        sqlite3_finalize(ppStmt);
        if (v61 != 101)
        {
          ABSLogCommon();
          v62 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
          {
            v63 = sqlite3_errmsg(-[BCSPersistentStore openedDatabase](self, "openedDatabase"));
            *(_DWORD *)buf = 134218242;
            v70 = v61;
            v28 = v65;
            v71 = 2080;
            v72 = v63;
            _os_log_error_impl(&dword_20ACAD000, v62, OS_LOG_TYPE_ERROR, "Error while finalizing insert link item %lu %s", buf, 0x16u);
          }

        }
      }
    }
    -[BCSPersistentStore endBatch](self, "endBatch");

    -[BCSPersistentStore endBatch](self, "endBatch");
  }

}

- (void)deleteItemMatching:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  const char *v8;
  id v9;

  v9 = a3;
  v4 = objc_msgSend(v9, "type");
  if (self && v4 == 2)
  {
    v5 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v9, "itemIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("DELETE FROM link_items WHERE full_hash_string = \"%@\"), v6);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = (const char *)objc_msgSend(v7, "UTF8String");

    -[BCSLinkItemPersistentStore _executeDeleteSQLQuery:](self, v8);
  }

}

- (void)deleteItemsOfType:(int64_t)a3
{
  if (self)
  {
    if (a3 == 2)
      -[BCSLinkItemPersistentStore _executeDeleteSQLQuery:](self, (const char *)objc_msgSend(CFSTR("DELETE FROM link_items"), "UTF8String"));
  }
}

- (void)deleteExpiredItemsOfType:(int64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  const char *v8;

  if (a3 == 2)
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSince1970");
    objc_msgSend(v4, "stringWithFormat:", CFSTR("DELETE FROM link_items WHERE expiration_date <= \"%f\"), v6);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = (const char *)objc_msgSend(v7, "UTF8String");

    -[BCSLinkItemPersistentStore _executeDeleteSQLQuery:](self, v8);
  }
}

- (void)_executeDeleteSQLQuery:(void *)result
{
  void *v3;
  sqlite3_stmt *ppStmt;

  if (result)
  {
    v3 = result;
    objc_msgSend(result, "beginBatch");
    ppStmt = 0;
    if (!sqlite3_prepare_v2((sqlite3 *)objc_msgSend(v3, "openedDatabase"), a2, -1, &ppStmt, 0))
    {
      sqlite3_step(ppStmt);
      sqlite3_finalize(ppStmt);
    }
    return (void *)objc_msgSend(v3, "endBatch");
  }
  return result;
}

- (void)deleteLinkItemsWithBundleID:(id)a3
{
  id v4;
  const char *v5;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("DELETE FROM link_items WHERE bundle_id_string = \"%@\"), a3);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = (const char *)objc_msgSend(v4, "UTF8String");

  -[BCSLinkItemPersistentStore _executeDeleteSQLQuery:](self, v5);
}

unsigned __int8 *__60__BCSLinkItemPersistentStore__extractLinkItemFromStatement___block_invoke(uint64_t a1, int a2)
{
  unsigned __int8 *v2;

  v2 = (unsigned __int8 *)sqlite3_column_text(*(sqlite3_stmt **)(a1 + 32), a2);
  if (v2)
    v2 = (unsigned __int8 *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v2);
  return v2;
}

id __60__BCSLinkItemPersistentStore__extractLinkItemFromStatement___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id __60__BCSLinkItemPersistentStore__extractLinkItemFromStatement___block_invoke_3(uint64_t a1, void *a2, int a3)
{
  id v5;
  const void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = sqlite3_column_blob(*(sqlite3_stmt **)(a1 + 32), a3);
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v6, sqlite3_column_bytes(*(sqlite3_stmt **)(a1 + 32), a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && (v9 = objc_retainAutorelease(v7), objc_msgSend(v9, "bytes")))
  {
    v10 = (void *)MEMORY[0x24BDD1620];
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    objc_msgSend(v10, "unarchivedObjectOfClasses:fromData:error:", v11, v9, &v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v16;

    if (v13)
    {
      ABSLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v18 = v5;
        v19 = 2112;
        v20 = v13;
        _os_log_error_impl(&dword_20ACAD000, v14, OS_LOG_TYPE_ERROR, "error while unarchiving items of classes %@ - error: %@", buf, 0x16u);
      }

    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

id __60__BCSLinkItemPersistentStore__extractLinkItemFromStatement___block_invoke_26(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  objc_class *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  objc_msgSend(v5, "arrayByAddingObject:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, void *, uint64_t))(v4 + 16))(v4, v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    ABSLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412290;
      v14 = v12;
      _os_log_error_impl(&dword_20ACAD000, v9, OS_LOG_TYPE_ERROR, "error while unarchiving object - expected NSArray type but got %@", (uint8_t *)&v13, 0xCu);

    }
    v8 = 0;
  }
  else
  {
    v8 = v7;
  }

  return v8;
}

id __60__BCSLinkItemPersistentStore__extractLinkItemFromStatement___block_invoke_29(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  objc_class *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  objc_msgSend(v5, "arrayByAddingObject:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, void *, uint64_t))(v4 + 16))(v4, v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    ABSLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412290;
      v14 = v12;
      _os_log_error_impl(&dword_20ACAD000, v9, OS_LOG_TYPE_ERROR, "error while unarchiving object - expected NSDictionary type but got %@", (uint8_t *)&v13, 0xCu);

    }
    v8 = 0;
  }
  else
  {
    v8 = v7;
  }

  return v8;
}

id __60__BCSLinkItemPersistentStore__extractLinkItemFromStatement___block_invoke_32(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  objc_class *v9;
  void *v10;
  int v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v13[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, uint64_t))(v3 + 16))(v3, v4, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    ABSLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v10;
      _os_log_error_impl(&dword_20ACAD000, v7, OS_LOG_TYPE_ERROR, "error while unarchiving object - expected NSNumber type but got %@", (uint8_t *)&v11, 0xCu);

    }
    v6 = 0;
  }
  else
  {
    v6 = v5;
  }

  return v6;
}

uint64_t __60__BCSLinkItemPersistentStore__extractLinkItemFromStatement___block_invoke_35(uint64_t a1, int a2)
{
  return objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", sqlite3_column_double(*(sqlite3_stmt **)(a1 + 32), a2));
}

uint64_t __60__BCSLinkItemPersistentStore__extractLinkItemFromStatement___block_invoke_2_38(uint64_t a1, int a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", sqlite3_column_int(*(sqlite3_stmt **)(a1 + 32), a2));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

@end
