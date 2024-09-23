@implementation SecTrustCopyCustomAnchorCertificates

CFArrayRef __SecTrustCopyCustomAnchorCertificates_block_invoke(CFArrayRef result)
{
  const __CFArray *v1;
  CFArrayRef v2;

  v1 = *(const __CFArray **)(*((_QWORD *)result + 5) + 24);
  if (v1)
  {
    v2 = result;
    result = CFArrayCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v1);
    *(_QWORD *)(*(_QWORD *)(*((_QWORD *)v2 + 4) + 8) + 24) = result;
  }
  return result;
}

@end
