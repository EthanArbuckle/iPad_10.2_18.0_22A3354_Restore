@implementation DOCTagRenderingRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionOutlineColor, 0);
  objc_storeStrong((id *)&self->_ringColor, 0);
  objc_storeStrong((id *)&self->_fillColors, 0);
  objc_storeStrong((id *)&self->_tags, 0);
}

void __67__DOCTagRenderingRequest__UIImageCacheKeyWithAdditionalComponents___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resolvedColorWithTraitCollection:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v7;
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
    v6 = v7;
  }

}

- (id)_UIImageCacheKeyWithAdditionalComponents:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void (**v7)(void *, const __CFString *, NSArray *);
  NSArray *v8;
  NSArray *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t aBlock;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t, void *);
  void *v19;
  id v20;
  DOCTagRenderingRequest *v21;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock = MEMORY[0x24BDAC760];
  v17 = 3221225472;
  v18 = __67__DOCTagRenderingRequest__UIImageCacheKeyWithAdditionalComponents___block_invoke;
  v19 = &unk_24E327DC8;
  v6 = v5;
  v20 = v6;
  v21 = self;
  v7 = (void (**)(void *, const __CFString *, NSArray *))_Block_copy(&aBlock);
  v7[2](v7, CFSTR("fillColors"), self->_fillColors);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", self->_ringColor, 0);
  v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, CFSTR("ringColor"), v8);

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", self->_selectionOutlineColor, 0);
  v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, CFSTR("selectionOutlineColor"), v9);

  v10 = (void *)MEMORY[0x24BDBCEB8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_tagDimension);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_spacingType);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_layoutDirection);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "arrayWithObjects:", v6, v11, v12, v13, 0, aBlock, v17, v18, v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count"))
    objc_msgSend(v14, "addObjectsFromArray:", v4);

  return v14;
}

void __67__DOCTagRenderingRequest__UIImageCacheKeyWithAdditionalComponents___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  int8x16_t v6;
  id v7;
  _QWORD v8[4];
  int8x16_t v9;

  v7 = a3;
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  if (objc_msgSend(v7, "count"))
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __67__DOCTagRenderingRequest__UIImageCacheKeyWithAdditionalComponents___block_invoke_2;
    v8[3] = &unk_24E327DA0;
    v6 = *(int8x16_t *)(a1 + 32);
    v5 = (id)v6.i64[0];
    v9 = vextq_s8(v6, v6, 8uLL);
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v8);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", CFSTR("none"));
  }

}

void __61__DOCTagRenderingRequest_requestForChainedTags_tagDimension___block_invoke(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "tagColorIfNotClear");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
    *a4 = objc_msgSend(*(id *)(a1 + 32), "count") == 3;
  }

}

- (DOCTagRenderingRequest)init
{
  DOCTagRenderingRequest *v2;
  DOCTagRenderingRequest *v3;
  NSArray *fillColors;
  uint64_t v5;
  UIColor *ringColor;
  UIColor *selectionOutlineColor;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)DOCTagRenderingRequest;
  v2 = -[DOCTagRenderingRequest init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_tagDimension = 16.0;
    v2->_layoutDirection = objc_msgSend(MEMORY[0x24BEBB498], "defaultWritingDirectionForLanguage:", 0) == 1;
    fillColors = v3->_fillColors;
    v3->_fillColors = (NSArray *)MEMORY[0x24BDBD1A8];

    objc_msgSend(MEMORY[0x24BE2DF20], "nonClearNoneTagColor");
    v5 = objc_claimAutoreleasedReturnValue();
    ringColor = v3->_ringColor;
    v3->_ringColor = (UIColor *)v5;

    selectionOutlineColor = v3->_selectionOutlineColor;
    v3->_selectionOutlineColor = 0;

    v3->_knockOutBorderWidth = 1.0;
    v3->_spacingType = 0;
    v3->_clearTagRenderingMode = 0;
  }
  return v3;
}

+ (id)requestForChainedTags:(id)a3 tagDimension:(double)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, uint64_t, BOOL *);
  void *v16;
  id v17;
  id v18;

  v5 = (void *)MEMORY[0x24BDBCEB8];
  v6 = a3;
  objc_msgSend(v5, "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  v14 = 3221225472;
  v15 = __61__DOCTagRenderingRequest_requestForChainedTags_tagDimension___block_invoke;
  v16 = &unk_24E327D78;
  v9 = v7;
  v17 = v9;
  v10 = v8;
  v18 = v10;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", &v13);

  if (objc_msgSend(v9, "count", v13, v14, v15, v16))
  {
    objc_msgSend((id)objc_opt_class(), "requestWithTagDimension:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTags:", v10);
    objc_msgSend(v11, "setFillColors:", v9);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (NSArray)fillColors
{
  return self->_fillColors;
}

- (double)tagDimension
{
  return self->_tagDimension;
}

- (UITraitCollection)traitCollection
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UITraitCollection *)v3;
}

- (NSArray)tags
{
  return self->_tags;
}

- (UIColor)selectionOutlineColor
{
  return self->_selectionOutlineColor;
}

- (unint64_t)spacingType
{
  return self->_spacingType;
}

- (void)setTags:(id)a3
{
  objc_storeStrong((id *)&self->_tags, a3);
}

- (void)setFillColors:(id)a3
{
  objc_storeStrong((id *)&self->_fillColors, a3);
}

+ (DOCTagRenderingRequest)requestWithTagDimension:(double)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setTagDimension:", a3);
  return (DOCTagRenderingRequest *)v4;
}

- (void)setTagDimension:(double)a3
{
  self->_tagDimension = a3;
}

- (void)setSpacingType:(unint64_t)a3
{
  self->_spacingType = a3;
}

- (void)setSelectionOutlineColor:(id)a3
{
  objc_storeStrong((id *)&self->_selectionOutlineColor, a3);
}

- (void)setLayoutDirection:(int64_t)a3
{
  self->_layoutDirection = a3;
}

- (void)setKnockOutBorderWidth:(double)a3
{
  self->_knockOutBorderWidth = a3;
}

- (UIColor)ringColor
{
  return self->_ringColor;
}

- (int64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (double)knockOutBorderWidth
{
  return self->_knockOutBorderWidth;
}

+ (id)requestForTag:(id)a3 tagDimension:(double)a4
{
  return (id)objc_msgSend(a1, "requestForTag:tagDimension:variant:", a3, 0, a4);
}

+ (id)requestForTag:(id)a3 tagDimension:(double)a4 variant:(unint64_t)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "requestWithTagDimension:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTags:", v9);

  if (a5 == 1 && objc_msgSend(v7, "labelIndex"))
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v16, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFillColors:", v11);

    objc_msgSend(v7, "tagColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRingColor:", v12);
  }
  else
  {
    objc_msgSend(v7, "tagColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v15, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFillColors:", v13);

  }
  return v8;
}

- (void)setRingColor:(id)a3
{
  objc_storeStrong((id *)&self->_ringColor, a3);
}

- (unint64_t)clearTagRenderingMode
{
  return self->_clearTagRenderingMode;
}

- (void)setClearTagRenderingMode:(unint64_t)a3
{
  self->_clearTagRenderingMode = a3;
}

- (unint64_t)variant
{
  return self->_variant;
}

- (void)setVariant:(unint64_t)a3
{
  self->_variant = a3;
}

- (BOOL)allowUnsizedSymbolImages
{
  return self->_allowUnsizedSymbolImages;
}

- (void)setAllowUnsizedSymbolImages:(BOOL)a3
{
  self->_allowUnsizedSymbolImages = a3;
}

@end
