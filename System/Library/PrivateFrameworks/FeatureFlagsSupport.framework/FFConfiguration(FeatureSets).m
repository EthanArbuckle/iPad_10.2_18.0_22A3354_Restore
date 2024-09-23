@implementation FFConfiguration(FeatureSets)

- (void)_valueForFeatureSet:()FeatureSets atLevel:.cold.1(uint64_t a1)
{
  qword_1EFEC93C0 = (uint64_t)"BUG IN CLIENT OF LIBFEATUREFLAGS: this API can't be used with this FFLevel";
  qword_1EFEC93F0 = a1;
  __break(1u);
}

@end
