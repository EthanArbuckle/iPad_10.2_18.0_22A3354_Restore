@implementation ZN18OSStateDumpManager17registerSubsystemE27CACentralStateDumpSubsystemPK10

void *___ZN18OSStateDumpManager17registerSubsystemE27CACentralStateDumpSubsystemPK10__CFStringU13block_pointerFvP7__sFILEE_block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  tm *v4;
  FILE *v5;
  CFIndex v6;
  const __CFAllocator *v7;
  CFStringRef v8;
  const __CFData *Data;
  unsigned int Length;
  PlatformUtilities *v11;
  tm *v12;
  FILE *v13;
  time_t tv_sec;
  char v16;
  timeval v17;
  FILE *v18;
  void *v19;
  CFIndex numBytes;
  uint64_t v21;
  char __str[20];
  tm v23;
  uint64_t v24;
  CFRange v25;

  v24 = *MEMORY[0x1E0C80C00];
  if (*(_DWORD *)(a2 + 16) != 3)
    return 0;
  v19 = 0;
  numBytes = 0;
  v21 = 0;
  v3 = funopen(&v18, 0, (int (__cdecl *)(void *, const char *, int))CAMemoryStream::Write, 0, 0);
  v18 = (FILE *)v3;
  if (v3)
  {
    gettimeofday(&v17, 0);
    tv_sec = v17.tv_sec;
    localtime_r(&tv_sec, &v23);
    snprintf(__str, 0x14uLL, "%02d:%02d:%02d.%03d", v23.tm_hour, v23.tm_min, v23.tm_sec, v17.tv_usec);
    fwrite("\n------------------------------------------------------------\n", 0x3EuLL, 1uLL, (FILE *)v3);
    OS::CF::String::AsStdString((std::string *)&v23, a1 + 40);
    if (v23.tm_year >= 0)
      v4 = &v23;
    else
      v4 = *(tm **)&v23.tm_sec;
    fprintf((FILE *)v3, "%s %s\n", __str, (const char *)v4);
    if (SHIBYTE(v23.tm_year) < 0)
      operator delete(*(void **)&v23.tm_sec);
    fwrite("------------------------------------------------------------\n", 0x3DuLL, 1uLL, (FILE *)v3);
    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) + 16))();
    v5 = CAMemoryStream::cstr(&v18);
    v6 = numBytes;
    v19 = 0;
    numBytes = 0;
    v21 = 0;
    v7 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v8 = CFStringCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const UInt8 *)v5, v6, 0x600u, 0, 0);
    v17.tv_sec = (__darwin_time_t)&off_1E290A0D8;
    *(_QWORD *)&v17.tv_usec = v8;
    if (v8)
    {
      Data = CFPropertyListCreateData(v7, v8, kCFPropertyListBinaryFormat_v1_0, 0, 0);
      tv_sec = (time_t)Data;
      v16 = 1;
      if (Data)
      {
        Length = CFDataGetLength(Data);
        v3 = malloc_type_calloc(1uLL, Length + 200, 0x52A8AD7DuLL);
        if (v3)
        {
          v11 = (PlatformUtilities *)getpid();
          PlatformUtilities::processName(v11);
          if (v23.tm_year >= 0)
            v12 = &v23;
          else
            v12 = *(tm **)&v23.tm_sec;
          snprintf((char *)v3 + 136, 0x40uLL, "CACentralStateDump (process: %s)", (const char *)v12);
          if (SHIBYTE(v23.tm_year) < 0)
            operator delete(*(void **)&v23.tm_sec);
          *(_DWORD *)v3 = 1;
          v25.length = CFDataGetLength((CFDataRef)tv_sec);
          v25.location = 0;
          CFDataGetBytes((CFDataRef)tv_sec, v25, (UInt8 *)v3 + 200);
          *((_DWORD *)v3 + 1) = CFDataGetLength((CFDataRef)tv_sec);
        }
      }
      else
      {
        v3 = 0;
      }
      CACFData::~CACFData((CACFData *)&tv_sec);
    }
    else
    {
      v3 = 0;
    }
    OS::CF::UntypedObject::~UntypedObject((OS::CF::UntypedObject *)&v17);
    v13 = v18;
  }
  else
  {
    v13 = 0;
  }
  fclose(v13);
  free(v19);
  return v3;
}

@end
