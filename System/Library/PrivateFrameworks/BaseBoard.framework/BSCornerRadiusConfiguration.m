@implementation BSCornerRadiusConfiguration

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  double topLeft;
  uint64_t v8;
  id v9;
  id v10;
  double bottomLeft;
  id v12;
  id v13;
  double bottomRight;
  id v15;
  id v16;
  double topRight;
  id v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t);
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (self)
    {
      +[BSEqualsBuilder builderWithObject:ofExpectedClass:](BSEqualsBuilder, "builderWithObject:ofExpectedClass:", v5, objc_opt_class());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      topLeft = self->_topLeft;
      v8 = MEMORY[0x1E0C809B0];
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __66__BSCornerRadiusConfiguration_isEqualToCornerRadiusConfiguration___block_invoke;
      v29[3] = &unk_1E1EBF0F8;
      v9 = v5;
      v30 = v9;
      v10 = (id)objc_msgSend(v6, "appendCGFloat:counterpart:", v29, topLeft);
      bottomLeft = self->_bottomLeft;
      v27[0] = v8;
      v27[1] = 3221225472;
      v27[2] = __66__BSCornerRadiusConfiguration_isEqualToCornerRadiusConfiguration___block_invoke_2;
      v27[3] = &unk_1E1EBF0F8;
      v12 = v9;
      v28 = v12;
      v13 = (id)objc_msgSend(v6, "appendCGFloat:counterpart:", v27, bottomLeft);
      bottomRight = self->_bottomRight;
      v25[0] = v8;
      v25[1] = 3221225472;
      v25[2] = __66__BSCornerRadiusConfiguration_isEqualToCornerRadiusConfiguration___block_invoke_3;
      v25[3] = &unk_1E1EBF0F8;
      v15 = v12;
      v26 = v15;
      v16 = (id)objc_msgSend(v6, "appendCGFloat:counterpart:", v25, bottomRight);
      topRight = self->_topRight;
      v20 = v8;
      v21 = 3221225472;
      v22 = __66__BSCornerRadiusConfiguration_isEqualToCornerRadiusConfiguration___block_invoke_4;
      v23 = &unk_1E1EBF0F8;
      v24 = v15;
      v18 = (id)objc_msgSend(v6, "appendCGFloat:counterpart:", &v20, topRight);
      LOBYTE(self) = objc_msgSend(v6, "isEqual", v20, v21, v22, v23);

    }
  }
  else
  {
    LOBYTE(self) = 0;
  }

  return (char)self;
}

- (double)topLeft
{
  return self->_topLeft;
}

- (double)bottomRight
{
  return self->_bottomRight;
}

- (double)topRight
{
  return self->_topRight;
}

- (double)bottomLeft
{
  return self->_bottomLeft;
}

uint64_t __66__BSCornerRadiusConfiguration_isEqualToCornerRadiusConfiguration___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "topLeft");
}

uint64_t __66__BSCornerRadiusConfiguration_isEqualToCornerRadiusConfiguration___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "topRight");
}

uint64_t __66__BSCornerRadiusConfiguration_isEqualToCornerRadiusConfiguration___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "bottomRight");
}

uint64_t __66__BSCornerRadiusConfiguration_isEqualToCornerRadiusConfiguration___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "bottomLeft");
}

- (BSCornerRadiusConfiguration)initWithTopLeft:(double)a3 bottomLeft:(double)a4 bottomRight:(double)a5 topRight:(double)a6
{
  BSCornerRadiusConfiguration *result;

  result = -[BSCornerRadiusConfiguration init](self, "init");
  if (result)
  {
    result->_topLeft = a3;
    result->_bottomLeft = a4;
    result->_bottomRight = a5;
    result->_topRight = a6;
  }
  return result;
}

- (BSCornerRadiusConfiguration)initWithXPCDictionary:(id)a3
{
  id v4;
  BSCornerRadiusConfiguration *v5;

  v4 = a3;
  v5 = -[BSCornerRadiusConfiguration init](self, "init");
  if (v5)
  {
    v5->_topLeft = BSDeserializeDoubleFromXPCDictionaryWithKey(v4, "BSCornerRadiusConfigurationTopLeftKey");
    v5->_bottomLeft = BSDeserializeDoubleFromXPCDictionaryWithKey(v4, "BSCornerRadiusConfigurationBottomLeftKey");
    v5->_bottomRight = BSDeserializeDoubleFromXPCDictionaryWithKey(v4, "BSCornerRadiusConfigurationBottomRightKey");
    v5->_topRight = BSDeserializeDoubleFromXPCDictionaryWithKey(v4, "BSCornerRadiusConfigurationTopRightKey");
  }

  return v5;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v4;

  v4 = a3;
  BSSerializeDoubleToXPCDictionaryWithKey(v4, "BSCornerRadiusConfigurationTopLeftKey", self->_topLeft);
  BSSerializeDoubleToXPCDictionaryWithKey(v4, "BSCornerRadiusConfigurationBottomLeftKey", self->_bottomLeft);
  BSSerializeDoubleToXPCDictionaryWithKey(v4, "BSCornerRadiusConfigurationBottomRightKey", self->_bottomRight);
  BSSerializeDoubleToXPCDictionaryWithKey(v4, "BSCornerRadiusConfigurationTopRightKey", self->_topRight);

}

- (BSCornerRadiusConfiguration)initWithCornerRadius:(double)a3
{
  BSCornerRadiusConfiguration *result;

  result = -[BSCornerRadiusConfiguration init](self, "init");
  if (result)
  {
    result->_topLeft = a3;
    result->_bottomLeft = a3;
    result->_bottomRight = a3;
    result->_topRight = a3;
  }
  return result;
}

- (BOOL)isCongruent
{
  double topLeft;

  topLeft = self->_topLeft;
  return topLeft == self->_bottomLeft && topLeft == self->_bottomRight && topLeft == self->_topRight;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: (topLeft: %g, bottom left: %g, bottom right: %g, top right: %g)"), v5, *(_QWORD *)&self->_topLeft, *(_QWORD *)&self->_bottomLeft, *(_QWORD *)&self->_bottomRight, *(_QWORD *)&self->_topRight);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;

  +[BSHashBuilder builder](BSHashBuilder, "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendCGFloat:", self->_topLeft);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendCGFloat:", self->_bottomLeft);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendCGFloat:", self->_bottomRight);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendCGFloat:", self->_topRight);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");

  return v8;
}

@end
