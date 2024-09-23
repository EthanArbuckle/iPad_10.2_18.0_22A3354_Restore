@implementation AFOutputVoiceDescriptor

- (AFOutputVoiceDescriptor)initWithBuilder:(id)a3
{
  void (**v4)(id, _AFOutputVoiceDescriptorMutation *);
  AFOutputVoiceDescriptor *v5;
  AFOutputVoiceDescriptor *v6;
  _AFOutputVoiceDescriptorMutation *v7;
  void *v8;
  uint64_t v9;
  NSString *localizedDisplay;
  void *v11;
  uint64_t v12;
  NSString *localizedDisplayWithRegion;
  objc_super v15;

  v4 = (void (**)(id, _AFOutputVoiceDescriptorMutation *))a3;
  v15.receiver = self;
  v15.super_class = (Class)AFOutputVoiceDescriptor;
  v5 = -[AFOutputVoiceDescriptor init](&v15, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_AFOutputVoiceDescriptorMutation initWithBase:]([_AFOutputVoiceDescriptorMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_AFOutputVoiceDescriptorMutation isDirty](v7, "isDirty"))
    {
      -[_AFOutputVoiceDescriptorMutation getLocalizedDisplay](v7, "getLocalizedDisplay");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      localizedDisplay = v6->_localizedDisplay;
      v6->_localizedDisplay = (NSString *)v9;

      -[_AFOutputVoiceDescriptorMutation getLocalizedDisplayWithRegion](v7, "getLocalizedDisplayWithRegion");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "copy");
      localizedDisplayWithRegion = v6->_localizedDisplayWithRegion;
      v6->_localizedDisplayWithRegion = (NSString *)v12;

    }
  }

  return v6;
}

- (AFOutputVoiceDescriptor)init
{
  return -[AFOutputVoiceDescriptor initWithBuilder:](self, "initWithBuilder:", 0);
}

- (AFOutputVoiceDescriptor)initWithLocalizedDisplay:(id)a3 localizedDisplayWithRegion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  AFOutputVoiceDescriptor *v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __79__AFOutputVoiceDescriptor_initWithLocalizedDisplay_localizedDisplayWithRegion___block_invoke;
  v12[3] = &unk_1E3A2D668;
  v13 = v6;
  v14 = v7;
  v8 = v7;
  v9 = v6;
  v10 = -[AFOutputVoiceDescriptor initWithBuilder:](self, "initWithBuilder:", v12);

  return v10;
}

- (id)description
{
  return -[AFOutputVoiceDescriptor _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v8.receiver = self;
  v8.super_class = (Class)AFOutputVoiceDescriptor;
  -[AFOutputVoiceDescriptor description](&v8, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {localizedDisplay = %@, localizedDisplayWithRegion = %@}"), v5, self->_localizedDisplay, self->_localizedDisplayWithRegion);

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_localizedDisplay, "hash");
  return -[NSString hash](self->_localizedDisplayWithRegion, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  AFOutputVoiceDescriptor *v4;
  AFOutputVoiceDescriptor *v5;
  NSString *v6;
  NSString *localizedDisplay;
  NSString *v8;
  NSString *localizedDisplayWithRegion;
  BOOL v10;

  v4 = (AFOutputVoiceDescriptor *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[AFOutputVoiceDescriptor localizedDisplay](v5, "localizedDisplay");
      v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      localizedDisplay = self->_localizedDisplay;
      if (localizedDisplay == v6 || -[NSString isEqual:](localizedDisplay, "isEqual:", v6))
      {
        -[AFOutputVoiceDescriptor localizedDisplayWithRegion](v5, "localizedDisplayWithRegion");
        v8 = (NSString *)objc_claimAutoreleasedReturnValue();
        localizedDisplayWithRegion = self->_localizedDisplayWithRegion;
        v10 = localizedDisplayWithRegion == v8
           || -[NSString isEqual:](localizedDisplayWithRegion, "isEqual:", v8);

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (AFOutputVoiceDescriptor)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  AFOutputVoiceDescriptor *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFOutputVoiceDescriptor::localizedDisplay"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFOutputVoiceDescriptor::localizedDisplayWithRegion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[AFOutputVoiceDescriptor initWithLocalizedDisplay:localizedDisplayWithRegion:](self, "initWithLocalizedDisplay:localizedDisplayWithRegion:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *localizedDisplay;
  id v5;

  localizedDisplay = self->_localizedDisplay;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", localizedDisplay, CFSTR("AFOutputVoiceDescriptor::localizedDisplay"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localizedDisplayWithRegion, CFSTR("AFOutputVoiceDescriptor::localizedDisplayWithRegion"));

}

- (NSString)localizedDisplay
{
  return self->_localizedDisplay;
}

- (NSString)localizedDisplayWithRegion
{
  return self->_localizedDisplayWithRegion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedDisplayWithRegion, 0);
  objc_storeStrong((id *)&self->_localizedDisplay, 0);
}

void __79__AFOutputVoiceDescriptor_initWithLocalizedDisplay_localizedDisplayWithRegion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setLocalizedDisplay:", v3);
  objc_msgSend(v4, "setLocalizedDisplayWithRegion:", *(_QWORD *)(a1 + 40));

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
  void (**v4)(id, _AFOutputVoiceDescriptorMutation *);
  _AFOutputVoiceDescriptorMutation *v5;
  AFOutputVoiceDescriptor *v6;
  void *v7;
  uint64_t v8;
  NSString *localizedDisplay;
  void *v10;
  uint64_t v11;
  NSString *localizedDisplayWithRegion;

  v4 = (void (**)(id, _AFOutputVoiceDescriptorMutation *))a3;
  if (v4)
  {
    v5 = -[_AFOutputVoiceDescriptorMutation initWithBase:]([_AFOutputVoiceDescriptorMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_AFOutputVoiceDescriptorMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(AFOutputVoiceDescriptor);
      -[_AFOutputVoiceDescriptorMutation getLocalizedDisplay](v5, "getLocalizedDisplay");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      localizedDisplay = v6->_localizedDisplay;
      v6->_localizedDisplay = (NSString *)v8;

      -[_AFOutputVoiceDescriptorMutation getLocalizedDisplayWithRegion](v5, "getLocalizedDisplayWithRegion");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "copy");
      localizedDisplayWithRegion = v6->_localizedDisplayWithRegion;
      v6->_localizedDisplayWithRegion = (NSString *)v11;

    }
    else
    {
      v6 = (AFOutputVoiceDescriptor *)-[AFOutputVoiceDescriptor copy](self, "copy");
    }

  }
  else
  {
    v6 = (AFOutputVoiceDescriptor *)-[AFOutputVoiceDescriptor copy](self, "copy");
  }

  return v6;
}

@end
