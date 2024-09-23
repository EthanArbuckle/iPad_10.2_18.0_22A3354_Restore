@implementation ULConfigurationMO

+ (id)createFromEntry:(const void *)a3 inManagedObjectContext:(id)a4
{
  id v5;
  ULConfigurationMO *v6;
  char *v7;
  void *v8;
  void *v9;
  void *v10;
  CLMicroLocationProto::Configuration *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  char *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  ULConfigurationMO *v21;
  NSObject *v22;
  uint8_t v24[16];
  uint8_t buf[16];
  char v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = -[ULConfigurationMO initWithContext:]([ULConfigurationMO alloc], "initWithContext:", v5);
  -[ULConfigurationMO setGenerationTimestamp:](v6, "setGenerationTimestamp:", *(double *)a3);
  if (*((char *)a3 + 31) >= 0)
    v7 = (char *)a3 + 8;
  else
    v7 = (char *)*((_QWORD *)a3 + 1);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULConfigurationMO setLoiType:](v6, "setLoiType:", v8);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", (char *)a3 + 32);
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULConfigurationMO setLoiId:](v6, "setLoiId:", v10);

  v11 = (CLMicroLocationProto::Configuration *)-[ULConfigurationMO setConfigurationType:](v6, "setConfigurationType:", *((unsigned int *)a3 + 12));
  if (*((_DWORD *)a3 + 12) == 2)
  {
    v12 = *((_QWORD *)a3 + 11);
    if (!v12)
      v12 = *(_QWORD *)(CLMicroLocationProto::Configuration::default_instance(v11) + 32);
    CLMicroLocationProtobufHelper::uuidFromProtobuf(*(uint64_t ***)(v12 + 16), buf);
    if (v26)
    {
      v13 = objc_alloc(MEMORY[0x24BDD1880]);
      if (!v26)
        std::__throw_bad_optional_access[abi:ne180100]();
      v14 = (void *)objc_msgSend(v13, "initWithUUIDBytes:", buf);
      objc_msgSend(v14, "UUIDString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[ULConfigurationMO setAnchorStatsModelUUID:](v6, "setAnchorStatsModelUUID:", v15);

    }
    else
    {
      if (onceToken_MicroLocation_Default != -1)
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_38);
      v16 = logObject_MicroLocation_Default;
      if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v24 = 0;
        _os_log_impl(&dword_2419D9000, v16, OS_LOG_TYPE_ERROR, "createFromEntry: Failed to get modelUUID for anchor value statistics configuration", v24, 2u);
      }
    }
  }
  v17 = (char *)a3 + 56;
  v18 = CLMicroLocationProto::Configuration::ByteSize((CLMicroLocationProto::Configuration *)((char *)a3 + 56));
  v19 = (void *)operator new[]();
  bzero(v19, (int)v18);
  if ((MEMORY[0x2426A0204](v17, v19, v18) & 1) != 0)
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", v19, (int)v18);
    -[ULConfigurationMO setConfiguration:](v6, "setConfiguration:", v20);

    v21 = v6;
  }
  else
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_38);
    v22 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2419D9000, v22, OS_LOG_TYPE_ERROR, "createFromEntry: Failed to serialize configuration protobuf to byte stream", buf, 2u);
    }
    v21 = 0;
  }
  MEMORY[0x2426A04BC](v19, 0x1000C8077774924);

  return v21;
}

- (optional<CLMicroLocationConfigurationTable::Entry>)convertToEntry
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  optional<CLMicroLocationConfigurationTable::Entry> *result;
  std::string v13;
  _BYTE v14[56];
  std::string v15;
  void *__p[2];
  char v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  -[ULConfigurationMO loiType](self, "loiType", a4);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(&v15, (char *)objc_msgSend(v6, "UTF8String"));

  -[ULConfigurationMO loiId](self, "loiId");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v7, "UTF8String"));
  CLMicroLocationProtobufHelper::uuidFromStdString((uint64_t)__p, (uint64_t)&v20);
  if (v17 < 0)
    operator delete(__p[0]);

  if (!v22)
  {
    v20 = 0;
    v21 = 0;
    v22 = 1;
  }
  -[ULConfigurationMO configuration](self, "configuration", CLMicroLocationProto::Configuration::Configuration((CLMicroLocationProto::Configuration *)v14));
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = objc_msgSend(v8, "bytes");
  -[ULConfigurationMO configuration](self, "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "length");
  LOBYTE(v9) = wireless_diagnostics::google::protobuf::MessageLite::ParseFromArray((wireless_diagnostics::google::protobuf::MessageLite *)v14, (const void *)v9);

  if ((v9 & 1) != 0)
  {
    if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0)
      std::string::__init_copy_ctor_external(&v13, v15.__r_.__value_.__l.__data_, v15.__r_.__value_.__l.__size_);
    else
      v13 = v15;
    if (!v22)
      std::__throw_bad_optional_access[abi:ne180100]();
    CLMicroLocationConfigurationTable::Entry::Entry(__p, &v13, v14, v20, v21);
    if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v13.__r_.__value_.__l.__data_);
    std::__optional_destruct_base<CLMicroLocationConfigurationTable::Entry,false>::__optional_destruct_base[abi:ne180100]<CLMicroLocationConfigurationTable::Entry>((uint64_t)retstr, (uint64_t)__p);
    CLMicroLocationProto::Configuration::~Configuration((CLMicroLocationProto::Configuration *)&v19);
    if (v18 < 0)
      operator delete(__p[1]);
  }
  else
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_38);
    v11 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      LOWORD(__p[0]) = 0;
      _os_log_impl(&dword_2419D9000, v11, OS_LOG_TYPE_ERROR, "convertToEntry: Failed to deserialize configuration protobuf from byte stream", (uint8_t *)__p, 2u);
    }
    retstr->var0.var0 = 0;
    retstr[2].var0.var2.var0.var0.var0.var0.var0[16] = 0;
  }
  CLMicroLocationProto::Configuration::~Configuration((CLMicroLocationProto::Configuration *)v14);
  if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v15.__r_.__value_.__l.__data_);
  return result;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("ULConfigurationMO"));
}

@end
