double LAUIPhysicalButtonNormalizedFrame()
{
  if (LAUIPhysicalButtonNormalizedFrame::onceToken != -1)
    dispatch_once(&LAUIPhysicalButtonNormalizedFrame::onceToken, &__block_literal_global);
  return *(double *)&LAUIPhysicalButtonNormalizedFrame::frame;
}

void sub_209E01FA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_209E02090(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)LAUIPhysicalButtonView;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void sub_209E021C0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_209E023DC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id LA_LOG_LAUIPhysicalButtonView(void)
{
  if (LA_LOG_LAUIPhysicalButtonView(void)::once != -1)
    dispatch_once(&LA_LOG_LAUIPhysicalButtonView(void)::once, &__block_literal_global_100);
  return (id)LA_LOG_LAUIPhysicalButtonView(void)::log;
}

void sub_209E0249C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_209E02AA8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_209E02BA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_209E02C40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_209E02D7C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_209E0329C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_209E03968(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  void *v24;
  id *v25;

  objc_destroyWeak(v25);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_209E03B44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_209E03BF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_209E03CD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void ___ZL29LA_LOG_LAUIPhysicalButtonViewv_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.LocalAuthentication", "LAUIPhysicalButtonView");
  v1 = (void *)LA_LOG_LAUIPhysicalButtonView(void)::log;
  LA_LOG_LAUIPhysicalButtonView(void)::log = (uint64_t)v0;

}

void sub_209E043F8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id LA_LOG_LAUIAuthenticationView()
{
  if (LA_LOG_LAUIAuthenticationView_once != -1)
    dispatch_once(&LA_LOG_LAUIAuthenticationView_once, &__block_literal_global_157);
  return (id)LA_LOG_LAUIAuthenticationView_log;
}

void sub_209E05698(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id LA_LOG_LAUIPKGlyphWrapper()
{
  if (LA_LOG_LAUIPKGlyphWrapper_once != -1)
    dispatch_once(&LA_LOG_LAUIPKGlyphWrapper_once, &__block_literal_global_65);
  return (id)LA_LOG_LAUIPKGlyphWrapper_log;
}

void sub_209E060D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_209E06410(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

void sub_209E07350(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  void *v9;
  void *v10;

  _Unwind_Resume(a1);
}

void `anonymous namespace'::create_mask<std::map<CALayer *,CALayer * {__strong}>>(uint64_t **a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t *v9;
  void *v10;
  id v11;
  id *v12;

  v5 = a2;
  v11 = v5;
  v6 = a3;
  if (v5)
  {
    v7 = objc_alloc_init(MEMORY[0x24BDE56D0]);
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v7, "setBackgroundColor:", objc_msgSend(v8, "CGColor"));

    objc_msgSend(v7, "setCornerCurve:", *MEMORY[0x24BDE58E8]);
    objc_msgSend(v7, "setActions:", v6);
    objc_msgSend(v5, "setMask:", v7);
    v12 = &v11;
    v9 = std::__tree<std::__value_type<CALayer *,CALayer * {__strong}>,std::__map_value_compare<CALayer * {__strong},std::__map_value_compare,std::less<CALayer * {__strong}>,true>,std::allocator<std::__map_value_compare>>::__emplace_unique_key_args<CALayer * {__strong},std::piecewise_construct_t const&,std::tuple<CALayer * const&>,CALayer * const<>>(a1, (unint64_t *)&v11, (uint64_t)&std::piecewise_construct, (uint64_t **)&v12);
    v10 = (void *)v9[5];
    v9[5] = (uint64_t)v7;

  }
}

void sub_209E07514(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_209E075CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;

  a9.super_class = (Class)LAUIPearlGlyphLabel;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_209E07708(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_209E08524(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22)
{
  void *v22;
  int v23;

  if (v23)
  _Unwind_Resume(a1);
}

void LAUI_CA_utilities::set_layer_transform(void *a1, __int128 *a2, LAUI_CA_utilities::spring_factory *a3)
{
  id v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  id v23;
  _OWORD v24[8];
  CATransform3D v25;
  _OWORD v26[8];
  CATransform3D b;
  CATransform3D a;
  CATransform3D v29;

  v5 = a1;
  v6 = v5;
  memset(&v29, 0, sizeof(v29));
  if (v5)
    objc_msgSend(v5, "transform");
  a = v29;
  v7 = *a2;
  v8 = a2[1];
  v9 = a2[3];
  *(_OWORD *)&b.m21 = a2[2];
  *(_OWORD *)&b.m23 = v9;
  *(_OWORD *)&b.m11 = v7;
  *(_OWORD *)&b.m13 = v8;
  v10 = a2[4];
  v11 = a2[5];
  v12 = a2[7];
  *(_OWORD *)&b.m41 = a2[6];
  *(_OWORD *)&b.m43 = v12;
  *(_OWORD *)&b.m31 = v10;
  *(_OWORD *)&b.m33 = v11;
  if (!CATransform3DEqualToTransform(&a, &b))
  {
    v13 = a2[5];
    v26[4] = a2[4];
    v26[5] = v13;
    v14 = a2[7];
    v26[6] = a2[6];
    v26[7] = v14;
    v15 = a2[1];
    v26[0] = *a2;
    v26[1] = v15;
    v16 = a2[3];
    v26[2] = a2[2];
    v26[3] = v16;
    objc_msgSend(v6, "setTransform:", v26);
    if (*((_BYTE *)a3 + 56))
    {
      v25 = v29;
      v17 = *a2;
      v18 = a2[1];
      v19 = a2[3];
      v24[2] = a2[2];
      v24[3] = v19;
      v24[0] = v17;
      v24[1] = v18;
      v20 = a2[4];
      v21 = a2[5];
      v22 = a2[7];
      v24[6] = a2[6];
      v24[7] = v22;
      v24[4] = v20;
      v24[5] = v21;
      v23 = LAUI_CA_utilities::add_additive_animation<CATransform3D>(v6, CFSTR("transform"), a3, &v25, v24);
    }
  }

}

void sub_209E0895C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_209E08E3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, int a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location)
{
  void *v27;
  void *v28;
  void *v29;

  _Unwind_Resume(a1);
}

char *std::vector<UIView * {__strong}>::emplace_back<UIView * {__strong}&>(char **a1, id *a2)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  uint64_t v18;
  int64x2_t v19;
  char *v20;
  uint64_t v22;
  int64x2_t v23;
  char *v24;
  uint64_t v25;

  v6 = (unint64_t)a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(char **)(v4 - 8);
  if ((unint64_t)v7 >= v6)
  {
    v9 = (v7 - *a1) >> 3;
    if ((unint64_t)(v9 + 1) >> 61)
      std::vector<UIView * {__strong}>::__throw_length_error[abi:ne180100]();
    v10 = v5 - (_QWORD)*a1;
    v11 = v10 >> 2;
    if (v10 >> 2 <= (unint64_t)(v9 + 1))
      v11 = v9 + 1;
    if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF8)
      v12 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v12 = v11;
    v25 = v4;
    if (v12)
      v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<UIView * {__strong}>>(v4, v12);
    else
      v13 = 0;
    v14 = &v13[8 * v9];
    v15 = &v13[8 * v12];
    v24 = v15;
    *(_QWORD *)v14 = *a2;
    v8 = v14 + 8;
    v23.i64[1] = (uint64_t)(v14 + 8);
    v17 = *a1;
    v16 = a1[1];
    if (v16 == *a1)
    {
      v19 = vdupq_n_s64((unint64_t)v16);
    }
    else
    {
      do
      {
        v18 = *((_QWORD *)v16 - 1);
        v16 -= 8;
        *(_QWORD *)v16 = 0;
        *((_QWORD *)v14 - 1) = v18;
        v14 -= 8;
      }
      while (v16 != v17);
      v19 = *(int64x2_t *)a1;
      v8 = (char *)v23.i64[1];
      v15 = v24;
    }
    *a1 = v14;
    a1[1] = v8;
    v23 = v19;
    v20 = a1[2];
    a1[2] = v15;
    v24 = v20;
    v22 = v19.i64[0];
    std::__split_buffer<UIView * {__strong}>::~__split_buffer((uint64_t)&v22);
  }
  else
  {
    *(_QWORD *)v7 = *a2;
    v8 = v7 + 8;
  }
  a1[1] = v8;
  return v8 - 8;
}

void sub_209E090E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

uint64_t std::vector<UIView * {__strong}>::shrink_to_fit(char **a1)
{
  uint64_t result;
  char *v3;
  char *v4;
  char *v5;
  unint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  _QWORD v16[2];
  uint64_t v17;
  char *v18;
  uint64_t v19;

  v3 = a1[2];
  result = (uint64_t)(a1 + 2);
  v4 = *a1;
  v5 = a1[1];
  v6 = (v5 - *a1) >> 3;
  if (v6 < (v3 - *a1) >> 3)
  {
    v19 = result;
    if (v5 == v4)
    {
      v11 = 0;
      v9 = 8 * v6;
    }
    else
    {
      v7 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<UIView * {__strong}>>(result, v6);
      v4 = *a1;
      v8 = a1[1];
      v9 = (uint64_t)&v7[8 * v6];
      v11 = &v7[8 * v10];
      v17 = v9;
      v18 = v11;
      if (v8 != v4)
      {
        v12 = &v7[8 * v6];
        do
        {
          v13 = *((_QWORD *)v8 - 1);
          v8 -= 8;
          *(_QWORD *)v8 = 0;
          *((_QWORD *)v12 - 1) = v13;
          v12 -= 8;
        }
        while (v8 != v4);
        v14 = *a1;
        v4 = a1[1];
        v9 = v17;
        v11 = v18;
        goto LABEL_9;
      }
    }
    v14 = v4;
    v12 = (char *)v9;
LABEL_9:
    *a1 = v12;
    a1[1] = (char *)v9;
    v15 = a1[2];
    a1[2] = v11;
    v17 = (uint64_t)v4;
    v18 = v15;
    v16[0] = v14;
    v16[1] = v14;
    return std::__split_buffer<UIView * {__strong}>::~__split_buffer((uint64_t)v16);
  }
  return result;
}

void sub_209E091B8(void *a1)
{
  __cxa_begin_catch(a1);
  __cxa_end_catch();
  JUMPOUT(0x209E091A8);
}

void sub_209E09518(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

void sub_209E09D44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,void *a39,uint64_t a40,uint64_t a41,char a42)
{
  void *v42;
  void *v43;
  void *v44;

  if (a42)
  _Unwind_Resume(a1);
}

id LAUI_CA_utilities::add_additive_animation<double>(void *a1, void *a2, LAUI_CA_utilities::spring_factory *a3, double a4, double a5)
{
  CALayer *v9;
  NSString *v10;
  CAAnimation *v11;
  void *v12;
  void *v13;

  v9 = a1;
  v10 = a2;
  v11 = LAUI_CA_utilities::spring_factory::create_animation(a3, v10);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4 - a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAAnimation setFromValue:](v11, "setFromValue:", v12);

  -[CAAnimation setToValue:](v11, "setToValue:", &unk_24C284EA0);
  LAUILayerAddAdditiveAnimation(v9, v10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

void sub_209E0A204(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_209E0A494(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id LAUI_CA_utilities::add_additive_animation<CGSize>(void *a1, void *a2, LAUI_CA_utilities::spring_factory *a3, double a4, double a5, double a6, double a7)
{
  CALayer *v13;
  NSString *v14;
  CAAnimation *v15;
  void *v16;
  void *v17;
  void *v18;

  v13 = a1;
  v14 = a2;
  v15 = LAUI_CA_utilities::spring_factory::create_animation(a3, v14);
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithSize:", a4 - a6, a5 - a7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAAnimation setFromValue:](v15, "setFromValue:", v16);

  objc_msgSend(MEMORY[0x24BDD1968], "valueWithSize:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAAnimation setToValue:](v15, "setToValue:", v17);

  LAUILayerAddAdditiveAnimation(v13, v14, v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

void sub_209E0A7F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

LAUI_CA_utilities::spring_factory *LAUI_CA_utilities::spring_factory::spring_factory(LAUI_CA_utilities::spring_factory *this, double a2, double a3, double a4, double a5, CAMediaTimingFunction *a6)
{
  CAMediaTimingFunction *v11;
  CAMediaTimingFunction *v12;
  CAMediaTimingFunction *v13;

  v11 = a6;
  v12 = v11;
  *(double *)this = a2;
  *((double *)this + 1) = a3;
  *((double *)this + 2) = a4;
  *((double *)this + 3) = a5;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D30]);
    v13 = (CAMediaTimingFunction *)objc_claimAutoreleasedReturnValue();
  }
  *((_QWORD *)this + 4) = v13;
  *((_BYTE *)this + 40) = 0;
  *((_QWORD *)this + 6) = 0;

  return this;
}

uint64_t LAUI_CA_utilities::set_layer_geometry(void *a1, LAUI_CA_utilities::spring_factory *a2, double a3, double a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v25;
  uint64_t v26;
  id v27;
  id v28;
  double v30;
  double v31;
  CGRect v34;
  CGRect v35;

  v13 = a1;
  objc_msgSend(v13, "position");
  v15 = v14;
  v17 = v16;
  objc_msgSend(v13, "bounds");
  v30 = v19;
  v31 = v18;
  v21 = v20;
  v23 = v22;
  if (v15 == a3 && v17 == a4)
  {
    v26 = 0;
  }
  else
  {
    objc_msgSend(v13, "setPosition:", a3, a4);
    if (*((_BYTE *)a2 + 56))
      v25 = LAUI_CA_utilities::add_additive_animation<CGPoint>(v13, CFSTR("position"), a2, v15, v17, a3, a4);
    v26 = 1;
  }
  v34.origin.x = v21;
  v34.origin.y = v23;
  v34.size.height = v30;
  v34.size.width = v31;
  v35.origin.x = a5;
  v35.origin.y = a6;
  v35.size.height = a8;
  v35.size.width = a7;
  if (!CGRectEqualToRect(v34, v35))
  {
    objc_msgSend(v13, "setBounds:", a5, a6, a7, a8);
    v26 = v26 | 2;
    if (*((_BYTE *)a2 + 56))
    {
      if (v21 != a5 || v23 != a6)
        v27 = LAUI_CA_utilities::add_additive_animation<CGPoint>(v13, CFSTR("bounds.origin"), a2, v21, v23, a5, a6);
      if (v31 != a7 || v30 != a8)
        v28 = LAUI_CA_utilities::add_additive_animation<CGSize>(v13, CFSTR("bounds.size"), a2, v31, v30, a7, a8);
    }
  }

  return v26;
}

id LAUI_CA_utilities::add_additive_animation<CGPoint>(void *a1, void *a2, LAUI_CA_utilities::spring_factory *a3, double a4, double a5, double a6, double a7)
{
  CALayer *v13;
  NSString *v14;
  CAAnimation *v15;
  void *v16;
  void *v17;
  void *v18;

  v13 = a1;
  v14 = a2;
  v15 = LAUI_CA_utilities::spring_factory::create_animation(a3, v14);
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithPoint:", a4 - a6, a5 - a7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAAnimation setFromValue:](v15, "setFromValue:", v16);

  objc_msgSend(MEMORY[0x24BDD1968], "valueWithPoint:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAAnimation setToValue:](v15, "setToValue:", v17);

  LAUILayerAddAdditiveAnimation(v13, v14, v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

id LAUI_CA_utilities::add_additive_animation<CATransform3D>(void *a1, void *a2, LAUI_CA_utilities::spring_factory *a3, _OWORD *a4, _OWORD *a5)
{
  CALayer *v9;
  NSString *v10;
  void *animation;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  CAAnimation *updated;
  void *v21;
  _OWORD v23[8];
  _OWORD v24[8];

  v9 = a1;
  v10 = a2;
  animation = LAUI_CA_utilities::spring_factory::create_animation(a3, v10);
  v12 = a4[5];
  v24[4] = a4[4];
  v24[5] = v12;
  v13 = a4[7];
  v24[6] = a4[6];
  v24[7] = v13;
  v14 = a4[1];
  v24[0] = *a4;
  v24[1] = v14;
  v15 = a4[3];
  v24[2] = a4[2];
  v24[3] = v15;
  v16 = a5[3];
  v23[2] = a5[2];
  v23[3] = v16;
  v17 = a5[1];
  v23[0] = *a5;
  v23[1] = v17;
  v18 = a5[7];
  v23[6] = a5[6];
  v23[7] = v18;
  v19 = a5[5];
  v23[4] = a5[4];
  v23[5] = v19;
  updated = (CAAnimation *)LAUI_CA_utilities::animation::update_animation<CASpringAnimation * {__strong}>(animation, v24, v23);
  LAUILayerAddAdditiveAnimation(v9, v10, updated);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

id LAUI_CA_utilities::animation::update_animation<CASpringAnimation * {__strong}>(void *a1, _OWORD *a2, _OWORD *a3)
{
  id v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  BOOL v15;
  _OWORD *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  void *v34;
  _OWORD v36[8];
  CATransform3D v37;
  CATransform3D v38;
  CATransform3D v39;
  CATransform3D b;
  CATransform3D a;
  CATransform3D v42;

  v5 = a1;
  v6 = (void *)MEMORY[0x24BDD1968];
  v7 = a2[5];
  *(_OWORD *)&a.m31 = a2[4];
  *(_OWORD *)&a.m33 = v7;
  v8 = a2[7];
  *(_OWORD *)&a.m41 = a2[6];
  *(_OWORD *)&a.m43 = v8;
  v9 = a2[1];
  *(_OWORD *)&a.m11 = *a2;
  *(_OWORD *)&a.m13 = v9;
  v10 = a2[3];
  *(_OWORD *)&a.m21 = a2[2];
  *(_OWORD *)&a.m23 = v10;
  v11 = a3[7];
  *(_OWORD *)&b.m41 = a3[6];
  *(_OWORD *)&b.m43 = v11;
  v12 = a3[5];
  *(_OWORD *)&b.m31 = a3[4];
  *(_OWORD *)&b.m33 = v12;
  v13 = a3[3];
  *(_OWORD *)&b.m21 = a3[2];
  *(_OWORD *)&b.m23 = v13;
  v14 = a3[1];
  *(_OWORD *)&b.m11 = *a3;
  *(_OWORD *)&b.m13 = v14;
  v15 = CATransform3DEqualToTransform(&a, &b);
  v16 = (_OWORD *)MEMORY[0x24BDE5598];
  if (v15)
  {
    v17 = *(_OWORD *)(MEMORY[0x24BDE5598] + 80);
    *(_OWORD *)&v42.m31 = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
    *(_OWORD *)&v42.m33 = v17;
    v18 = *(_OWORD *)(MEMORY[0x24BDE5598] + 112);
    *(_OWORD *)&v42.m41 = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
    *(_OWORD *)&v42.m43 = v18;
    v19 = *(_OWORD *)(MEMORY[0x24BDE5598] + 16);
    *(_OWORD *)&v42.m11 = *MEMORY[0x24BDE5598];
    *(_OWORD *)&v42.m13 = v19;
    v20 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
    *(_OWORD *)&v42.m21 = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
    *(_OWORD *)&v42.m23 = v20;
  }
  else
  {
    v21 = a3[5];
    *(_OWORD *)&v38.m31 = a3[4];
    *(_OWORD *)&v38.m33 = v21;
    v22 = a3[7];
    *(_OWORD *)&v38.m41 = a3[6];
    *(_OWORD *)&v38.m43 = v22;
    v23 = a3[1];
    *(_OWORD *)&v38.m11 = *a3;
    *(_OWORD *)&v38.m13 = v23;
    v24 = a3[3];
    *(_OWORD *)&v38.m21 = a3[2];
    *(_OWORD *)&v38.m23 = v24;
    CATransform3DInvert(&v39, &v38);
    v25 = a2[5];
    *(_OWORD *)&v37.m31 = a2[4];
    *(_OWORD *)&v37.m33 = v25;
    v26 = a2[7];
    *(_OWORD *)&v37.m41 = a2[6];
    *(_OWORD *)&v37.m43 = v26;
    v27 = a2[1];
    *(_OWORD *)&v37.m11 = *a2;
    *(_OWORD *)&v37.m13 = v27;
    v28 = a2[3];
    *(_OWORD *)&v37.m21 = a2[2];
    *(_OWORD *)&v37.m23 = v28;
    CATransform3DConcat(&v42, &v39, &v37);
  }
  objc_msgSend(v6, "valueWithCATransform3D:", &v42);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFromValue:", v29);

  v30 = v16[5];
  v36[4] = v16[4];
  v36[5] = v30;
  v31 = v16[7];
  v36[6] = v16[6];
  v36[7] = v31;
  v32 = v16[1];
  v36[0] = *v16;
  v36[1] = v32;
  v33 = v16[3];
  v36[2] = v16[2];
  v36[3] = v33;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCATransform3D:", v36);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setToValue:", v34);

  return v5;
}

void std::vector<UIView * {__strong}>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
}

void sub_209E0AFE0(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8B8] + 16);
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<UIView * {__strong}>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(8 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

uint64_t std::__split_buffer<UIView * {__strong}>::~__split_buffer(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 8;

  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void **std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,UIView * {__strong}*,UIView * {__strong}*,UIView * {__strong}*,0>(void **a1, void **a2, void **a3)
{
  void **v4;
  void *v6;
  void *v7;

  v4 = a1;
  if (a1 != a2)
  {
    do
    {
      v6 = *v4;
      *v4++ = 0;
      v7 = *a3;
      *a3++ = v6;

    }
    while (v4 != a2);
    return a2;
  }
  return v4;
}

void ___ZZ48__LAUIPearlGlyphLabel__applyVisibilityAnimated__ENK3__2cvU13block_pointerFvvEEv_block_invoke(uint64_t a1)
{
  -[LAUIPearlGlyphLabel _applyVisibilityAnimated:]::$_2::operator()(a1 + 32);
}

__n128 __copy_helper_block_ea8_32c61_ZTSKZ48__LAUIPearlGlyphLabel__applyVisibilityAnimated__E3__2(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int16 v5;
  __int128 v6;

  objc_copyWeak((id *)(a1 + 32), (id *)(a2 + 32));
  v5 = *(_WORD *)(a2 + 40);
  *(_BYTE *)(a1 + 48) = 0;
  *(_WORD *)(a1 + 40) = v5;
  *(_BYTE *)(a1 + 104) = 0;
  if (*(_BYTE *)(a2 + 104))
  {
    v6 = *(_OWORD *)(a2 + 64);
    *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 64) = v6;
    *(_QWORD *)(a1 + 80) = *(id *)(a2 + 80);
    result = *(__n128 *)(a2 + 88);
    *(__n128 *)(a1 + 88) = result;
    *(_BYTE *)(a1 + 104) = 1;
  }
  return result;
}

void __destroy_helper_block_ea8_32c61_ZTSKZ48__LAUIPearlGlyphLabel__applyVisibilityAnimated__E3__2(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 104))

  objc_destroyWeak((id *)(a1 + 32));
}

void std::vector<UIView * {__strong}>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  char *v2;
  char *v4;
  void *v5;
  void *v6;

  v1 = *a1;
  v2 = (char *)**a1;
  if (v2)
  {
    v4 = (char *)v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v6 = (void *)*((_QWORD *)v4 - 1);
        v4 -= 8;

      }
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t *std::__tree<std::__value_type<CALayer *,CALayer * {__strong}>,std::__map_value_compare<CALayer * {__strong},std::__map_value_compare,std::less<CALayer * {__strong}>,true>,std::allocator<std::__map_value_compare>>::__emplace_unique_key_args<CALayer * {__strong},std::piecewise_construct_t const&,std::tuple<CALayer * const&>,CALayer * const<>>(uint64_t **a1, unint64_t *a2, uint64_t a3, uint64_t **a4)
{
  uint64_t *v6;
  uint64_t **v7;
  unint64_t v8;
  uint64_t **v9;
  unint64_t v10;
  uint64_t *v11;

  v7 = a1 + 1;
  v6 = a1[1];
  if (v6)
  {
    v8 = *a2;
    while (1)
    {
      while (1)
      {
        v9 = (uint64_t **)v6;
        v10 = v6[4];
        if (v8 >= v10)
          break;
        v6 = *v9;
        v7 = v9;
        if (!*v9)
          goto LABEL_10;
      }
      if (v10 >= v8)
        break;
      v6 = v9[1];
      if (!v6)
      {
        v7 = v9 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    v9 = a1 + 1;
LABEL_10:
    v11 = (uint64_t *)operator new(0x30uLL);
    v11[4] = **a4;
    v11[5] = 0;
    std::__tree<std::__value_type<CALayer *,CALayer * {__strong}>,std::__map_value_compare<CALayer * {__strong},std::__map_value_compare,std::less<CALayer * {__strong}>,true>,std::allocator<std::__map_value_compare>>::__insert_node_at(a1, (uint64_t)v9, v7, v11);
    return v11;
  }
  return (uint64_t *)v9;
}

uint64_t *std::__tree<std::__value_type<CALayer *,CALayer * {__strong}>,std::__map_value_compare<CALayer * {__strong},std::__map_value_compare,std::less<CALayer * {__strong}>,true>,std::allocator<std::__map_value_compare>>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  uint64_t *v5;
  uint64_t *result;

  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *v4;
  _BYTE *v5;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t **v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  *((_BYTE *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      v2 = (uint64_t *)a2[2];
      if (*((_BYTE *)v2 + 24))
        return result;
      v3 = (uint64_t *)v2[2];
      v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), v5 = (_BYTE *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            v9 = (uint64_t **)a2[2];
          }
          else
          {
            v9 = (uint64_t **)v2[1];
            v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(_QWORD *)(v2[2] + 8 * (*(_QWORD *)v2[2] != (_QWORD)v2)) = v9;
            *v9 = v2;
            v2[2] = (uint64_t)v9;
            v3 = v9[2];
            v2 = (uint64_t *)*v3;
          }
          *((_BYTE *)v9 + 24) = 1;
          *((_BYTE *)v3 + 24) = 0;
          v13 = v2[1];
          *v3 = v13;
          if (v13)
            *(_QWORD *)(v13 + 16) = v3;
          v2[2] = v3[2];
          *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          v11 = a2[1];
          *v2 = v11;
          if (v11)
          {
            *(_QWORD *)(v11 + 16) = v2;
            v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(_QWORD *)(v2[2] + 8 * (*(_QWORD *)v2[2] != (_QWORD)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((_BYTE *)a2 + 24) = 1;
        *((_BYTE *)v3 + 24) = 0;
        v2 = (uint64_t *)v3[1];
        v12 = *v2;
        v3[1] = *v2;
        if (v12)
          *(_QWORD *)(v12 + 16) = v3;
        v2[2] = v3[2];
        *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
        *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((_BYTE *)v2 + 24) = 1;
      a2 = v3;
      *((_BYTE *)v3 + 24) = v3 == result;
      *v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

void std::__tree<std::__value_type<CALayer *,CALayer * {__strong}>,std::__map_value_compare<CALayer * {__strong},std::__map_value_compare,std::less<CALayer * {__strong}>,true>,std::allocator<std::__map_value_compare>>::destroy(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<CALayer *,CALayer * {__strong}>,std::__map_value_compare<CALayer * {__strong},std::__map_value_compare,std::less<CALayer * {__strong}>,true>,std::allocator<std::__map_value_compare>>::destroy(a1, *a2);
    std::__tree<std::__value_type<CALayer *,CALayer * {__strong}>,std::__map_value_compare<CALayer * {__strong},std::__map_value_compare,std::less<CALayer * {__strong}>,true>,std::allocator<std::__map_value_compare>>::destroy(a1, a2[1]);

    operator delete(a2);
  }
}

void sub_209E0B89C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_209E0B938(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;

  a9.super_class = (Class)LAUIHorizontalArrowView;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_209E0BA14(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void LAUI_CA_utilities::periodic_animation_state::detach_animation(id *this)
{
  id WeakRetained;
  id v3;

  LAUI_CA_utilities::periodic_animation_state::clear_removal_timer((LAUI_CA_utilities::periodic_animation_state *)this);
  if (this[1])
  {
    WeakRetained = objc_loadWeakRetained(this + 2);
    objc_msgSend(WeakRetained, "removeAnimationForKey:", this[1]);

    objc_storeWeak(this + 2, 0);
    v3 = this[1];
    this[1] = 0;

  }
}

void sub_209E0C53C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,uint64_t a21,char a22)
{
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  if (a22)
  _Unwind_Resume(a1);
}

void sub_209E0C89C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_209E0CAE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak((id *)&a9);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_209E0CB80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void __copy_helper_block_ea8_32c65_ZTSKZ52__LAUIHorizontalArrowView__updateAnimatingAnimated__E3__3(uint64_t a1, uint64_t a2)
{
  objc_copyWeak((id *)(a1 + 32), (id *)(a2 + 32));
}

void __destroy_helper_block_ea8_32c65_ZTSKZ52__LAUIHorizontalArrowView__updateAnimatingAnimated__E3__3(uint64_t a1)
{
  objc_destroyWeak((id *)(a1 + 32));
}

void sub_209E0CDC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v14 = v13;

  _Unwind_Resume(a1);
}

void sub_209E0D1A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void LAUI_CA_utilities::periodic_animation_state::attach_animation(id *this, CALayer *a2, CAAnimation *a3, NSString *a4)
{
  CAAnimation *v7;
  NSString *v8;
  uint64_t v9;
  id v10;
  CALayer *obj;

  obj = a2;
  v7 = a3;
  v8 = a4;
  LAUI_CA_utilities::periodic_animation_state::detach_animation(this);
  if (v7 && v8)
  {
    objc_storeWeak(this + 2, obj);
    v9 = -[NSString copy](v8, "copy");
    v10 = this[1];
    this[1] = (id)v9;

    -[CALayer addAnimation:forKey:](obj, "addAnimation:forKey:", v7, v8);
  }

}

void sub_209E0D3A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_209E0D61C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void LAUI_CA_utilities::periodic_animation_state::clear_removal_timer(LAUI_CA_utilities::periodic_animation_state *this)
{
  NSObject *v2;
  void *v3;

  v2 = *((_QWORD *)this + 3);
  if (v2)
  {
    dispatch_source_cancel(v2);
    v3 = (void *)*((_QWORD *)this + 3);
    *((_QWORD *)this + 3) = 0;

  }
}

id LAUILayerAddAdditiveAnimation(CALayer *a1, NSString *a2, CAAnimation *a3)
{
  CALayer *v5;
  NSString *v6;
  CAAnimation *v7;
  CAAnimation *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSString *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  v8 = v7;
  v9 = 0;
  if (v5 && v7)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "unsignedIntegerValue");

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    -[CALayer animationKeys](v5, "animationKeys");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v22;
LABEL_5:
      v15 = 0;
      while (1)
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(v12);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v15), "hasPrefix:", CFSTR("com.apple.laui.additive")) & 1) != 0)
          break;
        if (v13 == ++v15)
        {
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
          if (v13)
            goto LABEL_5;
          goto LABEL_11;
        }
      }
    }
    else
    {
LABEL_11:
      v11 = 0;
    }

    v16 = (void *)MEMORY[0x24BDD17C8];
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("%@.%lu"), v18, v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v11 + 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[CALayer addAnimation:forKey:](v5, "addAnimation:forKey:", v8, v9);
  }

  return v9;
}

void sub_209E0DE5C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

__CFString *`anonymous namespace'::prefix_for_key_path(_anonymous_namespace_ *this, NSString *a2)
{
  _anonymous_namespace_ *v2;
  __CFString *v3;

  v2 = this;
  v3 = CFSTR("com.apple.laui.additive");
  if (-[_anonymous_namespace_ length](v2, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.laui.additive"), v2);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

void sub_209E0DF28(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void LAUILayerRemoveAdditiveAnimations(CALayer *a1, NSString *a2)
{
  CALayer *v3;
  NSString *v4;
  NSString *v5;
  NSString *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  v6 = v4;
  if (v3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[CALayer animationKeys](v3, "animationKeys", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v9);
          v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          if (objc_msgSend(v13, "hasPrefix:", v7))
            -[CALayer removeAnimationForKey:](v3, "removeAnimationForKey:", v13);
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v10);
    }

  }
}

void sub_209E0E090(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

double LAUILayerAnimationElapsedDuration(CALayer *a1, CAAnimation *a2)
{
  CALayer *v3;
  CAAnimation *v4;
  CAAnimation *v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  v6 = 0.0;
  if (v3 && v4)
  {
    -[CALayer convertTime:fromLayer:](v3, "convertTime:fromLayer:", 0, CACurrentMediaTime());
    v8 = v7;
    -[CAAnimation beginTime](v5, "beginTime");
    v6 = v8 - v9;
  }

  return v6;
}

void sub_209E0E150(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

double LAUILayerAnimationRemainingDuration(CALayer *a1, CAAnimation *a2)
{
  CALayer *v3;
  CAAnimation *v4;
  CAAnimation *v5;
  double v6;
  float v7;
  float v8;
  double v9;
  double v10;
  long double v11;
  double v12;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  v6 = 0.0;
  if (v3 && v4)
  {
    -[CAAnimation repeatCount](v4, "repeatCount");
    v8 = v7;
    -[CAAnimation duration](v5, "duration");
    v10 = v9;
    v11 = LAUILayerAnimationElapsedDuration(v3, v5);
    if (-[CAAnimation autoreverses](v5, "autoreverses"))
      v10 = v10 + v10;
    if (v8 > 0.0)
    {
      if (v8 >= 3.4028e38)
        v11 = fmod(v11, v10);
      else
        v10 = (v8 + 1.0) * v10;
    }
    v12 = v10 - v11;
    if (v10 - v11 < 0.0)
      v12 = 0.0;
    if (*(uint64_t *)&v12 > -1 && ((*(_QWORD *)&v12 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 < 0x3FF
      || (unint64_t)(*(_QWORD *)&v12 - 1) < 0xFFFFFFFFFFFFFLL
      || (*(_QWORD *)&v12 & 0x7FFFFFFFFFFFFFFFLL) == 0)
    {
      v6 = v12;
    }
    else
    {
      v6 = 0.0;
    }
  }

  return v6;
}

void sub_209E0E27C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

double LAUILayerAnimationElapsedDuration(CALayer *a1, NSString *a2)
{
  CALayer *v3;
  CAAnimation *v4;
  double v5;

  v3 = a1;
  -[CALayer animationForKey:](v3, "animationForKey:", a2);
  v4 = (CAAnimation *)objc_claimAutoreleasedReturnValue();
  v5 = LAUILayerAnimationElapsedDuration(v3, v4);

  return v5;
}

void sub_209E0E2F8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

double LAUILayerAnimationRemainingDuration(CALayer *a1, NSString *a2)
{
  CALayer *v3;
  CAAnimation *v4;
  double v5;

  v3 = a1;
  -[CALayer animationForKey:](v3, "animationForKey:", a2);
  v4 = (CAAnimation *)objc_claimAutoreleasedReturnValue();
  v5 = LAUILayerAnimationRemainingDuration(v3, v4);

  return v5;
}

void sub_209E0E374(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void *LAUI_CA_utilities::spring_factory::create_animation(LAUI_CA_utilities::spring_factory *this, NSString *a2)
{
  NSString *v3;
  void *v4;
  double v5;

  v3 = a2;
  objc_msgSend(MEMORY[0x24BDE5760], "animationWithKeyPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAdditive:", 1);
  objc_msgSend(v4, "setMass:", *(double *)this);
  objc_msgSend(v4, "setStiffness:", *((double *)this + 1));
  objc_msgSend(v4, "setDamping:", *((double *)this + 2));
  objc_msgSend(v4, "setVelocity:", *((double *)this + 3));
  objc_msgSend(v4, "setTimingFunction:", *((_QWORD *)this + 4));
  objc_msgSend(v4, "setBeginTimeMode:", *MEMORY[0x24BDE5858]);
  if (*((_BYTE *)this + 40))
  {
    v5 = *((double *)this + 6);
  }
  else
  {
    *((_BYTE *)this + 40) = 1;
    objc_msgSend(v4, "durationForEpsilon:", 0.001);
    *((double *)this + 6) = v5;
  }
  objc_msgSend(v4, "setDuration:", v5);

  return v4;
}

void sub_209E0E4E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  void *v9;

  a9.super_class = (Class)LAUIAnimationDelegate;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_209E0E574(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_209E0E5F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_209E0E678(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_209E0E750(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_209E0E810(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_209E0E8B0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_209E0E974(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_209E0F0C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

CGColorSpaceRef `anonymous namespace'::create_default_color_space(_anonymous_namespace_ *this, MTLPixelFormat a2)
{
  CFStringRef *v2;

  v2 = (CFStringRef *)MEMORY[0x24BDBF308];
  if ((uint64_t)this <= 114)
  {
    if (this == (_anonymous_namespace_ *)80)
      goto LABEL_9;
    if (this != (_anonymous_namespace_ *)81)
      return 0;
    goto LABEL_8;
  }
  if (this != (_anonymous_namespace_ *)115 && this != (_anonymous_namespace_ *)552)
  {
    if (this != (_anonymous_namespace_ *)553)
      return 0;
LABEL_8:
    v2 = (CFStringRef *)MEMORY[0x24BDBF318];
  }
LABEL_9:
  if (*v2)
    return CGColorSpaceCreateWithName(*v2);
  return 0;
}

void sub_209E0F18C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)LAUIMetalRenderLoop;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_209E0F38C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_209E0F6D0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_209E0F730(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_209E0F7A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_209E0F840(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_209E0F998(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_209E0FA20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;

  a9.super_class = (Class)LAUIRenderLoop;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_209E0FBDC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_209E0FD54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_209E0FE88(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_209E0FFE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_209E10088(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_209E10148(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

id getLAErrorHelperClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getLAErrorHelperClass_softClass;
  v7 = getLAErrorHelperClass_softClass;
  if (!getLAErrorHelperClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getLAErrorHelperClass_block_invoke;
    v3[3] = &unk_24C27ED70;
    v3[4] = &v4;
    __getLAErrorHelperClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_209E10660(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209E10914(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id LA_LOG_LAUIAuthenticationCore()
{
  if (LA_LOG_LAUIAuthenticationCore_once != -1)
    dispatch_once(&LA_LOG_LAUIAuthenticationCore_once, &__block_literal_global_145);
  return (id)LA_LOG_LAUIAuthenticationCore_log;
}

void sub_209E10FFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_209E115D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_209E1169C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_209E117E8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_209E11DB8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

Class __getLAErrorHelperClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!SharedUtilsLibraryCore_frameworkLibrary)
  {
    SharedUtilsLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!SharedUtilsLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("LAErrorHelper");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getLAErrorHelperClass_block_invoke_cold_1();
    free(v3);
  }
  getLAErrorHelperClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

double LAUI_uniform_cubic_b_spline_renderer::spline_t::instance_t::state_t::transform(float32x4_t *this)
{
  float32x4_t v2;
  float32x4_t v3;
  float32x4_t v4;
  float32x4_t v5;
  uint64_t v6;
  __int128 v7;
  unint64_t v8;
  float32x4_t v9;
  int8x16_t v10;
  float32x4_t v11;
  uint32x4_t v12;
  float32x4_t v13;
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  float32x4_t v20;
  float32x4_t v21;
  float32x4_t v22;
  float32x4_t v23;
  uint64_t v24;
  float32x4_t v25;
  float32x4_t v26;
  __int128 v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  float32x4_t v33;
  float32x4_t v34;
  float32x4_t v35;
  float32x4_t v36;
  __int128 v37;
  uint64_t v38;
  float32x4_t v39;
  float32x4_t v40;
  float32x4_t v41;
  float32x4_t v42;
  float32x4_t v44;
  float32x4_t v45;
  float32x4_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;

  *(double *)v2.i64 = simd_matrix4x4(this[3]);
  v6 = 0;
  *(_QWORD *)&v7 = 0;
  LODWORD(v8) = 0;
  HIDWORD(v8) = HIDWORD(this[4].i64[0]);
  *((_QWORD *)&v7 + 1) = this[4].i64[1];
  v51 = *(_OWORD *)&this[4];
  v52 = v8;
  v53 = v7;
  v54 = xmmword_209E30C90;
  do
  {
    *(__int128 *)((char *)&v55 + v6) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v2, COERCE_FLOAT(*(__int128 *)((char *)&v51 + v6))), v3, *(float32x2_t *)((char *)&v51 + v6), 1), v4, *(float32x4_t *)((char *)&v51 + v6), 2), v5, *(float32x4_t *)((char *)&v51 + v6), 3);
    v6 += 16;
  }
  while (v6 != 64);
  v9 = this[1];
  v10 = (int8x16_t)vmulq_f32(v9, (float32x4_t)xmmword_209E30C90);
  if (vaddv_f32(vadd_f32(*(float32x2_t *)v10.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v10, v10, 8uLL))) == 1.0)
  {
    v24 = 0;
    v25 = *this;
    v25.i32[3] = 1.0;
    v51 = v55;
    v52 = v56;
    v53 = v57;
    v54 = v58;
    do
    {
      *(__int128 *)((char *)&v55 + v24) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_209E30CA0, COERCE_FLOAT(*(__int128 *)((char *)&v51 + v24))), (float32x4_t)xmmword_209E30CB0, *(float32x2_t *)((char *)&v51 + v24), 1), (float32x4_t)xmmword_209E30CC0, *(float32x4_t *)((char *)&v51 + v24), 2), v25, *(float32x4_t *)((char *)&v51 + v24), 3);
      v24 += 16;
    }
    while (v24 != 64);
  }
  else
  {
    v47 = v55;
    v48 = v56;
    v49 = v57;
    v50 = v58;
    v11 = this[2];
    v12 = (uint32x4_t)vmvnq_s8((int8x16_t)vceqzq_f32(v11));
    v12.i32[3] = v12.i32[2];
    v13 = *this;
    if ((vmaxvq_u32(v12) & 0x80000000) != 0)
    {
      v46 = this[2];
      v26 = vsubq_f32(v13, v11);
      v26.i32[3] = 1.0;
      v44 = v26;
      *(double *)&v27 = simd_matrix4x4(v9);
      v28 = 0;
      v51 = v27;
      v52 = v29;
      v53 = v30;
      v54 = v31;
      do
      {
        *(__int128 *)((char *)&v55 + v28) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_209E30CA0, COERCE_FLOAT(*(__int128 *)((char *)&v51 + v28))), (float32x4_t)xmmword_209E30CB0, *(float32x2_t *)((char *)&v51 + v28), 1), (float32x4_t)xmmword_209E30CC0, *(float32x4_t *)((char *)&v51 + v28), 2), v44, *(float32x4_t *)((char *)&v51 + v28), 3);
        v28 += 16;
      }
      while (v28 != 64);
      v32 = 0;
      v33 = (float32x4_t)v55;
      v34 = (float32x4_t)v56;
      v35 = (float32x4_t)v57;
      v36 = (float32x4_t)v58;
      v37 = (__int128)v46;
      HIDWORD(v37) = 1.0;
      v51 = xmmword_209E30CA0;
      v52 = xmmword_209E30CB0;
      v53 = xmmword_209E30CC0;
      v54 = v37;
      do
      {
        *(__int128 *)((char *)&v55 + v32) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v33, COERCE_FLOAT(*(__int128 *)((char *)&v51 + v32))), v34, *(float32x2_t *)((char *)&v51 + v32), 1), v35, *(float32x4_t *)((char *)&v51 + v32), 2), v36, *(float32x4_t *)((char *)&v51 + v32), 3);
        v32 += 16;
      }
      while (v32 != 64);
      v38 = 0;
      v39 = (float32x4_t)v55;
      v40 = (float32x4_t)v56;
      v41 = (float32x4_t)v57;
      v42 = (float32x4_t)v58;
      v51 = v47;
      v52 = v48;
      v53 = v49;
      v54 = v50;
      do
      {
        *(__int128 *)((char *)&v55 + v38) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v39, COERCE_FLOAT(*(__int128 *)((char *)&v51 + v38))), v40, *(float32x2_t *)((char *)&v51 + v38), 1), v41, *(float32x4_t *)((char *)&v51 + v38), 2), v42, *(float32x4_t *)((char *)&v51 + v38), 3);
        v38 += 16;
      }
      while (v38 != 64);
    }
    else
    {
      v13.i32[3] = 1.0;
      v45 = v13;
      *(double *)&v14 = simd_matrix4x4(v9);
      v15 = 0;
      v51 = v14;
      v52 = v16;
      v53 = v17;
      v54 = v18;
      do
      {
        *(__int128 *)((char *)&v55 + v15) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_209E30CA0, COERCE_FLOAT(*(__int128 *)((char *)&v51 + v15))), (float32x4_t)xmmword_209E30CB0, *(float32x2_t *)((char *)&v51 + v15), 1), (float32x4_t)xmmword_209E30CC0, *(float32x4_t *)((char *)&v51 + v15), 2), v45, *(float32x4_t *)((char *)&v51 + v15), 3);
        v15 += 16;
      }
      while (v15 != 64);
      v19 = 0;
      v20 = (float32x4_t)v55;
      v21 = (float32x4_t)v56;
      v22 = (float32x4_t)v57;
      v23 = (float32x4_t)v58;
      v51 = v47;
      v52 = v48;
      v53 = v49;
      v54 = v50;
      do
      {
        *(__int128 *)((char *)&v55 + v19) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v20, COERCE_FLOAT(*(__int128 *)((char *)&v51 + v19))), v21, *(float32x2_t *)((char *)&v51 + v19), 1), v22, *(float32x4_t *)((char *)&v51 + v19), 2), v23, *(float32x4_t *)((char *)&v51 + v19), 3);
        v19 += 16;
      }
      while (v19 != 64);
    }
  }
  return *(double *)&v55;
}

double simd_matrix4x4(float32x4_t a1)
{
  float v10;
  double v11;

  _S3 = a1.i32[1];
  _S5 = a1.i32[2];
  __asm { FMLS            S1, S5, V0.S[2] }
  _S7 = a1.i32[3];
  __asm { FMLA            S1, S7, V0.S[3] }
  v10 = vmlas_n_f32(vmuls_lane_f32(a1.f32[2], a1, 3), a1.f32[1], a1.f32[0]);
  LODWORD(v11) = _S1;
  *((float *)&v11 + 1) = v10 + v10;
  __asm
  {
    FMLA            S6, S3, V0.S[1]
    FMLA            S6, S7, V0.S[3]
    FMLS            S6, S0, V0.S[0]
    FMLA            S18, S5, V0.S[1]
    FMLA            S17, S0, V0.S[2]
    FMLA            S16, S5, V0.S[1]
    FMLA            S7, S5, V0.S[2]
    FMLS            S7, S0, V0.S[0]
    FMLS            S7, S3, V0.S[1]
  }
  return v11;
}

void LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(void *a1@<X0>, LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t *a2@<X8>)
{
  id v3;
  id v4;
  unsigned __int8 v5;
  id v6;
  void *v7;
  id WeakRetained;
  MTLDepthStencilState *v9;
  MTLDepthStencilState *depth_stencil_state;
  MTLComputePipelineState *v11;
  MTLComputePipelineState *tesselation_factor_pipeline;
  MTLRenderPipelineState *v13;
  MTLRenderPipelineState *tube_pipeline;
  uint64_t i;
  MTLRenderPipelineState *v16;
  MTLRenderPipelineState *v17;
  uint64_t j;
  MTLRenderPipelineState *v19;
  MTLRenderPipelineState *v20;
  MTLComputePipelineState *v21;
  MTLComputePipelineState *horizontal_blur_pipeline;
  MTLComputePipelineState *v23;
  MTLComputePipelineState *vertical_blur_pipeline;
  MTLComputePipelineState *v25;
  MTLComputePipelineState *accumulator_pipeline;
  id v27;
  void *v28;
  void *v29;
  MTLRenderPipelineState *v30;
  MTLRenderPipelineState *v31;
  void *v32;
  void *v33;
  MTLRenderPipelineState *v34;
  MTLRenderPipelineState *v35;
  void *v36;
  void *v37;
  MTLRenderPipelineState *v38;
  MTLRenderPipelineState *v39;
  void *v40;
  void *v41;
  MTLRenderPipelineState *v42;
  MTLRenderPipelineState *v43;
  void *v44;
  void *v45;
  MTLRenderPipelineState *v46;
  MTLRenderPipelineState *v47;
  void *v48;
  void *v49;
  MTLRenderPipelineState *v50;
  MTLRenderPipelineState *v51;
  void *v52;
  void *v53;
  MTLRenderPipelineState *v54;
  MTLRenderPipelineState *v55;
  void *v56;
  void *v57;
  id v58;
  id v59;
  void *v60;
  MTLComputePipelineState *v61;
  MTLComputePipelineState *v62;
  MTLComputePipelineState *v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  MTLComputePipelineState *v68;
  MTLComputePipelineState *v69;
  MTLComputePipelineState *v70;
  void *v71;
  void *v72;
  id v73;
  void *v74;
  MTLComputePipelineState *v75;
  MTLComputePipelineState *v76;
  MTLComputePipelineState *v77;
  void *v78;
  void *v79;
  id v80;
  void *v81;
  MTLComputePipelineState *v82;
  MTLComputePipelineState *v83;
  MTLComputePipelineState *v84;
  char v85;
  uint64_t k;
  void **v87;
  id v88;
  id v89;
  _QWORD v90[5];
  id v91;
  void *v92;
  void *v93;
  id v94;
  char v95;
  id v96;
  id location;
  shared_state_t v98;
  char v99;

  v3 = a1;
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "supportsFamily:", 1003) & 1) != 0)
  {
    if ((v5 & 1) == 0
    {
      LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::lock = 0;
    }
    v99 = 1;
    v6 = LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::shared_state_t((uint64_t)&v98, v4);
    v7 = (void *)MEMORY[0x20BD1B564](v6);
    os_unfair_lock_lock((os_unfair_lock_t)&LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::lock);
    WeakRetained = objc_loadWeakRetained(&LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::device);

    if (WeakRetained != v4)
    {
      objc_storeWeak(&LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::device, v4);
      objc_storeWeak(&LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::depth_stencil_state, 0);
      objc_storeWeak(&LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::tesselation_factor_pipeline, 0);
      objc_storeWeak(&LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::tube_pipeline, 0);
      location = 0;
      std::array<objc_object  {objcproto22MTLRenderPipelineState}* {__weak},3ul>::fill[abi:ne180100]((uint64_t)&LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::begin_cap_pipelines, &location);
      objc_destroyWeak(&location);
      v96 = 0;
      std::array<objc_object  {objcproto22MTLRenderPipelineState}* {__weak},3ul>::fill[abi:ne180100]((uint64_t)&LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::end_cap_pipelines, &v96);
      objc_destroyWeak(&v96);
      objc_storeWeak(&LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::horizontal_blur_pipeline, 0);
      objc_storeWeak(&LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::vertical_blur_pipeline, 0);
      objc_storeWeak(&LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::accumulator_pipeline, 0);
    }
    v9 = (MTLDepthStencilState *)objc_loadWeakRetained(&LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::depth_stencil_state);
    depth_stencil_state = v98._depth_stencil_state;
    v98._depth_stencil_state = v9;

    v11 = (MTLComputePipelineState *)objc_loadWeakRetained(&LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::tesselation_factor_pipeline);
    tesselation_factor_pipeline = v98._tesselation_factor_pipeline;
    v98._tesselation_factor_pipeline = v11;

    v13 = (MTLRenderPipelineState *)objc_loadWeakRetained(&LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::tube_pipeline);
    tube_pipeline = v98._tube_pipeline;
    v98._tube_pipeline = v13;

    for (i = 0; i != 3; ++i)
    {
      v16 = (MTLRenderPipelineState *)objc_loadWeakRetained((id *)((char *)&LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::begin_cap_pipelines
                                                                 + i * 8));
      v17 = v98._begin_cap_pipelines.__elems_[i];
      v98._begin_cap_pipelines.__elems_[i] = v16;

    }
    for (j = 0; j != 3; ++j)
    {
      v19 = (MTLRenderPipelineState *)objc_loadWeakRetained((id *)((char *)&LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::end_cap_pipelines
                                                                 + j * 8));
      v20 = v98._end_cap_pipelines.__elems_[j];
      v98._end_cap_pipelines.__elems_[j] = v19;

    }
    v21 = (MTLComputePipelineState *)objc_loadWeakRetained(&LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::horizontal_blur_pipeline);
    horizontal_blur_pipeline = v98._horizontal_blur_pipeline;
    v98._horizontal_blur_pipeline = v21;

    v23 = (MTLComputePipelineState *)objc_loadWeakRetained(&LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::vertical_blur_pipeline);
    vertical_blur_pipeline = v98._vertical_blur_pipeline;
    v98._vertical_blur_pipeline = v23;

    v25 = (MTLComputePipelineState *)objc_loadWeakRetained(&LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::accumulator_pipeline);
    accumulator_pipeline = v98._accumulator_pipeline;
    v98._accumulator_pipeline = v25;

    v95 = 0;
    v93 = 0;
    v94 = 0;
    v92 = 0;
    v90[0] = &v95;
    v90[1] = &v99;
    v90[2] = &v94;
    v90[3] = &v93;
    v90[4] = &v92;
    v91 = v4;
    v89 = 0;
    v87 = &v89;
    v27 = v91;
    v88 = v27;
    if (!v98._tube_pipeline
      && LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::$_1::operator()((uint64_t)v90))
    {
      LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::$_2::operator()(&v87, v93, v92);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)objc_msgSend(v93, "newFunctionWithName:", CFSTR("tessellation_vertex_main"));
      objc_msgSend(v28, "setVertexFunction:", v29);

      v30 = (MTLRenderPipelineState *)objc_msgSend(v27, "newRenderPipelineStateWithDescriptor:error:", v28, 0);
      v31 = v98._tube_pipeline;
      v98._tube_pipeline = v30;

      objc_storeWeak(&LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::tube_pipeline, v30);
    }
    if (!v98._begin_cap_pipelines.__elems_[0]
      && LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::$_1::operator()((uint64_t)v90))
    {
      LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::$_2::operator()(&v87, v93, v92);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (void *)objc_msgSend(v93, "newFunctionWithName:", CFSTR("tessellation_vertex_begin_0"));
      objc_msgSend(v32, "setVertexFunction:", v33);

      v34 = (MTLRenderPipelineState *)objc_msgSend(v27, "newRenderPipelineStateWithDescriptor:error:", v32, 0);
      v35 = v98._begin_cap_pipelines.__elems_[0];
      v98._begin_cap_pipelines.__elems_[0] = v34;

      objc_storeWeak(&LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::begin_cap_pipelines, v34);
    }
    if (!v98._begin_cap_pipelines.__elems_[1]
      && LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::$_1::operator()((uint64_t)v90))
    {
      LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::$_2::operator()(&v87, v93, v92);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = (void *)objc_msgSend(v93, "newFunctionWithName:", CFSTR("tessellation_vertex_begin_1"));
      objc_msgSend(v36, "setVertexFunction:", v37);

      v38 = (MTLRenderPipelineState *)objc_msgSend(v27, "newRenderPipelineStateWithDescriptor:error:", v36, 0);
      v39 = v98._begin_cap_pipelines.__elems_[1];
      v98._begin_cap_pipelines.__elems_[1] = v38;

      objc_storeWeak(&qword_2545B48E0, v38);
    }
    if (!v98._begin_cap_pipelines.__elems_[2]
      && LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::$_1::operator()((uint64_t)v90))
    {
      LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::$_2::operator()(&v87, v93, v92);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = (void *)objc_msgSend(v93, "newFunctionWithName:", CFSTR("tessellation_vertex_begin_2"));
      objc_msgSend(v40, "setVertexFunction:", v41);

      v42 = (MTLRenderPipelineState *)objc_msgSend(v27, "newRenderPipelineStateWithDescriptor:error:", v40, 0);
      v43 = v98._begin_cap_pipelines.__elems_[2];
      v98._begin_cap_pipelines.__elems_[2] = v42;

      objc_storeWeak(&qword_2545B48E8, v42);
    }
    if (!v98._end_cap_pipelines.__elems_[0]
      && LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::$_1::operator()((uint64_t)v90))
    {
      LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::$_2::operator()(&v87, v93, v92);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = (void *)objc_msgSend(v93, "newFunctionWithName:", CFSTR("tessellation_vertex_end_0"));
      objc_msgSend(v44, "setVertexFunction:", v45);

      v46 = (MTLRenderPipelineState *)objc_msgSend(v27, "newRenderPipelineStateWithDescriptor:error:", v44, 0);
      v47 = v98._end_cap_pipelines.__elems_[0];
      v98._end_cap_pipelines.__elems_[0] = v46;

      objc_storeWeak(&LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::end_cap_pipelines, v46);
    }
    if (!v98._end_cap_pipelines.__elems_[1]
      && LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::$_1::operator()((uint64_t)v90))
    {
      LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::$_2::operator()(&v87, v93, v92);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = (void *)objc_msgSend(v93, "newFunctionWithName:", CFSTR("tessellation_vertex_end_1"));
      objc_msgSend(v48, "setVertexFunction:", v49);

      v50 = (MTLRenderPipelineState *)objc_msgSend(v27, "newRenderPipelineStateWithDescriptor:error:", v48, 0);
      v51 = v98._end_cap_pipelines.__elems_[1];
      v98._end_cap_pipelines.__elems_[1] = v50;

      objc_storeWeak(&qword_2545B48F8, v50);
    }
    if (!v98._end_cap_pipelines.__elems_[2]
      && LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::$_1::operator()((uint64_t)v90))
    {
      LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::$_2::operator()(&v87, v93, v92);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = (void *)objc_msgSend(v93, "newFunctionWithName:", CFSTR("tessellation_vertex_end_2"));
      objc_msgSend(v52, "setVertexFunction:", v53);

      v54 = (MTLRenderPipelineState *)objc_msgSend(v27, "newRenderPipelineStateWithDescriptor:error:", v52, 0);
      v55 = v98._end_cap_pipelines.__elems_[2];
      v98._end_cap_pipelines.__elems_[2] = v54;

      objc_storeWeak(&qword_2545B4900, v54);
    }
    if (v98._tesselation_factor_pipeline
      || !LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::$_1::operator()((uint64_t)v90))
    {
      v59 = 0;
    }
    else
    {
      v56 = v93;
      v57 = v92;
      if (v56)
      {
        v58 = objc_alloc_init(MEMORY[0x24BDDD550]);
        v56 = v58;
        if (v57)
          objc_msgSend(v58, "setPipelineLibrary:", v57);
      }
      v59 = v56;

      v60 = (void *)objc_msgSend(v93, "newFunctionWithName:", CFSTR("tessellation_kernel_main"));
      objc_msgSend(v59, "setComputeFunction:", v60);

      v61 = (MTLComputePipelineState *)objc_msgSend(v27, "newComputePipelineStateWithDescriptor:options:reflection:error:", v59, 0, 0, 0);
      v62 = v98._tesselation_factor_pipeline;
      v98._tesselation_factor_pipeline = v61;
      v63 = v61;

      objc_storeWeak(&LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::tesselation_factor_pipeline, v63);
    }
    if (!v98._horizontal_blur_pipeline
      && LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::$_1::operator()((uint64_t)v90))
    {
      v64 = v93;
      v65 = v92;
      if (!v59)
      {
        if (v64)
        {
          v66 = objc_alloc_init(MEMORY[0x24BDDD550]);
          v59 = v66;
          if (v65)
            objc_msgSend(v66, "setPipelineLibrary:", v65);
        }
      }
      v59 = v59;

      v67 = (void *)objc_msgSend(v93, "newFunctionWithName:", CFSTR("linear_horizontal_blur"));
      objc_msgSend(v59, "setComputeFunction:", v67);

      v68 = (MTLComputePipelineState *)objc_msgSend(v27, "newComputePipelineStateWithDescriptor:options:reflection:error:", v59, 0, 0, 0);
      v69 = v98._horizontal_blur_pipeline;
      v98._horizontal_blur_pipeline = v68;
      v70 = v68;

      objc_storeWeak(&LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::horizontal_blur_pipeline, v70);
    }
    if (!v98._vertical_blur_pipeline
      && LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::$_1::operator()((uint64_t)v90))
    {
      v71 = v93;
      v72 = v92;
      if (!v59)
      {
        if (v71)
        {
          v73 = objc_alloc_init(MEMORY[0x24BDDD550]);
          v59 = v73;
          if (v72)
            objc_msgSend(v73, "setPipelineLibrary:", v72);
        }
      }
      v59 = v59;

      v74 = (void *)objc_msgSend(v93, "newFunctionWithName:", CFSTR("linear_vertical_blur"));
      objc_msgSend(v59, "setComputeFunction:", v74);

      v75 = (MTLComputePipelineState *)objc_msgSend(v27, "newComputePipelineStateWithDescriptor:options:reflection:error:", v59, 0, 0, 0);
      v76 = v98._vertical_blur_pipeline;
      v98._vertical_blur_pipeline = v75;
      v77 = v75;

      objc_storeWeak(&LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::vertical_blur_pipeline, v77);
    }
    if (!v98._accumulator_pipeline
      && LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::$_1::operator()((uint64_t)v90))
    {
      v78 = v93;
      v79 = v92;
      if (!v59)
      {
        if (v78)
        {
          v80 = objc_alloc_init(MEMORY[0x24BDDD550]);
          v59 = v80;
          if (v79)
            objc_msgSend(v80, "setPipelineLibrary:", v79);
        }
      }
      v59 = v59;

      v81 = (void *)objc_msgSend(v93, "newFunctionWithName:", CFSTR("composite_blurred_accumulate"));
      objc_msgSend(v59, "setComputeFunction:", v81);

      v82 = (MTLComputePipelineState *)objc_msgSend(v27, "newComputePipelineStateWithDescriptor:options:reflection:error:", v59, 0, 0, 0);
      v83 = v98._accumulator_pipeline;
      v98._accumulator_pipeline = v82;
      v84 = v82;

      objc_storeWeak(&LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::accumulator_pipeline, v84);
    }

    os_unfair_lock_unlock((os_unfair_lock_t)&LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::lock);
    objc_autoreleasePoolPop(v7);
    v85 = v99;
    if (v99)
    {
      LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::shared_state_t(a2, &v98);
      v85 = 1;
    }
    else
    {
      *(_BYTE *)a2 = 0;
    }
    *((_BYTE *)a2 + 104) = v85;

    for (k = 72; k != 48; k -= 8)
    do
    {

      k -= 8;
    }
    while (k != 24);

  }
  else
  {
    *(_BYTE *)a2 = 0;
    *((_BYTE *)a2 + 104) = 0;
  }

}

void sub_209E12F7C(void *a1)
{
  void *v1;

  __clang_call_terminate(a1);
}

void std::array<objc_object  {objcproto22MTLRenderPipelineState}* {__weak},3ul>::fill[abi:ne180100](uint64_t a1, id *location)
{
  uint64_t i;
  id WeakRetained;

  for (i = 0; i != 24; i += 8)
  {
    WeakRetained = objc_loadWeakRetained(location);
    objc_storeWeak((id *)(a1 + i), WeakRetained);

  }
}

BOOL LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::$_1::operator()(uint64_t a1)
{
  id WeakRetained;
  _BOOL8 result;
  uint64_t v4;
  void **v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  void **v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  id v46;

  if (**(_BYTE **)a1)
    return **(_BYTE **)(a1 + 8) != 0;
  **(_BYTE **)a1 = 1;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(void ***)(a1 + 16);
  v6 = *v5;
  *v5 = (void *)v4;

  v7 = **(_QWORD **)(a1 + 16);
  if (v7)
  {
    v8 = *(void **)(a1 + 40);
    v46 = 0;
    v9 = objc_msgSend(v8, "newDefaultLibraryWithBundle:error:", v7, &v46);
    v10 = v46;
    v11 = *(void ***)(a1 + 24);
    v12 = *v11;
    *v11 = (void *)v9;

    if (**(_QWORD **)(a1 + 24))
    {

      objc_msgSend(**(id **)(a1 + 16), "pathForResource:ofType:", CFSTR("LAUICubicBSplineRenderer"), CFSTR("pipelinelib"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        WeakRetained = objc_loadWeakRetained(&LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::device);
        v45 = 0;
        v14 = (void *)objc_msgSend(WeakRetained, "newPipelineLibraryWithFilePath:error:", v13, &v45);
        v15 = v45;
      }
      else
      {
        v15 = 0;
        v14 = 0;
      }
      objc_storeStrong(*(id **)(a1 + 32), v14);
      if (v13)
      {

        if (**(_QWORD **)(a1 + 32))
        {
LABEL_21:

          return **(_BYTE **)(a1 + 8) != 0;
        }
        v31 = os_log_create("com.apple.LocalAuthentication", "LAUICubicBSplineRenderer");
        if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
          LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::$_1::operator()((uint64_t)v15, v31, v32, v33, v34, v35, v36, v37);
      }
      else
      {
        v31 = os_log_create("com.apple.LocalAuthentication", "LAUICubicBSplineRenderer");
        if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
          LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::$_1::operator()(v31, v38, v39, v40, v41, v42, v43, v44);
      }

      goto LABEL_21;
    }
    v24 = os_log_create("com.apple.LocalAuthentication", "LAUICubicBSplineRenderer");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::$_1::operator()((uint64_t)v10, v24, v25, v26, v27, v28, v29, v30);

    **(_BYTE **)(a1 + 8) = 0;
    return 0;
  }
  else
  {
    v16 = os_log_create("com.apple.LocalAuthentication", "LAUICubicBSplineRenderer");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::$_1::operator()(v16, v17, v18, v19, v20, v21, v22, v23);

    result = 0;
    **(_BYTE **)(a1 + 8) = 0;
  }
  return result;
}

void sub_209E13264(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::$_2::operator()(void ***a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v21;

  v5 = a2;
  v6 = a3;
  v7 = **a1;
  if (v5 && !v7)
  {
    if (objc_msgSend(a1[1], "supportsTextureSampleCount:", 4))
      v8 = 4;
    else
      v8 = 1;
    v9 = objc_alloc_init(MEMORY[0x24BDDD770]);
    objc_msgSend(v9, "attributes");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFormat:", 30);
    objc_msgSend(v10, "setOffset:", 0);
    objc_msgSend(v10, "setBufferIndex:", 0);
    objc_msgSend(v9, "layouts");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setStride:", 16);
    objc_msgSend(v12, "setStepRate:", 1);
    objc_msgSend(v12, "setStepFunction:", 4);
    v13 = objc_alloc_init(MEMORY[0x24BDDD6B8]);
    v14 = v13;
    if (v6)
      objc_msgSend(v13, "setPipelineLibrary:", v6);
    v15 = (void *)objc_msgSend(v5, "newFunctionWithName:", CFSTR("tessellation_fragment_main"));
    objc_msgSend(v14, "setFragmentFunction:", v15);

    objc_msgSend(v14, "setVertexDescriptor:", v9);
    objc_msgSend(v14, "setRasterSampleCount:", v8);
    objc_msgSend(v14, "setMaxTessellationFactor:", 16);
    objc_msgSend(v14, "setTessellationFactorScaleEnabled:", 0);
    objc_msgSend(v14, "setTessellationFactorFormat:", 0);
    objc_msgSend(v14, "setTessellationControlPointIndexType:", 1);
    objc_msgSend(v14, "setTessellationFactorStepFunction:", 0);
    objc_msgSend(v14, "setTessellationOutputWindingOrder:", 0);
    objc_msgSend(v14, "setTessellationPartitionMode:", 3);
    objc_msgSend(v14, "colorAttachments");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setPixelFormat:", 80);

    objc_msgSend(v14, "setDepthAttachmentPixelFormat:", 0);
    v18 = **a1;
    **a1 = v14;

    v7 = **a1;
  }
  v19 = v7;

  return v19;
}

void sub_209E134C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

_QWORD *LAUI_uniform_cubic_b_spline_renderer::renderer_t::renderer_t(uint64_t a1, void *a2, const shared_state_t *a3, uint64_t a4)
{
  id v7;
  id v8;
  __int128 *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD *result;
  id v25;
  uint64_t v26;
  void *v27;
  int v28;
  uint64_t v29;
  _OWORD *v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;

  v7 = a2;
  *(_BYTE *)(a1 + 8) = 0;
  v8 = v7;
  *(_QWORD *)(a1 + 16) = v8;
  LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::shared_state_t((LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t *)(a1 + 24), a3);
  *(_BYTE *)(a1 + 128) = 0;
  v9 = (__int128 *)MEMORY[0x24BDAEDE8];
  v11 = *(_OWORD *)(MEMORY[0x24BDAEDE8] + 64);
  v10 = *(_OWORD *)(MEMORY[0x24BDAEDE8] + 80);
  v12 = *(_OWORD *)(MEMORY[0x24BDAEDE8] + 48);
  *(_OWORD *)(a1 + 208) = v11;
  *(_OWORD *)(a1 + 224) = v10;
  v14 = v9[6];
  v13 = v9[7];
  v15 = v9[5];
  *(_OWORD *)(a1 + 240) = v14;
  *(_OWORD *)(a1 + 256) = v13;
  *(_OWORD *)(a1 + 368) = v14;
  *(_OWORD *)(a1 + 384) = v13;
  *(_OWORD *)(a1 + 336) = v11;
  *(_OWORD *)(a1 + 352) = v10;
  v16 = v9[2];
  v17 = v9[3];
  v19 = *v9;
  v18 = v9[1];
  *(_OWORD *)(a1 + 176) = v16;
  *(_OWORD *)(a1 + 192) = v17;
  *(_OWORD *)(a1 + 304) = v16;
  *(_OWORD *)(a1 + 320) = v17;
  v20 = v9[1];
  v21 = v9[2];
  v22 = *v9;
  *(_OWORD *)(a1 + 144) = v19;
  *(_OWORD *)(a1 + 160) = v20;
  *(_OWORD *)(a1 + 272) = v19;
  *(_OWORD *)(a1 + 288) = v20;
  *(_OWORD *)(a1 + 400) = v22;
  *(_OWORD *)(a1 + 416) = v18;
  v23 = v9[7];
  *(_OWORD *)(a1 + 496) = v14;
  *(_OWORD *)(a1 + 512) = v23;
  *(_OWORD *)(a1 + 464) = v11;
  *(_OWORD *)(a1 + 480) = v15;
  *(_OWORD *)(a1 + 432) = v21;
  *(_OWORD *)(a1 + 448) = v12;
  *(_OWORD *)(a1 + 544) = 0u;
  *(_OWORD *)(a1 + 560) = 0u;
  *(_OWORD *)(a1 + 528) = 0u;
  result = operator new(0x20uLL);
  *result = &unk_24C27E620;
  result[1] = 0;
  *((_BYTE *)result + 24) = 0;
  result[2] = 0;
  *(_QWORD *)(a1 + 576) = result + 3;
  *(_QWORD *)(a1 + 584) = result;
  *(_BYTE *)(a1 + 592) = 0;
  *(_OWORD *)(a1 + 600) = 0u;
  *(_OWORD *)(a1 + 616) = 0u;
  *(_OWORD *)(a1 + 625) = 0u;
  *(_QWORD *)(a1 + 648) = 0;
  *(_QWORD *)(a1 + 664) = 0;
  *(_QWORD *)(a1 + 656) = 0;
  *(_BYTE *)(a1 + 672) = 0;
  *(_QWORD *)(a1 + 712) = 0;
  *(_OWORD *)(a1 + 680) = 0u;
  *(_OWORD *)(a1 + 696) = 0u;
  *(_QWORD *)(a1 + 848) = 0;
  *(_OWORD *)(a1 + 816) = 0u;
  *(_OWORD *)(a1 + 832) = 0u;
  *(_OWORD *)(a1 + 784) = 0u;
  *(_OWORD *)(a1 + 800) = 0u;
  *(_OWORD *)(a1 + 752) = 0u;
  *(_OWORD *)(a1 + 768) = 0u;
  *(_OWORD *)(a1 + 736) = 0u;
  if (v8)
  {
    v25 = *(id *)(a1 + 24);
    v26 = objc_msgSend(v25, "newCommandQueue");
    v27 = *(void **)(a1 + 528);
    *(_QWORD *)(a1 + 528) = v26;

    v28 = *(_DWORD *)(a4 + 8);
    *(_QWORD *)(a1 + 720) = *(_QWORD *)a4;
    *(_DWORD *)(a1 + 728) = v28;
    *(_DWORD *)(a1 + 732) = *(_DWORD *)(a4 + 12);
    objc_msgSend(*(id *)(a1 + 16), "setFramebufferOnly:", 0);
    if (objc_msgSend(*(id *)(a1 + 16), "pixelFormat") != 80)
      __assert_rtn("renderer_t", "LAUICubicBSplineRenderer.mm", 697, "[_render_loop pixelFormat] == pixel_format");
    v29 = 3;
    do
    {
      v33 = 0u;
      v34 = 0u;
      v32 = 0u;
      v30 = *(_OWORD **)(a1 + 560);
      if ((unint64_t)v30 >= *(_QWORD *)(a1 + 568))
      {
        v31 = std::vector<LAUI_uniform_cubic_b_spline_renderer::renderer_t::buffers_t>::__emplace_back_slow_path<LAUI_uniform_cubic_b_spline_renderer::renderer_t::buffers_t>((uint64_t *)(a1 + 552), &v32);
      }
      else
      {
        *((_QWORD *)&v32 + 1) = 0;
        *v30 = 0uLL;
        v33 = 0uLL;
        v30[1] = 0uLL;
        v34 = 0uLL;
        v31 = (uint64_t)(v30 + 3);
        v30[2] = 0uLL;
      }
      *(_QWORD *)(a1 + 560) = v31;

      --v29;
    }
    while (v29);

    return (_QWORD *)a1;
  }
  else
  {
    __break(1u);
  }
  return result;
}

float LAUI_uniform_cubic_b_spline_renderer::renderer_t::set_state(uint64_t a1, uint64_t a2)
{
  int v2;
  float result;

  v2 = *(_DWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 720) = *(_QWORD *)a2;
  *(_DWORD *)(a1 + 728) = v2;
  result = *(float *)(a2 + 12);
  *(float *)(a1 + 732) = result;
  return result;
}

uint64_t LAUI_uniform_cubic_b_spline_renderer::renderer_t::add_spline(uint64_t a1, unint64_t *a2, __int128 **a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  unint64_t v10;
  uint64_t v11;
  __int128 v13;
  uint64_t v14;

  if (*(_BYTE *)(a1 + 8))
    return -1;
  v3 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*(_QWORD *)(a1 + 696) - *(_QWORD *)(a1 + 688)) >> 3);
  v14 = v3;
  v7 = LAUI_uniform_cubic_b_spline_renderer::renderer_t::reserve_spline_control_points(a1, a2);
  *(_QWORD *)&v13 = v7;
  *((_QWORD *)&v13 + 1) = v8;
  v9 = *(uint64_t **)(a1 + 696);
  if ((unint64_t)v9 >= *(_QWORD *)(a1 + 704))
  {
    v11 = std::vector<LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t>::__emplace_back_slow_path<LAUI_uniform_cubic_b_spline_renderer::indexed_identifier_t<LAUI_uniform_cubic_b_spline_renderer::spline_t> const&,LAUI_uniform_cubic_b_spline_renderer::spline_t const&,std::span<LAUI_uniform_cubic_b_spline_renderer_private::control_point,18446744073709551615ul> const&,LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t const&>((uint64_t *)(a1 + 688), &v14, (uint64_t *)a2, &v13, a3);
    v3 = v14;
  }
  else
  {
    *v9 = v3;
    v10 = *a2;
    v9[1] = *a2;
    v9[2] = v7;
    v9[3] = v8;
    v9[4] = 0;
    v9[5] = 0;
    v9[6] = 0;
    if (v10)
      LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t::set_state(v9, a3);
    v11 = (uint64_t)(v9 + 7);
  }
  *(_QWORD *)(a1 + 696) = v11;
  return v3;
}

uint64_t LAUI_uniform_cubic_b_spline_renderer::renderer_t::reserve_spline_control_points(uint64_t a1, unint64_t *a2)
{
  unint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  void **v17;
  uint64_t v18;
  char **v19;
  char *v20;
  uint64_t v21;
  char *v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  char *v30;
  char *v31;
  __int16 v32;
  __int16 v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  char *v41;
  char *v42;
  __int16 v43;
  __int16 v44;
  char *v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  char *v52;
  char *v53;
  __int16 v54;
  unint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  char *v63;
  __int16 v64;
  int v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  __int128 v70;

  v4 = *a2;
  v5 = *(char **)(a1 + 744);
  v6 = *(_QWORD *)(a1 + 736);
  v70 = 0u;
  std::vector<LAUI_uniform_cubic_b_spline_renderer_private::control_point>::insert(a1 + 736, v5, v4, (char *)&v70);
  v7 = *(_QWORD *)(a1 + 736);
  v8 = (*(_QWORD *)(a1 + 744) - v7) >> 4;
  v9 = *(_QWORD **)(a1 + 688);
  v10 = *(_QWORD **)(a1 + 696);
  if (v9 != v10)
  {
    v11 = 0;
    while (1)
    {
      v12 = v9[1];
      v13 = v8 - v11;
      if (v12 != -1)
        v13 = v9[1];
      if (v13 != v9[3])
        break;
      v9[2] = v7 + 16 * v11;
      v9[3] = v13;
      v14 = __CFADD__(v11, v12);
      v11 += v12;
      if (v14)
        break;
      v9 += 7;
      if (v9 == v10)
      {
        if (v11 <= v8)
          goto LABEL_11;
        break;
      }
    }
    __break(1u);
  }
  v11 = 0;
LABEL_11:
  if (v4 != v8 - v11)
  {
    v67 = "control_point_count == (count - offset)";
    v66 = 740;
    goto LABEL_88;
  }
  v68 = v7;
  v15 = *a2;
  if (*a2 <= 3)
    v15 = 3;
  v16 = v15 - 3;
  v17 = (void **)(a1 + 760);
  std::vector<unsigned short>::reserve((void **)(a1 + 760), ((uint64_t)(*(_QWORD *)(a1 + 768) - *(_QWORD *)(a1 + 760)) >> 1) + 4 * (v15 - 3));
  if (v16)
  {
    v18 = 0;
    v69 = (uint64_t)&v5[-v6] >> 4;
    v19 = (char **)(a1 + 776);
    v20 = *(char **)(a1 + 768);
    while (1)
    {
      v21 = v18 + v69;
      v22 = *v19;
      if (v20 >= *v19)
      {
        v24 = (char *)*v17;
        v25 = v20 - (_BYTE *)*v17;
        if (v25 <= -3)
          goto LABEL_90;
        v26 = v25 >> 1;
        v27 = v22 - v24;
        if (v27 <= (v25 >> 1) + 1)
          v28 = v26 + 1;
        else
          v28 = v27;
        if (v27 >= 0x7FFFFFFFFFFFFFFELL)
          v29 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v29 = v28;
        if (v29)
        {
          v30 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>(a1 + 776, v29);
          v20 = *(char **)(a1 + 768);
          v24 = *(char **)(a1 + 760);
        }
        else
        {
          v30 = 0;
        }
        v31 = &v30[2 * v26];
        *(_WORD *)v31 = v21;
        v23 = v31 + 2;
        while (v20 != v24)
        {
          v32 = *((_WORD *)v20 - 1);
          v20 -= 2;
          *((_WORD *)v31 - 1) = v32;
          v31 -= 2;
        }
        *(_QWORD *)(a1 + 760) = v31;
        v22 = &v30[2 * v29];
        *(_QWORD *)(a1 + 768) = v23;
        *(_QWORD *)(a1 + 776) = v22;
        if (v24)
        {
          operator delete(v24);
          v22 = *v19;
        }
      }
      else
      {
        *(_WORD *)v20 = v21;
        v23 = v20 + 2;
      }
      *(_QWORD *)(a1 + 768) = v23;
      v33 = v21 + 1;
      if (v23 >= v22)
      {
        v35 = (char *)*v17;
        v36 = v23 - (_BYTE *)*v17;
        if (v36 < -2)
          goto LABEL_90;
        v37 = v36 >> 1;
        v38 = v22 - v35;
        if (v38 <= (v36 >> 1) + 1)
          v39 = v37 + 1;
        else
          v39 = v38;
        if (v38 >= 0x7FFFFFFFFFFFFFFELL)
          v40 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v40 = v39;
        if (v40)
        {
          v41 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>(a1 + 776, v40);
          v23 = *(char **)(a1 + 768);
          v35 = *(char **)(a1 + 760);
        }
        else
        {
          v41 = 0;
        }
        v42 = &v41[2 * v37];
        *(_WORD *)v42 = v33;
        v34 = v42 + 2;
        while (v23 != v35)
        {
          v43 = *((_WORD *)v23 - 1);
          v23 -= 2;
          *((_WORD *)v42 - 1) = v43;
          v42 -= 2;
        }
        *(_QWORD *)(a1 + 760) = v42;
        v22 = &v41[2 * v40];
        *(_QWORD *)(a1 + 768) = v34;
        *(_QWORD *)(a1 + 776) = v22;
        if (v35)
        {
          operator delete(v35);
          v22 = *v19;
        }
      }
      else
      {
        *(_WORD *)v23 = v33;
        v34 = v23 + 2;
      }
      *(_QWORD *)(a1 + 768) = v34;
      v44 = v21 + 2;
      if (v34 >= v22)
      {
        v46 = (char *)*v17;
        v47 = v34 - (_BYTE *)*v17;
        if (v47 < -2)
          goto LABEL_90;
        v48 = v47 >> 1;
        v49 = v22 - v46;
        if (v49 <= (v47 >> 1) + 1)
          v50 = v48 + 1;
        else
          v50 = v49;
        if (v49 >= 0x7FFFFFFFFFFFFFFELL)
          v51 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v51 = v50;
        if (v51)
        {
          v52 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>(a1 + 776, v51);
          v34 = *(char **)(a1 + 768);
          v46 = *(char **)(a1 + 760);
        }
        else
        {
          v52 = 0;
        }
        v53 = &v52[2 * v48];
        *(_WORD *)v53 = v44;
        v45 = v53 + 2;
        while (v34 != v46)
        {
          v54 = *((_WORD *)v34 - 1);
          v34 -= 2;
          *((_WORD *)v53 - 1) = v54;
          v53 -= 2;
        }
        *(_QWORD *)(a1 + 760) = v53;
        v22 = &v52[2 * v51];
        *(_QWORD *)(a1 + 768) = v45;
        *(_QWORD *)(a1 + 776) = v22;
        if (v46)
        {
          operator delete(v46);
          v22 = *v19;
        }
      }
      else
      {
        *(_WORD *)v34 = v44;
        v45 = v34 + 2;
      }
      *(_QWORD *)(a1 + 768) = v45;
      v55 = v21 + 3;
      if (v45 >= v22)
      {
        v56 = (char *)*v17;
        v57 = v45 - (_BYTE *)*v17;
        if (v57 < -2)
LABEL_90:
          std::vector<UIView * {__strong}>::__throw_length_error[abi:ne180100]();
        v58 = v57 >> 1;
        v59 = v22 - v56;
        v60 = v59 <= (v57 >> 1) + 1 ? v58 + 1 : v59;
        v61 = v59 >= 0x7FFFFFFFFFFFFFFELL ? 0x7FFFFFFFFFFFFFFFLL : v60;
        if (v61)
        {
          v62 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>(a1 + 776, v61);
          v45 = *(char **)(a1 + 768);
          v56 = *(char **)(a1 + 760);
        }
        else
        {
          v62 = 0;
        }
        v63 = &v62[2 * v58];
        *(_WORD *)v63 = v55;
        v20 = v63 + 2;
        while (v45 != v56)
        {
          v64 = *((_WORD *)v45 - 1);
          v45 -= 2;
          *((_WORD *)v63 - 1) = v64;
          v63 -= 2;
        }
        *(_QWORD *)(a1 + 760) = v63;
        *(_QWORD *)(a1 + 768) = v20;
        *(_QWORD *)(a1 + 776) = &v62[2 * v61];
        if (v56)
          operator delete(v56);
      }
      else
      {
        *(_WORD *)v45 = v55;
        v20 = v45 + 2;
      }
      *(_QWORD *)(a1 + 768) = v20;
      if (v55 >= (uint64_t)(*(_QWORD *)(a1 + 744) - *(_QWORD *)(a1 + 736)) >> 4)
        break;
      if (++v18 == v16)
        return v68 + 16 * v11;
    }
    v66 = 754;
    v67 = "control_point_start_index + 3 < _control_points.size()";
LABEL_88:
    __assert_rtn("reserve_spline_control_points", "LAUICubicBSplineRenderer.mm", v66, v67);
  }
  return v68 + 16 * v11;
}

char *std::vector<LAUI_uniform_cubic_b_spline_renderer_private::control_point>::insert(uint64_t a1, char *__src, unint64_t a3, char *a4)
{
  char *v4;
  char *v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _BYTE *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  char *v23;
  char *v24;
  __int128 v25;
  unint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  char *v30;
  void *__p;
  char *v33;
  char *v34;
  char *v35;
  uint64_t v36;

  v4 = __src;
  if (a3)
  {
    v5 = a4;
    v10 = *(_QWORD *)(a1 + 16);
    v8 = a1 + 16;
    v9 = v10;
    v11 = *(char **)(v8 - 8);
    if (a3 <= (v10 - (uint64_t)v11) >> 4)
    {
      v18 = v11 - __src;
      if (a3 <= (v11 - __src) >> 4)
      {
        v21 = *(char **)(v8 - 8);
        v20 = a3;
      }
      else
      {
        v19 = 0;
        v20 = v18 >> 4;
        v21 = &v11[16 * (a3 - (v18 >> 4))];
        do
        {
          *(_OWORD *)&v11[v19] = *(_OWORD *)a4;
          v19 += 16;
        }
        while (16 * a3 - 16 * v20 != v19);
        *(_QWORD *)(a1 + 8) = v21;
        if (v11 == __src)
          return v4;
      }
      v22 = &__src[16 * a3];
      v23 = &v21[-16 * a3];
      v24 = v21;
      if (v23 < v11)
      {
        v24 = v21;
        do
        {
          v25 = *(_OWORD *)v23;
          v23 += 16;
          *(_OWORD *)v24 = v25;
          v24 += 16;
        }
        while (v23 < v11);
      }
      *(_QWORD *)(a1 + 8) = v24;
      if (v21 != v22)
        memmove(&v21[-16 * ((v21 - v22) >> 4)], __src, v21 - v22);
      if (v4 <= v5)
      {
        if (*(_QWORD *)(a1 + 8) <= (unint64_t)v5)
          v26 = 0;
        else
          v26 = a3;
        v5 += 16 * v26;
      }
      v27 = v4;
      do
      {
        *(_OWORD *)v27 = *(_OWORD *)v5;
        v27 += 16;
        --v20;
      }
      while (v20);
    }
    else
    {
      v12 = *(_BYTE **)a1;
      v13 = a3 + ((uint64_t)&v11[-*(_QWORD *)a1] >> 4);
      if (v13 >> 60)
        std::vector<UIView * {__strong}>::__throw_length_error[abi:ne180100]();
      v14 = (__src - v12) >> 4;
      v15 = v9 - (_QWORD)v12;
      if (v15 >> 3 > v13)
        v13 = v15 >> 3;
      if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFF0)
        v16 = 0xFFFFFFFFFFFFFFFLL;
      else
        v16 = v13;
      v36 = v8;
      if (v16)
        v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<LAUI_uniform_cubic_b_spline_renderer_private::control_point>>(v8, v16);
      else
        v17 = 0;
      v28 = &v17[16 * v14];
      __p = v17;
      v33 = v28;
      v35 = &v17[16 * v16];
      v29 = 16 * a3;
      v30 = &v28[16 * a3];
      do
      {
        *(_OWORD *)v28 = *(_OWORD *)v5;
        v28 += 16;
        v29 -= 16;
      }
      while (v29);
      v34 = v30;
      v4 = (char *)std::vector<LAUI_uniform_cubic_b_spline_renderer_private::control_point>::__swap_out_circular_buffer((void **)a1, (uint64_t)&__p, v4);
      if (v34 != v33)
        v34 += (v33 - v34 + 15) & 0xFFFFFFFFFFFFFFF0;
      if (__p)
        operator delete(__p);
    }
  }
  return v4;
}

void sub_209E13EEC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::vector<unsigned short>::reserve(void **a1, unint64_t a2)
{
  uint64_t v3;
  _BYTE *v4;
  int64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  __int16 v13;

  v4 = a1[2];
  v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (_BYTE *)*a1) >> 1)
  {
    if ((a2 & 0x8000000000000000) != 0)
      std::vector<UIView * {__strong}>::__throw_length_error[abi:ne180100]();
    v5 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>(v3, a2);
    v7 = &v6[v5 & 0xFFFFFFFFFFFFFFFELL];
    v9 = &v6[2 * v8];
    v10 = (char *)*a1;
    v11 = (char *)a1[1];
    v12 = v7;
    if (v11 != *a1)
    {
      v12 = v7;
      do
      {
        v13 = *((_WORD *)v11 - 1);
        v11 -= 2;
        *((_WORD *)v12 - 1) = v13;
        v12 -= 2;
      }
      while (v11 != v10);
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
      operator delete(v10);
  }
}

uint64_t LAUI_uniform_cubic_b_spline_renderer::renderer_t::add_instance(uint64_t a1, uint64_t *a2, __int128 *a3, LAUI_uniform_cubic_b_spline_renderer::spline_t::instance_t::state_t *a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  _OWORD v26[6];

  if (*(_BYTE *)(a1 + 8))
    return -1;
  v5 = *a2;
  v6 = *(_QWORD *)(a1 + 696);
  v7 = *(_QWORD *)(a1 + 688);
  if (*a2 >= (unint64_t)(0x6DB6DB6DB6DB6DB7 * ((v6 - v7) >> 3)))
    return -1;
  v9 = 0;
  if (v5)
  {
    v10 = 56 * v5;
    v11 = (_QWORD *)(v7 + 40);
    do
    {
      v9 -= 0x3333333333333333 * ((uint64_t)(*v11 - *(v11 - 1)) >> 4);
      v11 += 7;
      v10 -= 56;
    }
    while (v10);
  }
  v12 = 0;
  if (v7 != v6)
  {
    v13 = *(_QWORD *)(a1 + 688);
    do
    {
      v12 -= 0x3333333333333333 * ((uint64_t)(*(_QWORD *)(v13 + 40) - *(_QWORD *)(v13 + 32)) >> 4);
      v13 += 56;
    }
    while (v13 != v6);
  }
  v14 = (_QWORD *)(v7 + 56 * v5);
  v15 = (uint64_t)(v14[5] - v14[4]) >> 4;
  v16 = *(_QWORD *)(a1 + 784) + 96 * v9;
  memset(v26, 0, sizeof(v26));
  std::vector<LAUI_uniform_cubic_b_spline_renderer_private::instance_uniform>::insert(a1 + 784, (char *)(v16 - 0x3333333333333320 * v15), v26);
  std::vector<LAUI_uniform_cubic_b_spline_renderer_private::control_point>::reserve((void **)(a1 + 808), ((uint64_t)(*(_QWORD *)(a1 + 816) - *(_QWORD *)(a1 + 808)) >> 4) + 10);
  v17 = 0xCCCCCCCCCCCCCCCDLL * v15;
  v18 = 0xCCCCCCCCCCCCCCCDLL * v15 + v9;
  v19 = (char *)(*(_QWORD *)(a1 + 808) + 80 * v18);
  v26[0] = 0u;
  std::vector<LAUI_uniform_cubic_b_spline_renderer_private::control_point>::insert(a1 + 808, v19, 5uLL, (char *)v26);
  v20 = 5 * (v9 + v12 + v17) + 5;
  v21 = (char *)(*(_QWORD *)(a1 + 808) + 16 * v20);
  v26[0] = 0u;
  std::vector<LAUI_uniform_cubic_b_spline_renderer_private::control_point>::insert(a1 + 808, v21, 5uLL, (char *)v26);
  *(_BYTE *)(a1 + 672) = 1;
  v22 = *(_QWORD *)(a1 + 808);
  *(_QWORD *)&v26[0] = *(_QWORD *)(a1 + 784) + 96 * v18;
  LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t::add_instance(v14, a3, v26, v22 + 80 * v18, 5, v22 + 16 * v20, 5, a4);
  ++*(_QWORD *)(a1 + 712);
  if (v23 != v17)
    __assert_rtn("add_instance", "LAUICubicBSplineRenderer.mm", 796, "actual_instance_id.index() == instance_id.index()");
  LAUI_uniform_cubic_b_spline_renderer::renderer_t::remap_instances((_QWORD *)a1);
  return v5;
}

char *std::vector<LAUI_uniform_cubic_b_spline_renderer_private::instance_uniform>::insert(uint64_t a1, char *__src, _OWORD *a3)
{
  char *v4;
  char *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  char *v11;
  char *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE *v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  void *__p;
  char *v33;
  char *v34;
  char *v35;
  uint64_t v36;

  v4 = __src;
  v6 = *(char **)(a1 + 8);
  v9 = *(_QWORD *)(a1 + 16);
  v7 = a1 + 16;
  v8 = v9;
  if ((unint64_t)v6 >= v9)
  {
    v17 = *(_BYTE **)a1;
    v18 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)&v6[-*(_QWORD *)a1] >> 5) + 1;
    if (v18 > 0x2AAAAAAAAAAAAAALL)
      std::vector<UIView * {__strong}>::__throw_length_error[abi:ne180100]();
    v19 = 0xAAAAAAAAAAAAAAABLL * ((__src - v17) >> 5);
    v20 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v8 - (_QWORD)v17) >> 5);
    if (2 * v20 > v18)
      v18 = 2 * v20;
    if (v20 >= 0x155555555555555)
      v21 = 0x2AAAAAAAAAAAAAALL;
    else
      v21 = v18;
    v36 = v7;
    if (v21)
      v22 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<LAUI_uniform_cubic_b_spline_renderer_private::instance_uniform>>(v7, v21);
    else
      v22 = 0;
    __p = v22;
    v33 = &v22[96 * v19];
    v34 = v33;
    v35 = &v22[96 * v21];
    std::__split_buffer<LAUI_uniform_cubic_b_spline_renderer_private::instance_uniform>::push_back(&__p, (uint64_t)a3);
    v4 = (char *)std::vector<LAUI_uniform_cubic_b_spline_renderer_private::instance_uniform>::__swap_out_circular_buffer((void **)a1, (uint64_t)&__p, v4);
    if (v34 != v33)
      v34 = &v33[(v34 - v33 - 96) % 0x60uLL];
    if (__p)
      operator delete(__p);
  }
  else if (__src == v6)
  {
    v27 = a3[1];
    *(_OWORD *)__src = *a3;
    *((_OWORD *)__src + 1) = v27;
    v28 = a3[2];
    v29 = a3[3];
    v30 = a3[5];
    *((_OWORD *)__src + 4) = a3[4];
    *((_OWORD *)__src + 5) = v30;
    *((_OWORD *)__src + 2) = v28;
    *((_OWORD *)__src + 3) = v29;
    *(_QWORD *)(a1 + 8) = __src + 96;
  }
  else
  {
    v10 = __src + 96;
    v11 = v6 - 96;
    v12 = v6;
    while (v11 < v6)
    {
      v13 = *((_OWORD *)v11 + 1);
      *(_OWORD *)v12 = *(_OWORD *)v11;
      *((_OWORD *)v12 + 1) = v13;
      v14 = *((_OWORD *)v11 + 2);
      v15 = *((_OWORD *)v11 + 3);
      v16 = *((_OWORD *)v11 + 5);
      *((_OWORD *)v12 + 4) = *((_OWORD *)v11 + 4);
      *((_OWORD *)v12 + 5) = v16;
      *((_OWORD *)v12 + 2) = v14;
      *((_OWORD *)v12 + 3) = v15;
      v11 += 96;
      v12 += 96;
    }
    *(_QWORD *)(a1 + 8) = v12;
    if (v6 != v10)
      memmove(__src + 96, __src, v6 - v10);
    v23 = a3[1];
    *(_OWORD *)v4 = *a3;
    *((_OWORD *)v4 + 1) = v23;
    v24 = a3[2];
    v25 = a3[3];
    v26 = a3[5];
    *((_OWORD *)v4 + 4) = a3[4];
    *((_OWORD *)v4 + 5) = v26;
    *((_OWORD *)v4 + 2) = v24;
    *((_OWORD *)v4 + 3) = v25;
  }
  return v4;
}

void sub_209E143E4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::vector<LAUI_uniform_cubic_b_spline_renderer_private::control_point>::reserve(void **a1, unint64_t a2)
{
  uint64_t v3;
  _BYTE *v4;
  int64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;

  v4 = a1[2];
  v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (_BYTE *)*a1) >> 4)
  {
    if (a2 >> 60)
      std::vector<UIView * {__strong}>::__throw_length_error[abi:ne180100]();
    v5 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<LAUI_uniform_cubic_b_spline_renderer_private::control_point>>(v3, a2);
    v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF0];
    v9 = &v6[16 * v8];
    v11 = (char *)*a1;
    v10 = (char *)a1[1];
    v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        *((_OWORD *)v12 - 1) = *((_OWORD *)v10 - 1);
        v12 -= 16;
        v10 -= 16;
      }
      while (v10 != v11);
      v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
      operator delete(v10);
  }
}

uint64_t LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t::add_instance(_QWORD *a1, __int128 *a2, _QWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, LAUI_uniform_cubic_b_spline_renderer::spline_t::instance_t::state_t *a8)
{
  uint64_t v15;
  void **v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  __int128 v22;
  char *v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  __int128 v30;
  char *v31;
  char *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t result;
  char *v37;
  uint64_t v39;

  v16 = (void **)(a1 + 4);
  v15 = a1[4];
  v17 = a1[5];
  v18 = (uint64_t)(v17 - v15) / 80;
  v39 = *a1;
  v21 = a1[6];
  v19 = (uint64_t)(a1 + 6);
  v20 = v21;
  if (v17 >= v21)
  {
    if ((unint64_t)(v18 + 1) > 0x333333333333333)
      std::vector<UIView * {__strong}>::__throw_length_error[abi:ne180100]();
    v24 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v20 - v15) >> 4);
    v25 = 2 * v24;
    if (2 * v24 <= v18 + 1)
      v25 = v18 + 1;
    if (v24 >= 0x199999999999999)
      v26 = 0x333333333333333;
    else
      v26 = v25;
    v27 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<LAUI_uniform_cubic_b_spline_renderer::renderer_t::instance_container_t>>(v19, v26);
    v28 = &v27[80 * v18];
    v37 = &v27[80 * v29];
    *(_QWORD *)v28 = a1;
    v30 = *a2;
    *(_OWORD *)(v28 + 24) = a2[1];
    *(_OWORD *)(v28 + 8) = v30;
    *((_QWORD *)v28 + 5) = *a3;
    *((_QWORD *)v28 + 6) = a4;
    *((_QWORD *)v28 + 7) = a5;
    *((_QWORD *)v28 + 8) = a6;
    *((_QWORD *)v28 + 9) = a7;
    LAUI_uniform_cubic_b_spline_renderer::renderer_t::instance_container_t::set_state((LAUI_uniform_cubic_b_spline_renderer::renderer_t::instance_container_t *)v28, a8, 1);
    v23 = v28 + 80;
    v32 = (char *)a1[4];
    v31 = (char *)a1[5];
    if (v31 != v32)
    {
      do
      {
        *((_OWORD *)v28 - 5) = *((_OWORD *)v31 - 5);
        v33 = *((_OWORD *)v31 - 4);
        v34 = *((_OWORD *)v31 - 3);
        v35 = *((_OWORD *)v31 - 1);
        *((_OWORD *)v28 - 2) = *((_OWORD *)v31 - 2);
        *((_OWORD *)v28 - 1) = v35;
        *((_OWORD *)v28 - 4) = v33;
        *((_OWORD *)v28 - 3) = v34;
        v28 -= 80;
        v31 -= 80;
      }
      while (v31 != v32);
      v31 = (char *)*v16;
    }
    a1[4] = v28;
    a1[5] = v23;
    a1[6] = v37;
    if (v31)
      operator delete(v31);
  }
  else
  {
    *(_QWORD *)v17 = a1;
    v22 = *a2;
    *(_OWORD *)(v17 + 24) = a2[1];
    *(_OWORD *)(v17 + 8) = v22;
    *(_QWORD *)(v17 + 40) = *a3;
    *(_QWORD *)(v17 + 48) = a4;
    *(_QWORD *)(v17 + 56) = a5;
    *(_QWORD *)(v17 + 64) = a6;
    *(_QWORD *)(v17 + 72) = a7;
    LAUI_uniform_cubic_b_spline_renderer::renderer_t::instance_container_t::set_state((LAUI_uniform_cubic_b_spline_renderer::renderer_t::instance_container_t *)v17, a8, 1);
    v23 = (char *)(v17 + 80);
  }
  result = v39;
  a1[5] = v23;
  return result;
}

_QWORD *LAUI_uniform_cubic_b_spline_renderer::renderer_t::remap_instances(_QWORD *this)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v1 = this[86];
  v2 = this[87];
  if (v1 != v2)
  {
    v3 = 0;
    v4 = this[86];
    do
    {
      v5 = v3;
      v6 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*(_QWORD *)(v4 + 40) - *(_QWORD *)(v4 + 32)) >> 4);
      v3 += v6;
      v4 += 56;
    }
    while (v4 != v2);
    if (v1 != v2)
    {
      v7 = 0;
      v8 = this[101];
      v9 = v5 + v6;
      do
      {
        v10 = *(_QWORD **)(v1 + 32);
        v11 = *(_QWORD **)(v1 + 40);
        if (v10 != v11)
        {
          v12 = v8 + 80 * v7;
          v13 = v8 + 80 * (v9 + v7);
          v14 = 96 * v7;
          do
          {
            v10[5] = v14 + this[98];
            v10[6] = v12;
            v10[7] = 5;
            v10[8] = v13;
            v10[9] = 5;
            ++v7;
            v10 += 10;
            v12 += 80;
            v13 += 80;
            v14 += 96;
          }
          while (v10 != v11);
        }
        v1 += 56;
      }
      while (v1 != v2);
    }
  }
  return this;
}

void LAUI_uniform_cubic_b_spline_renderer::renderer_t::rebuild_cap_control_point_indices(LAUI_uniform_cubic_b_spline_renderer::renderer_t *this)
{
  char *v2;
  uint64_t v3;
  __int16 v4;
  char **v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  __int16 v20;
  __int16 v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  char *v29;
  char *v30;
  __int16 v31;
  __int16 v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  char *v39;
  char *v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  char *v48;
  char *v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  unint64_t v54;
  uint64_t v55;
  char *v56;
  char *v57;
  __int16 v58;
  __int16 v59;
  char *v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  unint64_t v65;
  uint64_t v66;
  char *v67;
  char *v68;
  __int16 v69;
  __int16 v70;
  char *v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  unint64_t v76;
  uint64_t v77;
  char *v78;
  char *v79;
  __int16 v80;
  __int16 v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  unint64_t v86;
  uint64_t v87;
  char *v88;
  char *v89;
  __int16 v90;
  uint64_t v91;
  __int16 v92;
  uint64_t v93;
  uint64_t v94;
  unint64_t v95;
  uint64_t v96;
  char *v97;
  char *v98;
  char *v99;
  uint64_t v100;
  uint64_t v101;
  unint64_t v102;
  unint64_t v103;
  uint64_t v104;
  char *v105;
  char *v106;
  __int16 v107;
  __int16 v108;
  char *v109;
  char *v110;
  uint64_t v111;
  uint64_t v112;
  unint64_t v113;
  unint64_t v114;
  uint64_t v115;
  char *v116;
  char *v117;
  __int16 v118;
  __int16 v119;
  char *v120;
  char *v121;
  uint64_t v122;
  uint64_t v123;
  unint64_t v124;
  unint64_t v125;
  uint64_t v126;
  char *v127;
  char *v128;
  __int16 v129;
  __int16 v130;
  char *v131;
  char *v132;
  uint64_t v133;
  uint64_t v134;
  unint64_t v135;
  unint64_t v136;
  uint64_t v137;
  char *v138;
  char *v139;
  __int16 v140;
  __int16 v141;
  char *v142;
  uint64_t v143;
  uint64_t v144;
  unint64_t v145;
  unint64_t v146;
  uint64_t v147;
  char *v148;
  char *v149;
  __int16 v150;
  uint64_t v151;
  __int16 v152;
  __int16 v153;
  uint64_t v154;
  uint64_t v155;
  unint64_t v156;
  uint64_t v157;
  __int16 v158;
  char *v159;
  char *v160;
  char *v161;
  uint64_t v162;
  uint64_t v163;
  unint64_t v164;
  unint64_t v165;
  uint64_t v166;
  char *v167;
  char *v168;
  __int16 v169;
  __int16 v170;
  char *v171;
  char *v172;
  uint64_t v173;
  uint64_t v174;
  unint64_t v175;
  unint64_t v176;
  uint64_t v177;
  char *v178;
  char *v179;
  __int16 v180;
  __int16 v181;
  char *v182;
  uint64_t v183;
  uint64_t v184;
  unint64_t v185;
  unint64_t v186;
  uint64_t v187;
  char *v188;
  char *v189;
  __int16 v190;
  uint64_t v191;
  __int16 v192;
  uint64_t v193;
  uint64_t v194;
  unint64_t v195;
  uint64_t v196;
  __int16 v197;
  char *v198;
  char *v199;
  char *v200;
  uint64_t v201;
  uint64_t v202;
  unint64_t v203;
  unint64_t v204;
  uint64_t v205;
  char *v206;
  char *v207;
  __int16 v208;
  __int16 v209;
  char *v210;
  char *v211;
  uint64_t v212;
  uint64_t v213;
  unint64_t v214;
  unint64_t v215;
  uint64_t v216;
  char *v217;
  char *v218;
  __int16 v219;
  __int16 v220;
  char *v221;
  char *v222;
  uint64_t v223;
  uint64_t v224;
  unint64_t v225;
  unint64_t v226;
  uint64_t v227;
  char *v228;
  char *v229;
  __int16 v230;
  __int16 v231;
  char *v232;
  uint64_t v233;
  uint64_t v234;
  unint64_t v235;
  unint64_t v236;
  uint64_t v237;
  char *v238;
  char *v239;
  __int16 v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  unint64_t v244;
  uint64_t v245;
  char *v246;
  char *v247;
  char *v248;
  uint64_t v249;
  uint64_t v250;
  unint64_t v251;
  unint64_t v252;
  uint64_t v253;
  char *v254;
  char *v255;
  __int16 v256;
  __int16 v257;
  char *v258;
  char *v259;
  uint64_t v260;
  uint64_t v261;
  unint64_t v262;
  unint64_t v263;
  uint64_t v264;
  char *v265;
  char *v266;
  __int16 v267;
  __int16 v268;
  char *v269;
  char *v270;
  uint64_t v271;
  uint64_t v272;
  unint64_t v273;
  unint64_t v274;
  uint64_t v275;
  char *v276;
  char *v277;
  __int16 v278;
  __int16 v279;
  char *v280;
  char *v281;
  uint64_t v282;
  uint64_t v283;
  unint64_t v284;
  unint64_t v285;
  uint64_t v286;
  char *v287;
  char *v288;
  __int16 v289;
  __int16 v290;
  char *v291;
  uint64_t v292;
  uint64_t v293;
  unint64_t v294;
  unint64_t v295;
  uint64_t v296;
  char *v297;
  char *v298;
  __int16 v299;
  uint64_t v300;
  uint64_t v301;
  uint64_t v302;
  uint64_t v303;
  uint64_t v304;
  uint64_t v305;
  uint64_t v306;
  uint64_t v307;
  uint64_t v308;
  uint64_t v309;
  uint64_t v310;
  uint64_t v311;
  void **v312;

  if (*((_BYTE *)this + 672))
  {
    *((_BYTE *)this + 672) = 0;
    v2 = (char *)*((_QWORD *)this + 104);
    *((_QWORD *)this + 105) = v2;
    v3 = *((_QWORD *)this + 86);
    v300 = *((_QWORD *)this + 87);
    if (v3 != v300)
    {
      v4 = 0;
      v312 = (void **)((char *)this + 832);
      v5 = (char **)((char *)this + 848);
      do
      {
        v306 = v3;
        v6 = *(_QWORD *)(v3 + 40) - *(_QWORD *)(v3 + 32);
        if (v6)
        {
          v7 = 0;
          v8 = v6 / 80;
          if (v8 <= 1)
            v9 = 1;
          else
            v9 = v8;
          do
          {
            v10 = *v5;
            if (v2 >= *v5)
            {
              v12 = (char *)*v312;
              v13 = v2 - (_BYTE *)*v312;
              if (v13 < -2)
                goto LABEL_458;
              v14 = v13 >> 1;
              v15 = v10 - v12;
              if (v15 <= (v13 >> 1) + 1)
                v16 = v14 + 1;
              else
                v16 = v15;
              if (v15 >= 0x7FFFFFFFFFFFFFFELL)
                v17 = 0x7FFFFFFFFFFFFFFFLL;
              else
                v17 = v16;
              if (v17)
              {
                v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)this + 848, v17);
                v2 = (char *)*((_QWORD *)this + 105);
                v12 = (char *)*((_QWORD *)this + 104);
              }
              else
              {
                v18 = 0;
              }
              v19 = &v18[2 * v14];
              *(_WORD *)v19 = v4;
              v11 = v19 + 2;
              while (v2 != v12)
              {
                v20 = *((_WORD *)v2 - 1);
                v2 -= 2;
                *((_WORD *)v19 - 1) = v20;
                v19 -= 2;
              }
              *((_QWORD *)this + 104) = v19;
              v10 = &v18[2 * v17];
              *((_QWORD *)this + 105) = v11;
              *((_QWORD *)this + 106) = v10;
              if (v12)
              {
                operator delete(v12);
                v10 = *v5;
              }
            }
            else
            {
              *(_WORD *)v2 = v4;
              v11 = v2 + 2;
            }
            *((_QWORD *)this + 105) = v11;
            v21 = v4 + 3;
            if (v11 >= v10)
            {
              v23 = (char *)*v312;
              v24 = v11 - (_BYTE *)*v312;
              if (v24 < -2)
                goto LABEL_458;
              v25 = v24 >> 1;
              v26 = v10 - v23;
              if (v26 <= (v24 >> 1) + 1)
                v27 = v25 + 1;
              else
                v27 = v26;
              if (v26 >= 0x7FFFFFFFFFFFFFFELL)
                v28 = 0x7FFFFFFFFFFFFFFFLL;
              else
                v28 = v27;
              if (v28)
              {
                v29 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)this + 848, v28);
                v11 = (char *)*((_QWORD *)this + 105);
                v23 = (char *)*((_QWORD *)this + 104);
              }
              else
              {
                v29 = 0;
              }
              v30 = &v29[2 * v25];
              *(_WORD *)v30 = v21;
              v22 = v30 + 2;
              while (v11 != v23)
              {
                v31 = *((_WORD *)v11 - 1);
                v11 -= 2;
                *((_WORD *)v30 - 1) = v31;
                v30 -= 2;
              }
              *((_QWORD *)this + 104) = v30;
              v10 = &v29[2 * v28];
              *((_QWORD *)this + 105) = v22;
              *((_QWORD *)this + 106) = v10;
              if (v23)
              {
                operator delete(v23);
                v10 = *v5;
              }
            }
            else
            {
              *(_WORD *)v11 = v21;
              v22 = v11 + 2;
            }
            *((_QWORD *)this + 105) = v22;
            v32 = v4 + 4;
            if (v22 >= v10)
            {
              v33 = (char *)*v312;
              v34 = v22 - (_BYTE *)*v312;
              if (v34 < -2)
LABEL_458:
                std::vector<UIView * {__strong}>::__throw_length_error[abi:ne180100]();
              v35 = v34 >> 1;
              v36 = v10 - v33;
              if (v36 <= (v34 >> 1) + 1)
                v37 = v35 + 1;
              else
                v37 = v36;
              if (v36 >= 0x7FFFFFFFFFFFFFFELL)
                v38 = 0x7FFFFFFFFFFFFFFFLL;
              else
                v38 = v37;
              if (v38)
              {
                v39 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)this + 848, v38);
                v22 = (char *)*((_QWORD *)this + 105);
                v33 = (char *)*((_QWORD *)this + 104);
              }
              else
              {
                v39 = 0;
              }
              v40 = &v39[2 * v35];
              *(_WORD *)v40 = v32;
              v2 = v40 + 2;
              while (v22 != v33)
              {
                v41 = *((_WORD *)v22 - 1);
                v22 -= 2;
                *((_WORD *)v40 - 1) = v41;
                v40 -= 2;
              }
              *((_QWORD *)this + 104) = v40;
              *((_QWORD *)this + 105) = v2;
              *((_QWORD *)this + 106) = &v39[2 * v38];
              if (v33)
                operator delete(v33);
            }
            else
            {
              *(_WORD *)v22 = v32;
              v2 = v22 + 2;
            }
            *((_QWORD *)this + 105) = v2;
            v4 += 5;
            ++v7;
          }
          while (v7 != v9);
        }
        v3 = v306 + 56;
      }
      while (v306 + 56 != v300);
      v42 = *((_QWORD *)this + 86);
      v301 = *((_QWORD *)this + 87);
      if (v42 != v301)
      {
        v43 = 0;
        do
        {
          v307 = v42;
          v44 = *(_QWORD *)(v42 + 40) - *(_QWORD *)(v42 + 32);
          if (v44)
          {
            v45 = 0;
            v46 = v44 / 80;
            if (v46 <= 1)
              v47 = 1;
            else
              v47 = v46;
            do
            {
              v48 = *v5;
              if (v2 >= *v5)
              {
                v50 = (char *)*v312;
                v51 = v2 - (_BYTE *)*v312;
                if (v51 < -2)
                  goto LABEL_458;
                v52 = v51 >> 1;
                v53 = v48 - v50;
                if (v53 <= (v51 >> 1) + 1)
                  v54 = v52 + 1;
                else
                  v54 = v53;
                if (v53 >= 0x7FFFFFFFFFFFFFFELL)
                  v55 = 0x7FFFFFFFFFFFFFFFLL;
                else
                  v55 = v54;
                if (v55)
                {
                  v56 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)this + 848, v55);
                  v2 = (char *)*((_QWORD *)this + 105);
                  v50 = (char *)*((_QWORD *)this + 104);
                }
                else
                {
                  v56 = 0;
                }
                v57 = &v56[2 * v52];
                *(_WORD *)v57 = v43;
                v49 = v57 + 2;
                while (v2 != v50)
                {
                  v58 = *((_WORD *)v2 - 1);
                  v2 -= 2;
                  *((_WORD *)v57 - 1) = v58;
                  v57 -= 2;
                }
                *((_QWORD *)this + 104) = v57;
                v48 = &v56[2 * v55];
                *((_QWORD *)this + 105) = v49;
                *((_QWORD *)this + 106) = v48;
                if (v50)
                {
                  operator delete(v50);
                  v48 = *v5;
                }
              }
              else
              {
                *(_WORD *)v2 = v43;
                v49 = v2 + 2;
              }
              *((_QWORD *)this + 105) = v49;
              v59 = v43 + 1;
              if (v49 >= v48)
              {
                v61 = (char *)*v312;
                v62 = v49 - (_BYTE *)*v312;
                if (v62 < -2)
                  goto LABEL_458;
                v63 = v62 >> 1;
                v64 = v48 - v61;
                if (v64 <= (v62 >> 1) + 1)
                  v65 = v63 + 1;
                else
                  v65 = v64;
                if (v64 >= 0x7FFFFFFFFFFFFFFELL)
                  v66 = 0x7FFFFFFFFFFFFFFFLL;
                else
                  v66 = v65;
                if (v66)
                {
                  v67 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)this + 848, v66);
                  v49 = (char *)*((_QWORD *)this + 105);
                  v61 = (char *)*((_QWORD *)this + 104);
                }
                else
                {
                  v67 = 0;
                }
                v68 = &v67[2 * v63];
                *(_WORD *)v68 = v59;
                v60 = v68 + 2;
                while (v49 != v61)
                {
                  v69 = *((_WORD *)v49 - 1);
                  v49 -= 2;
                  *((_WORD *)v68 - 1) = v69;
                  v68 -= 2;
                }
                *((_QWORD *)this + 104) = v68;
                v48 = &v67[2 * v66];
                *((_QWORD *)this + 105) = v60;
                *((_QWORD *)this + 106) = v48;
                if (v61)
                {
                  operator delete(v61);
                  v48 = *v5;
                }
              }
              else
              {
                *(_WORD *)v49 = v59;
                v60 = v49 + 2;
              }
              *((_QWORD *)this + 105) = v60;
              v70 = v43 + 3;
              if (v60 >= v48)
              {
                v72 = (char *)*v312;
                v73 = v60 - (_BYTE *)*v312;
                if (v73 < -2)
                  goto LABEL_458;
                v74 = v73 >> 1;
                v75 = v48 - v72;
                if (v75 <= (v73 >> 1) + 1)
                  v76 = v74 + 1;
                else
                  v76 = v75;
                if (v75 >= 0x7FFFFFFFFFFFFFFELL)
                  v77 = 0x7FFFFFFFFFFFFFFFLL;
                else
                  v77 = v76;
                if (v77)
                {
                  v78 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)this + 848, v77);
                  v60 = (char *)*((_QWORD *)this + 105);
                  v72 = (char *)*((_QWORD *)this + 104);
                }
                else
                {
                  v78 = 0;
                }
                v79 = &v78[2 * v74];
                *(_WORD *)v79 = v70;
                v71 = v79 + 2;
                while (v60 != v72)
                {
                  v80 = *((_WORD *)v60 - 1);
                  v60 -= 2;
                  *((_WORD *)v79 - 1) = v80;
                  v79 -= 2;
                }
                *((_QWORD *)this + 104) = v79;
                v48 = &v78[2 * v77];
                *((_QWORD *)this + 105) = v71;
                *((_QWORD *)this + 106) = v48;
                if (v72)
                {
                  operator delete(v72);
                  v48 = *v5;
                }
              }
              else
              {
                *(_WORD *)v60 = v70;
                v71 = v60 + 2;
              }
              *((_QWORD *)this + 105) = v71;
              v81 = v43 + 4;
              if (v71 >= v48)
              {
                v82 = (char *)*v312;
                v83 = v71 - (_BYTE *)*v312;
                if (v83 < -2)
                  goto LABEL_458;
                v84 = v83 >> 1;
                v85 = v48 - v82;
                if (v85 <= (v83 >> 1) + 1)
                  v86 = v84 + 1;
                else
                  v86 = v85;
                if (v85 >= 0x7FFFFFFFFFFFFFFELL)
                  v87 = 0x7FFFFFFFFFFFFFFFLL;
                else
                  v87 = v86;
                if (v87)
                {
                  v88 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)this + 848, v87);
                  v71 = (char *)*((_QWORD *)this + 105);
                  v82 = (char *)*((_QWORD *)this + 104);
                }
                else
                {
                  v88 = 0;
                }
                v89 = &v88[2 * v84];
                *(_WORD *)v89 = v81;
                v2 = v89 + 2;
                while (v71 != v82)
                {
                  v90 = *((_WORD *)v71 - 1);
                  v71 -= 2;
                  *((_WORD *)v89 - 1) = v90;
                  v89 -= 2;
                }
                *((_QWORD *)this + 104) = v89;
                *((_QWORD *)this + 105) = v2;
                *((_QWORD *)this + 106) = &v88[2 * v87];
                if (v82)
                  operator delete(v82);
              }
              else
              {
                *(_WORD *)v71 = v81;
                v2 = v71 + 2;
              }
              *((_QWORD *)this + 105) = v2;
              v43 += 5;
              ++v45;
            }
            while (v45 != v47);
          }
          v42 = v307 + 56;
        }
        while (v307 + 56 != v301);
        v91 = *((_QWORD *)this + 86);
        v302 = *((_QWORD *)this + 87);
        if (v91 != v302)
        {
          v92 = 0;
          do
          {
            v308 = v91;
            v93 = *(_QWORD *)(v91 + 40) - *(_QWORD *)(v91 + 32);
            if (v93)
            {
              v94 = 0;
              v95 = v93 / 80;
              if (v95 <= 1)
                v96 = 1;
              else
                v96 = v95;
              do
              {
                v97 = *v5;
                if (v2 >= *v5)
                {
                  v99 = (char *)*v312;
                  v100 = v2 - (_BYTE *)*v312;
                  if (v100 < -2)
                    goto LABEL_458;
                  v101 = v100 >> 1;
                  v102 = v97 - v99;
                  if (v102 <= (v100 >> 1) + 1)
                    v103 = v101 + 1;
                  else
                    v103 = v102;
                  if (v102 >= 0x7FFFFFFFFFFFFFFELL)
                    v104 = 0x7FFFFFFFFFFFFFFFLL;
                  else
                    v104 = v103;
                  if (v104)
                  {
                    v105 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)this + 848, v104);
                    v2 = (char *)*((_QWORD *)this + 105);
                    v99 = (char *)*((_QWORD *)this + 104);
                  }
                  else
                  {
                    v105 = 0;
                  }
                  v106 = &v105[2 * v101];
                  *(_WORD *)v106 = v92;
                  v98 = v106 + 2;
                  while (v2 != v99)
                  {
                    v107 = *((_WORD *)v2 - 1);
                    v2 -= 2;
                    *((_WORD *)v106 - 1) = v107;
                    v106 -= 2;
                  }
                  *((_QWORD *)this + 104) = v106;
                  v97 = &v105[2 * v104];
                  *((_QWORD *)this + 105) = v98;
                  *((_QWORD *)this + 106) = v97;
                  if (v99)
                  {
                    operator delete(v99);
                    v97 = *v5;
                  }
                }
                else
                {
                  *(_WORD *)v2 = v92;
                  v98 = v2 + 2;
                }
                *((_QWORD *)this + 105) = v98;
                v108 = v92 + 1;
                if (v98 >= v97)
                {
                  v110 = (char *)*v312;
                  v111 = v98 - (_BYTE *)*v312;
                  if (v111 < -2)
                    goto LABEL_458;
                  v112 = v111 >> 1;
                  v113 = v97 - v110;
                  if (v113 <= (v111 >> 1) + 1)
                    v114 = v112 + 1;
                  else
                    v114 = v113;
                  if (v113 >= 0x7FFFFFFFFFFFFFFELL)
                    v115 = 0x7FFFFFFFFFFFFFFFLL;
                  else
                    v115 = v114;
                  if (v115)
                  {
                    v116 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)this + 848, v115);
                    v98 = (char *)*((_QWORD *)this + 105);
                    v110 = (char *)*((_QWORD *)this + 104);
                  }
                  else
                  {
                    v116 = 0;
                  }
                  v117 = &v116[2 * v112];
                  *(_WORD *)v117 = v108;
                  v109 = v117 + 2;
                  while (v98 != v110)
                  {
                    v118 = *((_WORD *)v98 - 1);
                    v98 -= 2;
                    *((_WORD *)v117 - 1) = v118;
                    v117 -= 2;
                  }
                  *((_QWORD *)this + 104) = v117;
                  v97 = &v116[2 * v115];
                  *((_QWORD *)this + 105) = v109;
                  *((_QWORD *)this + 106) = v97;
                  if (v110)
                  {
                    operator delete(v110);
                    v97 = *v5;
                  }
                }
                else
                {
                  *(_WORD *)v98 = v108;
                  v109 = v98 + 2;
                }
                *((_QWORD *)this + 105) = v109;
                v119 = v92 + 2;
                if (v109 >= v97)
                {
                  v121 = (char *)*v312;
                  v122 = v109 - (_BYTE *)*v312;
                  if (v122 < -2)
                    goto LABEL_458;
                  v123 = v122 >> 1;
                  v124 = v97 - v121;
                  if (v124 <= (v122 >> 1) + 1)
                    v125 = v123 + 1;
                  else
                    v125 = v124;
                  if (v124 >= 0x7FFFFFFFFFFFFFFELL)
                    v126 = 0x7FFFFFFFFFFFFFFFLL;
                  else
                    v126 = v125;
                  if (v126)
                  {
                    v127 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)this + 848, v126);
                    v109 = (char *)*((_QWORD *)this + 105);
                    v121 = (char *)*((_QWORD *)this + 104);
                  }
                  else
                  {
                    v127 = 0;
                  }
                  v128 = &v127[2 * v123];
                  *(_WORD *)v128 = v119;
                  v120 = v128 + 2;
                  while (v109 != v121)
                  {
                    v129 = *((_WORD *)v109 - 1);
                    v109 -= 2;
                    *((_WORD *)v128 - 1) = v129;
                    v128 -= 2;
                  }
                  *((_QWORD *)this + 104) = v128;
                  v97 = &v127[2 * v126];
                  *((_QWORD *)this + 105) = v120;
                  *((_QWORD *)this + 106) = v97;
                  if (v121)
                  {
                    operator delete(v121);
                    v97 = *v5;
                  }
                }
                else
                {
                  *(_WORD *)v109 = v119;
                  v120 = v109 + 2;
                }
                *((_QWORD *)this + 105) = v120;
                v130 = v92 + 3;
                if (v120 >= v97)
                {
                  v132 = (char *)*v312;
                  v133 = v120 - (_BYTE *)*v312;
                  if (v133 < -2)
                    goto LABEL_458;
                  v134 = v133 >> 1;
                  v135 = v97 - v132;
                  if (v135 <= (v133 >> 1) + 1)
                    v136 = v134 + 1;
                  else
                    v136 = v135;
                  if (v135 >= 0x7FFFFFFFFFFFFFFELL)
                    v137 = 0x7FFFFFFFFFFFFFFFLL;
                  else
                    v137 = v136;
                  if (v137)
                  {
                    v138 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)this + 848, v137);
                    v120 = (char *)*((_QWORD *)this + 105);
                    v132 = (char *)*((_QWORD *)this + 104);
                  }
                  else
                  {
                    v138 = 0;
                  }
                  v139 = &v138[2 * v134];
                  *(_WORD *)v139 = v130;
                  v131 = v139 + 2;
                  while (v120 != v132)
                  {
                    v140 = *((_WORD *)v120 - 1);
                    v120 -= 2;
                    *((_WORD *)v139 - 1) = v140;
                    v139 -= 2;
                  }
                  *((_QWORD *)this + 104) = v139;
                  v97 = &v138[2 * v137];
                  *((_QWORD *)this + 105) = v131;
                  *((_QWORD *)this + 106) = v97;
                  if (v132)
                  {
                    operator delete(v132);
                    v97 = *v5;
                  }
                }
                else
                {
                  *(_WORD *)v120 = v130;
                  v131 = v120 + 2;
                }
                *((_QWORD *)this + 105) = v131;
                v141 = v92 + 4;
                if (v131 >= v97)
                {
                  v142 = (char *)*v312;
                  v143 = v131 - (_BYTE *)*v312;
                  if (v143 < -2)
                    goto LABEL_458;
                  v144 = v143 >> 1;
                  v145 = v97 - v142;
                  if (v145 <= (v143 >> 1) + 1)
                    v146 = v144 + 1;
                  else
                    v146 = v145;
                  if (v145 >= 0x7FFFFFFFFFFFFFFELL)
                    v147 = 0x7FFFFFFFFFFFFFFFLL;
                  else
                    v147 = v146;
                  if (v147)
                  {
                    v148 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)this + 848, v147);
                    v131 = (char *)*((_QWORD *)this + 105);
                    v142 = (char *)*((_QWORD *)this + 104);
                  }
                  else
                  {
                    v148 = 0;
                  }
                  v149 = &v148[2 * v144];
                  *(_WORD *)v149 = v141;
                  v2 = v149 + 2;
                  while (v131 != v142)
                  {
                    v150 = *((_WORD *)v131 - 1);
                    v131 -= 2;
                    *((_WORD *)v149 - 1) = v150;
                    v149 -= 2;
                  }
                  *((_QWORD *)this + 104) = v149;
                  *((_QWORD *)this + 105) = v2;
                  *((_QWORD *)this + 106) = &v148[2 * v147];
                  if (v142)
                    operator delete(v142);
                }
                else
                {
                  *(_WORD *)v131 = v141;
                  v2 = v131 + 2;
                }
                *((_QWORD *)this + 105) = v2;
                v92 += 5;
                ++v94;
              }
              while (v94 != v96);
            }
            v91 = v308 + 56;
          }
          while (v308 + 56 != v302);
          v151 = *((_QWORD *)this + 86);
          v303 = *((_QWORD *)this + 87);
          if (v151 != v303)
          {
            v152 = 5 * *((_WORD *)this + 356);
            v153 = v152;
            do
            {
              v309 = v151;
              v154 = *(_QWORD *)(v151 + 40) - *(_QWORD *)(v151 + 32);
              if (v154)
              {
                v155 = 0;
                v156 = v154 / 80;
                if (v156 <= 1)
                  v157 = 1;
                else
                  v157 = v156;
                do
                {
                  v158 = v153 + 2;
                  v159 = *v5;
                  if (v2 >= *v5)
                  {
                    v161 = (char *)*v312;
                    v162 = v2 - (_BYTE *)*v312;
                    if (v162 < -2)
                      goto LABEL_458;
                    v163 = v162 >> 1;
                    v164 = v159 - v161;
                    if (v164 <= (v162 >> 1) + 1)
                      v165 = v163 + 1;
                    else
                      v165 = v164;
                    if (v164 >= 0x7FFFFFFFFFFFFFFELL)
                      v166 = 0x7FFFFFFFFFFFFFFFLL;
                    else
                      v166 = v165;
                    if (v166)
                    {
                      v167 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)this + 848, v166);
                      v2 = (char *)*((_QWORD *)this + 105);
                      v161 = (char *)*((_QWORD *)this + 104);
                    }
                    else
                    {
                      v167 = 0;
                    }
                    v168 = &v167[2 * v163];
                    *(_WORD *)v168 = v158;
                    v160 = v168 + 2;
                    while (v2 != v161)
                    {
                      v169 = *((_WORD *)v2 - 1);
                      v2 -= 2;
                      *((_WORD *)v168 - 1) = v169;
                      v168 -= 2;
                    }
                    *((_QWORD *)this + 104) = v168;
                    v159 = &v167[2 * v166];
                    *((_QWORD *)this + 105) = v160;
                    *((_QWORD *)this + 106) = v159;
                    if (v161)
                    {
                      operator delete(v161);
                      v159 = *v5;
                    }
                  }
                  else
                  {
                    *(_WORD *)v2 = v158;
                    v160 = v2 + 2;
                  }
                  *((_QWORD *)this + 105) = v160;
                  v170 = v153 + 3;
                  if (v160 >= v159)
                  {
                    v172 = (char *)*v312;
                    v173 = v160 - (_BYTE *)*v312;
                    if (v173 < -2)
                      goto LABEL_458;
                    v174 = v173 >> 1;
                    v175 = v159 - v172;
                    if (v175 <= (v173 >> 1) + 1)
                      v176 = v174 + 1;
                    else
                      v176 = v175;
                    if (v175 >= 0x7FFFFFFFFFFFFFFELL)
                      v177 = 0x7FFFFFFFFFFFFFFFLL;
                    else
                      v177 = v176;
                    if (v177)
                    {
                      v178 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)this + 848, v177);
                      v160 = (char *)*((_QWORD *)this + 105);
                      v172 = (char *)*((_QWORD *)this + 104);
                    }
                    else
                    {
                      v178 = 0;
                    }
                    v179 = &v178[2 * v174];
                    *(_WORD *)v179 = v170;
                    v171 = v179 + 2;
                    while (v160 != v172)
                    {
                      v180 = *((_WORD *)v160 - 1);
                      v160 -= 2;
                      *((_WORD *)v179 - 1) = v180;
                      v179 -= 2;
                    }
                    *((_QWORD *)this + 104) = v179;
                    v159 = &v178[2 * v177];
                    *((_QWORD *)this + 105) = v171;
                    *((_QWORD *)this + 106) = v159;
                    if (v172)
                    {
                      operator delete(v172);
                      v159 = *v5;
                    }
                  }
                  else
                  {
                    *(_WORD *)v160 = v170;
                    v171 = v160 + 2;
                  }
                  *((_QWORD *)this + 105) = v171;
                  v181 = v153 + 4;
                  if (v171 >= v159)
                  {
                    v182 = (char *)*v312;
                    v183 = v171 - (_BYTE *)*v312;
                    if (v183 < -2)
                      goto LABEL_458;
                    v184 = v183 >> 1;
                    v185 = v159 - v182;
                    if (v185 <= (v183 >> 1) + 1)
                      v186 = v184 + 1;
                    else
                      v186 = v185;
                    if (v185 >= 0x7FFFFFFFFFFFFFFELL)
                      v187 = 0x7FFFFFFFFFFFFFFFLL;
                    else
                      v187 = v186;
                    if (v187)
                    {
                      v188 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)this + 848, v187);
                      v171 = (char *)*((_QWORD *)this + 105);
                      v182 = (char *)*((_QWORD *)this + 104);
                    }
                    else
                    {
                      v188 = 0;
                    }
                    v189 = &v188[2 * v184];
                    *(_WORD *)v189 = v181;
                    v2 = v189 + 2;
                    while (v171 != v182)
                    {
                      v190 = *((_WORD *)v171 - 1);
                      v171 -= 2;
                      *((_WORD *)v189 - 1) = v190;
                      v189 -= 2;
                    }
                    *((_QWORD *)this + 104) = v189;
                    *((_QWORD *)this + 105) = v2;
                    *((_QWORD *)this + 106) = &v188[2 * v187];
                    if (v182)
                      operator delete(v182);
                  }
                  else
                  {
                    *(_WORD *)v171 = v181;
                    v2 = v171 + 2;
                  }
                  *((_QWORD *)this + 105) = v2;
                  v153 += 5;
                  ++v155;
                }
                while (v155 != v157);
              }
              v151 = v309 + 56;
            }
            while (v309 + 56 != v303);
            v191 = *((_QWORD *)this + 86);
            v304 = *((_QWORD *)this + 87);
            if (v191 != v304)
            {
              v192 = v152;
              do
              {
                v310 = v191;
                v193 = *(_QWORD *)(v191 + 40) - *(_QWORD *)(v191 + 32);
                if (v193)
                {
                  v194 = 0;
                  v195 = v193 / 80;
                  if (v195 <= 1)
                    v196 = 1;
                  else
                    v196 = v195;
                  do
                  {
                    v197 = v192 + 1;
                    v198 = *v5;
                    if (v2 >= *v5)
                    {
                      v200 = (char *)*v312;
                      v201 = v2 - (_BYTE *)*v312;
                      if (v201 < -2)
                        goto LABEL_458;
                      v202 = v201 >> 1;
                      v203 = v198 - v200;
                      if (v203 <= (v201 >> 1) + 1)
                        v204 = v202 + 1;
                      else
                        v204 = v203;
                      if (v203 >= 0x7FFFFFFFFFFFFFFELL)
                        v205 = 0x7FFFFFFFFFFFFFFFLL;
                      else
                        v205 = v204;
                      if (v205)
                      {
                        v206 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)this + 848, v205);
                        v2 = (char *)*((_QWORD *)this + 105);
                        v200 = (char *)*((_QWORD *)this + 104);
                      }
                      else
                      {
                        v206 = 0;
                      }
                      v207 = &v206[2 * v202];
                      *(_WORD *)v207 = v197;
                      v199 = v207 + 2;
                      while (v2 != v200)
                      {
                        v208 = *((_WORD *)v2 - 1);
                        v2 -= 2;
                        *((_WORD *)v207 - 1) = v208;
                        v207 -= 2;
                      }
                      *((_QWORD *)this + 104) = v207;
                      v198 = &v206[2 * v205];
                      *((_QWORD *)this + 105) = v199;
                      *((_QWORD *)this + 106) = v198;
                      if (v200)
                      {
                        operator delete(v200);
                        v198 = *v5;
                      }
                    }
                    else
                    {
                      *(_WORD *)v2 = v197;
                      v199 = v2 + 2;
                    }
                    *((_QWORD *)this + 105) = v199;
                    v209 = v192 + 2;
                    if (v199 >= v198)
                    {
                      v211 = (char *)*v312;
                      v212 = v199 - (_BYTE *)*v312;
                      if (v212 < -2)
                        goto LABEL_458;
                      v213 = v212 >> 1;
                      v214 = v198 - v211;
                      if (v214 <= (v212 >> 1) + 1)
                        v215 = v213 + 1;
                      else
                        v215 = v214;
                      if (v214 >= 0x7FFFFFFFFFFFFFFELL)
                        v216 = 0x7FFFFFFFFFFFFFFFLL;
                      else
                        v216 = v215;
                      if (v216)
                      {
                        v217 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)this + 848, v216);
                        v199 = (char *)*((_QWORD *)this + 105);
                        v211 = (char *)*((_QWORD *)this + 104);
                      }
                      else
                      {
                        v217 = 0;
                      }
                      v218 = &v217[2 * v213];
                      *(_WORD *)v218 = v209;
                      v210 = v218 + 2;
                      while (v199 != v211)
                      {
                        v219 = *((_WORD *)v199 - 1);
                        v199 -= 2;
                        *((_WORD *)v218 - 1) = v219;
                        v218 -= 2;
                      }
                      *((_QWORD *)this + 104) = v218;
                      v198 = &v217[2 * v216];
                      *((_QWORD *)this + 105) = v210;
                      *((_QWORD *)this + 106) = v198;
                      if (v211)
                      {
                        operator delete(v211);
                        v198 = *v5;
                      }
                    }
                    else
                    {
                      *(_WORD *)v199 = v209;
                      v210 = v199 + 2;
                    }
                    *((_QWORD *)this + 105) = v210;
                    v220 = v192 + 3;
                    if (v210 >= v198)
                    {
                      v222 = (char *)*v312;
                      v223 = v210 - (_BYTE *)*v312;
                      if (v223 < -2)
                        goto LABEL_458;
                      v224 = v223 >> 1;
                      v225 = v198 - v222;
                      if (v225 <= (v223 >> 1) + 1)
                        v226 = v224 + 1;
                      else
                        v226 = v225;
                      if (v225 >= 0x7FFFFFFFFFFFFFFELL)
                        v227 = 0x7FFFFFFFFFFFFFFFLL;
                      else
                        v227 = v226;
                      if (v227)
                      {
                        v228 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)this + 848, v227);
                        v210 = (char *)*((_QWORD *)this + 105);
                        v222 = (char *)*((_QWORD *)this + 104);
                      }
                      else
                      {
                        v228 = 0;
                      }
                      v229 = &v228[2 * v224];
                      *(_WORD *)v229 = v220;
                      v221 = v229 + 2;
                      while (v210 != v222)
                      {
                        v230 = *((_WORD *)v210 - 1);
                        v210 -= 2;
                        *((_WORD *)v229 - 1) = v230;
                        v229 -= 2;
                      }
                      *((_QWORD *)this + 104) = v229;
                      v198 = &v228[2 * v227];
                      *((_QWORD *)this + 105) = v221;
                      *((_QWORD *)this + 106) = v198;
                      if (v222)
                      {
                        operator delete(v222);
                        v198 = *v5;
                      }
                    }
                    else
                    {
                      *(_WORD *)v210 = v220;
                      v221 = v210 + 2;
                    }
                    *((_QWORD *)this + 105) = v221;
                    v231 = v192 + 4;
                    if (v221 >= v198)
                    {
                      v232 = (char *)*v312;
                      v233 = v221 - (_BYTE *)*v312;
                      if (v233 < -2)
                        goto LABEL_458;
                      v234 = v233 >> 1;
                      v235 = v198 - v232;
                      if (v235 <= (v233 >> 1) + 1)
                        v236 = v234 + 1;
                      else
                        v236 = v235;
                      if (v235 >= 0x7FFFFFFFFFFFFFFELL)
                        v237 = 0x7FFFFFFFFFFFFFFFLL;
                      else
                        v237 = v236;
                      if (v237)
                      {
                        v238 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)this + 848, v237);
                        v221 = (char *)*((_QWORD *)this + 105);
                        v232 = (char *)*((_QWORD *)this + 104);
                      }
                      else
                      {
                        v238 = 0;
                      }
                      v239 = &v238[2 * v234];
                      *(_WORD *)v239 = v231;
                      v2 = v239 + 2;
                      while (v221 != v232)
                      {
                        v240 = *((_WORD *)v221 - 1);
                        v221 -= 2;
                        *((_WORD *)v239 - 1) = v240;
                        v239 -= 2;
                      }
                      *((_QWORD *)this + 104) = v239;
                      *((_QWORD *)this + 105) = v2;
                      *((_QWORD *)this + 106) = &v238[2 * v237];
                      if (v232)
                        operator delete(v232);
                    }
                    else
                    {
                      *(_WORD *)v221 = v231;
                      v2 = v221 + 2;
                    }
                    *((_QWORD *)this + 105) = v2;
                    v192 += 5;
                    ++v194;
                  }
                  while (v194 != v196);
                }
                v191 = v310 + 56;
              }
              while (v310 + 56 != v304);
              v241 = *((_QWORD *)this + 86);
              v305 = *((_QWORD *)this + 87);
              if (v241 != v305)
              {
                do
                {
                  v311 = v241;
                  v242 = *(_QWORD *)(v241 + 40) - *(_QWORD *)(v241 + 32);
                  if (v242)
                  {
                    v243 = 0;
                    v244 = v242 / 80;
                    if (v244 <= 1)
                      v245 = 1;
                    else
                      v245 = v244;
                    do
                    {
                      v246 = *v5;
                      if (v2 >= *v5)
                      {
                        v248 = (char *)*v312;
                        v249 = v2 - (_BYTE *)*v312;
                        if (v249 < -2)
                          goto LABEL_458;
                        v250 = v249 >> 1;
                        v251 = v246 - v248;
                        if (v251 <= (v249 >> 1) + 1)
                          v252 = v250 + 1;
                        else
                          v252 = v251;
                        if (v251 >= 0x7FFFFFFFFFFFFFFELL)
                          v253 = 0x7FFFFFFFFFFFFFFFLL;
                        else
                          v253 = v252;
                        if (v253)
                        {
                          v254 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)this + 848, v253);
                          v2 = (char *)*((_QWORD *)this + 105);
                          v248 = (char *)*((_QWORD *)this + 104);
                        }
                        else
                        {
                          v254 = 0;
                        }
                        v255 = &v254[2 * v250];
                        *(_WORD *)v255 = v152;
                        v247 = v255 + 2;
                        while (v2 != v248)
                        {
                          v256 = *((_WORD *)v2 - 1);
                          v2 -= 2;
                          *((_WORD *)v255 - 1) = v256;
                          v255 -= 2;
                        }
                        *((_QWORD *)this + 104) = v255;
                        v246 = &v254[2 * v253];
                        *((_QWORD *)this + 105) = v247;
                        *((_QWORD *)this + 106) = v246;
                        if (v248)
                        {
                          operator delete(v248);
                          v246 = *v5;
                        }
                      }
                      else
                      {
                        *(_WORD *)v2 = v152;
                        v247 = v2 + 2;
                      }
                      *((_QWORD *)this + 105) = v247;
                      v257 = v152 + 1;
                      if (v247 >= v246)
                      {
                        v259 = (char *)*v312;
                        v260 = v247 - (_BYTE *)*v312;
                        if (v260 < -2)
                          goto LABEL_458;
                        v261 = v260 >> 1;
                        v262 = v246 - v259;
                        if (v262 <= (v260 >> 1) + 1)
                          v263 = v261 + 1;
                        else
                          v263 = v262;
                        if (v262 >= 0x7FFFFFFFFFFFFFFELL)
                          v264 = 0x7FFFFFFFFFFFFFFFLL;
                        else
                          v264 = v263;
                        if (v264)
                        {
                          v265 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)this + 848, v264);
                          v247 = (char *)*((_QWORD *)this + 105);
                          v259 = (char *)*((_QWORD *)this + 104);
                        }
                        else
                        {
                          v265 = 0;
                        }
                        v266 = &v265[2 * v261];
                        *(_WORD *)v266 = v257;
                        v258 = v266 + 2;
                        while (v247 != v259)
                        {
                          v267 = *((_WORD *)v247 - 1);
                          v247 -= 2;
                          *((_WORD *)v266 - 1) = v267;
                          v266 -= 2;
                        }
                        *((_QWORD *)this + 104) = v266;
                        v246 = &v265[2 * v264];
                        *((_QWORD *)this + 105) = v258;
                        *((_QWORD *)this + 106) = v246;
                        if (v259)
                        {
                          operator delete(v259);
                          v246 = *v5;
                        }
                      }
                      else
                      {
                        *(_WORD *)v247 = v257;
                        v258 = v247 + 2;
                      }
                      *((_QWORD *)this + 105) = v258;
                      v268 = v152 + 2;
                      if (v258 >= v246)
                      {
                        v270 = (char *)*v312;
                        v271 = v258 - (_BYTE *)*v312;
                        if (v271 < -2)
                          goto LABEL_458;
                        v272 = v271 >> 1;
                        v273 = v246 - v270;
                        if (v273 <= (v271 >> 1) + 1)
                          v274 = v272 + 1;
                        else
                          v274 = v273;
                        if (v273 >= 0x7FFFFFFFFFFFFFFELL)
                          v275 = 0x7FFFFFFFFFFFFFFFLL;
                        else
                          v275 = v274;
                        if (v275)
                        {
                          v276 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)this + 848, v275);
                          v258 = (char *)*((_QWORD *)this + 105);
                          v270 = (char *)*((_QWORD *)this + 104);
                        }
                        else
                        {
                          v276 = 0;
                        }
                        v277 = &v276[2 * v272];
                        *(_WORD *)v277 = v268;
                        v269 = v277 + 2;
                        while (v258 != v270)
                        {
                          v278 = *((_WORD *)v258 - 1);
                          v258 -= 2;
                          *((_WORD *)v277 - 1) = v278;
                          v277 -= 2;
                        }
                        *((_QWORD *)this + 104) = v277;
                        v246 = &v276[2 * v275];
                        *((_QWORD *)this + 105) = v269;
                        *((_QWORD *)this + 106) = v246;
                        if (v270)
                        {
                          operator delete(v270);
                          v246 = *v5;
                        }
                      }
                      else
                      {
                        *(_WORD *)v258 = v268;
                        v269 = v258 + 2;
                      }
                      *((_QWORD *)this + 105) = v269;
                      v279 = v152 + 3;
                      if (v269 >= v246)
                      {
                        v281 = (char *)*v312;
                        v282 = v269 - (_BYTE *)*v312;
                        if (v282 < -2)
                          goto LABEL_458;
                        v283 = v282 >> 1;
                        v284 = v246 - v281;
                        if (v284 <= (v282 >> 1) + 1)
                          v285 = v283 + 1;
                        else
                          v285 = v284;
                        if (v284 >= 0x7FFFFFFFFFFFFFFELL)
                          v286 = 0x7FFFFFFFFFFFFFFFLL;
                        else
                          v286 = v285;
                        if (v286)
                        {
                          v287 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)this + 848, v286);
                          v269 = (char *)*((_QWORD *)this + 105);
                          v281 = (char *)*((_QWORD *)this + 104);
                        }
                        else
                        {
                          v287 = 0;
                        }
                        v288 = &v287[2 * v283];
                        *(_WORD *)v288 = v279;
                        v280 = v288 + 2;
                        while (v269 != v281)
                        {
                          v289 = *((_WORD *)v269 - 1);
                          v269 -= 2;
                          *((_WORD *)v288 - 1) = v289;
                          v288 -= 2;
                        }
                        *((_QWORD *)this + 104) = v288;
                        v246 = &v287[2 * v286];
                        *((_QWORD *)this + 105) = v280;
                        *((_QWORD *)this + 106) = v246;
                        if (v281)
                        {
                          operator delete(v281);
                          v246 = *v5;
                        }
                      }
                      else
                      {
                        *(_WORD *)v269 = v279;
                        v280 = v269 + 2;
                      }
                      *((_QWORD *)this + 105) = v280;
                      v290 = v152 + 4;
                      if (v280 >= v246)
                      {
                        v291 = (char *)*v312;
                        v292 = v280 - (_BYTE *)*v312;
                        if (v292 <= -3)
                          goto LABEL_458;
                        v293 = v292 >> 1;
                        v294 = v246 - v291;
                        if (v294 <= (v292 >> 1) + 1)
                          v295 = v293 + 1;
                        else
                          v295 = v294;
                        if (v294 >= 0x7FFFFFFFFFFFFFFELL)
                          v296 = 0x7FFFFFFFFFFFFFFFLL;
                        else
                          v296 = v295;
                        if (v296)
                        {
                          v297 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)this + 848, v296);
                          v280 = (char *)*((_QWORD *)this + 105);
                          v291 = (char *)*((_QWORD *)this + 104);
                        }
                        else
                        {
                          v297 = 0;
                        }
                        v298 = &v297[2 * v293];
                        *(_WORD *)v298 = v290;
                        v2 = v298 + 2;
                        while (v280 != v291)
                        {
                          v299 = *((_WORD *)v280 - 1);
                          v280 -= 2;
                          *((_WORD *)v298 - 1) = v299;
                          v298 -= 2;
                        }
                        *((_QWORD *)this + 104) = v298;
                        *((_QWORD *)this + 105) = v2;
                        *((_QWORD *)this + 106) = &v297[2 * v296];
                        if (v291)
                          operator delete(v291);
                      }
                      else
                      {
                        *(_WORD *)v280 = v290;
                        v2 = v280 + 2;
                      }
                      *((_QWORD *)this + 105) = v2;
                      v152 += 5;
                      ++v243;
                    }
                    while (v243 != v245);
                  }
                  v241 = v311 + 56;
                }
                while (v311 + 56 != v305);
              }
            }
          }
        }
      }
    }
  }
}

void LAUI_uniform_cubic_b_spline_renderer::renderer_t::instance_container_t::set_state(LAUI_uniform_cubic_b_spline_renderer::renderer_t::instance_container_t *this, const LAUI_uniform_cubic_b_spline_renderer::spline_t::instance_t::state_t *a2, char a3)
{
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  BOOL v16;
  double v17;
  float v18;
  float v19;
  float v20;
  double v21;
  double v22;
  double v23;
  double v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  int v30;
  float v31;
  unint64_t v32;
  float v33;
  float *v34;

  v6 = *((_QWORD *)this + 5);
  v7 = *(_QWORD *)this;
  v8 = *((double *)this + 3);
  v9 = *((double *)this + 4);
  if (v8 == v9)
  {
    v10 = NAN;
    v11 = NAN;
LABEL_3:
    v12 = v11;
    goto LABEL_12;
  }
  v14 = *((double *)a2 + 13);
  v13 = *((double *)a2 + 14);
  v15 = v9 - v8;
  v10 = 0.0;
  v11 = 0.0;
  if (v8 != v14)
  {
    v11 = 1.0;
    v16 = v9 == v14;
    v17 = (v14 - v8) / v15;
    if (!v16)
      v11 = v17;
  }
  if (v8 != v13)
  {
    v10 = 1.0;
    if (v9 != v13)
      v10 = (v13 - v8) / v15;
  }
  v12 = 0.0;
  if (v11 >= 0.0)
  {
    v12 = 1.0;
    if (v11 <= 1.0)
      goto LABEL_3;
  }
LABEL_12:
  v19 = *(float *)(v6 + 80);
  v18 = *(float *)(v6 + 84);
  v20 = *(float *)(v6 + 88);
  if (v10 <= 1.0)
    v21 = v10;
  else
    v21 = 1.0;
  if (v10 >= 0.0)
    v22 = v21;
  else
    v22 = 0.0;
  if (v12 <= v22)
    v23 = v12;
  else
    v23 = v22;
  if (v12 <= v22)
    v24 = v22;
  else
    v24 = v12;
  *(double *)&v25 = LAUI_uniform_cubic_b_spline_renderer::spline_t::instance_t::state_t::transform((float32x4_t *)a2);
  v29 = *((_OWORD *)a2 + 5);
  v30 = *((_DWORD *)a2 + 24);
  v32 = *(_QWORD *)(v7 + 8);
  if (v32 <= 3)
    v32 = 3;
  *(_OWORD *)v6 = v25;
  *(_OWORD *)(v6 + 16) = v26;
  v33 = 1.0 - v24;
  *(_OWORD *)(v6 + 32) = v27;
  *(_OWORD *)(v6 + 48) = v28;
  *(_OWORD *)(v6 + 64) = v29;
  *(_DWORD *)(v6 + 80) = v30;
  v31 = v23;
  *(float *)(v6 + 84) = v31;
  *(float *)(v6 + 88) = v33;
  *(float *)(v6 + 92) = (float)(v32 - 3);
  if ((a3 & 1) != 0 || (v34 = (float *)*((_QWORD *)this + 5), v19 != v34[20]) || v18 != v34[21] || v20 != v34[22])
    LAUI_uniform_cubic_b_spline_renderer::renderer_t::instance_container_t::update_caps(this);
}

void LAUI_uniform_cubic_b_spline_renderer::renderer_t::instance_container_t::update_caps(LAUI_uniform_cubic_b_spline_renderer::renderer_t::instance_container_t *this)
{
  float *v2;
  unint64_t v3;
  uint64_t v4;
  float v5;
  double v6;
  uint64_t v7;
  unint64_t v8;
  float v9;
  float v10;
  unint64_t v11;
  simd_float4x4 v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  float32x4_t *v16;
  float32x4_t v17;
  float32x4_t v18;
  float32x4_t v19;
  float32x4_t v20;
  uint64_t v21;
  unint64_t v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  float32x4_t v26;
  float32x4_t v27;
  float32x4_t v28;
  float32x4_t v29;
  double v30;
  float32x4_t v36;
  float32x4_t v38;
  float32x4_t v39;
  float32x4_t v40;
  float32x4_t v41;
  float32x4_t v42;
  float32x4_t v43;
  float32x4_t v44;
  float32x4_t v45;
  float32x4_t v46;
  float32x4_t v47;
  float32x4_t v48;
  float32x4_t v49;
  float32x4_t v50;
  float v51;
  float32x4_t v52;
  float32x4_t v53;
  float32x4_t v54;
  float v55;
  float32x4_t v56;
  float32x4_t v57;
  float32x4_t v58;
  float32x4_t v59;
  float v60;
  float32x4_t v61;
  float32x4_t v62;
  float32x4_t v63;
  float v64;
  double v65;
  BOOL v66;
  float32x4_t v69;
  float32x4_t v71;
  float32x4_t v72;
  float32x4_t v73;
  float32x4_t v74;
  float32x4_t v75;
  float32x4_t v76;
  int32x4_t v77;
  float v78;
  float v79;
  float v80;
  unint64_t v81;
  float v82;
  unint64_t v83;
  uint64_t v84;
  float32x4_t v85;
  float32x4_t v86;
  float32x4_t v87;
  float32x4_t v88;
  uint64_t v89;
  unint64_t v90;
  __int128 v91;
  __int128 v92;
  uint64_t v93;
  float32x4_t v94;
  float32x4_t v95;
  float32x4_t v96;
  float32x4_t v97;
  double v98;
  float32x4_t v99;
  float32x4_t v100;
  float32x4_t v101;
  float32x4_t v102;
  float32x4_t v103;
  float32x4_t v104;
  float32x4_t v105;
  float32x4_t v106;
  float32x4_t v107;
  float32x4_t v108;
  float32x4_t v109;
  float v110;
  float32x4_t v111;
  float32x4_t v112;
  float v113;
  float32x4_t v114;
  float32x4_t v115;
  float v116;
  float32x4_t v117;
  float32x4_t v118;
  float32x4_t v119;
  float v120;
  double v121;
  BOOL v122;
  float32x4_t v123;
  float32x4_t v124;
  float32x4_t v125;
  float32x4_t v126;
  float32x4_t v127;
  float32x4_t v128;
  int32x4_t v129;
  float v130;
  float32x4_t v131;
  float32x4_t v132;
  float v133;
  float32x4_t v134;
  unsigned int v135;
  float32x4_t v136;
  float v137;
  float32x4_t v138;
  float32x4_t v139;
  float32x4_t v140;
  float32x4_t v141;
  float32x4_t v142;
  float32x4_t v143;
  float32x4_t v144;
  float32x4_t v145;
  float32x4_t v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  float32x4_t v151;
  float32x4_t v152;
  float32x4_t v153;
  float32x4_t v154;
  simd_float4x4 v155;
  simd_float4x4 v156;

  v2 = (float *)*((_QWORD *)this + 5);
  v3 = *(_QWORD *)(*(_QWORD *)this + 8);
  v4 = *(_QWORD *)(*(_QWORD *)this + 16);
  if (v3 <= 3)
    v3 = 3;
  v5 = v2[21];
  if (v2[20] * 0.5 * (v2[20] * 0.5) * 1.5625 >= 2.22507386e-308)
    v6 = v2[20] * 0.5 * (v2[20] * 0.5) * 1.5625;
  else
    v6 = 2.22507386e-308;
  v7 = *(_QWORD *)(*(_QWORD *)this + 24);
  v8 = v3 - 3;
  if (v5 <= 0.0)
  {
    v11 = 0;
    v12.columns[0].i32[0] = 0;
  }
  else
  {
    v9 = 1.0 / (double)v8;
    v10 = v5 / v9;
    v11 = (unint64_t)v10;
    v12.columns[0].f32[0] = fmodf(v10, 1.0);
  }
  if (v8 <= 1)
    v13 = 1;
  else
    v13 = v8;
  v14 = v13 - 1;
  if (v13 - 1 >= v11)
    v15 = v11;
  else
    v15 = v13 - 1;
  v16 = (float32x4_t *)(v4 + 16 * v15);
  v18 = *v16;
  v17 = v16[1];
  v19 = v16[2];
  v20 = v16[3];
  v12.columns[2] = *(simd_float4 *)&_PromotedConst[32];
  v12.columns[3] = *(simd_float4 *)&_PromotedConst[48];
  v12.columns[1] = *(simd_float4 *)&_PromotedConst[16];
  if (v12.columns[0].f32[0] > 0.0)
  {
    v139 = v16[2];
    v141 = *v16;
    v143 = v16[1];
    v145 = v16[3];
    v133 = 1.0 - v12.columns[0].f32[0];
    *(float *)&v135 = (float)(1.0 - v12.columns[0].f32[0]) * (float)(1.0 - v12.columns[0].f32[0]);
    v137 = v133 * (float)(v133 * v133);
    v12.columns[0] = *(simd_float4 *)_PromotedConst;
    v155 = __invert_f4(v12);
    v21 = 0;
    *(float *)&v22 = 1.0 - v133;
    *((float *)&v22 + 1) = v133;
    *(float *)&v23 = (float)((float)(v133 * -2.0) + 1.0) + *(float *)&v135;
    *((float *)&v23 + 1) = (float)(*(float *)&v135 * -2.0) + (float)(v133 * 2.0);
    *((_QWORD *)&v23 + 1) = v135;
    *(float *)&v24 = (float)((float)((float)(v133 * -3.0) + 1.0) + (float)(*(float *)&v135 * 3.0)) - v137;
    *((float *)&v24 + 1) = (float)((float)(*(float *)&v135 * -6.0) + (float)(v137 * 3.0)) + (float)(v133 * 3.0);
    *((float *)&v24 + 2) = (float)(v137 * -3.0) + (float)(*(float *)&v135 * 3.0);
    *((float *)&v24 + 3) = v137;
    v147 = xmmword_209E30CA0;
    v148 = v22;
    v149 = v23;
    v150 = v24;
    do
    {
      *(float32x4_t *)((char *)&v151 + v21) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v155.columns[0], COERCE_FLOAT(*(__int128 *)((char *)&v147 + v21))), (float32x4_t)v155.columns[1], *(float32x2_t *)((char *)&v147 + v21), 1), (float32x4_t)v155.columns[2], *(float32x4_t *)((char *)&v147 + v21), 2), (float32x4_t)v155.columns[3], *(float32x4_t *)((char *)&v147 + v21), 3);
      v21 += 16;
    }
    while (v21 != 64);
    v25 = 0;
    v26 = v151;
    v27 = v152;
    v28 = v153;
    v29 = v154;
    v147 = xmmword_209E30CD0;
    v148 = xmmword_209E30CE0;
    v149 = xmmword_209E30CF0;
    v150 = xmmword_209E30C90;
    do
    {
      *(float32x4_t *)((char *)&v151 + v25) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v26, COERCE_FLOAT(*(__int128 *)((char *)&v147 + v25))), v27, *(float32x2_t *)((char *)&v147 + v25), 1), v28, *(float32x4_t *)((char *)&v147 + v25), 2), v29, *(float32x4_t *)((char *)&v147 + v25), 3);
      v25 += 16;
    }
    while (v25 != 64);
    v18 = vmlaq_n_f32(vmlaq_n_f32(vmlaq_n_f32(vmulq_n_f32(v143, v152.f32[0]), v141, v151.f32[0]), v139, v153.f32[0]), v145, v154.f32[0]);
    v17 = vmlaq_lane_f32(vmlaq_lane_f32(vmlaq_lane_f32(vmulq_lane_f32(v143, *(float32x2_t *)v152.f32, 1), v141, *(float32x2_t *)v151.f32, 1), v139, *(float32x2_t *)v153.f32, 1), v145, *(float32x2_t *)v154.f32, 1);
    v19 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v143, v152, 2), v141, v151, 2), v139, v153, 2), v145, v154, 2);
    v20 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v143, v152, 3), v141, v151, 3), v139, v153, 3), v145, v154, 3);
  }
  v30 = 1.79769313e308;
  __asm { FMOV            V21.4S, #4.0 }
  v36.i64[0] = 0x3E0000003E000000;
  v36.i64[1] = 0x3E0000003E000000;
  __asm { FMOV            V20.4S, #6.0 }
  do
  {
    v38 = vmulq_f32(vmlaq_f32(vmulq_f32(v17, _Q21), _Q21, v18), v36);
    v39 = vmulq_f32(vaddq_f32(v19, vmlaq_f32(v18, _Q20, v17)), v36);
    v40 = vmulq_f32(vmlaq_f32(vmulq_f32(v19, _Q21), _Q21, v17), v36);
    v41 = vaddq_f32(v20, vmlaq_f32(v17, _Q20, v19));
    v42 = vsubq_f32(v38, v39);
    v43 = vmulq_f32(v42, v42);
    v44 = vsubq_f32(v38, v40);
    v45 = vmulq_f32(v44, v44);
    v46 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v43, 2), vaddq_f32(v43, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v43.f32, 1)));
    v47 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v45, 2), vaddq_f32(v45, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v45.f32, 1)));
    v20 = vmulq_f32(v41, v36);
    v48 = vsubq_f32(v38, v20);
    v49 = vmulq_f32(v48, v48);
    v50 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v49.f32, 1);
    if ((vmovn_s32(vcgtq_f32(v46, v47)).u8[0] & 1) == 0)
      v46.f32[0] = v47.f32[0];
    v51 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v49, 2), vaddq_f32(v49, v50)).f32[0];
    v52 = vsubq_f32(v39, v40);
    v53 = vmulq_f32(v52, v52);
    v54 = vaddq_f32(v53, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v53.f32, 1));
    if (v51 < v46.f32[0])
      v51 = v46.f32[0];
    v55 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v53, 2), v54).f32[0];
    v56 = vsubq_f32(v39, v20);
    v57 = vmulq_f32(v56, v56);
    v58 = vaddq_f32(v57, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v57.f32, 1));
    v59 = (float32x4_t)vdupq_laneq_s32((int32x4_t)v57, 2);
    if (v55 >= v51)
      v51 = v55;
    v60 = vaddq_f32(v59, v58).f32[0];
    v61 = vsubq_f32(v40, v20);
    v62 = vmulq_f32(v61, v61);
    v63 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v62.f32, 1);
    if (v60 >= v51)
      v51 = v60;
    v64 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v62, 2), vaddq_f32(v62, v63)).f32[0];
    if (v64 >= v51)
      v51 = v64;
    if ((LODWORD(v51) & 0x7FFFFFFFu) >= 0x7F800000)
      v65 = 0.0;
    else
      v65 = v51;
    v66 = v6 < v65 && v30 > v65;
    v18 = v38;
    v17 = v39;
    v19 = v40;
    v30 = v65;
  }
  while (v66);
  if (*((_QWORD *)this + 7) != 5)
    goto LABEL_72;
  __asm
  {
    FMOV            V7.4S, #-3.0
    FMOV            V16.4S, #3.0
  }
  v69 = vsubq_f32(vmlaq_f32(vmlaq_f32(v20, _Q7, v40), _Q16, v39), v38);
  __asm { FMOV            V4.4S, #-6.0 }
  v138 = _Q4;
  v140 = _Q16;
  v71 = vmlaq_f32(vmlaq_f32(vmulq_f32(v39, _Q4), _Q16, v40), _Q16, v38);
  v72 = vmlaq_f32(v71, (float32x4_t)0, v69);
  v142 = _Q7;
  v73 = vmlaq_f32(vmulq_f32(v38, _Q7), _Q16, v40);
  v74 = vaddq_f32(v73, vmlaq_f32(vmulq_f32(v72, (float32x4_t)0), (float32x4_t)0, vmlaq_f32(v71, (float32x4_t)0, vaddq_f32(v69, v69))));
  v75 = vdivq_f32(vmlaq_f32(vaddq_f32(v38, vmlaq_f32(v40, _Q21, v39)), (float32x4_t)0, vmlaq_f32(v73, (float32x4_t)0, v72)), _Q20);
  v76 = vdivq_f32(v74, _Q20);
  v77 = (int32x4_t)vmulq_f32(v76, v76);
  v77.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v77, 2), vadd_f32(*(float32x2_t *)v77.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v77.i8, 1))).u32[0];
  *(float32x2_t *)v72.f32 = vrsqrte_f32((float32x2_t)v77.u32[0]);
  *(float32x2_t *)v72.f32 = vmul_f32(*(float32x2_t *)v72.f32, vrsqrts_f32((float32x2_t)v77.u32[0], vmul_f32(*(float32x2_t *)v72.f32, *(float32x2_t *)v72.f32)));
  *(float32x4_t *)*((_QWORD *)this + 6) = v38;
  *(float32x4_t *)(*((_QWORD *)this + 6) + 16) = v39;
  *(float32x4_t *)(*((_QWORD *)this + 6) + 32) = v40;
  *(float32x4_t *)(*((_QWORD *)this + 6) + 48) = v75;
  *(float32x4_t *)(*((_QWORD *)this + 6) + 64) = vmulq_n_f32(v76, vmul_f32(*(float32x2_t *)v72.f32, vrsqrts_f32((float32x2_t)v77.u32[0], vmul_f32(*(float32x2_t *)v72.f32, *(float32x2_t *)v72.f32))).f32[0]);
  v78 = v2[22];
  v144 = _Q21;
  v146 = _Q20;
  if (v78 <= 0.0)
  {
    v81 = 0;
    v82 = 0.0;
  }
  else
  {
    v79 = 1.0 / (double)v8;
    v80 = v78 / v79;
    v81 = (unint64_t)v80;
    v82 = fmodf(v80, 1.0);
    _Q21 = v144;
    _Q20 = v146;
  }
  if (v14 >= v81)
    v83 = v81;
  else
    v83 = v14;
  v84 = v4 + 16 * (v7 - v83);
  v86 = *(float32x4_t *)(v84 - 64);
  v85 = *(float32x4_t *)(v84 - 48);
  v87 = *(float32x4_t *)(v84 - 32);
  v88 = *(float32x4_t *)(v84 - 16);
  if (v82 > 0.0)
  {
    v131 = *(float32x4_t *)(v84 - 48);
    v132 = *(float32x4_t *)(v84 - 32);
    v134 = *(float32x4_t *)(v84 - 64);
    v136 = *(float32x4_t *)(v84 - 16);
    v130 = 1.0 - v82;
    v156 = __invert_f4(*(simd_float4x4 *)_PromotedConst);
    v89 = 0;
    LODWORD(v90) = 0;
    *((float *)&v90 + 1) = v130;
    *(_QWORD *)&v91 = 0;
    HIDWORD(v91) = 0;
    *((float *)&v91 + 2) = *((float *)&v90 + 1) * *((float *)&v90 + 1);
    *(_QWORD *)&v92 = 0;
    DWORD2(v92) = 0;
    *((float *)&v92 + 3) = v130 * (float)(*((float *)&v90 + 1) * *((float *)&v90 + 1));
    v147 = xmmword_209E30CA0;
    v148 = v90;
    v149 = v91;
    v150 = v92;
    do
    {
      *(float32x4_t *)((char *)&v151 + v89) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v156.columns[0], COERCE_FLOAT(*(__int128 *)((char *)&v147 + v89))), (float32x4_t)v156.columns[1], *(float32x2_t *)((char *)&v147 + v89), 1), (float32x4_t)v156.columns[2], *(float32x4_t *)((char *)&v147 + v89), 2), (float32x4_t)v156.columns[3], *(float32x4_t *)((char *)&v147 + v89), 3);
      v89 += 16;
    }
    while (v89 != 64);
    v93 = 0;
    v94 = v151;
    v95 = v152;
    v96 = v153;
    v97 = v154;
    v147 = xmmword_209E30CD0;
    v148 = xmmword_209E30CE0;
    v149 = xmmword_209E30CF0;
    v150 = xmmword_209E30C90;
    _Q21 = v144;
    _Q20 = v146;
    do
    {
      *(float32x4_t *)((char *)&v151 + v93) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v94, COERCE_FLOAT(*(__int128 *)((char *)&v147 + v93))), v95, *(float32x2_t *)((char *)&v147 + v93), 1), v96, *(float32x4_t *)((char *)&v147 + v93), 2), v97, *(float32x4_t *)((char *)&v147 + v93), 3);
      v93 += 16;
    }
    while (v93 != 64);
    v86 = vmlaq_n_f32(vmlaq_n_f32(vmlaq_n_f32(vmulq_n_f32(v131, v152.f32[0]), v134, v151.f32[0]), v132, v153.f32[0]), v136, v154.f32[0]);
    v85 = vmlaq_lane_f32(vmlaq_lane_f32(vmlaq_lane_f32(vmulq_lane_f32(v131, *(float32x2_t *)v152.f32, 1), v134, *(float32x2_t *)v151.f32, 1), v132, *(float32x2_t *)v153.f32, 1), v136, *(float32x2_t *)v154.f32, 1);
    v87 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v131, v152, 2), v134, v151, 2), v132, v153, 2), v136, v154, 2);
    v88 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v131, v152, 3), v134, v151, 3), v132, v153, 3), v136, v154, 3);
  }
  v98 = 1.79769313e308;
  v99.i64[0] = 0x3E0000003E000000;
  v99.i64[1] = 0x3E0000003E000000;
  do
  {
    v100 = vmulq_f32(vmlaq_f32(vmulq_f32(v87, _Q21), _Q21, v85), v99);
    v86 = vmulq_f32(vaddq_f32(v87, vmlaq_f32(v86, _Q20, v85)), v99);
    v101 = vmulq_f32(vaddq_f32(v88, vmlaq_f32(v85, _Q20, v87)), v99);
    v88 = vmulq_f32(vmlaq_f32(vmulq_f32(v88, _Q21), _Q21, v87), v99);
    v102 = vsubq_f32(v86, v100);
    v103 = vmulq_f32(v102, v102);
    v104 = vsubq_f32(v86, v101);
    v105 = vmulq_f32(v104, v104);
    v106 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v103, 2), vaddq_f32(v103, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v103.f32, 1)));
    v107 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v105, 2), vaddq_f32(v105, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v105.f32, 1)));
    v108 = vsubq_f32(v86, v88);
    v109 = vmulq_f32(v108, v108);
    LODWORD(v110) = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v109, 2), vaddq_f32(v109, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v109.f32, 1))).u32[0];
    if ((vmovn_s32(vcgtq_f32(v106, v107)).u8[0] & 1) == 0)
      v106.f32[0] = v107.f32[0];
    v111 = vsubq_f32(v100, v101);
    v112 = vmulq_f32(v111, v111);
    LODWORD(v113) = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v112, 2), vaddq_f32(v112, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v112.f32, 1))).u32[0];
    v114 = vsubq_f32(v100, v88);
    v115 = vmulq_f32(v114, v114);
    if (v110 >= v106.f32[0])
      v106.f32[0] = v110;
    LODWORD(v116) = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v115, 2), vaddq_f32(v115, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v115.f32, 1))).u32[0];
    v117 = vsubq_f32(v101, v88);
    v118 = vmulq_f32(v117, v117);
    v119 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v118.f32, 1);
    if (v113 >= v106.f32[0])
      v106.f32[0] = v113;
    LODWORD(v120) = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v118, 2), vaddq_f32(v118, v119)).u32[0];
    if (v116 >= v106.f32[0])
      v106.f32[0] = v116;
    if (v120 >= v106.f32[0])
      v106.f32[0] = v120;
    if ((v106.i32[0] & 0x7FFFFFFFu) >= 0x7F800000)
      v121 = 0.0;
    else
      v121 = v106.f32[0];
    v122 = v6 < v121 && v98 > v121;
    v85 = v100;
    v87 = v101;
    v98 = v121;
  }
  while (v122);
  if (*((_QWORD *)this + 9) == 5)
  {
    v123 = vsubq_f32(vmlaq_f32(vmlaq_f32(v88, v142, v101), v140, v100), v86);
    v124 = vmlaq_f32(vmlaq_f32(vmulq_f32(v100, v138), v140, v101), v140, v86);
    v125 = vaddq_f32(v124, v123);
    v126 = vmlaq_f32(vmulq_f32(v86, v142), v140, v101);
    v127 = vdivq_f32(vaddq_f32(vaddq_f32(v86, vmlaq_f32(v101, _Q21, v100)), vaddq_f32(v126, v125)), _Q20);
    v128 = vdivq_f32(vaddq_f32(v126, vaddq_f32(v125, vaddq_f32(v124, vaddq_f32(v123, v123)))), _Q20);
    v129 = (int32x4_t)vmulq_f32(v128, v128);
    v129.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v129, 2), vadd_f32(*(float32x2_t *)v129.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v129.i8, 1))).u32[0];
    *(float32x2_t *)v125.f32 = vrsqrte_f32((float32x2_t)v129.u32[0]);
    *(float32x2_t *)v125.f32 = vmul_f32(*(float32x2_t *)v125.f32, vrsqrts_f32((float32x2_t)v129.u32[0], vmul_f32(*(float32x2_t *)v125.f32, *(float32x2_t *)v125.f32)));
    *(float32x4_t *)*((_QWORD *)this + 8) = v100;
    *(float32x4_t *)(*((_QWORD *)this + 8) + 16) = v101;
    *(float32x4_t *)(*((_QWORD *)this + 8) + 32) = v88;
    *(float32x4_t *)(*((_QWORD *)this + 8) + 48) = v127;
    *(float32x4_t *)(*((_QWORD *)this + 8) + 64) = vmulq_n_f32(v128, vmul_f32(*(float32x2_t *)v125.f32, vrsqrts_f32((float32x2_t)v129.u32[0], vmul_f32(*(float32x2_t *)v125.f32, *(float32x2_t *)v125.f32))).f32[0]);
  }
  else
  {
LABEL_72:
    __break(1u);
  }
}

void LAUI_uniform_cubic_b_spline_renderer::renderer_t::set_state(uint64_t a1, _QWORD *a2, __int128 **a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 688);
  if (*a2 < (unint64_t)(0x6DB6DB6DB6DB6DB7 * ((*(_QWORD *)(a1 + 696) - v3) >> 3)))
    LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t::set_state((_QWORD *)(v3 + 56 * *a2), a3);
}

void LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t::set_state(_QWORD *a1, __int128 **a2)
{
  __int128 *v2;
  __int128 *v3;
  uint64_t v4;
  __int128 v5;
  LAUI_uniform_cubic_b_spline_renderer::renderer_t::instance_container_t *v6;
  LAUI_uniform_cubic_b_spline_renderer::renderer_t::instance_container_t *v7;

  v3 = *a2;
  v2 = a2[1];
  if (a1[3] == v2 - *a2)
  {
    if (v3 != v2)
    {
      v4 = a1[2];
      do
      {
        v5 = *v3++;
        *(_DWORD *)(v4 + 8) = DWORD2(v5);
        *(_QWORD *)v4 = v5;
        v4 += 16;
      }
      while (v3 != v2);
    }
    v6 = (LAUI_uniform_cubic_b_spline_renderer::renderer_t::instance_container_t *)a1[4];
    v7 = (LAUI_uniform_cubic_b_spline_renderer::renderer_t::instance_container_t *)a1[5];
    while (v6 != v7)
    {
      LAUI_uniform_cubic_b_spline_renderer::renderer_t::instance_container_t::update_caps(v6);
      v6 = (LAUI_uniform_cubic_b_spline_renderer::renderer_t::instance_container_t *)((char *)v6 + 80);
    }
  }
  else
  {
    __break(1u);
  }
}

void LAUI_uniform_cubic_b_spline_renderer::renderer_t::set_state(uint64_t a1, _QWORD *a2, LAUI_uniform_cubic_b_spline_renderer::spline_t::instance_t::state_t *a3)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t *v6;

  v3 = *(_QWORD *)(a1 + 688);
  if (*a2 < (unint64_t)(0x6DB6DB6DB6DB6DB7 * ((*(_QWORD *)(a1 + 696) - v3) >> 3)))
  {
    v4 = a2[1];
    v6 = (uint64_t *)(v3 + 56 * *a2 + 32);
    v5 = *v6;
    if (v4 < 0xCCCCCCCCCCCCCCCDLL * ((v6[1] - *v6) >> 4))
      LAUI_uniform_cubic_b_spline_renderer::renderer_t::instance_container_t::set_state((LAUI_uniform_cubic_b_spline_renderer::renderer_t::instance_container_t *)(v5 + 80 * v4), a3, 0);
  }
}

void LAUI_uniform_cubic_b_spline_renderer::renderer_t::update_render_pass_descriptor(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a2;
  objc_msgSend(v23, "texture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "width");
  v5 = objc_msgSend(v3, "height");
  if (*(_QWORD *)(a1 + 608) != v4 || *(_QWORD *)(a1 + 616) != v5)
  {
    *(_QWORD *)(a1 + 608) = v4;
    *(_QWORD *)(a1 + 616) = v5;
    v6 = *(void **)(a1 + 536);
    *(_QWORD *)(a1 + 536) = 0;

    v7 = *(void **)(a1 + 624);
    *(_QWORD *)(a1 + 624) = 0;

    v8 = *(void **)(a1 + 632);
    *(_QWORD *)(a1 + 632) = 0;

    v4 = *(_QWORD *)(a1 + 608);
    v5 = *(_QWORD *)(a1 + 616);
  }
  if (v5 * v4)
  {
    v9 = *(id *)(a1 + 24);
    v10 = objc_msgSend(v9, "supportsTextureSampleCount:", 4);
    v11 = *(void **)(a1 + 536);
    v12 = v11;
    if (!v11)
    {
      if (v10)
      {
        objc_msgSend(MEMORY[0x24BDDD740], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", objc_msgSend(v3, "pixelFormat"), *(_QWORD *)(a1 + 608), *(_QWORD *)(a1 + 616), 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setTextureType:", 4);
        objc_msgSend(v13, "setSampleCount:", 4);
        objc_msgSend(v13, "setUsage:", 0);
        objc_msgSend(v13, "setStorageMode:", 2);
        v14 = objc_msgSend(v9, "newTextureWithDescriptor:", v13);
        v15 = *(void **)(a1 + 624);
        *(_QWORD *)(a1 + 624) = v14;

      }
      v16 = objc_alloc_init(MEMORY[0x24BDDD690]);
      v17 = *(void **)(a1 + 536);
      *(_QWORD *)(a1 + 536) = v16;

      v12 = *(void **)(a1 + 536);
    }
    objc_msgSend(v12, "colorAttachments");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v11)
    {
      if (!v10)
        goto LABEL_16;
    }
    else
    {
      objc_msgSend(v19, "setLoadAction:", 2);
      objc_msgSend(v20, "setClearColor:", 0.0, 0.0, 0.0, 0.0);
      if (!v10)
      {
        objc_msgSend(v20, "setStoreAction:", 1);
LABEL_16:
        objc_msgSend(v20, "setTexture:", v3);
LABEL_17:
        if (!v11 && *(_QWORD *)(a1 + 632))
        {
          objc_msgSend(*(id *)(a1 + 536), "depthAttachment");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setTexture:", *(_QWORD *)(a1 + 632));
          objc_msgSend(v21, "setLoadAction:", 2);
          objc_msgSend(v21, "setStoreAction:", 0);
          objc_msgSend(v21, "setClearDepth:", 1.0);
          objc_msgSend(*(id *)(a1 + 536), "stencilAttachment");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setTexture:", *(_QWORD *)(a1 + 632));
          objc_msgSend(v22, "setLoadAction:", 2);
          objc_msgSend(v22, "setStoreAction:", 0);
          objc_msgSend(v22, "setClearStencil:", 0);

        }
        goto LABEL_21;
      }
      objc_msgSend(v20, "setStoreAction:", 2);
    }
    objc_msgSend(v20, "setTexture:", *(_QWORD *)(a1 + 624));
    objc_msgSend(v20, "setResolveTexture:", v3);
    goto LABEL_17;
  }
LABEL_21:

}

uint64_t LAUI_uniform_cubic_b_spline_renderer::renderer_t::render(LAUI_uniform_cubic_b_spline_renderer::renderer_t *this)
{
  uint64_t v1;
  uint64_t v2;
  unsigned __int8 *v3;
  int v4;
  int v5;
  unsigned int v6;
  int v7;
  void *v8;
  __CFString *v9;
  LAUI_uniform_cubic_b_spline_renderer::renderer_t *v10;
  int v11;
  unsigned __int8 v12;
  id v13;
  LAUI_uniform_cubic_b_spline_renderer::renderer_t *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  unsigned int v20;
  float v21;
  id v22;
  LAUI_uniform_cubic_b_spline_renderer::renderer_t *v23;
  _BYTE *v24;
  _BYTE *v25;
  id v26;
  void *v27;
  id *v28;
  uint64_t v29;
  id v31;
  uint64_t v32;
  id v33;
  void *v34;
  id *v35;
  void *v36;
  uint64_t v37;
  id v38;
  float32x4_t *v39;
  char v40;
  char v41;
  uint64_t v42;
  id v43;
  char v44;
  char *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  uint64_t v55;
  char v56;
  char v57;
  void *v58;
  uint64_t v59;
  char v60;
  char v61;
  void *v62;
  void *v63;
  id v64;
  id v65;
  _QWORD *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  unint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  float *v77;
  float *v78;
  float *v80;
  uint64_t v82;
  uint64_t v83;
  double v84;
  uint64_t v85;
  uint64_t v86;
  double v87;
  uint64_t v88;
  uint64_t v89;
  double v90;
  uint64_t v91;
  uint64_t v92;
  double v93;
  uint64_t v94;
  uint64_t v95;
  double v96;
  uint64_t v97;
  uint64_t v98;
  double v99;
  int v100;
  void *v101;
  LAUI_uniform_cubic_b_spline_renderer::renderer_t *v102;
  id v103;
  void *v104;
  id v105;
  id v106;
  unint64_t v107;
  unint64_t v108;
  id v109;
  id v110;
  unint64_t v111;
  unint64_t v112;
  id v113;
  _BOOL8 v114;
  id v115;
  unint64_t v116;
  unint64_t v117;
  uint64_t v118;
  std::__shared_weak_count *v119;
  unint64_t *p_shared_owners;
  unint64_t v121;
  unint64_t v122;
  unint64_t *v123;
  unint64_t v124;
  std::__shared_weak_count *v125;
  unint64_t *v126;
  unint64_t v127;
  float64x2_t v128;
  float64x2_t v129;
  float64x2_t v130;
  float64x2_t v131;
  float64x2_t v132;
  float64x2_t v133;
  float64x2_t v134;
  float64x2_t v135;
  float64x2_t v136;
  float64x2_t v137;
  float64x2_t v138;
  float64x2_t v139;
  float64x2_t v140;
  float64x2_t v141;
  float64x2_t v142;
  float64x2_t v143;
  float64x2_t v144;
  float64x2_t v145;
  float64x2_t v146;
  float64x2_t v147;
  float64x2_t v148;
  float64x2_t v149;
  char v150;
  void *v151;
  id *v152;
  uint64_t v153;
  _QWORD *v154;
  _BOOL4 v155;
  void *v156;
  float64x2_t v157;
  id *v158;
  void *v159;
  void *v160;
  _QWORD *v161;
  uint64_t v162;
  float64x2_t v163;
  char *v164;
  id *v166;
  _QWORD v167[4];
  uint64_t v168;
  std::__shared_weak_count *v169;
  _QWORD v170[3];
  _QWORD v171[3];
  _QWORD v172[3];
  _QWORD v173[3];
  _QWORD v174[3];
  _QWORD v175[3];
  _QWORD v176[8];
  _QWORD v177[8];
  _QWORD v178[8];
  _QWORD v179[8];
  _QWORD v180[8];
  _BYTE v181[64];
  _QWORD v182[8];
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  char v187;
  id v188;
  int64x2_t v189;
  uint64_t v190;
  int64x2_t v191;
  uint64_t v192;

  if (!*((_BYTE *)this + 8) && *((_QWORD *)this + 87) != *((_QWORD *)this + 86))
  {
    v2 = *((_QWORD *)this + 85) + 1;
    *((_QWORD *)this + 85) = v2;
    v3 = (unsigned __int8 *)this + 592;
    v4 = atomic_load((unsigned __int8 *)this + 592);
    v5 = v4 + 1 - 3 * ((1431655766 * (unint64_t)(v4 + 1)) >> 32);
    v6 = atomic_load(*((unsigned __int8 **)this + 72));
    v7 = v6 - 3 * ((1431655766 * (unint64_t)v6) >> 32);
    if (v5 == v7)
      NSLog(CFSTR("CubicBSplineRenderer (%p): dropping frame %llu."), this, v2);
    if (objc_msgSend(*((id *)this + 2), "isDrawableAvailable"))
    {
      objc_msgSend(*((id *)this + 2), "currentDrawable");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
    objc_msgSend(v8, "texture");
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 != v7)
    {
      v9 = CFSTR("CubicBSplineRenderer (%p): missing drawable, dropping frame %llu.");
      if (v8)
      {
        v10 = this;
        if (v160)
        {
          LAUI_uniform_cubic_b_spline_renderer::renderer_t::update_render_pass_descriptor((uint64_t)this, v8);
          if (*((_QWORD *)this + 67))
          {
            LAUI_uniform_cubic_b_spline_renderer::renderer_t::rebuild_cap_control_point_indices(this);
            do
              v11 = __ldaxr(v3);
            while (__stlxr(v11 + 1, v3));
            if (3 * ((171 * v11) >> 9))
            {
              do
                v12 = __ldaxr(v3);
              while (__stlxr(v12 - 3, v3));
            }
            v13 = *((id *)this + 3);
            objc_msgSend(*((id *)this + 66), "commandBuffer");
            v156 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = this;
            if (!*((_QWORD *)this + 75))
            {
              objc_msgSend(v156, "computeCommandEncoder");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = *((id *)this + 5);
              objc_msgSend(v15, "setComputePipelineState:", v16);

              v17 = objc_msgSend(v13, "newBufferWithLength:options:", 60, 33);
              v18 = (void *)*((_QWORD *)this + 75);
              *((_QWORD *)this + 75) = v17;

              objc_msgSend(v15, "setBuffer:offset:atIndex:", *((_QWORD *)this + 75), 0, 0);
              v191 = vdupq_n_s64(1uLL);
              v192 = 1;
              v189 = v191;
              v190 = 1;
              objc_msgSend(v15, "dispatchThreadgroups:threadsPerThreadgroup:", &v191, &v189);
              objc_msgSend(v15, "endEncoding");

              v14 = this;
            }
            v19 = *((_QWORD *)v14 + 69);
            v153 = objc_msgSend(v160, "width");
            v162 = objc_msgSend(v160, "height");
            v20 = (v11 - 3 * ((171 * v11) >> 9));
            v21 = *((float *)this + 181);
            v155 = 1;
            if (*((float *)this + 180) >= 1.0 && v21 <= 0.0)
              v155 = *((float *)this + 182) > 0.0;
            v166 = (id *)(v19 + 48 * v20 + 8);
            v152 = (id *)(v19 + 48 * v20 + 16);
            v154 = (_QWORD *)(v19 + 48 * v20);
            v22 = v13;
            v23 = this;
            v24 = (_BYTE *)*((_QWORD *)this + 99);
            v25 = (_BYTE *)*((_QWORD *)this + 98);
            v26 = v22;
            v28 = (id *)(v154 + 4);
            v27 = (void *)v154[4];
            if (!v27 || objc_msgSend(v27, "length") != v24 - v25)
            {
              if (v24 == v25)
                v29 = 0;
              else
                v29 = objc_msgSend(v26, "newBufferWithLength:options:", v24 - v25, 1);
              v31 = *v28;
              *v28 = (id)v29;

            }
            if (*v28)
              memcpy((void *)objc_msgSend(objc_retainAutorelease(*v28), "contents"), v25, v24 - v25);

            v32 = v19 + 48 * v20;
            v128 = *((float64x2_t *)this + 9);
            v129 = *((float64x2_t *)this + 11);
            v130 = *((float64x2_t *)this + 10);
            v131 = *((float64x2_t *)this + 13);
            v132 = *((float64x2_t *)this + 12);
            v134 = *((float64x2_t *)this + 14);
            v135 = *((float64x2_t *)this + 16);
            v133 = *((float64x2_t *)this + 15);
            v141 = *((float64x2_t *)this + 20);
            v142 = *((float64x2_t *)this + 18);
            v138 = *((float64x2_t *)this + 19);
            v139 = *((float64x2_t *)this + 17);
            v140 = *((float64x2_t *)this + 22);
            v136 = *((float64x2_t *)this + 23);
            v137 = *((float64x2_t *)this + 21);
            v143 = *((float64x2_t *)this + 25);
            v148 = *((float64x2_t *)this + 28);
            v149 = *((float64x2_t *)this + 26);
            v144 = *((float64x2_t *)this + 27);
            v145 = *((float64x2_t *)this + 24);
            v163 = *((float64x2_t *)this + 30);
            v157 = *((float64x2_t *)this + 32);
            v146 = *((float64x2_t *)this + 31);
            v147 = *((float64x2_t *)this + 29);
            v33 = v26;
            v36 = *(void **)(v32 + 40);
            v35 = (id *)(v32 + 40);
            v34 = v36;
            if (!v36 || objc_msgSend(v34, "length") != 192)
            {
              v37 = objc_msgSend(v33, "newBufferWithLength:options:", 192, 1);
              v38 = *v35;
              *v35 = (id)v37;

            }
            if (*v35)
            {
              v39 = (float32x4_t *)objc_msgSend(objc_retainAutorelease(*v35), "contents");
              *v39 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v128), v130);
              v39[1] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v129), v132);
              v39[2] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v131), v134);
              v39[3] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v133), v135);
              v39[4] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v139), v142);
              v39[5] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v138), v141);
              v39[6] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v137), v140);
              v39[7] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v136), v145);
              v39[8] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v143), v149);
              v39[9] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v144), v148);
              v39[10] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v147), v163);
              v39[11] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v146), v157);
            }
            v158 = v35;

            v40 = 0;
            v41 = 0;
            v42 = 0;
            v43 = 0;
            v44 = v155;
            if (v21 > 0.0)
              v44 = 1;
            v150 = v44;
            v164 = (char *)this + 648;
            while (2)
            {
              v45 = (char *)this + 648;
              while (1)
              {
                v46 = v42;
                v47 = *(void **)&v45[8 * v42];
                if (v47)
                {
                  if (objc_msgSend(v47, "width") == v153 && objc_msgSend(*(id *)&v164[8 * v46], "height") == v162)
                    break;
                }
                v48 = objc_msgSend(*((id *)this + 2), "pixelFormat");
                if (v43)
                {
                  objc_msgSend(v43, "setPixelFormat:", v48);
                }
                else
                {
                  objc_msgSend(MEMORY[0x24BDDD740], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", v48, v153, v162, 0);
                  v43 = (id)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v43, "setStorageMode:", 2);
                  objc_msgSend(v43, "setUsage:", 7);
                }
                v43 = v43;
                v49 = objc_msgSend(v33, "newTextureWithDescriptor:", v43);
                v45 = (char *)this + 648;
                v50 = *(void **)&v164[8 * v46];
                *(_QWORD *)&v164[8 * v46] = v49;

                v41 = 1;
                v42 = 1;
                if (v46)
                {
                  if ((v40 & 1) == 0)
                  {
                    *((_QWORD *)this + 83) = 0;
                    *((_BYTE *)this + 640) = 0;
                    goto LABEL_68;
                  }
                  goto LABEL_58;
                }
              }
              v40 = 1;
              v42 = 1;
              if (!v46)
                continue;
              break;
            }
            if ((v41 & 1) != 0)
            {
LABEL_58:

              goto LABEL_59;
            }

            if ((v150 & 1) != 0)
              goto LABEL_69;
LABEL_59:
            if (!*((_BYTE *)this + 640))
              goto LABEL_69;
            *((_QWORD *)this + 83) = 0;
            *((_BYTE *)this + 640) = 0;
            v51 = (void *)*((_QWORD *)this + 68);
            if (!v51)
            {
              v52 = objc_alloc_init(MEMORY[0x24BDDD690]);
              v53 = (void *)*((_QWORD *)this + 68);
              *((_QWORD *)this + 68) = v52;

              objc_msgSend(*((id *)this + 68), "colorAttachments");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              v55 = 0;
              v56 = 1;
              do
              {
                v57 = v56;
                objc_msgSend(v54, "objectAtIndexedSubscript:", v55);
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v58, "setLoadAction:", 2);
                objc_msgSend(v58, "setClearColor:", 0.0, 0.0, 0.0, 0.0);
                objc_msgSend(v58, "setStoreAction:", 1);

                v56 = 0;
                v55 = 1;
              }
              while ((v57 & 1) != 0);

              v51 = (void *)*((_QWORD *)this + 68);
            }
            objc_msgSend(v51, "colorAttachments");
            v43 = (id)objc_claimAutoreleasedReturnValue();
            v59 = 0;
            v60 = 1;
            do
            {
              v61 = v60;
              objc_msgSend(v43, "objectAtIndexedSubscript:", v59);
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v62, "setTexture:", *(_QWORD *)&v164[8 * v59]);

              v60 = 0;
              v59 = 1;
            }
            while ((v61 & 1) != 0);
            objc_msgSend(v156, "renderCommandEncoderWithDescriptor:", *((_QWORD *)this + 68));
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v63, "endEncoding");

            v23 = this;
LABEL_68:

LABEL_69:
            objc_msgSend(v156, "renderCommandEncoderWithDescriptor:", *((_QWORD *)v23 + 67));
            v188 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v188, "setTriangleFillMode:", *((unsigned __int8 *)this + 128));
            v64 = *((id *)this + 4);
            if (v64)
            {
              objc_msgSend(v188, "setDepthStencilState:", v64);
              objc_msgSend(v188, "setFrontFacingWinding:", 0);
              objc_msgSend(v188, "setCullMode:", 2);
            }

            objc_msgSend(v188, "setVertexBuffer:offset:atIndex:", *v154, 0, 0);
            objc_msgSend(v188, "setVertexBuffer:offset:atIndex:", v154[4], 0, 1);
            objc_msgSend(v188, "setVertexBuffer:offset:atIndex:", *v158, 0, 2);
            v187 = 0;
            v65 = *((id *)this + 6);
            objc_msgSend(v188, "setRenderPipelineState:", v65);

            objc_msgSend(v188, "setTessellationFactorBuffer:offset:instanceStride:", *((_QWORD *)this + 75), 0, 0);
            v151 = v33;
            v66 = (_QWORD *)*((_QWORD *)this + 86);
            v161 = (_QWORD *)*((_QWORD *)this + 87);
            v159 = v8;
            if (v66 != v161)
            {
              v67 = 0;
              v68 = 0;
              v69 = 0;
              do
              {
                v70 = v66[1];
                if (v70 <= 3)
                  v70 = 3;
                v71 = v70 - 3;
                v73 = v66[4];
                v72 = v66[5];
                v74 = v72 - v73;
                if (v72 != v73)
                {
                  objc_msgSend(v188, "setVertexBufferOffset:atIndex:", v69, 1);
                  v75 = 0xCCCCCCCCCCCCCCCDLL * (v74 >> 4);
                  v76 = *((_QWORD *)this + 98) + 96 * v68;
                  v77 = (float *)(v76 + 96 * v75);
                  v78 = (float *)v76;
                  do
                  {
                    while (v78[19] < 0.0039216 || (float)(v78[21] + v78[22]) >= 1.0)
                    {
                      v78 += 24;
                      if (v78 == v77)
                        goto LABEL_96;
                    }
                    v80 = (float *)(v76 + 96 * v75);
                    if (v78 != v77)
                    {
                      v80 = v78;
                      while (v80[19] >= 0.0039216 && (float)(v80[21] + v80[22]) < 1.0)
                      {
                        v80 += 24;
                        if (v80 == v77)
                        {
                          v80 = (float *)(v76 + 96 * v75);
                          break;
                        }
                      }
                    }
                    if (v78 != v77 && v78 != v80)
                      objc_msgSend(v188, "drawIndexedPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:controlPointIndexBuffer:controlPointIndexBufferOffset:instanceCount:baseInstance:", 4, 0, v71, 0, 0, *v166, v67, 0xAAAAAAAAAAAAAAABLL * (((char *)v80 - (char *)v78) >> 5), 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v78 - v76) >> 5));
                    v78 = v80;
                  }
                  while (v80 != v77);
LABEL_96:
                  v68 += v75;
                  v69 += 96 * v75;
                  v8 = v159;
                }
                v67 += 8 * v71;
                v66 += 7;
              }
              while (v66 != v161);
            }
            objc_msgSend(v188, "setVertexBuffer:offset:atIndex:", *v152, 0, 0);
            v185 = 3;
            v186 = 0;
            v183 = 0;
            v184 = 0;
            objc_msgSend(v188, "setRenderPipelineState:", *((_QWORD *)this + 7));
            objc_msgSend(v188, "setTessellationFactorBuffer:offset:instanceStride:", *((_QWORD *)this + 75), 12, 0);
            v82 = *((_QWORD *)this + 86);
            v83 = *((_QWORD *)this + 87);
            v182[0] = &v188;
            v182[1] = &v183;
            v182[2] = &v187;
            v182[3] = this;
            v182[4] = &v184;
            v182[5] = &v185;
            v182[6] = v154;
            v182[7] = &v186;
            *(_QWORD *)&v84 = std::for_each[abi:ne180100]<std::__wrap_iter<LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t *>,LAUI_uniform_cubic_b_spline_renderer::renderer_t::render(void)::$_2>(v82, v83, (uint64_t)v182, (uint64_t)v181).n128_u64[0];
            v184 = 0;
            v185 = 4;
            v183 = 0;
            objc_msgSend(v188, "setRenderPipelineState:", *((_QWORD *)this + 8), v84);
            objc_msgSend(v188, "setTessellationFactorBuffer:offset:instanceStride:", *((_QWORD *)this + 75), 36, 0);
            v85 = *((_QWORD *)this + 86);
            v86 = *((_QWORD *)this + 87);
            v180[0] = &v188;
            v180[1] = &v183;
            v180[2] = &v187;
            v180[3] = this;
            v180[4] = &v184;
            v180[5] = &v185;
            v180[6] = v154;
            v180[7] = &v186;
            *(_QWORD *)&v87 = std::for_each[abi:ne180100]<std::__wrap_iter<LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t *>,LAUI_uniform_cubic_b_spline_renderer::renderer_t::render(void)::$_2>(v85, v86, (uint64_t)v180, (uint64_t)v181).n128_u64[0];
            v184 = 0;
            v185 = 5;
            v183 = 0;
            objc_msgSend(v188, "setRenderPipelineState:", *((_QWORD *)this + 9), v87);
            objc_msgSend(v188, "setTessellationFactorBuffer:offset:instanceStride:", *((_QWORD *)this + 75), 48, 0);
            v88 = *((_QWORD *)this + 86);
            v89 = *((_QWORD *)this + 87);
            v179[0] = &v188;
            v179[1] = &v183;
            v179[2] = &v187;
            v179[3] = this;
            v179[4] = &v184;
            v179[5] = &v185;
            v179[6] = v154;
            v179[7] = &v186;
            *(_QWORD *)&v90 = std::for_each[abi:ne180100]<std::__wrap_iter<LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t *>,LAUI_uniform_cubic_b_spline_renderer::renderer_t::render(void)::$_2>(v88, v89, (uint64_t)v179, (uint64_t)v181).n128_u64[0];
            v184 = 0;
            v185 = 3;
            v183 = 0;
            objc_msgSend(v188, "setRenderPipelineState:", *((_QWORD *)this + 10), v90);
            objc_msgSend(v188, "setTessellationFactorBuffer:offset:instanceStride:", *((_QWORD *)this + 75), 24, 0);
            v91 = *((_QWORD *)this + 86);
            v92 = *((_QWORD *)this + 87);
            v178[0] = &v188;
            v178[1] = &v183;
            v178[2] = &v187;
            v178[3] = this;
            v178[4] = &v184;
            v178[5] = &v185;
            v178[6] = v154;
            v178[7] = &v186;
            *(_QWORD *)&v93 = std::for_each[abi:ne180100]<std::__wrap_iter<LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t *>,LAUI_uniform_cubic_b_spline_renderer::renderer_t::render(void)::$_2>(v91, v92, (uint64_t)v178, (uint64_t)v181).n128_u64[0];
            v184 = 0;
            v185 = 4;
            v183 = 0;
            objc_msgSend(v188, "setRenderPipelineState:", *((_QWORD *)this + 11), v93);
            objc_msgSend(v188, "setTessellationFactorBuffer:offset:instanceStride:", *((_QWORD *)this + 75), 36, 0);
            v94 = *((_QWORD *)this + 86);
            v95 = *((_QWORD *)this + 87);
            v177[0] = &v188;
            v177[1] = &v183;
            v177[2] = &v187;
            v177[3] = this;
            v177[4] = &v184;
            v177[5] = &v185;
            v177[6] = v154;
            v177[7] = &v186;
            *(_QWORD *)&v96 = std::for_each[abi:ne180100]<std::__wrap_iter<LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t *>,LAUI_uniform_cubic_b_spline_renderer::renderer_t::render(void)::$_2>(v94, v95, (uint64_t)v177, (uint64_t)v181).n128_u64[0];
            v184 = 0;
            v185 = 5;
            v183 = 0;
            objc_msgSend(v188, "setRenderPipelineState:", *((_QWORD *)this + 12), v96);
            objc_msgSend(v188, "setTessellationFactorBuffer:offset:instanceStride:", *((_QWORD *)this + 75), 48, 0);
            v97 = *((_QWORD *)this + 86);
            v98 = *((_QWORD *)this + 87);
            v176[0] = &v188;
            v176[1] = &v183;
            v176[2] = &v187;
            v176[3] = this;
            v176[4] = &v184;
            v176[5] = &v185;
            v176[6] = v154;
            v176[7] = &v186;
            *(_QWORD *)&v99 = std::for_each[abi:ne180100]<std::__wrap_iter<LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t *>,LAUI_uniform_cubic_b_spline_renderer::renderer_t::render(void)::$_2>(v97, v98, (uint64_t)v176, (uint64_t)v181).n128_u64[0];
            objc_msgSend(v188, "endEncoding", v99);
            v100 = v21 > 0.0 || v155;
            if (v100 == 1)
            {
              objc_msgSend(v156, "computeCommandEncoder");
              v101 = (void *)objc_claimAutoreleasedReturnValue();
              if (v155)
              {
                v102 = this;
                if (*((_BYTE *)this + 640))
                {
                  v103 = *(id *)&v164[8 * *((_QWORD *)this + 83)];
                  v104 = v103;
                  if (v103)
                  {
                    if (objc_msgSend(v103, "width") != v153 && objc_msgSend(v104, "height") != v162)
                    {

                      v104 = 0;
                    }
                    v102 = this;
                  }
                }
                else
                {
                  v104 = 0;
                }
                v105 = *((id *)v102 + 15);
                objc_msgSend(v101, "setComputePipelineState:", v105);

                objc_msgSend(v101, "setBytes:length:atIndex:", (char *)this + 720, 12, 0);
                objc_msgSend(v101, "setTexture:atIndex:", v160, 0);
                objc_msgSend(v101, "setTexture:atIndex:", v104, 1);
                v106 = *((id *)this + 15);
                v107 = objc_msgSend(v106, "threadExecutionWidth");
                v108 = objc_msgSend(v106, "maxTotalThreadsPerThreadgroup") / v107;

                v175[0] = (v153 + v107 - 1) / v107;
                v175[1] = (v162 + v108 - 1) / v108;
                v175[2] = 1;
                v174[0] = v107;
                v174[1] = v108;
                v174[2] = 1;
                objc_msgSend(v101, "dispatchThreadgroups:threadsPerThreadgroup:", v175, v174);
                v8 = v159;

              }
              if (v21 > 0.0)
              {
                *((_BYTE *)this + 640) = 1;
                v109 = *((id *)this + 13);
                objc_msgSend(v101, "setComputePipelineState:", v109);

                objc_msgSend(v101, "setBytes:length:atIndex:", (char *)this + 732, 4, 0);
                *((_QWORD *)this + 83) = (*((_DWORD *)this + 166) & 1) == 0;
                objc_msgSend(v101, "setTexture:atIndex:", v160, 0);
                objc_msgSend(v101, "setTexture:atIndex:", *(_QWORD *)&v164[8 * *((_QWORD *)this + 83)], 1);
                v110 = *((id *)this + 13);
                v111 = objc_msgSend(v110, "threadExecutionWidth");
                v112 = objc_msgSend(v110, "maxTotalThreadsPerThreadgroup") / v111;

                v173[0] = (v111 + v153 - 1) / v111;
                v173[1] = (v112 + v162 - 1) / v112;
                v173[2] = 1;
                v172[0] = v111;
                v172[1] = v112;
                v172[2] = 1;
                objc_msgSend(v101, "dispatchThreadgroups:threadsPerThreadgroup:", v173, v172);
                v113 = *((id *)this + 14);
                objc_msgSend(v101, "setComputePipelineState:", v113);

                objc_msgSend(v101, "setTexture:atIndex:", *(_QWORD *)&v164[8 * *((_QWORD *)this + 83)], 0);
                v114 = (*((_DWORD *)this + 166) & 1) == 0;
                *((_QWORD *)this + 83) = v114;
                objc_msgSend(v101, "setTexture:atIndex:", *(_QWORD *)&v164[8 * v114], 1);
                v115 = *((id *)this + 14);
                v116 = objc_msgSend(v115, "threadExecutionWidth");
                v117 = objc_msgSend(v115, "maxTotalThreadsPerThreadgroup") / v116;

                v171[0] = (v116 + v153 - 1) / v116;
                v171[1] = (v117 + v162 - 1) / v117;
                v171[2] = 1;
                v170[0] = v116;
                v170[1] = v117;
                v170[2] = 1;
                objc_msgSend(v101, "dispatchThreadgroups:threadsPerThreadgroup:", v171, v170);
              }
              objc_msgSend(v101, "endEncoding");

            }
            objc_msgSend(v156, "presentDrawable:", v8);
            v167[0] = MEMORY[0x24BDAC760];
            v167[1] = 3321888768;
            v167[2] = ___ZN36LAUI_uniform_cubic_b_spline_renderer10renderer_t6renderEv_block_invoke;
            v167[3] = &__block_descriptor_48_ea8_32c71_ZTSKZN36LAUI_uniform_cubic_b_spline_renderer10renderer_t6renderEvE3__7_e28_v16__0___MTLCommandBuffer__8l;
            v118 = *((_QWORD *)this + 72);
            v119 = (std::__shared_weak_count *)*((_QWORD *)this + 73);
            if (v119)
            {
              p_shared_owners = (unint64_t *)&v119->__shared_owners_;
              do
                v121 = __ldxr(p_shared_owners);
              while (__stxr(v121 + 1, p_shared_owners));
              v168 = v118;
              v169 = v119;
              do
                v122 = __ldxr(p_shared_owners);
              while (__stxr(v122 + 1, p_shared_owners));
            }
            else
            {
              v168 = *((_QWORD *)this + 72);
              v169 = 0;
            }
            objc_msgSend(v156, "addCompletedHandler:", v167);
            if (v119)
            {
              v123 = (unint64_t *)&v119->__shared_owners_;
              do
                v124 = __ldaxr(v123);
              while (__stlxr(v124 - 1, v123));
              if (!v124)
              {
                ((void (*)(std::__shared_weak_count *))v119->__on_zero_shared)(v119);
                std::__shared_weak_count::__release_weak(v119);
              }
            }
            objc_msgSend(v156, "commit");
            v125 = v169;
            if (v169)
            {
              v126 = (unint64_t *)&v169->__shared_owners_;
              do
                v127 = __ldaxr(v126);
              while (__stlxr(v127 - 1, v126));
              if (!v127)
              {
                ((void (*)(std::__shared_weak_count *))v125->__on_zero_shared)(v125);
                std::__shared_weak_count::__release_weak(v125);
              }
            }

            v1 = 1;
            goto LABEL_30;
          }
          v9 = CFSTR("CubicBSplineRenderer (%p): missing render pass descriptor, dropping frame %llu.");
        }
      }
      else
      {
        v10 = this;
      }
      NSLog(&v9->isa, v10, v2);
    }
    v1 = 0;
LABEL_30:

    return v1;
  }
  return 1;
}

void sub_209E17A08(void *a1)
{
  void *v1;

  __clang_call_terminate(a1);
}

void `anonymous namespace'::copy_into_buffer<std::vector<LAUI_uniform_cubic_b_spline_renderer_private::control_point>>(id *a1, uint64_t a2, void *a3)
{
  id v5;
  const void *v6;
  const void *v7;
  size_t v8;
  uint64_t v9;
  id v10;
  id v11;

  v5 = a3;
  v6 = *(const void **)a2;
  v7 = *(const void **)(a2 + 8);
  v8 = (size_t)v7 - *(_QWORD *)a2;
  v11 = v5;
  if (!*a1 || objc_msgSend(*a1, "length") != v8)
  {
    if (v7 == v6)
      v9 = 0;
    else
      v9 = objc_msgSend(v11, "newBufferWithLength:options:", v8, 1);
    v10 = *a1;
    *a1 = (id)v9;

  }
  if (*a1)
    memcpy((void *)objc_msgSend(objc_retainAutorelease(*a1), "contents"), v6, v8);

}

void sub_209E17B14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void `anonymous namespace'::copy_into_buffer<std::vector<unsigned short>>(id *a1, uint64_t a2, void *a3)
{
  id v5;
  const void *v6;
  const void *v7;
  size_t v8;
  uint64_t v9;
  id v10;
  id v11;

  v5 = a3;
  v6 = *(const void **)a2;
  v7 = *(const void **)(a2 + 8);
  v8 = (size_t)v7 - *(_QWORD *)a2;
  v11 = v5;
  if (!*a1 || objc_msgSend(*a1, "length") != v8)
  {
    if (v7 == v6)
      v9 = 0;
    else
      v9 = objc_msgSend(v11, "newBufferWithLength:options:", v8, 1);
    v10 = *a1;
    *a1 = (id)v9;

  }
  if (*a1)
    memcpy((void *)objc_msgSend(objc_retainAutorelease(*a1), "contents"), v6, v8);

}

void sub_209E17BDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

__n128 std::for_each[abi:ne180100]<std::__wrap_iter<LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t *>,LAUI_uniform_cubic_b_spline_renderer::renderer_t::render(void)::$_2>@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  float *v18;
  uint64_t *v20;
  __int128 v21;
  __n128 result;
  __int128 v23;

  if (a1 != a2)
  {
    v6 = a1;
    v7 = **(_QWORD **)(a3 + 8);
    do
    {
      v8 = *(_QWORD *)(a3 + 24);
      v10 = *(_QWORD *)(v6 + 32);
      v9 = *(_QWORD *)(v6 + 40);
      objc_msgSend(**(id **)a3, "setVertexBufferOffset:atIndex:", v7, 1);
      v11 = v9 == v10;
      v12 = (unsigned __int128)((v9 - v10) * (__int128)0x6666666666666667) >> 64;
      v13 = (v9 - v10) / 80;
      if (!v11)
      {
        v14 = 0;
        if (v13 <= 1)
          v15 = 1;
        else
          v15 = (v12 >> 5) + ((unint64_t)v12 >> 63);
        v16 = *(_QWORD **)(a3 + 40);
        v17 = *(_QWORD **)(a3 + 56);
        do
        {
          v18 = (float *)(*(_QWORD *)(v8 + 784) + 96 * (v14 + **(_QWORD **)(a3 + 32)));
          if (v18[19] >= 0.0039216 && (float)(v18[21] + v18[22]) < 1.0)
          {
            objc_msgSend(**(id **)a3, "drawIndexedPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:controlPointIndexBuffer:controlPointIndexBufferOffset:instanceCount:baseInstance:", *v16, 0, 1, 0, 0, *(_QWORD *)(*(_QWORD *)(a3 + 48) + 24), *v17, 1, v14);
            v16 = *(_QWORD **)(a3 + 40);
            v17 = *(_QWORD **)(a3 + 56);
          }
          *v17 += 2 * *v16;
          ++v14;
        }
        while (v15 != v14);
      }
      **(_QWORD **)(a3 + 32) += v13;
      v20 = *(uint64_t **)(a3 + 8);
      v7 = *v20 + 96 * v13;
      *v20 = v7;
      v6 += 56;
    }
    while (v6 != a2);
  }
  v21 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)a4 = *(_OWORD *)a3;
  *(_OWORD *)(a4 + 16) = v21;
  result = *(__n128 *)(a3 + 32);
  v23 = *(_OWORD *)(a3 + 48);
  *(__n128 *)(a4 + 32) = result;
  *(_OWORD *)(a4 + 48) = v23;
  return result;
}

uint64_t ___ZN36LAUI_uniform_cubic_b_spline_renderer10renderer_t6renderEv_block_invoke(uint64_t result)
{
  unsigned __int8 *v1;
  int v2;
  unsigned __int8 *v3;
  unsigned __int8 v4;

  v1 = *(unsigned __int8 **)(result + 32);
  do
    v2 = __ldaxr(v1);
  while (__stlxr(v2 + 1, v1));
  if (3 * ((171 * v2) >> 9))
  {
    v3 = *(unsigned __int8 **)(result + 32);
    do
      v4 = __ldaxr(v3);
    while (__stlxr(v4 - 3, v3));
  }
  return result;
}

uint64_t __copy_helper_block_ea8_32c71_ZTSKZN36LAUI_uniform_cubic_b_spline_renderer10renderer_t6renderEvE3__7(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(result + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(result + 40) = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

uint64_t __destroy_helper_block_ea8_32c71_ZTSKZN36LAUI_uniform_cubic_b_spline_renderer10renderer_t6renderEvE3__7(uint64_t a1)
{
  return std::shared_ptr<std::atomic<unsigned char>>::~shared_ptr[abi:ne180100](a1 + 32);
}

id LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::shared_state_t(uint64_t a1, void *a2)
{
  id result;

  result = a2;
  *(_QWORD *)a1 = result;
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  if (result)
  {

    return (id)a1;
  }
  else
  {
    __break(1u);
  }
  return result;
}

LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t *LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::shared_state_t(LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t *this, const shared_state_t *a2)
{
  uint64_t i;

  *(_QWORD *)this = a2->_device;
  *((_QWORD *)this + 1) = a2->_depth_stencil_state;
  *((_QWORD *)this + 2) = a2->_tesselation_factor_pipeline;
  *((_QWORD *)this + 3) = a2->_tube_pipeline;
  for (i = 32; i != 56; i += 8)
    *(_QWORD *)((char *)this + i) = *(id *)((char *)&a2->_device + i);
  do
  {
    *(_QWORD *)((char *)this + i) = *(id *)((char *)&a2->_device + i);
    i += 8;
  }
  while (i != 80);
  *((_QWORD *)this + 10) = a2->_horizontal_blur_pipeline;
  *((_QWORD *)this + 11) = a2->_vertical_blur_pipeline;
  *((_QWORD *)this + 12) = a2->_accumulator_pipeline;
  return this;
}

uint64_t std::vector<LAUI_uniform_cubic_b_spline_renderer::renderer_t::buffers_t>::__emplace_back_slow_path<LAUI_uniform_cubic_b_spline_renderer::renderer_t::buffers_t>(uint64_t *a1, __int128 *a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  _QWORD v18[5];

  v3 = *a1;
  v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 4);
  v5 = v4 + 1;
  if (v4 + 1 > 0x555555555555555)
    std::vector<UIView * {__strong}>::__throw_length_error[abi:ne180100]();
  v7 = (uint64_t)(a1 + 2);
  v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 4);
  if (2 * v8 > v5)
    v5 = 2 * v8;
  if (v8 >= 0x2AAAAAAAAAAAAAALL)
    v9 = 0x555555555555555;
  else
    v9 = v5;
  v18[4] = a1 + 2;
  v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<LAUI_uniform_cubic_b_spline_renderer::renderer_t::buffers_t>>(v7, v9);
  v11 = &v10[48 * v4];
  v18[0] = v10;
  v18[1] = v11;
  v18[3] = &v10[48 * v12];
  v13 = *a2;
  *a2 = 0u;
  *(_OWORD *)v11 = v13;
  v14 = a2[1];
  a2[1] = 0u;
  *((_OWORD *)v11 + 1) = v14;
  v15 = a2[2];
  a2[2] = 0u;
  *((_OWORD *)v11 + 2) = v15;
  v18[2] = v11 + 48;
  std::vector<LAUI_uniform_cubic_b_spline_renderer::renderer_t::buffers_t>::__swap_out_circular_buffer(a1, v18);
  v16 = a1[1];
  std::__split_buffer<LAUI_uniform_cubic_b_spline_renderer::renderer_t::buffers_t>::~__split_buffer((uint64_t)v18);
  return v16;
}

void sub_209E17FF8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<LAUI_uniform_cubic_b_spline_renderer::renderer_t::buffers_t>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::vector<LAUI_uniform_cubic_b_spline_renderer::renderer_t::buffers_t>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<LAUI_uniform_cubic_b_spline_renderer::renderer_t::buffers_t>,std::reverse_iterator<LAUI_uniform_cubic_b_spline_renderer::renderer_t::buffers_t*>,std::reverse_iterator<LAUI_uniform_cubic_b_spline_renderer::renderer_t::buffers_t*>,std::reverse_iterator<LAUI_uniform_cubic_b_spline_renderer::renderer_t::buffers_t*>>((uint64_t)(a1 + 2), a1[1], (_OWORD *)a1[1], *a1, (_OWORD *)*a1, a2[1], a2[1]);
  a2[1] = v5;
  v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<LAUI_uniform_cubic_b_spline_renderer::renderer_t::buffers_t>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x555555555555556)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(48 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<LAUI_uniform_cubic_b_spline_renderer::renderer_t::buffers_t>,std::reverse_iterator<LAUI_uniform_cubic_b_spline_renderer::renderer_t::buffers_t*>,std::reverse_iterator<LAUI_uniform_cubic_b_spline_renderer::renderer_t::buffers_t*>,std::reverse_iterator<LAUI_uniform_cubic_b_spline_renderer::renderer_t::buffers_t*>>(uint64_t a1, uint64_t a2, _OWORD *a3, uint64_t a4, _OWORD *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t result;
  _OWORD *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;

  v7 = a7;
  result = a6;
  if (a3 != a5)
  {
    v9 = (_OWORD *)(a7 - 16);
    do
    {
      v10 = *(a3 - 3);
      a3 -= 3;
      *a3 = 0uLL;
      *(v9 - 2) = v10;
      v11 = a3[1];
      a3[1] = 0uLL;
      *(v9 - 1) = v11;
      v12 = a3[2];
      a3[2] = 0uLL;
      *v9 = v12;
      v9 -= 3;
      v7 -= 48;
    }
    while (a3 != a5);
  }
  return result;
}

void std::__destroy_at[abi:ne180100]<LAUI_uniform_cubic_b_spline_renderer::renderer_t::buffers_t,0>(id *a1)
{

}

uint64_t std::__split_buffer<LAUI_uniform_cubic_b_spline_renderer::renderer_t::buffers_t>::~__split_buffer(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 48;
    std::__destroy_at[abi:ne180100]<LAUI_uniform_cubic_b_spline_renderer::renderer_t::buffers_t,0>((id *)(i - 48));
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

uint64_t std::vector<LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t>::__emplace_back_slow_path<LAUI_uniform_cubic_b_spline_renderer::indexed_identifier_t<LAUI_uniform_cubic_b_spline_renderer::spline_t> const&,LAUI_uniform_cubic_b_spline_renderer::spline_t const&,std::span<LAUI_uniform_cubic_b_spline_renderer_private::control_point,18446744073709551615ul> const&,LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t const&>(uint64_t *a1, _QWORD *a2, uint64_t *a3, __int128 *a4, __int128 **a5)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  char *v16;
  char *v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v22[5];

  v6 = *a1;
  v7 = 0x6DB6DB6DB6DB6DB7 * ((a1[1] - *a1) >> 3);
  v8 = v7 + 1;
  if ((unint64_t)(v7 + 1) > 0x492492492492492)
    std::vector<UIView * {__strong}>::__throw_length_error[abi:ne180100]();
  v13 = (uint64_t)(a1 + 2);
  v14 = 0x6DB6DB6DB6DB6DB7 * ((a1[2] - v6) >> 3);
  if (2 * v14 > v8)
    v8 = 2 * v14;
  if (v14 >= 0x249249249249249)
    v15 = 0x492492492492492;
  else
    v15 = v8;
  v22[4] = a1 + 2;
  if (v15)
    v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t>>(v13, v15);
  else
    v16 = 0;
  v17 = &v16[56 * v7];
  v22[0] = v16;
  v22[1] = v17;
  v22[3] = &v16[56 * v15];
  v18 = *a4;
  *(_QWORD *)v17 = *a2;
  v19 = *a3;
  *((_QWORD *)v17 + 1) = *a3;
  *((_OWORD *)v17 + 1) = v18;
  *((_QWORD *)v17 + 5) = 0;
  *((_QWORD *)v17 + 6) = 0;
  *((_QWORD *)v17 + 4) = 0;
  if (v19)
    LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t::set_state(v17, a5);
  v22[2] = v17 + 56;
  std::vector<LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t>::__swap_out_circular_buffer(a1, v22);
  v20 = a1[1];
  std::__split_buffer<LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t>::~__split_buffer((uint64_t)v22);
  return v20;
}

void sub_209E182E0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::vector<LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t>,std::reverse_iterator<LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t*>,std::reverse_iterator<LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t*>,std::reverse_iterator<LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x492492492492493)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(56 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t>,std::reverse_iterator<LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t*>,std::reverse_iterator<LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t*>,std::reverse_iterator<LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[3];
  char v13;
  __int128 v14;
  __int128 v15;

  v7 = a7;
  *(_QWORD *)&v15 = a6;
  *((_QWORD *)&v15 + 1) = a7;
  v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  v12[2] = &v15;
  v13 = 0;
  if (a3 == a5)
  {
    v10 = a6;
  }
  else
  {
    v9 = a3;
    do
    {
      v9 -= 56;
      LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t::spline_container_t(v7 - 56, v9);
      v7 = *((_QWORD *)&v15 + 1) - 56;
      *((_QWORD *)&v15 + 1) -= 56;
    }
    while (v9 != a5);
    v10 = v15;
  }
  v13 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t>,std::reverse_iterator<LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v12);
  return v10;
}

uint64_t LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t::spline_container_t(uint64_t a1, uint64_t a2)
{
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  void **i;

  *(_QWORD *)a1 = -1;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v3 = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = 0;
  *(_OWORD *)(a1 + 16) = v3;
  *(_QWORD *)(a1 + 40) = 0;
  *(_QWORD *)(a1 + 48) = 0;
  v4 = *(_QWORD *)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 40);
  for (i = (void **)(a1 + 32); v4 != v5; v4 += 80)
  {
    v8 = a1;
    v6 = *(_OWORD *)(v4 + 24);
    v9 = *(_OWORD *)(v4 + 8);
    v10 = v6;
    v11 = *(_QWORD *)(v4 + 40);
    v12 = *(_OWORD *)(v4 + 48);
    v13 = *(_OWORD *)(v4 + 64);
    std::back_insert_iterator<std::vector<LAUI_uniform_cubic_b_spline_renderer::renderer_t::instance_container_t>>::operator=[abi:ne180100](&i, &v8);
  }
  return a1;
}

void ***std::back_insert_iterator<std::vector<LAUI_uniform_cubic_b_spline_renderer::renderer_t::instance_container_t>>::operator=[abi:ne180100](void ***a1, _OWORD *a2)
{
  void **v4;
  _OWORD *v5;
  void **v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _OWORD *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  char *v18;
  char *v19;
  char *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  char *v24;
  char *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;

  v4 = *a1;
  v5 = (*a1)[1];
  v6 = *a1;
  v9 = (unint64_t)v6[2];
  v7 = (uint64_t)(v6 + 2);
  v8 = v9;
  if ((unint64_t)v5 >= v9)
  {
    v14 = 0xCCCCCCCCCCCCCCCDLL * (((char *)v5 - (_BYTE *)*v4) >> 4);
    v15 = v14 + 1;
    if (v14 + 1 > 0x333333333333333)
      std::vector<UIView * {__strong}>::__throw_length_error[abi:ne180100]();
    v16 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v8 - (_QWORD)*v4) >> 4);
    if (2 * v16 > v15)
      v15 = 2 * v16;
    if (v16 >= 0x199999999999999)
      v17 = 0x333333333333333;
    else
      v17 = v15;
    if (v17)
      v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<LAUI_uniform_cubic_b_spline_renderer::renderer_t::instance_container_t>>(v7, v17);
    else
      v18 = 0;
    v19 = &v18[80 * v14];
    v20 = &v18[80 * v17];
    *(_OWORD *)v19 = *a2;
    v21 = a2[1];
    v22 = a2[2];
    v23 = a2[4];
    *((_OWORD *)v19 + 3) = a2[3];
    *((_OWORD *)v19 + 4) = v23;
    *((_OWORD *)v19 + 1) = v21;
    *((_OWORD *)v19 + 2) = v22;
    v13 = v19 + 80;
    v25 = (char *)*v4;
    v24 = (char *)v4[1];
    if (v24 != *v4)
    {
      do
      {
        *((_OWORD *)v19 - 5) = *((_OWORD *)v24 - 5);
        v26 = *((_OWORD *)v24 - 4);
        v27 = *((_OWORD *)v24 - 3);
        v28 = *((_OWORD *)v24 - 1);
        *((_OWORD *)v19 - 2) = *((_OWORD *)v24 - 2);
        *((_OWORD *)v19 - 1) = v28;
        *((_OWORD *)v19 - 4) = v26;
        *((_OWORD *)v19 - 3) = v27;
        v19 -= 80;
        v24 -= 80;
      }
      while (v24 != v25);
      v24 = (char *)*v4;
    }
    *v4 = v19;
    v4[1] = v13;
    v4[2] = v20;
    if (v24)
      operator delete(v24);
  }
  else
  {
    *v5 = *a2;
    v10 = a2[1];
    v11 = a2[2];
    v12 = a2[4];
    v5[3] = a2[3];
    v5[4] = v12;
    v5[1] = v10;
    v5[2] = v11;
    v13 = v5 + 5;
  }
  v4[1] = v13;
  return a1;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<LAUI_uniform_cubic_b_spline_renderer::renderer_t::instance_container_t>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x333333333333334)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(80 * a2);
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t>,std::reverse_iterator<LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t>,std::reverse_iterator<LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t*>>::operator()[abi:ne180100](a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t>,std::reverse_iterator<LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    v3 = *(void **)(v1 + 32);
    if (v3)
    {
      *(_QWORD *)(v1 + 40) = v3;
      operator delete(v3);
    }
    v1 += 56;
  }
}

uint64_t std::__split_buffer<LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t>::~__split_buffer(uint64_t a1)
{
  std::__split_buffer<LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t>::__destruct_at_end[abi:ne180100](a1, *(_QWORD *)(a1 + 8));
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void std::__split_buffer<LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t>::__destruct_at_end[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v5;

  v2 = *(_QWORD *)(a1 + 16);
  while (v2 != a2)
  {
    *(_QWORD *)(a1 + 16) = v2 - 56;
    v5 = *(void **)(v2 - 24);
    if (v5)
    {
      *(_QWORD *)(v2 - 16) = v5;
      operator delete(v5);
      v2 = *(_QWORD *)(a1 + 16);
    }
    else
    {
      v2 -= 56;
    }
  }
}

void *std::vector<LAUI_uniform_cubic_b_spline_renderer_private::control_point>::__swap_out_circular_buffer(void **a1, uint64_t a2, char *__src)
{
  void *v5;
  char *v6;
  void *v7;
  char *v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  int64_t v12;
  char *v13;
  void *v14;
  void *v15;

  v5 = *(void **)(a2 + 8);
  v6 = (char *)*a1;
  v7 = v5;
  if (*a1 != __src)
  {
    v8 = __src;
    v9 = *(_QWORD *)(a2 + 8);
    do
    {
      v7 = (void *)(v9 - 16);
      *(_OWORD *)(v9 - 16) = *((_OWORD *)v8 - 1);
      v8 -= 16;
      v9 -= 16;
    }
    while (v8 != v6);
  }
  *(_QWORD *)(a2 + 8) = v7;
  v10 = a1[1];
  v11 = *(_QWORD *)(a2 + 16);
  v12 = v10 - __src;
  if (v10 != __src)
  {
    memmove(*(void **)(a2 + 16), __src, v10 - __src);
    v7 = *(void **)(a2 + 8);
  }
  *(_QWORD *)(a2 + 16) = v11 + v12;
  v13 = (char *)*a1;
  *a1 = v7;
  *(_QWORD *)(a2 + 8) = v13;
  v14 = a1[1];
  a1[1] = *(void **)(a2 + 16);
  *(_QWORD *)(a2 + 16) = v14;
  v15 = a1[2];
  a1[2] = *(void **)(a2 + 24);
  *(_QWORD *)(a2 + 24) = v15;
  *(_QWORD *)a2 = *(_QWORD *)(a2 + 8);
  return v5;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<LAUI_uniform_cubic_b_spline_renderer_private::control_point>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(16 * a2);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>(uint64_t a1, uint64_t a2)
{
  if (a2 < 0)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(2 * a2);
}

__n128 std::__split_buffer<LAUI_uniform_cubic_b_spline_renderer_private::instance_uniform>::push_back(void **a1, uint64_t a2)
{
  char *v4;
  char *v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  char *v12;
  unint64_t v13;
  unint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  _OWORD *v18;
  int64_t v19;
  uint64_t v20;
  char *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  void *v26;
  __int128 v27;
  __n128 result;
  __int128 v29;
  __int128 v30;

  v4 = (char *)a1[2];
  if (v4 == a1[3])
  {
    v5 = (char *)a1[1];
    if (v5 <= *a1)
    {
      if (v4 == *a1)
        v13 = 1;
      else
        v13 = 0x5555555555555556 * ((v4 - (_BYTE *)*a1) >> 5);
      v14 = v13 >> 2;
      v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<LAUI_uniform_cubic_b_spline_renderer_private::instance_uniform>>((uint64_t)a1[4], v13);
      v17 = &v15[96 * v14];
      v18 = a1[1];
      v4 = v17;
      v19 = (_BYTE *)a1[2] - (_BYTE *)v18;
      if (v19)
      {
        v4 = &v17[96 * (v19 / 96)];
        v20 = 96 * (v19 / 96);
        v21 = &v15[96 * v14];
        do
        {
          v22 = v18[1];
          *(_OWORD *)v21 = *v18;
          *((_OWORD *)v21 + 1) = v22;
          v23 = v18[2];
          v24 = v18[3];
          v25 = v18[5];
          *((_OWORD *)v21 + 4) = v18[4];
          *((_OWORD *)v21 + 5) = v25;
          *((_OWORD *)v21 + 2) = v23;
          *((_OWORD *)v21 + 3) = v24;
          v21 += 96;
          v18 += 6;
          v20 -= 96;
        }
        while (v20);
      }
      v26 = *a1;
      *a1 = v15;
      a1[1] = v17;
      a1[2] = v4;
      a1[3] = &v15[96 * v16];
      if (v26)
      {
        operator delete(v26);
        v4 = (char *)a1[2];
      }
    }
    else
    {
      v6 = 0xAAAAAAAAAAAAAAABLL * ((v5 - (_BYTE *)*a1) >> 5);
      if (v6 >= -1)
        v7 = v6 + 1;
      else
        v7 = v6 + 2;
      v8 = -(v7 >> 1);
      v9 = -96 * (v7 >> 1);
      v10 = &v5[v9];
      v11 = v4 - v5;
      if (v4 != v5)
      {
        memmove(&v5[v9], v5, v4 - v5);
        v4 = (char *)a1[1];
      }
      v12 = &v4[96 * v8];
      v4 = &v10[v11];
      a1[1] = v12;
      a1[2] = &v10[v11];
    }
  }
  v27 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)v4 = *(_OWORD *)a2;
  *((_OWORD *)v4 + 1) = v27;
  result = *(__n128 *)(a2 + 32);
  v29 = *(_OWORD *)(a2 + 48);
  v30 = *(_OWORD *)(a2 + 80);
  *((_OWORD *)v4 + 4) = *(_OWORD *)(a2 + 64);
  *((_OWORD *)v4 + 5) = v30;
  *((__n128 *)v4 + 2) = result;
  *((_OWORD *)v4 + 3) = v29;
  a1[2] = (char *)a1[2] + 96;
  return result;
}

void *std::vector<LAUI_uniform_cubic_b_spline_renderer_private::instance_uniform>::__swap_out_circular_buffer(void **a1, uint64_t a2, char *__src)
{
  void *v5;
  char *v6;
  void *v7;
  char *v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE *v14;
  uint64_t v15;
  int64_t v16;
  char *v17;
  void *v18;
  void *v19;

  v5 = *(void **)(a2 + 8);
  v6 = (char *)*a1;
  v7 = v5;
  if (*a1 != __src)
  {
    v8 = __src;
    v9 = *(_QWORD *)(a2 + 8);
    do
    {
      v10 = *((_OWORD *)v8 - 5);
      *(_OWORD *)(v9 - 96) = *((_OWORD *)v8 - 6);
      *(_OWORD *)(v9 - 80) = v10;
      v11 = *((_OWORD *)v8 - 4);
      v12 = *((_OWORD *)v8 - 3);
      v13 = *((_OWORD *)v8 - 1);
      v7 = (void *)(v9 - 96);
      *(_OWORD *)(v9 - 32) = *((_OWORD *)v8 - 2);
      *(_OWORD *)(v9 - 16) = v13;
      *(_OWORD *)(v9 - 64) = v11;
      *(_OWORD *)(v9 - 48) = v12;
      v8 -= 96;
      v9 -= 96;
    }
    while (v8 != v6);
  }
  *(_QWORD *)(a2 + 8) = v7;
  v14 = a1[1];
  v15 = *(_QWORD *)(a2 + 16);
  v16 = v14 - __src;
  if (v14 != __src)
  {
    memmove(*(void **)(a2 + 16), __src, v14 - __src);
    v7 = *(void **)(a2 + 8);
  }
  *(_QWORD *)(a2 + 16) = v15 + v16;
  v17 = (char *)*a1;
  *a1 = v7;
  *(_QWORD *)(a2 + 8) = v17;
  v18 = a1[1];
  a1[1] = *(void **)(a2 + 16);
  *(_QWORD *)(a2 + 16) = v18;
  v19 = a1[2];
  a1[2] = *(void **)(a2 + 24);
  *(_QWORD *)(a2 + 24) = v19;
  *(_QWORD *)a2 = *(_QWORD *)(a2 + 8);
  return v5;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<LAUI_uniform_cubic_b_spline_renderer_private::instance_uniform>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x2AAAAAAAAAAAAABLL)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(96 * a2);
}

uint64_t std::shared_ptr<std::atomic<unsigned char>>::~shared_ptr[abi:ne180100](uint64_t a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;

  v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  return a1;
}

void std::__shared_ptr_emplace<std::atomic<unsigned char>>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_24C27E620;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<std::atomic<unsigned char>>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_24C27E620;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x20BD1B2E8);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void sub_209E18DE0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_209E18EB0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_209E18FA0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_209E1934C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_209E19468(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_209E1956C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

double LAUI_CA_utilities::periodic_animation_state::elapsed_duration(LAUI_CA_utilities::periodic_animation_state *this)
{
  CALayer *WeakRetained;
  CALayer *v3;
  double v4;

  if (!*((_QWORD *)this + 1))
    return 0.0;
  WeakRetained = (CALayer *)objc_loadWeakRetained((id *)this + 2);
  v3 = WeakRetained;
  if (WeakRetained)
    v4 = LAUILayerAnimationElapsedDuration(WeakRetained, *((NSString **)this + 1));
  else
    v4 = 0.0;

  return v4;
}

double LAUI_CA_utilities::periodic_animation_state::remaining_duration(LAUI_CA_utilities::periodic_animation_state *this)
{
  CALayer *WeakRetained;
  CALayer *v3;
  double v4;

  if (!*((_QWORD *)this + 1))
    return 0.0;
  WeakRetained = (CALayer *)objc_loadWeakRetained((id *)this + 2);
  v3 = WeakRetained;
  if (WeakRetained)
    v4 = LAUILayerAnimationRemainingDuration(WeakRetained, *((NSString **)this + 1));
  else
    v4 = 0.0;

  return v4;
}

void LAUI_CA_utilities::periodic_animation_state::create_removal_timer(dispatch_source_t *a1, void *a2, double a3)
{
  id v5;
  dispatch_source_t v6;
  dispatch_source_t v7;
  NSObject *v8;
  dispatch_time_t v9;

  v5 = a2;
  LAUI_CA_utilities::periodic_animation_state::clear_removal_timer((LAUI_CA_utilities::periodic_animation_state *)a1);
  v6 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, MEMORY[0x24BDAC9B8]);
  v7 = a1[3];
  a1[3] = v6;

  v8 = a1[3];
  v9 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
  dispatch_source_set_event_handler(a1[3], v5);

  dispatch_resume(a1[3]);
}

void __copy_helper_block_ea8_32c55_ZTSKZ42__LAUIRadialPingView__setPulse_withDelay__E3__4(uint64_t a1, uint64_t a2)
{
  objc_copyWeak((id *)(a1 + 32), (id *)(a2 + 32));
}

void __destroy_helper_block_ea8_32c55_ZTSKZ42__LAUIRadialPingView__setPulse_withDelay__E3__4(uint64_t a1)
{
  objc_destroyWeak((id *)(a1 + 32));
}

void sub_209E19AC4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_209E1A074(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,id location)
{
  void *v49;
  void *v50;
  void *v51;

  _Unwind_Resume(a1);
}

id LAUI_CA_utilities::animation::update_animation<CABasicAnimation * {__strong}>(void *a1, _OWORD *a2, _OWORD *a3)
{
  id v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  BOOL v15;
  _OWORD *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  void *v34;
  _OWORD v36[8];
  CATransform3D v37;
  CATransform3D v38;
  CATransform3D v39;
  CATransform3D b;
  CATransform3D a;
  CATransform3D v42;

  v5 = a1;
  v6 = (void *)MEMORY[0x24BDD1968];
  v7 = a2[5];
  *(_OWORD *)&a.m31 = a2[4];
  *(_OWORD *)&a.m33 = v7;
  v8 = a2[7];
  *(_OWORD *)&a.m41 = a2[6];
  *(_OWORD *)&a.m43 = v8;
  v9 = a2[1];
  *(_OWORD *)&a.m11 = *a2;
  *(_OWORD *)&a.m13 = v9;
  v10 = a2[3];
  *(_OWORD *)&a.m21 = a2[2];
  *(_OWORD *)&a.m23 = v10;
  v11 = a3[7];
  *(_OWORD *)&b.m41 = a3[6];
  *(_OWORD *)&b.m43 = v11;
  v12 = a3[5];
  *(_OWORD *)&b.m31 = a3[4];
  *(_OWORD *)&b.m33 = v12;
  v13 = a3[3];
  *(_OWORD *)&b.m21 = a3[2];
  *(_OWORD *)&b.m23 = v13;
  v14 = a3[1];
  *(_OWORD *)&b.m11 = *a3;
  *(_OWORD *)&b.m13 = v14;
  v15 = CATransform3DEqualToTransform(&a, &b);
  v16 = (_OWORD *)MEMORY[0x24BDE5598];
  if (v15)
  {
    v17 = *(_OWORD *)(MEMORY[0x24BDE5598] + 80);
    *(_OWORD *)&v42.m31 = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
    *(_OWORD *)&v42.m33 = v17;
    v18 = *(_OWORD *)(MEMORY[0x24BDE5598] + 112);
    *(_OWORD *)&v42.m41 = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
    *(_OWORD *)&v42.m43 = v18;
    v19 = *(_OWORD *)(MEMORY[0x24BDE5598] + 16);
    *(_OWORD *)&v42.m11 = *MEMORY[0x24BDE5598];
    *(_OWORD *)&v42.m13 = v19;
    v20 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
    *(_OWORD *)&v42.m21 = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
    *(_OWORD *)&v42.m23 = v20;
  }
  else
  {
    v21 = a3[5];
    *(_OWORD *)&v38.m31 = a3[4];
    *(_OWORD *)&v38.m33 = v21;
    v22 = a3[7];
    *(_OWORD *)&v38.m41 = a3[6];
    *(_OWORD *)&v38.m43 = v22;
    v23 = a3[1];
    *(_OWORD *)&v38.m11 = *a3;
    *(_OWORD *)&v38.m13 = v23;
    v24 = a3[3];
    *(_OWORD *)&v38.m21 = a3[2];
    *(_OWORD *)&v38.m23 = v24;
    CATransform3DInvert(&v39, &v38);
    v25 = a2[5];
    *(_OWORD *)&v37.m31 = a2[4];
    *(_OWORD *)&v37.m33 = v25;
    v26 = a2[7];
    *(_OWORD *)&v37.m41 = a2[6];
    *(_OWORD *)&v37.m43 = v26;
    v27 = a2[1];
    *(_OWORD *)&v37.m11 = *a2;
    *(_OWORD *)&v37.m13 = v27;
    v28 = a2[3];
    *(_OWORD *)&v37.m21 = a2[2];
    *(_OWORD *)&v37.m23 = v28;
    CATransform3DConcat(&v42, &v39, &v37);
  }
  objc_msgSend(v6, "valueWithCATransform3D:", &v42);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFromValue:", v29);

  v30 = v16[5];
  v36[4] = v16[4];
  v36[5] = v30;
  v31 = v16[7];
  v36[6] = v16[6];
  v36[7] = v31;
  v32 = v16[1];
  v36[0] = *v16;
  v36[1] = v32;
  v33 = v16[3];
  v36[2] = v16[2];
  v36[3] = v33;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCATransform3D:", v36);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setToValue:", v34);

  return v5;
}

void sub_209E1A320(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

id __copy_helper_block_ea8_32c73_ZTSKZ60__LAUIRadialPingView__updateExpandForBlurAtIndex_withDelay__E3__5(uint64_t a1, uint64_t a2)
{
  id result;

  objc_copyWeak((id *)(a1 + 32), (id *)(a2 + 32));
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  result = *(id *)(a2 + 48);
  *(_QWORD *)(a1 + 48) = result;
  return result;
}

void __destroy_helper_block_ea8_32c73_ZTSKZ60__LAUIRadialPingView__updateExpandForBlurAtIndex_withDelay__E3__5(uint64_t a1)
{
  id *v1;

  v1 = (id *)(a1 + 32);

  objc_destroyWeak(v1);
}

void sub_209E1A7F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_209E1ACEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, id a20)
{
  void *v20;
  void *v21;
  id *v22;
  void *v23;
  id *v24;

  v24 = v22;

  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a20);

  _Unwind_Resume(a1);
}

void sub_209E1ADC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

id __copy_helper_block_ea8_32c60_ZTSKZ47__LAUIRadialPingView__updateAnimatingAnimated__E3__6(uint64_t a1, uint64_t a2)
{
  id result;

  objc_copyWeak((id *)(a1 + 32), (id *)(a2 + 32));
  *(_WORD *)(a1 + 40) = *(_WORD *)(a2 + 40);
  result = *(id *)(a2 + 48);
  *(_QWORD *)(a1 + 48) = result;
  return result;
}

void __destroy_helper_block_ea8_32c60_ZTSKZ47__LAUIRadialPingView__updateAnimatingAnimated__E3__6(uint64_t a1)
{
  id *v1;

  v1 = (id *)(a1 + 32);

  objc_destroyWeak(v1);
}

void sub_209E1B0C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_209E1B140(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_209E1B280(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_209E1B2E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_209E1B384(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_209E1B740(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id `anonymous namespace'::shape_layer_clone(_anonymous_namespace_ *this, CAShapeLayer *a2)
{
  _anonymous_namespace_ *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;

  v2 = this;
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDE5758]);
    -[_anonymous_namespace_ bounds](v2, "bounds");
    objc_msgSend(v3, "setBounds:");
    -[_anonymous_namespace_ position](v2, "position");
    objc_msgSend(v3, "setPosition:");
    -[_anonymous_namespace_ zPosition](v2, "zPosition");
    objc_msgSend(v3, "setZPosition:");
    -[_anonymous_namespace_ anchorPoint](v2, "anchorPoint");
    objc_msgSend(v3, "setAnchorPoint:");
    -[_anonymous_namespace_ anchorPointZ](v2, "anchorPointZ");
    objc_msgSend(v3, "setAnchorPointZ:");
    -[_anonymous_namespace_ transform](v2, "transform");
    objc_msgSend(v3, "setTransform:", &v10);
    objc_msgSend(v3, "setHidden:", -[_anonymous_namespace_ isHidden](v2, "isHidden"));
    objc_msgSend(v3, "setGeometryFlipped:", -[_anonymous_namespace_ isGeometryFlipped](v2, "isGeometryFlipped"));
    -[_anonymous_namespace_ opacity](v2, "opacity");
    objc_msgSend(v3, "setOpacity:");
    -[_anonymous_namespace_ actions](v2, "actions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setActions:", v4);

    objc_msgSend(v3, "setPath:", -[_anonymous_namespace_ path](v2, "path"));
    objc_msgSend(v3, "setFillColor:", -[_anonymous_namespace_ fillColor](v2, "fillColor"));
    -[_anonymous_namespace_ fillRule](v2, "fillRule");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setFillRule:", v5);

    objc_msgSend(v3, "setStrokeColor:", -[_anonymous_namespace_ strokeColor](v2, "strokeColor"));
    -[_anonymous_namespace_ strokeStart](v2, "strokeStart");
    objc_msgSend(v3, "setStrokeStart:");
    -[_anonymous_namespace_ strokeEnd](v2, "strokeEnd");
    objc_msgSend(v3, "setStrokeEnd:");
    -[_anonymous_namespace_ lineWidth](v2, "lineWidth");
    objc_msgSend(v3, "setLineWidth:");
    -[_anonymous_namespace_ miterLimit](v2, "miterLimit");
    objc_msgSend(v3, "setMiterLimit:");
    -[_anonymous_namespace_ lineCap](v2, "lineCap");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setLineCap:", v6);

    -[_anonymous_namespace_ lineJoin](v2, "lineJoin");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setLineJoin:", v7);

    -[_anonymous_namespace_ lineDashPhase](v2, "lineDashPhase");
    objc_msgSend(v3, "setLineDashPhase:");
    -[_anonymous_namespace_ lineDashPattern](v2, "lineDashPattern");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setLineDashPattern:", v8);

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void sub_209E1B9D8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_209E1BA78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)LAUICheckmarkLayer;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void LAUI_CA_utilities::animation_completion_handler_container::execute(LAUI_CA_utilities::animation_completion_handler_container **a1, char a2)
{
  LAUI_CA_utilities::animation_completion_handler_container *v4;
  LAUI_CA_utilities::animation_completion_handler_container *v5;
  char *v6[3];
  char **v7;

  memset(v6, 0, sizeof(v6));
  std::vector<void({block_pointer} {__strong})(BOOL),std::allocator<void({block_pointer} {__strong})(BOOL)>>::reserve(v6, (a1[1] - *a1) >> 3);
  v4 = *a1;
  v5 = a1[1];
  while (v4 != v5)
  {
    LAUI_CA_utilities::animation_completion_handler_container::acquire_completion(v4);
    v7 = (char **)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      std::vector<void({block_pointer} {__strong})(BOOL),std::allocator<void({block_pointer} {__strong})(BOOL)>>::emplace_back<void({block_pointer} {__strong}&)(BOOL)>(v6, &v7);

    }
    v4 = (LAUI_CA_utilities::animation_completion_handler_container *)((char *)v4 + 8);
  }
  LAUI_CA_utilities::animation_completion_handler_container::execute<std::vector<void({block_pointer} {__strong})(BOOL),std::allocator<void({block_pointer} {__strong})(BOOL)>>>((uint64_t)v6, a2);
  v7 = v6;
  std::vector<UIView * {__strong}>::__destroy_vector::operator()[abi:ne180100]((void ***)&v7);
}

void sub_209E1BEC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_209E1C05C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_209E1C1AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{

  _Unwind_Resume(a1);
}

uint64_t std::vector<LAUI_CA_utilities::animation_completion_handler_container>::emplace_back<void({block_pointer} {__strong}&)(BOOL)>(uint64_t *a1, void **a2)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  char *v15;
  char *v16;
  _QWORD *v17;
  char *v18;
  uint64_t v19;

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(_QWORD *)(v4 - 8);
  if (v7 >= v6)
  {
    v9 = (uint64_t)(v7 - *a1) >> 3;
    if ((unint64_t)(v9 + 1) >> 61)
      std::vector<UIView * {__strong}>::__throw_length_error[abi:ne180100]();
    v10 = v5 - *a1;
    v11 = v10 >> 2;
    if (v10 >> 2 <= (unint64_t)(v9 + 1))
      v11 = v9 + 1;
    if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF8)
      v12 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v12 = v11;
    v19 = v4;
    if (v12)
      v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<UIView * {__strong}>>(v4, v12);
    else
      v13 = 0;
    v15 = v13;
    v16 = &v13[8 * v9];
    v18 = &v13[8 * v12];
    LAUI_CA_utilities::animation_completion_handler_container::animation_completion_handler_container(v16, *a2);
    v17 = v16 + 8;
    std::vector<LAUI_CA_utilities::animation_completion_handler_container>::__swap_out_circular_buffer(a1, &v15);
    v8 = a1[1];
    std::__split_buffer<LAUI_CA_utilities::animation_completion_handler_container>::~__split_buffer((uint64_t)&v15);
  }
  else
  {
    LAUI_CA_utilities::animation_completion_handler_container::animation_completion_handler_container(*(_QWORD **)(v4 - 8), *a2);
    v8 = v7 + 8;
    a1[1] = v7 + 8;
  }
  a1[1] = v8;
  return v8 - 8;
}

void sub_209E1C2B0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<LAUI_CA_utilities::animation_completion_handler_container>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t __copy_helper_block_ea8_32c71_ZTSKZ58__LAUICheckmarkLayer_setRevealed_animated_withCompletion__E3__0(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = MEMORY[0x20BD1B708](*(_QWORD *)(a2 + 32));
  *(_QWORD *)(a1 + 32) = result;
  return result;
}

void __destroy_helper_block_ea8_32c71_ZTSKZ58__LAUICheckmarkLayer_setRevealed_animated_withCompletion__E3__0(uint64_t a1)
{

}

void sub_209E1C740(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22)
{
  void *v22;
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_209E1C808(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void __copy_helper_block_ea8_32c59_ZTSKZ46__LAUICheckmarkLayer__updateRevealedAnimated__E3__1(uint64_t a1, uint64_t a2)
{
  objc_copyWeak((id *)(a1 + 32), (id *)(a2 + 32));
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
}

void __destroy_helper_block_ea8_32c59_ZTSKZ46__LAUICheckmarkLayer__updateRevealedAnimated__E3__1(uint64_t a1)
{
  objc_destroyWeak((id *)(a1 + 32));
}

uint64_t std::vector<LAUI_CA_utilities::animation_completion_handler_container>::shrink_to_fit(uint64_t *a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  uint64_t v13;

  v3 = a1[2];
  result = (uint64_t)(a1 + 2);
  v4 = *a1;
  v5 = a1[1];
  v6 = (v5 - *a1) >> 3;
  if (v6 < (v3 - *a1) >> 3)
  {
    v13 = result;
    if (v5 == v4)
    {
      v7 = 0;
      v8 = 0;
    }
    else
    {
      v7 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<UIView * {__strong}>>(result, v6);
    }
    v9 = v7;
    v10 = &v7[8 * v6];
    v11 = v10;
    v12 = &v7[8 * v8];
    std::vector<LAUI_CA_utilities::animation_completion_handler_container>::__swap_out_circular_buffer(a1, &v9);
    return std::__split_buffer<LAUI_CA_utilities::animation_completion_handler_container>::~__split_buffer((uint64_t)&v9);
  }
  return result;
}

void sub_209E1C91C(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  __cxa_begin_catch(a1);
  __cxa_end_catch();
  JUMPOUT(0x209E1C90CLL);
}

uint64_t std::vector<CAShapeLayer * {__strong}>::shrink_to_fit(char **a1)
{
  uint64_t result;
  char *v3;
  char *v4;
  char *v5;
  unint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  _QWORD v16[2];
  uint64_t v17;
  char *v18;
  uint64_t v19;

  v3 = a1[2];
  result = (uint64_t)(a1 + 2);
  v4 = *a1;
  v5 = a1[1];
  v6 = (v5 - *a1) >> 3;
  if (v6 < (v3 - *a1) >> 3)
  {
    v19 = result;
    if (v5 == v4)
    {
      v11 = 0;
      v9 = 8 * v6;
    }
    else
    {
      v7 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<UIView * {__strong}>>(result, v6);
      v4 = *a1;
      v8 = a1[1];
      v9 = (uint64_t)&v7[8 * v6];
      v11 = &v7[8 * v10];
      v17 = v9;
      v18 = v11;
      if (v8 != v4)
      {
        v12 = &v7[8 * v6];
        do
        {
          v13 = *((_QWORD *)v8 - 1);
          v8 -= 8;
          *(_QWORD *)v8 = 0;
          *((_QWORD *)v12 - 1) = v13;
          v12 -= 8;
        }
        while (v8 != v4);
        v14 = *a1;
        v4 = a1[1];
        v9 = v17;
        v11 = v18;
        goto LABEL_9;
      }
    }
    v14 = v4;
    v12 = (char *)v9;
LABEL_9:
    *a1 = v12;
    a1[1] = (char *)v9;
    v15 = a1[2];
    a1[2] = v11;
    v17 = (uint64_t)v4;
    v18 = v15;
    v16[0] = v14;
    v16[1] = v14;
    return std::__split_buffer<UIView * {__strong}>::~__split_buffer((uint64_t)v16);
  }
  return result;
}

void sub_209E1CAB4(void *a1)
{
  __cxa_begin_catch(a1);
  __cxa_end_catch();
  JUMPOUT(0x209E1CAA4);
}

uint64_t std::vector<void({block_pointer} {__strong})(BOOL),std::allocator<void({block_pointer} {__strong})(BOOL)>>::reserve(char **a1, unint64_t a2)
{
  uint64_t result;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  char *v10;
  uint64_t v11;
  int64x2_t v12;
  char *v13;
  uint64_t v14;
  int64x2_t v15;
  char *v16;
  uint64_t v17;

  v4 = a1[2];
  result = (uint64_t)(a1 + 2);
  if (a2 > (v4 - *a1) >> 3)
  {
    if (a2 >> 61)
      std::vector<UIView * {__strong}>::__throw_length_error[abi:ne180100]();
    v5 = a1[1] - *a1;
    v17 = result;
    v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<UIView * {__strong}>>(result, a2);
    v9 = *a1;
    v8 = a1[1];
    if (v8 == *a1)
    {
      v12 = vdupq_n_s64((unint64_t)v8);
      v10 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    }
    else
    {
      v10 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
      do
      {
        v11 = *((_QWORD *)v8 - 1);
        v8 -= 8;
        *(_QWORD *)v8 = 0;
        *((_QWORD *)v10 - 1) = v11;
        v10 -= 8;
      }
      while (v8 != v9);
      v12 = *(int64x2_t *)a1;
    }
    *a1 = v10;
    a1[1] = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    v15 = v12;
    v13 = a1[2];
    a1[2] = &v6[8 * v7];
    v16 = v13;
    v14 = v12.i64[0];
    return std::__split_buffer<UIView * {__strong}>::~__split_buffer((uint64_t)&v14);
  }
  return result;
}

id LAUI_CA_utilities::animation_completion_handler_container::acquire_completion(LAUI_CA_utilities::animation_completion_handler_container *this)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x20BD1B708](*(_QWORD *)this);
  v3 = *(void **)this;
  *(_QWORD *)this = 0;

  v4 = (void *)MEMORY[0x20BD1B708](v2);
  return v4;
}

char *std::vector<void({block_pointer} {__strong})(BOOL),std::allocator<void({block_pointer} {__strong})(BOOL)>>::emplace_back<void({block_pointer} {__strong}&)(BOOL)>(char **a1, _QWORD *a2)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  uint64_t v18;
  int64x2_t v19;
  char *v20;
  uint64_t v22;
  int64x2_t v23;
  char *v24;
  uint64_t v25;

  v6 = (unint64_t)a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(char **)(v4 - 8);
  if ((unint64_t)v7 >= v6)
  {
    v9 = (v7 - *a1) >> 3;
    if ((unint64_t)(v9 + 1) >> 61)
      std::vector<UIView * {__strong}>::__throw_length_error[abi:ne180100]();
    v10 = v5 - (_QWORD)*a1;
    v11 = v10 >> 2;
    if (v10 >> 2 <= (unint64_t)(v9 + 1))
      v11 = v9 + 1;
    if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF8)
      v12 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v12 = v11;
    v25 = v4;
    if (v12)
      v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<UIView * {__strong}>>(v4, v12);
    else
      v13 = 0;
    v14 = &v13[8 * v9];
    v15 = &v13[8 * v12];
    v24 = v15;
    *(_QWORD *)v14 = MEMORY[0x20BD1B708](*a2);
    v8 = v14 + 8;
    v23.i64[1] = (uint64_t)(v14 + 8);
    v17 = *a1;
    v16 = a1[1];
    if (v16 == *a1)
    {
      v19 = vdupq_n_s64((unint64_t)v16);
    }
    else
    {
      do
      {
        v18 = *((_QWORD *)v16 - 1);
        v16 -= 8;
        *(_QWORD *)v16 = 0;
        *((_QWORD *)v14 - 1) = v18;
        v14 -= 8;
      }
      while (v16 != v17);
      v19 = *(int64x2_t *)a1;
      v8 = (char *)v23.i64[1];
      v15 = v24;
    }
    *a1 = v14;
    a1[1] = v8;
    v23 = v19;
    v20 = a1[2];
    a1[2] = v15;
    v24 = v20;
    v22 = v19.i64[0];
    std::__split_buffer<UIView * {__strong}>::~__split_buffer((uint64_t)&v22);
  }
  else
  {
    *(_QWORD *)v7 = MEMORY[0x20BD1B708](*a2);
    v8 = v7 + 8;
  }
  a1[1] = v8;
  return v8 - 8;
}

void LAUI_CA_utilities::animation_completion_handler_container::execute<std::vector<void({block_pointer} {__strong})(BOOL),std::allocator<void({block_pointer} {__strong})(BOOL)>>>(uint64_t a1, char a2)
{
  id v4;
  uint64_t *v5;
  uint64_t *v6;
  void *v7;
  void **v8;
  __int128 v9;
  char v10;
  _QWORD block[4];
  _QWORD v12[3];
  char v13;
  void ***v14;

  if (*(_QWORD *)(a1 + 8) != *(_QWORD *)a1)
  {
    v4 = MEMORY[0x24BDAC9B8];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3321888768;
    block[2] = ___ZN17LAUI_CA_utilities38animation_completion_handler_container7executeINSt3__16vectorIU8__strongU13block_pointerFvbENS2_9allocatorIS6_EEEEEEvOT_b_block_invoke;
    block[3] = &__block_descriptor_64_ea8_32c155_ZTSKZN17LAUI_CA_utilities38animation_completion_handler_container7executeINSt3__16vectorIU8__strongU13block_pointerFvbENS2_9allocatorIS6_EEEEEEvOT_bEUlvE__e5_v8__0l;
    v8 = *(void ***)a1;
    v5 = (uint64_t *)v8;
    v9 = *(_OWORD *)(a1 + 8);
    v6 = (uint64_t *)v9;
    *(_QWORD *)(a1 + 8) = 0;
    *(_QWORD *)(a1 + 16) = 0;
    *(_QWORD *)a1 = 0;
    v10 = a2;
    memset(v12, 0, sizeof(v12));
    std::vector<void({block_pointer} {__strong})(BOOL),std::allocator<void({block_pointer} {__strong})(BOOL)>>::__init_with_size[abi:ne180100]<void({block_pointer} {__strong}*)(BOOL),void({block_pointer} {__strong}*)(BOOL)>((char *)v12, v5, v6, v6 - v5);
    v13 = a2;
    v7 = (void *)MEMORY[0x24BDAC9B8];
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    v14 = &v8;
    std::vector<UIView * {__strong}>::__destroy_vector::operator()[abi:ne180100]((void ***)&v14);

    v8 = (void **)v12;
    std::vector<UIView * {__strong}>::__destroy_vector::operator()[abi:ne180100](&v8);
  }
}

uint64_t ___ZN17LAUI_CA_utilities38animation_completion_handler_container7executeINSt3__16vectorIU8__strongU13block_pointerFvbENS2_9allocatorIS6_EEEEEEvOT_b_block_invoke(uint64_t result)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;

  v1 = *(uint64_t **)(result + 32);
  v2 = *(uint64_t **)(result + 40);
  if (v1 != v2)
  {
    v3 = result;
    do
    {
      result = *v1;
      if (*v1)
        result = (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(v3 + 56));
      ++v1;
    }
    while (v1 != v2);
  }
  return result;
}

char *__copy_helper_block_ea8_32c155_ZTSKZN17LAUI_CA_utilities38animation_completion_handler_container7executeINSt3__16vectorIU8__strongU13block_pointerFvbENS2_9allocatorIS6_EEEEEEvOT_bEUlvE_(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char *result;

  *(_QWORD *)(a1 + 32) = 0;
  *(_QWORD *)(a1 + 40) = 0;
  v3 = a1 + 32;
  *(_QWORD *)(a1 + 48) = 0;
  result = std::vector<void({block_pointer} {__strong})(BOOL),std::allocator<void({block_pointer} {__strong})(BOOL)>>::__init_with_size[abi:ne180100]<void({block_pointer} {__strong}*)(BOOL),void({block_pointer} {__strong}*)(BOOL)>((char *)(a1 + 32), *(uint64_t **)(a2 + 32), *(uint64_t **)(a2 + 40), (uint64_t)(*(_QWORD *)(a2 + 40) - *(_QWORD *)(a2 + 32)) >> 3);
  *(_BYTE *)(v3 + 24) = *(_BYTE *)(a2 + 56);
  return result;
}

void __destroy_helper_block_ea8_32c155_ZTSKZN17LAUI_CA_utilities38animation_completion_handler_container7executeINSt3__16vectorIU8__strongU13block_pointerFvbENS2_9allocatorIS6_EEEEEEvOT_bEUlvE_(uint64_t a1)
{
  void **v1;

  v1 = (void **)(a1 + 32);
  std::vector<UIView * {__strong}>::__destroy_vector::operator()[abi:ne180100](&v1);
}

char *std::vector<void({block_pointer} {__strong})(BOOL),std::allocator<void({block_pointer} {__strong})(BOOL)>>::__init_with_size[abi:ne180100]<void({block_pointer} {__strong}*)(BOOL),void({block_pointer} {__strong}*)(BOOL)>(char *result, uint64_t *a2, uint64_t *a3, unint64_t a4)
{
  char *v6;
  char **v7;
  uint64_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<void({block_pointer} {__strong})(BOOL),std::allocator<void({block_pointer} {__strong})(BOOL)>>::__vallocate[abi:ne180100](result, a4);
    v7 = (char **)*((_QWORD *)v6 + 1);
    while (a2 != a3)
    {
      v8 = *a2++;
      result = (char *)MEMORY[0x20BD1B708](v8);
      *v7++ = result;
    }
    *((_QWORD *)v6 + 1) = v7;
  }
  return result;
}

void sub_209E1CFE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  std::vector<UIView * {__strong}>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

char *std::vector<void({block_pointer} {__strong})(BOOL),std::allocator<void({block_pointer} {__strong})(BOOL)>>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 61)
    std::vector<UIView * {__strong}>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<UIView * {__strong}>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

_QWORD *LAUI_CA_utilities::animation_completion_handler_container::animation_completion_handler_container(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  v4 = (void *)objc_msgSend(v3, "copy");
  *a1 = MEMORY[0x20BD1B708]();

  return a1;
}

uint64_t std::vector<LAUI_CA_utilities::animation_completion_handler_container>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<LAUI_CA_utilities::animation_completion_handler_container>,std::reverse_iterator<LAUI_CA_utilities::animation_completion_handler_container*>,std::reverse_iterator<LAUI_CA_utilities::animation_completion_handler_container*>,std::reverse_iterator<LAUI_CA_utilities::animation_completion_handler_container*>>((uint64_t)(a1 + 2), a1[1], (void **)a1[1], *a1, (void **)*a1, a2[1], a2[1]);
  a2[1] = v5;
  v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<LAUI_CA_utilities::animation_completion_handler_container>,std::reverse_iterator<LAUI_CA_utilities::animation_completion_handler_container*>,std::reverse_iterator<LAUI_CA_utilities::animation_completion_handler_container*>,std::reverse_iterator<LAUI_CA_utilities::animation_completion_handler_container*>>(uint64_t a1, uint64_t a2, void **a3, uint64_t a4, void **a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  void **v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _QWORD v14[3];
  char v15;
  __int128 v16;
  __int128 v17;

  v7 = a7;
  *(_QWORD *)&v17 = a6;
  *((_QWORD *)&v17 + 1) = a7;
  v16 = v17;
  v14[0] = a1;
  v14[1] = &v16;
  v14[2] = &v17;
  if (a3 == a5)
  {
    v12 = a6;
  }
  else
  {
    v9 = a3;
    do
    {
      v10 = (uint64_t)*--v9;
      *(_QWORD *)(v7 - 8) = MEMORY[0x20BD1B708](v10);
      v11 = *v9;
      *v9 = 0;

      v7 = *((_QWORD *)&v17 + 1) - 8;
      *((_QWORD *)&v17 + 1) -= 8;
    }
    while (v9 != a5);
    v12 = v17;
  }
  v15 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<LAUI_CA_utilities::animation_completion_handler_container>,std::reverse_iterator<LAUI_CA_utilities::animation_completion_handler_container*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v14);
  return v12;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<LAUI_CA_utilities::animation_completion_handler_container>,std::reverse_iterator<LAUI_CA_utilities::animation_completion_handler_container*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<LAUI_CA_utilities::animation_completion_handler_container>,std::reverse_iterator<LAUI_CA_utilities::animation_completion_handler_container*>>::operator()[abi:ne180100]((uint64_t *)a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<LAUI_CA_utilities::animation_completion_handler_container>,std::reverse_iterator<LAUI_CA_utilities::animation_completion_handler_container*>>::operator()[abi:ne180100](uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE v8[8];
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE v13[8];
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v1 = (uint64_t *)a1[2];
  v3 = *v1;
  v2 = v1[1];
  v14 = v3;
  v15 = v2;
  v16 = v3;
  v17 = v2;
  v4 = *a1;
  v5 = (uint64_t *)a1[1];
  v7 = *v5;
  v6 = v5[1];
  v9 = v7;
  v10 = v6;
  v11 = v7;
  v12 = v6;
  std::__allocator_destroy[abi:ne180100]<std::allocator<LAUI_CA_utilities::animation_completion_handler_container>,std::reverse_iterator<std::reverse_iterator<LAUI_CA_utilities::animation_completion_handler_container*>>,std::reverse_iterator<std::reverse_iterator<LAUI_CA_utilities::animation_completion_handler_container*>>>(v4, (uint64_t)v13, (uint64_t)v8);
}

void std::__allocator_destroy[abi:ne180100]<std::allocator<LAUI_CA_utilities::animation_completion_handler_container>,std::reverse_iterator<std::reverse_iterator<LAUI_CA_utilities::animation_completion_handler_container*>>,std::reverse_iterator<std::reverse_iterator<LAUI_CA_utilities::animation_completion_handler_container*>>>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void **i;

  for (i = *(void ***)(a2 + 32); i != *(void ***)(a3 + 32); *(_QWORD *)(a2 + 32) = i)
  {
    LAUI_CA_utilities::animation_completion_handler_container::operator()(i, 0);

    i = (void **)(*(_QWORD *)(a2 + 32) + 8);
  }
}

void LAUI_CA_utilities::animation_completion_handler_container::operator()(void **a1, char a2)
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  char v9;

  if (*a1)
  {
    v4 = (void *)MEMORY[0x20BD1B708]();
    v5 = *a1;
    *a1 = 0;

    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3321888768;
    v7[2] = ___ZN17LAUI_CA_utilities38animation_completion_handler_containerclEb_block_invoke;
    v7[3] = &__block_descriptor_48_ea8_32c76_ZTSKZN17LAUI_CA_utilities38animation_completion_handler_containerclEbEUlvE__e5_v8__0l;
    v6 = (void *)MEMORY[0x20BD1B708](v4);
    v8 = (id)MEMORY[0x20BD1B708]();
    v9 = a2;
    dispatch_async(MEMORY[0x24BDAC9B8], v7);

  }
}

uint64_t ___ZN17LAUI_CA_utilities38animation_completion_handler_containerclEb_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

uint64_t __copy_helper_block_ea8_32c76_ZTSKZN17LAUI_CA_utilities38animation_completion_handler_containerclEbEUlvE_(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = MEMORY[0x20BD1B708](*(_QWORD *)(a2 + 32));
  *(_QWORD *)(a1 + 32) = result;
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  return result;
}

void __destroy_helper_block_ea8_32c76_ZTSKZN17LAUI_CA_utilities38animation_completion_handler_containerclEbEUlvE_(uint64_t a1)
{

}

uint64_t std::__split_buffer<LAUI_CA_utilities::animation_completion_handler_container>::~__split_buffer(uint64_t a1)
{
  std::__split_buffer<LAUI_CA_utilities::animation_completion_handler_container>::__destruct_at_end[abi:ne180100](a1, *(_QWORD *)(a1 + 8));
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void std::__split_buffer<LAUI_CA_utilities::animation_completion_handler_container>::__destruct_at_end[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t i;

  for (i = *(_QWORD *)(a1 + 16); i != a2; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 8;
    LAUI_CA_utilities::animation_completion_handler_container::operator()((void **)(i - 8), 0);

  }
}

void std::vector<LAUI_CA_utilities::animation_completion_handler_container>::__base_destruct_at_end[abi:ne180100](uint64_t a1, void **a2)
{
  void **v4;
  void **v5;
  void **v6;
  void *v7;
  BOOL v8;

  v4 = *(void ***)(a1 + 8);
  if (v4 != a2)
  {
    v5 = v4 - 1;
    v6 = v4 - 1;
    do
    {
      LAUI_CA_utilities::animation_completion_handler_container::operator()(v5, 0);
      v7 = *v6--;

      v8 = v5 == a2;
      v5 = v6;
    }
    while (!v8);
  }
  *(_QWORD *)(a1 + 8) = a2;
}

void std::vector<LAUI_CA_utilities::animation_completion_handler_container>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v2;

  v2 = *a1;
  if (*v2)
  {
    std::vector<LAUI_CA_utilities::animation_completion_handler_container>::__base_destruct_at_end[abi:ne180100]((uint64_t)v2, (void **)*v2);
    operator delete(**a1);
  }
}

void sub_209E1D618(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void *`anonymous namespace'::create_static_resources(_anonymous_namespace_ *this)
{
  unsigned __int8 v1;
  void *WeakRetained;
  id v4;
  uint64_t i;
  shared_state_t v6;
  char v7;

  if ((v1 & 1) == 0
  {
  }
  if (!WeakRetained)
  {
    v4 = MTLCreateSystemDefaultDevice();
    LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(v4, (LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t *)&v6);

    if (v7)
    {
      WeakRetained = -[LAUIPearlGlyphViewStaticResources initWithState:]([LAUIPearlGlyphViewStaticResources alloc], &v6);
      if (v7)
      {

        for (i = 72; i != 48; i -= 8)
        do
        {

          i -= 8;
        }
        while (i != 24);

      }
    }
    else
    {
      WeakRetained = 0;
    }
  }
  return WeakRetained;
}

void sub_209E1D7D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_209E1D884(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_209E1D908(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_209E1D9A0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_209E1ED74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,void *a23,void *a24)
{
  void *v24;
  void *v25;
  void *v26;

  _Unwind_Resume(a1);
}

void sub_209E1EED0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_209E1F9C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,void *a34,void *a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,void *a49,uint64_t a50,char a51)
{
  void *v51;
  void *v52;

  _Block_object_dispose(&a51, 8);
  _Unwind_Resume(a1);
}

void sub_209E1FAE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;

  a9.super_class = (Class)LAUIPearlGlyphView;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_209E20058(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_209E20204(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_209E202EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

double LAUI_uniform_cubic_b_spline_renderer::renderer_t::update_last_render_time(LAUI_uniform_cubic_b_spline_renderer::renderer_t *this)
{
  double Current;
  double v3;
  double v4;

  Current = CFAbsoluteTimeGetCurrent();
  v3 = Current - *(double *)this;
  v4 = 0.0;
  if (v3 > 0.0)
  {
    *(double *)this = Current;
    return v3;
  }
  return v4;
}

void sub_209E20718(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

LAUI_uniform_cubic_b_spline_renderer::renderer_t *std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::renderer_t>::reset[abi:ne180100](LAUI_uniform_cubic_b_spline_renderer::renderer_t **a1, LAUI_uniform_cubic_b_spline_renderer::renderer_t *a2)
{
  LAUI_uniform_cubic_b_spline_renderer::renderer_t *result;

  result = *a1;
  *a1 = a2;
  if (result)
  {
    LAUI_uniform_cubic_b_spline_renderer::renderer_t::~renderer_t(result);
    JUMPOUT(0x20BD1B2E8);
  }
  return result;
}

uint64_t *std::unique_ptr<`anonymous namespace'::face_id_animator_t>::reset[abi:ne180100](uint64_t *result, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v2 = *result;
  *result = a2;
  if (v2)
  {
    v3 = *(_QWORD **)(v2 + 1160);
    if (v3)
    {
      do
      {
        v4 = (_QWORD *)*v3;
        operator delete(v3);
        v3 = v4;
      }
      while (v4);
    }
    v5 = *(void **)(v2 + 1144);
    *(_QWORD *)(v2 + 1144) = 0;
    if (v5)
      operator delete(v5);
    v6 = *(void **)(v2 + 1120);
    if (v6)
    {
      *(_QWORD *)(v2 + 1128) = v6;
      operator delete(v6);
    }
    if (*(_BYTE *)(v2 + 1104))
    {
      _ZNSt3__116__variant_detail6__dtorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv4_fEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEELNS0_6_TraitE1EED2Ev(v2 + 1088);
      std::__variant_detail::__dtor<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<simd::quatf>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>,(std::__variant_detail::_Trait)1>::~__dtor(v2 + 992);
    }
    v7 = *(_QWORD *)(v2 + 872);
    if (v7)
    {
      v8 = *(_QWORD *)(v2 + 880);
      v9 = *(void **)(v2 + 872);
      if (v8 != v7)
      {
        do
        {
          _ZNSt3__116__variant_detail6__dtorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv4_fEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEELNS0_6_TraitE1EED2Ev(v8 - 16);
          std::__variant_detail::__dtor<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<simd::quatf>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>,(std::__variant_detail::_Trait)1>::~__dtor(v8 - 112);
          std::__variant_detail::__dtor<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>,(std::__variant_detail::_Trait)1>::~__dtor(v8 - 216);
          v8 -= 288;
        }
        while (v8 != v7);
        v9 = *(void **)(v2 + 872);
      }
      *(_QWORD *)(v2 + 880) = v7;
      operator delete(v9);
    }
    v10 = *(_QWORD *)(v2 + 848);
    if (v10)
    {
      v11 = *(_QWORD *)(v2 + 856);
      v12 = *(void **)(v2 + 848);
      if (v11 != v10)
      {
        do
        {
          v11 -= 240;
        }
        while (v11 != v10);
        v12 = *(void **)(v2 + 848);
      }
      *(_QWORD *)(v2 + 856) = v10;
      operator delete(v12);
    }
    if (*(_BYTE *)(v2 + 832))
    {
      std::__variant_detail::__dtor<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<decltype(nullptr)>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>,(std::__variant_detail::_Trait)1>::~__dtor(v2 + 808);
      std::__variant_detail::__dtor<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>,(std::__variant_detail::_Trait)1>::~__dtor(v2 + 736);
      std::__variant_detail::__dtor<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>,(std::__variant_detail::_Trait)1>::~__dtor(v2 + 680);
      _ZNSt3__116__variant_detail6__dtorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_dEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEELNS0_6_TraitE1EED2Ev(v2 + 624);
      std::__variant_detail::__dtor<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>,(std::__variant_detail::_Trait)1>::~__dtor(v2 + 480);
      std::__variant_detail::__dtor<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>,(std::__variant_detail::_Trait)1>::~__dtor(v2 + 424);
      std::__variant_detail::__dtor<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>,(std::__variant_detail::_Trait)1>::~__dtor(v2 + 368);
      std::__variant_detail::__dtor<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>,(std::__variant_detail::_Trait)1>::~__dtor(v2 + 312);
    }
    LAUI_CA_utilities::animation_completion_handler_container::operator()((void **)(v2 + 56), 0);

    if (*(_BYTE *)(v2 + 40))
    {
      v13 = *(void **)v2;
      if (*(_QWORD *)v2)
      {
        *(_QWORD *)(v2 + 8) = v13;
        operator delete(v13);
      }
    }
    JUMPOUT(0x20BD1B2E8);
  }
  return result;
}

void LAUI_uniform_cubic_b_spline_renderer::renderer_t::purge(LAUI_uniform_cubic_b_spline_renderer::renderer_t *this)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  char *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v2 = *((_QWORD *)this + 69);
  v3 = *((_QWORD *)this + 70);
  while (v2 != v3)
  {
    v4 = *(void **)v2;
    *(_QWORD *)v2 = 0;

    v5 = *(void **)(v2 + 8);
    *(_QWORD *)(v2 + 8) = 0;

    v6 = *(void **)(v2 + 16);
    *(_QWORD *)(v2 + 16) = 0;

    v7 = *(void **)(v2 + 24);
    *(_QWORD *)(v2 + 24) = 0;

    v8 = *(void **)(v2 + 32);
    *(_QWORD *)(v2 + 32) = 0;

    v9 = *(void **)(v2 + 40);
    *(_QWORD *)(v2 + 40) = 0;

    v2 += 48;
  }
  v10 = 0;
  *((_QWORD *)this + 83) = 0;
  *((_BYTE *)this + 640) = 0;
  v11 = (char *)this + 648;
  do
  {
    v12 = *(void **)&v11[v10];
    *(_QWORD *)&v11[v10] = 0;

    v10 += 8;
  }
  while (v10 != 16);
  v13 = (void *)*((_QWORD *)this + 67);
  *((_QWORD *)this + 67) = 0;

  v14 = (void *)*((_QWORD *)this + 68);
  *((_QWORD *)this + 68) = 0;

  v15 = (void *)*((_QWORD *)this + 78);
  *((_QWORD *)this + 78) = 0;

  v16 = (void *)*((_QWORD *)this + 79);
  *((_QWORD *)this + 79) = 0;

}

id `anonymous namespace'::color_from_overlayable_color(uint64_t a1, CGColorSpaceRef space)
{
  float32x4_t v3;
  CGColorRef v4;
  uint64_t v5;
  _OWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a1 + 8))
    return *(id *)a1;
  v3 = *(float32x4_t *)(a1 + 16);
  v6[0] = vcvtq_f64_f32(*(float32x2_t *)v3.f32);
  v6[1] = vcvt_hight_f64_f32(v3);
  v4 = CGColorCreate(space, (const CGFloat *)v6);
  if (!v4)
    return 0;
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithCGColor:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  CFRelease(v4);
  return (id)v5;
}

void sub_209E20D5C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_209E20E68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, char a10)
{
  void *v10;

  if (a10)

  _Unwind_Resume(a1);
}

void sub_209E20FAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, char a10)
{
  void *v10;

  if (a10)

  _Unwind_Resume(a1);
}

void sub_209E21804(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void LAUI_uniform_cubic_b_spline_renderer::targetable_animator_t<`anonymous namespace'::face_id_animator_t,`anonymous namespace'::face_id_state_t,`anonymous namespace'::face_id_target_t>::set_targets<LAUI_uniform_cubic_b_spline_renderer::targets_t<`anonymous namespace'::face_id_target_t>>(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  char v11;

  v5 = a3;
  v6 = v5;
  if (*(_BYTE *)(a1 + 48))
  {
    if (v5)
    {
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3321888768;
      v9[2] = ___ZN17LAUI_CA_utilities38animation_completion_handler_container7executeEU13block_pointerFvbEb_block_invoke;
      v9[3] = &__block_descriptor_48_ea8_32c102_ZTSKZN17LAUI_CA_utilities38animation_completion_handler_container7executeEU13block_pointerFvbEbEUlvE__e5_v8__0l;
      v7 = (void *)MEMORY[0x20BD1B708](v5);
      v10 = (id)MEMORY[0x20BD1B708]();
      v11 = 0;
      dispatch_async(MEMORY[0x24BDAC9B8], v9);

    }
  }
  else
  {
    LAUI_CA_utilities::animation_completion_handler_container::set_completion((void **)(a1 + 56), v5);
    if (*(_BYTE *)(a1 + 40))
    {
      v8 = *(void **)a1;
      if (*(_QWORD *)a1)
      {
        *(_QWORD *)(a1 + 8) = v8;
        operator delete(v8);
        *(_QWORD *)a1 = 0;
        *(_QWORD *)(a1 + 8) = 0;
        *(_QWORD *)(a1 + 16) = 0;
      }
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
      *(_QWORD *)a2 = 0;
      *(_QWORD *)(a2 + 8) = 0;
      *(_QWORD *)(a2 + 16) = 0;
      *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
    }
    else
    {
      *(_QWORD *)a1 = 0;
      *(_QWORD *)(a1 + 8) = 0;
      *(_QWORD *)(a1 + 16) = 0;
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
      *(_QWORD *)(a2 + 8) = 0;
      *(_QWORD *)(a2 + 16) = 0;
      *(_QWORD *)a2 = 0;
      *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
      *(_BYTE *)(a1 + 40) = 1;
    }
  }

}

uint64_t LAUI_uniform_cubic_b_spline_renderer::targets_t<`anonymous namespace'::face_id_target_t>::targets_t<`anonymous namespace'::face_id_target_t&>(uint64_t a1, __int128 *a2)
{
  _OWORD *v3;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[25];

  v9 = a2[4];
  *(_OWORD *)v10 = a2[5];
  *(_OWORD *)&v10[9] = *(__int128 *)((char *)a2 + 89);
  v5 = *a2;
  v6 = a2[1];
  v7 = a2[2];
  v8 = a2[3];
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)a1 = 0;
  v3 = operator new(0x70uLL);
  *(_QWORD *)(a1 + 8) = v3 + 7;
  *(_QWORD *)(a1 + 16) = v3 + 7;
  v3[4] = v9;
  v3[5] = *(_OWORD *)v10;
  *(_OWORD *)((char *)v3 + 89) = *(_OWORD *)&v10[9];
  *v3 = v5;
  v3[1] = v6;
  v3[2] = v7;
  v3[3] = v8;
  *(_QWORD *)a1 = v3;
  *(_BYTE *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = 0;
  return a1;
}

void sub_209E21AD8(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

void sub_209E21C24(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t std::vector<void({block_pointer} {__strong})(BOOL),std::allocator<void({block_pointer} {__strong})(BOOL)>>::shrink_to_fit(char **a1)
{
  uint64_t result;
  char *v3;
  char *v4;
  char *v5;
  unint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  _QWORD v16[2];
  uint64_t v17;
  char *v18;
  uint64_t v19;

  v3 = a1[2];
  result = (uint64_t)(a1 + 2);
  v4 = *a1;
  v5 = a1[1];
  v6 = (v5 - *a1) >> 3;
  if (v6 < (v3 - *a1) >> 3)
  {
    v19 = result;
    if (v5 == v4)
    {
      v11 = 0;
      v9 = 8 * v6;
    }
    else
    {
      v7 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<UIView * {__strong}>>(result, v6);
      v4 = *a1;
      v8 = a1[1];
      v9 = (uint64_t)&v7[8 * v6];
      v11 = &v7[8 * v10];
      v17 = v9;
      v18 = v11;
      if (v8 != v4)
      {
        v12 = &v7[8 * v6];
        do
        {
          v13 = *((_QWORD *)v8 - 1);
          v8 -= 8;
          *(_QWORD *)v8 = 0;
          *((_QWORD *)v12 - 1) = v13;
          v12 -= 8;
        }
        while (v8 != v4);
        v14 = *a1;
        v4 = a1[1];
        v9 = v17;
        v11 = v18;
        goto LABEL_9;
      }
    }
    v14 = v4;
    v12 = (char *)v9;
LABEL_9:
    *a1 = v12;
    a1[1] = (char *)v9;
    v15 = a1[2];
    a1[2] = v11;
    v17 = (uint64_t)v4;
    v18 = v15;
    v16[0] = v14;
    v16[1] = v14;
    return std::__split_buffer<UIView * {__strong}>::~__split_buffer((uint64_t)v16);
  }
  return result;
}

void sub_209E21D7C(void *a1)
{
  __cxa_begin_catch(a1);
  __cxa_end_catch();
  JUMPOUT(0x209E21D6CLL);
}

void sub_209E21E50(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_209E22AE8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id *std::optional<LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t>::operator=[abi:ne180100]<LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t const&,void>(id *this, shared_state_t *a2)
{
  if (*((_BYTE *)this + 104))
  {
    LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::operator=(this, (id *)&a2->_device);
  }
  else
  {
    LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::shared_state_t((LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t *)this, a2);
    *((_BYTE *)this + 104) = 1;
  }
  return this;
}

void sub_209E22F3C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::~shared_state_t(id *this)
{
  uint64_t i;

  for (i = 9; i != 6; --i)
  do

  while (i != 3);
}

void std::__optional_storage_base<UIColor * {__strong},false>::__assign_from[abi:ne180100]<std::__optional_copy_assign_base<UIColor * {__strong},false> const&>(id *location, uint64_t a2)
{
  if (*((unsigned __int8 *)location + 8) == *(unsigned __int8 *)(a2 + 8))
  {
    if (*((_BYTE *)location + 8))
      objc_storeStrong(location, *(id *)a2);
  }
  else if (*((_BYTE *)location + 8))
  {

    *((_BYTE *)location + 8) = 0;
  }
  else
  {
    *location = *(id *)a2;
    *((_BYTE *)location + 8) = 1;
  }
}

uint64_t ___ZN17LAUI_CA_utilities38animation_completion_handler_container7executeEU13block_pointerFvbEb_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

uint64_t __copy_helper_block_ea8_32c102_ZTSKZN17LAUI_CA_utilities38animation_completion_handler_container7executeEU13block_pointerFvbEbEUlvE_(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = MEMORY[0x20BD1B708](*(_QWORD *)(a2 + 32));
  *(_QWORD *)(a1 + 32) = result;
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  return result;
}

void __destroy_helper_block_ea8_32c102_ZTSKZN17LAUI_CA_utilities38animation_completion_handler_container7executeEU13block_pointerFvbEbEUlvE_(uint64_t a1)
{

}

id *LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::operator=(id *a1, id *a2)
{
  uint64_t i;

  objc_storeStrong(a1, *a2);
  objc_storeStrong(a1 + 1, a2[1]);
  objc_storeStrong(a1 + 2, a2[2]);
  objc_storeStrong(a1 + 3, a2[3]);
  for (i = 4; i != 7; ++i)
    objc_storeStrong(&a1[i], a2[i]);
  do
  {
    objc_storeStrong(&a1[i], a2[i]);
    ++i;
  }
  while (i != 10);
  objc_storeStrong(a1 + 10, a2[10]);
  objc_storeStrong(a1 + 11, a2[11]);
  objc_storeStrong(a1 + 12, a2[12]);
  return a1;
}

uint64_t ___ZN17LAUI_CA_utilities38animation_completion_handler_container7executeINSt3__16vectorIU8__strongU13block_pointerFvbENS2_9allocatorIS6_EEEEEEvOT_b_block_invoke_0(uint64_t result)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;

  v1 = *(uint64_t **)(result + 32);
  v2 = *(uint64_t **)(result + 40);
  if (v1 != v2)
  {
    v3 = result;
    do
    {
      result = *v1;
      if (*v1)
        result = (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(v3 + 56));
      ++v1;
    }
    while (v1 != v2);
  }
  return result;
}

uint64_t std::vector<`anonymous namespace'::face_id_animator_t::ring_context_t>::emplace_back<`anonymous namespace'::face_id_animator_t::ring_context_t::static_state_t,`anonymous namespace'::face_id_state_t &>(uint64_t *a1, unsigned __int8 *a2, int8x16_t *a3)
{
  unint64_t v6;
  unint64_t v7;
  uint64_t result;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  uint64_t *v19;

  v6 = a1[2];
  v7 = a1[1];
  if (v7 >= v6)
  {
    v10 = 0x8E38E38E38E38E39 * ((uint64_t)(v7 - *a1) >> 5);
    if (v10 + 1 > 0xE38E38E38E38E3)
      std::vector<UIView * {__strong}>::__throw_length_error[abi:ne180100]();
    v11 = 0x8E38E38E38E38E39 * ((uint64_t)(v6 - *a1) >> 5);
    v12 = 2 * v11;
    if (2 * v11 <= v10 + 1)
      v12 = v10 + 1;
    if (v11 >= 0x71C71C71C71C71)
      v13 = 0xE38E38E38E38E3;
    else
      v13 = v12;
    v19 = a1 + 2;
    if (v13)
    {
      if (v13 > 0xE38E38E38E38E3)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v14 = (char *)operator new(288 * v13);
    }
    else
    {
      v14 = 0;
    }
    v15 = v14;
    v16 = &v14[288 * v10];
    v18 = &v14[288 * v13];
    v17 = v16 + 288;
    v9 = a1[1];
  }
  else
  {
    v9 = v7 + 288;
  }
  a1[1] = v9;
  return result;
}

void `anonymous namespace'::face_id_animator_t::face_id_animator_t(LAUI_uniform_cubic_b_spline_renderer::renderer_t &,LAUIPearlGlyphPathStyle,float,`anonymous namespace'::face_id_state_t const&)::{lambda(`anonymous namespace'::quadrant_t)#1}::operator()(uint64_t a1, unsigned int a2)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  float v9;
  float32x4_t v14;
  float v15;
  float v16;
  float32x4_t v17;
  __float2 v18;
  unint64_t v19;
  unint64_t v20;
  float v21;
  float v22;
  float32x4_t v23;
  __float2 v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t i;
  __double2 v31;
  float v32;
  float32x4_t v33;
  unint64_t v34;
  float v35;
  float32x4_t v36;
  unint64_t v37;
  unint64_t v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  uint64_t j;
  __double2 v45;
  float v46;
  float32x4_t v47;
  unint64_t v48;
  float v49;
  float32x4_t v50;
  unint64_t v51;
  unint64_t v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  uint64_t k;
  __double2 v59;
  float v60;
  float32x4_t v61;
  unint64_t v62;
  float v63;
  float32x4_t v64;
  unint64_t v65;
  unint64_t v66;
  uint64_t v67;
  float32x4_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  _OWORD *v76;
  __int128 v77;
  unint64_t v78;
  unint64_t v79;
  unint64_t v80;
  unint64_t v81;
  unint64_t v82;
  uint64_t v83;
  unint64_t v84;
  unint64_t v85;
  uint64_t v86;
  unint64_t v87;
  char *v88;
  uint64_t v89;
  __int32 v90;
  float32x4_t v91;
  float32x4_t v92;
  float v93;
  float v94;
  float v95;
  float32x4_t v96;
  __int128 v97;
  __int128 v98;
  uint64_t v99;
  unint64_t v100;
  __int128 v101;
  uint64_t v102;
  float32x4_t v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  float32x4_t v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  float32x4_t v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  float32x4_t v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  float32x4_t v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  uint64_t v149;
  uint64_t v150;
  void *__p[6];
  __int128 v152;
  __int128 v153;
  _BYTE v154[32];
  _BYTE v155[32];
  float32x4_t v156;
  float32x4_t v157;
  _BYTE v158[24];
  int v159;
  uint64_t v160;
  uint64_t v161;

  v161 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD **)(a1 + 56);
  v5 = 0;
  v6 = 0;
  if (a2 <= 3)
  {
    v5 = qword_209E312F8[(char)a2];
    v6 = qword_209E31318[(char)a2];
  }
  v7 = 0;
  v149 = v6;
  v150 = v5;
  if (a2)
    _ZF = a2 == 3;
  else
    _ZF = 1;
  v9 = 1.0;
  if (!_ZF)
    v9 = -1.0;
  __asm { FMOV            V1.4S, #1.0 }
  v92 = _Q1;
  v14 = _Q1;
  v133 = 0u;
  v134 = 0u;
  v131 = 0u;
  v132 = 0u;
  v129 = 0u;
  v130 = 0u;
  v127 = 0u;
  v128 = 0u;
  v125 = 0u;
  v126 = 0u;
  v123 = 0u;
  v124 = 0u;
  v121 = 0u;
  v122 = 0u;
  v119 = 0u;
  v120 = 0u;
  v117 = 0u;
  v118 = 0u;
  v115 = 0u;
  v116 = 0u;
  v113 = 0u;
  v114 = 0u;
  v111 = 0u;
  v112 = 0u;
  v109 = 0u;
  v110 = 0u;
  v107 = 0u;
  v108 = 0u;
  v105 = 0u;
  v106 = 0u;
  v103 = 0u;
  v104 = 0u;
  v15 = (float)(**(float **)a1 * 0.5) * 3.0;
  v14.f32[0] = v9;
  v91 = v14;
  v103 = 0u;
  v104 = 0u;
  v106 = 0u;
  v107 = 0u;
  v108 = 0u;
  v109 = 0u;
  v110 = 0u;
  v111 = 0u;
  v16 = v15 / 2.9659;
  do
  {
    v18 = __sincosf_stret((float)((float)v7 * 0.2618) + 2.8798);
    *(float *)&v19 = v16 * v18.__cosval;
    *((float *)&v19 + 1) = v16 * v18.__sinval;
    *((_OWORD *)&v103 + v7++) = v19;
  }
  while (v7 != 9);
  v17.i32[0] = 1.0;
  if (a2 > 1)
    v17.f32[0] = -1.0;
  v90 = v17.i32[0];
  v20 = 0;
  v21 = (float)(**(float **)(a1 + 8) * 0.5) * 3.0;
  v112 = 0u;
  v113 = 0u;
  v114 = 0u;
  v115 = 0u;
  v116 = 0u;
  v117 = 0u;
  v22 = v21 / 2.9659;
  v118 = 0u;
  v119 = 0u;
  v120 = 0u;
  do
  {
    v24 = __sincosf_stret((float)((float)v20 * 0.2618) + 2.8798);
    *((_OWORD *)&v112 + v20++) = __PAIR64__(v22 * v24.__sinval, v22 * v24.__cosval);
  }
  while (v20 != 9);
  v23.f32[0] = v22 * v24.__sinval;
  v25 = **(float **)(a1 + 16);
  v26 = **(double **)(a1 + 24) * 0.96;
  v27 = **(double **)(a1 + 32);
  v121 = 0u;
  v122 = 0u;
  v123 = 0u;
  v124 = 0u;
  v125 = 0u;
  v126 = 0u;
  v127 = 0u;
  v128 = 0u;
  v129 = 0u;
  v28 = v25 * -0.5;
  v29 = 2.0 / v26;
  for (i = 21; i != 24; ++i)
  {
    v31 = __sincos_stret((double)(unint64_t)(i - 20) * 0.25 * 1.57079633+ (1.0 - (double)(unint64_t)(i - 20) * 0.25) * 0.0);
    v32 = v28 * pow(fmax(v31.__cosval, 0.0), v29);
    v93 = v32;
    *(double *)v33.i64 = v28 * pow(fmax(v31.__sinval, 0.0), v29);
    v33.f32[0] = *(double *)v33.i64;
    *((_OWORD *)&v103 + i) = __PAIR64__(v33.u32[0], LODWORD(v93));
  }
  v33.f32[0] = v28;
  LODWORD(v34) = v33.i32[0];
  v35 = v27 * (float)(*((float *)&v125 + 1) - *((float *)&v124 + 1));
  v36 = (float32x4_t)v33.u32[0];
  v36.f32[1] = -v35;
  v121 = v36;
  v122 = v33.u32[0];
  *((float *)&v34 + 1) = v35;
  v123 = v34;
  *(float *)&v34 = v27 * (float)(*(float *)&v125 - *(float *)&v126);
  *(float *)&v37 = -*(float *)&v34;
  HIDWORD(v37) = v33.i32[0];
  LODWORD(v38) = 0;
  HIDWORD(v38) = v33.i32[0];
  v128 = v38;
  v129 = v37;
  v127 = __PAIR64__(v33.u32[0], v34);
  v39 = **(double **)(a1 + 24);
  v40 = **(float **)(a1 + 40);
  v41 = **(double **)(a1 + 32);
  v130 = 0u;
  v131 = 0u;
  v132 = 0u;
  v133 = 0u;
  v134 = 0u;
  v135 = 0u;
  v136 = 0u;
  v137 = 0u;
  v138 = 0u;
  v42 = v40 * -0.5;
  v43 = 2.0 / v39;
  for (j = 30; j != 33; ++j)
  {
    v45 = __sincos_stret((double)(unint64_t)(j - 29) * 0.25 * 1.57079633+ (1.0 - (double)(unint64_t)(j - 29) * 0.25) * 0.0);
    v46 = v42 * pow(fmax(v45.__cosval, 0.0), v43);
    v94 = v46;
    *(double *)v47.i64 = v42 * pow(fmax(v45.__sinval, 0.0), v43);
    v47.f32[0] = *(double *)v47.i64;
    *((_OWORD *)&v103 + j) = __PAIR64__(v47.u32[0], LODWORD(v94));
  }
  v47.f32[0] = v42;
  LODWORD(v48) = v47.i32[0];
  v49 = v41 * (float)(*((float *)&v134 + 1) - *((float *)&v133 + 1));
  v50 = (float32x4_t)v47.u32[0];
  v50.f32[1] = -v49;
  v130 = v50;
  v131 = v47.u32[0];
  *((float *)&v48 + 1) = v49;
  v132 = v48;
  *(float *)&v48 = v41 * (float)(*(float *)&v134 - *(float *)&v135);
  *(float *)&v51 = -*(float *)&v48;
  HIDWORD(v51) = v47.i32[0];
  LODWORD(v52) = 0;
  HIDWORD(v52) = v47.i32[0];
  v137 = v52;
  v138 = v51;
  v136 = __PAIR64__(v47.u32[0], v48);
  v53 = **(float **)(a1 + 48);
  v54 = **(double **)(a1 + 24) * 1.04;
  v55 = **(double **)(a1 + 32);
  v139 = 0u;
  v140 = 0u;
  v141 = 0u;
  v142 = 0u;
  v143 = 0u;
  v144 = 0u;
  v145 = 0u;
  v146 = 0u;
  v147 = 0u;
  v56 = v53 * -0.5;
  v57 = 2.0 / v54;
  for (k = 39; k != 42; ++k)
  {
    v59 = __sincos_stret((double)(unint64_t)(k - 38) * 0.25 * 1.57079633+ (1.0 - (double)(unint64_t)(k - 38) * 0.25) * 0.0);
    v60 = v56 * pow(fmax(v59.__cosval, 0.0), v57);
    v95 = v60;
    *(double *)v61.i64 = v56 * pow(fmax(v59.__sinval, 0.0), v57);
    v61.f32[0] = *(double *)v61.i64;
    *((_OWORD *)&v103 + k) = __PAIR64__(v61.u32[0], LODWORD(v95));
  }
  v61.f32[0] = v56;
  LODWORD(v62) = v61.i32[0];
  v63 = v55 * (float)(*((float *)&v143 + 1) - *((float *)&v142 + 1));
  v64 = (float32x4_t)v61.u32[0];
  v64.f32[1] = -v63;
  v139 = v64;
  v140 = v61.u32[0];
  *((float *)&v62 + 1) = v63;
  v141 = v62;
  *(float *)&v62 = v55 * (float)(*(float *)&v143 - *(float *)&v144);
  *(float *)&v65 = -*(float *)&v62;
  HIDWORD(v65) = v61.i32[0];
  LODWORD(v66) = 0;
  HIDWORD(v66) = v61.i32[0];
  v146 = v66;
  v147 = v65;
  v145 = __PAIR64__(v61.u32[0], v62);
  memset(v154, 0, 24);
  std::vector<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t>::reserve((uint64_t *)v154, 5uLL);
  v67 = 0;
  v68 = v91;
  v68.i32[1] = v90;
  v68.i32[2] = v91.i32[2];
  v96 = v68;
  do
  {
    memset(__p, 0, 24);
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPKS1_S7_EEvT_T0_m(__p, (char *)&v103 + v67, (uint64_t)&v112 + v67, 9uLL);
    v69 = *(_QWORD *)&v154[8];
    if (*(_QWORD *)&v154[8] >= *(_QWORD *)&v154[16])
    {
      *(_QWORD *)&v154[8] = _ZNSt3__16vectorIN36LAUI_uniform_cubic_b_spline_renderer8spline_t7state_tENS_9allocatorIS3_EEE24__emplace_back_slow_pathIJNS0_IDv3_fNS4_IS8_EEEEEEEPS3_DpOT_((uint64_t *)v154, (uint64_t)__p);
      if (__p[0])
      {
        __p[1] = __p[0];
        operator delete(__p[0]);
      }
    }
    else
    {
      **(_QWORD **)&v154[8] = 0;
      *(_QWORD *)(v69 + 8) = 0;
      *(_QWORD *)(v69 + 16) = 0;
      *(_OWORD *)v69 = *(_OWORD *)__p;
      *(void **)(v69 + 16) = __p[2];
      memset(__p, 0, 24);
      if (*(_QWORD *)(v69 + 8) - *(_QWORD *)v69 <= 0x3FuLL)
        goto LABEL_50;
      *(_QWORD *)&v154[8] = v69 + 24;
    }
    v67 += 144;
  }
  while (v67 != 720);
  LAUI_uniform_cubic_b_spline_renderer::weighted_spline_t::weighted_spline_t<std::vector<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t>>((uint64_t)&v100, (uint64_t)v154);
  __p[0] = v154;
  std::vector<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
  v70 = v4[8];
  v152 = 0u;
  _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEEC2EmRKS1_(__p, v100, &v152);
  v71 = __p[0];
  *(void **)v154 = __p[0];
  *(_OWORD *)&v154[8] = *(_OWORD *)&__p[1];
  memset(__p, 0, 24);
  if (*(_QWORD *)&v154[8] - (_QWORD)v71 <= 0x3FuLL)
  {
LABEL_50:
    __break(1u);
    return;
  }
  v99 = LAUI_uniform_cubic_b_spline_renderer::renderer_t::add_spline(v70, &v100, (__int128 **)v154);
  if (*(_QWORD *)v154)
  {
    *(_QWORD *)&v154[8] = *(_QWORD *)v154;
    operator delete(*(void **)v154);
  }
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  v72 = *(_QWORD *)(a1 + 64);
  *(_OWORD *)v154 = 0u;
  *(_OWORD *)&v154[16] = xmmword_209E30C90;
  *(_OWORD *)v155 = 0u;
  *(_OWORD *)&v155[16] = xmmword_209E30C90;
  v156 = v92;
  v157 = 0uLL;
  *(_OWORD *)&v158[8] = xmmword_209E30F30;
  *(_DWORD *)v158 = 1065353216;
  v159 = 0;
  v160 = 0;
  *(_QWORD *)&v98 = LAUI_uniform_cubic_b_spline_renderer::renderer_t::add_instance(v72, &v99, &v148, (LAUI_uniform_cubic_b_spline_renderer::spline_t::instance_t::state_t *)v154);
  *((_QWORD *)&v98 + 1) = v73;
  v74 = *(_QWORD *)(a1 + 64);
  *(_OWORD *)v154 = 0u;
  *(_OWORD *)&v154[16] = xmmword_209E30C90;
  *(_OWORD *)v155 = 0u;
  *(_OWORD *)&v155[16] = xmmword_209E30C90;
  v156 = v92;
  v157 = 0uLL;
  *(_OWORD *)&v158[8] = xmmword_209E30F30;
  *(_DWORD *)v158 = 1065353216;
  v159 = 0;
  v160 = 0;
  *(_QWORD *)&v97 = LAUI_uniform_cubic_b_spline_renderer::renderer_t::add_instance(v74, &v99, &v148, (LAUI_uniform_cubic_b_spline_renderer::spline_t::instance_t::state_t *)v154);
  *((_QWORD *)&v97 + 1) = v75;
  v152 = v98;
  v153 = v97;
  v76 = operator new(0x20uLL);
  v77 = v153;
  *v76 = v152;
  v76[1] = v77;
  LODWORD(v78) = **(_DWORD **)(a1 + 88);
  HIDWORD(v78) = v78;
  LODWORD(v79) = **(_DWORD **)(a1 + 96);
  HIDWORD(v79) = v79;
  LODWORD(v77) = **(_DWORD **)(a1 + 104);
  DWORD1(v77) = v77;
  *(_QWORD *)v154 = v99;
  *(_QWORD *)&v154[8] = v76;
  *(_QWORD *)&v154[16] = v76 + 2;
  *(_QWORD *)&v154[24] = v76 + 2;
  *(_OWORD *)&v155[8] = v101;
  *(_QWORD *)v155 = v100;
  *(_QWORD *)&v155[24] = v102;
  v101 = 0uLL;
  v102 = 0;
  v156 = vmulq_f32(v96, (float32x4_t)v78);
  v157 = vmulq_f32(v96, (float32x4_t)v79);
  *(float32x4_t *)v158 = vmulq_f32(v96, (float32x4_t)(unint64_t)v77);
  v80 = v4[107];
  v81 = v4[108];
  if (v80 >= v81)
  {
    v83 = v4[106];
    v84 = 0xEEEEEEEEEEEEEEEFLL * ((uint64_t)(v80 - v83) >> 4);
    if (v84 + 1 > 0x111111111111111)
      std::vector<UIView * {__strong}>::__throw_length_error[abi:ne180100]();
    v85 = 0xEEEEEEEEEEEEEEEFLL * ((uint64_t)(v81 - v83) >> 4);
    v86 = 2 * v85;
    if (2 * v85 <= v84 + 1)
      v86 = v84 + 1;
    if (v85 >= 0x88888888888888)
      v87 = 0x111111111111111;
    else
      v87 = v86;
    __p[4] = v4 + 108;
    if (v87)
    {
      if (v87 > 0x111111111111111)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v88 = (char *)operator new(240 * v87);
    }
    else
    {
      v88 = 0;
    }
    v89 = (uint64_t)&v88[240 * v84];
    __p[0] = v88;
    __p[1] = (void *)v89;
    __p[3] = &v88[240 * v87];
    __p[2] = (void *)(v89 + 240);
    v82 = v4[107];
  }
  else
  {
    v82 = v80 + 240;
  }
  v4[107] = v82;
  __p[0] = &v155[8];
  std::vector<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
  if (*(_QWORD *)&v154[8])
  {
    *(_QWORD *)&v154[16] = *(_QWORD *)&v154[8];
    operator delete(*(void **)&v154[8]);
  }
  *(_QWORD *)v154 = &v101;
  std::vector<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t>::__destroy_vector::operator()[abi:ne180100]((void ***)v154);
}

void sub_209E23E00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  STACK[0x3D0] = (unint64_t)&a24;
  std::vector<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t>::__destroy_vector::operator()[abi:ne180100]((void ***)&STACK[0x3D0]);
  _Unwind_Resume(a1);
}

void _ZZN12_GLOBAL__N_118face_id_animator_tC1ERN36LAUI_uniform_cubic_b_spline_renderer10renderer_tE23LAUIPearlGlyphPathStylefRKNS_15face_id_state_tEENKUlDv3_fE_clES8_(uint64_t a1, __n128 a2)
{
  uint64_t *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  float v15;
  __n128 *v16;
  unint64_t v17;
  __n128 *v18;
  __n128 *v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  __n128 v23;
  char *v24;
  __n128 *v25;
  __n128 v26;
  __n128 v27;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;
  _OWORD v32[5];
  uint64_t v33;
  uint64_t v34;
  int v35;
  __int128 v36;
  int v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD **)a1;
  v3 = *(uint64_t **)(a1 + 8);
  v5 = *(_QWORD *)(*(_QWORD *)a1 + 64);
  v29 = 0;
  v30 = xmmword_209E30F20;
  v31 = 0x3FF0000000000000;
  v32[0] = 0u;
  v32[1] = xmmword_209E30C90;
  v32[2] = 0u;
  v32[3] = xmmword_209E30C90;
  __asm { FMOV            V0.4S, #1.0 }
  v32[4] = _Q0;
  v33 = 0;
  v34 = 0;
  v35 = 1065353216;
  v36 = xmmword_209E30F30;
  v37 = 0;
  v38 = 0;
  v11 = LAUI_uniform_cubic_b_spline_renderer::renderer_t::add_instance(v5, v3, (__int128 *)&v29, (LAUI_uniform_cubic_b_spline_renderer::spline_t::instance_t::state_t *)v32);
  v13 = v11;
  v14 = v12;
  v15 = **(float **)(a1 + 16) * 1.133333;
  v16 = (__n128 *)v4[141];
  v17 = v4[142];
  if ((unint64_t)v16 >= v17)
  {
    v19 = (__n128 *)v4[140];
    v20 = 0xAAAAAAAAAAAAAAABLL * (v16 - v19) + 1;
    if (v20 > 0x555555555555555)
      std::vector<UIView * {__strong}>::__throw_length_error[abi:ne180100]();
    v21 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v17 - (_QWORD)v19) >> 4);
    if (2 * v21 > v20)
      v20 = 2 * v21;
    if (v21 >= 0x2AAAAAAAAAAAAAALL)
      v22 = 0x555555555555555;
    else
      v22 = v20;
    v23 = a2;
    if (v22)
    {
      if (v22 > 0x555555555555555)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v24 = (char *)operator new(48 * v22);
      v23 = a2;
    }
    else
    {
      v24 = 0;
    }
    v25 = (__n128 *)&v24[16 * (v16 - v19)];
    v25->n128_u64[0] = v13;
    v25->n128_u64[1] = v14;
    v25[1].n128_f32[0] = v15;
    v25[2] = v23;
    v18 = v25 + 3;
    if (v16 != v19)
    {
      do
      {
        v26 = v16[-3];
        v27 = v16[-1];
        v25[-2] = v16[-2];
        v25[-1] = v27;
        v25[-3] = v26;
        v25 -= 3;
        v16 -= 3;
      }
      while (v16 != v19);
      v16 = (__n128 *)v4[140];
    }
    v4[140] = v25;
    v4[141] = v18;
    v4[142] = &v24[48 * v22];
    if (v16)
      operator delete(v16);
  }
  else
  {
    v16->n128_u64[0] = v11;
    v16->n128_u64[1] = v12;
    v16[1].n128_f32[0] = v15;
    v18 = v16 + 3;
    v16[2] = a2;
  }
  v4[141] = v18;
}

void `anonymous namespace'::face_id_animator_t::push_state(_anonymous_namespace_::face_id_animator_t *this)
{
  float64x2_t v2;
  unsigned int v3;
  int v4;
  _OWORD *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  int8x8_t v24;
  unint64_t v25;
  uint8x8_t v26;
  unint64_t v27;
  _QWORD *v28;
  _QWORD *v29;
  unint64_t v30;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int v39;
  __int128 v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[24];
  __int128 v47;
  void **v48;
  float64x2_t v49[2];
  __int128 v50;
  int v51;
  __int128 v52;
  _BYTE __p[32];
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[32];
  uint64_t v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v2 = *((float64x2_t *)this + 38);
  v49[0] = *((float64x2_t *)this + 37);
  v49[1] = v2;
  LODWORD(v2.f64[0]) = *((_DWORD *)this + 91);
  v3 = *((_DWORD *)this + 105);
  v4 = *((_DWORD *)this + 119);
  LODWORD(v50) = *((_DWORD *)this + 77);
  *(_QWORD *)((char *)&v50 + 4) = __PAIR64__(v3, LODWORD(v2.f64[0]));
  HIDWORD(v50) = v4;
  v51 = *((_DWORD *)this + 60);
  v2.f64[0] = *((float *)this + 183);
  *(double *)&v52 = *((float *)this + 169);
  *((_QWORD *)&v52 + 1) = *(_QWORD *)&v2.f64[0];
  v5 = (_OWORD *)*((_QWORD *)this + 8);
  v6 = v57;
  v5[21] = v56;
  v5[22] = v6;
  v7 = *(_OWORD *)&v58[16];
  v5[23] = *(_OWORD *)v58;
  v5[24] = v7;
  v8 = *(_OWORD *)&__p[16];
  v5[17] = *(_OWORD *)__p;
  v5[18] = v8;
  v9 = v55;
  v5[19] = v54;
  v5[20] = v9;
  v10 = *((_QWORD *)this + 8);
  *(_OWORD *)__p = v50;
  LAUI_uniform_cubic_b_spline_renderer::renderer_t::set_state(v10, (uint64_t)__p);
  v11 = *((_QWORD *)this + 106);
  v12 = *((_QWORD *)this + 107);
  if (v11 != v12)
  {
    __asm { FMOV            V0.4S, #1.0 }
    v43 = _Q0;
    do
    {
      v17 = 0uLL;
      memset(__p, 0, 24);
      v18 = *(_QWORD *)(v11 + 208);
      v19 = *(_QWORD *)(v11 + 216);
      v48 = (void **)__p;
      if (v18 == v19)
      {
        v20 = 0;
      }
      else
      {
        do
        {
          *(_OWORD *)v46 = *(_OWORD *)(v18 + 64);
          _ZNSt3__120back_insert_iteratorINS_6vectorIDv3_fNS_9allocatorIS2_EEEEEaSB8ne180100EOS2_(&v48, v46);
          v18 += 96;
        }
        while (v18 != v19);
        v20 = *(_QWORD *)__p;
        v17 = *(_OWORD *)&__p[8];
      }
      *(_QWORD *)v46 = v20;
      *(_OWORD *)&v46[8] = v17;
      memset(__p, 0, 24);
      if ((unint64_t)(v17 - v20) <= 0x3F)
        __break(1u);
      v47 = *(_OWORD *)(v11 + 176);
      v21 = *((_QWORD *)this + 8);
      LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t::state_t(__p, (uint64_t)v46);
      LAUI_uniform_cubic_b_spline_renderer::renderer_t::set_state(v21, (_QWORD *)v11, (__int128 **)__p);
      if (*(_QWORD *)__p)
      {
        *(_QWORD *)&__p[8] = *(_QWORD *)__p;
        operator delete(*(void **)__p);
      }
      v22 = *(_QWORD **)(v11 + 8);
      v23 = *(_QWORD **)(v11 + 16);
LABEL_11:
      if (v22 != v23)
      {
        v24 = *(int8x8_t *)((char *)this + 1152);
        if (!*(_QWORD *)&v24)
          goto LABEL_40;
        v25 = v22[1];
        v26 = (uint8x8_t)vcnt_s8(v24);
        v26.i16[0] = vaddlv_u8(v26);
        if (v26.u32[0] > 1uLL)
        {
          v27 = v22[1];
          if (v25 >= *(_QWORD *)&v24)
            v27 = v25 % *(_QWORD *)&v24;
        }
        else
        {
          v27 = (*(_QWORD *)&v24 - 1) & v25;
        }
        v28 = *(_QWORD **)(*((_QWORD *)this + 143) + 8 * v27);
        if (!v28 || (v29 = (_QWORD *)*v28) == 0)
LABEL_40:
          std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
        while (1)
        {
          v30 = v29[1];
          if (v25 == v30)
          {
            if (v29[2] == *v22 && v29[3] == v25)
            {
              v32 = *((_QWORD *)this + 109) + 288 * v29[4];
              v33 = *(_OWORD *)(v32 + 160);
              v34 = *(_OWORD *)(v32 + 256);
              v35 = *((_QWORD *)this + 8);
              *(_DWORD *)&v58[24] = 0;
              v59 = 0;
              *(_OWORD *)&v58[8] = v52;
              *(_DWORD *)v58 = v51;
              v54 = v47;
              v55 = xmmword_209E30C90;
              *(_OWORD *)__p = v47;
              *(_OWORD *)&__p[16] = v33;
              v56 = v43;
              v57 = v34;
              LAUI_uniform_cubic_b_spline_renderer::renderer_t::set_state(v35, v22, (LAUI_uniform_cubic_b_spline_renderer::spline_t::instance_t::state_t *)__p);
              v22 += 2;
              goto LABEL_11;
            }
          }
          else
          {
            if (v26.u32[0] > 1uLL)
            {
              if (v30 >= *(_QWORD *)&v24)
                v30 %= *(_QWORD *)&v24;
            }
            else
            {
              v30 &= *(_QWORD *)&v24 - 1;
            }
            if (v30 != v27)
              goto LABEL_40;
          }
          v29 = (_QWORD *)*v29;
          if (!v29)
            goto LABEL_40;
        }
      }
      if (*(_QWORD *)v46)
      {
        *(_QWORD *)&v46[8] = *(_QWORD *)v46;
        operator delete(*(void **)v46);
      }
      v11 += 240;
    }
    while (v11 != v12);
  }
  v36 = *((_QWORD *)this + 140);
  v37 = *((_QWORD *)this + 141);
  if (v36 != v37)
  {
    v44 = *((_OWORD *)this + 67);
    v45 = *((_OWORD *)this + 61);
    __asm { FMOV            V0.4S, #1.0 }
    v42 = _Q0;
    do
    {
      v39 = *(_DWORD *)(v36 + 16);
      v40 = *(_OWORD *)(v36 + 32);
      v41 = *((_QWORD *)this + 8);
      *(_OWORD *)&v58[8] = xmmword_209E30F30;
      *(_DWORD *)&v58[24] = 0;
      v59 = 0;
      *(_DWORD *)v58 = v39;
      v54 = v40;
      v55 = xmmword_209E30C90;
      *(_OWORD *)__p = v40;
      *(_OWORD *)&__p[16] = v45;
      v56 = v42;
      v57 = v44;
      LAUI_uniform_cubic_b_spline_renderer::renderer_t::set_state(v41, (_QWORD *)v36, (LAUI_uniform_cubic_b_spline_renderer::spline_t::instance_t::state_t *)__p);
      v36 += 48;
    }
    while (v36 != v37);
  }
}

void sub_209E24444(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

uint64_t std::__variant_detail::__dtor<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<decltype(nullptr)>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>,(std::__variant_detail::_Trait)1>::~__dtor(uint64_t a1)
{
  uint64_t v2;
  char v4;

  v2 = *(unsigned int *)(a1 + 8);
  if ((_DWORD)v2 != -1)
    ((void (*)(char *, uint64_t))*(&off_24C27EEB8 + v2))(&v4, a1);
  *(_DWORD *)(a1 + 8) = -1;
  return a1;
}

uint64_t _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm1EEE10__dispatchB8ne180100IOZNS0_6__dtorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDnEENS_14default_deleteISC_EEEENS9_INSA_18animation_timing_tENSD_ISG_EEEEEEELNS0_6_TraitE1EE9__destroyB8ne180100EvEUlRT_E_JRNS0_6__baseILSK_1EJS8_SF_SI_EEEEEEDcSM_DpT0_(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  *a2 = 0;
  if (result)
    JUMPOUT(0x20BD1B2E8);
  return result;
}

uint64_t _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm2EEE10__dispatchB8ne180100IOZNS0_6__dtorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDnEENS_14default_deleteISC_EEEENS9_INSA_18animation_timing_tENSD_ISG_EEEEEEELNS0_6_TraitE1EE9__destroyB8ne180100EvEUlRT_E_JRNS0_6__baseILSK_1EJS8_SF_SI_EEEEEEDcSM_DpT0_(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  *a2 = 0;
  if (result)
    JUMPOUT(0x20BD1B2E8);
  return result;
}

uint64_t std::__variant_detail::__dtor<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>,(std::__variant_detail::_Trait)1>::~__dtor(uint64_t a1)
{
  uint64_t v2;
  char v4;

  v2 = *(unsigned int *)(a1 + 8);
  if ((_DWORD)v2 != -1)
    ((void (*)(char *, uint64_t))*(&off_24C27EED0 + v2))(&v4, a1);
  *(_DWORD *)(a1 + 8) = -1;
  return a1;
}

uint64_t _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm1EEE10__dispatchB8ne180100IOZNS0_6__dtorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIfEENS_14default_deleteISC_EEEENS9_INSA_18animation_timing_tENSD_ISG_EEEEEEELNS0_6_TraitE1EE9__destroyB8ne180100EvEUlRT_E_JRNS0_6__baseILSK_1EJS8_SF_SI_EEEEEEDcSM_DpT0_(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  *a2 = 0;
  if (result)
    JUMPOUT(0x20BD1B2E8);
  return result;
}

uint64_t _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm2EEE10__dispatchB8ne180100IOZNS0_6__dtorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIfEENS_14default_deleteISC_EEEENS9_INSA_18animation_timing_tENSD_ISG_EEEEEEELNS0_6_TraitE1EE9__destroyB8ne180100EvEUlRT_E_JRNS0_6__baseILSK_1EJS8_SF_SI_EEEEEEDcSM_DpT0_(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  *a2 = 0;
  if (result)
    JUMPOUT(0x20BD1B2E8);
  return result;
}

uint64_t _ZNSt3__116__variant_detail6__dtorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_dEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEELNS0_6_TraitE1EED2Ev(uint64_t a1)
{
  uint64_t v2;
  char v4;

  v2 = *(unsigned int *)(a1 + 8);
  if ((_DWORD)v2 != -1)
    ((void (*)(char *, uint64_t))*(&off_24C27EEE8 + v2))(&v4, a1);
  *(_DWORD *)(a1 + 8) = -1;
  return a1;
}

uint64_t _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm1EEE10__dispatchB8ne180100IOZNS0_6__dtorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_dEENS_14default_deleteISD_EEEENS9_INSA_18animation_timing_tENSE_ISH_EEEEEEELNS0_6_TraitE1EE9__destroyB8ne180100EvEUlRT_E_JRNS0_6__baseILSL_1EJS8_SG_SJ_EEEEEEDcSN_DpT0_(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  *a2 = 0;
  if (result)
    JUMPOUT(0x20BD1B2E8);
  return result;
}

uint64_t _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm2EEE10__dispatchB8ne180100IOZNS0_6__dtorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_dEENS_14default_deleteISD_EEEENS9_INSA_18animation_timing_tENSE_ISH_EEEEEEELNS0_6_TraitE1EE9__destroyB8ne180100EvEUlRT_E_JRNS0_6__baseILSL_1EJS8_SG_SJ_EEEEEEDcSN_DpT0_(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  *a2 = 0;
  if (result)
    JUMPOUT(0x20BD1B2E8);
  return result;
}

uint64_t _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_dLNS_27animator_interpolation_typeE0EEC2IRKS1_EEOT_(uint64_t a1, __int128 *a2)
{
  float v3;
  BOOL v4;
  float v5;
  __int128 v7;
  __int128 v8;

  v7 = a2[1];
  v8 = *a2;
  *(_OWORD *)a1 = *a2;
  *(_OWORD *)(a1 + 16) = v7;
  v3 = fmaxf(fminf(nexttowardf(1.0, 0.0), 0.0), 0.0);
  *(float *)(a1 + 32) = v3;
  *(_BYTE *)(a1 + 36) = 0;
  *(_BYTE *)(a1 + 44) = 0;
  *(_DWORD *)(a1 + 56) = 0;
  v4 = v3 <= 0.0;
  v5 = INFINITY;
  if (v4)
    v5 = 0.0;
  *(float *)(a1 + 48) = v5;
  *(float *)(a1 + 52) = v5;
  *(_OWORD *)(a1 + 64) = v8;
  *(_OWORD *)(a1 + 80) = v7;
  *(_OWORD *)(a1 + 96) = v8;
  *(_OWORD *)(a1 + 112) = v7;
  *(_DWORD *)(a1 + 136) = 0;
  return a1;
}

BOOL LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::set_target<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>(uint64_t a1, uint64_t a2, int a3)
{
  float v6;
  _OWORD *v7;
  float v8;
  float v9;
  _OWORD *v10;
  __int128 v11;
  uint64_t v12;
  float v13;
  _BYTE v15[28];

  if (*(_DWORD *)(a1 + 48))
    std::variant<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>::operator=[abi:ne180100]<std::monostate,0,std::monostate,0ul,0>(a1 + 40);
  v6 = *(float *)a1;
  v7 = (_OWORD *)(a2 + 4);
  v8 = *(float *)a2;
  if (*(float *)a1 == *(float *)a2)
  {
    LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::set_timing(a1, (uint64_t)v7, a3);
  }
  else
  {
    v9 = *(float *)(a2 + 28);
    if (v9 >= 0.0)
    {
      *(_OWORD *)v15 = *v7;
      *(_QWORD *)&v15[16] = *(_QWORD *)(a2 + 20);
      *(_DWORD *)&v15[24] = 0;
      LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::_set_timing(a1, (__int128 *)v15);
      v13 = *(float *)a2;
      *(_DWORD *)a1 = *(_DWORD *)a2;
      *(_OWORD *)(a1 + 16) = *(_OWORD *)&v15[12];
      *(_OWORD *)(a1 + 4) = *(_OWORD *)v15;
      if (*(float *)(a1 + 20) <= 0.0)
      {
        *(float *)(a1 + 32) = v13;
        *(float *)(a1 + 36) = v13;
      }
      else if (v9 > 0.0)
      {
        LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::update(a1, v9);
      }
    }
    else
    {
      v10 = (_OWORD *)operator new();
      v11 = *(_OWORD *)(a2 + 16);
      *v10 = *(_OWORD *)a2;
      v10[1] = v11;
      *(_QWORD *)v15 = v10;
      std::__variant_detail::__assignment<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>>::__assign_alt[abi:ne180100]<1ul,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>>(a1 + 40, (uint64_t *)(a1 + 40), (uint64_t *)v15);
      v12 = *(_QWORD *)v15;
      *(_QWORD *)v15 = 0;
      if (v12)
        MEMORY[0x20BD1B2E8](v12, 0x1000C4099C38B47);
    }
  }
  return v6 != v8;
}

uint64_t LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::set_timing(uint64_t result, uint64_t a2, int a3)
{
  uint64_t v5;
  uint64_t v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  _OWORD *v15;
  uint64_t v16;
  uint64_t *v17;

  v5 = result;
  if (*(_DWORD *)(result + 48))
    result = std::variant<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>::operator=[abi:ne180100]<std::monostate,0,std::monostate,0ul,0>(result + 40);
  if (a3)
  {
    v16 = v5;
    v6 = *(unsigned int *)(v5 + 48);
    if ((_DWORD)v6 == -1)
      std::__throw_bad_variant_access[abi:ne180100]();
    v17 = &v16;
    result = ((uint64_t (*)(uint64_t **, uint64_t))*(&off_24C27EF00 + v6))(&v17, v5 + 40);
    if ((_DWORD)result)
    {
      v7 = *(float *)(v5 + 28);
      v8 = *(float *)(v5 + 20) - v7;
      v9 = *(float *)(v5 + 24) - v7;
      v10 = *(float *)(a2 + 24);
      v11 = *(float *)(a2 + 16) - v10;
      v12 = *(float *)(a2 + 20) - v10;
      if ((a3 & 2) != 0 && (v11 < v8 || v12 < v9))
        goto LABEL_16;
      if ((a3 & 4) != 0 && (v11 > v8 || v12 > v9))
      {
LABEL_16:
        if (v10 >= 0.0)
        {
          return LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::_set_timing(v5, (__int128 *)a2);
        }
        else if ((float)(v8 + v10) > 0.0)
        {
          v15 = (_OWORD *)operator new();
          *v15 = *(_OWORD *)a2;
          *(_OWORD *)((char *)v15 + 12) = *(_OWORD *)(a2 + 12);
          v17 = (uint64_t *)v15;
          std::__variant_detail::__assignment<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>>::__assign_alt[abi:ne180100]<2ul,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>(v5 + 40, (uint64_t *)(v5 + 40), (uint64_t *)&v17);
          result = (uint64_t)v17;
          v17 = 0;
          if (result)
            return MEMORY[0x20BD1B2E8](result, 0x1000C40CBDA3C1BLL);
        }
      }
    }
  }
  return result;
}

uint64_t LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::_set_timing(uint64_t result, __int128 *a2)
{
  float v2;
  float v3;
  float *v4;
  float v5;
  unsigned int v6;
  BOOL v7;
  float v9;
  float v10;
  __int128 v11;
  float v12;

  v2 = *((float *)a2 + 6);
  if (v2 < 0.0)
  {
    __break(1u);
    return result;
  }
  v3 = *((float *)a2 + 4);
  v4 = (float *)(result + 4);
  if (*(float *)(result + 20) > 0.0 && v3 > 0.0 && *v4 != *(float *)a2)
  {
    v5 = (float)(*(float *)a2 * (float)(1.0 - *v4)) / (float)(*v4 * (float)(1.0 - *(float *)a2));
    v6 = (COERCE_INT(fabs(v5)) - 0x800000) >> 24;
    v7 = v5 < 0.0 || v6 > 0x7E;
    if (!v7 || (LODWORD(v5) - 1) <= 0x7FFFFE)
    {
      v9 = *(float *)(result + 32);
      v10 = (float)((float)(1.0 - v5) * *(float *)result) + (float)((float)(1.0 - (float)(1.0 - v5)) * v9);
      if (v9 == *(float *)result)
        v10 = *(float *)(result + 32);
      *(float *)(result + 32) = v10;
    }
  }
  v11 = *a2;
  *(_OWORD *)(result + 16) = *(__int128 *)((char *)a2 + 12);
  *(_OWORD *)v4 = v11;
  if (v2 <= 0.0)
  {
    if (v3 > 0.0)
      return result;
  }
  else
  {
    *(_DWORD *)(result + 28) = 0;
    if (v3 > 0.0)
      return LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::update(result, v2);
  }
  v12 = *(float *)result;
  *(_DWORD *)(result + 32) = *(_DWORD *)result;
  *(float *)(result + 36) = v12;
  return result;
}

uint64_t LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::update(uint64_t a1, float a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  __int16 v7;
  int v8;
  _QWORD v10[2];
  float v11;
  _QWORD *v12;

  v11 = a2;
  v12 = (_QWORD *)a1;
  v2 = *(unsigned int *)(a1 + 48);
  if ((_DWORD)v2 == -1)
    std::__throw_bad_variant_access[abi:ne180100]();
  v5 = a1 + 40;
  v10[0] = &v12;
  if (((unsigned int (*)(_QWORD *, uint64_t))*(&off_24C27EF00 + v2))(v10, a1 + 40))
  {
    if (a2 == 0.0)
    {
      LOBYTE(v7) = 0;
      v8 = 0;
    }
    else
    {
      v10[0] = a1;
      v10[1] = &v11;
      v6 = *(unsigned int *)(a1 + 48);
      if ((_DWORD)v6 == -1)
        std::__throw_bad_variant_access[abi:ne180100]();
      v12 = v10;
      v7 = ((uint64_t (*)(_QWORD **, uint64_t))*(&off_24C27EF18 + v6))(&v12, v5);
      v8 = HIBYTE(v7);
    }
  }
  else
  {
    LOBYTE(v7) = 1;
    v8 = 1;
  }
  return v7 | (v8 << 8);
}

uint64_t std::variant<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>::operator=[abi:ne180100]<std::monostate,0,std::monostate,0ul,0>(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 8))
    std::__variant_detail::__assignment<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>>::__emplace[abi:ne180100]<0ul,std::monostate>(a1);
  return a1;
}

uint64_t std::__variant_detail::__assignment<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>>::__emplace[abi:ne180100]<0ul,std::monostate>(uint64_t a1)
{
  uint64_t v2;
  char v4;

  v2 = *(unsigned int *)(a1 + 8);
  if ((_DWORD)v2 != -1)
    ((void (*)(char *, uint64_t))*(&off_24C27EED0 + v2))(&v4, a1);
  *(_DWORD *)(a1 + 8) = 0;
  return a1;
}

void std::__throw_bad_variant_access[abi:ne180100]()
{
  _QWORD *exception;

  exception = __cxa_allocate_exception(8uLL);
  *exception = MEMORY[0x24BEDB8D8] + 16;
}

BOOL _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm0EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZNK36LAUI_uniform_cubic_b_spline_renderer10animator_tIfLNS8_27animator_interpolation_typeE0EE12is_animatingEvEUlOT_E_EEJRKNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tIfEENS_14default_deleteISM_EEEENSK_INS8_18animation_timing_tENSN_ISQ_EEEEEEEEEEDcSC_DpT0_(uint64_t a1)
{
  return *(float *)(**(_QWORD **)a1 + 20) > 0.0;
}

uint64_t _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm1EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZNK36LAUI_uniform_cubic_b_spline_renderer10animator_tIfLNS8_27animator_interpolation_typeE0EE12is_animatingEvEUlOT_E_EEJRKNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tIfEENS_14default_deleteISM_EEEENSK_INS8_18animation_timing_tENSN_ISQ_EEEEEEEEEEDcSC_DpT0_()
{
  return 1;
}

uint64_t _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm2EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZNK36LAUI_uniform_cubic_b_spline_renderer10animator_tIfLNS8_27animator_interpolation_typeE0EE12is_animatingEvEUlOT_E_EEJRKNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tIfEENS_14default_deleteISM_EEEENSK_INS8_18animation_timing_tENSN_ISQ_EEEEEEEEEEDcSC_DpT0_()
{
  return 1;
}

uint64_t std::__variant_detail::__assignment<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>>::__assign_alt[abi:ne180100]<2ul,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t result;

  if (*(_DWORD *)(a1 + 8) != 2)
    return std::__variant_detail::__assignment<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>>::__emplace[abi:ne180100]<2ul,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>(a1, a3);
  v3 = *a3;
  *a3 = 0;
  result = *a2;
  *a2 = v3;
  if (result)
    JUMPOUT(0x20BD1B2E8);
  return result;
}

uint64_t std::__variant_detail::__assignment<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>>::__emplace[abi:ne180100]<2ul,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  char v7;

  v4 = *(unsigned int *)(a1 + 8);
  if ((_DWORD)v4 != -1)
    ((void (*)(char *, uint64_t))*(&off_24C27EED0 + v4))(&v7, a1);
  v5 = *a2;
  *a2 = 0;
  *(_QWORD *)a1 = v5;
  *(_DWORD *)(a1 + 8) = 2;
  return a1;
}

float *_ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm0EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIfLNS8_27animator_interpolation_typeE0EE6updateEfEUlRT_E_EEJRNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tIfEENS_14default_deleteISM_EEEENSK_INS8_18animation_timing_tENSN_ISQ_EEEEEEEEEEDcSC_DpT0_(float ***a1)
{
  return LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::_update(**a1, *(*a1)[1]);
}

uint64_t *_ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm1EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIfLNS8_27animator_interpolation_typeE0EE6updateEfEUlRT_E_EEJRNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tIfEENS_14default_deleteISM_EEEENSK_INS8_18animation_timing_tENSN_ISQ_EEEEEEEEEEDcSC_DpT0_(uint64_t **a1, uint64_t *a2)
{
  return LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::update(float)::{lambda(float &)#1}::operator()<std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>>(*a1, a2);
}

uint64_t *_ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm2EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIfLNS8_27animator_interpolation_typeE0EE6updateEfEUlRT_E_EEJRNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tIfEENS_14default_deleteISM_EEEENSK_INS8_18animation_timing_tENSN_ISQ_EEEEEEEEEEDcSC_DpT0_(uint64_t **a1, uint64_t *a2)
{
  return LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::update(float)::{lambda(float &)#1}::operator()<std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>(*a1, a2);
}

float *LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::_update(float *result, float a2)
{
  float v3;
  float *v4;
  float v5;
  float v6;
  int v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  _BOOL4 v13;
  float v14;
  float v15;
  float v16;
  float v17;

  v3 = result[5];
  if (v3 <= 0.0)
    goto LABEL_12;
  if (a2 >= 0.0)
  {
    v4 = result;
    v5 = result[7] + a2;
    result[7] = v5;
    if (v5 < v3)
    {
      v6 = powf(result[1], a2);
      v7 = 0;
      v8 = fmax((float)(1.0 - v6), 0.0);
      v9 = v4[8];
      v10 = v4[9];
      v11 = (float)(*v4 * v8) + (float)((float)(1.0 - v8) * v9);
      if (v9 == *v4)
        v11 = v4[8];
      v12 = (float)(v11 * v8) + (float)((float)(1.0 - v8) * v10);
      if (v10 == v11)
        v12 = v4[9];
      v4[8] = v11;
      v4[9] = v12;
      v13 = v5 >= v4[6];
      return (float *)(v13 | (v7 << 8));
    }
    v14 = nexttowardf(1.0, 0.0);
    v15 = 0.0;
    v16 = fmaxf(fminf(v14, 0.0), 0.0);
    if (v16 > 0.0)
      v15 = INFINITY;
    v4[1] = v16;
    *((_BYTE *)v4 + 8) = 0;
    *((_BYTE *)v4 + 16) = 0;
    v4[5] = v15;
    v4[6] = v15;
    v4[7] = 0.0;
    v17 = *v4;
    v4[8] = *v4;
    v4[9] = v17;
LABEL_12:
    v13 = 1;
    v7 = 1;
    return (float *)(v13 | (v7 << 8));
  }
  __break(1u);
  return result;
}

uint64_t *LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::update(float)::{lambda(float &)#1}::operator()<std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>>(uint64_t *result, uint64_t *a2)
{
  float *v2;
  uint64_t v4;
  uint64_t v5;
  float v6;
  __int16 v7;
  int v8;
  float v9;
  uint64_t v10;

  v2 = (float *)result[1];
  if (*v2 < 0.0)
  {
    __break(1u);
  }
  else
  {
    v4 = *result;
    v5 = *a2;
    v6 = *v2 + *(float *)(*a2 + 28);
    *(float *)(*a2 + 28) = v6;
    if (v6 >= 0.0)
    {
      *(_DWORD *)(v5 + 28) = 0;
      v9 = fmax((float)(*v2 - v6), 0.0);
      LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::_update((float *)v4, v9);
      v10 = *a2;
      *a2 = 0;
      if (*(_DWORD *)(v4 + 48))
        std::variant<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>::operator=[abi:ne180100]<std::monostate,0,std::monostate,0ul,0>(v4 + 40);
      LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::set_target<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>(v4, v10, 6);
      MEMORY[0x20BD1B2E8](v10, 0x1000C4099C38B47);
      v7 = LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::update(v4, v6);
      v8 = HIBYTE(v7);
    }
    else
    {
      LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::_update((float *)v4, *v2);
      LOBYTE(v7) = 0;
      v8 = 0;
    }
    return (uint64_t *)(v7 | (v8 << 8));
  }
  return result;
}

void sub_209E24EEC(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (v1)
    MEMORY[0x20BD1B2E8](v1, 0x1000C4099C38B47);
  _Unwind_Resume(exception_object);
}

uint64_t *LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::update(float)::{lambda(float &)#1}::operator()<std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>(uint64_t *result, uint64_t *a2)
{
  float *v2;
  uint64_t v4;
  uint64_t v5;
  float v6;
  __int16 v7;
  int v8;
  float v9;
  uint64_t v10;

  v2 = (float *)result[1];
  if (*v2 < 0.0)
  {
    __break(1u);
  }
  else
  {
    v4 = *result;
    v5 = *a2;
    v6 = *v2 + *(float *)(*a2 + 24);
    *(float *)(*a2 + 24) = v6;
    if (v6 >= 0.0)
    {
      *(_DWORD *)(v5 + 24) = 0;
      v9 = fmax((float)(*v2 - v6), 0.0);
      LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::_update((float *)v4, v9);
      v10 = *a2;
      *a2 = 0;
      if (*(_DWORD *)(v4 + 48))
        std::variant<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>::operator=[abi:ne180100]<std::monostate,0,std::monostate,0ul,0>(v4 + 40);
      LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::set_timing(v4, v10, 6);
      MEMORY[0x20BD1B2E8](v10, 0x1000C40CBDA3C1BLL);
      v7 = LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::update(v4, v6);
      v8 = HIBYTE(v7);
    }
    else
    {
      LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::_update((float *)v4, *v2);
      LOBYTE(v7) = 0;
      v8 = 0;
    }
    return (uint64_t *)(v7 | (v8 << 8));
  }
  return result;
}

uint64_t std::__variant_detail::__assignment<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>>::__assign_alt[abi:ne180100]<1ul,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>>(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t result;

  if (*(_DWORD *)(a1 + 8) != 1)
    return std::__variant_detail::__assignment<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>>::__emplace[abi:ne180100]<1ul,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>>(a1, a3);
  v3 = *a3;
  *a3 = 0;
  result = *a2;
  *a2 = v3;
  if (result)
    JUMPOUT(0x20BD1B2E8);
  return result;
}

uint64_t std::__variant_detail::__assignment<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>>::__emplace[abi:ne180100]<1ul,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>>(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  char v7;

  v4 = *(unsigned int *)(a1 + 8);
  if ((_DWORD)v4 != -1)
    ((void (*)(char *, uint64_t))*(&off_24C27EED0 + v4))(&v7, a1);
  v5 = *a2;
  *a2 = 0;
  *(_QWORD *)a1 = v5;
  *(_DWORD *)(a1 + 8) = 1;
  return a1;
}

BOOL LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)1>::set_target<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>(uint64_t a1, uint64_t a2, int a3)
{
  float v6;
  _OWORD *v7;
  float v8;
  float v9;
  _OWORD *v10;
  __int128 v11;
  uint64_t v12;
  float v13;
  _BYTE v15[28];

  if (*(_DWORD *)(a1 + 48))
    std::variant<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>::operator=[abi:ne180100]<std::monostate,0,std::monostate,0ul,0>(a1 + 40);
  v6 = *(float *)a1;
  v7 = (_OWORD *)(a2 + 4);
  v8 = *(float *)a2;
  if (*(float *)a1 == *(float *)a2)
  {
    LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)1>::set_timing(a1, (uint64_t)v7, a3);
  }
  else
  {
    v9 = *(float *)(a2 + 28);
    if (v9 >= 0.0)
    {
      *(_OWORD *)v15 = *v7;
      *(_QWORD *)&v15[16] = *(_QWORD *)(a2 + 20);
      *(_DWORD *)&v15[24] = 0;
      LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)1>::_set_timing(a1, (__int128 *)v15);
      v13 = *(float *)a2;
      *(_DWORD *)a1 = *(_DWORD *)a2;
      *(_OWORD *)(a1 + 16) = *(_OWORD *)&v15[12];
      *(_OWORD *)(a1 + 4) = *(_OWORD *)v15;
      if (*(float *)(a1 + 20) <= 0.0)
      {
        *(float *)(a1 + 32) = v13;
        *(float *)(a1 + 36) = v13;
      }
      else if (v9 > 0.0)
      {
        LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)1>::update(a1, v9);
      }
    }
    else
    {
      v10 = (_OWORD *)operator new();
      v11 = *(_OWORD *)(a2 + 16);
      *v10 = *(_OWORD *)a2;
      v10[1] = v11;
      *(_QWORD *)v15 = v10;
      std::__variant_detail::__assignment<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>>::__assign_alt[abi:ne180100]<1ul,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>>(a1 + 40, (uint64_t *)(a1 + 40), (uint64_t *)v15);
      v12 = *(_QWORD *)v15;
      *(_QWORD *)v15 = 0;
      if (v12)
        MEMORY[0x20BD1B2E8](v12, 0x1000C4099C38B47);
    }
  }
  return v6 != v8;
}

void LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)1>::set_timing(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  _OWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;

  if (*(_DWORD *)(a1 + 48))
    std::variant<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>::operator=[abi:ne180100]<std::monostate,0,std::monostate,0ul,0>(a1 + 40);
  if (a3)
  {
    v17 = a1;
    v6 = *(unsigned int *)(a1 + 48);
    if ((_DWORD)v6 == -1)
      std::__throw_bad_variant_access[abi:ne180100]();
    v18 = &v17;
    if (((unsigned int (*)(uint64_t **, uint64_t))*(&off_24C27EF30 + v6))(&v18, a1 + 40))
    {
      v7 = *(float *)(a1 + 28);
      v8 = *(float *)(a1 + 20) - v7;
      v9 = *(float *)(a1 + 24) - v7;
      v10 = *(float *)(a2 + 24);
      v11 = *(float *)(a2 + 16) - v10;
      v12 = *(float *)(a2 + 20) - v10;
      if ((a3 & 2) != 0 && (v11 < v8 || v12 < v9))
        goto LABEL_16;
      if ((a3 & 4) != 0 && (v11 > v8 || v12 > v9))
      {
LABEL_16:
        if (v10 >= 0.0)
        {
          LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)1>::_set_timing(a1, (__int128 *)a2);
        }
        else if ((float)(v8 + v10) > 0.0)
        {
          v15 = (_OWORD *)operator new();
          *v15 = *(_OWORD *)a2;
          *(_OWORD *)((char *)v15 + 12) = *(_OWORD *)(a2 + 12);
          v18 = (uint64_t *)v15;
          std::__variant_detail::__assignment<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>>::__assign_alt[abi:ne180100]<2ul,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>(a1 + 40, (uint64_t *)(a1 + 40), (uint64_t *)&v18);
          v16 = (uint64_t)v18;
          v18 = 0;
          if (v16)
            MEMORY[0x20BD1B2E8](v16, 0x1000C40CBDA3C1BLL);
        }
      }
    }
  }
}

void LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)1>::_set_timing(uint64_t a1, __int128 *a2)
{
  float v2;
  float v5;
  uint64_t v6;
  float v7;
  unsigned int v8;
  BOOL v9;
  float v11;
  float v12;
  float v13;
  _BOOL4 v14;
  _BOOL4 v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  __int128 v24;
  float v25;

  v2 = *((float *)a2 + 6);
  if (v2 < 0.0)
  {
    __break(1u);
    return;
  }
  v5 = *((float *)a2 + 4);
  v6 = a1 + 4;
  if (*(float *)(a1 + 20) > 0.0 && v5 > 0.0 && *(float *)v6 != *(float *)a2)
  {
    v7 = (float)(*(float *)a2 * (float)(1.0 - *(float *)v6)) / (float)(*(float *)v6 * (float)(1.0 - *(float *)a2));
    v8 = (COERCE_INT(fabs(v7)) - 0x800000) >> 24;
    v9 = v7 < 0.0 || v8 > 0x7E;
    if (!v9 || (LODWORD(v7) - 1) <= 0x7FFFFE)
    {
      v11 = *(float *)(a1 + 32);
      v12 = *(float *)a1;
      if (v11 == *(float *)a1)
      {
LABEL_45:
        *(float *)(a1 + 32) = v11;
        goto LABEL_46;
      }
      v13 = 1.0 - v7;
      v14 = v11 < 0.0;
      if (v12 <= 0.0)
        v14 = 0;
      if (v12 < 0.0 && v11 > 0.0 || v14)
      {
        v11 = (float)(v13 * v12) + (float)((float)(1.0 - v13) * v11);
        goto LABEL_45;
      }
      if (v11 == 0.0)
      {
        if (v13 <= 0.0)
          goto LABEL_45;
      }
      else if (v13 == 0.0)
      {
        goto LABEL_45;
      }
      if (v12 == 0.0)
      {
        if (v13 < 1.0)
        {
LABEL_29:
          v17 = v12 < 0.0 || v11 < 0.0;
          v18 = fabsf(v11);
          v19 = fabsf(v12);
          if (!v17)
          {
            v18 = *(float *)(a1 + 32);
            v19 = *(float *)a1;
          }
          if (v11 == 0.0)
            v20 = 1.1755e-38;
          else
            v20 = v18;
          if (v12 == 0.0)
            v21 = 1.1755e-38;
          else
            v21 = v19;
          v22 = powf(v20, 1.0 - v13);
          v23 = v22 * powf(v21, v13);
          v11 = -v23;
          if (!v17)
            v11 = v23;
          goto LABEL_45;
        }
      }
      else if (v13 != 1.0)
      {
        goto LABEL_29;
      }
      v11 = *(float *)a1;
      goto LABEL_45;
    }
  }
LABEL_46:
  v24 = *a2;
  *(_OWORD *)(v6 + 12) = *(__int128 *)((char *)a2 + 12);
  *(_OWORD *)v6 = v24;
  if (v2 <= 0.0)
  {
    if (v5 > 0.0)
      return;
  }
  else
  {
    *(_DWORD *)(a1 + 28) = 0;
    if (v5 > 0.0)
    {
      LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)1>::update(a1, v2);
      return;
    }
  }
  v25 = *(float *)a1;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)a1;
  *(float *)(a1 + 36) = v25;
}

uint64_t LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)1>::update(uint64_t a1, float a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  __int16 v7;
  int v8;
  _QWORD v10[2];
  float v11;
  _QWORD *v12;

  v11 = a2;
  v12 = (_QWORD *)a1;
  v2 = *(unsigned int *)(a1 + 48);
  if ((_DWORD)v2 == -1)
    std::__throw_bad_variant_access[abi:ne180100]();
  v5 = a1 + 40;
  v10[0] = &v12;
  if (((unsigned int (*)(_QWORD *, uint64_t))*(&off_24C27EF30 + v2))(v10, a1 + 40))
  {
    if (a2 == 0.0)
    {
      LOBYTE(v7) = 0;
      v8 = 0;
    }
    else
    {
      v10[0] = a1;
      v10[1] = &v11;
      v6 = *(unsigned int *)(a1 + 48);
      if ((_DWORD)v6 == -1)
        std::__throw_bad_variant_access[abi:ne180100]();
      v12 = v10;
      v7 = ((uint64_t (*)(_QWORD **, uint64_t))*(&off_24C27EF48 + v6))(&v12, v5);
      v8 = HIBYTE(v7);
    }
  }
  else
  {
    LOBYTE(v7) = 1;
    v8 = 1;
  }
  return v7 | (v8 << 8);
}

BOOL _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm0EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZNK36LAUI_uniform_cubic_b_spline_renderer10animator_tIfLNS8_27animator_interpolation_typeE1EE12is_animatingEvEUlOT_E_EEJRKNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tIfEENS_14default_deleteISM_EEEENSK_INS8_18animation_timing_tENSN_ISQ_EEEEEEEEEEDcSC_DpT0_(uint64_t a1)
{
  return *(float *)(**(_QWORD **)a1 + 20) > 0.0;
}

uint64_t _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm1EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZNK36LAUI_uniform_cubic_b_spline_renderer10animator_tIfLNS8_27animator_interpolation_typeE1EE12is_animatingEvEUlOT_E_EEJRKNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tIfEENS_14default_deleteISM_EEEENSK_INS8_18animation_timing_tENSN_ISQ_EEEEEEEEEEDcSC_DpT0_()
{
  return 1;
}

uint64_t _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm2EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZNK36LAUI_uniform_cubic_b_spline_renderer10animator_tIfLNS8_27animator_interpolation_typeE1EE12is_animatingEvEUlOT_E_EEJRKNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tIfEENS_14default_deleteISM_EEEENSK_INS8_18animation_timing_tENSN_ISQ_EEEEEEEEEEDcSC_DpT0_()
{
  return 1;
}

float *_ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm0EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIfLNS8_27animator_interpolation_typeE1EE6updateEfEUlRT_E_EEJRNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tIfEENS_14default_deleteISM_EEEENSK_INS8_18animation_timing_tENSN_ISQ_EEEEEEEEEEDcSC_DpT0_(float ***a1)
{
  return LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)1>::_update(**a1, *(*a1)[1]);
}

uint64_t *_ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm1EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIfLNS8_27animator_interpolation_typeE1EE6updateEfEUlRT_E_EEJRNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tIfEENS_14default_deleteISM_EEEENSK_INS8_18animation_timing_tENSN_ISQ_EEEEEEEEEEDcSC_DpT0_(uint64_t **a1, uint64_t *a2)
{
  return LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)1>::update(float)::{lambda(float &)#1}::operator()<std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>>(*a1, a2);
}

uint64_t *_ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm2EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIfLNS8_27animator_interpolation_typeE1EE6updateEfEUlRT_E_EEJRNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tIfEENS_14default_deleteISM_EEEENSK_INS8_18animation_timing_tENSN_ISQ_EEEEEEEEEEDcSC_DpT0_(uint64_t **a1, uint64_t *a2)
{
  return LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)1>::update(float)::{lambda(float &)#1}::operator()<std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>(*a1, a2);
}

float *LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)1>::_update(float *result, float a2)
{
  float v3;
  float *v4;
  float v5;
  float v6;
  float v7;
  float v8;
  _BOOL4 v9;
  float v12;
  float v13;
  float v14;
  float v15;
  _BOOL4 v16;
  int v17;
  _BOOL4 v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  _BOOL4 v24;
  _BOOL4 v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;

  v3 = result[5];
  if (v3 <= 0.0)
    goto LABEL_18;
  if (a2 >= 0.0)
  {
    v4 = result;
    v5 = result[7] + a2;
    result[7] = v5;
    if (v5 < v3)
    {
      v6 = fmax((float)(1.0 - powf(result[1], a2)), 0.0);
      v7 = v4[8];
      v8 = *v4;
      if (v7 == *v4)
        goto LABEL_40;
      v9 = v7 < 0.0;
      if (v8 <= 0.0)
        v9 = 0;
      if (v8 < 0.0 && v7 > 0.0 || v9)
      {
        v7 = (float)(v8 * v6) + (float)((float)(1.0 - v6) * v7);
        goto LABEL_40;
      }
      if (v7 == 0.0)
      {
        if (v6 <= 0.0)
          goto LABEL_40;
      }
      else if (v6 == 0.0)
      {
        goto LABEL_40;
      }
      if (v8 == 0.0)
      {
        if (v6 < 1.0)
        {
LABEL_25:
          v18 = v8 < 0.0 || v7 < 0.0;
          v19 = fabsf(v7);
          v20 = fabsf(v8);
          if (!v18)
          {
            v19 = v4[8];
            v20 = *v4;
          }
          if (v7 == 0.0)
            v19 = 1.1755e-38;
          if (v8 == 0.0)
            v21 = 1.1755e-38;
          else
            v21 = v20;
          v22 = powf(v19, 1.0 - v6);
          v7 = v22 * powf(v21, v6);
          if (v18)
            v7 = -v7;
LABEL_40:
          v4[8] = v7;
          v23 = v4[9];
          if (v23 == v7)
          {
LABEL_73:
            v17 = 0;
            v4[9] = v23;
            v16 = v5 >= v4[6];
            return (float *)(v16 | (v17 << 8));
          }
          v24 = v7 > 0.0;
          if (v23 >= 0.0)
            v24 = 0;
          if (v23 > 0.0 && v7 < 0.0 || v24)
          {
            v23 = (float)(v7 * v6) + (float)((float)(1.0 - v6) * v23);
            goto LABEL_73;
          }
          if (v23 == 0.0)
          {
            if (v6 <= 0.0)
              goto LABEL_73;
          }
          else if (v6 == 0.0)
          {
            goto LABEL_73;
          }
          if (v7 == 0.0)
          {
            if (v6 < 1.0)
            {
LABEL_57:
              v27 = v23 < 0.0 || v7 < 0.0;
              v28 = fabsf(v23);
              v29 = fabsf(v7);
              if (!v27)
              {
                v28 = v4[9];
                v29 = v7;
              }
              if (v23 == 0.0)
                v30 = 1.1755e-38;
              else
                v30 = v28;
              if (v7 == 0.0)
                v31 = 1.1755e-38;
              else
                v31 = v29;
              v32 = powf(v30, 1.0 - v6);
              v33 = v32 * powf(v31, v6);
              v23 = -v33;
              if (!v27)
                v23 = v33;
              goto LABEL_73;
            }
          }
          else if (v6 != 1.0)
          {
            goto LABEL_57;
          }
          v23 = v7;
          goto LABEL_73;
        }
      }
      else if (v6 != 1.0)
      {
        goto LABEL_25;
      }
      v7 = *v4;
      goto LABEL_40;
    }
    v12 = nexttowardf(1.0, 0.0);
    v13 = 0.0;
    v14 = fmaxf(fminf(v12, 0.0), 0.0);
    if (v14 > 0.0)
      v13 = INFINITY;
    v4[1] = v14;
    *((_BYTE *)v4 + 8) = 0;
    *((_BYTE *)v4 + 16) = 0;
    v4[5] = v13;
    v4[6] = v13;
    v4[7] = 0.0;
    v15 = *v4;
    v4[8] = *v4;
    v4[9] = v15;
LABEL_18:
    v16 = 1;
    v17 = 1;
    return (float *)(v16 | (v17 << 8));
  }
  __break(1u);
  return result;
}

uint64_t *LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)1>::update(float)::{lambda(float &)#1}::operator()<std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>>(uint64_t *result, uint64_t *a2)
{
  float *v2;
  uint64_t v4;
  uint64_t v5;
  float v6;
  __int16 v7;
  int v8;
  float v9;
  uint64_t v10;

  v2 = (float *)result[1];
  if (*v2 < 0.0)
  {
    __break(1u);
  }
  else
  {
    v4 = *result;
    v5 = *a2;
    v6 = *v2 + *(float *)(*a2 + 28);
    *(float *)(*a2 + 28) = v6;
    if (v6 >= 0.0)
    {
      *(_DWORD *)(v5 + 28) = 0;
      v9 = fmax((float)(*v2 - v6), 0.0);
      LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)1>::_update((float *)v4, v9);
      v10 = *a2;
      *a2 = 0;
      if (*(_DWORD *)(v4 + 48))
        std::variant<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>::operator=[abi:ne180100]<std::monostate,0,std::monostate,0ul,0>(v4 + 40);
      LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)1>::set_target<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>(v4, v10, 6);
      MEMORY[0x20BD1B2E8](v10, 0x1000C4099C38B47);
      v7 = LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)1>::update(v4, v6);
      v8 = HIBYTE(v7);
    }
    else
    {
      LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)1>::_update((float *)v4, *v2);
      LOBYTE(v7) = 0;
      v8 = 0;
    }
    return (uint64_t *)(v7 | (v8 << 8));
  }
  return result;
}

void sub_209E25A64(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (v1)
    MEMORY[0x20BD1B2E8](v1, 0x1000C4099C38B47);
  _Unwind_Resume(exception_object);
}

uint64_t *LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)1>::update(float)::{lambda(float &)#1}::operator()<std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>(uint64_t *result, uint64_t *a2)
{
  float *v2;
  uint64_t v4;
  uint64_t v5;
  float v6;
  __int16 v7;
  int v8;
  float v9;
  uint64_t v10;

  v2 = (float *)result[1];
  if (*v2 < 0.0)
  {
    __break(1u);
  }
  else
  {
    v4 = *result;
    v5 = *a2;
    v6 = *v2 + *(float *)(*a2 + 24);
    *(float *)(*a2 + 24) = v6;
    if (v6 >= 0.0)
    {
      *(_DWORD *)(v5 + 24) = 0;
      v9 = fmax((float)(*v2 - v6), 0.0);
      LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)1>::_update((float *)v4, v9);
      v10 = *a2;
      *a2 = 0;
      if (*(_DWORD *)(v4 + 48))
        std::variant<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>::operator=[abi:ne180100]<std::monostate,0,std::monostate,0ul,0>(v4 + 40);
      LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)1>::set_timing(v4, v10, 6);
      MEMORY[0x20BD1B2E8](v10, 0x1000C40CBDA3C1BLL);
      v7 = LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)1>::update(v4, v6);
      v8 = HIBYTE(v7);
    }
    else
    {
      LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)1>::_update((float *)v4, *v2);
      LOBYTE(v7) = 0;
      v8 = 0;
    }
    return (uint64_t *)(v7 | (v8 << 8));
  }
  return result;
}

BOOL _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_dLNS_27animator_interpolation_typeE0EE10set_targetINS_18animation_target_tIS1_EEEEbOT_NS_25animation_target_option_tE(uint64_t a1, uint64_t a2, int a3)
{
  float64x2_t v6;
  float64x2_t v7;
  double v8;
  double v9;
  _OWORD *v10;
  float v11;
  _OWORD *v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  float64x2_t v16;
  __int128 v17;
  _BYTE v19[28];

  if (*(_DWORD *)(a1 + 136))
    _ZNSt3__17variantIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_dEENS_14default_deleteIS6_EEEENS2_INS3_18animation_timing_tENS7_ISA_EEEEEEaSB8ne180100IS1_Li0ES1_Lm0ELi0EEERSD_OT_(a1 + 128);
  v6 = *(float64x2_t *)a2;
  v7 = *(float64x2_t *)(a2 + 16);
  v8 = vmulq_f64(*(float64x2_t *)(a1 + 16), v7).f64[0];
  v9 = v8 + vaddvq_f64(vmulq_f64(*(float64x2_t *)a1, *(float64x2_t *)a2));
  v10 = (_OWORD *)(a2 + 32);
  if (v9 == 1.0)
  {
    _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_dLNS_27animator_interpolation_typeE0EE10set_timingERKNS_18animation_timing_tENS_25animation_target_option_tE(a1, (uint64_t)v10, a3);
  }
  else
  {
    v11 = *(float *)(a2 + 56);
    if (v11 >= 0.0)
    {
      *(_OWORD *)v19 = *v10;
      *(_QWORD *)&v19[16] = *(_QWORD *)(a2 + 48);
      *(_DWORD *)&v19[24] = 0;
      _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_dLNS_27animator_interpolation_typeE0EE11_set_timingERKNS_18animation_timing_tE(a1, (__int128 *)v19, *(double *)v19, v8, v6, v7);
      v16 = *(float64x2_t *)a2;
      v17 = *(_OWORD *)(a2 + 16);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)(a1 + 16) = v17;
      *(_OWORD *)(a1 + 44) = *(_OWORD *)&v19[12];
      *(_OWORD *)(a1 + 32) = *(_OWORD *)v19;
      if (*(float *)(a1 + 48) <= 0.0)
      {
        *(float64x2_t *)(a1 + 64) = v16;
        *(_OWORD *)(a1 + 80) = v17;
        *(float64x2_t *)(a1 + 96) = v16;
        *(_OWORD *)(a1 + 112) = v17;
      }
      else if (v11 > 0.0)
      {
        _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_dLNS_27animator_interpolation_typeE0EE6updateEf(a1, v11);
      }
    }
    else
    {
      v12 = (_OWORD *)operator new();
      v13 = *(_OWORD *)(a2 + 16);
      *v12 = *(_OWORD *)a2;
      v12[1] = v13;
      v14 = *(_OWORD *)(a2 + 48);
      v12[2] = *(_OWORD *)(a2 + 32);
      v12[3] = v14;
      *(_QWORD *)v19 = v12;
      _ZNSt3__116__variant_detail12__assignmentINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_dEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEEE12__assign_altB8ne180100ILm1ESB_SB_EEvRNS0_5__altIXT_ET0_EEOT1_(a1 + 128, (uint64_t *)(a1 + 128), (uint64_t *)v19);
      v15 = *(_QWORD *)v19;
      *(_QWORD *)v19 = 0;
      if (v15)
        MEMORY[0x20BD1B2E8](v15, 0x1000C4001F72B7BLL);
    }
  }
  return v9 != 1.0;
}

uint64_t _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_dLNS_27animator_interpolation_typeE0EE10set_timingERKNS_18animation_timing_tENS_25animation_target_option_tE(uint64_t result, uint64_t a2, int a3)
{
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  float64x2_t v9;
  float64x2_t v10;
  float v11;
  float v12;
  _OWORD *v15;
  uint64_t v16;
  uint64_t *v17;

  v5 = result;
  if (*(_DWORD *)(result + 136))
    result = _ZNSt3__17variantIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_dEENS_14default_deleteIS6_EEEENS2_INS3_18animation_timing_tENS7_ISA_EEEEEEaSB8ne180100IS1_Li0ES1_Lm0ELi0EEERSD_OT_(result + 128);
  if (a3)
  {
    v16 = v5;
    v6 = *(unsigned int *)(v5 + 136);
    if ((_DWORD)v6 == -1)
      std::__throw_bad_variant_access[abi:ne180100]();
    v17 = &v16;
    result = ((uint64_t (*)(uint64_t **, uint64_t))*(&off_24C27EF60 + v6))(&v17, v5 + 128);
    if ((_DWORD)result)
    {
      v11 = *(float *)(v5 + 56);
      *(float *)&v7 = *(float *)(v5 + 48) - v11;
      *(float *)v9.f64 = *(float *)(v5 + 52) - v11;
      LODWORD(v8) = *(_DWORD *)(a2 + 24);
      v12 = *(float *)(a2 + 16) - *(float *)&v8;
      *(float *)v10.f64 = *(float *)(a2 + 20) - *(float *)&v8;
      if ((a3 & 2) != 0 && (v12 < *(float *)&v7 || *(float *)v10.f64 < *(float *)v9.f64))
        goto LABEL_16;
      if ((a3 & 4) != 0 && (v12 > *(float *)&v7 || *(float *)v10.f64 > *(float *)v9.f64))
      {
LABEL_16:
        if (*(float *)&v8 >= 0.0)
        {
          return _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_dLNS_27animator_interpolation_typeE0EE11_set_timingERKNS_18animation_timing_tE(v5, (__int128 *)a2, v7, v8, v9, v10);
        }
        else if ((float)(*(float *)&v7 + *(float *)&v8) > 0.0)
        {
          v15 = (_OWORD *)operator new();
          *v15 = *(_OWORD *)a2;
          *(_OWORD *)((char *)v15 + 12) = *(_OWORD *)(a2 + 12);
          v17 = (uint64_t *)v15;
          _ZNSt3__116__variant_detail12__assignmentINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_dEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEEE12__assign_altB8ne180100ILm2ESE_SE_EEvRNS0_5__altIXT_ET0_EEOT1_(v5 + 128, (uint64_t *)(v5 + 128), (uint64_t *)&v17);
          result = (uint64_t)v17;
          v17 = 0;
          if (result)
            return MEMORY[0x20BD1B2E8](result, 0x1000C40CBDA3C1BLL);
        }
      }
    }
  }
  return result;
}

uint64_t _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_dLNS_27animator_interpolation_typeE0EE11_set_timingERKNS_18animation_timing_tE(uint64_t result, __int128 *a2, double a3, double a4, float64x2_t a5, float64x2_t a6)
{
  float v6;
  float v7;
  float *v8;
  unsigned int v9;
  BOOL v10;
  float64x2_t v12;
  float64x2_t v13;
  float64x2_t v14;
  double v15;
  float64x2_t v16;
  int8x16_t v17;
  int8x16_t v18;
  double v19;
  __int128 v20;
  float64x2_t v21;
  __int128 v22;

  v6 = *((float *)a2 + 6);
  if (v6 < 0.0)
  {
    __break(1u);
    return result;
  }
  v7 = *((float *)a2 + 4);
  v8 = (float *)(result + 32);
  if (*(float *)(result + 48) > 0.0 && v7 > 0.0 && *v8 != *(float *)a2)
  {
    *(float *)a6.f64 = (float)(*(float *)a2 * (float)(1.0 - *v8)) / (float)(*v8 * (float)(1.0 - *(float *)a2));
    v9 = (COERCE_INT(fabs(*(float *)a6.f64)) - 0x800000) >> 24;
    v10 = SLODWORD(a6.f64[0]) < 0 || v9 > 0x7E;
    if (!v10 || (LODWORD(a6.f64[0]) - 1) <= 0x7FFFFE)
    {
      v12 = *(float64x2_t *)(result + 64);
      v13 = *(float64x2_t *)(result + 80);
      v14 = *(float64x2_t *)(result + 16);
      v15 = vmulq_f64(v13, v14).f64[0] + vaddvq_f64(vmulq_f64(v12, *(float64x2_t *)result));
      *(float *)a6.f64 = 1.0 - *(float *)a6.f64;
      a5.f64[0] = (float)(1.0 - *(float *)a6.f64);
      a6.f64[0] = *(float *)a6.f64;
      v16 = vmulq_n_f64(*(float64x2_t *)result, a6.f64[0]);
      *(_QWORD *)&a6.f64[0] = *(_OWORD *)&vmlaq_f64(vmulq_f64(a6, v14), v13, a5);
      v17 = (int8x16_t)vmlaq_n_f64(v16, v12, a5.f64[0]);
      v18 = vextq_s8(v17, v17, 8uLL);
      *(_QWORD *)&v19 = vextq_s8((int8x16_t)v12, (int8x16_t)v12, 8uLL).u64[0];
      if (v15 == 1.0)
        *(double *)v18.i64 = v19;
      else
        v12.f64[0] = *(double *)v17.i64;
      *(_QWORD *)&v12.f64[1] = v18.i64[0];
      if (v15 == 1.0)
        v18.i64[0] = *(_QWORD *)(result + 80);
      else
        *(double *)v18.i64 = a6.f64[0];
      *(float64x2_t *)(result + 64) = v12;
      *(int8x16_t *)(result + 80) = v18;
    }
  }
  v20 = *a2;
  *(_OWORD *)(result + 44) = *(__int128 *)((char *)a2 + 12);
  *(_OWORD *)v8 = v20;
  if (v6 <= 0.0)
  {
    if (v7 > 0.0)
      return result;
  }
  else
  {
    *(_DWORD *)(result + 56) = 0;
    if (v7 > 0.0)
      return _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_dLNS_27animator_interpolation_typeE0EE6updateEf(result, v6);
  }
  v21 = *(float64x2_t *)result;
  v22 = *(_OWORD *)(result + 16);
  *(_OWORD *)(result + 64) = *(_OWORD *)result;
  *(_OWORD *)(result + 80) = v22;
  *(float64x2_t *)(result + 96) = v21;
  *(_OWORD *)(result + 112) = v22;
  return result;
}

uint64_t _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_dLNS_27animator_interpolation_typeE0EE6updateEf(uint64_t a1, float a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  __int16 v7;
  int v8;
  _QWORD v10[2];
  float v11;
  _QWORD *v12;

  v11 = a2;
  v12 = (_QWORD *)a1;
  v2 = *(unsigned int *)(a1 + 136);
  if ((_DWORD)v2 == -1)
    std::__throw_bad_variant_access[abi:ne180100]();
  v5 = a1 + 128;
  v10[0] = &v12;
  if (((unsigned int (*)(_QWORD *, uint64_t))*(&off_24C27EF60 + v2))(v10, a1 + 128))
  {
    if (a2 == 0.0)
    {
      LOBYTE(v7) = 0;
      v8 = 0;
    }
    else
    {
      v10[0] = a1;
      v10[1] = &v11;
      v6 = *(unsigned int *)(a1 + 136);
      if ((_DWORD)v6 == -1)
        std::__throw_bad_variant_access[abi:ne180100]();
      v12 = v10;
      v7 = ((uint64_t (*)(_QWORD **, uint64_t))*(&off_24C27EF78 + v6))(&v12, v5);
      v8 = HIBYTE(v7);
    }
  }
  else
  {
    LOBYTE(v7) = 1;
    v8 = 1;
  }
  return v7 | (v8 << 8);
}

uint64_t _ZNSt3__17variantIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_dEENS_14default_deleteIS6_EEEENS2_INS3_18animation_timing_tENS7_ISA_EEEEEEaSB8ne180100IS1_Li0ES1_Lm0ELi0EEERSD_OT_(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 8))
    _ZNSt3__116__variant_detail12__assignmentINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_dEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEEE9__emplaceB8ne180100ILm0EJS3_EEERDaDpOT0_(a1);
  return a1;
}

uint64_t _ZNSt3__116__variant_detail12__assignmentINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_dEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEEE9__emplaceB8ne180100ILm0EJS3_EEERDaDpOT0_(uint64_t a1)
{
  uint64_t v2;
  char v4;

  v2 = *(unsigned int *)(a1 + 8);
  if ((_DWORD)v2 != -1)
    ((void (*)(char *, uint64_t))*(&off_24C27EEE8 + v2))(&v4, a1);
  *(_DWORD *)(a1 + 8) = 0;
  return a1;
}

BOOL _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm0EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZNK36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_dLNS8_27animator_interpolation_typeE0EE12is_animatingEvEUlOT_E_EEJRKNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tISA_EENS_14default_deleteISN_EEEENSL_INS8_18animation_timing_tENSO_ISR_EEEEEEEEEEDcSD_DpT0_(uint64_t a1)
{
  return *(float *)(**(_QWORD **)a1 + 48) > 0.0;
}

uint64_t _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm1EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZNK36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_dLNS8_27animator_interpolation_typeE0EE12is_animatingEvEUlOT_E_EEJRKNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tISA_EENS_14default_deleteISN_EEEENSL_INS8_18animation_timing_tENSO_ISR_EEEEEEEEEEDcSD_DpT0_()
{
  return 1;
}

uint64_t _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm2EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZNK36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_dLNS8_27animator_interpolation_typeE0EE12is_animatingEvEUlOT_E_EEJRKNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tISA_EENS_14default_deleteISN_EEEENSL_INS8_18animation_timing_tENSO_ISR_EEEEEEEEEEDcSD_DpT0_()
{
  return 1;
}

uint64_t _ZNSt3__116__variant_detail12__assignmentINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_dEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEEE12__assign_altB8ne180100ILm2ESE_SE_EEvRNS0_5__altIXT_ET0_EEOT1_(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t result;

  if (*(_DWORD *)(a1 + 8) != 2)
    return _ZNSt3__116__variant_detail12__assignmentINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_dEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEEE9__emplaceB8ne180100ILm2EJSE_EEERDaDpOT0_(a1, a3);
  v3 = *a3;
  *a3 = 0;
  result = *a2;
  *a2 = v3;
  if (result)
    JUMPOUT(0x20BD1B2E8);
  return result;
}

uint64_t _ZNSt3__116__variant_detail12__assignmentINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_dEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEEE9__emplaceB8ne180100ILm2EJSE_EEERDaDpOT0_(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  char v7;

  v4 = *(unsigned int *)(a1 + 8);
  if ((_DWORD)v4 != -1)
    ((void (*)(char *, uint64_t))*(&off_24C27EEE8 + v4))(&v7, a1);
  v5 = *a2;
  *a2 = 0;
  *(_QWORD *)a1 = v5;
  *(_DWORD *)(a1 + 8) = 2;
  return a1;
}

float *_ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm0EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_dLNS8_27animator_interpolation_typeE0EE6updateEfEUlRT_E_EEJRNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tISA_EENS_14default_deleteISN_EEEENSL_INS8_18animation_timing_tENSO_ISR_EEEEEEEEEEDcSD_DpT0_(float ***a1)
{
  return _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_dLNS_27animator_interpolation_typeE0EE7_updateEf(**a1, *(*a1)[1]);
}

uint64_t *_ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm1EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_dLNS8_27animator_interpolation_typeE0EE6updateEfEUlRT_E_EEJRNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tISA_EENS_14default_deleteISN_EEEENSL_INS8_18animation_timing_tENSO_ISR_EEEEEEEEEEDcSD_DpT0_(uint64_t **a1, uint64_t *a2)
{
  return _ZZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_dLNS_27animator_interpolation_typeE0EE6updateEfENKUlRT_E_clINSt3__110unique_ptrINS_18animation_target_tIS1_EENS8_14default_deleteISB_EEEEEENS_15animator_statusES5_(*a1, a2);
}

uint64_t *_ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm2EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_dLNS8_27animator_interpolation_typeE0EE6updateEfEUlRT_E_EEJRNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tISA_EENS_14default_deleteISN_EEEENSL_INS8_18animation_timing_tENSO_ISR_EEEEEEEEEEDcSD_DpT0_(uint64_t **a1, uint64_t *a2)
{
  return _ZZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_dLNS_27animator_interpolation_typeE0EE6updateEfENKUlRT_E_clINSt3__110unique_ptrINS_18animation_timing_tENS8_14default_deleteISA_EEEEEENS_15animator_statusES5_(*a1, a2);
}

float *_ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_dLNS_27animator_interpolation_typeE0EE7_updateEf(float *result, float a2)
{
  float v3;
  float *v4;
  float v5;
  int v6;
  float64x2_t v7;
  float64x2_t v8;
  float64x2_t v9;
  BOOL v10;
  float64x2_t v11;
  float64x2_t v12;
  double v13;
  int8x16_t v14;
  unint64_t v15;
  unint64_t v16;
  float64_t v17;
  float64x2_t v18;
  float64x2_t v19;
  float64x2_t v20;
  double v21;
  float64x2_t v22;
  float64x2_t v23;
  int8x16_t v24;
  unint64_t v25;
  unint64_t v26;
  _BOOL4 v27;
  float v28;
  BOOL v29;
  float v30;
  float64x2_t v31;
  __int128 v32;

  v3 = result[12];
  if (v3 <= 0.0)
    goto LABEL_18;
  if (a2 >= 0.0)
  {
    v4 = result;
    v5 = result[14] + a2;
    result[14] = v5;
    if (v5 < v3)
    {
      *(float *)v12.f64 = powf(result[8], a2);
      v6 = 0;
      *(float *)v12.f64 = fmax((float)(1.0 - *(float *)v12.f64), 0.0);
      v7 = *(float64x2_t *)(v4 + 16);
      v8 = *(float64x2_t *)(v4 + 20);
      v9 = *(float64x2_t *)(v4 + 4);
      v10 = vmulq_f64(v8, v9).f64[0] + vaddvq_f64(vmulq_f64(v7, *(float64x2_t *)v4)) == 1.0;
      v11.f64[0] = (float)(1.0 - *(float *)v12.f64);
      v12.f64[0] = *(float *)v12.f64;
      *(_QWORD *)&v13 = *(_OWORD *)&vmlaq_f64(vmulq_f64(v9, v12), v8, v11);
      v14 = (int8x16_t)vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)v4, v12.f64[0]), v7, v11.f64[0]);
      v15 = vextq_s8(v14, v14, 8uLL).u64[0];
      v16 = vextq_s8((int8x16_t)v7, (int8x16_t)v7, 8uLL).u64[0];
      if (v10)
      {
        v17 = *(double *)&v16;
      }
      else
      {
        v7.f64[0] = *(double *)v14.i64;
        v17 = *(double *)&v15;
      }
      if (!v10)
        v8.f64[0] = v13;
      v18.f64[0] = v7.f64[0];
      v18.f64[1] = v17;
      *((float64x2_t *)v4 + 4) = v18;
      *((float64x2_t *)v4 + 5) = v8;
      v20 = *(float64x2_t *)(v4 + 24);
      v19 = *(float64x2_t *)(v4 + 28);
      v21 = vmulq_f64(v8, v19).f64[0] + vaddvq_f64(vmulq_f64(v18, v20));
      v7.f64[1] = v17;
      v22 = vmulq_n_f64(v7, v12.f64[0]);
      v23 = vmlaq_f64(vmulq_f64(v12, v8), v19, v11);
      v24 = (int8x16_t)vmlaq_n_f64(v22, v20, v11.f64[0]);
      v25 = vextq_s8(v24, v24, 8uLL).u64[0];
      v26 = vextq_s8((int8x16_t)v20, (int8x16_t)v20, 8uLL).u64[0];
      if (v21 == 1.0)
      {
        v24.i64[0] = *((_QWORD *)v4 + 12);
        v25 = v26;
      }
      v24.i64[1] = v25;
      if (v21 == 1.0)
        v23.f64[0] = *((float64_t *)v4 + 14);
      *((int8x16_t *)v4 + 6) = v24;
      *((float64x2_t *)v4 + 7) = v23;
      v27 = v5 >= v4[13];
      return (float *)(v27 | (v6 << 8));
    }
    v28 = fmaxf(fminf(nexttowardf(1.0, 0.0), 0.0), 0.0);
    v4[8] = v28;
    *((_BYTE *)v4 + 36) = 0;
    v29 = v28 <= 0.0;
    v30 = INFINITY;
    if (v29)
      v30 = 0.0;
    *((_BYTE *)v4 + 44) = 0;
    v4[12] = v30;
    v4[13] = v30;
    v4[14] = 0.0;
    v31 = *(float64x2_t *)v4;
    v32 = *((_OWORD *)v4 + 1);
    *((_OWORD *)v4 + 4) = *(_OWORD *)v4;
    *((_OWORD *)v4 + 5) = v32;
    *((float64x2_t *)v4 + 6) = v31;
    *((_OWORD *)v4 + 7) = v32;
LABEL_18:
    v27 = 1;
    v6 = 1;
    return (float *)(v27 | (v6 << 8));
  }
  __break(1u);
  return result;
}

uint64_t *_ZZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_dLNS_27animator_interpolation_typeE0EE6updateEfENKUlRT_E_clINSt3__110unique_ptrINS_18animation_target_tIS1_EENS8_14default_deleteISB_EEEEEENS_15animator_statusES5_(uint64_t *result, uint64_t *a2)
{
  float *v2;
  uint64_t v4;
  uint64_t v5;
  float v6;
  __int16 v7;
  int v8;
  float v9;
  uint64_t v10;

  v2 = (float *)result[1];
  if (*v2 < 0.0)
  {
    __break(1u);
  }
  else
  {
    v4 = *result;
    v5 = *a2;
    v6 = *v2 + *(float *)(*a2 + 56);
    *(float *)(*a2 + 56) = v6;
    if (v6 >= 0.0)
    {
      *(_DWORD *)(v5 + 56) = 0;
      v9 = fmax((float)(*v2 - v6), 0.0);
      _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_dLNS_27animator_interpolation_typeE0EE7_updateEf((float *)v4, v9);
      v10 = *a2;
      *a2 = 0;
      if (*(_DWORD *)(v4 + 136))
        _ZNSt3__17variantIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_dEENS_14default_deleteIS6_EEEENS2_INS3_18animation_timing_tENS7_ISA_EEEEEEaSB8ne180100IS1_Li0ES1_Lm0ELi0EEERSD_OT_(v4 + 128);
      _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_dLNS_27animator_interpolation_typeE0EE10set_targetINS_18animation_target_tIS1_EEEEbOT_NS_25animation_target_option_tE(v4, v10, 6);
      MEMORY[0x20BD1B2E8](v10, 0x1000C4001F72B7BLL);
      v7 = _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_dLNS_27animator_interpolation_typeE0EE6updateEf(v4, v6);
      v8 = HIBYTE(v7);
    }
    else
    {
      _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_dLNS_27animator_interpolation_typeE0EE7_updateEf((float *)v4, *v2);
      LOBYTE(v7) = 0;
      v8 = 0;
    }
    return (uint64_t *)(v7 | (v8 << 8));
  }
  return result;
}

void sub_209E26454(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (v1)
    MEMORY[0x20BD1B2E8](v1, 0x1000C4001F72B7BLL);
  _Unwind_Resume(exception_object);
}

uint64_t *_ZZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_dLNS_27animator_interpolation_typeE0EE6updateEfENKUlRT_E_clINSt3__110unique_ptrINS_18animation_timing_tENS8_14default_deleteISA_EEEEEENS_15animator_statusES5_(uint64_t *result, uint64_t *a2)
{
  float *v2;
  uint64_t v4;
  uint64_t v5;
  float v6;
  __int16 v7;
  int v8;
  float v9;
  uint64_t v10;

  v2 = (float *)result[1];
  if (*v2 < 0.0)
  {
    __break(1u);
  }
  else
  {
    v4 = *result;
    v5 = *a2;
    v6 = *v2 + *(float *)(*a2 + 24);
    *(float *)(*a2 + 24) = v6;
    if (v6 >= 0.0)
    {
      *(_DWORD *)(v5 + 24) = 0;
      v9 = fmax((float)(*v2 - v6), 0.0);
      _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_dLNS_27animator_interpolation_typeE0EE7_updateEf((float *)v4, v9);
      v10 = *a2;
      *a2 = 0;
      if (*(_DWORD *)(v4 + 136))
        _ZNSt3__17variantIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_dEENS_14default_deleteIS6_EEEENS2_INS3_18animation_timing_tENS7_ISA_EEEEEEaSB8ne180100IS1_Li0ES1_Lm0ELi0EEERSD_OT_(v4 + 128);
      _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_dLNS_27animator_interpolation_typeE0EE10set_timingERKNS_18animation_timing_tENS_25animation_target_option_tE(v4, v10, 6);
      MEMORY[0x20BD1B2E8](v10, 0x1000C40CBDA3C1BLL);
      v7 = _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_dLNS_27animator_interpolation_typeE0EE6updateEf(v4, v6);
      v8 = HIBYTE(v7);
    }
    else
    {
      _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_dLNS_27animator_interpolation_typeE0EE7_updateEf((float *)v4, *v2);
      LOBYTE(v7) = 0;
      v8 = 0;
    }
    return (uint64_t *)(v7 | (v8 << 8));
  }
  return result;
}

uint64_t _ZNSt3__116__variant_detail12__assignmentINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_dEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEEE12__assign_altB8ne180100ILm1ESB_SB_EEvRNS0_5__altIXT_ET0_EEOT1_(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t result;

  if (*(_DWORD *)(a1 + 8) != 1)
    return _ZNSt3__116__variant_detail12__assignmentINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_dEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEEE9__emplaceB8ne180100ILm1EJSB_EEERDaDpOT0_(a1, a3);
  v3 = *a3;
  *a3 = 0;
  result = *a2;
  *a2 = v3;
  if (result)
    JUMPOUT(0x20BD1B2E8);
  return result;
}

uint64_t _ZNSt3__116__variant_detail12__assignmentINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_dEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEEE9__emplaceB8ne180100ILm1EJSB_EEERDaDpOT0_(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  char v7;

  v4 = *(unsigned int *)(a1 + 8);
  if ((_DWORD)v4 != -1)
    ((void (*)(char *, uint64_t))*(&off_24C27EEE8 + v4))(&v7, a1);
  v5 = *a2;
  *a2 = 0;
  *(_QWORD *)a1 = v5;
  *(_DWORD *)(a1 + 8) = 1;
  return a1;
}

uint64_t *std::vector<`anonymous namespace'::face_id_animator_t::ring_context_t>::__swap_out_circular_buffer(uint64_t *result, _QWORD *a2)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _OWORD *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v3 = result;
  v5 = *result;
  v4 = result[1];
  v6 = a2[1];
  if (v4 != *result)
  {
    v7 = 0;
    do
    {
      v8 = v6 + v7;
      v9 = (_OWORD *)(v6 + v7 - 288);
      v10 = *(_OWORD *)(v4 + v7 - 272);
      *v9 = *(_OWORD *)(v4 + v7 - 288);
      v9[1] = v10;
      v11 = *(_OWORD *)(v4 + v7 - 256);
      v12 = *(_OWORD *)(v4 + v7 - 240);
      *(_QWORD *)(v8 - 224) = *(_QWORD *)(v4 + v7 - 224);
      *(_OWORD *)(v8 - 256) = v11;
      *(_OWORD *)(v8 - 240) = v12;
      std::__variant_detail::__move_constructor<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>,(std::__variant_detail::_Trait)1>::__move_constructor(v6 + v7 - 216, v4 + v7 - 216);
      *(_DWORD *)(v8 - 200) = *(_DWORD *)(v4 + v7 - 200);
      *(_OWORD *)(v8 - 192) = *(_OWORD *)(v4 + v7 - 192);
      v13 = *(_OWORD *)(v4 + v7 - 176);
      v14 = *(_OWORD *)(v4 + v7 - 160);
      v15 = *(_OWORD *)(v4 + v7 - 128);
      *(_OWORD *)(v8 - 144) = *(_OWORD *)(v4 + v7 - 144);
      *(_OWORD *)(v8 - 128) = v15;
      *(_OWORD *)(v8 - 176) = v13;
      *(_OWORD *)(v8 - 160) = v14;
      std::__variant_detail::__move_constructor<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<simd::quatf>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>,(std::__variant_detail::_Trait)1>::__move_constructor(v6 + v7 - 112, v4 + v7 - 112);
      *(_OWORD *)(v8 - 96) = *(_OWORD *)(v4 + v7 - 96);
      v16 = *(_OWORD *)(v4 + v7 - 80);
      v17 = *(_OWORD *)(v4 + v7 - 64);
      v18 = *(_OWORD *)(v4 + v7 - 32);
      *(_OWORD *)(v8 - 48) = *(_OWORD *)(v4 + v7 - 48);
      *(_OWORD *)(v8 - 32) = v18;
      *(_OWORD *)(v8 - 80) = v16;
      *(_OWORD *)(v8 - 64) = v17;
      result = (uint64_t *)_ZNSt3__116__variant_detail18__move_constructorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv4_fEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEELNS0_6_TraitE1EEC2EOSH_(v6 + v7 - 16, v4 + v7 - 16);
      v7 -= 288;
    }
    while (v4 + v7 != v5);
    v6 += v7;
  }
  a2[1] = v6;
  v19 = *v3;
  *v3 = v6;
  a2[1] = v19;
  v20 = v3[1];
  v3[1] = a2[2];
  a2[2] = v20;
  v21 = v3[2];
  v3[2] = a2[3];
  a2[3] = v21;
  *a2 = a2[1];
  return result;
}

uint64_t std::__split_buffer<`anonymous namespace'::face_id_animator_t::ring_context_t>::~__split_buffer(uint64_t a1)
{
  uint64_t v2;
  uint64_t i;

  v2 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v2; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 288;
    _ZNSt3__116__variant_detail6__dtorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv4_fEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEELNS0_6_TraitE1EED2Ev(i - 16);
    std::__variant_detail::__dtor<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<simd::quatf>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>,(std::__variant_detail::_Trait)1>::~__dtor(i - 112);
    std::__variant_detail::__dtor<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>,(std::__variant_detail::_Trait)1>::~__dtor(i - 216);
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

uint64_t std::__variant_detail::__move_constructor<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>,(std::__variant_detail::_Trait)1>::__move_constructor(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = 0;
  *(_DWORD *)(a1 + 8) = -1;
  std::__variant_detail::__ctor<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>>::__generic_construct[abi:ne180100]<std::__variant_detail::__move_constructor<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>,(std::__variant_detail::_Trait)1>>(a1, a2);
  return a1;
}

uint64_t std::__variant_detail::__ctor<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>>::__generic_construct[abi:ne180100]<std::__variant_detail::__move_constructor<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>,(std::__variant_detail::_Trait)1>>(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  char v7;

  v3 = result;
  v4 = *(unsigned int *)(result + 8);
  if ((_DWORD)v4 != -1)
    result = ((uint64_t (*)(char *, uint64_t))*(&off_24C27EED0 + v4))(&v7, result);
  *(_DWORD *)(v3 + 8) = -1;
  v5 = *(unsigned int *)(a2 + 8);
  if ((_DWORD)v5 != -1)
  {
    result = ((uint64_t (*)(char *, uint64_t, uint64_t))*(&off_24C27EF90 + v5))(&v6, v3, a2);
    *(_DWORD *)(v3 + 8) = v5;
  }
  return result;
}

void _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm1ELm1EEE10__dispatchB8ne180100IOZNS0_6__ctorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIfEENS_14default_deleteISC_EEEENS9_INSA_18animation_timing_tENSD_ISG_EEEEEEEE19__generic_constructB8ne180100INS0_18__move_constructorISJ_LNS0_6_TraitE1EEEEEvRSK_OT_EUlRSQ_OT0_E_JRNS0_6__baseILSN_1EJS8_SF_SI_EEEOSY_EEEDcSQ_DpT0_(uint64_t a1, _QWORD *a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = *a3;
  *a3 = 0;
  *a2 = v3;
}

void _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm2ELm2EEE10__dispatchB8ne180100IOZNS0_6__ctorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIfEENS_14default_deleteISC_EEEENS9_INSA_18animation_timing_tENSD_ISG_EEEEEEEE19__generic_constructB8ne180100INS0_18__move_constructorISJ_LNS0_6_TraitE1EEEEEvRSK_OT_EUlRSQ_OT0_E_JRNS0_6__baseILSN_1EJS8_SF_SI_EEEOSY_EEEDcSQ_DpT0_(uint64_t a1, _QWORD *a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = *a3;
  *a3 = 0;
  *a2 = v3;
}

uint64_t std::__variant_detail::__move_constructor<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<simd::quatf>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>,(std::__variant_detail::_Trait)1>::__move_constructor(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = 0;
  *(_DWORD *)(a1 + 8) = -1;
  std::__variant_detail::__ctor<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<simd::quatf>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>>::__generic_construct[abi:ne180100]<std::__variant_detail::__move_constructor<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<simd::quatf>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>,(std::__variant_detail::_Trait)1>>(a1, a2);
  return a1;
}

uint64_t std::__variant_detail::__ctor<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<simd::quatf>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>>::__generic_construct[abi:ne180100]<std::__variant_detail::__move_constructor<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<simd::quatf>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>,(std::__variant_detail::_Trait)1>>(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  char v7;

  v3 = result;
  v4 = *(unsigned int *)(result + 8);
  if ((_DWORD)v4 != -1)
    result = ((uint64_t (*)(char *, uint64_t))*(&off_24C27EFA8 + v4))(&v7, result);
  *(_DWORD *)(v3 + 8) = -1;
  v5 = *(unsigned int *)(a2 + 8);
  if ((_DWORD)v5 != -1)
  {
    result = ((uint64_t (*)(char *, uint64_t, uint64_t))*(&off_24C27EFC0 + v5))(&v6, v3, a2);
    *(_DWORD *)(v3 + 8) = v5;
  }
  return result;
}

uint64_t _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm1EEE10__dispatchB8ne180100IOZNS0_6__dtorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIN4simd5quatfEEENS_14default_deleteISE_EEEENS9_INSA_18animation_timing_tENSF_ISI_EEEEEEELNS0_6_TraitE1EE9__destroyB8ne180100EvEUlRT_E_JRNS0_6__baseILSM_1EJS8_SH_SK_EEEEEEDcSO_DpT0_(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  *a2 = 0;
  if (result)
    JUMPOUT(0x20BD1B2E8);
  return result;
}

uint64_t _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm2EEE10__dispatchB8ne180100IOZNS0_6__dtorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIN4simd5quatfEEENS_14default_deleteISE_EEEENS9_INSA_18animation_timing_tENSF_ISI_EEEEEEELNS0_6_TraitE1EE9__destroyB8ne180100EvEUlRT_E_JRNS0_6__baseILSM_1EJS8_SH_SK_EEEEEEDcSO_DpT0_(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  *a2 = 0;
  if (result)
    JUMPOUT(0x20BD1B2E8);
  return result;
}

void _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm1ELm1EEE10__dispatchB8ne180100IOZNS0_6__ctorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIN4simd5quatfEEENS_14default_deleteISE_EEEENS9_INSA_18animation_timing_tENSF_ISI_EEEEEEEE19__generic_constructB8ne180100INS0_18__move_constructorISL_LNS0_6_TraitE1EEEEEvRSM_OT_EUlRSS_OT0_E_JRNS0_6__baseILSP_1EJS8_SH_SK_EEEOS10_EEEDcSS_DpT0_(uint64_t a1, _QWORD *a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = *a3;
  *a3 = 0;
  *a2 = v3;
}

void _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm2ELm2EEE10__dispatchB8ne180100IOZNS0_6__ctorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIN4simd5quatfEEENS_14default_deleteISE_EEEENS9_INSA_18animation_timing_tENSF_ISI_EEEEEEEE19__generic_constructB8ne180100INS0_18__move_constructorISL_LNS0_6_TraitE1EEEEEvRSM_OT_EUlRSS_OT0_E_JRNS0_6__baseILSP_1EJS8_SH_SK_EEEOS10_EEEDcSS_DpT0_(uint64_t a1, _QWORD *a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = *a3;
  *a3 = 0;
  *a2 = v3;
}

uint64_t _ZNSt3__116__variant_detail18__move_constructorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv4_fEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEELNS0_6_TraitE1EEC2EOSH_(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = 0;
  *(_DWORD *)(a1 + 8) = -1;
  _ZNSt3__116__variant_detail6__ctorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv4_fEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEEE19__generic_constructB8ne180100INS0_18__move_constructorISF_LNS0_6_TraitE1EEEEEvRSG_OT_(a1, a2);
  return a1;
}

uint64_t _ZNSt3__116__variant_detail6__ctorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv4_fEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEEE19__generic_constructB8ne180100INS0_18__move_constructorISF_LNS0_6_TraitE1EEEEEvRSG_OT_(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  char v7;

  v3 = result;
  v4 = *(unsigned int *)(result + 8);
  if ((_DWORD)v4 != -1)
    result = ((uint64_t (*)(char *, uint64_t))*(&off_24C27EFD8 + v4))(&v7, result);
  *(_DWORD *)(v3 + 8) = -1;
  v5 = *(unsigned int *)(a2 + 8);
  if ((_DWORD)v5 != -1)
  {
    result = ((uint64_t (*)(char *, uint64_t, uint64_t))*(&off_24C27EFF0 + v5))(&v6, v3, a2);
    *(_DWORD *)(v3 + 8) = v5;
  }
  return result;
}

uint64_t _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm1EEE10__dispatchB8ne180100IOZNS0_6__dtorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv4_fEENS_14default_deleteISD_EEEENS9_INSA_18animation_timing_tENSE_ISH_EEEEEEELNS0_6_TraitE1EE9__destroyB8ne180100EvEUlRT_E_JRNS0_6__baseILSL_1EJS8_SG_SJ_EEEEEEDcSN_DpT0_(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  *a2 = 0;
  if (result)
    JUMPOUT(0x20BD1B2E8);
  return result;
}

uint64_t _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm2EEE10__dispatchB8ne180100IOZNS0_6__dtorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv4_fEENS_14default_deleteISD_EEEENS9_INSA_18animation_timing_tENSE_ISH_EEEEEEELNS0_6_TraitE1EE9__destroyB8ne180100EvEUlRT_E_JRNS0_6__baseILSL_1EJS8_SG_SJ_EEEEEEDcSN_DpT0_(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  *a2 = 0;
  if (result)
    JUMPOUT(0x20BD1B2E8);
  return result;
}

void _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm1ELm1EEE10__dispatchB8ne180100IOZNS0_6__ctorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv4_fEENS_14default_deleteISD_EEEENS9_INSA_18animation_timing_tENSE_ISH_EEEEEEEE19__generic_constructB8ne180100INS0_18__move_constructorISK_LNS0_6_TraitE1EEEEEvRSL_OT_EUlRSR_OT0_E_JRNS0_6__baseILSO_1EJS8_SG_SJ_EEEOSZ_EEEDcSR_DpT0_(uint64_t a1, _QWORD *a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = *a3;
  *a3 = 0;
  *a2 = v3;
}

void _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm2ELm2EEE10__dispatchB8ne180100IOZNS0_6__ctorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv4_fEENS_14default_deleteISD_EEEENS9_INSA_18animation_timing_tENSE_ISH_EEEEEEEE19__generic_constructB8ne180100INS0_18__move_constructorISK_LNS0_6_TraitE1EEEEEvRSL_OT_EUlRSR_OT0_E_JRNS0_6__baseILSO_1EJS8_SG_SJ_EEEOSZ_EEEDcSR_DpT0_(uint64_t a1, _QWORD *a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = *a3;
  *a3 = 0;
  *a2 = v3;
}

uint64_t _ZNSt3__116__variant_detail6__dtorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv4_fEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEELNS0_6_TraitE1EED2Ev(uint64_t a1)
{
  uint64_t v2;
  char v4;

  v2 = *(unsigned int *)(a1 + 8);
  if ((_DWORD)v2 != -1)
    ((void (*)(char *, uint64_t))*(&off_24C27EFD8 + v2))(&v4, a1);
  *(_DWORD *)(a1 + 8) = -1;
  return a1;
}

uint64_t std::__variant_detail::__dtor<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<simd::quatf>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>,(std::__variant_detail::_Trait)1>::~__dtor(uint64_t a1)
{
  uint64_t v2;
  char v4;

  v2 = *(unsigned int *)(a1 + 8);
  if ((_DWORD)v2 != -1)
    ((void (*)(char *, uint64_t))*(&off_24C27EFA8 + v2))(&v4, a1);
  *(_DWORD *)(a1 + 8) = -1;
  return a1;
}

BOOL std::allocator_traits<std::allocator<`anonymous namespace'::face_id_animator_t::ring_context_t>>::construct[abi:ne180100]<`anonymous namespace'::face_id_animator_t::ring_context_t,`anonymous namespace'::face_id_animator_t::ring_context_t::static_state_t,`anonymous namespace'::face_id_state_t &,void,void>(uint64_t a1, unsigned __int8 *a2, int8x16_t *a3)
{
  __int32 v5;
  float v6;
  int8x16_t v7;
  uint64_t v8;
  float v9;
  float v10;
  int8x16_t v11;
  unsigned int v12;
  int8x16_t v13;
  int8x16_t v14;
  int8x16_t v16;
  __int128 v17;
  float v18;
  char v19;
  char v20;
  float v21;
  float v22;
  int v23;

  v5 = *a2;
  *(_BYTE *)a1 = v5;
  *(_DWORD *)(a1 + 8) = 0;
  v6 = nexttowardf(1.0, 0.0);
  *(_OWORD *)(a1 + 96) = xmmword_209E30C90;
  v8 = a1 + 96;
  v9 = fmaxf(fminf(v6, 0.0), 0.0);
  *(_QWORD *)(v8 - 80) = 0;
  *(_QWORD *)(v8 - 72) = 0;
  *(_DWORD *)(v8 - 64) = 0;
  *(float *)(v8 - 60) = v9;
  *(_BYTE *)(v8 - 56) = 0;
  *(_BYTE *)(v8 - 48) = 0;
  if (v9 <= 0.0)
    v10 = 0.0;
  else
    v10 = INFINITY;
  *(float *)(v8 - 44) = v10;
  *(float *)(v8 - 40) = v10;
  *(_QWORD *)(v8 - 36) = 0;
  *(_DWORD *)(v8 - 28) = 0;
  *(_DWORD *)(v8 - 16) = 0;
  *(_DWORD *)(v8 - 8) = 0;
  *(float *)(v8 + 16) = v9;
  *(_BYTE *)(v8 + 20) = 0;
  *(_BYTE *)(v8 + 28) = 0;
  *(_DWORD *)(v8 + 40) = 0;
  *(float *)(v8 + 32) = v10;
  *(float *)(v8 + 36) = v10;
  v11 = *(int8x16_t *)v8;
  *(_OWORD *)(v8 + 48) = *(_OWORD *)v8;
  *(int8x16_t *)(v8 + 64) = v11;
  *(_DWORD *)(v8 + 88) = 0;
  *(_DWORD *)(v8 + 96) = 0;
  *(_QWORD *)(v8 + 104) = 0;
  *(_DWORD *)(v8 + 100) = 0;
  *(float *)(v8 + 112) = v9;
  *(_BYTE *)(v8 + 116) = 0;
  *(_BYTE *)(v8 + 124) = 0;
  *(_DWORD *)(v8 + 136) = 0;
  *(float *)(v8 + 128) = v10;
  *(float *)(v8 + 132) = v10;
  *(_DWORD *)(v8 + 184) = 0;
  v11.i32[1] = 0;
  v11.i64[1] = 0;
  *(_OWORD *)(v8 + 144) = 0u;
  *(_OWORD *)(v8 + 160) = 0u;
  v12 = a3[4].u8[8];
  if (v12 > 6)
    goto LABEL_11;
  if (((1 << v12) & 0x37) != 0)
  {
    v11.i32[0] = 0;
    v7.i32[0] = v5;
    v13 = *a3;
    v13.i32[3] = 0;
    v16 = vbslq_s8(vdupq_lane_s8((int8x8_t)*(_OWORD *)&vceqq_s8(v7, v11), 0), v13, *a3);
    if (v12 != 3)
      goto LABEL_13;
  }
  else
  {
    if (v12 != 3)
    {
LABEL_12:
      v14 = *a3;
      v14.i32[3] = 0;
      v16 = v14;
      goto LABEL_13;
    }
    v16 = *a3;
  }
  if (a3[3].i64[1] >= 0xAuLL)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
LABEL_13:
  v17 = xmmword_209E30C90;
  v18 = v9;
  v19 = 0;
  v20 = 0;
  v23 = 0;
  v21 = v10;
  v22 = v10;
  LAUI_uniform_cubic_b_spline_renderer::animator_t<simd::quatf,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::set_target<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<simd::quatf>>(v8, (uint64_t)&v17, 0);
  v17 = (__int128)v16;
  v18 = v9;
  v19 = 0;
  v20 = 0;
  v23 = 0;
  v21 = v10;
  v22 = v10;
  return _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv4_fLNS_27animator_interpolation_typeE0EE10set_targetINS_18animation_target_tIS1_EEEEbOT_NS_25animation_target_option_tE(v8 + 96, (uint64_t)&v17, 0);
}

uint64_t `anonymous namespace'::ring_updater_t<0ul,true,true>::function(float32x4_t *a1, float *a2)
{
  float v4;
  float v5;
  float32x2_t v6;
  float32x2_t v7;
  __float2 v8;
  float32x4_t v9;
  __float2 v10;
  uint64_t v11;
  float32x4_t v12;
  int32x4_t v13;
  int8x16_t v14;
  float32x4_t v15;
  float32x4_t v16;
  float32x4_t v17;
  float32x4_t v18;
  int32x4_t v19;
  int8x16_t v20;
  float32x4_t v21;
  float32x4_t v22;
  float32x4_t v23;
  int32x4_t v24;
  int8x16_t v25;
  float32x4_t v26;
  float32x4_t v27;
  float32x4_t v28;
  float v29;
  float32x4_t v30;
  float32x4_t v31;
  float32x4_t v32;
  float v33;
  float v34;
  float32x4_t v35;
  float32x4_t v36;
  float32x4_t v38;
  float v39;
  float32x4_t v40;
  float32x4_t v41;
  float32x4_t v42;

  v4 = *a2;
  v5 = (float)(*a2 / 562.5) * 6.28318531;
  v6 = vrsqrte_f32((float32x2_t)0x40000000);
  v7 = vmul_f32(v6, vrsqrts_f32((float32x2_t)0x40000000, vmul_f32(v6, v6)));
  LODWORD(v39) = vmul_f32(v7, vrsqrts_f32((float32x2_t)0x40000000, vmul_f32(v7, v7))).u32[0];
  v8 = __sincosf_stret(v5 * 0.5);
  v9 = vmulq_n_f32(vmulq_n_f32((float32x4_t)xmmword_209E30FC0, v39), v8.__sinval);
  v9.i32[3] = LODWORD(v8.__cosval);
  v38 = v9;
  v9.f32[0] = (float)(v4 / 1200.0) * 6.28318531;
  v10 = __sincosf_stret(v9.f32[0] * 0.5);
  v11 = 0;
  v12 = vmulq_n_f32(vmulq_n_f32((float32x4_t)xmmword_209E30FD0, v39), v10.__sinval);
  v13 = (int32x4_t)vnegq_f32(v38);
  v14 = (int8x16_t)vtrn2q_s32((int32x4_t)v38, vtrn1q_s32((int32x4_t)v38, v13));
  v15 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v38, (int8x16_t)v13, 8uLL), *(float32x2_t *)v12.f32, 1), (float32x4_t)vextq_s8(v14, v14, 8uLL), v12.f32[0]);
  v16 = (float32x4_t)vrev64q_s32((int32x4_t)v38);
  v16.i32[0] = v13.i32[1];
  v16.i32[3] = v13.i32[2];
  v17 = vaddq_f32(vmlaq_laneq_f32(vmulq_n_f32(v38, v10.__cosval), v16, v12, 2), v15);
  a1[1] = v17;
  v18 = vmulq_f32(v17, (float32x4_t)xmmword_209E30FE0);
  v19 = (int32x4_t)vnegq_f32(v18);
  v20 = (int8x16_t)vtrn2q_s32((int32x4_t)v18, vtrn1q_s32((int32x4_t)v18, v19));
  v21 = vmulq_f32((float32x4_t)vextq_s8((int8x16_t)v18, (int8x16_t)v19, 8uLL), (float32x4_t)0);
  v22 = (float32x4_t)vrev64q_s32((int32x4_t)v18);
  v22.i32[0] = v19.i32[1];
  v22.i32[3] = v19.i32[2];
  v23 = vaddq_f32(v22, vmlaq_f32(v21, (float32x4_t)0, (float32x4_t)vextq_s8(v20, v20, 8uLL)));
  v24 = (int32x4_t)vnegq_f32(v23);
  v25 = (int8x16_t)vtrn2q_s32((int32x4_t)v23, vtrn1q_s32((int32x4_t)v23, v24));
  v26 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v23, (int8x16_t)v24, 8uLL), *(float32x2_t *)v17.f32, 1), (float32x4_t)vextq_s8(v25, v25, 8uLL), v17.f32[0]);
  v27 = (float32x4_t)vrev64q_s32((int32x4_t)v23);
  v27.i32[0] = v24.i32[1];
  v27.i32[3] = v24.i32[2];
  v28 = vmulq_f32(vaddq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v23, v17, 3), v27, v17, 2), v26), (float32x4_t)xmmword_209E30CC0);
  v28.f32[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v28, 2), vaddq_f32(v28, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v28.f32, 1))).f32[0];
  *(float *)v24.i32 = fminf(fmaxf((float)(v28.f32[0] + 1.0) / 0.7, 0.0), 1.0);
  v29 = fminf(fmaxf((float)(v28.f32[0] + 0.3) / 0.6, 0.0), 1.0);
  v28.f32[0] = fminf(fmaxf((float)(v28.f32[0] + -0.3) / 0.7, 0.0), 1.0);
  v30 = vmlaq_n_f32((float32x4_t)xmmword_209E31000, (float32x4_t)xmmword_209E30FF0, (float)(*(float *)v24.i32 * *(float *)v24.i32) * (float)((float)(*(float *)v24.i32 * -2.0) + 3.0));
  v31 = vmlaq_n_f32(v30, vsubq_f32((float32x4_t)xmmword_209E31010, v30), (float)(v29 * v29) * (float)((float)(v29 * -2.0) + 3.0));
  v32 = vmlaq_n_f32(v31, vsubq_f32((float32x4_t)xmmword_209E31020, v31), (float)(v28.f32[0] * v28.f32[0]) * (float)((float)(v28.f32[0] * -2.0) + 3.0));
  do
  {
    v42 = v32;
    v33 = *(float *)((unint64_t)&v42 & 0xFFFFFFFFFFFFFFF3 | (4 * (v11 & 3)));
    if (v33 <= 0.04045)
    {
      v34 = v33 / 12.92;
    }
    else
    {
      v40 = v32;
      v34 = powf((float)(v33 + 0.055) / 1.055, 2.4);
      v32 = v40;
    }
    v41 = v32;
    *(float *)((unint64_t)&v41 & 0xFFFFFFFFFFFFFFF3 | (4 * (v11 & 3))) = v34;
    v35 = v41;
    v36 = v41;
    v36.i32[3] = v32.i32[3];
    ++v11;
    v32 = v36;
  }
  while (v11 != 3);
  v35.i32[3] = 1.0;
  a1[5] = v35;
  if (*a2 >= 675000.0)
    *a2 = fmodf(*a2, 675000.0);
  return 0;
}

uint64_t `anonymous namespace'::ring_updater_t<1ul,true,true>::function(float32x4_t *a1, float *a2)
{
  float v4;
  float v5;
  float32x2_t v6;
  float32x2_t v7;
  __float2 v8;
  float32x4_t v9;
  __float2 v10;
  uint64_t v11;
  float32x4_t v12;
  int32x4_t v13;
  int8x16_t v14;
  float32x4_t v15;
  float32x4_t v16;
  float32x4_t v17;
  float32x4_t v18;
  int32x4_t v19;
  int8x16_t v20;
  float32x4_t v21;
  float32x4_t v22;
  float32x4_t v23;
  int32x4_t v24;
  int8x16_t v25;
  float32x4_t v26;
  float32x4_t v27;
  float32x4_t v28;
  float v29;
  float32x4_t v30;
  float32x4_t v31;
  float32x4_t v32;
  float v33;
  float v34;
  float32x4_t v35;
  float32x4_t v36;
  float32x4_t v38;
  float v39;
  float32x4_t v40;
  float32x4_t v41;
  float32x4_t v42;

  v4 = *a2;
  v5 = (float)(*a2 / 562.5) * 6.28318531;
  v6 = vrsqrte_f32((float32x2_t)0x40000000);
  v7 = vmul_f32(v6, vrsqrts_f32((float32x2_t)0x40000000, vmul_f32(v6, v6)));
  LODWORD(v39) = vmul_f32(v7, vrsqrts_f32((float32x2_t)0x40000000, vmul_f32(v7, v7))).u32[0];
  v8 = __sincosf_stret(v5 * 0.5);
  v9 = vmulq_n_f32(vmulq_n_f32((float32x4_t)xmmword_209E31030, v39), v8.__sinval);
  v9.i32[3] = LODWORD(v8.__cosval);
  v38 = v9;
  v9.f32[0] = (float)(v4 / 1200.0) * 6.28318531;
  v10 = __sincosf_stret(v9.f32[0] * 0.5);
  v11 = 0;
  v12 = vmulq_n_f32(vmulq_n_f32((float32x4_t)xmmword_209E30FD0, v39), v10.__sinval);
  v13 = (int32x4_t)vnegq_f32(v38);
  v14 = (int8x16_t)vtrn2q_s32((int32x4_t)v38, vtrn1q_s32((int32x4_t)v38, v13));
  v15 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v38, (int8x16_t)v13, 8uLL), *(float32x2_t *)v12.f32, 1), (float32x4_t)vextq_s8(v14, v14, 8uLL), v12.f32[0]);
  v16 = (float32x4_t)vrev64q_s32((int32x4_t)v38);
  v16.i32[0] = v13.i32[1];
  v16.i32[3] = v13.i32[2];
  v17 = vaddq_f32(vmlaq_laneq_f32(vmulq_n_f32(v38, v10.__cosval), v16, v12, 2), v15);
  a1[1] = v17;
  v18 = vmulq_f32(v17, (float32x4_t)xmmword_209E30FE0);
  v19 = (int32x4_t)vnegq_f32(v18);
  v20 = (int8x16_t)vtrn2q_s32((int32x4_t)v18, vtrn1q_s32((int32x4_t)v18, v19));
  v21 = vmulq_f32((float32x4_t)vextq_s8((int8x16_t)v18, (int8x16_t)v19, 8uLL), (float32x4_t)0);
  v22 = (float32x4_t)vrev64q_s32((int32x4_t)v18);
  v22.i32[0] = v19.i32[1];
  v22.i32[3] = v19.i32[2];
  v23 = vaddq_f32(v22, vmlaq_f32(v21, (float32x4_t)0, (float32x4_t)vextq_s8(v20, v20, 8uLL)));
  v24 = (int32x4_t)vnegq_f32(v23);
  v25 = (int8x16_t)vtrn2q_s32((int32x4_t)v23, vtrn1q_s32((int32x4_t)v23, v24));
  v26 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v23, (int8x16_t)v24, 8uLL), *(float32x2_t *)v17.f32, 1), (float32x4_t)vextq_s8(v25, v25, 8uLL), v17.f32[0]);
  v27 = (float32x4_t)vrev64q_s32((int32x4_t)v23);
  v27.i32[0] = v24.i32[1];
  v27.i32[3] = v24.i32[2];
  v28 = vmulq_f32(vaddq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v23, v17, 3), v27, v17, 2), v26), (float32x4_t)xmmword_209E30CA0);
  v28.f32[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v28, 2), vaddq_f32(v28, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v28.f32, 1))).f32[0];
  *(float *)v24.i32 = fminf(fmaxf((float)(v28.f32[0] + 1.0) / 0.7, 0.0), 1.0);
  v29 = fminf(fmaxf((float)(v28.f32[0] + 0.3) / 0.6, 0.0), 1.0);
  v28.f32[0] = fminf(fmaxf((float)(v28.f32[0] + -0.3) / 0.7, 0.0), 1.0);
  v30 = vmlaq_n_f32((float32x4_t)xmmword_209E31000, (float32x4_t)xmmword_209E30FF0, (float)(*(float *)v24.i32 * *(float *)v24.i32) * (float)((float)(*(float *)v24.i32 * -2.0) + 3.0));
  v31 = vmlaq_n_f32(v30, vsubq_f32((float32x4_t)xmmword_209E31010, v30), (float)(v29 * v29) * (float)((float)(v29 * -2.0) + 3.0));
  v32 = vmlaq_n_f32(v31, vsubq_f32((float32x4_t)xmmword_209E31020, v31), (float)(v28.f32[0] * v28.f32[0]) * (float)((float)(v28.f32[0] * -2.0) + 3.0));
  do
  {
    v42 = v32;
    v33 = *(float *)((unint64_t)&v42 & 0xFFFFFFFFFFFFFFF3 | (4 * (v11 & 3)));
    if (v33 <= 0.04045)
    {
      v34 = v33 / 12.92;
    }
    else
    {
      v40 = v32;
      v34 = powf((float)(v33 + 0.055) / 1.055, 2.4);
      v32 = v40;
    }
    v41 = v32;
    *(float *)((unint64_t)&v41 & 0xFFFFFFFFFFFFFFF3 | (4 * (v11 & 3))) = v34;
    v35 = v41;
    v36 = v41;
    v36.i32[3] = v32.i32[3];
    ++v11;
    v32 = v36;
  }
  while (v11 != 3);
  v35.i32[3] = 1.0;
  a1[5] = v35;
  if (*a2 >= 675000.0)
    *a2 = fmodf(*a2, 675000.0);
  return 0;
}

uint64_t `anonymous namespace'::ring_updater_t<0ul,true,false>::function(float32x4_t *a1, float *a2)
{
  float v4;
  float v5;
  float32x2_t v6;
  float32x2_t v7;
  __float2 v8;
  float32x4_t v9;
  __float2 v10;
  float32x4_t v11;
  int32x4_t v12;
  int8x16_t v13;
  float32x4_t v14;
  float32x4_t v15;
  float32x4_t v17;
  float v18;

  v4 = *a2;
  v5 = (float)(*a2 / 562.5) * 6.28318531;
  v6 = vrsqrte_f32((float32x2_t)0x40000000);
  v7 = vmul_f32(v6, vrsqrts_f32((float32x2_t)0x40000000, vmul_f32(v6, v6)));
  LODWORD(v18) = vmul_f32(v7, vrsqrts_f32((float32x2_t)0x40000000, vmul_f32(v7, v7))).u32[0];
  v8 = __sincosf_stret(v5 * 0.5);
  v9 = vmulq_n_f32(vmulq_n_f32((float32x4_t)xmmword_209E30FC0, v18), v8.__sinval);
  v9.i32[3] = LODWORD(v8.__cosval);
  v17 = v9;
  v9.f32[0] = (float)(v4 / 1200.0) * 6.28318531;
  v10 = __sincosf_stret(v9.f32[0] * 0.5);
  v11 = vmulq_n_f32(vmulq_n_f32((float32x4_t)xmmword_209E30FD0, v18), v10.__sinval);
  v12 = (int32x4_t)vnegq_f32(v17);
  v13 = (int8x16_t)vtrn2q_s32((int32x4_t)v17, vtrn1q_s32((int32x4_t)v17, v12));
  v14 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v17, (int8x16_t)v12, 8uLL), *(float32x2_t *)v11.f32, 1), (float32x4_t)vextq_s8(v13, v13, 8uLL), v11.f32[0]);
  v15 = (float32x4_t)vrev64q_s32((int32x4_t)v17);
  v15.i32[0] = v12.i32[1];
  v15.i32[3] = v12.i32[2];
  a1[1] = vaddq_f32(vmlaq_laneq_f32(vmulq_n_f32(v17, v10.__cosval), v15, v11, 2), v14);
  if (*a2 >= 675000.0)
    *a2 = fmodf(*a2, 675000.0);
  return 0;
}

uint64_t `anonymous namespace'::ring_updater_t<1ul,true,false>::function(float32x4_t *a1, float *a2)
{
  float v4;
  float v5;
  float32x2_t v6;
  float32x2_t v7;
  __float2 v8;
  float32x4_t v9;
  __float2 v10;
  float32x4_t v11;
  int32x4_t v12;
  int8x16_t v13;
  float32x4_t v14;
  float32x4_t v15;
  float32x4_t v17;
  float v18;

  v4 = *a2;
  v5 = (float)(*a2 / 562.5) * 6.28318531;
  v6 = vrsqrte_f32((float32x2_t)0x40000000);
  v7 = vmul_f32(v6, vrsqrts_f32((float32x2_t)0x40000000, vmul_f32(v6, v6)));
  LODWORD(v18) = vmul_f32(v7, vrsqrts_f32((float32x2_t)0x40000000, vmul_f32(v7, v7))).u32[0];
  v8 = __sincosf_stret(v5 * 0.5);
  v9 = vmulq_n_f32(vmulq_n_f32((float32x4_t)xmmword_209E31030, v18), v8.__sinval);
  v9.i32[3] = LODWORD(v8.__cosval);
  v17 = v9;
  v9.f32[0] = (float)(v4 / 1200.0) * 6.28318531;
  v10 = __sincosf_stret(v9.f32[0] * 0.5);
  v11 = vmulq_n_f32(vmulq_n_f32((float32x4_t)xmmword_209E30FD0, v18), v10.__sinval);
  v12 = (int32x4_t)vnegq_f32(v17);
  v13 = (int8x16_t)vtrn2q_s32((int32x4_t)v17, vtrn1q_s32((int32x4_t)v17, v12));
  v14 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v17, (int8x16_t)v12, 8uLL), *(float32x2_t *)v11.f32, 1), (float32x4_t)vextq_s8(v13, v13, 8uLL), v11.f32[0]);
  v15 = (float32x4_t)vrev64q_s32((int32x4_t)v17);
  v15.i32[0] = v12.i32[1];
  v15.i32[3] = v12.i32[2];
  a1[1] = vaddq_f32(vmlaq_laneq_f32(vmulq_n_f32(v17, v10.__cosval), v15, v11, 2), v14);
  if (*a2 >= 675000.0)
    *a2 = fmodf(*a2, 675000.0);
  return 0;
}

uint64_t `anonymous namespace'::ring_updater_t<0ul,false,true>::function(float32x4_t *a1, float *a2)
{
  float v4;
  float v5;
  float32x2_t v6;
  float32x2_t v7;
  __float2 v8;
  float32x4_t v9;
  __float2 v10;
  uint64_t v11;
  float32x4_t v12;
  int32x4_t v13;
  int8x16_t v14;
  float32x4_t v15;
  float32x4_t v16;
  float32x4_t v17;
  float32x4_t v18;
  int32x4_t v19;
  int8x16_t v20;
  float32x4_t v21;
  float32x4_t v22;
  float32x4_t v23;
  int32x4_t v24;
  int8x16_t v25;
  float32x4_t v26;
  float32x4_t v27;
  float32x4_t v28;
  float v29;
  float32x4_t v30;
  float32x4_t v31;
  float32x4_t v32;
  float v33;
  float v34;
  float32x4_t v35;
  float32x4_t v36;
  float32x4_t v38;
  float v39;
  float32x4_t v40;
  float32x4_t v41;
  float32x4_t v42;

  v4 = *a2;
  v5 = (float)(*a2 / 1280.0) * 6.28318531;
  v6 = vrsqrte_f32((float32x2_t)0x40000000);
  v7 = vmul_f32(v6, vrsqrts_f32((float32x2_t)0x40000000, vmul_f32(v6, v6)));
  LODWORD(v39) = vmul_f32(v7, vrsqrts_f32((float32x2_t)0x40000000, vmul_f32(v7, v7))).u32[0];
  v8 = __sincosf_stret(v5 * 0.5);
  v9 = vmulq_n_f32(vmulq_n_f32((float32x4_t)xmmword_209E30FC0, v39), v8.__sinval);
  v9.i32[3] = LODWORD(v8.__cosval);
  v38 = v9;
  v9.f32[0] = (float)(v4 / 2630.0) * 6.28318531;
  v10 = __sincosf_stret(v9.f32[0] * 0.5);
  v11 = 0;
  v12 = vmulq_n_f32(vmulq_n_f32((float32x4_t)xmmword_209E30FD0, v39), v10.__sinval);
  v13 = (int32x4_t)vnegq_f32(v38);
  v14 = (int8x16_t)vtrn2q_s32((int32x4_t)v38, vtrn1q_s32((int32x4_t)v38, v13));
  v15 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v38, (int8x16_t)v13, 8uLL), *(float32x2_t *)v12.f32, 1), (float32x4_t)vextq_s8(v14, v14, 8uLL), v12.f32[0]);
  v16 = (float32x4_t)vrev64q_s32((int32x4_t)v38);
  v16.i32[0] = v13.i32[1];
  v16.i32[3] = v13.i32[2];
  v17 = vaddq_f32(vmlaq_laneq_f32(vmulq_n_f32(v38, v10.__cosval), v16, v12, 2), v15);
  a1[1] = v17;
  v18 = vmulq_f32(v17, (float32x4_t)xmmword_209E30FE0);
  v19 = (int32x4_t)vnegq_f32(v18);
  v20 = (int8x16_t)vtrn2q_s32((int32x4_t)v18, vtrn1q_s32((int32x4_t)v18, v19));
  v21 = vmulq_f32((float32x4_t)vextq_s8((int8x16_t)v18, (int8x16_t)v19, 8uLL), (float32x4_t)0);
  v22 = (float32x4_t)vrev64q_s32((int32x4_t)v18);
  v22.i32[0] = v19.i32[1];
  v22.i32[3] = v19.i32[2];
  v23 = vaddq_f32(v22, vmlaq_f32(v21, (float32x4_t)0, (float32x4_t)vextq_s8(v20, v20, 8uLL)));
  v24 = (int32x4_t)vnegq_f32(v23);
  v25 = (int8x16_t)vtrn2q_s32((int32x4_t)v23, vtrn1q_s32((int32x4_t)v23, v24));
  v26 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v23, (int8x16_t)v24, 8uLL), *(float32x2_t *)v17.f32, 1), (float32x4_t)vextq_s8(v25, v25, 8uLL), v17.f32[0]);
  v27 = (float32x4_t)vrev64q_s32((int32x4_t)v23);
  v27.i32[0] = v24.i32[1];
  v27.i32[3] = v24.i32[2];
  v28 = vmulq_f32(vaddq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v23, v17, 3), v27, v17, 2), v26), (float32x4_t)xmmword_209E30CC0);
  v28.f32[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v28, 2), vaddq_f32(v28, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v28.f32, 1))).f32[0];
  *(float *)v24.i32 = fminf(fmaxf((float)(v28.f32[0] + 1.0) / 0.7, 0.0), 1.0);
  v29 = fminf(fmaxf((float)(v28.f32[0] + 0.3) / 0.6, 0.0), 1.0);
  v28.f32[0] = fminf(fmaxf((float)(v28.f32[0] + -0.3) / 0.7, 0.0), 1.0);
  v30 = vmlaq_n_f32((float32x4_t)xmmword_209E31000, (float32x4_t)xmmword_209E30FF0, (float)(*(float *)v24.i32 * *(float *)v24.i32) * (float)((float)(*(float *)v24.i32 * -2.0) + 3.0));
  v31 = vmlaq_n_f32(v30, vsubq_f32((float32x4_t)xmmword_209E31010, v30), (float)(v29 * v29) * (float)((float)(v29 * -2.0) + 3.0));
  v32 = vmlaq_n_f32(v31, vsubq_f32((float32x4_t)xmmword_209E31020, v31), (float)(v28.f32[0] * v28.f32[0]) * (float)((float)(v28.f32[0] * -2.0) + 3.0));
  do
  {
    v42 = v32;
    v33 = *(float *)((unint64_t)&v42 & 0xFFFFFFFFFFFFFFF3 | (4 * (v11 & 3)));
    if (v33 <= 0.04045)
    {
      v34 = v33 / 12.92;
    }
    else
    {
      v40 = v32;
      v34 = powf((float)(v33 + 0.055) / 1.055, 2.4);
      v32 = v40;
    }
    v41 = v32;
    *(float *)((unint64_t)&v41 & 0xFFFFFFFFFFFFFFF3 | (4 * (v11 & 3))) = v34;
    v35 = v41;
    v36 = v41;
    v36.i32[3] = v32.i32[3];
    ++v11;
    v32 = v36;
  }
  while (v11 != 3);
  v35.i32[3] = 1.0;
  a1[5] = v35;
  if (*a2 >= 3366400.0)
    *a2 = fmodf(*a2, 3366400.0);
  return 0;
}

uint64_t `anonymous namespace'::ring_updater_t<1ul,false,true>::function(float32x4_t *a1, float *a2)
{
  float v4;
  float v5;
  float32x2_t v6;
  float32x2_t v7;
  __float2 v8;
  float32x4_t v9;
  __float2 v10;
  uint64_t v11;
  float32x4_t v12;
  int32x4_t v13;
  int8x16_t v14;
  float32x4_t v15;
  float32x4_t v16;
  float32x4_t v17;
  float32x4_t v18;
  int32x4_t v19;
  int8x16_t v20;
  float32x4_t v21;
  float32x4_t v22;
  float32x4_t v23;
  int32x4_t v24;
  int8x16_t v25;
  float32x4_t v26;
  float32x4_t v27;
  float32x4_t v28;
  float v29;
  float32x4_t v30;
  float32x4_t v31;
  float32x4_t v32;
  float v33;
  float v34;
  float32x4_t v35;
  float32x4_t v36;
  float32x4_t v38;
  float v39;
  float32x4_t v40;
  float32x4_t v41;
  float32x4_t v42;

  v4 = *a2;
  v5 = (float)(*a2 / 1280.0) * 6.28318531;
  v6 = vrsqrte_f32((float32x2_t)0x40000000);
  v7 = vmul_f32(v6, vrsqrts_f32((float32x2_t)0x40000000, vmul_f32(v6, v6)));
  LODWORD(v39) = vmul_f32(v7, vrsqrts_f32((float32x2_t)0x40000000, vmul_f32(v7, v7))).u32[0];
  v8 = __sincosf_stret(v5 * 0.5);
  v9 = vmulq_n_f32(vmulq_n_f32((float32x4_t)xmmword_209E31030, v39), v8.__sinval);
  v9.i32[3] = LODWORD(v8.__cosval);
  v38 = v9;
  v9.f32[0] = (float)(v4 / 2630.0) * 6.28318531;
  v10 = __sincosf_stret(v9.f32[0] * 0.5);
  v11 = 0;
  v12 = vmulq_n_f32(vmulq_n_f32((float32x4_t)xmmword_209E30FD0, v39), v10.__sinval);
  v13 = (int32x4_t)vnegq_f32(v38);
  v14 = (int8x16_t)vtrn2q_s32((int32x4_t)v38, vtrn1q_s32((int32x4_t)v38, v13));
  v15 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v38, (int8x16_t)v13, 8uLL), *(float32x2_t *)v12.f32, 1), (float32x4_t)vextq_s8(v14, v14, 8uLL), v12.f32[0]);
  v16 = (float32x4_t)vrev64q_s32((int32x4_t)v38);
  v16.i32[0] = v13.i32[1];
  v16.i32[3] = v13.i32[2];
  v17 = vaddq_f32(vmlaq_laneq_f32(vmulq_n_f32(v38, v10.__cosval), v16, v12, 2), v15);
  a1[1] = v17;
  v18 = vmulq_f32(v17, (float32x4_t)xmmword_209E30FE0);
  v19 = (int32x4_t)vnegq_f32(v18);
  v20 = (int8x16_t)vtrn2q_s32((int32x4_t)v18, vtrn1q_s32((int32x4_t)v18, v19));
  v21 = vmulq_f32((float32x4_t)vextq_s8((int8x16_t)v18, (int8x16_t)v19, 8uLL), (float32x4_t)0);
  v22 = (float32x4_t)vrev64q_s32((int32x4_t)v18);
  v22.i32[0] = v19.i32[1];
  v22.i32[3] = v19.i32[2];
  v23 = vaddq_f32(v22, vmlaq_f32(v21, (float32x4_t)0, (float32x4_t)vextq_s8(v20, v20, 8uLL)));
  v24 = (int32x4_t)vnegq_f32(v23);
  v25 = (int8x16_t)vtrn2q_s32((int32x4_t)v23, vtrn1q_s32((int32x4_t)v23, v24));
  v26 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v23, (int8x16_t)v24, 8uLL), *(float32x2_t *)v17.f32, 1), (float32x4_t)vextq_s8(v25, v25, 8uLL), v17.f32[0]);
  v27 = (float32x4_t)vrev64q_s32((int32x4_t)v23);
  v27.i32[0] = v24.i32[1];
  v27.i32[3] = v24.i32[2];
  v28 = vmulq_f32(vaddq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v23, v17, 3), v27, v17, 2), v26), (float32x4_t)xmmword_209E30CA0);
  v28.f32[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v28, 2), vaddq_f32(v28, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v28.f32, 1))).f32[0];
  *(float *)v24.i32 = fminf(fmaxf((float)(v28.f32[0] + 1.0) / 0.7, 0.0), 1.0);
  v29 = fminf(fmaxf((float)(v28.f32[0] + 0.3) / 0.6, 0.0), 1.0);
  v28.f32[0] = fminf(fmaxf((float)(v28.f32[0] + -0.3) / 0.7, 0.0), 1.0);
  v30 = vmlaq_n_f32((float32x4_t)xmmword_209E31000, (float32x4_t)xmmword_209E30FF0, (float)(*(float *)v24.i32 * *(float *)v24.i32) * (float)((float)(*(float *)v24.i32 * -2.0) + 3.0));
  v31 = vmlaq_n_f32(v30, vsubq_f32((float32x4_t)xmmword_209E31010, v30), (float)(v29 * v29) * (float)((float)(v29 * -2.0) + 3.0));
  v32 = vmlaq_n_f32(v31, vsubq_f32((float32x4_t)xmmword_209E31020, v31), (float)(v28.f32[0] * v28.f32[0]) * (float)((float)(v28.f32[0] * -2.0) + 3.0));
  do
  {
    v42 = v32;
    v33 = *(float *)((unint64_t)&v42 & 0xFFFFFFFFFFFFFFF3 | (4 * (v11 & 3)));
    if (v33 <= 0.04045)
    {
      v34 = v33 / 12.92;
    }
    else
    {
      v40 = v32;
      v34 = powf((float)(v33 + 0.055) / 1.055, 2.4);
      v32 = v40;
    }
    v41 = v32;
    *(float *)((unint64_t)&v41 & 0xFFFFFFFFFFFFFFF3 | (4 * (v11 & 3))) = v34;
    v35 = v41;
    v36 = v41;
    v36.i32[3] = v32.i32[3];
    ++v11;
    v32 = v36;
  }
  while (v11 != 3);
  v35.i32[3] = 1.0;
  a1[5] = v35;
  if (*a2 >= 3366400.0)
    *a2 = fmodf(*a2, 3366400.0);
  return 0;
}

uint64_t `anonymous namespace'::ring_updater_t<0ul,false,false>::function(float32x4_t *a1, float *a2)
{
  float v4;
  float v5;
  float32x2_t v6;
  float32x2_t v7;
  __float2 v8;
  float32x4_t v9;
  __float2 v10;
  float32x4_t v11;
  int32x4_t v12;
  int8x16_t v13;
  float32x4_t v14;
  float32x4_t v15;
  float32x4_t v17;
  float v18;

  v4 = *a2;
  v5 = (float)(*a2 / 1280.0) * 6.28318531;
  v6 = vrsqrte_f32((float32x2_t)0x40000000);
  v7 = vmul_f32(v6, vrsqrts_f32((float32x2_t)0x40000000, vmul_f32(v6, v6)));
  LODWORD(v18) = vmul_f32(v7, vrsqrts_f32((float32x2_t)0x40000000, vmul_f32(v7, v7))).u32[0];
  v8 = __sincosf_stret(v5 * 0.5);
  v9 = vmulq_n_f32(vmulq_n_f32((float32x4_t)xmmword_209E30FC0, v18), v8.__sinval);
  v9.i32[3] = LODWORD(v8.__cosval);
  v17 = v9;
  v9.f32[0] = (float)(v4 / 2630.0) * 6.28318531;
  v10 = __sincosf_stret(v9.f32[0] * 0.5);
  v11 = vmulq_n_f32(vmulq_n_f32((float32x4_t)xmmword_209E30FD0, v18), v10.__sinval);
  v12 = (int32x4_t)vnegq_f32(v17);
  v13 = (int8x16_t)vtrn2q_s32((int32x4_t)v17, vtrn1q_s32((int32x4_t)v17, v12));
  v14 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v17, (int8x16_t)v12, 8uLL), *(float32x2_t *)v11.f32, 1), (float32x4_t)vextq_s8(v13, v13, 8uLL), v11.f32[0]);
  v15 = (float32x4_t)vrev64q_s32((int32x4_t)v17);
  v15.i32[0] = v12.i32[1];
  v15.i32[3] = v12.i32[2];
  a1[1] = vaddq_f32(vmlaq_laneq_f32(vmulq_n_f32(v17, v10.__cosval), v15, v11, 2), v14);
  if (*a2 >= 3366400.0)
    *a2 = fmodf(*a2, 3366400.0);
  return 0;
}

uint64_t `anonymous namespace'::ring_updater_t<1ul,false,false>::function(float32x4_t *a1, float *a2)
{
  float v4;
  float v5;
  float32x2_t v6;
  float32x2_t v7;
  __float2 v8;
  float32x4_t v9;
  __float2 v10;
  float32x4_t v11;
  int32x4_t v12;
  int8x16_t v13;
  float32x4_t v14;
  float32x4_t v15;
  float32x4_t v17;
  float v18;

  v4 = *a2;
  v5 = (float)(*a2 / 1280.0) * 6.28318531;
  v6 = vrsqrte_f32((float32x2_t)0x40000000);
  v7 = vmul_f32(v6, vrsqrts_f32((float32x2_t)0x40000000, vmul_f32(v6, v6)));
  LODWORD(v18) = vmul_f32(v7, vrsqrts_f32((float32x2_t)0x40000000, vmul_f32(v7, v7))).u32[0];
  v8 = __sincosf_stret(v5 * 0.5);
  v9 = vmulq_n_f32(vmulq_n_f32((float32x4_t)xmmword_209E31030, v18), v8.__sinval);
  v9.i32[3] = LODWORD(v8.__cosval);
  v17 = v9;
  v9.f32[0] = (float)(v4 / 2630.0) * 6.28318531;
  v10 = __sincosf_stret(v9.f32[0] * 0.5);
  v11 = vmulq_n_f32(vmulq_n_f32((float32x4_t)xmmword_209E30FD0, v18), v10.__sinval);
  v12 = (int32x4_t)vnegq_f32(v17);
  v13 = (int8x16_t)vtrn2q_s32((int32x4_t)v17, vtrn1q_s32((int32x4_t)v17, v12));
  v14 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v17, (int8x16_t)v12, 8uLL), *(float32x2_t *)v11.f32, 1), (float32x4_t)vextq_s8(v13, v13, 8uLL), v11.f32[0]);
  v15 = (float32x4_t)vrev64q_s32((int32x4_t)v17);
  v15.i32[0] = v12.i32[1];
  v15.i32[3] = v12.i32[2];
  a1[1] = vaddq_f32(vmlaq_laneq_f32(vmulq_n_f32(v17, v10.__cosval), v15, v11, 2), v14);
  if (*a2 >= 3366400.0)
    *a2 = fmodf(*a2, 3366400.0);
  return 0;
}

uint64_t `anonymous namespace'::coplanar_ring_updater<false>::function(float32x4_t *a1, float *a2)
{
  float v3;
  float v5;
  __float2 v6;
  float32x4_t v7;

  v3 = *a2;
  if (*a2 >= 1000.0)
  {
    v3 = fmodf(v3, 1000.0);
    *a2 = v3;
  }
  v5 = v3 * 0.00628318531;
  v6 = __sincosf_stret(v5 * 0.5);
  v7 = vmulq_n_f32((float32x4_t)xmmword_209E31040, v6.__sinval);
  v7.i32[3] = LODWORD(v6.__cosval);
  a1[1] = v7;
  return 0;
}

BOOL LAUI_uniform_cubic_b_spline_renderer::animator_t<simd::quatf,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::set_target<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<simd::quatf>>(uint64_t a1, uint64_t a2, int a3)
{
  _OWORD *v6;
  int8x16_t v7;
  float v8;
  float v9;
  _OWORD *v10;
  __int128 v11;
  uint64_t v12;
  float32x4_t v13;
  __int128 v14;
  float32x4_t v15;
  _OWORD *v17;
  _OWORD v18[2];
  _BYTE v19[28];

  if (*(_DWORD *)(a1 + 88))
    std::variant<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<simd::quatf>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>::operator=[abi:ne180100]<std::monostate,0,std::monostate,0ul,0>(a1 + 80);
  v6 = (_OWORD *)(a2 + 16);
  v7 = (int8x16_t)vmulq_f32(*(float32x4_t *)a1, *(float32x4_t *)a2);
  v8 = vaddv_f32(vadd_f32(*(float32x2_t *)v7.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v7, v7, 8uLL)));
  if (v8 == 1.0)
  {
    LAUI_uniform_cubic_b_spline_renderer::animator_t<simd::quatf,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::set_timing(a1, (uint64_t)v6, a3);
  }
  else
  {
    v9 = *(float *)(a2 + 40);
    if (v9 >= 0.0)
    {
      *(_OWORD *)v19 = *v6;
      *(_QWORD *)&v19[16] = *(_QWORD *)(a2 + 32);
      *(_DWORD *)&v19[24] = 0;
      LAUI_uniform_cubic_b_spline_renderer::animator_t<simd::quatf,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::_set_timing(a1, (__int128 *)v19, *(float32x4_t *)v19);
      v13 = *(float32x4_t *)a2;
      v18[0] = *(_OWORD *)v19;
      *(_OWORD *)((char *)v18 + 12) = *(_OWORD *)&v19[12];
      v14 = v18[0];
      *(float32x4_t *)a1 = v13;
      *(_OWORD *)(a1 + 16) = v14;
      *(_OWORD *)(a1 + 28) = *(_OWORD *)((char *)v18 + 12);
      if (*(float *)(a1 + 32) <= 0.0)
      {
        v15 = *(float32x4_t *)a1;
        *(_OWORD *)(a1 + 48) = *(_OWORD *)a1;
        *(float32x4_t *)(a1 + 64) = v15;
      }
      else if (v9 > 0.0)
      {
        LAUI_uniform_cubic_b_spline_renderer::animator_t<simd::quatf,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::update(a1, v9);
      }
    }
    else
    {
      v10 = (_OWORD *)operator new();
      v11 = *(_OWORD *)(a2 + 16);
      *v10 = *(_OWORD *)a2;
      v10[1] = v11;
      v10[2] = *(_OWORD *)(a2 + 32);
      v17 = v10;
      std::__variant_detail::__assignment<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<simd::quatf>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>>::__assign_alt[abi:ne180100]<1ul,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<simd::quatf>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<simd::quatf>>>(a1 + 80, (uint64_t *)(a1 + 80), (uint64_t *)&v17);
      v12 = (uint64_t)v17;
      v17 = 0;
      if (v12)
        MEMORY[0x20BD1B2E8](v12, 0x1000C40FC2635F5);
    }
  }
  return v8 != 1.0;
}

void LAUI_uniform_cubic_b_spline_renderer::animator_t<simd::quatf,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::set_timing(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v6;
  float32x4_t v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  _OWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;

  if (*(_DWORD *)(a1 + 88))
    std::variant<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<simd::quatf>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>::operator=[abi:ne180100]<std::monostate,0,std::monostate,0ul,0>(a1 + 80);
  if (a3)
  {
    v17 = a1;
    v6 = *(unsigned int *)(a1 + 88);
    if ((_DWORD)v6 == -1)
      std::__throw_bad_variant_access[abi:ne180100]();
    v18 = &v17;
    if (((unsigned int (*)(uint64_t **, uint64_t))*(&off_24C27F008 + v6))(&v18, a1 + 80))
    {
      v8 = *(float *)(a1 + 40);
      v7.f32[0] = *(float *)(a1 + 32) - v8;
      v9 = *(float *)(a1 + 36) - v8;
      v10 = *(float *)(a2 + 24);
      v11 = *(float *)(a2 + 16) - v10;
      v12 = *(float *)(a2 + 20) - v10;
      if ((a3 & 2) != 0 && (v11 < v7.f32[0] || v12 < v9))
        goto LABEL_16;
      if ((a3 & 4) != 0 && (v11 > v7.f32[0] || v12 > v9))
      {
LABEL_16:
        if (v10 >= 0.0)
        {
          LAUI_uniform_cubic_b_spline_renderer::animator_t<simd::quatf,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::_set_timing(a1, (__int128 *)a2, v7);
        }
        else if ((float)(v7.f32[0] + v10) > 0.0)
        {
          v15 = (_OWORD *)operator new();
          *v15 = *(_OWORD *)a2;
          *(_OWORD *)((char *)v15 + 12) = *(_OWORD *)(a2 + 12);
          v18 = (uint64_t *)v15;
          std::__variant_detail::__assignment<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<simd::quatf>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>>::__assign_alt[abi:ne180100]<2ul,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>(a1 + 80, (uint64_t *)(a1 + 80), (uint64_t *)&v18);
          v16 = (uint64_t)v18;
          v18 = 0;
          if (v16)
            MEMORY[0x20BD1B2E8](v16, 0x1000C40CBDA3C1BLL);
        }
      }
    }
  }
}

void LAUI_uniform_cubic_b_spline_renderer::animator_t<simd::quatf,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::_set_timing(uint64_t a1, __int128 *a2, float32x4_t a3)
{
  float v3;
  float v6;
  uint64_t v7;
  float v8;
  unsigned int v9;
  BOOL v10;
  float32x4_t v12;
  float32x4_t v13;
  float v14;
  float32x4_t v15;
  float v16;
  float v17;
  float32x4_t v18;
  int8x16_t v19;
  float32x4_t v20;
  int8x16_t v21;
  float v22;
  float v23;
  BOOL v24;
  float v25;
  float v26;
  float32x2_t v27;
  float32x2_t v28;
  float v29;
  float32x4_t v30;
  float v31;
  float v32;
  float v33;
  float32x4_t v34;
  int8x16_t v35;
  float32x2_t v36;
  unsigned __int32 v37;
  float32x2_t v38;
  float32x2_t v39;
  __int128 v40;
  float32x4_t v41;
  float32x4_t v42;
  float v43;
  float v44;
  float32x4_t v45;
  float32x4_t v46;

  v3 = *((float *)a2 + 6);
  if (v3 < 0.0)
  {
    __break(1u);
    return;
  }
  v6 = *((float *)a2 + 4);
  v7 = a1 + 16;
  if (*(float *)(a1 + 32) > 0.0 && v6 > 0.0 && *(float *)v7 != *(float *)a2)
  {
    v8 = (float)(*(float *)a2 * (float)(1.0 - *(float *)v7)) / (float)(*(float *)v7 * (float)(1.0 - *(float *)a2));
    v9 = (COERCE_INT(fabs(v8)) - 0x800000) >> 24;
    v10 = v8 < 0.0 || v9 > 0x7E;
    if (!v10 || (LODWORD(v8) - 1) <= 0x7FFFFE)
    {
      v12 = *(float32x4_t *)(a1 + 48);
      v13 = vmulq_f32(v12, *(float32x4_t *)a1);
      *(float32x2_t *)v13.f32 = vadd_f32(*(float32x2_t *)v13.f32, (float32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v13, (int8x16_t)v13, 8uLL));
      v13.f32[0] = vaddv_f32(*(float32x2_t *)v13.f32);
      if (v13.f32[0] != 1.0)
      {
        v14 = 1.0 - v8;
        a3.i32[0] = 0;
        v15 = (float32x4_t)vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vmvnq_s8((int8x16_t)vcgeq_f32(v13, a3)), 0), (int8x16_t)vnegq_f32(*(float32x4_t *)a1), *(int8x16_t *)a1);
        v16 = 1.0;
        v17 = 1.0 - (float)(1.0 - v8);
        v18 = vsubq_f32(v12, v15);
        v19 = (int8x16_t)vmulq_f32(v18, v18);
        v45 = v15;
        v46 = *(float32x4_t *)(a1 + 48);
        v20 = vaddq_f32(v12, v15);
        v21 = (int8x16_t)vmulq_f32(v20, v20);
        v22 = atan2f(sqrtf(vaddv_f32(vadd_f32(*(float32x2_t *)v19.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v19, v19, 8uLL)))), sqrtf(vaddv_f32(vadd_f32(*(float32x2_t *)v21.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v21, v21, 8uLL)))));
        v23 = v22 + v22;
        v24 = (float)(v22 + v22) == 0.0;
        v25 = 1.0;
        if (!v24)
          v25 = sinf(v23) / v23;
        v26 = v25;
        v27 = vrecpe_f32((float32x2_t)LODWORD(v25));
        v28 = vmul_f32(v27, vrecps_f32((float32x2_t)LODWORD(v26), v27));
        LODWORD(v29) = vmul_f32(v28, vrecps_f32((float32x2_t)LODWORD(v26), v28)).u32[0];
        if ((float)(v17 * v23) != 0.0)
        {
          v43 = v29;
          v28.f32[0] = sinf(v17 * v23);
          v29 = v43;
          v16 = v28.f32[0] / (float)(v17 * v23);
        }
        v28.f32[0] = v17 * (float)(v29 * v16);
        v30 = (float32x4_t)vdupq_lane_s32((int32x2_t)v28, 0);
        v31 = v14 * v23;
        v32 = 1.0;
        if (v31 != 0.0)
        {
          v42 = v30;
          v44 = v29;
          v33 = sinf(v31);
          v30 = v42;
          v29 = v44;
          v32 = v33 / v31;
        }
        v34 = vmlaq_f32(vmulq_n_f32(v45, v14 * (float)(v29 * v32)), v46, v30);
        v35 = (int8x16_t)vmulq_f32(v34, v34);
        v36 = vadd_f32(*(float32x2_t *)v35.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v35, v35, 8uLL));
        if (vaddv_f32(v36) == 0.0)
        {
          v12 = (float32x4_t)xmmword_209E30C90;
        }
        else
        {
          v37 = vadd_f32(v36, (float32x2_t)vdup_lane_s32((int32x2_t)v36, 1)).u32[0];
          v38 = vrsqrte_f32((float32x2_t)v37);
          v39 = vmul_f32(v38, vrsqrts_f32((float32x2_t)v37, vmul_f32(v38, v38)));
          v12 = vmulq_n_f32(v34, vmul_f32(v39, vrsqrts_f32((float32x2_t)v37, vmul_f32(v39, v39))).f32[0]);
        }
      }
      *(float32x4_t *)(a1 + 48) = v12;
    }
  }
  v40 = *a2;
  *(_OWORD *)(v7 + 12) = *(__int128 *)((char *)a2 + 12);
  *(_OWORD *)v7 = v40;
  if (v3 <= 0.0)
  {
    if (v6 > 0.0)
      return;
  }
  else
  {
    *(_DWORD *)(a1 + 40) = 0;
    if (v6 > 0.0)
    {
      LAUI_uniform_cubic_b_spline_renderer::animator_t<simd::quatf,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::update(a1, v3);
      return;
    }
  }
  v41 = *(float32x4_t *)a1;
  *(_OWORD *)(a1 + 48) = *(_OWORD *)a1;
  *(float32x4_t *)(a1 + 64) = v41;
}

uint64_t LAUI_uniform_cubic_b_spline_renderer::animator_t<simd::quatf,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::update(uint64_t a1, float a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  __int16 v7;
  int v8;
  _QWORD v10[2];
  float v11;
  _QWORD *v12;

  v11 = a2;
  v12 = (_QWORD *)a1;
  v2 = *(unsigned int *)(a1 + 88);
  if ((_DWORD)v2 == -1)
    std::__throw_bad_variant_access[abi:ne180100]();
  v5 = a1 + 80;
  v10[0] = &v12;
  if (((unsigned int (*)(_QWORD *, uint64_t))*(&off_24C27F008 + v2))(v10, a1 + 80))
  {
    if (a2 == 0.0)
    {
      LOBYTE(v7) = 0;
      v8 = 0;
    }
    else
    {
      v10[0] = a1;
      v10[1] = &v11;
      v6 = *(unsigned int *)(a1 + 88);
      if ((_DWORD)v6 == -1)
        std::__throw_bad_variant_access[abi:ne180100]();
      v12 = v10;
      v7 = ((uint64_t (*)(_QWORD **, uint64_t))*(&off_24C27F020 + v6))(&v12, v5);
      v8 = HIBYTE(v7);
    }
  }
  else
  {
    LOBYTE(v7) = 1;
    v8 = 1;
  }
  return v7 | (v8 << 8);
}

uint64_t std::variant<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<simd::quatf>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>::operator=[abi:ne180100]<std::monostate,0,std::monostate,0ul,0>(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 8))
    std::__variant_detail::__assignment<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<simd::quatf>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>>::__emplace[abi:ne180100]<0ul,std::monostate>(a1);
  return a1;
}

uint64_t std::__variant_detail::__assignment<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<simd::quatf>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>>::__emplace[abi:ne180100]<0ul,std::monostate>(uint64_t a1)
{
  uint64_t v2;
  char v4;

  v2 = *(unsigned int *)(a1 + 8);
  if ((_DWORD)v2 != -1)
    ((void (*)(char *, uint64_t))*(&off_24C27EFA8 + v2))(&v4, a1);
  *(_DWORD *)(a1 + 8) = 0;
  return a1;
}

BOOL _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm0EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZNK36LAUI_uniform_cubic_b_spline_renderer10animator_tIN4simd5quatfELNS8_27animator_interpolation_typeE0EE12is_animatingEvEUlOT_E_EEJRKNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tISB_EENS_14default_deleteISO_EEEENSM_INS8_18animation_timing_tENSP_ISS_EEEEEEEEEEDcSE_DpT0_(uint64_t a1)
{
  return *(float *)(**(_QWORD **)a1 + 32) > 0.0;
}

uint64_t _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm1EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZNK36LAUI_uniform_cubic_b_spline_renderer10animator_tIN4simd5quatfELNS8_27animator_interpolation_typeE0EE12is_animatingEvEUlOT_E_EEJRKNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tISB_EENS_14default_deleteISO_EEEENSM_INS8_18animation_timing_tENSP_ISS_EEEEEEEEEEDcSE_DpT0_()
{
  return 1;
}

uint64_t _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm2EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZNK36LAUI_uniform_cubic_b_spline_renderer10animator_tIN4simd5quatfELNS8_27animator_interpolation_typeE0EE12is_animatingEvEUlOT_E_EEJRKNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tISB_EENS_14default_deleteISO_EEEENSM_INS8_18animation_timing_tENSP_ISS_EEEEEEEEEEDcSE_DpT0_()
{
  return 1;
}

uint64_t std::__variant_detail::__assignment<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<simd::quatf>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>>::__assign_alt[abi:ne180100]<2ul,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t result;

  if (*(_DWORD *)(a1 + 8) != 2)
    return std::__variant_detail::__assignment<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<simd::quatf>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>>::__emplace[abi:ne180100]<2ul,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>(a1, a3);
  v3 = *a3;
  *a3 = 0;
  result = *a2;
  *a2 = v3;
  if (result)
    JUMPOUT(0x20BD1B2E8);
  return result;
}

uint64_t std::__variant_detail::__assignment<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<simd::quatf>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>>::__emplace[abi:ne180100]<2ul,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  char v7;

  v4 = *(unsigned int *)(a1 + 8);
  if ((_DWORD)v4 != -1)
    ((void (*)(char *, uint64_t))*(&off_24C27EFA8 + v4))(&v7, a1);
  v5 = *a2;
  *a2 = 0;
  *(_QWORD *)a1 = v5;
  *(_DWORD *)(a1 + 8) = 2;
  return a1;
}

float *_ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm0EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIN4simd5quatfELNS8_27animator_interpolation_typeE0EE6updateEfEUlRT_E_EEJRNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tISB_EENS_14default_deleteISO_EEEENSM_INS8_18animation_timing_tENSP_ISS_EEEEEEEEEEDcSE_DpT0_(float ***a1)
{
  return LAUI_uniform_cubic_b_spline_renderer::animator_t<simd::quatf,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::_update(**a1, *(*a1)[1]);
}

uint64_t *_ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm1EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIN4simd5quatfELNS8_27animator_interpolation_typeE0EE6updateEfEUlRT_E_EEJRNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tISB_EENS_14default_deleteISO_EEEENSM_INS8_18animation_timing_tENSP_ISS_EEEEEEEEEEDcSE_DpT0_(uint64_t **a1, uint64_t *a2)
{
  return LAUI_uniform_cubic_b_spline_renderer::animator_t<simd::quatf,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::update(float)::{lambda(simd::quatf &)#1}::operator()<std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<simd::quatf>>>(*a1, a2);
}

uint64_t *_ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm2EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIN4simd5quatfELNS8_27animator_interpolation_typeE0EE6updateEfEUlRT_E_EEJRNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tISB_EENS_14default_deleteISO_EEEENSM_INS8_18animation_timing_tENSP_ISS_EEEEEEEEEEDcSE_DpT0_(uint64_t **a1, uint64_t *a2)
{
  return LAUI_uniform_cubic_b_spline_renderer::animator_t<simd::quatf,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::update(float)::{lambda(simd::quatf &)#1}::operator()<std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>(*a1, a2);
}

float *LAUI_uniform_cubic_b_spline_renderer::animator_t<simd::quatf,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::_update(float *result, float a2)
{
  float v3;
  float32x4_t *v4;
  float v5;
  float v6;
  float32x4_t v7;
  float32x4_t v8;
  float32x4_t v9;
  float32x4_t v10;
  float v11;
  float32x4_t v12;
  int8x16_t v13;
  float32x4_t v14;
  int8x16_t v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float32x2_t v20;
  float32x2_t v21;
  float v22;
  float v23;
  float32x2_t v24;
  float32x4_t v25;
  float v26;
  float v27;
  float32x4_t v28;
  int8x16_t v29;
  float32x2_t v30;
  float v31;
  float v32;
  float v33;
  float32x4_t v34;
  _BOOL4 v35;
  int v36;
  unsigned __int32 v37;
  float32x2_t v38;
  float32x2_t v39;
  float32x4_t v40;
  float32x4_t v41;
  float32x4_t v42;
  float32x4_t v43;
  float v44;
  float32x4_t v45;
  int8x16_t v46;
  float32x4_t v47;
  int8x16_t v48;
  float v49;
  float v50;
  float v51;
  float v52;
  float32x2_t v53;
  float32x2_t v54;
  float v55;
  float v56;
  float32x2_t v57;
  float32x4_t v58;
  float v59;
  float v60;
  float32x4_t v61;
  int8x16_t v62;
  float32x2_t v63;
  unsigned __int32 v64;
  float32x2_t v65;
  float32x2_t v66;
  float32x4_t v67;
  float32x4_t v68;
  float v69;
  float v70;
  float v71;
  float v72;
  float32x4_t v73;
  float32x4_t v74;
  float32x4_t v75;
  float32x4_t v76;

  v3 = result[8];
  if (v3 <= 0.0)
    goto LABEL_16;
  if (a2 >= 0.0)
  {
    v4 = (float32x4_t *)result;
    v5 = result[10] + a2;
    result[10] = v5;
    if (v5 < v3)
    {
      v6 = fmax((float)(1.0 - powf(result[4], a2)), 0.0);
      v7 = v4[3];
      v9 = vmulq_f32(v7, *v4);
      v8 = (float32x4_t)vextq_s8((int8x16_t)v9, (int8x16_t)v9, 8uLL);
      *(float32x2_t *)v9.f32 = vadd_f32(*(float32x2_t *)v9.f32, *(float32x2_t *)v8.f32);
      v9.f32[0] = vaddv_f32(*(float32x2_t *)v9.f32);
      if (v9.f32[0] != 1.0)
      {
        v8.i32[0] = 0;
        v10 = (float32x4_t)vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vmvnq_s8((int8x16_t)vcgeq_f32(v9, v8)), 0), (int8x16_t)vnegq_f32(*v4), *(int8x16_t *)v4);
        v11 = 1.0 - v6;
        v12 = vsubq_f32(v7, v10);
        v13 = (int8x16_t)vmulq_f32(v12, v12);
        v73 = v10;
        v75 = v4[3];
        v14 = vaddq_f32(v7, v10);
        v15 = (int8x16_t)vmulq_f32(v14, v14);
        v16 = atan2f(sqrtf(vaddv_f32(vadd_f32(*(float32x2_t *)v13.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v13, v13, 8uLL)))), sqrtf(vaddv_f32(vadd_f32(*(float32x2_t *)v15.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v15, v15, 8uLL)))));
        v17 = 1.0;
        v18 = v16 + v16;
        if ((float)(v16 + v16) != 0.0)
          v17 = sinf(v16 + v16) / v18;
        v19 = v17;
        v20 = vrecpe_f32((float32x2_t)LODWORD(v17));
        v21 = vmul_f32(v20, vrecps_f32((float32x2_t)LODWORD(v19), v20));
        v24 = vrecps_f32((float32x2_t)LODWORD(v19), v21);
        LODWORD(v22) = vmul_f32(v21, v24).u32[0];
        v23 = 1.0;
        v24.i32[0] = 1.0;
        if ((float)(v11 * v18) != 0.0)
        {
          v69 = v22;
          v24.f32[0] = sinf(v11 * v18);
          v22 = v69;
          v24.f32[0] = v24.f32[0] / (float)(v11 * v18);
        }
        v24.f32[0] = v11 * (float)(v22 * v24.f32[0]);
        v25 = (float32x4_t)vdupq_lane_s32((int32x2_t)v24, 0);
        v26 = v18 * v6;
        if (v26 != 0.0)
        {
          v67 = v25;
          v70 = v22;
          v27 = sinf(v26);
          v25 = v67;
          v22 = v70;
          v23 = v27 / v26;
        }
        v28 = vmlaq_f32(vmulq_n_f32(v73, (float)(v22 * v23) * v6), v75, v25);
        v29 = (int8x16_t)vmulq_f32(v28, v28);
        v30 = vadd_f32(*(float32x2_t *)v29.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v29, v29, 8uLL));
        if (vaddv_f32(v30) == 0.0)
        {
          v7 = (float32x4_t)xmmword_209E30C90;
        }
        else
        {
          v37 = vadd_f32(v30, (float32x2_t)vdup_lane_s32((int32x2_t)v30, 1)).u32[0];
          v38 = vrsqrte_f32((float32x2_t)v37);
          v39 = vmul_f32(v38, vrsqrts_f32((float32x2_t)v37, vmul_f32(v38, v38)));
          v7 = vmulq_n_f32(v28, vmul_f32(v39, vrsqrts_f32((float32x2_t)v37, vmul_f32(v39, v39))).f32[0]);
        }
      }
      v4[3] = v7;
      v40 = v4[4];
      v42 = vmulq_f32(v7, v40);
      v41 = (float32x4_t)vextq_s8((int8x16_t)v42, (int8x16_t)v42, 8uLL);
      *(float32x2_t *)v42.f32 = vadd_f32(*(float32x2_t *)v42.f32, *(float32x2_t *)v41.f32);
      v42.f32[0] = vaddv_f32(*(float32x2_t *)v42.f32);
      if (v42.f32[0] != 1.0)
      {
        v41.i32[0] = 0;
        v43 = (float32x4_t)vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vmvnq_s8((int8x16_t)vcgeq_f32(v42, v41)), 0), (int8x16_t)vnegq_f32(v7), (int8x16_t)v7);
        v44 = 1.0 - v6;
        v45 = vsubq_f32(v40, v43);
        v46 = (int8x16_t)vmulq_f32(v45, v45);
        v74 = v43;
        v76 = v4[4];
        v47 = vaddq_f32(v40, v43);
        v48 = (int8x16_t)vmulq_f32(v47, v47);
        v49 = atan2f(sqrtf(vaddv_f32(vadd_f32(*(float32x2_t *)v46.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v46, v46, 8uLL)))), sqrtf(vaddv_f32(vadd_f32(*(float32x2_t *)v48.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v48, v48, 8uLL)))));
        v50 = 1.0;
        v51 = v49 + v49;
        if ((float)(v49 + v49) != 0.0)
          v50 = sinf(v49 + v49) / v51;
        v52 = v50;
        v53 = vrecpe_f32((float32x2_t)LODWORD(v50));
        v54 = vmul_f32(v53, vrecps_f32((float32x2_t)LODWORD(v52), v53));
        v57 = vrecps_f32((float32x2_t)LODWORD(v52), v54);
        LODWORD(v55) = vmul_f32(v54, v57).u32[0];
        v56 = 1.0;
        v57.i32[0] = 1.0;
        if ((float)(v44 * v51) != 0.0)
        {
          v71 = v55;
          v57.f32[0] = sinf(v44 * v51);
          v55 = v71;
          v57.f32[0] = v57.f32[0] / (float)(v44 * v51);
        }
        v57.f32[0] = v44 * (float)(v55 * v57.f32[0]);
        v58 = (float32x4_t)vdupq_lane_s32((int32x2_t)v57, 0);
        v59 = v51 * v6;
        if (v59 != 0.0)
        {
          v68 = v58;
          v72 = v55;
          v60 = sinf(v59);
          v58 = v68;
          v55 = v72;
          v56 = v60 / v59;
        }
        v61 = vmlaq_f32(vmulq_n_f32(v74, (float)(v55 * v56) * v6), v76, v58);
        v62 = (int8x16_t)vmulq_f32(v61, v61);
        v63 = vadd_f32(*(float32x2_t *)v62.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v62, v62, 8uLL));
        if (vaddv_f32(v63) == 0.0)
        {
          v40 = (float32x4_t)xmmword_209E30C90;
        }
        else
        {
          v64 = vadd_f32(v63, (float32x2_t)vdup_lane_s32((int32x2_t)v63, 1)).u32[0];
          v65 = vrsqrte_f32((float32x2_t)v64);
          v66 = vmul_f32(v65, vrsqrts_f32((float32x2_t)v64, vmul_f32(v65, v65)));
          v40 = vmulq_n_f32(v61, vmul_f32(v66, vrsqrts_f32((float32x2_t)v64, vmul_f32(v66, v66))).f32[0]);
        }
      }
      v36 = 0;
      v4[4] = v40;
      v35 = v5 >= v4[2].f32[1];
      return (float *)(v35 | (v36 << 8));
    }
    v31 = nexttowardf(1.0, 0.0);
    v32 = 0.0;
    v33 = fmaxf(fminf(v31, 0.0), 0.0);
    if (v33 > 0.0)
      v32 = INFINITY;
    v4[1].f32[0] = v33;
    v4[1].i8[4] = 0;
    v4[1].i8[12] = 0;
    v4[2].f32[0] = v32;
    v4[2].f32[1] = v32;
    v4[2].i32[2] = 0;
    v34 = *v4;
    v4[3] = *v4;
    v4[4] = v34;
LABEL_16:
    v35 = 1;
    v36 = 1;
    return (float *)(v35 | (v36 << 8));
  }
  __break(1u);
  return result;
}

uint64_t *LAUI_uniform_cubic_b_spline_renderer::animator_t<simd::quatf,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::update(float)::{lambda(simd::quatf &)#1}::operator()<std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<simd::quatf>>>(uint64_t *result, uint64_t *a2)
{
  float *v2;
  uint64_t v4;
  uint64_t v5;
  float v6;
  __int16 v7;
  int v8;
  float v9;
  uint64_t v10;

  v2 = (float *)result[1];
  if (*v2 < 0.0)
  {
    __break(1u);
  }
  else
  {
    v4 = *result;
    v5 = *a2;
    v6 = *v2 + *(float *)(*a2 + 40);
    *(float *)(*a2 + 40) = v6;
    if (v6 >= 0.0)
    {
      *(_DWORD *)(v5 + 40) = 0;
      v9 = fmax((float)(*v2 - v6), 0.0);
      LAUI_uniform_cubic_b_spline_renderer::animator_t<simd::quatf,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::_update((float *)v4, v9);
      v10 = *a2;
      *a2 = 0;
      if (*(_DWORD *)(v4 + 88))
        std::variant<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<simd::quatf>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>::operator=[abi:ne180100]<std::monostate,0,std::monostate,0ul,0>(v4 + 80);
      LAUI_uniform_cubic_b_spline_renderer::animator_t<simd::quatf,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::set_target<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<simd::quatf>>(v4, v10, 6);
      MEMORY[0x20BD1B2E8](v10, 0x1000C40FC2635F5);
      v7 = LAUI_uniform_cubic_b_spline_renderer::animator_t<simd::quatf,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::update(v4, v6);
      v8 = HIBYTE(v7);
    }
    else
    {
      LAUI_uniform_cubic_b_spline_renderer::animator_t<simd::quatf,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::_update((float *)v4, *v2);
      LOBYTE(v7) = 0;
      v8 = 0;
    }
    return (uint64_t *)(v7 | (v8 << 8));
  }
  return result;
}

void sub_209E28C6C(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (v1)
    MEMORY[0x20BD1B2E8](v1, 0x1000C40FC2635F5);
  _Unwind_Resume(exception_object);
}

uint64_t *LAUI_uniform_cubic_b_spline_renderer::animator_t<simd::quatf,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::update(float)::{lambda(simd::quatf &)#1}::operator()<std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>(uint64_t *result, uint64_t *a2)
{
  float *v2;
  uint64_t v4;
  uint64_t v5;
  float v6;
  __int16 v7;
  int v8;
  float v9;
  uint64_t v10;

  v2 = (float *)result[1];
  if (*v2 < 0.0)
  {
    __break(1u);
  }
  else
  {
    v4 = *result;
    v5 = *a2;
    v6 = *v2 + *(float *)(*a2 + 24);
    *(float *)(*a2 + 24) = v6;
    if (v6 >= 0.0)
    {
      *(_DWORD *)(v5 + 24) = 0;
      v9 = fmax((float)(*v2 - v6), 0.0);
      LAUI_uniform_cubic_b_spline_renderer::animator_t<simd::quatf,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::_update((float *)v4, v9);
      v10 = *a2;
      *a2 = 0;
      if (*(_DWORD *)(v4 + 88))
        std::variant<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<simd::quatf>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>::operator=[abi:ne180100]<std::monostate,0,std::monostate,0ul,0>(v4 + 80);
      LAUI_uniform_cubic_b_spline_renderer::animator_t<simd::quatf,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::set_timing(v4, v10, 6);
      MEMORY[0x20BD1B2E8](v10, 0x1000C40CBDA3C1BLL);
      v7 = LAUI_uniform_cubic_b_spline_renderer::animator_t<simd::quatf,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::update(v4, v6);
      v8 = HIBYTE(v7);
    }
    else
    {
      LAUI_uniform_cubic_b_spline_renderer::animator_t<simd::quatf,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::_update((float *)v4, *v2);
      LOBYTE(v7) = 0;
      v8 = 0;
    }
    return (uint64_t *)(v7 | (v8 << 8));
  }
  return result;
}

uint64_t std::__variant_detail::__assignment<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<simd::quatf>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>>::__assign_alt[abi:ne180100]<1ul,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<simd::quatf>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<simd::quatf>>>(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t result;

  if (*(_DWORD *)(a1 + 8) != 1)
    return std::__variant_detail::__assignment<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<simd::quatf>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>>::__emplace[abi:ne180100]<1ul,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<simd::quatf>>>(a1, a3);
  v3 = *a3;
  *a3 = 0;
  result = *a2;
  *a2 = v3;
  if (result)
    JUMPOUT(0x20BD1B2E8);
  return result;
}

uint64_t std::__variant_detail::__assignment<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<simd::quatf>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>>::__emplace[abi:ne180100]<1ul,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<simd::quatf>>>(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  char v7;

  v4 = *(unsigned int *)(a1 + 8);
  if ((_DWORD)v4 != -1)
    ((void (*)(char *, uint64_t))*(&off_24C27EFA8 + v4))(&v7, a1);
  v5 = *a2;
  *a2 = 0;
  *(_QWORD *)a1 = v5;
  *(_DWORD *)(a1 + 8) = 1;
  return a1;
}

BOOL _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv4_fLNS_27animator_interpolation_typeE0EE10set_targetINS_18animation_target_tIS1_EEEEbOT_NS_25animation_target_option_tE(uint64_t a1, uint64_t a2, int a3)
{
  _OWORD *v6;
  int8x16_t v7;
  float v8;
  float v9;
  _OWORD *v10;
  __int128 v11;
  uint64_t v12;
  float32x4_t v13;
  __int128 v14;
  _BYTE v16[28];

  if (*(_DWORD *)(a1 + 88))
    _ZNSt3__17variantIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv4_fEENS_14default_deleteIS6_EEEENS2_INS3_18animation_timing_tENS7_ISA_EEEEEEaSB8ne180100IS1_Li0ES1_Lm0ELi0EEERSD_OT_(a1 + 80);
  v6 = (_OWORD *)(a2 + 16);
  v7 = (int8x16_t)vmulq_f32(*(float32x4_t *)a1, *(float32x4_t *)a2);
  v8 = vaddv_f32(vadd_f32(*(float32x2_t *)v7.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v7, v7, 8uLL)));
  if (v8 == 1.0)
  {
    _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv4_fLNS_27animator_interpolation_typeE0EE10set_timingERKNS_18animation_timing_tENS_25animation_target_option_tE(a1, (uint64_t)v6, a3);
  }
  else
  {
    v9 = *(float *)(a2 + 40);
    if (v9 >= 0.0)
    {
      *(_OWORD *)v16 = *v6;
      *(_QWORD *)&v16[16] = *(_QWORD *)(a2 + 32);
      *(_DWORD *)&v16[24] = 0;
      _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv4_fLNS_27animator_interpolation_typeE0EE11_set_timingERKNS_18animation_timing_tE(a1, (__int128 *)v16);
      v13 = *(float32x4_t *)a2;
      *(_OWORD *)(a1 + 28) = *(_OWORD *)&v16[12];
      v14 = *(_OWORD *)v16;
      *(float32x4_t *)a1 = v13;
      *(_OWORD *)(a1 + 16) = v14;
      if (*(float *)(a1 + 32) <= 0.0)
      {
        *(float32x4_t *)(a1 + 48) = v13;
        *(float32x4_t *)(a1 + 64) = v13;
      }
      else if (v9 > 0.0)
      {
        _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv4_fLNS_27animator_interpolation_typeE0EE6updateEf(a1, v9);
      }
    }
    else
    {
      v10 = (_OWORD *)operator new();
      v11 = *(_OWORD *)(a2 + 16);
      *v10 = *(_OWORD *)a2;
      v10[1] = v11;
      v10[2] = *(_OWORD *)(a2 + 32);
      *(_QWORD *)v16 = v10;
      _ZNSt3__116__variant_detail12__assignmentINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv4_fEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEEE12__assign_altB8ne180100ILm1ESB_SB_EEvRNS0_5__altIXT_ET0_EEOT1_(a1 + 80, (uint64_t *)(a1 + 80), (uint64_t *)v16);
      v12 = *(_QWORD *)v16;
      *(_QWORD *)v16 = 0;
      if (v12)
        MEMORY[0x20BD1B2E8](v12, 0x1000C40FC2635F5);
    }
  }
  return v8 != 1.0;
}

uint64_t _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv4_fLNS_27animator_interpolation_typeE0EE10set_timingERKNS_18animation_timing_tENS_25animation_target_option_tE(uint64_t result, uint64_t a2, int a3)
{
  uint64_t v5;
  uint64_t v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  _OWORD *v15;
  uint64_t v16;
  uint64_t *v17;

  v5 = result;
  if (*(_DWORD *)(result + 88))
    result = _ZNSt3__17variantIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv4_fEENS_14default_deleteIS6_EEEENS2_INS3_18animation_timing_tENS7_ISA_EEEEEEaSB8ne180100IS1_Li0ES1_Lm0ELi0EEERSD_OT_(result + 80);
  if (a3)
  {
    v16 = v5;
    v6 = *(unsigned int *)(v5 + 88);
    if ((_DWORD)v6 == -1)
      std::__throw_bad_variant_access[abi:ne180100]();
    v17 = &v16;
    result = ((uint64_t (*)(uint64_t **, uint64_t))*(&off_24C27F038 + v6))(&v17, v5 + 80);
    if ((_DWORD)result)
    {
      v7 = *(float *)(v5 + 40);
      v8 = *(float *)(v5 + 32) - v7;
      v9 = *(float *)(v5 + 36) - v7;
      v10 = *(float *)(a2 + 24);
      v11 = *(float *)(a2 + 16) - v10;
      v12 = *(float *)(a2 + 20) - v10;
      if ((a3 & 2) != 0 && (v11 < v8 || v12 < v9))
        goto LABEL_16;
      if ((a3 & 4) != 0 && (v11 > v8 || v12 > v9))
      {
LABEL_16:
        if (v10 >= 0.0)
        {
          return _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv4_fLNS_27animator_interpolation_typeE0EE11_set_timingERKNS_18animation_timing_tE(v5, (__int128 *)a2);
        }
        else if ((float)(v8 + v10) > 0.0)
        {
          v15 = (_OWORD *)operator new();
          *v15 = *(_OWORD *)a2;
          *(_OWORD *)((char *)v15 + 12) = *(_OWORD *)(a2 + 12);
          v17 = (uint64_t *)v15;
          _ZNSt3__116__variant_detail12__assignmentINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv4_fEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEEE12__assign_altB8ne180100ILm2ESE_SE_EEvRNS0_5__altIXT_ET0_EEOT1_(v5 + 80, (uint64_t *)(v5 + 80), (uint64_t *)&v17);
          result = (uint64_t)v17;
          v17 = 0;
          if (result)
            return MEMORY[0x20BD1B2E8](result, 0x1000C40CBDA3C1BLL);
        }
      }
    }
  }
  return result;
}

uint64_t _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv4_fLNS_27animator_interpolation_typeE0EE11_set_timingERKNS_18animation_timing_tE(uint64_t result, __int128 *a2)
{
  float v2;
  float v3;
  float *v4;
  float v5;
  BOOL v6;
  float32x4_t v8;
  int8x16_t v9;
  __int128 v10;
  float32x4_t v11;

  v2 = *((float *)a2 + 6);
  if (v2 < 0.0)
  {
    __break(1u);
    return result;
  }
  v3 = *((float *)a2 + 4);
  v4 = (float *)(result + 16);
  if (*(float *)(result + 32) > 0.0 && v3 > 0.0 && *v4 != *(float *)a2)
  {
    v5 = (float)(*(float *)a2 * (float)(1.0 - *v4)) / (float)(*v4 * (float)(1.0 - *(float *)a2));
    v6 = v5 < 0.0
      || (COERCE_INT(fabs((float)(*(float *)a2 * (float)(1.0 - *v4)) / (float)(*v4
                                                                                           * (float)(1.0 - *(float *)a2))))
                      - 0x800000) >> 24 > 0x7E;
    if (!v6 || (LODWORD(v5) - 1) <= 0x7FFFFE)
    {
      v8 = *(float32x4_t *)(result + 48);
      v9 = (int8x16_t)vmulq_f32(v8, *(float32x4_t *)result);
      if (vaddv_f32(vadd_f32(*(float32x2_t *)v9.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v9, v9, 8uLL))) != 1.0)
        v8 = vmlaq_n_f32(vmulq_n_f32(*(float32x4_t *)result, 1.0 - v5), v8, 1.0 - (float)(1.0 - v5));
      *(float32x4_t *)(result + 48) = v8;
    }
  }
  v10 = *a2;
  *(_OWORD *)(result + 28) = *(__int128 *)((char *)a2 + 12);
  *(_OWORD *)v4 = v10;
  if (v2 <= 0.0)
  {
    if (v3 > 0.0)
      return result;
  }
  else
  {
    *(_DWORD *)(result + 40) = 0;
    if (v3 > 0.0)
      return _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv4_fLNS_27animator_interpolation_typeE0EE6updateEf(result, v2);
  }
  v11 = *(float32x4_t *)result;
  *(_OWORD *)(result + 48) = *(_OWORD *)result;
  *(float32x4_t *)(result + 64) = v11;
  return result;
}

uint64_t _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv4_fLNS_27animator_interpolation_typeE0EE6updateEf(uint64_t a1, float a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  __int16 v7;
  int v8;
  _QWORD v10[2];
  float v11;
  _QWORD *v12;

  v11 = a2;
  v12 = (_QWORD *)a1;
  v2 = *(unsigned int *)(a1 + 88);
  if ((_DWORD)v2 == -1)
    std::__throw_bad_variant_access[abi:ne180100]();
  v5 = a1 + 80;
  v10[0] = &v12;
  if (((unsigned int (*)(_QWORD *, uint64_t))*(&off_24C27F038 + v2))(v10, a1 + 80))
  {
    if (a2 == 0.0)
    {
      LOBYTE(v7) = 0;
      v8 = 0;
    }
    else
    {
      v10[0] = a1;
      v10[1] = &v11;
      v6 = *(unsigned int *)(a1 + 88);
      if ((_DWORD)v6 == -1)
        std::__throw_bad_variant_access[abi:ne180100]();
      v12 = v10;
      v7 = ((uint64_t (*)(_QWORD **, uint64_t))*(&off_24C27F050 + v6))(&v12, v5);
      v8 = HIBYTE(v7);
    }
  }
  else
  {
    LOBYTE(v7) = 1;
    v8 = 1;
  }
  return v7 | (v8 << 8);
}

uint64_t _ZNSt3__17variantIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv4_fEENS_14default_deleteIS6_EEEENS2_INS3_18animation_timing_tENS7_ISA_EEEEEEaSB8ne180100IS1_Li0ES1_Lm0ELi0EEERSD_OT_(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 8))
    _ZNSt3__116__variant_detail12__assignmentINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv4_fEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEEE9__emplaceB8ne180100ILm0EJS3_EEERDaDpOT0_(a1);
  return a1;
}

uint64_t _ZNSt3__116__variant_detail12__assignmentINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv4_fEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEEE9__emplaceB8ne180100ILm0EJS3_EEERDaDpOT0_(uint64_t a1)
{
  uint64_t v2;
  char v4;

  v2 = *(unsigned int *)(a1 + 8);
  if ((_DWORD)v2 != -1)
    ((void (*)(char *, uint64_t))*(&off_24C27EFD8 + v2))(&v4, a1);
  *(_DWORD *)(a1 + 8) = 0;
  return a1;
}

BOOL _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm0EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZNK36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv4_fLNS8_27animator_interpolation_typeE0EE12is_animatingEvEUlOT_E_EEJRKNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tISA_EENS_14default_deleteISN_EEEENSL_INS8_18animation_timing_tENSO_ISR_EEEEEEEEEEDcSD_DpT0_(uint64_t a1)
{
  return *(float *)(**(_QWORD **)a1 + 32) > 0.0;
}

uint64_t _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm1EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZNK36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv4_fLNS8_27animator_interpolation_typeE0EE12is_animatingEvEUlOT_E_EEJRKNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tISA_EENS_14default_deleteISN_EEEENSL_INS8_18animation_timing_tENSO_ISR_EEEEEEEEEEDcSD_DpT0_()
{
  return 1;
}

uint64_t _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm2EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZNK36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv4_fLNS8_27animator_interpolation_typeE0EE12is_animatingEvEUlOT_E_EEJRKNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tISA_EENS_14default_deleteISN_EEEENSL_INS8_18animation_timing_tENSO_ISR_EEEEEEEEEEDcSD_DpT0_()
{
  return 1;
}

uint64_t _ZNSt3__116__variant_detail12__assignmentINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv4_fEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEEE12__assign_altB8ne180100ILm2ESE_SE_EEvRNS0_5__altIXT_ET0_EEOT1_(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t result;

  if (*(_DWORD *)(a1 + 8) != 2)
    return _ZNSt3__116__variant_detail12__assignmentINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv4_fEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEEE9__emplaceB8ne180100ILm2EJSE_EEERDaDpOT0_(a1, a3);
  v3 = *a3;
  *a3 = 0;
  result = *a2;
  *a2 = v3;
  if (result)
    JUMPOUT(0x20BD1B2E8);
  return result;
}

uint64_t _ZNSt3__116__variant_detail12__assignmentINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv4_fEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEEE9__emplaceB8ne180100ILm2EJSE_EEERDaDpOT0_(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  char v7;

  v4 = *(unsigned int *)(a1 + 8);
  if ((_DWORD)v4 != -1)
    ((void (*)(char *, uint64_t))*(&off_24C27EFD8 + v4))(&v7, a1);
  v5 = *a2;
  *a2 = 0;
  *(_QWORD *)a1 = v5;
  *(_DWORD *)(a1 + 8) = 2;
  return a1;
}

float *_ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm0EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv4_fLNS8_27animator_interpolation_typeE0EE6updateEfEUlRT_E_EEJRNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tISA_EENS_14default_deleteISN_EEEENSL_INS8_18animation_timing_tENSO_ISR_EEEEEEEEEEDcSD_DpT0_(float ***a1)
{
  return _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv4_fLNS_27animator_interpolation_typeE0EE7_updateEf(**a1, *(*a1)[1]);
}

uint64_t *_ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm1EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv4_fLNS8_27animator_interpolation_typeE0EE6updateEfEUlRT_E_EEJRNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tISA_EENS_14default_deleteISN_EEEENSL_INS8_18animation_timing_tENSO_ISR_EEEEEEEEEEDcSD_DpT0_(uint64_t **a1, uint64_t *a2)
{
  return _ZZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv4_fLNS_27animator_interpolation_typeE0EE6updateEfENKUlRT_E_clINSt3__110unique_ptrINS_18animation_target_tIS1_EENS8_14default_deleteISB_EEEEEENS_15animator_statusES5_(*a1, a2);
}

uint64_t *_ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm2EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv4_fLNS8_27animator_interpolation_typeE0EE6updateEfEUlRT_E_EEJRNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tISA_EENS_14default_deleteISN_EEEENSL_INS8_18animation_timing_tENSO_ISR_EEEEEEEEEEDcSD_DpT0_(uint64_t **a1, uint64_t *a2)
{
  return _ZZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv4_fLNS_27animator_interpolation_typeE0EE6updateEfENKUlRT_E_clINSt3__110unique_ptrINS_18animation_timing_tENS8_14default_deleteISA_EEEEEENS_15animator_statusES5_(*a1, a2);
}

float *_ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv4_fLNS_27animator_interpolation_typeE0EE7_updateEf(float *result, float a2)
{
  float v3;
  float32x4_t *v4;
  float v5;
  float v6;
  float32x4_t v7;
  int8x16_t v8;
  float32x4_t v9;
  int8x16_t v10;
  int v11;
  _BOOL4 v12;
  float v13;
  float v14;
  float v15;
  float32x4_t v16;

  v3 = result[8];
  if (v3 <= 0.0)
    goto LABEL_12;
  if (a2 >= 0.0)
  {
    v4 = (float32x4_t *)result;
    v5 = result[10] + a2;
    result[10] = v5;
    if (v5 < v3)
    {
      v6 = fmax((float)(1.0 - powf(result[4], a2)), 0.0);
      v7 = v4[3];
      v8 = (int8x16_t)vmulq_f32(v7, *v4);
      if (vaddv_f32(vadd_f32(*(float32x2_t *)v8.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v8, v8, 8uLL))) != 1.0)
        v7 = vmlaq_n_f32(vmulq_n_f32(*v4, v6), v7, 1.0 - v6);
      v4[3] = v7;
      v9 = v4[4];
      v10 = (int8x16_t)vmulq_f32(v7, v9);
      if (vaddv_f32(vadd_f32(*(float32x2_t *)v10.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v10, v10, 8uLL))) != 1.0)
        v9 = vmlaq_n_f32(vmulq_n_f32(v7, v6), v9, 1.0 - v6);
      v11 = 0;
      v4[4] = v9;
      v12 = v5 >= v4[2].f32[1];
      return (float *)(v12 | (v11 << 8));
    }
    v13 = nexttowardf(1.0, 0.0);
    v14 = 0.0;
    v15 = fmaxf(fminf(v13, 0.0), 0.0);
    if (v15 > 0.0)
      v14 = INFINITY;
    v4[1].f32[0] = v15;
    v4[1].i8[4] = 0;
    v4[1].i8[12] = 0;
    v4[2].f32[0] = v14;
    v4[2].f32[1] = v14;
    v4[2].i32[2] = 0;
    v16 = *v4;
    v4[3] = *v4;
    v4[4] = v16;
LABEL_12:
    v12 = 1;
    v11 = 1;
    return (float *)(v12 | (v11 << 8));
  }
  __break(1u);
  return result;
}

uint64_t *_ZZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv4_fLNS_27animator_interpolation_typeE0EE6updateEfENKUlRT_E_clINSt3__110unique_ptrINS_18animation_target_tIS1_EENS8_14default_deleteISB_EEEEEENS_15animator_statusES5_(uint64_t *result, uint64_t *a2)
{
  float *v2;
  uint64_t v4;
  uint64_t v5;
  float v6;
  __int16 v7;
  int v8;
  float v9;
  uint64_t v10;

  v2 = (float *)result[1];
  if (*v2 < 0.0)
  {
    __break(1u);
  }
  else
  {
    v4 = *result;
    v5 = *a2;
    v6 = *v2 + *(float *)(*a2 + 40);
    *(float *)(*a2 + 40) = v6;
    if (v6 >= 0.0)
    {
      *(_DWORD *)(v5 + 40) = 0;
      v9 = fmax((float)(*v2 - v6), 0.0);
      _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv4_fLNS_27animator_interpolation_typeE0EE7_updateEf((float *)v4, v9);
      v10 = *a2;
      *a2 = 0;
      if (*(_DWORD *)(v4 + 88))
        _ZNSt3__17variantIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv4_fEENS_14default_deleteIS6_EEEENS2_INS3_18animation_timing_tENS7_ISA_EEEEEEaSB8ne180100IS1_Li0ES1_Lm0ELi0EEERSD_OT_(v4 + 80);
      _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv4_fLNS_27animator_interpolation_typeE0EE10set_targetINS_18animation_target_tIS1_EEEEbOT_NS_25animation_target_option_tE(v4, v10, 6);
      MEMORY[0x20BD1B2E8](v10, 0x1000C40FC2635F5);
      v7 = _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv4_fLNS_27animator_interpolation_typeE0EE6updateEf(v4, v6);
      v8 = HIBYTE(v7);
    }
    else
    {
      _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv4_fLNS_27animator_interpolation_typeE0EE7_updateEf((float *)v4, *v2);
      LOBYTE(v7) = 0;
      v8 = 0;
    }
    return (uint64_t *)(v7 | (v8 << 8));
  }
  return result;
}

void sub_209E29690(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (v1)
    MEMORY[0x20BD1B2E8](v1, 0x1000C40FC2635F5);
  _Unwind_Resume(exception_object);
}

uint64_t *_ZZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv4_fLNS_27animator_interpolation_typeE0EE6updateEfENKUlRT_E_clINSt3__110unique_ptrINS_18animation_timing_tENS8_14default_deleteISA_EEEEEENS_15animator_statusES5_(uint64_t *result, uint64_t *a2)
{
  float *v2;
  uint64_t v4;
  uint64_t v5;
  float v6;
  __int16 v7;
  int v8;
  float v9;
  uint64_t v10;

  v2 = (float *)result[1];
  if (*v2 < 0.0)
  {
    __break(1u);
  }
  else
  {
    v4 = *result;
    v5 = *a2;
    v6 = *v2 + *(float *)(*a2 + 24);
    *(float *)(*a2 + 24) = v6;
    if (v6 >= 0.0)
    {
      *(_DWORD *)(v5 + 24) = 0;
      v9 = fmax((float)(*v2 - v6), 0.0);
      _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv4_fLNS_27animator_interpolation_typeE0EE7_updateEf((float *)v4, v9);
      v10 = *a2;
      *a2 = 0;
      if (*(_DWORD *)(v4 + 88))
        _ZNSt3__17variantIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv4_fEENS_14default_deleteIS6_EEEENS2_INS3_18animation_timing_tENS7_ISA_EEEEEEaSB8ne180100IS1_Li0ES1_Lm0ELi0EEERSD_OT_(v4 + 80);
      _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv4_fLNS_27animator_interpolation_typeE0EE10set_timingERKNS_18animation_timing_tENS_25animation_target_option_tE(v4, v10, 6);
      MEMORY[0x20BD1B2E8](v10, 0x1000C40CBDA3C1BLL);
      v7 = _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv4_fLNS_27animator_interpolation_typeE0EE6updateEf(v4, v6);
      v8 = HIBYTE(v7);
    }
    else
    {
      _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv4_fLNS_27animator_interpolation_typeE0EE7_updateEf((float *)v4, *v2);
      LOBYTE(v7) = 0;
      v8 = 0;
    }
    return (uint64_t *)(v7 | (v8 << 8));
  }
  return result;
}

uint64_t _ZNSt3__116__variant_detail12__assignmentINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv4_fEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEEE12__assign_altB8ne180100ILm1ESB_SB_EEvRNS0_5__altIXT_ET0_EEOT1_(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t result;

  if (*(_DWORD *)(a1 + 8) != 1)
    return _ZNSt3__116__variant_detail12__assignmentINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv4_fEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEEE9__emplaceB8ne180100ILm1EJSB_EEERDaDpOT0_(a1, a3);
  v3 = *a3;
  *a3 = 0;
  result = *a2;
  *a2 = v3;
  if (result)
    JUMPOUT(0x20BD1B2E8);
  return result;
}

uint64_t _ZNSt3__116__variant_detail12__assignmentINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv4_fEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEEE9__emplaceB8ne180100ILm1EJSB_EEERDaDpOT0_(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  char v7;

  v4 = *(unsigned int *)(a1 + 8);
  if ((_DWORD)v4 != -1)
    ((void (*)(char *, uint64_t))*(&off_24C27EFD8 + v4))(&v7, a1);
  v5 = *a2;
  *a2 = 0;
  *(_QWORD *)a1 = v5;
  *(_DWORD *)(a1 + 8) = 1;
  return a1;
}

uint64_t *std::vector<`anonymous namespace'::face_id_animator_t::quadrant_context_t>::__swap_out_circular_buffer(uint64_t *result, _QWORD *a2)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v3 = result;
  v5 = *result;
  v4 = result[1];
  v6 = a2[1];
  if (v4 != *result)
  {
    v7 = 0;
    do
    {
      v8 = v6 + v7;
      v9 = v4 + v7;
      *(_QWORD *)(v8 - 240) = *(_QWORD *)(v4 + v7 - 240);
      *(_QWORD *)(v8 - 232) = 0;
      *(_QWORD *)(v8 - 224) = 0;
      *(_QWORD *)(v8 - 216) = 0;
      *(_OWORD *)(v8 - 232) = *(_OWORD *)(v4 + v7 - 232);
      v10 = *(_QWORD *)(v4 + v7 - 208);
      *(_QWORD *)(v8 - 216) = *(_QWORD *)(v4 + v7 - 216);
      *(_QWORD *)(v9 - 224) = 0;
      *(_QWORD *)(v9 - 216) = 0;
      *(_QWORD *)(v9 - 232) = 0;
      *(_QWORD *)(v8 - 192) = 0;
      *(_QWORD *)(v8 - 184) = 0;
      *(_QWORD *)(v8 - 208) = v10;
      *(_QWORD *)(v8 - 200) = 0;
      *(_OWORD *)(v8 - 200) = *(_OWORD *)(v4 + v7 - 200);
      *(_QWORD *)(v8 - 184) = *(_QWORD *)(v4 + v7 - 184);
      *(_QWORD *)(v9 - 200) = 0;
      *(_QWORD *)(v9 - 192) = 0;
      *(_QWORD *)(v9 - 184) = 0;
      v11 = *(_OWORD *)(v4 + v7 - 176);
      v12 = *(_OWORD *)(v4 + v7 - 144);
      *(_OWORD *)(v8 - 160) = *(_OWORD *)(v4 + v7 - 160);
      *(_OWORD *)(v8 - 144) = v12;
      *(_OWORD *)(v8 - 176) = v11;
      v13 = *(_OWORD *)(v4 + v7 - 64);
      v15 = *(_OWORD *)(v4 + v7 - 112);
      v14 = *(_OWORD *)(v4 + v7 - 96);
      *(_OWORD *)(v8 - 80) = *(_OWORD *)(v4 + v7 - 80);
      *(_OWORD *)(v8 - 64) = v13;
      *(_OWORD *)(v8 - 112) = v15;
      *(_OWORD *)(v8 - 96) = v14;
      *(_OWORD *)(v8 - 128) = *(_OWORD *)(v4 + v7 - 128);
      result = (uint64_t *)_ZNSt3__116__variant_detail18__move_constructorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_fEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEELNS0_6_TraitE1EEC2EOSH_(v6 + v7 - 48, v4 + v7 - 48);
      *(_QWORD *)(v8 - 32) = 0;
      *(_QWORD *)(v8 - 24) = 0;
      *(_QWORD *)(v8 - 16) = 0;
      *(_OWORD *)(v8 - 32) = *(_OWORD *)(v4 + v7 - 32);
      *(_QWORD *)(v8 - 16) = *(_QWORD *)(v4 + v7 - 16);
      *(_QWORD *)(v9 - 32) = 0;
      *(_QWORD *)(v9 - 24) = 0;
      *(_QWORD *)(v9 - 16) = 0;
      v7 -= 240;
    }
    while (v4 + v7 != v5);
    v6 += v7;
  }
  a2[1] = v6;
  v16 = *v3;
  *v3 = v6;
  a2[1] = v16;
  v17 = v3[1];
  v3[1] = a2[2];
  a2[2] = v17;
  v18 = v3[2];
  v3[2] = a2[3];
  a2[3] = v18;
  *a2 = a2[1];
  return result;
}

uint64_t std::__split_buffer<`anonymous namespace'::face_id_animator_t::quadrant_context_t>::~__split_buffer(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 240;
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

uint64_t _ZNSt3__116__variant_detail18__move_constructorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_fEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEELNS0_6_TraitE1EEC2EOSH_(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = 0;
  *(_DWORD *)(a1 + 8) = -1;
  _ZNSt3__116__variant_detail6__ctorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_fEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEEE19__generic_constructB8ne180100INS0_18__move_constructorISF_LNS0_6_TraitE1EEEEEvRSG_OT_(a1, a2);
  return a1;
}

uint64_t _ZNSt3__116__variant_detail6__ctorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_fEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEEE19__generic_constructB8ne180100INS0_18__move_constructorISF_LNS0_6_TraitE1EEEEEvRSG_OT_(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  char v7;

  v3 = result;
  v4 = *(unsigned int *)(result + 8);
  if ((_DWORD)v4 != -1)
    result = ((uint64_t (*)(char *, uint64_t))*(&off_24C27F068 + v4))(&v7, result);
  *(_DWORD *)(v3 + 8) = -1;
  v5 = *(unsigned int *)(a2 + 8);
  if ((_DWORD)v5 != -1)
  {
    result = ((uint64_t (*)(char *, uint64_t, uint64_t))*(&off_24C27F080 + v5))(&v6, v3, a2);
    *(_DWORD *)(v3 + 8) = v5;
  }
  return result;
}

uint64_t _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm1EEE10__dispatchB8ne180100IOZNS0_6__dtorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_fEENS_14default_deleteISD_EEEENS9_INSA_18animation_timing_tENSE_ISH_EEEEEEELNS0_6_TraitE1EE9__destroyB8ne180100EvEUlRT_E_JRNS0_6__baseILSL_1EJS8_SG_SJ_EEEEEEDcSN_DpT0_(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  *a2 = 0;
  if (result)
    JUMPOUT(0x20BD1B2E8);
  return result;
}

uint64_t _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm2EEE10__dispatchB8ne180100IOZNS0_6__dtorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_fEENS_14default_deleteISD_EEEENS9_INSA_18animation_timing_tENSE_ISH_EEEEEEELNS0_6_TraitE1EE9__destroyB8ne180100EvEUlRT_E_JRNS0_6__baseILSL_1EJS8_SG_SJ_EEEEEEDcSN_DpT0_(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  *a2 = 0;
  if (result)
    JUMPOUT(0x20BD1B2E8);
  return result;
}

void _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm1ELm1EEE10__dispatchB8ne180100IOZNS0_6__ctorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_fEENS_14default_deleteISD_EEEENS9_INSA_18animation_timing_tENSE_ISH_EEEEEEEE19__generic_constructB8ne180100INS0_18__move_constructorISK_LNS0_6_TraitE1EEEEEvRSL_OT_EUlRSR_OT0_E_JRNS0_6__baseILSO_1EJS8_SG_SJ_EEEOSZ_EEEDcSR_DpT0_(uint64_t a1, _QWORD *a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = *a3;
  *a3 = 0;
  *a2 = v3;
}

void _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm2ELm2EEE10__dispatchB8ne180100IOZNS0_6__ctorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_fEENS_14default_deleteISD_EEEENS9_INSA_18animation_timing_tENSE_ISH_EEEEEEEE19__generic_constructB8ne180100INS0_18__move_constructorISK_LNS0_6_TraitE1EEEEEvRSL_OT_EUlRSR_OT0_E_JRNS0_6__baseILSO_1EJS8_SG_SJ_EEEOSZ_EEEDcSR_DpT0_(uint64_t a1, _QWORD *a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = *a3;
  *a3 = 0;
  *a2 = v3;
}

void std::allocator_traits<std::allocator<`anonymous namespace'::face_id_animator_t::quadrant_context_t>>::destroy[abi:ne180100]<`anonymous namespace'::face_id_animator_t::quadrant_context_t,void,void>(uint64_t a1)
{
  void *v2;
  void **v3;

  v3 = (void **)(a1 + 208);
  _ZNSt3__16vectorIN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS1_27animator_interpolation_typeE0EEENS_9allocatorIS5_EEE16__destroy_vectorclB8ne180100Ev(&v3);
  _ZNSt3__116__variant_detail6__dtorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_fEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEELNS0_6_TraitE1EED2Ev(a1 + 192);
  v3 = (void **)(a1 + 40);
  std::vector<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t>::__destroy_vector::operator()[abi:ne180100](&v3);
  v2 = *(void **)(a1 + 8);
  if (v2)
  {
    *(_QWORD *)(a1 + 16) = v2;
    operator delete(v2);
  }
}

void `anonymous namespace'::face_id_animator_t::quadrant_context_t::static_state_t::~static_state_t(_anonymous_namespace_::face_id_animator_t::quadrant_context_t::static_state_t *this)
{
  void *v2;
  void **v3;

  v3 = (void **)((char *)this + 40);
  std::vector<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t>::__destroy_vector::operator()[abi:ne180100](&v3);
  v2 = (void *)*((_QWORD *)this + 1);
  if (v2)
  {
    *((_QWORD *)this + 2) = v2;
    operator delete(v2);
  }
}

void _ZNSt3__16vectorIN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS1_27animator_interpolation_typeE0EEENS_9allocatorIS5_EEE16__destroy_vectorclB8ne180100Ev(void ***a1)
{
  void **v1;
  char *v2;
  char *v4;
  void *v5;
  char *v6;

  v1 = *a1;
  v2 = (char *)**a1;
  if (v2)
  {
    v4 = (char *)v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v6 = v4 - 96;
        _ZNSt3__116__variant_detail6__dtorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_fEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEELNS0_6_TraitE1EED2Ev((uint64_t)(v4 - 16));
        v4 = v6;
      }
      while (v6 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t _ZNSt3__116__variant_detail6__dtorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_fEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEELNS0_6_TraitE1EED2Ev(uint64_t a1)
{
  uint64_t v2;
  char v4;

  v2 = *(unsigned int *)(a1 + 8);
  if ((_DWORD)v2 != -1)
    ((void (*)(char *, uint64_t))*(&off_24C27F068 + v2))(&v4, a1);
  *(_DWORD *)(a1 + 8) = -1;
  return a1;
}

void std::vector<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v2;

  v2 = *a1;
  if (*v2)
  {
    std::vector<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t>::__clear[abi:ne180100]((uint64_t *)v2);
    operator delete(**a1);
  }
}

void std::vector<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = *a1;
  v2 = a1[1];
  if (v2 != *a1)
  {
    v4 = a1[1];
    do
    {
      v6 = *(void **)(v4 - 24);
      v4 -= 24;
      v5 = v6;
      if (v6)
      {
        *(_QWORD *)(v2 - 16) = v5;
        operator delete(v5);
      }
      v2 = v4;
    }
    while (v4 != v3);
  }
  a1[1] = v3;
}

void std::__hash_table<std::__hash_value_type<LAUI_uniform_cubic_b_spline_renderer::indexed_identifier_t<LAUI_uniform_cubic_b_spline_renderer::spline_t::instance_t,LAUI_uniform_cubic_b_spline_renderer::spline_t>,LAUI_uniform_cubic_b_spline_renderer::indexed_identifier_t<`anonymous namespace'::face_id_animator_t::ring_context_t>>,std::__unordered_map_hasher<LAUI_uniform_cubic_b_spline_renderer::indexed_identifier_t<LAUI_uniform_cubic_b_spline_renderer::spline_t::instance_t,LAUI_uniform_cubic_b_spline_renderer::spline_t>,std::__hash_value_type<LAUI_uniform_cubic_b_spline_renderer::indexed_identifier_t<LAUI_uniform_cubic_b_spline_renderer::spline_t::instance_t,LAUI_uniform_cubic_b_spline_renderer::spline_t>,LAUI_uniform_cubic_b_spline_renderer::indexed_identifier_t<`anonymous namespace'::face_id_animator_t::ring_context_t>>,std::hash<LAUI_uniform_cubic_b_spline_renderer::indexed_identifier_t<LAUI_uniform_cubic_b_spline_renderer::spline_t::instance_t,LAUI_uniform_cubic_b_spline_renderer::spline_t>>,std::equal_to<LAUI_uniform_cubic_b_spline_renderer::indexed_identifier_t<LAUI_uniform_cubic_b_spline_renderer::spline_t::instance_t,LAUI_uniform_cubic_b_spline_renderer::spline_t>>,true>,std::__unordered_map_equal<LAUI_uniform_cubic_b_spline_renderer::indexed_identifier_t<LAUI_uniform_cubic_b_spline_renderer::spline_t::instance_t,LAUI_uniform_cubic_b_spline_renderer::spline_t>,std::__hash_value_type<LAUI_uniform_cubic_b_spline_renderer::indexed_identifier_t<LAUI_uniform_cubic_b_spline_renderer::spline_t::instance_t,LAUI_uniform_cubic_b_spline_renderer::spline_t>,LAUI_uniform_cubic_b_spline_renderer::indexed_identifier_t<`anonymous namespace'::face_id_animator_t::ring_context_t>>,std::equal_to<LAUI_uniform_cubic_b_spline_renderer::indexed_identifier_t<LAUI_uniform_cubic_b_spline_renderer::spline_t::instance_t,LAUI_uniform_cubic_b_spline_renderer::spline_t>>,std::hash<LAUI_uniform_cubic_b_spline_renderer::indexed_identifier_t<LAUI_uniform_cubic_b_spline_renderer::spline_t::instance_t,LAUI_uniform_cubic_b_spline_renderer::spline_t>>,true>,std::allocator<std::__hash_value_type<LAUI_uniform_cubic_b_spline_renderer::indexed_identifier_t<LAUI_uniform_cubic_b_spline_renderer::spline_t::instance_t,LAUI_uniform_cubic_b_spline_renderer::spline_t>,LAUI_uniform_cubic_b_spline_renderer::indexed_identifier_t<`anonymous namespace'::face_id_animator_t::ring_context_t>>>>::__rehash_unique[abi:ne180100](uint64_t a1, size_t __n)
{
  size_t prime;
  int8x8_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  size_t v9;
  uint8x8_t v10;
  unint64_t v11;
  uint8x8_t v12;
  uint64_t v13;
  _QWORD *v14;
  size_t v15;
  void *v16;

  if (__n == 1)
  {
    prime = 2;
  }
  else
  {
    prime = __n;
    if ((__n & (__n - 1)) != 0)
      prime = std::__next_prime(__n);
  }
  v4 = *(int8x8_t *)(a1 + 8);
  if (prime <= *(_QWORD *)&v4)
  {
    if (prime >= *(_QWORD *)&v4)
      return;
    v11 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(_QWORD *)&v4 < 3uLL || (v12 = (uint8x8_t)vcnt_s8(v4), v12.i16[0] = vaddlv_u8(v12), v12.u32[0] > 1uLL))
    {
      v11 = std::__next_prime(v11);
    }
    else
    {
      v13 = 1 << -(char)__clz(v11 - 1);
      if (v11 >= 2)
        v11 = v13;
    }
    if (prime <= v11)
      prime = v11;
    if (prime >= *(_QWORD *)&v4)
      return;
    if (!prime)
    {
      v16 = *(void **)a1;
      *(_QWORD *)a1 = 0;
      if (v16)
        operator delete(v16);
      *(_QWORD *)(a1 + 8) = 0;
      return;
    }
  }
  if (prime >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  v5 = operator new(8 * prime);
  v6 = *(void **)a1;
  *(_QWORD *)a1 = v5;
  if (v6)
    operator delete(v6);
  v7 = 0;
  *(_QWORD *)(a1 + 8) = prime;
  do
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v7++) = 0;
  while (prime != v7);
  v8 = *(_QWORD **)(a1 + 16);
  if (v8)
  {
    v9 = v8[1];
    v10 = (uint8x8_t)vcnt_s8((int8x8_t)prime);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      if (v9 >= prime)
        v9 %= prime;
    }
    else
    {
      v9 &= prime - 1;
    }
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v9) = a1 + 16;
    v14 = (_QWORD *)*v8;
    if (*v8)
    {
      do
      {
        v15 = v14[1];
        if (v10.u32[0] > 1uLL)
        {
          if (v15 >= prime)
            v15 %= prime;
        }
        else
        {
          v15 &= prime - 1;
        }
        if (v15 != v9)
        {
          if (!*(_QWORD *)(*(_QWORD *)a1 + 8 * v15))
          {
            *(_QWORD *)(*(_QWORD *)a1 + 8 * v15) = v8;
            goto LABEL_31;
          }
          *v8 = *v14;
          *v14 = **(_QWORD **)(*(_QWORD *)a1 + 8 * v15);
          **(_QWORD **)(*(_QWORD *)a1 + 8 * v15) = v14;
          v14 = v8;
        }
        v15 = v9;
LABEL_31:
        v8 = v14;
        v14 = (_QWORD *)*v14;
        v9 = v15;
      }
      while (v14);
    }
  }
}

void std::unordered_map<LAUI_uniform_cubic_b_spline_renderer::indexed_identifier_t<LAUI_uniform_cubic_b_spline_renderer::spline_t::instance_t,LAUI_uniform_cubic_b_spline_renderer::spline_t>,LAUI_uniform_cubic_b_spline_renderer::indexed_identifier_t<`anonymous namespace'::face_id_animator_t::ring_context_t>>::try_emplace[abi:ne180100]<LAUI_uniform_cubic_b_spline_renderer::indexed_identifier_t<`anonymous namespace'::face_id_animator_t::ring_context_t> const&>(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  unint64_t v3;
  unint64_t v7;
  unint64_t v8;
  uint8x8_t v9;
  _QWORD *v10;
  _QWORD *i;
  unint64_t v12;
  _QWORD *v14;
  float v15;
  float v16;
  _BOOL8 v17;
  unint64_t v18;
  unint64_t v19;
  size_t v20;
  uint64_t v21;
  _QWORD *v22;
  unint64_t v23;

  v7 = a2[1];
  v8 = *(_QWORD *)(a1 + 8);
  if (v8)
  {
    v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      v3 = a2[1];
      if (v7 >= v8)
        v3 = v7 % v8;
    }
    else
    {
      v3 = (v8 - 1) & v7;
    }
    v10 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
    if (v10)
    {
      for (i = (_QWORD *)*v10; i; i = (_QWORD *)*i)
      {
        v12 = i[1];
        if (v12 == v7)
        {
          if (i[2] == *a2 && i[3] == v7)
            return;
        }
        else
        {
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= v8)
              v12 %= v8;
          }
          else
          {
            v12 &= v8 - 1;
          }
          if (v12 != v3)
            break;
        }
      }
    }
  }
  v14 = operator new(0x28uLL);
  *v14 = 0;
  v14[1] = v7;
  *((_OWORD *)v14 + 1) = *(_OWORD *)a2;
  v14[4] = *a3;
  v15 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v16 = *(float *)(a1 + 32);
  if (!v8 || (float)(v16 * (float)v8) < v15)
  {
    v17 = 1;
    if (v8 >= 3)
      v17 = (v8 & (v8 - 1)) != 0;
    v18 = v17 | (2 * v8);
    v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19)
      v20 = v19;
    else
      v20 = v18;
    v8 = *(_QWORD *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8)
        v3 = v7 % v8;
      else
        v3 = v7;
    }
    else
    {
      v3 = (v8 - 1) & v7;
    }
  }
  v21 = *(_QWORD *)a1;
  v22 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v22)
  {
    *v14 = *v22;
LABEL_42:
    *v22 = v14;
    goto LABEL_43;
  }
  *v14 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v14;
  *(_QWORD *)(v21 + 8 * v3) = a1 + 16;
  if (*v14)
  {
    v23 = *(_QWORD *)(*v14 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v23 >= v8)
        v23 %= v8;
    }
    else
    {
      v23 &= v8 - 1;
    }
    v22 = (_QWORD *)(*(_QWORD *)a1 + 8 * v23);
    goto LABEL_42;
  }
LABEL_43:
  ++*(_QWORD *)(a1 + 24);
}

void sub_209E2A124(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

float32x4_t `anonymous namespace'::morphable_quadrant_t<9ul>::convert(float32x4_t *a1, unsigned int a2, float32x4_t result)
{
  _BOOL4 v4;
  uint64_t v5;
  float v6;
  float v7;
  float32x4_t *v11;
  unint64_t v12;

  if (a2 != 2)
  {
    v4 = a2 == 3 || a2 == 0;
    if (a2 >= 2 && a2 != 3)
    v5 = 0;
    v6 = -1.0;
    if (v4)
      v7 = -1.0;
    else
      v7 = 1.0;
    if (a2 >= 2)
      v6 = 1.0;
    __asm { FMOV            V0.4S, #1.0 }
    result.i64[0] = __PAIR64__(LODWORD(v6), LODWORD(v7));
    do
    {
      a1[v5] = vmulq_f32(result, a1[v5]);
      ++v5;
    }
    while (v5 != 9);
    if ((((a2 < 2) ^ v4) & 1) != 0)
    {
      v11 = a1 + 8;
      v12 = (unint64_t)&a1[1];
      do
      {
        result = *(float32x4_t *)(v12 - 16);
        *(float32x4_t *)(v12 - 16) = *v11;
        *v11-- = result;
        _CF = v12 >= (unint64_t)v11;
        v12 += 16;
      }
      while (!_CF);
    }
  }
  return result;
}

uint64_t std::vector<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t>::reserve(uint64_t *a1, unint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[5];

  v4 = a1[2];
  result = (uint64_t)(a1 + 2);
  if (0xAAAAAAAAAAAAAAABLL * ((v4 - *a1) >> 3) < a2)
  {
    if (a2 >= 0xAAAAAAAAAAAAAABLL)
      std::vector<UIView * {__strong}>::__throw_length_error[abi:ne180100]();
    v5 = a1[1] - *a1;
    v7[4] = result;
    v7[0] = std::__allocate_at_least[abi:ne180100]<std::allocator<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t>>(result, a2);
    v7[1] = v7[0] + v5;
    v7[2] = v7[0] + v5;
    v7[3] = v7[0] + 24 * v6;
    std::vector<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t>::__swap_out_circular_buffer(a1, v7);
    return std::__split_buffer<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t>::~__split_buffer((uint64_t)v7);
  }
  return result;
}

void sub_209E2A284(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::vector<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t>,std::reverse_iterator<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t*>,std::reverse_iterator<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t*>,std::reverse_iterator<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t*>>((uint64_t)(a1 + 2), a1[1], (_QWORD *)a1[1], *a1, (_QWORD *)*a1, a2[1], a2[1]);
  a2[1] = v5;
  v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(24 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t>,std::reverse_iterator<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t*>,std::reverse_iterator<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t*>,std::reverse_iterator<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t*>>(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, _QWORD *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  _QWORD v11[3];
  char v12;
  __int128 v13;
  __int128 v14;

  v7 = a7;
  *(_QWORD *)&v14 = a6;
  *((_QWORD *)&v14 + 1) = a7;
  v13 = v14;
  v11[0] = a1;
  v11[1] = &v13;
  v11[2] = &v14;
  if (a3 == a5)
  {
    v9 = a6;
  }
  else
  {
    do
    {
      *(_QWORD *)(v7 - 24) = 0;
      *(_QWORD *)(v7 - 16) = 0;
      *(_QWORD *)(v7 - 8) = 0;
      v8 = *(_OWORD *)(a3 - 3);
      a3 -= 3;
      *(_OWORD *)(v7 - 24) = v8;
      *(_QWORD *)(v7 - 8) = a3[2];
      *a3 = 0;
      a3[1] = 0;
      a3[2] = 0;
      v7 = *((_QWORD *)&v14 + 1) - 24;
      *((_QWORD *)&v14 + 1) -= 24;
    }
    while (a3 != a5);
    v9 = v14;
  }
  v12 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t>,std::reverse_iterator<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v11);
  return v9;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t>,std::reverse_iterator<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t>,std::reverse_iterator<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t*>>::operator()[abi:ne180100](a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t>,std::reverse_iterator<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    v3 = *(void **)v1;
    if (*(_QWORD *)v1)
    {
      *(_QWORD *)(v1 + 8) = v3;
      operator delete(v3);
    }
    v1 += 24;
  }
}

uint64_t std::__split_buffer<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t>::~__split_buffer(uint64_t a1)
{
  std::__split_buffer<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t>::__destruct_at_end[abi:ne180100](a1, *(_QWORD *)(a1 + 8));
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void std::__split_buffer<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t>::__destruct_at_end[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v5;

  v2 = *(_QWORD *)(a1 + 16);
  while (v2 != a2)
  {
    v5 = *(void **)(v2 - 24);
    *(_QWORD *)(a1 + 16) = v2 - 24;
    if (v5)
    {
      *(_QWORD *)(v2 - 16) = v5;
      operator delete(v5);
      v2 = *(_QWORD *)(a1 + 16);
    }
    else
    {
      v2 -= 24;
    }
  }
}

uint64_t _ZNSt3__16vectorIN36LAUI_uniform_cubic_b_spline_renderer8spline_t7state_tENS_9allocatorIS3_EEE24__emplace_back_slow_pathIJNS0_IDv3_fNS4_IS8_EEEEEEEPS3_DpOT_(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  _QWORD v14[5];

  v3 = *a1;
  v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL)
LABEL_13:
    std::vector<UIView * {__strong}>::__throw_length_error[abi:ne180100]();
  v7 = (uint64_t)(a1 + 2);
  v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5)
    v5 = 2 * v8;
  if (v8 >= 0x555555555555555)
    v9 = 0xAAAAAAAAAAAAAAALL;
  else
    v9 = v5;
  v14[4] = a1 + 2;
  if (v9)
    v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t>>(v7, v9);
  else
    v10 = 0;
  v11 = &v10[24 * v4];
  v14[0] = v10;
  v14[1] = v11;
  v14[3] = &v10[24 * v9];
  *(_QWORD *)v11 = 0;
  *((_QWORD *)v11 + 1) = 0;
  *((_QWORD *)v11 + 2) = 0;
  *(_OWORD *)v11 = *(_OWORD *)a2;
  *((_QWORD *)v11 + 2) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  if (*((_QWORD *)v11 + 1) - *(_QWORD *)v11 <= 0x3FuLL)
  {
    __break(1u);
    goto LABEL_13;
  }
  v14[2] = v11 + 24;
  std::vector<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t>::__swap_out_circular_buffer(a1, v14);
  v12 = a1[1];
  std::__split_buffer<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t>::~__split_buffer((uint64_t)v14);
  return v12;
}

void sub_209E2A608(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

_QWORD *_ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPKS1_S7_EEvT_T0_m(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE11__vallocateB8ne180100Em(result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_209E2A678(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *_ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE11__vallocateB8ne180100Em(_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 60)
    std::vector<UIView * {__strong}>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<LAUI_uniform_cubic_b_spline_renderer_private::control_point>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[16 * v4];
  return result;
}

uint64_t *LAUI_uniform_cubic_b_spline_renderer::weighted_spline_t::weighted_spline_t<std::vector<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t>>(uint64_t a1, uint64_t a2)
{
  uint64_t *result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  _QWORD *v8;

  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  v5 = a1 + 8;
  result = *(uint64_t **)(a1 + 8);
  v4 = *(uint64_t **)(v5 + 8);
  if (v4 == result)
  {
    __break(1u);
  }
  else
  {
    v6 = std::__minmax_element_impl[abi:ne180100]<std::__wrap_iter<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t *>,std::__wrap_iter<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t *>,std::__identity,LAUI_uniform_cubic_b_spline_renderer::weighted_spline_t::weighted_spline_t<std::vector<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t>>(std::vector<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t> &&)::{lambda(LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t const&,LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t const)#1}>(result, v4);
    v7 = (v6[1] - *v6) >> 4;
    if (v7 != (uint64_t)(v8[1] - *v8) >> 4)
      __assert_rtn("weighted_spline_t", "LAUICubicBSplineRenderer.h", 1505, "minimum_control_point_count == maximum_control_point_count");
    *(_QWORD *)a1 = v7;
    return (uint64_t *)a1;
  }
  return result;
}

uint64_t *std::__minmax_element_impl[abi:ne180100]<std::__wrap_iter<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t *>,std::__wrap_iter<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t *>,std::__identity,LAUI_uniform_cubic_b_spline_renderer::weighted_spline_t::weighted_spline_t<std::vector<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t>>(std::vector<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t> &&)::{lambda(LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t const&,LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t const)#1}>(uint64_t *result, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t *v8;
  uint64_t *v9;
  BOOL v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  BOOL v16;

  v2 = result;
  if (result != a2 && result + 3 != a2)
  {
    v4 = result[3];
    v5 = result[4] - v4;
    v6 = *result;
    v7 = result[1] - *result;
    if (v5 >= v7)
    {
      v8 = result + 3;
    }
    else
    {
      result += 3;
      v8 = v2;
    }
    v9 = v2 + 6;
    if (v9 != a2)
    {
      v10 = v5 >= v7;
      if (v5 >= v7)
        v11 = v4;
      else
        v11 = v6;
      if (v10)
        v4 = v6;
      while (v9 + 3 != a2)
      {
        v12 = v9[4] - v9[3];
        v13 = v9[1] - *v9;
        v14 = result[1];
        if (v12 >= v13)
        {
          if (v13 < v14 - v4)
          {
            v4 = *v9;
            result = v9;
          }
          if (v12 >= v8[1] - v11)
          {
            v11 = v9[3];
            v8 = v9 + 3;
          }
        }
        else
        {
          v4 = *result;
          if (v12 < v14 - *result)
          {
            v4 = v9[3];
            result = v9 + 3;
          }
          v15 = v8[1] - *v8;
          v16 = v13 >= v15;
          if (v13 >= v15)
            v11 = *v9;
          else
            v11 = *v8;
          if (v16)
            v8 = v9;
        }
        v9 += 6;
        if (v9 == a2)
          return result;
      }
      if (v9[1] - *v9 < (unint64_t)(result[1] - *result))
        return v9;
    }
  }
  return result;
}

_QWORD *_ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEEC2EmRKS1_(_QWORD *a1, unint64_t a2, _OWORD *a3)
{
  _OWORD *v6;
  _OWORD *v7;
  uint64_t v8;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE11__vallocateB8ne180100Em(a1, a2);
    v6 = (_OWORD *)a1[1];
    v7 = &v6[a2];
    v8 = 16 * a2;
    do
    {
      *v6++ = *a3;
      v8 -= 16;
    }
    while (v8);
    a1[1] = v7;
  }
  return a1;
}

void sub_209E2A8FC(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void std::allocator_traits<std::allocator<`anonymous namespace'::face_id_animator_t::quadrant_context_t>>::construct[abi:ne180100]<`anonymous namespace'::face_id_animator_t::quadrant_context_t,`anonymous namespace'::face_id_animator_t::quadrant_context_t::static_state_t,`anonymous namespace'::face_id_state_t &,void,void>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  float v9;
  float v10;
  _OWORD *v11;
  _OWORD *v12;
  _OWORD *v13;
  _OWORD *v14;
  __int128 v15;
  __int128 v16;
  float v17;
  char v18;
  char v19;
  float v20;
  float v21;
  int v22;
  __int128 v23;
  __int128 v24;
  _DWORD v25[6];
  uint64_t *v26;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)(a2 + 24) = 0;
  *(_QWORD *)(a2 + 8) = 0;
  v5 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 32) = v5;
  *(_QWORD *)(a1 + 40) = 0;
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a2 + 40) = 0;
  *(_QWORD *)(a2 + 48) = 0;
  *(_QWORD *)(a2 + 56) = 0;
  v6 = *(_OWORD *)(a2 + 64);
  v7 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v7;
  *(_OWORD *)(a1 + 64) = v6;
  *(_OWORD *)(a1 + 112) = 0u;
  v8 = a1 + 112;
  v9 = fmaxf(fminf(nexttowardf(1.0, 0.0), 0.0), 0.0);
  *(float *)(a1 + 128) = v9;
  *(_BYTE *)(a1 + 132) = 0;
  *(_BYTE *)(a1 + 140) = 0;
  *(_DWORD *)(a1 + 152) = 0;
  if (v9 <= 0.0)
    v10 = 0.0;
  else
    v10 = INFINITY;
  *(float *)(a1 + 144) = v10;
  *(float *)(a1 + 148) = v10;
  *(_DWORD *)(a1 + 200) = 0;
  *(_QWORD *)(a1 + 208) = 0;
  *(_QWORD *)(a1 + 216) = 0;
  *(_QWORD *)(a1 + 224) = 0;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  v16 = v15;
  v17 = v9;
  v18 = 0;
  v19 = 0;
  v22 = 0;
  v20 = v10;
  v21 = v10;
  _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS_27animator_interpolation_typeE0EE10set_targetINS_18animation_target_tIS1_EEEEbOT_NS_25animation_target_option_tE(v8, (uint64_t)&v16, 0);
  _ZNSt3__16vectorIN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS1_27animator_interpolation_typeE0EEENS_9allocatorIS5_EEE7reserveEm((uint64_t *)(a1 + 208), v14 - v13);
  v11 = v13;
  v12 = v14;
  v26 = (uint64_t *)(a1 + 208);
  if (v13 != v14)
  {
    do
    {
      v16 = *v11;
      v17 = v9;
      v18 = 0;
      v19 = 0;
      v22 = 0;
      v20 = v10;
      v21 = v10;
      v23 = v16;
      v24 = v16;
      v25[2] = 0;
      _ZNSt3__120back_insert_iteratorINS_6vectorIN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS2_27animator_interpolation_typeE0EEENS_9allocatorIS6_EEEEEaSB8ne180100EOS6_(&v26, &v16);
      _ZNSt3__116__variant_detail6__dtorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_fEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEELNS0_6_TraitE1EED2Ev((uint64_t)v25);
      ++v11;
    }
    while (v11 != v12);
    v11 = v13;
  }
  if (v11)
  {
    v14 = v11;
    operator delete(v11);
  }
}

void sub_209E2AAC8(void *a1)
{
  __clang_call_terminate(a1);
}

void `anonymous namespace'::face_id_animator_t::quadrant_context_t::static_state_t::target_state(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  unint64_t v4;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 *v10;
  void *v11[2];
  uint64_t v12;
  void *__p[2];
  uint64_t v14;

  v4 = *(char *)(a2 + 72);
  if (v4 >= 7)
  {
LABEL_12:
    __break(1u);
  }
  else
  {
    v7 = qword_209E31338[v4];
    LODWORD(__p[0]) = 0;
    std::vector<float>::vector(v11, v7 + 1, __p);
    v8 = *(_OWORD *)v11;
    *((_DWORD *)v11[0] + v7) = 1065353216;
    *(_OWORD *)__p = v8;
    v14 = v12;
    v11[1] = 0;
    v12 = 0;
    v11[0] = 0;
    LAUI_uniform_cubic_b_spline_renderer::weighted_spline_t::state((unint64_t *)(a1 + 32), __p, a3);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if (v11[0])
    {
      v11[1] = v11[0];
      operator delete(v11[0]);
    }
    v9 = 0uLL;
    switch(*(_BYTE *)(a2 + 72))
    {
      case 0:
        v10 = (__int128 *)(a1 + 80);
        goto LABEL_10;
      case 1:
        v10 = (__int128 *)(a1 + 64);
        goto LABEL_10;
      case 2:
        v10 = (__int128 *)(a1 + 96);
LABEL_10:
        v9 = *v10;
        break;
      case 3:
      case 4:
      case 5:
      case 6:
        break;
      default:
        goto LABEL_12;
    }
    *(_OWORD *)(a3 + 32) = v9;
  }
}

uint64_t _ZNSt3__16vectorIN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS1_27animator_interpolation_typeE0EEENS_9allocatorIS5_EEE7reserveEm(uint64_t *a1, unint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[5];

  v4 = a1[2];
  result = (uint64_t)(a1 + 2);
  if (0xAAAAAAAAAAAAAAABLL * ((v4 - *a1) >> 5) < a2)
  {
    if (a2 >= 0x2AAAAAAAAAAAAABLL)
      std::vector<UIView * {__strong}>::__throw_length_error[abi:ne180100]();
    v5 = a1[1] - *a1;
    v7[4] = result;
    v7[0] = std::__allocate_at_least[abi:ne180100]<std::allocator<LAUI_uniform_cubic_b_spline_renderer_private::instance_uniform>>(result, a2);
    v7[1] = v7[0] + v5;
    v7[2] = v7[0] + v5;
    v7[3] = v7[0] + 96 * v6;
    _ZNSt3__16vectorIN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS1_27animator_interpolation_typeE0EEENS_9allocatorIS5_EEE26__swap_out_circular_bufferERNS_14__split_bufferIS5_RS7_EE(a1, v7);
    return _ZNSt3__114__split_bufferIN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS1_27animator_interpolation_typeE0EEERNS_9allocatorIS5_EEED2Ev((uint64_t)v7);
  }
  return result;
}

void sub_209E2AC84(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  _ZNSt3__114__split_bufferIN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS1_27animator_interpolation_typeE0EEERNS_9allocatorIS5_EEED2Ev((uint64_t)va);
  _Unwind_Resume(a1);
}

_QWORD *LAUI_uniform_cubic_b_spline_renderer::weighted_spline_t::state@<X0>(unint64_t *a1@<X0>, _QWORD *a2@<X1>, uint64_t a3@<X8>)
{
  unint64_t v6;
  _QWORD *result;
  float32x4_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  __int128 v19;

  v6 = *a1;
  v17 = 0u;
  result = _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEEC2EmRKS1_(&v18, v6, &v17);
  v10 = a1[1];
  v9 = a1[2];
  if (v9 != v10)
  {
    v11 = 0;
    do
    {
      if (v11 >= (uint64_t)(a2[1] - *a2) >> 2)
        break;
      v8.i32[0] = *(_DWORD *)(*a2 + 4 * v11);
      if (v8.f32[0] != 0.0)
      {
        v12 = (uint64_t *)(v10 + 24 * v11);
        v13 = *v12;
        if (v12[1] != *v12)
        {
          v14 = 0;
          v8 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v8.f32, 0);
          do
          {
            if (v14 >= ((uint64_t)v19 - v18) >> 4)
              break;
            *(float32x4_t *)(v18 + 16 * v14) = vmlaq_f32(*(float32x4_t *)(v18 + 16 * v14), *(float32x4_t *)(v13 + 16 * v14), v8);
            ++v14;
            v13 = *v12;
          }
          while (v14 < (v12[1] - *v12) >> 4);
          v10 = a1[1];
          v9 = a1[2];
        }
      }
      ++v11;
    }
    while (v11 < 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v9 - v10) >> 3));
  }
  v15 = v18;
  *(_QWORD *)a3 = v18;
  v16 = v19;
  *(_OWORD *)(a3 + 8) = v19;
  v19 = 0uLL;
  v18 = 0;
  if ((unint64_t)(v16 - v15) <= 0x3F)
    __break(1u);
  return result;
}

_QWORD *std::vector<float>::vector(_QWORD *a1, unint64_t a2, _DWORD *a3)
{
  _DWORD *v6;
  _DWORD *v7;
  uint64_t v8;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<float>::__vallocate[abi:ne180100](a1, a2);
    v6 = (_DWORD *)a1[1];
    v7 = &v6[a2];
    v8 = 4 * a2;
    do
    {
      *v6++ = *a3;
      v8 -= 4;
    }
    while (v8);
    a1[1] = v7;
  }
  return a1;
}

void sub_209E2AE18(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<float>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 62)
    std::vector<UIView * {__strong}>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(4 * a2);
}

BOOL _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS_27animator_interpolation_typeE0EE10set_targetINS_18animation_target_tIS1_EEEEbOT_NS_25animation_target_option_tE(uint64_t a1, uint64_t a2, int a3)
{
  _OWORD *v6;
  float32x4_t v7;
  float v8;
  _OWORD *v9;
  __int128 v10;
  uint64_t v11;
  float32x4_t v12;
  __int128 v13;
  float v15;
  _BYTE v16[28];

  if (*(_DWORD *)(a1 + 88))
    _ZNSt3__17variantIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_fEENS_14default_deleteIS6_EEEENS2_INS3_18animation_timing_tENS7_ISA_EEEEEEaSB8ne180100IS1_Li0ES1_Lm0ELi0EEERSD_OT_(a1 + 80);
  v6 = (_OWORD *)(a2 + 16);
  v7 = vmulq_f32(*(float32x4_t *)a1, *(float32x4_t *)a2);
  v15 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v7, 2), vaddq_f32(v7, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v7.f32, 1))).f32[0];
  if (v15 == 1.0)
  {
    _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS_27animator_interpolation_typeE0EE10set_timingERKNS_18animation_timing_tENS_25animation_target_option_tE(a1, (uint64_t)v6, a3);
  }
  else
  {
    v8 = *(float *)(a2 + 40);
    if (v8 >= 0.0)
    {
      *(_OWORD *)v16 = *v6;
      *(_QWORD *)&v16[16] = *(_QWORD *)(a2 + 32);
      *(_DWORD *)&v16[24] = 0;
      _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS_27animator_interpolation_typeE0EE11_set_timingERKNS_18animation_timing_tE(a1, (__int128 *)v16);
      v12 = *(float32x4_t *)a2;
      *(_OWORD *)(a1 + 28) = *(_OWORD *)&v16[12];
      v13 = *(_OWORD *)v16;
      *(float32x4_t *)a1 = v12;
      *(_OWORD *)(a1 + 16) = v13;
      if (*(float *)(a1 + 32) <= 0.0)
      {
        *(float32x4_t *)(a1 + 48) = v12;
        *(float32x4_t *)(a1 + 64) = v12;
      }
      else if (v8 > 0.0)
      {
        _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS_27animator_interpolation_typeE0EE6updateEf(a1, v8);
      }
    }
    else
    {
      v9 = (_OWORD *)operator new();
      v10 = *(_OWORD *)(a2 + 16);
      *v9 = *(_OWORD *)a2;
      v9[1] = v10;
      v9[2] = *(_OWORD *)(a2 + 32);
      *(_QWORD *)v16 = v9;
      _ZNSt3__116__variant_detail12__assignmentINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_fEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEEE12__assign_altB8ne180100ILm1ESB_SB_EEvRNS0_5__altIXT_ET0_EEOT1_(a1 + 80, (uint64_t *)(a1 + 80), (uint64_t *)v16);
      v11 = *(_QWORD *)v16;
      *(_QWORD *)v16 = 0;
      if (v11)
        MEMORY[0x20BD1B2E8](v11, 0x1000C40FC2635F5);
    }
  }
  return v15 != 1.0;
}

uint64_t _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS_27animator_interpolation_typeE0EE10set_timingERKNS_18animation_timing_tENS_25animation_target_option_tE(uint64_t result, uint64_t a2, int a3)
{
  uint64_t v5;
  uint64_t v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  _OWORD *v15;
  uint64_t v16;
  uint64_t *v17;

  v5 = result;
  if (*(_DWORD *)(result + 88))
    result = _ZNSt3__17variantIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_fEENS_14default_deleteIS6_EEEENS2_INS3_18animation_timing_tENS7_ISA_EEEEEEaSB8ne180100IS1_Li0ES1_Lm0ELi0EEERSD_OT_(result + 80);
  if (a3)
  {
    v16 = v5;
    v6 = *(unsigned int *)(v5 + 88);
    if ((_DWORD)v6 == -1)
      std::__throw_bad_variant_access[abi:ne180100]();
    v17 = &v16;
    result = ((uint64_t (*)(uint64_t **, uint64_t))*(&off_24C27F098 + v6))(&v17, v5 + 80);
    if ((_DWORD)result)
    {
      v7 = *(float *)(v5 + 40);
      v8 = *(float *)(v5 + 32) - v7;
      v9 = *(float *)(v5 + 36) - v7;
      v10 = *(float *)(a2 + 24);
      v11 = *(float *)(a2 + 16) - v10;
      v12 = *(float *)(a2 + 20) - v10;
      if ((a3 & 2) != 0 && (v11 < v8 || v12 < v9))
        goto LABEL_16;
      if ((a3 & 4) != 0 && (v11 > v8 || v12 > v9))
      {
LABEL_16:
        if (v10 >= 0.0)
        {
          return _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS_27animator_interpolation_typeE0EE11_set_timingERKNS_18animation_timing_tE(v5, (__int128 *)a2);
        }
        else if ((float)(v8 + v10) > 0.0)
        {
          v15 = (_OWORD *)operator new();
          *v15 = *(_OWORD *)a2;
          *(_OWORD *)((char *)v15 + 12) = *(_OWORD *)(a2 + 12);
          v17 = (uint64_t *)v15;
          _ZNSt3__116__variant_detail12__assignmentINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_fEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEEE12__assign_altB8ne180100ILm2ESE_SE_EEvRNS0_5__altIXT_ET0_EEOT1_(v5 + 80, (uint64_t *)(v5 + 80), (uint64_t *)&v17);
          result = (uint64_t)v17;
          v17 = 0;
          if (result)
            return MEMORY[0x20BD1B2E8](result, 0x1000C40CBDA3C1BLL);
        }
      }
    }
  }
  return result;
}

uint64_t _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS_27animator_interpolation_typeE0EE11_set_timingERKNS_18animation_timing_tE(uint64_t result, __int128 *a2)
{
  float v2;
  float v3;
  float *v4;
  float v5;
  BOOL v6;
  float32x4_t v8;
  float32x4_t v9;
  __int128 v10;
  float32x4_t v11;

  v2 = *((float *)a2 + 6);
  if (v2 < 0.0)
  {
    __break(1u);
    return result;
  }
  v3 = *((float *)a2 + 4);
  v4 = (float *)(result + 16);
  if (*(float *)(result + 32) > 0.0 && v3 > 0.0 && *v4 != *(float *)a2)
  {
    v5 = (float)(*(float *)a2 * (float)(1.0 - *v4)) / (float)(*v4 * (float)(1.0 - *(float *)a2));
    v6 = v5 < 0.0
      || (COERCE_INT(fabs((float)(*(float *)a2 * (float)(1.0 - *v4)) / (float)(*v4
                                                                                           * (float)(1.0 - *(float *)a2))))
                      - 0x800000) >> 24 > 0x7E;
    if (!v6 || (LODWORD(v5) - 1) <= 0x7FFFFE)
    {
      v8 = *(float32x4_t *)(result + 48);
      v9 = vmulq_f32(v8, *(float32x4_t *)result);
      if (vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v9, 2), vaddq_f32(v9, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v9.f32, 1))).f32[0] != 1.0)v8 = vmlaq_n_f32(vmulq_n_f32(*(float32x4_t *)result, 1.0 - v5), v8, 1.0 - (float)(1.0 - v5));
      *(float32x4_t *)(result + 48) = v8;
    }
  }
  v10 = *a2;
  *(_OWORD *)(result + 28) = *(__int128 *)((char *)a2 + 12);
  *(_OWORD *)v4 = v10;
  if (v2 <= 0.0)
  {
    if (v3 > 0.0)
      return result;
  }
  else
  {
    *(_DWORD *)(result + 40) = 0;
    if (v3 > 0.0)
      return _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS_27animator_interpolation_typeE0EE6updateEf(result, v2);
  }
  v11 = *(float32x4_t *)result;
  *(_OWORD *)(result + 48) = *(_OWORD *)result;
  *(float32x4_t *)(result + 64) = v11;
  return result;
}

uint64_t _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS_27animator_interpolation_typeE0EE6updateEf(uint64_t a1, float a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  __int16 v7;
  int v8;
  _QWORD v10[2];
  float v11;
  _QWORD *v12;

  v11 = a2;
  v12 = (_QWORD *)a1;
  v2 = *(unsigned int *)(a1 + 88);
  if ((_DWORD)v2 == -1)
    std::__throw_bad_variant_access[abi:ne180100]();
  v5 = a1 + 80;
  v10[0] = &v12;
  if (((unsigned int (*)(_QWORD *, uint64_t))*(&off_24C27F098 + v2))(v10, a1 + 80))
  {
    if (a2 == 0.0)
    {
      LOBYTE(v7) = 0;
      v8 = 0;
    }
    else
    {
      v10[0] = a1;
      v10[1] = &v11;
      v6 = *(unsigned int *)(a1 + 88);
      if ((_DWORD)v6 == -1)
        std::__throw_bad_variant_access[abi:ne180100]();
      v12 = v10;
      v7 = ((uint64_t (*)(_QWORD **, uint64_t))*(&off_24C27F0B0 + v6))(&v12, v5);
      v8 = HIBYTE(v7);
    }
  }
  else
  {
    LOBYTE(v7) = 1;
    v8 = 1;
  }
  return v7 | (v8 << 8);
}

uint64_t _ZNSt3__17variantIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_fEENS_14default_deleteIS6_EEEENS2_INS3_18animation_timing_tENS7_ISA_EEEEEEaSB8ne180100IS1_Li0ES1_Lm0ELi0EEERSD_OT_(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 8))
    _ZNSt3__116__variant_detail12__assignmentINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_fEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEEE9__emplaceB8ne180100ILm0EJS3_EEERDaDpOT0_(a1);
  return a1;
}

uint64_t _ZNSt3__116__variant_detail12__assignmentINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_fEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEEE9__emplaceB8ne180100ILm0EJS3_EEERDaDpOT0_(uint64_t a1)
{
  uint64_t v2;
  char v4;

  v2 = *(unsigned int *)(a1 + 8);
  if ((_DWORD)v2 != -1)
    ((void (*)(char *, uint64_t))*(&off_24C27F068 + v2))(&v4, a1);
  *(_DWORD *)(a1 + 8) = 0;
  return a1;
}

BOOL _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm0EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZNK36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS8_27animator_interpolation_typeE0EE12is_animatingEvEUlOT_E_EEJRKNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tISA_EENS_14default_deleteISN_EEEENSL_INS8_18animation_timing_tENSO_ISR_EEEEEEEEEEDcSD_DpT0_(uint64_t a1)
{
  return *(float *)(**(_QWORD **)a1 + 32) > 0.0;
}

uint64_t _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm1EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZNK36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS8_27animator_interpolation_typeE0EE12is_animatingEvEUlOT_E_EEJRKNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tISA_EENS_14default_deleteISN_EEEENSL_INS8_18animation_timing_tENSO_ISR_EEEEEEEEEEDcSD_DpT0_()
{
  return 1;
}

uint64_t _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm2EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZNK36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS8_27animator_interpolation_typeE0EE12is_animatingEvEUlOT_E_EEJRKNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tISA_EENS_14default_deleteISN_EEEENSL_INS8_18animation_timing_tENSO_ISR_EEEEEEEEEEDcSD_DpT0_()
{
  return 1;
}

uint64_t _ZNSt3__116__variant_detail12__assignmentINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_fEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEEE12__assign_altB8ne180100ILm2ESE_SE_EEvRNS0_5__altIXT_ET0_EEOT1_(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t result;

  if (*(_DWORD *)(a1 + 8) != 2)
    return _ZNSt3__116__variant_detail12__assignmentINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_fEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEEE9__emplaceB8ne180100ILm2EJSE_EEERDaDpOT0_(a1, a3);
  v3 = *a3;
  *a3 = 0;
  result = *a2;
  *a2 = v3;
  if (result)
    JUMPOUT(0x20BD1B2E8);
  return result;
}

uint64_t _ZNSt3__116__variant_detail12__assignmentINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_fEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEEE9__emplaceB8ne180100ILm2EJSE_EEERDaDpOT0_(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  char v7;

  v4 = *(unsigned int *)(a1 + 8);
  if ((_DWORD)v4 != -1)
    ((void (*)(char *, uint64_t))*(&off_24C27F068 + v4))(&v7, a1);
  v5 = *a2;
  *a2 = 0;
  *(_QWORD *)a1 = v5;
  *(_DWORD *)(a1 + 8) = 2;
  return a1;
}

float *_ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm0EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS8_27animator_interpolation_typeE0EE6updateEfEUlRT_E_EEJRNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tISA_EENS_14default_deleteISN_EEEENSL_INS8_18animation_timing_tENSO_ISR_EEEEEEEEEEDcSD_DpT0_(float ***a1)
{
  return _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS_27animator_interpolation_typeE0EE7_updateEf(**a1, *(*a1)[1]);
}

uint64_t *_ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm1EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS8_27animator_interpolation_typeE0EE6updateEfEUlRT_E_EEJRNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tISA_EENS_14default_deleteISN_EEEENSL_INS8_18animation_timing_tENSO_ISR_EEEEEEEEEEDcSD_DpT0_(uint64_t **a1, uint64_t *a2)
{
  return _ZZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS_27animator_interpolation_typeE0EE6updateEfENKUlRT_E_clINSt3__110unique_ptrINS_18animation_target_tIS1_EENS8_14default_deleteISB_EEEEEENS_15animator_statusES5_(*a1, a2);
}

uint64_t *_ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm2EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS8_27animator_interpolation_typeE0EE6updateEfEUlRT_E_EEJRNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tISA_EENS_14default_deleteISN_EEEENSL_INS8_18animation_timing_tENSO_ISR_EEEEEEEEEEDcSD_DpT0_(uint64_t **a1, uint64_t *a2)
{
  return _ZZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS_27animator_interpolation_typeE0EE6updateEfENKUlRT_E_clINSt3__110unique_ptrINS_18animation_timing_tENS8_14default_deleteISA_EEEEEENS_15animator_statusES5_(*a1, a2);
}

float *_ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS_27animator_interpolation_typeE0EE7_updateEf(float *result, float a2)
{
  float v3;
  float32x4_t *v4;
  float v5;
  double v6;
  float32x4_t v7;
  float32x4_t v8;
  float v9;
  float32x4_t v10;
  float32x4_t v11;
  int v12;
  _BOOL4 v13;
  float v14;
  float v15;
  float v16;
  float32x4_t v17;

  v3 = result[8];
  if (v3 <= 0.0)
    goto LABEL_12;
  if (a2 >= 0.0)
  {
    v4 = (float32x4_t *)result;
    v5 = result[10] + a2;
    result[10] = v5;
    if (v5 < v3)
    {
      v6 = fmax((float)(1.0 - powf(result[4], a2)), 0.0);
      v7 = v4[3];
      v8 = vmulq_f32(v7, *v4);
      v9 = v6;
      if (vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v8, 2), vaddq_f32(v8, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v8.f32, 1))).f32[0] != 1.0)v7 = vmlaq_n_f32(vmulq_n_f32(*v4, v9), v7, 1.0 - v9);
      v4[3] = v7;
      v10 = v4[4];
      v11 = vmulq_f32(v7, v10);
      if (vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v11, 2), vaddq_f32(v11, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v11.f32, 1))).f32[0] != 1.0)v10 = vmlaq_n_f32(vmulq_n_f32(v7, v9), v10, 1.0 - v9);
      v12 = 0;
      v4[4] = v10;
      v13 = v5 >= v4[2].f32[1];
      return (float *)(v13 | (v12 << 8));
    }
    v14 = nexttowardf(1.0, 0.0);
    v15 = 0.0;
    v16 = fmaxf(fminf(v14, 0.0), 0.0);
    if (v16 > 0.0)
      v15 = INFINITY;
    v4[1].f32[0] = v16;
    v4[1].i8[4] = 0;
    v4[1].i8[12] = 0;
    v4[2].f32[0] = v15;
    v4[2].f32[1] = v15;
    v4[2].i32[2] = 0;
    v17 = *v4;
    v4[3] = *v4;
    v4[4] = v17;
LABEL_12:
    v13 = 1;
    v12 = 1;
    return (float *)(v13 | (v12 << 8));
  }
  __break(1u);
  return result;
}

uint64_t *_ZZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS_27animator_interpolation_typeE0EE6updateEfENKUlRT_E_clINSt3__110unique_ptrINS_18animation_target_tIS1_EENS8_14default_deleteISB_EEEEEENS_15animator_statusES5_(uint64_t *result, uint64_t *a2)
{
  float *v2;
  uint64_t v4;
  uint64_t v5;
  float v6;
  __int16 v7;
  int v8;
  float v9;
  uint64_t v10;

  v2 = (float *)result[1];
  if (*v2 < 0.0)
  {
    __break(1u);
  }
  else
  {
    v4 = *result;
    v5 = *a2;
    v6 = *v2 + *(float *)(*a2 + 40);
    *(float *)(*a2 + 40) = v6;
    if (v6 >= 0.0)
    {
      *(_DWORD *)(v5 + 40) = 0;
      v9 = fmax((float)(*v2 - v6), 0.0);
      _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS_27animator_interpolation_typeE0EE7_updateEf((float *)v4, v9);
      v10 = *a2;
      *a2 = 0;
      if (*(_DWORD *)(v4 + 88))
        _ZNSt3__17variantIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_fEENS_14default_deleteIS6_EEEENS2_INS3_18animation_timing_tENS7_ISA_EEEEEEaSB8ne180100IS1_Li0ES1_Lm0ELi0EEERSD_OT_(v4 + 80);
      _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS_27animator_interpolation_typeE0EE10set_targetINS_18animation_target_tIS1_EEEEbOT_NS_25animation_target_option_tE(v4, v10, 6);
      MEMORY[0x20BD1B2E8](v10, 0x1000C40FC2635F5);
      v7 = _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS_27animator_interpolation_typeE0EE6updateEf(v4, v6);
      v8 = HIBYTE(v7);
    }
    else
    {
      _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS_27animator_interpolation_typeE0EE7_updateEf((float *)v4, *v2);
      LOBYTE(v7) = 0;
      v8 = 0;
    }
    return (uint64_t *)(v7 | (v8 << 8));
  }
  return result;
}

void sub_209E2B714(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (v1)
    MEMORY[0x20BD1B2E8](v1, 0x1000C40FC2635F5);
  _Unwind_Resume(exception_object);
}

uint64_t *_ZZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS_27animator_interpolation_typeE0EE6updateEfENKUlRT_E_clINSt3__110unique_ptrINS_18animation_timing_tENS8_14default_deleteISA_EEEEEENS_15animator_statusES5_(uint64_t *result, uint64_t *a2)
{
  float *v2;
  uint64_t v4;
  uint64_t v5;
  float v6;
  __int16 v7;
  int v8;
  float v9;
  uint64_t v10;

  v2 = (float *)result[1];
  if (*v2 < 0.0)
  {
    __break(1u);
  }
  else
  {
    v4 = *result;
    v5 = *a2;
    v6 = *v2 + *(float *)(*a2 + 24);
    *(float *)(*a2 + 24) = v6;
    if (v6 >= 0.0)
    {
      *(_DWORD *)(v5 + 24) = 0;
      v9 = fmax((float)(*v2 - v6), 0.0);
      _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS_27animator_interpolation_typeE0EE7_updateEf((float *)v4, v9);
      v10 = *a2;
      *a2 = 0;
      if (*(_DWORD *)(v4 + 88))
        _ZNSt3__17variantIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_fEENS_14default_deleteIS6_EEEENS2_INS3_18animation_timing_tENS7_ISA_EEEEEEaSB8ne180100IS1_Li0ES1_Lm0ELi0EEERSD_OT_(v4 + 80);
      _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS_27animator_interpolation_typeE0EE10set_timingERKNS_18animation_timing_tENS_25animation_target_option_tE(v4, v10, 6);
      MEMORY[0x20BD1B2E8](v10, 0x1000C40CBDA3C1BLL);
      v7 = _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS_27animator_interpolation_typeE0EE6updateEf(v4, v6);
      v8 = HIBYTE(v7);
    }
    else
    {
      _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS_27animator_interpolation_typeE0EE7_updateEf((float *)v4, *v2);
      LOBYTE(v7) = 0;
      v8 = 0;
    }
    return (uint64_t *)(v7 | (v8 << 8));
  }
  return result;
}

uint64_t _ZNSt3__116__variant_detail12__assignmentINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_fEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEEE12__assign_altB8ne180100ILm1ESB_SB_EEvRNS0_5__altIXT_ET0_EEOT1_(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t result;

  if (*(_DWORD *)(a1 + 8) != 1)
    return _ZNSt3__116__variant_detail12__assignmentINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_fEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEEE9__emplaceB8ne180100ILm1EJSB_EEERDaDpOT0_(a1, a3);
  v3 = *a3;
  *a3 = 0;
  result = *a2;
  *a2 = v3;
  if (result)
    JUMPOUT(0x20BD1B2E8);
  return result;
}

uint64_t _ZNSt3__116__variant_detail12__assignmentINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_fEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEEE9__emplaceB8ne180100ILm1EJSB_EEERDaDpOT0_(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  char v7;

  v4 = *(unsigned int *)(a1 + 8);
  if ((_DWORD)v4 != -1)
    ((void (*)(char *, uint64_t))*(&off_24C27F068 + v4))(&v7, a1);
  v5 = *a2;
  *a2 = 0;
  *(_QWORD *)a1 = v5;
  *(_DWORD *)(a1 + 8) = 1;
  return a1;
}

uint64_t *_ZNSt3__16vectorIN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS1_27animator_interpolation_typeE0EEENS_9allocatorIS5_EEE26__swap_out_circular_bufferERNS_14__split_bufferIS5_RS7_EE(uint64_t *result, _QWORD *a2)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v3 = result;
  v5 = *result;
  v4 = result[1];
  v6 = a2[1];
  if (v4 == *result)
  {
    v7 = a2[1];
  }
  else
  {
    do
    {
      v7 = v6 - 96;
      v8 = v4 - 96;
      *(_OWORD *)(v6 - 96) = *(_OWORD *)(v4 - 96);
      v9 = *(_OWORD *)(v4 - 80);
      v10 = *(_OWORD *)(v4 - 64);
      v11 = *(_OWORD *)(v4 - 32);
      *(_OWORD *)(v6 - 48) = *(_OWORD *)(v4 - 48);
      *(_OWORD *)(v6 - 32) = v11;
      *(_OWORD *)(v6 - 80) = v9;
      *(_OWORD *)(v6 - 64) = v10;
      result = (uint64_t *)_ZNSt3__116__variant_detail18__move_constructorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_fEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEELNS0_6_TraitE1EEC2EOSH_(v6 - 16, v4 - 16);
      v4 = v8;
      v6 = v7;
    }
    while (v8 != v5);
  }
  a2[1] = v7;
  v12 = *v3;
  *v3 = v7;
  a2[1] = v12;
  v13 = v3[1];
  v3[1] = a2[2];
  a2[2] = v13;
  v14 = v3[2];
  v3[2] = a2[3];
  a2[3] = v14;
  *a2 = a2[1];
  return result;
}

uint64_t _ZNSt3__114__split_bufferIN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS1_27animator_interpolation_typeE0EEERNS_9allocatorIS5_EEED2Ev(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 96;
    _ZNSt3__116__variant_detail6__dtorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_fEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEELNS0_6_TraitE1EED2Ev(i - 16);
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

uint64_t **_ZNSt3__120back_insert_iteratorINS_6vectorIN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS2_27animator_interpolation_typeE0EEENS_9allocatorIS6_EEEEEaSB8ne180100EOS6_(uint64_t **a1, _OWORD *a2)
{
  uint64_t *v3;
  _OWORD *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;

  v3 = *a1;
  v4 = (_OWORD *)(*a1)[1];
  if ((unint64_t)v4 >= (*a1)[2])
  {
    v8 = _ZNSt3__16vectorIN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS1_27animator_interpolation_typeE0EEENS_9allocatorIS5_EEE21__push_back_slow_pathIS5_EEPS5_OT_(*a1, a2);
  }
  else
  {
    *v4 = *a2;
    v5 = a2[1];
    v6 = a2[2];
    v7 = a2[4];
    v4[3] = a2[3];
    v4[4] = v7;
    v4[1] = v5;
    v4[2] = v6;
    _ZNSt3__116__variant_detail18__move_constructorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_fEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEELNS0_6_TraitE1EEC2EOSH_((uint64_t)(v4 + 5), (uint64_t)(a2 + 5));
    v8 = (uint64_t)(v4 + 6);
  }
  v3[1] = v8;
  return a1;
}

uint64_t _ZNSt3__16vectorIN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS1_27animator_interpolation_typeE0EEENS_9allocatorIS5_EEE21__push_back_slow_pathIS5_EEPS5_OT_(uint64_t *a1, _OWORD *a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  char *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  _QWORD v17[5];

  v3 = *a1;
  v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 5);
  v5 = v4 + 1;
  if (v4 + 1 > 0x2AAAAAAAAAAAAAALL)
    std::vector<UIView * {__strong}>::__throw_length_error[abi:ne180100]();
  v7 = (uint64_t)(a1 + 2);
  v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 5);
  if (2 * v8 > v5)
    v5 = 2 * v8;
  if (v8 >= 0x155555555555555)
    v9 = 0x2AAAAAAAAAAAAAALL;
  else
    v9 = v5;
  v17[4] = a1 + 2;
  if (v9)
    v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<LAUI_uniform_cubic_b_spline_renderer_private::instance_uniform>>(v7, v9);
  else
    v10 = 0;
  v11 = &v10[96 * v4];
  v17[0] = v10;
  v17[1] = v11;
  v17[3] = &v10[96 * v9];
  v12 = a2[1];
  v13 = a2[2];
  v14 = a2[4];
  *((_OWORD *)v11 + 3) = a2[3];
  *((_OWORD *)v11 + 4) = v14;
  *((_OWORD *)v11 + 2) = v13;
  *(_OWORD *)v11 = *a2;
  *((_OWORD *)v11 + 1) = v12;
  _ZNSt3__116__variant_detail18__move_constructorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_fEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEELNS0_6_TraitE1EEC2EOSH_((uint64_t)(v11 + 80), (uint64_t)(a2 + 5));
  v17[2] = v11 + 96;
  _ZNSt3__16vectorIN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS1_27animator_interpolation_typeE0EEENS_9allocatorIS5_EEE26__swap_out_circular_bufferERNS_14__split_bufferIS5_RS7_EE(a1, v17);
  v15 = a1[1];
  _ZNSt3__114__split_bufferIN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS1_27animator_interpolation_typeE0EEERNS_9allocatorIS5_EEED2Ev((uint64_t)v17);
  return v15;
}

void sub_209E2BB68(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  _ZNSt3__114__split_bufferIN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS1_27animator_interpolation_typeE0EEERNS_9allocatorIS5_EEED2Ev((uint64_t)va);
  _Unwind_Resume(a1);
}

double _ZN21LAUI_metal_transforms20look_at_transform_LHIDv3_ddEEN4simd6MatrixIT0_Lm4ELm4EE4typeERKT_S9_S9_@<D0>(float64x2_t *a1@<X0>, float64x2_t *a2@<X1>, float64x2_t *a3@<X2>, uint64_t a4@<X8>)
{
  float64x2_t v4;
  float64x2_t v5;
  float64x2_t v6;
  float64x2_t v7;
  float64x2_t v8;
  float64x2_t v9;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t v13;
  float64_t v14;
  double v15;
  float64x2_t v16;
  float64x2_t v17;
  double v18;
  float64x2_t v19;
  float64x2_t v20;
  float64x2_t v21;
  float64x2_t v22;
  float64x2_t v23;
  float64x2_t v24;
  double v25;
  float64x2_t v26;
  float64x2_t v27;
  __int128 v28;

  v4 = a1[1];
  v5 = vsubq_f64(*a2, *a1);
  v6 = vsubq_f64(a2[1], v4);
  v7 = vmulq_f64(v6, v6);
  v8 = vmulq_f64(v5, v5);
  v8.f64[0] = 1.0 / sqrt(v7.f64[0] + vaddvq_f64(v8));
  v9 = vmulq_n_f64(v5, v8.f64[0]);
  v10 = vmulq_f64(v6, v8);
  v11 = a3[1];
  v12 = vmlaq_laneq_f64(vmulq_laneq_f64(vnegq_f64(v11), v9, 1), v10, *a3, 1);
  v13 = vnegq_f64(v10);
  v14 = v10.f64[0];
  v15 = vmulq_f64(v4, v10).f64[0];
  v10.f64[1] = v9.f64[0];
  v11.f64[1] = a3->f64[0];
  v16 = vmlaq_f64(vmulq_f64(v10, vnegq_f64(*a3)), v9, v11);
  v17 = vmulq_f64(v16, v16);
  v18 = vmulq_f64(v12, v12).f64[0];
  v12.f64[1] = v16.f64[0];
  v17.f64[0] = 1.0 / sqrt(v17.f64[1] + v18 + v17.f64[0]);
  v19 = vmulq_n_f64(v12, v17.f64[0]);
  v20 = vmulq_laneq_f64(v17, v16, 1);
  *(_QWORD *)&v17.f64[0] = vdupq_laneq_s64((int64x2_t)v19, 1).u64[0];
  v21.f64[0] = v20.f64[0];
  v21.f64[1] = v19.f64[0];
  v22 = vmlaq_f64(vmulq_f64(v21, vnegq_f64(v9)), v19, v10);
  v23 = vmlaq_laneq_f64(vmulq_laneq_f64(v13, v19, 1), v20, v9, 1);
  v24 = vmulq_f64(v22, v22);
  v25 = vmulq_f64(v23, v23).f64[0];
  v23.f64[1] = v22.f64[0];
  v7.f64[0] = 1.0 / sqrt(v24.f64[1] + v25 + v24.f64[0]);
  v26 = vmulq_laneq_f64(v7, v22, 1);
  v27 = vmulq_n_f64(v23, v7.f64[0]);
  v17.f64[1] = v27.f64[1];
  *(double *)&v28 = -(vmulq_f64(v4, v20).f64[0] + vaddvq_f64(vmulq_f64(*a1, v19)));
  *((double *)&v28 + 1) = -(vmulq_f64(v4, v26).f64[0] + vaddvq_f64(vmulq_f64(*a1, v27)));
  __asm { FMOV            V0.2D, #1.0 }
  *(double *)&_Q0 = -(v15 + vaddvq_f64(vmulq_f64(*a1, v9)));
  *(int64x2_t *)a4 = vzip1q_s64((int64x2_t)v19, (int64x2_t)v27);
  *(_OWORD *)(a4 + 16) = *(unint64_t *)&v9.f64[0];
  *(float64x2_t *)(a4 + 32) = v17;
  *(_OWORD *)(a4 + 48) = *(unint64_t *)&v9.f64[1];
  *(int64x2_t *)(a4 + 64) = vzip1q_s64((int64x2_t)v20, (int64x2_t)v26);
  *(_OWORD *)(a4 + 80) = *(unint64_t *)&v14;
  *(_OWORD *)(a4 + 96) = v28;
  *(_OWORD *)(a4 + 112) = _Q0;
  return *(double *)&_Q0;
}

void ***_ZNSt3__120back_insert_iteratorINS_6vectorIDv3_fNS_9allocatorIS2_EEEEEaSB8ne180100EOS2_(void ***a1, _OWORD *a2)
{
  void **v4;
  _OWORD *v5;
  void **v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  _OWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  __int128 v20;

  v4 = *a1;
  v5 = (*a1)[1];
  v6 = *a1;
  v9 = (unint64_t)v6[2];
  v7 = (uint64_t)(v6 + 2);
  v8 = v9;
  if ((unint64_t)v5 >= v9)
  {
    v11 = ((char *)v5 - (_BYTE *)*v4) >> 4;
    if ((unint64_t)(v11 + 1) >> 60)
      std::vector<UIView * {__strong}>::__throw_length_error[abi:ne180100]();
    v12 = v8 - (_QWORD)*v4;
    v13 = v12 >> 3;
    if (v12 >> 3 <= (unint64_t)(v11 + 1))
      v13 = v11 + 1;
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF0)
      v14 = 0xFFFFFFFFFFFFFFFLL;
    else
      v14 = v13;
    if (v14)
      v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<LAUI_uniform_cubic_b_spline_renderer_private::control_point>>(v7, v14);
    else
      v15 = 0;
    v16 = &v15[16 * v11];
    v17 = &v15[16 * v14];
    *(_OWORD *)v16 = *a2;
    v10 = v16 + 16;
    v19 = (char *)*v4;
    v18 = (char *)v4[1];
    if (v18 != *v4)
    {
      do
      {
        v20 = *((_OWORD *)v18 - 1);
        v18 -= 16;
        *((_OWORD *)v16 - 1) = v20;
        v16 -= 16;
      }
      while (v18 != v19);
      v18 = (char *)*v4;
    }
    *v4 = v16;
    v4[1] = v10;
    v4[2] = v17;
    if (v18)
      operator delete(v18);
  }
  else
  {
    *v5 = *a2;
    v10 = v5 + 1;
  }
  v4[1] = v10;
  return a1;
}

_QWORD *LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t::state_t(_QWORD *a1, uint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPS1_S6_EEvT_T0_m(a1, *(const void **)a2, *(_QWORD *)(a2 + 8), (uint64_t)(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 4);
  return a1;
}

_QWORD *_ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPS1_S6_EEvT_T0_m(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE11__vallocateB8ne180100Em(result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_209E2BE48(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void std::__throw_out_of_range[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::out_of_range::out_of_range[abi:ne180100](exception, a1);
}

void sub_209E2BEA0(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::out_of_range::out_of_range[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8C0] + 16);
  return result;
}

CGColor *LAUI_CA_utilities::create_converted_color(CGColor *color, CGColor *a2, CGColorSpace *a3)
{
  CGColor *v4;
  CGColor *ColorSpace;
  const __CFString *v6;
  const __CFString *v7;
  CFStringRef *v8;
  int v9;
  int v10;
  int v11;
  const __CFString *v12;
  const __CFString *v13;
  int v14;
  int v15;
  int v16;
  CGColorRenderingIntent v17;

  if (color)
  {
    v4 = color;
    if (!a2)
      return CGColorRetain(v4);
    ColorSpace = CGColorGetColorSpace(color);
    if (!ColorSpace || ColorSpace == a2)
      return CGColorRetain(v4);
    v6 = CGColorSpaceCopyName(ColorSpace);
    v7 = v6;
    v8 = (CFStringRef *)MEMORY[0x24BDBF278];
    if (!v6)
    {
      v9 = 0;
      v10 = 0;
      v11 = 0;
      goto LABEL_16;
    }
    if (CFStringCompare(v6, (CFStringRef)*MEMORY[0x24BDBF278], 0))
    {
      if (CFStringCompare(v7, (CFStringRef)*MEMORY[0x24BDBF270], 0))
      {
        if (CFStringCompare(v7, (CFStringRef)*MEMORY[0x24BDBF318], 0))
        {
          v9 = 0;
          v10 = CFStringCompare(v7, (CFStringRef)*MEMORY[0x24BDBF308], 0) == kCFCompareEqualTo;
          v11 = v10;
LABEL_15:
          CFRelease(v7);
LABEL_16:
          v12 = CGColorSpaceCopyName(a2);
          v13 = v12;
          if (!v12)
          {
            v17 = kCGRenderingIntentPerceptual;
            return CGColorCreateCopyByMatchingToColorSpace(a2, v17, v4, 0);
          }
          if (CFStringCompare(v12, *v8, 0))
          {
            if (CFStringCompare(v13, (CFStringRef)*MEMORY[0x24BDBF270], 0))
            {
              if (CFStringCompare(v13, (CFStringRef)*MEMORY[0x24BDBF318], 0))
              {
                v14 = 0;
                v15 = CFStringCompare(v13, (CFStringRef)*MEMORY[0x24BDBF308], 0) == kCFCompareEqualTo;
                v16 = v15;
LABEL_26:
                CFRelease(v13);
                v17 = kCGRenderingIntentPerceptual;
                if (v11 && v16 && ((((v14 << 16) | (v15 << 8) | v16) ^ ((v9 << 16) | (v10 << 8) | v11)) & 0x10000) == 0)
                {
                  if ((((unsigned __int16)(((_WORD)v15 << 8) | v16) ^ (unsigned __int16)(((_WORD)v10 << 8) | v11)) & 0x100) == 0)
                    return CGColorRetain(v4);
                  v17 = kCGRenderingIntentAbsoluteColorimetric;
                }
                return CGColorCreateCopyByMatchingToColorSpace(a2, v17, v4, 0);
              }
              v14 = 0;
              v15 = 0;
            }
            else
            {
              v14 = 1;
              v15 = 1;
            }
          }
          else
          {
            v15 = 0;
            v14 = 1;
          }
          v16 = 1;
          goto LABEL_26;
        }
        v9 = 0;
        v10 = 0;
      }
      else
      {
        v9 = 1;
        v10 = 1;
      }
    }
    else
    {
      v10 = 0;
      v9 = 1;
    }
    v11 = 1;
    goto LABEL_15;
  }
  return color;
}

void LAUI_uniform_cubic_b_spline_renderer::renderer_t::~renderer_t(LAUI_uniform_cubic_b_spline_renderer::renderer_t *this)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t i;
  void **v8;

  v2 = (void *)*((_QWORD *)this + 104);
  if (v2)
  {
    *((_QWORD *)this + 105) = v2;
    operator delete(v2);
  }
  v3 = (void *)*((_QWORD *)this + 101);
  if (v3)
  {
    *((_QWORD *)this + 102) = v3;
    operator delete(v3);
  }
  v4 = (void *)*((_QWORD *)this + 98);
  if (v4)
  {
    *((_QWORD *)this + 99) = v4;
    operator delete(v4);
  }
  v5 = (void *)*((_QWORD *)this + 95);
  if (v5)
  {
    *((_QWORD *)this + 96) = v5;
    operator delete(v5);
  }
  v6 = (void *)*((_QWORD *)this + 92);
  if (v6)
  {
    *((_QWORD *)this + 93) = v6;
    operator delete(v6);
  }
  v8 = (void **)((char *)this + 688);
  std::vector<LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t>::__destroy_vector::operator()[abi:ne180100](&v8);
  for (i = 656; i != 640; i -= 8)

  std::shared_ptr<std::atomic<unsigned char>>::~shared_ptr[abi:ne180100]((uint64_t)this + 576);
  v8 = (void **)((char *)this + 552);
  std::vector<LAUI_uniform_cubic_b_spline_renderer::renderer_t::buffers_t>::__destroy_vector::operator()[abi:ne180100](&v8);

  LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::~shared_state_t((id *)this + 3);
}

void std::vector<LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v2;

  v2 = *a1;
  if (*v2)
  {
    std::vector<LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t>::__clear[abi:ne180100]((uint64_t *)v2);
    operator delete(**a1);
  }
}

void std::vector<LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2;
  uint64_t i;
  void *v4;

  v2 = *a1;
  for (i = a1[1]; i != v2; i -= 56)
  {
    v4 = *(void **)(i - 24);
    if (v4)
    {
      *(_QWORD *)(i - 16) = v4;
      operator delete(v4);
    }
  }
  a1[1] = v2;
}

void std::vector<LAUI_uniform_cubic_b_spline_renderer::renderer_t::buffers_t>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  id *v2;
  id *v4;
  void *v5;

  v1 = *a1;
  v2 = (id *)**a1;
  if (v2)
  {
    v4 = (id *)v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v4 -= 6;
        std::__destroy_at[abi:ne180100]<LAUI_uniform_cubic_b_spline_renderer::renderer_t::buffers_t,0>(v4);
      }
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void LAUI_CA_utilities::animation_completion_handler_container::set_completion(void **a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  LAUI_CA_utilities::animation_completion_handler_container::operator()(a1, 0);
  v3 = objc_msgSend(v5, "copy");
  v4 = *a1;
  *a1 = (void *)v3;

}

uint64_t ___ZN17LAUI_CA_utilities38animation_completion_handler_containerclEb_block_invoke_0(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void LAUI_uniform_cubic_b_spline_renderer::targetable_animator_t<`anonymous namespace'::face_id_animator_t,`anonymous namespace'::face_id_state_t,`anonymous namespace'::face_id_target_t>::set_target(uint64_t a1, uint64_t a2)
{
  __int32 v2;
  uint64_t v5;
  unsigned int v6;
  _BOOL4 v7;
  unsigned int v8;
  uint64_t v9;
  unint64_t v10;
  float64x2_t v11;
  __int128 v12;
  __int128 v13;
  float32x4_t *v14;
  float32x4_t *v15;
  double v16;
  unsigned int v17;
  int v18;
  int v19;
  BOOL v21;
  float32x4_t v23;
  float32x4_t v24;
  float32x4_t v25;
  float32x4_t v26;
  int8x16_t v27;
  float32x4_t v28;
  int32x4_t v29;
  int8x16_t v30;
  float32x4_t v31;
  float32x4_t v32;
  float32x4_t v33;
  float v34;
  double v35;
  float32x2_t v36;
  float32x2_t v37;
  float32x4_t v38;
  float32x4_t v39;
  float32x4_t v40;
  double v41;
  double v42;
  double v43;
  double v44;
  float64x2_t v45;
  int8x16_t *v47;
  int v48;
  float v49;
  double v50;
  double v51;
  int v52;
  unint64_t v53;
  float64x2_t v54;
  float64x2_t v55;
  int8x16_t v56;
  float v60;
  float v61;
  int8x16_t v62;
  int8x16_t v63;
  _QWORD *v64;
  uint64_t v65;
  uint64_t v66;
  __int128 v67;
  unsigned int v68;
  unint64_t v69;
  __int128 v70;
  __int128 *v71;
  _OWORD *v72;
  uint64_t v73;
  uint64_t v74;
  _OWORD *v75;
  uint64_t v76;
  uint64_t v77;
  _QWORD *v78;
  int8x8_t v79;
  unint64_t v80;
  unint64_t v81;
  _QWORD *v82;
  _QWORD *v83;
  unint64_t v84;
  unsigned int v86;
  uint64_t v87;
  uint64_t v88;
  __int8 *v89;
  int8x16_t v90;
  int8x16_t v91;
  unint64_t v92;
  unsigned int v93;
  BOOL v94;
  uint64_t (*v95)(float32x4_t *, float *);
  uint64_t (*v96)(float32x4_t *, float *);
  uint64_t v97;
  uint64_t v98;
  uint64_t (*v99)(float32x4_t *, float *);
  uint64_t (**v100)(float32x4_t *, float *);
  uint64_t (*v101)(float32x4_t *, float *);
  uint64_t *v102;
  uint64_t v104;
  void *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t (*v108)(float32x4_t *, float *);
  uint64_t (*v109)(float32x4_t *, float *);
  BOOL v110;
  char v111;
  uint64_t v112;
  uint64_t v113;
  float v114;
  uint64_t v115;
  __int32 *v116;
  float v117;
  float *v118;
  float v119;
  float v120;
  BOOL v122;
  uint64_t (*v123)(float32x4_t *, float *);
  uint64_t v124;
  _DWORD *v125;
  float v126;
  float v127;
  BOOL v128;
  uint64_t v130;
  float v131;
  float v132;
  int8x16_t *v133;
  unsigned int v134;
  int8x16_t v135;
  int8x16_t v136;
  int8x16_t v137;
  uint64_t v138;
  _QWORD *v139;
  float64x2_t v140;
  _QWORD *v141;
  int8x16_t *v142;
  _QWORD *v143;
  float v144;
  int8x16_t v145;
  float32x4_t v146;
  int8x16_t v147;
  float32x2_t v148;
  double v149;
  char v150;
  float64_t v151;
  char v152;
  float32x2_t v153[4];
  _BYTE v154[28];
  _BYTE v155[28];
  float32x2_t v156;
  void *__p[8];
  _BYTE v158[28];
  char v159;
  __int128 v160;
  _BYTE v161[28];
  char v162;
  _BYTE v163[28];
  __int128 v164;
  void *v165;

  *(_BYTE *)(a1 + 49) = 1;
  v2 = *(__int32 *)(a2 + 100);
  v156.i32[0] = 953267991;
  v156.i32[1] = v2;
  if (*(float *)&v2 <= 0.0 || *(float *)&v2 >= 1.0)
    goto LABEL_234;
  v5 = a1;
  if (*(float *)&v2 < 0.0001)
    v156.i32[0] = v2;
  LAUI_uniform_cubic_b_spline_renderer::animation_timing_t::animation_timing_t((float32x2_t *)v155, &v156, *(float *)(a2 + 80));
  if (*(_BYTE *)(a2 + 88))
  {
    LAUI_uniform_cubic_b_spline_renderer::animation_timing_t::animation_timing_t((float32x2_t *)v154, &v156, *(float *)(a2 + 84));
  }
  else
  {
    *(_OWORD *)v154 = *(_OWORD *)v155;
    *(_OWORD *)&v154[12] = *(_OWORD *)&v155[12];
  }
  if (*(_BYTE *)(a2 + 96))
  {
    LAUI_uniform_cubic_b_spline_renderer::animation_timing_t::animation_timing_t(v153, &v156, *(float *)(a2 + 92));
  }
  else
  {
    *(_OWORD *)v153[0].f32 = *(_OWORD *)v155;
    *(_OWORD *)&v153[1].i32[1] = *(_OWORD *)&v155[12];
  }
  v6 = *(unsigned __int8 *)(a2 + 72);
  if (v6 - 3 >= 2)
  {
    v8 = *(unsigned __int8 *)(v5 + 40);
    if (*(_BYTE *)(v5 + 40))
    {
      v7 = (unint64_t)((*(_QWORD *)(v5 + 8) - *(_QWORD *)v5) / 112) > 1;
      v8 = 2 * v7;
    }
    else
    {
      LOBYTE(v7) = 0;
    }
  }
  else
  {
    LOBYTE(v7) = 0;
    v8 = 0;
  }
  v9 = *(float *)&v155[16] <= 0.0 ? 6 : v8;
  if (v6 >= 7)
    goto LABEL_234;
  v10 = 0x1020403uLL >> (8 * v6);
  v148.i8[0] = v10;
  LOBYTE(v149) = 0;
  LOBYTE(v151) = 0;
  *(_OWORD *)(v5 + 80) = *(_OWORD *)a2;
  v12 = *(_OWORD *)(a2 + 32);
  v11 = *(float64x2_t *)(a2 + 48);
  v13 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v5 + 137) = *(_OWORD *)(a2 + 57);
  *(_OWORD *)(v5 + 112) = v12;
  *(float64x2_t *)(v5 + 128) = v11;
  *(_OWORD *)(v5 + 96) = v13;
  v142 = (int8x16_t *)(v5 + 80);
  v14 = *(float32x4_t **)(v5 + 872);
  v15 = *(float32x4_t **)(v5 + 880);
  v11.f64[0] = v151;
  v16 = v149;
  v138 = a2;
  v140 = v11;
  if (v14 != v15)
  {
    v17 = *(unsigned __int8 *)(a2 + 72);
    if (v17 > 6)
      goto LABEL_234;
    v18 = 0;
    v19 = 0;
    v21 = v17 != 3 || *(_QWORD *)(a2 + 56) < 0xAuLL;
    while (1)
    {
      if (!v21)
        goto LABEL_234;
      if (v10 - 2 >= 3 && v10 != 0)
      {
        if (v10 != 1)
          goto LABEL_234;
        goto LABEL_58;
      }
      v23 = v14[10];
      v24 = vmulq_f32(v23, (float32x4_t)xmmword_209E30C90);
      v25 = (float32x4_t)vextq_s8((int8x16_t)v24, (int8x16_t)v24, 8uLL);
      *(float32x2_t *)v24.f32 = vadd_f32(*(float32x2_t *)v24.f32, *(float32x2_t *)v25.f32);
      v24.f32[0] = vaddv_f32(*(float32x2_t *)v24.f32);
      v25.i32[0] = 0;
      v26 = (float32x4_t)vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vcgtq_f32(v25, v24), 0), (int8x16_t)vnegq_f32(v23), (int8x16_t)v23);
      v27 = (int8x16_t)vmulq_f32(v26, v26);
      *(float32x2_t *)v27.i8 = vadd_f32(*(float32x2_t *)v27.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v27, v27, 8uLL));
      v27.i32[0] = vadd_f32(*(float32x2_t *)v27.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v27.i8, 1)).u32[0];
      *(float32x2_t *)v25.f32 = vrecpe_f32((float32x2_t)v27.u32[0]);
      *(float32x2_t *)v25.f32 = vmul_f32(*(float32x2_t *)v25.f32, vrecps_f32((float32x2_t)v27.u32[0], *(float32x2_t *)v25.f32));
      v28 = vmulq_n_f32(vmulq_f32(v26, (float32x4_t)xmmword_209E30FE0), vmul_f32(*(float32x2_t *)v25.f32, vrecps_f32((float32x2_t)v27.u32[0], *(float32x2_t *)v25.f32)).f32[0]);
      v29 = (int32x4_t)vnegq_f32(v28);
      v30 = (int8x16_t)vtrn2q_s32((int32x4_t)v28, vtrn1q_s32((int32x4_t)v28, v29));
      v31 = (float32x4_t)vrev64q_s32((int32x4_t)v28);
      v31.i32[0] = v29.i32[1];
      v31.i32[3] = v29.i32[2];
      v32 = vaddq_f32(vmlaq_f32(v28, (float32x4_t)0, v31), vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)v28, (int8x16_t)v29, 8uLL), (float32x4_t)0), (float32x4_t)0, (float32x4_t)vextq_s8(v30, v30, 8uLL)));
      v33 = vmulq_f32(v32, v32);
      LODWORD(v144) = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v33, 2), vaddq_f32(v33, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v33.f32, 1))).u32[0];
      v146 = v32;
      v34 = atan2f(sqrtf(v144), v32.f32[3]);
      v35 = fabsf(v34 + v34) / 0.785398163;
      if (v35 != 0.0)
      {
        v36 = vrsqrte_f32((float32x2_t)LODWORD(v144));
        v37 = vmul_f32(v36, vrsqrts_f32((float32x2_t)LODWORD(v144), vmul_f32(v36, v36)));
        v38 = vmulq_n_f32(v146, vmul_f32(v37, vrsqrts_f32((float32x2_t)LODWORD(v144), vmul_f32(v37, v37))).f32[0]);
        v39 = vmulq_f32(v38, (float32x4_t)xmmword_209E31040);
        v40 = vmulq_f32(v38, v38);
        v41 = acos((float)(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v39, 2), vaddq_f32(v39, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v39.f32, 1))).f32[0]/ sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v40, 2), vaddq_f32(v40, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v40.f32, 1))).f32[0])));
        if (v41 >= 1.57079633)
          v41 = 3.14159265 - v41;
        v42 = v41 / 1.57079633;
        if (v10 - 2 >= 3)
        {
          if (v10 >= 2u)
            goto LABEL_234;
          if (v42 == 0.0)
            goto LABEL_58;
          v35 = v35 * v42;
        }
        if (v35 != 0.0)
        {
          v43 = fmin(v35, 1.0);
          v44 = fmin(v42, 1.0);
          v45 = v140;
          if (v140.f64[0] < v44 || v18 == 0)
            v45.f64[0] = v44;
          v140 = v45;
          if (v19)
          {
            if (v16 < v43)
              v16 = v43;
          }
          else
          {
            v19 = 1;
            v16 = v43;
          }
          v18 = 1;
        }
      }
LABEL_58:
      v14 += 18;
      if (v14 == v15)
        goto LABEL_61;
    }
  }
  LOBYTE(v19) = 0;
  v18 = 0;
LABEL_61:
  v152 = v18;
  v151 = v140.f64[0];
  v150 = v19;
  v149 = v16;
  if (*(_BYTE *)(v5 + 144))
  {
    v47 = (int8x16_t *)(v5 + 80);
    v48 = 0;
    v49 = 1.0;
    v50 = -3.14159265;
    v51 = 3.14159265;
    v52 = 0;
    switch(*(_BYTE *)(v5 + 152))
    {
      case 0:
      case 1:
      case 2:
      case 3:
      case 5:
        goto LABEL_68;
      case 4:
        goto LABEL_66;
      case 6:
        goto LABEL_67;
      default:
        goto LABEL_234;
    }
  }
  v47 = (int8x16_t *)(v5 + 80);
  v48 = 0;
  v49 = 1.0;
  v50 = -3.14159265;
  v51 = 3.14159265;
  v52 = 0;
  switch(*(_BYTE *)(v5 + 152))
  {
    case 0:
    case 1:
    case 2:
    case 5:
      goto LABEL_68;
    case 3:
      v53 = *(_QWORD *)(v5 + 136);
      if (v53 >= 0xA)
        goto LABEL_234;
      v48 = dword_209E31370[v53];
      v52 = dword_209E31398[v53];
      v49 = 0.2;
LABEL_68:
      *(float *)__p = v49;
      *(_OWORD *)((char *)__p + 4) = *(_OWORD *)v154;
      *(_OWORD *)&__p[2] = *(_OWORD *)&v154[12];
      LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::set_target<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>(v5 + 272, (uint64_t)__p, v9);
      LODWORD(__p[0]) = v48;
      *(_OWORD *)((char *)__p + 4) = *(_OWORD *)v154;
      *(_OWORD *)&__p[2] = *(_OWORD *)&v154[12];
      LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::set_target<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>(v5 + 328, (uint64_t)__p, v9);
      LODWORD(__p[0]) = v52;
      *(_OWORD *)((char *)__p + 4) = *(_OWORD *)v154;
      *(_OWORD *)&__p[2] = *(_OWORD *)&v154[12];
      LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::set_target<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>(v5 + 384, (uint64_t)__p, v9);
      LODWORD(__p[0]) = 1066285284;
      *(_OWORD *)((char *)__p + 4) = *(_OWORD *)v154;
      *(_OWORD *)&__p[2] = *(_OWORD *)&v154[12];
      LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)1>::set_target<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>(v5 + 440, (uint64_t)__p, v9);
      *(_OWORD *)&v161[12] = *(_OWORD *)&v155[12];
      *(_OWORD *)v161 = *(_OWORD *)v155;
      if (*(float *)&v155[16] <= 0.0)
        goto LABEL_80;
      if (v10 - 2 >= 3)
      {
        if (v10 >= 2u)
          goto LABEL_234;
      }
      else
      {
        if (v159)
        {
          if (v18 && v140.f64[0] > 0.0)
          {
            if (v140.f64[0] >= 1.0)
            {
              v56 = *(int8x16_t *)(v5 + 176);
              v54.f64[0] = *(float64_t *)(v5 + 192);
            }
            else
            {
              v55.f64[0] = 1.0 - v140.f64[0];
              v54 = vmlaq_f64(vmulq_f64(v140, *(float64x2_t *)(v5 + 192)), *(float64x2_t *)(v5 + 224), v55);
              v56 = (int8x16_t)vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)(v5 + 176), v140.f64[0]), *(float64x2_t *)(v5 + 208), 1.0 - v140.f64[0]);
            }
          }
          else
          {
            v56 = *(int8x16_t *)(v5 + 208);
            v54.f64[0] = *(float64_t *)(v5 + 224);
          }
          v56.i64[1] = vextq_s8(v56, v56, 8uLL).u64[0];
          *(int8x16_t *)__p = v56;
          *(float64x2_t *)&__p[2] = v54;
          *(_OWORD *)&__p[4] = *(_OWORD *)v161;
          *(_OWORD *)((char *)&__p[5] + 4) = *(_OWORD *)&v161[12];
          _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_dLNS_27animator_interpolation_typeE0EE10set_targetINS_18animation_target_tIS1_EEEEbOT_NS_25animation_target_option_tE(v5 + 496, (uint64_t)__p, v9);
          *(_OWORD *)v161 = *(_OWORD *)v158;
          *(_OWORD *)&v161[12] = *(_OWORD *)&v158[12];
        }
      }
LABEL_80:
      __p[0] = 0;
      __p[1] = 0;
      __asm { FMOV            V0.2D, #-3.0 }
      *(_OWORD *)&__p[2] = _Q0;
      *(_OWORD *)&__p[4] = *(_OWORD *)v161;
      *(_OWORD *)((char *)&__p[5] + 4) = *(_OWORD *)&v161[12];
      _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_dLNS_27animator_interpolation_typeE0EE10set_targetINS_18animation_target_tIS1_EEEEbOT_NS_25animation_target_option_tE(v5 + 496, (uint64_t)__p, v9);
      v60 = v50;
      *(float *)__p = v60;
      *(_OWORD *)((char *)__p + 4) = *(_OWORD *)v155;
      *(_OWORD *)&__p[2] = *(_OWORD *)&v155[12];
      LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::set_target<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>(v5 + 640, (uint64_t)__p, v9);
      v61 = v51;
      *(float *)__p = v61;
      *(_OWORD *)((char *)__p + 4) = *(_OWORD *)v155;
      *(_OWORD *)&__p[2] = *(_OWORD *)&v155[12];
      LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::set_target<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>(v5 + 696, (uint64_t)__p, v9);
      if (((*(float *)&v155[16] > 0.0) & ~v7) == 0)
      {
        __p[0] = 0;
        *(_OWORD *)&__p[1] = *(_OWORD *)v155;
        *(_OWORD *)((char *)&__p[2] + 4) = *(_OWORD *)&v155[12];
        LAUI_uniform_cubic_b_spline_renderer::animator_t<decltype(nullptr),(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::set_target<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<decltype(nullptr)>>(v5 + 752, (uint64_t)__p);
      }
      v64 = *(_QWORD **)(v5 + 848);
      v139 = *(_QWORD **)(v5 + 856);
      if (v64 == v139)
        goto LABEL_222;
      break;
    case 4:
LABEL_66:
      v50 = *(double *)(v5 + 248);
      v51 = *(double *)(v5 + 256);
      goto LABEL_68;
    case 6:
LABEL_67:
      v51 = 0.0;
      v50 = 0.0;
      goto LABEL_68;
    default:
      goto LABEL_234;
  }
  do
  {
    *(_OWORD *)&v163[12] = *(_OWORD *)&v155[12];
    *(_OWORD *)v163 = *(_OWORD *)v155;
    v141 = v64;
    if (*(float *)&v155[16] > 0.0 && v148.u8[0] - 2 >= 3)
    {
      if (v148.u8[0] >= 2u)
        goto LABEL_235;
      if (v162)
      {
        v65 = 4;
        v66 = 1;
        switch(*(_BYTE *)(v5 + 152))
        {
          case 0:
            v65 = 3;
            goto LABEL_90;
          case 1:
            goto LABEL_90;
          case 2:
            v65 = 2;
LABEL_90:
            v66 = v65;
            goto LABEL_91;
          case 3:
          case 4:
          case 5:
          case 6:
LABEL_91:
            LODWORD(__p[0]) = 0;
            std::vector<float>::vector(&v164, v66 + 1, __p);
            v67 = v164;
            *(_DWORD *)(v164 + 4 * v66) = 1065353216;
            *(_OWORD *)__p = v67;
            __p[2] = v165;
            v165 = 0;
            v164 = 0uLL;
            LAUI_uniform_cubic_b_spline_renderer::weighted_spline_t::state(v64 + 4, __p, (uint64_t)v158);
            if (__p[0])
            {
              __p[1] = __p[0];
              operator delete(__p[0]);
            }
            if ((_QWORD)v164)
            {
              *((_QWORD *)&v164 + 1) = v164;
              operator delete((void *)v164);
            }
            v68 = *(unsigned __int8 *)(v5 + 152);
            if (v68 >= 7)
              goto LABEL_234;
            v69 = 0x1020403uLL >> (8 * v68);
            if (v148.u8[0] - 2 < 3)
            {
              v70 = 0uLL;
              switch((char)v69)
              {
                case 0:
                case 1:
                  goto LABEL_104;
                case 2:
                  goto LABEL_100;
                case 3:
                  goto LABEL_101;
                case 4:
                  goto LABEL_102;
                default:
                  goto LABEL_234;
              }
            }
            if (v148.u8[0] >= 2u)
              goto LABEL_236;
            v70 = 0uLL;
            switch((char)v69)
            {
              case 0:
              case 1:
                goto LABEL_104;
              case 2:
LABEL_100:
                v71 = (__int128 *)(v64 + 12);
                goto LABEL_103;
              case 3:
LABEL_101:
                v71 = (__int128 *)(v64 + 10);
                goto LABEL_103;
              case 4:
LABEL_102:
                v71 = (__int128 *)(v64 + 8);
LABEL_103:
                v70 = *v71;
LABEL_104:
                v160 = v70;
                *(_OWORD *)__p = v70;
                *(_OWORD *)&__p[2] = *(_OWORD *)v163;
                *(_OWORD *)((char *)&__p[3] + 4) = *(_OWORD *)&v163[12];
                _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS_27animator_interpolation_typeE0EE10set_targetINS_18animation_target_tIS1_EEEEbOT_NS_25animation_target_option_tE((uint64_t)(v64 + 14), (uint64_t)__p, v9);
                v72 = *(_OWORD **)v158;
                v74 = v64[26];
                v73 = v64[27];
                if (0xAAAAAAAAAAAAAAABLL * ((v73 - v74) >> 5) != (uint64_t)(*(_QWORD *)&v158[8] - *(_QWORD *)v158) >> 4)
                  goto LABEL_234;
                if (v74 != v73)
                {
                  do
                  {
                    *(_OWORD *)__p = *v72;
                    *(_OWORD *)&__p[2] = *(_OWORD *)v163;
                    *(_OWORD *)((char *)&__p[3] + 4) = *(_OWORD *)&v163[12];
                    _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS_27animator_interpolation_typeE0EE10set_targetINS_18animation_target_tIS1_EEEEbOT_NS_25animation_target_option_tE(v74, (uint64_t)__p, v9);
                    ++v72;
                    v74 += 96;
                  }
                  while (v74 != v73);
                  v72 = *(_OWORD **)v158;
                }
                *(_OWORD *)v163 = *(_OWORD *)v161;
                *(_OWORD *)&v163[12] = *(_OWORD *)&v161[12];
                if (v72)
                {
                  *(_QWORD *)&v158[8] = v72;
                  operator delete(v72);
                }
                break;
              default:
                goto LABEL_234;
            }
            break;
          default:
            goto LABEL_234;
        }
      }
    }
    *(_OWORD *)__p = v160;
    *(_OWORD *)&__p[2] = *(_OWORD *)v163;
    *(_OWORD *)((char *)&__p[3] + 4) = *(_OWORD *)&v163[12];
    _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS_27animator_interpolation_typeE0EE10set_targetINS_18animation_target_tIS1_EEEEbOT_NS_25animation_target_option_tE((uint64_t)(v64 + 14), (uint64_t)__p, v9);
    v75 = *(_OWORD **)v158;
    v77 = v64[26];
    v76 = v64[27];
    if (0xAAAAAAAAAAAAAAABLL * ((v76 - v77) >> 5) != (uint64_t)(*(_QWORD *)&v158[8] - *(_QWORD *)v158) >> 4)
      goto LABEL_234;
    if (v77 != v76)
    {
      do
      {
        *(_OWORD *)__p = *v75;
        *(_OWORD *)&__p[2] = *(_OWORD *)v163;
        *(_OWORD *)((char *)&__p[3] + 4) = *(_OWORD *)&v163[12];
        _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS_27animator_interpolation_typeE0EE10set_targetINS_18animation_target_tIS1_EEEEbOT_NS_25animation_target_option_tE(v77, (uint64_t)__p, v9);
        ++v75;
        v77 += 96;
      }
      while (v77 != v76);
      v75 = *(_OWORD **)v158;
    }
    if (v75)
    {
      *(_QWORD *)&v158[8] = v75;
      operator delete(v75);
    }
    v78 = (_QWORD *)v64[1];
    v143 = (_QWORD *)v64[2];
    if (v78 == v143)
      goto LABEL_221;
    do
    {
      v79 = *(int8x8_t *)(v5 + 1152);
      if (!*(_QWORD *)&v79)
        goto LABEL_233;
      v80 = v78[1];
      *(int8x8_t *)v62.i8 = vcnt_s8(v79);
      v62.i16[0] = vaddlv_u8(*(uint8x8_t *)v62.i8);
      if (v62.u32[0] > 1uLL)
      {
        v81 = v78[1];
        if (v80 >= *(_QWORD *)&v79)
          v81 = v80 % *(_QWORD *)&v79;
      }
      else
      {
        v81 = (*(_QWORD *)&v79 - 1) & v80;
      }
      v82 = *(_QWORD **)(*(_QWORD *)(v5 + 1144) + 8 * v81);
      if (!v82 || (v83 = (_QWORD *)*v82) == 0)
LABEL_233:
        std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
      while (1)
      {
        v84 = v83[1];
        if (v84 == v80)
          break;
        if (v62.u32[0] > 1uLL)
        {
          if (v84 >= *(_QWORD *)&v79)
            v84 %= *(_QWORD *)&v79;
        }
        else
        {
          v84 &= *(_QWORD *)&v79 - 1;
        }
        if (v84 != v81)
          goto LABEL_233;
LABEL_136:
        v83 = (_QWORD *)*v83;
        if (!v83)
          goto LABEL_233;
      }
      if (v83[2] != *v78 || v83[3] != v80)
        goto LABEL_136;
      v86 = *(unsigned __int8 *)(v5 + 152);
      if (v86 > 6)
        goto LABEL_234;
      v87 = v83[4];
      v88 = *(_QWORD *)(v5 + 872);
      v89 = (__int8 *)(v88 + 288 * v87);
      if (((1 << v86) & 0x37) == 0)
      {
        if (v86 != 3)
        {
          v62 = *v47;
          v62.i32[3] = 0;
          v145 = v62;
          goto LABEL_151;
        }
        v62 = *v47;
        v145 = *v47;
LABEL_145:
        v92 = *(_QWORD *)(v5 + 136);
        if (v92 >= 0xA)
          goto LABEL_234;
        v93 = 0x157u >> v92;
        if (v92 - 3 >= 7)
        {
          if (v92 >= 3)
            goto LABEL_234;
          v122 = *v89 == 0;
          if ((v93 & 1) != 0)
          {
          }
          else
          {
          }
          if (!v122)
            v96 = v123;
          v97 = 2228224;
          v106 = 34;
        }
        else
        {
          v94 = *v89 == 0;
          if ((v93 & 1) != 0)
          {
          }
          else
          {
          }
          if (!v94)
            v96 = v95;
          v97 = 0x20000;
LABEL_164:
          v106 = 2;
        }
        v104 = v106 | v97;
        v107 = v88 + 288 * v87;
        v109 = *(uint64_t (**)(float32x4_t *, float *))(v107 + 16);
        v100 = (uint64_t (**)(float32x4_t *, float *))(v107 + 16);
        v108 = v109;
        v102 = (uint64_t *)(v100 - 1);
        if (!v109
            : (v110 = 1),
              !v110 ? (v111 = 0) : (v111 = 1),
        {
          *v102 = v104;
          *v100 = v96;
          if (v96 == v108)
            goto LABEL_215;
          v112 = v5;
          v113 = v9;
          if (v108)
            v114 = 0.979;
          v115 = v88 + 288 * v87;
          *(float *)(v115 + 28) = v114;
          v116 = (__int32 *)(v115 + 28);
          v117 = *(float *)&v155[8];
          if (!v155[12])
            v117 = 0.001;
          *(float *)(v115 + 88) = v117;
          v118 = (float *)(v115 + 88);
          *(float *)__p = v114;
          HIDWORD(__p[0]) = fmaxf(fminf(nexttowardf(1.0, 0.0), 0.0), 0.0);
          LOBYTE(__p[1]) = 0;
          LOBYTE(__p[2]) = 0;
          HIDWORD(__p[3]) = 0;
          v119 = INFINITY;
          if (*((float *)__p + 1) <= 0.0)
            v119 = 0.0;
          *(float *)&__p[3] = v119;
          *((float *)&__p[2] + 1) = v119;
          LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)1>::set_target<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>((uint64_t)(v118 - 14), (uint64_t)__p, 6);
          v62.i32[0] = *v116;
          if (*(float *)v116 <= 0.0)
          {
            v9 = v113;
            v5 = v112;
            v47 = v142;
            goto LABEL_213;
          }
          v120 = *v118;
          LODWORD(__p[0]) = 953267991;
          *((float *)__p + 1) = v120;
          if (v120 > 0.0 && v120 < 1.0)
          {
            if (v120 < 0.0001)
              *(float *)__p = v120;
            LAUI_uniform_cubic_b_spline_renderer::animation_timing_t::animation_timing_t((float32x2_t *)v158, (float32x2_t *)__p, *(float *)v62.i32);
            LODWORD(__p[0]) = 0;
            *(_OWORD *)((char *)__p + 4) = *(_OWORD *)v158;
            *(_OWORD *)&__p[2] = *(_OWORD *)&v158[12];
            LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)1>::set_target<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>((uint64_t)(v118 - 14), (uint64_t)__p, 0);
            v9 = v113;
            v5 = v112;
            v47 = v142;
            goto LABEL_213;
          }
          goto LABEL_234;
        }
LABEL_175:
        *v102 = v104;
        *(_QWORD *)(v88 + 288 * v87 + 16) = v105;
        goto LABEL_213;
      }
      v62.i32[0] = 0;
      v63.i8[0] = *v89;
      v90 = vdupq_lane_s8((int8x8_t)*(_OWORD *)&vceqq_s8(v63, v62), 0);
      v63 = *v47;
      v91 = *v47;
      v91.i32[3] = 0;
      v62 = vbslq_s8(v90, v91, *v47);
      v145 = v62;
      if (v86 == 4)
      {
        v97 = 0;
        goto LABEL_164;
      }
      if (v86 == 3)
        goto LABEL_145;
LABEL_151:
      v98 = v88 + 288 * v87;
      v101 = *(uint64_t (**)(float32x4_t *, float *))(v98 + 16);
      v100 = (uint64_t (**)(float32x4_t *, float *))(v98 + 16);
      v99 = v101;
      v102 = (uint64_t *)(v100 - 1);
      if (!v101)
      {
        *v102 = 0;
        *v100 = 0;
        goto LABEL_216;
      }
      {
        if (v86 - 3 >= 4)
        {
          if (v86 < 3)
            goto LABEL_201;
          goto LABEL_234;
        }
        v104 = 2;
        goto LABEL_175;
      }
LABEL_201:
      *v102 = 0;
      *v100 = 0;
      v124 = v88 + 288 * v87;
      v126 = *(float *)(v124 + 88);
      v125 = (_DWORD *)(v124 + 88);
      v127 = v126;
      *(_DWORD *)v158 = 953267991;
      v128 = v126 > 0.0;
      if (v126 <= 0.0)
      {
        *(_DWORD *)&v158[4] = 981668463;
      }
      else
      {
        *(float *)&v158[4] = v127;
        if (!v128 || v127 >= 1.0)
          goto LABEL_234;
        if (v127 < 0.0001)
          *(float *)v158 = v127;
      }
      v130 = v88 + 288 * v87;
      LAUI_uniform_cubic_b_spline_renderer::animator_t<simd::quatf,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::resolve_infinite_duration(v130 + 96, (float32x2_t *)v158);
      _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv4_fLNS_27animator_interpolation_typeE0EE25resolve_infinite_durationERKNS_18animation_timing_t23epsilon_configuration_tE(v130 + 192, (float32x2_t *)v158);
      *(_QWORD *)(v130 + 24) = 0;
      *v125 = 0;
      LODWORD(__p[0]) = 0;
      HIDWORD(__p[0]) = fmaxf(fminf(nexttowardf(1.0, 0.0), 0.0), 0.0);
      LOBYTE(__p[1]) = 0;
      LOBYTE(__p[2]) = 0;
      HIDWORD(__p[3]) = 0;
      v131 = INFINITY;
      if (*((float *)__p + 1) <= 0.0)
        v131 = 0.0;
      *(float *)&__p[3] = v131;
      *((float *)&__p[2] + 1) = v131;
      LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)1>::set_target<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>(v130 + 32, (uint64_t)__p, 6);
      if (!*v100)
        goto LABEL_216;
LABEL_213:
      LOWORD(v106) = *(_WORD *)v102;
LABEL_215:
      if ((v106 & 2) != 0)
      {
LABEL_218:
        if ((v106 & 0x20) == 0)
          goto LABEL_219;
      }
      else
      {
LABEL_216:
        *(_OWORD *)__p = xmmword_209E30C90;
        *(_OWORD *)&__p[2] = *(_OWORD *)v155;
        *(_OWORD *)((char *)&__p[3] + 4) = *(_OWORD *)&v155[12];
        LAUI_uniform_cubic_b_spline_renderer::animator_t<simd::quatf,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::set_target<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<simd::quatf>>(v88 + 288 * v87 + 96, (uint64_t)__p, v9);
        if (*v100)
        {
          LOWORD(v106) = *(_WORD *)v102;
          goto LABEL_218;
        }
LABEL_219:
        *(int8x16_t *)__p = v145;
        *(_OWORD *)&__p[2] = *(_OWORD *)v155;
        *(_OWORD *)((char *)&__p[3] + 4) = *(_OWORD *)&v155[12];
        _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv4_fLNS_27animator_interpolation_typeE0EE10set_targetINS_18animation_target_tIS1_EEEEbOT_NS_25animation_target_option_tE(v88 + 288 * v87 + 192, (uint64_t)__p, v9);
      }
      v78 += 2;
    }
    while (v78 != v143);
LABEL_221:
    v64 = v141 + 30;
  }
  while (v141 + 30 != v139);
LABEL_222:
  if (*(_BYTE *)(v138 + 104))
  {
    *(_OWORD *)__p = xmmword_209E31050;
    LODWORD(__p[2]) = fmaxf(fminf(nexttowardf(1.0, 0.0), 0.0), 0.0);
    BYTE4(__p[2]) = 0;
    BYTE4(__p[3]) = 0;
    LODWORD(__p[5]) = 0;
    v132 = INFINITY;
    if (*(float *)&__p[2] <= 0.0)
      v132 = 0.0;
    *((float *)&__p[4] + 1) = v132;
    *(float *)&__p[4] = v132;
    LAUI_uniform_cubic_b_spline_renderer::animator_t<simd::quatf,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::set_target<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<simd::quatf>>(v5 + 912, (uint64_t)__p, 6);
  }
  v133 = (int8x16_t *)(v5 + 80);
  if (*(_BYTE *)(v5 + 112))
    v133 = (int8x16_t *)(v5 + 96);
  v134 = *(unsigned __int8 *)(v5 + 152);
  if (v134 <= 6)
  {
    v135 = *v133;
    if (((1 << v134) & 0x27) != 0)
    {
      v62.i32[0] = 0;
      v63.i8[0] = *(_BYTE *)(v5 + 128);
      v136 = vdupq_lane_s8((int8x8_t)*(_OWORD *)&vceqq_s8(v63, v62), 0);
      v137 = *v133;
      v137.i32[3] = 0;
      v135 = vbslq_s8(v136, v137, v135);
    }
    else
    {
      v135.i32[3] = 0;
    }
    v147 = v135;
    *(_OWORD *)__p = xmmword_209E30C90;
    *(_OWORD *)&__p[2] = *(_OWORD *)v153[0].f32;
    *(_OWORD *)((char *)&__p[3] + 4) = *(_OWORD *)&v153[1].i32[1];
    LAUI_uniform_cubic_b_spline_renderer::animator_t<simd::quatf,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::set_target<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<simd::quatf>>(v5 + 912, (uint64_t)__p, v9);
    *(int8x16_t *)__p = v147;
    *(_OWORD *)&__p[2] = *(_OWORD *)v153[0].f32;
    *(_OWORD *)((char *)&__p[3] + 4) = *(_OWORD *)&v153[1].i32[1];
    _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv4_fLNS_27animator_interpolation_typeE0EE10set_targetINS_18animation_target_tIS1_EEEEbOT_NS_25animation_target_option_tE(v5 + 1008, (uint64_t)__p, v9);
    return;
  }
LABEL_234:
  __break(1u);
LABEL_235:
  __break(1u);
LABEL_236:
  __break(1u);
}

float32x2_t *LAUI_uniform_cubic_b_spline_renderer::animation_timing_t::animation_timing_t(float32x2_t *a1, float32x2_t *a2, float a3)
{
  float v5;
  int32x2_t v6;
  float32x2_t v12;
  float32x2_t v13;
  float32x2_t v14;
  float32x2_t v15;
  float32x2_t v16;
  float32x2_t v17;
  float32x2_t v18;
  float32x2_t v19;
  float32x2_t v20;
  float32x2_t v21;
  float v23;
  float v24;
  float v25;
  int32x2_t v26;

  v5 = fmaxf(fminf(a3, nexttowardf(1.0, 0.0)), 0.0);
  a1->f32[0] = v5;
  a1->i8[4] = 0;
  a1[1].i8[4] = 0;
  a1[3].i32[0] = 0;
  if (v5 <= 0.0)
    goto LABEL_4;
  *(float *)v6.i32 = logf(v5);
  v26 = v6;
  __asm { FMOV            V8.2S, #1.0 }
  v12 = vsqrt_f32(vsub_f32(_D8, *a2));
  v13 = vadd_f32(v12, _D8);
  v23 = v13.f32[0];
  v24 = logf(v13.f32[1]);
  v14.f32[0] = logf(v23);
  v14.f32[1] = v24;
  v15 = (float32x2_t)vdup_lane_s32(v26, 0);
  v16 = vcvt_f32_f64(vmaxnmq_f64(vcvtq_f64_f32(vdiv_f32(v14, v15)), (float64x2_t)0));
  v17 = vsub_f32(_D8, v12);
  v25 = v17.f32[0];
  v26.i32[0] = logf(v17.f32[1]);
  v18.f32[0] = logf(v25);
  v18.i32[1] = v26.i32[0];
  v19 = vcvt_f32_f64(vmaxnmq_f64(vcvtq_f64_f32(vdiv_f32(v18, v15)), (float64x2_t)0));
  v20 = (float32x2_t)vbsl_s8(vand_s8((int8x8_t)vcgtz_f32(v16), (int8x8_t)vcgtz_f32(v19)), (int8x8_t)vminnm_f32(v16, v19), (int8x8_t)vmaxnm_f32(v16, v19));
  a1[2] = v20;
  v21 = *a2;
  a1[1].i8[4] = 1;
  *(float32x2_t *)((char *)a1 + 4) = v21;
  if ((vcgt_f32((float32x2_t)vdup_lane_s32((int32x2_t)v20, 1), v20).u32[0] & 1) != 0)
  {
    __break(1u);
LABEL_4:
    a1[2] = 0;
  }
  return a1;
}

float32x2_t *`anonymous namespace'::face_id_state_t::transition_t::restriction_delayed_timing@<X0>(float32x2_t *result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  float32x2_t v4;
  int v5;
  float32x2_t *v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  BOOL v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  BOOL v20;
  float v21;
  float v22;
  _BYTE v23[28];
  float32x2_t v24;
  int v25;

  if (result[2].i8[0]
    && *(float *)(a2 + 16) > 0.0
    && (v4 = *(float32x2_t *)(a2 + 4), v5 = *(_DWORD *)(a2 + 12), v24 = v4, v25 = v5, (_BYTE)v5))
  {
    v6 = result;
    v7 = sqrtf(1.0 - v4.f32[1]);
    v8 = logf(*(float *)a2);
    v9 = v7 + 1.0;
    v10 = fmax((float)(logf(v7 + 1.0) / v8), 0.0);
    v11 = 1.0 - v7;
    v12 = fmax((float)(logf(v11) / v8), 0.0);
    v13 = v12 <= 0.0 || v10 <= 0.0;
    v14 = fminf(v10, v12);
    v15 = fmaxf(v10, v12);
    if (!v13)
      v15 = v14;
    v16 = *(double *)&v6[1] * v15;
    v17 = 1.0 / (float)(v15 / 1.618);
    v18 = fmax(powf(v9, v17), 0.0);
    v19 = fmax(powf(v11, v17), 0.0);
    if (v18 <= 0.0 || v19 <= 0.0 || (v18 < 1.0 ? (v20 = v19 < 1.0) : (v20 = 0), v20))
      v21 = fmaxf(v18, v19);
    else
      v21 = fminf(v18, v19);
    v22 = nexttowardf(1.0, 0.0);
    result = LAUI_uniform_cubic_b_spline_renderer::animation_timing_t::animation_timing_t((float32x2_t *)v23, &v24, fmaxf(fminf(v21, v22), 0.0));
    *(float *)&v23[24] = -v16;
    *(_OWORD *)a3 = *(_OWORD *)v23;
    *(_OWORD *)(a3 + 12) = *(_OWORD *)&v23[12];
    *(_BYTE *)(a3 + 28) = 1;
  }
  else
  {
    *(_BYTE *)a3 = 0;
    *(_BYTE *)(a3 + 28) = 0;
  }
  return result;
}

uint64_t LAUI_uniform_cubic_b_spline_renderer::animator_t<decltype(nullptr),(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::set_target<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<decltype(nullptr)>>(uint64_t a1, uint64_t a2)
{
  float v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  _BYTE v9[28];

  if (*(_DWORD *)(a1 + 64))
    std::variant<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<decltype(nullptr)>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>::operator=[abi:ne180100]<std::monostate,0,std::monostate,0ul,0>(a1 + 56);
  v4 = *(float *)(a2 + 32);
  if (v4 >= 0.0)
  {
    *(_OWORD *)v9 = *(_OWORD *)(a2 + 8);
    *(_QWORD *)&v9[16] = *(_QWORD *)(a2 + 24);
    *(_DWORD *)&v9[24] = 0;
    LAUI_uniform_cubic_b_spline_renderer::animator_t<decltype(nullptr),(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::_set_timing(a1, (__int128 *)v9);
    *(_QWORD *)a1 = 0;
    *(_OWORD *)(a1 + 20) = *(_OWORD *)&v9[12];
    *(_OWORD *)(a1 + 8) = *(_OWORD *)v9;
    if (*(float *)(a1 + 24) <= 0.0)
    {
      *(_QWORD *)(a1 + 40) = 0;
      *(_QWORD *)(a1 + 48) = 0;
    }
    else if (v4 > 0.0)
    {
      LAUI_uniform_cubic_b_spline_renderer::animator_t<decltype(nullptr),(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::update(a1, v4);
    }
  }
  else
  {
    v5 = operator new();
    v6 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)v5 = *(_OWORD *)a2;
    *(_OWORD *)(v5 + 16) = v6;
    *(_QWORD *)(v5 + 32) = *(_QWORD *)(a2 + 32);
    *(_QWORD *)v9 = v5;
    std::__variant_detail::__assignment<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<decltype(nullptr)>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>>::__assign_alt[abi:ne180100]<1ul,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<decltype(nullptr)>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<decltype(nullptr)>>>(a1 + 56, (uint64_t *)(a1 + 56), (uint64_t *)v9);
    v7 = *(_QWORD *)v9;
    *(_QWORD *)v9 = 0;
    if (v7)
      MEMORY[0x20BD1B2E8](v7, 0x1080C405E4FE669);
  }
  return 1;
}

uint64_t LAUI_uniform_cubic_b_spline_renderer::animator_t<decltype(nullptr),(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::set_timing(uint64_t result, uint64_t a2, int a3)
{
  uint64_t v5;
  uint64_t v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  _OWORD *v15;
  uint64_t v16;
  uint64_t *v17;

  v5 = result;
  if (*(_DWORD *)(result + 64))
    result = std::variant<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<decltype(nullptr)>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>::operator=[abi:ne180100]<std::monostate,0,std::monostate,0ul,0>(result + 56);
  if (a3)
  {
    v16 = v5;
    v6 = *(unsigned int *)(v5 + 64);
    if ((_DWORD)v6 == -1)
      std::__throw_bad_variant_access[abi:ne180100]();
    v17 = &v16;
    result = ((uint64_t (*)(uint64_t **, uint64_t))*(&off_24C27F0C8 + v6))(&v17, v5 + 56);
    if ((_DWORD)result)
    {
      v7 = *(float *)(v5 + 32);
      v8 = *(float *)(v5 + 24) - v7;
      v9 = *(float *)(v5 + 28) - v7;
      v10 = *(float *)(a2 + 24);
      v11 = *(float *)(a2 + 16) - v10;
      v12 = *(float *)(a2 + 20) - v10;
      if ((a3 & 2) != 0 && (v11 < v8 || v12 < v9))
        goto LABEL_16;
      if ((a3 & 4) != 0 && (v11 > v8 || v12 > v9))
      {
LABEL_16:
        if (v10 >= 0.0)
        {
          return LAUI_uniform_cubic_b_spline_renderer::animator_t<decltype(nullptr),(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::_set_timing(v5, (__int128 *)a2);
        }
        else if ((float)(v8 + v10) > 0.0)
        {
          v15 = (_OWORD *)operator new();
          *v15 = *(_OWORD *)a2;
          *(_OWORD *)((char *)v15 + 12) = *(_OWORD *)(a2 + 12);
          v17 = (uint64_t *)v15;
          std::__variant_detail::__assignment<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<decltype(nullptr)>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>>::__assign_alt[abi:ne180100]<2ul,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>(v5 + 56, (uint64_t *)(v5 + 56), (uint64_t *)&v17);
          result = (uint64_t)v17;
          v17 = 0;
          if (result)
            return MEMORY[0x20BD1B2E8](result, 0x1000C40CBDA3C1BLL);
        }
      }
    }
  }
  return result;
}

uint64_t LAUI_uniform_cubic_b_spline_renderer::animator_t<decltype(nullptr),(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::_set_timing(uint64_t result, __int128 *a2)
{
  float v2;
  float v3;
  float *v4;
  float v5;
  unsigned int v6;
  __int128 v9;

  v2 = *((float *)a2 + 6);
  if (v2 < 0.0)
  {
    __break(1u);
    return result;
  }
  v3 = *((float *)a2 + 4);
  v4 = (float *)(result + 8);
  if (*(float *)(result + 24) > 0.0 && v3 > 0.0 && *v4 != *(float *)a2)
  {
    v5 = (float)(*(float *)a2 * (float)(1.0 - *v4)) / (float)(*v4 * (float)(1.0 - *(float *)a2));
    v6 = (COERCE_INT(fabs(v5)) - 0x800000) >> 24;
    if (v5 >= 0.0 && v6 <= 0x7E || (LODWORD(v5) - 1) <= 0x7FFFFE)
      *(_QWORD *)(result + 40) = 0;
  }
  v9 = *a2;
  *(_OWORD *)(result + 20) = *(__int128 *)((char *)a2 + 12);
  *(_OWORD *)v4 = v9;
  if (v2 <= 0.0)
  {
    if (v3 > 0.0)
      return result;
  }
  else
  {
    *(_DWORD *)(result + 32) = 0;
    if (v3 > 0.0)
      return LAUI_uniform_cubic_b_spline_renderer::animator_t<decltype(nullptr),(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::update(result, v2);
  }
  *(_QWORD *)(result + 40) = 0;
  *(_QWORD *)(result + 48) = 0;
  return result;
}

uint64_t LAUI_uniform_cubic_b_spline_renderer::animator_t<decltype(nullptr),(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::update(uint64_t a1, float a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  __int16 v7;
  int v8;
  _QWORD v10[2];
  float v11;
  _QWORD *v12;

  v11 = a2;
  v12 = (_QWORD *)a1;
  v2 = *(unsigned int *)(a1 + 64);
  if ((_DWORD)v2 == -1)
    std::__throw_bad_variant_access[abi:ne180100]();
  v5 = a1 + 56;
  v10[0] = &v12;
  if (((unsigned int (*)(_QWORD *, uint64_t))*(&off_24C27F0C8 + v2))(v10, a1 + 56))
  {
    if (a2 == 0.0)
    {
      LOBYTE(v7) = 0;
      v8 = 0;
    }
    else
    {
      v10[0] = a1;
      v10[1] = &v11;
      v6 = *(unsigned int *)(a1 + 64);
      if ((_DWORD)v6 == -1)
        std::__throw_bad_variant_access[abi:ne180100]();
      v12 = v10;
      v7 = ((uint64_t (*)(_QWORD **, uint64_t))*(&off_24C27F0E0 + v6))(&v12, v5);
      v8 = HIBYTE(v7);
    }
  }
  else
  {
    LOBYTE(v7) = 1;
    v8 = 1;
  }
  return v7 | (v8 << 8);
}

uint64_t std::variant<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<decltype(nullptr)>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>::operator=[abi:ne180100]<std::monostate,0,std::monostate,0ul,0>(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 8))
    std::__variant_detail::__assignment<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<decltype(nullptr)>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>>::__emplace[abi:ne180100]<0ul,std::monostate>(a1);
  return a1;
}

uint64_t std::__variant_detail::__assignment<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<decltype(nullptr)>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>>::__emplace[abi:ne180100]<0ul,std::monostate>(uint64_t a1)
{
  uint64_t v2;
  char v4;

  v2 = *(unsigned int *)(a1 + 8);
  if ((_DWORD)v2 != -1)
    ((void (*)(char *, uint64_t))*(&off_24C27EEB8 + v2))(&v4, a1);
  *(_DWORD *)(a1 + 8) = 0;
  return a1;
}

BOOL _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm0EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZNK36LAUI_uniform_cubic_b_spline_renderer10animator_tIDnLNS8_27animator_interpolation_typeE0EE12is_animatingEvEUlOT_E_EEJRKNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tIDnEENS_14default_deleteISM_EEEENSK_INS8_18animation_timing_tENSN_ISQ_EEEEEEEEEEDcSC_DpT0_(uint64_t a1)
{
  return *(float *)(**(_QWORD **)a1 + 24) > 0.0;
}

uint64_t _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm1EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZNK36LAUI_uniform_cubic_b_spline_renderer10animator_tIDnLNS8_27animator_interpolation_typeE0EE12is_animatingEvEUlOT_E_EEJRKNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tIDnEENS_14default_deleteISM_EEEENSK_INS8_18animation_timing_tENSN_ISQ_EEEEEEEEEEDcSC_DpT0_()
{
  return 1;
}

uint64_t _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm2EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZNK36LAUI_uniform_cubic_b_spline_renderer10animator_tIDnLNS8_27animator_interpolation_typeE0EE12is_animatingEvEUlOT_E_EEJRKNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tIDnEENS_14default_deleteISM_EEEENSK_INS8_18animation_timing_tENSN_ISQ_EEEEEEEEEEDcSC_DpT0_()
{
  return 1;
}

uint64_t std::__variant_detail::__assignment<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<decltype(nullptr)>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>>::__assign_alt[abi:ne180100]<2ul,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t result;

  if (*(_DWORD *)(a1 + 8) != 2)
    return std::__variant_detail::__assignment<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<decltype(nullptr)>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>>::__emplace[abi:ne180100]<2ul,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>(a1, a3);
  v3 = *a3;
  *a3 = 0;
  result = *a2;
  *a2 = v3;
  if (result)
    JUMPOUT(0x20BD1B2E8);
  return result;
}

uint64_t std::__variant_detail::__assignment<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<decltype(nullptr)>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>>::__emplace[abi:ne180100]<2ul,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  char v7;

  v4 = *(unsigned int *)(a1 + 8);
  if ((_DWORD)v4 != -1)
    ((void (*)(char *, uint64_t))*(&off_24C27EEB8 + v4))(&v7, a1);
  v5 = *a2;
  *a2 = 0;
  *(_QWORD *)a1 = v5;
  *(_DWORD *)(a1 + 8) = 2;
  return a1;
}

uint64_t _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm0EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDnLNS8_27animator_interpolation_typeE0EE6updateEfEUlRT_E_EEJRNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tIDnEENS_14default_deleteISM_EEEENSK_INS8_18animation_timing_tENSN_ISQ_EEEEEEEEEEDcSC_DpT0_(uint64_t **a1)
{
  return LAUI_uniform_cubic_b_spline_renderer::animator_t<decltype(nullptr),(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::_update(**a1, *(float *)(*a1)[1]);
}

uint64_t *_ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm1EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDnLNS8_27animator_interpolation_typeE0EE6updateEfEUlRT_E_EEJRNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tIDnEENS_14default_deleteISM_EEEENSK_INS8_18animation_timing_tENSN_ISQ_EEEEEEEEEEDcSC_DpT0_(uint64_t **a1, uint64_t *a2)
{
  return LAUI_uniform_cubic_b_spline_renderer::animator_t<decltype(nullptr),(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::update(float)::{lambda(decltype(nullptr) &)#1}::operator()<std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<decltype(nullptr)>>>(*a1, a2);
}

uint64_t *_ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm2EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDnLNS8_27animator_interpolation_typeE0EE6updateEfEUlRT_E_EEJRNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tIDnEENS_14default_deleteISM_EEEENSK_INS8_18animation_timing_tENSN_ISQ_EEEEEEEEEEDcSC_DpT0_(uint64_t **a1, uint64_t *a2)
{
  return LAUI_uniform_cubic_b_spline_renderer::animator_t<decltype(nullptr),(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::update(float)::{lambda(decltype(nullptr) &)#1}::operator()<std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>(*a1, a2);
}

uint64_t LAUI_uniform_cubic_b_spline_renderer::animator_t<decltype(nullptr),(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::_update(uint64_t result, float a2)
{
  float v2;
  uint64_t v3;
  float v4;
  int v5;
  _BOOL4 v6;
  float v7;
  BOOL v8;
  float v9;

  v2 = *(float *)(result + 24);
  if (v2 <= 0.0)
    goto LABEL_9;
  if (a2 >= 0.0)
  {
    v3 = result;
    v4 = *(float *)(result + 32) + a2;
    *(float *)(result + 32) = v4;
    if (v4 < v2)
    {
      v5 = 0;
      *(_QWORD *)(result + 40) = 0;
      *(_QWORD *)(result + 48) = 0;
      v6 = v4 >= *(float *)(result + 28);
      return v6 | (v5 << 8);
    }
    v7 = fmaxf(fminf(nexttowardf(1.0, 0.0), 0.0), 0.0);
    v8 = v7 <= 0.0;
    *(float *)(v3 + 8) = v7;
    *(_BYTE *)(v3 + 12) = 0;
    v9 = INFINITY;
    *(_BYTE *)(v3 + 20) = 0;
    if (v8)
      v9 = 0.0;
    *(float *)(v3 + 24) = v9;
    *(float *)(v3 + 28) = v9;
    *(_DWORD *)(v3 + 32) = 0;
    *(_QWORD *)(v3 + 40) = 0;
    *(_QWORD *)(v3 + 48) = 0;
LABEL_9:
    v6 = 1;
    v5 = 1;
    return v6 | (v5 << 8);
  }
  __break(1u);
  return result;
}

uint64_t *LAUI_uniform_cubic_b_spline_renderer::animator_t<decltype(nullptr),(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::update(float)::{lambda(decltype(nullptr) &)#1}::operator()<std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<decltype(nullptr)>>>(uint64_t *result, uint64_t *a2)
{
  float *v2;
  uint64_t v4;
  uint64_t v5;
  float v6;
  __int16 v7;
  int v8;
  float v9;
  uint64_t v10;

  v2 = (float *)result[1];
  if (*v2 < 0.0)
  {
    __break(1u);
  }
  else
  {
    v4 = *result;
    v5 = *a2;
    v6 = *v2 + *(float *)(*a2 + 32);
    *(float *)(*a2 + 32) = v6;
    if (v6 >= 0.0)
    {
      *(_DWORD *)(v5 + 32) = 0;
      v9 = fmax((float)(*v2 - v6), 0.0);
      LAUI_uniform_cubic_b_spline_renderer::animator_t<decltype(nullptr),(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::_update(v4, v9);
      v10 = *a2;
      *a2 = 0;
      if (*(_DWORD *)(v4 + 64))
        std::variant<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<decltype(nullptr)>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>::operator=[abi:ne180100]<std::monostate,0,std::monostate,0ul,0>(v4 + 56);
      LAUI_uniform_cubic_b_spline_renderer::animator_t<decltype(nullptr),(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::set_target<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<decltype(nullptr)>>(v4, v10);
      MEMORY[0x20BD1B2E8](v10, 0x1080C405E4FE669);
      v7 = LAUI_uniform_cubic_b_spline_renderer::animator_t<decltype(nullptr),(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::update(v4, v6);
      v8 = HIBYTE(v7);
    }
    else
    {
      LAUI_uniform_cubic_b_spline_renderer::animator_t<decltype(nullptr),(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::_update(v4, *v2);
      LOBYTE(v7) = 0;
      v8 = 0;
    }
    return (uint64_t *)(v7 | (v8 << 8));
  }
  return result;
}

void sub_209E2DF54(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (v1)
    MEMORY[0x20BD1B2E8](v1, 0x1080C405E4FE669);
  _Unwind_Resume(exception_object);
}

uint64_t *LAUI_uniform_cubic_b_spline_renderer::animator_t<decltype(nullptr),(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::update(float)::{lambda(decltype(nullptr) &)#1}::operator()<std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>(uint64_t *result, uint64_t *a2)
{
  float *v2;
  uint64_t v4;
  uint64_t v5;
  float v6;
  __int16 v7;
  int v8;
  float v9;
  uint64_t v10;

  v2 = (float *)result[1];
  if (*v2 < 0.0)
  {
    __break(1u);
  }
  else
  {
    v4 = *result;
    v5 = *a2;
    v6 = *v2 + *(float *)(*a2 + 24);
    *(float *)(*a2 + 24) = v6;
    if (v6 >= 0.0)
    {
      *(_DWORD *)(v5 + 24) = 0;
      v9 = fmax((float)(*v2 - v6), 0.0);
      LAUI_uniform_cubic_b_spline_renderer::animator_t<decltype(nullptr),(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::_update(v4, v9);
      v10 = *a2;
      *a2 = 0;
      if (*(_DWORD *)(v4 + 64))
        std::variant<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<decltype(nullptr)>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>::operator=[abi:ne180100]<std::monostate,0,std::monostate,0ul,0>(v4 + 56);
      LAUI_uniform_cubic_b_spline_renderer::animator_t<decltype(nullptr),(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::set_timing(v4, v10, 6);
      MEMORY[0x20BD1B2E8](v10, 0x1000C40CBDA3C1BLL);
      v7 = LAUI_uniform_cubic_b_spline_renderer::animator_t<decltype(nullptr),(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::update(v4, v6);
      v8 = HIBYTE(v7);
    }
    else
    {
      LAUI_uniform_cubic_b_spline_renderer::animator_t<decltype(nullptr),(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::_update(v4, *v2);
      LOBYTE(v7) = 0;
      v8 = 0;
    }
    return (uint64_t *)(v7 | (v8 << 8));
  }
  return result;
}

uint64_t std::__variant_detail::__assignment<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<decltype(nullptr)>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>>::__assign_alt[abi:ne180100]<1ul,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<decltype(nullptr)>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<decltype(nullptr)>>>(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t result;

  if (*(_DWORD *)(a1 + 8) != 1)
    return std::__variant_detail::__assignment<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<decltype(nullptr)>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>>::__emplace[abi:ne180100]<1ul,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<decltype(nullptr)>>>(a1, a3);
  v3 = *a3;
  *a3 = 0;
  result = *a2;
  *a2 = v3;
  if (result)
    JUMPOUT(0x20BD1B2E8);
  return result;
}

uint64_t std::__variant_detail::__assignment<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<decltype(nullptr)>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>>::__emplace[abi:ne180100]<1ul,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<decltype(nullptr)>>>(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  char v7;

  v4 = *(unsigned int *)(a1 + 8);
  if ((_DWORD)v4 != -1)
    ((void (*)(char *, uint64_t))*(&off_24C27EEB8 + v4))(&v7, a1);
  v5 = *a2;
  *a2 = 0;
  *(_QWORD *)a1 = v5;
  *(_DWORD *)(a1 + 8) = 1;
  return a1;
}

BOOL `anonymous namespace'::coplanar_ring_updater<true>::function(float32x4_t *a1, float *a2)
{
  float v4;
  float v5;
  __float2 v6;
  float32x4_t v7;

  v4 = *a2;
  if (*a2 > 1000.0)
    v4 = 1000.0;
  *a2 = v4;
  v5 = v4 * 0.00628318531;
  v6 = __sincosf_stret(v5 * 0.5);
  v7 = vmulq_n_f32((float32x4_t)xmmword_209E31040, v6.__sinval);
  v7.i32[3] = LODWORD(v6.__cosval);
  a1[1] = v7;
  return *a2 == 1000.0;
}

void LAUI_uniform_cubic_b_spline_renderer::animator_t<simd::quatf,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::resolve_infinite_duration(uint64_t a1, float32x2_t *a2)
{
  uint64_t v2;
  float v5;
  int32x2_t v6;
  float32x2_t v12;
  float32x2_t v13;
  float32x2_t v14;
  float32x2_t v15;
  float32x2_t v16;
  float32x2_t v17;
  float32x2_t v18;
  float32x2_t v19;
  float32x2_t v20;
  float32x2_t v21;
  float v22;
  float v23;
  float v24;
  int32x2_t v25;
  float32x2_t *v26;
  float32x2_t **v27;

  v26 = a2;
  v2 = *(unsigned int *)(a1 + 88);
  if ((_DWORD)v2 == -1)
    std::__throw_bad_variant_access[abi:ne180100]();
  v27 = &v26;
  ((void (*)(float32x2_t ***, uint64_t))*(&off_24C27F0F8 + v2))(&v27, a1 + 80);
  if (*(float *)(a1 + 32) == INFINITY)
  {
    v5 = *(float *)(a1 + 16);
    if (v5 <= 0.0)
    {
LABEL_8:
      *(_QWORD *)(a1 + 32) = 0;
      return;
    }
    *(float *)v6.i32 = logf(v5);
    v25 = v6;
    __asm { FMOV            V8.2S, #1.0 }
    v12 = vsqrt_f32(vsub_f32(_D8, *a2));
    v13 = vadd_f32(v12, _D8);
    v22 = v13.f32[0];
    v23 = logf(v13.f32[1]);
    v14.f32[0] = logf(v22);
    v14.f32[1] = v23;
    v15 = (float32x2_t)vdup_lane_s32(v25, 0);
    v16 = vcvt_f32_f64(vmaxnmq_f64(vcvtq_f64_f32(vdiv_f32(v14, v15)), (float64x2_t)0));
    v17 = vsub_f32(_D8, v12);
    v24 = v17.f32[0];
    v25.i32[0] = logf(v17.f32[1]);
    v18.f32[0] = logf(v24);
    v18.i32[1] = v25.i32[0];
    v19 = vcvt_f32_f64(vmaxnmq_f64(vcvtq_f64_f32(vdiv_f32(v18, v15)), (float64x2_t)0));
    v20 = (float32x2_t)vbsl_s8(vand_s8((int8x8_t)vcgtz_f32(v16), (int8x8_t)vcgtz_f32(v19)), (int8x8_t)vminnm_f32(v16, v19), (int8x8_t)vmaxnm_f32(v16, v19));
    *(float32x2_t *)(a1 + 32) = v20;
    v21 = *a2;
    if (!*(_BYTE *)(a1 + 28))
      *(_BYTE *)(a1 + 28) = 1;
    *(float32x2_t *)(a1 + 20) = v21;
    if ((vcgt_f32((float32x2_t)vdup_lane_s32((int32x2_t)v20, 1), v20).u32[0] & 1) != 0)
    {
      __break(1u);
      goto LABEL_8;
    }
  }
}

void _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv4_fLNS_27animator_interpolation_typeE0EE25resolve_infinite_durationERKNS_18animation_timing_t23epsilon_configuration_tE(uint64_t a1, float32x2_t *a2)
{
  uint64_t v2;
  float v5;
  int32x2_t v6;
  float32x2_t v12;
  float32x2_t v13;
  float32x2_t v14;
  float32x2_t v15;
  float32x2_t v16;
  float32x2_t v17;
  float32x2_t v18;
  float32x2_t v19;
  float32x2_t v20;
  float32x2_t v21;
  float v22;
  float v23;
  float v24;
  int32x2_t v25;
  float32x2_t *v26;
  float32x2_t **v27;

  v26 = a2;
  v2 = *(unsigned int *)(a1 + 88);
  if ((_DWORD)v2 == -1)
    std::__throw_bad_variant_access[abi:ne180100]();
  v27 = &v26;
  ((void (*)(float32x2_t ***, uint64_t))*(&off_24C27F110 + v2))(&v27, a1 + 80);
  if (*(float *)(a1 + 32) == INFINITY)
  {
    v5 = *(float *)(a1 + 16);
    if (v5 <= 0.0)
    {
LABEL_8:
      *(_QWORD *)(a1 + 32) = 0;
      return;
    }
    *(float *)v6.i32 = logf(v5);
    v25 = v6;
    __asm { FMOV            V8.2S, #1.0 }
    v12 = vsqrt_f32(vsub_f32(_D8, *a2));
    v13 = vadd_f32(v12, _D8);
    v22 = v13.f32[0];
    v23 = logf(v13.f32[1]);
    v14.f32[0] = logf(v22);
    v14.f32[1] = v23;
    v15 = (float32x2_t)vdup_lane_s32(v25, 0);
    v16 = vcvt_f32_f64(vmaxnmq_f64(vcvtq_f64_f32(vdiv_f32(v14, v15)), (float64x2_t)0));
    v17 = vsub_f32(_D8, v12);
    v24 = v17.f32[0];
    v25.i32[0] = logf(v17.f32[1]);
    v18.f32[0] = logf(v24);
    v18.i32[1] = v25.i32[0];
    v19 = vcvt_f32_f64(vmaxnmq_f64(vcvtq_f64_f32(vdiv_f32(v18, v15)), (float64x2_t)0));
    v20 = (float32x2_t)vbsl_s8(vand_s8((int8x8_t)vcgtz_f32(v16), (int8x8_t)vcgtz_f32(v19)), (int8x8_t)vminnm_f32(v16, v19), (int8x8_t)vmaxnm_f32(v16, v19));
    *(float32x2_t *)(a1 + 32) = v20;
    v21 = *a2;
    if (!*(_BYTE *)(a1 + 28))
      *(_BYTE *)(a1 + 28) = 1;
    *(float32x2_t *)(a1 + 20) = v21;
    if ((vcgt_f32((float32x2_t)vdup_lane_s32((int32x2_t)v20, 1), v20).u32[0] & 1) != 0)
    {
      __break(1u);
      goto LABEL_8;
    }
  }
}

void _ZNKSt3__116__variant_detail12__visitation9__variant15__value_visitorIZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIN4simd5quatfELNS4_27animator_interpolation_typeE0EE25resolve_infinite_durationERKNS4_18animation_timing_t23epsilon_configuration_tEEUlOT_E_EclB8ne180100IJRNS0_5__altILm1ENS_10unique_ptrINS4_18animation_target_tIS7_EENS_14default_deleteISM_EEEEEEEEEDcDpOT_(float32x2_t ***a1, uint64_t *a2)
{
  uint64_t v2;
  float v3;
  float32x2_t *v4;
  int32x2_t v5;
  float32x2_t v11;
  float32x2_t v12;
  float32x2_t v13;
  float32x2_t v14;
  float32x2_t v15;
  float32x2_t v16;
  float32x2_t v17;
  float32x2_t v18;
  float32x2_t v19;
  float32x2_t v20;
  float v21;
  float v22;
  float v23;
  int32x2_t v24;

  v2 = *a2;
  if (*(float *)(*a2 + 32) == INFINITY)
  {
    v3 = *(float *)(v2 + 16);
    if (v3 <= 0.0)
    {
LABEL_7:
      *(_QWORD *)(v2 + 32) = 0;
      return;
    }
    v4 = **a1;
    *(float *)v5.i32 = logf(v3);
    v24 = v5;
    __asm { FMOV            V8.2S, #1.0 }
    v11 = vsqrt_f32(vsub_f32(_D8, *v4));
    v12 = vadd_f32(v11, _D8);
    v21 = v12.f32[0];
    v22 = logf(v12.f32[1]);
    v13.f32[0] = logf(v21);
    v13.f32[1] = v22;
    v14 = (float32x2_t)vdup_lane_s32(v24, 0);
    v15 = vcvt_f32_f64(vmaxnmq_f64(vcvtq_f64_f32(vdiv_f32(v13, v14)), (float64x2_t)0));
    v16 = vsub_f32(_D8, v11);
    v23 = v16.f32[0];
    v24.i32[0] = logf(v16.f32[1]);
    v17.f32[0] = logf(v23);
    v17.i32[1] = v24.i32[0];
    v18 = vcvt_f32_f64(vmaxnmq_f64(vcvtq_f64_f32(vdiv_f32(v17, v14)), (float64x2_t)0));
    v19 = (float32x2_t)vbsl_s8(vand_s8((int8x8_t)vcgtz_f32(v15), (int8x8_t)vcgtz_f32(v18)), (int8x8_t)vminnm_f32(v15, v18), (int8x8_t)vmaxnm_f32(v15, v18));
    *(float32x2_t *)(v2 + 32) = v19;
    v20 = *v4;
    if (!*(_BYTE *)(v2 + 28))
      *(_BYTE *)(v2 + 28) = 1;
    *(float32x2_t *)(v2 + 20) = v20;
    if ((vcgt_f32((float32x2_t)vdup_lane_s32((int32x2_t)v19, 1), v19).u32[0] & 1) != 0)
    {
      __break(1u);
      goto LABEL_7;
    }
  }
}

void _ZNKSt3__116__variant_detail12__visitation9__variant15__value_visitorIZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIN4simd5quatfELNS4_27animator_interpolation_typeE0EE25resolve_infinite_durationERKNS4_18animation_timing_t23epsilon_configuration_tEEUlOT_E_EclB8ne180100IJRNS0_5__altILm2ENS_10unique_ptrISA_NS_14default_deleteISA_EEEEEEEEEDcDpOT_(float32x2_t ***a1, uint64_t *a2)
{
  uint64_t v2;
  float32x2_t *v3;
  int32x2_t v4;
  float32x2_t v10;
  float32x2_t v11;
  float32x2_t v12;
  float32x2_t v13;
  float32x2_t v14;
  float32x2_t v15;
  float32x2_t v16;
  float32x2_t v17;
  float32x2_t v18;
  float32x2_t v19;
  float v20;
  float v21;
  float v22;
  int32x2_t v23;

  v2 = *a2;
  if (*(float *)(*a2 + 16) == INFINITY)
  {
    if (*(float *)v2 <= 0.0)
    {
LABEL_7:
      *(_QWORD *)(v2 + 16) = 0;
      return;
    }
    v3 = **a1;
    *(float *)v4.i32 = logf(*(float *)v2);
    v23 = v4;
    __asm { FMOV            V8.2S, #1.0 }
    v10 = vsqrt_f32(vsub_f32(_D8, *v3));
    v11 = vadd_f32(v10, _D8);
    v20 = v11.f32[0];
    v21 = logf(v11.f32[1]);
    v12.f32[0] = logf(v20);
    v12.f32[1] = v21;
    v13 = (float32x2_t)vdup_lane_s32(v23, 0);
    v14 = vcvt_f32_f64(vmaxnmq_f64(vcvtq_f64_f32(vdiv_f32(v12, v13)), (float64x2_t)0));
    v15 = vsub_f32(_D8, v10);
    v22 = v15.f32[0];
    v23.i32[0] = logf(v15.f32[1]);
    v16.f32[0] = logf(v22);
    v16.i32[1] = v23.i32[0];
    v17 = vcvt_f32_f64(vmaxnmq_f64(vcvtq_f64_f32(vdiv_f32(v16, v13)), (float64x2_t)0));
    v18 = (float32x2_t)vbsl_s8(vand_s8((int8x8_t)vcgtz_f32(v14), (int8x8_t)vcgtz_f32(v17)), (int8x8_t)vminnm_f32(v14, v17), (int8x8_t)vmaxnm_f32(v14, v17));
    *(float32x2_t *)(v2 + 16) = v18;
    v19 = *v3;
    if (!*(_BYTE *)(v2 + 12))
      *(_BYTE *)(v2 + 12) = 1;
    *(float32x2_t *)(v2 + 4) = v19;
    if ((vcgt_f32((float32x2_t)vdup_lane_s32((int32x2_t)v18, 1), v18).u32[0] & 1) != 0)
    {
      __break(1u);
      goto LABEL_7;
    }
  }
}

uint64_t __getLAErrorHelperClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::$_1::operator()(v0);
}

void LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::$_1::operator()(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_209E00000, a1, a3, "Could not create find bundle for LAUICubicBSplineRenderer", a5, a6, a7, a8, 0);
}

{
  OUTLINED_FUNCTION_1_1(&dword_209E00000, a1, a3, "Could not find Metal pipeline library in bundle", a5, a6, a7, a8, 0);
}

void LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::$_1::operator()(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_209E00000, a2, a3, "Could not create Metal library: %@", a5, a6, a7, a8, 2u);
}

{
  OUTLINED_FUNCTION_0_1(&dword_209E00000, a2, a3, "Could not create Metal pipeline library: %@", a5, a6, a7, a8, 2u);
}

void `anonymous namespace'::morphable_quadrant_t<9ul>::convert()
{
  __assert_rtn("convert", "LAUIPearlGlyphView.mm", 403, "x_reflect || y_reflect");
}

void AudioServicesPlaySystemSoundWithCompletion(SystemSoundID inSystemSoundID, void *inCompletionBlock)
{
  MEMORY[0x24BDB6988](*(_QWORD *)&inSystemSoundID, inCompletionBlock);
}

CFTimeInterval CACurrentMediaTime(void)
{
  CFTimeInterval result;

  MEMORY[0x24BDE5410]();
  return result;
}

BOOL CAFrameRateRangeIsEqualToRange(CAFrameRateRange range, CAFrameRateRange other)
{
  return MEMORY[0x24BDE5438](*(__n128 *)&range.minimum, *(__n128 *)&range.maximum, *(__n128 *)&range.preferred, *(__n128 *)&other.minimum, *(__n128 *)&other.maximum, *(__n128 *)&other.preferred);
}

CATransform3D *__cdecl CATransform3DConcat(CATransform3D *__return_ptr retstr, CATransform3D *a, CATransform3D *b)
{
  return (CATransform3D *)MEMORY[0x24BDE5578](retstr, a, b);
}

BOOL CATransform3DEqualToTransform(CATransform3D *a, CATransform3D *b)
{
  return MEMORY[0x24BDE5588](a, b);
}

CATransform3D *__cdecl CATransform3DInvert(CATransform3D *__return_ptr retstr, CATransform3D *t)
{
  return (CATransform3D *)MEMORY[0x24BDE55A8](retstr, t);
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x24BDE55D0](retstr, sx, sy, sz);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x24BDBBD08]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E8](retstr, tx, ty);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x24BDBDA78](space, components);
}

CGColorRef CGColorCreateCopyByMatchingToColorSpace(CGColorSpaceRef a1, CGColorRenderingIntent intent, CGColorRef color, CFDictionaryRef options)
{
  return (CGColorRef)MEMORY[0x24BDBDA88](a1, *(_QWORD *)&intent, color, options);
}

BOOL CGColorEqualToColor(CGColorRef color1, CGColorRef color2)
{
  return MEMORY[0x24BDBDAC0](color1, color2);
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDAF0](color);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x24BDBDAF8](color);
}

void CGColorRelease(CGColorRef color)
{
  MEMORY[0x24BDBDB40](color);
}

CGColorRef CGColorRetain(CGColorRef color)
{
  return (CGColorRef)MEMORY[0x24BDBDB48](color);
}

CFStringRef CGColorSpaceCopyName(CGColorSpaceRef space)
{
  return (CFStringRef)MEMORY[0x24BDBDB60](space);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDBB8](name);
}

size_t CGColorSpaceGetNumberOfComponents(CGColorSpaceRef space)
{
  return MEMORY[0x24BDBDC20](space);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x24BDBDC60](space);
}

CGColorSpaceRef CGColorSpaceRetain(CGColorSpaceRef space)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDC68](space);
}

CGPathRef CGPathCreateWithEllipseInRect(CGRect rect, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x24BDBEEA0](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x24BDBEFC0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

void CGRectDivide(CGRect rect, CGRect *slice, CGRect *remainder, CGFloat amount, CGRectEdge edge)
{
  MEMORY[0x24BDBEFD8](slice, remainder, *(_QWORD *)&edge, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, amount);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFE0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF000]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF008]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x24BDDD1E0]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

uint64_t SBSUIHardwareButtonHintViewsSupported()
{
  return MEMORY[0x24BEB0FB0]();
}

uint64_t SBSUIRegisterHardwareButtonHintViewAsync()
{
  return MEMORY[0x24BEB0FC0]();
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return MEMORY[0x24BDF7288]();
}

BOOL UIAccessibilityIsReduceTransparencyEnabled(void)
{
  return MEMORY[0x24BDF7290]();
}

NSComparisonResult UIContentSizeCategoryCompareToCategory(UIContentSizeCategory lhs, UIContentSizeCategory rhs)
{
  return MEMORY[0x24BDF7668](lhs, rhs);
}

uint64_t _AXSPearlAuthenticationHapticsEnabled()
{
  return MEMORY[0x24BED2370]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x24BEDABE8](__n);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB180](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB190](this);
}

void std::exception::~exception(std::exception *this)
{
  MEMORY[0x24BEDB688](this);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

void operator delete(void *__p)
{
  off_24C27E048(__p);
}

uint64_t operator delete()
{
  return off_24C27E050();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24C27E058(__sz);
}

uint64_t operator new()
{
  return off_24C27E060();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

void __cxa_end_catch(void)
{
  MEMORY[0x24BEDB928]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x24BEDB930](a1);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x24BEDB948](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x24BEDB950](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

simd_float4x4 __invert_f4(simd_float4x4 a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  simd_float4x4 result;

  MEMORY[0x24BDAC828]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2], (__n128)a1.columns[3]);
  result.columns[3].i64[1] = v8;
  result.columns[3].i64[0] = v7;
  result.columns[2].i64[1] = v6;
  result.columns[2].i64[0] = v5;
  result.columns[1].i64[1] = v4;
  result.columns[1].i64[0] = v3;
  result.columns[0].i64[1] = v2;
  result.columns[0].i64[0] = v1;
  return result;
}

__double2 __sincos_stret(double a1)
{
  double v1;
  double v2;
  __double2 result;

  MEMORY[0x24BDAC890](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  float v1;
  float v2;
  __float2 result;

  MEMORY[0x24BDAC898](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

long double acos(long double __x)
{
  long double result;

  MEMORY[0x24BDAD108](__x);
  return result;
}

float atan2f(float a1, float a2)
{
  float result;

  MEMORY[0x24BDAD228](a1, a2);
  return result;
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDE0](group, queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x24BDADFE0](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAE3F0](__x, __y);
  return result;
}

float fmodf(float a1, float a2)
{
  float result;

  MEMORY[0x24BDAE3F8](a1, a2);
  return result;
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

float logf(float a1)
{
  float result;

  MEMORY[0x24BDAEAF8](a1);
  return result;
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

float nexttowardf(float a1, long double a2)
{
  float result;

  MEMORY[0x24BDAF120](a1, a2);
  return result;
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x24BEDD080](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x24BEDD3C0](object, key, value, policy);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAF688](__x, __y);
  return result;
}

float powf(float a1, float a2)
{
  float result;

  MEMORY[0x24BDAF690](a1, a2);
  return result;
}

float sinf(float a1)
{
  float result;

  MEMORY[0x24BDAFE20](a1);
  return result;
}

