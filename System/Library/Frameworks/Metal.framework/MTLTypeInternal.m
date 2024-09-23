@implementation MTLTypeInternal

- (MTLTypeInternal)initWithDataType:(unint64_t)a3
{
  MTLTypeInternal *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTLTypeInternal;
  result = -[MTLTypeInternal init](&v5, sel_init);
  result->_dataType = a3;
  return result;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)MTLTypeInternal;
  -[MTLTypeInternal dealloc](&v2, sel_dealloc);
}

- (unint64_t)dataType
{
  return self->_dataType;
}

- (id)formattedDescription:(unint64_t)a3 withPrintedTypes:(id)a4
{
  return (id)MTLDataTypeString(self->_dataType);
}

- (id)formattedDescription:(unint64_t)a3
{
  id v5;
  id v6;

  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = -[MTLTypeInternal formattedDescription:withPrintedTypes:](self, "formattedDescription:withPrintedTypes:", a3, v5);

  return v6;
}

- (id)description
{
  id v3;
  id v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = -[MTLTypeInternal formattedDescription:withPrintedTypes:](self, "formattedDescription:withPrintedTypes:", 0, v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  if (!a3)
    return 0;
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0 && self->_dataType == *((_QWORD *)a3 + 1);
}

@end
