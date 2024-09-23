@implementation AKFormFeatureDetectorController

- (AKFormFeatureDetectorController)initWithController:(id)a3
{
  id v4;
  AKFormFeatureDetectorController *v5;
  AKFormFeatureDetectorController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AKFormFeatureDetectorController;
  v5 = -[AKFormFeatureDetectorController init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[AKFormFeatureDetectorController setController:](v5, "setController:", v4);

  return v6;
}

- (BOOL)detectFormFeatureAtPoint:(CGPoint)a3 inPageController:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  char v15;
  _BOOL4 v16;
  void *v17;
  char v18;
  void *v19;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[AKFormFeatureDetectorController controller](self, "controller");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(v9, "shouldPlaceFormElementAtPoint:onOverlayAtPageIndex:forAnnotationController:", objc_msgSend(v7, "pageIndex"), v8, x, y))
  {
    -[AKFormFeatureDetectorController formFeatureAtPoint:inPageController:](self, "formFeatureAtPoint:inPageController:", v7, x, y);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v10, "rect");
      v15 = objc_msgSend(v9, "shouldPlaceProposedFormElementAtRect:onOverlayAtPageIndex:forAnnotationController:", objc_msgSend(v7, "pageIndex"), v8, v11, v12, v13, v14);
    }
    else
    {
      v15 = 1;
    }
    objc_msgSend(v8, "formDetectionController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "formFeature:intersectsAnnotationsOnPage:", v10, v7);

    v16 = (v10 != 0) & ~v18 & v15;
    if (v16)
    {
      objc_msgSend(v8, "formDetectionController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "createAnnotationWithFeature:onPageController:", v10, v7);

    }
  }
  else
  {
    LOBYTE(v16) = 0;
  }

  return v16;
}

- (id)formFeatureAtPoint:(CGPoint)a3 inPageController:(id)a4
{
  double y;
  double x;
  id v7;
  AKFormFeatureDetector *v8;
  void *v9;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = -[AKFormFeatureDetector initWithDelegate:]([AKFormFeatureDetector alloc], "initWithDelegate:", self);
  objc_msgSend(v7, "convertPointFromOverlayToModel:", x, y);
  -[AKFormFeatureDetector featureAtPoint:onPage:mode:](v8, "featureAtPoint:onPage:mode:", v7, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  AKLog(CFSTR("Detected feature: %@"));
  return v9;
}

- (void)createAnnotationWithFeature:(id)a3 onPageController:(id)a4
{
  id v6;
  void *v7;
  void *v8;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  CGFloat v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;

  v45 = a3;
  v6 = a4;
  -[AKFormFeatureDetectorController controller](self, "controller");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "toolController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        objc_opt_isKindOfClass();
        v17 = 0;
        goto LABEL_17;
      }
      objc_msgSend(v45, "rect");
      v35 = v34;
      v37 = v36;
      v39 = v38;
      v41 = v40;
      v17 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x24BDF6AC8], "kitImageNamed:", CFSTR("UIPreferencesBlueCheck.png"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setImage:", v42);

      objc_msgSend(v17, "setRectangle:", v35, v37, v39, v41);
      if (!v17)
        goto LABEL_17;
      goto LABEL_9;
    }
  }
  objc_msgSend(v45, "rect");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v17 = (void *)objc_opt_new();
  objc_msgSend(v17, "setFillColor:", 0);
  objc_msgSend(v17, "setStrokeColor:", 0);
  objc_msgSend(v17, "setStrokeWidth:", 0.0);
  objc_msgSend(v17, "setBrushStyle:", 0);
  objc_msgSend(v17, "setDashed:", 0);
  objc_msgSend(v17, "setHasShadow:", 0);
  objc_msgSend(v17, "setRectangle:", v10, v12, v14, v16);
  objc_msgSend(v17, "setTextIsFixedWidth:", 0);
  objc_msgSend(v7, "attributeController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "textAttributes");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "mutableCopy");

  objc_msgSend(v7, "attributeController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "font");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v22, "pointSize");
    v24 = v23;
    objc_msgSend(v22, "descender");
    v26 = v24 - v25;
    v46.origin.x = v10;
    v46.origin.y = v12;
    v46.size.width = v14;
    v46.size.height = v16;
    if (v26 > CGRectGetHeight(v46))
    {
      v47.origin.x = v10;
      v47.origin.y = v12;
      v47.size.width = v14;
      v47.size.height = v16;
      -[AKFormFeatureDetectorController _convertFont:toSize:](self, "_convertFont:toSize:", v22, CGRectGetHeight(v47));
      v27 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v20, "setObject:forKeyedSubscript:", v27, *MEMORY[0x24BDF65F8]);
      v22 = (void *)v27;
    }
  }
  v28 = *MEMORY[0x24BDF6628];
  objc_msgSend(v20, "objectForKeyedSubscript:", *MEMORY[0x24BDF6628]);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v29, "mutableCopy");

  if (!v30)
  {
    objc_msgSend(MEMORY[0x24BDF6750], "defaultParagraphStyle");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v31, "mutableCopy");

  }
  objc_msgSend(v30, "setAlignment:", 0);
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v30, v28);
  objc_msgSend(v17, "setTypingAttributes:", v20);

  if (v17)
  {
LABEL_9:
    objc_msgSend(v8, "addNewAnnotation:onPageController:shouldSelect:shouldCascade:", v17, v6, 1, 0);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "modelController");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "deselectAllAnnotations");

    }
    if (objc_msgSend(v17, "conformsToAKTextAnnotationProtocol"))
    {
      objc_msgSend(v7, "textEditorController");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "beginEditingAnnotation:withPageController:selectAllText:", v17, v6, 1);

    }
  }
LABEL_17:
  objc_msgSend(v45, "rect");
  j__NSStringFromCGRect(v48);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "drawingBounds");
  j__NSStringFromCGRect(v49);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  AKLog(CFSTR("Placed detected feature\n%@ has annotation drawing bounds - rect:%@, drawingBounds:%@"));

}

- (BOOL)formFeature:(id)a3 intersectsAnnotationsOnPage:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD v18[9];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v5 = a3;
  v6 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  objc_msgSend(v5, "rect");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend(v6, "pageModelController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "annotations");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = sub_229069E50;
  v18[3] = &unk_24F1A82E8;
  v18[5] = v8;
  v18[6] = v10;
  v18[7] = v12;
  v18[8] = v14;
  v18[4] = &v19;
  objc_msgSend(v16, "enumerateObjectsUsingBlock:", v18);
  LOBYTE(v15) = *((_BYTE *)v20 + 24);

  _Block_object_dispose(&v19, 8);
  return (char)v15;
}

- (id)_convertFont:(id)a3 toSize:(double)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;

  v5 = a3;
  objc_msgSend(v5, "pointSize");
  v7 = v6;
  objc_msgSend(v5, "descender");
  v9 = v7 - v8;
  if (v9 > a4)
  {
    objc_msgSend(v5, "pointSize");
    if (a4 != 1.0)
    {
      objc_msgSend(v5, "fontWithSize:", v10 * a4 / v9);
      v11 = objc_claimAutoreleasedReturnValue();

      v5 = (id)v11;
    }
  }
  return v5;
}

- (BOOL)wantsDefaultFeatures
{
  return 1;
}

- (CGSize)defaultFeatureSizeForPage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  void *v12;
  CGFloat v13;
  double v14;
  double v15;
  void *v16;
  CGSize v17;
  CGSize result;
  CGRect v19;

  v4 = a3;
  -[AKFormFeatureDetectorController controller](self, "controller");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attributeController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "font");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pointSize");
  v9 = v8;
  objc_msgSend(v7, "descender");
  v11 = v9 - v10;
  objc_msgSend(v4, "overlayView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "frame");
  v13 = CGRectGetWidth(v19) / 6.0;

  v17.width = v13;
  v17.height = v11;
  j__NSStringFromCGSize(v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  AKLog(CFSTR("%s %@"));

  v14 = v13;
  v15 = v11;
  result.height = v15;
  result.width = v14;
  return result;
}

- (double)maximumFeatureWidthForPage:(id)a3
{
  void *v3;
  double v4;
  CGRect v6;

  objc_msgSend(a3, "overlayView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v4 = CGRectGetWidth(v6) * 0.5;

  if (v4 > 100.0)
    v4 = 100.0;
  AKLog(CFSTR("%s %f"));
  return v4;
}

- (AKController)controller
{
  return (AKController *)objc_loadWeakRetained((id *)&self->_controller);
}

- (void)setController:(id)a3
{
  objc_storeWeak((id *)&self->_controller, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_controller);
}

@end
