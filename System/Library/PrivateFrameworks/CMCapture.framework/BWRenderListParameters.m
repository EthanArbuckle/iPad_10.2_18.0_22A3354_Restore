@implementation BWRenderListParameters

+ (void)initialize
{
  objc_opt_class();
}

- (BWRenderListParameters)init
{
  return -[BWRenderListParameters initWithParameterList:](self, "initWithParameterList:", 0);
}

- (BWRenderListParameters)initWithParameterList:(BWRenderListParameterList *)a3
{
  BWRenderListParameters *v4;
  BWRenderListParameters *v5;
  BWRenderListParameterNode *slh_first;
  BWRenderListParameterList *v7;
  void *v8;
  BWRenderListParameterNode *v9;
  uint64_t v10;
  BWRenderListParameterList *p_parameterList;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)BWRenderListParameters;
  v4 = -[BWRenderListParameters init](&v13, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_parameterList.slh_first = 0;
    if (a3)
    {
      slh_first = a3->slh_first;
      if (a3->slh_first)
      {
        v7 = 0;
        do
        {
          v8 = (void *)*((_QWORD *)slh_first + 1);
          v9 = (BWRenderListParameterNode *)malloc_type_malloc(0x10uLL, 0xA0040AFF93C70uLL);
          v10 = objc_msgSend(v8, "copyWithZone:", 0);
          if (v7)
            p_parameterList = v7;
          else
            p_parameterList = &v5->_parameterList;
          *(_QWORD *)v9 = p_parameterList->slh_first;
          *((_QWORD *)v9 + 1) = v10;
          p_parameterList->slh_first = v9;
          slh_first = *(BWRenderListParameterNode **)slh_first;
          v7 = (BWRenderListParameterList *)v9;
        }
        while (slh_first);
      }
    }
  }
  return v5;
}

- (void)dealloc
{
  BWRenderListParameterNode *slh_first;
  BWRenderListParameterList *p_parameterList;
  BWRenderListParameterNode *v5;
  BWRenderListParameterNode *v6;
  BWRenderListParameterList *v7;
  objc_super v8;

  p_parameterList = &self->_parameterList;
  slh_first = self->_parameterList.slh_first;
  if (slh_first)
  {
    do
    {
      v5 = *(BWRenderListParameterNode **)slh_first;

      v6 = p_parameterList->slh_first;
      v7 = p_parameterList;
      while (v6 != slh_first)
      {
        v7 = (BWRenderListParameterList *)v6;
        v6 = *(BWRenderListParameterNode **)v6;
      }
      v7->slh_first = *(BWRenderListParameterNode **)slh_first;
      free(slh_first);
      slh_first = v5;
    }
    while (v5);
  }
  v8.receiver = self;
  v8.super_class = (Class)BWRenderListParameters;
  -[BWRenderListParameters dealloc](&v8, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  void *v4;
  BWRenderListParameterNode *slh_first;
  const __CFString *v6;
  uint64_t v7;
  objc_class *v8;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p>: "), objc_opt_class(), self);
  v4 = v3;
  if (self)
  {
    slh_first = self->_parameterList.slh_first;
    if (slh_first)
      v6 = CFSTR(", Parameters: ");
    else
      v6 = CFSTR(", No Parameters");
    objc_msgSend(v3, "appendString:", v6);
    if (slh_first)
    {
      v7 = 0;
      do
      {
        v8 = (objc_class *)objc_opt_class();
        objc_msgSend(v4, "appendFormat:", CFSTR("[%u] %@ "), v7, NSStringFromClass(v8));
        slh_first = *(BWRenderListParameterNode **)slh_first;
        v7 = (v7 + 1);
      }
      while (slh_first);
    }
  }
  else
  {
    objc_msgSend(v3, "appendString:", CFSTR(", No Parameters"));
  }
  return (NSString *)v4;
}

- (BWRenderListParameterList)parameterList
{
  return &self->_parameterList;
}

@end
