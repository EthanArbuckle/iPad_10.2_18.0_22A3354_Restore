@implementation ETModelDefMLP

- (void)buildNetwork
{
  std::__shared_weak_count *v3;
  unint64_t *v4;
  unint64_t v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  int v8;
  uint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  uint64_t v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  std::__shared_weak_count *v28;
  unint64_t *v29;
  unint64_t v30;
  std::__shared_weak_count *v31;
  unint64_t *v32;
  unint64_t v33;
  uint64_t v34;
  std::__shared_weak_count *v35;
  unint64_t *v36;
  unint64_t v37;
  std::__shared_weak_count *v38;
  unint64_t *v39;
  unint64_t v40;
  unint64_t *v41;
  int v42;
  _OWORD *v43;
  void *v44;
  _QWORD *v45;
  _OWORD *v46;
  __int128 v47;
  void *v48;
  _QWORD *v49;
  std::__shared_weak_count *v50;
  unint64_t *v51;
  unint64_t v52;
  std::__shared_weak_count *v53;
  unint64_t *v54;
  unint64_t v55;
  std::__shared_weak_count *v56;
  unint64_t *v57;
  unint64_t v58;
  std::__shared_weak_count *v59;
  unint64_t *v60;
  unint64_t v61;
  std::__shared_weak_count *v62;
  unint64_t *v63;
  unint64_t v64;
  std::__shared_weak_count *v65;
  unint64_t *v66;
  unint64_t v67;
  uint64_t v68;
  std::__shared_weak_count *v69;
  uint64_t v70;
  std::__shared_weak_count *v71;
  uint64_t v72;
  std::__shared_weak_count *v73;
  std::string *v74;
  std::string *v75;
  std::string *v76;
  std::string *v77;
  std::string *v78;
  std::string *v79;
  uint64_t v80;
  std::__shared_weak_count *v81;
  uint64_t v82;
  std::__shared_weak_count *v83;
  std::string *v84;
  std::string *v85;
  std::string *v86;
  std::string *v87;
  std::string *v88;
  std::string *v89;
  uint64_t v90;
  std::__shared_weak_count *v91;
  uint64_t v92;
  std::__shared_weak_count *v93;
  std::string *v94;
  std::string *v95;
  std::string *v96;
  std::string *v97;
  std::string *v98;
  std::string *v99;
  void *__p[2];
  char v101;
  void *v102[2];
  char v103;
  uint64_t v104;
  std::__shared_weak_count *v105;
  __int128 v106;
  _BYTE v107[12];
  uint64_t v108;
  int v109;
  char v110;
  uint64_t v111;
  int v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119[2];
  uint64_t v120[2];
  uint64_t v121;
  std::__shared_weak_count *v122;
  _QWORD *v123[7];
  char v124;
  std::__shared_weak_count *v125;
  std::__shared_weak_count *v126;
  std::__shared_weak_count *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  std::string **v131;
  char v132;
  __int128 v133;
  char v134;
  __int128 v135;
  char v136;
  __int128 v137;

  *(_QWORD *)&v137 = *MEMORY[0x1E0C80C00];
  LODWORD(v121) = 0;
  Espresso::create_context((int *)&v121, &v129);
  (*(void (**)(uint64_t))(*(_QWORD *)v129 + 96))(v129);
  v3 = (std::__shared_weak_count *)v130;
  v120[0] = v129;
  v120[1] = v130;
  if (v130)
  {
    v4 = (unint64_t *)(v130 + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  v119[0] = 0;
  v119[1] = 0;
  Espresso::sequential_builder::sequential_builder((uint64_t)&v121, v120, 0, v119);
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v7 = __ldaxr(p_shared_owners);
    while (__stlxr(v7 - 1, p_shared_owners));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
  v8 = -[ETModelDefMLP hidden_size](self, "hidden_size");
  __asm { FMOV            V8.2S, #1.0 }
  if (v8 < 1)
  {
    v110 = 0;
    v112 = -1;
    v113 = _D8;
    v118 = 0;
    *(_QWORD *)&v107[4] = _D8;
    v114 = 0;
    v108 = 0;
    v111 = 0;
    *(_DWORD *)v107 = 0;
    v109 = 0;
    v115 = 0;
    v117 = 0;
    v116 = 0;
    DWORD1(v106) = -[ETModelDefMLP input_size](self, "input_size");
    LODWORD(v106) = -[ETModelDefMLP output_size](self, "output_size");
    *((_QWORD *)&v106 + 1) = 1;
    std::string::basic_string[abi:ne180100]<0>(v102, "inner_product");
    std::string::basic_string[abi:ne180100]<0>(__p, "ip2");
    std::string::basic_string[abi:ne180100]<0>(&v135, "data");
    v77 = 0;
    v78 = 0;
    v79 = 0;
    *(_QWORD *)&v133 = &v77;
    BYTE8(v133) = 0;
    v77 = (std::string *)operator new(0x18uLL);
    v78 = v77;
    v79 = v77 + 1;
    v78 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)&v79, &v135, &v137, v77);
    std::string::basic_string[abi:ne180100]<0>(&v133, "ip2");
    v74 = 0;
    v75 = 0;
    v76 = 0;
    v131 = &v74;
    v132 = 0;
    v74 = (std::string *)operator new(0x18uLL);
    v75 = v74;
    v76 = v74 + 1;
    v75 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)&v76, &v133, &v135, v74);
    Espresso::sequential_builder::add<Espresso::inner_product_uniforms>(&v104, &v121, (uint64_t)v102, (uint64_t)__p, (uint64_t)&v106, (uint64_t)v77, (uint64_t)v78, (uint64_t *)&v74);
    v131 = &v74;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v131);
    if (v134 < 0)
      operator delete((void *)v133);
    *(_QWORD *)&v133 = &v77;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v133);
    if (v136 < 0)
      operator delete((void *)v135);
    if (v101 < 0)
      operator delete(__p[0]);
    if (v103 < 0)
      operator delete(v102[0]);
    v34 = v104;
    (*(void (**)(uint64_t *__return_ptr, uint64_t))(*(_QWORD *)v104 + 424))(&v72, v104);
    (*(void (**)(uint64_t, uint64_t *))(*(_QWORD *)v34 + 400))(v34, &v72);
    v35 = v73;
    if (v73)
    {
      v36 = (unint64_t *)&v73->__shared_owners_;
      do
        v37 = __ldaxr(v36);
      while (__stlxr(v37 - 1, v36));
      if (!v37)
      {
        ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
        std::__shared_weak_count::__release_weak(v35);
      }
    }
    (*(void (**)(uint64_t *__return_ptr, uint64_t))(*(_QWORD *)v34 + 432))(&v70, v34);
    (*(void (**)(uint64_t, uint64_t *))(*(_QWORD *)v34 + 392))(v34, &v70);
    v38 = v71;
    if (v71)
    {
      v39 = (unint64_t *)&v71->__shared_owners_;
      do
        v40 = __ldaxr(v39);
      while (__stlxr(v40 - 1, v39));
      if (!v40)
      {
        ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
        std::__shared_weak_count::__release_weak(v38);
      }
    }
    v31 = v105;
    if (v105)
    {
      v41 = (unint64_t *)&v105->__shared_owners_;
      do
        v33 = __ldaxr(v41);
      while (__stlxr(v33 - 1, v41));
LABEL_76:
      if (!v33)
      {
        ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
        std::__shared_weak_count::__release_weak(v31);
      }
    }
  }
  else
  {
    v110 = 0;
    v112 = -1;
    v113 = _D8;
    v118 = 0;
    *(_QWORD *)&v107[4] = _D8;
    v114 = 0;
    v108 = 0;
    v111 = 0;
    *(_DWORD *)v107 = 0;
    v109 = 0;
    v115 = 0;
    v117 = 0;
    v116 = 0;
    DWORD1(v106) = -[ETModelDefMLP input_size](self, "input_size");
    LODWORD(v106) = -[ETModelDefMLP hidden_size](self, "hidden_size");
    *((_QWORD *)&v106 + 1) = 0x100000001;
    std::string::basic_string[abi:ne180100]<0>(v102, "inner_product");
    std::string::basic_string[abi:ne180100]<0>(__p, "ip1");
    std::string::basic_string[abi:ne180100]<0>(&v135, "data");
    v97 = 0;
    v98 = 0;
    v99 = 0;
    *(_QWORD *)&v133 = &v97;
    BYTE8(v133) = 0;
    v97 = (std::string *)operator new(0x18uLL);
    v98 = v97;
    v99 = v97 + 1;
    v98 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)&v99, &v135, &v137, v97);
    std::string::basic_string[abi:ne180100]<0>(&v133, "ip1");
    v94 = 0;
    v95 = 0;
    v96 = 0;
    v131 = &v94;
    v132 = 0;
    v94 = (std::string *)operator new(0x18uLL);
    v95 = v94;
    v96 = v94 + 1;
    v95 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)&v96, &v133, &v135, v94);
    Espresso::sequential_builder::add<Espresso::inner_product_uniforms>(&v104, &v121, (uint64_t)v102, (uint64_t)__p, (uint64_t)&v106, (uint64_t)v97, (uint64_t)v98, (uint64_t *)&v94);
    v131 = &v94;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v131);
    if (v134 < 0)
      operator delete((void *)v133);
    *(_QWORD *)&v133 = &v97;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v133);
    if (v136 < 0)
      operator delete((void *)v135);
    if (v101 < 0)
      operator delete(__p[0]);
    if (v103 < 0)
      operator delete(v102[0]);
    v14 = v104;
    (*(void (**)(uint64_t *__return_ptr, uint64_t))(*(_QWORD *)v104 + 424))(&v92, v104);
    (*(void (**)(uint64_t, uint64_t *))(*(_QWORD *)v14 + 400))(v14, &v92);
    v15 = v93;
    if (v93)
    {
      v16 = (unint64_t *)&v93->__shared_owners_;
      do
        v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }
    (*(void (**)(uint64_t *__return_ptr, uint64_t))(*(_QWORD *)v14 + 432))(&v90, v14);
    (*(void (**)(uint64_t, uint64_t *))(*(_QWORD *)v14 + 392))(v14, &v90);
    v18 = v91;
    if (v91)
    {
      v19 = (unint64_t *)&v91->__shared_owners_;
      do
        v20 = __ldaxr(v19);
      while (__stlxr(v20 - 1, v19));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
    }
    v21 = v105;
    if (v105)
    {
      v22 = (unint64_t *)&v105->__shared_owners_;
      do
        v23 = __ldaxr(v22);
      while (__stlxr(v23 - 1, v22));
      if (!v23)
      {
        ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
        std::__shared_weak_count::__release_weak(v21);
      }
    }
    v110 = 0;
    v112 = -1;
    v113 = _D8;
    v118 = 0;
    v106 = xmmword_191A93320;
    *(_QWORD *)&v107[4] = _D8;
    v114 = 0;
    v108 = 0;
    v111 = 0;
    *(_DWORD *)v107 = 0;
    v109 = 0;
    v115 = 0;
    v117 = 0;
    v116 = 0;
    DWORD1(v106) = -[ETModelDefMLP hidden_size](self, "hidden_size");
    LODWORD(v106) = -[ETModelDefMLP output_size](self, "output_size");
    *((_QWORD *)&v106 + 1) = 1;
    std::string::basic_string[abi:ne180100]<0>(v102, "inner_product");
    std::string::basic_string[abi:ne180100]<0>(__p, "ip2");
    std::string::basic_string[abi:ne180100]<0>(&v135, "ip1");
    v87 = 0;
    v88 = 0;
    v89 = 0;
    *(_QWORD *)&v133 = &v87;
    BYTE8(v133) = 0;
    v87 = (std::string *)operator new(0x18uLL);
    v88 = v87;
    v89 = v87 + 1;
    v88 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)&v89, &v135, &v137, v87);
    std::string::basic_string[abi:ne180100]<0>(&v133, "ip2");
    v84 = 0;
    v85 = 0;
    v86 = 0;
    v131 = &v84;
    v132 = 0;
    v84 = (std::string *)operator new(0x18uLL);
    v85 = v84;
    v86 = v84 + 1;
    v85 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)&v86, &v133, &v135, v84);
    Espresso::sequential_builder::add<Espresso::inner_product_uniforms>(&v104, &v121, (uint64_t)v102, (uint64_t)__p, (uint64_t)&v106, (uint64_t)v87, (uint64_t)v88, (uint64_t *)&v84);
    v131 = &v84;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v131);
    if (v134 < 0)
      operator delete((void *)v133);
    *(_QWORD *)&v133 = &v87;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v133);
    if (v136 < 0)
      operator delete((void *)v135);
    if (v101 < 0)
      operator delete(__p[0]);
    if (v103 < 0)
      operator delete(v102[0]);
    v24 = v104;
    (*(void (**)(uint64_t *__return_ptr, uint64_t))(*(_QWORD *)v104 + 424))(&v82, v104);
    (*(void (**)(uint64_t, uint64_t *))(*(_QWORD *)v24 + 400))(v24, &v82);
    v25 = v83;
    if (v83)
    {
      v26 = (unint64_t *)&v83->__shared_owners_;
      do
        v27 = __ldaxr(v26);
      while (__stlxr(v27 - 1, v26));
      if (!v27)
      {
        ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
        std::__shared_weak_count::__release_weak(v25);
      }
    }
    (*(void (**)(uint64_t *__return_ptr, uint64_t))(*(_QWORD *)v24 + 432))(&v80, v24);
    (*(void (**)(uint64_t, uint64_t *))(*(_QWORD *)v24 + 392))(v24, &v80);
    v28 = v81;
    if (v81)
    {
      v29 = (unint64_t *)&v81->__shared_owners_;
      do
        v30 = __ldaxr(v29);
      while (__stlxr(v30 - 1, v29));
      if (!v30)
      {
        ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
        std::__shared_weak_count::__release_weak(v28);
      }
    }
    v31 = v105;
    if (v105)
    {
      v32 = (unint64_t *)&v105->__shared_owners_;
      do
        v33 = __ldaxr(v32);
      while (__stlxr(v33 - 1, v32));
      goto LABEL_76;
    }
  }
  *((_QWORD *)&v106 + 1) = 0;
  *(_QWORD *)v107 = 0;
  *(_QWORD *)&v106 = (char *)&v106 + 8;
  v42 = -[ETModelDefMLP input_size](self, "input_size");
  std::string::basic_string[abi:ne180100]<0>(v102, "data");
  __p[0] = v102;
  v43 = std::__tree<std::__value_type<std::string,Espresso::layer_shape>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::layer_shape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::layer_shape>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)&v106, v102, (_OWORD **)__p);
  v45 = v43 + 6;
  v44 = (void *)*((_QWORD *)v43 + 12);
  *((_QWORD *)v43 + 7) = 0x100000001;
  *((_DWORD *)v43 + 16) = v42;
  *(_QWORD *)((char *)v43 + 68) = 0x100000001;
  *((_DWORD *)v43 + 19) = -1;
  *((_QWORD *)v43 + 10) = 0;
  *((_QWORD *)v43 + 11) = 0;
  if (v44)
  {
    *((_QWORD *)v43 + 13) = v44;
    operator delete(v44);
    *v45 = 0;
    v45[1] = 0;
    v45[2] = 0;
  }
  *v45 = 0;
  v45[1] = 0;
  v45[2] = 0;
  if (v103 < 0)
    operator delete(v102[0]);
  std::string::basic_string[abi:ne180100]<0>(v102, "label");
  __p[0] = v102;
  v46 = std::__tree<std::__value_type<std::string,Espresso::layer_shape>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::layer_shape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::layer_shape>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)&v106, v102, (_OWORD **)__p);
  *(_QWORD *)&v47 = 0x100000001;
  *((_QWORD *)&v47 + 1) = 0x100000001;
  v49 = v46 + 6;
  v48 = (void *)*((_QWORD *)v46 + 12);
  *(_OWORD *)((char *)v46 + 56) = v47;
  *((_QWORD *)v46 + 9) = 0xFFFFFFFF00000001;
  *((_QWORD *)v46 + 10) = 0;
  *((_QWORD *)v46 + 11) = 0;
  if (v48)
  {
    *((_QWORD *)v46 + 13) = v48;
    operator delete(v48);
    *v49 = 0;
    v49[1] = 0;
    v49[2] = 0;
  }
  *v49 = 0;
  v49[1] = 0;
  v49[2] = 0;
  if (v103 < 0)
    operator delete(v102[0]);
  Espresso::sequential_builder::build_from_shapes((uint64_t)&v121, (uint64_t)&v106, &v68);
  -[ETModelDef transformForTraining:](self, "transformForTraining:", &v68);
  v50 = v69;
  if (v69)
  {
    v51 = (unint64_t *)&v69->__shared_owners_;
    do
      v52 = __ldaxr(v51);
    while (__stlxr(v52 - 1, v51));
    if (!v52)
    {
      ((void (*)(std::__shared_weak_count *))v50->__on_zero_shared)(v50);
      std::__shared_weak_count::__release_weak(v50);
    }
  }
  std::__tree<std::__value_type<std::string,Espresso::layer_shape>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::layer_shape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::layer_shape>>>::destroy((uint64_t)&v106, *((char **)&v106 + 1));
  std::deque<std::pair<std::shared_ptr<Espresso::abstract_context>,Espresso::compute_path>>::~deque[abi:ne180100]((uint64_t)&v128);
  v53 = v127;
  if (v127)
  {
    v54 = (unint64_t *)&v127->__shared_owners_;
    do
      v55 = __ldaxr(v54);
    while (__stlxr(v55 - 1, v54));
    if (!v55)
    {
      ((void (*)(std::__shared_weak_count *))v53->__on_zero_shared)(v53);
      std::__shared_weak_count::__release_weak(v53);
    }
  }
  v56 = v126;
  if (v126)
  {
    v57 = (unint64_t *)&v126->__shared_owners_;
    do
      v58 = __ldaxr(v57);
    while (__stlxr(v58 - 1, v57));
    if (!v58)
    {
      ((void (*)(std::__shared_weak_count *))v56->__on_zero_shared)(v56);
      std::__shared_weak_count::__release_weak(v56);
    }
  }
  v59 = v125;
  if (v125)
  {
    v60 = (unint64_t *)&v125->__shared_owners_;
    do
      v61 = __ldaxr(v60);
    while (__stlxr(v61 - 1, v60));
    if (!v61)
    {
      ((void (*)(std::__shared_weak_count *))v59->__on_zero_shared)(v59);
      std::__shared_weak_count::__release_weak(v59);
    }
  }
  if (v124 < 0)
    operator delete(v123[5]);
  std::__tree<std::__value_type<Espresso::AOT::BackendIdentifier,double>,std::__map_value_compare<Espresso::AOT::BackendIdentifier,std::__value_type<Espresso::AOT::BackendIdentifier,double>,std::less<Espresso::AOT::BackendIdentifier>,true>,std::allocator<std::__value_type<Espresso::AOT::BackendIdentifier,double>>>::destroy((uint64_t)v123, v123[1]);
  v62 = v122;
  if (v122)
  {
    v63 = (unint64_t *)&v122->__shared_owners_;
    do
      v64 = __ldaxr(v63);
    while (__stlxr(v64 - 1, v63));
    if (!v64)
    {
      ((void (*)(std::__shared_weak_count *))v62->__on_zero_shared)(v62);
      std::__shared_weak_count::__release_weak(v62);
    }
  }
  v65 = (std::__shared_weak_count *)v130;
  if (v130)
  {
    v66 = (unint64_t *)(v130 + 8);
    do
      v67 = __ldaxr(v66);
    while (__stlxr(v67 - 1, v66));
    if (!v67)
    {
      ((void (*)(std::__shared_weak_count *))v65->__on_zero_shared)(v65);
      std::__shared_weak_count::__release_weak(v65);
    }
  }
}

- (int)input_size
{
  return self->_input_size;
}

- (void)setInput_size:(int)a3
{
  self->_input_size = a3;
}

- (int)hidden_size
{
  return self->_hidden_size;
}

- (void)setHidden_size:(int)a3
{
  self->_hidden_size = a3;
}

- (int)output_size
{
  return self->_output_size;
}

- (void)setOutput_size:(int)a3
{
  self->_output_size = a3;
}

@end
