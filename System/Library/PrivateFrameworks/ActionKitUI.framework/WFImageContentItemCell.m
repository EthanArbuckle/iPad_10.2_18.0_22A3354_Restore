@implementation WFImageContentItemCell

- (WFImageContentItemCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  WFImageContentItemCell *v4;
  WFImageContentItemCell *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSMapTable *activityIndicators;
  uint64_t v11;
  NSMutableArray *imageViews;
  uint64_t v13;
  NSMutableArray *selectedImageViews;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)WFImageContentItemCell;
  v4 = -[WFImageContentItemCell initWithStyle:reuseIdentifier:](&v16, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[WFImageContentItemCell setSelectionStyle:](v4, "setSelectionStyle:", 0);
    -[WFImageContentItemCell textLabel](v5, "textLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHidden:", 1);

    -[WFImageContentItemCell detailTextLabel](v5, "detailTextLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidden:", 1);

    -[WFImageContentItemCell imageView](v5, "imageView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHidden:", 1);

    objc_msgSend(MEMORY[0x24BDD1650], "weakToWeakObjectsMapTable");
    v9 = objc_claimAutoreleasedReturnValue();
    activityIndicators = v5->_activityIndicators;
    v5->_activityIndicators = (NSMapTable *)v9;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v11 = objc_claimAutoreleasedReturnValue();
    imageViews = v5->_imageViews;
    v5->_imageViews = (NSMutableArray *)v11;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v13 = objc_claimAutoreleasedReturnValue();
    selectedImageViews = v5->_selectedImageViews;
    v5->_selectedImageViews = (NSMutableArray *)v13;

  }
  return v5;
}

- (void)layoutSubviews
{
  double Width;
  double v4;
  double v5;
  NSMutableArray *imageViews;
  uint64_t v7;
  NSMutableArray *selectedImageViews;
  _QWORD v9[6];
  _QWORD v10[6];
  objc_super v11;
  CGRect v12;

  v11.receiver = self;
  v11.super_class = (Class)WFImageContentItemCell;
  -[WFImageContentItemCell layoutSubviews](&v11, sel_layoutSubviews);
  if (layoutSubviews_onceToken != -1)
    dispatch_once(&layoutSubviews_onceToken, &__block_literal_global_3096);
  -[WFImageContentItemCell bounds](self, "bounds");
  Width = CGRectGetWidth(v12);
  v4 = Width - (double)(unint64_t)-[NSMutableArray count](self->_imageViews, "count") + 1.0;
  v5 = v4 / (double)(unint64_t)-[NSMutableArray count](self->_imageViews, "count");
  imageViews = self->_imageViews;
  v7 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __40__WFImageContentItemCell_layoutSubviews__block_invoke_2;
  v10[3] = &unk_24E343188;
  *(double *)&v10[5] = v5;
  v10[4] = self;
  -[NSMutableArray enumerateObjectsUsingBlock:](imageViews, "enumerateObjectsUsingBlock:", v10);
  selectedImageViews = self->_selectedImageViews;
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __40__WFImageContentItemCell_layoutSubviews__block_invoke_3;
  v9[3] = &unk_24E343188;
  *(double *)&v9[5] = v5;
  v9[4] = self;
  -[NSMutableArray enumerateObjectsUsingBlock:](selectedImageViews, "enumerateObjectsUsingBlock:", v9);
}

- (void)setItems:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *items;
  NSMutableArray *imageViews;
  unint64_t v8;
  void *v9;
  void *v10;
  id v11;
  unint64_t v12;
  void *v13;
  NSMutableArray *v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  unint64_t v21;
  NSMutableArray *selectedImageViews;
  void *v23;
  unint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[6];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (NSArray *)objc_msgSend(v4, "copy");
  items = self->_items;
  self->_items = v5;

  imageViews = self->_imageViews;
  if (imageViews)
  {
    while (1)
    {
      v8 = -[NSMutableArray count](imageViews, "count");
      if (v8 >= objc_msgSend(v4, "count"))
        break;
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", self, sel_imageViewTapped_);
      objc_msgSend(v9, "setDelegate:", self);
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 100);
      objc_msgSend(v10, "stopAnimating");
      v11 = objc_alloc_init(MEMORY[0x24BEBD668]);
      objc_msgSend(v11, "setUserInteractionEnabled:", 1);
      objc_msgSend(v11, "setContentMode:", 2);
      objc_msgSend(v11, "setClipsToBounds:", 1);
      objc_msgSend(v11, "addGestureRecognizer:", v9);
      objc_msgSend(v11, "addSubview:", v10);
      -[WFImageContentItemCell addSubview:](self, "addSubview:", v11);
      -[NSMutableArray addObject:](self->_imageViews, "addObject:", v11);
      -[NSMapTable setObject:forKey:](self->_activityIndicators, "setObject:forKey:", v10, v11);

      imageViews = self->_imageViews;
      if (!imageViews)
        goto LABEL_8;
    }
    while (1)
    {
      v14 = self->_imageViews;
      if (!v14)
        break;
      v12 = -[NSMutableArray count](v14, "count");
      if (v12 <= objc_msgSend(v4, "count"))
        break;
      -[NSMutableArray lastObject](self->_imageViews, "lastObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "removeFromSuperview");
      -[NSMutableArray removeObject:](self->_imageViews, "removeObject:", v13);

    }
  }
LABEL_8:
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v15 = self->_selectedImageViews;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v30;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v30 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v19);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v20, "removeFromSuperview");
        ++v19;
      }
      while (v17 != v19);
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v17);
  }

  -[NSMutableArray removeAllObjects](self->_selectedImageViews, "removeAllObjects");
  v21 = -[NSMutableArray count](self->_selectedImageViews, "count");
  if (v21 < objc_msgSend(v4, "count"))
  {
    do
    {
      selectedImageViews = self->_selectedImageViews;
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](selectedImageViews, "addObject:", v23);

      v24 = -[NSMutableArray count](self->_selectedImageViews, "count");
    }
    while (v24 < objc_msgSend(v4, "count"));
  }
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "scale");
  v27 = v26;

  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __35__WFImageContentItemCell_setItems___block_invoke;
  v28[3] = &unk_24E343250;
  v28[4] = self;
  v28[5] = v27;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v28);
  -[WFImageContentItemCell setNeedsLayout](self, "setNeedsLayout");

}

- (void)setSelected:(BOOL)a3 atIndex:(unint64_t)a4
{
  _BOOL4 v5;
  id v7;
  void *v8;
  void *v9;
  NSMutableArray *selectedImageViews;
  void *v11;
  id v12;

  v5 = a3;
  -[NSMutableArray objectAtIndex:](self->_selectedImageViews, "objectAtIndex:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = 0;
  else
    v8 = v7;
  v12 = v8;

  if (v5)
  {
    if (!v12)
    {
      v7 = objc_alloc_init(MEMORY[0x24BEBD668]);
      -[WFImageContentItemCell addSubview:](self, "addSubview:", v7);
    }
    -[NSMutableArray replaceObjectAtIndex:withObject:](self->_selectedImageViews, "replaceObjectAtIndex:withObject:", a4, v7);
    -[WFImageContentItemCell setNeedsLayout](self, "setNeedsLayout");
    v9 = v7;
  }
  else
  {
    objc_msgSend(v12, "removeFromSuperview");
    selectedImageViews = self->_selectedImageViews;
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray replaceObjectAtIndex:withObject:](selectedImageViews, "replaceObjectAtIndex:withObject:", a4, v11);

    v9 = v12;
  }

}

- (void)imageViewTapped:(id)a3
{
  NSMutableArray *imageViews;
  void *v5;
  uint64_t v6;
  void *v7;
  char v8;
  id v9;

  imageViews = self->_imageViews;
  objc_msgSend(a3, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NSMutableArray indexOfObject:](imageViews, "indexOfObject:", v5);

  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[WFImageContentItemCell delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[WFImageContentItemCell delegate](self, "delegate");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "cell:didSelectImageViewAtIndex:", self, v6);

    }
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v4;
  char isKindOfClass;

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v5;
  id v6;
  char isKindOfClass;
  BOOL v8;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  v8 = 0;
  if ((isKindOfClass & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = 1;
  }

  return v8;
}

- (NSArray)items
{
  return self->_items;
}

- (WFImageContentItemCellDelegate)delegate
{
  return (WFImageContentItemCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_selectedImageViews, 0);
  objc_storeStrong((id *)&self->_imageViews, 0);
  objc_storeStrong((id *)&self->_activityIndicators, 0);
}

void __35__WFImageContentItemCell_setItems___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  id *v8;
  id v9;
  id *v10;
  id *v11;
  id v12;
  id v13;
  void *v14;
  double v15;
  float64x2_t v16;
  _QWORD v17[5];
  id v18;
  id v19;
  _QWORD v20[2];
  _QWORD v21[5];
  id v22;
  id v23;
  _QWORD v24[2];
  CGAffineTransform v25;
  _QWORD v26[5];
  id v27;
  id v28;
  _QWORD v29[2];
  CGRect v30;

  v5 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1024), "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImage:", 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(v7, "startAnimating");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v26[0] = MEMORY[0x24BDAC760];
      v26[1] = 3221225472;
      v26[2] = __35__WFImageContentItemCell_setItems___block_invoke_2;
      v26[3] = &unk_24E3431D8;
      v26[4] = *(_QWORD *)(a1 + 32);
      v29[1] = a3;
      v8 = &v27;
      v9 = v5;
      v27 = v9;
      v10 = &v28;
      v28 = v6;
      v11 = (id *)v29;
      v29[0] = v7;
      objc_msgSend(v9, "getObjectRepresentation:forClass:", v26, objc_opt_class());
LABEL_8:

      goto LABEL_9;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "bounds");
      v15 = floor((CGRectGetWidth(v30)- (double)(unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "count")+ 1.0)/ (double)(unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "count"));
      CGAffineTransformMakeScale(&v25, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 40));
      v16 = vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v25.c, v15), *(float64x2_t *)&v25.a, v15);
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __35__WFImageContentItemCell_setItems___block_invoke_4;
      v21[3] = &unk_24E343200;
      v21[4] = *(_QWORD *)(a1 + 32);
      v24[1] = a3;
      v8 = &v22;
      v12 = v5;
      v22 = v12;
      v10 = &v23;
      v23 = v6;
      v11 = (id *)v24;
      v24[0] = v7;
      objc_msgSend(v12, "getThumbnail:ofSize:", v21, *(_OWORD *)&v16);
      goto LABEL_8;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __35__WFImageContentItemCell_setItems___block_invoke_6;
      v17[3] = &unk_24E343228;
      v17[4] = *(_QWORD *)(a1 + 32);
      v20[1] = a3;
      v8 = &v18;
      v13 = v5;
      v18 = v13;
      v10 = &v19;
      v19 = v6;
      v11 = (id *)v20;
      v20[0] = v7;
      objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF83D8]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "getFileRepresentation:forType:", v17, v14);

      goto LABEL_8;
    }
  }
LABEL_9:

}

void __35__WFImageContentItemCell_setItems___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;

  v3 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[2] = __35__WFImageContentItemCell_setItems___block_invoke_3;
  v7[3] = &unk_24E3431B0;
  v4 = *(_QWORD *)(a1 + 64);
  v5 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v12 = v4;
  v7[1] = 3221225472;
  v8 = v5;
  v9 = *(id *)(a1 + 48);
  v10 = v3;
  v11 = *(id *)(a1 + 56);
  v6 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

void __35__WFImageContentItemCell_setItems___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;

  v3 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[2] = __35__WFImageContentItemCell_setItems___block_invoke_5;
  v7[3] = &unk_24E3431B0;
  v4 = *(_QWORD *)(a1 + 64);
  v5 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v12 = v4;
  v7[1] = 3221225472;
  v8 = v5;
  v9 = *(id *)(a1 + 48);
  v10 = v3;
  v11 = *(id *)(a1 + 56);
  v6 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

void __35__WFImageContentItemCell_setItems___block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;

  v3 = (void *)MEMORY[0x24BEC14E0];
  objc_msgSend(a2, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageWithData:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __35__WFImageContentItemCell_setItems___block_invoke_7;
  v9[3] = &unk_24E3431B0;
  v6 = *(_QWORD *)(a1 + 64);
  v7 = *(void **)(a1 + 40);
  v9[4] = *(_QWORD *)(a1 + 32);
  v14 = v6;
  v10 = v7;
  v11 = *(id *)(a1 + 48);
  v12 = v5;
  v13 = *(id *)(a1 + 56);
  v8 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v9);

}

uint64_t __35__WFImageContentItemCell_setItems___block_invoke_7(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "items");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndex:", *(_QWORD *)(a1 + 72));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 40));

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 56), "UIImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "setImage:", v5);

  }
  return objc_msgSend(*(id *)(a1 + 64), "stopAnimating");
}

uint64_t __35__WFImageContentItemCell_setItems___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "items");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndex:", *(_QWORD *)(a1 + 72));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 40));

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 56), "UIImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "setImage:", v5);

  }
  return objc_msgSend(*(id *)(a1 + 64), "stopAnimating");
}

uint64_t __35__WFImageContentItemCell_setItems___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;

  objc_msgSend(*(id *)(a1 + 32), "items");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndex:", *(_QWORD *)(a1 + 72));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 40));

  if (v4)
    objc_msgSend(*(id *)(a1 + 48), "setImage:", *(_QWORD *)(a1 + 56));
  return objc_msgSend(*(id *)(a1 + 64), "stopAnimating");
}

void __40__WFImageContentItemCell_layoutSubviews__block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  double v4;
  double v5;
  void *v6;
  id v7;
  double MidX;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  id v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  v4 = *(double *)(a1 + 40);
  v5 = (v4 + 1.0) * (double)a3;
  v6 = *(void **)(a1 + 32);
  v7 = a2;
  objc_msgSend(v6, "bounds");
  objc_msgSend(v7, "setFrame:", v5, 0.0, v4, CGRectGetHeight(v18) + -1.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1024), "objectForKey:", v7);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sizeToFit");
  objc_msgSend(v7, "bounds");
  MidX = CGRectGetMidX(v19);
  objc_msgSend(v7, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v20.origin.x = v10;
  v20.origin.y = v12;
  v20.size.width = v14;
  v20.size.height = v16;
  objc_msgSend(v17, "setCenter:", MidX, CGRectGetMidY(v20));

}

void __40__WFImageContentItemCell_layoutSubviews__block_invoke_3(uint64_t a1, void *a2, unint64_t a3)
{
  double v5;
  id v6;
  CGRect v7;

  v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v5 = *(double *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "bounds");
    objc_msgSend(v6, "setFrame:", (v5 + 1.0) * (double)a3, 0.0, v5, CGRectGetHeight(v7) + -1.0);
    objc_msgSend(v6, "setImage:", layoutSubviews_selectedImage);
  }

}

void __40__WFImageContentItemCell_layoutSubviews__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  CGSize v10;
  CGRect v11;
  CGRect v12;

  v10.width = 38.0;
  v10.height = 38.0;
  UIGraphicsBeginImageContextWithOptions(v10, 0, 0.0);
  objc_msgSend(MEMORY[0x24BEBD420], "bezierPathWithRect:", 0.0, 0.0, 38.0, 38.0);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v0 = (void *)MEMORY[0x24BEBD420];
  v11.origin.x = 0.0;
  v11.origin.y = 0.0;
  v11.size.width = 38.0;
  v11.size.height = 38.0;
  v12 = CGRectInset(v11, 7.0, 7.0);
  objc_msgSend(v0, "bezierPathWithOvalInRect:", v12.origin.x, v12.origin.y, v12.size.width, v12.size.height);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD420], "bezierPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "moveToPoint:", 13.0, 19.0);
  objc_msgSend(v2, "addLineToPoint:", 17.0, 23.0);
  objc_msgSend(v2, "addLineToPoint:", 25.0, 16.0);
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 1.0, 0.300000012);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFill");

  objc_msgSend(v9, "fill");
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.071, 0.337, 0.843, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFill");

  objc_msgSend(v1, "fill");
  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStroke");

  objc_msgSend(v1, "stroke");
  objc_msgSend(v2, "stroke");
  UIGraphicsGetImageFromCurrentImageContext();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resizableImageWithCapInsets:", 0.0, 0.0, 34.0, 34.0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)layoutSubviews_selectedImage;
  layoutSubviews_selectedImage = v7;

  UIGraphicsEndImageContext();
}

@end
