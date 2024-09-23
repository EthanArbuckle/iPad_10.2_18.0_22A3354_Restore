@implementation ARRecordingTechniquePublic(ARKitAdditions)

- (void)_subscribeToBackgroundNotifications
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObserver:selector:name:object:", a1, sel_finishRecording, *MEMORY[0x1E0CEB288], 0);

}

- (void)_saveVideoInPhotosLibrary:()ARKitAdditions
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CD16F8];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__ARRecordingTechniquePublic_ARKitAdditions___saveVideoInPhotosLibrary___block_invoke;
  v7[3] = &unk_1EA586C30;
  v7[4] = a1;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "requestAuthorization:", v7);

}

- (void)copyVideoToPhotoLibrary:()ARKitAdditions
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CD16F8], "sharedPhotoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __70__ARRecordingTechniquePublic_ARKitAdditions__copyVideoToPhotoLibrary___block_invoke;
  v10[3] = &unk_1EA586888;
  v11 = v4;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __70__ARRecordingTechniquePublic_ARKitAdditions__copyVideoToPhotoLibrary___block_invoke_2;
  v8[3] = &unk_1EA586C58;
  v8[4] = a1;
  v9 = v11;
  v7 = v11;
  objc_msgSend(v5, "performChanges:completionHandler:", v10, v8);

}

@end
