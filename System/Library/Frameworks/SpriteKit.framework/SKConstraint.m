@implementation SKConstraint

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKConstraint)init
{
  SKConstraint *v2;
  SKConstraint *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SKConstraint;
  v2 = -[SKConstraint init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[SKConstraint setEnabled:](v2, "setEnabled:", 1);
    -[SKConstraint setReferenceNode:](v3, "setReferenceNode:", 0);
  }
  return v3;
}

- (SKConstraint)initWithCoder:(id)a3
{
  id v4;
  SKConstraint *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SKConstraint;
  v5 = -[SKConstraint init](&v8, sel_init);
  if (v5)
  {
    -[SKConstraint setEnabled:](v5, "setEnabled:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_enabled")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_referenceNode"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKConstraint setReferenceNode:](v5, "setReferenceNode:", v6);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", -[SKConstraint enabled](self, "enabled"), CFSTR("_enabled"));
  -[SKConstraint referenceNode](self, "referenceNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("_referenceNode"));

}

- (BOOL)isEqualToConstraint:(id)a3
{
  SKConstraint *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  char v11;
  BOOL v12;

  v4 = (SKConstraint *)a3;
  if (v4 == self)
    goto LABEL_21;
  v5 = -[SKConstraint enabled](self, "enabled");
  if (v5 == -[SKConstraint enabled](v4, "enabled"))
  {
    -[SKConstraint referenceNode](self, "referenceNode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {

    }
    else
    {
      -[SKConstraint referenceNode](v4, "referenceNode");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
LABEL_7:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = -[SKConstraint isEqualToSizeConstraint:](self, "isEqualToSizeConstraint:", v4);
LABEL_20:
          v12 = v11;
          goto LABEL_22;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = -[SKConstraint isEqualToScaleConstraint:](self, "isEqualToScaleConstraint:", v4);
          goto LABEL_20;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = -[SKConstraint isEqualToPositionConstraint:](self, "isEqualToPositionConstraint:", v4);
          goto LABEL_20;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = -[SKConstraint isEqualToRotationConstraint:](self, "isEqualToRotationConstraint:", v4);
          goto LABEL_20;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = -[SKConstraint isEqualToOrientationConstraint:](self, "isEqualToOrientationConstraint:", v4);
          goto LABEL_20;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = -[SKConstraint isEqualToDistanceConstraint:](self, "isEqualToDistanceConstraint:", v4);
          goto LABEL_20;
        }
LABEL_21:
        v12 = 1;
        goto LABEL_22;
      }
    }
    -[SKConstraint referenceNode](self, "referenceNode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKConstraint referenceNode](v4, "referenceNode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqualToNode:", v9);

    if ((v10 & 1) != 0)
      goto LABEL_7;
  }
  v12 = 0;
LABEL_22:

  return v12;
}

+ (SKConstraint)positionX:(SKRange *)range
{
  +[SKPositionConstraint constraintWithXRange:](SKPositionConstraint, "constraintWithXRange:", range);
  return (SKConstraint *)(id)objc_claimAutoreleasedReturnValue();
}

+ (SKConstraint)positionY:(SKRange *)range
{
  +[SKPositionConstraint constraintWithYRange:](SKPositionConstraint, "constraintWithYRange:", range);
  return (SKConstraint *)(id)objc_claimAutoreleasedReturnValue();
}

+ (SKConstraint)positionX:(SKRange *)xRange Y:(SKRange *)yRange
{
  +[SKPositionConstraint constraintWithXRange:YRange:](SKPositionConstraint, "constraintWithXRange:YRange:", xRange, yRange);
  return (SKConstraint *)(id)objc_claimAutoreleasedReturnValue();
}

+ (SKConstraint)distance:(SKRange *)range toNode:(SKNode *)node
{
  +[SKDistanceConstraint constraintWithNode:distanceRange:](SKDistanceConstraint, "constraintWithNode:distanceRange:", node, range);
  return (SKConstraint *)(id)objc_claimAutoreleasedReturnValue();
}

+ (SKConstraint)distance:(SKRange *)range toPoint:(CGPoint)point
{
  +[SKDistanceConstraint constraintWithPoint:distanceRange:](SKDistanceConstraint, "constraintWithPoint:distanceRange:", range, point.x, point.y);
  return (SKConstraint *)(id)objc_claimAutoreleasedReturnValue();
}

+ (SKConstraint)distance:(SKRange *)range toPoint:(CGPoint)point inNode:(SKNode *)node
{
  +[SKDistanceConstraint constraintWithPoint:inNode:distanceRange:](SKDistanceConstraint, "constraintWithPoint:inNode:distanceRange:", node, range, point.x, point.y);
  return (SKConstraint *)(id)objc_claimAutoreleasedReturnValue();
}

+ (SKConstraint)zRotation:(SKRange *)zRange
{
  +[SKRotationConstraint constraintWithZRotationRange:](SKRotationConstraint, "constraintWithZRotationRange:", zRange);
  return (SKConstraint *)(id)objc_claimAutoreleasedReturnValue();
}

+ (SKConstraint)orientToPoint:(CGPoint)point inNode:(SKNode *)node offset:(SKRange *)radians
{
  +[SKOrientationConstraint constraintOrientingToPoint:inNode:offset:](SKOrientationConstraint, "constraintOrientingToPoint:inNode:offset:", node, radians, point.x, point.y);
  return (SKConstraint *)(id)objc_claimAutoreleasedReturnValue();
}

+ (SKConstraint)orientToNode:(SKNode *)node offset:(SKRange *)radians
{
  +[SKOrientationConstraint constraintOrientingToNode:offset:](SKOrientationConstraint, "constraintOrientingToNode:offset:", node, radians);
  return (SKConstraint *)(id)objc_claimAutoreleasedReturnValue();
}

+ (SKConstraint)orientToPoint:(CGPoint)point offset:(SKRange *)radians
{
  +[SKOrientationConstraint constraintOrientingToPoint:offset:](SKOrientationConstraint, "constraintOrientingToPoint:offset:", radians, point.x, point.y);
  return (SKConstraint *)(id)objc_claimAutoreleasedReturnValue();
}

+ (id)width:(id)a3
{
  +[SKSizeConstraint constraintWithWidthRange:](SKSizeConstraint, "constraintWithWidthRange:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)height:(id)a3
{
  +[SKSizeConstraint constraintWithHeightRange:](SKSizeConstraint, "constraintWithHeightRange:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)width:(id)a3 height:(id)a4
{
  +[SKSizeConstraint constraintWithWidthRange:heightRange:](SKSizeConstraint, "constraintWithWidthRange:heightRange:", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)scale:(id)a3
{
  +[SKScaleConstraint constraintWithScaleRange:](SKScaleConstraint, "constraintWithScaleRange:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)scaleX:(id)a3
{
  +[SKScaleConstraint constraintWithXRange:](SKScaleConstraint, "constraintWithXRange:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)scaleY:(id)a3
{
  +[SKScaleConstraint constraintWithYRange:](SKScaleConstraint, "constraintWithYRange:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)scaleX:(id)a3 scaleY:(id)a4
{
  +[SKScaleConstraint constraintWithXRange:YRange:](SKScaleConstraint, "constraintWithXRange:YRange:", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)description
{
  void *v2;
  _BOOL4 v3;
  const __CFString *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = -[SKConstraint enabled](self, "enabled");
  v4 = CFSTR("NO");
  if (v3)
    v4 = CFSTR("YES");
  return (id)objc_msgSend(v2, "stringWithFormat:", CFSTR("<SKConstraint> enabled: %@"), v4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setEnabled:", -[SKConstraint enabled](self, "enabled"));
  -[SKConstraint referenceNode](self, "referenceNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReferenceNode:", v5);

  return v4;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)enabled
{
  self->_enabled = enabled;
}

- (SKNode)referenceNode
{
  return self->_referenceNode;
}

- (void)setReferenceNode:(SKNode *)referenceNode
{
  objc_storeStrong((id *)&self->_referenceNode, referenceNode);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceNode, 0);
}

@end
