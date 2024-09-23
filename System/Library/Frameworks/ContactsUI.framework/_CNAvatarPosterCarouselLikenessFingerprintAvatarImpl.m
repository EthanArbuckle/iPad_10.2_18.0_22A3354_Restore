@implementation _CNAvatarPosterCarouselLikenessFingerprintAvatarImpl

- (_CNAvatarPosterCarouselLikenessFingerprintAvatarImpl)initWithVisualFingerprint:(id)a3 sourceType:(int64_t)a4
{
  id v7;
  _CNAvatarPosterCarouselLikenessFingerprintAvatarImpl *v8;
  _CNAvatarPosterCarouselLikenessFingerprintAvatarImpl *v9;
  _CNAvatarPosterCarouselLikenessFingerprintAvatarImpl *v10;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_CNAvatarPosterCarouselLikenessFingerprintAvatarImpl;
  v8 = -[_CNAvatarPosterCarouselLikenessFingerprintAvatarImpl init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_visualFingerprint, a3);
    v9->_sourceType = a4;
    v10 = v9;
  }

  return v9;
}

- (NSString)description
{
  void *v3;
  id v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("visualFingerprint"), self->_visualFingerprint);
  v5 = (id)objc_msgSend(v3, "appendName:unsignedInteger:", CFSTR("sourceType"), self->_sourceType);
  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (BOOL)isEqual:(id)a3
{
  _CNAvatarPosterCarouselLikenessFingerprintAvatarImpl *v4;
  void *v5;
  CNVisualFingerprint *visualFingerprint;
  void *v7;
  char v8;

  v4 = (_CNAvatarPosterCarouselLikenessFingerprintAvatarImpl *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = (void *)MEMORY[0x1E0C97400];
      visualFingerprint = self->_visualFingerprint;
      -[_CNAvatarPosterCarouselLikenessFingerprintAvatarImpl visualFingerprint](v4, "visualFingerprint");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CNAvatarPosterCarouselLikenessFingerprintAvatarImpl similarityThreshold](self, "similarityThreshold");
      v8 = objc_msgSend(v5, "isFingerprint:similarTo:threshold:", visualFingerprint, v7);

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (double)similarityThreshold
{
  unint64_t v2;
  double result;

  v2 = -[_CNAvatarPosterCarouselLikenessFingerprintAvatarImpl sourceType](self, "sourceType");
  result = 2.0;
  if (v2 <= 4)
    return dbl_18AF8BA40[v2];
  return result;
}

- (unint64_t)hash
{
  if (self->_visualFingerprint)
    return 528;
  else
    return 527;
}

- (void)encodeWithCoder:(id)a3
{
  CNVisualFingerprint *visualFingerprint;
  id v5;

  visualFingerprint = self->_visualFingerprint;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", visualFingerprint, CFSTR("visualFingerprint"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_sourceType, CFSTR("sourceType"));

}

- (_CNAvatarPosterCarouselLikenessFingerprintAvatarImpl)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  _CNAvatarPosterCarouselLikenessFingerprintAvatarImpl *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("visualFingerprint"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("sourceType"));

  v7 = -[_CNAvatarPosterCarouselLikenessFingerprintAvatarImpl initWithVisualFingerprint:sourceType:](self, "initWithVisualFingerprint:sourceType:", v5, v6);
  return v7;
}

- (CNVisualFingerprint)visualFingerprint
{
  return self->_visualFingerprint;
}

- (void)setVisualFingerprint:(id)a3
{
  objc_storeStrong((id *)&self->_visualFingerprint, a3);
}

- (int64_t)sourceType
{
  return self->_sourceType;
}

- (void)setSourceType:(int64_t)a3
{
  self->_sourceType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualFingerprint, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
