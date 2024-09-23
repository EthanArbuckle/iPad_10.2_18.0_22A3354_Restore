@implementation SFObjCType

- (BOOL)isIntegerNumber
{
  return self->_flags & 1;
}

+ (id)typeForValue:(id)a3
{
  return +[SFObjCType typeForEncoding:](SFObjCType, "typeForEncoding:", objc_msgSend(a3, "objCType"));
}

+ (id)typeForEncoding:(const char *)a3
{
  void *v4;
  int v5;
  SFObjCType *v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  SFObjCType *v15;
  uint64_t v16;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (typeForEncoding__once != -1)
    dispatch_once(&typeForEncoding__once, &__block_literal_global_3153);
  v5 = *a3;
  if (v5 > 90)
  {
    switch(*a3)
    {
      case '^':
        v6 = [SFObjCType alloc];
        v7 = CFSTR("pointer");
        v8 = 22;
        v9 = v4;
        v10 = 8;
        goto LABEL_46;
      case '_':
      case 'a':
      case 'e':
      case 'g':
      case 'h':
      case 'j':
      case 'k':
      case 'm':
      case 'n':
      case 'o':
      case 'p':
      case 'r':
      case 't':
      case 'u':
        goto LABEL_24;
      case 'b':
        v6 = [SFObjCType alloc];
        v7 = CFSTR("bitfield");
        v8 = 21;
        goto LABEL_45;
      case 'c':
        v11 = (void *)_SFObjCTypesByCode;
        v12 = 0;
        goto LABEL_48;
      case 'd':
        v11 = (void *)_SFObjCTypesByCode;
        v12 = 11;
        goto LABEL_48;
      case 'f':
        v11 = (void *)_SFObjCTypesByCode;
        v12 = 10;
        goto LABEL_48;
      case 'i':
        v11 = (void *)_SFObjCTypesByCode;
        v12 = 2;
        goto LABEL_48;
      case 'l':
        v11 = (void *)_SFObjCTypesByCode;
        v12 = 3;
        goto LABEL_48;
      case 'q':
        v11 = (void *)_SFObjCTypesByCode;
        v12 = 4;
        goto LABEL_48;
      case 's':
        v11 = (void *)_SFObjCTypesByCode;
        v12 = 1;
        goto LABEL_48;
      case 'v':
        v11 = (void *)_SFObjCTypesByCode;
        v12 = 13;
        goto LABEL_48;
      default:
        if (v5 == 91)
        {
          v6 = [SFObjCType alloc];
          v7 = CFSTR("array");
          v8 = 18;
        }
        else
        {
          if (v5 != 123)
            goto LABEL_24;
          v6 = [SFObjCType alloc];
          v7 = CFSTR("structure");
          v8 = 19;
        }
        break;
    }
    goto LABEL_45;
  }
  if (v5 <= 72)
  {
    if (v5 > 57)
    {
      switch(*a3)
      {
        case ':':
          v11 = (void *)_SFObjCTypesByCode;
          v12 = 17;
          goto LABEL_48;
        case '@':
          if ((unint64_t)objc_msgSend(v4, "length") >= 4
            && objc_msgSend(v4, "characterAtIndex:", 1) == 34
            && objc_msgSend(v4, "characterAtIndex:", objc_msgSend(v4, "length") - 1) == 34)
          {
            objc_msgSend(v4, "substringWithRange:", 2, objc_msgSend(v4, "length") - 3);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "stringByAppendingString:", CFSTR("*"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = -[SFObjCType initWithCode:encoding:name:className:size:flags:]([SFObjCType alloc], "initWithCode:encoding:name:className:size:flags:", 15, v4, v14, v13, 8, 0);

            goto LABEL_50;
          }
          v11 = (void *)_SFObjCTypesByCode;
          v12 = 15;
          break;
        case 'B':
          v11 = (void *)_SFObjCTypesByCode;
          v12 = 12;
          goto LABEL_48;
        case 'C':
          v11 = (void *)_SFObjCTypesByCode;
          v12 = 5;
          goto LABEL_48;
        default:
          goto LABEL_24;
      }
      goto LABEL_48;
    }
    switch(v5)
    {
      case '#':
        v11 = (void *)_SFObjCTypesByCode;
        v12 = 16;
        goto LABEL_48;
      case '(':
        v6 = [SFObjCType alloc];
        v7 = CFSTR("union");
        v8 = 20;
LABEL_45:
        v9 = v4;
        v10 = 0;
LABEL_46:
        v16 = -[SFObjCType initWithCode:encoding:name:className:size:flags:](v6, "initWithCode:encoding:name:className:size:flags:", v8, v9, v7, 0, v10, 0);
        goto LABEL_49;
      case '*':
        v11 = (void *)_SFObjCTypesByCode;
        v12 = 14;
        goto LABEL_48;
    }
    goto LABEL_24;
  }
  if (v5 > 80)
  {
    if (v5 == 81)
    {
      v11 = (void *)_SFObjCTypesByCode;
      v12 = 9;
      goto LABEL_48;
    }
    if (v5 == 83)
    {
      v11 = (void *)_SFObjCTypesByCode;
      v12 = 6;
      goto LABEL_48;
    }
    goto LABEL_24;
  }
  if (v5 == 73)
  {
    v11 = (void *)_SFObjCTypesByCode;
    v12 = 7;
    goto LABEL_48;
  }
  if (v5 != 76)
  {
LABEL_24:
    v6 = [SFObjCType alloc];
    v7 = CFSTR("unknown");
    v8 = 23;
    goto LABEL_45;
  }
  v11 = (void *)_SFObjCTypesByCode;
  v12 = 8;
LABEL_48:
  objc_msgSend(v11, "objectAtIndexedSubscript:", v12);
  v16 = objc_claimAutoreleasedReturnValue();
LABEL_49:
  v15 = (SFObjCType *)v16;
LABEL_50:

  return v15;
}

- (unint64_t)size
{
  return self->_size;
}

- (BOOL)isFloatingPointNumber
{
  return (LOBYTE(self->_flags) >> 1) & 1;
}

- (int64_t)code
{
  return self->_code;
}

- (SFObjCType)initWithCode:(int64_t)a3 encoding:(id)a4 name:(id)a5 className:(id)a6 size:(unint64_t)a7 flags:(unint64_t)a8
{
  id v15;
  id v16;
  id v17;
  SFObjCType *v18;
  SFObjCType *v19;
  objc_super v21;

  v15 = a4;
  v16 = a5;
  v17 = a6;
  v21.receiver = self;
  v21.super_class = (Class)SFObjCType;
  v18 = -[SFObjCType init](&v21, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_code = a3;
    objc_storeStrong((id *)&v18->_encoding, a4);
    objc_storeStrong((id *)&v19->_name, a5);
    objc_storeStrong((id *)&v19->_className, a6);
    v19->_size = a7;
    v19->_flags = a8;
  }

  return v19;
}

- (BOOL)isNumber
{
  return (self->_flags & 3) != 0;
}

- (BOOL)isObject
{
  return self->_code == 15;
}

- (id)objectWithBytes:(const void *)a3
{
  double v3;
  id v4;
  id result;

  switch(self->_code)
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithChar:", *(char *)a3);
      v4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    case 1:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", *(__int16 *)a3);
      v4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    case 2:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)a3);
      v4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    case 3:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", *(_QWORD *)a3);
      v4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    case 4:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)a3);
      v4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    case 5:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)a3);
      v4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    case 6:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", *(unsigned __int16 *)a3);
      v4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    case 7:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)a3);
      v4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    case 8:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", *(_QWORD *)a3);
      v4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    case 9:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)a3);
      v4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    case 0xALL:
      LODWORD(v3) = *(_DWORD *)a3;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v3);
      v4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    case 0xBLL:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)a3);
      v4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    case 0xCLL:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)a3);
      v4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    case 0xFLL:
      v4 = *(id *)a3;
LABEL_17:
      result = v4;
      break;
    default:
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("For class %@, Unsupported boxing type: %@"), self->_className, self->_name);
      result = 0;
      break;
  }
  return result;
}

- (void)getBytes:(void *)a3 forObject:(id)a4
{
  id v6;

  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "getValue:", a3);
  else
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Unsupported unboxing type: %@"), self->_name);

}

- (NSString)encoding
{
  return self->_encoding;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)className
{
  return self->_className;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_className, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_encoding, 0);
}

void __30__SFObjCType_typeForEncoding___block_invoke()
{
  SFObjCType *v0;
  SFObjCType *v1;
  SFObjCType *v2;
  SFObjCType *v3;
  SFObjCType *v4;
  SFObjCType *v5;
  SFObjCType *v6;
  SFObjCType *v7;
  SFObjCType *v8;
  SFObjCType *v9;
  uint64_t v10;
  void *v11;
  SFObjCType *v12;
  SFObjCType *v13;
  SFObjCType *v14;
  SFObjCType *v15;
  SFObjCType *v16;
  SFObjCType *v17;
  SFObjCType *v18;
  _QWORD v19[19];

  v19[17] = *MEMORY[0x1E0C80C00];
  v18 = -[SFObjCType initWithCode:encoding:name:className:size:flags:]([SFObjCType alloc], "initWithCode:encoding:name:className:size:flags:", 0, CFSTR("c"), CFSTR("char"), 0, 1, 1);
  v19[0] = v18;
  v17 = -[SFObjCType initWithCode:encoding:name:className:size:flags:]([SFObjCType alloc], "initWithCode:encoding:name:className:size:flags:", 1, CFSTR("s"), CFSTR("short"), 0, 2, 1);
  v19[1] = v17;
  v16 = -[SFObjCType initWithCode:encoding:name:className:size:flags:]([SFObjCType alloc], "initWithCode:encoding:name:className:size:flags:", 2, CFSTR("i"), CFSTR("int"), 0, 4, 1);
  v19[2] = v16;
  v15 = -[SFObjCType initWithCode:encoding:name:className:size:flags:]([SFObjCType alloc], "initWithCode:encoding:name:className:size:flags:", 3, CFSTR("l"), CFSTR("long"), 0, 8, 1);
  v19[3] = v15;
  v14 = -[SFObjCType initWithCode:encoding:name:className:size:flags:]([SFObjCType alloc], "initWithCode:encoding:name:className:size:flags:", 4, CFSTR("q"), CFSTR("long long"), 0, 8, 1);
  v19[4] = v14;
  v13 = -[SFObjCType initWithCode:encoding:name:className:size:flags:]([SFObjCType alloc], "initWithCode:encoding:name:className:size:flags:", 5, CFSTR("C"), CFSTR("unsigned char"), 0, 1, 1);
  v19[5] = v13;
  v12 = -[SFObjCType initWithCode:encoding:name:className:size:flags:]([SFObjCType alloc], "initWithCode:encoding:name:className:size:flags:", 6, CFSTR("S"), CFSTR("unsigned short"), 0, 2, 1);
  v19[6] = v12;
  v0 = -[SFObjCType initWithCode:encoding:name:className:size:flags:]([SFObjCType alloc], "initWithCode:encoding:name:className:size:flags:", 7, CFSTR("I"), CFSTR("unsigned int"), 0, 4, 1);
  v19[7] = v0;
  v1 = -[SFObjCType initWithCode:encoding:name:className:size:flags:]([SFObjCType alloc], "initWithCode:encoding:name:className:size:flags:", 8, CFSTR("L"), CFSTR("unsigned long"), 0, 8, 1);
  v19[8] = v1;
  v2 = -[SFObjCType initWithCode:encoding:name:className:size:flags:]([SFObjCType alloc], "initWithCode:encoding:name:className:size:flags:", 9, CFSTR("Q"), CFSTR("unsigned long long"), 0, 8, 1);
  v19[9] = v2;
  v3 = -[SFObjCType initWithCode:encoding:name:className:size:flags:]([SFObjCType alloc], "initWithCode:encoding:name:className:size:flags:", 10, CFSTR("f"), CFSTR("float"), 0, 4, 2);
  v19[10] = v3;
  v4 = -[SFObjCType initWithCode:encoding:name:className:size:flags:]([SFObjCType alloc], "initWithCode:encoding:name:className:size:flags:", 11, CFSTR("d"), CFSTR("double"), 0, 8, 2);
  v19[11] = v4;
  v5 = -[SFObjCType initWithCode:encoding:name:className:size:flags:]([SFObjCType alloc], "initWithCode:encoding:name:className:size:flags:", 12, CFSTR("B"), CFSTR("BOOL"), 0, 1, 1);
  v19[12] = v5;
  v6 = -[SFObjCType initWithCode:encoding:name:className:size:flags:]([SFObjCType alloc], "initWithCode:encoding:name:className:size:flags:", 13, CFSTR("v"), CFSTR("void"), 0, 1, 0);
  v19[13] = v6;
  v7 = -[SFObjCType initWithCode:encoding:name:className:size:flags:]([SFObjCType alloc], "initWithCode:encoding:name:className:size:flags:", 14, CFSTR("*"), CFSTR("char*"), 0, 8, 0);
  v19[14] = v7;
  v8 = -[SFObjCType initWithCode:encoding:name:className:size:flags:]([SFObjCType alloc], "initWithCode:encoding:name:className:size:flags:", 15, CFSTR("@"), CFSTR("id"), 0, 8, 0);
  v19[15] = v8;
  v9 = -[SFObjCType initWithCode:encoding:name:className:size:flags:]([SFObjCType alloc], "initWithCode:encoding:name:className:size:flags:", 16, CFSTR("#"), CFSTR("Class"), 0, 8, 0);
  v19[16] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 17);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)_SFObjCTypesByCode;
  _SFObjCTypesByCode = v10;

}

@end
