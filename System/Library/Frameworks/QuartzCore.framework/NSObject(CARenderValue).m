@implementation NSObject(CARenderValue)

- (CA::Render::Texture)CA_copyRenderValue
{
  uint64_t v4;
  uint64_t v5;
  CGImage *v6;

  v4 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (v4 && (v5 = *(_QWORD *)(v4 + 40)) != 0)
    v6 = *(CGImage **)(v5 + 112);
  else
    v6 = (CGImage *)CAGetColorSpace(0x1Du);
  return CA::Render::copy_render_value(a1, v6, a3);
}

- (void)CA_prepareRenderValue
{
  uint64_t v2;
  uint64_t v3;
  CGImage *v4;
  CFTypeID v5;
  double v6;
  float v7;

  v2 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (v2 && (v3 = *(_QWORD *)(v2 + 40)) != 0)
  {
    v4 = *(CGImage **)(v3 + 112);
    if (!cf)
      return;
  }
  else
  {
    v4 = (CGImage *)CAGetColorSpace(0x1Du);
    if (!cf)
      return;
  }
  v5 = CFGetTypeID(cf);
  if (CA::Render::initialize_types(void)::once[0] != -1)
    dispatch_once(CA::Render::initialize_types(void)::once, &__block_literal_global_4814);
  if (v5 == CA::Render::image_type)
  {
    CA::Render::prepare_image((CA::Render *)cf, v4, 0, v6);
  }
  else if (v5 == CA::Render::backing_type && (*((_WORD *)cf + 246) & 0x100) == 0 && !*((_QWORD *)cf + 53))
  {
    pthread_mutex_lock((pthread_mutex_t *)(cf + 16));
    CABackingStoreGetFrontTexture((CABackingStore *)cf, v4, v7);
    pthread_mutex_unlock((pthread_mutex_t *)(cf + 16));
  }
}

- (CA::Render::Texture)CA_copyRenderValueWithColorspace:()CARenderValue
{
  return CA::Render::copy_render_value(a1, a3, a3);
}

- (uint64_t)CA_copyNumericValue:()CARenderValue
{
  uint64_t v6;
  uint64_t v7;
  CGColorSpace *v8;

  v6 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (v6 && (v7 = *(_QWORD *)(v6 + 40)) != 0)
    v8 = *(CGColorSpace **)(v7 + 112);
  else
    v8 = (CGColorSpace *)CAGetColorSpace(0x1Du);
  return CA::Render::copy_numeric_value(this, v8, a3, a4);
}

@end
