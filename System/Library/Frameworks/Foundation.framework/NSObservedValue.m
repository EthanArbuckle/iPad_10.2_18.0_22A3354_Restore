@implementation NSObservedValue

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSObservedValue;
  -[NSObservedValue dealloc](&v3, sel_dealloc);
}

- (void)setValue:(id)a3
{
  id contents;

  self->_tag = 1;
  contents = self->_contents;
  if (contents != a3)
  {

    self->_contents = a3;
  }
}

- (id)value
{
  if (self->_tag == 1)
    return self->_contents;
  else
    return 0;
}

- (void)setError:(id)a3
{
  id contents;

  self->_tag = 2;
  contents = self->_contents;
  if (contents != a3)
  {

    self->_contents = a3;
  }
}

- (NSError)error
{
  if (self->_tag == 2)
    return (NSError *)self->_contents;
  else
    return 0;
}

- (void)setFinished:(BOOL)a3
{
  self->_tag = 3;

  self->_contents = (id)*MEMORY[0x1E0C9AE50];
}

- (BOOL)finished
{
  return self->_tag == 3;
}

- (BOOL)_isToManyChangeInformation
{
  return objc_msgSend(self->_contents, "_isToManyChangeInformation");
}

- (id)debugDescription
{
  int tag;
  const __CFString *v4;
  uint64_t v6;

  tag = self->_tag;
  if (tag == 2)
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Error %@ in observed value %p"), self->_contents, self);
  if (tag != 1)
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid observed value: %p"), self, v6);
  if (-[NSObservedValue _isToManyChangeInformation](self, "_isToManyChangeInformation"))
    v4 = CFSTR("To-many collection changes %@ in observed value %p");
  else
    v4 = CFSTR("Value %@ in observed value wrapper %p");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, self->_contents, self);
}

- (id)copyToHeap
{
  _DWORD *Instance;

  if (qword_1ECD09CB0 != -1)
    dispatch_once(&qword_1ECD09CB0, &__block_literal_global_9);
  Instance = class_createInstance((Class)qword_1ECD09CA8, 0);
  Instance[6] = self->_tag;
  *((_QWORD *)Instance + 1) = self->_contents;
  return Instance;
}

uint64_t __29__NSObservedValue_copyToHeap__block_invoke()
{
  uint64_t result;

  result = objc_opt_class();
  qword_1ECD09CA8 = result;
  return result;
}

@end
