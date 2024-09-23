@implementation SGMISaliencyAnalyzer

+ (id)analyzeSimpleMailMessage:(id)a3 senderConnectionScore:(id)a4 store:(id)a5 logOrStageSaliency:(BOOL)a6 commitSaliency:(BOOL)a7 error:(id *)a8
{
  _BOOL4 v9;
  _BOOL4 v10;
  id v13;
  id v14;
  id v15;
  SGMIFeatureVector *v16;
  void *v17;
  SGMIFeatureVector *v18;
  void *v19;
  void *v20;

  v9 = a7;
  v10 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = [SGMIFeatureVector alloc];
  objc_msgSend(v15, "messageId");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[SGMIFeatureVector initWithMessageId:hasHashedMessageId:simpleMailMessage:senderConnectionScore:biomeMessageSummary:store:preLoadedFeatureNames:](v16, "initWithMessageId:hasHashedMessageId:simpleMailMessage:senderConnectionScore:biomeMessageSummary:store:preLoadedFeatureNames:", v17, 0, v15, v14, 0, v13, MEMORY[0x1E0C9AA60]);

  +[SGMISaliencyModelConfig defaultConfig](SGMISaliencyModelConfig, "defaultConfig");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGMISaliencyInference evaluate:enablePreFiltering:config:error:](SGMISaliencyInference, "evaluate:enablePreFiltering:config:error:", v18, 1, v19, a8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!*a8)
  {
    if (v10)
      -[SGMIFeatureVector logOrStageWithSaliency:](v18, "logOrStageWithSaliency:", v20);
    if (v9)
      objc_msgSend(v13, "commitSaliency:", v20);
  }

  return v20;
}

@end
