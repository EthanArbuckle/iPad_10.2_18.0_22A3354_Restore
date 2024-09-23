@implementation HMIVideoFrameAnalyzerResult

- (HMIVideoFrameAnalyzerResult)initWithFrame:(id)a3 events:(id)a4 backgroundEvents:(id)a5 backgroundTimeStamp:(id *)a6 regionOfInterest:(CGRect)a7 motionDetections:(id)a8
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v18;
  id v19;
  id v20;
  id v21;
  HMIVideoFrameAnalyzerResult *v22;
  HMIVideoFrameAnalyzerResult *v23;
  int64_t var3;
  objc_super v26;

  height = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v18 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a8;
  v26.receiver = self;
  v26.super_class = (Class)HMIVideoFrameAnalyzerResult;
  v22 = -[HMIVideoFrameAnalyzerResult init](&v26, sel_init);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_frame, a3);
    objc_storeStrong((id *)&v23->_events, a4);
    objc_storeStrong((id *)&v23->_backgroundEvents, a5);
    var3 = a6->var3;
    *(_OWORD *)&v23->_backgroundTimeStamp.value = *(_OWORD *)&a6->var0;
    v23->_backgroundTimeStamp.epoch = var3;
    v23->_regionOfInterest.origin.x = x;
    v23->_regionOfInterest.origin.y = y;
    v23->_regionOfInterest.size.width = width;
    v23->_regionOfInterest.size.height = height;
    objc_storeStrong((id *)&v23->_motionDetections, a8);
  }

  return v23;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  CMTime time;

  -[HMIVideoFrameAnalyzerResult events](self, "events");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_map:", &__block_literal_global_13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMIVideoFrameAnalyzerResult frame](self, "frame");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "presentationTimeStamp");
  else
    memset(&time, 0, sizeof(time));
  v7 = (__CFString *)CMTimeCopyDescription(0, &time);

  v8 = (void *)MEMORY[0x24BDD17C8];
  v9 = objc_opt_class();
  objc_msgSend(v4, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "componentsJoinedByString:", CFSTR(", "));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIVideoFrameAnalyzerResult regionOfInterest](self, "regionOfInterest");
  HMICGRectDescription(v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("<%@: %p> timeStamp: %@, detections: [%@], regionOfInterest: %@"), v9, self, v7, v11, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v17;
}

uint64_t __42__HMIVideoFrameAnalyzerResult_description__block_invoke()
{
  return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), objc_opt_class());
}

- (NSString)debugDescription
{
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: %p> %@"), objc_opt_class(), self, self);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)self->_frame;
  if (result)
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[$3CC8671D27C23BF42ADDB32F2B5E48AE presentationTimeStamp](result, "presentationTimeStamp");
  retstr->var0 = 0;
  *(_QWORD *)&retstr->var1 = 0;
  retstr->var3 = 0;
  return result;
}

- (HMIVideoFrame)frame
{
  return (HMIVideoFrame *)objc_getProperty(self, a2, 8, 1);
}

- (NSSet)events
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (NSSet)backgroundEvents
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)backgroundTimeStamp
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->_backgroundTimeStamp, 24, 1, 0);
  return result;
}

- (CGRect)regionOfInterest
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_regionOfInterest, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (NSArray)motionDetections
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_motionDetections, 0);
  objc_storeStrong((id *)&self->_backgroundEvents, 0);
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_frame, 0);
}

@end
