@implementation ULLabelMO

+ (id)createFromEntry:(const void *)a3 inManagedObjectContext:(id)a4
{
  id v5;
  ULLabelMO *v6;
  void *v7;
  void *v8;
  char *v9;
  void *v10;
  void *v11;
  void *v12;
  CLMicroLocationClientUtils *v13;
  NSString *v14;
  void *v15;
  __CFString *v16;

  v5 = a4;
  v6 = -[ULLabelMO initWithContext:]([ULLabelMO alloc], "initWithContext:", v5);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", a3);
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULLabelMO setTriggerUUID:](v6, "setTriggerUUID:", v8);

  if (*((char *)a3 + 39) >= 0)
    v9 = (char *)a3 + 16;
  else
    v9 = (char *)*((_QWORD *)a3 + 2);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULLabelMO setClientId:](v6, "setClientId:", v10);

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", (char *)a3 + 40);
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULLabelMO setLabelUUID:](v6, "setLabelUUID:", v12);

  -[ULLabelMO setReceivedTimestamp:](v6, "setReceivedTimestamp:", *((double *)a3 + 7));
  -[ULLabelMO clientId](v6, "clientId");
  v13 = (CLMicroLocationClientUtils *)objc_claimAutoreleasedReturnValue();
  CLMicroLocationClientUtils::getNSServiceUUIDFromClientIdAndServiceUUID(v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v15, "UUIDString");
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = &stru_2511DC120;
  }
  -[ULLabelMO setServiceUUID:](v6, "setServiceUUID:", v16);
  if (v15)

  return v6;
}

- (optional<CLMicroLocationRecordingLabelsTable::Entry>)convertToEntry
{
  void *v1;
  void *v2;
  id v4;
  id v5;
  id v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  optional<CLMicroLocationRecordingLabelsTable::Entry> *result;
  const char *v13;
  uuid v14;
  std::string v15;
  std::string v16;
  void *__p[2];
  uuid v18;
  uint64_t v19;
  $BB6FFF9874827F05299B18707C472368 v20;
  uint64_t v21;
  uint64_t v22[2];
  char v23;
  _QWORD v24[2];
  char v25;
  uint64_t v26;

  v2 = v1;
  v26 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(v1, "triggerUUID");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v4, "UTF8String"));
  CLMicroLocationProtobufHelper::uuidFromStdString((uint64_t)__p, (uint64_t)v24);
  if ((char)v18.var0[7] < 0)
    operator delete(__p[0]);

  if (!v25)
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_28);
    v11 = logObject_MicroLocation_Default;
    result = (optional<CLMicroLocationRecordingLabelsTable::Entry> *)os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR);
    if (!(_DWORD)result)
      goto LABEL_19;
    LOWORD(__p[0]) = 0;
    v13 = "convertToEntry: label's triggerUUID has no value";
    goto LABEL_18;
  }
  objc_msgSend(v2, "labelUUID");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v5, "UTF8String"));
  CLMicroLocationProtobufHelper::uuidFromStdString((uint64_t)__p, (uint64_t)v22);
  if ((char)v18.var0[7] < 0)
    operator delete(__p[0]);

  if (!v23)
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_28);
    v11 = logObject_MicroLocation_Default;
    result = (optional<CLMicroLocationRecordingLabelsTable::Entry> *)os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR);
    if (!(_DWORD)result)
      goto LABEL_19;
    LOWORD(__p[0]) = 0;
    v13 = "convertToEntry: label's labelUUID has no value";
LABEL_18:
    _os_log_impl(&dword_2419D9000, v11, OS_LOG_TYPE_ERROR, v13, (uint8_t *)__p, 2u);
LABEL_19:
    retstr->var0.var0 = 0;
    retstr[2].var0.var0 = 0;
    return result;
  }
  objc_msgSend(v2, "clientId");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(&v16, (char *)objc_msgSend(v6, "UTF8String"));

  objc_msgSend(v2, "receivedTimestamp");
  if (!v25)
    std::__throw_bad_optional_access[abi:ne180100]();
  v8 = v7;
  v9 = v24[0];
  v10 = v24[1];
  if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v15, v16.__r_.__value_.__l.__data_, v16.__r_.__value_.__l.__size_);
  else
    v15 = v16;
  if (!v23)
    std::__throw_bad_optional_access[abi:ne180100]();
  result = (optional<CLMicroLocationRecordingLabelsTable::Entry> *)CLMicroLocationRecordingLabelsTable::Entry::Entry((uint64_t)__p, v9, v10, (__int128 *)&v15, v22[0], v22[1], v8);
  if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v15.__r_.__value_.__l.__data_);
  v14 = v18;
  retstr->var0 = *($BB6FFF9874827F05299B18707C472368 *)__p;
  retstr->var1 = v14;
  *(_QWORD *)&retstr[1].var0.var0 = v19;
  *($BB6FFF9874827F05299B18707C472368 *)((char *)&retstr[1].var0 + 8) = v20;
  *(_QWORD *)&retstr[1].var1.var0[8] = v21;
  retstr[2].var0.var0 = 1;
  if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v16.__r_.__value_.__l.__data_);
  return result;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("ULLabelMO"));
}

@end
