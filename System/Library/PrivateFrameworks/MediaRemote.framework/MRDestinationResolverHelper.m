@implementation MRDestinationResolverHelper

- (void)destinationResolver:(id)a3 originDidChange:(id)a4
{
  id v6;
  void (**callback)(id, void *, _QWORD);
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  callback = (void (**)(id, void *, _QWORD))self->_callback;
  if (callback && !self->_level)
  {
    objc_msgSend(v9, "destination");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    callback[2](callback, v8, 0);

  }
}

- (void)destinationResolver:(id)a3 endpointDidChange:(id)a4
{
  id v6;
  void (**callback)(id, void *, _QWORD);
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  callback = (void (**)(id, void *, _QWORD))self->_callback;
  if (callback && self->_level == 1)
  {
    objc_msgSend(v9, "destination");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    callback[2](callback, v8, 0);

  }
}

- (void)destinationResolverDestinationDidInvalidate:(id)a3
{
  void (**callback)(id, id, _QWORD);
  id v4;

  callback = (void (**)(id, id, _QWORD))self->_callback;
  if (callback)
  {
    objc_msgSend(a3, "destination");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    callback[2](callback, v4, 0);

  }
}

- (void)destinationResolver:(id)a3 playerPathDidChange:(id)a4
{
  id v5;
  void (**callback)(id, void *, _QWORD);
  void *v7;
  id v8;

  v5 = a3;
  callback = (void (**)(id, void *, _QWORD))self->_callback;
  if (callback && (self->_level | 2) == 2)
  {
    v8 = v5;
    objc_msgSend(v5, "destination");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    callback[2](callback, v7, 0);

    v5 = v8;
  }

}

- (void)destinationResolver:(id)a3 didFailWithError:(id)a4
{
  void (**callback)(id, id, id);
  id v6;
  id v7;

  callback = (void (**)(id, id, id))self->_callback;
  if (callback)
  {
    v6 = a4;
    objc_msgSend(a3, "destination");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    callback[2](callback, v7, v6);

  }
}

- (int64_t)level
{
  return self->_level;
}

- (void)setLevel:(int64_t)a3
{
  self->_level = a3;
}

- (id)callback
{
  return self->_callback;
}

- (void)setCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
}

@end
