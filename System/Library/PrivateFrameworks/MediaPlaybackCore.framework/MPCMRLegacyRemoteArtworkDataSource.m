@implementation MPCMRLegacyRemoteArtworkDataSource

- (BOOL)areRepresentationsAvailableForCatalog:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a3, "token");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "artworkProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isValid");

  return v5;
}

- (id)supportedSizesForCatalog:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  CGFloat v14;
  CGFloat v15;
  void *v16;
  id v17;
  void *v18;
  int v19;
  void *v20;
  CGFloat v21;
  CGFloat v22;
  id v23;
  void *v24;

  objc_msgSend(a3, "token");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "artworkProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "artworkInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "type");
  if (v7 == 2)
  {
    objc_msgSend(v6, "supportedSizes");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "count"))
    {
      v19 = objc_msgSend(v6, "hasMaxSupportedSize");

      if (v19)
      {
        objc_msgSend(v6, "supportedSizes");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "maxSupportedSize");
        _MPCRemotePlayerArtworkDataSourceValidSupportedSizes(v20, v21, v22);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v13, "count"))
        {
          v23 = v13;
        }
        else
        {
          +[MPCMRLegacyRemoteArtworkDataSource bestArtworkSizes](MPCMRLegacyRemoteArtworkDataSource, "bestArtworkSizes");
          v23 = (id)objc_claimAutoreleasedReturnValue();
        }
        v24 = v23;
        goto LABEL_16;
      }
    }
    else
    {

    }
  }
  else if (v7 == 1 && objc_msgSend(v6, "hasMaxSupportedSize"))
  {
    objc_msgSend(MEMORY[0x24BDDC6E0], "systemConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "artworkProperties");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "mediaType");
    objc_msgSend(v3, "artworkProperties");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "supportedSizesForMediaType:artworkType:", v10, objc_msgSend(v11, "mediaLibraryArtworkType"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "allObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "maxSupportedSize");
    _MPCRemotePlayerArtworkDataSourceValidSupportedSizes(v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "count"))
    {
      v17 = v16;
    }
    else
    {
      +[MPCMRLegacyRemoteArtworkDataSource bestArtworkSizes](MPCMRLegacyRemoteArtworkDataSource, "bestArtworkSizes");
      v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    v24 = v17;

LABEL_16:
    goto LABEL_17;
  }
  +[MPCMRLegacyRemoteArtworkDataSource bestArtworkSizes](MPCMRLegacyRemoteArtworkDataSource, "bestArtworkSizes");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:

  return v24;
}

- (id)_urlForCatalog:(id)a3 size:(CGSize)a4
{
  double height;
  double width;
  id v6;
  double v7;
  double v8;
  double v9;
  BOOL v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  height = a4.height;
  width = a4.width;
  v6 = a3;
  MSVGetMaximumScreenSize();
  if (height >= width)
    v9 = height;
  else
    v9 = width;
  if (v8 >= v7)
    v7 = v8;
  if (v9 > v7
    || (width == *MEMORY[0x24BDBF148] ? (v10 = height == *(double *)(MEMORY[0x24BDBF148] + 8)) : (v10 = 0), v10))
  {
    MSVGetMaximumScreenSize();
    width = v11;
    height = v12;
  }
  objc_msgSend(v6, "token");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "artworkProperties");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "artworkInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "artworkURLWithSize:cropStyle:format:preferP3ColorSpace:", *MEMORY[0x24BEC8648], *MEMORY[0x24BEC8660], MSVDeviceSupportsExtendedColorDisplay(), width, height);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)requestForCatalog:(id)a3 size:(CGSize)a4
{
  void *v4;
  void *v5;

  -[MPCMRLegacyRemoteArtworkDataSource _urlForCatalog:size:](self, "_urlForCatalog:size:", a3, a4.width, a4.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1840], "requestWithURL:cachePolicy:timeoutInterval:", v4, 0, 60.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)getExportableArtworkPropertiesForCatalog:(id)a3 completionHandler:(id)a4
{
  void (**v5)(id, void *, _QWORD);
  void *v6;
  id v7;

  v5 = (void (**)(id, void *, _QWORD))a4;
  objc_msgSend(a3, "token");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "artworkProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v6, 0);

}

+ (MPCMRLegacyRemoteArtworkDataSource)sharedDataSource
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__MPCMRLegacyRemoteArtworkDataSource_sharedDataSource__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedDataSource_onceToken != -1)
    dispatch_once(&sharedDataSource_onceToken, block);
  return (MPCMRLegacyRemoteArtworkDataSource *)(id)sharedDataSource___sharedDataSource;
}

+ (id)bestArtworkSizes
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGSize:", 1.79769313e308, 1.79769313e308);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __54__MPCMRLegacyRemoteArtworkDataSource_sharedDataSource__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedDataSource___sharedDataSource;
  sharedDataSource___sharedDataSource = (uint64_t)v1;

}

@end
