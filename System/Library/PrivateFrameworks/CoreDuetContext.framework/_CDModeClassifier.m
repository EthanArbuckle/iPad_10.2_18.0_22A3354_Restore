@implementation _CDModeClassifier

- (_CDModeClassifier)init
{
  _CDModeClassifier *v2;
  _CDModeClassifier *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_CDModeClassifier;
  v2 = -[_CDModeClassifier init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[_CDModeClassifier _enableFocusModesIfPossible](v2, "_enableFocusModesIfPossible");
  return v3;
}

- (void)_enableFocusModesIfPossible
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id location;
  uint64_t v11;
  uint64_t v12;
  Class (*v13)(uint64_t);
  void *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  objc_initWeak(&location, self);
  v16 = 0;
  v17 = &v16;
  v18 = 0x2050000000;
  v2 = (void *)getATXModeClassifierClass_softClass;
  v19 = getATXModeClassifierClass_softClass;
  v3 = MEMORY[0x1E0C809B0];
  if (!getATXModeClassifierClass_softClass)
  {
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __getATXModeClassifierClass_block_invoke;
    v14 = &unk_1E26D4D58;
    v15 = &v16;
    __getATXModeClassifierClass_block_invoke((uint64_t)&v11);
    v2 = (void *)v17[3];
  }
  v4 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v16, 8);
  v16 = 0;
  v17 = &v16;
  v18 = 0x2050000000;
  v5 = (void *)getATXModeDuetHelperClass_softClass;
  v19 = getATXModeDuetHelperClass_softClass;
  if (!getATXModeDuetHelperClass_softClass)
  {
    v11 = v3;
    v12 = 3221225472;
    v13 = __getATXModeDuetHelperClass_block_invoke;
    v14 = &unk_1E26D4D58;
    v15 = &v16;
    __getATXModeDuetHelperClass_block_invoke((uint64_t)&v11);
    v5 = (void *)v17[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v16, 8);
  v7 = (void *)objc_opt_new();
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __48___CDModeClassifier__enableFocusModesIfPossible__block_invoke;
  v8[3] = &unk_1E26D50E8;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v4, "provideModeClassifierWhenReadyWithDuetHelper:block:", v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (ATXModeClassifier)modeClassifier
{
  return (ATXModeClassifier *)objc_getProperty(self, a2, 8, 1);
}

- (void)setModeClassifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modeClassifier, 0);
}

@end
