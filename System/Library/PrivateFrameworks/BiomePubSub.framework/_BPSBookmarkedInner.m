@implementation _BPSBookmarkedInner

- (_BPSBookmarkedInner)initWithUpstream:(id)a3 downstream:(id)a4 state:(id)a5
{
  id v8;
  id v9;
  id v10;
  _BPSBookmarkedInner *v11;
  objc_class *v12;
  uint64_t v13;
  NSString *upstreamClassName;
  uint64_t v15;
  BMBookmark *upstreamBookmark;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)_BPSBookmarkedInner;
  v11 = -[_BPSBookmarkedInner init](&v18, sel_init);
  if (v11)
  {
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = objc_claimAutoreleasedReturnValue();
    upstreamClassName = v11->_upstreamClassName;
    v11->_upstreamClassName = (NSString *)v13;

    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = objc_claimAutoreleasedReturnValue();
    upstreamBookmark = v11->_upstreamBookmark;
    v11->_upstreamBookmark = (BMBookmark *)v15;

    objc_storeStrong((id *)&v11->_downstream, a4);
    objc_storeStrong(&v11->_state, a5);
    v11->_lock._os_unfair_lock_opaque = 0;
  }

  return v11;
}

- (void)receiveCompletion:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  BPSSubscription *subscription;
  void *v7;
  _BPSBookmarkedInner *v8;

  p_lock = &self->_lock;
  v8 = self;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[_BPSBookmarkedInner _updateBookmarkWhenLocked](v8, "_updateBookmarkWhenLocked");
  subscription = v8->_subscription;
  v8->_subscription = 0;

  os_unfair_lock_unlock(p_lock);
  -[_BPSBookmarkedInner downstream](v8, "downstream");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "receiveCompletion:", v5);

}

- (int64_t)receiveInput:(id)a3
{
  os_unfair_lock_s *p_lock;
  _BPSBookmarkedInner *v5;
  id v6;
  void *v7;
  int64_t v8;

  p_lock = &self->_lock;
  v5 = self;
  v6 = a3;
  os_unfair_lock_lock(p_lock);
  -[_BPSBookmarkedInner setState:](v5, "setState:", v6);
  os_unfair_lock_unlock(p_lock);
  -[_BPSBookmarkedInner downstream](v5, "downstream");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "receiveInput:", v6);

  return v8;
}

- (void)receiveSubscription:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  id v6;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[_BPSBookmarkedInner setSubscription:](self, "setSubscription:", v5);

  os_unfair_lock_unlock(p_lock);
  -[_BPSBookmarkedInner downstream](self, "downstream");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "receiveSubscription:", self);

}

- (void)cancel
{
  os_unfair_lock_s *p_lock;
  BPSSubscription *v3;
  BPSSubscription *subscription;
  _BPSBookmarkedInner *v5;

  p_lock = &self->_lock;
  v5 = self;
  os_unfair_lock_lock(p_lock);
  v3 = v5->_subscription;
  -[_BPSBookmarkedInner _updateBookmarkWhenLocked](v5, "_updateBookmarkWhenLocked");
  subscription = v5->_subscription;
  v5->_subscription = 0;

  os_unfair_lock_unlock(p_lock);
  -[BPSSubscription cancel](v3, "cancel");

}

- (void)requestDemand:(int64_t)a3
{
  id v4;

  -[_BPSBookmarkedInner subscription](self, "subscription");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestDemand:", a3);

}

- (id)newBookmark
{
  BMBookmarkNode *v3;
  void *v4;
  void *v5;
  BMBookmarkNode *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = [BMBookmarkNode alloc];
  -[_BPSBookmarkedInner state](self, "state");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = self->_upstreamBookmark;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[BMBookmarkNode initWithValue:upstreams:name:](v3, "initWithValue:upstreams:name:", v4, v5, self->_upstreamClassName);

  return v6;
}

- (void)_updateBookmarkWhenLocked
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "subscription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_1A956A000, v2, v3, "Subscription - %@ doesn't conform to BMBookmarkableSubscription protocol", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1();
}

- (BPSSubscriber)downstream
{
  return self->_downstream;
}

- (void)setDownstream:(id)a3
{
  objc_storeStrong((id *)&self->_downstream, a3);
}

- (NSString)upstreamClassName
{
  return self->_upstreamClassName;
}

- (void)setUpstreamClassName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BPSSubscription)subscription
{
  return self->_subscription;
}

- (void)setSubscription:(id)a3
{
  objc_storeStrong((id *)&self->_subscription, a3);
}

- (BMBookmark)upstreamBookmark
{
  return self->_upstreamBookmark;
}

- (void)setUpstreamBookmark:(id)a3
{
  objc_storeStrong((id *)&self->_upstreamBookmark, a3);
}

- (id)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
  objc_storeStrong(&self->_state, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_state, 0);
  objc_storeStrong((id *)&self->_upstreamBookmark, 0);
  objc_storeStrong((id *)&self->_subscription, 0);
  objc_storeStrong((id *)&self->_upstreamClassName, 0);
  objc_storeStrong((id *)&self->_downstream, 0);
}

@end
