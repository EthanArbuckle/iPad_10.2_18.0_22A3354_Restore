@implementation VNTrajectoryObservation

- (VNTrajectoryObservation)initWithCoder:(id)a3
{
  id v4;
  VNTrajectoryObservation *v5;
  uint64_t v6;
  uint64_t v7;
  NSUUID *requestUUID;
  __int128 v9;
  uint64_t v10;
  NSArray *detectedPoints;
  uint64_t v12;
  NSArray *projectedPoints;
  double v14;
  VNTrajectoryObservation *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)VNTrajectoryObservation;
  v5 = -[VNObservation initWithCoder:](&v17, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestUuid"));
    v7 = objc_claimAutoreleasedReturnValue();
    requestUUID = v5->_requestUUID;
    v5->_requestUUID = (NSUUID *)v7;

    objc_msgSend(v4, "vn_decodeSimdFloat3ForKey:", CFSTR("eqCoeffs"));
    *(_OWORD *)v5->_equationCoefficients = v9;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("detPts"));
    v10 = objc_claimAutoreleasedReturnValue();
    detectedPoints = v5->_detectedPoints;
    v5->_detectedPoints = (NSArray *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("projPts"));
    v12 = objc_claimAutoreleasedReturnValue();
    projectedPoints = v5->_projectedPoints;
    v5->_projectedPoints = (NSArray *)v12;

    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("mvAvgRad")))
    {
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("mvAvgRad"));
      v5->_movingAverageRadius = v14;
    }
    v15 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VNTrajectoryObservation;
  -[VNObservation encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_requestUUID, CFSTR("requestUuid"));
  objc_msgSend(v4, "vn_encodeSimdFloat3:forKey:", CFSTR("eqCoeffs"), *(double *)self->_equationCoefficients);
  objc_msgSend(v4, "encodeObject:forKey:", self->_detectedPoints, CFSTR("detPts"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_projectedPoints, CFSTR("projPts"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("mvAvgRad"), self->_movingAverageRadius);

}

- (id)vn_cloneObject
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)VNTrajectoryObservation;
  -[VNObservation vn_cloneObject](&v11, sel_vn_cloneObject);
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = -[NSUUID copy](self->_requestUUID, "copy");
    v5 = *(void **)(v3 + 120);
    *(_QWORD *)(v3 + 120) = v4;

    *(_OWORD *)(v3 + 128) = *(_OWORD *)self->_equationCoefficients;
    v6 = -[NSArray copy](self->_detectedPoints, "copy");
    v7 = *(void **)(v3 + 96);
    *(_QWORD *)(v3 + 96) = v6;

    v8 = -[NSArray copy](self->_projectedPoints, "copy");
    v9 = *(void **)(v3 + 104);
    *(_QWORD *)(v3 + 104) = v8;

    *(double *)(v3 + 112) = self->_movingAverageRadius;
  }
  return (id)v3;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  float v5;
  float v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  float v11;
  uint64_t v12;
  uint64_t v13;
  double movingAverageRadius;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)VNTrajectoryObservation;
  v3 = -[NSArray hash](self->_detectedPoints, "hash") ^ __ROR8__(-[NSUUID hash](self->_requestUUID, "hash") ^ __ROR8__(-[VNObservation hash](&v16, sel_hash), 51), 51);
  v4 = -[NSArray hash](self->_projectedPoints, "hash");
  v5 = *(float *)self->_equationCoefficients;
  v6 = *(float *)&self->_equationCoefficients[4];
  v7 = v5;
  v8 = v4 ^ __ROR8__(v3, 51);
  if (v5 == 0.0)
    v7 = 0.0;
  v9 = LODWORD(v6);
  if (v6 == 0.0)
    v9 = 0;
  v10 = v9 ^ __ROR8__(*(_QWORD *)&v7, 51);
  v11 = *(float *)&self->_equationCoefficients[8];
  v12 = LODWORD(v11);
  if (v11 == 0.0)
    v12 = 0;
  v13 = v12 ^ __ROR8__(v10, 51) ^ __ROR8__(v8, 51);
  movingAverageRadius = self->_movingAverageRadius;
  if (movingAverageRadius == 0.0)
    movingAverageRadius = 0.0;
  return *(_QWORD *)&movingAverageRadius ^ __ROR8__(v13, 51);
}

- (BOOL)isEqual:(id)a3
{
  VNTrajectoryObservation *v4;
  VNTrajectoryObservation *v5;
  NSUUID *requestUUID;
  float32x4_t v7;
  uint32x4_t v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  double movingAverageRadius;
  double v14;
  BOOL v15;
  objc_super v17;

  v4 = (VNTrajectoryObservation *)a3;
  if (self == v4)
  {
    v15 = 1;
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)VNTrajectoryObservation;
    if (-[VNObservation isEqual:](&v17, sel_isEqual_, v4) && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      if (v5)
        requestUUID = v5->_requestUUID;
      else
        requestUUID = 0;
      if ((-[NSUUID isEqual:](self->_requestUUID, "isEqual:", requestUUID) & 1) == 0)
        goto LABEL_13;
      -[VNTrajectoryObservation equationCoefficients](v5, "equationCoefficients");
      v8 = (uint32x4_t)vceqq_f32(v7, *(float32x4_t *)self->_equationCoefficients);
      v8.i32[3] = v8.i32[2];
      if ((vminvq_u32(v8) & 0x80000000) == 0)
        goto LABEL_13;
      -[VNTrajectoryObservation detectedPoints](v5, "detectedPoints");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = VisionCoreEqualOrNilObjects();

      if (!v10)
        goto LABEL_13;
      -[VNTrajectoryObservation projectedPoints](v5, "projectedPoints");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = VisionCoreEqualOrNilObjects();

      if (v12)
      {
        movingAverageRadius = self->_movingAverageRadius;
        -[VNTrajectoryObservation movingAverageRadius](v5, "movingAverageRadius");
        v15 = movingAverageRadius == v14;
      }
      else
      {
LABEL_13:
        v15 = 0;
      }

    }
    else
    {
      v15 = 0;
    }
  }

  return v15;
}

- (NSArray)detectedPoints
{
  return self->_detectedPoints;
}

- (NSArray)projectedPoints
{
  return self->_projectedPoints;
}

- (simd_float3)equationCoefficients
{
  return *(simd_float3 *)self->_equationCoefficients;
}

- (CGFloat)movingAverageRadius
{
  return self->_movingAverageRadius;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestUUID, 0);
  objc_storeStrong((id *)&self->_projectedPoints, 0);
  objc_storeStrong((id *)&self->_detectedPoints, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)initWithOriginatingRequestSpecifier:(void *)a3 requestUUID:(void *)a4 trajectoryUUID:(void *)a5 detectedPoints:(void *)a6 projectedPoints:(double)a7 movingAverageRadius:(__n128)a8 equationCoefficients:(float)a9 confidence:
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  double v22;
  objc_super v25;

  v16 = a2;
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  if (a1)
  {
    v25.receiver = a1;
    v25.super_class = (Class)VNTrajectoryObservation;
    v21 = objc_msgSendSuper2(&v25, sel_initWithOriginatingRequestSpecifier_, v16);
    a1 = v21;
    if (v21)
    {
      objc_msgSend(v21, "setUUID:", v18);
      *(float *)&v22 = a9;
      objc_msgSend(a1, "setConfidence:", v22);
      objc_storeStrong((id *)a1 + 15, a3);
      objc_storeStrong((id *)a1 + 12, a5);
      objc_storeStrong((id *)a1 + 13, a6);
      *((double *)a1 + 14) = a7;
      *((__n128 *)a1 + 8) = a8;
    }
  }

  return a1;
}

- (id)detectedPointsInTopLeftOrigin:(BOOL)a3 orientation:(unsigned int)a4
{
  void *v5;
  void *v6;
  _OWORD v8[3];
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v10 = 0u;
  v11 = 0u;
  v9 = 0u;
  -[VNTrajectoryObservation detectedPoints](self, "detectedPoints", VNAffineTransformForVisionToTopLeftOriginOrientation(a3, a4, (uint64_t)&v9));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v9;
  v8[1] = v10;
  v8[2] = v11;
  -[VNTrajectoryObservation _points:transformedWith:](self, v5, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)projectedPointsInTopLeftOrigin:(BOOL)a3 orientation:(unsigned int)a4
{
  void *v5;
  void *v6;
  _OWORD v8[3];
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v10 = 0u;
  v11 = 0u;
  v9 = 0u;
  -[VNTrajectoryObservation projectedPoints](self, "projectedPoints", VNAffineTransformForVisionToTopLeftOriginOrientation(a3, a4, (uint64_t)&v9));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v9;
  v8[1] = v10;
  v8[2] = v11;
  -[VNTrajectoryObservation _points:transformedWith:](self, v5, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_points:(_OWORD *)a3 transformedWith:
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  void *v14;
  _OWORD v16[3];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (a1)
  {
    v7 = objc_msgSend(v5, "count");
    if (v7)
    {
      a1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v7);
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v8 = v6;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v9)
      {
        v10 = *(_QWORD *)v18;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v18 != v10)
              objc_enumerationMutation(v8);
            v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v11);
            v13 = a3[1];
            v16[0] = *a3;
            v16[1] = v13;
            v16[2] = a3[2];
            objc_msgSend(v12, "transformedWith:", v16);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1, "addObject:", v14);

            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v9);
      }

    }
    else
    {
      a1 = (void *)MEMORY[0x1E0C9AA60];
    }
  }

  return a1;
}

@end
