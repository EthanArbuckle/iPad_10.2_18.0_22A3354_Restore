@implementation CTServerConnectionRegisterSilentHoursCallback

void ___CTServerConnectionRegisterSilentHoursCallback_block_invoke(uint64_t a1, xpc_object_t *a2)
{
  void **v4;
  CFStringRef v5;
  xpc_object_t reply;
  xpc_object_t v7;
  xpc_connection_t remote_connection;
  _xpc_connection_s *v9;
  char v10;
  xpc_object_t v11;
  xpc_object_t v12;
  _QWORD v13[2];
  xpc_object_t object;
  void *v15[2];
  uint64_t v16;
  void *__p;
  uint64_t v18;
  uint64_t v19;

  v15[0] = 0;
  v15[1] = 0;
  v16 = 0;
  v13[0] = a2;
  v13[1] = "call::phoneNumber";
  xpc::dict::object_proxy::operator xpc::object((uint64_t)v13, &object);
  __p = 0;
  v18 = 0;
  v19 = 0;
  xpc::dyn_cast_or_default();
  if (SHIBYTE(v19) < 0)
    operator delete(__p);
  xpc_release(object);
  if (v16 >= 0)
    v4 = v15;
  else
    v4 = (void **)v15[0];
  v5 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const char *)v4, 0x8000100u);
  reply = xpc_dictionary_create_reply(*a2);
  if ((reply || (reply = xpc_null_create()) != 0) && MEMORY[0x186DBAE5C](reply) == MEMORY[0x1E0C812F8])
  {
    xpc_retain(reply);
    v7 = reply;
  }
  else
  {
    v7 = xpc_null_create();
  }
  xpc_release(reply);
  remote_connection = xpc_dictionary_get_remote_connection(*a2);
  if (remote_connection)
  {
    v9 = remote_connection;
    xpc_retain(remote_connection);
  }
  else
  {
    v9 = (_xpc_connection_s *)xpc_null_create();
  }
  v10 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v11 = xpc_BOOL_create(v10);
  if (!v11)
    v11 = xpc_null_create();
  xpc_dictionary_set_value(v7, "call::allow", v11);
  v12 = xpc_null_create();
  xpc_release(v11);
  xpc_release(v12);
  xpc_connection_send_message(v9, v7);
  xpc_release(v9);
  xpc_release(v7);
  if (v5)
    CFRelease(v5);
  if (SHIBYTE(v16) < 0)
    operator delete(v15[0]);
}

void ___CTServerConnectionRegisterSilentHoursCallback_block_invoke_58(uint64_t a1)
{
  const void *v2;
  void *v3;
  uint64_t **v4;
  _OWORD *v5;
  const void *v6;
  void *__p[2];
  char v8;
  void **v9;

  v2 = *(const void **)(a1 + 40);
  if (v2)
    v3 = _Block_copy(v2);
  else
    v3 = 0;
  v4 = (uint64_t **)(*(_QWORD *)(a1 + 32) + 56);
  std::string::basic_string[abi:nn180100]<0>(__p, "kIncomingCallCheckMessageRequest");
  v9 = __p;
  v5 = std::__tree<std::__value_type<std::string,dispatch::block<void({block_pointer})(xpc::dict)>>,std::__map_value_compare<std::string,std::__value_type<std::string,dispatch::block<void({block_pointer})(xpc::dict)>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,dispatch::block<void({block_pointer})(xpc::dict)>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v4, __p, (uint64_t)&std::piecewise_construct, (_OWORD **)&v9);
  v6 = (const void *)*((_QWORD *)v5 + 7);
  *((_QWORD *)v5 + 7) = v3;
  if (v8 < 0)
  {
    operator delete(__p[0]);
    if (!v6)
      return;
  }
  else if (!v6)
  {
    return;
  }
  _Block_release(v6);
}

@end
