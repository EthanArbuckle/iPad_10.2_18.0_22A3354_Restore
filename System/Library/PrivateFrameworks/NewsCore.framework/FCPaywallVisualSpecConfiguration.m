@implementation FCPaywallVisualSpecConfiguration

- (FCPaywallVisualSpecConfiguration)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCPaywallVisualSpecConfiguration init]";
    v9 = 2080;
    v10 = "FCPaywallVisualSpecConfiguration.m";
    v11 = 1024;
    v12 = 42;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCPaywallVisualSpecConfiguration init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (FCPaywallVisualSpecConfiguration)initWithConfigDictionary:(id)a3
{
  id v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;
  void *v14;
  FCMultiResolutionImage *v15;
  FCMultiResolutionImage *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  FCPaywallVisualSpecConfiguration *v24;
  void *v25;
  void *v26;
  FCMultiSizeVideo *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  FCMultiResolutionImage *v33;
  FCMultiResolutionImage *v34;

  v3 = a3;
  FCAppConfigurationDictionaryValueWithDefaultValue(v3, (uint64_t)CFSTR("image"), 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = -[FCMultiResolutionImage initWithConfigDictionary:]([FCMultiResolutionImage alloc], "initWithConfigDictionary:", v32);
  FCAppConfigurationDictionaryValueWithDefaultValue(v3, (uint64_t)CFSTR("alternateImage"), 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = -[FCMultiResolutionImage initWithConfigDictionary:]([FCMultiResolutionImage alloc], "initWithConfigDictionary:", v31);
  FCAppConfigurationDictionaryValueWithDefaultValue(v3, (uint64_t)CFSTR("badgeImage"), 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[FCMultiResolutionImage initWithConfigDictionary:]([FCMultiResolutionImage alloc], "initWithConfigDictionary:", v30);
  FCAppConfigurationDictionaryValueWithDefaultValue(v3, (uint64_t)CFSTR("alternateBadgeImage"), 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[FCMultiResolutionImage initWithConfigDictionary:]([FCMultiResolutionImage alloc], "initWithConfigDictionary:", v29);
  FCAppConfigurationDictionaryValueWithDefaultValue(v3, (uint64_t)CFSTR("video"), 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[FCMultiSizeVideo initWithConfigDictionary:]([FCMultiSizeVideo alloc], "initWithConfigDictionary:", v28);
  FCAppConfigurationURLValue(v3, (uint64_t)CFSTR("videoURL"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = FCAppConfigurationIntegerValue(v3, (uint64_t)CFSTR("videoWidth"), 0);
  v22 = FCAppConfigurationIntegerValue(v3, (uint64_t)CFSTR("videoHeight"), 0);
  v4 = FCAppConfigurationDoubleValue(v3, (uint64_t)CFSTR("gradientPercentHeight"), 0.0);
  v19 = FCAppConfigurationIntegerValue(v3, (uint64_t)CFSTR("textTopPadding"), 57);
  v17 = FCAppConfigurationIntegerValue(v3, (uint64_t)CFSTR("badgeVerticalOffset"), 0);
  FCAppConfigurationStringValue(v3, (uint64_t)CFSTR("backgroundColor"), 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCColor nullableColorWithHexString:](FCColor, "nullableColorWithHexString:", v25);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v3, (uint64_t)CFSTR("alternateBackgroundColor"), 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCColor nullableColorWithHexString:](FCColor, "nullableColorWithHexString:", v21);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v3, (uint64_t)CFSTR("mastheadColor"), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCColor nullableColorWithHexString:](FCColor, "nullableColorWithHexString:", v18);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v3, (uint64_t)CFSTR("largeTextColor"), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCColor nullableColorWithHexString:](FCColor, "nullableColorWithHexString:", v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v3, (uint64_t)CFSTR("smallTextColor"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCColor nullableColorWithHexString:](FCColor, "nullableColorWithHexString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v3, (uint64_t)CFSTR("offersTextColor"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[FCColor nullableColorWithHexString:](FCColor, "nullableColorWithHexString:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[FCPaywallVisualSpecConfiguration initWithMultiResolutionImage:darkStyleMultiResolutionImage:multiResolutionBadgeImage:darkStyleMultiResolutionBadgeImage:multiSizeVideo:videoURL:videoWidth:videoHeight:gradientPercentHeight:textTopPadding:badgeVerticalOffset:backgroundColor:darkStyleBackgroundColor:mastheadTextColor:largeTextColor:smallTextColor:offersTextColor:](self, "initWithMultiResolutionImage:darkStyleMultiResolutionImage:multiResolutionBadgeImage:darkStyleMultiResolutionBadgeImage:multiSizeVideo:videoURL:videoWidth:videoHeight:gradientPercentHeight:textTopPadding:badgeVerticalOffset:backgroundColor:darkStyleBackgroundColor:mastheadTextColor:largeTextColor:smallTextColor:offersTextColor:", v33, v34, v16, v15, v27, v26, v4, v23, v22, v19, v17, v13, v12, v5, v6,
          v8,
          v10);

  return v24;
}

- (FCPaywallVisualSpecConfiguration)initWithMultiResolutionImage:(id)a3 darkStyleMultiResolutionImage:(id)a4 multiResolutionBadgeImage:(id)a5 darkStyleMultiResolutionBadgeImage:(id)a6 multiSizeVideo:(id)a7 videoURL:(id)a8 videoWidth:(int64_t)a9 videoHeight:(int64_t)a10 gradientPercentHeight:(double)a11 textTopPadding:(int64_t)a12 badgeVerticalOffset:(int64_t)a13 backgroundColor:(id)a14 darkStyleBackgroundColor:(id)a15 mastheadTextColor:(id)a16 largeTextColor:(id)a17 smallTextColor:(id)a18 offersTextColor:(id)a19
{
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  FCPaywallVisualSpecConfiguration *v31;
  FCPaywallVisualSpecConfiguration *v32;
  id v35;
  id v36;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  objc_super v44;

  v42 = a3;
  v39 = a4;
  v43 = a5;
  v35 = a6;
  v38 = a6;
  v36 = a7;
  v25 = a7;
  v41 = a8;
  v40 = a14;
  v26 = a15;
  v27 = a16;
  v28 = a17;
  v29 = a18;
  v30 = a19;
  v44.receiver = self;
  v44.super_class = (Class)FCPaywallVisualSpecConfiguration;
  v31 = -[FCPaywallVisualSpecConfiguration init](&v44, sel_init);
  v32 = v31;
  if (v31)
  {
    objc_storeStrong((id *)&v31->_multiResolutionImage, a3);
    objc_storeStrong((id *)&v32->_darkStyleMultiResolutionImage, a4);
    objc_storeStrong((id *)&v32->_multiResolutionBadgeImage, a5);
    objc_storeStrong((id *)&v32->_darkStyleMultiResolutionBadgeImage, v35);
    objc_storeStrong((id *)&v32->_multiSizeVideo, v36);
    objc_storeStrong((id *)&v32->_videoURL, a8);
    v32->_videoWidth = a9;
    v32->_videoHeight = a10;
    v32->_gradientPercentHeight = a11;
    v32->_textTopPadding = a12;
    v32->_badgeVerticalOffset = a13;
    objc_storeStrong((id *)&v32->_backgroundColor, a14);
    objc_storeStrong((id *)&v32->_darkStyleBackgroundColor, a15);
    objc_storeStrong((id *)&v32->_mastheadTextColor, a16);
    objc_storeStrong((id *)&v32->_largeTextColor, a17);
    objc_storeStrong((id *)&v32->_smallTextColor, a18);
    objc_storeStrong((id *)&v32->_offersTextColor, a19);
  }

  return v32;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  int64_t v25;
  BOOL v26;
  void *v27;
  int64_t v28;
  BOOL v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;

  v4 = a3;
  objc_opt_class();
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0DE7910];
    -[FCPaywallVisualSpecConfiguration multiResolutionImage](self, "multiResolutionImage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "multiResolutionImage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "nf_object:isEqualToObject:", v8, v9))
    {
      v10 = (void *)MEMORY[0x1E0DE7910];
      -[FCPaywallVisualSpecConfiguration darkStyleMultiResolutionImage](self, "darkStyleMultiResolutionImage");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "darkStyleMultiResolutionImage");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "nf_object:isEqualToObject:", v11, v12))
      {
        v13 = (void *)MEMORY[0x1E0DE7910];
        -[FCPaywallVisualSpecConfiguration multiResolutionBadgeImage](self, "multiResolutionBadgeImage");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "multiResolutionBadgeImage");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "nf_object:isEqualToObject:", v14, v15))
        {
          v37 = v14;
          v16 = (void *)MEMORY[0x1E0DE7910];
          -[FCPaywallVisualSpecConfiguration darkStyleMultiResolutionBadgeImage](self, "darkStyleMultiResolutionBadgeImage");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "darkStyleMultiResolutionBadgeImage");
          v36 = objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v16, "nf_object:isEqualToObject:", v17))
          {
            v33 = v17;
            v18 = (void *)MEMORY[0x1E0DE7910];
            -[FCPaywallVisualSpecConfiguration backgroundColor](self, "backgroundColor");
            v19 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "backgroundColor");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = (void *)v19;
            if (objc_msgSend(v18, "nf_object:isEqualToObject:", v19))
            {
              v20 = (void *)MEMORY[0x1E0DE7910];
              -[FCPaywallVisualSpecConfiguration darkStyleBackgroundColor](self, "darkStyleBackgroundColor");
              v21 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "darkStyleBackgroundColor");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = (void *)v21;
              if (objc_msgSend(v20, "nf_object:isEqualToObject:", v21, v31)
                && (-[FCPaywallVisualSpecConfiguration gradientPercentHeight](self, "gradientPercentHeight"),
                    v23 = v22,
                    objc_msgSend(v6, "gradientPercentHeight"),
                    v23 == v24))
              {
                v25 = -[FCPaywallVisualSpecConfiguration textTopPadding](self, "textTopPadding");
                v26 = v25 == objc_msgSend(v6, "textTopPadding");
                v17 = v33;
                v27 = (void *)v36;
                v14 = v37;
                if (v26)
                {
                  v28 = -[FCPaywallVisualSpecConfiguration badgeVerticalOffset](self, "badgeVerticalOffset");
                  v30 = v28 == objc_msgSend(v6, "badgeVerticalOffset");
                }
                else
                {
                  v30 = 0;
                }
              }
              else
              {
                v30 = 0;
                v17 = v33;
                v27 = (void *)v36;
                v14 = v37;
              }

            }
            else
            {
              v30 = 0;
              v17 = v33;
              v27 = (void *)v36;
              v14 = v37;
            }

          }
          else
          {
            v30 = 0;
            v27 = (void *)v36;
            v14 = v37;
          }

        }
        else
        {
          v30 = 0;
        }

      }
      else
      {
        v30 = 0;
      }

    }
    else
    {
      v30 = 0;
    }

  }
  else
  {
    v30 = 0;
  }

  return v30;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;
  void *v20;
  void *v21;
  void *v22;

  -[FCPaywallVisualSpecConfiguration multiResolutionImage](self, "multiResolutionImage");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v22, "hash");
  -[FCPaywallVisualSpecConfiguration darkStyleMultiResolutionImage](self, "darkStyleMultiResolutionImage");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v21, "hash") ^ v3;
  -[FCPaywallVisualSpecConfiguration multiResolutionBadgeImage](self, "multiResolutionBadgeImage");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v20, "hash");
  -[FCPaywallVisualSpecConfiguration darkStyleMultiResolutionBadgeImage](self, "darkStyleMultiResolutionBadgeImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4 ^ v5 ^ objc_msgSend(v6, "hash");
  -[FCPaywallVisualSpecConfiguration backgroundColor](self, "backgroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hash");
  -[FCPaywallVisualSpecConfiguration darkStyleBackgroundColor](self, "darkStyleBackgroundColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v7 ^ v9 ^ objc_msgSend(v10, "hash");
  v12 = (void *)MEMORY[0x1E0CB37E8];
  -[FCPaywallVisualSpecConfiguration gradientPercentHeight](self, "gradientPercentHeight");
  objc_msgSend(v12, "numberWithDouble:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v11 ^ objc_msgSend(v13, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[FCPaywallVisualSpecConfiguration textTopPadding](self, "textTopPadding"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[FCPaywallVisualSpecConfiguration badgeVerticalOffset](self, "badgeVerticalOffset"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v14 ^ v16 ^ objc_msgSend(v17, "hash");

  return v18;
}

+ (id)defaultMagazineFeedPaywallVisualSpecConfigurationSmall
{
  if (qword_1ED0F82D0 != -1)
    dispatch_once(&qword_1ED0F82D0, &__block_literal_global_76);
  return (id)_MergedGlobals_168;
}

void __90__FCPaywallVisualSpecConfiguration_defaultMagazineFeedPaywallVisualSpecConfigurationSmall__block_invoke()
{
  FCPaywallVisualSpecConfiguration *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v0 = [FCPaywallVisualSpecConfiguration alloc];
  +[FCColor colorWithRed:green:blue:alpha:](FCColor, "colorWithRed:green:blue:alpha:", 0.956862745, 0.956862745, 0.956862745, 1.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCColor colorWithRed:green:blue:alpha:](FCColor, "colorWithRed:green:blue:alpha:", 0.184313725, 0.184313725, 0.192156863, 1.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCColor whiteColor](FCColor, "whiteColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCColor whiteColor](FCColor, "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCColor whiteColor](FCColor, "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCColor colorWithRed:green:blue:alpha:](FCColor, "colorWithRed:green:blue:alpha:", 1.0, 0.0, 0.28627451, 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[FCPaywallVisualSpecConfiguration initWithMultiResolutionImage:darkStyleMultiResolutionImage:multiResolutionBadgeImage:darkStyleMultiResolutionBadgeImage:multiSizeVideo:videoURL:videoWidth:videoHeight:gradientPercentHeight:textTopPadding:badgeVerticalOffset:backgroundColor:darkStyleBackgroundColor:mastheadTextColor:largeTextColor:smallTextColor:offersTextColor:](v0, "initWithMultiResolutionImage:darkStyleMultiResolutionImage:multiResolutionBadgeImage:darkStyleMultiResolutionBadgeImage:multiSizeVideo:videoURL:videoWidth:videoHeight:gradientPercentHeight:textTopPadding:badgeVerticalOffset:backgroundColor:darkStyleBackgroundColor:mastheadTextColor:largeTextColor:smallTextColor:offersTextColor:", 0, 0, 0, 0, 0, 0, 0.0, 0, 0, 57, 0, v8, v1, v2, v3,
         v4,
         v5);
  v7 = (void *)_MergedGlobals_168;
  _MergedGlobals_168 = v6;

}

+ (id)defaultMagazineFeedPaywallVisualSpecConfigurationMedium
{
  if (qword_1ED0F82E0 != -1)
    dispatch_once(&qword_1ED0F82E0, &__block_literal_global_46_2);
  return (id)qword_1ED0F82D8;
}

void __91__FCPaywallVisualSpecConfiguration_defaultMagazineFeedPaywallVisualSpecConfigurationMedium__block_invoke()
{
  FCPaywallVisualSpecConfiguration *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v0 = [FCPaywallVisualSpecConfiguration alloc];
  +[FCColor colorWithRed:green:blue:alpha:](FCColor, "colorWithRed:green:blue:alpha:", 0.956862745, 0.956862745, 0.956862745, 1.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCColor colorWithRed:green:blue:alpha:](FCColor, "colorWithRed:green:blue:alpha:", 0.184313725, 0.184313725, 0.192156863, 1.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCColor whiteColor](FCColor, "whiteColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCColor whiteColor](FCColor, "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCColor whiteColor](FCColor, "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCColor colorWithRed:green:blue:alpha:](FCColor, "colorWithRed:green:blue:alpha:", 1.0, 0.0, 0.28627451, 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[FCPaywallVisualSpecConfiguration initWithMultiResolutionImage:darkStyleMultiResolutionImage:multiResolutionBadgeImage:darkStyleMultiResolutionBadgeImage:multiSizeVideo:videoURL:videoWidth:videoHeight:gradientPercentHeight:textTopPadding:badgeVerticalOffset:backgroundColor:darkStyleBackgroundColor:mastheadTextColor:largeTextColor:smallTextColor:offersTextColor:](v0, "initWithMultiResolutionImage:darkStyleMultiResolutionImage:multiResolutionBadgeImage:darkStyleMultiResolutionBadgeImage:multiSizeVideo:videoURL:videoWidth:videoHeight:gradientPercentHeight:textTopPadding:badgeVerticalOffset:backgroundColor:darkStyleBackgroundColor:mastheadTextColor:largeTextColor:smallTextColor:offersTextColor:", 0, 0, 0, 0, 0, 0, 0.0, 0, 0, 57, 0, v8, v1, v2, v3,
         v4,
         v5);
  v7 = (void *)qword_1ED0F82D8;
  qword_1ED0F82D8 = v6;

}

+ (id)defaultMagazineFeedPaywallVisualSpecConfigurationLarge
{
  if (qword_1ED0F82F0 != -1)
    dispatch_once(&qword_1ED0F82F0, &__block_literal_global_47_3);
  return (id)qword_1ED0F82E8;
}

void __90__FCPaywallVisualSpecConfiguration_defaultMagazineFeedPaywallVisualSpecConfigurationLarge__block_invoke()
{
  FCPaywallVisualSpecConfiguration *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v0 = [FCPaywallVisualSpecConfiguration alloc];
  +[FCColor colorWithRed:green:blue:alpha:](FCColor, "colorWithRed:green:blue:alpha:", 0.956862745, 0.956862745, 0.956862745, 1.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCColor colorWithRed:green:blue:alpha:](FCColor, "colorWithRed:green:blue:alpha:", 0.184313725, 0.184313725, 0.192156863, 1.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCColor whiteColor](FCColor, "whiteColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCColor whiteColor](FCColor, "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCColor whiteColor](FCColor, "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCColor colorWithRed:green:blue:alpha:](FCColor, "colorWithRed:green:blue:alpha:", 1.0, 0.0, 0.28627451, 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[FCPaywallVisualSpecConfiguration initWithMultiResolutionImage:darkStyleMultiResolutionImage:multiResolutionBadgeImage:darkStyleMultiResolutionBadgeImage:multiSizeVideo:videoURL:videoWidth:videoHeight:gradientPercentHeight:textTopPadding:badgeVerticalOffset:backgroundColor:darkStyleBackgroundColor:mastheadTextColor:largeTextColor:smallTextColor:offersTextColor:](v0, "initWithMultiResolutionImage:darkStyleMultiResolutionImage:multiResolutionBadgeImage:darkStyleMultiResolutionBadgeImage:multiSizeVideo:videoURL:videoWidth:videoHeight:gradientPercentHeight:textTopPadding:badgeVerticalOffset:backgroundColor:darkStyleBackgroundColor:mastheadTextColor:largeTextColor:smallTextColor:offersTextColor:", 0, 0, 0, 0, 0, 0, 0.0, 0, 0, 57, 0, v8, v1, v2, v3,
         v4,
         v5);
  v7 = (void *)qword_1ED0F82E8;
  qword_1ED0F82E8 = v6;

}

+ (id)defaultAudioFeedPaywallVisualSpecConfigurationSmall
{
  if (qword_1ED0F8300 != -1)
    dispatch_once(&qword_1ED0F8300, &__block_literal_global_48_1);
  return (id)qword_1ED0F82F8;
}

void __87__FCPaywallVisualSpecConfiguration_defaultAudioFeedPaywallVisualSpecConfigurationSmall__block_invoke()
{
  FCPaywallVisualSpecConfiguration *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v0 = [FCPaywallVisualSpecConfiguration alloc];
  +[FCColor colorWithRed:green:blue:alpha:](FCColor, "colorWithRed:green:blue:alpha:", 0.956862745, 0.956862745, 0.956862745, 1.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCColor colorWithRed:green:blue:alpha:](FCColor, "colorWithRed:green:blue:alpha:", 0.184313725, 0.184313725, 0.192156863, 1.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCColor whiteColor](FCColor, "whiteColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCColor whiteColor](FCColor, "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCColor whiteColor](FCColor, "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCColor colorWithRed:green:blue:alpha:](FCColor, "colorWithRed:green:blue:alpha:", 1.0, 0.0, 0.28627451, 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[FCPaywallVisualSpecConfiguration initWithMultiResolutionImage:darkStyleMultiResolutionImage:multiResolutionBadgeImage:darkStyleMultiResolutionBadgeImage:multiSizeVideo:videoURL:videoWidth:videoHeight:gradientPercentHeight:textTopPadding:badgeVerticalOffset:backgroundColor:darkStyleBackgroundColor:mastheadTextColor:largeTextColor:smallTextColor:offersTextColor:](v0, "initWithMultiResolutionImage:darkStyleMultiResolutionImage:multiResolutionBadgeImage:darkStyleMultiResolutionBadgeImage:multiSizeVideo:videoURL:videoWidth:videoHeight:gradientPercentHeight:textTopPadding:badgeVerticalOffset:backgroundColor:darkStyleBackgroundColor:mastheadTextColor:largeTextColor:smallTextColor:offersTextColor:", 0, 0, 0, 0, 0, 0, 0.0, 0, 0, 57, 0, v8, v1, v2, v3,
         v4,
         v5);
  v7 = (void *)qword_1ED0F82F8;
  qword_1ED0F82F8 = v6;

}

+ (id)defaultAudioFeedPaywallVisualSpecConfigurationLarge
{
  if (qword_1ED0F8310 != -1)
    dispatch_once(&qword_1ED0F8310, &__block_literal_global_49_1);
  return (id)qword_1ED0F8308;
}

void __87__FCPaywallVisualSpecConfiguration_defaultAudioFeedPaywallVisualSpecConfigurationLarge__block_invoke()
{
  FCPaywallVisualSpecConfiguration *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v0 = [FCPaywallVisualSpecConfiguration alloc];
  +[FCColor colorWithRed:green:blue:alpha:](FCColor, "colorWithRed:green:blue:alpha:", 0.956862745, 0.956862745, 0.956862745, 1.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCColor colorWithRed:green:blue:alpha:](FCColor, "colorWithRed:green:blue:alpha:", 0.184313725, 0.184313725, 0.192156863, 1.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCColor whiteColor](FCColor, "whiteColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCColor whiteColor](FCColor, "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCColor whiteColor](FCColor, "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCColor colorWithRed:green:blue:alpha:](FCColor, "colorWithRed:green:blue:alpha:", 1.0, 0.0, 0.28627451, 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[FCPaywallVisualSpecConfiguration initWithMultiResolutionImage:darkStyleMultiResolutionImage:multiResolutionBadgeImage:darkStyleMultiResolutionBadgeImage:multiSizeVideo:videoURL:videoWidth:videoHeight:gradientPercentHeight:textTopPadding:badgeVerticalOffset:backgroundColor:darkStyleBackgroundColor:mastheadTextColor:largeTextColor:smallTextColor:offersTextColor:](v0, "initWithMultiResolutionImage:darkStyleMultiResolutionImage:multiResolutionBadgeImage:darkStyleMultiResolutionBadgeImage:multiSizeVideo:videoURL:videoWidth:videoHeight:gradientPercentHeight:textTopPadding:badgeVerticalOffset:backgroundColor:darkStyleBackgroundColor:mastheadTextColor:largeTextColor:smallTextColor:offersTextColor:", 0, 0, 0, 0, 0, 0, 0.0, 0, 0, 57, 0, v8, v1, v2, v3,
         v4,
         v5);
  v7 = (void *)qword_1ED0F8308;
  qword_1ED0F8308 = v6;

}

+ (id)defaultPaywallVisualSpecConfiguration
{
  if (qword_1ED0F8320 != -1)
    dispatch_once(&qword_1ED0F8320, &__block_literal_global_50_0);
  return (id)qword_1ED0F8318;
}

void __73__FCPaywallVisualSpecConfiguration_defaultPaywallVisualSpecConfiguration__block_invoke()
{
  FCPaywallVisualSpecConfiguration *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v0 = [FCPaywallVisualSpecConfiguration alloc];
  +[FCColor colorWithRed:green:blue:alpha:](FCColor, "colorWithRed:green:blue:alpha:", 0.956862745, 0.956862745, 0.956862745, 1.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCColor colorWithRed:green:blue:alpha:](FCColor, "colorWithRed:green:blue:alpha:", 0.184313725, 0.184313725, 0.192156863, 1.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCColor whiteColor](FCColor, "whiteColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCColor whiteColor](FCColor, "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCColor whiteColor](FCColor, "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCColor colorWithRed:green:blue:alpha:](FCColor, "colorWithRed:green:blue:alpha:", 1.0, 0.0, 0.28627451, 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[FCPaywallVisualSpecConfiguration initWithMultiResolutionImage:darkStyleMultiResolutionImage:multiResolutionBadgeImage:darkStyleMultiResolutionBadgeImage:multiSizeVideo:videoURL:videoWidth:videoHeight:gradientPercentHeight:textTopPadding:badgeVerticalOffset:backgroundColor:darkStyleBackgroundColor:mastheadTextColor:largeTextColor:smallTextColor:offersTextColor:](v0, "initWithMultiResolutionImage:darkStyleMultiResolutionImage:multiResolutionBadgeImage:darkStyleMultiResolutionBadgeImage:multiSizeVideo:videoURL:videoWidth:videoHeight:gradientPercentHeight:textTopPadding:badgeVerticalOffset:backgroundColor:darkStyleBackgroundColor:mastheadTextColor:largeTextColor:smallTextColor:offersTextColor:", 0, 0, 0, 0, 0, 0, 0.0, 0, 0, 57, 0, v8, v1, v2, v3,
         v4,
         v5);
  v7 = (void *)qword_1ED0F8318;
  qword_1ED0F8318 = v6;

}

- (FCMultiResolutionImage)multiResolutionImage
{
  return self->_multiResolutionImage;
}

- (void)setMultiResolutionImage:(id)a3
{
  objc_storeStrong((id *)&self->_multiResolutionImage, a3);
}

- (FCMultiResolutionImage)darkStyleMultiResolutionImage
{
  return self->_darkStyleMultiResolutionImage;
}

- (void)setDarkStyleMultiResolutionImage:(id)a3
{
  objc_storeStrong((id *)&self->_darkStyleMultiResolutionImage, a3);
}

- (FCMultiResolutionImage)multiResolutionBadgeImage
{
  return self->_multiResolutionBadgeImage;
}

- (void)setMultiResolutionBadgeImage:(id)a3
{
  objc_storeStrong((id *)&self->_multiResolutionBadgeImage, a3);
}

- (FCMultiResolutionImage)darkStyleMultiResolutionBadgeImage
{
  return self->_darkStyleMultiResolutionBadgeImage;
}

- (void)setDarkStyleMultiResolutionBadgeImage:(id)a3
{
  objc_storeStrong((id *)&self->_darkStyleMultiResolutionBadgeImage, a3);
}

- (FCMultiSizeVideo)multiSizeVideo
{
  return self->_multiSizeVideo;
}

- (void)setMultiSizeVideo:(id)a3
{
  objc_storeStrong((id *)&self->_multiSizeVideo, a3);
}

- (NSURL)videoURL
{
  return self->_videoURL;
}

- (void)setVideoURL:(id)a3
{
  objc_storeStrong((id *)&self->_videoURL, a3);
}

- (int64_t)videoWidth
{
  return self->_videoWidth;
}

- (void)setVideoWidth:(int64_t)a3
{
  self->_videoWidth = a3;
}

- (int64_t)videoHeight
{
  return self->_videoHeight;
}

- (void)setVideoHeight:(int64_t)a3
{
  self->_videoHeight = a3;
}

- (double)gradientPercentHeight
{
  return self->_gradientPercentHeight;
}

- (void)setGradientPercentHeight:(double)a3
{
  self->_gradientPercentHeight = a3;
}

- (int64_t)textTopPadding
{
  return self->_textTopPadding;
}

- (void)setTextTopPadding:(int64_t)a3
{
  self->_textTopPadding = a3;
}

- (int64_t)badgeVerticalOffset
{
  return self->_badgeVerticalOffset;
}

- (void)setBadgeVerticalOffset:(int64_t)a3
{
  self->_badgeVerticalOffset = a3;
}

- (FCColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (FCColor)darkStyleBackgroundColor
{
  return self->_darkStyleBackgroundColor;
}

- (void)setDarkStyleBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_darkStyleBackgroundColor, a3);
}

- (FCColor)mastheadTextColor
{
  return self->_mastheadTextColor;
}

- (void)setMastheadTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_mastheadTextColor, a3);
}

- (FCColor)largeTextColor
{
  return self->_largeTextColor;
}

- (void)setLargeTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_largeTextColor, a3);
}

- (FCColor)smallTextColor
{
  return self->_smallTextColor;
}

- (void)setSmallTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_smallTextColor, a3);
}

- (FCColor)offersTextColor
{
  return self->_offersTextColor;
}

- (void)setOffersTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_offersTextColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offersTextColor, 0);
  objc_storeStrong((id *)&self->_smallTextColor, 0);
  objc_storeStrong((id *)&self->_largeTextColor, 0);
  objc_storeStrong((id *)&self->_mastheadTextColor, 0);
  objc_storeStrong((id *)&self->_darkStyleBackgroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_videoURL, 0);
  objc_storeStrong((id *)&self->_multiSizeVideo, 0);
  objc_storeStrong((id *)&self->_darkStyleMultiResolutionBadgeImage, 0);
  objc_storeStrong((id *)&self->_multiResolutionBadgeImage, 0);
  objc_storeStrong((id *)&self->_darkStyleMultiResolutionImage, 0);
  objc_storeStrong((id *)&self->_multiResolutionImage, 0);
}

@end
