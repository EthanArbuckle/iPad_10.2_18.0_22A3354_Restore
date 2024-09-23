@implementation ULCustomLoiMO

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("ULCustomLoiMO"));
}

+ (id)createFromEntry:(const void *)a3 inManagedObjectContext:(id)a4
{
  id v5;
  ULCustomLoiMO *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a4;
  v6 = -[ULCustomLoiMO initWithContext:]([ULCustomLoiMO alloc], "initWithContext:", v5);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", a3);
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULCustomLoiMO setServiceId:](v6, "setServiceId:", v8);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", (char *)a3 + 16);
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULCustomLoiMO setLoiId:](v6, "setLoiId:", v10);

  -[ULCustomLoiMO setLastSeenTimeStamp:](v6, "setLastSeenTimeStamp:", *((double *)a3 + 4));
  return v6;
}

- (optional<CLMiLoCustomLoiTable::Entry>)convertToEntry
{
  double v4;
  double v5;
  id v6;
  NSObject *v7;
  id v8;
  optional<CLMiLoCustomLoiTable::Entry> *result;
  optional<CLMiLoCustomLoiTable::Entry> v10;
  void *__p[2];
  optional<CLMiLoCustomLoiTable::Entry> v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[ULCustomLoiMO lastSeenTimeStamp](self, "lastSeenTimeStamp");
  v5 = v4;
  -[ULCustomLoiMO loiId](self, "loiId");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v6, "UTF8String"));
  CLMicroLocationProtobufHelper::uuidFromStdString((uint64_t)__p, (uint64_t)&v17);
  if ((char)v12.var0.var1.var0.var0[7] < 0)
    operator delete(__p[0]);

  if (!v19)
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_50);
    v7 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      LOWORD(__p[0]) = 0;
      _os_log_impl(&dword_2419D9000, v7, OS_LOG_TYPE_ERROR, "convertToEntry: CustomLOI record's LoiId has no value", (uint8_t *)__p, 2u);
    }
    v17 = 0;
    v18 = 0;
    if (!v19)
      v19 = 1;
  }
  -[ULCustomLoiMO serviceId](self, "serviceId");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v8, "UTF8String"));
  CLMicroLocationProtobufHelper::uuidFromStdString((uint64_t)__p, (uint64_t)&v14);
  if ((char)v12.var0.var1.var0.var0[7] < 0)
    operator delete(__p[0]);

  if (!v16)
  {
    v14 = 0;
    v15 = 0;
    v16 = 1;
  }
  if (!v19)
    std::__throw_bad_optional_access[abi:ne180100]();
  result = (optional<CLMiLoCustomLoiTable::Entry> *)CLMiLoCustomLoiTable::Entry::Entry((uint64_t)__p, v14, v15, v17, v18, v5);
  v10 = v12;
  *retstr = *(optional<CLMiLoCustomLoiTable::Entry> *)__p;
  retstr[1] = v10;
  *(_QWORD *)&retstr[2].var0.var0 = v13;
  retstr[2].var0.var1.var0.var0[8] = 1;
  return result;
}

@end
