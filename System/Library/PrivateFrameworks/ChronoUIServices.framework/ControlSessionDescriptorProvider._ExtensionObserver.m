@implementation ControlSessionDescriptorProvider._ExtensionObserver

- (void)extensionsDidChangeForExtensionProvider:(id)a3
{
  _TtCC16ChronoUIServicesP33_7A14CBC290C42AA348319CEA8012199432ControlSessionDescriptorProvider18_ExtensionObserver *v5;
  id v6;

  if (swift_weakLoadStrong())
  {
    v6 = a3;
    v5 = self;
    sub_1B714E938();
    swift_release();

  }
}

- (_TtCC16ChronoUIServicesP33_7A14CBC290C42AA348319CEA8012199432ControlSessionDescriptorProvider18_ExtensionObserver)init
{
  objc_super v4;

  swift_weakInit();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ControlSessionDescriptorProvider._ExtensionObserver();
  return -[ControlSessionDescriptorProvider._ExtensionObserver init](&v4, sel_init);
}

- (void).cxx_destruct
{
  swift_weakDestroy();
}

@end
