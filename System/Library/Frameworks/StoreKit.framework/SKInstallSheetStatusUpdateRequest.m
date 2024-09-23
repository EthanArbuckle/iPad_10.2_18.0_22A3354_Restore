@implementation SKInstallSheetStatusUpdateRequest

- (SKInstallSheetStatusUpdateRequest)initWithAppBundleId:(id)a3 isInstallSheetOpen:(BOOL)a4 completionHandler:(id)a5
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);

  v6 = _Block_copy(a5);
  v7 = sub_1AC0F79CC();
  v9 = v8;
  if (v6)
  {
    v10 = swift_allocObject();
    *(_QWORD *)(v10 + 16) = v6;
    v11 = sub_1AC0810F8;
  }
  else
  {
    v11 = 0;
    v10 = 0;
  }
  return (SKInstallSheetStatusUpdateRequest *)sub_1AC07FB74(v7, v9, a4, (uint64_t)v11, v10);
}

- (void)start
{
  SKInstallSheetStatusUpdateRequest *v2;

  v2 = self;
  sub_1AC07FD14();

}

- (SKInstallSheetStatusUpdateRequest)init
{
  SKInstallSheetStatusUpdateRequest.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1AC081110(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___SKInstallSheetStatusUpdateRequest_completionHandler));
}

@end
