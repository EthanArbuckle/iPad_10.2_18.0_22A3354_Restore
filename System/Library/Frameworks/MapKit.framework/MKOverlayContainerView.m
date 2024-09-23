@implementation MKOverlayContainerView

- (MKOverlayContainerView)initWithFrame:(CGRect)a3
{
  MKOverlayContainerView *v3;
  uint64_t v4;
  char v5;
  char v6;
  NSMutableOrderedSet *v7;
  NSMutableOrderedSet *v8;
  NSMutableArray *v9;
  NSMutableArray *v10;
  NSMutableArray *v11;
  NSMutableArray *v12;
  uint64_t v13;
  NSMapTable *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)MKOverlayContainerView;
  v3 = -[MKOverlayContainerView initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = 0;
    v5 = 1;
    do
    {
      v6 = v5;
      v7 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
      v8 = v3->_overlays[v4];
      v3->_overlays[v4] = v7;

      v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v10 = v3->_drawables[v4];
      v3->_drawables[v4] = v9;

      v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v12 = v3->_vkOverlays[v4];
      v3->_vkOverlays[v4] = v11;

      v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 10);
      v14 = v3->_overlayToDrawable[v4];
      v3->_overlayToDrawable[v4] = (NSMapTable *)v13;

      v5 = 0;
      v4 = 1;
    }
    while ((v6 & 1) != 0);
  }
  return v3;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (id)_viewContainerForLevel:(int64_t)a3
{
  UIView **viewContainers;
  UIView *v5;
  id v7;
  uint64_t v8;
  UIView *v9;
  int64_t v10;
  NSMutableArray *v11;
  NSMutableArray *v12;

  viewContainers = self->_viewContainers;
  v5 = self->_viewContainers[a3];
  if (!v5)
  {
    v7 = objc_alloc(MEMORY[0x1E0CEABB0]);
    -[MKOverlayContainerView bounds](self, "bounds");
    v8 = objc_msgSend(v7, "initWithFrame:");
    v9 = viewContainers[a3];
    viewContainers[a3] = (UIView *)v8;

    if (a3 < 1)
    {
LABEL_9:
      -[MKOverlayContainerView insertSubview:atIndex:](self, "insertSubview:atIndex:", viewContainers[a3], 0);
    }
    else
    {
      v10 = a3;
      while (v10 >= 1)
      {
        v11 = self->_vkOverlays[v10-- + 1];
        if (v11)
        {
          v12 = v11;
          goto LABEL_8;
        }
      }
      v12 = *(viewContainers - 1);
      if (!v12)
        goto LABEL_9;
LABEL_8:
      -[MKOverlayContainerView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", viewContainers[a3], v12);

    }
    v5 = viewContainers[a3];
  }
  return v5;
}

- (int64_t)_drawableIndexForDrawable:(id)a3 level:(int64_t)a4
{
  void *v6;
  NSMutableOrderedSet *v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;
  id *v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "overlay");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = self->_overlays[a4];
  v8 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v17;
    v12 = (id *)(&self->super.super.super.isa + a4);
LABEL_3:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v11)
        objc_enumerationMutation(v7);
      if (*(void **)(*((_QWORD *)&v16 + 1) + 8 * v13) == v6)
        break;
      objc_msgSend(v12[55], "objectForKey:", (_QWORD)v16);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
        ++v10;
      if (v9 == ++v13)
      {
        v9 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v9)
          goto LABEL_3;
        break;
      }
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- ($FD2884BA735A6398BD92EEF91FE53E55)_mapRectWithFractionOfVisible:(double)a3
{
  id WeakRetained;
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
  double v19;
  double v20;
  double v21;
  double v22[5];
  MKMapRect v23;

  v22[4] = *(double *)MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "overlayContainerVisibleMapRect:", self);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  if (v7 + v11 > 268435456.0)
  {
    v22[0] = v7 + v11 + -268435456.0;
    v22[1] = v9 + v13;
    v22[2] = v7;
    v22[3] = v9;
    v7 = MKMapRectBoundingMapPoints((uint64_t)v22, 2);
    v9 = v14;
    v11 = v15;
    v13 = v16;
  }
  v17 = INFINITY;
  if (v7 == INFINITY && v9 == INFINITY)
  {
    v19 = INFINITY;
  }
  else
  {
    v19 = v7 - v11 * a3;
    v17 = v9 - v13 * a3;
    v11 = v11 - -(v11 * a3) * 2.0;
    v13 = v13 - -(v13 * a3) * 2.0;
  }
  v23.size.width = 268435456.0;
  v23.origin.x = 0.0;
  v23.origin.y = 0.0;
  v23.size.height = 268435456.0;
  v20 = v11;
  v21 = v13;
  return ($FD2884BA735A6398BD92EEF91FE53E55)MKMapRectIntersection(v23, *(MKMapRect *)(&v17 - 1));
}

- (void)_configureAndAddDrawable:(id)a3 forOverlay:(id)a4 level:(int64_t)a5
{
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  id v19;

  v8 = a4;
  v19 = a3;
  objc_msgSend(v8, "boundingMapRect");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  objc_msgSend(v19, "set_boundingMapRect:");
  objc_msgSend(v19, "_mk_overlayLayer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setPosition:", v10 + v14 * 0.5, v12 + v16 * 0.5);

  objc_msgSend(v19, "_mk_overlayLayer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setBounds:", 0.0, 0.0, v14, v16);

  -[MKOverlayContainerView _insertDrawable:forOverlay:atIndex:level:](self, "_insertDrawable:forOverlay:atIndex:level:", v19, v8, -[MKOverlayContainerView _drawableIndexForDrawable:level:](self, "_drawableIndexForDrawable:level:", v19, a5), a5);
}

- (id)_considerAddingDrawable:(id)a3 inAddRect:(id)a4 level:(int64_t)a5
{
  double var1;
  double var0;
  double v8;
  double v9;
  id v11;
  void *v12;
  void *v13;
  id v15;
  char v16;
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
  id WeakRetained;
  void *v28;

  var1 = a4.var1.var1;
  var0 = a4.var1.var0;
  v8 = a4.var0.var1;
  v9 = a4.var0.var0;
  v11 = a3;
  -[MKOverlayContainerView _updateShowsAppleLogoIfNeeded](self, "_updateShowsAppleLogoIfNeeded");
  -[MKOverlayContainerView _flexTerrainIfNeeded](self, "_flexTerrainIfNeeded");
  -[NSMapTable objectForKey:](self->_overlayToDrawable[a5], "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    goto LABEL_2;
  v15 = v11;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v16 = objc_msgSend(v15, "intersectsMapRect:", v9, v8, var0, var1);

    if ((v16 & 1) != 0)
      goto LABEL_8;
LABEL_2:
    v13 = 0;
    goto LABEL_3;
  }
  objc_msgSend(v15, "boundingMapRect");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;

  if (!MKMapRectIntersectsMapRectWrappingMeridian(v18, v20, v22, v24, v9, v8, var0, var1))
    goto LABEL_2;
LABEL_8:
  -[NSMapTable objectForKey:](self->_internalOverlayToProvider, "objectForKey:", v15);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v25)
    WeakRetained = v25;
  else
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v28 = WeakRetained;

  objc_msgSend(v28, "createDrawableForOverlay:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    -[MKOverlayContainerView _configureAndAddDrawable:forOverlay:level:](self, "_configureAndAddDrawable:forOverlay:level:", v13, v15, a5);

LABEL_3:
  return v13;
}

- (void)addAndRemoveOverlayViews
{
  MKOverlayContainerView *v2;
  double v3;
  double v4;
  double v5;
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
  uint64_t v19;
  char v20;
  unint64_t v21;
  NSMutableOrderedSet *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id *v27;
  uint64_t i;
  void *v29;
  uint64_t v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  id v41;
  NSMutableOrderedSet *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  id WeakRetained;
  NSMutableArray **drawables;
  NSMutableOrderedSet **overlays;
  char v57;
  id v58;
  id *p_isa;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v2 = self;
  v70 = *MEMORY[0x1E0C80C00];
  -[MKOverlayContainerView _mapRectWithFractionOfVisible:](self, "_mapRectWithFractionOfVisible:", 3.0);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[MKOverlayContainerView _mapRectWithFractionOfVisible:](v2, "_mapRectWithFractionOfVisible:", 5.0);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v58 = 0;
  p_isa = (id *)&v2->super.super.super.isa;
  v19 = 0;
  drawables = v2->_drawables;
  v20 = 1;
  do
  {
    v57 = v20;
    v21 = -[NSMutableArray count](drawables[v19], "count");
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    overlays = v2->_overlays;
    v22 = v2->_overlays[v19];
    v23 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v64, v69, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v65;
      v26 = v19;
      v27 = (id *)(&v2->super.super.super.isa + v19);
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v65 != v25)
            objc_enumerationMutation(v22);
          v29 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
          objc_msgSend(v27[55], "objectForKey:", v29);
          v30 = objc_claimAutoreleasedReturnValue();
          v31 = (void *)v30;
          if (v30 && v21 >= 0x65)
          {
            objc_msgSend(v29, "boundingMapRect");
            if (!MKMapRectIntersectsMapRectWrappingMeridian(v32, v33, v34, v35, v12, v14, v16, v18))
            {
              objc_msgSend(p_isa, "_removeDrawable:forOverlay:level:", v31, v29, v26);
              --v21;
            }
          }
          else if (!v30)
          {
            objc_msgSend(v29, "boundingMapRect");
            if (MKMapRectIntersectsMapRectWrappingMeridian(v36, v37, v38, v39, v4, v6, v8, v10))
            {
              objc_msgSend(p_isa, "_considerAddingDrawable:inAddRect:level:", v29, v26, v4, v6, v8, v10);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              if (v40)
              {
                v41 = v58;
                if (!v58)
                  v41 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                v58 = v41;
                objc_msgSend(v41, "addObject:", v40);
                ++v21;
              }

            }
          }

        }
        v24 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v64, v69, 16);
      }
      while (v24);
    }
    else
    {
      v26 = v19;
    }

    if (v21 >= 0x65)
    {
      v62 = 0u;
      v63 = 0u;
      v60 = 0u;
      v61 = 0u;
      v42 = overlays[v26];
      v43 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
      if (v43)
      {
        v44 = v43;
        v45 = *(_QWORD *)v61;
LABEL_25:
        v46 = 0;
        while (1)
        {
          if (*(_QWORD *)v61 != v45)
            objc_enumerationMutation(v42);
          if (v21 < 0x65)
            break;
          v47 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v46);
          objc_msgSend(p_isa[v26 + 55], "objectForKey:", v47);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          if (v48)
          {
            objc_msgSend(v47, "boundingMapRect");
            if (!MKMapRectIntersectsMapRectWrappingMeridian(v49, v50, v51, v52, v12, v14, v16, v18))
            {
              objc_msgSend(p_isa, "_removeDrawable:forOverlay:level:", v48, v47, v26);
              --v21;
            }
          }

          if (v44 == ++v46)
          {
            v44 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
            if (v44)
              goto LABEL_25;
            break;
          }
        }
      }

    }
    v20 = 0;
    v19 = 1;
    v2 = (MKOverlayContainerView *)p_isa;
  }
  while ((v57 & 1) != 0);
  v53 = v58;
  if (v58)
  {
    WeakRetained = objc_loadWeakRetained(p_isa + 63);
    objc_msgSend(WeakRetained, "overlayContainerAddedDrawables:", v58);

    v53 = v58;
  }

}

- (void)addOverlay:(id)a3 level:(int64_t)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  id v9;

  v6 = a3;
  checkLevel(a4);
  -[MKOverlayContainerView removeOverlay:](self, "removeOverlay:", v6);
  -[NSMutableOrderedSet addObject:](self->_overlays[a4], "addObject:", v6);
  -[MKOverlayContainerView _mapRectWithFractionOfVisible:](self, "_mapRectWithFractionOfVisible:", 3.0);
  -[MKOverlayContainerView _considerAddingDrawable:inAddRect:level:](self, "_considerAddingDrawable:inAddRect:level:", v6, a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "overlayContainerAddedDrawables:", v8);

  }
}

- (void)addInternalOverlay:(id)a3 level:(int64_t)a4 provider:(id)a5
{
  id v8;
  NSMapTable *internalOverlayToProvider;
  NSMapTable *v10;
  NSMapTable *v11;
  void *v12;
  id WeakRetained;
  void *v14;
  id v15;

  v15 = a3;
  v8 = a5;
  checkLevel(a4);
  -[MKOverlayContainerView removeOverlay:](self, "removeOverlay:", v15);
  -[NSMutableOrderedSet addObject:](self->_overlays[a4], "addObject:", v15);
  internalOverlayToProvider = self->_internalOverlayToProvider;
  if (!internalOverlayToProvider)
  {
    v10 = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 10);
    v11 = self->_internalOverlayToProvider;
    self->_internalOverlayToProvider = v10;

    internalOverlayToProvider = self->_internalOverlayToProvider;
  }
  -[NSMapTable setObject:forKey:](internalOverlayToProvider, "setObject:forKey:", v8, v15);
  -[MKOverlayContainerView _mapRectWithFractionOfVisible:](self, "_mapRectWithFractionOfVisible:", 3.0);
  -[MKOverlayContainerView _considerAddingDrawable:inAddRect:level:](self, "_considerAddingDrawable:inAddRect:level:", v15, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "overlayContainerAddedDrawables:", v14);

  }
}

- (void)addOverlays:(id)a3 level:(int64_t)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  id WeakRetained;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  checkLevel(a4);
  -[MKOverlayContainerView _mapRectWithFractionOfVisible:](self, "_mapRectWithFractionOfVisible:", 3.0);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v15 = v6;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  v17 = v15;
  if (!v16)
    goto LABEL_14;
  v18 = v16;
  v17 = 0;
  v19 = *(_QWORD *)v25;
  do
  {
    for (i = 0; i != v18; ++i)
    {
      if (*(_QWORD *)v25 != v19)
        objc_enumerationMutation(v15);
      v21 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
      -[MKOverlayContainerView removeOverlay:](self, "removeOverlay:", v21, (_QWORD)v24);
      -[NSMutableOrderedSet addObject:](self->_overlays[a4], "addObject:", v21);
      -[MKOverlayContainerView _considerAddingDrawable:inAddRect:level:](self, "_considerAddingDrawable:inAddRect:level:", v21, a4, v8, v10, v12, v14);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        if (!v17)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v17, "addObject:", v22);
      }

    }
    v18 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  }
  while (v18);

  if (v17)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "overlayContainerAddedDrawables:", v17);

LABEL_14:
  }

}

+ (int64_t)_defaultOverlayLevel
{
  if (qword_1EDFB7A18 != -1)
    dispatch_once(&qword_1EDFB7A18, &__block_literal_global_26);
  return ~_MergedGlobals_13 & 1;
}

BOOL __46__MKOverlayContainerView__defaultOverlayLevel__block_invoke()
{
  _BOOL8 result;

  result = _MKLinkedOnOrAfterReleaseSet(3338);
  if (result)
    _MergedGlobals_13 = 1;
  return result;
}

- (void)addOverlay:(id)a3
{
  id v4;

  v4 = a3;
  -[MKOverlayContainerView addOverlay:level:](self, "addOverlay:level:", v4, objc_msgSend((id)objc_opt_class(), "_defaultOverlayLevel"));

}

- (void)addOverlays:(id)a3
{
  id v4;

  v4 = a3;
  -[MKOverlayContainerView addOverlays:level:](self, "addOverlays:level:", v4, objc_msgSend((id)objc_opt_class(), "_defaultOverlayLevel"));

}

- (int64_t)_levelForOverlay:(id)a3 exists:(BOOL *)a4
{
  int64_t v6;
  NSMutableOrderedSet **overlays;
  char i;
  char v9;

  v6 = 0;
  overlays = self->_overlays;
  for (i = 1; ; i = 0)
  {
    v9 = i;
    if ((-[NSMutableOrderedSet containsObject:](overlays[v6], "containsObject:", a3) & 1) != 0)
      break;
    v6 = 1;
    if ((v9 & 1) == 0)
    {
      *a4 = 0;
      return objc_msgSend((id)objc_opt_class(), "_defaultOverlayLevel");
    }
  }
  *a4 = 1;
  return v6;
}

- (void)removeOverlay:(id)a3
{
  id v4;
  int64_t v5;
  int64_t v6;
  void *v7;
  char v8;

  v4 = a3;
  if (v4)
  {
    v8 = 0;
    v5 = -[MKOverlayContainerView _levelForOverlay:exists:](self, "_levelForOverlay:exists:", v4, &v8);
    if (v8)
    {
      v6 = v5;
      -[NSMapTable objectForKey:](self->_overlayToDrawable[v5], "objectForKey:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
        -[MKOverlayContainerView _removeDrawable:forOverlay:level:](self, "_removeDrawable:forOverlay:level:", v7, v4, v6);
      -[NSMutableOrderedSet removeObject:](self->_overlays[v6], "removeObject:", v4);
      -[NSMapTable removeObjectForKey:](self->_internalOverlayToProvider, "removeObjectForKey:", v4);
      -[MKOverlayContainerView _updateShowsAppleLogoIfNeeded](self, "_updateShowsAppleLogoIfNeeded");
      -[MKOverlayContainerView _unFlexTerrainIfNeeded](self, "_unFlexTerrainIfNeeded");

    }
  }

}

- (void)removeOverlays:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[MKOverlayContainerView removeOverlay:](self, "removeOverlay:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)insertOverlay:(id)a3 atIndex:(unint64_t)a4 level:(int64_t)a5
{
  unint64_t v8;
  NSMutableOrderedSet *v9;
  void *v10;
  id WeakRetained;
  void *v12;
  id v13;

  v13 = a3;
  -[MKOverlayContainerView removeOverlay:](self, "removeOverlay:");
  v8 = -[NSMutableOrderedSet count](self->_overlays[a5], "count");
  v9 = self->_overlays[a5];
  if (v8 <= a4)
    -[NSMutableOrderedSet addObject:](v9, "addObject:", v13);
  else
    -[NSMutableOrderedSet insertObject:atIndex:](v9, "insertObject:atIndex:", v13, a4);
  -[MKOverlayContainerView _mapRectWithFractionOfVisible:](self, "_mapRectWithFractionOfVisible:", 3.0);
  -[MKOverlayContainerView _considerAddingDrawable:inAddRect:level:](self, "_considerAddingDrawable:inAddRect:level:", v13, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "overlayContainerAddedDrawables:", v12);

  }
}

- (void)insertOverlay:(id)a3 atIndex:(unint64_t)a4
{
  id v6;

  v6 = a3;
  -[MKOverlayContainerView insertOverlay:atIndex:level:](self, "insertOverlay:atIndex:level:", v6, a4, objc_msgSend((id)objc_opt_class(), "_defaultOverlayLevel"));

}

- (void)_exchangeOverlayAtIndex:(unint64_t)a3 withOverlayAtIndex:(unint64_t)a4 level:(int64_t)a5
{
  unint64_t v7;
  unint64_t v8;
  NSMutableOrderedSet **overlays;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  if (a3 != a4)
  {
    if (a3 <= a4)
      v7 = a4;
    else
      v7 = a3;
    if (a3 >= a4)
      v8 = a4;
    else
      v8 = a3;
    overlays = self->_overlays;
    -[NSMutableOrderedSet objectAtIndex:](self->_overlays[a5], "objectAtIndex:", v8);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableOrderedSet objectAtIndex:](overlays[a5], "objectAtIndex:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable objectForKey:](self->_overlayToDrawable[a5], "objectForKey:", v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable objectForKey:](self->_overlayToDrawable[a5], "objectForKey:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableOrderedSet exchangeObjectAtIndex:withObjectAtIndex:](overlays[a5], "exchangeObjectAtIndex:withObjectAtIndex:", v8, v7);
    if (v11)
      -[MKOverlayContainerView _removeDrawable:forOverlay:level:](self, "_removeDrawable:forOverlay:level:", v11, v13, a5);
    if (v12)
      -[MKOverlayContainerView _removeDrawable:forOverlay:level:](self, "_removeDrawable:forOverlay:level:", v12, v10, a5);
    if (v11)
      -[MKOverlayContainerView _insertDrawable:forOverlay:atIndex:level:](self, "_insertDrawable:forOverlay:atIndex:level:", v11, v13, -[MKOverlayContainerView _drawableIndexForDrawable:level:](self, "_drawableIndexForDrawable:level:", v11, a5), a5);
    if (v12)
      -[MKOverlayContainerView _insertDrawable:forOverlay:atIndex:level:](self, "_insertDrawable:forOverlay:atIndex:level:", v12, v10, -[MKOverlayContainerView _drawableIndexForDrawable:level:](self, "_drawableIndexForDrawable:level:", v12, a5), a5);

  }
}

- (void)exchangeOverlayAtIndex:(unint64_t)a3 withOverlayAtIndex:(unint64_t)a4
{
  -[MKOverlayContainerView _exchangeOverlayAtIndex:withOverlayAtIndex:level:](self, "_exchangeOverlayAtIndex:withOverlayAtIndex:level:", a3, a4, objc_msgSend((id)objc_opt_class(), "_defaultOverlayLevel"));
}

- (void)exchangeOverlay:(id)a3 withOverlay:(id)a4
{
  id v6;
  id v7;
  int64_t v8;
  int64_t v9;
  BOOL v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int16 v14;

  v6 = a3;
  v7 = a4;
  v14 = 0;
  v8 = -[MKOverlayContainerView _levelForOverlay:exists:](self, "_levelForOverlay:exists:", v6, (char *)&v14 + 1);
  v9 = -[MKOverlayContainerView _levelForOverlay:exists:](self, "_levelForOverlay:exists:", v7, &v14);
  if (HIBYTE(v14))
    v10 = v14 == 0;
  else
    v10 = 1;
  if (!v10)
  {
    v11 = v9;
    v12 = -[NSMutableOrderedSet indexOfObject:](self->_overlays[v8], "indexOfObject:", v6);
    v13 = -[NSMutableOrderedSet indexOfObject:](self->_overlays[v11], "indexOfObject:", v7);
    if (v8 == v11)
    {
      -[MKOverlayContainerView _exchangeOverlayAtIndex:withOverlayAtIndex:level:](self, "_exchangeOverlayAtIndex:withOverlayAtIndex:level:", v12, v13, v8);
    }
    else
    {
      -[MKOverlayContainerView insertOverlay:atIndex:level:](self, "insertOverlay:atIndex:level:", v7, v12, v8);
      -[MKOverlayContainerView insertOverlay:atIndex:level:](self, "insertOverlay:atIndex:level:", v6, v13, v11);
    }
  }

}

- (void)insertOverlay:(id)a3 aboveOverlay:(id)a4
{
  id v6;
  id v7;
  int64_t v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v9 = 0;
  v8 = -[MKOverlayContainerView _levelForOverlay:exists:](self, "_levelForOverlay:exists:", v7, &v9);
  if (v9)
    -[MKOverlayContainerView insertOverlay:atIndex:level:](self, "insertOverlay:atIndex:level:", v6, -[NSMutableOrderedSet indexOfObject:](self->_overlays[v8], "indexOfObject:", v7) + 1, v8);
  else
    -[MKOverlayContainerView addOverlay:](self, "addOverlay:", v6);

}

- (void)insertOverlay:(id)a3 belowOverlay:(id)a4
{
  id v6;
  id v7;
  int64_t v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v9 = 0;
  v8 = -[MKOverlayContainerView _levelForOverlay:exists:](self, "_levelForOverlay:exists:", v7, &v9);
  if (v9)
    -[MKOverlayContainerView insertOverlay:atIndex:level:](self, "insertOverlay:atIndex:level:", v6, -[NSMutableOrderedSet indexOfObject:](self->_overlays[v8], "indexOfObject:", v7), v8);
  else
    -[MKOverlayContainerView addOverlay:](self, "addOverlay:", v6);

}

- (unint64_t)_overlayCount
{
  uint64_t v2;
  unint64_t v3;
  NSMutableOrderedSet **overlays;
  char v5;
  char v6;
  uint64_t v7;

  v2 = 0;
  v3 = 0;
  overlays = self->_overlays;
  v5 = 1;
  do
  {
    v6 = v5;
    v7 = -[NSMutableOrderedSet count](overlays[v2], "count");
    v5 = 0;
    v3 += v7;
    v2 = 1;
  }
  while ((v6 & 1) != 0);
  return v3;
}

- (NSArray)overlays
{
  void *v3;
  NSMutableOrderedSet **overlays;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[MKOverlayContainerView _overlayCount](self, "_overlayCount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  overlays = self->_overlays;
  -[NSMutableOrderedSet array](self->_overlays[0], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v5);

  -[NSMutableOrderedSet array](overlays[1], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v6);

  return (NSArray *)v3;
}

- (id)overlaysInLevel:(int64_t)a3
{
  void *v5;
  void *v6;

  checkLevel(a3);
  -[NSMutableOrderedSet array](self->_overlays[a3], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  return v6;
}

- (id)drawableForOverlay:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  char v8;

  v4 = a3;
  v8 = 0;
  v5 = -[MKOverlayContainerView _levelForOverlay:exists:](self, "_levelForOverlay:exists:", v4, &v8);
  if (v8)
  {
    -[NSMapTable objectForKey:](self->_overlayToDrawable[v5], "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSArray)allDrawables
{
  void *v3;
  NSMapTable **overlayToDrawable;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  overlayToDrawable = self->_overlayToDrawable;
  -[NSMapTable objectEnumerator](self->_overlayToDrawable[0], "objectEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMapTable objectEnumerator](overlayToDrawable[1], "objectEnumerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(v3, "addObjectsFromArray:", v6);
  if (v8)
    objc_msgSend(v3, "addObjectsFromArray:", v8);

  return (NSArray *)v3;
}

- (void)_removeDrawable:(id)a3 forOverlay:(id)a4 level:(int64_t)a5
{
  id v8;
  id v9;
  NSMutableArray **vkOverlays;
  NSMutableArray *v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  id v16;
  id WeakRetained;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  vkOverlays = self->_vkOverlays;
  v11 = self->_vkOverlays[a5];
  v12 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v15, "delegate");
        v16 = (id)objc_claimAutoreleasedReturnValue();

        if (v16 == v8)
        {
          v12 = v15;
          goto LABEL_11;
        }
      }
      v12 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v12)
        continue;
      break;
    }
LABEL_11:
    vkOverlays = self->_vkOverlays;
  }

  objc_msgSend(v8, "_setMapView:", 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "vk_mapLayer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "removeOverlay:", v12);

  objc_msgSend(v12, "setDelegate:", 0);
  objc_msgSend(v8, "_mk_overlayView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "removeFromSuperview");

  -[NSMapTable removeObjectForKey:](self->_overlayToDrawable[a5], "removeObjectForKey:", v9);
  -[NSMutableArray removeObjectIdenticalTo:](self->_drawables[a5], "removeObjectIdenticalTo:", v8);
  if (v12)
    -[NSMutableArray removeObjectIdenticalTo:](vkOverlays[a5], "removeObjectIdenticalTo:", v12);

}

- (void)_updateContentScale:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  BOOL v14;
  double v15;
  id v16;

  v16 = a3;
  -[MKOverlayContainerView window](self, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "screen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  objc_msgSend(v8, "scale");
  v10 = v9;
  objc_msgSend(v8, "nativeScale");
  v12 = v11;
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "_isClassic") & 1) != 0)
  {

LABEL_10:
    v10 = fmin(v10, 2.0);
    v15 = v10;
    goto LABEL_11;
  }
  v14 = _MKLinkedOnOrAfterReleaseSet(769);

  if (!v14)
    goto LABEL_10;
  if (_MKLinkedOnOrAfterReleaseSet(1540))
    v15 = v12;
  else
    v15 = v10;
LABEL_11:
  objc_msgSend(v16, "setContentScaleFactor:", v15 * (v15 / v10));

}

- (void)_insertDrawable:(id)a3 forOverlay:(id)a4 atIndex:(int64_t)a5 level:(int64_t)a6
{
  NSMapTable *v10;
  id v11;
  id WeakRetained;
  void *v13;
  void *v14;
  void *v15;
  NSMutableArray **drawables;
  unint64_t v17;
  NSMutableArray *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v26 = a3;
  v10 = self->_overlayToDrawable[a6];
  v11 = a4;
  -[NSMapTable setObject:forKey:](v10, "setObject:forKey:", v26, v11);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "vk_mapLayer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC6530], "overlayWithDrawable:forOverlay:atLevel:", v26, v11, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[MKOverlayContainerView mapView](self, "mapView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "_setMapView:", v15);

  -[MKOverlayContainerView _updateContentScale:](self, "_updateContentScale:", v26);
  drawables = self->_drawables;
  v17 = -[NSMutableArray count](self->_drawables[a6], "count");
  v18 = self->_drawables[a6];
  if (v17 <= a5)
  {
    -[NSMutableArray addObject:](v18, "addObject:", v26);
    -[NSMutableArray addObject:](self->_vkOverlays[a6], "addObject:", v14);
    if (a5)
      goto LABEL_3;
  }
  else
  {
    -[NSMutableArray insertObject:atIndex:](v18, "insertObject:atIndex:", v26, a5);
    -[NSMutableArray insertObject:atIndex:](self->_vkOverlays[a6], "insertObject:atIndex:", v14, a5);
    if (a5)
    {
LABEL_3:
      -[NSMutableArray objectAtIndex:](drawables[a6], "objectAtIndex:", a5 - 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  v19 = 0;
LABEL_6:
  v20 = a5 + 1;
  if (a5 + 1 >= (unint64_t)-[NSMutableArray count](drawables[a6], "count"))
  {
    v21 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndex:](drawables[a6], "objectAtIndex:", a5 + 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (a5)
  {
    -[NSMutableArray objectAtIndex:](self->_vkOverlays[a6], "objectAtIndex:", a5 - 1);
    a5 = objc_claimAutoreleasedReturnValue();
  }
  if (v20 >= -[NSMutableArray count](self->_vkOverlays[a6], "count"))
  {
    v22 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->_vkOverlays[a6], "objectAtIndex:", v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v26, "_mk_overlayView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    -[MKOverlayContainerView _viewContainerForLevel:](self, "_viewContainerForLevel:", a6);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
LABEL_16:
      objc_msgSend(v19, "_mk_overlayView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
        objc_msgSend(v24, "insertSubview:aboveSubview:", v23, v25);
      objc_msgSend(v13, "insertOverlay:aboveOverlay:", v14, a5);
LABEL_24:

      goto LABEL_25;
    }
  }
  else
  {
    v24 = 0;
    if (v19)
      goto LABEL_16;
  }
  if (v21)
  {
    objc_msgSend(v21, "_mk_overlayView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
      objc_msgSend(v24, "insertSubview:belowSubview:", v23, v25);
    objc_msgSend(v13, "insertOverlay:belowOverlay:", v14, v22);
    goto LABEL_24;
  }
  if (v23)
    objc_msgSend(v24, "addSubview:", v23);
  objc_msgSend(v13, "addOverlay:", v14);
LABEL_25:

}

- (void)didMoveToWindow
{
  uint64_t v3;
  char v4;
  char v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)MKOverlayContainerView;
  -[MKOverlayContainerView didMoveToWindow](&v15, sel_didMoveToWindow);
  v3 = 0;
  v4 = 1;
  do
  {
    v5 = v4;
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = self->_drawables[v3];
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          -[MKOverlayContainerView _updateContentScale:](self, "_updateContentScale:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i));
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
      }
      while (v8);
    }

    v4 = 0;
    v3 = 1;
  }
  while ((v5 & 1) != 0);
}

- (BOOL)supportsElevation
{
  _BOOL4 v3;
  void *v4;
  BOOL v5;

  v3 = _MKLinkedOnOrAfterReleaseSet(3338);
  if (v3)
  {
    -[MKOverlayContainerView _allOverlays](self, "_allOverlays");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = +[MKStandardMapConfiguration _overlaysSupportElevation:](MKStandardMapConfiguration, "_overlaysSupportElevation:", v4);

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)requiresModernMap
{
  void *v2;
  BOOL v3;

  -[MKOverlayContainerView _allOverlays](self, "_allOverlays");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[MKStandardMapConfiguration _overlaysRequireModernMap:](MKStandardMapConfiguration, "_overlaysRequireModernMap:", v2);

  return v3;
}

- (void)_flexTerrainIfNeeded
{
  id v2;

  -[MKOverlayContainerView mapView](self, "mapView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_updateCartographicConfiguration");

}

- (void)_unFlexTerrainIfNeeded
{
  id v2;

  -[MKOverlayContainerView mapView](self, "mapView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_updateCartographicConfiguration");

}

- (void)_updateShowsAppleLogoIfNeeded
{
  uint64_t v3;
  id WeakRetained;

  v3 = -[MKOverlayContainerView _overlaySpansGlobeAndReplacesMapContent](self, "_overlaySpansGlobeAndReplacesMapContent") ^ 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);
  objc_msgSend(WeakRetained, "_setShowsAppleLogo:", v3);

}

- (BOOL)_overlaySpansGlobeAndReplacesMapContent
{
  uint64_t v2;
  NSMutableOrderedSet **overlays;
  char v4;
  __int128 v5;
  NSMutableOrderedSet **v6;
  NSMutableOrderedSet *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  BOOL v17;
  double v18;
  BOOL v19;
  BOOL result;
  char v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v2 = 0;
  v27 = *MEMORY[0x1E0C80C00];
  overlays = self->_overlays;
  v4 = 1;
  v5 = 0uLL;
  do
  {
    v21 = v4;
    v24 = v5;
    v25 = v5;
    v22 = v5;
    v23 = v5;
    v6 = overlays;
    v7 = overlays[v2];
    v8 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v23;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v23 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v12, "boundingMapRect");
            v17 = v14 == INFINITY && v13 == INFINITY;
            if (v13 <= 0.0 && !v17 && v13 + v15 >= 268435456.0)
            {
              v18 = v14 + v16;
              v19 = v14 > 0.0 || v18 < 268435456.0;
              if (!v19 && (objc_msgSend(v12, "canReplaceMapContent", v18) & 1) != 0)
              {

                return 1;
              }
            }
          }
        }
        v9 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v9)
          continue;
        break;
      }
    }

    v4 = 0;
    result = 0;
    v2 = 1;
    overlays = v6;
    v5 = 0uLL;
  }
  while ((v21 & 1) != 0);
  return result;
}

- (id)_allOverlays
{
  void *v3;
  NSMutableOrderedSet **overlays;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  overlays = self->_overlays;
  -[NSMutableOrderedSet array](self->_overlays[0], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v5);

  -[NSMutableOrderedSet array](overlays[1], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v6);

  return v3;
}

- (MKOverlayContainerViewDelegate)delegate
{
  return (MKOverlayContainerViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (double)mapZoomScale
{
  return self->_mapZoomScale;
}

- (void)setMapZoomScale:(double)a3
{
  self->_mapZoomScale = a3;
}

- (MKMapView)mapView
{
  return (MKMapView *)objc_loadWeakRetained((id *)&self->_mapView);
}

- (void)setMapView:(id)a3
{
  objc_storeWeak((id *)&self->_mapView, a3);
}

- (void).cxx_destruct
{
  uint64_t i;
  uint64_t j;
  uint64_t k;
  uint64_t m;
  NSMutableOrderedSet **overlays;
  uint64_t n;

  objc_destroyWeak((id *)&self->_mapView);
  objc_destroyWeak((id *)&self->_delegate);
  for (i = 1; i != -1; --i)
    objc_storeStrong((id *)&self->_viewContainers[i], 0);
  for (j = 1; j != -1; --j)
    objc_storeStrong((id *)&self->_vkOverlays[j], 0);
  for (k = 1; k != -1; --k)
    objc_storeStrong((id *)&self->_drawables[k], 0);
  for (m = 1; m != -1; --m)
    objc_storeStrong((id *)&self->_overlayToDrawable[m], 0);
  objc_storeStrong((id *)&self->_internalOverlayToProvider, 0);
  overlays = self->_overlays;
  for (n = 1; n != -1; --n)
    objc_storeStrong((id *)&overlays[n], 0);
}

@end
