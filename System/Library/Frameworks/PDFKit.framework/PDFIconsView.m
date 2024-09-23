@implementation PDFIconsView

- (id)initFromThumbnailView:(id)a3
{
  id v4;
  PDFIconsView *v5;
  PDFIconsView *v6;
  NSMutableArray *v7;
  NSMutableArray *icons;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PDFIconsView;
  v5 = -[PDFIconsView init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_thumbnailView, v4);
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    icons = v6->_icons;
    v6->_icons = v7;

    objc_msgSend(MEMORY[0x24BDF6950], "tertiarySystemBackgroundColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFIconsView setBackgroundColor:](v6, "setBackgroundColor:", v9);

  }
  return v6;
}

- (void)updateIconsImages
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_icons;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "setNeedsUpdate", (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (id)currentPage
{
  void *v3;
  void *v4;

  if ((-[PDFPageIconLayer isHidden](self->_activeIcon, "isHidden") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    -[PDFPageIconLayer document](self->_activeIcon, "document");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pageAtIndex:", -[PDFPageIconLayer pageIndex](self->_activeIcon, "pageIndex"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)documentMutated:(id)a3
{
  -[PDFIconsView updateIconsImages](self, "updateIconsImages", a3);
  -[PDFIconsView setNeedsLayout](self, "setNeedsLayout");
}

- (void)currentPageChanged:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
  objc_msgSend(WeakRetained, "PDFView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentPage");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "document");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "indexForPage:", v8);

  -[PDFIconsView _updateScrubberForPageIndex:goToPage:](self, "_updateScrubberForPageIndex:goToPage:", v7, 0);
}

- (void)pageChanged:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("page"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "document");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "indexForPage:", v5);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = self->_icons;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v13, "pageIndex", (_QWORD)v14) == (_DWORD)v7)
        {
          objc_msgSend(v13, "setNeedsUpdate");

          -[PDFIconsView setNeedsLayout](self, "setNeedsLayout");
          goto LABEL_11;
        }
      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v10)
        continue;
      break;
    }
  }

LABEL_11:
  if (-[PDFPageIconLayer pageIndex](self->_activeIcon, "pageIndex", (_QWORD)v14) == (_DWORD)v7)
  {
    -[PDFPageIconLayer setNeedsUpdate](self->_activeIcon, "setNeedsUpdate");
    -[PDFPageIconLayer updateAsPageIndex:forDocument:](self->_activeIcon, "updateAsPageIndex:forDocument:", v7, v6);
  }

}

- (void)layoutSubviews
{
  void *v3;
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  int v7;
  double v8;
  double v9;
  int v10;
  unsigned int v11;
  int v12;
  PDFPageIconLayer *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double MidX;
  double MidY;
  double v33;
  double v34;
  uint64_t v35;
  double v36;
  double v37;
  int v38;
  int v39;
  unsigned int v40;
  int v41;
  int v42;
  uint64_t v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  __n128 v58;
  __n128 v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  id WeakRetained;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;

  WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
  objc_msgSend(WeakRetained, "PDFView");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "document");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(WeakRetained, "layoutMode");
  v5 = -[PDFIconsView _iconsLayoutIconCount](self, "_iconsLayoutIconCount");
  v6 = v5;
  v7 = -[NSMutableArray count](self->_icons, "count");
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  objc_msgSend(WeakRetained, "thumbnailSize");
  v78 = v9;
  v79 = v8;
  v10 = v5 - v7;
  if (v5 != v7)
  {
    if (v10 >= 0)
      v11 = v5 - v7;
    else
      v11 = v7 - v5;
    if (v11 <= 1)
      v12 = 1;
    else
      v12 = v11;
    do
    {
      if (v10 < 0)
      {
        -[NSMutableArray objectAtIndex:](self->_icons, "objectAtIndex:", 0);
        v13 = (PDFPageIconLayer *)objc_claimAutoreleasedReturnValue();
        -[PDFPageIconLayer removeFromSuperlayer](v13, "removeFromSuperlayer");
        -[NSMutableArray removeObjectAtIndex:](self->_icons, "removeObjectAtIndex:", 0);
      }
      else
      {
        v13 = -[PDFPageIconLayer initWithSize:]([PDFPageIconLayer alloc], "initWithSize:", v79, v78);
        -[PDFIconsView layer](self, "layer");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addSublayer:", v13);

        -[NSMutableArray addObject:](self->_icons, "addObject:", v13);
      }

      --v12;
    }
    while (v12);
  }
  -[PDFIconsView bounds](self, "bounds");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  objc_msgSend(WeakRetained, "contentInset");
  v24 = v16 + v23;
  v26 = v18 + v25;
  v28 = v20 - (v23 + v27);
  v30 = v22 - (v25 + v29);
  v80.origin.x = v16 + v23;
  v80.origin.y = v26;
  v80.size.width = v28;
  v80.size.height = v30;
  MidX = CGRectGetMidX(v80);
  v81.origin.x = v24;
  v81.origin.y = v26;
  v81.size.width = v28;
  v81.size.height = v30;
  MidY = CGRectGetMidY(v81);
  -[PDFIconsView _iconsLayoutSize](self, "_iconsLayoutSize");
  if ((int)v6 >= 1)
  {
    v35 = 0;
    v76 = v79 + 2.0;
    v77 = MidX - v33 * 0.5 + 1.0;
    v75 = MidY - v34 * 0.5 + 1.0;
    do
    {
      if (v4)
        v36 = v75;
      else
        v36 = v75 + (double)(int)v35 * (v78 + 2.0);
      if (v4)
        v37 = v77 + (double)(int)v35 * v76;
      else
        v37 = v77;
      v38 = objc_msgSend(v3, "pageCount", v77 + (double)(int)v35 * v76);
      v39 = v38;
      v40 = v38 - 1;
      v41 = llroundf((float)((float)(int)v35 / (float)(v6 - 1)) * (float)(v38 - 1));
      v42 = v41 & ~(v41 >> 31);
      if (v42 < v38)
        v40 = v42;
      if ((_DWORD)v6 == v38)
        v43 = v35;
      else
        v43 = v40;
      if (v4 == 1)
      {
        if (objc_msgSend(v73, "displaysRTL"))
          v43 = (~(_DWORD)v43 + v39);
        else
          v43 = v43;
      }
      objc_msgSend(v3, "pageAtIndex:", (int)v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "boundsForBox:", 1);
      v49 = PDFRectFromCGRect(v45, v46, v47, v48);
      v51 = PDFRectRotate(objc_msgSend(v44, "rotation"), v49, v50);
      v53 = v52;
      v55 = v54;
      v57 = v56;
      v58.n128_u64[0] = 0;
      v59.n128_u64[0] = 0;
      v60 = PDFRectMake(v58, v59, v79, v78);
      v64 = PDFScaleRectToRect(v51, v53, v55, v57, v60, v61, v62, v63);
      v65 = PDFRectScale(v51, v53, v55, v57, v64);
      v67 = v66;
      v69 = v68;
      -[NSMutableArray objectAtIndex:](self->_icons, "objectAtIndex:", v35, v65);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v82.size.width = v67;
      v82.size.height = v69;
      v82.origin.x = v37 - (v67 - v79) * 0.5;
      objc_msgSend(v70, "setFrame:", COERCE_DOUBLE(CGRectIntegral(v82)), v36 - (v69 - v78) * 0.5, v67, v69);
      objc_msgSend(v70, "updateAsPageIndex:forDocument:", v43, v3);

      ++v35;
    }
    while (v6 != v35);
  }
  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
  objc_msgSend(v73, "currentPage");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = objc_msgSend(v3, "indexForPage:", v71);

  -[PDFIconsView _updateScrubberForPageIndex:goToPage:](self, "_updateScrubberForPageIndex:goToPage:", v72, 1);
}

- (int)_iconsLayoutIconCount
{
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
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
  int v24;

  WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
  objc_msgSend(WeakRetained, "PDFView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "document");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(WeakRetained, "layoutMode");
  if (v4)
    v7 = v5 == 0;
  else
    v7 = 1;
  if (v7 || (v8 = v6, (objc_msgSend(v5, "isLocked") & 1) != 0) || !objc_msgSend(v5, "pageCount"))
  {
    v24 = 0;
  }
  else
  {
    -[PDFIconsView bounds](self, "bounds");
    v10 = v9;
    v12 = v11;
    objc_msgSend(WeakRetained, "contentInset");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    objc_msgSend(WeakRetained, "thumbnailSize");
    if (v8)
    {
      v23 = v10 - (v16 + v20);
    }
    else
    {
      v21 = v22;
      v23 = v12 - (v14 + v18);
    }
    v24 = vcvtmd_s64_f64(v23 / (v21 + 2.0));
    if (objc_msgSend(v5, "pageCount") < (unint64_t)v24)
      v24 = objc_msgSend(v5, "pageCount");
  }

  return v24;
}

- (CGSize)_iconsLayoutSize
{
  id WeakRetained;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  int v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
  v4 = objc_msgSend(WeakRetained, "layoutMode");
  objc_msgSend(WeakRetained, "thumbnailSize");
  v6 = v5;
  v8 = v7;
  v9 = -[PDFIconsView _iconsLayoutIconCount](self, "_iconsLayoutIconCount");
  if (v4)
    v10 = (v6 + 2.0) * (double)v9;
  else
    v10 = v6 + 2.0;
  if (v4)
    v11 = v8 + 2.0;
  else
    v11 = (v8 + 2.0) * (double)v9;

  v12 = v10;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v5;

  objc_msgSend(a3, "anyObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationInView:", self);
  -[PDFIconsView _updateScrubberAtViewLocation:](self, "_updateScrubberAtViewLocation:");

}

- (void)_updateScrubberAtViewLocation:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double MidX;
  double MidY;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  int v33;
  unsigned int v34;
  uint64_t v35;
  id WeakRetained;
  CGRect v37;
  CGRect v38;

  y = a3.y;
  x = a3.x;
  WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
  objc_msgSend(WeakRetained, "PDFView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "document");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(WeakRetained, "layoutMode");
  if (v7)
  {
    v9 = v8;
    -[PDFIconsView bounds](self, "bounds");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    objc_msgSend(WeakRetained, "contentInset");
    v19 = v11 + v18;
    v21 = v13 + v20;
    v23 = v15 - (v18 + v22);
    v25 = v17 - (v20 + v24);
    v37.origin.x = v19;
    v37.origin.y = v21;
    v37.size.width = v23;
    v37.size.height = v25;
    MidX = CGRectGetMidX(v37);
    v38.origin.x = v19;
    v38.origin.y = v21;
    v38.size.width = v23;
    v38.size.height = v25;
    MidY = CGRectGetMidY(v38);
    -[PDFIconsView _iconsLayoutSize](self, "_iconsLayoutSize");
    v29 = (x - (MidX - v28 * 0.5)) / (MidX + v28 * 0.5 - (MidX - v28 * 0.5));
    v31 = (y - (MidY - v30 * 0.5)) / (MidY + v30 * 0.5 - (MidY - v30 * 0.5));
    if (!v9)
      v29 = v31;
    if (v29 >= -0.1 && v29 <= 1.1)
    {
      v32 = CGFloatClamp(v29, 0.0, 1.0);
      v33 = objc_msgSend(v7, "pageCount");
      v34 = vcvtmd_s64_f64(v32 * (double)v33);
      if ((int)v34 >= v33)
        v35 = (v33 - 1);
      else
        v35 = v34;
      if (v9 == 1)
      {
        if (objc_msgSend(v6, "displaysRTL"))
          v35 = (~(_DWORD)v35 + v33);
        else
          v35 = v35;
      }
      -[PDFIconsView _updateScrubberForPageIndex:goToPage:](self, "_updateScrubberForPageIndex:goToPage:", v35, 1);
    }
  }

}

- (void)_updateScrubberForPageIndex:(int)a3 goToPage:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v5;
  id WeakRetained;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  BOOL v12;
  int v13;
  double v14;
  double v15;
  double v16;
  double v17;
  int v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  PDFPageIconLayer *activeIcon;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double MidX;
  double MidY;
  double v43;
  int v44;
  int v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double x;
  double y;
  double width;
  double height;
  PDFPageIconLayer *v72;
  PDFPageIconLayer *v73;
  void *v74;
  NSMutableArray *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t i;
  void *v80;
  uint64_t v81;
  void *v82;
  double v83;
  double v84;
  PDFPageIconLayer *v85;
  _BOOL4 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _BYTE v91[128];
  uint64_t v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  v92 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
  objc_msgSend(WeakRetained, "PDFView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "document");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(WeakRetained, "layoutMode");
  v11 = objc_msgSend(v9, "pageCount");
  if (v8)
    v12 = v9 == 0;
  else
    v12 = 1;
  if (v12 || (v13 = v11, (objc_msgSend(v9, "isLocked") & 1) != 0) || v13 <= 0)
  {
    -[PDFPageIconLayer removeFromSuperlayer](self->_activeIcon, "removeFromSuperlayer");
    activeIcon = self->_activeIcon;
    self->_activeIcon = 0;
  }
  else
  {
    -[PDFIconsView _iconsLayoutSize](self, "_iconsLayoutSize");
    v15 = v14;
    v17 = v16;
    v18 = -[PDFIconsView _iconsLayoutIconCount](self, "_iconsLayoutIconCount");
    objc_msgSend(WeakRetained, "thumbnailSize");
    v21 = v20;
    v22 = 2.0;
    v84 = v17;
    if (v18 >= v13)
    {
      v83 = v19;
    }
    else
    {
      v23 = (double)v13;
      if (v10)
      {
        v83 = v19;
        v21 = (v15 + -2.0 - v21) / v23;
      }
      else
      {
        v83 = (v17 + -2.0 - v19) / v23;
      }
      v22 = 0.0;
    }
    -[PDFIconsView bounds](self, "bounds");
    v26 = v25;
    v28 = v27;
    v30 = v29;
    v32 = v31;
    objc_msgSend(WeakRetained, "contentInset");
    v34 = v26 + v33;
    v36 = v28 + v35;
    v38 = v30 - (v33 + v37);
    v40 = v32 - (v35 + v39);
    v93.origin.x = v34;
    v93.origin.y = v36;
    v93.size.width = v38;
    v93.size.height = v40;
    MidX = CGRectGetMidX(v93);
    v94.origin.x = v34;
    v94.origin.y = v36;
    v94.size.width = v38;
    v94.size.height = v40;
    MidY = CGRectGetMidY(v94);
    v43 = MidY;
    v86 = v4;
    if (v10)
    {
      v44 = objc_msgSend(v8, "displaysRTL");
      v45 = v13 + ~(_DWORD)v5;
      if (!v44)
        v45 = v5;
      v46 = MidX - v15 * 0.5 + 1.0 + (double)v45 * (v22 + v21);
      v47 = v43 - v84 * 0.5 + 1.0;
    }
    else
    {
      v46 = MidX - v15 * 0.5 + 1.0;
      v47 = MidY - v84 * 0.5 + 1.0 + (double)(int)v5 * (v22 + v83);
    }
    objc_msgSend(WeakRetained, "thumbnailSize");
    v49 = v48 * 1.333;
    v51 = v50 * 1.333;
    v52 = v46 - (v48 * 1.333 - v48) * 0.5;
    v53 = v47 - (v50 * 1.333 - v50) * 0.5;
    objc_msgSend(v9, "pageAtIndex:");
    v85 = (PDFPageIconLayer *)objc_claimAutoreleasedReturnValue();
    -[PDFPageIconLayer boundsForBox:](v85, "boundsForBox:", 1);
    v55 = v54;
    v57 = v56;
    v60 = PDFScaleRectToRect(v58, v59, v54, v56, v52, v53, v49, v51);
    v61 = v60 * v55;
    v62 = v60 * v57;
    v63 = (v49 - v60 * v55) * 0.5;
    if (v49 <= v61)
      v63 = -0.0;
    v64 = v52 + v63;
    if (v49 <= v61)
      v65 = v49;
    else
      v65 = v61;
    v66 = (v51 - v62) * 0.5;
    if (v51 <= v62)
      v66 = -0.0;
    v67 = v53 + v66;
    if (v51 <= v62)
      v62 = v51;
    v95 = CGRectIntegral(*(CGRect *)(&v62 - 3));
    x = v95.origin.x;
    y = v95.origin.y;
    width = v95.size.width;
    height = v95.size.height;
    if (!self->_activeIcon)
    {
      v72 = -[PDFPageIconLayer initWithSize:]([PDFPageIconLayer alloc], "initWithSize:", v95.size.width, v95.size.height);
      v73 = self->_activeIcon;
      self->_activeIcon = v72;

      -[PDFPageIconLayer setZPosition:](self->_activeIcon, "setZPosition:", 1.0);
      -[PDFIconsView layer](self, "layer");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "addSublayer:", self->_activeIcon);

    }
    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
    -[PDFPageIconLayer setFrame:](self->_activeIcon, "setFrame:", x, y, width, height);
    v89 = 0u;
    v90 = 0u;
    v87 = 0u;
    v88 = 0u;
    v75 = self->_icons;
    v76 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v75, "countByEnumeratingWithState:objects:count:", &v87, v91, 16);
    if (v76)
    {
      v77 = v76;
      v78 = *(_QWORD *)v88;
      while (2)
      {
        for (i = 0; i != v77; ++i)
        {
          if (*(_QWORD *)v88 != v78)
            objc_enumerationMutation(v75);
          v80 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * i);
          if (objc_msgSend(v80, "pageIndex") == (_DWORD)v5)
          {
            v81 = objc_msgSend(v80, "contents");

            if (v81)
              -[PDFPageIconLayer setContents:](self->_activeIcon, "setContents:", v81);
            goto LABEL_41;
          }
        }
        v77 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v75, "countByEnumeratingWithState:objects:count:", &v87, v91, 16);
        if (v77)
          continue;
        break;
      }
    }

LABEL_41:
    objc_msgSend(MEMORY[0x24BDE57D8], "commit");
    -[PDFPageIconLayer updateAsPageIndex:forDocument:](self->_activeIcon, "updateAsPageIndex:forDocument:", v5, v9);
    if (v86)
    {
      objc_msgSend(v9, "pageAtIndex:", (int)v5);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "goToPage:", v82);

    }
    activeIcon = v85;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeIcon, 0);
  objc_storeStrong((id *)&self->_icons, 0);
  objc_destroyWeak((id *)&self->_thumbnailView);
}

@end
