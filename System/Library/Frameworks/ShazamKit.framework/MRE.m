@implementation MRE

- (void)dealloc
{
  uint64_t *mreInstance;
  uint64_t v4;
  objc_super v5;

  mreInstance = (uint64_t *)self->_mreInstance;
  if (mreInstance)
  {
    v4 = *mreInstance;
    *mreInstance = 0;
    if (v4)
      (*(void (**)(uint64_t, SEL))(*(_QWORD *)v4 + 8))(v4, a2);
    MEMORY[0x219A21574](mreInstance, 0x20C4093837F09);
  }
  v5.receiver = self;
  v5.super_class = (Class)MRE;
  -[MRE dealloc](&v5, sel_dealloc);
}

- (MRE)initWithMREInstance:(void *)a3 error:(id *)a4
{
  MRE *v5;
  MRE *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MRE;
  v5 = -[MRE init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[MRE setMreInstance:](v5, "setMreInstance:", a3);
  return v6;
}

- (MRE)initWithSignatures:(id)a3 density:(int64_t)a4 algorithm:(int64_t)a5 error:(id *)a6
{
  int v8;
  uint64_t *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  gsl::details *v18;
  uint64_t v19;
  shazam *v20;
  unint64_t *v21;
  unint64_t v22;
  unint64_t *p_shared_owners;
  unint64_t v24;
  unint64_t *v25;
  unint64_t v26;
  _UNKNOWN **os_timer;
  void **v28;
  uint64_t v29;
  void **v30;
  std::__shared_weak_count *v31;
  unint64_t *v32;
  unint64_t v33;
  std::__shared_weak_count *v34;
  unint64_t *v35;
  unint64_t v36;
  std::__shared_weak_count *v37;
  unint64_t *v38;
  unint64_t v39;
  std::__shared_weak_count *v40;
  unint64_t *v41;
  unint64_t v42;
  std::__shared_weak_count *v43;
  unint64_t *v44;
  unint64_t v45;
  std::__shared_weak_count *v46;
  unint64_t *v47;
  unint64_t v48;
  uint64_t *v49;
  MRE *v50;
  std::__shared_weak_count *v51;
  unint64_t *v52;
  unint64_t v53;
  std::__shared_weak_count *v54;
  unint64_t *v55;
  unint64_t v56;
  std::__shared_weak_count *v57;
  unint64_t *v58;
  unint64_t v59;
  std::__shared_weak_count *v60;
  unint64_t *v61;
  unint64_t v62;
  std::__shared_weak_count *v63;
  unint64_t *v64;
  unint64_t v65;
  __int128 v67;
  uint64_t v68;
  std::__shared_weak_count *v69;
  uint64_t v70;
  std::__shared_weak_count *v71;
  __int128 v72;
  uint64_t v73;
  std::__shared_weak_count *v74;
  uint64_t v75;
  std::__shared_weak_count *v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  void *__p[4];
  std::__shared_weak_count *v82;
  std::__shared_weak_count *v83;
  uint64_t v84;
  _OWORD v85[2];
  uint64_t *v86;
  void **v87;
  __int128 v88;
  __int128 v89;
  std::__shared_weak_count *v90;
  std::__shared_weak_count *v91;
  _BYTE v92[128];
  uint64_t v93;

  v8 = a4;
  v93 = *MEMORY[0x24BDAC8D0];
  v11 = (uint64_t *)operator new();
  *v11 = 0;
  v86 = v11;
  if (a5 == 1)
    v12 = 12;
  else
    v12 = 1;
  SearchPlan::SearchPlan((uint64_t)v85, v12, v8);
  v88 = v85[0];
  v89 = v85[1];
  shazam::CPUDatabaseBuilder::CPUDatabaseBuilder(__p, &v88, 1);
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v13 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v77, v92, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v78;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v78 != v14)
          objc_enumerationMutation(a3);
        v16 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * i);
        v17 = (void *)objc_msgSend(v16, "signatureData");
        v18 = gsl::make_span<shazam::spectral_peak_compact_t const>((gsl::details *)objc_msgSend(v17, "bytes"), (gsl::details *)objc_msgSend(v17, "length"));
        shazam::packed_signature_view::packed_signature_view(&v72, v18, v19);
        shazam::basic_signature<(shazam::signature_density)16>::basic_signature(&v88, &v72);
        shazam::CPUDatabaseBuilder::add((uint64_t)__p, (uint64_t)&v88, objc_msgSend(v16, "trackID"), 0);
        v87 = (void **)&v90;
        std::vector<std::vector<char>>::__destroy_vector::operator()[abi:ne180100](&v87);
      }
      v13 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v77, v92, 16);
    }
    while (v13);
  }
  shazam::CPUDatabaseBuilder::build((shazam::CPUDatabaseBuilder *)__p, &v72);
  v67 = v72;
  if (*((_QWORD *)&v72 + 1))
  {
    v21 = (unint64_t *)(*((_QWORD *)&v72 + 1) + 8);
    do
      v22 = __ldxr(v21);
    while (__stxr(v22 + 1, v21));
  }
  v68 = v73;
  v69 = v74;
  if (v74)
  {
    p_shared_owners = (unint64_t *)&v74->__shared_owners_;
    do
      v24 = __ldxr(p_shared_owners);
    while (__stxr(v24 + 1, p_shared_owners));
  }
  v70 = v75;
  v71 = v76;
  if (v76)
  {
    v25 = (unint64_t *)&v76->__shared_owners_;
    do
      v26 = __ldxr(v25);
    while (__stxr(v26 + 1, v25));
  }
  os_timer = shazam::get_os_timer(v20);
  shazam::StaticCPUSearcherFactory::StaticCPUSearcherFactory((uint64_t)&v88, &v67, 52428800, (uint64_t)os_timer, 0);
  shazam::StaticCPUSearcherFactory::make_searcher((shazam::StaticCPUSearcherFactory *)&v88, &v87);
  v28 = v87;
  v87 = 0;
  v29 = *v86;
  *v86 = (uint64_t)v28;
  if (v29)
    (*(void (**)(uint64_t))(*(_QWORD *)v29 + 8))(v29);
  v30 = v87;
  v87 = 0;
  if (v30)
    (*((void (**)(void **))*v30 + 1))(v30);
  *(_QWORD *)&v88 = &off_24D9B7268;
  v31 = v91;
  if (v91)
  {
    v32 = (unint64_t *)&v91->__shared_owners_;
    do
      v33 = __ldaxr(v32);
    while (__stlxr(v33 - 1, v32));
    if (!v33)
    {
      ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
      std::__shared_weak_count::__release_weak(v31);
    }
  }
  v34 = v90;
  if (v90)
  {
    v35 = (unint64_t *)&v90->__shared_owners_;
    do
      v36 = __ldaxr(v35);
    while (__stlxr(v36 - 1, v35));
    if (!v36)
    {
      ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
      std::__shared_weak_count::__release_weak(v34);
    }
  }
  v37 = (std::__shared_weak_count *)v89;
  if ((_QWORD)v89)
  {
    v38 = (unint64_t *)(v89 + 8);
    do
      v39 = __ldaxr(v38);
    while (__stlxr(v39 - 1, v38));
    if (!v39)
    {
      ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
      std::__shared_weak_count::__release_weak(v37);
    }
  }
  v40 = v71;
  if (v71)
  {
    v41 = (unint64_t *)&v71->__shared_owners_;
    do
      v42 = __ldaxr(v41);
    while (__stlxr(v42 - 1, v41));
    if (!v42)
    {
      ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
      std::__shared_weak_count::__release_weak(v40);
    }
  }
  v43 = v69;
  if (v69)
  {
    v44 = (unint64_t *)&v69->__shared_owners_;
    do
      v45 = __ldaxr(v44);
    while (__stlxr(v45 - 1, v44));
    if (!v45)
    {
      ((void (*)(std::__shared_weak_count *))v43->__on_zero_shared)(v43);
      std::__shared_weak_count::__release_weak(v43);
    }
  }
  v46 = (std::__shared_weak_count *)*((_QWORD *)&v67 + 1);
  if (*((_QWORD *)&v67 + 1))
  {
    v47 = (unint64_t *)(*((_QWORD *)&v67 + 1) + 8);
    do
      v48 = __ldaxr(v47);
    while (__stlxr(v48 - 1, v47));
    if (!v48)
    {
      ((void (*)(std::__shared_weak_count *))v46->__on_zero_shared)(v46);
      std::__shared_weak_count::__release_weak(v46);
    }
  }
  v49 = v86;
  v86 = 0;
  v50 = -[MRE initWithMREInstance:error:](self, "initWithMREInstance:error:", v49, a6, (_QWORD)v67);
  v51 = v76;
  if (v76)
  {
    v52 = (unint64_t *)&v76->__shared_owners_;
    do
      v53 = __ldaxr(v52);
    while (__stlxr(v53 - 1, v52));
    if (!v53)
    {
      ((void (*)(std::__shared_weak_count *))v51->__on_zero_shared)(v51);
      std::__shared_weak_count::__release_weak(v51);
    }
  }
  v54 = v74;
  if (v74)
  {
    v55 = (unint64_t *)&v74->__shared_owners_;
    do
      v56 = __ldaxr(v55);
    while (__stlxr(v56 - 1, v55));
    if (!v56)
    {
      ((void (*)(std::__shared_weak_count *))v54->__on_zero_shared)(v54);
      std::__shared_weak_count::__release_weak(v54);
    }
  }
  v57 = (std::__shared_weak_count *)*((_QWORD *)&v72 + 1);
  if (*((_QWORD *)&v72 + 1))
  {
    v58 = (unint64_t *)(*((_QWORD *)&v72 + 1) + 8);
    do
      v59 = __ldaxr(v58);
    while (__stlxr(v59 - 1, v58));
    if (!v59)
    {
      ((void (*)(std::__shared_weak_count *))v57->__on_zero_shared)(v57);
      std::__shared_weak_count::__release_weak(v57);
    }
  }
  *(_QWORD *)&v88 = &v84;
  std::vector<std::vector<char>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v88);
  v60 = v83;
  if (v83)
  {
    v61 = (unint64_t *)&v83->__shared_owners_;
    do
      v62 = __ldaxr(v61);
    while (__stlxr(v62 - 1, v61));
    if (!v62)
    {
      ((void (*)(std::__shared_weak_count *))v60->__on_zero_shared)(v60);
      std::__shared_weak_count::__release_weak(v60);
    }
  }
  v63 = v82;
  if (v82)
  {
    v64 = (unint64_t *)&v82->__shared_owners_;
    do
      v65 = __ldaxr(v64);
    while (__stlxr(v65 - 1, v64));
    if (!v65)
    {
      ((void (*)(std::__shared_weak_count *))v63->__on_zero_shared)(v63);
      std::__shared_weak_count::__release_weak(v63);
    }
  }
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  std::unique_ptr<MREInstance>::reset[abi:ne180100](&v86, 0);
  return v50;
}

- (id)search:(id)a3 error:(id *)a4
{
  uint64_t v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  id result;
  _QWORD v12[3];
  _QWORD v13[2];
  id v14;
  void **v15;
  _QWORD v16[3];
  _QWORD *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v14 = 0;
  v13[0] = gsl::make_span<shazam::spectral_peak_compact_t const>((gsl::details *)objc_msgSend(a3, "bytes"), (gsl::details *)objc_msgSend(a3, "length"));
  v13[1] = v5;
  shazam::make_vector<shazam::basic_signature<(shazam::signature_density)24>,gsl::span<char const,18446744073709551615ul> const&>(v13, v12);
  {
    LODWORD(-[MRE search:error:]::config) = 2;
    BYTE4(-[MRE search:error:]::config) = 0;
    BYTE8(-[MRE search:error:]::config) = 0;
    BYTE12(-[MRE search:error:]::config) = 0;
    byte_25500B0E0 = 0;
    dword_25500B0E4 = 1065353216;
    word_25500B0E8 = 0;
    dword_25500B0EC = 0;
    LOBYTE(qword_25500B0F0) = 0;
    HIDWORD(qword_25500B0F0) = 0;
  }
  {
    unk_25500B108 = -[MRE search:error:]::config;
    unk_25500B118 = *(_OWORD *)&byte_25500B0E0;
    qword_25500B128 = qword_25500B0F0;
    -[MRE search:error:]::configProvider = (uint64_t)&off_24D9B7158;
  }
  v8 = *(_QWORD *)-[MRE mreInstance](self, "mreInstance");
  v16[0] = &off_24D9B72E8;
  v16[1] = &v14;
  v17 = v16;
  (*(void (**)(uint64_t, _QWORD *, _QWORD, uint64_t, uint64_t *, _QWORD *))(*(_QWORD *)v8 + 16))(v8, v12, 0, 1, &-[MRE search:error:]::configProvider, v16);
  v9 = v17;
  if (v17 == v16)
  {
    v10 = 4;
    v9 = v16;
  }
  else
  {
    if (!v17)
      goto LABEL_8;
    v10 = 5;
  }
  (*(void (**)(void))(*v9 + 8 * v10))();
LABEL_8:
  v15 = (void **)v12;
  std::vector<shazam::basic_signature<(shazam::signature_density)24>>::__destroy_vector::operator()[abi:ne180100](&v15);
  result = v14;
  if (v14)
    return (id)objc_msgSend(v14, "copy");
  return result;
}

- (BOOL)ConvertSystemError:(const system_error *)a3 toError:(id *)a4
{
  uint64_t v6;
  uint64_t var0;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  if (a4)
  {
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", (*((uint64_t (**)(const system_error *, SEL))a3->var0 + 2))(a3, a2), objc_msgSend(MEMORY[0x24BDD17C8], "defaultCStringEncoding"));
    var0 = a3->var2.var0;
    v9 = *MEMORY[0x24BDD0FC8];
    v10[0] = v6;
    *a4 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.shazam.sigvalidation"), var0, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1));
  }
  return a4 != 0;
}

- (BOOL)ConvertException:(const exception *)a3 toError:(id *)a4
{
  uint64_t v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  if (a4)
  {
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", (*((uint64_t (**)(const exception *, SEL))a3->var0 + 2))(a3, a2), objc_msgSend(MEMORY[0x24BDD17C8], "defaultCStringEncoding"));
    v7 = *MEMORY[0x24BDD0FC8];
    v8[0] = v5;
    *a4 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.shazam.mre"), -100, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1));
  }
  return a4 != 0;
}

- (BOOL)FillUnknownError:(id *)a3
{
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v5 = *MEMORY[0x24BDD0FC8];
    v6[0] = CFSTR("Something unexpected happened.");
    *a3 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.shazam.mre"), -200, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1));
  }
  return a3 != 0;
}

- (void)mreInstance
{
  return self->_mreInstance;
}

- (void)setMreInstance:(void *)a3
{
  self->_mreInstance = a3;
}

- (void)search:error:
{
}

- (_QWORD)search:error:
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_24D9B72E8;
  result[1] = v3;
  return result;
}

- (uint64_t)search:error:
{
    return a1 + 8;
  else
    return 0;
}

@end
