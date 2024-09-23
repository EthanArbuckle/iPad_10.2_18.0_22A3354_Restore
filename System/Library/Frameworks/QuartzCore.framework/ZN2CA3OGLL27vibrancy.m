@implementation ZN2CA3OGLL27vibrancy

unsigned int *___ZN2CA3OGLL27vibrancy_strength_reductionERNS0_7ContextEPNS0_5LayerEPKNS_6Render10TypedArrayINS5_6FilterEEE_block_invoke(uint64_t a1, const __CFString *a2)
{
  const __CFString *v2;
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  unsigned int *result;

  CA::OGL::vibrancy_strength_reduction(CA::OGL::Context &,CA::OGL::Layer *,CA::Render::TypedArray<CA::Render::Filter> const*)::vibrant_color_matrix_name = (uint64_t)CA::Render::String::new_string(CFSTR("vibrantColorMatrixSourceOver"), a2);
  CA::OGL::vibrancy_strength_reduction(CA::OGL::Context &,CA::OGL::Layer *,CA::Render::TypedArray<CA::Render::Filter> const*)::vibrant_dark_name = (uint64_t)CA::Render::String::new_string(CFSTR("vibrantDarkSourceOver"), v2);
  CA::OGL::vibrancy_strength_reduction(CA::OGL::Context &,CA::OGL::Layer *,CA::Render::TypedArray<CA::Render::Filter> const*)::vibrant_light_name = (uint64_t)CA::Render::String::new_string(CFSTR("vibrantLightSourceOver"), v3);
  CA::OGL::vibrancy_strength_reduction(CA::OGL::Context &,CA::OGL::Layer *,CA::Render::TypedArray<CA::Render::Filter> const*)::vibrant_dark_reversed_name = (uint64_t)CA::Render::String::new_string(CFSTR("vibrantDarkSourceOverReversed"), v4);
  result = CA::Render::String::new_string(CFSTR("vibrantLightSourceOverReversed"), v5);
  CA::OGL::vibrancy_strength_reduction(CA::OGL::Context &,CA::OGL::Layer *,CA::Render::TypedArray<CA::Render::Filter> const*)::vibrant_light_reversed_name = (uint64_t)result;
  return result;
}

@end
