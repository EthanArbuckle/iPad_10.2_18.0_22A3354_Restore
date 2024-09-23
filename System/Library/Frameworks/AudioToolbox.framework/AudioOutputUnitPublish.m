@implementation AudioOutputUnitPublish

uint64_t __AudioOutputUnitPublish_Impl_block_invoke(uint64_t a1)
{
  uint64_t v2;
  _DWORD *v3;
  int v4;
  uint64_t v5;
  unsigned int v6;
  BOOL v7;
  int v8;
  uint64_t v10;
  __CFBundle *MainBundle;
  __CFBundle *v12;
  CFTypeRef ValueForInfoDictionaryKey;
  int v14;
  int v15;
  unsigned int v16;
  int Length;
  const UInt8 *BytePtr;
  mach_port_t reply_port;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  const char *v23;
  uint64_t v24;
  pid_t v25;
  const void *v26;
  CFStringRef v27;
  __int128 v28;
  unint64_t v29;
  uint64_t *v30;
  _QWORD *v31;
  NSObject *v32;
  _QWORD *v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char *v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v42;
  __int128 v43;
  int v44;
  CFDataRef theData;
  CFTypeRef v46;
  CFStringRef Identifier;
  const void *v48;
  _DWORD msg[10];
  const UInt8 *v50;
  int v51;
  int v52;
  uint64_t v53;
  __int128 v54;
  int v55;
  int v56;
  int v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v2 = CADeprecated::TSingleton<IPCAUServer>::instance();
  v3 = *(_DWORD **)(a1 + 32);
  v4 = *(_DWORD *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 48);
  v48 = *(const void **)(a1 + 40);
  v6 = *v3 - 1635086951;
  v7 = v6 > 0x11;
  v8 = (1 << v6) & 0x20045;
  if (v7 || v8 == 0)
    return 4294900545;
  v10 = v2;
  v42 = v5;
  MainBundle = CFBundleGetMainBundle();
  Identifier = 0;
  if (!MainBundle)
  {
    v46 = 0;
LABEL_37:
    if (kLocalInterAppAudioScope)
    {
      v22 = *(NSObject **)kLocalInterAppAudioScope;
      if (!*(_QWORD *)kLocalInterAppAudioScope)
        return 4294967246;
    }
    else
    {
      v22 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      msg[0] = 136315394;
      *(_QWORD *)&msg[1] = "IPCAUServer.cpp";
      LOWORD(msg[3]) = 1024;
      *(_DWORD *)((char *)&msg[3] + 2) = 238;
      v23 = "%25s:%-5d IPCAUServer: main bundle ID is nil";
LABEL_44:
      _os_log_impl(&dword_210A23000, v22, OS_LOG_TYPE_ERROR, v23, (uint8_t *)msg, 0x12u);
    }
    return 4294967246;
  }
  v12 = MainBundle;
  Identifier = CFBundleGetIdentifier(MainBundle);
  ValueForInfoDictionaryKey = CFBundleGetValueForInfoDictionaryKey(v12, (CFStringRef)*MEMORY[0x24BDBD1D0]);
  v46 = ValueForInfoDictionaryKey;
  if (!Identifier)
    goto LABEL_37;
  if (!ValueForInfoDictionaryKey)
  {
    if (kLocalInterAppAudioScope)
    {
      v22 = *(NSObject **)kLocalInterAppAudioScope;
      if (!*(_QWORD *)kLocalInterAppAudioScope)
        return 4294967246;
    }
    else
    {
      v22 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      msg[0] = 136315394;
      *(_QWORD *)&msg[1] = "IPCAUServer.cpp";
      LOWORD(msg[3]) = 1024;
      *(_DWORD *)((char *)&msg[3] + 2) = 242;
      v23 = "%25s:%-5d IPCAUServer: bundle display name is nil";
      goto LABEL_44;
    }
    return 4294967246;
  }
  CASerializer::CASerializer((CASerializer *)&theData, 0);
  operator<<();
  operator<<();
  operator<<();
  v14 = 5;
  while (1)
  {
    v15 = AURegistrationServerConnection_ServerPort();
    v16 = atomic_load(*(unsigned int **)(v10 + 40));
    v43 = *(_OWORD *)v3;
    v44 = v3[4];
    Length = (int)theData;
    if (theData)
    {
      BytePtr = CFDataGetBytePtr(theData);
      Length = (int)theData;
      if (theData)
        Length = CFDataGetLength(theData);
    }
    else
    {
      BytePtr = 0;
    }
    memset(&msg[1], 0, 32);
    msg[6] = 2;
    msg[7] = v16;
    msg[9] = 1245184;
    v50 = BytePtr;
    v51 = 16777472;
    v52 = Length;
    v53 = *MEMORY[0x24BDAC470];
    v54 = v43;
    v55 = v44;
    v56 = Length;
    v57 = v4;
    reply_port = mig_get_reply_port();
    msg[2] = v15;
    msg[3] = reply_port;
    msg[0] = -2147478253;
    *(_QWORD *)&msg[4] = 0x15F9200000000;
    if (MEMORY[0x24BDB0418])
    {
      voucher_mach_msg_set((mach_msg_header_t *)msg);
      reply_port = msg[3];
    }
    v20 = mach_msg((mach_msg_header_t *)msg, 275, 0x5Cu, 0x2Cu, reply_port, *MEMORY[0x24BDB6D08], 0);
    v21 = v20;
    if ((v20 - 268435458) <= 0xE && ((1 << (v20 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(msg[3]);
    }
    else
    {
      if (!(_DWORD)v20)
      {
        if (msg[5] == 71)
        {
          v21 = 4294966988;
        }
        else if (msg[5] == 90102)
        {
          v21 = 4294966996;
          if ((msg[0] & 0x80000000) == 0 && msg[1] == 36 && !msg[2])
          {
            v21 = msg[8];
            if (!msg[8])
              goto LABEL_47;
          }
        }
        else
        {
          v21 = 4294966995;
        }
        goto LABEL_32;
      }
      mig_dealloc_reply_port(msg[3]);
    }
    if ((_DWORD)v21 != 268435460)
      goto LABEL_33;
    v21 = 268435460;
    if ((msg[0] & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x24BDAEC58], msg[3]);
LABEL_32:
    mach_msg_destroy((mach_msg_header_t *)msg);
LABEL_33:
    if ((_DWORD)v21 != 268435459)
      break;
    sleep(1u);
    AURegistrationServerConnection_Connect();
    if (!--v14)
    {
      v21 = 268435459;
      goto LABEL_49;
    }
  }
  if (!(_DWORD)v21)
  {
LABEL_47:
    v24 = operator new();
    v25 = getpid();
    v27 = Identifier;
    v26 = v48;
    *(_QWORD *)v24 = &off_24CA8B1F8;
    *(_DWORD *)(v24 + 8) = v25;
    *(_QWORD *)(v24 + 16) = v27;
    LODWORD(v27) = v3[4];
    *(_OWORD *)(v24 + 24) = *(_OWORD *)v3;
    *(_DWORD *)(v24 + 40) = (_DWORD)v27;
    *(_QWORD *)(v24 + 48) = v26;
    *(_DWORD *)(v24 + 56) = v4;
    CFRetain(v26);
    CFRetain(*(CFTypeRef *)(v24 + 16));
    *(_QWORD *)v24 = &off_24CA8F170;
    *(_QWORD *)(v24 + 64) = 0;
    *(_QWORD *)(v24 + 72) = 0;
    v28 = *(_OWORD *)v3;
    *(_DWORD *)(v24 + 96) = v3[4];
    *(_OWORD *)(v24 + 80) = v28;
    *(_QWORD *)(v24 + 104) = v42;
    *(_DWORD *)(v24 + 112) = 0;
    v30 = *(uint64_t **)(v10 + 248);
    v29 = *(_QWORD *)(v10 + 256);
    if ((unint64_t)v30 >= v29)
    {
      v33 = *(_QWORD **)(v10 + 240);
      v34 = v30 - v33;
      v35 = v34 + 1;
      if ((unint64_t)(v34 + 1) >> 61)
        std::vector<void const*>::__throw_length_error[abi:ne180100]();
      v36 = v29 - (_QWORD)v33;
      if (v36 >> 2 > v35)
        v35 = v36 >> 2;
      if ((unint64_t)v36 >= 0x7FFFFFFFFFFFFFF8)
        v37 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v37 = v35;
      if (v37)
      {
        if (v37 >> 61)
          std::__throw_bad_array_new_length[abi:ne180100]();
        v38 = (char *)operator new(8 * v37);
      }
      else
      {
        v38 = 0;
      }
      v39 = (uint64_t *)&v38[8 * v34];
      *v39 = v24;
      v31 = v39 + 1;
      if (v30 != v33)
      {
        do
        {
          v40 = *--v30;
          *--v39 = v40;
        }
        while (v30 != v33);
        v30 = *(uint64_t **)(v10 + 240);
      }
      *(_QWORD *)(v10 + 240) = v39;
      *(_QWORD *)(v10 + 248) = v31;
      *(_QWORD *)(v10 + 256) = &v38[8 * v37];
      if (v30)
        operator delete(v30);
    }
    else
    {
      *v30 = v24;
      v31 = v30 + 1;
    }
    v21 = 0;
    *(_QWORD *)(v10 + 248) = v31;
    goto LABEL_77;
  }
LABEL_49:
  if (kLocalInterAppAudioScope)
  {
    v32 = *(NSObject **)kLocalInterAppAudioScope;
    if (!*(_QWORD *)kLocalInterAppAudioScope)
      goto LABEL_77;
  }
  else
  {
    v32 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
  {
    msg[0] = 136315650;
    *(_QWORD *)&msg[1] = "IPCAUServer.cpp";
    LOWORD(msg[3]) = 1024;
    *(_DWORD *)((char *)&msg[3] + 2) = 264;
    HIWORD(msg[4]) = 1024;
    msg[5] = v21;
    _os_log_impl(&dword_210A23000, v32, OS_LOG_TYPE_ERROR, "%25s:%-5d error %d from registration server", (uint8_t *)msg, 0x18u);
  }
LABEL_77:
  MEMORY[0x212BCD6E0](&theData);
  return v21;
}

@end
