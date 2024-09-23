@implementation ULRapportMO

+ (id)createFromEntry:(const void *)a3 inManagedObjectContext:(id)a4
{
  id v5;
  ULRapportMO *v6;
  char *v7;
  void *v8;
  void *v9;
  void *v10;
  char *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  ULRapportMO *v15;
  NSObject *v16;
  uint8_t v18[16];

  v5 = a4;
  v6 = -[ULRapportMO initWithContext:]([ULRapportMO alloc], "initWithContext:", v5);
  -[ULRapportMO setGenerationTimestamp:](v6, "setGenerationTimestamp:", *(double *)a3);
  if (*((char *)a3 + 31) >= 0)
    v7 = (char *)a3 + 8;
  else
    v7 = (char *)*((_QWORD *)a3 + 1);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULRapportMO setLoiType:](v6, "setLoiType:", v8);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", (char *)a3 + 64);
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULRapportMO setLoiId:](v6, "setLoiId:", v10);

  v11 = (char *)a3 + 32;
  v12 = CLMicroLocationProto::RapportDevice::ByteSize((CLMicroLocationProto::RapportDevice *)((char *)a3 + 32));
  v13 = (void *)operator new[]();
  bzero(v13, (int)v12);
  if ((MEMORY[0x2426A0204](v11, v13, v12) & 1) != 0)
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", v13, (int)v12);
    -[ULRapportMO setDevice:](v6, "setDevice:", v14);

    v15 = v6;
  }
  else
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_22);
    v16 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_2419D9000, v16, OS_LOG_TYPE_ERROR, "createFromEntry: Failed to serialize rapport device protobuf to byte stream", v18, 2u);
    }
    v15 = 0;
  }
  MEMORY[0x2426A04BC](v13, 0x1000C8077774924);

  return v15;
}

- (optional<CLMicroLocationRapportTable::Entry>)convertToEntry
{
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  optional<CLMicroLocationRapportTable::Entry> *result;
  std::string v13;
  _QWORD v14[4];
  std::string v15;
  uint64_t v16;
  void *__p[2];
  char v18;
  char v19;
  uint64_t v20;
  _QWORD v21[2];
  char v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  -[ULRapportMO generationTimestamp](self, "generationTimestamp", *(_QWORD *)&a3.var0[8]);
  v16 = v5;
  -[ULRapportMO loiType](self, "loiType");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(&v15, (char *)objc_msgSend(v6, "UTF8String"));

  -[ULRapportMO loiId](self, "loiId");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v7, "UTF8String"));
  CLMicroLocationProtobufHelper::uuidFromStdString((uint64_t)__p, (uint64_t)v21);
  if (v18 < 0)
    operator delete(__p[0]);

  if (!v22)
  {
    v21[0] = 0;
    v21[1] = 0;
    v22 = 1;
  }
  CLMicroLocationProto::RapportDevice::RapportDevice(v14);
  -[ULRapportMO device](self, "device");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = objc_msgSend(v8, "bytes");
  -[ULRapportMO device](self, "device");
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
    CLMicroLocationRapportTable::Entry::Entry(__p, &v13, v14, v21, &v16);
    if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v13.__r_.__value_.__l.__data_);
    std::__optional_destruct_base<CLMicroLocationRapportTable::Entry,false>::__optional_destruct_base[abi:ne180100]<CLMicroLocationRapportTable::Entry>((uint64_t)retstr, (uint64_t)__p);
    CLMicroLocationProto::RapportDevice::~RapportDevice((CLMicroLocationProto::RapportDevice *)&v20);
    if (v19 < 0)
      operator delete(__p[1]);
  }
  else
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_22);
    v11 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      LOWORD(__p[0]) = 0;
      _os_log_impl(&dword_2419D9000, v11, OS_LOG_TYPE_ERROR, "convertToEntry: Failed to deserialize rapport device protobuf from byte stream", (uint8_t *)__p, 2u);
    }
    retstr->var0.var0 = 0;
    LOBYTE(retstr[1].var0.var2.var0.var1.var0[1]) = 0;
  }
  CLMicroLocationProto::RapportDevice::~RapportDevice((CLMicroLocationProto::RapportDevice *)v14);
  if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v15.__r_.__value_.__l.__data_);
  return result;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("ULRapportMO"));
}

@end
