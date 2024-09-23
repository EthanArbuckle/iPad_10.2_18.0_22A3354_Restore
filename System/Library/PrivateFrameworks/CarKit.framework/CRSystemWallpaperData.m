@implementation CRSystemWallpaperData

- (CRSystemWallpaperData)initWithIdentifier:(id)a3
{
  id v4;
  CRSystemWallpaperData *v5;
  uint64_t v6;
  NSString *identifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRSystemWallpaperData;
  v5 = -[CRSystemWallpaperData init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

  }
  return v5;
}

- (CRSystemWallpaperData)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  CRSystemWallpaperData *v8;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("systemWallpaperIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v5;
  if (v6 && (objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;

  if (v7)
  {
    self = -[CRSystemWallpaperData initWithIdentifier:](self, "initWithIdentifier:", v7);
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)asDictionary
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  -[CRSystemWallpaperData identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v13 = CFSTR("systemWallpaperIdentifier");
    -[CRSystemWallpaperData identifier](self, "identifier");
    v4 = objc_claimAutoreleasedReturnValue();
    v14[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    CarGeneralLogging();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      -[CRSystemWallpaperData asDictionary].cold.1((uint64_t)self, v4, v6, v7, v8, v9, v10, v11);
    v5 = 0;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if (v5 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CRSystemWallpaperData identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)CRSystemWallpaperData;
  -[CRSystemWallpaperData description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRSystemWallpaperData identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ {identifier: %@}"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_identifier, CFSTR("systemWallpaperIdentifier"));
}

- (CRSystemWallpaperData)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  CRSystemWallpaperData *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("systemWallpaperIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[CRSystemWallpaperData initWithIdentifier:](self, "initWithIdentifier:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_identifier, CFSTR("systemWallpaperIdentifier"));
}

- (CRSystemWallpaperData)initWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  CRSystemWallpaperData *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("systemWallpaperIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[CRSystemWallpaperData initWithIdentifier:](self, "initWithIdentifier:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)asDictionary
{
  OUTLINED_FUNCTION_0_0(&dword_1A83A2000, a2, a3, "Unable to serialize wallpaper: %@", a5, a6, a7, a8, 2u);
}

@end
