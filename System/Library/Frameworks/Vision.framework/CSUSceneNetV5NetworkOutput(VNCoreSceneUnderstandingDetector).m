@implementation CSUSceneNetV5NetworkOutput(VNCoreSceneUnderstandingDetector)

- (id)VNRequiredBufferFromSelector:()VNCoreSceneUnderstandingDetector error:
{
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;

  objc_msgSend(a1, "performSelector:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else if (a4)
  {
    v9 = objc_alloc(MEMORY[0x1E0CB3940]);
    NSStringFromSelector(a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithFormat:", CFSTR("%@ did not provide a buffer"), v10);

    +[VNError errorForDataUnavailableWithLocalizedDescription:](VNError, "errorForDataUnavailableWithLocalizedDescription:", v11);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

@end
