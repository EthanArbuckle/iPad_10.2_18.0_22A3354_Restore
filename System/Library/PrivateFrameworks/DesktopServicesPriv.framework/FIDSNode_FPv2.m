@implementation FIDSNode_FPv2

- (id)shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  objc_super v8;

  -[FIDSNode fpItem](self, "fpItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)FIDSNode_FPv2;
  -[FIDSNode shortDescription](&v8, sel_shortDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingFormat:", CFSTR(" -- fpItem: %p"), v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "isPlaceholder"))
  {
    objc_msgSend(v5, "stringByAppendingString:", CFSTR(", placeholder"));
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }

  return v5;
}

+ (id)makeWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  NSObject *v10;
  unint64_t v11;
  id v12;
  id v13;
  NSObject *v14;
  unint64_t v15;
  id v16;
  id v17;
  unint64_t v18;
  dispatch_time_t v19;
  intptr_t v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  dispatch_semaphore_t v28;
  NSObject *v29;
  _QWORD v30[4];
  id v31[2];
  std::__shared_weak_count *v32;
  id v33;
  id v34;
  id *v35;
  std::__shared_weak_count *v36;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FI FPv2 FPItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  static_objc_cast<NSString,objc_object * {__strong}>(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FI FPv2 Domain"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  static_objc_cast<NSString,objc_object * {__strong}>(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5 || !v7)
    goto LABEL_24;
  v28 = dispatch_semaphore_create(0);
  v8 = (std::__shared_weak_count *)operator new(0x20uLL);
  v8->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v8->__shared_owners_;
  v8->__shared_weak_owners_ = 0;
  v8->__vftable = (std::__shared_weak_count_vtbl *)&unk_1E8752C18;
  v8[1].__vftable = 0;
  v35 = (id *)&v8[1].__vftable;
  v36 = v8;
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3321888768;
  v30[2] = __31__FIDSNode_FPv2_makeWithCoder___block_invoke;
  v30[3] = &__block_descriptor_72_ea8_32c44_ZTSKZ31__FIDSNode_FPv2_makeWithCoder__E3__0_e28_v24__0__FINode_8__NSError_16l;
  v10 = v28;
  v29 = v10;
  do
    v11 = __ldxr(p_shared_owners);
  while (__stxr(v11 + 1, p_shared_owners));
  v12 = v5;
  v13 = v7;
  v14 = v10;
  v31[0] = v14;
  v31[1] = &v8[1];
  v32 = v8;
  do
    v15 = __ldxr(p_shared_owners);
  while (__stxr(v15 + 1, p_shared_owners));
  v16 = v12;
  v33 = v16;
  v17 = v13;
  v34 = v17;
  +[FINode fiNodeFromItem:inFPv2Domain:completion:](FINode, "fiNodeFromItem:inFPv2Domain:completion:", v16, v17, v30, v31, v28);

  do
    v18 = __ldaxr(p_shared_owners);
  while (__stlxr(v18 - 1, p_shared_owners));
  if (!v18)
  {
    ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
    std::__shared_weak_count::__release_weak(v8);
  }

  v19 = dispatch_time(0, 3000000000);
  v20 = dispatch_semaphore_wait(v14, v19);
  if (!v20)
    v8 = (std::__shared_weak_count *)*v35;

  v21 = v32;
  if (v32)
  {
    v22 = (unint64_t *)&v32->__shared_owners_;
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }

  v24 = v36;
  if (v36)
  {
    v25 = (unint64_t *)&v36->__shared_owners_;
    do
      v26 = __ldaxr(v25);
    while (__stlxr(v26 - 1, v25));
    if (!v26)
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
  }

  if (v20)
LABEL_24:
    v8 = 0;

  return v8;
}

+ (id)makeWithCoder:(id *)a1
{

  std::shared_ptr<TClientChangeNotifier>::~shared_ptr[abi:ne180100]((uint64_t)(a1 + 1));
  return a1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)FIDSNode_FPv2;
  -[FIDSNode encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[FIDSNode fpItem](self, "fpItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("FI FPv2 FPItem"));
  -[FIDSNode fpDomain](self, "fpDomain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("FI FPv2 Domain"));

}

@end
