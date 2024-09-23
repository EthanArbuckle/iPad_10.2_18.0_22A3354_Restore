@implementation ICDocCamRectangleResultsQueue

- (ICDocCamRectangleResultsQueue)init
{
  ICDocCamRectangleResultsQueue *v2;
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICDocCamRectangleResultsQueue;
  v2 = -[ICDocCamRectangleResultsQueue init](&v5, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[ICDocCamRectangleResultsQueue setArray:](v2, "setArray:", v3);

  }
  return v2;
}

- (void)enqueue:(id)a3
{
  ICDocCamRectangleResultsQueue *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[ICDocCamRectangleResultsQueue array](v4, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

  objc_sync_exit(v4);
}

- (id)dequeue
{
  ICDocCamRectangleResultsQueue *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v2 = self;
  objc_sync_enter(v2);
  -[ICDocCamRectangleResultsQueue array](v2, "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[ICDocCamRectangleResultsQueue peek](v2, "peek");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamRectangleResultsQueue array](v2, "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectAtIndex:", 0);

  }
  else
  {
    v5 = 0;
  }
  objc_sync_exit(v2);

  return v5;
}

- (void)clear
{
  void *v2;
  ICDocCamRectangleResultsQueue *obj;

  obj = self;
  objc_sync_enter(obj);
  -[ICDocCamRectangleResultsQueue array](obj, "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

  objc_sync_exit(obj);
}

- (id)peek
{
  ICDocCamRectangleResultsQueue *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = self;
  objc_sync_enter(v2);
  -[ICDocCamRectangleResultsQueue array](v2, "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[ICDocCamRectangleResultsQueue array](v2, "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  v7 = (void *)objc_msgSend(v6, "copy");

  objc_sync_exit(v2);
  return v7;
}

- (id)peek:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  -[ICDocCamRectangleResultsQueue array](self, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6
    && (-[ICDocCamRectangleResultsQueue array](self, "array"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "count"),
        v7,
        v8 > a3))
  {
    -[ICDocCamRectangleResultsQueue array](self, "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndex:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  v11 = (void *)objc_msgSend(v10, "copy");

  return v11;
}

- (id)peekTail
{
  ICDocCamRectangleResultsQueue *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = self;
  objc_sync_enter(v2);
  -[ICDocCamRectangleResultsQueue array](v2, "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[ICDocCamRectangleResultsQueue array](v2, "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return v7;
}

- (void)apply:(id)a3 atIndex:(int64_t)a4
{
  ICDocCamRectangleResultsQueue *v6;
  void *v7;
  void *v8;
  void (**v9)(id, void *);

  v9 = (void (**)(id, void *))a3;
  v6 = self;
  objc_sync_enter(v6);
  -[ICDocCamRectangleResultsQueue array](v6, "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9[2](v9, v8);
  objc_sync_exit(v6);

}

- (void)apply:(id)a3 fromIndex:(int64_t)a4 toIndex:(unint64_t)a5
{
  ICDocCamRectangleResultsQueue *v8;
  int64_t v9;
  void *v10;
  void *v11;
  char v12;
  char v14;
  void *v15;
  void *v16;
  char v17;
  char v18;
  uint64_t (**v19)(id, void *);

  v19 = (uint64_t (**)(id, void *))a3;
  v8 = self;
  objc_sync_enter(v8);
  if (a4 <= a5)
  {
    do
    {
      -[ICDocCamRectangleResultsQueue array](v8, "array");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectAtIndex:", a4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = v19[2](v19, v16);
      if (++a4 <= a5)
        v18 = v17;
      else
        v18 = 0;
    }
    while ((v18 & 1) != 0);
  }
  else if ((int)a4 >= (int)a5)
  {
    a4 = (int)a4;
    v9 = (int)a5;
    do
    {
      -[ICDocCamRectangleResultsQueue array](v8, "array");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndex:", a4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = v19[2](v19, v11);
      if (a4-- <= v9)
        v14 = 0;
      else
        v14 = v12;
    }
    while ((v14 & 1) != 0);
  }
  objc_sync_exit(v8);

}

- (int64_t)size
{
  ICDocCamRectangleResultsQueue *v2;
  void *v3;
  int64_t v4;

  v2 = self;
  objc_sync_enter(v2);
  -[ICDocCamRectangleResultsQueue array](v2, "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  objc_sync_exit(v2);
  return v4;
}

- (NSMutableArray)array
{
  return self->_array;
}

- (void)setArray:(id)a3
{
  objc_storeStrong((id *)&self->_array, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_array, 0);
}

@end
