@implementation MADVIVisualSearchGatingDomainInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADVIVisualSearchGatingDomainInfo)initWithDomain:(id)a3 label:(id)a4 glyphName:(id)a5 hasFocalPoint:(BOOL)a6 focalPoint:(CGPoint)a7 displayLabel:(id)a8 displayMessage:(id)a9
{
  CGFloat y;
  CGFloat x;
  id v17;
  id v18;
  id v19;
  id v20;
  MADVIVisualSearchGatingDomainInfo *v21;
  MADVIVisualSearchGatingDomainInfo *v22;
  id v25;
  objc_super v26;

  y = a7.y;
  x = a7.x;
  v25 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a8;
  v20 = a9;
  v26.receiver = self;
  v26.super_class = (Class)MADVIVisualSearchGatingDomainInfo;
  v21 = -[MADVIVisualSearchGatingDomainInfo init](&v26, sel_init);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_domain, a3);
    objc_storeStrong((id *)&v22->_label, a4);
    objc_storeStrong((id *)&v22->_glyphName, a5);
    v22->_hasFocalPoint = a6;
    v22->_focalPoint.x = x;
    v22->_focalPoint.y = y;
    objc_storeStrong((id *)&v22->_displayLabel, a8);
    objc_storeStrong((id *)&v22->_displayMessage, a9);
  }

  return v22;
}

- (MADVIVisualSearchGatingDomainInfo)initWithCoder:(id)a3
{
  id v4;
  MADVIVisualSearchGatingDomainInfo *v5;
  uint64_t v6;
  NSString *domain;
  uint64_t v8;
  NSString *label;
  uint64_t v10;
  NSString *glyphName;
  CGFloat v12;
  CGFloat v13;
  uint64_t v14;
  NSString *displayLabel;
  uint64_t v16;
  NSString *displayMessage;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MADVIVisualSearchGatingDomainInfo;
  v5 = -[MADVIVisualSearchGatingDomainInfo init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Domain"));
    v6 = objc_claimAutoreleasedReturnValue();
    domain = v5->_domain;
    v5->_domain = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Label"));
    v8 = objc_claimAutoreleasedReturnValue();
    label = v5->_label;
    v5->_label = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("GlyphName"));
    v10 = objc_claimAutoreleasedReturnValue();
    glyphName = v5->_glyphName;
    v5->_glyphName = (NSString *)v10;

    v5->_hasFocalPoint = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HasFocalPoint"));
    objc_msgSend(v4, "decodePointForKey:", CFSTR("FocalPoint"));
    v5->_focalPoint.x = v12;
    v5->_focalPoint.y = v13;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DisplayLabel"));
    v14 = objc_claimAutoreleasedReturnValue();
    displayLabel = v5->_displayLabel;
    v5->_displayLabel = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DisplayMessage"));
    v16 = objc_claimAutoreleasedReturnValue();
    displayMessage = v5->_displayMessage;
    v5->_displayMessage = (NSString *)v16;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *domain;
  id v5;

  domain = self->_domain;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", domain, CFSTR("Domain"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_label, CFSTR("Label"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_glyphName, CFSTR("GlyphName"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasFocalPoint, CFSTR("HasFocalPoint"));
  objc_msgSend(v5, "encodePoint:forKey:", CFSTR("FocalPoint"), self->_focalPoint.x, self->_focalPoint.y);
  objc_msgSend(v5, "encodeObject:forKey:", self->_displayLabel, CFSTR("DisplayLabel"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_displayMessage, CFSTR("DisplayMessage"));

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p, "), v5, self);

  objc_msgSend(v3, "appendFormat:", CFSTR("domain: %@, "), self->_domain);
  objc_msgSend(v3, "appendFormat:", CFSTR("label: %@, "), self->_label);
  objc_msgSend(v3, "appendFormat:", CFSTR("glyphName: %@, "), self->_glyphName);
  objc_msgSend(v3, "appendFormat:", CFSTR("hasFocalPoint: %d, "), self->_hasFocalPoint);
  objc_msgSend(v3, "appendFormat:", CFSTR("focalPoint: (%0.2f, %0.2f), "), *(_QWORD *)&self->_focalPoint.x, *(_QWORD *)&self->_focalPoint.y);
  objc_msgSend(v3, "appendFormat:", CFSTR("displayLabel: %@, "), self->_displayLabel);
  objc_msgSend(v3, "appendFormat:", CFSTR("displayMessage: %@>"), self->_displayMessage);
  return v3;
}

- (NSString)domain
{
  return self->_domain;
}

- (NSString)label
{
  return self->_label;
}

- (NSString)glyphName
{
  return self->_glyphName;
}

- (BOOL)hasFocalPoint
{
  return self->_hasFocalPoint;
}

- (CGPoint)focalPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_focalPoint.x;
  y = self->_focalPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (NSString)displayLabel
{
  return self->_displayLabel;
}

- (NSString)displayMessage
{
  return self->_displayMessage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayMessage, 0);
  objc_storeStrong((id *)&self->_displayLabel, 0);
  objc_storeStrong((id *)&self->_glyphName, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

@end
