@implementation AKPageModelController

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v3;
  unsigned __int8 v4;
  char v5;
  objc_super v7;

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___AKPageModelController;
  v3 = a3;
  v4 = objc_msgSendSuper2(&v7, sel_automaticallyNotifiesObserversForKey_, v3);
  v5 = objc_msgSend(v3, "isEqualToString:", CFSTR("selectedAnnotations"), v7.receiver, v7.super_class);

  return v4 & ~v5;
}

- (AKPageModelController)init
{
  char *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AKPageModelController;
  v2 = -[AKPageModelController init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v3;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v5;

    v7 = *(_OWORD *)(MEMORY[0x24BDBF028] + 16);
    *(_OWORD *)(v2 + 56) = *MEMORY[0x24BDBF028];
    *(_OWORD *)(v2 + 72) = v7;
  }
  return (AKPageModelController *)v2;
}

- (NSArray)annotations
{
  return (NSArray *)-[NSMutableOrderedSet array](self->_mutableAnnotations, "array");
}

- (void)insertObject:(id)a3 inAnnotationsAtIndex:(unint64_t)a4
{
  void *v6;
  id v7;

  v7 = a3;
  if ((-[NSMutableOrderedSet containsObject:](self->_mutableAnnotations, "containsObject:") & 1) == 0)
  {
    -[NSMutableOrderedSet insertObject:atIndex:](self->_mutableAnnotations, "insertObject:atIndex:", v7, a4);
    -[AKPageModelController _ensureInkAnnotationIsInFrontWhenEditsAreDone](self, "_ensureInkAnnotationIsInFrontWhenEditsAreDone");
    -[AKPageModelController inkCanvasAnnotation](self, "inkCanvasAnnotation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[AKPageModelController setInkCanvasAnnotation:](self, "setInkCanvasAnnotation:", v7);
    }
    -[AKPageModelController _enableEditObservationForAnnotationIfNew:](self, "_enableEditObservationForAnnotationIfNew:", v7);
    -[AKPageModelController _logAnnotationAdded:](self, "_logAnnotationAdded:", v7);
  }

}

- (void)insertAnnotations:(id)a3 atIndexes:(id)a4
{
  id v6;
  id v7;
  NSMutableOrderedSet *mutableAnnotations;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  mutableAnnotations = self->_mutableAnnotations;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(mutableAnnotations) = -[NSMutableOrderedSet intersectsSet:](mutableAnnotations, "intersectsSet:", v9);

  if ((mutableAnnotations & 1) != 0)
  {
    v10 = objc_msgSend(v7, "firstIndex");
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v11 = v6;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v24 != v14)
            objc_enumerationMutation(v11);
          -[AKPageModelController insertObject:inAnnotationsAtIndex:](self, "insertObject:inAnnotationsAtIndex:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i), v10, (_QWORD)v23);
          v10 = objc_msgSend(v7, "indexGreaterThanIndex:", v10);
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      }
      while (v13);
    }
  }
  else
  {
    -[NSMutableOrderedSet insertObjects:atIndexes:](self->_mutableAnnotations, "insertObjects:atIndexes:", v6, v7);
    -[AKPageModelController _ensureInkAnnotationIsInFrontWhenEditsAreDone](self, "_ensureInkAnnotationIsInFrontWhenEditsAreDone");
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v16 = v6;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v28;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v28 != v19)
            objc_enumerationMutation(v16);
          v21 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * j);
          -[AKPageModelController inkCanvasAnnotation](self, "inkCanvasAnnotation");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v22)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              -[AKPageModelController setInkCanvasAnnotation:](self, "setInkCanvasAnnotation:", v21);
          }
          -[AKPageModelController _enableEditObservationForAnnotationIfNew:](self, "_enableEditObservationForAnnotationIfNew:", v21);
          -[AKPageModelController _logAnnotationAdded:](self, "_logAnnotationAdded:", v21);
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v18);
    }
  }

}

- (void)_enableEditObservationForAnnotationIfNew:(id)a3
{
  id v3;

  v3 = a3;
  if ((sub_22906F844() & 1) == 0
    && (objc_msgSend(v3, "isEdited") & 1) == 0
    && (objc_msgSend(v3, "shouldObserveEdits") & 1) == 0)
  {
    objc_msgSend(v3, "setShouldObserveEdits:", 1);
  }

}

- (void)removeAllAnnotations
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)MEMORY[0x24BDD15E0];
  -[AKPageModelController annotations](self, "annotations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexSetWithIndexesInRange:", 0, objc_msgSend(v4, "count"));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[AKPageModelController removeAnnotationsAtIndexes:](self, "removeAnnotationsAtIndexes:", v5);
}

- (void)removeObjectFromAnnotationsAtIndex:(unint64_t)a3
{
  void *v5;
  id v6;

  if (-[NSMutableOrderedSet count](self->_mutableAnnotations, "count") > a3)
  {
    -[NSMutableOrderedSet objectAtIndex:](self->_mutableAnnotations, "objectAtIndex:", a3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (-[NSMutableSet containsObject:](self->_mutableSelectedAnnotations, "containsObject:"))
      -[AKPageModelController removeSelectedAnnotationsObject:](self, "removeSelectedAnnotationsObject:", v6);
    objc_msgSend(v6, "setShouldObserveEdits:", 0);
    -[AKPageModelController inkCanvasAnnotation](self, "inkCanvasAnnotation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[AKPageModelController setInkCanvasAnnotation:](self, "setInkCanvasAnnotation:", 0);
    }
    -[NSMutableOrderedSet removeObjectAtIndex:](self->_mutableAnnotations, "removeObjectAtIndex:", a3);

  }
}

- (void)removeAnnotationsAtIndexes:(id)a3
{
  id v4;
  void *v5;
  NSMutableSet *mutableSelectedAnnotations;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NSMutableOrderedSet objectsAtIndexes:](self->_mutableAnnotations, "objectsAtIndexes:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  mutableSelectedAnnotations = self->_mutableSelectedAnnotations;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(mutableSelectedAnnotations) = -[NSMutableSet intersectsSet:](mutableSelectedAnnotations, "intersectsSet:", v7);

  if ((_DWORD)mutableSelectedAnnotations)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKPageModelController removeSelectedAnnotations:](self, "removeSelectedAnnotations:", v8);

  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v13), "setShouldObserveEdits:", 0, (_QWORD)v15);
        -[AKPageModelController inkCanvasAnnotation](self, "inkCanvasAnnotation");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            -[AKPageModelController setInkCanvasAnnotation:](self, "setInkCanvasAnnotation:", 0);
        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

  -[NSMutableOrderedSet removeObjectsAtIndexes:](self->_mutableAnnotations, "removeObjectsAtIndexes:", v4);
}

- (void)replaceObjectInAnnotationsAtIndex:(unint64_t)a3 withObject:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  -[NSMutableOrderedSet objectAtIndex:](self->_mutableAnnotations, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableSet containsObject:](self->_mutableSelectedAnnotations, "containsObject:", v6))
    -[AKPageModelController removeSelectedAnnotationsObject:](self, "removeSelectedAnnotationsObject:", v6);
  objc_msgSend(v6, "setShouldObserveEdits:", 0);
  -[NSMutableOrderedSet replaceObjectAtIndex:withObject:](self->_mutableAnnotations, "replaceObjectAtIndex:withObject:", a3, v7);
  -[AKPageModelController _ensureInkAnnotationIsInFrontWhenEditsAreDone](self, "_ensureInkAnnotationIsInFrontWhenEditsAreDone");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[AKPageModelController setInkCanvasAnnotation:](self, "setInkCanvasAnnotation:", 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[AKPageModelController setInkCanvasAnnotation:](self, "setInkCanvasAnnotation:", v7);
  -[AKPageModelController _enableEditObservationForAnnotationIfNew:](self, "_enableEditObservationForAnnotationIfNew:", v7);

}

- (void)replaceAnnotationsAtIndexes:(id)a3 withAnnotations:(id)a4
{
  id v6;
  id v7;
  NSMutableOrderedSet *mutableAnnotations;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  mutableAnnotations = self->_mutableAnnotations;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(mutableAnnotations) = -[NSMutableOrderedSet intersectsSet:](mutableAnnotations, "intersectsSet:", v9);

  if ((mutableAnnotations & 1) != 0)
  {
    v10 = objc_msgSend(v6, "firstIndex");
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v11 = v7;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v30 != v14)
            objc_enumerationMutation(v11);
          -[AKPageModelController replaceObjectInAnnotationsAtIndex:withObject:](self, "replaceObjectInAnnotationsAtIndex:withObject:", v10, *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i), (_QWORD)v29);
          v10 = objc_msgSend(v6, "indexGreaterThanIndex:", v10);
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
      }
      while (v13);
    }
  }
  else
  {
    v16 = (void *)MEMORY[0x24BDBCF20];
    -[NSMutableOrderedSet objectsAtIndexes:](self->_mutableAnnotations, "objectsAtIndexes:", v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setWithArray:", v17);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    if (-[NSMutableSet intersectsSet:](self->_mutableSelectedAnnotations, "intersectsSet:", v11))
      -[AKPageModelController removeSelectedAnnotations:](self, "removeSelectedAnnotations:", v11);
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    objc_msgSend(v11, "allObjects");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v38;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v38 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * j), "setShouldObserveEdits:", 0);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            -[AKPageModelController setInkCanvasAnnotation:](self, "setInkCanvasAnnotation:", 0);
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
      }
      while (v20);
    }

    -[NSMutableOrderedSet replaceObjectsAtIndexes:withObjects:](self->_mutableAnnotations, "replaceObjectsAtIndexes:withObjects:", v6, v7);
    -[AKPageModelController _ensureInkAnnotationIsInFrontWhenEditsAreDone](self, "_ensureInkAnnotationIsInFrontWhenEditsAreDone");
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v23 = v7;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v34;
      do
      {
        for (k = 0; k != v25; ++k)
        {
          if (*(_QWORD *)v34 != v26)
            objc_enumerationMutation(v23);
          v28 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * k);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            -[AKPageModelController setInkCanvasAnnotation:](self, "setInkCanvasAnnotation:", v28);
          -[AKPageModelController _enableEditObservationForAnnotationIfNew:](self, "_enableEditObservationForAnnotationIfNew:", v28);
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
      }
      while (v25);
    }

  }
}

- (NSSet)selectedAnnotations
{
  return (NSSet *)self->_mutableSelectedAnnotations;
}

- (void)addSelectedAnnotationsObject:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  -[AKPageModelController cropAnnotation](self, "cropAnnotation");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 != v7)
  {
    -[AKPageModelController inkCanvasAnnotation](self, "inkCanvasAnnotation");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    if (v5 != v7)
    {
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v7);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKPageModelController willChangeValueForKey:withSetMutation:usingObjects:](self, "willChangeValueForKey:withSetMutation:usingObjects:", CFSTR("selectedAnnotations"), 1, v6);
      -[NSMutableSet addObject:](self->_mutableSelectedAnnotations, "addObject:", v7);
      -[AKPageModelController didChangeValueForKey:withSetMutation:usingObjects:](self, "didChangeValueForKey:withSetMutation:usingObjects:", CFSTR("selectedAnnotations"), 1, v6);
      -[AKPageModelController _postSelectedAnnotationsChangedNotification](self, "_postSelectedAnnotationsChangedNotification");

    }
  }

}

- (void)addSelectedAnnotations:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[AKPageModelController cropAnnotation](self, "cropAnnotation");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[AKPageModelController cropAnnotation](self, "cropAnnotation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v4, "containsObject:", v7);

    if (v8)
    {
      v9 = (void *)objc_msgSend(v4, "mutableCopy");
      -[AKPageModelController cropAnnotation](self, "cropAnnotation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeObject:", v10);

      v4 = v9;
    }
  }
  -[AKPageModelController inkCanvasAnnotation](self, "inkCanvasAnnotation");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    -[AKPageModelController inkCanvasAnnotation](self, "inkCanvasAnnotation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v4, "containsObject:", v13);

    if (v14)
    {
      v15 = (void *)objc_msgSend(v4, "mutableCopy");
      -[AKPageModelController inkCanvasAnnotation](self, "inkCanvasAnnotation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "removeObject:", v16);

      v4 = v15;
    }
  }
  -[NSMutableOrderedSet set](self->_mutableAnnotations, "set");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v4, "isSubsetOfSet:", v17);

  if (v18)
  {
    -[AKPageModelController willChangeValueForKey:withSetMutation:usingObjects:](self, "willChangeValueForKey:withSetMutation:usingObjects:", CFSTR("selectedAnnotations"), 1, v4);
    -[NSMutableSet unionSet:](self->_mutableSelectedAnnotations, "unionSet:", v4);
    -[AKPageModelController didChangeValueForKey:withSetMutation:usingObjects:](self, "didChangeValueForKey:withSetMutation:usingObjects:", CFSTR("selectedAnnotations"), 1, v4);
  }
  else
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v19 = v4;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v25;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v25 != v22)
            objc_enumerationMutation(v19);
          -[AKPageModelController addSelectedAnnotationsObject:](self, "addSelectedAnnotationsObject:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v23++), (_QWORD)v24);
        }
        while (v21 != v23);
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v21);
    }

  }
  -[AKPageModelController _postSelectedAnnotationsChangedNotification](self, "_postSelectedAnnotationsChangedNotification", (_QWORD)v24);

}

- (void)removeSelectedAnnotationsObject:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x24BDBCF20];
  v5 = a3;
  objc_msgSend(v4, "setWithObject:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[AKPageModelController willChangeValueForKey:withSetMutation:usingObjects:](self, "willChangeValueForKey:withSetMutation:usingObjects:", CFSTR("selectedAnnotations"), 2, v6);
  -[NSMutableSet removeObject:](self->_mutableSelectedAnnotations, "removeObject:", v5);

  -[AKPageModelController didChangeValueForKey:withSetMutation:usingObjects:](self, "didChangeValueForKey:withSetMutation:usingObjects:", CFSTR("selectedAnnotations"), 2, v6);
  -[AKPageModelController _postSelectedAnnotationsChangedNotification](self, "_postSelectedAnnotationsChangedNotification");

}

- (void)removeSelectedAnnotations:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NSMutableOrderedSet set](self->_mutableAnnotations, "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isSubsetOfSet:", v5);

  if (v6)
  {
    -[AKPageModelController willChangeValueForKey:withSetMutation:usingObjects:](self, "willChangeValueForKey:withSetMutation:usingObjects:", CFSTR("selectedAnnotations"), 2, v4);
    -[NSMutableSet minusSet:](self->_mutableSelectedAnnotations, "minusSet:", v4);
    -[AKPageModelController didChangeValueForKey:withSetMutation:usingObjects:](self, "didChangeValueForKey:withSetMutation:usingObjects:", CFSTR("selectedAnnotations"), 2, v4);
  }
  else
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          -[AKPageModelController removeSelectedAnnotationsObject:](self, "removeSelectedAnnotationsObject:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++), (_QWORD)v12);
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

  }
  -[AKPageModelController _postSelectedAnnotationsChangedNotification](self, "_postSelectedAnnotationsChangedNotification", (_QWORD)v12);

}

- (void)intersectSelectedAnnotations:(id)a3
{
  id v4;

  v4 = a3;
  -[AKPageModelController willChangeValueForKey:withSetMutation:usingObjects:](self, "willChangeValueForKey:withSetMutation:usingObjects:", CFSTR("selectedAnnotations"), 3, v4);
  -[NSMutableSet intersectSet:](self->_mutableSelectedAnnotations, "intersectSet:", v4);
  -[AKPageModelController didChangeValueForKey:withSetMutation:usingObjects:](self, "didChangeValueForKey:withSetMutation:usingObjects:", CFSTR("selectedAnnotations"), 3, v4);

  -[AKPageModelController _postSelectedAnnotationsChangedNotification](self, "_postSelectedAnnotationsChangedNotification");
}

- (void)setSelectedAnnotations:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;

  v9 = a3;
  -[AKPageModelController inkCanvasAnnotation](self, "inkCanvasAnnotation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKPageModelController cropAnnotation](self, "cropAnnotation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_msgSend(v9, "containsObject:", v4) & 1) != 0)
  {
    v6 = (void *)objc_msgSend(v9, "mutableCopy");
    objc_msgSend(v6, "removeObject:", v4);
    if (!v5)
      goto LABEL_10;
  }
  else
  {
    if (!v5 || !objc_msgSend(v9, "containsObject:", v5))
    {
      v8 = v9;
      goto LABEL_12;
    }
    v7 = (void *)objc_msgSend(v9, "mutableCopy");
    v6 = v7;
    if (v4)
      objc_msgSend(v7, "removeObject:", v4);
  }
  objc_msgSend(v6, "removeObject:", v5);
LABEL_10:

  v8 = v6;
LABEL_12:
  v10 = v8;
  -[AKPageModelController willChangeValueForKey:withSetMutation:usingObjects:](self, "willChangeValueForKey:withSetMutation:usingObjects:", CFSTR("selectedAnnotations"), 4, v8);
  -[NSMutableSet setSet:](self->_mutableSelectedAnnotations, "setSet:", v10);
  -[AKPageModelController didChangeValueForKey:withSetMutation:usingObjects:](self, "didChangeValueForKey:withSetMutation:usingObjects:", CFSTR("selectedAnnotations"), 4, v10);
  -[AKPageModelController _postSelectedAnnotationsChangedNotification](self, "_postSelectedAnnotationsChangedNotification");

}

- (BOOL)containsAnnotation:(id)a3
{
  return -[NSMutableOrderedSet containsObject:](self->_mutableAnnotations, "containsObject:", a3);
}

- (void)selectAnnotation:(id)a3 byExtendingSelection:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a4;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v9 = v6;
    if (v4)
    {
      -[AKPageModelController addSelectedAnnotationsObject:](self, "addSelectedAnnotationsObject:", v6);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKPageModelController setSelectedAnnotations:](self, "setSelectedAnnotations:", v8);

    }
    v7 = v9;
  }

}

- (void)selectAnnotationsAtIndexes:(id)a3 byExtendingSelection:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  id v8;

  v4 = a4;
  v6 = (void *)MEMORY[0x24BDBCF20];
  -[NSMutableOrderedSet objectsAtIndexes:](self->_mutableAnnotations, "objectsAtIndexes:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[AKPageModelController addSelectedAnnotations:](self, "addSelectedAnnotations:", v8);
  else
    -[AKPageModelController setSelectedAnnotations:](self, "setSelectedAnnotations:", v8);

}

- (void)selectAllAnnotations
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)MEMORY[0x24BDBCF20];
  -[AKPageModelController annotations](self, "annotations");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKPageModelController setSelectedAnnotations:](self, "setSelectedAnnotations:", v4);

}

- (void)bringSelectedAnnotationsForward
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[5];

  -[AKPageModelController annotations](self, "annotations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = sub_229077C14;
  v15[3] = &unk_24F1A7D20;
  v15[4] = self;
  objc_msgSend(v3, "indexesOfObjectsPassingTest:", v15);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[AKPageModelController annotations](self, "annotations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectsAtIndexes:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v4, "lastIndex") + 1;
  -[AKPageModelController annotations](self, "annotations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v7 >= v9)
  {
    -[AKPageModelController removeAnnotationsAtIndexes:](self, "removeAnnotationsAtIndexes:", v4);
    goto LABEL_5;
  }
  -[AKPageModelController annotations](self, "annotations");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndex:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[AKPageModelController removeAnnotationsAtIndexes:](self, "removeAnnotationsAtIndexes:", v4);
  if (!v11)
  {
LABEL_5:
    -[AKPageModelController annotations](self, "annotations");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "count");
    goto LABEL_6;
  }
  -[AKPageModelController annotations](self, "annotations");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "indexOfObject:", v11) + 1;

LABEL_6:
  objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", v13, objc_msgSend(v6, "count"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKPageModelController insertAnnotations:atIndexes:](self, "insertAnnotations:atIndexes:", v6, v14);
  -[AKPageModelController selectAnnotationsAtIndexes:byExtendingSelection:](self, "selectAnnotationsAtIndexes:byExtendingSelection:", v14, 0);

}

- (void)bringSelectedAnnotationsToFront
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];

  -[AKPageModelController annotations](self, "annotations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = sub_229077D8C;
  v10[3] = &unk_24F1A7D20;
  v10[4] = self;
  objc_msgSend(v3, "indexesOfObjectsPassingTest:", v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[AKPageModelController annotations](self, "annotations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectsAtIndexes:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[AKPageModelController removeAnnotationsAtIndexes:](self, "removeAnnotationsAtIndexes:", v4);
  -[AKPageModelController annotations](self, "annotations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", v8, objc_msgSend(v6, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKPageModelController insertAnnotations:atIndexes:](self, "insertAnnotations:atIndexes:", v6, v9);
  -[AKPageModelController selectAnnotationsAtIndexes:byExtendingSelection:](self, "selectAnnotationsAtIndexes:byExtendingSelection:", v9, 0);

}

- (void)sendSelectedAnnotationsBackward
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[5];

  -[AKPageModelController annotations](self, "annotations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = sub_229077F5C;
  v14[3] = &unk_24F1A7D20;
  v14[4] = self;
  objc_msgSend(v3, "indexesOfObjectsPassingTest:", v14);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[AKPageModelController annotations](self, "annotations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectsAtIndexes:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v4, "firstIndex");
  if (v7 <= 0)
  {
    -[AKPageModelController removeAnnotationsAtIndexes:](self, "removeAnnotationsAtIndexes:", v4);
    goto LABEL_5;
  }
  v8 = v7 - 1;
  -[AKPageModelController annotations](self, "annotations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndex:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[AKPageModelController removeAnnotationsAtIndexes:](self, "removeAnnotationsAtIndexes:", v4);
  if (!v10)
  {
LABEL_5:
    v12 = 0;
    goto LABEL_6;
  }
  -[AKPageModelController annotations](self, "annotations");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "indexOfObject:", v10);

LABEL_6:
  objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", v12, objc_msgSend(v6, "count"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKPageModelController insertAnnotations:atIndexes:](self, "insertAnnotations:atIndexes:", v6, v13);
  -[AKPageModelController selectAnnotationsAtIndexes:byExtendingSelection:](self, "selectAnnotationsAtIndexes:byExtendingSelection:", v13, 0);

}

- (void)sendSelectedAnnotationsToBack
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  -[AKPageModelController annotations](self, "annotations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = sub_2290780B0;
  v8[3] = &unk_24F1A7D20;
  v8[4] = self;
  objc_msgSend(v3, "indexesOfObjectsPassingTest:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[AKPageModelController annotations](self, "annotations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectsAtIndexes:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[AKPageModelController removeAnnotationsAtIndexes:](self, "removeAnnotationsAtIndexes:", v4);
  objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", 0, objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKPageModelController insertAnnotations:atIndexes:](self, "insertAnnotations:atIndexes:", v6, v7);
  -[AKPageModelController selectAnnotationsAtIndexes:byExtendingSelection:](self, "selectAnnotationsAtIndexes:byExtendingSelection:", v7, 0);

}

- (void)addCropToolAnnotation
{
  void *v3;
  void *v4;
  AKCropAnnotation *v5;

  -[AKPageModelController cropAnnotation](self, "cropAnnotation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v5 = objc_alloc_init(AKCropAnnotation);
    -[AKPageModelController setCropAnnotation:](self, "setCropAnnotation:", v5);
    -[AKCropAnnotation setShowHandles:](v5, "setShowHandles:", 1);
    -[AKCropAnnotation setRectangle:](v5, "setRectangle:", *MEMORY[0x24BDBF028], *(double *)(MEMORY[0x24BDBF028] + 8), *(double *)(MEMORY[0x24BDBF028] + 16), *(double *)(MEMORY[0x24BDBF028] + 24));
    -[AKAnnotation setOriginalModelBaseScaleFactor:](v5, "setOriginalModelBaseScaleFactor:", 1.0);
    -[AKAnnotation setOriginalExifOrientation:](v5, "setOriginalExifOrientation:", 1);
    -[AKPageModelController mutableArrayValueForKey:](self, "mutableArrayValueForKey:", CFSTR("annotations"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
}

- (void)removeCropToolAnnotation
{
  void *v3;
  void *v4;
  void *v5;

  -[AKPageModelController cropAnnotation](self, "cropAnnotation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AKPageModelController mutableArrayValueForKey:](self, "mutableArrayValueForKey:", CFSTR("annotations"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKPageModelController cropAnnotation](self, "cropAnnotation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObject:", v5);

    -[AKPageModelController setCropAnnotation:](self, "setCropAnnotation:", 0);
  }
}

- (AKInkAnnotation)inkCanvasAnnotation
{
  return self->_inkCanvasAnnotation;
}

- (void)setInkCanvasAnnotation:(id)a3
{
  AKInkAnnotation *v5;
  void *v6;
  AKInkAnnotation *v7;

  v5 = (AKInkAnnotation *)a3;
  if (self->_inkCanvasAnnotation != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_inkCanvasAnnotation, a3);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:", off_255A25E10[0], self);

    v5 = v7;
  }

}

- (void)setInkCanvasAnnotationOneTime:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (v6)
  {
    -[AKPageModelController mutableArrayValueForKey:](self, "mutableArrayValueForKey:", CFSTR("annotations"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v6);
  }
  else
  {
    -[AKPageModelController inkCanvasAnnotation](self, "inkCanvasAnnotation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[AKPageModelController mutableArrayValueForKey:](self, "mutableArrayValueForKey:", CFSTR("annotations"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeObject:", v4);

    }
  }

}

- (BOOL)hasMaskBorderAnnotation
{
  void *v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  -[AKPageModelController annotations](self, "annotations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = sub_22907841C;
  v4[3] = &unk_24F1A7BE0;
  v4[4] = &v5;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v4);

  LOBYTE(v2) = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)v2;
}

- (id)archivableRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
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
  v3 = (void *)MEMORY[0x24BDBCEB8];
  -[AKPageModelController annotations](self, "annotations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[AKPageModelController annotations](self, "annotations", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "dataRepresentation");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[AKSecureSerializationHelper dataForSecureCodingCompliantObject:withOptionalKey:](AKSecureSerializationHelper, "dataForSecureCodingCompliantObject:withOptionalKey:", v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (AKPageModelController)initWithArchivableRepresentation:(id)a3
{
  id v4;
  AKPageModelController *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void *v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  _QWORD v24[4];

  v24[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[AKPageModelController init](self, "init");
  if (v5)
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = sub_22907880C;
    v22 = sub_22907881C;
    v23 = 0;
    v24[0] = objc_opt_class();
    v24[1] = objc_opt_class();
    v24[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[AKSecureSerializationHelper secureCodingCompliantObjectForData:ofClasses:withOptionalKey:](AKSecureSerializationHelper, "secureCodingCompliantObjectForData:ofClasses:withOptionalKey:", v4, v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x24BDAC760];
    v13 = 3221225472;
    v14 = sub_229078824;
    v15 = &unk_24F1A8360;
    v9 = v8;
    v16 = v9;
    v17 = &v18;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", &v12);
    -[AKPageModelController mutableArrayValueForKey:](v5, "mutableArrayValueForKey:", CFSTR("annotations"), v12, v13, v14, v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObjectsFromArray:", v9);

    if (v19[5])
      -[AKPageModelController setCropAnnotation:](v5, "setCropAnnotation:");

    _Block_object_dispose(&v18, 8);
  }

  return v5;
}

- (id)selectionStateForUndo
{
  void *v2;
  void *v3;

  -[AKPageModelController selectedAnnotations](self, "selectedAnnotations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (void)restoreSelectionStateForUndo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AKPageModelController mutableSetValueForKey:](self, "mutableSetValueForKey:", CFSTR("selectedAnnotations"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSet:", v4);

}

- (void)_ensureInkAnnotationIsInFrontWhenEditsAreDone
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelPerformSelector:target:argument:", sel__coalescedEnsureInkAnnotationIsInFront_, self, 0);

  objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = *MEMORY[0x24BDBCB80];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "performSelector:target:argument:order:modes:", sel__coalescedEnsureInkAnnotationIsInFront_, self, 0, 349999, v5);

}

- (void)_coalescedEnsureInkAnnotationIsInFront:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelPerformSelector:target:argument:", sel__coalescedEnsureInkAnnotationIsInFront_, self, 0);

  -[AKPageModelController inkCanvasAnnotation](self, "inkCanvasAnnotation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v11 = v5;
    -[AKPageModelController mutableArrayValueForKey:](self, "mutableArrayValueForKey:", CFSTR("annotations"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "indexOfObject:", v11);
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v8 = v7;
      if (v7 != objc_msgSend(v6, "count") - 1)
      {
        objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "postNotificationName:object:", off_255A25E18[0], 0);

        objc_msgSend(v6, "removeObjectAtIndex:", v8);
        objc_msgSend(v6, "addObject:", v11);
        objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "postNotificationName:object:", off_255A25E20, 0);

      }
    }

    v5 = v11;
  }

}

- (void)_logAnnotationAdded:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AKPageModelController statisticsLogger](self, "statisticsLogger");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logAnnotationAdded:", v4);

}

- (void)_postSelectedAnnotationsChangedNotification
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDD16C8], "notificationWithName:object:", off_255A25E08[0], self);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16D8], "defaultQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enqueueNotification:postingStyle:coalesceMask:forModes:", v3, 2, 1, 0);

}

- (id)representedObject
{
  return objc_loadWeakRetained(&self->_representedObject);
}

- (void)setRepresentedObject:(id)a3
{
  objc_storeWeak(&self->_representedObject, a3);
}

- (CGRect)appliedCropRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_appliedCropRect, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setAppliedCropRect:(CGRect)a3
{
  CGRect v3;

  v3 = a3;
  objc_copyStruct(&self->_appliedCropRect, &v3, 32, 1, 0);
}

- (AKCropAnnotation)cropAnnotation
{
  return (AKCropAnnotation *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCropAnnotation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (AKStatistics)statisticsLogger
{
  return (AKStatistics *)objc_loadWeakRetained((id *)&self->_statisticsLogger);
}

- (void)setStatisticsLogger:(id)a3
{
  objc_storeWeak((id *)&self->_statisticsLogger, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_statisticsLogger);
  objc_storeStrong((id *)&self->_cropAnnotation, 0);
  objc_destroyWeak(&self->_representedObject);
  objc_storeStrong((id *)&self->_inkCanvasAnnotation, 0);
  objc_storeStrong((id *)&self->_mutableSelectedAnnotations, 0);
  objc_storeStrong((id *)&self->_mutableAnnotations, 0);
}

@end
