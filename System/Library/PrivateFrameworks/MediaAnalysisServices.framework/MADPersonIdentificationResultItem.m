@implementation MADPersonIdentificationResultItem

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADPersonIdentificationResultItem)initWithPersonIdentifier:(id)a3 personName:(id)a4 mdID:(id)a5 verified:(BOOL)a6 boundingBox:(CGRect)a7 andConfidence:(float)a8
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v18;
  id v19;
  id v20;
  MADPersonIdentificationResultItem *v21;
  MADPersonIdentificationResultItem *v22;
  objc_super v24;

  height = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v18 = a3;
  v19 = a4;
  v20 = a5;
  v24.receiver = self;
  v24.super_class = (Class)MADPersonIdentificationResultItem;
  v21 = -[MADPersonIdentificationResultItem init](&v24, sel_init);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_personIdentifier, a3);
    objc_storeStrong((id *)&v22->_personName, a4);
    objc_storeStrong((id *)&v22->_mdID, a5);
    v22->_verified = a6;
    v22->_boundingBox.origin.x = x;
    v22->_boundingBox.origin.y = y;
    v22->_boundingBox.size.width = width;
    v22->_boundingBox.size.height = height;
    v22->_confidence = a8;
  }

  return v22;
}

- (MADPersonIdentificationResultItem)initWithCoder:(id)a3
{
  id v4;
  MADPersonIdentificationResultItem *v5;
  uint64_t v6;
  NSString *personIdentifier;
  uint64_t v8;
  NSString *personName;
  uint64_t v10;
  NSString *mdID;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  float v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MADPersonIdentificationResultItem;
  v5 = -[MADPersonIdentificationResultItem init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PersonIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    personIdentifier = v5->_personIdentifier;
    v5->_personIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PersonName"));
    v8 = objc_claimAutoreleasedReturnValue();
    personName = v5->_personName;
    v5->_personName = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MegadomeIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    mdID = v5->_mdID;
    v5->_mdID = (NSString *)v10;

    v5->_verified = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("Verified"));
    objc_msgSend(v4, "decodeRectForKey:", CFSTR("BoundingBox"));
    v5->_boundingBox.origin.x = v12;
    v5->_boundingBox.origin.y = v13;
    v5->_boundingBox.size.width = v14;
    v5->_boundingBox.size.height = v15;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("Confidence"));
    v5->_confidence = v16;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", self->_personIdentifier, CFSTR("PersonIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_personName, CFSTR("PersonName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mdID, CFSTR("MegadomeIdentifier"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_verified, CFSTR("Verified"));
  objc_msgSend(v5, "encodeRect:forKey:", CFSTR("BoundingBox"), self->_boundingBox.origin.x, self->_boundingBox.origin.y, self->_boundingBox.size.width, self->_boundingBox.size.height);
  *(float *)&v4 = self->_confidence;
  objc_msgSend(v5, "encodeFloat:forKey:", CFSTR("Confidence"), v4);

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p, "), v5, self);

  objc_msgSend(v3, "appendFormat:", CFSTR("person-identifier: %@, "), self->_personIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("person-name: %@, "), self->_personName);
  objc_msgSend(v3, "appendFormat:", CFSTR("megadome-identifier: %@, "), self->_mdID);
  if (self->_verified)
    v6 = CFSTR("verified");
  else
    v6 = CFSTR("unverified");
  objc_msgSend(v3, "appendFormat:", CFSTR("verified: %@, "), v6);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{{x:%.*f, y:%.*f}, {width:%.*f, height:%.*f}} "), 2, *(_QWORD *)&self->_boundingBox.origin.x, 2, *(_QWORD *)&self->_boundingBox.origin.y, 2, *(_QWORD *)&self->_boundingBox.size.width, 2, *(_QWORD *)&self->_boundingBox.size.height);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("bounding-box: %@, "), v7);

  objc_msgSend(v3, "appendFormat:", CFSTR("confidence: %.*f>"), 2, self->_confidence);
  return v3;
}

- (NSString)mdID
{
  return self->_mdID;
}

- (NSString)personIdentifier
{
  return self->_personIdentifier;
}

- (NSString)personName
{
  return self->_personName;
}

- (BOOL)verified
{
  return self->_verified;
}

- (CGRect)boundingBox
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_boundingBox.origin.x;
  y = self->_boundingBox.origin.y;
  width = self->_boundingBox.size.width;
  height = self->_boundingBox.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (float)confidence
{
  return self->_confidence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personName, 0);
  objc_storeStrong((id *)&self->_personIdentifier, 0);
  objc_storeStrong((id *)&self->_mdID, 0);
}

@end
