@implementation HUDashboardCameraItemModuleController

- (Class)collectionCellClassForItem:(id)a3
{
  return (Class)objc_opt_class();
}

- (void)configureCell:(id)a3 forItem:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HUDashboardCameraItemModuleController;
  v7 = a4;
  -[HUItemModuleController configureCell:forItem:](&v17, sel_configureCell_forItem_, v6, v7);
  v8 = objc_opt_class();
  v9 = v6;
  if (!v9)
    goto LABEL_7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v9;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v8, objc_opt_class(), v17.receiver, v17.super_class);

LABEL_7:
    v11 = 0;
  }

  objc_msgSend(MEMORY[0x1E0CEA718], "cellConfiguration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setContentConfiguration:", v14);
  -[HUDashboardCameraItemModuleController _cellLayoutOptions](self, "_cellLayoutOptions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setLayoutOptions:", v15);

  objc_msgSend(v11, "setNeedsUpdateConfiguration");
  -[HUDashboardCameraItemModuleController mapTable](self, "mapTable");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKey:", v11, v7);

}

- (NSMapTable)mapTable
{
  NSMapTable *mapTable;
  NSMapTable *v4;
  NSMapTable *v5;

  mapTable = self->_mapTable;
  if (!mapTable)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToWeakObjectsMapTable");
    v4 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    v5 = self->_mapTable;
    self->_mapTable = v4;

    mapTable = self->_mapTable;
  }
  return mapTable;
}

- (id)_cellLayoutOptions
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;

  -[HUItemModuleController host](self, "host");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentingViewControllerForModuleController:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v8 = HUViewSizeSubclassForViewSize(v6, v7);

  if (v8 > 0xA)
    v9 = 1;
  else
    v9 = qword_1B9441F48[v8];
  +[HUMosaicCameraCellLayoutOptions defaultOptionsForCellSizeSubclass:viewSizeSubclass:](HUMosaicCameraCellLayoutOptions, "defaultOptionsForCellSizeSubclass:viewSizeSubclass:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setIsMosaicCell:", -[HUDashboardCameraItemModuleController cameraPresentationStyle](self, "cameraPresentationStyle") == 1);

  return v10;
}

- (int64_t)cameraPresentationStyle
{
  return self->_cameraPresentationStyle;
}

- (void)enableCameraSnapshotsForCells:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v7);
        objc_opt_class();
        v9 = v8;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v10 = v9;
        else
          v10 = 0;
        v11 = v10;

        if (v11)
        {
          objc_msgSend(v11, "item");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "profile");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "hf_cameraManager");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "beginPeriodicSnapshotsWithRequester:", v11);

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }

}

- (HUDashboardCameraItemModuleController)initWithModule:(id)a3 cameraPresentationStyle:(int64_t)a4
{
  HUDashboardCameraItemModuleController *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUDashboardCameraItemModuleController;
  result = -[HUItemModuleController initWithModule:](&v6, sel_initWithModule_, a3);
  if (result)
    result->_cameraPresentationStyle = a4;
  return result;
}

- (unint64_t)didSelectItem:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  -[HUDashboardCameraItemModuleController _logInteractionEventOfType:withItem:](self, "_logInteractionEventOfType:withItem:", 1, v5);
  v8 = -[HUDashboardCameraItemModuleController _presentCameraPlayerViewControllerForCameraItem:](self, "_presentCameraPlayerViewControllerForCameraItem:", v7);

  return 0;
}

- (id)presentCameraPlayerViewControllerForHomeKitObject:(id)a3 startDate:(id)a4 endDate:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a6;
  v10 = a4;
  v11 = a5;
  -[HUDashboardCameraItemModuleController _cameraItemFor:](self, "_cameraItemFor:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[HUDashboardCameraItemModuleController _presentCameraPlayerViewControllerForCameraItem:startDate:endDate:animated:](self, "_presentCameraPlayerViewControllerForCameraItem:startDate:endDate:animated:", v12, v10, v11, v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 30);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "futureWithError:", v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

- (id)presentCameraPlayerViewControllerForHomeKitObject:(id)a3 cameraClip:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a5;
  v8 = a4;
  -[HUDashboardCameraItemModuleController _cameraItemFor:](self, "_cameraItemFor:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[HUDashboardCameraItemModuleController _presentCameraPlayerViewControllerForCameraItem:cameraClip:animated:](self, "_presentCameraPlayerViewControllerForCameraItem:cameraClip:animated:", v9, v8, v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 30);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "futureWithError:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)_cameraItemFor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  -[HUItemModuleController module](self, "module");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "matchingItemForHomeKitObject:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_opt_class();
  v8 = v6;
  if (!v8)
    goto LABEL_7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v8;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v7, objc_opt_class());

LABEL_7:
    v10 = 0;
  }

  return v10;
}

- (id)_presentCameraPlayerViewControllerForCameraItem:(id)a3 startDate:(id)a4 endDate:(id)a5 animated:(BOOL)a6
{
  id v8;
  id v9;
  HUCameraPlayerConfiguration *v10;
  void *v11;
  void *v12;
  void *v13;
  HUCameraPlayerConfiguration *v14;
  void *v15;

  v8 = a4;
  v9 = a3;
  v10 = [HUCameraPlayerConfiguration alloc];
  -[HUItemModuleController module](self, "module");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "home");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "profile");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HUCameraPlayerConfiguration initWithHome:cameraProfile:notificationUUID:clipUUID:](v10, "initWithHome:cameraProfile:notificationUUID:clipUUID:", v12, v13, 0, 0);

  -[HUCameraPlayerConfiguration setStartingPlaybackDate:](v14, "setStartingPlaybackDate:", v8);
  -[HUDashboardCameraItemModuleController _presentCameraPlayerViewControllerForCameraItem:withConfiguration:](self, "_presentCameraPlayerViewControllerForCameraItem:withConfiguration:", v9, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)_presentCameraPlayerViewControllerForCameraItem:(id)a3 cameraClip:(id)a4 animated:(BOOL)a5
{
  id v7;
  id v8;
  HUCameraPlayerConfiguration *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HUCameraPlayerConfiguration *v14;
  void *v15;

  v7 = a4;
  v8 = a3;
  v9 = [HUCameraPlayerConfiguration alloc];
  -[HUItemModuleController module](self, "module");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "profile");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uniqueIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[HUCameraPlayerConfiguration initWithHome:cameraProfile:notificationUUID:clipUUID:](v9, "initWithHome:cameraProfile:notificationUUID:clipUUID:", v11, v12, 0, v13);
  -[HUDashboardCameraItemModuleController _presentCameraPlayerViewControllerForCameraItem:withConfiguration:](self, "_presentCameraPlayerViewControllerForCameraItem:withConfiguration:", v8, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)_presentCameraPlayerViewControllerForCameraItem:(id)a3
{
  id v4;
  HUCameraPlayerConfiguration *v5;
  void *v6;
  void *v7;
  void *v8;
  HUCameraPlayerConfiguration *v9;
  void *v10;

  v4 = a3;
  v5 = [HUCameraPlayerConfiguration alloc];
  -[HUItemModuleController module](self, "module");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "profile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HUCameraPlayerConfiguration initWithHome:cameraProfile:notificationUUID:clipUUID:](v5, "initWithHome:cameraProfile:notificationUUID:clipUUID:", v7, v8, 0, 0);

  -[HUDashboardCameraItemModuleController _presentCameraPlayerViewControllerForCameraItem:withConfiguration:](self, "_presentCameraPlayerViewControllerForCameraItem:withConfiguration:", v4, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_presentCameraPlayerViewControllerForCameraItem:(id)a3 withConfiguration:(id)a4
{
  id v6;
  id v7;
  HUCameraController *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[5];
  id v15;

  v6 = a4;
  v7 = a3;
  v8 = -[HUCameraController initWithConfiguration:cameraDelegate:]([HUCameraController alloc], "initWithConfiguration:cameraDelegate:", v6, self);

  -[HUDashboardCameraItemModuleController setCameraController:](self, "setCameraController:", v8);
  -[HUDashboardCameraItemModuleController _sourceViewForPresentingCameraItem:](self, "_sourceViewForPresentingCameraItem:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0D519C0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __107__HUDashboardCameraItemModuleController__presentCameraPlayerViewControllerForCameraItem_withConfiguration___block_invoke;
  v14[3] = &unk_1E6F4D600;
  v14[4] = self;
  v15 = v9;
  v11 = v9;
  objc_msgSend(v10, "futureWithBlock:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void __107__HUDashboardCameraItemModuleController__presentCameraPlayerViewControllerForCameraItem_withConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "cameraController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "playerViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 40);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __107__HUDashboardCameraItemModuleController__presentCameraPlayerViewControllerForCameraItem_withConfiguration___block_invoke_2;
  v8[3] = &unk_1E6F4D988;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v5, "showFullScreenPresentationFromView:completion:", v6, v8);

}

uint64_t __107__HUDashboardCameraItemModuleController__presentCameraPlayerViewControllerForCameraItem_withConfiguration___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");
}

- (id)presentItem:(id)a3 destination:(unint64_t)a4 animated:(BOOL)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[6];

  v7 = a3;
  objc_opt_class();
  v8 = v7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  if (v10)
  {
    -[HUDashboardCameraItemModuleController _presentCameraPlayerViewControllerForCameraItem:](self, "_presentCameraPlayerViewControllerForCameraItem:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __74__HUDashboardCameraItemModuleController_presentItem_destination_animated___block_invoke;
    v16[3] = &unk_1E6F4DE08;
    v16[4] = self;
    v16[5] = a4;
    objc_msgSend(v11, "flatMap:", v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 30);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "futureWithError:", v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

id __74__HUDashboardCameraItemModuleController_presentItem_destination_animated___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  if (*(_QWORD *)(a1 + 40) == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "cameraController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "presentSettingsViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", a2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_sourceViewForPresentingCameraItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v4 = a3;
  objc_opt_class();
  -[HUDashboardCameraItemModuleController mapTable](self, "mapTable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
  {
    objc_msgSend(v8, "cameraContentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_detailsViewControllerForCameraItem:(id)a3
{
  id v3;
  void *v4;
  HUServiceDetailsViewController *v5;
  NSObject *v6;
  uint8_t v8[16];

  v3 = a3;
  objc_msgSend(v3, "profile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = -[HUServiceDetailsViewController initWithServiceLikeItem:]([HUServiceDetailsViewController alloc], "initWithServiceLikeItem:", v3);
  }
  else
  {
    HFLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_error_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_ERROR, "Camera profile must not be nil to show the editor.", v8, 2u);
    }

    v5 = 0;
  }

  return v5;
}

- (void)_logInteractionEventOfType:(unint64_t)a3 withItem:(id)a4
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  _QWORD v17[5];

  v17[4] = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0D31170];
  v16[0] = *MEMORY[0x1E0D30318];
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = a4;
  objc_msgSend(v7, "numberWithUnsignedInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0D30328];
  v17[0] = v9;
  v17[1] = v8;
  v11 = *MEMORY[0x1E0D30358];
  v16[1] = v10;
  v16[2] = v11;
  v17[2] = self;
  v16[3] = *MEMORY[0x1E0D30340];
  -[HUItemModuleController module](self, "module");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "room");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C9AAB0];
  if (!v13)
    v14 = MEMORY[0x1E0C9AAA0];
  v17[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sendEvent:withData:", 13, v15);

}

- (id)targetViewForDismissingCameraProfile:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  -[HUItemModuleController module](self, "module");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __78__HUDashboardCameraItemModuleController_targetViewForDismissingCameraProfile___block_invoke;
  v11[3] = &unk_1E6F4DAD8;
  v12 = v4;
  v7 = v4;
  objc_msgSend(v6, "na_firstObjectPassingTest:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUDashboardCameraItemModuleController _sourceViewForPresentingCameraItem:](self, "_sourceViewForPresentingCameraItem:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __78__HUDashboardCameraItemModuleController_targetViewForDismissingCameraProfile___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(v6, "profile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 32));

  return v8;
}

- (void)didDismissCameraController:(id)a3 forProfile:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  -[HUDashboardCameraItemModuleController cameraController](self, "cameraController");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v5)
    -[HUDashboardCameraItemModuleController setCameraController:](self, "setCameraController:", 0);
}

- (void)disableCameraSnapshotsForCells:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v7);
        objc_opt_class();
        v9 = v8;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v10 = v9;
        else
          v10 = 0;
        v11 = v10;

        if (v11)
        {
          objc_msgSend(v11, "item");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "profile");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "hf_cameraManager");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "endPeriodicSnapshotsWithRequester:", v11);

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }

}

- (HUCameraController)cameraController
{
  return self->_cameraController;
}

- (void)setCameraController:(id)a3
{
  objc_storeStrong((id *)&self->_cameraController, a3);
}

- (void)setMapTable:(id)a3
{
  objc_storeStrong((id *)&self->_mapTable, a3);
}

- (void)setCameraPresentationStyle:(int64_t)a3
{
  self->_cameraPresentationStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapTable, 0);
  objc_storeStrong((id *)&self->_cameraController, 0);
}

@end
