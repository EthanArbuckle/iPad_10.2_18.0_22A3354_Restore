@implementation IMChatTranscriptLayoutEngine

- (IMChatTranscriptLayoutEngine)init
{
  IMChatTranscriptLayoutEngine *v2;
  const char *v3;
  uint64_t v4;
  IMChatTranscriptLayoutEngine *v5;
  IMChatTranscriptLayoutEngine *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)IMChatTranscriptLayoutEngine;
  v2 = -[IMChatTranscriptLayoutEngine init](&v8, sel_init);
  v5 = v2;
  if (v2)
  {
    objc_msgSend__invalidateCachedItemData(v2, v3, v4);
    v6 = v5;
  }

  return v5;
}

- (void)setLayoutSpecification:(id)a3
{
  char *v4;
  IMChatTranscriptLayoutSpecification *layoutSpecification;
  char isEqual;
  uint64_t v7;
  IMChatTranscriptLayoutSpecification *v8;
  IMChatTranscriptLayoutSpecification *v9;
  const char *v10;
  uint64_t v11;
  char *v12;

  v4 = (char *)a3;
  layoutSpecification = self->_layoutSpecification;
  if (layoutSpecification != (IMChatTranscriptLayoutSpecification *)v4)
  {
    v12 = v4;
    isEqual = objc_msgSend_isEqual_(layoutSpecification, v4, (uint64_t)v4);
    v4 = v12;
    if ((isEqual & 1) == 0)
    {
      v8 = (IMChatTranscriptLayoutSpecification *)objc_msgSend_copy(v12, v12, v7);
      v9 = self->_layoutSpecification;
      self->_layoutSpecification = v8;

      objc_msgSend_invalidateLayout(self, v10, v11);
      v4 = v12;
    }
  }

}

- (void)setDataSource:(id)a3
{
  id WeakRetained;
  void *v5;
  const char *v6;
  uint64_t v7;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_dataSource, obj);
    objc_msgSend_reloadData(self, v6, v7);
    v5 = obj;
  }

}

- (void)reloadData
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;

  objc_msgSend__invalidateCachedItemData(self, a2, v2);
  objc_msgSend_invalidateLayout(self, v4, v5);
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  unint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;

  v4 = a3;
  objc_msgSend_layoutAttributes(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_item(v4, v8, v9);

  if (v10 >= objc_msgSend_count(v7, v11, v12))
  {
    objc_msgSend_count(v7, v13, v14);
    _IMWarn();
    v15 = 0;
  }
  else
  {
    objc_msgSend_objectAtIndexedSubscript_(v7, v13, v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (CGSize)contentSize
{
  uint64_t v2;
  id v4;
  double width;
  double height;
  CGSize result;

  if (!self->_layoutAttributes)
    v4 = (id)objc_msgSend_layoutAttributes(self, a2, v2);
  width = self->_contentSize.width;
  height = self->_contentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)_buildLayoutAttributesIfNeeded
{
  IMChatTranscriptLayoutEngineDataSource **p_dataSource;
  id WeakRetained;
  IMChatTranscriptLayoutSpecification *layoutSpecification;
  const char *v6;
  uint64_t v7;
  double v8;
  double v9;
  const char *v10;
  uint64_t v11;
  double v12;
  double v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  const char *v18;
  const char *v19;
  NSArray *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  const char *v25;
  void *v26;
  const char *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  double v31;
  double v32;
  double v33;
  double v34;
  IMChatTranscriptItemExtendedLayoutAttributes *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  const char *v49;
  uint64_t v50;
  NSArray *layoutAttributes;
  const char *v52;
  uint64_t v53;
  uint64_t v54;

  if (!self->_layoutAttributes)
  {
    p_dataSource = &self->_dataSource;
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    if (WeakRetained)
    {
      layoutSpecification = self->_layoutSpecification;

      if (layoutSpecification)
      {
        objc_msgSend_layoutBoundsSize(self->_layoutSpecification, v6, v7);
        v9 = v8;
        objc_msgSend_maximumBubbleWidth(self->_layoutSpecification, v10, v11);
        v13 = v12;
        v16 = objc_msgSend__numberOfTranscriptItems(self, v14, v15);
        v17 = objc_alloc(MEMORY[0x24BDBCEB8]);
        v20 = (NSArray *)objc_msgSend_initWithCapacity_(v17, v18, v16);
        if (v16)
        {
          v21 = 0;
          v22 = 0;
          do
          {
            objc_msgSend_indexPathForItem_inSection_(MEMORY[0x24BDD15D8], v19, v21, 0);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_loadWeakRetained((id *)p_dataSource);
            objc_msgSend_layoutEngine_transcriptItemAtIndex_(v24, v25, (uint64_t)self, v21);
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend__cachedDrawableForTranscriptItem_atIndex_(self, v27, (uint64_t)v26, v21);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_sizeConstrainedToWidth_(v28, v29, v30, v13);
            v32 = v31;
            v34 = fmin(v33, v9);
            v35 = objc_alloc_init(IMChatTranscriptItemExtendedLayoutAttributes);
            v38 = objc_msgSend_layoutOrientation(v28, v36, v37);
            objc_msgSend_setLayoutOrientation_(v35, v39, v38);
            objc_msgSend_setIndexPath_(v35, v40, (uint64_t)v23);
            objc_msgSend_setDrawableSize_(v35, v41, v42, v34, v32);
            if (v22)
            {
              v45 = objc_msgSend_layoutClassification(v22, v43, v44);
              v47 = objc_msgSend_verticalSpaceToPrecedingItemOfClassification_(v28, v46, v45);
              objc_msgSend__spaceForVerticalSpaceDescriptor_(self, v48, v47);
              objc_msgSend_setTopMargin_(v35, v49, v50);
            }
            objc_msgSend_addObject_(v20, v43, (uint64_t)v35);

            ++v21;
            v22 = v28;
          }
          while (v16 != v21);

        }
        layoutAttributes = self->_layoutAttributes;
        self->_layoutAttributes = v20;

        objc_msgSend__updateFrames(self, v52, v53);
        MEMORY[0x24BEDD108](self, sel__updateContentSize, v54);
      }
    }
  }
}

- (NSArray)layoutAttributes
{
  uint64_t v2;
  NSArray *layoutAttributes;
  NSArray *v5;

  objc_msgSend__buildLayoutAttributesIfNeeded(self, a2, v2);
  layoutAttributes = self->_layoutAttributes;
  if (layoutAttributes)
    v5 = layoutAttributes;
  else
    v5 = (NSArray *)MEMORY[0x24BDBD1A8];
  return v5;
}

- (void)_updateFrames
{
  uint64_t v2;
  double v4;
  double v5;
  const char *v6;
  uint64_t v7;
  double v8;
  double v9;
  const char *v10;
  uint64_t v11;
  double v12;
  double v13;
  const char *v14;
  uint64_t v15;
  double v16;
  double v17;
  NSArray *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  uint64_t i;
  void *v29;
  double v30;
  double v31;
  const char *v32;
  uint64_t v33;
  double v34;
  double v35;
  double v36;
  double v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  double v43;
  double v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_layoutBoundsSize(self->_layoutSpecification, a2, v2);
  v5 = v4;
  objc_msgSend_topMargin(self->_layoutSpecification, v6, v7);
  v9 = v8;
  objc_msgSend_leadingMargin(self->_layoutSpecification, v10, v11);
  v13 = v12;
  objc_msgSend_trailingMargin(self->_layoutSpecification, v14, v15);
  v17 = v16;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v18 = self->_layoutAttributes;
  v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v45, v49, 16);
  if (v20)
  {
    v23 = v20;
    v24 = *(_QWORD *)v46;
    v25 = *MEMORY[0x24BDBF090];
    v26 = v5 - v17;
    v27 = v5 - (v13 + v17);
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v46 != v24)
          objc_enumerationMutation(v18);
        v29 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
        objc_msgSend_topMargin(v29, v21, v22, (_QWORD)v45);
        v31 = v30;
        objc_msgSend_drawableSize(v29, v32, v33);
        v35 = v34;
        v37 = v36;
        v40 = objc_msgSend_layoutOrientation(v29, v38, v39);
        if (v40 == 2)
        {
          v43 = v26 - v35;
        }
        else if (v40 == 1)
        {
          v43 = v13 + round((v27 - v35) * 0.5);
        }
        else if (v40)
        {
          v43 = v25;
        }
        else
        {
          v43 = v13;
        }
        v44 = v9 + v31;
        objc_msgSend_setFrame_(v29, v41, v42, v43, v44, v35, v37);
        v9 = v44 + v37;
      }
      v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v45, v49, 16);
    }
    while (v23);
  }

}

- (double)_spaceForVerticalSpaceDescriptor:(int64_t)a3
{
  double result;

  switch(a3)
  {
    case 0:
      MEMORY[0x24BEDD108](self->_layoutSpecification, sel_zeroVerticalItemSpacing, a3);
      break;
    case 1:
      MEMORY[0x24BEDD108](self->_layoutSpecification, sel_smallVerticalItemSpacing, a3);
      break;
    case 2:
      MEMORY[0x24BEDD108](self->_layoutSpecification, sel_mediumVerticalItemSpacing, a3);
      break;
    case 3:
      MEMORY[0x24BEDD108](self->_layoutSpecification, sel_largeVerticalItemSpacing, a3);
      break;
    default:
      return result;
  }
  return result;
}

- (void)invalidateLayout
{
  MEMORY[0x24BEDD108](self, sel_setLayoutAttributes_, 0);
}

- (id)drawableAtIndex:(unint64_t)a3
{
  const char *v5;

  objc_msgSend__buildLayoutAttributesIfNeeded(self, a2, a3);
  return (id)objc_msgSend_objectAtIndex_(self->_cachedDrawables, v5, a3);
}

- (void)removeItemsAtIndexPaths:(id)a3 insertItemsAtIndexPaths:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  void *v30;
  id v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  id v41;
  const char *v42;
  const char *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void (*v48)(uint64_t, uint64_t);
  void *v49;
  IMChatTranscriptLayoutEngine *v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend_indexSet(MEMORY[0x24BDD1698], v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v11 = v6;
  v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v56, v61, 16);
  if (v13)
  {
    v16 = v13;
    v17 = *(_QWORD *)v57;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v57 != v17)
          objc_enumerationMutation(v11);
        v19 = objc_msgSend_item(*(void **)(*((_QWORD *)&v56 + 1) + 8 * v18), v14, v15);
        objc_msgSend_addIndex_(v10, v20, v19);
        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v56, v61, 16);
    }
    while (v16);
  }

  objc_msgSend_removeObjectsAtIndexes_(self->_cachedDrawables, v21, (uint64_t)v10);
  objc_msgSend_indexSet(MEMORY[0x24BDD1698], v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)MEMORY[0x24BDBCEB8];
  v28 = objc_msgSend_count(v7, v26, v27);
  objc_msgSend_arrayWithCapacity_(v25, v29, v28);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v31 = v7;
  v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v32, (uint64_t)&v52, v60, 16);
  if (v33)
  {
    v36 = v33;
    v37 = *(_QWORD *)v53;
    do
    {
      v38 = 0;
      do
      {
        if (*(_QWORD *)v53 != v37)
          objc_enumerationMutation(v31);
        v39 = objc_msgSend_item(*(void **)(*((_QWORD *)&v52 + 1) + 8 * v38), v34, v35);
        objc_msgSend_addIndex_(v24, v40, v39);
        ++v38;
      }
      while (v36 != v38);
      v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v34, (uint64_t)&v52, v60, 16);
    }
    while (v36);
  }

  v46 = MEMORY[0x24BDAC760];
  v47 = 3221225472;
  v48 = sub_20D65A1E4;
  v49 = &unk_24C7512F8;
  v50 = self;
  v51 = v30;
  v41 = v30;
  objc_msgSend_enumerateIndexesUsingBlock_(v24, v42, (uint64_t)&v46);
  objc_msgSend_insertObjects_atIndexes_(self->_cachedDrawables, v43, (uint64_t)v41, v24, v46, v47, v48, v49, v50);
  objc_msgSend_invalidateLayout(self, v44, v45);

}

- (id)_cachedDrawableForTranscriptItem:(id)a3 atIndex:(unint64_t)a4
{
  const char *v6;
  uint64_t v7;
  id v8;
  NSMutableArray *cachedDrawables;
  NSMutableArray *v10;
  NSMutableArray *v11;
  unint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  objc_class *v22;
  void *v24;

  v8 = a3;
  cachedDrawables = self->_cachedDrawables;
  if (!cachedDrawables)
  {
    objc_msgSend_array(MEMORY[0x24BDBCEB8], v6, v7);
    v10 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v11 = self->_cachedDrawables;
    self->_cachedDrawables = v10;

    cachedDrawables = self->_cachedDrawables;
  }
  v12 = objc_msgSend_count(cachedDrawables, v6, v7);
  if (v12 < a4)
  {
    objc_msgSend_count(self->_cachedDrawables, v13, v14);
    _IMWarn();
LABEL_11:
    v16 = 0;
    goto LABEL_12;
  }
  if (v12 > a4
    && (objc_msgSend__cachedDrawableAtIndexOrNil_(self, v13, a4),
        (v15 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v16 = v15;
    objc_msgSend_setChatTranscriptItem_(v15, v13, (uint64_t)v8);
  }
  else
  {
    objc_msgSend__makeDrawableForTranscriptItem_(self, v13, (uint64_t)v8);
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      objc_msgSend_null(MEMORY[0x24BDBCEF8], v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_atIndexedSubscript_(self->_cachedDrawables, v21, (uint64_t)v20, a4);

      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      _IMWarn();

      goto LABEL_11;
    }
    v16 = (void *)v17;
    objc_msgSend_setObject_atIndexedSubscript_(self->_cachedDrawables, v18, v17, a4);
  }
LABEL_12:

  return v16;
}

- (id)_cachedDrawableAtIndexOrNil:(unint64_t)a3
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;
  id v9;

  objc_msgSend_objectAtIndexedSubscript_(self->_cachedDrawables, a2, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_null(MEMORY[0x24BDBCEF8], v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isEqual_(v3, v7, (uint64_t)v6))
    v8 = 0;
  else
    v8 = v3;
  v9 = v8;

  return v9;
}

- (id)_makeDrawableForTranscriptItem:(id)a3
{
  return (id)MEMORY[0x24BEDD108](a3, sel_contentDrawable, a3);
}

- (unint64_t)_numberOfTranscriptItems
{
  id WeakRetained;
  const char *v4;
  unint64_t v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v5 = objc_msgSend_numberOfTranscriptItemsForLayoutEngine_(WeakRetained, v4, (uint64_t)self);

  return v5;
}

- (void)_invalidateCachedItemData
{
  NSMutableArray *cachedDrawables;

  cachedDrawables = self->_cachedDrawables;
  self->_cachedDrawables = 0;

}

- (void)_updateContentSize
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  double MaxY;
  const char *v8;
  uint64_t v9;
  double v10;
  double v11;
  const char *v12;
  uint64_t v13;
  double v14;
  const char *v15;
  uint64_t v16;
  id v17;
  CGRect v18;

  objc_msgSend_lastObject(self->_layoutAttributes, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v4;
  if (v4)
  {
    objc_msgSend_frame(v4, v5, v6);
    MaxY = CGRectGetMaxY(v18);
    objc_msgSend_layoutBoundsSize(self->_layoutSpecification, v8, v9);
    v11 = v10;
    objc_msgSend_bottomMargin(self->_layoutSpecification, v12, v13);
    objc_msgSend_setContentSize_(self, v15, v16, v11, MaxY + v14);
  }
  else
  {
    objc_msgSend_setContentSize_(self, v5, v6, *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
  }

}

- (IMChatTranscriptLayoutEngineDataSource)dataSource
{
  return (IMChatTranscriptLayoutEngineDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (IMChatTranscriptLayoutSpecification)layoutSpecification
{
  return self->_layoutSpecification;
}

- (void)setContentSize:(CGSize)a3
{
  self->_contentSize = a3;
}

- (void)setLayoutAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutAttributes, 0);
  objc_storeStrong((id *)&self->_layoutSpecification, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_cachedDrawables, 0);
}

@end
