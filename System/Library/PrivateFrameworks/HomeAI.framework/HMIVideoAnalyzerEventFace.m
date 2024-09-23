@implementation HMIVideoAnalyzerEventFace

- (HMIVideoAnalyzerEventFace)initWithConfidence:(id)a3 boundingBox:(CGRect)a4
{
  return -[HMIVideoAnalyzerEventFace initWithConfidence:boundingBox:yaw:roll:faceRecognition:userInfo:](self, "initWithConfidence:boundingBox:yaw:roll:faceRecognition:userInfo:", a3, 0, 0, 0, 0, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (HMIVideoAnalyzerEventFace)initWithConfidence:(id)a3 boundingBox:(CGRect)a4 faceRecognition:(id)a5
{
  return -[HMIVideoAnalyzerEventFace initWithConfidence:boundingBox:yaw:roll:faceRecognition:torsoAnnotation:userInfo:](self, "initWithConfidence:boundingBox:yaw:roll:faceRecognition:torsoAnnotation:userInfo:", a3, 0, 0, a5, 0, 0, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (HMIVideoAnalyzerEventFace)initWithConfidence:(id)a3 boundingBox:(CGRect)a4 yaw:(id)a5 roll:(id)a6 faceRecognition:(id)a7 userInfo:(id)a8
{
  return -[HMIVideoAnalyzerEventFace initWithConfidence:boundingBox:yaw:roll:faceRecognition:torsoAnnotation:userInfo:](self, "initWithConfidence:boundingBox:yaw:roll:faceRecognition:torsoAnnotation:userInfo:", a3, a5, a6, a7, 0, a8, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (HMIVideoAnalyzerEventFace)initWithConfidence:(id)a3 boundingBox:(CGRect)a4 yaw:(id)a5 roll:(id)a6 faceRecognition:(id)a7 torsoAnnotation:(id)a8 userInfo:(id)a9
{
  double height;
  double width;
  double y;
  double x;
  id v20;
  id v21;
  id v22;
  HMIVideoAnalyzerEventFace *v23;
  HMIVideoAnalyzerEventFace *v24;
  id v26;
  objc_super v27;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v26 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v27.receiver = self;
  v27.super_class = (Class)HMIVideoAnalyzerEventFace;
  v23 = -[HMIVideoAnalyzerEvent initWithConfidence:boundingBox:userInfo:](&v27, sel_initWithConfidence_boundingBox_userInfo_, a3, a9, x, y, width, height);
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_faceRecognition, a7);
    objc_storeStrong((id *)&v24->_torsoAnnotation, a8);
    objc_storeStrong((id *)&v24->_yaw, a5);
    objc_storeStrong((id *)&v24->_roll, a6);
  }

  return v24;
}

- (NSUUID)sessionEntityUUID
{
  void *v3;
  void *v4;
  void *v5;

  -[HMIVideoAnalyzerEventFace faceRecognition](self, "faceRecognition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[HMIVideoAnalyzerEventFace faceRecognition](self, "faceRecognition");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sessionEntityUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return (NSUUID *)v5;
}

- (id)attributeDescriptions
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  objc_super v19;
  _QWORD v20[5];

  v20[4] = *MEMORY[0x24BDAC8D0];
  v19.receiver = self;
  v19.super_class = (Class)HMIVideoAnalyzerEventFace;
  -[HMIVideoAnalyzerEvent attributeDescriptions](&v19, sel_attributeDescriptions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMIVideoAnalyzerEventFace faceRecognition](self, "faceRecognition");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("Face Recognition"), v18);
  v20[0] = v5;
  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMIVideoAnalyzerEventFace torsoAnnotation](self, "torsoAnnotation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Torso Annotation"), v7);
  v20[1] = v8;
  v9 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMIVideoAnalyzerEventFace yaw](self, "yaw");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("Face Yaw"), v10);
  v20[2] = v11;
  v12 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMIVideoAnalyzerEventFace roll](self, "roll");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithName:value:", CFSTR("Face Roll"), v13);
  v20[3] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v11.receiver = self;
  v11.super_class = (Class)HMIVideoAnalyzerEventFace;
  -[HMIVideoAnalyzerEvent shortDescription](&v11, sel_shortDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIVideoAnalyzerEventFace roll](self, "roll");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HMIFormatNumber(v5, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIVideoAnalyzerEventFace yaw](self, "yaw");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HMIFormatNumber(v7, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@@(%@,%@)"), v4, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v17;
  void *v18;
  objc_super v19;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (!v6)
    goto LABEL_10;
  v19.receiver = self;
  v19.super_class = (Class)HMIVideoAnalyzerEventFace;
  if (!-[HMIVideoAnalyzerEvent isEqual:](&v19, sel_isEqual_, v6))
    goto LABEL_10;
  -[HMIVideoAnalyzerEventFace faceRecognition](self, "faceRecognition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "faceRecognition");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = HMFEqualObjects();

  if (!v9)
    goto LABEL_10;
  -[HMIVideoAnalyzerEventFace torsoAnnotation](self, "torsoAnnotation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "torsoAnnotation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = HMFEqualObjects();

  if (v12)
  {
    -[HMIVideoAnalyzerEventFace yaw](self, "yaw");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "yaw");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 == v14)
    {
      -[HMIVideoAnalyzerEventFace roll](self, "roll");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "roll");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v17 == v18;

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
LABEL_10:
    v15 = 0;
  }

  return v15;
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
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HMIVideoAnalyzerEventFace;
  v4 = a3;
  -[HMIVideoAnalyzerEvent encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  -[HMIVideoAnalyzerEventFace faceRecognition](self, "faceRecognition", v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HMIVAEF.fr"));

  -[HMIVideoAnalyzerEventFace torsoAnnotation](self, "torsoAnnotation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HMIVAEF.ta"));

  -[HMIVideoAnalyzerEventFace yaw](self, "yaw");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("HMIVAEF.ya"));

  -[HMIVideoAnalyzerEventFace roll](self, "roll");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("HMIVAEF.ro"));

}

- (HMIVideoAnalyzerEventFace)initWithCoder:(id)a3
{
  id v4;
  HMIVideoAnalyzerEvent *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  HMIVideoAnalyzerEventFace *v20;

  v4 = a3;
  v5 = -[HMIVideoAnalyzerEvent initWithCoder:]([HMIVideoAnalyzerEvent alloc], "initWithCoder:", v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMIVAEF.fr"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMIVAEF.ta"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMIVAEF.ya"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMIVAEF.ro"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMIVideoAnalyzerEvent confidence](v5, "confidence");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMIVideoAnalyzerEvent boundingBox](v5, "boundingBox");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    -[HMIVideoAnalyzerEvent userInfo](v5, "userInfo");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[HMIVideoAnalyzerEventFace initWithConfidence:boundingBox:yaw:roll:faceRecognition:torsoAnnotation:userInfo:](self, "initWithConfidence:boundingBox:yaw:roll:faceRecognition:torsoAnnotation:userInfo:", v10, v8, v9, v6, v7, v19, v12, v14, v16, v18);

    v20 = self;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (HMIFaceRecognition)faceRecognition
{
  return (HMIFaceRecognition *)objc_getProperty(self, a2, 56, 1);
}

- (NSNumber)yaw
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (NSNumber)roll
{
  return (NSNumber *)objc_getProperty(self, a2, 72, 1);
}

- (HMITorsoAnnotation)torsoAnnotation
{
  return (HMITorsoAnnotation *)objc_getProperty(self, a2, 80, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_torsoAnnotation, 0);
  objc_storeStrong((id *)&self->_roll, 0);
  objc_storeStrong((id *)&self->_yaw, 0);
  objc_storeStrong((id *)&self->_faceRecognition, 0);
}

@end
