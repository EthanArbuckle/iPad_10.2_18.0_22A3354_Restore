@implementation HMEEventMetadata

- (id)initDefaultMetadata
{
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  return -[HMEEventMetadata initWithSource:cachePolicy:combineType:timestamp:](self, "initWithSource:cachePolicy:combineType:timestamp:", CFSTR("unknown"), 1, 1);
}

- (HMEEventMetadata)initWithSource:(id)a3 cachePolicy:(unint64_t)a4 combineType:(unint64_t)a5 timestamp:(double)a6
{
  return (HMEEventMetadata *)-[HMEEventMetadata _initWithSource:rawCachePolicy:rawCombineType:rawQos:timestamp:](self, "_initWithSource:rawCachePolicy:rawCombineType:rawQos:timestamp:", a3, a4, a5, 0, a6);
}

- (id)_initWithSource:(id)a3 rawCachePolicy:(unint64_t)a4 rawCombineType:(unint64_t)a5 rawQos:(unint64_t)a6 timestamp:(double)a7
{
  id v13;
  HMEEventMetadata *v14;
  HMEEventMetadata *v15;
  objc_super v17;

  v13 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HMEEventMetadata;
  v14 = -[HMEEventMetadata init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_source, a3);
    v15->_rawCombineType = a5;
    v15->_rawCachePolicy = a4;
    v15->_rawQOS = a6;
    v15->_intervalSinceReferenceDate = a7;
  }

  return v15;
}

- (unint64_t)cachePolicy
{
  unint64_t result;

  result = -[HMEEventMetadata rawCachePolicy](self, "rawCachePolicy");
  if (result >= 3)
    return 0;
  return result;
}

- (unint64_t)combineType
{
  unint64_t result;

  result = -[HMEEventMetadata rawCombineType](self, "rawCombineType");
  if (result >= 3)
    return 0;
  return result;
}

- (NSString)source
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (double)intervalSinceReferenceDate
{
  return self->_intervalSinceReferenceDate;
}

- (unint64_t)rawCombineType
{
  return self->_rawCombineType;
}

- (unint64_t)rawCachePolicy
{
  return self->_rawCachePolicy;
}

- (unint64_t)rawQOS
{
  return self->_rawQOS;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
}

@end
