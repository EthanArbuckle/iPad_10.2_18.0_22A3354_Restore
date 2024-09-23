@implementation FBSScene(BacklightServices)

- (id)backlightSceneEnvironment
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __56__FBSScene_BacklightServices__backlightSceneEnvironment__block_invoke;
  v2[3] = &unk_1E621ABC8;
  v2[4] = a1;
  objc_msgSend(a1, "backlightSceneEnvironmentWithCreationBlock:", v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
