@implementation BRNonLocalVersion

- (NSString)lastEditorFormattedName
{
  return (NSString *)-[NSPersonNameComponents br_formattedName](self->_lastEditorNameComponents, "br_formattedName");
}

- (BOOL)isLatestVersion
{
  return 0;
}

- (BRNonLocalVersion)initWithURL:(id)a3 physicalURL:(id)a4 size:(id)a5 extension:(id)a6 etag:(id)a7 hasThumbnail:(BOOL)a8 displayName:(id)a9 lastEditorDeviceName:(id)a10 lastEditorNameComponents:(id)a11 modificationDate:(id)a12 versionsStore:(id)a13
{
  id v18;
  id v19;
  id v20;
  BRNonLocalVersion *v21;
  BRNonLocalVersion *v22;
  id v23;
  uint64_t v24;
  int v25;
  void *v26;
  NSObject *v27;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  objc_super v38;
  uint8_t buf[4];
  id v40;
  __int16 v41;
  int v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v37 = a3;
  v36 = a4;
  v18 = a5;
  v19 = a6;
  v35 = a7;
  v34 = a9;
  v33 = a10;
  v32 = a11;
  v20 = a12;
  v31 = a13;
  v38.receiver = self;
  v38.super_class = (Class)BRNonLocalVersion;
  v21 = -[BRNonLocalVersion init](&v38, sel_init);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_etag, a7);
    objc_storeStrong((id *)&v22->_url, a3);
    objc_storeStrong((id *)&v22->_physicalURL, a4);
    objc_storeStrong((id *)&v22->_lastEditorDeviceName, a10);
    objc_storeStrong((id *)&v22->_lastEditorNameComponents, a11);
    v22->_hasThumbnail = a8;
    objc_storeStrong((id *)&v22->_versionsStore, a13);
    v22->_size = objc_msgSend(v18, "unsignedLongLongValue");
    objc_storeStrong((id *)&v22->_displayName, a9);
    if (objc_msgSend(v19, "length"))
    {
      v23 = objc_retainAutorelease(v19);
      objc_msgSend(v23, "bytes");
      v24 = sandbox_extension_consume();
      v22->_sandboxHandle = v24;
      if (v24 < 0)
      {
        v25 = *__error();
        brc_bread_crumbs((uint64_t)"-[BRNonLocalVersion initWithURL:physicalURL:size:extension:etag:hasThumbnail:displayName:lastEditorDeviceName:lastEditorNameComponents:modificationDate:versionsStore:]", 72);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log(0);
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, (os_log_type_t)0x90u))
        {
          *(_DWORD *)buf = 138412802;
          v40 = v23;
          v41 = 1024;
          v42 = v25;
          v43 = 2112;
          v44 = v26;
          _os_log_error_impl(&dword_19CBF0000, v27, (os_log_type_t)0x90u, "[ERROR] Failed to consume extension %@ %{errno}d%@", buf, 0x1Cu);
        }

        *__error() = v25;
      }
    }
    else
    {
      v22->_sandboxHandle = -1;
    }
    objc_storeStrong((id *)&v22->_modificationDate, a12);
  }

  return v22;
}

- (void)dealloc
{
  objc_super v3;

  if ((self->_sandboxHandle & 0x8000000000000000) == 0)
    sandbox_extension_release();
  v3.receiver = self;
  v3.super_class = (Class)BRNonLocalVersion;
  -[BRNonLocalVersion dealloc](&v3, sel_dealloc);
}

- (NSCopying)persistentIdentifier
{
  void *v3;
  GSPermanentStorage *versionsStore;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D25D48], "manager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  versionsStore = self->_versionsStore;
  -[NSURL lastPathComponent](self->_url, "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "persistentIdentifierInStorage:forAdditionNamed:inNameSpace:", versionsStore, v5, *MEMORY[0x1E0D25D00]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSCopying *)v6;
}

+ (id)listVersionsOfDocumentAtURL:(id)a3
{
  id v3;
  BRListNonLocalVersionsOperation *v4;

  v3 = a3;
  v4 = -[BRListNonLocalVersionsOperation initWithDocumentURL:]([BRListNonLocalVersionsOperation alloc], "initWithDocumentURL:", v3);

  return v4;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  NSString *displayName;
  NSString *lastEditorDeviceName;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  NSString *etag;
  void *v11;
  void *v12;
  NSURL *physicalURL;
  void *v14;
  __int128 v16;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = objc_opt_class();
  displayName = self->_displayName;
  lastEditorDeviceName = self->_lastEditorDeviceName;
  -[BRNonLocalVersion lastEditorFormattedName](self, "lastEditorFormattedName");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (const __CFString *)v7;
  else
    v9 = CFSTR("You");
  v16 = *(_OWORD *)&self->_size;
  etag = self->_etag;
  -[NSURL path](self->_url, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ name:'%@' device:'%@' owner:'%@' size:%llu mtime:%@ etag:%@ url:'%@'"), v4, displayName, lastEditorDeviceName, v9, v16, etag, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  physicalURL = self->_physicalURL;
  if (physicalURL && self->_url != physicalURL)
  {
    -[NSURL path](physicalURL, "path");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "appendFormat:", CFSTR(" physical:'%@'"), v14);

  }
  objc_msgSend(v12, "appendString:", CFSTR(">"));
  return v12;
}

- (NSString)etag
{
  return self->_etag;
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (unint64_t)size
{
  return self->_size;
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (NSString)lastEditorDeviceName
{
  return self->_lastEditorDeviceName;
}

- (NSPersonNameComponents)lastEditorNameComponents
{
  return self->_lastEditorNameComponents;
}

- (BOOL)hasThumbnail
{
  return self->_hasThumbnail;
}

- (void)setHasThumbnail:(BOOL)a3
{
  self->_hasThumbnail = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_physicalURL, 0);
  objc_storeStrong((id *)&self->_versionsStore, 0);
  objc_storeStrong((id *)&self->_lastEditorNameComponents, 0);
  objc_storeStrong((id *)&self->_lastEditorDeviceName, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_etag, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
