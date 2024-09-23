@implementation MicrophoneTestViewController

- (void)viewDidLoad
{
  MicrophoneTestViewController *v2;

  v2 = self;
  sub_100015020();

}

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  MicrophoneTestViewController *v7;

  swift_unknownObjectRetain(a3);
  swift_unknownObjectRetain(a4);
  v7 = self;
  sub_1000160FC((uint64_t)a3);
  swift_unknownObjectRelease(a3);
  swift_unknownObjectRelease(a4);

}

- (void)start
{
  MicrophoneTestViewController *v2;

  v2 = self;
  sub_100015274();

}

- (void)cancel
{
  -[MicrophoneTestViewController setFinished:](self, "setFinished:", 1);
}

- (void)teardown
{
  objc_msgSend(*(id *)&self->DKDiagnosticViewController_opaque[OBJC_IVAR___MicrophoneTestViewController_headphonesDetector], "stop");
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (MicrophoneTestViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (MicrophoneTestViewController *)sub_100015CA8(v5, v7, a4);
}

- (MicrophoneTestViewController)initWithCoder:(id)a3
{
  return (MicrophoneTestViewController *)sub_100015DF8(a3);
}

- (void).cxx_destruct
{
  swift_release(*(_QWORD *)&self->DKDiagnosticViewController_opaque[OBJC_IVAR___MicrophoneTestViewController_audioManager]);

}

@end
