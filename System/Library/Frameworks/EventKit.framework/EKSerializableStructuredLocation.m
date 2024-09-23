@implementation EKSerializableStructuredLocation

+ (id)classesForKey
{
  void *v2;
  void *v3;
  uint64_t v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("calLocation");
  v5 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v5, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (EKSerializableStructuredLocation)initWithStructuredLocation:(id)a3
{
  id v4;
  EKSerializableStructuredLocation *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)EKSerializableStructuredLocation;
  v5 = -[EKSerializableStructuredLocation init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "calLocation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKSerializableStructuredLocation setCalLocation:](v5, "setCalLocation:", v6);

  }
  return v5;
}

- (id)createStructuredLocation
{
  void *v2;
  void *v3;

  -[EKSerializableStructuredLocation calLocation](self, "calLocation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKStructuredLocation locationWithCalLocation:](EKStructuredLocation, "locationWithCalLocation:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CalLocation)calLocation
{
  return self->_calLocation;
}

- (void)setCalLocation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calLocation, 0);
}

@end
