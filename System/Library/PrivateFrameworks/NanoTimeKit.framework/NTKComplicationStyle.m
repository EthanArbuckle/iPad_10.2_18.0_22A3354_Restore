@implementation NTKComplicationStyle

- (NTKComplicationStyle)init
{
  NTKComplicationStyle *v2;
  uint64_t v3;
  UIColor *circularPlatterColor;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NTKComplicationStyle;
  v2 = -[NTKComplicationStyle init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v3 = objc_claimAutoreleasedReturnValue();
    circularPlatterColor = v2->_circularPlatterColor;
    v2->_circularPlatterColor = (UIColor *)v3;

    v2->_fontStyle = 0;
  }
  return v2;
}

- (id)_initWithStyle:(id)a3
{
  id v4;
  NTKComplicationStyle *v5;
  uint64_t v6;
  UIColor *circularPlatterColor;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NTKComplicationStyle;
  v5 = -[NTKComplicationStyle init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(*((id *)v4 + 1), "copy");
    circularPlatterColor = v5->_circularPlatterColor;
    v5->_circularPlatterColor = (UIColor *)v6;

    v5->_fontStyle = *((_QWORD *)v4 + 2);
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[NTKComplicationStyle _initWithStyle:](+[NTKComplicationStyle allocWithZone:](NTKComplicationStyle, "allocWithZone:", a3), "_initWithStyle:", self);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[NTKComplicationStyle _initWithStyle:](+[NTKMutableComplicationStyle allocWithZone:](NTKMutableComplicationStyle, "allocWithZone:", a3), "_initWithStyle:", self);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  UIColor *circularPlatterColor;
  uint64_t v7;
  id v8;
  id v9;
  int64_t fontStyle;
  id v11;
  id v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  circularPlatterColor = self->_circularPlatterColor;
  v7 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __32__NTKComplicationStyle_isEqual___block_invoke;
  v19[3] = &unk_1E6BD0358;
  v8 = v4;
  v20 = v8;
  v9 = (id)objc_msgSend(v5, "appendObject:counterpart:", circularPlatterColor, v19);
  fontStyle = self->_fontStyle;
  v14 = v7;
  v15 = 3221225472;
  v16 = __32__NTKComplicationStyle_isEqual___block_invoke_2;
  v17 = &unk_1E6BD0380;
  v18 = v8;
  v11 = v8;
  v12 = (id)objc_msgSend(v5, "appendInteger:counterpart:", fontStyle, &v14);
  LOBYTE(fontStyle) = objc_msgSend(v5, "isEqual", v14, v15, v16, v17);

  return fontStyle;
}

id __32__NTKComplicationStyle_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 8);
}

uint64_t __32__NTKComplicationStyle_isEqual___block_invoke_2(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:", self->_circularPlatterColor);
  v5 = (id)objc_msgSend(v3, "appendInteger:", self->_fontStyle);
  v6 = objc_msgSend(v3, "hash");

  return v6;
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_circularPlatterColor, CFSTR("circularPlatterColor"));
  v5 = (id)objc_msgSend(v3, "appendInteger:withName:", self->_fontStyle, CFSTR("fontStyle"));
  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NTKComplicationStyle)initWithCoder:(id)a3
{
  id v4;
  NTKComplicationStyle *v5;
  uint64_t v6;
  UIColor *circularPlatterColor;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NTKComplicationStyle;
  v5 = -[NTKComplicationStyle init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("circularPlatterColor"));
    v6 = objc_claimAutoreleasedReturnValue();
    circularPlatterColor = v5->_circularPlatterColor;
    v5->_circularPlatterColor = (UIColor *)v6;

    v5->_fontStyle = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("fontStyle"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  UIColor *circularPlatterColor;
  id v5;

  circularPlatterColor = self->_circularPlatterColor;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", circularPlatterColor, CFSTR("circularPlatterColor"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_fontStyle, CFSTR("fontStyle"));

}

- (UIColor)circularPlatterColor
{
  return self->_circularPlatterColor;
}

- (int64_t)fontStyle
{
  return self->_fontStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_circularPlatterColor, 0);
}

@end
