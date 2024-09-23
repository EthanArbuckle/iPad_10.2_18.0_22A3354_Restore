@implementation RBSProcessIdentity(FBSSceneClientIdentity)

- (id)fbs_sceneClientIdentity
{
  return +[FBSSceneClientIdentity identityForProcessIdentity:](FBSSceneClientIdentity, "identityForProcessIdentity:", a1);
}

@end
