@implementation NELinkMetadataSource

- (NELinkMetadataSource)initWithTitle:(id)a3 url:(id)a4 image:(id)a5
{
  id v8;
  id v9;
  id v10;
  NELinkMetadataSource *v11;
  NELinkMetadataSource *v12;
  void *v13;
  LPLinkMetadata *v14;
  id v15;
  LPLinkMetadata *linkMetadata;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)NELinkMetadataSource;
  v11 = -[NELinkMetadataSource init](&v18, sel_init);
  v12 = v11;
  if (v11)
  {
    -[NELinkMetadataSource _linkPresentationImageFromImage:](v11, "_linkPresentationImageFromImage:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (LPLinkMetadata *)objc_alloc_init(MEMORY[0x1E0CC11A8]);
    -[LPLinkMetadata setTitle:](v14, "setTitle:", v8);
    -[LPLinkMetadata setOriginalURL:](v14, "setOriginalURL:", v9);
    -[LPLinkMetadata setURL:](v14, "setURL:", v9);
    v15 = objc_alloc_init(MEMORY[0x1E0CC1118]);
    -[LPLinkMetadata setSpecialization:](v14, "setSpecialization:", v15);

    if (v13)
    {
      -[LPLinkMetadata setImage:](v14, "setImage:", v13);
      -[LPLinkMetadata setIcon:](v14, "setIcon:", v13);
    }
    linkMetadata = v12->_linkMetadata;
    v12->_linkMetadata = v14;

  }
  return v12;
}

- (NELinkMetadataSource)initWithTitle:(id)a3 url:(id)a4 imageProvider:(id)a5 iconProvider:(id)a6
{
  return -[NELinkMetadataSource initWithTitle:url:imageProvider:iconProvider:selectedText:](self, "initWithTitle:url:imageProvider:iconProvider:selectedText:", a3, a4, a5, a6, 0);
}

- (NELinkMetadataSource)initWithTitle:(id)a3 url:(id)a4 imageProvider:(id)a5 iconProvider:(id)a6 selectedText:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NELinkMetadataSource *v17;
  LPLinkMetadata *v18;
  id v19;
  LPLinkMetadata *linkMetadata;
  objc_super v22;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)NELinkMetadataSource;
  v17 = -[NELinkMetadataSource init](&v22, sel_init);
  if (v17)
  {
    v18 = (LPLinkMetadata *)objc_alloc_init(MEMORY[0x1E0CC11A8]);
    -[LPLinkMetadata setOriginalURL:](v18, "setOriginalURL:", v13);
    -[LPLinkMetadata setURL:](v18, "setURL:", v13);
    -[LPLinkMetadata setTitle:](v18, "setTitle:", v12);
    v19 = objc_alloc_init(MEMORY[0x1E0CC1118]);
    -[LPLinkMetadata setSpecialization:](v18, "setSpecialization:", v19);

    -[LPLinkMetadata setSelectedText:](v18, "setSelectedText:", v16);
    -[LPLinkMetadata setImageProvider:](v18, "setImageProvider:", v14);
    -[LPLinkMetadata setIconProvider:](v18, "setIconProvider:", v15);
    linkMetadata = v17->_linkMetadata;
    v17->_linkMetadata = v18;

  }
  return v17;
}

- (id)_linkPresentationImageFromImage:(id)a3
{
  UIImage *v3;
  void *v4;
  void *v5;

  v3 = (UIImage *)a3;
  if (-[UIImage isSymbolImage](v3, "isSymbolImage"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC1178]), "initWithPlatformImage:", v3);
  }
  else if (v3)
  {
    UIImagePNGRepresentation(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC1178]), "initWithData:MIMEType:", v5, CFSTR("image/png"));
    else
      v4 = 0;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (LPLinkMetadata)linkMetadata
{
  return self->_linkMetadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkMetadata, 0);
}

@end
