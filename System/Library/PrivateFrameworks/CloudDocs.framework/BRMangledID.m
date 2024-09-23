@implementation BRMangledID

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mangledIDString, 0);
}

+ (BOOL)validateContainerID:(id)a3
{
  id v3;
  char *v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  _BYTE v18[18];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!objc_msgSend(v3, "length"))
  {
    brc_bread_crumbs((uint64_t)"+[BRMangledID validateContainerID:]", 249);
    v4 = (char *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v9 = "empty";
      if (!v3)
        v9 = "nil";
      v15 = 136315394;
      v16 = v9;
      v17 = 2112;
      *(_QWORD *)v18 = v4;
      v6 = "[WARNING] invalid container name (%s)%@";
      v7 = v5;
      v8 = 22;
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  if ((unint64_t)objc_msgSend(v3, "length") >= 0x97)
  {
    brc_bread_crumbs((uint64_t)"+[BRMangledID validateContainerID:]", 253);
    v4 = (char *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412802;
      v16 = (const char *)v3;
      v17 = 1024;
      *(_DWORD *)v18 = 150;
      *(_WORD *)&v18[4] = 2112;
      *(_QWORD *)&v18[6] = v4;
      v6 = "[WARNING] invalid container name '%@', max length is %u%@";
      v7 = v5;
      v8 = 28;
LABEL_17:
      _os_log_impl(&dword_19CBF0000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v15, v8);
      goto LABEL_18;
    }
    goto LABEL_18;
  }
  if (!v3)
  {
    brc_bread_crumbs((uint64_t)"+[BRMangledID validateContainerID:]", 258);
    v4 = (char *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412290;
      v16 = v4;
      v6 = "[WARNING] nil containerID%@";
      v7 = v5;
      v8 = 12;
      goto LABEL_17;
    }
LABEL_18:

    v12 = 0;
    goto LABEL_19;
  }
  if (validateContainerID__onceToken != -1)
    dispatch_once(&validateContainerID__onceToken, &__block_literal_global_13);
  v10 = objc_msgSend(v3, "length");
  if (objc_msgSend((id)validateContainerID____regex, "rangeOfFirstMatchInString:options:range:", v3, 0, 0, v10)
    || v11 != v10)
  {
    brc_bread_crumbs((uint64_t)"+[BRMangledID validateContainerID:]", 271);
    v4 = (char *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend((id)validateContainerID____regex, "pattern");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412802;
      v16 = (const char *)v3;
      v17 = 2112;
      *(_QWORD *)v18 = v14;
      *(_WORD *)&v18[8] = 2112;
      *(_QWORD *)&v18[10] = v4;
      _os_log_impl(&dword_19CBF0000, v5, OS_LOG_TYPE_DEFAULT, "[WARNING] invalid container name '%@', expected regex %@%@", (uint8_t *)&v15, 0x20u);

    }
    goto LABEL_18;
  }
  v12 = 1;
LABEL_19:

  return v12;
}

- (BRMangledID)initWithAppLibraryName:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  objc_super v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!+[BRMangledID validateContainerID:](BRMangledID, "validateContainerID:", v4))
  {
    brc_bread_crumbs((uint64_t)"-[BRMangledID initWithAppLibraryName:]", 44);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v12 = v4;
      v13 = 2112;
      v14 = v7;
      _os_log_impl(&dword_19CBF0000, v8, OS_LOG_TYPE_DEFAULT, "[WARNING] invalid library name %@%@", buf, 0x16u);
    }

    v5 = 0;
    goto LABEL_7;
  }
  v10.receiver = self;
  v10.super_class = (Class)BRMangledID;
  v5 = -[BRMangledID init](&v10, sel_init);
  if (v5)
  {
    +[BRMangledID _privateMangledContainerID:validate:](BRMangledID, "_privateMangledContainerID:validate:", v4, 1);
    v6 = objc_claimAutoreleasedReturnValue();
    self = (BRMangledID *)*((_QWORD *)v5 + 1);
    *((_QWORD *)v5 + 1) = v6;
LABEL_7:

  }
  return (BRMangledID *)v5;
}

+ (id)_privateMangledContainerID:(id)a3 validate:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  void *v9;
  NSObject *v10;

  v4 = a4;
  v5 = a3;
  v6 = v5;
  if (v4 && objc_msgSend(v5, "containsString:", CFSTR("~")))
  {
    brc_bread_crumbs((uint64_t)"+[BRMangledID _privateMangledContainerID:validate:]", 349);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      +[BRMangledID _privateMangledContainerID:validate:].cold.1();

  }
  objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), CFSTR("~"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)appLibraryOrZoneName
{
  BOOL v3;
  NSString *mangledIDString;

  v3 = -[BRMangledID isShared](self, "isShared");
  mangledIDString = self->_mangledIDString;
  if (v3)
    +[BRMangledID _containerIDFromSharedMangledIDString:validate:](BRMangledID, "_containerIDFromSharedMangledIDString:validate:", mangledIDString, 0);
  else
    +[BRMangledID _privateUnmangledContainerID:validate:](BRMangledID, "_privateUnmangledContainerID:validate:", mangledIDString, 0);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isShared
{
  return -[NSString containsString:](self->_mangledIDString, "containsString:", CFSTR(":"))
      || -[NSString isEqualToString:](self->_mangledIDString, "isEqualToString:", CFSTR("com~apple~SharedDocs"));
}

+ (id)_privateUnmangledContainerID:(id)a3 validate:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  void *v9;
  NSObject *v10;

  v4 = a4;
  v5 = a3;
  v6 = v5;
  if (v4 && objc_msgSend(v5, "containsString:", CFSTR(".")))
  {
    brc_bread_crumbs((uint64_t)"+[BRMangledID _privateUnmangledContainerID:validate:]", 355);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      +[BRMangledID _privateUnmangledContainerID:validate:].cold.1();

  }
  objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("~"), CFSTR("."));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BRMangledID)initWithMangledString:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  objc_super v10;

  v4 = a3;
  if (!+[BRMangledID validateMangledIDString:](BRMangledID, "validateMangledIDString:", v4))
  {
    brc_bread_crumbs((uint64_t)"-[BRMangledID initWithMangledString:]", 57);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[BRMangledID initWithMangledString:].cold.1();

    v5 = 0;
    goto LABEL_7;
  }
  v10.receiver = self;
  v10.super_class = (Class)BRMangledID;
  v5 = -[BRMangledID init](&v10, sel_init);
  if (v5)
  {
    v6 = v4;
    self = (BRMangledID *)*((_QWORD *)v5 + 1);
    *((_QWORD *)v5 + 1) = v6;
LABEL_7:

  }
  return (BRMangledID *)v5;
}

+ (BOOL)validateMangledIDString:(id)a3 strict:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  BOOL v10;

  v4 = a4;
  v5 = a3;
  v6 = v5;
  if (v4 && !objc_msgSend(v5, "containsString:", CFSTR("~")))
  {
    v7 = 0;
    v10 = 0;
  }
  else
  {
    if ((objc_msgSend(v6, "containsString:", CFSTR(":")) & 1) != 0)
    {
      +[BRMangledID _containerIDFromSharedMangledIDString:validate:](BRMangledID, "_containerIDFromSharedMangledIDString:validate:", v6, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[BRMangledID _ownerNameFromSharedMangledIDString:validate:](BRMangledID, "_ownerNameFromSharedMangledIDString:validate:", v6, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = +[BRMangledID validateOwnerName:](BRMangledID, "validateOwnerName:", v8);

      v10 = 0;
      if (!v9)
        goto LABEL_9;
    }
    else
    {
      +[BRMangledID _privateUnmangledContainerID:validate:](BRMangledID, "_privateUnmangledContainerID:validate:", v6, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v10 = +[BRMangledID validateContainerID:](BRMangledID, "validateContainerID:", v7);
  }
LABEL_9:

  return v10;
}

+ (BOOL)validateMangledIDString:(id)a3
{
  return objc_msgSend(a1, "validateMangledIDString:strict:", a3, 0);
}

void __35__BRMangledID_validateContainerID___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", CFSTR("[a-zA-Z0-9\\-]+\\.[a-zA-Z0-9\\-\\.]+"), 0, 0);
  v1 = (void *)validateContainerID____regex;
  validateContainerID____regex = v0;

}

- (NSString)mangledIDString
{
  return self->_mangledIDString;
}

- (BOOL)isEqualToMangledID:(id)a3
{
  return -[NSString isEqualToString:](self->_mangledIDString, "isEqualToString:", *((_QWORD *)a3 + 1));
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[BRMangledID isEqualToMangledID:](self, "isEqualToMangledID:", v4);

  return v5;
}

- (BOOL)isDocumentsMangledID
{
  NSString *mangledIDString;
  void *v3;

  mangledIDString = self->_mangledIDString;
  +[BRMangledID _privateMangledContainerID:validate:](BRMangledID, "_privateMangledContainerID:validate:", CFSTR("com.apple.Documents"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(mangledIDString) = -[NSString isEqualToString:](mangledIDString, "isEqualToString:", v3);

  return (char)mangledIDString;
}

- (BOOL)isDesktopMangledID
{
  NSString *mangledIDString;
  void *v3;

  mangledIDString = self->_mangledIDString;
  +[BRMangledID _privateMangledContainerID:validate:](BRMangledID, "_privateMangledContainerID:validate:", CFSTR("com.apple.Desktop"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(mangledIDString) = -[NSString isEqualToString:](mangledIDString, "isEqualToString:", v3);

  return (char)mangledIDString;
}

- (BOOL)isCloudDocsMangledID
{
  return -[NSString isEqualToString:](self->_mangledIDString, "isEqualToString:", CFSTR("com~apple~CloudDocs"));
}

- (BRMangledID)initWithCoder:(id)a3
{
  id v4;
  BRMangledID *v5;
  uint64_t v6;
  NSString *mangledIDString;
  void *v8;
  NSObject *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BRMangledID;
  v5 = -[BRMangledID init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mangledIDString"));
    v6 = objc_claimAutoreleasedReturnValue();
    mangledIDString = v5->_mangledIDString;
    v5->_mangledIDString = (NSString *)v6;

    if (!+[BRMangledID validateMangledIDString:](BRMangledID, "validateMangledIDString:", v5->_mangledIDString))
    {
      brc_bread_crumbs((uint64_t)"-[BRMangledID initWithCoder:]", 94);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        -[BRMangledID initWithCoder:].cold.1(&v5->_mangledIDString, (uint64_t)v8, v9);

      v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_mangledIDString, "hash");
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_mangledIDString, CFSTR("mangledIDString"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BRMangledID)initWithRecordZoneID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BRMangledID *v7;

  v4 = a3;
  objc_msgSend(v4, "zoneName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ownerName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[BRMangledID initWithZoneName:ownerName:](self, "initWithZoneName:ownerName:", v5, v6);
  return v7;
}

- (BRMangledID)initWithZoneName:(id)a3 ownerName:(id)a4
{
  id v6;
  id v7;
  BRMangledID *v8;
  uint64_t v9;
  NSString *mangledIDString;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BRMangledID;
  v8 = -[BRMangledID init](&v12, sel_init);
  if (v8)
  {
    +[BRMangledID _mangledIDStringFromZoneName:ownerName:validate:](BRMangledID, "_mangledIDStringFromZoneName:ownerName:validate:", v6, v7, 1);
    v9 = objc_claimAutoreleasedReturnValue();
    mangledIDString = v8->_mangledIDString;
    v8->_mangledIDString = (NSString *)v9;

    if (!v8->_mangledIDString)
    {

      v8 = 0;
    }
  }

  return v8;
}

- (BRMangledID)initWithAliasTargetContainerString:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  BRMangledID *v12;
  void *v14;
  NSObject *v15;

  v4 = a3;
  if (objc_msgSend(v4, "containsString:", CFSTR("/")))
  {
    brc_bread_crumbs((uint64_t)"-[BRMangledID initWithAliasTargetContainerString:]", 70);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      -[BRMangledID initWithAliasTargetContainerString:].cold.1();

  }
  v5 = objc_msgSend(v4, "rangeOfString:", CFSTR(":"));
  v7 = v6;
  v8 = v4;
  v9 = v8;
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = 0;
    v11 = v8;
  }
  else
  {
    objc_msgSend(v8, "substringToIndex:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "substringFromIndex:", v5 + v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12 = -[BRMangledID initWithZoneName:ownerName:](self, "initWithZoneName:ownerName:", v11, v10);

  return v12;
}

+ (id)cloudDocsMangledID
{
  return -[BRMangledID initWithAppLibraryName:]([BRMangledID alloc], "initWithAppLibraryName:", CFSTR("com.apple.CloudDocs"));
}

- (id)description
{
  void *v2;
  void *v3;

  -[BRMangledID aliasTargetContainerString](self, "aliasTargetContainerString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isPrivate
{
  return !-[BRMangledID isShared](self, "isShared");
}

- (BOOL)isPassbookMangledID
{
  NSString *mangledIDString;
  void *v3;

  mangledIDString = self->_mangledIDString;
  +[BRMangledID _privateMangledContainerID:validate:](BRMangledID, "_privateMangledContainerID:validate:", CFSTR("com.apple.shoebox"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(mangledIDString) = -[NSString isEqualToString:](mangledIDString, "isEqualToString:", v3);

  return (char)mangledIDString;
}

- (BOOL)isCorporateMangledID
{
  NSString *mangledIDString;
  void *v3;

  mangledIDString = self->_mangledIDString;
  +[BRMangledID _privateMangledContainerID:validate:](BRMangledID, "_privateMangledContainerID:validate:", CFSTR("com.apple.icloud.applecorporate"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(mangledIDString) = -[NSString isEqualToString:](mangledIDString, "isEqualToString:", v3);

  return (char)mangledIDString;
}

+ (id)desktopMangledID
{
  return -[BRMangledID initWithAppLibraryName:]([BRMangledID alloc], "initWithAppLibraryName:", CFSTR("com.apple.Desktop"));
}

+ (id)documentsMangledID
{
  return -[BRMangledID initWithAppLibraryName:]([BRMangledID alloc], "initWithAppLibraryName:", CFSTR("com.apple.Documents"));
}

+ (id)sideCarMangledID
{
  return -[BRMangledID initWithAppLibraryName:]([BRMangledID alloc], "initWithAppLibraryName:", CFSTR("com.apple.CloudDocs.pp-metadata"));
}

+ (id)zoneHealthMangledID
{
  return -[BRMangledID initWithAppLibraryName:]([BRMangledID alloc], "initWithAppLibraryName:", CFSTR("com.apple.CloudDocs.health"));
}

+ (id)containerMetadataMangledID
{
  return -[BRMangledID initWithAppLibraryName:]([BRMangledID alloc], "initWithAppLibraryName:", CFSTR("com.apple.CloudDocs.container-metadata"));
}

+ (id)sharedDatabaseMangledID
{
  return -[BRMangledID initWithAppLibraryName:]([BRMangledID alloc], "initWithAppLibraryName:", CFSTR("com.apple.SharedDocs"));
}

- (NSString)ownerName
{
  return (NSString *)+[BRMangledID _ownerNameFromSharedMangledIDString:validate:](BRMangledID, "_ownerNameFromSharedMangledIDString:validate:", self->_mangledIDString, 0);
}

- (NSString)aliasTargetContainerString
{
  return -[NSString stringByReplacingOccurrencesOfString:withString:](self->_mangledIDString, "stringByReplacingOccurrencesOfString:withString:", CFSTR("~"), CFSTR("."));
}

+ (BOOL)validateOwnerName:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  void *v8;
  NSObject *v9;

  v3 = a3;
  v4 = v3;
  if (validateOwnerName__onceToken != -1)
  {
    dispatch_once(&validateOwnerName__onceToken, &__block_literal_global_16_0);
    if (v4)
      goto LABEL_3;
LABEL_9:
    brc_bread_crumbs((uint64_t)"+[BRMangledID validateOwnerName:]", 286);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, (os_log_type_t)0x90u))
      +[BRMangledID validateOwnerName:].cold.1((uint64_t)v8, v9);
    goto LABEL_11;
  }
  if (!v3)
    goto LABEL_9;
LABEL_3:
  v5 = objc_msgSend(v4, "length");
  if (objc_msgSend((id)validateOwnerName____regex, "rangeOfFirstMatchInString:options:range:", v4, 0, 0, v5)
    || v6 != v5)
  {
    brc_bread_crumbs((uint64_t)"+[BRMangledID validateOwnerName:]", 293);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, (os_log_type_t)0x90u))
      +[BRMangledID validateOwnerName:].cold.2((uint64_t)v4, (uint64_t)v8, v9);
LABEL_11:

    v7 = 0;
    goto LABEL_12;
  }
  v7 = 1;
LABEL_12:

  return v7;
}

void __33__BRMangledID_validateOwnerName___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", CFSTR("_[0-9a-f]{32}"), 0, 0);
  v1 = (void *)validateOwnerName____regex;
  validateOwnerName____regex = v0;

}

+ (id)_mangledIDStringFromZoneName:(id)a3 ownerName:(id)a4 validate:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v5 = a5;
  v19 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (_mangledIDStringFromZoneName_ownerName_validate__onceToken != -1)
    dispatch_once(&_mangledIDStringFromZoneName_ownerName_validate__onceToken, &__block_literal_global_21);
  if (_mangledIDStringFromZoneName_ownerName_validate___defaultOwnerName
    && (objc_msgSend(v8, "isEqualToString:") & 1) != 0)
  {

    if (!+[BRMangledID validateContainerID:](BRMangledID, "validateContainerID:", v7))
    {
      v8 = 0;
      goto LABEL_11;
    }
LABEL_14:
    +[BRMangledID _privateMangledContainerID:validate:](BRMangledID, "_privateMangledContainerID:validate:", v7, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  if (!+[BRMangledID validateContainerID:](BRMangledID, "validateContainerID:", v7))
    goto LABEL_11;
  if (!v8)
    goto LABEL_14;
  if (+[BRMangledID validateOwnerName:](BRMangledID, "validateOwnerName:", v8))
  {
    +[BRMangledID _sharedMangledIDStringWithContainerID:ownerName:validate:](BRMangledID, "_sharedMangledIDStringWithContainerID:ownerName:validate:", v7, v8, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_15;
  }
LABEL_11:
  brc_bread_crumbs((uint64_t)"+[BRMangledID _mangledIDStringFromZoneName:ownerName:validate:]", 340);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(0);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
  {
    v13 = 138412802;
    v14 = v7;
    v15 = 2112;
    v16 = v8;
    v17 = 2112;
    v18 = v10;
    _os_log_fault_impl(&dword_19CBF0000, v11, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: invalid zone %@ or owner name %@%@", (uint8_t *)&v13, 0x20u);
  }

  v9 = 0;
LABEL_15:

  return v9;
}

void __63__BRMangledID__mangledIDStringFromZoneName_ownerName_validate___block_invoke()
{
  void *v0;
  void *v1;

  getCKCurrentUserDefaultName();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (v0)
  {
    v1 = v0;
    objc_storeStrong((id *)&_mangledIDStringFromZoneName_ownerName_validate___defaultOwnerName, v0);
    v0 = v1;
  }

}

+ (id)_sharedMangledIDStringWithContainerID:(id)a3 ownerName:(id)a4 validate:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v13;
  NSObject *v14;

  v5 = a5;
  v8 = a4;
  objc_msgSend(a1, "_privateMangledContainerID:validate:", a3, v5);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (!v8 || !v9)
  {
    brc_bread_crumbs((uint64_t)"+[BRMangledID _sharedMangledIDStringWithContainerID:ownerName:validate:]", 362);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      +[BRMangledID _sharedMangledIDStringWithContainerID:ownerName:validate:].cold.1();

  }
  objc_msgSend(v10, "stringByAppendingFormat:", CFSTR(":%@"), v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)_containerIDFromSharedMangledIDString:(id)a3 validate:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;

  v4 = a4;
  objc_msgSend(a1, "_containerIDFromSharedContainerID:validate:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_privateUnmangledContainerID:validate:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_ownerNameFromSharedMangledIDString:(id)a3 validate:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v10;
  NSObject *v11;

  v4 = a4;
  v5 = a3;
  v6 = objc_msgSend(v5, "rangeOfString:", CFSTR(":"));
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v4)
    {
      brc_bread_crumbs((uint64_t)"+[BRMangledID _ownerNameFromSharedMangledIDString:validate:]", 376);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        +[BRMangledID _ownerNameFromSharedMangledIDString:validate:].cold.1();

    }
    v8 = 0;
  }
  else
  {
    objc_msgSend(v5, "substringFromIndex:", v6 + v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

+ (id)_containerIDFromSharedContainerID:(id)a3 validate:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v9;
  NSObject *v10;

  v4 = a4;
  v5 = a3;
  v6 = objc_msgSend(v5, "rangeOfString:", CFSTR(":"));
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v4)
    {
      brc_bread_crumbs((uint64_t)"+[BRMangledID _containerIDFromSharedContainerID:validate:]", 388);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        +[BRMangledID _ownerNameFromSharedMangledIDString:validate:].cold.1();

    }
    v7 = 0;
  }
  else
  {
    objc_msgSend(v5, "substringToIndex:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (void)initWithMangledString:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_7_1(&dword_19CBF0000, v0, v1, "[CRIT] UNREACHABLE: invalid mangled string %@%@");
  OUTLINED_FUNCTION_1();
}

- (void)initWithAliasTargetContainerString:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] Assertion failed: ![aliasTargetString containsString:@\"/\"]%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)initWithCoder:(NSObject *)a3 .cold.1(_QWORD *a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_7_1(&dword_19CBF0000, a2, a3, "[CRIT] UNREACHABLE: encoded object has bogus mangledID %@%@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_1();
}

+ (void)validateOwnerName:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  void *v4;
  uint8_t v5[14];
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)validateOwnerName____regex, "pattern");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_2();
  v6 = a1;
  _os_log_error_impl(&dword_19CBF0000, a2, (os_log_type_t)0x90u, "[ERROR] invalid owner name nil, expected regex %@%@", v5, 0x16u);

}

+ (void)validateOwnerName:(NSObject *)a3 .cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)validateOwnerName____regex, "pattern");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412802;
  v8 = a1;
  v9 = 2112;
  v10 = v6;
  v11 = 2112;
  v12 = a2;
  _os_log_error_impl(&dword_19CBF0000, a3, (os_log_type_t)0x90u, "[ERROR] invalid owner name '%@', expected regex %@%@", (uint8_t *)&v7, 0x20u);

}

+ (void)_privateMangledContainerID:validate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] Assertion failed: !validate || ![containerID containsString:@\"~\"]%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)_privateUnmangledContainerID:validate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] Assertion failed: !validate || ![mangledContainerID containsString:@\".\"]%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)_sharedMangledIDStringWithContainerID:ownerName:validate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] Assertion failed: ownerName && mangledContainerID%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)_ownerNameFromSharedMangledIDString:validate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] Assertion failed: !validate%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
