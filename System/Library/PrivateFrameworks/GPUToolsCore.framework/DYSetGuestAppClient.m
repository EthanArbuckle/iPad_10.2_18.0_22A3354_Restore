@implementation DYSetGuestAppClient

void __DYSetGuestAppClient_block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(int *)(a1 + 40);
  g_app_client[v1] = *(_QWORD *)(a1 + 32);
  dispatch_resume((dispatch_object_t)g_set_app_client[v1]);
}

@end
