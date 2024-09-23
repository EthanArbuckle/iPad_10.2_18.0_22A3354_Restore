@implementation MADVIMachineReadableCodeDetectionRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (unint64_t)targetResolution
{
  return 3048192;
}

- (MADVIMachineReadableCodeDetectionRequest)init
{
  return -[MADVIMachineReadableCodeDetectionRequest initWithSymbologies:](self, "initWithSymbologies:", MEMORY[0x1E0C9AA60]);
}

- (MADVIMachineReadableCodeDetectionRequest)initWithSymbologies:(id)a3
{
  id v4;
  MADVIMachineReadableCodeDetectionRequest *v5;
  uint64_t v6;
  NSArray *symbologies;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MADVIMachineReadableCodeDetectionRequest;
  v5 = -[MADVIMachineReadableCodeDetectionRequest init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    symbologies = v5->_symbologies;
    v5->_symbologies = (NSArray *)v6;

  }
  return v5;
}

- (MADVIMachineReadableCodeDetectionRequest)initWithCoder:(id)a3
{
  id v4;
  MADVIMachineReadableCodeDetectionRequest *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *symbologies;
  objc_super v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MADVIMachineReadableCodeDetectionRequest;
  v5 = -[MADRequest initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("Symbologies"));
    v9 = objc_claimAutoreleasedReturnValue();
    symbologies = v5->_symbologies;
    v5->_symbologies = (NSArray *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MADVIMachineReadableCodeDetectionRequest;
  v4 = a3;
  -[MADRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_symbologies, CFSTR("Symbologies"), v5.receiver, v5.super_class);

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p, "), v5, self);

  objc_msgSend(v3, "appendFormat:", CFSTR("symbologies: %@, "), self->_symbologies);
  -[MADRequest results](self, "results");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("results: %@, "), v6);

  -[MADRequest error](self, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("error: %@>"), v7);

  return v3;
}

- (NSArray)symbologies
{
  return self->_symbologies;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbologies, 0);
}

@end
