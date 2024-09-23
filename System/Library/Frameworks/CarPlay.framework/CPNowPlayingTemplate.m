@implementation CPNowPlayingTemplate

- (CPNowPlayingTemplate)init
{
  CPNowPlayingTemplate *v2;
  id v3;
  uint64_t v4;
  CARObserverHashTable *nowPlayingObservers;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CPNowPlayingTemplate;
  v2 = -[CPTemplate init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x24BE15228]);
    v4 = objc_msgSend(v3, "initWithProtocol:callbackQueue:", &unk_2549E7D88, MEMORY[0x24BDAC9B8]);
    nowPlayingObservers = v2->_nowPlayingObservers;
    v2->_nowPlayingObservers = (CARObserverHashTable *)v4;

  }
  return v2;
}

+ (CPNowPlayingTemplate)sharedTemplate
{
  if (sharedTemplate_onceToken != -1)
    dispatch_once(&sharedTemplate_onceToken, &__block_literal_global_5);
  return (CPNowPlayingTemplate *)(id)sharedTemplate___template;
}

void __38__CPNowPlayingTemplate_sharedTemplate__block_invoke()
{
  CPNowPlayingTemplate *v0;
  void *v1;

  v0 = objc_alloc_init(CPNowPlayingTemplate);
  v1 = (void *)sharedTemplate___template;
  sharedTemplate___template = (uint64_t)v0;

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPNowPlayingTemplate)initWithCoder:(id)a3
{
  id v4;
  CPNowPlayingTemplate *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSArray *nowPlayingButtons;
  uint64_t v17;
  NSString *upNextTitle;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CPNowPlayingTemplate;
  v5 = -[CPTemplate initWithCoder:](&v20, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, v11, v12, v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("kCPTemplateLowerRegionButtons"));
    v15 = objc_claimAutoreleasedReturnValue();
    nowPlayingButtons = v5->_nowPlayingButtons;
    v5->_nowPlayingButtons = (NSArray *)v15;

    v5->_upNextButtonEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kCPTemplateUpNextEnabledKey"));
    v5->_albumArtistButtonEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kCPTemplateAlbumArtistButtonEnabledKey"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCPTemplateUpNextTitleKey"));
    v17 = objc_claimAutoreleasedReturnValue();
    upNextTitle = v5->_upNextTitle;
    v5->_upNextTitle = (NSString *)v17;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CPNowPlayingTemplate;
  v4 = a3;
  -[CPTemplate encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  -[CPNowPlayingTemplate nowPlayingButtons](self, "nowPlayingButtons", v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kCPTemplateLowerRegionButtons"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CPNowPlayingTemplate isUpNextButtonEnabled](self, "isUpNextButtonEnabled"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kCPTemplateUpNextEnabledKey"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CPNowPlayingTemplate isAlbumArtistButtonEnabled](self, "isAlbumArtistButtonEnabled"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("kCPTemplateAlbumArtistButtonEnabledKey"));

  -[CPNowPlayingTemplate upNextTitle](self, "upNextTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("kCPTemplateUpNextTitleKey"));

}

- (void)addObserver:(id)observer
{
  id v4;
  id v5;

  v4 = observer;
  -[CPNowPlayingTemplate nowPlayingObservers](self, "nowPlayingObservers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerObserver:", v4);

}

- (void)removeObserver:(id)observer
{
  id v4;
  id v5;

  v4 = observer;
  -[CPNowPlayingTemplate nowPlayingObservers](self, "nowPlayingObservers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unregisterObserver:", v4);

}

- (void)updateNowPlayingButtons:(NSArray *)nowPlayingButtons
{
  NSArray *v4;
  NSArray *v5;
  NSObject *v6;
  void *v7;
  int v8;
  CPNowPlayingTemplate *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  -[CPNowPlayingTemplate _updateLowerRegionButtons:](self, "_updateLowerRegionButtons:", nowPlayingButtons);
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v5 = self->_nowPlayingButtons;
  self->_nowPlayingButtons = v4;

  CarPlayFrameworkGeneralLogging();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[CPNowPlayingTemplate nowPlayingButtons](self, "nowPlayingButtons");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = self;
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_20D6F4000, v6, OS_LOG_TYPE_DEFAULT, "%@: Update now playing buttons %@", (uint8_t *)&v8, 0x16u);

  }
  -[CPNowPlayingTemplate _updateNowPlayingTemplateWithThrottle:](self, "_updateNowPlayingTemplateWithThrottle:", 1);
}

- (void)setUpNextButtonEnabled:(BOOL)upNextButtonEnabled
{
  if (self->_upNextButtonEnabled != upNextButtonEnabled)
  {
    self->_upNextButtonEnabled = upNextButtonEnabled;
    -[CPNowPlayingTemplate _updateNowPlayingTemplateWithThrottle:](self, "_updateNowPlayingTemplateWithThrottle:", 0);
  }
}

- (void)setUpNextTitle:(NSString *)upNextTitle
{
  NSString *v5;

  v5 = upNextTitle;
  if (!-[NSString isEqualToString:](self->_upNextTitle, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_upNextTitle, upNextTitle);
    -[CPNowPlayingTemplate _updateNowPlayingTemplateWithThrottle:](self, "_updateNowPlayingTemplateWithThrottle:", 0);
  }

}

- (void)setAlbumArtistButtonEnabled:(BOOL)albumArtistButtonEnabled
{
  if (self->_albumArtistButtonEnabled != albumArtistButtonEnabled)
  {
    self->_albumArtistButtonEnabled = albumArtistButtonEnabled;
    -[CPNowPlayingTemplate _updateNowPlayingTemplateWithThrottle:](self, "_updateNowPlayingTemplateWithThrottle:", 0);
  }
}

- (void)handleAction:(int64_t)a3 forControlIdentifier:(id)a4
{
  id v6;
  id v7;
  _QWORD block[5];
  id v9;
  int64_t v10;

  v6 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__CPNowPlayingTemplate_handleAction_forControlIdentifier___block_invoke;
  block[3] = &unk_24C77D0F0;
  block[4] = self;
  v9 = v6;
  v10 = a3;
  v7 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __58__CPNowPlayingTemplate_handleAction_forControlIdentifier___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, uint64_t, _BYTE *);
  void *v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__2;
  v25 = __Block_byref_object_dispose__2;
  v26 = 0;
  CarPlayFrameworkGeneralLogging();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v3, "nowPlayingButtons");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v28 = v3;
    v29 = 2112;
    v30 = v4;
    v31 = 2112;
    v32 = v5;
    _os_log_impl(&dword_20D6F4000, v2, OS_LOG_TYPE_DEFAULT, "%@: handle action for identifier %@ in now playing buttons %@", buf, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "nowPlayingButtons");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x24BDAC760];
  v16 = 3221225472;
  v17 = __58__CPNowPlayingTemplate_handleAction_forControlIdentifier___block_invoke_83;
  v18 = &unk_24C77D0C8;
  v19 = *(id *)(a1 + 40);
  v20 = &v21;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", &v15);

  if (v22[5])
  {
    CarPlayFrameworkGeneralLogging();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v22[5];
      v9 = *(void **)(a1 + 32);
      v10 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      v28 = v9;
      v29 = 2112;
      v30 = v8;
      v31 = 2112;
      v32 = v10;
      _os_log_impl(&dword_20D6F4000, v7, OS_LOG_TYPE_DEFAULT, "%@: Activated button: %@ for control identifier: %@", buf, 0x20u);
    }

    v11 = *(_QWORD *)(a1 + 48);
    if (v11 == 2)
    {
      objc_msgSend((id)v22[5], "handlePressesEnd", v15, v16, v17, v18);
    }
    else if (v11 == 1)
    {
      objc_msgSend((id)v22[5], "handlePressesStart", v15, v16, v17, v18);
    }
    else
    {
      objc_msgSend((id)v22[5], "handlePrimaryAction", v15, v16, v17, v18);
    }
  }
  else
  {
    CarPlayFrameworkGeneralLogging();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(void **)(a1 + 32);
      v14 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v28 = v13;
      v29 = 2112;
      v30 = v14;
      _os_log_impl(&dword_20D6F4000, v12, OS_LOG_TYPE_DEFAULT, "%@: No available button for identifier %@", buf, 0x16u);
    }

  }
  _Block_object_dispose(&v21, 8);

}

void __58__CPNowPlayingTemplate_handleAction_forControlIdentifier___block_invoke_83(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (void)upNextButtonTapped
{
  id v3;

  -[CPNowPlayingTemplate nowPlayingObservers](self, "nowPlayingObservers");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nowPlayingTemplateUpNextButtonTapped:", self);

}

- (void)albumArtistButtonTapped
{
  id v3;

  -[CPNowPlayingTemplate nowPlayingObservers](self, "nowPlayingObservers");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nowPlayingTemplateAlbumArtistButtonTapped:", self);

}

- (void)handleActionForControlIdentifier:(id)a3
{
  -[CPNowPlayingTemplate handleAction:forControlIdentifier:](self, "handleAction:forControlIdentifier:", 0, a3);
}

- (id)leadingNavigationBarButtons
{
  -[CPNowPlayingTemplate doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (void)setLeadingNavigationBarButtons:(id)a3
{
  -[CPNowPlayingTemplate doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (id)trailingNavigationBarButtons
{
  -[CPNowPlayingTemplate doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (void)setTrailingNavigationBarButtons:(id)a3
{
  -[CPNowPlayingTemplate doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (id)_updateLowerRegionButtons:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];

  v4 = a3;
  if ((unint64_t)objc_msgSend(v4, "count") < 6)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", 0, 5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectsAtIndexes:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __50__CPNowPlayingTemplate__updateLowerRegionButtons___block_invoke;
  v8[3] = &unk_24C77D118;
  v8[4] = self;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);

  return v6;
}

uint64_t __50__CPNowPlayingTemplate__updateLowerRegionButtons___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDelegate:", *(_QWORD *)(a1 + 32));
}

- (void)_updateNowPlayingTemplateWithThrottle:(BOOL)a3
{
  NSObject *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  BOOL v11;
  id location;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_initWeak(&location, self);
  CarPlayFrameworkGeneralLogging();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_loadWeakRetained(&location);
    *(_DWORD *)buf = 138412290;
    v14 = v6;
    _os_log_impl(&dword_20D6F4000, v5, OS_LOG_TYPE_DEFAULT, "%@: Updating now playing template", buf, 0xCu);

  }
  -[CPTemplate templateProviderFuture](self, "templateProviderFuture");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __62__CPNowPlayingTemplate__updateNowPlayingTemplateWithThrottle___block_invoke;
  v9[3] = &unk_24C77D140;
  objc_copyWeak(&v10, &location);
  v11 = a3;
  v8 = (id)objc_msgSend(v7, "addSuccessBlock:", v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __62__CPNowPlayingTemplate__updateNowPlayingTemplateWithThrottle___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  CarPlayFrameworkGeneralLogging();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v11 = 138412290;
    v12 = WeakRetained;
    _os_log_impl(&dword_20D6F4000, v4, OS_LOG_TYPE_DEFAULT, "%@: Executing Future success block", (uint8_t *)&v11, 0xCu);

  }
  v6 = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = (void *)MEMORY[0x24BDD16E0];
  v8 = *(unsigned __int8 *)(a1 + 40);
  v9 = v6;
  objc_msgSend(v7, "numberWithBool:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateNowPlayingTemplate:withProxyDelegate:canThrottle:", v9, v9, v10);

}

- (NSArray)nowPlayingButtons
{
  return self->_nowPlayingButtons;
}

- (BOOL)isUpNextButtonEnabled
{
  return self->_upNextButtonEnabled;
}

- (NSString)upNextTitle
{
  return self->_upNextTitle;
}

- (BOOL)isAlbumArtistButtonEnabled
{
  return self->_albumArtistButtonEnabled;
}

- (CARObserverHashTable)nowPlayingObservers
{
  return self->_nowPlayingObservers;
}

- (void)setNowPlayingObservers:(id)a3
{
  objc_storeStrong((id *)&self->_nowPlayingObservers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nowPlayingObservers, 0);
  objc_storeStrong((id *)&self->_upNextTitle, 0);
  objc_storeStrong((id *)&self->_nowPlayingButtons, 0);
}

@end
