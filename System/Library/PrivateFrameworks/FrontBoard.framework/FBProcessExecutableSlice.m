@implementation FBProcessExecutableSlice

+ (id)arm64
{
  return (id)objc_msgSend(a1, "sliceWithType:subtype:", 16777228, 1);
}

+ (id)arm64e
{
  return (id)objc_msgSend(a1, "sliceWithType:subtype:", 16777228, 2);
}

+ (FBProcessExecutableSlice)sliceWithType:(int)a3
{
  return (FBProcessExecutableSlice *)objc_msgSend(a1, "sliceWithType:subtype:", *(_QWORD *)&a3, 0xFFFFFFFFLL);
}

+ (FBProcessExecutableSlice)sliceWithType:(int)a3 subtype:(int)a4
{
  _DWORD *v6;

  v6 = (_DWORD *)objc_opt_new();
  v6[2] = a3;
  v6[3] = a4;
  return (FBProcessExecutableSlice *)v6;
}

- (id)description
{
  unsigned int v3;
  __CFString *v4;
  void *v5;
  objc_class *v6;
  void *v7;

  if (self->_type == 16777228)
  {
    v3 = self->_subtype + 1;
    if (v3 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("arm64_(%i)"), self->_subtype);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = off_1E4A124E8[v3];
    }
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@; type: %d; subtype: %d>"),
      v7,
      self->_type,
      self->_subtype);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (int)type
{
  return self->_type;
}

- (int)subtype
{
  return self->_subtype;
}

@end
