@implementation ULLoggedEventMO

+ (id)createFromEntry:(const void *)a3 inManagedObjectContext:(id)a4
{
  id v5;
  ULLoggedEventMO *v6;
  void *v7;
  void *v8;
  char *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  ULLoggedEventMO *v13;
  NSObject *v14;
  uint8_t v16[16];

  v5 = a4;
  v6 = -[ULLoggedEventMO initWithContext:]([ULLoggedEventMO alloc], "initWithContext:", v5);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", a3);
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULLoggedEventMO setEventUUID:](v6, "setEventUUID:", v8);

  -[ULLoggedEventMO setReceivedTimestamp:](v6, "setReceivedTimestamp:", *((double *)a3 + 2));
  -[ULLoggedEventMO setEventType:](v6, "setEventType:", *((unsigned int *)a3 + 6));
  v9 = (char *)a3 + 32;
  v10 = CLMicroLocationProto::ReceivedEvent::ByteSize((CLMicroLocationProto::ReceivedEvent *)((char *)a3 + 32));
  v11 = (void *)operator new[]();
  bzero(v11, (int)v10);
  if ((MEMORY[0x2426A0204](v9, v11, v10) & 1) != 0)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", v11, (int)v10);
    -[ULLoggedEventMO setEvent:](v6, "setEvent:", v12);

    v13 = v6;
  }
  else
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_14);
    v14 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_2419D9000, v14, OS_LOG_TYPE_ERROR, "createFromEntry: Failed to serialize loggedEvent protobuf to byte stream", v16, 2u);
    }
    v13 = 0;
  }
  MEMORY[0x2426A04BC](v11, 0x1000C8077774924);

  return v13;
}

- (optional<CLMicroLocationLoggedEventsTable::Entry>)convertToEntry
{
  id v4;
  double v5;
  double v6;
  int v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  optional<CLMicroLocationLoggedEventsTable::Entry> *result;
  NSObject *v13;
  _BYTE v14[61];
  _BYTE __p[28];
  _BYTE v16[311];
  __int128 v17;
  char v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[ULLoggedEventMO eventUUID](self, "eventUUID");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v4, "UTF8String"));
  CLMicroLocationProtobufHelper::uuidFromStdString((uint64_t)__p, (uint64_t)&v17);
  if ((__p[23] & 0x80000000) != 0)
    operator delete(*(void **)__p);

  if (v18)
  {
    -[ULLoggedEventMO receivedTimestamp](self, "receivedTimestamp");
    v6 = v5;
    v7 = -[ULLoggedEventMO eventType](self, "eventType");
    -[ULLoggedEventMO event](self, "event", CLMicroLocationProto::ReceivedEvent::ReceivedEvent((CLMicroLocationProto::ReceivedEvent *)v14));
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = objc_msgSend(v8, "bytes");
    -[ULLoggedEventMO event](self, "event");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "length");
    LOBYTE(v9) = wireless_diagnostics::google::protobuf::MessageLite::ParseFromArray((wireless_diagnostics::google::protobuf::MessageLite *)v14, (const void *)v9);

    if ((v9 & 1) != 0)
    {
      if (!v18)
        std::__throw_bad_optional_access[abi:ne180100]();
      CLMicroLocationLoggedEventsTable::Entry::Entry((uint64_t)__p, &v17, v7, (CLMicroLocationProto::ReceivedEvent *)v14, v6);
      *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)__p;
      *(_OWORD *)((char *)&retstr->var0.var3.var1 + 4) = *(_OWORD *)&__p[12];
      CLMicroLocationProto::ReceivedEvent::ReceivedEvent((CLMicroLocationProto::ReceivedEvent *)&retstr->var0.var3.var4, (const CLMicroLocationProto::ReceivedEvent *)v16);
      LOBYTE(retstr[1].var0.var3.var4) = 1;
      CLMicroLocationProto::ReceivedEvent::~ReceivedEvent((CLMicroLocationProto::ReceivedEvent *)v16);
    }
    else
    {
      if (onceToken_MicroLocation_Default != -1)
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_14);
      v13 = logObject_MicroLocation_Default;
      if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)__p = 0;
        _os_log_impl(&dword_2419D9000, v13, OS_LOG_TYPE_ERROR, "convertToEntry: Failed to deserialize loggedEvent protobuf from byte stream", __p, 2u);
      }
      retstr->var0.var0 = 0;
      LOBYTE(retstr[1].var0.var3.var4) = 0;
    }
    CLMicroLocationProto::ReceivedEvent::~ReceivedEvent((CLMicroLocationProto::ReceivedEvent *)v14);
  }
  else
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_14);
    v11 = logObject_MicroLocation_Default;
    result = (optional<CLMicroLocationLoggedEventsTable::Entry> *)os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR);
    if ((_DWORD)result)
    {
      *(_WORD *)__p = 0;
      _os_log_impl(&dword_2419D9000, v11, OS_LOG_TYPE_ERROR, "convertToEntry: loggedEvent's eventUUID has no value", __p, 2u);
    }
    retstr->var0.var0 = 0;
    LOBYTE(retstr[1].var0.var3.var4) = 0;
  }
  return result;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("ULLoggedEventMO"));
}

@end
