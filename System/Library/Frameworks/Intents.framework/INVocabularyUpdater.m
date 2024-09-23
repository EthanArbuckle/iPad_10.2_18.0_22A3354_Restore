@implementation INVocabularyUpdater

+ (void)clearAllCustomVocabulary
{
  void *v2;
  id v3;

  objc_msgSend(a1, "_sharedAppInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_syncService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deleteEverything");

}

+ (id)_sharedAppInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__INVocabularyUpdater__sharedAppInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_sharedAppInstance_onceToken != -1)
    dispatch_once(&_sharedAppInstance_onceToken, block);
  return (id)_sharedAppInstance_sSharedInstance;
}

- (void)setValidatedVocabulary:(id)a3 forIntentSlot:(id)a4 onBehalfOf:(id)a5 validationCompletion:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a5;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = objc_msgSend(v18, "length");
  -[_INVocabularyConnection _syncService](self, "_syncService");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v13)
  {
    if (v10)
      v16 = v10;
    else
      v16 = &__block_literal_global_89_66212;
    objc_msgSend(v14, "recordVocabulary:forIntentSlot:onBehalfOf:withValidationCompletion:", v12, v11, v18, v16);
  }
  else
  {
    if (v10)
      v17 = v10;
    else
      v17 = &__block_literal_global_66211;
    objc_msgSend(v14, "recordVocabulary:forIntentSlot:withValidationCompletion:", v12, v11, v17);
  }

}

void __41__INVocabularyUpdater__sharedAppInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)_sharedAppInstance_sSharedInstance;
  _sharedAppInstance_sSharedInstance = (uint64_t)v1;

}

+ (void)clearAllCustomVocabularyOnBehalfOf:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(a1, "_sharedAppInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_syncService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deleteEverythingOnBehalfOf:", v4);

}

- (void)setValidatedVocabulary:(id)a3 forIntentSlot:(id)a4 validationCompletion:(id)a5
{
  -[INVocabularyUpdater setValidatedVocabulary:forIntentSlot:onBehalfOf:validationCompletion:](self, "setValidatedVocabulary:forIntentSlot:onBehalfOf:validationCompletion:", a3, a4, 0, a5);
}

- (void)setCustomPhotoAlbumNames:(id)a3
{
  id v4;
  _INVocabularyValidator *v5;
  void *v6;
  __CFString *v7;
  dispatch_time_t v8;
  _QWORD block[5];

  v4 = a3;
  +[_INAggregator logReceivedCount:ofVocabularyStringType:](_INAggregator, "logReceivedCount:ofVocabularyStringType:", objc_msgSend(v4, "count"), 101);
  v5 = objc_alloc_init(_INVocabularyValidator);
  -[_INVocabularyValidator validatedItemsFromVocabularyStrings:ofType:loggingWarnings:](v5, "validatedItemsFromVocabularyStrings:ofType:loggingWarnings:", v4, 101, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = CFSTR("PhotoAlbumNameType");
  -[INVocabularyUpdater setValidatedVocabulary:forIntentSlot:validationCompletion:](self, "setValidatedVocabulary:forIntentSlot:validationCompletion:", v6, CFSTR("PhotoAlbumNameType"), 0);

  v8 = dispatch_time(0, 3000000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__INVocabularyUpdater_setCustomPhotoAlbumNames___block_invoke;
  block[3] = &unk_1E2294DE0;
  block[4] = self;
  dispatch_after(v8, MEMORY[0x1E0C80D38], block);

}

id __48__INVocabularyUpdater_setCustomPhotoAlbumNames___block_invoke()
{
  return (id)objc_opt_self();
}

@end
