@implementation MPSGraphListData

- (id)mpsndarray
{
  __assert_rtn("-[MPSGraphListData mpsndarray]", "MPSGraphList.mm", 36, "0 && \"Can't access mpsndarray of a MPSGraphListData\");
}

- (MPSGraphListData)initWithDevice:(id)a3 list:(id)a4 maxSize:(int64_t)a5 elementType:(id)a6
{
  id v10;
  id v11;
  id v12;
  MPSGraphListData *v13;
  uint64_t v14;
  NSMutableArray *list;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = -[MPSGraphTensorData initEmptyWithShape:dataType:device:](self, "initEmptyWithShape:dataType:device:", MEMORY[0x1E0C9AA60], 268435488, v10);
  v14 = objc_msgSend(v11, "mutableCopy");
  list = v13->_list;
  v13->_list = (NSMutableArray *)v14;

  v13->_maxSize = a5;
  objc_storeStrong((id *)&v13->_elementType, a6);
  if (v13->_maxSize != -1 && (unint64_t)objc_msgSend(v11, "count") > v13->_maxSize)
    __assert_rtn("-[MPSGraphListData initWithDevice:list:maxSize:elementType:]", "MPSGraphList.mm", 50, "_maxSize == -1 || list.count <= _maxSize");

  return v13;
}

- (id)initEmptyListWithDevice:(id)a3 maxSize:(int64_t)a4 elementType:(id)a5
{
  return -[MPSGraphListData initWithDevice:list:maxSize:elementType:](self, "initWithDevice:list:maxSize:elementType:", a3, MEMORY[0x1E0C9AA60], a4, a5);
}

- (void)pushBackElement:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_maxSize != -1 && (unint64_t)-[NSMutableArray count](self->_list, "count") >= self->_maxSize)
    __assert_rtn("-[MPSGraphListData pushBackElement:]", "MPSGraphList.mm", 66, "_maxSize == -1 || _list.count < _maxSize");
  -[NSMutableArray addObject:](self->_list, "addObject:", v4);

}

- (id)popBackElement
{
  void *v3;

  if (!-[NSMutableArray count](self->_list, "count"))
    __assert_rtn("-[MPSGraphListData popBackElement]", "MPSGraphList.mm", 72, "_list.count != 0");
  -[NSMutableArray lastObject](self->_list, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeLastObject](self->_list, "removeLastObject");
  return v3;
}

- (int64_t)maxSize
{
  return self->_maxSize;
}

- (id)elementType
{
  return self->_elementType;
}

- (id)list
{
  return self->_list;
}

- (id)clonedList
{
  MPSGraphListData *v3;
  void *v4;
  MPSGraphListData *v5;

  v3 = [MPSGraphListData alloc];
  -[MPSGraphTensorData device](self, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MPSGraphListData initWithDevice:list:maxSize:elementType:](v3, "initWithDevice:list:maxSize:elementType:", v4, self->_list, self->_maxSize, self->_elementType);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elementType, 0);
  objc_storeStrong((id *)&self->_list, 0);
}

@end
