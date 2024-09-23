@implementation HMDCameraClipFeedbackUploader

- (void)uploadFeedbackWithCameraProfileUUID:(id)a3 clipModel:(id)a4 completionHandler:(id)a5
{
  void *v7;
  id v8;
  id v9;
  id v10;

  v7 = (void *)MEMORY[0x1E0D31A70];
  v8 = a5;
  v9 = a3;
  objc_msgSend(a4, "hmbModelID");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "submitFeedbackWithCameraProfileUUID:clipUUID:completionHandler:", v9, v10, v8);

}

@end
