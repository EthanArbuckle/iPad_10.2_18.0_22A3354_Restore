@implementation HMIVideoAnalyzerResultActivityZoneFilter

- (HMIVideoAnalyzerResultActivityZoneFilter)initWithActivityZones:(id)a3 motionDetections:(id)a4
{
  id v7;
  id v8;
  HMIVideoAnalyzerResultActivityZoneFilter *v9;
  HMIVideoAnalyzerResultActivityZoneFilter *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMIVideoAnalyzerResultActivityZoneFilter;
  v9 = -[HMIVideoAnalyzerResultActivityZoneFilter init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_activityZones, a3);
    objc_storeStrong((id *)&v10->_motionDetections, a4);
  }

  return v10;
}

- (id)applyWithFrameResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  HMIVideoAnalyzerFrameResult *v12;
  void *v13;
  HMIVideoAnalyzerFrameResult *v14;

  v4 = a3;
  if (-[NSArray count](self->_activityZones, "count"))
  {
    -[HMIVideoAnalyzerResultActivityZoneFilter motionDetections](self, "motionDetections");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMIMotionDetection firstMotionDetectionInArray:withMode:](HMIMotionDetection, "firstMotionDetectionInArray:withMode:", v5, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "events");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMIVideoAnalyzerResultActivityZoneFilter activityZones](self, "activityZones");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v9) = 1042536202;
    LODWORD(v10) = 1042536202;
    +[HMICameraActivityZone filterEvents:withActivityZones:motionDetection:insetPercentageInclusion:insetPercentageExclusion:](HMICameraActivityZone, "filterEvents:withActivityZones:motionDetection:insetPercentageInclusion:insetPercentageExclusion:", v7, v8, v6, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = [HMIVideoAnalyzerFrameResult alloc];
    objc_msgSend(v4, "frame");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "regionOfInterest");
    v14 = -[HMIVideoAnalyzerFrameResult initWithFrame:events:regionOfInterest:](v12, "initWithFrame:events:regionOfInterest:", v13, v11);

  }
  else
  {
    v14 = (HMIVideoAnalyzerFrameResult *)v4;
  }

  return v14;
}

- (NSArray)activityZones
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)motionDetections
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_motionDetections, 0);
  objc_storeStrong((id *)&self->_activityZones, 0);
}

@end
