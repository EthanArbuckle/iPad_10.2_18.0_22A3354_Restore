@implementation IMMessageRetractionChatItem

- (id)_initWithItem:(id)a3 partIndex:(int64_t)a4 isFailedRetraction:(BOOL)a5 retractionUnsupportedByHandles:(id)a6 sender:(id)a7 isFromMe:(BOOL)a8
{
  id v14;
  id v15;
  id v16;
  id *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  int64_t v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  BOOL v31;
  id v32;
  objc_super v33;

  v14 = a3;
  v15 = a6;
  v16 = a7;
  v33.receiver = self;
  v33.super_class = (Class)IMMessageRetractionChatItem;
  v17 = -[IMChatItem _initWithItem:](&v33, sel__initWithItem_, v14);
  if (v17)
  {
    v18 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v14, "guid");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v14;
    v20 = (void *)objc_msgSend(v18, "initWithFormat:", CFSTR("p:%ld/%@"), a4, v19);

    v31 = a8;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v17[10], "count"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringValue");
    v22 = a7;
    v23 = a4;
    v24 = v15;
    v25 = v16;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)sub_1A2132A84();

    v16 = v25;
    v15 = v24;

    objc_msgSend(v17, "_setGUID:", v27);
    v17[9] = (id)v23;
    objc_storeStrong(v17 + 8, v22);
    *((_BYTE *)v17 + 56) = v31;
    *((_BYTE *)v17 + 57) = a5;
    v28 = objc_msgSend(v24, "copy");
    v29 = v17[10];
    v17[10] = (id)v28;

    v14 = v32;
  }

  return v17;
}

- (BOOL)canRetryFailedRetraction
{
  void *v2;
  char v3;

  -[IMMessageRetractionChatItem _retractedMessageItem](self, "_retractedMessageItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canRetryFailedRetraction");

  return v3;
}

- (IMMessage)message
{
  void *v2;
  void *v3;

  -[IMMessageRetractionChatItem _retractedMessageItem](self, "_retractedMessageItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "message");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (IMMessage *)v3;
}

- (NSString)messageGUID
{
  void *v2;
  void *v3;

  -[IMMessageRetractionChatItem _retractedMessageItem](self, "_retractedMessageItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "guid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (unint64_t)replyCount
{
  void *v3;
  int64_t v4;
  void *v5;
  unint64_t v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  -[IMMessageRetractionChatItem _retractedMessageItem](self, "_retractedMessageItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[IMMessageRetractionChatItem partIndex](self, "partIndex");
  objc_msgSend(v3, "replyCountsByPart");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x3032000000;
    v12 = sub_1A200ADD4;
    v13 = sub_1A200AC5C;
    v14 = 0;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1A2094330;
    v8[3] = &unk_1E4720388;
    v8[4] = &v9;
    v8[5] = v4;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v8);
    v6 = objc_msgSend((id)v10[5], "unsignedIntegerValue");
    _Block_object_dispose(&v9, 8);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSString)threadIdentifier
{
  void *v2;
  void *v3;

  -[IMMessageRetractionChatItem _retractedMessageItem](self, "_retractedMessageItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "threadIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)canDelete
{
  return 0;
}

- (IMHandle)sender
{
  return self->_sender;
}

- (BOOL)isFromMe
{
  return self->_isFromMe;
}

- (int64_t)partIndex
{
  return self->_partIndex;
}

- (BOOL)isFailedRetraction
{
  return self->_isFailedRetraction;
}

- (NSArray)retractionUnsupportedByHandles
{
  return self->_retractionUnsupportedByHandles;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retractionUnsupportedByHandles, 0);
  objc_storeStrong((id *)&self->_sender, 0);
}

@end
