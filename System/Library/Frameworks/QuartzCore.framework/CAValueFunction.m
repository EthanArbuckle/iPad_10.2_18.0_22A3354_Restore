@implementation CAValueFunction

- (Object)CA_copyRenderValue
{
  Object *result;
  Atomic *p_var1;
  unsigned int v4;
  unsigned int v5;

  result = (Object *)self->_impl;
  if (result)
  {
    p_var1 = &result->var1;
    do
      v4 = __ldaxr((unsigned int *)p_var1);
    while (__stlxr(v4 + 1, (unsigned int *)p_var1));
    if (!v4)
    {
      result = 0;
      do
        v5 = __ldaxr((unsigned int *)p_var1);
      while (__stlxr(v5 - 1, (unsigned int *)p_var1));
    }
  }
  return result;
}

+ (CAValueFunction)functionWithName:(CAValueFunctionName)name
{
  const __CFDictionary *v4;
  int v5;
  CAValueFunction *result;
  const void *v7;
  void *values[13];
  void *keys[14];

  keys[13] = *(void **)MEMORY[0x1E0C80C00];
  v7 = 0;
  v4 = (const __CFDictionary *)+[CAValueFunction functionWithName:]::dict;
  if (!+[CAValueFunction functionWithName:]::dict)
  {
    keys[0] = CFSTR("rotateX");
    keys[1] = CFSTR("rotateY");
    values[0] = 0;
    values[1] = (void *)1;
    keys[2] = CFSTR("rotateZ");
    keys[3] = CFSTR("scale");
    values[2] = (void *)2;
    values[3] = (void *)3;
    keys[4] = CFSTR("scaleX");
    keys[5] = CFSTR("scaleY");
    values[4] = (void *)4;
    values[5] = (void *)5;
    keys[6] = CFSTR("scaleZ");
    keys[7] = CFSTR("scaleXY");
    values[6] = (void *)6;
    values[7] = (void *)7;
    keys[8] = CFSTR("scaleXYZ");
    keys[9] = CFSTR("translate");
    values[8] = (void *)8;
    values[9] = (void *)9;
    keys[10] = CFSTR("translateX");
    keys[11] = CFSTR("translateY");
    values[10] = (void *)10;
    values[11] = (void *)11;
    keys[12] = CFSTR("translateZ");
    values[12] = (void *)12;
    v4 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 13, MEMORY[0x1E0C9B390], 0);
    +[CAValueFunction functionWithName:]::dict = (uint64_t)v4;
  }
  if (!CFDictionaryGetValueIfPresent(v4, name, &v7))
    return 0;
  v5 = (int)v7;
  result = (CAValueFunction *)function_objects[(int)v7];
  if (!result)
  {
    result = -[CAValueFunction _initWithName:]([CAValueFunction alloc], "_initWithName:", v7);
    function_objects[v5] = result;
  }
  return result;
}

- (id)_initWithName:(int)a3
{
  CAValueFunction *v4;
  unint64_t v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)CAValueFunction;
  v4 = -[CAValueFunction init](&v7, sel_init);
  if (v4)
  {
    v5 = CA::Render::NamedFunction::new_function(a3);
    v4->_impl = (void *)v5;
    if (!v5)
    {

      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  unsigned int *impl;
  unsigned int *v4;
  unsigned int v5;
  unsigned int v6;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  impl = (unsigned int *)self->_impl;
  if (impl)
  {
    v4 = impl + 2;
    do
    {
      v5 = __ldaxr(v4);
      v6 = v5 - 1;
    }
    while (__stlxr(v6, v4));
    if (!v6)
      (*(void (**)(unsigned int *, SEL))(*(_QWORD *)impl + 16))(impl, a2);
  }

  v7.receiver = self;
  v7.super_class = (Class)CAValueFunction;
  -[CAValueFunction dealloc](&v7, sel_dealloc);
}

- (CAValueFunctionName)name
{
  unsigned int v2;

  if (self->_string)
    return 0;
  v2 = (*(uint64_t (**)(void *, SEL))(*(_QWORD *)self->_impl + 120))(self->_impl, a2);
  if (v2 > 0xC)
    return 0;
  else
    return (CAValueFunctionName)*((_QWORD *)&off_1E159CE10 + v2);
}

- (unint64_t)inputCount
{
  unint64_t result;

  result = (unint64_t)self->_impl;
  if (result)
    return (*(unsigned int (**)(unint64_t, SEL))(*(_QWORD *)result + 104))(result, a2);
  return result;
}

- (unint64_t)outputCount
{
  unint64_t result;

  result = (unint64_t)self->_impl;
  if (result)
    return (*(unsigned int (**)(unint64_t, SEL))(*(_QWORD *)result + 112))(result, a2);
  return result;
}

- (BOOL)apply:(const double *)a3 result:(double *)a4
{
  void *impl;

  impl = self->_impl;
  if (impl)
    LOBYTE(impl) = (*(uint64_t (**)(void *, uint64_t, const double *, _QWORD, double *, _QWORD, _QWORD, _QWORD))(*(_QWORD *)impl + 128))(impl, 1, a3, 0, a4, 0, 0, 0);
  return (char)impl;
}

- (BOOL)apply:(const double *)a3 result:(double *)a4 parameterFunction:(void *)a5 context:(void *)a6
{
  void *impl;
  double (*v7)(uint64_t, unsigned int *, uint64_t, _QWORD *);
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  impl = self->_impl;
  if (impl)
  {
    v9[0] = a5;
    v9[1] = a6;
    if (a5)
      v7 = param_fun;
    else
      v7 = 0;
    LOBYTE(impl) = (*(uint64_t (**)(void *, uint64_t, const double *, _QWORD, double *, _QWORD, double (*)(uint64_t, unsigned int *, uint64_t, _QWORD *), _QWORD *))(*(_QWORD *)impl + 128))(impl, 1, a3, 0, a4, 0, v7, v9);
  }
  return (char)impl;
}

- (void)encodeWithCoder:(id)a3
{
  if (!self->_string)
    objc_msgSend(a3, "encodeObject:forKey:", -[CAValueFunction name](self, "name"), CFSTR("CAValueFunctionName"));
}

- (CAValueFunction)initWithCoder:(id)a3
{
  int v5;

  v5 = objc_msgSend(a3, "containsValueForKey:", CFSTR("CAValueFunctionName"));

  if (v5)
    return +[CAValueFunction functionWithName:](CAValueFunction, "functionWithName:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CAValueFunctionName")));
  else
    return 0;
}

- (void)encodeWithCAMLWriter:(id)a3
{
  NSString *v4;

  v4 = -[CAValueFunction name](self, "name");
  if (v4)
    objc_msgSend(a3, "setElementAttribute:forKey:", v4, CFSTR("name"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)CAMLParserStartElement:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v5 = objc_msgSend(a3, "attributeForKey:remove:", CFSTR("name"), 1);
  if (v5)
  {
    v6 = v5;
    v7 = objc_msgSend(a1, "functionWithName:", v5);
    if (v7)
      objc_msgSend(a3, "setElementValue:", v7);
    else
      objc_msgSend(a3, "parserError:", CFSTR("Unknown function: %@"), v6);
  }
}

@end
