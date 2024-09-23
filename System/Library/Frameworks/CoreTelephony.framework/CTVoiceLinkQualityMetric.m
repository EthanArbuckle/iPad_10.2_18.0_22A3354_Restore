@implementation CTVoiceLinkQualityMetric

- (CTVoiceLinkQualityMetric)initWithLinkQuality:(id)a3
{
  id v5;
  CTVoiceLinkQualityMetric *v6;
  CTVoiceLinkQualityMetric *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTVoiceLinkQualityMetric;
  v6 = -[CTVoiceLinkQualityMetric init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_linkQuality, a3);

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTVoiceLinkQualityMetric linkQuality](self, "linkQuality");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", linkQuality=%@"), v4);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[CTVoiceLinkQualityMetric linkQuality](self, "linkQuality");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setLinkQuality:", v6);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CTVoiceLinkQualityMetric linkQuality](self, "linkQuality");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("link_quality"));

}

- (CTVoiceLinkQualityMetric)initWithCoder:(id)a3
{
  id v4;
  CTVoiceLinkQualityMetric *v5;
  uint64_t v6;
  NSNumber *linkQuality;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTVoiceLinkQualityMetric;
  v5 = -[CTVoiceLinkQualityMetric init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("link_quality"));
    v6 = objc_claimAutoreleasedReturnValue();
    linkQuality = v5->_linkQuality;
    v5->_linkQuality = (NSNumber *)v6;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSNumber)linkQuality
{
  return self->_linkQuality;
}

- (void)setLinkQuality:(id)a3
{
  objc_storeStrong((id *)&self->_linkQuality, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkQuality, 0);
}

@end
