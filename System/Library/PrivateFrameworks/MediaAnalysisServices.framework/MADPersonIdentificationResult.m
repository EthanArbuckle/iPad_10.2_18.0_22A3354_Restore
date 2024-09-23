@implementation MADPersonIdentificationResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADPersonIdentificationResult)initWithResultItems:(id)a3 frontCameraCaptureState:(int64_t)a4
{
  id v7;
  MADPersonIdentificationResult *v8;
  MADPersonIdentificationResult *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MADPersonIdentificationResult;
  v8 = -[MADResult init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_resultItems, a3);
    v9->_frontCameraCaptureState = a4;
  }

  return v9;
}

- (MADPersonIdentificationResult)initWithCoder:(id)a3
{
  id v4;
  MADPersonIdentificationResult *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *resultItems;
  objc_super v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MADPersonIdentificationResult;
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

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("ResultItems"));
    v9 = objc_claimAutoreleasedReturnValue();
    resultItems = v5->_resultItems;
    v5->_resultItems = (NSArray *)v9;

    v5->_frontCameraCaptureState = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("FrontCameraCaptureState"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MADPersonIdentificationResult;
  -[MADResult encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_resultItems, CFSTR("ResultItems"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_frontCameraCaptureState, CFSTR("FrontCameraCaptureState"));

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

  objc_msgSend(v3, "appendFormat:", CFSTR("frontCameraCapture: %ld, "), self->_frontCameraCaptureState);
  objc_msgSend(v3, "appendFormat:", CFSTR("result items: %@>"), self->_resultItems);
  return v3;
}

- (int64_t)frontCameraCaptureState
{
  return self->_frontCameraCaptureState;
}

- (NSArray)resultItems
{
  return self->_resultItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultItems, 0);
}

@end
