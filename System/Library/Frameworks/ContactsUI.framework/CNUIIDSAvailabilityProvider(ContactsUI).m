@implementation CNUIIDSAvailabilityProvider(ContactsUI)

+ (id)validateHandlesForIMessage:()ContactsUI availabilityProvider:schedulerProvider:handler:
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;

  v9 = a6;
  v10 = a5;
  objc_msgSend(a4, "validateHandlesForIMessage:schedulerProvider:", a3, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "mainThreadScheduler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "observeOn:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0D13AF0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __117__CNUIIDSAvailabilityProvider_ContactsUI__validateHandlesForIMessage_availabilityProvider_schedulerProvider_handler___block_invoke;
  v19[3] = &unk_1E204D600;
  v20 = v9;
  v15 = v9;
  objc_msgSend(v14, "observerWithResultBlock:", v19);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "subscribe:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)validateHandlesForFaceTime:()ContactsUI availabilityProvider:schedulerProvider:handler:
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;

  v9 = a6;
  v10 = a5;
  objc_msgSend(a4, "validateHandlesForFaceTime:schedulerProvider:", a3, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "mainThreadScheduler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "observeOn:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0D13AF0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __117__CNUIIDSAvailabilityProvider_ContactsUI__validateHandlesForFaceTime_availabilityProvider_schedulerProvider_handler___block_invoke;
  v19[3] = &unk_1E204D600;
  v20 = v9;
  v15 = v9;
  objc_msgSend(v14, "observerWithResultBlock:", v19);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "subscribe:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

@end
