@implementation SUUIResourceImageSetRegisterWithBundleAlwaysTemplate

void __SUUIResourceImageSetRegisterWithBundleAlwaysTemplate_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  SUUIExternalResourceImage *v7;

  v5 = a3;
  v6 = a2;
  v7 = objc_alloc_init(SUUIExternalResourceImage);
  -[SUUIExternalResourceImage setImageName:](v7, "setImageName:", v5);

  -[SUUIExternalResourceImage setBundle:](v7, "setBundle:", *(_QWORD *)(a1 + 32));
  -[SUUIExternalResourceImage setAlwaysTemplate:](v7, "setAlwaysTemplate:", *(unsigned __int8 *)(a1 + 40));
  objc_msgSend((id)__ExternalResources, "setObject:forKey:", v7, v6);

}

@end
