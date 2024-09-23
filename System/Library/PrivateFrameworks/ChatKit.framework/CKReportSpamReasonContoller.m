@implementation CKReportSpamReasonContoller

- (CKReportSpamReasonContoller)initWithConversations:(id)a3 didReportBlock:(id)a4
{
  void *v5;
  objc_class *v6;
  uint64_t v7;
  char *v8;
  uint64_t (**v9)();
  objc_super v11;

  v5 = _Block_copy(a4);
  sub_18E00F31C(0, (unint64_t *)&unk_1EE0F5020);
  v6 = (objc_class *)sub_18E768AE0();
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v5;
  v8 = (char *)self + OBJC_IVAR___CKReportSpamReasonContoller_reportSpamReson;
  *(_QWORD *)v8 = 0;
  v8[8] = 1;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___CKReportSpamReasonContoller_conversations) = v6;
  *(_QWORD *)v8 = 0;
  v8[8] = 1;
  v9 = (uint64_t (**)())((char *)self + OBJC_IVAR___CKReportSpamReasonContoller_didReportBlock);
  *v9 = sub_18E5228F4;
  v9[1] = (uint64_t (*)())v7;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for ReportSpamReasonContoller();
  return -[CKReportSpamReasonContoller initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, 0, 0);
}

- (CKReportSpamReasonContoller)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  CKReportSpamReasonContoller *result;

  v4 = (char *)self + OBJC_IVAR___CKReportSpamReasonContoller_reportSpamReson;
  *(_QWORD *)v4 = 0;
  v4[8] = 1;
  v5 = a3;

  result = (CKReportSpamReasonContoller *)sub_18E769320();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  CKReportSpamReasonContoller *v2;

  v2 = self;
  sub_18E62DE10();

}

- (void)dismissReportSpamcontroller
{
  CKReportSpamReasonContoller *v2;

  v2 = self;
  sub_18E62E5A4();

}

- (void)reportSpam
{
  CKReportSpamReasonContoller *v2;

  v2 = self;
  sub_18E62E738();

}

- (CKReportSpamReasonContoller)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  CKReportSpamReasonContoller *result;

  v4 = a4;
  result = (CKReportSpamReasonContoller *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
}

@end
