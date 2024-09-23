@implementation SGMISimpleEngagementStats

- (SGMISimpleEngagementStats)initWithPositiveEngagement:(id)a3 noEngagement:(id)a4 negativeEngagement:(id)a5
{
  id v9;
  id v10;
  id v11;
  SGMISimpleEngagementStats *v12;
  SGMISimpleEngagementStats *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SGMISimpleEngagementStats;
  v12 = -[SGMISimpleEngagementStats init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_positiveEngagement, a3);
    objc_storeStrong((id *)&v13->_noEngagement, a4);
    objc_storeStrong((id *)&v13->_negativeEngagement, a5);
  }

  return v13;
}

- (NSNumber)positiveEngagement
{
  return self->_positiveEngagement;
}

- (NSNumber)noEngagement
{
  return self->_noEngagement;
}

- (NSNumber)negativeEngagement
{
  return self->_negativeEngagement;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_negativeEngagement, 0);
  objc_storeStrong((id *)&self->_noEngagement, 0);
  objc_storeStrong((id *)&self->_positiveEngagement, 0);
}

@end
