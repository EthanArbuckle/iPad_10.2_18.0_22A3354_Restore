@implementation CFURLCredentialStorageCopyCredentialsForProtectionSpace

uint64_t __CFURLCredentialStorageCopyCredentialsForProtectionSpace_block_invoke@<X0>(uint64_t a1@<X8>)
{
  _opaque_pthread_t *v2;
  uint64_t result;

  *(CFAbsoluteTime *)a1 = CFAbsoluteTimeGetCurrent();
  v2 = pthread_self();
  *(_DWORD *)(a1 + 8) = pthread_mach_thread_np(v2);
  result = getpid();
  *(_DWORD *)(a1 + 12) = result;
  *(_QWORD *)(a1 + 16) = "CFNetwork.f";
  *(_QWORD *)(a1 + 24) = "CFNetwork";
  *(_QWORD *)(a1 + 32) = 49;
  *(_QWORD *)(a1 + 40) = 0;
  *(_QWORD *)(a1 + 48) = "none";
  return result;
}

@end
