@implementation CXSetSharingScreenCallAction

- (CXSetSharingScreenCallAction)initWithCallUUID:(id)a3 sharingScreen:(BOOL)a4
{
  CXSetSharingScreenCallAction *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CXSetSharingScreenCallAction;
  result = -[CXCallAction initWithCallUUID:](&v6, sel_initWithCallUUID_, a3);
  if (result)
    result->_sharingScreen = a4;
  return result;
}

- (id)customDescription
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CXSetSharingScreenCallAction;
  -[CXCallAction customDescription](&v6, sel_customDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" sharingScreen=%d"), -[CXSetSharingScreenCallAction isSharingScreen](self, "isSharingScreen"));
  -[CXSetSharingScreenCallAction attributes](self, "attributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" attributes=%@"), v4);

  return v3;
}

- (void)updateSanitizedCopy:(id)a3 withZone:(_NSZone *)a4
{
  id v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CXSetSharingScreenCallAction;
  v6 = a3;
  -[CXCallAction updateSanitizedCopy:withZone:](&v9, sel_updateSanitizedCopy_withZone_, v6, a4);
  objc_msgSend(v6, "setSharingScreen:", -[CXSetSharingScreenCallAction isSharingScreen](self, "isSharingScreen", v9.receiver, v9.super_class));
  -[CXSetSharingScreenCallAction attributes](self, "attributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v6, "setAttributes:", v8);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXSetSharingScreenCallAction)initWithCoder:(id)a3
{
  id v4;
  CXSetSharingScreenCallAction *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  CXScreenShareAttributes *attributes;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CXSetSharingScreenCallAction;
  v5 = -[CXCallAction initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    NSStringFromSelector(sel_isSharingScreen);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_sharingScreen = objc_msgSend(v4, "decodeBoolForKey:", v6);

    v7 = objc_opt_class();
    NSStringFromSelector(sel_attributes);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    attributes = v5->_attributes;
    v5->_attributes = (CXScreenShareAttributes *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CXSetSharingScreenCallAction;
  v4 = a3;
  -[CXCallAction encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  v5 = -[CXSetSharingScreenCallAction isSharingScreen](self, "isSharingScreen", v9.receiver, v9.super_class);
  NSStringFromSelector(sel_isSharingScreen);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v5, v6);

  -[CXSetSharingScreenCallAction attributes](self, "attributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_attributes);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

}

- (BOOL)isSharingScreen
{
  return self->_sharingScreen;
}

- (void)setSharingScreen:(BOOL)a3
{
  self->_sharingScreen = a3;
}

- (CXScreenShareAttributes)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_attributes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);
}

@end
