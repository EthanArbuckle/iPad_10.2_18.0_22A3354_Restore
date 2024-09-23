@implementation ABPK2DDetectionPostprocess

- (ABPK2DDetectionPostprocess)initWithInputJoints:(unint64_t)a3 andOutputJoints:(unint64_t)a4 use3DSkeletonForExtrapolation:(BOOL)a5 shouldPush3DSupportSkeleton:(BOOL)a6 withExtrapolationTime:(double)a7
{
  void *v7;
  void *v8;
  id v9;

  v7 = (void *)MEMORY[0x24BDBCE88];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), a4, a5, a6, a7, "-[ABPK2DDetectionPostprocess initWithInputJoints:andOutputJoints:use3DSkeletonForExtrapolation:shouldPush3DSupportSkeleton:withExtrapolationTime:]");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v8, 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v9);
}

- (int)extract2DSkeletonfromBuffers:(id)a3 withImagePreProcessingParams:(id)a4 atTimestamp:(double)a5 previousSkeleton3D:(id)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v8 = a3;
  v9 = a4;
  v10 = a6;
  v11 = (void *)MEMORY[0x24BDBCE88];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[ABPK2DDetectionPostprocess extract2DSkeletonfromBuffers:withImagePreProcessingParams:atTimestamp:previousSkeleton3D:]");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v12, 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v13);
}

- (void)getRawTrackedHumanSkeleton:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  v4 = (void *)MEMORY[0x24BDBCE88];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[ABPK2DDetectionPostprocess getRawTrackedHumanSkeleton:]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (void)getRawTrackedHumanSkeletonVector:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  v4 = (void *)MEMORY[0x24BDBCE88];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[ABPK2DDetectionPostprocess getRawTrackedHumanSkeletonVector:]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (void)getTrackedHumanSkeleton:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  v4 = (void *)MEMORY[0x24BDBCE88];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[ABPK2DDetectionPostprocess getTrackedHumanSkeleton:]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (void)getTrackedHumanForLiftingSkeleton:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  v4 = (void *)MEMORY[0x24BDBCE88];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[ABPK2DDetectionPostprocess getTrackedHumanForLiftingSkeleton:]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (void)getRawTrackedHumanForLiftingSkeleton:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  v4 = (void *)MEMORY[0x24BDBCE88];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[ABPK2DDetectionPostprocess getRawTrackedHumanForLiftingSkeleton:]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (id)getAligned3DSkeleton
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[ABPK2DDetectionPostprocess getAligned3DSkeleton]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v4, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v5);
}

- (id)get2DDetectionResultforRotation:(int64_t)a3 croppedRect:(CGRect)a4
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x24BDBCE88];
  v5 = *MEMORY[0x24BDBCAB8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, "-[ABPK2DDetectionPostprocess get2DDetectionResultforRotation:croppedRect:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "exceptionWithName:reason:userInfo:", v5, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (id)getRaw2DDetectionResultforRotation:(int64_t)a3 croppedRect:(CGRect)a4
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x24BDBCE88];
  v5 = *MEMORY[0x24BDBCAB8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, "-[ABPK2DDetectionPostprocess getRaw2DDetectionResultforRotation:croppedRect:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "exceptionWithName:reason:userInfo:", v5, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (void)_startExtract2DSkeletonSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (void)_endExtract2DSkeletonSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (void)_startMaxFilterSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (void)_endMaxFilterSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (void)_startExtractHumanSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (void)_endExtractHumanSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (void)_startExtrapolationSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (void)_endExtrapolationSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

@end
