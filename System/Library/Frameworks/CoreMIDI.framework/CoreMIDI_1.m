void sub_1D4F018C8(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, xpc_object_t object)
{
  xpc_release(object);
  __cxa_begin_catch(a1);
  __cxa_end_catch();
  JUMPOUT(0x1D4F01844);
}

void sub_1D4F0192C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, char a17)
{
  if (a16 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t XPCClient::MIDIDestinationCreateInternal(XPCClient *this, unsigned int a2, CFTypeRef cf, MIDIProtocolID a4, unsigned int *a5)
{
  MIDIProcess *v9;
  uint64_t *v10;
  uint64_t v11;
  void **v12;
  const swix::encode_message *v13;
  uint64_t v14;
  uint64_t v15;
  void *exception;
  xpc_object_t value;
  void *__p[2];
  char v20;
  CFTypeRef cfa;
  xpc_object_t object;
  int v23;
  xpc_object_t v24;

  if (!cf)
  {
    cfa = 0;
LABEL_20:
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1D826B7EC](exception, "Could not construct");
  }
  CFRetain(cf);
  applesauce::CF::StringRef::StringRef((applesauce::CF::StringRef *)&cfa, cf);
  if (!cfa)
    goto LABEL_20;
  applesauce::CF::convert_to<std::string,0>((uint64_t)__p, (const __CFString *)cfa);
  v9 = (MIDIProcess *)cfa;
  if (cfa)
    CFRelease(cfa);
  v10 = MIDIProcess::defaultInstance(v9);
  v11 = *(_QWORD *)((*(uint64_t (**)(uint64_t *))(*v10 + 8))(v10) + 432);
  if (v20 >= 0)
    v12 = __p;
  else
    v12 = (void **)__p[0];
  swix::string::string((swix::string *)&value, (const char *)v12);
  swix::encode_message::encode_message((swix::encode_message *)&v23, 220460587);
  xpc_dictionary_set_uint64(v24, "client", a2);
  xpc_dictionary_set_value(v24, "name", value);
  xpc_dictionary_set_int64(v24, "proto", a4);
  v13 = *(const swix::encode_message **)(v11 + 8);
  if (!v13)
    std::terminate();
  swix::connection::send_and_await_reply((swix::connection *)&cfa, v13, &v23);
  v14 = swix::coder<int>::decode(object, ".error");
  if ((_DWORD)v14)
  {
    v15 = 0;
  }
  else
  {
    v14 = swix::coder<unsigned int>::decode(object, "destination");
    v15 = 0x100000000;
  }
  xpc_release(object);
  xpc_release(v24);
  xpc_release(value);
  if ((v15 & 0x100000000) != 0 || !(_DWORD)v14)
  {
    *a5 = v14;
    v14 = 0;
  }
  if (v20 < 0)
    operator delete(__p[0]);
  return v14;
}

void sub_1D4F01B20(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, xpc_object_t object)
{
  xpc_release(object);
  __cxa_begin_catch(a1);
  __cxa_end_catch();
  JUMPOUT(0x1D4F01A9CLL);
}

void sub_1D4F01B84(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, char a17)
{
  if (a16 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t XPCClient::UMPCIObjectCreate(int a1, unsigned __int8 a2, CFPropertyListRef propertyList, _DWORD *a4)
{
  CFDataRef Data;
  const UInt8 *BytePtr;
  size_t Length;
  MIDIProcess *v9;
  uint64_t *v10;
  uint64_t v11;
  const swix::encode_message *v12;
  uint64_t v13;
  uint64_t v14;
  void *exception;
  void *v17;
  xpc_object_t value;
  CFDataRef theData;
  _BYTE v20[8];
  xpc_object_t object;
  int v22;
  xpc_object_t xdict;

  Data = CFPropertyListCreateData(0, propertyList, kCFPropertyListBinaryFormat_v1_0, 0, 0);
  applesauce::CF::DataRef::DataRef((applesauce::CF::DataRef *)&theData, Data);
  if (!theData)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1D826B7EC](exception, "Could not construct");
  }
  BytePtr = CFDataGetBytePtr(theData);
  if (!theData)
  {
    v17 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1D826B7EC](v17, "Could not construct");
  }
  Length = CFDataGetLength(theData);
  v9 = swix::data::data((swix::data *)&value, BytePtr, Length);
  v10 = MIDIProcess::defaultInstance(v9);
  v11 = *(_QWORD *)((*(uint64_t (**)(uint64_t *))(*v10 + 8))(v10) + 432);
  swix::encode_message::encode_message((swix::encode_message *)&v22, 220460625);
  xpc_dictionary_set_int64(xdict, "objectType", a2);
  xpc_dictionary_set_value(xdict, "description", value);
  v12 = *(const swix::encode_message **)(v11 + 8);
  if (!v12)
    std::terminate();
  swix::connection::send_and_await_reply((swix::connection *)v20, v12, &v22);
  v13 = swix::coder<int>::decode(object, ".error");
  if ((_DWORD)v13)
  {
    v14 = 0;
  }
  else
  {
    v13 = swix::coder<unsigned int>::decode(object, "umpcioo");
    v14 = 0x100000000;
  }
  xpc_release(object);
  xpc_release(xdict);
  if ((v14 & 0x100000000) != 0 || !(_DWORD)v13)
  {
    *a4 = v13;
    v13 = 0;
  }
  xpc_release(value);
  if (theData)
    CFRelease(theData);
  return v13;
}

void sub_1D4F01D88(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, xpc_object_t object)
{
  xpc_release(object);
  __cxa_begin_catch(a1);
  __cxa_end_catch();
  JUMPOUT(0x1D4F01CD8);
}

void sub_1D4F01E14(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
  xpc_release(object);
  JUMPOUT(0x1D4F01E20);
}

unint64_t XPCClient::UMPCIObjectDispose(XPCClient *this, unsigned int a2)
{
  uint64_t *v3;
  uint64_t v4;
  const swix::encode_message *v5;
  unsigned int v6;
  unint64_t v7;
  _BYTE v9[8];
  xpc_object_t object;
  int v11;
  xpc_object_t xdict;

  v3 = MIDIProcess::defaultInstance(this);
  v4 = *(_QWORD *)((*(uint64_t (**)(uint64_t *))(*v3 + 8))(v3) + 432);
  swix::encode_message::encode_message((swix::encode_message *)&v11, 220460626);
  xpc_dictionary_set_uint64(xdict, "umpcioo", a2);
  v5 = *(const swix::encode_message **)(v4 + 8);
  if (!v5)
    std::terminate();
  swix::connection::send_and_await_reply((swix::connection *)v9, v5, &v11);
  v6 = swix::coder<int>::decode(object, ".error");
  xpc_release(object);
  v7 = (unint64_t)(v6 == 0) << 32;
  xpc_release(xdict);
  if ((v7 | v6) >= 0x100000000)
    return 0x100000000;
  else
    return v7 | v6;
}

void sub_1D4F01EF8(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, xpc_object_t object)
{
  xpc_release(object);
  __cxa_begin_catch(a1);
  __cxa_end_catch();
  JUMPOUT(0x1D4F01EC0);
}

uint64_t XPCClient::UMPCIObjectGetDescription(XPCClient *this, uint64_t a2, const __CFDictionary **a3)
{
  return (*(uint64_t (**)(XPCClient *, uint64_t, const __CFString *, const __CFDictionary **))(*(_QWORD *)this + 128))(this, a2, CFSTR("object description"), a3);
}

unint64_t XPCClient::UMPCIObjectSetDescription(XPCClient *this, unsigned int a2, CFPropertyListRef propertyList)
{
  CFDataRef Data;
  const UInt8 *BytePtr;
  size_t Length;
  MIDIProcess *v7;
  uint64_t *v8;
  uint64_t v9;
  const swix::encode_message *v10;
  unsigned int v11;
  unint64_t v12;
  void *exception;
  void *v15;
  xpc_object_t value;
  CFDataRef theData;
  _BYTE v18[8];
  xpc_object_t object;
  int v20;
  xpc_object_t v21;

  Data = CFPropertyListCreateData(0, propertyList, kCFPropertyListBinaryFormat_v1_0, 0, 0);
  applesauce::CF::DataRef::DataRef((applesauce::CF::DataRef *)&theData, Data);
  if (!theData)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1D826B7EC](exception, "Could not construct");
  }
  BytePtr = CFDataGetBytePtr(theData);
  if (!theData)
  {
    v15 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1D826B7EC](v15, "Could not construct");
  }
  Length = CFDataGetLength(theData);
  v7 = swix::data::data((swix::data *)&value, BytePtr, Length);
  v8 = MIDIProcess::defaultInstance(v7);
  v9 = *(_QWORD *)((*(uint64_t (**)(uint64_t *))(*v8 + 8))(v8) + 432);
  swix::encode_message::encode_message((swix::encode_message *)&v20, 220460627);
  xpc_dictionary_set_uint64(v21, "umpcioo", a2);
  xpc_dictionary_set_value(v21, "description", value);
  v10 = *(const swix::encode_message **)(v9 + 8);
  if (!v10)
    std::terminate();
  swix::connection::send_and_await_reply((swix::connection *)v18, v10, &v20);
  v11 = swix::coder<int>::decode(object, ".error");
  xpc_release(object);
  v12 = (unint64_t)(v11 == 0) << 32;
  xpc_release(v21);
  xpc_release(value);
  if (theData)
    CFRelease(theData);
  if ((v12 | v11) >= 0x100000000)
    return 0x100000000;
  else
    return v12 | v11;
}

void sub_1D4F020FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t a10, const void *a11, uint64_t a12, xpc_object_t object)
{
  void *v13;

  __cxa_free_exception(v13);
  applesauce::CF::DataRef::~DataRef(&a11);
  _Unwind_Resume(a1);
}

unint64_t XPCClient::UMPCIObjectSetEnableState(XPCClient *this, unsigned int a2, int a3)
{
  uint64_t *v5;
  uint64_t v6;
  const swix::encode_message *v7;
  unsigned int v8;
  unint64_t v9;
  _BYTE v11[8];
  xpc_object_t object;
  int v13;
  xpc_object_t xdict;

  v5 = MIDIProcess::defaultInstance(this);
  v6 = *(_QWORD *)((*(uint64_t (**)(uint64_t *))(*v5 + 8))(v5) + 432);
  swix::encode_message::encode_message((swix::encode_message *)&v13, 220460628);
  xpc_dictionary_set_uint64(xdict, "umpcioo", a2);
  xpc_dictionary_set_BOOL(xdict, "enableState", a3 != 0);
  v7 = *(const swix::encode_message **)(v6 + 8);
  if (!v7)
    std::terminate();
  swix::connection::send_and_await_reply((swix::connection *)v11, v7, &v13);
  v8 = swix::coder<int>::decode(object, ".error");
  xpc_release(object);
  v9 = (unint64_t)(v8 == 0) << 32;
  xpc_release(xdict);
  if ((v9 | v8) >= 0x100000000)
    return 0x100000000;
  else
    return v9 | v8;
}

void sub_1D4F0228C(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, xpc_object_t object)
{
  xpc_release(object);
  __cxa_begin_catch(a1);
  __cxa_end_catch();
  JUMPOUT(0x1D4F02250);
}

uint64_t XPCClient::UMPCIGlobalState(XPCClient *this, const __CFDictionary **a2)
{
  uint64_t *v3;
  uint64_t v4;
  const swix::encode_message *v5;
  int v6;
  xpc_object_t v7;
  xpc_object_t v8;
  xpc_object_t v9;
  uint64_t result;
  xpc_object_t v11;
  const UInt8 *bytes_ptr;
  size_t length;
  CFDataRef v14;
  void *exception;
  xpc_object_t v16;
  char v17;
  xpc_object_t v18;
  CFTypeRef cf;
  xpc_object_t object;
  _QWORD v21[3];

  v3 = MIDIProcess::defaultInstance(this);
  v4 = *(_QWORD *)((*(uint64_t (**)(uint64_t *))(*v3 + 8))(v3) + 432);
  swix::encode_message::encode_message((swix::encode_message *)v21, 220460629);
  v5 = *(const swix::encode_message **)(v4 + 8);
  if (!v5)
    std::terminate();
  swix::connection::send_and_await_reply((swix::connection *)&cf, v5, (int *)v21);
  v6 = swix::coder<int>::decode(object, ".error");
  if (v6)
  {
    LODWORD(v16) = v6;
    v17 = 0;
  }
  else
  {
    v7 = xpc_null_create();
    swix::xpcobj_coder<swix::data>::decode(&v18, object, "value");
    v8 = v18;
    v9 = xpc_null_create();
    v18 = v9;
    xpc_release(v7);
    xpc_release(v9);
    std::__tuple_leaf<0ul,swix::data,false>::__tuple_leaf[abi:ne180100](&v16, v8);
    v17 = 1;
    xpc_release(v8);
  }
  xpc_release(object);
  xpc_release((xpc_object_t)v21[1]);
  if (v17 || (result = v16, !(_DWORD)v16))
  {
    v11 = v16;
    if (v16)
      xpc_retain(v16);
    else
      v11 = xpc_null_create();
    bytes_ptr = (const UInt8 *)xpc_data_get_bytes_ptr(v11);
    length = xpc_data_get_length(v11);
    v14 = CFDataCreate(0, bytes_ptr, length);
    if (!v14)
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x1D826B7EC](exception, "Could not construct");
    }
    applesauce::CF::DataRef::DataRef((applesauce::CF::DataRef *)&cf, v14);
    applesauce::CF::make_DictionaryRef((applesauce::CF *)v21, (const applesauce::CF::DataRef *)cf);
    *a2 = (const __CFDictionary *)v21[0];
    if (cf)
      CFRelease(cf);
    xpc_release(v11);
    if (v17)
      xpc_release(v16);
    return 0;
  }
  return result;
}

void sub_1D4F024A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t object, char a10, uint64_t a11, char a12, xpc_object_t a13)
{
  void *v13;
  void *v14;

  __cxa_free_exception(v14);
  xpc_release(v13);
  if (a10)
    xpc_release(object);
  _Unwind_Resume(a1);
}

unint64_t XPCClient::UMPCIDiscover(XPCClient *this)
{
  uint64_t *v1;
  uint64_t v2;
  const swix::encode_message *v3;
  unsigned int v4;
  unint64_t v5;
  _BYTE v7[8];
  xpc_object_t object;
  int v9;
  xpc_object_t v10;

  v1 = MIDIProcess::defaultInstance(this);
  v2 = *(_QWORD *)((*(uint64_t (**)(uint64_t *))(*v1 + 8))(v1) + 432);
  swix::encode_message::encode_message((swix::encode_message *)&v9, 220460630);
  v3 = *(const swix::encode_message **)(v2 + 8);
  if (!v3)
    std::terminate();
  swix::connection::send_and_await_reply((swix::connection *)v7, v3, &v9);
  v4 = swix::coder<int>::decode(object, ".error");
  xpc_release(object);
  v5 = (unint64_t)(v4 == 0) << 32;
  xpc_release(v10);
  if ((v5 | v4) >= 0x100000000)
    return 0x100000000;
  else
    return v5 | v4;
}

void sub_1D4F0262C(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, xpc_object_t object)
{
  xpc_release(object);
  __cxa_begin_catch(a1);
  __cxa_end_catch();
  JUMPOUT(0x1D4F025F4);
}

void MIGClient::~MIGClient(MIGClient *this)
{
  JUMPOUT(0x1D826BA98);
}

uint64_t MIGClient::MIDIClientCreateWithBlock(MIGClient *this, const __CFString *a2, unsigned int *a3)
{
  MIDIProcess *v4;
  uint64_t v5;
  uint64_t *v6;
  unsigned int v7;
  unsigned int v8;
  mach_msg_size_t v9;
  mach_port_name_t reply_port;
  uint64_t v11;
  BOOL v12;
  void *v14[2];
  unsigned int v15;
  _BYTE msg[32];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  LODWORD(v14[0]) = 0;
  v14[1] = 0;
  v4 = (MIDIProcess *)IPCBufferWriter::write((IPCBufferWriter *)v14, a2, 0, 0);
  v5 = (uint64_t)v4;
  if ((_DWORD)v4)
    goto LABEL_31;
  v6 = MIDIProcess::defaultInstance(v4);
  v7 = *(_DWORD *)((*(uint64_t (**)(uint64_t *))*v6)(v6) + 452);
  v8 = v15;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v22 = 0u;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v17 = 0u;
  memset(msg, 0, sizeof(msg));
  *(_QWORD *)&msg[24] = *MEMORY[0x1E0C804E8];
  if (v15 > 0x200)
  {
    v5 = 4294966989;
    goto LABEL_31;
  }
  __memcpy_chk();
  LODWORD(v17) = v8;
  v9 = ((v8 + 3) & 0xFFFFFFFC) + 36;
  reply_port = mig_get_reply_port();
  *(_QWORD *)&msg[8] = __PAIR64__(reply_port, v7);
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x1F4200000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    reply_port = *(_DWORD *)&msg[12];
  }
  v11 = mach_msg((mach_msg_header_t *)msg, 275, v9, 0x30u, reply_port, 0x493E0u, 0);
  v5 = v11;
  if ((v11 - 268435458) <= 0xE && ((1 << (v11 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&msg[12]);
    goto LABEL_22;
  }
  if (!(_DWORD)v11)
  {
    if (*(_DWORD *)&msg[20] == 71)
    {
      v5 = 4294966988;
    }
    else if (*(_DWORD *)&msg[20] == 8102)
    {
      if ((*(_DWORD *)msg & 0x80000000) == 0)
      {
        if (*(_DWORD *)&msg[4] == 40)
        {
          if (!*(_DWORD *)&msg[8])
          {
            v5 = v17;
            if (!(_DWORD)v17)
            {
              *a3 = DWORD1(v17);
              goto LABEL_31;
            }
            goto LABEL_30;
          }
        }
        else if (*(_DWORD *)&msg[4] == 36)
        {
          if (*(_DWORD *)&msg[8])
            v12 = 1;
          else
            v12 = (_DWORD)v17 == 0;
          if (v12)
            v5 = 4294966996;
          else
            v5 = v17;
          goto LABEL_30;
        }
      }
      v5 = 4294966996;
    }
    else
    {
      v5 = 4294966995;
    }
LABEL_30:
    mach_msg_destroy((mach_msg_header_t *)msg);
    goto LABEL_31;
  }
  mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
LABEL_22:
  if ((_DWORD)v5 == 268435460)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&msg[12]);
    mach_msg_destroy((mach_msg_header_t *)msg);
    v5 = 268435460;
  }
LABEL_31:
  IPCBufferWriter::~IPCBufferWriter(v14);
  return v5;
}

void sub_1D4F02938(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  IPCBufferWriter::~IPCBufferWriter((void **)va);
  _Unwind_Resume(a1);
}

uint64_t MIGClient::MIDIClientDispose(MIGClient *this, int a2)
{
  uint64_t *v3;
  int v4;
  mach_port_name_t reply_port;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE msg[36];
  uint64_t v11;

  v3 = MIDIProcess::defaultInstance(this);
  v4 = *(_DWORD *)((*(uint64_t (**)(uint64_t *))*v3)(v3) + 452);
  *(_OWORD *)&msg[20] = 0u;
  v11 = 0;
  *(_OWORD *)&msg[4] = 0u;
  *(_QWORD *)&msg[24] = *MEMORY[0x1E0C804E8];
  *(_DWORD *)&msg[32] = a2;
  reply_port = mig_get_reply_port();
  *(_DWORD *)&msg[8] = v4;
  *(_DWORD *)&msg[12] = reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x1F4300000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    reply_port = *(_DWORD *)&msg[12];
  }
  v6 = mach_msg((mach_msg_header_t *)msg, 275, 0x24u, 0x2Cu, reply_port, 0x493E0u, 0);
  v7 = v6;
  if ((v6 - 268435458) <= 0xE && ((1 << (v6 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&msg[12]);
  }
  else
  {
    if (!(_DWORD)v6)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        v8 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 8103)
      {
        v8 = 4294966996;
        if ((*(_DWORD *)msg & 0x80000000) == 0 && *(_DWORD *)&msg[4] == 36 && !*(_DWORD *)&msg[8])
        {
          v8 = *(unsigned int *)&msg[32];
          if (!*(_DWORD *)&msg[32])
            return 0;
        }
      }
      else
      {
        v8 = 4294966995;
      }
LABEL_20:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v8;
    }
    mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
  }
  v8 = 268435460;
  if ((_DWORD)v7 == 268435460)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&msg[12]);
    goto LABEL_20;
  }
  return v7;
}

uint64_t MIGClient::MIDIOutputPortCreate(MIGClient *this, int a2, CFStringRef theString, unsigned int *a4)
{
  MIDIProcess *v6;
  uint64_t v7;
  uint64_t *v8;
  unsigned int v9;
  unsigned int v10;
  mach_msg_size_t v11;
  mach_port_name_t reply_port;
  uint64_t v13;
  BOOL v14;
  void *v16[2];
  unsigned int v17;
  _BYTE msg[32];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  LODWORD(v16[0]) = 0;
  v16[1] = 0;
  v6 = (MIDIProcess *)IPCBufferWriter::write((IPCBufferWriter *)v16, theString, 0, 0);
  v7 = (uint64_t)v6;
  if ((_DWORD)v6)
    goto LABEL_31;
  v8 = MIDIProcess::defaultInstance(v6);
  v9 = *(_DWORD *)((*(uint64_t (**)(uint64_t *))*v8)(v8) + 452);
  v10 = v17;
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v24 = 0u;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v19 = 0u;
  memset(msg, 0, sizeof(msg));
  *(_QWORD *)&msg[24] = *MEMORY[0x1E0C804E8];
  LODWORD(v19) = a2;
  if (v17 > 0x200)
  {
    v7 = 4294966989;
    goto LABEL_31;
  }
  __memcpy_chk();
  DWORD1(v19) = v10;
  v11 = ((v10 + 3) & 0xFFFFFFFC) + 40;
  reply_port = mig_get_reply_port();
  *(_QWORD *)&msg[8] = __PAIR64__(reply_port, v9);
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x1F4500000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    reply_port = *(_DWORD *)&msg[12];
  }
  v13 = mach_msg((mach_msg_header_t *)msg, 275, v11, 0x30u, reply_port, 0x493E0u, 0);
  v7 = v13;
  if ((v13 - 268435458) <= 0xE && ((1 << (v13 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&msg[12]);
    goto LABEL_22;
  }
  if (!(_DWORD)v13)
  {
    if (*(_DWORD *)&msg[20] == 71)
    {
      v7 = 4294966988;
    }
    else if (*(_DWORD *)&msg[20] == 8105)
    {
      if ((*(_DWORD *)msg & 0x80000000) == 0)
      {
        if (*(_DWORD *)&msg[4] == 40)
        {
          if (!*(_DWORD *)&msg[8])
          {
            v7 = v19;
            if (!(_DWORD)v19)
            {
              *a4 = DWORD1(v19);
              goto LABEL_31;
            }
            goto LABEL_30;
          }
        }
        else if (*(_DWORD *)&msg[4] == 36)
        {
          if (*(_DWORD *)&msg[8])
            v14 = 1;
          else
            v14 = (_DWORD)v19 == 0;
          if (v14)
            v7 = 4294966996;
          else
            v7 = v19;
          goto LABEL_30;
        }
      }
      v7 = 4294966996;
    }
    else
    {
      v7 = 4294966995;
    }
LABEL_30:
    mach_msg_destroy((mach_msg_header_t *)msg);
    goto LABEL_31;
  }
  mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
LABEL_22:
  if ((_DWORD)v7 == 268435460)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&msg[12]);
    mach_msg_destroy((mach_msg_header_t *)msg);
    v7 = 268435460;
  }
LABEL_31:
  IPCBufferWriter::~IPCBufferWriter(v16);
  return v7;
}

void sub_1D4F02D9C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  IPCBufferWriter::~IPCBufferWriter((void **)va);
  _Unwind_Resume(a1);
}

uint64_t MIGClient::MIDIPortDispose(MIGClient *this, int a2)
{
  uint64_t *v3;
  int v4;
  mach_port_name_t reply_port;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE msg[36];
  uint64_t v11;

  v3 = MIDIProcess::defaultInstance(this);
  v4 = *(_DWORD *)((*(uint64_t (**)(uint64_t *))*v3)(v3) + 452);
  *(_OWORD *)&msg[20] = 0u;
  v11 = 0;
  *(_OWORD *)&msg[4] = 0u;
  *(_QWORD *)&msg[24] = *MEMORY[0x1E0C804E8];
  *(_DWORD *)&msg[32] = a2;
  reply_port = mig_get_reply_port();
  *(_DWORD *)&msg[8] = v4;
  *(_DWORD *)&msg[12] = reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x1F4600000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    reply_port = *(_DWORD *)&msg[12];
  }
  v6 = mach_msg((mach_msg_header_t *)msg, 275, 0x24u, 0x2Cu, reply_port, 0x493E0u, 0);
  v7 = v6;
  if ((v6 - 268435458) <= 0xE && ((1 << (v6 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&msg[12]);
  }
  else
  {
    if (!(_DWORD)v6)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        v8 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 8106)
      {
        v8 = 4294966996;
        if ((*(_DWORD *)msg & 0x80000000) == 0 && *(_DWORD *)&msg[4] == 36 && !*(_DWORD *)&msg[8])
        {
          v8 = *(unsigned int *)&msg[32];
          if (!*(_DWORD *)&msg[32])
            return 0;
        }
      }
      else
      {
        v8 = 4294966995;
      }
LABEL_20:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v8;
    }
    mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
  }
  v8 = 268435460;
  if ((_DWORD)v7 == 268435460)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&msg[12]);
    goto LABEL_20;
  }
  return v7;
}

uint64_t MIGClient::MIDIPortConnectSource(MIGClient *this, unsigned int a2, int a3, void *a4)
{
  uint64_t *v7;
  mach_port_t v8;
  mach_port_t reply_port;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  mach_msg_header_t v14;
  uint64_t v15;
  unsigned int v16;
  int v17;
  void *v18;

  v7 = MIDIProcess::defaultInstance(this);
  v8 = *(_DWORD *)((*(uint64_t (**)(uint64_t *))*v7)(v7) + 452);
  v15 = *MEMORY[0x1E0C804E8];
  v16 = a2;
  v17 = a3;
  v18 = a4;
  reply_port = mig_get_reply_port();
  *(_QWORD *)&v14.msgh_bits = 5395;
  v14.msgh_remote_port = v8;
  v14.msgh_local_port = reply_port;
  *(_QWORD *)&v14.msgh_voucher_port = 0x1F4700000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&v14);
    reply_port = v14.msgh_local_port;
  }
  v10 = mach_msg(&v14, 275, 0x30u, 0x2Cu, reply_port, 0x493E0u, 0);
  v11 = v10;
  if ((v10 - 268435458) <= 0xE && ((1 << (v10 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(v14.msgh_local_port);
  }
  else
  {
    if (!(_DWORD)v10)
    {
      if (v14.msgh_id == 71)
      {
        v12 = 4294966988;
      }
      else if (v14.msgh_id == 8107)
      {
        v12 = 4294966996;
        if ((v14.msgh_bits & 0x80000000) == 0 && *(_QWORD *)&v14.msgh_size == 36)
        {
          v12 = v16;
          if (!v16)
            return 0;
        }
      }
      else
      {
        v12 = 4294966995;
      }
LABEL_19:
      mach_msg_destroy(&v14);
      return v12;
    }
    mig_dealloc_reply_port(v14.msgh_local_port);
  }
  v12 = 268435460;
  if ((_DWORD)v11 == 268435460)
  {
    if ((v14.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], v14.msgh_local_port);
    goto LABEL_19;
  }
  return v11;
}

uint64_t MIGClient::MIDIPortDisconnectSource(MIGClient *this, int a2, int a3)
{
  uint64_t *v5;
  int v6;
  mach_port_name_t reply_port;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE msg[36];
  uint64_t v13;

  v5 = MIDIProcess::defaultInstance(this);
  v6 = *(_DWORD *)((*(uint64_t (**)(uint64_t *))*v5)(v5) + 452);
  *(_OWORD *)&msg[20] = 0u;
  v13 = 0;
  *(_OWORD *)&msg[4] = 0u;
  *(_QWORD *)&msg[24] = *MEMORY[0x1E0C804E8];
  *(_DWORD *)&msg[32] = a2;
  LODWORD(v13) = a3;
  reply_port = mig_get_reply_port();
  *(_DWORD *)&msg[8] = v6;
  *(_DWORD *)&msg[12] = reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x1F4800000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    reply_port = *(_DWORD *)&msg[12];
  }
  v8 = mach_msg((mach_msg_header_t *)msg, 275, 0x28u, 0x2Cu, reply_port, 0x493E0u, 0);
  v9 = v8;
  if ((v8 - 268435458) <= 0xE && ((1 << (v8 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&msg[12]);
  }
  else
  {
    if (!(_DWORD)v8)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        v10 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 8108)
      {
        v10 = 4294966996;
        if ((*(_DWORD *)msg & 0x80000000) == 0 && *(_DWORD *)&msg[4] == 36 && !*(_DWORD *)&msg[8])
        {
          v10 = *(unsigned int *)&msg[32];
          if (!*(_DWORD *)&msg[32])
            return 0;
        }
      }
      else
      {
        v10 = 4294966995;
      }
LABEL_20:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v10;
    }
    mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
  }
  v10 = 268435460;
  if ((_DWORD)v9 == 268435460)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&msg[12]);
    goto LABEL_20;
  }
  return v9;
}

uint64_t MIGClient::MIDISourceCreateWithProtocol(MIGClient *this, int a2, CFStringRef theString, MIDIProtocolID a4, unsigned int *a5)
{
  MIDIProcess *v8;
  uint64_t v9;
  uint64_t *v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  mach_msg_size_t v14;
  mach_port_name_t reply_port;
  uint64_t v16;
  BOOL v17;
  void *v19[2];
  unsigned int v20;
  _BYTE msg[32];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  LODWORD(v19[0]) = 0;
  v19[1] = 0;
  v8 = (MIDIProcess *)IPCBufferWriter::write((IPCBufferWriter *)v19, theString, 0, 0);
  v9 = (uint64_t)v8;
  if ((_DWORD)v8)
    goto LABEL_31;
  v10 = MIDIProcess::defaultInstance(v8);
  v11 = *(_DWORD *)((*(uint64_t (**)(uint64_t *))*v10)(v10) + 452);
  v12 = v20;
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v27 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v22 = 0u;
  memset(msg, 0, sizeof(msg));
  *(_QWORD *)&msg[24] = *MEMORY[0x1E0C804E8];
  LODWORD(v22) = a2;
  if (v20 > 0x200)
  {
    v9 = 4294966989;
    goto LABEL_31;
  }
  __memcpy_chk();
  DWORD1(v22) = v12;
  v13 = (v12 + 3) & 0xFFFFFFFC;
  v14 = v13 + 44;
  *(_DWORD *)&msg[v13 + 40] = a4;
  reply_port = mig_get_reply_port();
  *(_QWORD *)&msg[8] = __PAIR64__(reply_port, v11);
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x1F4B00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    reply_port = *(_DWORD *)&msg[12];
  }
  v16 = mach_msg((mach_msg_header_t *)msg, 275, v14, 0x30u, reply_port, 0x493E0u, 0);
  v9 = v16;
  if ((v16 - 268435458) <= 0xE && ((1 << (v16 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&msg[12]);
    goto LABEL_22;
  }
  if (!(_DWORD)v16)
  {
    if (*(_DWORD *)&msg[20] == 71)
    {
      v9 = 4294966988;
    }
    else if (*(_DWORD *)&msg[20] == 8111)
    {
      if ((*(_DWORD *)msg & 0x80000000) == 0)
      {
        if (*(_DWORD *)&msg[4] == 40)
        {
          if (!*(_DWORD *)&msg[8])
          {
            v9 = v22;
            if (!(_DWORD)v22)
            {
              *a5 = DWORD1(v22);
              goto LABEL_31;
            }
            goto LABEL_30;
          }
        }
        else if (*(_DWORD *)&msg[4] == 36)
        {
          if (*(_DWORD *)&msg[8])
            v17 = 1;
          else
            v17 = (_DWORD)v22 == 0;
          if (v17)
            v9 = 4294966996;
          else
            v9 = v22;
          goto LABEL_30;
        }
      }
      v9 = 4294966996;
    }
    else
    {
      v9 = 4294966995;
    }
LABEL_30:
    mach_msg_destroy((mach_msg_header_t *)msg);
    goto LABEL_31;
  }
  mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
LABEL_22:
  if ((_DWORD)v9 == 268435460)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&msg[12]);
    mach_msg_destroy((mach_msg_header_t *)msg);
    v9 = 268435460;
  }
LABEL_31:
  IPCBufferWriter::~IPCBufferWriter(v19);
  return v9;
}

void sub_1D4F03550(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  IPCBufferWriter::~IPCBufferWriter((void **)va);
  _Unwind_Resume(a1);
}

uint64_t MIGClient::MIDIEndpointDispose(MIGClient *this, int a2)
{
  uint64_t *v3;
  int v4;
  mach_port_name_t reply_port;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE msg[36];
  uint64_t v11;

  v3 = MIDIProcess::defaultInstance(this);
  v4 = *(_DWORD *)((*(uint64_t (**)(uint64_t *))*v3)(v3) + 452);
  *(_OWORD *)&msg[20] = 0u;
  v11 = 0;
  *(_OWORD *)&msg[4] = 0u;
  *(_QWORD *)&msg[24] = *MEMORY[0x1E0C804E8];
  *(_DWORD *)&msg[32] = a2;
  reply_port = mig_get_reply_port();
  *(_DWORD *)&msg[8] = v4;
  *(_DWORD *)&msg[12] = reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x1F4C00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    reply_port = *(_DWORD *)&msg[12];
  }
  v6 = mach_msg((mach_msg_header_t *)msg, 275, 0x24u, 0x2Cu, reply_port, 0x493E0u, 0);
  v7 = v6;
  if ((v6 - 268435458) <= 0xE && ((1 << (v6 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&msg[12]);
  }
  else
  {
    if (!(_DWORD)v6)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        v8 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 8112)
      {
        v8 = 4294966996;
        if ((*(_DWORD *)msg & 0x80000000) == 0 && *(_DWORD *)&msg[4] == 36 && !*(_DWORD *)&msg[8])
        {
          v8 = *(unsigned int *)&msg[32];
          if (!*(_DWORD *)&msg[32])
            return 0;
        }
      }
      else
      {
        v8 = 4294966995;
      }
LABEL_20:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v8;
    }
    mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
  }
  v8 = 268435460;
  if ((_DWORD)v7 == 268435460)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&msg[12]);
    goto LABEL_20;
  }
  return v7;
}

uint64_t MIGClient::MIDIObjectGetIntegerProperty(MIGClient *this, int a2, CFStringRef theString, int *a4)
{
  MIDIProcess *v6;
  uint64_t v7;
  uint64_t *v8;
  unsigned int v9;
  unsigned int v10;
  mach_msg_size_t v11;
  mach_port_name_t reply_port;
  uint64_t v13;
  BOOL v14;
  void *v16[2];
  unsigned int v17;
  _BYTE msg[32];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  LODWORD(v16[0]) = 0;
  v16[1] = 0;
  v6 = (MIDIProcess *)IPCBufferWriter::write((IPCBufferWriter *)v16, theString, 0, 0);
  v7 = (uint64_t)v6;
  if ((_DWORD)v6)
    goto LABEL_31;
  v8 = MIDIProcess::defaultInstance(v6);
  v9 = *(_DWORD *)((*(uint64_t (**)(uint64_t *))*v8)(v8) + 452);
  v10 = v17;
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v24 = 0u;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v19 = 0u;
  memset(msg, 0, sizeof(msg));
  *(_QWORD *)&msg[24] = *MEMORY[0x1E0C804E8];
  LODWORD(v19) = a2;
  if (v17 > 0x200)
  {
    v7 = 4294966989;
    goto LABEL_31;
  }
  __memcpy_chk();
  DWORD1(v19) = v10;
  v11 = ((v10 + 3) & 0xFFFFFFFC) + 40;
  reply_port = mig_get_reply_port();
  *(_QWORD *)&msg[8] = __PAIR64__(reply_port, v9);
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x1F4D00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    reply_port = *(_DWORD *)&msg[12];
  }
  v13 = mach_msg((mach_msg_header_t *)msg, 275, v11, 0x30u, reply_port, 0x493E0u, 0);
  v7 = v13;
  if ((v13 - 268435458) <= 0xE && ((1 << (v13 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&msg[12]);
    goto LABEL_22;
  }
  if (!(_DWORD)v13)
  {
    if (*(_DWORD *)&msg[20] == 71)
    {
      v7 = 4294966988;
    }
    else if (*(_DWORD *)&msg[20] == 8113)
    {
      if ((*(_DWORD *)msg & 0x80000000) == 0)
      {
        if (*(_DWORD *)&msg[4] == 40)
        {
          if (!*(_DWORD *)&msg[8])
          {
            v7 = v19;
            if (!(_DWORD)v19)
            {
              *a4 = DWORD1(v19);
              goto LABEL_31;
            }
            goto LABEL_30;
          }
        }
        else if (*(_DWORD *)&msg[4] == 36)
        {
          if (*(_DWORD *)&msg[8])
            v14 = 1;
          else
            v14 = (_DWORD)v19 == 0;
          if (v14)
            v7 = 4294966996;
          else
            v7 = v19;
          goto LABEL_30;
        }
      }
      v7 = 4294966996;
    }
    else
    {
      v7 = 4294966995;
    }
LABEL_30:
    mach_msg_destroy((mach_msg_header_t *)msg);
    goto LABEL_31;
  }
  mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
LABEL_22:
  if ((_DWORD)v7 == 268435460)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&msg[12]);
    mach_msg_destroy((mach_msg_header_t *)msg);
    v7 = 268435460;
  }
LABEL_31:
  IPCBufferWriter::~IPCBufferWriter(v16);
  return v7;
}

void sub_1D4F039B4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  IPCBufferWriter::~IPCBufferWriter((void **)va);
  _Unwind_Resume(a1);
}

uint64_t MIGClient::MIDIObjectSetIntegerProperty(MIGClient *this, int a2, CFStringRef theString, int a4)
{
  MIDIProcess *v6;
  uint64_t v7;
  uint64_t *v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  mach_msg_size_t v12;
  mach_port_name_t reply_port;
  uint64_t v14;
  uint64_t v15;
  void *v17[2];
  unsigned int v18;
  _BYTE msg[32];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  LODWORD(v17[0]) = 0;
  v17[1] = 0;
  v6 = (MIDIProcess *)IPCBufferWriter::write((IPCBufferWriter *)v17, theString, 0, 0);
  v7 = (uint64_t)v6;
  if (!(_DWORD)v6)
  {
    v8 = MIDIProcess::defaultInstance(v6);
    v9 = *(_DWORD *)((*(uint64_t (**)(uint64_t *))*v8)(v8) + 452);
    v10 = v18;
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v25 = 0u;
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v20 = 0u;
    memset(msg, 0, sizeof(msg));
    *(_QWORD *)&msg[24] = *MEMORY[0x1E0C804E8];
    LODWORD(v20) = a2;
    if (v18 > 0x200)
    {
      v7 = 4294966989;
      goto LABEL_23;
    }
    __memcpy_chk();
    DWORD1(v20) = v10;
    v11 = (v10 + 3) & 0xFFFFFFFC;
    v12 = v11 + 44;
    *(_DWORD *)&msg[v11 + 40] = a4;
    reply_port = mig_get_reply_port();
    *(_QWORD *)&msg[8] = __PAIR64__(reply_port, v9);
    *(_DWORD *)msg = 5395;
    *(_QWORD *)&msg[16] = 0x1F4E00000000;
    if (MEMORY[0x1E0C85B60])
    {
      voucher_mach_msg_set((mach_msg_header_t *)msg);
      reply_port = *(_DWORD *)&msg[12];
    }
    v14 = mach_msg((mach_msg_header_t *)msg, 275, v12, 0x2Cu, reply_port, 0x493E0u, 0);
    v7 = v14;
    if ((v14 - 268435458) <= 0xE && ((1 << (v14 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(*(mach_port_t *)&msg[12]);
    }
    else
    {
      if (!(_DWORD)v14)
      {
        if (*(_DWORD *)&msg[20] == 71)
        {
          v15 = 4294966988;
        }
        else if (*(_DWORD *)&msg[20] == 8114)
        {
          v15 = 4294966996;
          if ((*(_DWORD *)msg & 0x80000000) == 0 && *(_QWORD *)&msg[4] == 36)
          {
            v15 = v20;
            if (!(_DWORD)v20)
            {
              v7 = 0;
              goto LABEL_23;
            }
          }
        }
        else
        {
          v15 = 4294966995;
        }
LABEL_22:
        mach_msg_destroy((mach_msg_header_t *)msg);
        v7 = v15;
        goto LABEL_23;
      }
      mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
    }
    v15 = 268435460;
    if ((_DWORD)v7 != 268435460)
      goto LABEL_23;
    if ((*(_WORD *)msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&msg[12]);
    goto LABEL_22;
  }
LABEL_23:
  IPCBufferWriter::~IPCBufferWriter(v17);
  return v7;
}

void sub_1D4F03C50(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  IPCBufferWriter::~IPCBufferWriter((void **)va);
  _Unwind_Resume(a1);
}

uint64_t MIGClient::MIDIObjectGetStringProperty(MIGClient *this, mach_port_t a2, CFStringRef theString, const __CFString **a4)
{
  MIDIProcess *v6;
  uint64_t v7;
  uint64_t *v8;
  unsigned int v9;
  mach_port_t v10;
  uint64_t msgh_remote_port;
  mach_port_name_t reply_port;
  uint64_t v13;
  void *v15[2];
  unsigned int v16;
  mach_msg_header_t msg[2];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  LODWORD(v15[0]) = 0;
  v15[1] = 0;
  v6 = (MIDIProcess *)IPCBufferWriter::write((IPCBufferWriter *)v15, theString, 0, 0);
  v7 = (uint64_t)v6;
  if (!(_DWORD)v6)
  {
    v8 = MIDIProcess::defaultInstance(v6);
    v9 = *(_DWORD *)((*(uint64_t (**)(uint64_t *))*v8)(v8) + 452);
    v10 = v16;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v22 = 0u;
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    memset(msg, 0, sizeof(msg));
    *(_QWORD *)&msg[1].msgh_bits = *MEMORY[0x1E0C804E8];
    msg[1].msgh_remote_port = a2;
    if (v16 > 0x200)
    {
      msgh_remote_port = 4294966989;
LABEL_31:
      v7 = msgh_remote_port;
      goto LABEL_32;
    }
    __memcpy_chk();
    msg[1].msgh_local_port = v10;
    reply_port = mig_get_reply_port();
    *(_QWORD *)&msg[0].msgh_remote_port = __PAIR64__(reply_port, v9);
    msg[0].msgh_bits = 5395;
    *(_QWORD *)&msg[0].msgh_voucher_port = 0x1F4F00000000;
    if (MEMORY[0x1E0C85B60])
    {
      voucher_mach_msg_set(msg);
      reply_port = msg[0].msgh_local_port;
    }
    v13 = mach_msg(msg, 275, ((v10 + 3) & 0xFFFFFFFC) + 40, 0x40u, reply_port, 0x493E0u, 0);
    v7 = v13;
    if ((v13 - 268435458) <= 0xE && ((1 << (v13 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(msg[0].msgh_local_port);
    }
    else
    {
      if (!(_DWORD)v13)
      {
        if (msg[0].msgh_id == 71)
        {
          msgh_remote_port = 4294966988;
        }
        else if (msg[0].msgh_id == 8115)
        {
          if ((msg[0].msgh_bits & 0x80000000) == 0)
          {
            if (msg[0].msgh_size == 36)
            {
              msgh_remote_port = 4294966996;
              if (msg[1].msgh_remote_port)
              {
                if (msg[0].msgh_remote_port)
                  msgh_remote_port = 4294966996;
                else
                  msgh_remote_port = msg[1].msgh_remote_port;
              }
            }
            else
            {
              msgh_remote_port = 4294966996;
            }
            goto LABEL_30;
          }
          msgh_remote_port = 4294966996;
          if (msg[1].msgh_bits == 1
            && *(_QWORD *)&msg[0].msgh_size == 56
            && HIBYTE(msg[1].msgh_local_port) == 1
            && msg[1].msgh_voucher_port == DWORD1(v18))
          {
            *(_QWORD *)&msg[0].msgh_bits = *(_QWORD *)&msg[1].msgh_size;
            *(_QWORD *)&msg[0].msgh_remote_port = msg[1].msgh_voucher_port | 0x100000000;
            *(_QWORD *)&msg[0].msgh_voucher_port = 0;
            *a4 = CFStringCreateWithBytes(0, *(const UInt8 **)&msg[1].msgh_size, msg[1].msgh_voucher_port, 0x100u, 1u);
            IPCBufferReader::~IPCBufferReader((IPCBufferReader *)msg);
            v7 = 0;
            goto LABEL_32;
          }
        }
        else
        {
          msgh_remote_port = 4294966995;
        }
LABEL_30:
        mach_msg_destroy(msg);
        goto LABEL_31;
      }
      mig_dealloc_reply_port(msg[0].msgh_local_port);
    }
    msgh_remote_port = 268435460;
    if ((_DWORD)v7 == 268435460)
    {
      if ((msg[0].msgh_bits & 0x1F00) == 0x1100)
        mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg[0].msgh_local_port);
      goto LABEL_30;
    }
  }
LABEL_32:
  IPCBufferWriter::~IPCBufferWriter(v15);
  return v7;
}

void sub_1D4F03F5C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v3;
  va_list va;
  uint64_t v5;
  uint64_t v6;
  va_list va1;

  va_start(va1, a2);
  va_start(va, a2);
  v3 = va_arg(va1, void *);
  v5 = va_arg(va1, _QWORD);
  v6 = va_arg(va1, _QWORD);
  IPCBufferReader::~IPCBufferReader((IPCBufferReader *)va1);
  IPCBufferWriter::~IPCBufferWriter((void **)va);
  _Unwind_Resume(a1);
}

uint64_t MIGClient::MIDIObjectSetStringProperty(MIGClient *this, int a2, CFStringRef theString, const __CFString *a4)
{
  uint64_t v6;
  MIDIProcess *v7;
  uint64_t *v8;
  mach_port_t v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  mach_msg_size_t v13;
  mach_port_t reply_port;
  uint64_t v15;
  uint64_t v16;
  void *v18;
  uint64_t v19;
  unsigned int v20;
  void *v21[2];
  unsigned int v22;
  mach_msg_header_t msg;
  int v24;
  uint64_t v25;
  int v26;
  _BYTE v27[24];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  LODWORD(v21[0]) = 0;
  v21[1] = 0;
  v6 = IPCBufferWriter::write((IPCBufferWriter *)v21, theString, 0, 0);
  if (!(_DWORD)v6)
  {
    LODWORD(v18) = 0;
    v19 = 0;
    v7 = (MIDIProcess *)IPCBufferWriter::write((IPCBufferWriter *)&v18, a4, 0, 0);
    v6 = (uint64_t)v7;
    if ((_DWORD)v7)
    {
LABEL_25:
      IPCBufferWriter::~IPCBufferWriter(&v18);
      goto LABEL_26;
    }
    v8 = MIDIProcess::defaultInstance(v7);
    v9 = *(_DWORD *)((*(uint64_t (**)(uint64_t *))*v8)(v8) + 452);
    v10 = v22;
    v11 = v20;
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    *(_OWORD *)&v27[8] = 0u;
    memset(&msg, 0, sizeof(msg));
    v24 = 1;
    v25 = v19;
    v26 = 16777472;
    *(_QWORD *)v27 = v20;
    *(_QWORD *)&v27[4] = *MEMORY[0x1E0C804E8];
    *(_DWORD *)&v27[12] = a2;
    if (v22 > 0x200)
    {
      v6 = 4294966989;
      goto LABEL_25;
    }
    __memcpy_chk();
    *(_DWORD *)&v27[16] = v10;
    v12 = (v10 + 3) & 0xFFFFFFFC;
    v13 = v12 + 64;
    *(_DWORD *)((char *)&msg + v12 + 60) = v11;
    reply_port = mig_get_reply_port();
    msg.msgh_remote_port = v9;
    msg.msgh_local_port = reply_port;
    msg.msgh_bits = -2147478253;
    *(_QWORD *)&msg.msgh_voucher_port = 0x1F5000000000;
    if (MEMORY[0x1E0C85B60])
    {
      voucher_mach_msg_set(&msg);
      reply_port = msg.msgh_local_port;
    }
    v15 = mach_msg(&msg, 275, v13, 0x2Cu, reply_port, 0x493E0u, 0);
    v6 = v15;
    if ((v15 - 268435458) <= 0xE && ((1 << (v15 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(msg.msgh_local_port);
    }
    else
    {
      if (!(_DWORD)v15)
      {
        if (msg.msgh_id == 71)
        {
          v16 = 4294966988;
        }
        else if (msg.msgh_id == 8116)
        {
          v16 = 4294966996;
          if ((msg.msgh_bits & 0x80000000) == 0 && msg.msgh_size == 36 && !msg.msgh_remote_port)
          {
            v16 = HIDWORD(v25);
            if (!HIDWORD(v25))
            {
              v6 = 0;
              goto LABEL_25;
            }
          }
        }
        else
        {
          v16 = 4294966995;
        }
LABEL_24:
        mach_msg_destroy(&msg);
        v6 = v16;
        goto LABEL_25;
      }
      mig_dealloc_reply_port(msg.msgh_local_port);
    }
    v16 = 268435460;
    if ((_DWORD)v6 != 268435460)
      goto LABEL_25;
    if ((msg.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg.msgh_local_port);
    goto LABEL_24;
  }
LABEL_26:
  IPCBufferWriter::~IPCBufferWriter(v21);
  return v6;
}

void sub_1D4F0424C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  IPCBufferWriter::~IPCBufferWriter((void **)&a9);
  IPCBufferWriter::~IPCBufferWriter(&a12);
  _Unwind_Resume(a1);
}

uint64_t MIGClient::MIDIObjectGetDataProperty(MIGClient *this, mach_port_t a2, CFStringRef theString, const __CFData **a4)
{
  MIDIProcess *v6;
  uint64_t v7;
  uint64_t *v8;
  unsigned int v9;
  mach_port_t v10;
  uint64_t msgh_remote_port;
  mach_port_name_t reply_port;
  uint64_t v13;
  void *v15[2];
  unsigned int v16;
  mach_msg_header_t msg[2];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  LODWORD(v15[0]) = 0;
  v15[1] = 0;
  v6 = (MIDIProcess *)IPCBufferWriter::write((IPCBufferWriter *)v15, theString, 0, 0);
  v7 = (uint64_t)v6;
  if (!(_DWORD)v6)
  {
    v8 = MIDIProcess::defaultInstance(v6);
    v9 = *(_DWORD *)((*(uint64_t (**)(uint64_t *))*v8)(v8) + 452);
    v10 = v16;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v22 = 0u;
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    memset(msg, 0, sizeof(msg));
    *(_QWORD *)&msg[1].msgh_bits = *MEMORY[0x1E0C804E8];
    msg[1].msgh_remote_port = a2;
    if (v16 > 0x200)
    {
      msgh_remote_port = 4294966989;
LABEL_31:
      v7 = msgh_remote_port;
      goto LABEL_32;
    }
    __memcpy_chk();
    msg[1].msgh_local_port = v10;
    reply_port = mig_get_reply_port();
    *(_QWORD *)&msg[0].msgh_remote_port = __PAIR64__(reply_port, v9);
    msg[0].msgh_bits = 5395;
    *(_QWORD *)&msg[0].msgh_voucher_port = 0x1F5100000000;
    if (MEMORY[0x1E0C85B60])
    {
      voucher_mach_msg_set(msg);
      reply_port = msg[0].msgh_local_port;
    }
    v13 = mach_msg(msg, 275, ((v10 + 3) & 0xFFFFFFFC) + 40, 0x40u, reply_port, 0x493E0u, 0);
    v7 = v13;
    if ((v13 - 268435458) <= 0xE && ((1 << (v13 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(msg[0].msgh_local_port);
    }
    else
    {
      if (!(_DWORD)v13)
      {
        if (msg[0].msgh_id == 71)
        {
          msgh_remote_port = 4294966988;
        }
        else if (msg[0].msgh_id == 8117)
        {
          if ((msg[0].msgh_bits & 0x80000000) == 0)
          {
            if (msg[0].msgh_size == 36)
            {
              msgh_remote_port = 4294966996;
              if (msg[1].msgh_remote_port)
              {
                if (msg[0].msgh_remote_port)
                  msgh_remote_port = 4294966996;
                else
                  msgh_remote_port = msg[1].msgh_remote_port;
              }
            }
            else
            {
              msgh_remote_port = 4294966996;
            }
            goto LABEL_30;
          }
          msgh_remote_port = 4294966996;
          if (msg[1].msgh_bits == 1
            && *(_QWORD *)&msg[0].msgh_size == 56
            && HIBYTE(msg[1].msgh_local_port) == 1
            && msg[1].msgh_voucher_port == DWORD1(v18))
          {
            *(_QWORD *)&msg[0].msgh_bits = *(_QWORD *)&msg[1].msgh_size;
            *(_QWORD *)&msg[0].msgh_remote_port = msg[1].msgh_voucher_port | 0x100000000;
            *(_QWORD *)&msg[0].msgh_voucher_port = 0;
            *a4 = CFDataCreate(0, *(const UInt8 **)&msg[1].msgh_size, msg[1].msgh_voucher_port);
            IPCBufferReader::~IPCBufferReader((IPCBufferReader *)msg);
            v7 = 0;
            goto LABEL_32;
          }
        }
        else
        {
          msgh_remote_port = 4294966995;
        }
LABEL_30:
        mach_msg_destroy(msg);
        goto LABEL_31;
      }
      mig_dealloc_reply_port(msg[0].msgh_local_port);
    }
    msgh_remote_port = 268435460;
    if ((_DWORD)v7 == 268435460)
    {
      if ((msg[0].msgh_bits & 0x1F00) == 0x1100)
        mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg[0].msgh_local_port);
      goto LABEL_30;
    }
  }
LABEL_32:
  IPCBufferWriter::~IPCBufferWriter(v15);
  return v7;
}

void sub_1D4F04560(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v3;
  va_list va;
  uint64_t v5;
  uint64_t v6;
  va_list va1;

  va_start(va1, a2);
  va_start(va, a2);
  v3 = va_arg(va1, void *);
  v5 = va_arg(va1, _QWORD);
  v6 = va_arg(va1, _QWORD);
  IPCBufferReader::~IPCBufferReader((IPCBufferReader *)va1);
  IPCBufferWriter::~IPCBufferWriter((void **)va);
  _Unwind_Resume(a1);
}

uint64_t MIGClient::MIDIObjectSetDataProperty(MIGClient *this, int a2, CFStringRef theString, const __CFData *a4)
{
  uint64_t v6;
  MIDIProcess *v7;
  uint64_t *v8;
  mach_port_t v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  mach_msg_size_t v13;
  mach_port_t reply_port;
  uint64_t v15;
  uint64_t v16;
  void *v18;
  uint64_t v19;
  unsigned int v20;
  void *v21[2];
  unsigned int v22;
  mach_msg_header_t msg;
  int v24;
  uint64_t v25;
  int v26;
  _BYTE v27[24];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  LODWORD(v21[0]) = 0;
  v21[1] = 0;
  v6 = IPCBufferWriter::write((IPCBufferWriter *)v21, theString, 0, 0);
  if (!(_DWORD)v6)
  {
    LODWORD(v18) = 0;
    v19 = 0;
    v7 = (MIDIProcess *)IPCBufferWriter::write((IPCBufferWriter *)&v18, a4, 0, 0);
    v6 = (uint64_t)v7;
    if ((_DWORD)v7)
    {
LABEL_25:
      IPCBufferWriter::~IPCBufferWriter(&v18);
      goto LABEL_26;
    }
    v8 = MIDIProcess::defaultInstance(v7);
    v9 = *(_DWORD *)((*(uint64_t (**)(uint64_t *))*v8)(v8) + 452);
    v10 = v22;
    v11 = v20;
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    *(_OWORD *)&v27[8] = 0u;
    memset(&msg, 0, sizeof(msg));
    v24 = 1;
    v25 = v19;
    v26 = 16777472;
    *(_QWORD *)v27 = v20;
    *(_QWORD *)&v27[4] = *MEMORY[0x1E0C804E8];
    *(_DWORD *)&v27[12] = a2;
    if (v22 > 0x200)
    {
      v6 = 4294966989;
      goto LABEL_25;
    }
    __memcpy_chk();
    *(_DWORD *)&v27[16] = v10;
    v12 = (v10 + 3) & 0xFFFFFFFC;
    v13 = v12 + 64;
    *(_DWORD *)((char *)&msg + v12 + 60) = v11;
    reply_port = mig_get_reply_port();
    msg.msgh_remote_port = v9;
    msg.msgh_local_port = reply_port;
    msg.msgh_bits = -2147478253;
    *(_QWORD *)&msg.msgh_voucher_port = 0x1F5200000000;
    if (MEMORY[0x1E0C85B60])
    {
      voucher_mach_msg_set(&msg);
      reply_port = msg.msgh_local_port;
    }
    v15 = mach_msg(&msg, 275, v13, 0x2Cu, reply_port, 0x493E0u, 0);
    v6 = v15;
    if ((v15 - 268435458) <= 0xE && ((1 << (v15 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(msg.msgh_local_port);
    }
    else
    {
      if (!(_DWORD)v15)
      {
        if (msg.msgh_id == 71)
        {
          v16 = 4294966988;
        }
        else if (msg.msgh_id == 8118)
        {
          v16 = 4294966996;
          if ((msg.msgh_bits & 0x80000000) == 0 && msg.msgh_size == 36 && !msg.msgh_remote_port)
          {
            v16 = HIDWORD(v25);
            if (!HIDWORD(v25))
            {
              v6 = 0;
              goto LABEL_25;
            }
          }
        }
        else
        {
          v16 = 4294966995;
        }
LABEL_24:
        mach_msg_destroy(&msg);
        v6 = v16;
        goto LABEL_25;
      }
      mig_dealloc_reply_port(msg.msgh_local_port);
    }
    v16 = 268435460;
    if ((_DWORD)v6 != 268435460)
      goto LABEL_25;
    if ((msg.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg.msgh_local_port);
    goto LABEL_24;
  }
LABEL_26:
  IPCBufferWriter::~IPCBufferWriter(v21);
  return v6;
}

void sub_1D4F04850(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  IPCBufferWriter::~IPCBufferWriter((void **)&a9);
  IPCBufferWriter::~IPCBufferWriter(&a12);
  _Unwind_Resume(a1);
}

uint64_t MIGClient::MIDIObjectGetDictionaryProperty(MIGClient *this, mach_port_t a2, CFStringRef theString, const UInt8 **a4)
{
  MIDIProcess *v6;
  uint64_t v7;
  uint64_t *v8;
  unsigned int v9;
  mach_port_t v10;
  uint64_t msgh_remote_port;
  mach_port_name_t reply_port;
  uint64_t v13;
  mach_port_name_t msgh_voucher_port;
  uint64_t v15;
  void *v17[2];
  unsigned int v18;
  mach_msg_header_t msg[2];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  LODWORD(v17[0]) = 0;
  v17[1] = 0;
  v6 = (MIDIProcess *)IPCBufferWriter::write((IPCBufferWriter *)v17, theString, 0, 0);
  v7 = (uint64_t)v6;
  if (!(_DWORD)v6)
  {
    v8 = MIDIProcess::defaultInstance(v6);
    v9 = *(_DWORD *)((*(uint64_t (**)(uint64_t *))*v8)(v8) + 452);
    v10 = v18;
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v24 = 0u;
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    memset(msg, 0, sizeof(msg));
    *(_QWORD *)&msg[1].msgh_bits = *MEMORY[0x1E0C804E8];
    msg[1].msgh_remote_port = a2;
    if (v18 > 0x200)
    {
      msgh_remote_port = 4294966989;
LABEL_33:
      v7 = msgh_remote_port;
      goto LABEL_34;
    }
    __memcpy_chk();
    msg[1].msgh_local_port = v10;
    reply_port = mig_get_reply_port();
    *(_QWORD *)&msg[0].msgh_remote_port = __PAIR64__(reply_port, v9);
    msg[0].msgh_bits = 5395;
    *(_QWORD *)&msg[0].msgh_voucher_port = 0x1F5300000000;
    if (MEMORY[0x1E0C85B60])
    {
      voucher_mach_msg_set(msg);
      reply_port = msg[0].msgh_local_port;
    }
    v13 = mach_msg(msg, 275, ((v10 + 3) & 0xFFFFFFFC) + 40, 0x40u, reply_port, 0x493E0u, 0);
    v7 = v13;
    if ((v13 - 268435458) <= 0xE && ((1 << (v13 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(msg[0].msgh_local_port);
    }
    else
    {
      if (!(_DWORD)v13)
      {
        if (msg[0].msgh_id == 71)
        {
          msgh_remote_port = 4294966988;
        }
        else if (msg[0].msgh_id == 8119)
        {
          if ((msg[0].msgh_bits & 0x80000000) == 0)
          {
            if (msg[0].msgh_size == 36)
            {
              msgh_remote_port = 4294966996;
              if (msg[1].msgh_remote_port)
              {
                if (msg[0].msgh_remote_port)
                  msgh_remote_port = 4294966996;
                else
                  msgh_remote_port = msg[1].msgh_remote_port;
              }
            }
            else
            {
              msgh_remote_port = 4294966996;
            }
            goto LABEL_32;
          }
          msgh_remote_port = 4294966996;
          if (msg[1].msgh_bits == 1 && *(_QWORD *)&msg[0].msgh_size == 56 && HIBYTE(msg[1].msgh_local_port) == 1)
          {
            msgh_voucher_port = msg[1].msgh_voucher_port;
            if (msg[1].msgh_voucher_port == DWORD1(v20))
            {
              v15 = *(_QWORD *)&msg[1].msgh_size;
LABEL_23:
              *(_QWORD *)&msg[0].msgh_bits = v15;
              *(_QWORD *)&msg[0].msgh_remote_port = msgh_voucher_port | 0x100000000;
              *(_QWORD *)&msg[0].msgh_voucher_port = 0;
              *a4 = IPCBufferReader::ReadCFPropertyList((const UInt8 **)msg, 1);
              IPCBufferReader::~IPCBufferReader((IPCBufferReader *)msg);
              v7 = 0;
              goto LABEL_34;
            }
          }
        }
        else
        {
          msgh_remote_port = 4294966995;
        }
LABEL_32:
        mach_msg_destroy(msg);
        goto LABEL_33;
      }
      mig_dealloc_reply_port(msg[0].msgh_local_port);
    }
    msgh_remote_port = 268435460;
    if ((_DWORD)v7 == 268435460)
    {
      if ((msg[0].msgh_bits & 0x1F00) == 0x1100)
        mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg[0].msgh_local_port);
      goto LABEL_32;
    }
    if (!(_DWORD)v7)
      goto LABEL_23;
  }
LABEL_34:
  IPCBufferWriter::~IPCBufferWriter(v17);
  return v7;
}

void sub_1D4F04B70(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v3;
  va_list va;
  uint64_t v5;
  uint64_t v6;
  va_list va1;

  va_start(va1, a2);
  va_start(va, a2);
  v3 = va_arg(va1, void *);
  v5 = va_arg(va1, _QWORD);
  v6 = va_arg(va1, _QWORD);
  IPCBufferReader::~IPCBufferReader((IPCBufferReader *)va1);
  IPCBufferWriter::~IPCBufferWriter((void **)va);
  _Unwind_Resume(a1);
}

uint64_t MIGClient::MIDIObjectSetDictionaryProperty(MIGClient *this, int a2, CFStringRef theString, const __CFDictionary *a4)
{
  uint64_t v6;
  MIDIProcess *v7;
  uint64_t *v8;
  mach_port_t v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  mach_msg_size_t v13;
  mach_port_t reply_port;
  uint64_t v15;
  uint64_t v16;
  void *v18;
  uint64_t v19;
  unsigned int v20;
  void *v21[2];
  unsigned int v22;
  mach_msg_header_t msg;
  int v24;
  uint64_t v25;
  int v26;
  _BYTE v27[24];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  LODWORD(v21[0]) = 0;
  v21[1] = 0;
  v6 = IPCBufferWriter::write((IPCBufferWriter *)v21, theString, 0, 0);
  if (!(_DWORD)v6)
  {
    LODWORD(v18) = 0;
    v19 = 0;
    v7 = (MIDIProcess *)IPCBufferWriter::write((IPCBufferWriter *)&v18, a4, 0, 0);
    v6 = (uint64_t)v7;
    if ((_DWORD)v7)
    {
LABEL_25:
      IPCBufferWriter::~IPCBufferWriter(&v18);
      goto LABEL_26;
    }
    v8 = MIDIProcess::defaultInstance(v7);
    v9 = *(_DWORD *)((*(uint64_t (**)(uint64_t *))*v8)(v8) + 452);
    v10 = v22;
    v11 = v20;
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    *(_OWORD *)&v27[8] = 0u;
    memset(&msg, 0, sizeof(msg));
    v24 = 1;
    v25 = v19;
    v26 = 16777472;
    *(_QWORD *)v27 = v20;
    *(_QWORD *)&v27[4] = *MEMORY[0x1E0C804E8];
    *(_DWORD *)&v27[12] = a2;
    if (v22 > 0x200)
    {
      v6 = 4294966989;
      goto LABEL_25;
    }
    __memcpy_chk();
    *(_DWORD *)&v27[16] = v10;
    v12 = (v10 + 3) & 0xFFFFFFFC;
    v13 = v12 + 64;
    *(_DWORD *)((char *)&msg + v12 + 60) = v11;
    reply_port = mig_get_reply_port();
    msg.msgh_remote_port = v9;
    msg.msgh_local_port = reply_port;
    msg.msgh_bits = -2147478253;
    *(_QWORD *)&msg.msgh_voucher_port = 0x1F5400000000;
    if (MEMORY[0x1E0C85B60])
    {
      voucher_mach_msg_set(&msg);
      reply_port = msg.msgh_local_port;
    }
    v15 = mach_msg(&msg, 275, v13, 0x2Cu, reply_port, 0x493E0u, 0);
    v6 = v15;
    if ((v15 - 268435458) <= 0xE && ((1 << (v15 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(msg.msgh_local_port);
    }
    else
    {
      if (!(_DWORD)v15)
      {
        if (msg.msgh_id == 71)
        {
          v16 = 4294966988;
        }
        else if (msg.msgh_id == 8120)
        {
          v16 = 4294966996;
          if ((msg.msgh_bits & 0x80000000) == 0 && msg.msgh_size == 36 && !msg.msgh_remote_port)
          {
            v16 = HIDWORD(v25);
            if (!HIDWORD(v25))
            {
              v6 = 0;
              goto LABEL_25;
            }
          }
        }
        else
        {
          v16 = 4294966995;
        }
LABEL_24:
        mach_msg_destroy(&msg);
        v6 = v16;
        goto LABEL_25;
      }
      mig_dealloc_reply_port(msg.msgh_local_port);
    }
    v16 = 268435460;
    if ((_DWORD)v6 != 268435460)
      goto LABEL_25;
    if ((msg.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg.msgh_local_port);
    goto LABEL_24;
  }
LABEL_26:
  IPCBufferWriter::~IPCBufferWriter(v21);
  return v6;
}

void sub_1D4F04E60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  IPCBufferWriter::~IPCBufferWriter((void **)&a9);
  IPCBufferWriter::~IPCBufferWriter(&a12);
  _Unwind_Resume(a1);
}

uint64_t MIGClient::MIDIObjectGetProperties(MIGClient *this, int a2, const UInt8 **a3, int a4)
{
  uint64_t *v7;
  int v8;
  mach_port_name_t reply_port;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE msg[64];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = MIDIProcess::defaultInstance(this);
  v8 = *(_DWORD *)((*(uint64_t (**)(uint64_t *))*v7)(v7) + 452);
  memset(&msg[20], 0, 44);
  *(_OWORD *)&msg[4] = 0u;
  *(_QWORD *)&msg[24] = *MEMORY[0x1E0C804E8];
  *(_DWORD *)&msg[32] = a2;
  *(_DWORD *)&msg[36] = a4;
  reply_port = mig_get_reply_port();
  *(_DWORD *)&msg[8] = v8;
  *(_DWORD *)&msg[12] = reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x1F5500000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    reply_port = *(_DWORD *)&msg[12];
  }
  v10 = mach_msg((mach_msg_header_t *)msg, 275, 0x28u, 0x40u, reply_port, 0x493E0u, 0);
  v11 = v10;
  if ((v10 - 268435458) <= 0xE && ((1 << (v10 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&msg[12]);
  }
  else
  {
    if (!(_DWORD)v10)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        v14 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 8121)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 36)
          {
            v14 = 4294966996;
            if (*(_DWORD *)&msg[32])
            {
              if (*(_DWORD *)&msg[8])
                v14 = 4294966996;
              else
                v14 = *(unsigned int *)&msg[32];
            }
          }
          else
          {
            v14 = 4294966996;
          }
          goto LABEL_30;
        }
        v14 = 4294966996;
        if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 56 && !*(_DWORD *)&msg[8] && msg[39] == 1)
        {
          v12 = *(_DWORD *)&msg[40];
          if (*(_DWORD *)&msg[40] == *(_DWORD *)&msg[52])
          {
            v13 = *(_QWORD *)&msg[28];
LABEL_20:
            *(_QWORD *)msg = v13;
            *(_DWORD *)&msg[8] = v12;
            *(_DWORD *)&msg[12] = 1;
            *(_QWORD *)&msg[16] = 0;
            *a3 = IPCBufferReader::ReadCFPropertyList((const UInt8 **)msg, 1);
            IPCBufferReader::~IPCBufferReader((IPCBufferReader *)msg);
            return 0;
          }
        }
      }
      else
      {
        v14 = 4294966995;
      }
LABEL_30:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v14;
    }
    mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
  }
  v14 = 268435460;
  if ((_DWORD)v11 == 268435460)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&msg[12]);
    goto LABEL_30;
  }
  if (!(_DWORD)v11)
    goto LABEL_20;
  return v11;
}

void sub_1D4F050DC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  IPCBufferReader::~IPCBufferReader((IPCBufferReader *)va);
  _Unwind_Resume(a1);
}

uint64_t MIGClient::MIDIObjectRemoveProperty(MIGClient *this, int a2, CFStringRef theString)
{
  MIDIProcess *v4;
  uint64_t v5;
  uint64_t *v6;
  unsigned int v7;
  unsigned int v8;
  mach_port_name_t reply_port;
  uint64_t v10;
  uint64_t v11;
  void *v13[2];
  unsigned int v14;
  _BYTE msg[32];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  LODWORD(v13[0]) = 0;
  v13[1] = 0;
  v4 = (MIDIProcess *)IPCBufferWriter::write((IPCBufferWriter *)v13, theString, 0, 0);
  v5 = (uint64_t)v4;
  if (!(_DWORD)v4)
  {
    v6 = MIDIProcess::defaultInstance(v4);
    v7 = *(_DWORD *)((*(uint64_t (**)(uint64_t *))*v6)(v6) + 452);
    v8 = v14;
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v21 = 0u;
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v16 = 0u;
    memset(msg, 0, sizeof(msg));
    *(_QWORD *)&msg[24] = *MEMORY[0x1E0C804E8];
    LODWORD(v16) = a2;
    if (v14 > 0x200)
    {
      v5 = 4294966989;
      goto LABEL_23;
    }
    __memcpy_chk();
    DWORD1(v16) = v8;
    reply_port = mig_get_reply_port();
    *(_QWORD *)&msg[8] = __PAIR64__(reply_port, v7);
    *(_DWORD *)msg = 5395;
    *(_QWORD *)&msg[16] = 0x1F5600000000;
    if (MEMORY[0x1E0C85B60])
    {
      voucher_mach_msg_set((mach_msg_header_t *)msg);
      reply_port = *(_DWORD *)&msg[12];
    }
    v10 = mach_msg((mach_msg_header_t *)msg, 275, ((v8 + 3) & 0xFFFFFFFC) + 40, 0x2Cu, reply_port, 0x493E0u, 0);
    v5 = v10;
    if ((v10 - 268435458) <= 0xE && ((1 << (v10 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(*(mach_port_t *)&msg[12]);
    }
    else
    {
      if (!(_DWORD)v10)
      {
        if (*(_DWORD *)&msg[20] == 71)
        {
          v11 = 4294966988;
        }
        else if (*(_DWORD *)&msg[20] == 8122)
        {
          v11 = 4294966996;
          if ((*(_DWORD *)msg & 0x80000000) == 0 && *(_QWORD *)&msg[4] == 36)
          {
            v11 = v16;
            if (!(_DWORD)v16)
            {
              v5 = 0;
              goto LABEL_23;
            }
          }
        }
        else
        {
          v11 = 4294966995;
        }
LABEL_22:
        mach_msg_destroy((mach_msg_header_t *)msg);
        v5 = v11;
        goto LABEL_23;
      }
      mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
    }
    v11 = 268435460;
    if ((_DWORD)v5 != 268435460)
      goto LABEL_23;
    if ((*(_WORD *)msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&msg[12]);
    goto LABEL_22;
  }
LABEL_23:
  IPCBufferWriter::~IPCBufferWriter(v13);
  return v5;
}

void sub_1D4F05360(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  IPCBufferWriter::~IPCBufferWriter((void **)va);
  _Unwind_Resume(a1);
}

uint64_t MIGClient::MIDIObjectFindByUniqueID(MIGClient *this, int a2, unsigned int *a3, MIDIObjectType *a4)
{
  uint64_t *v7;
  int v8;
  mach_port_name_t reply_port;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  _BYTE msg[36];
  __int128 v15;

  v7 = MIDIProcess::defaultInstance(this);
  v8 = *(_DWORD *)((*(uint64_t (**)(uint64_t *))*v7)(v7) + 452);
  *(_OWORD *)&msg[20] = 0u;
  v15 = 0u;
  *(_OWORD *)&msg[4] = 0u;
  *(_QWORD *)&msg[24] = *MEMORY[0x1E0C804E8];
  *(_DWORD *)&msg[32] = a2;
  reply_port = mig_get_reply_port();
  *(_DWORD *)&msg[8] = v8;
  *(_DWORD *)&msg[12] = reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x1F5700000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    reply_port = *(_DWORD *)&msg[12];
  }
  v10 = mach_msg((mach_msg_header_t *)msg, 275, 0x24u, 0x34u, reply_port, 0x493E0u, 0);
  v11 = v10;
  if ((v10 - 268435458) <= 0xE && ((1 << (v10 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&msg[12]);
    goto LABEL_19;
  }
  if ((_DWORD)v10)
  {
    mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
LABEL_19:
    if ((_DWORD)v11 == 268435460)
    {
      if ((*(_WORD *)msg & 0x1F00) == 0x1100)
        mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&msg[12]);
      mach_msg_destroy((mach_msg_header_t *)msg);
      return 268435460;
    }
    return v11;
  }
  if (*(_DWORD *)&msg[20] == 71)
  {
    v11 = 4294966988;
LABEL_27:
    mach_msg_destroy((mach_msg_header_t *)msg);
    return v11;
  }
  if (*(_DWORD *)&msg[20] != 8123)
  {
    v11 = 4294966995;
    goto LABEL_27;
  }
  if ((*(_DWORD *)msg & 0x80000000) != 0)
    goto LABEL_26;
  if (*(_DWORD *)&msg[4] != 44)
  {
    if (*(_DWORD *)&msg[4] == 36)
    {
      if (*(_DWORD *)&msg[8])
        v12 = 1;
      else
        v12 = *(_DWORD *)&msg[32] == 0;
      if (v12)
        v11 = 4294966996;
      else
        v11 = *(unsigned int *)&msg[32];
      goto LABEL_27;
    }
    goto LABEL_26;
  }
  if (*(_DWORD *)&msg[8])
  {
LABEL_26:
    v11 = 4294966996;
    goto LABEL_27;
  }
  v11 = *(unsigned int *)&msg[32];
  if (*(_DWORD *)&msg[32])
    goto LABEL_27;
  if (a3)
    *a3 = v15;
  v11 = 0;
  if (a4)
    *a4 = SDWORD1(v15);
  return v11;
}

uint64_t MIGClient::MIDIFlushOutput(MIGClient *this, int a2)
{
  uint64_t *v3;
  int v4;
  mach_port_name_t reply_port;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE msg[36];
  uint64_t v11;

  v3 = MIDIProcess::defaultInstance(this);
  v4 = *(_DWORD *)((*(uint64_t (**)(uint64_t *))*v3)(v3) + 452);
  *(_OWORD *)&msg[20] = 0u;
  v11 = 0;
  *(_OWORD *)&msg[4] = 0u;
  *(_QWORD *)&msg[24] = *MEMORY[0x1E0C804E8];
  *(_DWORD *)&msg[32] = a2;
  reply_port = mig_get_reply_port();
  *(_DWORD *)&msg[8] = v4;
  *(_DWORD *)&msg[12] = reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x1F5800000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    reply_port = *(_DWORD *)&msg[12];
  }
  v6 = mach_msg((mach_msg_header_t *)msg, 275, 0x24u, 0x2Cu, reply_port, 0x493E0u, 0);
  v7 = v6;
  if ((v6 - 268435458) <= 0xE && ((1 << (v6 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&msg[12]);
  }
  else
  {
    if (!(_DWORD)v6)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        v8 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 8124)
      {
        v8 = 4294966996;
        if ((*(_DWORD *)msg & 0x80000000) == 0 && *(_DWORD *)&msg[4] == 36 && !*(_DWORD *)&msg[8])
        {
          v8 = *(unsigned int *)&msg[32];
          if (!*(_DWORD *)&msg[32])
            return 0;
        }
      }
      else
      {
        v8 = 4294966995;
      }
LABEL_20:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v8;
    }
    mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
  }
  v8 = 268435460;
  if ((_DWORD)v7 == 268435460)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&msg[12]);
    goto LABEL_20;
  }
  return v7;
}

uint64_t MIGClient::MIDIRestart(MIGClient *this)
{
  uint64_t *v1;
  int v2;
  mach_port_name_t reply_port;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE msg[36];
  uint64_t v9;

  v1 = MIDIProcess::defaultInstance(this);
  v2 = *(_DWORD *)((*(uint64_t (**)(uint64_t *))*v1)(v1) + 452);
  *(_OWORD *)&msg[20] = 0u;
  v9 = 0;
  *(_OWORD *)&msg[4] = 0u;
  *(_QWORD *)&msg[24] = *MEMORY[0x1E0C804E8];
  reply_port = mig_get_reply_port();
  *(_DWORD *)&msg[8] = v2;
  *(_DWORD *)&msg[12] = reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x1F5900000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    reply_port = *(_DWORD *)&msg[12];
  }
  v4 = mach_msg((mach_msg_header_t *)msg, 275, 0x24u, 0x2Cu, reply_port, 0x493E0u, 0);
  v5 = v4;
  if ((v4 - 268435458) <= 0xE && ((1 << (v4 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&msg[12]);
  }
  else
  {
    if (!(_DWORD)v4)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        v6 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 8125)
      {
        v6 = 4294966996;
        if ((*(_DWORD *)msg & 0x80000000) == 0 && *(_DWORD *)&msg[4] == 36 && !*(_DWORD *)&msg[8])
        {
          v6 = *(unsigned int *)&msg[32];
          if (!*(_DWORD *)&msg[32])
            return 0;
        }
      }
      else
      {
        v6 = 4294966995;
      }
LABEL_20:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v6;
    }
    mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
  }
  v6 = 268435460;
  if ((_DWORD)v5 == 268435460)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&msg[12]);
    goto LABEL_20;
  }
  return v5;
}

unint64_t MIGClient::MIDICapabilityGetDiscoveryMUID(MIGClient *this)
{
  uint64_t *v1;
  int v2;
  mach_port_name_t reply_port;
  mach_msg_return_t v4;
  unsigned int v5;
  BOOL v6;
  uint64_t v7;
  int v9;
  int rcv_name;
  int rcv_name_4;
  mach_port_t rcv_name_8;
  _BYTE rcv_name_12[32];

  v1 = MIDIProcess::defaultInstance(this);
  v2 = *(_DWORD *)((*(uint64_t (**)(uint64_t *))*v1)(v1) + 452);
  memset(&rcv_name_12[4], 0, 28);
  rcv_name = 0;
  reply_port = mig_get_reply_port();
  rcv_name_4 = v2;
  rcv_name_8 = reply_port;
  v9 = 5395;
  *(_QWORD *)rcv_name_12 = 0x1F6900000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v9);
    reply_port = rcv_name_8;
  }
  v4 = mach_msg((mach_msg_header_t *)&v9, 275, 0x18u, 0x30u, reply_port, 0x493E0u, 0);
  v5 = v4;
  if ((v4 - 268435458) <= 0xE && ((1 << (v4 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(rcv_name_8);
    goto LABEL_19;
  }
  if (!v4)
  {
    if (*(_DWORD *)&rcv_name_12[4] == 71)
    {
      v5 = -308;
    }
    else if (*(_DWORD *)&rcv_name_12[4] == 8141)
    {
      if ((v9 & 0x80000000) == 0)
      {
        if (rcv_name == 40)
        {
          if (!rcv_name_4)
          {
            v5 = *(_DWORD *)&rcv_name_12[16];
            if (!*(_DWORD *)&rcv_name_12[16])
            {
              LODWORD(v7) = *(_DWORD *)&rcv_name_12[20];
              goto LABEL_29;
            }
            goto LABEL_27;
          }
        }
        else if (rcv_name == 36)
        {
          if (rcv_name_4)
            v6 = 1;
          else
            v6 = *(_DWORD *)&rcv_name_12[16] == 0;
          if (v6)
            v5 = -300;
          else
            v5 = *(_DWORD *)&rcv_name_12[16];
          goto LABEL_27;
        }
      }
      v5 = -300;
    }
    else
    {
      v5 = -301;
    }
LABEL_27:
    mach_msg_destroy((mach_msg_header_t *)&v9);
    goto LABEL_28;
  }
  mig_dealloc_reply_port(rcv_name_8);
LABEL_19:
  if (v5 != 268435460)
  {
LABEL_28:
    LODWORD(v7) = 0;
    goto LABEL_29;
  }
  if ((v9 & 0x1F00) == 0x1100)
    mach_port_deallocate(*MEMORY[0x1E0C83DA0], rcv_name_8);
  mach_msg_destroy((mach_msg_header_t *)&v9);
  LODWORD(v7) = 0;
  v5 = 268435460;
LABEL_29:
  if (v5)
    v7 = v5;
  else
    v7 = v7;
  return v7 | ((unint64_t)(v5 == 0) << 32);
}

uint64_t MIGClient::MIDICapabilityMUIDCollides(MIGClient *this, int a2)
{
  uint64_t *v3;
  int v4;
  mach_port_name_t reply_port;
  mach_msg_return_t v6;
  mach_msg_return_t v7;
  char v8;
  _BYTE msg[36];
  uint64_t v11;

  v3 = MIDIProcess::defaultInstance(this);
  v4 = *(_DWORD *)((*(uint64_t (**)(uint64_t *))*v3)(v3) + 452);
  *(_OWORD *)&msg[20] = 0u;
  v11 = 0;
  *(_OWORD *)&msg[4] = 0u;
  *(_QWORD *)&msg[24] = *MEMORY[0x1E0C804E8];
  *(_DWORD *)&msg[32] = a2;
  reply_port = mig_get_reply_port();
  *(_DWORD *)&msg[8] = v4;
  *(_DWORD *)&msg[12] = reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x1F6A00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    reply_port = *(_DWORD *)&msg[12];
  }
  v6 = mach_msg((mach_msg_header_t *)msg, 275, 0x24u, 0x2Cu, reply_port, 0x493E0u, 0);
  v7 = v6;
  if ((v6 - 268435458) <= 0xE && ((1 << (v6 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&msg[12]);
  }
  else
  {
    if (!v6)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        v8 = -52;
      }
      else if (*(_DWORD *)&msg[20] == 8142)
      {
        v8 = -44;
        if ((*(_DWORD *)msg & 0x80000000) == 0 && *(_DWORD *)&msg[4] == 36 && !*(_DWORD *)&msg[8])
        {
          v8 = msg[32];
          if (!*(_DWORD *)&msg[32])
          {
            LOBYTE(v7) = 0;
            return v7 | 0x100000000;
          }
        }
      }
      else
      {
        v8 = -45;
      }
LABEL_20:
      mach_msg_destroy((mach_msg_header_t *)msg);
      LOBYTE(v7) = v8;
      return v7 | 0x100000000;
    }
    mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
  }
  v8 = 4;
  if (v7 == 268435460)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&msg[12]);
    goto LABEL_20;
  }
  return v7 | 0x100000000;
}

uint64_t MIGClient::MIDIExternalDeviceCreate(MIGClient *this, const __CFString *a2, const __CFString *a3, const __CFString *a4, unsigned int *a5)
{
  uint64_t v8;
  MIDIProcess *v9;
  uint64_t *v10;
  unsigned int v11;
  unsigned int v12;
  const void *v13;
  size_t v14;
  const void *v15;
  size_t v16;
  uint64_t v17;
  uint64_t v19;
  _BYTE *v20;
  int v21;
  mach_port_name_t reply_port;
  uint64_t v23;
  BOOL v24;
  void *v25;
  const void *v26;
  unsigned int v27;
  void *v28;
  const void *v29;
  unsigned int v30;
  void *v31[2];
  unsigned int v32;
  _BYTE msg[32];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  LODWORD(v31[0]) = 0;
  v31[1] = 0;
  LODWORD(v28) = 0;
  v29 = 0;
  LODWORD(v25) = 0;
  v26 = 0;
  v8 = IPCBufferWriter::write((IPCBufferWriter *)v31, a2, 0, 0);
  if ((_DWORD)v8)
    goto LABEL_8;
  v8 = IPCBufferWriter::write((IPCBufferWriter *)&v28, a3, 0, 0);
  if ((_DWORD)v8)
    goto LABEL_8;
  v9 = (MIDIProcess *)IPCBufferWriter::write((IPCBufferWriter *)&v25, a4, 0, 0);
  v8 = (uint64_t)v9;
  if ((_DWORD)v9)
    goto LABEL_8;
  v10 = MIDIProcess::defaultInstance(v9);
  v11 = *(_DWORD *)((*(uint64_t (**)(uint64_t *))*v10)(v10) + 452);
  v12 = v32;
  v13 = v29;
  v14 = v30;
  v15 = v26;
  v16 = v27;
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  memset(msg, 0, sizeof(msg));
  *(_QWORD *)&msg[24] = *MEMORY[0x1E0C804E8];
  if (v32 > 0x200
    || (__memcpy_chk(), LODWORD(v34) = v12, v14 > 0x200)
    || (v17 = (v12 + 3) & 0xFFFFFFFC,
        memcpy(&msg[v17 + 40], v13, v14),
        *(_DWORD *)&msg[v17 + 36] = v14,
        v16 > 0x200))
  {
    v8 = 4294966989;
    goto LABEL_8;
  }
  v19 = ((_DWORD)v14 + 3) & 0xFFFFFFFC;
  v20 = &msg[v17 - 512 + v19];
  v21 = v17 + v19 + ((v16 + 3) & 0xFFFFFFFC);
  memcpy(v20 + 556, v15, v16);
  *((_DWORD *)v20 + 138) = v16;
  reply_port = mig_get_reply_port();
  *(_QWORD *)&msg[8] = __PAIR64__(reply_port, v11);
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x1F5E00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    reply_port = *(_DWORD *)&msg[12];
  }
  v23 = mach_msg((mach_msg_header_t *)msg, 275, v21 + 44, 0x30u, reply_port, 0x493E0u, 0);
  v8 = v23;
  if ((v23 - 268435458) <= 0xE && ((1 << (v23 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&msg[12]);
    goto LABEL_27;
  }
  if (!(_DWORD)v23)
  {
    if (*(_DWORD *)&msg[20] == 71)
    {
      v8 = 4294966988;
    }
    else if (*(_DWORD *)&msg[20] == 8130)
    {
      if ((*(_DWORD *)msg & 0x80000000) == 0)
      {
        if (*(_DWORD *)&msg[4] == 40)
        {
          if (!*(_DWORD *)&msg[8])
          {
            v8 = v34;
            if (!(_DWORD)v34)
            {
              *a5 = DWORD1(v34);
              goto LABEL_8;
            }
            goto LABEL_35;
          }
        }
        else if (*(_DWORD *)&msg[4] == 36)
        {
          if (*(_DWORD *)&msg[8])
            v24 = 1;
          else
            v24 = (_DWORD)v34 == 0;
          if (v24)
            v8 = 4294966996;
          else
            v8 = v34;
          goto LABEL_35;
        }
      }
      v8 = 4294966996;
    }
    else
    {
      v8 = 4294966995;
    }
LABEL_35:
    mach_msg_destroy((mach_msg_header_t *)msg);
    goto LABEL_8;
  }
  mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
LABEL_27:
  if ((_DWORD)v8 == 268435460)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&msg[12]);
    mach_msg_destroy((mach_msg_header_t *)msg);
    v8 = 268435460;
  }
LABEL_8:
  IPCBufferWriter::~IPCBufferWriter(&v25);
  IPCBufferWriter::~IPCBufferWriter(&v28);
  IPCBufferWriter::~IPCBufferWriter(v31);
  return v8;
}

void sub_1D4F05F74(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v3;
  va_list va;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  va_list va1;
  uint64_t v9;
  uint64_t v10;
  va_list va2;

  va_start(va2, a2);
  va_start(va1, a2);
  va_start(va, a2);
  v3 = va_arg(va1, void *);
  v5 = va_arg(va1, _QWORD);
  v6 = va_arg(va1, _QWORD);
  va_copy(va2, va1);
  v7 = va_arg(va2, void *);
  v9 = va_arg(va2, _QWORD);
  v10 = va_arg(va2, _QWORD);
  IPCBufferWriter::~IPCBufferWriter((void **)va);
  IPCBufferWriter::~IPCBufferWriter((void **)va1);
  IPCBufferWriter::~IPCBufferWriter((void **)va2);
  _Unwind_Resume(a1);
}

uint64_t MIGClient::MIDIDeviceNewEntity(MIGClient *this, int a2, CFStringRef theString, MIDIProtocolID a4, int a5, int a6, int a7, unsigned int *a8)
{
  MIDIProcess *v14;
  uint64_t v15;
  uint64_t *v16;
  unsigned int v17;
  unsigned int v18;
  uint64_t v19;
  mach_msg_size_t v20;
  _DWORD *v21;
  mach_port_name_t reply_port;
  uint64_t v23;
  BOOL v24;
  void *v26[2];
  unsigned int v27;
  _BYTE msg[32];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  LODWORD(v26[0]) = 0;
  v26[1] = 0;
  v14 = (MIDIProcess *)IPCBufferWriter::write((IPCBufferWriter *)v26, theString, 0, 0);
  v15 = (uint64_t)v14;
  if ((_DWORD)v14)
    goto LABEL_31;
  v16 = MIDIProcess::defaultInstance(v14);
  v17 = *(_DWORD *)((*(uint64_t (**)(uint64_t *))*v16)(v16) + 452);
  v18 = v27;
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v34 = 0u;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v29 = 0u;
  memset(msg, 0, sizeof(msg));
  *(_QWORD *)&msg[24] = *MEMORY[0x1E0C804E8];
  LODWORD(v29) = a2;
  if (v27 > 0x200)
  {
    v15 = 4294966989;
    goto LABEL_31;
  }
  __memcpy_chk();
  DWORD1(v29) = v18;
  v19 = (v18 + 3) & 0xFFFFFFFC;
  v20 = v19 + 56;
  v21 = &msg[v19];
  v21[10] = a4;
  v21[11] = a5;
  v21[12] = a6;
  v21[13] = a7;
  reply_port = mig_get_reply_port();
  *(_QWORD *)&msg[8] = __PAIR64__(reply_port, v17);
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x1F5F00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    reply_port = *(_DWORD *)&msg[12];
  }
  v23 = mach_msg((mach_msg_header_t *)msg, 275, v20, 0x30u, reply_port, 0x493E0u, 0);
  v15 = v23;
  if ((v23 - 268435458) <= 0xE && ((1 << (v23 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&msg[12]);
    goto LABEL_22;
  }
  if (!(_DWORD)v23)
  {
    if (*(_DWORD *)&msg[20] == 71)
    {
      v15 = 4294966988;
    }
    else if (*(_DWORD *)&msg[20] == 8131)
    {
      if ((*(_DWORD *)msg & 0x80000000) == 0)
      {
        if (*(_DWORD *)&msg[4] == 40)
        {
          if (!*(_DWORD *)&msg[8])
          {
            v15 = v29;
            if (!(_DWORD)v29)
            {
              *a8 = DWORD1(v29);
              goto LABEL_31;
            }
            goto LABEL_30;
          }
        }
        else if (*(_DWORD *)&msg[4] == 36)
        {
          if (*(_DWORD *)&msg[8])
            v24 = 1;
          else
            v24 = (_DWORD)v29 == 0;
          if (v24)
            v15 = 4294966996;
          else
            v15 = v29;
          goto LABEL_30;
        }
      }
      v15 = 4294966996;
    }
    else
    {
      v15 = 4294966995;
    }
LABEL_30:
    mach_msg_destroy((mach_msg_header_t *)msg);
    goto LABEL_31;
  }
  mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
LABEL_22:
  if ((_DWORD)v15 == 268435460)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&msg[12]);
    mach_msg_destroy((mach_msg_header_t *)msg);
    v15 = 268435460;
  }
LABEL_31:
  IPCBufferWriter::~IPCBufferWriter(v26);
  return v15;
}

void sub_1D4F06284(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  IPCBufferWriter::~IPCBufferWriter((void **)va);
  _Unwind_Resume(a1);
}

uint64_t MIGClient::MIDIDeviceRemoveEntity(MIGClient *this, int a2, int a3)
{
  uint64_t *v5;
  int v6;
  mach_port_name_t reply_port;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE msg[36];
  uint64_t v13;

  v5 = MIDIProcess::defaultInstance(this);
  v6 = *(_DWORD *)((*(uint64_t (**)(uint64_t *))*v5)(v5) + 452);
  *(_OWORD *)&msg[20] = 0u;
  v13 = 0;
  *(_OWORD *)&msg[4] = 0u;
  *(_QWORD *)&msg[24] = *MEMORY[0x1E0C804E8];
  *(_DWORD *)&msg[32] = a2;
  LODWORD(v13) = a3;
  reply_port = mig_get_reply_port();
  *(_DWORD *)&msg[8] = v6;
  *(_DWORD *)&msg[12] = reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x1F6000000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    reply_port = *(_DWORD *)&msg[12];
  }
  v8 = mach_msg((mach_msg_header_t *)msg, 275, 0x28u, 0x2Cu, reply_port, 0x493E0u, 0);
  v9 = v8;
  if ((v8 - 268435458) <= 0xE && ((1 << (v8 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&msg[12]);
  }
  else
  {
    if (!(_DWORD)v8)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        v10 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 8132)
      {
        v10 = 4294966996;
        if ((*(_DWORD *)msg & 0x80000000) == 0 && *(_DWORD *)&msg[4] == 36 && !*(_DWORD *)&msg[8])
        {
          v10 = *(unsigned int *)&msg[32];
          if (!*(_DWORD *)&msg[32])
            return 0;
        }
      }
      else
      {
        v10 = 4294966995;
      }
LABEL_20:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v10;
    }
    mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
  }
  v10 = 268435460;
  if ((_DWORD)v9 == 268435460)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&msg[12]);
    goto LABEL_20;
  }
  return v9;
}

uint64_t MIGClient::MIDIEntityAddOrRemoveEndpoints(MIGClient *this, unsigned int a2, int a3, int a4)
{
  uint64_t *v7;
  mach_port_t v8;
  mach_port_t reply_port;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  mach_msg_header_t v14;
  uint64_t v15;
  unsigned int v16;
  int v17;
  int v18;

  v7 = MIDIProcess::defaultInstance(this);
  v8 = *(_DWORD *)((*(uint64_t (**)(uint64_t *))*v7)(v7) + 452);
  v15 = *MEMORY[0x1E0C804E8];
  v16 = a2;
  v17 = a3;
  v18 = a4;
  reply_port = mig_get_reply_port();
  *(_QWORD *)&v14.msgh_bits = 5395;
  v14.msgh_remote_port = v8;
  v14.msgh_local_port = reply_port;
  *(_QWORD *)&v14.msgh_voucher_port = 0x1F6100000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&v14);
    reply_port = v14.msgh_local_port;
  }
  v10 = mach_msg(&v14, 275, 0x2Cu, 0x2Cu, reply_port, 0x493E0u, 0);
  v11 = v10;
  if ((v10 - 268435458) <= 0xE && ((1 << (v10 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(v14.msgh_local_port);
  }
  else
  {
    if (!(_DWORD)v10)
    {
      if (v14.msgh_id == 71)
      {
        v12 = 4294966988;
      }
      else if (v14.msgh_id == 8133)
      {
        v12 = 4294966996;
        if ((v14.msgh_bits & 0x80000000) == 0 && *(_QWORD *)&v14.msgh_size == 36)
        {
          v12 = v16;
          if (!v16)
            return 0;
        }
      }
      else
      {
        v12 = 4294966995;
      }
LABEL_19:
      mach_msg_destroy(&v14);
      return v12;
    }
    mig_dealloc_reply_port(v14.msgh_local_port);
  }
  v12 = 268435460;
  if ((_DWORD)v11 == 268435460)
  {
    if ((v14.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], v14.msgh_local_port);
    goto LABEL_19;
  }
  return v11;
}

uint64_t MIGClient::MIDISetupAddExternalDevice(MIGClient *this, int a2)
{
  uint64_t *v3;
  uint64_t v4;

  v3 = MIDIProcess::defaultInstance(this);
  v4 = (*(uint64_t (**)(uint64_t *))*v3)(v3);
  return MIDIClient_SetupAddDevice(*(_DWORD *)(v4 + 452), a2, 1);
}

uint64_t MIGClient::MIDISetupRemoveExternalDevice(MIGClient *this, int a2)
{
  uint64_t *v3;
  uint64_t v4;

  v3 = MIDIProcess::defaultInstance(this);
  v4 = (*(uint64_t (**)(uint64_t *))*v3)(v3);
  return MIDIClient_SetupRemoveDevice(*(_DWORD *)(v4 + 452), a2, 1);
}

uint64_t MIGClient::MIDISetupAddDevice(MIGClient *this, int a2)
{
  uint64_t *v3;
  uint64_t v4;

  v3 = MIDIProcess::defaultInstance(this);
  v4 = (*(uint64_t (**)(uint64_t *))*v3)(v3);
  return MIDIClient_SetupAddDevice(*(_DWORD *)(v4 + 452), a2, 0);
}

uint64_t MIGClient::MIDISetupRemoveDevice(MIGClient *this, int a2)
{
  uint64_t *v3;
  uint64_t v4;

  v3 = MIDIProcess::defaultInstance(this);
  v4 = (*(uint64_t (**)(uint64_t *))*v3)(v3);
  return MIDIClient_SetupRemoveDevice(*(_DWORD *)(v4 + 452), a2, 0);
}

uint64_t MIGClient::MIDIThruConnectionCreate(MIGClient *this, const __CFString *a2, CFDataRef theData, unsigned int *a4)
{
  MIDIProcess *v6;
  uint64_t v7;
  MIDIProcess *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void *v14;
  uint64_t v15;
  unsigned int v16;
  void *v17;
  uint64_t v18;
  unsigned int v19;

  LODWORD(v17) = 0;
  v18 = 0;
  v6 = (MIDIProcess *)IPCBufferWriter::write((IPCBufferWriter *)&v17, theData, 0, 0);
  v7 = (uint64_t)v6;
  if (!(_DWORD)v6)
  {
    if (a2)
    {
      LODWORD(v14) = 0;
      v15 = 0;
      v8 = (MIDIProcess *)IPCBufferWriter::write((IPCBufferWriter *)&v14, a2, 0, 0);
      v7 = (uint64_t)v8;
      if (!(_DWORD)v8)
      {
        v9 = MIDIProcess::defaultInstance(v8);
        v10 = (*(uint64_t (**)(uint64_t *))*v9)(v9);
        v7 = MIDIClient_ThruConnectionCreate(*(_DWORD *)(v10 + 452), v15, v16, v18, v19, (int *)a4);
      }
      IPCBufferWriter::~IPCBufferWriter(&v14);
    }
    else
    {
      v11 = MIDIProcess::defaultInstance(v6);
      v12 = (*(uint64_t (**)(uint64_t *))*v11)(v11);
      v7 = MIDIClient_ThruConnectionCreate(*(_DWORD *)(v12 + 452), 0, 0, v18, v19, (int *)a4);
    }
  }
  IPCBufferWriter::~IPCBufferWriter(&v17);
  return v7;
}

void sub_1D4F067B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  IPCBufferWriter::~IPCBufferWriter((void **)&a9);
  IPCBufferWriter::~IPCBufferWriter(&a12);
  _Unwind_Resume(a1);
}

uint64_t MIGClient::MIDIThruConnectionDispose(MIGClient *this, int a2)
{
  uint64_t *v3;
  int v4;
  mach_port_name_t reply_port;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE msg[36];
  uint64_t v11;

  v3 = MIDIProcess::defaultInstance(this);
  v4 = *(_DWORD *)((*(uint64_t (**)(uint64_t *))*v3)(v3) + 452);
  *(_OWORD *)&msg[20] = 0u;
  v11 = 0;
  *(_OWORD *)&msg[4] = 0u;
  *(_QWORD *)&msg[24] = *MEMORY[0x1E0C804E8];
  *(_DWORD *)&msg[32] = a2;
  reply_port = mig_get_reply_port();
  *(_DWORD *)&msg[8] = v4;
  *(_DWORD *)&msg[12] = reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x1F6500000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    reply_port = *(_DWORD *)&msg[12];
  }
  v6 = mach_msg((mach_msg_header_t *)msg, 275, 0x24u, 0x2Cu, reply_port, 0x493E0u, 0);
  v7 = v6;
  if ((v6 - 268435458) <= 0xE && ((1 << (v6 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&msg[12]);
  }
  else
  {
    if (!(_DWORD)v6)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        v8 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 8137)
      {
        v8 = 4294966996;
        if ((*(_DWORD *)msg & 0x80000000) == 0 && *(_DWORD *)&msg[4] == 36 && !*(_DWORD *)&msg[8])
        {
          v8 = *(unsigned int *)&msg[32];
          if (!*(_DWORD *)&msg[32])
            return 0;
        }
      }
      else
      {
        v8 = 4294966995;
      }
LABEL_20:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v8;
    }
    mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
  }
  v8 = 268435460;
  if ((_DWORD)v7 == 268435460)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&msg[12]);
    goto LABEL_20;
  }
  return v7;
}

uint64_t MIGClient::MIDIThruConnectionGetParams(MIGClient *this, int a2, const __CFData **a3)
{
  uint64_t *v5;
  int v6;
  mach_port_name_t reply_port;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE msg[64];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = MIDIProcess::defaultInstance(this);
  v6 = *(_DWORD *)((*(uint64_t (**)(uint64_t *))*v5)(v5) + 452);
  memset(&msg[20], 0, 44);
  *(_OWORD *)&msg[4] = 0u;
  *(_QWORD *)&msg[24] = *MEMORY[0x1E0C804E8];
  *(_DWORD *)&msg[32] = a2;
  reply_port = mig_get_reply_port();
  *(_DWORD *)&msg[8] = v6;
  *(_DWORD *)&msg[12] = reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x1F6600000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    reply_port = *(_DWORD *)&msg[12];
  }
  v8 = mach_msg((mach_msg_header_t *)msg, 275, 0x24u, 0x40u, reply_port, 0x493E0u, 0);
  v9 = v8;
  if ((v8 - 268435458) <= 0xE && ((1 << (v8 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&msg[12]);
  }
  else
  {
    if (!(_DWORD)v8)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        v10 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 8138)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 36)
          {
            v10 = 4294966996;
            if (*(_DWORD *)&msg[32])
            {
              if (*(_DWORD *)&msg[8])
                v10 = 4294966996;
              else
                v10 = *(unsigned int *)&msg[32];
            }
          }
          else
          {
            v10 = 4294966996;
          }
          goto LABEL_28;
        }
        v10 = 4294966996;
        if (*(_DWORD *)&msg[24] == 1
          && *(_DWORD *)&msg[4] == 56
          && !*(_DWORD *)&msg[8]
          && msg[39] == 1
          && *(_DWORD *)&msg[40] == *(_DWORD *)&msg[52])
        {
          *(_QWORD *)msg = *(_QWORD *)&msg[28];
          *(_DWORD *)&msg[8] = *(_DWORD *)&msg[40];
          *(_DWORD *)&msg[12] = 1;
          *(_QWORD *)&msg[16] = 0;
          *a3 = CFDataCreate(0, *(const UInt8 **)&msg[28], *(unsigned int *)&msg[40]);
          IPCBufferReader::~IPCBufferReader((IPCBufferReader *)msg);
          return 0;
        }
      }
      else
      {
        v10 = 4294966995;
      }
LABEL_28:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v10;
    }
    mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
  }
  v10 = 268435460;
  if ((_DWORD)v9 == 268435460)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&msg[12]);
    goto LABEL_28;
  }
  return v9;
}

void sub_1D4F06BBC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  IPCBufferReader::~IPCBufferReader((IPCBufferReader *)va);
  _Unwind_Resume(a1);
}

uint64_t MIGClient::MIDIThruConnectionSetParams(MIGClient *this, int a2, CFDataRef theData)
{
  MIDIProcess *v4;
  uint64_t v5;
  uint64_t *v6;
  mach_port_t v7;
  mach_port_t reply_port;
  uint64_t v9;
  uint64_t v10;
  void *v12;
  uint64_t v13;
  int v14;
  mach_msg_header_t msg;
  int v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t v20;
  int v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  LODWORD(v12) = 0;
  v13 = 0;
  v4 = (MIDIProcess *)IPCBufferWriter::write((IPCBufferWriter *)&v12, theData, 0, 0);
  v5 = (uint64_t)v4;
  if (!(_DWORD)v4)
  {
    v6 = MIDIProcess::defaultInstance(v4);
    v7 = *(_DWORD *)((*(uint64_t (**)(uint64_t *))*v6)(v6) + 452);
    v16 = 1;
    v17 = v13;
    v18 = 16777472;
    v19 = v14;
    v20 = *MEMORY[0x1E0C804E8];
    v21 = a2;
    v22 = v14;
    reply_port = mig_get_reply_port();
    *(_QWORD *)&msg.msgh_bits = 2147489043;
    msg.msgh_remote_port = v7;
    msg.msgh_local_port = reply_port;
    *(_QWORD *)&msg.msgh_voucher_port = 0x1F6700000000;
    if (MEMORY[0x1E0C85B60])
    {
      voucher_mach_msg_set(&msg);
      reply_port = msg.msgh_local_port;
    }
    v9 = mach_msg(&msg, 275, 0x3Cu, 0x2Cu, reply_port, 0x493E0u, 0);
    v5 = v9;
    if ((v9 - 268435458) <= 0xE && ((1 << (v9 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(msg.msgh_local_port);
    }
    else
    {
      if (!(_DWORD)v9)
      {
        if (msg.msgh_id == 71)
        {
          v10 = 4294966988;
        }
        else if (msg.msgh_id == 8139)
        {
          v10 = 4294966996;
          if ((msg.msgh_bits & 0x80000000) == 0 && msg.msgh_size == 36 && !msg.msgh_remote_port)
          {
            v10 = HIDWORD(v17);
            if (!HIDWORD(v17))
            {
              v5 = 0;
              goto LABEL_22;
            }
          }
        }
        else
        {
          v10 = 4294966995;
        }
LABEL_21:
        mach_msg_destroy(&msg);
        v5 = v10;
        goto LABEL_22;
      }
      mig_dealloc_reply_port(msg.msgh_local_port);
    }
    v10 = 268435460;
    if ((_DWORD)v5 == 268435460)
    {
      if ((msg.msgh_bits & 0x1F00) == 0x1100)
        mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg.msgh_local_port);
      goto LABEL_21;
    }
  }
LABEL_22:
  IPCBufferWriter::~IPCBufferWriter(&v12);
  return v5;
}

void sub_1D4F06DD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  IPCBufferWriter::~IPCBufferWriter(&a9);
  _Unwind_Resume(a1);
}

uint64_t MIGClient::MIDIThruConnectionFind(MIGClient *this, const __CFString *a2, const __CFData **a3)
{
  MIDIProcess *v4;
  uint64_t v5;
  uint64_t *v6;
  unsigned int v7;
  mach_port_t v8;
  uint64_t msgh_remote_port;
  mach_msg_size_t v10;
  mach_port_name_t reply_port;
  uint64_t v12;
  void *v14[2];
  unsigned int v15;
  mach_msg_header_t msg[2];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  LODWORD(v14[0]) = 0;
  v14[1] = 0;
  v4 = (MIDIProcess *)IPCBufferWriter::write((IPCBufferWriter *)v14, a2, 0, 0);
  v5 = (uint64_t)v4;
  if (!(_DWORD)v4)
  {
    v6 = MIDIProcess::defaultInstance(v4);
    v7 = *(_DWORD *)((*(uint64_t (**)(uint64_t *))*v6)(v6) + 452);
    v8 = v15;
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v21 = 0u;
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    memset(msg, 0, sizeof(msg));
    *(_QWORD *)&msg[1].msgh_bits = *MEMORY[0x1E0C804E8];
    if (v15 > 0x200)
    {
      msgh_remote_port = 4294966989;
LABEL_31:
      v5 = msgh_remote_port;
      goto LABEL_32;
    }
    __memcpy_chk();
    msg[1].msgh_remote_port = v8;
    v10 = ((v8 + 3) & 0xFFFFFFFC) + 36;
    reply_port = mig_get_reply_port();
    *(_QWORD *)&msg[0].msgh_remote_port = __PAIR64__(reply_port, v7);
    msg[0].msgh_bits = 5395;
    *(_QWORD *)&msg[0].msgh_voucher_port = 0x1F6800000000;
    if (MEMORY[0x1E0C85B60])
    {
      voucher_mach_msg_set(msg);
      reply_port = msg[0].msgh_local_port;
    }
    v12 = mach_msg(msg, 275, v10, 0x40u, reply_port, 0x493E0u, 0);
    v5 = v12;
    if ((v12 - 268435458) <= 0xE && ((1 << (v12 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(msg[0].msgh_local_port);
    }
    else
    {
      if (!(_DWORD)v12)
      {
        if (msg[0].msgh_id == 71)
        {
          msgh_remote_port = 4294966988;
        }
        else if (msg[0].msgh_id == 8140)
        {
          if ((msg[0].msgh_bits & 0x80000000) == 0)
          {
            if (msg[0].msgh_size == 36)
            {
              msgh_remote_port = 4294966996;
              if (msg[1].msgh_remote_port)
              {
                if (msg[0].msgh_remote_port)
                  msgh_remote_port = 4294966996;
                else
                  msgh_remote_port = msg[1].msgh_remote_port;
              }
            }
            else
            {
              msgh_remote_port = 4294966996;
            }
            goto LABEL_30;
          }
          msgh_remote_port = 4294966996;
          if (msg[1].msgh_bits == 1
            && *(_QWORD *)&msg[0].msgh_size == 56
            && HIBYTE(msg[1].msgh_local_port) == 1
            && msg[1].msgh_voucher_port == DWORD1(v17))
          {
            *(_QWORD *)&msg[0].msgh_bits = *(_QWORD *)&msg[1].msgh_size;
            *(_QWORD *)&msg[0].msgh_remote_port = msg[1].msgh_voucher_port | 0x100000000;
            *(_QWORD *)&msg[0].msgh_voucher_port = 0;
            *a3 = CFDataCreate(0, *(const UInt8 **)&msg[1].msgh_size, msg[1].msgh_voucher_port);
            IPCBufferReader::~IPCBufferReader((IPCBufferReader *)msg);
            v5 = 0;
            goto LABEL_32;
          }
        }
        else
        {
          msgh_remote_port = 4294966995;
        }
LABEL_30:
        mach_msg_destroy(msg);
        goto LABEL_31;
      }
      mig_dealloc_reply_port(msg[0].msgh_local_port);
    }
    msgh_remote_port = 268435460;
    if ((_DWORD)v5 == 268435460)
    {
      if ((msg[0].msgh_bits & 0x1F00) == 0x1100)
        mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg[0].msgh_local_port);
      goto LABEL_30;
    }
  }
LABEL_32:
  IPCBufferWriter::~IPCBufferWriter(v14);
  return v5;
}

void sub_1D4F070C0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v3;
  va_list va;
  uint64_t v5;
  uint64_t v6;
  va_list va1;

  va_start(va1, a2);
  va_start(va, a2);
  v3 = va_arg(va1, void *);
  v5 = va_arg(va1, _QWORD);
  v6 = va_arg(va1, _QWORD);
  IPCBufferReader::~IPCBufferReader((IPCBufferReader *)va1);
  IPCBufferWriter::~IPCBufferWriter((void **)va);
  _Unwind_Resume(a1);
}

uint64_t MIGClient::MIDISetupCreate_Priv(MIGClient *this, unsigned int *a2)
{
  uint64_t *v3;
  int v4;
  mach_port_name_t reply_port;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  int v10;
  int rcv_name;
  int rcv_name_4;
  mach_port_t rcv_name_8;
  _BYTE rcv_name_12[32];

  v3 = MIDIProcess::defaultInstance(this);
  v4 = *(_DWORD *)((*(uint64_t (**)(uint64_t *))*v3)(v3) + 452);
  memset(&rcv_name_12[4], 0, 28);
  rcv_name = 0;
  reply_port = mig_get_reply_port();
  rcv_name_4 = v4;
  rcv_name_8 = reply_port;
  v10 = 5395;
  *(_QWORD *)rcv_name_12 = 0x1F5A00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    reply_port = rcv_name_8;
  }
  v6 = mach_msg((mach_msg_header_t *)&v10, 275, 0x18u, 0x30u, reply_port, 0x493E0u, 0);
  v7 = v6;
  if ((v6 - 268435458) <= 0xE && ((1 << (v6 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(rcv_name_8);
    goto LABEL_19;
  }
  if (!(_DWORD)v6)
  {
    if (*(_DWORD *)&rcv_name_12[4] == 71)
    {
      v7 = 4294966988;
    }
    else if (*(_DWORD *)&rcv_name_12[4] == 8126)
    {
      if ((v10 & 0x80000000) == 0)
      {
        if (rcv_name == 40)
        {
          if (!rcv_name_4)
          {
            v7 = *(unsigned int *)&rcv_name_12[16];
            if (!*(_DWORD *)&rcv_name_12[16])
            {
              *a2 = *(_DWORD *)&rcv_name_12[20];
              return v7;
            }
            goto LABEL_27;
          }
        }
        else if (rcv_name == 36)
        {
          if (rcv_name_4)
            v8 = 1;
          else
            v8 = *(_DWORD *)&rcv_name_12[16] == 0;
          if (v8)
            v7 = 4294966996;
          else
            v7 = *(unsigned int *)&rcv_name_12[16];
          goto LABEL_27;
        }
      }
      v7 = 4294966996;
    }
    else
    {
      v7 = 4294966995;
    }
LABEL_27:
    mach_msg_destroy((mach_msg_header_t *)&v10);
    return v7;
  }
  mig_dealloc_reply_port(rcv_name_8);
LABEL_19:
  if ((_DWORD)v7 == 268435460)
  {
    if ((v10 & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], rcv_name_8);
    mach_msg_destroy((mach_msg_header_t *)&v10);
    return 268435460;
  }
  return v7;
}

uint64_t MIGClient::MIDISetupGetCurrent_Priv(MIGClient *this, unsigned int *a2)
{
  uint64_t *v3;
  int v4;
  mach_port_name_t reply_port;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  int v10;
  int rcv_name;
  int rcv_name_4;
  mach_port_t rcv_name_8;
  _BYTE rcv_name_12[32];

  v3 = MIDIProcess::defaultInstance(this);
  v4 = *(_DWORD *)((*(uint64_t (**)(uint64_t *))*v3)(v3) + 452);
  memset(&rcv_name_12[4], 0, 28);
  rcv_name = 0;
  reply_port = mig_get_reply_port();
  rcv_name_4 = v4;
  rcv_name_8 = reply_port;
  v10 = 5395;
  *(_QWORD *)rcv_name_12 = 0x1F5D00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    reply_port = rcv_name_8;
  }
  v6 = mach_msg((mach_msg_header_t *)&v10, 275, 0x18u, 0x30u, reply_port, 0x493E0u, 0);
  v7 = v6;
  if ((v6 - 268435458) <= 0xE && ((1 << (v6 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(rcv_name_8);
    goto LABEL_19;
  }
  if (!(_DWORD)v6)
  {
    if (*(_DWORD *)&rcv_name_12[4] == 71)
    {
      v7 = 4294966988;
    }
    else if (*(_DWORD *)&rcv_name_12[4] == 8129)
    {
      if ((v10 & 0x80000000) == 0)
      {
        if (rcv_name == 40)
        {
          if (!rcv_name_4)
          {
            v7 = *(unsigned int *)&rcv_name_12[16];
            if (!*(_DWORD *)&rcv_name_12[16])
            {
              *a2 = *(_DWORD *)&rcv_name_12[20];
              return v7;
            }
            goto LABEL_27;
          }
        }
        else if (rcv_name == 36)
        {
          if (rcv_name_4)
            v8 = 1;
          else
            v8 = *(_DWORD *)&rcv_name_12[16] == 0;
          if (v8)
            v7 = 4294966996;
          else
            v7 = *(unsigned int *)&rcv_name_12[16];
          goto LABEL_27;
        }
      }
      v7 = 4294966996;
    }
    else
    {
      v7 = 4294966995;
    }
LABEL_27:
    mach_msg_destroy((mach_msg_header_t *)&v10);
    return v7;
  }
  mig_dealloc_reply_port(rcv_name_8);
LABEL_19:
  if ((_DWORD)v7 == 268435460)
  {
    if ((v10 & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], rcv_name_8);
    mach_msg_destroy((mach_msg_header_t *)&v10);
    return 268435460;
  }
  return v7;
}

uint64_t MIGClient::MIDISetupInstall_Priv(MIGClient *this, int a2)
{
  uint64_t *v3;
  int v4;
  mach_port_name_t reply_port;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE msg[36];
  uint64_t v11;

  v3 = MIDIProcess::defaultInstance(this);
  v4 = *(_DWORD *)((*(uint64_t (**)(uint64_t *))*v3)(v3) + 452);
  *(_OWORD *)&msg[20] = 0u;
  v11 = 0;
  *(_OWORD *)&msg[4] = 0u;
  *(_QWORD *)&msg[24] = *MEMORY[0x1E0C804E8];
  *(_DWORD *)&msg[32] = a2;
  reply_port = mig_get_reply_port();
  *(_DWORD *)&msg[8] = v4;
  *(_DWORD *)&msg[12] = reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x1F5C00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    reply_port = *(_DWORD *)&msg[12];
  }
  v6 = mach_msg((mach_msg_header_t *)msg, 275, 0x24u, 0x2Cu, reply_port, 0x493E0u, 0);
  v7 = v6;
  if ((v6 - 268435458) <= 0xE && ((1 << (v6 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&msg[12]);
  }
  else
  {
    if (!(_DWORD)v6)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        v8 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 8128)
      {
        v8 = 4294966996;
        if ((*(_DWORD *)msg & 0x80000000) == 0 && *(_DWORD *)&msg[4] == 36 && !*(_DWORD *)&msg[8])
        {
          v8 = *(unsigned int *)&msg[32];
          if (!*(_DWORD *)&msg[32])
            return 0;
        }
      }
      else
      {
        v8 = 4294966995;
      }
LABEL_20:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v8;
    }
    mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
  }
  v8 = 268435460;
  if ((_DWORD)v7 == 268435460)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&msg[12]);
    goto LABEL_20;
  }
  return v7;
}

uint64_t MIGClient::MIDISetupFromData_Priv(MIGClient *this, const __CFData *a2, unsigned int *a3)
{
  MIDIProcess *v4;
  uint64_t v5;
  uint64_t *v7;
  mach_port_t v8;
  mach_port_t reply_port;
  uint64_t v10;
  BOOL v11;
  void *v12;
  uint64_t v13;
  int v14;
  mach_msg_header_t msg;
  int v16;
  uint64_t v17;
  unsigned int v18;
  int v19;
  uint64_t v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  LODWORD(v12) = 0;
  v13 = 0;
  v4 = (MIDIProcess *)IPCBufferWriter::write((IPCBufferWriter *)&v12, a2, 0, 0);
  v5 = (uint64_t)v4;
  if ((_DWORD)v4)
    goto LABEL_2;
  v7 = MIDIProcess::defaultInstance(v4);
  v8 = *(_DWORD *)((*(uint64_t (**)(uint64_t *))*v7)(v7) + 452);
  v16 = 1;
  v17 = v13;
  v18 = 16777472;
  v19 = v14;
  v20 = *MEMORY[0x1E0C804E8];
  v21 = v14;
  reply_port = mig_get_reply_port();
  *(_QWORD *)&msg.msgh_bits = 2147489043;
  msg.msgh_remote_port = v8;
  msg.msgh_local_port = reply_port;
  *(_QWORD *)&msg.msgh_voucher_port = 0x1F5B00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&msg);
    reply_port = msg.msgh_local_port;
  }
  v10 = mach_msg(&msg, 275, 0x38u, 0x30u, reply_port, 0x493E0u, 0);
  v5 = v10;
  if ((v10 - 268435458) <= 0xE && ((1 << (v10 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
    goto LABEL_21;
  }
  if (!(_DWORD)v10)
  {
    if (msg.msgh_id == 71)
    {
      v5 = 4294966988;
    }
    else if (msg.msgh_id == 8127)
    {
      if ((msg.msgh_bits & 0x80000000) == 0)
      {
        if (msg.msgh_size == 40)
        {
          if (!msg.msgh_remote_port)
          {
            v5 = HIDWORD(v17);
            if (!HIDWORD(v17))
            {
              *a3 = v18;
              goto LABEL_2;
            }
            goto LABEL_29;
          }
        }
        else if (msg.msgh_size == 36)
        {
          if (msg.msgh_remote_port)
            v11 = 1;
          else
            v11 = HIDWORD(v17) == 0;
          if (v11)
            v5 = 4294966996;
          else
            v5 = HIDWORD(v17);
          goto LABEL_29;
        }
      }
      v5 = 4294966996;
    }
    else
    {
      v5 = 4294966995;
    }
LABEL_29:
    mach_msg_destroy(&msg);
    goto LABEL_2;
  }
  mig_dealloc_reply_port(msg.msgh_local_port);
LABEL_21:
  if ((_DWORD)v5 == 268435460)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg.msgh_local_port);
    mach_msg_destroy(&msg);
    v5 = 268435460;
  }
LABEL_2:
  IPCBufferWriter::~IPCBufferWriter(&v12);
  return v5;
}

void sub_1D4F07830(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  IPCBufferWriter::~IPCBufferWriter((void **)va);
  _Unwind_Resume(a1);
}

uint64_t MIGClient::MIDIInputPortCreateInternal(MIGClient *this, int a2, CFStringRef theString, MIDIProtocolID a4, unsigned int *a5)
{
  MIDIProcess *v8;
  uint64_t v9;
  uint64_t *v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  mach_msg_size_t v14;
  mach_port_name_t reply_port;
  uint64_t v16;
  BOOL v17;
  void *v19[2];
  unsigned int v20;
  _BYTE msg[32];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  LODWORD(v19[0]) = 0;
  v19[1] = 0;
  v8 = (MIDIProcess *)IPCBufferWriter::write((IPCBufferWriter *)v19, theString, 0, 0);
  v9 = (uint64_t)v8;
  if ((_DWORD)v8)
    goto LABEL_31;
  v10 = MIDIProcess::defaultInstance(v8);
  v11 = *(_DWORD *)((*(uint64_t (**)(uint64_t *))*v10)(v10) + 452);
  v12 = v20;
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v27 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v22 = 0u;
  memset(msg, 0, sizeof(msg));
  *(_QWORD *)&msg[24] = *MEMORY[0x1E0C804E8];
  LODWORD(v22) = a2;
  if (v20 > 0x200)
  {
    v9 = 4294966989;
    goto LABEL_31;
  }
  __memcpy_chk();
  DWORD1(v22) = v12;
  v13 = (v12 + 3) & 0xFFFFFFFC;
  v14 = v13 + 44;
  *(_DWORD *)&msg[v13 + 40] = a4;
  reply_port = mig_get_reply_port();
  *(_QWORD *)&msg[8] = __PAIR64__(reply_port, v11);
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x1F4400000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    reply_port = *(_DWORD *)&msg[12];
  }
  v16 = mach_msg((mach_msg_header_t *)msg, 275, v14, 0x30u, reply_port, 0x493E0u, 0);
  v9 = v16;
  if ((v16 - 268435458) <= 0xE && ((1 << (v16 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&msg[12]);
    goto LABEL_22;
  }
  if (!(_DWORD)v16)
  {
    if (*(_DWORD *)&msg[20] == 71)
    {
      v9 = 4294966988;
    }
    else if (*(_DWORD *)&msg[20] == 8104)
    {
      if ((*(_DWORD *)msg & 0x80000000) == 0)
      {
        if (*(_DWORD *)&msg[4] == 40)
        {
          if (!*(_DWORD *)&msg[8])
          {
            v9 = v22;
            if (!(_DWORD)v22)
            {
              *a5 = DWORD1(v22);
              goto LABEL_31;
            }
            goto LABEL_30;
          }
        }
        else if (*(_DWORD *)&msg[4] == 36)
        {
          if (*(_DWORD *)&msg[8])
            v17 = 1;
          else
            v17 = (_DWORD)v22 == 0;
          if (v17)
            v9 = 4294966996;
          else
            v9 = v22;
          goto LABEL_30;
        }
      }
      v9 = 4294966996;
    }
    else
    {
      v9 = 4294966995;
    }
LABEL_30:
    mach_msg_destroy((mach_msg_header_t *)msg);
    goto LABEL_31;
  }
  mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
LABEL_22:
  if ((_DWORD)v9 == 268435460)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&msg[12]);
    mach_msg_destroy((mach_msg_header_t *)msg);
    v9 = 268435460;
  }
LABEL_31:
  IPCBufferWriter::~IPCBufferWriter(v19);
  return v9;
}

void sub_1D4F07B08(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  IPCBufferWriter::~IPCBufferWriter((void **)va);
  _Unwind_Resume(a1);
}

uint64_t MIGClient::MIDIDestinationCreateInternal(MIGClient *this, int a2, CFStringRef theString, MIDIProtocolID a4, unsigned int *a5)
{
  MIDIProcess *v8;
  uint64_t v9;
  uint64_t *v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  mach_msg_size_t v14;
  mach_port_name_t reply_port;
  uint64_t v16;
  BOOL v17;
  void *v19[2];
  unsigned int v20;
  _BYTE msg[32];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  LODWORD(v19[0]) = 0;
  v19[1] = 0;
  v8 = (MIDIProcess *)IPCBufferWriter::write((IPCBufferWriter *)v19, theString, 0, 0);
  v9 = (uint64_t)v8;
  if ((_DWORD)v8)
    goto LABEL_31;
  v10 = MIDIProcess::defaultInstance(v8);
  v11 = *(_DWORD *)((*(uint64_t (**)(uint64_t *))*v10)(v10) + 452);
  v12 = v20;
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v27 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v22 = 0u;
  memset(msg, 0, sizeof(msg));
  *(_QWORD *)&msg[24] = *MEMORY[0x1E0C804E8];
  LODWORD(v22) = a2;
  if (v20 > 0x200)
  {
    v9 = 4294966989;
    goto LABEL_31;
  }
  __memcpy_chk();
  DWORD1(v22) = v12;
  v13 = (v12 + 3) & 0xFFFFFFFC;
  v14 = v13 + 44;
  *(_DWORD *)&msg[v13 + 40] = a4;
  reply_port = mig_get_reply_port();
  *(_QWORD *)&msg[8] = __PAIR64__(reply_port, v11);
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x1F4A00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    reply_port = *(_DWORD *)&msg[12];
  }
  v16 = mach_msg((mach_msg_header_t *)msg, 275, v14, 0x30u, reply_port, 0x493E0u, 0);
  v9 = v16;
  if ((v16 - 268435458) <= 0xE && ((1 << (v16 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&msg[12]);
    goto LABEL_22;
  }
  if (!(_DWORD)v16)
  {
    if (*(_DWORD *)&msg[20] == 71)
    {
      v9 = 4294966988;
    }
    else if (*(_DWORD *)&msg[20] == 8110)
    {
      if ((*(_DWORD *)msg & 0x80000000) == 0)
      {
        if (*(_DWORD *)&msg[4] == 40)
        {
          if (!*(_DWORD *)&msg[8])
          {
            v9 = v22;
            if (!(_DWORD)v22)
            {
              *a5 = DWORD1(v22);
              goto LABEL_31;
            }
            goto LABEL_30;
          }
        }
        else if (*(_DWORD *)&msg[4] == 36)
        {
          if (*(_DWORD *)&msg[8])
            v17 = 1;
          else
            v17 = (_DWORD)v22 == 0;
          if (v17)
            v9 = 4294966996;
          else
            v9 = v22;
          goto LABEL_30;
        }
      }
      v9 = 4294966996;
    }
    else
    {
      v9 = 4294966995;
    }
LABEL_30:
    mach_msg_destroy((mach_msg_header_t *)msg);
    goto LABEL_31;
  }
  mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
LABEL_22:
  if ((_DWORD)v9 == 268435460)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&msg[12]);
    mach_msg_destroy((mach_msg_header_t *)msg);
    v9 = 268435460;
  }
LABEL_31:
  IPCBufferWriter::~IPCBufferWriter(v19);
  return v9;
}

void sub_1D4F07DE0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  IPCBufferWriter::~IPCBufferWriter((void **)va);
  _Unwind_Resume(a1);
}

uint64_t MIGClient::UMPCIObjectCreate(int a1, int a2, void *a3, int *a4)
{
  MIDIProcess *v6;
  uint64_t v7;
  uint64_t *v9;
  mach_port_t v10;
  mach_port_t reply_port;
  uint64_t v12;
  BOOL v13;
  void *v14;
  uint64_t v15;
  int v16;
  mach_msg_header_t msg;
  int v18;
  uint64_t v19;
  int v20;
  int v21;
  uint64_t v22;
  int v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  LODWORD(v14) = 0;
  v15 = 0;
  v6 = (MIDIProcess *)IPCBufferWriter::write((IPCBufferWriter *)&v14, a3, 0, 0);
  v7 = (uint64_t)v6;
  if ((_DWORD)v6)
    goto LABEL_2;
  v9 = MIDIProcess::defaultInstance(v6);
  v10 = *(_DWORD *)((*(uint64_t (**)(uint64_t *))*v9)(v9) + 452);
  v18 = 1;
  v19 = v15;
  v20 = 16777472;
  v21 = v16;
  v22 = *MEMORY[0x1E0C804E8];
  v23 = a2;
  v24 = v16;
  reply_port = mig_get_reply_port();
  *(_QWORD *)&msg.msgh_bits = 2147489043;
  msg.msgh_remote_port = v10;
  msg.msgh_local_port = reply_port;
  *(_QWORD *)&msg.msgh_voucher_port = 0x1F6B00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&msg);
    reply_port = msg.msgh_local_port;
  }
  v12 = mach_msg(&msg, 275, 0x3Cu, 0x30u, reply_port, 0x493E0u, 0);
  v7 = v12;
  if ((v12 - 268435458) <= 0xE && ((1 << (v12 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
    goto LABEL_21;
  }
  if (!(_DWORD)v12)
  {
    if (msg.msgh_id == 71)
    {
      v7 = 4294966988;
    }
    else if (msg.msgh_id == 8143)
    {
      if ((msg.msgh_bits & 0x80000000) == 0)
      {
        if (msg.msgh_size == 40)
        {
          if (!msg.msgh_remote_port)
          {
            v7 = HIDWORD(v19);
            if (!HIDWORD(v19))
            {
              *a4 = v20;
              goto LABEL_2;
            }
            goto LABEL_29;
          }
        }
        else if (msg.msgh_size == 36)
        {
          if (msg.msgh_remote_port)
            v13 = 1;
          else
            v13 = HIDWORD(v19) == 0;
          if (v13)
            v7 = 4294966996;
          else
            v7 = HIDWORD(v19);
          goto LABEL_29;
        }
      }
      v7 = 4294966996;
    }
    else
    {
      v7 = 4294966995;
    }
LABEL_29:
    mach_msg_destroy(&msg);
    goto LABEL_2;
  }
  mig_dealloc_reply_port(msg.msgh_local_port);
LABEL_21:
  if ((_DWORD)v7 == 268435460)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg.msgh_local_port);
    mach_msg_destroy(&msg);
    v7 = 268435460;
  }
LABEL_2:
  IPCBufferWriter::~IPCBufferWriter(&v14);
  return v7;
}

void sub_1D4F08040(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  IPCBufferWriter::~IPCBufferWriter(&a9);
  _Unwind_Resume(a1);
}

uint64_t MIGClient::UMPCIObjectDispose(MIGClient *this, int a2)
{
  uint64_t *v3;
  int v4;
  mach_port_name_t reply_port;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE msg[36];
  uint64_t v11;

  v3 = MIDIProcess::defaultInstance(this);
  v4 = *(_DWORD *)((*(uint64_t (**)(uint64_t *))*v3)(v3) + 452);
  *(_OWORD *)&msg[20] = 0u;
  v11 = 0;
  *(_OWORD *)&msg[4] = 0u;
  *(_QWORD *)&msg[24] = *MEMORY[0x1E0C804E8];
  *(_DWORD *)&msg[32] = a2;
  reply_port = mig_get_reply_port();
  *(_DWORD *)&msg[8] = v4;
  *(_DWORD *)&msg[12] = reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x1F6C00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    reply_port = *(_DWORD *)&msg[12];
  }
  v6 = mach_msg((mach_msg_header_t *)msg, 275, 0x24u, 0x2Cu, reply_port, 0x493E0u, 0);
  v7 = v6;
  if ((v6 - 268435458) <= 0xE && ((1 << (v6 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&msg[12]);
  }
  else
  {
    if (!(_DWORD)v6)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        v8 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 8144)
      {
        v8 = 4294966996;
        if ((*(_DWORD *)msg & 0x80000000) == 0 && *(_DWORD *)&msg[4] == 36 && !*(_DWORD *)&msg[8])
        {
          v8 = *(unsigned int *)&msg[32];
          if (!*(_DWORD *)&msg[32])
            return 0;
        }
      }
      else
      {
        v8 = 4294966995;
      }
LABEL_20:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v8;
    }
    mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
  }
  v8 = 268435460;
  if ((_DWORD)v7 == 268435460)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&msg[12]);
    goto LABEL_20;
  }
  return v7;
}

uint64_t MIGClient::UMPCIObjectGetDescription(MIGClient *this, uint64_t a2, const __CFDictionary **a3)
{
  return (*(uint64_t (**)(MIGClient *, uint64_t, const __CFString *, const __CFDictionary **))(*(_QWORD *)this + 128))(this, a2, CFSTR("object description"), a3);
}

uint64_t MIGClient::UMPCIObjectSetDescription(MIGClient *this, int a2, const __CFDictionary *a3)
{
  MIDIProcess *v4;
  uint64_t v5;
  uint64_t *v6;
  mach_port_t v7;
  mach_port_t reply_port;
  uint64_t v9;
  uint64_t v10;
  void *v12;
  uint64_t v13;
  int v14;
  mach_msg_header_t msg;
  int v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t v20;
  int v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  LODWORD(v12) = 0;
  v13 = 0;
  v4 = (MIDIProcess *)IPCBufferWriter::write((IPCBufferWriter *)&v12, a3, 0, 0);
  v5 = (uint64_t)v4;
  if (!(_DWORD)v4)
  {
    v6 = MIDIProcess::defaultInstance(v4);
    v7 = *(_DWORD *)((*(uint64_t (**)(uint64_t *))*v6)(v6) + 452);
    v16 = 1;
    v17 = v13;
    v18 = 16777472;
    v19 = v14;
    v20 = *MEMORY[0x1E0C804E8];
    v21 = a2;
    v22 = v14;
    reply_port = mig_get_reply_port();
    *(_QWORD *)&msg.msgh_bits = 2147489043;
    msg.msgh_remote_port = v7;
    msg.msgh_local_port = reply_port;
    *(_QWORD *)&msg.msgh_voucher_port = 0x1F6D00000000;
    if (MEMORY[0x1E0C85B60])
    {
      voucher_mach_msg_set(&msg);
      reply_port = msg.msgh_local_port;
    }
    v9 = mach_msg(&msg, 275, 0x3Cu, 0x2Cu, reply_port, 0x493E0u, 0);
    v5 = v9;
    if ((v9 - 268435458) <= 0xE && ((1 << (v9 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(msg.msgh_local_port);
    }
    else
    {
      if (!(_DWORD)v9)
      {
        if (msg.msgh_id == 71)
        {
          v10 = 4294966988;
        }
        else if (msg.msgh_id == 8145)
        {
          v10 = 4294966996;
          if ((msg.msgh_bits & 0x80000000) == 0 && msg.msgh_size == 36 && !msg.msgh_remote_port)
          {
            v10 = HIDWORD(v17);
            if (!HIDWORD(v17))
            {
              v5 = 0;
              goto LABEL_22;
            }
          }
        }
        else
        {
          v10 = 4294966995;
        }
LABEL_21:
        mach_msg_destroy(&msg);
        v5 = v10;
        goto LABEL_22;
      }
      mig_dealloc_reply_port(msg.msgh_local_port);
    }
    v10 = 268435460;
    if ((_DWORD)v5 == 268435460)
    {
      if ((msg.msgh_bits & 0x1F00) == 0x1100)
        mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg.msgh_local_port);
      goto LABEL_21;
    }
  }
LABEL_22:
  IPCBufferWriter::~IPCBufferWriter(&v12);
  return v5;
}

void sub_1D4F08408(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  IPCBufferWriter::~IPCBufferWriter(&a9);
  _Unwind_Resume(a1);
}

uint64_t MIGClient::UMPCIObjectSetEnableState(MIGClient *this, int a2, int a3)
{
  uint64_t *v5;
  int v6;
  mach_port_name_t reply_port;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE msg[36];
  uint64_t v13;

  v5 = MIDIProcess::defaultInstance(this);
  v6 = *(_DWORD *)((*(uint64_t (**)(uint64_t *))*v5)(v5) + 452);
  *(_OWORD *)&msg[20] = 0u;
  v13 = 0;
  *(_OWORD *)&msg[4] = 0u;
  *(_QWORD *)&msg[24] = *MEMORY[0x1E0C804E8];
  *(_DWORD *)&msg[32] = a2;
  LODWORD(v13) = a3;
  reply_port = mig_get_reply_port();
  *(_DWORD *)&msg[8] = v6;
  *(_DWORD *)&msg[12] = reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x1F6E00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    reply_port = *(_DWORD *)&msg[12];
  }
  v8 = mach_msg((mach_msg_header_t *)msg, 275, 0x28u, 0x2Cu, reply_port, 0x493E0u, 0);
  v9 = v8;
  if ((v8 - 268435458) <= 0xE && ((1 << (v8 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&msg[12]);
  }
  else
  {
    if (!(_DWORD)v8)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        v10 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 8146)
      {
        v10 = 4294966996;
        if ((*(_DWORD *)msg & 0x80000000) == 0 && *(_DWORD *)&msg[4] == 36 && !*(_DWORD *)&msg[8])
        {
          v10 = *(unsigned int *)&msg[32];
          if (!*(_DWORD *)&msg[32])
            return 0;
        }
      }
      else
      {
        v10 = 4294966995;
      }
LABEL_20:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v10;
    }
    mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
  }
  v10 = 268435460;
  if ((_DWORD)v9 == 268435460)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&msg[12]);
    goto LABEL_20;
  }
  return v9;
}

uint64_t MIGClient::UMPCIGlobalState(MIGClient *this, const UInt8 **a2)
{
  uint64_t *v3;
  int v4;
  mach_port_name_t reply_port;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE msg[12];
  mach_port_t msg_12;
  _BYTE msg_16[48];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = MIDIProcess::defaultInstance(this);
  v4 = *(_DWORD *)((*(uint64_t (**)(uint64_t *))*v3)(v3) + 452);
  memset(&msg_16[4], 0, 44);
  reply_port = mig_get_reply_port();
  *(_DWORD *)&msg[8] = v4;
  msg_12 = reply_port;
  *(_QWORD *)msg = 5395;
  *(_QWORD *)msg_16 = 0x1F6F00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    reply_port = msg_12;
  }
  v6 = mach_msg((mach_msg_header_t *)msg, 275, 0x18u, 0x40u, reply_port, 0x493E0u, 0);
  v7 = v6;
  if ((v6 - 268435458) <= 0xE && ((1 << (v6 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg_12);
  }
  else
  {
    if (!(_DWORD)v6)
    {
      if (*(_DWORD *)&msg_16[4] == 71)
      {
        v10 = 4294966988;
      }
      else if (*(_DWORD *)&msg_16[4] == 8147)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 36)
          {
            v10 = 4294966996;
            if (*(_DWORD *)&msg_16[16])
            {
              if (*(_DWORD *)&msg[8])
                v10 = 4294966996;
              else
                v10 = *(unsigned int *)&msg_16[16];
            }
          }
          else
          {
            v10 = 4294966996;
          }
          goto LABEL_29;
        }
        v10 = 4294966996;
        if (*(_DWORD *)&msg_16[8] == 1 && *(_QWORD *)&msg[4] == 56 && msg_16[23] == 1)
        {
          v8 = *(_DWORD *)&msg_16[24];
          if (*(_DWORD *)&msg_16[24] == *(_DWORD *)&msg_16[36])
          {
            v9 = *(_QWORD *)&msg_16[12];
LABEL_20:
            *(_QWORD *)msg = v9;
            *(_DWORD *)&msg[8] = v8;
            msg_12 = 1;
            *(_QWORD *)msg_16 = 0;
            *a2 = IPCBufferReader::ReadCFPropertyList((const UInt8 **)msg, 1);
            IPCBufferReader::~IPCBufferReader((IPCBufferReader *)msg);
            return 0;
          }
        }
      }
      else
      {
        v10 = 4294966995;
      }
LABEL_29:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v10;
    }
    mig_dealloc_reply_port(msg_12);
  }
  v10 = 268435460;
  if ((_DWORD)v7 == 268435460)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg_12);
    goto LABEL_29;
  }
  if (!(_DWORD)v7)
    goto LABEL_20;
  return v7;
}

void sub_1D4F087FC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  IPCBufferReader::~IPCBufferReader((IPCBufferReader *)va);
  _Unwind_Resume(a1);
}

uint64_t MIGClient::UMPCIDiscover(MIGClient *this)
{
  uint64_t *v1;
  int v2;
  mach_port_name_t reply_port;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE msg[36];
  uint64_t v9;

  v1 = MIDIProcess::defaultInstance(this);
  v2 = *(_DWORD *)((*(uint64_t (**)(uint64_t *))*v1)(v1) + 452);
  *(_OWORD *)&msg[20] = 0u;
  v9 = 0;
  *(_OWORD *)&msg[4] = 0u;
  *(_QWORD *)&msg[24] = *MEMORY[0x1E0C804E8];
  reply_port = mig_get_reply_port();
  *(_DWORD *)&msg[8] = v2;
  *(_DWORD *)&msg[12] = reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x1F7000000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    reply_port = *(_DWORD *)&msg[12];
  }
  v4 = mach_msg((mach_msg_header_t *)msg, 275, 0x24u, 0x2Cu, reply_port, 0x493E0u, 0);
  v5 = v4;
  if ((v4 - 268435458) <= 0xE && ((1 << (v4 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&msg[12]);
  }
  else
  {
    if (!(_DWORD)v4)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        v6 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 8148)
      {
        v6 = 4294966996;
        if ((*(_DWORD *)msg & 0x80000000) == 0 && *(_DWORD *)&msg[4] == 36 && !*(_DWORD *)&msg[8])
        {
          v6 = *(unsigned int *)&msg[32];
          if (!*(_DWORD *)&msg[32])
            return 0;
        }
      }
      else
      {
        v6 = 4294966995;
      }
LABEL_20:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v6;
    }
    mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
  }
  v6 = 268435460;
  if ((_DWORD)v5 == 268435460)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&msg[12]);
    goto LABEL_20;
  }
  return v5;
}

_UNKNOWN **ClientInterface::global(ClientInterface *this)
{
  unsigned __int8 v1;
  char *v3;
  int v4;
  int v5;

    goto LABEL_2;
  v3 = getenv("CoreMIDI_ServerVersion");
  if (!v3)
    goto LABEL_17;
  v4 = *v3;
  if (v4 == 49)
  {
    v5 = 1;
    goto LABEL_14;
  }
  if (v4 != 50)
  {
LABEL_17:
    if (_os_feature_enabled_impl())
      v5 = 2;
    else
      v5 = 1;
    goto LABEL_14;
  }
  v5 = 2;
LABEL_14:
  ClientInterface::defaultInterface(int)::cachedVersion = v5;
LABEL_2:
  if (ClientInterface::defaultInterface(int)::cachedVersion == 1)
    return &ClientInterface::defaultInterface(int)::migClient;
  else
    return &ClientInterface::defaultInterface(int)::xpcClient;
}

void sub_1D4F08A60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void MIDIServerMIG::MIDIServerMIG(MIDIServerMIG *this)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  unsigned int *v4;
  int v5;
  int *v6;
  unsigned int ServerPort;
  mach_error_t v8;
  __CFRunLoop *Current;
  _QWORD *v10;
  const __CFString *v11;
  __CFRunLoopSource *v13;
  uint64_t v14;
  int v15;
  __CFRunLoopSource *RunLoopSource;
  __CFMachPort *PortDeathCFPort;
  char *v18;
  char *exception;
  size_t v20;
  char *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  mach_error_t error_value;
  uint8_t v35[16];
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  uint8_t *v41;
  __int16 v42;
  char *v43;
  char __str[16];
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _OWORD v58[18];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  MIDIServer::MIDIServer((MIDIServer *)&MIDIServer::defaultInstance(int)::migServer);
  *v1 = &off_1E98B7F68;
  v2 = operator new();
  *(_QWORD *)v2 = &off_1E98B9C78;
  *(_QWORD *)(v2 + 8) = "MIDIServer";
  *(_QWORD *)(v2 + 16) = MIDIServer_MIDIIPC_subsystem;
  *(_QWORD *)(v2 + 24) = MIDIIPC_server;
  *(_QWORD *)(v2 + 32) = 1580;
  v3 = operator new(0x20uLL);
  v3[1] = 0;
  v3[2] = 0;
  *v3 = &off_1E98BA008;
  *((_DWORD *)v3 + 6) = 0;
  *(_QWORD *)(v2 + 40) = v3 + 3;
  *(_QWORD *)(v2 + 48) = v3;
  *(_QWORD *)(v2 + 56) = 0;
  *(_QWORD *)(v2 + 64) = 0;
  *(_QWORD *)(v2 + 80) = &unk_1E98B9C10;
  *(_BYTE *)(v2 + 72) = 0;
  *(_QWORD *)(v2 + 96) = 0;
  *(_QWORD *)(v2 + 104) = 0;
  *(_QWORD *)(v2 + 88) = 0;
  *(_QWORD *)v2 = off_1E98B9BC8;
  CADeprecated::CAMutex::CAMutex((CADeprecated::CAMutex *)(v2 + 112), "XMachServer.mLock");
  *(_QWORD *)(v2 + 200) = 0;
  *(_QWORD *)(v2 + 208) = 0;
  *(_QWORD *)(v2 + 216) = 0;
  error_value = 0;
  v4 = *(unsigned int **)(v2 + 40);
  ServerPort = CADeprecated::XMachServer::CreateServerPort((CADeprecated::XMachServer *)"com.apple.midiserver", (char *)&error_value, v5, v6);
  CADeprecated::XMachReceivePort::SetMachPort(v4, ServerPort);
  v8 = error_value;
  if (error_value)
  {
    v18 = mach_error_string(error_value);
    snprintf(__str, 0x200uLL, "XMachServer init for service %s failed: %s", "com.apple.midiserver", v18);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      CAX4CCString::CAX4CCString((CAX4CCString *)v35, v8);
      *(_DWORD *)buf = 136315906;
      v37 = "XMachServer.cpp";
      v38 = 1024;
      v39 = 262;
      v40 = 2080;
      v41 = v35;
      v42 = 2080;
      v43 = __str;
      _os_log_impl(&dword_1D4E88000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%25s:%-5d about to throw %s: %s", buf, 0x26u);
    }
    exception = (char *)__cxa_allocate_exception(0x110uLL);
    *(_QWORD *)exception = &off_1E98B9438;
    *((_DWORD *)exception + 66) = v8;
    v20 = strlen(__str);
    v21 = exception + 8;
    if (v20 < 0x100)
    {
      strlcpy(v21, __str, 0x100uLL);
    }
    else
    {
      v22 = *(_OWORD *)__str;
      v23 = v45;
      v24 = v47;
      *(_OWORD *)(exception + 40) = v46;
      *(_OWORD *)(exception + 56) = v24;
      *(_OWORD *)v21 = v22;
      *(_OWORD *)(exception + 24) = v23;
      v25 = v48;
      v26 = v49;
      v27 = v51;
      *(_OWORD *)(exception + 104) = v50;
      *(_OWORD *)(exception + 120) = v27;
      *(_OWORD *)(exception + 72) = v25;
      *(_OWORD *)(exception + 88) = v26;
      v28 = v52;
      v29 = v53;
      v30 = v55;
      *(_OWORD *)(exception + 168) = v54;
      *(_OWORD *)(exception + 184) = v30;
      *(_OWORD *)(exception + 136) = v28;
      *(_OWORD *)(exception + 152) = v29;
      v31 = v56;
      v32 = v57;
      v33 = v58[0];
      *(_OWORD *)(exception + 247) = *(_OWORD *)((char *)v58 + 15);
      *(_OWORD *)(exception + 216) = v32;
      *(_OWORD *)(exception + 232) = v33;
      *(_OWORD *)(exception + 200) = v31;
      exception[263] = 0;
    }
  }
  *(_QWORD *)v2 = &off_1E98B9648;
  *(_QWORD *)(v2 + 80) = &unk_1E98B9690;
  qword_1EFEFD4A8 = v2;
  Current = CFRunLoopGetCurrent();
  v10 = (_QWORD *)qword_1EFEFD4A8;
  v11 = (const __CFString *)*MEMORY[0x1E0C9B280];
  if (atomic_load(*(unsigned int **)(qword_1EFEFD4A8 + 40)))
  {
    v13 = *(__CFRunLoopSource **)(qword_1EFEFD4A8 + 64);
    if (!v13)
    {
      v14 = *(_QWORD *)(qword_1EFEFD4A8 + 16);
      v15 = atomic_load(*(unsigned int **)(qword_1EFEFD4A8 + 40));
      v13 = MSHCreateMIGServerSource(v14, 1, v15, 0);
      v10[8] = v13;
    }
    CADeprecated::XMachPortServicer::SetRunLoopAndSource((CADeprecated::XMachPortServicer *)(v10 + 7), Current, v11, v13);
  }
  RunLoopSource = (__CFRunLoopSource *)v10[13];
  if (!RunLoopSource)
  {
    PortDeathCFPort = CADeprecated::XMachPortDeathListener::GetPortDeathCFPort((CADeprecated::XMachPortDeathListener *)(v10 + 10));
    RunLoopSource = CFMachPortCreateRunLoopSource(0, PortDeathCFPort, 1);
    v10[13] = RunLoopSource;
  }
  CADeprecated::XMachPortServicer::SetRunLoopAndSource((CADeprecated::XMachPortServicer *)(v10 + 11), Current, v11, RunLoopSource);
}

void sub_1D4F08DE8(_Unwind_Exception *a1)
{
  uint64_t v1;
  CADeprecated::XMachPortDeathListener *v2;
  std::exception *v3;
  void **v4;
  void *v6;
  void *v7;

  std::exception::~exception(v3);
  __cxa_free_exception(v6);
  v7 = *v4;
  if (*v4)
  {
    *(_QWORD *)(v1 + 208) = v7;
    operator delete(v7);
  }
  *(_QWORD *)(v1 + 112) = &off_1E98B9D98;
  pthread_mutex_destroy((pthread_mutex_t *)(v1 + 136));
  CADeprecated::XMachPortDeathListener::~XMachPortDeathListener(v2);
  CADeprecated::XBasicMIGServer::~XBasicMIGServer((CADeprecated::XBasicMIGServer *)v1);
  MEMORY[0x1D826BA98](v1, 0x10F1C402391C2BDLL);
  MIDIServer::~MIDIServer((MIDIServer *)&MIDIServer::defaultInstance(int)::migServer);
  _Unwind_Resume(a1);
}

void MIDIServerMIG::~MIDIServerMIG(MIDIServerMIG *this)
{
  MIDIServer::~MIDIServer(this);
  JUMPOUT(0x1D826BA98);
}

BOOL BaseOpaqueObject::isa(uint64_t a1, void *a2)
{
  return a2 == &BaseOpaqueObject::sBaseRTTI;
}

uint64_t caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()(unsigned int)>>::~guarded_lookup_hash_table(uint64_t a1)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t *v6;
  void *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t result;

  if (!atomic_load((unsigned int *)(a1 + 48)))
  {
    v3 = atomic_load((unint64_t *)(a1 + 40));
    if (v3)
    {
      v4 = caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()>>::table_impl::~table_impl(v3);
      MEMORY[0x1D826BA98](v4, 0x1060C402CF69088);
    }
    std::mutex::~mutex((std::mutex *)(a1 + 80));
    v5 = *(uint64_t **)(a1 + 56);
    if (v5)
    {
      v6 = *(uint64_t **)(a1 + 64);
      v7 = *(void **)(a1 + 56);
      if (v6 != v5)
      {
        do
          std::unique_ptr<caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()>>::table_impl,std::default_delete<caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()>>::table_impl>>::reset[abi:ne180100](--v6);
        while (v6 != v5);
        v7 = *(void **)(a1 + 56);
      }
      *(_QWORD *)(a1 + 64) = v5;
      operator delete(v7);
    }
    v8 = *(_QWORD **)(a1 + 24);
    if (v8 == (_QWORD *)a1)
    {
      v9 = 4;
      v8 = (_QWORD *)a1;
    }
    else
    {
      if (!v8)
        return a1;
      v9 = 5;
    }
    (*(void (**)(void))(*v8 + 8 * v9))();
    return a1;
  }
  _os_assert_log();
  result = _os_crash();
  __break(1u);
  return result;
}

uint64_t caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()(unsigned int)>>::table_impl::~table_impl(uint64_t a1)
{
  uint64_t v2;
  unsigned int **v3;

  v2 = *(unsigned int *)(a1 + 8);
  if ((_DWORD)v2)
  {
    v3 = (unsigned int **)(a1 + 16);
    do
    {
      if ((unint64_t)*v3 + 1 >= 2)
        caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()>>::element_t::release(*v3);
      ++v3;
      --v2;
    }
    while (v2);
  }
  return a1;
}

uint64_t std::unique_ptr<caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()(unsigned int)>>::table_impl,std::default_delete<caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()(unsigned int)>>::table_impl>>::reset[abi:ne180100](uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  *a1 = 0;
  if (result)
  {
    caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()>>::table_impl::~table_impl(result);
    JUMPOUT(0x1D826BA98);
  }
  return result;
}

unsigned int *caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()(unsigned int)>>::element_t::release(unsigned int *result)
{
  unsigned int v1;

  do
    v1 = __ldaxr(result);
  while (__stlxr(v1 - 0x10000, result));
  if ((v1 & 0xFFFF0000) == 0x10000)
  {
    if (atomic_load(result))
    {
      _os_assert_log();
      _os_crash();
      __break(1u);
    }
    JUMPOUT(0x1D826BA98);
  }
  return result;
}

void std::__function::__func<OpaqueObjectMgr::OpaqueObjectMgr(void)::$_0,std::allocator<OpaqueObjectMgr::OpaqueObjectMgr(void)::$_0>,unsigned int ()(unsigned int)>::~__func()
{
  JUMPOUT(0x1D826BA98);
}

_QWORD *std::__function::__func<OpaqueObjectMgr::OpaqueObjectMgr(void)::$_0,std::allocator<OpaqueObjectMgr::OpaqueObjectMgr(void)::$_0>,unsigned int ()(unsigned int)>::__clone()
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = &off_1E98B9F18;
  return result;
}

void std::__function::__func<OpaqueObjectMgr::OpaqueObjectMgr(void)::$_0,std::allocator<OpaqueObjectMgr::OpaqueObjectMgr(void)::$_0>,unsigned int ()(unsigned int)>::__clone(uint64_t a1, _QWORD *a2)
{
  *a2 = &off_1E98B9F18;
}

_DWORD *caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()(unsigned int)>>::rehash(unint64_t *a1, unsigned int a2)
{
  unint64_t *v4;
  unint64_t v5;
  _DWORD *v6;
  uint64_t v7;
  uint64_t i;
  unint64_t v9;
  unint64_t SlotForKey;
  unsigned int v11;
  unint64_t v12;
  unint64_t *v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char *v20;
  unint64_t *v21;
  unint64_t v22;
  __int128 v23;
  uint64_t *v24;
  uint64_t *v25;

  v4 = a1 + 5;
  v5 = atomic_load(a1 + 5);
  v6 = operator new(8 * (a2 - 1) + 24);
  *(_QWORD *)v6 = a1;
  v6[2] = a2;
  *((_QWORD *)v6 + 2) = 0;
  bzero(v6 + 4, 8 * a2);
  if (v5)
  {
    v7 = *(unsigned int *)(v5 + 8);
    if ((_DWORD)v7)
    {
      for (i = 0; i != v7; ++i)
      {
        v9 = *(_QWORD *)(v5 + 8 * i + 16);
        if (v9 + 1 >= 2)
        {
          SlotForKey = caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()>>::table_impl::findSlotForKey((uint64_t *)v6, *(_DWORD *)(v9 + 4));
          if ((SlotForKey & 1) == 0)
          {
            do
              v11 = __ldaxr((unsigned int *)v9);
            while (__stlxr(v11 + 0x10000, (unsigned int *)v9));
            atomic_store(v9, (unint64_t *)&v6[2 * HIDWORD(SlotForKey) + 4]);
          }
        }
      }
    }
    atomic_store((unint64_t)v6, a1 + 5);
    v13 = (unint64_t *)a1[8];
    v12 = a1[9];
    if ((unint64_t)v13 >= v12)
    {
      v15 = (_QWORD *)a1[7];
      v16 = v13 - v15;
      v17 = v16 + 1;
      if ((unint64_t)(v16 + 1) >> 61)
        std::vector<CADeprecated::XMachServer::Client *>::__throw_length_error[abi:ne180100]();
      v18 = v12 - (_QWORD)v15;
      if (v18 >> 2 > v17)
        v17 = v18 >> 2;
      if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFF8)
        v19 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v19 = v17;
      if (v19)
      {
        if (v19 >> 61)
          std::__throw_bad_array_new_length[abi:ne180100]();
        v20 = (char *)operator new(8 * v19);
      }
      else
      {
        v20 = 0;
      }
      v21 = (unint64_t *)&v20[8 * v16];
      *v21 = v5;
      v14 = v21 + 1;
      while (v13 != v15)
      {
        v22 = *--v13;
        *v13 = 0;
        *--v21 = v22;
      }
      v23 = *(_OWORD *)(a1 + 7);
      a1[7] = (unint64_t)v21;
      a1[8] = (unint64_t)v14;
      a1[9] = (unint64_t)&v20[8 * v19];
      v24 = (uint64_t *)*((_QWORD *)&v23 + 1);
      v25 = (uint64_t *)v23;
      while (v24 != v25)
        std::unique_ptr<caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()>>::table_impl,std::default_delete<caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()>>::table_impl>>::reset[abi:ne180100](--v24);
      if (v25)
        operator delete(v25);
    }
    else
    {
      *v13 = v5;
      v14 = v13 + 1;
    }
    a1[8] = (unint64_t)v14;
  }
  else
  {
    atomic_store((unint64_t)v6, v4);
  }
  return v6;
}

uint64_t caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()(unsigned int)>>::emptyReleasePool(uint64_t result)
{
  int v1;
  uint64_t v2;
  uint64_t *i;
  uint64_t *v4;

  v1 = atomic_load((unsigned int *)(result + 48));
  if (v1 <= 0)
  {
    v2 = result;
    v4 = *(uint64_t **)(result + 56);
    for (i = *(uint64_t **)(result + 64);
          i != v4;
          result = std::unique_ptr<caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()>>::table_impl,std::default_delete<caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()>>::table_impl>>::reset[abi:ne180100](i))
    {
      --i;
    }
    *(_QWORD *)(v2 + 64) = v4;
  }
  return result;
}

void std::this_thread::sleep_for[abi:ne180100]<long long,std::ratio<1l,1000000l>>(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  BOOL v4;
  std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v5;
  std::chrono::nanoseconds __ns;
  uint64_t v7;
  uint64_t v8;

  if (a1 >= 1)
  {
    v7 = v1;
    v8 = v2;
    if ((double)a1 == 9.22337204e15)
      v3 = 0;
    else
      v3 = -127;
    if ((double)a1 > 9.22337204e15)
      v3 = 1;
    if ((double)a1 < 9.22337204e15)
      v3 = -1;
    v4 = v3 >= 0 || v3 == -127;
    v5 = 1000 * a1;
    if (v4)
      v5 = 0x7FFFFFFFFFFFFFFFLL;
    __ns.__rep_ = v5;
    std::this_thread::sleep_for (&__ns);
  }
}

uint64_t std::__call_once_proxy[abi:ne180100]<std::tuple<OpaqueObjectMgrInstance(void)::$_0 &&>>()
{
  uint64_t v0;
  uint64_t result;
  _QWORD v2[5];

  v2[4] = *MEMORY[0x1E0C80C00];
  v0 = operator new();
  v2[0] = &off_1E98B9F18;
  v2[3] = v2;
  *(_QWORD *)(v0 + 24) = v0;
  std::__function::__func<OpaqueObjectMgr::OpaqueObjectMgr(void)::$_0,std::allocator<OpaqueObjectMgr::OpaqueObjectMgr(void)::$_0>,unsigned int ()>::__clone((uint64_t)v2, (_QWORD *)v0);
  *(_DWORD *)(v0 + 32) = 0;
  *(_QWORD *)(v0 + 40) = 0;
  *(_DWORD *)(v0 + 48) = 0;
  *(_QWORD *)(v0 + 56) = 0;
  *(_QWORD *)(v0 + 64) = 0;
  *(_QWORD *)(v0 + 72) = 0;
  *(_QWORD *)(v0 + 80) = 850045863;
  *(_OWORD *)(v0 + 88) = 0u;
  *(_OWORD *)(v0 + 104) = 0u;
  *(_OWORD *)(v0 + 120) = 0u;
  *(_QWORD *)(v0 + 136) = 0;
  *(_DWORD *)(v0 + 144) = 0;
  result = getpid();
  atomic_store((result & 0x3FFFF) << 12, (unsigned int *)(v0 + 144));
  OpaqueObjectMgr::sInstance = v0;
  return result;
}

void sub_1D4F09448(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()>>::~guarded_lookup_hash_table(v1);
  MEMORY[0x1D826BA98](v3, 0x1020C400FEAF0FDLL);
  _Unwind_Resume(a1);
}

void BaseOpaqueObject::BaseOpaqueObject(BaseOpaqueObject *this)
{
  unint64_t v2;
  uint64_t v3;
  unsigned int *v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t *v8;
  char v9;
  uint64_t *v10;
  int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unint64_t SlotForKey;
  unint64_t v16;
  char v17;
  char **v18;
  char *v19;

  *(_QWORD *)this = off_1E98B98E8;
  v2 = atomic_load(&OpaqueObjectMgrInstance(void)::onceflag);
  if (v2 != -1)
  {
    v19 = &v17;
    v18 = &v19;
    std::__call_once(&OpaqueObjectMgrInstance(void)::onceflag, &v18, (void (__cdecl *)(void *))std::__call_once_proxy[abi:ne180100]<std::tuple<OpaqueObjectMgrInstance(void)::$_0 &&>>);
  }
  v3 = OpaqueObjectMgr::sInstance;
  v4 = (unsigned int *)(OpaqueObjectMgr::sInstance + 144);
  do
  {
    do
      v5 = __ldaxr(v4);
    while (__stlxr(v5 + 1, v4));
    if ((v5 & 0x80000000) != 0)
    {
      v6 = v5 - 2147479552;
      while (1)
      {
        v7 = __ldaxr(v4);
        if (v7 != v5)
          break;
        if (!__stlxr(v6, v4))
          goto LABEL_12;
      }
      __clrex();
    }
    else
    {
      v6 = v5;
    }
LABEL_12:
    v8 = caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()>>::lookup<(caulk::concurrent::guarded_lookup_hash_table_options)0,void>(v3, v6);
  }
  while (v9 && v8);
  std::mutex::lock((std::mutex *)(v3 + 80));
  v10 = (uint64_t *)atomic_load((unint64_t *)(v3 + 40));
  v11 = *(_DWORD *)(v3 + 32) + 1;
  *(_DWORD *)(v3 + 32) = v11;
  if (v10)
  {
    v12 = 16 * v11;
    v13 = *((_DWORD *)v10 + 2);
    if (v12 / v13 < 0xB)
      goto LABEL_19;
    v14 = 2 * v13;
  }
  else
  {
    v14 = 8;
  }
  v10 = (uint64_t *)caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()>>::rehash((unint64_t *)v3, v14);
LABEL_19:
  SlotForKey = caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()>>::table_impl::findSlotForKey(v10, v6);
  if ((SlotForKey & 1) != 0)
  {
    --*(_DWORD *)(v3 + 32);
  }
  else
  {
    v16 = operator new();
    *(_DWORD *)v16 = 0x10000;
    *(_DWORD *)(v16 + 4) = v6;
    *(_QWORD *)(v16 + 8) = this;
    atomic_store(v16, (unint64_t *)&v10[HIDWORD(SlotForKey) + 2]);
    caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()>>::emptyReleasePool(v3);
  }
  std::mutex::unlock((std::mutex *)(v3 + 80));
  *((_DWORD *)this + 2) = v6;
}

void sub_1D4F09614(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void BaseOpaqueObject::~BaseOpaqueObject(BaseOpaqueObject *this)
{
  int v2;
  uint64_t v3;
  std::mutex *v4;
  unint64_t v5;
  unint64_t SlotForKey;
  unsigned int *v7;
  unsigned int *v8;
  int v9;
  int v10;
  int v13;
  unsigned int v14;
  unsigned int v15;

  *(_QWORD *)this = off_1E98B98E8;
  v2 = *((_DWORD *)this + 2);
  if (v2)
  {
    v3 = OpaqueObjectMgr::sInstance;
    v4 = (std::mutex *)(OpaqueObjectMgr::sInstance + 80);
    std::mutex::lock((std::mutex *)(OpaqueObjectMgr::sInstance + 80));
    v5 = atomic_load((unint64_t *)(v3 + 40));
    if (v5)
    {
      SlotForKey = caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()>>::table_impl::findSlotForKey((uint64_t *)v5, v2);
      if ((SlotForKey & 1) != 0)
      {
        v8 = v7;
        atomic_store(0xFFFFFFFFFFFFFFFFLL, (unint64_t *)(v5 + 8 * HIDWORD(SlotForKey) + 16));
        if (v7)
        {
          v9 = atomic_load((unsigned int *)(v3 + 48));
          if (v9 >= 1)
          {
            do
            {
              std::this_thread::sleep_for[abi:ne180100]<long long,std::ratio<1l,1000000l>>(50);
              v10 = atomic_load((unsigned int *)(v3 + 48));
            }
            while (v10 > 0);
          }
          if ((unsigned __int16)atomic_load(v8))
          {
            std::mutex::unlock(v4);
            while ((unsigned __int16)atomic_load(v8))
              std::this_thread::sleep_for[abi:ne180100]<long long,std::ratio<1l,1000000l>>(500);
            std::mutex::lock(v4);
            v5 = atomic_load((unint64_t *)(v3 + 40));
          }
          caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()>>::element_t::release(v8);
          v13 = *(_DWORD *)(v3 + 32) - 1;
          *(_DWORD *)(v3 + 32) = v13;
          if (v5)
          {
            v14 = 16 * v13;
            v15 = *(_DWORD *)(v5 + 8);
            if (v14 / v15 <= 2 && v15 >= 9)
              caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()>>::rehash((unint64_t *)v3, v15 >> 1);
          }
        }
      }
    }
    caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()>>::emptyReleasePool(v3);
    std::mutex::unlock(v4);
    *((_DWORD *)this + 2) = 0;
  }
}

void sub_1D4F0976C(void *a1)
{
  __clang_call_terminate(a1);
}

void sub_1D4F09A18(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D4F09FB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,uint64_t a25,_Unwind_Exception *exception_object)
{
  void *v26;
  void *v27;

  _Unwind_Resume(a1);
}

void sub_1D4F0A1FC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1D4F0A6E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20)
{
  void *v20;
  void *v21;

  _Unwind_Resume(a1);
}

void sub_1D4F0A9A0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1D4F0AC94(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1D4F0AD38(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D4F0AF14(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void MIDICI::Profile::~Profile(MIDICI::Profile *this)
{
  void *v2;

  v2 = (void *)*((_QWORD *)this + 11);
  if (v2)
  {
    *((_QWORD *)this + 12) = v2;
    operator delete(v2);
  }
  if (*((char *)this + 87) < 0)
    operator delete(*((void **)this + 8));
  *(_QWORD *)this = off_1E98B9320;
  XCFObject<__CFDictionary const*>::~XCFObject((uint64_t)this + 24);
  BaseOpaqueObject::~BaseOpaqueObject(this);
}

{
  void *v2;

  v2 = (void *)*((_QWORD *)this + 11);
  if (v2)
  {
    *((_QWORD *)this + 12) = v2;
    operator delete(v2);
  }
  if (*((char *)this + 87) < 0)
    operator delete(*((void **)this + 8));
  *(_QWORD *)this = off_1E98B9320;
  XCFObject<__CFDictionary const*>::~XCFObject((uint64_t)this + 24);
  BaseOpaqueObject::~BaseOpaqueObject(this);
  JUMPOUT(0x1D826BA98);
}

void MIDICI::Profile::deserialize(MIDICI::Profile *this@<X0>, const __CFDictionary **a2@<X1>, uint64_t **a3@<X8>)
{
  uint64_t **v5;
  int v6;
  _BYTE *v7;
  char *v8;
  std::string::size_type size;
  char v10;
  unint64_t v11;
  _BYTE *v12;
  unint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  unint64_t v16;
  size_t v17;
  char *v18;
  char *v19;
  _BYTE *v20;
  _BYTE *v21;
  char v22;
  unsigned __int16 v23;
  char v24;
  unsigned __int16 v25;
  char v26;
  unsigned __int16 v27;
  char v28;
  unsigned __int16 v29;
  char v30;
  unsigned __int16 v31;
  char v32;
  unsigned int v33;
  __int16 v34;
  unsigned int v35;
  int v36;
  const __CFNumber *v37;
  unsigned __int8 v38;
  uint64_t v39;
  uint64_t v40;
  void *exception;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  const applesauce::CF::DictionaryRef *v51;
  uint64_t **v52;
  void *__p[2];
  char v54;
  std::string __str;
  unsigned __int8 v56;

  v5 = a3;
  a3[1] = 0;
  a3[2] = 0;
  *a3 = (uint64_t *)(a3 + 1);
  std::string::basic_string[abi:ne180100]<0>(__p, "name");
  if (!*a2)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1D826B7EC](exception, "Could not construct");
  }
  applesauce::CF::details::find_at_key_or_optional<std::string,std::string const&>((uint64_t)&__str, *a2, (const UInt8 *)__p);
  if (v56)
  {
    std::__tree<std::string>::__emplace_unique_key_args<std::string,std::string const&>(v5, __p, (uint64_t)__p);
  }
  else
  {
    __str.__r_.__value_.__s.__data_[0] = 0;
    v56 = 0;
  }
  if (v54 < 0)
    operator delete(__p[0]);
  if (v56)
  {
    std::string::operator=((std::string *)((char *)this + 64), &__str);
    if (v56)
    {
      if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__str.__r_.__value_.__l.__data_);
    }
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "id");
  if (!*a2)
  {
    v42 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1D826B7EC](v42, "Could not construct");
  }
  applesauce::CF::details::find_at_key_or_optional<std::vector<unsigned long long>,std::string const&>(&__str, *a2, (const UInt8 *)__p);
  v6 = v56;
  if (v56)
  {
    std::__tree<std::string>::__emplace_unique_key_args<std::string,std::string const&>(v5, __p, (uint64_t)__p);
  }
  else
  {
    __str.__r_.__value_.__s.__data_[0] = 0;
    v56 = 0;
  }
  if (v54 < 0)
  {
    operator delete(__p[0]);
    if (!v6)
      goto LABEL_43;
  }
  else if (!v6)
  {
    goto LABEL_43;
  }
  v7 = (_BYTE *)*((_QWORD *)this + 11);
  *((_QWORD *)this + 12) = v7;
  size = __str.__r_.__value_.__l.__size_;
  v8 = (char *)__str.__r_.__value_.__r.__words[0];
  if (__str.__r_.__value_.__r.__words[0] == __str.__r_.__value_.__l.__size_)
    goto LABEL_41;
  v51 = (const applesauce::CF::DictionaryRef *)a2;
  v52 = v5;
  do
  {
    v10 = *v8;
    v11 = *((_QWORD *)this + 13);
    if ((unint64_t)v7 >= v11)
    {
      v13 = *((_QWORD *)this + 11);
      v14 = &v7[-v13];
      v15 = (uint64_t)&v7[-v13 + 1];
      if (v15 < 0)
        std::vector<CADeprecated::XMachServer::Client *>::__throw_length_error[abi:ne180100]();
      v16 = v11 - v13;
      if (2 * v16 > v15)
        v15 = 2 * v16;
      if (v16 >= 0x3FFFFFFFFFFFFFFFLL)
        v17 = 0x7FFFFFFFFFFFFFFFLL;
      else
        v17 = v15;
      if (v17)
        v18 = (char *)operator new(v17);
      else
        v18 = 0;
      v19 = &v14[(_QWORD)v18];
      v20 = &v14[(_QWORD)v18];
      *v20 = v10;
      v12 = v20 + 1;
      if (v7 != (_BYTE *)v13)
      {
        v21 = &v7[~v13];
        do
        {
          v22 = *--v7;
          (v21--)[(_QWORD)v18] = v22;
        }
        while (v7 != (_BYTE *)v13);
        v7 = (_BYTE *)*((_QWORD *)this + 11);
        v19 = v18;
      }
      *((_QWORD *)this + 11) = v19;
      *((_QWORD *)this + 12) = v12;
      *((_QWORD *)this + 13) = &v18[v17];
      if (v7)
        operator delete(v7);
    }
    else
    {
      *v7 = v10;
      v12 = v7 + 1;
    }
    *((_QWORD *)this + 12) = v12;
    v8 += 8;
    v7 = v12;
  }
  while (v8 != (char *)size);
  v5 = v52;
  a2 = (const __CFDictionary **)v51;
  if (v56)
  {
    v8 = (char *)__str.__r_.__value_.__r.__words[0];
LABEL_41:
    if (v8)
      operator delete(v8);
  }
LABEL_43:
  std::string::basic_string[abi:ne180100]<0>(&__str, "profile_type");
  if (!*a2)
  {
    v43 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1D826B7EC](v43, "Could not construct");
  }
  v23 = applesauce::CF::details::find_at_key_or_optional<unsigned char,std::string const&>(*a2, (const UInt8 *)&__str);
  if (v23 >= 0x100u)
  {
    std::__tree<std::string>::__emplace_unique_key_args<std::string,std::string const&>(v5, (void **)&__str.__r_.__value_.__l.__data_, (uint64_t)&__str);
    v24 = v23;
  }
  else
  {
    v24 = 0;
  }
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str.__r_.__value_.__l.__data_);
  if (v23 >= 0x100u)
    *((_BYTE *)this + 112) = v24;
  std::string::basic_string[abi:ne180100]<0>(&__str, "group_offset");
  if (!*a2)
  {
    v44 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1D826B7EC](v44, "Could not construct");
  }
  v25 = applesauce::CF::details::find_at_key_or_optional<unsigned char,std::string const&>(*a2, (const UInt8 *)&__str);
  if (v25 >= 0x100u)
  {
    std::__tree<std::string>::__emplace_unique_key_args<std::string,std::string const&>(v5, (void **)&__str.__r_.__value_.__l.__data_, (uint64_t)&__str);
    v26 = v25;
  }
  else
  {
    v26 = 0;
  }
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str.__r_.__value_.__l.__data_);
  if (v25 >= 0x100u)
    *((_BYTE *)this + 113) = v26;
  std::string::basic_string[abi:ne180100]<0>(&__str, "total_channel_count");
  if (!*a2)
  {
    v45 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1D826B7EC](v45, "Could not construct");
  }
  v27 = applesauce::CF::details::find_at_key_or_optional<unsigned char,std::string const&>(*a2, (const UInt8 *)&__str);
  if (v27 >= 0x100u)
  {
    std::__tree<std::string>::__emplace_unique_key_args<std::string,std::string const&>(v5, (void **)&__str.__r_.__value_.__l.__data_, (uint64_t)&__str);
    v28 = v27;
  }
  else
  {
    v28 = 0;
  }
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str.__r_.__value_.__l.__data_);
  if (v27 >= 0x100u)
    *((_BYTE *)this + 114) = v28;
  std::string::basic_string[abi:ne180100]<0>(&__str, "midi_channel");
  if (!*a2)
  {
    v46 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1D826B7EC](v46, "Could not construct");
  }
  v29 = applesauce::CF::details::find_at_key_or_optional<unsigned char,std::string const&>(*a2, (const UInt8 *)&__str);
  if (v29 >= 0x100u)
  {
    std::__tree<std::string>::__emplace_unique_key_args<std::string,std::string const&>(v5, (void **)&__str.__r_.__value_.__l.__data_, (uint64_t)&__str);
    v30 = v29;
  }
  else
  {
    v30 = 0;
  }
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str.__r_.__value_.__l.__data_);
  if (v29 >= 0x100u)
    *((_BYTE *)this + 115) = v30;
  std::string::basic_string[abi:ne180100]<0>(&__str, "enabled");
  if (!*a2)
  {
    v47 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1D826B7EC](v47, "Could not construct");
  }
  v31 = applesauce::CF::details::find_at_key_or_optional<BOOL,std::string const&>(*a2, (const UInt8 *)&__str);
  if (v31 >= 0x100u)
  {
    std::__tree<std::string>::__emplace_unique_key_args<std::string,std::string const&>(v5, (void **)&__str.__r_.__value_.__l.__data_, (uint64_t)&__str);
    v32 = v31;
  }
  else
  {
    v32 = 0;
  }
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str.__r_.__value_.__l.__data_);
  if (v31 >= 0x100u)
    *((_BYTE *)this + 116) = v32;
  std::string::basic_string[abi:ne180100]<0>(&__str, "enabled_channel_count");
  if (!*a2)
  {
    v48 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1D826B7EC](v48, "Could not construct");
  }
  v33 = applesauce::CF::DictionaryRef_proxy::at_as<unsigned short,std::string const&>(*a2, (const UInt8 *)&__str);
  if (v33 >= 0x10000)
  {
    std::__tree<std::string>::__emplace_unique_key_args<std::string,std::string const&>(v5, (void **)&__str.__r_.__value_.__l.__data_, (uint64_t)&__str);
    v34 = v33;
  }
  else
  {
    v34 = 0;
  }
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str.__r_.__value_.__l.__data_);
  if (v33 >= 0x10000)
    *((_WORD *)this + 59) = v34 | v33 & 0xFF00;
  std::string::basic_string[abi:ne180100]<0>(&__str, "owner");
  if (!*a2)
  {
    v49 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1D826B7EC](v49, "Could not construct");
  }
  v35 = applesauce::CF::DictionaryRef_proxy::at_as<unsigned short,std::string const&>(*a2, (const UInt8 *)&__str);
  if (v35 >= 0x10000)
  {
    std::__tree<std::string>::__emplace_unique_key_args<std::string,std::string const&>(v5, (void **)&__str.__r_.__value_.__l.__data_, (uint64_t)&__str);
    v36 = v35;
  }
  else
  {
    v36 = 0;
  }
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str.__r_.__value_.__l.__data_);
  if (v35 >= 0x10000)
    *((_DWORD *)this + 30) = v36 | v35 & 0xFF00;
  std::string::basic_string[abi:ne180100]<0>(&__str, "timestamp");
  if (!*a2)
  {
    v50 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1D826B7EC](v50, "Could not construct");
  }
  v37 = applesauce::CF::details::find_at_key_or_optional<unsigned long long,std::string const&>(*a2, (const UInt8 *)&__str);
  v39 = v38;
  if (v38)
  {
    std::__tree<std::string>::__emplace_unique_key_args<std::string,std::string const&>(v5, (void **)&__str.__r_.__value_.__l.__data_, (uint64_t)&__str);
    v40 = v37;
  }
  else
  {
    v40 = 0;
  }
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str.__r_.__value_.__l.__data_);
  if (v39)
    *((_QWORD *)this + 7) = v40 | (unint64_t)v37 & 0xFFFFFFFFFFFFFF00;
}

void sub_1D4F0B848(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char **a11, uint64_t a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23,char a24)
{
  void *v24;

  __cxa_free_exception(v24);
  if (a23 < 0)
    operator delete(__p);
  std::__tree<std::string>::destroy(*a11);
  _Unwind_Resume(a1);
}

void MIDICI::Profile::serialize(MIDICI::Profile *this@<X0>, CFDictionaryRef *a2@<X8>)
{
  unint64_t v4;
  char *v5;
  char *v6;
  CFNumberRef *v7;
  char v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  int64x2_t v17;
  unint64_t v18;
  CFArrayRef v19;
  _QWORD *v20;
  uint64_t v21;
  const void *v22;
  const void *v23;
  void *exception;
  int v25;
  _QWORD v26[2];
  int64x2_t v27;
  unint64_t v28;
  int64x2_t *valuePtr;
  int64x2_t v30;
  unint64_t v31;
  unint64_t *v32;
  _BYTE v33[16];
  uint64_t v34;
  _QWORD v35[2];
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD v40[2];
  uint64_t v41;
  uint64_t v43;
  uint64_t v44;
  _BYTE v45[16];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v25 = *((_DWORD *)this + 2);
  applesauce::CF::TypeRefPair::TypeRefPair<char const* const&,unsigned int>((applesauce::CF::TypeRef *)v33, "object", &v25);
  applesauce::CF::TypeRefPair::TypeRefPair<char const* const&,std::string const&>((applesauce::CF::TypeRef *)&v34, "name", (uint64_t)this + 64);
  applesauce::CF::TypeRef::TypeRef((applesauce::CF::TypeRef *)v35, "id");
  v4 = *((_QWORD *)this + 12) - *((_QWORD *)this + 11);
  v27 = 0uLL;
  v28 = 0;
  std::vector<applesauce::CF::NumberRef>::reserve(&v27, v4);
  v5 = (char *)*((_QWORD *)this + 11);
  v6 = (char *)*((_QWORD *)this + 12);
  if (v5 != v6)
  {
    v7 = (CFNumberRef *)v27.i64[1];
    do
    {
      v8 = *v5;
      if ((unint64_t)v7 >= v28)
      {
        v9 = ((uint64_t)v7 - v27.i64[0]) >> 3;
        if ((unint64_t)(v9 + 1) >> 61)
          std::vector<CADeprecated::XMachServer::Client *>::__throw_length_error[abi:ne180100]();
        v10 = (uint64_t)(v28 - v27.i64[0]) >> 2;
        if (v10 <= v9 + 1)
          v10 = v9 + 1;
        if (v28 - v27.i64[0] >= 0x7FFFFFFFFFFFFFF8)
          v11 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v11 = v10;
        v32 = &v28;
        if (v11)
          v11 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<MIDIDriverPlugin>>>(v11);
        else
          v12 = 0;
        valuePtr = (int64x2_t *)v11;
        v30.i64[0] = v11 + 8 * v9;
        v30.i64[1] = v30.i64[0];
        v31 = v11 + 8 * v12;
        std::construct_at[abi:ne180100]<applesauce::CF::NumberRef,unsigned char,applesauce::CF::NumberRef*>((CFNumberRef *)v30.i64[0], v8);
        v13 = v30.i64[0];
        v7 = (CFNumberRef *)(v30.i64[1] + 8);
        v30.i64[1] += 8;
        v14 = (_QWORD *)v27.i64[1];
        v15 = (_QWORD *)v27.i64[0];
        if (v27.i64[1] == v27.i64[0])
        {
          v17 = vdupq_n_s64(v27.u64[1]);
        }
        else
        {
          do
          {
            v16 = *--v14;
            *(_QWORD *)(v13 - 8) = v16;
            v13 -= 8;
            *v14 = 0;
          }
          while (v14 != v15);
          v17 = v27;
          v7 = (CFNumberRef *)v30.i64[1];
        }
        v27.i64[0] = v13;
        v27.i64[1] = (uint64_t)v7;
        v30 = v17;
        v18 = v28;
        v28 = v31;
        v31 = v18;
        valuePtr = (int64x2_t *)v17.i64[0];
        std::__split_buffer<applesauce::CF::NumberRef>::~__split_buffer((uint64_t)&valuePtr);
      }
      else
      {
        std::construct_at[abi:ne180100]<applesauce::CF::NumberRef,unsigned char,applesauce::CF::NumberRef*>(v7++, *v5);
      }
      v27.i64[1] = (uint64_t)v7;
      ++v5;
    }
    while (v5 != v6);
  }
  v19 = applesauce::CF::details::make_CFArrayRef<applesauce::CF::NumberRef>((uint64_t **)&v27);
  valuePtr = &v27;
  std::vector<applesauce::CF::NumberRef>::__destroy_vector::operator()[abi:ne180100]((void ***)&valuePtr);
  v35[1] = v19;
  applesauce::CF::TypeRefPair::TypeRefPair<char const* const&,unsigned char const&>((applesauce::CF::TypeRef *)&v36, "profile_type", (char *)this + 112);
  applesauce::CF::TypeRefPair::TypeRefPair<char const* const&,unsigned char const&>((applesauce::CF::TypeRef *)&v37, "group_offset", (char *)this + 113);
  applesauce::CF::TypeRefPair::TypeRefPair<char const* const&,unsigned char const&>((applesauce::CF::TypeRef *)&v38, "total_channel_count", (char *)this + 114);
  applesauce::CF::TypeRefPair::TypeRefPair<char const* const&,unsigned char const&>((applesauce::CF::TypeRef *)&v39, "midi_channel", (char *)this + 115);
  applesauce::CF::TypeRef::TypeRef((applesauce::CF::TypeRef *)v40, "enabled");
  v20 = (_QWORD *)MEMORY[0x1E0C9AE50];
  if (!*((_BYTE *)this + 116))
    v20 = (_QWORD *)MEMORY[0x1E0C9AE40];
  v40[1] = *v20;
  applesauce::CF::TypeRef::TypeRef((applesauce::CF::TypeRef *)&v41, "enabled_channel_count");
  LOWORD(valuePtr) = *((_WORD *)this + 59);
  if (!CFNumberCreate(0, kCFNumberShortType, &valuePtr))
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1D826B7EC](exception, "Could not construct");
  }
  applesauce::CF::TypeRefPair::TypeRefPair<char const* const&,unsigned int const&>((applesauce::CF::TypeRef *)&v43, "owner", (int *)this + 30);
  LODWORD(valuePtr) = 3;
  applesauce::CF::TypeRefPair::TypeRefPair<char const* const&,UMPCIObjectType>((applesauce::CF::TypeRef *)&v44, "type", (int *)&valuePtr);
  applesauce::CF::TypeRefPair::TypeRefPair<char const* const&,unsigned long long const&>((applesauce::CF::TypeRef *)v45, "timestamp", (uint64_t *)this + 7);
  v26[0] = v33;
  v26[1] = 12;
  v21 = 0;
  *a2 = applesauce::CF::details::make_CFDictionaryRef((uint64_t)v26);
  do
  {
    v22 = *(const void **)&v45[v21 + 8];
    if (v22)
      CFRelease(v22);
    v23 = *(const void **)&v45[v21];
    if (v23)
      CFRelease(v23);
    v21 -= 16;
  }
  while (v21 != -192);
}

void sub_1D4F0BD44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22)
{
  const void **v22;
  uint64_t v23;
  const void *v25;

  v25 = *(const void **)(v23 + 136);
  if (v25)
    CFRelease(v25);
  applesauce::CF::TypeRef::~TypeRef(v22);
  while (v22 != (const void **)&a22)
  {
    v22 -= 2;
    applesauce::CF::TypeRefPair::~TypeRefPair((applesauce::CF::TypeRefPair *)v22);
  }
  _Unwind_Resume(a1);
}

uint64_t MIDICI::Profile::getUMPCIType(MIDICI::Profile *this)
{
  return 3;
}

CFNumberRef *std::construct_at[abi:ne180100]<applesauce::CF::NumberRef,unsigned char,applesauce::CF::NumberRef*>(CFNumberRef *a1, char a2)
{
  CFNumberRef v3;
  void *exception;
  char valuePtr;

  valuePtr = a2;
  v3 = CFNumberCreate(0, kCFNumberCharType, &valuePtr);
  *a1 = v3;
  if (!v3)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1D826B7EC](exception, "Could not construct");
  }
  return a1;
}

void sub_1D4F0BEBC(_Unwind_Exception *exception_object)
{
  CFTypeRef *v1;

  if (*v1)
    CFRelease(*v1);
  _Unwind_Resume(exception_object);
}

uint64_t MIDICI::Profile::Profile(uint64_t a1, _BYTE *a2, __int128 *a3, char a4)
{
  char *v7;
  std::string __p;
  char v10;

  std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100](&__p, a3);
  MIDIObject::MIDIObject((MIDIObject *)a1);
  *(_BYTE *)(a1 + 44) = 0;
  *(_BYTE *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 56) = 0;
  *(_QWORD *)a1 = off_1E98B6EA0;
  if (v10)
  {
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      std::string::__init_copy_ctor_external((std::string *)(a1 + 64), __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
    else
      *(std::string *)(a1 + 64) = __p;
  }
  else
  {
    CIProfileBytesToName(a1 + 64, a2, 5uLL);
  }
  *(_QWORD *)(a1 + 88) = 0;
  *(_QWORD *)(a1 + 96) = 0;
  *(_QWORD *)(a1 + 104) = 0;
  v7 = (char *)operator new(5uLL);
  *(_QWORD *)(a1 + 88) = v7;
  *(_QWORD *)(a1 + 96) = v7;
  *(_QWORD *)(a1 + 104) = v7 + 5;
  *(_DWORD *)v7 = *(_DWORD *)a2;
  v7[4] = a2[4];
  *(_QWORD *)(a1 + 96) = v7 + 5;
  *(_DWORD *)(a1 + 112) = 0;
  *(_BYTE *)(a1 + 116) = a4;
  *(_WORD *)(a1 + 118) = 0;
  *(_DWORD *)(a1 + 120) = 0;
  if (v10 && SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  return a1;
}

void sub_1D4F0BFEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  BaseOpaqueObject *v15;

  *(_QWORD *)v15 = off_1E98B9320;
  XCFObject<__CFDictionary const*>::~XCFObject((uint64_t)v15 + 24);
  BaseOpaqueObject::~BaseOpaqueObject(v15);
  if (a15)
  {
    if (a14 < 0)
      operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void MIDIIORingBufferBase::Init(MIDIIORingBufferBase *this, unsigned int a2, std::string::value_type *__s)
{
  _QWORD *v6;
  int v7;
  int v8;
  void *v9;

  if (!MIDIIORingBufferBase::sLog)
  {
    v6 = (_QWORD *)operator new();
    v6[1] = 0;
    *v6 = os_log_create("com.apple.coremidi", "ioring");
    MIDIIORingBufferBase::sLog = (uint64_t)v6;
  }
  std::string::__assign_external((std::string *)((char *)this + 8), __s);
  *((_DWORD *)this + 9) = a2 != 0;
  if (a2)
    v7 = shm_open(__s, 514, 511);
  else
    v7 = shm_open(__s, 2, 511);
  if (v7 != -1)
  {
    v8 = v7;
    if (a2)
      ftruncate(v7, 0x4000);
    *((_QWORD *)this + 11) = mmap(0, 0x4000uLL, 3, 1, v8, 0);
    close(v8);
    *((_BYTE *)this + 40) = 1;
    v9 = (void *)*((_QWORD *)this + 11);
    *((_DWORD *)this + 8) = 16352;
    if ((unint64_t)v9 + 1 > 1)
    {
      if (!a2)
        return;
      bzero(v9, 0x4000uLL);
      goto LABEL_15;
    }
    *((_QWORD *)this + 11) = (char *)this + 44;
  }
  if (a2)
  {
LABEL_15:
    atomic_store(a2, (unsigned int *)(*((_QWORD *)this + 11) + 8));
    atomic_store(0, (unsigned int *)(*((_QWORD *)this + 11) + 12));
  }
}

BOOL MIDIIORingBufferReader::readPacketList(MIDIRingBuffer *this, _QWORD *a2, uint64_t a3)
{
  unsigned int v6;
  uint64_t v7;
  unsigned int *v8;
  unsigned int v9;
  uint64_t v12;
  char i;
  signed int v14;
  unsigned int v15;
  signed int v16;
  unsigned int *v17;
  unsigned int v18;
  _QWORD __dst[2];
  unsigned __int16 v21;
  int v22;

  while (1)
  {
    v6 = atomic_load((unsigned int *)(*((_QWORD *)this + 11) + 12));
    v7 = *((_QWORD *)this + 11);
    if (v6)
      break;
    v8 = (unsigned int *)(v7 + 20);
    do
      v9 = __ldaxr(v8);
    while (__stlxr(0, v8));
    if (!v9)
      return 0;
  }
  if (atomic_load((unsigned int *)(v7 + 12)))
  {
    v12 = 0;
    for (i = 1; ; i = 0)
    {
      v14 = MIDIRingBuffer::Peek(this, (char *)__dst, 20);
      if (v14 < 0)
        break;
      if ((i & 1) != 0)
      {
        *a2 = __dst[0];
        *(_QWORD *)a3 = v21;
        v12 = a3 + 8;
      }
      else
      {
        if (*(_DWORD *)a3 != v21 || __dst[0] != *a2)
          return *(_DWORD *)(a3 + 4) != 0;
        v12 += 4 * *(unsigned int *)(v12 + 8) + 12;
      }
      v15 = (unsigned __int16)v22;
      if (a3 + 1024 - (v12 + 12) < (unsigned __int16)v22)
        return *(_DWORD *)(a3 + 4) != 0;
      if (*((_DWORD *)this + 8) <= v14)
        break;
      atomic_store(v14, (unsigned int *)(*((_QWORD *)this + 11) + 4));
      v16 = MIDIRingBuffer::Peek(this, (char *)(v12 + 12), v15);
      if (v16 < 0 || *((_DWORD *)this + 8) <= v16)
        break;
      atomic_store(v16, (unsigned int *)(*((_QWORD *)this + 11) + 4));
      ++*(_DWORD *)(a3 + 4);
      *(_DWORD *)(v12 + 8) = v15 >> 2;
      *(_QWORD *)v12 = __dst[1];
      v17 = (unsigned int *)(*((_QWORD *)this + 11) + 12);
      do
        v18 = __ldaxr(v17);
      while (__stlxr(v18 - 1, v17));
      if (!atomic_load((unsigned int *)(*((_QWORD *)this + 11) + 12)))
        return *(_DWORD *)(a3 + 4) != 0;
    }
    std::terminate();
  }
  return *(_DWORD *)(a3 + 4) != 0;
}

void MIDIIORingBufferWriter::writePacket2(uint64_t a1, char *__src, char *a3)
{
  int v6;
  unsigned int *v7;
  unsigned int v8;
  int v9;
  unsigned int v10;

  if (*((unsigned __int16 *)__src + 9) >= 0x3E9u)
    std::terminate();
  v6 = *(_DWORD *)(a1 + 136);
  if (v6)
  {
    if (v6 == 1 || mach_absolute_time() < *(_QWORD *)(a1 + 144))
      return;
    *(_DWORD *)(a1 + 136) = 0;
  }
  v7 = *(unsigned int **)(a1 + 88);
  v8 = atomic_load(v7);
  LODWORD(v7) = atomic_load(v7 + 1);
  v9 = v8 - (_DWORD)v7;
  if (v9 < 0)
    v9 += *(_DWORD *)(a1 + 32);
  if ((unint64_t)*((unsigned __int16 *)__src + 9) + 20 >= *(int *)(a1 + 32) - (uint64_t)v9
    || (v10 = atomic_load((unsigned int *)(*(_QWORD *)(a1 + 88) + 16))) != 0)
  {
    deque_vec<unsigned char>::append<unsigned char const*>(a1 + 104, __src, __src + 20);
    deque_vec<unsigned char>::append<unsigned char const*>(a1 + 104, a3, &a3[*((unsigned __int16 *)__src + 9)]);
    atomic_store(1u, (unsigned int *)(*(_QWORD *)(a1 + 88) + 16));
  }
  else
  {
    MIDIIORingBufferWriter::writePacket3((MIDIRingBuffer *)a1, (uint64_t)__src, a3);
  }
}

uint64_t MIDIIORingBufferWriter::writePacket3(MIDIRingBuffer *a1, uint64_t a2, char *a3)
{
  uint64_t result;
  unsigned int *v7;
  unsigned int v8;

  if ((MIDIRingBuffer::Write(a1, (char *)a2, 20) & 0x80000000) != 0
    || (result = MIDIRingBuffer::Write(a1, a3, *(unsigned __int16 *)(a2 + 18)), (result & 0x80000000) != 0))
  {
    std::terminate();
  }
  v7 = (unsigned int *)(*((_QWORD *)a1 + 11) + 12);
  do
    v8 = __ldaxr(v7);
  while (__stlxr(v8 + 1, v7));
  return result;
}

void deque_vec<unsigned char>::append<unsigned char const*>(uint64_t a1, char *__src, char *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  char *v9;
  size_t v10;

  v6 = *(_QWORD *)(a1 + 24);
  if (v6)
  {
    v8 = *(char **)a1;
    v7 = *(char **)(a1 + 8);
    if (&v7[(_QWORD)a3] - &__src[*(_QWORD *)a1] > *(_QWORD *)(a1 + 16) - *(_QWORD *)a1)
    {
      v9 = &v8[v6];
      v10 = v7 - v9;
      if (v7 != v9)
        memmove(*(void **)a1, v9, v10);
      v7 = &v8[v10];
      *(_QWORD *)(a1 + 8) = &v8[v10];
      *(_QWORD *)(a1 + 24) = 0;
    }
  }
  else
  {
    v7 = *(char **)(a1 + 8);
  }
  std::vector<unsigned char>::__insert_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>(a1, v7, __src, a3, a3 - __src);
}

BOOL MIDIIORingBufferWriter::emptySecondaryQueue(os_unfair_lock_s *this)
{
  os_unfair_lock_s *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 *v6;
  unsigned int *v7;
  unsigned int v8;
  int v9;
  uint64_t v10;
  unsigned int *v11;
  unsigned int v12;
  unsigned int *v13;
  unsigned int v14;
  _BOOL8 v15;
  __int128 v17;
  unsigned int v18;

  v2 = this + 25;
  os_unfair_lock_lock(this + 25);
  do
  {
    v3 = *(_QWORD *)&this[26]._os_unfair_lock_opaque;
    v4 = *(_QWORD *)&this[28]._os_unfair_lock_opaque;
    v5 = *(_QWORD *)&this[32]._os_unfair_lock_opaque;
    while (v5 + v3 != v4)
    {
      if ((unint64_t)(v4 - (v5 + v3)) <= 0x13
        || (v6 = (__int128 *)(v3 + v5), v18 = *((_DWORD *)v6 + 4), v17 = *v6, HIWORD(v18) >= 0x3E9u))
      {
        std::terminate();
      }
      v7 = *(unsigned int **)&this[22]._os_unfair_lock_opaque;
      v8 = atomic_load(v7);
      LODWORD(v7) = atomic_load(v7 + 1);
      v9 = v8 - (_DWORD)v7;
      if (v9 < 0)
        v9 += this[8]._os_unfair_lock_opaque;
      v10 = HIWORD(v18);
      if ((signed int)(this[8]._os_unfair_lock_opaque - v9) <= HIWORD(v18) + 20)
        goto LABEL_13;
      MIDIIORingBufferWriter::writePacket3((MIDIRingBuffer *)this, (uint64_t)&v17, (char *)(*(_QWORD *)&this[32]._os_unfair_lock_opaque + *(_QWORD *)&this[26]._os_unfair_lock_opaque + 20));
      v5 = v10 + *(_QWORD *)&this[32]._os_unfair_lock_opaque + 20;
      *(_QWORD *)&this[32]._os_unfair_lock_opaque = v5;
      v3 = *(_QWORD *)&this[26]._os_unfair_lock_opaque;
      v4 = *(_QWORD *)&this[28]._os_unfair_lock_opaque;
      if (v5 + v3 == v4)
      {
        v5 = 0;
        *(_QWORD *)&this[28]._os_unfair_lock_opaque = v3;
        *(_QWORD *)&this[32]._os_unfair_lock_opaque = 0;
        v4 = v3;
      }
    }
    atomic_store(0, (unsigned int *)(*(_QWORD *)&this[22]._os_unfair_lock_opaque + 16));
    if (this[34]._os_unfair_lock_opaque == 1)
    {
      this[34]._os_unfair_lock_opaque = 2;
      *(_QWORD *)&this[36]._os_unfair_lock_opaque = (unint64_t)((double)mach_absolute_time() + 120000000.0);
    }
LABEL_13:
    v11 = (unsigned int *)(*(_QWORD *)&this[22]._os_unfair_lock_opaque + 24);
    do
      v12 = __ldaxr(v11);
    while (__stlxr(0, v11));
  }
  while (v12);
  v13 = (unsigned int *)(*(_QWORD *)&this[22]._os_unfair_lock_opaque + 20);
  do
    v14 = __ldaxr(v13);
  while (__stlxr(v14 | 1, v13));
  v15 = v14 == 0;
  os_unfair_lock_unlock(v2);
  return v15;
}

void sub_1D4F0C6D0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void BackgroundAppManager::Update(BackgroundAppManager *this)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  _BOOL4 v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD aBlock[4];
  id v17;
  id v18;
  BackgroundAppManager *v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  gBackgroundAppManager();
  v2 = objc_retainAutorelease((id)gBackgroundAppManager(void)::bgappm);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "BackgroundAppManager.mm";
    v22 = 1024;
    v23 = 32;
    _os_log_impl(&dword_1D4E88000, v2, OS_LOG_TYPE_DEBUG, "%25s:%-5d [*] BackgroundManager::Update()", buf, 0x12u);
  }
  v3 = *((_QWORD *)this + 1);
  objc_msgSend(MEMORY[0x1E0D87DC0], "descriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValues:", 1);
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v6 = *(_QWORD *)(*(_QWORD *)this + 40);
  for (i = *(_QWORD *)(*(_QWORD *)this + 48); v6 != i; v6 += 8)
  {
    objc_msgSend(MEMORY[0x1E0D87D70], "identifierWithPid:", *(unsigned int *)(*(_QWORD *)v6 + 8));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v8);

  }
  objc_msgSend(MEMORY[0x1E0D87DA0], "predicateMatchingIdentifiers:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v3 == 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = ___ZN20BackgroundAppManager6UpdateEv_block_invoke;
  aBlock[3] = &unk_1E98BA628;
  v19 = this;
  v11 = v9;
  v17 = v11;
  v12 = v4;
  v18 = v12;
  v13 = _Block_copy(aBlock);
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0D87D90], "monitorWithConfiguration:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)*((_QWORD *)this + 1);
    *((_QWORD *)this + 1) = v14;

  }
  else
  {
    objc_msgSend(*((id *)this + 1), "updateConfiguration:", v13);
  }

}

void sub_1D4F0C8F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void gBackgroundAppManager(void)
{
  unsigned __int8 v0;

  if ((v0 & 1) == 0)
  {
    {
      caulk::log_category::log_category((caulk::log_category *)&gBackgroundAppManager(void)::bgappm, "com.apple.coremidi", "bgappm");
    }
  }
}

void ___ZN20BackgroundAppManager6UpdateEv_block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = a1[6];
  v7[0] = a1[4];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPredicates:", v5);

  objc_msgSend(v3, "setStateDescriptor:", a1[5]);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = ___ZN20BackgroundAppManager6UpdateEv_block_invoke_2;
  v6[3] = &__block_descriptor_40_e74_v32__0__RBSProcessMonitor_8__RBSProcessHandle_16__RBSProcessStateUpdate_24l;
  v6[4] = v4;
  objc_msgSend(v3, "setUpdateHandler:", v6);

}

void sub_1D4F0CA8C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void ___ZN20BackgroundAppManager6UpdateEv_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  ClientTable **v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  NSObject *v12;
  void *v13;
  int v14;
  const char *v15;
  ClientTable *v16;
  MIDIServer *v17;
  int v18;
  uint64_t v19;
  int v20;
  ClientProcess **i;
  ClientProcess *v22;
  int v23;
  int v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  __int16 v30;
  int v31;
  __int16 v32;
  const char *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = *(ClientTable ***)(a1 + 32);
  objc_msgSend(v5, "state");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "process");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "pid");

  objc_msgSend(v5, "state");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "taskState");

  gBackgroundAppManager();
  v12 = objc_retainAutorelease((id)gBackgroundAppManager(void)::bgappm);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v5, "state");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "taskState");
    v15 = "NO";
    v24 = 136316162;
    v25 = "BackgroundAppManager.mm";
    v27 = 52;
    v26 = 1024;
    if (v11 == 3)
      v15 = "YES";
    v28 = 1024;
    v29 = v9;
    v30 = 1024;
    v31 = v14;
    v32 = 2080;
    v33 = v15;
    _os_log_impl(&dword_1D4E88000, v12, OS_LOG_TYPE_DEBUG, "%25s:%-5d BackgroundAppManager:mProcessMonitor updateHandler called for pid %d, taskState = %d (isSuspended = %s)", (uint8_t *)&v24, 0x28u);

  }
  v16 = *v6;
  v19 = MIDIServer::defaultInstance(v17, v18) + 16;
  v20 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v19 + 16))(v19);
  for (i = (ClientProcess **)*((_QWORD *)v16 + 5); i != *((ClientProcess ***)v16 + 6); ++i)
  {
    v22 = *i;
    if (*((_DWORD *)*i + 2) == v9)
    {
      v23 = v11 == 3;
      if (*((unsigned __int8 *)v22 + 13) != v23)
      {
        *((_BYTE *)v22 + 13) = v23;
        if (v11 != 3 && !*((_BYTE *)v22 + 320))
          ClientProcess::DeliverNotifications(v22);
      }
      ClientTable::CheckActiveProcesses(v16);
      break;
    }
  }
  if (v20)
    (*(void (**)(uint64_t))(*(_QWORD *)v19 + 24))(v19);

}

void sub_1D4F0CCB4(_Unwind_Exception *a1)
{
  void *v1;
  uint64_t v2;
  int v3;

  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 24))(v2);

  _Unwind_Resume(a1);
}

void sub_1D4F0CDF8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D4F0CF18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1D4F0D0CC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1D4F0D240(_Unwind_Exception *a1)
{
  uint64_t v1;
  int v2;
  void *v3;

  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 24))(v1);
  _Unwind_Resume(a1);
}

void sub_1D4F0D358(_Unwind_Exception *a1)
{
  uint64_t v1;
  int v2;
  void *v3;

  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 24))(v1);
  _Unwind_Resume(a1);
}

void sub_1D4F0D41C(_Unwind_Exception *a1)
{
  uint64_t v1;
  int v2;
  void *v3;

  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 24))(v1);
  _Unwind_Resume(a1);
}

void sub_1D4F0D4D0(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  int v2;

  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 24))(v1);
  _Unwind_Resume(exception_object);
}

void sub_1D4F0D608(_Unwind_Exception *a1)
{
  uint64_t v1;
  int v2;
  void *v3;

  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 24))(v1);
  _Unwind_Resume(a1);
}

void sub_1D4F0D6E8(_Unwind_Exception *a1)
{
  uint64_t v1;
  int v2;
  void *v3;

  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 24))(v1);
  _Unwind_Resume(a1);
}

void sub_1D4F0D808(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D4F0D8A0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D4F0D958(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D4F0DA98(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D4F0DB50(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D4F0DBD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1D4F0DC30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

BOOL MNSGlobalState::AddOrRemoveContact(MNSGlobalState *this, objc_object *a2, char a3)
{
  void *v4;
  const __CFDictionary *v5;

  ContactOrConnectionSet::AddOrRemoveItem((id *)this + 13, a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v4, CFSTR("entries"));
    v5 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    MIDIObjectSetDictionaryProperty(*((_DWORD *)this + 23), CFSTR("apple.midirtp.addressbook"), v5);

  }
  return v4 != 0;
}

void sub_1D4F0DCDC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id ContactOrConnectionSet::AddOrRemoveItem(id *this, objc_object *a2, char a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_object *v20;
  void *v21;
  id obj;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v20 = a2;
  -[objc_object host](v20, "host");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = this[1];
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v25;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v25 != v7)
        objc_enumerationMutation(v5);
      objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v8), "host");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "hasSameAddressAs:", v21);

      if ((v10 & 1) != 0)
        break;
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_13;
      }
    }

    if ((a3 & 1) == 0)
    {
      objc_msgSend(this[1], "removeObject:", v20);
      goto LABEL_16;
    }
    if (!*(_BYTE *)this)
      goto LABEL_14;
    goto LABEL_12;
  }
LABEL_13:

  if ((a3 & 1) == 0)
  {
LABEL_12:
    v23 = 0;
    goto LABEL_24;
  }
LABEL_14:
  objc_msgSend(this[1], "addObject:", v20);
LABEL_16:
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = this[1];
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v29 != v12)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "host");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)MEMORY[0x1E0C99D80];
        objc_msgSend(v14, "name");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addressAsText");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "dictionaryWithObjectsAndKeys:", v16, CFSTR("name"), v17, CFSTR("address"), 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "addObject:", v18);

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v11);
  }

LABEL_24:
  return v23;
}

void sub_1D4F0DF94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, void *a16)
{

  _Unwind_Resume(a1);
}

void ContactOrConnectionSet::ContactOrConnectionSet(ContactOrConnectionSet *this, char a2)
{
  id v3;
  void *v4;

  *(_BYTE *)this = a2;
  *((_QWORD *)this + 1) = 0;
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v4 = (void *)*((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = v3;

}

void sub_1D4F0E078(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Unwind_Resume(a1);
}

void ContactOrConnectionSet::UpdateFromDriver(id *this, NSArray *a2)
{
  uint64_t v3;
  uint64_t i;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  void *v15;
  id v16;
  NSArray *v17;
  NSArray *obj;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v17 = a2;
  v19 = (void *)objc_msgSend(this[1], "mutableCopy");
  objc_msgSend(this[1], "removeAllObjects");
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v17;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v3)
  {
    v20 = *(_QWORD *)v27;
    do
    {
      v21 = v3;
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v27 != v20)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKey:", CFSTR("name"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKey:", CFSTR("address"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        +[MIDINetworkHost fromAddressAsText:withName:](MIDINetworkHost, "fromAddressAsText:withName:", v7, v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (*(_BYTE *)this && (!v6 || !objc_msgSend(v6, "length")))
        {
          objc_msgSend(v8, "displayName");
          v9 = objc_claimAutoreleasedReturnValue();

          v6 = (void *)v9;
          objc_msgSend(v8, "setName:", v9);
        }
        if (v8)
        {
          v24 = 0u;
          v25 = 0u;
          v22 = 0u;
          v23 = 0u;
          v10 = v19;
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          if (v11)
          {
            v12 = *(_QWORD *)v23;
            while (2)
            {
              for (j = 0; j != v11; ++j)
              {
                if (*(_QWORD *)v23 != v12)
                  objc_enumerationMutation(v10);
                v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * j);
                objc_msgSend(v14, "host");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v15, "hasSameAddressAs:", v8))
                {
                  objc_msgSend(this[1], "addObject:", v14);
                  objc_msgSend(v10, "removeObject:", v14);
                  objc_msgSend(v15, "setName:", v6);

                  goto LABEL_24;
                }

              }
              v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
              if (v11)
                continue;
              break;
            }
          }

          if (*(_BYTE *)this)
          {
            +[MIDINetworkConnection connectionWithHost:](MIDINetworkConnection, "connectionWithHost:", v8);
            v16 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v16 = v8;
          }
          v10 = v16;
          objc_msgSend(this[1], "addObject:", v16);
LABEL_24:

        }
      }
      v3 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v3);
  }

}

void sub_1D4F0E368(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{

  _Unwind_Resume(a1);
}

void sub_1D4F0E478(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D4F0E540(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D4F0E5C8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D4F0E728(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D4F0E978(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  _Unwind_Resume(a1);
}

void sub_1D4F0EB58(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1D4F0EC08(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1D4F0ECB0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1D4F0EE3C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1D4F0EF4C(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  int v2;

  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 24))(v1);
  _Unwind_Resume(exception_object);
}

void std::__call_once_proxy[abi:ne180100]<std::tuple<+[MIDINetworkSession defaultSession]::$_0 &&>>()
{
  uint64_t v0;
  __CFNotificationCenter *LocalCenter;
  uint64_t v2;
  int v3;
  ItemCount v4;
  uint64_t v5;
  MIDIDeviceRef v6;
  CFStringRef str[6];

  v0 = operator new();
  CADeprecated::CAMutex::CAMutex((CADeprecated::CAMutex *)v0, "");
  *(_QWORD *)(v0 + 88) = 0;
  *(_QWORD *)(v0 + 96) = 0;
  ContactOrConnectionSet::ContactOrConnectionSet((ContactOrConnectionSet *)(v0 + 104), 0);
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver(LocalCenter, (const void *)v0, (CFNotificationCallback)MNSGlobalState::AppResumed, CFSTR("UIApplicationResumedNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  str[0] = (CFStringRef)MEMORY[0x1E0C809B0];
  str[1] = (CFStringRef)0x40000000;
  str[2] = (CFStringRef)__MIDIClientCreate_block_invoke;
  str[3] = (CFStringRef)&__block_descriptor_tmp_2629;
  str[4] = (CFStringRef)MNSGlobalState::CoreMIDINotifyCallback;
  str[5] = 0;
  v2 = MIDIClientCreateWithBlockInternal(CFSTR("NetSetup"), (int *)(v0 + 88), str, 0);
  if ((_DWORD)v2)
  {
    NSLog(CFSTR("CoreMIDI initialization failure (%d)"), v2);
    goto LABEL_3;
  }
  v3 = MIDIGetNumberOfDevices();
  if (v3 < 1)
    goto LABEL_12;
  v4 = 0;
  v5 = v3;
  while (1)
  {
    v6 = MIDIGetDevice(v4);
    str[0] = 0;
    if (!MIDIObjectGetStringProperty(v6, kMIDIPropertyDriverOwner, str))
      break;
LABEL_9:
    if (v5 == ++v4)
      goto LABEL_12;
  }
  if (!CFEqual(str[0], CFSTR("com.apple.AppleMIDIRTPDriver")))
  {
    CFRelease(str[0]);
    goto LABEL_9;
  }
  *(_DWORD *)(v0 + 92) = v6;
  CFRelease(str[0]);
LABEL_12:
  if (*(_DWORD *)(v0 + 92))
  {
    MNSGlobalState::LoadContacts((MNSGlobalState *)v0);
    goto LABEL_14;
  }
  NSLog(CFSTR("Couldn't find MIDI network driver"));
LABEL_3:
  globals = v0;

  *(_QWORD *)v0 = &off_1E98B9D98;
  pthread_mutex_destroy((pthread_mutex_t *)(v0 + 24));
  MEMORY[0x1D826BA98](v0, 0x10F0C40D81B7B60);
  v0 = 0;
LABEL_14:
  globals = v0;
}

void sub_1D4F0F15C(_Unwind_Exception *a1)
{
  id *v1;

  CADeprecated::CAMutex::~CAMutex((CADeprecated::CAMutex *)v1);
  MEMORY[0x1D826BA98](v1, 0x10F0C40D81B7B60);
  _Unwind_Resume(a1);
}

void MNSGlobalState::AppResumed(MNSGlobalState *this, id *a2, void *a3, const __CFString *a4, const void *a5, const __CFDictionary *a6)
{
  uint64_t v6;
  int v8;
  id v9;

  v6 = globals;
  if (globals)
  {
    v8 = (*(uint64_t (**)(uint64_t, id *, void *, const __CFString *, const void *, const __CFDictionary *))(*(_QWORD *)globals + 16))(globals, a2, a3, a4, a5, a6);
    MNSGlobalState::LoadContacts((MNSGlobalState *)a2);
    v9 = a2[12];
    if (v9)
    {
      objc_msgSend(v9, "sessionChanged");
      objc_msgSend(a2[12], "contactsChanged");
    }
    if (v8)
      (*(void (**)(uint64_t))(*(_QWORD *)v6 + 24))(v6);
  }
}

void sub_1D4F0F234(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  int v2;

  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 24))(v1);
  _Unwind_Resume(exception_object);
}

void MNSGlobalState::CoreMIDINotifyCallback(MNSGlobalState *this, const MIDINotification *a2, void *a3)
{
  int v4;
  uint64_t v5;
  int v6;
  void *v7;
  int v8;
  int v9;
  id v10;
  void *v11;

  if (*(_DWORD *)this == 4)
  {
    v4 = *((_DWORD *)this + 3);
    if (v4)
    {
      if (v4 == 1)
      {
        v5 = globals;
        v6 = (*(uint64_t (**)(uint64_t, const MIDINotification *, void *))(*(_QWORD *)globals + 16))(globals, a2, a3);
        v7 = *(void **)(globals + 96);
        if (v7)
          objc_msgSend(v7, "sessionChanged");
        if (v6)
LABEL_15:
          (*(void (**)(uint64_t))(*(_QWORD *)v5 + 24))(v5);
      }
    }
    else
    {
      v8 = *((_DWORD *)this + 2);
      v5 = globals;
      v9 = (*(uint64_t (**)(uint64_t, const MIDINotification *, void *))(*(_QWORD *)globals + 16))(globals, a2, a3);
      if (*(_DWORD *)(globals + 92) == v8)
      {
        v10 = *((id *)this + 2);
        if (objc_msgSend(v10, "isEqualToString:", CFSTR("apple.midirtp.addressbook")))
          MNSGlobalState::LoadContacts((MNSGlobalState *)globals);
        v11 = *(void **)(globals + 96);
        if (v11)
          objc_msgSend(v11, "contactsChanged");

      }
      if (v9)
        goto LABEL_15;
    }
  }
}

void sub_1D4F0F368(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  int v2;

  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 24))(v1);
  _Unwind_Resume(exception_object);
}

void MNSGlobalState::LoadContacts(MNSGlobalState *this)
{
  OSStatus DictionaryProperty;
  CFDictionaryRef v3;
  BOOL v4;
  NSArray *v5;
  CFDictionaryRef outDict;

  outDict = 0;
  DictionaryProperty = MIDIObjectGetDictionaryProperty(*((_DWORD *)this + 23), CFSTR("apple.midirtp.addressbook"), &outDict);
  v3 = outDict;
  if (DictionaryProperty)
    v4 = 1;
  else
    v4 = outDict == 0;
  if (!v4)
  {
    -[__CFDictionary objectForKey:](outDict, "objectForKey:", CFSTR("entries"));
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    ContactOrConnectionSet::UpdateFromDriver((id *)this + 13, v5);

  }
}

void sub_1D4F0F434(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void ClientNotification::serialize(UInt8 *bytes, CFMutableDataRef theData)
{
  uint64_t v4;
  void *v5;
  id v6;
  const UInt8 *v7;
  unsigned int Length;
  CFIndex v9;
  CFIndex v10;
  UniChar *v11;
  UInt8 bytesa[8];
  CFRange v13;

  CFDataAppendBytes(theData, bytes, *((unsigned int *)bytes + 1));
  if ((*(_DWORD *)bytes - 4096) >= 3)
  {
    if (*(_DWORD *)bytes == 4)
    {
      Length = CFStringGetLength(*((CFStringRef *)bytes + 2));
      v9 = Length;
      v10 = 2 * Length;
      *(_DWORD *)bytesa = 2 * Length;
      v11 = (UniChar *)operator new[]();
      v13.location = 0;
      v13.length = v9;
      CFStringGetCharacters(*((CFStringRef *)bytes + 2), v13, v11);
      CFDataAppendBytes(theData, bytesa, 4);
      CFDataAppendBytes(theData, (const UInt8 *)v11, v10);
      MEMORY[0x1D826BA80](v11, 0x1000C80BDFB0063);
    }
  }
  else
  {
    v4 = *((_QWORD *)bytes + 2);
    *(_QWORD *)bytesa = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 0, bytesa);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)bytesa = objc_msgSend(v5, "length");
    CFDataAppendBytes(theData, bytesa, 4);
    v6 = objc_retainAutorelease(v5);
    v7 = (const UInt8 *)objc_msgSend(v6, "bytes");
    CFDataAppendBytes(theData, v7, *(unsigned int *)bytesa);

  }
}

void sub_1D4F0F590(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void MIDIServerXPC_Client::~MIDIServerXPC_Client(MIDIServerXPC_Client *this)
{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = off_1E98B85B8;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
}

{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = off_1E98B85B8;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  JUMPOUT(0x1D826BA98);
}

void MIDIServerXPC_Client::dispatch_message(MIDIServerXPC_Client *this@<X0>, xpc_object_t *a2@<X1>, swix::message *a3@<X8>)
{
  xpc_object_t v5;
  xpc_object_t v6;
  xpc_object_t v7;
  char **v8;
  const UniChar *bytes_ptr;
  size_t length;
  __CFRunLoop *v11;
  void *v12;
  CFDataRef v13;
  __CFRunLoop *v14;
  CFTypeRef v15;
  const void *v16;
  char *v17;
  uint64_t v18;
  char ***v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  _BOOL4 v23;
  xpc_object_t v24;
  xpc_connection_t v25;
  char *v26;
  CFTypeRef *v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  void *exception;
  char v32[8];
  xpc_object_t object;
  CFTypeRef cf[2];
  uint64_t (*v35)(uint64_t, xpc_object_t);
  void *v36;
  xpc_object_t *p_block;
  uint64_t v38;
  xpc_object_t message;
  xpc_connection_t connection;
  _QWORD v41[3];
  _QWORD *v42;
  xpc_object_t block;
  uint64_t v44;
  void *v45;
  void *v46;
  char **v47;
  CFTypeRef v48;
  char ***v49;
  uint8_t buf[4];
  xpc_connection_t v51;
  __int16 v52;
  CFTypeRef *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  swix::message::message(a3);
  if (*(_DWORD *)a2 == 220460584)
  {
    v5 = xpc_null_create();
    swix::xpcobj_coder<swix::data>::decode(&block, a2[1], "data");
    v6 = block;
    v7 = xpc_null_create();
    block = v7;
    xpc_release(v5);
    xpc_release(v7);
    v8 = (char **)*((_QWORD *)this + 2);
    if ((*((unsigned int (**)(char **))*v8 + 7))(v8))
      goto LABEL_37;
    bytes_ptr = (const UniChar *)xpc_data_get_bytes_ptr(v6);
    length = xpc_data_get_length(v6);
    v11 = (__CFRunLoop *)v8[55];
    v12 = (void *)MEMORY[0x1E0C809B0];
    if (!v11 || v11 == CFRunLoopGetCurrent())
    {
      if (MIDIProcess::Notify(v8, bytes_ptr, length))
        goto LABEL_37;
    }
    else
    {
      v13 = CFDataCreate(0, (const UInt8 *)bytes_ptr, length);
      if (!v13)
      {
        exception = __cxa_allocate_exception(0x10uLL);
        MEMORY[0x1D826B7EC](exception, "Could not construct");
      }
      applesauce::CF::DataRef::DataRef((applesauce::CF::DataRef *)cf, v13);
      v14 = (__CFRunLoop *)v8[55];
      block = v12;
      v44 = 1174405120;
      v45 = ___ZN14MIDIProcessXPC14DispatchNotifyEPKvm_block_invoke;
      v46 = &__block_descriptor_tmp_1722;
      v47 = v8;
      v15 = cf[0];
      if (cf[0])
        CFRetain(cf[0]);
      v16 = (const void *)*MEMORY[0x1E0C9B270];
      v48 = v15;
      CFRunLoopPerformBlock(v14, v16, &block);
      CFRunLoopWakeUp((CFRunLoopRef)v8[55]);
      if (v48)
        CFRelease(v48);
      if (cf[0])
        CFRelease(cf[0]);
    }
    v17 = v8[54];
    v41[0] = &off_1E98B87C8;
    v42 = v41;
    swix::encode_message::encode_message((swix::encode_message *)v32, 220460585);
    v18 = *((_QWORD *)v17 + 1);
    if (!v18)
      std::terminate();
    block = v12;
    v44 = 1174405120;
    v45 = ___ZN20MIDIServerXPC_Client23acknowledgeNotificationENSt3__18functionIFvN4swix6resultIJEEEEEE_block_invoke;
    v46 = &__block_descriptor_tmp_3222;
    v19 = &v47;
    v20 = (uint64_t)v42;
    if (v42)
    {
      if (v42 == v41)
      {
        v49 = &v47;
        (*(void (**)(uint64_t, _QWORD *))(v41[0] + 24))((uint64_t)v41, &v47);
LABEL_19:
        swix::connection::xpc_connection((swix::connection *)&connection, v18);
        swix::encode_message::xpc_message((swix::encode_message *)&message, (uint64_t)v32);
        v21 = *(_QWORD *)(v18 + 8);
        if (*(_BYTE *)(v21 + 88))
        {
          v22 = *(NSObject **)(v21 + 80);
          v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
          v24 = message;
          if (v23)
          {
            v25 = connection;
            v26 = (char *)MEMORY[0x1D826C4DC](message);
            std::string::basic_string[abi:ne180100]<0>(cf, v26);
            free(v26);
            if (SHIBYTE(v35) >= 0)
              v27 = cf;
            else
              v27 = (CFTypeRef *)cf[0];
            *(_DWORD *)buf = 134218242;
            v51 = v25;
            v52 = 2080;
            v53 = v27;
            _os_log_impl(&dword_1D4E88000, v22, OS_LOG_TYPE_DEFAULT, "%p send msg %s", buf, 0x16u);
            if (SHIBYTE(v35) < 0)
              operator delete((void *)cf[0]);
          }
        }
        else
        {
          v24 = message;
        }
        cf[0] = v12;
        cf[1] = (CFTypeRef)0x40000000;
        v35 = ___ZN4swix10connection21send_with_async_replyERKNS_14encode_messageEU13block_pointerFvPvE_block_invoke;
        v36 = &unk_1E98BA1B8;
        p_block = &block;
        v38 = v18;
        xpc_connection_send_message_with_reply(connection, v24, 0, cf);
        xpc_release(v24);
        xpc_release(connection);
        if (v49 == &v47)
        {
          v28 = 4;
        }
        else
        {
          if (!v49)
          {
LABEL_32:
            xpc_release(object);
            v29 = v42;
            if (v42 == v41)
            {
              v30 = 4;
              v29 = v41;
              goto LABEL_36;
            }
            if (v42)
            {
              v30 = 5;
LABEL_36:
              (*(void (**)(void))(*v29 + 8 * v30))();
            }
LABEL_37:
            xpc_release(v6);
            return;
          }
          v28 = 5;
          v19 = v49;
        }
        ((void (*)(char ***))(*v19)[v28])(v19);
        goto LABEL_32;
      }
      v20 = (*(uint64_t (**)(void))(*v42 + 16))();
    }
    v49 = (char ***)v20;
    goto LABEL_19;
  }
}

void sub_1D4F0FA58(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, xpc_object_t object,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  __break(1u);
}

void sub_1D4F0FBB8()
{
  xpc_object_t *v0;
  void *v1;

  xpc_release(v1);
  swix::encode_message::~encode_message(v0);
  JUMPOUT(0x1D4F0FBE0);
}

void sub_1D4F0FBD8(_Unwind_Exception *exception_object, int a2)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

swix::message *swix::message::message(swix::message *this)
{
  *(_QWORD *)this = 0;
  *((_QWORD *)this + 1) = xpc_null_create();
  *((_QWORD *)this + 2) = 0;
  return this;
}

void swix::xpcobj_coder<swix::data>::decode(xpc_object_t *a1, xpc_object_t xdict, char *key)
{
  xpc_object_t value;
  xpc_object_t v5;

  value = xpc_dictionary_get_value(xdict, key);
  if (value)
  {
    v5 = value;
    xpc_retain(value);
    *a1 = v5;
  }
  else
  {
    v5 = xpc_null_create();
    *a1 = v5;
    if (!v5)
      goto LABEL_5;
  }
  if (MEMORY[0x1D826C5A8](v5) == MEMORY[0x1E0C812E8])
  {
    xpc_retain(v5);
    goto LABEL_7;
  }
LABEL_5:
  *a1 = xpc_null_create();
LABEL_7:
  xpc_release(v5);
}

void swix::encode_message::~encode_message(xpc_object_t *this)
{
  xpc_release(this[1]);
  this[1] = 0;
}

void MIDIServerXPC_Server::~MIDIServerXPC_Server(MIDIServerXPC_Server *this)
{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = off_1E98B85B8;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
}

{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = off_1E98B85B8;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  JUMPOUT(0x1D826BA98);
}

void MIDIServerXPC_Server::dispatch_message(MIDIServerXPC_Server **this@<X0>, xpc_object_t *a2@<X1>, xpc_object_t *a3@<X8>)
{
  MIDIServerXPC_Server *v6;
  int Server;
  xpc_object_t v8;
  void *v9;
  _BOOL4 v10;
  unint64_t v11;
  int v12;
  MIDIServerXPC_Server *v13;
  unint64_t v14;
  xpc_object_t v15;
  int64_t v16;
  MIDIServerXPC_Server *v17;
  uint64_t v18;
  unint64_t *v19;
  unint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  const swix::string *v23;
  unint64_t Source;
  int v25;
  const swix::string *v26;
  unint64_t Destination;
  int v28;
  MIDIServerXPC_Server *v29;
  unint64_t v30;
  const swix::string *v31;
  unint64_t InputPort;
  int v33;
  const swix::string *v34;
  unint64_t OutputPort;
  int v36;
  MIDIServerXPC_Server *v37;
  unint64_t v38;
  MIDIServer *v39;
  int v40;
  uint64_t v41;
  unint64_t v42;
  MIDIServerXPC_Server *v43;
  int v44;
  unint64_t v45;
  const swix::string *v46;
  unint64_t v47;
  int64_t v48;
  const swix::string *v49;
  unint64_t IntegerProperty;
  int v51;
  const swix::string *v52;
  unint64_t v53;
  int64_t v54;
  int v55;
  const swix::data *v56;
  unint64_t v57;
  xpc_object_t v58;
  int64_t v59;
  int v60;
  const swix::data *v61;
  unint64_t v62;
  int v63;
  const swix::string *v64;
  unint64_t v65;
  xpc_object_t v66;
  int64_t v67;
  unsigned int DiscoveryMUID;
  MIDIServerXPC_Server *v69;
  char v70;
  unint64_t Setup;
  int v72;
  const swix::data *v73;
  unint64_t v74;
  int v75;
  MIDIServerXPC_Server *v76;
  unint64_t v77;
  int v78;
  const swix::string *v79;
  unint64_t v80;
  int v81;
  unint64_t v82;
  int v83;
  MIDIServerXPC_Server *v84;
  int v85;
  unint64_t v86;
  MIDIServerXPC_Server *v87;
  uint64_t v88;
  uint64_t v89;
  unint64_t v90;
  MIDIServerXPC_Server *v91;
  _BOOL4 v92;
  unint64_t v93;
  MIDIServerXPC_Server *v94;
  _BOOL4 v95;
  unint64_t v96;
  unint64_t v97;
  MIDIServer *v98;
  _BOOL4 v99;
  int v100;
  MIDIServerXPC_Server *v101;
  unint64_t v102;
  unint64_t v103;
  int v104;
  MIDIServerXPC_Server *v105;
  unint64_t v106;
  MIDIServer *v107;
  int v108;
  const swix::data *v109;
  unint64_t v110;
  int v111;
  MIDIServerXPC_Server *v112;
  int64_t v113;
  char v114;
  char v115;
  int v116;
  _BOOL4 v117;
  int v118;
  unint64_t v119;
  int v120;
  MIDIServerXPC_Server *v121;
  unint64_t v122;
  const swix::data *v123;
  unint64_t v124;
  MIDIServerXPC_Server *v125;
  _BOOL4 v126;
  unint64_t v127;
  int v128;
  unint64_t v129;
  xpc_object_t v130;
  xpc_object_t object;
  swix::string *v132;
  BOOL v133[8];
  uint64_t uint64;
  xpc_object_t value;
  char v136;
  xpc_object_t v137;
  xpc_object_t xstring[2];
  uint64_t v139[7];
  void *v140;
  _BYTE v141[24];
  _BYTE *v142;
  uint64_t v143;

  v143 = *MEMORY[0x1E0C80C00];
  v6 = swix::message::message((swix::message *)a3);
  switch(*(_DWORD *)a2)
  {
    case 0xD23F624:
      Server = MIDIServerXPC_Server::queryServer(v6);
      swix::encode_message::encode_message((swix::encode_message *)&v130, a2);
      swix::encode_message::operator=(a3, &v130);
      xpc_release(object);
      xpc_dictionary_set_int64(a3[1], ".error", 0);
      xpc_dictionary_set_int64(a3[1], "process", Server);
      return;
    case 0xD23F625:
      v8 = xpc_null_create();
      v137 = v8;
      LOBYTE(xstring[0]) = 0;
      swix::xpcobj_coder<applesauce::xpc::object>::decode(&v140, a2[1]);
      v9 = v140;
      v137 = v140;
      xpc_release(v8);
      v140 = 0;
      v10 = xpc_dictionary_get_BOOL(a2[1], "isIntel");
      LOBYTE(xstring[0]) = v10;
      MIDIServerXPC_Server::registerProcess((uint64_t)this, (uint64_t)&v137, v10);
      swix::encode_message::encode_message((swix::encode_message *)&v130, a2);
      swix::encode_message::operator=(a3, &v130);
      xpc_release(object);
      xpc_dictionary_set_int64(a3[1], ".error", 0);
      xpc_release(v9);
      return;
    case 0xD23F626:
      v137 = xpc_null_create();
      swix::xpcobj_coder<swix::string>::decode(&v130, a2[1], "name");
      swix::string::operator=(&v137, &v130);
      xpc_release(v130);
      v11 = MIDIServerXPC_Server::createClient(this[1], &v137);
      swix::encode_message::encode_message((swix::encode_message *)&v130, a2);
      swix::encode_message::operator=(a3, &v130);
      xpc_release(object);
      if (v11 >= 0x100000000)
        v12 = 0;
      else
        v12 = v11;
      xpc_dictionary_set_int64(a3[1], ".error", v12);
      if (!v12)
        xpc_dictionary_set_uint64(a3[1], "client", v11);
      goto LABEL_223;
    case 0xD23F627:
      v13 = (MIDIServerXPC_Server *)swix::coder<unsigned int>::decode(a2[1], "client");
      v14 = MIDIServerXPC_Server::disposeClient(v13);
      swix::encode_message::encode_message((swix::encode_message *)&v130, a2);
      swix::encode_message::operator=(a3, &v130);
      xpc_release(object);
      v15 = a3[1];
      if ((v14 & 0xFF00000000) != 0)
        v16 = 0;
      else
        v16 = (int)v14;
      goto LABEL_227;
    case 0xD23F629:
      swix::decode_message::decode_message((swix::decode_message *)v139, (const swix::decode_message *)a2);
      v17 = this[1];
      if (!v17)
        std::terminate();
      v139[4] = (uint64_t)&off_1E98B8568;
      v139[5] = *((_QWORD *)v17 + 1);
      v18 = *((_QWORD *)v17 + 2);
      v139[6] = v18;
      if (v18)
      {
        v19 = (unint64_t *)(v18 + 8);
        do
          v20 = __ldxr(v19);
        while (__stxr(v20 + 1, v19));
      }
      _ZNSt3__18functionIFvN4swix6resultIJEEEEEC1IZN20MIDIServerXPC_Server16dispatch_messageERKNS1_14decode_messageEE3__0vEET_((uint64_t)v141, v139);
      MIDIServerXPC_Server::acknowledgeNotification((uint64_t)this[1], (uint64_t)v141);
      v21 = v142;
      if (v142 == v141)
      {
        v22 = 4;
        v21 = v141;
      }
      else
      {
        if (!v142)
          goto LABEL_230;
        v22 = 5;
      }
      (*(void (**)(void))(*v21 + 8 * v22))();
LABEL_230:
      MIDIServerXPC_Server::dispatch_message(swix::decode_message const&)::$_0::~$_0((uint64_t)v139);
      return;
    case 0xD23F62A:
      LODWORD(v130) = 0;
      object = xpc_null_create();
      LODWORD(v132) = 0;
      LODWORD(v130) = swix::coder<unsigned int>::decode(a2[1], "client");
      swix::xpcobj_coder<swix::string>::decode(&v137, a2[1], "name");
      swix::string::operator=(&object, &v137);
      xpc_release(v137);
      v23 = (const swix::string *)swix::coder<int>::decode(a2[1], "proto");
      LODWORD(v132) = (_DWORD)v23;
      Source = MIDIServerXPC_Server::createSource((MIDIServerXPC_Server *)v130, object, v23);
      swix::encode_message::encode_message((swix::encode_message *)&v137, a2);
      swix::encode_message::operator=(a3, &v137);
      xpc_release(xstring[0]);
      if ((Source & 0xFF00000000) != 0)
        v25 = 0;
      else
        v25 = Source;
      xpc_dictionary_set_int64(a3[1], ".error", v25);
      if (!v25)
        xpc_dictionary_set_uint64(a3[1], "sourceRef", Source);
      goto LABEL_136;
    case 0xD23F62B:
      LODWORD(v130) = 0;
      object = xpc_null_create();
      LODWORD(v132) = 0;
      LODWORD(v130) = swix::coder<unsigned int>::decode(a2[1], "client");
      swix::xpcobj_coder<swix::string>::decode(&v137, a2[1], "name");
      swix::string::operator=(&object, &v137);
      xpc_release(v137);
      v26 = (const swix::string *)swix::coder<int>::decode(a2[1], "proto");
      LODWORD(v132) = (_DWORD)v26;
      Destination = MIDIServerXPC_Server::createDestination((MIDIServerXPC_Server *)v130, object, v26);
      swix::encode_message::encode_message((swix::encode_message *)&v137, a2);
      swix::encode_message::operator=(a3, &v137);
      xpc_release(xstring[0]);
      if ((Destination & 0xFF00000000) != 0)
        v28 = 0;
      else
        v28 = Destination;
      xpc_dictionary_set_int64(a3[1], ".error", v28);
      if (!v28)
        xpc_dictionary_set_uint64(a3[1], "destination", Destination);
      goto LABEL_136;
    case 0xD23F62C:
      v29 = (MIDIServerXPC_Server *)swix::coder<unsigned int>::decode(a2[1], "endpointRef");
      v30 = MIDIServerXPC_Server::disposeEndpoint(v29);
      swix::encode_message::encode_message((swix::encode_message *)&v130, a2);
      swix::encode_message::operator=(a3, &v130);
      xpc_release(object);
      v15 = a3[1];
      if ((v30 & 0xFF00000000) != 0)
        v16 = 0;
      else
        v16 = (int)v30;
      goto LABEL_227;
    case 0xD23F62D:
      LODWORD(v130) = 0;
      object = xpc_null_create();
      LODWORD(v132) = 0;
      LODWORD(v130) = swix::coder<unsigned int>::decode(a2[1], "client");
      swix::xpcobj_coder<swix::string>::decode(&v137, a2[1], "name");
      swix::string::operator=(&object, &v137);
      xpc_release(v137);
      v31 = (const swix::string *)swix::coder<int>::decode(a2[1], "proto");
      LODWORD(v132) = (_DWORD)v31;
      InputPort = MIDIServerXPC_Server::createInputPort((MIDIServerXPC_Server *)v130, object, v31);
      swix::encode_message::encode_message((swix::encode_message *)&v137, a2);
      swix::encode_message::operator=(a3, &v137);
      xpc_release(xstring[0]);
      if ((InputPort & 0xFF00000000) != 0)
        v33 = 0;
      else
        v33 = InputPort;
      xpc_dictionary_set_int64(a3[1], ".error", v33);
      if (!v33)
        xpc_dictionary_set_uint64(a3[1], "portRef", InputPort);
      goto LABEL_136;
    case 0xD23F62E:
      LODWORD(v137) = 0;
      xstring[0] = xpc_null_create();
      LODWORD(v137) = swix::coder<unsigned int>::decode(a2[1], "client");
      swix::xpcobj_coder<swix::string>::decode(&v130, a2[1], "name");
      swix::string::operator=(xstring, &v130);
      xpc_release(v130);
      OutputPort = MIDIServerXPC_Server::createOutputPort((MIDIServerXPC_Server *)v137, xstring[0], v34);
      swix::encode_message::encode_message((swix::encode_message *)&v130, a2);
      swix::encode_message::operator=(a3, &v130);
      xpc_release(object);
      if ((OutputPort & 0xFF00000000) != 0)
        v36 = 0;
      else
        v36 = OutputPort;
      xpc_dictionary_set_int64(a3[1], ".error", v36);
      if (!v36)
        xpc_dictionary_set_uint64(a3[1], "portRef", OutputPort);
      goto LABEL_206;
    case 0xD23F62F:
      v37 = (MIDIServerXPC_Server *)swix::coder<unsigned int>::decode(a2[1], "portRef");
      v38 = MIDIServerXPC_Server::disposePort(v37);
      swix::encode_message::encode_message((swix::encode_message *)&v130, a2);
      swix::encode_message::operator=(a3, &v130);
      xpc_release(object);
      v15 = a3[1];
      if ((v38 & 0xFF00000000) != 0)
        v16 = 0;
      else
        v16 = (int)v38;
      goto LABEL_227;
    case 0xD23F630:
      v39 = (MIDIServer *)swix::coder<unsigned int>::decode(a2[1], "port");
      v40 = swix::coder<unsigned int>::decode(a2[1], "source");
      v41 = swix::coder<IPCPtr>::decode(a2[1]);
      v42 = MIDIServerXPC_Server::portConnectSource(v39, v40, v41);
      swix::encode_message::encode_message((swix::encode_message *)&v130, a2);
      swix::encode_message::operator=(a3, &v130);
      xpc_release(object);
      v15 = a3[1];
      if ((v42 & 0xFF00000000) != 0)
        v16 = 0;
      else
        v16 = (int)v42;
      goto LABEL_227;
    case 0xD23F631:
      v43 = (MIDIServerXPC_Server *)swix::coder<unsigned int>::decode(a2[1], "port");
      v44 = swix::coder<unsigned int>::decode(a2[1], "source");
      v45 = MIDIServerXPC_Server::portDisconnectSource(v43, v44);
      swix::encode_message::encode_message((swix::encode_message *)&v130, a2);
      swix::encode_message::operator=(a3, &v130);
      xpc_release(object);
      v15 = a3[1];
      if ((v45 & 0xFF00000000) != 0)
        v16 = 0;
      else
        v16 = (int)v45;
      goto LABEL_227;
    case 0xD23F632:
      LODWORD(v130) = 0;
      object = xpc_null_create();
      LODWORD(v132) = 0;
      LODWORD(v130) = swix::coder<unsigned int>::decode(a2[1], "object");
      swix::xpcobj_coder<swix::string>::decode(&v137, a2[1], "propertyID");
      swix::string::operator=(&object, &v137);
      xpc_release(v137);
      v46 = (const swix::string *)swix::coder<int>::decode(a2[1], "value");
      LODWORD(v132) = (_DWORD)v46;
      v47 = MIDIServerXPC_Server::objectSetIntegerProperty((MIDIServerXPC_Server *)v130, object, v46);
      swix::encode_message::encode_message((swix::encode_message *)&v137, a2);
      swix::encode_message::operator=(a3, &v137);
      xpc_release(xstring[0]);
      if ((v47 & 0xFF00000000) != 0)
        v48 = 0;
      else
        v48 = (int)v47;
      xpc_dictionary_set_int64(a3[1], ".error", v48);
      xpc_release(object);
      return;
    case 0xD23F633:
      LODWORD(v137) = 0;
      xstring[0] = xpc_null_create();
      LODWORD(v137) = swix::coder<unsigned int>::decode(a2[1], "object");
      swix::xpcobj_coder<swix::string>::decode(&v130, a2[1], "propertyID");
      swix::string::operator=(xstring, &v130);
      xpc_release(v130);
      IntegerProperty = MIDIServerXPC_Server::objectGetIntegerProperty((MIDIServerXPC_Server *)v137, xstring[0], v49);
      swix::encode_message::encode_message((swix::encode_message *)&v130, a2);
      swix::encode_message::operator=(a3, &v130);
      xpc_release(object);
      if ((IntegerProperty & 0xFF00000000) != 0)
        v51 = 0;
      else
        v51 = IntegerProperty;
      xpc_dictionary_set_int64(a3[1], ".error", v51);
      if (!v51)
        xpc_dictionary_set_int64(a3[1], "value", (int)IntegerProperty);
      goto LABEL_206;
    case 0xD23F634:
      std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul>,unsigned int,swix::string,swix::string>::__tuple_impl[abi:ne180100]((uint64_t)&v130);
      LODWORD(v130) = swix::coder<unsigned int>::decode(a2[1], "object");
      swix::xpcobj_coder<swix::string>::decode(&v137, a2[1], "propertyID");
      swix::string::operator=(&object, &v137);
      xpc_release(v137);
      swix::xpcobj_coder<swix::string>::decode(&v137, a2[1], "value");
      swix::string::operator=((void **)&v132, &v137);
      xpc_release(v137);
      v53 = MIDIServerXPC_Server::objectSetStringProperty((MIDIServerXPC_Server *)v130, object, (xpc_object_t *)&v132, v52);
      swix::encode_message::encode_message((swix::encode_message *)&v137, a2);
      swix::encode_message::operator=(a3, &v137);
      xpc_release(xstring[0]);
      if ((v53 & 0xFF00000000) != 0)
        v54 = 0;
      else
        v54 = (int)v53;
      xpc_dictionary_set_int64(a3[1], ".error", v54);
      std::tuple<unsigned int,swix::string,swix::string>::~tuple((uint64_t)&v130);
      return;
    case 0xD23F635:
      LODWORD(v137) = 0;
      xstring[0] = xpc_null_create();
      LODWORD(v137) = swix::coder<unsigned int>::decode(a2[1], "object");
      swix::xpcobj_coder<swix::string>::decode(&v130, a2[1], "propertyID");
      swix::string::operator=(xstring, &v130);
      xpc_release(v130);
      MIDIServerXPC_Server::objectGetStringProperty((MIDIServerXPC_Server *)&value, (MIDIServer *)v137, xstring[0]);
      swix::encode_message::encode_message((swix::encode_message *)&v130, a2);
      swix::encode_message::operator=(a3, &v130);
      xpc_release(object);
      if (v136)
        v55 = 0;
      else
        v55 = (int)value;
      xpc_dictionary_set_int64(a3[1], ".error", v55);
      if (!v55)
        xpc_dictionary_set_value(a3[1], "value", value);
      if (v136)
        xpc_release(value);
      goto LABEL_206;
    case 0xD23F636:
      std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul>,unsigned int,swix::string,swix::data>::__tuple_impl[abi:ne180100]((uint64_t)&v130);
      LODWORD(v130) = swix::coder<unsigned int>::decode(a2[1], "object");
      swix::xpcobj_coder<swix::string>::decode(&v137, a2[1], "propertyID");
      swix::string::operator=(&object, &v137);
      xpc_release(v137);
      swix::xpcobj_coder<swix::data>::decode(&v137, a2[1], "value");
      swix::data::operator=((void **)&v132, &v137);
      xpc_release(v137);
      v57 = MIDIServerXPC_Server::objectSetDataProperty((MIDIServerXPC_Server *)v130, object, (xpc_object_t *)&v132, v56);
      swix::encode_message::encode_message((swix::encode_message *)&v137, a2);
      swix::encode_message::operator=(a3, &v137);
      xpc_release(xstring[0]);
      v58 = a3[1];
      if ((v57 & 0xFF00000000) != 0)
        v59 = 0;
      else
        v59 = (int)v57;
      goto LABEL_92;
    case 0xD23F637:
      LODWORD(v137) = 0;
      xstring[0] = xpc_null_create();
      LODWORD(v137) = swix::coder<unsigned int>::decode(a2[1], "object");
      swix::xpcobj_coder<swix::string>::decode(&v130, a2[1], "propertyID");
      swix::string::operator=(xstring, &v130);
      xpc_release(v130);
      MIDIServerXPC_Server::objectGetDataProperty((MIDIServerXPC_Server *)&value, (MIDIServer *)v137, xstring[0]);
      swix::encode_message::encode_message((swix::encode_message *)&v130, a2);
      swix::encode_message::operator=(a3, &v130);
      xpc_release(object);
      if (v136)
        v60 = 0;
      else
        v60 = (int)value;
      xpc_dictionary_set_int64(a3[1], ".error", v60);
      if (!v60)
        xpc_dictionary_set_value(a3[1], "value", value);
      if (v136)
        xpc_release(value);
      goto LABEL_206;
    case 0xD23F638:
      std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul>,unsigned int,swix::string,swix::data>::__tuple_impl[abi:ne180100]((uint64_t)&v130);
      LODWORD(v130) = swix::coder<unsigned int>::decode(a2[1], "object");
      swix::xpcobj_coder<swix::string>::decode(&v137, a2[1], "propertyID");
      swix::string::operator=(&object, &v137);
      xpc_release(v137);
      swix::xpcobj_coder<swix::data>::decode(&v137, a2[1], "value");
      swix::data::operator=((void **)&v132, &v137);
      xpc_release(v137);
      v62 = MIDIServerXPC_Server::objectSetDictionaryProperty((MIDIServerXPC_Server *)v130, object, (xpc_object_t *)&v132, v61);
      swix::encode_message::encode_message((swix::encode_message *)&v137, a2);
      swix::encode_message::operator=(a3, &v137);
      xpc_release(xstring[0]);
      v58 = a3[1];
      if ((v62 & 0xFF00000000) != 0)
        v59 = 0;
      else
        v59 = (int)v62;
LABEL_92:
      xpc_dictionary_set_int64(v58, ".error", v59);
      std::tuple<unsigned int,swix::string,swix::data>::~tuple((uint64_t)&v130);
      return;
    case 0xD23F639:
      LODWORD(v137) = 0;
      xstring[0] = xpc_null_create();
      LODWORD(v137) = swix::coder<unsigned int>::decode(a2[1], "object");
      swix::xpcobj_coder<swix::string>::decode(&v130, a2[1], "propertyID");
      swix::string::operator=(xstring, &v130);
      xpc_release(v130);
      MIDIServerXPC_Server::objectGetDictionaryProperty((MIDIServerXPC_Server *)&value, (MIDIServer *)v137, xstring[0]);
      swix::encode_message::encode_message((swix::encode_message *)&v130, a2);
      swix::encode_message::operator=(a3, &v130);
      xpc_release(object);
      if (v136)
        v63 = 0;
      else
        v63 = (int)value;
      xpc_dictionary_set_int64(a3[1], ".error", v63);
      if (!v63)
        xpc_dictionary_set_value(a3[1], "value", value);
      if (v136)
        xpc_release(value);
      goto LABEL_206;
    case 0xD23F63A:
      LODWORD(v137) = 0;
      xstring[0] = xpc_null_create();
      LODWORD(v137) = swix::coder<unsigned int>::decode(a2[1], "object");
      swix::xpcobj_coder<swix::string>::decode(&v130, a2[1], "propertyID");
      swix::string::operator=(xstring, &v130);
      xpc_release(v130);
      v65 = MIDIServerXPC_Server::objectRemoveProperty((MIDIServerXPC_Server *)v137, xstring[0], v64);
      swix::encode_message::encode_message((swix::encode_message *)&v130, a2);
      swix::encode_message::operator=(a3, &v130);
      xpc_release(object);
      v66 = a3[1];
      if ((v65 & 0xFF00000000) != 0)
        v67 = 0;
      else
        v67 = (int)v65;
      goto LABEL_213;
    case 0xD23F63B:
      DiscoveryMUID = MIDIServerXPC_Server::capabilityGetDiscoveryMUID(v6);
      swix::encode_message::encode_message((swix::encode_message *)&v130, a2);
      swix::encode_message::operator=(a3, &v130);
      xpc_release(object);
      xpc_dictionary_set_int64(a3[1], ".error", 0);
      xpc_dictionary_set_uint64(a3[1], "muid", DiscoveryMUID);
      return;
    case 0xD23F63C:
      v69 = (MIDIServerXPC_Server *)swix::coder<unsigned int>::decode(a2[1], "muid");
      v70 = MIDIServerXPC_Server::capabilityMUIDCollides(v69);
      swix::encode_message::encode_message((swix::encode_message *)&v130, a2);
      swix::encode_message::operator=(a3, &v130);
      xpc_release(object);
      xpc_dictionary_set_int64(a3[1], ".error", 0);
      xpc_dictionary_set_BOOL(a3[1], "collides", v70 != 0);
      return;
    case 0xD23F63D:
      Setup = MIDIServerXPC_Server::createSetup(v6);
      swix::encode_message::encode_message((swix::encode_message *)&v130, a2);
      swix::encode_message::operator=(a3, &v130);
      xpc_release(object);
      if ((Setup & 0xFF00000000) != 0)
        v72 = 0;
      else
        v72 = Setup;
      xpc_dictionary_set_int64(a3[1], ".error", v72);
      if (!v72)
        goto LABEL_110;
      return;
    case 0xD23F63E:
      v137 = xpc_null_create();
      swix::xpcobj_coder<swix::data>::decode(&v130, a2[1], "data");
      swix::data::operator=(&v137, &v130);
      xpc_release(v130);
      v74 = MIDIServerXPC_Server::createSetupFromData(&v137, v73);
      swix::encode_message::encode_message((swix::encode_message *)&v130, a2);
      swix::encode_message::operator=(a3, &v130);
      xpc_release(object);
      if ((v74 & 0xFF00000000) != 0)
        v75 = 0;
      else
        v75 = v74;
      xpc_dictionary_set_int64(a3[1], ".error", v75);
      if (!v75)
        xpc_dictionary_set_uint64(a3[1], "setup", v74);
      goto LABEL_223;
    case 0xD23F63F:
      v76 = (MIDIServerXPC_Server *)swix::coder<unsigned int>::decode(a2[1], "setup");
      v77 = MIDIServerXPC_Server::installSetup(v76);
      swix::encode_message::encode_message((swix::encode_message *)&v130, a2);
      swix::encode_message::operator=(a3, &v130);
      xpc_release(object);
      v15 = a3[1];
      if ((v77 & 0xFF00000000) != 0)
        v16 = 0;
      else
        v16 = (int)v77;
      goto LABEL_227;
    case 0xD23F640:
      Setup = MIDIServerXPC_Server::getCurrentSetup(v6);
      swix::encode_message::encode_message((swix::encode_message *)&v130, a2);
      swix::encode_message::operator=(a3, &v130);
      xpc_release(object);
      if ((Setup & 0xFF00000000) != 0)
        v78 = 0;
      else
        v78 = Setup;
      xpc_dictionary_set_int64(a3[1], ".error", v78);
      if (!v78)
LABEL_110:
        xpc_dictionary_set_uint64(a3[1], "setup", Setup);
      return;
    case 0xD23F641:
      std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul>,swix::string,swix::string,swix::string>::__tuple_impl[abi:ne180100](&v130);
      swix::xpcobj_coder<swix::string>::decode(&v137, a2[1], "name");
      swix::string::operator=(&v130, &v137);
      xpc_release(v137);
      swix::xpcobj_coder<swix::string>::decode(&v137, a2[1], "manufacturer");
      swix::string::operator=(&object, &v137);
      xpc_release(v137);
      swix::xpcobj_coder<swix::string>::decode(&v137, a2[1], "model");
      swix::string::operator=((void **)&v132, &v137);
      xpc_release(v137);
      v80 = MIDIServerXPC_Server::createExternalDevice((MIDIServerXPC_Server *)v130, &object, (xpc_object_t *)&v132, v79);
      swix::encode_message::encode_message((swix::encode_message *)&v137, a2);
      swix::encode_message::operator=(a3, &v137);
      xpc_release(xstring[0]);
      if ((v80 & 0xFF00000000) != 0)
        v81 = 0;
      else
        v81 = v80;
      xpc_dictionary_set_int64(a3[1], ".error", v81);
      if (!v81)
        xpc_dictionary_set_uint64(a3[1], "device", v80);
      std::tuple<swix::string,swix::string,swix::string>::~tuple(&v130);
      return;
    case 0xD23F642:
      LODWORD(v130) = 0;
      object = xpc_null_create();
      LODWORD(v132) = 0;
      BYTE4(v132) = 0;
      *(_QWORD *)v133 = 0;
      uint64 = 0;
      LODWORD(v130) = swix::coder<unsigned int>::decode(a2[1], "device");
      swix::xpcobj_coder<swix::string>::decode(&v137, a2[1], "name");
      swix::string::operator=(&object, &v137);
      xpc_release(v137);
      LODWORD(v132) = swix::coder<int>::decode(a2[1], "proto");
      BYTE4(v132) = xpc_dictionary_get_BOOL(a2[1], "embedded");
      *(_QWORD *)v133 = xpc_dictionary_get_uint64(a2[1], "numSourceEndpoints");
      uint64 = xpc_dictionary_get_uint64(a2[1], "numDestinationEndpoints");
      v82 = MIDIServerXPC_Server::deviceAddEntity((MIDIServerXPC_Server *)v130, object, (const swix::string *)v132, BYTE4(v132), *(int *)v133, uint64);
      swix::encode_message::encode_message((swix::encode_message *)&v137, a2);
      swix::encode_message::operator=(a3, &v137);
      xpc_release(xstring[0]);
      if ((v82 & 0xFF00000000) != 0)
        v83 = 0;
      else
        v83 = v82;
      xpc_dictionary_set_int64(a3[1], ".error", v83);
      if (!v83)
        xpc_dictionary_set_uint64(a3[1], "entity", v82);
LABEL_136:
      xpc_release(object);
      return;
    case 0xD23F643:
      v84 = (MIDIServerXPC_Server *)swix::coder<unsigned int>::decode(a2[1], "device");
      v85 = swix::coder<unsigned int>::decode(a2[1], "entity");
      v86 = MIDIServerXPC_Server::deviceRemoveEntity(v84, v85);
      swix::encode_message::encode_message((swix::encode_message *)&v130, a2);
      swix::encode_message::operator=(a3, &v130);
      xpc_release(object);
      v15 = a3[1];
      if ((v86 & 0xFF00000000) != 0)
        v16 = 0;
      else
        v16 = (int)v86;
      goto LABEL_227;
    case 0xD23F644:
      v87 = (MIDIServerXPC_Server *)swix::coder<unsigned int>::decode(a2[1], "entity");
      v88 = xpc_dictionary_get_uint64(a2[1], "numSourceEndpoints");
      v89 = xpc_dictionary_get_uint64(a2[1], "numDestinationEndpoints");
      v90 = MIDIServerXPC_Server::entityAddOrRemoveEndpoints(v87, v88, v89);
      swix::encode_message::encode_message((swix::encode_message *)&v130, a2);
      swix::encode_message::operator=(a3, &v130);
      xpc_release(object);
      v15 = a3[1];
      if ((v90 & 0xFF00000000) != 0)
        v16 = 0;
      else
        v16 = (int)v90;
      goto LABEL_227;
    case 0xD23F645:
      v91 = (MIDIServerXPC_Server *)swix::coder<unsigned int>::decode(a2[1], "device");
      v92 = xpc_dictionary_get_BOOL(a2[1], "external");
      v93 = MIDIServerXPC_Server::setupAddDevice(v91, v92);
      swix::encode_message::encode_message((swix::encode_message *)&v130, a2);
      swix::encode_message::operator=(a3, &v130);
      xpc_release(object);
      v15 = a3[1];
      if ((v93 & 0xFF00000000) != 0)
        v16 = 0;
      else
        v16 = (int)v93;
      goto LABEL_227;
    case 0xD23F646:
      v94 = (MIDIServerXPC_Server *)swix::coder<unsigned int>::decode(a2[1], "device");
      v95 = xpc_dictionary_get_BOOL(a2[1], "external");
      v96 = MIDIServerXPC_Server::setupRemoveDevice(v94, v95);
      swix::encode_message::encode_message((swix::encode_message *)&v130, a2);
      swix::encode_message::operator=(a3, &v130);
      xpc_release(object);
      v15 = a3[1];
      if ((v96 & 0xFF00000000) != 0)
        v16 = 0;
      else
        v16 = (int)v96;
      goto LABEL_227;
    case 0xD23F647:
      v97 = MIDIServerXPC_Server::midiRestart(v6);
      swix::encode_message::encode_message((swix::encode_message *)&v130, a2);
      swix::encode_message::operator=(a3, &v130);
      xpc_release(object);
      v15 = a3[1];
      if ((v97 & 0xFF00000000) != 0)
        v16 = 0;
      else
        v16 = (int)v97;
      goto LABEL_227;
    case 0xD23F648:
      v98 = (MIDIServer *)swix::coder<unsigned int>::decode(a2[1], "object");
      v99 = xpc_dictionary_get_BOOL(a2[1], "deep");
      MIDIServerXPC_Server::objectGetProperties((MIDIServerXPC_Server *)&v137, v98, v99);
      swix::encode_message::encode_message((swix::encode_message *)&v130, a2);
      swix::encode_message::operator=(a3, &v130);
      xpc_release(object);
      if (LOBYTE(xstring[0]))
        v100 = 0;
      else
        v100 = (int)v137;
      xpc_dictionary_set_int64(a3[1], ".error", v100);
      if (!v100)
        xpc_dictionary_set_value(a3[1], "properties", v137);
      if (LOBYTE(xstring[0]))
        goto LABEL_223;
      return;
    case 0xD23F649:
      v101 = (MIDIServerXPC_Server *)swix::coder<unsigned int>::decode(a2[1], "destination");
      v102 = MIDIServerXPC_Server::flushOutput(v101);
      swix::encode_message::encode_message((swix::encode_message *)&v130, a2);
      swix::encode_message::operator=(a3, &v130);
      xpc_release(object);
      v15 = a3[1];
      if ((v102 & 0xFF00000000) != 0)
        v16 = 0;
      else
        v16 = (int)v102;
      goto LABEL_227;
    case 0xD23F64A:
      std::__tuple_impl<std::__tuple_indices<0ul,1ul>,swix::string,swix::data>::__tuple_impl[abi:ne180100](&v137);
      swix::xpcobj_coder<swix::string>::decode(&v130, a2[1], "persistentOwnerID");
      swix::string::operator=(&v137, &v130);
      xpc_release(v130);
      swix::xpcobj_coder<swix::data>::decode(&v130, a2[1], "connectionParams");
      swix::data::operator=(xstring, &v130);
      xpc_release(v130);
      v103 = MIDIServerXPC_Server::createThruConnection(this[1], &v137, xstring);
      swix::encode_message::encode_message((swix::encode_message *)&v130, a2);
      swix::encode_message::operator=(a3, &v130);
      xpc_release(object);
      if (v103 >= 0x100000000)
        v104 = 0;
      else
        v104 = v103;
      xpc_dictionary_set_int64(a3[1], ".error", v104);
      if (!v104)
        xpc_dictionary_set_uint64(a3[1], "conn", v103);
      std::tuple<swix::string,swix::data>::~tuple(&v137);
      return;
    case 0xD23F64B:
      v105 = (MIDIServerXPC_Server *)swix::coder<unsigned int>::decode(a2[1], "conn");
      v106 = MIDIServerXPC_Server::disposeThruConnection(v105);
      swix::encode_message::encode_message((swix::encode_message *)&v130, a2);
      swix::encode_message::operator=(a3, &v130);
      xpc_release(object);
      v15 = a3[1];
      if ((v106 & 0xFF00000000) != 0)
        v16 = 0;
      else
        v16 = (int)v106;
      goto LABEL_227;
    case 0xD23F64C:
      v107 = (MIDIServer *)swix::coder<unsigned int>::decode(a2[1], "conn");
      MIDIServerXPC_Server::thruConnectionGetParams((MIDIServerXPC_Server *)&v137, v107);
      swix::encode_message::encode_message((swix::encode_message *)&v130, a2);
      swix::encode_message::operator=(a3, &v130);
      xpc_release(object);
      if (LOBYTE(xstring[0]))
        v108 = 0;
      else
        v108 = (int)v137;
      xpc_dictionary_set_int64(a3[1], ".error", v108);
      if (!v108)
        xpc_dictionary_set_value(a3[1], "params", v137);
      if (LOBYTE(xstring[0]))
        goto LABEL_223;
      return;
    case 0xD23F64D:
      LODWORD(v137) = 0;
      xstring[0] = xpc_null_create();
      LODWORD(v137) = swix::coder<unsigned int>::decode(a2[1], "conn");
      swix::xpcobj_coder<swix::data>::decode(&v130, a2[1], "connectionParams");
      swix::data::operator=(xstring, &v130);
      xpc_release(v130);
      v110 = MIDIServerXPC_Server::thruConnectionSetParams((MIDIServerXPC_Server *)v137, xstring, v109);
      swix::encode_message::encode_message((swix::encode_message *)&v130, a2);
      swix::encode_message::operator=(a3, &v130);
      xpc_release(object);
      v66 = a3[1];
      if ((v110 & 0xFF00000000) != 0)
        v67 = 0;
      else
        v67 = (int)v110;
      goto LABEL_213;
    case 0xD23F64E:
      value = xpc_null_create();
      swix::xpcobj_coder<swix::string>::decode(&v130, a2[1], "persistentOwnerID");
      swix::string::operator=(&value, &v130);
      xpc_release(v130);
      MIDIServerXPC_Server::thruConnectionFind((MIDIServerXPC_Server *)&v137, value);
      swix::encode_message::encode_message((swix::encode_message *)&v130, a2);
      swix::encode_message::operator=(a3, &v130);
      xpc_release(object);
      if (LOBYTE(xstring[0]))
        v111 = 0;
      else
        v111 = (int)v137;
      xpc_dictionary_set_int64(a3[1], ".error", v111);
      if (!v111)
        xpc_dictionary_set_value(a3[1], "connectionList", v137);
      if (LOBYTE(xstring[0]))
        xpc_release(v137);
      xpc_release(value);
      return;
    case 0xD23F64F:
      v112 = (MIDIServerXPC_Server *)swix::coder<int>::decode(a2[1], "uniqueID");
      v113 = MIDIServerXPC_Server::objectFindByUniqueID(v112);
      v115 = v114;
      swix::encode_message::encode_message((swix::encode_message *)&v130, a2);
      swix::encode_message::operator=(a3, &v130);
      xpc_release(object);
      if (v115)
        v116 = 0;
      else
        v116 = v113;
      xpc_dictionary_set_int64(a3[1], ".error", v116);
      if (!v116)
      {
        xpc_dictionary_set_uint64(a3[1], "object", v113);
        xpc_dictionary_set_int64(a3[1], "objectType", v113 >> 32);
      }
      return;
    case 0xD23F650:
      v117 = xpc_dictionary_get_BOOL(a2[1], "isBigEndian");
      MIDIServerXPC_Server::getObjectTree((MIDIServerXPC_Server *)&v137, v117);
      swix::encode_message::encode_message((swix::encode_message *)&v130, a2);
      swix::encode_message::operator=(a3, &v130);
      xpc_release(object);
      if (LOBYTE(xstring[0]))
        v118 = 0;
      else
        v118 = (int)v137;
      xpc_dictionary_set_int64(a3[1], ".error", v118);
      if (!v118)
        xpc_dictionary_set_value(a3[1], "data", v137);
      if (LOBYTE(xstring[0]))
        goto LABEL_223;
      return;
    case 0xD23F651:
      LODWORD(v137) = 0;
      xstring[0] = xpc_null_create();
      LODWORD(v137) = swix::coder<int>::decode(a2[1], "objectType");
      swix::xpcobj_coder<swix::data>::decode(&v130, a2[1], "description");
      swix::data::operator=(xstring, &v130);
      xpc_release(v130);
      v119 = MIDIServerXPC_Server::umpciObjectCreate(this[1], (int)v137, xstring);
      swix::encode_message::encode_message((swix::encode_message *)&v130, a2);
      swix::encode_message::operator=(a3, &v130);
      xpc_release(object);
      if (v119 >= 0x100000000)
        v120 = 0;
      else
        v120 = v119;
      xpc_dictionary_set_int64(a3[1], ".error", v120);
      if (!v120)
        xpc_dictionary_set_uint64(a3[1], "umpcioo", v119);
LABEL_206:
      xpc_release(xstring[0]);
      return;
    case 0xD23F652:
      v121 = (MIDIServerXPC_Server *)swix::coder<unsigned int>::decode(a2[1], "umpcioo");
      v122 = MIDIServerXPC_Server::umpciObjectDispose(v121);
      swix::encode_message::encode_message((swix::encode_message *)&v130, a2);
      swix::encode_message::operator=(a3, &v130);
      xpc_release(object);
      v15 = a3[1];
      if ((v122 & 0xFF00000000) != 0)
        v16 = 0;
      else
        v16 = (int)v122;
      goto LABEL_227;
    case 0xD23F653:
      LODWORD(v137) = 0;
      xstring[0] = xpc_null_create();
      LODWORD(v137) = swix::coder<unsigned int>::decode(a2[1], "umpcioo");
      swix::xpcobj_coder<swix::data>::decode(&v130, a2[1], "description");
      swix::data::operator=(xstring, &v130);
      xpc_release(v130);
      v124 = MIDIServerXPC_Server::umpciObjectSetDescription((MIDIServerXPC_Server *)v137, xstring, v123);
      swix::encode_message::encode_message((swix::encode_message *)&v130, a2);
      swix::encode_message::operator=(a3, &v130);
      xpc_release(object);
      v66 = a3[1];
      if ((v124 & 0xFF00000000) != 0)
        v67 = 0;
      else
        v67 = (int)v124;
LABEL_213:
      xpc_dictionary_set_int64(v66, ".error", v67);
      xpc_release(xstring[0]);
      return;
    case 0xD23F654:
      v125 = (MIDIServerXPC_Server *)swix::coder<unsigned int>::decode(a2[1], "umpcioo");
      v126 = xpc_dictionary_get_BOOL(a2[1], "enableState");
      v127 = MIDIServerXPC_Server::umpciObjectSetEnableState(v125, v126);
      swix::encode_message::encode_message((swix::encode_message *)&v130, a2);
      swix::encode_message::operator=(a3, &v130);
      xpc_release(object);
      v15 = a3[1];
      if ((v127 & 0xFF00000000) != 0)
        v16 = 0;
      else
        v16 = (int)v127;
      goto LABEL_227;
    case 0xD23F655:
      MIDIServerXPC_Server::umpciGlobalState((MIDIServerXPC_Server *)&v137);
      swix::encode_message::encode_message((swix::encode_message *)&v130, a2);
      swix::encode_message::operator=(a3, &v130);
      xpc_release(object);
      if (LOBYTE(xstring[0]))
        v128 = 0;
      else
        v128 = (int)v137;
      xpc_dictionary_set_int64(a3[1], ".error", v128);
      if (!v128)
        xpc_dictionary_set_value(a3[1], "value", v137);
      if (LOBYTE(xstring[0]))
LABEL_223:
        xpc_release(v137);
      return;
    case 0xD23F656:
      v129 = MIDIServerXPC_Server::umpciDiscover(v6);
      swix::encode_message::encode_message((swix::encode_message *)&v130, a2);
      swix::encode_message::operator=(a3, &v130);
      xpc_release(object);
      v15 = a3[1];
      if ((v129 & 0xFF00000000) != 0)
        v16 = 0;
      else
        v16 = (int)v129;
LABEL_227:
      xpc_dictionary_set_int64(v15, ".error", v16);
      return;
    default:
      return;
  }
}

void sub_1D4F11B8C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, xpc_object_t a11, uint64_t a12, uint64_t a13, uint64_t a14, xpc_object_t a15, char a16, xpc_object_t object, xpc_object_t a18, uint64_t a19, char a20)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

_QWORD *swix::encode_message::operator=(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  void *v5;

  *a1 = *a2;
  v4 = a2[1];
  a2[1] = xpc_null_create();
  v5 = (void *)a1[1];
  a1[1] = v4;
  xpc_release(v5);
  a1[2] = a2[2];
  return a1;
}

xpc_object_t swix::xpcobj_coder<applesauce::xpc::object>::decode(_QWORD *a1, xpc_object_t xdict)
{
  xpc_object_t value;
  xpc_object_t result;

  value = xpc_dictionary_get_value(xdict, "ioPort");
  *a1 = value;
  if (value)
    return xpc_retain(value);
  result = xpc_null_create();
  *a1 = result;
  return result;
}

void swix::xpcobj_coder<swix::string>::decode(xpc_object_t *a1, xpc_object_t xdict, char *key)
{
  xpc_object_t value;
  xpc_object_t v5;

  value = xpc_dictionary_get_value(xdict, key);
  if (value)
  {
    v5 = value;
    xpc_retain(value);
    *a1 = v5;
  }
  else
  {
    v5 = xpc_null_create();
    *a1 = v5;
    if (!v5)
      goto LABEL_5;
  }
  if (MEMORY[0x1D826C5A8](v5) == MEMORY[0x1E0C81390])
  {
    xpc_retain(v5);
    goto LABEL_7;
  }
LABEL_5:
  *a1 = xpc_null_create();
LABEL_7:
  xpc_release(v5);
}

void **swix::string::operator=(void **a1, xpc_object_t *a2)
{
  xpc_object_t v3;
  void *v4;

  v3 = *a2;
  *a2 = xpc_null_create();
  v4 = *a1;
  *a1 = v3;
  xpc_release(v4);
  return a1;
}

uint64_t swix::coder<unsigned int>::decode(void *a1, const char *a2)
{
  uint64_t result;
  _QWORD *exception;

  result = xpc_dictionary_get_uint64(a1, a2);
  if (HIDWORD(result))
  {
    exception = __cxa_allocate_exception(8uLL);
    *exception = &off_1E98B9E40;
  }
  return result;
}

swix::decode_message *swix::decode_message::decode_message(swix::decode_message *this, const swix::decode_message *a2)
{
  void *v4;
  uint64_t v5;

  *(_QWORD *)this = *(_QWORD *)a2;
  v4 = (void *)*((_QWORD *)a2 + 1);
  *((_QWORD *)this + 1) = v4;
  if (v4)
    xpc_retain(v4);
  else
    *((_QWORD *)this + 1) = xpc_null_create();
  v5 = *((_QWORD *)a2 + 3);
  *((_QWORD *)this + 2) = *((_QWORD *)a2 + 2);
  *((_QWORD *)this + 3) = v5;
  return this;
}

uint64_t _ZNSt3__18functionIFvN4swix6resultIJEEEEEC1IZN20MIDIServerXPC_Server16dispatch_messageERKNS1_14decode_messageEE3__0vEET_(uint64_t a1, uint64_t *a2)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)(a1 + 24) = 0;
  v4 = operator new(0x40uLL);
  v5 = *a2;
  v6 = a2[1];
  *v4 = &off_1E98B8810;
  v4[1] = v5;
  v4[2] = v6;
  a2[1] = (uint64_t)xpc_null_create();
  v7 = a2[3];
  v4[3] = a2[2];
  v4[4] = v7;
  v4[5] = &off_1E98B8568;
  *((_OWORD *)v4 + 3) = *(_OWORD *)(a2 + 5);
  a2[5] = 0;
  a2[6] = 0;
  *(_QWORD *)(a1 + 24) = v4;
  return a1;
}

uint64_t MIDIServerXPC_Server::dispatch_message(swix::decode_message const&)::$_0::~$_0(uint64_t a1)
{
  *(_QWORD *)(a1 + 32) = &off_1E98B8568;
  std::shared_ptr<swix::connection::state>::~shared_ptr[abi:ne180100](a1 + 40);
  xpc_release(*(xpc_object_t *)(a1 + 8));
  *(_QWORD *)(a1 + 8) = 0;
  return a1;
}

uint64_t swix::coder<IPCPtr>::decode(void *a1)
{
  const void *data;
  uint64_t result;
  size_t length;

  length = 0;
  data = xpc_dictionary_get_data(a1, "connRefCon", &length);
  result = 0;
  if (length == 8 && data != 0)
    return *(_QWORD *)data;
  return result;
}

uint64_t std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul>,unsigned int,swix::string,swix::string>::__tuple_impl[abi:ne180100](uint64_t a1)
{
  *(_DWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 8) = xpc_null_create();
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 16) = xpc_null_create();
  return a1;
}

uint64_t std::tuple<unsigned int,swix::string,swix::string>::~tuple(uint64_t a1)
{
  xpc_release(*(xpc_object_t *)(a1 + 16));
  *(_QWORD *)(a1 + 16) = 0;
  xpc_release(*(xpc_object_t *)(a1 + 8));
  *(_QWORD *)(a1 + 8) = 0;
  return a1;
}

uint64_t std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul>,unsigned int,swix::string,swix::data>::__tuple_impl[abi:ne180100](uint64_t a1)
{
  *(_DWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 8) = xpc_null_create();
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 16) = xpc_null_create();
  return a1;
}

void **swix::data::operator=(void **a1, xpc_object_t *a2)
{
  xpc_object_t v3;
  void *v4;

  v3 = *a2;
  *a2 = xpc_null_create();
  v4 = *a1;
  *a1 = v3;
  xpc_release(v4);
  return a1;
}

uint64_t std::tuple<unsigned int,swix::string,swix::data>::~tuple(uint64_t a1)
{
  xpc_release(*(xpc_object_t *)(a1 + 16));
  *(_QWORD *)(a1 + 16) = 0;
  xpc_release(*(xpc_object_t *)(a1 + 8));
  *(_QWORD *)(a1 + 8) = 0;
  return a1;
}

xpc_object_t *std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul>,swix::string,swix::string,swix::string>::__tuple_impl[abi:ne180100](xpc_object_t *a1)
{
  *a1 = 0;
  *a1 = xpc_null_create();
  a1[1] = 0;
  a1[1] = xpc_null_create();
  a1[2] = 0;
  a1[2] = xpc_null_create();
  return a1;
}

xpc_object_t *std::tuple<swix::string,swix::string,swix::string>::~tuple(xpc_object_t *a1)
{
  xpc_release(a1[2]);
  a1[2] = 0;
  xpc_release(a1[1]);
  a1[1] = 0;
  xpc_release(*a1);
  *a1 = 0;
  return a1;
}

xpc_object_t *std::__tuple_impl<std::__tuple_indices<0ul,1ul>,swix::string,swix::data>::__tuple_impl[abi:ne180100](xpc_object_t *a1)
{
  *a1 = 0;
  *a1 = xpc_null_create();
  a1[1] = 0;
  a1[1] = xpc_null_create();
  return a1;
}

xpc_object_t *std::tuple<swix::string,swix::data>::~tuple(xpc_object_t *a1)
{
  xpc_release(a1[1]);
  a1[1] = 0;
  xpc_release(*a1);
  *a1 = 0;
  return a1;
}

uint64_t _ZNSt3__110__function6__funcIZN20MIDIServerXPC_Server16dispatch_messageERKN4swix14decode_messageEE3__0NS_9allocatorIS7_EEFvNS3_6resultIJEEEEED1Ev(uint64_t a1)
{
  *(_QWORD *)a1 = &off_1E98B8810;
  *(_QWORD *)(a1 + 40) = &off_1E98B8568;
  std::shared_ptr<swix::connection::state>::~shared_ptr[abi:ne180100](a1 + 48);
  xpc_release(*(xpc_object_t *)(a1 + 16));
  *(_QWORD *)(a1 + 16) = 0;
  return a1;
}

void _ZNSt3__110__function6__funcIZN20MIDIServerXPC_Server16dispatch_messageERKN4swix14decode_messageEE3__0NS_9allocatorIS7_EEFvNS3_6resultIJEEEEED0Ev(uint64_t a1)
{
  *(_QWORD *)a1 = &off_1E98B8810;
  *(_QWORD *)(a1 + 40) = &off_1E98B8568;
  std::shared_ptr<swix::connection::state>::~shared_ptr[abi:ne180100](a1 + 48);
  xpc_release(*(xpc_object_t *)(a1 + 16));
  *(_QWORD *)(a1 + 16) = 0;
  JUMPOUT(0x1D826BA98);
}

_QWORD *_ZNKSt3__110__function6__funcIZN20MIDIServerXPC_Server16dispatch_messageERKN4swix14decode_messageEE3__0NS_9allocatorIS7_EEFvNS3_6resultIJEEEEE7__cloneEv(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;

  v1 = (_QWORD *)(a1 + 8);
  v2 = operator new(0x40uLL);
  *v2 = &off_1E98B8810;
  std::__compressed_pair_elem<MIDIServerXPC_Server::dispatch_message(swix::decode_message const&)::$_0,0,false>::__compressed_pair_elem[abi:ne180100]<MIDIServerXPC_Server::dispatch_message(swix::decode_message const&)::$_0 const&,0ul>(v2 + 1, v1);
  return v2;
}

_QWORD *_ZNKSt3__110__function6__funcIZN20MIDIServerXPC_Server16dispatch_messageERKN4swix14decode_messageEE3__0NS_9allocatorIS7_EEFvNS3_6resultIJEEEEE7__cloneEPNS0_6__baseISC_EE(uint64_t a1, _QWORD *a2)
{
  *a2 = &off_1E98B8810;
  return std::__compressed_pair_elem<MIDIServerXPC_Server::dispatch_message(swix::decode_message const&)::$_0,0,false>::__compressed_pair_elem[abi:ne180100]<MIDIServerXPC_Server::dispatch_message(swix::decode_message const&)::$_0 const&,0ul>(a2 + 1, (_QWORD *)(a1 + 8));
}

void _ZNSt3__110__function6__funcIZN20MIDIServerXPC_Server16dispatch_messageERKN4swix14decode_messageEE3__0NS_9allocatorIS7_EEFvNS3_6resultIJEEEEE7destroyEv(uint64_t a1)
{
  _ZNSt3__110__function12__alloc_funcIZN20MIDIServerXPC_Server16dispatch_messageERKN4swix14decode_messageEE3__0NS_9allocatorIS7_EEFvNS3_6resultIJEEEEE7destroyB8ne180100Ev(a1 + 8);
}

void _ZNSt3__110__function6__funcIZN20MIDIServerXPC_Server16dispatch_messageERKN4swix14decode_messageEE3__0NS_9allocatorIS7_EEFvNS3_6resultIJEEEEE18destroy_deallocateEv(void *a1)
{
  _ZNSt3__110__function12__alloc_funcIZN20MIDIServerXPC_Server16dispatch_messageERKN4swix14decode_messageEE3__0NS_9allocatorIS7_EEFvNS3_6resultIJEEEEE7destroyB8ne180100Ev((uint64_t)a1 + 8);
  operator delete(a1);
}

void _ZNSt3__110__function6__funcIZN20MIDIServerXPC_Server16dispatch_messageERKN4swix14decode_messageEE3__0NS_9allocatorIS7_EEFvNS3_6resultIJEEEEEclEOSB_(uint64_t a1, int *a2)
{
  _DWORD *exception;
  int v5;
  _BYTE v6[8];
  xpc_object_t object;

  if (!*((_BYTE *)a2 + 4))
  {
    exception = __cxa_allocate_exception(0x10uLL);
    v5 = *a2;
    *(_QWORD *)exception = &off_1E98B8638;
    exception[2] = v5;
  }
  swix::encode_message::encode_message((swix::encode_message *)v6, (xpc_object_t *)(a1 + 8));
  swix::connection::send((swix::connection *)(a1 + 40), (const swix::encode_message *)v6);
  xpc_release(object);
}

void sub_1D4F12AEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, xpc_object_t object)
{
  xpc_release(object);
  _Unwind_Resume(a1);
}

void _ZNSt3__110__function12__alloc_funcIZN20MIDIServerXPC_Server16dispatch_messageERKN4swix14decode_messageEE3__0NS_9allocatorIS7_EEFvNS3_6resultIJEEEEE7destroyB8ne180100Ev(uint64_t a1)
{
  *(_QWORD *)(a1 + 32) = &off_1E98B8568;
  std::shared_ptr<swix::connection::state>::~shared_ptr[abi:ne180100](a1 + 40);
  xpc_release(*(xpc_object_t *)(a1 + 8));
  *(_QWORD *)(a1 + 8) = 0;
}

_QWORD *std::__compressed_pair_elem<MIDIServerXPC_Server::dispatch_message(swix::decode_message const&)::$_0,0,false>::__compressed_pair_elem[abi:ne180100]<MIDIServerXPC_Server::dispatch_message(swix::decode_message const&)::$_0 const&,0ul>(_QWORD *a1, _QWORD *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t *v8;
  unint64_t v9;

  *a1 = *a2;
  v4 = (void *)a2[1];
  a1[1] = v4;
  if (v4)
    xpc_retain(v4);
  else
    a1[1] = xpc_null_create();
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  v7 = a2[5];
  v6 = a2[6];
  a1[4] = &off_1E98B8568;
  a1[5] = v7;
  a1[6] = v6;
  if (v6)
  {
    v8 = (unint64_t *)(v6 + 8);
    do
      v9 = __ldxr(v8);
    while (__stxr(v9 + 1, v8));
  }
  return a1;
}

uint64_t std::construct_at[abi:ne180100]<swix::connection_config,swix::connection_config,swix::connection_config*>(uint64_t a1, __int128 *a2)
{
  __int128 v4;
  __int128 v5;
  xpc_object_t v6;
  uint64_t v7;

  v4 = *a2;
  *(_QWORD *)(a1 + 16) = *((_QWORD *)a2 + 2);
  *(_OWORD *)a1 = v4;
  *((_QWORD *)a2 + 1) = 0;
  *((_QWORD *)a2 + 2) = 0;
  *(_QWORD *)a2 = 0;
  v5 = *(__int128 *)((char *)a2 + 24);
  *(_QWORD *)(a1 + 40) = *((_QWORD *)a2 + 5);
  *(_OWORD *)(a1 + 24) = v5;
  *((_QWORD *)a2 + 4) = 0;
  *((_QWORD *)a2 + 5) = 0;
  *((_QWORD *)a2 + 3) = 0;
  *(_QWORD *)(a1 + 48) = *((_QWORD *)a2 + 6);
  v6 = xpc_null_create();
  *(_QWORD *)(a1 + 56) = *((_QWORD *)a2 + 7);
  *((_QWORD *)a2 + 6) = v6;
  *((_QWORD *)a2 + 7) = 0;
  v7 = *((_QWORD *)a2 + 8);
  *(_WORD *)(a1 + 72) = *((_WORD *)a2 + 36);
  *(_QWORD *)(a1 + 64) = v7;
  *(_BYTE *)(a1 + 80) = 0;
  *(_BYTE *)(a1 + 120) = 0;
  if (*((_BYTE *)a2 + 120))
  {
    *(_QWORD *)(a1 + 80) = *((_QWORD *)a2 + 10);
    std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100](a1 + 88, (uint64_t)a2 + 88);
    *(_BYTE *)(a1 + 120) = 1;
  }
  return a1;
}

uint64_t ___ZN20MIDIServerXPC_Client23acknowledgeNotificationENSt3__18functionIFvN4swix6resultIJEEEEEE_block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = 0x100000000;
  v1 = *(_QWORD *)(a1 + 56);
  if (!v1)
    std::__throw_bad_function_call[abi:ne180100]();
  return (*(uint64_t (**)(uint64_t, uint64_t *))(*(_QWORD *)v1 + 48))(v1, &v3);
}

void sub_1D4F12CB8()
{
  __break(1u);
}

void sub_1D4F12D28(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t __copy_helper_block_e8_32c44_ZTSNSt3__18functionIFvN4swix6resultIJEEEEEE(uint64_t a1, uint64_t a2)
{
  return std::__function::__value_func<void ()(applesauce::iokit::io_object_holder)>::__value_func[abi:ne180100](a1 + 32, a2 + 32);
}

_QWORD *__destroy_helper_block_e8_32c44_ZTSNSt3__18functionIFvN4swix6resultIJEEEEEE(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *result;
  uint64_t v3;

  v1 = (_QWORD *)(a1 + 32);
  result = *(_QWORD **)(a1 + 56);
  if (result == v1)
  {
    v3 = 4;
    result = v1;
  }
  else
  {
    if (!result)
      return result;
    v3 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v3))();
}

xpc_object_t *std::__tuple_leaf<0ul,swix::data,false>::__tuple_leaf[abi:ne180100](xpc_object_t *a1, xpc_object_t object)
{
  *a1 = object;
  if (object)
    xpc_retain(object);
  else
    *a1 = xpc_null_create();
  return a1;
}

unint64_t MIDIServerXPC_Client::setupAddDevice(MIDIServerXPC_Client *this, unsigned int a2, BOOL a3)
{
  const swix::encode_message *v6;
  unsigned int v7;
  _BYTE v9[8];
  xpc_object_t object;
  int v11;
  xpc_object_t xdict;

  swix::encode_message::encode_message((swix::encode_message *)&v11, 220460613);
  xpc_dictionary_set_uint64(xdict, "device", a2);
  xpc_dictionary_set_BOOL(xdict, "external", a3);
  v6 = (const swix::encode_message *)*((_QWORD *)this + 1);
  if (!v6)
    std::terminate();
  swix::connection::send_and_await_reply((swix::connection *)v9, v6, &v11);
  v7 = swix::coder<int>::decode(object, ".error");
  xpc_release(object);
  xpc_release(xdict);
  return ((unint64_t)(v7 == 0) << 32) | v7;
}

void sub_1D4F12E8C(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, xpc_object_t object)
{
  xpc_release(object);
  __cxa_begin_catch(a1);
  __cxa_end_catch();
  JUMPOUT(0x1D4F12E5CLL);
}

unint64_t MIDIServerXPC_Client::setupRemoveDevice(MIDIServerXPC_Client *this, unsigned int a2, BOOL a3)
{
  const swix::encode_message *v6;
  unsigned int v7;
  _BYTE v9[8];
  xpc_object_t object;
  int v11;
  xpc_object_t xdict;

  swix::encode_message::encode_message((swix::encode_message *)&v11, 220460614);
  xpc_dictionary_set_uint64(xdict, "device", a2);
  xpc_dictionary_set_BOOL(xdict, "external", a3);
  v6 = (const swix::encode_message *)*((_QWORD *)this + 1);
  if (!v6)
    std::terminate();
  swix::connection::send_and_await_reply((swix::connection *)v9, v6, &v11);
  v7 = swix::coder<int>::decode(object, ".error");
  xpc_release(object);
  xpc_release(xdict);
  return ((unint64_t)(v7 == 0) << 32) | v7;
}

void sub_1D4F12FA4(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, xpc_object_t object)
{
  xpc_release(object);
  __cxa_begin_catch(a1);
  __cxa_end_catch();
  JUMPOUT(0x1D4F12F74);
}

uint64_t (*MIDIClientCallbacks_server_routine(uint64_t a1))(uint64_t result, uint64_t a2)
{
  if (*(_DWORD *)(a1 + 20) == 8000)
    return _XNotify;
  else
    return 0;
}

uint64_t _XNotify(uint64_t result, uint64_t a2)
{
  size_t v3;
  const UniChar *v4;
  uint64_t *v5;
  char **v6;
  char **v7;
  int v8;
  mach_port_t v9;
  mach_msg_return_t v10;
  unsigned int *v11;
  int v12;
  mach_msg_header_t msg;

  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 56)
  {
    v12 = -304;
LABEL_17:
    *(_DWORD *)(a2 + 32) = v12;
    *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
    return result;
  }
  if (*(_BYTE *)(result + 39) != 1 || (v3 = *(unsigned int *)(result + 40), (_DWORD)v3 != *(_DWORD *)(result + 52)))
  {
    v12 = -300;
    goto LABEL_17;
  }
  v4 = *(const UniChar **)(result + 28);
  v5 = MIDIProcess::defaultInstance((MIDIProcess *)result);
  v6 = (char **)(*(uint64_t (**)(uint64_t *))*v5)(v5);
  if (!v6)
    std::terminate();
  v7 = v6;
  result = MIDIProcess::Notify(v6, v4, v3);
  v8 = result;
  if (!(_DWORD)result)
  {
    v9 = *((_DWORD *)v7 + 113);
    msg.msgh_size = 0;
    msg.msgh_bits = 19;
    msg.msgh_remote_port = v9;
    msg.msgh_local_port = 0;
    *(_QWORD *)&msg.msgh_voucher_port = 0x1F4100000000;
    if (MEMORY[0x1E0C85B60])
      voucher_mach_msg_set(&msg);
    v10 = mach_msg(&msg, 17, 0x18u, 0, 0, 0x493E0u, 0);
    v11 = (unsigned int *)MEMORY[0x1E0C83DA0];
    if (v10 == 268435460)
    {
      if ((msg.msgh_bits & 0x1F00) == 0x1100)
        mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg.msgh_local_port);
      mach_msg_destroy(&msg);
    }
    result = MEMORY[0x1D826C41C](*v11, v4, v3);
  }
  *(_DWORD *)(a2 + 32) = v8;
  return result;
}

uint64_t MIDIClient_SetupAddDevice(int a1, int a2, int a3)
{
  mach_port_name_t reply_port;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE msg[36];
  uint64_t v10;

  *(_OWORD *)&msg[20] = 0u;
  v10 = 0;
  *(_OWORD *)&msg[4] = 0u;
  *(_QWORD *)&msg[24] = *MEMORY[0x1E0C804E8];
  *(_DWORD *)&msg[32] = a2;
  LODWORD(v10) = a3;
  reply_port = mig_get_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x1F6200000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    reply_port = *(_DWORD *)&msg[12];
  }
  v5 = mach_msg((mach_msg_header_t *)msg, 275, 0x28u, 0x2Cu, reply_port, 0x493E0u, 0);
  v6 = v5;
  if ((v5 - 268435458) <= 0xE && ((1 << (v5 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&msg[12]);
  }
  else
  {
    if (!(_DWORD)v5)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        v7 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 8134)
      {
        v7 = 4294966996;
        if ((*(_DWORD *)msg & 0x80000000) == 0 && *(_DWORD *)&msg[4] == 36 && !*(_DWORD *)&msg[8])
        {
          v7 = *(unsigned int *)&msg[32];
          if (!*(_DWORD *)&msg[32])
            return 0;
        }
      }
      else
      {
        v7 = 4294966995;
      }
LABEL_20:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v7;
    }
    mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
  }
  v7 = 268435460;
  if ((_DWORD)v6 == 268435460)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&msg[12]);
    goto LABEL_20;
  }
  return v6;
}

uint64_t MIDIClient_SetupRemoveDevice(int a1, int a2, int a3)
{
  mach_port_name_t reply_port;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE msg[36];
  uint64_t v10;

  *(_OWORD *)&msg[20] = 0u;
  v10 = 0;
  *(_OWORD *)&msg[4] = 0u;
  *(_QWORD *)&msg[24] = *MEMORY[0x1E0C804E8];
  *(_DWORD *)&msg[32] = a2;
  LODWORD(v10) = a3;
  reply_port = mig_get_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x1F6300000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    reply_port = *(_DWORD *)&msg[12];
  }
  v5 = mach_msg((mach_msg_header_t *)msg, 275, 0x28u, 0x2Cu, reply_port, 0x493E0u, 0);
  v6 = v5;
  if ((v5 - 268435458) <= 0xE && ((1 << (v5 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&msg[12]);
  }
  else
  {
    if (!(_DWORD)v5)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        v7 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 8135)
      {
        v7 = 4294966996;
        if ((*(_DWORD *)msg & 0x80000000) == 0 && *(_DWORD *)&msg[4] == 36 && !*(_DWORD *)&msg[8])
        {
          v7 = *(unsigned int *)&msg[32];
          if (!*(_DWORD *)&msg[32])
            return 0;
        }
      }
      else
      {
        v7 = 4294966995;
      }
LABEL_20:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v7;
    }
    mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
  }
  v7 = 268435460;
  if ((_DWORD)v6 == 268435460)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&msg[12]);
    goto LABEL_20;
  }
  return v6;
}

uint64_t MIDIClient_ThruConnectionCreate(mach_port_t a1, uint64_t a2, unsigned int a3, uint64_t a4, unsigned int a5, int *a6)
{
  uint64_t v6;
  uint64_t v11;
  mach_msg_size_t v12;
  mach_port_t reply_port;
  uint64_t v14;
  BOOL v15;
  mach_msg_header_t rcv_name;
  int v18;
  uint64_t v19;
  int v20;
  _BYTE v21[24];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  *(_OWORD *)&v21[8] = 0u;
  memset(&rcv_name, 0, sizeof(rcv_name));
  v18 = 1;
  v19 = a4;
  v20 = 16777472;
  *(_QWORD *)v21 = a5;
  *(_QWORD *)&v21[4] = *MEMORY[0x1E0C804E8];
  if (a3 > 0x200)
    return 4294966989;
  __memcpy_chk();
  *(_DWORD *)&v21[12] = a3;
  v11 = (a3 + 3) & 0xFFFFFFFC;
  v12 = v11 + 60;
  *(_DWORD *)((char *)&rcv_name + v11 + 56) = a5;
  reply_port = mig_get_reply_port();
  rcv_name.msgh_remote_port = a1;
  rcv_name.msgh_local_port = reply_port;
  rcv_name.msgh_bits = -2147478253;
  *(_QWORD *)&rcv_name.msgh_voucher_port = 0x1F6400000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&rcv_name);
    reply_port = rcv_name.msgh_local_port;
  }
  v14 = mach_msg(&rcv_name, 275, v12, 0x30u, reply_port, 0x493E0u, 0);
  v6 = v14;
  if ((v14 - 268435458) <= 0xE && ((1 << (v14 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(rcv_name.msgh_local_port);
    goto LABEL_21;
  }
  if (!(_DWORD)v14)
  {
    if (rcv_name.msgh_id == 71)
    {
      v6 = 4294966988;
    }
    else if (rcv_name.msgh_id == 8136)
    {
      if ((rcv_name.msgh_bits & 0x80000000) == 0)
      {
        if (rcv_name.msgh_size == 40)
        {
          if (!rcv_name.msgh_remote_port)
          {
            v6 = HIDWORD(v19);
            if (!HIDWORD(v19))
            {
              *a6 = v20;
              return v6;
            }
            goto LABEL_29;
          }
        }
        else if (rcv_name.msgh_size == 36)
        {
          if (rcv_name.msgh_remote_port)
            v15 = 1;
          else
            v15 = HIDWORD(v19) == 0;
          if (v15)
            v6 = 4294966996;
          else
            v6 = HIDWORD(v19);
          goto LABEL_29;
        }
      }
      v6 = 4294966996;
    }
    else
    {
      v6 = 4294966995;
    }
LABEL_29:
    mach_msg_destroy(&rcv_name);
    return v6;
  }
  mig_dealloc_reply_port(rcv_name.msgh_local_port);
LABEL_21:
  if ((_DWORD)v6 == 268435460)
  {
    if ((rcv_name.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], rcv_name.msgh_local_port);
    mach_msg_destroy(&rcv_name);
    return 268435460;
  }
  return v6;
}

uint64_t (*MIDIIPC_server_routine(uint64_t a1))()
{
  int v1;

  v1 = *(_DWORD *)(a1 + 20);
  if ((v1 - 8049) >= 0xFFFFFFCF)
    return MIDIServer_MIDIIPC_subsystem[5 * (v1 - 8000) + 5];
  else
    return 0;
}

void _XRegisterProcess(uint64_t a1, uint64_t a2)
{
  int v3;
  int v4;
  mach_port_name_t v5;
  int v6;
  __int128 v7;
  _OWORD v8[2];

  if ((*(_DWORD *)a1 & 0x80000000) != 0 && *(_DWORD *)(a1 + 24) == 2 && *(_DWORD *)(a1 + 4) == 68)
  {
    if (*(unsigned __int16 *)(a1 + 38) << 16 == 1114112 && *(unsigned __int16 *)(a1 + 50) << 16 == 1114112)
    {
      if (*(_DWORD *)(a1 + 68) || *(_DWORD *)(a1 + 72) < 0x20u)
      {
        v3 = -309;
      }
      else
      {
        v4 = *(_DWORD *)(a1 + 28);
        v5 = *(_DWORD *)(a1 + 40);
        v6 = *(_DWORD *)(a1 + 60);
        v7 = *(_OWORD *)(a1 + 104);
        v8[0] = *(_OWORD *)(a1 + 88);
        v8[1] = v7;
        MIDIServer_RegisterProcess((MIDIServer *)v8, v4, v5, v6);
        v3 = 0;
      }
    }
    else
    {
      v3 = -300;
    }
  }
  else
  {
    v3 = -304;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
}

void _XAcknowledgeNotifications(_DWORD *a1, uint64_t a2)
{
  _DWORD *v3;
  int v4;
  int v5;
  __int128 v6;
  MIDIServer *MIDIServer;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  audit_token_t atoken;
  pid_t pidp[2];
  audit_token_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((*a1 & 0x80000000) != 0 || a1[1] != 24)
  {
    v5 = -304;
    goto LABEL_7;
  }
  v4 = a1[6];
  v3 = a1 + 6;
  if (v4 || v3[1] <= 0x1Fu)
  {
    v5 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v5;
    *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
    return;
  }
  v6 = *(_OWORD *)(v3 + 9);
  *(_OWORD *)v14.val = *(_OWORD *)(v3 + 5);
  *(_OWORD *)&v14.val[4] = v6;
  MIDIServer = (MIDIServer *)getMIDIServer((MIDIServer *)v3);
  v8 = MIDIServer::defaultInstance(MIDIServer);
  *(_QWORD *)pidp = 0;
  atoken = v14;
  audit_token_to_au32(&atoken, 0, (uid_t *)&pidp[1], 0, 0, 0, pidp, 0, 0);
  v9 = v8[29];
  v10 = v8[30];
  if (v9 != v10)
  {
    while (1)
    {
      v11 = *(_QWORD *)v9;
      if (*(_DWORD *)(*(_QWORD *)v9 + 8) == pidp[0])
        break;
      v9 += 8;
      if (v9 == v10)
        goto LABEL_14;
    }
    *(_BYTE *)(v11 + 320) = 0;
    if (*(_QWORD *)(v11 + 312))
      ClientProcess::DeliverNotifications((ClientProcess *)v11);
  }
LABEL_14:
  *(_DWORD *)(a2 + 32) = 0;
}

void _XClientCreate(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  CFIndex v4;
  BOOL v5;
  BOOL v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  int v11;
  uint64_t v12;
  int v13;
  int v14;
  const __CFString *v15;
  audit_token_t atoken;
  pid_t pidp;
  uid_t euidp;
  audit_token_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if ((*(_DWORD *)a1 & 0x80000000) != 0
    || (v3 = *(unsigned int *)(a1 + 4), v3 < 0x24)
    || v3 > 0x224
    || ((v4 = *(unsigned int *)(a1 + 32), v4 <= 0x200)
      ? (v5 = (int)v3 - 36 >= v4)
      : (v5 = 0),
        v5 ? (v6 = (_DWORD)v3 == (((_DWORD)v4 + 3) & 0xFFFFFFFC) + 36) : (v6 = 0),
        !v6))
  {
    v7 = -304;
LABEL_12:
    *(_DWORD *)(a2 + 32) = v7;
    v8 = *MEMORY[0x1E0C804E8];
    goto LABEL_13;
  }
  v9 = ((v3 + 3) & 0x1FFFFFFFCLL) + a1;
  if (*(_DWORD *)v9 || *(_DWORD *)(v9 + 4) <= 0x1Fu)
  {
    v7 = -309;
    goto LABEL_12;
  }
  v10 = *(_OWORD *)(v9 + 36);
  *(_OWORD *)v19.val = *(_OWORD *)(v9 + 20);
  *(_OWORD *)&v19.val[4] = v10;
  v12 = a1 + 36;
  v13 = v4;
  v14 = 0;
  v15 = CFStringCreateWithBytes(0, (const UInt8 *)(a1 + 36), v4, 0x100u, 1u);
  euidp = 0;
  pidp = 0;
  atoken = v19;
  audit_token_to_au32(&atoken, 0, &euidp, 0, 0, 0, &pidp, 0, 0);
  v11 = _MIDIClientCreate((MIDIServer *)pidp, v15, a2 + 36, 0);
  IPCBufferReader::~IPCBufferReader((IPCBufferReader *)&v12);
  *(_DWORD *)(a2 + 32) = v11;
  v8 = *MEMORY[0x1E0C804E8];
  if (!v11)
  {
    *(_QWORD *)(a2 + 24) = v8;
    *(_DWORD *)(a2 + 4) = 40;
    return;
  }
LABEL_13:
  *(_QWORD *)(a2 + 24) = v8;
}

void sub_1D4F13ACC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  IPCBufferReader::~IPCBufferReader((IPCBufferReader *)va);
  _Unwind_Resume(a1);
}

uint64_t _XClientDispose(_DWORD *a1, uint64_t a2)
{
  uint64_t result;

  if ((*a1 & 0x80000000) != 0 || a1[1] != 36)
    result = 4294966992;
  else
    result = _MIDIClientDispose((MIDIServer *)a1[8]);
  *(_DWORD *)(a2 + 32) = result;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

void _XInputPortCreate(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  CFIndex v5;
  unsigned int v6;
  BOOL v7;
  int v8;
  uint64_t v9;
  MIDIServer *v10;
  int v11;
  int v12;
  uint64_t v13;
  int v14;
  int v15;
  const __CFString *v16;

  if ((*(_DWORD *)a1 & 0x80000000) != 0
    || (v4 = *(_DWORD *)(a1 + 4), v4 < 0x2C)
    || v4 > 0x22C
    || (v5 = *(unsigned int *)(a1 + 36), v5 > 0x200)
    || ((v6 = (v5 + 3) & 0xFFFFFFFC, v4 - 44 >= v5) ? (v7 = v4 == v6 + 44) : (v7 = 0), !v7))
  {
    v8 = -304;
LABEL_10:
    *(_DWORD *)(a2 + 32) = v8;
    v9 = *MEMORY[0x1E0C804E8];
    goto LABEL_11;
  }
  v10 = (MIDIServer *)*(unsigned int *)(a1 + 32);
  v11 = *(_DWORD *)(a1 + v6 + 40);
  if (!BaseOpaqueObject::ResolveOpaqueRef((uint64_t)&TOpaqueRTTI<MIDIClient>::sRTTI, *(_DWORD *)(a1 + 32)))
  {
    v8 = -50;
    goto LABEL_10;
  }
  v13 = a1 + 40;
  v14 = v5;
  v15 = 0;
  v16 = CFStringCreateWithBytes(0, (const UInt8 *)(a1 + 40), v5, 0x100u, 1u);
  v12 = _MIDIInputPortCreate(v10, v16, v11, (_DWORD *)(a2 + 36), 0, 0);
  IPCBufferReader::~IPCBufferReader((IPCBufferReader *)&v13);
  *(_DWORD *)(a2 + 32) = v12;
  v9 = *MEMORY[0x1E0C804E8];
  if (!v12)
  {
    *(_QWORD *)(a2 + 24) = v9;
    *(_DWORD *)(a2 + 4) = 40;
    return;
  }
LABEL_11:
  *(_QWORD *)(a2 + 24) = v9;
}

void sub_1D4F13C60(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  IPCBufferReader::~IPCBufferReader((IPCBufferReader *)va);
  _Unwind_Resume(a1);
}

void _XOutputPortCreate(uint64_t a1, uint64_t a2)
{
  unsigned int v3;
  CFIndex v4;
  BOOL v5;
  BOOL v6;
  uint64_t v7;
  MIDIServer *v8;
  uint64_t v9;
  int v10;
  int v11;
  const __CFString *v12;

  if ((*(_DWORD *)a1 & 0x80000000) == 0
    && (v3 = *(_DWORD *)(a1 + 4), v3 >= 0x28)
    && v3 <= 0x228
    && ((v4 = *(unsigned int *)(a1 + 36), v4 <= 0x200) ? (v5 = v3 - 40 >= v4) : (v5 = 0),
        v5 ? (v6 = v3 == (((_DWORD)v4 + 3) & 0xFFFFFFFC) + 40) : (v6 = 0),
        v6))
  {
    v8 = (MIDIServer *)*(unsigned int *)(a1 + 32);
    v9 = a1 + 40;
    v10 = v4;
    v11 = 0;
    v12 = CFStringCreateWithBytes(0, (const UInt8 *)(a1 + 40), v4, 0x100u, 1u);
    LODWORD(v8) = _MIDIOutputPortCreate(v8, v12, (_DWORD *)(a2 + 36));
    IPCBufferReader::~IPCBufferReader((IPCBufferReader *)&v9);
    *(_DWORD *)(a2 + 32) = (_DWORD)v8;
    v7 = *MEMORY[0x1E0C804E8];
    if (!(_DWORD)v8)
    {
      *(_QWORD *)(a2 + 24) = v7;
      *(_DWORD *)(a2 + 4) = 40;
      return;
    }
  }
  else
  {
    *(_DWORD *)(a2 + 32) = -304;
    v7 = *MEMORY[0x1E0C804E8];
  }
  *(_QWORD *)(a2 + 24) = v7;
}

void sub_1D4F13D54(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  IPCBufferReader::~IPCBufferReader((IPCBufferReader *)va);
  _Unwind_Resume(a1);
}

uint64_t _XPortDispose(_DWORD *a1, uint64_t a2)
{
  uint64_t result;

  if ((*a1 & 0x80000000) != 0 || a1[1] != 36)
    result = 4294966992;
  else
    result = _MIDIPortDispose((MIDIServer *)a1[8]);
  *(_DWORD *)(a2 + 32) = result;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

void _XPortConnectSource(uint64_t a1, uint64_t a2)
{
  MIDIServer *v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  unsigned int v7;
  NSObject *v8;
  _QWORD *v9;
  _BYTE v10[32];
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  _BYTE v18[10];
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if ((*(_DWORD *)a1 & 0x80000000) != 0 || *(_DWORD *)(a1 + 4) != 48)
  {
    v7 = -304;
  }
  else
  {
    v3 = (MIDIServer *)*(unsigned int *)(a1 + 32);
    v4 = *(_DWORD *)(a1 + 36);
    v5 = *(_QWORD *)(a1 + 40);
    gMIDIServerLog();
    v6 = gMIDIServerLog(void)::mdsrvr;
    if (os_log_type_enabled((os_log_t)gMIDIServerLog(void)::mdsrvr, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136316418;
      v12 = "MIDIMachServer.cpp";
      v13 = 1024;
      v14 = 324;
      v15 = 2080;
      v16 = "MIDIServer_PortConnectSource";
      v17 = 1024;
      *(_DWORD *)v18 = (_DWORD)v3;
      *(_WORD *)&v18[4] = 1024;
      *(_DWORD *)&v18[6] = v4;
      v19 = 2048;
      v20 = v5;
      _os_log_impl(&dword_1D4E88000, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d ->%s port 0x%x src 0x%x, connRefCon 0x%qx", buf, 0x32u);
    }
    v7 = _MIDIPortConnectSource(v3, v4, v5);
    gMIDIServerLog();
    v8 = gMIDIServerLog(void)::mdsrvr;
    if (os_log_type_enabled((os_log_t)gMIDIServerLog(void)::mdsrvr, OS_LOG_TYPE_DEBUG))
    {
      ErrorFormatter::ErrorFormatter((ErrorFormatter *)v10, v7);
      *(_DWORD *)buf = 136315906;
      v12 = "MIDIMachServer.cpp";
      v13 = 1024;
      v14 = 326;
      v15 = 2080;
      v16 = "MIDIServer_PortConnectSource";
      v17 = 2080;
      *(_QWORD *)v18 = v10;
      _os_log_impl(&dword_1D4E88000, v8, OS_LOG_TYPE_DEBUG, "%25s:%-5d <-%s%s", buf, 0x26u);
    }
  }
  v9 = (_QWORD *)MEMORY[0x1E0C804E8];
  *(_DWORD *)(a2 + 32) = v7;
  *(_QWORD *)(a2 + 24) = *v9;
}

uint64_t _XPortDisconnectSource(_DWORD *a1, uint64_t a2)
{
  uint64_t result;

  if ((*a1 & 0x80000000) != 0 || a1[1] != 40)
    result = 4294966992;
  else
    result = _MIDIPortDisconnectSource((MIDIServer *)a1[8], a1[9]);
  *(_DWORD *)(a2 + 32) = result;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

void _XGetObjectTree(MIDIServer *a1, uint64_t a2)
{
  int v3;
  uint64_t *v4;
  int v5;
  UInt8 *v6;
  const __CFData *v7;
  int v8;
  int v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int *v12;
  unsigned int v13;
  void *v14[3];
  UInt8 *v15;
  uint64_t v16;
  uint64_t v17;

  if ((*(_DWORD *)a1 & 0x80000000) != 0 || *((_DWORD *)a1 + 1) != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
  }
  else
  {
    *(_DWORD *)(a2 + 36) = 16777473;
    v3 = *((_DWORD *)a1 + 8);
    v4 = MIDIServer::defaultInstance(a1) + 2;
    v5 = (*(uint64_t (**)(uint64_t *))(*v4 + 16))(v4);
    v15 = 0;
    v16 = 0;
    v17 = 0;
    ObjectTreeCache::GetObjectTree((MIDIServer *)&v15);
    v6 = v15;
    v7 = CFDataCreateWithBytesNoCopy(0, v15, v16 - (_QWORD)v15, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
    LODWORD(v14[0]) = 1;
    v14[1] = 0;
    v8 = IPCBufferWriter::write((IPCBufferWriter *)v14, v7, (void **)(a2 + 28), (unsigned int *)(a2 + 52));
    v9 = v8;
    if (v3)
    {
      if (!v8)
      {
        v10 = *(_DWORD *)(a2 + 52);
        if (v10 >= 4)
        {
          v11 = v10 >> 2;
          v12 = *(unsigned int **)(a2 + 28);
          v13 = v11 + 1;
          do
          {
            *v12 = bswap32(*v12);
            ++v12;
            --v13;
          }
          while (v13 > 1);
        }
      }
    }
    CFRelease(v7);
    IPCBufferWriter::~IPCBufferWriter(v14);
    if (v6)
      operator delete(v6);
    if (v5)
      (*(void (**)(uint64_t *))(*v4 + 24))(v4);
    if (!v9)
    {
      *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
      *(_QWORD *)(a2 + 44) = *MEMORY[0x1E0C804E8];
      *(_DWORD *)a2 |= 0x80000000;
      *(_DWORD *)(a2 + 4) = 56;
      *(_DWORD *)(a2 + 24) = 1;
      return;
    }
    *(_DWORD *)(a2 + 32) = v9;
  }
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
}

void sub_1D4F14188(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v12;
  int v13;
  void *v14;

  if (v14)
    operator delete(v14);
  if (v13)
    (*(void (**)(uint64_t))(*(_QWORD *)v12 + 24))(v12);
  _Unwind_Resume(exception_object);
}

void _XDestinationCreate(uint64_t a1, uint64_t a2)
{
  unsigned int v3;
  CFIndex v4;
  unsigned int v5;
  BOOL v6;
  uint64_t v7;
  MIDIServer *v8;
  MIDIProtocolID v9;
  uint64_t v10;
  int v11;
  int v12;
  const __CFString *v13;

  if ((*(_DWORD *)a1 & 0x80000000) == 0
    && (v3 = *(_DWORD *)(a1 + 4), v3 >= 0x2C)
    && v3 <= 0x22C
    && (v4 = *(unsigned int *)(a1 + 36), v4 <= 0x200)
    && ((v5 = (v4 + 3) & 0xFFFFFFFC, v3 - 44 >= v4) ? (v6 = v3 == v5 + 44) : (v6 = 0), v6))
  {
    v8 = (MIDIServer *)*(unsigned int *)(a1 + 32);
    v9 = *(_DWORD *)(a1 + v5 + 40);
    v10 = a1 + 40;
    v11 = v4;
    v12 = 0;
    v13 = CFStringCreateWithBytes(0, (const UInt8 *)(a1 + 40), v4, 0x100u, 1u);
    LODWORD(v8) = _MIDIDestinationCreate(v8, v13, v9, (_DWORD *)(a2 + 36), 0, 0);
    IPCBufferReader::~IPCBufferReader((IPCBufferReader *)&v10);
    *(_DWORD *)(a2 + 32) = (_DWORD)v8;
    v7 = *MEMORY[0x1E0C804E8];
    if (!(_DWORD)v8)
    {
      *(_QWORD *)(a2 + 24) = v7;
      *(_DWORD *)(a2 + 4) = 40;
      return;
    }
  }
  else
  {
    *(_DWORD *)(a2 + 32) = -304;
    v7 = *MEMORY[0x1E0C804E8];
  }
  *(_QWORD *)(a2 + 24) = v7;
}

void sub_1D4F142D4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  IPCBufferReader::~IPCBufferReader((IPCBufferReader *)va);
  _Unwind_Resume(a1);
}

void _XSourceCreate(uint64_t a1, uint64_t a2)
{
  unsigned int v3;
  CFIndex v4;
  unsigned int v5;
  BOOL v6;
  uint64_t v7;
  MIDIServer *v8;
  MIDIProtocolID v9;
  uint64_t v10;
  int v11;
  int v12;
  const __CFString *v13;

  if ((*(_DWORD *)a1 & 0x80000000) == 0
    && (v3 = *(_DWORD *)(a1 + 4), v3 >= 0x2C)
    && v3 <= 0x22C
    && (v4 = *(unsigned int *)(a1 + 36), v4 <= 0x200)
    && ((v5 = (v4 + 3) & 0xFFFFFFFC, v3 - 44 >= v4) ? (v6 = v3 == v5 + 44) : (v6 = 0), v6))
  {
    v8 = (MIDIServer *)*(unsigned int *)(a1 + 32);
    v9 = *(_DWORD *)(a1 + v5 + 40);
    v10 = a1 + 40;
    v11 = v4;
    v12 = 0;
    v13 = CFStringCreateWithBytes(0, (const UInt8 *)(a1 + 40), v4, 0x100u, 1u);
    LODWORD(v8) = _MIDISourceCreate(v8, v13, v9, (_DWORD *)(a2 + 36));
    IPCBufferReader::~IPCBufferReader((IPCBufferReader *)&v10);
    *(_DWORD *)(a2 + 32) = (_DWORD)v8;
    v7 = *MEMORY[0x1E0C804E8];
    if (!(_DWORD)v8)
    {
      *(_QWORD *)(a2 + 24) = v7;
      *(_DWORD *)(a2 + 4) = 40;
      return;
    }
  }
  else
  {
    *(_DWORD *)(a2 + 32) = -304;
    v7 = *MEMORY[0x1E0C804E8];
  }
  *(_QWORD *)(a2 + 24) = v7;
}

void sub_1D4F143E0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  IPCBufferReader::~IPCBufferReader((IPCBufferReader *)va);
  _Unwind_Resume(a1);
}

uint64_t _XEndpointDispose(_DWORD *a1, uint64_t a2)
{
  uint64_t result;

  if ((*a1 & 0x80000000) != 0 || a1[1] != 36)
    result = 4294966992;
  else
    result = _MIDIEndpointDispose((MIDIServer *)a1[8]);
  *(_DWORD *)(a2 + 32) = result;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

void _XObjectGetIntegerProperty(uint64_t a1, uint64_t a2)
{
  unsigned int v3;
  CFIndex v4;
  BOOL v5;
  BOOL v6;
  uint64_t v7;
  MIDIServer *v8;
  uint64_t v9;
  int v10;
  int v11;
  const __CFString *v12;

  if ((*(_DWORD *)a1 & 0x80000000) == 0
    && (v3 = *(_DWORD *)(a1 + 4), v3 >= 0x28)
    && v3 <= 0x228
    && ((v4 = *(unsigned int *)(a1 + 36), v4 <= 0x200) ? (v5 = v3 - 40 >= v4) : (v5 = 0),
        v5 ? (v6 = v3 == (((_DWORD)v4 + 3) & 0xFFFFFFFC) + 40) : (v6 = 0),
        v6))
  {
    v8 = (MIDIServer *)*(unsigned int *)(a1 + 32);
    v9 = a1 + 40;
    v10 = v4;
    v11 = 0;
    v12 = CFStringCreateWithBytes(0, (const UInt8 *)(a1 + 40), v4, 0x100u, 1u);
    LODWORD(v8) = _MIDIObjectGetIntegerProperty(v8, v12, (int *)(a2 + 36));
    IPCBufferReader::~IPCBufferReader((IPCBufferReader *)&v9);
    *(_DWORD *)(a2 + 32) = (_DWORD)v8;
    v7 = *MEMORY[0x1E0C804E8];
    if (!(_DWORD)v8)
    {
      *(_QWORD *)(a2 + 24) = v7;
      *(_DWORD *)(a2 + 4) = 40;
      return;
    }
  }
  else
  {
    *(_DWORD *)(a2 + 32) = -304;
    v7 = *MEMORY[0x1E0C804E8];
  }
  *(_QWORD *)(a2 + 24) = v7;
}

void sub_1D4F14528(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  IPCBufferReader::~IPCBufferReader((IPCBufferReader *)va);
  _Unwind_Resume(a1);
}

void _XObjectSetIntegerProperty(uint64_t a1, uint64_t a2)
{
  int v3;
  unsigned int v4;
  CFIndex v5;
  unsigned int v6;
  MIDIServer *v7;
  int v8;
  uint64_t v9;
  int v10;
  int v11;
  const __CFString *v12;

  v3 = -304;
  if ((*(_DWORD *)a1 & 0x80000000) == 0)
  {
    v4 = *(_DWORD *)(a1 + 4);
    if (v4 >= 0x2C && v4 <= 0x22C)
    {
      v5 = *(unsigned int *)(a1 + 36);
      if (v5 <= 0x200 && v4 - 44 >= v5)
      {
        v6 = (v5 + 3) & 0xFFFFFFFC;
        if (v4 == v6 + 44)
        {
          v7 = (MIDIServer *)*(unsigned int *)(a1 + 32);
          v8 = *(_DWORD *)(a1 + v6 + 40);
          v9 = a1 + 40;
          v10 = v5;
          v11 = 0;
          v12 = CFStringCreateWithBytes(0, (const UInt8 *)(a1 + 40), v5, 0x100u, 1u);
          v3 = _MIDIObjectSetIntegerProperty(v7, v12, v8);
          IPCBufferReader::~IPCBufferReader((IPCBufferReader *)&v9);
        }
      }
    }
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
}

void sub_1D4F14610(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  IPCBufferReader::~IPCBufferReader((IPCBufferReader *)va);
  _Unwind_Resume(a1);
}

void _XObjectGetStringProperty(uint64_t a1, uint64_t a2)
{
  unsigned int v3;
  unsigned int v4;
  BOOL v5;
  BOOL v6;
  CFIndex v7;
  MIDIServer *v8;
  int StringProperty;
  void *v10[3];
  CFTypeRef cf;
  uint64_t v12;
  int v13;
  int v14;
  const __CFString *v15;

  if ((*(_DWORD *)a1 & 0x80000000) == 0
    && (v3 = *(_DWORD *)(a1 + 4), v3 >= 0x28)
    && v3 <= 0x228
    && ((v4 = *(_DWORD *)(a1 + 36), v4 <= 0x200) ? (v5 = v3 - 40 >= v4) : (v5 = 0),
        v5 ? (v6 = v3 == ((v4 + 3) & 0xFFFFFFFC) + 40) : (v6 = 0),
        v6))
  {
    *(_DWORD *)(a2 + 36) = 16777473;
    v8 = (MIDIServer *)*(unsigned int *)(a1 + 32);
    v7 = *(unsigned int *)(a1 + 36);
    v12 = a1 + 40;
    v13 = v7;
    v14 = 0;
    v15 = CFStringCreateWithBytes(0, (const UInt8 *)(a1 + 40), v7, 0x100u, 1u);
    cf = 0;
    StringProperty = _MIDIObjectGetStringProperty(v8, v15, (const __CFString **)&cf);
    if (StringProperty)
    {
      IPCBufferReader::~IPCBufferReader((IPCBufferReader *)&v12);
    }
    else
    {
      LODWORD(v10[0]) = 1;
      v10[1] = 0;
      StringProperty = IPCBufferWriter::write((IPCBufferWriter *)v10, (CFStringRef)cf, (void **)(a2 + 28), (unsigned int *)(a2 + 52));
      CFRelease(cf);
      IPCBufferWriter::~IPCBufferWriter(v10);
      IPCBufferReader::~IPCBufferReader((IPCBufferReader *)&v12);
      if (!StringProperty)
      {
        *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
        *(_QWORD *)(a2 + 44) = *MEMORY[0x1E0C804E8];
        *(_DWORD *)a2 |= 0x80000000;
        *(_DWORD *)(a2 + 4) = 56;
        *(_DWORD *)(a2 + 24) = 1;
        return;
      }
    }
    *(_DWORD *)(a2 + 32) = StringProperty;
  }
  else
  {
    *(_DWORD *)(a2 + 32) = -304;
  }
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
}

void sub_1D4F14774(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v3;
  va_list va;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  va_list va1;

  va_start(va1, a2);
  va_start(va, a2);
  v3 = va_arg(va1, void *);
  v5 = va_arg(va1, _QWORD);
  v6 = va_arg(va1, _QWORD);
  v7 = va_arg(va1, _QWORD);
  IPCBufferWriter::~IPCBufferWriter((void **)va);
  IPCBufferReader::~IPCBufferReader((IPCBufferReader *)va1);
  _Unwind_Resume(a1);
}

uint64_t _XObjectSetStringProperty(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  int v5;
  unsigned int v6;
  CFIndex v7;
  unsigned int v8;
  unsigned int v9;

  if ((*(_DWORD *)a1 & 0x80000000) == 0)
  {
    result = 4294966992;
    goto LABEL_3;
  }
  v5 = *(_DWORD *)(a1 + 24);
  result = 4294966992;
  if (v5 == 1)
  {
    v6 = *(_DWORD *)(a1 + 4);
    if (v6 >= 0x40 && v6 <= 0x240)
    {
      if (*(_BYTE *)(a1 + 39) != 1)
        goto LABEL_13;
      v7 = *(unsigned int *)(a1 + 56);
      if (v7 <= 0x200 && v6 - 64 >= v7)
      {
        v8 = (v7 + 3) & 0xFFFFFFFC;
        if (v6 == v8 + 64)
        {
          v9 = *(_DWORD *)(a1 + 40);
          if (v9 == *(_DWORD *)(a1 + v8 + 60))
          {
            result = MIDIServer_ObjectSetStringProperty((MIDIServer *)*(unsigned int *)(a1 + 52), (const UInt8 *)(a1 + 60), v7, *(UInt8 **)(a1 + 28), v9);
            goto LABEL_3;
          }
LABEL_13:
          result = 4294966996;
        }
      }
    }
  }
LABEL_3:
  *(_DWORD *)(a2 + 32) = result;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

void _XObjectGetDataProperty(uint64_t a1, uint64_t a2)
{
  unsigned int v3;
  unsigned int v4;
  BOOL v5;
  BOOL v6;
  CFIndex v7;
  MIDIServer *v8;
  int DataProperty;
  void *v10[3];
  CFTypeRef cf;
  uint64_t v12;
  int v13;
  int v14;
  const __CFString *v15;

  if ((*(_DWORD *)a1 & 0x80000000) == 0
    && (v3 = *(_DWORD *)(a1 + 4), v3 >= 0x28)
    && v3 <= 0x228
    && ((v4 = *(_DWORD *)(a1 + 36), v4 <= 0x200) ? (v5 = v3 - 40 >= v4) : (v5 = 0),
        v5 ? (v6 = v3 == ((v4 + 3) & 0xFFFFFFFC) + 40) : (v6 = 0),
        v6))
  {
    *(_DWORD *)(a2 + 36) = 16777473;
    v8 = (MIDIServer *)*(unsigned int *)(a1 + 32);
    v7 = *(unsigned int *)(a1 + 36);
    v12 = a1 + 40;
    v13 = v7;
    v14 = 0;
    v15 = CFStringCreateWithBytes(0, (const UInt8 *)(a1 + 40), v7, 0x100u, 1u);
    cf = 0;
    DataProperty = _MIDIObjectGetDataProperty(v8, v15, (const __CFData **)&cf);
    if (DataProperty)
    {
      IPCBufferReader::~IPCBufferReader((IPCBufferReader *)&v12);
    }
    else
    {
      LODWORD(v10[0]) = 1;
      v10[1] = 0;
      DataProperty = IPCBufferWriter::write((IPCBufferWriter *)v10, (CFDataRef)cf, (void **)(a2 + 28), (unsigned int *)(a2 + 52));
      CFRelease(cf);
      IPCBufferWriter::~IPCBufferWriter(v10);
      IPCBufferReader::~IPCBufferReader((IPCBufferReader *)&v12);
      if (!DataProperty)
      {
        *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
        *(_QWORD *)(a2 + 44) = *MEMORY[0x1E0C804E8];
        *(_DWORD *)a2 |= 0x80000000;
        *(_DWORD *)(a2 + 4) = 56;
        *(_DWORD *)(a2 + 24) = 1;
        return;
      }
    }
    *(_DWORD *)(a2 + 32) = DataProperty;
  }
  else
  {
    *(_DWORD *)(a2 + 32) = -304;
  }
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
}

void sub_1D4F149B4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v3;
  va_list va;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  va_list va1;

  va_start(va1, a2);
  va_start(va, a2);
  v3 = va_arg(va1, void *);
  v5 = va_arg(va1, _QWORD);
  v6 = va_arg(va1, _QWORD);
  v7 = va_arg(va1, _QWORD);
  IPCBufferWriter::~IPCBufferWriter((void **)va);
  IPCBufferReader::~IPCBufferReader((IPCBufferReader *)va1);
  _Unwind_Resume(a1);
}

uint64_t _XObjectSetDataProperty(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  int v5;
  unsigned int v6;
  CFIndex v7;
  unsigned int v8;
  unsigned int v9;

  if ((*(_DWORD *)a1 & 0x80000000) == 0)
  {
    result = 4294966992;
    goto LABEL_3;
  }
  v5 = *(_DWORD *)(a1 + 24);
  result = 4294966992;
  if (v5 == 1)
  {
    v6 = *(_DWORD *)(a1 + 4);
    if (v6 >= 0x40 && v6 <= 0x240)
    {
      if (*(_BYTE *)(a1 + 39) != 1)
        goto LABEL_13;
      v7 = *(unsigned int *)(a1 + 56);
      if (v7 <= 0x200 && v6 - 64 >= v7)
      {
        v8 = (v7 + 3) & 0xFFFFFFFC;
        if (v6 == v8 + 64)
        {
          v9 = *(_DWORD *)(a1 + 40);
          if (v9 == *(_DWORD *)(a1 + v8 + 60))
          {
            result = MIDIServer_ObjectSetDataProperty((MIDIServer *)*(unsigned int *)(a1 + 52), (const UInt8 *)(a1 + 60), v7, *(const UInt8 **)(a1 + 28), v9);
            goto LABEL_3;
          }
LABEL_13:
          result = 4294966996;
        }
      }
    }
  }
LABEL_3:
  *(_DWORD *)(a2 + 32) = result;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

void _XObjectGetDictionaryProperty(uint64_t a1, uint64_t a2)
{
  unsigned int v3;
  unsigned int v4;
  BOOL v5;
  BOOL v6;
  CFIndex v7;
  MIDIServer *v8;
  int DictionaryProperty;
  void *v10[3];
  CFTypeRef cf;
  uint64_t v12;
  int v13;
  int v14;
  const __CFString *v15;

  if ((*(_DWORD *)a1 & 0x80000000) == 0
    && (v3 = *(_DWORD *)(a1 + 4), v3 >= 0x28)
    && v3 <= 0x228
    && ((v4 = *(_DWORD *)(a1 + 36), v4 <= 0x200) ? (v5 = v3 - 40 >= v4) : (v5 = 0),
        v5 ? (v6 = v3 == ((v4 + 3) & 0xFFFFFFFC) + 40) : (v6 = 0),
        v6))
  {
    *(_DWORD *)(a2 + 36) = 16777473;
    v8 = (MIDIServer *)*(unsigned int *)(a1 + 32);
    v7 = *(unsigned int *)(a1 + 36);
    v12 = a1 + 40;
    v13 = v7;
    v14 = 0;
    v15 = CFStringCreateWithBytes(0, (const UInt8 *)(a1 + 40), v7, 0x100u, 1u);
    cf = 0;
    DictionaryProperty = _MIDIObjectGetDictionaryProperty(v8, v15, &cf);
    if (DictionaryProperty)
    {
      IPCBufferReader::~IPCBufferReader((IPCBufferReader *)&v12);
    }
    else
    {
      LODWORD(v10[0]) = 1;
      v10[1] = 0;
      DictionaryProperty = IPCBufferWriter::write((IPCBufferWriter *)v10, cf, (void **)(a2 + 28), (unsigned int *)(a2 + 52));
      CFRelease(cf);
      IPCBufferWriter::~IPCBufferWriter(v10);
      IPCBufferReader::~IPCBufferReader((IPCBufferReader *)&v12);
      if (!DictionaryProperty)
      {
        *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
        *(_QWORD *)(a2 + 44) = *MEMORY[0x1E0C804E8];
        *(_DWORD *)a2 |= 0x80000000;
        *(_DWORD *)(a2 + 4) = 56;
        *(_DWORD *)(a2 + 24) = 1;
        return;
      }
    }
    *(_DWORD *)(a2 + 32) = DictionaryProperty;
  }
  else
  {
    *(_DWORD *)(a2 + 32) = -304;
  }
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
}

void sub_1D4F14BF4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v3;
  va_list va;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  va_list va1;

  va_start(va1, a2);
  va_start(va, a2);
  v3 = va_arg(va1, void *);
  v5 = va_arg(va1, _QWORD);
  v6 = va_arg(va1, _QWORD);
  v7 = va_arg(va1, _QWORD);
  IPCBufferWriter::~IPCBufferWriter((void **)va);
  IPCBufferReader::~IPCBufferReader((IPCBufferReader *)va1);
  _Unwind_Resume(a1);
}

uint64_t _XObjectSetDictionaryProperty(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  int v5;
  unsigned int v6;
  CFIndex v7;
  unsigned int v8;
  unsigned int v9;

  if ((*(_DWORD *)a1 & 0x80000000) == 0)
  {
    result = 4294966992;
    goto LABEL_3;
  }
  v5 = *(_DWORD *)(a1 + 24);
  result = 4294966992;
  if (v5 == 1)
  {
    v6 = *(_DWORD *)(a1 + 4);
    if (v6 >= 0x40 && v6 <= 0x240)
    {
      if (*(_BYTE *)(a1 + 39) != 1)
        goto LABEL_13;
      v7 = *(unsigned int *)(a1 + 56);
      if (v7 <= 0x200 && v6 - 64 >= v7)
      {
        v8 = (v7 + 3) & 0xFFFFFFFC;
        if (v6 == v8 + 64)
        {
          v9 = *(_DWORD *)(a1 + 40);
          if (v9 == *(_DWORD *)(a1 + v8 + 60))
          {
            result = MIDIServer_ObjectSetDictionaryProperty((MIDIServer *)*(unsigned int *)(a1 + 52), (const UInt8 *)(a1 + 60), v7, *(const UInt8 **)(a1 + 28), v9);
            goto LABEL_3;
          }
LABEL_13:
          result = 4294966996;
        }
      }
    }
  }
LABEL_3:
  *(_DWORD *)(a2 + 32) = result;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

void _XObjectGetProperties(uint64_t a1, uint64_t a2)
{
  MIDIServer *v3;
  int v4;
  int Properties;
  int v6;
  void *v7[3];
  CFTypeRef cf;

  if ((*(_DWORD *)a1 & 0x80000000) != 0 || *(_DWORD *)(a1 + 4) != 40)
  {
    *(_DWORD *)(a2 + 32) = -304;
  }
  else
  {
    *(_DWORD *)(a2 + 36) = 16777473;
    v3 = (MIDIServer *)*(unsigned int *)(a1 + 32);
    v4 = *(unsigned __int8 *)(a1 + 36);
    cf = 0;
    Properties = _MIDIObjectGetProperties(v3, (CFMutableDictionaryRef *)&cf, v4);
    if (Properties)
    {
      v6 = Properties;
    }
    else
    {
      LODWORD(v7[0]) = 1;
      v7[1] = 0;
      v6 = IPCBufferWriter::write((IPCBufferWriter *)v7, cf, (void **)(a2 + 28), (unsigned int *)(a2 + 52));
      CFRelease(cf);
      IPCBufferWriter::~IPCBufferWriter(v7);
      if (!v6)
      {
        *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
        *(_QWORD *)(a2 + 44) = *MEMORY[0x1E0C804E8];
        *(_DWORD *)a2 |= 0x80000000;
        *(_DWORD *)(a2 + 4) = 56;
        *(_DWORD *)(a2 + 24) = 1;
        return;
      }
    }
    *(_DWORD *)(a2 + 32) = v6;
  }
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
}

void sub_1D4F14DD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  IPCBufferWriter::~IPCBufferWriter(&a9);
  _Unwind_Resume(a1);
}

void _XObjectRemoveProperty(uint64_t a1, uint64_t a2)
{
  int v3;
  unsigned int v4;
  CFIndex v5;
  BOOL v6;
  MIDIServer *v7;
  uint64_t v8;
  int v9;
  int v10;
  const __CFString *v11;

  v3 = -304;
  if ((*(_DWORD *)a1 & 0x80000000) == 0)
  {
    v4 = *(_DWORD *)(a1 + 4);
    if (v4 >= 0x28 && v4 <= 0x228)
    {
      v5 = *(unsigned int *)(a1 + 36);
      v6 = v5 <= 0x200 && v4 - 40 >= v5;
      if (v6 && v4 == (((_DWORD)v5 + 3) & 0xFFFFFFFC) + 40)
      {
        v7 = (MIDIServer *)*(unsigned int *)(a1 + 32);
        v8 = a1 + 40;
        v9 = v5;
        v10 = 0;
        v11 = CFStringCreateWithBytes(0, (const UInt8 *)(a1 + 40), v5, 0x100u, 1u);
        v3 = _MIDIObjectRemoveProperty(v7, v11);
        IPCBufferReader::~IPCBufferReader((IPCBufferReader *)&v8);
      }
    }
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
}

void sub_1D4F14EA8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  IPCBufferReader::~IPCBufferReader((IPCBufferReader *)va);
  _Unwind_Resume(a1);
}

_DWORD *_XObjectFindByUniqueID(_DWORD *result, uint64_t a2)
{
  uint64_t v3;

  if ((*result & 0x80000000) != 0 || result[1] != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
    v3 = *MEMORY[0x1E0C804E8];
  }
  else
  {
    result = (_DWORD *)_MIDIObjectFindByUniqueID((MIDIServer *)result[8], (_DWORD *)(a2 + 36), (_DWORD *)(a2 + 40));
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
    v3 = *MEMORY[0x1E0C804E8];
    if (!(_DWORD)result)
    {
      *(_QWORD *)(a2 + 24) = v3;
      *(_DWORD *)(a2 + 4) = 44;
      return result;
    }
  }
  *(_QWORD *)(a2 + 24) = v3;
  return result;
}

uint64_t _XFlushOutput(_DWORD *a1, uint64_t a2)
{
  uint64_t result;

  if ((*a1 & 0x80000000) != 0 || a1[1] != 36)
    result = 4294966992;
  else
    result = _MIDIFlushOutput(a1[8]);
  *(_DWORD *)(a2 + 32) = result;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

uint64_t _XRestart(MIDIServer *a1, uint64_t a2)
{
  uint64_t result;

  if ((*(_DWORD *)a1 & 0x80000000) != 0 || *((_DWORD *)a1 + 1) != 36)
    result = 4294966992;
  else
    result = _MIDIRestart(a1);
  *(_DWORD *)(a2 + 32) = result;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

_DWORD *_XSetupCreate(_DWORD *result, uint64_t a2)
{
  uint64_t v3;

  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    v3 = *MEMORY[0x1E0C804E8];
  }
  else
  {
    result = (_DWORD *)_MIDISetupCreate((MIDIServer *)(a2 + 36));
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
    v3 = *MEMORY[0x1E0C804E8];
    if (!(_DWORD)result)
    {
      *(_QWORD *)(a2 + 24) = v3;
      *(_DWORD *)(a2 + 4) = 40;
      return result;
    }
  }
  *(_QWORD *)(a2 + 24) = v3;
  return result;
}

void _XSetupFromData(uint64_t a1, uint64_t a2)
{
  CFIndex v3;
  const UInt8 *v4;
  int v5;
  int v6;
  const UInt8 *v7;
  int v8;
  int v9;
  MIDIServer *v10;

  if ((*(_DWORD *)a1 & 0x80000000) == 0 || *(_DWORD *)(a1 + 24) != 1 || *(_DWORD *)(a1 + 4) != 56)
  {
    v6 = -304;
LABEL_9:
    *(_DWORD *)(a2 + 32) = v6;
    goto LABEL_10;
  }
  if (*(_BYTE *)(a1 + 39) != 1 || (v3 = *(unsigned int *)(a1 + 40), (_DWORD)v3 != *(_DWORD *)(a1 + 52)))
  {
    v6 = -300;
    goto LABEL_9;
  }
  v4 = *(const UInt8 **)(a1 + 28);
  v7 = v4;
  v8 = v3;
  v9 = 0;
  v10 = CFDataCreate(0, v4, v3);
  v5 = _MIDISetupFromData(v10, (_DWORD *)(a2 + 36));
  if (!v5)
  {
    MEMORY[0x1D826C41C](*MEMORY[0x1E0C83DA0], v4, v3);
    IPCBufferReader::~IPCBufferReader((IPCBufferReader *)&v7);
    *(_DWORD *)(a2 + 32) = 0;
    *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
    *(_DWORD *)(a2 + 4) = 40;
    return;
  }
  IPCBufferReader::~IPCBufferReader((IPCBufferReader *)&v7);
  *(_DWORD *)(a2 + 32) = v5;
LABEL_10:
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
}

void sub_1D4F1515C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  IPCBufferReader::~IPCBufferReader((IPCBufferReader *)va);
  _Unwind_Resume(a1);
}

uint64_t _XSetupInstall(_DWORD *a1, uint64_t a2)
{
  uint64_t result;

  if ((*a1 & 0x80000000) != 0 || a1[1] != 36)
    result = 4294966992;
  else
    result = _MIDISetupInstall((MIDIServer *)a1[8]);
  *(_DWORD *)(a2 + 32) = result;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

_DWORD *_XSetupGetCurrent(_DWORD *result, uint64_t a2)
{
  uint64_t v3;

  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    v3 = *MEMORY[0x1E0C804E8];
  }
  else
  {
    result = (_DWORD *)_MIDISetupGetCurrent((MIDIServer *)(a2 + 36));
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
    v3 = *MEMORY[0x1E0C804E8];
    if (!(_DWORD)result)
    {
      *(_QWORD *)(a2 + 24) = v3;
      *(_DWORD *)(a2 + 4) = 40;
      return result;
    }
  }
  *(_QWORD *)(a2 + 24) = v3;
  return result;
}

uint64_t _XExternalDeviceCreate(uint64_t result, uint64_t a2)
{
  unsigned int v3;
  CFIndex v4;
  unsigned int v5;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  BOOL v11;
  uint64_t v12;
  unsigned int v13;
  uint64_t v14;
  unsigned int v15;
  BOOL v16;
  BOOL v17;
  uint64_t v18;

  if ((*(_DWORD *)result & 0x80000000) != 0)
    goto LABEL_23;
  v3 = *(_DWORD *)(result + 4);
  if (v3 < 0x2C)
    goto LABEL_23;
  if (v3 > 0x62C)
    goto LABEL_23;
  v4 = *(unsigned int *)(result + 32);
  if (v4 > 0x200)
    goto LABEL_23;
  v5 = (v4 + 3) & 0xFFFFFFFC;
  if (v3 - 44 < v4 || v3 < v5 + 44)
    goto LABEL_23;
  v7 = result + v5;
  v8 = *(_DWORD *)(v7 + 36);
  if (v8 > 0x200)
    goto LABEL_23;
  v9 = v3 - v5;
  v10 = (v8 + 3) & 0xFFFFFFFC;
  v11 = v9 - 44 >= v8 && v9 >= v10 + 44;
  if (!v11
    || ((v12 = v7 - 512, v13 = v9 - v10, v14 = v7 - 512 + v10, v15 = *(_DWORD *)(v14 + 552), v15 <= 0x200)
      ? (v16 = v13 - 44 >= v15)
      : (v16 = 0),
        v16 ? (v17 = v13 == ((v15 + 3) & 0xFFFFFFFC) + 44) : (v17 = 0),
        !v17))
  {
LABEL_23:
    *(_DWORD *)(a2 + 32) = -304;
    v18 = *MEMORY[0x1E0C804E8];
LABEL_24:
    *(_QWORD *)(a2 + 24) = v18;
    return result;
  }
  result = MIDIServer_ExternalDeviceCreate((UInt8 *)(result + 36), v4, (UInt8 *)(v12 + 552), v8, (UInt8 *)(v14 + 556), v15, (MIDIDeviceRef *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  v18 = *MEMORY[0x1E0C804E8];
  if ((_DWORD)result)
    goto LABEL_24;
  *(_QWORD *)(a2 + 24) = v18;
  *(_DWORD *)(a2 + 4) = 40;
  return result;
}

void _XDeviceAddEntity(uint64_t a1, uint64_t a2)
{
  unsigned int v3;
  CFIndex v4;
  unsigned int v5;
  BOOL v6;
  uint64_t v7;
  MIDIServer *v8;
  _DWORD *v9;
  MIDIProtocolID v10;
  int v11;
  int v12;
  int v13;
  uint64_t v14;
  int v15;
  int v16;
  const __CFString *v17;

  if ((*(_DWORD *)a1 & 0x80000000) == 0
    && (v3 = *(_DWORD *)(a1 + 4), v3 >= 0x38)
    && v3 <= 0x238
    && (v4 = *(unsigned int *)(a1 + 36), v4 <= 0x200)
    && ((v5 = (v4 + 3) & 0xFFFFFFFC, v3 - 56 >= v4) ? (v6 = v3 == v5 + 56) : (v6 = 0), v6))
  {
    v8 = (MIDIServer *)*(unsigned int *)(a1 + 32);
    v9 = (_DWORD *)(a1 + v5);
    v10 = v9[10];
    v11 = v9[11];
    v12 = v9[12];
    v13 = v9[13];
    v14 = a1 + 40;
    v15 = v4;
    v16 = 0;
    v17 = CFStringCreateWithBytes(0, (const UInt8 *)(a1 + 40), v4, 0x100u, 1u);
    LODWORD(v8) = _MIDIDeviceAddEntity(v8, v17, v10, v11, v12, v13, (_DWORD *)(a2 + 36));
    IPCBufferReader::~IPCBufferReader((IPCBufferReader *)&v14);
    *(_DWORD *)(a2 + 32) = (_DWORD)v8;
    v7 = *MEMORY[0x1E0C804E8];
    if (!(_DWORD)v8)
    {
      *(_QWORD *)(a2 + 24) = v7;
      *(_DWORD *)(a2 + 4) = 40;
      return;
    }
  }
  else
  {
    *(_DWORD *)(a2 + 32) = -304;
    v7 = *MEMORY[0x1E0C804E8];
  }
  *(_QWORD *)(a2 + 24) = v7;
}

void sub_1D4F1545C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  IPCBufferReader::~IPCBufferReader((IPCBufferReader *)va);
  _Unwind_Resume(a1);
}

uint64_t _XDeviceRemoveEntity(_DWORD *a1, uint64_t a2)
{
  uint64_t result;

  if ((*a1 & 0x80000000) != 0 || a1[1] != 40)
    result = 4294966992;
  else
    result = _MIDIDeviceRemoveEntity((MIDIServer *)a1[8], a1[9]);
  *(_DWORD *)(a2 + 32) = result;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

uint64_t _XEntityAddOrRemoveEndpoints(_DWORD *a1, uint64_t a2)
{
  uint64_t result;

  if ((*a1 & 0x80000000) != 0 || a1[1] != 44)
    result = 4294966992;
  else
    result = _MIDIEntityAddOrRemoveEndpoints((MIDIServer *)a1[8], a1[9], a1[10]);
  *(_DWORD *)(a2 + 32) = result;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

uint64_t _XSetupAddDevice(_DWORD *a1, uint64_t a2)
{
  uint64_t result;

  if ((*a1 & 0x80000000) != 0 || a1[1] != 40)
  {
    result = 4294966992;
  }
  else if (a1[9])
  {
    result = _MIDISetupAddExternalDevice((MIDIServer *)a1[8]);
  }
  else
  {
    result = _MIDISetupAddDevice((MIDIServer *)a1[8]);
  }
  *(_DWORD *)(a2 + 32) = result;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

uint64_t _XSetupRemoveDevice(_DWORD *a1, uint64_t a2)
{
  uint64_t result;

  if ((*a1 & 0x80000000) != 0 || a1[1] != 40)
  {
    result = 4294966992;
  }
  else if (a1[9])
  {
    result = _MIDISetupRemoveExternalDevice((MIDIServer *)a1[8]);
  }
  else
  {
    result = _MIDISetupRemoveDevice((MIDIServer *)a1[8]);
  }
  *(_DWORD *)(a2 + 32) = result;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

uint64_t _XThruConnectionCreate(uint64_t result, uint64_t a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  CFIndex v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  const UInt8 *v10;
  __int128 v11;
  _OWORD v12[2];

  if ((*(_DWORD *)result & 0x80000000) == 0)
    goto LABEL_2;
  v3 = -304;
  if (*(_DWORD *)(result + 24) != 1)
    goto LABEL_3;
  v5 = *(unsigned int *)(result + 4);
  if (v5 < 0x3C || v5 > 0x23C)
    goto LABEL_3;
  if (*(_BYTE *)(result + 39) != 1)
    goto LABEL_17;
  v6 = *(unsigned int *)(result + 52);
  if (v6 > 0x200)
  {
LABEL_2:
    v3 = -304;
LABEL_3:
    *(_DWORD *)(a2 + 32) = v3;
    v4 = *MEMORY[0x1E0C804E8];
    goto LABEL_4;
  }
  v3 = -304;
  if ((int)v5 - 60 < v6)
    goto LABEL_3;
  v7 = (v6 + 3) & 0xFFFFFFFC;
  if ((_DWORD)v5 != v7 + 60)
    goto LABEL_3;
  v8 = *(_DWORD *)(result + 40);
  if (v8 != *(_DWORD *)(result + v7 + 56))
  {
LABEL_17:
    v3 = -300;
    goto LABEL_3;
  }
  v9 = ((v5 + 3) & 0x1FFFFFFFCLL) + result;
  if (*(_DWORD *)v9 || *(_DWORD *)(v9 + 4) <= 0x1Fu)
  {
    v3 = -309;
    goto LABEL_3;
  }
  v10 = *(const UInt8 **)(result + 28);
  v11 = *(_OWORD *)(v9 + 36);
  v12[0] = *(_OWORD *)(v9 + 20);
  v12[1] = v11;
  result = MIDIServer_ThruConnectionCreate(v12, (const UInt8 *)(result + 56), v6, v10, v8, (_DWORD *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  v4 = *MEMORY[0x1E0C804E8];
  if (!(_DWORD)result)
  {
    *(_QWORD *)(a2 + 24) = v4;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }
LABEL_4:
  *(_QWORD *)(a2 + 24) = v4;
  return result;
}

uint64_t _XThruConnectionDispose(_DWORD *a1, uint64_t a2)
{
  uint64_t result;

  if ((*a1 & 0x80000000) != 0 || a1[1] != 36)
    result = 4294966992;
  else
    result = _MIDIThruConnectionDispose((MIDIServer *)a1[8]);
  *(_DWORD *)(a2 + 32) = result;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

void _XThruConnectionGetParams(_DWORD *a1, uint64_t a2)
{
  MIDIServer *v3;
  int Params;
  int v5;
  void *v6[3];
  CFTypeRef cf;

  if ((*a1 & 0x80000000) != 0 || a1[1] != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
  }
  else
  {
    *(_DWORD *)(a2 + 36) = 16777473;
    v3 = (MIDIServer *)a1[8];
    cf = 0;
    Params = _MIDIThruConnectionGetParams(v3, &cf);
    if (Params)
    {
      v5 = Params;
    }
    else
    {
      LODWORD(v6[0]) = 1;
      v6[1] = 0;
      v5 = IPCBufferWriter::write((IPCBufferWriter *)v6, (CFDataRef)cf, (void **)(a2 + 28), (unsigned int *)(a2 + 52));
      CFRelease(cf);
      IPCBufferWriter::~IPCBufferWriter(v6);
      if (!v5)
      {
        *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
        *(_QWORD *)(a2 + 44) = *MEMORY[0x1E0C804E8];
        *(_DWORD *)a2 |= 0x80000000;
        *(_DWORD *)(a2 + 4) = 56;
        *(_DWORD *)(a2 + 24) = 1;
        return;
      }
    }
    *(_DWORD *)(a2 + 32) = v5;
  }
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
}

void sub_1D4F15860(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  IPCBufferWriter::~IPCBufferWriter(&a9);
  _Unwind_Resume(a1);
}

void _XThruConnectionSetParams(uint64_t a1, uint64_t a2)
{
  CFIndex v3;
  MIDIServer *v4;
  const UInt8 *v5;
  int v6;
  const UInt8 *v7;
  int v8;
  int v9;
  const __CFData *v10;

  if ((*(_DWORD *)a1 & 0x80000000) != 0 && *(_DWORD *)(a1 + 24) == 1 && *(_DWORD *)(a1 + 4) == 60)
  {
    if (*(_BYTE *)(a1 + 39) == 1 && (v3 = *(unsigned int *)(a1 + 40), (_DWORD)v3 == *(_DWORD *)(a1 + 56)))
    {
      v4 = (MIDIServer *)*(unsigned int *)(a1 + 52);
      v5 = *(const UInt8 **)(a1 + 28);
      v7 = v5;
      v8 = v3;
      v9 = 0;
      v10 = CFDataCreate(0, v5, v3);
      v6 = _MIDIThruConnectionSetParams(v4, v10);
      if (!v6)
        MEMORY[0x1D826C41C](*MEMORY[0x1E0C83DA0], v5, v3);
      IPCBufferReader::~IPCBufferReader((IPCBufferReader *)&v7);
    }
    else
    {
      v6 = -300;
    }
  }
  else
  {
    v6 = -304;
  }
  *(_DWORD *)(a2 + 32) = v6;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
}

void sub_1D4F1595C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  IPCBufferReader::~IPCBufferReader((IPCBufferReader *)va);
  _Unwind_Resume(a1);
}

void _XThruConnectionFind(uint64_t a1, uint64_t a2)
{
  unsigned int v3;
  unsigned int v4;
  BOOL v5;
  BOOL v6;
  CFIndex v7;
  int v8;
  void *v9[3];
  CFTypeRef cf;
  uint64_t v11;
  int v12;
  int v13;
  MIDIServer *v14;

  if ((*(_DWORD *)a1 & 0x80000000) == 0
    && (v3 = *(_DWORD *)(a1 + 4), v3 >= 0x24)
    && v3 <= 0x224
    && ((v4 = *(_DWORD *)(a1 + 32), v4 <= 0x200) ? (v5 = v3 - 36 >= v4) : (v5 = 0),
        v5 ? (v6 = v3 == ((v4 + 3) & 0xFFFFFFFC) + 36) : (v6 = 0),
        v6))
  {
    *(_DWORD *)(a2 + 36) = 16777473;
    v7 = *(unsigned int *)(a1 + 32);
    v11 = a1 + 36;
    v12 = v7;
    v13 = 0;
    v14 = (MIDIServer *)CFStringCreateWithBytes(0, (const UInt8 *)(a1 + 36), v7, 0x100u, 1u);
    cf = 0;
    v8 = _MIDIThruConnectionFind(v14, (__CFData **)&cf);
    if (v8)
    {
      IPCBufferReader::~IPCBufferReader((IPCBufferReader *)&v11);
    }
    else
    {
      LODWORD(v9[0]) = 1;
      v9[1] = 0;
      v8 = IPCBufferWriter::write((IPCBufferWriter *)v9, (CFDataRef)cf, (void **)(a2 + 28), (unsigned int *)(a2 + 52));
      CFRelease(cf);
      IPCBufferWriter::~IPCBufferWriter(v9);
      IPCBufferReader::~IPCBufferReader((IPCBufferReader *)&v11);
      if (!v8)
      {
        *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
        *(_QWORD *)(a2 + 44) = *MEMORY[0x1E0C804E8];
        *(_DWORD *)a2 |= 0x80000000;
        *(_DWORD *)(a2 + 4) = 56;
        *(_DWORD *)(a2 + 24) = 1;
        return;
      }
    }
    *(_DWORD *)(a2 + 32) = v8;
  }
  else
  {
    *(_DWORD *)(a2 + 32) = -304;
  }
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
}

void sub_1D4F15ABC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v3;
  va_list va;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  va_list va1;

  va_start(va1, a2);
  va_start(va, a2);
  v3 = va_arg(va1, void *);
  v5 = va_arg(va1, _QWORD);
  v6 = va_arg(va1, _QWORD);
  v7 = va_arg(va1, _QWORD);
  IPCBufferWriter::~IPCBufferWriter((void **)va);
  IPCBufferReader::~IPCBufferReader((IPCBufferReader *)va1);
  _Unwind_Resume(a1);
}

MIDIServer *_XCIGetDiscoveryMUID(MIDIServer *result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *((_DWORD *)result + 1) != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  }
  else
  {
    result = (MIDIServer *)_MIDICapabilityGetDiscoveryMUID(result);
    *(_DWORD *)(a2 + 32) = 0;
    *(_DWORD *)(a2 + 36) = (_DWORD)result;
    *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
    *(_DWORD *)(a2 + 4) = 40;
  }
  return result;
}

uint64_t _XCIMUIDCollides(_DWORD *a1, uint64_t a2)
{
  uint64_t result;

  if ((*a1 & 0x80000000) != 0 || a1[1] != 36)
    result = 4294966992;
  else
    result = _MIDICapabilityMUIDCollides((MIDIServer *)a1[8]);
  *(_DWORD *)(a2 + 32) = result;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

uint64_t _XUMPCIObjectCreate(uint64_t result, uint64_t a2)
{
  int v3;
  int v4;
  uint64_t v5;
  int v6;
  const UInt8 *v7;
  __int128 v8;
  _OWORD v9[2];

  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 60)
  {
    v4 = -304;
    goto LABEL_10;
  }
  if (*(_BYTE *)(result + 39) != 1 || (v3 = *(_DWORD *)(result + 40), v3 != *(_DWORD *)(result + 56)))
  {
    v4 = -300;
    goto LABEL_10;
  }
  if (*(_DWORD *)(result + 60) || *(_DWORD *)(result + 64) <= 0x1Fu)
  {
    v4 = -309;
LABEL_10:
    *(_DWORD *)(a2 + 32) = v4;
    v5 = *MEMORY[0x1E0C804E8];
    goto LABEL_11;
  }
  v6 = *(_DWORD *)(result + 52);
  v7 = *(const UInt8 **)(result + 28);
  v8 = *(_OWORD *)(result + 96);
  v9[0] = *(_OWORD *)(result + 80);
  v9[1] = v8;
  result = MIDIServer_UMPCIObjectCreate(v9, v6, v7, v3, (int *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  v5 = *MEMORY[0x1E0C804E8];
  if (!(_DWORD)result)
  {
    *(_QWORD *)(a2 + 24) = v5;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }
LABEL_11:
  *(_QWORD *)(a2 + 24) = v5;
  return result;
}

uint64_t _XUMPCIObjectDispose(_DWORD *a1, uint64_t a2)
{
  uint64_t result;

  if ((*a1 & 0x80000000) != 0 || a1[1] != 36)
    result = 4294966992;
  else
    result = _UMPCIObjectDispose((MIDIServer *)a1[8]);
  *(_DWORD *)(a2 + 32) = result;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

void _XUMPCIObjectSetDescription(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  MIDIServer *v4;
  const UInt8 *v5;
  const UInt8 *v6;
  int v7;
  const UInt8 *v8;
  int v9;
  int v10;
  uint64_t v11;

  if ((*(_DWORD *)a1 & 0x80000000) != 0 && *(_DWORD *)(a1 + 24) == 1 && *(_DWORD *)(a1 + 4) == 60)
  {
    if (*(_BYTE *)(a1 + 39) == 1 && (v3 = *(unsigned int *)(a1 + 40), (_DWORD)v3 == *(_DWORD *)(a1 + 56)))
    {
      v4 = (MIDIServer *)*(unsigned int *)(a1 + 52);
      v5 = *(const UInt8 **)(a1 + 28);
      v8 = v5;
      v9 = v3;
      v10 = 0;
      v11 = 0;
      v6 = IPCBufferReader::ReadCFPropertyList(&v8, 0);
      v7 = _UMPCIObjectSetDescription(v4, v6);
      if (!v7)
        MEMORY[0x1D826C41C](*MEMORY[0x1E0C83DA0], v5, v3);
      IPCBufferReader::~IPCBufferReader((IPCBufferReader *)&v8);
    }
    else
    {
      v7 = -300;
    }
  }
  else
  {
    v7 = -304;
  }
  *(_DWORD *)(a2 + 32) = v7;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
}

void sub_1D4F15DBC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  IPCBufferReader::~IPCBufferReader((IPCBufferReader *)va);
  _Unwind_Resume(a1);
}

uint64_t _XUMPCIObjectSetEnableState(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if ((*(_DWORD *)a1 & 0x80000000) != 0 || *(_DWORD *)(a1 + 4) != 40)
    result = 4294966992;
  else
    result = _UMPCIObjectSetEnableState((MIDIServer *)*(unsigned int *)(a1 + 32), *(unsigned __int8 *)(a1 + 36));
  *(_DWORD *)(a2 + 32) = result;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

void _XUMPCIGlobalState(_DWORD *a1, uint64_t a2)
{
  int v3;
  int v4;
  void *v5[3];
  CFTypeRef cf;

  if ((*a1 & 0x80000000) != 0 || a1[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
  }
  else
  {
    *(_DWORD *)(a2 + 36) = 16777472;
    cf = 0;
    v3 = _UMPCIGlobalState((MIDIServer *)&cf);
    if (v3)
    {
      v4 = v3;
    }
    else
    {
      LODWORD(v5[0]) = 1;
      v5[1] = 0;
      v4 = IPCBufferWriter::write((IPCBufferWriter *)v5, cf, (void **)(a2 + 28), (unsigned int *)(a2 + 52));
      CFRelease(cf);
      IPCBufferWriter::~IPCBufferWriter(v5);
      if (!v4)
      {
        *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
        *(_QWORD *)(a2 + 44) = *MEMORY[0x1E0C804E8];
        *(_DWORD *)a2 |= 0x80000000;
        *(_DWORD *)(a2 + 4) = 56;
        *(_DWORD *)(a2 + 24) = 1;
        return;
      }
    }
    *(_DWORD *)(a2 + 32) = v4;
  }
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
}

void sub_1D4F15F14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  IPCBufferWriter::~IPCBufferWriter(&a9);
  _Unwind_Resume(a1);
}

uint64_t _XUMPCIDiscover(MIDIServer *a1, uint64_t a2)
{
  uint64_t result;

  if ((*(_DWORD *)a1 & 0x80000000) != 0 || *((_DWORD *)a1 + 1) != 36)
    result = 4294966992;
  else
    result = _UMPCIDiscover(a1);
  *(_DWORD *)(a2 + 32) = result;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

uint64_t MIDIIPC_server(_DWORD *a1, uint64_t a2)
{
  int v2;
  int v3;
  int v4;
  void (*v5)(void);
  uint64_t result;

  v2 = a1[2];
  *(_DWORD *)a2 = *a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  v3 = a1[5] + 100;
  *(_DWORD *)(a2 + 8) = v2;
  *(_DWORD *)(a2 + 12) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  v4 = a1[5];
  if ((v4 - 8049) >= 0xFFFFFFCF
    && (v5 = (void (*)(void))MIDIServer_MIDIIPC_subsystem[5 * (v4 - 8000) + 5]) != 0)
  {
    v5();
    return 1;
  }
  else
  {
    result = 0;
    *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
    *(_DWORD *)(a2 + 32) = -303;
  }
  return result;
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1E0C97D10](theArray, range.location, range.length, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1E0C97D20](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1E0C97D90]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

CFStringRef CFBundleCopyLocalizedString(CFBundleRef bundle, CFStringRef key, CFStringRef value, CFStringRef tableName)
{
  return (CFStringRef)MEMORY[0x1E0C98050](bundle, key, value, tableName);
}

CFBundleRef CFBundleGetBundleWithIdentifier(CFStringRef bundleID)
{
  return (CFBundleRef)MEMORY[0x1E0C980E8](bundleID);
}

CFDictionaryRef CFBundleGetInfoDictionary(CFBundleRef bundle)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98130](bundle);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x1E0C98150]();
}

CFTypeRef CFBundleGetValueForInfoDictionaryKey(CFBundleRef bundle, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x1E0C98180](bundle, key);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
  MEMORY[0x1E0C98390](theData, bytes, length);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1E0C983A0](allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x1E0C983B8](allocator, capacity);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x1E0C983C8](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1E0C983E0](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
  MEMORY[0x1E0C983F0](theData, range.location, range.length, buffer);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1E0C983F8](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x1E0C98408](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x1E0C98418]();
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
  MEMORY[0x1E0C98430](theData, length);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98500](theDict, key, value);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x1E0C98518](theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98530](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98558](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1E0C98570](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
  MEMORY[0x1E0C985A0](theDict, keys, values);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1E0C985A8]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
  MEMORY[0x1E0C985D8](theDict);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x1E0C985E8](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFMachPortRef CFMachPortCreate(CFAllocatorRef allocator, CFMachPortCallBack callout, CFMachPortContext *context, Boolean *shouldFreeInfo)
{
  return (CFMachPortRef)MEMORY[0x1E0C98810](allocator, callout, context, shouldFreeInfo);
}

CFRunLoopSourceRef CFMachPortCreateRunLoopSource(CFAllocatorRef allocator, CFMachPortRef port, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x1E0C98818](allocator, port, order);
}

mach_port_t CFMachPortGetPort(CFMachPortRef port)
{
  return MEMORY[0x1E0C98830](port);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988D0]();
}

CFTypeID CFNullGetTypeID(void)
{
  return MEMORY[0x1E0C98908]();
}

CFComparisonResult CFNumberCompare(CFNumberRef number, CFNumberRef otherNumber, void *context)
{
  return MEMORY[0x1E0C98910](number, otherNumber, context);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1E0C98928](allocator, theType, valuePtr);
}

CFNumberType CFNumberGetType(CFNumberRef number)
{
  return MEMORY[0x1E0C989A8](number);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1E0C989B8]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

CFPlugInRef CFPlugInCreate(CFAllocatorRef allocator, CFURLRef plugInURL)
{
  return (CFPlugInRef)MEMORY[0x1E0C989E8](allocator, plugInURL);
}

CFArrayRef CFPlugInFindFactoriesForPlugInTypeInPlugIn(CFUUIDRef typeUUID, CFPlugInRef plugIn)
{
  return (CFArrayRef)MEMORY[0x1E0C989F0](typeUUID, plugIn);
}

CFBundleRef CFPlugInGetBundle(CFPlugInRef plugIn)
{
  return (CFBundleRef)MEMORY[0x1E0C98A00](plugIn);
}

void *__cdecl CFPlugInInstanceCreate(CFAllocatorRef allocator, CFUUIDRef factoryUUID, CFUUIDRef typeUUID)
{
  return (void *)MEMORY[0x1E0C98A10](allocator, factoryUUID, typeUUID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A60](key, applicationID, userName, hostName);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  MEMORY[0x1E0C98A90](key, value, applicationID, userName, hostName);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x1E0C98A98](applicationID, userName, hostName);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1E0C98AA0](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateDeepCopy(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFOptionFlags mutabilityOption)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98AB0](allocator, propertyList, mutabilityOption);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98AD0](allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98BF8](rl, source, mode);
}

void CFRunLoopAddTimer(CFRunLoopRef rl, CFRunLoopTimerRef timer, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98C00](rl, timer, mode);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1E0C98C30]();
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
  MEMORY[0x1E0C98C80](rl, mode, block);
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98C90](rl, source, mode);
}

void CFRunLoopRun(void)
{
  MEMORY[0x1E0C98CA8]();
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x1E0C98CB0](mode, returnAfterSourceHandled, seconds);
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x1E0C98CC8](allocator, order, context);
}

CFRunLoopTimerRef CFRunLoopTimerCreate(CFAllocatorRef allocator, CFAbsoluteTime fireDate, CFTimeInterval interval, CFOptionFlags flags, CFIndex order, CFRunLoopTimerCallBack callout, CFRunLoopTimerContext *context)
{
  return (CFRunLoopTimerRef)MEMORY[0x1E0C98D08](allocator, flags, order, callout, context, fireDate, interval);
}

void CFRunLoopTimerSetNextFireDate(CFRunLoopTimerRef timer, CFAbsoluteTime fireDate)
{
  MEMORY[0x1E0C98D58](timer, fireDate);
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
  MEMORY[0x1E0C98D68](rl);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x1E0C98D70](theSet, value);
}

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void *context)
{
  MEMORY[0x1E0C98D78](theSet, applier, context);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x1E0C98D98](allocator, capacity, callBacks);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
  MEMORY[0x1E0C98ED8](theString, appendedString);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F10](theString1, theString2, compareOptions);
}

CFComparisonResult CFStringCompareWithOptions(CFStringRef theString1, CFStringRef theString2, CFRange rangeToCompare, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F18](theString1, theString2, rangeToCompare.location, rangeToCompare.length, compareOptions);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x1E0C98F78](alloc, theString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98F90](alloc, maxLength);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1E0C98FB8](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98FD0](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithCharacters(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars)
{
  return (CFStringRef)MEMORY[0x1E0C98FE8](alloc, chars, numChars);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1E0C99018](alloc, formatOptions, format);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x1E0C99080](theString, range.location, range.length, *(_QWORD *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99098](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1E0C990A0](theString, *(_QWORD *)&encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
  MEMORY[0x1E0C990C0](theString, range.location, range.length, buffer);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

void CFStringInsert(CFMutableStringRef str, CFIndex idx, CFStringRef insertedStr)
{
  MEMORY[0x1E0C991B8](str, idx, insertedStr);
}

CFStringRef CFURLCopyLastPathComponent(CFURLRef url)
{
  return (CFStringRef)MEMORY[0x1E0C992F8](url);
}

CFURLRef CFURLCreateFromFileSystemRepresentation(CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1E0C993C8](allocator, buffer, bufLen, isDirectory);
}

CFURLRef CFURLCreateFromFileSystemRepresentationRelativeToBase(CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x1E0C993D8](allocator, buffer, bufLen, isDirectory, baseURL);
}

CFUUIDRef CFUUIDGetConstantUUIDWithBytes(CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return (CFUUIDRef)MEMORY[0x1E0C99558](alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6);
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  uint64_t v1;
  uint64_t v2;
  CFUUIDBytes result;

  v1 = MEMORY[0x1E0C99568](uuid);
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

CFDataRef IOCFSerialize(CFTypeRef object, CFOptionFlags options)
{
  return (CFDataRef)MEMORY[0x1E0CBAD30](object, options);
}

CFTypeRef IOCFUnserializeBinary(const char *buffer, size_t bufferSize, CFAllocatorRef allocator, CFOptionFlags options, CFStringRef *errorString)
{
  return (CFTypeRef)MEMORY[0x1E0CBAD40](buffer, bufferSize, allocator, options, errorString);
}

kern_return_t IOConnectCallAsyncMethod(mach_port_t connection, uint32_t selector, mach_port_t wake_port, uint64_t *reference, uint32_t referenceCnt, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x1E0CBAD68](*(_QWORD *)&connection, *(_QWORD *)&selector, *(_QWORD *)&wake_port, reference, *(_QWORD *)&referenceCnt, input, *(_QWORD *)&inputCnt, inputStruct);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x1E0CBAD80](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOConnectMapMemory64(io_connect_t connect, uint32_t memoryType, task_port_t intoTask, mach_vm_address_t *atAddress, mach_vm_size_t *ofSize, IOOptionBits options)
{
  return MEMORY[0x1E0CBADA0](*(_QWORD *)&connect, *(_QWORD *)&memoryType, *(_QWORD *)&intoTask, atAddress, ofSize, *(_QWORD *)&options);
}

kern_return_t IOConnectRelease(io_connect_t connect)
{
  return MEMORY[0x1E0CBADA8](*(_QWORD *)&connect);
}

kern_return_t IOConnectTrap3(io_connect_t connect, uint32_t index, uintptr_t p1, uintptr_t p2, uintptr_t p3)
{
  return MEMORY[0x1E0CBADD8](*(_QWORD *)&connect, *(_QWORD *)&index, p1, p2, p3);
}

kern_return_t IOConnectUnmapMemory64(io_connect_t connect, uint32_t memoryType, task_port_t fromTask, mach_vm_address_t atAddress)
{
  return MEMORY[0x1E0CBADF8](*(_QWORD *)&connect, *(_QWORD *)&memoryType, *(_QWORD *)&fromTask, atAddress);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x1E0CBB668](*(_QWORD *)&iterator);
}

kern_return_t IOMainPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return MEMORY[0x1E0CBB680](*(_QWORD *)&bootstrapPort, mainPort);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x1E0CBB698](*(_QWORD *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
  MEMORY[0x1E0CBB6A0](notify);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
  MEMORY[0x1E0CBB6B8](notify, queue);
}

BOOLean_t IOObjectIsEqualTo(io_object_t object, io_object_t anObject)
{
  return MEMORY[0x1E0CBB6E0](*(_QWORD *)&object, *(_QWORD *)&anObject);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1E0CBB6F0](*(_QWORD *)&object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return MEMORY[0x1E0CBB6F8](*(_QWORD *)&object);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return MEMORY[0x1E0CBB9C8](notifyPort, notificationType, matching, callback, refCon, notification);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x1E0CBBA10](*(_QWORD *)&service, *(_QWORD *)&owningTask, *(_QWORD *)&type, connect);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

uint64_t caulk::mach::os_eventlink::dissociate(caulk::mach::os_eventlink *this)
{
  return MEMORY[0x1E0DDB5B0](this);
}

uint64_t caulk::mach::os_eventlink::signal_or_error(caulk::mach::os_eventlink *this)
{
  return MEMORY[0x1E0DDB5B8](this);
}

uint64_t caulk::mach::os_eventlink::timed_wait_signal_or_error(caulk::mach::os_eventlink *this, double a2)
{
  return MEMORY[0x1E0DDB5C0](this, a2);
}

uint64_t caulk::mach::os_eventlink::make()
{
  return MEMORY[0x1E0DDB5C8]();
}

uint64_t caulk::mach::os_eventlink::associate(caulk::mach::os_eventlink *this)
{
  return MEMORY[0x1E0DDB5D0](this);
}

uint64_t caulk::mach::details::release_os_object(caulk::mach::details *this, void *a2)
{
  return MEMORY[0x1E0DDB640](this, a2);
}

uint64_t caulk::mach::semaphore::signal_all_or_error(caulk::mach::semaphore *this)
{
  return MEMORY[0x1E0DDB650](this);
}

uint64_t caulk::mach::semaphore::timed_wait_or_error(caulk::mach::semaphore *this, double a2)
{
  return MEMORY[0x1E0DDB658](this, a2);
}

uint64_t caulk::mach::semaphore::semaphore(caulk::mach::semaphore *this)
{
  return MEMORY[0x1E0DDB668](this);
}

void caulk::mach::semaphore::~semaphore(caulk::mach::semaphore *this)
{
  MEMORY[0x1E0DDB670](this);
}

uint64_t caulk::alloc::get_realtime_safe_resource(caulk::alloc *this)
{
  return MEMORY[0x1E0DDB690](this);
}

uint64_t caulk::thread::attributes::apply_to_this_thread(caulk::thread::attributes *this)
{
  return MEMORY[0x1E0DDB6A8](this);
}

uint64_t caulk::thread::join(caulk::thread *this)
{
  return MEMORY[0x1E0DDB6B0](this);
}

uint64_t caulk::thread::start(caulk::thread *this, caulk::thread::attributes *a2, void *(*a3)(void *), void *a4)
{
  return MEMORY[0x1E0DDB6B8](this, a2, a3, a4);
}

uint64_t caulk::thread::thread()
{
  return MEMORY[0x1E0DDB6C0]();
}

void caulk::thread::~thread(caulk::thread *this)
{
  MEMORY[0x1E0DDB6C8](this);
}

uint64_t caulk::thread::operator=()
{
  return MEMORY[0x1E0DDB6D0]();
}

uint64_t caulk::mach::os_eventlink::copy_mach_port(caulk::mach::os_eventlink *this)
{
  return MEMORY[0x1E0DDB740](this);
}

const char *__cdecl std::runtime_error::what(const std::runtime_error *this)
{
  return (const char *)MEMORY[0x1E0DE4190](this);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x1E0DE4248](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x1E0DE4258](this);
}

const char *__cdecl std::exception::what(const std::exception *this)
{
  return (const char *)MEMORY[0x1E0DE4270](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1E0DE4288](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x1E0DE4308](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::string *a2)
{
  return (std::runtime_error *)MEMORY[0x1E0DE4310](this, a2);
}

{
  return (std::runtime_error *)MEMORY[0x1E0DE4328](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::runtime_error *a2)
{
  return (std::runtime_error *)MEMORY[0x1E0DE4318](this, a2);
}

void std::runtime_error::~runtime_error(std::runtime_error *this)
{
  MEMORY[0x1E0DE4338](this);
}

{
  MEMORY[0x1E0DE4340](this);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1E0DE4388](this);
}

void std::__call_once(std::once_flag::_State_type *a1, void *a2, void (__cdecl *a3)(void *))
{
  MEMORY[0x1E0DE43A8](a1, a2, a3);
}

void std::this_thread::sleep_for (const std::chrono::nanoseconds *__ns)
{
  MEMORY[0x1E0DE43C0](__ns);
}

void std::string::__grow_by_and_replace(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add, const std::string::value_type *__p_new_stuff)
{
  MEMORY[0x1E0DE43F8](this, __old_cap, __delta_cap, __old_sz, __n_copy, __n_del, __n_add, __p_new_stuff);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1E0DE4428](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1E0DE4470](this, __pos, __s, __n);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  MEMORY[0x1E0DE4480](this, __n, __c);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
  MEMORY[0x1E0DE44B8](this, __c);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x1E0DE44D8](this, __str);
}

std::system_error *__cdecl std::system_error::system_error(std::system_error *this, int __ev, const std::error_category *__ecat, const char *__what_arg)
{
  return (std::system_error *)MEMORY[0x1E0DE4568](this, *(_QWORD *)&__ev, __ecat, __what_arg);
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x1E0DE46B0]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x1E0DE46B8]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x1E0DE46C8]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x1E0DE46D0]();
}

{
  return MEMORY[0x1E0DE4700]();
}

{
  return MEMORY[0x1E0DE4708]();
}

{
  return MEMORY[0x1E0DE4728]();
}

{
  return MEMORY[0x1E0DE4738]();
}

std::random_device *__cdecl std::random_device::random_device(std::random_device *this, const std::string *__token)
{
  return (std::random_device *)MEMORY[0x1E0DE4770](this, __token);
}

void std::random_device::~random_device(std::random_device *this)
{
  MEMORY[0x1E0DE4778](this);
}

std::random_device::result_type std::random_device::operator()(std::random_device *this)
{
  return MEMORY[0x1E0DE4780](this);
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x1E0DE47E0]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x1E0DE47E8]();
}

void std::recursive_mutex::lock(std::recursive_mutex *this)
{
  MEMORY[0x1E0DE4820](this);
}

void std::recursive_mutex::unlock(std::recursive_mutex *this)
{
  MEMORY[0x1E0DE4828](this);
}

std::recursive_mutex *__cdecl std::recursive_mutex::recursive_mutex(std::recursive_mutex *this)
{
  return (std::recursive_mutex *)MEMORY[0x1E0DE4838](this);
}

void std::recursive_mutex::~recursive_mutex(std::recursive_mutex *this)
{
  MEMORY[0x1E0DE4840](this);
}

const std::error_category *std::system_category(void)
{
  return (const std::error_category *)MEMORY[0x1E0DE4848]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x1E0DE48F0](this);
}

std::__shared_weak_count *__cdecl std::__shared_weak_count::lock(std::__shared_weak_count *this)
{
  return (std::__shared_weak_count *)MEMORY[0x1E0DE48F8](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x1E0DE4900](this);
}

void *__cdecl std::align(size_t __align, size_t __sz, void **__ptr, size_t *__space)
{
  return (void *)MEMORY[0x1E0DE4A88](__align, __sz, __ptr, __space);
}

void std::mutex::lock(std::mutex *this)
{
  MEMORY[0x1E0DE4AA0](this);
}

void std::mutex::unlock(std::mutex *this)
{
  MEMORY[0x1E0DE4AA8](this);
}

void std::mutex::~mutex(std::mutex *this)
{
  MEMORY[0x1E0DE4AB8](this);
}

std::chrono::steady_clock::time_point std::chrono::steady_clock::now(void)
{
  return (std::chrono::steady_clock::time_point)MEMORY[0x1E0DE4B38]();
}

void std::locale::~locale(std::locale *this)
{
  MEMORY[0x1E0DE4B98](this);
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
  MEMORY[0x1E0DE4C50](this);
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
  MEMORY[0x1E0DE4C68](this, __sb);
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
  MEMORY[0x1E0DE4C80](this, *(_QWORD *)&__state);
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x1E0DE4D28]();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x1E0DE4D58](retstr, *(_QWORD *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unsigned int __val)
{
  return (std::string *)MEMORY[0x1E0DE4D60](retstr, *(_QWORD *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return (std::string *)MEMORY[0x1E0DE4D70](retstr, __val);
}

uint64_t std::operator+<char>()
{
  return MEMORY[0x1E0DE4D88]();
}

void std::bad_cast::~bad_cast(std::bad_cast *this)
{
  MEMORY[0x1E0DE4DA0](this);
}

void std::exception::~exception(std::exception *this)
{
  MEMORY[0x1E0DE4DD8](this);
}

int std::uncaught_exceptions(void)
{
  return MEMORY[0x1E0DE4E08]();
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

uint64_t operator delete[]()
{
  return off_1E98B6270();
}

void operator delete(void *__p)
{
  off_1E98B6278(__p);
}

uint64_t operator delete()
{
  return off_1E98B6280();
}

uint64_t operator new[]()
{
  return off_1E98B6288();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E98B6290(__sz);
}

uint64_t operator new()
{
  return off_1E98B6298();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1E0DE5068](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1E0DE5080](a1);
}

void __cxa_end_catch(void)
{
  MEMORY[0x1E0DE5098]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x1E0DE50A0](a1);
}

void *__cxa_get_exception_ptr(void *a1)
{
  return (void *)MEMORY[0x1E0DE50A8](a1);
}

void __cxa_guard_abort(__guard *a1)
{
  MEMORY[0x1E0DE50B0](a1);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x1E0DE50B8](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x1E0DE50C0](a1);
}

void __cxa_rethrow(void)
{
  MEMORY[0x1E0DE50D0]();
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x1E0DE50D8](a1, lptinfo, a3);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1E0C80B50](*(_QWORD *)&a1, a2);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1E0C80B68]();
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1E0C80C70](*(_QWORD *)&a1);
}

uint64_t __udivti3()
{
  return MEMORY[0x1E0C80C80]();
}

uint64_t _os_assert_log()
{
  return MEMORY[0x1E0C80FF0]();
}

uint64_t _os_crash()
{
  return MEMORY[0x1E0C81000]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x1E0C81570]();
}

void audit_token_to_au32(audit_token_t *atoken, uid_t *auidp, uid_t *euidp, gid_t *egidp, uid_t *ruidp, gid_t *rgidp, pid_t *pidp, au_asid_t *asidp, au_tid_t *tidp)
{
  MEMORY[0x1E0DE40C8](atoken, auidp, euidp, egidp, ruidp, rgidp, pidp, asidp);
}

pid_t audit_token_to_pid(audit_token_t *atoken)
{
  return MEMORY[0x1E0DE40F0](atoken);
}

kern_return_t bootstrap_check_in(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x1E0C816F8](*(_QWORD *)&bp, service_name, sp);
}

kern_return_t bootstrap_look_up(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x1E0C81708](*(_QWORD *)&bp, service_name, sp);
}

uint64_t bootstrap_look_up2()
{
  return MEMORY[0x1E0C81710]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x1E0C82698](a1);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x1E0C82BC0](object);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BF8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_barrier_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C30](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E50](label, attr, target);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x1E0C82E98](object);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA8](object);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

dispatch_workloop_t dispatch_workloop_create_inactive(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x1E0C82FE0](label);
}

uint64_t dispatch_workloop_set_scheduler_priority()
{
  return MEMORY[0x1E0C83010]();
}

void exit(int a1)
{
  MEMORY[0x1E0C83278](*(_QWORD *)&a1);
}

int fclose(FILE *a1)
{
  return MEMORY[0x1E0C832F8](a1);
}

int fflush(FILE *a1)
{
  return MEMORY[0x1E0C83370](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1E0C83460](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C83478](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x1E0C83488](*(_QWORD *)&a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C834A0](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x1E0C83530](a1, a2, *(_QWORD *)&a3);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x1E0C83580](a1);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1E0C83590](*(_QWORD *)&a1, a2);
}

FILE *__cdecl funopen(const void *a1, int (__cdecl *a2)(void *, char *, int), int (__cdecl *a3)(void *, const char *, int), fpos_t (__cdecl *a4)(void *, fpos_t, int), int (__cdecl *a5)(void *))
{
  return (FILE *)MEMORY[0x1E0C835C8](a1, a2, a3, a4, a5);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C835E0](__ptr, __size, __nitems, __stream);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1E0C83660](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

lconv *localeconv(void)
{
  return (lconv *)MEMORY[0x1E0C83B98]();
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C83C40](a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1E0C83C80](*(_QWORD *)&error_value);
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x1E0C83CB0](msg, *(_QWORD *)&option, *(_QWORD *)&send_size, *(_QWORD *)&rcv_size, *(_QWORD *)&rcv_name, *(_QWORD *)&timeout, *(_QWORD *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
  MEMORY[0x1E0C83CC0](a1);
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return MEMORY[0x1E0C83CE0](*(_QWORD *)&task, *(_QWORD *)&right, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1E0C83CF8](*(_QWORD *)&task, *(_QWORD *)&name);
}

kern_return_t mach_port_insert_right(ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return MEMORY[0x1E0C83D48](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&poly, *(_QWORD *)&polyPoly);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x1E0C83D58](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&right, *(_QWORD *)&delta);
}

kern_return_t mach_port_request_notification(ipc_space_t task, mach_port_name_t name, mach_msg_id_t msgid, mach_port_mscount_t sync, mach_port_t notify, mach_msg_type_name_t notifyPoly, mach_port_t *previous)
{
  return MEMORY[0x1E0C83D70](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&msgid, *(_QWORD *)&sync, *(_QWORD *)&notify, *(_QWORD *)&notifyPoly, previous);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F10](ptr, size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1E0C84070](__s, *(_QWORD *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
}

void mig_dealloc_reply_port(mach_port_t reply_port)
{
  MEMORY[0x1E0C840E8](*(_QWORD *)&reply_port);
}

mach_port_t mig_get_reply_port(void)
{
  return MEMORY[0x1E0C84100]();
}

void mig_put_reply_port(mach_port_t reply_port)
{
  MEMORY[0x1E0C84110](*(_QWORD *)&reply_port);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1E0C84160](a1, a2);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1E0C841D8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1E0C84220](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x1E0C844C0](a1);
}

uint64_t os_eventlink_associate()
{
  return MEMORY[0x1E0C846A0]();
}

uint64_t os_eventlink_cancel()
{
  return MEMORY[0x1E0C846A8]();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return MEMORY[0x1E0C84CB0](a1);
}

int pthread_attr_getschedparam(const pthread_attr_t *a1, sched_param *a2)
{
  return MEMORY[0x1E0C84CB8](a1, a2);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return MEMORY[0x1E0C84CC8](a1);
}

int pthread_attr_setdetachstate(pthread_attr_t *a1, int a2)
{
  return MEMORY[0x1E0C84CD8](a1, *(_QWORD *)&a2);
}

int pthread_attr_setschedparam(pthread_attr_t *a1, const sched_param *a2)
{
  return MEMORY[0x1E0C84CE8](a1, a2);
}

int pthread_attr_setschedpolicy(pthread_attr_t *a1, int a2)
{
  return MEMORY[0x1E0C84CF0](a1, *(_QWORD *)&a2);
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return MEMORY[0x1E0C84D18](a1);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return MEMORY[0x1E0C84D20](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x1E0C84D28](a1, a2);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return MEMORY[0x1E0C84D30](a1);
}

int pthread_cond_timedwait_relative_np(pthread_cond_t *a1, pthread_mutex_t *a2, const timespec *a3)
{
  return MEMORY[0x1E0C84D40](a1, a2, a3);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x1E0C84D48](a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x1E0C84D50](a1, a2, a3, a4);
}

int pthread_equal(pthread_t a1, pthread_t a2)
{
  return MEMORY[0x1E0C84D80](a1, a2);
}

mach_port_t pthread_mach_thread_np(pthread_t a1)
{
  return MEMORY[0x1E0C84E00](a1);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E18](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1E0C84E20](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_trylock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E30](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1E0C84ED8]();
}

int pthread_setname_np(const char *a1)
{
  return MEMORY[0x1E0C84F08](a1);
}

int rand(void)
{
  return MEMORY[0x1E0C84FB0]();
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x1E0C85008](a1);
}

int readdir_r(DIR *a1, dirent *a2, dirent **a3)
{
  return MEMORY[0x1E0C85010](a1, a2, a3);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
  MEMORY[0x1E0C85100](__from, __to, __ec);
}

void rewind(FILE *a1)
{
  MEMORY[0x1E0C85120](a1);
}

int shm_open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C853A8](a1, *(_QWORD *)&a2);
}

int shm_unlink(const char *a1)
{
  return MEMORY[0x1E0C853B0](a1);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1E0C85438](*(_QWORD *)&a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

void srand(unsigned int a1)
{
  MEMORY[0x1E0C85478](*(_QWORD *)&a1);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C85498](a1, a2);
}

char *__cdecl strcat(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1E0C85510](__s1, __s2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1E0C85518](__s, *(_QWORD *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return (char *)MEMORY[0x1E0C85530](__dst, __src);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1E0C85570](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1E0C855E8](__s, *(_QWORD *)&__c);
}

double strtod(const char *a1, char **a2)
{
  double result;

  MEMORY[0x1E0C85618](a1, a2);
  return result;
}

uint64_t strtoll(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85678](__str, __endptr, *(_QWORD *)&__base);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C856A8](__str, __endptr, *(_QWORD *)&__base);
}

kern_return_t task_get_special_port(task_inspect_t task, int which_port, mach_port_t *special_port)
{
  return MEMORY[0x1E0C85828](*(_QWORD *)&task, *(_QWORD *)&which_port, special_port);
}

kern_return_t thread_info(thread_inspect_t target_act, thread_flavor_t flavor, thread_info_t thread_info_out, mach_msg_type_number_t *thread_info_outCnt)
{
  return MEMORY[0x1E0C858F8](*(_QWORD *)&target_act, *(_QWORD *)&flavor, thread_info_out, thread_info_outCnt);
}

kern_return_t thread_policy_set(thread_act_t thread, thread_policy_flavor_t flavor, thread_policy_t policy_info, mach_msg_type_number_t policy_infoCnt)
{
  return MEMORY[0x1E0C85908](*(_QWORD *)&thread, *(_QWORD *)&flavor, policy_info, *(_QWORD *)&policy_infoCnt);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1E0C85950](a1);
}

int unlink(const char *a1)
{
  return MEMORY[0x1E0C859B8](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1E0C859E0](*(_QWORD *)&a1);
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return MEMORY[0x1E0C85A80](*(_QWORD *)&target_task, address, size, *(_QWORD *)&flags);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x1E0C85A98](*(_QWORD *)&target_task, address, size);
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return MEMORY[0x1E0C85B60](msg);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x1E0C85B98](__str, __size, __format, a4);
}

void xpc_connection_activate(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F50](connection);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F68](connection);
}

xpc_connection_t xpc_connection_create(const char *name, dispatch_queue_t targetq)
{
  return (xpc_connection_t)MEMORY[0x1E0C85F90](name, targetq);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1E0C85FB0](name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x1E0C85FD0]();
}

void *__cdecl xpc_connection_get_context(xpc_connection_t connection)
{
  return (void *)MEMORY[0x1E0C85FE0](connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x1E0C86030](connection, message);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  MEMORY[0x1E0C86038](connection, message, replyq, handler);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1E0C86048](connection, message);
}

void xpc_connection_set_context(xpc_connection_t connection, void *context)
{
  MEMORY[0x1E0C86070](connection, context);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x1E0C86080](connection, handler);
}

void xpc_connection_set_finalizer_f(xpc_connection_t connection, xpc_finalizer_t finalizer)
{
  MEMORY[0x1E0C86088](connection, finalizer);
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
  MEMORY[0x1E0C860C8](connection, targetq);
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x1E0C86108](object);
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x1E0C86178](bytes, length);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x1E0C86198](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x1E0C861A8](xdata);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1E0C86228](original);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C86260](xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1E0C86278](xdict, key, length);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862A0](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862D0](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C862E0](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x1E0C86310](xdict, key, value);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
  MEMORY[0x1E0C86330](xdict, key, bytes, length);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x1E0C86360](xdict, key, value);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x1E0C86398](xdict, key, value);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x1E0C863B8](xdict, key, value);
}

BOOL xpc_equal(xpc_object_t object1, xpc_object_t object2)
{
  return MEMORY[0x1E0C86420](object1, object2);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

uint64_t xpc_mach_send_copy_right()
{
  return MEMORY[0x1E0C865D8]();
}

uint64_t xpc_mach_send_create()
{
  return MEMORY[0x1E0C865E0]();
}

xpc_object_t xpc_null_create(void)
{
  return (xpc_object_t)MEMORY[0x1E0C86628]();
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x1E0C86658](object);
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1E0C86660](object);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1E0C86720](string);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1E0C86758](xstring);
}

