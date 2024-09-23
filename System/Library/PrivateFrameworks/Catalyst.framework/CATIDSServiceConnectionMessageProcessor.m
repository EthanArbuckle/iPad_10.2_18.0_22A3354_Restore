@implementation CATIDSServiceConnectionMessageProcessor

- (CATIDSServiceConnectionMessageProcessor)initWithWorkQueue:(id)a3 connectionIdentifier:(id)a4
{
  id v7;
  id v8;
  CATIDSServiceConnectionMessageProcessor *v9;
  CATIDSServiceConnectionMessageProcessor *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CATIDSServiceConnectionMessageProcessor;
  v9 = -[CATIDSServiceConnectionMessageProcessor init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->mWorkQueue, a3);
    objc_storeStrong((id *)&v10->mConnectionIdentifier, a4);
  }

  return v10;
}

- (void)receiveMessage:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  objc_class *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_class *v29;
  void *v30;
  objc_class *v31;
  void *v32;
  void *v33;
  void *v34;
  objc_class *v35;
  void *v36;
  objc_class *v37;
  void *v38;
  id v39;

  v39 = a3;
  CATAssertIsQueue((dispatch_queue_t)self->mWorkQueue);
  objc_msgSend(v39, "connectionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", self->mConnectionIdentifier);

  if (v5)
  {
    -[CATIDSServiceConnectionMessageProcessor delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "messageProcessorWantsToExtendKeepAlive:", self);

    objc_msgSend(v39, "receivedSequenceNumber");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[CATIDSServiceConnectionMessageProcessor delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "receivedSequenceNumber");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "messageProcessor:wantsToAckUpTo:", self, objc_msgSend(v9, "unsignedIntegerValue"));

    }
    objc_msgSend(v39, "content");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "contentType");

    switch(v11)
    {
      case 1:
        -[CATIDSServiceConnectionMessageProcessor delegate](self, "delegate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "content");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[CATIDSServiceConnectionMessageProcessor receiveMessage:]");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (objc_class *)objc_opt_class();
          NSStringFromClass(v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = (objc_class *)objc_opt_class();
          NSStringFromClass(v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("CATIDSServiceConnectionMessageProcessor.m"), 63, CFSTR("expected %@, got %@"), v18, v20);

        }
        objc_msgSend(v12, "messageProcessor:wantsAggregation:", self, v13);
        goto LABEL_19;
      case 2:
        -[CATIDSServiceConnectionMessageProcessor delegate](self, "delegate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "messageProcessorWantsToAcknowledgeRemote:", self);
        goto LABEL_20;
      case 4:
        -[CATIDSServiceConnectionMessageProcessor delegate](self, "delegate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "content");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[CATIDSServiceConnectionMessageProcessor receiveMessage:]");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = (objc_class *)objc_opt_class();
          NSStringFromClass(v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = (objc_class *)objc_opt_class();
          NSStringFromClass(v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, CFSTR("CATIDSServiceConnectionMessageProcessor.m"), 73, CFSTR("expected %@, got %@"), v24, v26);

        }
        objc_msgSend(v13, "error");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "messageProcessor:wantsToCloseWithError:", self, v14);
        goto LABEL_18;
      case 5:
        -[CATIDSServiceConnectionMessageProcessor delegate](self, "delegate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "content");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[CATIDSServiceConnectionMessageProcessor receiveMessage:]");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = (objc_class *)objc_opt_class();
          NSStringFromClass(v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = (objc_class *)objc_opt_class();
          NSStringFromClass(v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "handleFailureInFunction:file:lineNumber:description:", v28, CFSTR("CATIDSServiceConnectionMessageProcessor.m"), 84, CFSTR("expected %@, got %@"), v30, v32);

        }
        objc_msgSend(v12, "messageProcessor:receivedExpectedSequence:", self, objc_msgSend(v13, "expectedSequenceNumber"));
        goto LABEL_19;
      case 6:
        -[CATIDSServiceConnectionMessageProcessor delegate](self, "delegate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "content");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[CATIDSServiceConnectionMessageProcessor receiveMessage:]");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = (objc_class *)objc_opt_class();
          NSStringFromClass(v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = (objc_class *)objc_opt_class();
          NSStringFromClass(v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "handleFailureInFunction:file:lineNumber:description:", v34, CFSTR("CATIDSServiceConnectionMessageProcessor.m"), 79, CFSTR("expected %@, got %@"), v36, v38);

        }
        objc_msgSend(v13, "sequenceNumbers");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "messageProcessor:wantsRetransmission:", self, v14);
LABEL_18:

LABEL_19:
LABEL_20:

        break;
      default:
        break;
    }
  }

}

- (CATIDSServiceConnectionMessageProcessorDelegate)delegate
{
  return (CATIDSServiceConnectionMessageProcessorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->mConnectionIdentifier, 0);
  objc_storeStrong((id *)&self->mWorkQueue, 0);
}

@end
