@implementation AFEndpointInfo

- (AFEndpointInfo)initWithBuilder:(id)a3
{
  void (**v4)(id, _AFEndpointInfoMutation *);
  AFEndpointInfo *v5;
  AFEndpointInfo *v6;
  _AFEndpointInfoMutation *v7;
  void *v8;
  uint64_t v9;
  NSString *identifier;
  void *v11;
  uint64_t v12;
  NSString *mediaRouteIdentifier;
  objc_super v15;

  v4 = (void (**)(id, _AFEndpointInfoMutation *))a3;
  v15.receiver = self;
  v15.super_class = (Class)AFEndpointInfo;
  v5 = -[AFEndpointInfo init](&v15, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_AFEndpointInfoMutation initWithBase:]([_AFEndpointInfoMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_AFEndpointInfoMutation isDirty](v7, "isDirty"))
    {
      -[_AFEndpointInfoMutation getIdentifier](v7, "getIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      identifier = v6->_identifier;
      v6->_identifier = (NSString *)v9;

      -[_AFEndpointInfoMutation getMediaRouteIdentifier](v7, "getMediaRouteIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "copy");
      mediaRouteIdentifier = v6->_mediaRouteIdentifier;
      v6->_mediaRouteIdentifier = (NSString *)v12;

    }
  }

  return v6;
}

- (AFEndpointInfo)init
{
  return -[AFEndpointInfo initWithBuilder:](self, "initWithBuilder:", 0);
}

- (AFEndpointInfo)initWithIdentifier:(id)a3 mediaRouteIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  AFEndpointInfo *v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __58__AFEndpointInfo_initWithIdentifier_mediaRouteIdentifier___block_invoke;
  v12[3] = &unk_1E3A2DDA0;
  v13 = v6;
  v14 = v7;
  v8 = v7;
  v9 = v6;
  v10 = -[AFEndpointInfo initWithBuilder:](self, "initWithBuilder:", v12);

  return v10;
}

- (NSString)description
{
  return (NSString *)-[AFEndpointInfo _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v8.receiver = self;
  v8.super_class = (Class)AFEndpointInfo;
  -[AFEndpointInfo description](&v8, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {identifier = %@, mediaRouteIdentifier = %@}"), v5, self->_identifier, self->_mediaRouteIdentifier);

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_identifier, "hash");
  return -[NSString hash](self->_mediaRouteIdentifier, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  AFEndpointInfo *v4;
  AFEndpointInfo *v5;
  NSString *v6;
  NSString *identifier;
  NSString *v8;
  NSString *mediaRouteIdentifier;
  BOOL v10;

  v4 = (AFEndpointInfo *)a3;
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
      -[AFEndpointInfo identifier](v5, "identifier");
      v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      identifier = self->_identifier;
      if (identifier == v6 || -[NSString isEqual:](identifier, "isEqual:", v6))
      {
        -[AFEndpointInfo mediaRouteIdentifier](v5, "mediaRouteIdentifier");
        v8 = (NSString *)objc_claimAutoreleasedReturnValue();
        mediaRouteIdentifier = self->_mediaRouteIdentifier;
        v10 = mediaRouteIdentifier == v8 || -[NSString isEqual:](mediaRouteIdentifier, "isEqual:", v8);

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

- (AFEndpointInfo)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  AFEndpointInfo *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFEndpointInfo::identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFEndpointInfo::mediaRouteIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[AFEndpointInfo initWithIdentifier:mediaRouteIdentifier:](self, "initWithIdentifier:mediaRouteIdentifier:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("AFEndpointInfo::identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mediaRouteIdentifier, CFSTR("AFEndpointInfo::mediaRouteIdentifier"));

}

- (AFEndpointInfo)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  id v6;
  AFEndpointInfo *v7;
  void *v8;
  id v9;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(v4, "objectForKey:", CFSTR("identifier"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;

    objc_msgSend(v4, "objectForKey:", CFSTR("mediaRouteIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;

    self = -[AFEndpointInfo initWithIdentifier:mediaRouteIdentifier:](self, "initWithIdentifier:mediaRouteIdentifier:", v6, v9);
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)buildDictionaryRepresentation
{
  id v3;
  void *v4;
  NSString *identifier;
  NSString *mediaRouteIdentifier;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKey:", identifier, CFSTR("identifier"));
  mediaRouteIdentifier = self->_mediaRouteIdentifier;
  if (mediaRouteIdentifier)
    objc_msgSend(v4, "setObject:forKey:", mediaRouteIdentifier, CFSTR("mediaRouteIdentifier"));
  v7 = (void *)objc_msgSend(v4, "copy");

  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)mediaRouteIdentifier
{
  return self->_mediaRouteIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaRouteIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

void __58__AFEndpointInfo_initWithIdentifier_mediaRouteIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setIdentifier:", v3);
  objc_msgSend(v4, "setMediaRouteIdentifier:", *(_QWORD *)(a1 + 40));

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
  void (**v4)(id, _AFEndpointInfoMutation *);
  _AFEndpointInfoMutation *v5;
  AFEndpointInfo *v6;
  void *v7;
  uint64_t v8;
  NSString *identifier;
  void *v10;
  uint64_t v11;
  NSString *mediaRouteIdentifier;

  v4 = (void (**)(id, _AFEndpointInfoMutation *))a3;
  if (v4)
  {
    v5 = -[_AFEndpointInfoMutation initWithBase:]([_AFEndpointInfoMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_AFEndpointInfoMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(AFEndpointInfo);
      -[_AFEndpointInfoMutation getIdentifier](v5, "getIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      identifier = v6->_identifier;
      v6->_identifier = (NSString *)v8;

      -[_AFEndpointInfoMutation getMediaRouteIdentifier](v5, "getMediaRouteIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "copy");
      mediaRouteIdentifier = v6->_mediaRouteIdentifier;
      v6->_mediaRouteIdentifier = (NSString *)v11;

    }
    else
    {
      v6 = (AFEndpointInfo *)-[AFEndpointInfo copy](self, "copy");
    }

  }
  else
  {
    v6 = (AFEndpointInfo *)-[AFEndpointInfo copy](self, "copy");
  }

  return v6;
}

@end
