@implementation HMIPersonsModelsSummary

- (HMIPersonsModelsSummary)initWithModelSummaries:(id)a3 homeToExternalEquivalencies:(unint64_t)a4 externalToExternalEquivalencies:(unint64_t)a5
{
  id v9;
  HMIPersonsModelsSummary *v10;
  HMIPersonsModelsSummary *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMIPersonsModelsSummary;
  v10 = -[HMIPersonsModelsSummary init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_modelSummaries, a3);
    v11->_homeToExternalEquivalencies = a4;
    v11->_externalToExternalEquivalencies = a5;
  }

  return v11;
}

- (NSSet)modelSummaries
{
  return (NSSet *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)homeToExternalEquivalencies
{
  return self->_homeToExternalEquivalencies;
}

- (unint64_t)externalToExternalEquivalencies
{
  return self->_externalToExternalEquivalencies;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelSummaries, 0);
}

@end
