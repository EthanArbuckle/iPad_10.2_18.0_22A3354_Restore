@implementation AVTAvatarAttributeEditorSectionController

+ (BOOL)supportsSelection
{
  return 1;
}

+ (double)edgeLengthFittingWidth:(double)a3 environment:(id)a4
{
  id v5;
  char v6;
  double v7;
  unsigned __int8 v8;
  double v9;

  v5 = a4;
  v6 = objc_msgSend(v5, "deviceIsPad");
  v7 = 400.0;
  if (a3 <= 400.0 || (v7 = 6.0, (v6 & 1) == 0))
  {
    v8 = objc_msgSend(v5, "deviceIsMac", v7);
    v7 = 3.0;
    if (((a3 > 300.0) & v8) != 0)
      v7 = 6.0;
  }
  v9 = floor((a3 + -24.0 + (v7 + -1.0) * -0.0) / v7);

  return v9;
}

+ (CGSize)cellSizeForSectionItem:(id)a3 inSection:(id)a4 fittingWidth:(double)a5 environment:(id)a6
{
  id v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  int v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGSize result;

  v10 = a3;
  v11 = a4;
  objc_msgSend(a1, "edgeLengthFittingWidth:environment:", a6, a5);
  v13 = v12;
  objc_msgSend(v10, "heightRatio");
  v15 = v13 * v14;
  objc_msgSend(v11, "options");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "showsLabel");

  if (v17)
  {
    objc_msgSend(a1, "maxLabelHeightInSection:fittingWidth:", v11, v13);
    v19 = v18;
    objc_msgSend(v10, "heightRatio");
    objc_msgSend(a1, "requiredLabelSpaceForMaxLabelHeight:cellEdgeLength:sectionItemHeightRatio:", v19, v13, v20);
    v15 = v15 + v21;
  }

  v22 = v13;
  v23 = v15;
  result.height = v23;
  result.width = v22;
  return result;
}

+ (double)maxLabelHeightInSection:(id)a3 fittingWidth:(double)a4
{
  id v5;
  void *v6;
  int v7;
  double v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t i;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "options");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "showsLabel");

  v8 = 0.0;
  if (v7)
  {
    +[AVTUIFontRepository attributeViewLabelFont](AVTUIFontRepository, "attributeViewLabelFont");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    objc_msgSend(v5, "sectionItems", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v26;
      v14 = *MEMORY[0x1E0CEA098];
      v15 = 0.0;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v26 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "localizedName");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = v14;
          v30 = v9;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "boundingRectWithSize:options:attributes:context:", 1, v18, 0, a4, 1.79769313e308);
          v20 = v19;

          v21 = ceil(v20);
          if (v15 < v21)
            v15 = v21;

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
      }
      while (v12);
    }
    else
    {
      v15 = 0.0;
    }

    objc_msgSend(v9, "lineHeight");
    v23 = ceil(v22 + v22) + 3.0;
    if (v15 >= v23)
      v8 = v23;
    else
      v8 = v15;

  }
  return v8;
}

+ (BOOL)shouldHideLabelBackgroundInSection:(id)a3 fittingWidth:(double)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "options");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "showsLabel");

  if (v7)
  {
    +[AVTUIFontRepository attributeViewLabelFont](AVTUIFontRepository, "attributeViewLabelFont");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lineHeight");
    v10 = v9;
    objc_msgSend(v8, "lineHeight");
    v12 = v11;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    objc_msgSend(v5, "sectionItems", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    if (v14)
    {
      v15 = ceil(v10) + 3.0;
      v16 = ceil(v12 + v12) + 3.0;
      v17 = *(_QWORD *)v31;
      v18 = *MEMORY[0x1E0CEA098];
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v31 != v17)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "localizedName");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = v18;
          v37 = v8;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "boundingRectWithSize:options:attributes:context:", 1, v21, 0, a4, 1.79769313e308);
          v23 = v22;
          v25 = v24;

          if (ceil(v25) >= v15)
          {
            v34 = v18;
            v35 = v8;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "boundingRectWithSize:options:attributes:context:", 1, v26, 0, a4 + -4.0 + -1.0, 1.79769313e308);
            v28 = v27;

            if (ceil(v28) > v16)
            {
LABEL_15:

              LOBYTE(v14) = 1;
              goto LABEL_16;
            }
          }
          else if (ceil(v23) >= a4 + -4.0)
          {
            goto LABEL_15;
          }

        }
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
        if (v14)
          continue;
        break;
      }
    }
LABEL_16:

  }
  else
  {
    LOBYTE(v14) = 0;
  }

  return v14;
}

+ (double)requiredLabelSpaceForMaxLabelHeight:(double)a3 cellEdgeLength:(double)a4 sectionItemHeightRatio:(double)a5
{
  return a3 + 4.0 + 7.0 + (a4 * a5 - a4) * -0.5;
}

+ (UIEdgeInsets)edgeInsetsForSection:(id)a3 fittingWidth:(double)a4 environment:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  char isKindOfClass;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  int v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  UIEdgeInsets result;

  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "localizedName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v8, "localizedName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "length"))
      v12 = 0.0;
    else
      v12 = 12.0;

  }
  else
  {
    v12 = 12.0;
  }

  objc_msgSend(v8, "sectionItems");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v16 = (void *)MEMORY[0x1E0C99DA0];
    objc_msgSend(v8, "sectionItems");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "raise:format:", CFSTR("AVTTypeMismatchException"), CFSTR("Unexpected object class for %@"), v18);

  }
  objc_msgSend(v8, "sectionItems");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "firstObject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(a1, "edgeLengthFittingWidth:environment:", v9, a4);
    v22 = v21;
    objc_msgSend(v20, "heightRatio");
    v24 = v23;
    objc_msgSend(v8, "options");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "showsLabel");

    if (v26)
    {
      objc_msgSend(v20, "heightRatio");
      v28 = (v22 * v27 - v22) * 0.5 + 12.0;
      v29 = 17.0;
      v12 = 17.0 - v28;
    }
    else
    {
      v30 = v22 * (v24 + -1.0) * 0.5;
      v12 = fmax(v12 - v30, 0.0);
      v29 = fmax(12.0 - v30, 0.0);
    }
  }
  else
  {
    v29 = 12.0;
  }

  v31 = 12.0;
  v32 = 12.0;
  v33 = v12;
  v34 = v29;
  result.right = v32;
  result.bottom = v34;
  result.left = v31;
  result.top = v33;
  return result;
}

- (AVTAvatarAttributeEditorSectionController)initWithThumbnailScheduler:(id)a3 renderingScheduler:(id)a4 environment:(id)a5
{
  id v9;
  id v10;
  id v11;
  AVTAvatarAttributeEditorSectionController *v12;
  AVTAvatarAttributeEditorSectionController *v13;
  uint64_t v14;
  AVTTransitionCoordinator *transitionCoordinator;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)AVTAvatarAttributeEditorSectionController;
  v12 = -[AVTAvatarAttributeEditorSectionController init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_environment, a5);
    v13->_selectedIndex = 0x7FFFFFFFFFFFFFFFLL;
    +[AVTTransitionCoordinator concurrentTransitionCoordinatorWithDelay:](AVTTransitionCoordinator, "concurrentTransitionCoordinatorWithDelay:", 0.015);
    v14 = objc_claimAutoreleasedReturnValue();
    transitionCoordinator = v13->_transitionCoordinator;
    v13->_transitionCoordinator = (AVTTransitionCoordinator *)v14;

    objc_storeStrong((id *)&v13->_thumbnailScheduler, a3);
    objc_storeStrong((id *)&v13->_renderingScheduler, a4);
  }

  return v13;
}

- (void)updateWithSection:(id)a3
{
  AVTAvatarAttributeEditorSection *v5;
  void *v6;
  void *v7;
  AVTAvatarAttributeEditorSection *v8;

  v5 = (AVTAvatarAttributeEditorSection *)a3;
  if (self->_section != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_section, a3);
    -[AVTAvatarAttributeEditorSection sectionItems](self->_section, "sectionItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    self->_selectedIndex = objc_msgSend(v6, "indexOfObjectPassingTest:", &__block_literal_global_10);

    -[AVTAvatarAttributeEditorSectionController transitionCoordinator](self, "transitionCoordinator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cancelAllTransitions");

    v5 = v8;
  }

}

uint64_t __63__AVTAvatarAttributeEditorSectionController_updateWithSection___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isSelected");
}

- (void)updateCell:(id)a3 forItemAtIndex:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char isKindOfClass;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  double v33;
  void *v34;
  id v35;

  v35 = a3;
  objc_msgSend(v35, "valueView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "superview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[AVTAvatarAttributeEditorSectionController transitionCoordinator](self, "transitionCoordinator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "valueView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cancelTransitionsMatchingModel:", v9);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[AVTAvatarAttributeEditorSectionController section](self, "section");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sectionItems");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      v14 = (void *)MEMORY[0x1E0C99DA0];
      -[AVTAvatarAttributeEditorSectionController section](self, "section");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "sectionItems");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectAtIndexedSubscript:", a4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "raise:format:", CFSTR("AVTTypeMismatchException"), CFSTR("Unexpected object class for %@"), v17);

    }
    -[AVTAvatarAttributeEditorSectionController section](self, "section");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "sectionItems");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectAtIndexedSubscript:", a4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "localizedName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setLabelString:", v21);

    v22 = (void *)objc_opt_class();
    -[AVTAvatarAttributeEditorSectionController section](self, "section");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "bounds");
    objc_msgSend(v22, "maxLabelHeightInSection:fittingWidth:", v23, v24);
    v26 = v25;

    v27 = (void *)objc_opt_class();
    objc_msgSend(v35, "bounds");
    v29 = v28;
    objc_msgSend(v20, "heightRatio");
    objc_msgSend(v27, "requiredLabelSpaceForMaxLabelHeight:cellEdgeLength:sectionItemHeightRatio:", v26, v29, v30);
    objc_msgSend(v35, "setLabelVerticalSpace:");
    v31 = (void *)objc_opt_class();
    -[AVTAvatarAttributeEditorSectionController section](self, "section");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "bounds");
    objc_msgSend(v35, "setShouldHideLabelBackground:", objc_msgSend(v31, "shouldHideLabelBackgroundInSection:fittingWidth:", v32, v33));

  }
  -[AVTAvatarAttributeEditorSectionController viewForIndex:](self, "viewForIndex:", a4);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setAttributeView:", v34);

}

- (id)viewForIndex:(int64_t)a3
{
  AVTAttributeValueView *v5;
  AVTAttributeValueView *v6;
  void *v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;

  v5 = [AVTAttributeValueView alloc];
  v6 = -[AVTAttributeValueView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[AVTAttributeValueView setSelectionStyle:](v6, "setSelectionStyle:", 0);
  -[AVTAvatarAttributeEditorSectionController section](self, "section");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sectionItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v11 = (void *)MEMORY[0x1E0C99DA0];
    -[AVTAvatarAttributeEditorSectionController section](self, "section");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sectionItems");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "raise:format:", CFSTR("AVTTypeMismatchException"), CFSTR("Unexpected object class for %@"), v14);

  }
  -[AVTAvatarAttributeEditorSectionController section](self, "section");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sectionItems");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectAtIndexedSubscript:", a3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "heightRatio");
  -[AVTAttributeValueView setImageSizeRatio:](v6, "setImageSizeRatio:", 1.0, v18);
  -[AVTAttributeValueView updateSelectedState:animated:](v6, "updateSelectedState:animated:", -[AVTAvatarAttributeEditorSectionController selectedIndex](self, "selectedIndex") == a3, 0);

  return v6;
}

- (id)prefetchingSectionItemForIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  -[AVTAvatarAttributeEditorSectionController section](self, "section");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sectionItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v9 = (void *)MEMORY[0x1E0C99DA0];
    -[AVTAvatarAttributeEditorSectionController section](self, "section");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sectionItems");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise:format:", CFSTR("AVTTypeMismatchException"), CFSTR("Unexpected object class for %@"), v12);

  }
  -[AVTAvatarAttributeEditorSectionController section](self, "section");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sectionItems");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndexedSubscript:", a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (int64_t)numberOfItems
{
  void *v2;
  void *v3;
  int64_t v4;

  -[AVTAvatarAttributeEditorSectionController section](self, "section");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (CGSize)sizeForItemAtIndex:(int64_t)a3 fittingSize:(CGSize)a4
{
  double width;
  void *v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGSize result;

  width = a4.width;
  -[AVTAvatarAttributeEditorSectionController section](self, "section", a4.width, a4.height);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sectionItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v11 = (void *)MEMORY[0x1E0C99DA0];
    -[AVTAvatarAttributeEditorSectionController section](self, "section");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sectionItems");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "raise:format:", CFSTR("AVTTypeMismatchException"), CFSTR("Unexpected object class for %@"), v14);

  }
  -[AVTAvatarAttributeEditorSectionController section](self, "section");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sectionItems");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectAtIndexedSubscript:", a3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)objc_opt_class();
  -[AVTAvatarAttributeEditorSectionController section](self, "section");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarAttributeEditorSectionController environment](self, "environment");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "cellSizeForSectionItem:inSection:fittingWidth:environment:", v17, v19, v20, width);
  v22 = v21;
  v24 = v23;

  v25 = v22;
  v26 = v24;
  result.height = v26;
  result.width = v25;
  return result;
}

- (unint64_t)indexForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v4 = a3;
  -[AVTAvatarAttributeEditorSectionController section](self, "section");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sectionItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "indexOfObject:", v4);

  return v7;
}

- (UIEdgeInsets)edgeInsetsFittingSize:(CGSize)a3
{
  double width;
  void *v5;
  void *v6;
  void *v7;
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
  UIEdgeInsets result;

  width = a3.width;
  v5 = (void *)objc_opt_class();
  -[AVTAvatarAttributeEditorSectionController section](self, "section");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarAttributeEditorSectionController environment](self, "environment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "edgeInsetsForSection:fittingWidth:environment:", v6, v7, width);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.right = v19;
  result.bottom = v18;
  result.left = v17;
  result.top = v16;
  return result;
}

- (void)cell:(id)a3 willDisplayAtIndex:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void (**v28)(_QWORD, _QWORD, _QWORD);
  id *v29;
  id *v30;
  id *v31;
  uint64_t v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  id val;
  _QWORD v47[4];
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  _QWORD v56[8];
  id v57;
  id v58[2];
  _QWORD v59[8];
  id v60;
  id v61[2];
  _QWORD v62[4];
  id v63;
  _QWORD *v64;
  id v65;
  id v66;
  id from;
  id v68;
  id v69;
  id location;
  _QWORD v71[5];
  id v72;

  v6 = a3;
  objc_msgSend(v6, "valueView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  val = v7;
  objc_msgSend(v7, "setDisplaySessionUUID:");
  -[AVTAvatarAttributeEditorSectionController section](self, "section");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sectionItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v12 = (void *)MEMORY[0x1E0C99DA0];
    -[AVTAvatarAttributeEditorSectionController section](self, "section");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sectionItems");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndexedSubscript:", a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "raise:format:", CFSTR("AVTTypeMismatchException"), CFSTR("Unexpected object class for %@"), v15);

  }
  -[AVTAvatarAttributeEditorSectionController section](self, "section");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sectionItems");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectAtIndexedSubscript:", a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVTAvatarAttributeEditorSectionController transitionCoordinator](self, "transitionCoordinator");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v71[0] = 0;
  v71[1] = v71;
  v71[2] = 0x3032000000;
  v71[3] = __Block_byref_object_copy__5;
  v71[4] = __Block_byref_object_dispose__5;
  v72 = 0;
  objc_initWeak(&location, val);
  objc_initWeak(&v69, v18);
  -[AVTAvatarAttributeEditorSectionController section](self, "section");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&v68, v42);
  objc_initWeak(&from, self);
  v62[0] = MEMORY[0x1E0C809B0];
  v62[1] = 3221225472;
  v62[2] = __69__AVTAvatarAttributeEditorSectionController_cell_willDisplayAtIndex___block_invoke;
  v62[3] = &unk_1EA51DDE8;
  objc_copyWeak(&v65, &location);
  objc_copyWeak(&v66, &from);
  v64 = v71;
  v44 = v19;
  v63 = v44;
  v20 = (void *)objc_msgSend(v62, "copy");
  -[AVTAvatarAttributeEditorSectionController thumbnailScheduler](self, "thumbnailScheduler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarAttributeEditorSectionController renderingScheduler](self, "renderingScheduler");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarAttributeEditorSectionController environment](self, "environment");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "logger");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "scheduleTask:forIndex:", v20, a4);
  -[AVTAvatarAttributeEditorSectionController section](self, "section");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "identifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "description");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "logRequestingThumbnailForIndex:section:", a4, v26);

  objc_msgSend(v18, "stickerResourceProvider");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = v23;
  v41 = v6;
  if (v27)
  {
    objc_msgSend(v18, "stickerResourceProvider");
    v28 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v59[0] = MEMORY[0x1E0C809B0];
    v59[1] = 3221225472;
    v59[2] = __69__AVTAvatarAttributeEditorSectionController_cell_willDisplayAtIndex___block_invoke_4;
    v59[3] = &unk_1EA51DE10;
    v29 = (id *)v59;
    v30 = &v60;
    objc_copyWeak(&v60, &location);
    v31 = v61;
    objc_copyWeak(v61, &v69);
    v59[4] = v45;
    v59[7] = v71;
    v59[5] = v21;
    v59[6] = v20;
    v61[1] = (id)a4;
    ((void (**)(_QWORD, _QWORD *, _QWORD))v28)[2](v28, v59, 0);
    v32 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v18, "thumbnailProvider");
    v28 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v56[0] = MEMORY[0x1E0C809B0];
    v56[1] = 3221225472;
    v56[2] = __69__AVTAvatarAttributeEditorSectionController_cell_willDisplayAtIndex___block_invoke_5;
    v56[3] = &unk_1EA51DE38;
    v29 = (id *)v56;
    v30 = &v57;
    objc_copyWeak(&v57, &location);
    v31 = v58;
    objc_copyWeak(v58, &v69);
    v56[4] = v45;
    v56[7] = v71;
    v56[5] = v21;
    v56[6] = v20;
    v58[1] = (id)a4;
    ((void (**)(_QWORD, _QWORD *, _QWORD))v28)[2](v28, v56, 0);
    v32 = objc_claimAutoreleasedReturnValue();
  }
  v33 = (void *)v32;

  objc_destroyWeak(v31);
  objc_destroyWeak(v30);
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __69__AVTAvatarAttributeEditorSectionController_cell_willDisplayAtIndex___block_invoke_6;
  v47[3] = &unk_1EA51DE60;
  objc_copyWeak(&v53, &location);
  objc_copyWeak(&v54, &v69);
  objc_copyWeak(&v55, &v68);
  v34 = v44;
  v48 = v34;
  v35 = v21;
  v49 = v35;
  v36 = v20;
  v51 = v36;
  v37 = v43;
  v50 = v37;
  v38 = v33;
  v52 = v38;
  objc_msgSend(val, "setDiscardableContentHandler:", v47);
  objc_msgSend(v18, "cachedThumbnail");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (v39)
    objc_msgSend(val, "updateWithImage:", v39);
  else
    objc_msgSend(val, "setShowPlaceholder:", 1);

  objc_destroyWeak(&v55);
  objc_destroyWeak(&v54);
  objc_destroyWeak(&v53);

  objc_destroyWeak(&v66);
  objc_destroyWeak(&v65);
  objc_destroyWeak(&from);
  objc_destroyWeak(&v68);

  objc_destroyWeak(&v69);
  objc_destroyWeak(&location);
  _Block_object_dispose(v71, 8);

}

void __69__AVTAvatarAttributeEditorSectionController_cell_willDisplayAtIndex___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  void (**v4)(_QWORD);
  id WeakRetained;
  id v6;
  AVTSectionItemTransition *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  AVTSectionItemTransition *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;

  v3 = (id *)(a1 + 48);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v6 = objc_loadWeakRetained((id *)(a1 + 56));
  v7 = [AVTSectionItemTransition alloc];
  v8 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __69__AVTAvatarAttributeEditorSectionController_cell_willDisplayAtIndex___block_invoke_2;
  v17[3] = &unk_1EA51DDC0;
  v9 = WeakRetained;
  v10 = *(_QWORD *)(a1 + 40);
  v18 = v9;
  v19 = v10;
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __69__AVTAvatarAttributeEditorSectionController_cell_willDisplayAtIndex___block_invoke_3;
  v15[3] = &unk_1EA51D250;
  v16 = v9;
  v11 = v9;
  objc_msgSend(v6, "environment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "logger");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[AVTSectionItemTransition initWithModel:animated:setupHandler:completionHandler:logger:](v7, "initWithModel:animated:setupHandler:completionHandler:logger:", v11, 1, v17, v15, v13);

  objc_msgSend(*(id *)(a1 + 32), "addTransition:", v14);
  v4[2](v4);

}

void __69__AVTAvatarAttributeEditorSectionController_cell_willDisplayAtIndex___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  void (**v4)(id, uint64_t);

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v4 = a2;
  objc_msgSend(v2, "prepareForTransitionToImage:", v3);
  v4[2](v4, 1);

}

uint64_t __69__AVTAvatarAttributeEditorSectionController_cell_willDisplayAtIndex___block_invoke_3(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "cleanupAfterTransition");
  return result;
}

void __69__AVTAvatarAttributeEditorSectionController_cell_willDisplayAtIndex___block_invoke_4(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v4 = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(WeakRetained, "displaySessionUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);

  if (v5 == v6)
  {
    objc_msgSend(v11, "image");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCachedThumbnail:", v7);

    objc_msgSend(v11, "image");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    objc_msgSend(*(id *)(a1 + 40), "taskReady:forIndex:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 80));
  }

}

void __69__AVTAvatarAttributeEditorSectionController_cell_willDisplayAtIndex___block_invoke_5(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v5 = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(WeakRetained, "displaySessionUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 32);

  if (v6 == v7)
  {
    objc_msgSend(v5, "setCachedThumbnail:", v8);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
    objc_msgSend(*(id *)(a1 + 40), "taskReady:forIndex:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 80));
  }

}

void __69__AVTAvatarAttributeEditorSectionController_cell_willDisplayAtIndex___block_invoke_6(uint64_t a1)
{
  id v2;
  id v3;
  void *v4;
  int v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v2 = objc_loadWeakRetained((id *)(a1 + 80));
  v3 = objc_loadWeakRetained((id *)(a1 + 88));
  objc_msgSend(WeakRetained, "setDisplaySessionUUID:", 0);
  objc_msgSend(v2, "discardContent");
  objc_msgSend(*(id *)(a1 + 32), "cancelTransitionsMatchingModel:", WeakRetained);
  objc_msgSend(*(id *)(a1 + 40), "cancelTask:", *(_QWORD *)(a1 + 56));
  if (v3
    && (objc_msgSend(v3, "sectionItems"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "containsObject:", v2),
        v4,
        v5))
  {
    objc_msgSend(*(id *)(a1 + 48), "lowerTaskPriority:", *(_QWORD *)(a1 + 64));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "cancelTask:", *(_QWORD *)(a1 + 64));
  }

}

- (void)didHighlightItemAtIndex:(int64_t)a3 cell:(id)a4 completionBlock:(id)a5
{
  id v6;
  id v7;

  v6 = a5;
  objc_msgSend(a4, "valueView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateHighlightedState:animated:completionBlock:", 1, 1, v6);

}

- (void)didUnhighlightItemAtIndex:(int64_t)a3 cell:(id)a4 completionBlock:(id)a5
{
  id v6;
  id v7;

  v6 = a5;
  objc_msgSend(a4, "valueView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateHighlightedState:animated:completionBlock:", 0, 1, v6);

}

- (void)didSelectItemAtIndex:(int64_t)a3 cell:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[AVTAvatarAttributeEditorSectionController delegate](self, "delegate", a3, a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarAttributeEditorSectionController section](self, "section");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "attributeEditorSectionController:didSelectSectionItem:", self, v8);

}

- (BOOL)evaluateDisplayCondition:(id)a3
{
  return 0;
}

- (CGSize)sizeForFocusingItemAtIndex:(int64_t)a3 fittingSize:(CGSize)a4
{
  double width;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGSize result;

  width = a4.width;
  -[AVTAvatarAttributeEditorSectionController section](self, "section", a4.width, a4.height);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sectionItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9 <= a3)
  {
    v17 = *MEMORY[0x1E0C9D820];
    v19 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  else
  {
    v10 = (void *)objc_opt_class();
    -[AVTAvatarAttributeEditorSectionController section](self, "section");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sectionItems");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarAttributeEditorSectionController section](self, "section");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarAttributeEditorSectionController environment](self, "environment");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cellSizeForSectionItem:inSection:fittingWidth:environment:", v13, v14, v15, width);
    v17 = v16;
    v19 = v18;

  }
  v20 = v17;
  v21 = v19;
  result.height = v21;
  result.width = v20;
  return result;
}

- (int64_t)selectedIndex
{
  return self->_selectedIndex;
}

- (void)setSelectedIndex:(int64_t)a3
{
  self->_selectedIndex = a3;
}

- (AVTAvatarAttributeEditorControllerSubSelectionDelegate)delegate
{
  return (AVTAvatarAttributeEditorControllerSubSelectionDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (AVTAvatarAttributeEditorSection)section
{
  return self->_section;
}

- (void)setSection:(id)a3
{
  objc_storeStrong((id *)&self->_section, a3);
}

- (AVTTransitionCoordinator)transitionCoordinator
{
  return self->_transitionCoordinator;
}

- (void)setTransitionCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_transitionCoordinator, a3);
}

- (AVTUIEnvironment)environment
{
  return self->_environment;
}

- (AVTIndexBasedTaskScheduler)thumbnailScheduler
{
  return self->_thumbnailScheduler;
}

- (AVTTaskScheduler)renderingScheduler
{
  return self->_renderingScheduler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderingScheduler, 0);
  objc_storeStrong((id *)&self->_thumbnailScheduler, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_transitionCoordinator, 0);
  objc_storeStrong((id *)&self->_section, 0);
  objc_destroyWeak((id *)&self->delegate);
}

@end
