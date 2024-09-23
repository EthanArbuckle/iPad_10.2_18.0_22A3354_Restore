@implementation CALayer

- (id)mp_deepCopyLayer
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *j;
  uint64_t v28;
  void *v29;
  id v30;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];

  v3 = objc_msgSend(objc_alloc((Class)objc_opt_class(self, a2)), "initWithLayer:", self);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CALayer sublayers](self, "sublayers"));
    v5 = v4;
    if (v4)
    {
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
      if (v6)
      {
        v7 = v6;
        v8 = 0;
        v9 = *(_QWORD *)v43;
        do
        {
          v10 = 0;
          v11 = v8;
          do
          {
            if (*(_QWORD *)v43 != v9)
              objc_enumerationMutation(v5);
            v8 = *(id *)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)v10);

            v12 = objc_msgSend(v8, "mp_deepCopyLayer");
            if (v12)
              objc_msgSend(v3, "addSublayer:", v12);

            v10 = (char *)v10 + 1;
            v11 = v8;
          }
          while (v7 != v10);
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
        }
        while (v7);

      }
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CALayer mask](self, "mask"));
    v14 = v13;
    if (v13)
    {
      v15 = objc_msgSend(v13, "mp_deepCopyLayer");
      if (v15)
        objc_msgSend(v3, "setMask:", v15);

    }
    v33 = v5;
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CALayer mp_propertiesToCopy](self, "mp_propertiesToCopy", v14));
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(_QWORD *)v39 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i);
          if ((objc_msgSend(v21, "isEqualToString:", CFSTR("sublayers")) & 1) == 0
            && (objc_msgSend(v21, "isEqualToString:", CFSTR("mask")) & 1) == 0
            && -[CALayer shouldArchiveValueForKey:](self, "shouldArchiveValueForKey:", v21))
          {
            v22 = (void *)objc_claimAutoreleasedReturnValue(-[CALayer valueForKey:](self, "valueForKey:", v21));
            objc_msgSend(v3, "setValue:forKey:", v22, v21);

          }
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
      }
      while (v18);
    }

    if (-[CALayer needsDisplay](self, "needsDisplay"))
      objc_msgSend(v3, "setNeedsDisplay");
    if (-[CALayer needsLayout](self, "needsLayout"))
      objc_msgSend(v3, "setNeedsLayout");
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CALayer animationKeys](self, "animationKeys"));
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v35;
      do
      {
        for (j = 0; j != v25; j = (char *)j + 1)
        {
          if (*(_QWORD *)v35 != v26)
            objc_enumerationMutation(v23);
          v28 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)j);
          v29 = (void *)objc_claimAutoreleasedReturnValue(-[CALayer animationForKey:](self, "animationForKey:", v28));
          if ((objc_msgSend(v29, "isRemovedOnCompletion") & 1) == 0)
            objc_msgSend(v3, "addAnimation:forKey:", v29, v28);

        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
      }
      while (v25);
    }

    v30 = v3;
  }

  return v3;
}

- (id)mp_basicPropertiesToCopy
{
  return +[NSMutableSet setWithObjects:](NSMutableSet, "setWithObjects:", CFSTR("bounds"), CFSTR("position"), CFSTR("zPosition"), CFSTR("anchorPoint"), CFSTR("anchorPointZ"), CFSTR("transform"), CFSTR("hidden"), CFSTR("doubleSided"), CFSTR("geometryFlipped"), CFSTR("sublayerTransform"), CFSTR("masksToBounds"), CFSTR("contents"), CFSTR("contentsRect"), CFSTR("contentsGravity"), CFSTR("contentsScale"), CFSTR("contentsCenter"), CFSTR("minificationFilter"),
           CFSTR("magnificationFilter"),
           CFSTR("minificationFilterBias"),
           CFSTR("opaque"),
           CFSTR("needsDisplayOnBoundsChange"),
           CFSTR("edgeAntialiasingMask"),
           CFSTR("backgroundColor"),
           CFSTR("cornerRadius"),
           CFSTR("borderWidth"),
           CFSTR("borderColor"),
           CFSTR("opacity"),
           CFSTR("compositingFilter"),
           CFSTR("filters"),
           CFSTR("backgroundFilters"),
           CFSTR("shouldRasterize"),
           CFSTR("rasterizationScale"),
           CFSTR("shadowColor"),
           CFSTR("shadowOpacity"),
           CFSTR("shadowOffset"),
           CFSTR("shadowRadius"),
           CFSTR("shadowPath"),
           CFSTR("actions"),
           CFSTR("name"),
           CFSTR("style"),
           CFSTR("beginTime"),
           CFSTR("duration"),
           CFSTR("speed"),
           CFSTR("timeOffset"),
           CFSTR("repeatCount"),
           CFSTR("repeatDuration"),
           CFSTR("autoreverses"),
           CFSTR("fillMode"),
           0);
}

- (id)mp_propertiesToCopy
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _UNKNOWN **v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (!qword_100831530)
    qword_100831530 = (uint64_t)NSClassFromString(CFSTR("CAShapeLayer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CALayer mp_basicPropertiesToCopy](self, "mp_basicPropertiesToCopy"));
  v5 = objc_opt_class(CATextLayer, v4);
  if ((objc_opt_isKindOfClass(self, v5) & 1) != 0)
  {
    v6 = &off_100764B18;
LABEL_11:
    objc_msgSend(v3, "addObjectsFromArray:", v6);
    return v3;
  }
  if ((objc_opt_isKindOfClass(self, qword_100831530) & 1) != 0)
  {
    v6 = &off_100764B30;
    goto LABEL_11;
  }
  v8 = objc_opt_class(CAScrollLayer, v7);
  if ((objc_opt_isKindOfClass(self, v8) & 1) != 0)
  {
    objc_msgSend(v3, "addObject:", CFSTR("scrollMode"));
  }
  else
  {
    v10 = objc_opt_class(CATiledLayer, v9);
    if ((objc_opt_isKindOfClass(self, v10) & 1) != 0)
    {
      v6 = &off_100764B48;
      goto LABEL_11;
    }
  }
  return v3;
}

- (id)mp_allLayersInTree
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  -[CALayer mp_addLayerAndSublayersToArray:allowHiddenLayers:](self, "mp_addLayerAndSublayersToArray:allowHiddenLayers:", v3, 1);
  return v3;
}

- (void)mp_addLayerAndSublayersToArray:(id)a3 allowHiddenLayers:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a4;
  v6 = a3;
  if (v4 || !-[CALayer isHidden](self, "isHidden"))
  {
    objc_msgSend(v6, "addObject:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CALayer mask](self, "mask"));

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CALayer mask](self, "mask"));
      objc_msgSend(v8, "mp_addLayerAndSublayersToArray:allowHiddenLayers:", v6, v4);

    }
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CALayer sublayers](self, "sublayers", 0));
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v13), "mp_addLayerAndSublayersToArray:allowHiddenLayers:", v6, v4);
          v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v11);
    }

  }
}

- (id)mp_allLayersWhoseNamesContainString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unsigned int v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CALayer mp_allLayersInTree](self, "mp_allLayersInTree"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "name", (_QWORD)v18));
        if (v13)
        {
          v14 = (void *)v13;
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "name"));
          v16 = objc_msgSend(v15, "containsString:", v4);

          if (v16)
            objc_msgSend(v6, "addObject:", v12);
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  return v6;
}

- (id)mp_allLayersWithKindOfClass:(Class)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CALayer mp_allLayersInTree](self, "mp_allLayersInTree"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_isKindOfClass(v11, a3) & 1) != 0)
          objc_msgSend(v5, "addObject:", v11, (_QWORD)v13);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)mp_allAnimationsInTree
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CALayer mp_allLayersInTree](self, "mp_allLayersInTree"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v2;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v22;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v7);
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "animationKeys"));
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v18;
          do
          {
            v13 = 0;
            do
            {
              if (*(_QWORD *)v18 != v12)
                objc_enumerationMutation(v9);
              v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "animationForKey:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v13)));
              objc_msgSend(v3, "addObject:", v14);

              v13 = (char *)v13 + 1;
            }
            while (v11 != v13);
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          }
          while (v11);
        }

        v7 = (char *)v7 + 1;
      }
      while (v7 != v5);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v5);
  }

  return v3;
}

- (void)mp_moveAndResizeWithinParentLayer:(id)a3 usingGravity:(id)a4 geometryFlipped:(BOOL)a5 retinaScale:(double)a6 animate:(BOOL)a7
{
  _BOOL4 v9;
  NSString *v12;
  double v13;
  double x;
  double v15;
  double y;
  double v17;
  double v18;
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
  const CALayerContentsGravity *v29;
  CALayerContentsGravity v30;
  NSString *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  unsigned __int8 v37;
  unsigned __int8 v38;
  unsigned int v39;
  CATransform3D v40;
  CATransform3D v41;

  v9 = a5;
  v12 = (NSString *)a4;
  objc_msgSend(a3, "bounds");
  x = v13;
  y = v15;
  v18 = v17;
  v20 = v19;
  -[CALayer bounds](self, "bounds");
  v23 = v21 / a6;
  v24 = v22 / a6;
  if (a6 == 1.0)
  {
    v24 = v22;
    v23 = v21;
  }
  if (v18 >= 0.00001)
    v25 = v18;
  else
    v25 = 0.00001;
  if (v20 >= 0.00001)
    v26 = v20;
  else
    v26 = 0.00001;
  if (v23 >= 0.00001)
    v27 = v23;
  else
    v27 = 0.00001;
  if (v24 >= 0.00001)
    v28 = v24;
  else
    v28 = 0.00001;
  if (v9)
  {
    if (-[NSString isEqualToString:](v12, "isEqualToString:", kCAGravityTopLeft))
    {
      v29 = &kCAGravityBottomLeft;
LABEL_22:
      v30 = *v29;
LABEL_23:
      v31 = v30;

      v12 = v31;
      goto LABEL_24;
    }
    if (-[NSString isEqualToString:](v12, "isEqualToString:", kCAGravityTop))
    {
      v29 = &kCAGravityBottom;
      goto LABEL_22;
    }
    if (-[NSString isEqualToString:](v12, "isEqualToString:", kCAGravityTopRight))
    {
      v29 = &kCAGravityBottomRight;
      goto LABEL_22;
    }
    v37 = -[NSString isEqualToString:](v12, "isEqualToString:", kCAGravityBottomLeft);
    v30 = kCAGravityTopLeft;
    if ((v37 & 1) != 0)
      goto LABEL_23;
    v38 = -[NSString isEqualToString:](v12, "isEqualToString:", kCAGravityBottom);
    v30 = kCAGravityTop;
    if ((v38 & 1) != 0)
      goto LABEL_23;
    v39 = -[NSString isEqualToString:](v12, "isEqualToString:", kCAGravityBottomRight);
    v30 = kCAGravityTopRight;
    if (v39)
      goto LABEL_23;
  }
LABEL_24:
  if (-[NSString isEqualToString:](v12, "isEqualToString:", kCAGravityTopLeft))
  {
LABEL_29:
    y = y + v26 - v28;
LABEL_30:
    v32 = 1.0;
LABEL_31:
    v33 = 1.0;
    goto LABEL_32;
  }
  if (-[NSString isEqualToString:](v12, "isEqualToString:", kCAGravityTop))
  {
    x = x + v25 * 0.5 - v27 * 0.5;
    goto LABEL_29;
  }
  if (-[NSString isEqualToString:](v12, "isEqualToString:", kCAGravityTopRight))
  {
    x = x + v25 - v27;
    goto LABEL_29;
  }
  if (-[NSString isEqualToString:](v12, "isEqualToString:", kCAGravityLeft))
    goto LABEL_48;
  if (-[NSString isEqualToString:](v12, "isEqualToString:", kCAGravityCenter))
  {
    v36 = 0.5;
    x = x + v25 * 0.5 - v27 * 0.5;
LABEL_49:
    y = y + v26 * v36 - v28 * v36;
    goto LABEL_30;
  }
  if (-[NSString isEqualToString:](v12, "isEqualToString:", kCAGravityRight))
  {
    x = x + v25 - v27;
LABEL_48:
    v36 = 0.5;
    goto LABEL_49;
  }
  v32 = 1.0;
  if (-[NSString isEqualToString:](v12, "isEqualToString:", kCAGravityBottomLeft))
    goto LABEL_31;
  if (-[NSString isEqualToString:](v12, "isEqualToString:", kCAGravityBottom))
  {
    x = x + v25 * 0.5 - v27 * 0.5;
    goto LABEL_31;
  }
  if (-[NSString isEqualToString:](v12, "isEqualToString:", kCAGravityBottomRight))
  {
    x = x + v25 - v27;
    goto LABEL_31;
  }
  if (-[NSString isEqualToString:](v12, "isEqualToString:", kCAGravityResize))
  {
    v33 = v25 / v27;
    v32 = v26 / v28;
  }
  else
  {
    if (-[NSString isEqualToString:](v12, "isEqualToString:", kCAGravityResizeAspect))
    {
      if (v25 / v27 >= v26 / v28)
        v32 = v26 / v28;
      else
        v32 = v25 / v27;
    }
    else
    {
      if (!-[NSString isEqualToString:](v12, "isEqualToString:", kCAGravityResizeAspectFill))
      {
        x = CGPointZero.x;
        y = CGPointZero.y;
        NSLog(CFSTR("Unknown gravity: %@"), v12);
        goto LABEL_31;
      }
      if (v25 / v27 >= v26 / v28)
        v32 = v25 / v27;
      else
        v32 = v26 / v28;
    }
    x = x + (v25 - v27 * v32) * 0.5;
    y = y + (v26 - v28 * v32) * 0.5;
    v33 = v32;
  }
LABEL_32:
  if (a6 != 1.0)
  {
    v33 = v33 / a6;
    v32 = v32 / a6;
  }
  if (!a7)
  {
    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  }
  CATransform3DMakeScale(&v41, v33, v32, 1.0);
  v40 = v41;
  -[CALayer setTransform:](self, "setTransform:", &v40);
  -[CALayer frame](self, "frame");
  v35 = v34;
  -[CALayer frame](self, "frame");
  -[CALayer setFrame:](self, "setFrame:", x, y, v35);
  if (!a7)
    +[CATransaction commit](CATransaction, "commit");

}

@end
