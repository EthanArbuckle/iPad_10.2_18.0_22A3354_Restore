@implementation AKSidecarController

+ (BOOL)validateInitialMessage:(id)a3 applicationData:(id)a4
{
  id v5;
  uint64_t (**v6)(id, void *);
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  char v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v5 = a3;
  v6 = (uint64_t (**)(id, void *))a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v5;
    objc_msgSend(v7, "objectForKeyedSubscript:", &unk_24F1CFCC0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "unsignedIntegerValue");

    objc_msgSend(v7, "objectForKeyedSubscript:", &unk_24F1CFCD8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "unsignedIntegerValue");

    objc_msgSend(v7, "objectForKeyedSubscript:", &unk_24F1CFCF0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      if (v11)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v13 = v6[2](v6, v12);
LABEL_14:

          goto LABEL_15;
        }
        sub_22906ACEC();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          sub_22907FE98();
      }
      else
      {
        sub_22906ACEC();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          sub_22907FE30(v14, v15, v16, v17, v18, v19, v20, v21);
      }
    }
    else
    {
      sub_22906ACEC();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        sub_22907FE04();
    }

    v13 = 0;
    goto LABEL_14;
  }
  v13 = 0;
LABEL_15:

  return v13;
}

- (AKSidecarController)initWithController:(id)a3
{
  id v4;
  AKSidecarController *v5;
  AKSidecarController *v6;
  uint64_t v7;
  NSMutableSet *observedPageModelControllers;
  uint64_t v9;
  NSMutableSet *observedAnnotations;
  uint64_t v11;
  NSMutableSet *coalescingAnnotationKeys;
  void *v13;
  void *v14;
  void *v15;
  dispatch_source_t v16;
  OS_dispatch_source *coalescingAnnotationSource;
  NSObject *v18;
  _QWORD v20[4];
  id v21;
  id location;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)AKSidecarController;
  v5 = -[AKSidecarController init](&v23, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_controller, v4);
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v7 = objc_claimAutoreleasedReturnValue();
    observedPageModelControllers = v6->_observedPageModelControllers;
    v6->_observedPageModelControllers = (NSMutableSet *)v7;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v9 = objc_claimAutoreleasedReturnValue();
    observedAnnotations = v6->_observedAnnotations;
    v6->_observedAnnotations = (NSMutableSet *)v9;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v11 = objc_claimAutoreleasedReturnValue();
    coalescingAnnotationKeys = v6->_coalescingAnnotationKeys;
    v6->_coalescingAnnotationKeys = (NSMutableSet *)v11;

    v6->_updatingModel = 0;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "undoController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "undoManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&location, v6);
    objc_msgSend(v13, "addObserver:selector:name:object:", v6, sel__handleUndo_, *MEMORY[0x24BDD13B8], v15);
    objc_msgSend(v13, "addObserver:selector:name:object:", v6, sel__handleRedo_, *MEMORY[0x24BDD13B0], v15);
    objc_msgSend(v13, "addObserver:selector:name:object:", v6, sel__handleUndoCheckpoint_, *MEMORY[0x24BDD13A0], v15);
    objc_msgSend(v13, "addObserver:selector:name:object:", v6, sel_observePageControllerRequestsDisableRegistration_, off_255A25E18[0], 0);
    objc_msgSend(v13, "addObserver:selector:name:object:", v6, sel_observePageControllerRequestsEnableRegistration_, off_255A25E20, 0);
    v16 = dispatch_source_create(MEMORY[0x24BDAC9D0], 0, 0, MEMORY[0x24BDAC9B8]);
    coalescingAnnotationSource = v6->_coalescingAnnotationSource;
    v6->_coalescingAnnotationSource = (OS_dispatch_source *)v16;

    v18 = v6->_coalescingAnnotationSource;
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = sub_22906AF90;
    v20[3] = &unk_24F1A77E0;
    objc_copyWeak(&v21, &location);
    dispatch_source_set_event_handler(v18, v20);
    dispatch_activate((dispatch_object_t)v6->_coalescingAnnotationSource);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  NSObject *coalescingAnnotationSource;
  objc_super v5;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[AKSidecarController _unregisterObservers](self, "_unregisterObservers");
  coalescingAnnotationSource = self->_coalescingAnnotationSource;
  if (coalescingAnnotationSource)
    dispatch_source_cancel(coalescingAnnotationSource);
  v5.receiver = self;
  v5.super_class = (Class)AKSidecarController;
  -[AKSidecarController dealloc](&v5, sel_dealloc);
}

- (void)setShouldObserveEdits:(BOOL)a3
{
  if (self->_shouldObserveEdits != a3)
  {
    self->_shouldObserveEdits = a3;
    if (a3)
      MEMORY[0x24BEDD108](self, sel__registerObservers);
    else
      -[AKSidecarController _unregisterObservers](self, "_unregisterObservers");
  }
}

- (void)_registerObservers
{
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  objc_msgSend(WeakRetained, "addObserver:forKeyPath:options:context:", self, CFSTR("currentPageIndex"), 3, CFSTR("AKSidecarController.currentPageIndex"));
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(WeakRetained, "modelController", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pageModelControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[AKSidecarController startObservingPageModelController:](self, "startObservingPageModelController:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)_unregisterObservers
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id WeakRetained;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[NSMutableSet allObjects](self->_observedAnnotations, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKSidecarController _stopObservingAnnotations:](self, "_stopObservingAnnotations:", v3);

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = (void *)-[NSMutableSet copy](self->_observedPageModelControllers, "copy", 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        -[AKSidecarController stopObservingPageModelController:](self, "stopObservingPageModelController:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  objc_msgSend(WeakRetained, "removeObserver:forKeyPath:context:", self, CFSTR("currentPageIndex"), CFSTR("AKSidecarController.currentPageIndex"));

  -[NSMutableSet removeAllObjects](self->_observedPageModelControllers, "removeAllObjects");
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
  -[AKSidecarController setShouldObserveEdits:](self, "setShouldObserveEdits:", a3 != 0);
}

- (void)done
{
  NSObject *v3;
  id WeakRetained;
  uint8_t v5[16];

  sub_22906ACEC();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_228FC0000, v3, OS_LOG_TYPE_DEFAULT, "Client finished session", v5, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "sidecarControllerCancelled:", self);

}

- (void)_handleInternalFailure
{
  NSObject *v3;
  id WeakRetained;

  sub_22906ACEC();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    sub_22907FEC4();

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "sidecarControllerCancelled:", self);

}

- (void)startObservingPageModelController:(id)a3
{
  void *v4;
  id v5;

  if (self->_shouldObserveEdits)
  {
    v5 = a3;
    objc_msgSend(v5, "annotations");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKSidecarController _startObservingAnnotations:](self, "_startObservingAnnotations:", v4);

    objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, CFSTR("annotations"), 11, CFSTR("AKSidecarController.modelAnnotationsObservationContext"));
    objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, CFSTR("selectedAnnotations"), 1, CFSTR("AKSidecarController.selectedAnnotationsObservationContext"));
    -[NSMutableSet addObject:](self->_observedPageModelControllers, "addObject:", v5);

  }
}

- (void)stopObservingPageModelController:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[NSMutableSet containsObject:](self->_observedPageModelControllers, "containsObject:"))
  {
    objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("annotations"), CFSTR("AKSidecarController.modelAnnotationsObservationContext"));
    objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("selectedAnnotations"), CFSTR("AKSidecarController.selectedAnnotationsObservationContext"));
    -[NSMutableSet removeObject:](self->_observedPageModelControllers, "removeObject:", v5);
    objc_msgSend(v5, "annotations");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKSidecarController _stopObservingAnnotations:](self, "_stopObservingAnnotations:", v4);

  }
}

- (unint64_t)_indexOfAnnotationUUID:(id)a3 annotations:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char v14;
  unint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = a4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v18;
    while (2)
    {
      v11 = 0;
      v12 = v9 + v8;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v11), "UUID", (_QWORD)v17);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", v5);

        if ((v14 & 1) != 0)
        {
          v15 = v9 + v11;
          goto LABEL_11;
        }
        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      v9 = v12;
      if (v8)
        continue;
      break;
    }
  }
  v15 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_11:

  return v15;
}

- (id)_annotationWithUUID:(id)a3 inPageModelController:(id)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;

  v6 = a3;
  objc_msgSend(a4, "annotations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[AKSidecarController _indexOfAnnotationUUID:annotations:](self, "_indexOfAnnotationUUID:annotations:", v6, v7);

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v7, "objectAtIndex:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (BOOL)_replaceAnnotation:(id)a3 inPageModelController:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "annotations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[AKSidecarController _indexOfAnnotationUUID:annotations:](self, "_indexOfAnnotationUUID:annotations:", v8, v9);

  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v7, "annotations");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "insertObject:inAnnotationsAtIndex:", v6, objc_msgSend(v11, "count"));

  }
  else
  {
    objc_msgSend(v7, "replaceObjectInAnnotationsAtIndex:withObject:", v10, v6);
  }

  return 1;
}

- (id)_inkAnnotationFromPageModelController:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_opt_class();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v3, "annotations", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reverseObjectEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v10, "UUID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (BOOL)_removeAnnotationUUID:(id)a3 fromPageModelController:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "annotations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[AKSidecarController _indexOfAnnotationUUID:annotations:](self, "_indexOfAnnotationUUID:annotations:", v7, v8);

  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v6, "removeObjectFromAnnotationsAtIndex:", v9);

  return v9 != 0x7FFFFFFFFFFFFFFFLL;
}

- (void)handleIncomingOPACKObject:(id)a3
{
  id v4;
  NSObject *WeakRetained;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
    v6 = v4;
    objc_msgSend(v6, "objectForKeyedSubscript:", &unk_24F1CFD08);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "unsignedIntegerValue");

    sub_22906ACEC();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        sub_22907FFB8();

      self->_updatingModel = 1;
      switch(v8)
      {
        case 1:
          goto LABEL_14;
        case 2:
          self->_handlingUndoRedo = 1;
          -[NSObject undoController](WeakRetained, "undoController");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "undoManager");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "undo");
          goto LABEL_22;
        case 3:
          self->_handlingUndoRedo = 1;
          -[NSObject undoController](WeakRetained, "undoController");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "undoManager");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "redo");
LABEL_22:

          self->_handlingUndoRedo = 0;
          goto LABEL_24;
        case 4:
          -[NSObject undoController](WeakRetained, "undoController");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "undoManager");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          self->_sendingCheckpoint = 1;
          objc_msgSend(v13, "setExternalSourceTrackingChanged:", 0);
          objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "postNotificationName:object:", *MEMORY[0x24BDD13A0], v14);

          self->_sendingCheckpoint = 0;
          goto LABEL_24;
        default:
          if ((unint64_t)(v8 - 1000) < 4)
          {
LABEL_14:
            sub_22906ACEC();
            v10 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
              sub_22907FF58();
            goto LABEL_16;
          }
          switch(v8)
          {
            case 2000:
              -[AKSidecarController _handleAnnotationAdd:](self, "_handleAnnotationAdd:", v6);
              break;
            case 2001:
              -[AKSidecarController _handleAnnotationRemove:](self, "_handleAnnotationRemove:", v6);
              break;
            case 2002:
              -[AKSidecarController _handleAnnotationModify:](self, "_handleAnnotationModify:", v6);
              break;
            case 2003:
              -[AKSidecarController _handleSelectionChanged:](self, "_handleSelectionChanged:", v6);
              break;
            default:
              break;
          }
LABEL_24:
          self->_updatingModel = 0;
          break;
      }
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_22907FEF0();
LABEL_16:

      -[AKSidecarController _handleInternalFailure](self, "_handleInternalFailure");
    }

  }
  else
  {
    sub_22906ACEC();
    WeakRetained = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
      sub_229080018();
  }

}

- (void)_handleAnnotationAdd:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD v42[4];
  id v43;
  id v44;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  objc_msgSend(WeakRetained, "modelController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pageModelControllers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", &unk_24F1CFD20);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", &unk_24F1CFD38);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", &unk_24F1CFD50);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", &unk_24F1CFD68);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    +[AKAnnotation annotationWithData:](AKAnnotation, "annotationWithData:", v8);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v9, "unsignedIntegerValue");
    v14 = objc_msgSend(v10, "unsignedIntegerValue");
    v35 = (void *)v12;
    if (v12)
    {
      v32 = v14;
      if (v13 < objc_msgSend(v7, "count"))
      {
        objc_msgSend(WeakRetained, "modelController");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "pageModelControllerForPage:", v13);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          sub_22906ACEC();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            sub_229080070();

          objc_msgSend(v34, "inkCanvasAnnotation");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            objc_msgSend(WeakRetained, "undoController");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "undoManager");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v42[0] = MEMORY[0x24BDAC760];
            v42[1] = 3221225472;
            v42[2] = sub_22906C18C;
            v42[3] = &unk_24F1A76F8;
            v43 = v34;
            v44 = v35;
            sub_22906C0F0(v19, v42);

            -[AKSidecarController _startChangeUndoGroup](self, "_startChangeUndoGroup");
            v20 = v43;
          }
          else
          {
            objc_msgSend(WeakRetained, "pageControllers");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "objectAtIndex:", v13);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v35, "drawing");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "inkPageOverlayController");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "inkOverlayView");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "canvasView");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "setDrawing:", v33);

          }
        }
        else
        {
          objc_msgSend(v34, "annotations");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "count");

          sub_22906ACEC();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            sub_2290800A8(v35, v25);

          objc_msgSend(WeakRetained, "undoController");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "undoManager");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v36[0] = MEMORY[0x24BDAC760];
          v36[1] = 3221225472;
          v36[2] = sub_22906C238;
          v36[3] = &unk_24F1A8310;
          v37 = v34;
          v38 = v35;
          v40 = v32;
          v41 = v24;
          v39 = v11;
          sub_22906C0F0(v27, v36);

          v20 = v37;
        }

        goto LABEL_25;
      }
      sub_22906ACEC();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        sub_229080154();
    }
    else
    {
      sub_22906ACEC();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        sub_229080044();
    }

    -[AKSidecarController _handleInternalFailure](self, "_handleInternalFailure");
LABEL_25:

    goto LABEL_14;
  }
  sub_22906ACEC();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    sub_2290801B4();

  -[AKSidecarController _handleInternalFailure](self, "_handleInternalFailure");
LABEL_14:

}

- (void)_handleAnnotationRemove:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  _QWORD v18[5];
  id v19;
  id v20;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  objc_msgSend(v4, "objectForKeyedSubscript:", &unk_24F1CFD80);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", &unk_24F1CFD38);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", &unk_24F1CFD98);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v9 = objc_msgSend(v7, "unsignedIntegerValue");
    objc_msgSend(WeakRetained, "modelController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pageModelControllerForPage:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "BOOLValue"))
    {
      -[AKSidecarController _inkAnnotationFromPageModelController:](self, "_inkAnnotationFromPageModelController:", v11);
      v12 = objc_claimAutoreleasedReturnValue();

      v6 = (id)v12;
    }
    sub_22906ACEC();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      sub_22908021C();

    objc_msgSend(WeakRetained, "undoController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "undoManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = sub_22906C4DC;
    v18[3] = &unk_24F1A7AB8;
    v18[4] = self;
    v6 = v6;
    v19 = v6;
    v20 = v11;
    v16 = v11;
    sub_22906C0F0(v15, v18);

  }
  else
  {
    sub_22906ACEC();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_22908027C();

    -[AKSidecarController _handleInternalFailure](self, "_handleInternalFailure");
  }

}

- (void)_handleAnnotationModify:(id)a3
{
  id v4;
  id WeakRetained;
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
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  id v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  id v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  NSObject *v38;
  NSObject *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  AKSidecarController *v52;
  _QWORD v53[4];
  id v54;
  id v55;
  id v56;
  _QWORD v57[4];
  id v58;
  id v59;
  _QWORD v60[4];
  id v61;
  id v62;
  id v63;
  _QWORD v64[11];

  v64[9] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v52 = self;
  WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  objc_msgSend(WeakRetained, "modelController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pageModelControllers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v64[0] = objc_opt_class();
  v64[1] = objc_opt_class();
  v64[2] = objc_opt_class();
  v64[3] = objc_opt_class();
  v64[4] = objc_opt_class();
  v64[5] = objc_opt_class();
  v64[6] = objc_opt_class();
  v64[7] = objc_opt_class();
  v64[8] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v64, 9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", &unk_24F1CFD80);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", &unk_24F1CFD38);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v4;
  objc_msgSend(v4, "objectForKeyedSubscript:", &unk_24F1CFDB0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = WeakRetained;
  objc_msgSend(WeakRetained, "undoController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "undoManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = v10;
  v17 = objc_msgSend(v10, "unsignedIntegerValue");
  v51 = v7;
  if (v17 >= objc_msgSend(v7, "count"))
  {
    sub_22906ACEC();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      sub_229080154();
    goto LABEL_17;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    sub_22906ACEC();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      sub_22908052C();
LABEL_17:

    -[AKSidecarController _handleInternalFailure](v52, "_handleInternalFailure");
    goto LABEL_18;
  }
  objc_msgSend(v13, "modelController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "pageModelControllerForPage:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", &unk_24F1CFD98);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[AKSecureSerializationHelper secureCodingCompliantObjectForData:ofClasses:withOptionalKey:](AKSecureSerializationHelper, "secureCodingCompliantObjectForData:ofClasses:withOptionalKey:", v12, v8, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v46 = v21;
      v44 = v20;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (objc_msgSend(v20, "BOOLValue"))
        {
          -[AKSidecarController _inkAnnotationFromPageModelController:](v52, "_inkAnnotationFromPageModelController:", v19);
          v22 = objc_claimAutoreleasedReturnValue();

          v9 = (void *)v22;
        }
        v49 = v19;
        -[AKSidecarController _annotationWithUUID:inPageModelController:](v52, "_annotationWithUUID:inPageModelController:", v9, v19);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v24 = v23;
          v25 = v23;
          sub_22906ACEC();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
            sub_2290803D8();

          v57[0] = MEMORY[0x24BDAC760];
          v57[1] = 3221225472;
          v57[2] = sub_22906CCD8;
          v57[3] = &unk_24F1A76F8;
          v58 = v25;
          v59 = v46;
          v27 = v25;
          sub_22906C0F0(v15, v57);

        }
        else
        {
          v24 = v23;
          sub_22906ACEC();
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
            sub_229080438();

          v53[0] = MEMORY[0x24BDAC760];
          v53[1] = 3221225472;
          v53[2] = sub_22906CCE4;
          v53[3] = &unk_24F1A7AB8;
          v54 = v13;
          v55 = v24;
          v56 = v21;
          sub_22906C0F0(v15, v53);
          -[AKSidecarController _startChangeUndoGroup](v52, "_startChangeUndoGroup");

          v27 = v54;
        }

        v19 = v49;
      }
      else
      {
        sub_22906ACEC();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          sub_229080498();

        -[AKSidecarController _handleInternalFailure](v52, "_handleInternalFailure");
      }

    }
    else
    {
      sub_22906ACEC();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        sub_2290804C4();

      -[AKSidecarController _handleInternalFailure](v52, "_handleInternalFailure");
    }
  }
  else
  {
    v50 = v19;
    objc_msgSend(v11, "objectForKeyedSubscript:", &unk_24F1CFDC8);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", &unk_24F1CFD20);
    v30 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      +[AKAnnotation annotationWithData:](AKAnnotation, "annotationWithData:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = (void *)v30;
      v47 = v31;
      if (v31)
      {
        objc_msgSend(v31, "dictionaryWithValuesForKeys:", v29);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[AKSidecarController _annotationWithUUID:inPageModelController:](v52, "_annotationWithUUID:inPageModelController:", v9, v50);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        sub_22906ACEC();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          sub_229080310();

        v60[0] = MEMORY[0x24BDAC760];
        v60[1] = 3221225472;
        v60[2] = sub_22906CC68;
        v60[3] = &unk_24F1A7AB8;
        v61 = v13;
        v62 = v41;
        v63 = v42;
        v43 = v42;
        v33 = v41;
        sub_22906C0F0(v15, v60);
        -[AKSidecarController _startChangeUndoGroup](v52, "_startChangeUndoGroup");

      }
      else
      {
        sub_22906ACEC();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          sub_2290802E4();

        -[AKSidecarController _handleInternalFailure](v52, "_handleInternalFailure");
      }

      v37 = v45;
    }
    else
    {
      v48 = v29;
      v35 = (void *)v30;
      sub_22906ACEC();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        sub_229080370();

      -[AKSidecarController _handleInternalFailure](v52, "_handleInternalFailure");
      v37 = v35;
      v29 = v48;
    }

    v19 = v50;
  }

LABEL_18:
}

- (void)_handleSelectionChanged:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  int v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  objc_msgSend(WeakRetained, "modelController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pageModelControllers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", &unk_24F1CFD38);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", &unk_24F1CFDE0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    sub_22906ACEC();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      sub_2290805F4();

    goto LABEL_23;
  }
  v10 = objc_msgSend(v8, "unsignedIntegerValue");
  if (v10 >= objc_msgSend(v7, "count"))
  {
    sub_22906ACEC();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      sub_229080154();

LABEL_23:
    -[AKSidecarController _handleInternalFailure](self, "_handleInternalFailure");
    goto LABEL_24;
  }
  objc_msgSend(WeakRetained, "modelController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "pageModelControllerForPage:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v12, "valueForKeyPath:", CFSTR("selectedAnnotations.UUID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v13, "isEqualToSet:", v14) & 1) == 0)
    {
      v27 = v13;
      v29 = v9;
      v30 = v8;
      v31 = v7;
      v32 = WeakRetained;
      objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      sub_22906ACEC();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        sub_229080594();

      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v28 = v12;
      objc_msgSend(v12, "annotations");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      if (v18)
      {
        v19 = v18;
        v20 = 0;
        v21 = *(_QWORD *)v34;
        do
        {
          v22 = 0;
          do
          {
            if (*(_QWORD *)v34 != v21)
              objc_enumerationMutation(v17);
            objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v22), "UUID");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v14, "containsObject:", v23);

            if (v24)
              objc_msgSend(v15, "addIndex:", v20 + v22);
            ++v22;
          }
          while (v19 != v22);
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
          v20 += v22;
        }
        while (v19);
      }

      v12 = v28;
      objc_msgSend(v28, "selectAnnotationsAtIndexes:byExtendingSelection:", v15, 0);

      v7 = v31;
      WeakRetained = v32;
      v9 = v29;
      v8 = v30;
      v13 = v27;
    }

  }
LABEL_24:

}

- (BOOL)handleLiveStrokeBegan:(id)a3 onInkOverlayView:(id)a4
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  OS_dispatch_source *strokeTimer;
  NSObject *v22;
  id v24;
  _QWORD handler[5];
  _QWORD v26[4];
  _QWORD v27[5];

  v27[4] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    objc_msgSend(v8, "pageController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "inkPageOverlayController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "inkOverlayView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "canvasView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "scaleFromDrawingInCanvasView:toPageControllerModelSpace:", v13, v10);
    v15 = v14;

    objc_storeStrong((id *)&self->_currentStroke, a3);
    objc_msgSend(v7, "dataRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v7;
    v26[0] = &unk_24F1CFD08;
    v26[1] = &unk_24F1CFDF8;
    v27[0] = &unk_24F1CFD38;
    v27[1] = v16;
    v26[2] = &unk_24F1CFE10;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v27[2] = v17;
    v26[3] = &unk_24F1CFD38;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v10, "pageIndex"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v27[3] = v18;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKSidecarController _sendDictionary:](self, "_sendDictionary:", v19);

    objc_storeStrong((id *)&self->_currentStrokeOverlay, a4);
    v20 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, MEMORY[0x24BDAC9B8]);
    dispatch_source_set_timer(v20, 0, 0xFE502AuLL, 0xFE502AuLL);
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = sub_22906D320;
    handler[3] = &unk_24F1A7328;
    handler[4] = self;
    dispatch_source_set_event_handler(v20, handler);
    dispatch_resume(v20);
    strokeTimer = self->_strokeTimer;
    self->_strokeTimer = (OS_dispatch_source *)v20;
    v22 = v20;

    v7 = v24;
  }

  return WeakRetained != 0;
}

- (void)_handleLiveStrokeUpdate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  _QWORD *v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  -[AKInkOverlayView canvasView](self->_currentStrokeOverlay, "canvasView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_currentStroke");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PKStroke deltaTo:](self->_currentStroke, "deltaTo:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v15[0] = &unk_24F1CFDE0;
      v14[0] = &unk_24F1CFD08;
      v14[1] = &unk_24F1CFE28;
      objc_msgSend(v5, "dataRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v15[1] = v7;
      v8 = (void *)MEMORY[0x24BDBCE70];
      v9 = v15;
      v10 = v14;
    }
    else
    {
      v13[0] = &unk_24F1CFDE0;
      v12[0] = &unk_24F1CFD08;
      v12[1] = &unk_24F1CFDF8;
      objc_msgSend(v4, "dataRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v13[1] = v7;
      v8 = (void *)MEMORY[0x24BDBCE70];
      v9 = v13;
      v10 = v12;
    }
    objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v9, v10, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKSidecarController _sendDictionary:](self, "_sendDictionary:", v11);

  }
}

- (void)handleLiveStrokeComplete:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *strokeTimer;
  OS_dispatch_source *v8;
  AKInkOverlayView *currentStrokeOverlay;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  if (a3)
    v4 = 1002;
  else
    v4 = 1003;
  v10 = &unk_24F1CFD08;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKSidecarController _sendDictionary:](self, "_sendDictionary:", v6);

  strokeTimer = self->_strokeTimer;
  if (strokeTimer)
  {
    dispatch_source_cancel(strokeTimer);
    v8 = self->_strokeTimer;
  }
  else
  {
    v8 = 0;
  }
  self->_strokeTimer = 0;

  currentStrokeOverlay = self->_currentStrokeOverlay;
  self->_currentStrokeOverlay = 0;

}

- (void)_actuallySendAnnotationChange
{
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  AKAnnotation *coalescingAnnotationChange;
  id v8;

  if (self->_coalescingAnnotationChange)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
    objc_msgSend(WeakRetained, "modelController");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "pageModelControllerForAnnotation:", self->_coalescingAnnotationChange);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pageModelControllers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "indexOfObject:", v4);

    -[AKSidecarController _annotation:modifiedInPageController:properties:](self, "_annotation:modifiedInPageController:properties:", self->_coalescingAnnotationChange, v6, self->_coalescingAnnotationKeys);
    -[NSMutableSet removeAllObjects](self->_coalescingAnnotationKeys, "removeAllObjects");
    coalescingAnnotationChange = self->_coalescingAnnotationChange;
    self->_coalescingAnnotationChange = 0;

  }
}

- (void)_coalesceAnnotationChange:(id)a3 keyChange:(id)a4
{
  id v7;
  AKAnnotation *v8;

  v8 = (AKAnnotation *)a3;
  v7 = a4;
  if (self->_coalescingAnnotationChange != v8)
    -[AKSidecarController _actuallySendAnnotationChange](self, "_actuallySendAnnotationChange");
  if (v8)
  {
    objc_storeStrong((id *)&self->_coalescingAnnotationChange, a3);
    -[NSMutableSet addObject:](self->_coalescingAnnotationKeys, "addObject:", v7);
    dispatch_source_merge_data((dispatch_source_t)self->_coalescingAnnotationSource, 1uLL);
  }

}

- (void)_handleUndo:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  if (!self->_handlingUndoRedo)
  {
    v5 = &unk_24F1CFD08;
    v6[0] = &unk_24F1CFD08;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKSidecarController _sendDictionary:](self, "_sendDictionary:", v4);

  }
}

- (void)_handleRedo:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  if (!self->_handlingUndoRedo)
  {
    v5 = &unk_24F1CFD08;
    v6[0] = &unk_24F1CFCF0;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKSidecarController _sendDictionary:](self, "_sendDictionary:", v4);

  }
}

- (void)_handleUndoCheckpoint:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!*(_WORD *)&self->_handlingUndoRedo && self->_needCheckpointSent)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
    objc_msgSend(WeakRetained, "mainEventHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "mainEventHandlerIsInTrackingLoop") & 1) == 0)
    {
      objc_msgSend(v6, "annotationEventHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {

      }
      else if ((objc_msgSend(v6, "mainEventHandlerIsInRotationLoop") & 1) == 0)
      {
        self->_needCheckpointSent = 0;
        v9 = &unk_24F1CFD08;
        v10[0] = &unk_24F1CFE40;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[AKSidecarController _sendDictionary:](self, "_sendDictionary:", v8);

      }
    }

  }
}

- (void)_startChangeUndoGroup
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  objc_msgSend(WeakRetained, "undoController");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "externalSourceTrackingChanged") & 1) == 0)
  {
    objc_msgSend(v3, "setExternalSourceTrackingChanged:", 1);
    objc_msgSend(MEMORY[0x24BDD1898], "_endTopLevelGroupings");
  }

}

- (void)observePageControllerRequestsDisableRegistration:(id)a3
{
  self->_ignoreKVOChanges = 1;
}

- (void)observePageControllerRequestsEnableRegistration:(id)a3
{
  self->_ignoreKVOChanges = 0;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  id WeakRetained;
  void *v17;
  void *v18;
  uint64_t v19;
  char v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  int v29;
  NSObject *v30;
  void *v31;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (!self->_ignoreKVOChanges)
  {
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BDD0E78]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "BOOLValue");

    WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
    objc_msgSend(WeakRetained, "undoController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "undoManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v18, "isUndoing") & 1) != 0)
      v19 = 1;
    else
      v19 = objc_msgSend(v18, "isRedoing");
    if (a6 == CFSTR("AKSidecarController.annotationPropertyObservationContext"))
    {
      if (self->_updatingModel)
        v20 = 1;
      else
        v20 = v19;
      if ((v20 & 1) == 0)
      {
        objc_msgSend(v13, "objectForKey:", *MEMORY[0x24BDD0E80]);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKey:", *MEMORY[0x24BDD0E70]);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v11;
        if (!objc_msgSend(v21, "isEqual:", v22)
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          -[AKSidecarController _coalesceAnnotationChange:keyChange:](self, "_coalesceAnnotationChange:keyChange:", v23, v10);
        }

      }
    }
    else if (a6 == CFSTR("AKSidecarController.modelAnnotationsObservationContext"))
    {
      objc_msgSend(v13, "objectForKey:", *MEMORY[0x24BDD0E80]);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKey:", *MEMORY[0x24BDD0E70]);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v26 = v11;
        v27 = v24;
        v28 = v26;
        v31 = v27;
        if (v27)
          v29 = v15;
        else
          v29 = 0;
        if (v29 == 1)
          -[AKSidecarController _annotationsWillBeRemoved:onPageController:isUndoingRedoing:](self, "_annotationsWillBeRemoved:onPageController:isUndoingRedoing:", v31, v26, v19);
        if (v25)
          -[AKSidecarController _annotationsWereAdded:onPageController:isUndoingRedoing:](self, "_annotationsWereAdded:onPageController:isUndoingRedoing:", v25, v28, v19);

        v24 = v31;
      }
      else
      {
        sub_22906ACEC();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          sub_22908065C((uint64_t)v11, v30);

      }
    }
    else if (a6 == CFSTR("AKSidecarController.selectedAnnotationsObservationContext") && !self->_updatingModel)
    {
      -[AKSidecarController _selectionChangedOnPageController:](self, "_selectionChangedOnPageController:", v11);
    }

  }
}

- (void)_annotationsWereAdded:(id)a3 onPageController:(id)a4 isUndoingRedoing:(BOOL)a5
{
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "count"))
  {
    -[AKSidecarController _startObservingAnnotations:](self, "_startObservingAnnotations:", v8);
    if (!self->_updatingModel && !a5)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
      objc_msgSend(WeakRetained, "modelController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "pageModelControllers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "indexOfObject:", v9);

      objc_msgSend(v9, "annotations");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v9;
      objc_msgSend(v9, "selectedAnnotations");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v22 = v8;
      v16 = v8;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v24;
        do
        {
          v20 = 0;
          do
          {
            if (*(_QWORD *)v24 != v19)
              objc_enumerationMutation(v16);
            -[AKSidecarController _annotation:addedToPageController:selected:atIndex:](self, "_annotation:addedToPageController:selected:atIndex:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v20), v13, objc_msgSend(v15, "containsObject:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v20)), objc_msgSend(v14, "indexOfObject:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v20)));
            ++v20;
          }
          while (v18 != v20);
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        }
        while (v18);
      }

      v9 = v21;
      v8 = v22;
    }
  }

}

- (void)_annotationsWillBeRemoved:(id)a3 onPageController:(id)a4 isUndoingRedoing:(BOOL)a5
{
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  int v22;
  AKAnnotation *coalescingAnnotationChange;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "count"))
  {
    -[AKSidecarController _stopObservingAnnotations:](self, "_stopObservingAnnotations:", v8);
    if (!a5)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
      objc_msgSend(WeakRetained, "modelController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "pageModelControllers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v9;
      v13 = objc_msgSend(v12, "indexOfObject:", v9);

      -[AKAnnotation UUID](self->_coalescingAnnotationChange, "UUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v25 = v8;
      v15 = v8;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v27;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v27 != v18)
              objc_enumerationMutation(v15);
            v20 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
            objc_msgSend(v20, "UUID");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v14, "isEqualToString:", v21);

            if (v22)
            {
              coalescingAnnotationChange = self->_coalescingAnnotationChange;
              self->_coalescingAnnotationChange = 0;

            }
            if (!self->_updatingModel)
              -[AKSidecarController _annotation:removedFromPageController:](self, "_annotation:removedFromPageController:", v20, v13);
          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        }
        while (v17);
      }

      v9 = v24;
      v8 = v25;
    }
  }

}

- (void)_startObservingAnnotations:(id)a3
{
  id v4;
  void *v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  uint64_t v13;
  id obj;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24F1CF7B0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v4;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v16)
  {
    v15 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v7, "keysForValuesToObserveForUndo");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v18;
          do
          {
            for (j = 0; j != v10; ++j)
            {
              if (*(_QWORD *)v18 != v11)
                objc_enumerationMutation(v8);
              v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * j);
              if ((objc_msgSend(v5, "containsObject:", v13) & 1) == 0)
                objc_msgSend(v7, "addObserver:forKeyPath:options:context:", self, v13, 3, CFSTR("AKSidecarController.annotationPropertyObservationContext"));
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          }
          while (v10);
        }
        -[NSMutableSet addObject:](self->_observedAnnotations, "addObject:", v7);

      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v16);
  }

}

- (void)_stopObservingAnnotations:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  uint64_t v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24F1CF7C8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    do
    {
      v9 = 0;
      v17 = v7;
      do
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v9);
        if (-[NSMutableSet containsObject:](self->_observedAnnotations, "containsObject:", v10, v17))
        {
          objc_msgSend(v10, "keysForValuesToObserveForUndo");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = 0u;
          v20 = 0u;
          v21 = 0u;
          v22 = 0u;
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v20;
            do
            {
              for (i = 0; i != v13; ++i)
              {
                if (*(_QWORD *)v20 != v14)
                  objc_enumerationMutation(v11);
                v16 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
                if ((objc_msgSend(v5, "containsObject:", v16) & 1) == 0)
                  objc_msgSend(v10, "removeObserver:forKeyPath:", self, v16);
              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
            }
            while (v13);
          }
          -[NSMutableSet removeObject:](self->_observedAnnotations, "removeObject:", v10);

          v7 = v17;
        }
        ++v9;
      }
      while (v9 != v7);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v7);
  }

}

- (void)_annotation:(id)a3 addedToPageController:(unint64_t)a4 selected:(BOOL)a5 atIndex:(unint64_t)a6
{
  _BOOL8 v7;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  _QWORD v18[5];
  _QWORD v19[6];

  v7 = a5;
  v19[5] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  objc_msgSend(v10, "dataRepresentation");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
  {
    v18[0] = &unk_24F1CFD08;
    v18[1] = &unk_24F1CFD20;
    v19[0] = &unk_24F1CFD80;
    v19[1] = v11;
    v18[2] = &unk_24F1CFD38;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[2] = v13;
    v18[3] = &unk_24F1CFD50;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19[3] = v14;
    v18[4] = &unk_24F1CFD68;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19[4] = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKSidecarController _sendDictionary:](self, "_sendDictionary:", v16);

  }
  else
  {
    sub_22906ACEC();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_2290806F0();

    -[AKSidecarController _handleInternalFailure](self, "_handleInternalFailure");
  }

}

- (void)_annotation:(id)a3 removedFromPageController:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  void *v12;
  _QWORD v13[4];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x24BDAC8D0];
  v14[0] = &unk_24F1CFD50;
  v13[0] = &unk_24F1CFD08;
  v13[1] = &unk_24F1CFD80;
  v6 = a3;
  objc_msgSend(v6, "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v7;
  v13[2] = &unk_24F1CFD38;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v8;
  v13[3] = &unk_24F1CFD98;
  v9 = (void *)MEMORY[0x24BDD16E0];
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  objc_msgSend(v9, "numberWithBool:", isKindOfClass & 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKSidecarController _sendDictionary:](self, "_sendDictionary:", v12);

}

- (void)_annotation:(id)a3 modifiedInPageController:(unint64_t)a4 properties:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[7];

  v21[5] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  objc_msgSend(v9, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "containsObject:", CFSTR("typingAttributes")) & 1) != 0
    || (objc_msgSend(v9, "containsObject:", CFSTR("annotationText")) & 1) != 0
    || objc_msgSend(v9, "containsObject:", CFSTR("quadPoints")))
  {
    objc_msgSend(v8, "dataRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = &unk_24F1CFD20;
    v20[0] = &unk_24F1CFD08;
    v20[1] = &unk_24F1CFD80;
    objc_msgSend(v8, "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v12;
    v20[2] = &unk_24F1CFD38;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21[2] = v13;
    v21[3] = v10;
    v20[3] = &unk_24F1CFDC8;
    v20[4] = &unk_24F1CFD20;
    v21[4] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKSidecarController _sendDictionary:](self, "_sendDictionary:", v14);
  }
  else
  {
    objc_msgSend(v8, "dictionaryWithValuesForKeys:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[AKSecureSerializationHelper dataForSecureCodingCompliantObject:withOptionalKey:](AKSecureSerializationHelper, "dataForSecureCodingCompliantObject:withOptionalKey:", v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = &unk_24F1CFD20;
    objc_msgSend(v8, "UUID", &unk_24F1CFD08, &unk_24F1CFD80);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v13;
    v18[2] = &unk_24F1CFD38;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19[2] = v14;
    v19[3] = v12;
    v18[3] = &unk_24F1CFDB0;
    v18[4] = &unk_24F1CFD98;
    v15 = (void *)MEMORY[0x24BDD16E0];
    objc_opt_class();
    objc_msgSend(v15, "numberWithBool:", objc_opt_isKindOfClass() & 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19[4] = v16;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKSidecarController _sendDictionary:](self, "_sendDictionary:", v17);

  }
  self->_needCheckpointSent = 1;

}

- (void)_selectionChangedOnPageController:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  objc_msgSend(WeakRetained, "modelController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pageModelControllers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "indexOfObject:", v4);

  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v14[0] = &unk_24F1CFD68;
    v13[0] = &unk_24F1CFD08;
    v13[1] = &unk_24F1CFD38;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = v9;
    v13[2] = &unk_24F1CFDE0;
    objc_msgSend(v4, "valueForKeyPath:", CFSTR("selectedAnnotations.UUID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKSidecarController _sendDictionary:](self, "_sendDictionary:", v12);

  }
}

- (void)_sendDictionary:(id)a3
{
  id v4;
  NSObject *v5;
  id WeakRetained;

  v4 = a3;
  sub_22906ACEC();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    sub_229080750();

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "sidecarController:sendOPACKObject:", self, v4);

}

- (BOOL)shouldObserveEdits
{
  return self->_shouldObserveEdits;
}

- (AKSidecarControllerDelegate)delegate
{
  return (AKSidecarControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
  return (NSMutableSet *)objc_getProperty(self, a2, 88, 1);
}

- (void)setObservedPageModelControllers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSMutableSet)observedAnnotations
{
  return (NSMutableSet *)objc_getProperty(self, a2, 96, 1);
}

- (void)setObservedAnnotations:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observedAnnotations, 0);
  objc_storeStrong((id *)&self->_observedPageModelControllers, 0);
  objc_destroyWeak((id *)&self->_controller);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_coalescingAnnotationSource, 0);
  objc_storeStrong((id *)&self->_coalescingAnnotationChange, 0);
  objc_storeStrong((id *)&self->_coalescingAnnotationKeys, 0);
  objc_storeStrong((id *)&self->_strokeTimer, 0);
  objc_storeStrong((id *)&self->_currentStrokeOverlay, 0);
  objc_storeStrong((id *)&self->_currentStroke, 0);
}

@end
