@implementation IDScanCameraReader

- (void)viewDidLoad
{
  _TtC9CoreIDVUI18IDScanCameraReader *v2;

  v2 = self;
  sub_213F76214();

}

- (void)cameraReaderDidEnd:(id)a3
{
  -[CRCameraReader cancel](self, sel_cancel, a3);
}

- (void)cameraReader:(id)a3 didFailWithError:(id)a4
{
  id v6;
  _TtC9CoreIDVUI18IDScanCameraReader *v7;
  id v8;

  v6 = a3;
  v8 = a4;
  v7 = self;
  sub_213F77428(v8);

}

- (void)cameraReader:(id)a3 didRecognizeObjects:(id)a4
{
  unint64_t v6;
  id v7;
  _TtC9CoreIDVUI18IDScanCameraReader *v8;

  sub_213F3F7CC(0, &qword_254D5D910);
  v6 = sub_213FF94DC();
  v7 = a3;
  v8 = self;
  sub_213F77660(v6);

  swift_bridgeObjectRelease();
}

- (BOOL)cameraReader:(id)a3 shouldReturnIDImage:(id)a4
{
  id v6;
  id v7;
  _TtC9CoreIDVUI18IDScanCameraReader *v8;
  unsigned __int8 v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_213F77B48(v7);

  return v9 & 1;
}

- (id)cameraReader:(id)a3 auxiliaryIDCornerDetection:(__CVBuffer *)a4
{
  id v6;
  __CVBuffer *v7;
  _TtC9CoreIDVUI18IDScanCameraReader *v8;
  uint64_t v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_213F77FC4((uint64_t)v7);

  if (v9)
  {
    sub_213F3F7CC(0, &qword_254D5D908);
    v10 = (void *)sub_213FF94D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v4;

  v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for IDScanCameraReader();
  -[IDScanCameraReader viewDidAppear:](&v4, sel_viewDidAppear_, v3);
}

- (void)timerAction
{
  _TtC9CoreIDVUI18IDScanCameraReader *v2;

  v2 = self;
  sub_213F76B98();

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for IDScanCameraReader();
  v4 = v5.receiver;
  -[IDScanCameraReader viewWillDisappear:](&v5, sel_viewWillDisappear_, v3);
  sub_213F76F10();

}

- (_TtC9CoreIDVUI18IDScanCameraReader)initWithOptions:(id)a3
{
  uint64_t v3;

  if (a3)
    v3 = sub_213FF93D4();
  else
    v3 = 0;
  return (_TtC9CoreIDVUI18IDScanCameraReader *)sub_213F7701C(v3);
}

- (_TtC9CoreIDVUI18IDScanCameraReader)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = sub_213FF9458();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC9CoreIDVUI18IDScanCameraReader *)sub_213F77158(v5, v7, a4);
}

- (_TtC9CoreIDVUI18IDScanCameraReader)initWithCoder:(id)a3
{
  return (_TtC9CoreIDVUI18IDScanCameraReader *)sub_213F7728C(a3);
}

- (void).cxx_destruct
{

  sub_213F4BE68(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC9CoreIDVUI18IDScanCameraReader_didCaptureImage));
  sub_213F4BE68(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC9CoreIDVUI18IDScanCameraReader_shouldReturnImage));
  sub_213F4BE68(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC9CoreIDVUI18IDScanCameraReader_detectIDCardCorners));
  sub_213F4BE68(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC9CoreIDVUI18IDScanCameraReader_onError));
}

@end
