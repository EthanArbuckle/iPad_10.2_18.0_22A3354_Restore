@implementation _GEOETARemoteProvider

+ (id)provderWithWillSendRequest:(id)a3 finished:(id)a4 networkActivity:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  const char *v15;
  void *v16;
  SEL v17;
  SEL v18;
  SEL v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_alloc_init((Class)a1);
  v16 = v14;
  if (v14)
  {
    objc_setProperty_nonatomic_copy(v14, v15, v11, 24);
    objc_setProperty_nonatomic_copy(v16, v17, v10, 16);
    objc_setProperty_nonatomic_copy(v16, v18, v12, 32);
    objc_setProperty_nonatomic_copy(v16, v19, v13, 40);
  }

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong(&self->_networkActivityHandler, 0);
  objc_storeStrong(&self->_finishedHandler, 0);
  objc_storeStrong(&self->_willSendRequestHandler, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
