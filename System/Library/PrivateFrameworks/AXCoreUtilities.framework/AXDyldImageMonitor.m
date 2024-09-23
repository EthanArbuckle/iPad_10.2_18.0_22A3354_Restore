@implementation AXDyldImageMonitor

void __37___AXDyldImageMonitor_sharedInstance__block_invoke()
{
  _AXDyldImageMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(_AXDyldImageMonitor);
  v1 = (void *)_Shared;
  _Shared = (uint64_t)v0;

}

uint64_t __39___AXDyldImageMonitor_loadedImagePaths__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __47___AXDyldImageMonitor_addImageMonitorObserver___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  if (v2)
  {
    objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 40), "iterateInitialImageListForImageMonitor:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 8);
    *(_QWORD *)(v4 + 8) = v3;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addObject:", *(_QWORD *)(a1 + 40));
    _dyld_register_func_for_add_image((void (__cdecl *)(const mach_header *, intptr_t))AXImageMonitor_dyld_image_callback);
  }
}

uint64_t __50___AXDyldImageMonitor_removeImageMonitorObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObject:", *(_QWORD *)(a1 + 40));
}

@end
