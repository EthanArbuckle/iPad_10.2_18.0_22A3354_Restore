@implementation ZN8Espresso10BNNSEngine20deconvolution

void *___ZN8Espresso10BNNSEngine20deconvolution_kernel18create_bnns_filterERKNS_20convolution_uniformsERKNSt3__110shared_ptrINS_4blobIfLi4EEEEESB_SB_RKNS6_INS7_IfLi1EEEEERKNS_16padding_params_t4lrtbERNS5_6vectorIPvNS5_9allocatorISL_EEEEbm_block_invoke(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _OWORD *a7, __int128 *a8, __int128 *a9, __int128 *a10)
{
  uint64_t v10;
  uint64_t v11;
  size_t v12;
  int v13;
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
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint32_t v45;
  size_t v46;
  size_t v47;
  int *v48;
  int v49;
  BNNSActivationFunction v50;
  unsigned __int8 v51;
  NSObject *v52;
  void *result;
  BNNSLayerParametersConvolution v54;
  BNNSFilterParameters filter_params;
  uint8_t buf[4];
  uint32_t flags;
  __int16 v58;
  size_t n_threads;
  uint64_t v60;

  v10 = a1;
  v60 = *MEMORY[0x1E0C80C00];
  v12 = *(_QWORD *)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 40);
  v13 = *(_DWORD *)(v11 + 144);
  memset(&v54.activation.beta, 0, 128);
  v14 = a8[9];
  *(_OWORD *)&v54.i_desc.stride[7] = a8[8];
  *(_OWORD *)&v54.i_desc.data_type = v14;
  v15 = a8[10];
  v16 = a8[5];
  *(_OWORD *)&v54.i_desc.size[7] = a8[4];
  *(_OWORD *)&v54.i_desc.stride[1] = v16;
  v17 = a8[7];
  v18 = *a8;
  v19 = a8[1];
  v21 = a8[2];
  v20 = a8[3];
  *(_OWORD *)&v54.i_desc.stride[3] = a8[6];
  *(_OWORD *)&v54.i_desc.stride[5] = v17;
  *(_OWORD *)&v54.i_desc.flags = v18;
  *(_OWORD *)&v54.i_desc.size[1] = v19;
  *(_OWORD *)&v54.i_desc.size[3] = v21;
  *(_OWORD *)&v54.i_desc.size[5] = v20;
  v22 = a7[9];
  *(_OWORD *)&v54.o_desc.stride[7] = a7[8];
  *(_OWORD *)&v54.o_desc.data_type = v22;
  v23 = a7[5];
  *(_OWORD *)&v54.o_desc.size[7] = a7[4];
  *(_OWORD *)&v54.o_desc.stride[1] = v23;
  v24 = a7[7];
  *(_OWORD *)&v54.o_desc.stride[3] = a7[6];
  *(_OWORD *)&v54.o_desc.stride[5] = v24;
  v25 = a7[1];
  *(_OWORD *)&v54.o_desc.flags = *a7;
  *(_OWORD *)&v54.o_desc.size[1] = v25;
  v26 = a7[3];
  *(_OWORD *)&v54.o_desc.size[3] = a7[2];
  *(_OWORD *)&v54.o_desc.size[5] = v26;
  v27 = a9[8];
  v28 = a9[9];
  v29 = a9[6];
  *(_OWORD *)&v54.w_desc.stride[5] = a9[7];
  *(_OWORD *)&v54.w_desc.stride[7] = v27;
  v30 = a9[10];
  *(_OWORD *)&v54.w_desc.data_type = v28;
  *(_OWORD *)&v54.w_desc.table_data_type = v30;
  v31 = a9[4];
  v32 = a9[5];
  v33 = a9[2];
  *(_OWORD *)&v54.w_desc.size[5] = a9[3];
  *(_OWORD *)&v54.w_desc.size[7] = v31;
  *(_OWORD *)&v54.w_desc.stride[1] = v32;
  *(_OWORD *)&v54.w_desc.stride[3] = v29;
  v34 = *a9;
  v35 = a9[1];
  *(_OWORD *)&v54.i_desc.table_data_type = v15;
  *(_OWORD *)&v54.w_desc.flags = v34;
  *(_OWORD *)&v54.w_desc.size[1] = v35;
  *(_OWORD *)&v54.w_desc.size[3] = v33;
  v36 = a10[4];
  v37 = a10[6];
  v38 = a10[7];
  *(_OWORD *)&v54.bias.stride[1] = a10[5];
  *(_OWORD *)&v54.bias.stride[3] = v37;
  v39 = a10[2];
  *(_OWORD *)&v54.bias.size[5] = a10[3];
  *(_OWORD *)&v54.bias.size[7] = v36;
  v40 = a10[10];
  v41 = a10[8];
  *(_OWORD *)&v54.bias.data_type = a10[9];
  *(_OWORD *)&v54.bias.table_data_type = v40;
  v42 = a7[10];
  *(_OWORD *)&v54.bias.stride[5] = v38;
  *(_OWORD *)&v54.bias.stride[7] = v41;
  v43 = *a10;
  v44 = a10[1];
  *(_OWORD *)&v54.o_desc.table_data_type = v42;
  *(_OWORD *)&v54.bias.flags = v43;
  filter_params.alloc_memory = (BNNSAlloc)bnns_alloc_capmem;
  filter_params.free_memory = (BNNSFree)MEMORY[0x1E0C834A8];
  *(_QWORD *)&filter_params.flags = 1;
  filter_params.n_threads = v12;
  if (v13)
    v45 = 3145729;
  else
    v45 = 1;
  filter_params.flags = v45;
  *(_OWORD *)&v54.bias.size[1] = v44;
  *(_OWORD *)&v54.bias.size[3] = v39;
  v54.x_stride = *(__int16 *)(v11 + 92);
  v54.y_stride = *(__int16 *)(v11 + 94);
  v54.x_dilation_stride = *(__int16 *)(v11 + 96);
  v54.y_dilation_stride = *(__int16 *)(v11 + 98);
  if (*(_BYTE *)(a1 + 64))
  {
    v46 = 0;
    v47 = 0;
  }
  else
  {
    v48 = *(int **)(a1 + 48);
    v46 = *v48;
    v47 = v48[2];
  }
  v54.x_padding = v46;
  v54.y_padding = v47;
  *(_QWORD *)&v54.activation.function = 0x3F80000000000000;
  if (!*(_DWORD *)(v11 + 112))
  {
    v49 = *(_DWORD *)(v11 + 24);
    if (v49 == 2)
    {
      *(_QWORD *)&v54.activation.function = 0x3E80000000000002;
    }
    else
    {
      if (v49 == 1)
      {
        v50 = BNNSActivationFunctionRectifiedLinear;
LABEL_14:
        v54.activation.function = v50;
        goto LABEL_15;
      }
      if (*(_DWORD *)(v11 + 28))
      {
        v50 = BNNSActivationFunctionTanh;
        goto LABEL_14;
      }
      a2 = (const char *)*(unsigned int *)(v11 + 60);
      if ((_DWORD)a2 != -1)
        a1 = Espresso::BNNSEngine::set_bnns_activation((uint64_t)&v54.activation, a2, *(double *)(v11 + 64));
    }
  }
LABEL_15:
  v51 = atomic_load((unsigned __int8 *)&_ZGVZZN8Espresso10BNNSEngine20deconvolution_kernel18create_bnns_filterERKNS_20convolution_uniformsERKNSt3__110shared_ptrINS_4blobIfLi4EEEEESB_SB_RKNS6_INS7_IfLi1EEEEERKNS_16padding_params_t4lrtbERNS5_6vectorIPvNS5_9allocatorISL_EEEEbmEUb_E13log_requested);
  if ((v51 & 1) == 0)
  {
    a1 = __cxa_guard_acquire(&_ZGVZZN8Espresso10BNNSEngine20deconvolution_kernel18create_bnns_filterERKNS_20convolution_uniformsERKNSt3__110shared_ptrINS_4blobIfLi4EEEEESB_SB_RKNS6_INS7_IfLi1EEEEERKNS_16padding_params_t4lrtbERNS5_6vectorIPvNS5_9allocatorISL_EEEEbmEUb_E13log_requested);
    if ((_DWORD)a1)
    {
      if (Espresso::is_espresso_os_log_requested(Espresso::espresso_os_log_flag)::onceToken != -1)
        dispatch_once(&Espresso::is_espresso_os_log_requested(Espresso::espresso_os_log_flag)::onceToken, &__block_literal_global_49_4727);
      _ZZZN8Espresso10BNNSEngine20deconvolution_kernel18create_bnns_filterERKNS_20convolution_uniformsERKNSt3__110shared_ptrINS_4blobIfLi4EEEEESB_SB_RKNS6_INS7_IfLi1EEEEERKNS_16padding_params_t4lrtbERNS5_6vectorIPvNS5_9allocatorISL_EEEEbmEUb_E13log_requested = Espresso::is_espresso_os_log_requested(Espresso::espresso_os_log_flag)::logs_requested[0];
      __cxa_guard_release(&_ZGVZZN8Espresso10BNNSEngine20deconvolution_kernel18create_bnns_filterERKNS_20convolution_uniformsERKNSt3__110shared_ptrINS_4blobIfLi4EEEEESB_SB_RKNS6_INS7_IfLi1EEEEERKNS_16padding_params_t4lrtbERNS5_6vectorIPvNS5_9allocatorISL_EEEEbmEUb_E13log_requested);
    }
  }
  if (_ZZZN8Espresso10BNNSEngine20deconvolution_kernel18create_bnns_filterERKNS_20convolution_uniformsERKNSt3__110shared_ptrINS_4blobIfLi4EEEEESB_SB_RKNS6_INS7_IfLi1EEEEERKNS_16padding_params_t4lrtbERNS5_6vectorIPvNS5_9allocatorISL_EEEEbmEUb_E13log_requested)
  {
    Espresso::espresso_os_log_subsystem((Espresso *)a1, a2);
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109376;
      flags = filter_params.flags;
      v58 = 2048;
      n_threads = filter_params.n_threads;
      _os_log_debug_impl(&dword_190DAF000, v52, OS_LOG_TYPE_DEBUG, "BNNSFilterCreateLayerTransposedConvolution: flags=%d, n_threads=%zu", buf, 0x12u);
    }

  }
  result = BNNSFilterCreateLayerTransposedConvolution(&v54, &filter_params);
  ***(_QWORD ***)(v10 + 56) = result;
  if (!result)
    Espresso::throw_exception_selector<Espresso::generic_error>("Failed to create BNNS Filter for Deconvolution Layer");
  return result;
}

@end
