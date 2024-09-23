@implementation WFPhotoAccessResource

+ (BOOL)isSystemResource
{
  return 1;
}

- (id)associatedAppIdentifier
{
  return CFSTR("com.apple.mobileslideshow");
}

- (unint64_t)status
{
  return 4;
}

- (void)makeAvailableWithUserInterface:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v6 = a3;
  v7 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2050000000;
  v8 = (void *)getPHPhotoLibraryClass_softClass_37201;
  v18 = getPHPhotoLibraryClass_softClass_37201;
  v9 = MEMORY[0x24BDAC760];
  if (!getPHPhotoLibraryClass_softClass_37201)
  {
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __getPHPhotoLibraryClass_block_invoke_37202;
    v14[3] = &unk_24F8BB430;
    v14[4] = &v15;
    __getPHPhotoLibraryClass_block_invoke_37202((uint64_t)v14);
    v8 = (void *)v16[3];
  }
  v10 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v15, 8);
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __74__WFPhotoAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke;
  v12[3] = &unk_24F8B7788;
  v12[4] = self;
  v13 = v7;
  v11 = v7;
  objc_msgSend(v10, "requestAuthorization:", v12);

}

uint64_t __74__WFPhotoAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "refreshAvailabilityWithForcedNotification");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
