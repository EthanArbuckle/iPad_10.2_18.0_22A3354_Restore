@implementation _EFPriorityQueueStrategy

- (void).cxx_destruct
{
  objc_storeStrong(&self->_comparator, 0);
}

- (_EFPriorityQueueStrategy)initWithComparator:(id)a3
{
  id v4;
  _EFPriorityQueueStrategy *v5;
  void *v6;
  id comparator;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_EFPriorityQueueStrategy;
  v5 = -[_EFPriorityQueueStrategy init](&v9, sel_init);
  if (v5)
  {
    v6 = _Block_copy(v4);
    comparator = v5->_comparator;
    v5->_comparator = v6;

  }
  return v5;
}

- (NSString)descriptionType
{
  return (NSString *)CFSTR("priority");
}

- (void)enqueueObject:(id)a3 replaceIfExists:(BOOL)a4 buffer:(id)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  unint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, void *);
  void *v16;
  id v17;

  v6 = a4;
  v11 = a3;
  v8 = a5;
  if (v6)
  {
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __65___EFPriorityQueueStrategy_enqueueObject_replaceIfExists_buffer___block_invoke;
    v16 = &unk_1E62A6EC0;
    v17 = v11;
    objc_msgSend(v8, "indexesOfObjectsPassingTest:", &v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObjectsAtIndexes:", v9);

  }
  v10 = -[_EFPriorityQueueStrategy _insertionIndexForObject:buffer:](self, "_insertionIndexForObject:buffer:", v11, v8, v11, v13, v14, v15, v16);
  objc_msgSend(v8, "insertObject:atIndex:", v12, v10);

}

- (void)dequeueObject:(id)a3 buffer:(id)a4
{
  id v6;
  unint64_t v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = -[_EFPriorityQueueStrategy _indexForObject:buffer:](self, "_indexForObject:buffer:", v8, v6);
  if (v7 != 0x7FFFFFFFFFFFFFFFLL && v7 < objc_msgSend(v6, "count"))
    objc_msgSend(v6, "removeObjectAtIndex:", v7);

}

- (unint64_t)_insertionIndexForObject:(id)a3 buffer:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "indexOfObject:inSortedRange:options:usingComparator:", v6, 0, objc_msgSend(v7, "count"), 1536, self->_comparator);

  return v8;
}

- (unint64_t)_indexForObject:(id)a3 buffer:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "indexOfObject:inSortedRange:options:usingComparator:", v6, 0, objc_msgSend(v7, "count"), 512, self->_comparator);

  return v8;
}

- (id)comparator
{
  return self->_comparator;
}

@end
