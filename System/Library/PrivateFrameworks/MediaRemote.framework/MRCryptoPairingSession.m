@implementation MRCryptoPairingSession

+ (id)allocWithZone:(_NSZone *)a3
{
  objc_super v6;

  if ((id)objc_opt_class() == a1)
    return +[MRCryptoPairingSession allocWithZone:](MRCoreUtilsPairingSession, "allocWithZone:", a3);
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___MRCryptoPairingSession;
  return objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
}

- (MRCryptoPairingSession)initWithRole:(unint64_t)a3 device:(id)a4
{
  id v7;
  MRCryptoPairingSession *v8;
  MRCryptoPairingSession *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MRCryptoPairingSession;
  v8 = -[MRCryptoPairingSession init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_role = a3;
    objc_storeStrong((id *)&v8->_device, a4);
  }

  return v9;
}

- (MRCryptoPairingSession)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99750];
  NSStringFromSelector(sel_initWithRole_device_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("use %@ instead"), v5);

  return 0;
}

- (BOOL)isPaired
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRCryptoPairingSession isPaired]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v4, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v5);
}

- (BOOL)isValid
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRCryptoPairingSession isValid]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v4, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v5);
}

- (NSArray)pairedDevices
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRCryptoPairingSession pairedDevices]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v4, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v5);
}

- (void)open
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRCryptoPairingSession open]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v4, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v5);
}

- (void)close
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRCryptoPairingSession close]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v4, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v5);
}

- (id)removePeer
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRCryptoPairingSession removePeer]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v4, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v5);
}

- (id)updatePeer
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRCryptoPairingSession updatePeer]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v4, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v5);
}

- (void)handlePairingExchangeData:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0C99DA0];
  v8 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRCryptoPairingSession handlePairingExchangeData:completion:]");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (void)handlePairingFailureWithStatus:(int)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRCryptoPairingSession handlePairingFailureWithStatus:]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (id)encryptData:(id)a3 withError:(id *)a4
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRCryptoPairingSession encryptData:withError:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v7, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v8);
}

- (id)decryptData:(id)a3 withError:(id *)a4
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRCryptoPairingSession decryptData:withError:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v7, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v8);
}

- (BOOL)deleteIdentityWithError:(id *)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRCryptoPairingSession deleteIdentityWithError:]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (MRDeviceInfo)device
{
  return self->_device;
}

- (unint64_t)role
{
  return self->_role;
}

- (MRCryptoPairingSessionDelegate)delegate
{
  return (MRCryptoPairingSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
