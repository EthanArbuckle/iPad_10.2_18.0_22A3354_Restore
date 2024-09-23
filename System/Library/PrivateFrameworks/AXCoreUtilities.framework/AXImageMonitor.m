@implementation AXImageMonitor

void __AXImageMonitor_dyld_image_callback_block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", *(_QWORD *)(a1 + 32), _NSDefaultFileSystemEncoding());
  free(*(void **)(a1 + 32));
  +[_AXDyldImageMonitor sharedInstance](_AXDyldImageMonitor, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_dyldDidAddImage:", v3);

}

@end
