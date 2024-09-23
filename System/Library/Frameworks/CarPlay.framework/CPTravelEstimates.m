@implementation CPTravelEstimates

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)timeRemainingColorForColor:(unint64_t)a3
{
  void *v3;

  switch(a3)
  {
    case 1uLL:
      objc_msgSend(a1, "_greenColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2uLL:
      objc_msgSend(a1, "_orangeColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3uLL:
      objc_msgSend(a1, "_redColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v3;
}

+ (id)_greenColor
{
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "colorWithDynamicProvider:", &__block_literal_global_0);
}

id __32__CPTravelEstimates__greenColor__block_invoke(uint64_t a1, void *a2)
{
  double v2;
  double v3;
  double v4;

  if (objc_msgSend(a2, "userInterfaceStyle") == 2)
  {
    v2 = 0.298039216;
    v3 = 0.850980392;
    v4 = 0.392156863;
  }
  else
  {
    v2 = 0.121568627;
    v3 = 0.4;
    v4 = 0.168627451;
  }
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", v2, v3, v4, 1.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_redColor
{
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "colorWithDynamicProvider:", &__block_literal_global_8);
}

id __30__CPTravelEstimates__redColor__block_invoke(uint64_t a1, void *a2)
{
  double v2;
  double v3;
  double v4;

  if (objc_msgSend(a2, "userInterfaceStyle") == 2)
  {
    v2 = 0.48627451;
    v3 = 0.458823529;
    v4 = 1.0;
  }
  else
  {
    v4 = 0.670588235;
    v2 = 0.129411765;
    v3 = 0.101960784;
  }
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", v4, v2, v3, 1.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_orangeColor
{
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "colorWithDynamicProvider:", &__block_literal_global_9);
}

id __33__CPTravelEstimates__orangeColor__block_invoke(uint64_t a1, void *a2)
{
  double v2;
  double v3;

  if (objc_msgSend(a2, "userInterfaceStyle") == 2)
  {
    v2 = 0.584313725;
    v3 = 1.0;
  }
  else
  {
    v3 = 0.521568627;
    v2 = 0.290196078;
  }
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", v3, v2, 0.0, 1.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_init
{
  id v3;
  void *v4;
  void *v5;
  CPTravelEstimates *v6;

  v3 = objc_alloc(MEMORY[0x24BDD1660]);
  objc_msgSend(MEMORY[0x24BDD1928], "meters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithDoubleValue:unit:", v4, 0.0);
  v6 = -[CPTravelEstimates initWithDistanceRemaining:timeRemaining:](self, "initWithDistanceRemaining:timeRemaining:", v5, 0.0);

  return v6;
}

- (CPTravelEstimates)initWithDistanceRemaining:(NSMeasurement *)distance timeRemaining:(NSTimeInterval)time
{
  NSMeasurement *v6;
  CPTravelEstimates *v7;
  uint64_t v8;
  NSMeasurement *distanceRemaining;
  uint64_t v10;
  NSMeasurement *distanceRemainingToDisplay;
  objc_super v13;

  v6 = distance;
  v13.receiver = self;
  v13.super_class = (Class)CPTravelEstimates;
  v7 = -[CPTravelEstimates init](&v13, sel_init);
  if (v7)
  {
    v8 = -[NSMeasurement copy](v6, "copy");
    distanceRemaining = v7->_distanceRemaining;
    v7->_distanceRemaining = (NSMeasurement *)v8;

    v10 = -[NSMeasurement copy](v6, "copy");
    distanceRemainingToDisplay = v7->_distanceRemainingToDisplay;
    v7->_distanceRemainingToDisplay = (NSMeasurement *)v10;

    v7->_timeRemaining = time;
  }

  return v7;
}

- (CPTravelEstimates)initWithDistanceRemaining:(id)a3 distanceRemainingToDisplay:(id)a4 timeRemaining:(double)a5
{
  id v8;
  id v9;
  CPTravelEstimates *v10;
  uint64_t v11;
  NSMeasurement *distanceRemaining;
  uint64_t v13;
  NSMeasurement *distanceRemainingToDisplay;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CPTravelEstimates;
  v10 = -[CPTravelEstimates init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    distanceRemaining = v10->_distanceRemaining;
    v10->_distanceRemaining = (NSMeasurement *)v11;

    v13 = objc_msgSend(v9, "copy");
    distanceRemainingToDisplay = v10->_distanceRemainingToDisplay;
    v10->_distanceRemainingToDisplay = (NSMeasurement *)v13;

    v10->_timeRemaining = a5;
  }

  return v10;
}

- (CPTravelEstimates)initWithCoder:(id)a3
{
  id v4;
  CPTravelEstimates *v5;
  uint64_t v6;
  NSMeasurement *distanceRemaining;
  uint64_t v8;
  NSMeasurement *distanceRemainingToDisplay;
  double v10;

  v4 = a3;
  v5 = -[CPTravelEstimates _init](self, "_init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCPTravelEstimatesDistanceRemainingKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    distanceRemaining = v5->_distanceRemaining;
    v5->_distanceRemaining = (NSMeasurement *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCPTravelEstimatesDistanceRemainingDisplayKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    distanceRemainingToDisplay = v5->_distanceRemainingToDisplay;
    v5->_distanceRemainingToDisplay = (NSMeasurement *)v8;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("kCPTravelEstimatesTimeRemainingKey"));
    v5->_timeRemaining = v10;
    v5->_timeRemainingColor = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kCPTravelEstimatesTimeRemainingColorKey"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[CPTravelEstimates distanceRemaining](self, "distanceRemaining");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("kCPTravelEstimatesDistanceRemainingKey"));

  -[CPTravelEstimates distanceRemainingToDisplay](self, "distanceRemainingToDisplay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("kCPTravelEstimatesDistanceRemainingDisplayKey"));

  -[CPTravelEstimates timeRemaining](self, "timeRemaining");
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("kCPTravelEstimatesTimeRemainingKey"));
  objc_msgSend(v6, "encodeInteger:forKey:", -[CPTravelEstimates timeRemainingColor](self, "timeRemainingColor"), CFSTR("kCPTravelEstimatesTimeRemainingColorKey"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v7.receiver = self;
  v7.super_class = (Class)CPTravelEstimates;
  -[CPTravelEstimates description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ {distanceRemaining: %@, distanceRemainingToDisplay: %@, timeRemaining: %f}"), v4, self->_distanceRemaining, self->_distanceRemainingToDisplay, *(_QWORD *)&self->_timeRemaining);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSMeasurement)distanceRemainingToDisplay
{
  return self->_distanceRemainingToDisplay;
}

- (NSMeasurement)distanceRemaining
{
  return self->_distanceRemaining;
}

- (NSTimeInterval)timeRemaining
{
  return self->_timeRemaining;
}

- (unint64_t)timeRemainingColor
{
  return self->_timeRemainingColor;
}

- (void)setTimeRemainingColor:(unint64_t)a3
{
  self->_timeRemainingColor = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distanceRemaining, 0);
  objc_storeStrong((id *)&self->_distanceRemainingToDisplay, 0);
}

@end
