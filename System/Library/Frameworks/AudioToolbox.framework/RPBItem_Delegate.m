@implementation RPBItem_Delegate

- (BOOL)respondsToSelector:(SEL)a3
{
  void *f;
  objc_super v5;

  if (sel_getRemoteProcessingBlockParameterInfo_forScope_object_withError_ == a3)
  {
    f = self->get_parameter_info_callback.__f_.__f_;
  }
  else if (sel_getRemoteProcessingBlockParameter_forID_scope_element_object_withError_ == a3)
  {
    f = self->get_parameter_callback.__f_.__f_;
  }
  else if (sel_setRemoteProcessingBlockParameter_forID_scope_element_object_withError_ == a3)
  {
    f = self->set_parameter_callback.__f_.__f_;
  }
  else if (sel_getRemoteProcessingBlockPropertyInfo_forScope_object_withError_ == a3)
  {
    f = self->get_property_info_callback.__f_.__f_;
  }
  else if (sel_getRemoteProcessingBlockProperty_forID_scope_element_object_withError_ == a3)
  {
    f = self->get_property_callback.__f_.__f_;
  }
  else
  {
    if (sel_setRemoteProcessingBlockProperty_forID_scope_element_object_withError_ != a3)
    {
      v5.receiver = self;
      v5.super_class = (Class)RPBItem_Delegate;
      return -[RPBItem_Delegate respondsToSelector:](&v5, sel_respondsToSelector_);
    }
    f = self->set_property_callback.__f_.__f_;
  }
  return f != 0;
}

- (void)getRemoteProcessingBlockParameterInfo:(id)a3 forScope:(unsigned int)a4 object:(id)a5 withError:(id *)a6
{
  id v10;
  id v11;
  void *f;
  uint64_t v13;
  id *v14;
  unsigned int *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  std::bad_cast *exception;
  std::bad_cast *v21;
  _QWORD v22[4];
  char v23;
  id v24[4];
  char v25;
  _QWORD v26[5];
  unsigned int v27;

  v10 = a3;
  v11 = a5;
  if (a4 >= 8)
  {
    exception = (std::bad_cast *)__cxa_allocate_exception(8uLL);
    v21 = std::bad_cast::bad_cast(exception);
  }
  v27 = a4;
  f = self->get_parameter_info_callback.__f_.__f_;
  if (!f)
    std::__throw_bad_function_call[abi:ne180100]();
  (*(void (**)(_QWORD *__return_ptr, void *, unsigned int *))(*(_QWORD *)f + 48))(v22, f, &v27);
  if (v23)
  {
    v13 = caulk::expected<std::vector<vp::rpb::Parameter_Info,vp::Allocator<vp::rpb::Parameter_Info>>,vp::rpb::Error>::value((uint64_t)v22);
    v14 = *(id **)v13;
    v15 = *(unsigned int **)(v13 + 8);
    if (*(unsigned int **)v13 != v15)
    {
      do
      {
        objc_msgSend(MEMORY[0x1E0D86FA0], "createWithParameterID:", *(unsigned int *)v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v14[1];
        objc_msgSend(v16, "setName:", v17);

        v18 = v14[2];
        objc_msgSend(v16, "setDescription:", v18);

        objc_msgSend(v16, "setReadable:", *((unsigned __int8 *)v14 + 24));
        objc_msgSend(v16, "setWritable:", *((unsigned __int8 *)v14 + 25));
        v19 = (void *)objc_msgSend(v16, "copy");
        objc_msgSend(v10, "addObject:", v19);

        v14 += 4;
      }
      while (v14 != (id *)v15);
    }
  }
  caulk::__expected_detail::base<std::vector<vp::rpb::Parameter_Info,vp::Allocator<vp::rpb::Parameter_Info>>,vp::rpb::Error>::base(v24, (uint64_t)v22);
  if (!v25 && a6 && v24[0])
    *a6 = vp::rpb::Object::objc_self(v24);
  caulk::__expected_detail::base<std::vector<vp::rpb::Parameter_Info,vp::Allocator<vp::rpb::Parameter_Info>>,vp::rpb::Error>::base(v26, (uint64_t)v24);
  caulk::__expected_detail::base<std::vector<vp::rpb::Parameter_Info,vp::Allocator<vp::rpb::Parameter_Info>>,vp::rpb::Error>::~base((vp::objc::ID *)v26);
  caulk::__expected_detail::base<std::vector<vp::rpb::Parameter_Info,vp::Allocator<vp::rpb::Parameter_Info>>,vp::rpb::Error>::~base((vp::objc::ID *)v24);
  caulk::__expected_detail::base<std::vector<vp::rpb::Parameter_Info,vp::Allocator<vp::rpb::Parameter_Info>>,vp::rpb::Error>::~base((vp::objc::ID *)v22);

}

- (void)getRemoteProcessingBlockParameter:(float *)a3 forID:(unsigned int)a4 scope:(unsigned int)a5 element:(unsigned int)a6 object:(id)a7 withError:(id *)a8
{
  id v14;
  float *v15;
  char v16;
  std::bad_cast *exception;
  std::bad_cast *v18;
  id v19;
  char v20;
  id v21;
  char v22;
  id v23;
  char v24;

  v14 = a7;
  if (a5 >= 8)
  {
    exception = (std::bad_cast *)__cxa_allocate_exception(8uLL);
    v18 = std::bad_cast::bad_cast(exception);
  }
  std::function<vp::Expected<float,vp::rpb::Error> ()(unsigned int,vp::rpb::Scope,unsigned int)>::operator()((uint64_t)&self->get_parameter_callback, a4, a5, a6);
  if (v20)
  {
    v15 = (float *)caulk::expected<float,vp::rpb::Error>::value((uint64_t)&v19);
    if (a3)
      *a3 = *v15;
    v16 = v20;
    LOBYTE(v21) = 0;
    v22 = v20;
    if (v20)
    {
      LODWORD(v21) = (_DWORD)v19;
LABEL_10:
      v24 = v16;
LABEL_11:
      LODWORD(v23) = (_DWORD)v21;
      goto LABEL_12;
    }
  }
  else
  {
    LOBYTE(v21) = 0;
    v22 = 0;
  }
  vp::objc::ID::ID(&v21, (uint64_t *)&v19);
  if (v22)
  {
    v16 = 1;
    goto LABEL_10;
  }
  if (a8 && v21)
  {
    *a8 = vp::rpb::Object::objc_self(&v21);
    LOBYTE(v23) = 0;
    v24 = v22;
    if (v22)
      goto LABEL_11;
  }
  else
  {
    LOBYTE(v23) = 0;
    v24 = 0;
  }
  vp::objc::ID::ID(&v23, (uint64_t *)&v21);
  if (!v24)
    vp::objc::ID::~ID(&v23);
LABEL_12:
  if (!v22)
    vp::objc::ID::~ID(&v21);
  if (!v20)
    vp::objc::ID::~ID(&v19);

}

- (void)setRemoteProcessingBlockParameter:(float)a3 forID:(unsigned int)a4 scope:(unsigned int)a5 element:(unsigned int)a6 object:(id)a7 withError:(id *)a8
{
  id v14;
  std::bad_cast *exception;
  std::bad_cast *v16;
  id *v17;
  id v18;
  char v19;
  id v20;
  char v21;

  v14 = a7;
  if (a5 >= 8)
  {
    exception = (std::bad_cast *)__cxa_allocate_exception(8uLL);
    v16 = std::bad_cast::bad_cast(exception);
  }
  std::function<vp::Expected<void,vp::rpb::Error> ()(unsigned int,vp::rpb::Scope,unsigned int,float)>::operator()((uint64_t)&self->set_parameter_callback, a4, a5, a6, a3);
  v17 = a8;
  vp::Expected<void,vp::rpb::Error>::on_error<vp::rpb::handle_error(NSError * {__autoreleasing}*)::{lambda(vp::rpb::Error const&)#1}>(&v18, &v17, (uint64_t)&v20);
  if (!v21)
    vp::objc::ID::~ID(&v20);
  if (!v19)
    vp::objc::ID::~ID(&v18);

}

- (void)getRemoteProcessingBlockPropertyInfo:(id)a3 forScope:(unsigned int)a4 object:(id)a5 withError:(id *)a6
{
  id v10;
  id v11;
  void *f;
  uint64_t v13;
  id *v14;
  unsigned int *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  std::bad_cast *exception;
  std::bad_cast *v21;
  _QWORD v22[4];
  char v23;
  id v24[4];
  char v25;
  _QWORD v26[5];
  unsigned int v27;

  v10 = a3;
  v11 = a5;
  if (a4 >= 8)
  {
    exception = (std::bad_cast *)__cxa_allocate_exception(8uLL);
    v21 = std::bad_cast::bad_cast(exception);
  }
  v27 = a4;
  f = self->get_property_info_callback.__f_.__f_;
  if (!f)
    std::__throw_bad_function_call[abi:ne180100]();
  (*(void (**)(_QWORD *__return_ptr, void *, unsigned int *))(*(_QWORD *)f + 48))(v22, f, &v27);
  if (v23)
  {
    v13 = caulk::expected<std::vector<vp::rpb::Property_Info,vp::Allocator<vp::rpb::Property_Info>>,vp::rpb::Error>::value((uint64_t)v22);
    v14 = *(id **)v13;
    v15 = *(unsigned int **)(v13 + 8);
    if (*(unsigned int **)v13 != v15)
    {
      do
      {
        objc_msgSend(MEMORY[0x1E0D86FA8], "createWithPropertyID:", *(unsigned int *)v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v14[1];
        objc_msgSend(v16, "setName:", v17);

        v18 = v14[2];
        objc_msgSend(v16, "setDescription:", v18);

        objc_msgSend(v16, "setReadable:", *((unsigned __int8 *)v14 + 24));
        objc_msgSend(v16, "setWritable:", *((unsigned __int8 *)v14 + 25));
        v19 = (void *)objc_msgSend(v16, "copy");
        objc_msgSend(v10, "addObject:", v19);

        v14 += 4;
      }
      while (v14 != (id *)v15);
    }
  }
  caulk::__expected_detail::base<std::vector<vp::rpb::Parameter_Info,vp::Allocator<vp::rpb::Parameter_Info>>,vp::rpb::Error>::base(v24, (uint64_t)v22);
  if (!v25 && a6 && v24[0])
    *a6 = vp::rpb::Object::objc_self(v24);
  caulk::__expected_detail::base<std::vector<vp::rpb::Parameter_Info,vp::Allocator<vp::rpb::Parameter_Info>>,vp::rpb::Error>::base(v26, (uint64_t)v24);
  caulk::__expected_detail::base<std::vector<vp::rpb::Property_Info,vp::Allocator<vp::rpb::Property_Info>>,vp::rpb::Error>::~base((vp::objc::ID *)v26);
  caulk::__expected_detail::base<std::vector<vp::rpb::Property_Info,vp::Allocator<vp::rpb::Property_Info>>,vp::rpb::Error>::~base((vp::objc::ID *)v24);
  caulk::__expected_detail::base<std::vector<vp::rpb::Property_Info,vp::Allocator<vp::rpb::Property_Info>>,vp::rpb::Error>::~base((vp::objc::ID *)v22);

}

- (void)getRemoteProcessingBlockProperty:(id *)a3 forID:(unsigned int)a4 scope:(unsigned int)a5 element:(unsigned int)a6 object:(id)a7 withError:(id *)a8
{
  id v14;
  void **v15;
  void *v16;
  char v17;
  std::bad_cast *exception;
  std::bad_cast *v19;
  const void *v20;
  char v21;
  const void *v22;
  char v23;
  const void *v24;
  char v25;

  v14 = a7;
  if (a5 >= 8)
  {
    exception = (std::bad_cast *)__cxa_allocate_exception(8uLL);
    v19 = std::bad_cast::bad_cast(exception);
  }
  std::function<vp::Expected<float,vp::rpb::Error> ()(unsigned int,vp::rpb::Scope,unsigned int)>::operator()((uint64_t)&self->get_property_callback, a4, a5, a6);
  if (v21)
  {
    v15 = (void **)caulk::expected<applesauce::CF::TypeRef,vp::rpb::Error>::value((uint64_t)&v20);
    v16 = *v15;
    *v15 = 0;
    if (a3)
    {
      *a3 = v16;
    }
    else if (v16)
    {
      CFRelease(v16);
    }
    v17 = v21;
    LOBYTE(v22) = 0;
    v23 = v21;
    if (v21)
    {
      v22 = v20;
      v20 = 0;
      goto LABEL_12;
    }
  }
  else
  {
    LOBYTE(v22) = 0;
    v23 = 0;
  }
  vp::objc::ID::ID(&v22, (uint64_t *)&v20);
  if (!v23)
  {
    if (a8 && v22)
    {
      *a8 = vp::rpb::Object::objc_self((id *)&v22);
      LOBYTE(v24) = 0;
      v25 = v23;
      if (v23)
        goto LABEL_13;
    }
    else
    {
      LOBYTE(v24) = 0;
      v25 = 0;
    }
    vp::objc::ID::ID(&v24, (uint64_t *)&v22);
    goto LABEL_14;
  }
  v17 = 1;
LABEL_12:
  v25 = v17;
LABEL_13:
  v24 = v22;
  v22 = 0;
LABEL_14:
  caulk::__expected_detail::base<applesauce::CF::TypeRef,vp::rpb::Error>::~base(&v24);
  caulk::__expected_detail::base<applesauce::CF::TypeRef,vp::rpb::Error>::~base(&v22);
  caulk::__expected_detail::base<applesauce::CF::TypeRef,vp::rpb::Error>::~base(&v20);

}

- (void)setRemoteProcessingBlockProperty:(id)a3 forID:(unsigned int)a4 scope:(unsigned int)a5 element:(unsigned int)a6 object:(id)a7 withError:(id *)a8
{
  id v14;
  id v15;
  std::bad_cast *exception;
  std::bad_cast *v17;
  id *v18;
  CFTypeRef cf;
  id v20;
  char v21;
  id v22;
  char v23;
  id v24;

  v14 = a3;
  v15 = a7;
  if (v14)
  {
    CFRetain(v14);
    v24 = v14;
    if (a5 < 8)
    {
      CFRetain(v14);
      goto LABEL_5;
    }
LABEL_14:
    exception = (std::bad_cast *)__cxa_allocate_exception(8uLL);
    v17 = std::bad_cast::bad_cast(exception);
  }
  v24 = 0;
  if (a5 >= 8)
    goto LABEL_14;
LABEL_5:
  cf = v14;
  std::function<vp::Expected<float,vp::rpb::Error> ()(unsigned int,vp::rpb::Scope,unsigned int)>::operator()((uint64_t)&self->set_property_callback, a4, a5, a6);
  v18 = a8;
  vp::Expected<void,vp::rpb::Error>::on_error<vp::rpb::handle_error(NSError * {__autoreleasing}*)::{lambda(vp::rpb::Error const&)#1}>(&v20, &v18, (uint64_t)&v22);
  if (!v23)
    vp::objc::ID::~ID(&v22);
  if (!v21)
    vp::objc::ID::~ID(&v20);
  if (cf)
    CFRelease(cf);
  if (v14)
    CFRelease(v14);

}

- (void).cxx_destruct
{
  function<vp::Expected<void, vp::rpb::Error> (unsigned int, vp::rpb::Scope, unsigned int, applesauce::CF::TypeRef)> *p_set_property_callback;
  function<vp::Expected<void, vp::rpb::Error> (unsigned int, vp::rpb::Scope, unsigned int, applesauce::CF::TypeRef)> *f;
  uint64_t v5;
  RPBItem_Delegate *p_get_property_callback;
  uint64_t v7;
  RPBItem_Delegate *p_get_property_info_callback;
  uint64_t v9;
  RPBItem_Delegate *p_set_parameter_callback;
  uint64_t v11;
  RPBItem_Delegate *p_get_parameter_callback;
  uint64_t v13;
  RPBItem_Delegate *p_get_parameter_info_callback;
  uint64_t v15;

  p_set_property_callback = &self->set_property_callback;
  f = (function<vp::Expected<void, vp::rpb::Error> (unsigned int, vp::rpb::Scope, unsigned int, applesauce::CF::TypeRef)> *)self->set_property_callback.__f_.__f_;
  if (f == p_set_property_callback)
  {
    v5 = 4;
    f = p_set_property_callback;
  }
  else
  {
    if (!f)
      goto LABEL_6;
    v5 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)f->__f_.__buf_.__lx + 8 * v5))();
LABEL_6:
  p_get_property_callback = (RPBItem_Delegate *)self->get_property_callback.__f_.__f_;
  if (p_get_property_callback == (RPBItem_Delegate *)&self->get_property_callback)
  {
    v7 = 4;
    p_get_property_callback = (RPBItem_Delegate *)&self->get_property_callback;
  }
  else
  {
    if (!p_get_property_callback)
      goto LABEL_11;
    v7 = 5;
  }
  (*((void (**)(void))p_get_property_callback->super.isa + v7))();
LABEL_11:
  p_get_property_info_callback = (RPBItem_Delegate *)self->get_property_info_callback.__f_.__f_;
  if (p_get_property_info_callback == (RPBItem_Delegate *)&self->get_property_info_callback)
  {
    v9 = 4;
    p_get_property_info_callback = (RPBItem_Delegate *)&self->get_property_info_callback;
  }
  else
  {
    if (!p_get_property_info_callback)
      goto LABEL_16;
    v9 = 5;
  }
  (*((void (**)(void))p_get_property_info_callback->super.isa + v9))();
LABEL_16:
  p_set_parameter_callback = (RPBItem_Delegate *)self->set_parameter_callback.__f_.__f_;
  if (p_set_parameter_callback == (RPBItem_Delegate *)&self->set_parameter_callback)
  {
    v11 = 4;
    p_set_parameter_callback = (RPBItem_Delegate *)&self->set_parameter_callback;
  }
  else
  {
    if (!p_set_parameter_callback)
      goto LABEL_21;
    v11 = 5;
  }
  (*((void (**)(void))p_set_parameter_callback->super.isa + v11))();
LABEL_21:
  p_get_parameter_callback = (RPBItem_Delegate *)self->get_parameter_callback.__f_.__f_;
  if (p_get_parameter_callback == (RPBItem_Delegate *)&self->get_parameter_callback)
  {
    v13 = 4;
    p_get_parameter_callback = (RPBItem_Delegate *)&self->get_parameter_callback;
  }
  else
  {
    if (!p_get_parameter_callback)
      goto LABEL_26;
    v13 = 5;
  }
  (*((void (**)(void))p_get_parameter_callback->super.isa + v13))();
LABEL_26:
  p_get_parameter_info_callback = (RPBItem_Delegate *)self->get_parameter_info_callback.__f_.__f_;
  if (p_get_parameter_info_callback == (RPBItem_Delegate *)&self->get_parameter_info_callback)
  {
    v15 = 4;
    p_get_parameter_info_callback = (RPBItem_Delegate *)&self->get_parameter_info_callback;
  }
  else
  {
    if (!p_get_parameter_info_callback)
      return;
    v15 = 5;
  }
  (*((void (**)(void))p_get_parameter_info_callback->super.isa + v15))();
}

- (id).cxx_construct
{
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 12) = 0;
  *((_QWORD *)self + 16) = 0;
  *((_QWORD *)self + 20) = 0;
  *((_QWORD *)self + 24) = 0;
  return self;
}

@end
