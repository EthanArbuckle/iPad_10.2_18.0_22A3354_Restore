@implementation SUUIProductPageInformationViewController

- (SUUIProductPageInformationViewController)initWithItem:(id)a3 clientContext:(id)a4
{
  id v7;
  id v8;
  SUUIProductPageInformationViewController *v9;
  SUUIProductPageInformationViewController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SUUIProductPageInformationViewController;
  v9 = -[SUUIProductPageInformationViewController init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_clientContext, a4);
    objc_storeStrong((id *)&v10->_item, a3);
  }

  return v10;
}

- (SUUIProductPageInformationViewController)initWithProductInformation:(id)a3 clientContext:(id)a4
{
  id v7;
  id v8;
  SUUIProductPageInformationViewController *v9;
  SUUIProductPageInformationViewController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SUUIProductPageInformationViewController;
  v9 = -[SUUIProductPageInformationViewController init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_clientContext, a4);
    objc_storeStrong((id *)&v10->_productInfo, a3);
  }

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[SUUIContentRatingArtworkResourceLoader removeObserver:](self->_contentRatingArtworkLoader, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)SUUIProductPageInformationViewController;
  -[SUUIProductPageInformationViewController dealloc](&v3, sel_dealloc);
}

- (void)loadView
{
  SUUIProductInformationView *v3;
  SUUIProductInformationView *informationView;
  SUUIProductInformationView *v5;
  SUUIClientContext *clientContext;
  void *v7;
  void *v8;
  uint64_t v9;
  SUUIContentRatingArtworkResourceLoader *v10;
  SUUIContentRatingArtworkResourceLoader *contentRatingArtworkLoader;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;

  v3 = objc_alloc_init(SUUIProductInformationView);
  informationView = self->_informationView;
  self->_informationView = v3;

  v5 = self->_informationView;
  clientContext = self->_clientContext;
  if (clientContext)
    -[SUUIClientContext localizedStringForKey:inTable:](clientContext, "localizedStringForKey:inTable:", CFSTR("PRODUCT_PAGE_INFO_TITLE"), CFSTR("ProductPage"));
  else
    +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("PRODUCT_PAGE_INFO_TITLE"), 0, CFSTR("ProductPage"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIProductInformationView setTitle:](v5, "setTitle:", v7);

  -[SUUIProductPageItem secondaryContentRatings](self->_item, "secondaryContentRatings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    if (!self->_contentRatingArtworkLoader)
    {
      -[SUUIProductPageInformationViewController _contentRatingResourceLoader](self, "_contentRatingResourceLoader");
      v10 = (SUUIContentRatingArtworkResourceLoader *)objc_claimAutoreleasedReturnValue();
      contentRatingArtworkLoader = self->_contentRatingArtworkLoader;
      self->_contentRatingArtworkLoader = v10;

      -[SUUIContentRatingArtworkResourceLoader addObserver:](self->_contentRatingArtworkLoader, "addObserver:", self);
    }
    -[SUUIProductPageItem secondaryContentRatings](self->_item, "secondaryContentRatings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lastObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[SUUIContentRatingArtworkResourceLoader cachedImageForContentRating:withClientContext:](self->_contentRatingArtworkLoader, "cachedImageForContentRating:withClientContext:", v13, self->_clientContext);
    v14 = objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      -[SUUIContentRatingArtworkResourceLoader loadImageForContentRating:clientContent:reason:](self->_contentRatingArtworkLoader, "loadImageForContentRating:clientContent:reason:", v13, self->_clientContext, 1);
      -[SUUIContentRatingArtworkResourceLoader placeholderImage](self->_contentRatingArtworkLoader, "placeholderImage");
      v14 = objc_claimAutoreleasedReturnValue();
    }
    v15 = (id)v14;

  }
  else
  {
    v15 = 0;
  }
  -[SUUIProductPageInformationViewController _updateLinesWithRatingImage:](self, "_updateLinesWithRatingImage:", v15);
  -[SUUIProductPageInformationViewController setView:](self, "setView:", self->_informationView);

}

- (void)contentRatingArtworkLoader:(id)a3 didLoadImage:(id)a4 forContentRating:(id)a5
{
  -[SUUIProductPageInformationViewController _updateLinesWithRatingImage:](self, "_updateLinesWithRatingImage:", a4);
}

- (id)_contentRatingResourceLoader
{
  SUUIResourceLoader *v3;
  void *v4;
  SUUIResourceLoader *v5;
  SUUIContentRatingArtworkResourceLoader *v6;
  void *v7;

  v3 = [SUUIResourceLoader alloc];
  -[SUUIProductPageInformationViewController clientContext](self, "clientContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SUUIResourceLoader initWithClientContext:](v3, "initWithClientContext:", v4);

  v6 = -[SUUIContentRatingArtworkResourceLoader initWithArtworkLoader:]([SUUIContentRatingArtworkResourceLoader alloc], "initWithArtworkLoader:", v5);
  +[SUUIStyledImageDataConsumer appIconConsumerWithSize:](SUUIStyledImageDataConsumer, "appIconConsumerWithSize:", 11.0, 11.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIContentRatingArtworkResourceLoader setImageDataConsumer:](v6, "setImageDataConsumer:", v7);

  return v6;
}

- (id)_informationLinesWithItem:(id)a3 ratingImage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  SUUIClientContext *clientContext;
  SUUIClientContext *v13;
  SUUIClientContext *v14;
  id v15;
  void *v16;
  void **v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  SUUIClientContext *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  SUUIClientContext *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  SUUIClientContext *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  SUUIClientContext *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  id v43;
  void *v44;
  SUUIClientContext *v45;
  void *v46;
  uint64_t v47;
  char isKindOfClass;
  SUUIClientContext *v49;
  id v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  void *v60;
  void *v61;
  SUUIClientContext *v62;
  id v63;
  id v64;
  SUUIClientContext *v65;
  SUUIClientContext *v66;
  SUUIClientContext *v67;
  SUUIClientContext *v68;
  void *v69;
  void *v70;
  void *v71;
  SUUIClientContext *v72;
  id v73;
  void *v74;
  id v75;
  id v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  SUUIClientContext *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  SUUIClientContext *v85;
  id v86;
  void *v87;
  void *v88;
  uint64_t v90;
  uint64_t v91;
  id v92;
  uint64_t v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  _QWORD v100[4];
  id v101;
  id v102;
  _QWORD v103[2];
  _QWORD v104[3];
  _QWORD v105[2];
  _QWORD v106[2];
  _QWORD v107[3];
  _QWORD v108[2];
  _QWORD v109[2];
  _QWORD v110[2];
  _QWORD v111[2];
  _QWORD v112[2];
  void *v113;
  void *v114;
  void *v115;
  _QWORD v116[4];

  v116[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "artistName");
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sellerName");
  v10 = objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v11 = 0x24BDBC000uLL;
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    clientContext = self->_clientContext;
    if (clientContext)
    {
      -[SUUIClientContext localizedStringForKey:inTable:](clientContext, "localizedStringForKey:inTable:", CFSTR("PRODUCT_PAGE_INFO_SELLER"), CFSTR("ProductPage"));
    }
    else
    {
      v19 = 0;
      +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("PRODUCT_PAGE_INFO_SELLER"), 0, CFSTR("ProductPage"));
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v116[0] = v20;
    v116[1] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v116, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v21);

    v22 = self->_clientContext;
    if (v22)
    {
      -[SUUIClientContext localizedStringForKey:inTable:](v22, "localizedStringForKey:inTable:", CFSTR("PRODUCT_PAGE_INFO_DEVELOPER"), CFSTR("ProductPage"));
    }
    else
    {
      v23 = 0;
      +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("PRODUCT_PAGE_INFO_DEVELOPER"), 0, CFSTR("ProductPage"));
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v115 = v16;
    v17 = &v115;
    v18 = v9;
    v11 = 0x24BDBC000;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = self->_clientContext;
      if (v13)
      {
        -[SUUIClientContext localizedStringForKey:inTable:](v13, "localizedStringForKey:inTable:", CFSTR("PRODUCT_PAGE_INFO_SELLER"), CFSTR("ProductPage"));
      }
      else
      {
        v15 = 0;
        +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("PRODUCT_PAGE_INFO_SELLER"), 0, CFSTR("ProductPage"));
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v114 = v16;
      v17 = &v114;
      v18 = v10;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_21;
      v14 = self->_clientContext;
      if (v14)
      {
        -[SUUIClientContext localizedStringForKey:inTable:](v14, "localizedStringForKey:inTable:", CFSTR("PRODUCT_PAGE_INFO_SELLER"), CFSTR("ProductPage"));
      }
      else
      {
        v24 = 0;
        +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("PRODUCT_PAGE_INFO_SELLER"), 0, CFSTR("ProductPage"));
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v113 = v16;
      v17 = &v113;
      v18 = v9;
    }
  }
  v17[1] = (void *)v18;
  objc_msgSend(*(id *)(v11 + 3632), "arrayWithObjects:count:");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v25);

LABEL_21:
  objc_msgSend(v6, "categoryName");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v27 = self->_clientContext;
    if (v27)
    {
      -[SUUIClientContext localizedStringForKey:inTable:](v27, "localizedStringForKey:inTable:", CFSTR("PRODUCT_PAGE_INFO_CATEGORY"), CFSTR("ProductPage"));
    }
    else
    {
      v28 = 0;
      +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("PRODUCT_PAGE_INFO_CATEGORY"), 0, CFSTR("ProductPage"));
    }
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v112[0] = v29;
    v112[1] = v26;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v112, 2);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v30);

  }
  v98 = (void *)v10;
  if (-[SUUIItem itemKind](self->_item, "itemKind") == 17)
  {
    v31 = v26;
  }
  else
  {
    -[SUUIProductPageItem lastUpdateDateString](self->_item, "lastUpdateDateString");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v32 = self->_clientContext;
      if (v32)
      {
        -[SUUIClientContext localizedStringForKey:inTable:](v32, "localizedStringForKey:inTable:", CFSTR("PRODUCT_PAGE_INFO_UPDATED"), CFSTR("ProductPage"));
      }
      else
      {
        v33 = 0;
        +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("PRODUCT_PAGE_INFO_UPDATED"), 0, CFSTR("ProductPage"));
      }
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      v111[0] = v34;
      v111[1] = v31;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v111, 2);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v35);

    }
  }
  -[SUUIItem versionString](self->_item, "versionString");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v37 = self->_clientContext;
    if (v37)
    {
      -[SUUIClientContext localizedStringForKey:inTable:](v37, "localizedStringForKey:inTable:", CFSTR("PRODUCT_PAGE_INFO_VERSION"), CFSTR("ProductPage"));
    }
    else
    {
      v38 = 0;
      +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("PRODUCT_PAGE_INFO_VERSION"), 0, CFSTR("ProductPage"));
    }
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    v110[0] = v39;
    v110[1] = v36;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v110, 2);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v40);

  }
  v99 = (void *)v9;
  if (objc_msgSend(v6, "itemKind") == 17)
  {
    objc_msgSend(v6, "childItemIdentifiers");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "count");

    if (v42 < 2)
    {
      v97 = v36;
      goto LABEL_53;
    }
    v43 = objc_alloc_init(MEMORY[0x24BDD16F0]);
    objc_msgSend(v43, "setNumberStyle:", 1);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v42);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "stringFromNumber:", v44);
    v47 = objc_claimAutoreleasedReturnValue();

    v45 = self->_clientContext;
    if (v45)
    {
      -[SUUIClientContext localizedStringForKey:inTable:](v45, "localizedStringForKey:inTable:", CFSTR("PRODUCT_PAGE_INFO_BUNDLE_APP_COUNT"), CFSTR("ProductPage"));
    }
    else
    {
      v50 = 0;
      +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("PRODUCT_PAGE_INFO_BUNDLE_APP_COUNT"), 0, CFSTR("ProductPage"));
    }
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    v108[0] = v51;
    v108[1] = v47;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v108, 2);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v52);

  }
  else
  {
    objc_msgSend(v6, "primaryItemOffer");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "fileSizeText");
    v47 = objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) == 0)
    {
      v97 = (void *)v47;
      goto LABEL_53;
    }
    v49 = self->_clientContext;
    if (v49)
    {
      -[SUUIClientContext localizedStringForKey:inTable:](v49, "localizedStringForKey:inTable:", CFSTR("PRODUCT_PAGE_INFO_SIZE"), CFSTR("ProductPage"));
    }
    else
    {
      v53 = 0;
      +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("PRODUCT_PAGE_INFO_SIZE"), 0, CFSTR("ProductPage"));
    }
    v43 = (id)objc_claimAutoreleasedReturnValue();

    v109[0] = v43;
    v109[1] = v47;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v109, 2);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v51);
  }
  v97 = (void *)v47;

LABEL_53:
  objc_msgSend(v6, "contentRating");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "contentRatingName");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_104;
  v92 = v7;
  v57 = objc_msgSend(v6, "ageBandRange");
  if (v57 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v96 = 0;
    v94 = 0;
  }
  else
  {
    v58 = v56;
    v59 = objc_alloc_init(MEMORY[0x24BDD16F0]);
    objc_msgSend(v59, "setNumberStyle:", 1);
    objc_msgSend(v59, "setUsesGroupingSeparator:", 0);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v57);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "stringFromNumber:", v60);
    v94 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v57 + v58);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "stringFromNumber:", v61);
    v96 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v54, "contentRatingAdvisories");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = self->_clientContext;
  if (v62)
  {
    -[SUUIClientContext localizedStringForKey:inTable:](v62, "localizedStringForKey:inTable:", CFSTR("PRODUCT_PAGE_INFO_RATING"), CFSTR("ProductPage"));
  }
  else
  {
    v63 = 0;
    +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("PRODUCT_PAGE_INFO_RATING"), 0, CFSTR("ProductPage"));
  }
  v93 = objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v95, "count"))
  {
    v64 = objc_alloc_init(MEMORY[0x24BDD16A8]);
    if (v57 || !v96)
    {
      v67 = self->_clientContext;
      if (v94 && v96)
      {
        if (v67)
          -[SUUIClientContext localizedStringForKey:inTable:](v67, "localizedStringForKey:inTable:", CFSTR("PRODUCT_PAGE_INFO_RATED_FOR_WITH_AGE_BAND"), CFSTR("ProductPage"));
        else
          +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("PRODUCT_PAGE_INFO_RATED_FOR_WITH_AGE_BAND"), 0, CFSTR("ProductPage"));
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", v69, CFSTR("%@%@%@"), 0, v94, v96, v55);
      }
      else
      {
        if (v67)
          -[SUUIClientContext localizedStringForKey:inTable:](v67, "localizedStringForKey:inTable:", CFSTR("PRODUCT_PAGE_INFO_RATED_FOR"), CFSTR("ProductPage"));
        else
          +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("PRODUCT_PAGE_INFO_RATED_FOR"), 0, CFSTR("ProductPage"));
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", v69, CFSTR("%@"), 0, v55, v90, v91);
      }
    }
    else
    {
      v65 = self->_clientContext;
      if (v65)
        -[SUUIClientContext localizedStringForKey:inTable:](v65, "localizedStringForKey:inTable:", CFSTR("PRODUCT_PAGE_INFO_RATED_FOR_WITH_AGE_MINIMUM"), CFSTR("ProductPage"));
      else
        +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("PRODUCT_PAGE_INFO_RATED_FOR_WITH_AGE_MINIMUM"), 0, CFSTR("ProductPage"));
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", v69, CFSTR("%@%@"), 0, v96, v55, v91);
    }
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "appendString:", v71);

    v72 = self->_clientContext;
    if (v72)
    {
      -[SUUIClientContext localizedStringForKey:inTable:](v72, "localizedStringForKey:inTable:", CFSTR("PRODUCT_PAGE_INFO_RATING_ADVISORY"), CFSTR("ProductPage"));
    }
    else
    {
      v73 = 0;
      +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("PRODUCT_PAGE_INFO_RATING_ADVISORY"), 0, CFSTR("ProductPage"));
    }
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v92;

    v100[0] = MEMORY[0x24BDAC760];
    v100[1] = 3221225472;
    v100[2] = __82__SUUIProductPageInformationViewController__informationLinesWithItem_ratingImage___block_invoke;
    v100[3] = &unk_2511FA950;
    v75 = v64;
    v101 = v75;
    v76 = v74;
    v102 = v76;
    objc_msgSend(v95, "enumerateObjectsUsingBlock:", v100);
    v105[0] = v93;
    v105[1] = v75;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v105, 2);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v77);

    if (v92)
    {
      v104[0] = &stru_2511FF0C8;
      v104[1] = &stru_2511FF0C8;
      v104[2] = v92;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v104, 3);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v78);

    }
    v79 = (void *)v93;
    goto LABEL_103;
  }
  if (v57 || !v96)
  {
    if (!v94)
    {
      v7 = v92;
      goto LABEL_97;
    }
    v7 = v92;
    if (!v96)
      goto LABEL_97;
    v68 = self->_clientContext;
    if (v68)
      -[SUUIClientContext localizedStringForKey:inTable:](v68, "localizedStringForKey:inTable:", CFSTR("PRODUCT_PAGE_INFO_RATING_WITH_AGE_BAND"), CFSTR("ProductPage"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("PRODUCT_PAGE_INFO_RATING_WITH_AGE_BAND"), 0, CFSTR("ProductPage"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", v70, CFSTR("%@%@%@"), 0, v55, v94, v96);
  }
  else
  {
    v66 = self->_clientContext;
    if (v66)
      -[SUUIClientContext localizedStringForKey:inTable:](v66, "localizedStringForKey:inTable:", CFSTR("PRODUCT_PAGE_INFO_RATING_WITH_AGE_MINIMUM"), CFSTR("ProductPage"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("PRODUCT_PAGE_INFO_RATING_WITH_AGE_MINIMUM"), 0, CFSTR("ProductPage"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v92;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", v70, CFSTR("%@%@"), 0, v55, v96, v91);
  }
  v80 = objc_claimAutoreleasedReturnValue();

  v55 = (void *)v80;
LABEL_97:
  if (v7)
  {
    v81 = self->_clientContext;
    if (v81)
      -[SUUIClientContext localizedStringForKey:inTable:](v81, "localizedStringForKey:inTable:", CFSTR("PRODUCT_PAGE_INFO_RATING_WITH_SECONDARY_TYPE"), CFSTR("ProductPage"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("PRODUCT_PAGE_INFO_RATING_WITH_SECONDARY_TYPE"), 0, CFSTR("ProductPage"));
    v75 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", v75, CFSTR("%@"), 0, v55);
    v82 = objc_claimAutoreleasedReturnValue();

    v107[0] = v93;
    v107[1] = v82;
    v107[2] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v107, 3);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v83);

    v79 = (void *)v93;
    v55 = (void *)v82;
  }
  else
  {
    v79 = (void *)v93;
    v106[0] = v93;
    v106[1] = v55;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v106, 2);
    v75 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v75);
  }
LABEL_103:

LABEL_104:
  objc_msgSend(v6, "installationRequirementsDescription");
  v84 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v85 = self->_clientContext;
    if (v85)
    {
      -[SUUIClientContext localizedStringForKey:inTable:](v85, "localizedStringForKey:inTable:", CFSTR("PRODUCT_PAGE_INFO_REQUIRES"), CFSTR("ProductPage"));
    }
    else
    {
      v86 = 0;
      +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("PRODUCT_PAGE_INFO_REQUIRES"), 0, CFSTR("ProductPage"));
    }
    v87 = (void *)objc_claimAutoreleasedReturnValue();

    v103[0] = v87;
    v103[1] = v84;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v103, 2);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v88);

  }
  return v8;
}

void __82__SUUIProductPageInformationViewController__informationLinesWithItem_ratingImage___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if (a3)
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));
  v5 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", *(_QWORD *)(a1 + 40), CFSTR("%@"), 0, v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:", v6);

}

- (id)_informationLinesWithProductInfo:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = (void *)MEMORY[0x24BDBCEB8];
  v4 = a3;
  objc_msgSend(v3, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __77__SUUIProductPageInformationViewController__informationLinesWithProductInfo___block_invoke;
  v8[3] = &unk_2511FDA28;
  v6 = v5;
  v9 = v6;
  objc_msgSend(v4, "enumerateEntriesWithBlock:", v8);

  return v6;
}

void __77__SUUIProductPageInformationViewController__informationLinesWithProductInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;

  v5 = (objc_class *)MEMORY[0x24BDBCE30];
  v6 = a3;
  v7 = a2;
  v8 = (id)objc_msgSend([v5 alloc], "initWithObjects:", v7, v6, 0);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);
}

- (void)_updateLinesWithRatingImage:(id)a3
{
  SUUIProductPageProductInfo *productInfo;
  id v6;

  productInfo = self->_productInfo;
  if (productInfo)
    -[SUUIProductPageInformationViewController _informationLinesWithProductInfo:](self, "_informationLinesWithProductInfo:", productInfo, a3);
  else
    -[SUUIProductPageInformationViewController _informationLinesWithItem:ratingImage:](self, "_informationLinesWithItem:ratingImage:", self->_item, a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SUUIProductInformationView setInformationLines:](self->_informationView, "setInformationLines:", v6);

}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (SUUIProductPageItem)item
{
  return self->_item;
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_operationQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_productInfo, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_informationView, 0);
  objc_storeStrong((id *)&self->_contentRatingArtworkLoader, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end
