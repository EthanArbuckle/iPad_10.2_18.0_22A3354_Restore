@implementation SUUIProductLockupLayout

- (SUUIProductLockupLayout)initWithLockup:(id)a3 width:(double)a4 context:(id)a5
{
  NSMutableArray *v8;
  NSMutableArray *bottomLeftViewElements;
  void **p_bottomLeftViewElements;
  NSMutableArray *v11;
  NSMutableArray *bottomRightViewElements;
  NSMutableArray *v13;
  NSMutableArray *middleLeftViewElements;
  NSMutableArray *v15;
  NSMutableArray *topLeftViewElements;
  NSMutableArray *v17;
  NSMutableArray *topRightViewElements;
  void *v19;
  id *v20;
  void **v21;
  id v22;
  void *v23;
  id v24;
  SUUIProductLockupLayout *v25;
  id v26;
  SUUIViewElement *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  id *v35;
  id v36;
  void *v37;
  uint64_t v38;
  char v39;
  SUUIViewElement *v40;
  void **v41;
  id v42;
  void *v43;
  SUUIViewElement *v44;
  SUUIViewElement *v45;
  SUUIViewElement *productImageElement;
  SUUIViewElement *v47;
  uint64_t v48;
  id v49;
  id v50;
  id v51;
  id v53;
  id v54;
  SUUIProductLockupLayout *v55;
  id *p_topRightViewElements;
  id *p_middleLeftViewElements;
  id *p_bottomRightViewElements;
  char v59;
  id *p_topLeftViewElements;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _QWORD v65[4];
  SUUIProductLockupLayout *v66;
  id v67;
  uint64_t *v68;
  uint64_t *v69;
  BOOL v70;
  uint64_t v71;
  id *v72;
  uint64_t v73;
  uint64_t (*v74)(uint64_t, uint64_t);
  void (*v75)(uint64_t);
  NSMutableArray *v76;
  uint64_t v77;
  id *v78;
  uint64_t v79;
  uint64_t (*v80)(uint64_t, uint64_t);
  void (*v81)(uint64_t);
  NSMutableArray *v82;
  objc_super v83;
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x24BDAC8D0];
  v54 = a3;
  v53 = a5;
  v83.receiver = self;
  v83.super_class = (Class)SUUIProductLockupLayout;
  v55 = -[SUUIProductLockupLayout init](&v83, sel_init);
  if (v55)
  {
    v59 = objc_msgSend(v54, "containsElementGroups");
    objc_storeStrong((id *)&v55->_layoutContext, a5);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    p_bottomLeftViewElements = (void **)&v55->_bottomLeftViewElements;
    bottomLeftViewElements = v55->_bottomLeftViewElements;
    v55->_bottomLeftViewElements = v8;

    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    bottomRightViewElements = v55->_bottomRightViewElements;
    p_bottomRightViewElements = (id *)&v55->_bottomRightViewElements;
    v55->_bottomRightViewElements = v11;

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    middleLeftViewElements = v55->_middleLeftViewElements;
    p_middleLeftViewElements = (id *)&v55->_middleLeftViewElements;
    v55->_middleLeftViewElements = v13;

    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    topLeftViewElements = v55->_topLeftViewElements;
    p_topLeftViewElements = (id *)&v55->_topLeftViewElements;
    v55->_topLeftViewElements = v15;

    v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    topRightViewElements = v55->_topRightViewElements;
    p_topRightViewElements = (id *)&v55->_topRightViewElements;
    v55->_topRightViewElements = v17;

    v77 = 0;
    v78 = (id *)&v77;
    v79 = 0x3032000000;
    v80 = __Block_byref_object_copy__19;
    v81 = __Block_byref_object_dispose__19;
    v82 = v55->_bottomRightViewElements;
    v71 = 0;
    v72 = (id *)&v71;
    v73 = 0x3032000000;
    v74 = __Block_byref_object_copy__19;
    v75 = __Block_byref_object_dispose__19;
    v76 = v55->_middleLeftViewElements;
    if (a4 < 512.0)
    {
      objc_storeStrong(v78 + 5, v55->_bottomRightViewElements);
      v19 = *p_bottomLeftViewElements;
      v20 = v72;
    }
    else
    {
      v55->_bottomLeftLayoutStyle = 2;
      v19 = v55->_bottomLeftViewElements;
      v20 = v78;
    }
    v21 = v20 + 5;
    v22 = v19;
    v23 = *v21;
    *v21 = v22;

    v24 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v65[0] = MEMORY[0x24BDAC760];
    v65[1] = 3221225472;
    v65[2] = __56__SUUIProductLockupLayout_initWithLockup_width_context___block_invoke;
    v65[3] = &unk_2511F6BB0;
    v25 = v55;
    v70 = a4 < 512.0;
    v66 = v25;
    v68 = &v77;
    v69 = &v71;
    v26 = v24;
    v67 = v26;
    objc_msgSend(v54, "enumerateChildrenUsingBlock:", v65);
    v27 = (SUUIViewElement *)*p_topLeftViewElements;
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v28 = v26;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v61, v84, 16);
    if (v29)
    {
      v30 = *(_QWORD *)v62;
      while (1)
      {
        v31 = 0;
        while (2)
        {
          if (*(_QWORD *)v62 != v30)
            objc_enumerationMutation(v28);
          v32 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v31);
          objc_msgSend(v32, "style");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v33, "elementPosition");

          v35 = (id *)&v55->_bottomLeftViewElements;
          switch(v34)
          {
            case 2:
            case 6:
              v35 = (id *)&v55->_topLeftViewElements;
              goto LABEL_15;
            case 3:
            case 8:
              goto LABEL_15;
            case 4:
              v35 = (id *)&v55->_middleLeftViewElements;
              goto LABEL_15;
            case 7:
              v35 = (id *)&v55->_topRightViewElements;
              goto LABEL_15;
            case 9:
              v35 = (id *)&v55->_bottomRightViewElements;
LABEL_15:
              v36 = *v35;
              if (!v36)
                goto LABEL_17;
              v37 = v36;
              objc_msgSend(v36, "addObject:", v32);
              goto LABEL_52;
            default:
LABEL_17:
              v38 = objc_msgSend(v32, "elementType");
              v37 = 0;
              if (v38 > 108)
              {
                if (v38 <= 134)
                {
                  v41 = (void **)&v55->_bottomRightViewElements;
                  if (v38 != 109)
                  {
                    if (v38 != 127)
                      goto LABEL_52;
                    if (v27 != *p_topLeftViewElements)
                    {
                      if (v27 == *p_middleLeftViewElements)
                      {
                        v42 = *p_bottomLeftViewElements;
                        goto LABEL_58;
                      }
LABEL_51:
                      v37 = 0;
                      goto LABEL_52;
                    }
                    v42 = v72[5];
LABEL_58:
                    v47 = (SUUIViewElement *)v42;
                    productImageElement = v27;
                    v27 = v47;
LABEL_59:

                    goto LABEL_51;
                  }
LABEL_46:
                  v43 = *v41;
LABEL_47:
                  objc_msgSend(v43, "addObject:", v32);
                  goto LABEL_51;
                }
                switch(v38)
                {
                  case 135:
                  case 144:
                    goto LABEL_48;
                  case 136:
                  case 137:
                  case 139:
                  case 140:
                  case 142:
                  case 143:
                    break;
                  case 138:
                    if ((objc_msgSend(v32, "labelViewStyle") & 0xFFFFFFFFFFFFFFFELL) == 4)
                      v39 = 1;
                    else
                      v39 = v59;
                    if ((v39 & 1) == 0)
                    {
                      v40 = (SUUIViewElement *)v72[5];

                      v27 = v40;
                    }
                    goto LABEL_50;
                  case 141:
                    goto LABEL_45;
                  default:
                    if (v38 == 152)
                      goto LABEL_55;
                    break;
                }
              }
              else
              {
                if (v38 > 48)
                {
                  if (v38 > 61)
                  {
                    if (v38 != 62)
                    {
                      if (v38 != 77)
                        goto LABEL_52;
                      goto LABEL_45;
                    }
                  }
                  else
                  {
                    if (v38 == 49)
                    {
LABEL_55:
                      if (v25->_productImageElement)
                        goto LABEL_51;
                      v45 = v32;
                      productImageElement = v25->_productImageElement;
                      v25->_productImageElement = v45;
                      goto LABEL_59;
                    }
                    if (v38 != 50)
                      goto LABEL_52;
                  }
LABEL_48:
                  if ((v59 & 1) == 0)
                  {
                    v44 = (SUUIViewElement *)v72[5];

                    v27 = v44;
                  }
LABEL_50:
                  -[SUUIViewElement addObject:](v27, "addObject:", v32);
                  goto LABEL_51;
                }
                if (v38 > 12)
                {
                  if (v38 != 13)
                  {
                    v43 = v27;
                    if (v38 != 48)
                      goto LABEL_52;
                    goto LABEL_47;
                  }
LABEL_45:
                  v41 = v78 + 5;
                  goto LABEL_46;
                }
                if (v38 == 8 || v38 == 12)
                  goto LABEL_48;
              }
LABEL_52:

              if (v29 != ++v31)
                continue;
              v48 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v61, v84, 16);
              v29 = v48;
              if (!v48)
                goto LABEL_61;
              break;
          }
          break;
        }
      }
    }
LABEL_61:

    if (!objc_msgSend(*p_bottomRightViewElements, "count"))
    {
      v49 = *p_bottomRightViewElements;
      *p_bottomRightViewElements = 0;

    }
    if (!objc_msgSend(*p_middleLeftViewElements, "count"))
    {
      v50 = *p_middleLeftViewElements;
      *p_middleLeftViewElements = 0;

    }
    if (!objc_msgSend(*p_topRightViewElements, "count"))
    {
      v51 = *p_topRightViewElements;
      *p_topRightViewElements = 0;

    }
    _Block_object_dispose(&v71, 8);

    _Block_object_dispose(&v77, 8);
  }

  return v55;
}

void __56__SUUIProductLockupLayout_initWithLockup_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "elementType") == 77 && (objc_msgSend(v3, "isSimpleOffer") & 1) == 0)
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = *(_BYTE *)(a1 + 64) == 0;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 16));
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 40));
  }
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

- (double)bottomPaddingForViewElement:(id)a3
{
  id v3;
  uint64_t v4;
  double v5;

  v3 = a3;
  v4 = objc_msgSend(v3, "elementType");
  v5 = 0.0;
  if (v4 > 76)
  {
    if (v4 != 77 && v4 != 109 && v4 != 141)
      goto LABEL_12;
LABEL_8:
    v5 = 5.0;
    goto LABEL_12;
  }
  if (v4 != 8)
  {
    if (v4 != 13)
      goto LABEL_12;
    goto LABEL_8;
  }
  if (objc_msgSend(v3, "badgeType") == 1)
    v5 = 2.0;
  else
    v5 = 0.0;
LABEL_12:

  return v5;
}

- (void)enumerateViewElementsForWidth:(double)a3 usingBlock:(id)a4
{
  void (**v6)(id, SUUIViewElement *, uint64_t, uint64_t);
  uint64_t v7;
  NSMutableArray *v8;
  uint64_t v9;
  NSMutableArray *v10;
  uint64_t v11;
  SUUIViewElement *productImageElement;
  uint64_t v13;
  NSMutableArray *topRightViewElements;
  NSMutableArray *bottomRightViewElements;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void (**v20)(id, SUUIViewElement *, uint64_t, uint64_t);
  _QWORD v21[4];
  void (**v22)(id, SUUIViewElement *, uint64_t, uint64_t);
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  _QWORD v30[2];
  NSMutableArray *v31;
  NSMutableArray *v32;
  uint64_t v33;
  uint64_t v34;
  NSMutableArray *middleLeftViewElements;
  uint64_t v36;
  uint64_t v37;
  NSMutableArray *bottomLeftViewElements;
  uint64_t v39;
  uint64_t v40;
  NSMutableArray *v41;
  uint64_t v42;
  NSMutableArray *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, SUUIViewElement *, uint64_t, uint64_t))a4;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v7 = 0;
  v8 = 0;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  if (a3 > 0.00000011920929)
  {
    -[SUUIProductLockupLayout layoutWidthsForWidth:](self, "layoutWidthsForWidth:", a3);
    v11 = v30[0];
    v10 = v31;
    v7 = v33;
    v8 = middleLeftViewElements;
    v9 = v37;
  }
  productImageElement = self->_productImageElement;
  if (productImageElement)
  {
    -[SUUIViewElementLayoutContext sizeForViewElement:width:](self->_layoutContext, "sizeForViewElement:width:", self->_productImageElement, a3);
    v6[2](v6, productImageElement, 3, (uint64_t)(v27 + 3));
  }
  v13 = 0;
  topRightViewElements = self->_topRightViewElements;
  v30[0] = self->_topLeftViewElements;
  v30[1] = 4;
  v31 = v8;
  v32 = topRightViewElements;
  v33 = 5;
  v34 = v9;
  middleLeftViewElements = self->_middleLeftViewElements;
  v36 = 2;
  v37 = v7;
  bottomRightViewElements = self->_bottomRightViewElements;
  bottomLeftViewElements = self->_bottomLeftViewElements;
  v39 = 0;
  v40 = v11;
  v41 = bottomRightViewElements;
  v42 = 1;
  v43 = v10;
  v16 = MEMORY[0x24BDAC760];
  do
  {
    if (*((_BYTE *)v27 + 24))
      break;
    v17 = v30[v13 + 2];
    v18 = (void *)v30[v13];
    v19 = v30[v13 + 1];
    v21[0] = v16;
    v21[1] = 3221225472;
    v21[2] = __68__SUUIProductLockupLayout_enumerateViewElementsForWidth_usingBlock___block_invoke;
    v21[3] = &unk_2511F6BD8;
    v20 = v6;
    v23 = &v26;
    v24 = v19;
    v25 = v17;
    v22 = v20;
    objc_msgSend(v18, "enumerateObjectsUsingBlock:", v21);

    v13 += 3;
  }
  while (v13 != 15);
  _Block_object_dispose(&v26, 8);

}

uint64_t __68__SUUIProductLockupLayout_enumerateViewElementsForWidth_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = (*(uint64_t (**)(double))(*(_QWORD *)(a1 + 32) + 16))(*(double *)(a1 + 56));
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return result;
}

- (SUUIProductLockupLayoutSizing)layoutWidthsForWidth:(SEL)a3
{
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  SUUIProductLockupLayoutSizing *result;
  double v17;

  retstr->var3 = 0u;
  retstr->var4 = 0u;
  retstr->var1 = 0u;
  retstr->var2 = 0u;
  retstr->var0 = 0u;
  -[SUUIProductLockupLayout metadataWidthForWidth:](self, "metadataWidthForWidth:", a4);
  v7 = v6;
  retstr->var0.width = v6;
  retstr->var0.height = 0.0;
  -[SUUIProductLockupLayout _sizeForVerticalViewElements:width:](self, "_sizeForVerticalViewElements:width:", self->_bottomRightViewElements);
  v9 = v8;
  retstr->var1.width = v8;
  retstr->var1.height = v10;
  retstr->var2.width = v7;
  retstr->var2.height = 0.0;
  retstr->var3.width = v7;
  retstr->var3.height = 0.0;
  -[SUUIProductLockupLayout _sizeForVerticalViewElements:width:](self, "_sizeForVerticalViewElements:width:", self->_topRightViewElements, v7);
  retstr->var4.width = v11;
  retstr->var4.height = v12;
  if (v9 >= v11)
    v13 = v9;
  else
    v13 = v11;
  v14 = v7;
  if (v11 > 0.00000011920929)
  {
    v14 = v7 - v11 + -5.0;
    retstr->var3.width = v14;
  }
  if (v13 > 0.00000011920929)
    retstr->var2.width = v7 - v13 + -5.0;
  v15 = v7;
  if (v9 > 0.00000011920929)
  {
    v15 = v7 - v9 + -5.0;
    retstr->var0.width = v15;
  }
  result = (SUUIProductLockupLayoutSizing *)-[SUUIProductLockupLayout hasBottomRightElementWithRightAlignment](self, "hasBottomRightElementWithRightAlignment");
  if ((_DWORD)result)
  {
    if (v15 >= v14)
      v17 = v15;
    else
      v17 = v14;
    if (v14 > 0.00000011920929)
      retstr->var4.width = v7 - v14 + -5.0;
    if (v17 > 0.00000011920929)
      retstr->var2.width = v7;
    if (v15 > 0.00000011920929)
      retstr->var1.width = v7 - v15 + -5.0;
  }
  return result;
}

- (BOOL)hasBottomRightElementWithRightAlignment
{
  void *v2;
  BOOL v3;

  -[SUUIProductLockupLayout viewElementsForSection:](self, "viewElementsForSection:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "indexOfObjectPassingTest:", &__block_literal_global_11) != 0x7FFFFFFFFFFFFFFFLL;

  return v3;
}

BOOL __66__SUUIProductLockupLayout_hasBottomRightElementWithRightAlignment__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "style");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "elementAlignment") == 3;

  return v3;
}

- (double)metadataWidthForWidth:(double)a3
{
  double v3;
  double v4;

  v3 = a3;
  if (self->_productImageElement)
  {
    -[SUUIViewElementLayoutContext sizeForViewElement:width:](self->_layoutContext, "sizeForViewElement:width:", a3);
    return v3 - (v4 + 13.0);
  }
  return v3;
}

- (SUUIProductLockupLayoutSizing)sizingToFitWidth:(SEL)a3
{
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  double v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  uint64_t i;
  double v27;
  SUUIProductLockupLayoutSizing *result;
  CGFloat v29;
  CGFloat v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  retstr->var3 = 0u;
  retstr->var4 = 0u;
  retstr->var1 = 0u;
  retstr->var2 = 0u;
  retstr->var0 = 0u;
  -[SUUIProductLockupLayout metadataWidthForWidth:](self, "metadataWidthForWidth:", a4);
  v7 = v6;
  -[SUUIProductLockupLayout _sizeForVerticalViewElements:width:](self, "_sizeForVerticalViewElements:width:", self->_bottomRightViewElements);
  v9 = v8;
  retstr->var1.width = v8;
  retstr->var1.height = v10;
  -[SUUIProductLockupLayout _sizeForVerticalViewElements:width:](self, "_sizeForVerticalViewElements:width:", self->_topRightViewElements, v7);
  v12 = v11;
  retstr->var4.width = v11;
  retstr->var4.height = v13;
  v14 = v7 - v11 + -5.0;
  if (v12 <= 0.00000011920929)
    v14 = v7;
  -[SUUIProductLockupLayout _sizeForVerticalViewElements:width:](self, "_sizeForVerticalViewElements:width:", self->_topLeftViewElements, v14);
  retstr->var3.width = v15;
  retstr->var3.height = v16;
  if (v9 >= v12)
    v17 = v9;
  else
    v17 = v12;
  if (v17 <= 0.00000011920929)
    v18 = v7;
  else
    v18 = v7 - v17 + -5.0;
  -[SUUIProductLockupLayout _sizeForVerticalViewElements:width:](self, "_sizeForVerticalViewElements:width:", self->_middleLeftViewElements, v18);
  retstr->var2.width = v19;
  retstr->var2.height = v20;
  if (v9 > 0.00000011920929)
    v7 = v7 - v9 + -5.0;
  if (self->_bottomLeftLayoutStyle == 2)
  {
    retstr->var0.width = v7;
    retstr->var0.height = 0.0;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v21 = self->_bottomLeftViewElements;
    v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v32;
      v25 = 0.0;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v32 != v24)
            objc_enumerationMutation(v21);
          -[SUUIProductLockupLayout _sizeForViewElement:width:](self, "_sizeForViewElement:width:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i), v7, (_QWORD)v31);
          if (v25 < v27)
            v25 = v27;
          retstr->var0.height = v25;
        }
        v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v23);
    }

  }
  else
  {
    result = (SUUIProductLockupLayoutSizing *)-[SUUIProductLockupLayout _sizeForVerticalViewElements:width:](self, "_sizeForVerticalViewElements:width:", self->_bottomLeftViewElements, v7);
    retstr->var0.width = v29;
    retstr->var0.height = v30;
  }
  return result;
}

- (double)topPaddingForViewElement:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  _QWORD v15[6];
  uint64_t v16;
  double *v17;
  uint64_t v18;
  uint64_t v19;

  v4 = a3;
  v16 = 0;
  v17 = (double *)&v16;
  v18 = 0x2020000000;
  v19 = 0;
  v5 = objc_msgSend(v4, "elementType");
  if (v5 == 8)
  {
    if (objc_msgSend(v4, "badgeType") == 1)
    {
      v17[3] = 3.0;
    }
    else
    {
      objc_msgSend(v4, "style");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      SUUIViewElementFontWithStyle(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        objc_msgSend(v7, "_bodyLeading");
        v9 = v8;
      }
      else
      {
        SUUIFontForTextStyle(2);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "_bodyLeading");
        v9 = v11;

      }
      -[SUUIViewElementLayoutContext sizeForBadgeElement:](self->_layoutContext, "sizeForBadgeElement:", v4);
      v17[3] = v9 - v12;

    }
  }
  else if (v5 == 62)
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __52__SUUIProductLockupLayout_topPaddingForViewElement___block_invoke;
    v15[3] = &unk_2511F6C40;
    v15[4] = self;
    v15[5] = &v16;
    objc_msgSend(v4, "enumerateChildrenUsingBlock:", v15);
  }
  v13 = v17[3];
  _Block_object_dispose(&v16, 8);

  return v13;
}

uint64_t __52__SUUIProductLockupLayout_topPaddingForViewElement___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;
  uint64_t v6;

  result = objc_msgSend(*(id *)(a1 + 32), "topPaddingForViewElement:", a2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v6;
  *a3 = 1;
  return result;
}

- (id)viewElementsForSection:(int64_t)a3
{
  NSMutableArray *bottomLeftViewElements;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  switch(a3)
  {
    case 0:
      bottomLeftViewElements = self->_bottomLeftViewElements;
      goto LABEL_9;
    case 1:
      bottomLeftViewElements = self->_bottomRightViewElements;
      goto LABEL_9;
    case 2:
      bottomLeftViewElements = self->_middleLeftViewElements;
      goto LABEL_9;
    case 3:
      if (!self->_productImageElement)
        return 0;
      v5[0] = self->_productImageElement;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
      self = (SUUIProductLockupLayout *)objc_claimAutoreleasedReturnValue();
      return self;
    case 4:
      bottomLeftViewElements = self->_topLeftViewElements;
      goto LABEL_9;
    case 5:
      bottomLeftViewElements = self->_topRightViewElements;
LABEL_9:
      self = bottomLeftViewElements;
      return self;
    default:
      return self;
  }
}

- (CGSize)_sizeForSegmentedControl:(id)a3 width:(double)a4
{
  id v5;
  SUUISegmentedControlViewElementController *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  v5 = a3;
  v6 = -[SUUISegmentedControlViewElementController initWithViewElement:]([SUUISegmentedControlViewElementController alloc], "initWithViewElement:", v5);

  -[SUUISegmentedControlViewElementController setDesiredSegmentWidth:](v6, "setDesiredSegmentWidth:", 40.0);
  -[SUUISegmentedControlViewElementController segmentedControlView](v6, "segmentedControlView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sizeThatFits:", a4, 1.79769313e308);
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (CGSize)_sizeForVerticalViewElements:(id)a3 width:(double)a4
{
  id v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _QWORD v12[9];
  _QWORD v13[4];
  uint64_t v14;
  double *v15;
  uint64_t v16;
  const char *v17;
  __int128 v18;
  CGSize result;

  v6 = a3;
  v14 = 0;
  v15 = (double *)&v14;
  v16 = 0x3010000000;
  v17 = "";
  v18 = *MEMORY[0x24BDBF148];
  v7 = objc_msgSend(v6, "count");
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v13[3] = 0;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __62__SUUIProductLockupLayout__sizeForVerticalViewElements_width___block_invoke;
  v12[3] = &unk_2511F6C68;
  *(double *)&v12[7] = a4;
  v12[4] = self;
  v12[5] = &v14;
  v12[8] = v7;
  v12[6] = v13;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v12);
  v8 = v15[4];
  v9 = v15[5];
  _Block_object_dispose(v13, 8);
  _Block_object_dispose(&v14, 8);

  v10 = v8;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

void __62__SUUIProductLockupLayout__sizeForVerticalViewElements_width___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  float v16;
  uint64_t v17;
  id v18;

  v18 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_sizeForViewElement:width:", v18, *(double *)(a1 + 56));
  v6 = v5;
  v8 = v7;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "textPropertiesForViewElement:width:", v18, *(double *)(a1 + 56));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = v8
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                          + 40);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(double *)(v10 + 32);
  if (v11 < v6)
    v11 = v6;
  *(double *)(v10 + 32) = v11;
  if (*(_QWORD *)(a1 + 64) - 1 > a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "bottomPaddingForViewElement:", v18);
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = v12
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                            + 40);
  }
  if (a3)
  {
    objc_msgSend(v9, "desiredOffsetTop");
    v14 = v13;
    objc_msgSend(*(id *)(a1 + 32), "topPaddingForViewElement:", v18);
    if (v14 >= v15)
      v15 = v14;
    v16 = v15 - *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                            + 40)
                                                                + fmaxf(roundf(v16), 0.0);
  }
  objc_msgSend(v9, "baselineOffsetFromBottom");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v17;

}

- (CGSize)_sizeForViewElement:(id)a3 width:(double)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  v6 = a3;
  if (objc_msgSend(v6, "elementType") == 109)
    -[SUUIProductLockupLayout _sizeForSegmentedControl:width:](self, "_sizeForSegmentedControl:width:", v6, a4);
  else
    -[SUUIViewElementLayoutContext sizeForViewElement:width:](self->_layoutContext, "sizeForViewElement:width:", v6, a4);
  v9 = v7;
  v10 = v8;

  v11 = v9;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (int64_t)bottomLeftLayoutStyle
{
  return self->_bottomLeftLayoutStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topRightViewElements, 0);
  objc_storeStrong((id *)&self->_topLeftViewElements, 0);
  objc_storeStrong((id *)&self->_productImageElement, 0);
  objc_storeStrong((id *)&self->_middleLeftViewElements, 0);
  objc_storeStrong((id *)&self->_layoutContext, 0);
  objc_storeStrong((id *)&self->_bottomRightViewElements, 0);
  objc_storeStrong((id *)&self->_bottomLeftViewElements, 0);
}

@end
