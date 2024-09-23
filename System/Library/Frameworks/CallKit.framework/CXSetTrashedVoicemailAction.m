@implementation CXSetTrashedVoicemailAction

- (CXSetTrashedVoicemailAction)initWithVoicemailUUID:(id)a3 trashed:(BOOL)a4
{
  CXSetTrashedVoicemailAction *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CXSetTrashedVoicemailAction;
  result = -[CXVoicemailAction initWithVoicemailUUID:](&v6, sel_initWithVoicemailUUID_, a3);
  if (result)
    result->_trashed = a4;
  return result;
}

- (id)customDescription
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CXSetTrashedVoicemailAction;
  -[CXVoicemailAction customDescription](&v5, sel_customDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" trashed=%d"), -[CXSetTrashedVoicemailAction isTrashed](self, "isTrashed"));
  return v3;
}

- (void)updateSanitizedCopy:(id)a3 withZone:(_NSZone *)a4
{
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CXSetTrashedVoicemailAction;
  v6 = a3;
  -[CXVoicemailAction updateSanitizedCopy:withZone:](&v7, sel_updateSanitizedCopy_withZone_, v6, a4);
  objc_msgSend(v6, "setTrashed:", -[CXSetTrashedVoicemailAction isTrashed](self, "isTrashed", v7.receiver, v7.super_class));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXSetTrashedVoicemailAction)initWithCoder:(id)a3
{
  id v4;
  CXSetTrashedVoicemailAction *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CXSetTrashedVoicemailAction;
  v5 = -[CXVoicemailAction initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    NSStringFromSelector(sel_isTrashed);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_trashed = objc_msgSend(v4, "decodeBoolForKey:", v6);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _BOOL8 v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CXSetTrashedVoicemailAction;
  v4 = a3;
  -[CXVoicemailAction encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  v5 = -[CXSetTrashedVoicemailAction isTrashed](self, "isTrashed", v7.receiver, v7.super_class);
  NSStringFromSelector(sel_isTrashed);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v5, v6);

}

- (BOOL)isTrashed
{
  return self->_trashed;
}

- (void)setTrashed:(BOOL)a3
{
  self->_trashed = a3;
}

@end
