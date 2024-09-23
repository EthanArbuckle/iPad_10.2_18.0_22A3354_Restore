@implementation MTLFunctionStitchingInputNode

- (MTLFunctionStitchingInputNode)initWithArgumentIndex:(NSUInteger)argument
{
  MTLFunctionStitchingInputNode *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTLFunctionStitchingInputNode;
  result = -[MTLFunctionStitchingInputNode init](&v5, sel_init);
  result->_argumentIndex = argument;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setArgumentIndex:", -[MTLFunctionStitchingInputNode argumentIndex](self, "argumentIndex"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  objc_class *Class;
  NSUInteger v7;

  if (a3 == self)
    return 1;
  Class = object_getClass(self);
  if (Class != object_getClass(a3))
    return 0;
  v7 = -[MTLFunctionStitchingInputNode argumentIndex](self, "argumentIndex");
  return v7 == objc_msgSend(a3, "argumentIndex");
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[MTLFunctionStitchingInputNode argumentIndex](self, "argumentIndex");
  return _MTLHashState((int *)&v3, 8uLL);
}

- (id)formattedDescription:(unint64_t)a3
{
  uint64_t v4;
  void *v5;
  NSString *v6;
  objc_super v8;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a3 + 4, CFSTR(" "), 0);
  v5 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)MTLFunctionStitchingInputNode;
  v6 = -[MTLFunctionStitchingInputNode description](&v8, sel_description);
  v9[0] = v4;
  v9[1] = CFSTR("argumentIndex =");
  v9[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_argumentIndex);
  return (id)objc_msgSend(v5, "stringWithFormat:", CFSTR("%@%@"), v6, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 3), "componentsJoinedByString:", CFSTR(" ")));
}

- (NSString)description
{
  return (NSString *)-[MTLFunctionStitchingInputNode formattedDescription:](self, "formattedDescription:", 0);
}

- (NSUInteger)argumentIndex
{
  return self->_argumentIndex;
}

- (void)setArgumentIndex:(NSUInteger)argumentIndex
{
  self->_argumentIndex = argumentIndex;
}

@end
