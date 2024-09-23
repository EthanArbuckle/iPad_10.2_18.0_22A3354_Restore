@implementation CPApplicationController

- (CPApplicationController)init
{
  return (CPApplicationController *)CPApplicationController.init()();
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___CPApplicationController_definedSystemActivityIdentifiersCache));
  swift_release();

  swift_unknownObjectRelease();
  outlined destroy of UUID?((uint64_t)self + OBJC_IVAR___CPApplicationController_protectedAppsObserver, &demangling cache variable for type metadata for ProtectedAppsObserverProtocol?);
}

- (void)applicationsDidInstall:(id)a3
{
  @objc CPApplicationController.applicationsDidInstall(_:)(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))CPApplicationController.applicationsDidInstall(_:));
}

- (void)applicationsDidUninstall:(id)a3
{
  @objc CPApplicationController.applicationsDidInstall(_:)(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))CPApplicationController.applicationsDidUninstall(_:));
}

@end
