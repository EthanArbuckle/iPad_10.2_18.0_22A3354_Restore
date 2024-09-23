@implementation WDAudiogramListDataProvider

- (NSArray)audiogramSamples
{
  void *v2;
  void *v3;

  -[WDSampleListDataProvider samples](self, "samples");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allSamples");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)sampleTypes
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD3DC0], "audiogramSampleType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)textForObject:(id)a3
{
  void *v3;
  void *v4;

  HKHealthKitFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("AUDIOGRAM"), &stru_24D38E7C8, *MEMORY[0x24BDD2F10]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)titleForSection:(unint64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WDAudiogramListDataProvider;
  -[WDSampleListDataProvider titleForSection:](&v4, sel_titleForSection_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
