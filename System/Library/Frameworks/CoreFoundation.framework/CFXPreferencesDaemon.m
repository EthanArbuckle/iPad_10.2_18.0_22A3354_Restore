@implementation CFXPreferencesDaemon

void ____CFXPreferencesDaemon_main_block_invoke()
{
  unsigned int v0;

  do
    v0 = __ldxr(terminating);
  while (__stxr(v0 + 1, terminating));
  _CFPrefsSynchronizeForDaemonTermination();
  exit(0);
}

void ____CFXPreferencesDaemon_main_block_invoke_2()
{
  -[CFPrefsDaemon withSnapshotOfSourcesForDomainIdentifier:performBlock:](cfprefsd, 0, (uint64_t)&__block_literal_global_139);
}

void ____CFXPreferencesDaemon_main_block_invoke_3(uint64_t a1, void **a2, uint64_t a3)
{
  CFMutableSetRef Mutable;
  const __CFString *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  CFAbsoluteTime Current;
  const __CFString *v11;
  const __CFURL *v12;
  CFIndex Length;
  CFIndex v14;
  char *v15;
  size_t v16;
  _QWORD v17[8];

  v17[7] = *MEMORY[0x1E0C80C00];
  Mutable = CFSetCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeSetCallBacks);
  v6 = CFStringCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0);
  if (a3)
  {
    v7 = MEMORY[0x1E0C809B0];
    do
    {
      v8 = *a2++;
      v17[0] = v7;
      v17[1] = 3221225472;
      v17[2] = __dumpDebugInfoCallback_block_invoke;
      v17[3] = &unk_1E1336DB0;
      v17[4] = v8;
      v17[5] = v6;
      v17[6] = Mutable;
      objc_msgSend(v8, "lockedSync:", v17);
      --a3;
    }
    while (a3);
  }
  CFRelease(Mutable);
  v9 = getpid();
  Current = CFAbsoluteTimeGetCurrent();
  v11 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("/tmp/cfprefsddump(%d:%f).txt"), v9, *(_QWORD *)&Current);
  v12 = CFURLCreateWithFileSystemPath((CFAllocatorRef)&__kCFAllocatorSystemDefault, v11, kCFURLPOSIXPathStyle, 0);
  Length = CFStringGetLength(v6);
  v14 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
  v15 = (char *)malloc_type_calloc(v14, 1uLL, 0x100004077774924uLL);
  CFStringGetCString(v6, v15, v14, 0x8000100u);
  v16 = strlen(v15);
  _CFWriteBytesToFile(v12, v15, v16);
  CFRelease(v6);
  CFRelease(v12);
  CFRelease(v11);
  free(v15);
}

@end
