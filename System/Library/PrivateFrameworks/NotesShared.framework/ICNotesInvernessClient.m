@implementation ICNotesInvernessClient

- (ICNotesInvernessClient)initWithContainer:(id)a3
{
  id v4;
  ICNotesInvernessClient *v5;
  ICNotesInvernessClientObjc *v6;
  ICNotesInvernessClientObjc *objcClient;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICNotesInvernessClient;
  v5 = -[ICNotesInvernessClient init](&v9, sel_init);
  if (v5)
  {
    v6 = -[ICNotesInvernessClientObjc initWithContainer:environment:localURLString:]([ICNotesInvernessClientObjc alloc], "initWithContainer:environment:localURLString:", v4, 2, CFSTR("http://localhost/"));
    objcClient = v5->_objcClient;
    v5->_objcClient = v6;

  }
  return v5;
}

- (void)sendMentionNotificationWithRecipientUserId:(id)a3 senderName:(id)a4 noteTitle:(id)a5 mentionSnippet:(id)a6 shareRecordName:(id)a7 shareOwnerUserId:(id)a8 noteRecordName:(id)a9 inlineAttachmentRecordName:(id)a10 callback:(id)a11
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;

  v18 = a11;
  v19 = a10;
  v20 = a9;
  v21 = a8;
  v22 = a7;
  v23 = a6;
  v24 = a5;
  v25 = a4;
  v26 = a3;
  -[ICNotesInvernessClient objcClient](self, "objcClient");
  v27 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "sendMentionNotificationWithRecipientUserId:senderName:noteTitle:mentionSnippet:shareRecordName:shareOwnerUserId:noteRecordName:inlineAttachmentRecordName:callback:", v26, v25, v24, v23, v22, v21, v20, v19, v18);

}

- (void)didCompleteInstallOrUpdateWithPreviousBuildNumber:(id)a3 previousVersion:(id)a4 currentBuildNumber:(id)a5 currentVersion:(id)a6 platformName:(id)a7 continuationToken:(id)a8 callback:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;

  v16 = a9;
  v17 = a8;
  v18 = a7;
  v19 = a6;
  v20 = a5;
  v21 = a4;
  v22 = a3;
  -[ICNotesInvernessClient objcClient](self, "objcClient");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "didCompleteInstallOrUpdateWithPreviousBuildNumber:previousVersion:currentBuildNumber:currentVersion:platformName:continuationToken:callback:", v22, v21, v20, v19, v18, v17, v16);

}

- (void)runGarbageCollectorWithProgress:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[ICNotesInvernessClient objcClient](self, "objcClient");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "runGarbageCollectorWithProgress:callback:", v7, v6);

}

- (ICNotesInvernessClientObjc)objcClient
{
  return self->_objcClient;
}

- (void)setObjcClient:(id)a3
{
  objc_storeStrong((id *)&self->_objcClient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objcClient, 0);
}

@end
