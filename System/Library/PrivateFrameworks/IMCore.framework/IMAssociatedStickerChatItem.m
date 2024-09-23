@implementation IMAssociatedStickerChatItem

- (BOOL)supportsCommunicationSafety
{
  return 1;
}

- (id)commSafetyMessageGUID
{
  void *v2;
  void *v3;

  -[IMAssociatedMessageChatItem message](self, "message");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "guid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)IMAssociatedStickerChatItem;
  -[IMTranscriptChatItem description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[[%@] transferGUID: %@]"), v4, self->_transferGUID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc((Class)objc_opt_class());
  -[IMChatItem _item](self, "_item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMAssociatedMessageChatItem sender](self, "sender");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "_initWithItem:sender:transferGUID:", v5, v6, self->_transferGUID);

  return v7;
}

- (BOOL)canDelete
{
  return 1;
}

- (id)_initWithItem:(id)a3 sender:(id)a4 transferGUID:(id)a5
{
  id v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  objc_super v13;

  v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)IMAssociatedStickerChatItem;
  v9 = -[IMAssociatedMessageChatItem _initWithItem:sender:](&v13, sel__initWithItem_sender_, a3, a4);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    v11 = (void *)v9[20];
    v9[20] = v10;

    objc_msgSend(v9, "_refreshGeometryDescriptorFromStickerUserInfo");
  }

  return v9;
}

- (void)_refreshGeometryDescriptorFromStickerUserInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  float v14;
  void *v15;
  void *v16;
  float v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  float v22;
  void *v23;
  void *v24;
  float v25;
  void *v26;
  void *v27;
  float v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[7];

  +[IMFileTransferCenter sharedInstance](IMFileTransferCenter, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transferForGUID:", self->_transferGUID);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isSticker"))
  {
    objc_msgSend(v4, "stickerUserInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D392C0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
      v31 = objc_msgSend(v6, "unsignedIntValue");
    else
      v31 = 0;
    objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D392B0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
      v30 = objc_msgSend(v8, "unsignedIntValue");
    else
      v30 = 0;
    objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D392C8]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = 0.0;
    v13 = 0.0;
    if (v10)
    {
      objc_msgSend(v10, "floatValue");
      v13 = v14;
    }
    objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D39328]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      objc_msgSend(v15, "floatValue");
      v12 = v17;
    }
    objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D39330]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    v20 = 0.0;
    v21 = 0.0;
    if (v18)
    {
      objc_msgSend(v18, "floatValue");
      v21 = v22;
    }
    objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D392D8]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v23)
    {
      objc_msgSend(v23, "floatValue");
      v20 = v25;
    }
    objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D392D0]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v26)
    {
      objc_msgSend(v26, "floatValue");
      v29 = v28;
    }
    else
    {
      v29 = 0.0;
    }
    v32[0] = v31;
    v32[1] = v30;
    *(double *)&v32[2] = v13;
    *(double *)&v32[3] = v12;
    *(double *)&v32[4] = v21;
    *(double *)&v32[5] = v20;
    *(double *)&v32[6] = v29;
    -[IMAssociatedMessageChatItem _setGeometryDescriptor:](self, "_setGeometryDescriptor:", v32);

  }
}

- (unint64_t)stickerPositionVersion
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;

  +[IMFileTransferCenter sharedInstance](IMFileTransferCenter, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transferForGUID:", self->_transferGUID);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isSticker"))
  {
    objc_msgSend(v4, "stickerUserInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "valueForKey:", *MEMORY[0x1E0D39318]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "unsignedIntValue");

  }
  else
  {
    v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (NSString)transferGUID
{
  return self->_transferGUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transferGUID, 0);
}

@end
