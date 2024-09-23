@implementation SURLSessionRunningViewModel

- (_TtC13FTMInternal_427SURLSessionRunningViewModel)init
{
  _TtC13FTMInternal_427SURLSessionRunningViewModel *result;

  result = (_TtC13FTMInternal_427SURLSessionRunningViewModel *)_swift_stdlib_reportUnimplementedInitializer("FTMInternal_4.SURLSessionRunningViewModel", 41, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13FTMInternal_427SURLSessionRunningViewModel_coreTelephonyService));
  v3 = (char *)self + OBJC_IVAR____TtC13FTMInternal_427SURLSessionRunningViewModel__store;
  v4 = sub_100146438(&qword_1002B6948);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC13FTMInternal_427SURLSessionRunningViewModel__viewState;
  v6 = sub_100146438(&qword_1002B6950);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = *(_QWORD *)&self->configuration[OBJC_IVAR____TtC13FTMInternal_427SURLSessionRunningViewModel_configuration];
  swift_bridgeObjectRelease(*(_QWORD *)&self->configuration[OBJC_IVAR____TtC13FTMInternal_427SURLSessionRunningViewModel_configuration
                                                          + 16]);
  swift_bridgeObjectRelease(v7);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC13FTMInternal_427SURLSessionRunningViewModel_dataGenerator));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC13FTMInternal_427SURLSessionRunningViewModel_cancellable));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC13FTMInternal_427SURLSessionRunningViewModel_subject));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC13FTMInternal_427SURLSessionRunningViewModel_runningTasks));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13FTMInternal_427SURLSessionRunningViewModel_operationQueue));
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  _TtC13FTMInternal_427SURLSessionRunningViewModel *v17;
  uint64_t v18;

  v9 = type metadata accessor for URL(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = sub_100146438(&qword_1002B5660);
  v14 = swift_allocObject(v13, 64, 7);
  *(_OWORD *)(v14 + 16) = xmmword_1002402A0;
  *(_QWORD *)(v14 + 56) = &type metadata for String;
  *(_QWORD *)(v14 + 32) = 0xD000000000000032;
  *(_QWORD *)(v14 + 40) = 0x8000000100213FF0;
  v15 = a3;
  v16 = a4;
  v17 = self;
  print(_:separator:terminator:)(v14, 32, 0xE100000000000000, 10, 0xE100000000000000);

  swift_bridgeObjectRelease(v14);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)URLSession:(id)a3 didCreateTask:(id)a4
{
  id v6;
  id v7;
  _TtC13FTMInternal_427SURLSessionRunningViewModel *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1001A14A8(v7, (uint64_t)&unk_1002659A0, (uint64_t)sub_1001A1BC4, (uint64_t)&unk_1002659B8);

}

- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7
{
  id v9;
  id v10;
  _TtC13FTMInternal_427SURLSessionRunningViewModel *v11;

  v9 = a3;
  v10 = a4;
  v11 = self;
  sub_1001A14A8(v10, (uint64_t)&unk_100265950, (uint64_t)sub_1001A1D2C, (uint64_t)&unk_100265968);

}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didWriteData:(int64_t)a5 totalBytesWritten:(int64_t)a6 totalBytesExpectedToWrite:(int64_t)a7
{
  id v9;
  id v10;
  _TtC13FTMInternal_427SURLSessionRunningViewModel *v11;

  v9 = a3;
  v10 = a4;
  v11 = self;
  sub_1001A14A8(v10, (uint64_t)&unk_100265900, (uint64_t)sub_1001A1B78, (uint64_t)&unk_100265918);

}

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC13FTMInternal_427SURLSessionRunningViewModel *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_1001A16DC(v9, v10);

}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8;
  id v9;
  _TtC13FTMInternal_427SURLSessionRunningViewModel *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = a5;
  sub_1001A0198(v8, v9, (uint64_t)a5);

}

- (void)URLSessionDidFinishEventsForBackgroundURLSession:
{
  uint64_t v0;
  uint64_t v1;
  os_log_type_t v2;
  uint8_t *v3;
  uint64_t v4;
  NSObject *oslog;
  uint64_t v6;
  uint64_t v7;

  if (qword_1002B3A98 != -1)
    swift_once(&qword_1002B3A98, sub_100190468);
  v0 = type metadata accessor for Logger(0);
  v1 = sub_10018DBC8(v0, (uint64_t)qword_1002BF090);
  oslog = Logger.logObject.getter(v1);
  v2 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(oslog, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc(12, -1);
    v4 = swift_slowAlloc(32, -1);
    v7 = v4;
    *(_DWORD *)v3 = 136315138;
    v6 = sub_10018FCE8(0xD000000000000033, 0x8000000100213F80, &v7);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v6, &v7, v3 + 4, v3 + 12);
    _os_log_impl((void *)&_mh_execute_header, oslog, v2, "%s", v3, 0xCu);
    swift_arrayDestroy(v4, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v4, -1, -1);
    swift_slowDealloc(v3, -1, -1);

  }
  else
  {

  }
}

@end
