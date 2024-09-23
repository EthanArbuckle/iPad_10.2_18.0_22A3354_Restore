@implementation ULModelMO

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("ULModelMO"));
}

+ (id)createFromEntry:(const void *)a3 inManagedObjectContext:(id)a4
{
  id v5;
  ULModelMO *v6;
  void *v7;
  void *v8;
  int v9;
  char *v10;
  __CFString *v11;
  id v12;
  void *v13;
  __CFString *v14;
  CLMicroLocationClientUtils *v15;
  NSString *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  ULModelMO *v22;
  NSObject *v23;
  uint8_t v25[16];

  v5 = a4;
  v6 = -[ULModelMO initWithContext:]([ULModelMO alloc], "initWithContext:", v5);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", a3);
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULModelMO setModelUUID:](v6, "setModelUUID:", v8);

  -[ULModelMO setGenerationTimestamp:](v6, "setGenerationTimestamp:", *((double *)a3 + 2));
  -[ULModelMO setModelType:](v6, "setModelType:", *((unsigned int *)a3 + 6));
  v9 = *((unsigned __int8 *)a3 + 264);
  if (*((_BYTE *)a3 + 264))
  {
    if (*((char *)a3 + 263) >= 0)
      v10 = (char *)a3 + 240;
    else
      v10 = (char *)*((_QWORD *)a3 + 30);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v10);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = &stru_2511DC120;
  }
  -[ULModelMO setClientId:](v6, "setClientId:", v11);
  if (v9)

  if (*((_BYTE *)a3 + 288))
  {
    v12 = objc_alloc(MEMORY[0x24BDD1880]);
    if (!*((_BYTE *)a3 + 288))
      std::__throw_bad_optional_access[abi:ne180100]();
    v13 = (void *)objc_msgSend(v12, "initWithUUIDBytes:", (char *)a3 + 272);
    objc_msgSend(v13, "UUIDString");
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[ULModelMO setServiceUUID:](v6, "setServiceUUID:", v14);
    goto LABEL_16;
  }
  -[ULModelMO clientId](v6, "clientId");
  v15 = (CLMicroLocationClientUtils *)objc_claimAutoreleasedReturnValue();
  CLMicroLocationClientUtils::getNSServiceUUIDFromClientIdAndServiceUUID(v15, v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v13, "UUIDString");
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = &stru_2511DC120;
  }
  -[ULModelMO setServiceUUID:](v6, "setServiceUUID:", v14);
  if (v13)
LABEL_16:

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", (char *)a3 + 289);
  objc_msgSend(v17, "UUIDString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULModelMO setLoiId:](v6, "setLoiId:", v18);

  v19 = CLMicroLocationProto::Model::ByteSize((CLMicroLocationProto::Model *)((char *)a3 + 32));
  v20 = (void *)operator new[]();
  bzero(v20, (int)v19);
  if ((MEMORY[0x2426A0204]((char *)a3 + 32, v20, v19) & 1) != 0)
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", v20, (int)v19);
    -[ULModelMO setModel:](v6, "setModel:", v21);

    v22 = v6;
  }
  else
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_123);
    v23 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_2419D9000, v23, OS_LOG_TYPE_ERROR, "createFromEntry: Failed to serialize model protobuf to byte stream", v25, 2u);
    }
    v22 = 0;
  }
  MEMORY[0x2426A04BC](v20, 0x1000C8077774924);

  return v22;
}

- (optional<CLMicroLocationModelTable::Entry>)convertToEntry
{
  id v5;
  id v6;
  NSObject *v7;
  double v8;
  double v9;
  void *v10;
  BOOL v11;
  id v12;
  NSObject *v13;
  optional<CLMicroLocationModelTable::Entry> *result;
  void *v15;
  BOOL v16;
  id v17;
  char v18;
  char v19;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  std::string v26;
  char v27;
  void *v28[2];
  uint64_t v29;
  char v30;
  char v31;
  _BYTE v32[15];
  char v33;
  void *__p[2];
  uint64_t v35;
  uint64_t v36;
  void *v37;
  char v38;
  char v39;
  char v40;
  _BYTE v41[15];
  char v42;
  _QWORD v43[2];
  uint64_t v44;
  uint64_t v45;
  char v46;
  _QWORD v47[2];
  char v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  -[ULModelMO modelUUID](self, "modelUUID", *(_QWORD *)&a3.var0[8]);
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v5, "UTF8String"));
  CLMicroLocationProtobufHelper::uuidFromStdString((uint64_t)__p, (uint64_t)v47);
  if (SHIBYTE(v35) < 0)
    operator delete(__p[0]);

  if (v48)
  {
    -[ULModelMO loiId](self, "loiId");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v6, "UTF8String"));
    CLMicroLocationProtobufHelper::uuidFromStdString((uint64_t)__p, (uint64_t)&v44);
    if (SHIBYTE(v35) < 0)
      operator delete(__p[0]);

    if (!v46)
    {
      if (onceToken_MicroLocation_Default != -1)
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_123);
      v7 = logObject_MicroLocation_Default;
      if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
      {
        LOWORD(__p[0]) = 0;
        _os_log_impl(&dword_2419D9000, v7, OS_LOG_TYPE_ERROR, "convertToEntry: model's loiId has no value", (uint8_t *)__p, 2u);
      }
      v44 = 0;
      v45 = 0;
      if (!v46)
        v46 = 1;
    }
    -[ULModelMO generationTimestamp](self, "generationTimestamp");
    v9 = v8;
    LOBYTE(v28[0]) = 0;
    v30 = 0;
    -[ULModelMO clientId](self, "clientId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "length") == 0;

    if (!v11)
    {
      -[ULModelMO clientId](self, "clientId");
      v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v12, "UTF8String"));
      *(_OWORD *)v28 = *(_OWORD *)__p;
      v29 = v35;
      __p[1] = 0;
      v35 = 0;
      __p[0] = 0;
      v30 = 1;

    }
    -[ULModelMO serviceUUID](self, "serviceUUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "length") == 0;

    if (v16)
    {
      v19 = 0;
      v18 = 0;
    }
    else
    {
      -[ULModelMO serviceUUID](self, "serviceUUID");
      v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v17, "UTF8String"));
      CLMicroLocationProtobufHelper::uuidFromStdString((uint64_t)__p, (uint64_t)&v40);
      v18 = v40;
      v43[0] = *(_QWORD *)v41;
      *(_QWORD *)((char *)v43 + 7) = *(_QWORD *)&v41[7];
      v19 = v42;
      if (SHIBYTE(v35) < 0)
        operator delete(__p[0]);

    }
    -[ULModelMO model](self, "model", CLMicroLocationProto::Model::Model((CLMicroLocationProto::Model *)&v40));
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v21 = objc_msgSend(v20, "bytes");
    -[ULModelMO model](self, "model");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "length");
    LOBYTE(v21) = wireless_diagnostics::google::protobuf::MessageLite::ParseFromArray((wireless_diagnostics::google::protobuf::MessageLite *)&v40, (const void *)v21);

    if ((v21 & 1) != 0)
    {
      if (!v48)
        std::__throw_bad_optional_access[abi:ne180100]();
      v23 = v47[0];
      v24 = v47[1];
      std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100](&v26, (__int128 *)v28);
      v31 = v18;
      *(_QWORD *)v32 = v43[0];
      *(_QWORD *)&v32[7] = *(_QWORD *)((char *)v43 + 7);
      v33 = v19;
      if (!v46)
        std::__throw_bad_optional_access[abi:ne180100]();
      CLMicroLocationModelTable::Entry::Entry(__p, v23, v24, &v40, &v26, &v31, v44, v45, v9);
      if (v27 && SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v26.__r_.__value_.__l.__data_);
      CLMicroLocationModelTable::Entry::Entry(retstr, __p);
      *((_BYTE *)&retstr[1].var0.var4 + 96) = 1;
      if (v39 && v38 < 0)
        operator delete(v37);
      CLMicroLocationProto::Model::~Model((CLMicroLocationProto::Model *)&v36);
    }
    else
    {
      if (onceToken_MicroLocation_Default != -1)
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_123);
      v25 = logObject_MicroLocation_Default;
      if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
      {
        LOWORD(__p[0]) = 0;
        _os_log_impl(&dword_2419D9000, v25, OS_LOG_TYPE_ERROR, "convertToEntry: Failed to deserialize model protobuf from byte stream", (uint8_t *)__p, 2u);
      }
      retstr->var0.var0 = 0;
      *((_BYTE *)&retstr[1].var0.var4 + 96) = 0;
    }
    CLMicroLocationProto::Model::~Model((CLMicroLocationProto::Model *)&v40);
    if (v30)
    {
      if (SHIBYTE(v29) < 0)
        operator delete(v28[0]);
    }
  }
  else
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_123);
    v13 = logObject_MicroLocation_Default;
    result = (optional<CLMicroLocationModelTable::Entry> *)os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR);
    if ((_DWORD)result)
    {
      LOWORD(__p[0]) = 0;
      _os_log_impl(&dword_2419D9000, v13, OS_LOG_TYPE_ERROR, "convertToEntry: model's modelUUID has no value", (uint8_t *)__p, 2u);
    }
    retstr->var0.var0 = 0;
    *((_BYTE *)&retstr[1].var0.var4 + 96) = 0;
  }
  return result;
}

@end
