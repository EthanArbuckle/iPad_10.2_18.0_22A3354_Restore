@implementation MTLBuiltInArgument

- (MTLBuiltInArgument)initWithName:(id)a3 type:(unint64_t)a4 access:(unint64_t)a5 active:(BOOL)a6 index:(unint64_t)a7 dataType:(unint64_t)a8 builtInType:(unint64_t)a9
{
  unsigned __int16 v9;
  MTLBuiltInArgument *result;
  objc_super v11;

  v9 = a8;
  v11.receiver = self;
  v11.super_class = (Class)MTLBuiltInArgument;
  result = -[MTLBindingInternal initWithName:type:access:index:active:arrayLength:](&v11, sel_initWithName_type_access_index_active_arrayLength_, a3, a4, a5, a7, a6, 1);
  result->_builtInType = a9;
  result->_builtInDataType = v9;
  return result;
}

- (unint64_t)builtInDataType
{
  return self->_builtInDataType;
}

- (unint64_t)builtInType
{
  return self->_builtInType;
}

- (id)formattedDescription:(unint64_t)a3
{
  uint64_t v5;
  void *v6;
  id v7;
  objc_super v9;
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a3 + 4, CFSTR(" "), 0);
  v6 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)MTLBuiltInArgument;
  v7 = -[MTLBindingInternal formattedDescription:](&v9, sel_formattedDescription_, a3);
  v10[0] = v5;
  v10[1] = CFSTR("BuiltInArgumentType =");
  v10[2] = MTLBuiltInArgumentTypeString(self->_builtInType);
  return (id)objc_msgSend(v6, "stringWithFormat:", CFSTR("%@%@"), v7, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 3), "componentsJoinedByString:", CFSTR(" ")));
}

- (BOOL)isEqual:(id)a3
{
  objc_super v6;

  if (!a3)
    return 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || self->_builtInType != *((unsigned __int16 *)a3 + 84)
    || self->_builtInDataType != *((unsigned __int16 *)a3 + 85))
  {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)MTLBuiltInArgument;
  return -[MTLBindingInternal isEqual:](&v6, sel_isEqual_, a3);
}

@end
