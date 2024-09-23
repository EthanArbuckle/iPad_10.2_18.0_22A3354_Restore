@implementation CSEndpointerMetrics

- (CSEndpointerMetrics)initWithTotalAudioRecorded:(double)a3 endpointBufferHostTime:(unint64_t)a4 featuresAtEndpoint:(id)a5 endpointerType:(int64_t)a6 asrFeatureLatencyDistribution:(id)a7 additionalMetrics:(id)a8 trailingSilenceDurationAtEndpoint:(double)a9 requestId:(id)a10 osdFeatures:(id)a11 asrFeatures:(id)a12 isRequestTimeOut:(BOOL)a13 assetConfigVersion:(id)a14 blkHepAudioOrigin:(double)a15 vtExtraAudioAtStartInMs:(double)a16 firstAudioSampleSensorTimestamp:(unint64_t)a17 isAnchorTimeBuffered:(BOOL)a18 endpointHostTime:(unint64_t)a19 audioDeliveryHostTimeDelta:(unint64_t)a20
{
  id v29;
  id v30;
  CSEndpointerMetrics *v31;
  CSEndpointerMetrics *v32;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  objc_super v41;

  v29 = a5;
  v30 = a7;
  v40 = a8;
  v39 = a10;
  v38 = a11;
  v37 = a12;
  v36 = a14;
  v41.receiver = self;
  v41.super_class = (Class)CSEndpointerMetrics;
  v31 = -[CSEndpointerMetrics init](&v41, sel_init);
  v32 = v31;
  if (v31)
  {
    v31->_totalAudioRecorded = a3;
    v31->_endpointBufferHostTime = a4;
    objc_storeStrong((id *)&v31->_featuresAtEndpoint, a5);
    v32->_endpointerType = a6;
    objc_storeStrong((id *)&v32->_asrFeatureLatencyDistribution, a7);
    objc_storeStrong((id *)&v32->_additionalMetrics, a8);
    v32->_trailingSilenceDurationAtEndpoint = a9;
    objc_storeStrong((id *)&v32->_requestId, a10);
    objc_storeStrong((id *)&v32->_osdFeaturesAtEndpoint, a11);
    objc_storeStrong((id *)&v32->_asrFeaturesAtEndpoint, a12);
    v32->_isRequestTimeOut = a13;
    objc_storeStrong((id *)&v32->_assetConfigVersion, a14);
    v32->_blkHepAudioOrigin = a15;
    v32->_vtExtraAudioAtStartInMs = a16;
    v32->_isAnchorTimeBuffered = a18;
    v32->_firstAudioSampleSensorTimestamp = a17;
    v32->_endpointHostTime = a19;
    v32->_audioDeliveryHostTimeDelta = a20;
  }

  return v32;
}

- (CSEndpointerMetrics)initWithTotalAudioRecorded:(double)a3 endpointBufferHostTime:(unint64_t)a4 featuresAtEndpoint:(id)a5 endpointerType:(int64_t)a6 asrFeatureLatencyDistribution:(id)a7 additionalMetrics:(id)a8 trailingSilenceDurationAtEndpoint:(double)a9 requestId:(id)a10
{
  id v19;
  id v20;
  id v21;
  CSEndpointerMetrics *v22;
  CSEndpointerMetrics *v23;
  OSDFeatures *osdFeaturesAtEndpoint;
  CSASRFeatures *asrFeaturesAtEndpoint;
  NSString *assetConfigVersion;
  id v28;
  objc_super v29;

  v28 = a5;
  v19 = a7;
  v20 = a8;
  v21 = a10;
  v29.receiver = self;
  v29.super_class = (Class)CSEndpointerMetrics;
  v22 = -[CSEndpointerMetrics init](&v29, sel_init);
  v23 = v22;
  if (v22)
  {
    v22->_totalAudioRecorded = a3;
    v22->_endpointBufferHostTime = a4;
    objc_storeStrong((id *)&v22->_featuresAtEndpoint, a5);
    v23->_endpointerType = a6;
    objc_storeStrong((id *)&v23->_asrFeatureLatencyDistribution, a7);
    objc_storeStrong((id *)&v23->_additionalMetrics, a8);
    v23->_trailingSilenceDurationAtEndpoint = a9;
    objc_storeStrong((id *)&v23->_requestId, a10);
    osdFeaturesAtEndpoint = v23->_osdFeaturesAtEndpoint;
    v23->_osdFeaturesAtEndpoint = 0;

    asrFeaturesAtEndpoint = v23->_asrFeaturesAtEndpoint;
    v23->_asrFeaturesAtEndpoint = 0;

    v23->_isRequestTimeOut = 0;
    assetConfigVersion = v23->_assetConfigVersion;
    v23->_assetConfigVersion = 0;

    v23->_isAnchorTimeBuffered = 0;
    v23->_vtExtraAudioAtStartInMs = 0.0;
    v23->_firstAudioSampleSensorTimestamp = 0;
    v23->_blkHepAudioOrigin = 0.0;
  }

  return v23;
}

- (id)metricsCopyWithRequestId:(id)a3 lastAudioChunkHostTime:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  CSEndpointerMetrics *v10;
  CSEndpointerMetrics *v11;
  uint64_t v13;
  uint64_t v14;

  v6 = a3;
  -[CSEndpointerMetrics additionalMetrics](self, "additionalMetrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v9, CFSTR("lastAudioChunkHostTime"));

  v10 = [CSEndpointerMetrics alloc];
  -[CSEndpointerMetrics totalAudioRecorded](self, "totalAudioRecorded");
  LOBYTE(v14) = self->_isAnchorTimeBuffered;
  LOBYTE(v13) = self->_isRequestTimeOut;
  v11 = -[CSEndpointerMetrics initWithTotalAudioRecorded:endpointBufferHostTime:featuresAtEndpoint:endpointerType:asrFeatureLatencyDistribution:additionalMetrics:trailingSilenceDurationAtEndpoint:requestId:osdFeatures:asrFeatures:isRequestTimeOut:assetConfigVersion:blkHepAudioOrigin:vtExtraAudioAtStartInMs:firstAudioSampleSensorTimestamp:isAnchorTimeBuffered:endpointHostTime:audioDeliveryHostTimeDelta:](v10, "initWithTotalAudioRecorded:endpointBufferHostTime:featuresAtEndpoint:endpointerType:asrFeatureLatencyDistribution:additionalMetrics:trailingSilenceDurationAtEndpoint:requestId:osdFeatures:asrFeatures:isRequestTimeOut:assetConfigVersion:blkHepAudioOrigin:vtExtraAudioAtStartInMs:firstAudioSampleSensorTimestamp:isAnchorTimeBuffered:endpointHostTime:audioDeliveryHostTimeDelta:", self->_endpointBufferHostTime, self->_featuresAtEndpoint, self->_endpointerType, self->_asrFeatureLatencyDistribution, v8, v6, self->_osdFeaturesAtEndpoint, self->_asrFeaturesAtEndpoint, v13, self->_assetConfigVersion, self->_firstAudioSampleSensorTimestamp, v14, self->_endpointHostTime, self->_audioDeliveryHostTimeDelta);

  return v11;
}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("[totalAudioRecorded = %f]"), *(_QWORD *)&self->_totalAudioRecorded);
  objc_msgSend(v3, "appendFormat:", CFSTR("[endpointBufferHostTime = %llu]"), self->_endpointBufferHostTime);
  objc_msgSend(v3, "appendFormat:", CFSTR("[trailingSilenceDurationAtEndpoint = %f]"), *(_QWORD *)&self->_trailingSilenceDurationAtEndpoint);
  objc_msgSend(v3, "appendFormat:", CFSTR("[endpointerType = %lu]"), self->_endpointerType);
  objc_msgSend(v3, "appendFormat:", CFSTR("[featuresAtEndpoint = %@]"), self->_featuresAtEndpoint);
  objc_msgSend(v3, "appendFormat:", CFSTR("[additionalMetrics = %@]"), self->_additionalMetrics);
  objc_msgSend(v3, "appendFormat:", CFSTR("[requestId = %@]"), self->_requestId);
  return v3;
}

- (CSEndpointerMetrics)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  CSEndpointerMetrics *v28;
  uint64_t v30;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CSEndpointMetrics:::totalAudioRecorded"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CSEndpointMetrics:::endpointBufferHostTime"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v7, "unsignedLongLongValue");

  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = objc_opt_class();
  objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v10, CFSTR("CSEndpointMetrics:::featuresAtEndpoint"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CSEndpointMetrics:::endpointerType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "unsignedIntegerValue");

  v14 = (void *)MEMORY[0x1E0C99E60];
  v15 = objc_opt_class();
  v16 = objc_opt_class();
  objc_msgSend(v14, "setWithObjects:", v15, v16, objc_opt_class(), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v17, CFSTR("CSEndpointMetrics:::asrFeatureLatencyDistribution"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x1E0C99E60];
  v20 = objc_opt_class();
  v21 = objc_opt_class();
  objc_msgSend(v19, "setWithObjects:", v20, v21, objc_opt_class(), 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v22, CFSTR("CSEndpointMetrics:::additionalMetrics"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CSEndpointMetrics:::trailingSilenceDurationAtEndpoint"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "doubleValue");
  v26 = v25;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CSEndpointMetrics:::requestId"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = -[CSEndpointerMetrics initWithTotalAudioRecorded:endpointBufferHostTime:featuresAtEndpoint:endpointerType:asrFeatureLatencyDistribution:additionalMetrics:trailingSilenceDurationAtEndpoint:requestId:](self, "initWithTotalAudioRecorded:endpointBufferHostTime:featuresAtEndpoint:endpointerType:asrFeatureLatencyDistribution:additionalMetrics:trailingSilenceDurationAtEndpoint:requestId:", v30, v11, v13, v18, v23, v27, v6, v26);
  return v28;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  double totalAudioRecorded;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  totalAudioRecorded = self->_totalAudioRecorded;
  v10 = a3;
  objc_msgSend(v4, "numberWithDouble:", totalAudioRecorded);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v6, CFSTR("CSEndpointMetrics:::totalAudioRecorded"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_endpointBufferHostTime);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v7, CFSTR("CSEndpointMetrics:::endpointBufferHostTime"));

  objc_msgSend(v10, "encodeObject:forKey:", self->_featuresAtEndpoint, CFSTR("CSEndpointMetrics:::featuresAtEndpoint"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_endpointerType);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v8, CFSTR("CSEndpointMetrics:::endpointerType"));

  objc_msgSend(v10, "encodeObject:forKey:", self->_asrFeatureLatencyDistribution, CFSTR("CSEndpointMetrics:::asrFeatureLatencyDistribution"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_additionalMetrics, CFSTR("CSEndpointMetrics:::additionalMetrics"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_trailingSilenceDurationAtEndpoint);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v9, CFSTR("CSEndpointMetrics:::trailingSilenceDurationAtEndpoint"));

  objc_msgSend(v10, "encodeObject:forKey:", self->_requestId, CFSTR("CSEndpointMetrics:::requestId"));
}

- (double)totalAudioRecorded
{
  return self->_totalAudioRecorded;
}

- (void)setTotalAudioRecorded:(double)a3
{
  self->_totalAudioRecorded = a3;
}

- (unint64_t)endpointBufferHostTime
{
  return self->_endpointBufferHostTime;
}

- (void)setEndpointBufferHostTime:(unint64_t)a3
{
  self->_endpointBufferHostTime = a3;
}

- (NSArray)featuresAtEndpoint
{
  return self->_featuresAtEndpoint;
}

- (void)setFeaturesAtEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_featuresAtEndpoint, a3);
}

- (int64_t)endpointerType
{
  return self->_endpointerType;
}

- (void)setEndpointerType:(int64_t)a3
{
  self->_endpointerType = a3;
}

- (NSDictionary)asrFeatureLatencyDistribution
{
  return self->_asrFeatureLatencyDistribution;
}

- (void)setAsrFeatureLatencyDistribution:(id)a3
{
  objc_storeStrong((id *)&self->_asrFeatureLatencyDistribution, a3);
}

- (NSDictionary)additionalMetrics
{
  return self->_additionalMetrics;
}

- (void)setAdditionalMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_additionalMetrics, a3);
}

- (double)trailingSilenceDurationAtEndpoint
{
  return self->_trailingSilenceDurationAtEndpoint;
}

- (void)setTrailingSilenceDurationAtEndpoint:(double)a3
{
  self->_trailingSilenceDurationAtEndpoint = a3;
}

- (NSString)requestId
{
  return self->_requestId;
}

- (void)setRequestId:(id)a3
{
  objc_storeStrong((id *)&self->_requestId, a3);
}

- (OSDFeatures)osdFeaturesAtEndpoint
{
  return self->_osdFeaturesAtEndpoint;
}

- (void)setOsdFeaturesAtEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_osdFeaturesAtEndpoint, a3);
}

- (CSASRFeatures)asrFeaturesAtEndpoint
{
  return self->_asrFeaturesAtEndpoint;
}

- (void)setAsrFeaturesAtEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_asrFeaturesAtEndpoint, a3);
}

- (BOOL)isRequestTimeOut
{
  return self->_isRequestTimeOut;
}

- (void)setIsRequestTimeOut:(BOOL)a3
{
  self->_isRequestTimeOut = a3;
}

- (BOOL)isAnchorTimeBuffered
{
  return self->_isAnchorTimeBuffered;
}

- (void)setIsAnchorTimeBuffered:(BOOL)a3
{
  self->_isAnchorTimeBuffered = a3;
}

- (NSString)assetConfigVersion
{
  return self->_assetConfigVersion;
}

- (void)setAssetConfigVersion:(id)a3
{
  objc_storeStrong((id *)&self->_assetConfigVersion, a3);
}

- (double)blkHepAudioOrigin
{
  return self->_blkHepAudioOrigin;
}

- (void)setBlkHepAudioOrigin:(double)a3
{
  self->_blkHepAudioOrigin = a3;
}

- (double)vtExtraAudioAtStartInMs
{
  return self->_vtExtraAudioAtStartInMs;
}

- (void)setVtExtraAudioAtStartInMs:(double)a3
{
  self->_vtExtraAudioAtStartInMs = a3;
}

- (unint64_t)firstAudioSampleSensorTimestamp
{
  return self->_firstAudioSampleSensorTimestamp;
}

- (void)setFirstAudioSampleSensorTimestamp:(unint64_t)a3
{
  self->_firstAudioSampleSensorTimestamp = a3;
}

- (unint64_t)endpointHostTime
{
  return self->_endpointHostTime;
}

- (void)setEndpointHostTime:(unint64_t)a3
{
  self->_endpointHostTime = a3;
}

- (unint64_t)audioDeliveryHostTimeDelta
{
  return self->_audioDeliveryHostTimeDelta;
}

- (void)setAudioDeliveryHostTimeDelta:(unint64_t)a3
{
  self->_audioDeliveryHostTimeDelta = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetConfigVersion, 0);
  objc_storeStrong((id *)&self->_asrFeaturesAtEndpoint, 0);
  objc_storeStrong((id *)&self->_osdFeaturesAtEndpoint, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_additionalMetrics, 0);
  objc_storeStrong((id *)&self->_asrFeatureLatencyDistribution, 0);
  objc_storeStrong((id *)&self->_featuresAtEndpoint, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
