@implementation AKAlignmentGuideController

- (AKAlignmentGuideController)initWithPageController:(id)a3
{
  id v4;
  AKAlignmentGuideController *v5;
  AKAlignmentGuideController *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  CGPoint *v15;
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat MidX;
  CGFloat MidY;
  CGFloat *p_x;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t j;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  void *v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  objc_super v64;
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;

  v67 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v64.receiver = self;
  v64.super_class = (Class)AKAlignmentGuideController;
  v5 = -[AKAlignmentGuideController init](&v64, sel_init);
  v6 = v5;
  if (v5)
  {
    -[AKAlignmentGuideController setPageController:](v5, "setPageController:", v4);
    -[AKAlignmentGuideController setExifHasFlippedAxes:](v6, "setExifHasFlippedAxes:", +[AKGeometryHelper exifOrientationHasReversedAxes:](AKGeometryHelper, "exifOrientationHasReversedAxes:", objc_msgSend(v4, "currentModelToScreenExifOrientation")));
    objc_msgSend(v4, "currentModelToScreenScaleFactor");
    -[AKAlignmentGuideController setScreenToModelScaleFactor:](v6, "setScreenToModelScaleFactor:", 1.0 / v7);
    objc_msgSend(v4, "pageModelController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "selectedAnnotations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x24BDBCEF0];
    objc_msgSend(v4, "pageModelController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "annotations");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "minusSet:", v9);
    v14 = objc_msgSend(v13, "count");
    v6->_otherAnnotationCentersCount = 0;
    if (v14 >> 60)
    {
      if (!v6->_otherAnnotationCenters)
        goto LABEL_35;
    }
    else
    {
      v15 = (CGPoint *)malloc_type_malloc(16 * v14, 0x58034F82uLL);
      v6->_otherAnnotationCenters = v15;
      if (!v15)
      {
LABEL_35:

        goto LABEL_36;
      }
    }
    x = *MEMORY[0x24BDBF070];
    y = *(double *)(MEMORY[0x24BDBF070] + 8);
    width = *(double *)(MEMORY[0x24BDBF070] + 16);
    height = *(double *)(MEMORY[0x24BDBF070] + 24);
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v20 = v9;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v61;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v61 != v23)
            objc_enumerationMutation(v20);
          v25 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
          if (objc_msgSend(v25, "conformsToAKRectangularAnnotationProtocol"))
            objc_msgSend(v25, "rectangle");
          else
            objc_msgSend(v25, "drawingBounds");
          v30 = v26;
          v31 = v27;
          v32 = v28;
          v33 = v29;
          if (!+[AKGeometryHelper isUnpresentableRect:](AKGeometryHelper, "isUnpresentableRect:"))
          {
            v68.origin.x = x;
            v68.origin.y = y;
            v68.size.width = width;
            v68.size.height = height;
            v75.origin.x = v30;
            v75.origin.y = v31;
            v75.size.width = v32;
            v75.size.height = v33;
            v69 = CGRectUnion(v68, v75);
            x = v69.origin.x;
            y = v69.origin.y;
            width = v69.size.width;
            height = v69.size.height;
          }
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
      }
      while (v22);
    }

    v70.origin.x = x;
    v70.origin.y = y;
    v70.size.width = width;
    v70.size.height = height;
    if (CGRectIsNull(v70))
    {
      v6->_initialDraggedAnnotationsCombinedCenter = (CGPoint)*MEMORY[0x24BDBEFB0];
    }
    else
    {
      v54 = v9;
      v55 = v4;
      v71.origin.x = x;
      v71.origin.y = y;
      v71.size.width = width;
      v71.size.height = height;
      MidX = CGRectGetMidX(v71);
      v72.origin.x = x;
      v72.origin.y = y;
      v72.size.width = width;
      v72.size.height = height;
      MidY = CGRectGetMidY(v72);
      v6->_initialDraggedAnnotationsCombinedCenter.x = MidX;
      v6->_initialDraggedAnnotationsCombinedCenter.y = MidY;
      p_x = &v6->_otherAnnotationCenters->x;
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      v37 = v13;
      v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
      if (v38)
      {
        v39 = v38;
        v40 = *(_QWORD *)v57;
        do
        {
          for (j = 0; j != v39; ++j)
          {
            if (*(_QWORD *)v57 != v40)
              objc_enumerationMutation(v37);
            v42 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (objc_msgSend(v42, "conformsToAKRectangularAnnotationProtocol"))
                  objc_msgSend(v42, "rectangle");
                else
                  objc_msgSend(v42, "drawingBounds");
                v47 = v43;
                v48 = v44;
                v49 = v45;
                v50 = v46;
                if (!+[AKGeometryHelper isUnpresentableRect:](AKGeometryHelper, "isUnpresentableRect:"))
                {
                  v73.origin.x = v47;
                  v73.origin.y = v48;
                  v73.size.width = v49;
                  v73.size.height = v50;
                  v51 = CGRectGetMidX(v73);
                  v74.origin.x = v47;
                  v74.origin.y = v48;
                  v74.size.width = v49;
                  v74.size.height = v50;
                  v52 = CGRectGetMidY(v74);
                  *p_x = v51;
                  p_x[1] = v52;
                  p_x += 2;
                  ++v6->_otherAnnotationCentersCount;
                }
              }
            }
          }
          v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
        }
        while (v39);
      }

      v9 = v54;
      v4 = v55;
    }
    goto LABEL_35;
  }
LABEL_36:

  return v6;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[AKAlignmentGuideController pageController](self, "pageController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layerPresentationManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlignmentGuidePositionX:", 1.79769313e308);
  objc_msgSend(v4, "setAlignmentGuidePositionY:", 1.79769313e308);
  free(self->_otherAnnotationCenters);

  v5.receiver = self;
  v5.super_class = (Class)AKAlignmentGuideController;
  -[AKAlignmentGuideController dealloc](&v5, sel_dealloc);
}

- (CGPoint)guideAlignedPointForPoint:(CGPoint)a3 withEvent:(id)a4 orRecognizer:(id)a5
{
  CGFloat y;
  CGFloat x;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[AKAlignmentGuideController pageController](self, "pageController", a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "controller");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mainEventHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layerPresentationManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstDragPoint");
  objc_msgSend(v10, "setAlignmentGuidePositionX:", 1.79769313e308);
  objc_msgSend(v10, "setAlignmentGuidePositionY:", 1.79769313e308);

  v11 = x;
  v12 = y;
  result.y = v12;
  result.x = v11;
  return result;
}

- (AKPageController)pageController
{
  return (AKPageController *)objc_loadWeakRetained((id *)&self->_pageController);
}

- (void)setPageController:(id)a3
{
  objc_storeWeak((id *)&self->_pageController, a3);
}

- (BOOL)exifHasFlippedAxes
{
  return self->_exifHasFlippedAxes;
}

- (void)setExifHasFlippedAxes:(BOOL)a3
{
  self->_exifHasFlippedAxes = a3;
}

- (double)screenToModelScaleFactor
{
  return self->_screenToModelScaleFactor;
}

- (void)setScreenToModelScaleFactor:(double)a3
{
  self->_screenToModelScaleFactor = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_pageController);
}

@end
