@implementation _MPCPlaybackEngineEventStreamDeferralAssertion

- (void)dealloc
{
  objc_super v3;

  -[_MPCPlaybackEngineEventStreamDeferralAssertion invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)_MPCPlaybackEngineEventStreamDeferralAssertion;
  -[_MPCPlaybackEngineEventStreamDeferralAssertion dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;
  id WeakRetained;
  _MPCPlaybackEngineEventStreamDeferralAssertion *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  _BYTE v12[24];
  void *v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    WeakRetained = objc_loadWeakRetained((id *)&self->_eventStream);
    v5 = self;
    if (WeakRetained)
    {
      os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 2);
      objc_msgSend(*((id *)WeakRetained + 6), "removeObject:", v5);
      v6 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEventStream");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = *((_QWORD *)WeakRetained + 3);
        -[_MPCPlaybackEngineEventStreamDeferralAssertion identifier](v5, "identifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[_MPCPlaybackEngineEventStreamDeferralAssertion reason](v5, "reason");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v12 = 138543874;
        *(_QWORD *)&v12[4] = v7;
        *(_WORD *)&v12[12] = 2114;
        *(_QWORD *)&v12[14] = v8;
        *(_WORD *)&v12[22] = 2114;
        v13 = v9;
        _os_log_impl(&dword_210BD8000, v6, OS_LOG_TYPE_DEFAULT, "[EVS:%{public}@] _invalidateAssertion:%{public}@ | invalidating [] assertion.reason=%{public}@", v12, 0x20u);

      }
      v10 = objc_msgSend(*((id *)WeakRetained + 6), "count");
      os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 2);
      if (!v10)
      {
        v11 = *((_QWORD *)WeakRetained + 10);
        *(_QWORD *)v12 = MEMORY[0x24BDAC760];
        *(_QWORD *)&v12[8] = 3221225472;
        *(_QWORD *)&v12[16] = __53__MPCPlaybackEngineEventStream__invalidateAssertion___block_invoke;
        v13 = &unk_24CABA2D0;
        v14 = WeakRetained;
        dispatch_async(v11, v12);
      }
    }

  }
  os_unfair_lock_unlock(p_lock);
}

- (NSString)reason
{
  return self->_reason;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (_MPCPlaybackEngineEventStreamDeferralAssertion)initWithEventStream:(id)a3 type:(int64_t)a4 reason:(id)a5 timeout:(double)a6
{
  id v10;
  id v11;
  _MPCPlaybackEngineEventStreamDeferralAssertion *v12;
  _MPCPlaybackEngineEventStreamDeferralAssertion *v13;
  uint64_t v14;
  NSString *reason;
  uint64_t v16;
  NSString *identifier;
  id v18;
  uint64_t v19;
  MSVBlockGuard *timeoutGuard;
  _QWORD v22[4];
  id v23;
  id location;
  objc_super v25;

  v10 = a3;
  v11 = a5;
  v25.receiver = self;
  v25.super_class = (Class)_MPCPlaybackEngineEventStreamDeferralAssertion;
  v12 = -[_MPCPlaybackEngineEventStreamDeferralAssertion init](&v25, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v12->_eventStream, v10);
    v13->_type = a4;
    v14 = objc_msgSend(v11, "copy");
    reason = v13->_reason;
    v13->_reason = (NSString *)v14;

    MSVNanoIDCreateTaggedPointer();
    v16 = objc_claimAutoreleasedReturnValue();
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v16;

    if (a6 > 0.0)
    {
      objc_initWeak(&location, v13);
      v18 = objc_alloc(MEMORY[0x24BE65C40]);
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __90___MPCPlaybackEngineEventStreamDeferralAssertion_initWithEventStream_type_reason_timeout___block_invoke;
      v22[3] = &unk_24CAB7860;
      objc_copyWeak(&v23, &location);
      v19 = objc_msgSend(v18, "initWithTimeout:interruptionHandler:", v22, a6);
      timeoutGuard = v13->_timeoutGuard;
      v13->_timeoutGuard = (MSVBlockGuard *)v19;

      objc_destroyWeak(&v23);
      objc_destroyWeak(&location);
    }
  }

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeoutGuard, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_destroyWeak((id *)&self->_eventStream);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: %p reason=%@ invalidated=%d>"), objc_opt_class(), self, self->_reason, self->_invalidated);
}

- (MPCPlaybackEngineEventStream)eventStream
{
  return (MPCPlaybackEngineEventStream *)objc_loadWeakRetained((id *)&self->_eventStream);
}

- (int64_t)type
{
  return self->_type;
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (MSVBlockGuard)timeoutGuard
{
  return self->_timeoutGuard;
}

@end
