@implementation ABPK2DDetectionPostProcessSelector

+ (id)get2DDetectionPostProcessWithNetworkConfig:(id)a3 use3DSkeletonForExtrapolation:(BOOL)a4 shouldPush3DSupportSkeleton:(BOOL)a5
{
  objc_msgSend(a1, "get2DDetectionPostProcessWithNetworkConfig:use3DSkeletonForExtrapolation:shouldPush3DSupportSkeleton:withExtrapolationTime:", a3, a4, a5, 0.3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)get2DDetectionPostProcessWithNetworkConfig:(id)a3 use3DSkeletonForExtrapolation:(BOOL)a4 shouldPush3DSupportSkeleton:(BOOL)a5 withExtrapolationTime:(double)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v9;
  ABPK2DDetectionPostprocessHeatmap *v10;
  uint64_t v11;
  __objc2_class **v12;
  NSObject *v13;
  ABPK2DDetectionPostprocessHeatmap *v14;
  uint8_t v16[16];

  v7 = a5;
  v8 = a4;
  v9 = a3;
  if (objc_msgSend(v9, "algMode") == 4)
  {
    v10 = [ABPK2DDetectionPostprocessHeatmap alloc];
    v11 = 17;
LABEL_13:
    v14 = -[ABPK2DDetectionPostprocessHeatmap initWithInputJoints:andOutputJoints:use3DSkeletonForExtrapolation:shouldPush3DSupportSkeleton:withExtrapolationTime:](v10, "initWithInputJoints:andOutputJoints:use3DSkeletonForExtrapolation:shouldPush3DSupportSkeleton:withExtrapolationTime:", 19, v11, v8, v7, a6);
    goto LABEL_14;
  }
  if (objc_msgSend(v9, "algMode") == 1)
    goto LABEL_4;
  if (objc_msgSend(v9, "algMode") == 2 || !objc_msgSend(v9, "algMode"))
  {
    v12 = off_24CA6DFB8;
    goto LABEL_12;
  }
  if (objc_msgSend(v9, "algMode") == 10)
  {
LABEL_4:
    v12 = off_24CA6DFB0;
LABEL_12:
    v10 = (ABPK2DDetectionPostprocessHeatmap *)objc_alloc(*v12);
    v11 = 19;
    goto LABEL_13;
  }
  __ABPKLogSharedInstance();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_210836000, v13, OS_LOG_TYPE_ERROR, " Invalid algorithm mode specified ", v16, 2u);
  }

  v14 = 0;
LABEL_14:

  return v14;
}

@end
