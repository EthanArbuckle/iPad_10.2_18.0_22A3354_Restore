@implementation _BPSMapInner

- (_BPSMapInner)initWithDownstream:(id)a3 transform:(id)a4
{
  id v7;
  id v8;
  _BPSMapInner *v9;
  uint64_t v10;
  id transform;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_BPSMapInner;
  v9 = -[_BPSMapInner init](&v13, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    transform = v9->_transform;
    v9->_transform = (id)v10;

    objc_storeStrong((id *)&v9->_downstream, a3);
  }

  return v9;
}

- (void)receiveSubscription:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_BPSMapInner downstream](self, "downstream");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "receiveSubscription:", v4);

}

- (int64_t)receiveInput:(id)a3
{
  _BPSMapInner *v4;
  id v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  void *v8;
  int64_t v9;

  v4 = self;
  v5 = a3;
  -[_BPSMapInner transform](v4, "transform");
  v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v6)[2](v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[_BPSMapInner downstream](v4, "downstream");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "receiveInput:", v7);

  return v9;
}

- (void)receiveCompletion:(id)a3
{
  _BPSMapInner *v4;
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = self;
  v5 = a3;
  __biome_log_for_category();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v9 = 138412290;
    v10 = (id)objc_opt_class();
    v7 = v10;
    _os_log_impl(&dword_1A956A000, v6, OS_LOG_TYPE_INFO, "%@ - completion", (uint8_t *)&v9, 0xCu);

  }
  -[_BPSMapInner downstream](v4, "downstream");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "receiveCompletion:", v5);

}

- (void)cancel
{
  void *v2;
  _BPSMapInner *v3;

  v3 = self;
  -[_BPSMapInner downstream](v3, "downstream");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancel");

}

- (BPSSubscriber)downstream
{
  return self->_downstream;
}

- (void)setDownstream:(id)a3
{
  objc_storeStrong((id *)&self->_downstream, a3);
}

- (id)transform
{
  return self->_transform;
}

- (void)setTransform:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_transform, 0);
  objc_storeStrong((id *)&self->_downstream, 0);
}

@end
