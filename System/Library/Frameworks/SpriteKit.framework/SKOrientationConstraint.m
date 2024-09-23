@implementation SKOrientationConstraint

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKOrientationConstraint)initWithNode:(id)a3 point:(CGPoint)a4 offset:(id)a5
{
  double y;
  double x;
  id v9;
  id v10;
  SKOrientationConstraint *v11;
  SKOrientationConstraint *v12;
  objc_super v14;

  y = a4.y;
  x = a4.x;
  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)SKOrientationConstraint;
  v11 = -[SKConstraint init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    -[SKOrientationConstraint setNode:](v11, "setNode:", v9);
    -[SKOrientationConstraint setOffset:](v12, "setOffset:", v10);
    -[SKOrientationConstraint setPoint:](v12, "setPoint:", x, y);
  }

  return v12;
}

- (SKOrientationConstraint)initWithCoder:(id)a3
{
  id v4;
  SKOrientationConstraint *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKOrientationConstraint;
  v5 = -[SKConstraint initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_node"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKOrientationConstraint setNode:](v5, "setNode:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_offset"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKOrientationConstraint setOffset:](v5, "setOffset:", v7);

    objc_msgSend(v4, "decodeCGPointForKey:", CFSTR("_point"));
    -[SKOrientationConstraint setPoint:](v5, "setPoint:");
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
  v7.super_class = (Class)SKOrientationConstraint;
  -[SKConstraint encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[SKOrientationConstraint node](self, "node");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_node"));

  -[SKOrientationConstraint offset](self, "offset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("_offset"));

  -[SKOrientationConstraint point](self, "point");
  objc_msgSend(v4, "encodeCGPoint:forKey:", CFSTR("_point"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SKOrientationConstraint;
  v4 = -[SKConstraint copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[SKOrientationConstraint node](self, "node");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNode:", v5);

  -[SKOrientationConstraint offset](self, "offset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOffset:", v6);

  -[SKOrientationConstraint point](self, "point");
  objc_msgSend(v4, "setPoint:");
  return v4;
}

- (BOOL)isEqualToOrientationConstraint:(id)a3
{
  SKOrientationConstraint *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  double v18;
  double v19;
  float v20;
  double v21;
  double v23;
  double v24;
  float v25;
  double v26;

  v4 = (SKOrientationConstraint *)a3;
  if (self != v4)
  {
    -[SKOrientationConstraint offset](self, "offset");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKOrientationConstraint offset](v4, "offset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToRange:", v6);

    if ((v7 & 1) != 0)
    {
      -[SKOrientationConstraint node](self, "node");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8
        || (-[SKOrientationConstraint node](v4, "node"), (v12 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
      {
        -[SKOrientationConstraint node](self, "node");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          -[SKOrientationConstraint node](v4, "node");
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (v8)
          if (!v10)
            goto LABEL_18;
        }
        else
        {

          if (v8)
        }
        -[SKOrientationConstraint node](self, "node");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v13)
          goto LABEL_23;
        -[SKOrientationConstraint node](v4, "node");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v14
          || (-[SKOrientationConstraint node](self, "node"),
              v15 = (void *)objc_claimAutoreleasedReturnValue(),
              -[SKOrientationConstraint node](v4, "node"),
              v16 = (void *)objc_claimAutoreleasedReturnValue(),
              v17 = objc_msgSend(v15, "isEqualToNode:", v16),
              v16,
              v15,
              (v17 & 1) != 0))
        {
LABEL_23:
          -[SKOrientationConstraint point](self, "point");
          v19 = v18;
          -[SKOrientationConstraint point](self, "point");
          v20 = v19;
          *(float *)&v21 = v21;
          if ((COERCE_UNSIGNED_INT(v20 - *(float *)&v21) & 0x60000000) == 0)
          {
            -[SKOrientationConstraint point](self, "point");
            v24 = v23;
            -[SKOrientationConstraint point](self, "point");
            v25 = v24;
            *(float *)&v26 = v26;
            v11 = (COERCE_UNSIGNED_INT(v25 - *(float *)&v26) & 0x60000000) == 0;
            goto LABEL_19;
          }
        }
        goto LABEL_18;
      }

    }
LABEL_18:
    v11 = 0;
    goto LABEL_19;
  }
  v11 = 1;
LABEL_19:

  return v11;
}

+ (id)constraintOrientingToPoint:(CGPoint)a3 inNode:(id)a4 offset:(id)a5
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
  v10 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithNode:point:offset:", v8, v9, x, y);

  return v10;
}

+ (id)constraintOrientingToNode:(id)a3 offset:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithNode:point:offset:", v5, v6, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));

  return v7;
}

+ (id)constraintOrientingToPoint:(CGPoint)a3 offset:(id)a4
{
  double y;
  double x;
  id v6;
  void *v7;

  y = a3.y;
  x = a3.x;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithNode:point:offset:", 0, v6, x, y);

  return v7;
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

- (SKRange)offset
{
  return (SKRange *)objc_getProperty(self, a2, 32, 1);
}

- (void)setOffset:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offset, 0);
  objc_destroyWeak((id *)&self->_node);
}

@end
