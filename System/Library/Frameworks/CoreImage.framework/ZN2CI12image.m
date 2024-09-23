@implementation ZN2CI12image

CI::TileTask *___ZN2CI12image_renderEPKcPNS_7ContextEPNS_5ImageEPKNS_17RenderDestinationE_block_invoke(uint64_t a1, CI::ProgramNode *a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  CI::TileTask *v7;
  CGRect v9;

  v9.origin.x = a3;
  v9.origin.y = a4;
  v9.size.width = a5;
  v9.size.height = a6;
  v7 = CI::Context::render(*(CI::Context **)(a1 + 32), a2, &v9);
  (*(void (**)(_QWORD))(**(_QWORD **)(a1 + 32) + 344))(*(_QWORD *)(a1 + 32));
  return v7;
}

@end
