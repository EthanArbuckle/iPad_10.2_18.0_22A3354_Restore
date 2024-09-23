@implementation ACUISActivityHostViewControllerFactory

+ (id)activityHostViewControllerWithDescriptor:(id)a3 sceneType:(int64_t)a4 metricsRequest:(id)a5
{
  id v7;
  id v8;
  ACUISActivitySceneDescriptor *v9;
  void *v10;
  _TtC18ActivityUIServices34ActivityListItemHostViewController *v11;
  void *v12;
  void *v13;
  _TtC18ActivityUIServices34ActivityListItemHostViewController *v14;
  __objc2_class *v15;
  id v16;
  void *v17;
  ACUISActivityHostViewController *v18;

  v7 = a5;
  v8 = a3;
  v9 = -[ACUISActivitySceneDescriptor initWithActivityDescriptor:payloadIdentifier:activitySceneType:metricsRequest:]([ACUISActivitySceneDescriptor alloc], "initWithActivityDescriptor:payloadIdentifier:activitySceneType:metricsRequest:", v8, 0, a4, v7);

  -[ACUISActivitySceneDescriptor _activitySceneDescriptor](v9, "_activitySceneDescriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  switch(a4)
  {
    case 0:
      v11 = [_TtC18ActivityUIServices34ActivityListItemHostViewController alloc];
      objc_msgSend(v10, "activityDescriptor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "metricsRequest");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[ActivityListItemHostViewController initWithActivityDescriptor:systemMetricsRequest:](v11, "initWithActivityDescriptor:systemMetricsRequest:", v12, v13);
      goto LABEL_8;
    case 1:
      v15 = _TtC18ActivityUIServices32ActivityBannerHostViewController;
      goto LABEL_7;
    case 2:
      v15 = _TtC18ActivityUIServices33ActivityAmbientHostViewController;
      goto LABEL_7;
    case 3:
      v15 = _TtC18ActivityUIServices40ActivityAmbientCompactHostViewController;
LABEL_7:
      v16 = [v15 alloc];
      objc_msgSend(v10, "activityDescriptor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "metricsRequest");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "payloadID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (_TtC18ActivityUIServices34ActivityListItemHostViewController *)objc_msgSend(v16, "initWithActivityDescriptor:systemMetricsRequest:payloadID:", v12, v13, v17);

LABEL_8:
      break;
    default:
      v14 = 0;
      break;
  }
  v18 = -[ACUISActivityHostViewController initWithActivityHostViewController:]([ACUISActivityHostViewController alloc], "initWithActivityHostViewController:", v14);

  return v18;
}

+ (id)activityHostViewControllerWithDescriptor:(id)a3 metricsRequest:(id)a4
{
  id v5;
  id v6;
  ACUISActivitySceneDescriptor *v7;
  void *v8;
  _TtC18ActivityUIServices34ActivityListItemHostViewController *v9;
  void *v10;
  void *v11;
  _TtC18ActivityUIServices34ActivityListItemHostViewController *v12;
  ACUISActivityHostViewController *v13;

  v5 = a4;
  v6 = a3;
  v7 = -[ACUISActivitySceneDescriptor initWithActivityDescriptor:payloadIdentifier:activitySceneType:metricsRequest:]([ACUISActivitySceneDescriptor alloc], "initWithActivityDescriptor:payloadIdentifier:activitySceneType:metricsRequest:", v6, 0, 0, v5);

  -[ACUISActivitySceneDescriptor _activitySceneDescriptor](v7, "_activitySceneDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = [_TtC18ActivityUIServices34ActivityListItemHostViewController alloc];
  objc_msgSend(v8, "activityDescriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "metricsRequest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[ActivityListItemHostViewController initWithActivityDescriptor:systemMetricsRequest:](v9, "initWithActivityDescriptor:systemMetricsRequest:", v10, v11);

  v13 = -[ACUISActivityHostViewController initWithActivityHostViewController:]([ACUISActivityHostViewController alloc], "initWithActivityHostViewController:", v12);
  return v13;
}

+ (id)activityHostViewControllerWithDescriptor:(id)a3 metricsRequest:(id)a4 payloadID:(id)a5
{
  id v7;
  id v8;
  id v9;
  ACUISActivitySceneDescriptor *v10;
  void *v11;
  _TtC18ActivityUIServices32ActivityBannerHostViewController *v12;
  void *v13;
  void *v14;
  _TtC18ActivityUIServices32ActivityBannerHostViewController *v15;
  ACUISActivityHostViewController *v16;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[ACUISActivitySceneDescriptor initWithActivityDescriptor:payloadIdentifier:activitySceneType:metricsRequest:]([ACUISActivitySceneDescriptor alloc], "initWithActivityDescriptor:payloadIdentifier:activitySceneType:metricsRequest:", v9, v7, 1, v8);

  -[ACUISActivitySceneDescriptor _activitySceneDescriptor](v10, "_activitySceneDescriptor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = [_TtC18ActivityUIServices32ActivityBannerHostViewController alloc];
  objc_msgSend(v11, "activityDescriptor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "metricsRequest");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[ActivityBannerHostViewController initWithActivityDescriptor:systemMetricsRequest:payloadID:](v12, "initWithActivityDescriptor:systemMetricsRequest:payloadID:", v13, v14, v7);

  v16 = -[ACUISActivityHostViewController initWithActivityHostViewController:]([ACUISActivityHostViewController alloc], "initWithActivityHostViewController:", v15);
  return v16;
}

@end
