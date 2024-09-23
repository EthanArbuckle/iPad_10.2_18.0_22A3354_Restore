@implementation ABPKGestureDetectionResult

- (ABPKGestureDetectionResult)init
{
  ABPKGestureDetectionResult *v2;
  ABPK2dSkeleton *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ABPKGestureDetectionResult;
  v2 = -[ABPKGestureDetectionResult init](&v5, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(ABPK2dSkeleton);
    -[ABPKGestureDetectionResult set2dSkeleton:isPoseValid:trackingId:gestureTypes:](v2, "set2dSkeleton:isPoseValid:trackingId:gestureTypes:", v3, 0, 0, MEMORY[0x24BDBD1A8]);

  }
  return v2;
}

- (void)set2dSkeleton:(id)a3 isPoseValid:(BOOL)a4 trackingId:(unsigned int)a5 gestureTypes:(id)a6
{
  ABPK2dSkeleton *v10;
  NSArray *v11;
  ABPK2dSkeleton *skeleton2D;
  NSArray *gestureTypes;
  ABPK2dSkeleton *v14;

  v10 = (ABPK2dSkeleton *)a3;
  v11 = (NSArray *)a6;
  skeleton2D = self->_skeleton2D;
  self->_skeleton2D = v10;
  v14 = v10;

  self->_isPoseValid = a4;
  self->_trackingId = a5;
  gestureTypes = self->_gestureTypes;
  self->_gestureTypes = v11;

}

- (int)overlayResultOnImage:(__CVBuffer *)a3 withResult:(__CVBuffer *)a4 withColor:
{
  double v4;
  NSObject *v8;
  NSObject *v9;
  ABPK2dSkeleton *skeleton2D;
  NSObject *v12;
  double v13;
  uint8_t v14[16];
  uint8_t v15[16];
  uint8_t buf[16];

  v13 = v4;
  __ABPKLogSharedInstance();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_210836000, v8, OS_LOG_TYPE_DEBUG, " Overlaying Gesture-Detection results on image ", buf, 2u);
  }

  if (!a4)
  {
    __ABPKLogSharedInstance();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_210836000, v9, OS_LOG_TYPE_ERROR, " Overlay image not initialized ", v15, 2u);
    }

  }
  skeleton2D = self->_skeleton2D;
  if (skeleton2D)
  {
    -[ABPK2dSkeleton printData](skeleton2D, "printData");
    return -[ABPK2dSkeleton overlaySkeletonOnImage:withResult:withColor:](self->_skeleton2D, "overlaySkeletonOnImage:withResult:withColor:", a3, a4, v13);
  }
  else
  {
    __ABPKLogSharedInstance();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_210836000, v12, OS_LOG_TYPE_ERROR, " _skeleton2D is nil ", v14, 2u);
    }

    return -6661;
  }
}

- (ABPK2dSkeleton)skeleton2D
{
  return self->_skeleton2D;
}

- (BOOL)isPoseValid
{
  return self->_isPoseValid;
}

- (unsigned)trackingId
{
  return self->_trackingId;
}

- (NSArray)gestureTypes
{
  return self->_gestureTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gestureTypes, 0);
  objc_storeStrong((id *)&self->_skeleton2D, 0);
}

@end
