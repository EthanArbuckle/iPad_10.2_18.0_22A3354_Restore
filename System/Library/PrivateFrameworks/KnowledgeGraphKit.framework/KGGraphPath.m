@implementation KGGraphPath

- (KGGraphPath)initWithSourceNodeIdentifier:(unint64_t)a3 targetNodeIdentifier:(unint64_t)a4 numberOfPaths:(unint64_t)a5
{
  KGGraphPath *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)KGGraphPath;
  result = -[KGGraphPath init](&v9, sel_init);
  if (result)
  {
    result->_sourceNodeIdentifier = a3;
    result->_targetNodeIdentifier = a4;
    result->_numberOfPaths = a5;
  }
  return result;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("from:%llu to:%llu count:%llu"), self->_sourceNodeIdentifier, self->_targetNodeIdentifier, self->_numberOfPaths);
}

- (unint64_t)sourceNodeIdentifier
{
  return self->_sourceNodeIdentifier;
}

- (unint64_t)targetNodeIdentifier
{
  return self->_targetNodeIdentifier;
}

- (unint64_t)numberOfPaths
{
  return self->_numberOfPaths;
}

@end
