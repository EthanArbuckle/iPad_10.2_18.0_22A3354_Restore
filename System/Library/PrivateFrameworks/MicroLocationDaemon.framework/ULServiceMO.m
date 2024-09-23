@implementation ULServiceMO

+ (id)createFromEntry:(const void *)a3 inManagedObjectContext:(id)a4
{
  id v5;
  ULServiceMO *v6;
  void *v7;
  void *v8;
  char *v9;
  void *v10;
  char *v11;
  char *v12;
  char *v13;
  char *v14;
  void *v15;

  v5 = a4;
  v6 = -[ULServiceMO initWithContext:]([ULServiceMO alloc], "initWithContext:", v5);
  -[ULServiceMO setServiceType:](v6, "setServiceType:", *(unsigned int *)a3);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", (char *)a3 + 8);
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULServiceMO setServiceUUID:](v6, "setServiceUUID:", v8);

  -[ULServiceMO setLastActiveTimestamp:](v6, "setLastActiveTimestamp:", *((double *)a3 + 3));
  if (*((char *)a3 + 55) >= 0)
    v9 = (char *)a3 + 32;
  else
    v9 = (char *)*((_QWORD *)a3 + 4);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULServiceMO setClientId:](v6, "setClientId:", v10);

  -[ULServiceMO setLocationTypes:](v6, "setLocationTypes:", *((_QWORD *)a3 + 7));
  v13 = (char *)*((_QWORD *)a3 + 8);
  v12 = (char *)a3 + 64;
  v11 = v13;
  if (v12[23] >= 0)
    v14 = v12;
  else
    v14 = v11;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULServiceMO setUserId:](v6, "setUserId:", v15);

  return v6;
}

- (optional<CLMiLoServiceTable::Entry>)convertToEntry
{
  double v5;
  double v6;
  id v7;
  id v8;
  id v9;
  optional<CLMiLoServiceTable::Entry> *result;
  __int128 v11;
  char *v12;
  unint64_t v13;
  NSObject *v14;
  void *v15[2];
  char v16;
  void *v17[2];
  char v18;
  void *__p[2];
  __int128 v20;
  __int128 v21;
  char *v22;
  unint64_t v23;
  __int128 v24;
  unint64_t v25;
  _QWORD v26[2];
  char v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  -[ULServiceMO lastActiveTimestamp](self, "lastActiveTimestamp");
  v6 = v5;
  -[ULServiceMO serviceUUID](self, "serviceUUID");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v7, "UTF8String"));
  CLMicroLocationProtobufHelper::uuidFromStdString((uint64_t)__p, (uint64_t)v26);
  if (SBYTE7(v20) < 0)
    operator delete(__p[0]);

  if (v27)
  {
    -[ULServiceMO clientId](self, "clientId");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(v17, (char *)objc_msgSend(v8, "UTF8String"));

    -[ULServiceMO userId](self, "userId");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(v15, (char *)objc_msgSend(v9, "UTF8String"));

    if (!v27)
      std::__throw_bad_optional_access[abi:ne180100]();
    result = (optional<CLMiLoServiceTable::Entry> *)CLMiLoServiceTable::Entry::Entry(__p, v26[0], v26[1], -[ULServiceMO serviceType](self, "serviceType"), v17, -[ULServiceMO locationTypes](self, "locationTypes"), v15, v6);
    v11 = v20;
    *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)__p;
    *((_OWORD *)&retstr->var0.var2.var0.var0.var0.var1 + 1) = v11;
    *(_OWORD *)&retstr->var0.var2.var0.var1.var0[1] = v21;
    v21 = 0uLL;
    v12 = v22;
    v13 = v23;
    v22 = 0;
    retstr[1].var0.var2.var0.var0.var0.var1.var0 = v12;
    retstr[1].var0.var2.var0.var0.var0.var1.var1 = v13;
    *((_OWORD *)&retstr[1].var0.var2.var0.var0.var0.var1 + 1) = v24;
    retstr[1].var0.var2.var0.var1.var0[1] = v25;
    LOBYTE(retstr[1].var0.var2.var0.var1.var0[2]) = 1;
    if (v16 < 0)
      operator delete(v15[0]);
    if (v18 < 0)
      operator delete(v17[0]);
  }
  else
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_54);
    v14 = logObject_MicroLocation_Default;
    result = (optional<CLMiLoServiceTable::Entry> *)os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR);
    if ((_DWORD)result)
    {
      LOWORD(__p[0]) = 0;
      _os_log_impl(&dword_2419D9000, v14, OS_LOG_TYPE_ERROR, "convertToEntry: service record's serviceUUID has no value", (uint8_t *)__p, 2u);
    }
    retstr->var0.var0 = 0;
    LOBYTE(retstr[1].var0.var2.var0.var1.var0[2]) = 0;
  }
  return result;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("ULServiceMO"));
}

@end
