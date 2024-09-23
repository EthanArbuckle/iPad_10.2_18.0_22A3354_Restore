@implementation IMDDController

+ (id)sharedInstance
{
  if (qword_1ECF125C8 != -1)
    dispatch_once(&qword_1ECF125C8, &unk_1E471C290);
  return (id)qword_1ECF12628;
}

- (IMDDController)init
{
  IMDDController *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *scannerQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IMDDController;
  v2 = -[IMDDController init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.IMDDScannerQueue", 0);
    scannerQueue = v2->_scannerQueue;
    v2->_scannerQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)scanMessage:(id)a3 completionBlock:(id)a4
{
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  id v10;

  v6 = qword_1EE65F690;
  v7 = a4;
  v8 = a3;
  v10 = v8;
  if (v6 == -1)
  {
    v9 = v8;
  }
  else
  {
    dispatch_once(&qword_1EE65F690, &unk_1E471B9A0);
    v9 = v10;
  }
  -[IMDDController scanMessage:outgoing:waitUntilDone:completionBlock:](self, "scanMessage:outgoing:waitUntilDone:completionBlock:", v9, 0, byte_1EE65F688, v7);

}

- (BOOL)_scanMessageUsingScanner:(id)a3 attributedString:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    objc_msgSend(v6, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "string");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      if (-[IMDDController _scanAttributedStringWithMessage:attributedString:plainText:](self, "_scanAttributedStringWithMessage:attributedString:plainText:", v6, v7, v9))
      {
        v10 = 1;
LABEL_9:

        goto LABEL_10;
      }
      if (objc_msgSend(v7, "attribute:existsInRange:", *MEMORY[0x1E0D365F0], 0, objc_msgSend(v7, "length")))
      {
        -[IMDDController _processLinkInAttributedString:](self, "_processLinkInAttributedString:", v7);
        objc_msgSend(v7, "string");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[IMDDController _scanAttributedStringWithMessage:attributedString:plainText:](self, "_scanAttributedStringWithMessage:attributedString:plainText:", v6, v7, v11);

        goto LABEL_9;
      }
    }
    v10 = 0;
    goto LABEL_9;
  }
  v10 = 0;
LABEL_10:

  return v10;
}

- (void)_processLinkInAttributedString:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v4 = *MEMORY[0x1E0D365F0];
  v5 = objc_msgSend(v3, "length");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1A2122D7C;
  v7[3] = &unk_1E47217C8;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v6, "enumerateAttribute:inRange:options:usingBlock:", v4, 0, v5, 0, v7);

}

- (BOOL)_scanAttributedStringWithMessage:(id)a3 attributedString:(id)a4 plainText:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v7, "guid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sender");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "ID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "time");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "isFromMe");
  v14 = IMDDScanAttributedStringWithContext();

  return v14;
}

- (void)scanMessage:(id)a3 outgoing:(BOOL)a4 waitUntilDone:(BOOL)a5 completionBlock:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  void *v15;
  NSObject *scannerQueue;
  _QWORD v17[4];
  id v18;
  IMDDController *v19;
  id v20;
  BOOL v21;
  BOOL v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v7 = a5;
  v25 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v10;
      _os_log_impl(&dword_1A1FF4000, v12, OS_LOG_TYPE_INFO, "Request to scan message: %@", buf, 0xCu);
    }

  }
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_1A21231A4;
  v17[3] = &unk_1E4722970;
  v13 = v10;
  v21 = a4;
  v18 = v13;
  v19 = self;
  v22 = v7;
  v14 = v11;
  v20 = v14;
  v15 = _Block_copy(v17);
  scannerQueue = self->_scannerQueue;
  if (v7)
    dispatch_sync(scannerQueue, v15);
  else
    dispatch_async(scannerQueue, v15);

}

+ (id)allSupportedDDAttributesKeys
{
  if (qword_1EE65F698 != -1)
    dispatch_once(&qword_1EE65F698, &unk_1E471BAA0);
  return (id)qword_1EE65F6A0;
}

- (OS_dispatch_queue)scannerQueue
{
  return self->_scannerQueue;
}

- (void)setScannerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_scannerQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scannerQueue, 0);
}

@end
