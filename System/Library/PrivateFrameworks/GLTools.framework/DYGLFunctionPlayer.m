@implementation DYGLFunctionPlayer

- (DYGLFunctionPlayer)initWithCaptureStore:(id)a3
{
  DYGLFunctionPlayer *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DYGLFunctionPlayer;
  v3 = -[DYFunctionPlayer initWithCaptureStore:](&v5, sel_initWithCaptureStore_, a3);
  if (v3)
  {
    v3->_captureSessionInfo = -[DYGLCaptureSessionInfo initWithCaptureStore:]([DYGLCaptureSessionInfo alloc], "initWithCaptureStore:", -[DYFunctionPlayer captureStore](v3, "captureStore"));
    v3->_sharegroupMap = (DYIntKeyedDictionary *)objc_opt_new();
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DYGLFunctionPlayer;
  -[DYFunctionPlayer dealloc](&v3, sel_dealloc);
}

- (void)newContextInfo
{
  -[DYGLFunctionPlayer doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (void)updateCurrentStateWithNewContext:(id)a3 contextID:(unint64_t)a4 sharegroupID:(unint64_t)a5
{
  _QWORD *v9;
  id v10;
  id v11;
  unordered_map<unsigned long long, std::unique_ptr<GPUTools::Playback::GL::ContextInfo>, std::hash<unsigned long long>, std::equal_to<unsigned long long>, std::allocator<std::pair<const unsigned long long, std::unique_ptr<GPUTools::Playback::GL::ContextInfo>>>> *p_contextInfoMap;
  unint64_t value;
  uint8x8_t v14;
  unint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSMutableDictionary *v22;
  NSMutableDictionary *v23;
  NSMutableDictionary *v24;
  int v25;
  void *v26;
  void *v27;
  id v28;
  NSMutableDictionary *v29;
  _QWORD *v30;
  unint64_t v31;

  v31 = a4;
  if (!a4)
    __assert_rtn("-[DYGLFunctionPlayer updateCurrentStateWithNewContext:contextID:sharegroupID:]", (const char *)&unk_23C637957, 0, "contextID != 0ull");
  *(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x24BE39018]) = (Class)a4;
  self->_ctx = (EAGLContext *)objc_msgSend(a3, "dy_platformContext");
  self->_gli_ctx = (__GLIContextRec *)GLIContextFromEAGLContext();
  self->_disp = (__GLIFunctionDispatchRec *)GLCFrontDispatch();
  v9 = -[DYGLFunctionPlayer newContextInfo](self, "newContextInfo");
  v10 = a3;
  v11 = (id)v9[9];
  if (v11 != v10)
  {

    v9[9] = v10;
    v10 = 0;
  }

  v9[11] = a5;
  self->_currentContextInfo = v9;
  p_contextInfoMap = &self->_contextInfoMap;
  value = self->_contextInfoMap.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  if (value)
  {
    v14 = (uint8x8_t)vcnt_s8((int8x8_t)value);
    v14.i16[0] = vaddlv_u8(v14);
    if (v14.u32[0] > 1uLL)
    {
      v15 = a4;
      if (value <= a4)
        v15 = a4 % value;
    }
    else
    {
      v15 = (value - 1) & a4;
    }
    v16 = p_contextInfoMap->__table_.__bucket_list_.__ptr_.__value_[v15];
    if (v16)
    {
      v17 = (_QWORD *)*v16;
      if (v17)
      {
        if (v14.u32[0] < 2uLL)
        {
          v18 = value - 1;
          while (1)
          {
            v20 = v17[1];
            if (v20 == a4)
            {
              if (v17[2] == a4)
                goto LABEL_32;
            }
            else if ((v20 & v18) != v15)
            {
              goto LABEL_24;
            }
            v17 = (_QWORD *)*v17;
            if (!v17)
              goto LABEL_24;
          }
        }
        do
        {
          v19 = v17[1];
          if (v19 == a4)
          {
            if (v17[2] == a4)
LABEL_32:
              __assert_rtn("-[DYGLFunctionPlayer updateCurrentStateWithNewContext:contextID:sharegroupID:]", (const char *)&unk_23C637957, 0, "_contextInfoMap.find(contextID) == _contextInfoMap.end()");
          }
          else
          {
            if (v19 >= value)
              v19 %= value;
            if (v19 != v15)
              break;
          }
          v17 = (_QWORD *)*v17;
        }
        while (v17);
      }
    }
  }
LABEL_24:
  v30 = v9;
  std::__hash_table<std::__hash_value_type<unsigned long long,std::unique_ptr<GPUTools::Playback::GL::ContextInfo>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::unique_ptr<GPUTools::Playback::GL::ContextInfo>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::unique_ptr<GPUTools::Playback::GL::ContextInfo>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::unique_ptr<GPUTools::Playback::GL::ContextInfo>>>>::__emplace_unique_key_args<unsigned long long,unsigned long long &,std::unique_ptr<GPUTools::Playback::GL::ContextInfo>>((uint64_t)p_contextInfoMap, &v31, (uint64_t *)&v31, (uint64_t *)&v30);
  v21 = (uint64_t)v30;
  v30 = 0;
  if (v21)
    (*(void (**)(uint64_t))(*(_QWORD *)v21 + 8))(v21);
  v22 = (NSMutableDictionary *)objc_opt_new();
  self->_ctx_dict = v22;
  v23 = (NSMutableDictionary *)v9[10];
  if (v23 != v22)
  {

    v9[10] = v22;
    v22 = 0;
  }

  v24 = (NSMutableDictionary *)-[DYIntKeyedDictionary objectForIntKey:](self->_sharegroupMap, "objectForIntKey:", a5);
  self->_sharegroup_dict = v24;
  if (v24)
  {
    v25 = objc_msgSend((id)-[NSMutableDictionary objectForKey:](v24, "objectForKey:", CFSTR("ref_count")), "unsignedIntValue");
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInt:", (v25 + 1));
    -[NSMutableDictionary setObject:forKey:](self->_sharegroup_dict, "setObject:forKey:", v26, CFSTR("ref_count"));

  }
  else
  {
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInt:", 1);
    v28 = objc_alloc(MEMORY[0x24BDBCED8]);
    v29 = (NSMutableDictionary *)objc_msgSend(v28, "initWithObjectsAndKeys:", v27, CFSTR("ref_count"), 0, v30, v31);
    self->_sharegroup_dict = v29;
    -[DYIntKeyedDictionary setObject:forIntKey:](self->_sharegroupMap, "setObject:forIntKey:", v29, a5);

    -[DYGLFunctionPlayer initializeNewSharegroupInfoDictionary](self, "initializeNewSharegroupInfoDictionary");
  }
}

- (void)setCurrentContext:(unint64_t)a3
{
  uint64_t v4;
  unint64_t value;
  uint8x8_t v6;
  unint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  NSMutableDictionary **v13;
  EAGLContext *v14;
  __GLIFunctionDispatchRec *v15;

  v4 = (int)*MEMORY[0x24BE39018];
  *(Class *)((char *)&self->super.super.isa + v4) = (Class)a3;
  if (a3)
  {
    value = self->_contextInfoMap.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
    if (!value)
      goto LABEL_29;
    v6 = (uint8x8_t)vcnt_s8((int8x8_t)value);
    v6.i16[0] = vaddlv_u8(v6);
    if (v6.u32[0] > 1uLL)
    {
      v7 = a3;
      if (value <= a3)
        v7 = a3 % value;
    }
    else
    {
      v7 = (value - 1) & a3;
    }
    v8 = self->_contextInfoMap.__table_.__bucket_list_.__ptr_.__value_[v7];
    if (!v8 || (v9 = (_QWORD *)*v8) == 0)
LABEL_29:
      __assert_rtn("-[DYGLFunctionPlayer setCurrentContext:]", (const char *)&unk_23C637957, 0, "iter != _contextInfoMap.end()");
    if (v6.u32[0] < 2uLL)
    {
      v10 = value - 1;
      while (1)
      {
        v12 = v9[1];
        if (v12 == a3)
        {
          if (v9[2] == a3)
            goto LABEL_22;
        }
        else if ((v12 & v10) != v7)
        {
          goto LABEL_29;
        }
        v9 = (_QWORD *)*v9;
        if (!v9)
          goto LABEL_29;
      }
    }
    while (1)
    {
      v11 = v9[1];
      if (v11 == a3)
      {
        if (v9[2] == a3)
        {
LABEL_22:
          v13 = (NSMutableDictionary **)v9[3];
          self->_currentContextInfo = v13;
          if (!v13)
            __assert_rtn("-[DYGLFunctionPlayer setCurrentContext:]", (const char *)&unk_23C637957, 0, "_currentContextInfo");
          self->_ctx_dict = v13[10];
          self->_sharegroup_dict = (NSMutableDictionary *)-[DYIntKeyedDictionary objectForIntKey:](self->_sharegroupMap, "objectForIntKey:", *((_QWORD *)self->_currentContextInfo + 11));
          v14 = (EAGLContext *)objc_msgSend(*((id *)self->_currentContextInfo + 9), "dy_platformContext");
          self->_ctx = v14;
          if (v14)
          {
            self->_gli_ctx = (__GLIContextRec *)GLIContextFromEAGLContext();
            v15 = (__GLIFunctionDispatchRec *)GLCFrontDispatch();
            goto LABEL_25;
          }
          return;
        }
      }
      else
      {
        if (v11 >= value)
          v11 %= value;
        if (v11 != v7)
          goto LABEL_29;
      }
      v9 = (_QWORD *)*v9;
      if (!v9)
        goto LABEL_29;
    }
  }
  v15 = 0;
  self->_currentContextInfo = 0;
  *(Class *)((char *)&self->super.super.isa + v4) = 0;
  self->_ctx = 0;
  self->_ctx_dict = 0;
  self->_sharegroup_dict = 0;
  self->_gli_ctx = 0;
LABEL_25:
  self->_disp = v15;
}

- (void)deleteCurrentContext
{
  int v3;
  void *v4;
  unordered_map<unsigned long long, std::unique_ptr<GPUTools::Playback::GL::ContextInfo>, std::hash<unsigned long long>, std::equal_to<unsigned long long>, std::allocator<std::pair<const unsigned long long, std::unique_ptr<GPUTools::Playback::GL::ContextInfo>>>> *p_contextInfoMap;
  uint64_t v6;
  unint64_t v7;
  unint64_t value;
  _QWORD *v9;
  unint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  void *__p;
  char v14;

  v3 = objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_sharegroup_dict, "objectForKey:", CFSTR("ref_count")), "unsignedIntValue");
  if (v3 == 1)
  {
    -[DYIntKeyedDictionary removeObjectForIntKey:](self->_sharegroupMap, "removeObjectForIntKey:", *((_QWORD *)self->_currentContextInfo + 11));
  }
  else
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInt:", (v3 - 1));
    -[NSMutableDictionary setObject:forKey:](self->_sharegroup_dict, "setObject:forKey:", v4, CFSTR("ref_count"));

  }
  p_contextInfoMap = &self->_contextInfoMap;
  v6 = (int)*MEMORY[0x24BE39018];
  v7 = *(unint64_t *)((char *)&self->super.super.isa + v6);
  value = self->_contextInfoMap.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  if ((value & (value - 1)) != 0)
  {
    v10 = *(unint64_t *)((char *)&self->super.super.isa + v6);
    if (v7 >= value)
      v10 = v7 % value;
    v9 = p_contextInfoMap->__table_.__bucket_list_.__ptr_.__value_[v10];
    do
    {
      do
        v9 = (_QWORD *)*v9;
      while (v9[1] != v7);
    }
    while (v9[2] != v7);
  }
  else
  {
    v9 = p_contextInfoMap->__table_.__bucket_list_.__ptr_.__value_[(value - 1) & v7];
    do
    {
      do
        v9 = (_QWORD *)*v9;
      while (v9[1] != v7);
    }
    while (v9[2] != v7);
  }
  std::__hash_table<std::__hash_value_type<unsigned long long,std::unique_ptr<GPUTools::Playback::GL::ContextInfo>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::unique_ptr<GPUTools::Playback::GL::ContextInfo>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::unique_ptr<GPUTools::Playback::GL::ContextInfo>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::unique_ptr<GPUTools::Playback::GL::ContextInfo>>>>::remove(p_contextInfoMap, v9, (uint64_t)&__p);
  v11 = __p;
  __p = 0;
  if (v11)
  {
    if (v14)
    {
      v12 = v11[3];
      v11[3] = 0;
      if (v12)
        (*(void (**)(uint64_t))(*(_QWORD *)v12 + 8))(v12);
    }
    operator delete(v11);
  }
  self->_currentContextInfo = 0;
  *(Class *)((char *)&self->super.super.isa + v6) = 0;
  self->_ctx = 0;
  self->_ctx_dict = 0;
  self->_sharegroup_dict = 0;
  self->_gli_ctx = 0;
  self->_disp = 0;
}

- (id)contextForContextIdentifier:(unint64_t)a3
{
  unint64_t value;
  uint8x8_t v4;
  unint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;

  value = self->_contextInfoMap.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  if (!value)
    goto LABEL_22;
  v4 = (uint8x8_t)vcnt_s8((int8x8_t)value);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    v5 = a3;
    if (value <= a3)
      v5 = a3 % value;
  }
  else
  {
    v5 = (value - 1) & a3;
  }
  v6 = self->_contextInfoMap.__table_.__bucket_list_.__ptr_.__value_[v5];
  if (!v6 || (v7 = (_QWORD *)*v6) == 0)
LABEL_22:
    __assert_rtn("-[DYGLFunctionPlayer contextForContextIdentifier:]", (const char *)&unk_23C637957, 0, "iter != _contextInfoMap.end()");
  if (v4.u32[0] < 2uLL)
  {
    v8 = value - 1;
    while (1)
    {
      v10 = v7[1];
      if (v10 == a3)
      {
        if (v7[2] == a3)
          return (id)objc_msgSend(*(id *)(v7[3] + 72), "dy_platformContext");
      }
      else if ((v10 & v8) != v5)
      {
        goto LABEL_22;
      }
      v7 = (_QWORD *)*v7;
      if (!v7)
        goto LABEL_22;
    }
  }
  while (1)
  {
    v9 = v7[1];
    if (v9 == a3)
      break;
    if (v9 >= value)
      v9 %= value;
    if (v9 != v5)
      goto LABEL_22;
LABEL_11:
    v7 = (_QWORD *)*v7;
    if (!v7)
      goto LABEL_22;
  }
  if (v7[2] != a3)
    goto LABEL_11;
  return (id)objc_msgSend(*(id *)(v7[3] + 72), "dy_platformContext");
}

- (void)_dispatchGLFunction
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  v3 = (int)*MEMORY[0x24BE39040];
  -[DYFunctionPlayer processArguments](self, "processArguments");
  v4 = (int)*MEMORY[0x24BE39048];
  dy_dispatch();
  if (((*(_WORD **)((char *)&self->super.super.isa + v3))[23] & 0x10) != 0)
  {
    v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCString:encoding:", (*(_QWORD **)((char *)&self->super.super.isa + v3))[3], 1);
    NSMapInsert(*(NSMapTable **)((char *)&self->super.super.isa + (int)*MEMORY[0x24BE39050]), v5, **(const void ***)((char *)&self->super.super.isa + v4));

  }
}

- (void)executeGraphicsFunction
{
  _BOOL8 v3;

  if (-[DYFunctionPlayer shouldExecuteGraphicsFunction](self, "shouldExecuteGraphicsFunction"))
  {
    -[DYGLFunctionPlayer _dispatchGLFunction](self, "_dispatchGLFunction");
    if (*((_BYTE *)self->_currentContextInfo + 96))
      v3 = 0;
    else
      v3 = ((unsigned int (*)(__GLIContextRec *))self->_disp->get_error)(self->_gli_ctx) != 0;
    -[DYGLFunctionPlayer performPostGraphicsFunctionDispatchActions:](self, "performPostGraphicsFunctionDispatchActions:", v3);
  }
}

- (void)executePlatformFunction
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  __GLIFunctionDispatchRec *disp;
  __int16 v8;
  DYCaptureStore *v9;
  _QWORD *v10;
  _QWORD *currentContextInfo;
  __int16 v12;
  DYCaptureStore *v13;
  _QWORD *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  GPUTools::VMBuffer *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unsigned int v25;
  uint64_t v26;
  int v27;
  uint64_t *v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  unint64_t v32;
  _QWORD *v33;
  int v34;
  uint64_t v35;
  unsigned __int16 v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  DYCaptureStore *v52;
  uint64_t v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  GPUTools::VMBuffer *v58;

  v2 = (int)*MEMORY[0x24BE39040];
  v3 = *(uint64_t *)((char *)&self->super.super.isa + v2);
  v4 = v3 + 48;
  switch(*(_DWORD *)v3)
  {
    case 0xFFFFD009:
      v6 = **(unsigned int **)(v3 + 72);
      disp = self->_disp;
      *(_QWORD *)&v55 = 0;
      ((void (*)(__GLIContextRec *, uint64_t, uint64_t, __int128 *))disp->get_buffer_pointerv)(self->_gli_ctx, v6, 35005, &v55);
      v8 = *(_WORD *)(v3 + 118);
      if ((v8 & 0x28) != 0)
      {
        v9 = -[DYFunctionPlayer captureStore](self, "captureStore");
        v10 = *(_QWORD **)(v3 + 96);
        if ((v8 & 8) != 0)
          -[DYCaptureStore readDataForFilenameBuffer:buffer:size:error:](v9, "readDataForFilenameBuffer:buffer:size:error:", v10, **(_QWORD **)(v3 + 120) + (_QWORD)v55, **(_QWORD **)(v3 + 144), 0);
        else
          -[DYCaptureStore readDataForFilePosition:buffer:size:error:](v9, "readDataForFilePosition:buffer:size:error:", *v10, **(_QWORD **)(v3 + 120) + (_QWORD)v55, **(_QWORD **)(v3 + 144), 0);
      }
      else
      {
        memcpy((void *)(**(_QWORD **)(v3 + 120) + v55), *(const void **)(v3 + 96), **(_QWORD **)(v3 + 144));
      }
      return;
    case 0xFFFFD00B:
      currentContextInfo = self->_currentContextInfo;
      currentContextInfo[8] = **(_QWORD **)(v3 + 96);
      v12 = *(_WORD *)(v3 + 94);
      if ((v12 & 0x28) == 0)
      {
        currentContextInfo[7] = *(_QWORD *)(v3 + 72);
        return;
      }
      currentContextInfo[7] = 0;
      v13 = -[DYFunctionPlayer captureStore](self, "captureStore");
      v14 = *(_QWORD **)(v3 + 72);
      if ((v12 & 8) == 0)
      {
        -[DYCaptureStore getInfo:forFilePosition:error:](v13, "getInfo:forFilePosition:error:", &v55, *v14, 0);
        v15 = DWORD1(v56);
        v16 = (DWORD1(v56) + 15) & 0x1FFFFFFF0;
        v17 = currentContextInfo[6];
        if (v17)
          goto LABEL_8;
LABEL_30:
        v19 = (GPUTools::VMBuffer *)operator new();
        GPUTools::VMBuffer::VMBuffer(v19);
        v50 = currentContextInfo[3];
        v21 = currentContextInfo[2];
        v58 = v19;
        if (v50 == v21)
          v51 = 0;
        else
          v51 = ((v50 - v21) << 6) - 1;
        v23 = currentContextInfo[6];
        v24 = v23 + currentContextInfo[5];
        if (v51 != v24)
          goto LABEL_35;
LABEL_34:
        std::deque<std::unique_ptr<GPUTools::VMBuffer>>::__add_back_capacity((uint64_t)(currentContextInfo + 1));
        v21 = currentContextInfo[2];
        v23 = currentContextInfo[6];
        v24 = currentContextInfo[5] + v23;
LABEL_35:
        *(_QWORD *)(*(_QWORD *)(v21 + ((v24 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v24 & 0x1FF)) = v19;
        currentContextInfo[6] = v23 + 1;
        goto LABEL_37;
      }
      -[DYCaptureStore getInfo:forFilenameBuffer:error:](v13, "getInfo:forFilenameBuffer:error:", &v55, v14, 0);
      v15 = DWORD1(v56);
      v16 = (DWORD1(v56) + 15) & 0x1FFFFFFF0;
      v17 = currentContextInfo[6];
      if (!v17)
        goto LABEL_30;
LABEL_8:
      v18 = *(_QWORD *)(*(_QWORD *)(currentContextInfo[2]
                                  + (((unint64_t)(v17 + currentContextInfo[5] - 1) >> 6) & 0x3FFFFFFFFFFFFF8))
                      + 8 * ((v17 + currentContextInfo[5] - 1) & 0x1FF));
      if (*(_QWORD *)(v18 + 8) - *(_QWORD *)(v18 + 32) < v16)
      {
        v19 = (GPUTools::VMBuffer *)operator new();
        GPUTools::VMBuffer::VMBuffer(v19);
        v20 = currentContextInfo[3];
        v21 = currentContextInfo[2];
        v58 = v19;
        if (v20 == v21)
          v22 = 0;
        else
          v22 = ((v20 - v21) << 6) - 1;
        v23 = currentContextInfo[6];
        v24 = v23 + currentContextInfo[5];
        if (v22 != v24)
          goto LABEL_35;
        goto LABEL_34;
      }
      v19 = *(GPUTools::VMBuffer **)(*(_QWORD *)(currentContextInfo[2]
                                               + (((unint64_t)(v17 + currentContextInfo[5] - 1) >> 6) & 0x3FFFFFFFFFFFFF8))
                                   + 8 * ((v17 + currentContextInfo[5] - 1) & 0x1FF));
LABEL_37:
      v58 = 0;
      v52 = -[DYFunctionPlayer captureStore](self, "captureStore");
      if (-[DYCaptureStore readDataForFilePosition:buffer:size:error:](v52, "readDataForFilePosition:buffer:size:error:", (_QWORD)v55, *((_QWORD *)v19 + 4) + *(_QWORD *)v19, v15, &v58) == -1)
      {
        _DYOLog();
      }
      else
      {
        v53 = *((_QWORD *)v19 + 4);
        v54 = ((v16 + *((_QWORD *)v19 + 5) - 1) & -*((_QWORD *)v19 + 5)) + v53;
        *((_QWORD *)v19 + 3) = v53;
        *((_QWORD *)v19 + 4) = v54;
      }
      return;
    case 0xFFFFD00C:
      v25 = *(unsigned __int16 *)(v3 + 10);
      v26 = v4 + 24 * *(unsigned __int16 *)(v3 + 10);
      v27 = **(_DWORD **)(v26 - 24);
      v28 = *(uint64_t **)(v26 - 48);
      v29 = *v28;
      v30 = self->_currentContextInfo;
      v31 = v30[7];
      if (!v31)
      {
        v32 = v30[6] + v30[5] - 1;
        v33 = *(_QWORD **)(*(_QWORD *)(v30[2] + ((v32 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v32 & 0x1FF));
        v31 = v33[3] + *v33;
      }
      v34 = *(_DWORD *)(v26 - 36);
      *v28 = v29 - v30[8] + v31;
      *(_DWORD *)(v4 + 24 * v25 - 36) = 13;
      *(_DWORD *)v3 = v27;
      *(_WORD *)(v3 + 10) = v25 - 1;
      if (-[DYFunctionPlayer shouldExecuteGraphicsFunction](self, "shouldExecuteGraphicsFunction"))
        -[DYGLFunctionPlayer executeGraphicsFunction](self, "executeGraphicsFunction");
      v35 = *(uint64_t *)((char *)&self->super.super.isa + v2);
      *(_DWORD *)v35 = -12276;
      v36 = *(_WORD *)(v35 + 10) + 1;
      *(_WORD *)(v35 + 10) = v36;
      v37 = v4 + 24 * v36;
      **(_QWORD **)(v37 - 48) = v29;
      *(_DWORD *)(v37 - 36) = v34;
      return;
    case 0xFFFFD00D:
      v38 = self->_currentContextInfo;
      v39 = v38[6];
      if (v39)
      {
        v40 = v39 + v38[5] - 1;
        v41 = *(_QWORD *)(v38[2] + ((v40 >> 6) & 0x3FFFFFFFFFFFFF8));
        v42 = 8 * (v40 & 0x1FF);
        v43 = *(_QWORD **)(v41 + v42);
        *(_QWORD *)(v41 + v42) = 0;
        v44 = ((*v43 + v43[5] - 1) & -v43[5]) - *v43;
        v43[3] = v44;
        v43[4] = v44;
        v56 = 0u;
        v57 = 0u;
        v55 = 0u;
        std::deque<std::unique_ptr<GPUTools::VMBuffer>>::__move_assign(v38 + 1, (uint64_t)&v55);
        std::deque<std::unique_ptr<GPUTools::VMBuffer>>::~deque[abi:ne180100]((uint64_t)&v55);
        v45 = v38[3];
        v46 = v38[2];
        *(_QWORD *)&v55 = v43;
        if (v45 == v46)
          v47 = 0;
        else
          v47 = ((v45 - v46) << 6) - 1;
        v48 = v38[6];
        v49 = v48 + v38[5];
        if (v47 == v49)
        {
          std::deque<std::unique_ptr<GPUTools::VMBuffer>>::__add_back_capacity((uint64_t)(v38 + 1));
          v46 = v38[2];
          v48 = v38[6];
          v49 = v38[5] + v48;
        }
        *(_QWORD *)(*(_QWORD *)(v46 + ((v49 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v49 & 0x1FF)) = v43;
        v38[6] = v48 + 1;
      }
      return;
    default:
      return;
  }
}

- (DYGLCaptureSessionInfo)captureSessionInfo
{
  return self->_captureSessionInfo;
}

- (EAGLContext)context
{
  return self->_ctx;
}

- (NSMutableDictionary)contextDictionary
{
  return self->_ctx_dict;
}

- (__GLIContextRec)gliContext
{
  return self->_gli_ctx;
}

- (__GLIFunctionDispatchRec)gliDispatch
{
  return self->_disp;
}

- (BOOL)recreateContexts
{
  return self->_recreateContexts;
}

- (void)setRecreateContexts:(BOOL)a3
{
  self->_recreateContexts = a3;
}

- (void)currentContextInfo
{
  return self->_currentContextInfo;
}

- (void).cxx_destruct
{
  unordered_map<unsigned long long, std::unique_ptr<GPUTools::Playback::GL::ContextInfo>, std::hash<unsigned long long>, std::equal_to<unsigned long long>, std::allocator<std::pair<const unsigned long long, std::unique_ptr<GPUTools::Playback::GL::ContextInfo>>>> *p_contextInfoMap;
  _QWORD *next;
  void **value;
  _QWORD *v5;
  uint64_t v6;

  p_contextInfoMap = &self->_contextInfoMap;
  next = self->_contextInfoMap.__table_.__p1_.__value_.__next_;
  if (next)
  {
    do
    {
      v5 = (_QWORD *)*next;
      v6 = next[3];
      next[3] = 0;
      if (v6)
        (*(void (**)(uint64_t, SEL))(*(_QWORD *)v6 + 8))(v6, a2);
      operator delete(next);
      next = v5;
    }
    while (v5);
  }
  value = p_contextInfoMap->__table_.__bucket_list_.__ptr_.__value_;
  p_contextInfoMap->__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (value)
    operator delete(value);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 86) = 0u;
  *((_OWORD *)self + 87) = 0u;
  *((_DWORD *)self + 352) = 1065353216;
  return self;
}

@end
