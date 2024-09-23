@implementation AXElementGrouper

- (AXElementGrouper)init
{

  return 0;
}

- (AXElementGrouper)initWithHeuristics:(int64_t)a3
{
  AXElementGrouper *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AXElementGrouper;
  result = -[AXElementGrouper init](&v5, sel_init);
  if (result)
    result->_heuristics = a3;
  return result;
}

- (unint64_t)minimumGroupSize
{
  return 3;
}

- (unint64_t)maximumGroupSize
{
  if (self->_heuristics == 2)
    return 10;
  else
    return 9;
}

- (unint64_t)preferredGroupSize
{
  if (self->_heuristics == 2)
    return 10;
  else
    return 5;
}

- (double)thresholdForDeterminingEqualSize
{
  int64_t heuristics;
  double result;

  heuristics = self->_heuristics;
  result = 10.0;
  if (heuristics == 1)
    result = 16.0;
  if (heuristics == 2)
    return 25.0;
  return result;
}

- (NSArray)transformationPasses
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)groupElementsInRootGroup:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[AXElementGrouper _buildHierarchyForGroup:indexOfKeyboard:](self, "_buildHierarchyForGroup:indexOfKeyboard:", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXElementGrouper _flattenHierarchyForGroup:rootLevel:](self, "_flattenHierarchyForGroup:rootLevel:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXElementGrouper _applyTransformationPassesToRootGroup:](self, "_applyTransformationPassesToRootGroup:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_groupRemovingImpossibleGroups:(id)a3 isRootLevel:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v4 = a4;
  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if ((objc_msgSend(v6, "allowsChangingExistingGroupingOfContents") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v33 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          if (objc_msgSend(v13, "isGroup"))
          {
            -[AXElementGrouper _groupRemovingImpossibleGroups:isRootLevel:](self, "_groupRemovingImpossibleGroups:isRootLevel:", v13, 0);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v14, "canBeReplacedByChildren")
              && (v15 = objc_msgSend(v14, "count"), v15 < -[AXElementGrouper minimumGroupSize](self, "minimumGroupSize"))
              || objc_msgSend(v14, "shouldBeUngrouped"))
            {
              objc_msgSend(v7, "addObjectsFromArray:", v14);
            }
            else
            {
              objc_msgSend(v7, "addObject:", v14);
            }

          }
          else
          {
            objc_msgSend(v7, "addObject:", v13);
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      }
      while (v10);
    }

    if (v4 && (v16 = objc_msgSend(v7, "count"), v16 < -[AXElementGrouper minimumGroupSize](self, "minimumGroupSize")))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v18 = v7;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v29;
        do
        {
          for (j = 0; j != v20; ++j)
          {
            if (*(_QWORD *)v29 != v21)
              objc_enumerationMutation(v18);
            v23 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * j);
            if (objc_msgSend(v23, "isGroup", (_QWORD)v28)
              && objc_msgSend(v23, "canBeReplacedByChildren"))
            {
              objc_msgSend(v17, "addObjectsFromArray:", v23);
            }
            else
            {
              objc_msgSend(v17, "addObject:", v23);
            }
          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        }
        while (v20);
      }

    }
    else
    {
      v17 = v7;
    }
    objc_msgSend(v8, "label", (_QWORD)v28);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[AXElementGroup groupWithElements:label:](AXElementGroup, "groupWithElements:label:", v17, v25);
    v24 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "setGroupTraits:", objc_msgSend(v8, "groupTraits"));
    objc_msgSend(v24, "setUserDefinedScanningBehaviorTraits:", objc_msgSend(v8, "userDefinedScanningBehaviorTraits"));
    objc_msgSend(v8, "identifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setIdentifier:", v26);

  }
  else
  {
    v24 = v6;
  }

  return v24;
}

- (BOOL)_frame:(CGRect)a3 isApproximatelySameSizeAsFrame:(CGRect)a4
{
  double height;
  double v5;
  double v7;
  double v8;
  double v9;

  height = a4.size.height;
  v5 = a3.size.height;
  v7 = vabdd_f64(a3.size.width, a4.size.width);
  -[AXElementGrouper thresholdForDeterminingEqualSize](self, "thresholdForDeterminingEqualSize", a3.origin.x, a3.origin.y);
  if (v7 >= v8)
    return 0;
  -[AXElementGrouper thresholdForDeterminingEqualSize](self, "thresholdForDeterminingEqualSize");
  return vabdd_f64(v5, height) < v9;
}

- (id)_flattenHierarchyForGroup:(id)a3 rootLevel:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  void *v13;
  id v14;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v19;
  double v20;
  unint64_t v21;
  int v22;
  unsigned int v23;
  int v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t i;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;
  CGRect v48;
  CGRect v49;

  v4 = a4;
  v47 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v4)
  {
    -[AXElementGrouper _groupRemovingImpossibleGroups:isRootLevel:](self, "_groupRemovingImpossibleGroups:isRootLevel:", v6, 1);
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v7;
  }
  if (objc_msgSend(v6, "allowsChangingExistingGroupingOfContents"))
  {
    v8 = objc_msgSend(v6, "count");
    if (v8)
    {
      v9 = v8;
      while (1)
      {
        v10 = 0;
        v11 = 0x7FFFFFFFFFFFFFFFLL;
        v12 = 0.0;
        do
        {
          objc_msgSend(v6, "objectAtIndex:", v10);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "isGroup"))
          {
            v14 = v13;
            if (objc_msgSend(v14, "canBeReplacedByChildren"))
            {
              objc_msgSend(v14, "frame");
              x = v48.origin.x;
              y = v48.origin.y;
              width = v48.size.width;
              height = v48.size.height;
              v19 = CGRectGetWidth(v48);
              v49.origin.x = x;
              v49.origin.y = y;
              v49.size.width = width;
              v49.size.height = height;
              v20 = v19 * CGRectGetHeight(v49);
              if (v20 > v12)
              {
                v21 = v9 - 1 + objc_msgSend(v14, "count");
                if (v21 <= -[AXElementGrouper maximumGroupSize](self, "maximumGroupSize"))
                {
                  v22 = v9 - -[AXElementGrouper preferredGroupSize](self, "preferredGroupSize");
                  if (v22 >= 0)
                    v23 = v22;
                  else
                    v23 = -v22;
                  v24 = v21 - -[AXElementGrouper preferredGroupSize](self, "preferredGroupSize");
                  if (v24 < 0)
                    v24 = -v24;
                  if (v23 >= v24)
                  {
                    v11 = v10;
                    v12 = v20;
                  }
                }
              }
            }

          }
          ++v10;
        }
        while (v9 != v10);
        if (v11 == 0x7FFFFFFFFFFFFFFFLL)
          break;
        objc_msgSend(v6, "objectAtIndex:", v11);
        v25 = objc_claimAutoreleasedReturnValue();
        if (!v25)
          break;
        v26 = (void *)v25;
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        for (i = 0; i != v9; ++i)
        {
          objc_msgSend(v6, "objectAtIndex:", i);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11 == i)
            objc_msgSend(v27, "addObjectsFromArray:", v29);
          else
            objc_msgSend(v27, "addObject:", v29);

        }
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = 0u;
        v43 = 0u;
        v44 = 0u;
        v45 = 0u;
        v31 = v27;
        v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
        if (v32)
        {
          v33 = v32;
          v34 = *(_QWORD *)v43;
          do
          {
            for (j = 0; j != v33; ++j)
            {
              if (*(_QWORD *)v43 != v34)
                objc_enumerationMutation(v31);
              v36 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * j);
              if (objc_msgSend(v36, "isGroup"))
              {
                -[AXElementGrouper _flattenHierarchyForGroup:rootLevel:](self, "_flattenHierarchyForGroup:rootLevel:", v36, 0);
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "addObject:", v37);

              }
              else
              {
                objc_msgSend(v30, "addObject:", v36);
              }
            }
            v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
          }
          while (v33);
        }

        objc_msgSend(v6, "label");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        +[AXElementGroup groupWithElements:label:](AXElementGroup, "groupWithElements:label:", v30, v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v39, "setGroupTraits:", objc_msgSend(v6, "groupTraits"));
        objc_msgSend(v39, "setUserDefinedScanningBehaviorTraits:", objc_msgSend(v6, "userDefinedScanningBehaviorTraits"));
        objc_msgSend(v6, "identifier");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setIdentifier:", v40);

        v9 = objc_msgSend(v39, "count");
        v6 = v39;
        if (!v9)
          return v39;
      }
    }
  }
  v39 = v6;
  return v39;
}

- (id)_applyTransformationPass:(id)a3 toGroup:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        if (objc_msgSend(v15, "isGroup", (_QWORD)v24))
        {
          -[AXElementGrouper _applyTransformationPass:toGroup:](self, "_applyTransformationPass:toGroup:", v6, v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v12 |= v16 != v15;
          objc_msgSend(v8, "addObject:", v16);

        }
        else
        {
          objc_msgSend(v8, "addObject:", v15);
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v11);

    v17 = v9;
    v18 = v17;
    if ((v12 & 1) != 0)
    {
      objc_msgSend(v17, "label");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[AXElementGroup groupWithElements:label:](AXElementGroup, "groupWithElements:label:", v8, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v20, "setGroupTraits:", objc_msgSend(v18, "groupTraits"));
      objc_msgSend(v20, "setUserDefinedScanningBehaviorTraits:", objc_msgSend(v18, "userDefinedScanningBehaviorTraits"));
      objc_msgSend(v18, "identifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setIdentifier:", v21);

      v18 = v20;
    }
  }
  else
  {

    v18 = v9;
  }
  if (objc_msgSend(v6, "shouldTransformGroup:forGrouper:", v18, self, (_QWORD)v24))
  {
    objc_msgSend(v6, "transformGroup:forGrouper:", v18, self);
    v22 = objc_claimAutoreleasedReturnValue();

    v18 = (id)v22;
  }

  return v18;
}

- (id)_applyTransformationPassesToRootGroup:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[AXElementGrouper transformationPasses](self, "transformationPasses", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      v10 = v4;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        -[AXElementGrouper _applyTransformationPass:toGroup:](self, "_applyTransformationPass:toGroup:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), v10);
        v4 = (id)objc_claimAutoreleasedReturnValue();

        ++v9;
        v10 = v4;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)_buildHierarchyForGroup:(id)a3 indexOfKeyboard:(unint64_t *)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  unint64_t v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  id v35;
  unint64_t *v36;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((objc_msgSend(v5, "allowsChangingExistingGroupingOfContents") & 1) == 0)
  {
    v30 = v5;
    v12 = 0x7FFFFFFFFFFFFFFFLL;
    if (!a4)
      goto LABEL_38;
    goto LABEL_37;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (!v8)
  {

    v31 = v6;
LABEL_30:
    if (objc_msgSend(v7, "allowsVisualGroupingOfChildren"))
    {
      -[AXElementGrouper _groupablesForItems:](self, "_groupablesForItems:", v6);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      v12 = 0x7FFFFFFFFFFFFFFFLL;
      v29 = v6;
    }
    goto LABEL_33;
  }
  v9 = v8;
  v35 = v5;
  v36 = a4;
  v10 = 0;
  v11 = *(_QWORD *)v40;
  v12 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v40 != v11)
        objc_enumerationMutation(v7);
      v14 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
      if (objc_msgSend(v14, "isGroup", v35, v36))
      {
        v38 = 0x7FFFFFFFFFFFFFFFLL;
        -[AXElementGrouper _buildHierarchyForGroup:indexOfKeyboard:](self, "_buildHierarchyForGroup:indexOfKeyboard:", v14, &v38);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v15)
        {
          v17 = v7;
          v18 = v38;
          if (v38 == 0x7FFFFFFFFFFFFFFFLL || v18 >= objc_msgSend(v15, "count"))
          {
            objc_msgSend(v6, "addObject:", v16);
            v27 = v10 + 1;
            if (!objc_msgSend(v16, "isKeyboardContainer"))
              v10 = v12;
            v7 = v17;
          }
          else
          {
            objc_msgSend(v16, "subarrayWithRange:", 0, v38);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v19, "count"))
            {
              +[AXElementGroup groupWithElements:](AXElementGroup, "groupWithElements:", v19);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "addObject:", v20);

              ++v10;
            }
            objc_msgSend(v16, "objectAtIndex:", v38);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v21);

            v22 = v38;
            if (v22 >= objc_msgSend(v16, "count") - 1)
            {
              v27 = v10 + 1;
            }
            else
            {
              v23 = v38 + 1;
              v24 = objc_msgSend(v16, "count");
              objc_msgSend(v16, "subarrayWithRange:", v23, v24 + ~v38);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              +[AXElementGroup groupWithElements:](AXElementGroup, "groupWithElements:", v25);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "addObject:", v26);

              v27 = v10 + 2;
            }
            v7 = v17;

          }
        }
        else
        {
          v27 = v10;
          v10 = v12;
        }
        v12 = v10;

        v10 = v27;
      }
      else
      {
        objc_msgSend(v6, "addObject:", v14);
        ++v10;
      }
    }
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  }
  while (v9);

  v28 = v6;
  v5 = v35;
  a4 = v36;
  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_30;
  v29 = v28;
LABEL_33:
  if (objc_msgSend(v29, "count"))
  {
    objc_msgSend(v7, "label");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    +[AXElementGroup groupWithElements:label:](AXElementGroup, "groupWithElements:label:", v29, v32);
    v30 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v30, "setGroupTraits:", objc_msgSend(v7, "groupTraits"));
    objc_msgSend(v30, "setUserDefinedScanningBehaviorTraits:", objc_msgSend(v7, "userDefinedScanningBehaviorTraits"));
    objc_msgSend(v7, "identifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setIdentifier:", v33);

  }
  else
  {
    v30 = 0;
  }

  if (a4)
LABEL_37:
    *a4 = v12;
LABEL_38:

  return v30;
}

- (id)_groupablesForItems:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "count");
  if (v6 >= -[AXElementGrouper maximumGroupSize](self, "maximumGroupSize"))
  {
    if (v6)
    {
      v7 = 0;
      do
      {
        v8 = -[AXElementGrouper preferredGroupSize](self, "preferredGroupSize");
        if (v8 + v7 > v6 || (v9 = v8, v6 - v7 < -[AXElementGrouper maximumGroupSize](self, "maximumGroupSize")))
          v9 = v6 - v7;
        objc_msgSend(v4, "subarrayWithRange:", v7, v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[AXElementGroup groupWithElements:](AXElementGroup, "groupWithElements:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
          objc_msgSend(v5, "addObject:", v11);
        v7 += v9;

      }
      while (v7 < v6);
    }
  }
  else
  {
    objc_msgSend(v5, "addObjectsFromArray:", v4);
  }

  return v5;
}

- (int64_t)heuristics
{
  return self->_heuristics;
}

- (void)setHeuristics:(int64_t)a3
{
  self->_heuristics = a3;
}

@end
