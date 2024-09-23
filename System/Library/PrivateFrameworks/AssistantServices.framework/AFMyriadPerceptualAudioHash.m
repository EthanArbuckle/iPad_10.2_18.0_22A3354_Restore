@implementation AFMyriadPerceptualAudioHash

- (AFMyriadPerceptualAudioHash)initWithBuilder:(id)a3
{
  void (**v4)(id, _AFMyriadPerceptualAudioHashMutation *);
  AFMyriadPerceptualAudioHash *v5;
  AFMyriadPerceptualAudioHash *v6;
  _AFMyriadPerceptualAudioHashMutation *v7;
  void *v8;
  uint64_t v9;
  NSData *data;
  objc_super v12;

  v4 = (void (**)(id, _AFMyriadPerceptualAudioHashMutation *))a3;
  v12.receiver = self;
  v12.super_class = (Class)AFMyriadPerceptualAudioHash;
  v5 = -[AFMyriadPerceptualAudioHash init](&v12, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_AFMyriadPerceptualAudioHashMutation initWithBase:]([_AFMyriadPerceptualAudioHashMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_AFMyriadPerceptualAudioHashMutation isDirty](v7, "isDirty"))
    {
      -[_AFMyriadPerceptualAudioHashMutation getData](v7, "getData");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      data = v6->_data;
      v6->_data = (NSData *)v9;

    }
  }

  return v6;
}

- (AFMyriadPerceptualAudioHash)init
{
  return -[AFMyriadPerceptualAudioHash initWithBuilder:](self, "initWithBuilder:", 0);
}

- (AFMyriadPerceptualAudioHash)initWithData:(id)a3
{
  id v4;
  id v5;
  AFMyriadPerceptualAudioHash *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__AFMyriadPerceptualAudioHash_initWithData___block_invoke;
  v8[3] = &unk_1E3A2E378;
  v9 = v4;
  v5 = v4;
  v6 = -[AFMyriadPerceptualAudioHash initWithBuilder:](self, "initWithBuilder:", v8);

  return v6;
}

- (id)description
{
  return -[AFMyriadPerceptualAudioHash _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v8.receiver = self;
  v8.super_class = (Class)AFMyriadPerceptualAudioHash;
  -[AFMyriadPerceptualAudioHash description](&v8, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {data = (%llu bytes)}"), v5, -[NSData length](self->_data, "length"));

  return v6;
}

- (unint64_t)hash
{
  return -[NSData hash](self->_data, "hash");
}

- (BOOL)isEqual:(id)a3
{
  AFMyriadPerceptualAudioHash *v4;
  NSData *v5;
  NSData *data;
  BOOL v7;

  v4 = (AFMyriadPerceptualAudioHash *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[AFMyriadPerceptualAudioHash data](v4, "data");
      v5 = (NSData *)objc_claimAutoreleasedReturnValue();
      data = self->_data;
      v7 = data == v5 || -[NSData isEqual:](data, "isEqual:", v5);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (AFMyriadPerceptualAudioHash)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  AFMyriadPerceptualAudioHash *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFMyriadPerceptualAudioHash::data"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[AFMyriadPerceptualAudioHash initWithData:](self, "initWithData:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_data, CFSTR("AFMyriadPerceptualAudioHash::data"));
}

- (NSData)data
{
  return self->_data;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

uint64_t __44__AFMyriadPerceptualAudioHash_initWithData___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setData:", *(_QWORD *)(a1 + 32));
}

+ (id)newWithBuilder:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBuilder:", v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  void (**v4)(id, _AFMyriadPerceptualAudioHashMutation *);
  _AFMyriadPerceptualAudioHashMutation *v5;
  AFMyriadPerceptualAudioHash *v6;
  void *v7;
  uint64_t v8;
  NSData *data;

  v4 = (void (**)(id, _AFMyriadPerceptualAudioHashMutation *))a3;
  if (v4)
  {
    v5 = -[_AFMyriadPerceptualAudioHashMutation initWithBase:]([_AFMyriadPerceptualAudioHashMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_AFMyriadPerceptualAudioHashMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(AFMyriadPerceptualAudioHash);
      -[_AFMyriadPerceptualAudioHashMutation getData](v5, "getData");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      data = v6->_data;
      v6->_data = (NSData *)v8;

    }
    else
    {
      v6 = (AFMyriadPerceptualAudioHash *)-[AFMyriadPerceptualAudioHash copy](self, "copy");
    }

  }
  else
  {
    v6 = (AFMyriadPerceptualAudioHash *)-[AFMyriadPerceptualAudioHash copy](self, "copy");
  }

  return v6;
}

@end
