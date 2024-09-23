@implementation AVTPresentationConfiguration

- (AVTPresentationConfiguration)init
{
  -[AVTPresentationConfiguration doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (unint64_t)internalStyle
{
  return self->_style;
}

- (id)_initWithStyle:(unint64_t)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVTPresentationConfiguration;
  result = -[AVTPresentationConfiguration init](&v5, sel_init);
  if (result)
    *((_QWORD *)result + 1) = a3;
  return result;
}

- (BOOL)usesAR
{
  return (self->_style & 0xFFFFFFFFFFFFFFFELL) == 2;
}

@end
