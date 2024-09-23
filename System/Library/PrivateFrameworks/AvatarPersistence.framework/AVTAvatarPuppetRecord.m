@implementation AVTAvatarPuppetRecord

+ (id)matchingIdentifierTest:(id)a3
{
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48__AVTAvatarPuppetRecord_matchingIdentifierTest___block_invoke;
  v7[3] = &unk_24DD31BF0;
  v8 = v3;
  v4 = v3;
  v5 = (void *)MEMORY[0x22074B1E8](v7);

  return v5;
}

uint64_t __48__AVTAvatarPuppetRecord_matchingIdentifierTest___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "puppetName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (AVTAvatarPuppetRecord)initWithPuppetName:(id)a3
{
  id v4;
  AVTAvatarPuppetRecord *v5;
  uint64_t v6;
  NSString *puppetName;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AVTAvatarPuppetRecord;
  v5 = -[AVTAvatarPuppetRecord init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    puppetName = v5->_puppetName;
    v5->_puppetName = (NSString *)v6;

  }
  return v5;
}

- (BOOL)isEditable
{
  return 0;
}

- (BOOL)isPuppet
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  AVTAvatarPuppetRecord *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v5 = (AVTAvatarPuppetRecord *)a3;
  if (v5 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[AVTAvatarPuppetRecord identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6
        || (-[AVTAvatarPuppetRecord identifier](v5, "identifier"),
            (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[AVTAvatarPuppetRecord identifier](self, "identifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[AVTAvatarPuppetRecord identifier](v5, "identifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v7, "isEqual:", v8);

        if (v6)
        {
LABEL_11:

          goto LABEL_12;
        }
      }
      else
      {
        v9 = 1;
      }

      goto LABEL_11;
    }
    v9 = 0;
  }
LABEL_12:

  return v9;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[AVTAvatarPuppetRecord identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AVTAvatarPuppetRecord)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  AVTAvatarPuppetRecord *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[AVTAvatarPuppetRecord initWithPuppetName:](self, "initWithPuppetName:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AVTAvatarPuppetRecord identifier](self, "identifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  AVTAvatarPuppetRecord *v4;
  void *v5;
  AVTAvatarPuppetRecord *v6;

  v4 = [AVTAvatarPuppetRecord alloc];
  -[AVTAvatarPuppetRecord puppetName](self, "puppetName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[AVTAvatarPuppetRecord initWithPuppetName:](v4, "initWithPuppetName:", v5);

  return v6;
}

- (NSString)puppetName
{
  return self->_puppetName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_puppetName, 0);
}

@end
