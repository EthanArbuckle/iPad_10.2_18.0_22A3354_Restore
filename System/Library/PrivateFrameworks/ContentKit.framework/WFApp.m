@implementation WFApp

- (WFApp)initWithRecord:(id)a3
{
  id v5;
  WFApp *v6;
  uint64_t v7;
  NSString *bundleIdentifier;
  void *v9;
  uint64_t v10;
  WFAppDisplayRepresentation *displayRepresentation;
  WFApp *v12;
  void *v14;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFApp.m"), 161, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("record"));

  }
  v6 = -[WFApp init](self, "init");
  if (v6)
  {
    objc_msgSend(v5, "bundleIdentifier");
    v7 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v6->_bundleIdentifier;
    v6->_bundleIdentifier = (NSString *)v7;

    objc_msgSend(v5, "localizedName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFAppDisplayRepresentation withTitle:](WFAppDisplayRepresentation, "withTitle:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    displayRepresentation = v6->_displayRepresentation;
    v6->_displayRepresentation = (WFAppDisplayRepresentation *)v10;

    v12 = v6;
  }

  return v6;
}

- (WFApp)initWithBundleIdentifier:(id)a3 localizedName:(id)a4
{
  id v8;
  id v9;
  WFApp *v10;
  WFApp *v11;
  uint64_t v12;
  WFAppDisplayRepresentation *displayRepresentation;
  WFApp *v14;
  void *v16;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFApp.m"), 173, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier"));

  }
  v10 = -[WFApp init](self, "init");
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_bundleIdentifier, a3);
    if (v9)
    {
      +[WFAppDisplayRepresentation withTitle:](WFAppDisplayRepresentation, "withTitle:", v9);
      v12 = objc_claimAutoreleasedReturnValue();
      displayRepresentation = v11->_displayRepresentation;
      v11->_displayRepresentation = (WFAppDisplayRepresentation *)v12;

    }
    v14 = v11;
  }

  return v11;
}

- (WFApp)initWithBundleIdentifier:(id)a3 displayRepresentation:(id)a4
{
  id v8;
  id v9;
  WFApp *v10;
  WFApp *v11;
  WFApp *v12;
  void *v14;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFApp.m"), 187, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier"));

  }
  v10 = -[WFApp init](self, "init");
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_bundleIdentifier, a3);
    objc_storeStrong((id *)&v11->_displayRepresentation, a4);
    v12 = v11;
  }

  return v11;
}

- (NSString)localizedName
{
  return -[WFAppDisplayRepresentation title](self->_displayRepresentation, "title");
}

- (BOOL)isRunning
{
  return 0;
}

- (id)processIdentifier
{
  return 0;
}

- (BOOL)isFrontmost
{
  return 0;
}

- (BOOL)isHidden
{
  return 0;
}

- (id)bundleURL
{
  return 0;
}

- (id)launchDate
{
  return 0;
}

- (id)icon
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  char v13;

  v4 = a3;
  -[WFApp bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  objc_msgSend(v8, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v5;
  v11 = v9;
  v12 = v11;
  if (v10 == v11)
  {
    v13 = 1;
  }
  else
  {
    v13 = 0;
    if (v10 && v11)
      v13 = objc_msgSend(v10, "isEqual:", v11);
  }

  return v13;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[WFApp bundleIdentifier](self, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (WFApp)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  WFApp *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[WFApp initWithBundleIdentifier:localizedName:](self, "initWithBundleIdentifier:localizedName:", v5, v6);

    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[WFApp bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("bundleIdentifier"));

  -[WFApp localizedName](self, "localizedName");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("localizedName"));

}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (WFAppDisplayRepresentation)displayRepresentation
{
  return self->_displayRepresentation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayRepresentation, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

+ (id)findAppWithBundleIdentifier:(id)a3 name:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  WFApp *v10;
  void *v11;
  void *v12;
  WFApp *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  WFApp *v23;
  void *v24;
  void *v25;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  id v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  id v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (v5)
  {
    v33 = 0;
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithBundleIdentifier:allowPlaceholder:error:", v5, 1, &v33);
    v8 = v33;
    -[NSObject bundleIdentifier](v7, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = [WFApp alloc];
      -[NSObject bundleIdentifier](v7, "bundleIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject localizedName](v7, "localizedName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[WFApp initWithBundleIdentifier:localizedName:](v10, "initWithBundleIdentifier:localizedName:", v11, v12);

      goto LABEL_22;
    }

  }
  else
  {
    v8 = 0;
  }
  if (objc_msgSend(v6, "length"))
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    +[WFGreenTeaLogger log:](WFGreenTeaLogger, "log:", CFSTR("Reading installed app list"));
    objc_msgSend(MEMORY[0x24BDC1540], "enumeratorWithOptions:", 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v14 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v30;
      v27 = v8;
      v28 = v5;
      while (2)
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v30 != v16)
            objc_enumerationMutation(v7);
          v18 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v17);
          v19 = (void *)MEMORY[0x20BD3D97C]();
          objc_msgSend(v18, "localizedName");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v20, "isEqualToString:", v6))
          {

LABEL_21:
            v23 = [WFApp alloc];
            objc_msgSend(v18, "bundleIdentifier");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "localizedName");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = -[WFApp initWithBundleIdentifier:localizedName:](v23, "initWithBundleIdentifier:localizedName:", v24, v25);

            objc_autoreleasePoolPop(v19);
            v8 = v27;
            v5 = v28;
            goto LABEL_22;
          }
          objc_msgSend(v18, "localizedShortName");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "isEqualToString:", v6);

          if ((v22 & 1) != 0)
            goto LABEL_21;
          objc_autoreleasePoolPop(v19);
          ++v17;
        }
        while (v15 != v17);
        v15 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
        v8 = v27;
        v5 = v28;
        if (v15)
          continue;
        break;
      }
    }

  }
  getWFGeneralLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v35 = "+[WFApp findAppWithBundleIdentifier:name:]";
    v36 = 2112;
    v37 = v8;
    _os_log_impl(&dword_20BBAD000, v7, OS_LOG_TYPE_ERROR, "%s Could not get app with error: %@", buf, 0x16u);
  }
  v13 = 0;
LABEL_22:

  return v13;
}

+ (id)allApps
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  WFApp *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  +[WFGreenTeaLogger log:](WFGreenTeaLogger, "log:", CFSTR("Reading installed app list"), 0);
  objc_msgSend(MEMORY[0x24BDC1540], "enumeratorWithOptions:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v7);
        v9 = (void *)MEMORY[0x20BD3D97C]();
        if (objc_msgSend(v8, "wf_isAvailableInContext:", 0))
        {
          v10 = -[WFApp initWithRecord:]([WFApp alloc], "initWithRecord:", v8);
          objc_msgSend(v2, "addObject:", v10);

        }
        objc_autoreleasePoolPop(v9);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
