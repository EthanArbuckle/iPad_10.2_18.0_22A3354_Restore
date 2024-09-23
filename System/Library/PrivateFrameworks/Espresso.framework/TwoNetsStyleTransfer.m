@implementation TwoNetsStyleTransfer

- (TwoNetsStyleTransfer)init
{
  TwoNetsStyleTransfer *v2;
  _BOOL8 v3;
  const char *v4;
  TwoNetsStyleTransfer *v5;
  NSObject *v6;
  uint8_t v8[16];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TwoNetsStyleTransfer;
  v2 = -[TwoNetsStyleTransfer init](&v9, sel_init);
  v3 = Espresso::hardware::supports_platform(10006);
  if (!v3)
  {
    Espresso::espresso_os_log_subsystem((Espresso *)v3, v4);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_error_impl(&dword_190DAF000, v6, OS_LOG_TYPE_ERROR, "Hardware does not support ANE_RUNTIME - cannot use TwoNetsStyleTransfer", v8, 2u);
    }

    goto LABEL_7;
  }
  if (!v2)
  {
LABEL_7:
    v5 = 0;
    goto LABEL_8;
  }
  v5 = v2;
LABEL_8:

  return v5;
}

- (int)load:(id)a3 outputName:(id)a4
{
  id v7;
  id v8;
  _opaque_pthread_mutex_t *v9;
  id v10;
  void *plan;
  _QWORD *ctx;
  void *context;
  _BYTE *v14;
  int blob_dimensions;
  pthread_mutex_t *v17;

  v7 = a3;
  v8 = a4;
  pthread_mutex_locker::pthread_mutex_locker((pthread_mutex_locker *)&v17, v9);
  v10 = objc_retainAutorelease(v8);
  MEMORY[0x19401C808](&self->output_layer_name, objc_msgSend(v10, "UTF8String"));
  objc_storeStrong((id *)&self->_anon_110[120], a3);
  plan = self->plan;
  if (plan)
    espresso_plan_destroy((std::string::size_type)plan);
  ctx = self->ctx;
  if (ctx)
    espresso_context_destroy(ctx);
  context = (void *)espresso_create_context(0x2717u, 0xFFFFFFFF);
  self->ctx = context;
  espresso_context_set_low_precision_accumulation((uint64_t **)context, 1);
  v14 = (_BYTE *)espresso_create_plan((EspressoLight::espresso_context *)self->ctx, 0);
  self->plan = v14;
  if (v14)
  {
    blob_dimensions = espresso_plan_add_network(v14, (char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String"), 65552, (uint64_t)&self->net);
    if (!blob_dimensions)
    {
      blob_dimensions = espresso_plan_build((_QWORD *)self->plan);
      if (!blob_dimensions)
      {
        blob_dimensions = espresso_network_query_blob_dimensions(self->net.plan, *(_QWORD *)&self->net.network_index, (uint64_t)"data0", (uint64_t)&self->output_layer_name.__r_.var0);
        if (!blob_dimensions)
        {
          blob_dimensions = espresso_network_query_blob_dimensions(self->net.plan, *(_QWORD *)&self->net.network_index, (uint64_t)"data2", (uint64_t)&self->dim_data0__small[3]);
          if (!blob_dimensions)
          {
            blob_dimensions = espresso_network_query_blob_dimensions(self->net.plan, *(_QWORD *)&self->net.network_index, (uint64_t)"data0__small", (uint64_t)&self->dim_data0[3]);
            if (!blob_dimensions)
            {
              blob_dimensions = espresso_network_query_blob_dimensions(self->net.plan, *(_QWORD *)&self->net.network_index, (uint64_t)"data2__small", (uint64_t)&self->dim_data2[3]);
              if (!blob_dimensions)
              {
                if (*(_QWORD *)&self->output_layer_name.__r_.var0 == self->dim_data0__small[3]
                  && self->output_layer_name.var0 == self->dim_data0__small[4]
                  && self->dim_data0[0] == self->dim_data2[0]
                  && self->dim_data0[1] == self->dim_data2[1]
                  && self->dim_data0[2] == self->dim_data2[2]
                  && self->dim_data0[3] == self->dim_data2[3]
                  && self->dim_data0[4] == self->dim_data2[4]
                  && self->dim_data0__small[0] == self->dim_data2__small[0])
                {
                  blob_dimensions = -7;
                  if (self->dim_data0__small[1] == self->dim_data2__small[1])
                  {
                    if (self->dim_data0__small[2] == self->dim_data2__small[2])
                      blob_dimensions = 0;
                    else
                      blob_dimensions = -7;
                  }
                }
                else
                {
                  blob_dimensions = -7;
                }
              }
            }
          }
        }
      }
    }
  }
  else
  {
    blob_dimensions = -1;
  }
  pthread_mutex_locker::~pthread_mutex_locker(&v17);

  return blob_dimensions;
}

- (int)widthSmall
{
  return self->dim_data0[3];
}

- (int)widthBig
{
  return self->output_layer_name.__r_.var0;
}

- (int)heightSmall
{
  return self->dim_data0[4];
}

- (int)heightBig
{
  return self->output_layer_name.var0;
}

- (void)dealloc
{
  void *plan;
  objc_super v4;
  pthread_mutex_t *v5;

  pthread_mutex_locker::pthread_mutex_locker((pthread_mutex_locker *)&v5, (_opaque_pthread_mutex_t *)a2);
  plan = self->plan;
  if (plan)
    espresso_plan_destroy((std::string::size_type)plan);
  espresso_context_destroy((_QWORD *)self->ctx);
  pthread_mutex_locker::~pthread_mutex_locker(&v5);
  v4.receiver = self;
  v4.super_class = (Class)TwoNetsStyleTransfer;
  -[TwoNetsStyleTransfer dealloc](&v4, sel_dealloc);
}

- (__IOSurface)executeSyncWithImage:(__CVBuffer *)a3 smallImage:(__CVBuffer *)a4
{
  basic_string<char, std::char_traits<char>, std::allocator<char>> *p_output_layer_name;
  size_t Width;
  size_t Height;
  size_t BytesPerRow;
  void *BaseAddress;
  void *plan;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  size_t v16;
  size_t v17;
  size_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  int v24;
  __IOSurface *v25;
  std::runtime_error *exception;
  std::runtime_error *v28;
  _QWORD v29[4];
  _QWORD v30[4];
  _QWORD v31[4];
  _QWORD v32[4];
  unint64_t v33[21];
  pthread_mutex_t *v34;

  pthread_mutex_locker::pthread_mutex_locker((pthread_mutex_locker *)&v34, (_opaque_pthread_mutex_t *)a2);
  p_output_layer_name = &self->output_layer_name;
  if (*((char *)&self->output_layer_name.__r_.__value_.var0.__l + 23) < 0)
    p_output_layer_name = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)p_output_layer_name->__r_.__value_.var0.__l.__data_;
  espresso_network_bind_buffer(self->net.plan, *(_QWORD *)&self->net.network_index, (uint64_t)p_output_layer_name, (uint64_t)v33, 0x20000, 0x10000, 0x80000);
  CVPixelBufferLockBaseAddress(a3, 0);
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
  BaseAddress = CVPixelBufferGetBaseAddress(a3);
  plan = self->net.plan;
  v13 = *(_QWORD *)&self->net.network_index;
  v32[0] = BaseAddress;
  v32[1] = Height;
  v32[2] = Width;
  v32[3] = BytesPerRow;
  if (espresso_network_bind_input_vimagebuffer_bgra8(plan, v13, (uint64_t)"data0", 0, (uint64_t)v32, 0))
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "input binding for data0 failed.");
    goto LABEL_11;
  }
  v14 = self->net.plan;
  v15 = *(_QWORD *)&self->net.network_index;
  v31[0] = BaseAddress;
  v31[1] = Height;
  v31[2] = Width;
  v31[3] = BytesPerRow;
  if (espresso_network_bind_input_vimagebuffer_bgra8(v14, v15, (uint64_t)"data2", 0, (uint64_t)v31, 0))
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "input binding for data2 failed.");
LABEL_11:
    __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
  }
  CVPixelBufferLockBaseAddress(a4, 0);
  v16 = CVPixelBufferGetWidth(a4);
  v17 = CVPixelBufferGetHeight(a4);
  v18 = CVPixelBufferGetBytesPerRow(a4);
  v19 = CVPixelBufferGetBaseAddress(a4);
  v20 = self->net.plan;
  v21 = *(_QWORD *)&self->net.network_index;
  v30[0] = v19;
  v30[1] = v17;
  v30[2] = v16;
  v30[3] = v18;
  if (espresso_network_bind_input_vimagebuffer_bgra8(v20, v21, (uint64_t)"data0__small", 0, (uint64_t)v30, 0))
  {
    v28 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v28, "input binding for data0__small failed.");
    goto LABEL_15;
  }
  v22 = self->net.plan;
  v23 = *(_QWORD *)&self->net.network_index;
  v29[0] = v19;
  v29[1] = v17;
  v29[2] = v16;
  v29[3] = v18;
  if (espresso_network_bind_input_vimagebuffer_bgra8(v22, v23, (uint64_t)"data2__small", 0, (uint64_t)v29, 0))
  {
    v28 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v28, "input binding for data2__small failed.");
    goto LABEL_15;
  }
  v24 = espresso_plan_execute_sync(self->plan);
  CVPixelBufferUnlockBaseAddress(a3, 0);
  CVPixelBufferUnlockBaseAddress(a4, 0);
  if (v24)
  {
    v28 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v28, "plan execution failed...");
LABEL_15:
    __cxa_throw(v28, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
  }
  v25 = (__IOSurface *)v33[0];
  self->dim_data2__small[3] = v33[0];
  pthread_mutex_locker::~pthread_mutex_locker(&v34);
  return v25;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anon_110[120], 0);
  if (*((char *)&self->current_postprocessing_settings.name.__r_.var1 + 3) < 0)
    operator delete((void *)self->current_postprocessing_settings.name.__r_.__value_.var0.__l.__size_);
  if (self->current_postprocessing_settings.name.__r_.__value_.var0.__s.__data_[7] < 0)
    operator delete((void *)self->dim_data2__small[4]);
  if (*((char *)&self->output_layer_name.__r_.__value_.var0.__l + 23) < 0)
    operator delete(self->output_layer_name.__r_.__value_.var0.__l.__data_);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0uLL;
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 46) = 0x3F8000003DA3D70ALL;
  *(_OWORD *)((char *)self + 248) = 0u;
  *((_QWORD *)self + 35) = 0x3E99999A00000000;
  *((_QWORD *)self + 36) = 0;
  *((_DWORD *)self + 78) = 0;
  *((_DWORD *)self + 91) = 960;
  *((_DWORD *)self + 94) = 0;
  *((_BYTE *)self + 404) = 0;
  *(_OWORD *)((char *)self + 232) = 0u;
  *(_OWORD *)((char *)self + 264) = 0u;
  *(_OWORD *)((char *)self + 296) = xmmword_191A93390;
  *(_OWORD *)((char *)self + 316) = xmmword_191A933A0;
  *(_OWORD *)((char *)self + 332) = xmmword_191A933B0;
  *(_OWORD *)((char *)self + 348) = xmmword_191A933C0;
  *(_OWORD *)((char *)self + 380) = xmmword_191A933D0;
  *(_QWORD *)((char *)self + 396) = 0x3F8000003F79999ALL;
  return self;
}

+ (BOOL)supportsANE
{
  return Espresso::hardware::supports_platform(10006);
}

@end
