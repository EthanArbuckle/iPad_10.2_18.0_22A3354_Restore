@implementation _CNPriorityQueueingStrategy

- (_CNPriorityQueueingStrategy)initWithComparator:(id)a3
{
  id v4;
  _CNPriorityQueueingStrategy *v5;
  uint64_t v6;
  id priorityComparator;
  _CNPriorityQueueingStrategy *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CNPriorityQueueingStrategy;
  v5 = -[_CNPriorityQueueingStrategy init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    priorityComparator = v5->_priorityComparator;
    v5->_priorityComparator = (id)v6;

    v8 = v5;
  }

  return v5;
}

- (void)enqueueObject:(id)a3 buffer:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "insertObject:atIndex:", v7, -[_CNPriorityQueueingStrategy _insertionIndexForObject:buffer:](self, "_insertionIndexForObject:buffer:", v7, v6));

}

- (unint64_t)_insertionIndexForObject:(id)a3 buffer:(id)a4
{
  id v6;
  id v7;
  id v8;
  unint64_t v9;
  uint64_t v11;
  uint64_t v12;
  BOOL (*v13)(uint64_t, void *);
  void *v14;
  _CNPriorityQueueingStrategy *v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __63___CNPriorityQueueingStrategy__insertionIndexForObject_buffer___block_invoke;
  v14 = &unk_1E29B91C8;
  v15 = self;
  v16 = v6;
  v8 = v6;
  v9 = objc_msgSend(v7, "indexOfObjectPassingTest:", &v11);
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    v9 = objc_msgSend(v7, "count", v11, v12, v13, v14, v15, v16);

  return v9;
}

- (id)priorityComparator
{
  return self->_priorityComparator;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_priorityComparator, 0);
}

@end
