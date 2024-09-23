@implementation HMIMutableHomePersonManagerSettings

- (id)copyWithZone:(_NSZone *)a3
{
  HMIHomePersonManagerSettings *v4;

  v4 = -[HMIHomePersonManagerSettings init](+[HMIHomePersonManagerSettings allocWithZone:](HMIHomePersonManagerSettings, "allocWithZone:", a3), "init");
  -[HMIHomePersonManagerSettings setFaceClassificationEnabled:](v4, "setFaceClassificationEnabled:", -[HMIHomePersonManagerSettings isFaceClassificationEnabled](self, "isFaceClassificationEnabled"));
  return v4;
}

@end
