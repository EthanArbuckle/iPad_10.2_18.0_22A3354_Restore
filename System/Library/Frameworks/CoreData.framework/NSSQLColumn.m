@implementation NSSQLColumn

- (uint64_t)roughSizeEstimate
{
  unsigned int v1;

  if (result)
  {
    v1 = *(unsigned __int8 *)(result + 25) - 1;
    if (v1 > 0xA)
      return 16;
    else
      return dword_18A509E90[(char)v1];
  }
  return result;
}

- (unsigned)slot
{
  return self->super._slot;
}

- (id)columnName
{
  return self->_columnName;
}

- (NSSQLColumn)initWithEntity:(id)a3 propertyDescription:(id)a4
{
  NSSQLColumn *v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NSSQLColumn;
  v6 = -[NSSQLProperty initWithEntity:propertyDescription:](&v9, sel_initWithEntity_propertyDescription_);
  if (v6)
  {
    if (a4)
    {
      if (a3)
        v7 = *((_QWORD *)a3 + 22);
      else
        v7 = 0;
      v6->_columnName = (NSString *)-[NSSQLStoreMappingGenerator newGeneratedPropertyName:](v7, a4);
    }
    v6->super._slot = -1;
    *(_WORD *)&v6->super._flags |= 1u;
  }
  return v6;
}

- (void)copyValuesForReadOnlyFetch:(id)a3
{
  __int16 v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NSSQLColumn;
  -[NSSQLProperty copyValuesForReadOnlyFetch:](&v6, sel_copyValuesForReadOnlyFetch_);
  self->_columnName = (NSString *)objc_msgSend((id)objc_msgSend(a3, "columnName"), "copy");
  self->super._sqlType = objc_msgSend(a3, "sqlType");
  if (a3)
    v5 = *((_WORD *)a3 + 16) & 1;
  else
    v5 = 0;
  *(_WORD *)&self->super._flags = *(_WORD *)&self->super._flags & 0xFFFE | v5;
}

- (id)initForReadOnlyFetching
{
  id result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSSQLColumn;
  result = -[NSSQLColumn init](&v3, sel_init);
  if (result)
    *((_WORD *)result + 14) = -1;
  return result;
}

- (NSSQLColumn)initWithColumnName:(id)a3 sqlType:(unsigned __int8)a4
{
  NSSQLColumn *v6;
  NSSQLColumn *v7;
  NSString *columnName;

  v6 = -[NSSQLColumn initWithEntity:propertyDescription:](self, "initWithEntity:propertyDescription:", 0, 0);
  v7 = v6;
  if (v6)
  {
    columnName = v6->_columnName;
    if (columnName != a3)
    {

      v7->_columnName = (NSString *)objc_msgSend(a3, "copy");
    }
    v7->super._sqlType = a4;
  }
  return v7;
}

- (unsigned)sqlType
{
  return self->super._sqlType;
}

- (uint64_t)_setColumnName:(uint64_t)result
{
  uint64_t v3;
  void *v4;

  if (result)
  {
    v3 = result;
    v4 = *(void **)(result + 40);
    if (v4 != a2)
    {

      result = objc_msgSend(a2, "copy");
      *(_QWORD *)(v3 + 40) = result;
    }
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  self->_columnName = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSSQLColumn;
  -[NSSQLProperty dealloc](&v3, sel_dealloc);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: columnName = %@, type = %d, slot = %d, fetchIndex = %d propertyType = %d"), objc_opt_class(), self->_columnName, self->super._sqlType, self->super._slot, self->super._fetchIndex, -[NSSQLProperty propertyType](self, "propertyType"));
}

@end
