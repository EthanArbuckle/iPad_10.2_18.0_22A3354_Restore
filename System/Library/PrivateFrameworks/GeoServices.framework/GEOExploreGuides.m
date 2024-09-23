@implementation GEOExploreGuides

- (GEOExploreGuides)initWithExploreGuides:(id)a3
{
  _QWORD *v5;
  GEOExploreGuides *v6;
  uint64_t v7;
  _BOOL4 v8;
  uint64_t v9;
  _BOOL4 v10;
  BOOL v11;
  NSObject *v12;
  const char *v13;
  const char *v14;
  GEOExploreGuides *v15;
  objc_super v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)GEOExploreGuides;
  v6 = -[GEOExploreGuides init](&v17, sel_init);
  if (!v6)
    goto LABEL_16;
  if (v5)
  {
    -[GEOPDExploreGuides _readGuidesLocationEntry]((uint64_t)v5);
    v7 = v5[4];
    v8 = v7 != 0;
    -[GEOPDExploreGuides _readExploreImageUrlTemplate]((uint64_t)v5);
    v9 = v5[3];
    v10 = v9 != 0;
    if (v7)
      v11 = v9 == 0;
    else
      v11 = 1;
    if (!v11)
    {
      objc_storeStrong((id *)&v6->_pdExploreGuides, a3);
LABEL_16:
      v15 = v6;
      goto LABEL_17;
    }
  }
  else
  {
    v10 = 0;
    v8 = 0;
  }
  GEOGetCuratedCollectionsLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v13 = "NO";
    if (v8)
      v14 = "YES";
    else
      v14 = "NO";
    if (v10)
      v13 = "YES";
    *(_DWORD *)buf = 136315394;
    v19 = v14;
    v20 = 2080;
    v21 = v13;
    _os_log_impl(&dword_1885A9000, v12, OS_LOG_TYPE_ERROR, "Explore Guides could not be initialized because some data is missing.\n hasGuidesLocation: %s, hasTemplateUrl : %s", buf, 0x16u);
  }

  v15 = 0;
LABEL_17:

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  GEOExploreGuides *v4;
  GEOExploreGuides *v5;
  GEOExploreGuides *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (GEOExploreGuides *)a3;
  v5 = v4;
  if (self == v4)
  {
    v9 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    -[GEOExploreGuides guideLocation](self, "guideLocation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOExploreGuides guideLocation](v6, "guideLocation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v7, "isEqual:", v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (GEOGuideLocation)guideLocation
{
  GEOGuideLocation *v3;
  void *v4;
  GEOGuideLocation *v5;

  v3 = [GEOGuideLocation alloc];
  -[GEOPDExploreGuides guidesLocationEntry]((id *)&self->_pdExploreGuides->super.super.isa);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[GEOGuideLocation initWithGuideLocation:](v3, "initWithGuideLocation:", v4);

  return v5;
}

- (id)imageURLForSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;

  height = a3.height;
  width = a3.width;
  -[GEOPDExploreGuides exploreImageUrlTemplate]((id *)&self->_pdExploreGuides->super.super.isa);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOExploreGuides imageDownloadUrlFromTemplateUrl:size:](self, "imageDownloadUrlFromTemplateUrl:size:", v6, width, height);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)imageDownloadUrlFromTemplateUrl:(id)a3 size:(CGSize)a4
{
  double height;
  double width;
  id v6;
  GEOPDPhotoContent *v7;
  GEOPDPhotoContent *v8;
  GEOPhotoInfoSource *v9;
  void *v10;
  GEOPhotoInfoSource *v11;
  GEOMapItemPhotoOptions *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  int v19;
  void *v20;
  _QWORD v21[2];

  height = a4.height;
  width = a4.width;
  v21[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_alloc_init(GEOPDPhotoContent);
  v8 = v7;
  if (v7)
  {
    *(_BYTE *)&v7->_flags |= 2u;
    v7->_urlType = 1;
    -[GEOPDPhotoContent setUrl:]((uint64_t)v7, v6);

    *(_BYTE *)&v8->_flags |= 4u;
    v8->_width = width;
    *(_BYTE *)&v8->_flags |= 1u;
    v8->_height = height;
  }
  else
  {
    -[GEOPDPhotoContent setUrl:](0, v6);

  }
  v9 = [GEOPhotoInfoSource alloc];
  v21[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[GEOPhotoInfoSource initWithPhotoContent:](v9, "initWithPhotoContent:", v10);

  v12 = -[GEOMapItemPhotoOptions initWithAllowSmaller:cropStyle:format:]([GEOMapItemPhotoOptions alloc], "initWithAllowSmaller:cropStyle:format:", 0, 5, 2);
  -[GEOPhotoInfoSource bestPhotoForSize:options:](v11, "bestPhotoForSize:options:", v12, width, height);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  GEOGetCuratedCollectionsLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v13, "url");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "absoluteString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138412290;
    v20 = v16;
    _os_log_impl(&dword_1885A9000, v14, OS_LOG_TYPE_DEBUG, "Explore Guides download URL: %@", (uint8_t *)&v19, 0xCu);

  }
  objc_msgSend(v13, "url");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pdExploreGuides, 0);
}

@end
