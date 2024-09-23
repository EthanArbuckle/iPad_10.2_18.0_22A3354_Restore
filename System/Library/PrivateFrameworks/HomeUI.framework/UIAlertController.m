@implementation UIAlertController

void __89__UIAlertController_HUAdditions__alertControllerForAddingDestinationWithType_andProceed___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setAutocapitalizationType:", 1);
  objc_msgSend(v2, "setAutocorrectionType:", 0);

}

void __89__UIAlertController_HUAdditions__alertControllerForAddingDestinationWithType_andProceed___block_invoke_2()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136315138;
    v2 = "+[UIAlertController(HUAdditions) alertControllerForAddingDestinationWithType:andProceed:]_block_invoke_2";
    _os_log_impl(&dword_1B8E1E000, v0, OS_LOG_TYPE_DEFAULT, "(%s) User tapped cancel button from alert", (uint8_t *)&v1, 0xCu);
  }

}

void __89__UIAlertController_HUAdditions__alertControllerForAddingDestinationWithType_andProceed___block_invoke_23(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "+[UIAlertController(HUAdditions) alertControllerForAddingDestinationWithType:andProceed:]_block_invoke";
    _os_log_impl(&dword_1B8E1E000, v2, OS_LOG_TYPE_DEFAULT, "(%s) User tapped Add button from alert", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "textFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D319D0], "sanitizeUserEnteredHomeKitName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v6);

}

void __95__UIAlertController_HUAdditions__alertControllerForAddingDestinationWithTypeString_andProceed___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setAutocapitalizationType:", 1);
  objc_msgSend(v2, "setAutocorrectionType:", 0);

}

void __95__UIAlertController_HUAdditions__alertControllerForAddingDestinationWithTypeString_andProceed___block_invoke_2()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136315138;
    v2 = "+[UIAlertController(HUAdditions) alertControllerForAddingDestinationWithTypeString:andProceed:]_block_invoke_2";
    _os_log_impl(&dword_1B8E1E000, v0, OS_LOG_TYPE_DEFAULT, "(%s) User tapped 'Cancel' from alert", (uint8_t *)&v1, 0xCu);
  }

}

void __95__UIAlertController_HUAdditions__alertControllerForAddingDestinationWithTypeString_andProceed___block_invoke_38(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "+[UIAlertController(HUAdditions) alertControllerForAddingDestinationWithTypeString:andProceed:]_block_invoke";
    _os_log_impl(&dword_1B8E1E000, v2, OS_LOG_TYPE_DEFAULT, "(%s) User tapped 'Add' button from alert", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "textFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
  {
    objc_msgSend(v4, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  }
}

void __76__UIAlertController_HUAdditions__hu_alertControllerForUnimplementedFeature___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v2, "title");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 136315394;
    v6 = "+[UIAlertController(HUAdditions) hu_alertControllerForUnimplementedFeature:]_block_invoke";
    v7 = 2114;
    v8 = v4;
    _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEFAULT, "(%s) User tapped '%{public}@' from alert", (uint8_t *)&v5, 0x16u);

  }
}

void __88__UIAlertController_HUAdditions__hu_alertControllerForAcknowledgementWithTitle_message___block_invoke()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136315138;
    v2 = "+[UIAlertController(HUAdditions) hu_alertControllerForAcknowledgementWithTitle:message:]_block_invoke";
    _os_log_impl(&dword_1B8E1E000, v0, OS_LOG_TYPE_DEFAULT, "(%s) User tapped 'OK' from alert", (uint8_t *)&v1, 0xCu);
  }

}

uint64_t __89__UIAlertController_HUAdditions__hu_alertControllerForAddingPersonWithCompletionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t result;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 136315394;
    v6 = "+[UIAlertController(HUAdditions) hu_alertControllerForAddingPersonWithCompletionHandler:]_block_invoke";
    v7 = 2114;
    v8 = v3;
    _os_log_impl(&dword_1B8E1E000, v2, OS_LOG_TYPE_DEFAULT, "(%s) User tapped '%{public}@' from alert", (uint8_t *)&v5, 0x16u);
  }

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, MEMORY[0x1E0C9AAB0]);
  return result;
}

uint64_t __89__UIAlertController_HUAdditions__hu_alertControllerForAddingPersonWithCompletionHandler___block_invoke_63(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t result;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 136315394;
    v6 = "+[UIAlertController(HUAdditions) hu_alertControllerForAddingPersonWithCompletionHandler:]_block_invoke";
    v7 = 2114;
    v8 = v3;
    _os_log_impl(&dword_1B8E1E000, v2, OS_LOG_TYPE_DEFAULT, "(%s) User tapped '%{public}@' from alert", (uint8_t *)&v5, 0x16u);
  }

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, MEMORY[0x1E0C9AAA0]);
  return result;
}

@end
