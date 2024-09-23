@implementation MPArtworkColorAnalyzer

+ (id)translateFromMLColorAnalysis:(id)a3
{
  id v3;
  MPMutableArtworkColorAnalysis *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3;
  v4 = objc_alloc_init(MPMutableArtworkColorAnalysis);
  objc_msgSend(v3, "backgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "MP_colorFromHexString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPMutableArtworkColorAnalysis setBackgroundColor:](v4, "setBackgroundColor:", v6);

  -[MPMutableArtworkColorAnalysis setBackgroundColorLight:](v4, "setBackgroundColorLight:", objc_msgSend(v3, "isBackgroundColorLight"));
  objc_msgSend(v3, "primaryTextColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "MP_colorFromHexString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPMutableArtworkColorAnalysis setPrimaryTextColor:](v4, "setPrimaryTextColor:", v8);

  -[MPMutableArtworkColorAnalysis setPrimaryTextColorLight:](v4, "setPrimaryTextColorLight:", objc_msgSend(v3, "isPrimaryTextColorLight"));
  objc_msgSend(v3, "secondaryTextColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "MP_colorFromHexString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPMutableArtworkColorAnalysis setSecondaryTextColor:](v4, "setSecondaryTextColor:", v10);

  -[MPMutableArtworkColorAnalysis setSecondaryTextColorLight:](v4, "setSecondaryTextColorLight:", objc_msgSend(v3, "isSecondaryTextColorLight"));
  objc_msgSend(v3, "tertiaryTextColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "MP_colorFromHexString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPMutableArtworkColorAnalysis setTertiaryTextColor:](v4, "setTertiaryTextColor:", v12);

  -[MPMutableArtworkColorAnalysis setTertiaryTextColorLight:](v4, "setTertiaryTextColorLight:", objc_msgSend(v3, "isTertiaryTextColorLight"));
  return v4;
}

- (MPArtworkColorAnalyzer)initWithImage:(id)a3
{
  id v5;
  MPArtworkColorAnalyzer *v6;
  MPArtworkColorAnalyzer *v7;

  v5 = a3;
  v6 = -[MPArtworkColorAnalyzer init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_image, a3);

  return v7;
}

- (id)analyze
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  MPMutableArtworkColorAnalysis *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = objc_alloc(MEMORY[0x1E0D4D000]);
  -[MPArtworkColorAnalyzer image](self, "image");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = (void *)objc_msgSend(v3, "initWithSourceImage:", objc_msgSend(v4, "CGImage"));

  objc_msgSend(v5, "analyze");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MPMutableArtworkColorAnalysis);
  objc_msgSend(v6, "backgroundColorHex");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "MP_colorFromHexString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPMutableArtworkColorAnalysis setBackgroundColor:](v7, "setBackgroundColor:", v9);

  -[MPMutableArtworkColorAnalysis setBackgroundColorLight:](v7, "setBackgroundColorLight:", objc_msgSend(v6, "isBackgroundColorLight"));
  objc_msgSend(v6, "primaryTextColorHex");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "MP_colorFromHexString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPMutableArtworkColorAnalysis setPrimaryTextColor:](v7, "setPrimaryTextColor:", v11);

  -[MPMutableArtworkColorAnalysis setPrimaryTextColorLight:](v7, "setPrimaryTextColorLight:", objc_msgSend(v6, "isPrimaryTextColorLight"));
  objc_msgSend(v6, "secondaryTextColorHex");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "MP_colorFromHexString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPMutableArtworkColorAnalysis setSecondaryTextColor:](v7, "setSecondaryTextColor:", v13);

  -[MPMutableArtworkColorAnalysis setSecondaryTextColorLight:](v7, "setSecondaryTextColorLight:", objc_msgSend(v6, "isSecondaryTextColorLight"));
  objc_msgSend(v6, "tertiaryTextColorHex");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "MP_colorFromHexString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPMutableArtworkColorAnalysis setTertiaryTextColor:](v7, "setTertiaryTextColor:", v15);

  -[MPMutableArtworkColorAnalysis setTertiaryTextColorLight:](v7, "setTertiaryTextColorLight:", objc_msgSend(v6, "isTertiaryTextColorLight"));
  return v7;
}

- (void)analyzeWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatch_get_global_queue(0, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__MPArtworkColorAnalyzer_analyzeWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E3162560;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (id)_fallbackColorAnalysis
{
  MPMutableArtworkColorAnalysis *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = objc_alloc_init(MPMutableArtworkColorAnalysis);
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPMutableArtworkColorAnalysis setBackgroundColor:](v2, "setBackgroundColor:", v3);

  -[MPMutableArtworkColorAnalysis setBackgroundColorLight:](v2, "setBackgroundColorLight:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPMutableArtworkColorAnalysis setPrimaryTextColor:](v2, "setPrimaryTextColor:", v4);

  -[MPMutableArtworkColorAnalysis setPrimaryTextColorLight:](v2, "setPrimaryTextColorLight:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "darkGrayColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPMutableArtworkColorAnalysis setSecondaryTextColor:](v2, "setSecondaryTextColor:", v5);

  -[MPMutableArtworkColorAnalysis setSecondaryTextColorLight:](v2, "setSecondaryTextColorLight:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "darkGrayColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPMutableArtworkColorAnalysis setTertiaryTextColor:](v2, "setTertiaryTextColor:", v6);

  -[MPMutableArtworkColorAnalysis setTertiaryTextColorLight:](v2, "setTertiaryTextColorLight:", 0);
  return v2;
}

- (UIImage)image
{
  return self->_image;
}

- (int64_t)algorithm
{
  return self->_algorithm;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
}

void __55__MPArtworkColorAnalyzer_analyzeWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "analyze");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);

}

@end
