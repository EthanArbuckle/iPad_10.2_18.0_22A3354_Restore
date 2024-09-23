@implementation IMPluginPayload

- (IMPluginPayload)initWithMessage:(id)a3
{
  void *v4;
  IMPluginPayload *v5;

  objc_msgSend(a3, "_imMessageItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[IMPluginPayload initWithMessageItem:](self, "initWithMessageItem:", v4);

  return v5;
}

- (IMPluginPayload)initWithMessageItem:(id)a3
{
  return -[IMPluginPayload initWithMessageItem:chatContext:](self, "initWithMessageItem:chatContext:", a3, 0);
}

- (IMPluginPayload)initWithMessageItem:(id)a3 chatContext:(id)a4
{
  id v6;
  id v7;
  IMPluginPayload *v8;
  uint64_t v9;
  NSString *messageGUID;
  uint64_t v11;
  NSDate *time;
  uint64_t v13;
  NSString *pluginSessionGUID;
  uint64_t v15;
  NSString *pluginBundleID;
  void *v17;
  uint64_t v18;
  NSURL *url;
  void *v20;
  void *v21;
  id v22;
  _UNKNOWN **v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  _UNKNOWN **v51;
  void *v52;
  void *v53;
  NSAttributedString *text;
  NSAttributedString *v55;
  void *v56;
  uint64_t v57;
  NSString *breadcrumbText;
  uint64_t v59;
  NSArray *attachments;
  void *v61;
  uint64_t v62;
  NSData *data;
  uint64_t v64;
  NSArray *consumedSessionPayloads;
  uint64_t v66;
  NSString *sender;
  uint64_t v68;
  NSArray *fileTransferGUIDs;
  IMPluginPayload *v71;
  IMPluginPayload *v72;
  id v73;
  void *v74;
  uint64_t v75;
  NSAttributedString *v76;
  id obj;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  objc_super v86;
  _BYTE v87[128];
  _BYTE v88[128];
  _QWORD v89[3];

  v89[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v86.receiver = self;
  v86.super_class = (Class)IMPluginPayload;
  v8 = -[IMPluginPayload init](&v86, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "guid");
    v9 = objc_claimAutoreleasedReturnValue();
    messageGUID = v8->_messageGUID;
    v8->_messageGUID = (NSString *)v9;

    objc_msgSend(v6, "time");
    v11 = objc_claimAutoreleasedReturnValue();
    time = v8->_time;
    v8->_time = (NSDate *)v11;

    objc_msgSend(v6, "pluginSessionGUID");
    v13 = objc_claimAutoreleasedReturnValue();
    pluginSessionGUID = v8->_pluginSessionGUID;
    v8->_pluginSessionGUID = (NSString *)v13;

    objc_msgSend(v6, "balloonBundleID");
    v15 = objc_claimAutoreleasedReturnValue();
    pluginBundleID = v8->_pluginBundleID;
    v8->_pluginBundleID = (NSString *)v15;

    objc_msgSend(v6, "body");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_pluginPayloadURLFromIMMessageItemBody");
    v18 = objc_claimAutoreleasedReturnValue();
    url = v8->_url;
    v71 = v8;
    v8->_url = (NSURL *)v18;

    v76 = (NSAttributedString *)objc_alloc_init(MEMORY[0x1E0CB3778]);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = v7;
    v22 = +[IMMessagePartChatItem _newMessagePartsForMessageItem:chatContext:](IMMessagePartChatItem, "_newMessagePartsForMessageItem:chatContext:", v6, v7);
    v23 = &off_1E471A000;
    v74 = v6;
    if (v22)
    {
      v24 = v22;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v89[0] = v24;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v89, 1);
        v25 = objc_claimAutoreleasedReturnValue();

        v24 = (void *)v25;
      }
      v84 = 0u;
      v85 = 0u;
      v82 = 0u;
      v83 = 0u;
      obj = v24;
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v88, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v83;
        do
        {
          for (i = 0; i != v27; ++i)
          {
            if (*(_QWORD *)v83 != v28)
              objc_enumerationMutation(obj);
            v30 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v31 = v30;
              objc_msgSend(v31, "subject");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v32)
              {
                objc_msgSend(v31, "text");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v32)
                  goto LABEL_18;
              }
              -[NSAttributedString appendAttributedString:](v76, "appendAttributedString:", v32, v71);
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                continue;
              objc_msgSend(v30, "transferGUID");
              v31 = (id)objc_claimAutoreleasedReturnValue();
              +[IMFileTransferCenter sharedInstance](IMFileTransferCenter, "sharedInstance");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "transferForGUID:", v31);
              v32 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v32, "localURL");
              v34 = (void *)objc_claimAutoreleasedReturnValue();

              if (v34)
              {
                objc_msgSend(v21, "addObject:", v31);
                objc_msgSend(v32, "localURL");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "addObject:", v35);

              }
            }

LABEL_18:
          }
          v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v88, 16);
        }
        while (v27);
      }

      v6 = v74;
      v23 = &off_1E471A000;
    }
    else
    {
      obj = 0;
    }
    v80 = 0u;
    v81 = 0u;
    v78 = 0u;
    v79 = 0u;
    objc_msgSend(v6, "fileTransferGUIDs", v71);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v78, v87, 16);
    if (!v37)
      goto LABEL_37;
    v38 = v37;
    v39 = *(_QWORD *)v79;
LABEL_25:
    v40 = 0;
    v75 = v38;
    while (1)
    {
      if (*(_QWORD *)v79 != v39)
        objc_enumerationMutation(v36);
      v41 = *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * v40);
      if ((objc_msgSend(v21, "containsObject:", v41) & 1) != 0)
        goto LABEL_35;
      objc_msgSend(v21, "addObject:", v41);
      objc_msgSend(v23[150], "sharedInstance");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "transferForGUID:", v41);
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v43, "localURL");
      v44 = objc_claimAutoreleasedReturnValue();
      if (!v44)
      {
        objc_msgSend(v43, "localPath");
        v45 = (void *)objc_claimAutoreleasedReturnValue();

        if (v45)
        {
          v46 = (void *)MEMORY[0x1E0C99E98];
          objc_msgSend(v43, "localPath");
          v47 = v39;
          v48 = v36;
          v49 = v21;
          v50 = v20;
          v51 = v23;
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "fileURLWithPath:", v52);
          v53 = (void *)objc_claimAutoreleasedReturnValue();

          v23 = v51;
          v20 = v50;
          v21 = v49;
          v36 = v48;
          v39 = v47;
          v38 = v75;
          if (v53)
            goto LABEL_34;
        }
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v44 = objc_claimAutoreleasedReturnValue();
      }
      v53 = (void *)v44;
LABEL_34:
      objc_msgSend(v20, "addObject:", v53);

LABEL_35:
      if (v38 == ++v40)
      {
        v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v78, v87, 16);
        if (!v38)
        {
LABEL_37:

          v8 = v72;
          text = v72->_text;
          v72->_text = v76;
          v55 = v76;

          v6 = v74;
          objc_msgSend(v74, "breadcrumbText");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "string");
          v57 = objc_claimAutoreleasedReturnValue();
          breadcrumbText = v72->_breadcrumbText;
          v72->_breadcrumbText = (NSString *)v57;

          v59 = objc_msgSend(v20, "copy");
          attachments = v72->_attachments;
          v72->_attachments = (NSArray *)v59;

          objc_msgSend(v74, "payloadData");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "_FTOptionallyDecompressData");
          v62 = objc_claimAutoreleasedReturnValue();
          data = v72->_data;
          v72->_data = (NSData *)v62;

          v72->_sticker = objc_msgSend(v74, "isSticker");
          v72->_shouldExpire = objc_msgSend(v74, "isExpirable");
          objc_msgSend(v74, "consumedSessionPayloads");
          v64 = objc_claimAutoreleasedReturnValue();
          consumedSessionPayloads = v72->_consumedSessionPayloads;
          v72->_consumedSessionPayloads = (NSArray *)v64;

          v72->_isFromMe = objc_msgSend(v74, "isFromMe");
          objc_msgSend(v74, "sender");
          v66 = objc_claimAutoreleasedReturnValue();
          sender = v72->_sender;
          v72->_sender = (NSString *)v66;

          v72->_isPlayed = objc_msgSend(v74, "isPlayed");
          objc_msgSend(v21, "allObjects");
          v68 = objc_claimAutoreleasedReturnValue();
          fileTransferGUIDs = v72->_fileTransferGUIDs;
          v72->_fileTransferGUIDs = (NSArray *)v68;

          v7 = v73;
          break;
        }
        goto LABEL_25;
      }
    }
  }

  return v8;
}

- (void)addAttachmentsFromFileTransferGUIDs:(id)a3
{
  id v4;
  __CFArray *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (__CFArray *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v10);
          +[IMFileTransferCenter sharedInstance](IMFileTransferCenter, "sharedInstance", (_QWORD)v16);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "transferForGUID:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v5)
          {
            objc_msgSend(v13, "localURL");
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            if (v14)
            {
              objc_msgSend(v13, "localURL");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              CFArrayAppendValue(v5, v15);

            }
          }

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v8);
    }

    -[IMPluginPayload setAttachments:](self, "setAttachments:", v5);
    -[IMPluginPayload setFileTransferGUIDs:](self, "setFileTransferGUIDs:", v6);

  }
}

- (BOOL)isEqualAttachmentFileURLsToPluginPayload:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[IMPluginPayload attachments](self, "attachments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "__imSetFromArray");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "attachments");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "__imSetFromArray");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v7) = objc_msgSend(v6, "isEqualToSet:", v8);
  return (char)v7;
}

- (void)acceptPurgedTransfers
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = self->_fileTransferGUIDs;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v6);
        +[IMFileTransferCenter sharedInstance](IMFileTransferCenter, "sharedInstance", (_QWORD)v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "acceptTransfer:", v7);

        ++v6;
      }
      while (v4 != v6);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

- (void)addAttachmentsFromFilePaths:(id)a3
{
  id v4;
  __CFArray *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (__CFArray *)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v11;
          if (v5 && v11)
            CFArrayAppendValue(v5, v11);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

    -[IMPluginPayload setAttachments:](self, "setAttachments:", v5);
  }

}

- (void)setData:(id)a3
{
  NSData *v4;
  NSData *data;

  objc_msgSend(a3, "_FTOptionallyDecompressData");
  v4 = (NSData *)objc_claimAutoreleasedReturnValue();
  data = self->_data;
  self->_data = v4;

}

- (NSString)pluginSessionGUID
{
  NSString *pluginSessionGUID;

  pluginSessionGUID = self->_pluginSessionGUID;
  if (!pluginSessionGUID)
    pluginSessionGUID = self->_messageGUID;
  return pluginSessionGUID;
}

- (BOOL)shouldHideAttachments
{
  void *v2;
  BOOL v3;

  -[IMPluginPayload data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (BOOL)supportsCollaboration
{
  return self->_payloadCollaborationType != 0;
}

- (BOOL)supportsSendLater
{
  return 0;
}

- (CKContainerSetupInfo)containerSetupInfo
{
  void *v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[_SWCollaborationMetadata containerSetupInfo](self->_collaborationMetadata, "containerSetupInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (CKContainerSetupInfo *)v3;
}

- (BOOL)isEqualToPluginPayload:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  void *v43;
  int v44;
  int v45;
  int v46;
  void *v47;
  void *v48;
  int v49;
  int v50;
  int v51;
  int64_t v52;
  int v53;
  void *v54;
  void *v55;
  int v56;
  void *v57;
  void *v58;
  int v59;
  void *v60;
  void *v61;
  int v62;
  void *v63;
  void *v64;
  int v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  int v70;
  void *v71;
  void *v72;
  int v73;
  void *v74;
  void *v75;
  int v76;
  void *v77;
  void *v78;
  int v79;
  void *v80;
  void *v81;
  id v82;
  id v83;
  void *v84;
  char v85;
  void *v86;
  void *v87;
  int v88;
  void *v89;
  void *v90;
  int v91;
  int v92;
  _BOOL4 v93;
  int v94;

  v4 = a3;
  -[IMPluginPayload text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = sub_1A2041C30(v5, v6);

  if (!v7)
    goto LABEL_42;
  -[IMPluginPayload data](self, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "data");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = sub_1A2041C9C(v8, v9);

  if (!v10)
    goto LABEL_42;
  -[IMPluginPayload generativePlaygroundRecipeData](self, "generativePlaygroundRecipeData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "generativePlaygroundRecipeData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = sub_1A2041C9C(v11, v12);

  if (!v13)
    goto LABEL_42;
  -[IMPluginPayload breadcrumbText](self, "breadcrumbText");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "breadcrumbText");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = sub_1A2041D08(v14, v15);

  if (!v16)
    goto LABEL_42;
  -[IMPluginPayload statusText](self, "statusText");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "statusText");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = sub_1A2041D08(v17, v18);

  if (!v19)
    goto LABEL_42;
  v20 = -[IMPluginPayload isUpdate](self, "isUpdate");
  if (v20 != objc_msgSend(v4, "isUpdate"))
    goto LABEL_42;
  -[IMPluginPayload url](self, "url");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "url");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = sub_1A2041C9C(v21, v22);

  if (!v23)
    goto LABEL_42;
  -[IMPluginPayload userInfo](self, "userInfo");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = sub_1A2041D74(v24, v25);

  if (!v26)
    goto LABEL_42;
  -[IMPluginPayload messageGUID](self, "messageGUID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageGUID");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = sub_1A2041D08(v27, v28);

  if (!v29)
    goto LABEL_42;
  -[IMPluginPayload associatedMessageGUID](self, "associatedMessageGUID");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "associatedMessageGUID");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = sub_1A2041D08(v30, v31);

  if (!v32)
    goto LABEL_42;
  -[IMPluginPayload pluginSessionGUID](self, "pluginSessionGUID");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pluginSessionGUID");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = sub_1A2041D08(v33, v34);

  if (!v35)
    goto LABEL_42;
  -[IMPluginPayload pluginBundleID](self, "pluginBundleID");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pluginBundleID");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = sub_1A2041D08(v36, v37);

  if (!v38)
    goto LABEL_42;
  -[IMPluginPayload attachments](self, "attachments");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attachments");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = sub_1A2041DE0(v39, v40);

  if (!v41)
    goto LABEL_42;
  -[IMPluginPayload fileTransferGUIDs](self, "fileTransferGUIDs");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileTransferGUIDs");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = sub_1A2041DE0(v42, v43);

  if (!v44)
    goto LABEL_42;
  v45 = -[IMPluginPayload isSticker](self, "isSticker");
  if (v45 != objc_msgSend(v4, "isSticker"))
    goto LABEL_42;
  v46 = -[IMPluginPayload shouldExpire](self, "shouldExpire");
  if (v46 != objc_msgSend(v4, "shouldExpire"))
    goto LABEL_42;
  -[IMPluginPayload sender](self, "sender");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sender");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = sub_1A2041D08(v47, v48);

  if (!v49)
    goto LABEL_42;
  v50 = -[IMPluginPayload isFromMe](self, "isFromMe");
  if (v50 != objc_msgSend(v4, "isFromMe"))
    goto LABEL_42;
  v51 = -[IMPluginPayload isPlayed](self, "isPlayed");
  if (v51 != objc_msgSend(v4, "isPlayed"))
    goto LABEL_42;
  v52 = -[IMPluginPayload payloadCollaborationType](self, "payloadCollaborationType");
  if (v52 != objc_msgSend(v4, "payloadCollaborationType"))
    goto LABEL_42;
  v53 = -[IMPluginPayload sendAsCopy](self, "sendAsCopy");
  if (v53 != objc_msgSend(v4, "sendAsCopy"))
    goto LABEL_42;
  -[IMPluginPayload sendAsCopyURL](self, "sendAsCopyURL");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendAsCopyURL");
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  if (v54 != v55)
    goto LABEL_42;
  v56 = -[IMPluginPayload skipConfigurePlugin](self, "skipConfigurePlugin");
  if (v56 != objc_msgSend(v4, "skipConfigurePlugin"))
    goto LABEL_42;
  -[IMPluginPayload cloudKitShare](self, "cloudKitShare");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cloudKitShare");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = sub_1A2041C9C(v57, v58);

  if (!v59)
    goto LABEL_42;
  -[IMPluginPayload containerSetupInfo](self, "containerSetupInfo");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containerSetupInfo");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = sub_1A2041C9C(v60, v61);

  if (!v62)
    goto LABEL_42;
  -[IMPluginPayload collaborationMetadata](self, "collaborationMetadata");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collaborationMetadata");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = sub_1A2041C9C(v63, v64);

  if (!v65)
    goto LABEL_42;
  -[IMPluginPayload collaborationMetadata](self, "collaborationMetadata");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "userSelectedShareOptions");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collaborationMetadata");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "userSelectedShareOptions");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = sub_1A2041C9C(v67, v69);

  if (!v70)
    goto LABEL_42;
  -[IMPluginPayload collaborationOptionsSummary](self, "collaborationOptionsSummary");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collaborationOptionsSummary");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = sub_1A2041D08(v71, v72);

  if (!v73)
    goto LABEL_42;
  -[IMPluginPayload groupActivity](self, "groupActivity");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "groupActivity");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = sub_1A2041C9C(v74, v75);

  if (!v76)
    goto LABEL_42;
  -[IMPluginPayload time](self, "time");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "time");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = sub_1A2041C9C(v77, v78);

  if (!v79)
    goto LABEL_42;
  -[IMPluginPayload consumedSessionPayloads](self, "consumedSessionPayloads");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "consumedSessionPayloads");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = v80;
  v83 = v81;
  if (v82 == v83)
  {

  }
  else
  {
    v84 = v83;
    if (!v82 || !v83)
    {

LABEL_42:
      LOBYTE(v94) = 0;
      goto LABEL_43;
    }
    v85 = objc_msgSend(v82, "isEqualToArray:", v83);

    if ((v85 & 1) == 0)
      goto LABEL_42;
  }
  -[IMPluginPayload threadIdentifier](self, "threadIdentifier");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "threadIdentifier");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = sub_1A2041C9C(v86, v87);

  if (!v88)
    goto LABEL_42;
  -[IMPluginPayload dataDetectedResult](self, "dataDetectedResult");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataDetectedResult");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = sub_1A2041C9C(v89, v90);

  if (!v91)
    goto LABEL_42;
  v92 = -[IMPluginPayload shouldHideAttachments](self, "shouldHideAttachments");
  if (v92 != objc_msgSend(v4, "shouldHideAttachments"))
    goto LABEL_42;
  v93 = -[IMPluginPayload supportsCollaboration](self, "supportsCollaboration");
  v94 = v93 ^ objc_msgSend(v4, "supportsCollaboration") ^ 1;
LABEL_43:

  return v94;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;

  -[IMPluginPayload pluginBundleID](self, "pluginBundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[IMPluginPayload data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") + v4;
  -[IMPluginPayload generativePlaygroundRecipeData](self, "generativePlaygroundRecipeData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[IMPluginPayload url](self, "url");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 + v8 + objc_msgSend(v9, "hash");
  -[IMPluginPayload messageGUID](self, "messageGUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10 + objc_msgSend(v11, "hash");

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  IMPluginPayload *v4;
  BOOL v5;

  v4 = (IMPluginPayload *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[IMPluginPayload isEqualToPluginPayload:](self, "isEqualToPluginPayload:", v4);
  }

  return v5;
}

- (id)payloadDictionary
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  id *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[10];

  v17[9] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E60];
  v17[0] = objc_opt_class();
  v17[1] = objc_opt_class();
  v17[2] = objc_opt_class();
  v17[3] = objc_opt_class();
  v17[4] = objc_opt_class();
  v17[5] = objc_opt_class();
  v17[6] = objc_opt_class();
  v17[7] = objc_opt_class();
  v17[8] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_opt_respondsToSelector();
  v7 = (void *)MEMORY[0x1E0CB3710];
  -[IMPluginPayload data](self, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 & 1) != 0)
  {
    v16 = 0;
    v9 = (id *)&v16;
    objc_msgSend(v7, "_strictlyUnarchivedObjectOfClasses:fromData:error:", v5, v8, &v16);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
    v9 = (id *)&v15;
    objc_msgSend(v7, "unarchivedObjectOfClasses:fromData:error:", v5, v8, &v15);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v10;
  v12 = *v9;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v11;
  else
    v13 = 0;

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
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
  id v21;

  v21 = a3;
  -[IMPluginPayload text](self, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v4, CFSTR("IMPLUGIN_TEXT_KEY"));

  -[IMPluginPayload data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v5, CFSTR("IMPLUGIN_DATA_KEY"));

  -[IMPluginPayload url](self, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v6, CFSTR("IMPLUGIN_URL_KEY"));

  -[IMPluginPayload breadcrumbText](self, "breadcrumbText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v7, CFSTR("IMPLUGIN_BREADCRUMBTEXT_KEY"));

  -[IMPluginPayload statusText](self, "statusText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v8, CFSTR("IMPLUGIN_STATUSTEXT_KEY"));

  objc_msgSend(v21, "encodeBool:forKey:", -[IMPluginPayload isUpdate](self, "isUpdate"), CFSTR("IMPLUGIN_UPDATE_KEY"));
  -[IMPluginPayload userInfo](self, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v9, CFSTR("IMPLUGIN_USERINFO_KEY"));

  -[IMPluginPayload messageGUID](self, "messageGUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v10, CFSTR("IMPLUGIN_MESSAGEGUID_KEY"));

  -[IMPluginPayload associatedMessageGUID](self, "associatedMessageGUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v11, CFSTR("IMPLUGIN_ASSOCIATEDMESSAGEGUID_KEY"));

  -[IMPluginPayload pluginSessionGUID](self, "pluginSessionGUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v12, CFSTR("IMPLUGIN_PLUGINSESSIONGUID_KEY"));

  -[IMPluginPayload pluginBundleID](self, "pluginBundleID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v13, CFSTR("IMPLUGIN_PLUGINBUNDLEID_KEY"));

  -[IMPluginPayload attachments](self, "attachments");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v14, CFSTR("IMPLUGIN_ATTACHMENTS_KEY"));

  -[IMPluginPayload fileTransferGUIDs](self, "fileTransferGUIDs");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v15, CFSTR("IMPLUGIN_TRANSFERGUIDS_KEY"));

  objc_msgSend(v21, "encodeBool:forKey:", -[IMPluginPayload shouldExpire](self, "shouldExpire"), CFSTR("IMPLUGIN_SHOULD_EXPIRE_KEY"));
  objc_msgSend(v21, "encodeBool:forKey:", -[IMPluginPayload isSticker](self, "isSticker"), CFSTR("IMPLUGIN_IS_STICKER_KEY"));
  objc_msgSend(v21, "encodeBool:forKey:", -[IMPluginPayload isFromMe](self, "isFromMe"), CFSTR("IMPLUGIN_IS_FROM_ME"));
  -[IMPluginPayload sender](self, "sender");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v16, CFSTR("IMPLUGIN_SENDER"));

  -[IMPluginPayload cloudKitShare](self, "cloudKitShare");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v17, CFSTR("IMPLUGIN_CKSHARE"));

  objc_msgSend(v21, "encodeBool:forKey:", -[IMPluginPayload isPlayed](self, "isPlayed"), CFSTR("IMPLUGIN_IS_PLAYED"));
  objc_msgSend(v21, "encodeInteger:forKey:", -[IMPluginPayload payloadCollaborationType](self, "payloadCollaborationType"), CFSTR("IMPLUGIN_COLLABORATION_TYPE"));
  -[IMPluginPayload collaborationMetadata](self, "collaborationMetadata");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v18, CFSTR("IMPLUGIN_PLUGIN_COLLABORATIONMETADATA_KEY"));

  -[IMPluginPayload collaborationOptionsSummary](self, "collaborationOptionsSummary");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v19, CFSTR("IMPLUGIN_PLUGIN_COLLABORATIONOPTIONSSUMMARY_KEY"));

  objc_msgSend(v21, "encodeBool:forKey:", -[IMPluginPayload skipConfigurePlugin](self, "skipConfigurePlugin"), CFSTR("IMPLUGIN_SKIPCONFIGURATION_KEY"));
  -[IMPluginPayload sendAsCopyURL](self, "sendAsCopyURL");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v20, CFSTR("IMPLUGIN_SENDASCOPYURL_KEY"));

  objc_msgSend(v21, "encodeBool:forKey:", -[IMPluginPayload sendAsCopy](self, "sendAsCopy"), CFSTR("IMPLUGIN_SENDASCOPY_KEY"));
}

- (IMPluginPayload)initWithCoder:(id)a3
{
  return (IMPluginPayload *)MEMORY[0x1E0DE7D20](self, sel_initWithCoder_additionalAllowedClasses_);
}

- (IMPluginPayload)initWithCoder:(id)a3 additionalAllowedClasses:(id)a4
{
  id v6;
  id v7;
  IMPluginPayload *v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
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
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v37;
  objc_super v38;

  v6 = a3;
  v7 = a4;
  v38.receiver = self;
  v38.super_class = (Class)IMPluginPayload;
  v8 = -[IMPluginPayload init](&v38, sel_init);
  if (v8)
  {
    v9 = objc_alloc(MEMORY[0x1E0C99E20]);
    v10 = objc_opt_class();
    v11 = v7;
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    v37 = v12;
    v7 = v11;
    v17 = (void *)objc_msgSend(v9, "initWithObjects:", v10, v37, v13, v14, v15, v16, objc_opt_class(), 0);
    v18 = v17;
    if (v11)
      objc_msgSend(v17, "unionSet:", v11);
    objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("IMPLUGIN_TEXT_KEY"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMPluginPayload setText:](v8, "setText:", v19);

    objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("IMPLUGIN_DATA_KEY"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMPluginPayload setData:](v8, "setData:", v20);

    objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("IMPLUGIN_GENERATIVE_PLAYGROUND_RECIPE_DATA_KEY"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMPluginPayload setGenerativePlaygroundRecipeData:](v8, "setGenerativePlaygroundRecipeData:", v21);

    objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("IMPLUGIN_URL_KEY"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMPluginPayload setUrl:](v8, "setUrl:", v22);

    objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("IMPLUGIN_BREADCRUMBTEXT_KEY"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMPluginPayload setBreadcrumbText:](v8, "setBreadcrumbText:", v23);

    objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("IMPLUGIN_STATUSTEXT_KEY"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMPluginPayload setStatusText:](v8, "setStatusText:", v24);

    -[IMPluginPayload setUpdate:](v8, "setUpdate:", objc_msgSend(v6, "decodeBoolForKey:", CFSTR("IMPLUGIN_UPDATE_KEY")));
    objc_msgSend(v6, "decodeObjectOfClasses:forKey:", v18, CFSTR("IMPLUGIN_USERINFO_KEY"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMPluginPayload setUserInfo:](v8, "setUserInfo:", v25);

    objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("IMPLUGIN_MESSAGEGUID_KEY"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMPluginPayload setMessageGUID:](v8, "setMessageGUID:", v26);

    objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("IMPLUGIN_ASSOCIATEDMESSAGEGUID_KEY"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMPluginPayload setAssociatedMessageGUID:](v8, "setAssociatedMessageGUID:", v27);

    objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("IMPLUGIN_PLUGINSESSIONGUID_KEY"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMPluginPayload setPluginSessionGUID:](v8, "setPluginSessionGUID:", v28);

    objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("IMPLUGIN_PLUGINBUNDLEID_KEY"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMPluginPayload setPluginBundleID:](v8, "setPluginBundleID:", v29);

    objc_msgSend(v6, "decodeObjectOfClasses:forKey:", v18, CFSTR("IMPLUGIN_ATTACHMENTS_KEY"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMPluginPayload setAttachments:](v8, "setAttachments:", v30);

    objc_msgSend(v6, "decodeObjectOfClasses:forKey:", v18, CFSTR("IMPLUGIN_TRANSFERGUIDS_KEY"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMPluginPayload setFileTransferGUIDs:](v8, "setFileTransferGUIDs:", v31);

    -[IMPluginPayload setSticker:](v8, "setSticker:", objc_msgSend(v6, "decodeBoolForKey:", CFSTR("IMPLUGIN_IS_STICKER_KEY")));
    -[IMPluginPayload setShouldExpire:](v8, "setShouldExpire:", objc_msgSend(v6, "decodeBoolForKey:", CFSTR("IMPLUGIN_SHOULD_EXPIRE_KEY")));
    -[IMPluginPayload setIsFromMe:](v8, "setIsFromMe:", objc_msgSend(v6, "decodeBoolForKey:", CFSTR("IMPLUGIN_IS_FROM_ME")));
    objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("IMPLUGIN_SENDER"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMPluginPayload setSender:](v8, "setSender:", v32);

    -[IMPluginPayload setIsPlayed:](v8, "setIsPlayed:", objc_msgSend(v6, "decodeBoolForKey:", CFSTR("IMPLUGIN_IS_PLAYED")));
    -[IMPluginPayload setPayloadCollaborationType:](v8, "setPayloadCollaborationType:", objc_msgSend(v6, "decodeIntegerForKey:", CFSTR("IMPLUGIN_COLLABORATION_TYPE")));
    objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("IMPLUGIN_PLUGIN_COLLABORATIONMETADATA_KEY"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMPluginPayload setCollaborationMetadata:](v8, "setCollaborationMetadata:", v33);

    objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("IMPLUGIN_PLUGIN_COLLABORATIONOPTIONSSUMMARY_KEY"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMPluginPayload setCollaborationOptionsSummary:](v8, "setCollaborationOptionsSummary:", v34);

    -[IMPluginPayload setSkipConfigurePlugin:](v8, "setSkipConfigurePlugin:", objc_msgSend(v6, "decodeBoolForKey:", CFSTR("IMPLUGIN_SKIPCONFIGURATION_KEY")));
    objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("IMPLUGIN_SENDASCOPYURL_KEY"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMPluginPayload setSendAsCopyURL:](v8, "setSendAsCopyURL:", v35);

    -[IMPluginPayload setSendAsCopy:](v8, "setSendAsCopy:", objc_msgSend(v6, "decodeBoolForKey:", CFSTR("IMPLUGIN_SENDASCOPY_KEY")));
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
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
  void *v22;
  void *v23;
  void *v24;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[IMPluginPayload text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v5);

  -[IMPluginPayload data](self, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setData:", v6);

  -[IMPluginPayload generativePlaygroundRecipeData](self, "generativePlaygroundRecipeData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGenerativePlaygroundRecipeData:", v7);

  -[IMPluginPayload url](self, "url");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUrl:", v8);

  -[IMPluginPayload breadcrumbText](self, "breadcrumbText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBreadcrumbText:", v9);

  -[IMPluginPayload statusText](self, "statusText");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStatusText:", v10);

  objc_msgSend(v4, "setUpdate:", -[IMPluginPayload isUpdate](self, "isUpdate"));
  -[IMPluginPayload userInfo](self, "userInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserInfo:", v11);

  -[IMPluginPayload messageGUID](self, "messageGUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMessageGUID:", v12);

  -[IMPluginPayload associatedMessageGUID](self, "associatedMessageGUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAssociatedMessageGUID:", v13);

  -[IMPluginPayload pluginSessionGUID](self, "pluginSessionGUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPluginSessionGUID:", v14);

  -[IMPluginPayload pluginBundleID](self, "pluginBundleID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPluginBundleID:", v15);

  -[IMPluginPayload attachments](self, "attachments");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAttachments:", v16);

  -[IMPluginPayload fileTransferGUIDs](self, "fileTransferGUIDs");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFileTransferGUIDs:", v17);

  objc_msgSend(v4, "setShouldExpire:", -[IMPluginPayload shouldExpire](self, "shouldExpire"));
  objc_msgSend(v4, "setSticker:", -[IMPluginPayload isSticker](self, "isSticker"));
  objc_msgSend(v4, "setIsFromMe:", -[IMPluginPayload isFromMe](self, "isFromMe"));
  -[IMPluginPayload sender](self, "sender");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSender:", v18);

  objc_msgSend(v4, "setIsPlayed:", -[IMPluginPayload isPlayed](self, "isPlayed"));
  -[IMPluginPayload datasource](self, "datasource");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDatasource:", v19);

  objc_msgSend(v4, "setPayloadCollaborationType:", -[IMPluginPayload payloadCollaborationType](self, "payloadCollaborationType"));
  objc_msgSend(v4, "setSendAsCopy:", -[IMPluginPayload sendAsCopy](self, "sendAsCopy"));
  objc_msgSend(v4, "setSkipConfigurePlugin:", -[IMPluginPayload skipConfigurePlugin](self, "skipConfigurePlugin"));
  -[IMPluginPayload cloudKitShare](self, "cloudKitShare");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCloudKitShare:", v20);

  -[IMPluginPayload groupActivity](self, "groupActivity");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGroupActivity:", v21);

  -[IMPluginPayload collaborationMetadata](self, "collaborationMetadata");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCollaborationMetadata:", v22);

  -[IMPluginPayload collaborationOptionsSummary](self, "collaborationOptionsSummary");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCollaborationOptionsSummary:", v23);

  -[IMPluginPayload sendAsCopyURL](self, "sendAsCopyURL");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSendAsCopyURL:", v24);

  return v4;
}

- (TUConversationActivity)groupActivity
{
  return self->groupActivity;
}

- (void)setGroupActivity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSAttributedString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_storeStrong((id *)&self->_text, a3);
}

- (NSData)data
{
  return self->_data;
}

- (NSData)generativePlaygroundRecipeData
{
  return self->_generativePlaygroundRecipeData;
}

- (void)setGenerativePlaygroundRecipeData:(id)a3
{
  objc_storeStrong((id *)&self->_generativePlaygroundRecipeData, a3);
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (NSString)breadcrumbText
{
  return self->_breadcrumbText;
}

- (void)setBreadcrumbText:(id)a3
{
  objc_storeStrong((id *)&self->_breadcrumbText, a3);
}

- (NSString)statusText
{
  return self->_statusText;
}

- (void)setStatusText:(id)a3
{
  objc_storeStrong((id *)&self->_statusText, a3);
}

- (BOOL)isUpdate
{
  return self->_update;
}

- (void)setUpdate:(BOOL)a3
{
  self->_update = a3;
}

- (BOOL)isSticker
{
  return self->_sticker;
}

- (void)setSticker:(BOOL)a3
{
  self->_sticker = a3;
}

- (BOOL)shouldExpire
{
  return self->_shouldExpire;
}

- (void)setShouldExpire:(BOOL)a3
{
  self->_shouldExpire = a3;
}

- (int64_t)payloadCollaborationType
{
  return self->_payloadCollaborationType;
}

- (void)setPayloadCollaborationType:(int64_t)a3
{
  self->_payloadCollaborationType = a3;
}

- (BOOL)sendAsCopy
{
  return self->_sendAsCopy;
}

- (void)setSendAsCopy:(BOOL)a3
{
  self->_sendAsCopy = a3;
}

- (BOOL)skipConfigurePlugin
{
  return self->_skipConfigurePlugin;
}

- (void)setSkipConfigurePlugin:(BOOL)a3
{
  self->_skipConfigurePlugin = a3;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userInfo, a3);
}

- (NSString)messageGUID
{
  return self->_messageGUID;
}

- (void)setMessageGUID:(id)a3
{
  objc_storeStrong((id *)&self->_messageGUID, a3);
}

- (NSDate)time
{
  return self->_time;
}

- (void)setTime:(id)a3
{
  objc_storeStrong((id *)&self->_time, a3);
}

- (NSString)associatedMessageGUID
{
  return self->_associatedMessageGUID;
}

- (void)setAssociatedMessageGUID:(id)a3
{
  objc_storeStrong((id *)&self->_associatedMessageGUID, a3);
}

- (void)setPluginSessionGUID:(id)a3
{
  objc_storeStrong((id *)&self->_pluginSessionGUID, a3);
}

- (NSString)pluginBundleID
{
  return self->_pluginBundleID;
}

- (void)setPluginBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_pluginBundleID, a3);
}

- (NSArray)consumedSessionPayloads
{
  return self->_consumedSessionPayloads;
}

- (void)setConsumedSessionPayloads:(id)a3
{
  objc_storeStrong((id *)&self->_consumedSessionPayloads, a3);
}

- (BOOL)isPlayed
{
  return self->_isPlayed;
}

- (void)setIsPlayed:(BOOL)a3
{
  self->_isPlayed = a3;
}

- (NSString)threadIdentifier
{
  return self->_threadIdentifier;
}

- (NSArray)fileTransferGUIDs
{
  return self->_fileTransferGUIDs;
}

- (void)setFileTransferGUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_fileTransferGUIDs, a3);
}

- (DDScannerResult)dataDetectedResult
{
  return self->_dataDetectedResult;
}

- (void)setDataDetectedResult:(id)a3
{
  objc_storeStrong((id *)&self->_dataDetectedResult, a3);
}

- (NSArray)attachments
{
  return self->_attachments;
}

- (void)setAttachments:(id)a3
{
  objc_storeStrong((id *)&self->_attachments, a3);
}

- (IMBalloonPluginDataSource)datasource
{
  return (IMBalloonPluginDataSource *)objc_loadWeakRetained((id *)&self->_datasource);
}

- (void)setDatasource:(id)a3
{
  objc_storeWeak((id *)&self->_datasource, a3);
}

- (BOOL)isFromMe
{
  return self->_isFromMe;
}

- (void)setIsFromMe:(BOOL)a3
{
  self->_isFromMe = a3;
}

- (_SWCollaborationMetadata)collaborationMetadata
{
  return self->_collaborationMetadata;
}

- (void)setCollaborationMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_collaborationMetadata, a3);
}

- (NSString)collaborationOptionsSummary
{
  return self->_collaborationOptionsSummary;
}

- (void)setCollaborationOptionsSummary:(id)a3
{
  objc_storeStrong((id *)&self->_collaborationOptionsSummary, a3);
}

- (NSURL)sendAsCopyURL
{
  return self->_sendAsCopyURL;
}

- (void)setSendAsCopyURL:(id)a3
{
  objc_storeStrong((id *)&self->_sendAsCopyURL, a3);
}

- (NSString)sender
{
  return self->_sender;
}

- (void)setSender:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (CKShare)cloudKitShare
{
  return self->_cloudKitShare;
}

- (void)setCloudKitShare:(id)a3
{
  objc_storeStrong((id *)&self->_cloudKitShare, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudKitShare, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_sendAsCopyURL, 0);
  objc_storeStrong((id *)&self->_collaborationOptionsSummary, 0);
  objc_storeStrong((id *)&self->_collaborationMetadata, 0);
  objc_destroyWeak((id *)&self->_datasource);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_dataDetectedResult, 0);
  objc_storeStrong((id *)&self->_fileTransferGUIDs, 0);
  objc_storeStrong((id *)&self->_threadIdentifier, 0);
  objc_storeStrong((id *)&self->_consumedSessionPayloads, 0);
  objc_storeStrong((id *)&self->_pluginBundleID, 0);
  objc_storeStrong((id *)&self->_pluginSessionGUID, 0);
  objc_storeStrong((id *)&self->_associatedMessageGUID, 0);
  objc_storeStrong((id *)&self->_time, 0);
  objc_storeStrong((id *)&self->_messageGUID, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_statusText, 0);
  objc_storeStrong((id *)&self->_breadcrumbText, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_generativePlaygroundRecipeData, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->groupActivity, 0);
}

@end
