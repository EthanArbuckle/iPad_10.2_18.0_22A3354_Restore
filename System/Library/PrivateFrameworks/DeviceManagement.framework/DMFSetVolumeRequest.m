@implementation DMFSetVolumeRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFSetVolumeRequest)initWithCoder:(id)a3
{
  id v4;
  DMFSetVolumeRequest *v5;
  void *v6;
  double v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DMFSetVolumeRequest;
  v5 = -[CATTaskRequest initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("volume"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValue");
    *(float *)&v7 = v7;
    *((_DWORD *)&v5->super.super._handlesNotifications + 1) = LODWORD(v7);

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
  v7.super_class = (Class)DMFSetVolumeRequest;
  v4 = a3;
  -[CATTaskRequest encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[DMFSetVolumeRequest volume](self, "volume", v7.receiver, v7.super_class);
  objc_msgSend(v5, "numberWithFloat:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("volume"));

}

- (float)volume
{
  return *((float *)&self->super.super._handlesNotifications + 1);
}

- (void)setVolume:(float)a3
{
  *((float *)&self->super.super._handlesNotifications + 1) = a3;
}

@end
