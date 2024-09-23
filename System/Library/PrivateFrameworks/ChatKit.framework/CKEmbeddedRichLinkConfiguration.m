@implementation CKEmbeddedRichLinkConfiguration

+ (id)richLinkConfigurationWithURL:(id)a3
{
  id v3;
  CKEmbeddedRichLinkConfiguration *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = objc_alloc_init(CKEmbeddedRichLinkConfiguration);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKEmbeddedRichLinkConfiguration setEntryItemUUID:](v4, "setEntryItemUUID:", v6);

  -[CKEmbeddedRichLinkConfiguration setUrl:](v4, "setUrl:", v3);
  -[CKEmbeddedRichLinkConfiguration setPluginPayload:](v4, "setPluginPayload:", 0);
  return v4;
}

- (void)setPluginPayload:(id)a3
{
  IMPluginPayload *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  IMPluginPayload *pluginPayload;
  int v13;
  CKEmbeddedRichLinkConfiguration *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (IMPluginPayload *)a3;
  -[IMPluginPayload datasource](v4, "datasource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "pendingAttachmentData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v6, "pendingAttachmentData");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = 134218240;
          v14 = self;
          v15 = 2048;
          v16 = objc_msgSend(v10, "count");
          _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "<CKEmbeddedRichLinkConfiguration %p> is hoisting {%ld} pendingAttachments into the attachments field.", (uint8_t *)&v13, 0x16u);

        }
      }
      objc_msgSend(v6, "pendingAttachmentData");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMPluginPayload setAttachments:](v4, "setAttachments:", v11);

    }
  }
  pluginPayload = self->_pluginPayload;
  self->_pluginPayload = v4;

}

- (NSData)pluginPayloadData
{
  void *v2;
  void *v3;

  -[CKEmbeddedRichLinkConfiguration pluginPayload](self, "pluginPayload");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (NSString)urlText
{
  void *v2;
  void *v3;

  -[CKEmbeddedRichLinkConfiguration url](self, "url");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "absoluteString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)_makeSendablePluginPayload
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  -[CKEmbeddedRichLinkConfiguration pluginPayload](self, "pluginPayload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
    objc_msgSend(v5, "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    IMSharedHelperPayloadFromCombinedPluginPayloadData();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    objc_msgSend(v5, "setData:", v7);

    if (v8 && objc_msgSend(v8, "count"))
      objc_msgSend(v5, "setAttachments:", v8);
  }
  else
  {
    v5 = objc_alloc_init(MEMORY[0x1E0D358D8]);
    objc_msgSend(v5, "setPluginBundleID:", *MEMORY[0x1E0D375F8]);
    -[CKEmbeddedRichLinkConfiguration url](self, "url");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setUrl:", v8);
  }

  objc_msgSend(MEMORY[0x1E0D35770], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dataSourceForPluginPayload:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "payloadWillEnterShelf");
  objc_msgSend(v10, "payloadWillSendFromShelf");
  objc_msgSend(v10, "messagePayloadDataForSending");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setData:", v11);

  objc_msgSend(v10, "setPayloadInShelf:", 0);
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CKEmbeddedRichLinkConfiguration entryItemUUID](self, "entryItemUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("ITEM_KEY_UUID"));

  -[CKEmbeddedRichLinkConfiguration url](self, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("ITEM_KEY_URL"));

  -[CKEmbeddedRichLinkConfiguration pluginPayload](self, "pluginPayload");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("ITEM_KEY_PLUGIN_PAYLOAD"));

}

- (CKEmbeddedRichLinkConfiguration)initWithCoder:(id)a3
{
  id v4;
  CKEmbeddedRichLinkConfiguration *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = objc_alloc_init(CKEmbeddedRichLinkConfiguration);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ITEM_KEY_UUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKEmbeddedRichLinkConfiguration setEntryItemUUID:](v5, "setEntryItemUUID:", v6);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ITEM_KEY_URL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKEmbeddedRichLinkConfiguration setUrl:](v5, "setUrl:", v7);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ITEM_KEY_PLUGIN_PAYLOAD"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKEmbeddedRichLinkConfiguration setPluginPayload:](v5, "setPluginPayload:", v8);
  return v5;
}

- (NSString)entryItemUUID
{
  return self->_entryItemUUID;
}

- (void)setEntryItemUUID:(id)a3
{
  objc_storeStrong((id *)&self->_entryItemUUID, a3);
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (IMPluginPayload)pluginPayload
{
  return self->_pluginPayload;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pluginPayload, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_entryItemUUID, 0);
}

@end
