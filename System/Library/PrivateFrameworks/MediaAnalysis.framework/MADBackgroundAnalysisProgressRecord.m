@implementation MADBackgroundAnalysisProgressRecord

- (unint64_t)progress
{
  unint64_t result;
  float v4;

  result = -[MADBackgroundAnalysisProgressRecord totalAssetCount](self, "totalAssetCount");
  if (result)
  {
    v4 = (float)-[MADBackgroundAnalysisProgressRecord processedAssetCount](self, "processedAssetCount");
    return (unint64_t)(float)((float)(v4
                                           / (float)-[MADBackgroundAnalysisProgressRecord totalAssetCount](self, "totalAssetCount"))* 100.0);
  }
  return result;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p, "), v5, self);

  VCPTaskIDDescription(-[MADBackgroundAnalysisProgressRecord activityID](self, "activityID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("activityID: %@, "), v6);

  objc_msgSend(v3, "appendFormat:", CFSTR("analysisSubtype: %d, "), -[MADBackgroundAnalysisProgressRecord analysisSubtype](self, "analysisSubtype"));
  objc_msgSend(v3, "appendFormat:", CFSTR("version: %d, "), -[MADBackgroundAnalysisProgressRecord version](self, "version"));
  objc_msgSend(v3, "appendFormat:", CFSTR("processedAssetCount: %d, "), -[MADBackgroundAnalysisProgressRecord processedAssetCount](self, "processedAssetCount"));
  objc_msgSend(v3, "appendFormat:", CFSTR("totalAssetCount: %d, "), -[MADBackgroundAnalysisProgressRecord totalAssetCount](self, "totalAssetCount"));
  objc_msgSend(v3, "appendFormat:", CFSTR("progress: %d, "), -[MADBackgroundAnalysisProgressRecord progress](self, "progress"));
  -[MADBackgroundAnalysisProgressRecord storeDate](self, "storeDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("storeDate: %@>"), v7);

  return v3;
}

- (unint64_t)activityID
{
  return self->_activityID;
}

- (void)setActivityID:(unint64_t)a3
{
  self->_activityID = a3;
}

- (unint64_t)analysisSubtype
{
  return self->_analysisSubtype;
}

- (void)setAnalysisSubtype:(unint64_t)a3
{
  self->_analysisSubtype = a3;
}

- (NSDate)storeDate
{
  return self->_storeDate;
}

- (void)setStoreDate:(id)a3
{
  objc_storeStrong((id *)&self->_storeDate, a3);
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (unint64_t)processedAssetCount
{
  return self->_processedAssetCount;
}

- (void)setProcessedAssetCount:(unint64_t)a3
{
  self->_processedAssetCount = a3;
}

- (unint64_t)totalAssetCount
{
  return self->_totalAssetCount;
}

- (void)setTotalAssetCount:(unint64_t)a3
{
  self->_totalAssetCount = a3;
}

- (void)setProgress:(unint64_t)a3
{
  self->_progress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeDate, 0);
}

@end
