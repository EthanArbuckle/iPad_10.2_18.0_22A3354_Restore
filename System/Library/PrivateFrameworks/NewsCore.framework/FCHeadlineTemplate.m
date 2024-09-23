@implementation FCHeadlineTemplate

- (FCTextInfo)headlineTitleTextInfo
{
  return self->_headlineTitleTextInfo;
}

- (FCTextInfo)headlineExcerptTextInfo
{
  return self->_headlineExcerptTextInfo;
}

- (FCTextInfo)headlineBylineTextInfo
{
  return self->_headlineBylineTextInfo;
}

- (void)setHeadlineTitleTextInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setHeadlineExcerptTextInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setHeadlineBylineTextInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setBackgroundColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (FCHeadlineTemplate)init
{
  return -[FCHeadlineTemplate initWithJSONDictionary:versionNumber:URLGenerator:](self, "initWithJSONDictionary:versionNumber:URLGenerator:", 0, objc_msgSend(CFSTR("2"), "integerValue"), 0);
}

- (FCHeadlineTemplate)initWithJSONDictionary:(id)a3 versionNumber:(int64_t)a4 URLGenerator:(id)a5
{
  id v8;
  id v9;
  FCHeadlineTemplate *v10;
  FCHeadlineTemplate *v11;
  uint64_t v12;
  id v13;
  void (**v14)(void *, const __CFString *);
  id v15;
  void (**v16)(void *, const __CFString *);
  FCTextInfo *v17;
  FCTextInfo *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  FCTextInfo *headlineTitleTextInfo;
  void *v26;
  uint64_t v27;
  FCTextInfo *headlineBylineTextInfo;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  FCColor *v34;
  FCColor *backgroundColor;
  FCColor *v36;
  _QWORD v38[4];
  id v39;
  _QWORD aBlock[4];
  id v41;
  id v42;
  objc_super v43;

  v8 = a3;
  v9 = a5;
  v43.receiver = self;
  v43.super_class = (Class)FCHeadlineTemplate;
  v10 = -[FCHeadlineTemplate init](&v43, sel_init);
  v11 = v10;
  if (v8 && v10)
  {
    if (a4 == 2)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("titleFontAttributes"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[FCTextInfo textInfoFromJSONValues:URLGenerator:](FCTextInfo, "textInfoFromJSONValues:URLGenerator:", v23, v9);
      v24 = objc_claimAutoreleasedReturnValue();
      headlineTitleTextInfo = v11->_headlineTitleTextInfo;
      v11->_headlineTitleTextInfo = (FCTextInfo *)v24;

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("bylineFontAttributes"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      +[FCTextInfo textInfoFromJSONValues:URLGenerator:](FCTextInfo, "textInfoFromJSONValues:URLGenerator:", v26, v9);
      v27 = objc_claimAutoreleasedReturnValue();
      headlineBylineTextInfo = v11->_headlineBylineTextInfo;
      v11->_headlineBylineTextInfo = (FCTextInfo *)v27;

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("backgroundColor"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (v29)
        +[FCColor colorWithHexString:](FCColor, "colorWithHexString:", v29);
      else
        objc_msgSend((id)objc_opt_class(), "_defaultBackgroundColor");
      v30 = objc_claimAutoreleasedReturnValue();
      backgroundColor = v11->_backgroundColor;
      v11->_backgroundColor = (FCColor *)v30;

      goto LABEL_16;
    }
    if (a4 == 1)
    {
      v12 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __72__FCHeadlineTemplate_initWithJSONDictionary_versionNumber_URLGenerator___block_invoke;
      aBlock[3] = &unk_1E46463E8;
      v13 = v8;
      v41 = v13;
      v42 = v9;
      v14 = (void (**)(void *, const __CFString *))_Block_copy(aBlock);
      v38[0] = v12;
      v38[1] = 3221225472;
      v38[2] = __72__FCHeadlineTemplate_initWithJSONDictionary_versionNumber_URLGenerator___block_invoke_2;
      v38[3] = &unk_1E4646410;
      v15 = v13;
      v39 = v15;
      v16 = (void (**)(void *, const __CFString *))_Block_copy(v38);
      v17 = objc_alloc_init(FCTextInfo);
      v18 = v11->_headlineTitleTextInfo;
      v11->_headlineTitleTextInfo = v17;

      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("titleFontName"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v14[2](v14, CFSTR("titleFontResourceID"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[FCLoadableFont loadableFontWithName:url:](FCLoadableFont, "loadableFontWithName:url:", v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCTextInfo setFont:](v11->_headlineTitleTextInfo, "setFont:", v21);

      v16[2](v16, CFSTR("titleColor"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        -[FCTextInfo setColor:](v11->_headlineTitleTextInfo, "setColor:", v22);
      }
      else
      {
        +[FCColor blackColor](FCColor, "blackColor");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[FCTextInfo setColor:](v11->_headlineTitleTextInfo, "setColor:", v31);

      }
      v16[2](v16, CFSTR("backgroundColor"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v32;
      if (v32)
      {
        v34 = v32;
      }
      else
      {
        objc_msgSend((id)objc_opt_class(), "_defaultBackgroundColor");
        v34 = (FCColor *)objc_claimAutoreleasedReturnValue();
      }
      v36 = v11->_backgroundColor;
      v11->_backgroundColor = v34;

      v29 = v41;
LABEL_16:

    }
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadableFonts, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_headlineBylineTextInfo, 0);
  objc_storeStrong((id *)&self->_headlineExcerptTextInfo, 0);
  objc_storeStrong((id *)&self->_headlineTitleTextInfo, 0);
}

+ (FCHeadlineTemplate)headlineTemplateWithJSON:(id)a3 URLGenerator:(id)a4
{
  return (FCHeadlineTemplate *)objc_msgSend(a1, "_headlineTemplateWithJSON:versionNumber:URLGenerator:", a3, CFSTR("2"), a4);
}

+ (id)_headlineTemplateWithJSON:(id)a3 versionNumber:(id)a4 URLGenerator:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  FCImageOnTopPremiumHeadlineTemplate *v17;
  void *v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v7, "length"))
  {
    objc_msgSend(v7, "dataUsingEncoding:", 4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v10, 0, &v20);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v20;
    if (v12 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("failed to deserialize JSONData template with error: %@"), v12);
      *(_DWORD *)buf = 136315906;
      v22 = "+[FCHeadlineTemplate _headlineTemplateWithJSON:versionNumber:URLGenerator:]";
      v23 = 2080;
      v24 = "FCHeadlineTemplate.m";
      v25 = 1024;
      v26 = 84;
      v27 = 2114;
      v28 = v19;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    objc_msgSend(v11, "objectForKeyedSubscript:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13
      && (objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("templateType")),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("Image On Top")),
          v15,
          v16))
    {
      v17 = -[FCImageOnTopPremiumHeadlineTemplate initWithJSONDictionary:versionNumber:URLGenerator:]([FCImageOnTopPremiumHeadlineTemplate alloc], "initWithJSONDictionary:versionNumber:URLGenerator:", v14, objc_msgSend(v8, "integerValue"), v9);
    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (id)templateByMergingTemplate:(id)a3 intoTemplate:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v7, "mergeFromTemplate:", v5);

  objc_msgSend(v7, "mergeFromTemplate:", v6);
  return v7;
}

- (void)mergeFromTemplate:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSString *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v4, "_allThemePropertyNames", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(NSString **)(*((_QWORD *)&v12 + 1) + 8 * i);
        NSSelectorFromString(v10);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v4, "valueForKey:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
            -[FCHeadlineTemplate setValue:forKey:](self, "setValue:forKey:", v11, v10);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

id __72__FCHeadlineTemplate_initWithJSONDictionary_versionNumber_URLGenerator___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "generateURLForResourceID:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id __72__FCHeadlineTemplate_initWithJSONDictionary_versionNumber_URLGenerator___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    +[FCColor colorWithHexString:](FCColor, "colorWithHexString:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (NSArray)loadableFonts
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCHeadlineTemplate headlineTitleTextInfo](self, "headlineTitleTextInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "font");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[FCHeadlineTemplate headlineTitleTextInfo](self, "headlineTitleTextInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "font");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
  -[FCHeadlineTemplate headlineBylineTextInfo](self, "headlineBylineTextInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "font");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[FCHeadlineTemplate headlineBylineTextInfo](self, "headlineBylineTextInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "font");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v11);

  }
  -[FCHeadlineTemplate headlineExcerptTextInfo](self, "headlineExcerptTextInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "font");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[FCHeadlineTemplate headlineExcerptTextInfo](self, "headlineExcerptTextInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "font");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v15);

  }
  return (NSArray *)v3;
}

- (BOOL)isEqual:(id)a3
{
  FCHeadlineTemplate *v4;
  FCHeadlineTemplate *v5;
  void *v6;
  FCHeadlineTemplate *v7;
  BOOL v8;
  _QWORD v10[5];
  FCHeadlineTemplate *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v4 = (FCHeadlineTemplate *)a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  if (self == v4)
  {
    v8 = 1;
    v16 = 1;
  }
  else
  {
    objc_opt_class();
    if (v4 && (objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      *((_BYTE *)v14 + 24) = 1;
      -[FCHeadlineTemplate _allThemePropertyNames](self, "_allThemePropertyNames");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __30__FCHeadlineTemplate_isEqual___block_invoke;
      v10[3] = &unk_1E4646438;
      v10[4] = self;
      v7 = v5;
      v11 = v7;
      v12 = &v13;
      objc_msgSend(v6, "enumerateObjectsUsingBlock:", v10);

    }
    else
    {
      v7 = 0;
    }

    v8 = *((_BYTE *)v14 + 24) != 0;
  }
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __30__FCHeadlineTemplate_isEqual___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = *(void **)(a1 + 32);
  v7 = a2;
  objc_msgSend(v6, "valueForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "valueForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v7) = objc_msgSend(v8, "isEqual:", v9);
  if ((v7 & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    *a4 = 1;
  }
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[FCHeadlineTemplate _allThemePropertyNames](self, "_allThemePropertyNames", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v3);
        -[FCHeadlineTemplate valueForKey:](self, "valueForKey:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v6 ^= objc_msgSend(v9, "hash");

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_allThemePropertyNames
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(sel_headlineTitleTextInfo);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  NSStringFromSelector(sel_headlineExcerptTextInfo);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v3;
  NSStringFromSelector(sel_backgroundColor);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v4;
  NSStringFromSelector(sel_headlineBylineTextInfo);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_defaultTitleTextColor
{
  if (qword_1ED0F8520 != -1)
    dispatch_once(&qword_1ED0F8520, &__block_literal_global_119);
  return (id)_MergedGlobals_187;
}

void __44__FCHeadlineTemplate__defaultTitleTextColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[FCColor blackColor](FCColor, "blackColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_187;
  _MergedGlobals_187 = v0;

}

+ (id)_defaultBackgroundColor
{
  if (qword_1ED0F8530 != -1)
    dispatch_once(&qword_1ED0F8530, &__block_literal_global_48_3);
  return (id)qword_1ED0F8528;
}

void __45__FCHeadlineTemplate__defaultBackgroundColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[FCColor colorWithRed:green:blue:alpha:](FCColor, "colorWithRed:green:blue:alpha:", 0.961, 0.957, 0.941, 1.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED0F8528;
  qword_1ED0F8528 = v0;

}

- (FCColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setLoadableFonts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

@end
