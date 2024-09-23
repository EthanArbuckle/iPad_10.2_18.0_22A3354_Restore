@implementation ICHandoffController

+ (id)sharedController
{
  if (sharedController_once != -1)
    dispatch_once(&sharedController_once, &__block_literal_global_51);
  return (id)sharedController_sharedController;
}

void __39__ICHandoffController_sharedController__block_invoke()
{
  ICHandoffController *v0;
  void *v1;

  v0 = objc_alloc_init(ICHandoffController);
  v1 = (void *)sharedController_sharedController;
  sharedController_sharedController = (uint64_t)v0;

}

- (ICHandoffController)init
{
  ICHandoffController *v2;
  ICPeerMessageController *v3;
  ICPeerMessageController *peerController;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICHandoffController;
  v2 = -[ICHandoffController init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(ICPeerMessageController);
    peerController = v2->_peerController;
    v2->_peerController = v3;

    -[ICPeerMessageController setDelegate:](v2->_peerController, "setDelegate:", v2);
  }
  return v2;
}

- (void)setInputStream:(id)a3
{
  ICHandoffController *v5;
  ICPeerInputStream *inputStream;
  ICPeerInputStream *v7;

  v7 = (ICPeerInputStream *)a3;
  v5 = self;
  objc_sync_enter(v5);
  inputStream = v5->_inputStream;
  if (inputStream != v7)
  {
    -[ICPeerInputStream setDelegate:](inputStream, "setDelegate:", 0);
    objc_storeStrong((id *)&v5->_inputStream, a3);
    -[ICPeerInputStream setDelegate:](v5->_inputStream, "setDelegate:", v5);
  }
  objc_sync_exit(v5);

}

- (ICPeerInputStream)inputStream
{
  ICHandoffController *v2;
  ICPeerInputStream *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_inputStream;
  objc_sync_exit(v2);

  return v3;
}

- (void)didReceiveInputStream:(id)a3 outputStream:(id)a4
{
  id v6;
  id v7;
  ICPeerOutputStream *v8;
  ICPeerInputStream *v9;

  v6 = a4;
  v7 = a3;
  v9 = -[ICPeerInputStream initWithInputStream:]([ICPeerInputStream alloc], "initWithInputStream:", v7);

  v8 = -[ICPeerOutputStream initWithOutputStream:]([ICPeerOutputStream alloc], "initWithOutputStream:", v6);
  -[ICHandoffController setInputStream:](self, "setInputStream:", v9);
  -[ICHandoffController setOutputStream:](self, "setOutputStream:", v8);

}

- (void)requestNoteWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[ICHandoffController peerController](self, "peerController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v4);

  objc_msgSend(v6, "requestNote:from:", v5, 0);
}

- (BOOL)sendMessage:(id)a3 toSource:(id)a4 error:(id *)a5
{
  id v6;
  void *v7;

  v6 = a3;
  -[ICHandoffController outputStream](self, "outputStream");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "writeMessageData:", v6);

  return 1;
}

- (void)handleMessage:(id)a3 fromInputStream:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  -[ICHandoffController peerController](self, "peerController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleMessage:fromSource:", v5, 0);

}

- (void)didDisconnectInputStream:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ICHandoffController inputStream](self, "inputStream");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[ICHandoffController setInputStream:](self, "setInputStream:", 0);
    -[ICHandoffController setOutputStream:](self, "setOutputStream:", 0);
  }
}

- (ICPeerOutputStream)outputStream
{
  return (ICPeerOutputStream *)objc_getProperty(self, a2, 16, 1);
}

- (void)setOutputStream:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (ICPeerMessageController)peerController
{
  return (ICPeerMessageController *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPeerController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerController, 0);
  objc_storeStrong((id *)&self->_outputStream, 0);
  objc_storeStrong((id *)&self->_inputStream, 0);
}

@end
