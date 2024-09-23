@implementation DYIntKeyedDictionary

- (DYIntKeyedDictionary)init
{
  return -[DYIntKeyedDictionary initWithCapacity:](self, "initWithCapacity:", 0);
}

- (DYIntKeyedDictionary)initWithCapacity:(unint64_t)a3
{
  DYIntKeyedDictionary *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DYIntKeyedDictionary;
  v4 = -[DYIntKeyedDictionary init](&v8, sel_init);
  if (v4)
  {
    v5 = operator new();
    v6 = (void *)v5;
    if (a3)
    {
      std::unordered_map<long long,objc_object  {objcproto8NSObject}*>::unordered_map(v5, a3);
    }
    else
    {
      *(_OWORD *)v5 = 0u;
      *(_OWORD *)(v5 + 16) = 0u;
      *(_DWORD *)(v5 + 32) = 1065353216;
    }
    v4->_private = v6;
  }
  return v4;
}

- (DYIntKeyedDictionary)initWithIntKeyedDictionary:(id)a3
{
  DYIntKeyedDictionary *v4;
  DYIntKeyedDictionary *v5;
  _QWORD v7[5];

  v4 = -[DYIntKeyedDictionary initWithCapacity:](self, "initWithCapacity:", objc_msgSend(a3, "count"));
  v5 = v4;
  if (v4)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __51__DYIntKeyedDictionary_initWithIntKeyedDictionary___block_invoke;
    v7[3] = &unk_250D62D50;
    v7[4] = v4;
    objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v7);
  }
  return v5;
}

uint64_t __51__DYIntKeyedDictionary_initWithIntKeyedDictionary___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forIntKey:", a3, a2);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DYIntKeyedDictionary)initWithCoder:(id)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  DYIntKeyedDictionary *v9;
  DYIntKeyedDictionary *v10;
  _QWORD v12[6];

  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
    __assert_rtn("-[DYIntKeyedDictionary initWithCoder:]", ", 0, "[coder allowsKeyedCoding]");
  v5 = (void *)MEMORY[0x24BDBCF20];
  v6 = objc_opt_class();
  v7 = (void *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0), CFSTR("keys"));
  if (!v7)
    __assert_rtn("-[DYIntKeyedDictionary initWithCoder:]", ", 0, "keys");
  v8 = v7;
  v9 = -[DYIntKeyedDictionary initWithCapacity:](self, "initWithCapacity:", objc_msgSend(v7, "count"));
  v10 = v9;
  if (v9)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __38__DYIntKeyedDictionary_initWithCoder___block_invoke;
    v12[3] = &unk_250D63370;
    v12[4] = a3;
    v12[5] = v9;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v12);
  }
  return v10;
}

uint64_t __38__DYIntKeyedDictionary_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = objc_msgSend(a2, "longLongValue");
  v4 = objc_msgSend(*(id *)(a1 + 32), "decodeObjectOfClass:forKey:", objc_opt_class(), objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%llu"), v3));
  if (!v4)
    __assert_rtn("-[DYIntKeyedDictionary initWithCoder:]_block_invoke", ", 0, "obj");
  return objc_msgSend(*(id *)(a1 + 40), "setObject:forIntKey:", v4, v3);
}

- (void)encodeWithCoder:(id)a3
{
  _QWORD v5[5];

  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
    __assert_rtn("-[DYIntKeyedDictionary encodeWithCoder:]", ", 0, "[coder allowsKeyedCoding]");
  objc_msgSend(a3, "encodeObject:forKey:", -[DYIntKeyedDictionary allKeys](self, "allKeys"), CFSTR("keys"));
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __40__DYIntKeyedDictionary_encodeWithCoder___block_invoke;
  v5[3] = &unk_250D62D50;
  v5[4] = a3;
  -[DYIntKeyedDictionary enumerateKeysAndObjectsUsingBlock:](self, "enumerateKeysAndObjectsUsingBlock:", v5);
}

uint64_t __40__DYIntKeyedDictionary_encodeWithCoder___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "encodeObject:forKey:", a3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%llu"), a2));
}

- (void)dealloc
{
  void **v3;
  _QWORD **v4;
  void **i;
  _QWORD *v6;
  _QWORD *v7;
  void *v8;
  objc_super v9;

  v3 = (void **)self->_private;
  if (v3)
  {
    v4 = (_QWORD **)(v3 + 2);
    for (i = v3 + 2; ; CFRelease(i[3]))
    {
      i = (void **)*i;
      if (!i)
        break;
    }
    v6 = *v4;
    if (*v4)
    {
      do
      {
        v7 = (_QWORD *)*v6;
        operator delete(v6);
        v6 = v7;
      }
      while (v7);
    }
    v8 = *v3;
    *v3 = 0;
    if (v8)
      operator delete(v8);
    MEMORY[0x242622C98](v3, 0x10A0C408EF24B1CLL);
  }
  v9.receiver = self;
  v9.super_class = (Class)DYIntKeyedDictionary;
  -[DYIntKeyedDictionary dealloc](&v9, sel_dealloc);
}

- (unint64_t)count
{
  return *((_QWORD *)self->_private + 3);
}

- (void)removeAllObjects
{
  _QWORD *v2;
  uint64_t **i;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t j;

  v2 = self->_private;
  for (i = (uint64_t **)v2[2]; i; i = (uint64_t **)*i)
    CFRelease(i[3]);
  if (v2[3])
  {
    v4 = (_QWORD *)v2[2];
    if (v4)
    {
      do
      {
        v5 = (_QWORD *)*v4;
        operator delete(v4);
        v4 = v5;
      }
      while (v5);
    }
    v2[2] = 0;
    v6 = v2[1];
    if (v6)
    {
      for (j = 0; j != v6; ++j)
        *(_QWORD *)(*v2 + 8 * j) = 0;
    }
    v2[3] = 0;
  }
}

- (void)setObject:(id)a3 forIntKey:(int64_t)a4
{
  void *v5;
  _QWORD *v6;
  char v7;
  _QWORD *v8;
  id v9;
  __int128 v10;

  if (a3)
  {
    v5 = self->_private;
    *(_QWORD *)&v10 = a4;
    *((_QWORD *)&v10 + 1) = a3;
    v6 = std::__hash_table<std::__hash_value_type<long long,objc_object  {objcproto8NSObject}*>,std::__unordered_map_hasher<long long,objc_object  {objcproto8NSObject}*,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,objc_object  {objcproto8NSObject}*,std::equal_to,std::hash,true>,std::allocator<objc_object  {objcproto8NSObject}*>>::__emplace_unique_key_args<long long,std::pair<long long const,objc_object  {objcproto8NSObject}>>((uint64_t)v5, (unint64_t *)&v10, &v10);
    if (v7)
    {
      CFRetain(a3);
    }
    else
    {
      v8 = v6;
      v9 = (id)v6[3];
      if (v9 != a3)
      {
        CFRelease(v9);
        CFRetain(a3);
        v8[3] = a3;
      }
    }
  }
  else
  {
    -[DYIntKeyedDictionary removeObjectForIntKey:](self, "removeObjectForIntKey:", a4);
  }
}

- (id)objectForIntKey:(int64_t)a3
{
  _QWORD *v3;
  unint64_t v4;
  uint8x8_t v5;
  unint64_t v6;
  uint64_t ***v7;
  uint64_t **v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t *v11;

  v3 = self->_private;
  v4 = v3[1];
  if (!v4)
    return 0;
  v5 = (uint8x8_t)vcnt_s8((int8x8_t)v4);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    v6 = a3;
    if (v4 <= a3)
      v6 = a3 % v4;
  }
  else
  {
    v6 = (v4 - 1) & a3;
  }
  v7 = *(uint64_t ****)(*v3 + 8 * v6);
  if (!v7)
    return 0;
  v8 = *v7;
  if (!v8)
    return 0;
  if (v5.u32[0] < 2uLL)
  {
    v9 = v4 - 1;
    while (1)
    {
      v11 = v8[1];
      if (v11 == (uint64_t *)a3)
      {
        if (v8[2] == (uint64_t *)a3)
          return v8[3];
      }
      else if (((unint64_t)v11 & v9) != v6)
      {
        return 0;
      }
      v8 = (uint64_t **)*v8;
      if (!v8)
        return 0;
    }
  }
  while (1)
  {
    v10 = (unint64_t)v8[1];
    if (v10 == a3)
      break;
    if (v10 >= v4)
      v10 %= v4;
    if (v10 != v6)
      return 0;
LABEL_11:
    v8 = (uint64_t **)*v8;
    if (!v8)
      return 0;
  }
  if (v8[2] != (uint64_t *)a3)
    goto LABEL_11;
  return v8[3];
}

- (void)removeObjectForIntKey:(int64_t)a3
{
  _QWORD *v3;
  unint64_t v4;
  uint8x8_t v5;
  unint64_t v6;
  uint64_t ***v7;
  uint64_t **v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t *v11;
  void *v12;
  void *__p;

  v3 = self->_private;
  v4 = v3[1];
  if (v4)
  {
    v5 = (uint8x8_t)vcnt_s8((int8x8_t)v4);
    v5.i16[0] = vaddlv_u8(v5);
    if (v5.u32[0] > 1uLL)
    {
      v6 = a3;
      if (v4 <= a3)
        v6 = a3 % v4;
    }
    else
    {
      v6 = (v4 - 1) & a3;
    }
    v7 = *(uint64_t ****)(*v3 + 8 * v6);
    if (v7)
    {
      v8 = *v7;
      if (*v7)
      {
        if (v5.u32[0] < 2uLL)
        {
          v9 = v4 - 1;
          while (1)
          {
            v11 = v8[1];
            if (v11 == (uint64_t *)a3)
            {
              if (v8[2] == (uint64_t *)a3)
                goto LABEL_22;
            }
            else if (((unint64_t)v11 & v9) != v6)
            {
              return;
            }
            v8 = (uint64_t **)*v8;
            if (!v8)
              return;
          }
        }
        do
        {
          v10 = (unint64_t)v8[1];
          if (v10 == a3)
          {
            if (v8[2] == (uint64_t *)a3)
            {
LABEL_22:
              CFRelease(v8[3]);
              std::__hash_table<std::__hash_value_type<void *,unsigned long long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long long>>>::remove(v3, v8, (uint64_t)&__p);
              v12 = __p;
              __p = 0;
              if (v12)
                operator delete(v12);
              return;
            }
          }
          else
          {
            if (v10 >= v4)
              v10 %= v4;
            if (v10 != v6)
              return;
          }
          v8 = (uint64_t **)*v8;
        }
        while (v8);
      }
    }
  }
}

- (void)enumerateKeysAndObjectsUsingBlock:(id)a3
{
  char *v4;
  _QWORD *v5;
  char v6;

  v4 = (char *)self->_private;
  v6 = 0;
  v5 = v4 + 16;
  do
  {
    v5 = (_QWORD *)*v5;
    if (!v5)
      break;
    (*((void (**)(id, _QWORD, _QWORD, char *))a3 + 2))(a3, v5[2], v5[3], &v6);
  }
  while (!v6);
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  -[DYIntKeyedDictionary setObject:forIntKey:](self, "setObject:forIntKey:", a3, objc_msgSend(a4, "longLongValue"));
}

- (id)objectForKey:(id)a3
{
  return -[DYIntKeyedDictionary objectForIntKey:](self, "objectForIntKey:", objc_msgSend(a3, "longLongValue"));
}

- (void)removeObjectForKey:(id)a3
{
  -[DYIntKeyedDictionary removeObjectForIntKey:](self, "removeObjectForIntKey:", objc_msgSend(a3, "longLongValue"));
}

- (id)allKeys
{
  void *v3;
  _QWORD *i;
  void *v5;

  v3 = (void *)objc_opt_new();
  for (i = (_QWORD *)*((_QWORD *)self->_private + 2); i; i = (_QWORD *)*i)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithLongLong:", i[2]);
    objc_msgSend(v3, "addObject:", v5);

  }
  return v3;
}

@end
