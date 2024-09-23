@implementation CAAnimation(SceneKitAdditions)

- (uint64_t)usesSceneTimeBase
{
  return objc_msgSend((id)objc_msgSend(a1, "valueForKey:", CFSTR("SCNAnimationAnimatesUsingSceneTimeKey")), "BOOLValue");
}

- (uint64_t)setUsesSceneTimeBase:()SceneKitAdditions
{
  return objc_msgSend(a1, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:"), CFSTR("SCNAnimationAnimatesUsingSceneTimeKey"));
}

- (double)fadeInDuration
{
  float v1;

  objc_msgSend((id)objc_msgSend(a1, "valueForKey:", CFSTR("SCNAnimationFadeInDurationKey")), "floatValue");
  return v1;
}

- (uint64_t)setFadeInDuration:()SceneKitAdditions
{
  *(float *)&a2 = a2;
  return objc_msgSend(a1, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", a2), CFSTR("SCNAnimationFadeInDurationKey"));
}

- (double)fadeOutDuration
{
  float v1;

  objc_msgSend((id)objc_msgSend(a1, "valueForKey:", CFSTR("SCNAnimationFadeOutDurationKey")), "floatValue");
  return v1;
}

- (uint64_t)setFadeOutDuration:()SceneKitAdditions
{
  *(float *)&a2 = a2;
  return objc_msgSend(a1, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", a2), CFSTR("SCNAnimationFadeOutDurationKey"));
}

- (uint64_t)commitsOnCompletion
{
  return objc_msgSend((id)objc_msgSend(a1, "valueForKey:", CFSTR("SCNAnimationCommitOnCompletion")), "BOOLValue");
}

- (uint64_t)setCommitsOnCompletion:()SceneKitAdditions
{
  return objc_msgSend(a1, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:"), CFSTR("SCNAnimationCommitOnCompletion"));
}

- (void)setAnimationEvents:()SceneKitAdditions
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  objc_msgSend(a1, "setValue:forKey:", v4, CFSTR("SCNAnimationEventsKey"));

}

- (uint64_t)animationEvents
{
  return objc_msgSend(a1, "valueForKey:", CFSTR("SCNAnimationEventsKey"));
}

+ (uint64_t)animationWithSCNAnimation:()SceneKitAdditions
{
  return objc_msgSend(a3, "caAnimation");
}

@end
