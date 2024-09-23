@implementation VKRoadFeatureAccessibilityElement

- (int64_t)_accessibilityMapFeatureType
{
  return 1;
}

- (id)_axRoadPrefix
{
  unint64_t v2;
  void *v3;

  v2 = -[VKRoadFeatureAccessibilityElement _accessibilityMapRoadType](self, "_accessibilityMapRoadType") - 1;
  if (v2 > 4)
  {
    v3 = 0;
  }
  else
  {
    AXVectorKitLocString(off_2503C5028[v2]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)trueLabel
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VKRoadFeatureAccessibilityElement;
  -[VKFeatureAccessibilityElement accessibilityLabel](&v3, sel_accessibilityLabel);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_axRoadSuffix
{
  void *v2;

  if (-[VKRoadFeatureAccessibilityElement travelDirection](self, "travelDirection") - 1 > 1)
  {
    v2 = 0;
  }
  else
  {
    AXVectorKitLocString(CFSTR("ROAD_ONE_WAY"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (id)accessibilityLabel
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  objc_super v20;
  objc_super v21;

  -[VKRoadFeatureAccessibilityElement _axRoadPrefix](self, "_axRoadPrefix");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (id)v3;
    -[VKFeatureAccessibilityElement shieldText](self, "shieldText");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = (void *)MEMORY[0x24BDD17C8];
      -[VKFeatureAccessibilityElement shieldText](self, "shieldText");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ %@"), v4, v7);
      v8 = objc_claimAutoreleasedReturnValue();

      v4 = (id)v8;
    }
    v21.receiver = self;
    v21.super_class = (Class)VKRoadFeatureAccessibilityElement;
    -[VKFeatureAccessibilityElement accessibilityLabel](&v21, sel_accessibilityLabel);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v20.receiver = self;
  v20.super_class = (Class)VKRoadFeatureAccessibilityElement;
  -[VKFeatureAccessibilityElement accessibilityLabel](&v20, sel_accessibilityLabel);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    -[VKFeatureAccessibilityElement shieldText](self, "shieldText");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[VKRoadFeatureAccessibilityElement _axRoadSuffix](self, "_axRoadSuffix");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKRoadFeatureAccessibilityElement _roadDirectionDescription](self, "_roadDirectionDescription");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!AXDoesRequestingClientDeserveAutomation())
  {
    v19 = 0;
    v15 = -[VKRoadFeatureAccessibilityElement _roadSuffixRangeForCommonRoadAbbreviations:replacement:](self, "_roadSuffixRangeForCommonRoadAbbreviations:replacement:", v9, &v19, v13, v18, CFSTR("__AXStringForVariablesSentinel"));
    v17 = v16;
    v4 = v19;
    if (v15 == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_6;
    objc_msgSend(v9, "stringByReplacingCharactersInRange:withString:", v15, v17, v4);
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v11 = (void *)v10;

    v9 = v11;
LABEL_6:

  }
  return v9;
}

- (_NSRange)_roadSuffixRangeForCommonRoadAbbreviations:(id)a3 replacement:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  NSUInteger v14;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  id *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  __n128 (*v22)(__n128 *, __n128 *);
  uint64_t (*v23)();
  void *v24;
  __int128 v25;
  _NSRange result;

  v5 = a3;
  if (-[VKRoadFeatureAccessibilityElement _roadSuffixRangeForCommonRoadAbbreviations:replacement:]::onceToken != -1)
    dispatch_once(&-[VKRoadFeatureAccessibilityElement _roadSuffixRangeForCommonRoadAbbreviations:replacement:]::onceToken, &__block_literal_global_2);
  v19 = 0;
  v20 = &v19;
  v21 = 0x4012000000;
  v22 = __Block_byref_object_copy__0;
  v23 = __Block_byref_object_dispose__0;
  v24 = &unk_232B640CA;
  v25 = xmmword_232B5BD00;
  objc_msgSend(MEMORY[0x24BE00658], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dialectForSystemLanguage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "specificLanguageID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("_"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend((id)-[VKRoadFeatureAccessibilityElement _roadSuffixRangeForCommonRoadAbbreviations:replacement:]::SupportedLangs, "containsObject:", v9) & 1) != 0)
  {
    v10 = objc_msgSend(v5, "length");
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __92__VKRoadFeatureAccessibilityElement__roadSuffixRangeForCommonRoadAbbreviations_replacement___block_invoke_442;
    v15[3] = &unk_2503C4F18;
    v16 = v9;
    v17 = &v19;
    v18 = a4;
    objc_msgSend(v5, "enumerateSubstringsInRange:options:usingBlock:", 0, v10, 3, v15);
    v11 = v20[6];
    v12 = v20[7];

  }
  else
  {
    v11 = v20[6];
    v12 = v20[7];
  }

  _Block_object_dispose(&v19, 8);
  v13 = v11;
  v14 = v12;
  result.length = v14;
  result.location = v13;
  return result;
}

uint64_t __92__VKRoadFeatureAccessibilityElement__roadSuffixRangeForCommonRoadAbbreviations_replacement___block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_2503CDFA0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)-[VKRoadFeatureAccessibilityElement _roadSuffixRangeForCommonRoadAbbreviations:replacement:]::SupportedLangs;
  -[VKRoadFeatureAccessibilityElement _roadSuffixRangeForCommonRoadAbbreviations:replacement:]::SupportedLangs = v0;

  v2 = (void *)MEMORY[0x24BDD1488];
  AXAccessibilityBundlesDirectory();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("MapsStreetNames.axbundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleWithPath:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)-[VKRoadFeatureAccessibilityElement _roadSuffixRangeForCommonRoadAbbreviations:replacement:]::Bundle;
  -[VKRoadFeatureAccessibilityElement _roadSuffixRangeForCommonRoadAbbreviations:replacement:]::Bundle = v5;

  return objc_msgSend((id)-[VKRoadFeatureAccessibilityElement _roadSuffixRangeForCommonRoadAbbreviations:replacement:]::Bundle, "load");
}

void __92__VKRoadFeatureAccessibilityElement__roadSuffixRangeForCommonRoadAbbreviations_replacement___block_invoke_442(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;

  v11 = a2;
  v12 = (void *)MEMORY[0x24BDD17C8];
  v19 = v11;
  objc_msgSend(v11, "lowercaseString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("ROAD.SUFFIX.%@"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)-[VKRoadFeatureAccessibilityElement _roadSuffixRangeForCommonRoadAbbreviations:replacement:]::Bundle;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("StreetNames-%@"), *(_QWORD *)(a1 + 32));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", v14, &stru_2503C5610, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v17, "length") && (objc_msgSend(v17, "isEqualToString:", v14) & 1) == 0)
  {
    **(_QWORD **)(a1 + 48) = (id)objc_msgSend(v17, "copy");
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    *(_QWORD *)(v18 + 48) = a3;
    *(_QWORD *)(v18 + 56) = a4;
    *a7 = 1;
  }

}

- (BOOL)_accessibilityLastHitTestNearBorder
{
  return self->_lastHitTestNearBorder;
}

- (int64_t)_accessibilityMapRoadType
{
  uint64_t v2;

  v2 = -[VKFeatureAccessibilityElement shieldType](self, "shieldType");
  if (v2 <= 5449)
  {
    if (v2 == 1045)
      return 3;
    if (v2 == 5400)
      return 1;
  }
  else
  {
    switch(v2)
    {
      case 5450:
        return 2;
      case 6650:
        return 5;
      case 5700:
        return 4;
    }
  }
  return 0;
}

- (NSArray)originalPaths
{
  NSMutableArray *originalPaths;

  originalPaths = self->_originalPaths;
  if (!originalPaths)
  {
    -[VKRoadFeatureAccessibilityElement _updatePath](self, "_updatePath");
    originalPaths = self->_originalPaths;
  }
  return (NSArray *)originalPaths;
}

- (void)_combineRoadPaths:(id)a3
{
  unint64_t i;
  NSArray *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  NSArray *v17;
  NSArray *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  void *v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  CGFloat v33;
  double DistanceBetweenPoints;
  double v35;
  float v36;
  double v37;
  void *v38;
  uint64_t v39;
  float v40;
  NSArray *v41;
  double v42;
  double v43;
  float v44;
  NSArray *v45;
  float v46;
  void *v47;
  uint64_t v48;
  BOOL v49;
  int v50;
  NSArray *v51;
  float v52;
  char v53;
  void *v54;
  int v55;
  NSArray *v58;
  char v59;
  NSArray *v60;
  unint64_t v61;
  CGFloat v62;
  CGFloat v63;
  CGFloat v64;
  id v65;
  float v66;
  float v67;
  CGPoint v68;
  CGPoint v69;
  CGPoint v70;
  CGPoint v71;
  CGPoint v72;
  CGPoint v73;
  CGPoint v74;
  CGPoint v75;

  v65 = a3;
  objc_storeStrong((id *)&self->_allPoints, a3);
  if ((unint64_t)objc_msgSend(v65, "count") >= 2)
  {
    for (i = 0; i < objc_msgSend(v65, "count"); ++i)
    {
      objc_msgSend(v65, "objectAtIndex:", i);
      v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
      -[NSArray objectAtIndex:](v6, "objectAtIndex:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "CGPointValue");
      v9 = v8;
      v11 = v10;

      -[NSArray lastObject](v6, "lastObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = v11;
      v64 = v9;
      objc_msgSend(v12, "CGPointValue");
      v14 = v13;
      v16 = v15;

      v17 = 0;
      v18 = 0;
      v19 = i + 1;
      v20 = -1;
      v66 = 3.4028e38;
      v67 = 3.4028e38;
      v21 = -1;
      v62 = v16;
      while (v19 < objc_msgSend(v65, "count"))
      {
        objc_msgSend(v65, "objectAtIndex:", v19);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectAtIndex:", 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "CGPointValue");
        v25 = v24;
        v27 = v26;

        objc_msgSend(v22, "lastObject");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "CGPointValue");
        v30 = v29;
        v32 = v31;
        v33 = v14;

        v68.x = v64;
        v68.y = v63;
        v72.x = v25;
        v72.y = v27;
        DistanceBetweenPoints = AXVKMathGetDistanceBetweenPoints(v68, v72);
        v69.x = v64;
        v69.y = v63;
        v73.x = v30;
        v73.y = v32;
        v37 = AXVKMathGetDistanceBetweenPoints(v69, v73);
        v35 = v37;
        v36 = DistanceBetweenPoints;
        *(float *)&v37 = v67;
        if (v67 <= v36)
        {
          v36 = v67;
        }
        else
        {
          objc_msgSend(v22, "reverseObjectEnumerator", v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "allObjects");
          v39 = objc_claimAutoreleasedReturnValue();

          v18 = (NSArray *)v39;
          v21 = v19;
        }
        v40 = v35;
        v67 = v40;
        if (v36 <= v40)
        {
          v67 = v36;
        }
        else
        {
          v41 = v22;

          v18 = v41;
          v21 = v19;
        }
        v70.x = v33;
        v70.y = v62;
        v74.x = v25;
        v74.y = v27;
        v42 = AXVKMathGetDistanceBetweenPoints(v70, v74);
        v71.x = v33;
        v71.y = v62;
        v75.x = v30;
        v75.y = v32;
        v43 = AXVKMathGetDistanceBetweenPoints(v71, v75);
        v44 = v42;
        if (v66 <= v44)
        {
          v44 = v66;
        }
        else
        {
          v45 = v22;

          v17 = v45;
          v20 = v19;
        }
        v46 = v43;
        v66 = v46;
        if (v44 <= v46)
        {
          v66 = v44;
          v14 = v33;
        }
        else
        {
          objc_msgSend(v22, "reverseObjectEnumerator");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v33;
          objc_msgSend(v47, "allObjects");
          v48 = objc_claimAutoreleasedReturnValue();

          v17 = (NSArray *)v48;
          v20 = v19;
        }

        ++v19;
      }
      v49 = v67 >= 1.0 || v21 < 1;
      v50 = v49;
      if (v49)
      {
        v51 = 0;
        v52 = v66;
      }
      else
      {
        v53 = _areSetsBasicallyDuplicates(v6, v18);
        v52 = v66;
        if ((v53 & 1) != 0)
        {
          v51 = 0;
        }
        else
        {
          -[NSArray arrayByAddingObjectsFromArray:](v18, "arrayByAddingObjectsFromArray:", v6);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "replaceObjectAtIndex:withObject:", i, v54);
          v51 = v54;

          v6 = v51;
        }
        objc_msgSend(v65, "removeObjectAtIndex:", v21);
        v20 -= v21 < v20;
        --i;
      }
      if (v20 == v21)
        v55 = v50;
      else
        v55 = 1;
      if (v52 >= 1.0 || v20 < 1 || v55 == 0)
      {
        v58 = v51;
      }
      else
      {
        v59 = _areSetsBasicallyDuplicates(v17, v6);
        if ((v59 & 1) != 0)
        {
          v60 = v6;
        }
        else
        {
          -[NSArray arrayByAddingObjectsFromArray:](v6, "arrayByAddingObjectsFromArray:", v17);
          v60 = (NSArray *)objc_claimAutoreleasedReturnValue();
        }
        v58 = v60;

        v61 = i + (v50 ^ 1u);
        objc_msgSend(v65, "replaceObjectAtIndex:withObject:", v61, v58);
        objc_msgSend(v65, "removeObjectAtIndex:", v20);
        i = v61 - 1;
      }

    }
  }

}

- (void)_updatePath
{
  float v3;
  NSMutableArray *v4;
  NSMutableArray *expandedPaths;
  NSMutableArray *v6;
  NSMutableArray *originalPaths;
  NSMutableArray *v8;
  NSMutableArray *gutterPaths;
  void *v10;
  VKRoadFeatureAccessibilityElement *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  const void *v22;
  const void *v23;
  const void *v24;
  float v25;
  float v26;
  id v27;
  uint64_t Count;
  double *UnderlyingArray;
  double *v30;
  double *v31;
  uint64_t v32;
  unint64_t k;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  double v42;
  double v43;
  void *v44;
  id v45;
  NSMutableArray *v46;
  id v47;
  NSMutableArray *v48;
  id v49;
  NSMutableArray *v50;
  id v51;
  double x;
  double y;
  double width;
  double height;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  CGFloat v59;
  CGFloat v60;
  CGFloat v61;
  CGFloat v62;
  CGFloat v63;
  void *v64;
  const void *v65;
  uint64_t v66;
  unint64_t v67;
  id obj;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  id v73;
  id v74;
  uint64_t j;
  VKRoadFeatureAccessibilityElement *v76;
  id v77;
  _QWORD v78[6];
  id v79;
  _QWORD *v80;
  _QWORD *v81;
  _QWORD *v82;
  uint64_t v83;
  const void *v84;
  const void *v85;
  const void *v86;
  float v87;
  uint64_t v88;
  _QWORD v89[3];
  char v90;
  _QWORD v91[3];
  char v92;
  _QWORD v93[6];
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  _BYTE v103[128];
  _BYTE v104[128];
  uint64_t v105;
  CGRect PathBoundingBox;
  CGRect v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;

  v105 = *MEMORY[0x24BDAC8D0];
  -[VKFeatureAccessibilityElement strokeWidth](self, "strokeWidth");
  if (v3 != 0.0)
  {
    if (!self->_expandedPaths)
    {
      v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      expandedPaths = self->_expandedPaths;
      self->_expandedPaths = v4;

      v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      originalPaths = self->_originalPaths;
      self->_originalPaths = v6;

      v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      gutterPaths = self->_gutterPaths;
      self->_gutterPaths = v8;

    }
    -[VKFeatureAccessibilityElement setHitTestPaths:](self, "setHitTestPaths:", 0);
    v76 = self;
    -[VKFeatureAccessibilityElement paths](self, "paths");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeAllObjects");

    -[NSMutableArray removeAllObjects](v76->_originalPaths, "removeAllObjects");
    -[NSMutableArray removeAllObjects](v76->_expandedPaths, "removeAllObjects");
    -[NSMutableArray removeAllObjects](v76->_gutterPaths, "removeAllObjects");
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = 0u;
    v102 = 0u;
    v99 = 0u;
    v100 = 0u;
    v11 = v76;
    -[VKFeatureAccessibilityElement featureSet](v76, "featureSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v99, v104, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v100;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v100 != v14)
            objc_enumerationMutation(v12);
          -[VKFeatureAccessibilityElement pointsFromFeatureWrapper:](v11, "pointsFromFeatureWrapper:", *(_QWORD *)(*((_QWORD *)&v99 + 1) + 8 * i));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v16, "count"))
            objc_msgSend(v69, "addObject:", v16);

          v11 = v76;
        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v99, v104, 16);
      }
      while (v13);
    }

    -[VKRoadFeatureAccessibilityElement _combineRoadPaths:](v76, "_combineRoadPaths:", v69);
    -[VKRoadFeatureAccessibilityElement accessibilityContainer](v76, "accessibilityContainer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "accessibilityClearVisibleAXBoundsFrame");

    v97 = 0u;
    v98 = 0u;
    v95 = 0u;
    v96 = 0u;
    obj = v69;
    v71 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v95, v103, 16);
    if (v71)
    {
      v70 = *(_QWORD *)v96;
      do
      {
        for (j = 0; j != v71; ++j)
        {
          if (*(_QWORD *)v96 != v70)
            objc_enumerationMutation(obj);
          v18 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * j);
          v77 = (id)objc_opt_new();
          v19 = (void *)objc_opt_new();
          v72 = (void *)objc_opt_new();
          v20 = (void *)objc_opt_new();
          v21 = objc_msgSend(v18, "count");
          v22 = (const void *)AXCArrayCreate();
          v23 = (const void *)AXCArrayCreate();
          v24 = (const void *)AXCArrayCreate();
          v93[0] = 0;
          v93[1] = v93;
          v93[2] = 0x4012000000;
          v93[3] = __Block_byref_object_copy__450;
          v93[4] = __Block_byref_object_dispose__451;
          v93[5] = &unk_232B640CA;
          v94 = *MEMORY[0x24BDBEFB0];
          -[VKFeatureAccessibilityElement strokeWidth](v76, "strokeWidth");
          v26 = v25 + 4.0;
          v91[0] = 0;
          v91[1] = v91;
          v91[2] = 0x2020000000;
          v92 = 0;
          v89[0] = 0;
          v89[1] = v89;
          v89[2] = 0x2020000000;
          v90 = 0;
          v78[0] = MEMORY[0x24BDAC760];
          v78[1] = 3221225472;
          v78[2] = __48__VKRoadFeatureAccessibilityElement__updatePath__block_invoke;
          v78[3] = &unk_2503C4F40;
          v80 = v93;
          v81 = v89;
          v78[4] = v76;
          v78[5] = v18;
          v82 = v91;
          v83 = v21;
          v27 = v72;
          v87 = v26;
          v88 = 0x4248000042960000;
          v73 = v27;
          v79 = v27;
          v84 = v22;
          v85 = v23;
          v86 = v24;
          objc_msgSend(v18, "enumerateObjectsUsingBlock:", v78);
          Count = AXCArrayGetCount();
          if (Count >= 1)
          {
            if (!AXCArrayGetCount())
            {
              v66 = AXCArrayGetCount();
              v67 = 0;
              v65 = v22;
              _AXAssert();
            }
            UnderlyingArray = (double *)_AXCArrayGetUnderlyingArray();
            objc_msgSend(v77, "moveToPoint:", *UnderlyingArray, UnderlyingArray[1]);
            if (!AXCArrayGetCount())
            {
              v66 = AXCArrayGetCount();
              v67 = 0;
              v65 = v23;
              _AXAssert();
            }
            v30 = (double *)_AXCArrayGetUnderlyingArray();
            objc_msgSend(v19, "moveToPoint:", *v30, v30[1]);
            if (!AXCArrayGetCount())
            {
              v66 = AXCArrayGetCount();
              v67 = 0;
              v65 = v24;
              _AXAssert();
            }
            v31 = (double *)_AXCArrayGetUnderlyingArray();
            objc_msgSend(v20, "moveToPoint:", *v31, v31[1]);
            if ((unint64_t)Count >= 2)
            {
              v32 = 0;
              for (k = 1; k != Count; ++k)
              {
                if (k >= AXCArrayGetCount())
                {
                  v66 = AXCArrayGetCount();
                  v67 = k;
                  v65 = v22;
                  _AXAssert();
                }
                v34 = _AXCArrayGetUnderlyingArray();
                objc_msgSend(v77, "addLineToPoint:", *(double *)(v34 + v32 + 32), *(double *)(v34 + v32 + 40));
                if (k >= AXCArrayGetCount())
                {
                  v66 = AXCArrayGetCount();
                  v67 = k;
                  v65 = v23;
                  _AXAssert();
                }
                v35 = _AXCArrayGetUnderlyingArray();
                objc_msgSend(v19, "addLineToPoint:", *(double *)(v35 + v32 + 32), *(double *)(v35 + v32 + 40));
                if (k >= AXCArrayGetCount())
                {
                  v66 = AXCArrayGetCount();
                  v67 = k;
                  v65 = v24;
                  _AXAssert();
                }
                v36 = _AXCArrayGetUnderlyingArray();
                objc_msgSend(v20, "addLineToPoint:", *(double *)(v36 + v32 + 32), *(double *)(v36 + v32 + 40));
                v32 += 32;
              }
            }
          }
          v37 = AXCArrayGetCount();
          v38 = 32 * v37 - 8;
          while (v37 > 0)
          {
            if (--v37 >= (unint64_t)AXCArrayGetCount())
            {
              v66 = AXCArrayGetCount();
              v67 = v37;
              v65 = v22;
              _AXAssert();
            }
            v39 = _AXCArrayGetUnderlyingArray();
            objc_msgSend(v77, "addLineToPoint:", *(double *)(v39 + v38 - 8), *(double *)(v39 + v38));
            if (v37 >= (unint64_t)AXCArrayGetCount())
            {
              v66 = AXCArrayGetCount();
              v67 = v37;
              v65 = v23;
              _AXAssert();
            }
            v40 = _AXCArrayGetUnderlyingArray();
            objc_msgSend(v19, "addLineToPoint:", *(double *)(v40 + v38 - 8), *(double *)(v40 + v38));
            if (v37 >= (unint64_t)AXCArrayGetCount())
            {
              v66 = AXCArrayGetCount();
              v67 = v37;
              v65 = v24;
              _AXAssert();
            }
            v41 = _AXCArrayGetUnderlyingArray();
            v42 = *(double *)(v41 + v38 - 8);
            v43 = *(double *)(v41 + v38);
            v38 -= 32;
            objc_msgSend(v20, "addLineToPoint:", v42, v43);
          }
          if ((objc_msgSend(v77, "isEmpty") & 1) == 0)
            objc_msgSend(v77, "closePath");
          if ((objc_msgSend(v19, "isEmpty", v65, v66, v67) & 1) == 0)
            objc_msgSend(v19, "closePath");
          if ((objc_msgSend(v20, "isEmpty") & 1) == 0)
            objc_msgSend(v20, "closePath");
          objc_msgSend(v77, "setFlatness:", 0.6);
          -[VKFeatureAccessibilityElement paths](v76, "paths");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = objc_retainAutorelease(v77);
          objc_msgSend(v44, "addObject:", objc_msgSend(v45, "CGPath"));

          v46 = v76->_expandedPaths;
          v47 = objc_retainAutorelease(v19);
          -[NSMutableArray addObject:](v46, "addObject:", objc_msgSend(v47, "CGPath"));
          v48 = v76->_originalPaths;
          v49 = objc_retainAutorelease(v73);
          -[NSMutableArray addObject:](v48, "addObject:", objc_msgSend(v49, "CGPath"));
          v50 = v76->_gutterPaths;
          v74 = objc_retainAutorelease(v20);
          -[NSMutableArray addObject:](v50, "addObject:", objc_msgSend(v74, "CGPath"));
          v51 = objc_retainAutorelease(v45);
          PathBoundingBox = CGPathGetPathBoundingBox((CGPathRef)objc_msgSend(v51, "CGPath"));
          x = PathBoundingBox.origin.x;
          y = PathBoundingBox.origin.y;
          width = PathBoundingBox.size.width;
          height = PathBoundingBox.size.height;
          -[VKRoadFeatureAccessibilityElement accessibilityFrame](v76, "accessibilityFrame");
          v57 = v56;
          v59 = v58;
          v61 = v60;
          v63 = v62;
          v109.origin.x = v56;
          v109.origin.y = v58;
          v109.size.width = v60;
          v109.size.height = v62;
          if (!CGRectEqualToRect(*MEMORY[0x24BDBF090], v109))
          {
            v107.origin.x = v57;
            v107.origin.y = v59;
            v107.size.width = v61;
            v107.size.height = v63;
            v110.origin.x = x;
            v110.origin.y = y;
            v110.size.width = width;
            v110.size.height = height;
            v108 = CGRectUnion(v107, v110);
            x = v108.origin.x;
            y = v108.origin.y;
            width = v108.size.width;
            height = v108.size.height;
          }
          -[VKRoadFeatureAccessibilityElement setAccessibilityFrame:](v76, "setAccessibilityFrame:", x, y, width, height);
          if (v22)
            CFRelease(v22);
          if (v23)
            CFRelease(v23);
          if (v24)
            CFRelease(v24);

          _Block_object_dispose(v89, 8);
          _Block_object_dispose(v91, 8);
          _Block_object_dispose(v93, 8);

        }
        v71 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v95, v103, 16);
      }
      while (v71);
    }

    -[VKFeatureAccessibilityElement _mergePaths](v76, "_mergePaths");
    -[VKRoadFeatureAccessibilityElement accessibilityContainer](v76, "accessibilityContainer");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "accessibilityClearVisibleAXBoundsFrame");

  }
}

void __48__VKRoadFeatureAccessibilityElement__updatePath__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  void *v12;
  char v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BOOL4 v19;
  double v20;
  double v21;
  float v22;
  __float2 v23;
  float v24;
  float v25;
  double v26;
  float v27;
  double v28;
  float v29;
  __float2 v30;
  double *v31;
  double *v32;
  double *v33;
  double *v34;
  double *v35;
  double *v36;
  uint64_t Count;
  _OWORD *v38;
  uint64_t v39;
  _OWORD *v40;
  uint64_t v41;
  _OWORD *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  double v46;
  double v47;
  double *v48;
  double v49;
  double v50;
  BOOL v51;
  void *v52;
  double v53;
  double v54;
  void *v55;
  char v56;
  CGPath *Mutable;
  double v58;
  double v59;
  double v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  double v67[2];
  double v68[2];
  double v69[2];
  double v70[2];
  double v71[2];
  double v72[2];
  double v73;
  double v74;
  CGPoint v75;

  v5 = a2;
  objc_msgSend(v5, "CGPointValue");
  v8 = v7;
  v9 = v6;
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  if (*(double *)(v10 + 48) == v7 && *(double *)(v10 + 56) == v6)
    goto LABEL_43;
  objc_msgSend(*(id *)(a1 + 32), "accessibilityContainer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "accessibilityViewBoundsContainsPathPoint:", v8, v9);

  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  if ((v13 & 1) != 0)
  {
    *(_BYTE *)(v14 + 24) = 0;
LABEL_7:
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) || *(uint64_t *)(a1 + 80) < 2)
    {
      objc_msgSend(*(id *)(a1 + 48), "addLineToPoint:", v8, v9);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "CGPointValue");
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      *(_QWORD *)(v16 + 48) = v17;
      *(_QWORD *)(v16 + 56) = v18;

      objc_msgSend(*(id *)(a1 + 48), "moveToPoint:", v8, v9);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
    }
    v73 = 0.0;
    v74 = 0.0;
    v75.x = v8;
    v75.y = v9;
    AXVKMathGetVectorAndDistanceForPoints(&v74, &v73, *(CGPoint *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 48), v75);
    v19 = a3 == 0;
    v20 = dbl_232B5BD10[v19] + v74;
    if (v20 <= 360.0)
      v21 = dbl_232B5BD10[v19] + v74;
    else
      v21 = v20 + -360.0;
    v22 = v21 * 0.0174532924;
    v23 = __sincosf_stret(v22);
    v24 = *(float *)(a1 + 112);
    v25 = *(float *)(a1 + 116);
    v72[0] = v8 + (float)(v24 * v23.__cosval);
    v72[1] = v9 + (float)(v24 * v23.__sinval);
    v60 = v9;
    v71[0] = v8 + (float)(v23.__cosval * v25);
    v71[1] = v9 + (float)(v23.__sinval * v25);
    v26 = v8;
    v27 = *(float *)(a1 + 120);
    v70[0] = v26 + (float)(v23.__cosval * v27);
    v70[1] = v60 + (float)(v23.__sinval * v27);
    v28 = dbl_232B5BD20[v19] + v21;
    if (v28 < 0.0)
      v28 = v28 + 360.0;
    v74 = v28;
    v29 = v28 * 0.0174532924;
    v30 = __sincosf_stret(v29);
    v69[0] = v26 + (float)(v24 * v30.__cosval);
    v69[1] = v60 + (float)(v24 * v30.__sinval);
    v68[0] = v26 + (float)(v25 * v30.__cosval);
    v68[1] = v60 + (float)(v25 * v30.__sinval);
    v67[0] = v26 + (float)(v30.__cosval * v27);
    v67[1] = v60 + (float)(v30.__sinval * v27);
    if (CGFloatIsValid() && (CGFloatIsValid() & 1) != 0)
      v31 = v72;
    else
      v31 = (double *)MEMORY[0x24BDBEFB0];
    v65 = *(_OWORD *)v31;
    if (CGFloatIsValid() && (CGFloatIsValid() & 1) != 0)
      v32 = v69;
    else
      v32 = (double *)MEMORY[0x24BDBEFB0];
    v66 = *(_OWORD *)v32;
    if (CGFloatIsValid() && (CGFloatIsValid() & 1) != 0)
      v33 = v71;
    else
      v33 = (double *)MEMORY[0x24BDBEFB0];
    v63 = *(_OWORD *)v33;
    if (CGFloatIsValid() && (CGFloatIsValid() & 1) != 0)
      v34 = v68;
    else
      v34 = (double *)MEMORY[0x24BDBEFB0];
    v64 = *(_OWORD *)v34;
    if (CGFloatIsValid() && (CGFloatIsValid() & 1) != 0)
      v35 = v70;
    else
      v35 = (double *)MEMORY[0x24BDBEFB0];
    v61 = *(_OWORD *)v35;
    if (CGFloatIsValid() && (CGFloatIsValid() & 1) != 0)
      v36 = v67;
    else
      v36 = (double *)MEMORY[0x24BDBEFB0];
    v62 = *(_OWORD *)v36;
    Count = AXCArrayGetCount();
    _AXCArrayPrepareForInsertingElementAtIndex();
    v38 = (_OWORD *)(_AXCArrayGetUnderlyingArray() + 32 * Count);
    *v38 = v65;
    v38[1] = v66;
    v39 = AXCArrayGetCount();
    _AXCArrayPrepareForInsertingElementAtIndex();
    v40 = (_OWORD *)(_AXCArrayGetUnderlyingArray() + 32 * v39);
    *v40 = v63;
    v40[1] = v64;
    v41 = AXCArrayGetCount();
    _AXCArrayPrepareForInsertingElementAtIndex();
    v42 = (_OWORD *)(_AXCArrayGetUnderlyingArray() + 32 * v41);
    *v42 = v61;
    v42[1] = v62;
    v43 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    *(double *)(v43 + 48) = v26;
    *(double *)(v43 + 56) = v60;
    goto LABEL_43;
  }
  if (*(_BYTE *)(v14 + 24))
  {
    *(_BYTE *)(v14 + 24) = 1;
    goto LABEL_43;
  }
  objc_msgSend(*(id *)(a1 + 32), "accessibilityContainer");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "accessibilityVisibleAXViewBounds");

  v45 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v46 = *(double *)(v45 + 48);
  v47 = *(double *)(v45 + 56);
  v48 = (double *)MEMORY[0x24BDBEFB0];
  v49 = *MEMORY[0x24BDBEFB0];
  v50 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  v51 = *MEMORY[0x24BDBEFB0] == v46 && v50 == v47;
  if (v51 && objc_msgSend(*(id *)(a1 + 40), "count", v49, v50) - 1 > a3)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", a3 + 1);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "CGPointValue");
    v46 = v53;
    v47 = v54;

  }
  objc_msgSend(*(id *)(a1 + 32), "accessibilityContainer", v49, v50);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v55, "accessibilityViewBoundsContainsPathPoint:", v46, v47);

  if ((v56 & 1) != 0)
  {
    Mutable = CGPathCreateMutable();
    CGPathMoveToPoint(Mutable, 0, v46, v47);
    CGPathAddLineToPoint(Mutable, 0, v8, v9);
    AX_CGPathGetIntersectionPointWithRect();
    if (v58 != 3.40282347e38 && (*v48 != v58 || v48[1] != v59))
    {
      v9 = v59;
      v8 = v58;
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    CGPathRelease(Mutable);
    goto LABEL_7;
  }
LABEL_43:

}

- (id)accessibilityPaths
{
  void *v3;
  uint64_t v4;

  -[VKFeatureAccessibilityElement paths](self, "paths");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    -[VKRoadFeatureAccessibilityElement _updatePath](self, "_updatePath");
  return -[VKFeatureAccessibilityElement paths](self, "paths");
}

- (CGRect)accessibilityFrame
{
  void *v3;
  uint64_t v4;
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
  objc_super v18;
  CGRect result;

  -[VKFeatureAccessibilityElement paths](self, "paths");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    -[VKRoadFeatureAccessibilityElement _updatePath](self, "_updatePath");
  v18.receiver = self;
  v18.super_class = (Class)VKRoadFeatureAccessibilityElement;
  -[VKRoadFeatureAccessibilityElement accessibilityUserDefinedFrame](&v18, sel_accessibilityUserDefinedFrame);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "CGRectValue");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (float)_accessibilityDistance:(CGPoint)a3 forAngle:(float)a4 toRoad:(id)a5
{
  double y;
  double x;
  id v9;
  void *v10;
  double v11;
  float v12;
  float v13;

  y = a3.y;
  x = a3.x;
  v9 = a5;
  -[VKRoadFeatureAccessibilityElement accessibilityContainer](self, "accessibilityContainer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v11 = a4;
  objc_msgSend(v10, "accessibilityDistance:forAngle:toRoad:withElement:", v9, self, x, y, v11);
  v13 = v12;

  return v13;
}

- (id)_accessibilityUpcomingRoadsForPoint:(CGPoint)a3 forAngle:(float)a4
{
  double y;
  double x;
  void *v8;
  double v9;
  void *v10;

  y = a3.y;
  x = a3.x;
  -[VKRoadFeatureAccessibilityElement accessibilityContainer](self, "accessibilityContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v9 = a4;
  objc_msgSend(v8, "accessibilityUpcomingRoadsForPoint:forAngle:withElement:", self, x, y, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)_accessibilityMapsExplorationBeginFromCurrentElement
{
  void *v3;
  id v4;

  -[VKRoadFeatureAccessibilityElement accessibilityContainer](self, "accessibilityContainer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityElementManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityMapsExplorationBeginFromRoad:", self);

}

- (NSArray)consolidatedAndOrderedFeatures
{
  NSArray *consolidatedAndOrderedFeatures;
  void *v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  uint64_t v15;
  void *v16;
  NSArray *v17;
  NSArray *v18;
  NSArray *v19;
  id obj;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  consolidatedAndOrderedFeatures = self->_consolidatedAndOrderedFeatures;
  if (consolidatedAndOrderedFeatures)
    return consolidatedAndOrderedFeatures;
  v21 = (void *)objc_opt_new();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[VKFeatureAccessibilityElement featureSet](self, "featureSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  obj = v5;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v6)
  {
    v22 = *(_QWORD *)v29;
    do
    {
      v23 = v6;
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v29 != v22)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
        -[VKFeatureAccessibilityElement pointsFromFeatureWrapper:](self, "pointsFromFeatureWrapper:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)objc_msgSend(v9, "mutableCopy");

        if (objc_msgSend(v10, "count"))
        {
          objc_msgSend(v21, "addObject:", v10);
          v26 = 0u;
          v27 = 0u;
          v24 = 0u;
          v25 = 0u;
          v11 = v10;
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          if (v12)
          {
            v13 = *(_QWORD *)v25;
            do
            {
              for (j = 0; j != v12; ++j)
              {
                if (*(_QWORD *)v25 != v13)
                  objc_enumerationMutation(v11);
                v15 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j);
                -[VKFeatureAccessibilityElement pointToFeatureDict](self, "pointToFeatureDict");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "setObject:forKey:", v8, v15);

              }
              v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
            }
            while (v12);
          }

        }
      }
      v5 = obj;
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v6);
  }

  -[VKRoadFeatureAccessibilityElement consolidatedAndOrderedFeaturesFromAllFeaturePoints:](self, "consolidatedAndOrderedFeaturesFromAllFeaturePoints:", v21);
  v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v18 = self->_consolidatedAndOrderedFeatures;
  self->_consolidatedAndOrderedFeatures = v17;

  v19 = self->_consolidatedAndOrderedFeatures;
  return v19;
}

- (id)consolidatedAndOrderedFeaturesFromAllFeaturePoints:(id)a3
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v43 = a3;
  v42 = (id)objc_opt_new();
LABEL_2:
  if (objc_msgSend(v43, "count", v42))
  {
    objc_msgSend(v43, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "removeObject:", v3);
    v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v5 = v43;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    if (!v6)
      goto LABEL_25;
    v7 = *(_QWORD *)v45;
    while (1)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v45 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v8);
        objc_msgSend(v3, "firstObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "CGPointValue");
        v12 = v11;
        v14 = v13;

        objc_msgSend(v3, "lastObject");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "CGPointValue");
        v17 = v16;
        v19 = v18;

        objc_msgSend(v9, "firstObject");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "CGPointValue");
        v22 = v21;
        v24 = v23;

        objc_msgSend(v9, "lastObject");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "CGPointValue");
        v27 = v26;
        v29 = v28;

        if (v12 == v22 && v14 == v24)
        {
          objc_msgSend(v3, "reverseObjectEnumerator");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "allObjects");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v31, "mutableCopy");

          v33 = v9;
          goto LABEL_14;
        }
        if (v12 == v27 && v14 == v29)
        {
          objc_msgSend(v3, "reverseObjectEnumerator");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "allObjects");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v35, "mutableCopy");

          objc_msgSend(v9, "reverseObjectEnumerator");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "allObjects");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = (id)objc_msgSend(v37, "mutableCopy");

LABEL_14:
          v3 = (void *)v32;
LABEL_15:
          objc_msgSend(v33, "removeObjectAtIndex:", 0);
          objc_msgSend(v3, "addObjectsFromArray:", v33);
          objc_msgSend(v4, "addObject:", v9);
          goto LABEL_16;
        }
        if (v17 == v22 && v19 == v24)
        {
          v33 = v9;
          goto LABEL_15;
        }
        v33 = 0;
        if (v17 == v27 && v19 == v29)
        {
          objc_msgSend(v9, "reverseObjectEnumerator");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "allObjects");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = (id)objc_msgSend(v39, "mutableCopy");

          goto LABEL_15;
        }
LABEL_16:

        ++v8;
      }
      while (v6 != v8);
      v40 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
      v6 = v40;
      if (!v40)
      {
LABEL_25:

        objc_msgSend(v5, "removeObjectsInArray:", v4);
        objc_msgSend(v42, "addObject:", v3);

        goto LABEL_2;
      }
    }
  }

  return v42;
}

- (AXVKFeaturePointIndices)featureAndPointIndicesForPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  float v21;
  double v22;
  int64_t v23;
  int64_t v24;
  AXVKFeaturePointIndices result;

  y = a3.y;
  x = a3.x;
  -[VKRoadFeatureAccessibilityElement consolidatedAndOrderedFeatures](self, "consolidatedAndOrderedFeatures");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  if (v7 < 1)
  {
    v9 = -1;
    v11 = -1;
  }
  else
  {
    v8 = 0;
    v9 = -1;
    v10 = 1.79769313e308;
    v11 = -1;
    while (1)
    {
      objc_msgSend(v6, "objectAtIndex:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");
      if (v13 >= 1)
        break;
LABEL_10:

      if (++v8 == v7)
        goto LABEL_14;
    }
    v14 = 0;
    while (1)
    {
      objc_msgSend(v12, "objectAtIndex:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "CGPointValue");
      v17 = v16;
      v19 = v18;

      if (vabdd_f64(x, v17) < 0.001 && vabdd_f64(y, v19) < 0.001)
        break;
      -[VKRoadFeatureAccessibilityElement accessibilityContainer](self, "accessibilityContainer");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "accessibilityRealDistanceBetweenPoint:screenPoint2:", x, y, v17, v19);
      v22 = v21;

      if (v10 > v22)
      {
        v11 = v8;
        v9 = v14;
        v10 = v22;
      }
      if (v13 == ++v14)
        goto LABEL_10;
    }

    v9 = v14;
    v11 = v8;
  }
LABEL_14:

  v23 = v11;
  v24 = v9;
  result.var1 = v24;
  result.var0 = v23;
  return result;
}

- (id)adjacentIntersectorsForPoint:(CGPoint)a3 isStart:(BOOL)a4
{
  _BOOL8 v4;
  double y;
  double x;
  void *v8;
  void *v9;

  v4 = a4;
  y = a3.y;
  x = a3.x;
  -[VKRoadFeatureAccessibilityElement accessibilitySortedIntersectorsForPoint:](self, "accessibilitySortedIntersectorsForPoint:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKRoadFeatureAccessibilityElement accessibilityViableIntersectorsForPoint:fromSortedArray:isStart:](self, "accessibilityViableIntersectorsForPoint:fromSortedArray:isStart:", v8, v4, x, y);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)accessibilitySortedIntersectorsForPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[7];

  y = a3.y;
  x = a3.x;
  -[VKRoadFeatureAccessibilityElement accessibilityContainer](self, "accessibilityContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessibilityIntersectorsForRoad:withPoint:", self, x, y);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __77__VKRoadFeatureAccessibilityElement_accessibilitySortedIntersectorsForPoint___block_invoke;
  v10[3] = &unk_2503C4F68;
  v10[4] = self;
  *(double *)&v10[5] = x;
  *(double *)&v10[6] = y;
  objc_msgSend(v7, "sortedArrayUsingComparator:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __77__VKRoadFeatureAccessibilityElement_accessibilitySortedIntersectorsForPoint___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double DistanceBetweenPoints;
  CGPoint v19;
  CGPoint v20;

  v5 = a2;
  v6 = a3;
  if ((objc_msgSend(v5, "isDeadEnd") & 1) != 0)
  {
    v7 = 1;
  }
  else if ((objc_msgSend(v6, "isDeadEnd") & 1) != 0)
  {
    v7 = -1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "accessibilityContainer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "coordinates");
    objc_msgSend(v8, "accessibilityConvertCoordinateToWindow:");
    v10 = v9;
    v12 = v11;
    objc_msgSend(v6, "coordinates");
    objc_msgSend(v8, "accessibilityConvertCoordinateToWindow:");
    v14 = v13;
    v16 = v15;
    v19.x = v10;
    v19.y = v12;
    DistanceBetweenPoints = AXVKMathGetDistanceBetweenPoints(*(CGPoint *)(a1 + 40), v19);
    v20.x = v14;
    v20.y = v16;
    if (DistanceBetweenPoints >= AXVKMathGetDistanceBetweenPoints(*(CGPoint *)(a1 + 40), v20))
      v7 = 1;
    else
      v7 = -1;

  }
  return v7;
}

- (id)accessibilityViableIntersectorsForPoint:(CGPoint)a3 fromSortedArray:(id)a4 isStart:(BOOL)a5
{
  double y;
  double x;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  _BOOL4 v33;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v33 = a5;
  y = a3.y;
  x = a3.x;
  v40 = *MEMORY[0x24BDAC8D0];
  obj = a4;
  v8 = (void *)objc_opt_new();
  if (objc_msgSend(obj, "count"))
  {
    objc_msgSend(obj, "subarrayWithRange:", !v33, objc_msgSend(obj, "count") - !v33);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = -[VKRoadFeatureAccessibilityElement featureAndPointIndicesForPoint:](self, "featureAndPointIndicesForPoint:", x, y);
    v12 = v11;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    obj = v9;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v36;
      v15 = -1;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v36 != v14)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          -[VKRoadFeatureAccessibilityElement accessibilityContainer](self, "accessibilityContainer");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "coordinates");
          objc_msgSend(v18, "accessibilityConvertCoordinateToWindow:");
          v20 = v19;
          v22 = v21;

          if ((vabdd_f64(x, v20) >= 0.001 || vabdd_f64(y, v22) >= 0.001)
            && -[VKRoadFeatureAccessibilityElement featureAndPointIndicesForPoint:](self, "featureAndPointIndicesForPoint:", v20, v22) == v10)
          {
            v24 = v23;
            if (objc_msgSend(v8, "count") != 1 || (v15 <= v12 || v24 <= v12) && (v15 >= v12 || v24 >= v12))
            {
              objc_msgSend(v8, "addObject:", v17);
              if (v33 && objc_msgSend(v8, "count") || objc_msgSend(v8, "count") == 2)
                goto LABEL_22;
              if (objc_msgSend(v8, "count") == 1)
              {
                objc_msgSend(v8, "firstObject");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                -[VKRoadFeatureAccessibilityElement accessibilityContainer](self, "accessibilityContainer");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "coordinates");
                objc_msgSend(v26, "accessibilityConvertCoordinateToWindow:");
                v28 = v27;
                v30 = v29;

                -[VKRoadFeatureAccessibilityElement featureAndPointIndicesForPoint:](self, "featureAndPointIndicesForPoint:", v28, v30);
                v15 = v31;

              }
            }
          }
        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      }
      while (v13);
    }
LABEL_22:

  }
  return v8;
}

- (float)_accessibilityDistanceFromEndOfRoad:(CGPoint)a3 forAngle:(float)a4
{
  double y;
  double x;
  void *v8;
  double v9;
  float v10;
  float v11;

  y = a3.y;
  x = a3.x;
  -[VKRoadFeatureAccessibilityElement accessibilityContainer](self, "accessibilityContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v9 = a4;
  objc_msgSend(v8, "accessibilityDistanceToEndOfRoad:forAngle:withElement:", self, x, y, v9);
  v11 = v10;

  return v11;
}

- (BOOL)_accessibilityRoadContainsTrackingPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;
  CGPoint v25;
  CGPoint v26;

  y = a3.y;
  x = a3.x;
  v24 = *MEMORY[0x24BDAC8D0];
  self->_lastHitTestNearBorder = 0;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = self->_gutterPaths;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v6);
        v25.x = x;
        v25.y = y;
        if (CGPathContainsPoint(*(CGPathRef *)(*((_QWORD *)&v18 + 1) + 8 * i), 0, v25, 0))
        {
          LOBYTE(v10) = 1;
          goto LABEL_20;
        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      if (v7)
        continue;
      break;
    }
  }

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = self->_expandedPaths;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v15;
    while (2)
    {
      for (j = 0; j != v10; ++j)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v6);
        v26.x = x;
        v26.y = y;
        if (CGPathContainsPoint(*(CGPathRef *)(*((_QWORD *)&v14 + 1) + 8 * j), 0, v26, 0))
        {
          LOBYTE(v10) = 1;
          self->_lastHitTestNearBorder = 1;
          goto LABEL_20;
        }
      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_20:

  return v10;
}

- (id)_nearestPOIsForPoint:(CGPoint)a3
{
  return 0;
}

- (id)_roadLength
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  float v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  int v18;
  void *v19;
  char v20;
  void *v21;
  float v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[VKFeatureAccessibilityElement featureSet](self, "featureSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v26;
    v6 = 0.0;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v26 != v5)
          objc_enumerationMutation(v3);
        -[VKFeatureAccessibilityElement pointsFromFeatureWrapper:](self, "pointsFromFeatureWrapper:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[VKRoadFeatureAccessibilityElement accessibilityContainer](self, "accessibilityContainer");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectAtIndex:", 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "CGPointValue");
        v12 = v11;
        v14 = v13;
        objc_msgSend(v8, "lastObject");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "CGPointValue");
        objc_msgSend(v9, "accessibilityRealDistanceBetweenPoint:screenPoint2:", v12, v14, v16, v17);
        LODWORD(v12) = v18;

        v6 = v6 + *(float *)&v12;
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v4);
  }
  else
  {
    v6 = 0.0;
  }

  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "_navigation_distanceUsesMetricSystem");

  if ((v20 & 1) != 0)
  {
    AXVectorKitLocString(CFSTR("ROAD_DISTANCE_KM"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v6 / 1000.0;
  }
  else
  {
    AXVectorKitLocString(CFSTR("ROAD_DISTANCE_M"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v6 / 1609.344;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (id)detailedFeatureElementInfoAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  void *v10;

  y = a3.y;
  x = a3.x;
  -[VKRoadFeatureAccessibilityElement _nearestIntersectionForPoint:](self, "_nearestIntersectionForPoint:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKRoadFeatureAccessibilityElement _roadLength](self, "_roadLength");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKRoadFeatureAccessibilityElement _nearestPOIsForPoint:](self, "_nearestPOIsForPoint:", x, y);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)pointInside:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;
  CGPoint v17;
  CGPoint v18;
  CGRect v19;
  CGRect v20;

  y = a3.y;
  x = a3.x;
  v16 = *MEMORY[0x24BDAC8D0];
  -[VKRoadFeatureAccessibilityElement accessibilityFrame](self, "accessibilityFrame");
  v20 = CGRectInset(v19, -40.0, -40.0);
  v20.origin.x = v20.origin.x + -20.0;
  v20.origin.y = v20.origin.y + -20.0;
  v18.x = x;
  v18.y = y;
  if (CGRectContainsPoint(v20, v18))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[VKFeatureAccessibilityElement paths](self, "paths", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v12;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v6);
          v17.x = x;
          v17.y = y;
          if (CGPathContainsPoint(*(CGPathRef *)(*((_QWORD *)&v11 + 1) + 8 * i), 0, v17, 0))
          {
            LOBYTE(v7) = 1;
            goto LABEL_13;
          }
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_13:

  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (id)_nearestIntersectionForPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  float v9;
  void *i;
  void *v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double DistanceBetweenPoints;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;
  CGPoint v29;
  CGPoint v30;

  y = a3.y;
  x = a3.x;
  v28 = *MEMORY[0x24BDAC8D0];
  -[VKRoadFeatureAccessibilityElement intersectingRoads](self, "intersectingRoads");
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v6)
  {
    v7 = 0;
    v8 = *(_QWORD *)v24;
    v9 = 3.4028e38;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v11, "objectAtIndex:", 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "CGPointValue");
        v14 = v13;
        v16 = v15;

        v29.x = x;
        v29.y = y;
        v30.x = v14;
        v30.y = v16;
        DistanceBetweenPoints = AXVKMathGetDistanceBetweenPoints(v29, v30);
        if (DistanceBetweenPoints < v9)
        {
          objc_msgSend(v11, "objectAtIndex:", 0);
          v18 = objc_claimAutoreleasedReturnValue();

          v9 = DistanceBetweenPoints;
          v7 = (void *)v18;
        }
      }
      v6 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v6);

    if (!v7)
    {
      v6 = 0;
      goto LABEL_15;
    }
    v19 = (void *)MEMORY[0x24BDD17C8];
    AXVectorKitLocString(CFSTR("NEAREST_INTERSECTION"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accessibilityLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringWithFormat:", v20, v21);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = v5;
  }

LABEL_15:
  return v6;
}

- (id)_roadDirectionDescription
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  char isKindOfClass;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  const __CFString *v22;
  _QWORD v23[6];
  uint64_t v24;
  double *v25;
  uint64_t v26;
  __n128 (*v27)(uint64_t, uint64_t);
  uint64_t (*v28)();
  void *v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[5];
  id v33;

  -[VKRoadFeatureAccessibilityElement roadDirection](self, "roadDirection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    goto LABEL_30;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKFeatureAccessibilityElement featureSet](self, "featureSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __62__VKRoadFeatureAccessibilityElement__roadDirectionDescription__block_invoke;
  v32[3] = &unk_2503C4F90;
  v32[4] = self;
  v7 = v4;
  v33 = v7;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v32);

  -[VKRoadFeatureAccessibilityElement accessibilityContainer](self, "accessibilityContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) == 0)
  {
    v22 = CFSTR("Access to the map view is required to compute road direction");
    LOBYTE(v21) = 1;
    _AXLogWithFacility();
    goto LABEL_29;
  }
  objc_msgSend(v8, "accessibilityYaw");
  if (v10 < 0.0)
    v10 = v10 + 360.0;
  v24 = 0;
  v25 = (double *)&v24;
  if (v10 < 0.0)
    v10 = v10 + 360.0;
  v26 = 0x5012000000;
  v27 = __Block_byref_object_copy__470;
  v28 = __Block_byref_object_dispose__471;
  v29 = &unk_232B640CA;
  v30 = 0u;
  v31 = 0u;
  v23[0] = v6;
  v23[1] = 3221225472;
  v23[2] = __62__VKRoadFeatureAccessibilityElement__roadDirectionDescription__block_invoke_473;
  v23[3] = &unk_2503C4FB8;
  *(double *)&v23[5] = v10;
  v23[4] = &v24;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v23);
  v12 = v25[6];
  v11 = v25[7];
  if (v12 <= v11)
    v13 = v25[7];
  else
    v13 = v25[6];
  v15 = v25[8];
  v14 = v25[9];
  if (v15 <= v14)
    v16 = v25[9];
  else
    v16 = v25[8];
  if (v13 <= v16)
    v13 = v16;
  if (v13 / (v12 + v11 + v15 + v14) >= 0.75)
  {
    if (v12 == v13)
    {
      AXVectorKitLocString(CFSTR("ROAD_DIRECTION_EW"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[VKRoadFeatureAccessibilityElement setRoadDirection:](self, "setRoadDirection:", v17);
LABEL_25:

      goto LABEL_26;
    }
    if (v11 == v13)
    {
      AXVectorKitLocString(CFSTR("ROAD_DIRECTION_NS"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[VKRoadFeatureAccessibilityElement setRoadDirection:](self, "setRoadDirection:", v17);
      goto LABEL_25;
    }
    if (v15 == v13)
    {
      AXVectorKitLocString(CFSTR("ROAD_DIRECTION_NE-SW"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[VKRoadFeatureAccessibilityElement setRoadDirection:](self, "setRoadDirection:", v17);
      goto LABEL_25;
    }
    if (v14 == v13)
    {
      AXVectorKitLocString(CFSTR("ROAD_DIRECTION_NW-SE"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[VKRoadFeatureAccessibilityElement setRoadDirection:](self, "setRoadDirection:", v17);
      goto LABEL_25;
    }
  }
LABEL_26:
  -[VKRoadFeatureAccessibilityElement roadDirection](self, "roadDirection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
    -[VKRoadFeatureAccessibilityElement setRoadDirection:](self, "setRoadDirection:", &stru_2503C5610);
  _Block_object_dispose(&v24, 8);
LABEL_29:

  if ((isKindOfClass & 1) == 0)
  {
    v19 = 0;
    return v19;
  }
LABEL_30:
  -[VKRoadFeatureAccessibilityElement roadDirection](self, "roadDirection", v21, v22);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  return v19;
}

void __62__VKRoadFeatureAccessibilityElement__roadDirectionDescription__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "pointsFromFeatureWrapper:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addObject:");

}

void __62__VKRoadFeatureAccessibilityElement__roadDirectionDescription__block_invoke_473(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  long double *v20;
  BOOL v21;
  double v23;
  double v24;
  double v25;
  CGPoint v26;
  CGPoint v27;

  v3 = a2;
  if ((unint64_t)objc_msgSend(v3, "count") >= 2)
  {
    v4 = objc_msgSend(v3, "count");
    if (v4)
    {
      v5 = 0;
      v23 = 330.0;
      do
      {
        objc_msgSend(v3, "objectAtIndexedSubscript:", v5, *(_QWORD *)&v23);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "CGPointValue");
        v8 = v7;
        v10 = v9;
        v11 = v5 + 1;

        if (v5 + 1 >= v4)
          v12 = v5 - 1;
        else
          v12 = v5 + 1;
        objc_msgSend(v3, "objectAtIndexedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "CGPointValue");
        v15 = v14;
        v17 = v16;

        v26.y = -v10;
        v27.y = -v17;
        v24 = 0.0;
        v25 = 0.0;
        v26.x = v8;
        v27.x = v15;
        AXVKMathGetVectorAndDistanceForPoints(&v25, &v24, v26, v27);
        v18 = *(double *)(a1 + 40) + 360.0 - v25 + dbl_232B5BC90[360.0 - v25 >= 270.0];
        if (v18 > 360.0)
          v18 = v18 + -360.0;
        if (v18 <= 90.0 || v18 > 180.0)
        {
          if (v18 < 270.0 && v18 > 180.0)
            v18 = v18 + -180.0;
        }
        else
        {
          v18 = v18 + 180.0;
        }
        if ((v18 < 270.0 || v18 >= 300.0) && (v18 <= 60.0 || v18 > 90.0))
        {
          if (v18 > v23 && v18 <= 360.0 || (v18 >= 0.0 ? (v21 = v18 < 30.0) : (v21 = 0), v21))
          {
            v20 = (long double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 56);
          }
          else if (v18 < 30.0 || v18 > 60.0)
          {
            if (v18 < 300.0 || v18 > v23)
              goto LABEL_23;
            v20 = (long double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 72);
          }
          else
          {
            v20 = (long double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 64);
          }
        }
        else
        {
          v20 = (long double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48);
        }
        *v20 = v24 + *v20;
LABEL_23:
        v5 = v11;
      }
      while (v4 != v11);
    }
  }

}

- (NSString)roadDirection
{
  return self->_roadDirection;
}

- (void)setRoadDirection:(id)a3
{
  objc_storeStrong((id *)&self->_roadDirection, a3);
}

- (NSArray)intersectingRoads
{
  return self->_intersectingRoads;
}

- (void)setIntersectingRoads:(id)a3
{
  objc_storeStrong((id *)&self->_intersectingRoads, a3);
}

- (int)travelDirection
{
  return self->_travelDirection;
}

- (void)setTravelDirection:(int)a3
{
  self->_travelDirection = a3;
}

- (void)setConsolidatedAndOrderedFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_consolidatedAndOrderedFeatures, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_consolidatedAndOrderedFeatures, 0);
  objc_storeStrong((id *)&self->_intersectingRoads, 0);
  objc_storeStrong((id *)&self->_roadDirection, 0);
  objc_storeStrong((id *)&self->_allPoints, 0);
  objc_storeStrong((id *)&self->_originalPaths, 0);
  objc_storeStrong((id *)&self->_gutterPaths, 0);
  objc_storeStrong((id *)&self->_expandedPaths, 0);
}

@end
