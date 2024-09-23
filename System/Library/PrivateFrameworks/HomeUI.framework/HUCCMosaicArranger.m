@implementation HUCCMosaicArranger

- (HUCCMosaicArranger)initWithCCMosaicType:(unint64_t)a3
{
  HUCCMosaicArranger *v4;
  uint64_t v5;
  NSArray *layouts;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HUCCMosaicArranger;
  v4 = -[HUCCMosaicArranger init](&v8, sel_init);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    layouts = v4->_layouts;
    v4->_layouts = (NSArray *)v5;

    if (a3 == 1)
      -[HUCCMosaicArranger _configureForLandscapeGrid](v4, "_configureForLandscapeGrid");
    else
      -[HUCCMosaicArranger _configureForPortraitGrid](v4, "_configureForPortraitGrid");
  }
  return v4;
}

- (void)_configureForPortraitGrid
{
  void *v3;

  +[HUCCMosaicLayout allPortraitLayouts](HUCCMosaicLayout, "allPortraitLayouts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCCMosaicArranger setLayouts:](self, "setLayouts:", v3);

  -[HUCCMosaicArranger setNumberOfItemsNeeded:](self, "setNumberOfItemsNeeded:", +[HUCCMosaicLayout maxItemsNeededForPortrait](HUCCMosaicLayout, "maxItemsNeededForPortrait"));
}

- (void)_configureForLandscapeGrid
{
  void *v3;

  +[HUCCMosaicLayout allLandscapeLayouts](HUCCMosaicLayout, "allLandscapeLayouts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCCMosaicArranger setLayouts:](self, "setLayouts:", v3);

  -[HUCCMosaicArranger setNumberOfItemsNeeded:](self, "setNumberOfItemsNeeded:", +[HUCCMosaicLayout maxItemsNeededForLandscape](HUCCMosaicLayout, "maxItemsNeededForLandscape"));
}

- (id)calculateOrderingForItems:(id)a3
{
  id v4;
  unint64_t v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  NSObject *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = 0;
    while (v5 < -[HUCCMosaicArranger numberOfItemsNeeded](self, "numberOfItemsNeeded"))
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", v5);
      v6 = objc_claimAutoreleasedReturnValue();
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      -[HUCCMosaicArranger layouts](self, "layouts", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v21;
LABEL_6:
        v11 = 0;
        while (1)
        {
          if (*(_QWORD *)v21 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v11);
          objc_msgSend(v12, "addItem:", v6);
          if (objc_msgSend(v12, "priority") == 2 && (objc_msgSend(v12, "isComplete") & 1) != 0)
            break;
          if (v9 == ++v11)
          {
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
            if (v9)
              goto LABEL_6;
            goto LABEL_13;
          }
        }
        v13 = v12;

        if (!v13)
          goto LABEL_15;
        HFLogForCategory();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v25 = v13;
          _os_log_impl(&dword_1B8E1E000, v19, OS_LOG_TYPE_DEFAULT, "Mosaic Layout %@ filled, breaking.", buf, 0xCu);
        }

        goto LABEL_18;
      }
LABEL_13:

LABEL_15:
      if (++v5 >= objc_msgSend(v4, "count"))
        break;
    }
  }
  -[HUCCMosaicArranger layouts](self, "layouts");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "lastObject");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_ERROR, "Unable to calculate correct mosaic layout", buf, 2u);
  }
LABEL_18:

  HFLogForCategory();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v13;
    _os_log_impl(&dword_1B8E1E000, v15, OS_LOG_TYPE_DEFAULT, "Mosaic Layout chosen is %@", buf, 0xCu);
  }

  if (v13)
    v16 = objc_msgSend(v13, "layoutType");
  else
    v16 = 0;
  -[HUCCMosaicArranger setChosenLayoutType:](self, "setChosenLayoutType:", v16);
  objc_msgSend(v13, "arrangedItems");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (unint64_t)chosenLayoutType
{
  return self->_chosenLayoutType;
}

- (void)setChosenLayoutType:(unint64_t)a3
{
  self->_chosenLayoutType = a3;
}

- (NSArray)layouts
{
  return self->_layouts;
}

- (void)setLayouts:(id)a3
{
  objc_storeStrong((id *)&self->_layouts, a3);
}

- (unint64_t)numberOfItemsNeeded
{
  return self->_numberOfItemsNeeded;
}

- (void)setNumberOfItemsNeeded:(unint64_t)a3
{
  self->_numberOfItemsNeeded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layouts, 0);
}

@end
