@implementation CNKCallDetailsCoordinatorInternal

- (BOOL)isCaptioningEnabled
{
  CNKCallDetailsCoordinatorInternal *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = CallDetailsCoordinator.isCaptioningEnabled.getter();

  return v3 & 1;
}

- (BOOL)shouldHideViewsFromScreenSharing
{
  return CallDetailsCoordinator.shouldHideViewsFromScreenSharing.getter() & 1;
}

- (void)setShouldHideViewsFromScreenSharing:(BOOL)a3
{
  CNKCallDetailsCoordinatorInternal *v4;

  v4 = self;
  CallDetailsCoordinator.shouldHideViewsFromScreenSharing.setter(a3);

}

- (CNKCallDetailsCoordinatorInternal)initWithHostViewController:(id)a3 controlsManager:(id)a4 deferredPresentationManager:(id)a5
{
  id v9;
  id v10;

  swift_getObjectType();
  v9 = a3;
  v10 = a4;
  swift_unknownObjectRetain();
  return (CNKCallDetailsCoordinatorInternal *)specialized CallDetailsCoordinator.init(hostViewController:controlsManager:deferredPresentationManager:)(v9, v10, (uint64_t)a5, self);
}

- (void)startWithReason:(id)a3
{
  @objc CallDetailsCoordinator.start(withReason:)(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))CallDetailsCoordinator.start(withReason:));
}

- (void)stopWithReason:(id)a3
{
  @objc CallDetailsCoordinator.start(withReason:)(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))CallDetailsCoordinator.stop(withReason:));
}

- (void)wantsDismissal
{
  CNKCallDetailsCoordinatorInternal *v2;

  v2 = self;
  CallDetailsCoordinator.wantsDismissal()();

}

- (CNKCallDetailsCoordinatorInternal)init
{
  CallDetailsCoordinator.init()();
}

- (void).cxx_destruct
{
  swift_unknownObjectUnownedDestroy();
  outlined destroy of unowned CNKCallDetailsDeferredPresentationManager((uint64_t)self + OBJC_IVAR___CNKCallDetailsCoordinatorInternal_deferredPresentationManager);
  swift_unknownObjectUnownedDestroy();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___CNKCallDetailsCoordinatorInternal_detailsNavigationController));
}

@end
