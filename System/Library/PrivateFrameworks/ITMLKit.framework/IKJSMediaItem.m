@implementation IKJSMediaItem

- (IKJSMediaItem)initWithType:(id)a3 :(id)a4
{
  id v6;
  id v7;
  void *v8;
  IKJSMediaItem *v9;
  IKAppMediaItemBridge *v10;
  void *v11;
  uint64_t v12;
  IKAppMediaItemBridge *bridge;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  +[IKAppContext currentAppContext](IKAppContext, "currentAppContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15.receiver = self;
  v15.super_class = (Class)IKJSMediaItem;
  v9 = -[IKJSObject initWithAppContext:](&v15, sel_initWithAppContext_, v8);

  if (v9)
  {
    v10 = [IKAppMediaItemBridge alloc];
    -[IKJSObject appContext](v9, "appContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[IKAppMediaItemBridge initWithAppContext:jsMediaItem:](v10, "initWithAppContext:jsMediaItem:", v11, v9);
    bridge = v9->_bridge;
    v9->_bridge = (IKAppMediaItemBridge *)v12;

    if (v7 && (objc_msgSend(v7, "isEqualToString:", CFSTR("undefined")) & 1) == 0)
      -[IKAppMediaItemBridge setUrl:](v9->_bridge, "setUrl:", v7);
    -[IKJSMediaItem setType:](v9, "setType:", v6);
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[IKAppMediaItemBridge cleanup](self->_bridge, "cleanup");
  v3.receiver = self;
  v3.super_class = (Class)IKJSMediaItem;
  -[IKJSMediaItem dealloc](&v3, sel_dealloc);
}

- (void)setType:(id)a3
{
  __CFString *v4;
  void *v5;
  __CFString *v6;

  v6 = (__CFString *)a3;
  if ((-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("video")) & 1) == 0
    && (-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("audio")) & 1) == 0)
  {
    v4 = CFSTR("video");

    v6 = v4;
  }
  -[IKJSMediaItem bridge](self, "bridge");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setType:", v6);

}

- (NSString)type
{
  void *v2;
  void *v3;

  -[IKJSMediaItem bridge](self, "bridge");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setUrl:(id)a3
{
  -[IKAppMediaItemBridge setUrl:](self->_bridge, "setUrl:", a3);
}

- (NSString)url
{
  return -[IKAppMediaItemBridge url](self->_bridge, "url");
}

- (void)setExternalID:(id)a3
{
  -[IKAppMediaItemBridge setExternalID:](self->_bridge, "setExternalID:", a3);
}

- (NSString)externalID
{
  return -[IKAppMediaItemBridge externalID](self->_bridge, "externalID");
}

- (void)setInterstitials:(id)a3
{
  -[IKAppMediaItemBridge setInterstitials:](self->_bridge, "setInterstitials:", a3);
}

- (NSArray)interstitials
{
  return -[IKAppMediaItemBridge interstitials](self->_bridge, "interstitials");
}

- (void)setHighlightGroups:(id)a3
{
  -[IKAppMediaItemBridge setChapterGroups:](self->_bridge, "setChapterGroups:", a3);
}

- (NSArray)highlightGroups
{
  return -[IKAppMediaItemBridge chapterGroups](self->_bridge, "chapterGroups");
}

- (void)setTitle:(id)a3
{
  -[IKAppMediaItemBridge setTitle:](self->_bridge, "setTitle:", a3);
}

- (NSString)title
{
  return -[IKAppMediaItemBridge title](self->_bridge, "title");
}

- (void)setSubtitle:(id)a3
{
  -[IKAppMediaItemBridge setSubtitle:](self->_bridge, "setSubtitle:", a3);
}

- (NSString)subtitle
{
  return -[IKAppMediaItemBridge subtitle](self->_bridge, "subtitle");
}

- (void)setDescription:(id)a3
{
  -[IKAppMediaItemBridge setDescription:](self->_bridge, "setDescription:", a3);
}

- (NSString)description
{
  return -[IKAppMediaItemBridge description](self->_bridge, "description");
}

- (void)setContentRatingRanking:(id)a3
{
  -[IKAppMediaItemBridge setContentRatingRanking:](self->_bridge, "setContentRatingRanking:", a3);
}

- (NSNumber)contentRatingRanking
{
  return -[IKAppMediaItemBridge contentRatingRanking](self->_bridge, "contentRatingRanking");
}

- (void)setRatingBadge:(id)a3
{
  -[IKAppMediaItemBridge setRatingBadge:](self->_bridge, "setRatingBadge:", a3);
}

- (id)ratingBadge
{
  return -[IKAppMediaItemBridge ratingBadge](self->_bridge, "ratingBadge");
}

- (void)setArtworkImageURL:(id)a3
{
  -[IKAppMediaItemBridge setArtworkImageURL:](self->_bridge, "setArtworkImageURL:", a3);
}

- (NSString)artworkImageURL
{
  return -[IKAppMediaItemBridge artworkImageURL](self->_bridge, "artworkImageURL");
}

- (void)setArtworkImageSrcset:(id)a3
{
  -[IKAppMediaItemBridge setArtworkImageSrcset:](self->_bridge, "setArtworkImageSrcset:", a3);
}

- (NSString)artworkImageSrcset
{
  return -[IKAppMediaItemBridge artworkImageSrcset](self->_bridge, "artworkImageSrcset");
}

- (void)setIsExplicit:(BOOL)a3
{
  -[IKAppMediaItemBridge setIsExplicit:](self->_bridge, "setIsExplicit:", a3);
}

- (BOOL)isExplicit
{
  return -[IKAppMediaItemBridge isExplicit](self->_bridge, "isExplicit");
}

- (void)setResumeTime:(id)a3
{
  -[IKAppMediaItemBridge setResumeTime:](self->_bridge, "setResumeTime:", a3);
}

- (NSNumber)resumeTime
{
  return -[IKAppMediaItemBridge resumeTime](self->_bridge, "resumeTime");
}

- (void)setMetadata:(id)a3
{
  -[IKAppMediaItemBridge setExtraMetadata:](self->_bridge, "setExtraMetadata:", a3);
}

- (NSDictionary)metadata
{
  return -[IKAppMediaItemBridge extraMetadata](self->_bridge, "extraMetadata");
}

- (void)setContentRatingDomain:(id)a3
{
  -[IKAppMediaItemBridge setContentRatingDomain:](self->_bridge, "setContentRatingDomain:", a3);
}

- (NSString)contentRatingDomain
{
  return -[IKAppMediaItemBridge contentRatingDomain](self->_bridge, "contentRatingDomain");
}

- (void)setContentProposalAutomaticAcceptanceInterval:(double)a3
{
  -[IKAppMediaItemBridge setContentProposalAutomaticAcceptanceInterval:](self->_bridge, "setContentProposalAutomaticAcceptanceInterval:", a3);
}

- (double)contentProposalAutomaticAcceptanceInterval
{
  double result;

  -[IKAppMediaItemBridge contentProposalAutomaticAcceptanceInterval](self->_bridge, "contentProposalAutomaticAcceptanceInterval");
  return result;
}

- (void)setContentProposalPresentationTime:(double)a3
{
  -[IKAppMediaItemBridge setContentProposalPresentationTime:](self->_bridge, "setContentProposalPresentationTime:", a3);
}

- (double)contentProposalPresentationTime
{
  double result;

  -[IKAppMediaItemBridge contentProposalPresentationTime](self->_bridge, "contentProposalPresentationTime");
  return result;
}

- (void)loadCertificateDataForURI:(id)a3 withCallback:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *, void *);
  void *v20;
  id v21;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __56__IKJSMediaItem_loadCertificateDataForURI_withCallback___block_invoke;
  v20 = &unk_1E9F4E680;
  v8 = v7;
  v21 = v8;
  v9 = (void *)MEMORY[0x1DF092410](&v17);
  v10 = (void *)MEMORY[0x1E0CBE108];
  -[IKJSObject appContext](self, "appContext", v17, v18, v19, v20);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "jsContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "valueWithObject:inContext:", self, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "hasProperty:", CFSTR("loadCertificate")))
  {
    v22[0] = v6;
    v14 = (void *)MEMORY[0x1DF092410](v9);
    v22[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[IKJSObject invokeMethod:withArguments:](self, "invokeMethod:withArguments:", CFSTR("loadCertificate"), v15);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ITMLKitErrorDomain"), 103, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v8 + 2))(v8, 0, 0, v14);
  }

}

void __56__IKJSMediaItem_loadCertificateDataForURI_withCallback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if (objc_msgSend(v9, "isString"))
  {
    objc_msgSend(v9, "toString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  if (objc_msgSend(v5, "isString"))
  {
    objc_msgSend(v5, "toString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v7, 1, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
    v8 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)loadContentIdentifierDataForURI:(id)a3 withCallback:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *, void *);
  void *v20;
  id v21;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __62__IKJSMediaItem_loadContentIdentifierDataForURI_withCallback___block_invoke;
  v20 = &unk_1E9F4E680;
  v8 = v7;
  v21 = v8;
  v9 = (void *)MEMORY[0x1DF092410](&v17);
  v10 = (void *)MEMORY[0x1E0CBE108];
  -[IKJSObject appContext](self, "appContext", v17, v18, v19, v20);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "jsContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "valueWithObject:inContext:", self, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "hasProperty:", CFSTR("loadAssetID")))
  {
    v22[0] = v6;
    v14 = (void *)MEMORY[0x1DF092410](v9);
    v22[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[IKJSObject invokeMethod:withArguments:](self, "invokeMethod:withArguments:", CFSTR("loadAssetID"), v15);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ITMLKitErrorDomain"), 103, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v8 + 2))(v8, 0, 0, v14);
  }

}

void __62__IKJSMediaItem_loadContentIdentifierDataForURI_withCallback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if (objc_msgSend(v9, "isString"))
  {
    objc_msgSend(v9, "toString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  if (objc_msgSend(v5, "isString"))
  {
    objc_msgSend(v5, "toString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v7, 1, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
    v8 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)loadKeyDataForURI:(id)a3 requestData:(id)a4 withCallback:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __60__IKJSMediaItem_loadKeyDataForURI_requestData_withCallback___block_invoke;
  v20[3] = &unk_1E9F4E6A8;
  v11 = v10;
  v21 = v11;
  v12 = (void *)MEMORY[0x1DF092410](v20);
  v13 = (void *)MEMORY[0x1E0CBE108];
  -[IKJSObject appContext](self, "appContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "jsContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "valueWithObject:inContext:", self, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v16, "hasProperty:", CFSTR("loadKey")))
  {
    v22[0] = v8;
    v22[1] = v9;
    v17 = (void *)MEMORY[0x1DF092410](v12);
    v22[2] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[IKJSObject invokeMethod:withArguments:](self, "invokeMethod:withArguments:", CFSTR("loadKey"), v18);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ITMLKitErrorDomain"), 103, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v11 + 2))(v11, 0, 0, v17);
  }

}

void __60__IKJSMediaItem_loadKeyDataForURI_requestData_withCallback___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v13, "isString"))
  {
    objc_msgSend(v13, "toString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  if (objc_msgSend(v7, "isObject"))
  {
    objc_msgSend(v7, "toObjectOfClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  if (objc_msgSend(v8, "isString"))
  {
    objc_msgSend(v8, "toString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v11, 1, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
    v12 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (IKAppMediaItemBridge)bridge
{
  return self->_bridge;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bridge, 0);
  objc_storeStrong((id *)&self->_resumeTime, 0);
}

@end
