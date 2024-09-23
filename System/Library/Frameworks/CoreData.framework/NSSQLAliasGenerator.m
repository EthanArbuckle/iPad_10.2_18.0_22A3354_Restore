@implementation NSSQLAliasGenerator

- (NSSQLAliasGenerator)initWithNestingLevel:(unsigned int)a3
{
  uint64_t v3;
  NSSQLAliasGenerator *v4;
  __CFString *v5;
  objc_super v7;

  v3 = *(_QWORD *)&a3;
  v7.receiver = self;
  v7.super_class = (Class)NSSQLAliasGenerator;
  v4 = -[NSSQLAliasGenerator init](&v7, sel_init);
  if (v4)
  {
    if ((_DWORD)v3)
    {
      v4->_tableBase = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("n%u_t%cu"), v3, 37);
      v5 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("__n%u_var%cu"), v3, 37);
    }
    else
    {
      v4->_tableBase = (NSString *)CFSTR("t%u");
      v5 = CFSTR("__var%u");
    }
    v4->_variableBase = (NSString *)v5;
    *(_QWORD *)&v4->_nextTableAlias = 0;
    v4->_nextTempTableAlias = 0;
  }
  return v4;
}

- (id)generateTableAlias
{
  void *v2;
  NSString *tableBase;
  uint64_t nextTableAlias;

  v2 = (void *)MEMORY[0x1E0CB3940];
  tableBase = self->_tableBase;
  nextTableAlias = self->_nextTableAlias;
  self->_nextTableAlias = nextTableAlias + 1;
  return (id)objc_msgSend(v2, "stringWithFormat:", tableBase, nextTableAlias);
}

- (uint64_t)generateTempTableName
{
  void *v1;
  uint64_t v2;

  if (result)
  {
    v1 = (void *)MEMORY[0x1E0CB3940];
    v2 = *(unsigned int *)(result + 16);
    *(_DWORD *)(result + 16) = v2 + 1;
    return objc_msgSend(v1, "stringWithFormat:", CFSTR("_Z_intarray%u"), v2);
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSSQLAliasGenerator;
  -[NSSQLAliasGenerator dealloc](&v3, sel_dealloc);
}

- (id)generateSubqueryVariableAlias
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  if (self)
  {
    v2 = (void *)MEMORY[0x1E0CB3940];
    v3 = *((_QWORD *)self + 4);
    v4 = *((unsigned int *)self + 3);
    *((_DWORD *)self + 3) = v4 + 1;
    return (id)objc_msgSend(v2, "stringWithFormat:", v3, v4);
  }
  return self;
}

- (NSSQLAliasGenerator)init
{
  return -[NSSQLAliasGenerator initWithNestingLevel:](self, "initWithNestingLevel:", 0);
}

- (uint64_t)generateVariableAlias
{
  void *v1;
  uint64_t v2;
  uint64_t v3;

  if (result)
  {
    v1 = (void *)MEMORY[0x1E0CB3940];
    v2 = *(_QWORD *)(result + 32);
    v3 = *(unsigned int *)(result + 12);
    *(_DWORD *)(result + 12) = v3 + 1;
    return objc_msgSend(v1, "stringWithFormat:", v2, v3);
  }
  return result;
}

@end
