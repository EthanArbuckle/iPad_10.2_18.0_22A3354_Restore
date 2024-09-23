@implementation CRAssetWallpaperData

- (CRAssetWallpaperData)initWithWallpaperIdentifier:(id)a3 displayID:(id)a4 layoutID:(id)a5
{
  id v8;
  id v9;
  id v10;
  CRAssetWallpaperData *v11;
  uint64_t v12;
  NSString *wallpaperID;
  uint64_t v14;
  NSString *displayID;
  uint64_t v16;
  NSString *layoutID;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CRAssetWallpaperData;
  v11 = -[CRAssetWallpaperData init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    wallpaperID = v11->_wallpaperID;
    v11->_wallpaperID = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    displayID = v11->_displayID;
    v11->_displayID = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    layoutID = v11->_layoutID;
    v11->_layoutID = (NSString *)v16;

  }
  return v11;
}

- (NSString)identifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[CRAssetWallpaperData displayID](self, "displayID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRAssetWallpaperData layoutID](self, "layoutID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRAssetWallpaperData wallpaperID](self, "wallpaperID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%@:%@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (CRAssetWallpaperData)initWithDictionary:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  CRAssetWallpaperData *v11;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("displayIdentifier"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("layoutIdentifier"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;

  objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("wallpaperIdentifier"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9 && (objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;

  v11 = 0;
  if (v6 && v8 && v10)
  {
    self = -[CRAssetWallpaperData initWithWallpaperIdentifier:displayID:layoutID:](self, "initWithWallpaperIdentifier:displayID:layoutID:", v10, v6, v8);
    v11 = self;
  }

  return v11;
}

- (id)asDictionary
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  -[CRAssetWallpaperData displayID](self, "displayID");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[CRAssetWallpaperData layoutID](self, "layoutID");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      -[CRAssetWallpaperData wallpaperID](self, "wallpaperID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        v19[0] = CFSTR("displayIdentifier");
        -[CRAssetWallpaperData displayID](self, "displayID");
        v8 = objc_claimAutoreleasedReturnValue();
        v20[0] = v8;
        v19[1] = CFSTR("layoutIdentifier");
        -[CRAssetWallpaperData layoutID](self, "layoutID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v20[1] = v9;
        v19[2] = CFSTR("wallpaperIdentifier");
        -[CRAssetWallpaperData wallpaperID](self, "wallpaperID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v20[2] = v10;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_9;
      }
    }
    else
    {

    }
  }
  CarGeneralLogging();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    -[CRSystemWallpaperData asDictionary].cold.1((uint64_t)self, v8, v12, v13, v14, v15, v16, v17);
  v11 = 0;
LABEL_9:

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if (v5 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CRAssetWallpaperData wallpaperID](self, "wallpaperID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "wallpaperID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", v7))
    {
      -[CRAssetWallpaperData displayID](self, "displayID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "displayID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqualToString:", v9))
      {
        -[CRAssetWallpaperData layoutID](self, "layoutID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "layoutID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqualToString:", v11);

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
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
  v8.super_class = (Class)CRAssetWallpaperData;
  -[CRAssetWallpaperData description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRAssetWallpaperData identifier](self, "identifier");
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
  NSString *displayID;
  id v5;

  displayID = self->_displayID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", displayID, CFSTR("displayIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_layoutID, CFSTR("layoutIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_wallpaperID, CFSTR("wallpaperIdentifier"));

}

- (CRAssetWallpaperData)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  CRAssetWallpaperData *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("layoutIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("wallpaperIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (v8 || v7 == 0)
  {
    v10 = 0;
  }
  else
  {
    self = -[CRAssetWallpaperData initWithWallpaperIdentifier:displayID:layoutID:](self, "initWithWallpaperIdentifier:displayID:layoutID:", v7, v5, v6);
    v10 = self;
  }

  return v10;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  NSString *displayID;
  id v5;

  displayID = self->_displayID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", displayID, CFSTR("displayIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_layoutID, CFSTR("layoutIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_wallpaperID, CFSTR("wallpaperIdentifier"));

}

- (CRAssetWallpaperData)initWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  CRAssetWallpaperData *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("layoutIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("wallpaperIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (v8 || v7 == 0)
  {
    v10 = 0;
  }
  else
  {
    self = -[CRAssetWallpaperData initWithWallpaperIdentifier:displayID:layoutID:](self, "initWithWallpaperIdentifier:displayID:layoutID:", v7, v5, v6);
    v10 = self;
  }

  return v10;
}

- (NSString)displayID
{
  return self->_displayID;
}

- (NSString)layoutID
{
  return self->_layoutID;
}

- (NSString)wallpaperID
{
  return self->_wallpaperID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wallpaperID, 0);
  objc_storeStrong((id *)&self->_layoutID, 0);
  objc_storeStrong((id *)&self->_displayID, 0);
}

@end
