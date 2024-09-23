@implementation MPSectionedIdentifierListEntryPositionKey

- (MPSectionedIdentifierListEntryPositionKey)initWithCoder:(id)a3
{
  id v4;
  MPSectionedIdentifierListEntryPositionKey *v5;
  uint64_t v6;
  NSString *deviceIdentifier;
  uint64_t v8;
  NSString *generation;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MPSectionedIdentifierListEntryPositionKey;
  v5 = -[MPSectionedIdentifierListEntryPositionKey init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("did"));
    v6 = objc_claimAutoreleasedReturnValue();
    deviceIdentifier = v5->_deviceIdentifier;
    v5->_deviceIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("gen"));
    v8 = objc_claimAutoreleasedReturnValue();
    generation = v5->_generation;
    v5->_generation = (NSString *)v8;

  }
  return v5;
}

+ (id)positionKeyWithDeviceIdentifier:(id)a3 generation:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init((Class)a1);
  v9 = objc_msgSend(v7, "copy");

  v10 = (void *)v8[1];
  v8[1] = v9;

  v11 = objc_msgSend(v6, "copy");
  v12 = (void *)v8[2];
  v8[2] = v11;

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)generation
{
  return self->_generation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generation, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
}

- (int64_t)compare:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[MPSectionedIdentifierListEntryPositionKey generation](self, "generation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "generation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "compare:", v6);

  if (!v7)
  {
    -[MPSectionedIdentifierListEntryPositionKey deviceIdentifier](self, "deviceIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deviceIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "compare:", v9);

  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *deviceIdentifier;
  id v5;

  deviceIdentifier = self->_deviceIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", deviceIdentifier, CFSTR("did"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_generation, CFSTR("gen"));

}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setGeneration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

@end
