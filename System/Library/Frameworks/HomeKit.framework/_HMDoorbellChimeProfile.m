@implementation _HMDoorbellChimeProfile

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t2 != -1)
    dispatch_once(&logCategory__hmf_once_t2, &__block_literal_global_4837);
  return (id)logCategory__hmf_once_v3;
}

- (void)_registerNotificationHandlers
{
  void *v3;
  id v4;

  -[_HMAccessoryProfile context](self, "context");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerForMessage:receiver:selector:", CFSTR("HM.doorbell.chime"), self, sel__handleDoorbellChimeMessage_);

}

- (void)_handleDoorbellChimeMessage:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_HMDoorbellChimeProfile delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didReceiveDoorbellChimeMessage:", v4);

}

- (_HMDoorbellChimeProfileDelegate)delegate
{
  os_unfair_lock_s *v3;
  id WeakRetained;

  v3 = &self->_lock + 1;
  os_unfair_lock_lock_with_options();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_lock_unlock(v3);
  return (_HMDoorbellChimeProfileDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
  os_unfair_lock_s *v4;
  id v5;

  v4 = &self->_lock + 1;
  v5 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_delegate, v5);

  os_unfair_lock_unlock(v4);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
