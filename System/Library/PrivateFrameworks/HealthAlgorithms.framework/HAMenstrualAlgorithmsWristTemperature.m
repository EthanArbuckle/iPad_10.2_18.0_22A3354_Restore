@implementation HAMenstrualAlgorithmsWristTemperature

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HAMenstrualAlgorithmsWristTemperature)initWithTemperature:(double)a3 forWatchIdentifier:(id)a4
{
  id v7;
  HAMenstrualAlgorithmsWristTemperature *v8;
  HAMenstrualAlgorithmsWristTemperature *v9;
  HAMenstrualAlgorithmsWristTemperature *v10;
  objc_super v12;

  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HAMenstrualAlgorithmsWristTemperature;
  v8 = -[HAMenstrualAlgorithmsWristTemperature init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_temperatureCelsius = a3;
    objc_storeStrong((id *)&v8->_watchIdentifier, a4);
    v10 = v9;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  double temperatureCelsius;
  void *v5;
  NSString *watchIdentifier;
  void *v7;
  id v8;

  v8 = a3;
  temperatureCelsius = self->_temperatureCelsius;
  NSStringFromSelector(sel_temperatureCelsius);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeDouble:forKey:", v5, temperatureCelsius);

  watchIdentifier = self->_watchIdentifier;
  NSStringFromSelector(sel_watchIdentifier);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", watchIdentifier, v7);

}

- (HAMenstrualAlgorithmsWristTemperature)initWithCoder:(id)a3
{
  id v4;
  HAMenstrualAlgorithmsWristTemperature *v5;
  void *v6;
  double v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSString *watchIdentifier;
  HAMenstrualAlgorithmsWristTemperature *v12;

  v4 = a3;
  v5 = -[HAMenstrualAlgorithmsWristTemperature init](self, "init");
  if (v5)
  {
    NSStringFromSelector(sel_temperatureCelsius);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeDoubleForKey:", v6);
    v5->_temperatureCelsius = v7;

    v8 = objc_opt_class();
    NSStringFromSelector(sel_watchIdentifier);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    watchIdentifier = v5->_watchIdentifier;
    v5->_watchIdentifier = (NSString *)v10;

    v12 = v5;
  }

  return v5;
}

- (double)temperatureCelsius
{
  return self->_temperatureCelsius;
}

- (NSString)watchIdentifier
{
  return self->_watchIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchIdentifier, 0);
}

@end
