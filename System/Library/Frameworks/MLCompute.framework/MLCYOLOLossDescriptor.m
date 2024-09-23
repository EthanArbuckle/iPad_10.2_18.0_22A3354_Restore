@implementation MLCYOLOLossDescriptor

+ (MLCYOLOLossDescriptor)descriptorWithAnchorBoxes:(NSData *)anchorBoxes anchorBoxCount:(NSUInteger)anchorBoxCount
{
  NSData *v6;
  void *v7;

  v6 = anchorBoxes;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithLossDescriptorWithSpatialPositionLossType:spatialSizeLossType:confidenceLossType:classesLossType:reductionType:anchorBoxCount:anchorBoxes:", 1, 6, 3, 2, 1, anchorBoxCount, v6);

  return (MLCYOLOLossDescriptor *)v7;
}

- (MLCYOLOLossDescriptor)initWithLossDescriptorWithSpatialPositionLossType:(int)a3 spatialSizeLossType:(int)a4 confidenceLossType:(int)a5 classesLossType:(int)a6 reductionType:(int)a7 anchorBoxCount:(unint64_t)a8 anchorBoxes:(id)a9
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v17;
  MLCYOLOLossDescriptor *v18;
  MLCYOLOLossDescriptor *v19;
  uint64_t v20;
  MLCLossDescriptor *spatialPositionLossDescriptor;
  uint64_t v22;
  MLCLossDescriptor *spatialSizeLossDescriptor;
  uint64_t v24;
  MLCLossDescriptor *confidenceLossDescriptor;
  uint64_t v26;
  MLCLossDescriptor *classesLossDescriptor;
  MLCYOLOLossDescriptor *v28;
  NSObject *v29;
  objc_super v31;

  v10 = *(_QWORD *)&a7;
  v11 = *(_QWORD *)&a6;
  v12 = *(_QWORD *)&a5;
  v13 = *(_QWORD *)&a4;
  v14 = *(_QWORD *)&a3;
  v17 = a9;
  if (v10 >= 3)
  {
    +[MLCLog framework](MLCLog, "framework");
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      -[MLCYOLOLossDescriptor initWithLossDescriptorWithSpatialPositionLossType:spatialSizeLossType:confidenceLossType:classesLossType:reductionType:anchorBoxCount:anchorBoxes:].cold.1(a2, v10, v29);

    v28 = 0;
  }
  else
  {
    v31.receiver = self;
    v31.super_class = (Class)MLCYOLOLossDescriptor;
    v18 = -[MLCYOLOLossDescriptor init](&v31, sel_init);
    v19 = v18;
    if (v18)
    {
      v18->_anchorBoxCount = a8;
      objc_storeStrong((id *)&v18->_anchorBoxes, a9);
      *(_OWORD *)&v19->_scaleSpatialPositionLoss = xmmword_1D4AB8E10;
      *(_QWORD *)&v19->_scaleClassLoss = 0x3F33333340000000;
      v19->_shouldRescore = 1;
      v19->_maximumIOUForObjectAbsence = 0.3;
      v19->_reductionType = v10;
      +[MLCLossDescriptor descriptorWithType:reductionType:](MLCLossDescriptor, "descriptorWithType:reductionType:", v14, v10);
      v20 = objc_claimAutoreleasedReturnValue();
      spatialPositionLossDescriptor = v19->_spatialPositionLossDescriptor;
      v19->_spatialPositionLossDescriptor = (MLCLossDescriptor *)v20;

      +[MLCLossDescriptor descriptorWithType:reductionType:](MLCLossDescriptor, "descriptorWithType:reductionType:", v13, v10);
      v22 = objc_claimAutoreleasedReturnValue();
      spatialSizeLossDescriptor = v19->_spatialSizeLossDescriptor;
      v19->_spatialSizeLossDescriptor = (MLCLossDescriptor *)v22;

      +[MLCLossDescriptor descriptorWithType:reductionType:](MLCLossDescriptor, "descriptorWithType:reductionType:", v12, v10);
      v24 = objc_claimAutoreleasedReturnValue();
      confidenceLossDescriptor = v19->_confidenceLossDescriptor;
      v19->_confidenceLossDescriptor = (MLCLossDescriptor *)v24;

      +[MLCLossDescriptor descriptorWithType:reductionType:](MLCLossDescriptor, "descriptorWithType:reductionType:", v11, v10);
      v26 = objc_claimAutoreleasedReturnValue();
      classesLossDescriptor = v19->_classesLossDescriptor;
      v19->_classesLossDescriptor = (MLCLossDescriptor *)v26;

    }
    self = v19;
    v28 = self;
  }

  return v28;
}

- (id)description
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  float v8;
  double v9;
  float v10;
  double v11;
  float v12;
  double v13;
  float v14;
  double v15;
  float v16;
  double v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;
  void *v25;

  v25 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCYOLOLossDescriptor spatialPositionLossDescriptor](self, "spatialPositionLossDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v5, "lossType");
  -[MLCYOLOLossDescriptor spatialSizeLossDescriptor](self, "spatialSizeLossDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v6, "lossType");
  v7 = -[MLCYOLOLossDescriptor shouldRescore](self, "shouldRescore");
  -[MLCYOLOLossDescriptor scaleNoObjectConfidenceLoss](self, "scaleNoObjectConfidenceLoss");
  v9 = v8;
  -[MLCYOLOLossDescriptor scaleObjectConfidenceLoss](self, "scaleObjectConfidenceLoss");
  v11 = v10;
  -[MLCYOLOLossDescriptor scaleClassLoss](self, "scaleClassLoss");
  v13 = v12;
  -[MLCYOLOLossDescriptor minimumIOUForObjectPresence](self, "minimumIOUForObjectPresence");
  v15 = v14;
  -[MLCYOLOLossDescriptor maximumIOUForObjectAbsence](self, "maximumIOUForObjectAbsence");
  v17 = v16;
  -[MLCYOLOLossDescriptor confidenceLossDescriptor](self, "confidenceLossDescriptor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "lossType");
  -[MLCYOLOLossDescriptor classesLossDescriptor](self, "classesLossDescriptor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "stringWithFormat:", CFSTR("%@: { spatialPositionLossType=%d : spatialSizeLossType=%d : rescore=%d : scaleNoObjectConfidenceLoss=%f : scaleObjectConfidenceLoss=%f : scaleClassLoss=%f :minimumIOUForObjectPresence=%f : maximumIOUForObjectAbsence=%fconfidenceLossType=%d : classesLossType=%d : reductionType=%d: numberOfAnchorBoxes=%lu }"), v4, v24, v23, v7, *(_QWORD *)&v9, *(_QWORD *)&v11, *(_QWORD *)&v13, *(_QWORD *)&v15, *(_QWORD *)&v17, v19, objc_msgSend(v20, "lossType"), -[MLCYOLOLossDescriptor reductionType](self, "reductionType"), -[MLCYOLOLossDescriptor anchorBoxCount](self, "anchorBoxCount"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  BOOL v40;
  int v42;
  void *v43;
  void *v44;
  void *v45;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = objc_msgSend(v5, "anchorBoxCount");
    if (v6 == -[MLCYOLOLossDescriptor anchorBoxCount](self, "anchorBoxCount"))
    {
      objc_msgSend(v5, "anchorBoxes");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLCYOLOLossDescriptor anchorBoxes](self, "anchorBoxes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v7, "isEqualToData:", v8))
        goto LABEL_19;
      v9 = objc_msgSend(v5, "shouldRescore");
      if (v9 != -[MLCYOLOLossDescriptor shouldRescore](self, "shouldRescore"))
        goto LABEL_19;
      objc_msgSend(v5, "scaleSpatialPositionLoss");
      v11 = v10;
      -[MLCYOLOLossDescriptor scaleSpatialPositionLoss](self, "scaleSpatialPositionLoss");
      if (v11 != v12)
        goto LABEL_19;
      objc_msgSend(v5, "scaleSpatialSizeLoss");
      v14 = v13;
      -[MLCYOLOLossDescriptor scaleSpatialSizeLoss](self, "scaleSpatialSizeLoss");
      if (v14 != v15)
        goto LABEL_19;
      objc_msgSend(v5, "scaleNoObjectConfidenceLoss");
      v17 = v16;
      -[MLCYOLOLossDescriptor scaleNoObjectConfidenceLoss](self, "scaleNoObjectConfidenceLoss");
      if (v17 != v18)
        goto LABEL_19;
      objc_msgSend(v5, "scaleObjectConfidenceLoss");
      v20 = v19;
      -[MLCYOLOLossDescriptor scaleObjectConfidenceLoss](self, "scaleObjectConfidenceLoss");
      if (v20 != v21)
        goto LABEL_19;
      objc_msgSend(v5, "scaleClassLoss");
      v23 = v22;
      -[MLCYOLOLossDescriptor scaleClassLoss](self, "scaleClassLoss");
      if (v23 != v24)
        goto LABEL_19;
      objc_msgSend(v5, "minimumIOUForObjectPresence");
      v26 = v25;
      -[MLCYOLOLossDescriptor minimumIOUForObjectPresence](self, "minimumIOUForObjectPresence");
      if (v26 == v27
        && (objc_msgSend(v5, "maximumIOUForObjectAbsence"),
            v29 = v28,
            -[MLCYOLOLossDescriptor maximumIOUForObjectAbsence](self, "maximumIOUForObjectAbsence"),
            v29 == v30))
      {
        objc_msgSend(v5, "spatialPositionLossDescriptor");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLCYOLOLossDescriptor spatialPositionLossDescriptor](self, "spatialPositionLossDescriptor");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v31, "isEqual:", v32))
        {
          objc_msgSend(v5, "spatialSizeLossDescriptor");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[MLCYOLOLossDescriptor spatialSizeLossDescriptor](self, "spatialSizeLossDescriptor");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v33, "isEqual:", v34))
          {
            objc_msgSend(v5, "confidenceLossDescriptor");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            -[MLCYOLOLossDescriptor confidenceLossDescriptor](self, "confidenceLossDescriptor");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = v35;
            if (objc_msgSend(v35, "isEqual:", v44))
            {
              objc_msgSend(v5, "classesLossDescriptor");
              v36 = objc_claimAutoreleasedReturnValue();
              -[MLCYOLOLossDescriptor classesLossDescriptor](self, "classesLossDescriptor");
              v37 = objc_claimAutoreleasedReturnValue();
              v43 = (void *)v36;
              v38 = (void *)v36;
              v39 = (void *)v37;
              if (objc_msgSend(v38, "isEqual:", v37))
              {
                v42 = objc_msgSend(v5, "reductionType");
                v40 = v42 == -[MLCYOLOLossDescriptor reductionType](self, "reductionType");
              }
              else
              {
                v40 = 0;
              }

            }
            else
            {
              v40 = 0;
            }

          }
          else
          {
            v40 = 0;
          }

        }
        else
        {
          v40 = 0;
        }

      }
      else
      {
LABEL_19:
        v40 = 0;
      }

    }
    else
    {
      v40 = 0;
    }

  }
  else
  {
    v40 = 0;
  }

  return v40;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  unint64_t v31;

  v31 = 0;
  v28 = -[MLCYOLOLossDescriptor anchorBoxCount](self, "anchorBoxCount");
  -[MLCYOLOLossDescriptor anchorBoxes](self, "anchorBoxes");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "hash");
  -[MLCYOLOLossDescriptor shouldRescore](self, "shouldRescore");
  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[MLCYOLOLossDescriptor scaleSpatialPositionLoss](self, "scaleSpatialPositionLoss");
  objc_msgSend(v3, "numberWithFloat:");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "hash");
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[MLCYOLOLossDescriptor scaleSpatialSizeLoss](self, "scaleSpatialSizeLoss");
  objc_msgSend(v4, "numberWithFloat:");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "hash");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[MLCYOLOLossDescriptor scaleNoObjectConfidenceLoss](self, "scaleNoObjectConfidenceLoss");
  objc_msgSend(v5, "numberWithFloat:");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "hash");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[MLCYOLOLossDescriptor scaleObjectConfidenceLoss](self, "scaleObjectConfidenceLoss");
  objc_msgSend(v6, "numberWithFloat:");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "hash");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[MLCYOLOLossDescriptor scaleClassLoss](self, "scaleClassLoss");
  objc_msgSend(v7, "numberWithFloat:");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "hash");
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[MLCYOLOLossDescriptor minimumIOUForObjectPresence](self, "minimumIOUForObjectPresence");
  objc_msgSend(v8, "numberWithFloat:");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "hash");
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[MLCYOLOLossDescriptor maximumIOUForObjectAbsence](self, "maximumIOUForObjectAbsence");
  objc_msgSend(v9, "numberWithFloat:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hash");
  -[MLCYOLOLossDescriptor spatialPositionLossDescriptor](self, "spatialPositionLossDescriptor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hash");
  -[MLCYOLOLossDescriptor spatialSizeLossDescriptor](self, "spatialSizeLossDescriptor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "hash");
  -[MLCYOLOLossDescriptor confidenceLossDescriptor](self, "confidenceLossDescriptor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "hash");
  -[MLCYOLOLossDescriptor classesLossDescriptor](self, "classesLossDescriptor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "hash");
  -[MLCYOLOLossDescriptor reductionType](self, "reductionType");
  hashCombine_5(&v31, v15, v16, v17, v18, v19, v20, v21, v28);

  return v31;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  NSUInteger v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5 = -[MLCYOLOLossDescriptor anchorBoxCount](self, "anchorBoxCount");
  -[MLCYOLOLossDescriptor anchorBoxes](self, "anchorBoxes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithLossDescriptorWithSpatialPositionLossType:spatialSizeLossType:confidenceLossType:classesLossType:reductionType:anchorBoxCount:anchorBoxes:", 1, 6, 3, 2, 1, v5, v6);

  return v7;
}

- (NSUInteger)anchorBoxCount
{
  return self->_anchorBoxCount;
}

- (NSData)anchorBoxes
{
  return self->_anchorBoxes;
}

- (BOOL)shouldRescore
{
  return self->_shouldRescore;
}

- (void)setShouldRescore:(BOOL)shouldRescore
{
  self->_shouldRescore = shouldRescore;
}

- (float)scaleSpatialPositionLoss
{
  return self->_scaleSpatialPositionLoss;
}

- (void)setScaleSpatialPositionLoss:(float)scaleSpatialPositionLoss
{
  self->_scaleSpatialPositionLoss = scaleSpatialPositionLoss;
}

- (float)scaleSpatialSizeLoss
{
  return self->_scaleSpatialSizeLoss;
}

- (void)setScaleSpatialSizeLoss:(float)scaleSpatialSizeLoss
{
  self->_scaleSpatialSizeLoss = scaleSpatialSizeLoss;
}

- (float)scaleNoObjectConfidenceLoss
{
  return self->_scaleNoObjectConfidenceLoss;
}

- (void)setScaleNoObjectConfidenceLoss:(float)scaleNoObjectConfidenceLoss
{
  self->_scaleNoObjectConfidenceLoss = scaleNoObjectConfidenceLoss;
}

- (float)scaleObjectConfidenceLoss
{
  return self->_scaleObjectConfidenceLoss;
}

- (void)setScaleObjectConfidenceLoss:(float)scaleObjectConfidenceLoss
{
  self->_scaleObjectConfidenceLoss = scaleObjectConfidenceLoss;
}

- (float)scaleClassLoss
{
  return self->_scaleClassLoss;
}

- (void)setScaleClassLoss:(float)scaleClassLoss
{
  self->_scaleClassLoss = scaleClassLoss;
}

- (float)minimumIOUForObjectPresence
{
  return self->_minimumIOUForObjectPresence;
}

- (void)setMinimumIOUForObjectPresence:(float)minimumIOUForObjectPresence
{
  self->_minimumIOUForObjectPresence = minimumIOUForObjectPresence;
}

- (float)maximumIOUForObjectAbsence
{
  return self->_maximumIOUForObjectAbsence;
}

- (void)setMaximumIOUForObjectAbsence:(float)maximumIOUForObjectAbsence
{
  self->_maximumIOUForObjectAbsence = maximumIOUForObjectAbsence;
}

- (MLCLossDescriptor)spatialPositionLossDescriptor
{
  return (MLCLossDescriptor *)objc_getProperty(self, a2, 64, 1);
}

- (MLCLossDescriptor)spatialSizeLossDescriptor
{
  return (MLCLossDescriptor *)objc_getProperty(self, a2, 72, 1);
}

- (MLCLossDescriptor)confidenceLossDescriptor
{
  return (MLCLossDescriptor *)objc_getProperty(self, a2, 80, 1);
}

- (MLCLossDescriptor)classesLossDescriptor
{
  return (MLCLossDescriptor *)objc_getProperty(self, a2, 88, 1);
}

- (int)reductionType
{
  return self->_reductionType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classesLossDescriptor, 0);
  objc_storeStrong((id *)&self->_confidenceLossDescriptor, 0);
  objc_storeStrong((id *)&self->_spatialSizeLossDescriptor, 0);
  objc_storeStrong((id *)&self->_spatialPositionLossDescriptor, 0);
  objc_storeStrong((id *)&self->_anchorBoxes, 0);
}

- (void)initWithLossDescriptorWithSpatialPositionLossType:(NSObject *)a3 spatialSizeLossType:confidenceLossType:classesLossType:reductionType:anchorBoxCount:anchorBoxes:.cold.1(const char *a1, int a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 1024;
  v9 = a2;
  _os_log_error_impl(&dword_1D4999000, a3, OS_LOG_TYPE_ERROR, "%@: failure to create yolo loss descriptor with reduceType = %d", (uint8_t *)&v6, 0x12u);

}

@end
