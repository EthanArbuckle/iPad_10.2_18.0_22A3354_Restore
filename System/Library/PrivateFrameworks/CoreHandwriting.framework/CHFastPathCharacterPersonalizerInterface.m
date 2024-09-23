@implementation CHFastPathCharacterPersonalizerInterface

- (CHFastPathCharacterPersonalizerInterface)initWithStyleInventory:(id)a3 characterSet:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  std::__shared_weak_count *v15;
  unint64_t *p_shared_owners;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  __int128 v22;

  v6 = a3;
  v7 = a4;
  v13 = objc_msgSend_init(self, v8, v9, v10, v11, v12);
  if (v13)
  {
    CoreHandwriting::synthesis::fast_path::CHFastPathCharacterPersonalizerWithPrefixForStyleInventory::CHFastPathCharacterPersonalizerWithPrefixForStyleInventory(&v22, v7, v6);
    v14 = v22;
    v22 = 0uLL;
    v15 = *(std::__shared_weak_count **)(v13 + 16);
    *(_OWORD *)(v13 + 8) = v14;
    if (v15)
    {
      p_shared_owners = (unint64_t *)&v15->__shared_owners_;
      do
        v17 = __ldaxr(p_shared_owners);
      while (__stlxr(v17 - 1, p_shared_owners));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }
    v18 = (std::__shared_weak_count *)*((_QWORD *)&v22 + 1);
    if (*((_QWORD *)&v22 + 1))
    {
      v19 = (unint64_t *)(*((_QWORD *)&v22 + 1) + 8);
      do
        v20 = __ldaxr(v19);
      while (__stlxr(v20 - 1, v19));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
    }
  }

  return (CHFastPathCharacterPersonalizerInterface *)v13;
}

- (void)runPersonalizationWithBlock:(id)a3 resynthesizeAll:(BOOL)a4
{
  CoreHandwriting::synthesis::fast_path::CHFastPathCharacterPersonalizerWithPrefixForStyleInventory::runPersonalization(&self->_fastPathCharacterPersonalizer._fastPathCharacterPersonalizer.__ptr_, a3, a4);
}

- (void).cxx_destruct
{
  __shared_weak_count *cntrl;
  unint64_t *v3;
  unint64_t v4;

  cntrl = self->_fastPathCharacterPersonalizer._fastPathCharacterPersonalizer.__cntrl_;
  if (cntrl)
  {
    v3 = (unint64_t *)((char *)cntrl + 8);
    do
      v4 = __ldaxr(v3);
    while (__stlxr(v4 - 1, v3));
    if (!v4)
    {
      (*(void (**)(__shared_weak_count *, SEL))(*(_QWORD *)cntrl + 16))(cntrl, a2);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
