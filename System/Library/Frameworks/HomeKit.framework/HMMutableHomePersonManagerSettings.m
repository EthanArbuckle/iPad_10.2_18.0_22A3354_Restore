@implementation HMMutableHomePersonManagerSettings

- (id)copyWithZone:(_NSZone *)a3
{
  HMHomePersonManagerSettings *v4;

  v4 = -[HMHomePersonManagerSettings init](+[HMHomePersonManagerSettings allocWithZone:](HMHomePersonManagerSettings, "allocWithZone:", a3), "init");
  -[HMHomePersonManagerSettings setFaceClassificationEnabled:](v4, "setFaceClassificationEnabled:", -[HMHomePersonManagerSettings isFaceClassificationEnabled](self, "isFaceClassificationEnabled"));
  return v4;
}

@end
