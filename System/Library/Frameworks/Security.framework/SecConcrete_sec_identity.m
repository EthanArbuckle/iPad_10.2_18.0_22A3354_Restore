@implementation SecConcrete_sec_identity

- (SecConcrete_sec_identity)initWithIdentity:(__SecIdentity *)a3
{
  SecConcrete_sec_identity *v3;
  SecConcrete_sec_identity *v4;
  objc_super v6;

  v3 = (SecConcrete_sec_identity *)a3;
  if (a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)SecConcrete_sec_identity;
    self = -[SecConcrete_sec_identity init](&v6, sel_init);
    if (self)
    {
      v4 = self;
      CFRetain(v3);
      v4->identity = (__SecIdentity *)v3;
      self = v4;
      v3 = self;
    }
    else
    {
      v3 = 0;
    }
  }

  return v3;
}

- (SecConcrete_sec_identity)initWithIdentityAndCertificates:(__SecIdentity *)a3 certificates:(__CFArray *)a4
{
  SecConcrete_sec_identity *v6;
  SecConcrete_sec_identity *v7;
  objc_super v9;

  if (a3
    && (v9.receiver = self,
        v9.super_class = (Class)SecConcrete_sec_identity,
        (self = -[SecConcrete_sec_identity init](&v9, sel_init)) != 0))
  {
    v6 = self;
    CFRetain(a3);
    v6->identity = a3;
    if (a4)
      CFRetain(a4);
    v6->certs = a4;
    self = v6;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (SecConcrete_sec_identity)initWithCertificates:(__CFArray *)a3 signBlock:(id)a4 decryptBlock:(id)a5 queue:(id)a6
{
  id v10;
  id v11;
  id v12;
  SecConcrete_sec_identity *v13;
  void *v14;
  id sign_block;
  void *v16;
  id decrypt_block;
  objc_super v19;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = 0;
  if (a3 && v10 && v11)
  {
    v19.receiver = self;
    v19.super_class = (Class)SecConcrete_sec_identity;
    self = -[SecConcrete_sec_identity init](&v19, sel_init);
    if (self)
    {
      CFRetain(a3);
      self->certs = a3;
      v14 = _Block_copy(v10);
      sign_block = self->sign_block;
      self->sign_block = v14;

      v16 = _Block_copy(v11);
      decrypt_block = self->decrypt_block;
      self->decrypt_block = v16;

      objc_storeStrong((id *)&self->operation_queue, a6);
      self = self;
      v13 = self;
    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (void)dealloc
{
  __SecIdentity *identity;
  __CFArray *certs;
  objc_super v5;

  identity = self->identity;
  if (identity)
  {
    CFRelease(identity);
    self->identity = 0;
    certs = self->certs;
    if (certs)
      CFRelease(certs);
    self->certs = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)SecConcrete_sec_identity;
  -[SecConcrete_sec_identity dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->operation_queue, 0);
  objc_storeStrong(&self->decrypt_block, 0);
  objc_storeStrong(&self->sign_block, 0);
}

@end
