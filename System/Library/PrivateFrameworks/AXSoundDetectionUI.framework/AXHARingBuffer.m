@implementation AXHARingBuffer

- (AXHARingBuffer)initWithCount:(unint64_t)a3
{
  AXHARingBuffer *v4;
  AXHARingBuffer *v5;
  uint64_t v6;
  NSMutableArray *bufferArray;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AXHARingBuffer;
  v4 = -[AXHARingBuffer init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_size = a3;
    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v4->_size);
    bufferArray = v5->_bufferArray;
    v5->_bufferArray = (NSMutableArray *)v6;

    -[AXHARingBuffer reset](v5, "reset");
  }
  return v5;
}

- (unint64_t)count
{
  return self->_size;
}

- (void)addObject:(id)a3
{
  unint64_t head;
  NSMutableArray *bufferArray;
  id v6;
  unint64_t v7;
  NSMutableArray *v8;

  head = self->_head;
  bufferArray = self->_bufferArray;
  v6 = a3;
  v7 = -[NSMutableArray count](bufferArray, "count");
  v8 = self->_bufferArray;
  if (head >= v7)
    -[NSMutableArray addObject:](v8, "addObject:", v6);
  else
    -[NSMutableArray replaceObjectAtIndex:withObject:](v8, "replaceObjectAtIndex:withObject:", self->_head, v6);

  self->_head = (self->_head + 1) % self->_size;
}

- (id)content
{
  unint64_t v3;
  NSMutableArray *bufferArray;
  void *v5;
  void *v6;
  void *v7;
  NSMutableArray *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = -[NSMutableArray count](self->_bufferArray, "count");
  bufferArray = self->_bufferArray;
  if (v3 >= self->_size)
  {
    objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", 0, self->_head);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray objectsAtIndexes:](bufferArray, "objectsAtIndexes:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = self->_bufferArray;
    objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", self->_head, self->_size - self->_head);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray objectsAtIndexes:](v8, "objectsAtIndexes:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "arrayByAddingObjectsFromArray:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v11, "copy");

  }
  else
  {
    v5 = (void *)-[NSMutableArray copy](self->_bufferArray, "copy");
  }
  return v5;
}

- (void)reset
{
  NSMutableArray *v3;
  NSMutableArray *bufferArray;

  v3 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", self->_size);
  bufferArray = self->_bufferArray;
  self->_bufferArray = v3;

  self->_head = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bufferArray, 0);
}

@end
