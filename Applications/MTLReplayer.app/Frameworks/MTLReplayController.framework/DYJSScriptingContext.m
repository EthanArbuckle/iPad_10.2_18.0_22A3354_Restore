@implementation DYJSScriptingContext

- (DYJSScriptingContext)init
{
  DYJSScriptingContext *v2;
  JSVirtualMachine *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DYJSScriptingContext;
  v2 = -[DYJSScriptingContext init](&v5, "init");
  if (v2)
  {
    v3 = (JSVirtualMachine *)objc_alloc_init((Class)JSVirtualMachine);
    v2->_filename = (NSString *)CFSTR("n/a");
    v2->_virtualMachine = v3;
    -[DYJSScriptingContext allocNewContext](v2, "allocNewContext");
  }
  return v2;
}

- (void)allocNewContext
{
  JSContext *v3;

  v3 = (JSContext *)objc_msgSend(objc_alloc((Class)JSContext), "initWithVirtualMachine:", self->_virtualMachine);
  self->_context = v3;
  self->_globalObject = JSContextGetGlobalObject(-[JSContext JSGlobalContextRef](v3, "JSGlobalContextRef"));
}

- (void)dealloc
{
  objc_super v3;

  -[DYJSScriptingContext _clearCache](self, "_clearCache");
  v3.receiver = self;
  v3.super_class = (Class)DYJSScriptingContext;
  -[DYJSScriptingContext dealloc](&v3, "dealloc");
}

- (basic_string<char,)_jsStringToString:(std::allocator<char>> *__return_ptr)retstr
{
  basic_string<char, std::char_traits<char>, std::allocator<char>> *result;
  OpaqueJSString *v2;
  OpaqueJSString *v4;
  char *v5;
  char *v6;
  size_t UTF8CString;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *v11;
  char *v12;
  char v13;

  if (!v2
    || (v4 = v2,
        (result = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)JSStringGetLength(v2)) == 0))
  {
    retstr->var0.var0.var0.var1.var0 = 0;
    retstr->var0.var0.var0.var1.var1 = 0;
    *((_QWORD *)&retstr->var0.var0.var0.var1 + 2) = 0;
    return result;
  }
  v5 = &result->var0.var0.var0.var0.var0[1];
  v6 = (char *)malloc_type_malloc((size_t)&result->var0.var0.var0.var0.var0[1], 0x20E9B781uLL);
  UTF8CString = JSStringGetUTF8CString(v4, v6, (size_t)v5);
  if (UTF8CString >= 0x7FFFFFFFFFFFFFF8)
    abort();
  v8 = UTF8CString;
  if (UTF8CString >= 0x17)
  {
    v9 = (UTF8CString & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((UTF8CString | 7) != 0x17)
      v9 = UTF8CString | 7;
    v10 = v9 + 1;
    v11 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)operator new(v9 + 1);
    retstr->var0.var0.var0.var1.var1 = v8;
    *((_QWORD *)&retstr->var0.var0.var0.var1 + 2) = v10 | 0x8000000000000000;
    retstr->var0.var0.var0.var1.var0 = (char *)v11;
    retstr = v11;
    goto LABEL_11;
  }
  *((_BYTE *)&retstr->var0.var0.var0.var1 + 23) = UTF8CString;
  if (UTF8CString)
  {
LABEL_11:
    v12 = v6;
    do
    {
      v13 = *v12++;
      retstr->var0.var0.var0.var0.var0[0] = v13;
      retstr = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)((char *)retstr + 1);
      --v8;
    }
    while (v8);
  }
  retstr->var0.var0.var0.var0.var0[0] = 0;
  free(v6);
  return result;
}

- (basic_string<char,)_jsValueToString:(std::allocator<char>> *__return_ptr)retstr
{
  id *v1;
  const OpaqueJSValue *v2;
  id *v3;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *result;

  v3 = v1;
  result = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)JSValueToStringCopy((JSContextRef)objc_msgSend(v1[14], "JSGlobalContextRef"), v2, 0);
  if (result)
    return (basic_string<char, std::char_traits<char>, std::allocator<char>> *)objc_msgSend(v3, "_jsStringToString:", result);
  retstr->var0.var0.var0.var1.var0 = 0;
  retstr->var0.var0.var0.var1.var1 = 0;
  *((_QWORD *)&retstr->var0.var0.var0.var1 + 2) = 0;
  return result;
}

- (id)setValue:(id)a3 value:(id)a4
{
  JSValue *v6;

  v6 = +[JSValue valueWithObject:inContext:](JSValue, "valueWithObject:inContext:", a4, self->_context);
  -[JSContext setObject:forKeyedSubscript:](self->_context, "setObject:forKeyedSubscript:", v6, a3);
  return v6;
}

- (void)setRawArrayValues:(id)a3 withUint32Values:(unsigned int *)a4 andNumCounters:(unint64_t)a5
{
  OpaqueJSString *v8;
  OpaqueJSValue *Array;
  uint64_t v10;
  OpaqueJSContext *v11;
  OpaqueJSContext *v12;
  unint64_t v13;
  const OpaqueJSValue *Number;
  JSValueRef exception;

  v8 = -[DYJSScriptingContext _cachedStringFromString:](self, "_cachedStringFromString:", objc_msgSend(a3, "UTF8String"));
  exception = 0;
  Array = JSObjectMakeArray(-[JSContext JSGlobalContextRef](self->_context, "JSGlobalContextRef"), 0, 0, &exception);
  if (a5)
  {
    v10 = 0;
    do
    {
      v11 = -[JSContext JSGlobalContextRef](self->_context, "JSGlobalContextRef");
      v12 = -[JSContext JSGlobalContextRef](self->_context, "JSGlobalContextRef");
      LODWORD(v13) = a4[v10];
      Number = JSValueMakeNumber(v12, (double)v13);
      JSObjectSetPropertyAtIndex(v11, Array, v10++, Number, &exception);
    }
    while (a5 != v10);
  }
  JSObjectSetProperty(-[JSContext JSGlobalContextRef](self->_context, "JSGlobalContextRef"), self->_globalObject, v8, Array, 0, &exception);
}

- (OpaqueJSValue)createArrayRef:(id)a3
{
  OpaqueJSString *v4;
  const OpaqueJSValue *Array;
  JSValueRef exception;

  v4 = -[DYJSScriptingContext _cachedStringFromString:](self, "_cachedStringFromString:", objc_msgSend(a3, "UTF8String"));
  exception = 0;
  Array = JSObjectMakeArray(-[JSContext JSGlobalContextRef](self->_context, "JSGlobalContextRef"), 0, 0, &exception);
  JSObjectSetProperty(-[JSContext JSGlobalContextRef](self->_context, "JSGlobalContextRef"), self->_globalObject, v4, Array, 0, &exception);
  return Array;
}

- (void)setRawArrayValues:(id)a3 withUint64Values:(unint64_t *)a4 andNumCounters:(unint64_t)a5
{
  OpaqueJSString *v8;
  OpaqueJSValue *Array;
  unint64_t v10;
  unsigned int v11;
  OpaqueJSContext *v12;
  const OpaqueJSValue *Number;
  JSValueRef exception;

  v8 = -[DYJSScriptingContext _cachedStringFromString:](self, "_cachedStringFromString:", objc_msgSend(a3, "UTF8String"));
  exception = 0;
  Array = JSObjectMakeArray(-[JSContext JSGlobalContextRef](self->_context, "JSGlobalContextRef"), 0, 0, &exception);
  if (a5)
  {
    v10 = 0;
    v11 = 1;
    do
    {
      v12 = -[JSContext JSGlobalContextRef](self->_context, "JSGlobalContextRef");
      Number = JSValueMakeNumber(-[JSContext JSGlobalContextRef](self->_context, "JSGlobalContextRef"), (double)a4[v10]);
      JSObjectSetPropertyAtIndex(v12, Array, v11 - 1, Number, &exception);
      v10 = v11++;
    }
    while (v10 < a5);
  }
  JSObjectSetProperty(-[JSContext JSGlobalContextRef](self->_context, "JSGlobalContextRef"), self->_globalObject, v8, Array, 0, &exception);
}

- (void)setValues:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = __34__DYJSScriptingContext_setValues___block_invoke;
  v3[3] = &unk_7258C8;
  v3[4] = self;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v3);
}

- (void)_clearCache
{
  JSStringRef i;
  _QWORD *next;
  _QWORD *v5;
  unint64_t value;
  uint64_t j;
  _QWORD *v8;
  _QWORD *v9;
  unint64_t v10;
  uint64_t k;

  for (i = (JSStringRef)self->_stringCache.__table_.__p1_.__value_.__next_; i; i = *(JSStringRef *)i)
    JSStringRelease(*((JSStringRef *)i + 3));
  if (self->_stringCache.__table_.__p2_.__value_)
  {
    next = self->_stringCache.__table_.__p1_.__value_.__next_;
    if (next)
    {
      do
      {
        v5 = (_QWORD *)*next;
        operator delete(next);
        next = v5;
      }
      while (v5);
    }
    self->_stringCache.__table_.__p1_.__value_.__next_ = 0;
    value = self->_stringCache.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
    if (value)
    {
      for (j = 0; j != value; ++j)
        self->_stringCache.__table_.__bucket_list_.__ptr_.__value_[j] = 0;
    }
    self->_stringCache.__table_.__p2_.__value_ = 0;
  }
  if (self->_cache.__table_.__p2_.__value_)
  {
    v8 = self->_cache.__table_.__p1_.__value_.__next_;
    if (v8)
    {
      do
      {
        v9 = (_QWORD *)*v8;
        operator delete(v8);
        v8 = v9;
      }
      while (v9);
    }
    self->_cache.__table_.__p1_.__value_.__next_ = 0;
    v10 = self->_cache.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
    if (v10)
    {
      for (k = 0; k != v10; ++k)
        self->_cache.__table_.__bucket_list_.__ptr_.__value_[k] = 0;
    }
    self->_cache.__table_.__p2_.__value_ = 0;
  }
}

- (BOOL)evaluteScript:(id)a3 scriptURL:(id)a4
{
  JSContext *context;
  id exceptionHandler;
  JSContext *v9;
  BOOL v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  -[DYJSScriptingContext _clearCache](self, "_clearCache");
  if (a4)
    self->_filename = (NSString *)objc_msgSend(objc_msgSend(a4, "lastPathComponent"), "copy");
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  context = self->_context;
  exceptionHandler = self->_exceptionHandler;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __48__DYJSScriptingContext_evaluteScript_scriptURL___block_invoke;
  v12[3] = &unk_7258F0;
  v12[4] = exceptionHandler;
  v12[5] = &v13;
  -[JSContext setExceptionHandler:](context, "setExceptionHandler:", v12);
  v9 = self->_context;
  if (a4)
    -[JSContext evaluateScript:withSourceURL:](v9, "evaluateScript:withSourceURL:", a3, a4);
  else
    -[JSContext evaluateScript:](v9, "evaluateScript:", a3);
  v10 = *((_BYTE *)v14 + 24) == 0;
  _Block_object_dispose(&v13, 8);
  return v10;
}

- (id)getValue:(id)a3
{
  return -[JSContext objectForKeyedSubscript:](self->_context, "objectForKeyedSubscript:", a3);
}

- (double)callFunction:(id)a3 withArguments:(id)a4
{
  double result;

  -[JSValue toDouble](-[JSValue callWithArguments:](-[JSContext objectForKeyedSubscript:](self->_context, "objectForKeyedSubscript:", a3), "callWithArguments:", a4), "toDouble");
  return result;
}

- (OpaqueJSString)_cachedStringFromString:(const char *)a3
{
  unint64_t v3;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t value;
  uint8x8_t v10;
  unint64_t v11;
  OpaqueJSString *v12;
  uint64_t ***v13;
  uint64_t **i;
  unint64_t v15;
  unint64_t v16;
  uint8x8_t v17;
  _QWORD **v18;
  _QWORD *j;
  unint64_t v20;
  float v21;
  float v22;
  _BOOL8 v23;
  unint64_t v24;
  unint64_t v25;
  int8x8_t prime;
  void **v27;
  void **v28;
  uint64_t v29;
  _QWORD *next;
  unint64_t v31;
  uint8x8_t v32;
  unint64_t v33;
  uint8x8_t v34;
  uint64_t v35;
  _QWORD *v36;
  unint64_t v37;
  void **v38;
  void **v39;
  void **v40;
  unint64_t v41;
  void **v43;

  if (!a3)
    return 0;
  v6 = 0x9DDFEA08EB382D69 * (((8 * (_DWORD)a3) + 8) ^ ((unint64_t)a3 >> 32));
  v7 = 0x9DDFEA08EB382D69 * (((unint64_t)a3 >> 32) ^ (v6 >> 47) ^ v6);
  v8 = 0x9DDFEA08EB382D69 * (v7 ^ (v7 >> 47));
  value = self->_stringCache.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  if (value)
  {
    v10 = (uint8x8_t)vcnt_s8((int8x8_t)value);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      v11 = v8;
      if (v8 >= value)
        v11 = v8 % value;
    }
    else
    {
      v11 = v8 & (value - 1);
    }
    v13 = (uint64_t ***)self->_stringCache.__table_.__bucket_list_.__ptr_.__value_[v11];
    if (v13)
    {
      for (i = *v13; i; i = (uint64_t **)*i)
      {
        v15 = (unint64_t)i[1];
        if (v15 == v8)
        {
          if (i[2] == (uint64_t *)a3)
            return (OpaqueJSString *)i[3];
        }
        else
        {
          if (v10.u32[0] > 1uLL)
          {
            if (v15 >= value)
              v15 %= value;
          }
          else
          {
            v15 &= value - 1;
          }
          if (v15 != v11)
            break;
        }
      }
    }
  }
  v12 = JSStringCreateWithUTF8CString(a3);
  JSStringRetain(v12);
  v16 = self->_stringCache.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  if (v16)
  {
    v17 = (uint8x8_t)vcnt_s8((int8x8_t)v16);
    v17.i16[0] = vaddlv_u8(v17);
    if (v17.u32[0] > 1uLL)
    {
      v3 = v8;
      if (v8 >= v16)
        v3 = v8 % v16;
    }
    else
    {
      v3 = v8 & (v16 - 1);
    }
    v18 = (_QWORD **)self->_stringCache.__table_.__bucket_list_.__ptr_.__value_[v3];
    if (v18)
    {
      for (j = *v18; j; j = (_QWORD *)*j)
      {
        v20 = j[1];
        if (v20 == v8)
        {
          if ((const char *)j[2] == a3)
            goto LABEL_92;
        }
        else
        {
          if (v17.u32[0] > 1uLL)
          {
            if (v20 >= v16)
              v20 %= v16;
          }
          else
          {
            v20 &= v16 - 1;
          }
          if (v20 != v3)
            break;
        }
      }
    }
  }
  j = operator new(0x20uLL);
  *j = 0;
  j[1] = v8;
  j[2] = a3;
  j[3] = 0;
  v21 = (float)(self->_stringCache.__table_.__p2_.__value_ + 1);
  v22 = self->_stringCache.__table_.__p3_.__value_;
  if (!v16 || (float)(v22 * (float)v16) < v21)
  {
    v23 = 1;
    if (v16 >= 3)
      v23 = (v16 & (v16 - 1)) != 0;
    v24 = v23 | (2 * v16);
    v25 = vcvtps_u32_f32(v21 / v22);
    if (v24 <= v25)
      prime = (int8x8_t)v25;
    else
      prime = (int8x8_t)v24;
    if (*(_QWORD *)&prime == 1)
    {
      prime = (int8x8_t)2;
    }
    else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
    {
      prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
      v16 = self->_stringCache.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
    }
    if (*(_QWORD *)&prime > v16)
      goto LABEL_48;
    if (*(_QWORD *)&prime < v16)
    {
      v33 = vcvtps_u32_f32((float)self->_stringCache.__table_.__p2_.__value_ / self->_stringCache.__table_.__p3_.__value_);
      if (v16 < 3 || (v34 = (uint8x8_t)vcnt_s8((int8x8_t)v16), v34.i16[0] = vaddlv_u8(v34), v34.u32[0] > 1uLL))
      {
        v33 = std::__next_prime(v33);
      }
      else
      {
        v35 = 1 << -(char)__clz(v33 - 1);
        if (v33 >= 2)
          v33 = v35;
      }
      if (*(_QWORD *)&prime <= v33)
        prime = (int8x8_t)v33;
      if (*(_QWORD *)&prime >= v16)
      {
        v16 = self->_stringCache.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
      }
      else
      {
        if (prime)
        {
LABEL_48:
          if (*(_QWORD *)&prime >> 61)
            std::__throw_bad_array_new_length[abi:nn180100]();
          v27 = (void **)operator new(8 * *(_QWORD *)&prime);
          v28 = self->_stringCache.__table_.__bucket_list_.__ptr_.__value_;
          self->_stringCache.__table_.__bucket_list_.__ptr_.__value_ = v27;
          if (v28)
            operator delete(v28);
          v29 = 0;
          self->_stringCache.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = (unint64_t)prime;
          do
            self->_stringCache.__table_.__bucket_list_.__ptr_.__value_[v29++] = 0;
          while (*(_QWORD *)&prime != v29);
          next = self->_stringCache.__table_.__p1_.__value_.__next_;
          if (next)
          {
            v31 = next[1];
            v32 = (uint8x8_t)vcnt_s8(prime);
            v32.i16[0] = vaddlv_u8(v32);
            if (v32.u32[0] > 1uLL)
            {
              if (v31 >= *(_QWORD *)&prime)
                v31 %= *(_QWORD *)&prime;
            }
            else
            {
              v31 &= *(_QWORD *)&prime - 1;
            }
            self->_stringCache.__table_.__bucket_list_.__ptr_.__value_[v31] = &self->_stringCache.__table_.__p1_;
            v36 = (_QWORD *)*next;
            if (*next)
            {
              do
              {
                v37 = v36[1];
                if (v32.u32[0] > 1uLL)
                {
                  if (v37 >= *(_QWORD *)&prime)
                    v37 %= *(_QWORD *)&prime;
                }
                else
                {
                  v37 &= *(_QWORD *)&prime - 1;
                }
                if (v37 != v31)
                {
                  v38 = self->_stringCache.__table_.__bucket_list_.__ptr_.__value_;
                  if (!v38[v37])
                  {
                    v38[v37] = next;
                    goto LABEL_73;
                  }
                  *next = *v36;
                  *v36 = *(_QWORD *)self->_stringCache.__table_.__bucket_list_.__ptr_.__value_[v37];
                  *(_QWORD *)self->_stringCache.__table_.__bucket_list_.__ptr_.__value_[v37] = v36;
                  v36 = next;
                }
                v37 = v31;
LABEL_73:
                next = v36;
                v36 = (_QWORD *)*v36;
                v31 = v37;
              }
              while (v36);
            }
          }
          v16 = (unint64_t)prime;
          goto LABEL_77;
        }
        v43 = self->_stringCache.__table_.__bucket_list_.__ptr_.__value_;
        self->_stringCache.__table_.__bucket_list_.__ptr_.__value_ = 0;
        if (v43)
          operator delete(v43);
        v16 = 0;
        self->_stringCache.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = 0;
      }
    }
LABEL_77:
    if ((v16 & (v16 - 1)) != 0)
    {
      if (v8 >= v16)
        v3 = v8 % v16;
      else
        v3 = v8;
    }
    else
    {
      v3 = (v16 - 1) & v8;
    }
  }
  v39 = self->_stringCache.__table_.__bucket_list_.__ptr_.__value_;
  v40 = (void **)v39[v3];
  if (v40)
  {
    *j = *v40;
  }
  else
  {
    *j = self->_stringCache.__table_.__p1_.__value_.__next_;
    self->_stringCache.__table_.__p1_.__value_.__next_ = j;
    v39[v3] = &self->_stringCache.__table_.__p1_;
    if (!*j)
      goto LABEL_91;
    v41 = *(_QWORD *)(*j + 8);
    if ((v16 & (v16 - 1)) != 0)
    {
      if (v41 >= v16)
        v41 %= v16;
    }
    else
    {
      v41 &= v16 - 1;
    }
    v40 = &self->_stringCache.__table_.__bucket_list_.__ptr_.__value_[v41];
  }
  *v40 = j;
LABEL_91:
  ++self->_stringCache.__table_.__p2_.__value_;
LABEL_92:
  j[3] = v12;
  return v12;
}

- (double)callGlobalFunction:(const char *)a3
{
  unint64_t v3;
  double v4;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t value;
  uint8x8_t v11;
  unint64_t v12;
  uint64_t ***v13;
  uint64_t **i;
  unint64_t v15;
  JSObjectRef v16;
  FILE *v17;
  const char *v18;
  void **v19;
  unint64_t v20;
  uint8x8_t v21;
  _QWORD **v22;
  _QWORD *j;
  unint64_t v24;
  float v25;
  float v26;
  _BOOL8 v27;
  unint64_t v28;
  unint64_t v29;
  int8x8_t prime;
  void **v31;
  void **v32;
  uint64_t v33;
  _QWORD *next;
  unint64_t v35;
  uint8x8_t v36;
  unint64_t v37;
  uint8x8_t v38;
  uint64_t v39;
  OpaqueJSValue *v40;
  _QWORD *v41;
  unint64_t v42;
  void **v43;
  void **v44;
  void **v45;
  unint64_t v46;
  const OpaqueJSValue *v47;
  FILE *v48;
  const char *v49;
  void **v50;
  void **v52;
  void *__p[2];
  char v54;
  JSValueRef exception;

  v4 = 0.0;
  if (!a3)
    return v4;
  v7 = 0x9DDFEA08EB382D69 * (((8 * (_DWORD)a3) + 8) ^ ((unint64_t)a3 >> 32));
  v8 = 0x9DDFEA08EB382D69 * (((unint64_t)a3 >> 32) ^ (v7 >> 47) ^ v7);
  v9 = 0x9DDFEA08EB382D69 * (v8 ^ (v8 >> 47));
  value = self->_cache.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  if (value)
  {
    v11 = (uint8x8_t)vcnt_s8((int8x8_t)value);
    v11.i16[0] = vaddlv_u8(v11);
    if (v11.u32[0] > 1uLL)
    {
      v12 = v9;
      if (v9 >= value)
        v12 = v9 % value;
    }
    else
    {
      v12 = v9 & (value - 1);
    }
    v13 = (uint64_t ***)self->_cache.__table_.__bucket_list_.__ptr_.__value_[v12];
    if (v13)
    {
      for (i = *v13; i; i = (uint64_t **)*i)
      {
        v15 = (unint64_t)i[1];
        if (v15 == v9)
        {
          if (i[2] == (uint64_t *)a3)
          {
            exception = 0;
            v40 = (OpaqueJSValue *)i[3];
            goto LABEL_98;
          }
        }
        else
        {
          if (v11.u32[0] > 1uLL)
          {
            if (v15 >= value)
              v15 %= value;
          }
          else
          {
            v15 &= value - 1;
          }
          if (v15 != v12)
            break;
        }
      }
    }
  }
  exception = 0;
  v16 = JSValueToObject(-[JSContext JSGlobalContextRef](self->_context, "JSGlobalContextRef"), -[JSValue JSValueRef](-[JSContext objectForKeyedSubscript:](self->_context, "objectForKeyedSubscript:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a3)), "JSValueRef"), &exception);
  if (exception)
  {
    v17 = __stderrp;
    -[DYJSScriptingContext _jsValueToString:](self, "_jsValueToString:");
    v18 = -[NSString UTF8String](self->_filename, "UTF8String");
    if (v54 >= 0)
      v19 = __p;
    else
      v19 = (void **)__p[0];
    fprintf(v17, "[DYJSScripting] \"%s\" when calling \"%s\" (%s)", (const char *)v19, a3, v18);
    if (v54 < 0)
      operator delete(__p[0]);
    return v4;
  }
  v40 = v16;
  v20 = self->_cache.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  if (v20)
  {
    v21 = (uint8x8_t)vcnt_s8((int8x8_t)v20);
    v21.i16[0] = vaddlv_u8(v21);
    if (v21.u32[0] > 1uLL)
    {
      v3 = v9;
      if (v9 >= v20)
        v3 = v9 % v20;
    }
    else
    {
      v3 = v9 & (v20 - 1);
    }
    v22 = (_QWORD **)self->_cache.__table_.__bucket_list_.__ptr_.__value_[v3];
    if (v22)
    {
      for (j = *v22; j; j = (_QWORD *)*j)
      {
        v24 = j[1];
        if (v24 == v9)
        {
          if ((const char *)j[2] == a3)
            goto LABEL_97;
        }
        else
        {
          if (v21.u32[0] > 1uLL)
          {
            if (v24 >= v20)
              v24 %= v20;
          }
          else
          {
            v24 &= v20 - 1;
          }
          if (v24 != v3)
            break;
        }
      }
    }
  }
  j = operator new(0x20uLL);
  *j = 0;
  j[1] = v9;
  j[2] = a3;
  j[3] = 0;
  v25 = (float)(self->_cache.__table_.__p2_.__value_ + 1);
  v26 = self->_cache.__table_.__p3_.__value_;
  if (!v20 || (float)(v26 * (float)v20) < v25)
  {
    v27 = 1;
    if (v20 >= 3)
      v27 = (v20 & (v20 - 1)) != 0;
    v28 = v27 | (2 * v20);
    v29 = vcvtps_u32_f32(v25 / v26);
    if (v28 <= v29)
      prime = (int8x8_t)v29;
    else
      prime = (int8x8_t)v28;
    if (*(_QWORD *)&prime == 1)
    {
      prime = (int8x8_t)2;
    }
    else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
    {
      prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
      v20 = self->_cache.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
    }
    if (*(_QWORD *)&prime > v20)
      goto LABEL_53;
    if (*(_QWORD *)&prime < v20)
    {
      v37 = vcvtps_u32_f32((float)self->_cache.__table_.__p2_.__value_ / self->_cache.__table_.__p3_.__value_);
      if (v20 < 3 || (v38 = (uint8x8_t)vcnt_s8((int8x8_t)v20), v38.i16[0] = vaddlv_u8(v38), v38.u32[0] > 1uLL))
      {
        v37 = std::__next_prime(v37);
      }
      else
      {
        v39 = 1 << -(char)__clz(v37 - 1);
        if (v37 >= 2)
          v37 = v39;
      }
      if (*(_QWORD *)&prime <= v37)
        prime = (int8x8_t)v37;
      if (*(_QWORD *)&prime >= v20)
      {
        v20 = self->_cache.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
      }
      else
      {
        if (prime)
        {
LABEL_53:
          if (*(_QWORD *)&prime >> 61)
            std::__throw_bad_array_new_length[abi:nn180100]();
          v31 = (void **)operator new(8 * *(_QWORD *)&prime);
          v32 = self->_cache.__table_.__bucket_list_.__ptr_.__value_;
          self->_cache.__table_.__bucket_list_.__ptr_.__value_ = v31;
          if (v32)
            operator delete(v32);
          v33 = 0;
          self->_cache.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = (unint64_t)prime;
          do
            self->_cache.__table_.__bucket_list_.__ptr_.__value_[v33++] = 0;
          while (*(_QWORD *)&prime != v33);
          next = self->_cache.__table_.__p1_.__value_.__next_;
          if (next)
          {
            v35 = next[1];
            v36 = (uint8x8_t)vcnt_s8(prime);
            v36.i16[0] = vaddlv_u8(v36);
            if (v36.u32[0] > 1uLL)
            {
              if (v35 >= *(_QWORD *)&prime)
                v35 %= *(_QWORD *)&prime;
            }
            else
            {
              v35 &= *(_QWORD *)&prime - 1;
            }
            self->_cache.__table_.__bucket_list_.__ptr_.__value_[v35] = &self->_cache.__table_.__p1_;
            v41 = (_QWORD *)*next;
            if (*next)
            {
              do
              {
                v42 = v41[1];
                if (v36.u32[0] > 1uLL)
                {
                  if (v42 >= *(_QWORD *)&prime)
                    v42 %= *(_QWORD *)&prime;
                }
                else
                {
                  v42 &= *(_QWORD *)&prime - 1;
                }
                if (v42 != v35)
                {
                  v43 = self->_cache.__table_.__bucket_list_.__ptr_.__value_;
                  if (!v43[v42])
                  {
                    v43[v42] = next;
                    goto LABEL_78;
                  }
                  *next = *v41;
                  *v41 = *(_QWORD *)self->_cache.__table_.__bucket_list_.__ptr_.__value_[v42];
                  *(_QWORD *)self->_cache.__table_.__bucket_list_.__ptr_.__value_[v42] = v41;
                  v41 = next;
                }
                v42 = v35;
LABEL_78:
                next = v41;
                v41 = (_QWORD *)*v41;
                v35 = v42;
              }
              while (v41);
            }
          }
          v20 = (unint64_t)prime;
          goto LABEL_82;
        }
        v52 = self->_cache.__table_.__bucket_list_.__ptr_.__value_;
        self->_cache.__table_.__bucket_list_.__ptr_.__value_ = 0;
        if (v52)
          operator delete(v52);
        v20 = 0;
        self->_cache.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = 0;
      }
    }
LABEL_82:
    if ((v20 & (v20 - 1)) != 0)
    {
      if (v9 >= v20)
        v3 = v9 % v20;
      else
        v3 = v9;
    }
    else
    {
      v3 = (v20 - 1) & v9;
    }
  }
  v44 = self->_cache.__table_.__bucket_list_.__ptr_.__value_;
  v45 = (void **)v44[v3];
  if (v45)
  {
    *j = *v45;
LABEL_95:
    *v45 = j;
    goto LABEL_96;
  }
  *j = self->_cache.__table_.__p1_.__value_.__next_;
  self->_cache.__table_.__p1_.__value_.__next_ = j;
  v44[v3] = &self->_cache.__table_.__p1_;
  if (*j)
  {
    v46 = *(_QWORD *)(*j + 8);
    if ((v20 & (v20 - 1)) != 0)
    {
      if (v46 >= v20)
        v46 %= v20;
    }
    else
    {
      v46 &= v20 - 1;
    }
    v45 = &self->_cache.__table_.__bucket_list_.__ptr_.__value_[v46];
    goto LABEL_95;
  }
LABEL_96:
  ++self->_cache.__table_.__p2_.__value_;
LABEL_97:
  j[3] = v40;
LABEL_98:
  v47 = JSObjectCallAsFunction(-[JSContext JSGlobalContextRef](self->_context, "JSGlobalContextRef"), v40, 0, 0, 0, &exception);
  if (exception)
  {
    v48 = __stderrp;
    -[DYJSScriptingContext _jsValueToString:](self, "_jsValueToString:");
    v49 = -[NSString UTF8String](self->_filename, "UTF8String");
    if (v54 >= 0)
      v50 = __p;
    else
      v50 = (void **)__p[0];
    fprintf(v48, "[DYJSScripting] \"%s\" when calling \"%s\" (%s)", (const char *)v50, a3, v49);
    if (v54 < 0)
      operator delete(__p[0]);
  }
  return JSValueToNumber(-[JSContext JSGlobalContextRef](self->_context, "JSGlobalContextRef"), v47, 0);
}

- (void)setGlobalDouble:(const char *)a3 value:(double)a4
{
  OpaqueJSString *v7;
  const OpaqueJSValue *Number;
  FILE *v9;
  const char *v10;
  const char *p_p;
  void *__p;
  char v13;
  JSValueRef exception;

  if (a3)
  {
    v7 = -[DYJSScriptingContext _cachedStringFromString:](self, "_cachedStringFromString:");
    Number = JSValueMakeNumber(-[JSContext JSGlobalContextRef](self->_context, "JSGlobalContextRef"), a4);
    exception = 0;
    JSObjectSetProperty(-[JSContext JSGlobalContextRef](self->_context, "JSGlobalContextRef"), self->_globalObject, v7, Number, 0, &exception);
    if (exception)
    {
      v9 = __stderrp;
      -[DYJSScriptingContext _jsValueToString:](self, "_jsValueToString:");
      v10 = -[NSString UTF8String](self->_filename, "UTF8String");
      if (v13 >= 0)
        p_p = (const char *)&__p;
      else
        p_p = (const char *)__p;
      fprintf(v9, "[DYJSScripting] \"%s\" when setting \"%s\" (%s)", p_p, a3, v10);
      if (v13 < 0)
        operator delete(__p);
    }
  }
}

- (double)getGlobalDouble:(const char *)a3
{
  OpaqueJSString *v5;
  const OpaqueJSValue *Property;
  double v7;
  FILE *v8;
  const char *v9;
  const char *p_p;
  void *__p;
  char v13;
  JSValueRef exception;

  if (!a3)
    return 0.0;
  v5 = JSStringCreateWithUTF8CString(a3);
  Property = JSObjectGetProperty(-[JSContext JSGlobalContextRef](self->_context, "JSGlobalContextRef"), self->_globalObject, v5, 0);
  JSStringRelease(v5);
  exception = 0;
  v7 = JSValueToNumber(-[JSContext JSGlobalContextRef](self->_context, "JSGlobalContextRef"), Property, &exception);
  if (exception)
  {
    v8 = __stderrp;
    -[DYJSScriptingContext _jsValueToString:](self, "_jsValueToString:");
    v9 = -[NSString UTF8String](self->_filename, "UTF8String");
    if (v13 >= 0)
      p_p = (const char *)&__p;
    else
      p_p = (const char *)__p;
    fprintf(v8, "[DYJSScripting] \"%s\" when setting \"%s\" (%s)", p_p, a3, v9);
    if (v13 < 0)
      operator delete(__p);
  }
  return v7;
}

- (BOOL)setGlobalJSONObject:(const char *)a3 value:(id)a4
{
  OpaqueJSString *v7;
  NSData *v8;
  id v9;
  FILE *v10;
  const char *v11;
  id v12;
  OpaqueJSString *v13;
  const OpaqueJSValue *v14;
  BOOL v15;
  FILE *v16;
  const char *v17;
  const char *v18;
  void *__p;
  char v21;
  JSValueRef exception;
  id v23;

  if (!a3)
    return 0;
  v7 = -[DYJSScriptingContext _cachedStringFromString:](self, "_cachedStringFromString:");
  v23 = 0;
  v8 = +[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", a4, 1, &v23);
  if (v23)
  {
    v9 = objc_msgSend(v23, "localizedDescription");
    v10 = __stderrp;
    if (v9)
      v11 = (const char *)objc_msgSend(v9, "UTF8String");
    else
      v11 = "";
    fprintf(v10, "[DYJSScripting] \"%s\" when setting \"%s\" (%s)", v11, a3, -[NSString UTF8String](self->_filename, "UTF8String"));
    return 0;
  }
  v12 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v8, 4);
  v13 = JSStringCreateWithUTF8CString((const char *)objc_msgSend(v12, "UTF8String"));

  if (!v13)
    return 0;
  v14 = JSValueMakeFromJSONString(-[JSContext JSGlobalContextRef](self->_context, "JSGlobalContextRef"), v13);
  exception = 0;
  JSObjectSetProperty(-[JSContext JSGlobalContextRef](self->_context, "JSGlobalContextRef"), self->_globalObject, v7, v14, 0, &exception);
  JSStringRelease(v13);
  v15 = exception == 0;
  if (exception)
  {
    v16 = __stderrp;
    -[DYJSScriptingContext _jsValueToString:](self, "_jsValueToString:");
    v17 = -[NSString UTF8String](self->_filename, "UTF8String");
    v18 = v21 >= 0 ? (const char *)&__p : (const char *)__p;
    fprintf(v16, "[DYJSScripting] \"%s\" when setting \"%s\" (%s)", v18, a3, v17);
    if (v21 < 0)
      operator delete(__p);
  }
  return v15;
}

- (id)getGlobalJSONObject:(const char *)a3
{
  OpaqueJSString *v5;
  JSValueRef Property;
  FILE *v7;
  const char *v8;
  void **v9;
  const OpaqueJSValue *v10;
  id result;
  OpaqueJSString *v12;
  char *v13;
  char *v14;
  id v15;
  FILE *v16;
  const char *v17;
  void *__p[2];
  char v19;
  JSValueRef exception;

  if (!a3)
    return 0;
  v5 = JSStringCreateWithUTF8CString(a3);
  exception = 0;
  Property = JSObjectGetProperty(-[JSContext JSGlobalContextRef](self->_context, "JSGlobalContextRef"), self->_globalObject, v5, &exception);
  if (exception)
  {
    v7 = __stderrp;
    -[DYJSScriptingContext _jsValueToString:](self, "_jsValueToString:");
    v8 = -[NSString UTF8String](self->_filename, "UTF8String");
    if (v19 >= 0)
      v9 = __p;
    else
      v9 = (void **)__p[0];
    fprintf(v7, "[DYJSScripting] \"%s\" when getting \"%s\" (%s)", (const char *)v9, a3, v8);
    if (v19 < 0)
      operator delete(__p[0]);
    return 0;
  }
  v10 = Property;
  JSStringRelease(v5);
  result = JSValueCreateJSONString(-[JSContext JSGlobalContextRef](self->_context, "JSGlobalContextRef"), v10, 4u, 0);
  if (result)
  {
    v12 = (OpaqueJSString *)result;
    result = (id)JSStringGetLength((JSStringRef)result);
    if (result)
    {
      v13 = (char *)result + 1;
      v14 = (char *)malloc_type_malloc((size_t)result + 1, 0x26B3501BuLL);
      __p[0] = 0;
      result = +[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", +[NSData dataWithBytesNoCopy:length:](NSData, "dataWithBytesNoCopy:length:", v14, JSStringGetUTF8CString(v12, v14, (size_t)v13)), 0, __p);
      if (__p[0])
      {
        v15 = objc_msgSend(__p[0], "localizedDescription");
        v16 = __stderrp;
        if (v15)
          v17 = (const char *)objc_msgSend(v15, "UTF8String");
        else
          v17 = "";
        fprintf(v16, "[DYJSScripting] \"%s\" when getting \"%s\" (%s)", v17, a3, -[NSString UTF8String](self->_filename, "UTF8String"));
        return 0;
      }
    }
  }
  return result;
}

- (JSVirtualMachine)virtualMachine
{
  return self->_virtualMachine;
}

- (JSContext)context
{
  return self->_context;
}

- (id)exceptionHandler
{
  return self->_exceptionHandler;
}

- (void)setExceptionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  _QWORD *next;
  _QWORD *v4;
  void **value;
  _QWORD *v6;
  _QWORD *v7;
  void **v8;

  next = self->_stringCache.__table_.__p1_.__value_.__next_;
  if (next)
  {
    do
    {
      v4 = (_QWORD *)*next;
      operator delete(next);
      next = v4;
    }
    while (v4);
  }
  value = self->_stringCache.__table_.__bucket_list_.__ptr_.__value_;
  self->_stringCache.__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (value)
    operator delete(value);
  v6 = self->_cache.__table_.__p1_.__value_.__next_;
  if (v6)
  {
    do
    {
      v7 = (_QWORD *)*v6;
      operator delete(v6);
      v6 = v7;
    }
    while (v7);
  }
  v8 = self->_cache.__table_.__bucket_list_.__ptr_.__value_;
  self->_cache.__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (v8)
    operator delete(v8);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *((_DWORD *)self + 10) = 1065353216;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_DWORD *)self + 20) = 1065353216;
  return self;
}

uint64_t __48__DYJSScriptingContext_evaluteScript_scriptURL___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    return (*(uint64_t (**)(uint64_t, id))(v3 + 16))(v3, objc_msgSend(a3, "toString"));
  else
    return fputs(-[NSString UTF8String](+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[DYJSScripting] %@ %@"), objc_msgSend(a3, "toString"), objc_msgSend(a3, "toDictionary")), "UTF8String"), __stderrp);
}

id __34__DYJSScriptingContext_setValues___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "setObject:forKeyedSubscript:", a3, a2);
}

+ (id)sharedContext
{
  if (+[DYJSScriptingContext sharedContext]::once != -1)
    dispatch_once(&+[DYJSScriptingContext sharedContext]::once, &__block_literal_global_2499);
  return (id)+[DYJSScriptingContext sharedContext]::instance;
}

void __37__DYJSScriptingContext_sharedContext__block_invoke(id a1)
{
  +[DYJSScriptingContext sharedContext]::instance = objc_alloc_init(DYJSScriptingContext);
}

@end
