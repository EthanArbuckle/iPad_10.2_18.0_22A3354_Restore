@implementation SWPerson

- (SWPerson)initWithHandle:(NSString *)handle identity:(SWPersonIdentity *)identity displayName:(NSString *)displayName thumbnailImageData:(NSData *)thumbnailImageData
{
  NSString *v10;
  unint64_t v11;
  NSString *v12;
  NSData *v13;
  id SLPersonClass;
  void *v15;
  id slPerson;
  SWPersonIdentity *v17;
  NSObject *p_super;
  objc_super v20;

  v10 = handle;
  v11 = identity;
  v12 = displayName;
  v13 = thumbnailImageData;
  if (!((unint64_t)v10 | v11))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("either handle or identity must be non-nil"));
  SLPersonClass = getSLPersonClass();
  if (!objc_msgSend(SLPersonClass, "instancesRespondToSelector:", sel_initWithHandle_displayName_)
    || !objc_msgSend(SLPersonClass, "instancesRespondToSelector:", sel_handle)
    || !objc_msgSend(SLPersonClass, "instancesRespondToSelector:", sel_displayName)
    || !objc_msgSend(SLPersonClass, "instancesRespondToSelector:", sel_contact)
    || (objc_msgSend(SLPersonClass, "instancesRespondToSelector:", sel_thumbnailImageData) & 1) == 0)
  {
    SWFrameworkLogHandle();
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      -[SWPerson initWithHandle:identity:displayName:thumbnailImageData:].cold.1(p_super);
    goto LABEL_12;
  }
  v20.receiver = self;
  v20.super_class = (Class)SWPerson;
  self = -[SWPerson init](&v20, sel_init);
  if (self)
  {
    v15 = (void *)objc_msgSend(objc_alloc((Class)SLPersonClass), "initWithHandle:displayName:", v10, v12);
    slPerson = self->_slPerson;
    self->_slPerson = v15;

    objc_storeStrong((id *)&self->_customThumbnailImageData, thumbnailImageData);
    v17 = (SWPersonIdentity *)(id)v11;
    p_super = &self->_identity->super;
    self->_identity = v17;
LABEL_12:

  }
  return self;
}

- (SWPerson)initWithHandle:(id)a3 displayName:(id)a4 thumbnailImageData:(id)a5
{
  return -[SWPerson initWithHandle:identity:displayName:thumbnailImageData:](self, "initWithHandle:identity:displayName:thumbnailImageData:", a3, 0, a4, a5);
}

- (id)handle
{
  void *v2;
  void *v3;

  -[SWPerson slPerson](self, "slPerson");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)displayName
{
  void *v2;
  void *v3;

  -[SWPerson slPerson](self, "slPerson");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)contact
{
  void *v2;
  void *v3;

  -[SWPerson slPerson](self, "slPerson");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)thumbnailImageData
{
  void *v3;
  void *v4;
  void *v5;

  -[SWPerson customThumbnailImageData](self, "customThumbnailImageData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SWPerson customThumbnailImageData](self, "customThumbnailImageData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SWPerson slPerson](self, "slPerson");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "thumbnailImageData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
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
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[SWPerson slPerson](self, "slPerson");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_slPerson);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[SWPerson customThumbnailImageData](self, "customThumbnailImageData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_customThumbnailImageData);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  -[SWPerson identity](self, "identity");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_identity);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, v9);

}

- (SWPerson)initWithCoder:(id)a3
{
  id v4;
  SWPerson *v5;
  id SLPersonClass;
  void *v7;
  uint64_t v8;
  id slPerson;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSData *customThumbnailImageData;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  SWPersonIdentity *identity;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SWPerson;
  v5 = -[SWPerson init](&v19, sel_init);
  if (v5)
  {
    SLPersonClass = getSLPersonClass();
    NSStringFromSelector(sel_slPerson);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", SLPersonClass, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    slPerson = v5->_slPerson;
    v5->_slPerson = (id)v8;

    v10 = objc_opt_class();
    NSStringFromSelector(sel_customThumbnailImageData);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    customThumbnailImageData = v5->_customThumbnailImageData;
    v5->_customThumbnailImageData = (NSData *)v12;

    v14 = objc_opt_class();
    NSStringFromSelector(sel_identity);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    identity = v5->_identity;
    v5->_identity = (SWPersonIdentity *)v16;

  }
  return v5;
}

- (id)slPerson
{
  return self->_slPerson;
}

- (void)setSlPerson:(id)a3
{
  objc_storeStrong(&self->_slPerson, a3);
}

- (NSData)customThumbnailImageData
{
  return self->_customThumbnailImageData;
}

- (SWPersonIdentity)identity
{
  return self->_identity;
}

- (void)setIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_identity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_customThumbnailImageData, 0);
  objc_storeStrong(&self->_slPerson, 0);
}

- (void)initWithHandle:(os_log_t)log identity:displayName:thumbnailImageData:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18B618000, log, OS_LOG_TYPE_ERROR, "SLPerson soft link did not have expected selectors. Failing to initialize SWPerson.", v1, 2u);
}

@end
