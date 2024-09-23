@implementation FigCaptureFlatPlist

- (_QWORD)objectAtOffset:(_QWORD *)result
{
  _QWORD *v3;
  _QWORD *v4;
  int TypeForObjectAtOffset;
  int v6;
  __objc2_class *v7;
  void *v8;
  __n64 v9;
  unsigned int *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  unsigned int *v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  unsigned int *DataAndCountForObjectAtOffset;
  uint64_t v22;

  if (!result)
    return result;
  v3 = result;
  v4 = result + 2;
  TypeForObjectAtOffset = FigCaptureBinaryPlistGetTypeForObjectAtOffset(result + 2, a2);
  if (TypeForObjectAtOffset > 34)
  {
    if (TypeForObjectAtOffset <= 95)
    {
      if (TypeForObjectAtOffset <= 63)
      {
        if (TypeForObjectAtOffset == 35)
          return (_QWORD *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", FigCaptureBinaryPlistGetRealForObjectAtOffset(v4, a2).n64_f64[0]);
        if (TypeForObjectAtOffset == 48)
          return (_QWORD *)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", FigCaptureBinaryPlistGetRealForObjectAtOffset(v4, a2).n64_f64[0]);
        goto LABEL_34;
      }
      if (TypeForObjectAtOffset == 64)
      {
        DataAndCountForObjectAtOffset = FigCaptureBinaryPlistGetDataAndCountForObjectAtOffset(v4, a2);
        return (_QWORD *)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", DataAndCountForObjectAtOffset, v22);
      }
      if (TypeForObjectAtOffset == 80)
      {
        v10 = FigCaptureBinaryPlistGetDataAndCountForObjectAtOffset(v4, a2);
        v12 = v11;
        v13 = objc_alloc(MEMORY[0x1E0CB3940]);
        v14 = v10;
        v15 = v12;
        v16 = 4;
        goto LABEL_28;
      }
    }
    else
    {
      if (TypeForObjectAtOffset <= 191)
      {
        if (TypeForObjectAtOffset != 96)
        {
          if (TypeForObjectAtOffset == 160)
          {
            v7 = FigCaptureFlatPlistArray;
LABEL_31:
            v20 = (void *)objc_msgSend([v7 alloc], "initWithFlatPlist:offset:", v3, a2);
            return v20;
          }
          goto LABEL_34;
        }
        v17 = FigCaptureBinaryPlistGetDataAndCountForObjectAtOffset(v4, a2);
        v19 = v18;
        v13 = objc_alloc(MEMORY[0x1E0CB3940]);
        v14 = v17;
        v15 = v19;
        v16 = 2415919360;
LABEL_28:
        v20 = (void *)objc_msgSend(v13, "initWithBytes:length:encoding:", v14, v15, v16);
        return v20;
      }
      if (TypeForObjectAtOffset == 192)
      {
        v7 = FigCaptureFlatPlistSet;
        goto LABEL_31;
      }
      if (TypeForObjectAtOffset == 208)
      {
        v7 = FigCaptureFlatPlistDict;
        goto LABEL_31;
      }
    }
LABEL_34:
    abort();
  }
  v6 = TypeForObjectAtOffset - 8;
  result = (_QWORD *)MEMORY[0x1E0C9AAA0];
  switch(v6)
  {
    case 0:
      return result;
    case 1:
      return (_QWORD *)MEMORY[0x1E0C9AAB0];
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
      goto LABEL_34;
    case 8:
    case 9:
    case 10:
      return (_QWORD *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", FigCaptureBinaryPlistGetIntForObjectAtOffset(v4, a2));
    case 11:
      return (_QWORD *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", FigCaptureBinaryPlistGetIntForObjectAtOffset(v4, a2));
    default:
      if ((MEMORY[0x1E0C9AAA0] - 33) < 2)
      {
        v8 = (void *)MEMORY[0x1E0CB37E8];
        v9.n64_u64[0] = FigCaptureBinaryPlistGetRealForObjectAtOffset(v4, a2).n64_u64[0];
        v9.n64_f32[0] = v9.n64_f64[0];
        return (_QWORD *)objc_msgSend(v8, "numberWithFloat:", v9.n64_f64[0]);
      }
      if (MEMORY[0x1E0C9AAA0])
        goto LABEL_34;
      result = (_QWORD *)objc_msgSend(MEMORY[0x1E0C99E38], "null");
      break;
  }
  return result;
}

- (const)bplist
{
  return (const $4FA865112F5229015B8A293C0B690A6B *)&self->_bplist;
}

- (_QWORD)rootDictionary
{
  _QWORD *v1;
  unint64_t OffsetForReference;

  if (result)
  {
    v1 = result;
    OffsetForReference = FigCaptureBinaryPlistGetOffsetForReference((uint64_t)(result + 2), 0);
    return -[FigCaptureFlatPlist objectAtOffset:](v1, OffsetForReference);
  }
  return result;
}

+ (id)flatPlistWithContentsOfURL:(id)a3
{
  id v3;
  _QWORD *v5;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithContentsOfURL:", a3);
  if ((unint64_t)objc_msgSend(v3, "length") < 8)
    return 0;
  if (strncmp((const char *)objc_msgSend(v3, "bytes"), "bplist00", 8uLL))
    return (id)objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v3, 0, 0, 0);
  v5 = -[FigCaptureFlatPlist initWithMutableData:]([FigCaptureFlatPlist alloc], v3);
  return -[FigCaptureFlatPlist rootDictionary](v5);
}

- (id)initWithMutableData:(void *)a1
{
  id v2;
  id v4;
  objc_super v6;

  v2 = 0;
  if (a1)
  {
    if (a2)
    {
      v6.receiver = a1;
      v6.super_class = (Class)FigCaptureFlatPlist;
      v2 = objc_msgSendSuper2(&v6, sel_self);
      if (v2)
      {
        v4 = a2;
        *((_QWORD *)v2 + 1) = v4;
        if (!v4)
          -[FigCaptureFlatPlist initWithMutableData:].cold.1();
        FigCaptureBinaryPlistInitialize((uint64_t)v2 + 16, (char *)objc_msgSend(v4, "mutableBytes"), objc_msgSend(*((id *)v2 + 1), "length"));
      }
    }
  }
  return v2;
}

+ (id)flatPlistWithContentsOfFile:(id)a3
{
  return +[FigCaptureFlatPlist flatPlistWithContentsOfURL:](FigCaptureFlatPlist, "flatPlistWithContentsOfURL:", objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", a3));
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureFlatPlist;
  -[FigCaptureFlatPlist dealloc](&v3, sel_dealloc);
}

- (void)initWithMutableData:.cold.1()
{
  __assert_rtn("-[FigCaptureFlatPlist initWithMutableData:]", "FigCaptureFlatPlist.m", 128, "_data");
}

@end
