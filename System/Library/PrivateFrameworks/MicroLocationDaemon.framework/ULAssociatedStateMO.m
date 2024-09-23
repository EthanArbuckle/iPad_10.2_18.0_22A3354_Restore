@implementation ULAssociatedStateMO

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("ULAssociatedStateMO"));
}

+ (id)createFromEntry:(const void *)a3 inManagedObjectContext:(id)a4
{
  id v5;
  ULAssociatedStateMO *v6;
  const void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void **v12;
  void *v13;
  void *__p[2];
  char v16;

  v5 = a4;
  v6 = -[ULAssociatedStateMO initWithContext:]([ULAssociatedStateMO alloc], "initWithContext:", v5);
  if (*((char *)a3 + 23) >= 0)
    v7 = a3;
  else
    v7 = *(const void **)a3;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULAssociatedStateMO setLoiType:](v6, "setLoiType:", v8);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", (char *)a3 + 24);
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULAssociatedStateMO setLoiId:](v6, "setLoiId:", v10);

  -[ULAssociatedStateMO setTimestamp:](v6, "setTimestamp:", *((double *)a3 + 5));
  -[ULAssociatedStateMO setIsAssociated:](v6, "setIsAssociated:", *((unsigned __int8 *)a3 + 48));
  v11 = (void *)MEMORY[0x24BDD17C8];
  CLMacAddress::str((uint64_t *)__p, (CLMacAddress *)a3 + 7);
  if (v16 >= 0)
    v12 = __p;
  else
    v12 = (void **)__p[0];
  objc_msgSend(v11, "stringWithUTF8String:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULAssociatedStateMO setMacAddress:](v6, "setMacAddress:", v13);

  if (v16 < 0)
    operator delete(__p[0]);
  -[ULAssociatedStateMO setBand:](v6, "setBand:", *((unsigned int *)a3 + 16));
  -[ULAssociatedStateMO setChannel:](v6, "setChannel:", *((unsigned int *)a3 + 17));

  return v6;
}

- (optional<CLMicroLocationAssociatedStateTable::Entry>)convertToEntry
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  optional<CLMicroLocationAssociatedStateTable::Entry> *result;
  uint64_t v14;
  uint64_t v15;
  void *v16[2];
  char v17;
  void *__p[2];
  uint64_t v19;
  uuid v20;
  $BB6FFF9874827F05299B18707C472368 v21;
  uuid v22;
  _QWORD v23[2];
  char v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  -[ULAssociatedStateMO loiType](self, "loiType", *(_QWORD *)&a4, *(_QWORD *)&a5);
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(v16, (char *)objc_msgSend(v7, "UTF8String"));

  -[ULAssociatedStateMO loiId](self, "loiId");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v8, "UTF8String"));
  CLMicroLocationProtobufHelper::uuidFromStdString((uint64_t)__p, (uint64_t)v23);
  if (SHIBYTE(v19) < 0)
    operator delete(__p[0]);

  if (!v24)
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_30);
    v9 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      LOWORD(__p[0]) = 0;
      _os_log_impl(&dword_2419D9000, v9, OS_LOG_TYPE_ERROR, "convertToEntry: associatedState's LoiId has no value", (uint8_t *)__p, 2u);
    }
    v23[0] = 0;
    v23[1] = 0;
    if (!v24)
      v24 = 1;
  }
  -[ULAssociatedStateMO timestamp](self, "timestamp");
  v15 = v10;
  -[ULAssociatedStateMO macAddress](self, "macAddress");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v11, "UTF8String"));
  v14 = CLMacAddress::newFromStr((char *)__p);
  if (SHIBYTE(v19) < 0)
    operator delete(__p[0]);

  v12 = -[ULAssociatedStateMO band](self, "band");
  if (!v24)
    std::__throw_bad_optional_access[abi:ne180100]();
  result = (optional<CLMicroLocationAssociatedStateTable::Entry> *)CLMicroLocationAssociatedStateTable::Entry::Entry(__p, v16, v23, &v15, -[ULAssociatedStateMO isAssociated](self, "isAssociated"), &v14, v12, -[ULAssociatedStateMO channel](self, "channel"));
  retstr->var0 = *($BB6FFF9874827F05299B18707C472368 *)__p;
  *(_QWORD *)retstr->var1.var0 = v19;
  *(uuid *)((char *)&retstr->var1 + 8) = v20;
  *($BB6FFF9874827F05299B18707C472368 *)((char *)&retstr[1].var0 + 8) = v21;
  *(uuid *)((char *)&retstr[1].var1 + 8) = v22;
  retstr[2].var0.var1.var0.var0[8] = 1;
  if (v17 < 0)
    operator delete(v16[0]);
  return result;
}

@end
