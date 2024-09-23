@implementation CNMutableGroup

- (id)copy
{
  return -[CNGroup initWithGroup:]([CNGroup alloc], "initWithGroup:", self);
}

- (NSString)identifier
{
  return self->super._identifier;
}

- (void)setIdentifier:(id)a3
{
  NSString *v4;
  NSString *identifier;

  if (self->super._identifier != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    identifier = self->super._identifier;
    self->super._identifier = v4;

  }
}

- (NSString)name
{
  return self->super._name;
}

- (void)setName:(NSString *)name
{
  NSString *v4;
  NSString *v5;

  if (self->super._name != name)
  {
    v4 = (NSString *)-[NSString copy](name, "copy");
    v5 = self->super._name;
    self->super._name = v4;

  }
}

- (int)iOSLegacyIdentifier
{
  return self->super._iOSLegacyIdentifier;
}

- (void)setIOSLegacyIdentifier:(int)a3
{
  self->super._iOSLegacyIdentifier = a3;
}

- (NSDate)creationDate
{
  return self->super._creationDate;
}

- (void)setCreationDate:(id)a3
{
  NSDate *v4;
  NSDate *creationDate;

  if (self->super._creationDate != a3)
  {
    v4 = (NSDate *)objc_msgSend(a3, "copy");
    creationDate = self->super._creationDate;
    self->super._creationDate = v4;

  }
}

- (NSDate)modificationDate
{
  return self->super._modificationDate;
}

- (void)setModificationDate:(id)a3
{
  NSDate *v4;
  NSDate *modificationDate;

  if (self->super._modificationDate != a3)
  {
    v4 = (NSDate *)objc_msgSend(a3, "copy");
    modificationDate = self->super._modificationDate;
    self->super._modificationDate = v4;

  }
}

- (NSString)externalIdentifier
{
  return self->super._externalIdentifier;
}

- (void)setExternalIdentifier:(id)a3
{
  NSString *v4;
  NSString *externalIdentifier;

  if (self->super._externalIdentifier != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    externalIdentifier = self->super._externalIdentifier;
    self->super._externalIdentifier = v4;

  }
}

- (NSData)externalRepresentation
{
  return self->super._externalRepresentation;
}

- (void)setExternalRepresentation:(id)a3
{
  NSData *v4;
  NSData *externalRepresentation;

  if (self->super._externalRepresentation != a3)
  {
    v4 = (NSData *)objc_msgSend(a3, "copy");
    externalRepresentation = self->super._externalRepresentation;
    self->super._externalRepresentation = v4;

  }
}

- (NSString)externalModificationTag
{
  return self->super._externalModificationTag;
}

- (void)setExternalModificationTag:(id)a3
{
  NSString *v4;
  NSString *externalModificationTag;

  if (self->super._externalModificationTag != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    externalModificationTag = self->super._externalModificationTag;
    self->super._externalModificationTag = v4;

  }
}

- (NSString)externalUUID
{
  return self->super._externalUUID;
}

- (void)setExternalUUID:(id)a3
{
  NSString *v4;
  NSString *externalUUID;

  if (self->super._externalUUID != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    externalUUID = self->super._externalUUID;
    self->super._externalUUID = v4;

  }
}

- (void)adoptValuesFromAndSetSnapshot:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  if (v12)
  {
    objc_msgSend(v12, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNMutableGroup setName:](self, "setName:", v4);

    objc_msgSend(v12, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNMutableGroup setIdentifier:](self, "setIdentifier:", v5);

    -[CNMutableGroup setIOSLegacyIdentifier:](self, "setIOSLegacyIdentifier:", objc_msgSend(v12, "iOSLegacyIdentifier"));
    objc_msgSend(v12, "creationDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNMutableGroup setCreationDate:](self, "setCreationDate:", v6);

    objc_msgSend(v12, "modificationDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNMutableGroup setModificationDate:](self, "setModificationDate:", v7);

    objc_msgSend(v12, "externalIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNMutableGroup setExternalIdentifier:](self, "setExternalIdentifier:", v8);

    objc_msgSend(v12, "externalRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNMutableGroup setExternalRepresentation:](self, "setExternalRepresentation:", v9);

    objc_msgSend(v12, "externalModificationTag");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNMutableGroup setExternalModificationTag:](self, "setExternalModificationTag:", v10);

    objc_msgSend(v12, "externalUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNMutableGroup setExternalUUID:](self, "setExternalUUID:", v11);

  }
  -[CNMutableGroup setSnapshot:](self, "setSnapshot:", v12);

}

- (void)setSnapshot:(id)a3
{
  CNGroup *snapshot;
  id v5;
  CNGroup *v6;
  CNGroup *v7;

  snapshot = self->super._snapshot;
  if (snapshot != a3)
  {
    self->super._snapshot = 0;
    v5 = a3;

    v6 = (CNGroup *)objc_msgSend(v5, "copy");
    v7 = self->super._snapshot;
    self->super._snapshot = v6;

  }
}

- (id)freeze
{
  objc_class *v3;

  v3 = (objc_class *)objc_opt_class();
  object_setClass(self, v3);
  return self;
}

- (id)freezeWithSelfAsSnapshot
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNMutableGroup setSnapshot:](self, "setSnapshot:", v3);

  return -[CNMutableGroup freeze](self, "freeze");
}

@end
