@implementation HMIObjectDetection

- (HMIObjectDetection)initWithLabelIndex:(int)a3 confidence:(double)a4 unclampedBoundingBox:(CGRect)a5 yaw:(id)a6 roll:(id)a7
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v16;
  id v17;
  HMIObjectDetection *v18;
  HMIObjectDetection *v19;
  objc_super v21;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v16 = a6;
  v17 = a7;
  v21.receiver = self;
  v21.super_class = (Class)HMIObjectDetection;
  v18 = -[HMIObjectDetection init](&v21, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_labelIndex = a3;
    v18->_confidence = a4;
    v18->_boundingBox.origin.x = x;
    v18->_boundingBox.origin.y = y;
    v18->_boundingBox.size.width = width;
    v18->_boundingBox.size.height = height;
    objc_storeStrong((id *)&v18->_yaw, a6);
    objc_storeStrong((id *)&v19->_roll, a7);
  }

  return v19;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = -[HMIObjectDetection labelIndex](self, "labelIndex");
  -[HMIObjectDetection confidence](self, "confidence");
  v6 = v5;
  -[HMIObjectDetection boundingBox](self, "boundingBox");
  v8 = v7;
  -[HMIObjectDetection boundingBox](self, "boundingBox");
  v10 = v9;
  -[HMIObjectDetection boundingBox](self, "boundingBox");
  v12 = v11;
  -[HMIObjectDetection boundingBox](self, "boundingBox");
  v14 = v13;
  -[HMIObjectDetection yaw](self, "yaw");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Label:%d Confidence:%f X:%f Y:%f Width:%f Height:%f Yaw:%@}"), v4, v6, v8, v10, v12, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (int)labelIndex
{
  return self->_labelIndex;
}

- (double)confidence
{
  return self->_confidence;
}

- (NSNumber)yaw
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (NSNumber)roll
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (CGRect)boundingBox
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_boundingBox.origin.x;
  y = self->_boundingBox.origin.y;
  width = self->_boundingBox.size.width;
  height = self->_boundingBox.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roll, 0);
  objc_storeStrong((id *)&self->_yaw, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HMIObjectDetection)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  HMIObjectDetection *v18;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("HMIOD.l"));
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HMIOD.c"));
  v7 = v6;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HMIOD.b.x"));
  v9 = v8;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HMIOD.b.y"));
  v11 = v10;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HMIOD.b.w"));
  v13 = v12;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HMIOD.b.h"));
  v15 = v14;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMIOD.y.a"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMIOD.r.o"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = -[HMIObjectDetection initWithLabelIndex:confidence:boundingBox:yaw:roll:](self, "initWithLabelIndex:confidence:boundingBox:yaw:roll:", v5, v16, v17, v7, v9, v11, v13, v15);
  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "encodeInt:forKey:", -[HMIObjectDetection labelIndex](self, "labelIndex"), CFSTR("HMIOD.l"));
  -[HMIObjectDetection confidence](self, "confidence");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HMIOD.c"));
  -[HMIObjectDetection boundingBox](self, "boundingBox");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HMIOD.b.x"));
  -[HMIObjectDetection boundingBox](self, "boundingBox");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HMIOD.b.y"), v5);
  -[HMIObjectDetection boundingBox](self, "boundingBox");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HMIOD.b.w"), v6);
  -[HMIObjectDetection boundingBox](self, "boundingBox");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HMIOD.b.h"), v7);
  -[HMIObjectDetection yaw](self, "yaw");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("HMIOD.y.a"));

  -[HMIObjectDetection roll](self, "roll");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("HMIOD.r.o"));

}

- (BOOL)isEqual:(id)a3
{
  HMIObjectDetection *v4;
  HMIObjectDetection *v5;
  int v6;
  int v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  BOOL v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGRect v32;
  CGRect v33;

  v4 = (HMIObjectDetection *)a3;
  if (v4 == self)
  {
    v18 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[HMIObjectDetection labelIndex](self, "labelIndex");
      v7 = -[HMIObjectDetection labelIndex](v5, "labelIndex");
      -[HMIObjectDetection confidence](self, "confidence");
      v9 = v8;
      -[HMIObjectDetection confidence](v5, "confidence");
      v11 = v10;
      -[HMIObjectDetection yaw](self, "yaw");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMIObjectDetection yaw](v5, "yaw");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = HMFEqualObjects();

      -[HMIObjectDetection roll](self, "roll");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMIObjectDetection roll](v5, "roll");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = HMFEqualObjects();

      v18 = 0;
      if (v6 == v7 && v9 == v11 && v14 && v17)
      {
        -[HMIObjectDetection boundingBox](self, "boundingBox");
        v20 = v19;
        v22 = v21;
        v24 = v23;
        v26 = v25;
        -[HMIObjectDetection boundingBox](v5, "boundingBox");
        v33.origin.x = v27;
        v33.origin.y = v28;
        v33.size.width = v29;
        v33.size.height = v30;
        v32.origin.x = v20;
        v32.origin.y = v22;
        v32.size.width = v24;
        v32.size.height = v26;
        v18 = CGRectEqualToRect(v32, v33);
      }

    }
    else
    {
      v18 = 0;
    }
  }

  return v18;
}

- (unint64_t)hash
{
  int v3;
  double v4;
  double v5;
  long double v6;
  double v7;
  double v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unsigned int v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  unint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  unint64_t v23;

  v3 = -[HMIObjectDetection labelIndex](self, "labelIndex");
  -[HMIObjectDetection confidence](self, "confidence");
  v5 = -v4;
  if (v4 >= 0.0)
    v5 = v4;
  v6 = floor(v5 + 0.5);
  v7 = (v5 - v6) * 1.84467441e19;
  v8 = fmod(v6, 1.84467441e19);
  v9 = 2654435761u * (unint64_t)v8;
  v10 = v9 + (unint64_t)v7;
  if (v7 <= 0.0)
    v10 = 2654435761u * (unint64_t)v8;
  v11 = v9 - (unint64_t)fabs(v7);
  if (v7 < 0.0)
    v12 = v11;
  else
    v12 = v10;
  if (v3 >= 0)
    v13 = v3;
  else
    v13 = -v3;
  v14 = 2654435761 * v13;
  -[HMIObjectDetection boundingBox](self, "boundingBox");
  v19 = v14 ^ HMIHashCGRect(v15, v16, v17, v18);
  -[HMIObjectDetection yaw](self, "yaw");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v19 ^ objc_msgSend(v20, "hash");
  -[HMIObjectDetection roll](self, "roll");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v12 ^ v21 ^ objc_msgSend(v22, "hash");

  return v23;
}

@end
