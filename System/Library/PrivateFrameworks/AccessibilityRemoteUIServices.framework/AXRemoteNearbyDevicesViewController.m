@implementation AXRemoteNearbyDevicesViewController

void __113___AXRemoteNearbyDevicesViewController_presentNearbyDevicesViewControllerWithConnectionHandler_dismissalHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;

  v5 = a2;
  v6 = a3;
  v7 = v5;
  v9 = v7;
  if (*(_QWORD *)(a1 + 32))
    objc_msgSend(v7, "setDismissHandler:");
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v9, v6);

}

@end
