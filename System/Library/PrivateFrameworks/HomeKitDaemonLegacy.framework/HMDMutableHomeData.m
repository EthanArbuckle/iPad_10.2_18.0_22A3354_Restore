@implementation HMDMutableHomeData

- (id)copyWithZone:(_NSZone *)a3
{
  HMDHomeData *v5;

  v5 = -[HMDHomeData init](+[HMDHomeData allocWithZone:](HMDHomeData, "allocWithZone:"), "init");
  __HMDHomeDataCopyProperties(v5, self, (uint64_t)a3);
  return v5;
}

@end
