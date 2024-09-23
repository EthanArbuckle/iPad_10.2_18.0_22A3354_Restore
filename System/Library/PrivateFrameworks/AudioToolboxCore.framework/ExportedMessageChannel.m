@implementation ExportedMessageChannel

- (ExportedMessageChannel)initWithMessageChannel:(id)a3
{
  id v4;
  ExportedMessageChannel *v5;
  ExportedMessageChannel *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ExportedMessageChannel;
  v5 = -[ExportedMessageChannel init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_messageChannel, v4);

  return v6;
}

- (void)onCallRemoteAU:(id)a3 reply:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  AUMessageChannel_XPC **p_messageChannel;
  id WeakRetained;
  id v9;
  void (**v10)(_QWORD, _QWORD);
  void *v11;
  id v12;

  v12 = a3;
  v6 = (void (**)(id, _QWORD, void *))a4;
  p_messageChannel = &self->_messageChannel;
  WeakRetained = objc_loadWeakRetained((id *)&self->_messageChannel);
  if (WeakRetained
    && (v9 = objc_loadWeakRetained((id *)p_messageChannel),
        objc_msgSend(v9, "callHostBlock"),
        v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(),
        v9,
        v10))
  {
    ((void (**)(_QWORD, id))v10)[2](v10, v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v11);

  }
  else
  {

    v6[2](v6, 0, 0);
  }

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_messageChannel);
}

@end
