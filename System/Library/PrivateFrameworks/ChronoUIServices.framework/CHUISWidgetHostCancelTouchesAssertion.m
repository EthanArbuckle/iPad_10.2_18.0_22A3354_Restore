@implementation CHUISWidgetHostCancelTouchesAssertion

- (CHUISWidgetHostCancelTouchesAssertion)initWithAssertions:(id)a3
{
  id v4;
  CHUISWidgetHostCancelTouchesAssertion *v5;
  uint64_t v6;
  NSArray *assertions;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHUISWidgetHostCancelTouchesAssertion;
  v5 = -[CHUISWidgetHostCancelTouchesAssertion init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    assertions = v5->_assertions;
    v5->_assertions = (NSArray *)v6;

  }
  return v5;
}

- (CHUISWidgetHostCancelTouchesAssertion)init
{
  return -[CHUISWidgetHostCancelTouchesAssertion initWithAssertions:](self, "initWithAssertions:", MEMORY[0x1E0C9AA60]);
}

- (void)dealloc
{
  objc_super v3;

  if (!-[CHUISWidgetHostCancelTouchesAssertion isInvalidated](self, "isInvalidated"))
    -[CHUISWidgetHostCancelTouchesAssertion invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)CHUISWidgetHostCancelTouchesAssertion;
  -[CHUISWidgetHostCancelTouchesAssertion dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!-[CHUISWidgetHostCancelTouchesAssertion isInvalidated](self, "isInvalidated"))
  {
    v9 = 0u;
    v10 = 0u;
    v7 = 0u;
    v8 = 0u;
    -[CHUISWidgetHostCancelTouchesAssertion assertions](self, "assertions", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v8;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v8 != v5)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "invalidate");
        }
        while (v4 != v6);
        v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      }
      while (v4);
    }

    -[CHUISWidgetHostCancelTouchesAssertion setInvalidated:](self, "setInvalidated:", 1);
  }
}

- (NSArray)assertions
{
  return self->_assertions;
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertions, 0);
}

@end
