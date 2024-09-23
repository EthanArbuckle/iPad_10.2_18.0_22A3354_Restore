@implementation NTKFaceCollectionUpdate

+ (id)updateWithType:(int64_t)a3 uuid:(id)a4 block:(id)a5
{
  id v8;
  id v9;
  _QWORD *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;

  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init((Class)a1);
  v11 = (void *)v10[2];
  v10[1] = a3;
  v10[2] = v8;
  v12 = v8;

  v13 = objc_msgSend(v9, "copy");
  v14 = (void *)v10[3];
  v10[3] = v13;

  return v10;
}

- (int64_t)type
{
  return self->_type;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (id)block
{
  return self->_block;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
