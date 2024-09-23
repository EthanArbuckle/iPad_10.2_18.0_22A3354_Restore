@implementation MTLFunctionStitchingInputTexture

- (MTLFunctionStitchingInputTexture)initWithBindIndex:(unint64_t)a3
{
  MTLFunctionStitchingInputTexture *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTLFunctionStitchingInputTexture;
  result = -[MTLFunctionStitchingInputTexture init](&v5, sel_init);
  result->_bindIndex = a3;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setBindIndex:", self->_bindIndex);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  objc_class *Class;
  unint64_t v7;

  if (a3 == self)
    return 1;
  Class = object_getClass(self);
  if (Class != object_getClass(a3))
    return 0;
  v7 = -[MTLFunctionStitchingInputTexture bindIndex](self, "bindIndex");
  return v7 == objc_msgSend(a3, "bindIndex");
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[MTLFunctionStitchingInputTexture bindIndex](self, "bindIndex");
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
  v8.super_class = (Class)MTLFunctionStitchingInputTexture;
  v6 = -[MTLFunctionStitchingInputTexture description](&v8, sel_description);
  v9[0] = v4;
  v9[1] = CFSTR("bind index = ");
  v9[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_bindIndex);
  return (id)objc_msgSend(v5, "stringWithFormat:", CFSTR("%@%@"), v6, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 3), "componentsJoinedByString:", CFSTR(" ")));
}

- (NSString)description
{
  return (NSString *)-[MTLFunctionStitchingInputTexture formattedDescription:](self, "formattedDescription:", 0);
}

- (unint64_t)bindIndex
{
  return self->_bindIndex;
}

- (void)setBindIndex:(unint64_t)a3
{
  self->_bindIndex = a3;
}

@end
