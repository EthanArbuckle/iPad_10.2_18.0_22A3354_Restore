@implementation GEOAppStoreAppClip

- (GEOAppStoreAppClip)initWithBundleID:(id)a3 title:(id)a4 subtitle:(id)a5 appShortName:(id)a6 appClipURL:(id)a7 artworkURL:(id)a8 providerName:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  GEOAppStoreAppClip *v20;
  GEOAppStoreAppClip *v21;
  uint64_t v22;
  NSString *bundleID;
  uint64_t v24;
  NSString *title;
  uint64_t v26;
  NSString *subtitle;
  id v29;
  id v30;
  id v31;
  objc_super v32;

  v15 = a3;
  v31 = a4;
  v30 = a5;
  v29 = a6;
  v16 = a7;
  v17 = a8;
  v18 = a9;
  v19 = objc_msgSend(v15, "length");
  v20 = 0;
  if (v16 && v19)
  {
    v32.receiver = self;
    v32.super_class = (Class)GEOAppStoreAppClip;
    v21 = -[GEOAppStoreAppClip init](&v32, sel_init);
    if (v21)
    {
      v22 = objc_msgSend(v15, "copy");
      bundleID = v21->_bundleID;
      v21->_bundleID = (NSString *)v22;

      v24 = objc_msgSend(v31, "copy");
      title = v21->_title;
      v21->_title = (NSString *)v24;

      v26 = objc_msgSend(v30, "copy");
      subtitle = v21->_subtitle;
      v21->_subtitle = (NSString *)v26;

      objc_storeStrong((id *)&v21->_appClipURL, a7);
      objc_storeStrong((id *)&v21->_artworkURL, a8);
      objc_storeStrong((id *)&v21->_provider, a9);
      objc_storeStrong((id *)&v21->_appShortName, a6);
    }
    self = v21;
    v20 = self;
  }

  return v20;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[GEOAppStoreAppClip title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOAppStoreAppClip subtitle](self, "subtitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOAppStoreAppClip appClipURL](self, "appClipURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("app clip with title=\"%@\", subtitle=\"%@\", url=\"%@\"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSURL)appClipURL
{
  return self->_appClipURL;
}

- (void)setAppClipURL:(id)a3
{
  objc_storeStrong((id *)&self->_appClipURL, a3);
}

- (NSURL)artworkURL
{
  return self->_artworkURL;
}

- (void)setArtworkURL:(id)a3
{
  objc_storeStrong((id *)&self->_artworkURL, a3);
}

- (NSString)provider
{
  return self->_provider;
}

- (NSString)appShortName
{
  return self->_appShortName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appShortName, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_artworkURL, 0);
  objc_storeStrong((id *)&self->_appClipURL, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
