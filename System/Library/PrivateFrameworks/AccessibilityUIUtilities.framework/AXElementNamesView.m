@implementation AXElementNamesView

- (AXElementNamesView)initWithFrame:(CGRect)a3
{
  AXElementNamesView *v3;
  uint64_t v4;
  NSMutableArray *containers;
  CGSize v6;
  uint64_t v7;
  OS_os_log *loggingFacility;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AXElementNamesView;
  v3 = -[AXElementNamesView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = objc_claimAutoreleasedReturnValue();
    containers = v3->_containers;
    v3->_containers = (NSMutableArray *)v4;

    v6 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    v3->_boundsForLastReload.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    v3->_boundsForLastReload.size = v6;
    AXLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    loggingFacility = v3->_loggingFacility;
    v3->_loggingFacility = (OS_os_log *)v7;

  }
  return v3;
}

- (void)setItems:(id)a3
{
  NSArray *v6;
  NSObject *v7;

  v6 = (NSArray *)a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    -[AXElementNamesView loggingFacility](self, "loggingFacility");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[AXElementNamesView setItems:].cold.1(a2, v7);

  }
  if (self->_items != v6)
  {
    objc_storeStrong((id *)&self->_items, a3);
    -[AXElementNamesView setDidUpdateItems:](self, "setDidUpdateItems:", 1);
    -[AXElementNamesView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  objc_super v15;
  CGRect v16;
  CGRect v17;

  v15.receiver = self;
  v15.super_class = (Class)AXElementNamesView;
  -[AXElementNamesView layoutSubviews](&v15, sel_layoutSubviews);
  -[AXElementNamesView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[AXElementNamesView boundsForLastReload](self, "boundsForLastReload");
  v17.origin.x = v11;
  v17.origin.y = v12;
  v17.size.width = v13;
  v17.size.height = v14;
  v16.origin.x = v4;
  v16.origin.y = v6;
  v16.size.width = v8;
  v16.size.height = v10;
  if (!CGRectEqualToRect(v16, v17) || -[AXElementNamesView didUpdateItems](self, "didUpdateItems"))
  {
    -[AXElementNamesView setDidUpdateItems:](self, "setDidUpdateItems:", 0);
    -[AXElementNamesView bounds](self, "bounds");
    -[AXElementNamesView setBoundsForLastReload:](self, "setBoundsForLastReload:");
    -[AXElementNamesView _reloadViews](self, "_reloadViews");
  }
}

- (void)_reloadViews
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  AXElementNamesItemView *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  NSObject *v46;
  id v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t k;
  void *v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t m;
  void *v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t n;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  _BYTE v90[128];
  _BYTE v91[5];
  uint8_t v92[128];
  uint8_t buf[4];
  void *v94;
  _BYTE v95[128];
  _BYTE v96[128];
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  -[AXElementNamesView containers](self, "containers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v86, v96, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v87;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v87 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v86 + 1) + 8 * i), "removeFromSuperview");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v86, v96, 16);
    }
    while (v5);
  }

  -[AXElementNamesView containers](self, "containers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAllObjects");

  -[AXCyclingView endCycling](self, "endCycling");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  -[AXElementNamesView items](self, "items");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v82, v95, 16);
  if (v11)
  {
    v13 = v11;
    v14 = *(_QWORD *)v83;
    *(_QWORD *)&v12 = 138412290;
    v69 = v12;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v83 != v14)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * j);
        objc_msgSend(v16, "elementName", v69);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "length");

        if (v18)
        {
          -[AXElementNamesView bounds](self, "bounds");
          v20 = v19;
          v22 = v21;
          v24 = v23;
          v26 = v25;
          -[AXElementNamesView safeAreaInsets](self, "safeAreaInsets");
          v28 = v20 + v27;
          v30 = v22 + v29;
          v32 = v24 - (v27 + v31);
          v34 = v26 - (v29 + v33);
          v35 = [AXElementNamesItemView alloc];
          objc_msgSend(v16, "elementName");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "elementFrame");
          v38 = v37;
          v40 = v39;
          v42 = v41;
          v44 = v43;
          -[AXElementNamesView styleProvider](self, "styleProvider");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = -[AXElementNamesItemView initWithName:elementFrame:availableBounds:styleProvider:isSpacer:](v35, "initWithName:elementFrame:availableBounds:styleProvider:isSpacer:", v36, v45, objc_msgSend(v16, "isSpacer"), v38, v40, v42, v44, v28, v30, v32, v34);

          objc_msgSend(v16, "elementLabelContainerSize");
          -[NSObject setForcedLabelContainerSize:](v46, "setForcedLabelContainerSize:");
          objc_msgSend(v9, "addObject:", v46);
        }
        else
        {
          -[AXElementNamesView loggingFacility](self, "loggingFacility");
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v69;
            v94 = v16;
            _os_log_impl(&dword_1BD892000, v46, OS_LOG_TYPE_INFO, "Found element with no name: %@", buf, 0xCu);
          }
        }

      }
      v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v82, v95, 16);
    }
    while (v13);
  }
  while (1)
  {

    if (!objc_msgSend(v9, "count"))
      break;
    v47 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[AXElementNamesView bounds](self, "bounds");
    v10 = (void *)objc_msgSend(v47, "initWithFrame:");
    -[AXElementNamesView _arrangeNameViews:withinContainer:](self, "_arrangeNameViews:withinContainer:", v9, v10);
    objc_msgSend(v10, "subviews");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v48, "count");

    if (!v49)
    {

      break;
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    objc_msgSend(v10, "subviews");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v78, v92, 16);
    if (v52)
    {
      v53 = v52;
      v54 = 0;
      v55 = *(_QWORD *)v79;
      do
      {
        for (k = 0; k != v53; ++k)
        {
          if (*(_QWORD *)v79 != v55)
            objc_enumerationMutation(v51);
          v57 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * k);
          if ((objc_msgSend(v57, "isSpacer") & 1) != 0)
          {
            objc_msgSend(v50, "addObject:", v57);
          }
          else
          {
            objc_msgSend(v9, "removeObject:", v57);
            ++v54;
          }
        }
        v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v78, v92, 16);
      }
      while (v53);
    }
    else
    {
      v54 = 0;
    }

    v76 = 0u;
    v77 = 0u;
    v74 = 0u;
    v75 = 0u;
    v58 = v50;
    v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v74, v91, 16);
    if (v59)
    {
      v60 = v59;
      v61 = *(_QWORD *)v75;
      do
      {
        for (m = 0; m != v60; ++m)
        {
          if (*(_QWORD *)v75 != v61)
            objc_enumerationMutation(v58);
          objc_msgSend(*(id *)(*((_QWORD *)&v74 + 1) + 8 * m), "removeFromSuperview");
        }
        v60 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v74, v91, 16);
      }
      while (v60);
    }

    if (v54)
    {
      -[AXElementNamesView containers](self, "containers");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "addObject:", v10);

      -[AXElementNamesView addSubview:](self, "addSubview:", v10);
    }
    else
    {
      v72 = 0u;
      v73 = 0u;
      v70 = 0u;
      v71 = 0u;
      v64 = v58;
      v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v70, v90, 16);
      if (v65)
      {
        v66 = v65;
        v67 = *(_QWORD *)v71;
        do
        {
          for (n = 0; n != v66; ++n)
          {
            if (*(_QWORD *)v71 != v67)
              objc_enumerationMutation(v64);
            objc_msgSend(v9, "removeObject:", *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * n));
          }
          v66 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v70, v90, 16);
        }
        while (v66);
      }

    }
  }
  -[AXCyclingView beginCycling](self, "beginCycling");

}

- (void)_adjustLabelPositionForView:(id)a3 toAvoidCollidingWithView:(id)a4
{
  id v6;
  id v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  CGRect v17;
  CGRect v18;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x1E0C9D648];
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v10 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v11 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  while (1)
  {
    objc_msgSend(v6, "labelContainerFrame");
    v18.origin.x = v8;
    v18.origin.y = v9;
    v18.size.width = v10;
    v18.size.height = v11;
    if (!CGRectEqualToRect(v17, v18) && !objc_msgSend(v6, "collidesWithView:", v7))
      break;
    if (objc_msgSend(v6, "labelPosition") == 4)
    {
      -[AXElementNamesView loggingFacility](self, "loggingFacility");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v6, "name");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138412290;
        v15 = v13;
        _os_log_impl(&dword_1BD892000, v12, OS_LOG_TYPE_INFO, "Could not find a non-colliding position for label for %@", (uint8_t *)&v14, 0xCu);

      }
      objc_msgSend(v6, "removeFromSuperview");
      break;
    }
    objc_msgSend(v6, "setLabelPosition:", objc_msgSend(v6, "labelPosition") + 1);
  }

}

- (void)_arrangeNameViews:(id)a3 withinContainer:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  void *v14;
  uint64_t i;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  CGRect v22;
  CGRect v23;

  v21 = a3;
  v6 = a4;
  v7 = objc_msgSend(v21, "count");
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *MEMORY[0x1E0C9D648];
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v13 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    do
    {
      objc_msgSend(v21, "objectAtIndexedSubscript:", v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "isSpacer"))
      {
        objc_msgSend(v14, "setLabelPosition:", 4);
        objc_msgSend(v6, "addSubview:", v14);
      }
      else
      {
        objc_msgSend(v14, "setLabelPosition:", 0);
        objc_msgSend(v6, "addSubview:", v14);
        while (objc_msgSend(v14, "labelPosition") != 4)
        {
          objc_msgSend(v14, "labelContainerFrame");
          v23.origin.x = v10;
          v23.origin.y = v11;
          v23.size.width = v12;
          v23.size.height = v13;
          if (!CGRectEqualToRect(v22, v23))
            break;
          objc_msgSend(v14, "setLabelPosition:", objc_msgSend(v14, "labelPosition") + 1);
        }
        if (v9)
        {
          for (i = 0; ; i = 0)
          {
            while (1)
            {
              objc_msgSend(v21, "objectAtIndexedSubscript:", i);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "superview");
              v17 = (id)objc_claimAutoreleasedReturnValue();

              if (v17 == v6)
              {
                v18 = objc_msgSend(v14, "labelPosition");
                -[AXElementNamesView _adjustLabelPositionForView:toAvoidCollidingWithView:](self, "_adjustLabelPositionForView:toAvoidCollidingWithView:", v14, v16);
                if (v18 != objc_msgSend(v14, "labelPosition"))
                  break;
              }

              if (++i == v9)
                goto LABEL_17;
            }
            objc_msgSend(v14, "superview");
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v19)
              break;
          }
        }
LABEL_17:
        if (objc_msgSend(v14, "hasExtendedArrow"))
        {
          objc_msgSend(v14, "superview");
          v20 = (id)objc_claimAutoreleasedReturnValue();

          if (v20 == v6)
          {
            objc_msgSend(v14, "removeFromSuperview");
            objc_msgSend(v6, "insertSubview:atIndex:", v14, 0);
          }
        }
      }

      ++v9;
    }
    while (v9 != v8);
  }

}

- (NSArray)items
{
  return self->_items;
}

- (OS_os_log)loggingFacility
{
  return self->_loggingFacility;
}

- (void)setLoggingFacility:(id)a3
{
  objc_storeStrong((id *)&self->_loggingFacility, a3);
}

- (AXElementNamesStyleProvider)styleProvider
{
  return self->_styleProvider;
}

- (void)setStyleProvider:(id)a3
{
  objc_storeStrong((id *)&self->_styleProvider, a3);
}

- (NSMutableArray)containers
{
  return self->_containers;
}

- (CGRect)boundsForLastReload
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_boundsForLastReload.origin.x;
  y = self->_boundsForLastReload.origin.y;
  width = self->_boundsForLastReload.size.width;
  height = self->_boundsForLastReload.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setBoundsForLastReload:(CGRect)a3
{
  self->_boundsForLastReload = a3;
}

- (BOOL)didUpdateItems
{
  return self->_didUpdateItems;
}

- (void)setDidUpdateItems:(BOOL)a3
{
  self->_didUpdateItems = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containers, 0);
  objc_storeStrong((id *)&self->_styleProvider, 0);
  objc_storeStrong((id *)&self->_loggingFacility, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

- (void)setItems:(const char *)a1 .cold.1(const char *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_fault_impl(&dword_1BD892000, a2, OS_LOG_TYPE_FAULT, "-[AXElementNamesView %@] called off the main thread!", (uint8_t *)&v4, 0xCu);

}

@end
