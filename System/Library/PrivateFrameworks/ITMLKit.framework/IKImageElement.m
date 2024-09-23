@implementation IKImageElement

+ (BOOL)shouldParseChildDOMElements
{
  return 0;
}

- (IKImageElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  IKImageElement *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)IKImageElement;
  v9 = -[IKViewElement initWithDOMElement:parent:elementFactory:](&v13, sel_initWithDOMElement_parent_elementFactory_, v8, a4, a5);
  if (v9)
  {
    v10 = (void *)objc_opt_class();
    objc_msgSend(v8, "nodeName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_imageType = objc_msgSend(v10, "_imageTypeForTagName:", v11);

    -[IKImageElement _initCommon](v9, "_initCommon");
  }

  return v9;
}

- (IKImageElement)initWithPrototypeElement:(id)a3 parent:(id)a4 appDataItem:(id)a5
{
  id v8;
  IKImageElement *v9;
  objc_super v11;

  v8 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IKImageElement;
  v9 = -[IKViewElement initWithPrototypeElement:parent:appDataItem:](&v11, sel_initWithPrototypeElement_parent_appDataItem_, v8, a4, a5);
  if (v9)
  {
    v9->_imageType = objc_msgSend(v8, "imageType");
    -[IKImageElement _initCommon](v9, "_initCommon");
  }

  return v9;
}

- (IKImageElement)initWithOriginalElement:(id)a3
{
  id v4;
  IKImageElement *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)IKImageElement;
  v5 = -[IKViewElement initWithOriginalElement:](&v7, sel_initWithOriginalElement_, v4);
  if (v5)
  {
    v5->_imageType = objc_msgSend(v4, "imageType");
    -[IKImageElement _initCommon](v5, "_initCommon");
  }

  return v5;
}

- (IKImageElement)fallbackImageElement
{
  void *v3;
  _QWORD v5[5];
  id v6;

  if (!self->_fallbackImageElement)
  {
    if (-[NSArray count](self->_srcsetRules, "count"))
    {
      if (self->_bestRule || (-[IKImageElement _resolveURL](self, "_resolveURL"), self->_bestRule))
      {
        v3 = (void *)-[NSArray mutableCopy](self->_srcsetRules, "mutableCopy");
        objc_msgSend(v3, "removeObject:", self->_bestRule);
        if (objc_msgSend(v3, "count"))
        {
          v5[0] = MEMORY[0x1E0C809B0];
          v5[1] = 3221225472;
          v5[2] = __38__IKImageElement_fallbackImageElement__block_invoke;
          v5[3] = &unk_1E9F4C170;
          v5[4] = self;
          v6 = v3;
          -[IKViewElement performImplicitUpdates:](self, "performImplicitUpdates:", v5);

        }
      }
    }
  }
  return self->_fallbackImageElement;
}

void __38__IKImageElement_fallbackImageElement__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithOriginalElement:", *(_QWORD *)(a1 + 32));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 240);
  *(_QWORD *)(v3 + 240) = v2;

  v5 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 240);
  v7 = *(void **)(v6 + 280);
  *(_QWORD *)(v6 + 280) = v5;

}

- (NSURL)url
{
  if (!self->_resolvedURL && -[NSArray count](self->_srcsetRules, "count"))
    -[IKImageElement _resolveURL](self, "_resolveURL");
  return self->_resolvedURL;
}

- (double)width
{
  return self->_srcWidth;
}

- (double)height
{
  return self->_srcHeight;
}

- (NSURL)placeholderURL
{
  void *v2;
  void *v3;

  -[IKViewElement style](self, "style");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imagePlaceholderURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (unint64_t)position
{
  void *v2;
  unint64_t v3;

  -[IKViewElement style](self, "style");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "imagePosition");

  return v3;
}

- (UIColor)borderColor
{
  void *v2;
  void *v3;
  void *v4;

  -[IKViewElement style](self, "style");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ikBorderColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "color");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v4;
}

- (int64_t)fill
{
  void *v2;
  int64_t v3;

  -[IKViewElement style](self, "style");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "fillImage");

  return v3;
}

- (int64_t)reflect
{
  void *v2;
  int64_t v3;

  -[IKViewElement style](self, "style");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "reflectImage");

  return v3;
}

- (void)appDocumentDidMarkStylesDirty
{
  NSURL *resolvedURL;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)IKImageElement;
  -[IKViewElement appDocumentDidMarkStylesDirty](&v4, sel_appDocumentDidMarkStylesDirty);
  if (-[NSArray count](self->_srcsetRules, "count"))
  {
    -[IKViewElement setUpdateType:](self, "setUpdateType:", 4);
    resolvedURL = self->_resolvedURL;
    self->_resolvedURL = 0;

  }
}

- (void)_parseSrcset:(id)a3
{
  id v3;
  void *v4;
  NSURL *resolvedURL;
  void *v6;
  double v7;
  double v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  NSURL *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSArray *srcsetRules;
  NSURL *v21;
  NSURL *v22;
  id v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, void *);
  void *v32;
  id v33;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  char v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (_parseSrcset__sOnce != -1)
    dispatch_once(&_parseSrcset__sOnce, &__block_literal_global_5);
  v49 = 0;
  v50 = &v49;
  v51 = 0x2020000000;
  v52 = 0;
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__9;
  v47 = __Block_byref_object_dispose__9;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
  v48 = (id)objc_claimAutoreleasedReturnValue();
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__9;
  v41 = __Block_byref_object_dispose__9;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
  v42 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)_parseSrcset__sSrcsetRegularExpression;
  objc_msgSend(v3, "length");
  v29 = MEMORY[0x1E0C809B0];
  v30 = 3221225472;
  v31 = __31__IKImageElement__parseSrcset___block_invoke_23;
  v32 = &unk_1E9F4CE50;
  v33 = v3;
  v34 = &v49;
  v35 = &v43;
  v36 = &v37;
  v23 = v33;
  objc_msgSend(v4, "enumerateMatchesInString:options:range:usingBlock:");
  objc_storeStrong((id *)&self->_srcset, (id)v38[5]);
  if (*((_BYTE *)v50 + 24))
  {
    objc_storeStrong((id *)&self->_srcsetRules, (id)v44[5]);
    resolvedURL = self->_resolvedURL;
    self->_resolvedURL = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scale");
    v8 = v7;

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v9 = (id)v44[5];
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v53, 16);
    if (v10)
    {
      v11 = 0;
      v12 = 0;
      v13 = (uint64_t)v8;
      v14 = *(_QWORD *)v26;
LABEL_7:
      v15 = 0;
      while (1)
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v9);
        v16 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v15);
        objc_msgSend(v16, "descriptor");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "integerValue");

        if (v18 > v11 || v18 == v13)
        {
          resolvedURL = v16;

          v11 = v18;
          v12 = resolvedURL;
          if (v18 == v13)
            break;
        }
        if (v10 == ++v15)
        {
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v53, 16);
          resolvedURL = v12;
          if (v10)
            goto LABEL_7;
          break;
        }
      }
    }
    else
    {
      resolvedURL = 0;
    }

    srcsetRules = self->_srcsetRules;
    self->_srcsetRules = 0;

    -[NSURL imageURL](resolvedURL, "imageURL");
    v21 = (NSURL *)objc_claimAutoreleasedReturnValue();
    v22 = self->_resolvedURL;
    self->_resolvedURL = v21;

  }
  _Block_object_dispose(&v37, 8);

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v49, 8);

}

void __31__IKImageElement__parseSrcset___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", CFSTR("([^\\s,]+)(\\s+[^,]+)?"), 0, 0);
  v1 = (void *)_parseSrcset__sSrcsetRegularExpression;
  _parseSrcset__sSrcsetRegularExpression = v0;

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_parseSrcset__sWhiteSpaceChars;
  _parseSrcset__sWhiteSpaceChars = v2;

}

void __31__IKImageElement__parseSrcset___block_invoke_23(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  IKSrcSetRule *v15;
  id v16;

  v16 = a2;
  if (objc_msgSend(v16, "numberOfRanges") == 3)
  {
    v3 = objc_msgSend(v16, "rangeAtIndex:", 1);
    v5 = v4;
    v6 = objc_msgSend(v16, "rangeAtIndex:", 2);
    v8 = v7;
    v9 = objc_alloc(MEMORY[0x1E0C99E98]);
    objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v3, v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByTrimmingCharactersInSet:", _parseSrcset__sWhiteSpaceChars);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v9, "initWithString:", v11);

    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v6, v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringByTrimmingCharactersInSet:", _parseSrcset__sWhiteSpaceChars);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (!v12)
        goto LABEL_8;
      goto LABEL_7;
    }
    v14 = &stru_1E9F50578;
    if (v12)
    {
LABEL_7:
      v15 = -[IKSrcSetRule initWithURL:descriptor:]([IKSrcSetRule alloc], "initWithURL:descriptor:", v12, v14);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= -[__CFString hasSuffix:](v14, "hasSuffix:", CFSTR("x")) ^ 1;
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v15);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setObject:forKey:", v12, v14);

    }
  }
  else
  {
    v14 = &stru_1E9F50578;
  }
LABEL_8:

}

+ (unint64_t)_imageTypeForTagName:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("img")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("fullscreenImg")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("decorationImage")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_initCommon
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  double v9;
  double v10;
  char v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSURL *v21;
  NSURL *resolvedURL;
  id v23;

  -[IKViewElement attributes](self, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("width"));
  v23 = (id)objc_claimAutoreleasedReturnValue();

  -[IKViewElement attributes](self, "attributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("height"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[IKViewElement attributes](self, "attributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("aspectRatio"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_opt_respondsToSelector();
  v9 = 0.0;
  v10 = 0.0;
  if ((v8 & 1) != 0)
    v10 = (float)objc_msgSend(v23, "integerValue", 0.0);
  self->_srcWidth = v10;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v9 = (float)objc_msgSend(v5, "integerValue");
  self->_srcHeight = v9;
  v11 = objc_opt_respondsToSelector();
  v12 = 0.0;
  if ((v11 & 1) != 0)
    objc_msgSend(v7, "doubleValue", 0.0);
  self->_aspectRatio = v12;
  -[IKViewElement attributes](self, "attributes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("src"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[IKViewElement attributes](self, "attributes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("srcset"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v16, "length"))
  {
    v17 = (void *)MEMORY[0x1DF092260]();
    -[IKImageElement _parseSrcset:](self, "_parseSrcset:", v16);
    objc_autoreleasePoolPop(v17);
  }
  if (!-[NSDictionary count](self->_srcset, "count") && !self->_resolvedURL && objc_msgSend(v14, "length"))
  {
    v18 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringByTrimmingCharactersInSet:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "URLWithString:", v20);
    v21 = (NSURL *)objc_claimAutoreleasedReturnValue();
    resolvedURL = self->_resolvedURL;
    self->_resolvedURL = v21;

  }
}

- (void)_resolveURL
{
  void *v3;
  double v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  IKSrcSetRule *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  BOOL v20;
  IKSrcSetRule *v21;
  IKSrcSetRule *bestRule;
  IKSrcSetRule *v23;
  uint64_t v24;
  NSURL *resolvedURL;
  id obj;
  IKImageElement *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scale");
  v5 = v4;

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v27 = self;
  -[IKImageElement srcsetRules](self, "srcsetRules");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v11, "mediaQuery");
        v12 = objc_claimAutoreleasedReturnValue();
        if (!v12)
          goto LABEL_8;
        v13 = (void *)v12;
        -[IKViewElement appDocument](v27, "appDocument");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "mediaQuery");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v15;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v14, "evaluateStyleMediaQueryList:", v16);

        if (v17)
        {
LABEL_8:
          objc_msgSend(v11, "descriptor");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v18, "hasSuffix:", CFSTR("x")))
          {
            objc_msgSend(v11, "descriptor");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "integerValue") == (uint64_t)v5;

          }
          else
          {
            v20 = 0;
          }

          if (v20 || !v8)
          {
            v21 = v11;

            v8 = v21;
          }
        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  bestRule = v27->_bestRule;
  v27->_bestRule = v8;
  v23 = v8;

  -[IKSrcSetRule imageURL](v23, "imageURL");
  v24 = objc_claimAutoreleasedReturnValue();
  resolvedURL = v27->_resolvedURL;
  v27->_resolvedURL = (NSURL *)v24;

}

- (NSDictionary)srcset
{
  return self->_srcset;
}

- (unint64_t)imageType
{
  return self->_imageType;
}

- (double)aspectRatio
{
  return self->_aspectRatio;
}

- (NSURL)resolvedURL
{
  return self->_resolvedURL;
}

- (void)setResolvedURL:(id)a3
{
  objc_storeStrong((id *)&self->_resolvedURL, a3);
}

- (NSArray)srcsetRules
{
  return self->_srcsetRules;
}

- (void)setSrcsetRules:(id)a3
{
  objc_storeStrong((id *)&self->_srcsetRules, a3);
}

- (IKSrcSetRule)bestRule
{
  return self->_bestRule;
}

- (void)setBestRule:(id)a3
{
  objc_storeStrong((id *)&self->_bestRule, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bestRule, 0);
  objc_storeStrong((id *)&self->_srcsetRules, 0);
  objc_storeStrong((id *)&self->_resolvedURL, 0);
  objc_storeStrong((id *)&self->_srcset, 0);
  objc_storeStrong((id *)&self->_fallbackImageElement, 0);
}

@end
