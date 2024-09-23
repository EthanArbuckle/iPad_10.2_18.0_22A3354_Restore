@implementation HMDNaturalLightingActiveTransitionContext

- (HMDNaturalLightingActiveTransitionContext)initWithStartDate:(id)a3 millisecondsElapsedSinceStartDate:(unint64_t)a4 transitionChecksum:(id)a5
{
  id v8;
  id v9;
  HMDNaturalLightingActiveTransitionContext *v10;
  uint64_t v11;
  NSDate *startDate;
  uint64_t v13;
  NSNumber *transitionChecksum;
  objc_super v16;

  v8 = a3;
  v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HMDNaturalLightingActiveTransitionContext;
  v10 = -[HMDNaturalLightingActiveTransitionContext init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    startDate = v10->_startDate;
    v10->_startDate = (NSDate *)v11;

    v10->_millisecondsElapsedSinceStartDate = a4;
    v13 = objc_msgSend(v9, "copy");
    transitionChecksum = v10->_transitionChecksum;
    v10->_transitionChecksum = (NSNumber *)v13;

  }
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "startDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDNaturalLightingActiveTransitionContext startDate](self, "startDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqual:", v9)
      && (v10 = objc_msgSend(v7, "millisecondsElapsedSinceStartDate"),
          v10 == -[HMDNaturalLightingActiveTransitionContext millisecondsElapsedSinceStartDate](self, "millisecondsElapsedSinceStartDate")))
    {
      objc_msgSend(v7, "transitionChecksum");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDNaturalLightingActiveTransitionContext transitionChecksum](self, "transitionChecksum");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = HMFEqualObjects();

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[HMDNaturalLightingActiveTransitionContext startDate](self, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[HMDNaturalLightingActiveTransitionContext millisecondsElapsedSinceStartDate](self, "millisecondsElapsedSinceStartDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDNaturalLightingActiveTransitionContext startDate](self, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Start Date"), v4);
  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[HMDNaturalLightingActiveTransitionContext millisecondsElapsedSinceStartDate](self, "millisecondsElapsedSinceStartDate", v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Milliseconds Elapsed Since Start Date"), v7);
  v14[1] = v8;
  v9 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDNaturalLightingActiveTransitionContext transitionChecksum](self, "transitionChecksum");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("Transition Checksum"), v10);
  v14[2] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)millisecondsElapsedSinceStartDate
{
  return self->_millisecondsElapsedSinceStartDate;
}

- (NSNumber)transitionChecksum
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionChecksum, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
