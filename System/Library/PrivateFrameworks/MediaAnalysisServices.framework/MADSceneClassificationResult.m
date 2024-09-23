@implementation MADSceneClassificationResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADSceneClassificationResult)initWithClassifications:(id)a3
{
  id v5;
  MADSceneClassificationResult *v6;
  MADSceneClassificationResult *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MADSceneClassificationResult;
  v6 = -[MADResult init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_classifications, a3);

  return v7;
}

+ (id)resultWithClassifications:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithClassifications:", v4);

  return v5;
}

- (MADSceneClassificationResult)initWithCoder:(id)a3
{
  id v4;
  MADSceneClassificationResult *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSSet *classifications;
  objc_super v12;
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MADSceneClassificationResult;
  v5 = -[MADResult initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    v13[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("Classifications"));
    v9 = objc_claimAutoreleasedReturnValue();
    classifications = v5->_classifications;
    v5->_classifications = (NSSet *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MADSceneClassificationResult;
  -[MADResult encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_classifications, CFSTR("Classifications"));

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

  objc_msgSend(v3, "appendFormat:", CFSTR("%@: %lu count>"), CFSTR("Classifications"), -[NSSet count](self->_classifications, "count"));
  return v3;
}

- (NSSet)classifications
{
  return self->_classifications;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classifications, 0);
}

@end
