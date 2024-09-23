@implementation HKWorkoutMirroringDataUpdate

- (HKWorkoutMirroringDataUpdate)initWithData:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  HKWorkoutMirroringDataUpdate *v8;
  uint64_t v9;
  NSUUID *UUID;
  uint64_t v11;
  NSData *data;
  uint64_t v13;
  id completionHandler;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HKWorkoutMirroringDataUpdate;
  v8 = -[HKWorkoutMirroringDataUpdate init](&v16, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v9 = objc_claimAutoreleasedReturnValue();
    UUID = v8->_UUID;
    v8->_UUID = (NSUUID *)v9;

    v11 = objc_msgSend(v6, "copy");
    data = v8->_data;
    v8->_data = (NSData *)v11;

    v13 = objc_msgSend(v7, "copy");
    completionHandler = v8->_completionHandler;
    v8->_completionHandler = (id)v13;

  }
  return v8;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (NSData)data
{
  return self->_data;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end
