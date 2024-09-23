@implementation NIConfiguration

- (NIConfiguration)init
{
  __assert_rtn("-[NIConfiguration init]", "NIConfiguration.mm", 341, "NO");
}

+ (NIConfiguration)new
{
  __assert_rtn("+[NIConfiguration new]", "NIConfiguration.mm", 346, "NO");
}

- (id)initInternal
{
  id result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NIConfiguration;
  result = -[NIConfiguration init](&v3, sel_init);
  if (result)
  {
    *((int64x2_t *)result + 1) = vdupq_n_s64(3uLL);
    *((_BYTE *)result + 8) = 0;
  }
  return result;
}

- (NIConfiguration)initWithConfiguration:(id)a3
{
  id v5;
  NIConfiguration *v6;
  void *v8;
  objc_super v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIConfiguration.mm"), 363, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuration"));

  }
  v9.receiver = self;
  v9.super_class = (Class)NIConfiguration;
  v6 = -[NIConfiguration init](&v9, sel_init);
  if (v6)
  {
    v6->_suspensionPolicy = objc_msgSend(v5, "suspensionPolicy");
    v6->_enabledGestures = objc_msgSend(v5, "enabledGestures");
    v6->_supportsCameraAssistance = objc_msgSend(v5, "supportsCameraAssistance");
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithConfiguration:", self);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", self->_suspensionPolicy, CFSTR("suspensionPolicy"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_enabledGestures, CFSTR("enabledGestures"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_supportsCameraAssistance, CFSTR("supportsCameraAssistance"));

}

- (NIConfiguration)initWithCoder:(id)a3
{
  id v4;
  NIConfiguration *v5;
  _QWORD *v6;
  _OWORD *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  NIConfiguration *v17;

  v4 = a3;
  v5 = (NIConfiguration *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initInternal");

  if (v5)
  {
    v6 = operator new(0x18uLL);
    *(_OWORD *)v6 = xmmword_1A036EFE0;
    v6[2] = 1;
    v7 = operator new(0x10uLL);
    *v7 = xmmword_1A036EFD0;
    v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("suspensionPolicy"));
    v9 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("enabledGestures"));
    v10 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsCameraAssistance"));
    v11 = 0;
    v12 = 0;
    v5->_suspensionPolicy = 0;
    v5->_enabledGestures = 0;
    v5->_supportsCameraAssistance = v10;
    do
    {
      v13 = v6[v11];
      if ((v13 & v8) != 0)
      {
        v12 |= v13;
        v5->_suspensionPolicy = v12;
      }
      ++v11;
    }
    while (v11 != 3);
    v14 = 0;
    v15 = 0;
    do
    {
      v16 = *(_QWORD *)((char *)v7 + v14);
      if ((v16 & v9) != 0)
      {
        v15 |= v16;
        v5->_enabledGestures = v15;
      }
      v14 += 8;
    }
    while (v14 != 16);
    v17 = v5;
    operator delete(v7);
    operator delete(v6);
  }

  return v5;
}

- (id)descriptionInternal
{
  return 0;
}

- (BOOL)_internalIsCameraAssistanceEnabled
{
  return 0;
}

- (BOOL)_internalIsCameraAssistanceInClientProcess
{
  return 1;
}

- (BOOL)_internalIsExtendedDistanceMeasurementEnabled
{
  return 0;
}

- (BOOL)supportsCameraAssistance
{
  return self->_supportsCameraAssistance;
}

- (void)setSupportsCameraAssistance:(BOOL)a3
{
  self->_supportsCameraAssistance = a3;
}

- (unint64_t)suspensionPolicy
{
  return self->_suspensionPolicy;
}

- (void)setSuspensionPolicy:(unint64_t)a3
{
  self->_suspensionPolicy = a3;
}

- (unint64_t)enabledGestures
{
  return self->_enabledGestures;
}

- (void)setEnabledGestures:(unint64_t)a3
{
  self->_enabledGestures = a3;
}

@end
