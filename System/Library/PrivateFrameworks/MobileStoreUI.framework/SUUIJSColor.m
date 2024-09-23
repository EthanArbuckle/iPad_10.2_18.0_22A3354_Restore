@implementation SUUIJSColor

- (SUUIJSColor)initWithAppContext:(id)a3 color:(id)a4
{
  id v6;
  SUUIJSColor *v7;
  SUUIJSColor *v8;
  double v10;
  double v11;
  double v12;
  objc_super v13;

  v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SUUIJSColor;
  v7 = -[IKJSObject initWithAppContext:](&v13, sel_initWithAppContext_, a3);
  v8 = v7;
  if (v6 && v7)
  {
    v11 = 0.0;
    v12 = 0.0;
    v10 = 0.0;
    objc_msgSend(v6, "getRed:green:blue:alpha:", &v12, &v11, &v10, &v7->_alpha);
    v8->_red = (unint64_t)(v12 * 255.0);
    v8->_green = (unint64_t)(v11 * 255.0);
    v8->_blue = (unint64_t)(v10 * 255.0);
  }

  return v8;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("rgba(%lu,%lu,%lu,%f)"), self->_red, self->_green, self->_blue, *(_QWORD *)&self->_alpha);
}

- (unint64_t)red
{
  return self->_red;
}

- (unint64_t)green
{
  return self->_green;
}

- (unint64_t)blue
{
  return self->_blue;
}

- (double)alpha
{
  return self->_alpha;
}

@end
