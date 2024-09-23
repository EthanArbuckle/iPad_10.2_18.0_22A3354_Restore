@implementation UIScene(GameControllerSceneComponent)

- (GCSceneComponent)_gameControllerSceneComponent
{
  GCSceneComponent *v2;

  objc_msgSend(a1, "_sceneComponentForKey:", CFSTR("com.apple.gamecontroller.scenecomponent"));
  v2 = (GCSceneComponent *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v2 = -[GCSceneComponent initWithScene:]([GCSceneComponent alloc], "initWithScene:", a1);
      objc_msgSend(a1, "_registerSceneComponent:forKey:", v2, CFSTR("com.apple.gamecontroller.scenecomponent"));
    }
    else
    {
      v2 = 0;
    }
  }
  return v2;
}

@end
