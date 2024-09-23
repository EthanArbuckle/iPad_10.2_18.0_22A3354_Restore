@implementation NIAlgorithmConvergenceState

- (NIAlgorithmConvergenceState)initWithConvergenceStatus:(int64_t)a3
{
  NIAlgorithmConvergenceState *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NIAlgorithmConvergenceState;
  result = -[NIAlgorithmConvergenceState init](&v5, sel_init);
  if (result)
  {
    result->_convergence = a3;
    *(_DWORD *)&result->_insufficientSignalStrength = 0;
    result->_insufficientLighting = 0;
  }
  return result;
}

- (NIAlgorithmConvergenceState)initWithAlgorithmConvergenceState:(id)a3
{
  id v4;
  NIAlgorithmConvergenceState *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NIAlgorithmConvergenceState;
  v5 = -[NIAlgorithmConvergenceState init](&v7, sel_init);
  if (v5)
  {
    v5->_convergence = objc_msgSend(v4, "convergence");
    v5->_insufficientSignalStrength = objc_msgSend(v4, "insufficientSignalStrength");
    v5->_insufficientHorizontalSweep = objc_msgSend(v4, "insufficientHorizontalSweep");
    v5->_insufficientVerticalSweep = objc_msgSend(v4, "insufficientVerticalSweep");
    v5->_insufficientMovement = objc_msgSend(v4, "insufficientMovement");
    v5->_insufficientLighting = objc_msgSend(v4, "insufficientLighting");
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithAlgorithmConvergenceState:", self);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", self->_convergence, CFSTR("convergence"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_insufficientSignalStrength, CFSTR("insufficientSignalStrength"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_insufficientHorizontalSweep, CFSTR("insufficientHorizontalSweep"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_insufficientVerticalSweep, CFSTR("insufficientVerticalSweep"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_insufficientMovement, CFSTR("insufficientMovement"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_insufficientLighting, CFSTR("insufficientLighting"));

}

- (NIAlgorithmConvergenceState)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  char v6;
  char v7;
  char v8;
  char v9;
  char v10;
  NIAlgorithmConvergenceState *v11;
  NIAlgorithmConvergenceState *v12;
  objc_super v14;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("convergence"));
  v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("insufficientSignalStrength"));
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("insufficientHorizontalSweep"));
  v8 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("insufficientVerticalSweep"));
  v9 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("insufficientMovement"));
  v10 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("insufficientLighting"));
  v14.receiver = self;
  v14.super_class = (Class)NIAlgorithmConvergenceState;
  v11 = -[NIAlgorithmConvergenceState init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_convergence = v5;
    v11->_insufficientSignalStrength = v6;
    v11->_insufficientHorizontalSweep = v7;
    v11->_insufficientVerticalSweep = v8;
    v11->_insufficientMovement = v9;
    v11->_insufficientLighting = v10;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NIAlgorithmConvergenceState *v5;
  NIAlgorithmConvergenceState *v6;
  int64_t convergence;
  uint64_t v8;
  int insufficientSignalStrength;
  int v10;
  int insufficientHorizontalSweep;
  int v12;
  int v13;
  int v14;
  BOOL v15;
  int insufficientLighting;
  int v19;
  int insufficientMovement;
  int insufficientVerticalSweep;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (NIAlgorithmConvergenceState *)v4;
    v6 = v5;
    if (v5 == self)
    {
      v15 = 1;
    }
    else
    {
      convergence = self->_convergence;
      v8 = -[NIAlgorithmConvergenceState convergence](v5, "convergence");
      insufficientSignalStrength = self->_insufficientSignalStrength;
      v10 = -[NIAlgorithmConvergenceState insufficientSignalStrength](v6, "insufficientSignalStrength");
      insufficientHorizontalSweep = self->_insufficientHorizontalSweep;
      v12 = -[NIAlgorithmConvergenceState insufficientHorizontalSweep](v6, "insufficientHorizontalSweep");
      insufficientVerticalSweep = self->_insufficientVerticalSweep;
      v13 = -[NIAlgorithmConvergenceState insufficientVerticalSweep](v6, "insufficientVerticalSweep");
      insufficientMovement = self->_insufficientMovement;
      v19 = -[NIAlgorithmConvergenceState insufficientMovement](v6, "insufficientMovement");
      insufficientLighting = self->_insufficientLighting;
      v14 = -[NIAlgorithmConvergenceState insufficientLighting](v6, "insufficientLighting");
      v15 = 0;
      if (convergence == v8
        && insufficientSignalStrength == v10
        && insufficientHorizontalSweep == v12
        && insufficientVerticalSweep == v13)
      {
        v15 = insufficientMovement == v19 && insufficientLighting == v14;
      }
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_convergence);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash") ^ self->_insufficientSignalStrength ^ (unint64_t)self->_insufficientHorizontalSweep ^ self->_insufficientVerticalSweep ^ self->_insufficientMovement ^ self->_insufficientLighting;

  return v4;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  unint64_t convergence;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: "), v5);

  convergence = self->_convergence;
  if (convergence >= 3)
    __assert_rtn("NIAlgorithmConvergenceStatusToString", "NIAlgorithmConvergenceState.mm", 142, "false");
  objc_msgSend(v6, "appendFormat:", CFSTR(", Convergence: %@"), off_1E4362CF8[convergence]);
  if (self->_insufficientSignalStrength)
    v8 = CFSTR("yes");
  else
    v8 = CFSTR("no");
  objc_msgSend(v6, "appendFormat:", CFSTR(", insufficientSignalStrength: %@"), v8);
  if (self->_insufficientHorizontalSweep)
    v9 = CFSTR("yes");
  else
    v9 = CFSTR("no");
  objc_msgSend(v6, "appendFormat:", CFSTR(", insufficientHorizontalSweep: %@"), v9);
  if (self->_insufficientVerticalSweep)
    v10 = CFSTR("yes");
  else
    v10 = CFSTR("no");
  objc_msgSend(v6, "appendFormat:", CFSTR(", insufficientVerticalSweep: %@"), v10);
  if (self->_insufficientMovement)
    v11 = CFSTR("yes");
  else
    v11 = CFSTR("no");
  objc_msgSend(v6, "appendFormat:", CFSTR(", insufficientMovement: %@"), v11);
  if (self->_insufficientLighting)
    v12 = CFSTR("yes");
  else
    v12 = CFSTR("no");
  objc_msgSend(v6, "appendFormat:", CFSTR(", insufficientLighting: %@"), v12);
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (int64_t)convergence
{
  return self->_convergence;
}

- (void)setConvergence:(int64_t)a3
{
  self->_convergence = a3;
}

- (BOOL)insufficientSignalStrength
{
  return self->_insufficientSignalStrength;
}

- (void)setInsufficientSignalStrength:(BOOL)a3
{
  self->_insufficientSignalStrength = a3;
}

- (BOOL)insufficientHorizontalSweep
{
  return self->_insufficientHorizontalSweep;
}

- (void)setInsufficientHorizontalSweep:(BOOL)a3
{
  self->_insufficientHorizontalSweep = a3;
}

- (BOOL)insufficientVerticalSweep
{
  return self->_insufficientVerticalSweep;
}

- (void)setInsufficientVerticalSweep:(BOOL)a3
{
  self->_insufficientVerticalSweep = a3;
}

- (BOOL)insufficientMovement
{
  return self->_insufficientMovement;
}

- (void)setInsufficientMovement:(BOOL)a3
{
  self->_insufficientMovement = a3;
}

- (BOOL)insufficientLighting
{
  return self->_insufficientLighting;
}

- (void)setInsufficientLighting:(BOOL)a3
{
  self->_insufficientLighting = a3;
}

@end
