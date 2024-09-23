@implementation IDSKVDeleteContext

- (unint64_t)rowIDCutoff
{
  return self->_rowIDCutoff;
}

- (void)setRowIDCutoff:(unint64_t)a3
{
  self->_rowIDCutoff = a3;
}

- (char)valueType
{
  return self->_valueType;
}

- (void)setValueType:(char)a3
{
  self->_valueType = a3;
}

@end
