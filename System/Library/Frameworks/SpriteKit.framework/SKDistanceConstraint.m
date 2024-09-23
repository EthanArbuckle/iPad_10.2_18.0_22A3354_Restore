@implementation SKDistanceConstraint

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKDistanceConstraint)initWithPoint:(CGPoint)a3 inNode:(id)a4 distanceRange:(id)a5
{
  double y;
  double x;
  id v9;
  id v10;
  SKDistanceConstraint *v11;
  SKDistanceConstraint *v12;
  objc_super v14;

  y = a3.y;
  x = a3.x;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)SKDistanceConstraint;
  v11 = -[SKConstraint init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    -[SKDistanceConstraint setNode:](v11, "setNode:", v9);
    -[SKDistanceConstraint setDistanceRange:](v12, "setDistanceRange:", v10);
    -[SKDistanceConstraint setPoint:](v12, "setPoint:", x, y);
  }

  return v12;
}

- (SKDistanceConstraint)initWithCoder:(id)a3
{
  id v4;
  SKDistanceConstraint *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKDistanceConstraint;
  v5 = -[SKConstraint initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_node"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKDistanceConstraint setNode:](v5, "setNode:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_distanceRange"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKDistanceConstraint setDistanceRange:](v5, "setDistanceRange:", v7);

    objc_msgSend(v4, "decodeCGPointForKey:", CFSTR("_point"));
    -[SKDistanceConstraint setPoint:](v5, "setPoint:");
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SKDistanceConstraint;
  -[SKConstraint encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[SKDistanceConstraint node](self, "node");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_node"));

  -[SKDistanceConstraint distanceRange](self, "distanceRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("_distanceRange"));

  -[SKDistanceConstraint point](self, "point");
  objc_msgSend(v4, "encodeCGPoint:forKey:", CFSTR("_point"));

}

- (BOOL)isEqualToDistanceConstraint:(id)a3
{
  SKDistanceConstraint *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  double v14;
  double v15;
  float v16;
  double v17;
  double v19;
  double v20;
  float v21;
  double v22;

  v4 = (SKDistanceConstraint *)a3;
  if (self != v4)
  {
    -[SKDistanceConstraint distanceRange](self, "distanceRange");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKDistanceConstraint distanceRange](v4, "distanceRange");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToRange:", v6);

    if ((v7 & 1) != 0)
    {
      -[SKDistanceConstraint node](self, "node");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {

      }
      else
      {
        -[SKDistanceConstraint node](v4, "node");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v10)
          goto LABEL_8;
      }
      -[SKDistanceConstraint node](self, "node");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKDistanceConstraint node](v4, "node");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqualToNode:", v12);

      if ((v13 & 1) != 0)
      {
LABEL_8:
        -[SKDistanceConstraint point](self, "point");
        v15 = v14;
        -[SKDistanceConstraint point](self, "point");
        v16 = v15;
        *(float *)&v17 = v17;
        if ((COERCE_UNSIGNED_INT(v16 - *(float *)&v17) & 0x60000000) == 0)
        {
          -[SKDistanceConstraint point](self, "point");
          v20 = v19;
          -[SKDistanceConstraint point](self, "point");
          v21 = v20;
          *(float *)&v22 = v22;
          v9 = (COERCE_UNSIGNED_INT(v21 - *(float *)&v22) & 0x60000000) == 0;
          goto LABEL_10;
        }
      }
    }
    v9 = 0;
    goto LABEL_10;
  }
  v9 = 1;
LABEL_10:

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SKDistanceConstraint;
  v4 = -[SKConstraint copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[SKDistanceConstraint node](self, "node");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNode:", v5);

  -[SKDistanceConstraint distanceRange](self, "distanceRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDistanceRange:", v6);

  -[SKDistanceConstraint point](self, "point");
  objc_msgSend(v4, "setPoint:");
  return v4;
}

+ (id)constraintWithNode:(id)a3 distanceRange:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPoint:inNode:distanceRange:", v5, v6, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));

  return v7;
}

+ (id)constraintWithPoint:(CGPoint)a3 distanceRange:(id)a4
{
  double y;
  double x;
  id v6;
  void *v7;

  y = a3.y;
  x = a3.x;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPoint:inNode:distanceRange:", 0, v6, x, y);

  return v7;
}

+ (id)constraintWithPoint:(CGPoint)a3 inNode:(id)a4 distanceRange:(id)a5
{
  double y;
  double x;
  id v8;
  id v9;
  void *v10;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPoint:inNode:distanceRange:", v8, v9, x, y);

  return v10;
}

- (SKRange)distanceRange
{
  return (SKRange *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDistanceRange:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (SKNode)node
{
  return (SKNode *)objc_loadWeakRetained((id *)&self->_node);
}

- (void)setNode:(id)a3
{
  objc_storeWeak((id *)&self->_node, a3);
}

- (CGPoint)point
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->_point, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setPoint:(CGPoint)a3
{
  CGPoint v3;

  v3 = a3;
  objc_copyStruct(&self->_point, &v3, 16, 1, 0);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_node);
  objc_storeStrong((id *)&self->_distanceRange, 0);
}

@end
