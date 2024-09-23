@implementation GEOTileKeyMap

- (void)dealloc
{
  uint64_t **i;
  void **map;
  _QWORD *v5;
  _QWORD *v6;
  void *v7;
  objc_super v8;

  if (!self->_type)
  {
    for (i = (uint64_t **)*((_QWORD *)self->_map + 2); i; i = (uint64_t **)*i)

  }
  map = (void **)self->_map;
  if (map)
  {
    v5 = map[2];
    if (v5)
    {
      do
      {
        v6 = (_QWORD *)*v5;
        operator delete(v5);
        v5 = v6;
      }
      while (v6);
    }
    v7 = *map;
    *map = 0;
    if (v7)
      operator delete(v7);
    MEMORY[0x18D76437C](map, 0x10A0C408EF24B1CLL);
  }
  v8.receiver = self;
  v8.super_class = (Class)GEOTileKeyMap;
  -[GEOTileKeyMap dealloc](&v8, sel_dealloc);
}

- (_QWORD)objectForKey:(_QWORD *)a3
{
  _QWORD *result;

  result = std::__hash_table<std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,std::__unordered_map_hasher<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,hashkey,eqkey,true>,std::__unordered_map_equal<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,eqkey,hashkey,true>,std::allocator<std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>>>::find<_GEOTileKey>(*(_QWORD **)(a1 + 16), a3);
  if (result)
  {
    result = (_QWORD *)result[4];
    if (!*(_QWORD *)(a1 + 8))
      return result;
  }
  return result;
}

- (void)setObject:(void *)a3 forKey:(_QWORD *)a4
{
  unint64_t v4;
  uint64_t v8;
  id v9;
  _QWORD *v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint8x8_t v14;
  void **v15;
  _QWORD *v16;
  unint64_t v17;
  float v19;
  float v20;
  _BOOL8 v21;
  unint64_t v22;
  unint64_t v23;
  size_t v24;
  uint64_t v25;
  _QWORD *v26;
  unint64_t v27;
  void *v28;
  id v29;

  if (*(_QWORD *)(a1 + 8))
  {
    v29 = 0;
    v8 = *(_QWORD *)(a1 + 16);
  }
  else
  {
    v9 = a3;
    v8 = *(_QWORD *)(a1 + 16);
    v10 = std::__hash_table<std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,std::__unordered_map_hasher<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,hashkey,eqkey,true>,std::__unordered_map_equal<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,eqkey,hashkey,true>,std::allocator<std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>>>::find<_GEOTileKey>((_QWORD *)v8, a4);
    if (v10)
      v29 = (id)v10[4];
    else
      v29 = 0;
  }
  v11 = GEOTileKeyHash(a4);
  v12 = v11;
  v13 = *(_QWORD *)(v8 + 8);
  if (!v13)
    goto LABEL_27;
  v14 = (uint8x8_t)vcnt_s8((int8x8_t)v13);
  v14.i16[0] = vaddlv_u8(v14);
  if (v14.u32[0] > 1uLL)
  {
    v4 = v11;
    if (v11 >= v13)
      v4 = v11 % v13;
  }
  else
  {
    v4 = (v13 - 1) & v11;
  }
  v15 = *(void ***)(*(_QWORD *)v8 + 8 * v4);
  if (!v15 || (v16 = *v15) == 0)
  {
LABEL_27:
    v16 = operator new(0x28uLL);
    *v16 = 0;
    v16[1] = v12;
    *((_OWORD *)v16 + 1) = *(_OWORD *)a4;
    v16[4] = 0;
    v19 = (float)(unint64_t)(*(_QWORD *)(v8 + 24) + 1);
    v20 = *(float *)(v8 + 32);
    if (!v13 || (float)(v20 * (float)v13) < v19)
    {
      v21 = 1;
      if (v13 >= 3)
        v21 = (v13 & (v13 - 1)) != 0;
      v22 = v21 | (2 * v13);
      v23 = vcvtps_u32_f32(v19 / v20);
      if (v22 <= v23)
        v24 = v23;
      else
        v24 = v22;
      std::__hash_table<google::protobuf::Descriptor const*,std::hash<google::protobuf::Descriptor const*>,std::equal_to<google::protobuf::Descriptor const*>,std::allocator<google::protobuf::Descriptor const*>>::__rehash<true>(v8, v24);
      v13 = *(_QWORD *)(v8 + 8);
      if ((v13 & (v13 - 1)) != 0)
      {
        if (v12 >= v13)
          v4 = v12 % v13;
        else
          v4 = v12;
      }
      else
      {
        v4 = (v13 - 1) & v12;
      }
    }
    v25 = *(_QWORD *)v8;
    v26 = *(_QWORD **)(*(_QWORD *)v8 + 8 * v4);
    if (v26)
    {
      *v16 = *v26;
      v28 = v29;
    }
    else
    {
      *v16 = *(_QWORD *)(v8 + 16);
      *(_QWORD *)(v8 + 16) = v16;
      *(_QWORD *)(v25 + 8 * v4) = v8 + 16;
      v28 = v29;
      if (!*v16)
      {
LABEL_48:
        ++*(_QWORD *)(v8 + 24);
        goto LABEL_49;
      }
      v27 = *(_QWORD *)(*v16 + 8);
      if ((v13 & (v13 - 1)) != 0)
      {
        if (v27 >= v13)
          v27 %= v13;
      }
      else
      {
        v27 &= v13 - 1;
      }
      v26 = (_QWORD *)(*(_QWORD *)v8 + 8 * v27);
    }
    *v26 = v16;
    goto LABEL_48;
  }
  while (1)
  {
    v17 = v16[1];
    if (v17 == v11)
      break;
    if (v14.u32[0] > 1uLL)
    {
      if (v17 >= v13)
        v17 %= v13;
    }
    else
    {
      v17 &= v13 - 1;
    }
    if (v17 != v4)
      goto LABEL_27;
LABEL_26:
    v16 = (_QWORD *)*v16;
    if (!v16)
      goto LABEL_27;
  }
  if (v16[2] != *a4 || v16[3] != a4[1])
    goto LABEL_26;
  v28 = v29;
LABEL_49:
  v16[4] = a3;

}

- (GEOTileKeyMap)initWithMapType:(int64_t)a3 capacity:(unint64_t)a4
{
  GEOTileKeyMap *v6;
  GEOTileKeyMap *v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)GEOTileKeyMap;
  v6 = -[GEOTileKeyMap init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_type = a3;
    v8 = operator new();
    *(_OWORD *)v8 = 0u;
    *(_OWORD *)(v8 + 16) = 0u;
    *(_DWORD *)(v8 + 32) = 1065353216;
    v7->_map = (void *)v8;
    if (a4)
      std::__hash_table<google::protobuf::Descriptor const*,std::hash<google::protobuf::Descriptor const*>,std::equal_to<google::protobuf::Descriptor const*>,std::allocator<google::protobuf::Descriptor const*>>::__rehash<true>(v8, (unint64_t)(float)a4);
  }
  return v7;
}

- (GEOTileKeyMap)initWithMapType:(int64_t)a3
{
  return -[GEOTileKeyMap initWithMapType:capacity:](self, "initWithMapType:capacity:", a3, 0);
}

- (void)reserveCapacity:(unint64_t)a3
{
  std::__hash_table<google::protobuf::Descriptor const*,std::hash<google::protobuf::Descriptor const*>,std::equal_to<google::protobuf::Descriptor const*>,std::allocator<google::protobuf::Descriptor const*>>::__rehash<true>((uint64_t)self->_map, vcvtps_u32_f32((float)a3 / *((float *)self->_map + 8)));
}

- (void)removeObjectForKey:(_QWORD *)a3
{
  _QWORD *v4;
  uint64_t *v5;
  int8x8_t v6;
  uint64_t v7;
  unint64_t v8;
  uint8x8_t v9;
  uint64_t *v10;
  uint64_t *v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  id v15;

  v4 = *(_QWORD **)(a1 + 16);
  v5 = std::__hash_table<std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,std::__unordered_map_hasher<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,hashkey,eqkey,true>,std::__unordered_map_equal<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,eqkey,hashkey,true>,std::allocator<std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>>>::find<_GEOTileKey>(v4, a3);
  if (v5)
  {
    if (*(_QWORD *)(a1 + 8))
      v15 = 0;
    else
      v15 = (id)v5[4];
    v6 = (int8x8_t)v4[1];
    v7 = *v5;
    v8 = v5[1];
    v9 = (uint8x8_t)vcnt_s8(v6);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      if (v8 >= *(_QWORD *)&v6)
        v8 %= *(_QWORD *)&v6;
    }
    else
    {
      v8 &= *(_QWORD *)&v6 - 1;
    }
    v10 = *(uint64_t **)(*v4 + 8 * v8);
    do
    {
      v11 = v10;
      v10 = (uint64_t *)*v10;
    }
    while (v10 != v5);
    if (v11 == v4 + 2)
      goto LABEL_23;
    v12 = v11[1];
    if (v9.u32[0] > 1uLL)
    {
      if (v12 >= *(_QWORD *)&v6)
        v12 %= *(_QWORD *)&v6;
    }
    else
    {
      v12 &= *(_QWORD *)&v6 - 1;
    }
    if (v12 != v8)
    {
LABEL_23:
      if (v7)
      {
        v13 = *(_QWORD *)(v7 + 8);
        if (v9.u32[0] > 1uLL)
        {
          v14 = *(_QWORD *)(v7 + 8);
          if (v13 >= *(_QWORD *)&v6)
            v14 = v13 % *(_QWORD *)&v6;
        }
        else
        {
          v14 = v13 & (*(_QWORD *)&v6 - 1);
        }
        if (v14 == v8)
          goto LABEL_27;
      }
      *(_QWORD *)(*v4 + 8 * v8) = 0;
      v7 = *v5;
    }
    if (!v7)
    {
LABEL_33:
      *v11 = v7;
      *v5 = 0;
      --v4[3];
      operator delete(v5);

      return;
    }
    v13 = *(_QWORD *)(v7 + 8);
LABEL_27:
    if (v9.u32[0] > 1uLL)
    {
      if (v13 >= *(_QWORD *)&v6)
        v13 %= *(_QWORD *)&v6;
    }
    else
    {
      v13 &= *(_QWORD *)&v6 - 1;
    }
    if (v13 != v8)
    {
      *(_QWORD *)(*v4 + 8 * v13) = v11;
      v7 = *v5;
    }
    goto LABEL_33;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  _DWORD *map;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t i;
  uint64_t *v10;
  uint64_t *v11;
  _QWORD *v12;
  __int128 v13;
  uint64_t **j;
  uint64_t *v15;
  uint64_t *v17;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithMapType:", self->_type);
  map = self->_map;
  v6 = v4[2];
  if ((_DWORD *)v6 != map)
  {
    *(_DWORD *)(v6 + 32) = map[8];
    v7 = (uint64_t *)*((_QWORD *)map + 2);
    v8 = *(_QWORD *)(v6 + 8);
    if (!v8)
      goto LABEL_10;
    for (i = 0; i != v8; *(_QWORD *)(*(_QWORD *)v6 + 8 * i++) = 0)
      ;
    v10 = *(uint64_t **)(v6 + 16);
    *(_QWORD *)(v6 + 16) = 0;
    *(_QWORD *)(v6 + 24) = 0;
    if (v10)
    {
      while (v7)
      {
        *((_OWORD *)v10 + 1) = *((_OWORD *)v7 + 1);
        v10[4] = v7[4];
        v11 = (uint64_t *)*v10;
        std::__hash_table<std::__hash_value_type<_GEOTileKey,void const*>,std::__unordered_map_hasher<_GEOTileKey,std::__hash_value_type<_GEOTileKey,void const*>,hashkey,eqkey,true>,std::__unordered_map_equal<_GEOTileKey,std::__hash_value_type<_GEOTileKey,void const*>,eqkey,hashkey,true>,std::allocator<std::__hash_value_type<_GEOTileKey,void const*>>>::__node_insert_multi(v6, v10);
        v7 = (uint64_t *)*v7;
        v10 = v11;
        if (!v11)
          goto LABEL_10;
      }
      do
      {
        v17 = (uint64_t *)*v10;
        operator delete(v10);
        v10 = v17;
      }
      while (v17);
    }
    else
    {
LABEL_10:
      while (v7)
      {
        v12 = operator new(0x28uLL);
        *v12 = 0;
        v12[1] = 0;
        v13 = *((_OWORD *)v7 + 1);
        v12[4] = v7[4];
        *((_OWORD *)v12 + 1) = v13;
        v12[1] = GEOTileKeyHash(v12 + 2);
        std::__hash_table<std::__hash_value_type<_GEOTileKey,void const*>,std::__unordered_map_hasher<_GEOTileKey,std::__hash_value_type<_GEOTileKey,void const*>,hashkey,eqkey,true>,std::__unordered_map_equal<_GEOTileKey,std::__hash_value_type<_GEOTileKey,void const*>,eqkey,hashkey,true>,std::allocator<std::__hash_value_type<_GEOTileKey,void const*>>>::__node_insert_multi(v6, v12);
        v7 = (uint64_t *)*v7;
      }
    }
  }
  if (!self->_type)
  {
    for (j = (uint64_t **)*((_QWORD *)self->_map + 2); j; j = (uint64_t **)*j)
      v15 = j[4];
  }
  return v4;
}

- (GEOTileKeyMap)init
{
  GEOTileKeyMap *result;

  result = (GEOTileKeyMap *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (id)contentsDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  uint64_t *i;
  char v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  v5 = (void *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p>"), NSStringFromClass(v4), self);
  for (i = (uint64_t *)*((_QWORD *)self->_map + 2); i; i = (uint64_t *)*i)
  {
    *(_OWORD *)v8 = *((_OWORD *)i + 1);
    objc_msgSend(v5, "appendFormat:", CFSTR("\n%@ => %@"), GEOStringFromTileKey(v8), i[4]);
  }
  return v5;
}

- (unint64_t)count
{
  return *((_QWORD *)self->_map + 3);
}

@end
