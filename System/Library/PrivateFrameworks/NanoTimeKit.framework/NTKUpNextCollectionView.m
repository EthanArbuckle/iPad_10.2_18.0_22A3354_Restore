@implementation NTKUpNextCollectionView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  NTKUpNextCollectionView *v8;
  NTKUpNextCollectionView *v9;
  BOOL v10;
  NTKUpNextCollectionView *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  double v24;
  double v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  NTKUpNextCollectionView *v30;
  id v32;
  double v33;
  double v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  objc_super v39;
  _BYTE v40[128];
  uint64_t v41;
  CGRect v42;
  CGRect v43;

  y = a3.y;
  x = a3.x;
  v41 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v39.receiver = self;
  v39.super_class = (Class)NTKUpNextCollectionView;
  -[NTKUpNextCollectionView hitTest:withEvent:](&v39, sel_hitTest_withEvent_, v7, x, y);
  v8 = (NTKUpNextCollectionView *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = v8 == self || v8 == 0;
  if (v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v11 = v9;
  }
  else
  {
    v32 = v7;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    -[NTKUpNextCollectionView collectionViewLayout](self, "collectionViewLayout");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "layoutAttributesForElementsInRect:", x, y, 1.0, 1.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v14)
    {
      v15 = v14;
      v16 = 0;
      v17 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v36 != v17)
            objc_enumerationMutation(v13);
          v19 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v19, "computedFrame");
            v43.origin.x = v20;
            v43.origin.y = v21;
            v43.size.width = v22;
            v43.size.height = v23;
            v42.size.width = 1.0;
            v42.size.height = 1.0;
            v42.origin.x = x;
            v42.origin.y = y;
            if (CGRectIntersectsRect(v42, v43))
            {
              objc_msgSend(v19, "alpha");
              if (fabs(v24) >= 0.00000011920929 && !objc_msgSend(v19, "representedElementCategory"))
              {
                if (!v16
                  || (!v19 ? (v34 = 0.0, v25 = 0.0) : (objc_msgSend(v19, "transform3D"), v25 = v34),
                      objc_msgSend(v16, "transform3D"),
                      v25 > v33))
                {
                  v26 = v19;

                  v16 = v26;
                }
              }
            }
          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      }
      while (v15);
    }
    else
    {
      v16 = 0;
    }

    objc_msgSend(v16, "indexPath");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKUpNextCollectionView cellForItemAtIndexPath:](self, "cellForItemAtIndexPath:", v27);
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = (void *)v28;
    if (v28)
      v30 = (NTKUpNextCollectionView *)v28;
    else
      v30 = self;
    v11 = v30;

    v7 = v32;
  }

  return v11;
}

@end
