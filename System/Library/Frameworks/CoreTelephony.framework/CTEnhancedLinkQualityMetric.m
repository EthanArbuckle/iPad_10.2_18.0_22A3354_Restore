@implementation CTEnhancedLinkQualityMetric

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CTEnhancedLinkQualityMetric enhancedLinkQuality](self, "enhancedLinkQuality");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("link_quality"));

}

- (NSData)enhancedLinkQuality
{
  return self->_enhancedLinkQuality;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enhancedLinkQuality, 0);
}

- (CTEnhancedLinkQualityMetric)initWithCoder:(id)a3
{
  id v4;
  CTEnhancedLinkQualityMetric *v5;
  uint64_t v6;
  NSData *enhancedLinkQuality;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTEnhancedLinkQualityMetric;
  v5 = -[CTEnhancedLinkQualityMetric init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("link_quality"));
    v6 = objc_claimAutoreleasedReturnValue();
    enhancedLinkQuality = v5->_enhancedLinkQuality;
    v5->_enhancedLinkQuality = (NSData *)v6;

  }
  return v5;
}

- (CTEnhancedLinkQualityMetric)initWithEnhancedLinkQuality:(id)a3
{
  id v5;
  CTEnhancedLinkQualityMetric *v6;
  CTEnhancedLinkQualityMetric *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTEnhancedLinkQualityMetric;
  v6 = -[CTEnhancedLinkQualityMetric init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_enhancedLinkQuality, a3);

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTEnhancedLinkQualityMetric enhancedLinkQuality](self, "enhancedLinkQuality");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", enhancedLinkQuality=%@"), v4);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[CTEnhancedLinkQualityMetric enhancedLinkQuality](self, "enhancedLinkQuality");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setEnhancedLinkQuality:", v6);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setEnhancedLinkQuality:(id)a3
{
  objc_storeStrong((id *)&self->_enhancedLinkQuality, a3);
}

@end
