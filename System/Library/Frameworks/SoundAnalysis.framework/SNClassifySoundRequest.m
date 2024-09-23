@implementation SNClassifySoundRequest

- (double)overlapFactor
{
  double result;

  MEMORY[0x1E0DE7D20](self->_impl, sel_overlapFactor);
  return result;
}

- (void)setOverlapFactor:(double)overlapFactor
{
  _SNClassifySoundRequest *impl;
  BOOL v4;
  id v5;
  void *v6;
  id v7;

  impl = self->_impl;
  v7 = 0;
  v4 = -[_SNClassifySoundRequest setOverlapFactor:error:](impl, "setOverlapFactor:error:", &v7, overlapFactor);
  v5 = v7;
  if (!v4)
  {
    +[SNError exceptionFromError:](SNError, "exceptionFromError:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "raise");

  }
}

- (CMTime)windowDuration
{
  CMTime *result;

  result = (CMTime *)self->_impl;
  if (result)
    return (CMTime *)MEMORY[0x1E0DE7D20](result, sel_windowDuration);
  retstr->value = 0;
  *(_QWORD *)&retstr->timescale = 0;
  retstr->epoch = 0;
  return result;
}

- (void)setWindowDuration:(CMTime *)windowDuration
{
  _SNClassifySoundRequest *impl;
  CMTime v4;

  impl = self->_impl;
  v4 = *windowDuration;
  -[_SNClassifySoundRequest setWindowDuration:](impl, "setWindowDuration:", &v4);
}

- (SNTimeDurationConstraint)windowDurationConstraint
{
  return (SNTimeDurationConstraint *)MEMORY[0x1E0DE7D20](self->_impl, sel_windowDurationConstraint);
}

- (NSArray)knownClassifications
{
  return (NSArray *)MEMORY[0x1E0DE7D20](self->_impl, sel_knownClassifications);
}

- (SNClassifySoundRequest)initWithMLModel:(MLModel *)mlModel error:(NSError *)error
{
  MLModel *v6;
  SNClassifySoundRequest *v7;
  _SNClassifySoundRequest *v8;
  _SNClassifySoundRequest *impl;
  objc_super v11;

  v6 = mlModel;
  v11.receiver = self;
  v11.super_class = (Class)SNClassifySoundRequest;
  v7 = -[SNClassifySoundRequest init](&v11, sel_init);
  if (v7)
  {
    v8 = -[_SNClassifySoundRequest initWithMLModel:error:]([_SNClassifySoundRequest alloc], "initWithMLModel:error:", v6, error);
    impl = v7->_impl;
    v7->_impl = v8;

    if (!v7->_impl)
    {

      v7 = 0;
    }
  }

  return v7;
}

- (SNClassifySoundRequest)initWithClassifierIdentifier:(SNClassifierIdentifier)classifierIdentifier error:(NSError *)error
{
  NSString *v6;
  SNClassifySoundRequest *v7;
  _SNClassifySoundRequest *v8;
  _SNClassifySoundRequest *impl;
  objc_super v11;

  v6 = classifierIdentifier;
  v11.receiver = self;
  v11.super_class = (Class)SNClassifySoundRequest;
  v7 = -[SNClassifySoundRequest init](&v11, sel_init);
  if (v7)
  {
    v8 = -[_SNClassifySoundRequest initWithClassifierIdentifier:error:]([_SNClassifySoundRequest alloc], "initWithClassifierIdentifier:error:", v6, error);
    impl = v7->_impl;
    v7->_impl = v8;

    if (!v7->_impl)
    {

      v7 = 0;
    }
  }

  return v7;
}

- (SNClassifySoundRequest)initWithImpl:(id)a3
{
  id v5;
  SNClassifySoundRequest *v6;
  SNClassifySoundRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SNClassifySoundRequest;
  v6 = -[SNClassifySoundRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_impl, a3);

  return v7;
}

- (SNClassifySoundRequest)init
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("-init is not a valid initializer for the class SNClassifySoundRequest"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

+ (SNClassifySoundRequest)new
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("+new is not a valid class method for the class SNClassifySoundRequest"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  id v6;
  void *v7;

  v5 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v6 = -[_SNClassifySoundRequest copyWithZone:](self->_impl, "copyWithZone:", a3);
  v7 = (void *)objc_msgSend(v5, "initWithImpl:", v6);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  SNClassifySoundRequest *v4;
  BOOL v5;

  v4 = (SNClassifySoundRequest *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[_SNClassifySoundRequest isEqual:](self->_impl, "isEqual:", v4->_impl);
  }

  return v5;
}

- (unint64_t)hash
{
  return MEMORY[0x1E0DE7D20](self->_impl, sel_hash);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SNClassifySoundRequest)initWithCoder:(id)a3
{
  id v4;
  SNClassifySoundRequest *v5;
  _SNClassifySoundRequest *v6;
  _SNClassifySoundRequest *impl;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SNClassifySoundRequest;
  v5 = -[SNClassifySoundRequest init](&v9, sel_init);
  if (v5)
  {
    v6 = -[_SNClassifySoundRequest initWithCoder:]([_SNClassifySoundRequest alloc], "initWithCoder:", v4);
    impl = v5->_impl;
    v5->_impl = v6;

    if (!v5->_impl)
    {

      v5 = 0;
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  MEMORY[0x1E0DE7D20](self->_impl, sel_encodeWithCoder_);
}

- (id)impl
{
  return self->_impl;
}

+ (id)eagerlyAllocateModelsForRequest:(id)a3 error:(id *)a4
{
  return (id)MEMORY[0x1E0DE7D20](_SNClassifySoundRequest, sel_eagerlyAllocateModelsForRequest_error_);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impl, 0);
}

@end
