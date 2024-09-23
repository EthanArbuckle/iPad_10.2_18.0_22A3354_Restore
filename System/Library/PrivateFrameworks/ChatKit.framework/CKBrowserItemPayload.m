@implementation CKBrowserItemPayload

+ (id)browserItemPayloadFromIMPluginPayload:(id)a3
{
  id v3;
  CKBrowserItemPayload *v4;
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

  v3 = a3;
  v4 = objc_alloc_init(CKBrowserItemPayload);
  if (v4)
  {
    objc_msgSend(v3, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBrowserItemPayload setText:](v4, "setText:", v5);

    objc_msgSend(v3, "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBrowserItemPayload setData:](v4, "setData:", v6);

    objc_msgSend(v3, "url");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBrowserItemPayload setUrl:](v4, "setUrl:", v7);

    objc_msgSend(v3, "breadcrumbText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBrowserItemPayload setBreadcrumbText:](v4, "setBreadcrumbText:", v8);

    objc_msgSend(v3, "statusText");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBrowserItemPayload setStatusText:](v4, "setStatusText:", v9);

    -[CKBrowserItemPayload setUpdate:](v4, "setUpdate:", objc_msgSend(v3, "isUpdate"));
    -[CKBrowserItemPayload setSticker:](v4, "setSticker:", objc_msgSend(v3, "isSticker"));
    -[CKBrowserItemPayload setShouldExpire:](v4, "setShouldExpire:", objc_msgSend(v3, "shouldExpire"));
    objc_msgSend(v3, "consumedSessionPayloads");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBrowserItemPayload setConsumedSessionPayloads:](v4, "setConsumedSessionPayloads:", v10);

    objc_msgSend(v3, "messageGUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBrowserItemPayload setMessageGUID:](v4, "setMessageGUID:", v11);

    objc_msgSend(v3, "associatedMessageGUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBrowserItemPayload setAssociatedMessageGUID:](v4, "setAssociatedMessageGUID:", v12);

    objc_msgSend(v3, "pluginSessionGUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBrowserItemPayload setPluginSessionGUID:](v4, "setPluginSessionGUID:", v13);

    objc_msgSend(v3, "pluginBundleID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBrowserItemPayload setPluginBundleID:](v4, "setPluginBundleID:", v14);

    objc_msgSend(v3, "dataDetectedResult");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBrowserItemPayload setDataDetectedResult:](v4, "setDataDetectedResult:", v15);

    objc_msgSend(v3, "attachments");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBrowserItemPayload setAttachments:](v4, "setAttachments:", v16);

    objc_msgSend(v3, "datasource");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBrowserItemPayload setDatasource:](v4, "setDatasource:", v17);

    -[CKBrowserItemPayload setIsFromMe:](v4, "setIsFromMe:", objc_msgSend(v3, "isFromMe"));
    -[CKBrowserItemPayload setIsPlayed:](v4, "setIsPlayed:", objc_msgSend(v3, "isPlayed"));
    objc_msgSend(v3, "sender");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBrowserItemPayload setSender:](v4, "setSender:", v18);

    -[CKBrowserItemPayload setSendAsCopy:](v4, "setSendAsCopy:", objc_msgSend(v3, "sendAsCopy"));
  }

  return v4;
}

+ (id)createBrowserItemPayloadWithURL:(id)a3 data:(id)a4
{
  id v5;
  id v6;
  CKBrowserItemPayload *v7;
  id v8;
  id v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(CKBrowserItemPayload);
  if (v7)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0CC11A8]);
    objc_msgSend(v8, "setURL:", v5);
    v9 = objc_alloc_init(MEMORY[0x1E0CC11D8]);
    objc_msgSend(v9, "setMetadata:", v8);
    if (v6)
    {
      -[CKBrowserItemPayload setData:](v7, "setData:", v6);
    }
    else
    {
      objc_msgSend(v9, "dataRepresentationWithOutOfLineAttachments:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKBrowserItemPayload setData:](v7, "setData:", v10);

    }
    -[CKBrowserItemPayload setUrl:](v7, "setUrl:", v5);
    -[CKBrowserItemPayload setPluginBundleID:](v7, "setPluginBundleID:", *MEMORY[0x1E0D375F8]);

  }
  return v7;
}

+ (id)createBrowserItemPayloadWithRichLinkMetadata:(id)a3
{
  id v3;
  CKBrowserItemPayload *v4;
  id v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = objc_alloc_init(CKBrowserItemPayload);
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0CC11D8]);
    objc_msgSend(v5, "setMetadata:", v3);
    objc_msgSend(v5, "dataRepresentationWithOutOfLineAttachments:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBrowserItemPayload setData:](v4, "setData:", v6);

    objc_msgSend(v3, "URL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBrowserItemPayload setUrl:](v4, "setUrl:", v7);

    -[CKBrowserItemPayload setPluginBundleID:](v4, "setPluginBundleID:", *MEMORY[0x1E0D375F8]);
  }

  return v4;
}

+ (id)browserItemPayloadForCollaborationWithURL:(id)a3 collaborationType:(int64_t)a4
{
  id v5;
  CKBrowserItemPayload *v6;
  void *v7;

  v5 = a3;
  v6 = objc_alloc_init(CKBrowserItemPayload);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBrowserItemPayload setMessageGUID:](v6, "setMessageGUID:", v7);

  -[CKBrowserItemPayload setPluginBundleID:](v6, "setPluginBundleID:", *MEMORY[0x1E0D375F8]);
  -[CKBrowserItemPayload setPayloadCollaborationType:](v6, "setPayloadCollaborationType:", a4);
  -[CKBrowserItemPayload setUrl:](v6, "setUrl:", v5);

  return v6;
}

- (BOOL)isEqualToPluginPayload:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  BOOL v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CKBrowserItemPayload;
  if (!-[CKBrowserItemPayload isEqualToPluginPayload:](&v22, sel_isEqualToPluginPayload_, v4))
    goto LABEL_9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[CKBrowserItemPayload videoComplementFileURL](self, "videoComplementFileURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "videoComplementFileURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = CKIsEqual(v6, v7);

    if (!v8)
      goto LABEL_8;
    -[CKBrowserItemPayload fileURL](self, "fileURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fileURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = CKIsEqual(v9, v10);

    if (!v11)
      goto LABEL_8;
    -[CKBrowserItemPayload mediaObject](self, "mediaObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "transferGUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mediaObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "transferGUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = CKIsEqual(v13, v15);

    if (v16)
    {
      -[CKBrowserItemPayload photoShelfViewController](self, "photoShelfViewController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "photoShelfViewController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = CKIsEqual(v17, v18);

      if (v19)
        goto LABEL_7;
    }
    else
    {
LABEL_8:

    }
LABEL_9:
    v20 = 0;
    goto LABEL_10;
  }
LABEL_7:
  v20 = 1;
LABEL_10:

  return v20;
}

- (CKBrowserItemPayload)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  CKBrowserItemPayload *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19.receiver = self;
  v19.super_class = (Class)CKBrowserItemPayload;
  v8 = -[CKBrowserItemPayload initWithCoder:additionalAllowedClasses:](&v19, sel_initWithCoder_additionalAllowedClasses_, v4, v7);

  if (v8)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CKBROWSERITEM_VIDEOCOMPLEMENFILETURL_KEY"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBrowserItemPayload setVideoComplementFileURL:](v8, "setVideoComplementFileURL:", v9);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CKBROWSERITEM_FILEURL_KEY"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBrowserItemPayload setFileURL:](v8, "setFileURL:", v10);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CKBROWSERITEM_FILENAME_KEY"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBrowserItemPayload setFilename:](v8, "setFilename:", v11);

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0C99E60];
    v14 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeDictionaryWithKeysOfClasses:objectsOfClasses:forKey:", v12, v15, CFSTR("CKPLUGIN_ATTRIBUTIONINFO"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBrowserItemPayload setAttributionInfo:](v8, "setAttributionInfo:", v16);

    -[CKBrowserItemPayload setRequiresValidation:](v8, "setRequiresValidation:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("CKBROWSERITEM_REQUIRESVALIDATION_KEY")));
    -[CKBrowserItemPayload setUseDirectSend:](v8, "setUseDirectSend:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("CKBROWSERITEM_USEDIRECTSEND_KEY")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CKBROWSERITEM_MEDIAOBJECT_KEY"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBrowserItemPayload setMediaObject:](v8, "setMediaObject:", v17);

  }
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CKBrowserItemPayload;
  -[CKBrowserItemPayload encodeWithCoder:](&v10, sel_encodeWithCoder_, v4);
  -[CKBrowserItemPayload videoComplementFileURL](self, "videoComplementFileURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("CKBROWSERITEM_VIDEOCOMPLEMENFILETURL_KEY"));

  -[CKBrowserItemPayload fileURL](self, "fileURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("CKBROWSERITEM_FILEURL_KEY"));

  -[CKBrowserItemPayload filename](self, "filename");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("CKBROWSERITEM_FILENAME_KEY"));

  -[CKBrowserItemPayload attributionInfo](self, "attributionInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("CKPLUGIN_ATTRIBUTIONINFO"));

  objc_msgSend(v4, "encodeBool:forKey:", -[CKBrowserItemPayload requiresValidation](self, "requiresValidation"), CFSTR("CKBROWSERITEM_REQUIRESVALIDATION_KEY"));
  objc_msgSend(v4, "encodeBool:forKey:", -[CKBrowserItemPayload useDirectSend](self, "useDirectSend"), CFSTR("CKBROWSERITEM_USEDIRECTSEND_KEY"));
  -[CKBrowserItemPayload mediaObject](self, "mediaObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("CKBROWSERITEM_MEDIAOBJECT_KEY"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CKBrowserItemPayload;
  v4 = -[CKBrowserItemPayload copyWithZone:](&v12, sel_copyWithZone_, a3);
  if (v4)
  {
    -[CKBrowserItemPayload videoComplementFileURL](self, "videoComplementFileURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setVideoComplementFileURL:", v5);

    -[CKBrowserItemPayload fileURL](self, "fileURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFileURL:", v6);

    -[CKBrowserItemPayload filename](self, "filename");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFilename:", v7);

    -[CKBrowserItemPayload attributionInfo](self, "attributionInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAttributionInfo:", v8);

    -[CKBrowserItemPayload mediaObject](self, "mediaObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setMediaObject:", v9);

    -[CKBrowserItemPayload photoShelfViewController](self, "photoShelfViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPhotoShelfViewController:", v10);

    objc_msgSend(v4, "setRequiresValidation:", -[CKBrowserItemPayload requiresValidation](self, "requiresValidation"));
    objc_msgSend(v4, "setUseDirectSend:", -[CKBrowserItemPayload useDirectSend](self, "useDirectSend"));
  }
  return v4;
}

- (BOOL)requiresValidation
{
  return self->_requiresValidation;
}

- (void)setRequiresValidation:(BOOL)a3
{
  self->_requiresValidation = a3;
}

- (BOOL)useDirectSend
{
  return self->_useDirectSend;
}

- (void)setUseDirectSend:(BOOL)a3
{
  self->_useDirectSend = a3;
}

- (NSURL)videoComplementFileURL
{
  return self->_videoComplementFileURL;
}

- (void)setVideoComplementFileURL:(id)a3
{
  objc_storeStrong((id *)&self->_videoComplementFileURL, a3);
}

- (CKPluginEntryViewController)photoShelfViewController
{
  return self->_photoShelfViewController;
}

- (void)setPhotoShelfViewController:(id)a3
{
  objc_storeStrong((id *)&self->_photoShelfViewController, a3);
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setFileURL:(id)a3
{
  objc_storeStrong((id *)&self->_fileURL, a3);
}

- (NSString)filename
{
  return self->_filename;
}

- (void)setFilename:(id)a3
{
  objc_storeStrong((id *)&self->_filename, a3);
}

- (NSDictionary)attributionInfo
{
  return self->_attributionInfo;
}

- (void)setAttributionInfo:(id)a3
{
  objc_storeStrong((id *)&self->_attributionInfo, a3);
}

- (CKMediaObject)mediaObject
{
  return self->_mediaObject;
}

- (void)setMediaObject:(id)a3
{
  objc_storeStrong((id *)&self->_mediaObject, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaObject, 0);
  objc_storeStrong((id *)&self->_attributionInfo, 0);
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_photoShelfViewController, 0);
  objc_storeStrong((id *)&self->_videoComplementFileURL, 0);
}

- (BOOL)supportsSendLater
{
  void *v3;
  void *v5;
  objc_super v6;

  -[CKBrowserItemPayload photoShelfViewController](self, "photoShelfViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    || -[CKBrowserItemPayload shouldSendAsMediaObject](self, "shouldSendAsMediaObject")
    || -[CKBrowserItemPayload shouldSendAsText](self, "shouldSendAsText")
    || -[CKBrowserItemPayload shouldSendAsMediaObject](self, "shouldSendAsMediaObject")
    || -[CKBrowserItemPayload shouldSendAsRichLink](self, "shouldSendAsRichLink"))
  {

  }
  else
  {
    -[CKBrowserItemPayload __ck_urlFromTextBodyForRichLink](self, "__ck_urlFromTextBodyForRichLink");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v6.receiver = self;
      v6.super_class = (Class)CKBrowserItemPayload;
      return -[CKBrowserItemPayload supportsSendLater](&v6, sel_supportsSendLater);
    }
  }
  return 1;
}

- (BOOL)shouldSendAsMediaObject
{
  void *v2;
  void *v3;
  BOOL v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  void *v11;
  uint64_t v12;

  if ((-[CKBrowserItemPayload supportsCollaboration](self, "supportsCollaboration") & 1) == 0)
  {
    if ((-[CKBrowserItemPayload isSticker](self, "isSticker") & 1) != 0)
      return 1;
    -[CKBrowserItemPayload attachments](self, "attachments");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");
    if (v7)
    {
      v8 = 0;
    }
    else
    {
      -[CKBrowserItemPayload fileURL](self, "fileURL");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      if (v2)
      {
        v8 = 0;
      }
      else
      {
        -[CKBrowserItemPayload url](self, "url");
        v12 = objc_claimAutoreleasedReturnValue();
        if (!v12)
        {
          v5 = 0;
          goto LABEL_13;
        }
        v3 = (void *)v12;
        v8 = 1;
      }
    }
    -[CKBrowserItemPayload text](self, "text");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {

      v5 = 0;
      if (!v8)
        goto LABEL_12;
    }
    else
    {
      -[CKBrowserItemPayload data](self, "data");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v11 == 0;

      if ((v8 & 1) == 0)
      {
LABEL_12:
        if (v7)
        {
LABEL_14:

          return v5;
        }
LABEL_13:

        goto LABEL_14;
      }
    }

    goto LABEL_12;
  }
  return 0;
}

- (BOOL)shouldSendAsText
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[CKBrowserItemPayload text](self, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[CKBrowserItemPayload fileURL](self, "fileURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = 0;
    }
    else
    {
      -[CKBrowserItemPayload data](self, "data");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v5 = 0;
      }
      else
      {
        -[CKBrowserItemPayload url](self, "url");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          v5 = 0;
        }
        else
        {
          -[CKBrowserItemPayload breadcrumbText](self, "breadcrumbText");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (v8)
          {
            v5 = 0;
          }
          else
          {
            -[CKBrowserItemPayload statusText](self, "statusText");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            if (v9)
            {
              v5 = 0;
            }
            else
            {
              -[CKBrowserItemPayload attachments](self, "attachments");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              v5 = objc_msgSend(v10, "count") == 0;

            }
          }

        }
      }

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)shouldSendAsRichLink
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  BOOL v8;

  -[CKBrowserItemPayload pluginBundleID](self, "pluginBundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)*MEMORY[0x1E0D375F8];

  -[CKBrowserItemPayload url](self, "url");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v3 == v4)
  {
    v8 = v5 != 0;
  }
  else if (v5)
  {
    -[CKBrowserItemPayload data](self, "data");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length") == 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)shouldStageAsEmbeddedTextAttachment
{
  void *v3;
  char v4;
  void *v5;
  char v6;
  int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isRichLinkImprovementsEnabled");

  if ((v4 & 1) != 0)
  {
    -[CKBrowserItemPayload pluginBundleID](self, "pluginBundleID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D375F8]);

    if ((v6 & 1) != 0)
    {
      if (-[CKBrowserItemPayload shouldSendAsText](self, "shouldSendAsText"))
      {
        v7 = IMOSLoggingEnabled();
        if (v7)
        {
          OSLogHandleForIMFoundationCategory();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
          {
            LOWORD(v14) = 0;
            _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Payload should send as text. Do not stage plugin as text attachment.", (uint8_t *)&v14, 2u);
          }
LABEL_15:

LABEL_16:
          LOBYTE(v7) = 0;
        }
      }
      else
      {
        -[CKBrowserItemPayload url](self, "url");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v9)
        {
          v7 = IMOSLoggingEnabled();
          if (!v7)
            return v7;
          OSLogHandleForIMFoundationCategory();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
          {
            LOWORD(v14) = 0;
            _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Payload URL is nil. Do not stage plugin as text attachment.", (uint8_t *)&v14, 2u);
          }
          goto LABEL_15;
        }
        -[CKBrowserItemPayload collaborationMetadata](self, "collaborationMetadata");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          v7 = IMOSLoggingEnabled();
          if (!v7)
            return v7;
          OSLogHandleForIMFoundationCategory();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
          {
            LOWORD(v14) = 0;
            _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Payload collaborationMetadata indicates collaboration context. Do not stage plugin as text attachment.", (uint8_t *)&v14, 2u);
          }
          goto LABEL_15;
        }
        if (-[CKBrowserItemPayload payloadCollaborationType](self, "payloadCollaborationType"))
        {
          v7 = IMOSLoggingEnabled();
          if (!v7)
            return v7;
          OSLogHandleForIMFoundationCategory();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            v14 = 134217984;
            v15 = -[CKBrowserItemPayload payloadCollaborationType](self, "payloadCollaborationType");
            _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "Payload payloadCollaborationType (%ld) is indicative of collaboration. Do not stage plugin as text attachment.", (uint8_t *)&v14, 0xCu);
          }

          goto LABEL_16;
        }
        -[CKBrowserItemPayload cloudKitShare](self, "cloudKitShare");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          v7 = IMOSLoggingEnabled();
          if (!v7)
            return v7;
          OSLogHandleForIMFoundationCategory();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
          {
            LOWORD(v14) = 0;
            _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Payload cloudKitShare indicates that we should not stage as a text attachment.", (uint8_t *)&v14, 2u);
          }
          goto LABEL_15;
        }
        LOBYTE(v7) = 1;
      }
    }
    else
    {
      v7 = IMOSLoggingEnabled();
      if (v7)
      {
        OSLogHandleForIMFoundationCategory();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          LOWORD(v14) = 0;
          _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Payload is not a rich link. Do not stage plugin as text attachment.", (uint8_t *)&v14, 2u);
        }
        goto LABEL_15;
      }
    }
  }
  else
  {
    v7 = IMOSLoggingEnabled();
    if (v7)
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        LOWORD(v14) = 0;
        _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Feature flag is disabled.", (uint8_t *)&v14, 2u);
      }
      goto LABEL_15;
    }
  }
  return v7;
}

- (id)transcoderUserInfo
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  id v20;
  int v21;
  int v22;
  NSObject *v23;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint8_t buf[16];
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  -[CKBrowserItemPayload userInfo](self, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  objc_msgSend(v2, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v33;
    v26 = *MEMORY[0x1E0D37ED8];
    v27 = *MEMORY[0x1E0D37F08];
    v28 = *MEMORY[0x1E0D37EF8];
    v7 = *MEMORY[0x1E0D37EC0];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v33 != v6)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        if (objc_msgSend(v9, "isEqualToString:", CFSTR("CKPhotoBrowserItemAVTranscodeOptionAssetURI")))
        {
          objc_msgSend(v2, "objectForKey:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKey:", v10, v7);
        }
        else if (objc_msgSend(v9, "isEqualToString:", CFSTR("CKPhotoBrowserItemAVTranscodeOptionMetadataDictionary")))
        {
          objc_msgSend(v2, "objectForKey:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKey:", v10, v28);
        }
        else if (objc_msgSend(v9, "isEqualToString:", CFSTR("CKPhotoBrowserItemAVTranscodeOptionStartTime")))
        {
          objc_msgSend(v2, "objectForKey:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKey:", v10, v27);
        }
        else
        {
          if (!objc_msgSend(v9, "isEqualToString:", CFSTR("CKPhotoBrowserItemAVTranscodeOptionEndTime")))
            continue;
          objc_msgSend(v2, "objectForKey:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKey:", v10, v26);
        }

      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v5);
  }

  -[CKBrowserItemPayload fileURL](self, "fileURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[CKBrowserItemPayload fileURL](self, "fileURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lastPathComponent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    IMUTITypeForFilename();
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    +[CKMediaObjectManager sharedInstance](CKMediaObjectManager, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v13) = objc_msgSend((id)objc_msgSend(v15, "classForUTIType:", v14), "isSubclassOfClass:", objc_opt_class());

    if ((_DWORD)v13)
    {
      -[CKBrowserItemPayload fileURL](self, "fileURL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      CKAVURLAssetForURL(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v30 = 0;
      v31 = 0;
      v18 = objc_msgSend(MEMORY[0x1E0D75330], "readMetadataType:fromAVAsset:value:error:", 4, v17, &v31, &v30);
      v19 = v31;
      v20 = v30;
      if (v19)
        v21 = v18;
      else
        v21 = 0;
      if (v21 == 1 && (v22 = objc_msgSend(v19, "intValue")) != 0 && v22 != 3)
      {
        objc_msgSend(v3, "setObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D37EE8]);
      }
      else if (IMIsHEVCWithAlphaVideo())
      {
        objc_msgSend(v3, "setObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D37EE0]);
      }
      else if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18DFCD000, v23, OS_LOG_TYPE_INFO, "Failed to load video playback style", buf, 2u);
        }

      }
    }

  }
  return v3;
}

- (id)mediaObjectFromPayload
{
  return -[CKBrowserItemPayload mediaObjectFromPayloadWithKeyToTrasferGUIDMap:](self, "mediaObjectFromPayloadWithKeyToTrasferGUIDMap:", 0);
}

- (id)mediaObjectFromPayloadWithKeyToTrasferGUIDMap:(id)a3
{
  id v4;
  CKMediaObject *mediaObject;
  CKMediaObject *v6;
  void *v7;
  void *v8;
  char v9;
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
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v32;
  uint8_t buf[4];
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  mediaObject = self->_mediaObject;
  if (mediaObject)
  {
    v6 = mediaObject;
  }
  else
  {
    -[CKBrowserItemPayload transcoderUserInfo](self, "transcoderUserInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBrowserItemPayload fileURL](self, "fileURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = IMIsImageURLAScreenshot();

    +[CKMediaObjectManager sharedInstance](CKMediaObjectManager, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBrowserItemPayload fileURL](self, "fileURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBrowserItemPayload filename](self, "filename");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBrowserItemPayload attributionInfo](self, "attributionInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    BYTE1(v32) = v9;
    LOBYTE(v32) = -[CKBrowserItemPayload shouldHideAttachments](self, "shouldHideAttachments");
    objc_msgSend(v10, "mediaObjectWithFileURL:filename:fileIsResolved:transcoderUserInfo:attributionInfo:adaptiveImageGlyphContentIdentifier:adaptiveImageGlyphContentDescription:hideAttachment:isScreenshot:", v11, v12, 0, v7, v13, 0, 0, v32);
    v6 = (CKMediaObject *)objc_claimAutoreleasedReturnValue();

    -[CKMediaObject previewCacheKeyWithOrientation:](v6, "previewCacheKeyWithOrientation:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBrowserItemPayload fileURL](self, "fileURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = 0;
    if ((objc_msgSend(v16, "isEqualToString:", v14) & 1) == 0 && v16)
    {
      +[CKPreviewDispatchCache transcriptPreviewCache](CKPreviewDispatchCache, "transcriptPreviewCache");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "cachedPreviewForKey:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        objc_msgSend(v18, "setCachedPreview:key:", v17, v14);
        objc_msgSend(v18, "setCachedPreview:key:", 0, v16);
      }

    }
    if (v6)
    {
      -[CKBrowserItemPayload videoComplementFileURL](self, "videoComplementFileURL");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        -[CKBrowserItemPayload videoComplementFileURL](self, "videoComplementFileURL");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKMediaObject fileURL](v6, "fileURL");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        CKGetTmpPathForAppendedVideoURL(v20, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v22, "URLByResolvingSymlinksInPath");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        -[CKMediaObject transferGUID](v6, "transferGUID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        CKLinkAndCreateAppendedVideoTransfer(v23, v20, v24);

      }
      -[CKBrowserItemPayload generativePlaygroundRecipeData](self, "generativePlaygroundRecipeData");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        -[CKBrowserItemPayload generativePlaygroundRecipeData](self, "generativePlaygroundRecipeData");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKMediaObject setGenerativePlaygroundRecipeData:](v6, "setGenerativePlaygroundRecipeData:", v26);

      }
      -[CKBrowserItemPayload setMediaObject:](self, "setMediaObject:", v6);
    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        -[CKBrowserItemPayload fileURL](self, "fileURL");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v34 = v28;
        _os_log_impl(&dword_18DFCD000, v27, OS_LOG_TYPE_INFO, "CKChatInputController. Could not create media object from file: %@", buf, 0xCu);

      }
    }
    -[CKMediaObject previewFilenameExtension](v6, "previewFilenameExtension");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMediaObject previewCachesFileURLWithOrientation:extension:generateIntermediaries:transferGUID:](v6, "previewCachesFileURLWithOrientation:extension:generateIntermediaries:transferGUID:", 1, v29, 0, v14);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKMediaObject savePreview:toURL:forOrientation:](v6, "savePreview:toURL:forOrientation:", v17, v30, 1);
  }

  return v6;
}

- (id)__ck_urlFromTextBodyForRichLink
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__82;
  v21 = __Block_byref_object_dispose__82;
  v22 = 0;
  if (-[CKBrowserItemPayload shouldSendAsText](self, "shouldSendAsText"))
  {
    -[CKBrowserItemPayload text](self, "text");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "mutableCopy");

    if (!objc_msgSend(MEMORY[0x1E0D397F8], "supportsDataDetectors"))
      goto LABEL_6;
    -[CKBrowserItemPayload text](self, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "string");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = IMDDScanAttributedStringWithContext();

    if ((v9 & 1) != 0)
    {
      v10 = objc_msgSend(v4, "length");
      v11 = *MEMORY[0x1E0D365F0];
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __79__CKBrowserItemPayload_CKCompositionAdditions____ck_urlFromTextBodyForRichLink__block_invoke;
      v14[3] = &unk_1E275A970;
      v15 = v4;
      v16 = &v17;
      objc_msgSend(v15, "enumerateAttribute:inRange:options:usingBlock:", v11, 0, v10, 0, v14);
      v12 = (id)v18[5];

    }
    else
    {
LABEL_6:
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }
  _Block_object_dispose(&v17, 8);

  return v12;
}

void __79__CKBrowserItemPayload_CKCompositionAdditions____ck_urlFromTextBodyForRichLink__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  if (v11)
  {
    if (a4 == objc_msgSend(*(id *)(a1 + 32), "length"))
    {
      objc_msgSend(MEMORY[0x1E0D35770], "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v9, "dataSourceClassForBundleID:", *MEMORY[0x1E0D375F8]);

      if (objc_msgSend(v10, "supportsURL:", v11))
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    }
  }
  *a5 = 1;

}

+ (id)browserItemFromSticker:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  CKBrowserItemPayload *v6;
  void *v7;

  v3 = a3;
  +[CKMediaObjectManager sharedInstance](CKMediaObjectManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaObjectWithSticker:stickerUserInfo:", v3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_alloc_init(CKBrowserItemPayload);
    objc_msgSend(v3, "stickerPackGUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBrowserItemPayload setPluginBundleID:](v6, "setPluginBundleID:", v7);

    -[CKBrowserItemPayload setMediaObject:](v6, "setMediaObject:", v5);
    -[CKBrowserItemPayload setSticker:](v6, "setSticker:", 1);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
