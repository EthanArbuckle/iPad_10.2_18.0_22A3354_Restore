@implementation WFTripInfo

- (WFTripInfo)initWithMKRoute:(id)a3
{
  id v5;
  WFTripInfo *v6;
  void *v7;
  uint64_t v8;
  NSString *routeName;
  id v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  NSMeasurement *distance;
  double v16;
  uint64_t v17;
  WFTimeInterval *expectedTravelTime;
  WFTripInfo *v19;
  void *v21;
  objc_super v22;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFTripInfo.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("route"));

  }
  v22.receiver = self;
  v22.super_class = (Class)WFTripInfo;
  v6 = -[WFTripInfo init](&v22, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "copy");
    routeName = v6->_routeName;
    v6->_routeName = (NSString *)v8;

    v10 = objc_alloc(MEMORY[0x24BDD1660]);
    objc_msgSend(v5, "distance");
    v12 = v11;
    objc_msgSend(MEMORY[0x24BDD1928], "meters");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v10, "initWithDoubleValue:unit:", v13, v12);
    distance = v6->_distance;
    v6->_distance = (NSMeasurement *)v14;

    objc_msgSend(v5, "expectedTravelTime");
    WFTimeIntervalFromExpectedTravelTime(v16);
    v17 = objc_claimAutoreleasedReturnValue();
    expectedTravelTime = v6->_expectedTravelTime;
    v6->_expectedTravelTime = (WFTimeInterval *)v17;

    v19 = v6;
  }

  return v6;
}

- (NSString)wfName
{
  void *v2;
  void *v3;

  -[WFTripInfo expectedTravelTime](self, "expectedTravelTime");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "absoluteTimeString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (WFTripInfo)initWithCoder:(id)a3
{
  id v4;
  WFTripInfo *v5;
  uint64_t v6;
  NSString *routeName;
  uint64_t v8;
  NSMeasurement *distance;
  uint64_t v10;
  WFTimeInterval *expectedTravelTime;
  WFTripInfo *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WFTripInfo;
  v5 = -[WFTripInfo init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("routeName"));
    v6 = objc_claimAutoreleasedReturnValue();
    routeName = v5->_routeName;
    v5->_routeName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("distance"));
    v8 = objc_claimAutoreleasedReturnValue();
    distance = v5->_distance;
    v5->_distance = (NSMeasurement *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expectedTravelTime"));
    v10 = objc_claimAutoreleasedReturnValue();
    expectedTravelTime = v5->_expectedTravelTime;
    v5->_expectedTravelTime = (WFTimeInterval *)v10;

    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *routeName;
  id v5;

  routeName = self->_routeName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", routeName, CFSTR("routeName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_distance, CFSTR("distance"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_expectedTravelTime, CFSTR("expectedTravelTime"));

}

- (NSString)routeName
{
  return self->_routeName;
}

- (NSMeasurement)distance
{
  return self->_distance;
}

- (WFTimeInterval)expectedTravelTime
{
  return self->_expectedTravelTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expectedTravelTime, 0);
  objc_storeStrong((id *)&self->_distance, 0);
  objc_storeStrong((id *)&self->_routeName, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
