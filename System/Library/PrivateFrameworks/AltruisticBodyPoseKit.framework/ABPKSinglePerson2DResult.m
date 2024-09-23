@implementation ABPKSinglePerson2DResult

- (ABPKSinglePerson2DResult)init
{
  ABPKSinglePerson2DResult *v2;
  ABPK2dSkeleton *v3;
  ABPK2dSkeleton *skeleton2D;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ABPKSinglePerson2DResult;
  v2 = -[ABPKSinglePerson2DResult init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(ABPK2dSkeleton);
    skeleton2D = v2->_skeleton2D;
    v2->_skeleton2D = v3;

    v2->_isPoseValid = 0;
    v2->_trackingId = 0;
  }
  return v2;
}

- (void)set2dSkeleton:(id)a3 isPoseValid:(BOOL)a4 trackingId:(unsigned int)a5
{
  objc_storeStrong((id *)&self->_skeleton2D, a3);
  self->_isPoseValid = a4;
  self->_trackingId = a5;
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
    _os_log_impl(&dword_210836000, v8, OS_LOG_TYPE_DEBUG, " Overlaying multi-person results on image ", buf, 2u);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_skeleton2D, 0);
}

@end
