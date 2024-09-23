@implementation PKGenerationModelAvailabilityController

+ (id)sharedInstance
{
  if (_MergedGlobals_114 != -1)
    dispatch_once(&_MergedGlobals_114, &__block_literal_global_11);
  return (id)qword_1ECEE60F8;
}

void __57__PKGenerationModelAvailabilityController_sharedInstance__block_invoke()
{
  PKGenerationModelAvailabilityController *v0;
  void *v1;

  v0 = objc_alloc_init(PKGenerationModelAvailabilityController);
  v1 = (void *)qword_1ECEE60F8;
  qword_1ECEE60F8 = (uint64_t)v0;

}

- (PKGenerationModelAvailabilityController)init
{
  PKGenerationModelAvailabilityController *v2;
  PKGenerationModelAvailabilityController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKGenerationModelAvailabilityController;
  v2 = -[PKGenerationModelAvailabilityController init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->generationModelAvailabilityStatus = 3;
    -[PKGenerationModelAvailabilityController queryGenerationModelAvailabilityStatus](v2, "queryGenerationModelAvailabilityStatus");
  }
  return v3;
}

- (void)queryGenerationModelAvailabilityStatus
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __81__PKGenerationModelAvailabilityController_queryGenerationModelAvailabilityStatus__block_invoke;
  v2[3] = &unk_1E77786B0;
  v2[4] = self;
  -[PKGenerationModelAvailabilityController queryGenerationModelAvailabilityStatusWithCompletionHandler:](self, "queryGenerationModelAvailabilityStatusWithCompletionHandler:", v2);
}

void __81__PKGenerationModelAvailabilityController_queryGenerationModelAvailabilityStatus__block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = os_log_create("com.apple.pencilkit", "ModelAvailability");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "stringRepresentationOfAvailabilityStatus:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_1BE213000, v4, OS_LOG_TYPE_DEFAULT, "Status of generation model availability is: %@", (uint8_t *)&v6, 0xCu);

  }
}

- (void)queryGenerationModelAvailabilityStatusWithCompletionHandler:(id)a3
{
  void (**v4)(id, int64_t);
  int64_t generationModelAvailabilityStatus;
  _QWORD v6[5];
  void (**v7)(id, int64_t);
  id v8;
  id location;

  v4 = (void (**)(id, int64_t))a3;
  objc_initWeak(&location, self);
  if (!-[PKGenerationModelAvailabilityController isGenerationModelAvailabilityUndetermined](self, "isGenerationModelAvailabilityUndetermined"))
  {
    generationModelAvailabilityStatus = self->generationModelAvailabilityStatus;
LABEL_6:
    v4[2](v4, generationModelAvailabilityStatus);
    goto LABEL_7;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    generationModelAvailabilityStatus = 1;
    self->generationModelAvailabilityStatus = 1;
    goto LABEL_6;
  }
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __103__PKGenerationModelAvailabilityController_queryGenerationModelAvailabilityStatusWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E7778700;
  objc_copyWeak(&v8, &location);
  v6[4] = self;
  v7 = v4;
  +[PKGenerationModelAvailabilityController generationModelAvailabilityForGenerationToolWithCompletionHandler:](PKGenerationModelAvailabilityController, "generationModelAvailabilityForGenerationToolWithCompletionHandler:", v6);

  objc_destroyWeak(&v8);
LABEL_7:
  objc_destroyWeak(&location);

}

void __103__PKGenerationModelAvailabilityController_queryGenerationModelAvailabilityStatusWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  _QWORD v5[5];
  id v6;
  id v7[2];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __103__PKGenerationModelAvailabilityController_queryGenerationModelAvailabilityStatusWithCompletionHandler___block_invoke_2;
  v5[3] = &unk_1E77786D8;
  objc_copyWeak(v7, (id *)(a1 + 48));
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v7[1] = a2;
  v6 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(v7);
}

void __103__PKGenerationModelAvailabilityController_queryGenerationModelAvailabilityStatusWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = *(_QWORD *)(a1 + 56);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v6 = CFSTR("PKGenerationModelAvailabilityStatusKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 56));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("PKGenerationModelAvailabilityStatusDidChangeNotification"), *(_QWORD *)(a1 + 32), v4);

  }
}

- (void)handleAvailabilityChange:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  self->generationModelAvailabilityStatus = a3;
  +[PKToolPicker updateAllToolPickersWithGenerationToolAvailability](PKToolPicker, "updateAllToolPickersWithGenerationToolAvailability");
  v8 = CFSTR("PKGenerationModelAvailabilityStatusKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("PKGenerationModelAvailabilityStatusDidChangeNotification"), self, v6);

}

- (BOOL)isGenerationModelAvailabilityUndetermined
{
  return self->generationModelAvailabilityStatus == 3;
}

- (BOOL)isGenerationModelAvailable
{
  void *v3;
  void *v4;
  int v5;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.mobilenotes"));

  return v5 && (self->generationModelAvailabilityStatus & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (BOOL)isGenerationModelDisabled
{
  return self->generationModelAvailabilityStatus == 2;
}

- (id)stringRepresentationOfAvailabilityStatus:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
    return CFSTR("unknown");
  else
    return off_1E7778720[a3];
}

- (BOOL)presentGreymatterAvailabilityAlertControllerInWindow:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = -[PKGenerationModelAvailabilityController isGenerationModelDisabled](self, "isGenerationModelDisabled");
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", CFSTR("On Device Intelligence Model Required"), CFSTR("Features will download when your device is charging and connected to Wi-Fi."), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0DC3448];
    _PencilKitBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Done"), CFSTR("Done"), CFSTR("Localizable"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "actionWithTitle:style:handler:", v9, 1, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addAction:", v10);

    objc_msgSend(v4, "rootViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "presentViewController:animated:completion:", v6, 1, 0);

  }
  return v5;
}

@end
