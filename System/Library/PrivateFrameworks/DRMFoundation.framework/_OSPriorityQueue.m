@implementation _OSPriorityQueue

- (_OSPriorityQueue)init
{
  _OSPriorityQueue *v2;
  uint64_t v3;
  NSMutableDictionary *objects;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_OSPriorityQueue;
  v2 = -[_OSPriorityQueue init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    objects = v2->_objects;
    v2->_objects = (NSMutableDictionary *)v3;

  }
  return v2;
}

+ (id)priorityQueue
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (void)addObject:(id)a3 withPriority:(unint64_t)a4
{
  NSMutableDictionary *v6;
  void *v7;
  void *v8;
  NSNumber *highestPriority;
  NSNumber *lowestPriority;
  id v11;

  v11 = a3;
  v6 = self->_objects;
  objc_sync_enter(v6);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_objects, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_objects, "setObject:forKeyedSubscript:", v8, v7);
  }
  objc_msgSend(v8, "addObject:", v11);
  highestPriority = self->_highestPriority;
  if (!highestPriority || -[NSNumber compare:](highestPriority, "compare:", v7) == NSOrderedAscending)
    objc_storeStrong((id *)&self->_highestPriority, v7);
  lowestPriority = self->_lowestPriority;
  if (!lowestPriority || -[NSNumber compare:](lowestPriority, "compare:", v7) == NSOrderedDescending)
    objc_storeStrong((id *)&self->_lowestPriority, v7);
  ++self->_count;

  objc_sync_exit(v6);
}

- (id)popFirst
{
  NSMutableDictionary *v3;
  void *v4;
  id v5;
  NSMutableDictionary *objects;
  void *v7;
  NSMutableDictionary *v8;
  void *v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v3 = self->_objects;
  objc_sync_enter(v3);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_objects, "objectForKeyedSubscript:", self->_highestPriority);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "firstObject");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObjectAtIndex:", 0);
    --self->_count;
  }
  else
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy_;
    v22 = __Block_byref_object_dispose_;
    v23 = 0;
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy_;
    v16 = __Block_byref_object_dispose_;
    v17 = 0;
    objects = self->_objects;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __28___OSPriorityQueue_popFirst__block_invoke;
    v11[3] = &unk_24E4775B0;
    v11[4] = &v18;
    v11[5] = &v12;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](objects, "enumerateKeysAndObjectsUsingBlock:", v11);
    v7 = (void *)v19[5];
    if (v7)
    {
      objc_storeStrong((id *)&self->_highestPriority, (id)v13[5]);
      v8 = self->_objects;
      --self->_count;
      -[NSMutableDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", self->_highestPriority);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeObjectAtIndex:", 0);

      v7 = (void *)v19[5];
    }
    v5 = v7;
    _Block_object_dispose(&v12, 8);

    _Block_object_dispose(&v18, 8);
  }

  objc_sync_exit(v3);
  return v5;
}

- (id)popLast
{
  NSMutableDictionary *v3;
  void *v4;
  id v5;
  NSMutableDictionary *objects;
  void *v7;
  NSMutableDictionary *v8;
  void *v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v3 = self->_objects;
  objc_sync_enter(v3);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_objects, "objectForKeyedSubscript:", self->_lowestPriority);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "lastObject");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeLastObject");
    --self->_count;
  }
  else
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy_;
    v22 = __Block_byref_object_dispose_;
    v23 = 0;
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy_;
    v16 = __Block_byref_object_dispose_;
    v17 = 0;
    objects = self->_objects;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __27___OSPriorityQueue_popLast__block_invoke;
    v11[3] = &unk_24E4775B0;
    v11[4] = &v18;
    v11[5] = &v12;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](objects, "enumerateKeysAndObjectsUsingBlock:", v11);
    v7 = (void *)v19[5];
    if (v7)
    {
      objc_storeStrong((id *)&self->_lowestPriority, (id)v13[5]);
      v8 = self->_objects;
      --self->_count;
      -[NSMutableDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", self->_lowestPriority);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeLastObject");

      v7 = (void *)v19[5];
    }
    v5 = v7;
    _Block_object_dispose(&v12, 8);

    _Block_object_dispose(&v18, 8);
  }

  objc_sync_exit(v3);
  return v5;
}

- (void)removeObject:(id)a3 atPriority:(unint64_t)a4
{
  NSMutableDictionary *v6;
  NSMutableDictionary *objects;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = self->_objects;
  objc_sync_enter(v6);
  objects = self->_objects;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](objects, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "containsObject:", v10))
  {
    --self->_count;
    objc_msgSend(v9, "removeObject:", v10);
  }

  objc_sync_exit(v6);
}

- (id)allObjects
{
  void *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *objects;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self->_objects;
  objc_sync_enter(v4);
  objects = self->_objects;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __30___OSPriorityQueue_allObjects__block_invoke;
  v9[3] = &unk_24E4775D8;
  v6 = v3;
  v10 = v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](objects, "enumerateKeysAndObjectsUsingBlock:", v9);

  objc_sync_exit(v4);
  v7 = (void *)objc_msgSend(v6, "copy");

  return v7;
}

- (id)description
{
  NSMutableDictionary *v3;
  void *v4;
  void *v5;
  NSNumber *highestPriority;
  NSNumber *lowestPriority;
  void *v8;
  void *v9;

  v3 = self->_objects;
  objc_sync_enter(v3);
  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_count);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  lowestPriority = self->_lowestPriority;
  highestPriority = self->_highestPriority;
  -[NSMutableDictionary description](self->_objects, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<_OSPriority Queue: Count=%@, High=%@, Low=%@, Items=%@>"), v5, highestPriority, lowestPriority, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v3);
  return v9;
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (NSMutableDictionary)objects
{
  return self->_objects;
}

- (void)setObjects:(id)a3
{
  objc_storeStrong((id *)&self->_objects, a3);
}

- (NSNumber)lowestPriority
{
  return self->_lowestPriority;
}

- (void)setLowestPriority:(id)a3
{
  objc_storeStrong((id *)&self->_lowestPriority, a3);
}

- (NSNumber)highestPriority
{
  return self->_highestPriority;
}

- (void)setHighestPriority:(id)a3
{
  objc_storeStrong((id *)&self->_highestPriority, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highestPriority, 0);
  objc_storeStrong((id *)&self->_lowestPriority, 0);
  objc_storeStrong((id *)&self->_objects, 0);
}

@end
