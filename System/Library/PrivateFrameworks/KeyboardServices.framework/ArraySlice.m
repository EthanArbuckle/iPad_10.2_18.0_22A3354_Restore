@implementation ArraySlice

- (ArraySlice)initWithArray:(id)a3 offset:(unint64_t)a4 count:(unint64_t)a5
{
  id v9;
  ArraySlice *v10;
  ArraySlice *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ArraySlice;
  v10 = -[ArraySlice init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_array, a3);
    v11->_offset = a4;
    v11->_count = a5;
  }

  return v11;
}

- (unint64_t)count
{
  return self->_count;
}

- (id)objectAtIndex:(unint64_t)a3
{
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  count = self->_count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x24BDBCE88];
    v7 = *MEMORY[0x24BDBCB78];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Attempt to index beyond end of array. Count of items is %lu, index is %lu"), count, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "raise");
  }
  return -[NSArray objectAtIndexedSubscript:](self->_array, "objectAtIndexedSubscript:", self->_offset + a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_array, 0);
}

@end
