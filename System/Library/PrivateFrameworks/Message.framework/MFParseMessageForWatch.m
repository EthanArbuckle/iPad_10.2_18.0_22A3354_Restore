@implementation MFParseMessageForWatch

+ (id)createContentAttributedStringHTMLParser
{
  return objc_alloc_init(getNNMKContentAttributedStringHTMLParserClass());
}

+ (BOOL)attachmentTypeIsActionable:(unint64_t)a3
{
  return -[objc_class isTypeActionable:](getNNMKAttachmentClass(), "isTypeActionable:", a3);
}

+ (id)trimAttributedString:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  -[objc_class trimAttributedString:](getNNMKContentAttributedStringHTMLParserClass(), "trimAttributedString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)createMessage
{
  return objc_alloc_init(getNNMKMessageClass());
}

+ (id)createMessageContent
{
  return objc_alloc_init(getNNMKMessageContentClass());
}

+ (id)createAttachment
{
  return objc_alloc_init(getNNMKAttachmentClass());
}

+ (id)createImageAttachment
{
  return objc_alloc_init(getNNMKImageAttachmentClass());
}

+ (id)generateNotificationIdWithFolderId:(id)a3 remoteId:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  v6 = a4;
  -[objc_class generateNotificationIdWithFolderId:remoteId:](getNNMKMessageClass(), "generateNotificationIdWithFolderId:remoteId:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)accountIDForAccount:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "nano_account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accountId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)nanoMailboxIDForMFMailboxUID:(id)a3
{
  objc_msgSend(a3, "nano_mailboxId");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)scaleImageFromData:(id)a3 maxWidth:(float)a4
{
  id v5;
  void *v6;
  Class NNMKImageUtilityClass;
  double v8;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NNMKImageUtilityClass = getNNMKImageUtilityClass();
  *(float *)&v8 = a4;
  -[objc_class scaleImageFromData:destinationData:maxWidth:](NNMKImageUtilityClass, "scaleImageFromData:destinationData:maxWidth:", v5, v6, v8);

  return v6;
}

+ (id)createHTMLFromText:(id)a3 delSp:(BOOL)a4 flowed:(BOOL)a5
{
  int v5;
  char v7;

  if (a4)
    v5 = 10;
  else
    v5 = 8;
  v7 = 0;
  objc_msgSend(a3, "mf_convertFromFlowedText:visuallyEmpty:", v5 | a5, &v7);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
