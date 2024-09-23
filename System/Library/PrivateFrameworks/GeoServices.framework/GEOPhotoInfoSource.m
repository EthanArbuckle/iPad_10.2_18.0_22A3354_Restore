@implementation GEOPhotoInfoSource

- (GEOPhotoInfoSource)initWithPhotoContent:(id)a3
{
  id v5;
  GEOPhotoInfoSource *v6;
  GEOPhotoInfoSource *v7;
  GEOAMPPhotoInfoProvider *v8;
  GEOAMPPhotoInfoProvider *ampPhotoInfoProvider;
  GEODefaultPhotoInfoProvider *v10;
  GEODefaultPhotoInfoProvider *defaultPhotoInfoProvider;
  GEOPhotoInfoSource *v12;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GEOPhotoInfoSource;
  v6 = -[GEOPhotoInfoSource init](&v14, sel_init);
  v7 = v6;
  if (!v6)
    goto LABEL_4;
  objc_storeStrong((id *)&v6->_originalPhotoContent, a3);
  v8 = -[GEOAMPPhotoInfoProvider initWithPhotoContent:]([GEOAMPPhotoInfoProvider alloc], "initWithPhotoContent:", v7->_originalPhotoContent);
  ampPhotoInfoProvider = v7->_ampPhotoInfoProvider;
  v7->_ampPhotoInfoProvider = v8;

  v10 = -[GEODefaultPhotoInfoProvider initWithPhotoContent:]([GEODefaultPhotoInfoProvider alloc], "initWithPhotoContent:", v7->_originalPhotoContent);
  defaultPhotoInfoProvider = v7->_defaultPhotoInfoProvider;
  v7->_defaultPhotoInfoProvider = v10;

  if (v7->_ampPhotoInfoProvider || v7->_defaultPhotoInfoProvider)
LABEL_4:
    v12 = v7;
  else
    v12 = 0;

  return v12;
}

- (GEOPhotoInfoProvider)principalPhotoInfoProvider
{
  void *ampPhotoInfoProvider;

  ampPhotoInfoProvider = self->_ampPhotoInfoProvider;
  if (!ampPhotoInfoProvider)
    ampPhotoInfoProvider = self->_defaultPhotoInfoProvider;
  return (GEOPhotoInfoProvider *)ampPhotoInfoProvider;
}

- (NSArray)allPhotoInfoProviders
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = v3;
  if (self->_ampPhotoInfoProvider)
    objc_msgSend(v3, "addObject:");
  if (self->_defaultPhotoInfoProvider)
    objc_msgSend(v4, "addObject:");
  v5 = (void *)objc_msgSend(v4, "copy");

  return (NSArray *)v5;
}

- (id)bestPhotoForSize:(CGSize)a3 options:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  _OWORD v11[4];
  _BYTE v12[128];
  uint64_t v13;

  height = a3.height;
  width = a3.width;
  v13 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  memset(v11, 0, sizeof(v11));
  -[GEOPhotoInfoSource allPhotoInfoProviders](self, "allPhotoInfoProviders", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", v11, v12, 16))
  {
    objc_msgSend(**((id **)&v11[0] + 1), "bestPhotoForSize:options:", v7, width, height);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (double)sizeRatio
{
  void *v2;
  double v3;
  double v4;

  -[GEOPhotoInfoSource principalPhotoInfoProvider](self, "principalPhotoInfoProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sizeRatio");
  v4 = v3;

  return v4;
}

- (id)largestPhoto
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[GEOPhotoInfoSource allPhotoInfoProviders](self, "allPhotoInfoProviders", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "largestPhoto");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (!v5
          || (objc_msgSend(v8, "size"), v11 = v10, objc_msgSend(v5, "size"), v11 > v12)
          && (objc_msgSend(v9, "size"), v14 = v13, objc_msgSend(v5, "size"), v14 > v15))
        {
          v16 = v9;

          v5 = v16;
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultPhotoInfoProvider, 0);
  objc_storeStrong((id *)&self->_ampPhotoInfoProvider, 0);
  objc_storeStrong((id *)&self->_originalPhotoContent, 0);
}

@end
