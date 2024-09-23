@implementation MKFeaturePayload

- (MKFeaturePayload)init
{
  MKFeaturePayload *v2;
  MKFeaturePayload *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MKFeaturePayload;
  v2 = -[MKFeaturePayload init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[MKFeaturePayload setState:](v2, "setState:", CFSTR("?"));
    objc_msgSend(MEMORY[0x24BDD1518], "zero");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKFeaturePayload setImportElapsedTime:](v3, "setImportElapsedTime:", v4);

  }
  return v3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

- (unint64_t)totalElapsedTime
{
  return self->_totalElapsedTime;
}

- (void)setTotalElapsedTime:(unint64_t)a3
{
  self->_totalElapsedTime = a3;
}

- (NSDecimalNumber)importElapsedTime
{
  return self->_importElapsedTime;
}

- (void)setImportElapsedTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_importElapsedTime, 0);
}

@end
