@implementation TDColorProperty

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)TDColorProperty;
  -[TDProperty dealloc](&v2, sel_dealloc);
}

- (float)red
{
  float red;

  -[TDColorProperty willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("red"));
  red = self->_red;
  -[TDColorProperty didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("red"));
  return red;
}

- (void)setRed:(float)a3
{
  -[TDColorProperty willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("red"));
  self->_red = a3;
  -[TDColorProperty didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("red"));
}

- (float)green
{
  float green;

  -[TDColorProperty willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("green"));
  green = self->_green;
  -[TDColorProperty didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("green"));
  return green;
}

- (void)setGreen:(float)a3
{
  -[TDColorProperty willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("green"));
  self->_green = a3;
  -[TDColorProperty didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("green"));
}

- (float)blue
{
  float blue;

  -[TDColorProperty willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("blue"));
  blue = self->_blue;
  -[TDColorProperty didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("blue"));
  return blue;
}

- (void)setBlue:(float)a3
{
  -[TDColorProperty willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("blue"));
  self->_blue = a3;
  -[TDColorProperty didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("blue"));
}

- (float)alpha
{
  float alpha;

  -[TDColorProperty willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("alpha"));
  alpha = self->_alpha;
  -[TDColorProperty didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("alpha"));
  return alpha;
}

- (void)setAlpha:(float)a3
{
  -[TDColorProperty willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("alpha"));
  self->_alpha = a3;
  -[TDColorProperty didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("alpha"));
}

- (void)addToDictionary:(id)a3
{
  float v5;
  float v6;
  float v7;
  float v8;
  CGColorSpace *v9;
  CGColor *v10;
  CGFloat components[5];

  components[4] = *(CGFloat *)MEMORY[0x24BDAC8D0];
  -[TDColorProperty red](self, "red");
  components[0] = v5;
  -[TDColorProperty green](self, "green");
  components[1] = v6;
  -[TDColorProperty blue](self, "blue");
  components[2] = v7;
  -[TDColorProperty alpha](self, "alpha");
  components[3] = v8;
  v9 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF318]);
  v10 = CGColorCreate(v9, components);
  CGColorSpaceRelease(v9);
  objc_msgSend(a3, "setObject:forKey:", v10, -[TDProperty name](self, "name"));
  CGColorRelease(v10);
}

@end
