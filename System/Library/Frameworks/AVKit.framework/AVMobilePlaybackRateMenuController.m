@implementation AVMobilePlaybackRateMenuController

- (UIMenu)menu
{
  return self->_playbackRateMenu;
}

void __90__AVMobilePlaybackRateMenuController__loadPlaybackSpeedControlImageWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  id v5;

  v5 = a2;
  objc_storeStrong((id *)&AVMobilePlaybackSpeedControlImage, a2);
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(void))(v4 + 16))();

}

void __42__AVMobilePlaybackRateMenuController_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updatePlaybackRateMenuIfNeeded");

}

- (AVMobilePlaybackRateMenuController)init
{
  AVMobilePlaybackRateMenuController *v2;
  AVObservationController *v3;
  AVObservationController *observationController;
  _QWORD v6[4];
  id v7;
  id location;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVMobilePlaybackRateMenuController;
  v2 = -[AVMobilePlaybackRateMenuController init](&v9, sel_init);
  if (v2)
  {
    v3 = -[AVObservationController initWithOwner:]([AVObservationController alloc], "initWithOwner:", v2);
    observationController = v2->_observationController;
    v2->_observationController = v3;

    objc_initWeak(&location, v2);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __42__AVMobilePlaybackRateMenuController_init__block_invoke;
    v6[3] = &unk_1E5BB4A40;
    objc_copyWeak(&v7, &location);
    +[AVMobilePlaybackRateMenuController _loadPlaybackSpeedControlImageWithCompletionHandler:](AVMobilePlaybackRateMenuController, "_loadPlaybackSpeedControlImageWithCompletionHandler:", v6);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  return v2;
}

+ (void)_loadPlaybackSpeedControlImageWithCompletionHandler:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  if (!AVMobilePlaybackSpeedControlImage)
  {
    v4 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __90__AVMobilePlaybackRateMenuController__loadPlaybackSpeedControlImageWithCompletionHandler___block_invoke;
    v6[3] = &unk_1E5BB0DB8;
    v7 = v3;
    objc_msgSend(v4, "avkit_imageWithSymbolNamed:font:completion:", CFSTR("speedometer"), v5, v6);

  }
}

- (void)setPlaybackSpeedCollection:(id)a3
{
  AVPlaybackSpeedCollection *v5;
  AVPlaybackSpeedCollection *playbackSpeedCollection;
  id v7;
  AVPlaybackSpeedCollection *v8;

  v5 = (AVPlaybackSpeedCollection *)a3;
  if (self->_playbackSpeedCollection != v5)
  {
    v8 = v5;
    -[AVObservationController stopAllObservation](self->_observationController, "stopAllObservation");
    objc_storeStrong((id *)&self->_playbackSpeedCollection, a3);
    playbackSpeedCollection = self->_playbackSpeedCollection;
    if (playbackSpeedCollection)
      v7 = -[AVObservationController startObserving:keyPath:includeInitialValue:observationHandler:](self->_observationController, "startObserving:keyPath:includeInitialValue:observationHandler:", playbackSpeedCollection, CFSTR("selectedSpeed"), 0, &__block_literal_global_3162);
    -[AVMobilePlaybackRateMenuController _reconstructPlaybackRateMenuItems](self, "_reconstructPlaybackRateMenuItems");
    -[AVMobilePlaybackRateMenuController _updatePlaybackRateMenuIfNeeded](self, "_updatePlaybackRateMenuIfNeeded");
    v5 = v8;
  }

}

- (void)_updatePlaybackRateMenuIfNeeded
{
  void *v3;
  id v4;
  _BOOL4 v5;
  void *v6;
  UIMenu *v7;
  UIMenu *playbackRateMenu;
  id obj;

  -[AVMobilePlaybackRateMenuController playbackSpeedCollection](self, "playbackSpeedCollection");
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "activeSpeed");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)AVMobilePlaybackSpeedControlImage;
  v5 = v4 != 0;
  if (*(_OWORD *)&self->_activePlaybackRateCollection != __PAIR128__((unint64_t)v3, (unint64_t)obj)
    || self->_activeMenuHasImage != v5)
  {
    objc_storeStrong((id *)&self->_activePlaybackRateCollection, obj);
    objc_storeStrong((id *)&self->_activeSelectedPlaybackSpeed, v3);
    self->_activeMenuHasImage = v5;
    AVLocalizedString(CFSTR("Playback Speed"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVMobilePlaybackRateMenuController willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("menu"));
    objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", v6, v4, CFSTR("AVPlaybackSpeedMenu"), 0, self->_activeMenuItems);
    v7 = (UIMenu *)objc_claimAutoreleasedReturnValue();
    playbackRateMenu = self->_playbackRateMenu;
    self->_playbackRateMenu = v7;

    -[AVMobilePlaybackRateMenuController didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("menu"));
  }

}

- (AVPlaybackSpeedCollection)playbackSpeedCollection
{
  return self->_playbackSpeedCollection;
}

- (void)_reconstructPlaybackRateMenuItems
{
  void *v2;
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSArray *activeMenuItems;
  id obj;
  _QWORD v18[5];
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[AVMobilePlaybackRateMenuController playbackSpeedCollection](self, "playbackSpeedCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displaySpeeds");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v9, "localizedNumericName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "activeSpeed");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = (void *)MEMORY[0x1E0DC3428];
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __71__AVMobilePlaybackRateMenuController__reconstructPlaybackRateMenuItems__block_invoke;
        v18[3] = &unk_1E5BB18F8;
        v18[4] = v9;
        v19 = v2;
        objc_msgSend(v12, "actionWithTitle:image:identifier:handler:", v10, 0, 0, v18);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v11 == v9)
          objc_msgSend(v13, "setState:", 1);
        if (objc_msgSend(v9, "isSynthesized"))
          objc_msgSend(v14, "setAttributes:", 1);
        -[NSArray addObject:](v4, "addObject:", v14);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v6);
  }

  activeMenuItems = self->_activeMenuItems;
  self->_activeMenuItems = v4;

}

- (void)dealloc
{
  objc_super v3;

  -[AVObservationController stopAllObservation](self->_observationController, "stopAllObservation");
  v3.receiver = self;
  v3.super_class = (Class)AVMobilePlaybackRateMenuController;
  -[AVMobilePlaybackRateMenuController dealloc](&v3, sel_dealloc);
}

- (void)_updatePlaybackRateMenuItemStatesIfNeeded
{
  NSArray *v3;
  AVPlaybackSpeedCollection *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  BOOL v11;
  unint64_t v12;
  void *v13;
  int v14;
  NSArray *v15;
  __int16 v16;
  AVPlaybackSpeedCollection *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = self->_activeMenuItems;
  v4 = self->_activePlaybackRateCollection;
  -[AVPlaybackSpeedCollection speeds](v4, "speeds");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlaybackSpeedCollection activeSpeed](v4, "activeSpeed");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "indexOfObject:", v6);

  v8 = -[NSArray count](v3, "count");
  if (v8 != objc_msgSend(v5, "count"))
  {
    _AVLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v14 = 138412546;
      v15 = v3;
      v16 = 2112;
      v17 = v4;
      _os_log_error_impl(&dword_1AC4B1000, v9, OS_LOG_TYPE_ERROR, "Error: Internal inconsistency - playback speed menu item count does not equal the speed collection count. \n%@\n%@", (uint8_t *)&v14, 0x16u);
    }

  }
  v10 = -[NSArray count](v3, "count");
  v11 = v10 != objc_msgSend(v5, "count") || v7 == 0x7FFFFFFFFFFFFFFFLL;
  if (!v11 && -[NSArray count](v3, "count"))
  {
    v12 = 0;
    do
    {
      -[NSArray objectAtIndex:](v3, "objectAtIndex:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setState:", v7 == v12);

      ++v12;
    }
    while (v12 < -[NSArray count](v3, "count"));
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackSpeedCollection, 0);
  objc_storeStrong((id *)&self->_activeSelectedPlaybackSpeed, 0);
  objc_storeStrong((id *)&self->_activePlaybackRateCollection, 0);
  objc_storeStrong((id *)&self->_activeMenuItems, 0);
  objc_storeStrong((id *)&self->_playbackRateMenu, 0);
  objc_storeStrong((id *)&self->_observationController, 0);
}

uint64_t __71__AVMobilePlaybackRateMenuController__reconstructPlaybackRateMenuItems__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isSynthesized");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 40), "selectSpeed:", *(_QWORD *)(a1 + 32));
  return result;
}

void __65__AVMobilePlaybackRateMenuController_setPlaybackSpeedCollection___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a4;
  v6 = a2;
  objc_msgSend(v5, "value");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "oldValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && v7)
    objc_msgSend(v6, "_updatePlaybackRateMenuItemStatesIfNeeded");
  else
    objc_msgSend(v6, "_reconstructPlaybackRateMenuItems");
  objc_msgSend(v6, "_updatePlaybackRateMenuIfNeeded");

}

@end
