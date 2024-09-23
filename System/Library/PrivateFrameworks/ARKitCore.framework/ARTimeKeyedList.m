@implementation ARTimeKeyedList

- (ARTimeKeyedList)initWithMaxSize:(unint64_t)a3
{
  ARTimeKeyedList *v4;
  ARTimeKeyedList *v5;
  uint64_t v6;
  NSMutableArray *times;
  uint64_t v8;
  NSMutableArray *objects;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ARTimeKeyedList;
  v4 = -[ARTimeKeyedList init](&v11, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_maxSize = a3;
    v6 = objc_opt_new();
    times = v5->_times;
    v5->_times = (NSMutableArray *)v6;

    v8 = objc_opt_new();
    objects = v5->_objects;
    v5->_objects = (NSMutableArray *)v8;

  }
  return v5;
}

- (ARTimeKeyedList)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[ARTimeKeyedList init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("Don't call %@."), v5);

  return -[ARTimeKeyedList initWithMaxSize:](self, "initWithMaxSize:", 0);
}

- (unint64_t)insertionIndexForTime:(id)a3
{
  NSMutableArray *times;
  id v4;
  unint64_t v5;

  times = self->_times;
  v4 = a3;
  v5 = -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](times, "indexOfObject:inSortedRange:options:usingComparator:", v4, 0, -[NSMutableArray count](times, "count"), 1024, &__block_literal_global_103);

  return v5;
}

uint64_t __41__ARTimeKeyedList_insertionIndexForTime___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (id)nearestObjectForTime:(double)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  id v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ARTimeKeyedList insertionIndexForTime:](self, "insertionIndexForTime:", v5);
  if (v6)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_times, "objectAtIndexedSubscript:", v6 - 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    v9 = v8;

    -[NSMutableArray objectAtIndexedSubscript:](self->_objects, "objectAtIndexedSubscript:", v6 - 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
    v9 = -1.79769313e308;
  }
  if (v6 < -[NSMutableArray count](self->_times, "count")
    && (-[NSMutableArray objectAtIndexedSubscript:](self->_times, "objectAtIndexedSubscript:", v6),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v11, "doubleValue"),
        v13 = v12,
        v11,
        v13 - a3 < a3 - v9))
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_objects, "objectAtIndexedSubscript:", v6, v13 - a3);
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = v10;
  }
  v15 = v14;

  return v15;
}

- (void)appendObject:(id)a3 forTime:(double)a4
{
  void *v6;
  id v7;
  unint64_t v8;
  id v9;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a3;
  objc_msgSend(v6, "numberWithDouble:", a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v8 = -[ARTimeKeyedList insertionIndexForTime:](self, "insertionIndexForTime:", v9);
  -[NSMutableArray insertObject:atIndex:](self->_times, "insertObject:atIndex:", v9, v8);
  -[NSMutableArray insertObject:atIndex:](self->_objects, "insertObject:atIndex:", v7, v8);

  if (-[NSMutableArray count](self->_times, "count") > self->_maxSize)
  {
    -[NSMutableArray removeObjectAtIndex:](self->_times, "removeObjectAtIndex:", 0);
    -[NSMutableArray removeObjectAtIndex:](self->_objects, "removeObjectAtIndex:", 0);
  }

}

- (void)clear
{
  -[NSMutableArray removeAllObjects](self->_times, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_objects, "removeAllObjects");
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v7.receiver = self;
  v7.super_class = (Class)ARTimeKeyedList;
  -[ARTimeKeyedList description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ MaxSize: %lu\n"), v4, self->_maxSize);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "appendFormat:", CFSTR("Times: %@\n"), self->_times);
  objc_msgSend(v5, "appendFormat:", CFSTR("Objects: %@\n"), self->_objects);
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objects, 0);
  objc_storeStrong((id *)&self->_times, 0);
}

@end
