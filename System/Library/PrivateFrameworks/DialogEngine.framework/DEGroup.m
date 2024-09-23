@implementation DEGroup

- (DEGroup)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DEGroup;
  return -[DENode init](&v3, sel_init);
}

- (DEGroup)initWithSharedPtr:(shared_ptr<siri::dialogengine::Group>)a3
{
  Group *var0;
  DEGroup *v4;
  DEGroup *v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  uint64_t v13;
  std::__shared_weak_count *v14;
  objc_super v15;

  var0 = a3.var0;
  v15.receiver = self;
  v15.super_class = (Class)DEGroup;
  v4 = -[DENode init](&v15, sel_init, a3.var0, a3.var1);
  v5 = v4;
  if (v4)
  {
    v6 = (std::__shared_weak_count *)*((_QWORD *)var0 + 1);
    v13 = *(_QWORD *)var0;
    v14 = v6;
    if (v6)
    {
      p_shared_owners = (unint64_t *)&v6->__shared_owners_;
      do
        v8 = __ldxr(p_shared_owners);
      while (__stxr(v8 + 1, p_shared_owners));
    }
    -[DENode setThis:](v4, "setThis:", &v13);
    v9 = v14;
    if (v14)
    {
      v10 = (unint64_t *)&v14->__shared_owners_;
      do
        v11 = __ldaxr(v10);
      while (__stlxr(v11 - 1, v10));
      if (!v11)
      {
        ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
        std::__shared_weak_count::__release_weak(v9);
      }
    }
  }
  return v5;
}

- (id)getNodes
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  void *v5;
  void ***v6;
  void ***i;
  std::__shared_weak_count *v8;
  void **v9;
  unint64_t *v10;
  unint64_t v11;
  DENode *v12;
  unint64_t *v13;
  unint64_t v14;
  DENode *v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  void **v23;
  std::__shared_weak_count *v24;
  void **v25;
  std::__shared_weak_count *v26;
  void ***v27;
  void ***v28;
  uint64_t v29;

  -[DENode This](self, "This");
  v28 = 0;
  v29 = 0;
  v27 = 0;
  std::vector<std::shared_ptr<siri::dialogengine::Node>>::__init_with_size[abi:ne180100]<std::shared_ptr<siri::dialogengine::Node>*,std::shared_ptr<siri::dialogengine::Node>*>((char *)&v27, v25[26], v25[27], ((_BYTE *)v25[27] - (_BYTE *)v25[26]) >> 4);
  v2 = v26;
  if (v26)
  {
    p_shared_owners = (unint64_t *)&v26->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  v5 = (void *)objc_opt_new();
  v6 = v27;
  for (i = v28; v6 != i; v6 += 2)
  {
    v9 = *v6;
    v8 = (std::__shared_weak_count *)v6[1];
    v25 = *v6;
    v26 = v8;
    if (v8)
    {
      v10 = (unint64_t *)&v8->__shared_owners_;
      do
        v11 = __ldxr(v10);
      while (__stxr(v11 + 1, v10));
    }
    v12 = [DENode alloc];
    v23 = v9;
    v24 = v8;
    if (v8)
    {
      v13 = (unint64_t *)&v8->__shared_owners_;
      do
        v14 = __ldxr(v13);
      while (__stxr(v14 + 1, v13));
    }
    v15 = -[DENode initWithSharedPtr:](v12, "initWithSharedPtr:", &v23);
    v16 = v24;
    if (v24)
    {
      v17 = (unint64_t *)&v24->__shared_owners_;
      do
        v18 = __ldaxr(v17);
      while (__stlxr(v18 - 1, v17));
      if (!v18)
      {
        ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
        std::__shared_weak_count::__release_weak(v16);
      }
    }
    objc_msgSend(v5, "addObject:", v15);

    v19 = v26;
    if (v26)
    {
      v20 = (unint64_t *)&v26->__shared_owners_;
      do
        v21 = __ldaxr(v20);
      while (__stlxr(v21 - 1, v20));
      if (!v21)
      {
        ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
        std::__shared_weak_count::__release_weak(v19);
      }
    }
  }
  v25 = (void **)&v27;
  std::vector<std::shared_ptr<siri::dialogengine::VisualComponentsCombination::Entry>>::__destroy_vector::operator()[abi:ne180100](&v25);
  return v5;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)DEGroup;
  -[DEGroup dealloc](&v2, sel_dealloc);
}

@end
