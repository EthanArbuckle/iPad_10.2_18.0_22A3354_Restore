@implementation CBORUnsigned

- (int)fieldType
{
  return 0;
}

- (CBORUnsigned)initWith:(unint64_t)a3
{
  CBORUnsigned *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CBORUnsigned;
  result = -[CBORUnsigned init](&v5, sel_init);
  if (result)
    result->m_data = a3;
  return result;
}

- (void)write:(id)a3
{
  -[CBORValue encodeStartItems:output:](self, "encodeStartItems:output:", self->m_data, a3);
}

- (int64_t)compare:(id)a3
{
  unint64_t m_data;
  unint64_t v4;
  BOOL v5;
  int64_t v6;

  m_data = self->m_data;
  v4 = *((_QWORD *)a3 + 1);
  v5 = m_data >= v4;
  v6 = m_data > v4;
  if (v5)
    return v6;
  else
    return -1;
}

- (id)getLabel
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), self->m_data);
}

@end
