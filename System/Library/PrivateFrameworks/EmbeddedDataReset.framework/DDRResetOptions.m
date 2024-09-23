@implementation DDRResetOptions

- (DDRResetOptions)initWithCoder:(id)a3
{
  id v4;
  DDRResetOptions *v5;
  uint64_t v6;
  NSArray *exclusionPaths;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DDRResetOptions;
  v5 = -[DDRResetOptions init](&v9, sel_init);
  if (v5)
  {
    v5->_hideProgress = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hideProgress"));
    v5->_eraseDataPlan = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("eraseDataPlan"));
    v5->_disallowProximitySetup = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("disallowProximitySetup"));
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("exclusionPaths"));
    v6 = objc_claimAutoreleasedReturnValue();
    exclusionPaths = v5->_exclusionPaths;
    v5->_exclusionPaths = (NSArray *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[DDRResetOptions hideProgress](self, "hideProgress"), CFSTR("hideProgress"));
  objc_msgSend(v4, "encodeBool:forKey:", -[DDRResetOptions eraseDataPlan](self, "eraseDataPlan"), CFSTR("eraseDataPlan"));
  objc_msgSend(v4, "encodeBool:forKey:", -[DDRResetOptions disallowProximitySetup](self, "disallowProximitySetup"), CFSTR("disallowProximitySetup"));
  -[DDRResetOptions exclusionPaths](self, "exclusionPaths");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("exclusionPaths"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)hideProgress
{
  return self->_hideProgress;
}

- (void)setHideProgress:(BOOL)a3
{
  self->_hideProgress = a3;
}

- (BOOL)eraseDataPlan
{
  return self->_eraseDataPlan;
}

- (void)setEraseDataPlan:(BOOL)a3
{
  self->_eraseDataPlan = a3;
}

- (BOOL)disallowProximitySetup
{
  return self->_disallowProximitySetup;
}

- (void)setDisallowProximitySetup:(BOOL)a3
{
  self->_disallowProximitySetup = a3;
}

- (NSArray)exclusionPaths
{
  return self->_exclusionPaths;
}

- (void)setExclusionPaths:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exclusionPaths, 0);
}

@end
