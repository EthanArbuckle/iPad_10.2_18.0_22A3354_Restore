@implementation InterAppAudioGroup

- (id)getApps:(float)a3
{
  NSMutableArray *v4;
  uint64_t v5;
  _QWORD *v6;
  InterAppAudioAppInfo *v7;
  InterAppAudioAppInfo *v8;
  InterAppAudioAppInfo *v9;
  uint64_t v10;
  int v11;
  const __CFUUID *v12;
  CFStringRef v13;
  CFStringRef v14;
  const __CFString *v15;
  CFURLRef v16;
  __CFString *v17;
  UIImage *Icon;
  __int16 v19;
  unint64_t v20;
  unint64_t v21;
  char *v22;
  char *v23;
  char *v24;
  __int128 v25;
  __int128 v26;
  InterAppAudioAppInfo *v27;
  _QWORD *v28;
  _QWORD *v29;
  BOOL v30;
  InterAppAudioAppInfo *v31;
  int v32;
  mach_port_name_t reply_port;
  mach_msg_return_t v34;
  mach_msg_return_t v35;
  vm_size_t v36;
  const void *v37;
  uint64_t v39;
  NSMutableArray *v40;
  int v41;
  _QWORD *v42;
  InterAppAudioAppInfo v43;
  int v44;
  int msg;
  int msg_4;
  int msg_8;
  mach_port_t msg_12;
  _BYTE msg_16[48];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = CADeprecated::TSingleton<IPCAUClient>::sInstance;
  if (CADeprecated::TSingleton<IPCAUClient>::sInstance)
  {
    v39 = CADeprecated::TSingleton<IPCAUClient>::sInstance;
    v40 = v4;
    v41 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)CADeprecated::TSingleton<IPCAUClient>::sInstance + 16))(CADeprecated::TSingleton<IPCAUClient>::sInstance);
    if (!*(_QWORD *)(v5 + 328) || (v6 = *(_QWORD **)(v5 + 312), v42 = (_QWORD *)(v5 + 320), v6 == (_QWORD *)(v5 + 320)))
    {
      v7 = 0;
      v8 = 0;
    }
    else
    {
      v7 = 0;
      v8 = 0;
      v9 = 0;
      do
      {
        v10 = v6[5];
        v11 = *(_DWORD *)(*(_QWORD *)(v10 + 16) + 52);
        v12 = CFUUIDCreateFromUUIDBytes(0, *(CFUUIDBytes *)(v10 + 56));
        if (v12)
        {
          v13 = CFUUIDCreateString(0, v12);
          v14 = v13;
          if (v13)
          {
            v15 = CFStringCreateWithFormat(0, 0, CFSTR("com-apple-audiounit:%@/%c"), v13, 78);
            if (v15)
            {
              v16 = CFURLCreateWithString(0, v15, 0);
              CFRelease(v15);
            }
            else
            {
              v16 = 0;
            }
            CFRelease(v14);
          }
          else
          {
            v16 = 0;
          }
          CFRelease(v12);
        }
        else
        {
          v16 = 0;
        }
        v17 = *(__CFString **)(*(_QWORD *)(v10 + 16) + 168);
        Icon = AudioComponentGetIcon(*(AudioComponent *)(v10 + 48), a3);
        CFRetain(v17);
        if (v8 >= v9)
        {
          v20 = 0xCCCCCCCCCCCCCCCDLL * (((char *)v8 - (char *)v7) >> 3) + 1;
          if (v20 > 0x666666666666666)
            std::vector<float>::__throw_length_error[abi:ne180100]();
          if (0x999999999999999ALL * (((char *)v9 - (char *)v7) >> 3) > v20)
            v20 = 0x999999999999999ALL * (((char *)v9 - (char *)v7) >> 3);
          if (0xCCCCCCCCCCCCCCCDLL * (((char *)v9 - (char *)v7) >> 3) >= 0x333333333333333)
            v21 = 0x666666666666666;
          else
            v21 = v20;
          if (v21)
          {
            if (v21 > 0x666666666666666)
              std::__throw_bad_array_new_length[abi:ne180100]();
            v22 = (char *)operator new(40 * v21);
          }
          else
          {
            v22 = 0;
          }
          v23 = &v22[8 * (((char *)v8 - (char *)v7) >> 3)];
          *v23 = 0;
          *((_DWORD *)v23 + 1) = v11;
          *((_QWORD *)v23 + 1) = Icon;
          *((_QWORD *)v23 + 2) = v17;
          *((_QWORD *)v23 + 3) = 0;
          *((_QWORD *)v23 + 4) = v16;
          if (v8 == v7)
          {
            v27 = (InterAppAudioAppInfo *)&v22[8 * (((char *)v8 - (char *)v7) >> 3)];
          }
          else
          {
            v24 = &v22[8 * (((char *)v8 - (char *)v7) >> 3)];
            do
            {
              v25 = *(_OWORD *)&v8[-1].var0;
              v26 = *(_OWORD *)&v8[-1].var3;
              v27 = (InterAppAudioAppInfo *)(v24 - 40);
              *((_QWORD *)v24 - 1) = v8[-1].var5;
              *(_OWORD *)(v24 - 24) = v26;
              *(_OWORD *)(v24 - 40) = v25;
              --v8;
              v24 -= 40;
            }
            while (v8 != v7);
          }
          v9 = (InterAppAudioAppInfo *)&v22[40 * v21];
          v8 = (InterAppAudioAppInfo *)(v23 + 40);
          if (v7)
            operator delete(v7);
          v7 = v27;
        }
        else
        {
          v8->var0 = 0;
          v19 = msg;
          *(&v8->var0 + 3) = BYTE2(msg);
          *(_WORD *)(&v8->var0 + 1) = v19;
          v8->var1 = v11;
          v8->var2 = (ObjCImage *)Icon;
          v8->var3 = v17;
          v8->var4 = 0;
          v8->var5 = v16;
          ++v8;
        }
        v28 = (_QWORD *)v6[1];
        if (v28)
        {
          do
          {
            v29 = v28;
            v28 = (_QWORD *)*v28;
          }
          while (v28);
        }
        else
        {
          do
          {
            v29 = (_QWORD *)v6[2];
            v30 = *v29 == (_QWORD)v6;
            v6 = v29;
          }
          while (!v30);
        }
        v6 = v29;
      }
      while (v29 != v42);
    }
    if (v41)
      (*(void (**)(uint64_t))(*(_QWORD *)v39 + 24))(v39);
    v4 = v40;
    if (v7 != v8)
    {
      v31 = v7;
      do
        AddApp(v31++, a3, v40);
      while (v31 != v8);
    }
    if (v7)
      operator delete(v7);
  }
  if (CADeprecated::TSingleton<AURegistrationServerConnection>::sInstance)
  {
    v32 = *(_DWORD *)(CADeprecated::TSingleton<AURegistrationServerConnection>::sInstance + 48);
    memset(&msg_16[4], 0, 44);
    msg_4 = 0;
    reply_port = mig_get_reply_port();
    msg_8 = v32;
    msg_12 = reply_port;
    msg = 5395;
    *(_QWORD *)msg_16 = 0x15F9E00000000;
    if (MEMORY[0x1E0C85B60])
    {
      voucher_mach_msg_set((mach_msg_header_t *)&msg);
      reply_port = msg_12;
    }
    v34 = mach_msg((mach_msg_header_t *)&msg, 275, 0x18u, 0x40u, reply_port, gMediaServerTimeout, 0);
    v35 = v34;
    if ((v34 - 268435458) <= 0xE && ((1 << (v34 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(msg_12);
    }
    else
    {
      if (!v34)
      {
        if (*(_DWORD *)&msg_16[4] != 90114
          || (msg & 0x80000000) == 0
          || *(_DWORD *)&msg_16[8] != 1
          || msg_4 != 56
          || msg_8
          || msg_16[23] != 1
          || (v36 = *(unsigned int *)&msg_16[24], *(_DWORD *)&msg_16[24] != *(_DWORD *)&msg_16[36]))
        {
LABEL_68:
          mach_msg_destroy((mach_msg_header_t *)&msg);
          return v4;
        }
        v37 = *(const void **)&msg_16[12];
        goto LABEL_71;
      }
      mig_dealloc_reply_port(msg_12);
    }
    if (v35 == 268435460)
    {
      if ((msg & 0x1F00) == 0x1100)
        mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg_12);
      goto LABEL_68;
    }
    if (v35)
      return v4;
    v37 = 0;
    v36 = 0;
LABEL_71:
    CADeserializer::CADeserializer((CADeserializer *)&msg, v37);
    while (*(_QWORD *)&msg_16[8] != *(_QWORD *)msg_16)
    {
      v44 = 0;
      CADeserializer::Read((CADeserializer *)&msg, &v44);
      v43.var0 = v44 != 0;
      CADeserializer::Read((CADeserializer *)&msg, &v43.var1);
      v43.var2 = 0;
      operator>>();
      operator>>();
      operator>>();
      AddApp(&v43, a3, v4);
    }
    mig_deallocate((vm_address_t)v37, v36);
    MEMORY[0x193FFD95C](&msg);
  }
  return v4;
}

+ (id)sharedInstance
{
  if (gInterAppAudioGroupOnce != -1)
    dispatch_once(&gInterAppAudioGroupOnce, &__block_literal_global_1331);
  return (id)gInterAppAudioGroup;
}

InterAppAudioGroup *__36__InterAppAudioGroup_sharedInstance__block_invoke()
{
  InterAppAudioGroup *result;

  result = objc_alloc_init(InterAppAudioGroup);
  gInterAppAudioGroup = (uint64_t)result;
  return result;
}

@end
