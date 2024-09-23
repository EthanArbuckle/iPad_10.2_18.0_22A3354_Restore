@implementation SUUIURLActivityItemProvider

+ (id)placeholderItem
{
  return objc_alloc_init(MEMORY[0x24BDBCF48]);
}

- (SUUIURLActivityItemProvider)initWithProductPageItemProvider:(id)a3 clientContext:(id)a4
{
  id v6;
  id v7;
  SUUIResourceLoader *v8;
  SUUIResourceLoader *resourceLoader;
  SUUIResourceLoader *v10;
  void *v11;
  SUUIURLActivityItemProvider *v12;
  objc_super v14;

  v6 = a4;
  v7 = a3;
  v8 = -[SUUIResourceLoader initWithClientContext:]([SUUIResourceLoader alloc], "initWithClientContext:", v6);
  resourceLoader = self->_resourceLoader;
  self->_resourceLoader = v8;

  v10 = self->_resourceLoader;
  SUUIResourceLoaderGetNameForObject(self);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIResourceLoader setName:](v10, "setName:", v11);

  v14.receiver = self;
  v14.super_class = (Class)SUUIURLActivityItemProvider;
  v12 = -[SUUIDeferredActivityItemProvider initWithProductPageItemProvider:clientContext:](&v14, sel_initWithProductPageItemProvider_clientContext_, v7, v6);

  return v12;
}

- (SUUIURLActivityItemProvider)initWithProductPageItem:(id)a3 clientContext:(id)a4
{
  id v6;
  id v7;
  SUUIResourceLoader *v8;
  SUUIResourceLoader *resourceLoader;
  SUUIResourceLoader *v10;
  void *v11;
  SUUIURLActivityItemProvider *v12;
  objc_super v14;

  v6 = a4;
  v7 = a3;
  v8 = -[SUUIResourceLoader initWithClientContext:]([SUUIResourceLoader alloc], "initWithClientContext:", v6);
  resourceLoader = self->_resourceLoader;
  self->_resourceLoader = v8;

  v10 = self->_resourceLoader;
  SUUIResourceLoaderGetNameForObject(self);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIResourceLoader setName:](v10, "setName:", v11);

  v14.receiver = self;
  v14.super_class = (Class)SUUIURLActivityItemProvider;
  v12 = -[SUUIDeferredActivityItemProvider initWithProductPageItem:clientContext:](&v14, sel_initWithProductPageItem_clientContext_, v7, v6);

  return v12;
}

- (id)item
{
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];

  v15[3] = *MEMORY[0x24BDAC8D0];
  NSLog(CFSTR("Fetching URL item provider"), a2);
  v3 = *MEMORY[0x24BDF7488];
  v15[0] = *MEMORY[0x24BDF7470];
  v15[1] = v3;
  v15[2] = *MEMORY[0x24BDF7480];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIActivityItemProvider activityType](self, "activityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsObject:", v5);

  -[SUUIDeferredActivityItemProvider productPageItem](self, "productPageItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v6)
  {
    objc_msgSend(v7, "shortenedProductPageURLString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v9 = v11;
    }
    else
    {
      -[SUUIDeferredActivityItemProvider productPageItem](self, "productPageItem");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "productPageURLString");
      v9 = (id)objc_claimAutoreleasedReturnValue();

    }
    if (v9)
      goto LABEL_3;
LABEL_8:
    v10 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v7, "productPageURLString");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  NSLog(CFSTR("FetchEd URL item provider"));
  if (!v9)
    goto LABEL_8;
LABEL_3:
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return v10;
}

- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4
{
  void *v4;
  void *v5;

  -[SUUIDeferredActivityItemProvider productPageItem](self, "productPageItem", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)activityViewController:(id)a3 thumbnailImageForActivityType:(id)a4 suggestedSize:(CGSize)a5
{
  double height;
  double width;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  height = a5.height;
  width = a5.width;
  v9 = a3;
  v10 = a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__28;
  v24 = __Block_byref_object_dispose__28;
  v25 = 0;
  -[SUUIDeferredActivityItemProvider productPageItem](self, "productPageItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "artworksProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bestArtworkForScaledSize:", width, height);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "URL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB2040]), "initWithURL:", v14);
    +[SUUIStyledImageDataConsumer appIconConsumerWithSize:](SUUIStyledImageDataConsumer, "appIconConsumerWithSize:", width, height);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setDataConsumer:", v16);

    objc_msgSend(v15, "setITunesStoreRequest:", 0);
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __98__SUUIURLActivityItemProvider_activityViewController_thumbnailImageForActivityType_suggestedSize___block_invoke;
    v19[3] = &unk_2511F5178;
    v19[4] = &v20;
    objc_msgSend(v15, "setOutputBlock:", v19);
    objc_msgSend(v15, "main");

  }
  v17 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v17;
}

void __98__SUUIURLActivityItemProvider_activityViewController_thumbnailImageForActivityType_suggestedSize___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)activityViewControllerLinkMetadata:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v40;
  void *v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  -[SUUIDeferredActivityItemProvider productPageItem](self, "productPageItem", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "shortenedProductPageURLString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[SUUIDeferredActivityItemProvider productPageItem](self, "productPageItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "productPageURLString");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIDeferredActivityItemProvider productPageItem](self, "productPageItem");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  v12 = 0;
  if (v9 && v10)
  {
    v41 = v9;
    v42 = v7;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    objc_msgSend(v11, "screenshots");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v44 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * i), "URLForVariant:", CFSTR("low-dpi"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
          {
            -[SUUIURLActivityItemProvider linkPresentationImageFor:](self, "linkPresentationImageFor:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "addObject:", v20);

          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      }
      while (v16);
    }

    objc_msgSend(v11, "videos");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "firstObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "artworks");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "bestArtworkForScaledSize:", 300.0, 300.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "URL");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_alloc_init(MEMORY[0x24BDDA8B0]);
    v9 = v41;
    objc_msgSend(v12, "setURL:", v41);
    objc_msgSend(v11, "title");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTitle:", v25);

    v26 = objc_alloc_init(MEMORY[0x24BDDA8F0]);
    objc_msgSend(v11, "title");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setName:", v27);

    objc_msgSend(v11, "artistName");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setSubtitle:", v28);

    objc_msgSend(v11, "artworksProvider");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "bestArtworkForScaledSize:", 40.0, 40.0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "URL");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      -[SUUIURLActivityItemProvider linkPresentationImageFor:](self, "linkPresentationImageFor:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setIcon:", v32);

    }
    objc_msgSend(v11, "storeIdentifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "stringValue");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setStoreIdentifier:", v34);

    -[SUUIDeferredActivityItemProvider clientContext](self, "clientContext");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "storeFrontIdentifier");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setStoreFrontIdentifier:", v36);

    objc_msgSend(v11, "categoryName");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setGenre:", v37);

    objc_msgSend(v26, "setPlatform:", CFSTR("iOS"));
    objc_msgSend(v26, "setScreenshots:", v13);
    v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDA8D0]), "initWithStreamingURL:hasAudio:", v40, 0);
    objc_msgSend(v26, "setPreviewVideo:", v38);

    objc_msgSend(v26, "setIsMessagesOnlyApp:", 0);
    objc_msgSend(v26, "setMessagesAppIcon:", 0);
    objc_msgSend(v12, "setSpecialization:", v26);

    v7 = v42;
  }

  return v12;
}

- (id)linkPresentationImageFor:(id)a3
{
  id v4;
  SUUIArtworkItemProvider *v5;
  void *v6;

  v4 = a3;
  v5 = -[SUUIArtworkItemProvider initWithURL:usingResourceLoader:]([SUUIArtworkItemProvider alloc], "initWithURL:usingResourceLoader:", v4, self->_resourceLoader);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDA898]), "initWithItemProvider:properties:placeholderImage:", v5, 0, 0);
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceLoader, 0);
}

@end
