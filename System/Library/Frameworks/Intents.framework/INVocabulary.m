@implementation INVocabulary

- (void)removeAllVocabularyStrings
{
  id v2;

  +[_INVocabulary sharedVocabulary](_INVocabulary, "sharedVocabulary");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllVocabularyStrings");

}

- (void)setVocabularyStrings:(NSOrderedSet *)vocabulary ofType:(INVocabularyStringType)type
{
  NSOrderedSet *v5;
  id v6;

  v5 = vocabulary;
  +[_INVocabulary sharedVocabulary](_INVocabulary, "sharedVocabulary");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setVocabularyStrings:ofType:", v5, type);

}

void __33___INVocabulary_sharedVocabulary__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedVocabulary_sSharedInstance;
  sharedVocabulary_sSharedInstance = (uint64_t)v1;

}

void __45___INVocabulary_setVocabularyStrings_ofType___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "validateVocabularyType:", *(_QWORD *)(a1 + 48));
  +[_INAggregator logReceivedCount:ofVocabularyStringType:](_INAggregator, "logReceivedCount:ofVocabularyStringType:", objc_msgSend(*(id *)(a1 + 40), "count"), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "_validator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "validatedItemsFromVocabularyStrings:ofType:loggingWarnings:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 1);
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setValidatedVocabulary:ofType:", v3, *(_QWORD *)(a1 + 48));
}

void __32__INVocabulary_sharedVocabulary__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedVocabulary_sharedVocabulary;
  sharedVocabulary_sharedVocabulary = (uint64_t)v1;

}

- (INVocabulary)init
{
  INVocabulary *v3;
  objc_super v5;

  if ((INThisProcessHasEntitlement(CFSTR("com.apple.developer.siri"), 1) & 1) != 0)
  {
    v5.receiver = self;
    v5.super_class = (Class)INVocabulary;
    self = -[INVocabulary init](&v5, sel_init);
    v3 = self;
  }
  else
  {
    -[INVocabulary _THROW_EXCEPTION_FOR_PROCESS_MISSING_ENTITLEMENT_com_apple_developer_siri](self, "_THROW_EXCEPTION_FOR_PROCESS_MISSING_ENTITLEMENT_com_apple_developer_siri");
    v3 = 0;
  }

  return v3;
}

void __58___INVocabulary_setValidatedVocabulary_ofType_onBehalfOf___block_invoke(uint64_t a1, char a2)
{
  _QWORD v3[4];
  id v4[2];

  if ((a2 & 1) == 0)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __58___INVocabulary_setValidatedVocabulary_ofType_onBehalfOf___block_invoke_2;
    v3[3] = &unk_1E2290780;
    objc_copyWeak(v4, (id *)(a1 + 32));
    v4[1] = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E0C80D38], v3);
    objc_destroyWeak(v4);
  }
}

uint64_t __43___INVocabulary_removeAllVocabularyStrings__block_invoke()
{
  return objc_msgSend((id)objc_opt_class(), "clearAllCustomVocabulary");
}

+ (INVocabulary)sharedVocabulary
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__INVocabulary_sharedVocabulary__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedVocabulary_onceToken != -1)
    dispatch_once(&sharedVocabulary_onceToken, block);
  return (INVocabulary *)(id)sharedVocabulary_sharedVocabulary;
}

- (void)setVocabulary:(NSOrderedSet *)vocabulary ofType:(INVocabularyStringType)type
{
  NSOrderedSet *v5;
  id v6;

  v5 = vocabulary;
  +[_INVocabulary sharedVocabulary](_INVocabulary, "sharedVocabulary");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setVocabulary:ofType:", v5, type);

}

- (void)_THROW_EXCEPTION_FOR_PROCESS_MISSING_ENTITLEMENT_com_apple_developer_siri
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Use of the class %@ requires the entitlement %@. Make sure you have enabled the Siri capability in your Xcode project."), objc_opt_class(), CFSTR("com.apple.developer.siri"));
  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], objc_claimAutoreleasedReturnValue(), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

uint64_t __54___INVocabulary_removeAllVocabularyStringsOnBehalfOf___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_opt_class(), "clearAllCustomVocabularyOnBehalfOf:", *(_QWORD *)(a1 + 40));
}

void __50___INVocabulary__setVocabulary_ofType_onBehalfOf___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "validateVocabularyType:", *(_QWORD *)(a1 + 56));
  +[_INAggregator logReceivedCount:ofVocabularyStringType:](_INAggregator, "logReceivedCount:ofVocabularyStringType:", objc_msgSend(*(id *)(a1 + 40), "count"), *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "_validator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "validatedItemsFromVocabularySpeakables:ofType:loggingWarnings:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), 1);
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setValidatedVocabulary:ofType:onBehalfOf:", v3, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

void __58___INVocabulary_setValidatedVocabulary_ofType_onBehalfOf___block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  _INStringFromVocabularyStringType(*(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_THROW_EXCEPTION_FOR_ATTEMPT_TO_PROVIDE_VOCABULARY_OF_TYPE_THAT_APP_DOES_NOT_HANDLE_:", v2);

}

void __47___INVocabulary_supportedVocabularyStringTypes__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[21];

  v2[20] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("ContactNameType");
  v2[1] = CFSTR("ContactGroupNameType");
  v2[2] = CFSTR("PhotoTagsType");
  v2[3] = CFSTR("PhotoAlbumNameType");
  v2[4] = CFSTR("PhotoMemoryNameType");
  v2[5] = CFSTR("HealthActivityNameType");
  v2[6] = CFSTR("CarProfileNameType");
  v2[7] = CFSTR("CarNameType");
  v2[8] = CFSTR("PaymentsOrganizationNameType");
  v2[9] = CFSTR("PaymentsAccountNicknameType");
  v2[10] = CFSTR("NotebookItemTitleType");
  v2[11] = CFSTR("NotebookItemGroupNameType");
  v2[12] = CFSTR("VoiceCommandNameType");
  v2[13] = CFSTR("AutoShortcutNameType");
  v2[14] = CFSTR("PlaylistTitleType");
  v2[15] = CFSTR("MusicArtistNameType");
  v2[16] = CFSTR("AudiobookTitleType");
  v2[17] = CFSTR("AudiobookAuthorNameType");
  v2[18] = CFSTR("ShowTitleType");
  v2[19] = CFSTR("MediaUserContextType");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 20);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)supportedVocabularyStringTypes_stAllTypes;
  supportedVocabularyStringTypes_stAllTypes = v0;

}

@end
