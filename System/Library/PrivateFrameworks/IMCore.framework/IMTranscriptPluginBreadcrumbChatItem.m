@implementation IMTranscriptPluginBreadcrumbChatItem

- (id)_initWithItem:(id)a3 datasource:(id)a4 statusText:(id)a5 optionFlags:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  id *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v17.receiver = self;
  v17.super_class = (Class)IMTranscriptPluginBreadcrumbChatItem;
  v13 = -[IMChatItem _initWithItem:](&v17, sel__initWithItem_, v10);
  if (v13)
  {
    objc_msgSend(v10, "guid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)sub_1A2132A84();

    objc_msgSend(v13, "_setGUID:", v15);
    objc_storeStrong(v13 + 7, a4);
    objc_storeStrong(v13 + 8, a5);
    v13[10] = (id)a6;

  }
  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  NSString *rawStatusText;
  IMBalloonPluginDataSource *dataSource;
  char v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IMTranscriptPluginBreadcrumbChatItem;
  if (-[IMTranscriptChatItem isEqual:](&v10, sel_isEqual_, v4))
  {
    v5 = v4;
    if (self->_optionFlags == v5[10]
      && ((rawStatusText = self->_rawStatusText, rawStatusText == (NSString *)v5[8])
       || -[NSString isEqual:](rawStatusText, "isEqual:")))
    {
      dataSource = self->_dataSource;
      if (dataSource == (IMBalloonPluginDataSource *)v5[7])
        v8 = 1;
      else
        v8 = -[IMBalloonPluginDataSource isEqual:](dataSource, "isEqual:");
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  char *v3;
  char *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IMTranscriptPluginBreadcrumbChatItem;
  v3 = (char *)-[IMTranscriptChatItem hash](&v6, sel_hash) + self->_optionFlags;
  v4 = &v3[-[NSString hash](self->_rawStatusText, "hash")];
  return (unint64_t)&v4[-[IMBalloonPluginDataSource hash](self->_dataSource, "hash")];
}

- (void)configureStatusTextWithAccount:(id)a3
{
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  NSString *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  NSString *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSString *v35;
  NSString *statusText;
  void *v37;
  id v38;
  uint8_t buf[4];
  NSString *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v38 = a3;
  v4 = self->_rawStatusText;
  objc_msgSend(MEMORY[0x1E0CB3780], "alphanumericCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "nonBaseCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "formUnionWithCharacterSet:", v6);

  objc_msgSend(MEMORY[0x1E0CB3500], "symbolCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "formUnionWithCharacterSet:", v7);

  objc_msgSend(v5, "invert");
  objc_msgSend((id)*MEMORY[0x1E0D362F8], "stringByAppendingString:", *MEMORY[0x1E0D36318]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addCharactersInString:", v8);

  -[NSString componentsSeparatedByCharactersInSet:](v4, "componentsSeparatedByCharactersInSet:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "componentsJoinedByString:", &stru_1E4725068);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "length"))
  {
    v11 = 0;
  }
  else
  {
    -[IMBalloonPluginDataSource bundleID](self->_dataSource, "bundleID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "hasPrefix:", *MEMORY[0x1E0D375D0]);

    if (!v13)
      goto LABEL_5;
    -[IMBalloonPluginDataSource pluginPayload](self->_dataSource, "pluginPayload");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "payloadDictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "objectForKey:", *MEMORY[0x1E0D37E20]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
LABEL_5:
      +[IMBalloonPluginManager sharedInstance](IMBalloonPluginManager, "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMBalloonPluginDataSource bundleID](self->_dataSource, "bundleID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "balloonPluginForBundleID:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "browserDisplayName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v19 = (void *)MEMORY[0x1E0CB3940];
    sub_1A20F1964();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("$(%@) sent %@ message"), &stru_1E4725068, CFSTR("IMCoreLocalizable"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", v21, kIMTranscriptPluginBreadcrumbTextSenderIdentifier, v11);
    v22 = objc_claimAutoreleasedReturnValue();

    v4 = (NSString *)v22;
  }
  -[NSString __im_rangesOfHandleIdentifierStrings](v4, "__im_rangesOfHandleIdentifierStrings");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v23, "count"))
  {
    v37 = v10;
    v24 = (NSString *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[IMChatItem _item](self, "_item");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "_senderHandle");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26 && objc_msgSend(v26, "hasName"))
    {
      objc_msgSend(v26, "name");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27)
      {
        CFDictionarySetValue((CFMutableDictionaryRef)v24, kIMTranscriptPluginBreadcrumbTextSenderIdentifier, v27);
      }
      else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        sub_1A2196A88();
      }

    }
    -[IMChatItem _item](self, "_item");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "_otherHandle");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32 && objc_msgSend(v32, "hasName"))
    {
      objc_msgSend(v32, "name");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (v33)
      {
        CFDictionarySetValue((CFMutableDictionaryRef)v24, kIMTranscriptPluginBreadcrumbTextReceiverIdentifier, v33);
      }
      else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        sub_1A2196A04();
      }

    }
    v34 = (void *)-[NSString mutableCopy](v4, "mutableCopy");
    v30 = v38;
    +[IMBalloonPluginDataSource replaceHandleWithContactNameInString:forAccount:additionalHandles:](IMBalloonPluginDataSource, "replaceHandleWithContactNameInString:forAccount:additionalHandles:", v34, v38, v24);
    v35 = (NSString *)objc_claimAutoreleasedReturnValue();
    statusText = self->_statusText;
    self->_statusText = v35;

    v10 = v37;
  }
  else
  {
    IMLogHandleForCategory();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v40 = v4;
      v41 = 2112;
      v42 = v23;
      v43 = 2112;
      v44 = v11;
      _os_log_error_impl(&dword_1A1FF4000, v28, OS_LOG_TYPE_ERROR, "There are no identifier strings to replace, so we display the raw string. tmpRawStatusText: %@, identifierRanges: %@, pluginName: %@", buf, 0x20u);
    }

    v29 = v4;
    v24 = self->_statusText;
    self->_statusText = v29;
    v30 = v38;
  }

}

- (NSString)type
{
  return -[IMBalloonPluginDataSource bundleID](self->_dataSource, "bundleID");
}

- (BOOL)isFromMe
{
  void *v2;
  char v3;

  -[IMChatItem _item](self, "_item");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFromMe");

  return v3;
}

- (BOOL)canDelete
{
  return IMGetDomainBoolForKey();
}

- (IMBalloonPluginDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (NSString)rawStatusText
{
  return self->_rawStatusText;
}

- (NSString)statusText
{
  return self->_statusText;
}

- (unint64_t)optionFlags
{
  return self->_optionFlags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusText, 0);
  objc_storeStrong((id *)&self->_rawStatusText, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end
