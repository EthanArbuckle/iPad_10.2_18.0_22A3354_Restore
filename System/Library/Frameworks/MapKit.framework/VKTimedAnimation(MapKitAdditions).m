@implementation VKTimedAnimation(MapKitAdditions)

+ (id)animationMatchingCurrentAnimationParametersWithName:()MapKitAdditions
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v3 = a3;
  if (objc_msgSend(MEMORY[0x1E0CEABB0], "_mapkit_shouldAdoptImplicitAnimationParameters"))
  {
    v4 = objc_alloc(MEMORY[0x1E0DC6570]);
    objc_msgSend(MEMORY[0x1E0CEABB0], "_mapkit_currentAnimationDuration");
    v5 = (void *)objc_msgSend(v4, "initWithDuration:name:", v3);
    objc_msgSend(MEMORY[0x1E0CEABB0], "_mapkit_currentAnimationTimingFunction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __89__VKTimedAnimation_MapKitAdditions__animationMatchingCurrentAnimationParametersWithName___block_invoke;
    v9[3] = &unk_1E20D8740;
    v10 = v6;
    v7 = v6;
    objc_msgSend(v5, "setTimingFunction:", v9);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
