@implementation AVTAvatarRecordSerializer

+ (id)dataFromAvatarRecord:(id)a3
{
  id v3;
  AVTSerializedAvatarRecord *v4;
  void *v5;
  uint64_t v7;

  v3 = a3;
  v4 = -[AVTSerializedAvatarRecord initWithAvatarRecord:]([AVTSerializedAvatarRecord alloc], "initWithAvatarRecord:", v3);

  v7 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)avatarRecordFromData:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v8;

  v3 = (void *)MEMORY[0x24BDD1620];
  v4 = a3;
  v8 = 0;
  objc_msgSend(v3, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v4, &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "avatarRecord");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
