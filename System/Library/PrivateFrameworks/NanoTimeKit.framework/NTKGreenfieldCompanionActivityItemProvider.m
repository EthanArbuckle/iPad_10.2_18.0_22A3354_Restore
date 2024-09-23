@implementation NTKGreenfieldCompanionActivityItemProvider

- (NTKGreenfieldCompanionActivityItemProvider)initWithDraftRecipe:(id)a3 previewImage:(id)a4
{
  id v7;
  id v8;
  id v9;
  NTKGreenfieldCompanionActivityItemProvider *v10;
  NTKGreenfieldCompanionActivityItemProvider *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v9 = objc_alloc_init(MEMORY[0x1E0CB36C8]);
  objc_msgSend(v9, "registerDataRepresentationForTypeIdentifier:visibility:loadHandler:", CFSTR("com.apple.watchface"), 0, &__block_literal_global_15);
  v13.receiver = self;
  v13.super_class = (Class)NTKGreenfieldCompanionActivityItemProvider;
  v10 = -[UIActivityItemProvider initWithPlaceholderItem:](&v13, sel_initWithPlaceholderItem_, v9);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_draftRecipe, a3);
    objc_storeStrong((id *)&v11->_previewImage, a4);
  }

  return v11;
}

uint64_t __79__NTKGreenfieldCompanionActivityItemProvider_initWithDraftRecipe_previewImage___block_invoke(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, _QWORD, _QWORD))(a2 + 16))(a2, 0, 0);
  return 0;
}

- (id)activityViewControllerLinkPresentationMetadata:(id)a3
{
  objc_class *v4;
  UIImage *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  unint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = (objc_class *)MEMORY[0x1E0CC11A8];
  v5 = self->_previewImage;
  v6 = objc_alloc_init(v4);
  -[NTKGreenfieldDraftRecipe faceForSharing](self->_draftRecipe, "faceForSharing");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "faceSharingName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v8);

  v9 = objc_alloc_init(MEMORY[0x1E0CC1190]);
  objc_msgSend(v9, "setType:", 5);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC1178]), "initWithPlatformImage:properties:", v5, v9);
  objc_msgSend(v6, "setImage:", v10);

  v11 = -[NTKGreenfieldDraftRecipe faceForSharingComplicationOptionsCount](self->_draftRecipe, "faceForSharingComplicationOptionsCount");
  if (v11)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0CC1210]);
    NTKClockFaceLocalizedString(CFSTR("GREENFIELD_COMPLICATION_COUNT_DESCRIPTION"), CFSTR("%lu Complications"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v13, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v14);
    objc_msgSend(v12, "setStatus:", v15);

    objc_msgSend(v6, "setSpecialization:", v12);
  }

  return v6;
}

- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4
{
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;

  if ((id)*MEMORY[0x1E0D96DB0] == a4)
  {
    -[NTKGreenfieldDraftRecipe faceForSharing](self->_draftRecipe, "faceForSharing", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "faceSharingName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    NTKClockFaceLocalizedString(CFSTR("GREENFIELD_SHARE_WATCH_FACE_SUBJECT"), CFSTR("Apple Watch Face — %@"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v7, v6);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = &stru_1E6BDC918;
  }
  return v4;
}

- (id)item
{
  dispatch_semaphore_t v3;
  NTKGreenfieldDraftRecipe *draftRecipe;
  NSObject *v5;
  dispatch_time_t v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *, void *);
  void *v12;
  NTKGreenfieldCompanionActivityItemProvider *v13;
  dispatch_semaphore_t v14;

  v3 = dispatch_semaphore_create(0);
  draftRecipe = self->_draftRecipe;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __50__NTKGreenfieldCompanionActivityItemProvider_item__block_invoke;
  v12 = &unk_1E6BCEE68;
  v13 = self;
  v14 = v3;
  v5 = v3;
  +[NTKGreenfieldUtilities encodeRecipeFromDraftRecipe:completionBlock:](NTKGreenfieldUtilities, "encodeRecipeFromDraftRecipe:completionBlock:", draftRecipe, &v9);
  v6 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v5, v6);
  -[NTKGreenfieldEncodedRecipe watchFaceDataUrl](self->_encodedRecipe, "watchFaceDataUrl", v9, v10, v11, v12, v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __50__NTKGreenfieldCompanionActivityItemProvider_item__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[5];
  id v15;

  v6 = a2;
  v7 = a3;
  v8 = v7;
  if (v7)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __50__NTKGreenfieldCompanionActivityItemProvider_item__block_invoke_2;
    v14[3] = &unk_1E6BCD778;
    v14[4] = *(_QWORD *)(a1 + 32);
    v15 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], v14);

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 280), a2);
    objc_msgSend(v6, "watchFaceImage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKGreenfieldUtilities addBorder:toWatchFaceImage:](NTKGreenfieldUtilities, "addBorder:toWatchFaceImage:", 3, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "writeImageToDisk:suffix:", v10, CFSTR("email"));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(v12 + 288);
    *(_QWORD *)(v12 + 288) = v11;

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void __50__NTKGreenfieldCompanionActivityItemProvider_item__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "companionActivityItemProvider:handleError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (id)writeImageToDisk:(id)a3 suffix:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  if (a3)
  {
    v6 = a4;
    UIImagePNGRepresentation((UIImage *)a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0CB3940];
    -[NTKGreenfieldEncodedRecipe watchFaceName](self->_encodedRecipe, "watchFaceName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%@_%@@2x.png"), v9, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    NSTemporaryDirectory();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByAppendingString:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "writeToURL:atomically:", v13, 1);

  }
  else
  {
    v13 = 0;
  }
  return v13;
}

- (id)activityViewController:(id)a3 itemsForActivityType:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NTKGreenfieldCompanionActivityItemProvider;
  v6 = a4;
  -[UIActivityItemProvider activityViewController:itemForActivityType:](&v11, sel_activityViewController_itemForActivityType_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array", v11.receiver, v11.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D96DB0]);

  if (v9 && self->_emailImageUrl)
    objc_msgSend(v8, "addObject:");
  if (v7)
    objc_msgSend(v8, "addObject:", v7);

  return v8;
}

- (NTKGreenfieldCompanionActivityItemProviderDelegate)delegate
{
  return (NTKGreenfieldCompanionActivityItemProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_previewImage, 0);
  objc_storeStrong((id *)&self->_emailImageUrl, 0);
  objc_storeStrong((id *)&self->_encodedRecipe, 0);
  objc_storeStrong((id *)&self->_draftRecipe, 0);
}

@end
