@implementation WDElectrocardiogramReportDataSource

- (WDElectrocardiogramReportDataSource)initWithSample:(id)a3 healthStore:(id)a4 activeAlgorithmVersion:(int64_t)a5
{
  id v9;
  id v10;
  WDElectrocardiogramReportDataSource *v11;
  WDElectrocardiogramReportDataSource *v12;
  uint64_t v13;
  UIColor *tintColor;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)WDElectrocardiogramReportDataSource;
  v11 = -[WDElectrocardiogramReportDataSource init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_sample, a3);
    objc_storeStrong((id *)&v12->_healthStore, a4);
    HKHealthTintColor();
    v13 = objc_claimAutoreleasedReturnValue();
    tintColor = v12->_tintColor;
    v12->_tintColor = (UIColor *)v13;

    v12->_activeAlgorithmVersion = a5;
    -[WDElectrocardiogramReportDataSource _fetchDemographicInformation](v12, "_fetchDemographicInformation");
  }

  return v12;
}

- (void)_fetchDemographicInformation
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[WDElectrocardiogramReportDataSource healthStore](self, "healthStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __67__WDElectrocardiogramReportDataSource__fetchDemographicInformation__block_invoke;
  v4[3] = &unk_24D38D1F8;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "hk_fetchExistingDemographicInformationWithCompletion:", v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __67__WDElectrocardiogramReportDataSource__fetchDemographicInformation__block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  id WeakRetained;
  void *v6;
  id v7;
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(v3, "firstName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  a1 += 4;
  WeakRetained = objc_loadWeakRetained(a1);
  objc_msgSend(WeakRetained, "setFirstName:", v4);

  objc_msgSend(v3, "lastName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_loadWeakRetained(a1);
  objc_msgSend(v7, "setLastName:", v6);

  objc_msgSend(v3, "dateOfBirthComponents");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v8 = objc_loadWeakRetained(a1);
  objc_msgSend(v8, "setDateOfBirthComponents:", v9);

}

- (HKElectrocardiogram)sample
{
  return self->_sample;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (int64_t)activeAlgorithmVersion
{
  return self->_activeAlgorithmVersion;
}

- (NSString)firstName
{
  return self->_firstName;
}

- (void)setFirstName:(id)a3
{
  objc_storeStrong((id *)&self->_firstName, a3);
}

- (NSString)lastName
{
  return self->_lastName;
}

- (void)setLastName:(id)a3
{
  objc_storeStrong((id *)&self->_lastName, a3);
}

- (NSDateComponents)dateOfBirthComponents
{
  return self->_dateOfBirthComponents;
}

- (void)setDateOfBirthComponents:(id)a3
{
  objc_storeStrong((id *)&self->_dateOfBirthComponents, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateOfBirthComponents, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_sample, 0);
}

@end
