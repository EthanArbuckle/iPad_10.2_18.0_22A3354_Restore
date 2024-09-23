@implementation MTLVertexAttributeInternal

- (void)setAttributeType:(unint64_t)a3
{
  self->_attributeType = a3;
}

- (MTLVertexAttributeInternal)initWithName:(id)a3 attributeIndex:(unint64_t)a4 attributeType:(unint64_t)a5 flags:(MTLAttributeFlags)a6
{
  unsigned __int8 var1;
  MTLVertexAttributeInternal *v10;
  id v11;
  objc_super v13;

  var1 = a6.var0.var1;
  v13.receiver = self;
  v13.super_class = (Class)MTLVertexAttributeInternal;
  v10 = -[MTLVertexAttributeInternal init](&v13, sel_init);
  v10->_name = (NSString *)a3;
  v11 = a3;
  v10->_attributeIndex = a4;
  v10->_attributeType = a5;
  v10->_flags = var1;
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLVertexAttributeInternal;
  -[MTLVertexAttributeInternal dealloc](&v3, sel_dealloc);
}

- (BOOL)isActive
{
  return self->_flags & 1;
}

- (BOOL)isPatchData
{
  return (self->_flags >> 1) & 1;
}

- (BOOL)isPatchControlPointData
{
  return (self->_flags >> 2) & 1;
}

- (id)formattedDescription:(unint64_t)a3
{
  uint64_t v4;
  void *v5;
  id v6;
  const __CFString *name;
  objc_super v9;
  _QWORD v10[19];

  v10[18] = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a3 + 4, CFSTR(" "), 0);
  v5 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)MTLVertexAttributeInternal;
  v6 = -[MTLVertexAttributeInternal description](&v9, sel_description);
  v10[0] = v4;
  v10[1] = CFSTR("name =");
  name = (const __CFString *)self->_name;
  if (!name)
    name = CFSTR("<none>");
  v10[2] = name;
  v10[3] = v4;
  v10[4] = CFSTR("attributeIndex =");
  v10[5] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_attributeIndex);
  v10[6] = v4;
  v10[7] = CFSTR("attributeType =");
  v10[8] = MTLDataTypeString(self->_attributeType);
  v10[9] = v4;
  v10[10] = CFSTR("active =");
  v10[11] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", self->_flags & 1);
  v10[12] = v4;
  v10[13] = CFSTR("isPatchData =");
  v10[14] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", (self->_flags >> 1) & 1);
  v10[15] = v4;
  v10[16] = CFSTR("isPatchControlPointData =");
  v10[17] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", (self->_flags >> 2) & 1);
  return (id)objc_msgSend(v5, "stringWithFormat:", CFSTR("%@%@"), v6, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 18), "componentsJoinedByString:", CFSTR(" ")));
}

- (id)description
{
  return -[MTLVertexAttributeInternal formattedDescription:](self, "formattedDescription:", 0);
}

- (id)name
{
  return self->_name;
}

- (unint64_t)attributeIndex
{
  return self->_attributeIndex;
}

- (unint64_t)attributeType
{
  return self->_attributeType;
}

@end
