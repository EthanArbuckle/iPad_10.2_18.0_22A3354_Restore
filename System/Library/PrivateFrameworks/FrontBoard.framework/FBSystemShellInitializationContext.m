@implementation FBSystemShellInitializationContext

- (id)_initWithOptions:(id)a3
{
  id v5;
  FBSystemShellInitializationContext *v6;
  FBSystemShellInitializationContext *v7;
  _FBDarkBootHelper *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FBSystemShellInitializationContext;
  v6 = -[FBSystemShellInitializationContext init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_options, a3);
    v8 = objc_alloc_init(_FBDarkBootHelper);
    v7->_bootedDark = -[_FBDarkBootHelper isBootingDark](v8, "isBootingDark");

  }
  return v7;
}

- (unint64_t)lastExitReason
{
  void *v2;
  void *v3;
  FBProcessExitContext *v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x1E0D87D68], "currentProcess");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastExitContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = -[FBProcessExitContext initWithUnderlyingContext:]([FBProcessExitContext alloc], "initWithUnderlyingContext:", v3);
    v5 = -[FBProcessExitContext exitReason](v4, "exitReason");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)wasBootedDark
{
  return self->_bootedDark;
}

- (FBSystemShellInitializationOptions)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
}

@end
