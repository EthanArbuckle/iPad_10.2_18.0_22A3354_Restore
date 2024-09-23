@implementation CNKFaceTimeConstraintsController

- (int64_t)localParticipantState
{
  int64_t result;

  MultiwayViewConstraintsController.accessibilityLocalParticipantState.getter();
  return result;
}

- (void)setLocalParticipantState:(int64_t)a3
{
  CNKFaceTimeConstraintsController *v4;

  v4 = self;
  MultiwayViewConstraintsController.accessibilityLocalParticipantState.setter(a3);

}

- (int64_t)inCallControlsState
{
  int64_t result;

  MultiwayViewConstraintsController.inCallControlsState.getter();
  return result;
}

- (void)setInCallControlsState:(int64_t)a3
{
  CNKFaceTimeConstraintsController *v4;

  v4 = self;
  MultiwayViewConstraintsController.inCallControlsState.setter(a3);

}

- (void)updateFor:(CGRect)a3 deviceOrientation:(int64_t)a4
{
  double height;
  double width;
  double y;
  double x;
  CNKFaceTimeConstraintsController *v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = self;
  MultiwayViewConstraintsController.update(for:deviceOrientation:)(a4, x, y, width, height);

}

- (void)removeEffectsConstraints
{
  CNKFaceTimeConstraintsController *v2;

  v2 = self;
  MultiwayViewConstraintsController.removeEffectsConstraints()();

}

- (void)updateConstraintsWith:(id)a3 controlsViewController:(id)a4 localParticipantView:(id)a5 effectsView:(id)a6 effectsBrowserViewController:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  CNKFaceTimeConstraintsController *v17;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = self;
  MultiwayViewConstraintsController.updateConstraints(with:controlsViewController:localParticipantView:effectsView:effectsBrowserViewController:)((uint64_t)v12, (uint64_t)v13, (uint64_t)a5, a6, (uint64_t)a7);

}

- (CNKFaceTimeConstraintsController)init
{
  MultiwayViewConstraintsController.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___CNKFaceTimeConstraintsController_viewControllerLayout);
  OUTLINED_FUNCTION_31(OBJC_IVAR___CNKFaceTimeConstraintsController_bannerControlsWidthConstraint);
  OUTLINED_FUNCTION_31(OBJC_IVAR___CNKFaceTimeConstraintsController_bannerControlsHeightConstraint);
  OUTLINED_FUNCTION_31(OBJC_IVAR___CNKFaceTimeConstraintsController_configurableRosterCellWidthConstraint);

}

@end
