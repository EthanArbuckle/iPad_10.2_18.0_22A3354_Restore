@implementation IMBalloonPluginPipelineParameter

+ (id)logger
{
  if (qword_1ED935FB0 != -1)
    dispatch_once(&qword_1ED935FB0, &unk_1E922C4E8);
  return (id)qword_1ED935FA0;
}

- (IMBalloonPluginPipelineParameter)initWithBD:(id)a3 idsTrustedData:(id)a4
{
  id v6;
  IMBalloonPluginPipelineParameter *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  __CFDictionary *Mutable;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  IMBalloonPluginPipelineParameter *v30;
  void *v31;
  void *v32;
  id v33;
  __CFDictionary *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v43;
  objc_super v44;
  uint8_t buf[4];
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v44.receiver = self;
  v44.super_class = (Class)IMBalloonPluginPipelineParameter;
  v7 = -[IMTextMessagePipelineParameter initWithBD:idsTrustedData:](&v44, sel_initWithBD_idsTrustedData_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "messageSubType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "balloonPlugin");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "payload");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "type");

    switch(v11)
    {
      case 0:
        objc_msgSend(v9, "payload");
        v12 = objc_claimAutoreleasedReturnValue();
        -[NSObject messagesAppBalloon](v12, "messagesAppBalloon");
        v13 = objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      case 1:
        objc_msgSend(v9, "payload");
        v12 = objc_claimAutoreleasedReturnValue();
        -[NSObject handwriting](v12, "handwriting");
        v13 = objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      case 2:
        objc_msgSend(v9, "payload");
        v12 = objc_claimAutoreleasedReturnValue();
        -[NSObject linkPresentation](v12, "linkPresentation");
        v13 = objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      case 3:
        Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
        objc_msgSend(v9, "payload");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "combinedPluginAttachmentInfo");
        v12 = objc_claimAutoreleasedReturnValue();

        -[NSObject ownerID](v12, "ownerID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          CFDictionarySetValue(Mutable, CFSTR("o"), v18);
        }
        else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          sub_1D166A8BC();
        }

        -[NSObject signature](v12, "signature");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          CFDictionarySetValue(Mutable, CFSTR("s"), v20);
        }
        else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          sub_1D166A83C();
        }

        -[NSObject attachmentURL](v12, "attachmentURL");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "absoluteString");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
        {
          CFDictionarySetValue(Mutable, CFSTR("r"), v22);
        }
        else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          sub_1D166A7BC();
        }

        -[NSObject encryptionKey](v12, "encryptionKey");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
        {
          CFDictionarySetValue(Mutable, CFSTR("e"), v23);
        }
        else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          sub_1D166A73C();
        }

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSObject expectedFileSize](v12, "expectedFileSize"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v24)
        {
          CFDictionarySetValue(Mutable, CFSTR("f"), v24);
        }
        else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          sub_1D166A6BC();
        }

        goto LABEL_32;
      case 4:
        objc_msgSend(v9, "payload");
        v12 = objc_claimAutoreleasedReturnValue();
        -[NSObject digitalTouchBalloon](v12, "digitalTouchBalloon");
        v13 = objc_claimAutoreleasedReturnValue();
LABEL_12:
        v19 = (void *)v13;
        Mutable = 0;
        break;
      default:
        +[IMBalloonPluginPipelineParameter logger](IMBalloonPluginPipelineParameter, "logger");
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v9, "payload");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "type");
          *(_DWORD *)buf = 134217984;
          v46 = v15;
          _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_DEFAULT, "[WARN] Unable to handle unknown payload type (type: %tu).", buf, 0xCu);

        }
        Mutable = 0;
LABEL_32:
        v19 = 0;
        break;
    }

    objc_msgSend(v9, "attachments");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "contents");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "count");

    if (v27)
    {
      +[IMDFileTransferCenter sharedInstance](IMDFileTransferCenter, "sharedInstance");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "attachments");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "metadata");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "messageGUID");
      v30 = v7;
      v31 = v9;
      v32 = v19;
      v33 = v6;
      v34 = Mutable;
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "UUIDString");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "guidsForStoredAttachmentBlastDoorPayloadData:messageGUID:", v28, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      Mutable = v34;
      v6 = v33;
      v19 = v32;
      v9 = v31;
      v7 = v30;

      -[IMTextMessagePipelineParameter setFileTransferGUIDs:](v30, "setFileTransferGUIDs:", v37);
    }
    -[IMTextMessagePipelineParameter setExpirable:](v7, "setExpirable:", objc_msgSend(v9, "isExpirable"));
    objc_msgSend(v9, "bundleID");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMBalloonPluginPipelineParameter setBalloonPluginBundleID:](v7, "setBalloonPluginBundleID:", v38);

    -[IMBalloonPluginPipelineParameter setBalloonPluginPayload:](v7, "setBalloonPluginPayload:", v19);
    -[IMBalloonPluginPipelineParameter setCombinedPayloadAttachmentDictionary:](v7, "setCombinedPayloadAttachmentDictionary:", Mutable);
    -[IMBalloonPluginPipelineParameter setAssociatedMessageType:](v7, "setAssociatedMessageType:", objc_msgSend(v9, "associatedMessageType"));
    objc_msgSend(v9, "associatedMessageGUID");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMTextMessagePipelineParameter setAssociatedMessageGUID:](v7, "setAssociatedMessageGUID:", v39);

    v40 = objc_msgSend(v9, "associatedMessageRange");
    -[IMBalloonPluginPipelineParameter setAssociatedMessageRange:](v7, "setAssociatedMessageRange:", v40, v41);

  }
  return v7;
}

- (NSString)balloonPluginBundleID
{
  return self->_balloonPluginBundleID;
}

- (void)setBalloonPluginBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 336);
}

- (NSData)balloonPluginPayload
{
  return self->_balloonPluginPayload;
}

- (void)setBalloonPluginPayload:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 344);
}

- (NSDictionary)combinedPayloadAttachmentDictionary
{
  return self->_combinedPayloadAttachmentDictionary;
}

- (void)setCombinedPayloadAttachmentDictionary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 352);
}

- (int64_t)associatedMessageType
{
  return self->_associatedMessageType;
}

- (void)setAssociatedMessageType:(int64_t)a3
{
  self->_associatedMessageType = a3;
}

- (_NSRange)associatedMessageRange
{
  _NSRange *p_associatedMessageRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_associatedMessageRange = &self->_associatedMessageRange;
  location = self->_associatedMessageRange.location;
  length = p_associatedMessageRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setAssociatedMessageRange:(_NSRange)a3
{
  self->_associatedMessageRange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_combinedPayloadAttachmentDictionary, 0);
  objc_storeStrong((id *)&self->_balloonPluginPayload, 0);
  objc_storeStrong((id *)&self->_balloonPluginBundleID, 0);
}

@end
