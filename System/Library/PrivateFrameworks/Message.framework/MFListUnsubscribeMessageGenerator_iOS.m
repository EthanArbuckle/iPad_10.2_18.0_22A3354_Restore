@implementation MFListUnsubscribeMessageGenerator_iOS

+ (id)deliveryForCommand:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  MFPlainTextDocument *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  MFOutgoingMessageDelivery *v17;
  void *v19;
  void *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MFListUnsubscribeMessageGenerator_iOS.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("command"));

  }
  objc_msgSend(v5, "mailtoValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MFListUnsubscribeMessageGenerator_iOS.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mailtoValues"));

  }
  objc_msgSend(v6, "account");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x1E0D46118]);
  objc_msgSend(a1, "messageHeadersWithCommand:headersFactory:", v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "localizedBodyForCommand:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(MFPlainTextDocument);
  objc_msgSend(v6, "body");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v6, "body");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("%@\n\n%@"), v14, v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFPlainTextDocument appendString:withQuoteLevel:](v11, "appendString:withQuoteLevel:", v15, 0);

  }
  else
  {
    -[MFPlainTextDocument appendString:withQuoteLevel:](v11, "appendString:withQuoteLevel:", v10, 0);
  }
  v21[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[MFOutgoingMessageDelivery initWithHeaders:mixedContent:textPartsAreHTML:]([MFOutgoingMessageDelivery alloc], "initWithHeaders:mixedContent:textPartsAreHTML:", v9, v16, 0);
  -[MFOutgoingMessageDelivery setArchiveAccount:](v17, "setArchiveAccount:", v7);

  return v17;
}

+ (id)senderForCommand:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v3 = a3;
  objc_msgSend(v3, "mailtoValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "sender");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "emailAddressValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "simpleAddress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    objc_msgSend(v6, "stringValue");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__13;
  v25 = __Block_byref_object_dispose__13;
  v26 = (id)0xAAAAAAAAAAAAAAAALL;
  objc_msgSend(v5, "defaultEmailAddress");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    objc_msgSend(v5, "firstEmailAddress");
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v26 = v14;

  if (v11)
  {
    objc_msgSend(v5, "emailAddressesAndAliases");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __58__MFListUnsubscribeMessageGenerator_iOS_senderForCommand___block_invoke;
    v18[3] = &unk_1E4E8B4D8;
    v19 = v11;
    v20 = &v21;
    objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v18);

  }
  v16 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v16;
}

@end
