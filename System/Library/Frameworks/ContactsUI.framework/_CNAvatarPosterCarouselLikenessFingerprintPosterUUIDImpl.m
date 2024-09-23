@implementation _CNAvatarPosterCarouselLikenessFingerprintPosterUUIDImpl

- (_CNAvatarPosterCarouselLikenessFingerprintPosterUUIDImpl)initWithPosterUUID:(id)a3
{
  id v5;
  _CNAvatarPosterCarouselLikenessFingerprintPosterUUIDImpl *v6;
  _CNAvatarPosterCarouselLikenessFingerprintPosterUUIDImpl *v7;
  _CNAvatarPosterCarouselLikenessFingerprintPosterUUIDImpl *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CNAvatarPosterCarouselLikenessFingerprintPosterUUIDImpl;
  v6 = -[_CNAvatarPosterCarouselLikenessFingerprintPosterUUIDImpl init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_UUID, a3);
    v8 = v7;
  }

  return v7;
}

- (NSString)description
{
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("UUID"), self->_UUID);
  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (BOOL)isEqual:(id)a3
{
  _CNAvatarPosterCarouselLikenessFingerprintPosterUUIDImpl *v4;
  NSUUID *UUID;
  unint64_t v6;
  BOOL v7;

  v4 = (_CNAvatarPosterCarouselLikenessFingerprintPosterUUIDImpl *)a3;
  v7 = 1;
  if (self != v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (UUID = self->_UUID,
          v6 = (unint64_t)-[_CNAvatarPosterCarouselLikenessFingerprintPosterUUIDImpl UUID](v4, "UUID"),
          (unint64_t)UUID | v6)
      && !-[NSUUID isEqual:](UUID, "isEqual:", v6))
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  return objc_msgSend(MEMORY[0x1E0D13A78], "objectHash:", self->_UUID) + 527;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_UUID, CFSTR("posterUUID"));
}

- (_CNAvatarPosterCarouselLikenessFingerprintPosterUUIDImpl)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _CNAvatarPosterCarouselLikenessFingerprintPosterUUIDImpl *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("posterUUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_CNAvatarPosterCarouselLikenessFingerprintPosterUUIDImpl initWithPosterUUID:](self, "initWithPosterUUID:", v5);
  return v6;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
  objc_storeStrong((id *)&self->_UUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUID, 0);
}

+ (id)fingerprintForPosterConfiguration:(id)a3
{
  id v3;
  _CNAvatarPosterCarouselLikenessFingerprintPosterUUIDImpl *v4;
  void *v5;
  _CNAvatarPosterCarouselLikenessFingerprintPosterUUIDImpl *v6;

  v3 = a3;
  v4 = [_CNAvatarPosterCarouselLikenessFingerprintPosterUUIDImpl alloc];
  objc_msgSend(v3, "serverUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_CNAvatarPosterCarouselLikenessFingerprintPosterUUIDImpl initWithPosterUUID:](v4, "initWithPosterUUID:", v5);
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
