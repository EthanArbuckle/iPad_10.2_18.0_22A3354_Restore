@implementation APMescalSigning

- (APMescalSigning)init
{
  APMescalSigning *v2;
  APMescalSigningRequestor *v3;
  APMescalSigningRequestor *requesterObject;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)APMescalSigning;
  v2 = -[APMescalSigning init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(APMescalSigningRequestor);
    requesterObject = v2->_requesterObject;
    v2->_requesterObject = v3;

  }
  return v2;
}

- (void)signatureForData:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  const char *v14;
  uint64_t v15;
  double v16;
  double v17;
  id v18;

  v6 = a4;
  v7 = a3;
  objc_msgSend_requesterObject(self, v8, v9, v10, v11, v12, v13);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_signatureForData_completion_(v18, v14, (uint64_t)v7, (uint64_t)v6, v15, v16, v17);

}

- (id)signatureForData:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  void *v17;

  v4 = a3;
  objc_msgSend_requesterObject(self, v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_signatureForData_(v11, v12, (uint64_t)v4, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (void)signatureForData:(id)a3 waitTime:(double)a4 completion:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  const char *v16;
  uint64_t v17;
  double v18;
  id v19;

  v8 = a5;
  v9 = a3;
  objc_msgSend_requesterObject(self, v10, v11, v12, v13, v14, v15);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_signatureForData_waitTime_completion_(v19, v16, (uint64_t)v9, (uint64_t)v8, v17, a4, v18);

}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  double v5;
  double v6;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  objc_super v15;

  objc_msgSend_requesterObject(self, a2, v2, v3, v4, v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_finished(v8, v9, v10, v11, v12, v13, v14);

  v15.receiver = self;
  v15.super_class = (Class)APMescalSigning;
  -[APMescalSigning dealloc](&v15, sel_dealloc);
}

- (APMescalSigningRequestor)requesterObject
{
  return self->_requesterObject;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requesterObject, 0);
}

@end
