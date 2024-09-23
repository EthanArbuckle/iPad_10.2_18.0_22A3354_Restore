@implementation _AFOutputVoiceColorDescriptorMutation

- (_AFOutputVoiceColorDescriptorMutation)init
{
  return -[_AFOutputVoiceColorDescriptorMutation initWithBaseModel:](self, "initWithBaseModel:", 0);
}

- (_AFOutputVoiceColorDescriptorMutation)initWithBaseModel:(id)a3
{
  id v5;
  _AFOutputVoiceColorDescriptorMutation *v6;
  _AFOutputVoiceColorDescriptorMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFOutputVoiceColorDescriptorMutation;
  v6 = -[_AFOutputVoiceColorDescriptorMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_baseModel, a3);

  return v7;
}

- (void)setHexColor:(id)a3
{
  objc_storeStrong((id *)&self->_hexColor, a3);
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (void)setColorName:(id)a3
{
  objc_storeStrong((id *)&self->_colorName, a3);
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (void)setAlpha:(float)a3
{
  self->_alpha = a3;
  *(_BYTE *)&self->_mutationFlags |= 9u;
}

- (void)setLocalizedOutputVoiceColor:(id)a3
{
  objc_storeStrong((id *)&self->_localizedOutputVoiceColor, a3);
  *(_BYTE *)&self->_mutationFlags |= 0x11u;
}

- (void)setLocalizedOutputVoice:(id)a3
{
  objc_storeStrong((id *)&self->_localizedOutputVoice, a3);
  *(_BYTE *)&self->_mutationFlags |= 0x21u;
}

- (id)generate
{
  AFOutputVoiceColorDescriptor *baseModel;
  uint64_t v4;
  AFOutputVoiceColorDescriptor *v5;
  double v6;
  AFOutputVoiceColorDescriptor *v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  NSString *v11;
  float v12;
  float alpha;
  NSString *v14;
  NSString *v15;
  NSString *v16;
  NSString *v17;
  AFOutputVoiceColorDescriptor *v18;
  double v19;

  baseModel = self->_baseModel;
  if (!baseModel)
  {
    v5 = [AFOutputVoiceColorDescriptor alloc];
    *(float *)&v6 = self->_alpha;
    v4 = -[AFOutputVoiceColorDescriptor initWithHexColor:colorName:alpha:localizedOutputVoiceColor:localizedOutputVoice:](v5, "initWithHexColor:colorName:alpha:localizedOutputVoiceColor:localizedOutputVoice:", self->_hexColor, self->_colorName, self->_localizedOutputVoiceColor, self->_localizedOutputVoice, v6);
    goto LABEL_5;
  }
  if ((*(_BYTE *)&self->_mutationFlags & 1) == 0)
  {
    v4 = -[AFOutputVoiceColorDescriptor copy](baseModel, "copy");
LABEL_5:
    v7 = (AFOutputVoiceColorDescriptor *)v4;
    return v7;
  }
  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
  {
    v8 = self->_hexColor;
  }
  else
  {
    -[AFOutputVoiceColorDescriptor hexColor](baseModel, "hexColor");
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
  {
    v10 = self->_colorName;
  }
  else
  {
    -[AFOutputVoiceColorDescriptor colorName](self->_baseModel, "colorName");
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;
  if ((*(_BYTE *)&self->_mutationFlags & 8) != 0)
  {
    alpha = self->_alpha;
    if ((*(_BYTE *)&self->_mutationFlags & 0x10) != 0)
      goto LABEL_14;
LABEL_16:
    -[AFOutputVoiceColorDescriptor localizedOutputVoiceColor](self->_baseModel, "localizedOutputVoiceColor");
    v14 = (NSString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  -[AFOutputVoiceColorDescriptor alpha](self->_baseModel, "alpha");
  alpha = v12;
  if ((*(_BYTE *)&self->_mutationFlags & 0x10) == 0)
    goto LABEL_16;
LABEL_14:
  v14 = self->_localizedOutputVoiceColor;
LABEL_17:
  v15 = v14;
  if ((*(_BYTE *)&self->_mutationFlags & 0x20) != 0)
  {
    v16 = self->_localizedOutputVoice;
  }
  else
  {
    -[AFOutputVoiceColorDescriptor localizedOutputVoice](self->_baseModel, "localizedOutputVoice");
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  v17 = v16;
  v18 = [AFOutputVoiceColorDescriptor alloc];
  *(float *)&v19 = alpha;
  v7 = -[AFOutputVoiceColorDescriptor initWithHexColor:colorName:alpha:localizedOutputVoiceColor:localizedOutputVoice:](v18, "initWithHexColor:colorName:alpha:localizedOutputVoiceColor:localizedOutputVoice:", v9, v11, v15, v17, v19);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedOutputVoice, 0);
  objc_storeStrong((id *)&self->_localizedOutputVoiceColor, 0);
  objc_storeStrong((id *)&self->_colorName, 0);
  objc_storeStrong((id *)&self->_hexColor, 0);
  objc_storeStrong((id *)&self->_baseModel, 0);
}

@end
