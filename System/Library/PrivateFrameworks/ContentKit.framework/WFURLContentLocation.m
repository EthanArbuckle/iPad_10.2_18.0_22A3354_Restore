@implementation WFURLContentLocation

- (WFURLContentLocation)initWithHostnames:(id)a3 allowsAnyHostname:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  WFURLContentLocation *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  WFURLContentLocation *v14;
  objc_super v16;
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;

  v4 = a4;
  v19 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WFURLContentLocation;
  v8 = -[WFContentLocation initWithIdentifier:promptingBehaviour:](&v16, sel_initWithIdentifier_promptingBehaviour_, CFSTR("com.apple.shortcuts.urldestination"), 1);
  if (v8)
  {
    v9 = objc_msgSend(v7, "count");
    if (v4)
    {
      if (!v9)
      {
        objc_msgSend(v7, "count");
        goto LABEL_12;
      }
      getWFSecurityLogObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        goto LABEL_10;
      *(_DWORD *)buf = 136315138;
      v18 = "-[WFURLContentLocation initWithHostnames:allowsAnyHostname:]";
      v11 = "%s Creating a WFURLContentLocation with 1 or more hostname(s), but allowsAnyHostname was also set to YES.";
      v12 = v10;
      v13 = OS_LOG_TYPE_FAULT;
    }
    else
    {
      if (v9)
      {
LABEL_12:
        objc_storeStrong((id *)&v8->_hostnames, a3);
        v8->_allowsAnyHostname = v4;
        v14 = v8;
        goto LABEL_13;
      }
      getWFSecurityLogObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
LABEL_10:

        goto LABEL_12;
      }
      *(_DWORD *)buf = 136315138;
      v18 = "-[WFURLContentLocation initWithHostnames:allowsAnyHostname:]";
      v11 = "%s Creating a WFURLContentLocation with no hostname(s)";
      v12 = v10;
      v13 = OS_LOG_TYPE_ERROR;
    }
    _os_log_impl(&dword_20BBAD000, v12, v13, v11, buf, 0xCu);
    goto LABEL_10;
  }
LABEL_13:

  return v8;
}

- (WFURLContentLocation)initWithHostnames:(id)a3
{
  return -[WFURLContentLocation initWithHostnames:allowsAnyHostname:](self, "initWithHostnames:allowsAnyHostname:", a3, 0);
}

- (id)hostnamesSortedAlphabetically
{
  void *v2;
  void *v3;
  void *v4;

  -[WFURLContentLocation hostnames](self, "hostnames");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedArrayUsingSelector:", sel_localizedStandardCompare_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)localizedTitle
{
  NSString *localizedTitle;
  NSString *v3;
  void *v6;
  void *v7;
  NSString *v8;
  NSString *v9;

  localizedTitle = self->_localizedTitle;
  if (!localizedTitle)
  {
    if (self->_allowsAnyHostname)
    {
      WFLocalizedString(CFSTR("Any URL"));
      v3 = (NSString *)objc_claimAutoreleasedReturnValue();
      return v3;
    }
    -[WFURLContentLocation hostnamesSortedAlphabetically](self, "hostnamesSortedAlphabetically");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "if_map:", &__block_literal_global);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1640], "localizedStringByJoiningStrings:", v7);
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    v9 = self->_localizedTitle;
    self->_localizedTitle = v8;

    localizedTitle = self->_localizedTitle;
  }
  v3 = localizedTitle;
  return v3;
}

- (unint64_t)managedLevel
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;

  if (self->_allowsAnyHostname)
    return 0;
  +[WFManagedConfigurationProfile defaultProfile](WFManagedConfigurationProfile, "defaultProfile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFURLContentLocation hostnames](self, "hostnames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "if_compactMap:", &__block_literal_global_121);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "managedLevelForContentOfURLs:", v7);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  int v8;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[WFURLContentLocation hostnames](self, "hostnames");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hostnames");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToSet:", v6))
    {
      v7 = -[WFURLContentLocation allowsAnyHostname](self, "allowsAnyHostname");
      v8 = v7 ^ objc_msgSend(v4, "allowsAnyHostname") ^ 1;
    }
    else
    {
      LOBYTE(v8) = 0;
    }

  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  _BOOL4 v5;
  uint64_t v6;
  unint64_t v7;

  -[WFURLContentLocation hostnames](self, "hostnames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[WFURLContentLocation allowsAnyHostname](self, "allowsAnyHostname");
  v6 = 3133065982;
  if (v5)
    v6 = 3405691582;
  v7 = v6 ^ v4;

  return v7;
}

- (WFURLContentLocation)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  WFURLContentLocation *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDBCF20];
  v5 = a3;
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("hostnames"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("allowsAnyHostname"));
  v10 = -[WFURLContentLocation initWithHostnames:allowsAnyHostname:](self, "initWithHostnames:allowsAnyHostname:", v8, v9);

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFURLContentLocation;
  v4 = a3;
  -[WFContentLocation encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[WFURLContentLocation hostnames](self, "hostnames", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("hostnames"));

  objc_msgSend(v4, "encodeBool:forKey:", -[WFURLContentLocation allowsAnyHostname](self, "allowsAnyHostname"), CFSTR("allowsAnyHostname"));
}

- (id)wfSerializedRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x24BDBCED8];
  v9.receiver = self;
  v9.super_class = (Class)WFURLContentLocation;
  -[WFContentLocation wfSerializedRepresentation](&v9, sel_wfSerializedRepresentation);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithDictionary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFURLContentLocation hostnamesSortedAlphabetically](self, "hostnamesSortedAlphabetically");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v6, CFSTR("hostnames"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[WFURLContentLocation allowsAnyHostname](self, "allowsAnyHostname"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v7, CFSTR("allowsAnyHostname"));

  return v5;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDD1640];
  -[WFURLContentLocation hostnamesSortedAlphabetically](self, "hostnamesSortedAlphabetically");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringByJoiningStrings:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, hostnames: %@, allowsAnyHostname: %d>"), v5, self, v8, -[WFURLContentLocation allowsAnyHostname](self, "allowsAnyHostname"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (BOOL)matches:(id)a3
{
  id v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (!v4)
  {
    v7 = 0;
    v6 = 0;
    v5 = 0;
LABEL_8:

    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = 0;
    v5 = 0;
    v7 = v4;
    goto LABEL_8;
  }
  if (!-[WFURLContentLocation allowsAnyHostname](self, "allowsAnyHostname"))
  {
    -[WFURLContentLocation hostnames](self, "hostnames");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hostnames");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v7, "isEqualToSet:", v8);

    v6 = v4;
    goto LABEL_8;
  }
  v5 = 1;
  v6 = v4;
LABEL_9:

  return v5;
}

- (NSSet)hostnames
{
  return self->_hostnames;
}

- (BOOL)allowsAnyHostname
{
  return self->_allowsAnyHostname;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostnames, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
}

id __36__WFURLContentLocation_managedLevel__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setScheme:", CFSTR("https"));
  objc_msgSend(v3, "setHost:", v2);

  objc_msgSend(v3, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __38__WFURLContentLocation_localizedTitle__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  v2 = a2;
  +[WFContentLocationLocalizations localizedTitleForContentLocationWithHostname:](WFContentLocationLocalizations, "localizedTitleForContentLocationWithHostname:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = v2;
  v5 = v3;

  return v5;
}

+ (WFURLContentLocation)locationWithHostname:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v5, "initWithHostnames:", v6);
  return (WFURLContentLocation *)v7;
}

+ (WFURLContentLocation)locationWithHostnames:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithHostnames:", v4);

  return (WFURLContentLocation *)v5;
}

+ (WFURLContentLocation)locationWithURL:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "locationWithURLs:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (WFURLContentLocation *)v7;
}

+ (WFURLContentLocation)locationWithURLs:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  char v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v7)
  {
    v8 = v7;
    v20 = 0;
    v9 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v11, "scheme");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "lowercaseString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("data"));

        if ((v14 & 1) == 0)
        {
          objc_msgSend(v11, "host");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            objc_msgSend(v11, "host");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "addObject:", v16);

          }
          else
          {
            if (a4)
            {
              objc_msgSend(a1, "invalidHostnameErrorForInputURL:", v11);
              *a4 = (id)objc_claimAutoreleasedReturnValue();
            }
            v20 = 1;
          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v8);
  }
  else
  {
    v20 = 0;
  }

  v17 = 0;
  if (objc_msgSend(v21, "count") && (v20 & 1) == 0)
    v17 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithHostnames:", v21);

  return (WFURLContentLocation *)v17;
}

+ (id)locationMatchingAnyHostname
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithHostnames:allowsAnyHostname:", v3, 1);

  return v4;
}

+ (id)invalidHostnameErrorForInputURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  WFLocalizedString(CFSTR("Invalid URL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && (unint64_t)objc_msgSend(v5, "length") >= 0x1A)
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v5, "substringToIndex:", 25);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@…"), v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v8;
  }
  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("\"““"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x24BDD17C8];
  WFLocalizedString(CFSTR("The URL “%@” is missing a hostname."));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringWithFormat:", v12, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x24BDD1540];
  v15 = *MEMORY[0x24BDD0FC8];
  v19[0] = *MEMORY[0x24BDD0FD8];
  v19[1] = v15;
  v20[0] = v4;
  v20[1] = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("WFURLContentLocationErrorDomain"), 0, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
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
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "wfObjectOfClass:forKeyPath:", objc_opt_class(), CFSTR("hostnames"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "wfObjectOfClass:forKeyPath:", objc_opt_class(), CFSTR("allowsAnyHostname"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

    v8 = objc_alloc((Class)a1);
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithHostnames:allowsAnyHostname:", v9, v7);

  }
  else
  {
    getWFWorkflowExecutionLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v13 = 136315138;
      v14 = "+[WFURLContentLocation objectWithWFSerializedRepresentation:]";
      _os_log_impl(&dword_20BBAD000, v11, OS_LOG_TYPE_ERROR, "%s Failed to decode hostnames from WFURLContentLocation", (uint8_t *)&v13, 0xCu);
    }

    v10 = 0;
  }

  return v10;
}

+ (WFURLContentLocation)evernoteLocation
{
  return +[WFURLContentLocation locationWithHostname:](WFURLContentLocation, "locationWithHostname:", CFSTR("evernote.com"));
}

+ (WFURLContentLocation)giphyLocation
{
  return +[WFURLContentLocation locationWithHostname:](WFURLContentLocation, "locationWithHostname:", CFSTR("api.giphy.com"));
}

+ (WFURLContentLocation)imgurLocation
{
  return +[WFURLContentLocation locationWithHostname:](WFURLContentLocation, "locationWithHostname:", CFSTR("api.imgur.com"));
}

+ (WFURLContentLocation)instapaperLocation
{
  return +[WFURLContentLocation locationWithHostname:](WFURLContentLocation, "locationWithHostname:", CFSTR("instapaper.com"));
}

+ (WFURLContentLocation)pinboardLocation
{
  return +[WFURLContentLocation locationWithHostname:](WFURLContentLocation, "locationWithHostname:", CFSTR("api.pinboard.in"));
}

+ (WFURLContentLocation)pocketLocation
{
  return +[WFURLContentLocation locationWithHostname:](WFURLContentLocation, "locationWithHostname:", CFSTR("getpocket.com"));
}

+ (WFURLContentLocation)todoistLocation
{
  return +[WFURLContentLocation locationWithHostname:](WFURLContentLocation, "locationWithHostname:", CFSTR("todoist.com"));
}

+ (WFURLContentLocation)trelloLocation
{
  return +[WFURLContentLocation locationWithHostname:](WFURLContentLocation, "locationWithHostname:", CFSTR("api.trello.com"));
}

+ (WFURLContentLocation)tumblrLocation
{
  return +[WFURLContentLocation locationWithHostname:](WFURLContentLocation, "locationWithHostname:", CFSTR("tumblr.com"));
}

+ (WFURLContentLocation)wordpressLocation
{
  return +[WFURLContentLocation locationWithHostname:](WFURLContentLocation, "locationWithHostname:", CFSTR("wordpress.com"));
}

@end
