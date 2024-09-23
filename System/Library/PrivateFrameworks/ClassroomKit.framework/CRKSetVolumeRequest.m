@implementation CRKSetVolumeRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKSetVolumeRequest)initWithCoder:(id)a3
{
  id v4;
  CRKSetVolumeRequest *v5;
  void *v6;
  double v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKSetVolumeRequest;
  v5 = -[CATTaskRequest initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("volume"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValue");
    v5->_volume = v7;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRKSetVolumeRequest;
  v4 = a3;
  -[CATTaskRequest encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  v5 = (void *)MEMORY[0x24BDD16E0];
  -[CRKSetVolumeRequest volume](self, "volume", v7.receiver, v7.super_class);
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("volume"));

}

- (double)volume
{
  return self->_volume;
}

- (void)setVolume:(double)a3
{
  self->_volume = a3;
}

@end
