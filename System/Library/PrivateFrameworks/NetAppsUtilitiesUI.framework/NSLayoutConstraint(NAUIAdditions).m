@implementation NSLayoutConstraint(NAUIAdditions)

+ (uint64_t)naui_areConstraints:()NAUIAdditions equalToConstraints:
{
  id v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "count");
  if (v7 == objc_msgSend(v6, "count"))
  {
    if (objc_msgSend(v5, "count"))
    {
      v8 = 0;
      do
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectAtIndexedSubscript:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "naui_isEqualToConstraint:", v10);

        if ((v11 & 1) == 0)
          break;
        ++v8;
      }
      while (v8 < objc_msgSend(v5, "count"));
    }
    else
    {
      v11 = 1;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)naui_isEqualToConstraint:()NAUIAdditions
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  _BOOL8 v17;

  v4 = a3;
  objc_msgSend(a1, "firstItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if (!v7)
    goto LABEL_7;
  v8 = objc_msgSend(a1, "firstAttribute");
  if (v8 != objc_msgSend(v4, "firstAttribute"))
    goto LABEL_7;
  objc_msgSend(a1, "secondItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "secondItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqual:", v10);

  if (!v11)
    goto LABEL_7;
  v12 = objc_msgSend(a1, "secondAttribute");
  if (v12 == objc_msgSend(v4, "secondAttribute")
    && (v13 = objc_msgSend(a1, "relation"), v13 == objc_msgSend(v4, "relation")))
  {
    objc_msgSend(a1, "constant");
    v15 = v14;
    objc_msgSend(v4, "constant");
    v17 = v15 == v16;
  }
  else
  {
LABEL_7:
    v17 = 0;
  }

  return v17;
}

+ (id)naui_constraintsByCenteringView:()NAUIAdditions withView:alongAxes:offset:
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;

  v11 = a5;
  v12 = a6;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((a7 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BE1A2C8], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v11, 9, 0, v12, 9, 1.0, a1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v14);

  }
  if ((a7 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BE1A2C8], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v11, 10, 0, v12, 10, 1.0, a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v15);

  }
  return v13;
}

+ (id)naui_constraintsByAttachingView:()NAUIAdditions toView:alongEdges:relatedBy:insets:
{
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;

  v17 = a7;
  v18 = a8;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if ((a9 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BE1A2C8], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v17, 3, a10, v18, 3, 1.0, a1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v22);

    if ((a9 & 4) == 0)
    {
LABEL_3:
      if ((a9 & 2) == 0)
        goto LABEL_4;
LABEL_9:
      objc_msgSend(MEMORY[0x24BE1A2C8], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v17, 5, a10, v18, 5, 1.0, a2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addObject:", v24);

      if ((a9 & 8) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((a9 & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BE1A2C8], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v17, 4, a10, v18, 4, 1.0, -a3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObject:", v23);

  if ((a9 & 2) != 0)
    goto LABEL_9;
LABEL_4:
  if ((a9 & 8) != 0)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x24BE1A2C8], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v17, 6, a10, v18, 6, 1.0, -a4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v20);

  }
LABEL_6:

  return v19;
}

+ (uint64_t)naui_constraintsByAttachingView:()NAUIAdditions toView:alongEdges:insets:
{
  return objc_msgSend(a1, "naui_constraintsByAttachingView:toView:alongEdges:relatedBy:insets:", a3, a4, a5, 0);
}

+ (id)naui_constraintsBySizingView:()NAUIAdditions toSize:
{
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v7 = a5;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (a1 != -1.0)
  {
    objc_msgSend(MEMORY[0x24BE1A2C8], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v7, 7, 0, 0, 0, 1.0, a1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v9);

  }
  if (a2 != -1.0)
  {
    objc_msgSend(MEMORY[0x24BE1A2C8], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v7, 8, 0, 0, 0, 1.0, a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v10);

  }
  return v8;
}

+ (id)naui_viewsInConstraints:()NAUIAdditions
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v10, "firstItem", (_QWORD)v18);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend(v10, "firstItem");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v13);

        }
        objc_msgSend(v10, "secondItem");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v15 = objc_opt_isKindOfClass();

        if ((v15 & 1) != 0)
        {
          objc_msgSend(v10, "secondItem");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v16);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)naui_constraintsWithVisualFormat:()NAUIAdditions options:metrics:views:label:
{
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v11 = a7;
  objc_msgSend(MEMORY[0x24BE1A2C8], "constraintsWithVisualFormat:options:metrics:views:", a3, a4, a5, a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v17, "naui_debugIdentifierWithBaseLabel:", v11);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setIdentifier:", v18);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v14);
  }

  return v12;
}

- (id)naui_debugIdentifierWithBaseLabel:()NAUIAdditions
{
  void *v4;
  id v5;
  void *v6;
  unint64_t v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = a3;
  NAUIStringFromLayoutAttribute(objc_msgSend(a1, "firstAttribute"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(a1, "relation") + 1;
  if (v7 > 2)
    v8 = CFSTR("NSLayoutRelation(?)");
  else
    v8 = off_24D6126D0[v7];
  NAUIStringFromLayoutAttribute(objc_msgSend(a1, "secondAttribute"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@%@,%@"), v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@(%@)"), v5, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)naui_setIdentifierWithLabel:()NAUIAdditions
{
  id v2;

  objc_msgSend(a1, "naui_debugIdentifierWithBaseLabel:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setIdentifier:", v2);

}

@end
