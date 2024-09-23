@implementation OSLogMessagePlaceholder

- (void)dealloc
{
  NSString *placeholderString;
  NSArray *placeholderTokens;
  objc_super v5;

  placeholderString = self->_placeholderString;
  if (placeholderString)

  placeholderTokens = self->_placeholderTokens;
  if (placeholderTokens)

  v5.receiver = self;
  v5.super_class = (Class)OSLogMessagePlaceholder;
  -[OSLogMessagePlaceholder dealloc](&v5, sel_dealloc);
}

- (NSString)typeNamespace
{
  if (self->_placeholder->var9)
    return (NSString *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", self->_placeholder->var9, self->_placeholder->var4, 4, 0);
  else
    return 0;
}

- (NSString)type
{
  if (self->_placeholder->var10)
    return (NSString *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", self->_placeholder->var10, self->_placeholder->var5, 4, 0);
  else
    return 0;
}

- (NSArray)tokens
{
  NSArray *placeholderTokens;
  const char *v5;
  const char *v6;
  size_t v7;
  size_t v8;
  uint64_t v9;
  size_t v10;
  unsigned int v11;
  int v12;
  size_t v13;
  void *v14;
  const char *v15;

  placeholderTokens = self->_placeholderTokens;
  if (!placeholderTokens)
  {
    if (!strncmp(self->_placeholder->var0, "%{", 2uLL))
    {
      placeholderTokens = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v5 = self->_placeholder->var0 + 2;
      v6 = &v5[strspn(v5, ", ")];
      v7 = strcspn(v6, ",}");
      if (v7)
      {
        v8 = v7;
        v9 = MEMORY[0x1E0C80978];
        do
        {
          if (!*v6 || *v6 == 125)
            break;
          v10 = v8 - 1;
          while (v10 != -1)
          {
            v11 = v6[v10];
            if ((v11 & 0x80000000) != 0)
              v12 = __maskrune(v11, 0x4000uLL);
            else
              v12 = *(_DWORD *)(v9 + 4 * v11 + 60) & 0x4000;
            --v10;
            if (!v12)
            {
              v13 = v10 + 2;
              goto LABEL_18;
            }
          }
          v13 = 0;
LABEL_18:
          v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v6, v13, 4, 0);
          -[NSArray addObject:](placeholderTokens, "addObject:", v14);

          v15 = &v6[v8];
          if (!*v15)
            break;
          if (*v15 == 125)
            break;
          v6 = &v15[strspn(v15, ", }")];
          v8 = strcspn(v6, ",}");
        }
        while (v8);
      }
    }
    else
    {
      placeholderTokens = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    }
    self->_placeholderTokens = placeholderTokens;
  }
  return placeholderTokens;
}

- (OSLogMessagePlaceholder)initWithPlaceholderStruct:(os_log_fmt_cspec_s *)a3
{
  OSLogMessagePlaceholder *result;
  objc_super v5;

  if (!a3)
    return 0;
  v5.receiver = self;
  v5.super_class = (Class)OSLogMessagePlaceholder;
  result = -[OSLogMessagePlaceholder init](&v5, sel_init);
  if (result)
    result->_placeholder = a3;
  return result;
}

- (int)width
{
  return self->_placeholder->var7;
}

- (int)precision
{
  return self->_placeholder->var8;
}

- (NSString)rawString
{
  NSString *result;

  result = self->_placeholderString;
  if (!result)
  {
    result = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", self->_placeholder->var0, self->_placeholder->var3, 4, 0);
    self->_placeholderString = result;
  }
  return result;
}

@end
