@implementation HKHRSampleClassificationCollectionCollection

- (HKHRSampleClassificationCollectionCollection)initWithClassificationCollections:(id)a3
{
  id v5;
  HKHRSampleClassificationCollectionCollection *v6;
  HKHRSampleClassificationCollectionCollection *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKHRSampleClassificationCollectionCollection;
  v6 = -[HKHRSampleClassificationCollectionCollection init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_classificationCollections, a3);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_classificationCollections, CFSTR("ClassificationCollections"));
}

- (HKHRSampleClassificationCollectionCollection)initWithCoder:(id)a3
{
  id v4;
  HKHRSampleClassificationCollectionCollection *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *classificationCollections;
  objc_super v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKHRSampleClassificationCollectionCollection;
  v5 = -[HKHRSampleClassificationCollectionCollection init](&v12, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("ClassificationCollections"));
    v9 = objc_claimAutoreleasedReturnValue();
    classificationCollections = v5->_classificationCollections;
    v5->_classificationCollections = (NSArray *)v9;

  }
  return v5;
}

- (NSArray)classificationCollections
{
  return self->_classificationCollections;
}

- (void)setClassificationCollections:(id)a3
{
  objc_storeStrong((id *)&self->_classificationCollections, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classificationCollections, 0);
}

@end
