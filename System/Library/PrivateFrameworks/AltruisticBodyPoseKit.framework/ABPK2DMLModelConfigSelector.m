@implementation ABPK2DMLModelConfigSelector

+ (id)getModelWithNetworkConfig:(id)a3
{
  id v3;
  __objc2_class *v4;
  id v5;
  NSObject *v7;
  uint8_t v8[16];

  v3 = a3;
  if (objc_msgSend(v3, "algMode") == 4 || objc_msgSend(v3, "algMode") == 1)
  {
    if (objc_msgSend(v3, "deviceANEVersionPriorOrEqualToH12"))
    {
      v4 = ABPKMLModelConfiguration2DStandard;
LABEL_10:
      v5 = objc_alloc_init(v4);
      goto LABEL_11;
    }
LABEL_8:
    v4 = ABPKMLModelConfiguration2DStandardFull;
    goto LABEL_10;
  }
  if (objc_msgSend(v3, "algMode") == 2 || !objc_msgSend(v3, "algMode"))
  {
    v4 = ABPKMLModelConfiguration2DBreakthrough;
    goto LABEL_10;
  }
  if (objc_msgSend(v3, "algMode") == 10)
    goto LABEL_8;
  __ABPKLogSharedInstance();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_210836000, v7, OS_LOG_TYPE_ERROR, " Invalid algorithm mode specified ", v8, 2u);
  }

  v5 = 0;
LABEL_11:

  return v5;
}

+ (CGSize)inputDimensionsForModelWithNetworkConfig:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  v3 = a3;
  +[ABPK2DMLModelConfigSelector getModelWithNetworkConfig:](ABPK2DMLModelConfigSelector, "getModelWithNetworkConfig:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "abpkDeviceOrientation");

  objc_msgSend(v4, "inputDimensionsForABPKDeviceOrientation:", v5);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

+ (CGSize)inputDimensionsForModelWithABPKNetworkConfig:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  v3 = a3;
  +[ABPK2DMLModelConfigSelector getModelWithNetworkConfig:](ABPK2DMLModelConfigSelector, "getModelWithNetworkConfig:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "abpkDeviceOrientation");

  objc_msgSend(v4, "inputDimensionsForABPKDeviceOrientation:", v5);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

@end
