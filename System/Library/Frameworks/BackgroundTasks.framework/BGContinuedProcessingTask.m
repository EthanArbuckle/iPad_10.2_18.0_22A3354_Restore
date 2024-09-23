@implementation BGContinuedProcessingTask

- (id)_initWithIdentifier:(id)a3 activity:(id)a4
{
  id v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  objc_super v13;

  v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)BGContinuedProcessingTask;
  v7 = -[BGTask _initWithIdentifier:activity:](&v13, sel__initWithIdentifier_activity_, a3, v6);
  if (v7)
  {
    objc_msgSend(v6, "clientProvidedTitle");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v7[7];
    v7[7] = v8;

    objc_msgSend(v6, "clientProvidedReason");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v7[8];
    v7[8] = v10;

  }
  return v7;
}

- (void)updateProgress:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;

  v6 = a3;
  -[BGContinuedProcessingTask _progressHandler](self, "_progressHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[BGContinuedProcessingTask _progressHandler](self, "_progressHandler");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v5)[2](v5, v6);

  }
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[BGTask identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BGContinuedProcessingTask title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BGContinuedProcessingTask reason](self, "reason");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<BGContinuedProcessingTask: %@ (%@, %@)>"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)_progressHandler
{
  return self->__progressHandler;
}

- (void)_setProgressHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__progressHandler, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
