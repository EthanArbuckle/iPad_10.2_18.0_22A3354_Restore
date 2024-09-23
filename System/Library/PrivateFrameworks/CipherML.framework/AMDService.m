@implementation AMDService

+ (id)sendReplyForPIRData:(id)a3 requestError:(id)a4 keyword:(id)a5 uuid:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;

  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  getAMDClientClass();
  v15 = (void *)objc_opt_new();
  objc_msgSend(v15, "sendPIRData:forKeyword:withCallHandle:andRequestError:error:", v14, v12, v11, v13, a7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)sendReplyForBatchPIR:(id)a3 requestError:(id)a4 keywords:(id)a5 uuid:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;

  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  getAMDClientClass();
  v15 = (void *)objc_opt_new();
  objc_msgSend(v15, "sendBatchedPIRData:forKeywords:withCallHandle:andRequestError:error:", v14, v12, v11, v13, a7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)sendReplyForBatchPEC:(id)a3 requestError:(id)a4 uuid:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  getAMDClientClass();
  v12 = (void *)objc_opt_new();
  objc_msgSend(v12, "sendBatchedPECSimilarityScores:withCallHandle:andRequestError:error:", v11, v9, v10, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

@end
