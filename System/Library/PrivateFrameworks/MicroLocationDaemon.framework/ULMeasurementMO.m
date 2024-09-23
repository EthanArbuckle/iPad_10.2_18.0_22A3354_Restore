@implementation ULMeasurementMO

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("ULMeasurementMO"));
}

+ (id)createFromEntry:(const void *)a3 inManagedObjectContext:(id)a4
{
  id v5;
  ULMeasurementMO *v6;
  void *v7;
  void *v8;
  char *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  ULMeasurementMO *v13;
  NSObject *v14;
  uint8_t v16[16];

  v5 = a4;
  v6 = -[ULMeasurementMO initWithContext:]([ULMeasurementMO alloc], "initWithContext:", v5);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", a3);
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULMeasurementMO setRecordingUUID:](v6, "setRecordingUUID:", v8);

  -[ULMeasurementMO setScanCFTimestamp:](v6, "setScanCFTimestamp:", *((double *)a3 + 2));
  -[ULMeasurementMO setScanMCTimestamp:](v6, "setScanMCTimestamp:", *((_QWORD *)a3 + 3));
  -[ULMeasurementMO setFlags:](v6, "setFlags:", *((unsigned int *)a3 + 28));
  v9 = (char *)a3 + 32;
  v10 = CLMicroLocationProto::Measurement::ByteSize((CLMicroLocationProto::Measurement *)((char *)a3 + 32));
  v11 = (void *)operator new[]();
  bzero(v11, (int)v10);
  if ((MEMORY[0x2426A0204](v9, v11, v10) & 1) != 0)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", v11, (int)v10);
    -[ULMeasurementMO setData:](v6, "setData:", v12);

    v13 = v6;
  }
  else
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_53);
    v14 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_2419D9000, v14, OS_LOG_TYPE_ERROR, "createFromEntry: Failed to serialize measurement protobuf to byte stream", v16, 2u);
    }
    v13 = 0;
  }
  MEMORY[0x2426A04BC](v11, 0x1000C8077774924);

  return v13;
}

- (optional<CLMicroLocationMeasurementTable::Entry>)convertToEntry
{
  id v4;
  double v5;
  double v6;
  uint64_t v7;
  unsigned int v8;
  id v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  optional<CLMicroLocationMeasurementTable::Entry> *result;
  NSObject *v14;
  _BYTE v15[80];
  void *__p[2];
  char v17;
  uint64_t v18;
  uint64_t v19[2];
  char v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[ULMeasurementMO recordingUUID](self, "recordingUUID");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v4, "UTF8String"));
  CLMicroLocationProtobufHelper::uuidFromStdString((uint64_t)__p, (uint64_t)v19);
  if (v17 < 0)
    operator delete(__p[0]);

  if (v20)
  {
    -[ULMeasurementMO scanCFTimestamp](self, "scanCFTimestamp");
    v6 = v5;
    v7 = -[ULMeasurementMO scanMCTimestamp](self, "scanMCTimestamp");
    v8 = -[ULMeasurementMO flags](self, "flags");
    -[ULMeasurementMO data](self, "data", CLMicroLocationProto::Measurement::Measurement((CLMicroLocationProto::Measurement *)v15));
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = objc_msgSend(v9, "bytes");
    -[ULMeasurementMO data](self, "data");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "length");
    LOBYTE(v10) = wireless_diagnostics::google::protobuf::MessageLite::ParseFromArray((wireless_diagnostics::google::protobuf::MessageLite *)v15, (const void *)v10);

    if ((v10 & 1) != 0)
    {
      if (!v20)
        std::__throw_bad_optional_access[abi:ne180100]();
      CLMicroLocationMeasurementTable::Entry::Entry((uint64_t)__p, v19[0], v19[1], v7, (CLMicroLocationProto::Measurement *)v15, v8 | 0x100000000, v6);
      CLMicroLocationMeasurementTable::Entry::Entry(retstr, __p);
      *((_BYTE *)&retstr[1].var0.var4 + 40) = 1;
      CLMicroLocationProto::Measurement::~Measurement((CLMicroLocationProto::Measurement *)&v18);
    }
    else
    {
      if (onceToken_MicroLocation_Default != -1)
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_53);
      v14 = logObject_MicroLocation_Default;
      if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
      {
        LOWORD(__p[0]) = 0;
        _os_log_impl(&dword_2419D9000, v14, OS_LOG_TYPE_ERROR, "convertToEntry: Failed to deserialize measurement protobuf from byte stream", (uint8_t *)__p, 2u);
      }
      retstr->var0.var0 = 0;
      *((_BYTE *)&retstr[1].var0.var4 + 40) = 0;
    }
    CLMicroLocationProto::Measurement::~Measurement((CLMicroLocationProto::Measurement *)v15);
  }
  else
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_53);
    v12 = logObject_MicroLocation_Default;
    result = (optional<CLMicroLocationMeasurementTable::Entry> *)os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR);
    if ((_DWORD)result)
    {
      LOWORD(__p[0]) = 0;
      _os_log_impl(&dword_2419D9000, v12, OS_LOG_TYPE_ERROR, "convertToEntry: measuremnt's recordingUUID has no value", (uint8_t *)__p, 2u);
    }
    retstr->var0.var0 = 0;
    *((_BYTE *)&retstr[1].var0.var4 + 40) = 0;
  }
  return result;
}

@end
