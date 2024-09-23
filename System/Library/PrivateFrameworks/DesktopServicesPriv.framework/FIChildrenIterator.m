@implementation FIChildrenIterator

- (FIChildrenIterator)initWithChildren:(id)a3 fullyPopulated:(BOOL)a4 options:(unsigned int)a5
{
  char v5;
  id v8;
  FIChildrenIterator *v9;
  objc_super v11;

  v5 = a5;
  v8 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FIChildrenIterator;
  v9 = -[FIChildrenIterator init](&v11, sel_init);
  -[FIChildrenIterator setChildren:](v9, "setChildren:", v8);
  v9->_includeInvisible = (v5 & 4) == 0;
  v9->_fullyPopulated = a4;

  return v9;
}

- (id)first
{
  self->_index = 0;
  return -[FIChildrenIterator next](self, "next");
}

- (id)next
{
  id v3;
  unint64_t index;
  NSArray *children;
  void *v6;
  void *v7;

  v3 = 0;
  while (1)
  {
    index = self->_index;
    if (index >= -[NSArray count](self->_children, "count"))
      break;
    children = self->_children;
    ++self->_index;
    -[NSArray objectAtIndexedSubscript:](children, "objectAtIndexedSubscript:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!self->_includeInvisible)
    {
      v3 = v6;
      if (!objc_msgSend(v6, "isVisible"))
        continue;
    }
    v3 = v6;
    v7 = v3;
    goto LABEL_7;
  }
  v7 = 0;
LABEL_7:

  return v7;
}

- (BOOL)fullyPopulated
{
  return self->_fullyPopulated;
}

- (unint64_t)estimatedSize
{
  return -[NSArray count](self->_children, "count");
}

- (NSArray)children
{
  return self->_children;
}

- (void)setChildren:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)includeInvisible
{
  return self->_includeInvisible;
}

- (unint64_t)index
{
  return self->_index;
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_children, 0);
}

@end
