@implementation AVTAnimojiDescriptor

- (AVTAnimojiDescriptor)initWithName:(id)a3
{
  id v4;
  AVTAnimojiDescriptor *v5;
  uint64_t v6;
  NSString *name;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AVTAnimojiDescriptor;
  v5 = -[AVTAnimojiDescriptor init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    name = v5->_name;
    v5->_name = (NSString *)v6;

  }
  return v5;
}

- (AVTAnimojiDescriptor)initWithDictionaryRepresentation:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  AVTAnimojiDescriptor *v11;
  char v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v13 = 0;
  objc_msgSend(v6, "avt_objectForKey:ofClass:didFail:error:", CFSTR("animoji"), objc_opt_class(), &v13, a4);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v13)
    v9 = 1;
  else
    v9 = v7 == 0;
  if (v9)
  {
    avt_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v6;
      _os_log_impl(&dword_1DD1FA000, v10, OS_LOG_TYPE_DEFAULT, "can't unarchive animoji name from: %@", buf, 0xCu);
    }

    v11 = 0;
  }
  else
  {
    self = -[AVTAnimojiDescriptor initWithName:](self, "initWithName:", v7);
    v11 = self;
  }

  return v11;
}

- (AVTAnimojiDescriptor)initWithAnimoji:(id)a3
{
  void *v4;
  AVTAnimojiDescriptor *v5;

  objc_msgSend(a3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[AVTAnimojiDescriptor initWithName:](self, "initWithName:", v4);

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVTAnimojiDescriptor;
  v4 = a3;
  -[AVTAvatarDescriptor encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_name, CFSTR("name"), v5.receiver, v5.super_class);

}

- (AVTAnimojiDescriptor)initWithCoder:(id)a3
{
  id v4;
  AVTAnimojiDescriptor *v5;
  uint64_t v6;
  NSString *name;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AVTAnimojiDescriptor;
  v5 = -[AVTAvatarDescriptor initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

  }
  return v5;
}

+ (unsigned)classIdentifier
{
  return 1;
}

- (void)encodeInDictionaryRepresentation:(id)a3
{
  objc_msgSend(a3, "setObject:forKeyedSubscript:", self->_name, CFSTR("animoji"));
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, %@>"), v5, self, self->_name);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
