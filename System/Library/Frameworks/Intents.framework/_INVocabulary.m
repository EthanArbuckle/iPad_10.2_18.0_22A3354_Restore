@implementation _INVocabulary

+ (id)supportedVocabularyStringTypes
{
  if (supportedVocabularyStringTypes_onceToken != -1)
    dispatch_once(&supportedVocabularyStringTypes_onceToken, &__block_literal_global_84793);
  return (id)supportedVocabularyStringTypes_stAllTypes;
}

+ (id)sharedVocabulary
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33___INVocabulary_sharedVocabulary__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedVocabulary_onceToken_127 != -1)
    dispatch_once(&sharedVocabulary_onceToken_127, block);
  return (id)sharedVocabulary_sSharedInstance;
}

- (void)setVocabularyStrings:(id)a3 ofType:(int64_t)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45___INVocabulary_setVocabularyStrings_ofType___block_invoke;
  block[3] = &unk_1E22907F0;
  v10 = v6;
  v11 = a4;
  block[4] = self;
  v8 = v6;
  dispatch_async(queue, block);

}

- (_INVocabulary)init
{
  _INVocabulary *v2;
  uint64_t v3;
  INVocabularyUpdater *vocabularyUpdater;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_INVocabulary;
  v2 = -[_INVocabulary init](&v9, sel_init);
  if (v2)
  {
    +[INVocabularyUpdater _sharedAppInstance](INVocabularyUpdater, "_sharedAppInstance");
    v3 = objc_claimAutoreleasedReturnValue();
    vocabularyUpdater = v2->_vocabularyUpdater;
    v2->_vocabularyUpdater = (INVocabularyUpdater *)v3;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.intents._INVocabulary.internal-queue", v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

  }
  return v2;
}

- (void)validateVocabularyType:(int64_t)a3
{
  void *v4;

  _INSyncSlotFromVocabularyStringType(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    -[_INVocabulary _THROW_EXCEPTION_FOR_INVALID_VOCABULARY_TYPE](self, "_THROW_EXCEPTION_FOR_INVALID_VOCABULARY_TYPE");
}

- (void)setValidatedVocabulary:(id)a3 ofType:(int64_t)a4
{
  -[_INVocabulary setValidatedVocabulary:ofType:onBehalfOf:](self, "setValidatedVocabulary:ofType:onBehalfOf:", a3, a4, 0);
}

- (id)_validator
{
  _INVocabularyValidator *validator;
  _INVocabularyValidator *v4;
  _INVocabularyValidator *v5;

  validator = self->_validator;
  if (!validator)
  {
    v4 = objc_alloc_init(_INVocabularyValidator);
    v5 = self->_validator;
    self->_validator = v4;

    validator = self->_validator;
  }
  return validator;
}

- (void)setValidatedVocabulary:(id)a3 ofType:(int64_t)a4 onBehalfOf:(id)a5
{
  id v8;
  id v9;
  void *v10;
  INVocabularyUpdater *vocabularyUpdater;
  _QWORD v12[4];
  id v13[2];
  id location;

  v8 = a3;
  v9 = a5;
  _INSyncSlotFromVocabularyStringType(a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  vocabularyUpdater = self->_vocabularyUpdater;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __58___INVocabulary_setValidatedVocabulary_ofType_onBehalfOf___block_invoke;
  v12[3] = &unk_1E22907A8;
  objc_copyWeak(v13, &location);
  v13[1] = (id)a4;
  -[INVocabularyUpdater setValidatedVocabulary:forIntentSlot:onBehalfOf:validationCompletion:](vocabularyUpdater, "setValidatedVocabulary:forIntentSlot:onBehalfOf:validationCompletion:", v8, v10, v9, v12);
  objc_destroyWeak(v13);
  objc_destroyWeak(&location);

}

- (void)removeAllVocabularyStrings
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43___INVocabulary_removeAllVocabularyStrings__block_invoke;
  block[3] = &unk_1E2294DE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_THROW_EXCEPTION_FOR_INVALID_VOCABULARY_TYPE_
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("-[INVocabulary setVocabularyStrings:ofType:] was given an invalid type"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (void)_THROW_EXCEPTION_FOR_ATTEMPT_TO_PROVIDE_VOCABULARY_OF_TYPE_THAT_APP_DOES_NOT_HANDLE_:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Illegal attempt to provide vocabulary of type %@ by an app that does not handle any intents that could use that type of vocabulary"), v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (INIsInternalInstall_onceToken != -1)
    dispatch_once(&INIsInternalInstall_onceToken, &__block_literal_global_162);
  if (INIsInternalInstall_isInternal)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v3, 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v4);
  }
  NSLog((NSString *)CFSTR("ERROR: %@"), v3);

}

- (void)_setVocabulary:(id)a3 ofType:(int64_t)a4 onBehalfOf:(id)a5
{
  id v8;
  id v9;
  NSObject *queue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  int64_t v16;

  v8 = a3;
  v9 = a5;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __50___INVocabulary__setVocabulary_ofType_onBehalfOf___block_invoke;
  v13[3] = &unk_1E2290818;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a4;
  v11 = v9;
  v12 = v8;
  dispatch_async(queue, v13);

}

- (void)setVocabulary:(id)a3 ofType:(int64_t)a4
{
  -[_INVocabulary _setVocabulary:ofType:onBehalfOf:](self, "_setVocabulary:ofType:onBehalfOf:", a3, a4, 0);
}

- (void)removeAllVocabularyStringsOnBehalfOf:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54___INVocabulary_removeAllVocabularyStringsOnBehalfOf___block_invoke;
  v7[3] = &unk_1E2293C38;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_validator, 0);
  objc_storeStrong((id *)&self->_vocabularyUpdater, 0);
}

+ (void)enumerateVocabularyUsingBlock:(id)a3
{
  +[_INVocabularyStoreManager enumerateVocabularyUsingBlock:](_INVocabularyStoreManager, "enumerateVocabularyUsingBlock:", a3);
}

@end
