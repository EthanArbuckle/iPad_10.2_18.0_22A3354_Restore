@implementation DYMTLFunctionPlayer

- (id)commandQueue
{
  MTLCommandQueueSPI *commandQueue;
  void *v4;
  MTLCommandQueueSPI *v5;
  MTLCommandQueueSPI *v6;

  commandQueue = self->_commandQueue;
  if (!commandQueue)
  {
    -[DYMTLFunctionPlayer device](self, "device");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (MTLCommandQueueSPI *)objc_msgSend(v4, "newCommandQueue");
    v6 = self->_commandQueue;
    self->_commandQueue = v5;

    commandQueue = self->_commandQueue;
  }
  return commandQueue;
}

- (DYMTLFunctionPlayer)initWithCaptureStore:(id)a3
{
  id v4;
  DYMTLFunctionPlayer *v5;
  DYMTLFunctionPlayer *v6;
  _QWORD *v7;
  void *v8;
  DYMTLIndirectArgumentBufferManager *v9;
  DYMTLIndirectCommandBufferManager *v10;
  DYMTLFunctionPlayer *v11;
  unint64_t v13;
  objc_super v14;
  unint64_t *v15;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DYMTLFunctionPlayer;
  v5 = -[DYFunctionPlayer initWithCaptureStore:](&v14, sel_initWithCaptureStore_, v4);
  v6 = v5;
  if (v5)
  {
    v13 = 0;
    v15 = &v13;
    v7 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>((uint64_t)&v5->_objectMap, &v13, (uint64_t)&std::piecewise_construct, &v15);
    v8 = (void *)v7[3];
    v7[3] = 0;

    std::__hash_table<std::__hash_value_type<unsigned long long,NSData * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,NSData * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,NSData * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,NSData * {__strong}>>>::clear((uint64_t)&v6->_vertexBytesDataMap);
    std::__hash_table<std::__hash_value_type<unsigned long long,NSData * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,NSData * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,NSData * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,NSData * {__strong}>>>::clear((uint64_t)&v6->_fragmentBytesDataMap);
    std::__hash_table<std::__hash_value_type<unsigned long long,NSData * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,NSData * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,NSData * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,NSData * {__strong}>>>::clear((uint64_t)&v6->_tileBytesDataMap);
    std::__hash_table<std::__hash_value_type<unsigned long long,NSData * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,NSData * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,NSData * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,NSData * {__strong}>>>::clear((uint64_t)&v6->_computeBytesDataMap);
    v9 = -[DYMTLIndirectArgumentBufferManager initWithFunctionPlayer:]([DYMTLIndirectArgumentBufferManager alloc], "initWithFunctionPlayer:", v6);
    -[DYMTLFunctionPlayer setIndirectArgumentManager:](v6, "setIndirectArgumentManager:", v9);

    v10 = -[DYMTLIndirectCommandBufferManager initWithFunctionPlayer:]([DYMTLIndirectCommandBufferManager alloc], "initWithFunctionPlayer:", v6);
    -[DYMTLFunctionPlayer setIndirectCommandManager:](v6, "setIndirectCommandManager:", v10);

    v11 = v6;
  }

  return v6;
}

- (void)dealloc
{
  MTLCommandQueueSPI *commandQueue;
  objc_super v4;

  -[MTLCommandQueueSPI finish](self->_commandQueue, "finish");
  commandQueue = self->_commandQueue;
  self->_commandQueue = 0;

  std::__hash_table<std::__hash_value_type<unsigned long long,NSData * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,NSData * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,NSData * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,NSData * {__strong}>>>::clear((uint64_t)&self->_vertexBytesDataMap);
  std::__hash_table<std::__hash_value_type<unsigned long long,NSData * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,NSData * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,NSData * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,NSData * {__strong}>>>::clear((uint64_t)&self->_fragmentBytesDataMap);
  std::__hash_table<std::__hash_value_type<unsigned long long,NSData * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,NSData * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,NSData * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,NSData * {__strong}>>>::clear((uint64_t)&self->_tileBytesDataMap);
  std::__hash_table<std::__hash_value_type<unsigned long long,NSData * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,NSData * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,NSData * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,NSData * {__strong}>>>::clear((uint64_t)&self->_computeBytesDataMap);
  v4.receiver = self;
  v4.super_class = (Class)DYMTLFunctionPlayer;
  -[DYFunctionPlayer dealloc](&v4, sel_dealloc);
}

- (id)_getDeviceWithName:(id)a3
{
  return MTLCreateSystemDefaultDevice();
}

- (id)deviceForID:(unint64_t)a3 withDeviceName:(id)a4
{
  id v5;
  unordered_map<unsigned long long, id, std::hash<unsigned long long>, std::equal_to<unsigned long long>, std::allocator<std::pair<const unsigned long long, id>>> *p_objectMap;
  _QWORD *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD *v12;
  char v13;
  char v14;
  unint64_t v16;
  id v17;
  unint64_t v18;

  v18 = a3;
  v5 = a4;
  p_objectMap = &self->_objectMap;
  v7 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&self->_objectMap.__table_.__bucket_list_.__ptr_.__value_, &v18);
  if (v7)
  {
    v8 = (id)v7[3];
  }
  else
  {
    -[DYMTLFunctionPlayer device](self, "device");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v8 = 0;
    }
    else
    {
      -[DYMTLFunctionPlayer _getDeviceWithName:](self, "_getDeviceWithName:", v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[DYMTLFunctionPlayer setDevice:](self, "setDevice:", v10);
      v16 = v18;
      v11 = v10;
      v17 = v11;
      v12 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::pair<unsigned long long,objc_object  {objcproto9MTLDevice}* {__strong}>>((uint64_t)p_objectMap, &v16, (uint64_t *)&v16);
      v14 = v13;

      if (v14)
        v8 = (id)v12[3];
      else
        v8 = 0;

    }
  }

  return v8;
}

- (void)setObject:(id)a3 forKey:(unint64_t)a4
{
  id v6;
  _QWORD *v7;
  void *v8;
  unint64_t v9;
  unint64_t *v10;

  v6 = a3;
  v9 = a4;
  v10 = &v9;
  v7 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->_objectMap, &v9, (uint64_t)&std::piecewise_construct, &v10);
  v8 = (void *)v7[3];
  v7[3] = v6;

}

- (id)objectForKey:(unint64_t)a3
{
  _QWORD *v3;
  unint64_t v5;

  v5 = a3;
  v3 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&self->_objectMap.__table_.__bucket_list_.__ptr_.__value_, &v5);
  if (v3)
    v3 = (_QWORD *)v3[3];
  return v3;
}

- (void)removeObjectForKey:(unint64_t)a3
{
  unint64_t v3;

  v3 = a3;
  std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::__erase_unique<unsigned long long>(&self->_objectMap.__table_.__bucket_list_.__ptr_.__value_, &v3);
}

- (unint64_t)keyForOriginalObject:(id)a3
{
  id v4;
  __compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long long, id>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long, id>, void *>>> *p_p1;
  unint64_t next;
  id v7;
  char v8;

  v4 = a3;
  p_p1 = &self->_objectMap.__table_.__p1_;
  while (1)
  {
    p_p1 = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long long, id>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long, id>, void *>>> *)p_p1->__value_.__next_;
    if (!p_p1)
      break;
    next = (unint64_t)p_p1[2].__value_.__next_;
    v7 = p_p1[3].__value_.__next_;
    v8 = objc_msgSend(v7, "isEqual:", v4);

    if ((v8 & 1) != 0)
      goto LABEL_6;
  }
  next = 0;
LABEL_6:

  return next;
}

- (unint64_t)keyForOriginalObject:(id)a3 inverseObjectMap:(void *)a4
{
  unint64_t *v6;
  _QWORD *v7;
  unint64_t v8;
  unint64_t *v10;
  unint64_t *v11;

  v6 = (unint64_t *)a3;
  v11 = v6;
  v7 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(a4, (unint64_t *)&v11);
  if (v7)
  {
    v8 = v7[3];
  }
  else
  {
    v8 = -[DYMTLFunctionPlayer keyForOriginalObject:](self, "keyForOriginalObject:", v6);
    v10 = v6;
    v11 = (unint64_t *)&v10;
    std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long long>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>((uint64_t)a4, (unint64_t *)&v10, (uint64_t)&std::piecewise_construct, &v11)[3] = v8;
  }

  return v8;
}

- (void)objectMap
{
  return &self->_objectMap;
}

- (const)vertexBytesForKey:(unint64_t)a3
{
  const void *result;
  unint64_t v4;

  v4 = a3;
  result = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&self->_vertexBytesDataMap.__table_.__bucket_list_.__ptr_.__value_, &v4);
  if (result)
  {
    result = (const void *)*((_QWORD *)result + 3);
    if (result)
      return (const void *)objc_msgSend((id)objc_retainAutorelease((id)result), "bytes");
  }
  return result;
}

- (const)fragmentBytesForKey:(unint64_t)a3
{
  const void *result;
  unint64_t v4;

  v4 = a3;
  result = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&self->_fragmentBytesDataMap.__table_.__bucket_list_.__ptr_.__value_, &v4);
  if (result)
  {
    result = (const void *)*((_QWORD *)result + 3);
    if (result)
      return (const void *)objc_msgSend((id)objc_retainAutorelease((id)result), "bytes");
  }
  return result;
}

- (const)tileBytesForKey:(unint64_t)a3
{
  const void *result;
  unint64_t v4;

  v4 = a3;
  result = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&self->_tileBytesDataMap.__table_.__bucket_list_.__ptr_.__value_, &v4);
  if (result)
  {
    result = (const void *)*((_QWORD *)result + 3);
    if (result)
      return (const void *)objc_msgSend((id)objc_retainAutorelease((id)result), "bytes");
  }
  return result;
}

- (const)computeBytesForKey:(unint64_t)a3
{
  const void *result;
  unint64_t v4;

  v4 = a3;
  result = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&self->_computeBytesDataMap.__table_.__bucket_list_.__ptr_.__value_, &v4);
  if (result)
  {
    result = (const void *)*((_QWORD *)result + 3);
    if (result)
      return (const void *)objc_msgSend((id)objc_retainAutorelease((id)result), "bytes");
  }
  return result;
}

- (BOOL)_isCPUAccessibleStorageMode:(unint64_t)a3
{
  return a3 == 0;
}

- (BOOL)_isDepthStencilFormat:(unint64_t)a3
{
  return a3 == 260;
}

- (void)_restoreTexture:(unint64_t)a3 commandBuffer:(unint64_t)a4 argumentOffset:(unint64_t)a5
{
  void *v6;
  void *v7;
  id v8;
  char *v9;
  uint64_t v10;
  GPUTools::MTL **v11;
  uint64_t v12;
  uint64_t Data;
  unint64_t v14;
  char v15;
  char v16;
  void *v17;
  void *v18;
  uint64_t DataSize;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t Offset;
  void *v24;
  uint64_t v25;
  void *v26;
  unint64_t v27;
  uint64_t v28;
  void *v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  __int128 v33;
  uint64_t v34;
  __int128 v35;
  uint64_t v36;
  __int128 v37;
  uint64_t v38;
  __int128 v39;
  uint64_t v40;
  __int128 v41;
  uint64_t v42;
  __int128 v43;
  uint64_t v44;
  _QWORD v45[6];
  unint64_t *v46;
  unint64_t **v47;
  uint64_t v48;
  __n128 (*v49)(__n128 *, __n128 *);
  void (*v50)(uint64_t);
  const char *v51;
  void *__p;
  void *v53;
  uint64_t v54;
  id v55[3];
  _OWORD v56[3];
  _OWORD v57[4];

  -[DYMTLFunctionPlayer device](self, "device", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DYMTLFunctionPlayer commandQueue](self, "commandQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = (unint64_t *)(*(char **)((char *)&self->super.super.isa + (int)*MEMORY[0x24BE39040]) + 16);
  v8 = (id)std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->_objectMap, v46, (uint64_t)&std::piecewise_construct, &v46)[3];
  v9 = (char *)self + (int)*MEMORY[0x24BE39008];
  v10 = **((_QWORD **)v9 + 3);
  v11 = (GPUTools::MTL **)*((_QWORD *)v9 + 1);
  v12 = **((_QWORD **)v9 + 2);
  memset(v57, 0, 48);
  GPUTools::MTL::MakeMTLRegion(*v11, (uint64_t)v57);
  Data = DYHarvesterGetData();
  v31 = **((_QWORD **)v9 + 5);
  v32 = v10;
  v30 = **((_QWORD **)v9 + 6);
  objc_msgSend(v8, "pixelFormat");
  MTLPixelFormatGetInfoForDevice();
  v14 = (unsigned __int16)v47 & 0x2000;
  if (-[DYMTLFunctionPlayer _isCPUAccessibleStorageMode:](self, "_isCPUAccessibleStorageMode:", objc_msgSend(v8, "storageMode")))
  {
    v15 = objc_msgSend(v8, "isDrawable");
    v16 = (_DWORD)v14 ? 1 : v15;
    if ((v16 & 1) == 0
      && !-[DYMTLFunctionPlayer _isDepthStencilFormat:](self, "_isDepthStencilFormat:", objc_msgSend(v8, "pixelFormat")))
    {
      v56[0] = v57[0];
      v56[1] = v57[1];
      v56[2] = v57[2];
      objc_msgSend(v8, "replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:", v56, v12, v32, Data, v31, v30);
      -[DYFunctionPlayer releaseDataForArgument:](self, "releaseDataForArgument:", 4);
      goto LABEL_22;
    }
  }
  -[DYMTLFunctionPlayer commandQueue](self, "commandQueue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  AutoPerfStatSamplingControl::AutoPerfStatSamplingControl((uint64_t)v55, v17);

  objc_msgSend(v7, "commandBuffer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v12;
  DYHarvesterGetMetadata();
  v27 = v14;
  DataSize = DYHarvesterGetDataSize();
  v20 = (char *)self + (int)*MEMORY[0x24BE39010];
  if (*((_QWORD *)v20 + 12) != *((_QWORD *)v20 + 13))
  {
    v21 = ~*MEMORY[0x24BDB03B8] & (*MEMORY[0x24BDB03B8] + **((_QWORD **)v9 + 7));
    if (v21)
    {
      v29 = v7;
      v22 = **((_QWORD **)v9 + 4);
      Offset = DYHarvesterGetOffset();
      v46 = 0;
      v47 = &v46;
      v48 = 0x4812000000;
      v49 = __Block_byref_object_copy_;
      v50 = __Block_byref_object_dispose_;
      v51 = "";
      __p = 0;
      v53 = 0;
      v54 = 0;
      std::vector<unsigned long long>::__init_with_size[abi:ne180100]<unsigned long long *,unsigned long long *>(&__p, *((const void **)v20 + 12), *((_QWORD *)v20 + 13), (uint64_t)(*((_QWORD *)v20 + 13) - *((_QWORD *)v20 + 12)) >> 3);
      *((_QWORD *)v20 + 13) = *((_QWORD *)v20 + 12);
      v45[0] = MEMORY[0x24BDAC760];
      v45[1] = 3221225472;
      v45[2] = __68__DYMTLFunctionPlayer__restoreTexture_commandBuffer_argumentOffset___block_invoke;
      v45[3] = &unk_250D6F120;
      v45[4] = self;
      v45[5] = &v46;
      v24 = (void *)objc_msgSend(v6, "newBufferWithBytesNoCopy:length:options:deallocator:", v22, v21, 0, v45);
      _Block_object_dispose(&v46, 8);
      v7 = v29;
      if (__p)
      {
        v53 = __p;
        operator delete(__p);
      }
      if (v24)
      {
        if (!v18)
          goto LABEL_21;
LABEL_15:
        if (v24 && v8)
        {
          objc_msgSend(v18, "setLabel:", *MEMORY[0x24BE39260]);
          objc_msgSend(v18, "blitCommandEncoder");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[DYMTLFunctionPlayer _isDepthStencilFormat:](self, "_isDepthStencilFormat:", objc_msgSend(v8, "pixelFormat")))
          {
            v44 = *((_QWORD *)&v57[2] + 1);
            v43 = *(_OWORD *)((char *)&v57[1] + 8);
            v41 = v57[0];
            v42 = *(_QWORD *)&v57[1];
            objc_msgSend(v26, "copyFromBuffer:sourceOffset:sourceBytesPerRow:sourceBytesPerImage:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:options:", v24, Offset, 4 * (v31 / 5), 4 * (v30 / 5), &v43, v8, v32, v28, &v41, 1);
            v39 = *(_OWORD *)((char *)&v57[1] + 8);
            v40 = *((_QWORD *)&v57[2] + 1);
            v37 = v57[0];
            v38 = *(_QWORD *)&v57[1];
            objc_msgSend(v26, "copyFromBuffer:sourceOffset:sourceBytesPerRow:sourceBytesPerImage:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:options:", v24, Offset + 4 * (v30 / 5), v31 / 5, v30 / 5, &v39, v8, v32, v28, &v37, 2);
          }
          else
          {
            v35 = *(_OWORD *)((char *)&v57[1] + 8);
            v36 = *((_QWORD *)&v57[2] + 1);
            v33 = v57[0];
            v34 = *(_QWORD *)&v57[1];
            objc_msgSend(v26, "copyFromBuffer:sourceOffset:sourceBytesPerRow:sourceBytesPerImage:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:options:", v24, Offset, v31, v30, &v35, v8, v32, v28, &v33, v27 >> 11);
          }
          objc_msgSend(v26, "endEncoding");
          objc_msgSend(v18, "commit");

        }
        goto LABEL_21;
      }
    }
  }
  v25 = objc_msgSend(v6, "newBufferWithBytes:length:options:", Data, DataSize, 0);
  -[DYFunctionPlayer releaseDataForArgument:](self, "releaseDataForArgument:", 4);
  Offset = 0;
  v24 = (void *)v25;
  if (v18)
    goto LABEL_15;
LABEL_21:

  AutoPerfStatSamplingControl::~AutoPerfStatSamplingControl(v55);
LABEL_22:

}

uint64_t __68__DYMTLFunctionPlayer__restoreTexture_commandBuffer_argumentOffset___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 48);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 56) != v1)
  {
    v2 = result;
    v3 = 0;
    do
    {
      result = objc_msgSend(*(id *)(v2 + 32), "releaseDataForPosition:", *(_QWORD *)(v1 + 8 * v3++));
      v1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 40) + 8) + 48);
    }
    while (v3 < (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 40) + 8) + 56) - v1) >> 3);
  }
  return result;
}

- (void)executePlatformFunction
{
  GPUTools::MTL::Utils::DYMTLDeviceDescriptor *v3;
  uint64_t v4;
  int *v5;
  int v6;
  _QWORD **v8;
  id v9;
  const void *v10;
  void *v11;
  uint64_t v12;
  size_t v13;
  BOOL v14;
  _QWORD **v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  _QWORD **v26;
  const void *v27;
  size_t v28;
  size_t v29;
  char v30;
  uint64_t Data;
  uint64_t Metadata;
  __IOSurface *v33;
  uint64_t v34;
  size_t v35;
  uint64_t v36;
  uint64_t v37;
  size_t HeightOfPlane;
  size_t BytesPerRowOfPlane;
  char *BaseAddressOfPlane;
  char *v41;
  uint64_t v42;
  size_t v43;
  size_t *v44;
  size_t v45;
  GPUTools::MTL **v46;
  GPUTools::MTL *v47;
  char *v48;
  _QWORD *v49;
  _QWORD **v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v54;
  _QWORD *v55;
  void *v56;
  _BYTE *v57;
  DYMTLIndirectCommandBufferManager *v58;
  uint64_t v59;
  uint64_t v60;
  DYMTLIndirectCommandBufferManager *indirectCommandManager;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  char *v66;
  const void *v67;
  uint64_t v68;
  size_t v69;
  id v70;
  uint64_t v71;
  unint64_t i;
  unint64_t j;
  unint64_t v74;
  unint64_t v75;
  unint64_t v76;
  MTLDevice *device;
  double v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  char *v82;
  uint64_t v83;
  _QWORD *v84;
  uint64_t v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  __IOSurface *v91;
  void *v92;
  size_t AllocSize;
  size_t v94;
  uint64_t v95;
  void *v96;
  void *v97;
  id *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  _QWORD *v104;
  id v105;
  uint64_t v106;
  objc_super v107;
  _OWORD v108[3];
  __int128 v109;
  uint64_t v110;
  _OWORD v111[3];
  __int128 v112;
  uint64_t v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  uint64_t v118;
  id v119[9];
  _BYTE v120[56];
  __int128 v121;
  __int128 v122;
  __int128 v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  _QWORD v127[8];

  -[DYFunctionPlayer processArguments](self, "processArguments");
  v4 = (int)*MEMORY[0x24BE39040];
  v5 = *(int **)((char *)&self->super.super.isa + v4);
  v6 = *v5;
  if ((*v5 + 6143) > 0x30 || ((1 << (*v5 - 1)) & 0x1FFFFFFF77FFFLL) == 0)
  {
    switch(v6)
    {
      case -10240:
        *(_QWORD *)&v114 = 0;
        v8 = (_QWORD **)((char *)self + (int)*MEMORY[0x24BE39008]);
        *(_QWORD *)&v114 = *v8[1];
        *(_QWORD *)v120 = &v114;
        v9 = (id)std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->_objectMap, (unint64_t *)&v114, (uint64_t)&std::piecewise_construct, (_QWORD **)v120)[3];
        v10 = (const void *)*v8[2];
        -[DYMTLFunctionPlayer indirectArgumentManager](self, "indirectArgumentManager");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "encodeIndirectArgumentsForBuffer:data:", (_QWORD)v114, v10);

        v12 = *v8[3];
        v13 = *v8[4];
        if (objc_msgSend(v9, "storageMode"))
          v14 = (v13 & 3) == 0;
        else
          v14 = 0;
        if (!v14)
        {
          memcpy((void *)(objc_msgSend(objc_retainAutorelease(v9), "contents") + v12), v10, v13);
          -[DYFunctionPlayer releaseDataForArgument:](self, "releaseDataForArgument:", 2);
          goto LABEL_98;
        }
        -[DYMTLFunctionPlayer device](self, "device");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = v65;
        if (!v65)
          goto LABEL_50;
        v66 = (char *)self + (int)*MEMORY[0x24BE39010];
        v67 = (const void *)*((_QWORD *)v66 + 6);
        v68 = *((_QWORD *)v66 + 7);
        if (v67 == (const void *)v68)
        {
          v70 = objc_retainAutorelease((id)objc_msgSend(v65, "newBufferWithLength:options:", v13, 0));
          memcpy((void *)objc_msgSend(v70, "contents"), v10, v13);
          -[DYFunctionPlayer releaseDataForArgument:](self, "releaseDataForArgument:", 2);
          v71 = 0;
        }
        else
        {
          v69 = ~*MEMORY[0x24BDB03B8] & (*MEMORY[0x24BDB03B8] + v13);
          if (!v69)
          {
            -[DYFunctionPlayer releaseDataForArgument:](self, "releaseDataForArgument:", 2);
            goto LABEL_50;
          }
          *(_QWORD *)v120 = 0;
          *(_QWORD *)&v120[8] = v120;
          *(_QWORD *)&v120[16] = 0x4812000000;
          *(_QWORD *)&v120[24] = __Block_byref_object_copy_;
          *(_QWORD *)&v120[32] = __Block_byref_object_dispose_;
          *(_QWORD *)&v120[40] = "";
          *(_QWORD *)&v120[48] = 0;
          v121 = 0uLL;
          std::vector<unsigned long long>::__init_with_size[abi:ne180100]<unsigned long long *,unsigned long long *>(&v120[48], v67, v68, (v68 - (uint64_t)v67) >> 3);
          *((_QWORD *)v66 + 7) = *((_QWORD *)v66 + 6);
          v127[0] = MEMORY[0x24BDAC760];
          v127[1] = 3221225472;
          v127[2] = __46__DYMTLFunctionPlayer_executePlatformFunction__block_invoke;
          v127[3] = &unk_250D6F120;
          v127[4] = self;
          v127[5] = v120;
          v70 = (id)objc_msgSend(v64, "newBufferWithBytesNoCopy:length:options:deallocator:", v10, v69, 0, v127);
          _Block_object_dispose(v120, 8);
          if (*(_QWORD *)&v120[48])
          {
            *(_QWORD *)&v121 = *(_QWORD *)&v120[48];
            operator delete(*(void **)&v120[48]);
          }
          v71 = v12;
        }
        if (v70)
        {
          -[DYMTLFunctionPlayer commandQueue](self, "commandQueue");
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          AutoPerfStatSamplingControl::AutoPerfStatSamplingControl((uint64_t)v120, v99);

          -[DYMTLFunctionPlayer commandQueue](self, "commandQueue");
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v100, "commandBuffer");
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          v102 = v101;
          if (v101)
          {
            objc_msgSend(v101, "setLabel:", *MEMORY[0x24BE39260]);
            objc_msgSend(v102, "blitCommandEncoder");
            v103 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v103, "copyFromBuffer:sourceOffset:toBuffer:destinationOffset:size:", v70, v71, v9, v12, v13);
            objc_msgSend(v103, "endEncoding");
            objc_msgSend(v102, "commit");

          }
          AutoPerfStatSamplingControl::~AutoPerfStatSamplingControl((id *)v120);

        }
        goto LABEL_50;
      case -10239:
        if (*((_WORD *)v5 + 5) == 2)
        {
          v124 = 0;
          v125 = 0;
          v126 = 0;
          memset(&v120[8], 0, 48);
          v121 = 0u;
          v122 = 0u;
          v123 = 0u;
          GPUTools::MTL::Utils::MakeDYMTLDeviceDescriptor(**(GPUTools::MTL::Utils ***)((char *)&self->super._executePlatform + (int)*MEMORY[0x24BE39008]), v120, v3);
          if (v120[31] >= 0)
            v57 = &v120[8];
          else
            v57 = *(_BYTE **)&v120[8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v57);
          v9 = (id)objc_claimAutoreleasedReturnValue();
          GPUTools::MTL::DispatchSetCaptureVersion(*(unsigned int *)v120);
          GPUTools::MTL::Utils::DYMTLDeviceDescriptor::~DYMTLDeviceDescriptor((GPUTools::MTL::Utils::DYMTLDeviceDescriptor *)v120);
          v5 = *(int **)((char *)&self->super.super.isa + v4);
        }
        else
        {
          v9 = 0;
        }
        -[DYMTLFunctionPlayer deviceForID:withDeviceName:](self, "deviceForID:withDeviceName:", *((_QWORD *)v5 + 2), v9);

        goto LABEL_98;
      case -10238:
      case -10235:
      case -10234:
      case -10233:
      case -10231:
      case -10230:
      case -10227:
      case -10226:
      case -10225:
      case -10224:
      case -10223:
      case -10222:
      case -10221:
      case -10218:
      case -10217:
      case -10215:
        goto LABEL_13;
      case -10237:
        *(_QWORD *)v120 = v5 + 4;
        v9 = (id)std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->_objectMap, (unint64_t *)v5 + 2, (uint64_t)&std::piecewise_construct, (_QWORD **)v120)[3];
        if (v9)
        {
          v50 = (_QWORD **)((char *)self + (int)*MEMORY[0x24BE39008]);
          -[DYMTLIndirectArgumentBufferManager encodeIndirectArgumentsForBuffer:data:](self->_indirectArgumentManager, "encodeIndirectArgumentsForBuffer:data:", *(*(_QWORD ***)((char *)&self->super.super.isa + v4))[3], *v50[1]);
          v51 = *v50[2];
          v52 = *v50[3];
          if ((v51 & 3) != 0 || (*v50[3] & 0xF0) == 0)
          {
            v54 = objc_msgSend(v9, "newBufferWithBytes:length:options:", *v50[1], *v50[2], 0);
            *(_QWORD *)v120 = (*(_QWORD **)((char *)&self->super.super.isa + v4))[3];
            v55 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->_objectMap, *(unint64_t **)v120, (uint64_t)&std::piecewise_construct, (_QWORD **)v120);
            v56 = (void *)v55[3];
            v55[3] = v54;

            -[DYFunctionPlayer releaseDataForArgument:](self, "releaseDataForArgument:", 1);
          }
          else
          {
            v82 = (char *)self + (int)*MEMORY[0x24BE39010];
            if (*((_QWORD *)v82 + 3) == *((_QWORD *)v82 + 4))
            {
              v95 = *v50[1];
              -[DYMTLFunctionPlayer device](self, "device");
              v96 = (void *)objc_claimAutoreleasedReturnValue();
              -[DYMTLFunctionPlayer _createPrivateBufferForFunctionWithDevice:bytes:length:resourceOptions:](self, "_createPrivateBufferForFunctionWithDevice:bytes:length:resourceOptions:", v96, v95, v51, v52);
              v97 = (void *)objc_claimAutoreleasedReturnValue();

              *(_QWORD *)v120 = (*(_QWORD **)((char *)&self->super.super.isa + v4))[3];
              v98 = (id *)std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->_objectMap, *(unint64_t **)v120, (uint64_t)&std::piecewise_construct, (_QWORD **)v120);
              objc_storeStrong(v98 + 3, v97);
              -[DYFunctionPlayer releaseDataForArgument:](self, "releaseDataForArgument:", 1);
            }
            else
            {
              v83 = objc_msgSend(v9, "newBufferWithLength:options:", *v50[2], *v50[3]);
              if ((~*MEMORY[0x24BDB03B8] & (unint64_t)(*MEMORY[0x24BDB03B8] + v51)) != 0)
              {
                v84 = (_QWORD *)*((_QWORD *)v82 + 3);
                if (*((_QWORD *)v82 + 4) - (_QWORD)v84 != 8)
                  __assert_rtn("-[DYMTLFunctionPlayer executePlatformFunction]", ", 0, "_argumentStorePositions[1].size() == 1");
                v85 = *v50[1];
                *(_QWORD *)v120 = 0;
                *(_QWORD *)&v120[8] = v120;
                *(_OWORD *)&v120[16] = 0x2020000000uLL;
                *(_QWORD *)&v120[24] = *v84;
                *((_QWORD *)v82 + 4) = v84;
                v119[3] = (id)MEMORY[0x24BDAC760];
                v119[4] = (id)3221225472;
                v119[5] = __46__DYMTLFunctionPlayer_executePlatformFunction__block_invoke_2;
                v119[6] = &unk_250D6F148;
                v119[7] = self;
                v119[8] = v120;
                v86 = (void *)objc_msgSend(v9, "newBufferWithBytesNoCopy:length:options:deallocator:", v85);
                -[DYMTLFunctionPlayer commandQueue](self, "commandQueue");
                v87 = (void *)objc_claimAutoreleasedReturnValue();
                AutoPerfStatSamplingControl::AutoPerfStatSamplingControl((uint64_t)&v114, v87);
                objc_msgSend(v87, "commandBuffer");
                v88 = (void *)objc_claimAutoreleasedReturnValue();
                v89 = v88;
                if (v88)
                {
                  objc_msgSend(v88, "setLabel:", *MEMORY[0x24BE39260]);
                  objc_msgSend(v89, "blitCommandEncoder");
                  v90 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v90, "copyFromBuffer:sourceOffset:toBuffer:destinationOffset:size:", v86, 0, v83, 0, v51);
                  objc_msgSend(v90, "endEncoding");
                  objc_msgSend(v89, "commit");

                }
                AutoPerfStatSamplingControl::~AutoPerfStatSamplingControl((id *)&v114);

                _Block_object_dispose(v120, 8);
              }
              else
              {
                -[DYFunctionPlayer releaseDataForArgument:](self, "releaseDataForArgument:", 1);
              }
              *(_QWORD *)v120 = (*(_QWORD **)((char *)&self->super.super.isa + v4))[3];
              v104 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->_objectMap, *(unint64_t **)v120, (uint64_t)&std::piecewise_construct, (_QWORD **)v120);
              v97 = (void *)v104[3];
              v104[3] = v83;
            }

          }
        }
        goto LABEL_98;
      case -10236:
        -[DYMTLFunctionPlayer _restoreTexture:commandBuffer:argumentOffset:](self, "_restoreTexture:commandBuffer:argumentOffset:", *((_QWORD *)v5 + 2), 0, 0);
        return;
      case -10232:
        -[DYMTLFunctionPlayer objectForKey:](self, "objectForKey:", *((_QWORD *)v5 + 2));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = (_QWORD **)((char *)self + (int)*MEMORY[0x24BE39008]);
        v27 = (const void *)*v26[1];
        v28 = *v26[2];
        v29 = *v26[3];
        v105 = v25;
        v30 = objc_msgSend(v25, "isDrawable");
        Data = DYHarvesterGetData();
        Metadata = DYHarvesterGetMetadata();
        if (Metadata)
        {
          if ((v30 & 1) == 0)
          {
            v33 = (__IOSurface *)objc_msgSend(v105, "iosurface");
            IOSurfaceLock(v33, 0, 0);
            DYIOSurfaceUtilsPlaneCount();
            v34 = *(_QWORD *)(Metadata + 16);
            if (v34 <= 1)
              v35 = v29;
            else
              v35 = 0;
            if (v34)
            {
              v36 = 0;
              v37 = 0;
              v106 = Metadata + 24;
              do
              {
                HeightOfPlane = IOSurfaceGetHeightOfPlane(v33, v37 + v35);
                IOSurfaceGetWidthOfPlane(v33, v37 + v35);
                BytesPerRowOfPlane = IOSurfaceGetBytesPerRowOfPlane(v33, v37 + v35);
                BaseAddressOfPlane = (char *)IOSurfaceGetBaseAddressOfPlane(v33, v37 + v35);
                if (HeightOfPlane)
                {
                  v41 = BaseAddressOfPlane;
                  v42 = v106 + 48 * v37;
                  v45 = *(_QWORD *)(v42 + 32);
                  v44 = (size_t *)(v42 + 32);
                  v43 = v45;
                  do
                  {
                    memcpy(v41, (const void *)(Data + v36), v43);
                    v43 = *v44;
                    v36 += *v44;
                    v41 += BytesPerRowOfPlane;
                    --HeightOfPlane;
                  }
                  while (HeightOfPlane);
                }
                ++v37;
              }
              while (v37 != v34);
            }
            IOSurfaceUnlock(v33, 0, 0);
          }
        }
        else if ((objc_msgSend(v105, "pixelFormat") & 0xFFFFFFFFFFFFFFFELL) == 0x226)
        {
          DecodeRGB10A8_2P_XR10(v105, (uint64_t)v27);
        }
        else if ((v30 & 1) == 0)
        {
          v91 = (__IOSurface *)objc_msgSend(v105, "iosurface");
          IOSurfaceLock(v91, 0, 0);
          v92 = IOSurfaceGetBaseAddressOfPlane(v91, v29);
          AllocSize = IOSurfaceGetAllocSize(v91);
          if (v28 >= AllocSize)
            v94 = AllocSize;
          else
            v94 = v28;
          memcpy(v92, v27, v94);
          IOSurfaceUnlock(v91, 0, 0);
        }

        return;
      case -10229:
        if (*((_WORD *)v5 + 5) == 5)
        {
          v46 = *(GPUTools::MTL ***)((char *)&self->super._executeGraphicsSEL + (int)*MEMORY[0x24BE39008]);
          v47 = *v46;
          v48 = (char *)self + (int)*MEMORY[0x24BE39030];
          *(_QWORD *)v120 = v46;
          v49 = std::__hash_table<std::__hash_value_type<void *,unsigned long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long>>>::__emplace_unique_key_args<void *,std::piecewise_construct_t const&,std::tuple<void * const&>,std::tuple<>>((uint64_t)v48, v46, (uint64_t)&std::piecewise_construct, (_QWORD **)v120);
          GPUTools::MTL::MakeDispatchDataT(v47, v49[3]);
          v9 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v9 = 0;
        }
        -[DYMTLFunctionPlayer indirectArgumentManager](self, "indirectArgumentManager");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "processCommandBuffer:functionIndex:ancestorMapData:indirectArgumentBuffersData:resourceMapsData:driverDecodingData:", **(_QWORD **)((char *)&self->super.super.isa + (int)*MEMORY[0x24BE39008]), *(unsigned int *)((char *)&self->super.super.isa + (int)*MEMORY[0x24BE39028]), **(_QWORD **)((char *)&self->super._executePlatform + (int)*MEMORY[0x24BE39008]), **(_QWORD **)((char *)&self->super._executePlatformSEL + (int)*MEMORY[0x24BE39008]), **(_QWORD **)((char *)&self->super._executeGraphics + (int)*MEMORY[0x24BE39008]), v9);
LABEL_50:

        goto LABEL_98;
      case -10228:
        -[DYMTLIndirectCommandBufferManager addGPUVirtualAddress:forObjectId:](self->_indirectCommandManager, "addGPUVirtualAddress:forObjectId:", **(_QWORD **)((char *)&self->super._executePlatform + (int)*MEMORY[0x24BE39008]), *((_QWORD *)v5 + 2));
        return;
      case -10220:
        -[DYMTLIndirectCommandBufferManager addRenderPipelineStateUniqueIdentifier:forObjectId:](self->_indirectCommandManager, "addRenderPipelineStateUniqueIdentifier:forObjectId:", **(_QWORD **)((char *)&self->super._executePlatform + (int)*MEMORY[0x24BE39008]), *((_QWORD *)v5 + 2));
        return;
      case -10219:
        indirectCommandManager = self->_indirectCommandManager;
        *(_QWORD *)v120 = v5 + 4;
        v62 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->_objectMap, (unint64_t *)v5 + 2, (uint64_t)&std::piecewise_construct, (_QWORD **)v120)[3];
        v63 = **(_QWORD **)((char *)&self->super._executePlatform + (int)*MEMORY[0x24BE39008]);
        -[DYMTLFunctionPlayer commandQueue](self, "commandQueue");
        v9 = (id)objc_claimAutoreleasedReturnValue();
        -[DYMTLIndirectCommandBufferManager restoreBuffer:withData:commandQueue:](indirectCommandManager, "restoreBuffer:withData:commandQueue:", v62, v63, v9);
        goto LABEL_98;
      case -10216:
        v58 = self->_indirectCommandManager;
        *(_QWORD *)v120 = v5 + 4;
        v59 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->_objectMap, (unint64_t *)v5 + 2, (uint64_t)&std::piecewise_construct, (_QWORD **)v120)[3];
        v60 = **(_QWORD **)((char *)&self->super._executePlatform + (int)*MEMORY[0x24BE39008]);
        -[DYMTLFunctionPlayer commandQueue](self, "commandQueue");
        v9 = (id)objc_claimAutoreleasedReturnValue();
        -[DYMTLIndirectCommandBufferManager restoreBuffer:optimizedRanges:commandQueue:](v58, "restoreBuffer:optimizedRanges:commandQueue:", v59, v60, v9);
        goto LABEL_98;
      case -10214:
        -[DYMTLIndirectCommandBufferManager addComputePipelineStateUniqueIdentifier:forObjectId:](self->_indirectCommandManager, "addComputePipelineStateUniqueIdentifier:forObjectId:", **(_QWORD **)((char *)&self->super._executePlatform + (int)*MEMORY[0x24BE39008]), *((_QWORD *)v5 + 2));
        return;
      case -10213:
        v15 = (_QWORD **)((char *)self + (int)*MEMORY[0x24BE39008]);
        *(_QWORD *)&v114 = *v15[1];
        *(_QWORD *)v120 = &v114;
        v9 = (id)std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>((uint64_t)&self->_objectMap, (unint64_t *)&v114, (uint64_t)&std::piecewise_construct, (_QWORD **)v120)[3];
        v16 = *v15[2];
        -[DYMTLFunctionPlayer commandQueue](self, "commandQueue");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        AutoPerfStatSamplingControl::AutoPerfStatSamplingControl((uint64_t)v119, v17);

        -[DYMTLFunctionPlayer commandQueue](self, "commandQueue");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "commandBuffer");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setLabel:", *MEMORY[0x24BE39260]);
        objc_msgSend(v19, "resourceStateCommandEncoder");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v117 = 0uLL;
        v118 = 0;
        -[DYMTLFunctionPlayer device](self, "device");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v9, "textureType");
        v23 = objc_msgSend(v9, "pixelFormat");
        v24 = objc_msgSend(v9, "sampleCount");
        if (v21)
        {
          objc_msgSend(v21, "sparseTileSizeWithTextureType:pixelFormat:sampleCount:", v22, v23, v24);
        }
        else
        {
          v117 = 0uLL;
          v118 = 0;
        }

        if (v16 == 2)
        {
          for (i = 0; i < objc_msgSend(v9, "arrayLength"); ++i)
          {
            for (j = 0; j <= objc_msgSend(v9, "firstMipmapInTail"); ++j)
            {
              v115 = 0u;
              v116 = 0u;
              v114 = 0u;
              v74 = (unint64_t)objc_msgSend(v9, "width") >> j;
              if (v74 <= 1)
                v74 = 1;
              *((_QWORD *)&v115 + 1) = v74;
              v75 = (unint64_t)objc_msgSend(v9, "height") >> j;
              if (v75 <= 1)
                v75 = 1;
              *(_QWORD *)&v116 = v75;
              v76 = (unint64_t)objc_msgSend(v9, "depth") >> j;
              if (v76 <= 1)
                v76 = 1;
              *((_QWORD *)&v116 + 1) = v76;
              device = self->_device;
              v112 = v117;
              v113 = v118;
              -[MTLDevice convertSparsePixelRegions:toTileRegions:withTileSize:alignmentMode:numRegions:](device, "convertSparsePixelRegions:toTileRegions:withTileSize:alignmentMode:numRegions:", &v114, v120, &v112, 0, 1);
              v111[0] = *(_OWORD *)v120;
              v111[1] = *(_OWORD *)&v120[16];
              v111[2] = *(_OWORD *)&v120[32];
              objc_msgSend(v20, "updateTextureMapping:mode:region:mipLevel:slice:", v9, 1, v111, j, i);
            }
          }
        }
        else
        {
          v115 = 0u;
          v116 = 0u;
          v114 = 0u;
          *(_QWORD *)&v78 = GPUTools::MTL::MakeMTLRegion((GPUTools::MTL *)*v15[3], (uint64_t)&v114).n128_u64[0];
          v79 = *v15[4];
          v80 = *v15[5];
          -[DYMTLFunctionPlayer device](self, "device", v78);
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          v109 = v117;
          v110 = v118;
          objc_msgSend(v81, "convertSparsePixelRegions:toTileRegions:withTileSize:alignmentMode:numRegions:", &v114, v120, &v109, 0, 1);

          v108[0] = *(_OWORD *)v120;
          v108[1] = *(_OWORD *)&v120[16];
          v108[2] = *(_OWORD *)&v120[32];
          objc_msgSend(v20, "updateTextureMapping:mode:region:mipLevel:slice:", v9, v16, v108, v79, v80);
        }
        objc_msgSend(v20, "endEncoding");
        objc_msgSend(v19, "commit");

        AutoPerfStatSamplingControl::~AutoPerfStatSamplingControl(v119);
LABEL_98:

        break;
      default:
        if ((v6 + 10201) >= 2)
        {
LABEL_13:
          v107.receiver = self;
          v107.super_class = (Class)DYMTLFunctionPlayer;
          -[DYFunctionPlayer executePlatformFunction](&v107, sel_executePlatformFunction);
        }
        break;
    }
  }
  else
  {
    DispatchMPSMethod();
  }
}

uint64_t __46__DYMTLFunctionPlayer_executePlatformFunction__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 48);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 56) != v1)
  {
    v2 = result;
    v3 = 0;
    do
    {
      result = objc_msgSend(*(id *)(v2 + 32), "releaseDataForPosition:", *(_QWORD *)(v1 + 8 * v3++));
      v1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 40) + 8) + 48);
    }
    while (v3 < (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 40) + 8) + 56) - v1) >> 3);
  }
  return result;
}

uint64_t __46__DYMTLFunctionPlayer_executePlatformFunction__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "releaseDataForPosition:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
}

- (id)_createPrivateBufferForFunctionWithDevice:(id)a3 bytes:(char *)a4 length:(unint64_t)a5 resourceOptions:(unint64_t)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v18[3];

  v10 = a3;
  v11 = (void *)objc_msgSend(v10, "newBufferWithBytes:length:options:", a4, a5, 0);
  v12 = (void *)objc_msgSend(v10, "newBufferWithLength:options:", a5, a6);
  -[DYMTLFunctionPlayer commandQueue](self, "commandQueue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  AutoPerfStatSamplingControl::AutoPerfStatSamplingControl((uint64_t)v18, v13);
  objc_msgSend(v13, "commandBuffer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "setLabel:", *MEMORY[0x24BE39260]);
    objc_msgSend(v15, "blitCommandEncoder");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "copyFromBuffer:sourceOffset:toBuffer:destinationOffset:size:", v11, 0, v12, 0, a5);
    objc_msgSend(v16, "endEncoding");
    objc_msgSend(v15, "commit");

  }
  AutoPerfStatSamplingControl::~AutoPerfStatSamplingControl(v18);

  return v12;
}

- (void)_saveBytes
{
  int v3;
  void *v4;
  _QWORD **v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD **v10;
  void *v11;
  _QWORD **v12;
  void *v13;
  _QWORD **v14;
  _QWORD *v15;
  void *v16;
  unint64_t v17;
  unint64_t *v18;

  v3 = **(_DWORD **)((char *)&self->super.super.isa + (int)*MEMORY[0x24BE39040]);
  if (v3 > -16224)
  {
    if (v3 == -16223)
    {
      v13 = (void *)objc_opt_class();
      v14 = (_QWORD **)((char *)self + (int)*MEMORY[0x24BE39008]);
      v6 = objc_msgSend(v13, "fragmentBytesKeyAtIndex:", *v14[3]);
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", *v14[1], *v14[2]);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = 1448;
    }
    else
    {
      if (v3 != -16143)
        return;
      v9 = (void *)objc_opt_class();
      v10 = (_QWORD **)((char *)self + (int)*MEMORY[0x24BE39008]);
      v6 = objc_msgSend(v9, "tileBytesKeyAtIndex:", *v10[3]);
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", *v10[1], *v10[2]);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = 1488;
    }
  }
  else if (v3 == -16227)
  {
    v11 = (void *)objc_opt_class();
    v12 = (_QWORD **)((char *)self + (int)*MEMORY[0x24BE39008]);
    v6 = objc_msgSend(v11, "computeBytesKeyAtIndex:", *v12[3]);
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", *v12[1], *v12[2]);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = 1528;
  }
  else
  {
    if (v3 != -16225)
      return;
    v4 = (void *)objc_opt_class();
    v5 = (_QWORD **)((char *)self + (int)*MEMORY[0x24BE39008]);
    v6 = objc_msgSend(v4, "vertexBytesKeyAtIndex:", *v5[3]);
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", *v5[1], *v5[2]);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = 1408;
  }
  v17 = v6;
  v18 = &v17;
  v15 = std::__hash_table<std::__hash_value_type<unsigned long long,NSData * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,NSData * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,NSData * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,NSData * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>((uint64_t)self + v8, &v17, (uint64_t)&std::piecewise_construct, &v18);
  v16 = (void *)v15[3];
  v15[3] = v7;

}

- (void)executeGraphicsFunction
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  id v6;
  uint64_t v7;
  _QWORD *v8;
  void *v9;
  uint64_t v10;
  _QWORD *v11;
  void *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id *v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  const void *v25;
  _QWORD *v26;
  uint64_t v27;
  _QWORD *v28;
  void *v29;
  char *v30;
  void *v31;
  const void *v32;
  _QWORD *MTLImageFilterFunctionInfo;
  void *v34;
  void *v35;
  id *v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  void *v41;
  _DWORD *v42;
  void *v44;
  id v45;
  unint64_t v46;
  MTLCommandQueueSPI **p_commandQueue;
  MTLCommandQueueSPI *v48;
  id *v49;
  GPUTools::MTL ***v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t Data;
  uint64_t v54;
  uint64_t v55;
  _OWORD v56[3];
  __int128 v57;
  __int128 v58;
  __int128 v59;
  unint64_t v60;
  unint64_t v61;

  if (!-[DYFunctionPlayer shouldExecuteGraphicsFunction](self, "shouldExecuteGraphicsFunction"))
    return;
  -[DYFunctionPlayer processArguments](self, "processArguments");
  -[DYMTLFunctionPlayer _saveBytes](self, "_saveBytes");
  v3 = (int)*MEMORY[0x24BE39040];
  v4 = *(uint64_t *)((char *)&self->super.super.isa + v3);
  v5 = *(_DWORD *)v4;
  if (*(int *)v4 > -15910)
  {
    if (v5 > -15848)
    {
      if (v5 == -15847)
      {
        v30 = (char *)self + (int)*MEMORY[0x24BE39008];
        GPUTools::MTL::MakeMTLArray(**((_QWORD ***)v30 + 1), *(unsigned __int16 *)(v4 + 92), (uint64_t)&self->_objectMap);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        MTLImageFilterFunctionInfo = GPUTools::MTL::MakeMTLImageFilterFunctionInfo(**((GPUTools::MTL ***)v30 + 2), v32);
        -[DYMTLFunctionPlayer device](self, "device");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = (void *)objc_msgSend(v34, "newLibraryWithImageFilterFunctionsSPI:imageFilterFunctionInfo:error:", v31, MTLImageFilterFunctionInfo, 0);

        *(_QWORD *)&v57 = (*(_QWORD **)((char *)&self->super.super.isa + v3))[3];
        v36 = (id *)std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->_objectMap, (unint64_t *)v57, (uint64_t)&std::piecewise_construct, (_QWORD **)&v57);
        objc_storeStrong(v36 + 3, v35);
        v37 = 0;
        v38 = 2;
        while (v37 < objc_msgSend(v31, "count"))
        {
          free((void *)MTLImageFilterFunctionInfo[v38]);
          ++v37;
          v38 += 3;
        }
        free(MTLImageFilterFunctionInfo);

        goto LABEL_37;
      }
      if (v5 == -12544)
      {
        v61 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(v4 + 24, 0);
        v60 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&self->super.super.isa + v3) + 48, 0);
        *(_QWORD *)&v57 = &v60;
        objc_msgSend((id)std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->_objectMap, &v60, (uint64_t)&std::piecewise_construct, (_QWORD **)&v57)[3], "commandBuffer");
        v10 = objc_claimAutoreleasedReturnValue();
        *(_QWORD *)&v57 = &v61;
        v11 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->_objectMap, &v61, (uint64_t)&std::piecewise_construct, (_QWORD **)&v57);
        v12 = (void *)v11[3];
        v11[3] = v10;

        goto LABEL_37;
      }
    }
    else
    {
      if (v5 == -15909)
      {
        v61 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(v4 + 72, 0);
        v60 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&self->super.super.isa + v3) + 24, 0);
        v20 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&self->_objectMap.__table_.__bucket_list_.__ptr_.__value_, &v61);
        if (v20)
        {
          v21 = v20;
          -[DYMTLFunctionPlayer device](self, "device");
          v6 = (id)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v6, "newSharedEventWithHandle:", v21[3]);
        }
        else
        {
          -[DYMTLFunctionPlayer device](self, "device");
          v6 = (id)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v6, "newSharedEvent");
        }
        *(_QWORD *)&v57 = &v60;
        v23 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->_objectMap, &v60, (uint64_t)&std::piecewise_construct, (_QWORD **)&v57);
        v9 = (void *)v23[3];
        v23[3] = v22;
        goto LABEL_33;
      }
      if (v5 == -15908)
      {
        v61 = **(_QWORD **)(v4 + 48);
        *(_QWORD *)&v57 = &v61;
        objc_msgSend((id)std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->_objectMap, &v61, (uint64_t)&std::piecewise_construct, (_QWORD **)&v57)[3], "commitAndWaitUntilSubmitted");
        goto LABEL_37;
      }
    }
LABEL_28:
    v13 = (int)*MEMORY[0x24BE39008];
    goto LABEL_29;
  }
  if (v5 > -15980)
  {
    if (v5 == -15979)
    {
      v61 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(v4 + 24, 0);
      v60 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&self->super.super.isa + v3) + 72, 0);
      v24 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&self->_objectMap.__table_.__bucket_list_.__ptr_.__value_, &v60);
      if (v24)
      {
        v26 = v24;
        -[DYMTLFunctionPlayer device](self, "device");
        v6 = (id)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v6, "newSharedTextureWithHandle:", v26[3]);
        *(_QWORD *)&v57 = &v61;
        v28 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->_objectMap, &v61, (uint64_t)&std::piecewise_construct, (_QWORD **)&v57);
        v29 = (void *)v28[3];
        v28[3] = v27;
      }
      else
      {
        GPUTools::MTL::MakeMTLTextureDescriptor(*(*(GPUTools::MTL ****)((char *)&self->super.super.isa + v3))[12], v25);
        v6 = (id)objc_claimAutoreleasedReturnValue();
        -[DYMTLFunctionPlayer device](self, "device");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v29, "newSharedTextureWithDescriptor:", v6);
        *(_QWORD *)&v57 = &v61;
        v40 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->_objectMap, &v61, (uint64_t)&std::piecewise_construct, (_QWORD **)&v57);
        v41 = (void *)v40[3];
        v40[3] = v39;

      }
      goto LABEL_36;
    }
    if (v5 == -15912)
    {
      v61 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned int>(v4 + 24, 0);
      -[DYMTLFunctionPlayer device](self, "device");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "newSharedEvent");
      *(_QWORD *)&v57 = &v61;
      v8 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->_objectMap, &v61, (uint64_t)&std::piecewise_construct, (_QWORD **)&v57);
      v9 = (void *)v8[3];
      v8[3] = v7;
LABEL_33:

      goto LABEL_36;
    }
    goto LABEL_28;
  }
  if (v5 != -16313)
  {
    if (v5 == -16236)
    {
      *(_QWORD *)&v57 = v4 + 16;
      v6 = (id)std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->_objectMap, (unint64_t *)(v4 + 16), (uint64_t)&std::piecewise_construct, (_QWORD **)&v57)[3];
      if (objc_msgSend(v6, "storageMode") != 3)
      {
        if (objc_msgSend(v6, "storageMode") == 2)
        {
          -[DYMTLFunctionPlayer _restoreTexture:commandBuffer:argumentOffset:](self, "_restoreTexture:commandBuffer:argumentOffset:", (*(_QWORD **)((char *)&self->super.super.isa + v3))[2], 0, 0);
        }
        else if (!objc_msgSend(v6, "iosurface"))
        {
          v58 = 0u;
          v59 = 0u;
          v57 = 0u;
          v50 = (GPUTools::MTL ***)((char *)self + (int)*MEMORY[0x24BE39008]);
          GPUTools::MTL::MakeMTLRegion(*v50[1], (uint64_t)&v57);
          v51 = (uint64_t)*v50[2];
          v52 = (uint64_t)*v50[3];
          Data = DYHarvesterGetData();
          v54 = (uint64_t)*v50[5];
          v55 = (uint64_t)*v50[6];
          v56[0] = v57;
          v56[1] = v58;
          v56[2] = v59;
          objc_msgSend(v6, "replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:", v56, v51, v52, Data, v54, v55);
        }
      }
      goto LABEL_36;
    }
    goto LABEL_28;
  }
  v13 = (int)*MEMORY[0x24BE39008];
  v14 = (char *)self + v13;
  v15 = **(_QWORD **)((char *)&self->super._executeGraphics + v13);
  if ((v15 & 0xF0) != 0x20)
  {
LABEL_29:
    DYMTLDispatchFunc(&self->_objectMap.__table_.__bucket_list_.__ptr_.__value_, *(_QWORD *)(v4 + 16), v5, (uint64_t)self + v13, (uint64_t)self + (int)*MEMORY[0x24BE39030], *(unint64_t **)(v4 + 24), self->_indirectArgumentManager);
    goto LABEL_37;
  }
  v16 = **((_QWORD **)v14 + 1);
  v17 = **((_QWORD **)v14 + 2);
  -[DYMTLFunctionPlayer device](self, "device");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[DYMTLFunctionPlayer _createPrivateBufferForFunctionWithDevice:bytes:length:resourceOptions:](self, "_createPrivateBufferForFunctionWithDevice:bytes:length:resourceOptions:", v18, v16, v17, v15);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)&v57 = (*(_QWORD **)((char *)&self->super.super.isa + v3))[3];
  v19 = (id *)std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->_objectMap, (unint64_t *)v57, (uint64_t)&std::piecewise_construct, (_QWORD **)&v57);
  objc_storeStrong(v19 + 3, v6);
  -[DYFunctionPlayer releaseDataForArgument:](self, "releaseDataForArgument:", 1);
LABEL_36:

LABEL_37:
  v42 = *(Class *)((char *)&self->super.super.isa + v3);
  if ((*v42 + 16316) < 2 || *v42 == -16165)
  {
    v61 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>((uint64_t)(v42 + 6), 0);
    *(_QWORD *)&v57 = &v61;
    v44 = (void *)std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>((uint64_t)&self->_objectMap, &v61, (uint64_t)&std::piecewise_construct, (_QWORD **)&v57)[3];
    v45 = v44;
    v46 = objc_msgSend(v45, "maxCommandBufferCount");
    p_commandQueue = &self->_commandQueue;
    if (v46 > -[MTLCommandQueueSPI maxCommandBufferCount](self->_commandQueue, "maxCommandBufferCount"))
    {
      -[MTLCommandQueueSPI finish](*p_commandQueue, "finish");
      objc_storeStrong((id *)&self->_commandQueue, v44);
    }
    v48 = *p_commandQueue;
    v61 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&self->super.super.isa + v3) + 24, 0);
    *(_QWORD *)&v57 = &v61;
    v49 = (id *)std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>((uint64_t)&self->_objectMap, &v61, (uint64_t)&std::piecewise_construct, (_QWORD **)&v57);
    objc_storeStrong(v49 + 3, v48);

  }
}

- (BOOL)isFrameBoundary
{
  return ((*(unsigned __int8 **)((char *)&self->super.super.isa + (int)*MEMORY[0x24BE39040]))[6] >> 2) & 1;
}

+ (void)vertexBytesKeyAtIndex:(unint64_t)a3
{
  return (char *)&kDYMTLVertexBytesKeys + a3;
}

+ (void)fragmentBytesKeyAtIndex:(unint64_t)a3
{
  return (char *)&kDYMTLFragmentBytesKeys + a3;
}

+ (void)computeBytesKeyAtIndex:(unint64_t)a3
{
  return (char *)&kDYMTLComputeBytesKeys + a3;
}

+ (void)tileBytesKeyAtIndex:(unint64_t)a3
{
  return (char *)&kDYMTLTileBytesKeys + a3;
}

- (DYMTLIndirectArgumentBufferManager)indirectArgumentManager
{
  return self->_indirectArgumentManager;
}

- (void)setIndirectArgumentManager:(id)a3
{
  objc_storeStrong((id *)&self->_indirectArgumentManager, a3);
}

- (DYMTLIndirectCommandBufferManager)indirectCommandManager
{
  return self->_indirectCommandManager;
}

- (void)setIndirectCommandManager:(id)a3
{
  objc_storeStrong((id *)&self->_indirectCommandManager, a3);
}

- (MTLDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_indirectCommandManager, 0);
  objc_storeStrong((id *)&self->_indirectArgumentManager, 0);
  std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::~__hash_table((uint64_t)&self->_computeBytesDataMap);
  std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::~__hash_table((uint64_t)&self->_tileBytesDataMap);
  std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::~__hash_table((uint64_t)&self->_fragmentBytesDataMap);
  std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::~__hash_table((uint64_t)&self->_vertexBytesDataMap);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::~__hash_table((uint64_t)&self->_objectMap);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 85) = 0u;
  *((_OWORD *)self + 86) = 0u;
  *((_DWORD *)self + 348) = 1065353216;
  *((_OWORD *)self + 88) = 0u;
  *((_OWORD *)self + 89) = 0u;
  *((_DWORD *)self + 360) = 1065353216;
  *(_OWORD *)((char *)self + 1448) = 0u;
  *(_OWORD *)((char *)self + 1464) = 0u;
  *((_DWORD *)self + 370) = 1065353216;
  *((_OWORD *)self + 93) = 0u;
  *((_OWORD *)self + 94) = 0u;
  *((_DWORD *)self + 380) = 1065353216;
  *(_OWORD *)((char *)self + 1528) = 0u;
  *(_OWORD *)((char *)self + 1544) = 0u;
  *((_DWORD *)self + 390) = 1065353216;
  return self;
}

@end
