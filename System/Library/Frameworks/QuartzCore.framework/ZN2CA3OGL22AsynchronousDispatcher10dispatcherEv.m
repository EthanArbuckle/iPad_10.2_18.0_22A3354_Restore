@implementation ZN2CA3OGL22AsynchronousDispatcher10dispatcherEv

_QWORD *___ZN2CA3OGL22AsynchronousDispatcher10dispatcherEv_block_invoke()
{
  malloc_zone_t *malloc_zone;
  _QWORD *result;
  uint64_t v2;
  _opaque_pthread_t *v3;

  malloc_zone = (malloc_zone_t *)get_malloc_zone();
  result = malloc_type_zone_calloc(malloc_zone, 1uLL, 0x60uLL, 0x743898A5uLL);
  v2 = (uint64_t)result;
  if (result)
  {
    *result = 0;
    CA::Render::add_observer(0x18u, 0, (uint64_t)CA::OGL::AsynchronousDispatcher::AsynchronousDispatcher(void)::$_0::__invoke, 0, 0);
    v3 = x_thread_create((uint64_t)CA::OGL::AsynchronousDispatcher::thread_body, v2, 1);
    *(_QWORD *)(v2 + 24) = v3;
    CA::Render::Server::set_thread_priority(v3, (_opaque_pthread_t *)0xFFFFFFF1);
    result = (_QWORD *)CAHostTimeWithTime(0.0166666667);
    *(_QWORD *)(v2 + 48) = result;
    *(_DWORD *)(v2 + 16) = 0;
  }
  CA::OGL::AsynchronousDispatcher::dispatcher(void)::dispatcher = v2;
  return result;
}

@end
