@implementation AVTSerializedAvatarRecord

- (AVTSerializedAvatarRecord)initWithAvatarRecord:(id)a3
{
  id v5;
  AVTSerializedAvatarRecord *v6;
  AVTSerializedAvatarRecord *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AVTSerializedAvatarRecord;
  v6 = -[AVTSerializedAvatarRecord init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_avatarRecord, a3);
    if ((objc_msgSend(v5, "conformsToProtocol:", &unk_255105858) & 1) == 0)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("AVTTypeMismatchException"), CFSTR("Unexpected object protocol for %@"), v5);
    -[AVTSerializedAvatarRecord setIsPuppet:](v7, "setIsPuppet:", objc_msgSend(v5, "isPuppet"));
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AVTSerializedAvatarRecord)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  AVTSerializedAvatarRecord *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isPuppet"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("avatarRecord"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[AVTSerializedAvatarRecord initWithAvatarRecord:](self, "initWithAvatarRecord:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[AVTSerializedAvatarRecord isPuppet](self, "isPuppet"), CFSTR("isPuppet"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_avatarRecord, CFSTR("avatarRecord"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  AVTSerializedAvatarRecord *v4;
  void *v5;
  AVTSerializedAvatarRecord *v6;

  v4 = [AVTSerializedAvatarRecord alloc];
  -[AVTSerializedAvatarRecord avatarRecord](self, "avatarRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[AVTSerializedAvatarRecord initWithAvatarRecord:](v4, "initWithAvatarRecord:", v5);

  return v6;
}

- (AVTAvatarRecord)avatarRecord
{
  return self->_avatarRecord;
}

- (BOOL)isPuppet
{
  return self->_isPuppet;
}

- (void)setIsPuppet:(BOOL)a3
{
  self->_isPuppet = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarRecord, 0);
}

@end
