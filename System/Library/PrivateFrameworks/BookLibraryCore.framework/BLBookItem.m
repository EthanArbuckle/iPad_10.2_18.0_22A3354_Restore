@implementation BLBookItem

- (BLBookItem)initWithEntry:(id)a3 basePath:(id)a4
{
  id v6;
  id v7;
  BLBookItem *v8;
  void *v9;
  void *v10;
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v29;

  v6 = a3;
  v7 = a4;
  v29.receiver = self;
  v29.super_class = (Class)BLBookItem;
  v8 = -[BLBookItem init](&v29, sel_init);
  if (v8)
  {
    +[IMLibraryPlist folderNameFromPlistEntry:](IMLibraryPlist, "folderNameFromPlistEntry:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingPathComponent:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    +[IMLibraryPlist temporaryItemIdentifierFromPlistEntry:](IMLibraryPlist, "temporaryItemIdentifierFromPlistEntry:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLBookItem setTemporaryIdentifier:](v8, "setTemporaryIdentifier:", v11);

    +[IMLibraryPlist uniqueIdFromPlistEntry:](IMLibraryPlist, "uniqueIdFromPlistEntry:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLBookItem setLegacyUniqueIdentifier:](v8, "setLegacyUniqueIdentifier:", v12);

    +[IMLibraryPlist storeIdFromPlistEntry:](IMLibraryPlist, "storeIdFromPlistEntry:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLBookItem setStoreIdentifier:](v8, "setStoreIdentifier:", v13);

    +[IMLibraryPlist persistentIDFromPlistEntry:](IMLibraryPlist, "persistentIDFromPlistEntry:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLBookItem setPersistentIdentifier:](v8, "setPersistentIdentifier:", v14);

    +[IMLibraryPlist bookEpubIdFromPlistEntry:](IMLibraryPlist, "bookEpubIdFromPlistEntry:", v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLBookItem setPublisherIdentifier:](v8, "setPublisherIdentifier:", v15);

    +[IMLibraryPlist titleFromPlistEntry:](IMLibraryPlist, "titleFromPlistEntry:", v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLBookItem setTitle:](v8, "setTitle:", v16);

    +[IMLibraryPlist authorFromPlistEntry:](IMLibraryPlist, "authorFromPlistEntry:", v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLBookItem setAuthor:](v8, "setAuthor:", v17);

    +[IMLibraryPlist isItunesUFromPlistEntry:](IMLibraryPlist, "isItunesUFromPlistEntry:", v6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLBookItem setITunesU:](v8, "setITunesU:", objc_msgSend(v18, "BOOLValue"));

    +[IMLibraryPlist feedURLFromPlistEntry:](IMLibraryPlist, "feedURLFromPlistEntry:", v6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLBookItem setFeedURL:](v8, "setFeedURL:", v19);

    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v10);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLBookItem setFileURL:](v8, "setFileURL:", v20);

    objc_msgSend(v10, "pathExtension");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLBookItem setType:](v8, "setType:", BLBookTypeFromPathExtension(v21));

    +[IMLibraryPlist isSampleFromPlistEntry:](IMLibraryPlist, "isSampleFromPlistEntry:", v6);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLBookItem setSample:](v8, "setSample:", objc_msgSend(v22, "BOOLValue"));

    +[IMLibraryPlist permlinkFromPlistEntry:](IMLibraryPlist, "permlinkFromPlistEntry:", v6);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLBookItem setPermlink:](v8, "setPermlink:", v23);

    +[IMLibraryPlist publicationVersionFromPlistEntry:](IMLibraryPlist, "publicationVersionFromPlistEntry:", v6);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLBookItem setPublicationVersion:](v8, "setPublicationVersion:", v24);

    +[IMLibraryPlist albumFromPlistEntry:](IMLibraryPlist, "albumFromPlistEntry:", v6);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLBookItem setAlbum:](v8, "setAlbum:", v25);

    +[IMLibraryPlist folderNameFromPlistEntry:](IMLibraryPlist, "folderNameFromPlistEntry:", v6);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLBookItem setFolderName:](v8, "setFolderName:", v26);

    +[IMLibraryPlist accessDateFromPlistEntry:](IMLibraryPlist, "accessDateFromPlistEntry:", v6);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLBookItem setLastUserAccessDate:](v8, "setLastUserAccessDate:", v27);

    -[BLBookItem setEntry:](v8, "setEntry:", v6);
  }

  return v8;
}

- (BLBookItem)initWithPeristentIdentifier:(id)a3 permlink:(id)a4 title:(id)a5
{
  id v8;
  id v9;
  id v10;
  BLBookItem *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)BLBookItem;
  v11 = -[BLBookItem init](&v15, sel_init);
  if (v11)
  {
    objc_msgSend(v9, "identifierFromPermlink");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLBookItem setIdentifier:](v11, "setIdentifier:", v12);

    -[BLBookItem setTemporaryIdentifier:](v11, "setTemporaryIdentifier:", v8);
    -[BLBookItem setTitle:](v11, "setTitle:", v10);
    -[BLBookItem setPermlink:](v11, "setPermlink:", v9);
    -[BLBookItem setITunesU:](v11, "setITunesU:", 1);
    objc_msgSend(v9, "pathExtension");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLBookItem setType:](v11, "setType:", BLBookTypeFromPathExtension(v13));

  }
  return v11;
}

- (BLBookItem)initWithEduCloudData:(id)a3 path:(id)a4
{
  id v6;
  id v7;
  BLBookItem *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  objc_super v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)BLBookItem;
  v8 = -[BLBookItem init](&v21, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("identifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLBookItem setIdentifier:](v8, "setIdentifier:", v9);

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("temporaryIdentifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLBookItem setTemporaryIdentifier:](v8, "setTemporaryIdentifier:", v10);

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("title"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLBookItem setTitle:](v8, "setTitle:", v11);

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("author"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLBookItem setAuthor:](v8, "setAuthor:", v12);

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("permlink"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("permlink"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }

    if (objc_msgSend(v14, "length"))
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v14);
      v15 = objc_claimAutoreleasedReturnValue();
      -[BLBookItem setPermlink:](v8, "setPermlink:", v15);
    }
    else
    {
      BLDefaultLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v7;
        _os_log_impl(&dword_212C78000, v15, OS_LOG_TYPE_INFO, "WARNING: Restoring item from cloud item {%@} that is missing a permlink!", buf, 0xCu);
      }
    }

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("type"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLBookItem setType:](v8, "setType:", BLBookTypeFromPathExtension(v16));

    -[BLBookItem setITunesU:](v8, "setITunesU:", 1);
    if (objc_msgSend(v7, "length"))
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v7);
      v17 = objc_claimAutoreleasedReturnValue();
      -[BLBookItem setFileURL:](v8, "setFileURL:", v17);
    }
    else
    {
      BLDefaultLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_212C78000, v17, OS_LOG_TYPE_INFO, "WARNING: Attempting to restore item from cloud item that is missing a path!", buf, 2u);
      }
    }

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("assetID"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLBookItem setItunesuAssetID:](v8, "setItunesuAssetID:", v18);

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("coverImagePath"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLBookItem setCoverImagePath:](v8, "setCoverImagePath:", v19);

  }
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v4 = (void *)objc_opt_new();
  -[BLBookItem identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentifier:", v5);

  -[BLBookItem temporaryIdentifier](self, "temporaryIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTemporaryIdentifier:", v6);

  -[BLBookItem legacyUniqueIdentifier](self, "legacyUniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLegacyUniqueIdentifier:", v7);

  -[BLBookItem storeIdentifier](self, "storeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStoreIdentifier:", v8);

  -[BLBookItem persistentIdentifier](self, "persistentIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPersistentIdentifier:", v9);

  -[BLBookItem publisherIdentifier](self, "publisherIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPublisherIdentifier:", v10);

  -[BLBookItem title](self, "title");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v11);

  -[BLBookItem author](self, "author");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAuthor:", v12);

  -[BLBookItem feedURL](self, "feedURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFeedURL:", v13);

  -[BLBookItem fileURL](self, "fileURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFileURL:", v14);

  -[BLBookItem permlink](self, "permlink");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPermlink:", v15);

  objc_msgSend(v4, "setITunesU:", -[BLBookItem iTunesU](self, "iTunesU"));
  objc_msgSend(v4, "setSample:", -[BLBookItem isSample](self, "isSample"));
  objc_msgSend(v4, "setType:", -[BLBookItem type](self, "type"));
  -[BLBookItem publicationVersion](self, "publicationVersion");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPublicationVersion:", v16);

  -[BLBookItem album](self, "album");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlbum:", v17);

  -[BLBookItem folderName](self, "folderName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFolderName:", v18);

  objc_msgSend(v4, "setPurgePriority:", -[BLBookItem purgePriority](self, "purgePriority"));
  -[BLBookItem lastUserAccessDate](self, "lastUserAccessDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLastUserAccessDate:", v19);

  -[BLBookItem itunesuAssetID](self, "itunesuAssetID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setItunesuAssetID:", v20);

  -[BLBookItem coverImagePath](self, "coverImagePath");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCoverImagePath:", v21);

  -[BLBookItem entry](self, "entry");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEntry:", v22);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v4 = a3;
  -[BLBookItem identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[BLBookItem temporaryIdentifier](self, "temporaryIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("temporaryIdentifier"));

  -[BLBookItem legacyUniqueIdentifier](self, "legacyUniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("legacyUniqueIdentifier"));

  -[BLBookItem storeIdentifier](self, "storeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("storeIdentifier"));

  -[BLBookItem persistentIdentifier](self, "persistentIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("persistentIdentifier"));

  -[BLBookItem publisherIdentifier](self, "publisherIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("publisherIdentifier"));

  -[BLBookItem title](self, "title");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("title"));

  -[BLBookItem author](self, "author");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("author"));

  -[BLBookItem feedURL](self, "feedURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("feedURL"));

  -[BLBookItem fileURL](self, "fileURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("fileURL"));

  -[BLBookItem permlink](self, "permlink");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("permlink"));

  objc_msgSend(v4, "encodeBool:forKey:", -[BLBookItem iTunesU](self, "iTunesU"), CFSTR("iTunesU"));
  objc_msgSend(v4, "encodeBool:forKey:", -[BLBookItem isSample](self, "isSample"), CFSTR("sample"));
  objc_msgSend(v4, "encodeInt:forKey:", -[BLBookItem type](self, "type"), CFSTR("type"));
  -[BLBookItem publicationVersion](self, "publicationVersion");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("publicationVersion"));

  -[BLBookItem album](self, "album");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v17, CFSTR("album"));

  -[BLBookItem folderName](self, "folderName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v18, CFSTR("folderName"));

  objc_msgSend(v4, "encodeInt64:forKey:", -[BLBookItem purgePriority](self, "purgePriority"), CFSTR("purgePriority"));
  -[BLBookItem lastUserAccessDate](self, "lastUserAccessDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v19, CFSTR("lastUserAccessDate"));

  -[BLBookItem itunesuAssetID](self, "itunesuAssetID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v20, CFSTR("assetID"));

  -[BLBookItem coverImagePath](self, "coverImagePath");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v21, CFSTR("coverImagePath"));

}

- (BLBookItem)initWithCoder:(id)a3
{
  id v4;
  BLBookItem *v5;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)BLBookItem;
  v5 = -[BLBookItem init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLBookItem setIdentifier:](v5, "setIdentifier:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("temporaryIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLBookItem setTemporaryIdentifier:](v5, "setTemporaryIdentifier:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("legacyUniqueIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLBookItem setLegacyUniqueIdentifier:](v5, "setLegacyUniqueIdentifier:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("storeIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLBookItem setStoreIdentifier:](v5, "setStoreIdentifier:", v9);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("persistentIdentifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLBookItem setPersistentIdentifier:](v5, "setPersistentIdentifier:", v10);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("publisherIdentifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLBookItem setPublisherIdentifier:](v5, "setPublisherIdentifier:", v11);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLBookItem setTitle:](v5, "setTitle:", v12);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("author"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLBookItem setAuthor:](v5, "setAuthor:", v13);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("feedURL"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLBookItem setFeedURL:](v5, "setFeedURL:", v14);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fileURL"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLBookItem setFileURL:](v5, "setFileURL:", v15);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("permlink"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLBookItem setPermlink:](v5, "setPermlink:", v16);

    -[BLBookItem setITunesU:](v5, "setITunesU:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("iTunesU")));
    -[BLBookItem setSample:](v5, "setSample:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("sample")));
    -[BLBookItem setType:](v5, "setType:", (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("type")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("publicationVersion"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLBookItem setPublicationVersion:](v5, "setPublicationVersion:", v17);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("album"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLBookItem setAlbum:](v5, "setAlbum:", v18);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("folderName"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLBookItem setFolderName:](v5, "setFolderName:", v19);

    -[BLBookItem setPurgePriority:](v5, "setPurgePriority:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("purgePriority")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastUserAccessDate"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLBookItem setLastUserAccessDate:](v5, "setLastUserAccessDate:", v20);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assetID"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLBookItem setItunesuAssetID:](v5, "setItunesuAssetID:", v21);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("coverImagePath"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLBookItem setCoverImagePath:](v5, "setCoverImagePath:", v22);

  }
  return v5;
}

- (NSString)path
{
  void *v2;
  void *v3;

  -[BLBookItem fileURL](self, "fileURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)identifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *identifier;

  if (!self->_identifier)
  {
    -[BLBookItem entry](self, "entry");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[BLBookItem entry](self, "entry");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[BLBookItem fileURL](self, "fileURL");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "path");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[IMLibraryPlist assetIDFromPlistEntry:forAssetAtPath:](IMLibraryPlist, "assetIDFromPlistEntry:forAssetAtPath:", v4, v6);
      v7 = (NSString *)objc_claimAutoreleasedReturnValue();
      identifier = self->_identifier;
      self->_identifier = v7;

    }
  }
  return self->_identifier;
}

- (NSString)mimeType
{
  unint64_t v2;

  v2 = -[BLBookItem type](self, "type");
  if (v2 > 2)
    return 0;
  else
    return &off_24CE8C218[v2]->isa;
}

- (id)_cloudCoverImageData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  _QWORD v13[5];
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_212CB62F0;
  v19 = sub_212CB6300;
  v20 = 0;
  -[BLBookItem coverImagePath](self, "coverImagePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDBCF48];
    -[BLBookItem coverImagePath](self, "coverImagePath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLBookItem fileURL](self, "fileURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fileURLWithPath:relativeToURL:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)objc_opt_new();
    v14 = 0;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = sub_212CB6308;
    v13[3] = &unk_24CE8C1A8;
    v13[4] = &v15;
    objc_msgSend(v8, "coordinateReadingItemAtURL:options:error:byAccessor:", v7, 0, &v14, v13);
    v9 = v14;

    if (v9)
    {
      BLDefaultLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v9;
        _os_log_impl(&dword_212C78000, v10, OS_LOG_TYPE_ERROR, "Encountered error retrieving cover image from promised item. Error:  %@", buf, 0xCu);
      }

    }
  }
  v11 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v11;
}

- (void)_setCloudCoverImageData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  unsigned int (**v13)(_QWORD, _QWORD);
  void *v14;
  int v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  NSObject *v27;
  _QWORD v28[5];
  id obj;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  unsigned int (**v39)(_QWORD, _QWORD);
  uint64_t *v40;
  id v41;
  _QWORD v42[4];
  id v43;
  id v44;
  uint8_t buf[4];
  id v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[BLBookItem permlink](self, "permlink");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifierFromPermlink");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathExtension:", CFSTR("coverData"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)MEMORY[0x24BDBCF48];
    -[BLBookItem fileURL](self, "fileURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fileURLWithPath:relativeToURL:", v7, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  -[BLBookItem setCoverImagePath:](self, "setCoverImagePath:", v7);
  if (v4)
  {
    v11 = MEMORY[0x24BDAC760];
    v42[0] = MEMORY[0x24BDAC760];
    v42[1] = 3221225472;
    v42[2] = sub_212CB6810;
    v42[3] = &unk_24CE8C1D0;
    v43 = v4;
    v12 = v10;
    v44 = v12;
    v13 = (unsigned int (**)(_QWORD, _QWORD))MEMORY[0x2199A44E0](v42);
    v30 = 0;
    v31 = &v30;
    v32 = 0x2020000000;
    LOBYTE(v33) = 0;
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isUbiquitousItemAtURL:", v12);

    if (v15)
    {
      v16 = (void *)objc_opt_new();
      v37[0] = v11;
      v37[1] = 3221225472;
      v37[2] = sub_212CB6854;
      v37[3] = &unk_24CE8C1F8;
      v40 = &v30;
      v41 = 0;
      v39 = v13;
      v38 = v12;
      objc_msgSend(v16, "coordinateWritingItemAtURL:options:error:byAccessor:", v38, 0, &v41, v37);
      v17 = v41;

      v18 = v39;
    }
    else
    {
      NSTemporaryDirectory();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringByAppendingPathComponent:", v7);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "removeItemAtPath:error:", v18, 0);
      if (((unsigned int (**)(_QWORD, void *))v13)[2](v13, v18))
      {
        objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v18);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = 0;
        v26 = objc_msgSend(v24, "setUbiquitous:itemAtURL:destinationURL:error:", 1, v25, v12, &v36);
        v17 = v36;
        *((_BYTE *)v31 + 24) = v26;

      }
      else
      {
        v17 = 0;
      }

    }
    if (!*((_BYTE *)v31 + 24))
    {
      BLDefaultLog();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v46 = v12;
        v47 = 2112;
        v48 = v17;
        _os_log_impl(&dword_212C78000, v27, OS_LOG_TYPE_ERROR, "Failed to coordinate write of thumbnail resource value for %@. Error:  %@", buf, 0x16u);
      }

    }
    _Block_object_dispose(&v30, 8);

  }
  else
  {
    v30 = 0;
    v31 = &v30;
    v32 = 0x3032000000;
    v33 = sub_212CB62F0;
    v34 = sub_212CB6300;
    v35 = 0;
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1570]), "initWithFilePresenter:", 0);
    v20 = (id *)(v31 + 5);
    obj = (id)v31[5];
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = sub_212CB68A8;
    v28[3] = &unk_24CE8C1A8;
    v28[4] = &v30;
    objc_msgSend(v19, "coordinateWritingItemAtURL:options:error:byAccessor:", v10, 1, &obj, v28);
    objc_storeStrong(v20, obj);
    if (v31[5])
    {
      BLDefaultLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v10, "path");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v46 = v22;
        _os_log_impl(&dword_212C78000, v21, OS_LOG_TYPE_ERROR, "Error encountered removing cover image at %@", buf, 0xCu);

      }
    }

    _Block_object_dispose(&v30, 8);
  }

}

- (void)_setFileURL:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "isFileURL"))
  {
    -[BLBookItem setFileURL:](self, "setFileURL:", v4);
  }
  else
  {
    BLDefaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_212C78000, v5, OS_LOG_TYPE_ERROR, "Invalid fileURL in setFileURL:%@", (uint8_t *)&v6, 0xCu);
    }

  }
}

- (id)_cloudDictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  const __CFString *v11;
  void *v12;
  void *v13;

  v3 = (void *)objc_opt_new();
  -[BLBookItem identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("identifier"));

  -[BLBookItem temporaryIdentifier](self, "temporaryIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("temporaryIdentifier"));

  -[BLBookItem title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("title"));

  -[BLBookItem author](self, "author");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("author"));

  -[BLBookItem permlink](self, "permlink");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "absoluteString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("permlink"));

  v10 = -[BLBookItem type](self, "type");
  if (v10 > 2)
    v11 = &stru_24CE8D258;
  else
    v11 = off_24CE8C230[v10];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("type"));
  -[BLBookItem itunesuAssetID](self, "itunesuAssetID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("assetID"));

  -[BLBookItem coverImagePath](self, "coverImagePath");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("coverImagePath"));

  return v3;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  unint64_t v60;
  const __CFString *v61;
  void *v62;
  const __CFString *v63;
  void *v64;
  const __CFString *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  void *v79;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@(%p)"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[BLBookItem identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingFormat:", CFSTR(" identifier='%@'"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[BLBookItem temporaryIdentifier](self, "temporaryIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  if (v10)
  {
    -[BLBookItem temporaryIdentifier](self, "temporaryIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingFormat:", CFSTR(" temporaryIdentifier='%@'"), v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v12;
  }
  -[BLBookItem legacyUniqueIdentifier](self, "legacyUniqueIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "length");

  if (v14)
  {
    -[BLBookItem legacyUniqueIdentifier](self, "legacyUniqueIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingFormat:", CFSTR(" legacyUniqueIdentifier='%@'"), v15);
    v16 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v16;
  }
  -[BLBookItem storeIdentifier](self, "storeIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "length");

  if (v18)
  {
    -[BLBookItem storeIdentifier](self, "storeIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingFormat:", CFSTR(" storeIdentifier='%@'"), v19);
    v20 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v20;
  }
  -[BLBookItem persistentIdentifier](self, "persistentIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "length");

  if (v22)
  {
    -[BLBookItem persistentIdentifier](self, "persistentIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingFormat:", CFSTR(" persistentIdentifier='%@'"), v23);
    v24 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v24;
  }
  -[BLBookItem publisherIdentifier](self, "publisherIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "length");

  if (v26)
  {
    -[BLBookItem publisherIdentifier](self, "publisherIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingFormat:", CFSTR(" publisherIdentifier='%@'"), v27);
    v28 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v28;
  }
  -[BLBookItem title](self, "title");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "length");

  if (v30)
  {
    -[BLBookItem title](self, "title");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingFormat:", CFSTR(" title='%@'"), v31);
    v32 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v32;
  }
  -[BLBookItem author](self, "author");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "length");

  if (v34)
  {
    -[BLBookItem author](self, "author");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingFormat:", CFSTR(" author='%@'"), v35);
    v36 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v36;
  }
  -[BLBookItem feedURL](self, "feedURL");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
  {
    -[BLBookItem feedURL](self, "feedURL");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingFormat:", CFSTR(" feedURL='%@'"), v38);
    v39 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v39;
  }
  -[BLBookItem publicationVersion](self, "publicationVersion");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "length");

  if (v41)
  {
    -[BLBookItem publicationVersion](self, "publicationVersion");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingFormat:", CFSTR(" publicationVersion='%@'"), v42);
    v43 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v43;
  }
  -[BLBookItem album](self, "album");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "length");

  if (v45)
  {
    -[BLBookItem album](self, "album");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingFormat:", CFSTR(" album='%@'"), v46);
    v47 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v47;
  }
  -[BLBookItem folderName](self, "folderName");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v48, "length");

  if (v49)
  {
    -[BLBookItem folderName](self, "folderName");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingFormat:", CFSTR(" folderName='%@'"), v50);
    v51 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v51;
  }
  -[BLBookItem mimeType](self, "mimeType");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v52, "length");

  if (v53)
  {
    -[BLBookItem mimeType](self, "mimeType");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingFormat:", CFSTR(" mimeType='%@'"), v54);
    v55 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v55;
  }
  -[BLBookItem itunesuAssetID](self, "itunesuAssetID");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend(v56, "length");

  if (v57)
  {
    -[BLBookItem itunesuAssetID](self, "itunesuAssetID");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingFormat:", CFSTR(" itunesuAssetID='%@'"), v58);
    v59 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v59;
  }
  v60 = -[BLBookItem type](self, "type");
  if (v60 > 2)
    v61 = &stru_24CE8D258;
  else
    v61 = off_24CE8C230[v60];
  objc_msgSend(v8, "stringByAppendingFormat:", CFSTR(" type='%@'"), v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[BLBookItem isSample](self, "isSample"))
    v63 = CFSTR("YES");
  else
    v63 = CFSTR("NO");
  objc_msgSend(v62, "stringByAppendingFormat:", CFSTR(" isSample='%@'"), v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[BLBookItem iTunesU](self, "iTunesU"))
    v65 = CFSTR("YES");
  else
    v65 = CFSTR("NO");
  objc_msgSend(v64, "stringByAppendingFormat:", CFSTR(" iTunesU='%@'"), v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  -[BLBookItem permlink](self, "permlink");
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  if (v67)
  {
    -[BLBookItem permlink](self, "permlink");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "stringByAppendingFormat:", CFSTR(" permlink='%@'"), v68);
    v69 = objc_claimAutoreleasedReturnValue();

    v66 = (void *)v69;
  }
  -[BLBookItem fileURL](self, "fileURL");
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  if (v70)
  {
    -[BLBookItem fileURL](self, "fileURL");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "path");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "stringByAppendingFormat:", CFSTR(" path='%@'"), v72);
    v73 = objc_claimAutoreleasedReturnValue();

    v66 = (void *)v73;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[BLBookItem purgePriority](self, "purgePriority"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "stringByAppendingFormat:", CFSTR(" purgePriority='%@'"), v74);
  v75 = (void *)objc_claimAutoreleasedReturnValue();

  -[BLBookItem lastUserAccessDate](self, "lastUserAccessDate");
  v76 = (void *)objc_claimAutoreleasedReturnValue();

  if (v76)
  {
    -[BLBookItem lastUserAccessDate](self, "lastUserAccessDate");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "stringByAppendingFormat:", CFSTR(" accessDate='%@'"), v77);
    v78 = objc_claimAutoreleasedReturnValue();

    v75 = (void *)v78;
  }
  objc_msgSend(v75, "stringByAppendingString:", CFSTR(">"));
  v79 = (void *)objc_claimAutoreleasedReturnValue();

  return v79;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)temporaryIdentifier
{
  return self->_temporaryIdentifier;
}

- (void)setTemporaryIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)legacyUniqueIdentifier
{
  return self->_legacyUniqueIdentifier;
}

- (void)setLegacyUniqueIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)storeIdentifier
{
  return self->_storeIdentifier;
}

- (void)setStoreIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)persistentIdentifier
{
  return self->_persistentIdentifier;
}

- (void)setPersistentIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)publisherIdentifier
{
  return self->_publisherIdentifier;
}

- (void)setPublisherIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)author
{
  return self->_author;
}

- (void)setAuthor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)feedURL
{
  return self->_feedURL;
}

- (void)setFeedURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setFileURL:(id)a3
{
  objc_storeStrong((id *)&self->_fileURL, a3);
}

- (NSURL)permlink
{
  return self->_permlink;
}

- (void)setPermlink:(id)a3
{
  objc_storeStrong((id *)&self->_permlink, a3);
}

- (BOOL)isSample
{
  return self->_sample;
}

- (void)setSample:(BOOL)a3
{
  self->_sample = a3;
}

- (BOOL)iTunesU
{
  return self->_iTunesU;
}

- (void)setITunesU:(BOOL)a3
{
  self->_iTunesU = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSString)publicationVersion
{
  return self->_publicationVersion;
}

- (void)setPublicationVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)album
{
  return self->_album;
}

- (void)setAlbum:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)folderName
{
  return self->_folderName;
}

- (void)setFolderName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSDictionary)entry
{
  return self->_entry;
}

- (void)setEntry:(id)a3
{
  objc_storeStrong((id *)&self->_entry, a3);
}

- (int64_t)purgePriority
{
  return self->_purgePriority;
}

- (void)setPurgePriority:(int64_t)a3
{
  self->_purgePriority = a3;
}

- (NSDate)lastUserAccessDate
{
  return self->_lastUserAccessDate;
}

- (void)setLastUserAccessDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastUserAccessDate, a3);
}

- (NSString)itunesuAssetID
{
  return self->_itunesuAssetID;
}

- (void)setItunesuAssetID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSString)coverImagePath
{
  return self->_coverImagePath;
}

- (void)setCoverImagePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coverImagePath, 0);
  objc_storeStrong((id *)&self->_itunesuAssetID, 0);
  objc_storeStrong((id *)&self->_lastUserAccessDate, 0);
  objc_storeStrong((id *)&self->_entry, 0);
  objc_storeStrong((id *)&self->_folderName, 0);
  objc_storeStrong((id *)&self->_album, 0);
  objc_storeStrong((id *)&self->_publicationVersion, 0);
  objc_storeStrong((id *)&self->_permlink, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_feedURL, 0);
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_publisherIdentifier, 0);
  objc_storeStrong((id *)&self->_persistentIdentifier, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
  objc_storeStrong((id *)&self->_legacyUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_temporaryIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
