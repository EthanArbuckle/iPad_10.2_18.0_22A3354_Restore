@implementation NTKSnapshotLoadState

- (NTKSnapshotLoadState)initWithStatus:(unint64_t)a3 image:(id)a4 error:(id)a5
{
  id v9;
  id v10;
  NTKSnapshotLoadState *v11;
  NTKSnapshotLoadState *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)NTKSnapshotLoadState;
  v11 = -[NTKSnapshotLoadState init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_status = a3;
    objc_storeStrong((id *)&v11->_image, a4);
    objc_storeStrong((id *)&v12->_error, a5);
  }

  return v12;
}

+ (id)pending
{
  return -[NTKSnapshotLoadState initWithStatus:image:error:]([NTKSnapshotLoadState alloc], "initWithStatus:image:error:", 0, 0, 0);
}

+ (id)loading
{
  return -[NTKSnapshotLoadState initWithStatus:image:error:]([NTKSnapshotLoadState alloc], "initWithStatus:image:error:", 1, 0, 0);
}

+ (id)successWithImage:(id)a3
{
  id v3;
  NTKSnapshotLoadState *v4;

  v3 = a3;
  v4 = -[NTKSnapshotLoadState initWithStatus:image:error:]([NTKSnapshotLoadState alloc], "initWithStatus:image:error:", 2, v3, 0);

  return v4;
}

+ (id)failureWithError:(id)a3
{
  id v3;
  NTKSnapshotLoadState *v4;

  v3 = a3;
  v4 = -[NTKSnapshotLoadState initWithStatus:image:error:]([NTKSnapshotLoadState alloc], "initWithStatus:image:error:", 3, 0, v3);

  return v4;
}

- (unint64_t)status
{
  return self->_status;
}

- (UIImage)image
{
  return self->_image;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
