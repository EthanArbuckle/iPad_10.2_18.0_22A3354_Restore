@implementation DYFunctionTracer

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    _floatFormatter = (uint64_t)objc_alloc_init(MEMORY[0x24BDD16F0]);
    objc_msgSend((id)_floatFormatter, "setNumberStyle:", 1);
    objc_msgSend((id)_floatFormatter, "setMinimumFractionDigits:", 0);
    objc_msgSend((id)_floatFormatter, "setMaximumFractionDigits:", 4);
    objc_msgSend((id)_floatFormatter, "setUsesGroupingSeparator:", 0);
  }
}

- (DYFunctionTracer)init
{
  char *v2;
  DYFunctionTracer *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DYFunctionTracer;
  v2 = -[DYFunctionTracer init](&v5, sel_init);
  v3 = (DYFunctionTracer *)v2;
  if (v2)
  {
    *((_WORD *)v2 + 28) = 0;
    *((_WORD *)v2 + 16) = 0;
    v2[34] = 1;
    *(_DWORD *)(v2 + 35) = 0;
    v2[39] = 1;
    *(_WORD *)(v2 + 41) = 0;
    v2[43] = 0;
    *((_QWORD *)v2 + 1) = objc_opt_new();
    v3->_nilString = (NSString *)CFSTR("nil");
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DYFunctionTracer;
  -[DYFunctionTracer dealloc](&v3, sel_dealloc);
}

- (void)setCompilable:(BOOL)a3
{
  BOOL compact;
  BOOL prependReceiverArgument;

  self->_compilable = a3;
  if (a3)
  {
    compact = 0;
    prependReceiverArgument = 0;
  }
  else
  {
    compact = self->_compact;
    prependReceiverArgument = self->_prependReceiverArgument;
  }
  self->_compactEffective = compact;
  self->_prependReceiverEffective = prependReceiverArgument;
}

- (void)setCompact:(BOOL)a3
{
  BOOL v3;

  self->_compact = a3;
  v3 = !self->_compilable && a3;
  self->_compactEffective = v3;
}

- (void)setPrependReceiverArgument:(BOOL)a3
{
  BOOL v3;

  self->_prependReceiverArgument = a3;
  v3 = !self->_compilable && a3;
  self->_prependReceiverEffective = v3;
}

- (id)_stringWithIntegerNumber:(id)a3 coreType:(unsigned int)a4
{
  id result;
  unsigned int v7;

  result = (id)objc_msgSend(a3, "stringValue");
  if (self->_emitTypeSuffixes)
  {
    if (a4 <= 0xC && ((1 << a4) & 0x1154) != 0)
      result = (id)objc_msgSend(result, "stringByAppendingString:", CFSTR("u"));
    v7 = a4 - 7;
    if (a4 - 7 <= 5 && ((0x33u >> v7) & 1) != 0)
      return (id)objc_msgSend(result, "stringByAppendingString:", off_250D629E8[v7]);
  }
  return result;
}

- (id)_stringWithNumber:(id)a3 argument:(const Argument *)a4
{
  unsigned __int16 var5;
  unsigned int var2;
  unint64_t v9;
  const __CFString *v10;
  NSString *v11;
  uint64_t v12;
  NSString *v13;
  unsigned int var1;
  float v16;
  BOOL v17;
  double v18;
  uint64_t v19;
  const __CFString *v20;
  void *v21;
  uint64_t v22;
  double v23;
  uint64_t v24;

  var5 = a4->var5;
  if ((var5 & 8) != 0)
  {
    v11 = -[DYFunctionTracer rewriteURL:](self, "rewriteURL:", objc_msgSend(a3, "unsignedLongValue"));
    goto LABEL_18;
  }
  if ((var5 & 0x10) != 0)
  {
    v11 = -[DYFunctionTracer rewriteVariable:](self, "rewriteVariable:", objc_msgSend(a3, "unsignedLongValue"));
    goto LABEL_18;
  }
  var2 = a4->var2;
  if (var2 == 14)
  {
    v12 = objc_msgSend(a3, "unsignedLongValue");
    if (!v12)
    {
LABEL_14:
      v11 = -[DYFunctionTracer nilString](self, "nilString");
      goto LABEL_18;
    }
    v11 = (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\"%@\"), objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v12));
LABEL_18:
    v13 = v11;
    goto LABEL_19;
  }
  if (var2 != 13)
    goto LABEL_21;
  v9 = objc_msgSend(a3, "unsignedLongLongValue");
  if (!v9)
    goto LABEL_14;
  if (HIDWORD(v9))
  {
    if (self->_emitTypeSuffixes)
      v10 = CFSTR("0x%llxl");
    else
      v10 = CFSTR("0x%llx");
  }
  else
  {
    v10 = CFSTR("0x%08llx");
  }
  v13 = (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v10, v9);
  if (self->_compilable)
  {
    v11 = (NSString *)objc_msgSend(CFSTR("(void*)"), "stringByAppendingString:", v13);
    goto LABEL_18;
  }
LABEL_19:
  if (v13)
    return v13;
LABEL_21:
  var1 = a4->var1;
  switch(var1)
  {
    case 0xDu:
      v19 = objc_msgSend(a3, "unsignedLongValue");
      if (v19)
      {
        if (self->_compilable)
          v20 = CFSTR("(void*)0x%016lx");
        else
          v20 = CFSTR("0x%016lx");
        return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v20, v19, v24);
      }
      else
      {
        return -[DYFunctionTracer nilString](self, "nilString");
      }
    case 0xAu:
      objc_msgSend(a3, "doubleValue");
      if (fabs(v18) == INFINITY)
      {
        v17 = v18 < 0.0;
LABEL_28:
        if (v17)
          return CFSTR("-INFINITY");
        else
          return CFSTR("INFINITY");
      }
      if (self->_compilable && self->_useHexadecimalFloatFormat)
        return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%a /* %0.16F */"), *(_QWORD *)&v18, *(_QWORD *)&v18);
      if (self->_compactFloats)
      {
        v21 = (void *)_floatFormatter;
        v22 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
        return (id)objc_msgSend(v21, "stringFromNumber:", v22);
      }
      if (self->_emitTypeSuffixes)
        return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%0.16Ff"), *(_QWORD *)&v18, v24);
      else
        return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%0.16F"), *(_QWORD *)&v18, v24);
    case 9u:
      objc_msgSend(a3, "floatValue");
      if (fabsf(v16) == INFINITY)
      {
        v17 = v16 < 0.0;
        goto LABEL_28;
      }
      if (self->_compilable && self->_useHexadecimalFloatFormat)
        return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%a /* %0.7F */"), v16, v16);
      if (self->_compactFloats)
      {
        v21 = (void *)_floatFormatter;
        v22 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:");
        return (id)objc_msgSend(v21, "stringFromNumber:", v22);
      }
      v23 = v16;
      if (self->_emitTypeSuffixes)
        return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%0.7Ff"), *(_QWORD *)&v23, v24);
      else
        return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%0.7F"), *(_QWORD *)&v23, v24);
    default:
      return -[DYFunctionTracer _stringWithIntegerNumber:coreType:](self, "_stringWithIntegerNumber:coreType:", a3);
  }
}

- (void)_enumerateScalar1DArrayArgumentValues:(const Argument *)a3 usingBlock:(id)a4
{
  _QWORD *var0;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  void *v15;
  unint64_t v16;
  void *v17;
  unint64_t v18;
  void *v19;
  unint64_t v20;
  void *v21;
  unint64_t v22;
  void *v23;
  unint64_t v24;
  void *v25;
  unint64_t v26;
  void *v27;
  unint64_t v28;
  void *v29;
  unint64_t v30;
  void *v31;
  unint64_t v32;
  id v33;
  double v34;
  void *v35;
  unint64_t v36;
  void *v37;
  unint64_t v38;
  void *v39;

  var0 = a3->var0;
  if (a3->var0)
  {
    if (a3->var2 == 14 || (a3->var5 & 0x18) != 0)
    {
      v7 = GPUTools::FD::Argument::ViewAsCStringArray((GPUTools::FD::Argument *)a3);
      if (a3->var4)
      {
        v8 = v7;
        v9 = 0;
        do
        {
          v10 = objc_alloc(MEMORY[0x24BDD16E0]);
          v11 = *(_QWORD *)v8;
          if ((*(_WORD *)(v8 + 22) & 0x40) != 0)
            v12 = *(unsigned int *)(v11 + 4 * v9) + v11;
          else
            v12 = *(_QWORD *)(v11 + 8 * v9);
          v13 = (void *)objc_msgSend(v10, "initWithUnsignedLong:", v12);
          (*((void (**)(id, void *, BOOL))a4 + 2))(a4, v13, (_DWORD)v9 == a3->var4 - 1);

          ++v9;
        }
        while (v9 < a3->var4);
      }
    }
    else
    {
      switch(a3->var1)
      {
        case 1u:
          if (a3->var4)
          {
            v16 = 0;
            do
            {
              v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithChar:", *((char *)var0 + v16));
              (*((void (**)(id, void *, BOOL))a4 + 2))(a4, v17, (_DWORD)v16 == a3->var4 - 1);

              ++v16;
            }
            while (v16 < a3->var4);
          }
          break;
        case 2u:
          if (a3->var4)
          {
            v18 = 0;
            do
            {
              v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedChar:", *((unsigned __int8 *)var0 + v18));
              (*((void (**)(id, void *, BOOL))a4 + 2))(a4, v19, (_DWORD)v18 == a3->var4 - 1);

              ++v18;
            }
            while (v18 < a3->var4);
          }
          break;
        case 3u:
          if (a3->var4)
          {
            v20 = 0;
            do
            {
              v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithShort:", *((__int16 *)var0 + v20));
              (*((void (**)(id, void *, BOOL))a4 + 2))(a4, v21, (_DWORD)v20 == a3->var4 - 1);

              ++v20;
            }
            while (v20 < a3->var4);
          }
          break;
        case 4u:
          if (a3->var4)
          {
            v22 = 0;
            do
            {
              v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedShort:", *((unsigned __int16 *)var0 + v22));
              (*((void (**)(id, void *, BOOL))a4 + 2))(a4, v23, (_DWORD)v22 == a3->var4 - 1);

              ++v22;
            }
            while (v22 < a3->var4);
          }
          break;
        case 5u:
          if (a3->var4)
          {
            v24 = 0;
            do
            {
              v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", *((unsigned int *)var0 + v24));
              (*((void (**)(id, void *, BOOL))a4 + 2))(a4, v25, (_DWORD)v24 == a3->var4 - 1);

              ++v24;
            }
            while (v24 < a3->var4);
          }
          break;
        case 6u:
          if (a3->var4)
          {
            v26 = 0;
            do
            {
              v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInt:", *((unsigned int *)var0 + v26));
              (*((void (**)(id, void *, BOOL))a4 + 2))(a4, v27, (_DWORD)v26 == a3->var4 - 1);

              ++v26;
            }
            while (v26 < a3->var4);
          }
          break;
        case 7u:
          if (a3->var4)
          {
            v28 = 0;
            do
            {
              v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithLongLong:", var0[v28]);
              (*((void (**)(id, void *, BOOL))a4 + 2))(a4, v29, (_DWORD)v28 == a3->var4 - 1);

              ++v28;
            }
            while (v28 < a3->var4);
          }
          break;
        case 8u:
          if (a3->var4)
          {
            v30 = 0;
            do
            {
              v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedLongLong:", var0[v30]);
              (*((void (**)(id, void *, BOOL))a4 + 2))(a4, v31, (_DWORD)v30 == a3->var4 - 1);

              ++v30;
            }
            while (v30 < a3->var4);
          }
          break;
        case 9u:
          if (a3->var4)
          {
            v32 = 0;
            do
            {
              v33 = objc_alloc(MEMORY[0x24BDD16E0]);
              LODWORD(v34) = *((_DWORD *)var0 + v32);
              v35 = (void *)objc_msgSend(v33, "initWithFloat:", v34);
              (*((void (**)(id, void *, BOOL))a4 + 2))(a4, v35, (_DWORD)v32 == a3->var4 - 1);

              ++v32;
            }
            while (v32 < a3->var4);
          }
          break;
        case 0xAu:
          if (a3->var4)
          {
            v36 = 0;
            do
            {
              v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithDouble:", *(double *)&var0[v36]);
              (*((void (**)(id, void *, BOOL))a4 + 2))(a4, v37, (_DWORD)v36 == a3->var4 - 1);

              ++v36;
            }
            while (v36 < a3->var4);
          }
          break;
        case 0xBu:
          if (a3->var4)
          {
            v38 = 0;
            do
            {
              v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithLong:", var0[v38]);
              (*((void (**)(id, void *, BOOL))a4 + 2))(a4, v39, (_DWORD)v38 == a3->var4 - 1);

              ++v38;
            }
            while (v38 < a3->var4);
          }
          break;
        case 0xCu:
        case 0xDu:
          if (a3->var4)
          {
            v14 = 0;
            do
            {
              v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedLong:", var0[v14]);
              (*((void (**)(id, void *, BOOL))a4 + 2))(a4, v15, (_DWORD)v14 == a3->var4 - 1);

              ++v14;
            }
            while (v14 < a3->var4);
          }
          break;
        default:
          dy_abort("invalid core type: %u", a3->var1);
      }
    }
  }
}

- (id)_stringForScalar1DArrayArgument:(const Argument *)a3 usingBlock:(id)a4
{
  uint64_t v7;
  void *v8;
  _QWORD v10[7];

  v7 = objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", CFSTR("{"));
  v8 = (void *)v7;
  if (!a4)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __63__DYFunctionTracer__stringForScalar1DArrayArgument_usingBlock___block_invoke;
    v10[3] = &unk_250D62950;
    v10[4] = v7;
    v10[5] = self;
    v10[6] = a3;
    a4 = v10;
  }
  -[DYFunctionTracer _enumerateScalar1DArrayArgumentValues:usingBlock:](self, "_enumerateScalar1DArrayArgumentValues:usingBlock:", a3, a4);
  objc_msgSend(v8, "appendString:", CFSTR("}"));
  return v8;
}

uint64_t __63__DYFunctionTracer__stringForScalar1DArrayArgument_usingBlock___block_invoke(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "appendString:", objc_msgSend(*(id *)(a1 + 40), "_stringWithNumber:argument:", a2, *(_QWORD *)(a1 + 48)));
  if ((a3 & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(", "));
  return result;
}

- (id)_newNumberForScalarArgument:(const Argument *)a3
{
  id v5;
  double v6;
  id v7;
  void *var0;

  switch(a3->var1)
  {
    case 1u:
      return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithChar:", *(char *)a3->var0);
    case 2u:
      return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedChar:", *(unsigned __int8 *)a3->var0);
    case 3u:
      return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithShort:", *(__int16 *)a3->var0);
    case 4u:
      return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedShort:", *(unsigned __int16 *)a3->var0);
    case 5u:
      return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", *(unsigned int *)a3->var0);
    case 6u:
      return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInt:", *(unsigned int *)a3->var0);
    case 7u:
      return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithLongLong:", *(_QWORD *)a3->var0);
    case 8u:
      return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedLongLong:", *(_QWORD *)a3->var0);
    case 9u:
      v5 = objc_alloc(MEMORY[0x24BDD16E0]);
      LODWORD(v6) = *(_DWORD *)a3->var0;
      return (id)objc_msgSend(v5, "initWithFloat:", v6);
    case 0xAu:
      return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithDouble:", *(double *)a3->var0);
    case 0xBu:
      return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithLong:", *(_QWORD *)a3->var0);
    case 0xCu:
      v7 = objc_alloc(MEMORY[0x24BDD16E0]);
      var0 = *(void **)a3->var0;
      return (id)objc_msgSend(v7, "initWithUnsignedLong:", var0);
    case 0xDu:
      v7 = objc_alloc(MEMORY[0x24BDD16E0]);
      var0 = a3->var0;
      return (id)objc_msgSend(v7, "initWithUnsignedLong:", var0);
    default:
      dy_abort("invalid core type: %u", a3->var1);
  }
}

- (id)_stringForScalarArgument:(const Argument *)a3
{
  id v5;
  id v6;

  v5 = -[DYFunctionTracer _newNumberForScalarArgument:](self, "_newNumberForScalarArgument:");
  v6 = -[DYFunctionTracer _stringWithNumber:argument:](self, "_stringWithNumber:argument:", v5, a3);

  return v6;
}

- (id)typeStringForArgument:(const Argument *)a3
{
  unsigned int *p_var2;
  uint64_t v5;
  DYFunctionTracerDelegate *delegate;
  __CFString *v7;
  unsigned int var2;
  const __CFString *v9;

  if ((a3->var5 & 0x18) != 0)
    p_var2 = &a3->var2;
  else
    p_var2 = &a3->var1;
  v5 = *p_var2;
  delegate = self->_delegate;
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (v7 = (__CFString *)-[DYFunctionTracerDelegate typeStringForArgumentType:](delegate, "typeStringForArgumentType:", v5)) == 0)
  {
    if (v5 >= 0xE)
      dy_abort("invalid core type: %u", v5);
    v7 = off_250D62A18[(int)v5];
  }
  var2 = a3->var2;
  if (var2 == 14)
  {
    v9 = CFSTR("char*");
  }
  else if (var2 == 13)
  {
    v9 = CFSTR("void*");
  }
  else
  {
    v9 = v7;
  }
  if ((a3->var5 & 4) != 0)
    return (id)objc_msgSend(CFSTR("const "), "stringByAppendingString:", v9);
  else
    return (id)v9;
}

- (id)valueStringForArgument:(const Argument *)a3
{
  unsigned __int16 var5;
  id v7;
  void *v8;
  _QWORD v9[6];

  if (a3->var2 == 16)
    return (id)objc_msgSend(a3->var0, "description");
  var5 = a3->var5;
  if ((var5 & 8) != 0)
  {
    if ((var5 & 1) != 0)
    {
      v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __43__DYFunctionTracer_valueStringForArgument___block_invoke;
      v9[3] = &unk_250D62978;
      v9[4] = self;
      v9[5] = v7;
      -[DYFunctionTracer _enumerateScalar1DArrayArgumentValues:usingBlock:](self, "_enumerateScalar1DArrayArgumentValues:usingBlock:", a3, v9);
      v8 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("{%@}"), objc_msgSend(v7, "componentsJoinedByString:", CFSTR(", ")));

      return v8;
    }
    else
    {
      return -[DYFunctionTracer rewriteURL:](self, "rewriteURL:", a3->var0);
    }
  }
  else if ((var5 & 1) != 0)
  {
    return -[DYFunctionTracer _stringForScalar1DArrayArgument:usingBlock:](self, "_stringForScalar1DArrayArgument:usingBlock:", a3, 0);
  }
  else
  {
    if ((var5 & 2) != 0)
      dy_abort("FIXME: 2D array of scalars are not implemented in the tracer", a2);
    return -[DYFunctionTracer _stringForScalarArgument:](self, "_stringForScalarArgument:", a3);
  }
}

uint64_t __43__DYFunctionTracer_valueStringForArgument___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 40), "addObject:", objc_msgSend(*(id *)(a1 + 32), "rewriteURL:", objc_msgSend(a2, "unsignedLongValue")));
}

- (id)valueForArgument:(const Argument *)a3
{
  unsigned int var5;
  unsigned int var1;
  BOOL v7;
  int v8;
  uint64_t v10;
  uint64_t v12;
  void *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, void *);
  void *v23;
  uint64_t v24;

  var5 = a3->var5;
  var1 = a3->var1;
  if (a3->var5)
    v7 = 1;
  else
    v7 = var1 == 13;
  if (!v7)
    return -[DYFunctionTracer _newNumberForScalarArgument:](self, "_newNumberForScalarArgument:", a3);
  if ((var5 & 1) == 0)
  {
    v7 = var1 == 13;
    v8 = (var5 >> 1) & 1;
    if (v7)
      v8 = 1;
    if (v8 != 1 || a3->var0 != 0)
    {
      if (a3->var5 || a3->var2 != 14)
        return -[DYFunctionTracer valueStringForArgument:](self, "valueStringForArgument:", a3);
      v10 = objc_msgSend(-[DYFunctionTracer _newNumberForScalarArgument:](self, "_newNumberForScalarArgument:", a3), "unsignedLongValue");
      return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v10);
    }
    return (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  }
  if (!a3->var0)
    return (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v12 = objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v13 = (void *)v12;
  if (a3->var2 == 14 || (a3->var5 & 0x18) != 0)
  {
    v20 = MEMORY[0x24BDAC760];
    v21 = 3221225472;
    v22 = __37__DYFunctionTracer_valueForArgument___block_invoke;
    v23 = &unk_250D629A0;
    v24 = v12;
    v14 = &v20;
  }
  else
  {
    v15 = MEMORY[0x24BDAC760];
    v16 = 3221225472;
    v17 = __37__DYFunctionTracer_valueForArgument___block_invoke_2;
    v18 = &unk_250D629A0;
    v19 = v12;
    v14 = &v15;
  }
  -[DYFunctionTracer _enumerateScalar1DArrayArgumentValues:usingBlock:](self, "_enumerateScalar1DArrayArgumentValues:usingBlock:", a3, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24);
  return v13;
}

uint64_t __37__DYFunctionTracer_valueForArgument___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;

  v3 = objc_msgSend(a2, "unsignedLongValue");
  v4 = *(void **)(a1 + 32);
  if (v3)
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v3, 1);
  else
    v5 = objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  return objc_msgSend(v4, "addObject:", v5);
}

uint64_t __37__DYFunctionTracer_valueForArgument___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)traceFunction:(const Function *)a3 error:(id *)a4
{
  return -[DYFunctionTracer traceFunction:returnVariable:error:](self, "traceFunction:returnVariable:error:", a3, 0, a4);
}

- (id)traceFunction:(const Function *)a3 returnVariable:(id)a4 error:(id *)a5
{
  return (id)objc_msgSend(-[DYFunctionTracer traceFunctionAsLines:returnVariable:error:](self, "traceFunctionAsLines:returnVariable:error:", a3, a4, a5), "componentsJoinedByString:", CFSTR("\n"));
}

- (id)traceFunctionAsLines:(const Function *)a3 returnVariable:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  char *v11;
  id v12;
  id v13;
  __int16 v14;
  id v15;
  id v16;
  void *v17;
  uint64_t buffer_counter;
  id v19;
  id v20;
  DYFunctionTracerDelegate *delegate;
  uint64_t v22;
  void *v23;
  id v24;
  std::string *p_p;
  DYFunctionTracerDelegate *v26;
  id v27;
  id v28;
  void *v29;
  int v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  const Function *v34;
  unint64_t v35;
  unsigned int v36;
  const Function *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  uint64_t v42;
  id v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t j;
  int **v49;
  id v50;
  int v51;
  char *v53;
  const Function *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  char *v63;
  _QWORD v64[9];
  std::string __p;
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v50 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v51 = *(_DWORD *)a3;
  -[DYFunctionTracer _setCurrentReceiver:](self, "_setCurrentReceiver:", a3);
  if ((self->_compilable || !self->_emitHiddenReceiverArgument)
    && -[DYFunctionTracer _skipFirstArgumentForFunction:](self, "_skipFirstArgumentForFunction:", a3))
  {
    v10 = -[DYFunctionTracer rewriteArgument:](self, "rewriteArgument:", (char *)a3 + 48);
    if (v10)
      objc_msgSend(v9, "addObject:", v10);
    v11 = (char *)a3 + 72;
  }
  else
  {
    v11 = (char *)a3 + 48;
  }
  v53 = (char *)a3 + 24 * *((unsigned __int16 *)a3 + 5) + 48;
  v54 = a3;
  if (v11 != v53)
  {
    v49 = (int **)((char *)a3 + 72);
    while (1)
    {
      v12 = -[DYFunctionTracer rewriteArgument:](self, "rewriteArgument:", v11);
      v13 = -[DYFunctionTracer getCastForArgument:inFunction:](self, "getCastForArgument:inFunction:", v11, a3);
      if (v12)
        goto LABEL_11;
      if (*((_DWORD *)v11 + 3) == 16)
      {
        objc_msgSend(v9, "addObject:", objc_msgSend(*(id *)v11, "description"));
      }
      else
      {
        if (v51 == -12272 && v11 == (char *)v49)
        {
          DYInternalDataTypeAsString(**v49, &__p);
          if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            p_p = &__p;
          else
            p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
          objc_msgSend(v9, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", p_p, 1));
          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
            operator delete(__p.__r_.__value_.__l.__data_);
          goto LABEL_14;
        }
        v14 = *((_WORD *)v11 + 11);
        if ((v14 & 8) == 0)
        {
          if ((v14 & 1) != 0)
          {
            if (self->_compilable)
            {
              v20 = -[DYFunctionTracer nextArrayVariable](self, "nextArrayVariable");
              delegate = self->_delegate;
              if ((objc_opt_respondsToSelector() & 1) != 0
                && (v22 = -[DYFunctionTracerDelegate generateArrayVariable:ForArgument:](delegate, "generateArrayVariable:ForArgument:", v20, v11)) != 0)
              {
                objc_msgSend(v8, "addObject:", v22);
              }
              else
              {
                objc_msgSend(v8, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@[%u] = %@;"),
                    -[DYFunctionTracer typeStringForArgument:](self, "typeStringForArgument:", v11),
                    v20,
                    *((unsigned __int16 *)v11 + 10),
                    -[DYFunctionTracer _stringForScalar1DArrayArgument:usingBlock:](self, "_stringForScalar1DArrayArgument:usingBlock:", v11, 0)));
              }
            }
            else
            {
              v20 = -[DYFunctionTracer _stringForScalar1DArrayArgument:usingBlock:](self, "_stringForScalar1DArrayArgument:usingBlock:", v11, 0);
            }
            objc_msgSend(v9, "addObject:", v20);
          }
          else
          {
            if ((v14 & 2) != 0)
            {

              dy_abort("FIXME: 2D array of scalars are not implemented in the tracer");
            }
            objc_msgSend(v9, "addObject:", -[DYFunctionTracer _stringForScalarArgument:](self, "_stringForScalarArgument:", v11));
          }
          goto LABEL_14;
        }
        v15 = -[DYFunctionTracer typeStringForArgument:](self, "typeStringForArgument:", v11);
        if ((*((_WORD *)v11 + 11) & 1) != 0)
        {
          v23 = (void *)objc_opt_new();
          v64[0] = MEMORY[0x24BDAC760];
          v64[1] = 3221225472;
          v64[2] = __62__DYFunctionTracer_traceFunctionAsLines_returnVariable_error___block_invoke;
          v64[3] = &unk_250D629C8;
          v64[4] = self;
          v64[5] = v8;
          v64[6] = v15;
          v64[7] = v50;
          v64[8] = v23;
          -[DYFunctionTracer _enumerateScalar1DArrayArgumentValues:usingBlock:](self, "_enumerateScalar1DArrayArgumentValues:usingBlock:", v11, v64);
          if (self->_compilable)
          {
            v24 = -[DYFunctionTracer nextArrayVariable](self, "nextArrayVariable");
            objc_msgSend(v8, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@* %@[%u] = {%@};"),
                v15,
                v24,
                *((unsigned __int16 *)v11 + 10),
                objc_msgSend(v23, "componentsJoinedByString:", CFSTR(", "))));
          }
          else
          {
            v24 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("{%@}"), objc_msgSend(v23, "componentsJoinedByString:", CFSTR(", ")));
          }
          objc_msgSend(v9, "addObject:", v24);

          goto LABEL_14;
        }
        v16 = -[DYFunctionTracer rewriteURL:](self, "rewriteURL:", *(_QWORD *)v11);
        if (v16 != -[DYFunctionTracer nilString](self, "nilString"))
        {
          if (self->_compilable)
          {
            v17 = (void *)MEMORY[0x24BDD17C8];
            buffer_counter = self->buffer_counter;
            self->buffer_counter = buffer_counter + 1;
            v12 = (id)objc_msgSend(v17, "stringWithFormat:", CFSTR("buffer%u"), buffer_counter);
            if (self->_emitDataIndices)
            {
              v19 = -[DYFunctionTracer getIndexFromURL:](self, "getIndexFromURL:", v16);
              objc_msgSend(v8, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@* %@ = (%@*)DyGen::get_preloaded_data(%@);//d"),
                  v15,
                  v12,
                  v15,
                  v19));
            }
            else
            {
              objc_msgSend(v8, "addObject:", -[DYFunctionTracer loadStringForURL:variableName:bufferType:](self, "loadStringForURL:variableName:bufferType:", v16, v12, v15));
              objc_msgSend(v50, "addObject:", -[DYFunctionTracer unloadStringForURL:](self, "unloadStringForURL:", v16));
            }
          }
          else
          {
            v12 = v16;
          }
LABEL_11:
          objc_msgSend(v9, "addObject:", v12);
          goto LABEL_14;
        }
        objc_msgSend(v9, "addObject:", -[DYFunctionTracer nilString](self, "nilString"));
      }
LABEL_14:
      if (v13
        && (objc_msgSend((id)objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v9, "count") - 1), "isEqualToString:", -[DYFunctionTracer nilString](self, "nilString")) & 1) == 0)
      {
        objc_msgSend(v9, "setObject:atIndexedSubscript:", objc_msgSend(v13, "stringByAppendingString:", objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v9, "count") - 1)), objc_msgSend(v9, "count") - 1);
      }
      objc_msgSend(v9, "setObject:atIndexedSubscript:", -[DYFunctionTracer createArgument:forFunction:withValue:](self, "createArgument:forFunction:withValue:", v11, a3, objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v9, "count") - 1)), objc_msgSend(v9, "count") - 1);
      v11 += 24;
      if (v11 == v53)
      {
        v11 = v53;
        break;
      }
    }
  }
  v26 = self->_delegate;
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (v27 = (id)-[DYFunctionTracerDelegate constructTraceLinesWithFunction:arguments:](v26, "constructTraceLinesWithFunction:arguments:", a3, v9)) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0
      || (v28 = (id)-[DYFunctionTracerDelegate constructTraceLineWithFunction:arguments:](v26, "constructTraceLineWithFunction:arguments:", a3, v9)) == 0|| (v27 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 1), objc_msgSend(v27, "addObject:", v28), v28, !v27))
    {
      v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithCapacity:", 200);
      if (self->_prependReceiverEffective)
        -[DYFunctionTracer _prependReceiver:function:](self, "_prependReceiver:function:", v29, a3);
      v63 = v11;
      -[DYFunctionTracer _appendTraceLine:withFunction:iterArgument:argumentStrings:returnVariable:](self, "_appendTraceLine:withFunction:iterArgument:argumentStrings:returnVariable:", v29, a3, &v63, v9, a4);
      if (self->_compilable)
        objc_msgSend(v29, "appendString:", CFSTR(";"));
      v27 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 1);
      objc_msgSend(v27, "addObject:", v29);

    }
  }
  if (self->_emitFunctionComments)
  {
    v30 = *((_DWORD *)a3 + 1);
    if ((v30 & 0x40) != 0)
    {
      v31 = CFSTR(" /* internal to GPUTools */");
    }
    else
    {
      if ((v30 & 4) == 0)
      {
        if ((v30 & 0x200) == 0)
        {
          if ((v30 & 0x80000) == 0)
          {
            if ((v30 & 0x40000) == 0)
              goto LABEL_86;
            goto LABEL_81;
          }
          goto LABEL_76;
        }
        goto LABEL_71;
      }
      v31 = CFSTR(" /* inserted by GPUTools */");
    }
    v32 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", v31);
    v33 = v32;
    v34 = a3;
    if ((*((_BYTE *)a3 + 5) & 2) == 0)
      goto LABEL_73;
    if (v32)
    {
      objc_msgSend(v32, "appendString:", CFSTR(" /* state mirror skip */"));
LABEL_72:
      v34 = a3;
LABEL_73:
      if ((*((_BYTE *)v34 + 6) & 8) == 0)
      {
LABEL_78:
        if ((*((_BYTE *)v34 + 6) & 4) == 0)
          goto LABEL_82;
        if (v33)
        {
          objc_msgSend(v33, "appendString:", CFSTR(" /* frame boundary */"));
LABEL_83:
          if (objc_msgSend(v27, "count"))
          {
            v35 = 0;
            v36 = 1;
            do
            {
              objc_msgSend(v27, "replaceObjectAtIndex:withObject:", v35, objc_msgSend((id)objc_msgSend(v27, "objectAtIndex:", v35), "stringByAppendingString:", v33));
              v35 = v36++;
            }
            while (objc_msgSend(v27, "count") > v35);
          }
          goto LABEL_86;
        }
LABEL_81:
        v33 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR(" /* frame boundary */"));
LABEL_82:
        if (!v33)
          goto LABEL_86;
        goto LABEL_83;
      }
      if (v33)
      {
        objc_msgSend(v33, "appendString:", CFSTR(" /* apple internal resource */"));
LABEL_77:
        v34 = a3;
        goto LABEL_78;
      }
LABEL_76:
      v33 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR(" /* apple internal resource */"));
      goto LABEL_77;
    }
LABEL_71:
    v33 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR(" /* state mirror skip */"));
    goto LABEL_72;
  }
LABEL_86:
  objc_msgSend(v8, "addObjectsFromArray:", v27);

  objc_msgSend(v8, "addObjectsFromArray:", v50);
  v37 = v54;
  if ((*((_BYTE *)v54 + 4) & 2) != 0 && self->_emitFunctionComments)
  {
    v38 = (void *)objc_opt_new();
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v39 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
    if (v39)
    {
      v40 = *(_QWORD *)v60;
      do
      {
        for (i = 0; i != v39; ++i)
        {
          if (*(_QWORD *)v60 != v40)
            objc_enumerationMutation(v8);
          objc_msgSend(v38, "addObject:", objc_msgSend(CFSTR("//"), "stringByAppendingString:", *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * i)));
        }
        v39 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
      }
      while (v39);
    }

    v37 = v54;
  }
  else
  {
    v38 = v8;
  }
  if (self->_emitErrors)
  {
    -[DYFunctionTracer _emitErrors:function:](self, "_emitErrors:function:", v38, v37);
    v37 = v54;
  }
  if (self->_emitAssociatedFunctions && *((_QWORD *)v37 + 65))
  {
    self->_emitAssociatedFunctions = 0;
    objc_msgSend(v38, "addObject:", CFSTR("{"));
    v42 = *((_QWORD *)v54 + 65);
    if (v42)
    {
      while (1)
      {
        v43 = -[DYFunctionTracer traceFunctionAsLines:returnVariable:error:](self, "traceFunctionAsLines:returnVariable:error:", v42, 0, a5);
        v44 = v43;
        if (!v43)
          break;
        v57 = 0u;
        v58 = 0u;
        v55 = 0u;
        v56 = 0u;
        v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v55, v66, 16);
        if (v45)
        {
          v46 = *(_QWORD *)v56;
          do
          {
            for (j = 0; j != v45; ++j)
            {
              if (*(_QWORD *)v56 != v46)
                objc_enumerationMutation(v44);
              objc_msgSend(v38, "addObject:", objc_msgSend(CFSTR("    "), "stringByAppendingString:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * j)));
            }
            v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v55, v66, 16);
          }
          while (v45);
        }
        v42 = *(_QWORD *)(v42 + 520);
        if (!v42)
          goto LABEL_113;
      }

      v38 = 0;
    }
LABEL_113:
    objc_msgSend(v38, "addObject:", CFSTR("}"));
    self->_emitAssociatedFunctions = 1;
  }

  return v38;
}

uint64_t __62__DYFunctionTracer_traceFunctionAsLines_returnVariable_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;

  v3 = objc_msgSend(*(id *)(a1 + 32), "rewriteURL:", objc_msgSend(a2, "unsignedLongValue"));
  if (v3 == objc_msgSend(*(id *)(a1 + 32), "nilString"))
  {
    v13 = *(void **)(a1 + 64);
    v14 = objc_msgSend(*(id *)(a1 + 32), "nilString");
    v15 = v13;
  }
  else
  {
    v4 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v4 + 56))
    {
      v5 = (void *)MEMORY[0x24BDD17C8];
      v6 = *(unsigned int *)(v4 + 28);
      *(_DWORD *)(v4 + 28) = v6 + 1;
      v7 = objc_msgSend(v5, "stringWithFormat:", CFSTR("buffer%u"), v6);
      v8 = *(_BYTE **)(a1 + 32);
      if (v8[38])
      {
        v9 = objc_msgSend(v8, "getIndexFromURL:", v3);
        v10 = *(void **)(a1 + 40);
        v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@* %@ = (%@*)DyGen::get_preloaded_data(%@);//c"),
                *(_QWORD *)(a1 + 48),
                v7,
                *(_QWORD *)(a1 + 48),
                v9);
        v12 = v10;
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 40), "addObject:", objc_msgSend(v8, "loadStringForURL:variableName:bufferType:", v3, v7, *(_QWORD *)(a1 + 48)));
        v16 = *(void **)(a1 + 56);
        v11 = objc_msgSend(*(id *)(a1 + 32), "unloadStringForURL:", v3);
        v12 = v16;
      }
      objc_msgSend(v12, "addObject:", v11);
    }
    else
    {
      v7 = v3;
    }
    v15 = *(void **)(a1 + 64);
    v14 = v7;
  }
  return objc_msgSend(v15, "addObject:", v14);
}

- (id)loadStringForURL:(id)a3 variableName:(id)a4 bufferType:(id)a5
{
  DYFunctionTracerDelegate *delegate;

  delegate = self->_delegate;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return (id)-[DYFunctionTracerDelegate loadStringForURL:variableName:bufferType:](delegate, "loadStringForURL:variableName:bufferType:", a3, a4, a5);
  else
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@* %@ = (%@*)DyGen::load_url(\"%@\");"),
                 a5,
                 a4,
                 a5,
                 a3);
}

- (id)unloadStringForURL:(id)a3
{
  DYFunctionTracerDelegate *delegate;

  delegate = self->_delegate;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return (id)-[DYFunctionTracerDelegate unloadStringForURL:](delegate, "unloadStringForURL:", a3);
  else
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("DyGen::unload_url(\"%@\");"), a3);
}

- (id)rewriteVariable:(const char *)a3
{
  DYFunctionTracerDelegate *delegate;
  void *v6;
  uint64_t v8;

  delegate = self->_delegate;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = (void *)-[DYFunctionTracerDelegate rewriteVariable:receiver:](delegate, "rewriteVariable:receiver:", a3, self->_currentReceiverID);
  else
    v6 = 0;
  if (objc_msgSend(v6, "length"))
    return v6;
  if (self->_emitVariables || self->_compilable)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a3);
  v8 = -[DYFunctionTracer _objectNameFromVariable:](self, "_objectNameFromVariable:", a3);
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%u"), v8);
}

- (id)rewriteURL:(const char *)a3
{
  DYFunctionTracerDelegate *delegate;
  id result;

  if (a3 && *a3)
  {
    delegate = self->_delegate;
    if ((objc_opt_respondsToSelector() & 1) == 0)
      return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", a3, 1);
    result = (id)-[DYFunctionTracerDelegate rewriteURL:](delegate, "rewriteURL:", a3);
    if (!result)
      return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", a3, 1);
  }
  else
  {
    result = -[DYFunctionTracer nilString](self, "nilString");
    if (!result)
      return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", a3, 1);
  }
  return result;
}

- (id)rewriteReceiver:(unint64_t)a3
{
  DYFunctionTracerDelegate *delegate;
  id result;

  delegate = self->_delegate;
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (result = (id)-[DYFunctionTracerDelegate rewriteReceiver:](delegate, "rewriteReceiver:", a3)) == 0)
  {
    if (self->_compilable)
      return -[DYFunctionTracer variableForReceiverID:](self, "variableForReceiverID:", a3);
    else
      return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("0x%llx"), a3);
  }
  return result;
}

- (id)createArgument:(const Argument *)a3 forFunction:(const Function *)a4 withValue:(id)a5
{
  DYFunctionTracerDelegate *delegate;

  delegate = self->_delegate;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return (id)-[DYFunctionTracerDelegate createArgument:forFunction:withValue:](delegate, "createArgument:forFunction:withValue:", a3, a4, a5);
  else
    return a5;
}

- (id)getCastForArgument:(const Argument *)a3 inFunction:(const Function *)a4
{
  DYFunctionTracerDelegate *delegate;

  delegate = self->_delegate;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return (id)-[DYFunctionTracerDelegate getCastForArgument:inFunction:](delegate, "getCastForArgument:inFunction:", a3, a4);
  else
    return 0;
}

- (id)rewriteArgument:(const Argument *)a3
{
  DYFunctionTracerDelegate *delegate;

  delegate = self->_delegate;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return (id)-[DYFunctionTracerDelegate rewriteArgument:](delegate, "rewriteArgument:", a3);
  else
    return 0;
}

- (id)nextArrayVariable
{
  void *v2;
  uint64_t array_counter;

  v2 = (void *)MEMORY[0x24BDD17C8];
  array_counter = self->array_counter;
  self->array_counter = array_counter + 1;
  return (id)objc_msgSend(v2, "stringWithFormat:", CFSTR("array%u"), array_counter);
}

- (id)getIndexFromURL:(id)a3
{
  void *v5;

  v5 = (void *)-[NSMutableDictionary objectForKey:](self->urlIndices, "objectForKey:");
  if (!v5)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", -[NSMutableDictionary count](self->urlIndices, "count"));
    -[NSMutableDictionary setObject:forKey:](self->urlIndices, "setObject:forKey:", v5, a3);
  }
  return v5;
}

- (BOOL)_skipFirstArgumentForFunction:(const Function *)a3
{
  return *(_DWORD *)a3 == -12272;
}

- (void)_appendReturnValueToTraceLine:(id)a3 withFunction:(const Function *)a4 iterArgument:(array_iterator<const GPUTools:(id)a6 :(id)a7 FD::Argument>)a5 argumentStrings:returnVariable:
{
  char *v12;
  DYFunctionTracerDelegate *delegate;
  id v14;
  id v15;
  const __CFString *v16;

  if (*((_DWORD *)a4 + 8))
  {
    v12 = (char *)a4 + 24;
    delegate = self->_delegate;
    if ((objc_opt_respondsToSelector() & 1) == 0
      || (v14 = (id)-[DYFunctionTracerDelegate rewriteArgument:](delegate, "rewriteArgument:", v12)) == 0)
    {
      v14 = a7;
      if (!a7)
      {
        if (*((_DWORD *)a4 + 9) == 16)
        {
          v15 = (id)objc_msgSend(*(id *)a5.var0->var0, "description", 0);
        }
        else
        {
          if (self->_compilable && (*((_WORD *)a4 + 23) & 0x10) == 0)
            return;
          v15 = -[DYFunctionTracer valueStringForArgument:](self, "valueStringForArgument:", v12);
        }
        v14 = v15;
        if (!v15)
          return;
      }
    }
    objc_msgSend(a3, "appendString:", v14);
    if (self->_compact)
      v16 = CFSTR("=");
    else
      v16 = CFSTR(" = ");
    objc_msgSend(a3, "appendString:", v16);
  }
}

- (void)_appendTraceLine:(id)a3 withFunction:(const Function *)a4 iterArgument:(array_iterator<const GPUTools:(id)a6 :(id)a7 FD::Argument>)a5 argumentStrings:returnVariable:
{
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  void *var0;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  var0 = a5.var0->var0;
  -[DYFunctionTracer _appendReturnValueToTraceLine:withFunction:iterArgument:argumentStrings:returnVariable:](self, "_appendReturnValueToTraceLine:withFunction:iterArgument:argumentStrings:returnVariable:", a3, a4, &var0, a6, a7);
  v11 = (char *)dy_fenum_to_function_name_nsstring(*(_DWORD *)a4, *((_DWORD *)a4 + 1), self->_compactEffective);
  if (objc_msgSend(v11, "containsString:", CFSTR("%@"))
    && objc_msgSend(v11, "containsString:", CFSTR(":"))
    && objc_msgSend(v11, "containsString:", CFSTR(" ")))
  {
    v12 = objc_msgSend(v11, "length");
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v13 = objc_msgSend(a6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v13)
    {
      v14 = v13;
      v15 = 0;
      v22 = *(_QWORD *)v24;
LABEL_6:
      v16 = 0;
      while (1)
      {
        if (*(_QWORD *)v24 != v22)
          objc_enumerationMutation(a6);
        v17 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v16);
        v18 = objc_msgSend(v11, "rangeOfString:options:range:", CFSTR("%@"), 2, v15, v12);
        if (v18 == 0x7FFFFFFFFFFFFFFFLL)
          break;
        v20 = v18;
        v21 = v19;
        objc_msgSend(a3, "appendString:", objc_msgSend(v11, "substringWithRange:", v15, v18 - v15));
        objc_msgSend(a3, "appendString:", v17);
        v15 = v20 + v21;
        v12 = objc_msgSend(v11, "length") - (v20 + v21);
        if (v14 == ++v16)
        {
          v14 = objc_msgSend(a6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
          if (v14)
            goto LABEL_6;
          break;
        }
      }
    }
    else
    {
      v15 = 0;
    }
    objc_msgSend(a3, "appendString:", objc_msgSend(v11, "substringWithRange:", v15, v12));
  }
  else
  {
    objc_msgSend(a3, "appendFormat:", CFSTR("%@(%@)"), v11, objc_msgSend(a6, "componentsJoinedByString:", CFSTR(", ")));
  }
}

- (unsigned)_objectNameFromVariable:(const char *)a3
{
  return 0;
}

- (id)variableForReceiverID:(unint64_t)a3
{
  return 0;
}

- (id)variableForReceiverIDNumber:(id)a3
{
  return 0;
}

- (BOOL)compilable
{
  return self->_compilable;
}

- (BOOL)emitFunctionComments
{
  return self->_emitFunctionComments;
}

- (void)setEmitFunctionComments:(BOOL)a3
{
  self->_emitFunctionComments = a3;
}

- (BOOL)emitHiddenReceiverArgument
{
  return self->_emitHiddenReceiverArgument;
}

- (void)setEmitHiddenReceiverArgument:(BOOL)a3
{
  self->_emitHiddenReceiverArgument = a3;
}

- (BOOL)prependReceiverArgument
{
  return self->_prependReceiverArgument;
}

- (BOOL)useHexadecimalFloatFormat
{
  return self->_useHexadecimalFloatFormat;
}

- (void)setUseHexadecimalFloatFormat:(BOOL)a3
{
  self->_useHexadecimalFloatFormat = a3;
}

- (BOOL)compactFloats
{
  return self->_compactFloats;
}

- (void)setCompactFloats:(BOOL)a3
{
  self->_compactFloats = a3;
}

- (BOOL)compact
{
  return self->_compact;
}

- (BOOL)emitDataIndices
{
  return self->_emitDataIndices;
}

- (void)setEmitDataIndices:(BOOL)a3
{
  self->_emitDataIndices = a3;
}

- (BOOL)emitTypeSuffixes
{
  return self->_emitTypeSuffixes;
}

- (void)setEmitTypeSuffixes:(BOOL)a3
{
  self->_emitTypeSuffixes = a3;
}

- (BOOL)emitAssociatedFunctions
{
  return self->_emitAssociatedFunctions;
}

- (void)setEmitAssociatedFunctions:(BOOL)a3
{
  self->_emitAssociatedFunctions = a3;
}

- (BOOL)emitVariables
{
  return self->_emitVariables;
}

- (void)setEmitVariables:(BOOL)a3
{
  self->_emitVariables = a3;
}

- (BOOL)emitErrors
{
  return self->_emitErrors;
}

- (void)setEmitErrors:(BOOL)a3
{
  self->_emitErrors = a3;
}

- (DYFunctionTracerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (DYFunctionTracerDelegate *)a3;
}

- (NSString)nilString
{
  return self->_nilString;
}

- (NSMutableDictionary)urlIndices
{
  return self->urlIndices;
}

@end
