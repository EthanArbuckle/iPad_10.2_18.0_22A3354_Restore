@implementation ARWorldTrackingFeaturePointData

- (ARWorldTrackingFeaturePointData)initWithTimestamp:(double)a3
{
  ARWorldTrackingFeaturePointData *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ARWorldTrackingFeaturePointData;
  result = -[ARWorldTrackingFeaturePointData init](&v5, sel_init);
  if (result)
    result->_timestamp = a3;
  return result;
}

- (void)setVisionFeaturePoints:(id)a3
{
  id v5;
  void *v6;
  id v7;

  objc_storeStrong((id *)&self->_visionFeaturePoints, a3);
  v5 = a3;
  -[ARPointCloud pointCloudByApplyingTransform:](self->_visionFeaturePoints, "pointCloudByApplyingTransform:", ARVisionToRenderingCoordinateTransform());
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
    v6 = v7;
  else
    v6 = 0;
  objc_storeStrong((id *)&self->_featurePoints, v6);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ARWorldTrackingFeaturePointData)initWithCoder:(id)a3
{
  id v4;
  ARWorldTrackingFeaturePointData *v5;
  double v6;
  uint64_t v7;
  ARPointCloud *visionFeaturePoints;
  uint64_t v9;
  ARPointCloud *featurePoints;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ARWorldTrackingFeaturePointData;
  v5 = -[ARWorldTrackingFeaturePointData init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("timestamp"));
    v5->_timestamp = v6;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("visionFeaturePoints"));
    v7 = objc_claimAutoreleasedReturnValue();
    visionFeaturePoints = v5->_visionFeaturePoints;
    v5->_visionFeaturePoints = (ARPointCloud *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("featurePoints"));
    v9 = objc_claimAutoreleasedReturnValue();
    featurePoints = v5->_featurePoints;
    v5->_featurePoints = (ARPointCloud *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double timestamp;
  id v5;

  timestamp = self->_timestamp;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("timestamp"), timestamp);
  objc_msgSend(v5, "encodeObject:forKey:", self->_visionFeaturePoints, CFSTR("visionFeaturePoints"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_featurePoints, CFSTR("featurePoints"));

}

- (unint64_t)hash
{
  return (unint64_t)(self->_timestamp * 1000.0);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  ARPointCloud *visionFeaturePoints;
  ARPointCloud *featurePoints;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (vabdd_f64(self->_timestamp, *((double *)v5 + 1)) < 2.22044605e-16
      && ((visionFeaturePoints = self->_visionFeaturePoints, visionFeaturePoints == *((ARPointCloud **)v5 + 2))
       || -[ARPointCloud isEqual:](visionFeaturePoints, "isEqual:")))
    {
      featurePoints = self->_featurePoints;
      if (featurePoints == *((ARPointCloud **)v5 + 3))
        v8 = 1;
      else
        v8 = -[ARPointCloud isEqual:](featurePoints, "isEqual:");
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (ARPointCloud)visionFeaturePoints
{
  return self->_visionFeaturePoints;
}

- (ARPointCloud)featurePoints
{
  return self->_featurePoints;
}

- (void)setFeaturePoints:(id)a3
{
  objc_storeStrong((id *)&self->_featurePoints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featurePoints, 0);
  objc_storeStrong((id *)&self->_visionFeaturePoints, 0);
}

@end
