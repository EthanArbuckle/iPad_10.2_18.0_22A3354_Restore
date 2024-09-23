@implementation AKShapeDetectionController

- (AKShapeDetectionController)initWithController:(id)a3
{
  id v4;
  AKShapeDetectionController *v5;
  AKShapeDetectionController *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKShapeDetectionController;
  v5 = -[AKShapeDetectionController init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[AKShapeDetectionController setController:](v5, "setController:", v4);
    -[AKShapeDetectionController setVeryHighConfidenceLevel:](v6, "setVeryHighConfidenceLevel:", 0.7);
    -[AKShapeDetectionController setIsPreviousCandidateAnnotationUndecided:](v6, "setIsPreviousCandidateAnnotationUndecided:", 0);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v6, sel__shouldDismissNotification_, CFSTR("AKShapeDetectionController.shouldDismissCandidatePicker"), 0);

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)AKShapeDetectionController;
  -[AKShapeDetectionController dealloc](&v4, sel_dealloc);
}

- (CHRecognizer)shapeRecognizer
{
  CHRecognizer *shapeRecognizer;
  CHRecognizer *v4;
  CHRecognizer *v5;
  void *v6;
  void *v7;
  void *v8;

  shapeRecognizer = self->_shapeRecognizer;
  if (!shapeRecognizer)
  {
    v4 = (CHRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x24BE1BDE0]), "initWithMode:locale:", 3, 0);
    v5 = self->_shapeRecognizer;
    self->_shapeRecognizer = v4;

    -[CHRecognizer supportedStrings](self->_shapeRecognizer, "supportedStrings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    objc_msgSend(v7, "removeObject:", CFSTR("Manhattan Line"));
    -[CHRecognizer characterSetForStrings:](self->_shapeRecognizer, "characterSetForStrings:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CHRecognizer setActiveCharacterSet:](self->_shapeRecognizer, "setActiveCharacterSet:", v8);

    shapeRecognizer = self->_shapeRecognizer;
  }
  return shapeRecognizer;
}

- (BOOL)isShowingCandidatePicker
{
  void *v2;
  BOOL v3;

  -[AKShapeDetectionController candidatePickerView](self, "candidatePickerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)_shouldDismissNotification:(id)a3
{
  if (-[AKShapeDetectionController isShowingCandidatePicker](self, "isShowingCandidatePicker", a3))
    -[AKShapeDetectionController dismissCandidatePicker](self, "dismissCandidatePicker");
}

- (void)dismissCandidatePicker
{
  void *v3;
  char v4;

  if (-[AKShapeDetectionController isPreviousCandidateAnnotationUndecided](self, "isPreviousCandidateAnnotationUndecided"))
  {
    -[AKShapeDetectionController delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isWaitingToCoalesceStrokes");

    if ((v4 & 1) == 0)
      -[AKShapeDetectionController clearPreviousCandidateAnnotation](self, "clearPreviousCandidateAnnotation");
  }
  -[AKShapeDetectionController _teardownCandidatePicker](self, "_teardownCandidatePicker");
}

- (void)clearPreviousCandidateAnnotation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[AKShapeDetectionController controller](self, "controller");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[AKShapeDetectionController candidateAnnotation](self, "candidateAnnotation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKShapeDetectionController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "beginIgnoringAnnotationSelectionObservation:", self);
    objc_msgSend(v9, "modelController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pageModelControllerForAnnotation:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "mutableArrayValueForKeyPath:", CFSTR("annotations"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObjectIdenticalTo:", v3);
    objc_msgSend(v5, "endIgnoringAnnotationSelectionObservation:", self);

  }
  -[AKShapeDetectionController setCandidateAnnotation:](self, "setCandidateAnnotation:", 0);
  -[AKShapeDetectionController setIsPreviousCandidateAnnotationUndecided:](self, "setIsPreviousCandidateAnnotationUndecided:", 0);

}

- (void)_showCandidatePickerWithTypes:(id)a3 forDrawingInInputView:(id)a4 shouldSurfaceDoodle:(BOOL)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id obj;
  uint64_t v27;
  void *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[2];
  _QWORD v35[2];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  -[AKShapeDetectionController controller](self, "controller");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKShapeDetectionController setCandidateAKTags:](self, "setCandidateAKTags:", v9);

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKShapeDetectionController setCandidateAKTagsToAnnotationInfoMap:](self, "setCandidateAKTagsToAnnotationInfoMap:", v10);

  v28 = v8;
  v11 = (void *)objc_msgSend(v8, "copy");
  -[AKShapeDetectionController setCandidateDrawing:](self, "setCandidateDrawing:", v11);

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v7;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  if (v12)
  {
    v13 = v12;
    v27 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v31 != v27)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        -[AKShapeDetectionController candidateAKTags](self, "candidateAKTags");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v15, "tag"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObject:", v17);

        objc_msgSend(v28, "bounds");
        v29 = 0;
        -[AKShapeDetectionController _createAnnotationWithRecognizerResult:forDrawingBoundsInInputView:shouldGoToPageController:](self, "_createAnnotationWithRecognizerResult:forDrawingBoundsInInputView:shouldGoToPageController:", v15, &v29);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v29;
        v20 = v19;
        if (v19)
        {
          v34[0] = CFSTR("AKShapeDetectionController.candidateAnnotation");
          v34[1] = CFSTR("AKShapeDetectionController.candidatePageController");
          v35[0] = v18;
          v35[1] = v19;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[AKShapeDetectionController candidateAKTagsToAnnotationInfoMap](self, "candidateAKTagsToAnnotationInfoMap");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v15, "tag"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setObject:forKey:", v21, v23);

        }
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    }
    while (v13);
  }

  if ((unint64_t)objc_msgSend(obj, "count") >= 2)
  {
    -[AKShapeDetectionController _presentCandidatePickerBarWithCandidates:ofDrawing:](self, "_presentCandidatePickerBarWithCandidates:ofDrawing:", obj, v28);
    objc_msgSend(v25, "statisticsLogger");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "logShapeDetectionHUDShown");

  }
}

- (void)_teardownCandidatePicker
{
  id v3;

  -[AKShapeDetectionController _teardownCandidatePickerBar](self, "_teardownCandidatePickerBar");
  -[AKShapeDetectionController setCandidateAKTags:](self, "setCandidateAKTags:", 0);
  -[AKShapeDetectionController setCandidateAKTagsToAnnotationInfoMap:](self, "setCandidateAKTagsToAnnotationInfoMap:", 0);
  -[AKShapeDetectionController setCandidateDrawing:](self, "setCandidateDrawing:", 0);
  -[AKShapeDetectionController setCandidateAnnotation:](self, "setCandidateAnnotation:", 0);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("AKShapeDetectionController.didDismissCandidatePicker"), self);

}

- (int64_t)_toolTagForCHRecognitionResult:(id)a3
{
  int64_t v3;
  void *v4;
  void *v5;

  v3 = 763000;
  objc_msgSend(a3, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("arrow")) & 1) != 0)
  {
    v3 = 764005;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("outline arrow")) & 1) != 0)
  {
    v3 = 764006;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("line")) & 1) != 0)
  {
    v3 = 764003;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("star")) & 1) != 0)
  {
    v3 = 764008;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("rectangle")) & 1) != 0)
  {
    v3 = 764000;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("rounded rectangle")) & 1) != 0)
  {
    v3 = 764001;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("oval")) & 1) != 0)
  {
    v3 = 764002;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("chat bubble")) & 1) != 0)
  {
    v3 = 764007;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("pentagon")) & 1) != 0)
  {
    v3 = 764009;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("triangle")) & 1) != 0)
  {
    v3 = 764010;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("freeform")) & 1) != 0)
  {
    v3 = 764018;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("heart")) & 1) != 0)
  {
    v3 = 764011;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("cloud")) & 1) != 0)
  {
    v3 = 764013;
  }
  else
  {
    NSLog(CFSTR("Could not map CHRecognitionResult shape %@ to an AKTagTool"), v5);
  }

  return v3;
}

- (void)setModelControllerToObserveForAnnotationsAndSelections:(id)a3
{
  AKPageModelController *v5;
  AKPageModelController *modelControllerToObserveForAnnotationsAndSelections;
  AKPageModelController **p_modelControllerToObserveForAnnotationsAndSelections;
  AKPageModelController *v8;

  v5 = (AKPageModelController *)a3;
  p_modelControllerToObserveForAnnotationsAndSelections = &self->_modelControllerToObserveForAnnotationsAndSelections;
  modelControllerToObserveForAnnotationsAndSelections = self->_modelControllerToObserveForAnnotationsAndSelections;
  v8 = v5;
  if (modelControllerToObserveForAnnotationsAndSelections != v5)
  {
    if (modelControllerToObserveForAnnotationsAndSelections)
    {
      -[AKPageModelController removeObserver:forKeyPath:](modelControllerToObserveForAnnotationsAndSelections, "removeObserver:forKeyPath:", self, CFSTR("annotations"));
      -[AKPageModelController removeObserver:forKeyPath:](self->_modelControllerToObserveForAnnotationsAndSelections, "removeObserver:forKeyPath:", self, CFSTR("selectedAnnotations"));
    }
    objc_storeStrong((id *)&self->_modelControllerToObserveForAnnotationsAndSelections, a3);
    if (*p_modelControllerToObserveForAnnotationsAndSelections)
    {
      -[AKPageModelController addObserver:forKeyPath:options:context:](*p_modelControllerToObserveForAnnotationsAndSelections, "addObserver:forKeyPath:options:context:", self, CFSTR("annotations"), 3, CFSTR("AKShapeDetectionController.annotationsChangeObservationContext"));
      -[AKPageModelController addObserver:forKeyPath:options:context:](self->_modelControllerToObserveForAnnotationsAndSelections, "addObserver:forKeyPath:options:context:", self, CFSTR("selectedAnnotations"), 0, CFSTR("AKShapeDetectionController.selectedAnnotationsObservationContext"));
    }
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  objc_super v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[AKShapeDetectionController delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (a6 == CFSTR("AKShapeDetectionController.annotationsChangeObservationContext"))
  {
    if ((objc_msgSend(v13, "isIgnoringAnnotationAndSelectionKVO:", self) & 1) == 0)
    {
      objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BDD0E80]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BDD0E70]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "count") || objc_msgSend(v16, "count"))
        -[AKShapeDetectionController _teardownCandidatePicker](self, "_teardownCandidatePicker");

    }
  }
  else if (a6 == CFSTR("AKShapeDetectionController.selectedAnnotationsObservationContext"))
  {
    if ((objc_msgSend(v13, "isIgnoringAnnotationAndSelectionKVO:", self) & 1) == 0)
    {
      -[AKShapeDetectionController modelControllerToObserveForAnnotationsAndSelections](self, "modelControllerToObserveForAnnotationsAndSelections");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "selectedAnnotations");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "count");

      if (v19 != 1)
        -[AKShapeDetectionController _teardownCandidatePicker](self, "_teardownCandidatePicker");
    }
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)AKShapeDetectionController;
    -[AKShapeDetectionController observeValueForKeyPath:ofObject:change:context:](&v20, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (void)_presentCandidatePickerBarWithCandidates:(id)a3 ofDrawing:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  int64_t v31;
  AKCandidatePickerView_iOS *v32;
  void *v33;
  AKCandidatePickerView_iOS *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[2];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[AKShapeDetectionController candidatePickerView](self, "candidatePickerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    -[AKShapeDetectionController controller](self, "controller");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "modernToolbarView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "superview");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v9, "modernToolbarView");
      v12 = objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
LABEL_23:

        goto LABEL_24;
      }
    }
    else
    {
      objc_msgSend(v9, "toolbarView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "superview");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
        goto LABEL_23;
      objc_msgSend(v9, "toolbarView");
      v12 = objc_claimAutoreleasedReturnValue();
      if (!v12)
        goto LABEL_23;
    }
    v50 = v9;
    v15 = (void *)v12;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v17 = v6;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v52 != v20)
            objc_enumerationMutation(v17);
          v22 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i);
          objc_msgSend(v7, "bounds");
          -[AKShapeDetectionController _createAnnotationWithRecognizerResult:forDrawingBoundsInInputView:shouldGoToPageController:](self, "_createAnnotationWithRecognizerResult:forDrawingBoundsInInputView:shouldGoToPageController:", v22, 0);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v23);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
      }
      while (v19);
    }

    objc_msgSend(v50, "delegate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v24;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v24, "popoverPresentingViewControllerForAnnotationController:", v50);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      if (v25)
        v27 = v25;

    }
    else
    {
      v26 = 0;
    }
    objc_msgSend(v26, "view");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "superview");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v48 = v26;
    if (v29)
      objc_msgSend(v26, "view");
    else
      objc_msgSend(v15, "superview");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = -[AKShapeDetectionController _matchingBlurEffectStyleForCurrentTintColor:](self, "_matchingBlurEffectStyleForCurrentTintColor:", v15, v30);
    v32 = [AKCandidatePickerView_iOS alloc];
    -[AKShapeDetectionController candidateAKTags](self, "candidateAKTags");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = -[AKCandidatePickerView_iOS initWithFrame:items:annotations:target:action:visualStyle:](v32, "initWithFrame:items:annotations:target:action:visualStyle:", v33, v16, self, sel__pickCandidateResult_, v31, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    -[AKShapeDetectionController setCandidatePickerView:](self, "setCandidatePickerView:", v34);

    -[AKShapeDetectionController candidatePickerView](self, "candidatePickerView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addSubview:", v35);

    -[AKShapeDetectionController candidatePickerView](self, "candidatePickerView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "bottomAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "topAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v39, "setConstant:", -16.0);
    -[AKShapeDetectionController candidatePickerView](self, "candidatePickerView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "centerXAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "centerXAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    v44 = (void *)MEMORY[0x24BDD1628];
    v55[0] = v43;
    v55[1] = v39;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v55, 2);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "activateConstraints:", v45);

    -[AKShapeDetectionController candidatePickerView](self, "candidatePickerView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setBarHidden:animated:completion:", 0, 1, &unk_24F1A7138);

    v9 = v50;
    goto LABEL_23;
  }
LABEL_24:

}

- (int64_t)_matchingBlurEffectStyleForCurrentTintColor:(id)a3
{
  return 1;
}

- (void)_teardownCandidatePickerBar
{
  AKShapeDetectionController *v2;
  void *v3;
  AKShapeDetectionController *v4;
  _QWORD v5[4];
  AKShapeDetectionController *v6;

  v2 = self;
  -[AKShapeDetectionController candidatePickerView](v2, "candidatePickerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_228FE8714;
  v5[3] = &unk_24F1A7328;
  v6 = v2;
  v4 = v2;
  objc_msgSend(v3, "setBarHidden:animated:completion:", 1, 0, v5);

}

- (void)_pickCandidateResult:(id)a3
{
  id v4;

  v4 = a3;
  NSLog(CFSTR("%s %@"), "-[AKShapeDetectionController _pickCandidateResult:]", v4);
  objc_msgSend(v4, "tag");

  MEMORY[0x24BEDD108](self, sel__pickCandidateResultWithAnnotationType_);
}

- (void)_pickCandidateResultWithAnnotationType:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  -[AKShapeDetectionController controller](self, "controller");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[AKShapeDetectionController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "shapeDetectionControllerWillPickCandidate:isInk:", self, a3 == 764017);
  -[AKShapeDetectionController clearPreviousCandidateAnnotation](self, "clearPreviousCandidateAnnotation");
  -[AKShapeDetectionController candidateAKTagsToAnnotationInfoMap](self, "candidateAKTagsToAnnotationInfoMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("AKShapeDetectionController.candidatePageController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("AKShapeDetectionController.candidateAnnotation"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    v10 = 0;
  }
  else if (v10)
  {
    objc_msgSend(v5, "beginIgnoringAnnotationSelectionObservation:", self);
    objc_msgSend(v13, "toolController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addNewAnnotation:onPageController:shouldSelect:shouldCascade:", v10, v9, objc_msgSend(v5, "shapeDetectionController:shouldSelectCandidateAnnotation:", self, v10), 0);

    objc_msgSend(v5, "endIgnoringAnnotationSelectionObservation:", self);
  }
  -[AKShapeDetectionController setCandidateAnnotation:](self, "setCandidateAnnotation:", v10);
  -[AKShapeDetectionController setIsPreviousCandidateAnnotationUndecided:](self, "setIsPreviousCandidateAnnotationUndecided:", 0);
  objc_msgSend(v13, "statisticsLogger");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "logShapeDetectionHUDPickedShape:", v10);

  -[AKShapeDetectionController dismissCandidatePicker](self, "dismissCandidatePicker");
}

- (void)performRecognitionOnDrawing:(id)a3 withDrawing:(id)a4 annotation:(id)a5 boundsInInputView:(CGRect)a6 center:(CGPoint)a7
{
  MEMORY[0x24BEDD108](self, sel__performRecognitionOnDrawing_withInkDrawing_orWithDoodlePath_boundsInInputView_center_isPrestroked_optionalAnnotation_);
}

- (void)performRecognitionOnDrawing:(id)a3 withPath:(CGPath *)a4 boundsInInputView:(CGRect)a5 center:(CGPoint)a6 isPrestroked:(BOOL)a7
{
  MEMORY[0x24BEDD108](self, sel__performRecognitionOnDrawing_withInkDrawing_orWithDoodlePath_boundsInInputView_center_isPrestroked_optionalAnnotation_);
}

- (void)_performRecognitionOnDrawing:(id)a3 withInkDrawing:(id)a4 orWithDoodlePath:(CGPath *)a5 boundsInInputView:(CGRect)a6 center:(CGPoint)a7 isPrestroked:(BOOL)a8 optionalAnnotation:(id)a9
{
  _BOOL4 v10;
  double y;
  double x;
  double height;
  double width;
  double v15;
  double v16;
  id v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  unsigned int v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  int64_t v46;
  AKShapeToCHRecognitionResult *v47;
  _BOOL4 v48;
  void *v49;
  uint64_t v50;
  void *v51;
  AKShapeDetectionController *v52;
  id v53;
  id v54;
  id v55;
  void *v57;
  unsigned int v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  uint64_t v64;

  v10 = a8;
  y = a7.y;
  x = a7.x;
  height = a6.size.height;
  width = a6.size.width;
  v15 = a6.origin.y;
  v16 = a6.origin.x;
  v64 = *MEMORY[0x24BDAC8D0];
  v19 = a3;
  v20 = a4;
  v21 = a9;
  -[AKShapeDetectionController convertDrawingBoundsInInputView:outBoundsInPageModel:](self, "convertDrawingBoundsInInputView:outBoundsInPageModel:", 0, v16, v15, width, height);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v22)
    goto LABEL_29;
  v48 = v10;
  -[AKShapeDetectionController _createFlippedCHDrawingFromCHDrawing:withDrawingCenter:](self, "_createFlippedCHDrawingFromCHDrawing:withDrawingCenter:", v19, x, y);
  v23 = objc_claimAutoreleasedReturnValue();
  -[AKShapeDetectionController shapeRecognizer](self, "shapeRecognizer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = (void *)v23;
  objc_msgSend(v24, "recognitionResultsForDrawing:options:", v23, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v25, "mutableCopy");

  v27 = objc_msgSend(v26, "count");
  v28 = v27;
  if (v27)
  {
    v50 = v27;
    v51 = v22;
    v52 = self;
    v53 = v21;
    v54 = v20;
    v55 = v19;
    objc_msgSend(v26, "firstObject");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "string");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "lowercaseString");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "isEqualToString:", CFSTR("freeform"));

    v58 = v32;
    if (v32)
      objc_msgSend(v26, "removeObject:", v29);
    v49 = v29;
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v33 = (void *)objc_msgSend(v26, "copy");
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v60;
      do
      {
        for (i = 0; i != v35; ++i)
        {
          if (*(_QWORD *)v60 != v36)
            objc_enumerationMutation(v33);
          v38 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
          objc_msgSend(v38, "string");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "lowercaseString");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = objc_msgSend(v40, "isEqualToString:", CFSTR("freeform"));

          if (v41)
            objc_msgSend(v26, "removeObject:", v38);
        }
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
      }
      while (v35);
    }

    v20 = v54;
    v19 = v55;
    self = v52;
    v21 = v53;
    v28 = v50;
    v22 = v51;
  }
  else
  {
    v58 = 1;
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    -[AKShapeDetectionController createInkResultFromInkDrawing:annotation:](self, "createInkResultFromInkDrawing:annotation:", v20, v21);
    v43 = objc_claimAutoreleasedReturnValue();
LABEL_20:
    v44 = (void *)v43;
    objc_msgSend(v42, "addObject:", v43);

    goto LABEL_21;
  }
  if (a5)
  {
    -[AKShapeDetectionController _createDoodleShapeResultWithPath:withDrawingCenter:pathIsPrestroked:](self, "_createDoodleShapeResultWithPath:withDrawingCenter:pathIsPrestroked:", a5, v48, x, y);
    v43 = objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
LABEL_21:
  if (v28)
  {
    objc_msgSend(v26, "objectAtIndex:", 0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v45 = 0;
  }
  if ((v58 & 1) == 0)
  {
    if (-[AKShapeDetectionController _isResultVeryHighConfidence:](self, "_isResultVeryHighConfidence:", v45))
    {
      v46 = -[AKShapeDetectionController _toolTagForCHRecognitionResult:](self, "_toolTagForCHRecognitionResult:", v45);
      if (v46 != 763000)
      {
        v47 = -[AKShapeToCHRecognitionResult initWith:result:]([AKShapeToCHRecognitionResult alloc], "initWith:result:", v46, v45);
        objc_msgSend(v42, "addObject:", v47);

      }
    }
  }
  -[AKShapeDetectionController _showCandidatePickerWithTypes:forDrawingInInputView:shouldSurfaceDoodle:](self, "_showCandidatePickerWithTypes:forDrawingInInputView:shouldSurfaceDoodle:", v42, v19, v58);

LABEL_29:
}

- (BOOL)_isResultVeryHighConfidence:(id)a3
{
  double v4;
  double v5;
  double v6;

  objc_msgSend(a3, "score");
  v5 = __exp10(v4);
  -[AKShapeDetectionController veryHighConfidenceLevel](self, "veryHighConfidenceLevel");
  return v5 > v6;
}

- (id)_createAnnotationWithRecognizerResult:(id)a3 forDrawingBoundsInInputView:(CGRect)a4 shouldGoToPageController:(id *)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double MidX;
  void *v21;
  double MidY;
  double v23;
  double v24;
  id v25;
  void *v26;
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
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
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
  uint64_t v67;
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
  double v78;
  double v79;
  double v80;
  double v81;
  CGFloat a;
  CGFloat b;
  CGFloat c;
  CGFloat d;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  id v93;
  void *v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  __double2 v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  double v143;
  double v144;
  double v145;
  double v146;
  double v147;
  double v148;
  double v149;
  double v150;
  double v151;
  double v152;
  double v153;
  double v154;
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
  CGFloat v167;
  CGFloat v168;
  double v169;
  void *v170;
  double v171;
  double v172;
  double v173;
  CGFloat v174;
  CGFloat v175;
  double v176;
  double v177;
  double v178;
  double v179;
  double v180;
  double v181;
  double v182;
  double v183;
  double v184;
  double v185;
  double v186;
  double v187;
  double v188;
  double v189;
  double v190;
  double v191;
  double v192;
  double v193;
  double v194;
  double v195;
  double v196;
  double v197;
  double v198;
  double v199;
  double v200;
  double v201;
  double v202;
  double v203;
  double v204;
  CGFloat v205;
  double v206;
  CGFloat v207;
  double v208;
  CGFloat v209;
  double v210;
  CGFloat v211;
  double v212;
  CGFloat v213;
  double v214;
  CGFloat v215;
  uint64_t v216;
  double v217;
  CGPath *Mutable;
  void *v219;
  double v220;
  double v221;
  CGFloat v222;
  CGFloat v223;
  CGFloat v224;
  CGFloat v225;
  double MinX;
  CGFloat MinY;
  __int128 v228;
  void *v229;
  double v230;
  double v232;
  double v233;
  double v234;
  double v235;
  double v236;
  double v237;
  double v238;
  double v239;
  double v240;
  void *v241;
  double v242;
  double v243;
  double v244;
  id v245;
  float64x2_t v246;
  CGAffineTransform v247;
  CGAffineTransform v248;
  CGRect v249;
  CGAffineTransform m;
  CGRect v251;
  CGRect v252;
  CGRect v253;
  CGRect v254;
  CGRect v255;
  CGRect v256;
  CGRect v257;
  CGRect v258;
  CGRect v259;
  CGRect v260;
  CGRect BoundingBox;
  CGRect v262;
  CGRect v263;
  CGRect v264;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a3;
  v12 = objc_msgSend(v11, "tag");
  objc_msgSend(v11, "result");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKShapeDetectionController controller](self, "controller");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "annotation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(v11, "annotation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v14, "toolController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "createAnnotationOfType:centeredAtPoint:", v12, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[AKShapeDetectionController delegate](self, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "overlayView:", self);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v251.origin.x = x;
  v251.origin.y = y;
  v251.size.width = width;
  v251.size.height = height;
  MidX = CGRectGetMidX(v251);
  v252.origin.x = x;
  v252.origin.y = y;
  v252.size.width = width;
  v252.size.height = height;
  v21 = 0;
  MidY = CGRectGetMidY(v252);
  v23 = fmax(width, 1.0);
  v24 = fmax(height, 1.0);
  switch(v12)
  {
    case 764000:
    case 764001:
      v25 = v16;
      objc_msgSend(v13, "lowerLeftPoint");
      v69 = v68;
      v71 = v70;
      objc_msgSend(v13, "lowerRightPoint");
      v238 = v73;
      v242 = v72;
      objc_msgSend(v13, "upperRightPoint");
      v75 = v74;
      v77 = v76;
      v78 = (v69 + v74) * 0.5;
      objc_msgSend(v13, "rotation");
      memset(&m, 0, sizeof(m));
      +[AKGeometryHelper rotationTransformAroundPoint:withAngle:](AKGeometryHelper, "rotationTransformAroundPoint:withAngle:", v78, (v71 + v77) * 0.5, v79 * 3.14159265 / -180.0);
      v253.origin.x = m.tx + v71 * m.c + m.a * v69;
      v253.origin.y = m.ty + v71 * m.d + m.b * v69;
      v253.size.width = m.tx + v238 * m.c + m.a * v242 - v253.origin.x;
      v253.size.height = m.ty + v77 * m.d + m.b * v75 - (m.ty + v238 * m.d + m.b * v242);
      v254 = CGRectStandardize(v253);
      memset(&v248, 0, 32);
      -[AKShapeDetectionController convertDrawingBoundsInInputView:outBoundsInPageModel:](self, "convertDrawingBoundsInInputView:outBoundsInPageModel:", &v248, MidX + v254.origin.x, MidY + v254.origin.y, v254.size.width, v254.size.height);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "rotation");
      v81 = v80;
      a = v248.a;
      b = v248.b;
      c = v248.c;
      d = v248.d;
      goto LABEL_16;
    case 764002:
      v25 = v16;
      objc_msgSend(v13, "center");
      v87 = v86;
      v89 = v88;
      objc_msgSend(v13, "size");
      v255.size.width = v90;
      v255.size.height = v91;
      v255.origin.x = v87 - v90 * 0.5;
      v255.origin.y = v89 - v91 * 0.5;
      v256 = CGRectStandardize(v255);
      memset(&m, 0, 32);
      -[AKShapeDetectionController convertDrawingBoundsInInputView:outBoundsInPageModel:](self, "convertDrawingBoundsInInputView:outBoundsInPageModel:", &m, MidX + v256.origin.x, MidY + v256.origin.y, v256.size.width, v256.size.height);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "rotation");
      v81 = v92;
      a = m.a;
      b = m.b;
      c = m.c;
      d = m.d;
LABEL_16:
      sub_228FE9C6C(v25, a, b, c, d, v81);
      goto LABEL_29;
    case 764003:
    case 764004:
    case 764005:
      v25 = v16;
      memset(&m, 0, 32);
      -[AKShapeDetectionController convertDrawingBoundsInInputView:outBoundsInPageModel:](self, "convertDrawingBoundsInInputView:outBoundsInPageModel:", &m, x, y, v23, v24);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "overlayView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "startLocation");
      v28 = v27;
      v30 = v29;
      objc_msgSend(v13, "midpointLocation");
      v32 = v31;
      v34 = v33;
      objc_msgSend(v13, "endLocation");
      v35 = MidX + v28;
      v36 = MidY + v30;
      v37 = MidX + v32;
      v38 = MidY + v34;
      v40 = MidX + v39;
      v42 = MidY + v41;
      objc_msgSend(v19, "convertPoint:toView:", v26, v35, v36);
      v44 = v43;
      v46 = v45;
      objc_msgSend(v19, "convertPoint:toView:", v26, v37, v38);
      v48 = v47;
      v50 = v49;
      objc_msgSend(v19, "convertPoint:toView:", v26, v40, v42);
      v52 = v51;
      v54 = v53;
      objc_msgSend(v21, "convertPointFromOverlayToModel:", v44, v46);
      v56 = v55;
      v58 = v57;
      objc_msgSend(v21, "convertPointFromOverlayToModel:", v48, v50);
      v60 = v59;
      v62 = v61;
      objc_msgSend(v21, "convertPointFromOverlayToModel:", v52, v54);
      v64 = v63;
      v66 = v65;
      objc_msgSend(v25, "setStartPoint:", v56, v58);
      objc_msgSend(v25, "setMidPoint:", v60, v62);
      objc_msgSend(v25, "setEndPoint:", v64, v66);
      objc_msgSend(v25, "setArrowHeadStyle:", 0);
      if (objc_msgSend(v13, "startEndpointType") == 1
        && objc_msgSend(v13, "endEndpointType") == 1)
      {
        v67 = 3;
      }
      else if (objc_msgSend(v13, "startEndpointType") == 1)
      {
        v67 = 1;
      }
      else
      {
        if (objc_msgSend(v13, "endEndpointType") != 1)
          goto LABEL_14;
        v67 = 2;
      }
      objc_msgSend(v25, "setArrowHeadStyle:", v67);
LABEL_14:

LABEL_29:
LABEL_30:
      if (!objc_msgSend(v16, "originalExifOrientation"))
        objc_msgSend(v16, "setOriginalExifOrientation:", objc_msgSend(v21, "currentModelToScreenExifOrientation"));
      objc_msgSend(v16, "originalModelBaseScaleFactor");
      if (v230 == 0.0)
      {
        objc_msgSend(v21, "modelBaseScaleFactor");
        objc_msgSend(v16, "setOriginalModelBaseScaleFactor:");
      }
      if (a5)
        *a5 = objc_retainAutorelease(v21);

      return v16;
    case 764006:
      memset(&m, 0, 32);
      v93 = v16;
      -[AKShapeDetectionController convertDrawingBoundsInInputView:outBoundsInPageModel:](self, "convertDrawingBoundsInInputView:outBoundsInPageModel:", &m, x, y, v23, v24);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "overlayView");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "size");
      v96 = v95;
      v243 = v97;
      objc_msgSend(v13, "center");
      v99 = v98;
      v101 = v100;
      objc_msgSend(v13, "controlPoint");
      v103 = v102;
      v105 = v104;
      objc_msgSend(v13, "rotation");
      v107 = __sincos_stret(v106 * 3.14159265 / -180.0 + 3.14159265);
      v108 = v99 + v107.__cosval * (v96 * 0.5);
      v109 = v101 + v107.__sinval * (v96 * 0.5);
      v110 = v99 - v107.__cosval * (v96 * 0.5);
      v111 = v101 - v107.__sinval * (v96 * 0.5);
      v112 = MidX + v99;
      v113 = MidY + v101;
      v114 = MidX + v103;
      v115 = MidY + v105;
      v116 = MidX + v108;
      v117 = MidY + v109;
      v118 = MidX + v110;
      v119 = MidY + v111;
      objc_msgSend(v19, "convertPoint:toView:", v94, v112, v113);
      v121 = v120;
      v239 = v122;
      objc_msgSend(v19, "convertPoint:toView:", v94, v114, v115);
      v124 = v123;
      v126 = v125;
      objc_msgSend(v19, "convertPoint:toView:", v94, v116, v117);
      v128 = v127;
      v237 = v129;
      objc_msgSend(v19, "convertPoint:toView:", v94, v118, v119);
      v235 = v131;
      v236 = v130;
      objc_msgSend(v19, "convertRect:toView:", v94, 0.0, 0.0, v96, v243);
      v244 = v132;
      v233 = v134;
      v234 = v133;
      v232 = v135;
      objc_msgSend(v21, "convertPointFromOverlayToModel:", v121, v239);
      v137 = v136;
      v240 = v138;
      objc_msgSend(v21, "convertPointFromOverlayToModel:", v124, v126);
      v140 = v139;
      v142 = v141;
      objc_msgSend(v21, "convertPointFromOverlayToModel:", v128, v237);
      v144 = v143;
      v146 = v145;
      objc_msgSend(v21, "convertPointFromOverlayToModel:", v236, v235);
      v148 = v147;
      v150 = v149;
      objc_msgSend(v21, "convertRectFromOverlayToModel:", v244, v234, v233, v232);
      v152 = v151;
      v154 = v137 + v153 * 0.5 - v140;
      objc_msgSend(v93, "setStartPoint:", v144, v146);
      objc_msgSend(v93, "setEndPoint:", v148, v150);
      objc_msgSend(v93, "setArrowHeadLength:", v154);
      objc_msgSend(v93, "setArrowHeadWidth:", v152);
      objc_msgSend(v93, "setArrowLineWidth:", fabs(v142 - v240 + v142 - v240));
      goto LABEL_19;
    case 764007:
      v93 = v16;
      objc_msgSend(v13, "stemWidth");
      v156 = v155;
      objc_msgSend(v13, "size");
      v158 = v157;
      v160 = v159;
      objc_msgSend(v13, "stemLocation");
      v162 = v161;
      v164 = v163;
      objc_msgSend(v13, "center");
      memset(&m, 0, 32);
      -[AKShapeDetectionController convertDrawingBoundsInInputView:outBoundsInPageModel:](self, "convertDrawingBoundsInInputView:outBoundsInPageModel:", &m, MidX + v165 - v158 * 0.5, MidY + v166 - v160 * 0.5, v158, v160);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "setRectangle:", m.a, m.b, m.c, m.d);
      objc_msgSend(v21, "overlayView");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "convertPoint:toView:", v94, MidX + v162, MidY + v164);
      objc_msgSend(v21, "convertPointFromOverlayToModel:");
      +[AKAnnotationPointOfInterestHelper validatePoint:ofDraggableArea:forAnnotation:onPageController:](AKAnnotationPointOfInterestHelper, "validatePoint:ofDraggableArea:forAnnotation:onPageController:", 10, v93, v21);
      objc_msgSend(v93, "setPointyBitPoint:");
      objc_msgSend(v93, "setPointyBitBaseWidthAngle:", v156 * 180.0 / 3.14159265);
LABEL_19:

      goto LABEL_30;
    case 764008:
      memset(&m, 0, 32);
      v25 = v16;
      -[AKShapeDetectionController convertDrawingBoundsInInputView:outBoundsInPageModel:](self, "convertDrawingBoundsInInputView:outBoundsInPageModel:", &m, x, y, v23, v24);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v257.size.width = m.c;
      v257.size.height = m.d;
      v167 = (m.c + m.d) * 0.5;
      v257.origin.x = m.a;
      v257.origin.y = m.b;
      v168 = CGRectGetMidX(v257) - v167 * 0.5;
      v258.origin.x = m.a;
      v258.origin.y = m.b;
      v258.size.width = m.c;
      v258.size.height = m.d;
      v169 = CGRectGetMidY(v258) - v167 * 0.5;
      v170 = v25;
      v171 = v168;
      v172 = v167;
      v173 = v167;
      goto LABEL_24;
    case 764009:
      memset(&m, 0, 32);
      v25 = v16;
      -[AKShapeDetectionController convertDrawingBoundsInInputView:outBoundsInPageModel:](self, "convertDrawingBoundsInInputView:outBoundsInPageModel:", &m, x, y, v23, v24);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v259.size.width = m.c;
      v259.size.height = m.d;
      v174 = (m.c + m.d) * 0.5;
      v259.origin.x = m.a;
      v259.origin.y = m.b;
      v175 = CGRectGetMidX(v259) - v174 * 0.5;
      v260.origin.x = m.a;
      v260.origin.y = m.b;
      v260.size.width = m.c;
      v260.size.height = m.d;
      objc_msgSend(v25, "setRectangle:", v175, CGRectGetMidY(v260) - v174 * 0.5, v174, v174);
      objc_msgSend(v25, "setPointCount:", 5);
      goto LABEL_29;
    case 764010:
      memset(&v249, 0, sizeof(v249));
      v245 = v16;
      -[AKShapeDetectionController convertDrawingBoundsInInputView:outBoundsInPageModel:](self, "convertDrawingBoundsInInputView:outBoundsInPageModel:", &v249, x, y, v23, v24);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "vertex1");
      v177 = v176;
      v179 = v178;
      objc_msgSend(v13, "vertex2");
      v181 = v180;
      v183 = v182;
      objc_msgSend(v13, "vertex3");
      v184 = MidX + v177;
      v185 = MidY + v179;
      v186 = MidX + v181;
      v187 = MidY + v183;
      v189 = MidX + v188;
      v191 = MidY + v190;
      objc_msgSend(v21, "overlayView");
      v241 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "convertPoint:toView:", v241, v184, v185);
      v193 = v192;
      v195 = v194;
      objc_msgSend(v19, "convertPoint:toView:", v241, v186, v187);
      v197 = v196;
      v199 = v198;
      objc_msgSend(v19, "convertPoint:toView:", v241, v189, v191);
      v201 = v200;
      v203 = v202;
      objc_msgSend(v21, "convertPointFromOverlayToModel:", v193, v195);
      v205 = v204;
      v207 = v206;
      objc_msgSend(v21, "convertPointFromOverlayToModel:", v197, v199);
      v209 = v208;
      v211 = v210;
      objc_msgSend(v21, "convertPointFromOverlayToModel:", v201, v203);
      v213 = v212;
      v215 = v214;
      memset(&m, 0, sizeof(m));
      v216 = objc_msgSend(v21, "currentModelToScreenExifOrientation");
      v217 = CGRectGetMidX(v249);
      +[AKGeometryHelper affineTransformForExifOrientation:aboutCenter:](AKGeometryHelper, "affineTransformForExifOrientation:aboutCenter:", v216, v217, CGRectGetMidY(v249));
      v247 = m;
      memset(&v248, 0, sizeof(v248));
      CGAffineTransformInvert(&v248, &v247);
      Mutable = CGPathCreateMutable();
      CGPathMoveToPoint(Mutable, &m, v205, v207);
      CGPathAddLineToPoint(Mutable, &m, v209, v211);
      CGPathAddLineToPoint(Mutable, &m, v213, v215);
      CGPathCloseSubpath(Mutable);
      BoundingBox = CGPathGetBoundingBox(Mutable);
      v247 = v248;
      v262 = CGRectApplyAffineTransform(BoundingBox, &v247);
      objc_msgSend(v245, "setRectangle:", v262.origin.x, v262.origin.y, fmax(v262.size.width, 1.0), fmax(v262.size.height, 1.0));
      objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithCGPath:", Mutable);
      v219 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v245, "setPath:", v219);

      CGPathRelease(Mutable);
      goto LABEL_30;
    case 764011:
      memset(&m, 0, 32);
      v25 = v16;
      -[AKShapeDetectionController convertDrawingBoundsInInputView:outBoundsInPageModel:](self, "convertDrawingBoundsInInputView:outBoundsInPageModel:", &m, x, y, v23, v24);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v171 = m.a;
      v169 = m.b;
      v172 = m.c;
      v173 = m.d;
      v170 = v25;
LABEL_24:
      objc_msgSend(v170, "setRectangle:", v171, v169, v172, v173);
      goto LABEL_29;
    case 764013:
      memset(&v249, 0, sizeof(v249));
      v25 = v16;
      -[AKShapeDetectionController convertDrawingBoundsInInputView:outBoundsInPageModel:](self, "convertDrawingBoundsInInputView:outBoundsInPageModel:", &v249, x, y, v23, v24);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v220 = CGRectGetMidX(v249);
      v221 = CGRectGetMidY(v249);
      memset(&m, 0, sizeof(m));
      +[AKGeometryHelper affineTransformForExifOrientation:aboutCenter:](AKGeometryHelper, "affineTransformForExifOrientation:aboutCenter:", objc_msgSend(v21, "currentModelToScreenExifOrientation"), v220, v221);
      v247 = m;
      memset(&v248, 0, sizeof(v248));
      CGAffineTransformInvert(&v248, &v247);
      v247 = m;
      v263 = CGRectApplyAffineTransform(v249, &v247);
      v222 = v263.origin.x;
      v223 = v263.origin.y;
      v224 = v263.size.width;
      v225 = v263.size.height;
      MinX = CGRectGetMinX(v263);
      v264.origin.x = v222;
      v264.origin.y = v223;
      v264.size.width = v224;
      v264.size.height = v225;
      MinY = CGRectGetMinY(v264);
      v246 = vaddq_f64(*(float64x2_t *)&v248.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v248.c, MinY + (MinY - (m.ty + v221 * m.d + m.b * v220)) * 0.3), *(float64x2_t *)&v248.a, MinX + (MinX - (m.tx + v221 * m.c + m.a * v220)) * -0.1));
      objc_msgSend(v25, "setRectangle:", *(_OWORD *)&v249.origin, *(_OWORD *)&v249.size);
      objc_msgSend(v25, "setPointyBitPoint:", *(_OWORD *)&v246);
      goto LABEL_29;
    case 764017:
      memset(&m, 0, 32);
      -[AKShapeDetectionController convertDrawingBoundsInInputView:outBoundsInPageModel:](self, "convertDrawingBoundsInInputView:outBoundsInPageModel:", &m, x, y, v23, v24);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_30;
    case 764018:
      v25 = v16;
      objc_msgSend(v11, "doodlePath");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        objc_msgSend(v11, "doodlePathBoundsInInputView");
        v228 = *(_OWORD *)(MEMORY[0x24BDBF090] + 16);
        *(_OWORD *)&m.a = *MEMORY[0x24BDBF090];
        *(_OWORD *)&m.c = v228;
        -[AKShapeDetectionController convertDrawingBoundsInInputView:outBoundsInPageModel:](self, "convertDrawingBoundsInInputView:outBoundsInPageModel:", &m);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setRectangle:", m.a, m.b, m.c, m.d);
        objc_msgSend(v11, "doodlePath");
        v229 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setPath:", v229);

        objc_msgSend(v25, "setPathIsPrestroked:", objc_msgSend(v11, "doodlePathIsPrestroked"));
      }
      goto LABEL_29;
    default:
      goto LABEL_30;
  }
}

- (id)_createFlippedCHDrawingFromCHDrawing:(id)a3 withDrawingCenter:(CGPoint)a4
{
  double y;
  double x;
  id v6;
  id v7;
  unint64_t v8;
  unint64_t v9;
  double v10;
  double v11;

  y = a4.y;
  x = a4.x;
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x24BE1BDC8]);
  if (objc_msgSend(v6, "strokeCount"))
  {
    v8 = 0;
    do
    {
      if (objc_msgSend(v6, "pointCountForStrokeIndex:", v8))
      {
        v9 = 0;
        do
        {
          objc_msgSend(v6, "pointForStrokeIndex:pointIndex:", v8, v9);
          objc_msgSend(v7, "addPoint:", v10 - x, v11 - y);
          ++v9;
        }
        while (v9 < objc_msgSend(v6, "pointCountForStrokeIndex:", v8));
      }
      objc_msgSend(v7, "endStroke");
      ++v8;
    }
    while (v8 < objc_msgSend(v6, "strokeCount"));
  }

  return v7;
}

- (id)_createDoodleShapeResultWithPath:(CGPath *)a3 withDrawingCenter:(CGPoint)a4 pathIsPrestroked:(BOOL)a5
{
  _BOOL8 v5;
  double y;
  double x;
  AKShapeToCHRecognitionResult *v9;
  const CGPath *v10;
  void *v11;
  double v12;
  double v13;
  double width;
  double height;
  double v16;
  __int128 v18;
  CGRect BoundingBox;
  CGRect v20;

  v5 = a5;
  y = a4.y;
  x = a4.x;
  v9 = -[AKShapeToCHRecognitionResult initWith:result:]([AKShapeToCHRecognitionResult alloc], "initWith:result:", 764018, 0);
  +[AKGeometryHelper affineTransformForExifOrientation:aboutCenter:](AKGeometryHelper, "affineTransformForExifOrientation:aboutCenter:", 4, x, y, 0, 0, 0, 0, 0, 0);
  v10 = (const CGPath *)MEMORY[0x22E2C0A54](a3, &v18);
  objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithCGPath:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  CGPathRelease(v10);
  -[AKShapeToCHRecognitionResult setDoodlePath:](v9, "setDoodlePath:", v11);
  -[AKShapeToCHRecognitionResult setDoodlePathIsPrestroked:](v9, "setDoodlePathIsPrestroked:", v5);
  BoundingBox = CGPathGetBoundingBox(a3);
  v12 = BoundingBox.origin.x;
  v13 = BoundingBox.origin.y;
  width = BoundingBox.size.width;
  height = BoundingBox.size.height;
  if (CGRectGetHeight(BoundingBox) == 0.0)
    height = 1.0;
  v20.origin.x = v12;
  v20.origin.y = v13;
  v20.size.width = width;
  v20.size.height = height;
  if (CGRectGetWidth(v20) == 0.0)
    v16 = 1.0;
  else
    v16 = width;
  -[AKShapeToCHRecognitionResult setDoodlePathBoundsInInputView:](v9, "setDoodlePathBoundsInInputView:", v12, v13, v16, height);

  return v9;
}

- (id)createInkResultFromInkDrawing:(id)a3 annotation:(id)a4
{
  id v5;
  id v6;
  AKShapeToCHRecognitionResult *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[AKShapeToCHRecognitionResult initWith:result:]([AKShapeToCHRecognitionResult alloc], "initWith:result:", 764017, 0);
  -[AKShapeToCHRecognitionResult setInkDrawing:](v7, "setInkDrawing:", v6);

  -[AKShapeToCHRecognitionResult setAnnotation:](v7, "setAnnotation:", v5);
  return v7;
}

- (id)convertDrawingBoundsInInputView:(CGRect)a3 outBoundsInPageModel:(CGRect *)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  double v14;
  uint64_t i;
  void *v16;
  void *v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v38;
  double v39;
  double v40;
  double v41;
  id v42;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  double v48;
  double v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  uint64_t v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;

  v56 = *MEMORY[0x24BDAC8D0];
  -[AKShapeDetectionController controller](self, "controller");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKShapeDetectionController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "overlayView:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v46 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v47 = *MEMORY[0x24BDBF090];
  v44 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v45 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  objc_msgSend(v6, "pageControllers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v52;
    v14 = 0.0;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v52 != v13)
          objc_enumerationMutation(v9);
        v16 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
        if (objc_msgSend(v16, "relinquishablesAreLoaded", *(_QWORD *)&v44, *(_QWORD *)&v45, *(_QWORD *)&v46, *(_QWORD *)&v47))
        {
          v50 = v14;
          objc_msgSend(v16, "overlayView");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "bounds");
          v19 = v18;
          v21 = v20;
          v23 = v22;
          v25 = v24;
          objc_msgSend(v8, "convertRect:toView:", v17, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
          v27 = v26;
          v29 = v28;
          v31 = v30;
          v33 = v32;
          v57.origin.x = v19;
          v57.origin.y = v21;
          v57.size.width = v23;
          v57.size.height = v25;
          v61.origin.x = v27;
          v61.origin.y = v29;
          v61.size.width = v31;
          v61.size.height = v33;
          if (CGRectIntersectsRect(v57, v61))
          {
            v58.origin.x = v19;
            v58.origin.y = v21;
            v58.size.width = v23;
            v58.size.height = v25;
            v62.origin.x = v27;
            v62.origin.y = v29;
            v62.size.width = v31;
            v62.size.height = v33;
            v59 = CGRectIntersection(v58, v62);
            x = v59.origin.x;
            y = v59.origin.y;
            width = v59.size.width;
            height = v59.size.height;
            v48 = CGRectGetWidth(v59);
            v60.origin.x = x;
            v60.origin.y = y;
            v60.size.width = width;
            v60.size.height = height;
            v14 = v48 * CGRectGetHeight(v60);
            if (v14 <= v50)
            {
              v14 = v50;
            }
            else
            {
              objc_msgSend(v16, "convertRectFromOverlayToModel:", v27, v29, v31, v33);
              v46 = v39;
              v47 = v38;
              v44 = v41;
              v45 = v40;
              v42 = v16;

              v12 = v42;
            }
          }
          else
          {
            v14 = v50;
          }

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
    }
    while (v11);
  }
  else
  {
    v12 = 0;
  }

  if (a4)
  {
    a4->origin.x = v47;
    a4->origin.y = v46;
    a4->size.width = v45;
    a4->size.height = v44;
  }

  return v12;
}

+ (BOOL)drawingIsValidForRecognition:(id)a3 withPath:(CGPath *)a4
{
  id v5;
  BOOL v6;

  v5 = a3;
  v6 = a4 && !CGPathIsEmpty(a4) && (!v5 || objc_msgSend(v5, "strokeCount"));

  return v6;
}

- (AKShapeDetectionControllerDelegate)delegate
{
  return (AKShapeDetectionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AKController)controller
{
  return (AKController *)objc_loadWeakRetained((id *)&self->_controller);
}

- (void)setController:(id)a3
{
  objc_storeWeak((id *)&self->_controller, a3);
}

- (AKAnnotation)candidateAnnotation
{
  return (AKAnnotation *)objc_loadWeakRetained((id *)&self->_candidateAnnotation);
}

- (void)setCandidateAnnotation:(id)a3
{
  objc_storeWeak((id *)&self->_candidateAnnotation, a3);
}

- (void)setShapeRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_shapeRecognizer, a3);
}

- (BOOL)preferDoodle
{
  return self->_preferDoodle;
}

- (void)setPreferDoodle:(BOOL)a3
{
  self->_preferDoodle = a3;
}

- (BOOL)coalescesDoodles
{
  return self->_coalescesDoodles;
}

- (void)setCoalescesDoodles:(BOOL)a3
{
  self->_coalescesDoodles = a3;
}

- (BOOL)shapeDetectionEnabled
{
  return self->_shapeDetectionEnabled;
}

- (void)setShapeDetectionEnabled:(BOOL)a3
{
  self->_shapeDetectionEnabled = a3;
}

- (BOOL)isPreviousCandidateAnnotationUndecided
{
  return self->_isPreviousCandidateAnnotationUndecided;
}

- (void)setIsPreviousCandidateAnnotationUndecided:(BOOL)a3
{
  self->_isPreviousCandidateAnnotationUndecided = a3;
}

- (AKPageModelController)modelControllerToObserveForAnnotationsAndSelections
{
  return self->_modelControllerToObserveForAnnotationsAndSelections;
}

- (CHDrawing)lastDrawing
{
  return self->_lastDrawing;
}

- (void)setLastDrawing:(id)a3
{
  objc_storeStrong((id *)&self->_lastDrawing, a3);
}

- (double)veryHighConfidenceLevel
{
  return self->_veryHighConfidenceLevel;
}

- (void)setVeryHighConfidenceLevel:(double)a3
{
  self->_veryHighConfidenceLevel = a3;
}

- (CHDrawing)candidateDrawing
{
  return self->_candidateDrawing;
}

- (void)setCandidateDrawing:(id)a3
{
  objc_storeStrong((id *)&self->_candidateDrawing, a3);
}

- (NSMutableArray)candidateAKTags
{
  return self->_candidateAKTags;
}

- (void)setCandidateAKTags:(id)a3
{
  objc_storeStrong((id *)&self->_candidateAKTags, a3);
}

- (NSMutableDictionary)candidateAKTagsToAnnotationInfoMap
{
  return self->_candidateAKTagsToAnnotationInfoMap;
}

- (void)setCandidateAKTagsToAnnotationInfoMap:(id)a3
{
  objc_storeStrong((id *)&self->_candidateAKTagsToAnnotationInfoMap, a3);
}

- (AKCandidatePickerView_iOS)candidatePickerView
{
  return self->_candidatePickerView;
}

- (void)setCandidatePickerView:(id)a3
{
  objc_storeStrong((id *)&self->_candidatePickerView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidatePickerView, 0);
  objc_storeStrong((id *)&self->_candidateAKTagsToAnnotationInfoMap, 0);
  objc_storeStrong((id *)&self->_candidateAKTags, 0);
  objc_storeStrong((id *)&self->_candidateDrawing, 0);
  objc_storeStrong((id *)&self->_lastDrawing, 0);
  objc_storeStrong((id *)&self->_modelControllerToObserveForAnnotationsAndSelections, 0);
  objc_storeStrong((id *)&self->_shapeRecognizer, 0);
  objc_destroyWeak((id *)&self->_candidateAnnotation);
  objc_destroyWeak((id *)&self->_controller);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
