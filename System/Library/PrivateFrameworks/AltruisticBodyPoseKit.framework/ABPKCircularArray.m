@implementation ABPKCircularArray

- (ABPKCircularArray)initWithCapacity:(int64_t)a3
{
  ABPKCircularArray *v4;
  ABPKCircularArray *v5;
  int64_t v6;
  uint64_t v7;
  NSMutableArray *array;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ABPKCircularArray;
  v4 = -[ABPKCircularArray init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    if (a3 <= 1)
      v6 = 1;
    else
      v6 = a3;
    v4->_capacity = v6;
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v4->_capacity);
    array = v5->_array;
    v5->_array = (NSMutableArray *)v7;

  }
  return v5;
}

- (NSArray)contents
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_array, "copy");
}

- (void)add:(id)a3
{
  id v4;
  NSObject *v5;
  int64_t capacity;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  int v17;
  int64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  __ABPKLogSharedInstance();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    capacity = self->_capacity;
    v17 = 134217984;
    v18 = capacity;
    _os_log_impl(&dword_210836000, v5, OS_LOG_TYPE_DEBUG, " Circular buffer capacity: %lu ", (uint8_t *)&v17, 0xCu);
  }

  __ABPKLogSharedInstance();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = -[NSMutableArray count](self->_array, "count");
    v17 = 134217984;
    v18 = v8;
    _os_log_impl(&dword_210836000, v7, OS_LOG_TYPE_DEBUG, " Circular buffer count: %lu ", (uint8_t *)&v17, 0xCu);
  }

  v9 = -[NSMutableArray count](self->_array, "count");
  v10 = self->_capacity;
  __ABPKLogSharedInstance();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
  if (v9 == v10)
  {
    if (v12)
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_210836000, v11, OS_LOG_TYPE_DEBUG, " Circular buffer full ", (uint8_t *)&v17, 2u);
    }

    __ABPKLogSharedInstance();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_210836000, v13, OS_LOG_TYPE_DEBUG, " Removing first element ", (uint8_t *)&v17, 2u);
    }

    -[NSMutableArray removeObjectAtIndex:](self->_array, "removeObjectAtIndex:", 0);
    __ABPKLogSharedInstance();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v14 = -[NSMutableArray count](self->_array, "count");
      v17 = 134217984;
      v18 = v14;
      v15 = " Insert new element at the index: %lu ";
LABEL_14:
      _os_log_impl(&dword_210836000, v11, OS_LOG_TYPE_DEBUG, v15, (uint8_t *)&v17, 0xCu);
    }
  }
  else if (v12)
  {
    v16 = -[NSMutableArray count](self->_array, "count");
    v17 = 134217984;
    v18 = v16;
    v15 = " Inserting element to the circular buffer: %lu ";
    goto LABEL_14;
  }

  -[NSMutableArray addObject:](self->_array, "addObject:", v4);
}

- (int64_t)count
{
  return -[NSMutableArray count](self->_array, "count");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_array, 0);
}

@end
