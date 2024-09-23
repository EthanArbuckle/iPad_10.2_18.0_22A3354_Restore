@implementation DOCIntentLocation

+ (DOCIntentLocation)intentLocationWithIdentifier:(id)a3 displayString:(id)a4 type:(id)a5
{
  id v7;
  id v8;
  id v9;
  DOCIntentLocation *v10;
  void *v11;
  DOCIntentLocation *v12;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = [DOCIntentLocation alloc];
  +[DOCIntentLocation imageForType:](DOCIntentLocation, "imageForType:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[DOCIntentLocation initWithIdentifier:displayString:subtitleString:displayImage:](v10, "initWithIdentifier:displayString:subtitleString:displayImage:", v9, v8, 0, v11);

  -[DOCIntentLocation setLocationType:](v12, "setLocationType:", v7);
  -[DOCIntentLocation setLocationIdentifier:](v12, "setLocationIdentifier:", v9);

  return v12;
}

+ (DOCIntentLocation)intentLocationWithTag:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[DOCIntentLocation intentLocationWithIdentifier:displayString:type:](DOCIntentLocation, "intentLocationWithIdentifier:displayString:type:", v4, v5, CFSTR("tag"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (DOCIntentLocation *)v6;
}

+ (DOCIntentLocation)intentLocationWithItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  objc_msgSend(v3, "itemIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[DOCIntentLocation intentLocationWithIdentifier:displayString:type:](DOCIntentLocation, "intentLocationWithIdentifier:displayString:type:", v4, v5, CFSTR("location"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "itemID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLocationIdentifier:", v8);

  objc_msgSend(v3, "itemID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "providerDomainID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDomainIdentifier:", v10);

  return (DOCIntentLocation *)v6;
}

+ (id)imageForType:(id)a3
{
  __CFString *v3;
  __CFString *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  NSObject **v10;

  v3 = (__CFString *)a3;
  v4 = v3;
  if (v3 == CFSTR("location"))
    goto LABEL_12;
  if (v3 == CFSTR("tag"))
  {
    v7 = (void *)MEMORY[0x24BDD9DA8];
    v8 = CFSTR("circle");
    goto LABEL_17;
  }
  if (v3 == CFSTR("recents"))
  {
    v7 = (void *)MEMORY[0x24BDD9DA8];
    v8 = CFSTR("clock");
    goto LABEL_17;
  }
  if (v3 == CFSTR("shared"))
  {
    v7 = (void *)MEMORY[0x24BDD9DA8];
    v8 = CFSTR("folder.badge.person.crop");
    goto LABEL_17;
  }
  if (v3 == CFSTR("downloads"))
  {
    v7 = (void *)MEMORY[0x24BDD9DA8];
    v8 = CFSTR("arrow.down.circle");
    goto LABEL_17;
  }
  if (v3 == CFSTR("customFolder"))
  {
LABEL_12:
    v7 = (void *)MEMORY[0x24BDD9DA8];
    v8 = CFSTR("folder");
LABEL_17:
    objc_msgSend(v7, "systemImageNamed:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  v5 = *MEMORY[0x24BE2DF90];
  if (!*MEMORY[0x24BE2DF90])
  {
    v10 = (NSObject **)MEMORY[0x24BE2DF90];
    DOCInitLogging();
    v5 = *v10;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    +[DOCIntentLocation(DOCIntentsExtensions) imageForType:].cold.1((uint64_t)v4, v5);
  v6 = 0;
LABEL_18:

  return v6;
}

@end
