@implementation NESportsEventLinkPresentationSource

- (NESportsEventLinkPresentationSource)initWithSportsEvent:(id)a3 tagImageProvider:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NESportsEventLinkPresentationSource *v10;

  v6 = a4;
  v7 = a3;
  +[NESportsEventLinkPresentationSource titleFromSportsEvent:](NESportsEventLinkPresentationSource, "titleFromSportsEvent:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[NESportsEventLinkPresentationSource urlFromSportsEvent:](NESportsEventLinkPresentationSource, "urlFromSportsEvent:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[NESportsEventLinkPresentationSource initWithTitle:url:sportsEvent:tagImageProvider:](self, "initWithTitle:url:sportsEvent:tagImageProvider:", v8, v9, v7, v6);

  return v10;
}

- (NESportsEventLinkPresentationSource)initWithTitle:(id)a3 url:(id)a4 sportsEvent:(id)a5 tagImageProvider:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  NESportsEventLinkPresentationSource *v15;
  NESportsEventLinkPresentationSource *v16;
  uint64_t v17;
  NSItemProvider *linkPresentationImageProvider;
  uint64_t v19;
  NSItemProvider *linkPresentationIconProvider;
  objc_super v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)NESportsEventLinkPresentationSource;
  v15 = -[NESportsEventLinkPresentationSource init](&v22, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_title, a3);
    objc_storeStrong((id *)&v16->_url, a4);
    +[NESportsEventLinkPresentationSource imageItemProviderForSportsEvent:tagImageProvider:](NESportsEventLinkPresentationSource, "imageItemProviderForSportsEvent:tagImageProvider:", v13, v14);
    v17 = objc_claimAutoreleasedReturnValue();
    linkPresentationImageProvider = v16->_linkPresentationImageProvider;
    v16->_linkPresentationImageProvider = (NSItemProvider *)v17;

    +[NESportsEventLinkPresentationSource iconItemProviderForSportsEvent:tagImageProvider:](NESportsEventLinkPresentationSource, "iconItemProviderForSportsEvent:tagImageProvider:", v13, v14);
    v19 = objc_claimAutoreleasedReturnValue();
    linkPresentationIconProvider = v16->_linkPresentationIconProvider;
    v16->_linkPresentationIconProvider = (NSItemProvider *)v19;

  }
  return v16;
}

- (LPLinkMetadata)linkMetadata
{
  NELinkMetadataSource *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NELinkMetadataSource *v8;
  void *v9;

  v3 = [NELinkMetadataSource alloc];
  -[NESportsEventLinkPresentationSource title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NESportsEventLinkPresentationSource url](self, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NESportsEventLinkPresentationSource linkPresentationImageProvider](self, "linkPresentationImageProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NESportsEventLinkPresentationSource linkPresentationIconProvider](self, "linkPresentationIconProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[NELinkMetadataSource initWithTitle:url:imageProvider:iconProvider:](v3, "initWithTitle:url:imageProvider:iconProvider:", v4, v5, v6, v7);

  -[NELinkMetadataSource linkMetadata](v8, "linkMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (LPLinkMetadata *)v9;
}

+ (id)titleFromSportsEvent:(id)a3
{
  return (id)objc_msgSend(a3, "name");
}

+ (id)urlFromSportsEvent:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nss_NewsURLForTagID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)imageItemProviderForSportsEvent:(id)a3 tagImageProvider:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0CB36C8]);
  objc_msgSend((id)*MEMORY[0x1E0CEC580], "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __88__NESportsEventLinkPresentationSource_imageItemProviderForSportsEvent_tagImageProvider___block_invoke;
  v12[3] = &unk_1E724B808;
  v13 = v6;
  v14 = v5;
  v9 = v5;
  v10 = v6;
  objc_msgSend(v7, "registerItemForTypeIdentifier:loadHandler:", v8, v12);

  return v7;
}

void __88__NESportsEventLinkPresentationSource_imageItemProviderForSportsEvent_tagImageProvider___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __88__NESportsEventLinkPresentationSource_imageItemProviderForSportsEvent_tagImageProvider___block_invoke_2;
  v7[3] = &unk_1E724B7E0;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "createShareSportsEventImageFor:size:logoWidth:completion:", v4, v7, 260.0, 150.0, 67.0);

}

void __88__NESportsEventLinkPresentationSource_imageItemProviderForSportsEvent_tagImageProvider___block_invoke_2(uint64_t a1, UIImage *image)
{
  id v3;

  UIImagePNGRepresentation(image);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

+ (id)iconItemProviderForSportsEvent:(id)a3 tagImageProvider:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0CB36C8]);
  objc_msgSend((id)*MEMORY[0x1E0CEC580], "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __87__NESportsEventLinkPresentationSource_iconItemProviderForSportsEvent_tagImageProvider___block_invoke;
  v12[3] = &unk_1E724B808;
  v13 = v6;
  v14 = v5;
  v9 = v5;
  v10 = v6;
  objc_msgSend(v7, "registerItemForTypeIdentifier:loadHandler:", v8, v12);

  return v7;
}

void __87__NESportsEventLinkPresentationSource_iconItemProviderForSportsEvent_tagImageProvider___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __87__NESportsEventLinkPresentationSource_iconItemProviderForSportsEvent_tagImageProvider___block_invoke_2;
  v7[3] = &unk_1E724B7E0;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "createShareSportsEventImageFor:size:logoWidth:completion:", v4, v7, 40.0, 40.0, 10.0);

}

void __87__NESportsEventLinkPresentationSource_iconItemProviderForSportsEvent_tagImageProvider___block_invoke_2(uint64_t a1, UIImage *image)
{
  id v3;

  UIImagePNGRepresentation(image);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (NSString)title
{
  return self->_title;
}

- (NSItemProvider)linkPresentationImageProvider
{
  return self->_linkPresentationImageProvider;
}

- (NSItemProvider)linkPresentationIconProvider
{
  return self->_linkPresentationIconProvider;
}

- (NSURL)url
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_linkPresentationIconProvider, 0);
  objc_storeStrong((id *)&self->_linkPresentationImageProvider, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
