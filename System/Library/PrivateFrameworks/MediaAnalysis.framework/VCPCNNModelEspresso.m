@implementation VCPCNNModelEspresso

- (VCPCNNModelEspresso)initWithParameters:(id)a3 inputNames:(id)a4 outputNames:(id)a5 properties:(id)a6
{
  id v11;
  VCPCNNModelEspresso *v12;
  VCPCNNModelEspresso *v13;
  NSString *resConfig;
  void *v15;
  void *v16;
  uint64_t v17;
  VCPCNNModelEspresso *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  VCPCNNEspressoContext *v28;
  VCPCNNEspressoContext *context;
  VCPCNNEspressoContext *v30;
  int default_storage_type;
  const char *v32;
  void *v33;
  BOOL v34;
  void *v35;
  id v36;
  int v37;
  VCPCNNModelEspresso *v38;
  id v40;
  id v41;
  id v42;
  objc_super v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  _BYTE v47[10];
  __int16 v48;
  int v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v42 = a3;
  v40 = a4;
  v41 = a5;
  v11 = a6;
  v43.receiver = self;
  v43.super_class = (Class)VCPCNNModelEspresso;
  v12 = -[VCPCNNModelEspresso init](&v43, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_netFileUrl, a3);
    objc_storeStrong((id *)&v13->_inputNames, a4);
    objc_storeStrong((id *)&v13->_outputNames, a5);
    resConfig = v13->_resConfig;
    v13->_resConfig = (NSString *)&stru_1E6B1C190;

    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("forceCPU"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
      v17 = objc_msgSend(v15, "BOOLValue");
    else
      v17 = 0;
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("forceNNGraph"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = v19;
    if (v19)
      v21 = objc_msgSend(v19, "BOOLValue");
    else
      v21 = 0;
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("sharedContext"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = v22;
    if (v22)
      v24 = objc_msgSend(v22, "BOOLValue");
    else
      v24 = 1;
    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v42, "absoluteString");
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = (void *)v25;
      v27 = CFSTR("shared ");
      if (!(_DWORD)v24)
        v27 = &stru_1E6B1C190;
      *(_DWORD *)buf = 138412546;
      v45 = (void *)v27;
      v46 = 2112;
      *(_QWORD *)v47 = v25;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[CNNModelEspresso] Creating %@context for %@", buf, 0x16u);

    }
    v28 = -[VCPCNNEspressoContext initWithForceCPU:forceNNGraph:shared:]([VCPCNNEspressoContext alloc], "initWithForceCPU:forceNNGraph:shared:", v17, v21, v24);
    context = v13->_context;
    v13->_context = v28;

    v30 = v13->_context;
    if (!v30)
      goto LABEL_29;
    -[VCPCNNEspressoContext espressoContext](v30, "espressoContext");
    default_storage_type = espresso_get_default_storage_type();
    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      v32 = "";
      *(_DWORD *)buf = 136315906;
      if ((_DWORD)v24)
        v32 = "shared ";
      v45 = (void *)v32;
      v46 = 1024;
      *(_DWORD *)v47 = v17;
      *(_WORD *)&v47[4] = 1024;
      *(_DWORD *)&v47[6] = v21;
      v48 = 1024;
      v49 = default_storage_type;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[CNNModelEspresso] Created %scontext (CPU:%d, MPSGraph:%d)), storage type %d", buf, 0x1Eu);
    }
    -[VCPCNNEspressoContext espressoContext](v13->_context, "espressoContext");
    v13->_plan = (void *)espresso_create_plan();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("planPriority"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v33 == 0;

    if (!v34)
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("planPriority"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "intValue");

      espresso_plan_set_priority();
    }
    if (v13->_plan)
    {
      -[NSURL path](v13->_netFileUrl, "path");
      v36 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v36, "UTF8String");
      v37 = espresso_plan_add_network();

      if (v37)
        v18 = 0;
      else
        v18 = v13;
    }
    else
    {
LABEL_29:
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }
  v38 = v18;

  return v38;
}

- (int)prepareModelWithConfig:(id)a3
{
  id v4;
  int v5;
  int v6;
  int v7;
  id v8;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;

  v4 = a3;
  v5 = -[NSArray count](self->_inputNames, "count");
  v6 = -[NSArray count](self->_outputNames, "count");
  if (-[VCPCNNModelEspresso getPlanPhase](self, "getPlanPhase") == 2)
  {
    v7 = -18;
    goto LABEL_16;
  }
  if (-[VCPCNNModelEspresso getPlanPhase](self, "getPlanPhase") == 1
    && -[NSString isEqualToString:](self->_resConfig, "isEqualToString:", v4))
  {
LABEL_5:
    v7 = 0;
    goto LABEL_16;
  }
  if (-[VCPCNNModelEspresso getPlanPhase](self, "getPlanPhase") || (v7 = espresso_plan_build()) == 0)
  {
    if (!-[NSString isEqualToString:](self->_resConfig, "isEqualToString:", v4))
    {
      v7 = espresso_plan_build_clean();
      if (v7)
        goto LABEL_16;
      v8 = objc_retainAutorelease(v4);
      objc_msgSend(v8, "UTF8String");
      v7 = espresso_network_select_configuration();
      if (v7)
        goto LABEL_16;
      v7 = espresso_plan_build();
      if (v7)
        goto LABEL_16;
      objc_storeStrong((id *)&self->_resConfig, v8);
    }
    if (v5 > 1)
    {
      std::vector<espresso_buffer_t>::resize((uint64_t)&self->_inputBlobs, v5);
      v10 = 0;
      while (1)
      {
        -[NSArray objectAtIndexedSubscript:](self->_inputNames, "objectAtIndexedSubscript:", v10);
        v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v11, "UTF8String");
        v7 = espresso_network_bind_buffer();

        if (v7)
          break;
        if (++v10 == v5)
          goto LABEL_20;
      }
    }
    else
    {
      v7 = espresso_network_bind_buffer();
      if (v7)
        goto LABEL_16;
LABEL_20:
      if (v6 <= 1)
      {
        if (v6 == 1)
        {
          -[NSArray objectAtIndexedSubscript:](self->_outputNames, "objectAtIndexedSubscript:", 0);
          v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          objc_msgSend(v12, "UTF8String");
          v7 = espresso_network_bind_buffer();

          if (v7)
            goto LABEL_16;
        }
        else
        {
          v7 = espresso_network_bind_buffer();
          if (v7)
            goto LABEL_16;
        }
        goto LABEL_5;
      }
      std::vector<espresso_buffer_t>::resize((uint64_t)&self->_outputBlobs, v6);
      v13 = 0;
      while (1)
      {
        -[NSArray objectAtIndexedSubscript:](self->_outputNames, "objectAtIndexedSubscript:", v13);
        v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v14, "UTF8String");
        v7 = espresso_network_bind_buffer();

        if (v7)
          break;
        if (++v13 == v6)
          goto LABEL_5;
      }
    }
  }
LABEL_16:

  return v7;
}

- (int)prepareModelInput:(float *)a3
{
  if (!a3)
    return -18;
  memcpy(self->_inputBlob.data, a3, SLODWORD(self->_inputBlob.batch_number)* (uint64_t)SLODWORD(self->_inputBlob.sequence_length)* 4* (int)self->_inputBlob.channels* LODWORD(self->_inputBlob.height)* LODWORD(self->_inputBlob.width));
  return 0;
}

- (int)prepareModelInputs:(vector<float *)
{
  NSUInteger v5;
  uint64_t v6;
  unint64_t v7;
  float *v8;
  int64x2_t *v9;
  int64x2_t v10;

  v5 = -[NSArray count](self->_inputNames, "count");
  if (v5)
  {
    v6 = 0;
    v7 = 0;
    while (1)
    {
      v8 = a3->__begin_[v7];
      if (!v8)
        break;
      v9 = (int64x2_t *)((char *)self->_inputBlobs.__begin_ + v6);
      v10 = vshlq_s64(vshlq_n_s64(v9[6], 0x20uLL), (int64x2_t)xmmword_1B6FBCE10);
      memcpy((void *)v9->i64[0], v8, v10.i64[1] * v9[7].i32[0] * v10.i64[0] * v9[5].i32[0] * v9[5].i32[2]);
      ++v7;
      v6 += 168;
      if (-[NSArray count](self->_inputNames, "count") <= v7)
      {
        LODWORD(v5) = 0;
        return v5;
      }
    }
    LODWORD(v5) = -18;
  }
  return v5;
}

- (int)espressoForward:(float *)a3
{
  int result;

  result = -[VCPCNNModelEspresso prepareModelInput:](self, "prepareModelInput:", a3);
  if (!result)
    return espresso_plan_execute_sync();
  return result;
}

- (int)espressoForwardInputs:(vector<float *)
{
  int v4;
  void *__p;
  void *v7;
  uint64_t v8;

  __p = 0;
  v7 = 0;
  v8 = 0;
  std::vector<float *>::__init_with_size[abi:ne180100]<float **,float **>(&__p, a3->__begin_, (uint64_t)a3->__end_, a3->__end_ - a3->__begin_);
  v4 = -[VCPCNNModelEspresso prepareModelInputs:](self, "prepareModelInputs:", &__p);
  if (__p)
  {
    v7 = __p;
    operator delete(__p);
  }
  if (!v4)
    return espresso_plan_execute_sync();
  return v4;
}

- (void)normalization:(float *)a3
{
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  int v9;
  void *v10;
  uint64_t v11;
  float v12;
  uint64_t v13;
  float *v14;
  float v15;
  float v16;
  float v17;
  float v18;
  id v19;

  v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", self->_inputBlob.channels);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObject:", v5);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", self->_inputBlob.height);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObject:", v6);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", self->_inputBlob.width);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObject:", v7);

  v8 = 0;
  v9 = 1;
  while (objc_msgSend(v19, "count") > v8)
  {
    objc_msgSend(v19, "objectAtIndexedSubscript:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 *= objc_msgSend(v10, "intValue");

    ++v8;
  }
  v11 = v9;
  if (v9 < 1)
  {
    v15 = 0.0;
    v12 = 0.0;
  }
  else
  {
    v12 = 0.0;
    v13 = v9;
    v14 = a3;
    v15 = 0.0;
    do
    {
      v16 = *v14++;
      v15 = v15 + v16;
      v12 = v12 + (float)(v16 * v16);
      --v13;
    }
    while (v13);
  }
  if (v9 >= 1)
  {
    v17 = v15 / (float)v9;
    v18 = fmaxf(sqrtf((float)(v12 / (float)v9) - (float)(v17 * v17)), 0.00000011921);
    do
    {
      *a3 = (float)(*a3 - v17) / v18;
      ++a3;
      --v11;
    }
    while (v11);
  }

}

- (int)softmax
{
  uint64_t channels_low;
  float *data;
  float v4;
  uint64_t v5;
  float *v6;
  float v7;
  float v8;
  float v9;
  uint64_t v10;
  float *v11;
  float v12;

  if (self->_outputBlob.width * self->_outputBlob.height != 1)
    return -18;
  channels_low = LODWORD(self->_outputBlob.channels);
  if ((int)channels_low >= 1)
  {
    data = (float *)self->_outputBlob.data;
    v4 = -1.0e10;
    v5 = LODWORD(self->_outputBlob.channels);
    v6 = data;
    do
    {
      v7 = *v6++;
      v8 = v7;
      if (v7 > v4)
        v4 = v8;
      --v5;
    }
    while (v5);
    v9 = 0.0;
    v10 = LODWORD(self->_outputBlob.channels);
    v11 = (float *)self->_outputBlob.data;
    do
    {
      v12 = expf(*v11 - v4);
      *v11++ = v12;
      v9 = v9 + v12;
      --v10;
    }
    while (v10);
    do
    {
      *data = *data / v9;
      ++data;
      --channels_low;
    }
    while (channels_low);
  }
  return 0;
}

- (void)getEspressoContext
{
  return -[VCPCNNEspressoContext espressoContext](self->_context, "espressoContext");
}

- (int)getPlanPhase
{
  return espresso_plan_get_phase();
}

- (void)dealloc
{
  objc_super v3;

  if (self->_plan)
    espresso_plan_destroy();
  v3.receiver = self;
  v3.super_class = (Class)VCPCNNModelEspresso;
  -[VCPCNNModelEspresso dealloc](&v3, sel_dealloc);
}

- (vector<espresso_buffer_t,)inputBlobs
{
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  return (vector<espresso_buffer_t, std::allocator<espresso_buffer_t>> *)std::vector<espresso_buffer_t>::__init_with_size[abi:ne180100]<espresso_buffer_t*,espresso_buffer_t*>(retstr, self->_inputBlobs.__begin_, (uint64_t)self->_inputBlobs.__end_, 0xCF3CF3CF3CF3CF3DLL* ((self->_inputBlobs.__end_- self->_inputBlobs.__begin_) >> 3));
}

- (void)setInputBlobs:()vector<espresso_buffer_t
{
  char *p_inputBlobs;

  p_inputBlobs = (char *)&self->_inputBlobs;
  if (p_inputBlobs != (char *)a3)
    std::vector<espresso_buffer_t>::__assign_with_size[abi:ne180100]<espresso_buffer_t*,espresso_buffer_t*>(p_inputBlobs, (char *)a3->__begin_, (uint64_t)a3->__end_, 0xCF3CF3CF3CF3CF3DLL * ((a3->__end_ - a3->__begin_) >> 3));
}

- (vector<espresso_buffer_t,)outputBlobs
{
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  return (vector<espresso_buffer_t, std::allocator<espresso_buffer_t>> *)std::vector<espresso_buffer_t>::__init_with_size[abi:ne180100]<espresso_buffer_t*,espresso_buffer_t*>(retstr, self->_outputBlobs.__begin_, (uint64_t)self->_outputBlobs.__end_, 0xCF3CF3CF3CF3CF3DLL* ((self->_outputBlobs.__end_- self->_outputBlobs.__begin_) >> 3));
}

- (void)setOutputBlobs:()vector<espresso_buffer_t
{
  char *p_outputBlobs;

  p_outputBlobs = (char *)&self->_outputBlobs;
  if (p_outputBlobs != (char *)a3)
    std::vector<espresso_buffer_t>::__assign_with_size[abi:ne180100]<espresso_buffer_t*,espresso_buffer_t*>(p_outputBlobs, (char *)a3->__begin_, (uint64_t)a3->__end_, 0xCF3CF3CF3CF3CF3DLL * ((a3->__end_ - a3->__begin_) >> 3));
}

- ($FD4688982923A924290ECB669CAF1EC2)inputBlob
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  v3 = *(_OWORD *)&self[1].var3[2];
  v4 = *(_OWORD *)&self[1].var4;
  *(_QWORD *)&retstr->var14 = self[1].var8;
  v5 = *(_OWORD *)&self[1].var0;
  v6 = *(_OWORD *)&self[1].var2[2];
  *(_OWORD *)&retstr->var3[2] = *(_OWORD *)self[1].var2;
  *(_OWORD *)&retstr->var4 = v6;
  *(_OWORD *)&retstr->var6 = *(_OWORD *)self[1].var3;
  *(_OWORD *)&retstr->var8 = v3;
  v7 = *(_OWORD *)&self->var11;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var9;
  *(_OWORD *)retstr->var2 = v7;
  *(_OWORD *)&retstr->var2[2] = *(_OWORD *)&self->var13;
  *(_OWORD *)retstr->var3 = v5;
  v8 = *(_OWORD *)&self[1].var6;
  *(_OWORD *)&retstr->var10 = v4;
  *(_OWORD *)&retstr->var12 = v8;
  return self;
}

- (void)setInputBlob:(id *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v3 = *(_OWORD *)&a3->var0;
  v4 = *(_OWORD *)a3->var2;
  *(_OWORD *)&self->_inputBlob.dim[2] = *(_OWORD *)&a3->var2[2];
  *(_OWORD *)self->_inputBlob.dim = v4;
  *(_OWORD *)&self->_inputBlob.data = v3;
  v5 = *(_OWORD *)a3->var3;
  v6 = *(_OWORD *)&a3->var3[2];
  v7 = *(_OWORD *)&a3->var4;
  *(_OWORD *)&self->_inputBlob.channels = *(_OWORD *)&a3->var6;
  *(_OWORD *)&self->_inputBlob.width = v7;
  *(_OWORD *)&self->_inputBlob.stride[2] = v6;
  *(_OWORD *)self->_inputBlob.stride = v5;
  v8 = *(_OWORD *)&a3->var8;
  v9 = *(_OWORD *)&a3->var10;
  v10 = *(_OWORD *)&a3->var12;
  *(_QWORD *)&self->_inputBlob.storage_type = *(_QWORD *)&a3->var14;
  *(_OWORD *)&self->_inputBlob.stride_batch_number = v10;
  *(_OWORD *)&self->_inputBlob.stride_height = v9;
  *(_OWORD *)&self->_inputBlob.sequence_length = v8;
}

- ($FD4688982923A924290ECB669CAF1EC2)outputBlob
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  v3 = *(_OWORD *)&self[2].var6;
  *(_OWORD *)&retstr->var10 = *(_OWORD *)&self[2].var4;
  *(_OWORD *)&retstr->var12 = v3;
  *(_QWORD *)&retstr->var14 = self[2].var8;
  v4 = *(_OWORD *)&self[2].var2[2];
  *(_OWORD *)&retstr->var3[2] = *(_OWORD *)self[2].var2;
  *(_OWORD *)&retstr->var4 = v4;
  v5 = *(_OWORD *)&self[2].var3[2];
  *(_OWORD *)&retstr->var6 = *(_OWORD *)self[2].var3;
  *(_OWORD *)&retstr->var8 = v5;
  v6 = *(_OWORD *)&self[1].var11;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[1].var9;
  *(_OWORD *)retstr->var2 = v6;
  v7 = *(_OWORD *)&self[2].var0;
  *(_OWORD *)&retstr->var2[2] = *(_OWORD *)&self[1].var13;
  *(_OWORD *)retstr->var3 = v7;
  return self;
}

- (void)setOutputBlob:(id *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v3 = *(_OWORD *)&a3->var0;
  v4 = *(_OWORD *)&a3->var2[2];
  *(_OWORD *)self->_outputBlob.dim = *(_OWORD *)a3->var2;
  *(_OWORD *)&self->_outputBlob.dim[2] = v4;
  *(_OWORD *)&self->_outputBlob.data = v3;
  v5 = *(_OWORD *)a3->var3;
  v6 = *(_OWORD *)&a3->var3[2];
  v7 = *(_OWORD *)&a3->var6;
  *(_OWORD *)&self->_outputBlob.width = *(_OWORD *)&a3->var4;
  *(_OWORD *)&self->_outputBlob.channels = v7;
  *(_OWORD *)self->_outputBlob.stride = v5;
  *(_OWORD *)&self->_outputBlob.stride[2] = v6;
  v8 = *(_OWORD *)&a3->var8;
  v9 = *(_OWORD *)&a3->var10;
  v10 = *(_OWORD *)&a3->var12;
  *(_QWORD *)&self->_outputBlob.storage_type = *(_QWORD *)&a3->var14;
  *(_OWORD *)&self->_outputBlob.stride_height = v9;
  *(_OWORD *)&self->_outputBlob.stride_batch_number = v10;
  *(_OWORD *)&self->_outputBlob.sequence_length = v8;
}

- (NSString)resConfig
{
  return self->_resConfig;
}

- (void).cxx_destruct
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v4;

  begin = self->_outputBlobs.__begin_;
  if (begin)
  {
    self->_outputBlobs.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_inputBlobs.__begin_;
  if (v4)
  {
    self->_inputBlobs.__end_ = v4;
    operator delete(v4);
  }
  objc_storeStrong((id *)&self->_resConfig, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_outputNames, 0);
  objc_storeStrong((id *)&self->_inputNames, 0);
  objc_storeStrong((id *)&self->_netFileUrl, 0);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 104) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  return self;
}

@end
