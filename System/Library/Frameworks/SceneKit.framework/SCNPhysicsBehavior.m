@implementation SCNPhysicsBehavior

- (SCNPhysicsBehavior)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SCNPhysicsBehavior;
  return -[SCNPhysicsBehavior init](&v4, sel_init, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)bodyA
{
  return 0;
}

- (id)bodyB
{
  return 0;
}

- (BOOL)hasReferenceToPhysicsBody:(id)a3
{
  return -[SCNPhysicsBehavior bodyA](self, "bodyA") == a3 || -[SCNPhysicsBehavior bodyB](self, "bodyB") == a3;
}

@end
