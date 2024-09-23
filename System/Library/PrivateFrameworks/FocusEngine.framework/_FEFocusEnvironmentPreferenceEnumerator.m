@implementation _FEFocusEnvironmentPreferenceEnumerator

- (_FEFocusEnvironmentPreferenceEnumerator)init
{
  return -[_FEFocusEnvironmentPreferenceEnumerator initWithEnumerationMode:](self, "initWithEnumerationMode:", 0);
}

- (_FEFocusEnvironmentPreferenceEnumerator)initWithEnumerationMode:(int64_t)a3
{
  _FEFocusEnvironmentPreferenceEnumerator *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_FEFocusEnvironmentPreferenceEnumerator;
  result = -[_FEFocusEnvironmentPreferenceEnumerator init](&v5, sel_init);
  if (result)
  {
    result->_allowsInferringPreferences = 1;
    result->_enumerationMode = a3;
  }
  return result;
}

- (void)enumeratePreferencesForEnvironment:(id)a3 usingBlock:(id)a4
{
  id v7;
  id v8;
  void *v9;
  _FEFocusEnvironmentPreferenceEnumerationContext *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusEnvironmentPreferenceEnumerator.m"), 529, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("environment"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusEnvironmentPreferenceEnumerator.m"), 530, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

LABEL_3:
  v10 = -[_FEFocusEnvironmentPreferenceEnumerationContext initWithFocusEnvironment:enumerationMode:]([_FEFocusEnvironmentPreferenceEnumerationContext alloc], "initWithFocusEnvironment:enumerationMode:", v7, -[_FEFocusEnvironmentPreferenceEnumerator enumerationMode](self, "enumerationMode"));
  -[_FEFocusEnvironmentPreferenceEnumerationContext setDelegate:](v10, "setDelegate:", self);
  if (self->_debugLog)
  {
    -[_FEFocusEnvironmentPreferenceEnumerationContext _startLogging](v10, "_startLogging");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_FEDebugLogNode addMessage:](self->_debugLog, "addMessage:", v11);

  }
  v14 = 0;
  _enumeratePreferredFocusEnvironments(self, v10, v9, &v14);
  if (self->_debugLog)
    -[_FEFocusEnvironmentPreferenceEnumerationContext _stopLogging](v10, "_stopLogging");

}

- (BOOL)_shouldInferDefaultPreferenceForEnvironmentInContext:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  char v8;

  v4 = a3;
  v5 = v4;
  if (self->_allowsInferringPreferences && objc_msgSend(v4, "isInPreferredSubtree"))
  {
    v6 = MEMORY[0x2426205A4](self->_shouldInferPreferenceForEnvironmentHandler);
    v7 = (void *)v6;
    if (v6)
      v8 = (*(uint64_t (**)(uint64_t, void *))(v6 + 16))(v6, v5);
    else
      v8 = 1;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (int64_t)enumerationMode
{
  return self->_enumerationMode;
}

- (id)didVisitAllPreferencesForEnvironmentHandler
{
  return self->_didVisitAllPreferencesForEnvironmentHandler;
}

- (void)setDidVisitAllPreferencesForEnvironmentHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)allowsInferringPreferences
{
  return self->_allowsInferringPreferences;
}

- (void)setAllowsInferringPreferences:(BOOL)a3
{
  self->_allowsInferringPreferences = a3;
}

- (id)shouldInferPreferenceForEnvironmentHandler
{
  return self->_shouldInferPreferenceForEnvironmentHandler;
}

- (void)setShouldInferPreferenceForEnvironmentHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (_FEDebugLogNode)debugLog
{
  return self->_debugLog;
}

- (void)setDebugLog:(id)a3
{
  objc_storeStrong((id *)&self->_debugLog, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugLog, 0);
  objc_storeStrong(&self->_shouldInferPreferenceForEnvironmentHandler, 0);
  objc_storeStrong(&self->_didVisitAllPreferencesForEnvironmentHandler, 0);
}

@end
