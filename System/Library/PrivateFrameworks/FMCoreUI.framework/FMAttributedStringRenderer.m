@implementation FMAttributedStringRenderer

- (FMAttributedStringRenderer)init
{
  FMAttributedStringRendererOptions *v3;
  FMAttributedStringRenderer *v4;

  v3 = objc_alloc_init(FMAttributedStringRendererOptions);
  v4 = -[FMAttributedStringRenderer initWithOptions:](self, "initWithOptions:", v3);

  return v4;
}

- (FMAttributedStringRenderer)initWithOptions:(id)a3
{
  id v5;
  FMAttributedStringRenderer *v6;
  FMAttributedStringRenderer *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FMAttributedStringRenderer;
  v6 = -[FMAttributedStringRenderer init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_options, a3);

  return v7;
}

- (id)imageForAttributedString:(id)a3 width:(double)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[FMAttributedStringRenderer options](self, "options");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMAttributedStringRenderer imageForAttributedString:width:options:](self, "imageForAttributedString:width:options:", v6, v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)imageForAttributedString:(id)a3 width:(double)a4 options:(id)a5
{
  return -[FMAttributedStringRenderer imageForAttributedString:width:showExclusionPaths:options:](self, "imageForAttributedString:width:showExclusionPaths:options:", a3, 0, a5, a4);
}

- (id)imageForAttributedString:(id)a3 width:(double)a4 showExclusionPaths:(BOOL)a5 options:(id)a6
{
  _BOOL8 v7;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;

  v7 = a5;
  v11 = a3;
  v12 = a6;
  dispatch_assert_queue_not_V2(MEMORY[0x24BDAC9B8]);
  if (a4 <= 0.0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FMAttributedStringRenderer.m"), 62, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("width > 0.0"));

  }
  -[FMAttributedStringRenderer _textStorageForAttributedString:width:options:](self, "_textStorageForAttributedString:width:options:", v11, v12, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMAttributedStringRenderer _imageFromTextStorage:width:showExclusionPaths:](self, "_imageFromTextStorage:width:showExclusionPaths:", v13, v7, a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FMAttributedStringRenderer.m"), 68, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("retValue != nil"));

  }
  return v14;
}

- (id)_textStorageForAttributedString:(id)a3 width:(double)a4 options:(id)a5
{
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  double v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v26;
  void *v27;

  v9 = (objc_class *)MEMORY[0x24BEBB488];
  v10 = a5;
  v11 = a3;
  v12 = objc_alloc_init(v9);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBB4C0]), "initWithSize:", a4, INFINITY);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithAttributedString:", v11);
  v15 = objc_alloc_init(MEMORY[0x24BEBB490]);
  objc_msgSend(v10, "hyphenationFactor");
  *(float *)&v16 = v16;
  objc_msgSend(v15, "setHyphenationFactor:", v16);
  v17 = *MEMORY[0x24BEBB3A8];
  objc_msgSend(v11, "string");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "addAttribute:value:range:", v17, v15, 0, objc_msgSend(v18, "length"));
  objc_msgSend(v12, "setUsesDefaultHyphenation:", 0);
  objc_msgSend(v10, "exclusionPaths");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setExclusionPaths:", v19);

  objc_msgSend(v13, "setLineBreakMode:", objc_msgSend(v10, "lineBreakMode"));
  objc_msgSend(v10, "lineFragmentPadding");
  objc_msgSend(v13, "setLineFragmentPadding:");
  v20 = objc_msgSend(v10, "maximumNumberOfLines");

  objc_msgSend(v13, "setMaximumNumberOfLines:", v20);
  objc_msgSend(v12, "addTextContainer:", v13);
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBB508]), "initWithAttributedString:", v14);
  objc_msgSend(v21, "addLayoutManager:", v12);
  objc_msgSend(v12, "textStorage");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v22)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FMAttributedStringRenderer.m"), 99, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("layoutManager.textStorage != nil"));

  }
  objc_msgSend(v12, "textContainers");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "count");

  if (v24 != 1)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FMAttributedStringRenderer.m"), 100, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("layoutManager.textContainers.count == 1"));

  }
  return v21;
}

- (CGSize)_sizeFromTextStorage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  v3 = a3;
  dispatch_assert_queue_not_V2(MEMORY[0x24BDAC9B8]);
  objc_msgSend(v3, "layoutManagers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "textContainers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "usedRectForTextContainer:", v7);
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (id)_imageFromTextStorage:(id)a3 width:(double)a4 showExclusionPaths:(BOOL)a5
{
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;

  v8 = a3;
  objc_msgSend(v8, "layoutManagers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[FMAttributedStringRenderer _sizeFromTextStorage:](self, "_sizeFromTextStorage:", v8);
  v12 = v11;

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6A98]), "initWithSize:", a4, v12);
  objc_msgSend(v10, "textContainers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v10, "glyphRangeForTextContainer:", v15);
  v18 = v17;

  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __77__FMAttributedStringRenderer__imageFromTextStorage_width_showExclusionPaths___block_invoke;
  v22[3] = &unk_24C8372C8;
  v23 = v10;
  v24 = v16;
  v25 = v18;
  v26 = a5;
  v19 = v10;
  objc_msgSend(v13, "imageWithActions:", v22);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

void __77__FMAttributedStringRenderer__imageFromTextStorage_width_showExclusionPaths___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BDBEFB0];
  v3 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  objc_msgSend(*(id *)(a1 + 32), "drawBackgroundForGlyphRange:atPoint:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *MEMORY[0x24BDBEFB0], v3);
  objc_msgSend(*(id *)(a1 + 32), "drawGlyphsForGlyphRange:atPoint:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v2, v3);
  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "textContainers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDF6950], "redColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setStroke");

    objc_msgSend(MEMORY[0x24BDF6950], "redColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "colorWithAlphaComponent:", 0.1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFill");

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(v5, "exclusionPaths", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(v14, "fill");
          objc_msgSend(v14, "stroke");
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v11);
    }

  }
}

- (FMAttributedStringRendererOptions)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
}

@end
