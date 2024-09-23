@implementation CNSharingProfileLogger

- (CNSharingProfileLogger)init
{
  CNSharingProfileLogger *v2;
  uint64_t v3;
  OS_os_log *log;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CNSharingProfileLogger;
  v2 = -[CNSharingProfileLogger init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v3 = objc_claimAutoreleasedReturnValue();
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

  }
  return v2;
}

- (void)logOnboardingSavingMeCardImageToRecentsForIdentifier:(id)a3
{
  id v4;
  NSObject *log;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_18AC56000, log, OS_LOG_TYPE_DEFAULT, "[Onboarding] Saving contact image to recents for contact with identifier %{public}@", (uint8_t *)&v6, 0xCu);
  }

}

- (void)logOnboardingSavingMeCardPosterToRecentsForIdentifier:(id)a3
{
  id v4;
  NSObject *log;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_18AC56000, log, OS_LOG_TYPE_DEFAULT, "[Onboarding] Saving contact poster to recents for contact with identifier %{public}@", (uint8_t *)&v6, 0xCu);
  }

}

- (void)logOnboardingSuccessSavingMeCardImageToRecents
{
  NSObject *log;
  uint8_t v3[16];

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_18AC56000, log, OS_LOG_TYPE_DEFAULT, "[Onboarding] Success saving contact image to recents", v3, 2u);
  }
}

- (void)logOnboardingSuccessSavingMeCardPosterToRecents
{
  NSObject *log;
  uint8_t v3[16];

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_18AC56000, log, OS_LOG_TYPE_DEFAULT, "[Onboarding] Success saving contact poster to recents", v3, 2u);
  }
}

- (void)logOnboardingErrorSavingMeCardImageToRecentsWithDescription:(id)a3
{
  id v4;
  NSObject *log;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_18AC56000, log, OS_LOG_TYPE_DEFAULT, "[Onboarding] Error saving contact image to recents: %{public}@", (uint8_t *)&v6, 0xCu);
  }

}

- (void)logOnboardingErrorSavingMeCardPosterToRecentsWithDescription:(id)a3
{
  id v4;
  NSObject *log;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_18AC56000, log, OS_LOG_TYPE_DEFAULT, "[Onboarding] Error saving contact poster to recents: %{public}@", (uint8_t *)&v6, 0xCu);
  }

}

- (void)logOnboardingSavingContact:(id)a3
{
  id v4;
  NSObject *log;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_18AC56000, log, OS_LOG_TYPE_DEFAULT, "[Onboarding] Saving contact with identifier %{public}@", (uint8_t *)&v6, 0xCu);
  }

}

- (void)logOnboardingAddingContact
{
  NSObject *log;
  uint8_t v3[16];

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_18AC56000, log, OS_LOG_TYPE_DEFAULT, "[Onboarding] Adding contact", v3, 2u);
  }
}

- (void)logOnboardingUpdatingContactWithIdentifier:(id)a3
{
  id v4;
  NSObject *log;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_18AC56000, log, OS_LOG_TYPE_DEFAULT, "[Onboarding] Updating contact with identifier %{public}@", (uint8_t *)&v6, 0xCu);
  }

}

- (void)logOnboardingErrorSavingContactWithDescription:(id)a3
{
  id v4;
  NSObject *log;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_error_impl(&dword_18AC56000, log, OS_LOG_TYPE_ERROR, "[Onboarding] Error saving contact: %{public}@", (uint8_t *)&v6, 0xCu);
  }

}

- (void)logOnboardingSettingMeContact
{
  NSObject *log;
  uint8_t v3[16];

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_18AC56000, log, OS_LOG_TYPE_DEFAULT, "[Onboarding] Setting me contact", v3, 2u);
  }
}

- (void)logOnboardingErrorSettingMeContactWithDescription:(id)a3
{
  id v4;
  NSObject *log;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_error_impl(&dword_18AC56000, log, OS_LOG_TYPE_ERROR, "[Onboarding] Error setting contact as me card: %{public}@", (uint8_t *)&v6, 0xCu);
  }

}

- (void)logOnboardingSuccessSavingContact
{
  NSObject *log;
  uint8_t v3[16];

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_18AC56000, log, OS_LOG_TYPE_DEFAULT, "[Onboarding] Saving contact succeeded", v3, 2u);
  }
}

- (void)logOnboardingAvatarCarouselErrorCreatingContactImageWithDescription:(id)a3
{
  id v4;
  NSObject *log;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_error_impl(&dword_18AC56000, log, OS_LOG_TYPE_ERROR, "[Onboarding] Error generating contact image: %@", (uint8_t *)&v6, 0xCu);
  }

}

- (void)logOnboardingReturningSharingResultWithDescription:(id)a3
{
  id v4;
  NSObject *log;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_18AC56000, log, OS_LOG_TYPE_DEFAULT, "[Onboarding] Returning sharing result with description: %@", (uint8_t *)&v6, 0xCu);
  }

}

- (void)logOnboardingReturningDefaultMonogram
{
  NSObject *log;
  uint8_t v3[16];

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_18AC56000, log, OS_LOG_TYPE_DEFAULT, "[Settings] Default gray monogram selected, returning empty imageData", v3, 2u);
  }
}

- (void)logOnboardingReturningEmptyImage
{
  NSObject *log;
  uint8_t v3[16];

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v3 = 0;
    _os_log_error_impl(&dword_18AC56000, log, OS_LOG_TYPE_ERROR, "[Onboarding] Image returned is empty!", v3, 2u);
  }
}

- (void)logOnboardingReturningNonAnimojiItem
{
  NSObject *log;
  uint8_t v3[16];

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v3 = 0;
    _os_log_error_impl(&dword_18AC56000, log, OS_LOG_TYPE_ERROR, "[Onboarding] Pose picker finished with a provider item that was not of type CNPhotoPickerAnimojiProviderItem, Memoji metadata will not be saved", v3, 2u);
  }
}

- (void)logSettingsSavingContact:(id)a3
{
  id v4;
  NSObject *log;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_18AC56000, log, OS_LOG_TYPE_DEFAULT, "[Settings] Saving contact with identifier %{public}@", (uint8_t *)&v6, 0xCu);
  }

}

- (void)logSettingsErrorSavingContactWithDescription:(id)a3
{
  id v4;
  NSObject *log;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_error_impl(&dword_18AC56000, log, OS_LOG_TYPE_ERROR, "[Settings] Error saving contact: %@", (uint8_t *)&v6, 0xCu);
  }

}

- (void)logSettingsSettingMeContact
{
  NSObject *log;
  uint8_t v3[16];

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_18AC56000, log, OS_LOG_TYPE_DEFAULT, "[Settings] Saving contact", v3, 2u);
  }
}

- (void)logSettingsErrorSettingMeContactWithDescription:(id)a3
{
  id v4;
  NSObject *log;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_error_impl(&dword_18AC56000, log, OS_LOG_TYPE_ERROR, "[Settings] Error setting me contact: %@", (uint8_t *)&v6, 0xCu);
  }

}

- (void)logSettingsSuccessSavingContact
{
  NSObject *log;
  uint8_t v3[16];

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_18AC56000, log, OS_LOG_TYPE_DEFAULT, "[Settings] Saving contact succeeded", v3, 2u);
  }
}

- (void)logErrorGeneratingAvatarForPhotoPickerWithDescription:(id)a3
{
  id v4;
  NSObject *log;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_18AC56000, log, OS_LOG_TYPE_DEFAULT, "[Settings] Error generating avatar image prior to presenting photo picker: %@", (uint8_t *)&v6, 0xCu);
  }

}

- (void)logSettingsReturningSharingResultWithDescription:(id)a3
{
  id v4;
  NSObject *log;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_18AC56000, log, OS_LOG_TYPE_DEFAULT, "[Settings] Returning sharing result with description: %@", (uint8_t *)&v6, 0xCu);
  }

}

- (void)logSettingsReturningDefaultMonogram
{
  NSObject *log;
  uint8_t v3[16];

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_18AC56000, log, OS_LOG_TYPE_DEFAULT, "[Settings] Default gray monogram selected, returning empty imageData", v3, 2u);
  }
}

- (void)logSettingsReturningEmptyImageForNoChange
{
  NSObject *log;
  uint8_t v3[16];

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_18AC56000, log, OS_LOG_TYPE_DEFAULT, "[Settings] No image changes detected, returning empty image", v3, 2u);
  }
}

- (void)logSettingsReturningEmptyImage
{
  NSObject *log;
  uint8_t v3[16];

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v3 = 0;
    _os_log_error_impl(&dword_18AC56000, log, OS_LOG_TYPE_ERROR, "[Settings] Image returned is empty!", v3, 2u);
  }
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
}

+ (id)log
{
  if (log_cn_once_token_1_48333 != -1)
    dispatch_once(&log_cn_once_token_1_48333, &__block_literal_global_48334);
  return (id)log_cn_once_object_1_48335;
}

void __29__CNSharingProfileLogger_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contactsui", "MeCardSharing");
  v1 = (void *)log_cn_once_object_1_48335;
  log_cn_once_object_1_48335 = (uint64_t)v0;

}

@end
