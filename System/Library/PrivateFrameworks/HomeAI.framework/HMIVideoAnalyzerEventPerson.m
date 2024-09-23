@implementation HMIVideoAnalyzerEventPerson

- (HMIVideoAnalyzerEventPerson)initWithConfidence:(id)a3 boundingBox:(CGRect)a4
{
  HMIVideoAnalyzerEventPerson *v4;
  HMIVideoAnalyzerEventPerson *v5;
  HMIVideoAnalyzerEventFace *face;
  HMIVideoAnalyzerEventTorso *torso;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HMIVideoAnalyzerEventPerson;
  v4 = -[HMIVideoAnalyzerEvent initWithConfidence:boundingBox:](&v9, sel_initWithConfidence_boundingBox_, a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  v5 = v4;
  if (v4)
  {
    face = v4->_face;
    v4->_face = 0;

    torso = v5->_torso;
    v5->_torso = 0;

    v5->_isBoundingBoxEstimated = 0;
  }
  return v5;
}

- (HMIVideoAnalyzerEventPerson)initWithConfidence:(id)a3 boundingBox:(CGRect)a4 face:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v12;
  HMIVideoAnalyzerEventPerson *v13;
  HMIVideoAnalyzerEventPerson *v14;
  HMIVideoAnalyzerEventTorso *torso;
  objc_super v17;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v12 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HMIVideoAnalyzerEventPerson;
  v13 = -[HMIVideoAnalyzerEvent initWithConfidence:boundingBox:](&v17, sel_initWithConfidence_boundingBox_, a3, x, y, width, height);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_face, a5);
    torso = v14->_torso;
    v14->_torso = 0;

    v14->_isBoundingBoxEstimated = 0;
  }

  return v14;
}

- (HMIVideoAnalyzerEventPerson)initWithConfidence:(id)a3 boundingBox:(CGRect)a4 face:(id)a5 torso:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v14;
  id v15;
  HMIVideoAnalyzerEventPerson *v16;
  HMIVideoAnalyzerEventPerson *v17;
  objc_super v19;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v14 = a5;
  v15 = a6;
  v19.receiver = self;
  v19.super_class = (Class)HMIVideoAnalyzerEventPerson;
  v16 = -[HMIVideoAnalyzerEvent initWithConfidence:boundingBox:userInfo:](&v19, sel_initWithConfidence_boundingBox_userInfo_, a3, 0, x, y, width, height);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_face, a5);
    objc_storeStrong((id *)&v17->_torso, a6);
    v17->_isBoundingBoxEstimated = 0;
  }

  return v17;
}

- (HMIVideoAnalyzerEventPerson)initWithFaceEvent:(id)a3
{
  id v5;
  HMIConfidence *v6;
  HMIVideoAnalyzerEventPerson *v7;
  HMIVideoAnalyzerEventPerson *v8;
  HMIVideoAnalyzerEventTorso *torso;
  objc_super v11;

  v5 = a3;
  v6 = -[HMIConfidence initWithValue:levelThresholds:]([HMIConfidence alloc], "initWithValue:levelThresholds:", &unk_24DC15248, 0.0);
  v11.receiver = self;
  v11.super_class = (Class)HMIVideoAnalyzerEventPerson;
  v7 = -[HMIVideoAnalyzerEvent initWithConfidence:boundingBox:](&v11, sel_initWithConfidence_boundingBox_, v6, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_face, a3);
    torso = v8->_torso;
    v8->_torso = 0;

    v8->_isBoundingBoxEstimated = 1;
  }

  return v8;
}

- (HMIVideoAnalyzerEventPerson)initWithTorsoEvent:(id)a3
{
  id v5;
  HMIConfidence *v6;
  HMIVideoAnalyzerEventPerson *v7;
  HMIVideoAnalyzerEventPerson *v8;
  HMIVideoAnalyzerEventFace *face;
  objc_super v11;

  v5 = a3;
  v6 = -[HMIConfidence initWithValue:levelThresholds:]([HMIConfidence alloc], "initWithValue:levelThresholds:", &unk_24DC15260, 0.0);
  v11.receiver = self;
  v11.super_class = (Class)HMIVideoAnalyzerEventPerson;
  v7 = -[HMIVideoAnalyzerEvent initWithConfidence:boundingBox:](&v11, sel_initWithConfidence_boundingBox_, v6, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v8 = v7;
  if (v7)
  {
    face = v7->_face;
    v7->_face = 0;

    objc_storeStrong((id *)&v8->_torso, a3);
    v8->_isBoundingBoxEstimated = 1;
  }

  return v8;
}

- (HMIVideoAnalyzerEventPerson)initWithFaceEvent:(id)a3 torso:(id)a4
{
  id v7;
  id v8;
  HMIConfidence *v9;
  HMIVideoAnalyzerEventPerson *v10;
  HMIVideoAnalyzerEventPerson *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v9 = -[HMIConfidence initWithValue:levelThresholds:]([HMIConfidence alloc], "initWithValue:levelThresholds:", &unk_24DC15278, 0.0);
  v13.receiver = self;
  v13.super_class = (Class)HMIVideoAnalyzerEventPerson;
  v10 = -[HMIVideoAnalyzerEvent initWithConfidence:boundingBox:](&v13, sel_initWithConfidence_boundingBox_, v9, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_face, a3);
    objc_storeStrong((id *)&v11->_torso, a4);
    v11->_isBoundingBoxEstimated = 1;
  }

  return v11;
}

- (id)copyWithFaceEvent:(id)a3 torso:(id)a4
{
  id v6;
  id v7;
  HMIVideoAnalyzerEventPerson *v8;
  HMIVideoAnalyzerEventPerson *v9;
  void *v10;
  HMIVideoAnalyzerEventPerson *v11;
  HMIVideoAnalyzerEventPerson *v12;
  HMIVideoAnalyzerEventPerson *v13;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;

  v6 = a3;
  v7 = a4;
  if (-[HMIVideoAnalyzerEventPerson hasEstimatedBoundingBox](self, "hasEstimatedBoundingBox"))
  {
    if (v6 && v7)
    {
      v8 = -[HMIVideoAnalyzerEventPerson initWithFaceEvent:torso:]([HMIVideoAnalyzerEventPerson alloc], "initWithFaceEvent:torso:", v6, v7);
LABEL_13:
      v11 = v8;
      goto LABEL_14;
    }
    if (v6 && !v7)
    {
      v8 = -[HMIVideoAnalyzerEventPerson initWithFaceEvent:]([HMIVideoAnalyzerEventPerson alloc], "initWithFaceEvent:", v6);
      goto LABEL_13;
    }
    v12 = [HMIVideoAnalyzerEventPerson alloc];
    v13 = v12;
    if (!v6 && v7)
    {
      v8 = -[HMIVideoAnalyzerEventPerson initWithTorsoEvent:](v12, "initWithTorsoEvent:", v7);
      goto LABEL_13;
    }
    -[HMIVideoAnalyzerEventPerson confidence](self, "confidence");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMIVideoAnalyzerEventPerson boundingBox](self, "boundingBox");
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    -[HMIVideoAnalyzerEventPerson face](self, "face");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMIVideoAnalyzerEventPerson torso](self, "torso");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[HMIVideoAnalyzerEventPerson initWithConfidence:boundingBox:face:torso:](v13, "initWithConfidence:boundingBox:face:torso:", v10, v23, v24, v16, v18, v20, v22);

  }
  else
  {
    v9 = [HMIVideoAnalyzerEventPerson alloc];
    -[HMIVideoAnalyzerEventPerson confidence](self, "confidence");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMIVideoAnalyzerEventPerson boundingBox](self, "boundingBox");
    v11 = -[HMIVideoAnalyzerEventPerson initWithConfidence:boundingBox:face:torso:](v9, "initWithConfidence:boundingBox:face:torso:", v10, v6, v7);
  }

LABEL_14:
  return v11;
}

- (id)allEvents
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIVideoAnalyzerEventPerson face](self, "face");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HMIVideoAnalyzerEventPerson face](self, "face");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  -[HMIVideoAnalyzerEventPerson torso](self, "torso");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HMIVideoAnalyzerEventPerson torso](self, "torso");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
  v8 = (void *)objc_msgSend(v3, "copy");

  return v8;
}

- (CGRect)boundingBox
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  objc_super v23;
  CGRect result;

  if (-[HMIVideoAnalyzerEventPerson hasEstimatedBoundingBox](self, "hasEstimatedBoundingBox")
    && (-[HMIVideoAnalyzerEventPerson torso](self, "torso"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    -[HMIVideoAnalyzerEventPerson torso](self, "torso");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!-[HMIVideoAnalyzerEventPerson hasEstimatedBoundingBox](self, "hasEstimatedBoundingBox")
      || (-[HMIVideoAnalyzerEventPerson face](self, "face"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v5,
          !v5))
    {
      v23.receiver = self;
      v23.super_class = (Class)HMIVideoAnalyzerEventPerson;
      -[HMIVideoAnalyzerEvent boundingBox](&v23, sel_boundingBox);
      v8 = v15;
      v10 = v16;
      v12 = v17;
      v14 = v18;
      goto LABEL_9;
    }
    -[HMIVideoAnalyzerEventPerson face](self, "face");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v4;
  objc_msgSend(v4, "boundingBox");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

LABEL_9:
  v19 = v8;
  v20 = v10;
  v21 = v12;
  v22 = v14;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (CGRect)boundingBoxForTracker
{
  void *v3;
  void *v4;
  double v5;
  CGFloat x;
  double v7;
  CGFloat y;
  double v9;
  CGFloat width;
  double v11;
  CGFloat height;
  void *v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  void *v23;
  CGFloat v24;
  void *v25;
  CGFloat v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  objc_super v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect result;

  if (-[HMIVideoAnalyzerEventPerson hasEstimatedBoundingBox](self, "hasEstimatedBoundingBox")
    && (-[HMIVideoAnalyzerEventPerson torso](self, "torso"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    -[HMIVideoAnalyzerEventPerson torso](self, "torso");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "boundingBox");
    x = v5;
    y = v7;
    width = v9;
    height = v11;

  }
  else if (-[HMIVideoAnalyzerEventPerson hasEstimatedBoundingBox](self, "hasEstimatedBoundingBox")
         && (-[HMIVideoAnalyzerEventPerson face](self, "face"),
             v13 = (void *)objc_claimAutoreleasedReturnValue(),
             v13,
             v13))
  {
    -[HMIVideoAnalyzerEventPerson face](self, "face");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "boundingBox");
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    -[HMIVideoAnalyzerEventPerson face](self, "face");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "boundingBox");
    v24 = CGRectGetWidth(v36) * -0.5;
    -[HMIVideoAnalyzerEventPerson face](self, "face");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "boundingBox");
    v26 = CGRectGetHeight(v37) * -0.5;
    v38.origin.x = v16;
    v38.origin.y = v18;
    v38.size.width = v20;
    v38.size.height = v22;
    v39 = CGRectInset(v38, v24, v26);
    x = v39.origin.x;
    y = v39.origin.y;
    width = v39.size.width;
    height = v39.size.height;

  }
  else
  {
    v35.receiver = self;
    v35.super_class = (Class)HMIVideoAnalyzerEventPerson;
    -[HMIVideoAnalyzerEvent boundingBox](&v35, sel_boundingBox);
    x = v27;
    y = v28;
    width = v29;
    height = v30;
  }
  v31 = x;
  v32 = y;
  v33 = width;
  v34 = height;
  result.size.height = v34;
  result.size.width = v33;
  result.origin.y = v32;
  result.origin.x = v31;
  return result;
}

- (id)confidence
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  if (-[HMIVideoAnalyzerEventPerson hasEstimatedBoundingBox](self, "hasEstimatedBoundingBox"))
  {
    -[HMIVideoAnalyzerEventPerson torso](self, "torso");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[HMIVideoAnalyzerEventPerson torso](self, "torso");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
      v6 = v4;
      objc_msgSend(v4, "confidence");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      return v7;
    }
  }
  if (-[HMIVideoAnalyzerEventPerson hasEstimatedBoundingBox](self, "hasEstimatedBoundingBox"))
  {
    -[HMIVideoAnalyzerEventPerson face](self, "face");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[HMIVideoAnalyzerEventPerson face](self, "face");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)HMIVideoAnalyzerEventPerson;
  -[HMIVideoAnalyzerEvent confidence](&v9, sel_confidence);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSUUID)sessionEntityUUID
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[HMIVideoAnalyzerEventPerson face](self, "face");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3
    || (v4 = (void *)v3,
        -[HMIVideoAnalyzerEventPerson face](self, "face"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "sessionEntityUUID"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        !v6))
  {
    -[HMIVideoAnalyzerEventPerson torso](self, "torso");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[HMIVideoAnalyzerEventPerson torso](self, "torso");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "sessionEntityUUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v6 = 0;
    }

  }
  return (NSUUID *)v6;
}

- (id)attributeDescriptions
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;
  _QWORD v17[4];

  v17[3] = *MEMORY[0x24BDAC8D0];
  v16.receiver = self;
  v16.super_class = (Class)HMIVideoAnalyzerEventPerson;
  -[HMIVideoAnalyzerEvent attributeDescriptions](&v16, sel_attributeDescriptions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BE3F140]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMIVideoAnalyzerEventPerson hasEstimatedBoundingBox](self, "hasEstimatedBoundingBox"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("Is Bounding Box & Confidence Estimated"), v5);
  v17[0] = v6;
  v7 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMIVideoAnalyzerEventPerson face](self, "face");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("Face"), v8);
  v17[1] = v9;
  v10 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMIVideoAnalyzerEventPerson torso](self, "torso");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithName:value:", CFSTR("Torso"), v11);
  v17[2] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)shortDescription
{
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  -[HMIVideoAnalyzerEventPerson face](self, "face");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[HMIVideoAnalyzerEventPerson face](self, "face");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "shortDescription");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = &stru_24DBF1B40;
  }

  -[HMIVideoAnalyzerEventPerson torso](self, "torso");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[HMIVideoAnalyzerEventPerson torso](self, "torso");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "shortDescription");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = &stru_24DBF1B40;
  }

  v9 = (void *)MEMORY[0x24BDD17C8];
  v13.receiver = self;
  v13.super_class = (Class)HMIVideoAnalyzerEventPerson;
  -[HMIVideoAnalyzerEvent shortDescription](&v13, sel_shortDescription);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@ %@ %@"), v10, v5, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  char v13;
  objc_super v15;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (!v6)
    goto LABEL_9;
  v7 = -[HMIVideoAnalyzerEventPerson hasEstimatedBoundingBox](self, "hasEstimatedBoundingBox");
  if (v7 != objc_msgSend(v6, "hasEstimatedBoundingBox"))
    goto LABEL_9;
  v15.receiver = self;
  v15.super_class = (Class)HMIVideoAnalyzerEventPerson;
  if (!-[HMIVideoAnalyzerEvent isEqual:](&v15, sel_isEqual_, v6))
    goto LABEL_9;
  -[HMIVideoAnalyzerEventPerson face](self, "face");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "face");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = HMFEqualObjects();

  if (v10)
  {
    -[HMIVideoAnalyzerEventPerson torso](self, "torso");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "torso");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = HMFEqualObjects();

  }
  else
  {
LABEL_9:
    v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  uint64_t v3;
  objc_super v5;

  v3 = -[HMIVideoAnalyzerEventPerson hasEstimatedBoundingBox](self, "hasEstimatedBoundingBox");
  v5.receiver = self;
  v5.super_class = (Class)HMIVideoAnalyzerEventPerson;
  return -[HMIVideoAnalyzerEvent hash](&v5, sel_hash) ^ v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HMIVideoAnalyzerEventPerson;
  v4 = a3;
  -[HMIVideoAnalyzerEvent encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[HMIVideoAnalyzerEventPerson face](self, "face", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HMIVAEP.f"));

  -[HMIVideoAnalyzerEventPerson torso](self, "torso");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HMIVAEP.t"));

  objc_msgSend(v4, "encodeBool:forKey:", -[HMIVideoAnalyzerEventPerson hasEstimatedBoundingBox](self, "hasEstimatedBoundingBox"), CFSTR("HMIVAEP.ibbe"));
}

- (HMIVideoAnalyzerEventPerson)initWithCoder:(id)a3
{
  id v4;
  HMIVideoAnalyzerEvent *v5;
  void *v6;
  void *v7;
  HMIVideoAnalyzerEventPerson *v8;
  HMIVideoAnalyzerEventPerson *v9;
  void *v10;

  v4 = a3;
  v5 = -[HMIVideoAnalyzerEvent initWithCoder:]([HMIVideoAnalyzerEvent alloc], "initWithCoder:", v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMIVAEP.f"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMIVAEP.t"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HMIVAEP.ibbe")))
    {
      if (v6 && v7)
      {
        v8 = -[HMIVideoAnalyzerEventPerson initWithFaceEvent:torso:](self, "initWithFaceEvent:torso:", v6, v7);
LABEL_11:
        self = v8;
LABEL_13:

        v9 = self;
        goto LABEL_14;
      }
      if (v6)
      {
        v8 = -[HMIVideoAnalyzerEventPerson initWithFaceEvent:](self, "initWithFaceEvent:", v6);
        goto LABEL_11;
      }
      if (v7)
      {
        v8 = -[HMIVideoAnalyzerEventPerson initWithTorsoEvent:](self, "initWithTorsoEvent:", v7);
        goto LABEL_11;
      }
    }
    -[HMIVideoAnalyzerEvent confidence](v5, "confidence");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMIVideoAnalyzerEvent boundingBox](v5, "boundingBox");
    self = -[HMIVideoAnalyzerEventPerson initWithConfidence:boundingBox:face:torso:](self, "initWithConfidence:boundingBox:face:torso:", v10, v6, v7);

    goto LABEL_13;
  }
  v9 = 0;
LABEL_14:

  return v9;
}

- (HMIVideoAnalyzerEventFace)face
{
  return (HMIVideoAnalyzerEventFace *)objc_getProperty(self, a2, 64, 1);
}

- (BOOL)hasEstimatedBoundingBox
{
  return self->_isBoundingBoxEstimated;
}

- (HMIVideoAnalyzerEventTorso)torso
{
  return (HMIVideoAnalyzerEventTorso *)objc_getProperty(self, a2, 72, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_torso, 0);
  objc_storeStrong((id *)&self->_face, 0);
}

@end
