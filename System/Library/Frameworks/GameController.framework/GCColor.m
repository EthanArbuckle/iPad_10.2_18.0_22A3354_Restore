@implementation GCColor

- (GCColor)initWithRed:(float)red green:(float)green blue:(float)blue
{
  GCColor *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)GCColor;
  result = -[GCColor init](&v9, sel_init);
  if (result)
  {
    result->_red = red;
    result->_green = green;
    result->_blue = blue;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  float red;
  double v5;
  double v6;
  double v7;
  id v8;

  red = self->_red;
  v8 = a3;
  *(float *)&v5 = red;
  objc_msgSend(v8, "encodeFloat:forKey:", CFSTR("red"), v5);
  *(float *)&v6 = self->_green;
  objc_msgSend(v8, "encodeFloat:forKey:", CFSTR("green"), v6);
  *(float *)&v7 = self->_blue;
  objc_msgSend(v8, "encodeFloat:forKey:", CFSTR("blue"), v7);

}

- (GCColor)initWithCoder:(id)a3
{
  id v4;
  GCColor *v5;
  float v6;
  float v7;
  float v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GCColor;
  v5 = -[GCColor init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("red"));
    v5->_red = v6;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("green"));
    v5->_green = v7;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("blue"));
    v5->_blue = v8;
  }

  return v5;
}

- (id)description
{
  return +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("<%@ r=%f g=%f b=%f>"), objc_opt_class(), self->_red, self->_green, self->_blue);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (result)
  {
    *((_DWORD *)result + 2) = LODWORD(self->_red);
    *((_DWORD *)result + 3) = LODWORD(self->_green);
    *((_DWORD *)result + 4) = LODWORD(self->_blue);
  }
  return result;
}

- (float)red
{
  return self->_red;
}

- (float)green
{
  return self->_green;
}

- (float)blue
{
  return self->_blue;
}

- (GCColor)initWithColorPreset:(int64_t)a3
{
  double v3;
  double v4;
  double v5;
  GCColor *v6;

  switch(a3)
  {
    case 2:
      LODWORD(v3) = 1056997505;
      LODWORD(v4) = 1017159841;
      LODWORD(v5) = 1017159841;
      break;
    case 3:
      LODWORD(v4) = 1056997505;
      LODWORD(v3) = 1017159841;
      goto LABEL_7;
    case 4:
      LODWORD(v3) = 1017159841;
      LODWORD(v5) = 1056997505;
      goto LABEL_9;
    case 5:
      LODWORD(v4) = 1017159841;
      LODWORD(v3) = 1056997505;
LABEL_7:
      LODWORD(v5) = LODWORD(v3);
      break;
    case 6:
      LODWORD(v3) = 1056997505;
      LODWORD(v5) = 1017159841;
LABEL_9:
      LODWORD(v4) = LODWORD(v3);
      break;
    default:
      LODWORD(v3) = 1056997505;
      LODWORD(v4) = 1040220289;
      LODWORD(v5) = 1017159841;
      break;
  }
  v6 = -[GCColor initWithRed:green:blue:](self, "initWithRed:green:blue:", v3, v4, v5);

  return v6;
}

@end
