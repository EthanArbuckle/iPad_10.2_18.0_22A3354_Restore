@implementation _MSPContainerEditsRecorder

- (_MSPContainerEditsRecorder)initWithMutableArray:(id)a3
{
  id v5;
  _MSPContainerEditsRecorder *v6;
  _MSPContainerEditsRecorder *v7;
  NSMutableArray *v8;
  NSMutableArray *orderedEdits;
  void *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_MSPContainerEditsRecorder;
  v6 = -[_MSPContainerEditsRecorder init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_originalMutableArray, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    orderedEdits = v7->_orderedEdits;
    v7->_orderedEdits = v8;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v7, sel__mutableObjectContentDidUpdate_, CFSTR("MSPMutableObjectContentDidUpdateNotification"), 0);

  }
  return v7;
}

- (NSMutableArray)recordableMutableArray
{
  return (NSMutableArray *)-[_MSPContainerEditsRecorder mutableArrayValueForKey:](self, "mutableArrayValueForKey:", CFSTR("editableObjects"));
}

- (NSArray)orderedEdits
{
  return (NSArray *)self->_orderedEdits;
}

- (unint64_t)countOfEditableObjects
{
  return -[NSMutableArray count](self->_originalMutableArray, "count");
}

- (id)objectInEditableObjectsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndexedSubscript:](self->_originalMutableArray, "objectAtIndexedSubscript:", a3);
}

- (id)editableObjectsAtIndexes:(id)a3
{
  return (id)-[NSMutableArray objectsAtIndexes:](self->_originalMutableArray, "objectsAtIndexes:", a3);
}

- (void)getEditableObjects:(id *)a3 range:(_NSRange)a4
{
  -[NSMutableArray getObjects:range:](self->_originalMutableArray, "getObjects:range:", a3, a4.location, a4.length);
}

- (void)insertObject:(id)a3 inEditableObjectsAtIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  NSMutableArray *orderedEdits;
  _MSPContainerEditAddition *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _MSPContainerEditAddition *v15;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[NSMutableArray insertObject:atIndex:](self->_originalMutableArray, "insertObject:atIndex:", v6, a4);
  if (a4)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_originalMutableArray, "objectAtIndexedSubscript:", a4 - 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "storageIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  orderedEdits = self->_orderedEdits;
  v10 = [_MSPContainerEditAddition alloc];
  v17[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16 = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[_MSPContainerEditAddition initWithObjects:indexes:identifiersAtop:](v10, "initWithObjects:indexes:identifiersAtop:", v11, v12, v14);
  -[NSMutableArray addObject:](orderedEdits, "addObject:", v15);

  if (!v8)
}

- (void)removeObjectFromEditableObjectsAtIndex:(unint64_t)a3
{
  void *v5;
  NSMutableArray *orderedEdits;
  _MSPContainerEditRemoval *v7;
  void *v8;
  void *v9;
  _MSPContainerEditRemoval *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableArray objectAtIndexedSubscript:](self->_originalMutableArray, "objectAtIndexedSubscript:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeObjectAtIndex:](self->_originalMutableArray, "removeObjectAtIndex:", a3);
  orderedEdits = self->_orderedEdits;
  v7 = [_MSPContainerEditRemoval alloc];
  v11[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[_MSPContainerEditRemoval initWithRemovedObjects:indexes:](v7, "initWithRemovedObjects:indexes:", v8, v9);
  -[NSMutableArray addObject:](orderedEdits, "addObject:", v10);

}

- (void)replaceObjectInEditableObjectsAtIndex:(unint64_t)a3 withObject:(id)a4
{
  id v6;
  void *v7;
  NSMutableArray *orderedEdits;
  _MSPContainerEditReplacement *v9;
  void *v10;
  void *v11;
  void *v12;
  _MSPContainerEditReplacement *v13;
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[NSMutableArray objectAtIndexedSubscript:](self->_originalMutableArray, "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqual:", v6) & 1) == 0)
  {
    -[NSMutableArray replaceObjectAtIndex:withObject:](self->_originalMutableArray, "replaceObjectAtIndex:withObject:", a3, v6);
    orderedEdits = self->_orderedEdits;
    v9 = [_MSPContainerEditReplacement alloc];
    v15[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[_MSPContainerEditReplacement initWithOriginalObjects:replacementObjects:indexes:](v9, "initWithOriginalObjects:replacementObjects:indexes:", v10, v11, v12);
    -[NSMutableArray addObject:](orderedEdits, "addObject:", v13);

  }
}

- (void)insertEditableObjects:(id)a3 atIndexes:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSMutableArray *orderedEdits;
  _MSPContainerEditAddition *v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  -[NSMutableArray insertObjects:atIndexes:](self->_originalMutableArray, "insertObjects:atIndexes:", v15, v6);
  v7 = (void *)objc_opt_new();
  v8 = objc_msgSend(v6, "firstIndex");
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = v8;
    v10 = v8 - 1;
    if (v8)
      goto LABEL_5;
    while (1)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v11);
      while (1)
      {

        if (!v9)
          break;
LABEL_5:
        -[NSMutableArray objectAtIndexedSubscript:](self->_originalMutableArray, "objectAtIndexedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "storageIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v14);

      }
    }
  }
  orderedEdits = self->_orderedEdits;
  v13 = -[_MSPContainerEditAddition initWithObjects:indexes:identifiersAtop:]([_MSPContainerEditAddition alloc], "initWithObjects:indexes:identifiersAtop:", v15, v6, v7);
  -[NSMutableArray addObject:](orderedEdits, "addObject:", v13);

}

- (void)removeEditableObjectsAtIndexes:(id)a3
{
  void *v4;
  NSMutableArray *orderedEdits;
  _MSPContainerEditRemoval *v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "count"))
  {
    -[NSMutableArray objectsAtIndexes:](self->_originalMutableArray, "objectsAtIndexes:", v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObjectsAtIndexes:](self->_originalMutableArray, "removeObjectsAtIndexes:", v7);
    orderedEdits = self->_orderedEdits;
    v6 = -[_MSPContainerEditRemoval initWithRemovedObjects:indexes:]([_MSPContainerEditRemoval alloc], "initWithRemovedObjects:indexes:", v4, v7);
    -[NSMutableArray addObject:](orderedEdits, "addObject:", v6);

  }
}

- (void)replaceEditableObjectsAtIndexes:(id)a3 withEditableObjects:(id)a4
{
  id v6;
  void *v7;
  NSMutableArray *orderedEdits;
  _MSPContainerEditReplacement *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[NSMutableArray objectsAtIndexes:](self->_originalMutableArray, "objectsAtIndexes:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqual:", v6) & 1) == 0)
  {
    -[NSMutableArray replaceObjectsAtIndexes:withObjects:](self->_originalMutableArray, "replaceObjectsAtIndexes:withObjects:", v10, v6);
    orderedEdits = self->_orderedEdits;
    v9 = -[_MSPContainerEditReplacement initWithOriginalObjects:replacementObjects:indexes:]([_MSPContainerEditReplacement alloc], "initWithOriginalObjects:replacementObjects:indexes:", v7, v6, v10);
    -[NSMutableArray addObject:](orderedEdits, "addObject:", v9);

  }
}

- (void)_mutableObjectContentDidUpdate:(id)a3
{
  id v4;
  NSMutableArray *originalMutableArray;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    originalMutableArray = self->_originalMutableArray;
    v8 = v4;
    objc_msgSend(v4, "object");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(originalMutableArray) = -[NSMutableArray containsObject:](originalMutableArray, "containsObject:", v6);

    v4 = v8;
    if ((_DWORD)originalMutableArray)
    {
      objc_msgSend(v8, "object");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MSPContainerEditsRecorder _editDetectorDidDetectUpdateForObject:](self, "_editDetectorDidDetectUpdateForObject:", v7);

      v4 = v8;
    }
  }

}

- (void)_editDetectorDidDetectUpdateForObject:(id)a3
{
  id v4;
  NSMutableSet *updatedObjects;
  NSMutableSet *v6;
  NSMutableSet *v7;
  NSMutableArray *orderedEdits;
  _MSPContainerEditContentUpdate *v9;
  id v10;

  v4 = a3;
  updatedObjects = self->_updatedObjects;
  v10 = v4;
  if (!updatedObjects)
  {
    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v7 = self->_updatedObjects;
    self->_updatedObjects = v6;

    v4 = v10;
    updatedObjects = self->_updatedObjects;
  }
  if ((-[NSMutableSet containsObject:](updatedObjects, "containsObject:", v4) & 1) == 0)
  {
    -[NSMutableSet addObject:](self->_updatedObjects, "addObject:", v10);
    orderedEdits = self->_orderedEdits;
    v9 = -[_MSPContainerEditContentUpdate initWithUpdatedObject:]([_MSPContainerEditContentUpdate alloc], "initWithUpdatedObject:", v10);
    -[NSMutableArray addObject:](orderedEdits, "addObject:", v9);

  }
}

- (void)useImmutableObjectsForEditsFromMap:(id)a3 intermediateMutableObjectTransferBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[_MSPContainerEditsRecorder orderedEdits](self, "orderedEdits", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "useImmutableObjectsFromMap:intermediateMutableObjectTransferBlock:", v6, v7);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedObjects, 0);
  objc_storeStrong((id *)&self->_orderedEdits, 0);
  objc_storeStrong((id *)&self->_originalMutableArray, 0);
}

@end
