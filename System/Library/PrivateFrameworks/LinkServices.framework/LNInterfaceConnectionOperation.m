@implementation LNInterfaceConnectionOperation

- (LNConnectionHostInterface)connectionInterface
{
  return self->_connectionInterface;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionInterface, 0);
}

- (LNInterfaceConnectionOperation)initWithIdentifier:(id)a3 connectionInterface:(id)a4 priority:(int64_t)a5 queue:(id)a6 activity:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  LNInterfaceConnectionOperation *v17;
  LNInterfaceConnectionOperation *v18;
  LNInterfaceConnectionOperation *v19;
  void *v21;
  void *v22;
  objc_super v23;

  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = a7;
  if (v13)
  {
    if (v14)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNInterfaceConnectionOperation.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

    if (v14)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNInterfaceConnectionOperation.m"), 21, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("connectionInterface"));

LABEL_3:
  v23.receiver = self;
  v23.super_class = (Class)LNInterfaceConnectionOperation;
  v17 = -[LNConnectionOperation initWithIdentifier:priority:queue:activity:](&v23, sel_initWithIdentifier_priority_queue_activity_, v13, a5, v15, v16);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_connectionInterface, a4);
    v19 = v18;
  }

  return v18;
}

@end
