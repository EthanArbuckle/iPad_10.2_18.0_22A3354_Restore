@implementation MDMBook

- (MDMBook)init
{
  return -[MDMBook initWithManifestDictionary:](self, "initWithManifestDictionary:", 0);
}

- (MDMBook)initWithManifestDictionary:(id)a3
{
  id v4;
  MDMBook *v5;
  uint64_t v6;
  NSString *author;
  uint64_t v8;
  NSString *title;
  uint64_t v10;
  NSString *fullPath;
  uint64_t v12;
  NSString *version;
  uint64_t v14;
  NSString *persistentID;
  uint64_t v16;
  NSNumber *iTunesStoreID;
  uint64_t v18;
  NSString *buyParams;
  uint64_t v20;
  NSString *state;
  uint64_t v22;
  NSString *kind;
  uint64_t v24;
  NSNumber *downloadIdentifier;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)MDMBook;
  v5 = -[MDMBook init](&v27, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Artist"));
    v6 = objc_claimAutoreleasedReturnValue();
    author = v5->_author;
    v5->_author = (NSString *)v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Title"));
    v8 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v8;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FullPath"));
    v10 = objc_claimAutoreleasedReturnValue();
    fullPath = v5->_fullPath;
    v5->_fullPath = (NSString *)v10;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Version"));
    v12 = objc_claimAutoreleasedReturnValue();
    version = v5->_version;
    v5->_version = (NSString *)v12;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PersistentID"));
    v14 = objc_claimAutoreleasedReturnValue();
    persistentID = v5->_persistentID;
    v5->_persistentID = (NSString *)v14;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("iTunesStoreID"));
    v16 = objc_claimAutoreleasedReturnValue();
    iTunesStoreID = v5->_iTunesStoreID;
    v5->_iTunesStoreID = (NSNumber *)v16;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("buyParams"));
    v18 = objc_claimAutoreleasedReturnValue();
    buyParams = v5->_buyParams;
    v5->_buyParams = (NSString *)v18;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("State"));
    v20 = objc_claimAutoreleasedReturnValue();
    state = v5->_state;
    v5->_state = (NSString *)v20;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Kind"));
    v22 = objc_claimAutoreleasedReturnValue();
    kind = v5->_kind;
    v5->_kind = (NSString *)v22;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DownloadIdentifier"));
    v24 = objc_claimAutoreleasedReturnValue();
    downloadIdentifier = v5->_downloadIdentifier;
    v5->_downloadIdentifier = (NSNumber *)v24;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MDMBook *v4;
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

  v4 = objc_alloc_init(MDMBook);
  -[MDMBook author](self, "author");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MDMBook setAuthor:](v4, "setAuthor:", v5);

  -[MDMBook title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MDMBook setTitle:](v4, "setTitle:", v6);

  -[MDMBook fullPath](self, "fullPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MDMBook setFullPath:](v4, "setFullPath:", v7);

  -[MDMBook version](self, "version");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MDMBook setVersion:](v4, "setVersion:", v8);

  -[MDMBook persistentID](self, "persistentID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MDMBook setPersistentID:](v4, "setPersistentID:", v9);

  -[MDMBook iTunesStoreID](self, "iTunesStoreID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MDMBook setITunesStoreID:](v4, "setITunesStoreID:", v10);

  -[MDMBook buyParams](self, "buyParams");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MDMBook setBuyParams:](v4, "setBuyParams:", v11);

  -[MDMBook state](self, "state");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MDMBook setState:](v4, "setState:", v12);

  -[MDMBook kind](self, "kind");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MDMBook setKind:](v4, "setKind:", v13);

  -[MDMBook downloadIdentifier](self, "downloadIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MDMBook setDownloadIdentifier:](v4, "setDownloadIdentifier:", v14);

  return v4;
}

- (id)manifestDictionary
{
  void *v3;
  void *v4;
  NSString *author;
  NSString *title;
  NSString *fullPath;
  void *v8;
  NSString *version;
  NSString *persistentID;
  NSNumber *iTunesStoreID;
  NSString *buyParams;
  NSString *state;
  NSString *kind;
  NSNumber *downloadIdentifier;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  author = self->_author;
  if (author)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", author, CFSTR("Artist"));
  title = self->_title;
  if (title)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", title, CFSTR("Title"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_title, CFSTR("Name"));
  }
  fullPath = self->_fullPath;
  if (fullPath)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", fullPath, CFSTR("FullPath"));
    -[NSString lastPathComponent](self->_fullPath, "lastPathComponent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("Path"));

  }
  version = self->_version;
  if (version)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", version, CFSTR("Version"));
  persistentID = self->_persistentID;
  if (persistentID)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", persistentID, CFSTR("PersistentID"));
  iTunesStoreID = self->_iTunesStoreID;
  if (iTunesStoreID)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", iTunesStoreID, CFSTR("iTunesStoreID"));
  buyParams = self->_buyParams;
  if (buyParams)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", buyParams, CFSTR("buyParams"));
  state = self->_state;
  if (state)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", state, CFSTR("State"));
  kind = self->_kind;
  if (kind)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", kind, CFSTR("Kind"));
  downloadIdentifier = self->_downloadIdentifier;
  if (downloadIdentifier)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", downloadIdentifier, CFSTR("DownloadIdentifier"));
  return v4;
}

- (id)friendlyName
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v8;
  void *v9;
  void *v10;

  -[MDMBook title](self, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MDMBook title](self, "title");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[MDMBook persistentID](self, "persistentID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[MDMBook persistentID](self, "persistentID");
      v4 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[MDMBook iTunesStoreID](self, "iTunesStoreID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        DMCUSEnglishNumberFormatter();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[MDMBook iTunesStoreID](self, "iTunesStoreID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringFromNumber:", v10);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        return v6;
      }
      -[MDMBook description](self, "description");
      v4 = objc_claimAutoreleasedReturnValue();
    }
  }
  v6 = (void *)v4;
  return v6;
}

- (void)updateBookAttributesByCopyingFromBook:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "author");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MDMBook setAuthor:](self, "setAuthor:", v5);

  objc_msgSend(v4, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MDMBook setTitle:](self, "setTitle:", v6);

  objc_msgSend(v4, "version");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[MDMBook setVersion:](self, "setVersion:", v7);
}

- (id)description
{
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v24;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v24.receiver = self;
  v24.super_class = (Class)MDMBook;
  -[MDMBook description](&v24, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[MDMBook persistentID](self, "persistentID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MDMBook persistentID](self, "persistentID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("  PersistentID: %@\n"), v7);

  }
  -[MDMBook iTunesStoreID](self, "iTunesStoreID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[MDMBook iTunesStoreID](self, "iTunesStoreID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("  iTunes ID: %@\n"), v9);

  }
  -[MDMBook buyParams](self, "buyParams");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    objc_msgSend(v5, "appendString:", CFSTR("  Buy Params: Present\n"));
  -[MDMBook title](self, "title");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[MDMBook title](self, "title");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("  Title: %@\n"), v12);

  }
  -[MDMBook author](self, "author");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[MDMBook author](self, "author");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("  Author: %@\n"), v14);

  }
  -[MDMBook fullPath](self, "fullPath");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[MDMBook fullPath](self, "fullPath");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR(" Path: %@\n"), v16);

  }
  -[MDMBook state](self, "state");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[MDMBook state](self, "state");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("  State: %@\n"), v18);

  }
  -[MDMBook kind](self, "kind");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[MDMBook kind](self, "kind");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("  Kind: %@\n"), v20);

  }
  -[MDMBook downloadIdentifier](self, "downloadIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[MDMBook downloadIdentifier](self, "downloadIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("  Download ID: %@"), v22);

  }
  return v5;
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
  id v15;

  v4 = a3;
  -[MDMBook author](self, "author");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("author"));

  -[MDMBook title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("title"));

  -[MDMBook kind](self, "kind");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("kind"));

  -[MDMBook fullPath](self, "fullPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("fullPath"));

  -[MDMBook version](self, "version");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("version"));

  -[MDMBook persistentID](self, "persistentID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("persistentID"));

  -[MDMBook iTunesStoreID](self, "iTunesStoreID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("iTunesStoreID"));

  -[MDMBook buyParams](self, "buyParams");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("buyParams"));

  -[MDMBook state](self, "state");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("state"));

  -[MDMBook downloadIdentifier](self, "downloadIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("downloadIdentifier"));

  -[MDMBook previousVersion](self, "previousVersion");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("previousVersion"));

}

- (MDMBook)initWithCoder:(id)a3
{
  id v4;
  MDMBook *v5;
  void *v6;
  uint64_t v7;
  NSString *author;
  void *v9;
  uint64_t v10;
  NSString *title;
  void *v12;
  uint64_t v13;
  NSString *kind;
  void *v15;
  uint64_t v16;
  NSString *fullPath;
  void *v18;
  uint64_t v19;
  NSString *version;
  void *v21;
  uint64_t v22;
  NSString *persistentID;
  void *v24;
  uint64_t v25;
  NSNumber *iTunesStoreID;
  void *v27;
  uint64_t v28;
  NSString *buyParams;
  void *v30;
  uint64_t v31;
  NSString *state;
  void *v33;
  uint64_t v34;
  NSNumber *downloadIdentifier;
  void *v36;
  uint64_t v37;
  MDMBook *previousVersion;
  objc_super v40;

  v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)MDMBook;
  v5 = -[MDMBook init](&v40, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("author"));
    v7 = objc_claimAutoreleasedReturnValue();
    author = v5->_author;
    v5->_author = (NSString *)v7;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("title"));
    v10 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v10;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("kind"));
    v13 = objc_claimAutoreleasedReturnValue();
    kind = v5->_kind;
    v5->_kind = (NSString *)v13;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("fullPath"));
    v16 = objc_claimAutoreleasedReturnValue();
    fullPath = v5->_fullPath;
    v5->_fullPath = (NSString *)v16;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("version"));
    v19 = objc_claimAutoreleasedReturnValue();
    version = v5->_version;
    v5->_version = (NSString *)v19;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("persistentID"));
    v22 = objc_claimAutoreleasedReturnValue();
    persistentID = v5->_persistentID;
    v5->_persistentID = (NSString *)v22;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v24, CFSTR("iTunesStoreID"));
    v25 = objc_claimAutoreleasedReturnValue();
    iTunesStoreID = v5->_iTunesStoreID;
    v5->_iTunesStoreID = (NSNumber *)v25;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v27, CFSTR("buyParams"));
    v28 = objc_claimAutoreleasedReturnValue();
    buyParams = v5->_buyParams;
    v5->_buyParams = (NSString *)v28;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v30, CFSTR("state"));
    v31 = objc_claimAutoreleasedReturnValue();
    state = v5->_state;
    v5->_state = (NSString *)v31;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v33, CFSTR("downloadIdentifier"));
    v34 = objc_claimAutoreleasedReturnValue();
    downloadIdentifier = v5->_downloadIdentifier;
    v5->_downloadIdentifier = (NSNumber *)v34;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v36, CFSTR("previousVersion"));
    v37 = objc_claimAutoreleasedReturnValue();
    previousVersion = v5->_previousVersion;
    v5->_previousVersion = (MDMBook *)v37;

  }
  return v5;
}

- (NSString)author
{
  return self->_author;
}

- (void)setAuthor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)kind
{
  return self->_kind;
}

- (void)setKind:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)fullPath
{
  return self->_fullPath;
}

- (void)setFullPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)persistentID
{
  return self->_persistentID;
}

- (void)setPersistentID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSNumber)iTunesStoreID
{
  return self->_iTunesStoreID;
}

- (void)setITunesStoreID:(id)a3
{
  objc_storeStrong((id *)&self->_iTunesStoreID, a3);
}

- (NSString)buyParams
{
  return self->_buyParams;
}

- (void)setBuyParams:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
  objc_storeStrong((id *)&self->_state, a3);
}

- (NSNumber)downloadIdentifier
{
  return self->_downloadIdentifier;
}

- (void)setDownloadIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_downloadIdentifier, a3);
}

- (MDMBook)previousVersion
{
  return self->_previousVersion;
}

- (void)setPreviousVersion:(id)a3
{
  objc_storeStrong((id *)&self->_previousVersion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousVersion, 0);
  objc_storeStrong((id *)&self->_downloadIdentifier, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_buyParams, 0);
  objc_storeStrong((id *)&self->_iTunesStoreID, 0);
  objc_storeStrong((id *)&self->_persistentID, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_fullPath, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_author, 0);
}

@end
