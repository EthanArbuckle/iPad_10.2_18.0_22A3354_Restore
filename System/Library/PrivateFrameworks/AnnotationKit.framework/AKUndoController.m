@implementation AKUndoController

- (AKUndoController)initWithController:(id)a3
{
  id v4;
  AKUndoController *v5;
  AKUndoController *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)AKUndoController;
  v5 = -[AKUndoController init](&v26, sel_init);
  v6 = v5;
  if (v5)
  {
    -[AKUndoController setController:](v5, "setController:", v4);
    objc_msgSend(v4, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "undoManagerForAnnotationController:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKUndoController setUndoManager:](v6, "setUndoManager:", v8);
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKUndoController setObservedPageModelControllers:](v6, "setObservedPageModelControllers:", v9);

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKUndoController setObservedAnnotations:](v6, "setObservedAnnotations:", v10);

    -[AKUndoController setUndoGroupPresentablePropertyName:](v6, "setUndoGroupPresentablePropertyName:", 0);
    -[AKUndoController setUndoGroupHasChangesToMultipleProperties:](v6, "setUndoGroupHasChangesToMultipleProperties:", 0);
    -[AKUndoController setUndoGroupOldPropertiesPerAnnotation:](v6, "setUndoGroupOldPropertiesPerAnnotation:", 0);
    if (v8)
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *MEMORY[0x24BDD13A0];
      -[AKUndoController undoManager](v6, "undoManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObserver:selector:name:object:", v6, sel_observeUndoManagerCheckpoint_, v12, v13);

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *MEMORY[0x24BDD13A8];
      -[AKUndoController undoManager](v6, "undoManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObserver:selector:name:object:", v6, sel_observeUndoManagerDetectedEdit_, v15, v16);

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *MEMORY[0x24BDD13B8];
      -[AKUndoController undoManager](v6, "undoManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObserver:selector:name:object:", v6, sel_observeUndoManagerDetectedEdit_, v18, v19);

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *MEMORY[0x24BDD13B0];
      -[AKUndoController undoManager](v6, "undoManager");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addObserver:selector:name:object:", v6, sel_observeUndoManagerDetectedEdit_, v21, v22);

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addObserver:selector:name:object:", v6, sel_observePageControllerRequestsDisableRegistration_, off_255A25E18[0], 0);

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "addObserver:selector:name:object:", v6, sel_observePageControllerRequestsEnableRegistration_, off_255A25E20, 0);

    }
  }

  return v6;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  objc_super v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  -[AKUndoController undoManager](self, "undoManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:", self);

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    -[AKUndoController observedAnnotations](self, "observedAnnotations");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v31 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          objc_msgSend(v10, "keysForValuesToObserveForUndo");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = 0u;
          v27 = 0u;
          v28 = 0u;
          v29 = 0u;
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v27;
            do
            {
              for (j = 0; j != v13; ++j)
              {
                if (*(_QWORD *)v27 != v14)
                  objc_enumerationMutation(v11);
                objc_msgSend(v10, "removeObserver:forKeyPath:", self, *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * j));
              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
            }
            while (v13);
          }

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
      }
      while (v7);
    }

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    -[AKUndoController observedPageModelControllers](self, "observedPageModelControllers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v23;
      do
      {
        for (k = 0; k != v18; ++k)
        {
          if (*(_QWORD *)v23 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * k), "removeObserver:forKeyPath:context:", self, CFSTR("annotations"), CFSTR("AKUndoController.modelAnnotationsObservationContext"));
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
      }
      while (v18);
    }

  }
  -[AKUndoController setObservedAnnotations:](self, "setObservedAnnotations:", 0);
  -[AKUndoController setObservedPageModelControllers:](self, "setObservedPageModelControllers:", 0);
  -[AKUndoController setUndoGroupPresentablePropertyName:](self, "setUndoGroupPresentablePropertyName:", 0);
  -[AKUndoController setUndoGroupOldPropertiesPerAnnotation:](self, "setUndoGroupOldPropertiesPerAnnotation:", 0);
  -[AKUndoController setUndoManager:](self, "setUndoManager:", 0);
  v21.receiver = self;
  v21.super_class = (Class)AKUndoController;
  -[AKUndoController dealloc](&v21, sel_dealloc);
}

- (void)startObservingPageModelController:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[AKUndoController undoManager](self, "undoManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AKUndoController observedPageModelControllers](self, "observedPageModelControllers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "containsObject:", v9);

    if ((v6 & 1) == 0)
    {
      objc_msgSend(v9, "annotations");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKUndoController _startObservingAnnotations:](self, "_startObservingAnnotations:", v7);

      objc_msgSend(v9, "addObserver:forKeyPath:options:context:", self, CFSTR("annotations"), 11, CFSTR("AKUndoController.modelAnnotationsObservationContext"));
      -[AKUndoController observedPageModelControllers](self, "observedPageModelControllers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v9);

    }
  }

}

- (void)stopObservingPageModelController:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[AKUndoController undoManager](self, "undoManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AKUndoController observedPageModelControllers](self, "observedPageModelControllers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "containsObject:", v9);

    if (v6)
    {
      objc_msgSend(v9, "removeObserver:forKeyPath:context:", self, CFSTR("annotations"), CFSTR("AKUndoController.modelAnnotationsObservationContext"));
      -[AKUndoController observedPageModelControllers](self, "observedPageModelControllers");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObject:", v9);

      objc_msgSend(v9, "annotations");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKUndoController _stopObservingAnnotations:](self, "_stopObservingAnnotations:", v8);

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
  uint64_t v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  int v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  char v37;
  void *v38;
  void *v39;
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
  uint64_t v52;
  void *v53;
  void *v54;
  objc_super v55;
  __CFString *v56;
  id v57;
  __CFString *v58;
  _QWORD v59[2];

  v59[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (a6 == CFSTR("AKUndoController.annotationPropertyObservationContext"))
  {
    -[AKUndoController undoManager](self, "undoManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKUndoController controller](self, "controller");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v13, "isUndoRegistrationEnabled"))
    {
LABEL_46:
      v58 = AKAnnotationChangeObjectKey;
      v59[0] = v11;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v59, &v58, 1);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "postNotificationName:object:userInfo:", AKAnnotationPropertiesChangedNotification, v14, v47);

LABEL_47:
      goto LABEL_48;
    }
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BDD0E70]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BDD0E80]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v17 = objc_claimAutoreleasedReturnValue();
    v54 = v15;
    if (v16 == (void *)v17)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15 == v26)
      {
        v27 = objc_msgSend(v15, "isEqual:", v16);

        if ((v27 & 1) != 0)
        {
LABEL_45:

          goto LABEL_46;
        }
      }
      else
      {

      }
    }
    else
    {
      v18 = (void *)v17;
      v19 = objc_msgSend(v15, "isEqual:", v16);

      if ((v19 & 1) != 0)
        goto LABEL_45;
    }
    -[AKUndoController undoGroupOldPropertiesPerAnnotation](self, "undoGroupOldPropertiesPerAnnotation");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v28)
    {
      objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
      v52 = objc_claimAutoreleasedReturnValue();
      -[AKUndoController setUndoGroupOldPropertiesPerAnnotation:](self, "setUndoGroupOldPropertiesPerAnnotation:");
      objc_msgSend(v14, "modelController");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "pageModelControllerForAnnotation:", v11);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30)
        -[AKUndoController _registerUndoForSelectionOnPageModelController:](self, "_registerUndoForSelectionOnPageModelController:", v30);
      -[AKUndoController undoGroupOldPropertiesPerAnnotation](self, "undoGroupOldPropertiesPerAnnotation");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "registerUndoWithTarget:selector:object:", self, sel__setAnnotationProperties_, v31);

      v28 = (void *)v52;
    }
    objc_msgSend(v28, "objectForKey:", v11);
    v32 = (id)objc_claimAutoreleasedReturnValue();
    if (!v32)
    {
      v32 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      objc_msgSend(v28, "setObject:forKey:", v32, v11);
    }
    objc_msgSend(v32, "objectForKey:", v10);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v33)
      objc_msgSend(v32, "setObject:forKey:", v16, v10);
    if ((objc_msgSend(v13, "isUndoing") & 1) != 0 || (objc_msgSend(v13, "isRedoing") & 1) != 0)
    {
LABEL_39:
      if ((objc_msgSend(v10, "isEqualToString:", CFSTR("modificationDate")) & 1) == 0
        && (objc_msgSend(v13, "isUndoing") & 1) == 0
        && (objc_msgSend(v13, "isRedoing") & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setModificationDate:", v44);

        objc_msgSend(v14, "author");
        v45 = (void *)objc_claimAutoreleasedReturnValue();

        if (v45)
        {
          objc_msgSend(v14, "author");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setAuthor:", v46);

        }
      }

      goto LABEL_45;
    }
    v53 = v28;
    objc_msgSend((id)objc_opt_class(), "displayNameForUndoablePropertyChangeWithKey:", v10);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v34, "isEqualToString:", &stru_24F1A83D0) & 1) != 0)
    {
LABEL_38:

      v28 = v53;
      goto LABEL_39;
    }
    -[AKUndoController undoGroupPresentablePropertyName](self, "undoGroupPresentablePropertyName");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35)
    {

    }
    else if (!-[AKUndoController undoGroupHasChangesToMultipleProperties](self, "undoGroupHasChangesToMultipleProperties"))
    {
      v41 = (void *)MEMORY[0x24BDD17C8];
      +[AKController akBundle](AKController, "akBundle");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "localizedStringForKey:value:table:", CFSTR("Change of %@"), &stru_24F1A83D0, CFSTR("AnnotationStrings"));
      v51 = v34;
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "stringWithFormat:", v42, v51);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setActionName:", v43);

      v34 = v51;
      v40 = v51;
LABEL_37:
      -[AKUndoController setUndoGroupPresentablePropertyName:](self, "setUndoGroupPresentablePropertyName:", v40);
      goto LABEL_38;
    }
    if (-[AKUndoController undoGroupHasChangesToMultipleProperties](self, "undoGroupHasChangesToMultipleProperties"))
      goto LABEL_38;
    -[AKUndoController undoGroupPresentablePropertyName](self, "undoGroupPresentablePropertyName");
    v50 = v34;
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "isEqualToString:", v50);

    v34 = v50;
    if ((v37 & 1) != 0)
      goto LABEL_38;
    +[AKController akBundle](AKController, "akBundle");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "localizedStringForKey:value:table:", CFSTR("Change of Annotation Properties"), &stru_24F1A83D0, CFSTR("AnnotationStrings"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setActionName:", v39);

    v34 = v50;
    -[AKUndoController setUndoGroupHasChangesToMultipleProperties:](self, "setUndoGroupHasChangesToMultipleProperties:", 1);
    v40 = 0;
    goto LABEL_37;
  }
  if (a6 == CFSTR("AKUndoController.modelAnnotationsObservationContext"))
  {
    -[AKUndoController controller](self, "controller");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BDD0E80]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BDD0E70]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BDD0E78]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "BOOLValue");

    v23 = v11;
    if (v22)
    {
      -[AKUndoController _registerUndoForSelectionOnPageModelController:](self, "_registerUndoForSelectionOnPageModelController:", v23);
      if (v14)
        -[AKUndoController _annotationsWillBeRemoved:onPageController:](self, "_annotationsWillBeRemoved:onPageController:", v14, v23);
    }
    if (v20)
      -[AKUndoController _annotationsWereAdded:onPageController:](self, "_annotationsWereAdded:onPageController:", v20, v23);
    if ((v22 & 1) == 0)
    {
      v56 = AKAnnotationChangeObjectKey;
      v57 = v23;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "postNotificationName:object:userInfo:", AKAnnotationsAddedOrRemovedNotification, v13, v24);

    }
    goto LABEL_47;
  }
  v55.receiver = self;
  v55.super_class = (Class)AKUndoController;
  -[AKUndoController observeValueForKeyPath:ofObject:change:context:](&v55, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
LABEL_48:

}

- (void)observeUndoManagerDetectedEdit:(id)a3
{
  void *v3;
  id v4;

  -[AKUndoController controller](self, "controller", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "editDetectedForAnnotationController:", v4);

}

- (void)observeUndoManagerCheckpoint:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[AKUndoController controller](self, "controller", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mainEventHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "mainEventHandlerIsInTrackingLoop") & 1) == 0)
  {
    objc_msgSend(v5, "annotationEventHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 || objc_msgSend(v5, "mainEventHandlerIsInRotationLoop"))
    {

    }
    else if (!-[AKUndoController externalSourceTrackingChanged](self, "externalSourceTrackingChanged"))
    {
      -[AKUndoController setUndoGroupPresentablePropertyName:](self, "setUndoGroupPresentablePropertyName:", 0);
      -[AKUndoController setUndoGroupHasChangesToMultipleProperties:](self, "setUndoGroupHasChangesToMultipleProperties:", 0);
      -[AKUndoController setUndoGroupOldPropertiesPerAnnotation:](self, "setUndoGroupOldPropertiesPerAnnotation:", 0);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v4, "editCheckpointReachedForAnnotationController:", v7);
    }
  }

}

- (void)_annotationsWereAdded:(id)a3 onPageController:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    -[AKUndoController undoManager](self, "undoManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isUndoRegistrationEnabled"))
    {
      v17[0] = CFSTR("pageModelController");
      v17[1] = CFSTR("annotations");
      v18[0] = v7;
      v9 = (void *)objc_msgSend(v6, "copy");
      v18[1] = v9;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "registerUndoWithTarget:selector:object:", self, sel__deleteAnnotationsFromModel_, v10);
      if ((objc_msgSend(v8, "isUndoing") & 1) == 0 && (objc_msgSend(v8, "isRedoing") & 1) == 0)
      {
        if (objc_msgSend(v6, "count") == 1)
        {
          objc_msgSend(v6, "firstObject");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "displayName");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          v13 = (void *)MEMORY[0x24BDD17C8];
          +[AKController akBundle](AKController, "akBundle");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Add %@"), &stru_24F1A83D0, CFSTR("AnnotationStrings"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "stringWithFormat:", v15, v12);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setActionName:", v16);

        }
        else
        {
          +[AKController akBundle](AKController, "akBundle");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Add Annotations"), &stru_24F1A83D0, CFSTR("AnnotationStrings"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setActionName:", v14);
        }

      }
    }
    -[AKUndoController _startObservingAnnotations:](self, "_startObservingAnnotations:", v6);

  }
}

- (void)_annotationsWillBeRemoved:(id)a3 onPageController:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    -[AKUndoController _stopObservingAnnotations:](self, "_stopObservingAnnotations:", v6);
    -[AKUndoController _endEditingOfTextIfAnnotationsDeleted:](self, "_endEditingOfTextIfAnnotationsDeleted:", v6);
    -[AKUndoController undoManager](self, "undoManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isUndoRegistrationEnabled"))
    {
      v17[0] = CFSTR("pageModelController");
      v17[1] = CFSTR("annotations");
      v18[0] = v7;
      v9 = (void *)objc_msgSend(v6, "copy");
      v18[1] = v9;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "registerUndoWithTarget:selector:object:", self, sel__addAnnotationsFromModel_, v10);
      if ((objc_msgSend(v8, "isUndoing") & 1) == 0 && (objc_msgSend(v8, "isRedoing") & 1) == 0)
      {
        if (objc_msgSend(v6, "count") == 1)
        {
          objc_msgSend(v6, "firstObject");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "displayName");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          v13 = (void *)MEMORY[0x24BDD17C8];
          +[AKController akBundle](AKController, "akBundle");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Remove %@"), &stru_24F1A83D0, CFSTR("AnnotationStrings"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "stringWithFormat:", v15, v12);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setActionName:", v16);

        }
        else
        {
          +[AKController akBundle](AKController, "akBundle");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Remove Annotations"), &stru_24F1A83D0, CFSTR("AnnotationStrings"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setActionName:", v14);
        }

      }
    }

  }
}

- (void)_startObservingAnnotations:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = a3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v23;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v23 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v7);
        -[AKUndoController observedAnnotations](self, "observedAnnotations");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "containsObject:", v8);

        if ((v10 & 1) == 0)
        {
          objc_msgSend(v8, "keysForValuesToObserveForUndo");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = 0u;
          v19 = 0u;
          v20 = 0u;
          v21 = 0u;
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v19;
            do
            {
              v15 = 0;
              do
              {
                if (*(_QWORD *)v19 != v14)
                  objc_enumerationMutation(v11);
                objc_msgSend(v8, "addObserver:forKeyPath:options:context:", self, *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v15++), 3, CFSTR("AKUndoController.annotationPropertyObservationContext"));
              }
              while (v13 != v15);
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
            }
            while (v13);
          }
          -[AKUndoController observedAnnotations](self, "observedAnnotations");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v8);

        }
        ++v7;
      }
      while (v7 != v5);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v5);
  }

}

- (void)_stopObservingAnnotations:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v23;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v8);
        -[AKUndoController observedAnnotations](self, "observedAnnotations");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "containsObject:", v9);

        if (v11)
        {
          objc_msgSend(v9, "keysForValuesToObserveForUndo");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = 0u;
          v19 = 0u;
          v20 = 0u;
          v21 = 0u;
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v19;
            do
            {
              v16 = 0;
              do
              {
                if (*(_QWORD *)v19 != v15)
                  objc_enumerationMutation(v12);
                objc_msgSend(v9, "removeObserver:forKeyPath:", self, *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v16++));
              }
              while (v14 != v16);
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
            }
            while (v14);
          }
          -[AKUndoController observedAnnotations](self, "observedAnnotations");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "removeObject:", v9);

        }
        ++v8;
      }
      while (v8 != v6);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v6);
  }

}

- (void)_setAnnotationProperties:(id)a3
{
  id v3;
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
  v3 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(v3, "keyEnumerator", 0);
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
        objc_msgSend(v3, "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setValuesForKeysWithDictionary:", v10);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (void)_addAnnotationsFromModel:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("pageModelController"));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("annotations"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSetWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v11, "annotations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "minusSet:", v8);
  objc_msgSend(v11, "mutableArrayValueForKey:", CFSTR("annotations"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObjectsFromArray:", v10);

}

- (void)_deleteAnnotationsFromModel:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("pageModelController"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("annotations"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "mutableArrayValueForKey:", CFSTR("annotations"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectsInArray:", v4);

}

- (void)_registerUndoForSelectionOnPageModelController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[AKUndoController undoManager](self, "undoManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isUndoRegistrationEnabled"))
  {
    objc_msgSend(v4, "selectionStateForUndo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = CFSTR("pageModelController");
    v8[1] = CFSTR("selectionState");
    v9[0] = v4;
    v9[1] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "registerUndoWithTarget:selector:object:", self, sel__undoActionForSelectionState_, v7);

  }
}

- (void)_undoActionForSelectionState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[AKUndoController undoManager](self, "undoManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("pageModelController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("selectionState"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "isUndoRegistrationEnabled"))
  {
    objc_msgSend(v6, "selectionStateForUndo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = CFSTR("pageModelController");
    v10[1] = CFSTR("selectionState");
    v11[0] = v6;
    v11[1] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "registerUndoWithTarget:selector:object:", self, sel__undoActionForSelectionState_, v9);

  }
  objc_msgSend(v6, "restoreSelectionStateForUndo:", v7);

}

- (void)_endEditingOfTextIfAnnotationsDeleted:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[AKUndoController controller](self, "controller");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textEditorController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEditing"))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v11);
          objc_msgSend(v6, "annotation", (_QWORD)v14);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12 == v13)
            objc_msgSend(v6, "endEditing");
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

  }
}

- (void)observePageControllerRequestsDisableRegistration:(id)a3
{
  id v3;

  -[AKUndoController undoManager](self, "undoManager", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "disableUndoRegistration");

}

- (void)observePageControllerRequestsEnableRegistration:(id)a3
{
  id v3;

  -[AKUndoController undoManager](self, "undoManager", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enableUndoRegistration");

}

- (NSUndoManager)undoManager
{
  return (NSUndoManager *)objc_getProperty(self, a2, 16, 1);
}

- (void)setUndoManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (BOOL)externalSourceTrackingChanged
{
  return self->_externalSourceTrackingChanged;
}

- (void)setExternalSourceTrackingChanged:(BOOL)a3
{
  self->_externalSourceTrackingChanged = a3;
}

- (AKController)controller
{
  return (AKController *)objc_loadWeakRetained((id *)&self->_controller);
}

- (void)setController:(id)a3
{
  objc_storeWeak((id *)&self->_controller, a3);
}

- (NSMutableSet)observedPageModelControllers
{
  return (NSMutableSet *)objc_getProperty(self, a2, 32, 1);
}

- (void)setObservedPageModelControllers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSMutableSet)observedAnnotations
{
  return (NSMutableSet *)objc_getProperty(self, a2, 40, 1);
}

- (void)setObservedAnnotations:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSString)undoGroupPresentablePropertyName
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setUndoGroupPresentablePropertyName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (BOOL)undoGroupHasChangesToMultipleProperties
{
  return self->_undoGroupHasChangesToMultipleProperties;
}

- (void)setUndoGroupHasChangesToMultipleProperties:(BOOL)a3
{
  self->_undoGroupHasChangesToMultipleProperties = a3;
}

- (NSMapTable)undoGroupOldPropertiesPerAnnotation
{
  return (NSMapTable *)objc_getProperty(self, a2, 56, 1);
}

- (void)setUndoGroupOldPropertiesPerAnnotation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_undoGroupOldPropertiesPerAnnotation, 0);
  objc_storeStrong((id *)&self->_undoGroupPresentablePropertyName, 0);
  objc_storeStrong((id *)&self->_observedAnnotations, 0);
  objc_storeStrong((id *)&self->_observedPageModelControllers, 0);
  objc_destroyWeak((id *)&self->_controller);
  objc_storeStrong((id *)&self->_undoManager, 0);
}

@end
