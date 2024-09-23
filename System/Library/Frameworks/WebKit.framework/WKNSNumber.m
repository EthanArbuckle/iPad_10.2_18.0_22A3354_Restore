@implementation WKNSNumber

- (void)dealloc
{
  objc_super v3;

  if ((self->_type & 0xFFFFFFFC) == 0x20)
    (**(void (***)(void))&self->_number._int64.data.__lx[4])();
  v3.receiver = self;
  v3.super_class = (Class)WKNSNumber;
  -[WKNSNumber dealloc](&v3, sel_dealloc);
}

- (const)objCType
{
  unsigned int v2;

  v2 = self->_type - 32;
  if (v2 > 3)
    return 0;
  else
    return off_1E34B8148[v2];
}

- (void)getValue:(void *)a3
{
  switch(self->_type)
  {
    case ' ':
      *(_BYTE *)a3 = self->_number._BOOLean.data.__lx[20];
      break;
    case '!':
      *(_QWORD *)a3 = *(_QWORD *)&self->_number._int64.data.__lx[20];
      break;
    case '"':
    case '#':
      *(_QWORD *)a3 = *(_QWORD *)&self->_number._int64.data.__lx[20];
      break;
    default:
      return;
  }
}

- (char)charValue
{
  objc_super v3;

  if (self->_type == 32)
    return self->_number._BOOLean.data.__lx[20];
  v3.receiver = self;
  v3.super_class = (Class)WKNSNumber;
  return -[WKNSNumber charValue](&v3, sel_charValue);
}

- (double)doubleValue
{
  double result;
  objc_super v3;

  if (self->_type == 33)
    return *(double *)&self->_number._int64.data.__lx[20];
  v3.receiver = self;
  v3.super_class = (Class)WKNSNumber;
  -[WKNSNumber doubleValue](&v3, sel_doubleValue);
  return result;
}

- (unint64_t)unsignedLongLongValue
{
  objc_super v3;

  if (self->_type == 34)
    return *(_QWORD *)&self->_number._int64.data.__lx[20];
  v3.receiver = self;
  v3.super_class = (Class)WKNSNumber;
  return -[WKNSNumber unsignedLongLongValue](&v3, sel_unsignedLongLongValue);
}

- (int64_t)longLongValue
{
  objc_super v3;

  if (self->_type == 35)
    return *(_QWORD *)&self->_number._int64.data.__lx[20];
  v3.receiver = self;
  v3.super_class = (Class)WKNSNumber;
  return -[WKNSNumber longLongValue](&v3, sel_longLongValue);
}

- (Object)_apiObject
{
  return (Object *)&self->_number._int64.data.__lx[4];
}

@end
