@implementation SUUIImageGridViewReuseView

- (SUUIImageGridViewReuseView)init
{
  SUUIImageGridViewReuseView *v2;
  uint64_t v3;
  NSMapTable *viewElementViews;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUUIImageGridViewReuseView;
  v2 = -[SUUIImageGridViewReuseView init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 0);
    viewElementViews = v2->_viewElementViews;
    v2->_viewElementViews = (NSMapTable *)v3;

  }
  return v2;
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
  v11[2] = __77__SUUIImageGridViewReuseView_prefetchResourcesForViewElement_reason_context___block_invoke;
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

uint64_t __77__SUUIImageGridViewReuseView_prefetchResourcesForViewElement_reason_context___block_invoke(uint64_t a1, uint64_t a2)
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
  id v5;
  id v6;
  uint64_t v7;
  size_t v8;
  unint64_t v9;
  int64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  double v19;
  double v20;
  BOOL v21;
  uint64_t v22;
  double v23;
  double v24;
  uint64_t v25;
  double *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  uint64_t v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[5];
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  _BYTE v55[128];
  uint64_t v56;
  CGSize result;

  v56 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v49 = 0;
  v50 = &v49;
  v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__51;
  v53 = __Block_byref_object_dispose__51;
  v54 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v48[0] = MEMORY[0x24BDAC760];
  v48[1] = 3221225472;
  v48[2] = __66__SUUIImageGridViewReuseView_preferredSizeForViewElement_context___block_invoke;
  v48[3] = &unk_2511F4B90;
  v48[4] = &v49;
  objc_msgSend(v5, "enumerateChildrenUsingBlock:", v48);
  v7 = objc_msgSend(v5, "columnCount");
  if (v7 <= 1)
    v8 = 1;
  else
    v8 = v7;
  v9 = objc_msgSend((id)v50[5], "count");
  if (objc_msgSend((id)v50[5], "count") % v8)
    v10 = v9 / v8 + 1;
  else
    v10 = v9 / v8;
  v11 = malloc_type_calloc(v8, 8uLL, 0x100004000313F17uLL);
  v12 = malloc_type_calloc(v10, 8uLL, 0x100004000313F17uLL);
  v43 = v5;
  bzero(v11, 8 * v8);
  if (v10 >= 1)
    bzero(v12, 8 * v10);
  v42 = v10;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v13 = (id)v50[5];
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
  if (v14)
  {
    v15 = 0;
    v16 = 0;
    v17 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v45 != v17)
          objc_enumerationMutation(v13);
        objc_msgSend(v6, "sizeForImageElement:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i), v42);
        if (*((double *)v11 + v15) < v19)
          *((double *)v11 + v15) = v19;
        if (*((double *)v12 + v16) < v20)
          *((double *)v12 + v16) = v20;
        v21 = v15 + 1 < (uint64_t)v8;
        if (v15 + 1 < (uint64_t)v8)
          ++v15;
        else
          v15 = 0;
        if (!v21)
          ++v16;
      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
    }
    while (v14);
  }

  v22 = 0;
  v23 = *MEMORY[0x24BDBF148];
  v24 = *(double *)(MEMORY[0x24BDBF148] + 8);
  v25 = v42;
  do
    v23 = v23 + *((double *)v11 + v22++);
  while (v8 != v22);
  if (v42 >= 1)
  {
    v26 = (double *)v12;
    do
    {
      v27 = *v26++;
      v24 = v24 + v27;
      --v25;
    }
    while (v25);
  }
  free(v11);
  free(v12);
  objc_msgSend(v43, "contentInset");
  v29 = v28;
  v31 = v30;
  v33 = v32;
  v35 = v34;
  objc_msgSend(v43, "size");
  if (v35 + v23 + v31 >= v36)
    v38 = v35 + v23 + v31;
  else
    v38 = v36;
  if (v33 + v24 + v29 >= v37)
    v39 = v33 + v24 + v29;
  else
    v39 = v37;
  _Block_object_dispose(&v49, 8);

  v40 = v38;
  v41 = v39;
  result.height = v41;
  result.width = v40;
  return result;
}

void __66__SUUIImageGridViewReuseView_preferredSizeForViewElement_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "elementType") == 49)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v3);

}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  double v11;

  v7 = a5;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __72__SUUIImageGridViewReuseView_requestLayoutForViewElement_width_context___block_invoke;
  v9[3] = &unk_2511F9898;
  v11 = a4;
  v10 = v7;
  v8 = v7;
  objc_msgSend(a3, "enumerateChildrenUsingBlock:", v9);

}

void __72__SUUIImageGridViewReuseView_requestLayoutForViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "elementType") == 49)
    +[SUUIAdornedImageView requestLayoutForViewElement:width:context:](SUUIAdornedImageView, "requestLayoutForViewElement:width:context:", v3, *(_QWORD *)(a1 + 32), *(double *)(a1 + 40));

}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  double v5;
  double v6;
  CGSize result;

  +[SUUIImageGridViewReuseView preferredSizeForViewElement:context:](SUUIImageGridViewReuseView, "preferredSizeForViewElement:context:", a4, a5, a3);
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  SUUIImageGridViewReuseView *v17;
  id v18;

  v8 = a3;
  v9 = a5;
  objc_storeStrong((id *)&self->_imageGridViewElement, a3);
  -[NSMapTable removeAllObjects](self->_viewElementViews, "removeAllObjects");
  -[NSMapTable removeAllObjects](self->_imageViewToImageResourceCacheKey, "removeAllObjects");
  v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __66__SUUIImageGridViewReuseView_reloadWithViewElement_width_context___block_invoke;
  v14[3] = &unk_2511FA750;
  v15 = v8;
  v16 = v9;
  v17 = self;
  v18 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[SUUIViewReuseView modifyUsingBlock:](self, "modifyUsingBlock:", v14);
  -[SUUIImageGridViewReuseView setImageViews:](self, "setImageViews:", v11);

}

void __66__SUUIImageGridViewReuseView_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  id v13;

  v3 = a2;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __66__SUUIImageGridViewReuseView_reloadWithViewElement_width_context___block_invoke_2;
  v9[3] = &unk_2511F9F60;
  v10 = v3;
  v4 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(void **)(a1 + 56);
  v11 = v5;
  v12 = v6;
  v13 = v7;
  v8 = v3;
  objc_msgSend(v4, "enumerateChildrenUsingBlock:", v9);

}

void __66__SUUIImageGridViewReuseView_reloadWithViewElement_width_context___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  v3 = objc_msgSend(v11, "elementType");
  v4 = v11;
  if (v3 == 49)
  {
    objc_msgSend(*(id *)(a1 + 32), "addImageViewWithElement:context:", v11, *(_QWORD *)(a1 + 40));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      objc_msgSend(v5, "setUserInteractionEnabled:", 0);
    v4 = v11;
    if (v5)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 440), "setObject:forKey:", v11, v5);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 440), "setObject:forKey:", v5, v11);
      objc_msgSend(*(id *)(a1 + 56), "addObject:", v5);
      objc_msgSend(*(id *)(a1 + 40), "imageResourceCacheKeyForViewElement:", v11);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v7 = *(void **)(*(_QWORD *)(a1 + 48) + 432);
        if (!v7)
        {
          v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 517, 0, 1);
          v9 = *(_QWORD *)(a1 + 48);
          v10 = *(void **)(v9 + 432);
          *(_QWORD *)(v9 + 432) = v8;

          v7 = *(void **)(*(_QWORD *)(a1 + 48) + 432);
        }
        objc_msgSend(v7, "setObject:forKey:", v6, v5);
      }

      v4 = v11;
    }
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
  BOOL v19;
  void *v20;
  id v22;
  NSMapTable *obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = objc_msgSend(a4, "requestIdentifier");
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = self->_imageViewToImageResourceCacheKey;
  v11 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v11)
  {
    v12 = v11;
    v22 = v8;
    v13 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_imageViewToImageResourceCacheKey, "objectForKey:", v15, v22);
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
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v8 = v22;
            objc_msgSend(v20, "setImage:", v22);

          }
          else
          {
            objc_opt_class();
            v8 = v22;
            if ((objc_opt_isKindOfClass() & 1) != 0)
              objc_msgSend(v15, "setImage:cacheKey:context:", v22, v16, v9);
            else
              objc_msgSend(v15, "setImage:", v22);
          }

          v19 = 1;
          goto LABEL_18;
        }

      }
      v12 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v12)
        continue;
      break;
    }
    v19 = 0;
    v8 = v22;
  }
  else
  {
    v19 = 0;
  }
LABEL_18:

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
  v18 = __Block_byref_object_copy__51;
  v19 = __Block_byref_object_dispose__51;
  v20 = 0;
  -[SUUIViewReuseView allExistingViews](self, "allExistingViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIViewElement flattenedChildren](self->_imageGridViewElement, "flattenedChildren");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __55__SUUIImageGridViewReuseView_viewForElementIdentifier___block_invoke;
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

void __55__SUUIImageGridViewReuseView_viewForElementIdentifier___block_invoke(uint64_t a1, void *a2, unint64_t a3, _BYTE *a4)
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

- (NSArray)imageViews
{
  return self->_imageViews;
}

- (void)setImageViews:(id)a3
{
  objc_storeStrong((id *)&self->_imageViews, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageViews, 0);
  objc_storeStrong((id *)&self->_imageGridViewElement, 0);
  objc_storeStrong((id *)&self->_viewElementViews, 0);
  objc_storeStrong((id *)&self->_imageViewToImageResourceCacheKey, 0);
}

@end
