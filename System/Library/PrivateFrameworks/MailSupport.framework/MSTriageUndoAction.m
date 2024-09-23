@implementation MSTriageUndoAction

- (MSTriageUndoAction)initWithChangeActionFuture:(id)a3 messageRepository:(id)a4
{
  id v8;
  id v9;
  void *v10;
  MSTriageUndoAction *v11;
  MSTriageUndoAction *v12;
  id v13;
  id v14;
  void *v15;
  char v16;
  void *v18;
  void *v19;
  id v20;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSTriageUndoAction.m"), 16, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("changeActionFuture"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSTriageUndoAction.m"), 17, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("messageRepository"));

LABEL_3:
  v21.receiver = self;
  v21.super_class = (Class)MSTriageUndoAction;
  v11 = -[MSTriageUndoAction init](&v21, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_changeActionFuture, a3);
    objc_storeStrong((id *)&v12->_messageRepository, a4);
    v20 = 0;
    v13 = (id)objc_msgSend(v8, "resultIfAvailable:", &v20);
    v14 = v20;
    v15 = v14;
    if (v14)
      v16 = objc_msgSend(v14, "ef_isTimeoutError");
    else
      v16 = 1;
    v12->_isValid = v16;

  }
  return v12;
}

- (BOOL)isUndoSupported
{
  return 1;
}

- (EMMessageRepository)messageRepository
{
  return self->_messageRepository;
}

- (EFFuture)changeActionFuture
{
  return self->_changeActionFuture;
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeActionFuture, 0);
  objc_storeStrong((id *)&self->_messageRepository, 0);
}

@end
