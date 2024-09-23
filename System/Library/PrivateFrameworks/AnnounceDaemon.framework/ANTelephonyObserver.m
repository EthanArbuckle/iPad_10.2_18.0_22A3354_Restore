@implementation ANTelephonyObserver

- (BOOL)hasCalls
{
  ANTelephonyObserver *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_1D23EDF60();

  return v3 & 1;
}

- (ANTelephonyObserverDelegate)delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___ANTelephonyObserver_delegate;
  swift_beginAccess();
  return (ANTelephonyObserverDelegate *)(id)MEMORY[0x1D8235DCC](v2);
}

- (void)setDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (ANTelephonyObserver)initWithQueue:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  ANTelephonyObserver *v10;
  objc_class *v11;
  ANTelephonyObserver *v12;
  objc_super v14;

  v5 = sub_1D23F27A4();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_unknownObjectWeakInit();
  v9 = a3;
  v10 = self;
  sub_1D23F2798();
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))((uint64_t)v10 + OBJC_IVAR___ANTelephonyObserver_logger, v8, v5);

  v11 = (objc_class *)type metadata accessor for TelephonyObserver();
  v14.receiver = v10;
  v14.super_class = v11;
  v12 = -[ANTelephonyObserver init](&v14, sel_init);
  sub_1D23EE3CC((uint64_t)a3);

  return v12;
}

- (void)dealloc
{
  void *v3;
  ANTelephonyObserver *v4;
  id v5;
  uint64_t v6;
  id v7;
  objc_super v8;

  v3 = (void *)objc_opt_self();
  v4 = self;
  v5 = objc_msgSend(v3, sel_defaultCenter);
  v6 = *MEMORY[0x1E0D47EF0];
  v7 = objc_msgSend((id)objc_opt_self(), sel_sharedAVSystemController);
  objc_msgSend(v5, sel_removeObserver_name_object_, v4, v6, v7);

  v8.receiver = v4;
  v8.super_class = (Class)type metadata accessor for TelephonyObserver();
  -[ANTelephonyObserver dealloc](&v8, sel_dealloc);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR___ANTelephonyObserver_logger;
  v4 = sub_1D23F27A4();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_1D23EF2A4((uint64_t)self + OBJC_IVAR___ANTelephonyObserver_delegate);
}

- (ANTelephonyObserver)init
{
  ANTelephonyObserver *result;

  result = (ANTelephonyObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
