@implementation ASKCapacityData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_totalDiskCapacity, 0);
  objc_storeStrong((id *)&self->_totalDataAvailable, 0);
  objc_storeStrong((id *)&self->_totalDataCapacity, 0);
  objc_storeStrong((id *)&self->_totalSystemAvailable, 0);
  objc_storeStrong((id *)&self->_totalSystemCapacity, 0);
}

- (NSNumber)totalSystemCapacity
{
  return self->_totalSystemCapacity;
}

- (NSNumber)totalSystemAvailable
{
  return self->_totalSystemAvailable;
}

- (NSNumber)totalDiskCapacity
{
  return self->_totalDiskCapacity;
}

- (NSNumber)totalDataCapacity
{
  return self->_totalDataCapacity;
}

- (NSNumber)totalDataAvailable
{
  return self->_totalDataAvailable;
}

- (ASKCapacityData)init
{
  ASKCapacityData *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)ASKCapacityData;
  v2 = -[ASKCapacityData init](&v20, sel_init);
  if (v2)
  {
    v3 = (void *)MGCopyAnswer();
    objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0DE2CD0]);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    if (v4)
      v6 = (void *)v4;
    else
      v6 = &unk_1E9E4B8B0;
    -[ASKCapacityData setTotalSystemCapacity:](v2, "setTotalSystemCapacity:", v6);
    objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0DE2CC8]);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v7)
      v9 = (void *)v7;
    else
      v9 = &unk_1E9E4B8B0;
    -[ASKCapacityData setTotalSystemAvailable:](v2, "setTotalSystemAvailable:", v9);
    objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0DE2CB8]);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10)
      v12 = (void *)v10;
    else
      v12 = &unk_1E9E4B8B0;
    -[ASKCapacityData setTotalDataCapacity:](v2, "setTotalDataCapacity:", v12);
    objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0DE2CB0]);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v13)
      v15 = (void *)v13;
    else
      v15 = &unk_1E9E4B8B0;
    -[ASKCapacityData setTotalDataAvailable:](v2, "setTotalDataAvailable:", v15);
    objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0DE2CC0]);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    if (v16)
      v18 = (void *)v16;
    else
      v18 = &unk_1E9E4B8C8;
    -[ASKCapacityData setTotalDiskCapacity:](v2, "setTotalDiskCapacity:", v18);

  }
  return v2;
}

- (void)setTotalSystemCapacity:(id)a3
{
  objc_storeStrong((id *)&self->_totalSystemCapacity, a3);
}

- (void)setTotalSystemAvailable:(id)a3
{
  objc_storeStrong((id *)&self->_totalSystemAvailable, a3);
}

- (void)setTotalDiskCapacity:(id)a3
{
  objc_storeStrong((id *)&self->_totalDiskCapacity, a3);
}

- (void)setTotalDataCapacity:(id)a3
{
  objc_storeStrong((id *)&self->_totalDataCapacity, a3);
}

- (void)setTotalDataAvailable:(id)a3
{
  objc_storeStrong((id *)&self->_totalDataAvailable, a3);
}

@end
