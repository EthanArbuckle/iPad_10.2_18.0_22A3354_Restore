@implementation FBSMutableSceneDefinition

- (id)copyWithZone:(_NSZone *)a3
{
  FBSSceneDefinition *v4;

  v4 = -[FBSSceneDefinition init](+[FBSSceneDefinition allocWithZone:](FBSSceneDefinition, "allocWithZone:", a3), "init");
  -[FBSSceneDefinition setIdentity:](v4, "setIdentity:", self->super._identity);
  -[FBSSceneDefinition setClientIdentity:](v4, "setClientIdentity:", self->super._clientIdentity);
  -[FBSSceneDefinition setSpecification:](v4, "setSpecification:", self->super._specification);
  return v4;
}

@end
