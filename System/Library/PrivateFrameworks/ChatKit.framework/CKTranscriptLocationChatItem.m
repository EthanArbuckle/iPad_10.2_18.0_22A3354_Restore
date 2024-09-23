@implementation CKTranscriptLocationChatItem

- (id)transferGUID
{
  void *v2;
  void *v3;

  -[CKTranscriptLocationChatItem mediaObject](self, "mediaObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transferGUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CKLocationMediaObject)locationMediaObject
{
  CKLocationMediaObject *locationMediaObject;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  __objc2_class **v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  CKLocationMediaObject *v23;
  CKLocationMediaObject *v24;
  void *v25;
  NSURL *v26;
  NSURL *locationURL;

  locationMediaObject = self->_locationMediaObject;
  if (!locationMediaObject)
  {
    -[CKChatItem IMChatItem](self, "IMChatItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      objc_msgSend(v5, "locationInfo");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "location");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = off_1E2733000;
      if (v7)
      {
        objc_msgSend(v5, "locationInfo");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "query");
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = (void *)v10;
        v12 = CFSTR("Location");
        if (v10)
          v12 = (__CFString *)v10;
        v13 = v12;

        +[CKMediaObjectManager sharedInstance](CKMediaObjectManager, "sharedInstance");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "locationInfo");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "location");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        +[CKLocationMediaObject vcardDataFromCLLocation:](CKLocationMediaObject, "vcardDataFromCLLocation:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "mediaObjectWithData:UTIType:filename:transcoderUserInfo:", v17, CFSTR("loc.vcf"), v13, MEMORY[0x1E0C9AA70]);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v8 = off_1E2733000;
      }
      else
      {
        v18 = 0;
      }
      v19 = objc_alloc(v8[121]);
      objc_msgSend(v18, "transfer");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKMessagePartChatItem message](self, "message");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "__ck_context");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (CKLocationMediaObject *)objc_msgSend(v19, "initWithTransfer:context:forceInlinePreview:", v20, v22, 0);
      v24 = self->_locationMediaObject;
      self->_locationMediaObject = v23;

      objc_msgSend(v5, "locationInfo");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "url");
      v26 = (NSURL *)objc_claimAutoreleasedReturnValue();
      locationURL = self->_locationURL;
      self->_locationURL = v26;

    }
    locationMediaObject = self->_locationMediaObject;
  }
  return locationMediaObject;
}

- (Class)balloonViewClass
{
  return (Class)objc_opt_class();
}

- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors", a4, a3.width, a3.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mapPreviewMaxWidth");
  objc_msgSend(v4, "mapThumbnailFillSizeForWidth:");
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (BOOL)canCopy
{
  return self->_locationURL != 0;
}

- (id)dragItemProvider
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v3 = objc_alloc_init(MEMORY[0x1E0CB36C8]);
  -[NSURL absoluteString](self->_locationURL, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataUsingEncoding:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *MEMORY[0x1E0CA5C90];
  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __48__CKTranscriptLocationChatItem_dragItemProvider__block_invoke;
  v14[3] = &unk_1E274B9C8;
  v8 = v5;
  v15 = v8;
  objc_msgSend(v3, "registerDataRepresentationForTypeIdentifier:visibility:loadHandler:", v6, 0, v14);
  v9 = *MEMORY[0x1E0CA5CA0];
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __48__CKTranscriptLocationChatItem_dragItemProvider__block_invoke_2;
  v12[3] = &unk_1E274B9C8;
  v13 = v8;
  v10 = v8;
  objc_msgSend(v3, "registerDataRepresentationForTypeIdentifier:visibility:loadHandler:", v9, 0, v12);

  return v3;
}

uint64_t __48__CKTranscriptLocationChatItem_dragItemProvider__block_invoke(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, _QWORD, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32), 0);
  return 0;
}

uint64_t __48__CKTranscriptLocationChatItem_dragItemProvider__block_invoke_2(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, _QWORD, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32), 0);
  return 0;
}

- (void)setLocationMediaObject:(id)a3
{
  objc_storeStrong((id *)&self->_locationMediaObject, a3);
}

- (NSURL)locationURL
{
  return self->_locationURL;
}

- (void)setLocationURL:(id)a3
{
  objc_storeStrong((id *)&self->_locationURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationURL, 0);
  objc_storeStrong((id *)&self->_locationMediaObject, 0);
}

@end
