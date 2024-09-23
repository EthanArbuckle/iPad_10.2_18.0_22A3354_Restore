@implementation EDAMAdImpressions

+ (id)structName
{
  return CFSTR("AdImpressions");
}

+ (id)structFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_748;
  if (!structFields_structFields_748)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 8, 0, CFSTR("adId"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 8, 0, CFSTR("impressionCount"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9[1] = v4;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 8, 0, CFSTR("impressionTime"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 3);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)structFields_structFields_748;
    structFields_structFields_748 = v6;

    v2 = (void *)structFields_structFields_748;
  }
  return v2;
}

- (NSNumber)adId
{
  return self->_adId;
}

- (void)setAdId:(id)a3
{
  objc_storeStrong((id *)&self->_adId, a3);
}

- (NSNumber)impressionCount
{
  return self->_impressionCount;
}

- (void)setImpressionCount:(id)a3
{
  objc_storeStrong((id *)&self->_impressionCount, a3);
}

- (NSNumber)impressionTime
{
  return self->_impressionTime;
}

- (void)setImpressionTime:(id)a3
{
  objc_storeStrong((id *)&self->_impressionTime, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impressionTime, 0);
  objc_storeStrong((id *)&self->_impressionCount, 0);
  objc_storeStrong((id *)&self->_adId, 0);
}

@end
