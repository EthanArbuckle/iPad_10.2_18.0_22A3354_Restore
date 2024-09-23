@implementation BMIndirectHeap

- (unint64_t)count
{
  return self->_count;
}

- (void)reset
{
  self->_count = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_isAscending, 0);
}

- (void)dealloc
{
  unint64_t *array;
  objc_super v4;

  array = self->_array;
  if (array)
  {
    free(array);
    self->_array = 0;
  }
  self->_count = 0;
  self->_size = 0;
  v4.receiver = self;
  v4.super_class = (Class)BMIndirectHeap;
  -[BMIndirectHeap dealloc](&v4, sel_dealloc);
}

- (void)add:(unint64_t)a3
{
  unint64_t count;
  unint64_t v5;
  unint64_t v6;
  unint64_t *array;
  unint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  _QWORD block[5];
  uint8_t buf[8];
  uint8_t *v13;
  uint64_t v14;
  char v15;

  count = self->_count;
  if (count >= self->_size)
  {
    __biome_log_for_category(1);
    v9 = objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    v13 = buf;
    v14 = 0x2020000000;
    v15 = 16;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __22__BMIndirectHeap_add___block_invoke;
    block[3] = &unk_1E5E3C680;
    block[4] = buf;
    if (add__onceToken != -1)
      dispatch_once(&add__onceToken, block);
    v10 = v13[24];
    _Block_object_dispose(buf, 8);
    if (os_log_type_enabled(v9, v10))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AEB31000, v9, v10, "BMIndirectHeap add: full", buf, 2u);
    }

  }
  else
  {
    self->_count = count + 1;
    self->_array[count] = a3;
    if (count)
    {
      do
      {
        v5 = count - 1;
        v6 = (count - 1) >> 1;
        if (((*((uint64_t (**)(void))self->_isAscending + 2))() & 1) != 0)
          break;
        array = self->_array;
        v8 = array[count];
        array[count] = array[v6];
        array[v6] = v8;
        count = (count - 1) >> 1;
      }
      while (v5 > 1);
    }
  }
}

- (BMIndirectHeap)initWithHeapSize:(unint64_t)a3 isAscending:(id)a4
{
  id v7;
  BMIndirectHeap *v8;
  BMIndirectHeap *v9;
  uint64_t v10;
  id isAscending;
  void *v13;
  objc_super v14;

  v7 = a4;
  if (a3 >= 0x1FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMIndirectHeap.m"), 18, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("size < NSUIntegerMax / sizeof(NSUInteger)"));

  }
  v14.receiver = self;
  v14.super_class = (Class)BMIndirectHeap;
  v8 = -[BMIndirectHeap init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_size = a3;
    v8->_array = (unint64_t *)malloc_type_malloc(8 * a3, 0x100004000313F17uLL);
    v9->_count = 0;
    v10 = MEMORY[0x1AF456B84](v7);
    isAscending = v9->_isAscending;
    v9->_isAscending = (id)v10;

  }
  return v9;
}

- (unint64_t)pop
{
  unint64_t count;
  unint64_t *array;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  unint64_t *v14;
  unint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  _QWORD block[5];
  uint8_t buf[8];
  uint8_t *v21;
  uint64_t v22;
  char v23;

  count = self->_count;
  if (count)
  {
    array = self->_array;
    v5 = *array;
    v6 = count - 1;
    self->_count = v6;
    *array = array[v6];
    v7 = self->_count;
    if (v7 >= 2)
    {
      v8 = 0;
      v9 = 0;
      v10 = 1;
      while (1)
      {
        v11 = v8 + 2;
        if (v8 + 2 < v7 && !(*((unsigned int (**)(void))self->_isAscending + 2))())
          goto LABEL_9;
        if (!(*((unsigned int (**)(void))self->_isAscending + 2))())
          break;
        v12 = self->_array;
        v13 = v12[v10];
        v12[v10] = v12[v9];
        v12[v9] = v13;
LABEL_11:
        v9 = v10;
        v8 = 2 * v10;
        v10 = (2 * v10) | 1;
        v7 = self->_count;
        if (v10 >= v7)
          return v5;
      }
      if (v11 >= v7)
        return v5;
LABEL_9:
      if (((*((uint64_t (**)(void))self->_isAscending + 2))() & 1) != 0)
        return v5;
      v14 = self->_array;
      v15 = v14[v11];
      v14[v11] = v14[v9];
      v14[v9] = v15;
      v10 = v11;
      goto LABEL_11;
    }
  }
  else
  {
    __biome_log_for_category(1);
    v16 = objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    v21 = buf;
    v22 = 0x2020000000;
    v23 = 16;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __21__BMIndirectHeap_pop__block_invoke;
    block[3] = &unk_1E5E3C680;
    block[4] = buf;
    if (pop_onceToken != -1)
      dispatch_once(&pop_onceToken, block);
    v17 = v21[24];
    _Block_object_dispose(buf, 8);
    if (os_log_type_enabled(v16, v17))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AEB31000, v16, v17, "BMIndirectHeap pop: empty", buf, 2u);
    }

    return -1;
  }
  return v5;
}

- (id)description
{
  id v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x1E0CB3940]);
  v4 = v3;
  if (self->_count)
  {
    v5 = 0;
    do
    {
      objc_msgSend(v4, "stringByAppendingFormat:", CFSTR("%lu "), self->_array[v5]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      ++v5;
      v4 = v6;
    }
    while (v5 < self->_count);
  }
  else
  {
    v6 = v3;
  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("size:%lu count:%lu array: %@"), self->_size, self->_count, v6);

  return v7;
}

uint64_t __22__BMIndirectHeap_add___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

- (unint64_t)top
{
  if (self->_count)
    return *self->_array;
  else
    return -1;
}

uint64_t __21__BMIndirectHeap_pop__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

- (unint64_t)array
{
  return self->_array;
}

- (void)setArray:(unint64_t *)a3
{
  self->_array = a3;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

- (id)isAscending
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setIsAscending:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

@end
