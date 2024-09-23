@implementation MLParameterKey

- (MLParameterKey)initWithKeyName:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MLParameterKey;
  return -[MLKey initWithKeyName:](&v4, sel_initWithKeyName_, a3);
}

+ (MLParameterKey)learningRate
{
  return -[MLParameterKey initWithKeyName:]([MLParameterKey alloc], "initWithKeyName:", CFSTR("learningRate"));
}

+ (MLParameterKey)momentum
{
  return -[MLParameterKey initWithKeyName:]([MLParameterKey alloc], "initWithKeyName:", CFSTR("momentum"));
}

+ (MLParameterKey)miniBatchSize
{
  return -[MLParameterKey initWithKeyName:]([MLParameterKey alloc], "initWithKeyName:", CFSTR("miniBatchSize"));
}

+ (MLParameterKey)beta1
{
  return -[MLParameterKey initWithKeyName:]([MLParameterKey alloc], "initWithKeyName:", CFSTR("beta1"));
}

+ (MLParameterKey)beta2
{
  return -[MLParameterKey initWithKeyName:]([MLParameterKey alloc], "initWithKeyName:", CFSTR("beta2"));
}

+ (MLParameterKey)eps
{
  return -[MLParameterKey initWithKeyName:]([MLParameterKey alloc], "initWithKeyName:", CFSTR("eps"));
}

+ (MLParameterKey)epochs
{
  return -[MLParameterKey initWithKeyName:]([MLParameterKey alloc], "initWithKeyName:", CFSTR("epochs"));
}

+ (MLParameterKey)shuffle
{
  return -[MLParameterKey initWithKeyName:]([MLParameterKey alloc], "initWithKeyName:", CFSTR("shuffle"));
}

+ (MLParameterKey)seed
{
  return -[MLParameterKey initWithKeyName:]([MLParameterKey alloc], "initWithKeyName:", CFSTR("seed"));
}

+ (MLParameterKey)numberOfNeighbors
{
  return -[MLParameterKey initWithKeyName:]([MLParameterKey alloc], "initWithKeyName:", CFSTR("numberOfNeighbors"));
}

- (MLParameterKey)scopedTo:(NSString *)scope
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MLParameterKey;
  -[MLKey scopedTo:](&v4, sel_scopedTo_, scope);
  return (MLParameterKey *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)deletingPrefixingScope:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MLParameterKey;
  -[MLKey deletingPrefixingScope:](&v4, sel_deletingPrefixingScope_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)maxDepth
{
  return -[MLParameterKey initWithKeyName:]([MLParameterKey alloc], "initWithKeyName:", CFSTR("maxDepth"));
}

+ (id)objective
{
  return -[MLParameterKey initWithKeyName:]([MLParameterKey alloc], "initWithKeyName:", CFSTR("objective"));
}

+ (id)numTrees
{
  return -[MLParameterKey initWithKeyName:]([MLParameterKey alloc], "initWithKeyName:", CFSTR("numTrees"));
}

+ (id)numClasses
{
  return -[MLParameterKey initWithKeyName:]([MLParameterKey alloc], "initWithKeyName:", CFSTR("numClasses"));
}

+ (id)minChildWeight
{
  return -[MLParameterKey initWithKeyName:]([MLParameterKey alloc], "initWithKeyName:", CFSTR("minChildWeight"));
}

+ (id)updateType
{
  return -[MLParameterKey initWithKeyName:]([MLParameterKey alloc], "initWithKeyName:", CFSTR("updateType"));
}

+ (MLParameterKey)weights
{
  return -[MLParameterKey initWithKeyName:]([MLParameterKey alloc], "initWithKeyName:", CFSTR("weights"));
}

+ (MLParameterKey)biases
{
  return -[MLParameterKey initWithKeyName:]([MLParameterKey alloc], "initWithKeyName:", CFSTR("biases"));
}

+ (MLParameterKey)linkedModelFileName
{
  return -[MLParameterKey initWithKeyName:]([MLParameterKey alloc], "initWithKeyName:", CFSTR("linkedModelFileName"));
}

+ (MLParameterKey)linkedModelSearchPath
{
  return -[MLParameterKey initWithKeyName:]([MLParameterKey alloc], "initWithKeyName:", CFSTR("linkedModelSearchPath"));
}

+ (id)precisionRecallCurves
{
  return -[MLParameterKey initWithKeyName:]([MLParameterKey alloc], "initWithKeyName:", CFSTR("precisionRecallCurves"));
}

@end
