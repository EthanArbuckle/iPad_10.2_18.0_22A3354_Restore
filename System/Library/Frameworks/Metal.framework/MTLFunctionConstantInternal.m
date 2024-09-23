@implementation MTLFunctionConstantInternal

- (MTLFunctionConstantInternal)initWithName:(id)a3 type:(unint64_t)a4 index:(unint64_t)a5 required:(BOOL)a6
{
  MTLFunctionConstantInternal *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MTLFunctionConstantInternal;
  v10 = -[MTLFunctionConstantInternal init](&v12, sel_init);
  v10->_name = (NSString *)objc_msgSend(a3, "copy");
  v10->_type = a4;
  v10->_index = a5;
  v10->_required = a6;
  return v10;
}

- (unint64_t)type
{
  return self->_type;
}

- (unint64_t)index
{
  return self->_index;
}

- (id)name
{
  return self->_name;
}

- (BOOL)required
{
  return self->_required;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLFunctionConstantInternal;
  -[MTLFunctionConstantInternal dealloc](&v3, sel_dealloc);
}

- (id)formattedDescription:(unint64_t)a3
{
  uint64_t v4;
  void *v5;
  id v6;
  NSString *name;
  const __CFString *v8;
  objc_super v10;
  _QWORD v11[13];

  v11[12] = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a3 + 4, CFSTR(" "), 0);
  v5 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)MTLFunctionConstantInternal;
  v6 = -[MTLFunctionConstantInternal description](&v10, sel_description);
  name = self->_name;
  v11[0] = v4;
  v11[1] = CFSTR("name =");
  if (name)
    v8 = (const __CFString *)name;
  else
    v8 = CFSTR("<none>");
  v11[2] = v8;
  v11[3] = v4;
  v11[4] = CFSTR("type =");
  v11[5] = MTLDataTypeString(self->_type);
  v11[6] = v4;
  v11[7] = CFSTR("index =");
  v11[8] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_index);
  v11[9] = v4;
  v11[10] = CFSTR("required =");
  v11[11] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_required);
  return (id)objc_msgSend(v5, "stringWithFormat:", CFSTR("%@%@"), v6, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 12), "componentsJoinedByString:", CFSTR(" ")));
}

- (id)description
{
  return -[MTLFunctionConstantInternal formattedDescription:](self, "formattedDescription:", 0);
}

@end
