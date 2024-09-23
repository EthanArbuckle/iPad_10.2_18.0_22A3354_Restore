@implementation FBSWorkspaceDestroySceneResponse

- (FBSWorkspaceDestroySceneResponse)initWithXPCDictionary:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FBSWorkspaceDestroySceneResponse;
  return -[FBSWorkspaceResponse initWithXPCDictionary:](&v4, sel_initWithXPCDictionary_, a3);
}

- (void)encodeWithXPCDictionary:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FBSWorkspaceDestroySceneResponse;
  -[FBSWorkspaceResponse encodeWithXPCDictionary:](&v3, sel_encodeWithXPCDictionary_, a3);
}

@end
