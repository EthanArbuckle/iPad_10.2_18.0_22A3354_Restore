@implementation IMDiMessageIncomingMessageHandler

- (void)_enqueueBlock:(id)a3 withTimeout:(double)a4 description:(id)a5
{
  MEMORY[0x1E0DE7D20](MEMORY[0x1E0D36A78], sel_im_enqueuiMessageBlock_withTimeout_description_);
}

- (void)handleMessageDeliveryReceiptWithPipeline:(id)a3 input:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (IMOSLoggingEnabled(v10))
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Enquing delivery receipt processing", buf, 2u);
    }

  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1D1555268;
  v15[3] = &unk_1E922D140;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  -[IMDiMessageIncomingMessageHandler _enqueueBlock:withTimeout:description:](self, "_enqueueBlock:withTimeout:description:", v15, CFSTR("delivery receipt"), 45.0);

}

- (void)handleChatSessionCloseWithPipeline:(id)a3 input:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (IMOSLoggingEnabled(v10))
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Enquing chat session close processing", buf, 2u);
    }

  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1D1555640;
  v15[3] = &unk_1E922D140;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  -[IMDiMessageIncomingMessageHandler _enqueueBlock:withTimeout:description:](self, "_enqueueBlock:withTimeout:description:", v15, CFSTR("chat session close"), 45.0);

}

- (void)handleMessageReadReceiptWithPipeline:(id)a3 input:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (IMOSLoggingEnabled(v10))
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Enquing read receipt processing", buf, 2u);
    }

  }
  if ((objc_msgSend(v9, "isFromStorage") & 1) != 0 || objc_msgSend(v9, "isLastFromStorage"))
  {
    +[IMDMessageFromStorageController iMessageStorageController](IMDMessageFromStorageController, "iMessageStorageController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "incrementPendingReadReceiptFromStorageCount");

  }
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1D1555A4C;
  v16[3] = &unk_1E922D140;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v13 = v10;
  v14 = v9;
  v15 = v8;
  -[IMDiMessageIncomingMessageHandler _enqueueBlock:withTimeout:description:](self, "_enqueueBlock:withTimeout:description:", v16, CFSTR("read receipt"), 45.0);

}

- (void)handleMessageMarkUnreadRequestWithPipeline:(id)a3 input:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (IMOSLoggingEnabled(v10))
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Enquing mark unread request processing", buf, 2u);
    }

  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1D1555E54;
  v15[3] = &unk_1E922D140;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  -[IMDiMessageIncomingMessageHandler _enqueueBlock:withTimeout:description:](self, "_enqueueBlock:withTimeout:description:", v15, CFSTR("mark unread request"), 45.0);

}

- (void)handleMessagePlayedReceiptWithPipeline:(id)a3 input:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (IMOSLoggingEnabled(v10))
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Enquing played receipt processing", buf, 2u);
    }

  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1D155622C;
  v15[3] = &unk_1E922D140;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  -[IMDiMessageIncomingMessageHandler _enqueueBlock:withTimeout:description:](self, "_enqueueBlock:withTimeout:description:", v15, CFSTR("played receipt"), 45.0);

}

- (void)handleMessageDeliveredQuietlyReceiptWithPipeline:(id)a3 input:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (IMOSLoggingEnabled(v10))
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Enquing delivered quietly receipt processing", buf, 2u);
    }

  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1D1556604;
  v15[3] = &unk_1E922D140;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  -[IMDiMessageIncomingMessageHandler _enqueueBlock:withTimeout:description:](self, "_enqueueBlock:withTimeout:description:", v15, CFSTR("delivered quietly receipt"), 45.0);

}

- (void)handleNotifyRecipientCommandWithPipeline:(id)a3 input:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (IMOSLoggingEnabled(v10))
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Enquing notify recipient command processing", buf, 2u);
    }

  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1D15569DC;
  v15[3] = &unk_1E922D140;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  -[IMDiMessageIncomingMessageHandler _enqueueBlock:withTimeout:description:](self, "_enqueueBlock:withTimeout:description:", v15, CFSTR("notify recipient command"), 45.0);

}

- (void)handleEditMessageCommandWithPipeline:(id)a3 input:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (IMOSLoggingEnabled(v10))
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Enquing edit message command processing", buf, 2u);
    }

  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1D1556DB4;
  v15[3] = &unk_1E922D140;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  -[IMDiMessageIncomingMessageHandler _enqueueBlock:withTimeout:description:](self, "_enqueueBlock:withTimeout:description:", v15, CFSTR("edit message command"), 45.0);

}

- (void)handleRecoverJunkCommandWithPipeline:(id)a3 input:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (IMOSLoggingEnabled(v10))
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Enquing edit message command processing", buf, 2u);
    }

  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1D155718C;
  v15[3] = &unk_1E922D140;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  -[IMDiMessageIncomingMessageHandler _enqueueBlock:withTimeout:description:](self, "_enqueueBlock:withTimeout:description:", v15, CFSTR("recover junk command"), 45.0);

}

- (void)handleRepositionStickerCommandWithPipeline:(id)a3 input:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (IMOSLoggingEnabled(v10))
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Enquing reposition sticker command processing", buf, 2u);
    }

  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1D1557564;
  v15[3] = &unk_1E922D140;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  -[IMDiMessageIncomingMessageHandler _enqueueBlock:withTimeout:description:](self, "_enqueueBlock:withTimeout:description:", v15, CFSTR("reposition sticker command"), 45.0);

}

- (void)handleScheduledMessageUpdateCommandWithPipeline:(id)a3 input:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (IMOSLoggingEnabled(v10))
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Enqueuing scheduled message update command processing", buf, 2u);
    }

  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1D155793C;
  v15[3] = &unk_1E922D140;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  -[IMDiMessageIncomingMessageHandler _enqueueBlock:withTimeout:description:](self, "_enqueueBlock:withTimeout:description:", v15, CFSTR("Scheduled Message update command"), 45.0);

}

- (void)handleCrossServiceAssociationCommandWithPipeline:(id)a3 input:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (IMOSLoggingEnabled(v10))
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Enqueuing iml to im association command processing", buf, 2u);
    }

  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1D1557D14;
  v15[3] = &unk_1E922D140;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  -[IMDiMessageIncomingMessageHandler _enqueueBlock:withTimeout:description:](self, "_enqueueBlock:withTimeout:description:", v15, CFSTR("IML to IM association command"), 45.0);

}

- (void)handleMessageWithPipeline:(id)a3 input:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  qos_class_t v15;
  NSObject *v16;
  os_signpost_id_t v17;
  id v18;
  id v19;
  NSObject *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  NSObject *v24;
  id v25;
  id v26;
  os_signpost_id_t v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = IMOSLoggingEnabled(v10);
  if ((_DWORD)v11)
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v9, "GUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v29 = v13;
      _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "Enquing message processing (%@)", buf, 0xCu);

    }
  }
  if (IMOSLoggingEnabled(v11))
  {
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = qos_class_self();
      *(_DWORD *)buf = 67109120;
      LODWORD(v29) = v15;
      _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "Enqueue message qos is (%u)", buf, 8u);
    }

  }
  IMLogHandleForCategory();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = os_signpost_id_generate(v16);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = sub_1D1558204;
  v22[3] = &unk_1E922D190;
  v23 = v9;
  v24 = v16;
  v26 = v10;
  v27 = v17;
  v25 = v8;
  v18 = v10;
  v19 = v8;
  v20 = v16;
  v21 = v9;
  -[IMDiMessageIncomingMessageHandler _enqueueBlock:withTimeout:description:](self, "_enqueueBlock:withTimeout:description:", v22, CFSTR("message"), 45.0);

}

- (void)handleSyndicatedActionWithPipeline:(id)a3 input:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (IMOSLoggingEnabled(v10))
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Enquing SyndicationAction processing", buf, 2u);
    }

  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1D1558918;
  v15[3] = &unk_1E922D140;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  -[IMDiMessageIncomingMessageHandler _enqueueBlock:withTimeout:description:](self, "_enqueueBlock:withTimeout:description:", v15, CFSTR("syndication action"), 45.0);

}

@end
