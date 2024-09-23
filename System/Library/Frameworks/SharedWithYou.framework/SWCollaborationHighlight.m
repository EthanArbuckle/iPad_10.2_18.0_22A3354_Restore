@implementation SWCollaborationHighlight

- (SWCollaborationHighlight)initWithSLCollaborationHighlight:(id)a3
{
  id v5;
  SWCollaborationHighlight *v6;
  SWCollaborationHighlight *v7;
  objc_super v9;

  v5 = a3;
  if (v5
    && (v9.receiver = self,
        v9.super_class = (Class)SWCollaborationHighlight,
        v6 = -[SWHighlight initWithSLHighlight:](&v9, sel_initWithSLHighlight_, v5),
        (self = v6) != 0))
  {
    objc_storeStrong((id *)&v6->_slCollaborationHighlight, a3);
    self = self;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (SWCollaborationHighlight)initWithSLCollaborationHighlight:(id)a3 andType:(unsigned __int8)a4
{
  id v7;
  SWCollaborationHighlight *v8;
  SWCollaborationHighlight *v9;
  objc_super v11;

  v7 = a3;
  if (v7
    && (v11.receiver = self,
        v11.super_class = (Class)SWCollaborationHighlight,
        v8 = -[SWHighlight initWithSLHighlight:](&v11, sel_initWithSLHighlight_, v7),
        (self = v8) != 0))
  {
    objc_storeStrong((id *)&v8->_slCollaborationHighlight, a3);
    self->_highlightType = a4;
    self = self;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (SWCollaborationHighlight)initWithCSSearchableItemUniqueIdentifier:(id)a3 forType:(unsigned __int8)a4 error:(id *)a5
{
  uint64_t v6;
  objc_class *v8;
  id v9;
  void *v10;
  SWCollaborationHighlight *v11;

  v6 = a4;
  v8 = (objc_class *)MEMORY[0x1E0DA8838];
  v9 = a3;
  v10 = (void *)objc_msgSend([v8 alloc], "initWithCSSearchableItemUniqueIdentifier:forContentType:error:", v9, +[SWHighlight highlightContentTypeForType:](SWHighlight, "highlightContentTypeForType:", v6), a5);

  v11 = -[SWCollaborationHighlight initWithSLCollaborationHighlight:andType:](self, "initWithSLCollaborationHighlight:andType:", v10, v6);
  return v11;
}

- (SWCollaborationHighlight)initWithCSSearchableItemUniqueIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  SWCollaborationHighlight *v9;

  v6 = a3;
  v7 = objc_msgSend(v6, "containsString:", CFSTR("at_"));
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8838]), "initWithCSSearchableItemUniqueIdentifier:forContentType:error:", v6, v7, a4);

  v9 = -[SWCollaborationHighlight initWithSLCollaborationHighlight:andType:](self, "initWithSLCollaborationHighlight:andType:", v8, v7);
  return v9;
}

- (SWCollaborationHighlight)initWithCSSearchableItem:(id)a3 error:(id *)a4
{
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  SWCollaborationHighlight *v11;

  v6 = (objc_class *)MEMORY[0x1E0DA8838];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithCSSearchableItem:error:", v7, a4);
  objc_msgSend(v7, "uniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "containsString:", CFSTR("at_"));
  v11 = -[SWCollaborationHighlight initWithSLCollaborationHighlight:andType:](self, "initWithSLCollaborationHighlight:andType:", v8, v10);

  return v11;
}

- (SWCollaborationHighlight)initWithDictionary:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  SWCollaborationHighlight *v8;

  v4 = (objc_class *)MEMORY[0x1E0DA8838];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithDictionary:", v5);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ct"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[SWCollaborationHighlight initWithSLCollaborationHighlight:andType:](self, "initWithSLCollaborationHighlight:andType:", v6, objc_msgSend(v7, "containsString:", CFSTR("at_")));
  return v8;
}

+ (id)requiredSpotlightAttributeKeysforHighlightType:(unsigned __int8)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0DA8838], "requiredSpotlightAttributeKeysforHighlightType:", +[SWHighlight highlightContentTypeForType:](SWHighlight, "highlightContentTypeForType:", a3));
}

- (UTType)contentType
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CEC3F8];
  -[SWCollaborationHighlight slCollaborationHighlight](self, "slCollaborationHighlight");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "typeWithIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (UTType *)v5;
}

- (NSString)title
{
  void *v2;
  void *v3;

  -[SWCollaborationHighlight slCollaborationHighlight](self, "slCollaborationHighlight");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)URL
{
  void *v2;
  void *v3;

  -[SWCollaborationHighlight slCollaborationHighlight](self, "slCollaborationHighlight");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resourceURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)attributions
{
  void *v2;
  void *v3;

  -[SWCollaborationHighlight slCollaborationHighlight](self, "slCollaborationHighlight");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)timestamp
{
  void *v2;
  void *v3;

  -[SWCollaborationHighlight slCollaborationHighlight](self, "slCollaborationHighlight");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timestamp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)collaborationIdentifier
{
  void *v2;
  void *v3;

  -[SWCollaborationHighlight slCollaborationHighlight](self, "slCollaborationHighlight");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "collaborationIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSDictionary)earliestAttributionIdentifiers
{
  void *v2;
  void *v3;

  -[SWCollaborationHighlight slCollaborationHighlight](self, "slCollaborationHighlight");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "earliestAttributionIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (SWPersonIdentity)localIdentity
{
  void *v2;
  void *v3;

  -[SWCollaborationHighlight slCollaborationHighlight](self, "slCollaborationHighlight");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SWPersonIdentity *)v3;
}

- (SWPersonIdentityProof)localProofOfInclusion
{
  void *v2;
  void *v3;

  -[SWCollaborationHighlight slCollaborationHighlight](self, "slCollaborationHighlight");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localProofOfInclusion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SWPersonIdentityProof *)v3;
}

- (NSDictionary)handleToIdentityMap
{
  void *v2;
  void *v3;

  -[SWCollaborationHighlight slCollaborationHighlight](self, "slCollaborationHighlight");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleToIdentityMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSString)fileProviderID
{
  void *v2;
  void *v3;

  -[SWCollaborationHighlight slCollaborationHighlight](self, "slCollaborationHighlight");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileProviderID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSDate)creationDate
{
  void *v2;
  void *v3;

  -[SWCollaborationHighlight slCollaborationHighlight](self, "slCollaborationHighlight");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "creationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SWCollaborationHighlight;
  v4 = a3;
  -[SWHighlight encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[SWCollaborationHighlight slCollaborationHighlight](self, "slCollaborationHighlight", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("slc"));

  -[SWCollaborationHighlight collaborationIdentifier](self, "collaborationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("slcid"));

}

- (SWCollaborationHighlight)initWithCoder:(id)a3
{
  id v4;
  SWCollaborationHighlight *v5;
  uint64_t v6;
  SLCollaborationHighlight *slCollaborationHighlight;
  uint64_t v8;
  NSString *collaborationIdentifier;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SWCollaborationHighlight;
  v5 = -[SWHighlight initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("slc"));
    v6 = objc_claimAutoreleasedReturnValue();
    slCollaborationHighlight = v5->_slCollaborationHighlight;
    v5->_slCollaborationHighlight = (SLCollaborationHighlight *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("slcid"));
    v8 = objc_claimAutoreleasedReturnValue();
    collaborationIdentifier = v5->_collaborationIdentifier;
    v5->_collaborationIdentifier = (NSString *)v8;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  -[SWCollaborationHighlight slCollaborationHighlight](self, "slCollaborationHighlight");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithSLCollaborationHighlight:", v5);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[SWCollaborationHighlight slCollaborationHighlight](self, "slCollaborationHighlight");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "slCollaborationHighlight");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v7))
    {
      -[SWCollaborationHighlight collaborationIdentifier](self, "collaborationIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "collaborationIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqualToString:", v9);

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

  return v10;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[SWCollaborationHighlight slCollaborationHighlight](self, "slCollaborationHighlight");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (void)setCollaborationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (SLCollaborationHighlight)slCollaborationHighlight
{
  return self->_slCollaborationHighlight;
}

- (unsigned)highlightType
{
  return self->_highlightType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_slCollaborationHighlight, 0);
  objc_storeStrong((id *)&self->_collaborationIdentifier, 0);
}

@end
