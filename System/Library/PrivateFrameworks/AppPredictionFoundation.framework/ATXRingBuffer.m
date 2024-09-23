@implementation ATXRingBuffer

- (ATXRingBuffer)initWithMaxSize:(unint64_t)a3
{
  ATXRingBuffer *v4;
  ATXRingBuffer *v5;
  uint64_t v6;
  NSMutableArray *bufferArray;
  ATXRingBuffer *v8;
  objc_super v10;

  if (a3)
  {
    v10.receiver = self;
    v10.super_class = (Class)ATXRingBuffer;
    v4 = -[ATXRingBuffer init](&v10, sel_init);
    v5 = v4;
    if (v4)
    {
      v4->_maxSize = a3;
      v6 = objc_opt_new();
      bufferArray = v5->_bufferArray;
      v5->_bufferArray = (NSMutableArray *)v6;

      v5->_readStartIndex = 0;
    }
    self = v5;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)addObject:(id)a3
{
  NSMutableArray *bufferArray;
  unint64_t v5;
  NSMutableArray *v6;
  id v7;

  bufferArray = self->_bufferArray;
  v7 = a3;
  v5 = -[NSMutableArray count](bufferArray, "count");
  v6 = self->_bufferArray;
  if (v5 >= self->_maxSize)
  {
    -[NSMutableArray setObject:atIndexedSubscript:](v6, "setObject:atIndexedSubscript:", v7, self->_readStartIndex);

    self->_readStartIndex = (self->_readStartIndex + 1) % self->_maxSize;
  }
  else
  {
    -[NSMutableArray addObject:](v6, "addObject:", v7);

  }
}

- (id)toArray
{
  unint64_t readStartIndex;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  readStartIndex = self->_readStartIndex;
  v4 = -[NSMutableArray count](self->_bufferArray, "count");
  v5 = self->_readStartIndex;
  -[NSMutableArray subarrayWithRange:](self->_bufferArray, "subarrayWithRange:", readStartIndex, v4 - v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray subarrayWithRange:](self->_bufferArray, "subarrayWithRange:", 0, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bufferArray, 0);
}

@end
