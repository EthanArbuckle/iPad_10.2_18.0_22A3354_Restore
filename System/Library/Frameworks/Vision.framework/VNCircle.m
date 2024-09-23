@implementation VNCircle

- (VNCircle)init
{
  void *v3;
  VNCircle *v4;

  +[VNPoint zeroPoint](VNPoint, "zeroPoint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[VNCircle initWithCenter:radius:](self, "initWithCenter:radius:", v3, 0.0);

  return v4;
}

- (VNCircle)initWithCenter:(VNPoint *)center radius:(double)radius
{
  VNPoint *v6;
  VNCircle *v7;
  _BOOL4 v8;
  _BOOL4 v9;
  int v10;
  VNCircle *v11;
  uint64_t v12;
  VNPoint *v13;
  objc_super v15;

  v6 = center;
  v15.receiver = self;
  v15.super_class = (Class)VNCircle;
  v7 = -[VNCircle init](&v15, sel_init);
  if (!v7)
    goto LABEL_13;
  v8 = (*(_QWORD *)&radius & 0x7FFFFFFFFFFFFFFFuLL) - 1 < 0xFFFFFFFFFFFFFLL;
  v9 = radius < 0.0 && ((*(_QWORD *)&radius & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 < 0x3FF;
  if (radius >= 0.0)
    v8 = 0;
  v10 = (*(_QWORD *)&radius & 0x7FFFFFFFFFFFFFFFLL) == 0x7FF0000000000000 || v8;
  if ((*(_QWORD *)&radius & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FF0000000000000)
    v10 = 1;
  if (((v10 | v9) & 1) == 0)
  {
    v12 = -[VNPoint copy](v6, "copy");
    v13 = v7->_center;
    v7->_center = (VNPoint *)v12;

    v7->_radius = radius;
    v11 = v7;
  }
  else
  {
LABEL_13:
    v11 = 0;
  }

  return v11;
}

- (VNCircle)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  VNCircle *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ctr"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("rds"));
  v7 = -[VNCircle initWithCenter:radius:](self, "initWithCenter:radius:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_center, CFSTR("ctr"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("rds"), self->_radius);

}

- (VNCircle)initWithCenter:(VNPoint *)center diameter:(double)diameter
{
  return -[VNCircle initWithCenter:radius:](self, "initWithCenter:radius:", center, diameter * 0.5);
}

- (double)diameter
{
  double v2;

  -[VNCircle radius](self, "radius");
  return v2 + v2;
}

- (BOOL)containsPoint:(VNPoint *)point
{
  VNPoint *v4;
  void *v5;
  VNVector *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  VNVector *v14;
  double v15;
  double v16;
  double v17;

  v4 = point;
  -[VNCircle center](self, "center");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [VNVector alloc];
  -[VNPoint x](v4, "x");
  v8 = v7;
  objc_msgSend(v5, "x");
  v10 = v9;
  -[VNPoint y](v4, "y");
  v12 = v11;
  objc_msgSend(v5, "y");
  v14 = -[VNVector initWithXComponent:yComponent:](v6, "initWithXComponent:yComponent:", v8 - v10, v12 - v13);
  -[VNVector length](v14, "length");
  v16 = v15;
  -[VNCircle radius](self, "radius");
  LOBYTE(self) = v16 <= v17;

  return (char)self;
}

- (BOOL)containsPoint:(VNPoint *)point inCircumferentialRingOfWidth:(double)ringWidth
{
  VNPoint *v6;
  BOOL v7;
  void *v8;
  VNVector *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  VNVector *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;

  v6 = point;
  if (ringWidth >= 0.0)
  {
    -[VNCircle center](self, "center");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = [VNVector alloc];
    -[VNPoint x](v6, "x");
    v11 = v10;
    objc_msgSend(v8, "x");
    v13 = v12;
    -[VNPoint y](v6, "y");
    v15 = v14;
    objc_msgSend(v8, "y");
    v17 = -[VNVector initWithXComponent:yComponent:](v9, "initWithXComponent:yComponent:", v11 - v13, v15 - v16);
    -[VNVector length](v17, "length");
    v19 = v18;
    -[VNCircle radius](self, "radius");
    v20 = ringWidth * 0.5;
    if (v19 <= ringWidth * 0.5 + v21)
    {
      -[VNVector length](v17, "length");
      v23 = v22;
      -[VNCircle radius](self, "radius");
      v7 = v23 >= v24 - v20;
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  id v3;
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VNCircle;
  v3 = -[VNCircle hash](&v9, sel_hash);
  -[VNCircle center](self, "center");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ __ROR8__(v3, 51);

  -[VNCircle radius](self, "radius");
  v7 = v6;
  if (v6 == 0.0)
    v7 = 0.0;
  return *(_QWORD *)&v7 ^ __ROR8__(v5, 51);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  double v9;
  double v10;
  double v11;
  BOOL v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[VNCircle center](self, "center");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "center");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = VisionCoreEqualOrNilObjects();

    if ((v8 & 1) != 0)
    {
      -[VNCircle radius](self, "radius");
      v10 = v9;
      objc_msgSend(v5, "radius");
      v12 = v10 == v11;
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)description
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[VNCircle center](self, "center");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNCircle radius](self, "radius");
  v6 = v5;
  -[VNCircle diameter](self, "diameter");
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("center = %@; radius = %f (diameter = %f)"), v4, v6, v7);

  return v8;
}

- (VNPoint)center
{
  return (VNPoint *)objc_getProperty(self, a2, 8, 1);
}

- (double)radius
{
  return self->_radius;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_center, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (VNCircle)zeroCircle
{
  if (+[VNCircle zeroCircle]::onceToken != -1)
    dispatch_once(&+[VNCircle zeroCircle]::onceToken, &__block_literal_global_32869);
  return (VNCircle *)(id)+[VNCircle zeroCircle]::zeroCircle;
}

void __22__VNCircle_zeroCircle__block_invoke()
{
  VNCircle *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [VNCircle alloc];
  +[VNPoint zeroPoint](VNPoint, "zeroPoint");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[VNCircle initWithCenter:radius:](v0, "initWithCenter:radius:", 0.0);
  v2 = (void *)+[VNCircle zeroCircle]::zeroCircle;
  +[VNCircle zeroCircle]::zeroCircle = v1;

}

@end
