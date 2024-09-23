@implementation ULRecordingEventMO

+ (id)createFromEntry:(const void *)a3 inManagedObjectContext:(id)a4
{
  id v5;
  ULRecordingEventMO *v6;
  void *v7;
  void *v8;
  char *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CLMicroLocationProto::RecordingEvent *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  ULRecordingEventMO *v24;
  NSObject *v25;
  uint8_t v27[16];
  __int128 v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = -[ULRecordingEventMO initWithContext:]([ULRecordingEventMO alloc], "initWithContext:", v5);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", a3);
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULRecordingEventMO setRecordingUUID:](v6, "setRecordingUUID:", v8);

  -[ULRecordingEventMO setRecordingTimestamp:](v6, "setRecordingTimestamp:", *((double *)a3 + 2));
  if (*((char *)a3 + 47) >= 0)
    v9 = (char *)a3 + 24;
  else
    v9 = (char *)*((_QWORD *)a3 + 3);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULRecordingEventMO setLoiType:](v6, "setLoiType:", v10);

  -[ULRecordingEventMO setReceivedTimestamp:](v6, "setReceivedTimestamp:", *((double *)a3 + 8));
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", (char *)a3 + 48);
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULRecordingEventMO setLoiId:](v6, "setLoiId:", v12);

  if (*((_BYTE *)a3 + 240))
    v28 = *((_OWORD *)a3 + 14);
  else
    v28 = 0uLL;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", &v28);
  objc_msgSend(v13, "UUIDString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULRecordingEventMO setTriggerUUID:](v6, "setTriggerUUID:", v14);

  v15 = (CLMicroLocationProto::RecordingEvent *)-[ULRecordingEventMO setEventType:](v6, "setEventType:", *((unsigned int *)a3 + 18));
  v16 = *((_DWORD *)a3 + 18);
  if (v16 == 13)
  {
    if ((*((_BYTE *)a3 + 221) & 4) != 0)
    {
      v19 = *((_QWORD *)a3 + 21);
      if (!v19)
      {
        v15 = (CLMicroLocationProto::RecordingEvent *)CLMicroLocationProto::RecordingEvent::default_instance(v15);
        v19 = *((_QWORD *)v15 + 11);
      }
      if ((*(_BYTE *)(v19 + 44) & 2) != 0)
      {
        v18 = *((_QWORD *)a3 + 21);
        if (!v18)
          v18 = *(_QWORD *)(CLMicroLocationProto::RecordingEvent::default_instance(v15) + 88);
        goto LABEL_21;
      }
    }
  }
  else if (v16 == 1 && (*((_BYTE *)a3 + 220) & 4) != 0)
  {
    v17 = *((_QWORD *)a3 + 12);
    if (!v17)
    {
      v15 = (CLMicroLocationProto::RecordingEvent *)CLMicroLocationProto::RecordingEvent::default_instance(v15);
      v17 = *((_QWORD *)v15 + 2);
    }
    if ((*(_BYTE *)(v17 + 44) & 2) != 0)
    {
      v18 = *((_QWORD *)a3 + 12);
      if (!v18)
        v18 = *(_QWORD *)(CLMicroLocationProto::RecordingEvent::default_instance(v15) + 16);
LABEL_21:
      -[ULRecordingEventMO setEventSubType:](v6, "setEventSubType:", *(unsigned int *)(v18 + 12));
    }
  }
  v20 = (char *)a3 + 80;
  v21 = CLMicroLocationProto::RecordingEvent::ByteSize((CLMicroLocationProto::RecordingEvent *)((char *)a3 + 80));
  v22 = (void *)operator new[]();
  bzero(v22, (int)v21);
  if ((MEMORY[0x2426A0204](v20, v22, v21) & 1) != 0)
  {
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", v22, (int)v21);
    -[ULRecordingEventMO setEvent:](v6, "setEvent:", v23);

    v24 = v6;
  }
  else
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_16);
    v25 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v27 = 0;
      _os_log_impl(&dword_2419D9000, v25, OS_LOG_TYPE_ERROR, "createFromEntry: Failed to serialize recordingEvent protobuf to byte stream", v27, 2u);
    }
    v24 = 0;
  }
  MEMORY[0x2426A04BC](v22, 0x1000C8077774924);

  return v24;
}

- (void)convertToEntry
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  id v10;
  int v11;
  void *v12;
  BOOL v13;
  id v14;
  id v16;
  uint64_t v17;
  void *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  std::string v24;
  std::string v25;
  __int128 v26;
  char v27;
  void *__p[2];
  char v29;
  void *v30;
  char v31;
  uint64_t v32;
  __int128 v33;
  char v34;
  __int128 v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  _QWORD v40[2];
  char v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "recordingUUID");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v4, "UTF8String"));
  CLMicroLocationProtobufHelper::uuidFromStdString((uint64_t)__p, (uint64_t)v40);
  if (v29 < 0)
    operator delete(__p[0]);

  if (v41)
  {
    objc_msgSend(a1, "recordingTimestamp");
    v6 = v5;
    objc_msgSend(a1, "receivedTimestamp");
    v8 = v7;
    objc_msgSend(a1, "loiType");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(&v25, (char *)objc_msgSend(v9, "UTF8String"));

    objc_msgSend(a1, "loiId");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v10, "UTF8String"));
    CLMicroLocationProtobufHelper::uuidFromStdString((uint64_t)__p, (uint64_t)&v37);
    if (v29 < 0)
      operator delete(__p[0]);

    if (!v39)
    {
      v37 = 0;
      v38 = 0;
      v39 = 1;
    }
    v11 = objc_msgSend(a1, "eventType");
    LOBYTE(v35) = 0;
    v36 = 0;
    objc_msgSend(a1, "triggerUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "length") == 0;

    if (!v13)
    {
      objc_msgSend(a1, "triggerUUID");
      v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v14, "UTF8String"));
      CLMicroLocationProtobufHelper::uuidFromStdString((uint64_t)__p, (uint64_t)&v33);
      v35 = v33;
      v36 = v34;
      if (v29 < 0)
        operator delete(__p[0]);

      __p[0] = 0;
      __p[1] = 0;
      if (v36)
      {
        if ((void *)v35 == __p[0] && *((void **)&v35 + 1) == __p[1])
          v36 = 0;
      }
    }
    objc_msgSend(a1, "event", CLMicroLocationProto::RecordingEvent::RecordingEvent((CLMicroLocationProto::RecordingEvent *)&v33));
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v17 = objc_msgSend(v16, "bytes");
    objc_msgSend(a1, "event");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "length");
    LOBYTE(v17) = wireless_diagnostics::google::protobuf::MessageLite::ParseFromArray((wireless_diagnostics::google::protobuf::MessageLite *)&v33, (const void *)v17);

    if ((v17 & 1) != 0)
    {
      if (!v41)
        std::__throw_bad_optional_access[abi:ne180100]();
      v20 = v40[0];
      v21 = v40[1];
      if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0)
        std::string::__init_copy_ctor_external(&v24, v25.__r_.__value_.__l.__data_, v25.__r_.__value_.__l.__size_);
      else
        v24 = v25;
      v26 = v35;
      v27 = v36;
      if (!v39)
        std::__throw_bad_optional_access[abi:ne180100]();
      CLMicroLocationRecordingEventsTable::Entry::Entry((uint64_t)__p, v20, v21, (__int128 *)&v24, v11, (CLMicroLocationProto::RecordingEvent *)&v33, &v26, v19, v6, v8, v37, v38);
      if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v24.__r_.__value_.__l.__data_);
      std::__optional_destruct_base<CLMicroLocationRecordingEventsTable::Entry,false>::__optional_destruct_base[abi:ne180100]<CLMicroLocationRecordingEventsTable::Entry>((uint64_t)a2, (__int128 *)__p);
      CLMicroLocationProto::RecordingEvent::~RecordingEvent((CLMicroLocationProto::RecordingEvent *)&v32);
      if (v31 < 0)
        operator delete(v30);
    }
    else
    {
      if (onceToken_MicroLocation_Default != -1)
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_16);
      v23 = logObject_MicroLocation_Default;
      if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
      {
        LOWORD(__p[0]) = 0;
        _os_log_impl(&dword_2419D9000, v23, OS_LOG_TYPE_ERROR, "convertToEntry: Failed to deserialize recordingEvent protobuf from byte stream", (uint8_t *)__p, 2u);
      }
      *a2 = 0;
      a2[248] = 0;
    }
    CLMicroLocationProto::RecordingEvent::~RecordingEvent((CLMicroLocationProto::RecordingEvent *)&v33);
    if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v25.__r_.__value_.__l.__data_);
  }
  else
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_16);
    v22 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      LOWORD(__p[0]) = 0;
      _os_log_impl(&dword_2419D9000, v22, OS_LOG_TYPE_ERROR, "convertToEntry: recordingEvent's recordingUUID has no value", (uint8_t *)__p, 2u);
    }
    *a2 = 0;
    a2[248] = 0;
  }
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("ULRecordingEventMO"));
}

@end
