@implementation ETImageDescriptorExtractor

- (ETImageDescriptorExtractor)initWithNetwork:(id)a3
{
  id v4;
  char *v5;
  EspressoLight::espresso_context *context;
  _BYTE *plan;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  char **v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const void *v19;
  void *v20;
  std::__shared_weak_count *v21;
  unint64_t *p_shared_owners;
  unint64_t v23;
  uint64_t v24;
  void *v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  int v29;
  unint64_t *v30;
  unint64_t v31;
  unint64_t *v32;
  unint64_t v33;
  __int128 *v34;
  __int128 v35;
  char *v36;
  uint64_t v37;
  std::string *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  std::string *v42;
  Espresso *v43;
  const char *v44;
  uint64_t v45;
  NSObject *v46;
  std::string *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  std::__shared_weak_count *v51;
  unint64_t *v52;
  unint64_t v53;
  uint64_t v55;
  const void *v56;
  std::__shared_weak_count *v57;
  unint64_t *v58;
  unint64_t v59;
  unint64_t v60;
  std::string v61;
  uint64_t v62;
  std::__shared_weak_count *v63;
  objc_super v64;
  _BYTE buf[12];
  __int16 v66;
  std::string *v67;
  __int16 v68;
  uint64_t v69;
  __int16 v70;
  uint64_t v71;
  __int16 v72;
  uint64_t v73;
  __int128 v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v64.receiver = self;
  v64.super_class = (Class)ETImageDescriptorExtractor;
  v5 = -[ETImageDescriptorExtractor init](&v64, sel_init);
  if (!v5)
    goto LABEL_69;
  context = (EspressoLight::espresso_context *)espresso_create_context(5u, 0xFFFFFFFF);
  *((_QWORD *)v5 + 4) = context;
  plan = (_BYTE *)espresso_create_plan(context, 0);
  *((_QWORD *)v5 + 1) = plan;
  if (espresso_plan_add_network(plan, (char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"), 65552, (uint64_t)(v5 + 16)))
  {
    espresso_plan_get_error_info(*((_QWORD *)v5 + 1));
    NSLog(CFSTR("%s"), v8);
  }
  Espresso::get_internal_network(*((_QWORD *)v5 + 2), *((_QWORD *)v5 + 3), (uint64_t)&v62);
  v9 = v62;
  v11 = *(_QWORD *)(v62 + 32);
  v10 = *(_QWORD *)(v62 + 40);
  *(_QWORD *)buf = 0;
  v12 = std::__hash_table<std::__hash_value_type<unsigned long,std::vector<std::string>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<std::string>>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long &&>,std::tuple<>>(v62 + 56, 0, buf);
  v13 = (char **)(v5 + 392);
  std::string::operator=((std::string *)(v5 + 392), (const std::string *)v12[3]);
  v14 = ((unint64_t)(v10 - v11) >> 4) - 1;
  v15 = *(_QWORD *)(v9 + 32);
  v16 = (*(_QWORD *)(v9 + 40) - v15) >> 4;
  if ((int)v16 >= 3)
  {
    v17 = (v16 - 1);
    v18 = *(_QWORD *)(v15 + 16 * v17);
    v19 = *(const void **)(v18 + 64);
    if (v19)
    {
      if (v20)
      {
        v21 = *(std::__shared_weak_count **)(v18 + 72);
        if (v21)
        {
          p_shared_owners = (unint64_t *)&v21->__shared_owners_;
          do
            v23 = __ldxr(p_shared_owners);
          while (__stxr(v23 + 1, p_shared_owners));
          v15 = *(_QWORD *)(v9 + 32);
        }
LABEL_13:
        v24 = *(_QWORD *)(v15 + 16 * (v16 - 2));
        v25 = *(void **)(v24 + 64);
        if (v25
        {
          v26 = *(std::__shared_weak_count **)(v24 + 72);
          if (v26)
          {
            v27 = (unint64_t *)&v26->__shared_owners_;
            do
              v28 = __ldxr(v27);
            while (__stxr(v28 + 1, v27));
          }
          if (v20)
            goto LABEL_19;
        }
        else
        {
          v26 = 0;
          if (v20)
          {
LABEL_19:
            if (v25)
              v29 = -3;
            else
              v29 = -2;
            v14 = v29 + ((*(_QWORD *)(v9 + 40) - *(_QWORD *)(v9 + 32)) >> 4);
LABEL_25:
            if (v26)
            {
              v30 = (unint64_t *)&v26->__shared_owners_;
              do
                v31 = __ldaxr(v30);
              while (__stlxr(v31 - 1, v30));
              if (!v31)
              {
                ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
                std::__shared_weak_count::__release_weak(v26);
              }
            }
            if (v21)
            {
              v32 = (unint64_t *)&v21->__shared_owners_;
              do
                v33 = __ldaxr(v32);
              while (__stlxr(v33 - 1, v32));
              if (!v33)
              {
                ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
                std::__shared_weak_count::__release_weak(v21);
              }
            }
            goto LABEL_35;
          }
        }
        if (!v25)
        {
          v55 = *(_QWORD *)(*(_QWORD *)(v9 + 32) + 16 * v17);
          v56 = *(const void **)(v55 + 64);
          if (v56)
          {
            {
              v57 = *(std::__shared_weak_count **)(v55 + 72);
              if (v57)
              {
                v58 = (unint64_t *)&v57->__shared_owners_;
                do
                  v59 = __ldxr(v58);
                while (__stxr(v59 + 1, v58));
                do
                  v60 = __ldaxr(v58);
                while (__stlxr(v60 - 1, v58));
                if (!v60)
                {
                  ((void (*)(std::__shared_weak_count *))v57->__on_zero_shared)(v57);
                  std::__shared_weak_count::__release_weak(v57);
                }
              }
              v14 = ((*(_QWORD *)(v62 + 40) - *(_QWORD *)(v62 + 32)) >> 4) - 2;
            }
          }
        }
        goto LABEL_25;
      }
    }
    else
    {
      v20 = 0;
    }
    v21 = 0;
    goto LABEL_13;
  }
LABEL_35:
  *(_QWORD *)buf = v14;
  v34 = (__int128 *)std::__hash_table<std::__hash_value_type<unsigned long,std::vector<std::string>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<std::string>>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long &&>,std::tuple<>>(v62 + 96, v14, buf)[3];
  if (*((char *)v34 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&v61, *(const std::string::value_type **)v34, *((_QWORD *)v34 + 1));
  }
  else
  {
    v35 = *v34;
    v61.__r_.__value_.__r.__words[2] = *((_QWORD *)v34 + 2);
    *(_OWORD *)&v61.__r_.__value_.__l.__data_ = v35;
  }
  v36 = v5 + 392;
  if (v5[415] < 0)
    v36 = *v13;
  if (espresso_network_declare_input(*((EspressoLight::espresso_plan **)v5 + 2), *((_QWORD *)v5 + 3), v36))
  {
    espresso_plan_get_error_info(*((_QWORD *)v5 + 1));
    NSLog(CFSTR("%s"), v37);
  }
  if ((v61.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v38 = &v61;
  else
    v38 = (std::string *)v61.__r_.__value_.__r.__words[0];
  if (espresso_network_declare_output(*((EspressoLight::espresso_plan **)v5 + 2), *((_QWORD *)v5 + 3), (char *)v38))
  {
    espresso_plan_get_error_info(*((_QWORD *)v5 + 1));
    NSLog(CFSTR("%s"), v39);
  }
  if (espresso_plan_build(*((_QWORD **)v5 + 1)))
  {
    espresso_plan_get_error_info(*((_QWORD *)v5 + 1));
    NSLog(CFSTR("%s"), v40);
  }
  v41 = (uint64_t)(v5 + 392);
  if (v5[415] < 0)
    v41 = (uint64_t)*v13;
  espresso_network_query_blob_dimensions(*((const void **)v5 + 2), *((_QWORD *)v5 + 3), v41, (uint64_t)&v74);
  *(_OWORD *)(v5 + 376) = v74;
  if ((v61.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v42 = &v61;
  else
    v42 = (std::string *)v61.__r_.__value_.__r.__words[0];
  v43 = (Espresso *)espresso_network_bind_buffer(*((const void **)v5 + 2), *((_QWORD *)v5 + 3), (uint64_t)v42, (uint64_t)(v5 + 208), 0x20000, 0x10000, 0x10000);
  if ((_DWORD)v43)
  {
    espresso_plan_get_error_info(*((_QWORD *)v5 + 1));
    NSLog(CFSTR("%s"), v45);
  }
  Espresso::espresso_os_log_subsystem(v43, v44);
  v46 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
  {
    if (v5[415] < 0)
      v13 = (char **)*v13;
    v47 = &v61;
    if ((v61.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v47 = (std::string *)v61.__r_.__value_.__r.__words[0];
    v48 = *((_QWORD *)v5 + 36);
    v49 = *((_QWORD *)v5 + 37);
    v50 = *((_QWORD *)v5 + 38);
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)&buf[4] = v13;
    v66 = 2080;
    v67 = v47;
    v68 = 2048;
    v69 = v48;
    v70 = 2048;
    v71 = v49;
    v72 = 2048;
    v73 = v50;
    _os_log_impl(&dword_190DAF000, v46, OS_LOG_TYPE_INFO, "[ETImageDescriptorExtractor] input=%s output=%s (%zu %zu %zu)", buf, 0x34u);
  }

  if (SHIBYTE(v61.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v61.__r_.__value_.__l.__data_);
  v51 = v63;
  if (v63)
  {
    v52 = (unint64_t *)&v63->__shared_owners_;
    do
      v53 = __ldaxr(v52);
    while (__stlxr(v53 - 1, v52));
    if (!v53)
    {
      ((void (*)(std::__shared_weak_count *))v51->__on_zero_shared)(v51);
      std::__shared_weak_count::__release_weak(v51);
    }
  }
LABEL_69:

  return (ETImageDescriptorExtractor *)v5;
}

- (void)extractForDataPoint:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  ETImageDescriptorExtractor *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__ETImageDescriptorExtractor_extractForDataPoint___block_invoke;
  v6[3] = &unk_1E2DD5100;
  v7 = v4;
  v8 = self;
  v5 = v4;
  objc_msgSend(v5, "iterateBuffersByKey:", v6);

}

- (float)extractDescriptorForDataPoint:(vImage_Buffer *)a3 freeWhenDone:(BOOL)a4
{
  _BOOL4 v4;
  vImagePixelCount width;
  size_t rowBytes;
  vImagePixelCount height;
  vImagePixelCount v10;
  size_t v11;
  unint64_t *p_targetWidth;
  int8x16_t v13;
  void *plan;
  uint64_t v15;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *p_inputName;
  size_t v17;
  void *v18;
  vImage_Buffer v20;
  vImage_Buffer dest;
  vImage_Buffer src;

  v4 = a4;
  width = a3->width;
  rowBytes = a3->rowBytes;
  height = a3->height;
  if (width >= height)
    v10 = a3->height;
  else
    v10 = a3->width;
  v11 = rowBytes / width;
  src.data = (char *)a3->data
           + ((height >> 1) - (v10 >> 1)) * rowBytes
           + ((width >> 1) - (v10 >> 1)) * (rowBytes / width);
  src.height = v10;
  src.width = v10;
  src.rowBytes = rowBytes;
  p_targetWidth = &self->_targetWidth;
  dest.data = malloc_type_malloc(self->_targetWidth * (rowBytes / width) * self->_targetHeight, 0x90CA98F9uLL);
  v13 = *(int8x16_t *)p_targetWidth;
  *(int8x16_t *)&dest.height = vextq_s8(v13, v13, 8uLL);
  dest.rowBytes = v13.i64[0] * v11;
  vImageScale_ARGB8888(&src, &dest, 0, 0);
  plan = self->_net.plan;
  v15 = *(_QWORD *)&self->_net.network_index;
  p_inputName = &self->_inputName;
  if (*((char *)&self->_inputName.__r_.__value_.var0.__l + 23) < 0)
    p_inputName = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)p_inputName->__r_.__value_.var0.__l.__data_;
  v20 = dest;
  espresso_network_bind_input_vimagebuffer_bgra8(plan, v15, (uint64_t)p_inputName, 0, (uint64_t)&v20, 0);
  espresso_plan_execute_sync(self->_plan);
  v17 = 4 * self->_outputBlob.stride_sequence_length;
  v18 = malloc_type_malloc(v17, 0xE1AE1AC3uLL);
  memcpy(v18, self->_outputBlob.data, v17);
  if (v4)
    free(a3->data);
  free(dest.data);
  return (float *)v18;
}

- (int)numberOfChannels
{
  return self->_outputBlob.channels;
}

- (float)rotation_range
{
  return *(float *)&self->_inputName.var0;
}

- (void)setRotation_range:(float)a3
{
  *(float *)&self->_inputName.var0 = a3;
}

- (float)horizontal_flip
{
  return *((float *)&self->_inputName.var0 + 1);
}

- (void)setHorizontal_flip:(float)a3
{
  *((float *)&self->_inputName.var0 + 1) = a3;
}

- (float)zoom_range
{
  return *(float *)&self->_inputShape;
}

- (void)setZoom_range:(float)a3
{
  *(float *)&self->_inputShape = a3;
}

- (float)shear_range
{
  return *((float *)&self->_inputShape + 1);
}

- (void)setShear_range:(float)a3
{
  *((float *)&self->_inputShape + 1) = a3;
}

- (float)contrast_range
{
  return self->_rotation_range;
}

- (void)setContrast_range:(float)a3
{
  self->_rotation_range = a3;
}

- (float)brightness_range
{
  return self->_horizontal_flip;
}

- (void)setBrightness_range:(float)a3
{
  self->_horizontal_flip = a3;
}

- (int)nAugmentations
{
  return LODWORD(self->_zoom_range);
}

- (void)setNAugmentations:(int)a3
{
  LODWORD(self->_zoom_range) = a3;
}

- (int)doBatchnormTuning
{
  return LODWORD(self->_shear_range);
}

- (void)setDoBatchnormTuning:(int)a3
{
  LODWORD(self->_shear_range) = a3;
}

- (unint64_t)descriptors_mem_cache_size
{
  return *(_QWORD *)&self->_contrast_range;
}

- (void)setDescriptors_mem_cache_size:(unint64_t)a3
{
  *(_QWORD *)&self->_contrast_range = a3;
}

- (unint64_t)descriptors_file_cache_size
{
  return *(_QWORD *)&self->_nAugmentations;
}

- (void)setDescriptors_file_cache_size:(unint64_t)a3
{
  *(_QWORD *)&self->_nAugmentations = a3;
}

- (void).cxx_destruct
{
  if (*((char *)&self->_inputName.__r_.__value_.var0.__l + 23) < 0)
    operator delete(self->_inputName.__r_.__value_.var0.__l.__data_);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 392) = 0uLL;
  *((_QWORD *)self + 51) = 0;
  return self;
}

void __50__ETImageDescriptorExtractor_extractForDataPoint___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  _OWORD v7[2];
  __int128 v8;
  __int128 v9;

  v4 = a3;
  v8 = 0u;
  v9 = 0u;
  v5 = *(void **)(a1 + 32);
  if (v5)
    objc_msgSend(v5, "imageWithKey:", v4);
  v6 = *(void **)(a1 + 40);
  v7[0] = v8;
  v7[1] = v9;
  objc_msgSend(*(id *)(a1 + 32), "setData:size:forKey:freeWhenDone:", objc_msgSend(v6, "extractDescriptorForDataPoint:freeWhenDone:", v7, 0), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 360), v4, 0);

}

+ (id)VisionSceneNet_iOS10_Extractor
{
  return -[ETImageDescriptorExtractor initWithNetwork:]([ETImageDescriptorExtractor alloc], "initWithNetwork:", CFSTR("/System/Library/Frameworks/Vision.framework/Versions/A/Resources/scene-descriptor.bin:apple_scenes"));
}

+ (id)inception_v3_Extractor
{
  char *v2;
  ETImageDescriptorExtractor *v3;
  std::string *v4;
  void *v5;
  ETImageDescriptorExtractor *v6;
  std::string v8;

  v2 = getenv("ESPRESSO_ROOT");
  std::string::basic_string[abi:ne180100]<0>(&v8, v2);
  std::string::append(&v8, "/espresso_test_data/EspressoTrainTestData/networks/inception_v3_keras1/arch.json.espresso.net");
  v3 = [ETImageDescriptorExtractor alloc];
  if ((v8.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v4 = &v8;
  else
    v4 = (std::string *)v8.__r_.__value_.__r.__words[0];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ETImageDescriptorExtractor initWithNetwork:](v3, "initWithNetwork:", v5);

  if (SHIBYTE(v8.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v8.__r_.__value_.__l.__data_);
  return v6;
}

+ (id)passthroughExtractor
{
  return 0;
}

+ (id)VisionSmartCamNet_iOS11_Extractor
{
  return 0;
}

@end
