@implementation HUCameraRecordingFeedbackActivity

- (HUCameraRecordingFeedbackActivity)initWithCameraClip:(id)a3 cameraProfile:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  HUCameraRecordingFeedbackActivity *v12;
  HUCameraRecordingFeedbackActivity *v13;
  void *v14;
  id submissionHandler;
  HUCameraRecordingExportPreviewViewController *v16;
  void *v17;
  void *v18;
  void *v19;
  HUCameraRecordingExportPreviewViewController *v20;
  uint64_t v21;
  UINavigationController *previewNavigationController;
  objc_super v24;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v24.receiver = self;
  v24.super_class = (Class)HUCameraRecordingFeedbackActivity;
  v12 = -[UIActivity init](&v24, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_cameraClip, a3);
    objc_storeStrong((id *)&v13->_cameraProfile, a4);
    v14 = _Block_copy(v11);
    submissionHandler = v13->_submissionHandler;
    v13->_submissionHandler = v14;

    v16 = [HUCameraRecordingExportPreviewViewController alloc];
    -[HUCameraRecordingFeedbackActivity cameraClip](v13, "cameraClip");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraRecordingFeedbackActivity cameraProfile](v13, "cameraProfile");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraRecordingFeedbackActivity submissionHandler](v13, "submissionHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[HUCameraRecordingExportPreviewViewController initWithCameraClip:cameraProfile:completionHandler:](v16, "initWithCameraClip:cameraProfile:completionHandler:", v17, v18, v19);

    v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7B8]), "initWithRootViewController:", v20);
    previewNavigationController = v13->_previewNavigationController;
    v13->_previewNavigationController = (UINavigationController *)v21;

  }
  return v13;
}

- (id)activityType
{
  return CFSTR("com.apple.Home.feedbackActivity");
}

- (id)activityTitle
{
  return _HULocalizedStringWithDefaultValue(CFSTR("HUCameraExportFeedbackActivityTitle"), CFSTR("HUCameraExportFeedbackActivityTitle"), 1);
}

- (id)activityImage
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA638], "_systemImageNamed:", CFSTR("apple.bubble.middle.bottom"));
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (void)prepareWithActivityItems:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "Preparing with activity items :%@", (uint8_t *)&v5, 0xCu);
  }

}

- (HMCameraClip)cameraClip
{
  return self->_cameraClip;
}

- (void)setCameraClip:(id)a3
{
  objc_storeStrong((id *)&self->_cameraClip, a3);
}

- (HMCameraProfile)cameraProfile
{
  return self->_cameraProfile;
}

- (void)setCameraProfile:(id)a3
{
  objc_storeStrong((id *)&self->_cameraProfile, a3);
}

- (id)submissionHandler
{
  return self->_submissionHandler;
}

- (void)setSubmissionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (UINavigationController)previewNavigationController
{
  return self->_previewNavigationController;
}

- (void)setPreviewNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_previewNavigationController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewNavigationController, 0);
  objc_storeStrong(&self->_submissionHandler, 0);
  objc_storeStrong((id *)&self->_cameraProfile, 0);
  objc_storeStrong((id *)&self->_cameraClip, 0);
}

@end
