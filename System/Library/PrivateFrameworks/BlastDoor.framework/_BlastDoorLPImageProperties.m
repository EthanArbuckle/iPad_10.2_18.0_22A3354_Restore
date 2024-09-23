@implementation _BlastDoorLPImageProperties

- (id)copyWithZone:(_NSZone *)a3
{
  _BlastDoorLPImageProperties *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BlastDoorLPImageProperties *v9;

  v4 = +[_BlastDoorLPImageProperties allocWithZone:](_BlastDoorLPImageProperties, "allocWithZone:", a3);
  if (v4)
  {
    -[_BlastDoorLPImageProperties accessibilityText](self, "accessibilityText");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");
    -[_BlastDoorLPImageProperties setAccessibilityText:](v4, "setAccessibilityText:", v6);

    -[_BlastDoorLPImageProperties setType:](v4, "setType:", -[_BlastDoorLPImageProperties type](self, "type"));
    -[_BlastDoorLPImageProperties overlaidTextColor](self, "overlaidTextColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPImageProperties setOverlaidTextColor:](v4, "setOverlaidTextColor:", v7);

    -[_BlastDoorLPImageProperties dominantColor](self, "dominantColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPImageProperties setDominantColor:](v4, "setDominantColor:", v8);

    v9 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  _QWORD *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  objc_super v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_BlastDoorLPImageProperties;
  if (-[_BlastDoorLPImageProperties isEqual:](&v11, sel_isEqual_, v4))
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v4;
      v7 = v6[1];
      if ((!(v7 | (unint64_t)self->_accessibilityText) || objc_msgSend((id)v7, "isEqual:"))
        && v6[2] == self->_type
        && ((v8 = v6[3], !(v8 | (unint64_t)self->_overlaidTextColor))
         || objc_msgSend((id)v8, "isEqual:")))
      {
        v9 = v6[4];
        if (v9 | (unint64_t)self->_dominantColor)
          v5 = objc_msgSend((id)v9, "isEqual:");
        else
          v5 = 1;
      }
      else
      {
        v5 = 0;
      }

    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;

  v3 = -[NSString hash](self->_accessibilityText, "hash");
  v4 = -[_BlastDoorLPPlatformColor hash](self->_overlaidTextColor, "hash") ^ v3;
  return v4 ^ -[_BlastDoorLPPlatformColor hash](self->_dominantColor, "hash");
}

- (NSString)accessibilityText
{
  return self->_accessibilityText;
}

- (void)setAccessibilityText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (_BlastDoorLPPlatformColor)overlaidTextColor
{
  return self->_overlaidTextColor;
}

- (void)setOverlaidTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_overlaidTextColor, a3);
}

- (_BlastDoorLPPlatformColor)dominantColor
{
  return self->_dominantColor;
}

- (void)setDominantColor:(id)a3
{
  objc_storeStrong((id *)&self->_dominantColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dominantColor, 0);
  objc_storeStrong((id *)&self->_overlaidTextColor, 0);
  objc_storeStrong((id *)&self->_accessibilityText, 0);
}

@end
