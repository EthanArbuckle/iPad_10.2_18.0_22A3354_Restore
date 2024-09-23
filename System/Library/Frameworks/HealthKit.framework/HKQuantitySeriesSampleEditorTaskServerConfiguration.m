@implementation HKQuantitySeriesSampleEditorTaskServerConfiguration

- (HKQuantitySeriesSampleEditorTaskServerConfiguration)initWithQuantitySample:(id)a3
{
  id v4;
  HKQuantitySeriesSampleEditorTaskServerConfiguration *v5;
  uint64_t v6;
  HKQuantitySample *quantitySample;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKQuantitySeriesSampleEditorTaskServerConfiguration;
  v5 = -[HKQuantitySeriesSampleEditorTaskServerConfiguration init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    quantitySample = v5->_quantitySample;
    v5->_quantitySample = (HKQuantitySample *)v6;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKQuantitySeriesSampleEditorTaskServerConfiguration;
  v4 = -[HKTaskConfiguration copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setQuantitySample:", self->_quantitySample);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKQuantitySeriesSampleEditorTaskServerConfiguration)initWithCoder:(id)a3
{
  id v4;
  HKQuantitySeriesSampleEditorTaskServerConfiguration *v5;
  uint64_t v6;
  HKQuantitySample *quantitySample;
  HKQuantitySeriesSampleEditorTaskServerConfiguration *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HKQuantitySeriesSampleEditorTaskServerConfiguration;
  v5 = -[HKTaskConfiguration initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5
    && (objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("quantity_sample")),
        v6 = objc_claimAutoreleasedReturnValue(),
        quantitySample = v5->_quantitySample,
        v5->_quantitySample = (HKQuantitySample *)v6,
        quantitySample,
        !v5->_quantitySample))
  {
    v8 = 0;
  }
  else
  {
    v8 = v5;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKQuantitySeriesSampleEditorTaskServerConfiguration;
  v4 = a3;
  -[HKTaskConfiguration encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_quantitySample, CFSTR("quantity_sample"), v5.receiver, v5.super_class);

}

- (HKQuantitySample)quantitySample
{
  return self->_quantitySample;
}

- (void)setQuantitySample:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quantitySample, 0);
}

@end
