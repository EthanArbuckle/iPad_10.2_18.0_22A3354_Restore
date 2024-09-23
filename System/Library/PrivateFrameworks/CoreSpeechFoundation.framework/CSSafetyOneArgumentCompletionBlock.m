@implementation CSSafetyOneArgumentCompletionBlock

- (CSSafetyOneArgumentCompletionBlock)initWithDefaultValue:(id)a3 completionBlock:(id)a4
{
  id v7;
  id v8;
  CSSafetyOneArgumentCompletionBlock *v9;
  CSSafetyOneArgumentCompletionBlock *v10;
  uint64_t v11;
  id block;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CSSafetyOneArgumentCompletionBlock;
  v9 = -[CSSafetyOneArgumentCompletionBlock init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    v11 = MEMORY[0x1B5E468D0](v8);
    block = v10->_block;
    v10->_block = (id)v11;

    objc_storeStrong(&v10->_defaultValue, a3);
  }

  return v10;
}

- (void)invokeWithValue:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_isDirty)
  {
    v5 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315395;
      v7 = "-[CSSafetyOneArgumentCompletionBlock invokeWithValue:]";
      v8 = 2113;
      v9 = v4;
      _os_log_impl(&dword_1B502E000, v5, OS_LOG_TYPE_DEFAULT, "%s invoking with value %{private}@", (uint8_t *)&v6, 0x16u);
    }
    self->_isDirty = 1;
    (*((void (**)(void))self->_block + 2))();
  }
  os_unfair_lock_unlock(&self->_lock);

}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[CSSafetyOneArgumentCompletionBlock dealloc]";
    _os_log_impl(&dword_1B502E000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  -[CSSafetyOneArgumentCompletionBlock invokeWithValue:](self, "invokeWithValue:", self->_defaultValue);
  v4.receiver = self;
  v4.super_class = (Class)CSSafetyOneArgumentCompletionBlock;
  -[CSSafetyOneArgumentCompletionBlock dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong(&self->_defaultValue, 0);
}

@end
