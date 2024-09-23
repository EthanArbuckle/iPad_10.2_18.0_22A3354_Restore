@implementation IMSenderChatItem

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  int v5;
  id v6;
  void *v7;
  IMHandle *handle;
  uint64_t v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isTranscriptSharingEnabled");

  v6 = objc_alloc((Class)objc_opt_class());
  -[IMChatItem _item](self, "_item");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  handle = self->_handle;
  if (v5)
    v9 = objc_msgSend(v6, "_initWithItem:handle:displayName:transcriptSharingMessageType:", v7, handle, self->_displayName, self->_transcriptSharingMessageType);
  else
    v9 = objc_msgSend(v6, "_initWithItem:handle:", v7, handle);
  v10 = (void *)v9;

  return v10;
}

- (id)_initWithItem:(id)a3 handle:(id)a4 displayName:(id)a5 transcriptSharingMessageType:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  id *v13;
  id *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v19.receiver = self;
  v19.super_class = (Class)IMSenderChatItem;
  v13 = -[IMChatItem _initWithItem:](&v19, sel__initWithItem_, v10);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong(v13 + 7, a4);
    objc_storeStrong(v14 + 8, a5);
    v14[9] = (id)a6;
    objc_msgSend(v11, "ID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "guid");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)sub_1A2132A84();

    objc_msgSend(v14, "_setGUID:", v17);
  }

  return v14;
}

- (id)_initWithItem:(id)a3 handle:(id)a4
{
  id v6;
  id v7;
  id *v8;
  id *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IMSenderChatItem;
  v8 = -[IMChatItem _initWithItem:](&v14, sel__initWithItem_, v6);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong(v8 + 7, a4);
    objc_msgSend(v7, "ID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "guid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)sub_1A2132A84();

    objc_msgSend(v9, "_setGUID:", v12);
  }

  return v9;
}

- (IMHandle)handle
{
  return self->_handle;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (int64_t)transcriptSharingMessageType
{
  return self->_transcriptSharingMessageType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_handle, 0);
}

@end
