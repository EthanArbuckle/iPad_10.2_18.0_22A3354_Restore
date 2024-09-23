@implementation HMICameraVideoFrameResult

- (HMICameraVideoFrameResult)initWithFrame:(id)a3 events:(int64_t)a4 annotationScores:(id)a5 detections:(id)a6 regionOfInterest:(CGRect)a7 faceClassifications:(id)a8
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v18;
  id v19;
  id v20;
  id v21;
  HMICameraVideoFrameResult *v22;
  HMICameraVideoFrameResult *v23;
  objc_super v25;

  height = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v18 = a3;
  v19 = a5;
  v20 = a6;
  v21 = a8;
  v25.receiver = self;
  v25.super_class = (Class)HMICameraVideoFrameResult;
  v22 = -[HMICameraVideoFrameResult init](&v25, sel_init);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_frame, a3);
    v23->_events = a4;
    objc_storeStrong((id *)&v23->_annotationScores, a5);
    objc_storeStrong((id *)&v23->_detections, a6);
    v23->_regionOfInterest.origin.x = x;
    v23->_regionOfInterest.origin.y = y;
    v23->_regionOfInterest.size.width = width;
    v23->_regionOfInterest.size.height = height;
    objc_storeStrong((id *)&v23->_faceClassifications, a8);
  }

  return v23;
}

- (HMICameraVideoFrameResult)initWithFrame:(id)a3 regionOfInterest:(CGRect)a4 analyzerEvents:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v12;
  id v13;
  HMICameraVideoFrameResult *v14;
  HMICameraVideoFrameResult *v15;
  uint64_t v16;
  NSDictionary *annotationScores;
  uint64_t v18;
  NSArray *detections;
  uint64_t v20;
  NSSet *faceClassifications;
  objc_super v23;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v12 = a3;
  v13 = a5;
  v23.receiver = self;
  v23.super_class = (Class)HMICameraVideoFrameResult;
  v14 = -[HMICameraVideoFrameResult init](&v23, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_frame, a3);
    v15->_regionOfInterest.origin.x = x;
    v15->_regionOfInterest.origin.y = y;
    v15->_regionOfInterest.size.width = width;
    v15->_regionOfInterest.size.height = height;
    objc_storeStrong((id *)&v15->_analyzerEvents, a5);
    v15->_events = objc_msgSend((id)objc_opt_class(), "_eventsFromAnalyzerEvents:", v13);
    objc_msgSend((id)objc_opt_class(), "_annotationScoresFromAnalyzerEvents:", v13);
    v16 = objc_claimAutoreleasedReturnValue();
    annotationScores = v15->_annotationScores;
    v15->_annotationScores = (NSDictionary *)v16;

    objc_msgSend((id)objc_opt_class(), "_detectionsFromAnalyzerEvents:", v13);
    v18 = objc_claimAutoreleasedReturnValue();
    detections = v15->_detections;
    v15->_detections = (NSArray *)v18;

    objc_msgSend((id)objc_opt_class(), "_faceClassificationsFromAnalyzerEvents:", v13);
    v20 = objc_claimAutoreleasedReturnValue();
    faceClassifications = v15->_faceClassifications;
    v15->_faceClassifications = (NSSet *)v20;

  }
  return v15;
}

+ (id)_faceClassificationsFromAnalyzerEvents:(id)a3
{
  id v3;
  void *v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__2;
  v11 = __Block_byref_object_dispose__2;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __68__HMICameraVideoFrameResult__faceClassificationsFromAnalyzerEvents___block_invoke;
  v6[3] = &unk_24DBEA4C8;
  v6[4] = &v7;
  objc_msgSend(v3, "na_each:", v6);
  v4 = (void *)objc_msgSend((id)v8[5], "copy");
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __68__HMICameraVideoFrameResult__faceClassificationsFromAnalyzerEvents___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v15;
  else
    v3 = 0;
  v4 = v3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "face");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      objc_msgSend(v5, "face");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "faceRecognition");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend(v5, "face");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "faceRecognition");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
        objc_msgSend(v11, "classifications");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "allObjects");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObjectsFromArray:", v14);

      }
    }
  }

}

+ (int64_t)_eventsFromAnalyzerEvents:(id)a3
{
  id v3;
  id v4;
  int64_t v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v3 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __55__HMICameraVideoFrameResult__eventsFromAnalyzerEvents___block_invoke;
  v7[3] = &unk_24DBEA838;
  v4 = v3;
  v8 = v4;
  v9 = &v10;
  objc_msgSend(v4, "na_each:", v7);
  v5 = v11[3];

  _Block_object_dispose(&v10, 8);
  return v5;
}

uint64_t __55__HMICameraVideoFrameResult__eventsFromAnalyzerEvents___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __55__HMICameraVideoFrameResult__eventsFromAnalyzerEvents___block_invoke_2;
  v3[3] = &unk_24DBEA4C8;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "na_each:", v3);
}

void __55__HMICameraVideoFrameResult__eventsFromAnalyzerEvents___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  v3 = objc_opt_class();
  if (v3 == objc_opt_class())
  {
    v8 = 2;
LABEL_8:
    v7 = v9;
    goto LABEL_9;
  }
  v4 = objc_opt_class();
  if (v4 == objc_opt_class())
  {
    v8 = 8;
    goto LABEL_8;
  }
  v5 = objc_opt_class();
  v6 = v5 == objc_opt_class();
  v7 = v9;
  if (!v6)
    goto LABEL_10;
  v8 = 4;
LABEL_9:
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) |= v8;
LABEL_10:

}

+ (id)_annotationScoresFromAnalyzerEvents:(id)a3
{
  id v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__2;
  v11 = __Block_byref_object_dispose__2;
  v12 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __65__HMICameraVideoFrameResult__annotationScoresFromAnalyzerEvents___block_invoke;
  v6[3] = &unk_24DBEA4C8;
  v6[4] = &v7;
  objc_msgSend(v3, "na_each:", v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __65__HMICameraVideoFrameResult__annotationScoresFromAnalyzerEvents___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  id v13;

  v3 = (void *)MEMORY[0x24BDD16E0];
  v4 = a2;
  objc_msgSend(v4, "confidence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "value");
  objc_msgSend(v3, "numberWithDouble:");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = objc_opt_class();

  objc_msgSend(v6, "numberWithInteger:", HMIEventClassToCameraVideoAnalyzerEventType(v7));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9 || (objc_msgSend(v13, "doubleValue"), v11 = v10, objc_msgSend(v9, "doubleValue"), v11 > v12))
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKey:", v13, v8);

}

+ (id)_detectionsFromAnalyzerEvents:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "na_map:", &__block_literal_global_8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

HMIObjectDetection *__59__HMICameraVideoFrameResult__detectionsFromAnalyzerEvents___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  HMIObjectDetection *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  HMIObjectDetection *v15;

  v2 = a2;
  v3 = objc_opt_class();
  if (v3 == objc_opt_class())
  {
    v6 = 1;
  }
  else
  {
    v4 = objc_opt_class();
    if (v4 == objc_opt_class())
    {
      v6 = 3;
    }
    else
    {
      v5 = objc_opt_class();
      if (v5 == objc_opt_class())
        v6 = 2;
      else
        v6 = 7;
    }
  }
  v7 = [HMIObjectDetection alloc];
  objc_msgSend(v2, "confidence");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "value");
  v10 = v9;
  objc_msgSend(v2, "boundingBox");
  v15 = -[HMIObjectDetection initWithLabelIndex:confidence:boundingBox:yaw:roll:](v7, "initWithLabelIndex:confidence:boundingBox:yaw:roll:", v6, 0, 0, v10, v11, v12, v13, v14);

  return v15;
}

- (id)maxConfidenceEventForEventClass:(Class)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__2;
  v15 = __Block_byref_object_dispose__2;
  v16 = 0;
  -[HMICameraVideoFrameResult analyzerEvents](self, "analyzerEvents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __61__HMICameraVideoFrameResult_maxConfidenceEventForEventClass___block_invoke;
  v10[3] = &__block_descriptor_40_e31_B16__0__HMIVideoAnalyzerEvent_8lu32l8;
  v10[4] = a3;
  objc_msgSend(v4, "na_filter:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __61__HMICameraVideoFrameResult_maxConfidenceEventForEventClass___block_invoke_2;
  v9[3] = &unk_24DBEA4C8;
  v9[4] = &v11;
  objc_msgSend(v6, "na_each:", v9);

  v7 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v7;
}

BOOL __61__HMICameraVideoFrameResult_maxConfidenceEventForEventClass___block_invoke(uint64_t a1)
{
  return objc_opt_class() == *(_QWORD *)(a1 + 32);
}

void __61__HMICameraVideoFrameResult_maxConfidenceEventForEventClass___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  id *v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  id v14;

  v4 = a2;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(_QWORD *)(v5 + 40);
  v6 = (id *)(v5 + 40);
  v14 = v4;
  if (!v7)
    goto LABEL_4;
  objc_msgSend(v4, "confidence");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "value");
  v10 = v9;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "confidence");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "value");
  v13 = v12;

  if (v10 > v13)
  {
    v6 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
LABEL_4:
    objc_storeStrong(v6, a2);
  }

}

- (HMICameraVideoFrame)frame
{
  return (HMICameraVideoFrame *)objc_getProperty(self, a2, 8, 1);
}

- (NSDictionary)annotationScores
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (int64_t)events
{
  return self->_events;
}

- (NSArray)detections
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
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

- (NSSet)faceClassifications
{
  return (NSSet *)objc_getProperty(self, a2, 40, 1);
}

- (NSSet)analyzerEvents
{
  return (NSSet *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyzerEvents, 0);
  objc_storeStrong((id *)&self->_faceClassifications, 0);
  objc_storeStrong((id *)&self->_detections, 0);
  objc_storeStrong((id *)&self->_annotationScores, 0);
  objc_storeStrong((id *)&self->_frame, 0);
}

- (HMICameraVideoFrameResult)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMICameraVideoFrameResult *v18;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMICVFR.f"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeRectForKey:", CFSTR("HMICVFR.roi"));
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = (void *)MEMORY[0x24BDBCF20];
  v20[0] = objc_opt_class();
  v20[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setWithArray:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("HMICVFR.ae"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = -[HMICameraVideoFrameResult initWithFrame:regionOfInterest:analyzerEvents:](self, "initWithFrame:regionOfInterest:analyzerEvents:", v5, v17, v7, v9, v11, v13);
  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HMICameraVideoFrameResult frame](self, "frame");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HMICVFR.f"));

  -[HMICameraVideoFrameResult regionOfInterest](self, "regionOfInterest");
  objc_msgSend(v4, "encodeRect:forKey:", CFSTR("HMICVFR.roi"));
  -[HMICameraVideoFrameResult analyzerEvents](self, "analyzerEvents");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HMICVFR.ae"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  HMICameraVideoFrameResult *v4;
  HMICameraVideoFrameResult *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;

  v4 = (HMICameraVideoFrameResult *)a3;
  if (v4 == self)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[HMICameraVideoFrameResult frame](self, "frame");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMICameraVideoFrameResult frame](v5, "frame");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqual:", v7);

      -[HMICameraVideoFrameResult analyzerEvents](self, "analyzerEvents");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMICameraVideoFrameResult analyzerEvents](v5, "analyzerEvents");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = v8 & objc_msgSend(v9, "isEqualToSet:", v10);
    }
    else
    {
      LOBYTE(v11) = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[HMICameraVideoFrameResult frame](self, "frame");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[HMICameraVideoFrameResult analyzerEvents](self, "analyzerEvents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

@end
