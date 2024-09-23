@implementation GEOZilchDecoder

+ (BOOL)decodingSupported
{
  return +[GEOMapAccess supportsRoadMapAccess](GEOMapAccess, "supportsRoadMapAccess");
}

- (GEOZilchDecoder)init
{
  GEOZilchDecoder *v2;
  uint64_t v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOZilchDecoder;
  v2 = -[GEOMapRequestManager init](&v6, sel_init);
  if (v2)
  {
    v3 = geo_dispatch_queue_create();
    v4 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = v3;

    -[GEOZilchDecoder setRequestQueue:](v2, "setRequestQueue:", MEMORY[0x1E0C80D38]);
  }
  return v2;
}

- (id)requestQueue
{
  return *((id *)self + 4);
}

- (void)setRequestQueue:(id)a3
{
  objc_storeStrong((id *)self + 4, a3);
}

- (id)decodeZilchMessage:(shared_ptr<zilch:(id)a4 :(id)a5 Message>)a3 pathHandler:errorHandler:
{
  Message *ptr;
  __shared_weak_count *v8;
  id v9;
  GEOZilchDecoderRequest *v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  GEOZilchDecoderRequest *v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  uint64_t v19;
  std::__shared_weak_count *v20;

  ptr = a3.__ptr_;
  v8 = a3.__cntrl_;
  v9 = a4;
  v10 = [GEOZilchDecoderRequest alloc];
  v11 = (std::__shared_weak_count *)*((_QWORD *)ptr + 1);
  v19 = *(_QWORD *)ptr;
  v20 = v11;
  if (v11)
  {
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    do
      v13 = __ldxr(p_shared_owners);
    while (__stxr(v13 + 1, p_shared_owners));
  }
  v14 = -[GEOZilchDecoderRequest initWithDecoder:message:](v10, "initWithDecoder:message:", self, &v19);
  v15 = v20;
  if (v20)
  {
    v16 = (unint64_t *)&v20->__shared_owners_;
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
  -[GEOZilchDecoderRequest decodeWithPathHandler:errorHandler:](v14, "decodeWithPathHandler:errorHandler:", v8, v9, v19);

  return v14;
}

- (void)trackRequest:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  std::mutex::lock((std::mutex *)((char *)self + 40));
  v5.receiver = self;
  v5.super_class = (Class)GEOZilchDecoder;
  -[GEOMapRequestManager trackRequest:](&v5, sel_trackRequest_, v4);
  std::mutex::unlock((std::mutex *)((char *)self + 40));

}

- (void)requestComplete:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  std::mutex::lock((std::mutex *)((char *)self + 40));
  v5.receiver = self;
  v5.super_class = (Class)GEOZilchDecoder;
  -[GEOMapRequestManager requestComplete:](&v5, sel_requestComplete_, v4);
  std::mutex::unlock((std::mutex *)((char *)self + 40));

}

- (OS_dispatch_queue)decoderQueue
{
  return (OS_dispatch_queue *)*((_QWORD *)self + 3);
}

- (GEOMapAccessRestrictions)mapAccessRestrictions
{
  return (GEOMapAccessRestrictions *)objc_loadWeakRetained((id *)self + 13);
}

- (void)setMapAccessRestrictions:(id)a3
{
  objc_storeWeak((id *)self + 13, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)self + 13);
  std::mutex::~mutex((std::mutex *)((char *)self + 40));
  objc_storeStrong((id *)self + 4, 0);
  objc_storeStrong((id *)self + 3, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 5) = 850045863;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((_QWORD *)self + 12) = 0;
  return self;
}

@end
