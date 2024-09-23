@implementation XRFrameRing

- (XRFrameRing)initWithMinorFrameCount:(unsigned __int8)a3
{
  XRFrameRing *v3;
  XRFrameRing *v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSMutableArray *managersBySlot;
  unsigned int i;
  NSMutableArray *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v21;
  objc_super v22;
  unsigned __int8 v23;

  v23 = a3;
  v22.receiver = self;
  v22.super_class = (Class)XRFrameRing;
  v3 = -[XRFrameRing init](&v22, sel_init);
  v4 = v3;
  if (v3)
  {
    sub_22634F8D8(&v23, &v21);
    sub_22634F31C((uint64_t)&v3->_ringImpl, &v21);
    v5 = (std::__shared_weak_count *)*((_QWORD *)&v21 + 1);
    if (*((_QWORD *)&v21 + 1))
    {
      v6 = (unint64_t *)(*((_QWORD *)&v21 + 1) + 8);
      do
        v7 = __ldaxr(v6);
      while (__stlxr(v7 - 1, v6));
      if (!v7)
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
      }
    }
    v4->_ringID = *(_QWORD *)v4->_ringImpl.__ptr_;
    v8 = objc_alloc(MEMORY[0x24BDBCEB8]);
    v12 = objc_msgSend_initWithCapacity_(v8, v9, v23, v10, v11);
    managersBySlot = v4->_managersBySlot;
    v4->_managersBySlot = (NSMutableArray *)v12;

    if (v23)
    {
      for (i = 0; i < v23; ++i)
      {
        v15 = v4->_managersBySlot;
        v16 = (void *)objc_opt_new();
        objc_msgSend_addObject_(v15, v17, (uint64_t)v16, v18, v19);

      }
    }
  }
  return v4;
}

- (XRFrameRing)init
{
  return (XRFrameRing *)((uint64_t (*)(XRFrameRing *, char *, uint64_t))MEMORY[0x24BEDD108])(self, sel_initWithMinorFrameCount_, 8);
}

- (void)assignActivityManager:(id)a3 frame:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v6 = a3;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = sub_22634F420;
  v11[3] = &unk_24EDC2CC8;
  v11[4] = self;
  v12 = v6;
  v10 = v6;
  objc_msgSend_enumerateIndexesUsingBlock_(a4, v7, (uint64_t)v11, v8, v9);

}

- (void)assignActivityManager:(id)a3 slot:(unsigned __int8)a4
{
  unsigned int v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;

  v4 = a4;
  v16 = (char *)a3;
  if (!self->_ringImpl.__ptr_)
    objc_msgSend_raise_format_(MEMORY[0x24BDBCE88], v16, *MEMORY[0x24BDBCAB0], (uint64_t)CFSTR("Manager %@ attempting to be assigned to a ring that has already been added to a commutator."), v8, v16);
  objc_msgSend_objectAtIndexedSubscript_(self->_managersBySlot, v6, v4, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_containsObject_(v9, v10, (uint64_t)v16, v11, v12))
    objc_msgSend_raise_format_(MEMORY[0x24BDBCE88], v16, *MEMORY[0x24BDBCAB0], (uint64_t)CFSTR("Manager %@ added twice to the same slot."), v15, v16);
  else
    objc_msgSend_addObject_(v9, v13, (uint64_t)v16, v14, v15);

}

- (void)_moveToCommutator:(void *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  NSMutableArray *managersBySlot;
  NSMutableArray *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[5];
  _QWORD v14[5];

  v7 = MEMORY[0x24BDAC760];
  managersBySlot = self->_managersBySlot;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = sub_22634F5C4;
  v14[3] = &unk_24EDC2CF0;
  v14[4] = self;
  objc_msgSend_enumerateObjectsUsingBlock_(managersBySlot, a2, (uint64_t)v14, v3, v4);
  v9 = self->_managersBySlot;
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = sub_22634F71C;
  v13[3] = &unk_24EDC2CF0;
  v13[4] = self;
  objc_msgSend_enumerateObjectsUsingBlock_(v9, v10, (uint64_t)v13, v11, v12);
  sub_22636CFB4((uint64_t)a3, &self->_ringImpl.__ptr_);
}

- (void)_removeFromCommutator:(void *)a3
{
  sub_22636D150((uint64_t)a3, self->_ringID);
}

- (shared_ptr<xray::scheduler::Ring>)_parent
{
  Ring **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<xray::scheduler::Ring> result;

  cntrl = self->_ringImpl.__cntrl_;
  *v2 = self->_ringImpl.__ptr_;
  v2[1] = (Ring *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (Ring *)self;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managersBySlot, 0);
  sub_22634FAC8((uint64_t)&self->_ringImpl);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
