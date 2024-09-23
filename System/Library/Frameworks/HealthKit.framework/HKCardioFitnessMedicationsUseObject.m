@implementation HKCardioFitnessMedicationsUseObject

- (id)_initWithCardioFitnessMedicationsUseOptions:(unint64_t)a3
{
  HKCardioFitnessMedicationsUseObject *v4;
  void *v5;
  void *v6;
  int v7;
  unint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HKCardioFitnessMedicationsUseObject;
  v4 = -[HKCardioFitnessMedicationsUseObject init](&v10, sel_init);
  if (v4)
  {
    +[HKObjectType characteristicTypeForIdentifier:](HKObjectType, "characteristicTypeForIdentifier:", CFSTR("HKCharacteristicTypeIdentifierCardioFitnessMedicationsUse"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "_validateCharacteristic:error:", v6, 0);

    if (v7)
      v8 = a3;
    else
      v8 = 0;
    v4->_options = v8;

  }
  return v4;
}

- (BOOL)takingCalciumChannelBlockers
{
  return self->_options & 1;
}

- (BOOL)takingBetaBlockers
{
  return (LOBYTE(self->_options) >> 1) & 1;
}

- (BOOL)medicationsAreSet
{
  return self->_options != 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKCardioFitnessMedicationsUseObject)initWithCoder:(id)a3
{
  id v4;
  HKCardioFitnessMedicationsUseObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  HKCardioFitnessMedicationsUseObject *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKCardioFitnessMedicationsUseObject;
  v5 = -[HKCardioFitnessMedicationsUseObject init](&v12, sel_init);
  if (v5)
  {
    +[HKObjectType characteristicTypeForIdentifier:](HKObjectType, "characteristicTypeForIdentifier:", CFSTR("HKCharacteristicTypeIdentifierCardioFitnessMedicationsUse"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("cardioFitnessMedicationsUse"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "_validateCharacteristic:error:", v8, 0);

    if (!v9)
    {

      v10 = 0;
      goto LABEL_6;
    }
    v5->_options = v7;

  }
  v10 = v5;
LABEL_6:

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInteger:forKey:", self->_options, CFSTR("cardioFitnessMedicationsUse"));
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_options == v4[1];

  return v5;
}

- (unint64_t)hash
{
  return self->_options;
}

@end
