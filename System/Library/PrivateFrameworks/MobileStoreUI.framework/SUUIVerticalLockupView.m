@implementation SUUIVerticalLockupView

- (SUUIVerticalLockupView)initWithFrame:(CGRect)a3
{
  SUUIVerticalLockupView *v3;
  uint64_t v4;
  NSMapTable *lineSpacings;
  uint64_t v6;
  NSMapTable *topInsets;
  uint64_t v8;
  NSMapTable *viewElementViews;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SUUIVerticalLockupView;
  v3 = -[SUUIViewReuseView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 517, 0, 0);
    lineSpacings = v3->_lineSpacings;
    v3->_lineSpacings = (NSMapTable *)v4;

    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 517, 0, 0);
    topInsets = v3->_topInsets;
    v3->_topInsets = (NSMapTable *)v6;

    v3->_opacityOfViewsOtherThanProductImageView = 1.0;
    v3->_zoomingImageAlpha = 1.0;
    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 517, 0, 0);
    viewElementViews = v3->_viewElementViews;
    v3->_viewElementViews = (NSMapTable *)v8;

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEC8E48], 0);

  v4.receiver = self;
  v4.super_class = (Class)SUUIVerticalLockupView;
  -[SUUIViewReuseView dealloc](&v4, sel_dealloc);
}

+ (double)maximumPerspectiveHeightForSize:(CGSize)a3
{
  double result;

  +[SUUIStackedImageView maximumPerspectiveHeightForSize:](SUUIStackedImageView, "maximumPerspectiveHeightForSize:", a3.width, a3.height);
  return result;
}

- (void)setPerspectiveTargetView:(id)a3
{
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, a3);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __51__SUUIVerticalLockupView_setPerspectiveTargetView___block_invoke;
  v4[3] = &unk_2511FA1C8;
  objc_copyWeak(&v5, &location);
  -[SUUIViewReuseView enumerateExistingViewsForReuseIdentifier:usingBlock:](self, "enumerateExistingViewsForReuseIdentifier:usingBlock:", 0x25120BCC8, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __51__SUUIVerticalLockupView_setPerspectiveTargetView___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "setPerspectiveTargetView:", WeakRetained);

}

- (void)setVanishingPoint:(CGPoint)a3
{
  _QWORD v3[4];
  CGPoint v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __44__SUUIVerticalLockupView_setVanishingPoint___block_invoke;
  v3[3] = &__block_descriptor_48_e23_v32__0__UIView_8Q16_B24l;
  v4 = a3;
  -[SUUIViewReuseView enumerateExistingViewsForReuseIdentifier:usingBlock:](self, "enumerateExistingViewsForReuseIdentifier:usingBlock:", 0x25120BCC8, v3);
}

uint64_t __44__SUUIVerticalLockupView_setVanishingPoint___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setVanishingPoint:", *(double *)(a1 + 32), *(double *)(a1 + 40));
}

- (void)updateForChangedDistanceFromVanishingPoint
{
  -[SUUIViewReuseView enumerateExistingViewsForReuseIdentifier:usingBlock:](self, "enumerateExistingViewsForReuseIdentifier:usingBlock:", 0x25120BCC8, &__block_literal_global_50);
}

uint64_t __68__SUUIVerticalLockupView_updateForChangedDistanceFromVanishingPoint__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateForChangedDistanceFromVanishingPoint");
}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  id v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  int64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v7 = a3;
  v8 = a5;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __73__SUUIVerticalLockupView_prefetchResourcesForViewElement_reason_context___block_invoke;
  v11[3] = &unk_2511F4A28;
  v9 = v8;
  v13 = &v15;
  v14 = a4;
  v12 = v9;
  objc_msgSend(v7, "enumerateChildrenUsingBlock:", v11);
  LOBYTE(a4) = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return a4;
}

uint64_t __73__SUUIVerticalLockupView_prefetchResourcesForViewElement_reason_context___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  char v5;

  result = objc_msgSend(*(id *)(a1 + 32), "prefetchResourcesForViewElement:reason:", a2, *(_QWORD *)(a1 + 48));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v4 + 24))
    v5 = 1;
  else
    v5 = result;
  *(_BYTE *)(v4 + 24) = v5;
  return result;
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  _QWORD v18[4];
  id v19;
  uint64_t *v20;
  double v21;
  uint64_t v22;
  double *v23;
  uint64_t v24;
  uint64_t v25;
  CGSize result;

  v6 = a3;
  v7 = a4;
  v22 = 0;
  v23 = (double *)&v22;
  v24 = 0x2020000000;
  v25 = 0;
  objc_msgSend(v6, "style");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForStyle:", CFSTR("itml-lockup-min-width"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "doubleValue");
    v11 = v10;
  }
  else
  {
    v11 = 80.0;
  }
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __62__SUUIVerticalLockupView_preferredSizeForViewElement_context___block_invoke;
  v18[3] = &unk_2511F4A28;
  v12 = v7;
  v19 = v12;
  v20 = &v22;
  v21 = v11;
  objc_msgSend(v6, "enumerateChildrenUsingBlock:", v18);
  objc_msgSend(a1, "sizeThatFitsWidth:viewElement:context:", v6, v12, v23[3]);
  v15 = v14;
  if (v13 >= v11)
    v11 = v13;

  _Block_object_dispose(&v22, 8);
  v16 = v11;
  v17 = v15;
  result.height = v17;
  result.width = v16;
  return result;
}

void __62__SUUIVerticalLockupView_preferredSizeForViewElement_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  double v5;
  void *v6;
  double v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  v3 = objc_msgSend(v9, "elementType");
  if (v3 <= 137)
  {
    if (v3 != 12)
    {
      if (v3 == 49)
      {
        objc_msgSend(*(id *)(a1 + 32), "sizeForImageElement:", v9);
LABEL_19:
        v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        if (*(double *)(v4 + 24) >= v5)
          v5 = *(double *)(v4 + 24);
        goto LABEL_21;
      }
      if (v3 != 62)
        goto LABEL_22;
    }
LABEL_9:
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(double *)(v4 + 24);
    if (v5 < *(double *)(a1 + 48))
      v5 = *(double *)(a1 + 48);
LABEL_21:
    *(double *)(v4 + 24) = v5;
    goto LABEL_22;
  }
  if (v3 <= 151)
  {
    if (v3 != 138 && v3 != 141)
      goto LABEL_22;
    goto LABEL_9;
  }
  if (v3 != 152)
  {
    if (v3 != 154)
      goto LABEL_22;
    +[SUUIImageGridView preferredSizeForViewElement:context:](SUUIImageGridView, "preferredSizeForViewElement:context:", v9, *(_QWORD *)(a1 + 32));
    goto LABEL_19;
  }
  objc_msgSend(v9, "thumbnailImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sizeForImageElement:", v6);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(double *)(v8 + 24) >= v7)
    v7 = *(double *)(v8 + 24);
  *(double *)(v8 + 24) = v7;

LABEL_22:
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  SUUISizeValue *v13;
  SUUISizeValue *v14;
  SUUISizeValue *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  id v21;
  uint64_t *v22;
  uint64_t *v23;
  double v24;
  id v25;
  uint64_t v26;
  double *v27;
  uint64_t v28;
  const char *v29;
  __int128 v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;

  v8 = a3;
  v9 = a5;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  v26 = 0;
  v27 = (double *)&v26;
  v28 = 0x3010000000;
  v29 = "";
  v30 = *MEMORY[0x24BDBF148];
  objc_msgSend(v9, "labelLayoutCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x24BDAC760];
  v17 = 3221225472;
  v18 = __68__SUUIVerticalLockupView_requestLayoutForViewElement_width_context___block_invoke;
  v19 = &unk_2511FBE18;
  v11 = v10;
  v20 = v11;
  v24 = a4;
  v25 = a1;
  v12 = v9;
  v21 = v12;
  v22 = &v31;
  v23 = &v26;
  objc_msgSend(v8, "enumerateChildrenUsingBlock:", &v16);
  if (*((_BYTE *)v32 + 24))
  {
    objc_msgSend(v12, "aggregateValueForKey:", CFSTR("SUUIVLABS"), v16, v17, v18, v19, v20);
    v13 = (SUUISizeValue *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      -[SUUISizeValue unionWithSize:](v13, "unionWithSize:", v27[4], v27[5]);
    }
    else
    {
      v15 = [SUUISizeValue alloc];
      v14 = -[SUUISizeValue initWithSize:](v15, "initWithSize:", v27[4], v27[5]);
      objc_msgSend(v12, "setAggregateValue:forKey:", v14, CFSTR("SUUIVLABS"));
    }

  }
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v31, 8);

}

void __68__SUUIVerticalLockupView_requestLayoutForViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  __objc2_class *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;

  v3 = a2;
  v4 = objc_msgSend(v3, "elementType");
  if (v4 > 134)
  {
    switch(v4)
    {
      case 135:
        v5 = SUUIStarRatingViewElementView;
        goto LABEL_32;
      case 136:
      case 137:
      case 139:
      case 140:
      case 142:
      case 143:
        goto LABEL_36;
      case 138:
        v21 = 0;
        objc_msgSend(v3, "style");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        SUUIViewElementMarginForStyle(v9, &v21);
        v11 = v10;
        v13 = v12;

        if (v21)
          v14 = *(double *)(a1 + 64) - v11 - v13;
        else
          v14 = *(double *)(a1 + 64);
        objc_msgSend(*(id *)(a1 + 72), "_attributedStringForLabel:context:", v3, *(_QWORD *)(a1 + 40));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "requestLayoutForLabel:attributedString:width:", v3, v8, (uint64_t)v14);
        goto LABEL_25;
      case 141:
        goto LABEL_20;
      case 144:
        v5 = SUUITomatoRatingView;
        goto LABEL_32;
      default:
        if (v4 != 152)
        {
          if (v4 != 154)
            goto LABEL_36;
          goto LABEL_15;
        }
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
          goto LABEL_36;
        v16 = *(void **)(a1 + 40);
        objc_msgSend(v3, "thumbnailImage");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "sizeForImageElement:", v17);
        v18 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        *(_QWORD *)(v18 + 32) = v19;
        *(_QWORD *)(v18 + 40) = v20;

        break;
    }
    goto LABEL_35;
  }
  if (v4 <= 48)
  {
    if (v4 == 8)
    {
      objc_msgSend(*(id *)(a1 + 32), "requestLayoutForBadge:width:", v3, (uint64_t)*(double *)(a1 + 64));
      goto LABEL_36;
    }
    if (v4 == 12)
    {
LABEL_20:
      objc_msgSend(*(id *)(a1 + 72), "_attributedStringForButton:context:", v3, *(_QWORD *)(a1 + 40));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "requestLayoutForButton:attributedString:width:", v3, v8, (uint64_t)*(double *)(a1 + 64));
LABEL_25:

      goto LABEL_36;
    }
    if (v4 != 48)
      goto LABEL_36;
    v5 = SUUISectionHeaderView;
LABEL_32:
    -[__objc2_class requestLayoutForViewElement:width:context:](v5, "requestLayoutForViewElement:width:context:", v3, *(_QWORD *)(a1 + 40), *(double *)(a1 + 64));
    goto LABEL_36;
  }
  if (v4 > 61)
  {
    if (v4 == 62)
    {
      v5 = SUUIHorizontalListView;
    }
    else
    {
      if (v4 != 77)
        goto LABEL_36;
      v5 = SUUIOfferView;
    }
    goto LABEL_32;
  }
  if (v4 == 49)
  {
    +[SUUIAdornedImageView requestLayoutForViewElement:width:context:](SUUIAdornedImageView, "requestLayoutForViewElement:width:context:", v3, *(_QWORD *)(a1 + 40), *(double *)(a1 + 64));
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      objc_msgSend(*(id *)(a1 + 40), "sizeForImageElement:", v3);
      goto LABEL_29;
    }
  }
  else if (v4 == 51)
  {
    +[SUUIImageDeckView requestLayoutForViewElement:width:context:](SUUIImageDeckView, "requestLayoutForViewElement:width:context:", v3, *(_QWORD *)(a1 + 40), *(double *)(a1 + 64));
LABEL_15:
    +[SUUIImageGridView requestLayoutForViewElement:width:context:](SUUIImageGridView, "requestLayoutForViewElement:width:context:", v3, *(_QWORD *)(a1 + 40), *(double *)(a1 + 64));
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      +[SUUIImageGridView sizeThatFitsWidth:viewElement:context:](SUUIImageGridView, "sizeThatFitsWidth:viewElement:context:", v3, *(_QWORD *)(a1 + 40), *(double *)(a1 + 64));
LABEL_29:
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      *(_QWORD *)(v15 + 32) = v6;
      *(_QWORD *)(v15 + 40) = v7;
LABEL_35:
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    }
  }
LABEL_36:

}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD *v24;
  uint64_t *v25;
  uint64_t *v26;
  double v27;
  id v28;
  _QWORD v29[5];
  id v30;
  uint64_t v31;
  double *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  double *v36;
  uint64_t v37;
  const char *v38;
  __int128 v39;
  CGSize result;

  v8 = a4;
  v9 = a5;
  v35 = 0;
  v36 = (double *)&v35;
  v37 = 0x3010000000;
  v38 = "";
  v10 = MEMORY[0x24BDBF148];
  v39 = *MEMORY[0x24BDBF148];
  v31 = 0;
  v32 = (double *)&v31;
  v33 = 0x2020000000;
  v34 = 0;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__75;
  v29[4] = __Block_byref_object_dispose__75;
  v30 = 0;
  objc_msgSend(v9, "aggregateValueForKey:", CFSTR("SUUIVLAUBS"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  if (v12)
  {
    objc_msgSend(v9, "aggregateValueForKey:", CFSTR("SUUIVLABS"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __64__SUUIVerticalLockupView_sizeThatFitsWidth_viewElement_context___block_invoke;
  v21[3] = &unk_2511FBE40;
  v14 = v9;
  v27 = a3;
  v22 = v14;
  v24 = v29;
  v15 = v13;
  v23 = v15;
  v25 = &v31;
  v28 = a1;
  v26 = &v35;
  objc_msgSend(v8, "enumerateChildrenUsingBlock:", v21);
  v17 = v36[4];
  v16 = v36[5];
  if (v16 - v32[3] >= *(double *)(v10 + 8))
    v18 = v16 - v32[3];
  else
    v18 = *(double *)(v10 + 8);
  v36[5] = v18;

  _Block_object_dispose(v29, 8);
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);

  v19 = v17;
  v20 = v18;
  result.height = v20;
  result.width = v19;
  return result;
}

void __64__SUUIVerticalLockupView_sizeThatFitsWidth_viewElement_context___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  double v17;
  id v18;

  v18 = a2;
  objc_msgSend(*(id *)(a1 + 32), "sizeForViewElement:width:", *(double *)(a1 + 72));
  v4 = v3;
  v6 = v5;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) && *(_QWORD *)(a1 + 40))
  {
    v7 = objc_msgSend(v18, "elementType");
    if (v7 != 154)
    {
      if (v7 == 152)
      {
        objc_msgSend(v18, "thumbnailImage");
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v10 = *(void **)(v12 + 40);
        *(_QWORD *)(v12 + 40) = v11;
        goto LABEL_8;
      }
      if (v7 != 49)
        goto LABEL_9;
    }
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = v18;
    v10 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v9;
LABEL_8:

    objc_msgSend(*(id *)(a1 + 40), "size");
    v6 = v13;
  }
LABEL_9:
  objc_msgSend(*(id *)(a1 + 80), "_bottomInsetForViewElement:width:context:", v18, *(_QWORD *)(a1 + 32), *(double *)(a1 + 72));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v14;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = v6
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                          + 24)
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                          + 40);
  objc_msgSend(*(id *)(a1 + 80), "_topInsetForViewElement:width:context:", v18, *(_QWORD *)(a1 + 32), *(double *)(a1 + 72));
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = v15
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                          + 40);
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v17 = *(double *)(v16 + 32);
  if (v17 < v4)
    v17 = v4;
  *(double *)(v16 + 32) = v17;

}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v9;
  id v10;
  SUUISizeValue *productImageBoundingSize;
  UIView *productImageView;
  void *v13;
  int v14;
  SUUISizeValue *v15;
  SUUISizeValue *v16;
  id v17;
  id v18;
  UIView *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[4];
  id v24;
  id v25;
  SUUIVerticalLockupView *v26;
  double v27;

  v9 = a3;
  v10 = a5;
  objc_storeStrong((id *)&self->_lockupElement, a3);
  -[NSMapTable removeAllObjects](self->_lineSpacings, "removeAllObjects");
  -[NSMapTable removeAllObjects](self->_topInsets, "removeAllObjects");
  -[NSMapTable removeAllObjects](self->_viewElementViews, "removeAllObjects");
  productImageBoundingSize = self->_productImageBoundingSize;
  self->_productImageBoundingSize = 0;

  productImageView = self->_productImageView;
  self->_productImageView = 0;

  -[NSHashTable removeAllObjects](self->_artworkRelatedChildViewElementViews, "removeAllObjects");
  -[NSMapTable removeAllObjects](self->_imageViewToImageResourceCacheKey, "removeAllObjects");
  objc_msgSend(v10, "aggregateValueForKey:", CFSTR("SUUIVLAUBS"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "BOOLValue");

  if (v14)
  {
    objc_msgSend(v10, "aggregateValueForKey:", CFSTR("SUUIVLABS"));
    v15 = (SUUISizeValue *)objc_claimAutoreleasedReturnValue();
    v16 = self->_productImageBoundingSize;
    self->_productImageBoundingSize = v15;

  }
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __62__SUUIVerticalLockupView_reloadWithViewElement_width_context___block_invoke;
  v23[3] = &unk_2511F4AC8;
  v17 = v9;
  v24 = v17;
  v27 = a4;
  v18 = v10;
  v25 = v18;
  v26 = self;
  -[SUUIViewReuseView modifyUsingBlock:](self, "modifyUsingBlock:", v23);
  v19 = self->_productImageView;
  if (v19)
  {
    -[UIView transform](v19, "transform");
  }
  else
  {
    v21 = 0u;
    v22 = 0u;
    v20 = 0u;
  }
  *(_OWORD *)&self->_productImageViewOriginalTransform.a = v20;
  *(_OWORD *)&self->_productImageViewOriginalTransform.c = v21;
  *(_OWORD *)&self->_productImageViewOriginalTransform.tx = v22;

}

void __62__SUUIVerticalLockupView_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a2;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __62__SUUIVerticalLockupView_reloadWithViewElement_width_context___block_invoke_2;
  v8[3] = &unk_2511F62E8;
  v9 = v3;
  v12 = *(_QWORD *)(a1 + 56);
  v4 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v10 = v5;
  v11 = v6;
  v7 = v3;
  objc_msgSend(v4, "enumerateChildrenUsingBlock:", v8);

}

void __62__SUUIVerticalLockupView_reloadWithViewElement_width_context___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  id *v23;
  id *v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  int *v41;
  char v42;

  v3 = a2;
  v4 = objc_msgSend(v3, "elementType");
  v5 = 0;
  if (v4 > 61)
  {
    if (v4 <= 134)
    {
      if (v4 == 62)
      {
        objc_msgSend(*(id *)(a1 + 32), "addHorizontalListWithElement:width:context:", v3, *(_QWORD *)(a1 + 40), *(double *)(a1 + 56));
        v8 = (id)objc_claimAutoreleasedReturnValue();
        v5 = 0;
        v7 = v8;
      }
      else
      {
        v7 = 0;
        v8 = 0;
        if (v4 != 77)
          goto LABEL_60;
        objc_msgSend(*(id *)(a1 + 32), "addOfferViewWithViewElement:width:context:", v3, *(_QWORD *)(a1 + 40), *(double *)(a1 + 56));
        v6 = objc_claimAutoreleasedReturnValue();
LABEL_27:
        v8 = (id)v6;
LABEL_28:
        v7 = 0;
        v5 = 0;
      }
    }
    else
    {
      v7 = 0;
      v8 = 0;
      switch(v4)
      {
        case 135:
          objc_msgSend(*(id *)(a1 + 32), "addStarRatingViewWithViewElement:width:context:", v3, *(_QWORD *)(a1 + 40), *(double *)(a1 + 56));
          v6 = objc_claimAutoreleasedReturnValue();
          goto LABEL_27;
        case 136:
        case 137:
        case 139:
        case 140:
        case 142:
        case 143:
          goto LABEL_60;
        case 138:
          v42 = 0;
          objc_msgSend(v3, "style");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          SUUIViewElementMarginForStyle(v15, &v42);
          v17 = v16;
          v19 = v18;

          v20 = *(double *)(a1 + 56);
          if (v42)
            v20 = v20 - v17 - v19;
          objc_msgSend(*(id *)(a1 + 32), "addLabelViewWithElement:width:context:", v3, *(_QWORD *)(a1 + 40), v20);
          v6 = objc_claimAutoreleasedReturnValue();
          goto LABEL_27;
        case 141:
LABEL_17:
          objc_msgSend(*(id *)(a1 + 32), "addButtonWithElement:width:context:", v3, *(_QWORD *)(a1 + 40), *(double *)(a1 + 56));
          v8 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 48), sel__cancelConfirmationAction_, 0x10000);
          objc_msgSend(v8, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 48), sel__buttonAction_, 0x20000);
          objc_msgSend(v8, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 48), sel__showConfirmationAction_, 0x40000);
          LODWORD(v13) = -0.5;
          objc_msgSend(v8, "setCharge:", v13);
          objc_msgSend(v8, "setItemOfferDelegate:", *(_QWORD *)(a1 + 48));
          goto LABEL_28;
        case 144:
          objc_msgSend(*(id *)(a1 + 32), "addTomatoRatingViewWithViewElement:width:context:", v3, *(_QWORD *)(a1 + 40), *(double *)(a1 + 56));
          v6 = objc_claimAutoreleasedReturnValue();
          goto LABEL_27;
        default:
          if (v4 == 152)
          {
            objc_msgSend(*(id *)(a1 + 32), "addImageViewWithVideoElement:context:", v3, *(_QWORD *)(a1 + 40));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v8 = v21;
LABEL_39:
            v24 = (id *)(*(_QWORD *)(a1 + 48) + 512);
            if (!*v24)
              objc_storeStrong(v24, v21);
LABEL_43:
            v7 = 0;
            v5 = v8;
          }
          else
          {
            v7 = 0;
            v8 = 0;
            if (v4 != 154)
              goto LABEL_60;
            objc_msgSend(*(id *)(a1 + 32), "addImageGridViewWithElement:width:context:", v3, *(_QWORD *)(a1 + 40), *(double *)(a1 + 56));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_35:
            v22 = v12;
            v8 = v12;
            v23 = (id *)(*(_QWORD *)(a1 + 48) + 512);
            if (!*v23)
              objc_storeStrong(v23, v22);
            v5 = 0;
            v7 = v8;
          }
          break;
      }
    }
LABEL_44:
    if (v8)
    {
      objc_msgSend((id)objc_opt_class(), "_bottomInsetForViewElement:width:context:", v3, *(_QWORD *)(a1 + 40), *(double *)(a1 + 56));
      if (v25 > 0.00000011920929)
      {
        v26 = *(void **)(*(_QWORD *)(a1 + 48) + 480);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setObject:forKey:", v27, v8);

      }
      objc_msgSend((id)objc_opt_class(), "_topInsetForViewElement:width:context:", v3, *(_QWORD *)(a1 + 40), *(double *)(a1 + 56));
      if (v28 > 0.00000011920929)
      {
        v29 = *(void **)(*(_QWORD *)(a1 + 48) + 576);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setObject:forKey:", v30, v8);

      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 584), "setObject:forKey:", v3, v8);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 584), "setObject:forKey:", v8, v3);
    }
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 40), "imageResourceCacheKeyForViewElement:", v3);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (v31)
      {
        v32 = *(void **)(*(_QWORD *)(a1 + 48) + 472);
        if (!v32)
        {
          v33 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 517, 0, 1);
          v34 = *(_QWORD *)(a1 + 48);
          v35 = *(void **)(v34 + 472);
          *(_QWORD *)(v34 + 472) = v33;

          v32 = *(void **)(*(_QWORD *)(a1 + 48) + 472);
        }
        objc_msgSend(v32, "setObject:forKey:", v31, v5);
      }

    }
    if (v7)
    {
      v36 = *(void **)(*(_QWORD *)(a1 + 48) + 432);
      if (!v36)
      {
        v37 = objc_msgSend(objc_alloc(MEMORY[0x24BDD15C0]), "initWithOptions:capacity:", 517, 1);
        v38 = *(_QWORD *)(a1 + 48);
        v39 = *(void **)(v38 + 432);
        *(_QWORD *)(v38 + 432) = v37;

        v36 = *(void **)(*(_QWORD *)(a1 + 48) + 432);
      }
      objc_msgSend(v36, "addObject:", v7);
    }
  }
  else
  {
    v7 = 0;
    v8 = 0;
    switch(v4)
    {
      case 7:
        objc_msgSend(v3, "firstChildForElementType:", 49);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          objc_msgSend(*(id *)(a1 + 32), "addImageViewWithElement:context:", v9, *(_QWORD *)(a1 + 40));
          v8 = (id)objc_claimAutoreleasedReturnValue();
          v10 = *(void **)(a1 + 48);
          objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setBackgroundColor:", v11);

        }
        else
        {
          v8 = 0;
        }

        goto LABEL_43;
      case 8:
        objc_msgSend(*(id *)(a1 + 32), "addBadgeViewWithElement:width:context:", v3, *(_QWORD *)(a1 + 40), *(double *)(a1 + 56));
        v8 = (id)objc_claimAutoreleasedReturnValue();
        v7 = 0;
        v5 = v8;
        goto LABEL_44;
      case 9:
      case 10:
      case 11:
        break;
      case 12:
LABEL_18:
        objc_msgSend(*(id *)(a1 + 32), "addButtonWithElement:width:context:", v3, *(_QWORD *)(a1 + 40), *(double *)(a1 + 56));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 48), sel__buttonAction_, 64);
        v8 = v14;
        if (objc_msgSend(v3, "elementType") == 50)
          v5 = v8;
        else
          v5 = 0;

        v7 = 0;
        goto LABEL_44;
      case 13:
        goto LABEL_17;
      default:
        switch(v4)
        {
          case '0':
            objc_msgSend(*(id *)(a1 + 32), "addHeaderViewWithElement:width:context:", v3, *(_QWORD *)(a1 + 40), *(double *)(a1 + 56));
            v6 = objc_claimAutoreleasedReturnValue();
            goto LABEL_27;
          case '1':
            objc_msgSend(*(id *)(a1 + 32), "addImageViewWithElement:context:", v3, *(_QWORD *)(a1 + 40));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v8 = v21;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              objc_msgSend(v8, "setUserInteractionEnabled:", 0);
            goto LABEL_39;
          case '2':
            goto LABEL_18;
          case '3':
            objc_msgSend(*(id *)(a1 + 32), "addImageDeckViewWithElement:width:context:", v3, *(_QWORD *)(a1 + 40), *(double *)(a1 + 56));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_35;
          default:
            v7 = 0;
            v8 = 0;
            if (v4 != 32)
              goto LABEL_60;
            objc_msgSend(*(id *)(a1 + 32), "addDividerWithElement:context:", v3, *(_QWORD *)(a1 + 40));
            v6 = objc_claimAutoreleasedReturnValue();
            break;
        }
        goto LABEL_27;
    }
  }
LABEL_60:
  v40 = *(_QWORD *)(a1 + 48);
  if (v8 == *(id *)(v40 + 512))
    v41 = &OBJC_IVAR___SUUIVerticalLockupView__zoomingImageAlpha;
  else
    v41 = &OBJC_IVAR___SUUIVerticalLockupView__opacityOfViewsOtherThanProductImageView;
  objc_msgSend(v8, "setAlpha:", *(double *)(v40 + *v41));

}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (self->_contentInset.left != a3.left
    || self->_contentInset.top != a3.top
    || self->_contentInset.right != a3.right
    || self->_contentInset.bottom != a3.bottom)
  {
    self->_contentInset = a3;
    -[SUUIVerticalLockupView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v26;
  id v27;
  NSMapTable *obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v26 = a3;
  v8 = a4;
  v9 = a5;
  v27 = v8;
  v10 = objc_msgSend(v8, "requestIdentifier");
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = self->_imageViewToImageResourceCacheKey;
  v11 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v34;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v34 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_imageViewToImageResourceCacheKey, "objectForKey:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "requestIdentifierForResourceCacheKey:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v17 && objc_msgSend(v17, "unsignedIntegerValue") == v10)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v15, "imageView");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = v26;
            objc_msgSend(v24, "setImage:", v26);

            v22 = v8;
          }
          else
          {
            objc_opt_class();
            v22 = v8;
            v21 = v26;
            if ((objc_opt_isKindOfClass() & 1) != 0)
              objc_msgSend(v15, "setImage:cacheKey:context:", v26, v16, v9);
            else
              objc_msgSend(v15, "setImage:", v26);
          }

          goto LABEL_26;
        }

      }
      v12 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      if (v12)
        continue;
      break;
    }
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = self->_artworkRelatedChildViewElementViews;
  v19 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v30;
    v21 = v26;
    v22 = v27;
LABEL_12:
    v23 = 0;
    while (1)
    {
      if (*(_QWORD *)v30 != v20)
        objc_enumerationMutation(obj);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v23), "setImage:forArtworkRequest:context:", v26, v27, v9) & 1) != 0)
        break;
      if (v19 == ++v23)
      {
        v19 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        if (v19)
          goto LABEL_12;
        goto LABEL_27;
      }
    }
LABEL_26:
    LOBYTE(v19) = 1;
  }
  else
  {
    v21 = v26;
    v22 = v8;
  }
LABEL_27:

  return v19;
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  return 0;
}

- (id)viewForElementIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__75;
  v19 = __Block_byref_object_dispose__75;
  v20 = 0;
  -[SUUIViewReuseView allExistingViews](self, "allExistingViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIViewElement flattenedChildren](self->_lockupElement, "flattenedChildren");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __51__SUUIVerticalLockupView_viewForElementIdentifier___block_invoke;
  v11[3] = &unk_2511F5A20;
  v7 = v4;
  v12 = v7;
  v8 = v5;
  v13 = v8;
  v14 = &v15;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v11);

  v9 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v9;
}

void __51__SUUIVerticalLockupView_viewForElementIdentifier___block_invoke(uint64_t a1, void *a2, unint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  objc_msgSend(a2, "itmlID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    if (objc_msgSend(*(id *)(a1 + 40), "count") > a3)
    {
      objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", a3);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;

    }
    *a4 = 1;
  }
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double left;
  double right;
  double top;
  uint64_t v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  int *v16;
  uint64_t v17;
  UIView *v18;
  void *v19;
  double v20;
  double v21;
  double height;
  double width;
  char v24;
  double v25;
  double v26;
  void *v27;
  SUUISizeValue *productImageBoundingSize;
  double y;
  double v30;
  double v31;
  unint64_t v32;
  float v33;
  void *v34;
  void *v35;
  float v36;
  uint64_t v37;
  double x;
  float v39;
  SUUISizeValue *v40;
  double v41;
  double productImageAdjustedWidth;
  double v43;
  __int128 v44;
  double v45;
  double MidX;
  void *v47;
  void *v48;
  float v49;
  CGFloat v50;
  CGFloat v51;
  double v52;
  char v53;
  uint64_t v54;
  id obj;
  double v56;
  double v57;
  CGAffineTransform v58;
  CGAffineTransform v59;
  CGAffineTransform v60;
  CGAffineTransform v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  objc_super v66;
  _BYTE v67[128];
  uint64_t v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;

  v68 = *MEMORY[0x24BDAC8D0];
  v66.receiver = self;
  v66.super_class = (Class)SUUIVerticalLockupView;
  -[SUUIVerticalLockupView layoutSubviews](&v66, sel_layoutSubviews);
  -[SUUIVerticalLockupView bounds](self, "bounds");
  v56 = v4;
  v57 = v3;
  v6 = v5;
  v8 = v7;
  left = self->_contentInset.left;
  right = self->_contentInset.right;
  -[SUUIViewReuseView allExistingViews](self, "allExistingViews");
  obj = (id)objc_claimAutoreleasedReturnValue();
  top = self->_contentInset.top;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
  if (v12)
  {
    v13 = v12;
    v53 = 0;
    v14 = v6 - left - right;
    v15 = *(_QWORD *)v63;
    v52 = *MEMORY[0x24BDBF090];
    v16 = &OBJC_IVAR___SUUIGallerySwooshViewController__collectionView;
    v50 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    v51 = *MEMORY[0x24BDBEFB0];
    do
    {
      v17 = 0;
      v54 = v13;
      do
      {
        if (*(_QWORD *)v63 != v15)
          objc_enumerationMutation(obj);
        v18 = *(UIView **)(*((_QWORD *)&v62 + 1) + 8 * v17);
        objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v16[620]), "objectForKey:", v18, *(_QWORD *)&v50, *(_QWORD *)&v51);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v19, "elementType") == 32)
        {
          -[UIView sizeThatFits:](v18, "sizeThatFits:", v6 - self->_contentInset.left, 1.79769313e308);
          height = v21;
          if (v6 - self->_contentInset.left >= v20)
            width = v20;
          else
            width = v6 - self->_contentInset.left;
          v24 = 1;
        }
        else
        {
          -[UIView sizeThatFits:](v18, "sizeThatFits:", v14, 1.79769313e308);
          height = v26;
          if (v14 >= v25)
            width = v25;
          else
            width = v14;
          v24 = v53;
        }
        if (objc_msgSend(v19, "elementType") == 7)
        {
          -[UIView setFrame:](v18, "setFrame:", v57, v56, v6, v8);
          -[SUUIVerticalLockupView sendSubviewToBack:](self, "sendSubviewToBack:", v18);
        }
        else
        {
          objc_msgSend(v19, "style");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          productImageBoundingSize = self->_productImageBoundingSize;
          y = top;
          if (productImageBoundingSize)
          {
            y = top;
            if (v18 == self->_productImageView)
            {
              -[SUUISizeValue size](productImageBoundingSize, "size");
              v31 = v30;
              v32 = objc_msgSend(v27, "elementPosition");
              y = top;
              if (v32 <= 9)
              {
                if (((1 << v32) & 0x309) != 0)
                {
                  y = top + v31 - height;
                }
                else
                {
                  y = top;
                  if (((1 << v32) & 0x32) != 0)
                  {
                    v33 = top + (v31 - height) * 0.5;
                    y = floorf(v33);
                  }
                }
              }
            }
          }
          -[NSMapTable objectForKey:](self->_topInsets, "objectForKey:", v18);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = v34;
          if (v34)
          {
            objc_msgSend(v34, "floatValue");
            y = y + v36;
          }
          if (objc_msgSend(v19, "elementType") == 138)
            v37 = objc_msgSend(v27, "textAlignment");
          else
            v37 = objc_msgSend(v27, "elementAlignment");
          x = v52;
          switch(v37)
          {
            case 0:
              switch(objc_msgSend(v27, "elementPosition"))
              {
                case 1:
                  goto LABEL_33;
                case 5:
                case 7:
                case 9:
                  goto LABEL_32;
                default:
                  goto LABEL_30;
              }
            case 1:
            case 4:
            case 5:
LABEL_30:
              x = self->_contentInset.left;
              break;
            case 2:
LABEL_33:
              v39 = (v14 - width) * 0.5;
              x = self->_contentInset.left + floorf(v39);
              break;
            case 3:
LABEL_32:
              x = v6 - self->_contentInset.right - width;
              break;
            default:
              break;
          }
          memset(&v61, 0, sizeof(v61));
          if (v18)
            -[UIView transform](v18, "transform");
          v40 = self->_productImageBoundingSize;
          if (!v40)
            goto LABEL_41;
          if (v18 != self->_productImageView)
            goto LABEL_41;
          -[SUUISizeValue size](v40, "size");
          y = top + v41 - height;
          productImageAdjustedWidth = self->_productImageAdjustedWidth;
          if (productImageAdjustedWidth <= 0.00000011920929)
            goto LABEL_41;
          v43 = productImageAdjustedWidth / width;
          v44 = *(_OWORD *)&self->_productImageViewOriginalTransform.c;
          *(_OWORD *)&v59.a = *(_OWORD *)&self->_productImageViewOriginalTransform.a;
          *(_OWORD *)&v59.c = v44;
          *(_OWORD *)&v59.tx = *(_OWORD *)&self->_productImageViewOriginalTransform.tx;
          CGAffineTransformScale(&v60, &v59, v43, v43);
          v61 = v60;
          -[UIView setTransform:](v18, "setTransform:", &v60);
          v45 = self->_productImageAdjustedWidth;
          if (vabdd_f64(v45, width) > 0.00000011920929)
          {
            x = x + (v45 - width) * -0.5;
            width = width * v43;
            height = height * v43;
            v60 = v61;
            CGAffineTransformInvert(&v58, &v60);
            v69.origin.y = v50;
            v69.origin.x = v51;
            v69.size.width = width;
            v69.size.height = height;
            v70 = CGRectApplyAffineTransform(v69, &v58);
            -[UIView setBounds:](v18, "setBounds:", v70.origin.x, v70.origin.y, v70.size.width, v70.size.height);
            v71.origin.x = SUUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(x, y, width, height, v57, v56, v6, v8);
            MidX = CGRectGetMidX(v71);
            v72.origin.x = x;
            v72.origin.y = y;
            v72.size.width = width;
            v72.size.height = height;
            -[UIView setCenter:](v18, "setCenter:", MidX, CGRectGetMidY(v72));
            v53 = 1;
          }
          else
          {
LABEL_41:
            if ((v24 & 1) == 0)
            {
              v73.origin.x = x;
              v73.origin.y = y;
              v73.size.width = width;
              v73.size.height = height;
              v74 = CGRectIntegral(v73);
              x = v74.origin.x;
              y = v74.origin.y;
              width = v74.size.width;
              height = v74.size.height;
            }
            -[UIView setFrame:](v18, "setFrame:", SUUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(x, y, width, height, v57, v56, v6, v8));
          }
          v75.origin.x = x;
          v75.origin.y = y;
          v75.size.width = width;
          v75.size.height = height;
          top = CGRectGetMaxY(v75);
          -[NSMapTable objectForKey:](self->_lineSpacings, "objectForKey:", v18);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = v47;
          if (v47)
          {
            objc_msgSend(v47, "floatValue");
            top = top + v49;
          }

          v13 = v54;
          v16 = &OBJC_IVAR___SUUIGallerySwooshViewController__collectionView;
        }

        ++v17;
      }
      while (v13 != v17);
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
    }
    while (v13);
  }

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  UIEdgeInsets *p_contentInset;
  double v5;
  UIView *productImageView;
  double v7;
  void *v8;
  uint64_t v9;
  double *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  _QWORD v16[8];
  uint64_t v17;
  double *v18;
  uint64_t v19;
  const char *v20;
  __int128 v21;
  CGSize result;

  v17 = 0;
  v18 = (double *)&v17;
  v19 = 0x3010000000;
  v20 = "";
  v21 = *MEMORY[0x24BDBF148];
  p_contentInset = &self->_contentInset;
  v5 = a3.width - self->_contentInset.left - self->_contentInset.right;
  if (self->_sizingStyle == 1)
  {
    productImageView = self->_productImageView;
    if (productImageView)
    {
      -[UIView sizeThatFits:](productImageView, "sizeThatFits:");
      v5 = v7;
    }
  }
  -[SUUIViewReuseView allExistingViews](self, "allExistingViews");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __39__SUUIVerticalLockupView_sizeThatFits___block_invoke;
  v16[3] = &unk_2511FBE68;
  *(double *)&v16[6] = v5;
  v16[4] = self;
  v16[5] = &v17;
  v16[7] = v9;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v16);
  v10 = v18;
  v11 = v18[4];
  v12 = p_contentInset->bottom + p_contentInset->top + v18[5];
  v18[5] = v12;
  v13 = v11 + p_contentInset->left + p_contentInset->right;
  v10[4] = v13;

  _Block_object_dispose(&v17, 8);
  v14 = v13;
  v15 = v12;
  result.height = v15;
  result.width = v14;
  return result;
}

void __39__SUUIVerticalLockupView_sizeThatFits___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  uint64_t v10;
  void *v11;
  void *v12;
  float v13;
  void *v14;
  void *v15;
  float v16;
  id v17;

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 504);
  v17 = v5;
  if (v7 && *(id *)(v6 + 512) == v5)
  {
    objc_msgSend(v7, "size");
  }
  else
  {
    objc_msgSend(v5, "sizeThatFits:", *(double *)(a1 + 48), 1.79769313e308);
    if (v8 >= *(double *)(a1 + 48))
      v8 = *(double *)(a1 + 48);
  }
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = v9
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                          + 40);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(double *)(v10 + 32) >= v8)
    v8 = *(double *)(v10 + 32);
  *(double *)(v10 + 32) = v8;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 576), "objectForKey:", v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "floatValue");
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                            + 40)
                                                                + v13;
  }
  if (*(_QWORD *)(a1 + 56) - 1 > a3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 480), "objectForKey:", v17);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      objc_msgSend(v14, "floatValue");
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                              + 40)
                                                                  + v16;
    }

  }
}

- (void)itemOfferButtonWillAnimateTransition:(id)a3
{
  double x;
  double y;
  double MaxX;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  double left;
  double v15;
  float v16;
  id v17;
  CGRect v18;

  v17 = a3;
  objc_msgSend(v17, "frame");
  x = v18.origin.x;
  y = v18.origin.y;
  MaxX = CGRectGetMaxX(v18);
  objc_msgSend(v17, "sizeThatFits:", *(double *)(MEMORY[0x24BDBF028] + 16), *(double *)(MEMORY[0x24BDBF028] + 24));
  v8 = v7;
  v10 = v9;
  -[NSMapTable objectForKey:](self->_viewElementViews, "objectForKey:", v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "style");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = SUUIViewElementAlignmentForStyle(v12);

  if (v13 == 3)
  {
    x = MaxX - v8;
  }
  else if (v13 == 2)
  {
    -[SUUIVerticalLockupView bounds](self, "bounds");
    left = self->_contentInset.left;
    v16 = (v15 - left - self->_contentInset.right - v8) * 0.5;
    x = left + floorf(v16);
  }
  objc_msgSend(v17, "setFrame:", x, y, v8, v10);

}

- (void)setOpacityOfViewsOtherThanProductImageView:(double)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  UIView *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (vabdd_f64(self->_opacityOfViewsOtherThanProductImageView, a3) > 0.00000011920929)
  {
    self->_opacityOfViewsOtherThanProductImageView = a3;
    -[SUUIViewReuseView allExistingViews](self, "allExistingViews");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          v10 = *(UIView **)(*((_QWORD *)&v11 + 1) + 8 * i);
          if (v10 != self->_productImageView)
            -[UIView setAlpha:](v10, "setAlpha:", a3);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }

  }
}

- (void)setZoomingImageAlpha:(double)a3
{
  if (vabdd_f64(self->_zoomingImageAlpha, a3) > 0.00000011920929)
  {
    self->_zoomingImageAlpha = a3;
    -[UIView setAlpha:](self->_productImageView, "setAlpha:");
  }
}

- (void)setZoomingImageWidth:(double)a3
{
  if (vabdd_f64(self->_productImageAdjustedWidth, a3) > 0.00000011920929)
  {
    self->_productImageAdjustedWidth = a3;
    -[SUUIVerticalLockupView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_buttonAction:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[NSMapTable objectForKey:](self->_viewElementViews, "objectForKey:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  SUUICollectionViewCellForView(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SUUICollectionViewForView(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "indexPathForCell:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "collectionView:didConfirmButtonElement:withClickInfo:forItemAtIndexPath:", v5, v8, 0, v7);

  }
  else
  {
    objc_msgSend(v8, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 2, 1, 1, 0, 0);
  }

}

- (void)_cancelConfirmationAction:(id)a3
{
  objc_msgSend(a3, "setShowingConfirmation:animated:", 0, 1);
}

- (void)_showConfirmationAction:(id)a3
{
  objc_msgSend(a3, "setShowingConfirmation:animated:", 1, 1);
}

+ (id)_attributedStringForButton:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "buttonTitleStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(v5, "style");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  SUUIViewElementFontWithStyle(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    SUUIFontForTextStyle(6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "tintColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  SUUIViewElementPlainColorWithStyle(v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "buttonText");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "attributedStringWithDefaultFont:foregroundColor:style:", v11, v13, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)_attributedStringForLabel:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "style");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SUUIViewElementFontWithStyle(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tintColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  SUUIViewElementPlainColorWithStyle(v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = SUUIViewElementAlignmentForStyle(v7);
  if (v11)
    v12 = SUUIViewElementNSTextAlignmentForIKElementAlignment(v11);
  else
    v12 = 0;
  v13 = objc_msgSend(v5, "labelViewStyle");
  if (v13 <= 5)
  {
    if (((1 << v13) & 0x1B) == 0)
    {
      if (v8)
      {
        if (v10)
          goto LABEL_17;
      }
      else
      {
        SUUIFontForTextStyle(6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          goto LABEL_17;
      }
      objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
    if (v8)
    {
      if (!v10)
        goto LABEL_13;
    }
    else
    {
      SUUIFontForTextStyle(5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
LABEL_13:
        objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.6);
        v14 = objc_claimAutoreleasedReturnValue();
LABEL_16:
        v10 = (void *)v14;
      }
    }
  }
LABEL_17:
  objc_msgSend(v5, "text");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "attributedStringWithDefaultFont:foregroundColor:textAlignment:style:", v8, v10, v12, v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (double)_bottomInsetForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  double v17;
  char v19;
  char v20;

  v6 = a3;
  v7 = a5;
  v20 = 0;
  objc_msgSend(v6, "style");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  SUUIViewElementPaddingForStyle(v8, &v20);
  v10 = v9;

  v19 = 0;
  objc_msgSend(v6, "style");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  SUUIViewElementMarginForStyle(v11, &v19);
  v13 = v12;

  v14 = objc_msgSend(v6, "elementType");
  if (v14 == 154 || !v20)
  {
    if (v14 == 154 && v19)
    {
      v10 = v13;
      goto LABEL_25;
    }
    v15 = objc_msgSend(v6, "elementType");
    v10 = 0.0;
    if (v15 <= 48)
    {
      switch(v15)
      {
        case 8:
          if (objc_msgSend(v6, "badgeType") == 1)
            v10 = 2.0;
          else
            v10 = 0.0;
          break;
        case 13:
LABEL_21:
          v10 = 5.0;
          break;
        case 32:
          v10 = 12.0;
          break;
      }
    }
    else
    {
      if (v15 > 151)
      {
        if (v15 != 152 && v15 != 154)
          goto LABEL_25;
      }
      else if (v15 != 49)
      {
        if (v15 != 77)
          goto LABEL_25;
        goto LABEL_21;
      }
      objc_msgSend(v7, "aggregateValueForKey:", CFSTR("SUUIVLABS"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "size");
      if (v17 >= 100.0)
        v10 = 12.0;
      else
        v10 = 7.0;

    }
  }
LABEL_25:

  return v10;
}

+ (double)_topInsetForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v5;
  void *v6;
  double v7;
  uint64_t v9;
  char v10;

  v5 = a3;
  v10 = 0;
  objc_msgSend(v5, "style");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = SUUIViewElementPaddingForStyle(v6, &v10);

  if (v10)
    goto LABEL_2;
  v9 = objc_msgSend(v5, "elementType");
  v7 = 0.0;
  if (v9 <= 31)
  {
    if (v9 == 8)
    {
      if (objc_msgSend(v5, "badgeType") == 1)
        v7 = 3.0;
      else
        v7 = 0.0;
      goto LABEL_2;
    }
    if (v9 != 13)
      goto LABEL_2;
LABEL_9:
    v7 = 5.0;
    goto LABEL_2;
  }
  if (v9 == 32)
  {
    v7 = 12.0;
    goto LABEL_2;
  }
  if (v9 == 77)
    goto LABEL_9;
LABEL_2:

  return v7;
}

- (int64_t)sizingStyle
{
  return self->_sizingStyle;
}

- (void)setSizingStyle:(int64_t)a3
{
  self->_sizingStyle = a3;
}

- (double)opacityOfViewsOtherThanProductImageView
{
  return self->_opacityOfViewsOtherThanProductImageView;
}

- (double)zoomingImageAlpha
{
  return self->_zoomingImageAlpha;
}

- (double)zoomingImageWidth
{
  return self->_zoomingImageWidth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewElementViews, 0);
  objc_storeStrong((id *)&self->_topInsets, 0);
  objc_storeStrong((id *)&self->_productImageView, 0);
  objc_storeStrong((id *)&self->_productImageBoundingSize, 0);
  objc_storeStrong((id *)&self->_lockupElement, 0);
  objc_storeStrong((id *)&self->_lineSpacings, 0);
  objc_storeStrong((id *)&self->_imageViewToImageResourceCacheKey, 0);
  objc_storeStrong((id *)&self->_artworkRelatedChildViewElementViews, 0);
}

@end
