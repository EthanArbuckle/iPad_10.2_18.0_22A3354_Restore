@implementation AKAttributeController

+ (id)defaultFont
{
  return (id)objc_msgSend(MEMORY[0x24BDF6A70], "fontWithName:size:", CFSTR("Helvetica"), 24.0);
}

+ (id)defaultTextAttributes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDF6750], "defaultParagraphStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "setAlignment:", 1);
  objc_msgSend(v4, "setDefaultTabInterval:", 0.0);
  objc_msgSend(v4, "setAllowsDefaultTighteningForTruncation:", 1);
  v5 = (void *)objc_msgSend(v4, "copy");
  v12[0] = *MEMORY[0x24BDF65F8];
  objc_msgSend(a1, "defaultFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x24BDF6628];
  v13[0] = v6;
  v13[1] = v5;
  v8 = *MEMORY[0x24BDF6600];
  v12[1] = v7;
  v12[2] = v8;
  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (void)initialize
{
  id v3;
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
  void *v16;
  _QWORD v17[11];
  _QWORD v18[13];

  v18[11] = *MEMORY[0x24BDAC8D0];
  objc_opt_self();
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == a1)
  {
    objc_msgSend(a1, "defaultFont");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "defaultTextAttributes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = CFSTR("com.apple.AnnotationKit.userDefaultsVersion");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v5;
    v17[1] = CFSTR("com.apple.AnnotationKit.strokeColor");
    v6 = (void *)MEMORY[0x24BDBCF50];
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "akDataForColor:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v8;
    v17[2] = CFSTR("com.apple.AnnotationKit.fillColor");
    v9 = (void *)MEMORY[0x24BDBCF50];
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "akDataForColor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18[2] = v11;
    v18[3] = &unk_24F1CFF18;
    v17[3] = CFSTR("com.apple.AnnotationKit.strokeWidth");
    v17[4] = CFSTR("com.apple.AnnotationKit.strokeIsDashed");
    v18[4] = MEMORY[0x24BDBD1C0];
    v18[5] = MEMORY[0x24BDBD1C0];
    v17[5] = CFSTR("com.apple.AnnotationKit.hasShadow");
    v17[6] = CFSTR("com.apple.AnnotationKit.brushStyle");
    v18[6] = &unk_24F1CF870;
    v18[7] = &unk_24F1CF888;
    v17[7] = CFSTR("com.apple.AnnotationKit.arrowHeadStyle");
    v17[8] = CFSTR("com.apple.AnnotationKit.font");
    objc_msgSend(MEMORY[0x24BDBCF50], "akDataForFont:", v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[8] = v12;
    v17[9] = CFSTR("com.apple.AnnotationKit.textAttributes");
    objc_msgSend(MEMORY[0x24BDBCF50], "akDataForTextAttributes:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[10] = CFSTR("com.apple.AnnotationKit.highlightStyle");
    v18[9] = v13;
    v18[10] = &unk_24F1CF8A0;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "registerDefaults:", v14);

  }
}

- (AKAttributeController)initWithController:(id)a3
{
  id v4;
  AKAttributeController *v5;
  AKAttributeController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AKAttributeController;
  v5 = -[AKAttributeController init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[AKAttributeController setController:](v5, "setController:", v4);
    -[AKAttributeController _restorePersistedAttributes](v6, "_restorePersistedAttributes");
  }

  return v6;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  uint64_t v9;
  uint64_t v10;

  if (a6 == CFSTR("AKAttributeController.selectedAnnotationsObservationContext"))
  {
    -[AKAttributeController _syncAttributesFromSelectedAnnotationsToUI](self, "_syncAttributesFromSelectedAnnotationsToUI", a3, a4, a5);
  }
  else
  {
    v9 = v6;
    v10 = v7;
    v8.receiver = self;
    v8.super_class = (Class)AKAttributeController;
    -[AKAttributeController observeValueForKeyPath:ofObject:change:context:](&v8, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)setStrokeColor:(id)a3
{
  id v5;
  UIColor **p_strokeColor;
  UIColor *strokeColor;
  id v8;

  v5 = a3;
  strokeColor = self->_strokeColor;
  p_strokeColor = &self->_strokeColor;
  v8 = v5;
  if (!-[UIColor akIsEqualToColor:](strokeColor, "akIsEqualToColor:"))
    objc_storeStrong((id *)p_strokeColor, a3);

}

- (void)forceHideRuler
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[AKAttributeController controller](self, "controller");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentPageController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inkPageOverlayController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inkOverlayView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "canvasView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRulerActive:", 0);

}

- (void)forceShowRuler
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[AKAttributeController controller](self, "controller");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentPageController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inkPageOverlayController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inkOverlayView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "canvasView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRulerActive:", 1);

}

- (void)toggleRuler
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[AKAttributeController controller](self, "controller");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "toolController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "toolMode");

  if (v3 == 4)
  {
    objc_msgSend(v9, "modelController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deselectAllAnnotations");

  }
  objc_msgSend(v9, "currentPageController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "inkPageOverlayController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "didToggleRuler");

  objc_msgSend(v9, "toolbarViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "revalidateItems");

  objc_msgSend(v9, "modernToolbarView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "revalidateItems");

}

- (void)annotationEditingDidEndWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(void);

  v8 = (void (**)(void))a3;
  -[AKAttributeController controller](self, "controller");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentPageController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "inkPageOverlayController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "inkPageOverlayController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "annotationEditingDidEndWithCompletion:", v8);

  }
  else if (v8)
  {
    v8[2]();
  }

}

- (void)setInk:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  if ((-[PKInk isEqual:](self->_ink, "isEqual:") & 1) == 0)
    objc_storeStrong((id *)&self->_ink, a3);
  -[AKAttributeController controller](self, "controller");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "toolController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "toolMode");

  if (v7 == 4)
  {
    objc_msgSend(v5, "modelController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deselectAllAnnotations");

  }
  -[AKAttributeController _updateInk](self, "_updateInk");

}

- (void)setHighlightStyle:(int64_t)a3
{
  self->_highlightStyle = a3;
  -[AKAttributeController _persistCurrentAttributes](self, "_persistCurrentAttributes");
}

- (void)performAttributeActionForSender:(id)a3 segment:(int64_t)a4
{
  MEMORY[0x24BEDD108](self, sel__syncAttributesFromSenderToSelfAndSelectedAnnotations_segment_);
}

- (BOOL)isAttributeSenderEnabled:(id)a3 segment:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[AKAttributeController modelControllerToObserveForSelections](self, "modelControllerToObserveForSelections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectedAnnotations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a4) = -[AKAttributeController _isEnabledForSender:segment:withSelectedAnnotations:](self, "_isEnabledForSender:segment:withSelectedAnnotations:", v6, a4, v8);
  return a4;
}

- (void)updateAttributeSenderState:(id)a3 segment:(int64_t)a4 enabled:(BOOL)a5
{
  _BOOL8 v5;
  id v8;

  v5 = a5;
  v8 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v8, "setEnabled:", v5);
  -[AKAttributeController _updateStateOnSender:segment:](self, "_updateStateOnSender:segment:", v8, a4);

}

- (BOOL)strokeColorIsEqualTo:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[AKAttributeController strokeColor](self, "strokeColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "akIsEqualToColor:", v4);

  return v6;
}

- (void)restoreStrokeColorToSystemDefault
{
  id v3;

  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[AKAttributeController setStrokeColor:](self, "setStrokeColor:", v3);

}

- (void)setModelControllerToObserveForSelections:(id)a3
{
  AKPageModelController *v5;
  AKPageModelController *modelControllerToObserveForSelections;
  AKPageModelController *v7;

  v5 = (AKPageModelController *)a3;
  modelControllerToObserveForSelections = self->modelControllerToObserveForSelections;
  v7 = v5;
  if (modelControllerToObserveForSelections != v5)
  {
    if (modelControllerToObserveForSelections)
      -[AKPageModelController removeObserver:forKeyPath:](modelControllerToObserveForSelections, "removeObserver:forKeyPath:", self, CFSTR("selectedAnnotations"));
    objc_storeStrong((id *)&self->modelControllerToObserveForSelections, a3);
    if (self->modelControllerToObserveForSelections)
    {
      -[AKAttributeController _syncAttributesFromSelectedAnnotationsToUI](self, "_syncAttributesFromSelectedAnnotationsToUI");
      -[AKPageModelController addObserver:forKeyPath:options:context:](self->modelControllerToObserveForSelections, "addObserver:forKeyPath:options:context:", self, CFSTR("selectedAnnotations"), 0, CFSTR("AKAttributeController.selectedAnnotationsObservationContext"));
    }
  }

}

- (void)setDefaultInk
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)MEMORY[0x24BDE33B0];
  -[AKAttributeController controller](self, "controller");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "akDefaultInkWithHighVisibility:", objc_msgSend(v4, "useHighVisibilityDefaultInks"));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[AKAttributeController setInk:](self, "setInk:", v5);
}

- (void)resetToLastDrawingInk
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[AKAttributeController controller](self, "controller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "modernToolbarView");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "resetToLastDrawingTool");
  }
  else
  {
    -[AKAttributeController ink](self, "ink");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v5 = (void *)MEMORY[0x24BDE33B0];
      -[AKAttributeController ink](self, "ink");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKAttributeController strokeColor](self, "strokeColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKAttributeController strokeWidth](self, "strokeWidth");
      objc_msgSend(v5, "akInkFromInk:color:strokeWidth:", v6, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      -[AKAttributeController setInk:](self, "setInk:", v8);
    }
    else
    {
      -[AKAttributeController setDefaultInk](self, "setDefaultInk");
    }
  }

}

- (void)updateInkIfNeeded:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (objc_msgSend(v8, "conformsToProtocol:", &unk_255A3A750)
    && objc_msgSend(v8, "wantsInkUpdate"))
  {
    v4 = (void *)MEMORY[0x24BDE33B0];
    -[AKAttributeController ink](self, "ink");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKAttributeController strokeColor](self, "strokeColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKAttributeController strokeWidth](self, "strokeWidth");
    objc_msgSend(v4, "akInkFromInk:color:strokeWidth:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKAttributeController setInk:](self, "setInk:", v7);

  }
}

- (void)_updateInk
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("AKAttributeController.inkDidChange"), self);

  -[AKAttributeController controller](self, "controller");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "toolbarViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "revalidateItems");

  objc_msgSend(v6, "modernToolbarView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "revalidateItems");

}

- (void)_persistCurrentAttributes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setInteger:forKey:", 1, CFSTR("com.apple.AnnotationKit.userDefaultsVersion"));
  -[AKAttributeController strokeColor](self, "strokeColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "akSetColor:forKey:", v3, CFSTR("com.apple.AnnotationKit.strokeColor"));

  -[AKAttributeController fillColor](self, "fillColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "akSetColor:forKey:", v4, CFSTR("com.apple.AnnotationKit.fillColor"));

  -[AKAttributeController strokeWidth](self, "strokeWidth");
  objc_msgSend(v7, "setDouble:forKey:", CFSTR("com.apple.AnnotationKit.strokeWidth"));
  objc_msgSend(v7, "setBool:forKey:", -[AKAttributeController strokeIsDashed](self, "strokeIsDashed"), CFSTR("com.apple.AnnotationKit.strokeIsDashed"));
  objc_msgSend(v7, "setBool:forKey:", -[AKAttributeController hasShadow](self, "hasShadow"), CFSTR("com.apple.AnnotationKit.hasShadow"));
  objc_msgSend(v7, "setInteger:forKey:", -[AKAttributeController brushStyle](self, "brushStyle"), CFSTR("com.apple.AnnotationKit.brushStyle"));
  objc_msgSend(v7, "setInteger:forKey:", -[AKAttributeController arrowHeadStyle](self, "arrowHeadStyle"), CFSTR("com.apple.AnnotationKit.arrowHeadStyle"));
  -[AKAttributeController font](self, "font");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "akSetFont:forKey:", v5, CFSTR("com.apple.AnnotationKit.font"));

  -[AKAttributeController textAttributes](self, "textAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "akSetTextAttributes:forKey:", v6, CFSTR("com.apple.AnnotationKit.textAttributes"));

  objc_msgSend(v7, "setInteger:forKey:", -[AKAttributeController highlightStyle](self, "highlightStyle"), CFSTR("com.apple.AnnotationKit.highlightStyle"));
}

- (void)_restorePersistedAttributes
{
  void *v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "removeObjectForKey:", CFSTR("com.apple.AnnotationKit.strokeColor"));
  objc_msgSend(v21, "removeObjectForKey:", CFSTR("com.apple.AnnotationKit.fillColor"));
  objc_msgSend(v21, "removeObjectForKey:", CFSTR("com.apple.AnnotationKit.strokeWidth"));
  objc_msgSend(v21, "removeObjectForKey:", CFSTR("com.apple.AnnotationKit.strokeIsDashed"));
  objc_msgSend(v21, "removeObjectForKey:", CFSTR("com.apple.AnnotationKit.hasShadow"));
  objc_msgSend(v21, "removeObjectForKey:", CFSTR("com.apple.AnnotationKit.brushStyle"));
  objc_msgSend(v21, "removeObjectForKey:", CFSTR("com.apple.AnnotationKit.arrowHeadStyle"));
  objc_msgSend(v21, "removeObjectForKey:", CFSTR("com.apple.AnnotationKit.font"));
  objc_msgSend(v21, "removeObjectForKey:", CFSTR("com.apple.AnnotationKit.textAttributes"));
  objc_msgSend(v21, "removeObjectForKey:", CFSTR("com.apple.AnnotationKit.highlightStyle"));
  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAttributeController setStrokeColor:](self, "setStrokeColor:", v3);

  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAttributeController setFillColor:](self, "setFillColor:", v4);

  objc_msgSend(v21, "doubleForKey:", CFSTR("com.apple.AnnotationKit.strokeWidth"));
  -[AKAttributeController setStrokeWidth:](self, "setStrokeWidth:");
  -[AKAttributeController setStrokeIsDashed:](self, "setStrokeIsDashed:", objc_msgSend(v21, "BOOLForKey:", CFSTR("com.apple.AnnotationKit.strokeIsDashed")));
  -[AKAttributeController setHasShadow:](self, "setHasShadow:", objc_msgSend(v21, "BOOLForKey:", CFSTR("com.apple.AnnotationKit.hasShadow")));
  -[AKAttributeController setBrushStyle:](self, "setBrushStyle:", objc_msgSend(v21, "integerForKey:", CFSTR("com.apple.AnnotationKit.brushStyle")));
  v5 = objc_msgSend(v21, "integerForKey:", CFSTR("com.apple.AnnotationKit.arrowHeadStyle"));
  if (v5 >= 3)
    v6 = 3;
  else
    v6 = v5;
  -[AKAttributeController setArrowHeadStyle:](self, "setArrowHeadStyle:", v6);
  objc_msgSend(v21, "akFontForKey:", CFSTR("com.apple.AnnotationKit.font"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAttributeController setFont:](self, "setFont:", v7);

  -[AKAttributeController font](self, "font");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "defaultFont");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    objc_msgSend(v9, "pointSize");
    v12 = v11;

    -[AKAttributeController font](self, "font");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fontWithSize:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKAttributeController setFont:](self, "setFont:", v13);

  }
  else
  {
    -[AKAttributeController setFont:](self, "setFont:", v9);
  }

  objc_msgSend(v21, "akTextAttributesForKey:", CFSTR("com.apple.AnnotationKit.textAttributes"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAttributeController setTextAttributes:](self, "setTextAttributes:", v14);

  -[AKAttributeController textAttributes](self, "textAttributes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    objc_msgSend((id)objc_opt_class(), "defaultTextAttributes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKAttributeController setTextAttributes:](self, "setTextAttributes:", v16);

  }
  -[AKAttributeController textAttributes](self, "textAttributes");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "mutableCopy");

  -[AKAttributeController font](self, "font");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, *MEMORY[0x24BDF65F8]);

  v20 = (void *)objc_msgSend(v18, "copy");
  -[AKAttributeController setTextAttributes:](self, "setTextAttributes:", v20);

  -[AKAttributeController setHighlightStyle:](self, "setHighlightStyle:", objc_msgSend(v21, "integerForKey:", CFSTR("com.apple.AnnotationKit.highlightStyle")));
}

- (void)_syncAttributesFromSenderToSelfAndSelectedAnnotations:(id)a3 segment:(int64_t)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  char v22;
  double v23;
  double v24;
  void *v25;
  char isKindOfClass;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  char v34;
  id v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  int v49;
  id v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  id v64;
  void *v65;
  void *v66;
  uint64_t v67;
  id v68;
  id v69;
  id v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  char v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  id v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  id v87;
  void *v88;
  void *v89;
  uint64_t v90;
  void *v91;
  int v92;
  uint64_t v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  id v98;
  double v99;
  double v100;
  void *v101;
  id v102;
  id v103;
  void *v104;
  void *v105;
  void *v106;
  uint64_t v107;
  void *v108;
  void *v109;
  void *v110;
  id v111;
  uint64_t v112;
  id v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  uint64_t v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  uint64_t v130;
  AKAttributeController *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  AKAttributeController *v138;
  uint64_t v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  id v147;
  void *v148;
  id v149;
  AKAttributeController *v150;
  void *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  id obj;
  void *v156;
  _QWORD v157[4];
  id v158;
  id v159;
  _QWORD v160[4];
  id v161;
  id v162;
  double v163;
  double v164;
  _QWORD v165[4];
  id v166;
  id v167;
  _QWORD v168[4];
  id v169;
  id v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  uint64_t v175;
  void *v176;
  uint64_t v177;
  void *v178;
  _BYTE v179[128];
  uint64_t v180;

  v180 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = objc_msgSend(v6, "tag");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = objc_msgSend(v6, "tagForSegment:", a4);
  -[AKAttributeController controller](self, "controller");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAttributeController modelControllerToObserveForSelections](self, "modelControllerToObserveForSelections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "selectedAnnotations");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v153 = v7;
  if (v7 <= 765099)
  {
    if ((unint64_t)(v7 - 765001) < 0xF)
    {
      if (objc_msgSend(v6, "conformsToProtocol:", &unk_255A3A6E0))
        objc_msgSend(v6, "lineWidth");
      else
        v11 = (double)(objc_msgSend(v6, "tag") - 765000);
      -[AKAttributeController setStrokeWidth:](self, "setStrokeWidth:", v11);
LABEL_13:
      -[AKAttributeController updateInkIfNeeded:](self, "updateInkIfNeeded:", v6);
    }
  }
  else
  {
    switch(v7)
    {
      case 765100:
        -[AKAttributeController setHasShadow:](self, "setHasShadow:", -[AKAttributeController hasShadow](self, "hasShadow") ^ 1);
        break;
      case 765101:
        objc_msgSend(v6, "color");
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        -[AKAttributeController setStrokeColor:](self, "setStrokeColor:", v123);

        goto LABEL_13;
      case 765102:
        objc_msgSend(v6, "color");
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        -[AKAttributeController setFillColor:](self, "setFillColor:", v122);
        goto LABEL_150;
      case 765103:
        if (-[AKAttributeController brushStyle](self, "brushStyle"))
          -[AKAttributeController setBrushStyle:](self, "setBrushStyle:", 0);
        -[AKAttributeController setStrokeIsDashed:](self, "setStrokeIsDashed:", -[AKAttributeController strokeIsDashed](self, "strokeIsDashed") ^ 1);
        break;
      case 765104:
        if (-[AKAttributeController strokeIsDashed](self, "strokeIsDashed"))
          -[AKAttributeController setStrokeIsDashed:](self, "setStrokeIsDashed:", 0);
        -[AKAttributeController setBrushStyle:](self, "setBrushStyle:", -[AKAttributeController brushStyle](self, "brushStyle") == 0);
        break;
      case 765105:
        -[AKAttributeController font](self, "font");
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "convertFont:", v124);
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        -[AKAttributeController setFont:](self, "setFont:", v125);

        -[AKAttributeController font](self, "font");
        v126 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v126)
        {
          objc_msgSend((id)objc_opt_class(), "defaultFont");
          v127 = (void *)objc_claimAutoreleasedReturnValue();
          -[AKAttributeController setFont:](self, "setFont:", v127);

        }
        -[AKAttributeController textAttributes](self, "textAttributes");
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        v129 = (void *)objc_msgSend(v128, "mutableCopy");

        v130 = *MEMORY[0x24BDF65F8];
        objc_msgSend(v129, "objectForKeyedSubscript:", *MEMORY[0x24BDF65F8]);
        v131 = self;
        v132 = (void *)objc_claimAutoreleasedReturnValue();

        if (v132)
        {
          objc_msgSend(v129, "objectForKeyedSubscript:", v130);
          v133 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "convertFont:", v133);
          v134 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          -[AKAttributeController font](v131, "font");
          v134 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v129, "setObject:forKeyedSubscript:", v134, v130);

        v140 = (void *)objc_msgSend(v129, "copy");
        -[AKAttributeController setTextAttributes:](v131, "setTextAttributes:", v140);

        self = v131;
        break;
      case 765106:
        -[AKAttributeController textAttributes](self, "textAttributes");
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "convertTextAttributes:", v135);
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        -[AKAttributeController setTextAttributes:](self, "setTextAttributes:", v136);

        -[AKAttributeController textAttributes](self, "textAttributes");
        v137 = (void *)objc_claimAutoreleasedReturnValue();

        if (v137)
          break;
        objc_msgSend((id)objc_opt_class(), "defaultTextAttributes");
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        -[AKAttributeController setTextAttributes:](self, "setTextAttributes:", v122);
        goto LABEL_150;
      case 765107:
        v138 = self;
        v139 = 0;
        goto LABEL_155;
      case 765108:
        v138 = self;
        v139 = 1;
        goto LABEL_155;
      case 765109:
        v138 = self;
        v139 = 2;
        goto LABEL_155;
      case 765110:
        v138 = self;
        v139 = 3;
LABEL_155:
        -[AKAttributeController setArrowHeadStyle:](v138, "setArrowHeadStyle:", v139);
        break;
      default:
        if ((unint64_t)(v7 - 765200) >= 7)
        {
          if (v7 == 765300)
          {
            objc_msgSend(v6, "ink");
            v122 = (void *)objc_claimAutoreleasedReturnValue();
            -[AKAttributeController setInk:](self, "setInk:", v122);
LABEL_150:

          }
        }
        else
        {
          -[AKAttributeController setHighlightStyle:](self, "setHighlightStyle:", objc_msgSend(v6, "tag"));
        }
        break;
    }
  }
  v173 = 0u;
  v174 = 0u;
  v171 = 0u;
  v172 = 0u;
  obj = v10;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v171, v179, 16);
  v147 = v6;
  v150 = self;
  v151 = v8;
  if (v12)
  {
    v13 = v12;
    v14 = 1;
    if (v153 == 765206)
      v14 = 2;
    v15 = *(_QWORD *)v172;
    v146 = *MEMORY[0x24BDF6600];
    v16 = 3;
    if (v153 != 765205)
      v16 = v14;
    v152 = v16;
    v144 = *MEMORY[0x24BDF65F8];
    v145 = *MEMORY[0x24BDF6620];
    v17 = v153 - 765001;
    v18 = v153 - 765100;
    v154 = *(_QWORD *)v172;
    while (1)
    {
      v19 = 0;
      while (2)
      {
        if (*(_QWORD *)v172 != v15)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v171 + 1) + 8 * v19);
        objc_msgSend(v8, "currentPageController");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v22 = objc_msgSend(v20, "pathIsPrestroked");
        else
          v22 = 0;
        if (v17 <= 0x31 && ((1 << v17) & 0x2000000007FFFLL) != 0)
        {
          if ((v22 & 1) == 0 && (objc_opt_respondsToSelector() & 1) != 0)
          {
            v23 = 1.0;
            if (v153 == 765050)
            {
              v24 = 1.0;
            }
            else
            {
              v24 = (double)(objc_msgSend(v6, "tag") - 765000);
              if (v153 != 765001)
              {
                objc_msgSend(v21, "modelBaseScaleFactor");
                v23 = v36;
              }
            }
            objc_msgSend(v20, "setStrokeWidth:", v24 * v23);
            objc_msgSend(v20, "strokeColor");
            v37 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v37)
            {
              -[AKAttributeController strokeColor](self, "strokeColor");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "setStrokeColor:", v38);

            }
            v15 = v154;
            if (objc_msgSend(v20, "conformsToAKTextAnnotationProtocol"))
              +[AKTextAnnotationAttributeHelper adjustBoundsOfAnnotation:toFitOptionalText:onPageController:](AKTextAnnotationAttributeHelper, "adjustBoundsOfAnnotation:toFitOptionalText:onPageController:", v20, 0, v21);
          }
          goto LABEL_73;
        }
        switch(v18)
        {
          case 0:
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v20, "setHasShadow:", -[AKAttributeController hasShadow](self, "hasShadow"));
            goto LABEL_73;
          case 1:
            if ((objc_opt_respondsToSelector() & 1) == 0)
              goto LABEL_73;
            objc_msgSend(v20, "strokeColor");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "color");
            v148 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "setStrokeColor:");
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              objc_msgSend(v20, "strokeWidth");
              if (v40 == 0.0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  -[AKAttributeController strokeWidth](self, "strokeWidth");
                  objc_msgSend(v20, "setStrokeWidth:");
                }
              }
            }
            if (objc_msgSend(v20, "conformsToAKFilledAnnotationProtocol"))
            {
              objc_msgSend(v20, "fillColor");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              v42 = v41;
              if (v41 && CGColorGetAlpha((CGColorRef)objc_msgSend(objc_retainAutorelease(v41), "CGColor")) != 0.0)
                objc_msgSend(v20, "setFillColor:", v148);

              v15 = v154;
            }
            if (!objc_msgSend(v20, "conformsToAKTextAnnotationProtocol"))
              goto LABEL_113;
            v43 = v20;
            +[AKTextAnnotationAttributeHelper adjustBoundsOfAnnotation:toFitOptionalText:onPageController:](AKTextAnnotationAttributeHelper, "adjustBoundsOfAnnotation:toFitOptionalText:onPageController:", v43, 0, v21);
            if (objc_msgSend(v43, "conformsToAKFilledAnnotationProtocol"))
            {
              v142 = v39;
              objc_msgSend(v43, "annotationText");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "strokeColor");
              v45 = (id)objc_claimAutoreleasedReturnValue();
              v46 = v45;
              v143 = v44;
              if ((objc_opt_respondsToSelector() & 1) != 0)
              {
                objc_msgSend(v43, "fillColor");
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                v46 = v45;
                if (v47)
                {
                  v46 = v45;
                  if (objc_msgSend(v45, "akIsEqualToColor:", v47))
                  {
                    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
                    v48 = (void *)objc_claimAutoreleasedReturnValue();
                    v49 = objc_msgSend(v45, "akIsEqualToColor:", v48);

                    if (v49)
                      objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
                    else
                      objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
                    v46 = (void *)objc_claimAutoreleasedReturnValue();

                    v44 = v143;
                  }
                }

              }
              if (v44 && objc_msgSend(v44, "length"))
              {
                v85 = (void *)objc_msgSend(v44, "mutableCopy");
                v177 = v146;
                v178 = v46;
                objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v178, &v177, 1);
                v86 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v85, "addAttributes:range:", v86, 0, objc_msgSend(v143, "length"));

                v87 = +[AKTextAnnotationAttributeHelper newTextStorageOriginalFontSavvyWithAttributedString:](AKTextAnnotationAttributeHelper, "newTextStorageOriginalFontSavvyWithAttributedString:", v85);
                objc_msgSend(v43, "setAnnotationText:", v87);

              }
              objc_msgSend(v43, "typingAttributes");
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              v89 = (void *)objc_msgSend(v88, "mutableCopy");

              objc_msgSend(v89, "setObject:forKeyedSubscript:", v46, v146);
              objc_msgSend(v43, "setTypingAttributes:", v89);

              v6 = v147;
              v8 = v151;
            }
            else
            {
              if ((objc_msgSend(v43, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
                goto LABEL_112;
              objc_msgSend(v43, "annotationText");
              v142 = v39;
              v143 = (void *)objc_claimAutoreleasedReturnValue();
              if (v143 && objc_msgSend(v143, "length"))
              {
                v77 = (void *)objc_msgSend(v143, "mutableCopy");
                objc_msgSend(v143, "attributesAtIndex:effectiveRange:", 0, 0);
                v141 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v141, "objectForKeyedSubscript:", v146);
                v78 = (void *)objc_claimAutoreleasedReturnValue();
                v79 = v78;
                if (!v78 || objc_msgSend(v78, "akIsEqualToColor:", v39))
                {
                  objc_msgSend(v43, "strokeColor");
                  v80 = (void *)objc_claimAutoreleasedReturnValue();
                  v175 = v146;
                  v176 = v80;
                  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v176, &v175, 1);
                  v81 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v77, "addAttributes:range:", v81, 0, objc_msgSend(v143, "length"));

                  v82 = +[AKTextAnnotationAttributeHelper newTextStorageOriginalFontSavvyWithAttributedString:](AKTextAnnotationAttributeHelper, "newTextStorageOriginalFontSavvyWithAttributedString:", v77);
                  objc_msgSend(v43, "setAnnotationText:", v82);

                  v8 = v151;
                }

                v6 = v147;
              }
              objc_msgSend(v43, "typingAttributes");
              v83 = (void *)objc_claimAutoreleasedReturnValue();
              v45 = (id)objc_msgSend(v83, "mutableCopy");

              objc_msgSend(v6, "color");
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "setObject:forKeyedSubscript:", v84, v146);

              objc_msgSend(v43, "setTypingAttributes:", v45);
            }

            v15 = v154;
            v39 = v142;
LABEL_112:

LABEL_113:
LABEL_73:

            ++v19;
            v18 = v153 - 765100;
            if (v13 != v19)
              continue;
            v90 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v171, v179, 16);
            v13 = v90;
            if (!v90)
              goto LABEL_115;
            break;
          case 2:
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              objc_msgSend(v6, "color");
              v27 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "setFillColor:", v27);
              goto LABEL_71;
            }
            goto LABEL_73;
          case 3:
            if ((v22 & 1) == 0 && (objc_opt_respondsToSelector() & 1) != 0)
            {
              if ((objc_opt_respondsToSelector() & 1) != 0)
                objc_msgSend(v20, "setBrushStyle:", 0);
              objc_msgSend(v20, "setDashed:", -[AKAttributeController strokeIsDashed](self, "strokeIsDashed"));
            }
            goto LABEL_73;
          case 4:
            if ((v22 & 1) == 0 && (objc_opt_respondsToSelector() & 1) != 0)
            {
              if ((objc_opt_respondsToSelector() & 1) != 0)
                objc_msgSend(v20, "setDashed:", 0);
              objc_msgSend(v20, "setBrushStyle:", -[AKAttributeController brushStyle](self, "brushStyle"));
            }
            goto LABEL_73;
          case 5:
            if (objc_msgSend(v20, "conformsToAKTextAnnotationProtocol"))
            {
              v50 = v20;
              v51 = v6;
              objc_msgSend(v50, "annotationText");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              v53 = (void *)objc_msgSend(v52, "mutableCopy");

              objc_msgSend(v53, "removeAttribute:range:", v145, 0, objc_msgSend(v53, "length"));
              objc_msgSend(v50, "annotationText");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              v168[0] = MEMORY[0x24BDAC760];
              v168[1] = 3221225472;
              v168[2] = sub_228FEE26C;
              v168[3] = &unk_24F1A7540;
              v149 = v51;
              v169 = v149;
              v55 = v53;
              v170 = v55;
              +[AKTextAnnotationAttributeHelper enumerateFontAttributesOfAttributedString:usingBlock:](AKTextAnnotationAttributeHelper, "enumerateFontAttributesOfAttributedString:usingBlock:", v54, v168);

              v56 = +[AKTextAnnotationAttributeHelper newTextStorageOriginalFontSavvyWithAttributedString:](AKTextAnnotationAttributeHelper, "newTextStorageOriginalFontSavvyWithAttributedString:", v55);
              objc_msgSend(v50, "setAnnotationText:", v56);

              objc_msgSend(v50, "typingAttributes");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              v58 = (void *)objc_msgSend(v57, "mutableCopy");

              objc_msgSend(v50, "typingAttributes");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v59, "objectForKeyedSubscript:", v144);
              v60 = (void *)objc_claimAutoreleasedReturnValue();

              if (v60)
              {
                objc_msgSend(v58, "objectForKeyedSubscript:", v144);
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v149, "convertFont:", v61);
                v62 = (void *)objc_claimAutoreleasedReturnValue();

                self = v150;
              }
              else
              {
                self = v150;
                -[AKAttributeController font](v150, "font");
                v62 = (void *)objc_claimAutoreleasedReturnValue();
              }
              objc_msgSend(v58, "setObject:forKeyedSubscript:", v62, v144);

              objc_msgSend(v50, "setTypingAttributes:", v58);
              +[AKTextAnnotationAttributeHelper adjustBoundsOfAnnotation:toFitOptionalText:onPageController:](AKTextAnnotationAttributeHelper, "adjustBoundsOfAnnotation:toFitOptionalText:onPageController:", v50, 0, v21);

              v6 = v147;
              goto LABEL_95;
            }
            goto LABEL_73;
          case 6:
            if (objc_msgSend(v20, "conformsToAKTextAnnotationProtocol"))
            {
              v63 = v20;
              v64 = v6;
              objc_msgSend(v63, "annotationText");
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              v66 = (void *)objc_msgSend(v65, "mutableCopy");

              v67 = objc_msgSend(v66, "length");
              v165[0] = MEMORY[0x24BDAC760];
              v165[1] = 3221225472;
              v165[2] = sub_228FEE2D8;
              v165[3] = &unk_24F1A7840;
              v68 = v64;
              v166 = v68;
              v69 = v66;
              v167 = v69;
              objc_msgSend(v69, "enumerateAttributesInRange:options:usingBlock:", 0, v67, 0, v165);
              v70 = +[AKTextAnnotationAttributeHelper newTextStorageOriginalFontSavvyWithAttributedString:](AKTextAnnotationAttributeHelper, "newTextStorageOriginalFontSavvyWithAttributedString:", v69);
              objc_msgSend(v63, "setAnnotationText:", v70);

              objc_msgSend(v63, "typingAttributes");
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v68, "convertTextAttributes:", v71);
              v72 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v63, "setTypingAttributes:", v72);
              objc_msgSend(v72, "objectForKeyedSubscript:", v146);
              v73 = objc_claimAutoreleasedReturnValue();
              if (v73)
              {
                v74 = (void *)v73;
                v75 = objc_opt_respondsToSelector();

                if ((v75 & 1) != 0)
                {
                  objc_msgSend(v72, "objectForKeyedSubscript:", v146);
                  v76 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v63, "setStrokeColor:", v76);

                }
              }
              +[AKTextAnnotationAttributeHelper adjustBoundsOfAnnotation:toFitOptionalText:onPageController:](AKTextAnnotationAttributeHelper, "adjustBoundsOfAnnotation:toFitOptionalText:onPageController:", v63, 0, v21);

              v6 = v147;
              self = v150;
LABEL_95:
              v8 = v151;
              goto LABEL_72;
            }
            goto LABEL_73;
          case 7:
          case 8:
          case 9:
          case 10:
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v20, "setArrowHeadStyle:", -[AKAttributeController arrowHeadStyle](self, "arrowHeadStyle"));
            goto LABEL_73;
          default:
            if ((unint64_t)(v153 - 765200) >= 7)
              goto LABEL_73;
            objc_opt_self();
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            isKindOfClass = objc_opt_isKindOfClass();

            if ((isKindOfClass & 1) != 0)
            {
              v27 = v20;
              objc_msgSend(v27, "setStyle:", v152);
              +[AKHighlightAppearanceHelper colorForHighlightAttributeWithTag:](AKHighlightAppearanceHelper, "colorForHighlightAttributeWithTag:", v153);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "setColor:", v28);

              if (objc_msgSend(v27, "conformsToAKParentAnnotationProtocol"))
              {
                objc_msgSend(v27, "childAnnotation");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_self();
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                v31 = objc_opt_isKindOfClass();

                if ((v31 & 1) != 0)
                {
                  +[AKHighlightAppearanceHelper colorForNoteOfHighlightAttributeTag:](AKHighlightAppearanceHelper, "colorForNoteOfHighlightAttributeTag:", v153);
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v29, "setFillColor:", v32);

                }
                self = v150;
                v8 = v151;
              }
            }
            else
            {
              objc_opt_self();
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = objc_opt_isKindOfClass();

              v15 = v154;
              if ((v34 & 1) == 0 || (unint64_t)(v153 - 765200) > 4)
                goto LABEL_73;
              v35 = v20;
              +[AKHighlightAppearanceHelper colorForNoteOfHighlightAttributeTag:](AKHighlightAppearanceHelper, "colorForNoteOfHighlightAttributeTag:", v153);
              v27 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "setFillColor:", v27);

            }
LABEL_71:

LABEL_72:
            v15 = v154;
            goto LABEL_73;
        }
        break;
      }
    }
  }
LABEL_115:

  objc_msgSend(v8, "textEditorController");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = objc_msgSend(v91, "isEditing");

  v93 = v153;
  if (v92)
  {
    objc_msgSend(v8, "textEditorController");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "annotation");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "textView");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "textStorage");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    if (v153 == 765106)
    {
      v111 = v6;
      v112 = objc_msgSend(v97, "length");
      v157[0] = MEMORY[0x24BDAC760];
      v157[1] = 3221225472;
      v157[2] = sub_228FEE3E8;
      v157[3] = &unk_24F1A7840;
      v158 = v111;
      v159 = v97;
      v113 = v111;
      self = v150;
      objc_msgSend(v159, "enumerateAttributesInRange:options:usingBlock:", 0, v112, 0, v157);
      objc_msgSend(v96, "typingAttributes");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v113, "convertTextAttributes:", v114);
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "setTypingAttributes:", v115);

      objc_msgSend(v94, "updateForTextAttributeChange");
      v103 = v158;
    }
    else
    {
      if (v153 != 765105)
      {
LABEL_124:

        v8 = v151;
        goto LABEL_125;
      }
      v98 = v6;
      v156 = v95;
      objc_msgSend(v95, "originalModelBaseScaleFactor");
      v100 = v99;
      v101 = (void *)objc_msgSend(v97, "mutableCopy");
      v160[0] = MEMORY[0x24BDAC760];
      v160[1] = 3221225472;
      v160[2] = sub_228FEE338;
      v160[3] = &unk_24F1A7868;
      v163 = 1.0 / v100;
      v102 = v98;
      v161 = v102;
      v164 = v100;
      v103 = v101;
      v162 = v103;
      +[AKTextAnnotationAttributeHelper enumerateFontAttributesOfAttributedString:usingBlock:](AKTextAnnotationAttributeHelper, "enumerateFontAttributesOfAttributedString:usingBlock:", v97, v160);
      objc_msgSend(v97, "setAttributedString:", v103);
      objc_msgSend(v96, "typingAttributes");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      +[AKTextAnnotationAttributeHelper typingAttributes:byApplyingScaleFactor:](AKTextAnnotationAttributeHelper, "typingAttributes:byApplyingScaleFactor:", v104, 1.0 / v100);
      v105 = (void *)objc_claimAutoreleasedReturnValue();

      v106 = (void *)objc_msgSend(v105, "mutableCopy");
      v107 = *MEMORY[0x24BDF65F8];
      objc_msgSend(v106, "objectForKeyedSubscript:", *MEMORY[0x24BDF65F8]);
      v108 = (void *)objc_claimAutoreleasedReturnValue();

      if (v108)
      {
        objc_msgSend(v106, "objectForKeyedSubscript:", v107);
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v102, "convertFont:", v109);
        v110 = (void *)objc_claimAutoreleasedReturnValue();

        self = v150;
      }
      else
      {
        self = v150;
        -[AKAttributeController font](v150, "font");
        v110 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v106, "setObject:forKeyedSubscript:", v110, v107);

      +[AKTextAnnotationAttributeHelper typingAttributes:byApplyingScaleFactor:](AKTextAnnotationAttributeHelper, "typingAttributes:byApplyingScaleFactor:", v106, v100);
      v116 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v96, "setTypingAttributes:", v116);
      objc_msgSend(v94, "updateForTextAttributeChange");

      v6 = v147;
      v95 = v156;
    }

    v93 = v153;
    goto LABEL_124;
  }
LABEL_125:
  if ((unint64_t)(v93 - 765105) <= 1)
  {
    objc_msgSend(v8, "toolbarViewController");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "revalidateItems");

  }
  if ((v93 & 0xFFFFFFFFFFFFFFFELL) == 0xBACAC || (unint64_t)(v93 - 765001) <= 0xE)
  {
    objc_msgSend(v8, "toolController");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v118, "toolMode") == 1)
    {

LABEL_132:
      objc_msgSend(v8, "legacyDoodleController");
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v121, "updateStrokeAttributes");

      goto LABEL_133;
    }
    objc_msgSend(v8, "toolController");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    v120 = objc_msgSend(v119, "toolMode");

    if (v120 == 2)
      goto LABEL_132;
  }
LABEL_133:
  -[AKAttributeController _persistCurrentAttributes](self, "_persistCurrentAttributes");

}

- (void)_syncAttributesFromSelectedAnnotationsToUI
{
  void *v3;
  id v4;

  -[AKAttributeController controller](self, "controller");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toolbarViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "revalidateItems");

  -[AKAttributeController syncFillColorOnSelectionToUI](self, "syncFillColorOnSelectionToUI");
  -[AKAttributeController syncStrokeColorOnSelectionToUI](self, "syncStrokeColorOnSelectionToUI");

}

- (void)syncFillColorOnSelectionToUI
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  -[AKAttributeController controller](self, "controller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAttributeController modelControllerToObserveForSelections](self, "modelControllerToObserveForSelections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectedAnnotations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (!v7)
  {

LABEL_21:
    if (objc_msgSend(v6, "count", (_QWORD)v18))
      objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    else
      -[AKAttributeController fillColor](self, "fillColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_25;
  }
  v8 = v7;
  v9 = 0;
  v10 = *(_QWORD *)v19;
  do
  {
    v11 = 0;
    do
    {
      if (*(_QWORD *)v19 != v10)
        objc_enumerationMutation(v6);
      v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v11);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v12, "performSelector:", sel_fillColor, (_QWORD)v18);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v9 || !v13)
        {
          if (v9 && v13 && (objc_msgSend(v9, "akIsEqualToColor:", v13) & 1) == 0)
          {
            objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
            v16 = objc_claimAutoreleasedReturnValue();

            v9 = (void *)v16;
            goto LABEL_18;
          }
        }
        else
        {
          v14 = v13;
          v9 = v14;
        }
      }
      else
      {
        v14 = 0;
      }

      ++v11;
    }
    while (v8 != v11);
    v15 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    v8 = v15;
  }
  while (v15);
LABEL_18:

  if (!v9)
    goto LABEL_21;
LABEL_25:
  objc_msgSend(v3, "toolbarViewController", (_QWORD)v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFillColorUIDisplayToColor:", v9);

}

- (void)syncStrokeColorOnSelectionToUI
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  -[AKAttributeController controller](self, "controller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAttributeController modelControllerToObserveForSelections](self, "modelControllerToObserveForSelections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectedAnnotations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (!v7)
  {

LABEL_21:
    if (objc_msgSend(v6, "count", (_QWORD)v18))
      objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    else
      -[AKAttributeController strokeColor](self, "strokeColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_25;
  }
  v8 = v7;
  v9 = 0;
  v10 = *(_QWORD *)v19;
  do
  {
    v11 = 0;
    do
    {
      if (*(_QWORD *)v19 != v10)
        objc_enumerationMutation(v6);
      v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v11);
      if (objc_msgSend(v12, "conformsToAKStrokedAnnotationProtocol", (_QWORD)v18))
      {
        objc_msgSend(v12, "strokeColor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v9 || !v13)
        {
          if (v9 && v13 && (objc_msgSend(v9, "akIsEqualToColor:", v13) & 1) == 0)
          {
            objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
            v16 = objc_claimAutoreleasedReturnValue();

            v9 = (void *)v16;
            goto LABEL_18;
          }
        }
        else
        {
          v14 = v13;
          v9 = v14;
        }
      }
      else
      {
        v14 = 0;
      }

      ++v11;
    }
    while (v8 != v11);
    v15 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    v8 = v15;
  }
  while (v15);
LABEL_18:

  if (!v9)
    goto LABEL_21;
LABEL_25:
  objc_msgSend(v3, "toolbarViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setStrokeColorUIDisplayToColor:", v9);

}

- (BOOL)_isEnabledForSender:(id)a3 segment:(int64_t)a4 withSelectedAnnotations:(id)a5
{
  id v8;
  id v9;
  void *v10;
  _BOOL4 v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  void *v28;
  void *v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  char isKindOfClass;
  void *v37;
  int v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t m;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  char v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char **v68;
  uint64_t v69;
  char **v70;
  void *v71;
  void *v72;
  uint64_t v73;
  char v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char **v78;
  uint64_t v79;
  char **v80;
  void *v81;
  BOOL v83;
  id v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
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
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  _BYTE v125[128];
  _BYTE v126[128];
  _BYTE v127[128];
  _BYTE v128[128];
  _BYTE v129[128];
  _BYTE v130[128];
  _BYTE v131[128];
  _BYTE v132[128];
  _BYTE v133[128];
  _BYTE v134[128];
  uint64_t v135;

  v135 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = v9;
  if (v9)
    v11 = objc_msgSend(v9, "count") != 0;
  else
    v11 = 0;
  v12 = objc_msgSend(v8, "tag");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v12 = objc_msgSend(v8, "tagForSegment:", a4);
  if (v12 <= 765099)
  {
    if ((unint64_t)(v12 - 765001) > 0x31 || ((1 << (v12 - 73)) & 0x2000000007FFFLL) == 0)
      goto LABEL_137;
    v115 = 0u;
    v116 = 0u;
    v113 = 0u;
    v114 = 0u;
    v13 = v10;
    v18 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v113, v132, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v114;
      while (2)
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v114 != v20)
            objc_enumerationMutation(v13);
          v22 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            if ((objc_opt_respondsToSelector() & 1) != 0)
              v23 = objc_msgSend(v22, "pathIsPrestroked") ^ 1;
            else
              LOBYTE(v23) = 1;

            goto LABEL_142;
          }
        }
        v19 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v113, v132, 16);
        if (v19)
          continue;
        break;
      }
    }
    goto LABEL_136;
  }
  if (v12 > 765199)
  {
    if ((unint64_t)(v12 - 765200) >= 5)
    {
      if ((unint64_t)(v12 - 765205) >= 2)
      {
        if (v12 == 765300)
        {
          -[AKAttributeController controller](self, "controller");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "toolController");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = objc_msgSend(v45, "toolMode");

          if (v46 == 4)
          {
LABEL_104:
            LOBYTE(v23) = 1;
            goto LABEL_142;
          }
        }
LABEL_137:
        LOBYTE(v23) = !v11;
        goto LABEL_142;
      }
      v87 = 0u;
      v88 = 0u;
      v85 = 0u;
      v86 = 0u;
      v13 = v10;
      v31 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v85, v125, 16);
      if (v31)
      {
        v32 = v31;
        v33 = *(_QWORD *)v86;
        while (2)
        {
          for (j = 0; j != v32; ++j)
          {
            if (*(_QWORD *)v86 != v33)
              objc_enumerationMutation(v13);
            objc_opt_self();
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            isKindOfClass = objc_opt_isKindOfClass();

            if ((isKindOfClass & 1) != 0)
            {
LABEL_103:

              goto LABEL_104;
            }
          }
          v32 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v85, v125, 16);
          if (v32)
            continue;
          break;
        }
      }
    }
    else
    {
      v91 = 0u;
      v92 = 0u;
      v89 = 0u;
      v90 = 0u;
      v13 = v10;
      v24 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v89, v126, 16);
      if (v24)
      {
        v25 = v24;
        v84 = v8;
        v26 = *(_QWORD *)v90;
        while (2)
        {
          for (k = 0; k != v25; ++k)
          {
            if (*(_QWORD *)v90 != v26)
              objc_enumerationMutation(v13);
            objc_opt_self();
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {

LABEL_141:
              LOBYTE(v23) = 1;
              v8 = v84;
              goto LABEL_142;
            }
            objc_opt_self();
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_opt_isKindOfClass();

            if ((v30 & 1) != 0)
              goto LABEL_141;
          }
          v25 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v89, v126, 16);
          if (v25)
            continue;
          break;
        }
      }
    }
LABEL_136:

    goto LABEL_137;
  }
  switch(v12)
  {
    case 765100:
      v103 = 0u;
      v104 = 0u;
      v101 = 0u;
      v102 = 0u;
      v13 = v10;
      v47 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v101, v129, 16);
      if (!v47)
        goto LABEL_136;
      v48 = v47;
      v49 = *(_QWORD *)v102;
LABEL_71:
      v50 = 0;
      while (1)
      {
        if (*(_QWORD *)v102 != v49)
          objc_enumerationMutation(v13);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          goto LABEL_103;
        if (v48 == ++v50)
        {
          v48 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v101, v129, 16);
          if (v48)
            goto LABEL_71;
          goto LABEL_136;
        }
      }
    case 765101:
      v119 = 0u;
      v120 = 0u;
      v117 = 0u;
      v118 = 0u;
      v13 = v10;
      v51 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v117, v133, 16);
      if (!v51)
        goto LABEL_136;
      v52 = v51;
      v53 = *(_QWORD *)v118;
LABEL_80:
      v54 = 0;
      while (1)
      {
        if (*(_QWORD *)v118 != v53)
          objc_enumerationMutation(v13);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          goto LABEL_103;
        if (v52 == ++v54)
        {
          v52 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v117, v133, 16);
          if (v52)
            goto LABEL_80;
          goto LABEL_136;
        }
      }
    case 765102:
      v123 = 0u;
      v124 = 0u;
      v121 = 0u;
      v122 = 0u;
      v13 = v10;
      v55 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v121, v134, 16);
      if (!v55)
        goto LABEL_136;
      v56 = v55;
      v57 = *(_QWORD *)v122;
LABEL_89:
      v58 = 0;
      while (1)
      {
        if (*(_QWORD *)v122 != v57)
          objc_enumerationMutation(v13);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          goto LABEL_103;
        if (v56 == ++v58)
        {
          v56 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v121, v134, 16);
          if (v56)
            goto LABEL_89;
          goto LABEL_136;
        }
      }
    case 765103:
      -[AKAttributeController controller](self, "controller");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "toolController");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v59, "toolMode") == 2)
      {

        if (!v11)
          goto LABEL_138;
      }
      else
      {
        objc_msgSend(v13, "toolController");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = objc_msgSend(v61, "toolMode");

        v63 = v62 != 4 || v11;
        if ((v63 & 1) == 0)
          goto LABEL_138;
      }
      v111 = 0u;
      v112 = 0u;
      v109 = 0u;
      v110 = 0u;
      v64 = v10;
      v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v109, v131, 16);
      if (!v65)
        goto LABEL_135;
      v66 = v65;
      v83 = v11;
      v84 = v8;
      v67 = *(_QWORD *)v110;
      v68 = &selRef_makeObjectsPerformSelector_;
LABEL_111:
      v69 = 0;
      v70 = v68;
      while (1)
      {
        if (*(_QWORD *)v110 != v67)
          objc_enumerationMutation(v64);
        v71 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * v69);
        if ((objc_opt_respondsToSelector() & 1) != 0
          && ((objc_opt_respondsToSelector() & 1) == 0 || !objc_msgSend(v71, "pathIsPrestroked")))
        {
          goto LABEL_140;
        }
        if (v66 == ++v69)
        {
          v66 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v109, v131, 16);
          v68 = v70;
          if (!v66)
            goto LABEL_134;
          goto LABEL_111;
        }
      }
    case 765104:
      -[AKAttributeController controller](self, "controller");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "toolController");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v60, "toolMode") == 2)
      {

        if (!v11)
          goto LABEL_138;
LABEL_124:
        v107 = 0u;
        v108 = 0u;
        v105 = 0u;
        v106 = 0u;
        v64 = v10;
        v75 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v105, v130, 16);
        if (!v75)
          goto LABEL_135;
        v76 = v75;
        v83 = v11;
        v84 = v8;
        v77 = *(_QWORD *)v106;
        v78 = &selRef_makeObjectsPerformSelector_;
        while (1)
        {
          v79 = 0;
          v80 = v78;
          do
          {
            if (*(_QWORD *)v106 != v77)
              objc_enumerationMutation(v64);
            v81 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * v79);
            if ((objc_opt_respondsToSelector() & 1) != 0
              && ((objc_opt_respondsToSelector() & 1) == 0 || !objc_msgSend(v81, "pathIsPrestroked")))
            {
LABEL_140:

              goto LABEL_141;
            }
            ++v79;
          }
          while (v76 != v79);
          v76 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v105, v130, 16);
          v78 = v80;
          if (!v76)
          {
LABEL_134:
            v8 = v84;
            LOBYTE(v11) = v83;
            goto LABEL_135;
          }
        }
      }
      objc_msgSend(v13, "toolController");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = objc_msgSend(v72, "toolMode");

      v74 = v73 != 4 || v11;
      if ((v74 & 1) != 0)
        goto LABEL_124;
LABEL_138:

LABEL_139:
      LOBYTE(v23) = 0;
LABEL_142:

      return v23;
    case 765105:
    case 765106:
      -[AKAttributeController controller](self, "controller");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "textEditorController");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "isEditing");

      if (v38)
        goto LABEL_103;
      v99 = 0u;
      v100 = 0u;
      v97 = 0u;
      v98 = 0u;
      v39 = v10;
      v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v97, v128, 16);
      if (!v40)
        goto LABEL_135;
      v41 = v40;
      v42 = *(_QWORD *)v98;
      while (2)
      {
        for (m = 0; m != v41; ++m)
        {
          if (*(_QWORD *)v98 != v42)
            objc_enumerationMutation(v39);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v97 + 1) + 8 * m), "conformsToAKTextAnnotationProtocol") & 1) != 0)
          {

            goto LABEL_103;
          }
        }
        v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v97, v128, 16);
        if (v41)
          continue;
        break;
      }
LABEL_135:

      goto LABEL_136;
    case 765107:
    case 765108:
    case 765109:
    case 765110:
      if (!v11)
        goto LABEL_139;
      v95 = 0u;
      v96 = 0u;
      v93 = 0u;
      v94 = 0u;
      v13 = v10;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v93, v127, 16);
      if (!v14)
        goto LABEL_136;
      v15 = v14;
      v16 = *(_QWORD *)v94;
LABEL_12:
      v17 = 0;
      while (1)
      {
        if (*(_QWORD *)v94 != v16)
          objc_enumerationMutation(v13);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          goto LABEL_103;
        if (v15 == ++v17)
        {
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v93, v127, 16);
          if (v15)
            goto LABEL_12;
          goto LABEL_136;
        }
      }
    default:
      goto LABEL_137;
  }
}

- (void)_updateStateOnSender:(id)a3 segment:(int64_t)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[AKAttributeController modelControllerToObserveForSelections](self, "modelControllerToObserveForSelections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectedAnnotations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[AKAttributeController _updateStateOnSender:segment:fromSelectedAnnotations:](self, "_updateStateOnSender:segment:fromSelectedAnnotations:", v8, a4, v7))-[AKAttributeController _updateStateOnSenderFromSelf:segment:](self, "_updateStateOnSenderFromSelf:segment:", v8, a4);
}

- (void)_allAnnotations:(id)a3 all:(BOOL *)a4 atLeastOneShare:(BOOL *)a5 attributeFromTag:(int64_t)a6
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        switch(a6)
        {
          case 765100:
            if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v14, "hasShadow") & 1) != 0)
              goto LABEL_27;
            goto LABEL_28;
          case 765103:
            if ((objc_opt_respondsToSelector() & 1) == 0 || (objc_msgSend(v14, "isDashed") & 1) == 0)
              goto LABEL_28;
            goto LABEL_27;
          case 765104:
            if ((objc_opt_respondsToSelector() & 1) == 0 || !objc_msgSend(v14, "brushStyle"))
              goto LABEL_28;
            goto LABEL_27;
          case 765107:
            if ((objc_opt_respondsToSelector() & 1) != 0 && !objc_msgSend(v14, "arrowHeadStyle"))
              goto LABEL_27;
            goto LABEL_28;
          case 765108:
            if ((objc_opt_respondsToSelector() & 1) == 0 || objc_msgSend(v14, "arrowHeadStyle") != 1)
              goto LABEL_28;
            goto LABEL_27;
          case 765109:
            if ((objc_opt_respondsToSelector() & 1) == 0 || objc_msgSend(v14, "arrowHeadStyle") != 2)
              goto LABEL_28;
            goto LABEL_27;
          case 765110:
            if ((objc_opt_respondsToSelector() & 1) == 0 || objc_msgSend(v14, "arrowHeadStyle") != 3)
              goto LABEL_28;
LABEL_27:
            *a5 = 1;
            break;
          default:
LABEL_28:
            *a4 = 0;
            break;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

}

- (BOOL)_updateStateOnSender:(id)a3 segment:(int64_t)a4 fromSelectedAnnotations:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  double v22;
  double v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  unsigned __int8 v28;
  uint64_t v29;
  char v30;
  uint64_t i;
  void *v32;
  double v33;
  double v34;
  double v35;
  BOOL v36;
  void *v38;
  void *v39;
  id v40;
  __int16 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  v9 = v8;
  if (!v8 || !objc_msgSend(v8, "count"))
    goto LABEL_35;
  if (objc_msgSend(v7, "conformsToProtocol:", &unk_255A53A20))
  {
    v10 = v7;
    v11 = objc_msgSend(v10, "tag");
    v12 = v11 == 765105;
    if (v11 == 765105)
    {
      +[AKTextAnnotationAttributeHelper fontsOfAnnotations:](AKTextAnnotationAttributeHelper, "fontsOfAnnotations:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKAttributeController controller](self, "controller");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "textEditorController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[AKTextAnnotationAttributeHelper fontsOfEditor:](AKTextAnnotationAttributeHelper, "fontsOfEditor:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "count"))
      {
        objc_msgSend(v13, "setByAddingObjectsFromSet:", v16);
        v17 = objc_claimAutoreleasedReturnValue();

        v13 = (void *)v17;
      }
      objc_msgSend(v10, "syncFontsToUI:", v13);
LABEL_13:

      goto LABEL_14;
    }
    goto LABEL_14;
  }
  if (!objc_msgSend(v7, "conformsToProtocol:", &unk_255A3DA38))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (objc_msgSend(v7, "tag") > 765000 && objc_msgSend(v7, "tag") < 765016
       || objc_msgSend(v7, "tag") > 765106 && objc_msgSend(v7, "tag") < 765111))
    {
      v10 = v7;
      v20 = objc_msgSend(v10, "tag");
      if ((unint64_t)(v20 - 765001) >= 0xF)
      {
        if ((unint64_t)(v20 - 765107) >= 4)
        {
          v12 = 0;
        }
        else
        {
          v41 = 0;
          -[AKAttributeController _allAnnotations:all:atLeastOneShare:attributeFromTag:](self, "_allAnnotations:all:atLeastOneShare:attributeFromTag:", v9, (char *)&v41 + 1, &v41, objc_msgSend(v10, "tag"));
          objc_msgSend(v10, "setSelected:", v41);
          v12 = 1;
        }
      }
      else
      {
        v40 = v7;
        -[AKAttributeController controller](self, "controller");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "currentPageController");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "modelBaseScaleFactor");
        v23 = v22;

        v24 = objc_msgSend(v10, "tag");
        v42 = 0u;
        v43 = 0u;
        v44 = 0u;
        v45 = 0u;
        v39 = v9;
        v25 = v9;
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
        if (v26)
        {
          v27 = v26;
          v28 = 0;
          v29 = *(_QWORD *)v43;
          v30 = 1;
          do
          {
            for (i = 0; i != v27; ++i)
            {
              if (*(_QWORD *)v43 != v29)
                objc_enumerationMutation(v25);
              v32 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
              if ((objc_opt_respondsToSelector() & 1) != 0)
              {
                objc_msgSend(v32, "strokeWidth");
                v34 = v33;
                if (objc_msgSend(v10, "tag") == 765001)
                  v35 = 1.0;
                else
                  v35 = v23;
                v36 = vabdd_f64(v34 / v35, (double)(v24 - 765000)) < 0.0005;
                v28 |= v36;
                v30 &= v36;
              }
              else
              {
                v30 = 0;
              }
            }
            v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
          }
          while (v27);
        }
        else
        {
          v28 = 0;
          v30 = 1;
        }

        objc_msgSend(v10, "setSelected:", (v30 | v28) & 1);
        v12 = 1;
        v9 = v39;
        v7 = v40;
      }
      goto LABEL_14;
    }
LABEL_35:
    v12 = 0;
    goto LABEL_36;
  }
  v10 = v7;
  v18 = objc_msgSend(v10, "tag");
  v12 = v18 == 765106;
  if (v18 == 765106)
  {
    +[AKTextAnnotationAttributeHelper textAttributesOfAnnotations:](AKTextAnnotationAttributeHelper, "textAttributesOfAnnotations:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKAttributeController controller](self, "controller");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "textEditorController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[AKTextAnnotationAttributeHelper textAttributesOfEditor:](AKTextAnnotationAttributeHelper, "textAttributesOfEditor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "count"))
    {
      objc_msgSend(v13, "setByAddingObjectsFromSet:", v16);
      v19 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)v19;
    }
    objc_msgSend(v10, "syncTextAttributesToUI:", v13);
    goto LABEL_13;
  }
LABEL_14:

LABEL_36:
  return v12;
}

- (void)_updateStateOnSenderFromSelf:(id)a3 segment:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;

  v17 = a3;
  if (objc_msgSend(v17, "conformsToProtocol:", &unk_255A53A20))
  {
    v5 = v17;
    if (objc_msgSend(v5, "tag") == 765105)
    {
      v6 = (void *)MEMORY[0x24BDBCF20];
      -[AKAttributeController font](self, "font");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setWithObject:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      -[AKAttributeController controller](self, "controller");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "textEditorController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[AKTextAnnotationAttributeHelper fontsOfEditor:](AKTextAnnotationAttributeHelper, "fontsOfEditor:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "count"))
      {
        objc_msgSend(v8, "setByAddingObjectsFromSet:", v11);
        v12 = objc_claimAutoreleasedReturnValue();

        v8 = (void *)v12;
      }
      objc_msgSend(v5, "syncFontsToUI:", v8);
LABEL_11:

      goto LABEL_12;
    }
    goto LABEL_12;
  }
  if (objc_msgSend(v17, "conformsToProtocol:", &unk_255A3DA38))
  {
    v13 = v17;
    if (objc_msgSend(v13, "tag") == 765106)
    {
      v14 = (void *)MEMORY[0x24BDBCF20];
      -[AKAttributeController textAttributes](self, "textAttributes");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setWithObject:", v15);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      -[AKAttributeController controller](self, "controller");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "textEditorController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[AKTextAnnotationAttributeHelper textAttributesOfEditor:](AKTextAnnotationAttributeHelper, "textAttributesOfEditor:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "count"))
      {
        objc_msgSend(v8, "setByAddingObjectsFromSet:", v11);
        v16 = objc_claimAutoreleasedReturnValue();

        v8 = (void *)v16;
      }
      objc_msgSend(v13, "syncTextAttributesToUI:", v8);
      goto LABEL_11;
    }
LABEL_12:

  }
}

- (AKPageModelController)modelControllerToObserveForSelections
{
  return self->modelControllerToObserveForSelections;
}

- (UIColor)strokeColor
{
  return self->_strokeColor;
}

- (UIColor)fillColor
{
  return (UIColor *)objc_getProperty(self, a2, 32, 1);
}

- (void)setFillColor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (PKInk)ink
{
  return self->_ink;
}

- (double)strokeWidth
{
  return self->_strokeWidth;
}

- (void)setStrokeWidth:(double)a3
{
  self->_strokeWidth = a3;
}

- (BOOL)strokeIsDashed
{
  return self->_strokeIsDashed;
}

- (void)setStrokeIsDashed:(BOOL)a3
{
  self->_strokeIsDashed = a3;
}

- (BOOL)hasShadow
{
  return self->_hasShadow;
}

- (void)setHasShadow:(BOOL)a3
{
  self->_hasShadow = a3;
}

- (int64_t)brushStyle
{
  return self->_brushStyle;
}

- (void)setBrushStyle:(int64_t)a3
{
  self->_brushStyle = a3;
}

- (unint64_t)arrowHeadStyle
{
  return self->_arrowHeadStyle;
}

- (void)setArrowHeadStyle:(unint64_t)a3
{
  self->_arrowHeadStyle = a3;
}

- (UIFont)font
{
  return (UIFont *)objc_getProperty(self, a2, 72, 1);
}

- (void)setFont:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSDictionary)textAttributes
{
  return (NSDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setTextAttributes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (int64_t)highlightStyle
{
  return self->_highlightStyle;
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
  objc_storeStrong((id *)&self->_textAttributes, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_ink, 0);
  objc_storeStrong((id *)&self->_fillColor, 0);
  objc_storeStrong((id *)&self->_strokeColor, 0);
  objc_storeStrong((id *)&self->modelControllerToObserveForSelections, 0);
}

@end
