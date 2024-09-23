@implementation AXMLElementCoagulation

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1)
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_81);
  return (id)sharedInstance_Coagulator;
}

void __40__AXMLElementCoagulation_sharedInstance__block_invoke()
{
  AXMLElementCoagulation *v0;
  void *v1;

  v0 = -[AXMLElementCoagulation init]([AXMLElementCoagulation alloc], "init");
  v1 = (void *)sharedInstance_Coagulator;
  sharedInstance_Coagulator = (uint64_t)v0;

}

- (AXMLElementCoagulation)init
{
  AXMLElementCoagulation *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSArray *clickableTextKeywords;
  uint64_t v9;
  NSRegularExpression *nonAlphaCharactersRegex;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)AXMLElementCoagulation;
  v2 = -[AXMLElementCoagulation init](&v12, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend(v3, "pathForResource:ofType:", CFSTR("AXMLElementProperties"), CFSTR("plist"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryWithContentsOfFile:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("clickable_text_keywords"));
    v7 = objc_claimAutoreleasedReturnValue();
    clickableTextKeywords = v2->_clickableTextKeywords;
    v2->_clickableTextKeywords = (NSArray *)v7;

    objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("[^[a-z]]"), 1, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    nonAlphaCharactersRegex = v2->_nonAlphaCharactersRegex;
    v2->_nonAlphaCharactersRegex = (NSRegularExpression *)v9;

    v2->_isiPad = AXDeviceIsPad();
  }
  return v2;
}

- (BOOL)_hasXOverlap:(CGRect)a3 obj2:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  double MaxX;
  double v13;
  BOOL v14;
  double MinX;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.size.height;
  v9 = a3.size.width;
  v10 = a3.origin.y;
  v11 = a3.origin.x;
  MinX = CGRectGetMinX(a3);
  v17.origin.x = v11;
  v17.origin.y = v10;
  v17.size.width = v9;
  v17.size.height = v8;
  MaxX = CGRectGetMaxX(v17);
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  v13 = CGRectGetMinX(v18);
  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  v14 = MinX < CGRectGetMaxX(v19);
  return MaxX > v13 && v14;
}

- (double)_getXOverlap:(CGRect)a3 obj2:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  double MaxX;
  double v14;
  double MinX;
  CGRect v16;
  CGRect v17;
  CGRect v18;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.size.height;
  v9 = a3.size.width;
  v10 = a3.origin.y;
  v11 = a3.origin.x;
  MinX = CGRectGetMinX(a3);
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  v14 = CGRectGetMinX(v16);
  v17.origin.x = v11;
  v17.origin.y = v10;
  v17.size.width = v9;
  v17.size.height = v8;
  MaxX = CGRectGetMaxX(v17);
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  return fmax(fmin(MaxX, CGRectGetMaxX(v18)) - fmax(MinX, v14) + 1.0, 0.0);
}

- (BOOL)_hasYOverlap:(CGRect)a3 obj2:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  double MaxY;
  double v13;
  BOOL v14;
  double MinY;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.size.height;
  v9 = a3.size.width;
  v10 = a3.origin.y;
  v11 = a3.origin.x;
  MinY = CGRectGetMinY(a3);
  v17.origin.x = v11;
  v17.origin.y = v10;
  v17.size.width = v9;
  v17.size.height = v8;
  MaxY = CGRectGetMaxY(v17);
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  v13 = CGRectGetMinY(v18);
  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  v14 = MinY < CGRectGetMaxY(v19);
  return MaxY > v13 && v14;
}

- (double)_getYOverlap:(CGRect)a3 obj2:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  double MaxY;
  double v14;
  double MinY;
  CGRect v16;
  CGRect v17;
  CGRect v18;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.size.height;
  v9 = a3.size.width;
  v10 = a3.origin.y;
  v11 = a3.origin.x;
  MinY = CGRectGetMinY(a3);
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  v14 = CGRectGetMinY(v16);
  v17.origin.x = v11;
  v17.origin.y = v10;
  v17.size.width = v9;
  v17.size.height = v8;
  MaxY = CGRectGetMaxY(v17);
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  return fmax(fmin(MaxY, CGRectGetMaxY(v18)) - fmax(MinY, v14) + 1.0, 0.0);
}

- (id)coagulateElements:(id)a3
{
  id v4;
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
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
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
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  id v64;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  AXMLElementCoagulation *v70;
  id v71;
  id obj;
  uint64_t v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _QWORD v82[4];
  id v83;
  _BYTE v84[128];
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AXMLElementCoagulation screenScale](self, "screenScale");
  v6 = v5;
  -[AXMLElementCoagulation appFrame](self, "appFrame");
  v8 = v6 * v7;
  -[AXMLElementCoagulation screenScale](self, "screenScale");
  v10 = v9;
  -[AXMLElementCoagulation appFrame](self, "appFrame");
  -[AXMLElementCoagulation setCanvasSize:](self, "setCanvasSize:", v8, v10 * v11);
  if ((unint64_t)(-[AXMLElementCoagulation appOrientation](self, "appOrientation") - 3) <= 1)
  {
    -[AXMLElementCoagulation canvasSize](self, "canvasSize");
    v13 = v12;
    -[AXMLElementCoagulation canvasSize](self, "canvasSize");
    -[AXMLElementCoagulation setCanvasSize:](self, "setCanvasSize:", v13, v14);
  }
  objc_msgSend(v4, "ax_filteredArrayUsingBlock:", &__block_literal_global_96_0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "count"))
  {
    v71 = v4;
    -[AXMLElementCoagulation _applyCrossUITypeNMS:](self, "_applyCrossUITypeNMS:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[AXMLElementCoagulation screenScale](self, "screenScale");
    v18 = v17;
    -[AXMLElementCoagulation appFrame](self, "appFrame");
    v20 = v18 * v19;
    -[AXMLElementCoagulation screenScale](self, "screenScale");
    v22 = v21;
    -[AXMLElementCoagulation appFrame](self, "appFrame");
    -[AXMLElementCoagulation _getCandidateTabBarFeatures:screenSize:](self, "_getCandidateTabBarFeatures:screenSize:", v16, v20, v22 * v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v82[0] = MEMORY[0x1E0C809B0];
    v82[1] = 3221225472;
    v82[2] = __44__AXMLElementCoagulation_coagulateElements___block_invoke_2;
    v82[3] = &unk_1E625E268;
    v83 = v24;
    v25 = v24;
    v69 = v16;
    objc_msgSend(v16, "ax_filteredArrayUsingBlock:", v82);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "mutableCopy");

    -[AXMLElementCoagulation _repairTextInTabItems:](self, "_repairTextInTabItems:", v25);
    v28 = objc_claimAutoreleasedReturnValue();

    v67 = (void *)v28;
    -[AXMLElementCoagulation _getAXMLElementGroupsForFeatures:](self, "_getAXMLElementGroupsForFeatures:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMLElementCoagulation _sortFeaturesReadingOrder:](self, "_sortFeaturesReadingOrder:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    -[AXMLElementCoagulation _getGroupedTabBarFeatures:](self, "_getGroupedTabBarFeatures:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = self;
    v68 = (void *)v27;
    -[AXMLElementCoagulation _getAXMLElementGroupsForFeatures:](self, "_getAXMLElementGroupsForFeatures:", v27);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend(v32, "mutableCopy");

    if (objc_msgSend(v30, "count") && !objc_msgSend(v31, "count"))
      objc_msgSend(v33, "addObjectsFromArray:", v30);
    v66 = v30;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    obj = v33;
    v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v85, 16);
    if (v35)
    {
      v36 = v35;
      v73 = *(_QWORD *)v79;
      do
      {
        v37 = 0;
        do
        {
          if (*(_QWORD *)v79 != v73)
            objc_enumerationMutation(obj);
          v38 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * v37);
          v74 = 0u;
          v75 = 0u;
          v76 = 0u;
          v77 = 0u;
          v39 = v31;
          v40 = v31;
          v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v74, v84, 16);
          if (v41)
          {
            v42 = v41;
            v43 = *(_QWORD *)v75;
            do
            {
              v44 = 0;
              do
              {
                if (*(_QWORD *)v75 != v43)
                  objc_enumerationMutation(v40);
                objc_msgSend(*(id *)(*((_QWORD *)&v74 + 1) + 8 * v44), "frame");
                v46 = v45;
                v48 = v47;
                v50 = v49;
                v52 = v51;
                objc_msgSend(v38, "frame");
                if (AXMIsContainedBy(v46, v48, v50, v52, v53, v54, v55, v56, 0.7))
                  objc_msgSend(v34, "addObject:", v38);
                ++v44;
              }
              while (v42 != v44);
              v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v74, v84, 16);
            }
            while (v42);
          }

          ++v37;
          v31 = v39;
        }
        while (v37 != v36);
        v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v85, 16);
      }
      while (v36);
    }

    objc_msgSend(obj, "removeObjectsInArray:", v34);
    -[AXMLElementCoagulation _groupFeatures:](v70, "_groupFeatures:", obj);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMLElementCoagulation _flattenFeatures:](v70, "_flattenFeatures:", v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v58, "ax_filteredArrayUsingBlock:", &__block_literal_global_98);
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    -[AXMLElementCoagulation _improveFeatureFrames:](v70, "_improveFeatureFrames:", v59);
    if (-[AXMLElementCoagulation isRTL](v70, "isRTL"))
    {
      objc_msgSend(v31, "reverseObjectEnumerator");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "allObjects");
      v61 = objc_claimAutoreleasedReturnValue();

      v31 = (void *)v61;
    }
    objc_msgSend(v59, "arrayByAddingObjectsFromArray:", v31);
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v62, "ax_mappedArrayUsingBlock:", &__block_literal_global_100_0);
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    v64 = v63;
    v4 = v71;
  }
  else
  {
    v64 = v15;
  }

  return v64;
}

BOOL __44__AXMLElementCoagulation_coagulateElements___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "featureType") == 22;
}

BOOL __44__AXMLElementCoagulation_coagulateElements___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;

  v3 = a2;
  v4 = (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3) & 1) == 0 && objc_msgSend(v3, "uiClass") != 10;

  return v4;
}

BOOL __44__AXMLElementCoagulation_coagulateElements___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  v2 = a2;
  objc_msgSend(v2, "feature");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "uiClass") == 3)
  {
    objc_msgSend(v2, "feature");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subfeatures");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count") != 0;

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

uint64_t __44__AXMLElementCoagulation_coagulateElements___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "feature");
}

- (id)_getAXMLElementGroupsForFeatures:(id)a3
{
  return (id)objc_msgSend(a3, "ax_mappedArrayUsingBlock:", &__block_literal_global_102_0);
}

AXMMLElementGroup *__59__AXMLElementCoagulation__getAXMLElementGroupsForFeatures___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  AXMMLElementGroup *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v2 = a2;
  v3 = objc_alloc_init(AXMMLElementGroup);
  -[AXMMLElementGroup setFeature:](v3, "setFeature:", v2);
  objc_msgSend(v2, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[AXMMLElementGroup setFrame:](v3, "setFrame:", v5, v7, v9, v11);
  return v3;
}

- (id)_applyCrossUITypeNMS:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  id v8;
  uint64_t j;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  double v31;
  void *v33;
  id obj;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  id v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  _QWORD v55[7];
  _QWORD v56[9];

  v56[7] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v36 = (id)objc_claimAutoreleasedReturnValue();
  v55[0] = &unk_1E62882E8;
  v55[1] = &unk_1E6288330;
  v56[0] = &unk_1E6289530;
  v56[1] = &unk_1E6289548;
  v55[2] = &unk_1E6288300;
  v55[3] = &unk_1E6288318;
  v56[2] = &unk_1E6289560;
  v56[3] = &unk_1E6289578;
  v55[4] = &unk_1E6288360;
  v55[5] = &unk_1E6288378;
  v56[4] = &unk_1E6289590;
  v56[5] = &unk_1E62895A8;
  v55[6] = &unk_1E6288390;
  v56[6] = &unk_1E62895C0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, v55, 7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v3;
  objc_msgSend(v3, "sortedArrayUsingComparator:", &__block_literal_global_125);
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
  if (v37)
  {
    v35 = *(_QWORD *)v50;
    v5 = 0x1E0CB3000uLL;
    v41 = v4;
    do
    {
      for (i = 0; i != v37; ++i)
      {
        if (*(_QWORD *)v50 != v35)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        v48 = 0u;
        v8 = v36;
        v44 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
        if (!v44)
        {

LABEL_22:
          objc_msgSend(v8, "addObject:", v7);
          continue;
        }
        v38 = i;
        v42 = v7;
        v43 = *(_QWORD *)v46;
        v39 = 1;
        v40 = v8;
        do
        {
          for (j = 0; j != v44; ++j)
          {
            if (*(_QWORD *)v46 != v43)
              objc_enumerationMutation(v40);
            v10 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * j);
            objc_msgSend(*(id *)(v5 + 2024), "numberWithInteger:", objc_msgSend(v10, "uiClass"));
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "objectForKeyedSubscript:", v11);
            v12 = objc_claimAutoreleasedReturnValue();
            if (v12)
            {
              v13 = (void *)v12;
              objc_msgSend(*(id *)(v5 + 2024), "numberWithInteger:", objc_msgSend(v10, "uiClass"));
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "objectForKeyedSubscript:", v14);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = v5;
              objc_msgSend(*(id *)(v5 + 2024), "numberWithInteger:", objc_msgSend(v42, "uiClass"));
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(v15, "indexOfObject:", v17);

              if (v18 == 0x7FFFFFFFFFFFFFFFLL)
              {
                v4 = v41;
                v5 = v16;
              }
              else
              {
                objc_msgSend(v10, "frame");
                v20 = v19;
                v22 = v21;
                v24 = v23;
                v26 = v25;
                objc_msgSend(v42, "frame");
                AXMIntersectionOverUnion(v20, v22, v24, v26, v27, v28, v29, v30);
                v4 = v41;
                v5 = v16;
                if (v31 > 0.7)
                  v39 = 0;
              }
            }
            else
            {

            }
          }
          v8 = v40;
          v44 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
        }
        while (v44);

        i = v38;
        v7 = v42;
        if ((v39 & 1) != 0)
          goto LABEL_22;
      }
      v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
    }
    while (v37);
  }

  return v36;
}

uint64_t __47__AXMLElementCoagulation__applyCrossUITypeNMS___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "confidence");
  if (v6 >= 1.0)
  {
    v12 = -1;
  }
  else
  {
    objc_msgSend(v5, "confidence");
    if (v7 >= 1.0)
    {
      v12 = 1;
    }
    else
    {
      v8 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v4, "confidence");
      objc_msgSend(v8, "numberWithDouble:");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v5, "confidence");
      objc_msgSend(v10, "numberWithDouble:");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v9, "compare:", v11) == 0;

    }
  }

  return v12;
}

- (BOOL)_isInTopBar:(id)a3
{
  id v4;
  double MinX;
  double v6;
  double MinY;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  BOOL v20;
  double v21;
  double v22;
  double v23;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  v4 = a3;
  objc_msgSend(v4, "frame");
  MinX = CGRectGetMinX(v25);
  objc_msgSend(v4, "frame");
  v6 = MinX + CGRectGetWidth(v26) * 0.5;
  objc_msgSend(v4, "frame");
  MinY = CGRectGetMinY(v27);
  objc_msgSend(v4, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v28.origin.x = v9;
  v28.origin.y = v11;
  v28.size.width = v13;
  v28.size.height = v15;
  v16 = MinY + CGRectGetHeight(v28) * 0.5;
  -[AXMLElementCoagulation canvasSize](self, "canvasSize");
  v18 = vabdd_f64(v6, v17 * 0.5);
  -[AXMLElementCoagulation canvasSize](self, "canvasSize");
  v20 = v18 < v19 / 10.0;
  -[AXMLElementCoagulation canvasSize](self, "canvasSize");
  v22 = fabs(v16 + v21 / -13.0);
  -[AXMLElementCoagulation canvasSize](self, "canvasSize");
  return v22 < v23 / 20.0 && v20;
}

- (id)_getClickableTextButtons:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = 0;
    v6 = 0x1E0C99000uLL;
    while (1)
    {
      objc_msgSend(v4, "objectAtIndex:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "feature");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "uiClass") != 11 || -[AXMLElementCoagulation _isInTopBar:](self, "_isInTopBar:", v7))
        goto LABEL_10;
      objc_msgSend(v7, "feature");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "value");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v6 + 3640), "null");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if ((v12 & 1) == 0)
        break;
LABEL_11:

      if (++v5 >= (unint64_t)objc_msgSend(v4, "count"))
        return v4;
    }
    -[AXMLElementCoagulation nonAlphaCharactersRegex](self, "nonAlphaCharactersRegex");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "feature");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "value");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "feature");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "value");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringByReplacingMatchesInString:options:range:withTemplate:", v15, 0, 0, objc_msgSend(v17, "length"), &stru_1E6260C18);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "lowercaseString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "length"))
    {
      -[AXMLElementCoagulation clickableTextKeywords](self, "clickableTextKeywords");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "containsObject:", v8);

      if (v20)
      {
        objc_msgSend(v7, "frame");
        v22 = v21;
        v24 = v23;
        v26 = v25;
        v28 = v27;
        objc_msgSend(v7, "feature");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "confidence");
        v31 = v30;
        objc_msgSend(v7, "feature");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "value");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXMLElementCoagulation canvasSize](self, "canvasSize");
        v35 = v34;
        v37 = v36;
        objc_msgSend(MEMORY[0x1E0C99D20], "array");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        +[AXMVisionFeature groupedFeatureWithElementRect:uiClass:confidence:label:canvasSize:subElements:](AXMVisionFeature, "groupedFeatureWithElementRect:uiClass:confidence:label:canvasSize:subElements:", 17, v33, v38, v22, v24, v26, v28, v31, v35, v37);
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "setFeature:", v39);
      }
    }
    v6 = 0x1E0C99000;
LABEL_10:

    goto LABEL_11;
  }
  return v4;
}

- (id)_flattenFeatures:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v5, "addObject:", v11, (_QWORD)v15);
        objc_msgSend(v11, "subfeatures");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "count"))
        {
          v13 = objc_msgSend(v11, "includeChildren");

          if (!v13)
            continue;
          -[AXMLElementCoagulation _getFlattenedChildFeatures:](self, "_getFlattenedChildFeatures:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObjectsFromArray:", v12);
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)_getFlattenedChildFeatures:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v4, "subfeatures", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v5, "addObject:", v11);
        objc_msgSend(v11, "subfeatures");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "count"))
        {
          v13 = objc_msgSend(v11, "includeChildren");

          if (!v13)
            continue;
          -[AXMLElementCoagulation _getFlattenedChildFeatures:](self, "_getFlattenedChildFeatures:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObjectsFromArray:", v12);
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)_groupFeatures:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;

  -[AXMLElementCoagulation _getClickableTextButtons:](self, "_getClickableTextButtons:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMLElementCoagulation _sortFeaturesReadingOrder:](self, "_sortFeaturesReadingOrder:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  -[AXMLElementCoagulation _getGroupedSegmentedControlFeatures:](self, "_getGroupedSegmentedControlFeatures:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXMLElementCoagulation _getGroupedTextFields:](self, "_getGroupedTextFields:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXMLElementCoagulation _mergeTopLeftButton:](self, "_mergeTopLeftButton:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXMLElementCoagulation _getGroupedToggleCheckboxWithText:](self, "_getGroupedToggleCheckboxWithText:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXMLElementCoagulation _getGroupedTextFeatures:](self, "_getGroupedTextFeatures:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXMLElementCoagulation _getGroupedPictureAndSubtitleFeature:](self, "_getGroupedPictureAndSubtitleFeature:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXMLElementCoagulation _groupFeaturesByContainment:](self, "_groupFeaturesByContainment:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXMLElementCoagulation _getTopLevelFeatureGroups:](self, "_getTopLevelFeatureGroups:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXMLElementCoagulation _getGroupedTextButtonFeatures:](self, "_getGroupedTextButtonFeatures:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[AXMLElementCoagulation isRTL](self, "isRTL"))
    v16 = -[AXMLElementCoagulation _applyHorizontalMirrorToFeatures:](self, "_applyHorizontalMirrorToFeatures:", v15);
  -[AXMLElementCoagulation _reorderByYCut:](self, "_reorderByYCut:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[AXMLElementCoagulation isRTL](self, "isRTL"))
    v18 = -[AXMLElementCoagulation _applyHorizontalMirrorToFeatures:](self, "_applyHorizontalMirrorToFeatures:", v17);
  return v17;
}

- (id)_applyHorizontalMirrorToFeatures:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double MinY;
  double Width;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v8);
        -[AXMLElementCoagulation canvasSize](self, "canvasSize");
        v11 = v10;
        objc_msgSend(v9, "frame");
        v12 = v11 - CGRectGetMinX(v23);
        objc_msgSend(v9, "frame");
        v13 = v12 - CGRectGetWidth(v24);
        objc_msgSend(v9, "frame");
        MinY = CGRectGetMinY(v25);
        objc_msgSend(v9, "frame");
        Width = CGRectGetWidth(v26);
        objc_msgSend(v9, "frame");
        objc_msgSend(v9, "setFrame:", v13, MinY, Width, CGRectGetHeight(v27));
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }
  return v4;
}

- (id)_getGroupedTextFeatures:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  unint64_t v15;
  void *v16;
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
  _BOOL4 v29;
  double MinY;
  double v31;
  uint64_t v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double Width;
  double v48;
  double v49;
  double v50;
  double Height;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  unint64_t v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t i;
  uint64_t v64;
  void *v65;
  unint64_t v66;
  void *v67;
  uint64_t v68;
  void *v69;
  unint64_t v70;
  void *v71;
  uint64_t v72;
  void *v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  void *v98;
  id v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t j;
  uint64_t v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *k;
  void *v116;
  uint64_t v117;
  AXMMLElementGroup *v118;
  void *v119;
  void *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t m;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  double v136;
  void *v137;
  double v138;
  double v139;
  void *v140;
  double v141;
  double v142;
  double v143;
  double v144;
  void *v145;
  void *v146;
  char *v147;
  void *v148;
  id v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t n;
  void *v154;
  double v155;
  double v156;
  double v157;
  double v158;
  double v159;
  double v160;
  double v161;
  double v162;
  double v163;
  double v164;
  double v165;
  double v166;
  void *v167;
  uint64_t v168;
  void *v169;
  void *v170;
  void *v171;
  double v172;
  double v173;
  double v174;
  double v175;
  double v176;
  double v177;
  double v178;
  double v179;
  void *v180;
  double v181;
  double v182;
  void *v183;
  double v184;
  double v185;
  double v186;
  double v187;
  void *v188;
  void *v189;
  void *v191;
  void *v192;
  id v193;
  id v194;
  uint64_t v195;
  uint64_t v196;
  void *v197;
  uint64_t v198;
  id obj;
  id obja;
  char *objb;
  uint64_t v202;
  uint64_t v203;
  void *v204;
  void *v205;
  AXMLElementCoagulation *v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  _BYTE v231[128];
  _BYTE v232[128];
  _BYTE v233[128];
  _BYTE v234[128];
  _BYTE v235[128];
  _BYTE v236[128];
  uint64_t v237;
  CGRect v238;
  CGRect v239;
  CGRect v240;
  CGRect v241;
  CGRect v242;
  CGRect v243;
  CGRect v244;
  CGRect v245;

  v237 = *MEMORY[0x1E0C80C00];
  v192 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v192, "ax_filteredArrayUsingBlock:", &__block_literal_global_129);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  v206 = self;
  -[AXMLElementCoagulation _compareForY:](self, "_compareForY:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "count");
  v205 = v7;
  if (!v10)
    goto LABEL_19;
  v11 = v10;
  v12 = 0;
  v13 = 0x1E0CB3000uLL;
  v202 = v10;
  do
  {
    objc_msgSend(v7, "objectAtIndex:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    while (1)
    {
      objc_msgSend(v7, "objectAtIndex:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15 > v12)
      {
        objc_msgSend(v14, "frame");
        v18 = v17;
        v20 = v19;
        v22 = v21;
        v24 = v23;
        objc_msgSend(v16, "frame");
        v29 = -[AXMLElementCoagulation _hasXOverlap:obj2:](v206, "_hasXOverlap:obj2:", v18, v20, v22, v24, v25, v26, v27, v28);
        objc_msgSend(v16, "frame");
        MinY = CGRectGetMinY(v238);
        objc_msgSend(v14, "frame");
        v31 = CGRectGetMinY(v239);
        v32 = objc_msgSend(v8, "indexOfObject:", v16);
        if (v29 && MinY > v31 && v32 == 0x7FFFFFFFFFFFFFFFLL)
          break;
      }
LABEL_15:

      ++v15;
      v7 = v205;
      if (v11 == v15)
        goto LABEL_18;
    }
    objc_msgSend(v14, "frame");
    v34 = v33;
    v36 = v35;
    v38 = v37;
    v40 = v39;
    objc_msgSend(v16, "frame");
    -[AXMLElementCoagulation _getXOverlap:obj2:](v206, "_getXOverlap:obj2:", v34, v36, v38, v40, v41, v42, v43, v44);
    v46 = v45;
    objc_msgSend(v14, "frame");
    Width = CGRectGetWidth(v240);
    objc_msgSend(v16, "frame");
    if ((Width + CGRectGetWidth(v241) - (double)(unint64_t)v46) / (double)(unint64_t)v46 <= 2.0)
      v48 = 1.0;
    else
      v48 = 1.5;
    objc_msgSend(v16, "frame");
    v49 = CGRectGetMinY(v242);
    objc_msgSend(v14, "frame");
    v50 = v49 - CGRectGetMaxY(v243);
    objc_msgSend(v14, "frame");
    Height = CGRectGetHeight(v244);
    objc_msgSend(v16, "frame");
    if (v50 <= fmin(Height, CGRectGetHeight(v245)) / v48)
    {
      v52 = v8;
      objc_msgSend(v8, "addObject:", v16);
      objc_msgSend(*(id *)(v13 + 2024), "numberWithUnsignedInteger:", v12);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKey:", v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v54)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v13 + 2024), "numberWithUnsignedInteger:", v12);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v55, v56);

      }
      objc_msgSend(*(id *)(v13 + 2024), "numberWithUnsignedInteger:", v12);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKey:", v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v13 + 2024), "numberWithUnsignedInteger:", v15);
      v59 = v13;
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "addObject:", v60);

      v13 = v59;
      v8 = v52;
      v11 = v202;
      goto LABEL_15;
    }

    v7 = v205;
LABEL_18:

    ++v12;
  }
  while (v12 != v11);
LABEL_19:
  v191 = v8;
  objc_msgSend(v9, "allKeys");
  v227 = 0u;
  v228 = 0u;
  v229 = 0u;
  v230 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v227, v236, 16);
  if (v61)
  {
    v62 = v61;
    v203 = *(_QWORD *)v228;
    do
    {
      for (i = 0; i != v62; ++i)
      {
        if (*(_QWORD *)v228 != v203)
          objc_enumerationMutation(obj);
        v64 = *(_QWORD *)(*((_QWORD *)&v227 + 1) + 8 * i);
        objc_msgSend(v9, "objectForKey:", v64);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v65, "count"))
        {
          v66 = 0;
          do
          {
            objc_msgSend(v65, "objectAtIndex:", v66);
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            v68 = (int)objc_msgSend(v67, "intValue");

            objc_msgSend(v7, "objectAtIndex:", v68);
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            if (++v66 < objc_msgSend(v65, "count"))
            {
              v70 = v66;
              while (1)
              {
                objc_msgSend(v65, "objectAtIndex:", v70);
                v71 = (void *)objc_claimAutoreleasedReturnValue();
                v72 = (int)objc_msgSend(v71, "intValue");

                objc_msgSend(v205, "objectAtIndex:", v72);
                v73 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v69, "frame");
                v75 = v74;
                v77 = v76;
                v79 = v78;
                v81 = v80;
                objc_msgSend(v73, "frame");
                if (-[AXMLElementCoagulation _hasYOverlap:obj2:](v206, "_hasYOverlap:obj2:", v75, v77, v79, v81, v82, v83, v84, v85))
                {
                  objc_msgSend(v69, "frame");
                  v87 = v86;
                  v89 = v88;
                  v91 = v90;
                  v93 = v92;
                  objc_msgSend(v73, "frame");
                  if (!-[AXMLElementCoagulation _hasXOverlap:obj2:](v206, "_hasXOverlap:obj2:", v87, v89, v91, v93, v94, v95, v96, v97))break;
                }

                if (++v70 >= objc_msgSend(v65, "count"))
                  goto LABEL_33;
              }
              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v98 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "setObject:forKeyedSubscript:", v98, v64);

            }
LABEL_33:

            v7 = v205;
          }
          while (v66 < objc_msgSend(v65, "count"));
        }

      }
      v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v227, v236, 16);
    }
    while (v62);
  }
  v204 = v9;
  v225 = 0u;
  v226 = 0u;
  v223 = 0u;
  v224 = 0u;
  v99 = obj;
  v100 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v223, v235, 16);
  if (v100)
  {
    v101 = v100;
    v102 = *(_QWORD *)v224;
    do
    {
      for (j = 0; j != v101; ++j)
      {
        if (*(_QWORD *)v224 != v102)
          objc_enumerationMutation(v99);
        v104 = *(_QWORD *)(*((_QWORD *)&v223 + 1) + 8 * j);
        objc_msgSend(v204, "objectForKeyedSubscript:", v104);
        v105 = (void *)objc_claimAutoreleasedReturnValue();

        if (v105)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v204, "objectForKey:", v104);
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          v108 = v107;
          while (objc_msgSend(v107, "count"))
          {
            objc_msgSend(v108, "objectAtIndex:", 0);
            v109 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v204, "objectForKeyedSubscript:", v109);
            v110 = (void *)objc_claimAutoreleasedReturnValue();

            if (v110)
            {
              objc_msgSend(v204, "objectForKeyedSubscript:", v109);
              v111 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v108, "addObjectsFromArray:", v111);

              objc_msgSend(v204, "removeObjectForKey:", v109);
            }
            objc_msgSend(v106, "addObject:", v109);
            objc_msgSend(v108, "removeObjectAtIndex:", 0);

            v107 = v108;
          }
          objc_msgSend(v204, "setObject:forKeyedSubscript:", v106, v104);

          v7 = v205;
        }
      }
      v101 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v223, v235, 16);
    }
    while (v101);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v113 = v204;
  objc_msgSend(v204, "allKeys");
  v114 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  v219 = 0u;
  v220 = 0u;
  v221 = 0u;
  v222 = 0u;
  v194 = v114;
  obja = (id)objc_msgSend(v194, "countByEnumeratingWithState:objects:count:", &v219, v234, 16);
  if (obja)
  {
    v195 = *(_QWORD *)v220;
    do
    {
      for (k = 0; k != obja; k = (char *)k + 1)
      {
        if (*(_QWORD *)v220 != v195)
          objc_enumerationMutation(v194);
        v116 = *(void **)(*((_QWORD *)&v219 + 1) + 8 * (_QWORD)k);
        objc_msgSend(v7, "objectAtIndex:", (int)objc_msgSend(v116, "intValue"));
        v117 = objc_claimAutoreleasedReturnValue();
        v118 = objc_alloc_init(AXMMLElementGroup);
        -[AXMLElementCoagulation _mergeFeatureIntoGroup:feature:](v206, "_mergeFeatureIntoGroup:feature:", v118, v117);
        v119 = (void *)v117;
        objc_msgSend(v112, "addObject:", v117);
        objc_msgSend(v113, "objectForKey:", v116);
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        v215 = 0u;
        v216 = 0u;
        v217 = 0u;
        v218 = 0u;
        v121 = objc_msgSend(v120, "countByEnumeratingWithState:objects:count:", &v215, v233, 16);
        if (v121)
        {
          v122 = v121;
          v123 = *(_QWORD *)v216;
          do
          {
            for (m = 0; m != v122; ++m)
            {
              if (*(_QWORD *)v216 != v123)
                objc_enumerationMutation(v120);
              objc_msgSend(v7, "objectAtIndex:", (int)objc_msgSend(*(id *)(*((_QWORD *)&v215 + 1) + 8 * m), "intValue"));
              v125 = (void *)objc_claimAutoreleasedReturnValue();
              -[AXMLElementCoagulation _mergeFeatureIntoGroup:feature:](v206, "_mergeFeatureIntoGroup:feature:", v118, v125);
              objc_msgSend(v112, "addObject:", v125);

            }
            v122 = objc_msgSend(v120, "countByEnumeratingWithState:objects:count:", &v215, v233, 16);
          }
          while (v122);
        }
        -[AXMMLElementGroup subfeatures](v118, "subfeatures");
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXMLElementCoagulation _sortFeaturesReadingOrder:](v206, "_sortFeaturesReadingOrder:", v126);
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        v128 = (void *)objc_msgSend(v127, "mutableCopy");
        -[AXMMLElementGroup setSubfeatures:](v118, "setSubfeatures:", v128);

        -[AXMMLElementGroup frame](v118, "frame");
        v130 = v129;
        v132 = v131;
        v134 = v133;
        v136 = v135;
        -[AXMMLElementGroup feature](v118, "feature");
        v137 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v137, "confidence");
        v139 = v138;
        -[AXMMLElementGroup textLabel](v118, "textLabel");
        v140 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXMLElementCoagulation canvasSize](v206, "canvasSize");
        v142 = v141;
        v144 = v143;
        -[AXMMLElementGroup childFeatures](v118, "childFeatures");
        v145 = (void *)objc_claimAutoreleasedReturnValue();
        +[AXMVisionFeature groupedFeatureWithElementRect:uiClass:confidence:label:canvasSize:subElements:](AXMVisionFeature, "groupedFeatureWithElementRect:uiClass:confidence:label:canvasSize:subElements:", 11, v140, v145, v130, v132, v134, v136, v139, v142, v144);
        v146 = (void *)objc_claimAutoreleasedReturnValue();

        v7 = v205;
        -[AXMMLElementGroup setFeature:](v118, "setFeature:", v146);
        -[AXMMLElementGroup setIncludeChildren:](v118, "setIncludeChildren:", 0);
        objc_msgSend(v197, "addObject:", v118);

        v113 = v204;
      }
      obja = (id)objc_msgSend(v194, "countByEnumeratingWithState:objects:count:", &v219, v234, 16);
    }
    while (obja);
  }

  objc_msgSend(v7, "removeObjectsInArray:", v112);
  v213 = 0u;
  v214 = 0u;
  v211 = 0u;
  v212 = 0u;
  v193 = v197;
  v198 = objc_msgSend(v193, "countByEnumeratingWithState:objects:count:", &v211, v232, 16);
  if (v198)
  {
    v196 = *(_QWORD *)v212;
    do
    {
      v147 = 0;
      do
      {
        if (*(_QWORD *)v212 != v196)
          objc_enumerationMutation(v193);
        objb = v147;
        v148 = *(void **)(*((_QWORD *)&v211 + 1) + 8 * (_QWORD)v147);
        v207 = 0u;
        v208 = 0u;
        v209 = 0u;
        v210 = 0u;
        v149 = v205;
        v150 = objc_msgSend(v149, "countByEnumeratingWithState:objects:count:", &v207, v231, 16);
        if (v150)
        {
          v151 = v150;
          v152 = *(_QWORD *)v208;
          do
          {
            for (n = 0; n != v151; ++n)
            {
              if (*(_QWORD *)v208 != v152)
                objc_enumerationMutation(v149);
              v154 = *(void **)(*((_QWORD *)&v207 + 1) + 8 * n);
              objc_msgSend(v148, "frame");
              v156 = v155;
              v158 = v157;
              v160 = v159;
              v162 = v161;
              objc_msgSend(v154, "frame");
              if (AXMIsContainedBy(v156, v158, v160, v162, v163, v164, v165, v166, 0.7))
              {
                objc_msgSend(v148, "subfeatures");
                v167 = (void *)objc_claimAutoreleasedReturnValue();
                v168 = objc_msgSend(v167, "indexOfObject:", v154);

                if (v168 == 0x7FFFFFFFFFFFFFFFLL)
                {
                  -[AXMLElementCoagulation _mergeFeatureIntoGroup:feature:](v206, "_mergeFeatureIntoGroup:feature:", v148, v154);
                  objc_msgSend(v112, "addObject:", v154);
                  objc_msgSend(v148, "subfeatures");
                  v169 = (void *)objc_claimAutoreleasedReturnValue();
                  -[AXMLElementCoagulation _sortFeaturesReadingOrder:](v206, "_sortFeaturesReadingOrder:", v169);
                  v170 = (void *)objc_claimAutoreleasedReturnValue();
                  v171 = (void *)objc_msgSend(v170, "mutableCopy");
                  objc_msgSend(v148, "setSubfeatures:", v171);

                  objc_msgSend(v148, "frame");
                  v173 = v172;
                  v175 = v174;
                  v177 = v176;
                  v179 = v178;
                  objc_msgSend(v148, "feature");
                  v180 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v180, "confidence");
                  v182 = v181;
                  objc_msgSend(v148, "textLabel");
                  v183 = (void *)objc_claimAutoreleasedReturnValue();
                  -[AXMLElementCoagulation canvasSize](v206, "canvasSize");
                  v185 = v184;
                  v187 = v186;
                  objc_msgSend(v148, "childFeatures");
                  v188 = (void *)objc_claimAutoreleasedReturnValue();
                  +[AXMVisionFeature groupedFeatureWithElementRect:uiClass:confidence:label:canvasSize:subElements:](AXMVisionFeature, "groupedFeatureWithElementRect:uiClass:confidence:label:canvasSize:subElements:", 11, v183, v188, v173, v175, v177, v179, v182, v185, v187);
                  v189 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v148, "setFeature:", v189);
                }
              }
            }
            v151 = objc_msgSend(v149, "countByEnumeratingWithState:objects:count:", &v207, v231, 16);
          }
          while (v151);
        }

        v147 = objb + 1;
      }
      while (objb + 1 != (char *)v198);
      v198 = objc_msgSend(v193, "countByEnumeratingWithState:objects:count:", &v211, v232, 16);
    }
    while (v198);
  }

  objc_msgSend(v192, "removeObjectsInArray:", v112);
  objc_msgSend(v192, "addObjectsFromArray:", v193);

  return v192;
}

BOOL __50__AXMLElementCoagulation__getGroupedTextFeatures___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  _BOOL8 v4;
  void *v5;

  v2 = a2;
  objc_msgSend(v2, "feature");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "uiClass") == 11)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(v2, "feature");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "uiClass") == 17;

  }
  return v4;
}

- (id)_mergeTopLeftButton:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  int32x2_t v9;
  int64x2_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  double MidY;
  double v32;
  double MinX;
  id v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  double MidX;
  double v54;
  void *v55;
  void *v56;
  id v57;
  void *v59;
  AXMLElementCoagulation *v60;
  void *v61;
  void *v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _QWORD v71[5];
  int8x16_t v72;
  _BYTE v73[128];
  _BYTE v74[128];
  uint64_t v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;

  v75 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  -[AXMLElementCoagulation canvasSize](self, "canvasSize");
  v7 = v6;
  -[AXMLElementCoagulation canvasSize](self, "canvasSize");
  v71[0] = MEMORY[0x1E0C809B0];
  v71[1] = 3221225472;
  v71[2] = __46__AXMLElementCoagulation__mergeTopLeftButton___block_invoke;
  v71[3] = &unk_1E625E370;
  v60 = self;
  v71[4] = self;
  v9 = vdup_n_s32(v7 > v8);
  v10.i64[0] = v9.u32[0];
  v10.i64[1] = v9.u32[1];
  v72 = vbslq_s8((int8x16_t)vcltzq_s64(vshlq_n_s64(v10, 0x3FuLL)), (int8x16_t)xmmword_1B0EFFD00, (int8x16_t)xmmword_1B0EFFCF0);
  v61 = v5;
  objc_msgSend(v5, "ax_filteredArrayUsingBlock:", v71);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
  if (!v12)
    goto LABEL_29;
  v13 = v12;
  v14 = 0;
  v15 = *(_QWORD *)v68;
  do
  {
    for (i = 0; i != v13; ++i)
    {
      if (*(_QWORD *)v68 != v15)
        objc_enumerationMutation(v11);
      v17 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
      objc_msgSend(v17, "feature");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v18, "uiClass") == 16)
      {

      }
      else
      {
        objc_msgSend(v17, "feature");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "uiClass");

        if (v20 != 5)
          continue;
      }
      v21 = v17;

      v14 = v21;
    }
    v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
  }
  while (v13);
  if (!v14)
  {
LABEL_29:
    v57 = v4;
    v56 = v61;
    goto LABEL_33;
  }
  v59 = v4;
  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v22 = v11;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
  if (!v23)
  {

    goto LABEL_31;
  }
  v24 = v23;
  v62 = 0;
  v25 = *(_QWORD *)v64;
  while (2)
  {
    v26 = 0;
    while (2)
    {
      if (*(_QWORD *)v64 != v25)
        objc_enumerationMutation(v22);
      v27 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v26);
      objc_msgSend(v27, "feature", v59);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v28, "uiClass") == 11)
      {

        goto LABEL_21;
      }
      objc_msgSend(v27, "feature");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "uiClass");

      if (v30 == 17)
      {
LABEL_21:
        objc_msgSend(v27, "frame");
        MidY = CGRectGetMidY(v76);
        objc_msgSend(v14, "frame");
        if (MidY <= CGRectGetMaxY(v77))
        {
          objc_msgSend(v27, "frame");
          v32 = CGRectGetMidY(v78);
          objc_msgSend(v14, "frame");
          if (v32 >= CGRectGetMinY(v79))
          {
            objc_msgSend(v27, "frame");
            MinX = CGRectGetMinX(v80);
            objc_msgSend(v14, "frame");
            if (vabdd_f64(MinX, CGRectGetMaxX(v81)) < 40.0)
            {
              v34 = v27;

              v62 = v34;
            }
          }
        }
      }
      if (v24 != ++v26)
        continue;
      break;
    }
    v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
    if (v24)
      continue;
    break;
  }

  if (v62)
  {
    -[AXMLElementCoagulation _mergeFeatureIntoGroup:feature:](v60, "_mergeFeatureIntoGroup:feature:", v14, v62);
    objc_msgSend(v14, "frame");
    v36 = v35;
    v38 = v37;
    v40 = v39;
    v42 = v41;
    objc_msgSend(v14, "feature");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "confidence");
    v45 = v44;
    objc_msgSend(v14, "textLabel");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMLElementCoagulation canvasSize](v60, "canvasSize");
    v48 = v47;
    v50 = v49;
    objc_msgSend(v14, "childFeatures");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    +[AXMVisionFeature groupedFeatureWithElementRect:uiClass:confidence:label:canvasSize:subElements:](AXMVisionFeature, "groupedFeatureWithElementRect:uiClass:confidence:label:canvasSize:subElements:", 16, v46, v51, v36, v38, v40, v42, v45, v48, v50);
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "setFeature:", v52);
    objc_msgSend(v14, "setIncludeChildren:", 0);
    objc_msgSend(v14, "frame");
    MidX = CGRectGetMidX(v82);
    objc_msgSend(v14, "frame");
    v54 = CGRectGetMidY(v83);
    objc_msgSend(v14, "feature");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setActivationPoint:", MidX, v54);

    v56 = v61;
    objc_msgSend(v61, "removeObject:", v62);
    v57 = v61;

    v4 = v59;
    goto LABEL_32;
  }
LABEL_31:
  v4 = v59;
  v57 = v59;
  v56 = v61;
LABEL_32:

LABEL_33:
  return v57;
}

uint64_t __46__AXMLElementCoagulation__mergeTopLeftButton___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  double MaxY;
  double v10;
  double MinX;
  double v12;
  _BOOL4 v13;
  uint64_t v14;
  CGRect v16;
  CGRect v17;

  v3 = a2;
  objc_msgSend(v3, "feature");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "uiClass") == 5)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v3, "feature");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "uiClass") == 16)
    {
      v5 = 1;
    }
    else
    {
      objc_msgSend(v3, "feature");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "uiClass") == 11)
      {
        v5 = 1;
      }
      else
      {
        objc_msgSend(v3, "feature");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v8, "uiClass") == 17;

      }
    }

  }
  objc_msgSend(v3, "frame");
  MaxY = CGRectGetMaxY(v16);
  objc_msgSend(*(id *)(a1 + 32), "canvasSize");
  if (MaxY >= v10 / *(double *)(a1 + 40))
  {
    v13 = 0;
  }
  else
  {
    objc_msgSend(v3, "frame");
    MinX = CGRectGetMinX(v17);
    objc_msgSend(*(id *)(a1 + 32), "canvasSize");
    v13 = MinX < v12 / *(double *)(a1 + 48);
  }
  v14 = v5 & v13;

  return v14;
}

- (id)_removeExtraOCRAndIconFromTextField:(id)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
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
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  int v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  BOOL v48;
  char v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  uint64_t v58;
  void *v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  void *v66;
  void *v67;
  void *v68;
  id v70;
  AXMLElementCoagulation *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;

  v70 = a3;
  v71 = self;
  -[AXMLElementCoagulation _compareArea:](self, "_compareArea:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v6 = 0;
    while (1)
    {
      objc_msgSend(v5, "objectAtIndex:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "count"))
        break;
LABEL_38:

      if (++v6 >= objc_msgSend(v5, "count"))
        goto LABEL_39;
    }
    v8 = 0;
    while (1)
    {
      objc_msgSend(v5, "objectAtIndex:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v8 <= v6)
        goto LABEL_37;
      objc_msgSend(v9, "frame");
      v12 = v11;
      v14 = v13;
      v16 = v15;
      v18 = v17;
      objc_msgSend(v7, "frame");
      if (!AXMIsContainedBy(v12, v14, v16, v18, v19, v20, v21, v22, 0.7))
        goto LABEL_37;
      objc_msgSend(v7, "frame");
      v24 = v23;
      v26 = v25;
      v28 = v27;
      v30 = v29;
      objc_msgSend(v10, "frame");
      AXMIntersectionOverUnion(v24, v26, v28, v30, v31, v32, v33, v34);
      if (v35 <= 0.7)
        goto LABEL_12;
      objc_msgSend(v7, "feature");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v36, "uiClass") != 5)
        break;
      objc_msgSend(v7, "feature");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "value");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = axMLElementsUnknownIconType;

      if (v38 == (void *)v39)
      {
        v40 = 1;
      }
      else
      {
        objc_msgSend(v75, "addObject:", v10);
        v40 = 0;
      }
LABEL_14:
      objc_msgSend(v7, "feature");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "uiClass");
      if (v42 != 5)
      {
        objc_msgSend(v7, "feature");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v74, "uiClass") != 16)
        {
          v68 = v74;
          goto LABEL_34;
        }
      }
      objc_msgSend(v10, "feature");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v43, "uiClass") != 11)
      {
        objc_msgSend(v10, "feature");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v44, "uiClass") != 17)
          v40 = 0;

      }
      if (v42 == 5)
      {

        if (!v40)
          goto LABEL_36;
      }
      else
      {

        if ((v40 & 1) == 0)
          goto LABEL_36;
      }
      objc_msgSend(v10, "feature");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "value");
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      v46 = objc_msgSend(v41, "rangeOfString:options:", CFSTR("Q "), 1);
      v47 = objc_msgSend(v41, "rangeOfString:options:", CFSTR("O "), 1);
      if (v46)
        v48 = v47 == 0;
      else
        v48 = 1;
      v49 = !v48;
      if ((unint64_t)objc_msgSend(v41, "length") >= 3 && (v49 & 1) == 0)
      {
        objc_msgSend(v41, "substringFromIndex:", 2);
        v72 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "frame");
        v51 = v50;
        v53 = v52;
        v55 = v54;
        v57 = v56;
        objc_msgSend(v10, "feature");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = objc_msgSend(v73, "uiClass");
        objc_msgSend(v10, "feature");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "confidence");
        v61 = v60;
        -[AXMLElementCoagulation canvasSize](v71, "canvasSize");
        v63 = v62;
        v65 = v64;
        objc_msgSend(v10, "feature");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "subfeatures");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = (void *)v72;
        +[AXMVisionFeature groupedFeatureWithElementRect:uiClass:confidence:label:canvasSize:subElements:](AXMVisionFeature, "groupedFeatureWithElementRect:uiClass:confidence:label:canvasSize:subElements:", v58, v72, v67, v51, v53, v55, v57, v61, v63, v65);
        v68 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "setFeature:", v68);
LABEL_34:

      }
LABEL_36:
      objc_msgSend(v75, "addObject:", v7);
LABEL_37:

      if (++v8 >= objc_msgSend(v5, "count"))
        goto LABEL_38;
    }

LABEL_12:
    v40 = 1;
    goto LABEL_14;
  }
LABEL_39:
  objc_msgSend(v5, "removeObjectsInArray:", v75);

  return v5;
}

- (id)_getGroupedTextFields:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
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
  void *v25;
  void *v26;
  void *v27;
  double MinX;
  double v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  AXMLElementCoagulation *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  BOOL v57;
  uint64_t v58;
  void *v59;
  void *v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  void *v79;
  double v80;
  double v81;
  void *v82;
  double v83;
  double v84;
  double v85;
  double v86;
  void *v87;
  void *v88;
  void *v90;
  id obj;
  uint64_t v92;
  id v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  id v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  _BYTE v114[128];
  _BYTE v115[128];
  _BYTE v116[128];
  uint64_t v117;
  CGRect v118;
  CGRect v119;
  CGRect v120;

  v117 = *MEMORY[0x1E0C80C00];
  v93 = a3;
  v90 = (void *)objc_msgSend(v93, "mutableCopy");
  objc_msgSend(v90, "ax_filteredArrayUsingBlock:", &__block_literal_global_135);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v110 = 0u;
  v111 = 0u;
  v112 = 0u;
  v113 = 0u;
  obj = v4;
  v94 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v110, v116, 16);
  if (v94)
  {
    v92 = *(_QWORD *)v111;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v111 != v92)
          objc_enumerationMutation(obj);
        v95 = v6;
        v7 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * v6);
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        v106 = 0u;
        v107 = 0u;
        v108 = 0u;
        v109 = 0u;
        v101 = v93;
        v8 = objc_msgSend(v101, "countByEnumeratingWithState:objects:count:", &v106, v115, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v107;
          v96 = *(_QWORD *)v107;
          v97 = v7;
          do
          {
            v11 = 0;
            v98 = v9;
            do
            {
              if (*(_QWORD *)v107 != v10)
                objc_enumerationMutation(v101);
              v12 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * v11);
              objc_msgSend(v7, "frame");
              v14 = v13;
              v16 = v15;
              v18 = v17;
              v20 = v19;
              objc_msgSend(v12, "frame");
              if (AXMIsContainedBy(v14, v16, v18, v20, v21, v22, v23, v24, 0.8))
              {
                objc_msgSend(v12, "feature");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v25, "uiClass") == 11)
                  goto LABEL_17;
                objc_msgSend(v12, "feature");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v26, "uiClass") == 17)
                  goto LABEL_16;
                objc_msgSend(v12, "feature");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v27, "uiClass") == 5)
                {

                  v9 = v98;
LABEL_16:

LABEL_17:
                }
                else
                {
                  objc_msgSend(v12, "feature");
                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                  v56 = objc_msgSend(v55, "uiClass");

                  v10 = v96;
                  v57 = v56 == 16;
                  v7 = v97;
                  v9 = v98;
                  if (!v57)
                    goto LABEL_23;
                }
                objc_msgSend(v12, "frame");
                MinX = CGRectGetMinX(v118);
                objc_msgSend(v7, "frame");
                v29 = CGRectGetMinX(v119);
                objc_msgSend(v7, "frame");
                if (MinX >= v29 + CGRectGetMaxX(v120) * 0.5)
                {
                  objc_msgSend(v12, "feature");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  v31 = objc_msgSend(v30, "uiClass");
                  v32 = 16;
                  if (v31 != 5)
                    v32 = 17;
                  v99 = v32;

                  objc_msgSend(v12, "frame");
                  v34 = v33;
                  v36 = v35;
                  v38 = v37;
                  v40 = v39;
                  objc_msgSend(v12, "feature");
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v41, "confidence");
                  v43 = v42;
                  objc_msgSend(v12, "feature");
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v44, "value");
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  -[AXMLElementCoagulation canvasSize](self, "canvasSize");
                  v47 = v46;
                  v49 = v48;
                  objc_msgSend(v12, "feature");
                  v50 = v5;
                  v51 = self;
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v52, "subfeatures");
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                  +[AXMVisionFeature groupedFeatureWithElementRect:uiClass:confidence:label:canvasSize:subElements:](AXMVisionFeature, "groupedFeatureWithElementRect:uiClass:confidence:label:canvasSize:subElements:", v99, v45, v53, v34, v36, v38, v40, v43, v47, v49);
                  v54 = (void *)objc_claimAutoreleasedReturnValue();

                  self = v51;
                  v5 = v50;
                  v10 = v96;

                  v7 = v97;
                  v9 = v98;

                  objc_msgSend(v12, "setFeature:", v54);
                }
                objc_msgSend(v100, "addObject:", v12);
                objc_msgSend(v5, "addObject:", v12);
              }
LABEL_23:
              ++v11;
            }
            while (v9 != v11);
            v58 = objc_msgSend(v101, "countByEnumeratingWithState:objects:count:", &v106, v115, 16);
            v9 = v58;
          }
          while (v58);
        }

        -[AXMLElementCoagulation _removeExtraOCRAndIconFromTextField:](self, "_removeExtraOCRAndIconFromTextField:", v100);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = (void *)objc_msgSend(v59, "mutableCopy");

        v104 = 0u;
        v105 = 0u;
        v102 = 0u;
        v103 = 0u;
        v61 = v60;
        v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v102, v114, 16);
        if (v62)
        {
          v63 = v62;
          v64 = *(_QWORD *)v103;
          do
          {
            v65 = 0;
            do
            {
              if (*(_QWORD *)v103 != v64)
                objc_enumerationMutation(v61);
              -[AXMLElementCoagulation _mergeFeatureIntoGroup:feature:](self, "_mergeFeatureIntoGroup:feature:", v7, *(_QWORD *)(*((_QWORD *)&v102 + 1) + 8 * v65++));
            }
            while (v63 != v65);
            v63 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v102, v114, 16);
          }
          while (v63);
        }

        objc_msgSend(v7, "subfeatures");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = objc_msgSend(v66, "count");

        if (v67)
        {
          objc_msgSend(v7, "subfeatures");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          -[AXMLElementCoagulation _compareForX:](self, "_compareForX:", v68);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          v70 = (void *)objc_msgSend(v69, "mutableCopy");
          objc_msgSend(v7, "setSubfeatures:", v70);

          objc_msgSend(v7, "frame");
          v72 = v71;
          v74 = v73;
          v76 = v75;
          v78 = v77;
          objc_msgSend(v7, "feature");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "confidence");
          v81 = v80;
          objc_msgSend(v7, "textLabel");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          -[AXMLElementCoagulation canvasSize](self, "canvasSize");
          v84 = v83;
          v86 = v85;
          objc_msgSend(v7, "childFeatures");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          +[AXMVisionFeature groupedFeatureWithElementRect:uiClass:confidence:label:canvasSize:subElements:](AXMVisionFeature, "groupedFeatureWithElementRect:uiClass:confidence:label:canvasSize:subElements:", 12, v82, v87, v72, v74, v76, v78, v81, v84, v86);
          v88 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v7, "setFeature:", v88);
          objc_msgSend(v7, "setIncludeChildren:", 0);

        }
        v6 = v95 + 1;
      }
      while (v95 + 1 != v94);
      v94 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v110, v116, 16);
    }
    while (v94);
  }

  objc_msgSend(v90, "removeObjectsInArray:", v5);
  return v90;
}

BOOL __48__AXMLElementCoagulation__getGroupedTextFields___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "feature");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "uiClass") == 12;

  return v3;
}

- (id)_getGroupedSegmentedControlFeatures:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
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
  double v29;
  double v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  char v60;
  uint64_t v61;
  uint64_t j;
  void *v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  unint64_t v76;
  void *v77;
  void *v78;
  double v79;
  double v80;
  id v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  double v85;
  uint64_t k;
  void *v87;
  unint64_t v88;
  double v89;
  void *v90;
  double MinX;
  double Width;
  void *v93;
  void *v94;
  uint64_t v95;
  void *v96;
  uint64_t v97;
  void *v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  void *v105;
  void *v106;
  id v107;
  void *v109;
  id v110;
  void *v111;
  id v112;
  uint64_t v113;
  void *v114;
  uint64_t v115;
  void *v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  uint64_t v120;
  id obj;
  uint64_t v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  _BYTE v143[128];
  _BYTE v144[128];
  _BYTE v145[128];
  _BYTE v146[128];
  _BYTE v147[128];
  uint64_t v148;
  CGRect v149;
  CGRect v150;
  CGRect v151;
  CGRect v152;
  CGRect v153;

  v148 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  objc_msgSend(v4, "ax_filteredArrayUsingBlock:", &__block_literal_global_136);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ax_filteredArrayUsingBlock:", &__block_literal_global_137);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    v112 = v4;
    -[AXMLElementCoagulation _compareForY:](self, "_compareForY:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[AXMLElementCoagulation _compareForY:](self, "_compareForY:", v7);
    v114 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v139 = 0u;
    v140 = 0u;
    v141 = 0u;
    v142 = 0u;
    v11 = v8;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v139, v147, 16);
    v111 = v5;
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v140;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v140 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v139 + 1) + 8 * i);
          if (objc_msgSend(v10, "count"))
          {
            objc_msgSend(v10, "lastObject");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "frame");
            v19 = v18;
            v21 = v20;
            v23 = v22;
            v25 = v24;
            objc_msgSend(v17, "frame");
            -[AXMLElementCoagulation _getYOverlap:obj2:](self, "_getYOverlap:obj2:", v19, v21, v23, v25, v26, v27, v28, v29);
            if (v30 <= 0.0)
            {
              objc_msgSend(v9, "addObject:", v10);
              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v31 = objc_claimAutoreleasedReturnValue();
              v32 = v10;
              v10 = (void *)v31;

            }
            objc_msgSend(v10, "addObject:", v16);

          }
          else
          {
            objc_msgSend(v10, "addObject:", v16);
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v139, v147, 16);
      }
      while (v13);
    }
    v110 = v11;

    v109 = v10;
    objc_msgSend(v9, "addObject:", v10);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v135 = 0u;
    v136 = 0u;
    v137 = 0u;
    v138 = 0u;
    v34 = v9;
    v115 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v135, v146, 16);
    v116 = v34;
    if (v115)
    {
      v113 = *(_QWORD *)v136;
      do
      {
        v35 = 0;
        do
        {
          if (*(_QWORD *)v136 != v113)
            objc_enumerationMutation(v34);
          v117 = v35;
          v36 = *(void **)(*((_QWORD *)&v135 + 1) + 8 * v35);
          v131 = 0u;
          v132 = 0u;
          v133 = 0u;
          v134 = 0u;
          obj = v114;
          v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v131, v145, 16);
          if (v37)
          {
            v38 = v37;
            v39 = *(_QWORD *)v132;
            v118 = *(_QWORD *)v132;
            v119 = v36;
            do
            {
              v40 = 0;
              v120 = v38;
              do
              {
                if (*(_QWORD *)v132 != v39)
                  objc_enumerationMutation(obj);
                v122 = v40;
                v41 = *(void **)(*((_QWORD *)&v131 + 1) + 8 * v40);
                objc_msgSend(v41, "frame");
                v43 = v42;
                v45 = v44;
                v47 = v46;
                v49 = v48;
                objc_msgSend(v36, "objectAtIndexedSubscript:", 0);
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v50, "frame");
                -[AXMLElementCoagulation _getYOverlap:obj2:](self, "_getYOverlap:obj2:", v43, v45, v47, v49, v51, v52, v53, v54);
                v56 = v55;

                objc_msgSend(v41, "frame");
                if (v56 >= CGRectGetHeight(v149))
                {
                  v129 = 0u;
                  v130 = 0u;
                  v127 = 0u;
                  v128 = 0u;
                  v57 = v36;
                  v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v127, v144, 16);
                  if (!v58)
                  {

LABEL_37:
                    objc_msgSend(v57, "addObject:", v41);
                    goto LABEL_38;
                  }
                  v59 = v58;
                  v60 = 0;
                  v61 = *(_QWORD *)v128;
                  do
                  {
                    for (j = 0; j != v59; ++j)
                    {
                      if (*(_QWORD *)v128 != v61)
                        objc_enumerationMutation(v57);
                      v63 = *(void **)(*((_QWORD *)&v127 + 1) + 8 * j);
                      objc_msgSend(v63, "frame");
                      v65 = v64;
                      v67 = v66;
                      v69 = v68;
                      v71 = v70;
                      objc_msgSend(v41, "frame");
                      if (AXMIsContainedBy(v65, v67, v69, v71, v72, v73, v74, v75, 1.0))
                      {
                        objc_msgSend(v63, "setIncludeChildren:", 0);
                        -[AXMLElementCoagulation _mergeFeatureIntoGroup:feature:](self, "_mergeFeatureIntoGroup:feature:", v63, v41);
                        objc_msgSend(v33, "addObject:", v41);
                        v60 = 1;
                      }
                    }
                    v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v127, v144, 16);
                  }
                  while (v59);

                  v39 = v118;
                  v36 = v119;
                  v38 = v120;
                  if ((v60 & 1) == 0)
                    goto LABEL_37;
                }
LABEL_38:
                v40 = v122 + 1;
              }
              while (v122 + 1 != v38);
              v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v131, v145, 16);
            }
            while (v38);
          }

          v34 = v116;
          v35 = v117 + 1;
        }
        while (v117 + 1 != v115);
        v115 = objc_msgSend(v116, "countByEnumeratingWithState:objects:count:", &v135, v146, 16);
      }
      while (v115);
    }

    if (objc_msgSend(v34, "count"))
    {
      v76 = 0;
      do
      {
        objc_msgSend(v34, "objectAtIndex:", v76);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXMLElementCoagulation _compareForX:](self, "_compareForX:", v77);
        v78 = (void *)objc_claimAutoreleasedReturnValue();

        -[AXMLElementCoagulation canvasSize](self, "canvasSize");
        v80 = v79 + 1.0;
        v123 = 0u;
        v124 = 0u;
        v125 = 0u;
        v126 = 0u;
        v81 = v78;
        v82 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v123, v143, 16);
        if (v82)
        {
          v83 = v82;
          v84 = *(_QWORD *)v124;
          v85 = 0.0;
          do
          {
            for (k = 0; k != v83; ++k)
            {
              if (*(_QWORD *)v124 != v84)
                objc_enumerationMutation(v81);
              v87 = *(void **)(*((_QWORD *)&v123 + 1) + 8 * k);
              objc_msgSend(v87, "frame");
              v80 = fmin(v80, CGRectGetMinY(v150));
              objc_msgSend(v87, "frame");
              v85 = fmax(v85, CGRectGetMaxY(v151));
            }
            v83 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v123, v143, 16);
          }
          while (v83);
        }
        else
        {
          v85 = 0.0;
        }

        if (objc_msgSend(v81, "count"))
        {
          v88 = 0;
          v89 = v85 - v80;
          do
          {
            objc_msgSend(v81, "objectAtIndex:", v88);
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v90, "frame");
            MinX = CGRectGetMinX(v152);
            objc_msgSend(v90, "frame");
            Width = CGRectGetWidth(v153);
            objc_msgSend(v90, "textLabel");
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v90, "feature");
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            v95 = objc_msgSend(v94, "uiClass");

            if (v95 == 11)
            {
              objc_msgSend(v90, "feature");
              v96 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v96, "value");
              v97 = objc_claimAutoreleasedReturnValue();

              v93 = (void *)v97;
            }
            objc_msgSend(v90, "feature");
            v98 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v98, "confidence");
            v100 = v99;
            -[AXMLElementCoagulation canvasSize](self, "canvasSize");
            v102 = v101;
            v104 = v103;
            objc_msgSend(v90, "childFeatures");
            v105 = (void *)objc_claimAutoreleasedReturnValue();
            +[AXMVisionFeature groupedFeatureWithElementRect:uiClass:confidence:label:canvasSize:subElements:](AXMVisionFeature, "groupedFeatureWithElementRect:uiClass:confidence:label:canvasSize:subElements:", 8, v93, v105, MinX, v80, Width, v89, v100, v102, v104);
            v106 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v90, "setFeature:", v106);
            objc_msgSend(v90, "setIncludeChildren:", 0);

            ++v88;
          }
          while (v88 < objc_msgSend(v81, "count"));
        }

        ++v76;
        v34 = v116;
      }
      while (v76 < objc_msgSend(v116, "count"));
    }
    v5 = v111;
    objc_msgSend(v111, "removeObjectsInArray:", v33);
    v107 = v111;

    v6 = v110;
    v7 = v114;
    v4 = v112;
  }
  else
  {
    v107 = v4;
  }

  return v107;
}

BOOL __62__AXMLElementCoagulation__getGroupedSegmentedControlFeatures___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "feature");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "uiClass") == 8;

  return v3;
}

BOOL __62__AXMLElementCoagulation__getGroupedSegmentedControlFeatures___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  _BOOL8 v4;
  void *v5;

  v2 = a2;
  objc_msgSend(v2, "feature");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "uiClass") == 11)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(v2, "feature");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "uiClass") == 17;

  }
  return v4;
}

- (id)_createToggleGroup:(id)a3 toGroup:(id)a4
{
  id v6;
  id v7;
  double MidY;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  uint64_t v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  double MidX;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;
  CGRect v42;
  CGRect v43;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "frame");
  MidX = CGRectGetMidX(v42);
  objc_msgSend(v6, "frame");
  MidY = CGRectGetMidY(v43);
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v37;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v37 != v12)
          objc_enumerationMutation(v9);
        -[AXMLElementCoagulation _mergeFeatureIntoGroup:feature:](self, "_mergeFeatureIntoGroup:feature:", v6, *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v13++));
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v11);
  }

  objc_msgSend(v6, "frame");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  objc_msgSend(v6, "feature");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "uiClass");
  objc_msgSend(v6, "feature");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "confidence");
  v26 = v25;
  objc_msgSend(v6, "textLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMLElementCoagulation canvasSize](self, "canvasSize");
  v29 = v28;
  v31 = v30;
  objc_msgSend(v6, "childFeatures");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[AXMVisionFeature groupedFeatureWithElementRect:uiClass:confidence:label:canvasSize:subElements:](AXMVisionFeature, "groupedFeatureWithElementRect:uiClass:confidence:label:canvasSize:subElements:", v23, v27, v32, v15, v17, v19, v21, v26, v29, v31);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v33, "setActivationPoint:", MidX, MidY);
  objc_msgSend(v6, "setFeature:", v33);
  objc_msgSend(v6, "setIncludeChildren:", 0);

  return v6;
}

- (id)_removeTextContainingOnlyToggles:(id)a3 toggleCheckboxTypes:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t i;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
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
  void *v30;
  void *v31;
  uint64_t v32;
  void *v34;
  id obj;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v6, "ax_filteredArrayUsingBlock:", &__block_literal_global_138);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = v7;
  v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  if (v38)
  {
    v36 = v6;
    v37 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v38; ++i)
      {
        if (*(_QWORD *)v45 != v37)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        v40 = 0u;
        v41 = 0u;
        v42 = 0u;
        v43 = 0u;
        v10 = v6;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
        if (v11)
        {
          v12 = v11;
          v39 = i;
          v13 = 0;
          v14 = *(_QWORD *)v41;
          while (2)
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v41 != v14)
                objc_enumerationMutation(v10);
              v16 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * j);
              if (v16 != v9)
              {
                objc_msgSend(v9, "frame");
                v18 = v17;
                v20 = v19;
                v22 = v21;
                v24 = v23;
                objc_msgSend(v16, "frame");
                if (AXMIsContainedBy(v18, v20, v22, v24, v25, v26, v27, v28, 1.0))
                {
                  v29 = (void *)MEMORY[0x1E0CB37E8];
                  objc_msgSend(v16, "feature");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v29, "numberWithInteger:", objc_msgSend(v30, "uiClass"));
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  v32 = objc_msgSend(v5, "indexOfObject:", v31);

                  if (v32 == 0x7FFFFFFFFFFFFFFFLL)
                  {

                    v6 = v36;
                    i = v39;
                    goto LABEL_21;
                  }
                  v13 = 1;
                }
              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
            if (v12)
              continue;
            break;
          }

          v6 = v36;
          i = v39;
          if ((v13 & 1) != 0)
            objc_msgSend(v34, "addObject:", v9);
        }
        else
        {

        }
LABEL_21:
        ;
      }
      v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    }
    while (v38);
  }

  objc_msgSend(v6, "removeObjectsInArray:", v34);
  return v6;
}

BOOL __79__AXMLElementCoagulation__removeTextContainingOnlyToggles_toggleCheckboxTypes___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "feature");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "uiClass") == 11;

  return v3;
}

- (id)_getGroupedToggleCheckboxWithText:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
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
  id v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  double v52;
  CGFloat v53;
  double v54;
  CGFloat v55;
  double v56;
  CGFloat v57;
  double v58;
  CGFloat v59;
  CGFloat v60;
  CGFloat v61;
  CGFloat v62;
  CGFloat v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  uint64_t v78;
  id v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  uint64_t v94;
  id v95;
  void *v96;
  id v97;
  uint64_t v98;
  void *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t k;
  void *v103;
  double v104;
  CGFloat v105;
  double v106;
  CGFloat v107;
  double v108;
  CGFloat v109;
  double v110;
  CGFloat v111;
  CGFloat v112;
  CGFloat v113;
  CGFloat v114;
  CGFloat v115;
  double v116;
  double v117;
  CGFloat v118;
  double v119;
  CGFloat v120;
  double v121;
  CGFloat v122;
  double v123;
  CGFloat v124;
  CGFloat v125;
  CGFloat v126;
  CGFloat v127;
  CGFloat v128;
  id v129;
  id v130;
  id v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t m;
  void *v136;
  id v137;
  uint64_t v138;
  uint64_t v139;
  unint64_t v140;
  uint64_t v141;
  uint64_t n;
  void *v143;
  double v144;
  CGFloat v145;
  double v146;
  CGFloat v147;
  double v148;
  CGFloat v149;
  double v150;
  CGFloat v151;
  CGFloat v152;
  CGFloat v153;
  CGFloat v154;
  CGFloat v155;
  double v156;
  id v158;
  void *v159;
  void *v160;
  unint64_t v161;
  void *v162;
  void *v163;
  void *v164;
  uint64_t v165;
  void *v166;
  void *v167;
  AXMLElementCoagulation *v168;
  id obj;
  void *v170;
  void *v171;
  uint64_t v172;
  void *v173;
  uint64_t v174;
  id v175;
  id v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  _QWORD v193[4];
  id v194;
  _QWORD v195[4];
  id v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  _QWORD v205[4];
  id v206;
  _BYTE v207[128];
  _BYTE v208[128];
  _BYTE v209[128];
  _BYTE v210[128];
  _BYTE v211[128];
  _BYTE v212[128];
  uint64_t v213;

  v213 = *MEMORY[0x1E0C80C00];
  v158 = a3;
  -[AXMLElementCoagulation _removeTextContainingOnlyToggles:toggleCheckboxTypes:](self, "_removeTextContainingOnlyToggles:toggleCheckboxTypes:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v205[0] = MEMORY[0x1E0C809B0];
  v205[1] = 3221225472;
  v205[2] = __60__AXMLElementCoagulation__getGroupedToggleCheckboxWithText___block_invoke;
  v205[3] = &unk_1E625E418;
  v206 = &unk_1E62895D8;
  objc_msgSend(v4, "ax_filteredArrayUsingBlock:", v205);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v7 = v6;
  objc_msgSend(v4, "ax_filteredArrayUsingBlock:", &__block_literal_global_145);
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  v160 = v4;
  v167 = v6;
  v162 = v8;
  if (objc_msgSend(v6, "count"))
  {
    v9 = 0;
    v10 = 0x1E0CB3000uLL;
    v168 = self;
    do
    {
      objc_msgSend(v7, "objectAtIndex:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v8, "containsObject:", v11) & 1) == 0)
      {
        v161 = v9;
        v170 = v11;
        objc_msgSend(v8, "addObject:", v11);
        v203 = 0u;
        v204 = 0u;
        v201 = 0u;
        v202 = 0u;
        v12 = v159;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v201, v212, 16);
        if (v13)
        {
          v14 = v13;
          v15 = 0;
          v16 = *(_QWORD *)v202;
          do
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v202 != v16)
                objc_enumerationMutation(v12);
              v18 = *(void **)(*((_QWORD *)&v201 + 1) + 8 * i);
              objc_msgSend(v18, "frame");
              v20 = v19;
              v22 = v21;
              v24 = v23;
              v26 = v25;
              objc_msgSend(v170, "frame");
              if (AXMIsContainedBy(v20, v22, v24, v26, v27, v28, v29, v30, 1.0))
              {
                v31 = v18;

                v15 = v31;
              }
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v201, v212, 16);
          }
          while (v14);
        }
        else
        {
          v15 = 0;
        }

        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v197 = 0u;
        v198 = 0u;
        v199 = 0u;
        v200 = 0u;
        obj = v4;
        v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v197, v211, 16);
        v34 = v170;
        v166 = v15;
        if (v33)
        {
          v35 = v33;
          v36 = *(_QWORD *)v198;
          do
          {
            for (j = 0; j != v35; ++j)
            {
              if (*(_QWORD *)v198 != v36)
                objc_enumerationMutation(obj);
              v38 = *(void **)(*((_QWORD *)&v197 + 1) + 8 * j);
              if ((objc_msgSend(v38, "isEqual:", v34) & 1) == 0 && (objc_msgSend(v8, "containsObject:", v38) & 1) == 0)
              {
                if (v15)
                {
                  objc_msgSend(v15, "frame");
                  v40 = v39;
                  v42 = v41;
                  v44 = v43;
                  v46 = v45;
                  objc_msgSend(v38, "frame");
                  if (AXMIsContainedBy(v40, v42, v44, v46, v47, v48, v49, v50, 0.8))
                    goto LABEL_30;
                }
                else
                {
                  objc_msgSend(v38, "feature");
                  v51 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v51, "uiClass") != 3)
                  {

                    v34 = v170;
LABEL_29:
                    objc_msgSend(v38, "frame");
                    v67 = v66;
                    v69 = v68;
                    v71 = v70;
                    v73 = v72;
                    objc_msgSend(v34, "frame");
                    if (!-[AXMLElementCoagulation _hasYOverlap:obj2:](v168, "_hasYOverlap:obj2:", v67, v69, v71, v73, v74, v75, v76, v77))continue;
LABEL_30:
                    objc_msgSend(v32, "addObject:", v38);
                    continue;
                  }
                  objc_msgSend(v38, "frame");
                  v53 = v52;
                  v55 = v54;
                  v57 = v56;
                  v59 = v58;
                  objc_msgSend(v170, "frame");
                  AXMIntersectionOverUnion(v53, v55, v57, v59, v60, v61, v62, v63);
                  v65 = v64;

                  v34 = v170;
                  v15 = v166;
                  if (v65 <= 0.0)
                    goto LABEL_29;
                }
              }
            }
            v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v197, v211, 16);
          }
          while (v35);
        }

        v78 = MEMORY[0x1E0C809B0];
        v195[0] = MEMORY[0x1E0C809B0];
        v195[1] = 3221225472;
        v195[2] = __60__AXMLElementCoagulation__getGroupedToggleCheckboxWithText___block_invoke_3;
        v195[3] = &unk_1E625E418;
        v79 = v34;
        v196 = v79;
        objc_msgSend(v32, "ax_filteredArrayUsingBlock:", v195);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v81 = (void *)objc_msgSend(v80, "mutableCopy");

        v193[0] = v78;
        v193[1] = 3221225472;
        v193[2] = __60__AXMLElementCoagulation__getGroupedToggleCheckboxWithText___block_invoke_4;
        v193[3] = &unk_1E625E418;
        v194 = &unk_1E62895D8;
        objc_msgSend(v81, "ax_filteredArrayUsingBlock:", v193);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        v83 = (void *)objc_msgSend(v82, "mutableCopy");

        if (objc_msgSend(v83, "count"))
        {
          objc_msgSend(v83, "addObject:", v79);
          v84 = v83;
          if (objc_msgSend(v83, "count"))
          {
            v85 = 0;
            v163 = v81;
            do
            {
              v165 = v85;
              objc_msgSend(v84, "objectAtIndex:", v85);
              v173 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "addObject:");
              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v171 = (void *)objc_claimAutoreleasedReturnValue();
              v189 = 0u;
              v190 = 0u;
              v191 = 0u;
              v192 = 0u;
              v175 = v81;
              v86 = objc_msgSend(v175, "countByEnumeratingWithState:objects:count:", &v189, v210, 16);
              if (v86)
              {
                v87 = v86;
                v88 = *(_QWORD *)v190;
                v172 = *(_QWORD *)v190;
                do
                {
                  v89 = 0;
                  v174 = v87;
                  do
                  {
                    if (*(_QWORD *)v190 != v88)
                      objc_enumerationMutation(v175);
                    v90 = *(void **)(*((_QWORD *)&v189 + 1) + 8 * v89);
                    v91 = *(void **)(v10 + 2024);
                    objc_msgSend(v90, "feature");
                    v92 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v91, "numberWithInteger:", objc_msgSend(v92, "uiClass"));
                    v93 = (void *)objc_claimAutoreleasedReturnValue();
                    v94 = objc_msgSend(&unk_1E62895D8, "indexOfObject:", v93);

                    if (v94 == 0x7FFFFFFFFFFFFFFFLL)
                    {
                      v95 = v173;
                      v185 = 0u;
                      v186 = 0u;
                      v187 = 0u;
                      v188 = 0u;
                      v96 = v84;
                      v97 = v84;
                      v98 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v185, v209, 16);
                      v99 = v95;
                      if (v98)
                      {
                        v100 = v98;
                        v101 = *(_QWORD *)v186;
                        v99 = v95;
                        do
                        {
                          for (k = 0; k != v100; ++k)
                          {
                            if (*(_QWORD *)v186 != v101)
                              objc_enumerationMutation(v97);
                            v103 = *(void **)(*((_QWORD *)&v185 + 1) + 8 * k);
                            objc_msgSend(v90, "frame");
                            v105 = v104;
                            v107 = v106;
                            v109 = v108;
                            v111 = v110;
                            objc_msgSend(v103, "frame");
                            v116 = AXMDistanceBetweenCenters(v105, v107, v109, v111, v112, v113, v114, v115);
                            objc_msgSend(v90, "frame");
                            v118 = v117;
                            v120 = v119;
                            v122 = v121;
                            v124 = v123;
                            objc_msgSend(v99, "frame");
                            if (v116 < AXMDistanceBetweenCenters(v118, v120, v122, v124, v125, v126, v127, v128))
                            {
                              v129 = v103;

                              v99 = v129;
                            }
                          }
                          v100 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v185, v209, 16);
                        }
                        while (v100);
                      }

                      if (objc_msgSend(v99, "isEqual:", v95))
                        objc_msgSend(v171, "addObject:", v90);

                      v10 = 0x1E0CB3000;
                      v84 = v96;
                      v88 = v172;
                      v87 = v174;
                    }
                    ++v89;
                  }
                  while (v89 != v87);
                  v87 = objc_msgSend(v175, "countByEnumeratingWithState:objects:count:", &v189, v210, 16);
                }
                while (v87);
              }

              v130 = -[AXMLElementCoagulation _createToggleGroup:toGroup:](v168, "_createToggleGroup:toGroup:", v173, v171);
              objc_msgSend(obj, "removeObjectsInArray:", v171);

              v85 = v165 + 1;
              v8 = v162;
              v81 = v163;
            }
            while (v165 + 1 < (unint64_t)objc_msgSend(v84, "count"));
          }
        }
        else
        {
          v131 = -[AXMLElementCoagulation _createToggleGroup:toGroup:](v168, "_createToggleGroup:toGroup:", v79, v81);
          objc_msgSend(obj, "removeObjectsInArray:", v81);
          v84 = v83;
        }

        v4 = v160;
        v9 = v161;
        v7 = v167;
        v11 = v170;
      }

      ++v9;
    }
    while (v9 < objc_msgSend(v7, "count"));
  }
  v183 = 0u;
  v184 = 0u;
  v181 = 0u;
  v182 = 0u;
  v176 = v159;
  v132 = objc_msgSend(v176, "countByEnumeratingWithState:objects:count:", &v181, v208, 16);
  if (v132)
  {
    v133 = v132;
    v134 = *(_QWORD *)v182;
    do
    {
      for (m = 0; m != v133; ++m)
      {
        if (*(_QWORD *)v182 != v134)
          objc_enumerationMutation(v176);
        v136 = *(void **)(*((_QWORD *)&v181 + 1) + 8 * m);
        v177 = 0u;
        v178 = 0u;
        v179 = 0u;
        v180 = 0u;
        v137 = v7;
        v138 = objc_msgSend(v137, "countByEnumeratingWithState:objects:count:", &v177, v207, 16);
        if (v138)
        {
          v139 = v138;
          v140 = 0;
          v141 = *(_QWORD *)v178;
          do
          {
            for (n = 0; n != v139; ++n)
            {
              if (*(_QWORD *)v178 != v141)
                objc_enumerationMutation(v137);
              v143 = *(void **)(*((_QWORD *)&v177 + 1) + 8 * n);
              objc_msgSend(v136, "frame");
              v145 = v144;
              v147 = v146;
              v149 = v148;
              v151 = v150;
              objc_msgSend(v143, "frame");
              AXMIntersectionOverUnion(v145, v147, v149, v151, v152, v153, v154, v155);
              if (v156 > 0.0)
                ++v140;
            }
            v139 = objc_msgSend(v137, "countByEnumeratingWithState:objects:count:", &v177, v207, 16);
          }
          while (v139);

          v7 = v167;
          if (v140 >= 2)
            objc_msgSend(v164, "addObject:", v136);
        }
        else
        {

        }
      }
      v133 = objc_msgSend(v176, "countByEnumeratingWithState:objects:count:", &v181, v208, 16);
    }
    while (v133);
  }

  objc_msgSend(v160, "removeObjectsInArray:", v164);
  return v160;
}

BOOL __60__AXMLElementCoagulation__getGroupedToggleCheckboxWithText___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "feature");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithInteger:", objc_msgSend(v4, "uiClass"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v2, "indexOfObject:", v5) != 0x7FFFFFFFFFFFFFFFLL;

  return v6;
}

BOOL __60__AXMLElementCoagulation__getGroupedToggleCheckboxWithText___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "feature");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "uiClass") == 3;

  return v3;
}

BOOL __60__AXMLElementCoagulation__getGroupedToggleCheckboxWithText___block_invoke_3(uint64_t a1, void *a2)
{
  double Height;
  double v4;
  CGRect v6;
  CGRect v7;
  CGRect v8;

  objc_msgSend(a2, "frame");
  Height = CGRectGetHeight(v6);
  objc_msgSend(*(id *)(a1 + 32), "frame");
  v4 = CGRectGetHeight(v7);
  objc_msgSend(*(id *)(a1 + 32), "frame");
  return Height < fmax(v4, CGRectGetWidth(v8)) * 4.0;
}

BOOL __60__AXMLElementCoagulation__getGroupedToggleCheckboxWithText___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "feature");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithInteger:", objc_msgSend(v4, "uiClass"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v2, "indexOfObject:", v5) != 0x7FFFFFFFFFFFFFFFLL;

  return v6;
}

- (id)_groupFeaturesByContainment:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  _BOOL4 v23;
  void *v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  void *v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  BOOL v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  id v52;
  void *v53;
  uint64_t v54;
  unint64_t v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  -[AXMLElementCoagulation _compareArea:](self, "_compareArea:", v5);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  v52 = v4;
  v54 = objc_msgSend(v4, "count");
  if (!v54)
    goto LABEL_27;
  v55 = 0;
  do
  {
    objc_msgSend(v53, "objectAtIndex:", v55);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    while (v7 <= v55)
    {
LABEL_19:
      if (++v7 == v54)
        goto LABEL_26;
    }
    objc_msgSend(v53, "objectAtIndex:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "feature");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "frame");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    objc_msgSend(v6, "feature");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "frame");
    v23 = AXMIsContainedBy(v11, v13, v15, v17, v19, v20, v21, v22, 0.7);

    if (!v23)
      goto LABEL_18;
    objc_msgSend(v6, "feature");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "frame");
    v26 = v25;
    v28 = v27;
    v30 = v29;
    v32 = v31;
    objc_msgSend(v8, "feature");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "frame");
    AXMIntersectionOverUnion(v26, v28, v30, v32, v34, v35, v36, v37);
    if (v38 <= 0.7)
      goto LABEL_22;
    objc_msgSend(v6, "feature");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v39, "uiClass") == 7)
    {
      objc_msgSend(v8, "feature");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v8;
      v42 = objc_msgSend(v40, "uiClass");

      v43 = v42 == 3;
      v8 = v41;
      if (!v43)
        goto LABEL_23;
      objc_msgSend(v41, "setTopLevel:", 0);
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      objc_msgSend(v41, "subfeatures");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
      if (v45)
      {
        v46 = v45;
        v47 = *(_QWORD *)v57;
        do
        {
          v48 = 0;
          do
          {
            if (*(_QWORD *)v57 != v47)
              objc_enumerationMutation(v44);
            -[AXMLElementCoagulation _mergeFeatureIntoGroup:feature:](self, "_mergeFeatureIntoGroup:feature:", v6, *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * v48++));
          }
          while (v46 != v48);
          v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
        }
        while (v46);
      }

      v8 = v41;
LABEL_18:

      goto LABEL_19;
    }

LABEL_22:
LABEL_23:
    objc_msgSend(v6, "setTopLevel:", 0);
    objc_msgSend(v8, "feature");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v49, "uiClass");

    if (v50 != 11)
      -[AXMLElementCoagulation _mergeFeatureIntoGroup:feature:](self, "_mergeFeatureIntoGroup:feature:", v8, v6);

LABEL_26:
    ++v55;
  }
  while (v55 != v54);
LABEL_27:

  return v52;
}

- (id)_getClosestDetectionBelow:(id)a3 target:(id)a4 maxDistance:(int64_t)a5
{
  id v7;
  id v8;
  double MaxY;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
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
  double v29;
  double v30;
  double v31;
  double Width;
  uint64_t v33;
  double MinY;
  uint64_t v35;
  double v36;
  id v37;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;

  v45 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "frame");
  MaxY = CGRectGetMaxY(v46);
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = (uint64_t)MaxY;
    v15 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v41 != v15)
          objc_enumerationMutation(v10);
        v17 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        objc_msgSend(v17, "frame");
        v19 = v18;
        v21 = v20;
        v23 = v22;
        v25 = v24;
        objc_msgSend(v8, "frame");
        -[AXMLElementCoagulation _getXOverlap:obj2:](self, "_getXOverlap:obj2:", v19, v21, v23, v25, v26, v27, v28, v29);
        v31 = (double)(unint64_t)v30;
        objc_msgSend(v17, "frame");
        Width = CGRectGetWidth(v47);
        objc_msgSend(v8, "frame");
        if (fmin(Width, CGRectGetWidth(v48)) * 0.5 < v31)
        {
          objc_msgSend(v17, "frame");
          v33 = (uint64_t)CGRectGetMaxY(v49);
          objc_msgSend(v17, "frame");
          MinY = CGRectGetMinY(v50);
          if (v33 > v14)
          {
            v35 = (uint64_t)MinY;
            if ((uint64_t)MinY - v14 < a5)
            {
              objc_msgSend(v13, "frame");
              v36 = CGRectGetMinY(v51);
              if (!v13 || v35 < (uint64_t)v36)
              {
                v37 = v17;

                v13 = v37;
              }
            }
          }
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    }
    while (v12);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)_getGroupedPictureAndSubtitleFeature:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  double v22;
  void *v23;
  double MinY;
  void *v25;
  double v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  double MidX;
  double MidY;
  void *v57;
  id v58;
  void *v59;
  void *v61;
  id v62;
  id obj;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  _QWORD v69[4];
  id v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _BYTE v79[128];
  _BYTE v80[128];
  uint64_t v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;

  v81 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = v4;
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  obj = v5;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v80, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v76;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v76 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * i);
        objc_msgSend(v12, "feature");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "uiClass") == 11)
        {

          v14 = v7;
        }
        else
        {
          objc_msgSend(v12, "feature");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "uiClass");

          if (v16 == 17)
            v14 = v7;
          else
            v14 = v64;
        }
        objc_msgSend(v14, "addObject:", v12);
        objc_msgSend(v12, "feature");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v17, "uiClass") == 7)
        {

        }
        else
        {
          objc_msgSend(v12, "feature");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "uiClass");

          if (v19 != 15)
            continue;
        }
        objc_msgSend(v6, "addObject:", v12);
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v80, 16);
    }
    while (v9);
  }

  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  v62 = v6;
  v67 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v71, v79, 16);
  if (v67)
  {
    v66 = *(_QWORD *)v72;
    do
    {
      for (j = 0; j != v67; ++j)
      {
        if (*(_QWORD *)v72 != v66)
          objc_enumerationMutation(v62);
        v21 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * j);
        -[AXMLElementCoagulation canvasSize](self, "canvasSize");
        -[AXMLElementCoagulation _getClosestDetectionBelow:target:maxDistance:](self, "_getClosestDetectionBelow:target:maxDistance:", v7, v21, (uint64_t)(v22 * 0.03));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23 && objc_msgSend(v65, "indexOfObject:", v23) == 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v23, "frame");
          MinY = CGRectGetMinY(v82);
          objc_msgSend(v21, "frame");
          -[AXMLElementCoagulation _getClosestDetectionBelow:target:maxDistance:](self, "_getClosestDetectionBelow:target:maxDistance:", v64, v23, (uint64_t)(MinY - CGRectGetMaxY(v83)));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v25)
          {
            objc_msgSend(v65, "addObject:", v23);
            -[AXMLElementCoagulation _mergeFeatureIntoGroup:feature:](self, "_mergeFeatureIntoGroup:feature:", v21, v23);
            -[AXMLElementCoagulation canvasSize](self, "canvasSize");
            -[AXMLElementCoagulation _getClosestDetectionBelow:target:maxDistance:](self, "_getClosestDetectionBelow:target:maxDistance:", v7, v23, (uint64_t)(v26 * 0.03));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            if (v27)
            {
              if (objc_msgSend(v65, "indexOfObject:", v27) != 0x7FFFFFFFFFFFFFFFLL)
                goto LABEL_34;
              objc_msgSend(v27, "frame");
              v28 = CGRectGetMinY(v84);
              objc_msgSend(v23, "frame");
              -[AXMLElementCoagulation _getClosestDetectionBelow:target:maxDistance:](self, "_getClosestDetectionBelow:target:maxDistance:", v61, v27, (uint64_t)(v28 - CGRectGetMaxY(v85)));
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v29)
              {
                objc_msgSend(v65, "addObject:", v27);
                -[AXMLElementCoagulation _mergeFeatureIntoGroup:feature:](self, "_mergeFeatureIntoGroup:feature:", v21, v27);
              }

            }
          }

        }
        objc_msgSend(v21, "subfeatures");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "count");

        if (!v31)
          goto LABEL_35;
        objc_msgSend(v21, "subfeatures");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXMLElementCoagulation _reorderByYCut:](self, "_reorderByYCut:", v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = (void *)objc_msgSend(v33, "mutableCopy");
        objc_msgSend(v21, "setSubfeatures:", v34);

        objc_msgSend(v21, "frame");
        v36 = v35;
        v38 = v37;
        v40 = v39;
        v42 = v41;
        objc_msgSend(v21, "feature");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v43, "uiClass");
        objc_msgSend(v21, "feature");
        v45 = v7;
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "confidence");
        v48 = v47;
        objc_msgSend(v21, "textLabel");
        v68 = v23;
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXMLElementCoagulation canvasSize](self, "canvasSize");
        v51 = v50;
        v53 = v52;
        objc_msgSend(v21, "childFeatures");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        +[AXMVisionFeature groupedFeatureWithElementRect:uiClass:confidence:label:canvasSize:subElements:](AXMVisionFeature, "groupedFeatureWithElementRect:uiClass:confidence:label:canvasSize:subElements:", v44, v49, v54, v36, v38, v40, v42, v48, v51, v53);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        v7 = v45;
        objc_msgSend(v21, "setFeature:", v27);
        objc_msgSend(v21, "setIncludeChildren:", 0);
        objc_msgSend(v21, "frame");
        MidX = CGRectGetMidX(v86);
        objc_msgSend(v21, "frame");
        MidY = CGRectGetMidY(v87);
        objc_msgSend(v21, "feature");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "setActivationPoint:", MidX, MidY);

        v23 = v68;
LABEL_34:

LABEL_35:
      }
      v67 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v71, v79, 16);
    }
    while (v67);
  }

  v69[0] = MEMORY[0x1E0C809B0];
  v69[1] = 3221225472;
  v69[2] = __63__AXMLElementCoagulation__getGroupedPictureAndSubtitleFeature___block_invoke;
  v69[3] = &unk_1E625E418;
  v70 = v65;
  v58 = v65;
  objc_msgSend(v61, "ax_filteredArrayUsingBlock:", v69);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  return v59;
}

BOOL __63__AXMLElementCoagulation__getGroupedPictureAndSubtitleFeature___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", a2) == 0x7FFFFFFFFFFFFFFFLL;
}

- (id)_getTopLevelFeatureGroups:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (objc_msgSend(v11, "topLevel", (_QWORD)v21))
        {
          objc_msgSend(v11, "subfeatures");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "count");

          if (v13)
          {
            objc_msgSend(v11, "subfeatures");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[AXMLElementCoagulation _reorderByXCut:](self, "_reorderByXCut:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = (void *)objc_msgSend(v15, "mutableCopy");
            objc_msgSend(v11, "setSubfeatures:", v16);

          }
          objc_msgSend(v5, "addObject:", v11);
          objc_msgSend(v11, "feature");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "uiClass");

          if (v18 == 4)
          {
            objc_msgSend(v11, "setIncludeChildren:", 0);
            objc_msgSend(v11, "subfeatures");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObjectsFromArray:", v19);

          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)_groupSingleContainerAsButton:(id)a3 featureToGroup:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  unint64_t v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unint64_t v28;
  void *v29;
  id v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t i;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "mutableCopy");
  objc_msgSend(v7, "feature");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "uiClass") == 3)
    goto LABEL_4;
  objc_msgSend(v7, "feature");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "uiClass") == 7)
  {

LABEL_4:
LABEL_5:
    objc_msgSend(v7, "feature");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "uiClass") == 3)
    {
      objc_msgSend(v7, "subfeatures");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");

      if (!v14)
      {
        objc_msgSend(v8, "addObject:", v7);
        goto LABEL_20;
      }
    }
    else
    {

    }
    objc_msgSend(v7, "feature");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "uiClass");

    objc_msgSend(v7, "feature");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "uiClass");

    if (v18 == 3)
      v19 = 17;
    else
      v19 = v16;
    if (-[AXMLElementCoagulation isRTL](self, "isRTL"))
    {
      objc_msgSend(v7, "subfeatures");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "count");

      if (v21 >= 2)
      {
        objc_msgSend(v7, "subfeatures");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = -[AXMLElementCoagulation _applyHorizontalMirrorToFeatures:](self, "_applyHorizontalMirrorToFeatures:", v22);

      }
    }
    objc_msgSend(v7, "subfeatures");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMLElementCoagulation _reorderByYCut:](self, "_reorderByYCut:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v25, "mutableCopy");
    objc_msgSend(v7, "setSubfeatures:", v26);

    if (-[AXMLElementCoagulation isRTL](self, "isRTL"))
    {
      objc_msgSend(v7, "subfeatures");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "count");

      if (v28 >= 2)
      {
        objc_msgSend(v7, "subfeatures");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = -[AXMLElementCoagulation _applyHorizontalMirrorToFeatures:](self, "_applyHorizontalMirrorToFeatures:", v29);

      }
    }
    objc_msgSend(v7, "frame");
    v32 = v31;
    v34 = v33;
    v36 = v35;
    v38 = v37;
    objc_msgSend(v7, "feature");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "confidence");
    v41 = v40;
    objc_msgSend(v7, "textLabel");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMLElementCoagulation canvasSize](self, "canvasSize");
    v44 = v43;
    v46 = v45;
    objc_msgSend(v7, "childFeatures");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    +[AXMVisionFeature groupedFeatureWithElementRect:uiClass:confidence:label:canvasSize:subElements:](AXMVisionFeature, "groupedFeatureWithElementRect:uiClass:confidence:label:canvasSize:subElements:", v19, v42, v47, v32, v34, v36, v38, v41, v44, v46);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "subfeatures");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObjectsFromArray:", v49);

    objc_msgSend(v7, "setFeature:", v48);
    objc_msgSend(v7, "setIncludeChildren:", 0);
    goto LABEL_19;
  }
  objc_msgSend(v7, "feature");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend(v56, "uiClass");

  if (v57 == 15)
    goto LABEL_5;
  objc_msgSend(v7, "feature");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v58, "uiClass") == 5)
  {

  }
  else
  {
    objc_msgSend(v7, "feature");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v59, "uiClass");

    if (v60 != 16)
      goto LABEL_20;
  }
  objc_msgSend(v7, "subfeatures");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = objc_msgSend(v61, "count");

  if (v62 == 1)
  {
    objc_msgSend(v7, "subfeatures");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "objectAtIndex:", 0);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v48, "feature");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v64, "uiClass") == 11)
    {

    }
    else
    {
      objc_msgSend(v48, "feature");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = objc_msgSend(v65, "uiClass");

      if (v66 != 17)
      {
LABEL_19:

        goto LABEL_20;
      }
    }
    objc_msgSend(v7, "setIncludeChildren:", 0);
    -[AXMLElementCoagulation _removeFeatureFromGroup:feature:](self, "_removeFeatureFromGroup:feature:", v7, v48);
    objc_msgSend(v8, "addObject:", v48);
    goto LABEL_19;
  }
LABEL_20:
  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v50 = v8;
  v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
  if (v51)
  {
    v52 = v51;
    v53 = *(_QWORD *)v68;
    do
    {
      for (i = 0; i != v52; ++i)
      {
        if (*(_QWORD *)v68 != v53)
          objc_enumerationMutation(v50);
        objc_msgSend(v9, "removeObject:", *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * i), (_QWORD)v67);
      }
      v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
    }
    while (v52);
  }

  return v9;
}

- (id)_getGroupedTextButtonFeatures:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t i;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  v6 = objc_msgSend(v4, "copy");
  v7 = (void *)v6;
  if (v5)
  {
    for (i = 0; i != v5; ++i)
    {
      objc_msgSend(v4, "objectAtIndex:", i);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXMLElementCoagulation _groupSingleContainerAsButton:featureToGroup:](self, "_groupSingleContainerAsButton:featureToGroup:", v4, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = v10;
    }
  }
  else
  {
    v10 = (void *)v6;
  }

  return v10;
}

- (void)_mergeFeatureIntoGroup:(id)a3 feature:(id)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  void *v22;
  id v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  v23 = a3;
  v5 = a4;
  objc_msgSend(v5, "setTopLevel:", 0);
  objc_msgSend(v23, "frame");
  if (CGRectIsEmpty(v24))
  {
    objc_msgSend(v5, "frame");
  }
  else
  {
    objc_msgSend(v23, "frame");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    objc_msgSend(v5, "frame");
    v26.origin.x = v18;
    v26.origin.y = v19;
    v26.size.width = v20;
    v26.size.height = v21;
    v25.origin.x = v11;
    v25.origin.y = v13;
    v25.size.width = v15;
    v25.size.height = v17;
    *(CGRect *)&v6 = CGRectUnion(v25, v26);
  }
  objc_msgSend(v23, "setFrame:", v6, v7, v8, v9);
  objc_msgSend(v23, "subfeatures");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObject:", v5);

}

- (void)_removeFeatureFromGroup:(id)a3 feature:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  BOOL IsEmpty;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;
  CGRect v39;
  CGRect v40;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "setTopLevel:", objc_msgSend(v5, "topLevel"));
  objc_msgSend(v5, "subfeatures");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObject:", v6);

  objc_msgSend(v5, "subfeatures");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    v9 = *MEMORY[0x1E0C9D648];
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  else
  {
    objc_msgSend(v5, "feature");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "frame");
    v9 = v14;
    v10 = v15;
    v11 = v16;
    v12 = v17;

  }
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  objc_msgSend(v5, "subfeatures", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v34;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v34 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v22);
        v39.origin.x = v9;
        v39.origin.y = v10;
        v39.size.width = v11;
        v39.size.height = v12;
        IsEmpty = CGRectIsEmpty(v39);
        objc_msgSend(v23, "frame");
        v29 = v25;
        v30 = v26;
        v31 = v27;
        v32 = v28;
        if (!IsEmpty)
        {
          v40.origin.x = v9;
          v40.origin.y = v10;
          v40.size.width = v11;
          v40.size.height = v12;
          *(CGRect *)&v25 = CGRectUnion(v40, *(CGRect *)&v29);
        }
        v9 = v25;
        v10 = v26;
        v11 = v27;
        v12 = v28;
        ++v22;
      }
      while (v20 != v22);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v20);
  }

  objc_msgSend(v5, "setFrame:", v9, v10, v11, v12);
}

- (BOOL)_allTabGroupsHaveSingleSubfeature:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  unint64_t v9;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "subfeatures", (_QWORD)v12);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "count");

        if (v9 > 1)
        {
          v10 = 0;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
  v10 = 1;
LABEL_11:

  return v10;
}

- (id)_getTabGroupSubfeatureUIClassTypes:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id obj;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v5)
  {
    v6 = v5;
    v19 = *(_QWORD *)v25;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v25 != v19)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v7);
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        objc_msgSend(v8, "subfeatures");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v21;
          do
          {
            v13 = 0;
            do
            {
              if (*(_QWORD *)v21 != v12)
                objc_enumerationMutation(v9);
              v14 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v13), "feature");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "numberWithInteger:", objc_msgSend(v15, "uiClass"));
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "addObject:", v16);

              ++v13;
            }
            while (v11 != v13);
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          }
          while (v11);
        }

        ++v7;
      }
      while (v7 != v6);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v6);
  }

  return v4;
}

- (BOOL)_shouldBeTabBar:(BOOL)a3 groupedTabButtons:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  BOOL v11;

  v4 = a3;
  v6 = a4;
  -[AXMLElementCoagulation _getTabGroupSubfeatureUIClassTypes:](self, "_getTabGroupSubfeatureUIClassTypes:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v11 = (!v4
      || objc_msgSend(v7, "count") == 1
      && (objc_msgSend(v8, "anyObject"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v9, "longValue"),
          v9,
          v10 != 11))
     && (unint64_t)objc_msgSend(v6, "count") < 6;

  return v11;
}

- (void)_improveFeatureFrames:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  double v16;
  double v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  uint64_t i;
  void *v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double MaxX;
  CGFloat MinX;
  double v53;
  double v54;
  BOOL v55;
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
  double v68;
  double MaxY;
  CGFloat MinY;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  uint64_t v84;
  double v85;
  double v86;
  void *v87;
  void *v88;
  double v89;
  double v90;
  double v91;
  double v92;
  uint64_t v93;
  id v94;
  void *v95;
  void *v96;
  void *v97;
  uint64_t v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  _BYTE v107[128];
  _BYTE v108[128];
  uint64_t v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;
  CGRect v113;
  CGRect v114;
  CGRect v115;
  CGRect v116;
  CGRect v117;
  CGRect v118;
  CGRect v119;
  CGRect v120;
  CGRect v121;
  CGRect v122;
  CGRect v123;

  v109 = *MEMORY[0x1E0C80C00];
  v103 = 0u;
  v104 = 0u;
  v105 = 0u;
  v106 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v103, v108, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v104;
    do
    {
      v8 = 0;
      v98 = v6;
      do
      {
        if (*(_QWORD *)v104 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * v8);
        -[AXMLElementCoagulation canvasSize](self, "canvasSize");
        v11 = v10;
        -[AXMLElementCoagulation canvasSize](self, "canvasSize");
        v13 = v12;
        objc_msgSend(v9, "feature");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "uiClass");

        if (v15 != 8)
        {
          -[AXMLElementCoagulation canvasSize](self, "canvasSize");
          v17 = v16 * 0.125;
          objc_msgSend(v9, "frame");
          if (CGRectGetWidth(v110) <= v17 || (objc_msgSend(v9, "frame"), CGRectGetHeight(v111) <= v17))
          {
            v101 = 0u;
            v102 = 0u;
            v99 = 0u;
            v100 = 0u;
            v18 = v4;
            v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v99, v107, 16);
            if (v19)
            {
              v20 = v19;
              v21 = *(_QWORD *)v100;
              v22 = 0.0;
              v23 = 0.0;
              do
              {
                for (i = 0; i != v20; ++i)
                {
                  if (*(_QWORD *)v100 != v21)
                    objc_enumerationMutation(v18);
                  v25 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * i);
                  if ((objc_msgSend(v9, "isEqual:", v25) & 1) == 0)
                  {
                    objc_msgSend(v9, "frame");
                    v27 = v26;
                    v29 = v28;
                    v31 = v30;
                    v33 = v32;
                    objc_msgSend(v25, "frame");
                    AXMIntersectionOverUnion(v27, v29, v31, v33, v34, v35, v36, v37);
                    if (v38 != 0.0)
                      goto LABEL_31;
                    objc_msgSend(v9, "frame");
                    v40 = v39;
                    v42 = v41;
                    v44 = v43;
                    v46 = v45;
                    objc_msgSend(v25, "frame");
                    if (-[AXMLElementCoagulation _hasYOverlap:obj2:](self, "_hasYOverlap:obj2:", v40, v42, v44, v46, v47, v48, v49, v50))
                    {
                      objc_msgSend(v25, "frame");
                      MaxX = CGRectGetMaxX(v112);
                      objc_msgSend(v9, "frame");
                      MinX = CGRectGetMinX(v113);
                      v53 = fmax(v23, MaxX);
                      if (MaxX <= MinX)
                        v23 = v53;
                      objc_msgSend(v25, "frame");
                      v54 = CGRectGetMinX(v114);
                      objc_msgSend(v9, "frame");
                      v55 = v54 < CGRectGetMaxX(v115);
                      v56 = fmin(v11, v54);
                      if (!v55)
                        v11 = v56;
                    }
                    objc_msgSend(v9, "frame");
                    v58 = v57;
                    v60 = v59;
                    v62 = v61;
                    v64 = v63;
                    objc_msgSend(v25, "frame");
                    if (-[AXMLElementCoagulation _hasXOverlap:obj2:](self, "_hasXOverlap:obj2:", v58, v60, v62, v64, v65, v66, v67, v68))
                    {
                      objc_msgSend(v25, "frame");
                      MaxY = CGRectGetMaxY(v116);
                      objc_msgSend(v9, "frame");
                      MinY = CGRectGetMinY(v117);
                      v71 = fmax(v22, MaxY);
                      if (MaxY <= MinY)
                        v22 = v71;
                      objc_msgSend(v25, "frame");
                      v72 = CGRectGetMinY(v118);
                      objc_msgSend(v9, "frame");
                      if (v72 >= CGRectGetMaxY(v119))
                        v13 = fmin(v13, v72);
                    }
                  }
                }
                v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v99, v107, 16);
              }
              while (v20);
            }
            else
            {
              v22 = 0.0;
              v23 = 0.0;
            }

            objc_msgSend(v9, "frame");
            v73 = fmax(v23, CGRectGetMinX(v120) + -20.0);
            objc_msgSend(v9, "frame");
            v74 = fmax(v22, CGRectGetMinY(v121) + -20.0);
            objc_msgSend(v9, "frame");
            v75 = fmin(v11, CGRectGetMaxX(v122) + 20.0);
            objc_msgSend(v9, "frame");
            v76 = fmin(v13, CGRectGetMaxY(v123) + 20.0);
            v77 = fmax(v73, 0.0);
            v78 = fmax(v74, 0.0);
            -[AXMLElementCoagulation canvasSize](self, "canvasSize");
            v80 = fmin(v75, v79);
            -[AXMLElementCoagulation canvasSize](self, "canvasSize");
            v82 = v80 - v77;
            v83 = fmin(v76, v81) - v78;
            objc_msgSend(v9, "setFrame:", v77, v78, v82, v83);
            objc_msgSend(v9, "feature");
            v97 = (void *)objc_claimAutoreleasedReturnValue();
            v84 = objc_msgSend(v97, "uiClass");
            objc_msgSend(v9, "confidence");
            v86 = v85;
            objc_msgSend(v9, "feature");
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v87, "value");
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            -[AXMLElementCoagulation canvasSize](self, "canvasSize");
            v90 = v89;
            v92 = v91;
            objc_msgSend(v9, "childFeatures");
            v93 = v7;
            v94 = v4;
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            +[AXMVisionFeature groupedFeatureWithElementRect:uiClass:confidence:label:canvasSize:subElements:](AXMVisionFeature, "groupedFeatureWithElementRect:uiClass:confidence:label:canvasSize:subElements:", v84, v88, v95, v77, v78, v82, v83, v86, v90, v92);
            v18 = (id)objc_claimAutoreleasedReturnValue();

            v4 = v94;
            v7 = v93;

            objc_msgSend(v9, "feature");
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v96, "activationPoint");
            objc_msgSend(v18, "setActivationPoint:");

            objc_msgSend(v9, "setFeature:", v18);
LABEL_31:

            v6 = v98;
          }
        }
        ++v8;
      }
      while (v8 != v6);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v103, v108, 16);
    }
    while (v6);
  }

}

- (id)_getFeaturesForAXMLTabButtonGroups:(id)a3
{
  id v4;
  unint64_t v5;
  double v6;
  unint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  BOOL v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  unint64_t v53;
  double v54;
  void *v55;
  void *v56;
  double MaxX;
  double v58;
  double v59;
  double v60;
  double MinX;
  void *v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  void *v68;
  void *v69;
  void *v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  void *v81;
  double v82;
  double v83;
  double v84;
  double v85;
  void *v86;
  void *v87;
  unint64_t v89;
  unint64_t v90;
  double v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  _BYTE v100[128];
  _BYTE v101[128];
  uint64_t v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;
  CGRect v113;
  CGRect v114;
  CGRect v115;
  CGRect v116;
  CGRect v117;
  CGRect v118;

  v102 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  -[AXMLElementCoagulation canvasSize](self, "canvasSize");
  v7 = (unint64_t)v6;
  v96 = 0u;
  v97 = 0u;
  v98 = 0u;
  v99 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v96, v101, 16);
  if (v9)
  {
    v10 = v9;
    v89 = v5;
    v11 = 0;
    v12 = 0;
    v13 = *(_QWORD *)v97;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v97 != v13)
          objc_enumerationMutation(v8);
        v15 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * i);
        objc_msgSend(v15, "frame", v89);
        v7 = (unint64_t)fmin((double)v7, CGRectGetMinY(v103));
        objc_msgSend(v15, "frame");
        v12 = (unint64_t)fmax((double)v12, CGRectGetMaxY(v104));
        objc_msgSend(v15, "subfeatures");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "count") == 1;

        v11 |= v17;
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v96, v101, 16);
    }
    while (v10);

    if ((v11 & 1) != 0)
    {
      v94 = 0u;
      v95 = 0u;
      v92 = 0u;
      v93 = 0u;
      v18 = v8;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v92, v100, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v93;
        do
        {
          for (j = 0; j != v20; ++j)
          {
            if (*(_QWORD *)v93 != v21)
              objc_enumerationMutation(v18);
            v23 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * j);
            objc_msgSend(v23, "subfeatures");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v24, "count");

            if (v25 == 1)
            {
              objc_msgSend(v23, "frame");
              v26 = (uint64_t)fmax(CGRectGetMinX(v105) + -20.0, 0.0);
              objc_msgSend(v23, "frame");
              v27 = fmax(CGRectGetMinY(v106) + -20.0, 0.0);
              -[AXMLElementCoagulation canvasSize](self, "canvasSize");
              v29 = v28;
              objc_msgSend(v23, "frame");
              v30 = (uint64_t)fmin(v29, CGRectGetMaxX(v107) + 20.0);
              -[AXMLElementCoagulation canvasSize](self, "canvasSize");
              v32 = v31;
              objc_msgSend(v23, "frame");
              objc_msgSend(v23, "setFrame:", (double)v26, (double)(uint64_t)v27, (double)(v30 - v26), (double)((uint64_t)fmin(v32, CGRectGetMaxY(v108) + 20.0) - (uint64_t)v27));
            }
            objc_msgSend(v23, "subfeatures");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            -[AXMLElementCoagulation _compareForY:](self, "_compareForY:", v33);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = (void *)objc_msgSend(v34, "mutableCopy");
            objc_msgSend(v23, "setSubfeatures:", v35);

            objc_msgSend(v23, "setIncludeChildren:", 0);
            objc_msgSend(v23, "frame");
            v37 = v36;
            v39 = v38;
            v41 = v40;
            v43 = v42;
            objc_msgSend(v23, "confidence");
            v45 = v44;
            objc_msgSend(v23, "textLabel");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            -[AXMLElementCoagulation canvasSize](self, "canvasSize");
            v48 = v47;
            v50 = v49;
            objc_msgSend(v23, "childFeatures");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            +[AXMVisionFeature groupedFeatureWithElementRect:uiClass:confidence:label:canvasSize:subElements:](AXMVisionFeature, "groupedFeatureWithElementRect:uiClass:confidence:label:canvasSize:subElements:", 18, v46, v51, v37, v39, v41, v43, v45, v48, v50);
            v52 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v23, "setFeature:", v52);
          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v92, v100, 16);
        }
        while (v20);
      }

      return v8;
    }
    v91 = (double)v12 + 20.0;
    v5 = v89;
  }
  else
  {

    v91 = 20.0;
  }
  if (objc_msgSend(v8, "count"))
  {
    v53 = 0;
    v54 = fmax((double)v7, 0.0);
    v90 = v5 - 2;
    do
    {
      objc_msgSend(v8, "objectAtIndex:", v53, v90);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5 >= 2)
      {
        if (v53)
        {
          if (v5 - 1 == v53)
          {
            objc_msgSend(v8, "objectAtIndex:", v90);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "frame");
            MaxX = CGRectGetMaxX(v109);
            objc_msgSend(v55, "frame");
            v58 = CGRectGetMaxX(v110);
            objc_msgSend(v55, "frame");
            v59 = v58 + CGRectGetMinX(v111) - MaxX;
          }
          else
          {
            objc_msgSend(v8, "objectAtIndex:", v53 - 1);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "objectAtIndex:", v53 + 1);
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "frame");
            MaxX = CGRectGetMaxX(v116);
            objc_msgSend(v55, "frame");
            v63 = CGRectGetMaxX(v117);
            objc_msgSend(v62, "frame");
            v59 = (v63 + CGRectGetMinX(v118)) * 0.5;

          }
        }
        else
        {
          objc_msgSend(v8, "objectAtIndex:", 1);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "frame");
          v60 = CGRectGetMaxX(v112);
          objc_msgSend(v56, "frame");
          v59 = (v60 + CGRectGetMinX(v113)) * 0.5;
          objc_msgSend(v55, "frame");
          MinX = CGRectGetMinX(v114);
          objc_msgSend(v55, "frame");
          MaxX = MinX - (v59 - CGRectGetMaxX(v115));
        }

        v64 = fmax(floor(MaxX), 0.0);
        -[AXMLElementCoagulation canvasSize](self, "canvasSize");
        v66 = fmin(v65, floor(v59));
        -[AXMLElementCoagulation canvasSize](self, "canvasSize");
        objc_msgSend(v55, "setFrame:", v64, v54, v66 - v64, fmin(v67, v91) - v54);
      }
      objc_msgSend(v55, "subfeatures");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXMLElementCoagulation _compareForY:](self, "_compareForY:", v68);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = (void *)objc_msgSend(v69, "mutableCopy");
      objc_msgSend(v55, "setSubfeatures:", v70);

      objc_msgSend(v55, "setIncludeChildren:", 0);
      objc_msgSend(v55, "frame");
      v72 = v71;
      v74 = v73;
      v76 = v75;
      v78 = v77;
      objc_msgSend(v55, "confidence");
      v80 = v79;
      objc_msgSend(v55, "textLabel");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXMLElementCoagulation canvasSize](self, "canvasSize");
      v83 = v82;
      v85 = v84;
      objc_msgSend(v55, "childFeatures");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      +[AXMVisionFeature groupedFeatureWithElementRect:uiClass:confidence:label:canvasSize:subElements:](AXMVisionFeature, "groupedFeatureWithElementRect:uiClass:confidence:label:canvasSize:subElements:", 18, v81, v86, v72, v74, v76, v78, v80, v83, v85);
      v87 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v55, "setFeature:", v87);
      ++v53;
    }
    while (v53 < objc_msgSend(v8, "count"));
  }
  return v8;
}

- (id)_getGroupedTabBarFeatures:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double MinY;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t j;
  void *v29;
  void *v30;
  uint64_t v31;
  AXMLElementCoagulation *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[5];
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    -[AXMLElementCoagulation _compareForX:](self, "_compareForX:", v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (-[AXMLElementCoagulation isiPad](self, "isiPad"))
    {
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v46;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v46 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
            objc_msgSend(v12, "frame");
            v13 = CGRectGetHeight(v53) * 0.5;
            objc_msgSend(v12, "frame");
            v14 = CGRectGetMinX(v54) - v13;
            objc_msgSend(v12, "frame");
            v15 = CGRectGetWidth(v55) + v13 * 2.0;
            objc_msgSend(v12, "frame");
            MinY = CGRectGetMinY(v56);
            objc_msgSend(v12, "frame");
            objc_msgSend(v12, "setFrame:", v14, MinY, v15, CGRectGetHeight(v57));
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
        }
        while (v9);
      }

    }
    -[AXMLElementCoagulation _getHorizontalSegmentationPointDict:](self, "_getHorizontalSegmentationPointDict:", v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __52__AXMLElementCoagulation__getGroupedTabBarFeatures___block_invoke;
    v43[3] = &unk_1E625E460;
    v43[4] = self;
    v5 = v5;
    v44 = v5;
    objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v43);
    if ((unint64_t)objc_msgSend(v5, "count") > 1)
    {
      v34 = v6;
      v33 = self;
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v5 = v5;
      v24 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v49, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v36;
        v27 = 1;
        do
        {
          for (j = 0; j != v25; ++j)
          {
            if (*(_QWORD *)v36 != v26)
              objc_enumerationMutation(v5);
            objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * j), "subfeatures");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "ax_mappedArrayUsingBlock:", &__block_literal_global_149);
            v30 = (void *)objc_claimAutoreleasedReturnValue();

            if ((objc_msgSend(v30, "containsObject:", &unk_1E6288348) & 1) == 0)
              v27 &= objc_msgSend(v30, "containsObject:", &unk_1E6288408);

          }
          v25 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v49, 16);
        }
        while (v25);
      }
      else
      {
        LOBYTE(v27) = 1;
      }

      if ((unint64_t)objc_msgSend(v5, "count") < 6 || (v27 & 1) != 0)
      {
        -[AXMLElementCoagulation _reorderByXCut:](v33, "_reorderByXCut:", v5);
        v31 = objc_claimAutoreleasedReturnValue();

        -[AXMLElementCoagulation _getFeaturesForAXMLTabButtonGroups:](v33, "_getFeaturesForAXMLTabButtonGroups:", v31);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = (id)v31;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v6 = v34;
    }
    else
    {
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v18 = v6;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v39, v50, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v40;
        do
        {
          for (k = 0; k != v20; ++k)
          {
            if (*(_QWORD *)v40 != v21)
              objc_enumerationMutation(v18);
            objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * k), "setTopLevel:", 1);
          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v39, v50, 16);
        }
        while (v20);
      }

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v6 = v4;
    v23 = v6;
  }

  return v23;
}

void __52__AXMLElementCoagulation__getGroupedTabBarFeatures___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  AXMLTabButtonGroup *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = objc_alloc_init(AXMLTabButtonGroup);
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(a1 + 32), "_mergeFeatureIntoGroup:feature:", v5, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++), (_QWORD)v11);
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
  }

}

id __52__AXMLElementCoagulation__getGroupedTabBarFeatures___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "feature");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithInteger:", objc_msgSend(v3, "uiClass"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_compareForY:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __39__AXMLElementCoagulation__compareForY___block_invoke;
  v4[3] = &unk_1E625E4A8;
  v4[4] = self;
  objc_msgSend(a3, "sortedArrayUsingComparator:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __39__AXMLElementCoagulation__compareForY___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
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

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "frame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(v5, "frame");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  return objc_msgSend(v4, "_compareY:frame2:", v7, v9, v11, v13, v15, v17, v19, v21);
}

- (id)_compareForX:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __39__AXMLElementCoagulation__compareForX___block_invoke;
  v4[3] = &unk_1E625E4A8;
  v4[4] = self;
  objc_msgSend(a3, "sortedArrayUsingComparator:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __39__AXMLElementCoagulation__compareForX___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
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

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "frame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(v5, "frame");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  return objc_msgSend(v4, "_compareX:frame2:", v7, v9, v11, v13, v15, v17, v19, v21);
}

- (id)_compareArea:(id)a3
{
  return (id)objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_152);
}

uint64_t __39__AXMLElementCoagulation__compareArea___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  v4 = a3;
  v5 = a2;
  objc_msgSend(v5, "frame");
  v7 = v6;
  objc_msgSend(v5, "frame");
  v9 = v8;

  v10 = v7 * v9;
  objc_msgSend(v4, "frame");
  v12 = v11;
  objc_msgSend(v4, "frame");
  v14 = v13;

  if (v10 >= v12 * v14)
    return 1;
  else
    return -1;
}

- (id)_sortFeaturesReadingOrder:(id)a3
{
  return (id)objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_153);
}

uint64_t __52__AXMLElementCoagulation__sortFeaturesReadingOrder___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
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
  _BOOL4 v16;
  uint64_t v17;

  v4 = a3;
  v5 = a2;
  objc_msgSend(v5, "frame");
  v7 = v6;
  objc_msgSend(v4, "frame");
  v9 = vabdd_f64(v7, v8);
  objc_msgSend(v5, "frame");
  v11 = v10;
  v13 = v12;

  objc_msgSend(v4, "frame");
  v16 = v13 < v15;
  if (v9 < 20.0)
    v16 = v11 < v14;
  if (v16)
    v17 = -1;
  else
    v17 = 1;

  return v17;
}

- (id)_getCandidateTabBarFeatures:(id)a3 screenSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  double v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  double v17;
  double v18;
  double v19;
  id v20;
  double MinY;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  uint64_t v30;
  double v31;
  double v32;
  double v33;
  double v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  unint64_t v40;
  uint64_t k;
  void *v42;
  id v43;
  id v44;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;

  height = a4.height;
  width = a4.width;
  v62 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", &unk_1E6288348, &unk_1E6288408, &unk_1E6288300, &unk_1E6288318, 0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    if (-[AXMLElementCoagulation isiPad](self, "isiPad"))
      v9 = 0.9;
    else
      v9 = 0.85;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v7 = v7;
    v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
    if (v10)
    {
      v11 = v10;
      v12 = 0;
      v13 = height * v9;
      v14 = *(_QWORD *)v56;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v56 != v14)
            objc_enumerationMutation(v7);
          v16 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
          if (objc_msgSend(v16, "uiClass") == 10)
          {
            objc_msgSend(v16, "frame");
            if (CGRectGetMinY(v63) >= v13)
            {
              if (!v12 || (objc_msgSend(v12, "confidence"), v18 = v17, objc_msgSend(v16, "confidence"), v18 < v19))
              {
                v20 = v16;

                v12 = v20;
              }
            }
          }
        }
        v11 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
      }
      while (v11);

      if (v12)
      {
        objc_msgSend(v12, "frame");
        MinY = CGRectGetMinY(v64);
        objc_msgSend(v7, "sortedArrayUsingComparator:", &__block_literal_global_154);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        v53 = 0u;
        v54 = 0u;
        v51 = 0u;
        v52 = 0u;
        v7 = v22;
        v23 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
        if (v23)
        {
          v24 = v23;
          v25 = height - MinY;
          v26 = *(_QWORD *)v52;
          do
          {
            for (j = 0; j != v24; ++j)
            {
              if (*(_QWORD *)v52 != v26)
                objc_enumerationMutation(v7);
              v28 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * j);
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v28, "uiClass"));
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = objc_msgSend(v46, "indexOfObject:", v29);

              if (v30 != 0x7FFFFFFFFFFFFFFFLL)
              {
                objc_msgSend(v28, "frame");
                if (CGRectGetMinY(v65) >= v13)
                {
                  objc_msgSend(v28, "frame");
                  if (AXMIsContainedBy(0.0, MinY, width, v25, v31, v32, v33, v34, 0.5))
                    objc_msgSend(v8, "addObject:", v28);
                }
              }
            }
            v24 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
          }
          while (v24);
        }

        v49 = 0u;
        v50 = 0u;
        v47 = 0u;
        v48 = 0u;
        v35 = v8;
        v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
        if (v36)
        {
          v37 = v36;
          v38 = *(_QWORD *)v48;
          v39 = 1;
          v40 = 0x1E0C99000;
          do
          {
            for (k = 0; k != v37; ++k)
            {
              if (*(_QWORD *)v48 != v38)
                objc_enumerationMutation(v35);
              v42 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * k);
              if (objc_msgSend(v42, "uiClass") != 11)
                v39 &= objc_msgSend(v42, "uiClass") == 17;
            }
            v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
          }
          while (v37);

          if ((v39 & 1) == 0)
          {
            v43 = v35;
LABEL_44:
            v44 = v43;

            goto LABEL_45;
          }
        }
        else
        {

          v40 = 0x1E0C99000uLL;
        }
        objc_msgSend(*(id *)(v40 + 3560), "array");
        v43 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_44;
      }
    }
    else
    {

    }
  }
  v44 = v8;
LABEL_45:

  return v44;
}

uint64_t __65__AXMLElementCoagulation__getCandidateTabBarFeatures_screenSize___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "confidence");
  if (v6 >= 1.0)
  {
    v12 = -1;
  }
  else
  {
    objc_msgSend(v5, "confidence");
    if (v7 >= 1.0)
    {
      v12 = 1;
    }
    else
    {
      v8 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v4, "confidence");
      objc_msgSend(v8, "numberWithDouble:");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v5, "confidence");
      objc_msgSend(v10, "numberWithDouble:");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v9, "compare:", v11) == 0;

    }
  }

  return v12;
}

- (id)_repairTextInTabItems:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
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
  double v35;
  double v36;
  double v37;
  double MaxX;
  double v39;
  double MinY;
  double v41;
  double v42;
  double Height;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  double v47;
  uint64_t v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  id obj;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;

  v74 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v3, "ax_filteredArrayUsingBlock:", &__block_literal_global_155);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ax_filteredArrayUsingBlock:", &__block_literal_global_156);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  obj = v4;
  v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v73, 16);
  if (v61)
  {
    v59 = *(_QWORD *)v69;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v69 != v59)
          objc_enumerationMutation(obj);
        v62 = v5;
        v6 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * v5);
        v64 = 0u;
        v65 = 0u;
        v66 = 0u;
        v67 = 0u;
        v7 = v60;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v64, v72, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v65;
          while (2)
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v65 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
              objc_msgSend(v6, "frame");
              v14 = v13;
              v16 = v15;
              v18 = v17;
              v20 = v19;
              objc_msgSend(v12, "frame");
              AXMIntersectionOverUnion(v14, v16, v18, v20, v21, v22, v23, v24);
              if (v25 != 0.0)
              {
                objc_msgSend(v12, "frame");
                v27 = v26;
                v29 = v28;
                v31 = v30;
                v33 = v32;
                objc_msgSend(v6, "frame");
                if (AXMIsContainedBy(v27, v29, v31, v33, v34, v35, v36, v37, 0.8))
                {
                  objc_msgSend(v3, "removeObject:", v6);
                  goto LABEL_22;
                }
                objc_msgSend(v6, "frame");
                MaxX = CGRectGetMaxX(v75);
                objc_msgSend(v12, "frame");
                if (MaxX > CGRectGetMaxX(v76))
                {
                  objc_msgSend(v12, "frame");
                  v39 = CGRectGetMaxX(v77);
                  objc_msgSend(v6, "frame");
                  MinY = CGRectGetMinY(v78);
                  objc_msgSend(v6, "frame");
                  v41 = CGRectGetMaxX(v79);
                  objc_msgSend(v12, "frame");
                  v42 = CGRectGetMaxX(v80);
                  objc_msgSend(v6, "frame");
                  Height = CGRectGetHeight(v81);
                  objc_msgSend(v6, "value");
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  v45 = objc_msgSend(v44, "rangeOfString:", CFSTR(" "));
                  if (v45 != 0x7FFFFFFFFFFFFFFFLL && objc_msgSend(v44, "length") > (unint64_t)(v45 + 1))
                  {
                    objc_msgSend(v44, "substringFromIndex:");
                    v46 = objc_claimAutoreleasedReturnValue();

                    v44 = (void *)v46;
                  }
                  v47 = v41 - v42;
                  v48 = objc_msgSend(v6, "uiClass");
                  objc_msgSend(v6, "confidence");
                  v50 = v49;
                  -[AXMLElementCoagulation canvasSize](self, "canvasSize");
                  v52 = v51;
                  v54 = v53;
                  objc_msgSend(v6, "subfeatures");
                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                  +[AXMVisionFeature groupedFeatureWithElementRect:uiClass:confidence:label:canvasSize:subElements:](AXMVisionFeature, "groupedFeatureWithElementRect:uiClass:confidence:label:canvasSize:subElements:", v48, v44, v55, v39, MinY, v47, Height, v50, v52, v54);
                  v56 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v3, "removeObject:", v6);
                  objc_msgSend(v3, "addObject:", v56);

                }
              }
            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v64, v72, 16);
            if (v9)
              continue;
            break;
          }
        }
LABEL_22:

        v5 = v62 + 1;
      }
      while (v62 + 1 != v61);
      v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v73, 16);
    }
    while (v61);
  }

  return v3;
}

BOOL __48__AXMLElementCoagulation__repairTextInTabItems___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = objc_msgSend(v2, "uiClass") == 11 || objc_msgSend(v2, "uiClass") == 17;

  return v3;
}

BOOL __48__AXMLElementCoagulation__repairTextInTabItems___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = objc_msgSend(v2, "uiClass") == 5 || objc_msgSend(v2, "uiClass") == 16;

  return v3;
}

- (id)_reorderedTabsForSortedFeatures:(id)a3 screenSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  uint64_t i;
  void *v15;
  double v16;
  double v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;
  CGRect v26;
  CGRect v27;

  height = a4.height;
  width = a4.width;
  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  -[AXMLElementCoagulation _getCandidateTabBarFeatures:screenSize:](self, "_getCandidateTabBarFeatures:screenSize:", v7, width, height);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    v12 = 0.0;
    v13 = 1.79769313e308;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v15, "frame");
        v13 = fmin(v13, CGRectGetMinY(v26));
        objc_msgSend(v15, "frame");
        v12 = fmax(v12, CGRectGetMaxY(v27));
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
    v16 = v13 + -1.0;
    v17 = v12 + 1.0;
  }
  else
  {
    v17 = 1.0;
    v16 = 1.79769313e308;
  }
  -[AXMLElementCoagulation _featuresByReorderingTwoRows:minY:maxY:](self, "_featuresByReorderingTwoRows:minY:maxY:", v7, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)_featuresByReorderingTwoRows:(id)a3 minY:(double)a4 maxY:(double)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  double MinY;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;
  CGRect v28;
  CGRect v29;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v12 = v8;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v23 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v17, "frame", (_QWORD)v22);
        MinY = CGRectGetMinY(v28);
        v19 = v9;
        if (MinY >= a4)
        {
          objc_msgSend(v17, "frame");
          if (CGRectGetMaxY(v29) <= a5)
            v19 = v10;
          else
            v19 = v11;
        }
        objc_msgSend(v19, "addObject:", v17);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v14);
  }

  -[AXMLElementCoagulation _reorderByXCut:](self, "_reorderByXCut:", v10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObjectsFromArray:", v20);

  objc_msgSend(v9, "addObjectsFromArray:", v11);
  return v9;
}

- (id)_reorderSimilarTopNeighbors:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v8;
  void *v9;
  void *v10;
  double MinY;
  double MaxY;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double MinX;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "mutableCopy");
  if (objc_msgSend(v5, "count") != 1)
  {
    v8 = 0;
    do
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectAtIndexedSubscript:", ++v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "frame");
      MinY = CGRectGetMinY(v20);
      objc_msgSend(v10, "frame");
      if (MinY > CGRectGetMinY(v21))
        goto LABEL_7;
      objc_msgSend(v9, "frame");
      MaxY = CGRectGetMaxY(v22);
      objc_msgSend(v9, "frame");
      v13 = fmin(MaxY, CGRectGetMaxY(v23));
      objc_msgSend(v9, "frame");
      v14 = CGRectGetMinY(v24);
      objc_msgSend(v10, "frame");
      v15 = v13 - fmax(v14, CGRectGetMinY(v25));
      objc_msgSend(v9, "frame");
      v17 = v16;
      objc_msgSend(v10, "frame");
      if (v15 < fmin(v17, v18) * 0.9)
        goto LABEL_7;
      objc_msgSend(v9, "frame");
      MinX = CGRectGetMinX(v26);
      objc_msgSend(v10, "frame");
      if (MinX >= CGRectGetMaxX(v27))
      {
        objc_msgSend(v4, "addObject:", v10);
        objc_msgSend(v5, "setObject:atIndexedSubscript:", v9, v8);
      }
      else
      {
LABEL_7:
        objc_msgSend(v4, "addObject:", v9);
      }

    }
    while (v8 < objc_msgSend(v5, "count") - 1);
  }
  objc_msgSend(v5, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v6);

  return v4;
}

- (id)_reorderByYCut:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double MaxY;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  double v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  void *v31;
  float v32;
  CGFloat v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  AXMLElementCoagulation *v47;
  id obj;
  void *v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;

  v71 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  objc_msgSend(v4, "array");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = self;
  -[AXMLElementCoagulation _compareForY:](self, "_compareForY:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v63, v70, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v64;
    MaxY = 0.0;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v64 != v11)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
        objc_msgSend(v14, "frame");
        if (CGRectGetMinY(v72) <= MaxY)
        {
          objc_msgSend(v14, "frame");
          if (CGRectGetMaxY(v74) <= MaxY)
            continue;
        }
        else
        {
          v15 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v14, "frame");
          objc_msgSend(v15, "numberWithDouble:", (MaxY + CGRectGetMinY(v73)) * 0.5);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "addObject:", v16);

        }
        objc_msgSend(v14, "frame");
        MaxY = CGRectGetMaxY(v75);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v63, v70, 16);
    }
    while (v10);
  }

  v17 = (id)objc_msgSend(v50, "sortedArrayUsingComparator:", &__block_literal_global_160);
  v18 = (void *)MEMORY[0x1E0CB37E8];
  -[AXMLElementCoagulation canvasSize](v47, "canvasSize");
  objc_msgSend(v18, "numberWithDouble:", v19 + 1.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "addObject:", v20);

  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  obj = v8;
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v60;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v60 != v23)
          objc_enumerationMutation(obj);
        v25 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * j);
        v55 = 0u;
        v56 = 0u;
        v57 = 0u;
        v58 = 0u;
        v26 = v50;
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v55, v68, 16);
        if (v27)
        {
          v28 = v27;
          v29 = *(_QWORD *)v56;
          while (2)
          {
            for (k = 0; k != v28; ++k)
            {
              if (*(_QWORD *)v56 != v29)
                objc_enumerationMutation(v26);
              v31 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * k);
              objc_msgSend(v31, "floatValue");
              v33 = v32;
              objc_msgSend(v25, "frame");
              if (CGRectGetMinY(v76) < v33)
              {
                objc_msgSend(v49, "objectForKey:", v31);
                v34 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v34)
                {
                  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v49, "setObject:forKeyedSubscript:", v35, v31);

                }
                objc_msgSend(v49, "objectForKey:", v31);
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v36, "addObject:", v25);

                goto LABEL_29;
              }
            }
            v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v55, v68, 16);
            if (v28)
              continue;
            break;
          }
        }
LABEL_29:

      }
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
    }
    while (v22);
  }

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v37 = v50;
  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v51, v67, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v52;
    v41 = v49;
    do
    {
      v42 = 0;
      v43 = v6;
      do
      {
        if (*(_QWORD *)v52 != v40)
          objc_enumerationMutation(v37);
        objc_msgSend(v49, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * v42));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXMLElementCoagulation _reorderByXCut:](v47, "_reorderByXCut:", v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "arrayByAddingObjectsFromArray:", v45);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        ++v42;
        v43 = v6;
      }
      while (v39 != v42);
      v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v51, v67, 16);
    }
    while (v39);
  }
  else
  {
    v41 = v49;
  }

  return v6;
}

uint64_t __41__AXMLElementCoagulation__reorderByYCut___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (int64_t)_compareY:(CGRect)a3 frame2:(CGRect)a4
{
  if (a3.origin.y < a4.origin.y)
    return -1;
  else
    return a3.origin.y > a4.origin.y;
}

- (int64_t)_compareX:(CGRect)a3 frame2:(CGRect)a4
{
  if (a3.origin.x < a4.origin.x)
    return -1;
  else
    return a3.origin.x > a4.origin.x;
}

- (id)_getHorizontalSegmentationPointDict:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double MaxX;
  uint64_t i;
  void *v14;
  double MinX;
  uint64_t v16;
  double v20;
  void *v21;
  id v22;
  void *v23;
  double v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  void *v36;
  float v37;
  float v38;
  void *v39;
  void *v40;
  void *v41;
  void *v43;
  id obj;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;

  v61 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  objc_msgSend(v4, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v45 = (id)objc_claimAutoreleasedReturnValue();
  -[AXMLElementCoagulation _compareForX:](self, "_compareForX:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v55;
    MaxX = 0.0;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v55 != v11)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
        objc_msgSend(v14, "frame");
        MinX = CGRectGetMinX(v62);
        objc_msgSend(v14, "frame");
        if (MinX <= MaxX)
        {
          if (CGRectGetMaxX(*(CGRect *)&v16) > MaxX)
          {
            objc_msgSend(v14, "frame");
            MaxX = CGRectGetMaxX(v64);
          }
        }
        else
        {
          v20 = (MaxX + CGRectGetMinX(*(CGRect *)&v16)) * 0.5;
          *(float *)&v20 = v20;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v21);
          objc_msgSend(v14, "frame");
          MaxX = CGRectGetMaxX(v63);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
    }
    while (v10);
  }

  v22 = (id)objc_msgSend(v6, "sortedArrayUsingComparator:", &__block_literal_global_161);
  v23 = (void *)MEMORY[0x1E0CB37E8];
  -[AXMLElementCoagulation canvasSize](self, "canvasSize");
  v25 = v24 + 1.0;
  *(float *)&v25 = v25;
  objc_msgSend(v23, "numberWithFloat:", v25);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:");
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  obj = v8;
  v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v51;
    do
    {
      for (j = 0; j != v27; ++j)
      {
        if (*(_QWORD *)v51 != v28)
          objc_enumerationMutation(obj);
        v30 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * j);
        v46 = 0u;
        v47 = 0u;
        v48 = 0u;
        v49 = 0u;
        v31 = v6;
        v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
        if (v32)
        {
          v33 = v32;
          v34 = *(_QWORD *)v47;
          while (2)
          {
            for (k = 0; k != v33; ++k)
            {
              if (*(_QWORD *)v47 != v34)
                objc_enumerationMutation(v31);
              v36 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * k);
              objc_msgSend(v36, "floatValue");
              v38 = v37;
              objc_msgSend(v30, "frame");
              if (CGRectGetMinX(v65) < v38)
              {
                objc_msgSend(v45, "objectForKey:", v36);
                v39 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v39)
                {
                  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v45, "setObject:forKeyedSubscript:", v40, v36);

                }
                objc_msgSend(v45, "objectForKey:", v36);
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v41, "addObject:", v30);

                goto LABEL_29;
              }
            }
            v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
            if (v33)
              continue;
            break;
          }
        }
LABEL_29:

      }
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
    }
    while (v27);
  }

  return v45;
}

uint64_t __62__AXMLElementCoagulation__getHorizontalSegmentationPointDict___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (id)_reorderByXCut:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[AXMLElementCoagulation _getHorizontalSegmentationPointDict:](self, "_getHorizontalSegmentationPointDict:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingComparator:", &__block_literal_global_163);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      v13 = v7;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(v4, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v12), (_QWORD)v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXMLElementCoagulation _sortFeaturesReadingOrder:](self, "_sortFeaturesReadingOrder:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "arrayByAddingObjectsFromArray:", v15);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        ++v12;
        v13 = v7;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  return v7;
}

uint64_t __41__AXMLElementCoagulation__reorderByXCut___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  float v5;
  float v6;
  float v7;
  float v8;

  v4 = a3;
  objc_msgSend(a2, "floatValue");
  v6 = v5;
  objc_msgSend(v4, "floatValue");
  v8 = v7;

  if (v6 > v8)
    return 1;
  else
    return -1;
}

- (BOOL)isRTL
{
  return self->_isRTL;
}

- (void)setIsRTL:(BOOL)a3
{
  self->_isRTL = a3;
}

- (CGRect)appFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_appFrame.origin.x;
  y = self->_appFrame.origin.y;
  width = self->_appFrame.size.width;
  height = self->_appFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setAppFrame:(CGRect)a3
{
  self->_appFrame = a3;
}

- (double)screenScale
{
  return self->_screenScale;
}

- (void)setScreenScale:(double)a3
{
  self->_screenScale = a3;
}

- (CGSize)canvasSize
{
  double width;
  double height;
  CGSize result;

  width = self->_canvasSize.width;
  height = self->_canvasSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setCanvasSize:(CGSize)a3
{
  self->_canvasSize = a3;
}

- (int64_t)appOrientation
{
  return self->_appOrientation;
}

- (void)setAppOrientation:(int64_t)a3
{
  self->_appOrientation = a3;
}

- (NSArray)clickableTextKeywords
{
  return self->_clickableTextKeywords;
}

- (void)setClickableTextKeywords:(id)a3
{
  objc_storeStrong((id *)&self->_clickableTextKeywords, a3);
}

- (NSRegularExpression)nonAlphaCharactersRegex
{
  return self->_nonAlphaCharactersRegex;
}

- (void)setNonAlphaCharactersRegex:(id)a3
{
  objc_storeStrong((id *)&self->_nonAlphaCharactersRegex, a3);
}

- (BOOL)isiPad
{
  return self->_isiPad;
}

- (void)setIsiPad:(BOOL)a3
{
  self->_isiPad = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonAlphaCharactersRegex, 0);
  objc_storeStrong((id *)&self->_clickableTextKeywords, 0);
}

@end
