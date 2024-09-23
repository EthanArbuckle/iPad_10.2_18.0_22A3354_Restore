@implementation AFOutputVoiceColorDescriptor

- (AFOutputVoiceColorDescriptor)initWithHexColor:(id)a3 colorName:(id)a4 alpha:(float)a5 localizedOutputVoiceColor:(id)a6 localizedOutputVoice:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  AFOutputVoiceColorDescriptor *v16;
  uint64_t v17;
  NSString *hexColor;
  uint64_t v19;
  NSString *colorName;
  uint64_t v21;
  NSString *localizedOutputVoiceColor;
  uint64_t v23;
  NSString *localizedOutputVoice;
  objc_super v26;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v26.receiver = self;
  v26.super_class = (Class)AFOutputVoiceColorDescriptor;
  v16 = -[AFOutputVoiceColorDescriptor init](&v26, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v12, "copy");
    hexColor = v16->_hexColor;
    v16->_hexColor = (NSString *)v17;

    v19 = objc_msgSend(v13, "copy");
    colorName = v16->_colorName;
    v16->_colorName = (NSString *)v19;

    v16->_alpha = a5;
    v21 = objc_msgSend(v14, "copy");
    localizedOutputVoiceColor = v16->_localizedOutputVoiceColor;
    v16->_localizedOutputVoiceColor = (NSString *)v21;

    v23 = objc_msgSend(v15, "copy");
    localizedOutputVoice = v16->_localizedOutputVoice;
    v16->_localizedOutputVoice = (NSString *)v23;

  }
  return v16;
}

- (id)description
{
  return -[AFOutputVoiceColorDescriptor _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;
  double v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  objc_super v26;
  _QWORD v27[6];

  v27[5] = *MEMORY[0x1E0C80C00];
  v23 = objc_alloc(MEMORY[0x1E0CB3940]);
  v26.receiver = self;
  v26.super_class = (Class)AFOutputVoiceColorDescriptor;
  -[AFOutputVoiceColorDescriptor description](&v26, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[NSString description](self->_hexColor, "description");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("hexColor = %@"), v25);
  v27[0] = v24;
  v6 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[NSString description](self->_colorName, "description");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("colorName = %@"), v22);
  v27[1] = v21;
  v7 = objc_alloc(MEMORY[0x1E0CB3940]);
  *(float *)&v8 = self->_alpha;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithFormat:", CFSTR("alpha = %@"), v9);
  v27[2] = v10;
  v11 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[NSString description](self->_localizedOutputVoiceColor, "description");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithFormat:", CFSTR("localizedOutputVoiceColor = %@"), v12);
  v27[3] = v13;
  v14 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[NSString description](self->_localizedOutputVoice, "description");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithFormat:", CFSTR("localizedOutputVoice = %@"), v15);
  v27[4] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "componentsJoinedByString:", CFSTR(", "));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v23, "initWithFormat:", CFSTR("%@ {%@}"), v4, v18);

  return v19;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  double v5;
  void *v6;
  uint64_t v7;
  NSUInteger v8;
  NSUInteger v9;

  v3 = -[NSString hash](self->_hexColor, "hash");
  v4 = -[NSString hash](self->_colorName, "hash") ^ v3;
  *(float *)&v5 = self->_alpha;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  v8 = v4 ^ -[NSString hash](self->_localizedOutputVoiceColor, "hash") ^ v7;
  v9 = v8 ^ -[NSString hash](self->_localizedOutputVoice, "hash");

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  AFOutputVoiceColorDescriptor *v4;
  AFOutputVoiceColorDescriptor *v5;
  float alpha;
  float v7;
  BOOL v8;
  NSString *v9;
  NSString *hexColor;
  NSString *v11;
  NSString *colorName;
  NSString *v13;
  NSString *localizedOutputVoiceColor;
  NSString *v15;
  NSString *localizedOutputVoice;

  v4 = (AFOutputVoiceColorDescriptor *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      alpha = self->_alpha;
      -[AFOutputVoiceColorDescriptor alpha](v5, "alpha");
      if (alpha == v7)
      {
        -[AFOutputVoiceColorDescriptor hexColor](v5, "hexColor");
        v9 = (NSString *)objc_claimAutoreleasedReturnValue();
        hexColor = self->_hexColor;
        if (hexColor == v9 || -[NSString isEqual:](hexColor, "isEqual:", v9))
        {
          -[AFOutputVoiceColorDescriptor colorName](v5, "colorName");
          v11 = (NSString *)objc_claimAutoreleasedReturnValue();
          colorName = self->_colorName;
          if (colorName == v11 || -[NSString isEqual:](colorName, "isEqual:", v11))
          {
            -[AFOutputVoiceColorDescriptor localizedOutputVoiceColor](v5, "localizedOutputVoiceColor");
            v13 = (NSString *)objc_claimAutoreleasedReturnValue();
            localizedOutputVoiceColor = self->_localizedOutputVoiceColor;
            if (localizedOutputVoiceColor == v13
              || -[NSString isEqual:](localizedOutputVoiceColor, "isEqual:", v13))
            {
              -[AFOutputVoiceColorDescriptor localizedOutputVoice](v5, "localizedOutputVoice");
              v15 = (NSString *)objc_claimAutoreleasedReturnValue();
              localizedOutputVoice = self->_localizedOutputVoice;
              v8 = localizedOutputVoice == v15
                || -[NSString isEqual:](localizedOutputVoice, "isEqual:", v15);

            }
            else
            {
              v8 = 0;
            }

          }
          else
          {
            v8 = 0;
          }

        }
        else
        {
          v8 = 0;
        }

      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (AFOutputVoiceColorDescriptor)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  void *v10;
  void *v11;
  double v12;
  AFOutputVoiceColorDescriptor *v13;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFOutputVoiceColorDescriptor::hexColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFOutputVoiceColorDescriptor::colorName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFOutputVoiceColorDescriptor::alpha"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "floatValue");
  v9 = v8;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFOutputVoiceColorDescriptor::localizedOutputVoiceColor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFOutputVoiceColorDescriptor::localizedOutputVoice"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v12) = v9;
  v13 = -[AFOutputVoiceColorDescriptor initWithHexColor:colorName:alpha:localizedOutputVoiceColor:localizedOutputVoice:](self, "initWithHexColor:colorName:alpha:localizedOutputVoiceColor:localizedOutputVoice:", v5, v6, v10, v11, v12);

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *hexColor;
  double v5;
  void *v6;
  id v7;

  hexColor = self->_hexColor;
  v7 = a3;
  objc_msgSend(v7, "encodeObject:forKey:", hexColor, CFSTR("AFOutputVoiceColorDescriptor::hexColor"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_colorName, CFSTR("AFOutputVoiceColorDescriptor::colorName"));
  *(float *)&v5 = self->_alpha;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("AFOutputVoiceColorDescriptor::alpha"));

  objc_msgSend(v7, "encodeObject:forKey:", self->_localizedOutputVoiceColor, CFSTR("AFOutputVoiceColorDescriptor::localizedOutputVoiceColor"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_localizedOutputVoice, CFSTR("AFOutputVoiceColorDescriptor::localizedOutputVoice"));

}

- (NSString)hexColor
{
  return self->_hexColor;
}

- (NSString)colorName
{
  return self->_colorName;
}

- (float)alpha
{
  return self->_alpha;
}

- (NSString)localizedOutputVoiceColor
{
  return self->_localizedOutputVoiceColor;
}

- (NSString)localizedOutputVoice
{
  return self->_localizedOutputVoice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedOutputVoice, 0);
  objc_storeStrong((id *)&self->_localizedOutputVoiceColor, 0);
  objc_storeStrong((id *)&self->_colorName, 0);
  objc_storeStrong((id *)&self->_hexColor, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  void (**v4)(id, _AFOutputVoiceColorDescriptorMutation *);
  _AFOutputVoiceColorDescriptorMutation *v5;
  void *v6;

  v4 = (void (**)(id, _AFOutputVoiceColorDescriptorMutation *))a3;
  if (v4)
  {
    v5 = -[_AFOutputVoiceColorDescriptorMutation initWithBaseModel:]([_AFOutputVoiceColorDescriptorMutation alloc], "initWithBaseModel:", self);
    v4[2](v4, v5);
    -[_AFOutputVoiceColorDescriptorMutation generate](v5, "generate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)-[AFOutputVoiceColorDescriptor copy](self, "copy");
  }

  return v6;
}

+ (id)newWithBuilder:(id)a3
{
  void (**v3)(id, _AFOutputVoiceColorDescriptorMutation *);
  _AFOutputVoiceColorDescriptorMutation *v4;
  void *v5;

  v3 = (void (**)(id, _AFOutputVoiceColorDescriptorMutation *))a3;
  v4 = objc_alloc_init(_AFOutputVoiceColorDescriptorMutation);
  if (v3)
    v3[2](v3, v4);
  -[_AFOutputVoiceColorDescriptorMutation generate](v4, "generate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
