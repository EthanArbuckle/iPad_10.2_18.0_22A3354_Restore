@implementation DTTapMemoHandler

- (DTTapMemoHandler)initWithConfig:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  DTTapMemoHandler *v9;
  DTTapMemoHandler *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *serialQueue;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)DTTapMemoHandler;
  v9 = -[DTTapMemoHandler init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    if (!v7)
      sub_222BC64E0();
    if (!v8)
      sub_222BC6508();
    objc_storeStrong((id *)&v9->_config, a3);
    objc_storeStrong((id *)&v10->_delegate, a4);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("com.apple.dt.tap.memoHandler", v11);
    serialQueue = v10->_serialQueue;
    v10->_serialQueue = (OS_dispatch_queue *)v12;

    v10->_sentRecordingInfo = 0;
  }

  return v10;
}

- (void)suspend
{
  dispatch_suspend((dispatch_object_t)self->_serialQueue);
}

- (void)resume
{
  dispatch_resume((dispatch_object_t)self->_serialQueue);
}

- (id)handleMemo:(id)a3
{
  id v4;
  char isKindOfClass;
  char v6;
  char v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD);
  void *v15;
  id v16;
  void *v17;
  id *v18;
  NSObject *serialQueue;
  id v20;
  NSObject *v22;
  _QWORD block[4];
  id v24;
  _QWORD v25[5];
  id v26;
  _QWORD v27[5];
  id v28;
  _QWORD v29[5];
  id v30;
  _QWORD v31[5];
  id v32;

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  v6 = objc_opt_isKindOfClass();
  objc_opt_class();
  v7 = objc_opt_isKindOfClass();
  v8 = MEMORY[0x24BDAC760];
  if ((v6 & 1) == 0)
  {
    if ((isKindOfClass & 1) == 0)
    {
      if ((v7 & 1) == 0)
      {
LABEL_20:
        objc_msgSend(MEMORY[0x24BDD1478], "blockOperationWithBlock:", &unk_24EB27790);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_21;
      }
      v25[0] = MEMORY[0x24BDAC760];
      v25[1] = 3221225472;
      v25[2] = sub_222B483A8;
      v25[3] = &unk_24EB28350;
      v25[4] = self;
      v26 = v4;
      objc_msgSend(MEMORY[0x24BDD1478], "blockOperationWithBlock:", v25);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v26;
      goto LABEL_19;
    }
    goto LABEL_15;
  }
  if (!self->_sentRecordingInfo)
  {
    v11 = v4;
    if (-[DTTapConfig bufferMode](self->_config, "bufferMode") == 2)
    {
      if (objc_msgSend(v11, "supportsPeek"))
      {
        -[DTTapConfig recordingInfoHandler](self->_config, "recordingInfoHandler");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          -[DTTapMemoHandlerDelegate peekAtMemo:](self->_delegate, "peekAtMemo:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            -[DTTapConfig recordingInfoHandler](self->_config, "recordingInfoHandler");
            v14 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
            ((void (**)(_QWORD, void *))v14)[2](v14, v13);

            self->_sentRecordingInfo = 1;
          }

        }
      }
    }

    if ((isKindOfClass & 1) == 0)
      goto LABEL_18;
LABEL_15:
    -[DTTapConfig statusHandler](self->_config, "statusHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
      goto LABEL_20;
    v16 = v4;
    if ((objc_msgSend(v16, "status") & 0x80000000) != 0)
    {
      dispatch_get_global_queue(0, 0);
      v22 = objc_claimAutoreleasedReturnValue();
      v31[0] = v8;
      v31[1] = 3221225472;
      v31[2] = sub_222B481D8;
      v31[3] = &unk_24EB28350;
      v31[4] = self;
      v18 = &v32;
      v32 = v16;
      dispatch_async(v22, v31);

      v9 = 0;
    }
    else
    {
      v17 = (void *)MEMORY[0x24BDD1478];
      v29[0] = v8;
      v29[1] = 3221225472;
      v29[2] = sub_222B48278;
      v29[3] = &unk_24EB28350;
      v29[4] = self;
      v18 = &v30;
      v30 = v16;
      objc_msgSend(v17, "blockOperationWithBlock:", v29);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }

    if (!v9)
      goto LABEL_20;
    goto LABEL_21;
  }
  if ((isKindOfClass & 1) != 0)
    goto LABEL_15;
LABEL_18:
  v27[0] = v8;
  v27[1] = 3221225472;
  v27[2] = sub_222B48318;
  v27[3] = &unk_24EB28350;
  v27[4] = self;
  v28 = v4;
  objc_msgSend(MEMORY[0x24BDD1478], "blockOperationWithBlock:", v27);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v28;
LABEL_19:

  if (!v9)
    goto LABEL_20;
LABEL_21:
  serialQueue = self->_serialQueue;
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = sub_222B48430;
  block[3] = &unk_24EB27E30;
  v20 = v9;
  v24 = v20;
  dispatch_async(serialQueue, block);

  return v20;
}

- (DTTapConfig)config
{
  return self->_config;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

@end
