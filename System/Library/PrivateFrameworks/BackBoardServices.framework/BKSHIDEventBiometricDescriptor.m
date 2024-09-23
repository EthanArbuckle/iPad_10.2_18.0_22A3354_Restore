@implementation BKSHIDEventBiometricDescriptor

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  int v7;
  BOOL v8;
  objc_super v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6
    && (v10.receiver = self,
        v10.super_class = (Class)BKSHIDEventBiometricDescriptor,
        -[BKSHIDEventDescriptor isEqual:](&v10, sel_isEqual_, v6)))
  {
    v7 = objc_msgSend(v6, "biometricEventType");
    v8 = v7 == -[BKSHIDEventBiometricDescriptor biometricEventType](self, "biometricEventType");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)describes:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  v5 = v4;
  v6 = *((_BYTE *)&self->super._hidEventType + 4) && objc_msgSend(v4, "hidEventType") == 29
    || -[BKSHIDEventBiometricDescriptor isEqual:](self, "isEqual:", v5);

  return v6;
}

- (BKSHIDEventBiometricDescriptor)init
{
  BKSHIDEventBiometricDescriptor *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKSHIDEventBiometricDescriptor;
  result = -[BKSHIDEventDescriptor _initWithEventType:](&v3, sel__initWithEventType_, 39);
  if (result)
    *((_BYTE *)&result->super._hidEventType + 4) = 1;
  return result;
}

- (BKSHIDEventBiometricDescriptor)initWithBiometricEventType:(unsigned int)a3
{
  BKSHIDEventBiometricDescriptor *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKSHIDEventBiometricDescriptor;
  result = -[BKSHIDEventDescriptor _initWithEventType:](&v5, sel__initWithEventType_, 29);
  if (result)
    *(_DWORD *)&result->_isWildcard = a3;
  return result;
}

- (unint64_t)hash
{
  return *(unsigned int *)&self->_isWildcard | 0x1D0000;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)BKSHIDEventBiometricDescriptor;
  -[BKSHIDEventDescriptor appendDescriptionToFormatter:](&v6, sel_appendDescriptionToFormatter_, v4);
  v5 = (id)objc_msgSend(v4, "appendInteger:withName:", *(unsigned int *)&self->_isWildcard, CFSTR("biometricEventType"));

}

- (BOOL)requiresFuzzyMatching
{
  return *((_BYTE *)&self->super._hidEventType + 4);
}

- (void)encodeWithCoder:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = *(unsigned int *)&self->_isWildcard;
  v5 = a3;
  objc_msgSend(v3, "numberWithUnsignedInt:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("biometricEventType"));

}

- (BKSHIDEventBiometricDescriptor)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("biometricEventType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "unsignedIntValue");
  return -[BKSHIDEventBiometricDescriptor initWithBiometricEventType:](self, "initWithBiometricEventType:", v6);
}

- (unsigned)biometricEventType
{
  return *(_DWORD *)&self->_isWildcard;
}

+ (id)descriptorWithBiometricEventType:(unsigned int)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithBiometricEventType:", *(_QWORD *)&a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
