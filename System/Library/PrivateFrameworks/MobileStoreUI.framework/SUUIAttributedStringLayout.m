@implementation SUUIAttributedStringLayout

- (SUUIAttributedStringLayout)initWithLayoutRequest:(id)a3
{
  id v4;
  SUUIAttributedStringLayout *v5;
  uint64_t v6;
  NSAttributedString *attributedString;
  NSStringDrawingContext *v8;
  NSStringDrawingContext *context;
  uint64_t v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  float v15;
  double v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  __int128 *v20;
  __int128 v21;
  NSAttributedString *v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  NSAttributedString *v26;
  uint64_t v27;
  uint64_t v28;
  SUUIAttributedStringLayout *v29;
  NSAttributedString *v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  NSShadow *shadow;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  uint64_t v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  uint64_t v49;
  float height;
  _QWORD v52[5];
  _QWORD v53[4];
  SUUIAttributedStringLayout *v54;
  _QWORD v55[5];
  uint64_t v56;
  double *v57;
  uint64_t v58;
  const char *v59;
  __int128 v60;
  __int128 v61;
  objc_super v62;

  v4 = a3;
  v62.receiver = self;
  v62.super_class = (Class)SUUIAttributedStringLayout;
  v5 = -[SUUIAttributedStringLayout init](&v62, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "attributedString");
    v6 = objc_claimAutoreleasedReturnValue();
    attributedString = v5->_attributedString;
    v5->_attributedString = (NSAttributedString *)v6;

    v8 = (NSStringDrawingContext *)objc_alloc_init(MEMORY[0x24BEBB4A8]);
    context = v5->_context;
    v5->_context = v8;

    v10 = objc_msgSend(v4, "numberOfLines");
    -[NSStringDrawingContext setCachesLayout:](v5->_context, "setCachesLayout:", 1);
    -[NSStringDrawingContext setMaximumNumberOfLines:](v5->_context, "setMaximumNumberOfLines:", v10);
    -[NSStringDrawingContext setWantsBaselineOffset:](v5->_context, "setWantsBaselineOffset:", objc_msgSend(v4, "wantsBaselineOffset"));
    -[NSStringDrawingContext setWrapsForTruncationMode:](v5->_context, "setWrapsForTruncationMode:", v10 != 1);
    objc_msgSend(v4, "width");
    v12 = v11;
    -[NSAttributedString boundingRectWithSize:options:context:](v5->_attributedString, "boundingRectWithSize:options:context:", 33, v5->_context);
    v15 = v14;
    v16 = ceilf(v15);
    if (v12 < v16)
      v16 = v12;
    v5->_boundingSize.width = v16;
    v5->_boundingSize.height = v13;
    if (initWithLayoutRequest__sOnce != -1)
      dispatch_once(&initWithLayoutRequest__sOnce, &__block_literal_global_35);
    -[NSAttributedString string](v5->_attributedString, "string");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "rangeOfCharacterFromSet:", initWithLayoutRequest__sTallCharactersSet);

    v19 = MEMORY[0x24BDAC760];
    v20 = (__int128 *)MEMORY[0x24BEBE158];
    if (v18 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v5->_usesTallCharacterSet = 1;
      v56 = 0;
      v57 = (double *)&v56;
      v58 = 0x4010000000;
      v59 = "";
      v21 = v20[1];
      v60 = *v20;
      v61 = v21;
      v22 = v5->_attributedString;
      v23 = -[NSAttributedString length](v22, "length");
      v24 = *MEMORY[0x24BEBB360];
      v55[0] = v19;
      v55[1] = 3221225472;
      v55[2] = __52__SUUIAttributedStringLayout_initWithLayoutRequest___block_invoke_2;
      v55[3] = &unk_2511FA5D0;
      v55[4] = &v56;
      -[NSAttributedString enumerateAttribute:inRange:options:usingBlock:](v22, "enumerateAttribute:inRange:options:usingBlock:", v24, 0, v23, 0, v55);
      v25 = v57[4];
      v5->_boundingSize.height = v5->_boundingSize.height + v57[6] + v25;
      v5->_topInset = v25;
      _Block_object_dispose(&v56, 8);
    }
    v26 = v5->_attributedString;
    v27 = *MEMORY[0x24BEBB3C8];
    v28 = -[NSAttributedString length](v26, "length");
    v53[0] = v19;
    v53[1] = 3221225472;
    v53[2] = __52__SUUIAttributedStringLayout_initWithLayoutRequest___block_invoke_3;
    v53[3] = &unk_2511FA5F8;
    v29 = v5;
    v54 = v29;
    -[NSAttributedString enumerateAttribute:inRange:options:usingBlock:](v26, "enumerateAttribute:inRange:options:usingBlock:", v27, 0, v28, 0, v53);
    v56 = 0;
    v57 = (double *)&v56;
    v58 = 0x2020000000;
    v59 = 0;
    v30 = v5->_attributedString;
    v31 = -[NSAttributedString length](v30, "length");
    v32 = *MEMORY[0x24BEBB3A8];
    v52[0] = v19;
    v52[1] = 3221225472;
    v52[2] = __52__SUUIAttributedStringLayout_initWithLayoutRequest___block_invoke_4;
    v52[3] = &unk_2511FA620;
    v52[4] = &v56;
    -[NSAttributedString enumerateAttribute:inRange:options:usingBlock:](v30, "enumerateAttribute:inRange:options:usingBlock:", v32, 0, v31, 0, v52);
    v33 = v20[1];
    *(_OWORD *)&v29->_edgeInsetsForShadow.top = *v20;
    *(_OWORD *)&v29->_edgeInsetsForShadow.bottom = v33;
    shadow = v29->_shadow;
    if (shadow)
    {
      -[NSShadow shadowOffset](shadow, "shadowOffset");
      v36 = v35;
      -[NSShadow shadowBlurRadius](v29->_shadow, "shadowBlurRadius");
      v38 = -v36;
      if (v36 >= 0.0)
        v38 = v36;
      v39 = v38 + v37;
      if (*((_QWORD *)v57 + 3) == 1)
      {
        v29->_edgeInsetsForShadow.right = v39 * 0.5;
        v29->_edgeInsetsForShadow.left = v39 * 0.5;
      }
      -[NSShadow shadowOffset](v29->_shadow, "shadowOffset");
      v40 = 80;
      if (v41 < 0.0)
        v40 = 64;
      *(double *)((char *)&v29->super.isa + v40) = v39;
      -[NSShadow shadowOffset](v29->_shadow, "shadowOffset");
      v43 = v42;
      -[NSShadow shadowBlurRadius](v29->_shadow, "shadowBlurRadius");
      v45 = v44;
      -[NSShadow shadowOffset](v29->_shadow, "shadowOffset");
      v47 = -v43;
      if (v43 >= 0.0)
        v47 = v43;
      v48 = v47 + v45;
      v49 = 72;
      if (v46 < 0.0)
        v49 = 56;
      *(double *)((char *)&v29->super.isa + v49) = v48;
    }
    height = v5->_boundingSize.height;
    v5->_boundingSize.height = ceilf(height);
    _Block_object_dispose(&v56, 8);

  }
  return v5;
}

void __52__SUUIAttributedStringLayout_initWithLayoutRequest___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)CTFontCopySystemUIFontExcessiveLineHeightCharacterSet();
  v1 = (void *)objc_msgSend(v0, "mutableCopy");

  v2 = (void *)initWithLayoutRequest__sTallCharactersSet;
  initWithLayoutRequest__sTallCharactersSet = (uint64_t)v1;

}

uint64_t __52__SUUIAttributedStringLayout_initWithLayoutRequest___block_invoke_2(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  double v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  double v10;
  __int128 v11;
  __int128 v12;

  v11 = *MEMORY[0x24BEBE158];
  v12 = *(_OWORD *)(MEMORY[0x24BEBE158] + 16);
  result = CTFontGetLanguageAwareOutsets();
  if ((_DWORD)result)
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v4 = *(double *)(v3 + 48);
    if (v4 < *(double *)&v12)
      v4 = *(double *)&v12;
    *(double *)(v3 + 48) = v4;
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v6 = *(double *)(v5 + 40);
    if (v6 < *((double *)&v11 + 1))
      v6 = *((double *)&v11 + 1);
    *(double *)(v5 + 40) = v6;
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = *(double *)(v7 + 56);
    if (v8 < *((double *)&v12 + 1))
      v8 = *((double *)&v12 + 1);
    *(double *)(v7 + 56) = v8;
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v10 = *(double *)(v9 + 32);
    if (v10 < *(double *)&v11)
      v10 = *(double *)&v11;
    *(double *)(v9 + 32) = v10;
  }
  return result;
}

void __52__SUUIAttributedStringLayout_initWithLayoutRequest___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 88), a2);
  *a5 = 1;
}

uint64_t __52__SUUIAttributedStringLayout_initWithLayoutRequest___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t result;

  result = objc_msgSend(a2, "alignment");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  *a5 = 1;
  return result;
}

- (double)baselineOffset
{
  double v3;

  -[NSStringDrawingContext baselineOffset](self->_context, "baselineOffset");
  return v3 + self->_topInset;
}

- (double)firstBaselineOffset
{
  double v3;

  -[NSStringDrawingContext firstBaselineOffset](self->_context, "firstBaselineOffset");
  return v3 + self->_topInset;
}

- (int64_t)numberOfLines
{
  return -[NSStringDrawingContext numberOfLineFragments](self->_context, "numberOfLineFragments");
}

- (NSAttributedString)attributedString
{
  return self->_attributedString;
}

- (CGSize)boundingSize
{
  double width;
  double height;
  CGSize result;

  width = self->_boundingSize.width;
  height = self->_boundingSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (NSStringDrawingContext)stringDrawingContext
{
  return self->_context;
}

- (BOOL)usesTallCharacterSet
{
  return self->_usesTallCharacterSet;
}

- (UIEdgeInsets)edgeInsetsForShadow
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_edgeInsetsForShadow.top;
  left = self->_edgeInsetsForShadow.left;
  bottom = self->_edgeInsetsForShadow.bottom;
  right = self->_edgeInsetsForShadow.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (NSShadow)shadow
{
  return self->_shadow;
}

- (double)topInset
{
  return self->_topInset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadow, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_attributedString, 0);
}

@end
