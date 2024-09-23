@implementation SUUIImageViewElement

- (SUUIImageViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  id v9;
  id v10;
  SUUIImageViewElement *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSURL *url;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  uint64_t v20;
  NSString *resourceName;
  NSURL *v22;
  void *v23;
  void *v24;
  CGFloat v25;
  CGFloat v26;
  uint64_t v27;
  NSString *alt;
  void *v29;
  char v30;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(_QWORD *, void *, uint64_t, BOOL *);
  void *v35;
  id v36;
  _QWORD *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  _QWORD v45[4];
  objc_super v46;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v46.receiver = self;
  v46.super_class = (Class)SUUIImageViewElement;
  v11 = -[SUUIViewElement initWithDOMElement:parent:elementFactory:](&v46, sel_initWithDOMElement_parent_elementFactory_, v8, v9, v10);
  if (v11)
  {
    if (initWithDOMElement_parent_elementFactory__sOnce != -1)
      dispatch_once(&initWithDOMElement_parent_elementFactory__sOnce, &__block_literal_global_8);
    objc_msgSend(v8, "getAttribute:", CFSTR("srcset"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "getAttribute:", CFSTR("src"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "length"))
    {
      v14 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v13);
      url = v11->_url;
      v11->_url = (NSURL *)v14;

    }
    else if (objc_msgSend(v12, "length"))
    {
      v45[0] = 0;
      v45[1] = v45;
      v45[2] = 0x2020000000;
      v45[3] = 0;
      v39 = 0;
      v40 = &v39;
      v41 = 0x3032000000;
      v42 = __Block_byref_object_copy__15;
      v43 = __Block_byref_object_dispose__15;
      v44 = 0;
      v16 = (void *)initWithDOMElement_parent_elementFactory__sSrcSetRegularExpression;
      v17 = objc_msgSend(v12, "length");
      v32 = MEMORY[0x24BDAC760];
      v33 = 3221225472;
      v34 = __65__SUUIImageViewElement_initWithDOMElement_parent_elementFactory___block_invoke_8;
      v35 = &unk_2511F6150;
      v36 = v12;
      v37 = v45;
      v38 = &v39;
      objc_msgSend(v16, "enumerateMatchesInString:options:range:usingBlock:", v36, 0, 0, v17, &v32);
      objc_storeStrong((id *)&v11->_url, (id)v40[5]);

      _Block_object_dispose(&v39, 8);
      _Block_object_dispose(v45, 8);
    }
    -[NSURL scheme](v11->_url, "scheme", v32, v33, v34, v35);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("resource"));

    if (v19)
    {
      -[NSURL host](v11->_url, "host");
      v20 = objc_claimAutoreleasedReturnValue();
      resourceName = v11->_resourceName;
      v11->_resourceName = (NSString *)v20;

      v22 = v11->_url;
      v11->_url = 0;

    }
    objc_msgSend(v8, "getAttribute:", CFSTR("height"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "getAttribute:", CFSTR("width"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "length") && objc_msgSend(v24, "length"))
    {
      objc_msgSend(v23, "doubleValue");
      v11->_size.height = v25;
      objc_msgSend(v24, "doubleValue");
      v11->_size.width = v26;
    }
    objc_msgSend(v8, "getAttribute:", CFSTR("alt"));
    v27 = objc_claimAutoreleasedReturnValue();
    alt = v11->_alt;
    v11->_alt = (NSString *)v27;

    objc_msgSend(v8, "getAttribute:", CFSTR("disabled"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v29, "length"))
      v30 = objc_msgSend(v29, "BOOLValue") ^ 1;
    else
      v30 = -1;
    v11->_enabled = v30;

  }
  return v11;
}

void __65__SUUIImageViewElement_initWithDOMElement_parent_elementFactory___block_invoke()
{
  void *v0;
  double v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "scale");
  initWithDOMElement_parent_elementFactory__sScreenScale = (uint64_t)v1;

  v2 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1798]), "initWithPattern:options:error:", CFSTR("([^ ,]+) +([^,]+)"), 0, 0);
  v3 = (void *)initWithDOMElement_parent_elementFactory__sSrcSetRegularExpression;
  initWithDOMElement_parent_elementFactory__sSrcSetRegularExpression = v2;

}

void __65__SUUIImageViewElement_initWithDOMElement_parent_elementFactory___block_invoke_8(_QWORD *a1, void *a2, uint64_t a3, BOOL *a4)
{
  BOOL v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;

  v20 = a2;
  v6 = objc_msgSend(v20, "numberOfRanges") == 3;
  v7 = v20;
  if (v6)
  {
    v8 = (void *)a1[4];
    v9 = objc_msgSend(v20, "rangeAtIndex:", 2);
    objc_msgSend(v8, "substringWithRange:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "integerValue");

    v13 = objc_alloc(MEMORY[0x24BDBCF48]);
    v14 = (void *)a1[4];
    v15 = objc_msgSend(v20, "rangeAtIndex:", 1);
    objc_msgSend(v14, "substringWithRange:", v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v13, "initWithString:", v17);

    if (v18)
    {
      v19 = *(_QWORD *)(a1[5] + 8);
      if (v12 > *(_QWORD *)(v19 + 24))
      {
        *(_QWORD *)(v19 + 24) = v12;
        objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), v18);
        *a4 = v12 == initWithDOMElement_parent_elementFactory__sScreenScale;
      }
    }

    v7 = v20;
  }

}

- (id)resourceCacheKey
{
  SUUIImageViewElementCacheKey *resourceCacheKey;
  SUUIImageViewElementCacheKey *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  SUUIImageViewElementCacheKey *v12;
  SUUIImageViewElementCacheKey *v13;

  resourceCacheKey = self->_resourceCacheKey;
  if (!resourceCacheKey)
  {
    v4 = [SUUIImageViewElementCacheKey alloc];
    -[SUUIImageViewElement URL](self, "URL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIImageViewElement size](self, "size");
    v7 = v6;
    v9 = v8;
    -[SUUIImageViewElement style](self, "style");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "imageTreatment");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[SUUIImageViewElementCacheKey initWithURL:size:imageTreatment:](v4, "initWithURL:size:imageTreatment:", v5, v11, v7, v9);
    v13 = self->_resourceCacheKey;
    self->_resourceCacheKey = v12;

    resourceCacheKey = self->_resourceCacheKey;
  }
  return resourceCacheKey;
}

- (CGSize)size
{
  double height;
  double width;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  float v8;
  float v9;
  double v10;
  double v11;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  -[SUUIImageViewElement style](self, "style");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "maxHeight");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "maxWidth");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5 && v6)
  {
    objc_msgSend(v5, "floatValue");
    height = v8;
    objc_msgSend(v7, "floatValue");
    width = v9;
  }

  v10 = width;
  v11 = height;
  result.height = v11;
  result.width = v10;
  return result;
}

- (id)accessibilityText
{
  NSString *alt;
  objc_super v4;

  alt = self->_alt;
  if (alt)
    return alt;
  v4.receiver = self;
  v4.super_class = (Class)SUUIImageViewElement;
  -[SUUIImageViewElement accessibilityText](&v4, sel_accessibilityText);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)applyUpdatesWithElement:(id)a3
{
  SUUIImageViewElement *v4;
  SUUIImageViewElement *v5;
  SUUIImageViewElement *v6;
  SUUIImageViewElementCacheKey *v7;
  NSURL *v8;
  CGSize *p_size;
  void *url;
  void *v11;
  uint64_t v12;
  SUUIImageViewElementCacheKey *transientResourceCacheKey;
  NSString *v14;
  NSString *alt;
  SUUIImageViewElementCacheKey *resourceCacheKey;
  NSString *v17;
  NSString *resourceName;
  CGFloat v19;
  CGFloat v20;
  NSURL *v21;
  objc_super v23;

  v4 = (SUUIImageViewElement *)a3;
  v23.receiver = self;
  v23.super_class = (Class)SUUIImageViewElement;
  -[SUUIViewElement applyUpdatesWithElement:](&v23, sel_applyUpdatesWithElement_, v4);
  v5 = (SUUIImageViewElement *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self)
  {
    if (v4 != self && v4)
    {
      v14 = (NSString *)-[NSString copy](v4->_alt, "copy");
      alt = self->_alt;
      self->_alt = v14;

      resourceCacheKey = self->_resourceCacheKey;
      self->_resourceCacheKey = 0;

      -[SUUIImageViewElement resourceName](v4, "resourceName");
      v17 = (NSString *)objc_claimAutoreleasedReturnValue();
      resourceName = self->_resourceName;
      self->_resourceName = v17;

      -[SUUIImageViewElement size](v4, "size");
      self->_size.width = v19;
      self->_size.height = v20;
      -[SUUIImageViewElement URL](v4, "URL");
      v21 = (NSURL *)objc_claimAutoreleasedReturnValue();
      url = self->_url;
      self->_url = v21;
      goto LABEL_7;
    }
  }
  else if ((-[NSURL isEqual:](v5->_url, "isEqual:", self->_url) & 1) == 0)
  {
    v7 = [SUUIImageViewElementCacheKey alloc];
    v8 = self->_url;
    p_size = &self->_size;
    -[SUUIImageViewElement style](self, "style");
    url = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(url, "imageTreatment");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[SUUIImageViewElementCacheKey initWithURL:size:imageTreatment:](v7, "initWithURL:size:imageTreatment:", v8, v11, p_size->width, p_size->height);
    transientResourceCacheKey = v6->_transientResourceCacheKey;
    v6->_transientResourceCacheKey = (SUUIImageViewElementCacheKey *)v12;

LABEL_7:
  }

  return v6;
}

- (id)entityValueProperties
{
  void *v2;
  void *v3;
  void *v4;

  -[SUUIImageViewElement attributes](self, "attributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("valueProperty"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)entityValueProviderDidChange
{
  NSString *entityResourceName;
  NSURL *entityURL;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUUIImageViewElement;
  -[SUUIViewElement entityValueProviderDidChange](&v5, sel_entityValueProviderDidChange);
  self->_hasValidEntityValues = 0;
  entityResourceName = self->_entityResourceName;
  self->_entityResourceName = 0;

  entityURL = self->_entityURL;
  self->_entityURL = 0;

}

- (BOOL)isEnabled
{
  int enabled;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  objc_super v11;

  enabled = self->_enabled;
  if (enabled != 255)
    return enabled != 0;
  -[SUUIImageViewElement style](self, "style");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageTreatment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = SUUIImageTreatmentForString(v5);

  if (v6 == 8)
    return 0;
  -[SUUIImageViewElement style](self, "style");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageTreatment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = SUUIImageTreatmentForString(v8);

  if (v9 == 9)
    return 0;
  v11.receiver = self;
  v11.super_class = (Class)SUUIImageViewElement;
  return -[SUUIViewElement isEnabled](&v11, sel_isEnabled);
}

- (int64_t)pageComponentType
{
  return 24;
}

- (BOOL)rendersWithPerspective
{
  void *v2;
  void *v3;
  uint64_t v4;

  -[SUUIImageViewElement style](self, "style");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageTreatment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = SUUIImageTreatmentForString(v3);

  return v4 == 7;
}

- (BOOL)rendersWithParallax
{
  void *v2;
  void *v3;
  uint64_t v4;

  -[SUUIImageViewElement style](self, "style");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageTreatment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = SUUIImageTreatmentForString(v3);

  return v4 == 13;
}

- (id)uniquingMapKey
{
  NSURL *entityURL;
  NSURL *v4;
  objc_super v6;

  -[SUUIImageViewElement _loadEntityValuesIfNeeded](self, "_loadEntityValuesIfNeeded");
  entityURL = self->_entityURL;
  if (entityURL || (entityURL = (NSURL *)self->_entityResourceName) != 0)
  {
    v4 = entityURL;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)SUUIImageViewElement;
    -[SUUIViewElement uniquingMapKey](&v6, sel_uniquingMapKey);
    v4 = (NSURL *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (NSString)resourceName
{
  NSString *entityResourceName;

  -[SUUIImageViewElement _loadEntityValuesIfNeeded](self, "_loadEntityValuesIfNeeded");
  entityResourceName = self->_entityResourceName;
  if (!entityResourceName)
    entityResourceName = self->_resourceName;
  return entityResourceName;
}

- (NSURL)URL
{
  NSURL *entityURL;

  -[SUUIImageViewElement _loadEntityValuesIfNeeded](self, "_loadEntityValuesIfNeeded");
  entityURL = self->_entityURL;
  if (!entityURL)
    entityURL = self->_url;
  return entityURL;
}

- (void)_loadEntityValuesIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  NSURL *v8;
  void *v9;
  int v10;
  NSString *v11;
  NSURL *entityURL;
  NSString *entityResourceName;
  NSString *v14;
  SUUIImageViewElementCacheKey *resourceCacheKey;
  NSURL *v16;

  if (!self->_hasValidEntityValues)
  {
    self->_hasValidEntityValues = 1;
    -[SUUIViewElement entityValueProvider](self, "entityValueProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      -[SUUIImageViewElement attributes](self, "attributes");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKey:", CFSTR("valueProperty"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "scale");
        objc_msgSend(v3, "imageURLForEntityArtworkProperty:fittingSize:destinationScale:", v5, self->_size.width, self->_size.height, v7);
        v8 = (NSURL *)objc_claimAutoreleasedReturnValue();

        -[NSURL scheme](v8, "scheme");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("resource"));

        if (v10)
        {
          -[NSURL host](v8, "host");
          v11 = (NSString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v11 = 0;
        }
      }
      else
      {
        v11 = 0;
        v8 = 0;
      }

    }
    else
    {
      v11 = 0;
      v8 = 0;
    }
    entityURL = self->_entityURL;
    self->_entityURL = v8;
    v16 = v8;

    entityResourceName = self->_entityResourceName;
    self->_entityResourceName = v11;
    v14 = v11;

    resourceCacheKey = self->_resourceCacheKey;
    self->_resourceCacheKey = 0;

  }
}

- (CGSize)shadowOffset
{
  double width;
  double height;
  CGSize result;

  width = self->_shadowOffset.width;
  height = self->_shadowOffset.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setShadowOffset:(CGSize)a3
{
  self->_shadowOffset = a3;
}

- (double)shadowRadius
{
  return self->_shadowRadius;
}

- (void)setShadowRadius:(double)a3
{
  self->_shadowRadius = a3;
}

- (UIColor)shadowColor
{
  return self->_shadowColor;
}

- (void)setShadowColor:(id)a3
{
  objc_storeStrong((id *)&self->_shadowColor, a3);
}

- (id)transientResourceCacheKey
{
  return self->_transientResourceCacheKey;
}

- (float)layerShadowOpacity
{
  return self->_layerShadowOpacity;
}

- (void)setLayerShadowOpacity:(float)a3
{
  self->_layerShadowOpacity = a3;
}

- (CGSize)layerShadowOffset
{
  double width;
  double height;
  CGSize result;

  width = self->_layerShadowOffset.width;
  height = self->_layerShadowOffset.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setLayerShadowOffset:(CGSize)a3
{
  self->_layerShadowOffset = a3;
}

- (double)layerShadowRadius
{
  return self->_layerShadowRadius;
}

- (void)setLayerShadowRadius:(double)a3
{
  self->_layerShadowRadius = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_transientResourceCacheKey, 0);
  objc_storeStrong((id *)&self->_shadowColor, 0);
  objc_storeStrong((id *)&self->_resourceName, 0);
  objc_storeStrong((id *)&self->_resourceCacheKey, 0);
  objc_storeStrong((id *)&self->_entityURL, 0);
  objc_storeStrong((id *)&self->_entityResourceName, 0);
  objc_storeStrong((id *)&self->_alt, 0);
}

@end
