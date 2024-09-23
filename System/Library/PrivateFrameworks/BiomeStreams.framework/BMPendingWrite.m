@implementation BMPendingWrite

+ (id)pendingWriteWithEvent:(id)a3 timestamp:(double)a4
{
  id v7;
  id v8;
  double *v9;

  v7 = a3;
  v8 = objc_alloc_init((Class)a1);
  v9 = (double *)v8;
  if (v8)
  {
    objc_storeStrong((id *)v8 + 1, a3);
    v9[2] = a4;
  }

  return v9;
}

- (id)event
{
  return self->_event;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_event, 0);
}

@end
