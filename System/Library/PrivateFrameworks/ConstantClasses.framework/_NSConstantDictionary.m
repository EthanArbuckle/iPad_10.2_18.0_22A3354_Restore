@implementation _NSConstantDictionary

- (id)objectForKey:(id)a3
{
  unsigned int isa;
  int isa_high;
  int v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  id result;

  if (!a3)
    return 0;
  isa = self[1].super.super.isa;
  if ((isa & 0xFFFFFF) == 0)
    return 0;
  isa_high = HIDWORD(self[1].super.super.isa);
  v7 = isa_high >= 0 ? HIDWORD(self[1].super.super.isa) : isa_high + 1;
  v8 = _NSConstantDictionaryKeyHash(a3);
  v9 = HIBYTE(isa) ? (uint64_t)(int)isa >> 24 : *(_QWORD *)&isa & 0xFFFFFFLL;
  if (!v9)
    return 0;
  v10 = (uint64_t)v7 >> 1;
  v11 = v8 % v10;
  while (1)
  {
    result = self[2 * v11 + 2].super.super.isa;
    if (!result)
      break;
    if (result == a3 || objc_msgSend(result, "isEqual:", a3))
      return *(Class *)((char *)&self[2].super.super.isa + ((16 * v11) | 8));
    if (v11 + 1 == v10)
      v11 = 0;
    else
      ++v11;
    if (!--v9)
      return 0;
  }
  return result;
}

- (id)allKeys
{
  void *v3;
  int isa_high;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  _NSConstantDictionary *v9;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  isa_high = HIDWORD(self[1].super.super.isa);
  if ((isa_high + 1) >= 3)
  {
    v5 = 0;
    v6 = (uint64_t)self[1].super.super.isa & 0xFFFFFFLL;
    v7 = isa_high / 2;
    if (v7 <= 1)
      v8 = 1;
    else
      v8 = v7;
    v9 = self + 2;
    do
    {
      if (v9->super.super.isa)
      {
        objc_msgSend(v3, "addObject:");
        if (++v5 == v6)
          break;
      }
      v9 += 2;
      --v8;
    }
    while (v8);
  }
  return v3;
}

- (void)enumerateKeysAndObjectsUsingBlock:(id)a3
{
  -[_NSConstantDictionary enumerateKeysAndObjectsWithOptions:usingBlock:](self, "enumerateKeysAndObjectsWithOptions:usingBlock:", 0, a3);
}

- (void)enumerateKeysAndObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  int isa_high;
  int v7;
  unint64_t v8;
  unint64_t v9;
  _BOOL4 v11;
  unint64_t v12;
  _NSConstantDictionary *v13;
  uint64_t v14;
  Class v15;
  unint64_t v16;
  unsigned int v17;
  Class isa;
  char v19;
  char v20;

  isa_high = HIDWORD(self[1].super.super.isa);
  if (isa_high >= 0)
    v7 = HIDWORD(self[1].super.super.isa);
  else
    v7 = isa_high + 1;
  v8 = (v7 >> 1);
  v9 = (uint64_t)self[1].super.super.isa & 0xFFFFFF;
  v11 = isa_high > 1 && (_DWORD)v9 != 0;
  if ((a3 & 2) != 0)
  {
    if (v11)
    {
      v16 = 0;
      v17 = 2 * v8 - 1;
      do
      {
        isa = self[v17 + 1].super.super.isa;
        if (isa)
        {
          v19 = 0;
          (*((void (**)(id, Class, Class, char *))a4 + 2))(a4, isa, self[v17 + 2].super.super.isa, &v19);
          if (v19)
            return;
          ++v16;
        }
        if (v8 < 2)
          break;
        v17 -= 2;
        --v8;
      }
      while (v16 < v9);
    }
  }
  else if (v11)
  {
    v12 = 0;
    v13 = self + 3;
    v14 = 1;
    do
    {
      v15 = v13[-1].super.super.isa;
      if (v15)
      {
        v20 = 0;
        (*((void (**)(id, Class, Class, char *))a4 + 2))(a4, v15, v13->super.super.isa, &v20);
        if (v20)
          return;
        ++v12;
      }
      if (v14 >= (int)v8)
        break;
      v13 += 2;
      ++v14;
    }
    while (v12 < v9);
  }
}

- (unint64_t)retainCount
{
  return 1;
}

+ (id)alloc
{
  void *v2;
  uint64_t v3;
  objc_class *v4;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCA98];
  v4 = (objc_class *)objc_opt_class();
  objc_msgSend(v2, "raise:format:", v3, CFSTR("Calling Alloc on %@ is not allowed"), NSStringFromClass(v4));
  return 0;
}

- (void)dealloc
{
  void *v2;
  uint64_t v3;
  objc_class *v4;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCA98];
  v4 = (objc_class *)objc_opt_class();
  objc_msgSend(v2, "raise:format:", v3, CFSTR("Calling Dealloc on %@ is not allowed"), NSStringFromClass(v4));
}

- (id)keyEnumerator
{
  return -[_NSConstantDictionaryEnumerator initWithFirstKeyPointer:capacity:]([_NSConstantDictionaryEnumerator alloc], "initWithFirstKeyPointer:capacity:", &self[2], (uint64_t)(HIDWORD(self[1].super.super.isa) + (SHIDWORD(self[1].super.super.isa) < 0)) >> 1);
}

- (id)objectEnumerator
{
  return -[_NSConstantDictionaryEnumerator initWithFirstKeyPointer:capacity:]([_NSConstantDictionaryEnumerator alloc], "initWithFirstKeyPointer:capacity:", &self[3], (uint64_t)(HIDWORD(self[1].super.super.isa) + (SHIDWORD(self[1].super.super.isa) < 0)) >> 1);
}

- (id)allValues
{
  void *v3;
  int isa_high;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  _NSConstantDictionary *v9;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  isa_high = HIDWORD(self[1].super.super.isa);
  if ((isa_high + 1) >= 3)
  {
    v5 = 0;
    v6 = (uint64_t)self[1].super.super.isa & 0xFFFFFFLL;
    v7 = isa_high / 2;
    if (v7 <= 1)
      v8 = 1;
    else
      v8 = v7;
    v9 = self + 3;
    do
    {
      if (v9->super.super.isa)
      {
        objc_msgSend(v3, "addObject:");
        if (++v5 == v6)
          break;
      }
      v9 += 2;
      --v8;
    }
    while (v8);
  }
  return v3;
}

- (unint64_t)capacity
{
  return (uint64_t)(HIDWORD(self[1].super.super.isa) + (SHIDWORD(self[1].super.super.isa) < 0)) >> 1;
}

- (unint64_t)count
{
  return (uint64_t)self[1].super.super.isa & 0xFFFFFFLL;
}

- (id)descriptionWithLocale:(id)a3 indent:(unint64_t)a4
{
  id v7;
  unint64_t v8;
  id v9;
  id v10;
  _QWORD v12[9];

  v7 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  if (a4)
  {
    v8 = a4;
    do
    {
      objc_msgSend(v7, "appendString:", CFSTR("\t"));
      --v8;
    }
    while (v8);
  }
  v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithFormat:", CFSTR("%@{\n"), v7);
  v10 = -[_NSConstantDictionary allKeys](self, "allKeys");
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __54___NSConstantDictionary_descriptionWithLocale_indent___block_invoke;
  v12[3] = &unk_24C4537E0;
  v12[4] = self;
  v12[5] = a3;
  v12[7] = v7;
  v12[8] = a4;
  v12[6] = v9;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v12);
  objc_msgSend(v9, "appendFormat:", CFSTR("%@}\n"), v7);
  return v9;
}

- (void)getObjects:(id *)a3 andKeys:(id *)a4
{
  int isa_high;
  unint64_t v5;
  unint64_t v7;
  unint64_t v8;
  _NSConstantDictionary *v9;
  unint64_t v10;
  Class isa;

  isa_high = HIDWORD(self[1].super.super.isa);
  v5 = (uint64_t)self[1].super.super.isa & 0xFFFFFF;
  if ((isa_high - 2) <= 0xFFFFFFFC && (_DWORD)v5 != 0)
  {
    v7 = 0;
    v8 = (isa_high / 2);
    v9 = self + 3;
    v10 = 1;
    do
    {
      isa = v9[-1].super.super.isa;
      if (isa)
      {
        if (a4)
          a4[v7] = isa;
        if (a3)
          a3[v7] = v9->super.super.isa;
        ++v7;
      }
      if (v10 >= v8)
        break;
      v9 += 2;
      ++v10;
    }
    while (v7 < v5);
  }
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  int v5;
  unint64_t v6;
  unint64_t var0;
  unsigned int v8;
  unint64_t v9;
  int v10;
  unint64_t v12;
  unint64_t v13;
  int v14;
  Class isa;
  unint64_t v16;

  v5 = HIDWORD(self[1].super.super.isa) + (SHIDWORD(self[1].super.super.isa) < 0);
  v6 = (uint64_t)self[1].super.super.isa & 0xFFFFFF;
  var0 = a3->var0;
  if (!a3->var0)
  {
    a3->var2 = (unint64_t *)&countByEnumeratingWithState_objects_count__const_mu_0;
    a3->var3[0] = 0;
  }
  if (var0 >= v6)
    return 0;
  v8 = v5 >> 1;
  a3->var1 = a4;
  v9 = a3->var3[0];
  v10 = v9;
  if (v8 <= v9 || a5 == 0)
  {
    v12 = 0;
  }
  else
  {
    v13 = 0;
    v14 = 2 * v9;
    do
    {
      isa = self[v14 + 2].super.super.isa;
      if (isa)
      {
        v12 = v13 + 1;
        a4[v13] = isa;
        v16 = a3->var0 + 1;
        a3->var0 = v16;
        if (v16 == v6)
          break;
      }
      else
      {
        v12 = v13;
      }
      if (v8 <= ++v10)
        break;
      v14 += 2;
      v13 = v12;
    }
    while (v12 < a5);
  }
  a3->var3[0] = v10;
  return v12;
}

@end
