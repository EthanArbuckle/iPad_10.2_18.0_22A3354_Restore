@implementation MKPlaceholder

- (MKPlaceholder)initWithJSONData:(id)a3
{
  id v4;
  MKPlaceholder *v5;
  void *v6;
  id v7;
  NSObject *v8;
  MKPlaceholder *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  MKHex *v16;
  MKCrypto *v17;
  void *v18;
  MKCrypto *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)MKPlaceholder;
  v5 = -[MKPlaceholder init](&v34, sel_init);
  if (v5 && objc_msgSend(v4, "length"))
  {
    v33 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v4, 0, &v33);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v33;
    if (v7)
    {
      +[MKLog log](MKLog, "log");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[MKPlaceholder initWithJSONData:].cold.2(v7, v8);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v6, "mk_stringForKey:", CFSTR("id"));
        v8 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "mk_stringForKey:", CFSTR("name"));
        v10 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "mk_stringForKey:", CFSTR("icon"));
        v11 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "mk_stringForKey:", CFSTR("developer"));
        v12 = objc_claimAutoreleasedReturnValue();
        v32 = (void *)v10;
        if (v10)
          v13 = v10;
        else
          v13 = (uint64_t)v8;
        -[MKPlaceholder setName:](v5, "setName:", v13);
        v31 = (void *)v11;
        if (v11)
        {
          v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v11, 0);
          -[MKPlaceholder setIcon:](v5, "setIcon:", v14);

        }
        else
        {
          -[MKPlaceholder setIcon:](v5, "setIcon:", 0);
        }
        v30 = (void *)v12;
        -[MKPlaceholder setDeveloper:](v5, "setDeveloper:", v12);
        v16 = objc_alloc_init(MKHex);
        v17 = [MKCrypto alloc];
        -[MKHex hexToData:](v16, "hexToData:", CFSTR("331BB104B13265802FC130A8AC28927CFF1CC3F0D502D0B0DE25A8D6F87D3528"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = -[MKCrypto initWithKey:](v17, "initWithKey:", v18);

        -[MKHex hexToData:](v16, "hexToData:", CFSTR("94FBBFDC34ECDA1EBEF8B963954CCE8370B1841A7E12A080793994F1184A8F213A0430023E"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[MKCrypto decryptData:](v19, "decryptData:", v20);
        v21 = objc_claimAutoreleasedReturnValue();

        v29 = (void *)v21;
        v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v21, 4);
        if (-[NSObject isEqualToString:](v8, "isEqualToString:", v22))
        {
          -[MKHex hexToData:](v16, "hexToData:", CFSTR("D1FCC9136BB7D621E20BDF8E1EFB7607F11DD455D9929C6F56"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[MKCrypto decryptData:](v19, "decryptData:", v23);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v28, 4);
          -[MKPlaceholder setAppStoreIdentifier:](v5, "setAppStoreIdentifier:", v27);
          -[MKHex hexToData:](v16, "hexToData:", CFSTR("BFADCCA6F10B49705F5D5A33E55AE0F8E20F55C483DC03BE802D90AC5A"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[MKCrypto decryptData:](v19, "decryptData:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v25, 4);
          -[MKPlaceholder setDeveloper:](v5, "setDeveloper:", v26);

        }
        v5 = -[MKPlaceholder initWithBundleIdentifier:](v5, "initWithBundleIdentifier:", v8);

        v9 = v5;
        goto LABEL_16;
      }
      +[MKLog log](MKLog, "log");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[MKPlaceholder initWithJSONData:].cold.1(v8);
    }
    v9 = 0;
LABEL_16:

    goto LABEL_17;
  }
  v9 = 0;
LABEL_17:

  return v9;
}

- (MKPlaceholder)initWithBundleIdentifier:(id)a3
{
  id v4;
  MKPlaceholder *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  MKPlaceholder *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MKPlaceholder;
  v5 = -[MKPlaceholder init](&v13, sel_init);
  if (!v5)
  {
LABEL_8:
    v11 = v5;
    goto LABEL_9;
  }
  if (objc_msgSend(v4, "length"))
  {
    -[MKPlaceholder setBundleIdentifier:](v5, "setBundleIdentifier:", v4);
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithBundleIdentifier:allowPlaceholder:error:", v5->_bundleIdentifier, 1, 0);
    objc_msgSend(v6, "dataContainerURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingPathComponent:", CFSTR("Library"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKPlaceholder setContainer:](v5, "setContainer:", v9);

    if (v6)
    {
      objc_msgSend(v6, "dataContainerURL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKPlaceholder setEnabled:](v5, "setEnabled:", v10 != 0);

    }
    else
    {
      -[MKPlaceholder setEnabled:](v5, "setEnabled:", 0);
    }

    goto LABEL_8;
  }
  v11 = 0;
LABEL_9:

  return v11;
}

- (MKPlaceholder)initWithBundleIdentifier:(id)a3 appStoreIdentifier:(id)a4 bundleName:(id)a5 developer:(id)a6 icon:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  MKPlaceholder *v16;
  MKPlaceholder *v17;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = -[MKPlaceholder initWithBundleIdentifier:](self, "initWithBundleIdentifier:", a3);
  v17 = v16;
  if (v16)
  {
    -[MKPlaceholder setAppStoreIdentifier:](v16, "setAppStoreIdentifier:", v12);
    -[MKPlaceholder setName:](v17, "setName:", v13);
    -[MKPlaceholder setDeveloper:](v17, "setDeveloper:", v14);
    -[MKPlaceholder setIcon:](v17, "setIcon:", v15);
  }

  return v17;
}

- (MKPlaceholder)initWithTestBundleIdentifier
{
  MKHex *v3;
  MKCrypto *v4;
  void *v5;
  MKCrypto *v6;
  void *v7;
  void *v8;
  void *v9;
  MKPlaceholder *v10;

  if (+[MKInternal isInternal](MKInternal, "isInternal"))
  {
    v3 = objc_alloc_init(MKHex);
    v4 = [MKCrypto alloc];
    -[MKHex hexToData:](v3, "hexToData:", CFSTR("331BB104B13265802FC130A8AC28927CFF1CC3F0D502D0B0DE25A8D6F87D3528"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[MKCrypto initWithKey:](v4, "initWithKey:", v5);

    -[MKHex hexToData:](v3, "hexToData:", CFSTR("94FBBFDC34ECDA1EBEF8B963954CCE8370B1841A7E12A080793994F1184A8F213A0430023E"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKCrypto decryptData:](v6, "decryptData:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v8, 4);
    self = -[MKPlaceholder initWithBundleIdentifier:](self, "initWithBundleIdentifier:", v9);

    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)install
{
  NSObject *v3;
  NSString *bundleIdentifier;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  NSString *v12;
  NSObject *v13;
  id v14;
  NSString *name;
  NSString *v16;
  void *v17;
  NSObject *v18;
  NSString *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  NSObject *v26;
  NSObject *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  uint8_t buf[4];
  MKPlaceholder *v36;
  __int16 v37;
  NSString *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  if (self->_enabled)
  {
    +[MKLog log](MKLog, "log");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      bundleIdentifier = self->_bundleIdentifier;
      *(_DWORD *)buf = 138412290;
      v36 = (MKPlaceholder *)bundleIdentifier;
      _os_log_impl(&dword_21EC08000, v3, OS_LOG_TYPE_INFO, "The placeholder is already installed. id=%@", buf, 0xCu);
    }
  }
  else
  {
    if (-[NSString length](self->_bundleIdentifier, "length")
      && -[NSString length](self->_appStoreIdentifier, "length")
      && -[NSString length](self->_name, "length")
      && -[NSString length](self->_developer, "length"))
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE51F78]), "initWithBundleIdentifier:", self->_bundleIdentifier);
      v34 = 0;
      objc_msgSend(MEMORY[0x24BE51FB8], "coordinatorForAppWithIdentity:withClientID:createIfNotExisting:created:error:", v5, 24, 1, 0, &v34);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v34;
      if (v7)
      {
        v3 = v7;
        v8 = 0;
        v9 = 0;
      }
      else
      {
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE51FA0]), "initWithName:client:diskSpaceNeeded:", CFSTR("User data"), 24, 0);
        v33 = 0;
        v9 = objc_msgSend(v6, "setUserDataPromise:error:", v8, &v33);
        v13 = v33;
        v3 = v13;
        if (v9 && !v13)
        {
          v14 = objc_alloc(MEMORY[0x24BE51F90]);
          name = self->_name;
          v16 = self->_bundleIdentifier;
          v32 = 0;
          v17 = (void *)objc_msgSend(v14, "initAppPlaceholderWithBundleName:bundleID:installType:client:error:", name, v16, 8, 24, &v32);
          v18 = v32;
          if (v18)
          {
            v3 = v18;
            v9 = 1;
          }
          else
          {
            v31 = 0;
            v9 = objc_msgSend(v6, "setPlaceholderPromise:error:", v17, &v31);
            v21 = v31;
            v3 = v21;
            if (v9)
            {
              if (!v21)
              {
                if (!-[NSData length](self->_icon, "length")
                  || (v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE51F98]), "initWithName:client:data:", CFSTR("Placeholder Icon"), 24, self->_icon), v30 = 0, v9 = objc_msgSend(v17, "setIconPromise:error:", v22, &v30), v3 = v30, v22, v9)&& !v3)
                {
                  v23 = objc_alloc_init(MEMORY[0x24BDD16F0]);
                  objc_msgSend(v23, "setNumberStyle:", 1);
                  objc_msgSend(v23, "numberFromString:", self->_appStoreIdentifier);
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  v25 = objc_alloc_init(MEMORY[0x24BE51FD0]);
                  objc_msgSend(v25, "setItemID:", v24);
                  objc_msgSend(v25, "setItemName:", self->_name);
                  objc_msgSend(v25, "setArtistName:", self->_developer);
                  objc_msgSend(v25, "setSoftwareVersionBundleID:", self->_bundleIdentifier);
                  v29 = 0;
                  v9 = objc_msgSend(v17, "setMetadata:error:", v25, &v29);
                  v26 = v29;
                  v3 = v26;
                  if (v9 && !v26)
                  {
                    v28 = 0;
                    v9 = objc_msgSend(v17, "setConfigurationCompleteWithError:", &v28);
                    v27 = v28;
                    if ((v9 & (v27 == 0)) != 0)
                      v3 = 0;
                    else
                      v3 = v27;
                  }

                }
              }
            }
          }

        }
      }

    }
    else
    {
      v8 = 0;
      v9 = 0;
      v3 = 0;
    }
    objc_msgSend(v8, "setComplete:", 1);
    +[MKLog log](MKLog, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (!v9 || v3)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v19 = self->_bundleIdentifier;
        -[NSObject description](v3, "description");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v36 = self;
        v37 = 2112;
        v38 = v19;
        v39 = 1024;
        v40 = v9;
        v41 = 2112;
        v42 = v20;
        _os_log_error_impl(&dword_21EC08000, v11, OS_LOG_TYPE_ERROR, "%@ could not install a placeholder. id=%@, success=%d, error=%@", buf, 0x26u);

      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v12 = self->_bundleIdentifier;
      *(_DWORD *)buf = 138412290;
      v36 = (MKPlaceholder *)v12;
      _os_log_impl(&dword_21EC08000, v11, OS_LOG_TYPE_INFO, "will install a placeholder. id=%@", buf, 0xCu);
    }

  }
}

- (void)uninstall
{
  NSObject *v3;
  NSObject *v4;
  NSString *bundleIdentifier;
  void *v6;
  NSString *v7;
  int v8;
  NSString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (self->_enabled)
  {
    v3 = objc_alloc_init(MEMORY[0x24BE51FC0]);
    -[NSObject setRequestUserConfirmation:](v3, "setRequestUserConfirmation:", 0);
    -[NSObject setWaitForDeletion:](v3, "setWaitForDeletion:", 0);
    -[NSObject setShowArchiveOption:](v3, "setShowArchiveOption:", 0);
    -[NSObject setShowDemotionOption:](v3, "setShowDemotionOption:", 0);
    -[NSObject setSystemAppNotAllowed:](v3, "setSystemAppNotAllowed:", 0);
    +[MKLog log](MKLog, "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      bundleIdentifier = self->_bundleIdentifier;
      v8 = 138412290;
      v9 = bundleIdentifier;
      _os_log_impl(&dword_21EC08000, v4, OS_LOG_TYPE_INFO, "will uninstall an app. id=%@", (uint8_t *)&v8, 0xCu);
    }

    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE51F78]), "initWithBundleIdentifier:", self->_bundleIdentifier);
    objc_msgSend(MEMORY[0x24BE51F70], "uninstallAppWithIdentity:options:completion:", v6, v3, &__block_literal_global_2);

  }
  else
  {
    +[MKLog log](MKLog, "log");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v7 = self->_bundleIdentifier;
      v8 = 138412290;
      v9 = v7;
      _os_log_impl(&dword_21EC08000, v3, OS_LOG_TYPE_INFO, "the placeholder was already uninstalled. id=%@", (uint8_t *)&v8, 0xCu);
    }
  }

}

void __26__MKPlaceholder_uninstall__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[MKLog log](MKLog, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 134218242;
    v7 = a2;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_21EC08000, v5, OS_LOG_TYPE_INFO, "did uninstall an app. disposition=%ld, error=%@", (uint8_t *)&v6, 0x16u);
  }

}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)appStoreIdentifier
{
  return self->_appStoreIdentifier;
}

- (void)setAppStoreIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)developer
{
  return self->_developer;
}

- (void)setDeveloper:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSData)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_developer, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_appStoreIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (void)initWithJSONData:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21EC08000, log, OS_LOG_TYPE_ERROR, "could not initialize placeholder because an unexpected format was received.", v1, 2u);
}

- (void)initWithJSONData:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_21EC08000, a2, OS_LOG_TYPE_ERROR, "could not initialize placeholder because an underlying error occurred unexpectedly. error=%@", (uint8_t *)&v4, 0xCu);

}

@end
