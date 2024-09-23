@implementation SHAttribution

- (SHAttribution)init
{
  SHAttribution *v2;
  SecTaskRef v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SHAttribution;
  v2 = -[SHAttribution init](&v5, sel_init);
  if (v2)
  {
    v3 = SecTaskCreateFromSelf(0);
    -[SHAttribution configureAttributionForTask:](v2, "configureAttributionForTask:", v3);
    CFRelease(v3);
  }
  return v2;
}

- (SHAttribution)initWithConnection:(id)a3
{
  id v4;
  SHAttribution *v5;
  SHAttribution *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SHAttribution;
  v5 = -[SHAttribution init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[SHAttribution configureAttributionForConnection:](v5, "configureAttributionForConnection:", v4);

  return v6;
}

- (NSString)containingAppBundleIdentifier
{
  void *v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint32_t v17;
  NSObject *v18;
  id v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  -[SHAttribution bundleIdentifier](self, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SHAttribution bundleIdentifier](self, "bundleIdentifier");
    v4 = objc_claimAutoreleasedReturnValue();
    v20 = 0;
    objc_msgSend(MEMORY[0x24BDC1558], "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v4, 0, &v20);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v20;
    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v5, "containingBundleRecord");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v7, "bundleIdentifier");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = v8;
          if (v8)
          {
            v10 = v4;
            v4 = v8;
          }
          else
          {
            sh_log_object();
            v10 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_218BF1000, v10, OS_LOG_TYPE_ERROR, "Client app is an app extension, but no containing app bundle identifier", buf, 2u);
            }
          }

          v11 = v4;
        }
        else
        {
          sh_log_object();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_218BF1000, v18, OS_LOG_TYPE_ERROR, "Client is an app extension, but has a containing bundle that's not an application", buf, 2u);
          }

          v11 = v4;
        }

        goto LABEL_23;
      }
      sh_log_object();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v14 = "Client is not an extension, use bundle identifier";
        v15 = v13;
        v16 = OS_LOG_TYPE_DEFAULT;
        v17 = 2;
        goto LABEL_14;
      }
    }
    else
    {
      sh_log_object();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v22 = v6;
        v14 = "Failed to get bundle record, instead using bundle identifier. %{public}@";
        v15 = v13;
        v16 = OS_LOG_TYPE_ERROR;
        v17 = 12;
LABEL_14:
        _os_log_impl(&dword_218BF1000, v15, v16, v14, buf, v17);
      }
    }

    v11 = v4;
LABEL_23:

    v12 = v11;
    goto LABEL_24;
  }
  sh_log_object();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218BF1000, v11, OS_LOG_TYPE_ERROR, "There is no bundle identifier", buf, 2u);
  }
  v12 = 0;
LABEL_24:

  return (NSString *)v12;
}

- (NSString)productName
{
  void *v3;
  void *v4;
  void *v5;

  -[SHAttribution bundleIdentifier](self, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SHAttribution bundleIdentifier](self, "bundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[SHAttribution productNameForBundleIdentifier:](SHAttribution, "productNameForBundleIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

+ (id)productNameForBundleIdentifier:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v8;

  v3 = (objc_class *)MEMORY[0x24BDC1540];
  v4 = a3;
  v8 = 0;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithBundleIdentifier:allowPlaceholder:error:", v4, 0, &v8);

  objc_msgSend(v5, "localizedName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)requiresMediaLibraryAttributionForBundleIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "mediaLibraryAttributionExceptionPlist");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v5, "objectForKey:", CFSTR("com.apple.private.shazamkit.exception.medialibraryattribution"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v6, "containsObject:", v4);
  return v5 ^ 1;
}

+ (BOOL)requiresMusicRecognitionSensorActivityAttributionForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "musicRecognitionSensorActivityAttributionExceptionPlist");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("com.apple.private.shazamkit.musicrecognitionsensoractivity"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v6, "containsObject:", v4);
  return (char)v5;
}

- (void)configureAttributionForTask:(__SecTask *)a3
{
  __CFString *v4;
  NSString *bundleIdentifier;
  BOOL v6;
  NSObject *v7;
  NSString *v8;
  NSString *teamIdentifier;
  CFErrorRef v10;
  NSObject *v11;
  CFErrorRef error;
  uint8_t buf[4];
  CFErrorRef v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  error = 0;
  v4 = (__CFString *)SecTaskCopySigningIdentifier(a3, &error);
  bundleIdentifier = self->_bundleIdentifier;
  self->_bundleIdentifier = &v4->isa;

  if (self->_bundleIdentifier)
    v6 = 1;
  else
    v6 = error == 0;
  if (!v6)
  {
    sh_log_object();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v14 = error;
      _os_log_impl(&dword_218BF1000, v7, OS_LOG_TYPE_ERROR, "Unable to get signing identifier from task: %{public}@", buf, 0xCu);
    }

  }
  v8 = (NSString *)SecTaskCopyTeamIdentifier();
  teamIdentifier = self->_teamIdentifier;
  self->_teamIdentifier = v8;

  v10 = error;
  if (!self->_teamIdentifier && error)
  {
    sh_log_object();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v14 = error;
      _os_log_impl(&dword_218BF1000, v11, OS_LOG_TYPE_ERROR, "Unable to get team identifier from task: %{public}@", buf, 0xCu);
    }

    v10 = error;
  }
  if (v10)
    CFRelease(v10);
}

- (void)configureAttributionForConnection:(id)a3
{
  id v4;
  void *v5;
  SecTaskRef v6;
  SecTaskRef v7;
  SecTaskRef v8;
  __int128 v9;
  NSObject *v10;
  __int128 v11;
  __int128 v12;
  audit_token_t token;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "auditToken");
    v6 = SecTaskCreateWithAuditToken(0, &token);
    if (v6)
    {
      v7 = v6;
      objc_msgSend(v5, "auditToken");
LABEL_6:
      v9 = v12;
      *(_OWORD *)self->_auditToken.val = v11;
      *(_OWORD *)&self->_auditToken.val[4] = v9;
      -[SHAttribution configureAttributionForTask:](self, "configureAttributionForTask:", v7, (_QWORD)v11);
      CFRelease(v7);
      goto LABEL_10;
    }
  }
  else
  {
    memset(&token, 0, sizeof(token));
    v8 = SecTaskCreateWithAuditToken(0, &token);
    if (v8)
    {
      v7 = v8;
      v11 = 0u;
      v12 = 0u;
      goto LABEL_6;
    }
  }
  sh_log_object();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_218BF1000, v10, OS_LOG_TYPE_ERROR, "Unable to create SecTask for audit token", (uint8_t *)&v11, 2u);
  }

LABEL_10:
}

+ (id)musicRecognitionSensorActivityAttributionExceptionPlist
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72__SHAttribution_musicRecognitionSensorActivityAttributionExceptionPlist__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (musicRecognitionSensorActivityAttributionExceptionPlist_onceToken != -1)
    dispatch_once(&musicRecognitionSensorActivityAttributionExceptionPlist_onceToken, block);
  return (id)musicRecognitionSensorActivityAttributionExceptionPlist_plist;
}

void __72__SHAttribution_musicRecognitionSensorActivityAttributionExceptionPlist__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)*MEMORY[0x24BDF8530], "preferredFilenameExtension");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "pathForResource:ofType:", CFSTR("SHMusicRecognitionSensorActivityAttributionPlist"), v1);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", v4);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)musicRecognitionSensorActivityAttributionExceptionPlist_plist;
  musicRecognitionSensorActivityAttributionExceptionPlist_plist = v2;

}

+ (id)mediaLibraryAttributionExceptionPlist
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__SHAttribution_mediaLibraryAttributionExceptionPlist__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (mediaLibraryAttributionExceptionPlist_onceToken != -1)
    dispatch_once(&mediaLibraryAttributionExceptionPlist_onceToken, block);
  return (id)mediaLibraryAttributionExceptionPlist_plist;
}

void __54__SHAttribution_mediaLibraryAttributionExceptionPlist__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)*MEMORY[0x24BDF8530], "preferredFilenameExtension");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "pathForResource:ofType:", CFSTR("MediaLibraryAttributionException"), v1);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", v4);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)mediaLibraryAttributionExceptionPlist_plist;
  mediaLibraryAttributionExceptionPlist_plist = v2;

}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)teamIdentifier
{
  return self->_teamIdentifier;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].var0[2];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self->var0[6];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_teamIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
