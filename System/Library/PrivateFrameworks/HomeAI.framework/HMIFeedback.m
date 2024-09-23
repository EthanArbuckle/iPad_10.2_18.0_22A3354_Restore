@implementation HMIFeedback

+ (void)submitFeedbackWithCameraProfileUUID:(id)a3 clipUUID:(id)a4 completionHandler:(id)a5
{
  objc_msgSend(a1, "submitFeedbackWithCameraProfileUUID:clipUUID:runRemotely:completionHandler:", a3, a4, 1, a5);
}

+ (void)submitFeedbackWithCameraProfileUUID:(id)a3 clipUUID:(id)a4 runRemotely:(BOOL)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[3];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a6;
  v17[0] = CFSTR("taskType");
  v17[1] = CFSTR("cameraProfileUUID");
  v18[0] = HMITaskTypeFeedbackTask;
  v18[1] = v9;
  v17[2] = CFSTR("clipUUID");
  v18[2] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5)
    +[HMITaskService taskServiceClient](HMITaskService, "taskServiceClient");
  else
    +[HMITaskService taskService](HMITaskService, "taskService");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __90__HMIFeedback_submitFeedbackWithCameraProfileUUID_clipUUID_runRemotely_completionHandler___block_invoke;
  v15[3] = &unk_24DBEBB90;
  v16 = v11;
  v14 = v11;
  objc_msgSend(v13, "submitTaskWithOptions:progressHandler:completionHandler:", v12, 0, v15);

}

uint64_t __90__HMIFeedback_submitFeedbackWithCameraProfileUUID_clipUUID_runRemotely_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
