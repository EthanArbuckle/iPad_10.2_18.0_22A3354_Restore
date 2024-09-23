@implementation IVROptionStreamData

- (IVROptionStreamData)init
{
  IVROptionStreamData *v2;
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IVROptionStreamData;
  v2 = -[IVROptionStreamData init](&v5, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDBCE70]);
    -[IVROptionStreamData setOptionStreamData:](v2, "setOptionStreamData:", v3);

    -[IVROptionStreamData setType:](v2, "setType:", 4);
  }
  return v2;
}

- (NSDictionary)optionStreamData
{
  return self->_optionStreamData;
}

- (void)setOptionStreamData:(id)a3
{
  objc_storeStrong((id *)&self->_optionStreamData, a3);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optionStreamData, 0);
}

@end
