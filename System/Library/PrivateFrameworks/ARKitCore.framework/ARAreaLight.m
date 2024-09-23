@implementation ARAreaLight

- (ARAreaLight)initWithDirection:(ARAreaLight *)self angularSize:(SEL)a2 color:(float)a3
{
  float v3;
  __int128 v4;
  float v5;
  ARAreaLight *result;
  __int128 v7;
  __int128 v8;
  objc_super v9;

  v7 = *(_OWORD *)&a3;
  v8 = v4;
  v5 = v3;
  v9.receiver = self;
  v9.super_class = (Class)ARAreaLight;
  result = -[ARAreaLight init](&v9, sel_init);
  if (result)
  {
    result->_angularSize = v5;
    *(_OWORD *)&result->_direction[4] = v7;
    *(_OWORD *)&result->_color[4] = v8;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ARAreaLight)initWithCoder:(id)a3
{
  id v4;
  double v5;
  int v6;
  int v7;
  double v8;
  double v9;
  double v11;
  double v12;

  v4 = a3;
  objc_msgSend(v4, "ar_decodeVector3ForKey:", CFSTR("direction"));
  v12 = v5;
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("angularSize"));
  v7 = v6;
  objc_msgSend(v4, "ar_decodeVector3ForKey:", CFSTR("color"));
  v11 = v8;

  LODWORD(v9) = v7;
  return -[ARAreaLight initWithDirection:angularSize:color:](self, "initWithDirection:angularSize:color:", v12, v9, v11);
}

- (void)encodeWithCoder:(id)a3
{
  double v4;
  __int128 v5;
  id v6;

  v5 = *(_OWORD *)&self->_direction[4];
  v6 = a3;
  objc_msgSend(v6, "ar_encodeVector3:forKey:", CFSTR("direction"), *(double *)&v5);
  *(float *)&v4 = self->_angularSize;
  objc_msgSend(v6, "encodeFloat:forKey:", CFSTR("angularSize"), v4);
  objc_msgSend(v6, "ar_encodeVector3:forKey:", CFSTR("color"), *(double *)&self->_color[4]);

}

- (__n128)direction
{
  return a1[1];
}

- (float)angularSize
{
  return self->_angularSize;
}

- (__n128)color
{
  return a1[2];
}

@end
