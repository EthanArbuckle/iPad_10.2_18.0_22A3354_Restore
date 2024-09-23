@implementation ZN2CA12WindowServer20AppleInternalDisplay4openEm

_QWORD *___ZN2CA12WindowServer20AppleInternalDisplay4openEm_block_invoke()
{
  malloc_zone_t *malloc_zone;
  _QWORD *v1;
  _QWORD *v2;
  CA::WindowServer::AppleDisplay *v3;

  malloc_zone = (malloc_zone_t *)get_malloc_zone();
  v1 = malloc_type_zone_calloc(malloc_zone, 1uLL, 0x6F18uLL, 0x743898A5uLL);
  v2 = v1;
  if (v1)
  {
    v3 = CA::WindowServer::IOMFBDisplay::IOMFBDisplay((uint64_t)v1);
    *v2 = off_1E158C618;
    CA::WindowServer::AppleDisplay::update_display_limits(v3);
    *v2 = off_1E158EF18;
    v2[3554] = 0;
  }
  return v2;
}

@end
