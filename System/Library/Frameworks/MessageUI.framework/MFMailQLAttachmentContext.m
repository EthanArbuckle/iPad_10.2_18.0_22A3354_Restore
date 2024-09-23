@implementation MFMailQLAttachmentContext

+ (MFMailQLAttachmentContext)contextWithUserActivity:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;

  v4 = a3;
  objc_msgSend(v4, "activityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D46CF8]);

  if ((v6 & 1) != 0)
  {
    objc_msgSend(v4, "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D46D08]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D46D10]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D46D18]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *MEMORY[0x1E0D46C80];
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D46C80]);
    v25 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D46C90]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D46D20]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D46D28]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "BOOLValue");

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (objc_opt_respondsToSelector() & 1) != 0
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_opt_class();
      v16 = (void *)v25;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (v11)
        {
          objc_msgSend(MEMORY[0x1E0D1E1D8], "objectIDFromSerializedRepresentation:", v11);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v24 = 0;
        }
        v21 = objc_alloc((Class)a1);
        objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v8);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v9, "integerValue");
        objc_msgSend(MEMORY[0x1E0D1E258], "objectIDFromSerializedRepresentation:", v25);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        BYTE1(v19) = objc_msgSend(v26, "BOOLValue");
        LOBYTE(v19) = v15;
        v17 = (void *)objc_msgSend(v21, "initWithAttachmentURL:editBehavior:messageObjectID:mailboxObjectID:subject:senderDisplayName:shouldShowReplyAll:contentManaged:", v22, v20, v23, v24, v12, v13, v19);

      }
      else
      {
        v17 = 0;
      }
    }
    else
    {
      v17 = 0;
      v16 = (void *)v25;
    }

  }
  else
  {
    v17 = 0;
  }

  return (MFMailQLAttachmentContext *)v17;
}

- (MFMailQLAttachmentContext)initWithAttachmentURL:(id)a3 editBehavior:(int64_t)a4 messageObjectID:(id)a5 mailboxObjectID:(id)a6 subject:(id)a7 senderDisplayName:(id)a8 shouldShowReplyAll:(BOOL)a9 contentManaged:(BOOL)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  MFMailQLAttachmentContext *v20;
  MFMailQLAttachmentContext *v21;
  MFAttachment *attachmentBeingEdited;
  id v25;
  objc_super v26;

  v16 = a3;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v25 = a8;
  v26.receiver = self;
  v26.super_class = (Class)MFMailQLAttachmentContext;
  v20 = -[MFMailQLAttachmentContext init](&v26, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_attachmentURL, a3);
    v21->_contentManaged = a10;
    v21->_editBehavior = a4;
    objc_storeStrong((id *)&v21->_messageObjectID, a5);
    objc_storeStrong((id *)&v21->_mailboxObjectID, a6);
    objc_storeStrong((id *)&v21->_subject, a7);
    objc_storeStrong((id *)&v21->_senderDisplayName, a8);
    v21->_shouldShowReplyAll = a9;
    v21->_insertingDrawing = 0;
    attachmentBeingEdited = v21->_attachmentBeingEdited;
    v21->_attachmentBeingEdited = 0;

  }
  return v21;
}

- (id)initForInsertingDrawing
{
  id result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFMailQLAttachmentContext;
  result = -[MFMailQLAttachmentContext init](&v3, sel_init);
  if (result)
    *((_BYTE *)result + 10) = 1;
  return result;
}

- (MFMailQLAttachmentContext)initWithAttachmentBeingEdited:(id)a3
{
  id v5;
  MFMailQLAttachmentContext *v6;
  MFMailQLAttachmentContext *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFMailQLAttachmentContext;
  v6 = -[MFMailQLAttachmentContext init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_attachmentBeingEdited, a3);
    v7->_insertingDrawing = 0;
  }

  return v7;
}

- (NSUserActivity)userActivity
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  void *v24;
  id v25;
  _QWORD v26[6];
  _QWORD v27[7];

  v27[6] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0CA5920]);
  v4 = *MEMORY[0x1E0D46CF8];
  v25 = (id)objc_msgSend(v3, "initWithActivityType:", *MEMORY[0x1E0D46CF8]);
  v5 = objc_alloc(MEMORY[0x1E0C99E08]);
  v26[0] = *MEMORY[0x1E0D46D08];
  -[MFMailQLAttachmentContext attachmentURL](self, "attachmentURL");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v6;
  v26[1] = *MEMORY[0x1E0D46D10];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[MFMailQLAttachmentContext editBehavior](self, "editBehavior"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v7;
  v26[2] = *MEMORY[0x1E0D46D18];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MFMailQLAttachmentContext isContentManaged](self, "isContentManaged"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v8;
  v26[3] = *MEMORY[0x1E0D46C80];
  -[MFMailQLAttachmentContext messageObjectID](self, "messageObjectID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "serializedRepresentation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v10;
  v26[4] = *MEMORY[0x1E0D46C90];
  -[MFMailQLAttachmentContext subject](self, "subject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v4;
  v27[4] = v11;
  v26[5] = *MEMORY[0x1E0D46D28];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MFMailQLAttachmentContext shouldShowReplyAll](self, "shouldShowReplyAll"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v27[5] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v5, "initWithDictionary:", v13);

  -[MFMailQLAttachmentContext senderDisplayName](self, "senderDisplayName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[MFMailQLAttachmentContext senderDisplayName](self, "senderDisplayName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0D46D20]);

  }
  -[MFMailQLAttachmentContext mailboxObjectID](self, "mailboxObjectID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "serializedRepresentation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v18, *MEMORY[0x1E0D46C78]);
  objc_msgSend(v25, "setUserInfo:", v14);
  v19 = (void *)MEMORY[0x1E0CB3940];
  -[NSURL absoluteString](self->_attachmentURL, "absoluteString");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFormat:", CFSTR("%@.%@"), v23, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setTargetContentIdentifier:", v21);

  return (NSUserActivity *)v25;
}

- (NSURL)attachmentURL
{
  return self->_attachmentURL;
}

- (BOOL)isContentManaged
{
  return self->_contentManaged;
}

- (int64_t)editBehavior
{
  return self->_editBehavior;
}

- (EMMessageObjectID)messageObjectID
{
  return self->_messageObjectID;
}

- (EMMailboxObjectID)mailboxObjectID
{
  return self->_mailboxObjectID;
}

- (NSString)subject
{
  return self->_subject;
}

- (NSString)senderDisplayName
{
  return self->_senderDisplayName;
}

- (BOOL)shouldShowReplyAll
{
  return self->_shouldShowReplyAll;
}

- (BOOL)insertingDrawing
{
  return self->_insertingDrawing;
}

- (MFAttachment)attachmentBeingEdited
{
  return self->_attachmentBeingEdited;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentBeingEdited, 0);
  objc_storeStrong((id *)&self->_senderDisplayName, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_mailboxObjectID, 0);
  objc_storeStrong((id *)&self->_messageObjectID, 0);
  objc_storeStrong((id *)&self->_attachmentURL, 0);
}

@end
