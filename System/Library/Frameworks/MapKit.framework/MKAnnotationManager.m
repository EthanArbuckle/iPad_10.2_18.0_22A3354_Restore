@implementation MKAnnotationManager

- (NSArray)annotationRepresentations
{
  return (NSArray *)-[NSMutableSet allObjects](self->_annotationRepresentations, "allObjects");
}

- (void)updateVisibleAnnotations
{
  MKAnnotationMarkerContainer **p_container;
  id WeakRetained;
  NSTimer *updateVisibleTimer;
  NSTimer *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  int v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t j;
  uint64_t v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  p_container = &self->_container;
  WeakRetained = objc_loadWeakRetained((id *)&self->_container);

  if (WeakRetained && !self->_isChangingCoordinate)
  {
    updateVisibleTimer = self->_updateVisibleTimer;
    if (updateVisibleTimer)
    {
      -[NSTimer invalidate](updateVisibleTimer, "invalidate");
      v6 = self->_updateVisibleTimer;
      self->_updateVisibleTimer = 0;

    }
    v7 = objc_loadWeakRetained((id *)p_container);
    objc_msgSend(v7, "annotationRectTest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_loadWeakRetained((id *)p_container);
    objc_msgSend(v9, "annotationCoordinateTest");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 && v10)
    {
      -[MKQuadTrie itemsPassingRectTest:coordinateTest:](self->_annotations, "itemsPassingRectTest:coordinateTest:", v8, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_loadWeakRetained((id *)&self->_draggedAnnotation);

      if (v12)
      {
        v13 = objc_loadWeakRetained((id *)&self->_draggedAnnotation);
        objc_msgSend(v11, "addObject:", v13);

      }
      v14 = objc_msgSend(v11, "containsObject:", self->_selectedAnnotation);
      if (v14)
        objc_msgSend(v11, "removeObject:", self->_selectedAnnotation);
      if (self->_selectedAnnotation)
      {
        -[NSMapTable objectForKey:](self->_annotationsToRepresentations, "objectForKey:");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v14)
        {
          objc_msgSend(v15, "_setHiddenForOffscreen:", 0);
        }
        else
        {
          v17 = objc_loadWeakRetained((id *)p_container);
          objc_msgSend(v16, "_setHiddenForOffscreen:", objc_msgSend(v17, "shouldHideOffscreenSelectedAnnotation"));

        }
      }
      if (objc_msgSend(v11, "count") || -[NSHashTable count](self->_visibleAnnotations, "count"))
      {
        v18 = (void *)-[NSHashTable mutableCopy](self->_visibleAnnotations, "mutableCopy", v10);
        objc_msgSend(v18, "minusHashTable:", v11);
        if (self->_selectedAnnotation)
          objc_msgSend(v18, "removeObject:");
        v37 = v8;
        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        v19 = v18;
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v43;
          do
          {
            for (i = 0; i != v21; ++i)
            {
              if (*(_QWORD *)v43 != v22)
                objc_enumerationMutation(v19);
              -[MKAnnotationManager _removeRepresentationForAnnotation:fromCull:](self, "_removeRepresentationForAnnotation:fromCull:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i), 1);
            }
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
          }
          while (v21);
        }

        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        v24 = v11;
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
        if (v25)
        {
          v26 = v25;
          v27 = 0;
          v28 = *(_QWORD *)v39;
          do
          {
            for (j = 0; j != v26; ++j)
            {
              if (*(_QWORD *)v39 != v28)
                objc_enumerationMutation(v24);
              v30 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * j);
              if (!-[NSHashTable containsObject:](self->_visibleAnnotations, "containsObject:", v30))
              {
                if (!v27)
                  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v24, "count"));
                -[MKAnnotationManager _addRepresentationForAnnotation:](self, "_addRepresentationForAnnotation:", v30);
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "addObject:", v31);

              }
            }
            v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
          }
          while (v26);
        }
        else
        {
          v27 = 0;
        }

        -[NSMutableSet removeAllObjects](self->_pendingAnnotations, "removeAllObjects");
        -[NSMutableSet removeAllObjects](self->_disallowAnimationAnnotations, "removeAllObjects");

        v10 = v36;
        v8 = v37;
      }
      else
      {
        v27 = 0;
      }
      if (objc_msgSend(v27, "count") || -[NSMutableSet count](self->_pendingRemovalAnnotationRepresentations, "count"))
      {
        v32 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v32, "annotationManagerDidChangeVisibleAnnotationRepresentations:", self);

        if (objc_msgSend(v27, "count"))
        {
          v33 = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend(v33, "annotationManager:didAddAnnotationRepresentations:", self, v27);

        }
        if (-[NSMutableSet count](self->_pendingRemovalAnnotationRepresentations, "count"))
        {
          v34 = objc_loadWeakRetained((id *)&self->_delegate);
          -[NSMutableSet allObjects](self->_pendingRemovalAnnotationRepresentations, "allObjects");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "annotationManager:didRemoveAnnotationRepresentations:", self, v35);

          -[NSMutableSet removeAllObjects](self->_pendingRemovalAnnotationRepresentations, "removeAllObjects");
        }
      }

    }
  }
}

- (void)_addAnnotation:(id)a3 updateVisible:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  BOOL v7;
  char v8;
  double v9;
  double v10;
  NSMutableSet *invalidCoordinateAnnotations;
  NSMutableSet *v12;
  NSMutableSet *v13;
  NSMutableSet *pendingAnnotations;
  NSMutableSet *v15;
  NSMutableSet *v16;
  NSHashTable *allClusterAnnotations;
  NSHashTable *v18;
  NSHashTable *v19;
  void *v20;

  v4 = a4;
  v6 = a3;
  if (v6)
  {
    v20 = v6;
    v7 = -[MKQuadTrie contains:](self->_annotations, "contains:", v6);
    v6 = v20;
    if (!v7)
    {
      v8 = -[NSMutableSet containsObject:](self->_invalidCoordinateAnnotations, "containsObject:", v20);
      v6 = v20;
      if ((v8 & 1) == 0)
      {
        objc_msgSend(v20, "addObserver:forKeyPath:options:context:", self, CFSTR("coordinate"), 10, 0);
        objc_msgSend(v20, "coordinate");
        if (v10 < -180.0 || v10 > 180.0 || v9 < -90.0 || v9 > 90.0)
        {
          invalidCoordinateAnnotations = self->_invalidCoordinateAnnotations;
          if (!invalidCoordinateAnnotations)
          {
            v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
            v13 = self->_invalidCoordinateAnnotations;
            self->_invalidCoordinateAnnotations = v12;

            invalidCoordinateAnnotations = self->_invalidCoordinateAnnotations;
          }
          -[NSMutableSet addObject:](invalidCoordinateAnnotations, "addObject:", v20);
        }
        else
        {
          -[MKQuadTrie insert:](self->_annotations, "insert:", v20);
        }
        pendingAnnotations = self->_pendingAnnotations;
        if (!pendingAnnotations)
        {
          v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
          v16 = self->_pendingAnnotations;
          self->_pendingAnnotations = v15;

          pendingAnnotations = self->_pendingAnnotations;
        }
        -[NSMutableSet addObject:](pendingAnnotations, "addObject:", v20);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          allClusterAnnotations = self->_allClusterAnnotations;
          if (!allClusterAnnotations)
          {
            v18 = (NSHashTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 512, 100);
            v19 = self->_allClusterAnnotations;
            self->_allClusterAnnotations = v18;

            allClusterAnnotations = self->_allClusterAnnotations;
          }
          -[NSHashTable addObject:](allClusterAnnotations, "addObject:", v20);
        }
        v6 = v20;
        if (v4)
        {
          -[MKAnnotationManager _setupUpdateVisibleAnnotationsTimer](self, "_setupUpdateVisibleAnnotationsTimer");
          v6 = v20;
        }
      }
    }
  }

}

- (void)addAnnotations:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[MKAnnotationManager _addAnnotation:updateVisible:](self, "_addAnnotation:updateVisible:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), 0);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }
  -[MKAnnotationManager _setupUpdateVisibleAnnotationsTimer](self, "_setupUpdateVisibleAnnotationsTimer");

}

- (void)_setupUpdateVisibleAnnotationsTimer
{
  NSTimer *v3;
  NSTimer *updateVisibleTimer;
  id v5;

  if (self->_annotationRepresentationsAreAddedImmediately)
  {
    -[MKAnnotationManager updateVisibleAnnotations](self, "updateVisibleAnnotations");
  }
  else if (!self->_updateVisibleTimer)
  {
    objc_msgSend(MEMORY[0x1E0C99E88], "timerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_updateVisibleAnnotations, 0, 0, 0.0);
    v3 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    updateVisibleTimer = self->_updateVisibleTimer;
    self->_updateVisibleTimer = v3;

    objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addTimer:forMode:", self->_updateVisibleTimer, *MEMORY[0x1E0C99860]);

  }
}

- (void)removeAnnotations:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[MKAnnotationManager _removeAnnotation:updateVisible:removeFromContainer:](self, "_removeAnnotation:updateVisible:removeFromContainer:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), 0, 1);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }
  -[MKAnnotationManager updateVisibleAnnotations](self, "updateVisibleAnnotations");

}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)configureAnnotationRepresentation:(id)a3 forAnnotation:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  v7 = a4;
  objc_msgSend(a3, "viewRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "setAnnotation:", v7);

}

- (id)_addRepresentationForAnnotation:(id)a3
{
  id v4;
  NSMapTable *v5;
  NSMapTable *annotationsToRepresentations;
  NSMutableSet *v7;
  NSMutableSet *annotationRepresentations;
  void *v9;
  id v10;
  id v11;
  id WeakRetained;
  _BOOL4 v13;
  char isKindOfClass;
  NSString *const *v15;
  uint64_t v16;
  id v17;

  v4 = a3;
  if (!self->_annotationsToRepresentations)
  {
    v5 = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 512, 512, 100);
    annotationsToRepresentations = self->_annotationsToRepresentations;
    self->_annotationsToRepresentations = v5;

  }
  if (!self->_annotationRepresentations)
  {
    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    annotationRepresentations = self->_annotationRepresentations;
    self->_annotationRepresentations = v7;

  }
  -[NSMapTable objectForKey:](self->_annotationsToRepresentations, "objectForKey:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[NSMapTable objectForKey:](self->_annotationsToRepresentations, "objectForKey:", v4);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && objc_msgSend(v4, "shouldRepresentSelf")
      && (v11 = v4) != 0)
    {
      v10 = v11;
      -[MKAnnotationManager annotationIsInternal:](self, "annotationIsInternal:", v11);
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "annotationManager:representationForAnnotation:", self, v4);
      v10 = (id)objc_claimAutoreleasedReturnValue();

      v13 = -[MKAnnotationManager annotationIsInternal:](self, "annotationIsInternal:", v4);
      if (!v10 && v13)
        v10 = -[MKAnnotationManager newInternalAnnotationRepresentationForInternalAnnotation:](self, "newInternalAnnotationRepresentationForInternalAnnotation:", v4);
      if (!v10)
      {
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        v15 = &MKMapViewDefaultClusterAnnotationViewReuseIdentifier;
        if ((isKindOfClass & 1) == 0)
          v15 = &MKMapViewDefaultAnnotationViewReuseIdentifier;
        -[MKAnnotationManager dequeueReusableAnnotationRepresentationWithIdentifier:](self, "dequeueReusableAnnotationRepresentationWithIdentifier:", *v15);
        v10 = (id)objc_claimAutoreleasedReturnValue();
        -[MKAnnotationManager configureDefaultAnnotationRepresentation:forAnnotation:](self, "configureDefaultAnnotationRepresentation:forAnnotation:", v10, v4);
      }
    }
    -[MKAnnotationManager configureAnnotationRepresentation:forAnnotation:](self, "configureAnnotationRepresentation:forAnnotation:", v10, v4);
    -[NSMapTable setObject:forKey:](self->_annotationsToRepresentations, "setObject:forKey:", v10, v4);
    -[NSMutableSet addObject:](self->_annotationRepresentations, "addObject:", v10);
    -[NSHashTable addObject:](self->_visibleAnnotations, "addObject:", v4);
    if (-[NSMutableSet containsObject:](self->_pendingAnnotations, "containsObject:", v4))
      v16 = -[NSMutableSet containsObject:](self->_disallowAnimationAnnotations, "containsObject:", v4) ^ 1;
    else
      v16 = 0;
    v17 = objc_loadWeakRetained((id *)&self->_container);
    objc_msgSend(v17, "addAnnotationRepresentation:allowAnimation:", v10, v16);

  }
  return v10;
}

- (BOOL)annotationIsInternal:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (NSArray)annotations
{
  void *v3;
  void *v4;
  NSMutableSet *invalidCoordinateAnnotations;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKQuadTrie allItems](self->_annotations, "allItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  invalidCoordinateAnnotations = self->_invalidCoordinateAnnotations;
  if (invalidCoordinateAnnotations)
  {
    -[NSMutableSet allObjects](invalidCoordinateAnnotations, "allObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v6);

  }
  return (NSArray *)v3;
}

- (MKAnnotationManager)init
{
  MKAnnotationManager *v2;
  MKQuadTrie *v3;
  MKQuadTrie *annotations;
  uint64_t v5;
  NSHashTable *visibleAnnotations;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MKAnnotationManager;
  v2 = -[MKAnnotationManager init](&v8, sel_init);
  if (v2)
  {
    v3 = -[MKQuadTrie initWithInitialRegion:minimumSize:maximumItems:]([MKQuadTrie alloc], "initWithInitialRegion:minimumSize:maximumItems:", 100, 0.0, 0.0, 268435456.0, 268435456.0, 1024.0, 1024.0);
    annotations = v2->_annotations;
    v2->_annotations = v3;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 512, 100);
    visibleAnnotations = v2->_visibleAnnotations;
    v2->_visibleAnnotations = (NSHashTable *)v5;

    -[MKAnnotationManager registerClass:forRepresentationReuseIdentifier:](v2, "registerClass:forRepresentationReuseIdentifier:", 0, CFSTR("MKMapViewDefaultAnnotationViewReuseIdentifier"));
    -[MKAnnotationManager registerClass:forRepresentationReuseIdentifier:](v2, "registerClass:forRepresentationReuseIdentifier:", 0, CFSTR("MKMapViewDefaultClusterAnnotationViewReuseIdentifier"));
  }
  return v2;
}

- (void)registerClass:(Class)a3 forRepresentationReuseIdentifier:(id)a4
{
  id v6;
  id v7;
  int v8;
  NSMutableDictionary *registeredIdentifierToRepresentationClasses;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  id v12;

  v6 = a4;
  v7 = v6;
  v12 = v6;
  if (a3)
    goto LABEL_7;
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("MKMapViewDefaultAnnotationViewReuseIdentifier")) & 1) == 0)
  {
    v8 = objc_msgSend(v12, "isEqualToString:", CFSTR("MKMapViewDefaultClusterAnnotationViewReuseIdentifier"));
    v7 = v12;
    if (!v8)
      goto LABEL_11;
  }
  a3 = (Class)objc_opt_class();
  if (_MKLinkedOnOrAfterReleaseSet(1540))
    a3 = (Class)objc_opt_class();
  v7 = v12;
  if (a3)
  {
LABEL_7:
    registeredIdentifierToRepresentationClasses = self->_registeredIdentifierToRepresentationClasses;
    if (!registeredIdentifierToRepresentationClasses)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v10 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      v11 = self->_registeredIdentifierToRepresentationClasses;
      self->_registeredIdentifierToRepresentationClasses = v10;

      v7 = v12;
      registeredIdentifierToRepresentationClasses = self->_registeredIdentifierToRepresentationClasses;
    }
    -[NSMutableDictionary setObject:forKey:](registeredIdentifierToRepresentationClasses, "setObject:forKey:", a3, v7);
  }
  else
  {
LABEL_11:
    -[NSMutableDictionary removeObjectForKey:](self->_registeredIdentifierToRepresentationClasses, "removeObjectForKey:", v7);
  }

}

- (void)addAnnotation:(id)a3 allowAnimation:(BOOL)a4
{
  id v6;
  NSMutableSet *disallowAnimationAnnotations;
  NSMutableSet *v8;
  NSMutableSet *v9;
  id v10;

  v6 = a3;
  v10 = v6;
  if (v6 && !a4)
  {
    disallowAnimationAnnotations = self->_disallowAnimationAnnotations;
    if (!disallowAnimationAnnotations)
    {
      v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      v9 = self->_disallowAnimationAnnotations;
      self->_disallowAnimationAnnotations = v8;

      disallowAnimationAnnotations = self->_disallowAnimationAnnotations;
    }
    -[NSMutableSet addObject:](disallowAnimationAnnotations, "addObject:", v10);
    v6 = v10;
  }
  -[MKAnnotationManager _addAnnotation:updateVisible:](self, "_addAnnotation:updateVisible:", v6, 1);

}

- (void)addAnnotation:(id)a3
{
  -[MKAnnotationManager addAnnotation:allowAnimation:](self, "addAnnotation:allowAnimation:", a3, 1);
}

- (void)setContainer:(id)a3
{
  id v4;
  id WeakRetained;
  MKAnnotation *v6;
  NSMutableSet *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_container);

  if (WeakRetained != v4)
  {
    v6 = self->_selectedAnnotation;
    -[MKAnnotationManager deselectAnnotation:animated:](self, "deselectAnnotation:animated:", v6, 0);
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = self->_annotationRepresentations;
    v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
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
          v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11);
          v13 = objc_loadWeakRetained((id *)&self->_container);
          objc_msgSend(v13, "removeAnnotationRepresentation:", v12, (_QWORD)v14);

          ++v11;
        }
        while (v9 != v11);
        v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

    -[NSMutableSet removeAllObjects](self->_annotationRepresentations, "removeAllObjects");
    -[NSMapTable removeAllObjects](self->_annotationsToRepresentations, "removeAllObjects");
    -[NSHashTable removeAllObjects](self->_visibleAnnotations, "removeAllObjects");
    objc_storeWeak((id *)&self->_container, v4);
    -[MKAnnotationManager updateVisibleAnnotations](self, "updateVisibleAnnotations");
    -[MKAnnotationManager selectAnnotation:animated:](self, "selectAnnotation:animated:", v6, 0);

  }
}

- (void)selectAnnotation:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  MKAnnotation *v7;
  MKAnnotation *v8;
  MKAnnotation *selectedAnnotation;
  id v10;
  char v11;
  id WeakRetained;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  char v19;
  id v20;
  int v21;
  id v22;
  id v23;
  MKAnnotation *v24;

  v4 = a4;
  v7 = (MKAnnotation *)a3;
  v8 = v7;
  selectedAnnotation = self->_selectedAnnotation;
  if (!v7 || selectedAnnotation != v7)
  {
    v24 = v7;
    if (selectedAnnotation)
    {
      if (v4
        && (v10 = objc_loadWeakRetained((id *)&self->_delegate),
            v11 = objc_opt_respondsToSelector(),
            v10,
            (v11 & 1) != 0))
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        v13 = objc_msgSend(WeakRetained, "annotationManager:shouldAnimateDeselectionOfAnnotation:forSelectionOfAnnotation:", self, self->_selectedAnnotation, v24);

      }
      else
      {
        v13 = 0;
      }
      -[MKAnnotationManager deselectAnnotation:animated:](self, "deselectAnnotation:animated:", self->_selectedAnnotation, v13);
      v8 = v24;
    }
    if (v8)
    {
      if (-[MKQuadTrie contains:](self->_annotations, "contains:", v8))
      {
        -[NSMapTable objectForKey:](self->_annotationsToRepresentations, "objectForKey:", v24);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v14)
        {
          -[MKAnnotationManager _addRepresentationForAnnotation:](self, "_addRepresentationForAnnotation:", v24);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend(v15, "annotationManagerDidChangeVisibleAnnotationRepresentations:", self);

          v16 = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v14);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "annotationManager:didAddAnnotationRepresentations:", self, v17);

        }
        objc_storeStrong((id *)&self->_selectedAnnotation, a3);
        v18 = objc_loadWeakRetained((id *)&self->_delegate);
        v19 = objc_opt_respondsToSelector();

        if ((v19 & 1) != 0
          && (v20 = objc_loadWeakRetained((id *)&self->_delegate),
              v21 = objc_msgSend(v20, "annotationManager:canSelectAnnotationRepresentation:", self, v14),
              v20,
              !v21))
        {
          self->_isDeferringContainerSelection = 1;
          self->_deferredContainerSelectionAnimated = v4;
        }
        else
        {
          v22 = objc_loadWeakRetained((id *)&self->_container);
          objc_msgSend(v22, "selectAnnotationRepresentation:animated:", v14, v4);

        }
        v23 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v23, "annotationManager:didSelectAnnotationRepresentation:", self, v14);

      }
      else
      {
        NSLog(CFSTR("ERROR: Trying to select an annotation which has not been added"));
      }
      v8 = v24;
    }
  }

}

- (void)deselectAnnotation:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  MKAnnotation *v6;
  MKAnnotation *selectedAnnotation;
  MKAnnotation *v8;
  void *v9;
  id WeakRetained;
  char v11;
  id v12;
  id v13;
  MKAnnotation *v14;
  id v15;
  MKAnnotation *v16;

  v4 = a4;
  v6 = (MKAnnotation *)a3;
  selectedAnnotation = self->_selectedAnnotation;
  if (v6)
  {
    v8 = v6;
    if (selectedAnnotation != v6)
      goto LABEL_10;
  }
  else
  {
    if (!selectedAnnotation)
    {
      v8 = 0;
      goto LABEL_10;
    }
    v8 = selectedAnnotation;
  }
  v16 = v8;
  -[NSMapTable objectForKey:](self->_annotationsToRepresentations, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    v12 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v12, "annotationManager:willDeselectAnnotationRepresentation:", self, v9);

  }
  self->_isDeferringContainerSelection = 0;
  v13 = objc_loadWeakRetained((id *)&self->_container);
  objc_msgSend(v13, "deselectAnnotationRepresentation:animated:", v9, v4);

  objc_msgSend(v9, "_setHiddenForOffscreen:", 0);
  v14 = self->_selectedAnnotation;
  self->_selectedAnnotation = 0;

  v15 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v15, "annotationManager:didDeselectAnnotationRepresentation:", self, v9);

  -[MKAnnotationManager updateVisibleAnnotations](self, "updateVisibleAnnotations");
  v8 = v16;
LABEL_10:

}

- (void)dealloc
{
  MKQuadTrie *annotations;
  NSMutableSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSMutableSet *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  objc_super v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[5];
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  annotations = self->_annotations;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __30__MKAnnotationManager_dealloc__block_invoke;
  v23[3] = &unk_1E20DAD90;
  v23[4] = self;
  -[MKQuadTrie foreach:](annotations, "foreach:", v23);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = self->_invalidCoordinateAnnotations;
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v8++), "removeObserver:forKeyPath:", self, CFSTR("coordinate"));
      }
      while (v6 != v8);
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v6);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = self->_annotationRepresentations;
  v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        -[MKAnnotationManager cleanUpAnnotationRepresentationForRemoval:](self, "cleanUpAnnotationRepresentationForRemoval:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v13++));
      }
      while (v11 != v13);
      v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v24, 16);
    }
    while (v11);
  }

  v14.receiver = self;
  v14.super_class = (Class)MKAnnotationManager;
  -[MKAnnotationManager dealloc](&v14, sel_dealloc);
}

uint64_t __30__MKAnnotationManager_dealloc__block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "removeObserver:forKeyPath:", *(_QWORD *)(a1 + 32), CFSTR("coordinate"));
  return 1;
}

- (id)addRepresentationForAnnotation:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;
  id v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MKAnnotationManager _addAnnotation:updateVisible:](self, "_addAnnotation:updateVisible:", v4, 0);
  -[MKAnnotationManager _addRepresentationForAnnotation:](self, "_addRepresentationForAnnotation:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NSMutableSet removeObject:](self->_pendingAnnotations, "removeObject:", v4);
    -[NSMutableSet removeObject:](self->_disallowAnimationAnnotations, "removeObject:", v4);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "annotationManagerDidChangeVisibleAnnotationRepresentations:", self);

    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    v10[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "annotationManager:didAddAnnotationRepresentations:", self, v8);

  }
  else
  {
    NSLog(CFSTR("Failed to create cluster annotation view for annotation %@"), v4);
    -[NSMutableSet removeObject:](self->_pendingAnnotations, "removeObject:", v4);
    -[NSMutableSet removeObject:](self->_disallowAnimationAnnotations, "removeObject:", v4);
  }

  return v5;
}

- (void)_removeAnnotation:(id)a3 updateVisible:(BOOL)a4 removeFromContainer:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  BOOL v8;
  MKAnnotation *v9;
  int v10;
  MKAnnotation *v11;

  v5 = a5;
  v6 = a4;
  v11 = (MKAnnotation *)a3;
  v8 = -[MKQuadTrie contains:](self->_annotations, "contains:", v11);
  v9 = v11;
  if (!v8)
  {
    v10 = -[NSMutableSet containsObject:](self->_invalidCoordinateAnnotations, "containsObject:", v11);
    v9 = v11;
    if (!v10)
      goto LABEL_12;
  }
  if (-[MKQuadTrie contains:](self->_annotations, "contains:", v9)
    || -[NSMutableSet containsObject:](self->_invalidCoordinateAnnotations, "containsObject:", v11))
  {
    -[MKAnnotation removeObserver:forKeyPath:](v11, "removeObserver:forKeyPath:", self, CFSTR("coordinate"));
  }
  -[MKQuadTrie remove:](self->_annotations, "remove:", v11);
  -[NSMutableSet removeObject:](self->_invalidCoordinateAnnotations, "removeObject:", v11);
  -[NSMutableSet removeObject:](self->_pendingAnnotations, "removeObject:", v11);
  -[NSHashTable removeObject:](self->_visibleAnnotations, "removeObject:", v11);
  -[NSMutableSet removeObject:](self->_disallowAnimationAnnotations, "removeObject:", v11);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[NSHashTable removeObject:](self->_allClusterAnnotations, "removeObject:", v11);
  v9 = v11;
  if (self->_selectedAnnotation != v11)
  {
    if (!v5)
      goto LABEL_10;
LABEL_14:
    -[MKAnnotationManager _removeRepresentationForAnnotation:fromCull:](self, "_removeRepresentationForAnnotation:fromCull:", v11, 0);
    v9 = v11;
    if (!v6)
      goto LABEL_12;
    goto LABEL_11;
  }
  -[MKAnnotationManager deselectAnnotation:animated:](self, "deselectAnnotation:animated:", v11, 0);
  v9 = v11;
  if (v5)
    goto LABEL_14;
LABEL_10:
  if (v6)
  {
LABEL_11:
    -[MKAnnotationManager _setupUpdateVisibleAnnotationsTimer](self, "_setupUpdateVisibleAnnotationsTimer");
    v9 = v11;
  }
LABEL_12:

}

- (void)removeAnnotation:(id)a3
{
  -[MKAnnotationManager _removeAnnotation:updateVisible:removeFromContainer:](self, "_removeAnnotation:updateVisible:removeFromContainer:", a3, 1, 1);
}

- (void)removeAnnotation:(id)a3 updateVisible:(BOOL)a4
{
  -[MKAnnotationManager _removeAnnotation:updateVisible:removeFromContainer:](self, "_removeAnnotation:updateVisible:removeFromContainer:", a3, a4, 1);
}

- (void)replaceAnnotation:(id)a3 withAnnotation:(id)a4
{
  id v6;
  _BOOL4 v7;
  void *v8;
  MKAnnotation *v9;

  v9 = (MKAnnotation *)a3;
  v6 = a4;
  if (!-[MKQuadTrie contains:](self->_annotations, "contains:", v6))
  {
    v7 = -[MKQuadTrie contains:](self->_annotations, "contains:", v9);
    if (v9)
    {
      if (v7)
      {
        if (v6)
        {
          if (self->_selectedAnnotation == v9)
          {
            -[NSMapTable objectForKey:](self->_annotationsToRepresentations, "objectForKey:", v9);
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            objc_storeStrong((id *)&self->_selectedAnnotation, a4);
            -[NSMapTable removeObjectForKey:](self->_annotationsToRepresentations, "removeObjectForKey:", v9);
            -[MKAnnotationManager _removeAnnotation:updateVisible:removeFromContainer:](self, "_removeAnnotation:updateVisible:removeFromContainer:", v9, 0, 0);
            -[MKAnnotationManager _addAnnotation:updateVisible:](self, "_addAnnotation:updateVisible:", v6, 0);
            -[MKAnnotationManager configureAnnotationRepresentation:forAnnotation:](self, "configureAnnotationRepresentation:forAnnotation:", v8, v6);
            -[NSMapTable setObject:forKey:](self->_annotationsToRepresentations, "setObject:forKey:", v8, v6);
            -[NSHashTable addObject:](self->_visibleAnnotations, "addObject:", v6);

          }
          else
          {
            -[MKAnnotationManager removeAnnotation:](self, "removeAnnotation:", v9);
            -[MKAnnotationManager addAnnotation:](self, "addAnnotation:", v6);
          }
        }
        else
        {
          -[MKAnnotationManager removeAnnotation:](self, "removeAnnotation:", v9);
        }
      }
    }
  }

}

- (void)addRepresentationsForAnnotations:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  id WeakRetained;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (-[MKQuadTrie contains:](self->_annotations, "contains:", v11, (_QWORD)v16))
        {
          -[NSMapTable objectForKey:](self->_annotationsToRepresentations, "objectForKey:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v12)
          {
            -[MKAnnotationManager _addRepresentationForAnnotation:](self, "_addRepresentationForAnnotation:", v11);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObject:", v13);
            -[NSMutableSet removeObject:](self->_pendingAnnotations, "removeObject:", v11);
            -[NSMutableSet removeObject:](self->_disallowAnimationAnnotations, "removeObject:", v11);

          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "annotationManagerDidChangeVisibleAnnotationRepresentations:", self);

  v15 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v15, "annotationManager:didAddAnnotationRepresentations:", self, v5);

}

- (id)dequeueReusableAnnotationRepresentationWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[NSMapTable objectForKey:](self->_reusableAnnotationRepresentations, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSMutableSet containsObject:](self->_annotationRepresentations, "containsObject:", v6))
    {
      do
      {
        if (objc_msgSend(v5, "count"))
        {
          objc_msgSend(v5, "removeLastObject");
          objc_msgSend(v5, "lastObject");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v7 = 0;
        }

        v6 = v7;
      }
      while ((-[NSMutableSet containsObject:](self->_annotationRepresentations, "containsObject:", v7) & 1) != 0);
    }
    else
    {
      v7 = v6;
    }
    objc_msgSend(v7, "prepareForReuse");
    if (objc_msgSend(v5, "count"))
      objc_msgSend(v5, "removeLastObject");
    else
      -[NSMapTable removeObjectForKey:](self->_reusableAnnotationRepresentations, "removeObjectForKey:", v4);
  }
  else
  {
    -[NSMutableDictionary objectForKey:](self->_registeredIdentifierToRepresentationClasses, "objectForKey:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend((id)objc_msgSend(v8, "alloc"), "initWithAnnotation:reuseIdentifier:", 0, v4);

  }
  return v7;
}

- (BOOL)containsAnnotation:(id)a3
{
  return -[MKQuadTrie contains:](self->_annotations, "contains:", a3);
}

- (id)annotationsInMapRect:(id)a3
{
  return -[MKQuadTrie itemsInMapRect:](self->_annotations, "itemsInMapRect:", a3.var0.var0, a3.var0.var1, a3.var1.var0, a3.var1.var1);
}

- (void)showAnnotationsInMapRect:(id)a3
{
  double var1;
  double var0;
  double v5;
  double v6;
  MKAnnotationMarkerContainer **p_container;
  id WeakRetained;
  id v10;
  uint64_t (**v11)(_QWORD, double, double, double, double);
  NSTimer *updateVisibleTimer;
  NSTimer *v13;
  void *v14;
  NSHashTable *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t j;
  uint64_t v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  var1 = a3.var1.var1;
  var0 = a3.var1.var0;
  v5 = a3.var0.var1;
  v6 = a3.var0.var0;
  v41 = *MEMORY[0x1E0C80C00];
  p_container = &self->_container;
  WeakRetained = objc_loadWeakRetained((id *)&self->_container);

  if (WeakRetained)
  {
    v10 = objc_loadWeakRetained((id *)p_container);
    objc_msgSend(v10, "annotationRectTest");
    v11 = (uint64_t (**)(_QWORD, double, double, double, double))objc_claimAutoreleasedReturnValue();

    if (v11 && v11[2](v11, v6, v5, var0, var1) != 1)
    {
      updateVisibleTimer = self->_updateVisibleTimer;
      if (updateVisibleTimer)
      {
        -[NSTimer invalidate](updateVisibleTimer, "invalidate");
        v13 = self->_updateVisibleTimer;
        self->_updateVisibleTimer = 0;

      }
      -[MKQuadTrie itemsInMapRect:](self->_annotations, "itemsInMapRect:", v6, v5, var0, var1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "containsObject:", self->_selectedAnnotation))
        objc_msgSend(v14, "removeObject:", self->_selectedAnnotation);
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v15 = self->_visibleAnnotations;
      v16 = -[NSHashTable countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v36;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v36 != v18)
              objc_enumerationMutation(v15);
            objc_msgSend(v14, "removeObject:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i));
          }
          v17 = -[NSHashTable countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
        }
        while (v17);
      }

      -[NSMutableSet minusSet:](self->_pendingAnnotations, "minusSet:", v14);
      -[NSMutableSet minusSet:](self->_disallowAnimationAnnotations, "minusSet:", v14);
      if (objc_msgSend(v14, "count"))
      {
        v33 = 0u;
        v34 = 0u;
        v31 = 0u;
        v32 = 0u;
        v20 = v14;
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        if (v21)
        {
          v22 = v21;
          v23 = 0;
          v24 = *(_QWORD *)v32;
          do
          {
            for (j = 0; j != v22; ++j)
            {
              if (*(_QWORD *)v32 != v24)
                objc_enumerationMutation(v20);
              v26 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j);
              if (!v23)
              {
                v27 = objc_alloc(MEMORY[0x1E0C99DE8]);
                v23 = (void *)objc_msgSend(v27, "initWithCapacity:", objc_msgSend(v20, "count", (_QWORD)v31));
              }
              -[MKAnnotationManager _addRepresentationForAnnotation:](self, "_addRepresentationForAnnotation:", v26, (_QWORD)v31);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "addObject:", v28);

            }
            v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
          }
          while (v22);
        }
        else
        {
          v23 = 0;
        }

        if (objc_msgSend(v23, "count"))
        {
          v29 = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend(v29, "annotationManagerDidChangeVisibleAnnotationRepresentations:", self);

          v30 = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend(v30, "annotationManager:didAddAnnotationRepresentations:", self, v23);

        }
      }

    }
  }
}

- (void)_annotationDidChangeState:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  MKAnnotation *v6;
  MKAnnotation *v7;
  uint64_t v8;
  void *v9;
  id WeakRetained;
  char v11;
  id v12;
  int v13;
  id v14;
  void *v15;
  _BOOL8 deferredContainerSelectionAnimated;
  MKAnnotation *v17;

  v4 = a4;
  v6 = (MKAnnotation *)a3;
  v7 = v6;
  if (self->_isDeferringContainerSelection && self->_selectedAnnotation == v6)
  {
    v17 = v6;
    if (!-[MKQuadTrie contains:](self->_annotations, "contains:", v6))
    {
      NSLog(CFSTR("ERROR: Trying to select an annotation which has not been added"));
LABEL_12:
      v7 = v17;
      goto LABEL_13;
    }
    -[NSMapTable objectForKey:](self->_annotationsToRepresentations, "objectForKey:", v17);
    v8 = objc_claimAutoreleasedReturnValue();
    v7 = v17;
    if (v8)
    {
      v9 = (void *)v8;
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v11 = objc_opt_respondsToSelector();

      if ((v11 & 1) == 0
        || (v12 = objc_loadWeakRetained((id *)&self->_delegate),
            v13 = objc_msgSend(v12, "annotationManager:canSelectAnnotationRepresentation:", self, v9),
            v12,
            v13))
      {
        self->_isDeferringContainerSelection = 0;
        v14 = objc_loadWeakRetained((id *)&self->_container);
        v15 = v14;
        deferredContainerSelectionAnimated = 0;
        if (v4)
          deferredContainerSelectionAnimated = self->_deferredContainerSelectionAnimated;
        objc_msgSend(v14, "selectAnnotationRepresentation:animated:", v9, deferredContainerSelectionAnimated);

      }
      goto LABEL_12;
    }
  }
LABEL_13:

}

- (MKAnnotationRepresentation)selectedAnnotationRepresentation
{
  void *v2;

  if (self->_selectedAnnotation)
  {
    -[NSMapTable objectForKey:](self->_annotationsToRepresentations, "objectForKey:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return (MKAnnotationRepresentation *)v2;
}

- (id)representationForAnnotation:(id)a3
{
  return -[NSMapTable objectForKey:](self->_annotationsToRepresentations, "objectForKey:", a3);
}

- (id)newInternalAnnotationRepresentationForInternalAnnotation:(id)a3
{
  id v4;
  MKAnnotationView *userLocationView;
  _MKUserLocationView *v6;
  MKAnnotationView *v7;
  MKAnnotationView *v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    userLocationView = self->_userLocationView;
    if (!userLocationView)
    {
      v6 = -[_MKUserLocationView initWithAnnotation:reuseIdentifier:]([_MKUserLocationView alloc], "initWithAnnotation:reuseIdentifier:", v4, 0);
      v7 = self->_userLocationView;
      self->_userLocationView = &v6->super.super;

      userLocationView = self->_userLocationView;
    }
    v8 = userLocationView;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)configureDefaultAnnotationRepresentation:(id)a3 forAnnotation:(id)a4
{
  void *v5;
  _BOOL4 v6;
  char v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a4;
  objc_msgSend(a3, "viewRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_18;
  v6 = _MKLinkedOnOrAfterReleaseSet(1539);
  v7 = objc_opt_respondsToSelector();
  if (!v6)
  {
    if ((v7 & 1) != 0)
    {
      objc_msgSend(v15, "title");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "length") != 0;
      v9 = v5;
      goto LABEL_8;
    }
LABEL_10:
    objc_msgSend(v5, "setCanShowCallout:", 0);
    goto LABEL_11;
  }
  if ((v7 & 1) == 0)
    goto LABEL_10;
  objc_msgSend(v15, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "length"))
  {
    objc_msgSend(v5, "detailCalloutAccessoryView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCanShowCallout:", v14 != 0);

    goto LABEL_9;
  }
  v9 = v5;
  v10 = 1;
LABEL_8:
  objc_msgSend(v9, "setCanShowCallout:", v10);
LABEL_9:

LABEL_11:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v15, "clusteringIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setClusteringIdentifier:", v11);
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
      goto LABEL_18;
    objc_msgSend(v15, "_representedMapItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = v5;
        objc_msgSend(v11, "_styleAttributes");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "_setStyleAttributes:", v13);

      }
    }
  }

LABEL_18:
}

- (void)cleanUpAnnotationRepresentationForRemoval:(id)a3
{
  void *v3;
  id v4;

  objc_msgSend(a3, "viewRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "setAnnotation:", 0);
    v3 = v4;
  }

}

- (void)_removeRepresentationForAnnotation:(id)a3 fromCull:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  id WeakRetained;
  void *v9;
  NSMapTable *reusableAnnotationRepresentations;
  NSMapTable *v11;
  NSMapTable *v12;
  id v13;
  NSMutableSet *pendingRemovalAnnotationRepresentations;
  NSMutableSet *v15;
  NSMutableSet *v16;
  id v17;

  v4 = a4;
  v17 = a3;
  -[NSMapTable objectForKey:](self->_annotationsToRepresentations, "objectForKey:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && (!v4 || (objc_msgSend(v6, "isPersistent") & 1) == 0))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_container);
    objc_msgSend(WeakRetained, "removeAnnotationRepresentation:", v7);

    -[MKAnnotationManager cleanUpAnnotationRepresentationForRemoval:](self, "cleanUpAnnotationRepresentationForRemoval:", v7);
    objc_msgSend(v7, "reuseIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "length"))
    {
      reusableAnnotationRepresentations = self->_reusableAnnotationRepresentations;
      if (!reusableAnnotationRepresentations)
      {
        objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
        v11 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
        v12 = self->_reusableAnnotationRepresentations;
        self->_reusableAnnotationRepresentations = v11;

        reusableAnnotationRepresentations = self->_reusableAnnotationRepresentations;
      }
      -[NSMapTable objectForKey:](reusableAnnotationRepresentations, "objectForKey:", v9);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        -[NSMapTable setObject:forKey:](self->_reusableAnnotationRepresentations, "setObject:forKey:", v13, v9);
      }
      objc_msgSend(v13, "addObject:", v7);

    }
    -[NSMapTable removeObjectForKey:](self->_annotationsToRepresentations, "removeObjectForKey:", v17);
    -[NSMutableSet removeObject:](self->_annotationRepresentations, "removeObject:", v7);
    -[NSHashTable removeObject:](self->_visibleAnnotations, "removeObject:", v17);
    pendingRemovalAnnotationRepresentations = self->_pendingRemovalAnnotationRepresentations;
    if (!pendingRemovalAnnotationRepresentations)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v15 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
      v16 = self->_pendingRemovalAnnotationRepresentations;
      self->_pendingRemovalAnnotationRepresentations = v15;

      pendingRemovalAnnotationRepresentations = self->_pendingRemovalAnnotationRepresentations;
    }
    -[NSMutableSet addObject:](pendingRemovalAnnotationRepresentations, "addObject:", v7);

  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  int v13;
  double v14;
  double v15;
  NSMutableSet *invalidCoordinateAnnotations;
  NSMutableSet *v17;
  NSMutableSet *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  NSHashTable *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  uint64_t v36;
  double v37;
  double v38;
  id WeakRetained;
  MKAnnotationManager *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (objc_msgSend(v10, "conformsToProtocol:", &unk_1EDFE54E8)
    && objc_msgSend(v9, "isEqualToString:", CFSTR("coordinate")))
  {
    objc_msgSend(v11, "objectForKey:", *MEMORY[0x1E0CB2CC0]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "BOOLValue");

    if (v13)
    {
      self->_isChangingCoordinate = 1;
      -[MKQuadTrie remove:](self->_annotations, "remove:", v10);
      -[NSMutableSet removeObject:](self->_invalidCoordinateAnnotations, "removeObject:", v10);
    }
    else
    {
      objc_msgSend(v10, "coordinate");
      if (v15 < -180.0 || v15 > 180.0 || v14 < -90.0 || v14 > 90.0)
      {
        invalidCoordinateAnnotations = self->_invalidCoordinateAnnotations;
        if (!invalidCoordinateAnnotations)
        {
          v17 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
          v18 = self->_invalidCoordinateAnnotations;
          self->_invalidCoordinateAnnotations = v17;

          invalidCoordinateAnnotations = self->_invalidCoordinateAnnotations;
        }
        -[NSMutableSet addObject:](invalidCoordinateAnnotations, "addObject:", v10);
      }
      else
      {
        -[MKQuadTrie insert:](self->_annotations, "insert:", v10);
      }
      self->_isChangingCoordinate = 0;
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CC8]);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "MKCoordinateValue");
      v21 = v20;
      v23 = v22;

      objc_msgSend(v10, "coordinate");
      if (vabdd_f64(v21, v25) >= 0.00000000999999994 || vabdd_f64(v23, v24) >= 0.00000000999999994)
      {
        v43 = 0u;
        v44 = 0u;
        v41 = 0u;
        v42 = 0u;
        v40 = self;
        v26 = self->_allClusterAnnotations;
        v27 = -[NSHashTable countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
        if (v27)
        {
          v28 = v27;
          v29 = *(_QWORD *)v42;
          do
          {
            for (i = 0; i != v28; ++i)
            {
              if (*(_QWORD *)v42 != v29)
                objc_enumerationMutation(v26);
              v31 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
              objc_msgSend(v31, "memberAnnotations");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = objc_msgSend(v32, "containsObject:", v10);

              if (v33)
                objc_msgSend(v31, "_memberAnnotationCoordinateDidChange");
            }
            v28 = -[NSHashTable countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
          }
          while (v28);
        }

        -[NSMapTable objectForKey:](v40->_annotationsToRepresentations, "objectForKey:", v10);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v34;
        if (v34)
        {
          objc_msgSend(v34, "_invalidateCachedCoordinate");
          v36 = objc_msgSend(MEMORY[0x1E0CEABB0], "_mapkit_shouldAdoptImplicitAnimationParameters");
          v37 = 0.0;
          if ((_DWORD)v36)
          {
            objc_msgSend(MEMORY[0x1E0CEABB0], "_currentAnimationDuration");
            v37 = v38;
          }
          WeakRetained = objc_loadWeakRetained((id *)&v40->_container);
          objc_msgSend(WeakRetained, "moveAnnotationRepresentation:fromCoordinate:animated:duration:", v35, v36, v21, v23, v37);

        }
        else
        {
          -[MKAnnotationManager updateVisibleAnnotations](v40, "updateVisibleAnnotations");
        }

      }
    }
  }

}

- (MKAnnotationMarkerContainer)container
{
  return (MKAnnotationMarkerContainer *)objc_loadWeakRetained((id *)&self->_container);
}

- (MKAnnotationManagerDelegate)delegate
{
  return (MKAnnotationManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)annotationRepresentationsAreAddedImmediately
{
  return self->_annotationRepresentationsAreAddedImmediately;
}

- (void)setAnnotationRepresentationsAreAddedImmediately:(BOOL)a3
{
  self->_annotationRepresentationsAreAddedImmediately = a3;
}

- (MKAnnotation)draggedAnnotation
{
  return (MKAnnotation *)objc_loadWeakRetained((id *)&self->_draggedAnnotation);
}

- (void)setDraggedAnnotation:(id)a3
{
  objc_storeWeak((id *)&self->_draggedAnnotation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userLocationView, 0);
  objc_storeStrong((id *)&self->_allClusterAnnotations, 0);
  objc_storeStrong((id *)&self->_registeredIdentifierToRepresentationClasses, 0);
  objc_storeStrong((id *)&self->_pendingRemovalAnnotationRepresentations, 0);
  objc_storeStrong((id *)&self->_reusableAnnotationRepresentations, 0);
  objc_storeStrong((id *)&self->_annotationRepresentations, 0);
  objc_storeStrong((id *)&self->_annotationsToRepresentations, 0);
  objc_destroyWeak((id *)&self->_draggedAnnotation);
  objc_storeStrong((id *)&self->_selectedAnnotation, 0);
  objc_storeStrong((id *)&self->_invalidCoordinateAnnotations, 0);
  objc_storeStrong((id *)&self->_disallowAnimationAnnotations, 0);
  objc_storeStrong((id *)&self->_pendingAnnotations, 0);
  objc_storeStrong((id *)&self->_visibleAnnotations, 0);
  objc_storeStrong((id *)&self->_annotations, 0);
  objc_storeStrong((id *)&self->_updateVisibleTimer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_container);
}

@end
