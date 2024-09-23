@implementation BKSDisplayProgressIndicatorProperties

- (id)_initWithStyle:(int64_t)a3 position:(CGPoint)a4
{
  CGFloat y;
  CGFloat x;
  id result;
  objc_super v8;

  y = a4.y;
  x = a4.x;
  v8.receiver = self;
  v8.super_class = (Class)BKSDisplayProgressIndicatorProperties;
  result = -[BKSDisplayProgressIndicatorProperties init](&v8, sel_init);
  if (result)
  {
    *((_QWORD *)result + 1) = a3;
    *((CGFloat *)result + 2) = x;
    *((CGFloat *)result + 3) = y;
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t style;
  id v4;
  id v5;

  style = self->_style;
  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", style, CFSTR("style"));
  BSValueWithPoint();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("position"));

}

- (BKSDisplayProgressIndicatorProperties)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  BKSDisplayProgressIndicatorProperties *v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("style"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("position"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    MEMORY[0x18D7683C0](v6);
  }
  else
  {
    v8 = 0.0;
    v7 = 0.0;
  }
  v9 = -[BKSDisplayProgressIndicatorProperties _initWithStyle:position:](self, "_initWithStyle:position:", v5, v7, v8);

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  int64_t style;
  id v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", self, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __49__BKSDisplayProgressIndicatorProperties_isEqual___block_invoke;
  v18[3] = &unk_1E1EA02D0;
  v7 = v4;
  v19 = v7;
  objc_msgSend(v5, "appendCGPoint:counterpart:", v18, self->_position.x, self->_position.y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  style = self->_style;
  v13 = v6;
  v14 = 3221225472;
  v15 = __49__BKSDisplayProgressIndicatorProperties_isEqual___block_invoke_2;
  v16 = &unk_1E1EA0CC0;
  v17 = v7;
  v10 = v7;
  objc_msgSend(v8, "appendInteger:counterpart:", style, &v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend(v11, "isEqual", v13, v14, v15, v16);

  return v6;
}

- (unint64_t)hash
{
  return self->_style + (unint64_t)self->_position.x + (unint64_t)self->_position.y;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[BKSDisplayProgressIndicatorProperties succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendInteger:withName:", self->_style, CFSTR("style"));
  v5 = (id)objc_msgSend(v3, "appendPoint:withName:", CFSTR("position"), self->_position.x, self->_position.y);
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[BKSDisplayProgressIndicatorProperties descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)style
{
  return self->_style;
}

- (CGPoint)position
{
  double x;
  double y;
  CGPoint result;

  x = self->_position.x;
  y = self->_position.y;
  result.y = y;
  result.x = x;
  return result;
}

uint64_t __49__BKSDisplayProgressIndicatorProperties_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "position");
}

uint64_t __49__BKSDisplayProgressIndicatorProperties_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "style");
}

+ (id)progressIndicatorWithStyle:(int64_t)a3 position:(CGPoint)a4
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "_initWithStyle:position:", a3, a4.x, a4.y);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
