@implementation MADVIRectangleDetectionResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADVIRectangleDetectionResult)initWithObservations:(id)a3
{
  id v5;
  MADVIRectangleDetectionResult *v6;
  MADVIRectangleDetectionResult *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MADVIRectangleDetectionResult;
  v6 = -[MADResult init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_observations, a3);

  return v7;
}

- (MADVIRectangleDetectionResult)initWithCoder:(id)a3
{
  id v4;
  MADVIRectangleDetectionResult *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSArray *observations;
  objc_super v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MADVIRectangleDetectionResult;
  v5 = -[MADResult initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v20[0] = objc_opt_class();
    v16 = 0;
    v17 = &v16;
    v18 = 0x2050000000;
    v7 = (void *)getVNRectangleObservationClass_softClass;
    v19 = getVNRectangleObservationClass_softClass;
    if (!getVNRectangleObservationClass_softClass)
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __getVNRectangleObservationClass_block_invoke;
      v15[3] = &unk_1E97E2300;
      v15[4] = &v16;
      __getVNRectangleObservationClass_block_invoke((uint64_t)v15);
      v7 = (void *)v17[3];
    }
    v8 = objc_retainAutorelease(v7);
    _Block_object_dispose(&v16, 8);
    v20[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("Observations"));
    v11 = objc_claimAutoreleasedReturnValue();
    observations = v5->_observations;
    v5->_observations = (NSArray *)v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MADVIRectangleDetectionResult;
  v4 = a3;
  -[MADResult encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_observations, CFSTR("Observations"), v5.receiver, v5.super_class);

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

  objc_msgSend(v3, "appendFormat:", CFSTR("observations: %@>"), self->_observations);
  return v3;
}

- (NSArray)observations
{
  return self->_observations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observations, 0);
}

@end
