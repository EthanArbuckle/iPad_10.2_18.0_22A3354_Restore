@implementation AKController

+ (AKController)controllerWithDelegate:(id)a3
{
  id v3;
  AKController *v4;

  v3 = a3;
  v4 = -[AKController initWithDelegate:]([AKController alloc], "initWithDelegate:", v3);

  return v4;
}

+ (id)akBundle
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "akBundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)akBundleIdentifier
{
  return CFSTR("com.apple.AnnotationKit");
}

+ (BOOL)canConnectToStylus
{
  if (qword_255A27068 != -1)
    dispatch_once(&qword_255A27068, &unk_24F1A7198);
  return byte_255A27060;
}

+ (BOOL)hasPressureCapableHardware
{
  if (qword_255A27078 != -1)
    dispatch_once(&qword_255A27078, &unk_24F1A7B58);
  return byte_255A27070;
}

+ (BOOL)_isInLowMemoryEnvironment
{
  if (qword_255A27088 != -1)
    dispatch_once(&qword_255A27088, &unk_24F1A7B78);
  return byte_255A27080;
}

+ (id)markupBarButtonItemWithTarget:(id)a3 action:(SEL)a4
{
  return (id)MEMORY[0x24BEDD108](AKMarkupBarButtonItem, sel_markupBarButtonWithTarget_action_);
}

- (AKController)initWithDelegate:(id)a3
{
  id v4;
  AKController *v5;
  AKController *v6;
  void *v7;
  void *v8;
  void *v9;
  AKModelController *v10;
  AKUndoController *v11;
  AKSidecarController *v12;
  AKLegacyDoodleController *v13;
  void *v14;
  AKToolController *v15;
  AKAttributeController *v16;
  AKActionController *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  AKTextEditorController *v22;
  AKSignatureModelController *v23;
  AKFormFeatureDetectorController *v24;
  AKHighlightAnnotationController *v25;
  AKPeripheralAvailabilityManager_iOS *v26;
  void *v27;
  AKSignaturesController *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)AKController;
  v5 = -[AKController init](&v34, sel_init);
  v6 = v5;
  if (v5)
  {
    -[AKController setIsTestingInstance:](v5, "setIsTestingInstance:", 0);
    -[AKController setDelegate:](v6, "setDelegate:", v4);
    v7 = (void *)objc_opt_new();
    -[AKController setStatisticsLogger:](v6, "setStatisticsLogger:", v7);

    +[AKSparseMutableControllerArray array](AKSparseMutableControllerArray, "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKController setPageControllers:](v6, "setPageControllers:", v8);

    *(_WORD *)&v6->_selectNewlyCreatedAnnotations = 1;
    objc_msgSend(MEMORY[0x24BDD1650], "mapTableWithKeyOptions:valueOptions:", 512, 512);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKController setPageModelControllersToPageControllers:](v6, "setPageModelControllersToPageControllers:", v9);

    -[AKController setCurrentPageIndex:](v6, "setCurrentPageIndex:", 0x7FFFFFFFFFFFFFFFLL);
    -[AKController setAllEditingDisabled:](v6, "setAllEditingDisabled:", 0);
    -[AKController setAnnotationEditingEnabled:](v6, "setAnnotationEditingEnabled:", 0);
    -[AKController setFormFillingEnabled:](v6, "setFormFillingEnabled:", 0);
    -[AKController setPencilAlwaysDraws:](v6, "setPencilAlwaysDraws:", 0);
    v10 = objc_alloc_init(AKModelController);
    -[AKController setModelController:](v6, "setModelController:", v10);

    v11 = -[AKUndoController initWithController:]([AKUndoController alloc], "initWithController:", v6);
    -[AKController setUndoController:](v6, "setUndoController:", v11);

    v12 = -[AKSidecarController initWithController:]([AKSidecarController alloc], "initWithController:", v6);
    -[AKController setSidecarController:](v6, "setSidecarController:", v12);

    v13 = -[AKLegacyDoodleController initWithController:]([AKLegacyDoodleController alloc], "initWithController:", v6);
    -[AKController setLegacyDoodleController:](v6, "setLegacyDoodleController:", v13);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v6, sel_enclosingScrollViewDidScroll_, CFSTR("AKOverlayView.AKContentScrollViewVisibleRectChangeNotification"), 0);

    v15 = -[AKToolController initWithController:]([AKToolController alloc], "initWithController:", v6);
    -[AKController setToolController:](v6, "setToolController:", v15);

    v16 = -[AKAttributeController initWithController:]([AKAttributeController alloc], "initWithController:", v6);
    -[AKController setAttributeController:](v6, "setAttributeController:", v16);

    v17 = -[AKActionController initWithController:]([AKActionController alloc], "initWithController:", v6);
    -[AKController setActionController:](v6, "setActionController:", v17);

    v18 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithController:", v6);
    -[AKController setToolbarViewController:](v6, "setToolbarViewController:", v18);

    -[AKController toolbarViewController](v6, "toolbarViewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKController setToolbarView:](v6, "setToolbarView:", v20);

    v21 = +[AKMainEventHandler newMainEventHandlerForCurrentPlatformWithController:](AKMainEventHandler, "newMainEventHandlerForCurrentPlatformWithController:", v6);
    -[AKController setMainEventHandler:](v6, "setMainEventHandler:", v21);

    v22 = -[AKTextEditorController initWithController:]([AKTextEditorController alloc], "initWithController:", v6);
    -[AKController setTextEditorController:](v6, "setTextEditorController:", v22);

    v23 = -[AKSignatureModelController initWithController:]([AKSignatureModelController alloc], "initWithController:", v6);
    -[AKController setSignatureModelController:](v6, "setSignatureModelController:", v23);

    v24 = -[AKFormFeatureDetectorController initWithController:]([AKFormFeatureDetectorController alloc], "initWithController:", v6);
    -[AKController setFormDetectionController:](v6, "setFormDetectionController:", v24);

    v25 = -[AKHighlightAnnotationController initWithController:]([AKHighlightAnnotationController alloc], "initWithController:", v6);
    -[AKController setHighlightAnnotationController:](v6, "setHighlightAnnotationController:", v25);

    if (+[AKController canConnectToStylus](AKController, "canConnectToStylus"))
    {
      v26 = objc_alloc_init(AKPeripheralAvailabilityManager_iOS);
      -[AKController setPeripheralAvailabilityManager:](v6, "setPeripheralAvailabilityManager:", v26);

      -[AKController peripheralAvailabilityManager](v6, "peripheralAvailabilityManager");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "startMonitoringForPeripheralConnection");

    }
    v28 = -[AKSignaturesController initWithController:]([AKSignaturesController alloc], "initWithController:", v6);
    -[AKController setSignaturesController:](v6, "setSignaturesController:", v28);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addObserver:selector:name:object:", v6, sel__didReceiveMemoryWarning_, *MEMORY[0x24BDF7538], 0);

    -[AKController modelController](v6, "modelController");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addObserver:forKeyPath:options:context:", v6, CFSTR("pageModelControllers"), 3, CFSTR("AKController.modelObservationContext"));

    -[AKController addObserver:forKeyPath:options:context:](v6, "addObserver:forKeyPath:options:context:", v6, CFSTR("currentPageIndex"), 3, CFSTR("AKController.pageIndexObservationContext"));
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addObserver:selector:name:object:", v6, sel__pageModelControllerSelectedAnnotationsChangedNotification_, off_255A25E08[0], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addObserver:selector:name:object:", v6, sel__didScrollPDFPage_, CFSTR("PDFScrollViewPageMayHaveChangedNotification"), 0);

  }
  return v6;
}

- (id)initForTesting
{
  AKController *v2;
  AKController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AKController;
  v2 = -[AKController init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[AKController setIsTestingInstance:](v2, "setIsTestingInstance:", 1);
  return v3;
}

- (void)teardown
{
  AKController *v2;
  void *v3;
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
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  AKController *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  id obj;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v2 = self;
  v44 = *MEMORY[0x24BDAC8D0];
  -[AKController setIsTornDown:](self, "setIsTornDown:", 1);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("AKControllerWillTeardownNotification"), v2);

  if (!-[AKController isTestingInstance](v2, "isTestingInstance"))
  {
    -[AKController undoController](v2, "undoController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "undoManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = objc_msgSend(v5, "isUndoRegistrationEnabled");
    if (v30)
      objc_msgSend(v5, "disableUndoRegistration");
    v31 = v5;
    -[AKController resetToDefaultToolMode](v2, "resetToDefaultToolMode");
    -[AKController mainEventHandler](v2, "mainEventHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "teardown");

    -[AKController toolbarViewController](v2, "toolbarViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "teardown");

    -[AKController peripheralAvailabilityManager](v2, "peripheralAvailabilityManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "teardown");

    -[AKController attributeController](v2, "attributeController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setModelControllerToObserveForSelections:", 0);

    -[AKController legacyDoodleController](v2, "legacyDoodleController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "shapeDetectionController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setModelControllerToObserveForAnnotationsAndSelections:", 0);

    -[AKController modelController](v2, "modelController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObserver:forKeyPath:context:", v2, CFSTR("pageModelControllers"), CFSTR("AKController.modelObservationContext"));

    -[AKController removeObserver:forKeyPath:context:](v2, "removeObserver:forKeyPath:context:", v2, CFSTR("currentPageIndex"), CFSTR("AKController.pageIndexObservationContext"));
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    -[AKController modelController](v2, "modelController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "pageModelControllers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v14;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    if (v15)
    {
      v16 = v15;
      v33 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          v18 = v2;
          if (*(_QWORD *)v39 != v33)
            objc_enumerationMutation(obj);
          v19 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          v34 = 0u;
          v35 = 0u;
          v36 = 0u;
          v37 = 0u;
          objc_msgSend(v19, "annotations");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
          if (v21)
          {
            v22 = v21;
            v23 = *(_QWORD *)v35;
            do
            {
              for (j = 0; j != v22; ++j)
              {
                if (*(_QWORD *)v35 != v23)
                  objc_enumerationMutation(v20);
                v25 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
                if (objc_msgSend(v25, "shouldObserveEdits"))
                  objc_msgSend(v25, "setShouldObserveEdits:", 0);
                if (objc_msgSend(v25, "shouldUseAppearanceOverride"))
                  objc_msgSend(v25, "setShouldUseAppearanceOverride:", 0);
                objc_msgSend(v25, "appearanceOverride");
                v26 = (void *)objc_claimAutoreleasedReturnValue();

                if (v26)
                  objc_msgSend(v25, "setAppearanceOverride:", 0);
              }
              v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
            }
            while (v22);
          }

          v2 = v18;
          -[AKController sidecarController](v18, "sidecarController");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "stopObservingPageModelController:", v19);

          -[AKController undoController](v18, "undoController");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "stopObservingPageModelController:", v19);

        }
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      }
      while (v16);
    }

    -[AKController setDelegate:](v2, "setDelegate:", 0);
    -[AKController setSignatureModelController:](v2, "setSignatureModelController:", 0);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "removeObserver:", v2);

    -[AKController setLegacyDoodleController:](v2, "setLegacyDoodleController:", 0);
    -[AKController setTextEditorController:](v2, "setTextEditorController:", 0);
    -[AKController setMainEventHandler:](v2, "setMainEventHandler:", 0);
    -[AKController setToolbarView:](v2, "setToolbarView:", 0);
    -[AKController setToolbarViewController:](v2, "setToolbarViewController:", 0);
    -[AKController setActionController:](v2, "setActionController:", 0);
    -[AKController setAttributeController:](v2, "setAttributeController:", 0);
    -[AKController setToolController:](v2, "setToolController:", 0);
    -[AKController setUndoController:](v2, "setUndoController:", 0);
    -[AKController setModelController:](v2, "setModelController:", 0);
    -[AKController setPeripheralAvailabilityManager:](v2, "setPeripheralAvailabilityManager:", 0);
    if (v30)
    {
      if ((objc_msgSend(v31, "isUndoRegistrationEnabled") & 1) == 0)
        objc_msgSend(v31, "enableUndoRegistration");
    }

  }
}

- (void)dealloc
{
  objc_super v3;

  AKLog(CFSTR("%s (If you do not see this in a debug build, we've got a world leak to fix.)"));
  v3.receiver = self;
  v3.super_class = (Class)AKController;
  -[AKController dealloc](&v3, sel_dealloc, "-[AKController dealloc]");
}

- (void)_didScrollPDFPage:(id)a3
{
  id v4;

  -[AKController modernToolbarView](self, "modernToolbarView", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateCurrentOverlaysToolPickerVisibility:", self->_toolPickerVisibleBeforeTextEditing);

}

- (void)toolPickerVisibilityDidChange:(id)a3
{
  if (!self->_isEditingAnnotation)
    self->_toolPickerVisibleBeforeTextEditing = objc_msgSend(a3, "isVisible");
}

- (void)didBeginEditingAnnotation:(id)a3
{
  id v4;

  self->_isEditingAnnotation = 1;
  -[AKController modernToolbarView](self, "modernToolbarView", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  self->_toolPickerVisibleBeforeTextEditing = objc_msgSend(v4, "isToolPickerVisible");

}

- (void)didEndEditingAnnotation:(id)a3
{
  self->_isEditingAnnotation = 0;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  unint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t k;
  void *v59;
  void *v60;
  char v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v66;
  void *v67;
  void *v68;
  uint64_t v69;
  id v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  unint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  id v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  id v100;
  id v101;
  id v102;
  void *v103;
  void *v104;
  void *v105;
  uint64_t v106;
  objc_super v107;
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
  _BYTE v120[128];
  _BYTE v121[128];
  _BYTE v122[128];
  uint64_t v123;

  v123 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (a6 != CFSTR("AKController.pageIndexObservationContext"))
  {
    if (a6 != CFSTR("AKController.modelObservationContext"))
    {
      v107.receiver = self;
      v107.super_class = (Class)AKController;
      -[AKController observeValueForKeyPath:ofObject:change:context:](&v107, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
      goto LABEL_75;
    }
    v100 = v11;
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BDD0E68]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", *MEMORY[0x24BDD0E60]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", *MEMORY[0x24BDD0E80]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", *MEMORY[0x24BDD0E70]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v103 = v19;
    v104 = v18;
    v105 = v20;
    v96 = v17;
    v98 = v13;
    if (v19)
    {
      v118 = 0u;
      v119 = 0u;
      v116 = 0u;
      v117 = 0u;
      v21 = v19;
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v116, v122, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v117;
        do
        {
          for (i = 0; i != v23; ++i)
          {
            if (*(_QWORD *)v117 != v24)
              objc_enumerationMutation(v21);
            v26 = *(_QWORD *)(*((_QWORD *)&v116 + 1) + 8 * i);
            -[AKController undoController](self, "undoController", v96, v98);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "stopObservingPageModelController:", v26);

            -[AKController sidecarController](self, "sidecarController");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "stopObservingPageModelController:", v26);

            -[AKController pageModelControllersToPageControllers](self, "pageModelControllersToPageControllers");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "objectForKey:", v26);
            v30 = (void *)objc_claimAutoreleasedReturnValue();

            -[AKController undoController](self, "undoController");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "undoManager");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "unregisterFromUndoManager:", v32);

            objc_msgSend(v30, "teardown");
            -[AKController pageModelControllersToPageControllers](self, "pageModelControllersToPageControllers");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "removeObjectForKey:", v26);

          }
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v116, v122, 16);
        }
        while (v23);
      }

      v17 = v96;
      v13 = v98;
      v19 = v103;
      v18 = v104;
      v20 = v105;
    }
    if (v20)
    {
      v114 = 0u;
      v115 = 0u;
      v112 = 0u;
      v113 = 0u;
      v34 = v20;
      v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v112, v121, 16);
      if (v35)
      {
        v36 = v35;
        v37 = *(_QWORD *)v113;
        do
        {
          for (j = 0; j != v36; ++j)
          {
            if (*(_QWORD *)v113 != v37)
              objc_enumerationMutation(v34);
            -[AKController _setupPageModelController:](self, "_setupPageModelController:", *(_QWORD *)(*((_QWORD *)&v112 + 1) + 8 * j), v96, v98);
          }
          v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v112, v121, 16);
        }
        while (v36);
      }

      v20 = v105;
    }
    if (objc_msgSend(v17, "unsignedIntegerValue", v96, v98) == 4 && objc_msgSend(v18, "count"))
    {
      v39 = 0;
      do
      {
        if (v39 < objc_msgSend(v19, "count") && v39 < objc_msgSend(v20, "count"))
        {
          objc_msgSend(v19, "objectAtIndexedSubscript:", v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectAtIndexedSubscript:", v39);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          -[AKController attributeController](self, "attributeController");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "modelControllerToObserveForSelections");
          v43 = (void *)objc_claimAutoreleasedReturnValue();

          if (v40 == v43)
          {
            -[AKController attributeController](self, "attributeController");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "setModelControllerToObserveForSelections:", v41);

          }
          -[AKController legacyDoodleController](self, "legacyDoodleController");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "shapeDetectionController");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "modelControllerToObserveForAnnotationsAndSelections");
          v47 = (void *)objc_claimAutoreleasedReturnValue();

          if (v40 == v47)
          {
            -[AKController legacyDoodleController](self, "legacyDoodleController");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "shapeDetectionController");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "setModelControllerToObserveForAnnotationsAndSelections:", v41);

          }
          v19 = v103;
          v18 = v104;
          v20 = v105;
        }
        ++v39;
      }
      while (v39 < objc_msgSend(v18, "count"));
    }
    v50 = v17;
    -[AKController pageControllers](self, "pageControllers");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "removeAllObjects");

    v110 = 0u;
    v111 = 0u;
    v108 = 0u;
    v109 = 0u;
    -[AKController modelController](self, "modelController");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "pageModelControllers");
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v108, v120, 16);
    if (v54)
    {
      v55 = v54;
      v106 = 0;
      v56 = *(_QWORD *)v109;
      v57 = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        for (k = 0; k != v55; ++k)
        {
          if (*(_QWORD *)v109 != v56)
            objc_enumerationMutation(v53);
          v59 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * k);
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = objc_msgSend(v59, "isEqual:", v60);

          if ((v61 & 1) == 0)
          {
            -[AKController pageModelControllersToPageControllers](self, "pageModelControllersToPageControllers");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v62, "objectForKey:", v59);
            v63 = (void *)objc_claimAutoreleasedReturnValue();

            if (v63)
            {
              -[AKController pageControllers](self, "pageControllers");
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v64, "replaceObjectAtIndex:withObject:", v106 + k, v63);

              objc_msgSend(v63, "setPageIndex:", v106 + k);
              if (v106 + k > v57 || v57 == 0x7FFFFFFFFFFFFFFFLL)
                v57 = v106 + k;
            }

          }
        }
        v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v108, v120, 16);
        v106 += k;
      }
      while (v55);

      v66 = 0x7FFFFFFFFFFFFFFFLL;
      v11 = v100;
      v67 = v97;
      v13 = v99;
      v68 = v103;
      if (v57 != 0x7FFFFFFFFFFFFFFFLL)
      {
        if (-[AKController currentPageIndex](self, "currentPageIndex") == 0x7FFFFFFFFFFFFFFFLL)
        {
          v66 = v57;
        }
        else
        {
          v66 = v57;
          if (-[AKController currentPageIndex](self, "currentPageIndex") < v57)
            goto LABEL_64;
        }
      }
    }
    else
    {

      v66 = 0x7FFFFFFFFFFFFFFFLL;
      v11 = v100;
      v68 = v103;
      v67 = v50;
    }
    -[AKController setCurrentPageIndex:](self, "setCurrentPageIndex:", v66);
LABEL_64:
    if (-[AKController currentPageIndex](self, "currentPageIndex") != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[AKController modelController](self, "modelController");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "pageModelControllers");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "objectAtIndex:", -[AKController currentPageIndex](self, "currentPageIndex"));
      v77 = (void *)objc_claimAutoreleasedReturnValue();

      -[AKController attributeController](self, "attributeController");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "setModelControllerToObserveForSelections:", v77);

      -[AKController legacyDoodleController](self, "legacyDoodleController");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "shapeDetectionController");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "setModelControllerToObserveForAnnotationsAndSelections:", v77);

    }
    goto LABEL_75;
  }
  objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BDD0E80]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", *MEMORY[0x24BDD0E70]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    v16 = objc_msgSend(v14, "unsignedIntegerValue");
  else
    v16 = 0x7FFFFFFFFFFFFFFFLL;
  v102 = v10;
  if (v15)
    v69 = objc_msgSend(v15, "unsignedIntegerValue");
  else
    v69 = 0x7FFFFFFFFFFFFFFFLL;
  if (v16 != v69)
  {
    if (-[AKController toolMode](self, "toolMode") == 6)
    {
      v70 = v11;
      -[AKController modelController](self, "modelController");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "pageModelControllerForPage:", v16);
      v72 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v72, "cropAnnotation");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = v73;
      if (v73 && objc_msgSend(v73, "cropApplied"))
        objc_msgSend(v74, "setShowHandles:", 0);
      else
        objc_msgSend(v72, "removeCropToolAnnotation");
      -[AKController resetToDefaultToolMode](self, "resetToDefaultToolMode");

      v11 = v70;
    }
    -[AKController setPasteCascadingMultiplier:](self, "setPasteCascadingMultiplier:", 0);
    if (v16 != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[AKController pageControllers](self, "pageControllers");
      v101 = v11;
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = objc_msgSend(v81, "count");

      v11 = v101;
      if (v16 < v82)
      {
        -[AKController pageControllers](self, "pageControllers");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "objectAtIndex:", v16);
        v84 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v84, "pageModelController");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "mutableSetValueForKey:", CFSTR("selectedAnnotations"));
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCF20], "set");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "setSet:", v87);

        v11 = v101;
      }
    }
    if (v69 != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[AKController pageControllers](self, "pageControllers");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "objectAtIndex:", v69);
      v89 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v89, "pageModelController");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKController attributeController](self, "attributeController");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "setModelControllerToObserveForSelections:", v90);

      -[AKController legacyDoodleController](self, "legacyDoodleController");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "shapeDetectionController");
      v93 = v11;
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "setModelControllerToObserveForAnnotationsAndSelections:", v90);

      v11 = v93;
      -[AKController modernToolbarView](self, "modernToolbarView");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v95, "updateCurrentOverlaysToolPickerVisibility");

    }
  }

  v10 = v102;
LABEL_75:

}

- (void)_setupPageModelController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "representedObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    +[AKPageController pageControllerWithController:andPageModelController:](AKPageController, "pageControllerWithController:andPageModelController:", self, v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setShouldPixelate:", -[AKController overlayShouldPixelate](self, "overlayShouldPixelate"));
    -[AKController pageModelControllersToPageControllers](self, "pageModelControllersToPageControllers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v5, v9);

    -[AKController undoController](self, "undoController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "startObservingPageModelController:", v9);

    -[AKController sidecarController](self, "sidecarController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "startObservingPageModelController:", v9);

  }
}

- (void)enclosingScrollViewDidScroll:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;

  -[AKController legacyDoodleController](self, "legacyDoodleController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "shapeDetectionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isShowingCandidatePicker");

  if (v6)
  {
    -[AKController legacyDoodleController](self, "legacyDoodleController");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "shapeDetectionController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dismissCandidatePicker");

  }
}

- (BOOL)validateSender:(id)a3
{
  id v4;
  char *v5;
  id v6;
  void *v7;
  NSString *v8;
  void *v9;
  char v10;
  BOOL v11;
  char *v13;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_23;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (char *)objc_msgSend(v4, "action");
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v4;
    objc_msgSend(v6, "actionsForTarget:forControlEvent:", 0, 251658240);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = (char *)NSSelectorFromString(v8);
    if ((unint64_t)objc_msgSend(v7, "count") >= 2)
      NSLog(CFSTR("Warning: multiple actions for sender: %@ event: UIControlEventApplicationReserved. Behavior is undefined."), v6);

    goto LABEL_11;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "methodSignatureForSelector:", sel_action);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v5 = 0;
      goto LABEL_12;
    }
    objc_msgSend(MEMORY[0x24BDBCE98], "invocationWithMethodSignature:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSelector:", sel_action);
    objc_msgSend(v7, "setTarget:", v4);
    v13 = 0;
    objc_msgSend(v7, "invoke");
    objc_msgSend(v7, "getReturnValue:", &v13);
    v5 = v13;
LABEL_11:

LABEL_12:
    goto LABEL_14;
  }
  v5 = 0;
LABEL_14:
  if (v5 == sel_undo_)
  {
    v11 = -[AKController validateUndo:](self, "validateUndo:", v4);
LABEL_34:
    v10 = v11;
    goto LABEL_35;
  }
  if (v5 == sel_redo_)
  {
    v11 = -[AKController validateRedo:](self, "validateRedo:", v4);
    goto LABEL_34;
  }
  if (v5 == sel_cut_)
  {
    v11 = -[AKController validateCut:](self, "validateCut:", v4);
    goto LABEL_34;
  }
  if (v5 == sel_copy_)
  {
    v11 = -[AKController validateCopy:](self, "validateCopy:", v4);
    goto LABEL_34;
  }
  if (v5 == sel_paste_)
  {
    v11 = -[AKController validatePaste:](self, "validatePaste:", v4);
    goto LABEL_34;
  }
  if (v5 == sel_delete_)
  {
    v11 = -[AKController validateDelete:](self, "validateDelete:", v4);
    goto LABEL_34;
  }
  if (v5 == sel_duplicate_)
  {
    v11 = -[AKController validateDuplicate:](self, "validateDuplicate:", v4);
    goto LABEL_34;
  }
  if (v5 == sel_selectAll_)
  {
    v11 = -[AKController validateSelectAll:](self, "validateSelectAll:", v4);
    goto LABEL_34;
  }
  if (v5 == sel_showAttributeInspector_)
  {
    v11 = -[AKController validateShowAttributeInspector:](self, "validateShowAttributeInspector:", v4);
    goto LABEL_34;
  }
LABEL_23:
  -[AKController actionController](self, "actionController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "validateSender:", v4);

LABEL_35:
  return v10;
}

- (void)performActionForSender:(id)a3
{
  char *v4;
  id v5;
  void *v6;
  NSString *v7;
  void *v8;
  id v9;

  v9 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = (char *)objc_msgSend(v9, "action");
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v5 = v9;
        objc_msgSend(v5, "actionsForTarget:forControlEvent:", 0, 251658240);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "firstObject");
        v7 = (NSString *)objc_claimAutoreleasedReturnValue();
        v4 = (char *)NSSelectorFromString(v7);
        if ((unint64_t)objc_msgSend(v6, "count") >= 2)
          NSLog(CFSTR("Warning: multiple actions for sender: %@ event: UIControlEventApplicationReserved. Behavior is undefined."), v5);

      }
      else
      {
        v4 = 0;
      }
    }
    if (v4 == sel_undo_)
    {
      -[AKController undo:](self, "undo:", v9);
      goto LABEL_28;
    }
    if (v4 == sel_redo_)
    {
      -[AKController redo:](self, "redo:", v9);
      goto LABEL_28;
    }
    if (v4 == sel_cut_)
    {
      -[AKController cut:](self, "cut:", v9);
      goto LABEL_28;
    }
    if (v4 == sel_copy_)
    {
      -[AKController copy:](self, "copy:", v9);
      goto LABEL_28;
    }
    if (v4 == sel_paste_)
    {
      -[AKController paste:](self, "paste:", v9);
      goto LABEL_28;
    }
    if (v4 == sel_delete_)
    {
      -[AKController delete:](self, "delete:", v9);
      goto LABEL_28;
    }
    if (v4 == sel_duplicate_)
    {
      -[AKController duplicate:](self, "duplicate:", v9);
      goto LABEL_28;
    }
    if (v4 == sel_selectAll_)
    {
      -[AKController selectAll:](self, "selectAll:", v9);
      goto LABEL_28;
    }
    if (v4 == sel_showAttributeInspector_)
    {
      -[AKController showAttributeInspector:](self, "showAttributeInspector:", v9);
      goto LABEL_28;
    }
  }
  -[AKController actionController](self, "actionController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "performActionForSender:", v9);

LABEL_28:
}

- (id)overlayViewAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[AKController pageControllers](self, "pageControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "overlayView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isOverlayViewLoadedAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  char v6;

  -[AKController pageControllers](self, "pageControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = objc_msgSend(v5, "relinquishablesAreLoaded");
  else
    v6 = 0;

  return v6;
}

- (void)setRulerHostingDelegate:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_storeWeak((id *)&self->_rulerHostingDelegate, v4);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[AKController pageControllers](self, "pageControllers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9), "inkPageOverlayController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setRulerHostingDelegate:", v4);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)prepareOverlayAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[AKController pageControllers](self, "pageControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setupRelinquishables");
  -[AKController rulerHostingDelegate](self, "rulerHostingDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v8, "inkPageOverlayController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRulerHostingDelegate:", v6);

  }
}

- (void)relinquishOverlayAtIndex:(unint64_t)a3
{
  void *v4;
  id v5;

  -[AKController pageControllers](self, "pageControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "releaseRelinquishables");
}

- (void)updateOverlayViewAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  id v6;

  -[AKController pageControllers](self, "pageControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "relinquishablesAreLoaded"))
  {
    objc_msgSend(v6, "overlayView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updateLayers");

  }
}

- (void)renderAnnotation:(id)a3 inContext:(CGContext *)a4
{
  +[AKAnnotationRenderer renderAnnotation:intoContext:forDisplay:pageControllerOrNil:](AKAnnotationRenderer, "renderAnnotation:intoContext:forDisplay:pageControllerOrNil:", a3, a4, 0, 0);
}

+ (void)renderAnnotation:(id)a3 inContext:(CGContext *)a4
{
  +[AKAnnotationRenderer renderAnnotation:intoContext:forDisplay:pageControllerOrNil:](AKAnnotationRenderer, "renderAnnotation:intoContext:forDisplay:pageControllerOrNil:", a3, a4, 0, 0);
}

- (void)setOverlayShouldPixelate:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (self->overlayShouldPixelate != a3)
  {
    v3 = a3;
    self->overlayShouldPixelate = a3;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[AKController pageControllers](self, "pageControllers", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
          objc_msgSend(v9, "setShouldPixelate:", v3);
          if (objc_msgSend(v9, "relinquishablesAreLoaded"))
          {
            objc_msgSend(v9, "layerPresentationManager");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "setShouldPixelate:", v3);

          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }

  }
}

- (void)editTextAnnotation:(id)a3 selectAllText:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;

  v4 = a4;
  v6 = a3;
  -[AKController pageControllerForAnnotation:](self, "pageControllerForAnnotation:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[AKController textEditorController](self, "textEditorController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "beginEditingAnnotation:withPageController:selectAllText:", v6, v8, v4);

}

- (void)endEditingTextAnnotation
{
  void *v3;
  int v4;
  id v5;

  -[AKController textEditorController](self, "textEditorController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEditing");

  if (v4)
  {
    -[AKController textEditorController](self, "textEditorController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endEditing");

  }
}

- (void)commitEditing
{
  void *v3;
  id v4;

  -[AKController textEditorController](self, "textEditorController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commitToModelWithoutEndingEditing");

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", AKControllerWillSaveNotification, self);

}

- (int64_t)currentExifOrientationForPageAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  int64_t v6;

  -[AKController pageControllers](self, "pageControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "currentModelToScreenExifOrientation");
  return v6;
}

- (double)currentModelBaseScaleFactorForPageAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;

  -[AKController pageControllers](self, "pageControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "modelBaseScaleFactor");
  v7 = v6;

  return v7;
}

- (CGRect)contentAlignedRectForRect:(CGRect)a3 onPageAtIndex:(unint64_t)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v9;
  void *v10;
  void *v11;
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
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[AKController pageControllers](self, "pageControllers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndex:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "geometryHelper");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contentAlignedRectForRect:", x, y, width, height);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  v20 = v13;
  v21 = v15;
  v22 = v17;
  v23 = v19;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

+ (void)adjustAnnotationBoundsToFitText:(id)a3
{
  MEMORY[0x24BEDD108](AKTextAnnotationAttributeHelper, sel_adjustAnnotationBoundsToFitText_);
}

- (BOOL)handleEvent:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[AKController mainEventHandler](self, "mainEventHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "mainHandleEvent:orRecognizer:", v4, 0);

  return v6;
}

- (id)tapGestureRecognizer
{
  void *v2;
  void *v3;

  -[AKController mainEventHandler](self, "mainEventHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tapRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)doubleTapGestureRecognizer
{
  void *v2;
  void *v3;

  -[AKController mainEventHandler](self, "mainEventHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleTapRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)pressGestureRecognizer
{
  void *v2;
  void *v3;

  -[AKController mainEventHandler](self, "mainEventHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pressRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)panGestureRecognizer
{
  void *v2;
  void *v3;

  -[AKController mainEventHandler](self, "mainEventHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "panRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)rotationGestureRecognizer
{
  void *v2;
  void *v3;

  -[AKController mainEventHandler](self, "mainEventHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rotationRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_updateGestureDependencyPriority
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[AKController pageControllers](self, "pageControllers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6), "inkPageOverlayController");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "_updateGestureDependencyPriority");

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (id)toolbarButtonItemOfType:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[AKController toolbarViewController](self, "toolbarViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_toolbarButtonItemOfType:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)imageForToolbarButtonItemOfType:(unint64_t)a3
{
  return +[AKToolbarViewController imageForToolbarButtonItemOfType:](AKToolbarViewController, "imageForToolbarButtonItemOfType:", a3);
}

- (void)setAnnotationEditingEnabled:(BOOL)a3
{
  void *v4;
  int v5;
  void *v6;
  id v7;

  self->_annotationEditingEnabled = a3;
  if (!a3)
  {
    -[AKController textEditorController](self, "textEditorController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEditing");

    if (v5)
    {
      -[AKController textEditorController](self, "textEditorController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "endEditing");

    }
    if (-[AKController supportForPencilAlwaysDrawsSatisfied](self, "supportForPencilAlwaysDrawsSatisfied"))
    {
      -[AKController attributeController](self, "attributeController");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "resetToLastDrawingInk");

    }
  }
}

- (void)setFormFillingEnabled:(BOOL)a3
{
  void *v4;
  int v5;
  id v6;

  self->_formFillingEnabled = a3;
  if (!a3)
  {
    -[AKController textEditorController](self, "textEditorController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEditing");

    if (v5)
    {
      -[AKController textEditorController](self, "textEditorController");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "endEditing");

    }
  }
}

- (id)keyCommandsForAnnotations
{
  NSArray *cachedKeyCommands;
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
  void *v17;
  void *v18;
  void *v19;
  NSArray *v20;
  NSArray *v21;

  cachedKeyCommands = self->_cachedKeyCommands;
  if (!cachedKeyCommands)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[AKController akBundle](AKController, "akBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Copy"), &stru_24F1A83D0, CFSTR("AKController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    sub_229014DA0((uint64_t)v6, (uint64_t)CFSTR("c"), 0x100000, (uint64_t)sel_copy_, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v7);

    +[AKController akBundle](AKController, "akBundle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Cut"), &stru_24F1A83D0, CFSTR("AKController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    sub_229014DA0((uint64_t)v9, (uint64_t)CFSTR("x"), 0x100000, (uint64_t)sel_cut_, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v10);

    +[AKController akBundle](AKController, "akBundle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Paste"), &stru_24F1A83D0, CFSTR("AKController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    sub_229014DA0((uint64_t)v12, (uint64_t)CFSTR("v"), 0x100000, (uint64_t)sel_paste_, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v13);

    +[AKController akBundle](AKController, "akBundle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Delete"), &stru_24F1A83D0, CFSTR("AKController"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    sub_229014DA0((uint64_t)v15, (uint64_t)CFSTR("\b"), 0, (uint64_t)sel_delete_, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v16);

    +[AKController akBundle](AKController, "akBundle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Duplicate"), &stru_24F1A83D0, CFSTR("AKController"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    sub_229014DA0((uint64_t)v18, (uint64_t)CFSTR("d"), 0x100000, (uint64_t)sel_duplicate_, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v19);

    v20 = (NSArray *)objc_msgSend(v4, "copy");
    v21 = self->_cachedKeyCommands;
    self->_cachedKeyCommands = v20;

    cachedKeyCommands = self->_cachedKeyCommands;
  }
  return cachedKeyCommands;
}

- (BOOL)canPerformKeyCommandAction:(SEL)a3 withSender:(id)a4 handled:(BOOL *)a5
{
  id v8;
  BOOL v9;
  BOOL v10;
  BOOL v12;

  v8 = a4;
  if (v8 && -[NSArray containsObject:](self->_cachedKeyCommands, "containsObject:", v8))
  {
    if (sel_duplicate_ == a3)
    {
      v12 = -[AKController validateDuplicate:](self, "validateDuplicate:", v8);
    }
    else if (sel_delete_ == a3)
    {
      v12 = -[AKController validateDelete:](self, "validateDelete:", v8);
    }
    else if (sel_cut_ == a3)
    {
      v12 = -[AKController validateCut:](self, "validateCut:", v8);
    }
    else if (sel_copy_ == a3)
    {
      v12 = -[AKController validateCopy:](self, "validateCopy:", v8);
    }
    else
    {
      if (sel_paste_ != a3)
      {
        v9 = 0;
        goto LABEL_18;
      }
      v12 = -[AKController validatePaste:](self, "validatePaste:", v8);
    }
    v9 = v12;
LABEL_18:
    v10 = 1;
    if (!a5)
      goto LABEL_11;
    goto LABEL_10;
  }
  v9 = 0;
  v10 = 0;
  if (a5)
LABEL_10:
    *a5 = v10;
LABEL_11:

  return v9;
}

- (void)setPencilAlwaysDraws:(BOOL)a3
{
  self->_pencilAlwaysDraws = +[AKController canConnectToStylus](AKController, "canConnectToStylus") && a3;
}

- (unint64_t)toolMode
{
  void *v2;
  unint64_t v3;

  -[AKController toolController](self, "toolController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "toolMode");

  return v3;
}

- (void)setToolMode:(unint64_t)a3
{
  id v4;

  -[AKController toolController](self, "toolController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setToolMode:", a3);

}

- (void)resetToDefaultToolMode
{
  id v2;

  -[AKController toolController](self, "toolController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resetToDefaultMode");

}

- (void)applyCurrentCrop
{
  void *v3;
  void *v4;
  id v5;

  if (-[AKController toolMode](self, "toolMode") == 6)
  {
    -[AKController modelController](self, "modelController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pageModelControllerForPage:", -[AKController currentPageIndex](self, "currentPageIndex"));
    v5 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "cropAnnotation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCropApplied:", 1);
    -[AKController resetToDefaultToolMode](self, "resetToDefaultToolMode");

  }
}

- (void)clearUndoStack
{
  void *v2;
  id v3;

  -[AKController undoController](self, "undoController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "undoManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllActions");

}

- (BOOL)supportsImageDescriptionEditing
{
  void *v2;
  char v3;

  -[AKController delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "supportsImageDescriptionEditing");
  else
    v3 = 0;

  return v3;
}

- (BOOL)supportsFormFill
{
  void *v2;
  char v3;

  -[AKController delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "supportsFormFill");
  else
    v3 = 0;

  return v3;
}

- (id)originalOrModifiedImageDescription
{
  void *v3;
  void *v4;

  -[AKController modifiedImageDescription](self, "modifiedImageDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[AKController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v4, "originalImageDescription");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }

  }
  return v3;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v4;
  unsigned __int8 v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("modifiedImageDescription")) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___AKController;
    v5 = objc_msgSendSuper2(&v7, sel_automaticallyNotifiesObserversForKey_, v4);
  }

  return v5;
}

- (void)setModifiedImageDescription:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  NSString *v8;

  v8 = (NSString *)a3;
  if (self->_modifiedImageDescription != v8)
  {
    -[AKController originalOrModifiedImageDescription](self, "originalOrModifiedImageDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v5 || -[NSString length](v8, "length")) && (objc_msgSend(v5, "isEqualToString:", v8) & 1) == 0)
    {
      -[AKController undoController](self, "undoController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "undoManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "registerUndoWithTarget:selector:object:", self, sel_setModifiedImageDescription_, self->_modifiedImageDescription);

      -[AKController willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("modifiedImageDescription"));
      objc_storeStrong((id *)&self->_modifiedImageDescription, a3);
      -[AKController didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("modifiedImageDescription"));
    }

  }
}

- (void)delayedUndoControllerSetup
{
  AKUndoController *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = -[AKUndoController initWithController:]([AKUndoController alloc], "initWithController:", self);
  -[AKController setUndoController:](self, "setUndoController:", v3);

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[AKController pageControllers](self, "pageControllers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v8);
        -[AKController undoController](self, "undoController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "pageModelController");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "startObservingPageModelController:", v11);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

- (void)undo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  if (-[AKController validateUndo:](self, "validateUndo:", 0))
  {
    -[AKController textEditorController](self, "textEditorController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endEditing");

    -[AKController undoController](self, "undoController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "undoManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "undo");

  }
}

- (BOOL)validateUndo:(id)a3
{
  void *v3;
  void *v4;

  -[AKController undoController](self, "undoController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "undoManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v4, "canUndo");
  return (char)v3;
}

- (void)redo:(id)a3
{
  void *v4;
  id v5;

  if (-[AKController validateRedo:](self, "validateRedo:", 0))
  {
    -[AKController undoController](self, "undoController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "undoManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "redo");

  }
}

- (BOOL)validateRedo:(id)a3
{
  void *v3;
  void *v4;

  -[AKController undoController](self, "undoController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "undoManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v4, "canRedo");
  return (char)v3;
}

- (void)cut:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (-[AKController validateCut:](self, "validateCut:", 0))
  {
    -[AKController copy:](self, "copy:", v8);
    -[AKController setPasteCascadingMultiplier:](self, "setPasteCascadingMultiplier:", 0);
    -[AKController delete:](self, "delete:", v8);
    -[AKController undoController](self, "undoController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "undoManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[AKController akBundle](AKController, "akBundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Cut"), &stru_24F1A83D0, CFSTR("AKController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setActionName:", v7);

  }
}

- (void)copy:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  if (-[AKController validateCopy:](self, "validateCopy:", 0))
  {
    -[AKController modelController](self, "modelController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allSelectedAnnotations");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "count"))
    {
      objc_msgSend(MEMORY[0x24BDF6C40], "generalPasteboard");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "akClearContents");
      objc_msgSend(v5, "akPasteboardSetAnnotations:", v6);
      -[AKController setLastPasteboardChangeCount:](self, "setLastPasteboardChangeCount:", objc_msgSend(v5, "changeCount"));
      -[AKController setPasteCascadingMultiplier:](self, "setPasteCascadingMultiplier:", 1);

    }
  }
}

- (void)paste:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  if (-[AKController validatePaste:](self, "validatePaste:", 0))
  {
    objc_msgSend(MEMORY[0x24BDF6C40], "generalPasteboard");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "akPasteboardAnnotations");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {
      v5 = objc_msgSend(v20, "changeCount");
      if (-[AKController lastPasteboardChangeCount](self, "lastPasteboardChangeCount") != v5)
      {
        -[AKController setLastPasteboardChangeCount:](self, "setLastPasteboardChangeCount:", v5);
        -[AKController setPasteCascadingMultiplier:](self, "setPasteCascadingMultiplier:", 0);
      }
      -[AKController currentPageController](self, "currentPageController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "pageModelController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "hasMaskBorderAnnotation");

      if (v8)
      {
        objc_msgSend(v4, "indexesOfObjectsPassingTest:", &unk_24F1A7BB8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectsAtIndexes:", v9);
        v10 = objc_claimAutoreleasedReturnValue();

        v4 = (void *)v10;
      }
      if (objc_msgSend(v4, "count"))
      {
        +[AKToolController cascadeAnnotations:onPageController:forPaste:](AKToolController, "cascadeAnnotations:onPageController:forPaste:", v4, v6, 1);
        objc_msgSend(v6, "pageModelController");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "mutableArrayValueForKey:", CFSTR("annotations"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObjectsFromArray:", v4);

        objc_msgSend(v6, "pageModelController");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "mutableSetValueForKey:", CFSTR("selectedAnnotations"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v4);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setSet:", v15);

        -[AKController undoController](self, "undoController");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "undoManager");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        +[AKController akBundle](AKController, "akBundle");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("Paste"), &stru_24F1A83D0, CFSTR("AKController"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setActionName:", v19);

      }
    }

  }
}

- (BOOL)validatePaste:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  BOOL v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDF6C40], "generalPasteboard");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "akPasteboardContainsAnnotations"))
  {
    -[AKController currentPageController](self, "currentPageController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pageModelController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hasMaskBorderAnnotation");

    if (v8)
    {
      objc_msgSend(v5, "akPasteboardAnnotations");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 0;
      v14 = &v13;
      v15 = 0x2020000000;
      v16 = 0;
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = sub_229015B74;
      v12[3] = &unk_24F1A7BE0;
      v12[4] = &v13;
      objc_msgSend(v9, "enumerateObjectsUsingBlock:", v12);
      v10 = *((_BYTE *)v14 + 24) != 0;
      _Block_object_dispose(&v13, 8);

    }
    else
    {
      v10 = 1;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)delete:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (-[AKController validateDelete:](self, "validateDelete:", 0))
  {
    -[AKController modelController](self, "modelController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deleteAllSelectedAnnotations");

    -[AKController undoController](self, "undoController");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "undoManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[AKController akBundle](AKController, "akBundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Delete"), &stru_24F1A83D0, CFSTR("AKController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setActionName:", v7);

  }
}

- (BOOL)validateDelete:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  char v13;
  _OWORD v15[4];
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (!-[AKController _validateCutCopyDelete](self, "_validateCutCopyDelete", a3))
    return 0;
  -[AKController textEditorController](self, "textEditorController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEditing");

  if (!v5)
    return 1;
  -[AKController modelController](self, "modelController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allSelectedAnnotations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "indexesOfObjectsPassingTest:", &unk_24F1A7C00);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectsAtIndexes:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  memset(v15, 0, sizeof(v15));
  if (objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", v15, v16, 16))
  {
    v10 = **((_QWORD **)&v15[0] + 1);
    -[AKController textEditorController](self, "textEditorController");
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v11, "annotation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    LOBYTE(v11) = objc_msgSend(v12, "isEqual:", v10);
    v13 = v11 ^ 1;
  }
  else
  {
    v13 = 1;
  }

  return v13;
}

- (void)duplicate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  if (-[AKController validateDuplicate:](self, "validateDuplicate:", a3))
  {
    -[AKController modelController](self, "modelController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allSelectedAnnotations");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "indexesOfObjectsPassingTest:", &unk_24F1A7C20);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectsAtIndexes:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "count"))
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v9 = v7;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v29;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v29 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
            objc_msgSend(v14, "setIsBeingCopied:", 1, (_QWORD)v28);
            v15 = (void *)objc_msgSend(v14, "copy");
            objc_msgSend(v14, "setIsBeingCopied:", 0);
            if (v15)
              objc_msgSend(v8, "addObject:", v15);

          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        }
        while (v11);
      }

      -[AKController currentPageController](self, "currentPageController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKController lastCreationCascadingPageController](self, "lastCreationCascadingPageController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[AKController creationCascadingMultiplier](self, "creationCascadingMultiplier");
      -[AKController setLastCreationCascadingPageController:](self, "setLastCreationCascadingPageController:", v16);
      -[AKController setCreationCascadingMultiplier:](self, "setCreationCascadingMultiplier:", 1);
      +[AKToolController cascadeAnnotations:onPageController:forPaste:](AKToolController, "cascadeAnnotations:onPageController:forPaste:", v8, v16, 0);
      -[AKController setLastCreationCascadingPageController:](self, "setLastCreationCascadingPageController:", v17);
      -[AKController setCreationCascadingMultiplier:](self, "setCreationCascadingMultiplier:", v18);
      objc_msgSend(v16, "pageModelController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "mutableArrayValueForKey:", CFSTR("annotations"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addObjectsFromArray:", v8);

      objc_msgSend(v16, "pageModelController");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "mutableSetValueForKey:", CFSTR("selectedAnnotations"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v8);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setSet:", v23);

      -[AKController undoController](self, "undoController");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "undoManager");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      +[AKController akBundle](AKController, "akBundle");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("Duplicate"), &stru_24F1A83D0, CFSTR("AKController"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setActionName:", v27);

    }
  }
}

- (BOOL)validateDuplicate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *i;
  uint64_t v14;
  BOOL v15;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  -[AKController modelController](self, "modelController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allSelectedAnnotations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "indexesOfObjectsPassingTest:", &unk_24F1A7C40);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectsAtIndexes:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[AKController textEditorController](self, "textEditorController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v7, "isEditing");

  if ((_DWORD)v8)
  {
    -[AKController textEditorController](self, "textEditorController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "annotation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v11 = v6;
    v8 = (void *)objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v12 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v11);
          if ((objc_msgSend(v10, "isEqual:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i), (_QWORD)v18) & 1) != 0)
          {
            LODWORD(v8) = 1;
            goto LABEL_12;
          }
        }
        v8 = (void *)objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_12:

  }
  v14 = objc_msgSend(v6, "count", (_QWORD)v18);
  if ((_DWORD)v8)
    v15 = 1;
  else
    v15 = v14 == 0;
  v16 = !v15;

  return v16;
}

- (void)selectAll:(id)a3
{
  void *v3;
  id v4;

  -[AKController currentPageController](self, "currentPageController", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pageModelController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectAllAnnotations");

}

- (BOOL)validateSelectAll:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  -[AKController currentPageController](self, "currentPageController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pageModelController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "annotations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  objc_msgSend(v4, "cropAnnotation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v6 - (v7 != 0) > 0;
}

- (BOOL)validateShowAttributeInspector:(id)a3
{
  return 0;
}

- (void)editTextAnnotation:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[AKController modelController](self, "modelController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allSelectedAnnotations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  v8 = v6;
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v16;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v10)
        objc_enumerationMutation(v6);
      v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v11);
      if ((objc_msgSend(v12, "conformsToAKTextAnnotationProtocol", (_QWORD)v15) & 1) != 0)
        break;
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v9)
          goto LABEL_3;
        v8 = v6;
        goto LABEL_12;
      }
    }
    v8 = v12;

    if (!v8)
      goto LABEL_13;
    -[AKController pageControllerForAnnotation:](self, "pageControllerForAnnotation:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKController textEditorController](self, "textEditorController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "beginEditingAnnotation:withPageController:selectAllText:", v8, v13, 0);

  }
LABEL_12:

LABEL_13:
}

- (BOOL)validateEditTextAnnotation:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[AKController modelController](self, "modelController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allSelectedAnnotations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count") == 1)
  {
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[AKController canBeginEditingTextAnnotation:](self, "canBeginEditingTextAnnotation:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)canBeginEditingTextAnnotation:(id)a3
{
  id v4;
  id v5;
  void *v6;
  char v7;
  char v8;
  char isKindOfClass;
  void *v10;
  BOOL v11;

  v4 = a3;
  if ((-[AKController annotationEditingEnabled](self, "annotationEditingEnabled")
     || -[AKController formFillingEnabled](self, "formFillingEnabled"))
    && objc_msgSend(v4, "conformsToAKTextAnnotationProtocol"))
  {
    v5 = v4;
    -[AKController textEditorController](self, "textEditorController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEditing");

    if ((v7 & 1) != 0)
    {
      v8 = 0;
    }
    else
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      objc_msgSend(v5, "annotationText");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "length") != 0;

      v8 = isKindOfClass | v11;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8 & 1;
}

- (void)showSelectionMenu:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  _BOOL4 IsNull;
  double v26;
  double v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void **v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v44[3];
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;

  v44[2] = *MEMORY[0x24BDAC8D0];
  -[AKController currentPageController](self, "currentPageController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "overlayView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "becomeFirstResponder");

  objc_msgSend(v4, "pageModelController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectedAnnotations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
  {
    -[AKController _popoverAnchorFrameInModelForAnnotations:](self, "_popoverAnchorFrameInModelForAnnotations:", v7);
    objc_msgSend(v4, "convertRectFromModelToOverlay:");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    objc_msgSend(v4, "visibleRectOfOverlay");
    objc_msgSend(v4, "convertRectFromModelToOverlay:");
    x = v45.origin.x;
    y = v45.origin.y;
    width = v45.size.width;
    height = v45.size.height;
    j__NSStringFromCGRect(v45);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%s visibleRectOfOverlay %@"), "-[AKController showSelectionMenu:]", v20);

    v46.origin.x = v9;
    v46.origin.y = v11;
    v46.size.width = v13;
    v46.size.height = v15;
    v48.origin.x = x;
    v48.origin.y = y;
    v48.size.width = width;
    v48.size.height = height;
    v47 = CGRectIntersection(v46, v48);
    v21 = v47.origin.x;
    v22 = v47.origin.y;
    v23 = v47.size.width;
    v24 = v47.size.height;
    IsNull = CGRectIsNull(v47);
    if (IsNull)
    {
      v26 = v11;
    }
    else
    {
      v9 = v21;
      v26 = v22;
    }
    if (IsNull)
      v27 = v13;
    else
      v27 = v23;
    if (IsNull)
      v24 = v15;
    objc_msgSend(v4, "overlayView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6BB0], "sharedMenuController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_alloc(MEMORY[0x24BDF6BB8]);
    +[AKController akBundle](AKController, "akBundle");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("STRING_EDIT_BUTTON"), CFSTR("Edit"), CFSTR("AKController"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend(v30, "initWithTitle:action:", v32, sel_editTextAnnotation_);

    v34 = objc_alloc(MEMORY[0x24BDF6BB8]);
    +[AKController akBundle](AKController, "akBundle");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("STRING_DUPLICATE_BUTTON"), CFSTR("Duplicate"), CFSTR("AKController"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)objc_msgSend(v34, "initWithTitle:action:", v36, sel_duplicate_);

    if (-[AKController validateEditTextAnnotation:](self, "validateEditTextAnnotation:", self))
    {
      v44[0] = v33;
      v44[1] = v37;
      v38 = (void *)MEMORY[0x24BDBCE30];
      v39 = (void **)v44;
      v40 = 2;
    }
    else
    {
      v43 = v37;
      v38 = (void *)MEMORY[0x24BDBCE30];
      v39 = &v43;
      v40 = 1;
    }
    objc_msgSend(v38, "arrayWithObjects:count:", v39, v40);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setMenuItems:", v42);

    if (objc_msgSend(v29, "isMenuVisible"))
    {
      objc_msgSend(v29, "update");
    }
    else if ((objc_msgSend(v28, "isFirstResponder") & 1) == 0)
    {
      objc_msgSend(v28, "becomeFirstResponder");
      objc_msgSend(v29, "showMenuFromView:rect:", v28, v9, v26, v27, v24);
      objc_msgSend(v28, "resignFirstResponder");
      goto LABEL_19;
    }
    objc_msgSend(v29, "showMenuFromView:rect:", v28, v9, v26, v27, v24);
LABEL_19:

    goto LABEL_20;
  }
  objc_msgSend(MEMORY[0x24BDF6BB0], "sharedMenuController");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "hideMenu");

LABEL_20:
}

- (void)hideSelectionMenu:(id)a3
{
  id v3;

  objc_msgSend(MEMORY[0x24BDF6BB0], "sharedMenuController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hideMenu");

}

- (void)highlightableSelectionChanged
{
  void *v3;
  uint64_t v4;
  id v5;

  -[AKController toolController](self, "toolController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "toolMode");

  if (v4 == 3)
  {
    -[AKController highlightAnnotationController](self, "highlightAnnotationController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "continueHighlighting");

  }
}

- (void)highlightableSelectionWillBeginChanging
{
  void *v3;
  uint64_t v4;
  id v5;

  -[AKController toolController](self, "toolController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "toolMode");

  if (v4 == 3)
  {
    -[AKController highlightAnnotationController](self, "highlightAnnotationController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "beginContinuousHighlighting");

  }
}

- (void)highlightableSelectionDidEndChanging
{
  void *v3;
  uint64_t v4;
  id v5;

  -[AKController toolController](self, "toolController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "toolMode");

  if (v4 == 3)
  {
    -[AKController highlightAnnotationController](self, "highlightAnnotationController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endContinuousHighlighting");

  }
}

- (void)setSelectNewlyCreatedAnnotations:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_selectNewlyCreatedAnnotations = a3;
  -[AKController legacyDoodleController](self, "legacyDoodleController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSelectNewlyCreatedAnnotations:", v3);

}

+ (id)colorForHighlightAttributeWithTag:(int64_t)a3
{
  return +[AKHighlightAppearanceHelper colorForHighlightAttributeWithTag:](AKHighlightAppearanceHelper, "colorForHighlightAttributeWithTag:", a3);
}

- (void)addPopupToAnnotation:(id)a3 openPopup:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  id v8;

  v4 = a4;
  v8 = a3;
  -[AKController pageControllerForAnnotation:](self, "pageControllerForAnnotation:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "addPopupToAnnotation:openPopup:", v8, v4);

}

- (void)removeNoteFromAnnotation:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[AKController pageControllerForAnnotation:](self, "pageControllerForAnnotation:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "removeNoteFromAnnotation:", v6);

}

- (BOOL)onlyDrawWithApplePencil
{
  return MEMORY[0x24BEDD108](MEMORY[0x24BDF6C48], sel_prefersPencilOnlyDrawing);
}

- (PKToolPicker)toolPicker
{
  void *v2;
  void *v3;

  -[AKController modernToolbarView](self, "modernToolbarView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "toolPicker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PKToolPicker *)v3;
}

- (void)_didReceiveMemoryWarning:(id)a3
{
  MEMORY[0x24BEDD108](AKInkRendererHelper, sel_purgeSharedRenderer);
}

- (BOOL)_validateCutCopyDelete
{
  void *v2;
  void *v3;
  BOOL v4;

  -[AKController modelController](self, "modelController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allSelectedAnnotations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (BOOL)shouldDrawVariableStrokeDoodles
{
  void *v3;
  uint64_t v4;
  uint64_t v6;

  if (objc_msgSend((id)objc_opt_class(), "canConnectToStylus"))
  {
    -[AKController peripheralAvailabilityManager](self, "peripheralAvailabilityManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "currentAvailability");

    if (v4 == 1)
      return 1;
  }
  v6 = objc_opt_class();
  return MEMORY[0x24BEDD108](v6, sel_hasPressureCapableHardware);
}

- (BOOL)supportForPencilAlwaysDrawsSatisfied
{
  _BOOL4 v3;

  v3 = +[AKController canConnectToStylus](AKController, "canConnectToStylus");
  if (v3)
    LOBYTE(v3) = -[AKController pencilAlwaysDraws](self, "pencilAlwaysDraws");
  return v3;
}

- (void)_toolpicker_setColor:(id)a3
{
  id v4;
  AKController *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int64_t v10;
  AKMinimalTextColorUserInterfaceItem *v11;
  uint64_t v12;
  void *v13;
  AKMinimalTextColorUserInterfaceItem *v14;
  void *v15;
  void *v16;
  void *v17;
  AKMinimalInkChooserUserInterfaceItem *v18;
  id v19;

  v4 = a3;
  v5 = self;
  v19 = v4;
  -[AKController currentPageController](v5, "currentPageController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pageModelController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "selectedAnnotations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    v10 = +[AKToolbarUtilities attributeTagForCurrentSelectionState:](AKToolbarUtilities, "attributeTagForCurrentSelectionState:", v5);
    if (v10 == 765106)
    {
      v11 = [AKMinimalTextColorUserInterfaceItem alloc];
      v12 = 765106;
    }
    else
    {
      if (v10 != 765101)
      {
        NSLog(CFSTR("%s called with incorrect colorAttributeTag %ld"), "-[AKController _toolpicker_setColor:]", v10);
        goto LABEL_10;
      }
      v11 = [AKMinimalColorChooserUserInterfaceItem alloc];
      v12 = 765101;
    }
    v14 = -[AKMinimalUserInterfaceItem initWithTag:](v11, "initWithTag:", v12);
    -[AKMinimalColorChooserUserInterfaceItem setColor:](v14, "setColor:", v19);
    -[AKController performActionForSender:](v5, "performActionForSender:", v14);
  }
  else
  {
    -[AKController attributeController](v5, "attributeController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "ink");
    v14 = (AKMinimalTextColorUserInterfaceItem *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x24BDE33B0];
    -[AKMinimalTextColorUserInterfaceItem identifier](v14, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKMinimalTextColorUserInterfaceItem weight](v14, "weight");
    objc_msgSend(v15, "inkWithIdentifier:color:weight:", v16, v19);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = -[AKMinimalUserInterfaceItem initWithTag:]([AKMinimalInkChooserUserInterfaceItem alloc], "initWithTag:", 765300);
    -[AKMinimalInkChooserUserInterfaceItem setInk:](v18, "setInk:", v17);
    -[AKController performActionForSender:](v5, "performActionForSender:", v18);

  }
LABEL_10:

}

- (id)_toolpicker_color
{
  void *v2;
  void *v3;

  -[AKController attributeController](self, "attributeController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "strokeColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_toolpicker_setInkIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  AKMinimalInkChooserUserInterfaceItem *v10;
  void *v11;
  uint64_t v12;
  AKMinimalUserInterfaceItem *v13;
  AKController *v14;

  v14 = self;
  v4 = a3;
  -[AKController attributeController](v14, "attributeController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ink");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BDE33B0];
  objc_msgSend(v6, "color");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "weight");
  objc_msgSend(v7, "inkWithIdentifier:color:weight:", v4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[AKMinimalUserInterfaceItem initWithTag:]([AKMinimalInkChooserUserInterfaceItem alloc], "initWithTag:", 765300);
  -[AKMinimalInkChooserUserInterfaceItem setInk:](v10, "setInk:", v9);
  -[AKController performActionForSender:](v14, "performActionForSender:", v10);
  -[AKController toolController](v14, "toolController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "toolMode");

  if (v12 != 4 && -[AKController annotationEditingEnabled](v14, "annotationEditingEnabled"))
  {
    v13 = -[AKMinimalUserInterfaceItem initWithTag:]([AKMinimalUserInterfaceItem alloc], "initWithTag:", 764017);
    -[AKController performActionForSender:](v14, "performActionForSender:", v13);

  }
}

- (id)_toolpicker_inkIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[AKController attributeController](self, "attributeController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)currentPageController
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  -[AKController pageControllers](self, "pageControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[AKController pageControllers](self, "pageControllers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndex:", -[AKController currentPageIndex](self, "currentPageIndex"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)pageControllerForPageModelController:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[AKController pageControllers](self, "pageControllers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "pageModelController");
        v10 = (id)objc_claimAutoreleasedReturnValue();

        if (v10 == v4)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)pageControllerForAnnotation:(id)a3
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
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[AKController modelController](self, "modelController", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pageModelControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v11, "containsAnnotation:", v4))
        {
          -[AKController pageModelControllersToPageControllers](self, "pageModelControllersToPageControllers");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKey:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (CGRect)_popoverAnchorFrameInModelForAnnotations:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double MidY;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect result;
  CGRect v45;

  v37 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (objc_msgSend(v3, "count") == 1)
  {
    objc_msgSend(v3, "anyObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_msgSend(v4, "midPoint");
      v6 = v26 + -5.0;
      MidY = v27 + -5.0;
      v12 = 10.0;
      v10 = 10.0;
    }
    else
    {
      objc_msgSend(v4, "drawingBounds");
      v6 = v5;
      MidY = v7;
      v10 = v9;
      v12 = v11;
    }

  }
  else
  {
    v14 = *MEMORY[0x24BDBF028];
    v13 = *(double *)(MEMORY[0x24BDBF028] + 8);
    v16 = *(double *)(MEMORY[0x24BDBF028] + 16);
    v15 = *(double *)(MEMORY[0x24BDBF028] + 24);
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v17 = v3;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v33;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v33 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v21), "drawingBounds", (_QWORD)v32);
          x = v38.origin.x;
          y = v38.origin.y;
          width = v38.size.width;
          height = v38.size.height;
          if (!CGRectIsInfinite(v38))
          {
            v39.origin.x = v14;
            v39.origin.y = v13;
            v39.size.width = v16;
            v39.size.height = v15;
            if (CGRectIsInfinite(v39))
            {
              v15 = height;
              v16 = width;
              v13 = y;
              v14 = x;
            }
            else
            {
              v40.origin.x = v14;
              v40.origin.y = v13;
              v40.size.width = v16;
              v40.size.height = v15;
              v45.origin.x = x;
              v45.origin.y = y;
              v45.size.width = width;
              v45.size.height = height;
              v41 = CGRectUnion(v40, v45);
              v14 = v41.origin.x;
              v13 = v41.origin.y;
              v16 = v41.size.width;
              v15 = v41.size.height;
            }
          }
          ++v21;
        }
        while (v19 != v21);
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v19);
    }

    v42.origin.x = v14;
    v42.origin.y = v13;
    v42.size.width = v16;
    v42.size.height = v15;
    v43.origin.x = CGRectGetMidX(v42);
    v6 = v43.origin.x;
    v43.origin.y = v13;
    v43.size.width = v16;
    v43.size.height = v15;
    MidY = CGRectGetMidY(v43);
    v12 = 1.0;
    v10 = 1.0;
  }

  v28 = v6;
  v29 = MidY;
  v30 = v10;
  v31 = v12;
  result.size.height = v31;
  result.size.width = v30;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

- (BOOL)isPresentingPopover
{
  void *v3;
  char v4;
  void *v6;
  char v7;

  -[AKController toolbarViewController](self, "toolbarViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isPresentingPopover");

  if ((v4 & 1) != 0)
    return 1;
  -[AKController modernToolbarView](self, "modernToolbarView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isPresentingPopover");

  return v7;
}

- (void)setHideAllAdornments:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (self->_hideAllAdornments != a3)
  {
    v3 = a3;
    self->_hideAllAdornments = a3;
    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[AKController pageControllers](self, "pageControllers", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          if (objc_msgSend(v10, "relinquishablesAreLoaded"))
          {
            objc_msgSend(v10, "layerPresentationManager");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "setAdornmentsHidden:", v3);

          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

    objc_msgSend(MEMORY[0x24BDE57D8], "commit");
  }
}

- (void)_pageModelControllerSelectedAnnotationsChangedNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKController modelController](self, "modelController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pageModelControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v4);

  if (v7)
  {
    v16 = AKSelectionChangedPageModelControllerKey;
    v17[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "postNotificationName:object:userInfo:", AKSelectionChangedNotification, self, v8);

    -[AKController _updateGestureDependencyPriority](self, "_updateGestureDependencyPriority");
    -[AKController modelController](self, "modelController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allSelectedAnnotations");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "count"))
    {
      -[AKController currentPageController](self, "currentPageController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "overlayView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13 && (objc_msgSend(v13, "isFirstResponder") & 1) == 0)
      {
        objc_msgSend(v13, "firstResponder");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_msgSend(v14, "isDescendantOfView:", v13) & 1) == 0)
        {
          -[AKController modernToolbarView](self, "modernToolbarView");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "updateCurrentOverlaysToolPickerVisibility");

          objc_msgSend(v13, "becomeFirstResponder");
        }

      }
    }
    else
    {
      -[AKController hideSelectionMenu:](self, "hideSelectionMenu:", 0);
    }

  }
}

- (void)strokeAddedNotification:(id)a3
{
  AKController *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  AKController *v8;

  objc_msgSend(a3, "object");
  v4 = (AKController *)objc_claimAutoreleasedReturnValue();
  if (v4 == self)
  {
    v8 = v4;
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKController statisticsLogger](self, "statisticsLogger");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logInkAnnotationStrokeAdded:", v6);

    v4 = v8;
  }

}

- (void)beginLogging:(id)a3 documentType:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (!v11 || !v6)
    NSLog(CFSTR("WARNING: Missing prefix or document type!"));
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_strokeAddedNotification_, off_255A255B8, 0);

  -[AKController statisticsLogger](self, "statisticsLogger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClientPrefix:", v11);

  -[AKController statisticsLogger](self, "statisticsLogger");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDocumentType:", v6);

  -[AKController statisticsLogger](self, "statisticsLogger");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resetLogging");

}

- (void)endLogging
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, off_255A255B8, 0);

  -[AKController statisticsLogger](self, "statisticsLogger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logDocumentSaved");

  -[AKController statisticsLogger](self, "statisticsLogger");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resetLogging");

}

- (BOOL)isUsedOnDarkBackground
{
  return self->_isUsedOnDarkBackground;
}

- (void)setIsUsedOnDarkBackground:(BOOL)a3
{
  self->_isUsedOnDarkBackground = a3;
}

- (BOOL)overlayShouldPixelate
{
  return self->overlayShouldPixelate;
}

- (BOOL)isTornDown
{
  return self->_isTornDown;
}

- (void)setIsTornDown:(BOOL)a3
{
  self->_isTornDown = a3;
}

- (AKControllerDelegateProtocol)delegate
{
  return (AKControllerDelegateProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AKModelController)modelController
{
  return (AKModelController *)objc_getProperty(self, a2, 32, 1);
}

- (void)setModelController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (UIView)toolbarView
{
  return (UIView *)objc_getProperty(self, a2, 40, 1);
}

- (void)setToolbarView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (BOOL)allEditingDisabled
{
  return self->_allEditingDisabled;
}

- (void)setAllEditingDisabled:(BOOL)a3
{
  self->_allEditingDisabled = a3;
}

- (BOOL)annotationEditingEnabled
{
  return self->_annotationEditingEnabled;
}

- (BOOL)formFillingEnabled
{
  return self->_formFillingEnabled;
}

- (BOOL)pencilAlwaysDraws
{
  return self->_pencilAlwaysDraws;
}

- (unint64_t)currentPageIndex
{
  return self->_currentPageIndex;
}

- (void)setCurrentPageIndex:(unint64_t)a3
{
  self->_currentPageIndex = a3;
}

- (PKRulerHostingDelegate)rulerHostingDelegate
{
  return (PKRulerHostingDelegate *)objc_loadWeakRetained((id *)&self->_rulerHostingDelegate);
}

- (NSString)author
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setAuthor:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (NSString)modifiedImageDescription
{
  return self->_modifiedImageDescription;
}

- (BOOL)isTestingInstance
{
  return self->_isTestingInstance;
}

- (void)setIsTestingInstance:(BOOL)a3
{
  self->_isTestingInstance = a3;
}

- (AKSparseMutableControllerArray)pageControllers
{
  return (AKSparseMutableControllerArray *)objc_getProperty(self, a2, 80, 1);
}

- (void)setPageControllers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSMapTable)pageModelControllersToPageControllers
{
  return (NSMapTable *)objc_getProperty(self, a2, 88, 1);
}

- (void)setPageModelControllersToPageControllers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (AKActionController)actionController
{
  return (AKActionController *)objc_getProperty(self, a2, 96, 1);
}

- (void)setActionController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (AKToolController)toolController
{
  return (AKToolController *)objc_getProperty(self, a2, 104, 1);
}

- (void)setToolController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (AKToolbarViewController)toolbarViewController
{
  return (AKToolbarViewController *)objc_getProperty(self, a2, 112, 1);
}

- (void)setToolbarViewController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (AKAttributeController)attributeController
{
  return (AKAttributeController *)objc_getProperty(self, a2, 120, 1);
}

- (void)setAttributeController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (AKUndoController)undoController
{
  return (AKUndoController *)objc_getProperty(self, a2, 128, 1);
}

- (void)setUndoController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (AKSidecarController)sidecarController
{
  return (AKSidecarController *)objc_getProperty(self, a2, 136, 1);
}

- (void)setSidecarController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (AKMainEventHandler)mainEventHandler
{
  return (AKMainEventHandler *)objc_getProperty(self, a2, 144, 1);
}

- (void)setMainEventHandler:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (AKTextEditorController)textEditorController
{
  return (AKTextEditorController *)objc_getProperty(self, a2, 152, 1);
}

- (void)setTextEditorController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (AKLegacyDoodleController)legacyDoodleController
{
  return (AKLegacyDoodleController *)objc_getProperty(self, a2, 160, 1);
}

- (void)setLegacyDoodleController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (AKSignatureModelController)signatureModelController
{
  return (AKSignatureModelController *)objc_getProperty(self, a2, 168, 1);
}

- (void)setSignatureModelController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (AKFormFeatureDetectorController)formDetectionController
{
  return (AKFormFeatureDetectorController *)objc_getProperty(self, a2, 176, 1);
}

- (void)setFormDetectionController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (AKHighlightAnnotationController)highlightAnnotationController
{
  return (AKHighlightAnnotationController *)objc_getProperty(self, a2, 184, 1);
}

- (void)setHighlightAnnotationController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (AKStatistics)statisticsLogger
{
  return (AKStatistics *)objc_getProperty(self, a2, 192, 1);
}

- (void)setStatisticsLogger:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (AKPeripheralAvailabilityManager_iOS)peripheralAvailabilityManager
{
  return (AKPeripheralAvailabilityManager_iOS *)objc_getProperty(self, a2, 200, 1);
}

- (void)setPeripheralAvailabilityManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (unint64_t)pasteCascadingMultiplier
{
  return self->_pasteCascadingMultiplier;
}

- (void)setPasteCascadingMultiplier:(unint64_t)a3
{
  self->_pasteCascadingMultiplier = a3;
}

- (int64_t)lastPasteboardChangeCount
{
  return self->_lastPasteboardChangeCount;
}

- (void)setLastPasteboardChangeCount:(int64_t)a3
{
  self->_lastPasteboardChangeCount = a3;
}

- (unint64_t)creationCascadingMultiplier
{
  return self->_creationCascadingMultiplier;
}

- (void)setCreationCascadingMultiplier:(unint64_t)a3
{
  self->_creationCascadingMultiplier = a3;
}

- (AKPageController)lastCreationCascadingPageController
{
  return (AKPageController *)objc_loadWeakRetained((id *)&self->_lastCreationCascadingPageController);
}

- (void)setLastCreationCascadingPageController:(id)a3
{
  objc_storeWeak((id *)&self->_lastCreationCascadingPageController, a3);
}

- (BOOL)hideAllAdornments
{
  return self->_hideAllAdornments;
}

- (NSArray)cachedKeyCommands
{
  return self->_cachedKeyCommands;
}

- (double)akModelToCanvasFixedPixelScaleOfFirstEncounteredPage
{
  return self->_akModelToCanvasFixedPixelScaleOfFirstEncounteredPage;
}

- (void)setAkModelToCanvasFixedPixelScaleOfFirstEncounteredPage:(double)a3
{
  self->_akModelToCanvasFixedPixelScaleOfFirstEncounteredPage = a3;
}

- (double)screenPixelsToCanvasPixelsDownscale
{
  return self->_screenPixelsToCanvasPixelsDownscale;
}

- (void)setScreenPixelsToCanvasPixelsDownscale:(double)a3
{
  self->_screenPixelsToCanvasPixelsDownscale = a3;
}

- (BOOL)isLogging
{
  return self->_isLogging;
}

- (void)setIsLogging:(BOOL)a3
{
  self->_isLogging = a3;
}

- (BOOL)selectNewlyCreatedAnnotations
{
  return self->_selectNewlyCreatedAnnotations;
}

- (BOOL)shapeDetectionEnabled
{
  return self->_shapeDetectionEnabled;
}

- (AKToolbarView)modernToolbarView
{
  return (AKToolbarView *)objc_loadWeakRetained((id *)&self->_modernToolbarView);
}

- (void)setModernToolbarView:(id)a3
{
  objc_storeWeak((id *)&self->_modernToolbarView, a3);
}

- (AKControllerOverlayInteractionProtocol)overlayInteractionDelegate
{
  return (AKControllerOverlayInteractionProtocol *)objc_loadWeakRetained((id *)&self->_overlayInteractionDelegate);
}

- (void)setOverlayInteractionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_overlayInteractionDelegate, a3);
}

- (BOOL)useHighVisibilityDefaultInks
{
  return self->_useHighVisibilityDefaultInks;
}

- (void)setUseHighVisibilityDefaultInks:(BOOL)a3
{
  self->_useHighVisibilityDefaultInks = a3;
}

- (BOOL)_isInDFRAction
{
  return self->__isInDFRAction;
}

- (AKSignaturesController)signaturesController
{
  return self->_signaturesController;
}

- (void)setSignaturesController:(id)a3
{
  objc_storeStrong((id *)&self->_signaturesController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signaturesController, 0);
  objc_destroyWeak((id *)&self->_overlayInteractionDelegate);
  objc_destroyWeak((id *)&self->_modernToolbarView);
  objc_storeStrong((id *)&self->_cachedKeyCommands, 0);
  objc_destroyWeak((id *)&self->_lastCreationCascadingPageController);
  objc_storeStrong((id *)&self->_peripheralAvailabilityManager, 0);
  objc_storeStrong((id *)&self->_statisticsLogger, 0);
  objc_storeStrong((id *)&self->_highlightAnnotationController, 0);
  objc_storeStrong((id *)&self->_formDetectionController, 0);
  objc_storeStrong((id *)&self->_signatureModelController, 0);
  objc_storeStrong((id *)&self->_legacyDoodleController, 0);
  objc_storeStrong((id *)&self->_textEditorController, 0);
  objc_storeStrong((id *)&self->_mainEventHandler, 0);
  objc_storeStrong((id *)&self->_sidecarController, 0);
  objc_storeStrong((id *)&self->_undoController, 0);
  objc_storeStrong((id *)&self->_attributeController, 0);
  objc_storeStrong((id *)&self->_toolbarViewController, 0);
  objc_storeStrong((id *)&self->_toolController, 0);
  objc_storeStrong((id *)&self->_actionController, 0);
  objc_storeStrong((id *)&self->_pageModelControllersToPageControllers, 0);
  objc_storeStrong((id *)&self->_pageControllers, 0);
  objc_storeStrong((id *)&self->_modifiedImageDescription, 0);
  objc_storeStrong((id *)&self->_author, 0);
  objc_destroyWeak((id *)&self->_rulerHostingDelegate);
  objc_storeStrong((id *)&self->_toolbarView, 0);
  objc_storeStrong((id *)&self->_modelController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
