@implementation Internal_ADS_Management_Kernel

+ (void)DisconnectAllDevices
{
}

+ (unsigned)ConnectDevice:(id)a3 error:(id *)a4
{
  _anonymous_namespace_ *v5;
  _anonymous_namespace_ *v6;
  _anonymous_namespace_ *v7;
  unint64_t v8;
  char v9;
  char v10;
  unint64_t v11;
  CFTypeRef cf;

  v5 = (_anonymous_namespace_ *)a3;
  v6 = v5;
  v7 = v6;
  if (v6)
    CFRetain(v6);
  applesauce::CF::DictionaryRef::DictionaryRef((applesauce::CF::DictionaryRef *)&cf, v7);

  v10 = v9;
  if (cf)
    CFRelease(cf);
  if ((_DWORD)v8)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("InCider"), (int)v8, 0);
    LODWORD(v11) = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v10)
      std::__throw_bad_optional_access[abi:ne180100]();
    v11 = HIDWORD(v8);
  }

  return v11;
}

+ (void)DisconnectDeviceByAudioObjectID:(unsigned int)a3 error:(id *)a4
{
  int v6;

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("InCider"), v6, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
}

+ (void)DisconnectDeviceByUID:(id)a3 error:(id *)a4
{
  _anonymous_namespace_ *v5;
  _anonymous_namespace_ *v6;
  int v7;
  int v8;
  void *__p[2];
  char v10;

  v5 = (_anonymous_namespace_ *)a3;
  v6 = objc_retainAutorelease(v5);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)-[_anonymous_namespace_ UTF8String](v6, "UTF8String"));
  v8 = v7;
  if ((v10 & 0x80000000) == 0)
  {
    if (!v7)
      goto LABEL_6;
    goto LABEL_5;
  }
  operator delete(__p[0]);
  if (v8)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("InCider"), v8, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_6:

}

@end
