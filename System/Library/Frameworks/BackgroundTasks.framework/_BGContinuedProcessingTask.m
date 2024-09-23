@implementation _BGContinuedProcessingTask

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
  v13.super_class = (Class)_BGContinuedProcessingTask;
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

- (void)updateTitle:(id)a3 withReason:(id)a4
{
  NSString *v6;
  NSString *v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  NSString *title;
  NSString *reason;
  NSString *v12;

  v6 = (NSString *)a3;
  v7 = (NSString *)a4;
  -[_BGContinuedProcessingTask _descriptionUpdateHandler](self, "_descriptionUpdateHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[_BGContinuedProcessingTask _descriptionUpdateHandler](self, "_descriptionUpdateHandler");
    v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, NSString *, NSString *))v9)[2](v9, v6, v7);

  }
  title = self->_title;
  self->_title = v6;
  v12 = v6;

  reason = self->_reason;
  self->_reason = v7;

}

- (void)updateProgress:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;

  v6 = a3;
  -[_BGContinuedProcessingTask _progressHandler](self, "_progressHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_BGContinuedProcessingTask _progressHandler](self, "_progressHandler");
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
  -[_BGContinuedProcessingTask title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_BGContinuedProcessingTask reason](self, "reason");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<BGContinuedProcessingTask: %@ (%@, %@)>"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setTitle:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (NSString)reason
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setReason:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (NSProgress)internalProgress
{
  return self->_internalProgress;
}

- (void)setInternalProgress:(id)a3
{
  objc_storeStrong((id *)&self->_internalProgress, a3);
}

- (id)_progressHandler
{
  return self->__progressHandler;
}

- (void)_setProgressHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (id)_descriptionUpdateHandler
{
  return self->__descriptionUpdateHandler;
}

- (void)_setDescriptionUpdateHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__descriptionUpdateHandler, 0);
  objc_storeStrong(&self->__progressHandler, 0);
  objc_storeStrong((id *)&self->_internalProgress, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
