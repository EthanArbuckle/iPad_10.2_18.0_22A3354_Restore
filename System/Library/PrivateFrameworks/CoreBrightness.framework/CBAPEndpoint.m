@implementation CBAPEndpoint

- (CBAPEndpoint)initWithServiceName:(id)a3 role:(id)a4
{
  unsigned int v4;
  os_log_t v5;
  id v6;
  uint64_t v7;
  dispatch_queue_t v8;
  uint64_t inited;
  NSObject *logHandle;
  objc_super v12;
  id v13;
  id v14;
  SEL v15;
  CBAPEndpoint *v16;
  uint8_t v18[24];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v16 = self;
  v15 = a2;
  v14 = a3;
  v13 = a4;
  if ((objc_msgSend(a3, "isEqualToString:", &stru_1E68EDC78) & 1) == 0)
  {
    v12.receiver = v16;
    v12.super_class = (Class)CBAPEndpoint;
    v16 = -[CBAPEndpoint init](&v12, sel_init);
    if (v16)
    {
      v4 = -[CBAPEndpoint findDCPServiceWithName:role:](v16, "findDCPServiceWithName:role:", v14, v13);
      v16->_service = v4;
      if (v16->_service)
      {
        IOObjectRetain(v16->_service);
        v5 = os_log_create("com.apple.CoreBrightness.CBAPEndpoint", "BuiltIn");
        v16->_logHandle = (OS_os_log *)v5;
        v6 = objc_alloc(MEMORY[0x1E0CF1320]);
        v7 = objc_msgSend(v6, "initWithService:", v16->_service);
        v16->_endpoint = (AFKEndpointInterface *)v7;
        v8 = dispatch_queue_create("CBAFKEndpointQueue", 0);
        v16->_epQueue = (OS_dispatch_queue *)v8;
        if (v16->_endpoint && v16->_epQueue)
        {
          -[AFKEndpointInterface setDispatchQueue:](v16->_endpoint, "setDispatchQueue:", v16->_epQueue);
          -[AFKEndpointInterface activate:](v16->_endpoint, "activate:", 0);
          return v16;
        }
        if (v16->_logHandle)
        {
          logHandle = v16->_logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            inited = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            inited = init_default_corebrightness_log();
          logHandle = inited;
        }
        if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_1_8_32((uint64_t)v18, objc_msgSend(v14, "UTF8String"));
          _os_log_error_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_ERROR, "ERROR initializing CBAPEndpoint for service: %s", v18, 0xCu);
        }
      }
    }

    v16 = 0;
    return 0;
  }
  return 0;
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  CBAPEndpoint *v4;

  v4 = self;
  v3 = a2;
  -[AFKEndpointInterface cancel](self->_endpoint, "cancel");
  if (v4->_epQueue)
  {
    dispatch_release((dispatch_object_t)v4->_epQueue);
    v4->_epQueue = 0;
  }
  if (v4->_logHandle)
  {

    v4->_logHandle = 0;
  }
  if (v4->_service)
  {
    IOObjectRelease(v4->_service);
    v4->_service = 0;
  }
  v2.receiver = v4;
  v2.super_class = (Class)CBAPEndpoint;
  -[CBAPEndpoint dealloc](&v2, sel_dealloc);
}

- (BOOL)setProperty:(id)a3 property:(id)a4
{
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t inited;
  NSObject *logHandle;
  char v14;
  _DWORD *v15;
  uint64_t v16;
  CFDataRef v17;
  unint64_t v18;
  char v22;
  uint8_t v23[32];
  uint8_t v24[32];
  uint8_t v25[32];
  _BYTE v26[64];
  uint8_t v27[56];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (self->_logHandle)
  {
    logHandle = self->_logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    logHandle = inited;
  }
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
    __os_log_helper_16_2_4_8_32_8_32_8_32_8_64((uint64_t)v27, v11, (uint64_t)"-[CBAPEndpoint setProperty:property:]", objc_msgSend(a3, "UTF8String"), (uint64_t)a4);
    _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "%s:%s called for key: %s, property: %@", v27, 0x2Au);
  }
  if (a3 && a4)
  {
    v18 = objc_msgSend(a3, "lengthOfBytesUsingEncoding:", 4);
    if (v18 >= 0x40)
    {
      objc_msgSend(a3, "UTF8String");
      __strlcpy_chk();
      if (self->_logHandle)
      {
        v10 = self->_logHandle;
      }
      else
      {
        v9 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
        v10 = v9;
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_2_2_8_32_8_32((uint64_t)v25, objc_msgSend(a3, "UTF8String"), (uint64_t)v26);
        _os_log_debug_impl(&dword_1B5291000, v10, OS_LOG_TYPE_DEBUG, "WARNING: Property name is too long it will be truncated, %s -> %s\n", v25, 0x16u);
      }
    }
    v17 = IOCFSerialize(a4, 1uLL);
    if (v17)
    {
      if (-[__CFData length](v17, "length") < 486 - v18)
      {
        v16 = v18 + 1 + -[__CFData length](v17, "length");
        v15 = malloc_type_malloc(v16 + 4, 0xF061EED5uLL);
        *v15 = v18 + 1;
        objc_msgSend(a3, "UTF8String");
        __strlcpy_chk();
        -[__CFData bytes](v17, "bytes");
        -[__CFData length](v17, "length");
        __memcpy_chk();
        v14 = -[CBAPEndpoint enqueueCommandSync:inputBuffer:inputBufferSize:responseObj:options:](self, "enqueueCommandSync:inputBuffer:inputBufferSize:responseObj:options:", 67, v15, v16 + 4, 0, 0);
        if (v15)
          free(v15);

        v22 = v14 & 1;
      }
      else
      {
        if (self->_logHandle)
        {
          v6 = self->_logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            v5 = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            v5 = init_default_corebrightness_log();
          v6 = v5;
        }
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_3_8_32_8_0_8_0((uint64_t)v23, objc_msgSend(a3, "UTF8String"), 486 - v18, -[__CFData length](v17, "length"));
          _os_log_error_impl(&dword_1B5291000, v6, OS_LOG_TYPE_ERROR, "Data for setting property %s is too long, max payload %lu, needed size %lu\n", v23, 0x20u);
        }

        v22 = 0;
      }
    }
    else
    {
      if (self->_logHandle)
      {
        v8 = self->_logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v7 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v7 = init_default_corebrightness_log();
        v8 = v7;
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_2_8_32_8_64((uint64_t)v24, objc_msgSend(a3, "UTF8String"), (uint64_t)a4);
        _os_log_error_impl(&dword_1B5291000, v8, OS_LOG_TYPE_ERROR, "Could not encode value for setting property %s, value: %@\n", v24, 0x16u);
      }
      v22 = 0;
    }
  }
  else
  {
    v22 = 0;
  }
  return v22 & 1;
}

- (id)copyProperty:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t inited;
  NSObject *logHandle;
  void *v9;
  int v10;
  os_log_type_t v11;
  os_log_t v12;
  os_log_type_t type;
  os_log_t oslog;
  id v15;
  SEL v16;
  CBAPEndpoint *v17;
  _BYTE __b[64];
  uint8_t v20[16];
  uint8_t v21[40];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = self;
  v16 = a2;
  v15 = a3;
  oslog = 0;
  if (self->_logHandle)
  {
    logHandle = v17->_logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    logHandle = inited;
  }
  oslog = logHandle;
  type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
    __os_log_helper_16_2_3_8_32_8_32_8_32((uint64_t)v21, v6, (uint64_t)"-[CBAPEndpoint copyProperty:]", objc_msgSend(v15, "UTF8String"));
    _os_log_impl(&dword_1B5291000, oslog, type, "%s:%s called for key: %s", v21, 0x20u);
  }
  if ((unint64_t)objc_msgSend(v15, "lengthOfBytesUsingEncoding:", 4) < 0x40)
  {
    memset(__b, 0, sizeof(__b));
    objc_msgSend(v15, "UTF8String");
    __strlcpy_chk();
    v10 = 66;
    v9 = 0;
    if (-[CBAPEndpoint enqueueCommandSync:inputBuffer:inputBufferSize:responseObj:options:](v17, "enqueueCommandSync:inputBuffer:inputBufferSize:responseObj:options:", 66, __b, 64, &v9, 0))
    {
      return v9;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    v12 = 0;
    if (v17->_logHandle)
    {
      v5 = v17->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v4 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v4 = init_default_corebrightness_log();
      v5 = v4;
    }
    v12 = v5;
    v11 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v20, objc_msgSend(v15, "UTF8String"));
      _os_log_error_impl(&dword_1B5291000, v12, v11, "Property name is too long, %s\n", v20, 0xCu);
    }
    return 0;
  }
}

- (BOOL)sendCommand:(int)a3 inputBuffer:(const void *)a4 inputBufferSize:(unint64_t)a5
{
  uint64_t inited;
  NSObject *logHandle;
  char v12;
  uint8_t v13[8];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a4 && a5)
  {
    if (self->_logHandle)
    {
      logHandle = self->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      logHandle = inited;
    }
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_0_1_4_0((uint64_t)v13, a3);
      _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "Send command = 0x%x", v13, 8u);
    }
    v12 = -[CBAPEndpoint enqueueCommandSync:inputBuffer:inputBufferSize:responseObj:options:](self, "enqueueCommandSync:inputBuffer:inputBufferSize:responseObj:options:", a3, a4, a5, 0, 0);
  }
  else
  {
    v12 = 0;
  }
  return v12 & 1;
}

- (BOOL)sendOOBCommand:(int)a3 inputBuffer:(const void *)a4 inputBufferSize:(unint64_t)a5
{
  uint64_t inited;
  NSObject *logHandle;
  char v12;
  uint8_t v13[8];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a4 && a5)
  {
    if (self->_logHandle)
    {
      logHandle = self->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      logHandle = inited;
    }
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_0_1_4_0((uint64_t)v13, a3);
      _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "Send OOB command = 0x%x", v13, 8u);
    }
    v12 = -[CBAPEndpoint enqueueCommandSync:inputBuffer:inputBufferSize:responseObj:options:](self, "enqueueCommandSync:inputBuffer:inputBufferSize:responseObj:options:", a3, a4, a5, 0);
  }
  else
  {
    v12 = 0;
  }
  return v12 & 1;
}

- (BOOL)enqueueCommandSync:(int)a3 inputBuffer:(const void *)a4 inputBufferSize:(unint64_t)a5 responseObj:(id *)a6 options:(unsigned int)a7
{
  const char *v7;
  CFTypeRef v8;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t inited;
  NSObject *logHandle;
  uint64_t v21;
  os_log_type_t v22;
  os_log_t v23;
  char v24;
  int v25;
  uint64_t v26;
  id v27;
  size_t v28;
  os_signpost_id_t v29;
  os_signpost_type_t v30;
  os_log_t v31;
  unsigned int v32;
  uint64_t *v33;
  unint64_t v34;
  const void *v35;
  unsigned int v36;
  SEL v37;
  CBAPEndpoint *v38;
  uint8_t v39[16];
  uint8_t v40[16];
  uint8_t v41[16];
  uint8_t v42[16];
  uint8_t v43[8];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v38 = self;
  v37 = a2;
  v36 = a3;
  v35 = a4;
  v34 = a5;
  v33 = (uint64_t *)a6;
  v32 = a7;
  v31 = 0;
  if (self->_logHandle)
  {
    logHandle = v38->_logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    logHandle = inited;
  }
  v31 = logHandle;
  v30 = OS_SIGNPOST_INTERVAL_BEGIN;
  v29 = 0xEEEEB0B5B2B2EEEELL;
  if (os_signpost_enabled(logHandle))
  {
    __os_log_helper_16_0_1_4_0((uint64_t)v43, v36);
    _os_signpost_emit_with_name_impl(&dword_1B5291000, v31, v30, v29, "enqueueCommandSync", "0x%x", v43, 8u);
  }
  v28 = 486;
  v27 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 486);
  v26 = 0;
  v25 = 0;
  v24 = 0;
  if (v33)
    *v33 = 0;
  LODWORD(v10) = v32;
  v25 = -[AFKEndpointInterface enqueueCommandSync:timestamp:inputBuffer:inputBufferSize:responseTimestamp:outputBuffer:inOutBufferSize:options:](v38->_endpoint, "enqueueCommandSync:timestamp:inputBuffer:inputBufferSize:responseTimestamp:outputBuffer:inOutBufferSize:options:", v36, mach_continuous_time(), v35, v34, &v26, objc_msgSend(v27, "mutableBytes"), &v28, v10);
  if (v25)
  {
    v23 = 0;
    if (v38->_logHandle)
    {
      v18 = v38->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v17 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v17 = init_default_corebrightness_log();
      v18 = v17;
    }
    v23 = v18;
    v22 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_0_1_4_0((uint64_t)v42, v25);
      _os_log_error_impl(&dword_1B5291000, v23, v22, "ERROR! enqueueCommandSync failed result:0x%x", v42, 8u);
    }
    v24 = 0;
  }
  else if (objc_msgSend(v27, "mutableBytes") && v33)
  {
    v21 = 0;
    v7 = (const char *)objc_msgSend(v27, "mutableBytes");
    v8 = IOCFUnserializeBinary(v7, v28, (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, (CFStringRef *)&v21);
    *v33 = (uint64_t)v8;
    if (v21)
    {
      if (v38->_logHandle)
      {
        v16 = v38->_logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v15 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v15 = init_default_corebrightness_log();
        v16 = v15;
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v41, v21);
        _os_log_error_impl(&dword_1B5291000, v16, OS_LOG_TYPE_ERROR, "ERROR: unable to serialize outputBuffer: %@", v41, 0xCu);
      }
      v24 = 0;
    }
    else
    {
      if (v38->_logHandle)
      {
        v14 = v38->_logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v13 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v13 = init_default_corebrightness_log();
        v14 = v13;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v40, *v33);
        _os_log_debug_impl(&dword_1B5291000, v14, OS_LOG_TYPE_DEBUG, "Response received from DCP: %@", v40, 0xCu);
      }
      v24 = 1;
    }
  }
  else
  {
    v24 = 1;
  }

  if (v38->_logHandle)
  {
    v12 = v38->_logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      v11 = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      v11 = init_default_corebrightness_log();
    v12 = v11;
  }
  if (os_signpost_enabled(v12))
  {
    __os_log_helper_16_0_2_4_0_4_0((uint64_t)v39, v36, v24 & 1);
    _os_signpost_emit_with_name_impl(&dword_1B5291000, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "enqueueCommandSync", "0x%x, status: %d", v39, 0xEu);
  }
  return v24 & 1;
}

- (unsigned)findDCPServiceWithName:(id)a3 role:(id)a4
{
  uint64_t inited;
  NSObject *logHandle;
  io_iterator_t existing;
  CFDictionaryRef matching;
  io_object_t v9;
  id v10;
  id v11;
  SEL v12;
  CBAPEndpoint *v13;
  uint8_t v14[24];
  const __CFString *v15;
  id v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v13 = self;
  v12 = a2;
  v11 = a3;
  v10 = a4;
  v9 = 0;
  matching = IOServiceMatching("AFKEndpointInterface");
  v17[0] = CFSTR("IOPropertyMatch");
  v15 = CFSTR("role");
  v16 = v10;
  v18[0] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
  v17[1] = CFSTR("IONameMatch");
  v18[1] = v11;
  -[__CFDictionary addEntriesFromDictionary:](matching, "addEntriesFromDictionary:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2));
  existing = 0;
  if (!IOServiceGetMatchingServices(*MEMORY[0x1E0CBBAA8], matching, &existing))
  {
    if (existing)
    {
      v9 = IOIteratorNext(existing);
      IOObjectRelease(existing);
      if (!v9)
      {
        if (v13->_logHandle)
        {
          logHandle = v13->_logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            inited = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            inited = init_default_corebrightness_log();
          logHandle = inited;
        }
        if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_1_8_32((uint64_t)v14, objc_msgSend(v11, "UTF8String"));
          _os_log_error_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_ERROR, "ERROR: %s sevice not found", v14, 0xCu);
        }
      }
    }
  }
  return v9;
}

@end
