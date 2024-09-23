@implementation CBBootIntentManager

+ (CBBootIntentManager)sharedInstance
{
  if (qword_10008B6E0 != -1)
    swift_once(&qword_10008B6E0, sub_1000397D4);
  return (CBBootIntentManager *)(id)qword_10008C220;
}

- (unint64_t)currentBootIntentReason
{
  CBBootIntentManager *v2;
  _QWORD v4[8];

  v2 = self;
  sub_1000392F0((uint64_t)v4);
  sub_10003AE7C(v4);

  return v4[0];
}

- (id)bootIntentLocale
{
  CBBootIntentManager *v2;
  NSString v3;
  uint64_t v5;
  uint64_t v6;
  _BYTE v7[16];
  _QWORD v8[2];

  v2 = self;
  sub_1000392F0((uint64_t)&v5);
  sub_10003AEC4((uint64_t)&v6, (uint64_t)v7, &qword_10008B748);
  sub_10003AF08((uint64_t)v7);
  sub_10003AE7C(&v5);

  sub_10003AEC4((uint64_t)v7, (uint64_t)v8, &qword_10008B748);
  if (!v8[1])
    return 0;
  v3 = String._bridgeToObjectiveC()();
  sub_10003AF30((uint64_t)v7);
  return v3;
}

- (id)bootIntentWifiSSID
{
  CBBootIntentManager *v2;
  NSString v3;
  _QWORD v5[3];
  uint64_t v6;
  _BYTE v7[16];
  _QWORD v8[2];

  v2 = self;
  sub_1000392F0((uint64_t)v5);
  sub_10003AEC4((uint64_t)&v6, (uint64_t)v7, &qword_10008B748);
  sub_10003AF08((uint64_t)v7);
  sub_10003AE7C(v5);

  sub_10003AEC4((uint64_t)v7, (uint64_t)v8, &qword_10008B748);
  if (!v8[1])
    return 0;
  v3 = String._bridgeToObjectiveC()();
  sub_10003AF30((uint64_t)v7);
  return v3;
}

- (id)bootIntentWifiPassword
{
  CBBootIntentManager *v2;
  NSString v3;
  _QWORD v5[5];
  uint64_t v6;
  _BYTE v7[16];
  _QWORD v8[2];

  v2 = self;
  sub_1000392F0((uint64_t)v5);
  sub_10003AEC4((uint64_t)&v6, (uint64_t)v7, &qword_10008B748);
  sub_10003AF08((uint64_t)v7);
  sub_10003AE7C(v5);

  sub_10003AEC4((uint64_t)v7, (uint64_t)v8, &qword_10008B748);
  if (!v8[1])
    return 0;
  v3 = String._bridgeToObjectiveC()();
  sub_10003AF30((uint64_t)v7);
  return v3;
}

- (void)deleteBootIntentSourceData
{
  CBBootIntentManager *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSString v9;

  sub_10003AB14();
  v3 = self;
  v5 = (void *)static OS_os_log.default.getter(v3, v4);
  v7 = static os_log_type_t.default.getter(v5, v6);
  os_log(_:dso:log:type:_:)("Deleting boot intent source data", 32, 2, &_mh_execute_header, v5, v7, &_swiftEmptyArrayStorage);

  v8 = (void *)objc_opt_self(CBSNVRamUtil);
  v9 = String._bridgeToObjectiveC()();
  objc_msgSend(v8, "clearNVRamVariable:", v9);

}

- (BOOL)isCurrentProcessFirstToReadIntent
{
  CBBootIntentManager *v2;
  _QWORD v4[7];
  BOOL v5;

  v2 = self;
  sub_1000392F0((uint64_t)v4);
  sub_10003AE7C(v4);

  return v5;
}

- (CBBootIntentManager)init
{
  char *v2;
  objc_super v4;

  v2 = (char *)self + OBJC_IVAR___CBBootIntentManager____lazy_storage___bootIntent;
  *(_QWORD *)v2 = 0;
  *((_QWORD *)v2 + 1) = 0;
  *((_QWORD *)v2 + 2) = 1;
  *(_OWORD *)(v2 + 24) = 0u;
  *(_OWORD *)(v2 + 40) = 0u;
  v2[56] = 0;
  *((_BYTE *)&self->super.isa + OBJC_IVAR___CBBootIntentManager____lazy_storage___checkBootIntentWasRead) = 2;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for BootIntentManager();
  return -[CBBootIntentManager init](&v4, "init");
}

- (void).cxx_destruct
{
  sub_10003ADFC(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___CBBootIntentManager____lazy_storage___bootIntent), *(_QWORD *)&self->$__lazy_storage_$_bootIntent[OBJC_IVAR___CBBootIntentManager____lazy_storage___bootIntent], *(_QWORD *)&self->$__lazy_storage_$_bootIntent[OBJC_IVAR___CBBootIntentManager____lazy_storage___bootIntent + 8], *(_QWORD *)&self->$__lazy_storage_$_bootIntent[OBJC_IVAR___CBBootIntentManager____lazy_storage___bootIntent + 16], *(_QWORD *)&self->$__lazy_storage_$_bootIntent[OBJC_IVAR___CBBootIntentManager____lazy_storage___bootIntent + 24], *(_QWORD *)&self->$__lazy_storage_$_bootIntent[OBJC_IVAR___CBBootIntentManager____lazy_storage___bootIntent + 32], *(_QWORD *)&self->$__lazy_storage_$_bootIntent[OBJC_IVAR___CBBootIntentManager____lazy_storage___bootIntent + 40]);
}

@end
