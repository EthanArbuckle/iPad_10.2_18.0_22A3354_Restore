@implementation LAUIPearlGlyphViewStaticResources

- (id)initWithState:(void *)a1
{
  id *v3;
  id *v4;
  objc_super v6;

  if (!a1)
    return 0;
  v6.receiver = a1;
  v6.super_class = (Class)LAUIPearlGlyphViewStaticResources;
  v3 = (id *)objc_msgSendSuper2(&v6, sel_init);
  v4 = v3;
  if (v3)
    std::optional<LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t>::operator=[abi:ne180100]<LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t const&,void>(v3 + 1, a2);
  return v4;
}

- (uint64_t)state
{
  if (a1)
    return a1 + 8;
  else
    return 0;
}

- (LAUIPearlGlyphViewStaticResources)init
{

  return 0;
}

- (void).cxx_destruct
{
  if (self->_state.__engaged_)
    LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::~shared_state_t((id *)&self->_state);
}

- (id).cxx_construct
{
  *((_BYTE *)self + 8) = 0;
  *((_BYTE *)self + 112) = 0;
  return self;
}

@end
