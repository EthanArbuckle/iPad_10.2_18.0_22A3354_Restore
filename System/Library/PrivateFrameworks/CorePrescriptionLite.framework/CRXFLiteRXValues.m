@implementation CRXFLiteRXValues

- (CRXFLiteRXValues)initWithSphere:(float)a3 cylinder:(float)a4 axis:(unint64_t)a5
{
  CRXFLiteRXValues *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CRXFLiteRXValues;
  result = -[CRXFLiteRXValues init](&v9, sel_init);
  if (result)
  {
    result->_sphere = a3;
    result->_cylinder = a4;
    result->_axis = a5;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRXFLiteRXValues)initWithCoder:(id)a3
{
  id v4;
  int v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;
  double v10;
  double v11;

  v4 = a3;
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("sph"));
  v6 = v5;
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("cyl"));
  v8 = v7;
  v9 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("axis"));

  LODWORD(v10) = v6;
  LODWORD(v11) = v8;
  return -[CRXFLiteRXValues initWithSphere:cylinder:axis:](self, "initWithSphere:cylinder:axis:", v9, v10, v11);
}

- (void)encodeWithCoder:(id)a3
{
  float sphere;
  double v5;
  double v6;
  id v7;

  sphere = self->_sphere;
  v7 = a3;
  *(float *)&v5 = sphere;
  objc_msgSend(v7, "encodeFloat:forKey:", CFSTR("sph"), v5);
  *(float *)&v6 = self->_cylinder;
  objc_msgSend(v7, "encodeFloat:forKey:", CFSTR("cyl"), v6);
  objc_msgSend(v7, "encodeInteger:forKey:", self->_axis, CFSTR("axis"));

}

- (id)description
{
  void *v3;
  float v4;
  double v5;
  float v6;
  double v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[CRXFLiteRXValues sphere](self, "sphere");
  v5 = v4;
  -[CRXFLiteRXValues cylinder](self, "cylinder");
  v7 = v6;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[CRXFLiteRXValues axis](self, "axis"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("sphere:%.02f, cylinder:%.02f, axis:%@"), *(_QWORD *)&v5, *(_QWORD *)&v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (float)sphere
{
  return self->_sphere;
}

- (float)cylinder
{
  return self->_cylinder;
}

- (unint64_t)axis
{
  return self->_axis;
}

@end
