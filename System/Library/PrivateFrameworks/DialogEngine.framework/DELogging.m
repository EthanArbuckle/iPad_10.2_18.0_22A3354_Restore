@implementation DELogging

+ (void)debug:(id)a3
{
  id v3;
  id v4;
  void *__p[2];
  char v6;
  uint64_t *v7;
  uint64_t v8;

  v3 = a3;
  v7 = &v8;
  v4 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v3, &v8));
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v4, "UTF8String"));
  siri::dialogengine::Log::Debug((siri::dialogengine *)__p);
  if (v6 < 0)
    operator delete(__p[0]);

}

+ (void)info:(id)a3
{
  id v3;
  id v4;
  void *__p[2];
  char v6;
  uint64_t *v7;
  uint64_t v8;

  v3 = a3;
  v7 = &v8;
  v4 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v3, &v8));
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v4, "UTF8String"));
  siri::dialogengine::Log::LogWithLevel((uint64_t)__p, 0);
  if (v6 < 0)
    operator delete(__p[0]);

}

+ (void)error:(id)a3
{
  id v3;
  id v4;
  void *__p[2];
  char v6;
  uint64_t *v7;
  uint64_t v8;

  v3 = a3;
  v7 = &v8;
  v4 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v3, &v8));
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v4, "UTF8String"));
  siri::dialogengine::Log::LogWithLevel((uint64_t)__p, 3u);
  if (v6 < 0)
    operator delete(__p[0]);

}

@end
