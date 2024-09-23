@implementation MRClient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extendedBundleIdentifierHierarchy, 0);
  objc_storeStrong((id *)&self->_appIcon, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_parentApplicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
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

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setProcessIdentifier:", -[MRClient processIdentifier](self, "processIdentifier"));
  objc_msgSend(v5, "setProcessUserIdentifier:", -[MRClient processUserIdentifier](self, "processUserIdentifier"));
  objc_msgSend(v5, "setVisibility:", -[MRClient visibility](self, "visibility"));
  -[MRClient tintColor](self, "tintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setTintColor:", v7);

  -[MRClient bundleIdentifier](self, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  objc_msgSend(v5, "setBundleIdentifier:", v9);

  -[MRClient parentApplicationBundleIdentifier](self, "parentApplicationBundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copyWithZone:", a3);
  objc_msgSend(v5, "setParentApplicationBundleIdentifier:", v11);

  -[MRClient displayName](self, "displayName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copyWithZone:", a3);
  objc_msgSend(v5, "setDisplayName:", v13);

  -[MRClient extendedBundleIdentifierHierarchy](self, "extendedBundleIdentifierHierarchy");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "copyWithZone:", a3);
  objc_msgSend(v5, "setExtendedBundleIdentifierHierarchy:", v15);

  -[MRClient appIcon](self, "appIcon");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "copyWithZone:", a3);
  objc_msgSend(v5, "setAppIcon:", v17);

  return v5;
}

- (int)processIdentifier
{
  return self->_processIdentifier;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)parentApplicationBundleIdentifier
{
  return self->_parentApplicationBundleIdentifier;
}

- (NSArray)extendedBundleIdentifierHierarchy
{
  return self->_extendedBundleIdentifierHierarchy;
}

- (NSURL)appIcon
{
  return self->_appIcon;
}

- (int64_t)visibility
{
  return self->_visibility;
}

- (unsigned)processUserIdentifier
{
  return self->_processUserIdentifier;
}

- (MRColorComponents)tintColor
{
  return self->_tintColor;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setProcessUserIdentifier:(unsigned int)a3
{
  self->_processUserIdentifier = a3;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setTintColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setAppIcon:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setVisibility:(int64_t)a3
{
  self->_visibility = a3;
}

- (void)setProcessIdentifier:(int)a3
{
  self->_processIdentifier = a3;
}

- (void)setParentApplicationBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setExtendedBundleIdentifierHierarchy:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)isValid
{
  BOOL v3;
  void *v4;

  if (-[MRClient processIdentifier](self, "processIdentifier") > 0)
    return 1;
  -[MRClient bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v4, "length") != 0;

  return v3;
}

- (BOOL)isLocal
{
  void *v3;

  +[MRClient localClient](MRClient, "localClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[MRClient isEqual:](self, "isEqual:", v3);

  return (char)self;
}

- (BOOL)isEqual:(id)a3
{
  MRClient *v4;
  MRClient *v5;
  int v6;
  char v7;
  BOOL v8;
  char v9;
  void *v10;
  void *v11;
  char v12;

  v4 = (MRClient *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (-[MRClient processIdentifier](v5, "processIdentifier") < 1
        || -[MRClient processIdentifier](self, "processIdentifier") < 1)
      {
        v8 = 0;
        v7 = 1;
      }
      else
      {
        v6 = -[MRClient processIdentifier](v5, "processIdentifier");
        v7 = 0;
        v8 = v6 == -[MRClient processIdentifier](self, "processIdentifier");
      }
      -[MRClient bundleIdentifier](v5, "bundleIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRClient bundleIdentifier](self, "bundleIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqualToString:", v11);

      if (v8)
        v9 = 1;
      else
        v9 = v7 & v12;

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (BOOL)hasPlaceholder
{
  void *v3;
  char v4;
  void *v5;
  char v6;
  void *v7;
  char v8;
  void *v10;
  char v11;

  -[MRClient bundleIdentifier](self, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("(System Media Application)"));

  if ((v4 & 1) != 0)
    return 1;
  -[MRClient bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("(System Podcast Application)"));

  if ((v6 & 1) != 0)
    return 1;
  -[MRClient bundleIdentifier](self, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("(System Books Application)"));

  if ((v8 & 1) != 0)
    return 1;
  -[MRClient bundleIdentifier](self, "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("(System Classical Room Application)"));

  return v11;
}

+ (MRClient)localClient
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __23__MRClient_localClient__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (localClient_onceToken != -1)
    dispatch_once(&localClient_onceToken, block);
  return (MRClient *)(id)localClient_client;
}

- (MRClient)initWithProtobuf:(id)a3
{
  id v4;
  MRClient *v5;
  void *v6;
  uint64_t v7;
  NSString *bundleIdentifier;
  void *v9;
  uint64_t v10;
  NSString *parentApplicationBundleIdentifier;
  unsigned int v12;
  int64_t v13;
  MRColorComponents *v14;
  void *v15;
  uint64_t v16;
  MRColorComponents *tintColor;
  void *v18;
  uint64_t v19;
  NSString *displayName;
  void *v21;
  uint64_t v22;
  NSArray *extendedBundleIdentifierHierarchy;
  id v24;
  void *v25;
  uint64_t v26;
  NSURL *appIcon;
  MRClient *v28;
  objc_super v30;

  v4 = a3;
  if (v4)
  {
    v30.receiver = self;
    v30.super_class = (Class)MRClient;
    v5 = -[MRClient init](&v30, sel_init);
    if (v5)
    {
      v5->_processIdentifier = objc_msgSend(v4, "processIdentifier");
      objc_msgSend(v4, "bundleIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "copy");
      bundleIdentifier = v5->_bundleIdentifier;
      v5->_bundleIdentifier = (NSString *)v7;

      objc_msgSend(v4, "parentApplicationBundleIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "copy");
      parentApplicationBundleIdentifier = v5->_parentApplicationBundleIdentifier;
      v5->_parentApplicationBundleIdentifier = (NSString *)v10;

      v5->_processUserIdentifier = objc_msgSend(v4, "processUserIdentifier");
      v12 = objc_msgSend(v4, "nowPlayingVisibility");
      if (v12 >= 4)
        v13 = 0;
      else
        v13 = v12;
      v5->_visibility = v13;
      v14 = [MRColorComponents alloc];
      objc_msgSend(v4, "tintColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[MRColorComponents initWithProtobuf:](v14, "initWithProtobuf:", v15);
      tintColor = v5->_tintColor;
      v5->_tintColor = (MRColorComponents *)v16;

      objc_msgSend(v4, "displayName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "copy");
      displayName = v5->_displayName;
      v5->_displayName = (NSString *)v19;

      objc_msgSend(v4, "extendedBundleIdentifierHierarchys");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "copy");
      extendedBundleIdentifierHierarchy = v5->_extendedBundleIdentifierHierarchy;
      v5->_extendedBundleIdentifierHierarchy = (NSArray *)v22;

      if ((objc_msgSend(v4, "hasIconURL") & 1) != 0)
      {
        v24 = objc_alloc(MEMORY[0x1E0C99E98]);
        objc_msgSend(v4, "iconURL");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v24, "initWithString:", v25);
        appIcon = v5->_appIcon;
        v5->_appIcon = (NSURL *)v26;

      }
      else
      {
        v25 = v5->_appIcon;
        v5->_appIcon = 0;
      }

    }
    self = v5;
    v28 = self;
  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_bundleIdentifier, "hash") ^ self->_processIdentifier;
}

- (id)description
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  MRClient *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v20 = self;
  -[MRClient bundleIdentifierHierarchy](self, "bundleIdentifierHierarchy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v22;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v9++);
        v11 = objc_msgSend(v4, "count");
        v12 = CFSTR("/");
        if (v9 + v7 == v11)
          v12 = &stru_1E30D5AF8;
        objc_msgSend(v3, "appendFormat:", CFSTR("%@%@"), v10, v12);
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      v7 += v9;
    }
    while (v6);
  }
  objc_msgSend(v3, "appendFormat:", CFSTR("-%d"), -[MRClient processIdentifier](v20, "processIdentifier"));
  -[MRClient displayName](v20, "displayName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[MRClient displayName](v20, "displayName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" (%@)"), v14);

  }
  -[MRClient appIcon](v20, "appIcon");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[MRClient appIcon](v20, "appIcon");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "absoluteString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("[%@]"), v17);

  }
  v18 = (void *)objc_msgSend(v3, "copy");

  return v18;
}

- (NSArray)bundleIdentifierHierarchy
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[MRClient bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MRClient bundleIdentifier](self, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  -[MRClient parentApplicationBundleIdentifier](self, "parentApplicationBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MRClient parentApplicationBundleIdentifier](self, "parentApplicationBundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
  -[MRClient extendedBundleIdentifierHierarchy](self, "extendedBundleIdentifierHierarchy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[MRClient extendedBundleIdentifierHierarchy](self, "extendedBundleIdentifierHierarchy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v9);

  }
  v10 = (void *)objc_msgSend(v3, "copy");

  return (NSArray *)v10;
}

- (_MRNowPlayingClientProtobuf)protobuf
{
  _MRNowPlayingClientProtobuf *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = objc_alloc_init(_MRNowPlayingClientProtobuf);
  -[_MRNowPlayingClientProtobuf setProcessIdentifier:](v3, "setProcessIdentifier:", -[MRClient processIdentifier](self, "processIdentifier"));
  -[_MRNowPlayingClientProtobuf setHasProcessIdentifier:](v3, "setHasProcessIdentifier:", -[MRClient processIdentifier](self, "processIdentifier") > 0);
  -[MRClient bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRNowPlayingClientProtobuf setBundleIdentifier:](v3, "setBundleIdentifier:", v4);

  -[MRClient parentApplicationBundleIdentifier](self, "parentApplicationBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRNowPlayingClientProtobuf setParentApplicationBundleIdentifier:](v3, "setParentApplicationBundleIdentifier:", v5);

  -[_MRNowPlayingClientProtobuf setProcessUserIdentifier:](v3, "setProcessUserIdentifier:", -[MRClient processUserIdentifier](self, "processUserIdentifier"));
  -[_MRNowPlayingClientProtobuf setHasProcessUserIdentifier:](v3, "setHasProcessUserIdentifier:", -[MRClient processUserIdentifier](self, "processUserIdentifier") != 0);
  v6 = -[MRClient visibility](self, "visibility");
  if (v6 >= 4)
    v7 = 0;
  else
    v7 = v6;
  -[_MRNowPlayingClientProtobuf setNowPlayingVisibility:](v3, "setNowPlayingVisibility:", v7);
  -[_MRNowPlayingClientProtobuf setHasNowPlayingVisibility:](v3, "setHasNowPlayingVisibility:", -[MRClient visibility](self, "visibility") != 0);
  -[MRClient tintColor](self, "tintColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "protobuf");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRNowPlayingClientProtobuf setTintColor:](v3, "setTintColor:", v9);

  -[MRClient displayName](self, "displayName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRNowPlayingClientProtobuf setDisplayName:](v3, "setDisplayName:", v10);

  -[MRClient extendedBundleIdentifierHierarchy](self, "extendedBundleIdentifierHierarchy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");
  -[_MRNowPlayingClientProtobuf setExtendedBundleIdentifierHierarchys:](v3, "setExtendedBundleIdentifierHierarchys:", v12);

  -[MRClient appIcon](self, "appIcon");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "absoluteString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRNowPlayingClientProtobuf setIconURL:](v3, "setIconURL:", v14);

  return v3;
}

void __23__MRClient_localClient__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "processIdentifier");

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "processName");
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  v6 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithProcessIdentifier:bundleIdentifier:", v3, v8);
  v7 = (void *)localClient_client;
  localClient_client = v6;

}

+ (MRClient)anyClient
{
  return (MRClient *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithBundleIdentifier:", CFSTR("any"));
}

- (MRClient)initWithProcessIdentifier:(int)a3 bundleIdentifier:(id)a4
{
  id v6;
  MRClient *v7;
  MRClient *v8;
  uint64_t v9;
  NSString *bundleIdentifier;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MRClient;
  v7 = -[MRClient init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_processIdentifier = a3;
    v9 = objc_msgSend(v6, "copy");
    bundleIdentifier = v8->_bundleIdentifier;
    v8->_bundleIdentifier = (NSString *)v9;

  }
  return v8;
}

- (MRClient)initWithBundleIdentifier:(id)a3
{
  return -[MRClient initWithProcessIdentifier:bundleIdentifier:](self, "initWithProcessIdentifier:bundleIdentifier:", 0, a3);
}

- (void)resolvePlaceholdersForDeviceInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MRClient bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("(System Media Application)")))
  {
    objc_msgSend(v4, "systemMediaApplication");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v6 = (void *)MRMediaRemoteCopyLocalDeviceSystemMediaApplicationDisplayID();
      _MRLogForCategory(0);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v8 = 138543362;
        *(_QWORD *)&v8[4] = v6;
LABEL_13:
        _os_log_impl(&dword_193827000, v7, OS_LOG_TYPE_DEFAULT, "Falling back to %{public}@ for system app since none specified in deviceInfo", v8, 0xCu);
        goto LABEL_14;
      }
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("(System Podcast Application)")))
  {
    objc_msgSend(v4, "systemPodcastApplication");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v6 = (void *)MRMediaRemoteCopyLocalDeviceSystemPodcastApplicationDisplayID();
      _MRLogForCategory(0);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v8 = 138543362;
        *(_QWORD *)&v8[4] = v6;
        goto LABEL_13;
      }
LABEL_14:

    }
LABEL_15:
    -[MRClient setBundleIdentifier:](self, "setBundleIdentifier:", v6, *(_OWORD *)v8);

    goto LABEL_16;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("(System Books Application)")))
  {
    objc_msgSend(v4, "systemBooksApplication");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v6 = (void *)MRMediaRemoteCopyLocalDeviceSystemBooksApplicationDisplayID();
      _MRLogForCategory(0);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v8 = 138543362;
        *(_QWORD *)&v8[4] = v6;
        goto LABEL_13;
      }
      goto LABEL_14;
    }
    goto LABEL_15;
  }
LABEL_16:

}

- (BOOL)isSystemMediaApplication
{
  void *v2;
  char IsSystemMediaApplication;

  -[MRClient bundleIdentifier](self, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  IsSystemMediaApplication = MRMediaRemoteApplicationIsSystemMediaApplication((uint64_t)v2);

  return IsSystemMediaApplication;
}

- (MRClient)initWithData:(id)a3
{
  id v4;
  _MRNowPlayingClientProtobuf *v5;
  MRClient *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[_MRNowPlayingClientProtobuf initWithData:]([_MRNowPlayingClientProtobuf alloc], "initWithData:", v4);

    self = -[MRClient initWithProtobuf:](self, "initWithProtobuf:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (MRClient)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  MRClient *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("protobuf"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _MRLogForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[MRLanguageOption initWithCoder:].cold.1((uint64_t)v5, v6);

    v5 = 0;
  }
  v7 = -[MRClient initWithProtobuf:](self, "initWithProtobuf:", v5);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MRClient protobuf](self, "protobuf");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("protobuf"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSData)data
{
  void *v2;
  void *v3;

  -[MRClient protobuf](self, "protobuf");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (MRClient)skeleton
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = objc_alloc((Class)objc_opt_class());
  v4 = -[MRClient processIdentifier](self, "processIdentifier");
  -[MRClient bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithProcessIdentifier:bundleIdentifier:", v4, v5);

  return (MRClient *)v6;
}

- (NSString)representedBundleID
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  -[MRClient bundleIdentifier](self, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRClient bundleIdentifierHierarchy](self, "bundleIdentifierHierarchy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRClient parentApplicationBundleIdentifier](self, "parentApplicationBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "lastObject");
    v6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v7 = v6;

    v3 = v7;
    goto LABEL_6;
  }
  if (objc_msgSend(v5, "length"))
  {
    v6 = v5;
    goto LABEL_5;
  }
LABEL_6:

  return (NSString *)v3;
}

- (BOOL)hasAuxiliaryProperties
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v8;

  -[MRClient displayName](self, "displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    -[MRClient parentApplicationBundleIdentifier](self, "parentApplicationBundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v4 = 1;
    }
    else
    {
      -[MRClient tintColor](self, "tintColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 || -[MRClient visibility](self, "visibility"))
      {
        v4 = 1;
      }
      else
      {
        -[MRClient appIcon](self, "appIcon");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = v8 != 0;

      }
    }

  }
  return v4;
}

- (BOOL)isSystemPodcastsApplication
{
  void *v2;
  char IsSystemPodcastApplication;

  -[MRClient bundleIdentifier](self, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  IsSystemPodcastApplication = MRMediaRemoteApplicationIsSystemPodcastApplication((uint64_t)v2);

  return IsSystemPodcastApplication;
}

- (BOOL)isSystemBooksApplication
{
  void *v2;
  char IsSystemBooksApplication;

  -[MRClient bundleIdentifier](self, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  IsSystemBooksApplication = MRMediaRemoteApplicationIsSystemBooksApplication((uint64_t)v2);

  return IsSystemBooksApplication;
}

- (BOOL)isAirPlay
{
  void *v2;
  char v3;

  -[MRClient bundleIdentifier](self, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.tvairplayd"));

  return v3;
}

- (id)debugDescription
{
  void *v2;
  void *v3;
  void *v4;

  -[MRClient protobuf](self, "protobuf");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)mergeFrom:(id)a3
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
  id v16;

  v16 = a3;
  if (objc_msgSend(v16, "processIdentifier"))
    -[MRClient setProcessIdentifier:](self, "setProcessIdentifier:", objc_msgSend(v16, "processIdentifier"));
  if (objc_msgSend(v16, "processUserIdentifier"))
    -[MRClient setProcessUserIdentifier:](self, "setProcessUserIdentifier:", objc_msgSend(v16, "processUserIdentifier"));
  if (objc_msgSend(v16, "visibility"))
    -[MRClient setVisibility:](self, "setVisibility:", objc_msgSend(v16, "visibility"));
  objc_msgSend(v16, "tintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v16, "tintColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRClient setTintColor:](self, "setTintColor:", v5);

  }
  objc_msgSend(v16, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v16, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRClient setBundleIdentifier:](self, "setBundleIdentifier:", v7);

  }
  objc_msgSend(v16, "parentApplicationBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v16, "parentApplicationBundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRClient setParentApplicationBundleIdentifier:](self, "setParentApplicationBundleIdentifier:", v9);

  }
  objc_msgSend(v16, "displayName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v16, "displayName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRClient setDisplayName:](self, "setDisplayName:", v11);

  }
  objc_msgSend(v16, "extendedBundleIdentifierHierarchy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v16, "extendedBundleIdentifierHierarchy");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRClient setExtendedBundleIdentifierHierarchy:](self, "setExtendedBundleIdentifierHierarchy:", v13);

  }
  objc_msgSend(v16, "appIcon");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v16, "appIcon");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRClient setAppIcon:](self, "setAppIcon:", v15);

  }
}

@end
