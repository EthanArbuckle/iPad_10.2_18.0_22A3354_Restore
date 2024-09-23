@implementation Audio_Device_Serialization

+ (id)Serialize_All_Devices:(id *)a3
{
  id v4;
  uint64_t *v5;
  uint64_t *i;
  uint64_t *v7;
  void *v8;
  int v10;
  uint64_t *v11;
  uint64_t *v12;
  void **v13;

  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  util::WriteDevicesExceptionSafe((util *)&v10);
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("DeviceSerialization"));
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v11;
  for (i = v12; v5 != i; v5 += 3)
  {
    v7 = v5;
    if (*((char *)v5 + 23) < 0)
      v7 = (uint64_t *)*v5;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v7, 4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v8);

  }
  v13 = (void **)&v11;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v13);
  return v4;
}

@end
