@implementation STWidgetXPCStoreServerEndpointFactory

- (_TtC32ScreenTimeWidgetIntentsExtension37STWidgetXPCStoreServerEndpointFactory)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for STWidgetXPCStoreServerEndpointFactory();
  return -[STWidgetXPCStoreServerEndpointFactory init](&v3, "init");
}

- (id)newEndpoint
{
  id v0;
  id v1;
  id v2;
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  _QWORD *v18;
  void *v19;
  uint64_t v20;
  id v22;
  uint64_t v23;

  v0 = objc_msgSend(objc_allocWithZone((Class)STSettingsServiceClient), "init");
  v22 = 0;
  v1 = objc_msgSend(v0, "startCoreDataServerWithError:", &v22);
  v2 = v22;
  if (v1)
  {
    v3 = v1;
    v4 = qword_1000116F8;
    v5 = v22;
    if (v4 != -1)
      swift_once(&qword_1000116F8, sub_1000048F0);
    v6 = type metadata accessor for Logger(0);
    v7 = sub_1000046F0(v6, (uint64_t)qword_100011750);
    v8 = Logger.logObject.getter(v7);
    v9 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "Started coreDataServer and obtained XPC listener", v10, 2u);
      swift_slowDealloc(v10, -1, -1);
    }

  }
  else
  {
    v11 = v22;
    v12 = _convertNSErrorToError(_:)(v2);

    swift_willThrow();
    if (qword_1000116F8 != -1)
      swift_once(&qword_1000116F8, sub_1000048F0);
    v13 = type metadata accessor for Logger(0);
    sub_1000046F0(v13, (uint64_t)qword_100011750);
    swift_errorRetain(v12);
    v14 = swift_errorRetain(v12);
    v15 = Logger.logObject.getter(v14);
    v16 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc(12, -1);
      v18 = (_QWORD *)swift_slowAlloc(8, -1);
      *(_DWORD *)v17 = 138412290;
      swift_errorRetain(v12);
      v19 = (void *)_swift_stdlib_bridgeErrorToNSError(v12);
      v22 = v19;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v22, &v23);
      *v18 = v19;
      swift_errorRelease(v12);
      swift_errorRelease(v12);
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "Failed to start coreDataServer and get XPC listener: %@", v17, 0xCu);
      v20 = sub_1000055B8(&qword_1000118E8);
      swift_arrayDestroy(v18, 1, v20);
      swift_slowDealloc(v18, -1, -1);
      swift_slowDealloc(v17, -1, -1);

      swift_errorRelease(v12);
    }
    else
    {

      swift_errorRelease(v12);
      swift_errorRelease(v12);
      swift_errorRelease(v12);

    }
    return 0;
  }
  return v3;
}

@end
