@implementation CRKSetMuteStateRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRKSetMuteStateRequest;
  v4 = a3;
  -[CATTaskRequest encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CRKSetMuteStateRequest shouldMute](self, "shouldMute", v6.receiver, v6.super_class));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("mute"));

}

- (CRKSetMuteStateRequest)initWithCoder:(id)a3
{
  id v4;
  CRKSetMuteStateRequest *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRKSetMuteStateRequest;
  v5 = -[CATTaskRequest initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mute"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(&v5->super._handlesNotifications + 1) = objc_msgSend(v6, "BOOLValue");

  }
  return v5;
}

- (BOOL)shouldMute
{
  return *(&self->super._handlesNotifications + 1);
}

- (void)setMute:(BOOL)a3
{
  *(&self->super._handlesNotifications + 1) = a3;
}

@end
