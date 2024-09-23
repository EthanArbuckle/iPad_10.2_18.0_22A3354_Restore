@implementation CNContactGeminiIconProvider

- (void)updateGeminiIcons
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSDictionary *v15;
  NSDictionary *geminiIconDictionary;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[CNContactGeminiIconProvider geminiResult](self, "geminiResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "availableChannels");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v11, "localizedBadgeLabel", (_QWORD)v17);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactGeminiIconProvider _simLabelImageWithLocalizedBadgeLabel:](self, "_simLabelImageWithLocalizedBadgeLabel:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "channelIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKey:", v13, v14);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  v15 = (NSDictionary *)objc_msgSend(v5, "copy");
  geminiIconDictionary = self->_geminiIconDictionary;
  self->_geminiIconDictionary = v15;

}

- (CNGeminiResult)geminiResult
{
  return self->_geminiResult;
}

- (void)setGeminiResult:(id)a3
{
  CNGeminiResult *v4;
  _BOOL4 v5;
  CNGeminiResult *geminiResult;

  v4 = (CNGeminiResult *)a3;
  v5 = -[CNContactGeminiIconProvider _checkAvailableGeminiChannelsUpdatedForGeminiResult:](self, "_checkAvailableGeminiChannelsUpdatedForGeminiResult:", v4);
  geminiResult = self->_geminiResult;
  self->_geminiResult = v4;

  if (v5)
    -[CNContactGeminiIconProvider updateGeminiIcons](self, "updateGeminiIcons");
}

- (id)geminiIconForGeminiChannelIdentifier:(id)a3
{
  return -[NSDictionary objectForKey:](self->_geminiIconDictionary, "objectForKey:", a3);
}

- (BOOL)_checkAvailableGeminiChannelsUpdatedForGeminiResult:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[CNContactGeminiIconProvider geminiResult](self, "geminiResult");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "availableChannels");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v29;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v29 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v12), "localizedBadgeLabel");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v10);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(v4, "availableChannels", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v25;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v25 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v18), "localizedBadgeLabel");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v16);
  }

  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v5);
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v6);
  v22 = objc_msgSend(v20, "isEqualToSet:", v21);

  return v22 ^ 1;
}

- (id)_simLabelImageWithLocalizedBadgeLabel:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  id v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CGFloat v37;
  CGFloat v38;
  void *v39;
  void *v40;
  CGSize v42;

  v3 = (void *)MEMORY[0x1E0DC1350];
  v4 = *MEMORY[0x1E0DC4A88];
  v5 = a3;
  objc_msgSend(v3, "preferredFontForTextStyle:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC37F8], "defaultMetrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scaledValueForValue:", 2.20000005);
  v9 = v8;

  v10 = objc_alloc(MEMORY[0x1E0DC3990]);
  objc_msgSend(v6, "capHeight");
  v12 = v11;
  objc_msgSend(v6, "capHeight");
  v14 = (void *)objc_msgSend(v10, "initWithFrame:", 0.0, 0.0, v12, v13);
  v15 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(v6, "capHeight");
  objc_msgSend(v15, "boldSystemFontOfSize:", v16 / 1.375);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFont:", v17);

  objc_msgSend(v14, "setText:", v5);
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTextColor:", v18);

  objc_msgSend(v14, "setTextAlignment:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setBackgroundColor:", v19);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v21 = objc_msgSend(v20, "CGColor");
  objc_msgSend(v14, "layer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setBorderColor:", v21);

  objc_msgSend(MEMORY[0x1E0DC37F8], "defaultMetrics");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "scaledValueForValue:", 1.20000005);
  v25 = v24;
  objc_msgSend(v14, "layer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setBorderWidth:", v25);

  objc_msgSend(v14, "layer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setMasksToBounds:", 1);

  objc_msgSend(v14, "layer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setCornerRadius:", v9);

  objc_msgSend(v6, "capHeight");
  v30 = v29;
  objc_msgSend(MEMORY[0x1E0DC37F8], "defaultMetrics");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "scaledValueForValue:", 6.0);
  v33 = v32;

  objc_msgSend(v14, "intrinsicContentSize");
  v35 = v33 + v34;
  if (v35 >= v30)
    v30 = v35;
  objc_msgSend(v6, "capHeight");
  objc_msgSend(v14, "setFrame:", 0.0, 0.0, v30, v36);
  objc_msgSend(v14, "bounds");
  v42.width = v37;
  v42.height = v38;
  UIGraphicsBeginImageContextWithOptions(v42, 0, 0.0);
  objc_msgSend(v14, "layer");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "renderInContext:", UIGraphicsGetCurrentContext());

  UIGraphicsGetImageFromCurrentImageContext();
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v40;
}

- (NSDictionary)geminiIconDictionary
{
  return self->_geminiIconDictionary;
}

- (void)setGeminiIconDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_geminiIconDictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geminiIconDictionary, 0);
  objc_storeStrong((id *)&self->_geminiResult, 0);
}

@end
