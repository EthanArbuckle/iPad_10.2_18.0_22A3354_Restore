@implementation _NSPlaceholderData

- (_NSPlaceholderData)initWithBytes:(void *)a3 length:(unint64_t)a4 copy:(BOOL)a5 deallocator:(id)a6
{
  _BOOL4 v9;
  _NSPlaceholderData *v10;
  _NSPlaceholderData *v11;
  unint64_t v12;
  char *v13;
  size_t v14;
  char *v15;
  _QWORD *v16;
  int v17;
  NSUInteger v18;

  if (!a4)
  {
    v10 = +[_NSZeroData data](_NSZeroData, "data", a3, 0, a5);
LABEL_6:
    v11 = v10;
    v9 = 1;
    if (!a6)
      return v11;
LABEL_19:
    if (v9)
      (*((void (**)(id, void *, unint64_t))a6 + 2))(a6, a3, a4);
    return v11;
  }
  v9 = a5;
  if (a4 <= 0xFFF6 && a5)
  {
    v10 = (_NSPlaceholderData *)objc_msgSend(+[_NSInlineData _allocWithExtraBytes:](_NSInlineData, "_allocWithExtraBytes:", a4), "initWithBytes:length:", a3, a4);
    goto LABEL_6;
  }
  if (a5)
  {
    v12 = (unint64_t)NSAllocateMemoryPages(a4);
    v13 = (char *)v12;
    v14 = a4;
    v15 = (char *)a3;
    if (a4 >= 0x80000)
    {
      v16 = (_QWORD *)MEMORY[0x1E0C85AD8];
      v14 = a4;
      v15 = (char *)a3;
      if (((*MEMORY[0x1E0C85AD8] - 1) & (v12 | (unint64_t)a3)) == 0)
      {
        malloc_default_zone();
        v17 = malloc_zone_claimed_address();
        v12 = (unint64_t)v13;
        v14 = a4;
        v15 = (char *)a3;
        if (!v17)
        {
          v18 = -*v16 & a4;
          NSCopyMemoryPages(a3, v13, v18);
          v14 = a4 - v18;
          if (a4 == v18)
            goto LABEL_18;
          v15 = (char *)a3 + v18;
          v12 = (unint64_t)&v13[v18];
        }
      }
    }
    memmove((void *)v12, v15, v14);
  }
  else
  {
    v13 = (char *)a3;
    if (a6 != &__block_literal_global_1)
    {
      v13 = (char *)a3;
      if (a6 != &__block_literal_global_2)
        return (_NSPlaceholderData *)objc_msgSend(objc_allocWithZone((Class)NSConcreteData), "initWithBytes:length:copy:deallocator:", a3, a4, 0, a6);
    }
  }
LABEL_18:
  v11 = (_NSPlaceholderData *)dispatch_data_create(v13, a4, 0, (dispatch_block_t)*MEMORY[0x1E0C80CF8]);
  if (a6)
    goto LABEL_19;
  return v11;
}

- (_NSPlaceholderData)init
{
  return -[_NSPlaceholderData initWithBytes:length:copy:deallocator:](self, "initWithBytes:length:copy:deallocator:", 0, 0, 1, 0);
}

- (_NSPlaceholderData)initWithData:(id)a3
{
  __objc2_class *v5;
  objc_class *v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (_CFExecutableLinkedOnOrAfter())
  {
    v5 = (__objc2_class *)objc_opt_class();
    if (v5 == NSConcreteData)
      return (_NSPlaceholderData *)objc_msgSend(a3, "copyWithZone:", 0);
    v6 = (objc_class *)v5;
    if (v5 == (__objc2_class *)objc_opt_class()
      || v6 == (objc_class *)objc_opt_class()
      || v6 == objc_lookUpClass("__NSCFData")
      || objc_msgSend(a3, "_isDispatchData"))
    {
      return (_NSPlaceholderData *)objc_msgSend(a3, "copyWithZone:", 0);
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)_NSPlaceholderData;
  return -[NSData initWithData:](&v8, sel_initWithData_, a3);
}

- (unint64_t)retainCount
{
  return -1;
}

@end
