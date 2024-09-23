@implementation MDLObject

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->name, 0);
  objc_storeStrong((id *)&self->_instance, 0);
  objc_storeStrong((id *)&self->_components, 0);
  objc_destroyWeak((id *)&self->_parent);
}

- (void)setHidden:(BOOL)hidden
{
  self->_hidden = hidden;
}

- (void)setTransform:(id)transform
{
  objc_msgSend_setComponent_forProtocol_(self, a2, (uint64_t)transform, &unk_1F03B9AF8);
}

- (void)setComponent:(id)component forProtocol:(Protocol *)protocol
{
  const char *v6;
  Protocol *v7;
  NSMapTable *components;
  NSMapTable *v9;
  NSMapTable *v10;
  id v11;

  v11 = component;
  v7 = protocol;
  components = self->_components;
  if (!components)
  {
    v9 = (NSMapTable *)objc_opt_new();
    v10 = self->_components;
    self->_components = v9;

    components = self->_components;
  }
  objc_msgSend_setObject_forKey_(components, v6, (uint64_t)v11, v7);

}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (MDLObject)init
{
  const char *v2;
  uint64_t v3;
  MDLObject *v4;
  uint64_t v5;
  uint64_t v6;
  NSString *name;
  void *v8;
  void *v9;
  const char *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MDLObject;
  v4 = -[MDLObject init](&v12, sel_init);
  if (v4)
  {
    v5 = dword_1F03B51A0++;
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v2, (uint64_t)CFSTR("Obj%d"), v5);
    v6 = objc_claimAutoreleasedReturnValue();
    name = v4->name;
    v4->name = (NSString *)v6;

  }
  objc_msgSend_children(v4, v2, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = (void *)objc_opt_new();
    objc_msgSend_setChildren_(v4, v10, (uint64_t)v9);

  }
  return v4;
}

- (void)setChildren:(id)children
{
  objc_storeStrong((id *)&self->_children, children);
}

- (void)addChild:(MDLObject *)child
{
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  const char *v13;
  MDLObject *v14;

  v14 = child;
  if (v14)
  {
    objc_msgSend_children(self, v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v9 = (void *)objc_opt_new();
      objc_msgSend_setChildren_(self, v10, (uint64_t)v9);

    }
    objc_msgSend_children(self, v7, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v11, v12, (uint64_t)v14);

    objc_msgSend_setParent_(v14, v13, (uint64_t)self);
  }

}

- (void)enumerateChildObjectsOfClass:(Class)objectClass root:(MDLObject *)root usingBlock:(void *)block stopPointer:(BOOL *)stopPointer
{
  const char *v9;
  uint64_t v10;
  void (**v11)(void *, void *, BOOL *);
  BOOL *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  const char *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  char v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v11 = block;
  v25 = 0;
  if (stopPointer)
    v12 = stopPointer;
  else
    v12 = (BOOL *)&v25;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend_children(root, v9, v10, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v21, v26, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v22;
LABEL_6:
    v17 = 0;
    while (1)
    {
      if (*(_QWORD *)v22 != v16)
        objc_enumerationMutation(v13);
      v18 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v17);
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v11[2](v11, v18, v12);
      if (*v12)
        break;
      objc_msgSend_enumerateChildObjectsOfClass_root_usingBlock_stopPointer_(v18, v19, (uint64_t)objectClass, v18, v11, v12);
      if (*v12)
        break;
      if (v15 == ++v17)
      {
        v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v20, (uint64_t)&v21, v26, 16);
        if (v15)
          goto LABEL_6;
        break;
      }
    }
  }

}

- (id)children
{
  return self->_children;
}

- (void)setParent:(MDLObject *)parent
{
  objc_storeWeak((id *)&self->_parent, parent);
}

- (id)componentConformingToProtocol:(Protocol *)protocol
{
  objc_msgSend_objectForKey_(self->_components, a2, (uint64_t)protocol);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)transform
{
  return (id)objc_msgSend_componentConformingToProtocol_(self, a2, (uint64_t)&unk_1F03B9AF8);
}

- (NSString)name
{
  return self->name;
}

- (id)objectForKeyedSubscript:(Protocol *)key
{
  objc_msgSend_componentConformingToProtocol_(self, a2, (uint64_t)key);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)components
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_objectEnumerator(self->_components, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allObjects(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v6;
}

- (MDLObject)parent
{
  return (MDLObject *)objc_loadWeakRetained((id *)&self->_parent);
}

- (NSString)path
{
  NSString *name;
  uint64_t v4;
  NSString *v5;
  NSString *v6;
  char *v7;
  _BYTE *v8;
  __int128 v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  char *v13;
  std::string::size_type v14;
  __int128 v15;
  _BYTE *v16;
  const char *v17;
  uint64_t v18;
  id *WeakRetained;
  id v20;
  const char *v21;
  char *v22;
  std::string::size_type size;
  int v24;
  const char *v25;
  void *v26;
  const char *v27;
  _OWORD *v28;
  __int128 v29;
  _BYTE *v30;
  id *v31;
  _BYTE *v32;
  const std::string::value_type *v33;
  const std::string::value_type *v34;
  int v35;
  const std::string::value_type *v36;
  std::string::size_type v37;
  void *v38;
  void *v40[2];
  char v41;
  std::string __p;
  uint64_t v43;
  _BYTE *v44;
  unint64_t v45;
  std::string v46;
  char *v47;
  unint64_t *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  name = self->name;
  if (!name)
  {
    v4 = dword_1F03B51A0++;
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("Obj%d"), v4);
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = self->name;
    self->name = v5;

    name = self->name;
  }
  v43 = 0;
  v44 = 0;
  v45 = 0;
  v7 = (char *)objc_msgSend_cStringUsingEncoding_(name, a2, 4);
  sub_1DCB0345C(v40, v7);
  sub_1DCC1DA94((uint64_t)v40, (unsigned __int8 **)&__p);
  v8 = v44;
  if ((unint64_t)v44 >= v45)
  {
    v10 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)&v44[-v43] >> 3);
    v11 = v10 + 1;
    if (v10 + 1 > 0xAAAAAAAAAAAAAAALL)
      sub_1DCAE4C44();
    if (0x5555555555555556 * ((uint64_t)(v45 - v43) >> 3) > v11)
      v11 = 0x5555555555555556 * ((uint64_t)(v45 - v43) >> 3);
    if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v45 - v43) >> 3) >= 0x555555555555555)
      v12 = 0xAAAAAAAAAAAAAAALL;
    else
      v12 = v11;
    v48 = &v45;
    if (v12)
      v13 = (char *)sub_1DCB01278((uint64_t)&v45, v12);
    else
      v13 = 0;
    v14 = (std::string::size_type)&v13[24 * v10];
    v46.__r_.__value_.__r.__words[0] = (std::string::size_type)v13;
    v46.__r_.__value_.__l.__size_ = v14;
    v47 = &v13[24 * v12];
    v15 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
    *(_QWORD *)(v14 + 16) = *((_QWORD *)&__p.__r_.__value_.__l + 2);
    *(_OWORD *)v14 = v15;
    memset(&__p, 0, sizeof(__p));
    v46.__r_.__value_.__r.__words[2] = v14 + 24;
    sub_1DCC1EA70(&v43, &v46);
    v16 = v44;
    sub_1DCC1EBF8((uint64_t)&v46);
    v44 = v16;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
  else
  {
    v9 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
    *((_QWORD *)v44 + 2) = *((_QWORD *)&__p.__r_.__value_.__l + 2);
    *(_OWORD *)v8 = v9;
    memset(&__p, 0, sizeof(__p));
    v44 = v8 + 24;
  }
  if (v41 < 0)
    operator delete(v40[0]);
  WeakRetained = (id *)objc_loadWeakRetained((id *)&self->_parent);
  if (WeakRetained)
  {
    do
    {
      memset(&__p, 0, sizeof(__p));
      objc_msgSend_name(WeakRetained, v17, v18);
      v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v22 = (char *)objc_msgSend_cStringUsingEncoding_(v20, v21, 4);
      sub_1DCB0345C(&__p, v22);

      size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        size = __p.__r_.__value_.__l.__size_;
      if (!size)
      {
        bzero(&v46, 0x400uLL);
        v24 = dword_1F03B51A4++;
        sprintf((char *)&v46, "mdl%d", v24);
        MEMORY[0x1DF0D201C](&__p, &v46);
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v25, (uint64_t)&__p, 4);
        else
          objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v25, (uint64_t)__p.__r_.__value_.__l.__data_, 4);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setName_(WeakRetained, v27, (uint64_t)v26);

      }
      sub_1DCC1DA94((uint64_t)&__p, (unsigned __int8 **)&v46);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      __p = v46;
      v28 = v44;
      if ((unint64_t)v44 >= v45)
      {
        v30 = (_BYTE *)sub_1DCC1EC80(&v43, (__int128 *)&__p);
      }
      else
      {
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        {
          sub_1DCACA658(v44, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
        }
        else
        {
          v29 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
          *((_QWORD *)v44 + 2) = *((_QWORD *)&__p.__r_.__value_.__l + 2);
          *v28 = v29;
        }
        v30 = (char *)v28 + 24;
      }
      v44 = v30;
      v31 = (id *)objc_loadWeakRetained(WeakRetained + 1);

      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      WeakRetained = v31;
    }
    while (v31);
  }
  memset(&v46, 0, sizeof(v46));
  v32 = v44;
  while (v32 != (_BYTE *)v43)
  {
    std::string::append(&v46, "/");
    v34 = (const std::string::value_type *)*((_QWORD *)v32 - 3);
    v32 -= 24;
    v33 = v34;
    v35 = (char)v32[23];
    if (v35 >= 0)
      v36 = v32;
    else
      v36 = v33;
    if (v35 >= 0)
      v37 = v32[23];
    else
      v37 = *((_QWORD *)v32 + 1);
    std::string::append(&v46, v36, v37);
  }
  if ((v46.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v17, (uint64_t)&v46, 4);
  else
    objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v17, (uint64_t)v46.__r_.__value_.__l.__data_, 4);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (SHIBYTE(v46.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v46.__r_.__value_.__l.__data_);
  v46.__r_.__value_.__r.__words[0] = (std::string::size_type)&v43;
  sub_1DCB2ED4C((void ***)&v46);
  return (NSString *)v38;
}

- (MDLObject)objectAtPath:(NSString *)path
{
  NSString *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  MDLObject *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  const char *v18;
  MDLObject *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  int isEqualToString;
  uint64_t v29;
  uint64_t v30;
  NSString *v32;
  MDLObject *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = path;
  v32 = v4;
  if (v4 && objc_msgSend_length(v4, v5, v6))
  {
    objc_msgSend_componentsSeparatedByString_(v32, v7, (uint64_t)CFSTR("/"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v8;
    if (v8 && objc_msgSend_count(v8, v9, v10))
    {
      v12 = self;
      v15 = 0;
      while (1)
      {
        v36 = 0u;
        v37 = 0u;
        v34 = 0u;
        v35 = 0u;
        v33 = v12;
        objc_msgSend_children(v12, v13, v14, v32);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (MDLObject *)objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v34, v38, 16);
        if (!v19)
          break;
        v20 = *(_QWORD *)v35;
LABEL_8:
        v21 = 0;
        while (1)
        {
          if (*(_QWORD *)v35 != v20)
            objc_enumerationMutation(v16);
          v22 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v21);
          objc_msgSend_objectAtIndexedSubscript_(v11, v18, v15);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_name(v22, v24, v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          isEqualToString = objc_msgSend_isEqualToString_(v23, v27, (uint64_t)v26);

          if (isEqualToString)
            break;
          if (v19 == (MDLObject *)++v21)
          {
            v19 = (MDLObject *)objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v18, (uint64_t)&v34, v38, 16);
            if (v19)
              goto LABEL_8;
            goto LABEL_20;
          }
        }
        v30 = objc_msgSend_count(v11, v18, v29) - 1;
        v19 = v22;
        if (v30 == v15)
          break;

        ++v15;
        v12 = v19;
        if (!v19)
          goto LABEL_21;
      }
LABEL_20:

    }
    else
    {
      v19 = 0;
    }
LABEL_21:

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)description
{
  id v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  MDLObject *v17;

  v17 = self;
  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  objc_msgSend_name(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_children(v17, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_count(v10, v11, v12);
  v15 = (void *)objc_msgSend_initWithFormat_(v3, v14, (uint64_t)CFSTR("<<%@: 0x%lx>, Name: %@, Children: %d>"), v4, &v17, v7, v13);

  return v15;
}

- (id)recursiveDescription
{
  uint64_t v2;
  void *v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  unint64_t i;
  void *v9;
  const char *v10;
  uint64_t v11;
  unint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  __CFString *v27;
  __CFString *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  char v33;
  unsigned int v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  const char *v42;
  void *v43;

  objc_msgSend_string(MEMORY[0x1E0CB37A0], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v4, v5, (uint64_t)CFSTR("%@\n"), self);
  for (i = 0; ; ++i)
  {
    objc_msgSend_children(self, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend_count(v9, v10, v11);

    if (i >= v12)
      break;
    objc_msgSend_children(self, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v15, v16, i);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recursiveDescription(v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_children(self, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend_count(v23, v24, v25);
    v27 = CFSTR("    ");
    if (i < v26 - 1)
      v27 = CFSTR(" |  ");
    v28 = v27;

    objc_msgSend_componentsSeparatedByString_(v20, v29, (uint64_t)CFSTR("\n"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0;
    v34 = 0;
    while (1)
    {
      v36 = v34;
      if (objc_msgSend_count(v32, v30, v31) <= (unint64_t)v34)
        break;
      objc_msgSend_objectAtIndexedSubscript_(v32, v35, v34);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend_length(v37, v38, v39);

      if (!v40)
        break;
      objc_msgSend_objectAtIndexedSubscript_(v32, v41, v36);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v33 & 1) != 0)
        objc_msgSend_appendFormat_(v4, v42, (uint64_t)CFSTR("%@%@\n"), v28, v43);
      else

      v34 = v36 + 1;
      v33 = 1;
    }

  }
  return v4;
}

- (MDLAxisAlignedBoundingBox)boundingBoxAtTime:(SEL)a3
{
  float32x4_t v4;
  float32x4_t v5;
  MDLAxisAlignedBoundingBox *result;
  __int128 v7;
  float32x4_t v8[4];

  v4 = *(float32x4_t *)(MEMORY[0x1E0C83FF0] + 16);
  v8[0] = *(float32x4_t *)MEMORY[0x1E0C83FF0];
  v8[1] = v4;
  v5 = *(float32x4_t *)(MEMORY[0x1E0C83FF0] + 48);
  v8[2] = *(float32x4_t *)(MEMORY[0x1E0C83FF0] + 32);
  v8[3] = v5;
  sub_1DCC1E6C4(self, v8, (uint64_t)&v7);
  return result;
}

- (MDLObject)instance
{
  return self->_instance;
}

- (void)setInstance:(MDLObject *)instance
{
  objc_storeStrong((id *)&self->_instance, instance);
}

- (BOOL)hidden
{
  return self->_hidden;
}

@end
