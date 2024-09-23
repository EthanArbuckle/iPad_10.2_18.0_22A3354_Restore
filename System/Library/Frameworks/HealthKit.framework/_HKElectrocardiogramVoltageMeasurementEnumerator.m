@implementation _HKElectrocardiogramVoltageMeasurementEnumerator

- (_HKElectrocardiogramVoltageMeasurementEnumerator)initWithElectrocardiogram:(id)a3 leadIMicroVoltsBegin:(__wrap_iter<const float *>)a4 end:(__wrap_iter<const float *>)a5
{
  id v9;
  _HKElectrocardiogramVoltageMeasurementEnumerator *v10;
  _HKElectrocardiogramVoltageMeasurementEnumerator *v11;
  void *v12;
  void *v13;
  double v14;
  uint64_t v15;
  HKUnit *microvoltsUnit;
  objc_super v18;

  v9 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_HKElectrocardiogramVoltageMeasurementEnumerator;
  v10 = -[_HKElectrocardiogramVoltageMeasurementEnumerator init](&v18, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_electrocardiogram, a3);
    objc_msgSend(v9, "samplingFrequency");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKUnit hertzUnit](HKUnit, "hertzUnit");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValueForUnit:", v13);
    v11->_samplingHertz = v14;

    +[HKUnit voltUnitWithMetricPrefix:](HKUnit, "voltUnitWithMetricPrefix:", 3);
    v15 = objc_claimAutoreleasedReturnValue();
    microvoltsUnit = v11->_microvoltsUnit;
    v11->_microvoltsUnit = (HKUnit *)v15;

    v11->_current = a4;
    v11->_end = a5;
  }

  return v11;
}

- (id)nextObject
{
  void *v3;

  if (self->_current.__i_ == self->_end.__i_)
  {
    v3 = 0;
  }
  else
  {
    -[_HKElectrocardiogramVoltageMeasurementEnumerator _createMeasurement]((uint64_t)self);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    ++self->_index;
    ++self->_current.__i_;
  }
  return v3;
}

- (HKElectrocardiogramVoltageMeasurement)_createMeasurement
{
  uint64_t v1;
  double v2;
  void *v3;
  HKElectrocardiogramVoltageMeasurement *v4;

  if (a1)
  {
    v1 = *(_QWORD *)(a1 + 32);
    v2 = *(double *)(a1 + 16);
    +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", *(_QWORD *)(a1 + 24), **(float **)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[HKElectrocardiogramVoltageMeasurement initWithLeadIVoltage:timeSinceSampleStart:]([HKElectrocardiogramVoltageMeasurement alloc], "initWithLeadIVoltage:timeSinceSampleStart:", v3, (double)v1 / v2);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_microvoltsUnit, 0);
  objc_storeStrong((id *)&self->_electrocardiogram, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 6) = 0;
  return self;
}

@end
