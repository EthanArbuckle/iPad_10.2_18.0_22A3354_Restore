@implementation MFLineEndingConverterFilter

- (int64_t)appendData:(id)a3
{
  id v4;
  id v5;
  _BYTE *v6;
  uint64_t v7;
  _BYTE *v8;
  char **p_attr;
  void *v10;
  uint64_t v11;
  BOOL v12;
  unint64_t v13;
  char *v14;
  _BYTE *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  int64_t v21;
  objc_super v23;
  objc_super v24;
  objc_super v25;
  objc_super v26;
  _BYTE __b[16384];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  memset(__b, 170, sizeof(__b));
  v5 = objc_retainAutorelease(v4);
  v6 = (_BYTE *)objc_msgSend(v5, "bytes");
  v7 = objc_msgSend(v5, "length");
  v8 = &v6[v7];
  p_attr = &stru_1E5AA9FF8.attr;
  if (v7 < 1)
  {
    v19 = 0;
    v13 = (unint64_t)v6;
    if (v6)
    {
LABEL_22:
      *(&self->super._serialAppend + 1) = 1;
      --v8;
    }
    goto LABEL_23;
  }
  v10 = 0;
  v11 = 0;
  v12 = !*(&self->super._serialAppend + 1);
  v13 = (unint64_t)v6;
  while (1)
  {
    if (!v12)
      goto LABEL_6;
    v14 = (char *)memchr(v6, 13, v8 - v6);
    if (!v14)
      break;
    v6 = v14 + 1;
LABEL_6:
    if (v6 >= v8)
      goto LABEL_30;
    if (*v6 == 10)
    {
      if (v12)
      {
        v15 = &v6[~v13];
        if ((unint64_t)&v15[v11] <= 0x4000)
        {
          memmove(&__b[v11], (const void *)v13, (size_t)&v6[~v13]);
          v11 += (uint64_t)v15;
          v17 = v10;
        }
        else
        {
          if (v11)
          {
            v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", __b, v11, 0);

            v26.receiver = self;
            v26.super_class = (Class)MFLineEndingConverterFilter;
            v10 = (void *)v16;
            -[MFBaseFilterDataConsumer appendData:](&v26, sel_appendData_, v16);
          }
          v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", v13, &v6[~v13], 0);

          v25.receiver = self;
          v25.super_class = (Class)MFLineEndingConverterFilter;
          -[MFBaseFilterDataConsumer appendData:](&v25, sel_appendData_, v17);
          v11 = 0;
        }
        v13 = (unint64_t)v6;
        goto LABEL_19;
      }
    }
    else if (!v12)
    {
      if (v11)
        __assert_rtn("-[MFLineEndingConverterFilter appendData:]", "MFDataConsumer.m", 407, "used == 0");
      __b[0] = 13;
      v11 = 1;
    }
    v17 = v10;
LABEL_19:
    *(&self->super._serialAppend + 1) = 0;
    v12 = 1;
    v10 = v17;
    if (v13 >= (unint64_t)v8)
    {
      if (v11)
        goto LABEL_21;
      goto LABEL_31;
    }
  }
  v6 = 0;
LABEL_30:
  v17 = v10;
  if (v11)
  {
LABEL_21:
    p_attr = &stru_1E5AA9FF8.attr;
    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", __b, v11, 0);

    v24.receiver = self;
    v24.super_class = (Class)MFLineEndingConverterFilter;
    v19 = (void *)v18;
    -[MFBaseFilterDataConsumer appendData:](&v24, sel_appendData_, v18);
    if (!v6)
      goto LABEL_23;
    goto LABEL_22;
  }
LABEL_31:
  v19 = v17;
  p_attr = (char **)(&stru_1E5AA9FF8 + 8);
  if (v6)
    goto LABEL_22;
LABEL_23:
  if (v13 && v13 < (unint64_t)v8)
  {
    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", v13, &v8[-v13], 0);

    v23.receiver = self;
    v23.super_class = (Class)MFLineEndingConverterFilter;
    v19 = (void *)v20;
    objc_msgSendSuper2(&v23, p_attr[192], v20);
  }
  v21 = objc_msgSend(v5, "length");

  return v21;
}

- (void)done
{
  void *v3;
  objc_super v4;

  if (*(&self->super._serialAppend + 1))
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", &kCarriageReturn, 1, 0);
    v4.receiver = self;
    v4.super_class = (Class)MFLineEndingConverterFilter;
    -[MFBaseFilterDataConsumer appendData:](&v4, sel_appendData_, v3);
    *(&self->super._serialAppend + 1) = 0;

  }
}

@end
