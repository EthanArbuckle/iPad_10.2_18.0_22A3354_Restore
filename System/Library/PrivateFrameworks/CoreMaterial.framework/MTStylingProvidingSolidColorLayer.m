@implementation MTStylingProvidingSolidColorLayer

- (id)visualStylingProviderForCategory:(id)a3
{
  id v4;
  MTCoreMaterialVisualStylingProvider *v5;
  NSMutableDictionary *cmStylingProviders;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;

  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_cmStylingProviders, "objectForKey:", v4);
  v5 = (MTCoreMaterialVisualStylingProvider *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = objc_alloc_init(MTCoreMaterialVisualStylingProvider);
    cmStylingProviders = self->_cmStylingProviders;
    if (!cmStylingProviders)
    {
      v7 = (NSMutableDictionary *)objc_opt_new();
      v8 = self->_cmStylingProviders;
      self->_cmStylingProviders = v7;

      cmStylingProviders = self->_cmStylingProviders;
    }
    -[NSMutableDictionary setObject:forKey:](cmStylingProviders, "setObject:forKey:", v5, v4);
    -[MTStylingProvidingSolidColorLayer _updateVisualStylingProviders](self, "_updateVisualStylingProviders");
  }

  return v5;
}

- (void)setBackgroundColor:(CGColor *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MTStylingProvidingSolidColorLayer;
  -[MTStylingProvidingSolidColorLayer setBackgroundColor:](&v4, sel_setBackgroundColor_, a3);
  -[MTStylingProvidingSolidColorLayer _updateVisualStylingProviders](self, "_updateVisualStylingProviders");
}

- (void)_updateVisualStylingProviders
{
  -[MTStylingProvidingSolidColorLayer _updateVisualStylingProviderForCategory:](self, "_updateVisualStylingProviderForCategory:", CFSTR("stroke"));
  -[MTStylingProvidingSolidColorLayer _updateVisualStylingProviderForCategory:](self, "_updateVisualStylingProviderForCategory:", CFSTR("fill"));
}

- (void)_updateVisualStylingProviderForCategory:(id)a3
{
  NSMutableDictionary *cmStylingProviders;
  id v5;
  void *v6;
  id v7;

  cmStylingProviders = self->_cmStylingProviders;
  v5 = a3;
  -[NSMutableDictionary objectForKey:](cmStylingProviders, "objectForKey:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[MTStylingProvidingSolidColorLayer _styleSetForCategory:](self, "_styleSetForCategory:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "_setVisualStyleSet:", v6);
}

- (id)_styleSetForCategory:(id)a3
{
  __CFString *v4;
  uint64_t v5;
  void *v6;

  v4 = (__CFString *)a3;
  if (MTCGColorIsPerceivedLight((CGColor *)-[MTStylingProvidingSolidColorLayer backgroundColor](self, "backgroundColor")))
  {
    if (CFSTR("fill") == v4)
    {
      -[MTStylingProvidingSolidColorLayer _fillDarkStyleSet](self, "_fillDarkStyleSet");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    if (CFSTR("stroke") == v4)
    {
      -[MTStylingProvidingSolidColorLayer _strokeDarkStyleSet](self, "_strokeDarkStyleSet");
      v5 = objc_claimAutoreleasedReturnValue();
LABEL_11:
      v6 = (void *)v5;
      goto LABEL_12;
    }
  }
  else
  {
    if (CFSTR("fill") == v4)
    {
      -[MTStylingProvidingSolidColorLayer _fillLightStyleSet](self, "_fillLightStyleSet");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    if (CFSTR("stroke") == v4)
    {
      -[MTStylingProvidingSolidColorLayer _strokeLightStyleSet](self, "_strokeLightStyleSet");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
  }
  v6 = 0;
LABEL_12:

  return v6;
}

- (id)_fillLightStyleSet
{
  CGColor *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v3 = (CGColor *)-[MTStylingProvidingSolidColorLayer backgroundColor](self, "backgroundColor");
  MTStylingProvidingSolidColorLayerStyleDictionaryForPlusLAndWhiteTint(v3, 0.185, 0.85);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MTStylingProvidingSolidColorLayerHighlightStyleDictionary(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = CFSTR("primary");
  v9[1] = CFSTR("highlight");
  v10[0] = v4;
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTStylingProvidingSolidColorLayer _styleSetForCategory:styleDefinitions:](self, "_styleSetForCategory:styleDefinitions:", CFSTR("fill"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_strokeLightStyleSet
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  MTStylingProvidingSolidColorLayerStyleDictionaryForPlusLAndWhiteTint((CGColor *)-[MTStylingProvidingSolidColorLayer backgroundColor](self, "backgroundColor"), 0.48, 0.7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = CFSTR("primary");
  v7[1] = CFSTR("secondary");
  v8[0] = &unk_1E587FED8;
  v8[1] = v3;
  v7[2] = CFSTR("tertiary");
  v8[2] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTStylingProvidingSolidColorLayer _styleSetForCategory:styleDefinitions:](self, "_styleSetForCategory:styleDefinitions:", CFSTR("stroke"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_fillDarkStyleSet
{
  CGColor *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v3 = (CGColor *)-[MTStylingProvidingSolidColorLayer backgroundColor](self, "backgroundColor");
  MTStylingProvidingSolidColorLayerStyleDictionaryForPlusDAmount(v3, 0.9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MTStylingProvidingSolidColorLayerHighlightStyleDictionary(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = CFSTR("primary");
  v9[1] = CFSTR("highlight");
  v10[0] = v4;
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTStylingProvidingSolidColorLayer _styleSetForCategory:styleDefinitions:](self, "_styleSetForCategory:styleDefinitions:", CFSTR("fill"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_strokeDarkStyleSet
{
  CGColor *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v3 = (CGColor *)-[MTStylingProvidingSolidColorLayer backgroundColor](self, "backgroundColor");
  MTStylingProvidingSolidColorLayerStyleDictionaryForPlusDAmount(v3, 0.2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MTStylingProvidingSolidColorLayerStyleDictionaryForPlusDAmount(v3, 0.5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MTStylingProvidingSolidColorLayerStyleDictionaryForPlusDAmount(v3, 0.7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = CFSTR("primary");
  v10[1] = CFSTR("secondary");
  v11[0] = v4;
  v11[1] = v5;
  v10[2] = CFSTR("tertiary");
  v11[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTStylingProvidingSolidColorLayer _styleSetForCategory:styleDefinitions:](self, "_styleSetForCategory:styleDefinitions:", CFSTR("stroke"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_styleSetForCategory:(id)a3 styleDefinitions:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  MTVisualStyleSet *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[MTStylingProvidingSolidColorLayer _styleSetNameForCategory:](self, "_styleSetNameForCategory:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v9 = (void *)objc_msgSend(&unk_1E587FF00, "mutableCopy");
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v15, "capitalizedString", (_QWORD)v21);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "stringByAppendingString:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "setObject:forKey:", v17, v15);
        objc_msgSend(v10, "objectForKey:", v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKey:", v18, v17);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v12);
  }

  objc_msgSend(v9, "setObject:forKey:", v8, CFSTR("styles"));
  v19 = -[MTVisualStyleSet initWithName:visualStyleSetDescription:andDescendantDescriptions:]([MTVisualStyleSet alloc], "initWithName:visualStyleSetDescription:andDescendantDescriptions:", v7, v9, 0);

  return v19;
}

- (id)_styleSetNameForCategory:(id)a3
{
  __CFString *v5;
  __CFString *v6;
  void *v8;
  void *v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v13;

  v5 = (__CFString *)a3;
  v6 = v5;
  if (CFSTR("stroke") != v5 && CFSTR("fill") != v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MTStylingProvidingSolidColorLayer.m"), 148, CFSTR("MTStylingProvidingSolidColorLayer only supports stroke and fill"));

  }
  v8 = (void *)objc_msgSend(CFSTR("solidColorBackground"), "mutableCopy");
  v9 = v8;
  if (CFSTR("stroke") == v6)
  {
    v10 = CFSTR("Stroke");
  }
  else
  {
    if (CFSTR("fill") != v6)
      goto LABEL_11;
    v10 = CFSTR("Fill");
  }
  objc_msgSend(v8, "appendString:", v10);
LABEL_11:
  if (MTCGColorIsPerceivedLight((CGColor *)-[MTStylingProvidingSolidColorLayer backgroundColor](self, "backgroundColor")))v11 = CFSTR("Dark");
  else
    v11 = CFSTR("Light");
  objc_msgSend(v9, "appendString:", v11);

  return v9;
}

- (NSMutableDictionary)cmStylingProviders
{
  return self->_cmStylingProviders;
}

- (void)setCmStylingProviders:(id)a3
{
  objc_storeStrong((id *)&self->_cmStylingProviders, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cmStylingProviders, 0);
}

@end
