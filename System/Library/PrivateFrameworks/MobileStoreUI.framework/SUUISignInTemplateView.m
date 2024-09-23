@implementation SUUISignInTemplateView

- (SUUISignInTemplateView)initWithFrame:(CGRect)a3
{
  SUUISignInTemplateView *v3;
  uint64_t v4;
  NSMapTable *viewElements;
  uint64_t v6;
  NSMapTable *viewMargins;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SUUISignInTemplateView;
  v3 = -[SUUIViewReuseView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 0);
    viewElements = v3->_viewElements;
    v3->_viewElements = (NSMapTable *)v4;

    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 0);
    viewMargins = v3->_viewMargins;
    v3->_viewMargins = (NSMapTable *)v6;

  }
  return v3;
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
  v11[2] = __73__SUUISignInTemplateView_prefetchResourcesForViewElement_reason_context___block_invoke;
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

uint64_t __73__SUUISignInTemplateView_prefetchResourcesForViewElement_reason_context___block_invoke(uint64_t a1, uint64_t a2)
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
  double v4;
  double v5;
  CGSize result;

  v4 = *MEMORY[0x24BDBF148];
  v5 = *(double *)(MEMORY[0x24BDBF148] + 8);
  result.height = v5;
  result.width = v4;
  return result;
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  double v16;
  id v17;

  v8 = a5;
  v9 = a3;
  objc_msgSend(v8, "labelLayoutCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __68__SUUISignInTemplateView_requestLayoutForViewElement_width_context___block_invoke;
  v13[3] = &unk_2511F4A50;
  v16 = a4;
  v17 = a1;
  v14 = v8;
  v15 = v10;
  v11 = v10;
  v12 = v8;
  objc_msgSend(v9, "enumerateChildrenUsingBlock:", v13);

}

void __68__SUUISignInTemplateView_requestLayoutForViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  __objc2_class *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a2;
  v3 = objc_msgSend(v16, "elementType");
  if (v3 <= 119)
  {
    if (v3 != 4)
    {
      v4 = v3 == 12;
      goto LABEL_7;
    }
    v10 = SUUIActivityIndicatorView;
  }
  else
  {
    if (v3 != 120)
    {
      if (v3 == 138)
      {
        v9 = v16;
        v11 = (double)objc_msgSend(*(id *)(a1 + 32), "maxWidthForElement:withDefaultWidth:", v9, (uint64_t)*(double *)(a1 + 48));
        if (objc_msgSend(*(id *)(a1 + 56), "_useEditorialLayoutForLabelElement:", v9))
        {
          objc_msgSend(*(id *)(a1 + 32), "editorialLayoutForLabelElement:width:", v9, v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "enqueueLayoutRequests");
        }
        else
        {
          v13 = *(void **)(a1 + 56);
          objc_msgSend(v9, "text");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "style");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "_attributedStringForText:style:context:", v14, v15, *(_QWORD *)(a1 + 32));
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(a1 + 40), "requestLayoutForLabel:attributedString:width:", v9, v12, (uint64_t)v11);
        }

LABEL_17:
        goto LABEL_18;
      }
      v4 = v3 == 141;
LABEL_7:
      v5 = v16;
      if (!v4)
        goto LABEL_19;
      v6 = *(void **)(a1 + 56);
      objc_msgSend(v16, "buttonText");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "style");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_attributedStringForText:style:context:", v7, v8, *(_QWORD *)(a1 + 32));
      v9 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 40), "requestLayoutForButton:attributedString:width:", v16, v9, (uint64_t)*(double *)(a1 + 48));
      goto LABEL_17;
    }
    v10 = SUUISignInTemplateView;
  }
  -[__objc2_class requestLayoutForViewElement:width:context:](v10, "requestLayoutForViewElement:width:context:", v16, *(_QWORD *)(a1 + 32), *(double *)(a1 + 48));
LABEL_18:
  v5 = v16;
LABEL_19:

}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  id v18;
  double v19;
  uint64_t v20;
  double *v21;
  uint64_t v22;
  const char *v23;
  double v24;
  uint64_t v25;
  CGSize result;

  v8 = a4;
  v9 = a5;
  v20 = 0;
  v21 = (double *)&v20;
  v22 = 0x3010000000;
  v23 = "";
  v24 = a3;
  v25 = 0;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __64__SUUISignInTemplateView_sizeThatFitsWidth_viewElement_context___block_invoke;
  v15[3] = &unk_2511FC188;
  v18 = a1;
  v19 = a3;
  v10 = v9;
  v16 = v10;
  v17 = &v20;
  objc_msgSend(a1, "_enumerateChildrenOfViewElement:usingBlock:", v8, v15);
  v11 = v21[4];
  v12 = v21[5];

  _Block_object_dispose(&v20, 8);
  v13 = v11;
  v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

double __64__SUUISignInTemplateView_sizeThatFitsWidth_viewElement_context___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  double v7;
  uint64_t v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  double result;

  v6 = *(void **)(a1 + 48);
  v7 = *(double *)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = a2;
  objc_msgSend(v6, "_sizeForViewElement:width:context:", v9, v8, v7);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = v10
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                          + 40);
  objc_msgSend(*(id *)(a1 + 48), "_marginsForViewElement:index:width:context:", v9, a4, *(_QWORD *)(a1 + 32), *(double *)(a1 + 56));
  v12 = v11;
  v14 = v13;

  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  result = v14 + v12 + *(double *)(v15 + 40);
  *(double *)(v15 + 40) = result;
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  double v15;

  v8 = a3;
  v9 = a5;
  -[NSMapTable removeAllObjects](self->_viewElements, "removeAllObjects");
  -[NSMapTable removeAllObjects](self->_viewMargins, "removeAllObjects");
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __62__SUUISignInTemplateView_reloadWithViewElement_width_context___block_invoke;
  v12[3] = &unk_2511F4AC8;
  v12[4] = self;
  v13 = v8;
  v15 = a4;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[SUUIViewReuseView modifyUsingBlock:](self, "modifyUsingBlock:", v12);

}

void __62__SUUISignInTemplateView_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a2;
  v4 = (void *)objc_opt_class();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __62__SUUISignInTemplateView_reloadWithViewElement_width_context___block_invoke_2;
  v7[3] = &unk_2511FC1B0;
  v11 = *(_QWORD *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 40);
  v8 = *(id *)(a1 + 48);
  v9 = v3;
  v10 = *(_QWORD *)(a1 + 32);
  v6 = v3;
  objc_msgSend(v4, "_enumerateChildrenOfViewElement:usingBlock:", v5, v7);

}

void __62__SUUISignInTemplateView_reloadWithViewElement_width_context___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  SUUISignInView *v7;
  void *v8;
  double v9;
  uint64_t v10;
  SUUIActivityIndicatorView *v11;
  id v12;
  double v13;
  int v14;
  void *v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  id v27;

  v27 = a2;
  v6 = objc_msgSend(v27, "elementType");
  if (v6 <= 49)
  {
    if (v6 <= 31)
    {
      if (v6 != 4)
      {
        if (v6 != 12)
          goto LABEL_28;
        goto LABEL_16;
      }
      v11 = objc_alloc_init(SUUIActivityIndicatorView);
      v7 = (SUUISignInView *)v11;
      v9 = *(double *)(a1 + 56);
      v10 = *(_QWORD *)(a1 + 32);
      goto LABEL_19;
    }
    if (v6 == 32)
    {
      objc_msgSend(*(id *)(a1 + 40), "addDividerWithElement:context:", v27, *(_QWORD *)(a1 + 32));
      v7 = (SUUISignInView *)objc_claimAutoreleasedReturnValue();
      -[SUUISignInView setDividerOrientation:](v7, "setDividerOrientation:", 0);
      if (!v7)
        goto LABEL_28;
    }
    else
    {
      if (v6 != 49)
        goto LABEL_28;
      objc_msgSend(*(id *)(a1 + 40), "addImageViewWithElement:context:", v27, *(_QWORD *)(a1 + 32));
      v7 = (SUUISignInView *)objc_claimAutoreleasedReturnValue();
      if (!v7)
        goto LABEL_28;
    }
LABEL_27:
    objc_msgSend((id)objc_opt_class(), "_marginsForViewElement:index:width:context:", v27, a4, *(_QWORD *)(a1 + 32), *(double *)(a1 + 56));
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 432), "setObject:forKey:", v27, v7);
    v25 = *(void **)(*(_QWORD *)(a1 + 48) + 440);
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithUIEdgeInsets:", v18, v20, v22, v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setObject:forKey:", v26, v7);

    goto LABEL_28;
  }
  if (v6 <= 137)
  {
    if (v6 != 50)
    {
      if (v6 == 120)
      {
        v7 = objc_alloc_init(SUUISignInView);
        objc_msgSend(*(id *)(a1 + 48), "delegate");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUUISignInView setDelegate:](v7, "setDelegate:", v8);

        v9 = *(double *)(a1 + 56);
        v10 = *(_QWORD *)(a1 + 32);
        v11 = (SUUIActivityIndicatorView *)v7;
LABEL_19:
        -[SUUIActivityIndicatorView reloadWithViewElement:width:context:](v11, "reloadWithViewElement:width:context:", v27, v10, v9);
        objc_msgSend(*(id *)(a1 + 40), "addView:", v7);
        if (!v7)
          goto LABEL_28;
        goto LABEL_27;
      }
      goto LABEL_28;
    }
LABEL_16:
    objc_msgSend(*(id *)(a1 + 40), "addButtonWithElement:width:context:", v27, *(_QWORD *)(a1 + 32), *(double *)(a1 + 56));
    v7 = (SUUISignInView *)objc_claimAutoreleasedReturnValue();
    -[SUUISignInView addTarget:action:forControlEvents:](v7, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 48), sel__buttonAction_, 64);
    if (!v7)
      goto LABEL_28;
    goto LABEL_27;
  }
  if (v6 != 138)
  {
    if (v6 != 141)
      goto LABEL_28;
    goto LABEL_16;
  }
  v12 = v27;
  v13 = (double)objc_msgSend(*(id *)(a1 + 32), "maxWidthForElement:withDefaultWidth:", v12, (uint64_t)*(double *)(a1 + 56));
  v14 = objc_msgSend((id)objc_opt_class(), "_useEditorialLayoutForLabelElement:", v12);
  v16 = *(_QWORD *)(a1 + 32);
  v15 = *(void **)(a1 + 40);
  if (v14)
    objc_msgSend(v15, "addTextViewWithElement:width:context:", v12, v16, v13);
  else
    objc_msgSend(v15, "addLabelViewWithElement:width:context:", v12, v16, v13);
  v7 = (SUUISignInView *)objc_claimAutoreleasedReturnValue();

  if (v7)
    goto LABEL_27;
LABEL_28:

}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  id v9;
  SUUISignInTemplateView *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  SUUISignInTemplateView *v21;
  const char *v22;
  void *v23;
  uint64_t v24;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  NSMapTable *obj;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v30 = a3;
  v9 = a4;
  v10 = self;
  v11 = v9;
  v31 = a5;
  v27 = v11;
  v26 = objc_msgSend(v11, "requestIdentifier");
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v12 = 432;
  obj = v10->_viewElements;
  v13 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v13)
  {
    v14 = v13;
    v15 = 0;
    v16 = *(_QWORD *)v33;
    do
    {
      v17 = 0;
      v28 = v14;
      do
      {
        if (*(_QWORD *)v33 != v16)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v17);
        objc_msgSend(*(id *)((char *)&v10->super.super.super.super.isa + v12), "objectForKey:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v15 |= objc_msgSend(v18, "setImage:forArtworkRequest:context:", v30, v27, v31);
        }
        else
        {
          v20 = v12;
          v21 = v10;
          v22 = a2;
          objc_msgSend(v31, "requestIdentifierForViewElement:", v19);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "unsignedIntegerValue");

          if (v24 == v26)
          {
            a2 = v22;
            v10 = v21;
            v12 = v20;
            v14 = v28;
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              objc_msgSend(v18, "setImage:", v30);
              v15 = 1;
            }
          }
          else
          {
            a2 = v22;
            v10 = v21;
            v12 = v20;
            v14 = v28;
          }
        }

        ++v17;
      }
      while (v14 != v17);
      v14 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v14);
  }
  else
  {
    LOBYTE(v15) = 0;
  }

  return v15 & 1;
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  return 0;
}

- (id)viewForElementIdentifier:(id)a3
{
  return 0;
}

- (void)layoutSubviews
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  double v25;
  double v26;
  double v27;
  double v28;
  float v29;
  float v30;
  uint64_t v32;
  double v33;
  double v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  CGFloat v47;
  double v48;
  CGFloat v49;
  double v50;
  CGFloat v51;
  CGFloat v52;
  uint64_t j;
  id v54;
  id v55;
  id v56;
  void *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _QWORD v62[5];
  id v63;
  id v64;
  id v65;
  uint64_t *v66;
  uint64_t *v67;
  uint64_t *v68;
  double v69;
  uint64_t v70;
  uint64_t v71;
  double v72;
  double v73;
  uint64_t v74;
  double *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  double *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  double *v83;
  uint64_t v84;
  uint64_t v85;
  _BYTE v86[128];
  _QWORD v87[3];
  _QWORD v88[5];
  CGRect v89;

  v88[3] = *MEMORY[0x24BDAC8D0];
  -[SUUISignInTemplateView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SUUISignInTemplateView layoutMargins](self, "layoutMargins");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[SUUIViewReuseView allExistingViews](self, "allExistingViews");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = 0;
  v83 = (double *)&v82;
  v84 = 0x2020000000;
  v85 = 0;
  v78 = 0;
  v79 = (double *)&v78;
  v80 = 0x2020000000;
  v81 = 0;
  v74 = 0;
  v75 = (double *)&v74;
  v76 = 0x2020000000;
  v77 = 0;
  v19 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v20 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v21 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v62[0] = MEMORY[0x24BDAC760];
  v62[1] = 3221225472;
  v62[2] = __40__SUUISignInTemplateView_layoutSubviews__block_invoke;
  v62[3] = &unk_2511FC1D8;
  v69 = v8 - v14 - v18;
  v70 = v4;
  v71 = v6;
  v72 = v8;
  v73 = v10;
  v62[4] = self;
  v66 = &v82;
  v22 = v19;
  v63 = v22;
  v67 = &v78;
  v23 = v20;
  v64 = v23;
  v68 = &v74;
  v24 = v21;
  v65 = v24;
  objc_msgSend(v57, "enumerateObjectsUsingBlock:", v62);
  v25 = v10 - v16 - v83[3];
  v26 = v75[3];
  v27 = v12 + v26;
  v28 = v79[3];
  if (v28 <= 0.00000011920929 || v25 - v12 - v26 >= v28)
  {
    v29 = v27 + (v25 - v27 - v28) * 0.5;
    v30 = floorf(v29);
    if (v27 > v25 && v28 < 0.00000011920929)
      v25 = v27;
    v27 = v30;
  }
  else
  {
    v25 = v27 + v28;
  }
  *(double *)v88 = v12;
  *(double *)&v88[1] = v27;
  *(double *)&v88[2] = v25;
  v56 = v24;
  v87[0] = v56;
  v55 = v23;
  v87[1] = v55;
  v32 = 0;
  v54 = v22;
  v87[2] = v54;
  v33 = *MEMORY[0x24BEBE158];
  v34 = *(double *)(MEMORY[0x24BEBE158] + 16);
  do
  {
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v35 = (id)v87[v32];
    v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v58, v86, 16);
    if (v36)
    {
      v37 = *(_QWORD *)v59;
      do
      {
        for (i = 0; i != v36; ++i)
        {
          if (*(_QWORD *)v59 != v37)
            objc_enumerationMutation(v35);
          v39 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
          -[NSMapTable objectForKey:](self->_viewMargins, "objectForKey:", v39, v54, v55, v56);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = v40;
          v42 = v33;
          v43 = v34;
          if (v40)
          {
            objc_msgSend(v40, "UIEdgeInsetsValue");
            v42 = v44;
            v43 = v45;
          }
          objc_msgSend(v39, "frame");
          v47 = v46;
          v49 = v48;
          v51 = v50;
          v52 = v42 + *(double *)&v88[v32];
          objc_msgSend(v39, "setFrame:", v46, v52);
          v89.origin.x = v47;
          v89.origin.y = v52;
          v89.size.width = v49;
          v89.size.height = v51;
          *(double *)&v88[v32] = v43 + CGRectGetMaxY(v89);

        }
        v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v58, v86, 16);
      }
      while (v36);
    }

    ++v32;
  }
  while (v32 != 3);
  for (j = 2; j != -1; --j)

  _Block_object_dispose(&v74, 8);
  _Block_object_dispose(&v78, 8);
  _Block_object_dispose(&v82, 8);

}

void __40__SUUISignInTemplateView_layoutSubviews__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  unint64_t v18;
  id *v19;
  id v20;
  CGRect v21;

  v20 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "objectForKey:", v20);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "frame");
  v5 = v4;
  v7 = v6;
  objc_msgSend(v20, "sizeThatFits:", *(double *)(a1 + 88), 1.79769313e308);
  v21.size.width = v8;
  v10 = v9;
  v21.origin.x = v5;
  v21.origin.y = v7;
  v21.size.height = v10;
  +[SUUIViewElementLayoutContext itemWidthForElement:withDefaultWidth:fitWidth:](SUUIViewElementLayoutContext, "itemWidthForElement:withDefaultWidth:fitWidth:", v3, CGRectGetWidth(v21), *(double *)(a1 + 88));
  v12 = fmin(v11, *(double *)(a1 + 88));
  *(float *)&v11 = (*(double *)(a1 + 112) - v12) * 0.5;
  objc_msgSend(v20, "setFrame:", floorf(*(float *)&v11), v7, v12, v10);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "objectForKey:", v20);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "UIEdgeInsetsValue");
    v10 = v10 + v16 + v15;
  }
  objc_msgSend(v3, "style");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "elementPosition");
  if (v18 > 7)
    goto LABEL_8;
  if (((1 << v18) & 0xC5) == 0)
  {
    if (((1 << v18) & 0x32) != 0)
    {
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v10
                                                                  + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)
                                                                              + 24);
      v19 = (id *)(a1 + 48);
      goto LABEL_9;
    }
LABEL_8:
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v10
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                            + 24);
    v19 = (id *)(a1 + 40);
    goto LABEL_9;
  }
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = v10
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8)
                                                                          + 24);
  v19 = (id *)(a1 + 56);
LABEL_9:
  objc_msgSend(*v19, "addObject:", v20);

}

- (void)_buttonAction:(id)a3
{
  id v3;

  -[NSMapTable objectForKey:](self->_viewElements, "objectForKey:", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 2, 1, 1, 0, 0);

}

+ (id)_attributedStringForText:(id)a3 style:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  SUUIViewElementFontWithStyle(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tintColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  SUUIViewElementPlainColorWithStyle(v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v8, "textAlignment");
  objc_msgSend(v9, "attributedStringWithDefaultFont:foregroundColor:textAlignment:", v10, v12, SUUIViewElementNSTextAlignmentForIKElementAlignment(v13));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (void)_enumerateChildrenOfViewElement:(id)a3 usingBlock:(id)a4
{
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD v13[4];
  _QWORD v14[4];
  _QWORD v15[4];

  v5 = a3;
  v6 = a4;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v15[3] = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v14[3] = 0;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v13[3] = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __69__SUUISignInTemplateView__enumerateChildrenOfViewElement_usingBlock___block_invoke;
  v8[3] = &unk_2511FC200;
  v7 = v6;
  v9 = v7;
  v10 = v15;
  v11 = v14;
  v12 = v13;
  objc_msgSend(v5, "enumerateChildrenUsingBlock:", v8);

  _Block_object_dispose(v13, 8);
  _Block_object_dispose(v14, 8);
  _Block_object_dispose(v15, 8);

}

void __69__SUUISignInTemplateView__enumerateChildrenOfViewElement_usingBlock___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "elementPosition");
  if (v4 > 7)
    goto LABEL_6;
  if (((1 << v4) & 0xC5) == 0)
  {
    if (((1 << v4) & 0x32) != 0)
    {

      (*(void (**)(void))(a1[4] + 16))();
      v5 = a1[6];
      goto LABEL_7;
    }
LABEL_6:

    (*(void (**)(void))(a1[4] + 16))();
    v5 = a1[5];
    goto LABEL_7;
  }

  (*(void (**)(void))(a1[4] + 16))();
  v5 = a1[7];
LABEL_7:
  ++*(_QWORD *)(*(_QWORD *)(v5 + 8) + 24);

}

+ (UIEdgeInsets)_marginsForViewElement:(id)a3 index:(unint64_t)a4 width:(double)a5 context:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  UIEdgeInsets result;

  v9 = a3;
  v10 = a6;
  objc_msgSend(v9, "style");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "valueForStyle:", *MEMORY[0x24BE518E8]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v12, "UIEdgeInsetsValue");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
  }
  else
  {
    v16 = *(double *)(MEMORY[0x24BEBE158] + 8);
    v18 = *(double *)(MEMORY[0x24BEBE158] + 16);
    v20 = *(double *)(MEMORY[0x24BEBE158] + 24);
    if (a4)
    {
      objc_msgSend(v10, "textPropertiesForViewElement:width:", v9, a5);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (v21)
      {
        objc_msgSend(v21, "desiredOffsetTop");
        v14 = v23;
      }
      else
      {
        v14 = 10.0;
      }

    }
    else
    {
      v14 = *MEMORY[0x24BEBE158];
    }
  }

  v24 = v14;
  v25 = v16;
  v26 = v18;
  v27 = v20;
  result.right = v27;
  result.bottom = v26;
  result.left = v25;
  result.top = v24;
  return result;
}

+ (CGSize)_sizeForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  double v10;
  void *v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGSize result;

  v7 = a3;
  v8 = a5;
  v9 = objc_msgSend(v7, "elementType");
  if (v9 == 120)
  {
    +[SUUISignInView sizeThatFitsWidth:viewElement:context:](SUUISignInView, "sizeThatFitsWidth:viewElement:context:", v7, v8, a4);
LABEL_9:
    v15 = v13;
    v16 = v14;
    goto LABEL_10;
  }
  if (v9 != 140)
  {
    if (v9 == 138)
    {
      v10 = (double)objc_msgSend(v8, "maxWidthForElement:withDefaultWidth:", v7, (uint64_t)a4);
      v11 = v8;
      v12 = v7;
    }
    else
    {
      v11 = v8;
      v12 = v7;
      v10 = a4;
    }
    objc_msgSend(v11, "sizeForViewElement:width:", v12, v10);
    goto LABEL_9;
  }
  v15 = *MEMORY[0x24BDBF148];
  v16 = *(double *)(MEMORY[0x24BDBF148] + 8);
LABEL_10:

  v17 = v15;
  v18 = v16;
  result.height = v18;
  result.width = v17;
  return result;
}

+ (BOOL)_useEditorialLayoutForLabelElement:(id)a3
{
  id v3;
  BOOL v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "numberOfLines") == 1)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "moreButtonTitle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "length") != 0;

  }
  return v4;
}

- (SUUISignInViewDelegate)delegate
{
  return (SUUISignInViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_viewMargins, 0);
  objc_storeStrong((id *)&self->_viewElements, 0);
}

@end
