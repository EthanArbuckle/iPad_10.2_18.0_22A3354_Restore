@implementation AppStoreOverlayCoordinator

- (void)storeOverlay:(id)a3 didFinishPresentation:(id)a4
{
  id v6;
  id v7;
  _TtC17_StoreKit_SwiftUIP33_7A1CD05574219937BB53A614E2FE018426AppStoreOverlayCoordinator *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_2210C12D8();

}

- (void)storeOverlay:(id)a3 didFailToLoadWithError:(id)a4
{
  id v6;
  _TtC17_StoreKit_SwiftUIP33_7A1CD05574219937BB53A614E2FE018426AppStoreOverlayCoordinator *v7;
  id v8;

  v6 = a3;
  v8 = a4;
  v7 = self;
  sub_2210C1420();

}

- (void)storeOverlay:(id)a3 didFinishDismissal:(id)a4
{
  id v6;
  id v7;
  _TtC17_StoreKit_SwiftUIP33_7A1CD05574219937BB53A614E2FE018426AppStoreOverlayCoordinator *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_2210C1420();

}

- (void)dealloc
{
  _TtC17_StoreKit_SwiftUIP33_7A1CD05574219937BB53A614E2FE018426AppStoreOverlayCoordinator *v2;

  v2 = self;
  sub_2210C1518();
}

- (void).cxx_destruct
{
  sub_22109EE54(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC17_StoreKit_SwiftUIP33_7A1CD05574219937BB53A614E2FE018426AppStoreOverlayCoordinator_isPresented), *(_QWORD *)&self->isPresented[OBJC_IVAR____TtC17_StoreKit_SwiftUIP33_7A1CD05574219937BB53A614E2FE018426AppStoreOverlayCoordinator_isPresented]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17_StoreKit_SwiftUIP33_7A1CD05574219937BB53A614E2FE018426AppStoreOverlayCoordinator_overlay));
  swift_unknownObjectWeakDestroy();
}

- (_TtC17_StoreKit_SwiftUIP33_7A1CD05574219937BB53A614E2FE018426AppStoreOverlayCoordinator)init
{
  return (_TtC17_StoreKit_SwiftUIP33_7A1CD05574219937BB53A614E2FE018426AppStoreOverlayCoordinator *)sub_2210C161C();
}

@end
