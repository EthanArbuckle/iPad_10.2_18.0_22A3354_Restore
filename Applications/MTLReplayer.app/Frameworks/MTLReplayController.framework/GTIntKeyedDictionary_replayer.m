@implementation GTIntKeyedDictionary_replayer

- (GTIntKeyedDictionary_replayer)init
{
  return -[GTIntKeyedDictionary_replayer initWithCapacity:](self, "initWithCapacity:", 0);
}

- (GTIntKeyedDictionary_replayer)initWithCapacity:(unint64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GTIntKeyedDictionary_replayer;
  if (-[GTIntKeyedDictionary_replayer init](&v4, "init"))
    operator new();
  return 0;
}

- (GTIntKeyedDictionary_replayer)initWithIntKeyedDictionary:(id)a3
{
  GTIntKeyedDictionary_replayer *v4;
  GTIntKeyedDictionary_replayer *v5;
  _QWORD v7[5];

  v4 = -[GTIntKeyedDictionary_replayer initWithCapacity:](self, "initWithCapacity:", objc_msgSend(a3, "count"));
  v5 = v4;
  if (v4)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = __51__GTIntKeyedDictionary_initWithIntKeyedDictionary___block_invoke;
    v7[3] = &unk_7250F8;
    v7[4] = v4;
    objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v7);
  }
  return v5;
}

- (GTIntKeyedDictionary_replayer)initWithCoder:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  GTIntKeyedDictionary_replayer *v10;
  GTIntKeyedDictionary_replayer *v11;
  const char *v13;
  _QWORD v14[6];

  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {
    v13 = "[coder allowsKeyedCoding]";
    goto LABEL_8;
  }
  v6 = objc_opt_class(NSArray, v5);
  v8 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, objc_opt_class(NSNumber, v7), 0), CFSTR("keys"));
  if (!v8)
  {
    v13 = "keys";
LABEL_8:
    __assert_rtn("-[GTIntKeyedDictionary initWithCoder:]", ", 0, v13);
  }
  v9 = v8;
  v10 = -[GTIntKeyedDictionary_replayer initWithCapacity:](self, "initWithCapacity:", objc_msgSend(v8, "count"));
  v11 = v10;
  if (v10)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = __38__GTIntKeyedDictionary_initWithCoder___block_invoke;
    v14[3] = &unk_725120;
    v14[4] = a3;
    v14[5] = v10;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v14);
  }
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  _QWORD v5[5];

  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
    __assert_rtn("-[GTIntKeyedDictionary encodeWithCoder:]", ", 0, "[coder allowsKeyedCoding]");
  objc_msgSend(a3, "encodeObject:forKey:", -[GTIntKeyedDictionary_replayer allKeys](self, "allKeys"), CFSTR("keys"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __40__GTIntKeyedDictionary_encodeWithCoder___block_invoke;
  v5[3] = &unk_7250F8;
  v5[4] = a3;
  -[GTIntKeyedDictionary_replayer enumerateKeysAndObjectsUsingBlock:](self, "enumerateKeysAndObjectsUsingBlock:", v5);
}

- (void)dealloc
{
  char *v2;
  CFTypeRef *i;
  objc_super v4;

  v2 = (char *)self->_private;
  if (v2)
  {
    for (i = (CFTypeRef *)(v2 + 16); ; CFRelease(i[3]))
    {
      i = (CFTypeRef *)*i;
      if (!i)
        break;
    }
    std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)v2);
    operator delete();
  }
  v4.receiver = self;
  v4.super_class = (Class)GTIntKeyedDictionary_replayer;
  -[GTIntKeyedDictionary_replayer dealloc](&v4, "dealloc");
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
  unint64_t v4;
  char *v7;
  unint64_t v8;
  uint8x8_t v9;
  _QWORD *v10;
  _QWORD *v11;
  unint64_t v12;
  _QWORD *v13;
  float v14;
  float v15;
  _BOOL8 v16;
  unint64_t v17;
  unint64_t v18;
  size_t v19;
  uint64_t v20;
  _QWORD *v21;
  unint64_t v22;
  id v23;

  if (!a3)
  {
    -[GTIntKeyedDictionary_replayer removeObjectForIntKey:](self, "removeObjectForIntKey:", a4);
    return;
  }
  v7 = (char *)self->_private;
  v8 = *((_QWORD *)v7 + 1);
  if (!v8)
    goto LABEL_20;
  v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
  v9.i16[0] = vaddlv_u8(v9);
  if (v9.u32[0] > 1uLL)
  {
    v4 = a4;
    if (v8 <= a4)
      v4 = a4 % v8;
  }
  else
  {
    v4 = (v8 - 1) & a4;
  }
  v10 = *(_QWORD **)(*(_QWORD *)v7 + 8 * v4);
  if (!v10 || (v11 = (_QWORD *)*v10) == 0)
  {
LABEL_20:
    v13 = operator new(0x20uLL);
    *v13 = 0;
    v13[1] = a4;
    v13[2] = a4;
    v13[3] = a3;
    v14 = (float)(unint64_t)(*((_QWORD *)v7 + 3) + 1);
    v15 = *((float *)v7 + 8);
    if (!v8 || (float)(v15 * (float)v8) < v14)
    {
      v16 = 1;
      if (v8 >= 3)
        v16 = (v8 & (v8 - 1)) != 0;
      v17 = v16 | (2 * v8);
      v18 = vcvtps_u32_f32(v14 / v15);
      if (v17 <= v18)
        v19 = v18;
      else
        v19 = v17;
      std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>((uint64_t)v7, v19);
      v8 = *((_QWORD *)v7 + 1);
      if ((v8 & (v8 - 1)) != 0)
      {
        if (v8 <= a4)
          v4 = a4 % v8;
        else
          v4 = a4;
      }
      else
      {
        v4 = (v8 - 1) & a4;
      }
    }
    v20 = *(_QWORD *)v7;
    v21 = *(_QWORD **)(*(_QWORD *)v7 + 8 * v4);
    if (v21)
    {
      *v13 = *v21;
    }
    else
    {
      *v13 = *((_QWORD *)v7 + 2);
      *((_QWORD *)v7 + 2) = v13;
      *(_QWORD *)(v20 + 8 * v4) = v7 + 16;
      if (!*v13)
      {
LABEL_41:
        ++*((_QWORD *)v7 + 3);
        CFRetain(a3);
        return;
      }
      v22 = *(_QWORD *)(*v13 + 8);
      if ((v8 & (v8 - 1)) != 0)
      {
        if (v22 >= v8)
          v22 %= v8;
      }
      else
      {
        v22 &= v8 - 1;
      }
      v21 = (_QWORD *)(*(_QWORD *)v7 + 8 * v22);
    }
    *v21 = v13;
    goto LABEL_41;
  }
  while (1)
  {
    v12 = v11[1];
    if (v12 == a4)
      break;
    if (v9.u32[0] > 1uLL)
    {
      if (v12 >= v8)
        v12 %= v8;
    }
    else
    {
      v12 &= v8 - 1;
    }
    if (v12 != v4)
      goto LABEL_20;
LABEL_19:
    v11 = (_QWORD *)*v11;
    if (!v11)
      goto LABEL_20;
  }
  if (v11[2] != a4)
    goto LABEL_19;
  v23 = (id)v11[3];
  if (v23 != a3)
  {
    CFRelease(v23);
    CFRetain(a3);
    v11[3] = a3;
  }
}

- (id)objectForIntKey:(int64_t)a3
{
  id result;

  result = std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::find<unsigned long long>((_QWORD *)self->_private, a3);
  if (result)
    return (id)*((_QWORD *)result + 3);
  return result;
}

- (void)removeObjectForIntKey:(int64_t)a3
{
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  int8x8_t v6;
  unint64_t v7;
  uint8x8_t v8;
  _QWORD *v9;
  _QWORD *v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;

  v3 = self->_private;
  v4 = std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::find<unsigned long long>(v3, a3);
  if (v4)
  {
    v5 = v4;
    CFRelease((CFTypeRef)v4[3]);
    v6 = (int8x8_t)v3[1];
    v7 = v5[1];
    v8 = (uint8x8_t)vcnt_s8(v6);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      if (v7 >= *(_QWORD *)&v6)
        v7 %= *(_QWORD *)&v6;
    }
    else
    {
      v7 &= *(_QWORD *)&v6 - 1;
    }
    v9 = *(_QWORD **)(*v3 + 8 * v7);
    do
    {
      v10 = v9;
      v9 = (_QWORD *)*v9;
    }
    while (v9 != v5);
    if (v10 == v3 + 2)
      goto LABEL_20;
    v11 = v10[1];
    if (v8.u32[0] > 1uLL)
    {
      if (v11 >= *(_QWORD *)&v6)
        v11 %= *(_QWORD *)&v6;
    }
    else
    {
      v11 &= *(_QWORD *)&v6 - 1;
    }
    if (v11 != v7)
    {
LABEL_20:
      if (!*v5)
        goto LABEL_21;
      v12 = *(_QWORD *)(*v5 + 8);
      if (v8.u32[0] > 1uLL)
      {
        if (v12 >= *(_QWORD *)&v6)
          v12 %= *(_QWORD *)&v6;
      }
      else
      {
        v12 &= *(_QWORD *)&v6 - 1;
      }
      if (v12 != v7)
LABEL_21:
        *(_QWORD *)(*v3 + 8 * v7) = 0;
    }
    v13 = *v5;
    if (*v5)
    {
      v14 = *(_QWORD *)(v13 + 8);
      if (v8.u32[0] > 1uLL)
      {
        if (v14 >= *(_QWORD *)&v6)
          v14 %= *(_QWORD *)&v6;
      }
      else
      {
        v14 &= *(_QWORD *)&v6 - 1;
      }
      if (v14 != v7)
      {
        *(_QWORD *)(*v3 + 8 * v14) = v10;
        v13 = *v5;
      }
    }
    *v10 = v13;
    *v5 = 0;
    --v3[3];
    operator delete(v5);
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
  -[GTIntKeyedDictionary_replayer setObject:forIntKey:](self, "setObject:forIntKey:", a3, objc_msgSend(a4, "longLongValue"));
}

- (id)objectForKey:(id)a3
{
  return -[GTIntKeyedDictionary_replayer objectForIntKey:](self, "objectForIntKey:", objc_msgSend(a3, "longLongValue"));
}

- (void)removeObjectForKey:(id)a3
{
  -[GTIntKeyedDictionary_replayer removeObjectForIntKey:](self, "removeObjectForIntKey:", objc_msgSend(a3, "longLongValue"));
}

- (id)allKeys
{
  void *v3;
  _QWORD *i;
  id v5;

  v3 = (void *)objc_opt_new(NSMutableArray, a2);
  for (i = (_QWORD *)*((_QWORD *)self->_private + 2); i; i = (_QWORD *)*i)
  {
    v5 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithLongLong:", i[2]);
    objc_msgSend(v3, "addObject:", v5);

  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
