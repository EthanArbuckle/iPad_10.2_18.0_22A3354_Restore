@implementation ReviewExtensionHostView.Coordinator

- (void)hostViewControllerDidActivate:(id)a3
{
  id v4;
  _TtCV20AppleMediaServicesUI23ReviewExtensionHostView11Coordinator *v5;

  v4 = a3;
  v5 = self;
  sub_21122A244(v4);

}

- (void)hostViewControllerWillDeactivate:(id)a3 error:(id)a4
{
  id v6;
  _TtCV20AppleMediaServicesUI23ReviewExtensionHostView11Coordinator *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = a4;
  sub_21122A310((uint64_t)v8, a4);

}

- (_TtCV20AppleMediaServicesUI23ReviewExtensionHostView11Coordinator)init
{
  sub_21122A418();
}

- (void).cxx_destruct
{
  sub_2111F2CE8((uint64_t)self + OBJC_IVAR____TtCV20AppleMediaServicesUI23ReviewExtensionHostView11Coordinator_parent, type metadata accessor for ReviewExtensionHostView);
  sub_2111C6F34((uint64_t)self + OBJC_IVAR____TtCV20AppleMediaServicesUI23ReviewExtensionHostView11Coordinator_identity, &qword_254A9E908);
}

@end
