@implementation PDFPreviewViewController

- (_TtC15HealthRecordsUI24PDFPreviewViewController)initWithCoder:(id)a3
{
  _TtC15HealthRecordsUI24PDFPreviewViewController *result;

  result = (_TtC15HealthRecordsUI24PDFPreviewViewController *)sub_1BC62D394();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC15HealthRecordsUI24PDFPreviewViewController *v2;

  v2 = self;
  sub_1BC46B49C();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC15HealthRecordsUI24PDFPreviewViewController *v4;

  v4 = self;
  sub_1BC46B598(a3);

}

- (_TtC15HealthRecordsUI24PDFPreviewViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  sub_1BC46B6E4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI24PDFPreviewViewController_pdfDocument));
}

@end
