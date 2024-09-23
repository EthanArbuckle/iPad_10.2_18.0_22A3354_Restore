@implementation CHUISContentConfirmationAction

- (CHUISContentConfirmationAction)initWithTimeout:(double)a3 queue:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  CHUISContentConfirmationAction *v13;
  objc_super v15;
  _QWORD v16[4];
  id v17;

  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x1E0D016A0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __67__CHUISContentConfirmationAction_initWithTimeout_queue_completion___block_invoke;
  v16[3] = &unk_1E6B84A80;
  v11 = v9;
  v17 = v11;
  objc_msgSend(v10, "responderWithHandler:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setQueue:", v8);
  objc_msgSend(v12, "setTimeout:", dispatch_time(0, (uint64_t)(a3 * 1000000000.0)));
  v15.receiver = self;
  v15.super_class = (Class)CHUISContentConfirmationAction;
  v13 = -[CHUISContentConfirmationAction initWithInfo:responder:](&v15, sel_initWithInfo_responder_, 0, v12);

  return v13;
}

void __67__CHUISContentConfirmationAction_initWithTimeout_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v6, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, 0);
  }

}

@end
