@implementation AXFrontBoardRunningAppProcesses

void __AXFrontBoardRunningAppProcesses_block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __AXFrontBoardRunningAppProcesses_block_invoke_2;
  v2[3] = &unk_24DA1A9B8;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "enumerateScenesWithBlock:", v2);

}

void __AXFrontBoardRunningAppProcesses_block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (objc_msgSend(v4, "accessibilitySceneOwnerIsAUIApplication")
    && ((objc_msgSend(v4, "accessibilityIsSceneOnMainScreen") & 1) != 0
     || objc_msgSend(v4, "accessibilityIsSceneOnExternalScreen")))
  {
    objc_msgSend(v4, "accessibilitySceneProcess");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

  }
}

@end
