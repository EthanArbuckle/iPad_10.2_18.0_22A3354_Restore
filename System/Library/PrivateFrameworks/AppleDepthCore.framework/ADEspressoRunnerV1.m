@implementation ADEspressoRunnerV1

- (ADEspressoRunnerV1)initWithPath:(id)a3 forEngine:(unint64_t)a4 configurationName:(id)a5
{
  id v8;
  id v9;
  ADEspressoRunnerV1 *v10;
  ADEspressoRunnerV1 *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  float v16;
  _BOOL4 v17;
  _BYTE *v18;
  int v19;
  uint64_t context;
  int v21;
  NSObject *v22;
  const char *v23;
  uint32_t v24;
  ADEspressoRunnerV1 *v25;
  id v26;
  uint64_t v27;
  id v28;
  int v29;
  uint64_t v30;
  int v31;
  objc_super v33;
  int v34;
  __int128 v35;
  __int128 v36;
  _BYTE buf[12];
  char v38;
  uint8_t v39[4];
  _BYTE *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v34 = 335679304;
  v35 = 0u;
  v36 = 0u;
  kdebug_trace();
  v33.receiver = self;
  v33.super_class = (Class)ADEspressoRunnerV1;
  v10 = -[ADEspressoRunnerV1 init](&v33, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_CPUBindWA = 0;
    v10->_storageType = 65552;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v8;
      _os_log_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "loading network from: %@", buf, 0xCu);
    }
    switch(a4)
    {
      case 0uLL:
        *(_QWORD *)&v11->_engineType = 0x1002000000000;
        objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.vision.EspressoFramework"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (!v12)
          goto LABEL_7;
        objc_msgSend(v12, "infoDictionary");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("CFBundleVersion"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "floatValue");
        v17 = v16 < 205.0;

        if (v17)
LABEL_7:
          v11->_CPUBindWA = 1;

        goto LABEL_20;
      case 1uLL:
        v19 = 2;
        goto LABEL_19;
      case 2uLL:
        v19 = 5;
        goto LABEL_19;
      case 3uLL:
        v19 = 10006;
        goto LABEL_19;
      case 4uLL:
        v19 = 10007;
LABEL_19:
        v11->_engineType = v19;
LABEL_20:
        context = espresso_create_context();
        v11->_ctx = (void *)context;
        if (!context)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            v22 = MEMORY[0x24BDACB70];
            v23 = "failed creating espresso context. this is commonly due to unsupported espresso engine.";
            v24 = 2;
            goto LABEL_41;
          }
          goto LABEL_26;
        }
        v11->_plan = (void *)espresso_create_plan();
        objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
        v21 = espresso_plan_add_network();
        if (v21)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = v21;
            v22 = MEMORY[0x24BDACB70];
            v23 = "failed adding plan to espresso runner, status: %d";
LABEL_24:
            v24 = 8;
LABEL_41:
            _os_log_error_impl(&dword_236382000, v22, OS_LOG_TYPE_ERROR, v23, buf, v24);
            goto LABEL_26;
          }
          goto LABEL_26;
        }
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          -[ADEspressoRunnerV1 networkVersionString](v11, "networkVersionString");
          v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v27 = objc_msgSend(v26, "UTF8String");
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)&buf[4] = v27;
          _os_log_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "network version: %s", buf, 0xCu);

        }
        if (v9)
        {
          v28 = objc_retainAutorelease(v9);
          objc_msgSend(v28, "UTF8String");
          v29 = espresso_network_select_configuration();
          if (v29)
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)&buf[4] = v29;
              v22 = MEMORY[0x24BDACB70];
              v23 = "failed selecting espresso configuration, status: %d";
              goto LABEL_24;
            }
LABEL_26:
            v25 = 0;
            goto LABEL_39;
          }
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          {
            v30 = objc_msgSend(objc_retainAutorelease(v28), "UTF8String");
            *(_DWORD *)buf = 136315138;
            *(_QWORD *)&buf[4] = v30;
            _os_log_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "network configuration: %s", buf, 0xCu);
          }
        }
        v31 = espresso_plan_build();
        if (v31)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = v31;
            v22 = MEMORY[0x24BDACB70];
            v23 = "failed building espresso plan, status: %d";
            goto LABEL_24;
          }
          goto LABEL_26;
        }
        break;
      default:
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          ADCommonUtils::espressoEngineAsString(a4, buf);
          v18 = v38 >= 0 ? buf : *(_BYTE **)buf;
          *(_DWORD *)v39 = 136315138;
          v40 = v18;
          _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "unknown espresso engine '%s' requested.", v39, 0xCu);
          if (v38 < 0)
            operator delete(*(void **)buf);
        }
        goto LABEL_26;
    }
  }
  v25 = v11;
LABEL_39:
  InstrumentsTraceGuard::~InstrumentsTraceGuard((InstrumentsTraceGuard *)&v34);

  return v25;
}

- (id)networkVersionString
{
  _BYTE v3[64];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  if (espresso_network_get_version())
    return 0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isVImageBindingSupportedForFormat:(unsigned int)a3
{
  return a3 == 32
      || a3 == 1111970369
      || a3 == 1380401729
      || -[ADEspressoRunnerV1 isCVPixelBufferBindingSupportedForFormat:](self, "isCVPixelBufferBindingSupportedForFormat:");
}

- (int)bindPixelBufferAsVImage:(__CVBuffer *)a3 toBlob:(const char *)a4
{
  PixelBufferUtils *PixelFormatType;
  int v6;
  uint64_t v7;
  uint64_t v8;
  CGRect *v9;
  void *data;
  size_t rowBytes;
  uint64_t v12;
  vImagePixelCount height;
  char *v14;
  uint8_t buf[16];
  vImage_Buffer v17;

  PixelFormatType = (PixelBufferUtils *)CVPixelBufferGetPixelFormatType(a3);
  v6 = (int)PixelFormatType;
  v7 = PixelBufferUtils::planeCountForPixelFormat(PixelFormatType);
  if (v7)
  {
    v8 = v7;
    v9 = (CGRect *)MEMORY[0x24BDBF090];
    PixelBufferUtils::asVImageBuffer(a3, 0, *MEMORY[0x24BDBF090], &v17);
    data = v17.data;
    rowBytes = v17.rowBytes;
    if (v8 != 1)
    {
      v12 = 1;
      height = v17.height;
      v14 = (char *)v17.data;
      do
      {
        memset(&v17, 0, sizeof(v17));
        PixelBufferUtils::asVImageBuffer(a3, (__CVBuffer *)v12, *v9, &v17);
        if (!v17.data)
          return -6;
        if (&v14[rowBytes * height] != v17.data)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Cannot bind as vImage a buffer with non-tightly-packed planes", buf, 2u);
          }
          return -6;
        }
        height = v17.height;
        rowBytes = v17.rowBytes;
        ++v12;
        v14 = (char *)v17.data;
      }
      while (v8 != v12);
    }
  }
  else
  {
    PixelBufferUtils::asVImageBuffer(a3, *MEMORY[0x24BDBF090], &v17);
    data = v17.data;
  }
  if (!data)
    return -6;
  switch(v6)
  {
    case 32:
      return espresso_network_bind_input_vimagebuffer_argb8();
    case 1111970369:
      return espresso_network_bind_input_vimagebuffer_bgra8();
    case 1380401729:
      return espresso_network_bind_input_vimagebuffer_rgba8();
  }
  return espresso_network_bind_input_vimagebuffer_planar8();
}

- (BOOL)isCVPixelBufferBindingSupportedForFormat:(unsigned int)a3
{
  PixelBufferUtils *v3;
  unint64_t v5;

  v3 = *(PixelBufferUtils **)&a3;
  if (PixelBufferUtils::planeCountForPixelFormat(*(PixelBufferUtils **)&a3))
    return 0;
  v5 = PixelBufferUtils::pixelSizeForPixelFormat(v3, 0);
  return v5 == PixelBufferUtils::componentsPerPixelForPixelFormat(v3, 0);
}

- (BOOL)isDirectBindingSupportedForFormat:(unsigned int)a3
{
  BOOL result;
  int v5;

  if (self->_engineType >> 1 != 5003)
    return 0;
  if (-[ADEspressoRunnerV1 isCVPixelBufferBindingSupportedForFormat:](self, "isCVPixelBufferBindingSupportedForFormat:"))
  {
    return 1;
  }
  result = 1;
  if ((int)a3 <= 1380411456)
  {
    if (a3 == 843264104)
      return result;
    v5 = 1278226536;
LABEL_10:
    if (a3 == v5)
      return result;
    return 0;
  }
  if (a3 != 1380411457 && a3 != 1751410032)
  {
    v5 = 1751411059;
    goto LABEL_10;
  }
  return result;
}

- (id)registerDescriptor:(id)a3
{
  id v4;
  ADEspressoRunnerV1 *v5;
  id v6;
  int v7;
  ADEspressoBufferHandle *v8;
  ADEspressoBufferHandle *v9;
  void *v10;
  void *v12;
  _OWORD v13[10];
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_msgSend(v4, "isInput");
  objc_msgSend(v4, "name");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v6, "UTF8String");
  v7 = espresso_network_bind_buffer();

  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v27 = v12;
      v28 = 1024;
      v29 = v7;
      _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failed binding espresso buffer \"%@\", status: %d", buf, 0x12u);

    }
    v8 = 0;
  }
  else
  {
    v9 = [ADEspressoBufferHandle alloc];
    objc_msgSend(v4, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[8] = v23;
    v13[9] = v24;
    v14 = v25;
    v13[4] = v19;
    v13[5] = v20;
    v13[6] = v21;
    v13[7] = v22;
    v13[0] = v15;
    v13[1] = v16;
    v13[2] = v17;
    v13[3] = v18;
    v8 = -[ADEspressoBufferHandle initWithName:buffer:](v9, "initWithName:buffer:", v10, v13);

  }
  objc_sync_exit(v5);

  return v8;
}

- (__CVBuffer)createAndRegisterPixelBufferForDescriptor:(id)a3
{
  __CVBuffer *v4;

  v4 = 0;
  -[ADEspressoRunnerV1 registerPixelBufferPtr:forDescriptor:](self, "registerPixelBufferPtr:forDescriptor:", &v4, a3);
  return v4;
}

- (int64_t)registerIOSurface:(__IOSurface *)a3 forDescriptor:(id)a4
{
  id v6;
  const __CFDictionary *v7;
  int64_t v8;
  void *v10;
  CVPixelBufferRef pixelBufferOut;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  pixelBufferOut = 0;
  v14 = *MEMORY[0x24BDC5668];
  v15[0] = MEMORY[0x24BDBD1B8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  if (CVPixelBufferCreateWithIOSurface(0, a3, v7, &pixelBufferOut))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v13 = v10;
      _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failed allocating pixel buffer for binding %@ as a surface", buf, 0xCu);

    }
    v8 = -22971;
  }
  else
  {
    v8 = -[ADEspressoRunnerV1 registerPixelBuffer:forDescriptor:](self, "registerPixelBuffer:forDescriptor:", pixelBufferOut, v6);
    CVPixelBufferRelease(pixelBufferOut);
  }

  return v8;
}

- (int64_t)registerPixelBufferPtr:(__CVBuffer *)a3 forDescriptor:(id)a4
{
  id v6;
  ADEspressoRunnerV1 *v7;
  __CVBuffer *v8;
  void *v9;
  PixelBufferUtils *v10;
  id v11;
  char *v12;
  int v13;
  uint64_t v14;
  int64_t v15;
  size_t v17;
  size_t v18;
  __CVBuffer *v19;
  unsigned __int8 *v20;
  CVPixelBufferRef v21;
  const __CFDictionary *BufferAttributes;
  CVReturn v23;
  __CVBuffer *v24;
  NSObject *v25;
  const char *v26;
  int v27;
  NSObject *v28;
  os_log_type_t v29;
  __CVBuffer *v30;
  void *v31;
  int v32;
  __CVBuffer *v33;
  __CVBuffer *v34;
  unsigned __int8 *v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 *v39;
  _BYTE buf[12];
  __int16 v41;
  int v42;
  char v43;
  size_t v44;
  size_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  LODWORD(v36) = 335679308;
  v37 = 0u;
  v38 = 0u;
  kdebug_trace();
  v7 = self;
  objc_sync_enter(v7);
  if (v6)
  {
    v8 = *a3;
    objc_msgSend(v6, "imageDescriptor", v36, v37, v38);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (PixelBufferUtils *)objc_msgSend(v9, "pixelFormat");

    objc_msgSend(v6, "isInput");
    objc_msgSend(v6, "name");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v12 = (char *)objc_msgSend(v11, "UTF8String");

    if (espresso_network_query_blob_dimensions())
    {
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
LABEL_4:
        v13 = 1;
LABEL_5:
        v14 = -22971;
        goto LABEL_9;
      }
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = v12;
      v25 = MEMORY[0x24BDACB70];
      v26 = "failed to get dimensions for \"%s\";
LABEL_41:
      _os_log_error_impl(&dword_236382000, v25, OS_LOG_TYPE_ERROR, v26, buf, 0xCu);
      goto LABEL_4;
    }
    v17 = v44;
    v18 = v45;
    if (PixelBufferUtils::componentsPerPixelForPixelFormat(v10, 0) == 1
      && !PixelBufferUtils::planeCountForPixelFormat(v10))
    {
      v18 = v46 * v45 * v47;
    }
    if (v8)
    {
      if (*a3)
        goto LABEL_18;
    }
    else
    {
      *(_QWORD *)buf = 0;
      BufferAttributes = (const __CFDictionary *)getBufferAttributes();
      v23 = CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v44, v18, (OSType)v10, BufferAttributes, (CVPixelBufferRef *)buf);
      v24 = *(__CVBuffer **)buf;
      if (v23)
        v24 = 0;
      *a3 = v24;
      if (v24)
      {
LABEL_18:
        if (-[ADEspressoRunnerV1 isDirectBindingSupportedForFormat:](v7, "isDirectBindingSupportedForFormat:", v10))
        {
          if (ADDebugUtilsADVerboseLogsEnabled && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            *(_QWORD *)&buf[4] = v12;
            _os_log_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "saving \"%s\" to bind as pixel buffer directly", buf, 0xCu);
          }
          v19 = *a3;
          std::string::basic_string[abi:ne180100]<0>(buf, v12);
          v39 = (__int128 *)buf;
          v20 = std::__hash_table<std::__hash_value_type<std::string,PixelBufferSharedPtr>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PixelBufferSharedPtr>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PixelBufferSharedPtr>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PixelBufferSharedPtr>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&v7->_pixelBuffersToBindDirect, buf, &v39);
          CVPixelBufferRelease(*((CVPixelBufferRef *)v20 + 6));
          v21 = CVPixelBufferRetain(v19);
          goto LABEL_23;
        }
        if (-[ADEspressoRunnerV1 isCVPixelBufferBindingSupportedForFormat:](v7, "isCVPixelBufferBindingSupportedForFormat:", v10))
        {
          if (!v7->_CPUBindWA)
          {
            if (ADDebugUtilsADVerboseLogsEnabled && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              *(_QWORD *)&buf[4] = v12;
              _os_log_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "saving \"%s\" to bind as CVPixelBuffer", buf, 0xCu);
            }
            v30 = *a3;
            std::string::basic_string[abi:ne180100]<0>(buf, v12);
            v39 = (__int128 *)buf;
            v20 = std::__hash_table<std::__hash_value_type<std::string,PixelBufferSharedPtr>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PixelBufferSharedPtr>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PixelBufferSharedPtr>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PixelBufferSharedPtr>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&v7->_pixelBuffersToBindIndirect, buf, &v39);
            CVPixelBufferRelease(*((CVPixelBufferRef *)v20 + 6));
            v21 = CVPixelBufferRetain(v30);
            goto LABEL_23;
          }
          if ((objc_msgSend(v6, "isInput") & 1) == 0)
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315138;
              *(_QWORD *)&buf[4] = v12;
              _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "cannot bind output \"%s\" buffer on CPU engine in this platform with provided pixel format", buf, 0xCu);
            }
            std::string::basic_string[abi:ne180100]<0>(buf, v12);
            std::__hash_table<std::__hash_value_type<std::string,PixelBufferSharedPtr>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PixelBufferSharedPtr>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PixelBufferSharedPtr>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PixelBufferSharedPtr>>>::__erase_unique<std::string>((uint64_t *)&v7->_pixelBuffersToBindAsVImage, buf);
            if (v43 < 0)
              operator delete(*(void **)buf);
            v27 = -12;
            goto LABEL_74;
          }
          if (-[ADEspressoRunnerV1 isVImageBindingSupportedForFormat:](v7, "isVImageBindingSupportedForFormat:", v10))
          {
            v27 = 0;
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315138;
              *(_QWORD *)&buf[4] = v12;
              _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "cannot bind input \"%s\" buffer on CPU engine in this platform with provided pixel format", buf, 0xCu);
            }
            std::string::basic_string[abi:ne180100]<0>(buf, v12);
            std::__hash_table<std::__hash_value_type<std::string,PixelBufferSharedPtr>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PixelBufferSharedPtr>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PixelBufferSharedPtr>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PixelBufferSharedPtr>>>::__erase_unique<std::string>((uint64_t *)&v7->_pixelBuffersToBindAsVImage, buf);
            if (v43 < 0)
              operator delete(*(void **)buf);
            v27 = -6;
          }
          if (ADDebugUtilsADVerboseLogsEnabled && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            *(_QWORD *)&buf[4] = v12;
            _os_log_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "saving \"%s\" to bind as vImage", buf, 0xCu);
          }
          v34 = *a3;
          std::string::basic_string[abi:ne180100]<0>(buf, v12);
          v39 = (__int128 *)buf;
          v35 = std::__hash_table<std::__hash_value_type<std::string,PixelBufferSharedPtr>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PixelBufferSharedPtr>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PixelBufferSharedPtr>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PixelBufferSharedPtr>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&v7->_pixelBuffersToBindAsVImage, buf, &v39);
          CVPixelBufferRelease(*((CVPixelBufferRef *)v35 + 6));
          *((_QWORD *)v35 + 6) = CVPixelBufferRetain(v34);
          if (v43 < 0)
            operator delete(*(void **)buf);
LABEL_73:
          if (!v27)
          {
LABEL_25:
            v13 = 0;
            goto LABEL_5;
          }
LABEL_74:
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            *(_QWORD *)&buf[4] = v12;
            v41 = 1024;
            v42 = v27;
            _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failed binding espresso buffer \"%s\", status: %d", buf, 0x12u);
            if (v8)
              goto LABEL_77;
          }
          else if (v8)
          {
LABEL_77:
            *a3 = 0;
            goto LABEL_4;
          }
          CVPixelBufferRelease(*a3);
          goto LABEL_77;
        }
        if (!v8)
        {
          if (ADDebugUtilsADVerboseLogsEnabled && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            *(_QWORD *)&buf[4] = v12;
            _os_log_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "binding \"%s\" buffer to espresso-managed pointer", buf, 0xCu);
          }
          CVPixelBufferRelease(*a3);
          v27 = espresso_network_bind_buffer();
          if (!v27)
            *a3 = PixelBufferUtils::asPixelBuffer(v17, v18, v10, *(void **)buf, v31);
          goto LABEL_73;
        }
        if (ADDebugUtilsADVerboseLogsEnabled)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            *(_QWORD *)&buf[4] = v12;
            v28 = MEMORY[0x24BDACB70];
            v29 = OS_LOG_TYPE_DEFAULT;
LABEL_58:
            _os_log_impl(&dword_236382000, v28, v29, "Warning: binding \"%s\" buffer to espresso-managed pointer with copying buffer. note: this is highly inefficient", buf, 0xCu);
          }
        }
        else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)&buf[4] = v12;
          v28 = MEMORY[0x24BDACB70];
          v29 = OS_LOG_TYPE_INFO;
          goto LABEL_58;
        }
        v32 = objc_msgSend(v6, "isInput");
        v33 = *a3;
        if (v32)
        {
          std::string::basic_string[abi:ne180100]<0>(buf, v12);
          v39 = (__int128 *)buf;
          v20 = std::__hash_table<std::__hash_value_type<std::string,PixelBufferSharedPtr>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PixelBufferSharedPtr>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PixelBufferSharedPtr>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PixelBufferSharedPtr>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&v7->_pixelBuffersToBindAsEspressoBufferInput, buf, &v39);
        }
        else
        {
          std::string::basic_string[abi:ne180100]<0>(buf, v12);
          v39 = (__int128 *)buf;
          v20 = std::__hash_table<std::__hash_value_type<std::string,PixelBufferSharedPtr>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PixelBufferSharedPtr>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PixelBufferSharedPtr>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PixelBufferSharedPtr>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&v7->_pixelBuffersToBindAsEspressoBufferOutput, buf, &v39);
        }
        CVPixelBufferRelease(*((CVPixelBufferRef *)v20 + 6));
        v21 = CVPixelBufferRetain(v33);
LABEL_23:
        *((_QWORD *)v20 + 6) = v21;
        if (v43 < 0)
          operator delete(*(void **)buf);
        goto LABEL_25;
      }
    }
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_4;
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = v12;
    v25 = MEMORY[0x24BDACB70];
    v26 = "failed allocating CVPixelBuffer for \"%s\";
    goto LABEL_41;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "cannot register buffer for nil descriptor", buf, 2u);
  }
  v14 = -22953;
  v13 = 1;
LABEL_9:
  objc_sync_exit(v7);

  if (v13)
    v15 = v14;
  else
    v15 = 0;
  InstrumentsTraceGuard::~InstrumentsTraceGuard((InstrumentsTraceGuard *)&v36);

  return v15;
}

- (int64_t)registerPixelBuffer:(__CVBuffer *)a3 forDescriptor:(id)a4
{
  __CVBuffer *v5;

  v5 = a3;
  return -[ADEspressoRunnerV1 registerPixelBufferPtr:forDescriptor:](self, "registerPixelBufferPtr:forDescriptor:", &v5, a4);
}

- (int64_t)updateFeedbackLoopInputBuffer:(__CVBuffer *)a3 inputDescriptor:(id)a4 outputBuffer:(__CVBuffer *)a5 outputDescriptor:(id)a6
{
  id v10;
  id v11;
  size_t Width;
  size_t v13;
  OSType PixelFormatType;
  _BOOL4 v15;
  __CVBuffer *v16;
  __CVBuffer *v17;
  int64_t v18;
  id v19;
  PixelBufferUtils *v21;
  _BYTE *v22;
  PixelBufferUtils *v23;
  void **v24;
  size_t v25;
  size_t Height;
  size_t v27;
  size_t v28;
  id v29;
  id v30;
  uint64_t v31;
  id v32;
  void *__p[2];
  char v34;
  uint8_t v35[4];
  _BYTE *v36;
  __int16 v37;
  void **v38;
  _BYTE buf[12];
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  size_t v43;
  __int16 v44;
  size_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a6;
  Width = CVPixelBufferGetWidth(*a3);
  if (Width != CVPixelBufferGetWidth(*a5) || (v13 = CVPixelBufferGetHeight(*a3), v13 != CVPixelBufferGetHeight(*a5)))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      v25 = CVPixelBufferGetWidth(*a3);
      Height = CVPixelBufferGetHeight(*a3);
      v27 = CVPixelBufferGetWidth(*a5);
      v28 = CVPixelBufferGetHeight(*a5);
      *(_DWORD *)buf = 134218752;
      *(_QWORD *)&buf[4] = v25;
      v40 = 2048;
      v41 = Height;
      v42 = 2048;
      v43 = v27;
      v44 = 2048;
      v45 = v28;
      _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Input and output pixel buffers have different dimensions (%zux%zu) vs (%zux%zu)", buf, 0x2Au);
    }
    goto LABEL_10;
  }
  PixelFormatType = CVPixelBufferGetPixelFormatType(*a3);
  if (PixelFormatType != CVPixelBufferGetPixelFormatType(*a5))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      v21 = (PixelBufferUtils *)CVPixelBufferGetPixelFormatType(*a3);
      v22 = buf;
      PixelBufferUtils::pixelFormatAsString(v21, buf);
      if (v42 < 0)
        v22 = *(_BYTE **)buf;
      v23 = (PixelBufferUtils *)CVPixelBufferGetPixelFormatType(*a5);
      PixelBufferUtils::pixelFormatAsString(v23, (char *)__p);
      if (v34 >= 0)
        v24 = __p;
      else
        v24 = (void **)__p[0];
      *(_DWORD *)v35 = 136315394;
      v36 = v22;
      v37 = 2080;
      v38 = v24;
      _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Input and output pixel buffers have different formats (%s) vs (%s)", v35, 0x16u);
      if (v34 < 0)
        operator delete(__p[0]);
      if (SHIBYTE(v42) < 0)
        operator delete(*(void **)buf);
    }
LABEL_10:
    v18 = -22953;
    goto LABEL_11;
  }
  v15 = -[ADEspressoRunnerV1 isDirectBindingSupportedForFormat:](self, "isDirectBindingSupportedForFormat:", CVPixelBufferGetPixelFormatType(*a3));
  v16 = *a3;
  v17 = *a5;
  if (v15)
  {
    *a3 = v17;
    *a5 = v16;
    v18 = -[ADEspressoRunnerV1 registerPixelBuffer:forDescriptor:](self, "registerPixelBuffer:forDescriptor:", *a3, v10);
    if (v18)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v10, "name");
        v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = objc_msgSend(v19, "UTF8String");
        _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failed to re-register %s", buf, 0xCu);

      }
    }
    else
    {
      v18 = -[ADEspressoRunnerV1 registerPixelBuffer:forDescriptor:](self, "registerPixelBuffer:forDescriptor:", *a5, v11);
      if (v18 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v11, "name");
        v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = objc_msgSend(v29, "UTF8String");
        _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failed to re-register %s", buf, 0xCu);

      }
    }
  }
  else if (PixelBufferUtils::copyPixelBuffer(v16, v17, 0))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v11, "name");
      v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v31 = objc_msgSend(v30, "UTF8String");
      objc_msgSend(v10, "name");
      v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = v31;
      v40 = 2080;
      v41 = objc_msgSend(v32, "UTF8String");
      _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failed copying %s to %s", buf, 0x16u);

    }
    v18 = -22950;
  }
  else
  {
    v18 = 0;
  }
LABEL_11:

  return v18;
}

- (void)unlockAllVImageBindBuffers
{
  CVPixelBufferRef i;

  for (i = (CVPixelBufferRef)self->_pixelBuffersToBindAsVImage.__table_.__p1_.__value_.__next_;
        i;
        i = *(CVPixelBufferRef *)i)
  {
    CVPixelBufferUnlockBaseAddress(*((CVPixelBufferRef *)i + 6), 1uLL);
  }
}

- (int64_t)execute
{
  ADEspressoRunnerV1 *v2;
  __compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<std::string, PixelBufferSharedPtr>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<std::string, PixelBufferSharedPtr>, void *>>> *p_p1;
  NSObject *v4;
  __int128 v5;
  __compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<std::string, PixelBufferSharedPtr>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<std::string, PixelBufferSharedPtr>, void *>>> *v6;
  __compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<std::string, PixelBufferSharedPtr>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<std::string, PixelBufferSharedPtr>, void *>>> *next;
  int v8;
  NSObject *v9;
  const char *v10;
  __compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<std::string, PixelBufferSharedPtr>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<std::string, PixelBufferSharedPtr>, void *>>> *v11;
  NSObject *v12;
  __compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<std::string, PixelBufferSharedPtr>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<std::string, PixelBufferSharedPtr>, void *>>> *v13;
  __compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<std::string, PixelBufferSharedPtr>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<std::string, PixelBufferSharedPtr>, void *>>> *v14;
  int v15;
  __compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<std::string, PixelBufferSharedPtr>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<std::string, PixelBufferSharedPtr>, void *>>> *v16;
  NSObject *v17;
  __CVBuffer *v18;
  __compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<std::string, PixelBufferSharedPtr>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<std::string, PixelBufferSharedPtr>, void *>>> *v19;
  __compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<std::string, PixelBufferSharedPtr>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<std::string, PixelBufferSharedPtr>, void *>>> *v20;
  __compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<std::string, PixelBufferSharedPtr>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<std::string, PixelBufferSharedPtr>, void *>>> *v21;
  int v22;
  uint8_t *v23;
  char *v24;
  _QWORD *v25;
  __CVBuffer *v26;
  int v27;
  size_t Width;
  size_t Height;
  PixelBufferUtils *PixelFormatType;
  void *v31;
  PixelBufferUtils *v32;
  int v33;
  char *v34;
  __compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<std::string, PixelBufferSharedPtr>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<std::string, PixelBufferSharedPtr>, void *>>> *v35;
  _QWORD *v36;
  int v37;
  char *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  int v47;
  __compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<std::string, PixelBufferSharedPtr>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<std::string, PixelBufferSharedPtr>, void *>>> *v48;
  __CVBuffer *v49;
  void *v50;
  size_t v51;
  size_t v52;
  PixelBufferUtils *v53;
  void *v54;
  __CVBuffer *v55;
  NSObject *v56;
  const char *v57;
  uint8_t *v58;
  int64_t v59;
  __int128 v61;
  int v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[12];
  __int16 v66;
  int v67;
  _OWORD v68[2];
  int v69;
  _OWORD buf[10];
  uint64_t v71;
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  v62 = 335678456;
  v63 = 0u;
  v64 = 0u;
  kdebug_trace();
  kdebug_trace();
  p_p1 = &v2->_pixelBuffersToBindDirect.__table_.__p1_;
  v4 = MEMORY[0x24BDACB70];
  *(_QWORD *)&v5 = 136315138;
  v61 = v5;
  while (1)
  {
    p_p1 = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<std::string, PixelBufferSharedPtr>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<std::string, PixelBufferSharedPtr>, void *>>> *)p_p1->__value_.__next_;
    if (!p_p1)
      break;
    v6 = p_p1 + 2;
    if (ADDebugUtilsADVerboseLogsEnabled && os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      next = p_p1 + 2;
      if (SHIBYTE(p_p1[4].__value_.__next_) < 0)
        next = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<std::string, PixelBufferSharedPtr>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<std::string, PixelBufferSharedPtr>, void *>>> *)v6->__value_.__next_;
      LODWORD(buf[0]) = v61;
      *(_QWORD *)((char *)buf + 4) = next;
      _os_log_impl(&dword_236382000, v4, OS_LOG_TYPE_DEFAULT, "binding \"%s\" as pixel buffer directly", (uint8_t *)buf, 0xCu);
    }
    v8 = espresso_network_bind_direct_cvpixelbuffer();
    if (v8)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        if (SHIBYTE(p_p1[4].__value_.__next_) < 0)
          v6 = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<std::string, PixelBufferSharedPtr>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<std::string, PixelBufferSharedPtr>, void *>>> *)v6->__value_.__next_;
        LODWORD(buf[0]) = 136315394;
        *(_QWORD *)((char *)buf + 4) = v6;
        WORD6(buf[0]) = 1024;
        *(_DWORD *)((char *)buf + 14) = v8;
        v9 = MEMORY[0x24BDACB70];
        v10 = "Failed binding \"%s\" as pixel buffer directly (status:%d)";
        goto LABEL_39;
      }
      goto LABEL_60;
    }
  }
  v11 = &v2->_pixelBuffersToBindIndirect.__table_.__p1_;
  v12 = MEMORY[0x24BDACB70];
  while (1)
  {
    v11 = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<std::string, PixelBufferSharedPtr>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<std::string, PixelBufferSharedPtr>, void *>>> *)v11->__value_.__next_;
    if (!v11)
      break;
    v13 = v11 + 2;
    if (ADDebugUtilsADVerboseLogsEnabled && os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v14 = v11 + 2;
      if (SHIBYTE(v11[4].__value_.__next_) < 0)
        v14 = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<std::string, PixelBufferSharedPtr>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<std::string, PixelBufferSharedPtr>, void *>>> *)v13->__value_.__next_;
      LODWORD(buf[0]) = v61;
      *(_QWORD *)((char *)buf + 4) = v14;
      _os_log_impl(&dword_236382000, v12, OS_LOG_TYPE_DEFAULT, "binding \"%s\" as pixel buffer", (uint8_t *)buf, 0xCu);
    }
    v15 = espresso_network_bind_cvpixelbuffer();
    if (v15)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        if (SHIBYTE(v11[4].__value_.__next_) < 0)
          v13 = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<std::string, PixelBufferSharedPtr>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<std::string, PixelBufferSharedPtr>, void *>>> *)v13->__value_.__next_;
        LODWORD(buf[0]) = 136315394;
        *(_QWORD *)((char *)buf + 4) = v13;
        WORD6(buf[0]) = 1024;
        *(_DWORD *)((char *)buf + 14) = v15;
        v9 = MEMORY[0x24BDACB70];
        v10 = "Failed binding \"%s\" as pixel buffer (status:%d)";
        goto LABEL_39;
      }
      goto LABEL_60;
    }
  }
  v16 = &v2->_pixelBuffersToBindAsVImage.__table_.__p1_;
  v17 = MEMORY[0x24BDACB70];
  do
  {
    v16 = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<std::string, PixelBufferSharedPtr>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<std::string, PixelBufferSharedPtr>, void *>>> *)v16->__value_.__next_;
    if (!v16)
    {
      v24 = (char *)v2->_pixelBuffersToBindAsEspressoBufferInput.__table_.__p1_.__value_.__next_;
      if (v24)
      {
        while (1)
        {
          v25 = v24 + 16;
          v26 = (__CVBuffer *)*((_QWORD *)v24 + 6);
          v27 = espresso_network_bind_buffer();
          if (v27)
          {
            -[ADEspressoRunnerV1 unlockAllVImageBindBuffers](v2, "unlockAllVImageBindBuffers");
            if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              goto LABEL_60;
            if (v24[39] < 0)
              v25 = (_QWORD *)*v25;
            LODWORD(v68[0]) = 136315394;
            *(_QWORD *)((char *)v68 + 4) = v25;
            WORD6(v68[0]) = 1024;
            *(_DWORD *)((char *)v68 + 14) = v27;
            v9 = MEMORY[0x24BDACB70];
            v10 = "Failed binding \"%s\" as espressoBuffer (status:%d)";
            goto LABEL_71;
          }
          Width = CVPixelBufferGetWidth(v26);
          Height = CVPixelBufferGetHeight(v26);
          PixelFormatType = (PixelBufferUtils *)CVPixelBufferGetPixelFormatType(v26);
          v32 = PixelBufferUtils::asPixelBuffer(Width, Height, PixelFormatType, *(void **)&buf[0], v31);
          v33 = PixelBufferUtils::copyPixelBuffer(v32, v26, 0);
          CVPixelBufferRelease(v32);
          if (v33)
            break;
          v24 = *(char **)v24;
          if (!v24)
            goto LABEL_45;
        }
        -[ADEspressoRunnerV1 unlockAllVImageBindBuffers](v2, "unlockAllVImageBindBuffers");
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          goto LABEL_60;
        if (v24[39] < 0)
          v25 = (_QWORD *)*v25;
        LODWORD(v68[0]) = 136315394;
        *(_QWORD *)((char *)v68 + 4) = v25;
        WORD6(v68[0]) = 1024;
        *(_DWORD *)((char *)v68 + 14) = -1;
        v9 = MEMORY[0x24BDACB70];
        v10 = "Failed copying \"%s\" to espressoBuffer (status:%d)";
LABEL_71:
        v23 = (uint8_t *)v68;
        goto LABEL_40;
      }
LABEL_45:
      memset(v68, 0, sizeof(v68));
      v69 = 1065353216;
      v35 = &v2->_pixelBuffersToBindAsEspressoBufferOutput.__table_.__p1_;
      v34 = (char *)v2->_pixelBuffersToBindAsEspressoBufferOutput.__table_.__p1_.__value_.__next_;
      if (v34)
      {
        while (1)
        {
          v36 = v34 + 16;
          v37 = espresso_network_bind_buffer();
          if (v37)
            break;
          *(_QWORD *)v65 = v34 + 16;
          v38 = std::__hash_table<std::__hash_value_type<std::string,espresso_buffer_t>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,espresso_buffer_t>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t *)v68, (unsigned __int8 *)v34 + 16, (__int128 **)v65);
          v40 = buf[5];
          v39 = buf[6];
          v41 = buf[4];
          *(_OWORD *)(v38 + 88) = buf[3];
          v42 = v71;
          v44 = buf[8];
          v43 = buf[9];
          *(_OWORD *)(v38 + 152) = buf[7];
          *(_OWORD *)(v38 + 168) = v44;
          *(_OWORD *)(v38 + 184) = v43;
          *((_QWORD *)v38 + 25) = v42;
          *(_OWORD *)(v38 + 104) = v41;
          *(_OWORD *)(v38 + 120) = v40;
          *(_OWORD *)(v38 + 136) = v39;
          v46 = buf[1];
          v45 = buf[2];
          *(_OWORD *)(v38 + 40) = buf[0];
          *(_OWORD *)(v38 + 56) = v46;
          *(_OWORD *)(v38 + 72) = v45;
          v34 = *(char **)v34;
          if (!v34)
            goto LABEL_48;
        }
        -[ADEspressoRunnerV1 unlockAllVImageBindBuffers](v2, "unlockAllVImageBindBuffers");
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          goto LABEL_66;
        if (v34[39] < 0)
          v36 = (_QWORD *)*v36;
        *(_DWORD *)v65 = 136315394;
        *(_QWORD *)&v65[4] = v36;
        v66 = 1024;
        v67 = v37;
        v56 = MEMORY[0x24BDACB70];
        v57 = "Failed binding \"%s\" as espressoBuffer (status:%d)";
        v58 = v65;
      }
      else
      {
LABEL_48:
        kdebug_trace();
        kdebug_trace();
        v47 = espresso_plan_execute_sync();
        kdebug_trace();
        kdebug_trace();
        do
        {
          v35 = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<std::string, PixelBufferSharedPtr>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<std::string, PixelBufferSharedPtr>, void *>>> *)v35->__value_.__next_;
          if (!v35)
          {
            kdebug_trace();
            -[ADEspressoRunnerV1 unlockAllVImageBindBuffers](v2, "unlockAllVImageBindBuffers");
            if (v47)
              v59 = -22968;
            else
              v59 = 0;
            goto LABEL_67;
          }
          v48 = v35 + 2;
          v49 = (__CVBuffer *)v35[6].__value_.__next_;
          *(_QWORD *)&buf[0] = v35 + 2;
          v50 = (void *)*((_QWORD *)std::__hash_table<std::__hash_value_type<std::string,espresso_buffer_t>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,espresso_buffer_t>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t *)v68, (unsigned __int8 *)&v35[2], (__int128 **)buf)+ 5);
          v51 = CVPixelBufferGetWidth(v49);
          v52 = CVPixelBufferGetHeight(v49);
          v53 = (PixelBufferUtils *)CVPixelBufferGetPixelFormatType(v49);
          v55 = PixelBufferUtils::asPixelBuffer(v51, v52, v53, v50, v54);
          LODWORD(v49) = PixelBufferUtils::copyPixelBuffer(v49, v55, 0);
          CVPixelBufferRelease(v55);
        }
        while (!(_DWORD)v49);
        -[ADEspressoRunnerV1 unlockAllVImageBindBuffers](v2, "unlockAllVImageBindBuffers");
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          goto LABEL_66;
        if (SHIBYTE(v35[4].__value_.__next_) < 0)
          v48 = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<std::string, PixelBufferSharedPtr>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<std::string, PixelBufferSharedPtr>, void *>>> *)v48->__value_.__next_;
        LODWORD(buf[0]) = 136315394;
        *(_QWORD *)((char *)buf + 4) = v48;
        WORD6(buf[0]) = 1024;
        *(_DWORD *)((char *)buf + 14) = -1;
        v56 = MEMORY[0x24BDACB70];
        v57 = "Failed copying \"%s\" from espressoBuffer (status:%d)";
        v58 = (uint8_t *)buf;
      }
      _os_log_error_impl(&dword_236382000, v56, OS_LOG_TYPE_ERROR, v57, v58, 0x12u);
LABEL_66:
      v59 = -22971;
LABEL_67:
      std::__hash_table<std::__hash_value_type<std::string,espresso_buffer_t>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,espresso_buffer_t>>>::~__hash_table((uint64_t)v68);
      goto LABEL_61;
    }
    v18 = (__CVBuffer *)v16[6].__value_.__next_;
    CVPixelBufferLockBaseAddress(v18, 1uLL);
    v19 = v16 + 2;
    if (ADDebugUtilsADVerboseLogsEnabled && os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v20 = v16 + 2;
      if (SHIBYTE(v16[4].__value_.__next_) < 0)
        v20 = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<std::string, PixelBufferSharedPtr>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<std::string, PixelBufferSharedPtr>, void *>>> *)v19->__value_.__next_;
      LODWORD(buf[0]) = v61;
      *(_QWORD *)((char *)buf + 4) = v20;
      _os_log_impl(&dword_236382000, v17, OS_LOG_TYPE_DEFAULT, "binding \"%s\" as vImage", (uint8_t *)buf, 0xCu);
    }
    v21 = v16 + 2;
    if (SHIBYTE(v16[4].__value_.__next_) < 0)
      v21 = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<std::string, PixelBufferSharedPtr>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<std::string, PixelBufferSharedPtr>, void *>>> *)v19->__value_.__next_;
    v22 = -[ADEspressoRunnerV1 bindPixelBufferAsVImage:toBlob:](v2, "bindPixelBufferAsVImage:toBlob:", v18, v21, v61);
  }
  while (!v22);
  -[ADEspressoRunnerV1 unlockAllVImageBindBuffers](v2, "unlockAllVImageBindBuffers");
  if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    goto LABEL_60;
  if (SHIBYTE(v16[4].__value_.__next_) < 0)
    v19 = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<std::string, PixelBufferSharedPtr>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<std::string, PixelBufferSharedPtr>, void *>>> *)v19->__value_.__next_;
  LODWORD(buf[0]) = 136315394;
  *(_QWORD *)((char *)buf + 4) = v19;
  WORD6(buf[0]) = 1024;
  *(_DWORD *)((char *)buf + 14) = v22;
  v9 = MEMORY[0x24BDACB70];
  v10 = "Failed binding \"%s\" as vImage (status:%d)";
LABEL_39:
  v23 = (uint8_t *)buf;
LABEL_40:
  _os_log_error_impl(&dword_236382000, v9, OS_LOG_TYPE_ERROR, v10, v23, 0x12u);
LABEL_60:
  v59 = -22971;
LABEL_61:
  InstrumentsTraceGuard::~InstrumentsTraceGuard((InstrumentsTraceGuard *)&v62);
  objc_sync_exit(v2);

  return v59;
}

- (void)dealloc
{
  objc_super v3;

  espresso_plan_destroy();
  espresso_context_destroy();
  v3.receiver = self;
  v3.super_class = (Class)ADEspressoRunnerV1;
  -[ADEspressoRunnerV1 dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  std::__hash_table<std::__hash_value_type<std::string,PixelBufferSharedPtr>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PixelBufferSharedPtr>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PixelBufferSharedPtr>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PixelBufferSharedPtr>>>::~__hash_table((uint64_t)&self->_pixelBuffersToBindAsEspressoBufferOutput);
  std::__hash_table<std::__hash_value_type<std::string,PixelBufferSharedPtr>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PixelBufferSharedPtr>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PixelBufferSharedPtr>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PixelBufferSharedPtr>>>::~__hash_table((uint64_t)&self->_pixelBuffersToBindAsEspressoBufferInput);
  std::__hash_table<std::__hash_value_type<std::string,PixelBufferSharedPtr>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PixelBufferSharedPtr>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PixelBufferSharedPtr>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PixelBufferSharedPtr>>>::~__hash_table((uint64_t)&self->_pixelBuffersToBindIndirect);
  std::__hash_table<std::__hash_value_type<std::string,PixelBufferSharedPtr>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PixelBufferSharedPtr>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PixelBufferSharedPtr>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PixelBufferSharedPtr>>>::~__hash_table((uint64_t)&self->_pixelBuffersToBindDirect);
  std::__hash_table<std::__hash_value_type<std::string,PixelBufferSharedPtr>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PixelBufferSharedPtr>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PixelBufferSharedPtr>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PixelBufferSharedPtr>>>::~__hash_table((uint64_t)&self->_pixelBuffersToBindAsVImage);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_DWORD *)self + 20) = 1065353216;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  *((_DWORD *)self + 30) = 1065353216;
  *((_OWORD *)self + 8) = 0u;
  *((_OWORD *)self + 9) = 0u;
  *((_DWORD *)self + 40) = 1065353216;
  *(_OWORD *)((char *)self + 168) = 0u;
  *(_OWORD *)((char *)self + 184) = 0u;
  *((_DWORD *)self + 50) = 1065353216;
  *((_OWORD *)self + 13) = 0u;
  *((_OWORD *)self + 14) = 0u;
  *((_DWORD *)self + 60) = 1065353216;
  return self;
}

@end
