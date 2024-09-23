@implementation DMFFetchProfilesRequest

- (DMFFetchProfilesRequest)init
{
  DMFFetchProfilesRequest *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DMFFetchProfilesRequest;
  result = -[CATTaskRequest init](&v3, sel_init);
  if (result)
    result->_filterFlags = 0;
  return result;
}

+ (Class)allowlistedClassForResultObject
{
  return (Class)objc_opt_class();
}

+ (id)permittedPlatforms
{
  return &unk_1E6EF49E8;
}

+ (BOOL)isPermittedOnSystemConnection
{
  return 1;
}

+ (BOOL)isPermittedOnUserConnection
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFFetchProfilesRequest)initWithCoder:(id)a3
{
  id v4;
  DMFFetchProfilesRequest *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DMFFetchProfilesRequest;
  v5 = -[CATTaskRequest initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("filterFlags"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_filterFlags = objc_msgSend(v6, "unsignedIntegerValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DMFFetchProfilesRequest;
  v4 = a3;
  -[CATTaskRequest encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[DMFFetchProfilesRequest filterFlags](self, "filterFlags", v6.receiver, v6.super_class));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("filterFlags"));

}

- (unint64_t)filterFlags
{
  return self->_filterFlags;
}

- (void)setFilterFlags:(unint64_t)a3
{
  self->_filterFlags = a3;
}

@end
