@implementation SetupUserDispositionProvider

- (void)isNewUserWithDataTransferMethod:(unint64_t)a3 deviceClass:(NSString *)a4 serialNumber:(NSString *)a5 completionHandler:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  NSString *v19;
  NSString *v20;
  _TtC5Setup28SetupUserDispositionProvider *v21;
  uint64_t v22;
  uint64_t v23;

  v11 = sub_10000A9E4(&qword_1002EA790);
  __chkstk_darwin(v11);
  v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  v15 = (_QWORD *)swift_allocObject(&unk_10027F830, 56, 7);
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  v16 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (_QWORD *)swift_allocObject(&unk_10027F858, 48, 7);
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_1002EA908;
  v17[5] = v15;
  v18 = (_QWORD *)swift_allocObject(&unk_10027F880, 48, 7);
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_1002EB100;
  v18[5] = v17;
  v19 = a4;
  v20 = a5;
  v21 = self;
  v22 = sub_10002F124((uint64_t)v13, (uint64_t)&unk_1002EA860, (uint64_t)v18);
  swift_release(v22);
}

- (_TtC5Setup28SetupUserDispositionProvider)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SetupUserDispositionProvider();
  return -[SetupUserDispositionProvider init](&v3, "init");
}

@end
