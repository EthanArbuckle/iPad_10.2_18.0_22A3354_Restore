@implementation CNVisualIdentityAvatarLayoutManager

- (CNVisualIdentityAvatarLayoutManager)init
{
  return -[CNVisualIdentityAvatarLayoutManager initWithLayoutType:](self, "initWithLayoutType:", 0);
}

- (CNVisualIdentityAvatarLayoutManager)initWithLayoutType:(unint64_t)a3
{
  CNVisualIdentityAvatarLayoutManager *v4;
  uint64_t v5;
  NSArray *avatarViewLayoutConfiguration;
  NSArray *avatarLayerItems;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSArray *avatarViewAdHocLayoutConfiguration;
  CNVisualIdentityAvatarLayoutManager *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CNVisualIdentityAvatarLayoutManager;
  v4 = -[CNVisualIdentityAvatarLayoutManager init](&v14, sel_init);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D13C80], "avatarViewLayoutConfigurationsForType:", a3);
    v5 = objc_claimAutoreleasedReturnValue();
    avatarViewLayoutConfiguration = v4->_avatarViewLayoutConfiguration;
    v4->_avatarViewLayoutConfiguration = (NSArray *)v5;

    avatarLayerItems = v4->_avatarLayerItems;
    v4->_avatarLayerItems = (NSArray *)MEMORY[0x1E0C9AA60];

    v4->_maxAvatarCount = objc_msgSend(MEMORY[0x1E0D13C80], "maxAvatarCountForType:", a3);
    if (a3 >= 2)
    {
      if (a3 != 2)
      {
LABEL_7:
        v12 = v4;
        goto LABEL_8;
      }
      v8 = (void *)MEMORY[0x1E0D13C80];
      v9 = 2;
    }
    else
    {
      v8 = (void *)MEMORY[0x1E0D13C80];
      v9 = 1;
    }
    objc_msgSend(v8, "avatarViewLayoutConfigurationsForType:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    avatarViewAdHocLayoutConfiguration = v4->_avatarViewAdHocLayoutConfiguration;
    v4->_avatarViewAdHocLayoutConfiguration = (NSArray *)v10;

    goto LABEL_7;
  }
LABEL_8:

  return v4;
}

- (void)updateAvatarLayersForItemCount:(int64_t)a3 inView:(id)a4
{
  -[CNVisualIdentityAvatarLayoutManager updateAvatarLayersForItemCount:inView:withLayoutType:](self, "updateAvatarLayersForItemCount:inView:withLayoutType:", a3, a4, 1);
}

- (void)updateAvatarLayersForItemCount:(int64_t)a3 inView:(id)a4 withLayoutType:(unint64_t)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  -[CNVisualIdentityAvatarLayoutManager avatarLayerItems](self, "avatarLayerItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  v11 = v10 - a3;
  if (v10 == a3)
  {
    -[CNVisualIdentityAvatarLayoutManager avatarLayerItems](self, "avatarLayerItems");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_cn_each:", &__block_literal_global_32572);

  }
  if (v11 >= 1)
  {
    -[CNVisualIdentityAvatarLayoutManager avatarLayerItems](self, "avatarLayerItems");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_cn_takeLast:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v15 = v14;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v33 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          objc_msgSend(v20, "layer", (_QWORD)v32);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "removeFromSuperlayer");

          objc_msgSend(v20, "resetToken");
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v17);
    }

    -[CNVisualIdentityAvatarLayoutManager avatarLayerItems](self, "avatarLayerItems");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "_cn_take:", a3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVisualIdentityAvatarLayoutManager setAvatarLayerItems:](self, "setAvatarLayerItems:", v23);

  }
  if (a3 >= 1)
  {
    v24 = 0;
    do
    {
      -[CNVisualIdentityAvatarLayoutManager avatarLayerItems](self, "avatarLayerItems", (_QWORD)v32);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "count");

      if (v24 >= v26)
      {
        objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D13C78]), "initWithLayer:", v29);
        -[CNVisualIdentityAvatarLayoutManager avatarLayerItems](self, "avatarLayerItems");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "arrayByAddingObject:", v28);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNVisualIdentityAvatarLayoutManager setAvatarLayerItems:](self, "setAvatarLayerItems:", v31);

      }
      else
      {
        -[CNVisualIdentityAvatarLayoutManager avatarLayerItems](self, "avatarLayerItems");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "objectAtIndexedSubscript:", v24);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v28, "layer");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v28, "resetToken");
      -[CNVisualIdentityAvatarLayoutManager updateLayer:forItemCount:atIndex:inView:withLayoutType:](self, "updateLayer:forItemCount:atIndex:inView:withLayoutType:", v29, a3, v24, v8, a5);

      ++v24;
    }
    while (a3 != v24);
  }

}

- (void)updateLayer:(id)a3 forItemCount:(int64_t)a4 atIndex:(int64_t)a5 inView:(id)a6 withLayoutType:(unint64_t)a7
{
  id v12;
  void *v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;

  v19 = a3;
  v12 = a6;
  -[CNVisualIdentityAvatarLayoutManager layoutConfigurationForIndex:inItemCount:withLayoutType:](self, "layoutConfigurationForIndex:inItemCount:withLayoutType:", a5, a4, a7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "effectiveUserInterfaceLayoutDirection");
  objc_msgSend(v12, "bounds");
  objc_msgSend(v13, "updateLayer:inBounds:atIndex:isRTL:", v19, a5, v14 == 1);
  if (!a7)
  {
    if (-[CNVisualIdentityAvatarLayoutManager hasMediaContextBadge](self, "hasMediaContextBadge"))
    {
      objc_msgSend(v13, "x");
      if (v15 > 0.0)
      {
        -[CNVisualIdentityAvatarLayoutManager avatarFrameForFocusedAvatarInView:](self, "avatarFrameForFocusedAvatarInView:", v12);
        objc_msgSend(MEMORY[0x1E0D13C80], "avatarBadgeRectForAvatarInRect:badgeType:isRTL:", 2, v14 == 1);
        if (v14 == 1)
          v17 = -(v16 * 0.75);
        else
          v17 = v16 * 0.75;
        objc_msgSend(v19, "frame");
        objc_msgSend(v19, "setFrame:", v18 + v17);
      }
    }
  }

}

- (BOOL)hasMediaContextBadge
{
  void *v2;
  BOOL v3;

  -[CNVisualIdentityAvatarLayoutManager mediaContextBadge](self, "mediaContextBadge");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)updateAvatarLayersWithPrimaryAvatarForItemCount:(int64_t)a3 inView:(id)a4
{
  -[CNVisualIdentityAvatarLayoutManager updateAvatarLayersForItemCount:inView:withLayoutType:](self, "updateAvatarLayersForItemCount:inView:withLayoutType:", a3, a4, 0);
}

- (CGRect)avatarFrameForFocusedAvatarInView:(id)a3
{
  id v4;
  void *v5;
  double v6;
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
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect result;

  v4 = a3;
  -[CNVisualIdentityAvatarLayoutManager layoutConfigurationForIndex:inItemCount:withLayoutType:](self, "layoutConfigurationForIndex:inItemCount:withLayoutType:", 0, 1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  objc_msgSend(v5, "itemFrameInContainingBounds:isRTL:", 0, v7, v9, v11, v13);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  v22 = v15;
  v23 = v17;
  v24 = v19;
  v25 = v21;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (CGRect)adHocAvatarFrameInView:(id)a3 forItemCount:(int64_t)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  objc_msgSend(a3, "bounds");
  -[CNVisualIdentityAvatarLayoutManager adHocAvatarFrameInBounds:forItemCount:](self, "adHocAvatarFrameInBounds:forItemCount:", a4);
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (CGRect)adHocAvatarFrameInBounds:(CGRect)a3 forItemCount:(int64_t)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CNVisualIdentityAvatarLayoutManager avatarViewAdHocLayoutConfiguration](self, "avatarViewAdHocLayoutConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityAvatarLayoutManager avatarFrameInBounds:forItemCount:withConfiguration:](self, "avatarFrameInBounds:forItemCount:withConfiguration:", a4, v10, x, y, width, height);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v19 = v12;
  v20 = v14;
  v21 = v16;
  v22 = v18;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (CGRect)avatarFrameInBounds:(CGRect)a3 forItemCount:(int64_t)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CNVisualIdentityAvatarLayoutManager avatarViewLayoutConfiguration](self, "avatarViewLayoutConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityAvatarLayoutManager avatarFrameInBounds:forItemCount:withConfiguration:](self, "avatarFrameInBounds:forItemCount:withConfiguration:", a4, v10, x, y, width, height);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v19 = v12;
  v20 = v14;
  v21 = v16;
  v22 = v18;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (CGRect)avatarFrameInBounds:(CGRect)a3 forItemCount:(int64_t)a4 withConfiguration:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  double v20;
  double v21;
  double v22;
  id v23;
  double v24;
  double v25;
  double v26;
  id v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;
  CGRect v46;
  CGRect v47;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v45 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = v10;
  if (a4 <= 0)
  {
    v28 = *MEMORY[0x1E0C9D648];
    v29 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v30 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v31 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  else
  {
    objc_msgSend(v10, "objectAtIndexedSubscript:", a4 - 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    if (v13)
    {
      v14 = v13;
      v15 = 0;
      v16 = 0;
      v17 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v41 != v17)
            objc_enumerationMutation(v12);
          v19 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          if (!v15
            || (objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "x"), v21 = v20, objc_msgSend(v15, "x"), v21 < v22))
          {
            v23 = v19;

            v15 = v23;
          }
          if (v16)
          {
            objc_msgSend(v19, "x");
            v25 = v24;
            objc_msgSend(v16, "x");
            if (v25 <= v26)
              continue;
          }
          v27 = v19;

          v16 = v27;
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      }
      while (v14);
    }
    else
    {
      v15 = 0;
      v16 = 0;
    }
    objc_msgSend(v16, "itemFrameInContainingBounds:isRTL:", 0, x, y, width, height);
    v33 = v32;
    v35 = v34;
    objc_msgSend(v15, "itemFrameInContainingBounds:isRTL:", 0, x, y, width, height);
    v46.size.width = v33 + v35 - v46.origin.x;
    v46.origin.y = y;
    v46.size.height = height;
    v47 = CGRectIntegral(v46);
    v28 = v47.origin.x;
    v29 = v47.origin.y;
    v30 = v47.size.width;
    v31 = v47.size.height;

  }
  v36 = v28;
  v37 = v29;
  v38 = v30;
  v39 = v31;
  result.size.height = v39;
  result.size.width = v38;
  result.origin.y = v37;
  result.origin.x = v36;
  return result;
}

- (id)layoutConfigurationForIndex:(int64_t)a3 inItemCount:(int64_t)a4 withLayoutType:(unint64_t)a5
{
  void *v7;
  void *v8;
  void *v9;

  if ((a5 | 2) == 2)
    -[CNVisualIdentityAvatarLayoutManager avatarViewLayoutConfiguration](self, "avatarViewLayoutConfiguration");
  else
    -[CNVisualIdentityAvatarLayoutManager avatarViewAdHocLayoutConfiguration](self, "avatarViewAdHocLayoutConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a4 - 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectAtIndexedSubscript:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (int64_t)maxAvatarCount
{
  return self->_maxAvatarCount;
}

- (NSArray)avatarLayerItems
{
  return self->_avatarLayerItems;
}

- (void)setAvatarLayerItems:(id)a3
{
  objc_storeStrong((id *)&self->_avatarLayerItems, a3);
}

- (CNAvatarAccessoryView)mediaContextBadge
{
  return self->_mediaContextBadge;
}

- (void)setMediaContextBadge:(id)a3
{
  objc_storeStrong((id *)&self->_mediaContextBadge, a3);
}

- (NSArray)avatarViewAdHocLayoutConfiguration
{
  return self->_avatarViewAdHocLayoutConfiguration;
}

- (void)setAvatarViewAdHocLayoutConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_avatarViewAdHocLayoutConfiguration, a3);
}

- (NSArray)avatarViewLayoutConfiguration
{
  return self->_avatarViewLayoutConfiguration;
}

- (void)setAvatarViewLayoutConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_avatarViewLayoutConfiguration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarViewLayoutConfiguration, 0);
  objc_storeStrong((id *)&self->_avatarViewAdHocLayoutConfiguration, 0);
  objc_storeStrong((id *)&self->_mediaContextBadge, 0);
  objc_storeStrong((id *)&self->_avatarLayerItems, 0);
}

uint64_t __92__CNVisualIdentityAvatarLayoutManager_updateAvatarLayersForItemCount_inView_withLayoutType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "resetToken");
}

@end
