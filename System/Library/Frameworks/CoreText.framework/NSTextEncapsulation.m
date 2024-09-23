@implementation NSTextEncapsulation

- (NSTextEncapsulation)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSTextEncapsulation;
  return -[NSTextEncapsulation init](&v3, sel_init);
}

- (NSTextEncapsulation)initWithShape:(unint64_t)a3
{
  NSTextEncapsulation *v4;
  NSTextEncapsulation *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NSTextEncapsulation;
  v4 = -[NSTextEncapsulation init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[NSTextEncapsulation setShape:](v4, "setShape:", a3);
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSTextEncapsulation *v4;

  v4 = -[NSTextEncapsulation initWithShape:](+[NSTextEncapsulation allocWithZone:](NSTextEncapsulation, "allocWithZone:", a3), "initWithShape:", self->shape);
  -[NSTextEncapsulation setScale:](v4, "setScale:", self->scale);
  -[NSTextEncapsulation setPlatterSize:](v4, "setPlatterSize:", self->platterSize);
  -[NSTextEncapsulation setStyle:](v4, "setStyle:", self->style);
  -[NSTextEncapsulation setLineWeight:](v4, "setLineWeight:", self->lineWeight);
  -[NSTextEncapsulation setMinimumWidth:](v4, "setMinimumWidth:", self->minimumWidth);
  -[NSTextEncapsulation setColor:](v4, "setColor:", self->color);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSTextEncapsulation.mm"), 59, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[coder allowsKeyedCoding]"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->scale, CFSTR("Scale"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->platterSize, CFSTR("PlatterSize"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->shape, CFSTR("Shape"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->style, CFSTR("Style"));
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("LineWeight"), self->lineWeight);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("MinimumWidth"), self->minimumWidth);
  objc_msgSend(a3, "encodeObject:forKey:", self->color, CFSTR("Color"));
}

- (NSTextEncapsulation)initWithCoder:(id)a3
{
  NSTextEncapsulation *v6;
  objc_super v8;

  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSTextEncapsulation.mm"), 71, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[coder allowsKeyedCoding]"));
  if (_MergedGlobals_34 != -1)
    dispatch_once(&_MergedGlobals_34, &__block_literal_global_9);
  v8.receiver = self;
  v8.super_class = (Class)NSTextEncapsulation;
  v6 = -[NSTextEncapsulation init](&v8, sel_init);
  if (v6)
  {
    -[NSTextEncapsulation setScale:](v6, "setScale:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("Scale")));
    -[NSTextEncapsulation setPlatterSize:](v6, "setPlatterSize:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("PlatterSize")));
    -[NSTextEncapsulation setShape:](v6, "setShape:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("Shape")));
    -[NSTextEncapsulation setStyle:](v6, "setStyle:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("Style")));
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("LineWeight"));
    -[NSTextEncapsulation setLineWeight:](v6, "setLineWeight:");
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("MinimumWidth"));
    -[NSTextEncapsulation setMinimumWidth:](v6, "setMinimumWidth:");
    -[NSTextEncapsulation setColor:](v6, "setColor:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", qword_1ECDE7E20, CFSTR("Color")));
  }
  return v6;
}

Class __37__NSTextEncapsulation_initWithCoder___block_invoke()
{
  Class result;

  result = NSClassFromString(CFSTR("UIColor"));
  qword_1ECDE7E20 = (uint64_t)result;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSTextEncapsulation;
  -[NSTextEncapsulation dealloc](&v3, sel_dealloc);
}

- (unint64_t)scale
{
  return self->scale;
}

- (void)setScale:(unint64_t)a3
{
  self->scale = a3;
}

- (unint64_t)platterSize
{
  return self->platterSize;
}

- (void)setPlatterSize:(unint64_t)a3
{
  self->platterSize = a3;
}

- (unint64_t)shape
{
  return self->shape;
}

- (void)setShape:(unint64_t)a3
{
  self->shape = a3;
}

- (unint64_t)style
{
  return self->style;
}

- (void)setStyle:(unint64_t)a3
{
  self->style = a3;
}

- (double)lineWeight
{
  return self->lineWeight;
}

- (void)setLineWeight:(double)a3
{
  self->lineWeight = a3;
}

- (double)minimumWidth
{
  return self->minimumWidth;
}

- (void)setMinimumWidth:(double)a3
{
  self->minimumWidth = a3;
}

- (UIColor)color
{
  return (UIColor *)objc_getProperty(self, a2, 56, 1);
}

- (void)setColor:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

@end
