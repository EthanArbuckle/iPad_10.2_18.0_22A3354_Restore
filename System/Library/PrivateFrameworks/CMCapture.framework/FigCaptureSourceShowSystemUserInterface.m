@implementation FigCaptureSourceShowSystemUserInterface

intptr_t __FigCaptureSourceShowSystemUserInterface_block_invoke(uint64_t a1)
{
  cs_updateShowSystemUserInterfaceDefaults(0, 0);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __FigCaptureSourceShowSystemUserInterface_block_invoke_2(uint64_t a1, int a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[5];

  if (!a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v3 = (void *)objc_msgSend((id)getCCSControlCenterServiceClass(), "sharedInstance");
  v4 = *(_QWORD *)(a1 + 40);
  v5 = objc_msgSend((id)getCCSModulePresentationOptionsClass(), "defaultOptions");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __FigCaptureSourceShowSystemUserInterface_block_invoke_3;
  v7[3] = &unk_1E4927E58;
  v7[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(v3, "presentModuleWithIdentifier:options:completionHandler:", v4, v5, v7);
}

uint64_t __FigCaptureSourceShowSystemUserInterface_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
