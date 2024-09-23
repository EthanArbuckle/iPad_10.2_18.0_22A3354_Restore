@implementation NSSWatchFace

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *faceIdentifier;
  id v5;

  faceIdentifier = self->_faceIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", faceIdentifier, CFSTR("faceIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_faceDisplayName, CFSTR("faceDisplayName"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isActive, CFSTR("isActive"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_selectedFocusModeIdentifiers, CFSTR("selectedFocusModeIdentifiers"));

}

- (NSSWatchFace)initWithCoder:(id)a3
{
  id v4;
  NSSWatchFace *v5;
  uint64_t v6;
  NSUUID *faceIdentifier;
  uint64_t v8;
  NSString *faceDisplayName;
  uint64_t v10;
  NSArray *selectedFocusModeIdentifiers;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NSSWatchFace;
  v5 = -[NSSWatchFace init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("faceIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    faceIdentifier = v5->_faceIdentifier;
    v5->_faceIdentifier = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("faceDisplayName"));
    v8 = objc_claimAutoreleasedReturnValue();
    faceDisplayName = v5->_faceDisplayName;
    v5->_faceDisplayName = (NSString *)v8;

    v5->_isActive = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isActive"));
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("selectedFocusModeIdentifiers"));
    v10 = objc_claimAutoreleasedReturnValue();
    selectedFocusModeIdentifiers = v5->_selectedFocusModeIdentifiers;
    v5->_selectedFocusModeIdentifiers = (NSArray *)v10;

  }
  return v5;
}

- (NSUUID)faceIdentifier
{
  return self->_faceIdentifier;
}

- (void)setFaceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_faceIdentifier, a3);
}

- (NSString)faceDisplayName
{
  return self->_faceDisplayName;
}

- (void)setFaceDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_faceDisplayName, a3);
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void)setIsActive:(BOOL)a3
{
  self->_isActive = a3;
}

- (NSArray)selectedFocusModeIdentifiers
{
  return self->_selectedFocusModeIdentifiers;
}

- (void)setSelectedFocusModeIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_selectedFocusModeIdentifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedFocusModeIdentifiers, 0);
  objc_storeStrong((id *)&self->_faceDisplayName, 0);
  objc_storeStrong((id *)&self->_faceIdentifier, 0);
}

@end
