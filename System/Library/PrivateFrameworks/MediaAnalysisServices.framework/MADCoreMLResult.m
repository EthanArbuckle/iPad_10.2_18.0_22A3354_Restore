@implementation MADCoreMLResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADCoreMLResult)initWithCoder:(id)a3
{
  id v4;
  MADCoreMLResult *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *observations;
  objc_super v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MADCoreMLResult;
  v5 = -[MADResult initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("CoreMLObservations"));
    v9 = objc_claimAutoreleasedReturnValue();
    observations = v5->_observations;
    v5->_observations = (NSArray *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MADCoreMLResult;
  -[MADResult encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_observations, CFSTR("CoreMLObservations"));

}

- (MADCoreMLResult)initWithVisionResults:(id)a3
{
  id v5;
  MADCoreMLResult *v6;
  MADCoreMLResult *v7;
  MADCoreMLResult *v8;
  MADCoreMLResult *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MADCoreMLResult;
  v6 = -[MADResult init](&v11, sel_init);
  v7 = v6;
  if (v6
    && (objc_storeStrong((id *)&v6->_visionResults, a3),
        -[MADCoreMLResult _packageCoreMLObservations](v7, "_packageCoreMLObservations")))
  {
    v8 = 0;
  }
  else
  {
    v8 = v7;
  }
  v9 = v8;

  return v9;
}

+ (id)resultWithVisionResults:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithVisionResults:", v4);

  return v5;
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

  objc_msgSend(v3, "appendFormat:", CFSTR("%@: %lu count>"), CFSTR("CoreMLObservations"), -[NSArray count](self->_observations, "count"));
  return v3;
}

- (int)_packageCoreMLObservations
{
  void *v3;
  NSArray *visionResults;
  id v5;
  NSArray **p_observations;
  uint64_t v7;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  visionResults = self->_visionResults;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45__MADCoreMLResult__packageCoreMLObservations__block_invoke;
  v9[3] = &unk_1E97E2360;
  v5 = v3;
  v10 = v5;
  -[NSArray enumerateObjectsUsingBlock:](visionResults, "enumerateObjectsUsingBlock:", v9);
  p_observations = &self->_observations;
  objc_storeStrong((id *)p_observations, v3);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v7 = -[NSArray count](*p_observations, "count");
    *(_DWORD *)buf = 134217984;
    v12 = v7;
    _os_log_impl(&dword_1D461A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MADCoreMLResult] Packaged %lu observations", buf, 0xCu);
  }

  return 0;
}

void __45__MADCoreMLResult__packageCoreMLObservations__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    objc_msgSend(v4, "featureName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "featureValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[MADCoreMLObservation entryWithFeatureName:featureValue:](MADCoreMLObservation, "entryWithFeatureName:featureValue:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      __45__MADCoreMLResult__packageCoreMLObservations__block_invoke_cold_1((uint64_t)v4);
    }

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = (id)objc_opt_class();
    v8 = v10;
    _os_log_impl(&dword_1D461A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[MADCoreMLResult] Ignoring non-compatible result class - %@", (uint8_t *)&v9, 0xCu);

  }
}

- (NSArray)observations
{
  return self->_observations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observations, 0);
  objc_storeStrong((id *)&self->_visionResults, 0);
}

void __45__MADCoreMLResult__packageCoreMLObservations__block_invoke_cold_1(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 138412290;
  v2 = a1;
  _os_log_error_impl(&dword_1D461A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MADCoreMLResult] Failed to create coreML result from %@", (uint8_t *)&v1, 0xCu);
}

@end
