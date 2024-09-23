@implementation IMTransferAgentDeliveryController

+ (id)sharedInstance
{
  if (qword_2540D93B8 != -1)
    dispatch_once(&qword_2540D93B8, &unk_24F979E60);
  return (id)qword_2540D93E0;
}

- (IMTransferAgentDeliveryController)init
{
  IMTransferAgentDeliveryController *v2;
  FTMessageDelivery *v3;
  FTMessageDelivery *messageDelivery;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IMTransferAgentDeliveryController;
  v2 = -[IMTransferAgentDeliveryController init](&v6, sel_init);
  if (v2)
  {
    v3 = (FTMessageDelivery *)objc_alloc_init((Class)objc_msgSend(MEMORY[0x24BE30348], "APNSMessageDeliveryClass"));
    messageDelivery = v2->_messageDelivery;
    v2->_messageDelivery = v3;

    -[FTMessageDelivery setMaxConcurrentMessages:](v2->_messageDelivery, "setMaxConcurrentMessages:", 2);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[IMTransferAgentDeliveryController setMessageDelivery:](self, "setMessageDelivery:", 0);
  v3.receiver = self;
  v3.super_class = (Class)IMTransferAgentDeliveryController;
  -[IMTransferAgentDeliveryController dealloc](&v3, sel_dealloc);
}

- (void)sendFTMessage:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, void *, int, void *);
  void *v14;
  IMTransferAgentDeliveryController *v15;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMEventCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v6;
      _os_log_impl(&dword_22D97D000, v8, OS_LOG_TYPE_INFO, "Sending FTMessage: %@", buf, 0xCu);
    }

  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v6;
      _os_log_impl(&dword_22D97D000, v9, OS_LOG_TYPE_INFO, "send FTMessage: %@", buf, 0xCu);
    }

  }
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = sub_22D98A5A0;
  v14 = &unk_24F97A2F0;
  v15 = self;
  v16 = v7;
  v10 = v7;
  objc_msgSend(v6, "setCompletionBlock:", &v11);
  -[FTMessageDelivery sendMessage:](self->_messageDelivery, "sendMessage:", v6, v11, v12, v13, v14, v15);

}

- (FTMessageDelivery)messageDelivery
{
  return self->_messageDelivery;
}

- (void)setMessageDelivery:(id)a3
{
  objc_storeStrong((id *)&self->_messageDelivery, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageDelivery, 0);
}

@end
