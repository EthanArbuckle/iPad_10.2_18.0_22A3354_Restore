@implementation ULBluetoothIdentityMO

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("ULBluetoothIdentityMO"));
}

+ (id)createFromEntry:(const void *)a3 inManagedObjectContext:(id)a4
{
  id v5;
  ULBluetoothIdentityMO *v6;
  void *v7;
  void *v8;
  char *v9;
  void *v10;
  char *v11;
  void *v12;

  v5 = a4;
  v6 = -[ULBluetoothIdentityMO initWithContext:]([ULBluetoothIdentityMO alloc], "initWithContext:", v5);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", a3);
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULBluetoothIdentityMO setBluetoothId:](v6, "setBluetoothId:", v8);

  if (*((char *)a3 + 39) >= 0)
    v9 = (char *)a3 + 16;
  else
    v9 = (char *)*((_QWORD *)a3 + 2);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULBluetoothIdentityMO setDeviceName:](v6, "setDeviceName:", v10);

  if (*((char *)a3 + 63) >= 0)
    v11 = (char *)a3 + 40;
  else
    v11 = (char *)*((_QWORD *)a3 + 5);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULBluetoothIdentityMO setStableIdentifier:](v6, "setStableIdentifier:", v12);

  -[ULBluetoothIdentityMO setLastSeenTimeStamp:](v6, "setLastSeenTimeStamp:", *((double *)a3 + 8));
  return v6;
}

- (optional<CLMicroLocationBluetoothIdentityTable::Entry>)convertToEntry
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
  optional<CLMicroLocationBluetoothIdentityTable::Entry> *result;
  __int128 v12;
  unint64_t v13;
  uint64_t v14;
  std::string v15;
  std::string v16;
  std::string v17;
  std::string v18;
  void *__p[2];
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;

  v2 = v1;
  v28 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(v1, "bluetoothId");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v4, "UTF8String"));
  CLMicroLocationProtobufHelper::uuidFromStdString((uint64_t)__p, (uint64_t)&v25);
  if (SBYTE7(v20) < 0)
    operator delete(__p[0]);

  if (!v27)
  {
    v25 = 0;
    v26 = 0;
    v27 = 1;
  }
  objc_msgSend(v2, "deviceName");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(&v18, (char *)objc_msgSend(v5, "UTF8String"));

  objc_msgSend(v2, "stableIdentifier");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(&v17, (char *)objc_msgSend(v6, "UTF8String"));

  objc_msgSend(v2, "lastSeenTimeStamp");
  if (!v27)
    std::__throw_bad_optional_access[abi:ne180100]();
  v8 = v7;
  v9 = v25;
  v10 = v26;
  if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v16, v18.__r_.__value_.__l.__data_, v18.__r_.__value_.__l.__size_);
  else
    v16 = v18;
  if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v15, v17.__r_.__value_.__l.__data_, v17.__r_.__value_.__l.__size_);
  else
    v15 = v17;
  result = (optional<CLMicroLocationBluetoothIdentityTable::Entry> *)CLMicroLocationBluetoothIdentityTable::Entry::Entry(__p, v9, v10, &v16, &v15, v8);
  if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v15.__r_.__value_.__l.__data_);
  if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v16.__r_.__value_.__l.__data_);
  v12 = v20;
  retstr->var0 = *($BB6FFF9874827F05299B18707C472368 *)__p;
  *(_OWORD *)retstr->var1.var0.var0.var0.var0.var0 = v12;
  *((_QWORD *)&retstr->var1.var0.var0.var0.var1 + 2) = v21;
  v20 = 0uLL;
  *(_OWORD *)retstr->var1.var0.var1.var0 = v22;
  v21 = 0;
  v22 = 0uLL;
  v13 = v23;
  v14 = v24;
  v23 = 0;
  retstr->var1.var0.var1.var0[2] = v13;
  *(_QWORD *)&retstr[1].var0.var0 = v14;
  retstr[1].var0.var1.var0.var0[8] = 1;
  if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v17.__r_.__value_.__l.__data_);
  if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v18.__r_.__value_.__l.__data_);
  return result;
}

@end
