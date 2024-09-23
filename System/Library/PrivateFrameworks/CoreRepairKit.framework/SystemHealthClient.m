@implementation SystemHealthClient

- (SystemHealthClient)init
{
  objc_msgSend_raise_format_(MEMORY[0x1E0C99DA0], a2, *MEMORY[0x1E0C99768], (uint64_t)CFSTR("Please use initWithComponentType"));

  return 0;
}

- (SystemHealthClient)initWithComponentType:(unint64_t)a3
{
  SystemHealthClient *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SystemHealthClient;
  result = -[SystemHealthClient init](&v5, sel_init);
  if (result)
    result->componentType = a3;
  return result;
}

- (unint64_t)getComponentStatusWithError:(id *)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  const char *v6;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_raise_format_(v3, v6, v4, (uint64_t)CFSTR("You must override %@ in a subclass"), v5);

  return 0;
}

- (unint64_t)componentType
{
  return self->componentType;
}

- (void)setComponentType:(unint64_t)a3
{
  self->componentType = a3;
}

@end
