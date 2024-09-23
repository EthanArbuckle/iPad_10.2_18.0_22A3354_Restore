@implementation FPProgress

- (FPProgress)initWithOperation:(id)a3
{
  id v6;
  FPProgress *v7;
  FPProgress *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPProgress.m"), 17, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("operation"));

  }
  v11.receiver = self;
  v11.super_class = (Class)FPProgress;
  v7 = -[FPProgress init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_operation, a3);

  return v8;
}

- (void)cancel
{
  objc_super v3;

  -[NSOperation cancel](self->_operation, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)FPProgress;
  -[FPProgress cancel](&v3, sel_cancel);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operation, 0);
}

@end
