@implementation XRIntKeyedDictionary

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (XRIntKeyedDictionary)initWithIntKeyedDictionary:(id)a3 copyObjects:(BOOL)a4
{
  id v6;
  XRIntKeyedDictionary *v7;
  XRIntKeyedDictionary *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[4];
  XRIntKeyedDictionary *v14;
  BOOL v15;
  objc_super v16;

  v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)XRIntKeyedDictionary;
  v7 = -[XRIntKeyedDictionary init](&v16, sel_init);
  v8 = v7;
  if (v6 && v7)
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = sub_226365AA4;
    v13[3] = &unk_24EDC4470;
    v15 = a4;
    v14 = v7;
    objc_msgSend_enumerateObjectsAndIntegerKeys_(v6, v9, (uint64_t)v13, v10, v11);

  }
  return v8;
}

- (XRIntKeyedDictionary)init
{
  return (XRIntKeyedDictionary *)((uint64_t (*)(XRIntKeyedDictionary *, char *, _QWORD, _QWORD))MEMORY[0x24BEDD108])(self, sel_initWithIntKeyedDictionary_copyObjects_, 0, 0);
}

- (XRIntKeyedDictionary)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  XRIntKeyedDictionary *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int i;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  void *v27;
  uint64_t v29;
  unsigned int v30;
  uint64_t *v31;

  v4 = a3;
  v10 = (XRIntKeyedDictionary *)objc_msgSend_init(self, v5, v6, v7, v8);
  if (v10)
  {
    v30 = 0;
    objc_msgSend_decodeValueOfObjCType_at_size_(v4, v9, (uint64_t)"I", (uint64_t)&v30, 4);
    if (v30)
    {
      for (i = 0; i < v30; ++i)
      {
        v29 = 0;
        objc_msgSend_decodeObject(v4, v11, v12, v13, v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend_unsignedLongLongValue(v16, v17, v18, v19, v20);

        objc_msgSend_decodeObject(v4, v21, v22, v23, v24);
        v25 = objc_claimAutoreleasedReturnValue();
        v31 = &v29;
        v26 = sub_2263661D4((uint64_t)&v10->_hash_map, (unint64_t *)&v29, (uint64_t)&unk_2263745A0, &v31);
        v27 = (void *)v26[3];
        v26[3] = v25;

      }
    }
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  __compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long long, id>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long, id>, void *>>> *i;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  int value;

  v4 = a3;
  value = self->_hash_map.__table_.__p2_.__value_;
  objc_msgSend_encodeValueOfObjCType_at_(v4, v5, (uint64_t)"I", (uint64_t)&value, v6);
  for (i = &self->_hash_map.__table_.__p1_; ; objc_msgSend_encodeObject_(v4, v15, (uint64_t)i[3].__value_.__next_, v16, v17))
  {
    i = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long long, id>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long, id>, void *>>> *)i->__value_.__next_;
    if (!i)
      break;
    objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x24BDD16E0], v7, (uint64_t)i[2].__value_.__next_, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_encodeObject_(v4, v12, (uint64_t)v11, v13, v14);

  }
}

- (id)objectForIntegerKey:(unint64_t)a3
{
  return (id)((uint64_t (*)(XRIntKeyedDictionary *, char *, unint64_t, _QWORD))MEMORY[0x24BEDD108])(self, sel_objectForIntegerKey_options_, a3, 0);
}

- (id)objectForIntegerKey:(unint64_t)a3 options:(unint64_t)a4
{
  char v4;
  unordered_map<unsigned long long, id, std::hash<unsigned long long>, std::equal_to<unsigned long long>, std::allocator<std::pair<const unsigned long long, id>>> *p_hash_map;
  _QWORD *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v12;
  id *v13;
  unint64_t v14;
  unint64_t *v15;

  v4 = a4;
  v14 = a3;
  p_hash_map = &self->_hash_map;
  v7 = sub_2263666BC(&self->_hash_map.__table_.__bucket_list_.__ptr_.__value_, &v14);
  if (v7)
    return (id)v7[3];
  if ((v4 & 1) == 0)
    return 0;
  v12 = (void *)objc_msgSend_mutableCopyWithZone_(self->_prototype, v8, 0, v9, v10);
  v15 = &v14;
  v13 = (id *)sub_2263661D4((uint64_t)p_hash_map, &v14, (uint64_t)&unk_2263745A0, &v15);
  objc_storeStrong(v13 + 3, v12);
  return v12;
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  return (id)((uint64_t (*)(XRIntKeyedDictionary *, char *, unint64_t, _QWORD))MEMORY[0x24BEDD108])(self, sel_objectForIntegerKey_options_, a3, 0);
}

- (void)setPrototypeObject:(id)a3
{
  objc_storeStrong((id *)&self->_prototype, a3);
}

- (void)setObject:(id)a3 forIntegerKey:(unint64_t)a4
{
  id v6;
  id *v7;
  char v8;
  char v9;
  unint64_t v10;
  id v11;

  v10 = a4;
  v6 = a3;
  v11 = v6;
  v7 = (id *)sub_226366770((uint64_t)&self->_hash_map, &v10, (uint64_t *)&v10);
  v9 = v8;

  if (!v9)
    objc_storeStrong(v7 + 3, a3);

}

- (void)removeObjectForIntegerKey:(unint64_t)a3
{
  unint64_t v3;

  v3 = a3;
  sub_2263669B8(&self->_hash_map.__table_.__bucket_list_.__ptr_.__value_, &v3);
}

- (void)removeAllObjects
{
  sub_226366B7C((uint64_t)&self->_hash_map);
}

- (id)allObjects
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[4];
  id v12;

  objc_msgSend_arrayWithCapacity_(MEMORY[0x24BDBCEB8], a2, self->_hash_map.__table_.__p2_.__value_, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = sub_226365FC8;
  v11[3] = &unk_24EDC4498;
  v6 = v5;
  v12 = v6;
  objc_msgSend_enumerateObjectsAndIntegerKeys_(self, v7, (uint64_t)v11, v8, v9);

  return v6;
}

- (id)allKeys
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[4];
  id v12;

  objc_msgSend_arrayWithCapacity_(MEMORY[0x24BDBCEB8], a2, self->_hash_map.__table_.__p2_.__value_, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = sub_226366074;
  v11[3] = &unk_24EDC4498;
  v6 = v5;
  v12 = v6;
  objc_msgSend_enumerateObjectsAndIntegerKeys_(self, v7, (uint64_t)v11, v8, v9);

  return v6;
}

- (void)enumerateObjectsAndIntegerKeys:(id)a3
{
  _QWORD *next;
  BOOL v5;
  char v6;

  v6 = 0;
  next = self->_hash_map.__table_.__p1_.__value_.__next_;
  if (next)
  {
    do
    {
      (*((void (**)(id, _QWORD, _QWORD, char *))a3 + 2))(a3, next[3], next[2], &v6);
      next = (_QWORD *)*next;
      if (next)
        v5 = v6 == 0;
      else
        v5 = 0;
    }
    while (v5);
  }
}

- (unint64_t)count
{
  return self->_hash_map.__table_.__p2_.__value_;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  XRIntKeyedDictionary *v4;
  XRIntKeyedDictionary *v5;

  v4 = (XRIntKeyedDictionary *)objc_opt_new();
  v5 = v4;
  if (v4 != self)
  {
    v4->_hash_map.__table_.__p3_.__value_ = self->_hash_map.__table_.__p3_.__value_;
    sub_226366C0C(&v4->_hash_map.__table_.__bucket_list_.__ptr_.__value_, (_QWORD *)self->_hash_map.__table_.__p1_.__value_.__next_, 0);
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prototype, 0);
  sub_226367260((uint64_t)&self->_hash_map);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *((_DWORD *)self + 10) = 1065353216;
  return self;
}

@end
