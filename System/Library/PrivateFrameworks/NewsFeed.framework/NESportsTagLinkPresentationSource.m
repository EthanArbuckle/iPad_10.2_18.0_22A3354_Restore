@implementation NESportsTagLinkPresentationSource

- (NESportsTagLinkPresentationSource)initWithSportsTag:(id)a3 tagImageProvider:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NESportsTagLinkPresentationSource *v12;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v7, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "nss_NewsURLForTagID:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[NESportsTagLinkPresentationSource initWithTitle:url:sportsTag:tagImageProvider:](self, "initWithTitle:url:sportsTag:tagImageProvider:", v8, v11, v7, v6);

  return v12;
}

- (NESportsTagLinkPresentationSource)initWithTitle:(id)a3 url:(id)a4 sportsTag:(id)a5 tagImageProvider:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  NESportsTagLinkPresentationSource *v15;
  NESportsTagLinkPresentationSource *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)NESportsTagLinkPresentationSource;
  v15 = -[NESportsTagLinkPresentationSource init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_sportsTag, a5);
    objc_storeStrong((id *)&v16->_title, a3);
    objc_storeStrong((id *)&v16->_url, a4);
    objc_storeStrong((id *)&v16->_tagImageProvider, a6);
  }

  return v16;
}

- (LPLinkMetadata)linkMetadata
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  NELinkMetadataSource *v7;
  void *v8;
  void *v9;
  void *v10;
  NELinkMetadataSource *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  -[NESportsTagLinkPresentationSource title](self, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NESportsTagLinkPresentationSource url](self, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NESportsTagLinkPresentationSource sportsTag](self, "sportsTag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isMySports");

  v7 = [NELinkMetadataSource alloc];
  if (v6)
  {
    -[NESportsTagLinkPresentationSource tagImageProvider](self, "tagImageProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NESportsTagLinkPresentationSource sportsTag](self, "sportsTag");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mySportsShareImageFor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NELinkMetadataSource initWithTitle:url:image:](v7, "initWithTitle:url:image:", v3, v4, v10);
  }
  else
  {
    -[NESportsTagLinkPresentationSource sportsTag](self, "sportsTag");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NESportsTagLinkPresentationSource tagImageProvider](self, "tagImageProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[NESportsTagLinkPresentationSource imageItemProviderForSportsTag:tagImageProvider:](NESportsTagLinkPresentationSource, "imageItemProviderForSportsTag:tagImageProvider:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NESportsTagLinkPresentationSource sportsTag](self, "sportsTag");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NESportsTagLinkPresentationSource tagImageProvider](self, "tagImageProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[NESportsTagLinkPresentationSource iconItemProviderForSportsTag:tagImageProvider:](NESportsTagLinkPresentationSource, "iconItemProviderForSportsTag:tagImageProvider:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NELinkMetadataSource initWithTitle:url:imageProvider:iconProvider:](v7, "initWithTitle:url:imageProvider:iconProvider:", v3, v4, v10, v14);

  }
  -[NELinkMetadataSource linkMetadata](v11, "linkMetadata");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (LPLinkMetadata *)v15;
}

+ (id)imageItemProviderForSportsTag:(id)a3 tagImageProvider:(id)a4
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
  v12[2] = __84__NESportsTagLinkPresentationSource_imageItemProviderForSportsTag_tagImageProvider___block_invoke;
  v12[3] = &unk_1E724B808;
  v13 = v6;
  v14 = v5;
  v9 = v5;
  v10 = v6;
  objc_msgSend(v7, "registerItemForTypeIdentifier:loadHandler:", v8, v12);

  return v7;
}

void __84__NESportsTagLinkPresentationSource_imageItemProviderForSportsTag_tagImageProvider___block_invoke(uint64_t a1, void *a2)
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
  v7[2] = __84__NESportsTagLinkPresentationSource_imageItemProviderForSportsTag_tagImageProvider___block_invoke_2;
  v7[3] = &unk_1E724B7E0;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "createSportsShareImageFor:completion:", v4, v7);

}

void __84__NESportsTagLinkPresentationSource_imageItemProviderForSportsTag_tagImageProvider___block_invoke_2(uint64_t a1, UIImage *image)
{
  id v3;

  UIImagePNGRepresentation(image);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

+ (id)iconItemProviderForSportsTag:(id)a3 tagImageProvider:(id)a4
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
  v12[2] = __83__NESportsTagLinkPresentationSource_iconItemProviderForSportsTag_tagImageProvider___block_invoke;
  v12[3] = &unk_1E724B808;
  v13 = v6;
  v14 = v5;
  v9 = v5;
  v10 = v6;
  objc_msgSend(v7, "registerItemForTypeIdentifier:loadHandler:", v8, v12);

  return v7;
}

void __83__NESportsTagLinkPresentationSource_iconItemProviderForSportsTag_tagImageProvider___block_invoke(uint64_t a1, void *a2)
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
  v7[2] = __83__NESportsTagLinkPresentationSource_iconItemProviderForSportsTag_tagImageProvider___block_invoke_2;
  v7[3] = &unk_1E724B7E0;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "createSportsShareImageFor:completion:", v4, v7);

}

void __83__NESportsTagLinkPresentationSource_iconItemProviderForSportsTag_tagImageProvider___block_invoke_2(uint64_t a1, UIImage *image)
{
  id v3;

  UIImagePNGRepresentation(image);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (FCSportsProviding)sportsTag
{
  return self->_sportsTag;
}

- (NSString)title
{
  return self->_title;
}

- (NSURL)url
{
  return self->_url;
}

- (NETagImageShareAttributeProviderType)tagImageProvider
{
  return self->_tagImageProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagImageProvider, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_sportsTag, 0);
}

@end
