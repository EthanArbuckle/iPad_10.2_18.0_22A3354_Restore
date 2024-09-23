@implementation MADVideoSafetyClassificationRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADVideoSafetyClassificationRequest)init
{
  MADVideoSafetyClassificationRequest *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MADVideoSafetyClassificationRequest;
  result = -[MADVideoSafetyClassificationRequest init](&v3, sel_init);
  if (result)
    result->_appliesPreferredTrackTransform = 1;
  return result;
}

- (MADVideoSafetyClassificationRequest)initWithCoder:(id)a3
{
  id v4;
  MADVideoSafetyClassificationRequest *v5;
  uint64_t v6;
  MADVideoSafetyFrameSampling *sampling;
  uint64_t v8;
  NSNumber *sensitiveFrameCountThreshold;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MADVideoSafetyClassificationRequest;
  v5 = -[MADVideoRequest initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Sampling"));
    v6 = objc_claimAutoreleasedReturnValue();
    sampling = v5->_sampling;
    v5->_sampling = (MADVideoSafetyFrameSampling *)v6;

    v5->_appliesPreferredTrackTransform = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("AppliesPreferredTrackTransform"));
    v5->_requiresScoresAndLabels = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("RequiresScoresAndLabels"));
    v5->_requiresBlastdoor = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("RequiresBlastdoor"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SensitiveFrameCountThreshold"));
    v8 = objc_claimAutoreleasedReturnValue();
    sensitiveFrameCountThreshold = v5->_sensitiveFrameCountThreshold;
    v5->_sensitiveFrameCountThreshold = (NSNumber *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MADVideoSafetyClassificationRequest;
  v4 = a3;
  -[MADVideoRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_sampling, CFSTR("Sampling"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeBool:forKey:", self->_appliesPreferredTrackTransform, CFSTR("AppliesPreferredTrackTransform"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_requiresBlastdoor, CFSTR("RequiresBlastdoor"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_requiresScoresAndLabels, CFSTR("RequiresScoresAndLabels"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_sensitiveFrameCountThreshold, CFSTR("SensitiveFrameCountThreshold"));

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p"), v5, self);

  objc_msgSend(v3, "appendFormat:", CFSTR(", sampling: %@"), self->_sampling);
  if (self->_appliesPreferredTrackTransform)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR(", appliesPreferredTrackTransform: %@"), v6);
  if (self->_requiresScoresAndLabels)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR(", requiresScoresAndLaels: %@"), v7);
  if (self->_requiresBlastdoor)
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR(", requiresBlastdoor: %@"), v8);
  objc_msgSend(v3, "appendFormat:", CFSTR(", sensitiveFrameCountThreshold: %@"), self->_sensitiveFrameCountThreshold);
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)requiresScoresAndLabels
{
  return self->_requiresScoresAndLabels;
}

- (void)setRequiresScoresAndLabels:(BOOL)a3
{
  self->_requiresScoresAndLabels = a3;
}

- (MADVideoSafetyFrameSampling)sampling
{
  return self->_sampling;
}

- (void)setSampling:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)appliesPreferredTrackTransform
{
  return self->_appliesPreferredTrackTransform;
}

- (void)setAppliesPreferredTrackTransform:(BOOL)a3
{
  self->_appliesPreferredTrackTransform = a3;
}

- (BOOL)requiresBlastdoor
{
  return self->_requiresBlastdoor;
}

- (void)setRequiresBlastdoor:(BOOL)a3
{
  self->_requiresBlastdoor = a3;
}

- (NSNumber)sensitiveFrameCountThreshold
{
  return self->_sensitiveFrameCountThreshold;
}

- (void)setSensitiveFrameCountThreshold:(id)a3
{
  objc_storeStrong((id *)&self->_sensitiveFrameCountThreshold, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sensitiveFrameCountThreshold, 0);
  objc_storeStrong((id *)&self->_sampling, 0);
}

@end
