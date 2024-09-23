@implementation CMContinuityCaptureStateTransition

- (CMContinuityCaptureStateTransition)initWithAttributes:(id)a3 dstState:(id)a4 event:(id)a5 guard:(id)a6 action:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  CMContinuityCaptureStateTransition *v17;
  CMContinuityCaptureStateTransition *v18;
  CMContinuityCaptureStateTransition *v19;
  objc_super v21;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)CMContinuityCaptureStateTransition;
  v17 = -[CMContinuityCaptureStateTransition init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    -[CMContinuityCaptureStateTransition setSrcState:](v17, "setSrcState:", v12);
    -[CMContinuityCaptureStateTransition setDstState:](v18, "setDstState:", v13);
    -[CMContinuityCaptureStateTransition setEvent:](v18, "setEvent:", v14);
    -[CMContinuityCaptureStateTransition setGuard:](v18, "setGuard:", v15);
    -[CMContinuityCaptureStateTransition setAction:](v18, "setAction:", v16);
    v19 = v18;
  }

  return v18;
}

- (id)transactionFromStateOnEvent:(id)a3 event:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t (**v13)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v14;
  void *v15;
  int v16;
  void *v17;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMContinuityCaptureStateTransition event](self, "event");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqualToString:", v10) & 1) == 0)
  {

LABEL_7:
    v17 = 0;
    goto LABEL_8;
  }
  -[CMContinuityCaptureStateTransition srcState](self, "srcState");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 != v6)
    goto LABEL_7;
  -[CMContinuityCaptureStateTransition guard](self, "guard");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[CMContinuityCaptureStateTransition guard](self, "guard");
    v13 = (uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[CMContinuityCaptureStateTransition srcState](self, "srcState");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMContinuityCaptureStateTransition dstState](self, "dstState");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = ((uint64_t (**)(_QWORD, void *, void *, id))v13)[2](v13, v14, v15, v7);

    if (!v16)
      goto LABEL_7;
  }
  -[CMContinuityCaptureStateTransition dstState](self, "dstState");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v17;
}

- (CMContinuityCaptureState)srcState
{
  return self->_srcState;
}

- (void)setSrcState:(id)a3
{
  objc_storeStrong((id *)&self->_srcState, a3);
}

- (CMContinuityCaptureState)dstState
{
  return self->_dstState;
}

- (void)setDstState:(id)a3
{
  objc_storeStrong((id *)&self->_dstState, a3);
}

- (CMContinuityCaptureStateMachineEvent)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
  objc_storeStrong((id *)&self->_event, a3);
}

- (id)guard
{
  return self->_guard;
}

- (void)setGuard:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_action, 0);
  objc_storeStrong(&self->_guard, 0);
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_dstState, 0);
  objc_storeStrong((id *)&self->_srcState, 0);
}

@end
