@implementation _FBSMISInterfaceWrapperImpl

- (int)validateSignatureForPath:(id)a3 options:(id)a4 userInfo:(id *)a5
{
  int v6;
  id v8;

  v8 = 0;
  v6 = soft_MISValidateSignatureAndCopyInfo((uint64_t)a3, (uint64_t)a4, (uint64_t)&v8);
  if (a5)
  {
    *a5 = v8;
  }
  else if (v8)
  {
    CFRelease(v8);
  }
  return v6;
}

- (int)signatureVersion:(id)a3 version:(unsigned int *)a4
{
  id v5;
  int v6;
  unsigned int v7;
  void *v9;

  v5 = a3;
  v9 = 0;
  v6 = soft_MISValidationCopySignatureVersion((uint64_t)v5, (uint64_t)&v9);
  v7 = v9;
  if (v9)
    v7 = objc_msgSend(v9, "unsignedIntValue");
  if (a4)
    *a4 = v7;
  fbs_release((const void **)&v9);

  return v6;
}

@end
