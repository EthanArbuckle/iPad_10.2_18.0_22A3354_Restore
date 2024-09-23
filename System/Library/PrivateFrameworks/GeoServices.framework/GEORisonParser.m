@implementation GEORisonParser

- (GEORisonParser)init
{
  GEORisonParser *v2;
  NSNumberFormatter *v3;
  NSNumberFormatter *formatter;
  void *v5;
  NSMutableCharacterSet *v6;
  NSMutableCharacterSet *risonTerminators;
  NSMutableCharacterSet *v8;
  NSMutableCharacterSet *risonEscapes;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)GEORisonParser;
  v2 = -[GEORisonParser init](&v11, sel_init);
  if (v2)
  {
    v3 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E0CB37F0]);
    formatter = v2->_formatter;
    v2->_formatter = v3;

    -[NSNumberFormatter setNumberStyle:](v2->_formatter, "setNumberStyle:", 1);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("en_US"));
    -[NSNumberFormatter setLocale:](v2->_formatter, "setLocale:", v5);

    v6 = (NSMutableCharacterSet *)objc_alloc_init(MEMORY[0x1E0CB3780]);
    risonTerminators = v2->_risonTerminators;
    v2->_risonTerminators = v6;

    -[NSMutableCharacterSet addCharactersInString:](v2->_risonTerminators, "addCharactersInString:", CFSTR(",=()"));
    v8 = (NSMutableCharacterSet *)objc_alloc_init(MEMORY[0x1E0CB3780]);
    risonEscapes = v2->_risonEscapes;
    v2->_risonEscapes = v8;

    -[NSMutableCharacterSet addCharactersInString:](v2->_risonEscapes, "addCharactersInString:", CFSTR("!'"));
  }
  return v2;
}

- (id)objectFromRisonString:(id)a3
{
  id v4;
  const char *v5;
  void *v6;
  _QWORD v8[3];

  v4 = a3;
  if (objc_msgSend(v4, "length")
    && (v5 = (const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"), (v8[0] = v5) != 0))
  {
    v8[1] = strlen(v5);
    v8[2] = 0;
    -[GEORisonParser objectWithReaderInfo:](self, "objectWithReaderInfo:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)objectWithReaderInfo:(id *)a3
{
  unint64_t var2;
  int v4;
  uint64_t v5;
  void *v6;
  int v7;

  var2 = a3->var2;
  v4 = a3->var0[var2];
  if (v4 != 33)
  {
    if (v4 == 39)
    {
      -[GEORisonParser stringLiteralWithReaderInfo:](self, "stringLiteralWithReaderInfo:");
      v5 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v4 == 40)
        -[GEORisonParser dictionaryWithReaderInfo:](self, "dictionaryWithReaderInfo:");
      else
        -[GEORisonParser numberWithReaderInfo:](self, "numberWithReaderInfo:");
      v5 = objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_17;
  }
  v6 = 0;
  v7 = a3->var0[var2 + 1];
  if (v7 <= 109)
  {
    if (v7 == 40)
    {
      -[GEORisonParser arrayWithReaderInfo:](self, "arrayWithReaderInfo:");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
    if (v7 != 102)
      return v6;
LABEL_14:
    -[GEORisonParser BOOLWithReaderInfo:](self, "BOOLWithReaderInfo:");
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_17:
    v6 = (void *)v5;
    return v6;
  }
  if (v7 == 110)
  {
    -[GEORisonParser nullWithReaderInfo:](self, "nullWithReaderInfo:");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  if (v7 == 116)
    goto LABEL_14;
  return v6;
}

- (id)dictionaryWithReaderInfo:(id *)a3
{
  id v5;
  unint64_t v6;
  char *var0;
  void *v8;
  void *v9;
  unint64_t var2;

  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6 = a3->var2 + 1;
  a3->var2 = v6;
  var0 = a3->var0;
  while (var0[v6] != 41 && v6 < a3->var1)
  {
    -[GEORisonParser keyWithReaderInfo:](self, "keyWithReaderInfo:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    ++a3->var2;
    -[GEORisonParser objectWithReaderInfo:](self, "objectWithReaderInfo:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && v8)
      objc_msgSend(v5, "setObject:forKey:", v9, v8);
    var2 = a3->var2;
    if (a3->var0[var2] == 44)
      a3->var2 = var2 + 1;

    var0 = a3->var0;
    v6 = a3->var2;
  }
  a3->var2 = v6 + 1;
  return v5;
}

- (id)keyWithReaderInfo:(id *)a3
{
  id v4;
  unint64_t var2;
  int i;
  char *var0;

  v4 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  var2 = a3->var2;
  for (i = a3->var0[var2]; i != 61; i = var0[var2])
  {
    if (var2 >= a3->var1)
      break;
    objc_msgSend(v4, "appendFormat:", CFSTR("%c"), (char)i);
    var0 = a3->var0;
    var2 = a3->var2 + 1;
    a3->var2 = var2;
  }
  return v4;
}

- (id)arrayWithReaderInfo:(id *)a3
{
  id v5;
  unint64_t v6;
  char *var0;
  void *v8;
  unint64_t var2;

  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = a3->var2 + 2;
  a3->var2 = v6;
  var0 = a3->var0;
  while (var0[v6] != 41 && v6 < a3->var1)
  {
    -[GEORisonParser objectWithReaderInfo:](self, "objectWithReaderInfo:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      objc_msgSend(v5, "addObject:", v8);
    var2 = a3->var2;
    if (a3->var0[var2] == 44)
      a3->var2 = var2 + 1;

    var0 = a3->var0;
    v6 = a3->var2;
  }
  a3->var2 = v6 + 1;
  return v5;
}

- (id)stringLiteralWithReaderInfo:(id *)a3
{
  id v4;
  unint64_t var2;
  int v6;
  unint64_t var1;
  unsigned __int16 v8;
  unint64_t v9;
  uint64_t v11;
  size_t v12;
  char *v13;
  void *v14;
  void *v15;
  char *var0;
  unint64_t v17;
  char v18;
  char *v19;
  unint64_t v20;

  v4 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  var2 = a3->var2 + 1;
  a3->var2 = var2;
  v6 = a3->var0[var2];
  if (v6 != 39)
  {
    while (1)
    {
      var1 = a3->var1;
      var2 = a3->var2;
      if (var2 >= var1)
        break;
      switch(v6)
      {
        case '!':
          var0 = a3->var0;
          v17 = var2 + 1;
          a3->var2 = v17;
          v18 = var0[v17];
          break;
        case '%':
          v8 = 0;
          do
          {
            v8 += 3;
            v9 = var2 + v8;
            v6 = a3->var0[v9];
          }
          while (v6 == 37 && v9 < var1);
          v11 = v8;
          v12 = v8 + 1;
          v13 = (char *)malloc_type_malloc(v12, 0x557825ACuLL);
          snprintf(v13, v12, "%s", &a3->var0[a3->var2]);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v13, 4);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "stringByRemovingPercentEncoding");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          free(v13);
          a3->var2 += v11;

          goto LABEL_17;
        case '+':
          v18 = 32;
          break;
        default:
          v18 = v6;
          break;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%c"), v18);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = a3->var0;
      v20 = a3->var2 + 1;
      a3->var2 = v20;
      v6 = v19[v20];
LABEL_17:
      objc_msgSend(v4, "appendString:", v15);

      if (v6 == 39)
      {
        var2 = a3->var2;
        break;
      }
    }
  }
  a3->var2 = var2 + 1;
  return v4;
}

- (id)nullWithReaderInfo:(id *)a3
{
  a3->var2 += 2;
  return (id)objc_msgSend(MEMORY[0x1E0C99E38], "null");
}

- (id)BOOLWithReaderInfo:(id *)a3
{
  unint64_t v4;
  void *v5;

  v4 = a3->var2 + 1;
  a3->var2 = v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3->var0[v4] == 116);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ++a3->var2;
  return v5;
}

- (id)numberWithReaderInfo:(id *)a3
{
  id v5;
  char v6;
  char v7;
  char *var0;
  unint64_t v9;
  void *v10;

  v5 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v6 = a3->var0[a3->var2];
  if ((-[NSMutableCharacterSet characterIsMember:](self->_risonTerminators, "characterIsMember:", (unsigned __int16)v6) & 1) == 0)
  {
    v7 = v6;
    do
    {
      if (a3->var2 >= a3->var1)
        break;
      objc_msgSend(v5, "appendFormat:", CFSTR("%c"), v7);
      var0 = a3->var0;
      v9 = a3->var2 + 1;
      a3->var2 = v9;
      LOWORD(var0) = var0[v9];
      v7 = (char)var0;
    }
    while (!-[NSMutableCharacterSet characterIsMember:](self->_risonTerminators, "characterIsMember:", (unsigned __int16)var0));
  }
  -[NSNumberFormatter numberFromString:](self->_formatter, "numberFromString:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)stringFromRisonObject:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[GEORisonParser stringFromDictionary:](self, "stringFromDictionary:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[GEORisonParser stringFromArray:](self, "stringFromArray:", v4);
      v5 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[GEORisonParser stringFromNumber:](self, "stringFromNumber:", v4);
        v5 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[GEORisonParser stringFromNull:](self, "stringFromNull:", v4);
          v5 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v6 = 0;
            goto LABEL_12;
          }
          -[GEORisonParser stringFromString:](self, "stringFromString:", v4);
          v5 = objc_claimAutoreleasedReturnValue();
        }
      }
    }
  }
  v6 = (void *)v5;
LABEL_12:

  return v6;
}

- (id)stringFromDictionary:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;
  GEORisonParser *v15;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v4, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortedArrayUsingSelector:", sel_caseInsensitiveCompare_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "appendString:", CFSTR("("));
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __39__GEORisonParser_stringFromDictionary___block_invoke;
  v12[3] = &unk_1E1C14C08;
  v13 = v4;
  v8 = v5;
  v14 = v8;
  v15 = self;
  v9 = v4;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v12);
  objc_msgSend(v8, "appendString:", CFSTR(")"));
  v10 = v8;

  return v10;
}

void __39__GEORisonParser_stringFromDictionary___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "objectForKey:", v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (a3)
    objc_msgSend(*(id *)(a1 + 40), "appendString:", CFSTR(","));
  v7 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "stringFromRisonObject:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("%@=%@"), v6, v8);

}

- (id)stringFromArray:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, uint64_t);
  void *v13;
  id v14;
  GEORisonParser *v15;

  v4 = (objc_class *)MEMORY[0x1E0CB37A0];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "appendString:", CFSTR("!("));
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __34__GEORisonParser_stringFromArray___block_invoke;
  v13 = &unk_1E1C14C30;
  v7 = v6;
  v14 = v7;
  v15 = self;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", &v10);

  objc_msgSend(v7, "appendString:", CFSTR(")"), v10, v11, v12, v13);
  v8 = v7;

  return v8;
}

void __34__GEORisonParser_stringFromArray___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if (a3)
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(","));
  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "stringFromRisonObject:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("%@"), v6);

}

- (id)stringFromString:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v3 = (objc_class *)MEMORY[0x1E0CB37A0];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "appendString:", CFSTR("'"));
  v6 = objc_msgSend(v4, "length");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __35__GEORisonParser_stringFromString___block_invoke;
  v9[3] = &unk_1E1C14C58;
  v7 = v5;
  v10 = v7;
  objc_msgSend(v4, "enumerateSubstringsInRange:options:usingBlock:", 0, v6, 2, v9);

  objc_msgSend(v7, "appendString:", CFSTR("'"));
  return v7;
}

void __35__GEORisonParser_stringFromString___block_invoke(uint64_t a1, void *a2)
{
  int v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("!")) & 1) != 0
    || (objc_msgSend(v6, "isEqualToString:", CFSTR("'")) & 1) != 0
    || (objc_msgSend(v6, "isEqualToString:", CFSTR("+")) & 1) != 0
    || objc_msgSend(v6, "isEqualToString:", CFSTR("\\")))
  {
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("!%@"), v6);
  }
  else
  {
    v3 = objc_msgSend(v6, "isEqualToString:", CFSTR(" "));
    v4 = *(void **)(a1 + 32);
    if (v3)
    {
      objc_msgSend(v4, "appendString:", CFSTR("+"));
    }
    else
    {
      objc_msgSend(v6, "stringByAddingPercentEscapesUsingEncoding:", 4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendString:", v5);

    }
  }

}

- (id)stringFromNumber:(id)a3
{
  id v3;
  CFTypeID v4;
  int v5;
  __CFString *v6;
  void *v8;

  v3 = a3;
  v4 = CFGetTypeID(v3);
  if (v4 == CFBooleanGetTypeID())
  {
    v5 = objc_msgSend(v3, "BOOLValue");

    v6 = CFSTR("!f");
    if (v5)
      v6 = CFSTR("!t");
    return v6;
  }
  else
  {
    objc_msgSend(v3, "stringValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    return v8;
  }
}

- (id)stringFromNull:(id)a3
{
  return CFSTR("!n");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_risonEscapes, 0);
  objc_storeStrong((id *)&self->_risonTerminators, 0);
  objc_storeStrong((id *)&self->_formatter, 0);
}

@end
