@implementation SPCarrierBundleViewModel

- (_TtC13FTMInternal_424SPCarrierBundleViewModel)init
{
  return (_TtC13FTMInternal_424SPCarrierBundleViewModel *)sub_10018F640();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);

  v3 = (char *)self + OBJC_IVAR____TtC13FTMInternal_424SPCarrierBundleViewModel__dualSim;
  v4 = sub_100146438((uint64_t *)&unk_1002B61F0);
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC13FTMInternal_424SPCarrierBundleViewModel__slicingSetup, v4);
  v5((char *)self + OBJC_IVAR____TtC13FTMInternal_424SPCarrierBundleViewModel__slicingTestApp, v4);
  v5((char *)self + OBJC_IVAR____TtC13FTMInternal_424SPCarrierBundleViewModel__llphsTestApp, v4);
}

- (void)carrierBundleDidUpdate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  _TtC13FTMInternal_424SPCarrierBundleViewModel *v8;

  v2 = qword_1002B3A98;
  v8 = self;
  if (v2 != -1)
    swift_once(&qword_1002B3A98, sub_100190468);
  v3 = type metadata accessor for Logger(0);
  v4 = sub_10018DBC8(v3, (uint64_t)qword_1002BF090);
  v5 = Logger.logObject.getter(v4);
  v6 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "delegate callback received", v7, 2u);
    swift_slowDealloc(v7, -1, -1);
  }

  sub_10018EE1C();
}

@end
