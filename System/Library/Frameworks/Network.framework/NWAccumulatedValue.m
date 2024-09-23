@implementation NWAccumulatedValue

- (id)callback
{
  return self->_callback;
}

- (NWAccumulation)accumulation
{
  return self->_accumulation;
}

- (NSObject)object
{
  return self->_object;
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (id)description
{
  void *v2;
  void *v3;

  -[NWAccumulatedValue accumulation](self, "accumulation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)snapshot
{
  NWAccumulatedValue *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(NWAccumulatedValue);
  -[NWAccumulatedValue keyPath](self, "keyPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWAccumulatedValue setKeyPath:](v3, "setKeyPath:", v4);

  -[NWAccumulatedValue accumulation](self, "accumulation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "snapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWAccumulatedValue setAccumulation:](v3, "setAccumulation:", v6);

  return v3;
}

- (void)setObject:(id)a3
{
  objc_storeStrong((id *)&self->_object, a3);
}

- (void)setKeyPath:(id)a3
{
  objc_storeStrong((id *)&self->_keyPath, a3);
}

- (void)setAccumulation:(id)a3
{
  objc_storeStrong((id *)&self->_accumulation, a3);
}

- (void)setCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_accumulation, 0);
  objc_storeStrong((id *)&self->_keyPath, 0);
  objc_storeStrong((id *)&self->_object, 0);
}

@end
