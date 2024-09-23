@implementation EspressoPass_complete_fixpoint_optimization

- (BOOL)runOnNetwork:(void *)a3
{
  uint64_t *v4;
  const char *v5;
  NSObject *v6;
  Espresso::zephyr::function_t *v7;
  uint64_t v8;
  char v9;
  uint64_t *v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  Espresso::zephyr::node_t *v15;
  uint64_t v16;
  uint64_t v17;
  Espresso::zephyr::function_t *v18;
  Espresso::zephyr::function_t *v19;
  Espresso::zephyr::function_t *v20;
  Espresso::zephyr::function_t *v21;
  Espresso::zephyr::function_t *v22;
  Espresso::zephyr::function_t *v23;
  Espresso::zephyr::function_t *v24;
  uint64_t *v25;
  char v26;
  uint64_t v27;
  char matched;
  uint8_t *v29;
  uint64_t v30;
  Espresso::zephyr::function_t *v31;
  uint64_t *v32;
  char v33;
  uint64_t v34;
  char v35;
  uint8_t *v36;
  uint64_t v37;
  uint64_t (***v38)();
  uint64_t v39;
  Espresso::zephyr::function_t *v40;
  Espresso::zephyr::function_t *v41;
  Espresso::zephyr::function_t *v42;
  uint64_t *v43;
  uint64_t v44;
  uint8_t *v45;
  uint64_t v46;
  Espresso::zephyr::function_t *v47;
  Espresso::zephyr::function_t *v48;
  char v49;
  uint8_t *v50;
  uint64_t v51;
  Espresso::zephyr::function_t *v52;
  Espresso::zephyr::function_t *v53;
  Espresso::zephyr::function_t *v54;
  uint64_t *v55;
  char v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  uint8_t *v60;
  uint64_t v61;
  uint64_t (***v62)();
  uint64_t v63;
  Espresso::zephyr::function_t *v64;
  Espresso::zephyr::function_t *v65;
  Espresso::zephyr::function_t *v66;
  Espresso::zephyr::function_t *v67;
  Espresso::zephyr::function_t *v68;
  Espresso::zephyr::function_t *v69;
  Espresso::zephyr::function_t *v70;
  Espresso::zephyr::function_t *v71;
  Espresso::zephyr::function_t *v72;
  Espresso::zephyr::function_t *v73;
  Espresso::zephyr::function_t *v74;
  Espresso::zephyr::function_t *v75;
  Espresso::zephyr::function_t *v76;
  Espresso::zephyr::function_t *v77;
  Espresso::zephyr::function_t *v78;
  char v79;
  Espresso::zephyr::function_t *v80;
  char v81;
  Espresso::zephyr::function_t *v82;
  char v83;
  Espresso::zephyr::function_t *v84;
  char v85;
  Espresso::zephyr::function_t *v86;
  char v87;
  Espresso::net *v89;
  char v90;
  char v91;
  char v92;
  char v93;
  char v94;
  char v95;
  char v96;
  char v97;
  char v98;
  char v99;
  char v100;
  char v101;
  char v102;
  char v103;
  char v104;
  char v105;
  char v106;
  char v107;
  char v108;
  char v109;
  char v110;
  char v111;
  char v112;
  char v113;
  char v114;
  char v115;
  char v116;
  char v117;
  char v118;
  char v119;
  char v120;
  char v121;
  uint64_t v122;
  __int128 *v123[8];
  uint64_t v124;
  uint64_t *v125;
  uint64_t v126;
  std::string *v127;
  std::string *v128;
  std::string *v129;
  std::string **v130;
  char v131;
  uint64_t (**v132)();
  _QWORD *v133;
  uint64_t (***v134)();
  uint8_t buf[24];
  _QWORD v136[3];
  __int128 v137;

  *(_QWORD *)&v137 = *MEMORY[0x1E0C80C00];
  v126 = 0;
  v4 = Espresso::zephyr::es_function_t::es_function_t((Espresso::zephyr::es_function_t *)v123, (Espresso::zephyr::context_t *)&v126, (const Espresso::net *)a3);
  Espresso::espresso_os_log_subsystem((Espresso *)v4, v5);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190DAF000, v6, OS_LOG_TYPE_INFO, "zephyr_passes::complete_fixpoint_optimization\n", buf, 2u);
  }

  v89 = (Espresso::net *)a3;
  v8 = 0;
  v9 = 0;
  do
  {
    v10 = v125;
    if (v125 == &v124)
    {
      v11 = 0;
    }
    else
    {
      v11 = 0;
      do
      {
        v12 = v10[2];
        v13 = v12 + 112;
        for (i = *(_QWORD *)(v12 + 120); i != v13; i = *(_QWORD *)(i + 8))
        {
          v15 = *(Espresso::zephyr::node_t **)(i + 16);
          if (Espresso::zephyr::cast_kernel<Espresso::generic_load_constant_kernel>((uint64_t)v15))
          {
            v16 = *((_QWORD *)v15 + 15);
            v17 = *((_QWORD *)v15 + 16);
            if (v16 != v17)
            {
              do
              {
                Espresso::zephyr::node_t::erase_input_at(v15, ((v17 - v16) >> 3) - 1);
                v16 = *((_QWORD *)v15 + 15);
                v17 = *((_QWORD *)v15 + 16);
              }
              while (v16 != v17);
              v11 = 1;
            }
          }
        }
        v10 = (uint64_t *)v10[1];
      }
      while (v10 != &v124);
    }
    v121 = v9;
    v122 = v8;
    v120 = Espresso::zephyr_passes::fold_constants((Espresso::zephyr_passes *)v123, v7);
    v119 = Espresso::zephyr_passes::remove_nhwc_nchw_transposes((Espresso::zephyr_passes *)v123, v18);
    v118 = Espresso::zephyr_passes::remove_seqw_wseq_transposes((Espresso::zephyr_passes *)v123, v19);
    v117 = Espresso::zephyr_passes::remove_squeeze_expanddims_1d_ops((Espresso::zephyr_passes *)v123, v20);
    v116 = Espresso::zephyr_passes::remove_reshape_around_rank3_inner_product((Espresso::zephyr_passes *)v123, v21);
    v115 = Espresso::zephyr_passes::remove_reshape_around_rank2_softmax((Espresso::zephyr_passes *)v123, v22);
    v114 = Espresso::zephyr_passes::remove_reshape_chain((Espresso::zephyr_passes *)v123, v23);
    v25 = v125;
    if (v125 != &v124)
    {
      v26 = 0;
      while (1)
      {
        v27 = v25[2];
        *(_QWORD *)buf = &off_1E2DB0DC8;
        *(_QWORD *)&buf[8] = v25 + 2;
        v136[0] = buf;
        matched = Espresso::zephyr::ordered_block_t::match_transform(v27, (uint64_t)buf);
        v29 = (uint8_t *)v136[0];
        if ((uint8_t *)v136[0] == buf)
          break;
        if (v136[0])
        {
          v30 = 5;
LABEL_22:
          (*(void (**)(void))(*(_QWORD *)v29 + 8 * v30))();
        }
        v26 |= matched;
        v25 = (uint64_t *)v25[1];
        if (v25 == &v124)
          goto LABEL_26;
      }
      v29 = buf;
      v30 = 4;
      goto LABEL_22;
    }
    v26 = 0;
LABEL_26:
    v113 = Espresso::zephyr_passes::strength_reduction_remove_identity_transposes((Espresso::zephyr_passes *)v123, v24);
    v32 = v125;
    if (v125 != &v124)
    {
      v33 = 0;
      while (1)
      {
        v34 = v32[2];
        v132 = &off_1E2DB12F0;
        v133 = v32 + 2;
        v134 = &v132;
        std::string::basic_string[abi:ne180100]<0>(buf, "general_padding");
        v127 = 0;
        v128 = 0;
        v129 = 0;
        v130 = &v127;
        v131 = 0;
        v127 = (std::string *)operator new(0x18uLL);
        v128 = v127;
        v129 = v127 + 1;
        v128 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)&v129, (__int128 *)buf, (__int128 *)v136, v127);
        if ((char)buf[23] < 0)
          operator delete(*(void **)buf);
        *(_QWORD *)buf = &off_1E2DB31E0;
        *(_QWORD *)&buf[8] = &v132;
        v136[0] = buf;
        v35 = Espresso::zephyr::match_kernel_chain(v34, (uint64_t *)&v127, buf);
        v36 = (uint8_t *)v136[0];
        if ((uint8_t *)v136[0] == buf)
        {
          v36 = buf;
          v37 = 4;
        }
        else
        {
          if (!v136[0])
            goto LABEL_35;
          v37 = 5;
        }
        (*(void (**)(void))(*(_QWORD *)v36 + 8 * v37))();
LABEL_35:
        v130 = &v127;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v130);
        v38 = v134;
        if (v134 == &v132)
        {
          v38 = &v132;
          v39 = 4;
          goto LABEL_39;
        }
        if (v134)
        {
          v39 = 5;
LABEL_39:
          (*v38)[v39]();
        }
        v33 |= v35;
        v32 = (uint64_t *)v32[1];
        if (v32 == &v124)
          goto LABEL_43;
      }
    }
    v33 = 0;
LABEL_43:
    v112 = Espresso::zephyr_passes::strength_reduction_gather_to_lookup((Espresso::zephyr_passes *)v123, v31);
    v111 = Espresso::zephyr_passes::strength_reduction_batch_matmul_to_inner_product((Espresso::zephyr_passes *)v123, v40);
    v110 = Espresso::zephyr_passes::strength_reduction_transpose_reshape_to_flatten_squeeze((Espresso::zephyr_passes *)v123, v41);
    v43 = v125;
    if (v125 != &v124)
    {
      while (1)
      {
        v44 = v43[2];
        *(_QWORD *)buf = &off_1E2DB1190;
        *(_QWORD *)&buf[8] = v43 + 2;
        v136[0] = buf;
        Espresso::zephyr::ordered_block_t::match_transform(v44, (uint64_t)buf);
        v45 = (uint8_t *)v136[0];
        if ((uint8_t *)v136[0] == buf)
          break;
        if (v136[0])
        {
          v46 = 5;
LABEL_48:
          (*(void (**)(void))(*(_QWORD *)v45 + 8 * v46))();
        }
        v43 = (uint64_t *)v43[1];
        if (v43 == &v124)
          goto LABEL_50;
      }
      v45 = buf;
      v46 = 4;
      goto LABEL_48;
    }
LABEL_50:
    v109 = Espresso::zephyr_passes::strength_reduction_general_slice_to_slice((Espresso::zephyr_passes *)v123, v42);
    v108 = Espresso::zephyr_passes::strength_reduction_gather_to_slice((Espresso::zephyr_passes *)v123, v47);
    *(_QWORD *)buf = &off_1E2DB0A00;
    *(_QWORD *)&buf[8] = v123;
    v136[0] = buf;
    v49 = Espresso::zephyr::function_t::foreach_block((uint64_t)v123, (uint64_t)buf);
    v50 = (uint8_t *)v136[0];
    if ((uint8_t *)v136[0] == buf)
    {
      v50 = buf;
      v51 = 4;
    }
    else
    {
      if (!v136[0])
        goto LABEL_55;
      v51 = 5;
    }
    (*(void (**)(void))(*(_QWORD *)v50 + 8 * v51))();
LABEL_55:
    v107 = v49;
    v106 = Espresso::zephyr_passes::fuse_affine_bias((Espresso::zephyr_passes *)v123, v48);
    Espresso::zephyr_passes::fuse_conv_batchnorm(v123, v52);
    v105 = Espresso::zephyr_passes::fuse_affine_bias((Espresso::zephyr_passes *)v123, v53);
    v55 = v125;
    if (v125 != &v124)
    {
      v56 = 0;
      while (1)
      {
        v57 = v55[2];
        v132 = &off_1E2DB0CC0;
        v133 = v55 + 2;
        v134 = &v132;
        std::string::basic_string[abi:ne180100]<0>(buf, "inner_product");
        std::string::basic_string[abi:ne180100]<0>(v136, "activation");
        v127 = 0;
        v128 = 0;
        v129 = 0;
        v130 = &v127;
        v131 = 0;
        v127 = (std::string *)operator new(0x30uLL);
        v128 = v127;
        v129 = v127 + 2;
        v58 = 0;
        v128 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)&v129, (__int128 *)buf, &v137, v127);
        do
        {
          if (SHIBYTE(v136[v58 + 2]) < 0)
            operator delete(*(void **)&buf[v58 * 8 + 24]);
          v58 -= 3;
        }
        while (v58 != -6);
        *(_QWORD *)buf = &off_1E2DB3188;
        *(_QWORD *)&buf[8] = &v132;
        v136[0] = buf;
        v59 = Espresso::zephyr::match_kernel_chain(v57, (uint64_t *)&v127, buf);
        v60 = (uint8_t *)v136[0];
        if ((uint8_t *)v136[0] == buf)
        {
          v60 = buf;
          v61 = 4;
        }
        else
        {
          if (!v136[0])
            goto LABEL_66;
          v61 = 5;
        }
        (*(void (**)(void))(*(_QWORD *)v60 + 8 * v61))();
LABEL_66:
        v130 = &v127;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v130);
        v62 = v134;
        if (v134 == &v132)
        {
          v62 = &v132;
          v63 = 4;
          goto LABEL_70;
        }
        if (v134)
        {
          v63 = 5;
LABEL_70:
          (*v62)[v63]();
        }
        v56 |= v59;
        v55 = (uint64_t *)v55[1];
        if (v55 == &v124)
          goto LABEL_74;
      }
    }
    v56 = 0;
LABEL_74:
    v104 = Espresso::zephyr_passes::fuse_conv_activation((Espresso::zephyr_passes *)v123, v54);
    v103 = Espresso::zephyr_passes::fuse_transposes((Espresso::zephyr_passes *)v123, v64);
    v102 = Espresso::zephyr_passes::strength_reduction_loadc_eltwise__eltwisec((Espresso::zephyr_passes *)v123, v65);
    v101 = Espresso::zephyr_passes::fuse_transposes((Espresso::zephyr_passes *)v123, v66);
    v100 = Espresso::zephyr_passes::fuse_affine_scale((Espresso::zephyr_passes *)v123, v67);
    v99 = Espresso::zephyr_passes::fuse_affine_bias((Espresso::zephyr_passes *)v123, v68);
    v98 = Espresso::zephyr_passes::fuse_conv_activation((Espresso::zephyr_passes *)v123, v69);
    v97 = Espresso::zephyr_passes::fuse_pad((Espresso::zephyr_passes *)v123, v70);
    v96 = Espresso::zephyr_passes::fuse_fast_gelu_1((Espresso::zephyr_passes *)v123, v71);
    v95 = Espresso::zephyr_passes::merge_tf_normalization((Espresso::zephyr_passes *)v123, v72);
    v94 = Espresso::zephyr_passes::merge_tf_layernorm((Espresso::zephyr_passes *)v123, v73);
    v93 = Espresso::zephyr_passes::merge_pytorch_layernorm((Espresso::zephyr_passes *)v123, v74);
    v92 = Espresso::zephyr_passes::merge_channel_norm((Espresso::zephyr_passes *)v123, v75);
    v91 = Espresso::zephyr_passes::fuse_gelu_with_erf((Espresso::zephyr_passes *)v123, v76);
    v90 = Espresso::zephyr_passes::l2_normalize_5d_to_instancenorm((Espresso::zephyr_passes *)v123, v77);
    v79 = Espresso::zephyr_passes::strength_reduction_reshape_to_flatten((Espresso::zephyr_passes *)v123, v78);
    v81 = Espresso::zephyr_passes::fuse_gru_activation((Espresso::zephyr_passes *)v123, v80);
    v83 = Espresso::zephyr_passes::fuse_broadcastable_transposes((Espresso::zephyr_passes *)v123, v82);
    v85 = Espresso::zephyr_passes::fuse_blizzard_final_1x1_convolutions((Espresso::zephyr_passes *)v123, v84);
    v87 = v121 | v85 | Espresso::zephyr_passes::optimize_coreml_conv1d_lrelu((Espresso::zephyr_passes *)v123, v86) | v11 | v120 | v119 | v118 | v117 | v116 | v115 | v114 | v26 | v113 | v33 | v112 | v111 | v110 | v109 | v108 | v107 | v106 | v105 | v56 | v104 | v103 | v102 | v101 | v100 | v99 | v98 | v97 | v96 | v95 | v94 | v93 | v92 | v91 | v90 | v79 | v81 | v83;
    if ((v87 & 1) == 0)
      break;
    v8 = v122 + 1;
    v9 = 1;
  }
  while (v122 != 4);
  Espresso::zephyr::es_function_t::lower_to_net(v123, v89);
  *((_BYTE *)v89 + 180) = 0;
  Espresso::shape_network_recursive(v89, (Espresso::net *)((char *)v89 + 184), 0, 0);
  Espresso::zephyr::function_t::~function_t((Espresso::zephyr::function_t *)v123);
  return v87 & 1;
}

@end
