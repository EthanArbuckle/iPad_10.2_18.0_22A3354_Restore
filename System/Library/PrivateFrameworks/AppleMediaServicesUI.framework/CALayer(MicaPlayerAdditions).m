@implementation CALayer(MicaPlayerAdditions)

- (void)mp_deepCopyLayer
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  uint64_t v27;
  void *v28;
  id v29;
  void *v31;
  void *v32;
  __int128 v33;
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
  _BYTE v45[128];
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithLayer:", a1);
  if (v2)
  {
    objc_msgSend(a1, "sublayers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
      if (v5)
      {
        v6 = v5;
        v7 = 0;
        v8 = *(_QWORD *)v42;
        do
        {
          v9 = 0;
          v10 = v7;
          do
          {
            if (*(_QWORD *)v42 != v8)
              objc_enumerationMutation(v4);
            v7 = *(id *)(*((_QWORD *)&v41 + 1) + 8 * v9);

            v11 = (void *)objc_msgSend(v7, "mp_deepCopyLayer");
            if (v11)
              objc_msgSend(v2, "addSublayer:", v11);

            ++v9;
            v10 = v7;
          }
          while (v6 != v9);
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
        }
        while (v6);

      }
    }
    objc_msgSend(a1, "mask");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = (void *)objc_msgSend(v12, "mp_deepCopyLayer");
      if (v14)
        objc_msgSend(v2, "setMask:", v14);

    }
    v32 = v4;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    objc_msgSend(a1, "mp_propertiesToCopy", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v38 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          if ((objc_msgSend(v20, "isEqualToString:", CFSTR("sublayers")) & 1) == 0
            && (objc_msgSend(v20, "isEqualToString:", CFSTR("mask")) & 1) == 0
            && objc_msgSend(a1, "shouldArchiveValueForKey:", v20))
          {
            objc_msgSend(a1, "valueForKey:", v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v2, "setValue:forKey:", v21, v20);

          }
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
      }
      while (v17);
    }

    if (objc_msgSend(a1, "needsDisplay"))
      objc_msgSend(v2, "setNeedsDisplay");
    if (objc_msgSend(a1, "needsLayout"))
      objc_msgSend(v2, "setNeedsLayout");
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    objc_msgSend(a1, "animationKeys");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v34;
      do
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v34 != v25)
            objc_enumerationMutation(v22);
          v27 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * j);
          objc_msgSend(a1, "animationForKey:", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v28, "isRemovedOnCompletion") & 1) == 0)
            objc_msgSend(v2, "addAnimation:forKey:", v28, v27);

        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
      }
      while (v24);
    }

    v29 = v2;
  }

  return v2;
}

- (uint64_t)mp_basicPropertiesToCopy
{
  return objc_msgSend(MEMORY[0x24BDBCEF0], "setWithObjects:", CFSTR("bounds"), CFSTR("position"), CFSTR("zPosition"), CFSTR("anchorPoint"), CFSTR("anchorPointZ"), CFSTR("transform"), CFSTR("hidden"), CFSTR("doubleSided"), CFSTR("geometryFlipped"), CFSTR("sublayerTransform"), CFSTR("masksToBounds"), CFSTR("contents"), CFSTR("contentsRect"), CFSTR("contentsGravity"), CFSTR("contentsScale"), CFSTR("contentsCenter"), CFSTR("minificationFilter"),
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
  void *v2;
  void *v3;

  if (!mp_propertiesToCopy_sCAShapeLayerClass)
    mp_propertiesToCopy_sCAShapeLayerClass = (uint64_t)NSClassFromString(CFSTR("CAShapeLayer"));
  objc_msgSend(a1, "mp_basicPropertiesToCopy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = &unk_24CB8C9B8;
LABEL_11:
    objc_msgSend(v2, "addObjectsFromArray:", v3);
    return v2;
  }
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = &unk_24CB8C9D0;
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "addObject:", CFSTR("scrollMode"));
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v3 = &unk_24CB8C9E8;
      goto LABEL_11;
    }
  }
  return v2;
}

- (id)mp_allLayersInTree
{
  void *v2;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "mp_addLayerAndSublayersToArray:allowHiddenLayers:", v2, 1);
  return v2;
}

- (void)mp_addLayerAndSublayersToArray:()MicaPlayerAdditions allowHiddenLayers:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if ((a4 & 1) != 0 || (objc_msgSend(a1, "isHidden") & 1) == 0)
  {
    objc_msgSend(v6, "addObject:", a1);
    objc_msgSend(a1, "mask");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(a1, "mask");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "mp_addLayerAndSublayersToArray:allowHiddenLayers:", v6, a4);

    }
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(a1, "sublayers", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
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
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "mp_addLayerAndSublayersToArray:allowHiddenLayers:", v6, a4);
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v11);
    }

  }
}

- (id)mp_allLayersWhoseNamesContainString:()MicaPlayerAdditions
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(a1, "mp_allLayersInTree");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
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
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v12, "name", (_QWORD)v18);
        v13 = objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = (void *)v13;
          objc_msgSend(v12, "name");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
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

- (id)mp_allLayersWithKindOfClass:()MicaPlayerAdditions
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "mp_allLayersInTree");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7);
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v2, "addObject:", v8, (_QWORD)v10);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  return v2;
}

- (id)mp_allAnimationsInTree
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "mp_allLayersInTree");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v1;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v21;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v21 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v6);
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        objc_msgSend(v7, "animationKeys");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v17;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v17 != v11)
                objc_enumerationMutation(v8);
              objc_msgSend(v7, "animationForKey:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12));
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v2, "addObject:", v13);

              ++v12;
            }
            while (v10 != v12);
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
          }
          while (v10);
        }

        ++v6;
      }
      while (v6 != v4);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v4);
  }

  return v2;
}

- (void)mp_moveAndResizeWithinParentLayer:()MicaPlayerAdditions usingGravity:geometryFlipped:retinaScale:animate:
{
  id v12;
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
  double v26;
  double v27;
  double v28;
  void *v29;
  void **v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  char v40;
  char v41;
  int v42;
  CATransform3D v43;
  CATransform3D v44;

  v12 = a5;
  objc_msgSend(a4, "bounds");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  objc_msgSend(a1, "bounds");
  v23 = v21 / a2;
  v24 = v22 / a2;
  if (a2 == 1.0)
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
  v29 = (void *)*MEMORY[0x24BDE5CB0];
  if (a6)
  {
    if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BDE5CB0]))
    {
      v30 = (void **)MEMORY[0x24BDE5C68];
LABEL_22:
      v33 = *v30;
LABEL_23:
      v34 = v33;

      v12 = v34;
      goto LABEL_24;
    }
    v31 = (void *)*MEMORY[0x24BDE5CA8];
    if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BDE5CA8]))
    {
      v30 = (void **)MEMORY[0x24BDE5C60];
      goto LABEL_22;
    }
    v32 = (void *)*MEMORY[0x24BDE5CB8];
    if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BDE5CB8]))
    {
      v30 = (void **)MEMORY[0x24BDE5C70];
      goto LABEL_22;
    }
    v40 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BDE5C68]);
    v33 = v29;
    if ((v40 & 1) != 0)
      goto LABEL_23;
    v41 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BDE5C60]);
    v33 = v31;
    if ((v41 & 1) != 0)
      goto LABEL_23;
    v42 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BDE5C70]);
    v33 = v32;
    if (v42)
      goto LABEL_23;
  }
LABEL_24:
  if (objc_msgSend(v12, "isEqualToString:", v29))
  {
LABEL_29:
    v16 = v16 + v26 - v28;
LABEL_30:
    v35 = 1.0;
LABEL_31:
    v36 = 1.0;
    goto LABEL_32;
  }
  if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BDE5CA8]))
  {
    v14 = v14 + v25 * 0.5 - v27 * 0.5;
    goto LABEL_29;
  }
  if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BDE5CB8]))
  {
    v14 = v14 + v25 - v27;
    goto LABEL_29;
  }
  if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BDE5C80]))
    goto LABEL_48;
  if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BDE5C78]))
  {
    v39 = 0.5;
    v14 = v14 + v25 * 0.5 - v27 * 0.5;
LABEL_49:
    v16 = v16 + v26 * v39 - v28 * v39;
    goto LABEL_30;
  }
  if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BDE5CA0]))
  {
    v14 = v14 + v25 - v27;
LABEL_48:
    v39 = 0.5;
    goto LABEL_49;
  }
  v35 = 1.0;
  if ((objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BDE5C68]) & 1) != 0)
    goto LABEL_31;
  if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BDE5C60]))
  {
    v14 = v14 + v25 * 0.5 - v27 * 0.5;
    goto LABEL_31;
  }
  if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BDE5C70]))
  {
    v14 = v14 + v25 - v27;
    goto LABEL_31;
  }
  if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BDE5C88]))
  {
    v36 = v25 / v27;
    v35 = v26 / v28;
  }
  else
  {
    if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BDE5C90]))
    {
      if (v25 / v27 >= v26 / v28)
        v35 = v26 / v28;
      else
        v35 = v25 / v27;
    }
    else
    {
      if (!objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BDE5C98]))
      {
        v14 = *MEMORY[0x24BDBEFB0];
        v16 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
        NSLog(CFSTR("Unknown gravity: %@"), v12);
        goto LABEL_31;
      }
      if (v25 / v27 >= v26 / v28)
        v35 = v25 / v27;
      else
        v35 = v26 / v28;
    }
    v14 = v14 + (v25 - v27 * v35) * 0.5;
    v16 = v16 + (v26 - v28 * v35) * 0.5;
    v36 = v35;
  }
LABEL_32:
  if (a2 != 1.0)
  {
    v36 = v36 / a2;
    v35 = v35 / a2;
  }
  if ((a7 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  }
  CATransform3DMakeScale(&v44, v36, v35, 1.0);
  v43 = v44;
  objc_msgSend(a1, "setTransform:", &v43);
  objc_msgSend(a1, "frame");
  v38 = v37;
  objc_msgSend(a1, "frame");
  objc_msgSend(a1, "setFrame:", v14, v16, v38);
  if ((a7 & 1) == 0)
    objc_msgSend(MEMORY[0x24BDE57D8], "commit");

}

@end
