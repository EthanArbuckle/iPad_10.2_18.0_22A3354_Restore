@implementation CRKOrderedOneToManyKVOAccumulator

- (CRKOrderedOneToManyKVOAccumulator)initWithObject:(id)a3 keyPath:(id)a4
{
  id v6;
  id v7;
  CRKOrderedOneToManyKVOAccumulator *v8;
  uint64_t v9;
  CRKPointerSet *mReplacementObjects;
  uint64_t v11;
  CRKPointerSet *mInsertedObjects;
  uint64_t v13;
  NSMapTable *mIndexForDeletedObject;
  uint64_t v15;
  NSMapTable *mOriginalIndexOfMovedObject;
  uint64_t v17;
  NSString *observedKeyPath;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CRKOrderedOneToManyKVOAccumulator;
  v8 = -[CRKOrderedOneToManyKVOAccumulator init](&v20, sel_init);
  if (v8)
  {
    v9 = objc_opt_new();
    mReplacementObjects = v8->mReplacementObjects;
    v8->mReplacementObjects = (CRKPointerSet *)v9;

    v11 = objc_opt_new();
    mInsertedObjects = v8->mInsertedObjects;
    v8->mInsertedObjects = (CRKPointerSet *)v11;

    objc_msgSend(MEMORY[0x24BDD1650], "mapTableWithKeyOptions:valueOptions:", 512, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    mIndexForDeletedObject = v8->mIndexForDeletedObject;
    v8->mIndexForDeletedObject = (NSMapTable *)v13;

    objc_msgSend(MEMORY[0x24BDD1650], "mapTableWithKeyOptions:valueOptions:", 512, 0);
    v15 = objc_claimAutoreleasedReturnValue();
    mOriginalIndexOfMovedObject = v8->mOriginalIndexOfMovedObject;
    v8->mOriginalIndexOfMovedObject = (NSMapTable *)v15;

    objc_msgSend(v6, "addObserver:forKeyPath:options:context:", v8, v7, 11, CFSTR("CRKOrderedOneToManyKVOAccumulatorObservationContext"));
    v17 = objc_msgSend(v7, "copy");
    observedKeyPath = v8->_observedKeyPath;
    v8->_observedKeyPath = (NSString *)v17;

    objc_storeWeak((id *)&v8->_observedObject, v6);
  }

  return v8;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[CRKOrderedOneToManyKVOAccumulator observedObject](self, "observedObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKOrderedOneToManyKVOAccumulator observedKeyPath](self, "observedKeyPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, v4, CFSTR("CRKOrderedOneToManyKVOAccumulatorObservationContext"));

  v5.receiver = self;
  v5.super_class = (Class)CRKOrderedOneToManyKVOAccumulator;
  -[CRKOrderedOneToManyKVOAccumulator dealloc](&v5, sel_dealloc);
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    -[CRKOrderedOneToManyKVOAccumulator _reset](self, "_reset");
    v5 = obj;
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id location;
  objc_super v25;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (a6 == CFSTR("CRKOrderedOneToManyKVOAccumulatorObservationContext"))
  {
    objc_msgSend(v12, "valueForKey:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;
    v16 = v15;

    if (!v16)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "valueForKey:", v11);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKOrderedOneToManyKVOAccumulator.m"), 96, CFSTR("expected array, got %@"), v21);

    }
    if (-[CRKOrderedOneToManyKVOAccumulator _integrateChange:toArray:](self, "_integrateChange:toArray:", v13, v16))
    {
      self->mInitialArrayCount = objc_msgSend(v16, "count");
      objc_initWeak(&location, self);
      v17 = (void *)MEMORY[0x24BDBCF18];
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __84__CRKOrderedOneToManyKVOAccumulator_observeValueForKeyPath_ofObject_change_context___block_invoke;
      v22[3] = &unk_24D9C7A60;
      objc_copyWeak(&v23, &location);
      objc_msgSend(v17, "cat_performBlockOnMainRunLoop:", v22);
      objc_destroyWeak(&v23);
      objc_destroyWeak(&location);
    }

  }
  else
  {
    v25.receiver = self;
    v25.super_class = (Class)CRKOrderedOneToManyKVOAccumulator;
    -[CRKOrderedOneToManyKVOAccumulator observeValueForKeyPath:ofObject:change:context:](&v25, sel_observeValueForKeyPath_ofObject_change_context_, v11, v12, v13, a6);
  }

}

void __84__CRKOrderedOneToManyKVOAccumulator_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_drain");

}

- (BOOL)hasChanges
{
  return self->mObservedShadow != 0;
}

- (BOOL)_integrateChange:(id)a3 toArray:(id)a4
{
  id v7;
  id v8;
  void *v9;
  BOOL v10;
  NSMutableArray *v11;
  NSMutableArray *mObservedShadow;
  unint64_t v13;
  NSMutableArray *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  void *v23;
  unint64_t v24;
  NSMapTable *mIndexForDeletedObject;
  void *v26;
  unint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;
  BOOL v35;
  _QWORD v36[4];
  id v37;
  CRKOrderedOneToManyKVOAccumulator *v38;
  uint64_t *v39;
  _QWORD v40[4];
  id v41;
  CRKOrderedOneToManyKVOAccumulator *v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E78]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[CRKOrderedOneToManyKVOAccumulator hasChanges](self, "hasChanges");
  if (!self->mObservedShadow)
  {
    if (!v9)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKOrderedOneToManyKVOAccumulator.m"), 127, CFSTR("expected to initialize shadow with original array size; observer must include NSKeyValueObservingOptionPrior option"));

    }
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    v11 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    mObservedShadow = self->mObservedShadow;
    self->mObservedShadow = v11;

    if (objc_msgSend(v8, "count"))
    {
      v13 = 0;
      do
      {
        v14 = self->mObservedShadow;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](v14, "addObject:", v15);

        ++v13;
      }
      while (v13 < objc_msgSend(v8, "count"));
    }
  }
  if (!v9)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E68]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "unsignedIntegerValue");

    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E60]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E80]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    v35 = v10;
    switch(v17)
    {
      case 1:
        if (objc_msgSend(v19, "count"))
        {
          v22 = 0;
          do
          {
            objc_msgSend(v19, "objectAtIndexedSubscript:", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = -[CRKOrderedOneToManyKVOAccumulator _prestateIndexForImmediateIndex:](self, "_prestateIndexForImmediateIndex:", v22);
            if (v24 != 0x7FFFFFFFFFFFFFFFLL)
            {
              mIndexForDeletedObject = self->mIndexForDeletedObject;
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v24);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMapTable setObject:forKey:](mIndexForDeletedObject, "setObject:forKey:", v26, v23);

            }
            -[CRKPointerSet removeObject:](self->mReplacementObjects, "removeObject:", v23);

            ++v22;
          }
          while (v22 < objc_msgSend(v19, "count"));
        }
        -[NSMutableArray removeAllObjects](self->mObservedShadow, "removeAllObjects");
        if (objc_msgSend(v21, "count"))
        {
          v27 = 0;
          do
          {
            objc_msgSend(v21, "objectAtIndexedSubscript:", v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMapTable objectForKey:](self->mIndexForDeletedObject, "objectForKey:", v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            if (v29)
            {
              -[NSMapTable removeObjectForKey:](self->mIndexForDeletedObject, "removeObjectForKey:", v28);
              -[NSMapTable setObject:forKey:](self->mOriginalIndexOfMovedObject, "setObject:forKey:", v29, v28);
            }
            else
            {
              -[CRKPointerSet addObject:](self->mInsertedObjects, "addObject:", v28);
            }
            -[NSMutableArray insertObject:atIndex:](self->mObservedShadow, "insertObject:atIndex:", &unk_24DA07E80, v27);

            ++v27;
          }
          while (v27 < objc_msgSend(v21, "count"));
        }
        break;
      case 2:
        v44 = 0;
        v45 = &v44;
        v46 = 0x2020000000;
        v47 = 0;
        v40[0] = MEMORY[0x24BDAC760];
        v40[1] = 3221225472;
        v40[2] = __62__CRKOrderedOneToManyKVOAccumulator__integrateChange_toArray___block_invoke;
        v40[3] = &unk_24D9C7A88;
        v42 = self;
        v43 = &v44;
        v41 = v20;
        objc_msgSend(v18, "enumerateIndexesUsingBlock:", v40);
        v30 = v41;
        goto LABEL_25;
      case 3:
        v44 = 0;
        v45 = &v44;
        v46 = 0x2020000000;
        v47 = 0;
        v36[0] = MEMORY[0x24BDAC760];
        v36[1] = 3221225472;
        v36[2] = __62__CRKOrderedOneToManyKVOAccumulator__integrateChange_toArray___block_invoke_18;
        v36[3] = &unk_24D9C7A88;
        v38 = self;
        v39 = &v44;
        v37 = v19;
        objc_msgSend(v18, "enumerateIndexesUsingBlock:", v36);
        -[NSMutableArray removeObjectsAtIndexes:](self->mObservedShadow, "removeObjectsAtIndexes:", v18);
        v30 = v37;
LABEL_25:

        _Block_object_dispose(&v44, 8);
        break;
      case 4:
        -[CRKPointerSet addObjectsFromArray:](self->mReplacementObjects, "addObjectsFromArray:", v20);
        break;
      default:
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v17);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKOrderedOneToManyKVOAccumulator.m"), 212, CFSTR("unexpected change kind: %@"), v32);

        break;
    }

    v10 = v35;
  }

  return !v10;
}

void __62__CRKOrderedOneToManyKVOAccumulator__integrateChange_toArray___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "objectForKey:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 40);
  if (v4)
  {
    objc_msgSend(*(id *)(v5 + 24), "removeObjectForKey:", v6);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "setObject:forKey:", v4, v6);
  }
  else
  {
    objc_msgSend(*(id *)(v5 + 8), "addObject:", v6);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "insertObject:atIndex:", &unk_24DA07E80, a2);
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);

}

void __62__CRKOrderedOneToManyKVOAccumulator__integrateChange_toArray___block_invoke_18(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(*(id *)(a1 + 40), "_prestateIndexForImmediateIndex:", a2);
  v5 = *(_QWORD *)(a1 + 40);
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = *(void **)(v5 + 24);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v8;
    goto LABEL_5;
  }
  objc_msgSend(*(id *)(v5 + 8), "removeObject:", v9);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "objectForKey:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "removeObjectForKey:", v9);
    v7 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
LABEL_5:
    objc_msgSend(v7, "setObject:forKey:", v6, v9);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "removeObject:", v9);
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);

}

- (void)_validateArrayChangeToFinalCount:(int64_t)a3 accumulatedResults:(id)a4
{
  id v7;
  int64_t mInitialArrayCount;
  uint64_t v9;
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
  id v20;

  v7 = a4;
  mInitialArrayCount = self->mInitialArrayCount;
  v20 = v7;
  v9 = objc_msgSend(v7, "netCountChange") + mInitialArrayCount;
  if (v9 != a3)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->mInitialArrayCount);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v20, "insertions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "numberWithUnsignedInteger:", objc_msgSend(v13, "count"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v20, "deletions");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "numberWithUnsignedInteger:", objc_msgSend(v16, "count"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKOrderedOneToManyKVOAccumulator.m"), 220, CFSTR("Expected final array to have %@ elements (%@ original elements + %@ insertions - %@ deletions), but it has %@ elements"), v10, v11, v14, v17, v18);

  }
}

- (void)_drain
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;

  -[CRKOrderedOneToManyKVOAccumulator delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v11 = v3;
    -[CRKOrderedOneToManyKVOAccumulator observedObject](self, "observedObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKOrderedOneToManyKVOAccumulator observedKeyPath](self, "observedKeyPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueForKeyPath:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    if (v8)
    {
      v9 = objc_msgSend(v8, "count");
      if (-[CRKOrderedOneToManyKVOAccumulator hasChanges](self, "hasChanges"))
      {
        -[CRKOrderedOneToManyKVOAccumulator _resultsToArriveAtArray:](self, "_resultsToArriveAtArray:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[CRKOrderedOneToManyKVOAccumulator _validateArrayChangeToFinalCount:accumulatedResults:](self, "_validateArrayChangeToFinalCount:accumulatedResults:", v9, v10);
        if ((objc_msgSend(v10, "isEmpty") & 1) == 0)
          objc_msgSend(v11, "kvoAccumulator:didCoelesceResults:", self, v10);
        -[CRKOrderedOneToManyKVOAccumulator _reset](self, "_reset");

      }
      else
      {
        -[CRKOrderedOneToManyKVOAccumulator _validateArrayChangeToFinalCount:accumulatedResults:](self, "_validateArrayChangeToFinalCount:accumulatedResults:", v9, 0);
      }
    }

    v3 = v11;
  }

}

- (void)_reset
{
  NSMutableArray *mObservedShadow;

  -[CRKPointerSet removeAllObjects](self->mReplacementObjects, "removeAllObjects");
  -[CRKPointerSet removeAllObjects](self->mInsertedObjects, "removeAllObjects");
  -[NSMapTable removeAllObjects](self->mIndexForDeletedObject, "removeAllObjects");
  -[NSMapTable removeAllObjects](self->mOriginalIndexOfMovedObject, "removeAllObjects");
  mObservedShadow = self->mObservedShadow;
  self->mObservedShadow = 0;

}

- (id)_resultsToArriveAtArray:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[NSMapTable objectEnumerator](self->mIndexForDeletedObject, "objectEnumerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(v6, "addIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v11++), "unsignedIntegerValue"));
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v9);
  }

  v20 = v5;
  objc_msgSend(v5, "setDeletions:", v6);
  v12 = (void *)objc_opt_new();
  v13 = (void *)objc_opt_new();
  v21 = (void *)objc_opt_new();
  if (objc_msgSend(v4, "count"))
  {
    v14 = 0;
    do
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[CRKPointerSet containsObject:](self->mInsertedObjects, "containsObject:", v15))
        objc_msgSend(v12, "addIndex:", v14);
      if (-[CRKPointerSet containsObject:](self->mReplacementObjects, "containsObject:", v15))
        objc_msgSend(v13, "addIndex:", v14);
      -[NSMapTable objectForKey:](self->mOriginalIndexOfMovedObject, "objectForKey:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v17 = (void *)objc_opt_new();
        objc_msgSend(v17, "setSourceIndex:", objc_msgSend(v16, "integerValue"));
        objc_msgSend(v17, "setDestinationIndex:", v14);
        v18 = objc_msgSend(v17, "sourceIndex");
        if (v18 != objc_msgSend(v17, "destinationIndex"))
          objc_msgSend(v21, "addObject:", v17);

      }
      ++v14;
    }
    while (v14 < objc_msgSend(v4, "count"));
  }
  objc_msgSend(v20, "setInsertions:", v12);
  objc_msgSend(v20, "setReplacements:", v13);
  objc_msgSend(v20, "setMoves:", v21);

  return v20;
}

- (unint64_t)_prestateIndexForImmediateIndex:(unint64_t)a3
{
  void *v6;
  unint64_t v7;
  void *v9;

  if (-[NSMutableArray count](self->mObservedShadow, "count") <= a3)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKOrderedOneToManyKVOAccumulator.m"), 298, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("number < mObservedShadow.count"));

  }
  -[NSMutableArray objectAtIndexedSubscript:](self->mObservedShadow, "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  return v7;
}

- (CRKOrderedOneToManyKVOAccumulatorDelegate)delegate
{
  return (CRKOrderedOneToManyKVOAccumulatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSString)observedKeyPath
{
  return self->_observedKeyPath;
}

- (void)setObservedKeyPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSObject)observedObject
{
  return objc_loadWeakRetained((id *)&self->_observedObject);
}

- (void)setObservedObject:(id)a3
{
  objc_storeWeak((id *)&self->_observedObject, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_observedObject);
  objc_storeStrong((id *)&self->_observedKeyPath, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->mObservedShadow, 0);
  objc_storeStrong((id *)&self->mOriginalIndexOfMovedObject, 0);
  objc_storeStrong((id *)&self->mIndexForDeletedObject, 0);
  objc_storeStrong((id *)&self->mReplacementObjects, 0);
  objc_storeStrong((id *)&self->mInsertedObjects, 0);
}

@end
