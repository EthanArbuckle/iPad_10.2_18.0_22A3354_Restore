@implementation CBFloatArray

- (float)get:(unint64_t)a3
{
  if (a3 >= self->_count)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99858], 0));
  return self->_data[a3];
}

- (CBFloatArray)initWithValues:(float *)a3 andCount:(unint64_t)a4
{
  CBFloatArray *v6;

  v6 = -[CBFloatArray initWithCount:](self, "initWithCount:", a4, a4);
  if (v6)
    memcpy(v6->_data, a3, v6->_size);
  return v6;
}

- (CBFloatArray)initWithCount:(unint64_t)a3
{
  float *v3;
  objc_super v5;
  unint64_t v6;
  SEL v7;
  CBFloatArray *v8;

  v8 = self;
  v7 = a2;
  v6 = a3;
  v5.receiver = self;
  v5.super_class = (Class)CBFloatArray;
  v8 = -[CBFloatArray init](&v5, sel_init);
  if (v8)
  {
    v8->_size = 4 * v6;
    v8->_count = v6;
    v3 = (float *)malloc_type_malloc(v8->_size, 0x220116FCuLL);
    v8->_data = v3;
    if (!v8->_data)
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], 0));
  }
  return v8;
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  CBFloatArray *v4;

  v4 = self;
  v3 = a2;
  if (self->_data)
  {
    free(v4->_data);
    v4->_data = 0;
  }
  v2.receiver = v4;
  v2.super_class = (Class)CBFloatArray;
  -[CBFloatArray dealloc](&v2, sel_dealloc);
}

- (const)data
{
  return -[CBFloatArray at:](self, "at:", 0, a2, self);
}

- (float)dataCopy
{
  void *__dst;

  __dst = malloc_type_malloc(self->_size, 0xEAC70105uLL);
  if (__dst)
    memcpy(__dst, self->_data, self->_size);
  return (float *)__dst;
}

- (const)at:(unint64_t)a3
{
  if (a3 >= self->_count)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99858], 0));
  return &self->_data[a3];
}

- (float)mutableData
{
  if (!self->_data)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], 0));
  return self->_data;
}

- (unint64_t)count
{
  return self->_count;
}

- (id)description
{
  void *context;
  void *v4;

  context = (void *)MEMORY[0x1B5E4A8B0]();
  v4 = (void *)objc_msgSend(-[CBFloatArray copyNSArray](self, "copyNSArray"), "description");
  objc_autoreleasePoolPop(context);
  return v4;
}

- (id)copyNSArray
{
  id v3;
  id v4;
  unint64_t i;
  void *v6;

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", self->_count);
  for (i = 0; i < self->_count - 1; ++i)
  {
    v3 = objc_alloc(MEMORY[0x1E0CB37E8]);
    -[CBFloatArray get:](self, "get:", i);
    v4 = (id)objc_msgSend(v3, "initWithFloat:");
    objc_msgSend(v6, "setObject:atIndexedSubscript:", v4, i);

  }
  return v6;
}

@end
