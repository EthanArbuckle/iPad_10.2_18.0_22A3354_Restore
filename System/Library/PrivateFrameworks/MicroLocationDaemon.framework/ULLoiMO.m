@implementation ULLoiMO

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("ULLoiMO"));
}

+ (id)createFromEntry:(const void *)a3 inManagedObjectContext:(id)a4
{
  id v5;
  ULLoiMO *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char *v11;
  char *v12;
  char *v13;
  char *v14;
  void *v15;

  v5 = a4;
  v6 = -[ULLoiMO initWithContext:]([ULLoiMO alloc], "initWithContext:", v5);
  -[ULLoiMO setLastSeenTimeStamp:](v6, "setLastSeenTimeStamp:", *(double *)a3);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", (char *)a3 + 8);
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULLoiMO setLoiId:](v6, "setLoiId:", v8);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", (char *)a3 + 24);
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULLoiMO setLoiGroupId:](v6, "setLoiGroupId:", v10);

  v13 = (char *)*((_QWORD *)a3 + 5);
  v12 = (char *)a3 + 40;
  v11 = v13;
  if (v12[23] >= 0)
    v14 = v12;
  else
    v14 = v11;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULLoiMO setLoiType:](v6, "setLoiType:", v15);

  return v6;
}

+ (id)createWithLastSeenTimeStamp:(double)a3 loiId:(id)a4 loiGroupId:(id)a5 loiType:(id)a6 inManagedObjectContext:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  ULLoiMO *v15;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  v15 = -[ULLoiMO initWithContext:]([ULLoiMO alloc], "initWithContext:", v14);
  -[ULLoiMO setLastSeenTimeStamp:](v15, "setLastSeenTimeStamp:", a3);
  -[ULLoiMO setLoiId:](v15, "setLoiId:", v11);
  -[ULLoiMO setLoiGroupId:](v15, "setLoiGroupId:", v12);
  -[ULLoiMO setLoiType:](v15, "setLoiType:", v13);

  return v15;
}

- (optional<CLMiLoLoiTable::Entry>)convertToEntry
{
  void *v1;
  void *v2;
  double v4;
  double v5;
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  optional<CLMiLoLoiTable::Entry> *result;
  __int128 v16;
  std::string v17;
  std::string v18;
  void *__p[2];
  __int128 v20;
  unint64_t v21;
  __int128 v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;

  v2 = v1;
  v30 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(v1, "lastSeenTimeStamp");
  v5 = v4;
  objc_msgSend(v2, "loiType");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(&v18, (char *)objc_msgSend(v6, "UTF8String"));

  objc_msgSend(v2, "loiId");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v7, "UTF8String"));
  CLMicroLocationProtobufHelper::uuidFromStdString((uint64_t)__p, (uint64_t)&v27);
  if (SBYTE7(v20) < 0)
    operator delete(__p[0]);

  if (!v29)
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_103);
    v8 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      LOWORD(__p[0]) = 0;
      _os_log_impl(&dword_2419D9000, v8, OS_LOG_TYPE_ERROR, "convertToEntry: LOI record's LoiId has no value", (uint8_t *)__p, 2u);
    }
    v27 = 0;
    v28 = 0;
    if (!v29)
      v29 = 1;
  }
  objc_msgSend(v2, "loiGroupId");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v9, "UTF8String"));
  CLMicroLocationProtobufHelper::uuidFromStdString((uint64_t)__p, (uint64_t)&v24);
  if (SBYTE7(v20) < 0)
    operator delete(__p[0]);

  if (!v26)
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_103);
    v10 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      LOWORD(__p[0]) = 0;
      _os_log_impl(&dword_2419D9000, v10, OS_LOG_TYPE_ERROR, "convertToEntry: LOI record's LoiGroupId has no value", (uint8_t *)__p, 2u);
    }
    v24 = 0;
    v25 = 0;
    if (!v26)
      v26 = 1;
  }
  if (!v29)
    std::__throw_bad_optional_access[abi:ne180100]();
  v11 = v27;
  v12 = v28;
  v13 = v24;
  v14 = v25;
  if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v17, v18.__r_.__value_.__l.__data_, v18.__r_.__value_.__l.__size_);
  else
    v17 = v18;
  result = (optional<CLMiLoLoiTable::Entry> *)CLMiLoLoiTable::Entry::Entry((uint64_t)__p, v11, v12, v13, v14, (__int128 *)&v17, v5);
  if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v17.__r_.__value_.__l.__data_);
  v16 = v20;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)__p;
  *((_OWORD *)&retstr->var0.var4.var0.var0.var0.var1 + 1) = v16;
  retstr->var0.var4.var0.var1.var0[1] = v21;
  *(_OWORD *)&retstr->var0.var4.var0.var1.var0[2] = v22;
  retstr[1].var0.var4.var0.var0.var0.var1.var1 = v23;
  retstr[1].var0.var4.var0.var0.var0.var0.var0[16] = 1;
  if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v18.__r_.__value_.__l.__data_);
  return result;
}

@end
