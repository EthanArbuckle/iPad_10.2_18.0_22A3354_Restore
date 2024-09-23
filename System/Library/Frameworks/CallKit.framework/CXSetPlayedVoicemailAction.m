@implementation CXSetPlayedVoicemailAction

- (CXSetPlayedVoicemailAction)initWithVoicemailUUID:(id)a3 played:(BOOL)a4
{
  CXSetPlayedVoicemailAction *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CXSetPlayedVoicemailAction;
  result = -[CXVoicemailAction initWithVoicemailUUID:](&v6, sel_initWithVoicemailUUID_, a3);
  if (result)
    result->_played = a4;
  return result;
}

- (id)customDescription
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CXSetPlayedVoicemailAction;
  -[CXVoicemailAction customDescription](&v5, sel_customDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" played=%d"), -[CXSetPlayedVoicemailAction isPlayed](self, "isPlayed"));
  return v3;
}

- (void)updateSanitizedCopy:(id)a3 withZone:(_NSZone *)a4
{
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CXSetPlayedVoicemailAction;
  v6 = a3;
  -[CXVoicemailAction updateSanitizedCopy:withZone:](&v7, sel_updateSanitizedCopy_withZone_, v6, a4);
  objc_msgSend(v6, "setPlayed:", -[CXSetPlayedVoicemailAction isPlayed](self, "isPlayed", v7.receiver, v7.super_class));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXSetPlayedVoicemailAction)initWithCoder:(id)a3
{
  id v4;
  CXSetPlayedVoicemailAction *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CXSetPlayedVoicemailAction;
  v5 = -[CXVoicemailAction initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    NSStringFromSelector(sel_isPlayed);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_played = objc_msgSend(v4, "decodeBoolForKey:", v6);

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
  v7.super_class = (Class)CXSetPlayedVoicemailAction;
  v4 = a3;
  -[CXVoicemailAction encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  v5 = -[CXSetPlayedVoicemailAction isPlayed](self, "isPlayed", v7.receiver, v7.super_class);
  NSStringFromSelector(sel_isPlayed);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v5, v6);

}

- (BOOL)isPlayed
{
  return self->_played;
}

- (void)setPlayed:(BOOL)a3
{
  self->_played = a3;
}

@end
