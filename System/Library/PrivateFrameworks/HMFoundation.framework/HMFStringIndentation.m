@implementation HMFStringIndentation

+ (id)indentationWithWidth:(unint64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithWidth:", a3);
}

- (id)indentationByLevels:(int64_t)a3
{
  unint64_t v5;
  _QWORD *v6;

  if (-[HMFStringIndentation level](self, "level") + a3)
    v5 = -[HMFStringIndentation level](self, "level") + a3;
  else
    v5 = 0;
  v6 = (_QWORD *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithWidth:", -[HMFStringIndentation width](self, "width"));
  v6[2] = v5;
  return v6;
}

- (id)description
{
  unint64_t v3;

  v3 = -[HMFStringIndentation width](self, "width");
  return (id)objc_msgSend(&stru_1E3B39EC0, "stringByPaddingToLength:withString:startingAtIndex:", v3 + v3 * -[HMFStringIndentation level](self, "level"), CFSTR(" "), 0);
}

- (unint64_t)level
{
  return self->_level;
}

- (unint64_t)width
{
  return self->_width;
}

- (HMFStringIndentation)initWithWidth:(unint64_t)a3
{
  HMFStringIndentation *result;
  unint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMFStringIndentation;
  result = -[HMFStringIndentation init](&v6, sel_init);
  if (result)
  {
    v5 = 4;
    if (a3)
      v5 = a3;
    result->_width = v5;
  }
  return result;
}

+ (id)indentation
{
  return (id)objc_msgSend(a1, "indentationWithWidth:", 0);
}

- (HMFStringIndentation)init
{
  return -[HMFStringIndentation initWithWidth:](self, "initWithWidth:", 0);
}

@end
