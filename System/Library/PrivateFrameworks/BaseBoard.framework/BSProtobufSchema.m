@implementation BSProtobufSchema

- (BSProtobufSchema)init
{
  BSProtobufSchema *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BSProtobufSchema;
  v2 = -[BSProtobufSchema init](&v4, sel_init);
  if (v2)
    v2->_memoryData = (NSMutableData *)objc_alloc_init(MEMORY[0x1E0C99DF0]);
  return v2;
}

- (void)dealloc
{
  int64_t fieldCount;
  uint64_t v4;
  void *v5;
  objc_super v6;

  fieldCount = self->_fieldCount;
  if (fieldCount >= 1)
  {
    v4 = 72;
    do
    {
      v5 = *(void **)((char *)&self->_entries->var0 + v4);
      if (v5)
        free(v5);
      v4 += 96;
      --fieldCount;
    }
    while (fieldCount);
  }

  v6.receiver = self;
  v6.super_class = (Class)BSProtobufSchema;
  -[BSProtobufSchema dealloc](&v6, sel_dealloc);
}

- (void)addField:(const char *)a3
{
  ++self->_autotagIndex;
  -[BSProtobufSchema addField:forTag:](self, "addField:forTag:", a3);
}

- (void)addField:(const char *)a3 forTag:(int64_t)a4
{
  unsigned int v4;
  _BSProtobufFieldEntry *v8;
  int64_t fieldCount;
  _BSProtobufFieldEntry *v10;
  objc_class *rootClass;
  objc_ivar *InstanceVariable;
  ptrdiff_t Offset;
  const char *TypeEncoding;
  const char *v15;
  size_t v16;
  int v17;
  NSString *v18;
  Class v19;
  Class v20;
  objc_class *v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t, _QWORD *);
  uint64_t (*v26)(uint64_t, uint64_t, _QWORD *);
  void *v27;
  void *v28;
  NSString *v29;
  objc_class *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  const __CFString *v38;
  __int16 v39;
  _BYTE v40[18];
  __int16 v41;
  int v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v4 = a4;
  v45 = *MEMORY[0x1E0C80C00];
  BSProtobufValidateIncomingTag((uint64_t)self, a4);
  if (self)
  {
    -[NSMutableData increaseLengthBy:](self->_memoryData, "increaseLengthBy:", 96);
    v8 = -[NSMutableData mutableBytes](self->_memoryData, "mutableBytes");
    self->_entries = v8;
    fieldCount = self->_fieldCount;
    v10 = &v8[fieldCount];
    self->_fieldCount = fieldCount + 1;
  }
  else
  {
    v10 = 0;
  }
  v10->var0 = v4;
  rootClass = self->_rootClass;
  InstanceVariable = class_getInstanceVariable(rootClass, a3);
  Offset = ivar_getOffset(InstanceVariable);
  TypeEncoding = ivar_getTypeEncoding(InstanceVariable);
  if (!InstanceVariable)
  {
    v31 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("missing ivar on class %@: %s"), rootClass, a3);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544130;
      v36 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _BSProtobufGetIvarDetails(Class, const char * _Nonnull, Ivar * _Nonnull, ptrdiff_t * _Nonnull, const char ** _Nonnull)");
      v37 = 2114;
      v38 = CFSTR("BSProtobufSerialization.m");
      v39 = 1024;
      *(_DWORD *)v40 = 335;
      *(_WORD *)&v40[4] = 2114;
      *(_QWORD *)&v40[6] = v31;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    qword_1EDF5BAE8 = objc_msgSend(v31, "UTF8String");
    __break(0);
    JUMPOUT(0x18A209A64);
  }
  if (!Offset)
  {
    v32 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("missing offset for %s"), a3);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544130;
      v36 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _BSProtobufGetIvarDetails(Class, const char * _Nonnull, Ivar * _Nonnull, ptrdiff_t * _Nonnull, const char ** _Nonnull)");
      v37 = 2114;
      v38 = CFSTR("BSProtobufSerialization.m");
      v39 = 1024;
      *(_DWORD *)v40 = 336;
      *(_WORD *)&v40[4] = 2114;
      *(_QWORD *)&v40[6] = v32;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    qword_1EDF5BAE8 = objc_msgSend(v32, "UTF8String");
    __break(0);
    JUMPOUT(0x18A209B20);
  }
  v15 = TypeEncoding;
  if (!TypeEncoding)
  {
    v33 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("missing encoding for ivar %@: %s"), rootClass, a3);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544130;
      v36 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _BSProtobufGetIvarDetails(Class, const char * _Nonnull, Ivar * _Nonnull, ptrdiff_t * _Nonnull, const char ** _Nonnull)");
      v37 = 2114;
      v38 = CFSTR("BSProtobufSerialization.m");
      v39 = 1024;
      *(_DWORD *)v40 = 337;
      *(_WORD *)&v40[4] = 2114;
      *(_QWORD *)&v40[6] = v33;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    qword_1EDF5BAE8 = objc_msgSend(v33, "UTF8String");
    __break(0);
    JUMPOUT(0x18A209BDCLL);
  }
  v10->var2 = Offset;
  v10->var3 = InstanceVariable;
  v10->var1 = (char *)TypeEncoding;
  v16 = strlen(TypeEncoding);
  v17 = *(unsigned __int8 *)v15;
  if (v16 < 4 || v17 != 64)
  {
    v24 = ((char)v17 - 66);
    if (v24 <= 0x39
      && (((1 << v24) & 0x2849600028483) != 0
       || v24 == 57
       && (!strncmp("{CGPoint=", v15, 9uLL)
        || !strncmp("{CGRect=", v15, 8uLL)
        || !strncmp("{CGSize=", v15, 8uLL)
        || !strncmp("{CGAffineTransform=", v15, 0x13uLL)
        || !strncmp("{CATransform3D=", v15, 0xFuLL))))
    {
      v10->var6 = _BSProtobufEncodePOD;
      v10->var7 = _BSProtobufDecodePOD;
      v10->var4 = 0;
      return;
    }
LABEL_33:
    v28 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: Unsupported encoding type %s"), a3, v15);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v29 = NSStringFromSelector(a2);
      v30 = (objc_class *)objc_opt_class();
      *(_DWORD *)buf = 138544642;
      v36 = (uint64_t)v29;
      v37 = 2114;
      v38 = (const __CFString *)NSStringFromClass(v30);
      v39 = 2048;
      *(_QWORD *)v40 = self;
      *(_WORD *)&v40[8] = 2114;
      *(_QWORD *)&v40[10] = CFSTR("BSProtobufSerialization.m");
      v41 = 1024;
      v42 = 405;
      v43 = 2114;
      v44 = v28;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1EDF5BAE8 = objc_msgSend(v28, "UTF8String");
    __break(0);
    JUMPOUT(0x18A2099A8);
  }
  if (v15[1] != 34 || v15[v16 - 1] != 34)
    goto LABEL_33;
  v18 = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v15 + 2, v16 - 3, 4);
  v19 = NSClassFromString(v18);
  if (!v19)
  {
    v34 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot find class: %@"), v18);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544130;
      v36 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class  _Nullable _BSGetClassFromEncoding(const char *)");
      v37 = 2114;
      v38 = CFSTR("BSProtobufSerialization.m");
      v39 = 1024;
      *(_DWORD *)v40 = 255;
      *(_WORD *)&v40[4] = 2114;
      *(_QWORD *)&v40[6] = v34;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    qword_1EDF5BAE8 = objc_msgSend(v34, "UTF8String");
    __break(0);
    JUMPOUT(0x18A209C94);
  }
  v20 = v19;

  if (v20 == (Class)objc_opt_class())
  {
    v25 = _BSProtobufEncodeString;
    v26 = _BSProtobufDecodeString;
LABEL_22:
    v10->var6 = v25;
    v10->var7 = v26;
    v10->var4 = v20;
    return;
  }
  if (v20 == (Class)objc_opt_class())
  {
    v25 = _BSProtobufEncodeData;
    v26 = _BSProtobufDecodeData;
    goto LABEL_22;
  }
  v21 = _BSProtobufValidateClassForEncoding((uint64_t)a3, v20);
  v10->var6 = _BSProtobufEncodeObject;
  v10->var7 = _BSProtobufDecodeObject;
  v10->var4 = v21;
  v22 = -[objc_class protobufSchema](v21, "protobufSchema");
  v23 = (_QWORD *)v22;
  while (1)
  {
    v23 = (_QWORD *)v23[2];
    if (!v23)
      break;
    if (v23[7])
      goto LABEL_25;
  }
  v23 = (_QWORD *)v22;
LABEL_25:
  v27 = (void *)v23[8];
  if (v27)
    -[BSProtobufSchema _addSubclassesForField:allowedSubclasses:assertSubclassRelationship:]((uint64_t)self, (uint64_t)a3, v27, 1);
}

- (uint64_t)_addSubclassesForField:(void *)a3 allowedSubclasses:(int)a4 assertSubclassRelationship:
{
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  _BYTE *v17;
  void *v18;
  uint64_t v19;
  int v20;
  objc_class *v21;
  _BYTE *v22;
  void *v23;
  NSString *v24;
  objc_class *v25;
  NSString *v26;
  uint64_t v27;
  _QWORD *v28;
  _QWORD *v30;
  _OWORD *v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  NSString *v42;
  __int16 v43;
  NSString *v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  const __CFString *v48;
  __int16 v49;
  int v50;
  __int16 v51;
  void *v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)(result + 24) - 1;
    v6 = objc_msgSend(a3, "count");
    objc_msgSend(*(id *)(v4 + 48), "increaseLengthBy:", 96 * v6);
    v7 = objc_msgSend(*(id *)(v4 + 48), "mutableBytes");
    *(_QWORD *)(v4 + 40) = v7;
    v8 = *(_QWORD *)(v4 + 24);
    *(_QWORD *)(v4 + 24) = v8 + v6;
    v9 = v7 + 96 * v5;
    *(_QWORD *)(v9 + 64) = v6;
    v34 = v9;
    *(_QWORD *)(v9 + 72) = malloc_type_calloc(v6, 8uLL, 0x2004093837F09uLL);
    v33 = (_QWORD *)(v9 + 72);
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    result = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v37, v53, 16);
    if (result)
    {
      v10 = result;
      v11 = 0;
      v32 = *(_QWORD *)v38;
      v12 = v7 + 96 * v5;
      v28 = (_QWORD *)(v12 + 32);
      v31 = (_OWORD *)(v12 + 40);
      v30 = (_QWORD *)(v12 + 24);
      v13 = (_QWORD *)(v12 + 16);
      v14 = (_QWORD *)(v12 + 8);
      v15 = (_QWORD *)(v12 + 56);
      v27 = v7 + 96 * v8 + 88;
      do
      {
        v16 = 0;
        v17 = (_BYTE *)(v27 + 96 * v11);
        do
        {
          if (*(_QWORD *)v38 != v32)
            objc_enumerationMutation(a3);
          v18 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v16);
          v19 = *(_QWORD *)(v4 + 32);
          v20 = v19 + 1;
          *(_QWORD *)(v4 + 32) = v19 + 1;
          BSProtobufValidateIncomingTag(v4, (v19 + 1));
          if (a4 && (objc_msgSend(v18, "isSubclassOfClass:", *v28) & 1) == 0)
          {
            v23 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("'%@' must be a subclass of '%@'"), v18, *v28);
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              v24 = NSStringFromSelector(sel__addSubclassesForField_allowedSubclasses_assertSubclassRelationship_);
              v25 = (objc_class *)objc_opt_class();
              v26 = NSStringFromClass(v25);
              *(_DWORD *)buf = 138544642;
              v42 = v24;
              v43 = 2114;
              v44 = v26;
              v45 = 2048;
              v46 = v4;
              v47 = 2114;
              v48 = CFSTR("BSProtobufSerialization.m");
              v49 = 1024;
              v50 = 454;
              v51 = 2114;
              v52 = v23;
              _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
            }
            qword_1EDF5BAE8 = objc_msgSend(v23, "UTF8String");
            __break(0);
            JUMPOUT(0x18A20A2E8);
          }
          v21 = _BSProtobufValidateClassForEncoding(a2, v18);
          *((_DWORD *)v17 - 22) = v20;
          v22 = v17 - 88;
          *((_QWORD *)v17 - 7) = v21;
          *((_QWORD *)v17 - 8) = *v30;
          *((_QWORD *)v17 - 9) = *v13;
          *((_QWORD *)v17 - 10) = *v14;
          *((_OWORD *)v17 - 3) = *v31;
          *((_QWORD *)v17 - 4) = *v15;
          *((_QWORD *)v17 - 1) = v34;
          *v17 = 1;
          v17 += 96;
          *(_QWORD *)(*v33 + 8 * v11++) = v22;
          ++v16;
        }
        while (v10 != v16);
        result = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v37, v53, 16);
        v10 = result;
      }
      while (result);
    }
  }
  return result;
}

- (void)addField:(const char *)a3 allowedClasses:(id)a4
{
  int64_t autotagIndex;
  unsigned int v7;
  _BSProtobufFieldEntry *v8;
  int64_t v9;
  _BSProtobufFieldEntry *v10;
  objc_class *rootClass;
  objc_ivar *InstanceVariable;
  ptrdiff_t Offset;
  const char *TypeEncoding;
  const char *v15;
  size_t v16;
  NSString *v17;
  Class v18;
  Class v19;
  objc_class *v20;
  _BSProtobufFieldEntry *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSString *v27;
  objc_class *v28;
  int64_t fieldCount;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  const __CFString *v35;
  __int16 v36;
  _BYTE v37[18];
  __int16 v38;
  int v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  autotagIndex = self->_autotagIndex;
  fieldCount = self->_fieldCount;
  v7 = autotagIndex + 1;
  self->_autotagIndex = autotagIndex + 1;
  -[NSMutableData increaseLengthBy:](self->_memoryData, "increaseLengthBy:", 96);
  v8 = -[NSMutableData mutableBytes](self->_memoryData, "mutableBytes");
  self->_entries = v8;
  v9 = self->_fieldCount;
  v10 = &v8[v9];
  self->_fieldCount = v9 + 1;
  v10->var0 = v7;
  rootClass = self->_rootClass;
  InstanceVariable = class_getInstanceVariable(rootClass, a3);
  Offset = ivar_getOffset(InstanceVariable);
  TypeEncoding = ivar_getTypeEncoding(InstanceVariable);
  if (!InstanceVariable)
  {
    v22 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("missing ivar on class %@: %s"), rootClass, a3);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544130;
      v33 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _BSProtobufGetIvarDetails(Class, const char * _Nonnull, Ivar * _Nonnull, ptrdiff_t * _Nonnull, const char ** _Nonnull)");
      v34 = 2114;
      v35 = CFSTR("BSProtobufSerialization.m");
      v36 = 1024;
      *(_DWORD *)v37 = 335;
      *(_WORD *)&v37[4] = 2114;
      *(_QWORD *)&v37[6] = v22;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    qword_1EDF5BAE8 = objc_msgSend(v22, "UTF8String");
    __break(0);
    JUMPOUT(0x18A20A588);
  }
  if (!Offset)
  {
    v23 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("missing offset for %s"), a3);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544130;
      v33 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _BSProtobufGetIvarDetails(Class, const char * _Nonnull, Ivar * _Nonnull, ptrdiff_t * _Nonnull, const char ** _Nonnull)");
      v34 = 2114;
      v35 = CFSTR("BSProtobufSerialization.m");
      v36 = 1024;
      *(_DWORD *)v37 = 336;
      *(_WORD *)&v37[4] = 2114;
      *(_QWORD *)&v37[6] = v23;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    qword_1EDF5BAE8 = objc_msgSend(v23, "UTF8String");
    __break(0);
    JUMPOUT(0x18A20A644);
  }
  v15 = TypeEncoding;
  if (!TypeEncoding)
  {
    v24 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("missing encoding for ivar %@: %s"), rootClass, a3);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544130;
      v33 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _BSProtobufGetIvarDetails(Class, const char * _Nonnull, Ivar * _Nonnull, ptrdiff_t * _Nonnull, const char ** _Nonnull)");
      v34 = 2114;
      v35 = CFSTR("BSProtobufSerialization.m");
      v36 = 1024;
      *(_DWORD *)v37 = 337;
      *(_WORD *)&v37[4] = 2114;
      *(_QWORD *)&v37[6] = v24;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    qword_1EDF5BAE8 = objc_msgSend(v24, "UTF8String");
    __break(0);
    JUMPOUT(0x18A20A700);
  }
  v10->var3 = InstanceVariable;
  v10->var2 = Offset;
  v10->var1 = (char *)TypeEncoding;
  v16 = strlen(TypeEncoding);
  if (v16 < 4 || *v15 != 64 || v15[1] != 34 || v15[v16 - 1] != 34)
  {
    v26 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ivar '%s' is not a class type and cannot be subclassed"), a3);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v27 = NSStringFromSelector(a2);
      v28 = (objc_class *)objc_opt_class();
      *(_DWORD *)buf = 138544642;
      v33 = (uint64_t)v27;
      v34 = 2114;
      v35 = (const __CFString *)NSStringFromClass(v28);
      v36 = 2048;
      *(_QWORD *)v37 = self;
      *(_WORD *)&v37[8] = 2114;
      *(_QWORD *)&v37[10] = CFSTR("BSProtobufSerialization.m");
      v38 = 1024;
      v39 = 492;
      v40 = 2114;
      v41 = v26;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1EDF5BAE8 = objc_msgSend(v26, "UTF8String");
    __break(0);
    JUMPOUT(0x18A20A890);
  }
  v17 = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v15 + 2, v16 - 3, 4);
  v18 = NSClassFromString(v17);
  if (!v18)
  {
    v25 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot find class: %@"), v17);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544130;
      v33 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class  _Nullable _BSGetClassFromEncoding(const char *)");
      v34 = 2114;
      v35 = CFSTR("BSProtobufSerialization.m");
      v36 = 1024;
      *(_DWORD *)v37 = 255;
      *(_WORD *)&v37[4] = 2114;
      *(_QWORD *)&v37[6] = v25;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    qword_1EDF5BAE8 = objc_msgSend(v25, "UTF8String");
    __break(0);
    JUMPOUT(0x18A20A7B8);
  }
  v19 = v18;

  v20 = _BSProtobufValidateClassForEncoding((uint64_t)a3, v19);
  v21 = &v8[v9];
  v21->var4 = v20;
  v21->var6 = _BSProtobufEncodeObject;
  v21->var7 = _BSProtobufDecodeObject;
  -[BSProtobufSchema _addSubclassesForField:allowedSubclasses:assertSubclassRelationship:]((uint64_t)self, (uint64_t)a3, a4, 1);
  if ((objc_msgSend(a4, "containsObject:", v19) & 1) == 0)
    self->_entries[fieldCount].var9 = 1;
}

- (void)addRepeatingField:(const char *)a3 containsClass:(Class)a4
{
  int64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = self->_autotagIndex + 1;
  self->_autotagIndex = v4;
  v5[0] = a4;
  -[BSProtobufSchema addRepeatingField:forTag:allowedClasses:]((uint64_t)self, a3, v4, (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1));
}

- (void)addRepeatingField:(uint64_t)a3 forTag:(void *)a4 allowedClasses:
{
  objc_class *v8;
  uint64_t v9;
  uint64_t v10;
  objc_class *v11;
  objc_ivar *InstanceVariable;
  ptrdiff_t Offset;
  const char *TypeEncoding;
  const char *v15;
  uint64_t v16;
  size_t v17;
  NSString *v18;
  Class v19;
  uint64_t v20;
  objc_class *v21;
  _QWORD *v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSString *v36;
  objc_class *v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  NSString *v41;
  objc_class *v42;
  uint64_t v43;
  objc_class *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t v49[128];
  uint8_t buf[4];
  uint64_t v51;
  __int16 v52;
  const __CFString *v53;
  __int16 v54;
  _BYTE v55[18];
  __int16 v56;
  int v57;
  __int16 v58;
  void *v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  v8 = (objc_class *)objc_msgSend(a4, "firstObject");
  if (v8 != (objc_class *)objc_opt_class()
    && v8 != (objc_class *)objc_opt_class()
    && v8 != (objc_class *)objc_opt_class()
    && v8 != (objc_class *)objc_opt_class())
  {
    v8 = _BSProtobufValidateClassForEncoding((uint64_t)a2, v8);
  }
  if (a3 < 1)
  {
    v39 = CFSTR("tag must be > 0");
    goto LABEL_68;
  }
  if ((unint64_t)(a3 - 19000) < 0x3E8)
  {
    v39 = CFSTR("tag must not be between 19000 and 19999, inclusive");
    goto LABEL_68;
  }
  v44 = v8;
  if ((unint64_t)a3 >> 29)
  {
    v39 = CFSTR("tag must be <= ((2^29) - 1)");
LABEL_68:
    v40 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v39);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v41 = NSStringFromSelector(sel_addRepeatingField_forTag_allowedClasses_);
      v42 = (objc_class *)objc_opt_class();
      *(_DWORD *)buf = 138544642;
      v51 = (uint64_t)v41;
      v52 = 2114;
      v53 = (const __CFString *)NSStringFromClass(v42);
      v54 = 2048;
      *(_QWORD *)v55 = a1;
      *(_WORD *)&v55[8] = 2114;
      *(_QWORD *)&v55[10] = CFSTR("BSProtobufSerialization.m");
      v56 = 1024;
      v57 = 531;
      v58 = 2114;
      v59 = v40;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1EDF5BAE8 = objc_msgSend(v40, "UTF8String");
    __break(0);
    JUMPOUT(0x18A20B248);
  }
  objc_msgSend(*(id *)(a1 + 48), "increaseLengthBy:", 96);
  v9 = objc_msgSend(*(id *)(a1 + 48), "mutableBytes");
  *(_QWORD *)(a1 + 40) = v9;
  v10 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 24) = v10 + 1;
  v11 = *(objc_class **)(a1 + 8);
  v43 = (uint64_t)a2;
  InstanceVariable = class_getInstanceVariable(v11, a2);
  Offset = ivar_getOffset(InstanceVariable);
  TypeEncoding = ivar_getTypeEncoding(InstanceVariable);
  if (!InstanceVariable)
  {
    v32 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("missing ivar on class %@: %s"), v11, v43);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544130;
      v51 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _BSProtobufGetIvarDetails(Class, const char * _Nonnull, Ivar * _Nonnull, ptrdiff_t * _Nonnull, const char ** _Nonnull)");
      v52 = 2114;
      v53 = CFSTR("BSProtobufSerialization.m");
      v54 = 1024;
      *(_DWORD *)v55 = 335;
      *(_WORD *)&v55[4] = 2114;
      *(_QWORD *)&v55[6] = v32;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    qword_1EDF5BAE8 = objc_msgSend(v32, "UTF8String");
    __break(0);
    JUMPOUT(0x18A20AE28);
  }
  if (!Offset)
  {
    v33 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("missing offset for %s"), v43);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544130;
      v51 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _BSProtobufGetIvarDetails(Class, const char * _Nonnull, Ivar * _Nonnull, ptrdiff_t * _Nonnull, const char ** _Nonnull)");
      v52 = 2114;
      v53 = CFSTR("BSProtobufSerialization.m");
      v54 = 1024;
      *(_DWORD *)v55 = 336;
      *(_WORD *)&v55[4] = 2114;
      *(_QWORD *)&v55[6] = v33;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    qword_1EDF5BAE8 = objc_msgSend(v33, "UTF8String");
    __break(0);
    JUMPOUT(0x18A20AEECLL);
  }
  v15 = TypeEncoding;
  if (!TypeEncoding)
  {
    v34 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("missing encoding for ivar %@: %s"), v11, v43);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544130;
      v51 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _BSProtobufGetIvarDetails(Class, const char * _Nonnull, Ivar * _Nonnull, ptrdiff_t * _Nonnull, const char ** _Nonnull)");
      v52 = 2114;
      v53 = CFSTR("BSProtobufSerialization.m");
      v54 = 1024;
      *(_DWORD *)v55 = 337;
      *(_WORD *)&v55[4] = 2114;
      *(_QWORD *)&v55[6] = v34;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    qword_1EDF5BAE8 = objc_msgSend(v34, "UTF8String");
    __break(0);
    JUMPOUT(0x18A20AFB0);
  }
  v16 = v9 + 96 * v10;
  *(_QWORD *)(v16 + 24) = InstanceVariable;
  *(_QWORD *)(v16 + 16) = Offset;
  *(_QWORD *)(v16 + 8) = TypeEncoding;
  v17 = strlen(TypeEncoding);
  if (v17 >= 4 && *v15 == 64 && v15[1] == 34 && v15[v17 - 1] == 34)
  {
    v18 = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v15 + 2, v17 - 3, 4);
    v19 = NSClassFromString(v18);
    if (!v19)
    {
      v38 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot find class: %@"), v18);
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138544130;
        v51 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class  _Nullable _BSGetClassFromEncoding(const char *)");
        v52 = 2114;
        v53 = CFSTR("BSProtobufSerialization.m");
        v54 = 1024;
        *(_DWORD *)v55 = 255;
        *(_WORD *)&v55[4] = 2114;
        *(_QWORD *)&v55[6] = v38;
        _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
      }
      qword_1EDF5BAE8 = objc_msgSend(v38, "UTF8String");
      __break(0);
      JUMPOUT(0x18A20B14CLL);
    }
    v20 = (uint64_t)v19;

  }
  else
  {
    v20 = 0;
  }
  if (v20 != objc_opt_class()
    && v20 != objc_opt_class()
    && v20 != objc_opt_class()
    && v20 != objc_opt_class()
    && v20 != objc_opt_class()
    && v20 != objc_opt_class())
  {
    v35 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("repeating field must be an array or set type"));
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v36 = NSStringFromSelector(sel_addRepeatingField_forTag_allowedClasses_);
      v37 = (objc_class *)objc_opt_class();
      *(_DWORD *)buf = 138544642;
      v51 = (uint64_t)v36;
      v52 = 2114;
      v53 = (const __CFString *)NSStringFromClass(v37);
      v54 = 2048;
      *(_QWORD *)v55 = a1;
      *(_WORD *)&v55[8] = 2114;
      *(_QWORD *)&v55[10] = CFSTR("BSProtobufSerialization.m");
      v56 = 1024;
      v57 = 542;
      v58 = 2114;
      v59 = v35;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1EDF5BAE8 = objc_msgSend(v35, "UTF8String");
    __break(0);
    JUMPOUT(0x18A20B088);
  }
  if (v20 == objc_opt_class())
  {
    v21 = v44;
  }
  else if (v20 == objc_opt_class())
  {
    v21 = v44;
  }
  else
  {
    v21 = v44;
    if (v20 != objc_opt_class())
      goto LABEL_33;
  }
  v20 = objc_opt_class();
LABEL_33:
  v22 = (_QWORD *)(v9 + 96 * v10);
  v22[4] = v21;
  v22[5] = v20;
  *(_DWORD *)v16 = a3;
  v23 = objc_opt_class();
  v24 = v22 + 6;
  v25 = v22 + 7;
  if (v21 == (objc_class *)v23)
  {
    *v24 = _BSProtobufEncodeRepeatFieldString;
    *v25 = _BSProtobufDecodeRepeatFieldString;
  }
  else
  {
    *v24 = _BSProtobufEncodeRepeatFieldObject;
    *v25 = _BSProtobufDecodeRepeatFieldObject;
    v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v27 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v46 != v29)
            objc_enumerationMutation(a4);
          v31 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
          if (*(_QWORD *)(objc_msgSend(v31, "protobufSchema") + 64))
            objc_msgSend(v26, "addObjectsFromArray:");
          else
            objc_msgSend(v26, "addObject:", v31);
        }
        v28 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
      }
      while (v28);
    }
    if ((unint64_t)objc_msgSend(v26, "count") > 1 || (objc_class *)objc_msgSend(v26, "firstObject") != v21)
      -[BSProtobufSchema _addSubclassesForField:allowedSubclasses:assertSubclassRelationship:](a1, v43, v26, 0);

  }
}

- (void)addRepeatingField:(const char *)a3 containsClasses:(id)a4
{
  int64_t v5;

  v5 = self->_autotagIndex + 1;
  self->_autotagIndex = v5;
  -[BSProtobufSchema addRepeatingField:forTag:allowedClasses:]((uint64_t)self, a3, v5, a4);
}

- (void)addRepeatingField:(const char *)a3 containsClass:(Class)a4 forTag:(int64_t)a5
{
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v5[0] = a4;
  -[BSProtobufSchema addRepeatingField:forTag:allowedClasses:]((uint64_t)self, a3, a5, (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1));
}

- (void)setAcceptableConcreteSubclasses:(id)a3
{
  BSProtobufSchema *v5;
  int64_t autotagIndex;
  int v7;
  uint64_t v8;
  int64_t fieldCount;
  uint64_t v10;

  v5 = objc_alloc_init(BSProtobufSchema);
  autotagIndex = v5->_autotagIndex;
  v7 = autotagIndex + 1;
  v5->_autotagIndex = autotagIndex + 1;
  -[NSMutableData increaseLengthBy:](v5->_memoryData, "increaseLengthBy:", 96);
  v8 = -[NSMutableData mutableBytes](v5->_memoryData, "mutableBytes");
  v5->_entries = (_BSProtobufFieldEntry *)v8;
  fieldCount = v5->_fieldCount;
  v10 = v8 + 96 * fieldCount;
  v5->_fieldCount = fieldCount + 1;
  *(_DWORD *)v10 = v7;
  *(_QWORD *)(v10 + 8) = "@";
  *(_QWORD *)(v10 + 16) = 0;
  *(_QWORD *)(v10 + 24) = 0;
  *(_QWORD *)(v10 + 32) = self->_rootClass;
  *(_QWORD *)(v10 + 48) = _BSProtobufEncodeObject;
  *(_QWORD *)(v10 + 56) = _BSProtobufDecodeObject;
  if ((objc_msgSend(a3, "containsObject:", self->_rootClass) & 1) == 0)
    *(_BYTE *)(v8 + 96 * fieldCount + 88) = 1;
  -[BSProtobufSchema _addSubclassesForField:allowedSubclasses:assertSubclassRelationship:]((uint64_t)v5, (uint64_t)"<concreteMulticlass>", a3, 1);
  self->_allowedConcreteSubclassesSchema = v5;
  self->_allowedConcreteSubclassesClasses = (NSArray *)objc_msgSend(a3, "copy");
}

@end
