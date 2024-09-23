@implementation ZN3AMS15initAMSCoreOnceEv

_QWORD *___ZN3AMS15initAMSCoreOnceEv_block_invoke()
{
  std::__shared_weak_count *v0;
  unint64_t *p_shared_owners;
  unint64_t v2;
  std::__shared_weak_count *v3;
  unint64_t *v4;
  unint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  std::__shared_weak_count *v30;
  unint64_t *v31;
  unint64_t v32;
  _QWORD *v33;
  std::__shared_weak_count *v34;
  unint64_t *v35;
  unint64_t v36;
  char *v37;
  std::__shared_weak_count *v38;
  unint64_t *v39;
  unint64_t v40;
  _QWORD *result;
  uint64_t v42;
  void (**v43)(_QWORD);
  std::__shared_weak_count *v44;
  char v45;
  _QWORD v46[3];
  _QWORD *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v43 = 0;
  v44 = 0;
  AMSCore::ServiceProvider<AMSCore::IAnisetteProvider>::setDefault((uint64_t)&v43);
  v0 = v44;
  if (v44)
  {
    p_shared_owners = (unint64_t *)&v44->__shared_owners_;
    do
      v2 = __ldaxr(p_shared_owners);
    while (__stlxr(v2 - 1, p_shared_owners));
    if (!v2)
    {
      ((void (*)(std::__shared_weak_count *))v0->__on_zero_shared)(v0);
      std::__shared_weak_count::__release_weak(v0);
    }
  }
  v43 = 0;
  v44 = 0;
  AMSCore::ServiceProvider<AMSCore::IHTTPProvider>::setDefault((uint64_t)&v43);
  v3 = v44;
  if (v44)
  {
    v4 = (unint64_t *)&v44->__shared_owners_;
    do
      v5 = __ldaxr(v4);
    while (__stlxr(v5 - 1, v4));
    if (!v5)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
  v43 = 0;
  v44 = 0;
  AMSCore::ServiceProvider<AMSCore::IKeybagProvider>::setDefault((uint64_t)&v43);
  v6 = v44;
  if (v44)
  {
    v7 = (unint64_t *)&v44->__shared_owners_;
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  v43 = 0;
  v44 = 0;
  AMSCore::ServiceProvider<AMSCore::IMetricsProvider>::setDefault((uint64_t)&v43);
  v9 = v44;
  if (v44)
  {
    v10 = (unint64_t *)&v44->__shared_owners_;
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  v43 = 0;
  v44 = 0;
  AMSCore::ServiceProvider<AMSCore::IMetricsSamplingProvider>::setDefault((uint64_t)&v43);
  v12 = v44;
  if (v44)
  {
    v13 = (unint64_t *)&v44->__shared_owners_;
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  v43 = 0;
  v44 = 0;
  AMSCore::ServiceProvider<AMSCore::INotificationCenter>::setDefault((uint64_t)&v43);
  v15 = v44;
  if (v44)
  {
    v16 = (unint64_t *)&v44->__shared_owners_;
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
  v43 = 0;
  v44 = 0;
  AMSCore::ServiceProvider<AMSCore::IOpenURLProvider>::setDefault((uint64_t)&v43);
  v18 = v44;
  if (v44)
  {
    v19 = (unint64_t *)&v44->__shared_owners_;
    do
      v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }
  v43 = 0;
  v44 = 0;
  AMSCore::ServiceProvider<AMSCore::IPrivacyProvider>::setDefault((uint64_t)&v43);
  v21 = v44;
  if (v44)
  {
    v22 = (unint64_t *)&v44->__shared_owners_;
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }
  v43 = 0;
  v44 = 0;
  AMSCore::ServiceProvider<AMSCore::ISchedulingProvider>::setDefault((uint64_t)&v43);
  v24 = v44;
  if (v44)
  {
    v25 = (unint64_t *)&v44->__shared_owners_;
    do
      v26 = __ldaxr(v25);
    while (__stlxr(v26 - 1, v25));
    if (!v26)
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
  }
  v43 = 0;
  v44 = 0;
  AMSCore::ServiceProvider<AMSCore::MetricsIdentifierProvider>::setDefault((uint64_t)&v43);
  v27 = v44;
  if (v44)
  {
    v28 = (unint64_t *)&v44->__shared_owners_;
    do
      v29 = __ldaxr(v28);
    while (__stlxr(v29 - 1, v28));
    if (!v29)
    {
      ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
      std::__shared_weak_count::__release_weak(v27);
    }
  }
  v43 = 0;
  v44 = 0;
  AMSCore::ServiceProvider<AMSCore::StructuredData::IStructuredDataProvider>::setDefault((uint64_t)&v43);
  v30 = v44;
  if (v44)
  {
    v31 = (unint64_t *)&v44->__shared_owners_;
    do
      v32 = __ldaxr(v31);
    while (__stlxr(v32 - 1, v31));
    if (!v32)
    {
      ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
      std::__shared_weak_count::__release_weak(v30);
    }
  }
  v33 = operator new(0x20uLL);
  v33[1] = 0;
  v33[2] = 0;
  *v33 = &off_1E25226C8;
  v33[3] = &off_1E25204B8;
  v43 = (void (**)(_QWORD))(v33 + 3);
  v44 = (std::__shared_weak_count *)v33;
  AMSCore::ServiceProvider<AMSCore::IDeviceInfo>::setDefault((uint64_t)&v43);
  v34 = v44;
  if (v44)
  {
    v35 = (unint64_t *)&v44->__shared_owners_;
    do
      v36 = __ldaxr(v35);
    while (__stlxr(v36 - 1, v35));
    if (!v36)
    {
      ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
      std::__shared_weak_count::__release_weak(v34);
    }
  }
  v37 = (char *)operator new(0xE0uLL);
  *((_QWORD *)v37 + 1) = 0;
  *((_QWORD *)v37 + 2) = 0;
  *(_QWORD *)v37 = &off_1E2522C78;
  *((_QWORD *)v37 + 3) = &off_1E2520E90;
  *((_OWORD *)v37 + 3) = 0u;
  *((_OWORD *)v37 + 4) = 0u;
  *((_OWORD *)v37 + 5) = 0u;
  *((_OWORD *)v37 + 6) = 0u;
  *((_OWORD *)v37 + 7) = 0u;
  *((_OWORD *)v37 + 8) = 0u;
  *((_OWORD *)v37 + 9) = 0u;
  *((_OWORD *)v37 + 10) = 0u;
  *((_OWORD *)v37 + 11) = 0u;
  *((_OWORD *)v37 + 12) = 0u;
  *((_OWORD *)v37 + 13) = 0u;
  *((_OWORD *)v37 + 2) = 0u;
  std::__shared_mutex_base::__shared_mutex_base((std::__shared_mutex_base *)(v37 + 32));
  *((_QWORD *)v37 + 27) = 0;
  *((_QWORD *)v37 + 26) = 0;
  *((_QWORD *)v37 + 25) = v37 + 208;
  v43 = (void (**)(_QWORD))(v37 + 24);
  v44 = (std::__shared_weak_count *)v37;
  AMSCore::ServiceProvider<AMSCore::IDataProvider>::setDefault((uint64_t)&v43);
  v38 = v44;
  if (v44)
  {
    v39 = (unint64_t *)&v44->__shared_owners_;
    do
      v40 = __ldaxr(v39);
    while (__stlxr(v40 - 1, v39));
    if (!v40)
    {
      ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
      std::__shared_weak_count::__release_weak(v38);
    }
  }
  v46[0] = &off_1E2521760;
  v47 = v46;
  AMSCore::init((uint64_t)v46, (uint64_t)&v43);
  if (!v45)
    (*v43)(&v43);
  result = v47;
  if (v47 == v46)
  {
    v42 = 4;
    result = v46;
  }
  else
  {
    if (!v47)
      return result;
    v42 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v42))();
}

@end
