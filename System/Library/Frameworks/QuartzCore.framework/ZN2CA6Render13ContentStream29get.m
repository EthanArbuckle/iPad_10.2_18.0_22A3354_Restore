@implementation ZN2CA6Render13ContentStream29get

CAProcessMonitor *___ZN2CA6Render13ContentStream29get_or_create_stream_and_lockEjji_block_invoke()
{
  uint64_t v0;
  CAProcessMonitor *result;

  v0 = operator new();
  *(_OWORD *)v0 = 0u;
  *(_OWORD *)(v0 + 16) = 0u;
  *(_DWORD *)(v0 + 32) = 1065353216;
  CA::Render::s_streams = v0;
  result = -[CAProcessMonitor initWithCallback:]([CAProcessMonitor alloc], "initWithCallback:", &__block_literal_global_19);
  CA::Render::s_process_monitor = (uint64_t)result;
  return result;
}

@end
