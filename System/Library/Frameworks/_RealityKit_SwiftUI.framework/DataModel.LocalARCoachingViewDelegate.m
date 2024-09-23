@implementation DataModel.LocalARCoachingViewDelegate

- (void)coachingOverlayViewDidRequestSessionReset:(id)a3
{
  id v4;
  _TtCC19_RealityKit_SwiftUI9DataModelP33_C9AE5511A982EB3959C0C8BA03AFBA3D27LocalARCoachingViewDelegate *v5;

  v4 = a3;
  v5 = self;
  specialized DataModel.LocalARCoachingViewDelegate.coachingOverlayViewDidRequestSessionReset(_:)();

}

- (void)coachingOverlayViewWillActivate:(id)a3
{
  @objc DataModel.LocalARCoachingViewDelegate.coachingOverlayViewWillActivate(_:)(self, (uint64_t)a2, a3, "Delegate called coachingOverlayViewWillActivate");
}

- (void)coachingOverlayViewDidDeactivate:(id)a3
{
  @objc DataModel.LocalARCoachingViewDelegate.coachingOverlayViewWillActivate(_:)(self, (uint64_t)a2, a3, "Delegate called coachingOverlayViewWillDeactivate");
}

- (_TtCC19_RealityKit_SwiftUI9DataModelP33_C9AE5511A982EB3959C0C8BA03AFBA3D27LocalARCoachingViewDelegate)init
{
  _TtCC19_RealityKit_SwiftUI9DataModelP33_C9AE5511A982EB3959C0C8BA03AFBA3D27LocalARCoachingViewDelegate *result;

  result = (_TtCC19_RealityKit_SwiftUI9DataModelP33_C9AE5511A982EB3959C0C8BA03AFBA3D27LocalARCoachingViewDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_weakDestroy();
}

@end
