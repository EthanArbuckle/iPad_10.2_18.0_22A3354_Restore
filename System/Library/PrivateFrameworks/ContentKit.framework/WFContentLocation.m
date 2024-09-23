@implementation WFContentLocation

+ (id)contentLocationForFile:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "representationType"))
  {
    objc_msgSend(v4, "fileURL");
    v5 = objc_claimAutoreleasedReturnValue();
    v14 = 0;
    objc_msgSend(a1, "appDescriptorForFileProviderHandlingURL:error:", v5, &v14);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v14;
    if (v7)
    {
      getWFSecurityLogObject();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        -[NSObject absoluteString](v5, "absoluteString");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315651;
        v16 = "+[WFContentLocation(FileProviders) contentLocationForFile:]";
        v17 = 2113;
        v18 = v9;
        v19 = 2114;
        v20 = v7;
        _os_log_impl(&dword_20BBAD000, v8, OS_LOG_TYPE_DEBUG, "%s Could not determine appDescriptor managing path %{private}@: %{public}@", buf, 0x20u);

      }
    }
    if (objc_msgSend(v6, "isInstalled"))
    {
      +[WFAppContentLocation locationWithAppDescriptor:](WFAppContentLocation, "locationWithAppDescriptor:", v6);
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      getWFWorkflowExecutionLogObject();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v16 = "+[WFContentLocation(FileProviders) contentLocationForFile:]";
        _os_log_impl(&dword_20BBAD000, v12, OS_LOG_TYPE_DEBUG, "%s File provider application is not installed or could not be resolved; defaulting to platform file manager destination",
          buf,
          0xCu);
      }

      +[WFAppContentLocation platformFileManagerLocation](WFAppContentLocation, "platformFileManagerLocation");
      v10 = objc_claimAutoreleasedReturnValue();
    }
    v11 = (void *)v10;

  }
  else
  {
    getWFFilesLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "+[WFContentLocation(FileProviders) contentLocationForFile:]";
      _os_log_impl(&dword_20BBAD000, v5, OS_LOG_TYPE_FAULT, "%s Should not get content origin for in-memory data blob", buf, 0xCu);
    }
    v11 = 0;
  }

  return v11;
}

+ (void)getContentLocationFromFile:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "numberOfItems") >= 2)
  {
    getWFSecurityLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v14 = "+[WFContentLocation(FileProviders) getContentLocationFromFile:completionHandler:]";
      _os_log_impl(&dword_20BBAD000, v8, OS_LOG_TYPE_FAULT, "%s getContentLocationFromFile is being called with multiple input items. The calling action should not allow for multiple input", buf, 0xCu);
    }

  }
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __81__WFContentLocation_FileProviders__getContentLocationFromFile_completionHandler___block_invoke;
  v10[3] = &unk_24C4E0070;
  v11 = v7;
  v12 = a1;
  v9 = v7;
  objc_msgSend(v6, "getFileRepresentation:forType:", v10, 0);

}

+ (id)appDescriptorForFileProviderHandlingURL:(id)a3 error:(id *)a4
{
  id v7;
  int v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  NSObject *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFContentLocation+FileProviders.m"), 63, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("URL"));

  }
  v8 = objc_msgSend(v7, "startAccessingSecurityScopedResource");
  objc_msgSend(MEMORY[0x24BDC82F0], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "itemForURL:error:", v7, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 && *a4)
  {
    getWFSecurityLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v12 = *a4;
      *(_DWORD *)buf = 136315394;
      v24 = "+[WFContentLocation(FileProviders) appDescriptorForFileProviderHandlingURL:error:]";
      v25 = 2112;
      v26 = v12;
      _os_log_impl(&dword_20BBAD000, v11, OS_LOG_TYPE_DEBUG, "%s Could not create FPItem from URL: %@", buf, 0x16u);
    }
    v13 = 0;
LABEL_20:

    goto LABEL_21;
  }
  if (v8)
    objc_msgSend(v7, "stopAccessingSecurityScopedResource");
  if (v10)
  {
    v22 = 0;
    objc_msgSend(MEMORY[0x24BDC82F8], "providerDomainForItem:error:", v10, &v22);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v22;
    v11 = v15;
    if (v14)
    {
      objc_msgSend(v14, "topLevelBundleIdentifier");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9BD0]), "initWithBundleIdentifier:", v16);
      objc_msgSend(MEMORY[0x24BDD9BF0], "sharedResolver");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "resolvedAppMatchingDescriptor:", v17);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (a4)
        *a4 = objc_retainAutorelease(v15);
      getWFWorkflowExecutionLogObject();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v10, "providerID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v24 = "+[WFContentLocation(FileProviders) appDescriptorForFileProviderHandlingURL:error:]";
        v25 = 2112;
        v26 = v19;
        v27 = 2112;
        v28 = v11;
        _os_log_impl(&dword_20BBAD000, v16, OS_LOG_TYPE_ERROR, "%s Couldn't resolve file provider with id %@: %@", buf, 0x20u);

      }
      v13 = 0;
    }

    goto LABEL_20;
  }
  v13 = 0;
LABEL_21:

  return v13;
}

void __81__WFContentLocation_FileProviders__getContentLocationFromFile_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 40), "contentLocationForFile:", a2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, _QWORD))(v2 + 16))(v2, v3, 0);

  }
  else
  {
    (*(void (**)(_QWORD))(v2 + 16))(*(_QWORD *)(a1 + 32));
  }
}

- (WFContentLocation)initWithIdentifier:(id)a3
{
  return -[WFContentLocation initWithIdentifier:promptingBehaviour:](self, "initWithIdentifier:promptingBehaviour:", a3, 1);
}

- (WFContentLocation)initWithIdentifier:(id)a3 promptingBehaviour:(unint64_t)a4
{
  id v8;
  WFContentLocation *v9;
  WFContentLocation *v10;
  WFContentLocation *v11;
  void *v13;
  objc_super v14;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFContentLocation.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  }
  v14.receiver = self;
  v14.super_class = (Class)WFContentLocation;
  v9 = -[WFContentLocation init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    v10->_promptingBehaviour = a4;
    v11 = v10;
  }

  return v10;
}

- (unint64_t)managedLevel
{
  return 0;
}

- (id)localizedMDMDescription
{
  return 0;
}

- (NSString)localizedTitle
{
  NSString *localizedTitle;
  void *v4;
  void *v5;
  NSString *v6;
  NSString *v7;
  NSObject *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  localizedTitle = self->_localizedTitle;
  if (localizedTitle)
    return localizedTitle;
  -[WFContentLocation identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentLocationLocalizations localizedTitleForContentLocationWithIdentifier:](WFContentLocationLocalizations, "localizedTitleForContentLocationWithIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (NSString *)objc_msgSend(v5, "copy");
    v7 = self->_localizedTitle;
    self->_localizedTitle = v6;

    localizedTitle = self->_localizedTitle;
    return localizedTitle;
  }
  getWFWorkflowExecutionLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
  {
    -[WFContentLocation identifier](self, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 136315394;
    v12 = "-[WFContentLocation localizedTitle]";
    v13 = 2114;
    v14 = v10;
    _os_log_impl(&dword_20BBAD000, v9, OS_LOG_TYPE_FAULT, "%s Missing localization for content destination with identifier %{public}@", (uint8_t *)&v11, 0x16u);

  }
  return (NSString *)0;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[WFContentLocation identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[WFContentLocation identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (WFContentLocation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  WFContentLocation *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    self = -[WFContentLocation initWithIdentifier:promptingBehaviour:](self, "initWithIdentifier:promptingBehaviour:", v5, objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("promptingBehaviour")));
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[WFContentLocation identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("identifier"));

  objc_msgSend(v5, "encodeInteger:forKey:", -[WFContentLocation promptingBehaviour](self, "promptingBehaviour"), CFSTR("promptingBehaviour"));
}

- (id)wfSerializedRepresentation
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContentLocation identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v4, CFSTR("identifier"));

  return v3;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContentLocation identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, identifier: %@, promptingBehaviour: %tu>"), v5, self, v6, -[WFContentLocation promptingBehaviour](self, "promptingBehaviour"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)promptingBehaviour
{
  return self->_promptingBehaviour;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)objectWithWFSerializedRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  __objc2_class *v7;
  NSObject *v8;
  void *v9;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "wfObjectOfClass:forKeyPath:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.shortcuts.appdestination")))
    {
      v7 = WFAppContentLocation;
LABEL_11:
      -[__objc2_class objectWithWFSerializedRepresentation:](v7, "objectWithWFSerializedRepresentation:", v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.shortcuts.accountDestination")))
    {
      v7 = WFAccountContentLocation;
      goto LABEL_11;
    }
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.shortcuts.urldestination")))
    {
      v7 = WFURLContentLocation;
      goto LABEL_11;
    }
    +[WFContentLocationLocalizations localizedTitleForContentLocationWithIdentifier:](WFContentLocationLocalizations, "localizedTitleForContentLocationWithIdentifier:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:promptingBehaviour:", v6, 0);
    }
    else
    {
      getWFWorkflowExecutionLogObject();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = 136315394;
        v15 = "+[WFContentLocation objectWithWFSerializedRepresentation:]";
        v16 = 2114;
        v17 = v6;
        _os_log_impl(&dword_20BBAD000, v13, OS_LOG_TYPE_ERROR, "%s Returning WFUnsupportedContentLocation with identifier %{public}@", (uint8_t *)&v14, 0x16u);
      }

      +[WFUnsupportedContentLocation locationWithIdentifier:serializedRepresentation:](WFUnsupportedContentLocation, "locationWithIdentifier:serializedRepresentation:", v6, v4);
      v12 = objc_claimAutoreleasedReturnValue();
    }
    v9 = (void *)v12;

  }
  else
  {
    getWFWorkflowExecutionLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v14 = 136315138;
      v15 = "+[WFContentLocation objectWithWFSerializedRepresentation:]";
      _os_log_impl(&dword_20BBAD000, v8, OS_LOG_TYPE_ERROR, "%s Failed to decode identifier from WFContentLocation", (uint8_t *)&v14, 0xCu);
    }

    v9 = 0;
  }
LABEL_12:

  return v9;
}

+ (id)allContentLocationClasses
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v6, 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3, v6, v7, v8, v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (WFContentLocation)airdropLocation
{
  return -[WFContentLocation initWithIdentifier:promptingBehaviour:]([WFContentLocation alloc], "initWithIdentifier:promptingBehaviour:", CFSTR("com.apple.shortcuts.airdropDestination"), 0);
}

+ (WFContentLocation)appleScriptLocation
{
  return -[WFContentLocation initWithIdentifier:]([WFContentLocation alloc], "initWithIdentifier:", CFSTR("com.apple.shortcuts.appleScriptDestination"));
}

+ (WFContentLocation)cellularDataStatisticsLocation
{
  return -[WFContentLocation initWithIdentifier:promptingBehaviour:]([WFContentLocation alloc], "initWithIdentifier:promptingBehaviour:", CFSTR("com.apple.shortcuts.cellularDataStatisticsDestination"), 2);
}

+ (WFContentLocation)clipboardLocation
{
  return -[WFContentLocation initWithIdentifier:]([WFContentLocation alloc], "initWithIdentifier:", CFSTR("com.apple.shortcuts.clipboardDestination"));
}

+ (WFContentLocation)controlOtherAppsLocation
{
  return -[WFContentLocation initWithIdentifier:]([WFContentLocation alloc], "initWithIdentifier:", CFSTR("com.apple.shortcuts.controlOtherApps"));
}

+ (WFContentLocation)dataRoamingLocation
{
  return -[WFContentLocation initWithIdentifier:promptingBehaviour:]([WFContentLocation alloc], "initWithIdentifier:promptingBehaviour:", CFSTR("com.apple.shortcuts.dataRoamingDestination"), 2);
}

+ (WFContentLocation)defaultLineLocation
{
  return -[WFContentLocation initWithIdentifier:promptingBehaviour:]([WFContentLocation alloc], "initWithIdentifier:promptingBehaviour:", CFSTR("com.apple.shortcuts.defaultLineDestination"), 2);
}

+ (WFContentLocation)focusLocation
{
  return -[WFContentLocation initWithIdentifier:promptingBehaviour:]([WFContentLocation alloc], "initWithIdentifier:promptingBehaviour:", CFSTR("com.apple.shortcuts.focusDestination"), 2);
}

+ (WFContentLocation)genericLocation
{
  return -[WFContentLocation initWithIdentifier:]([WFContentLocation alloc], "initWithIdentifier:", CFSTR("com.apple.shortcuts.genericDestination"));
}

+ (WFContentLocation)javaScript
{
  return -[WFContentLocation initWithIdentifier:promptingBehaviour:]([WFContentLocation alloc], "initWithIdentifier:promptingBehaviour:", CFSTR("com.apple.shortcuts.javaScript"), 1);
}

+ (WFContentLocation)javaScriptForAutomationLocation
{
  return -[WFContentLocation initWithIdentifier:]([WFContentLocation alloc], "initWithIdentifier:", CFSTR("com.apple.shortcuts.javaScriptForAutomationDestination"));
}

+ (WFContentLocation)microphoneLocation
{
  return -[WFContentLocation initWithIdentifier:promptingBehaviour:]([WFContentLocation alloc], "initWithIdentifier:promptingBehaviour:", CFSTR("com.apple.shortcuts.microphoneDestination"), 2);
}

+ (WFContentLocation)networkLocation
{
  return -[WFContentLocation initWithIdentifier:]([WFContentLocation alloc], "initWithIdentifier:", CFSTR("com.apple.shortcuts.networkDestination"));
}

+ (WFContentLocation)notificationLocation
{
  return -[WFContentLocation initWithIdentifier:promptingBehaviour:]([WFContentLocation alloc], "initWithIdentifier:promptingBehaviour:", CFSTR("com.apple.shortcuts.notificationDestination"), 2);
}

+ (WFContentLocation)onScreenContentLocation
{
  return -[WFContentLocation initWithIdentifier:promptingBehaviour:]([WFContentLocation alloc], "initWithIdentifier:promptingBehaviour:", CFSTR("com.apple.shortcuts.onScreenContentDestination"), 2);
}

+ (WFContentLocation)locationLocation
{
  return -[WFContentLocation initWithIdentifier:]([WFContentLocation alloc], "initWithIdentifier:", CFSTR("com.apple.shortcuts.locationDestination"));
}

+ (WFContentLocation)personalHotspotPasswordLocation
{
  return -[WFContentLocation initWithIdentifier:promptingBehaviour:]([WFContentLocation alloc], "initWithIdentifier:promptingBehaviour:", CFSTR("com.apple.shortcuts.personalHotspotPasswordDestination"), 2);
}

+ (WFContentLocation)printLocation
{
  return -[WFContentLocation initWithIdentifier:]([WFContentLocation alloc], "initWithIdentifier:", CFSTR("com.apple.shortcuts.printDestination"));
}

+ (WFContentLocation)shareExtensionLocation
{
  return -[WFContentLocation initWithIdentifier:promptingBehaviour:]([WFContentLocation alloc], "initWithIdentifier:promptingBehaviour:", CFSTR("com.apple.shortcuts.shareExtensionDestination"), 0);
}

+ (WFContentLocation)shellLocation
{
  return -[WFContentLocation initWithIdentifier:]([WFContentLocation alloc], "initWithIdentifier:", CFSTR("com.apple.shortcuts.shellDestination"));
}

+ (WFContentLocation)shortcutsAppLocation
{
  return (WFContentLocation *)+[WFAppContentLocation locationWithSystemAppBundleIdentifier:](WFAppContentLocation, "locationWithSystemAppBundleIdentifier:", *MEMORY[0x24BEC17D8]);
}

+ (WFContentLocation)screenshotLocation
{
  return -[WFContentLocation initWithIdentifier:]([WFContentLocation alloc], "initWithIdentifier:", CFSTR("com.apple.shortcuts.screenshotDestination"));
}

+ (WFContentLocation)speechRecognitionLocation
{
  return -[WFContentLocation initWithIdentifier:promptingBehaviour:]([WFContentLocation alloc], "initWithIdentifier:promptingBehaviour:", CFSTR("com.apple.shortcuts.speechRecognitionDestination"), 2);
}

+ (WFContentLocation)toggleLineLocation
{
  return -[WFContentLocation initWithIdentifier:promptingBehaviour:]([WFContentLocation alloc], "initWithIdentifier:promptingBehaviour:", CFSTR("com.apple.shortcuts.toggleCellularLineDestination"), 2);
}

+ (WFContentLocation)wallpaperLocation
{
  return -[WFContentLocation initWithIdentifier:promptingBehaviour:]([WFContentLocation alloc], "initWithIdentifier:promptingBehaviour:", CFSTR("com.apple.shortcuts.wallpaperDestination"), 2);
}

+ (WFContentLocation)webpagesLocation
{
  return -[WFContentLocation initWithIdentifier:]([WFContentLocation alloc], "initWithIdentifier:", CFSTR("com.apple.shortcuts.webpagesDestination"));
}

+ (WFContentLocation)windowsLocation
{
  return -[WFContentLocation initWithIdentifier:]([WFContentLocation alloc], "initWithIdentifier:", CFSTR("com.apple.shortcuts.windowsDestination"));
}

+ (WFContentLocation)locationWithNotesAccountIdentifier:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = a3;
  v4 = objc_alloc(MEMORY[0x24BDD9BD0]);
  v5 = (void *)objc_msgSend(v4, "initWithBundleIdentifier:", *MEMORY[0x24BEC1720]);
  objc_msgSend(MEMORY[0x24BDD9BF0], "sharedResolver");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resolvedAppMatchingDescriptor:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && !objc_msgSend(v3, "isEqualToString:", CFSTR("LocalAccount")))
  {
    +[WFAccountContentLocation locationWithAccountIdentifier:appDescriptor:](WFAccountContentLocation, "locationWithAccountIdentifier:appDescriptor:", v3, v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[WFAppContentLocation locationWithAppDescriptor:managedLevel:](WFAppContentLocation, "locationWithAppDescriptor:managedLevel:", v7, 0);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;

  return (WFContentLocation *)v9;
}

+ (WFContentLocation)locationWithCalendarSource:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = objc_alloc(MEMORY[0x24BDD9BD0]);
  v5 = (void *)objc_msgSend(v4, "initWithBundleIdentifier:", *MEMORY[0x24BEC16A0]);
  objc_msgSend(MEMORY[0x24BDD9BF0], "sharedResolver");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resolvedAppMatchingDescriptor:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v3, "sourceType");
  if (v8 != 5 && v8)
  {
    objc_msgSend(v3, "sourceIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFAccountContentLocation locationWithAccountIdentifier:appDescriptor:](WFAccountContentLocation, "locationWithAccountIdentifier:appDescriptor:", v10, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[WFAppContentLocation locationWithAppDescriptor:managedLevel:](WFAppContentLocation, "locationWithAppDescriptor:managedLevel:", v7, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (WFContentLocation *)v9;
}

@end
