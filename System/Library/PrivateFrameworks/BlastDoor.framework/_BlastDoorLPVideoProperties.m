@implementation _BlastDoorLPVideoProperties

- (id)copyWithZone:(_NSZone *)a3
{
  _BlastDoorLPVideoProperties *v4;
  void *v5;
  void *v6;
  _BlastDoorLPVideoProperties *v7;

  v4 = +[_BlastDoorLPVideoProperties allocWithZone:](_BlastDoorLPVideoProperties, "allocWithZone:", a3);
  if (v4)
  {
    -[_BlastDoorLPVideoProperties setHasAudio:](v4, "setHasAudio:", -[_BlastDoorLPVideoProperties hasAudio](self, "hasAudio"));
    -[_BlastDoorLPVideoProperties accessibilityText](self, "accessibilityText");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");
    -[_BlastDoorLPVideoProperties setAccessibilityText:](v4, "setAccessibilityText:", v6);

    v7 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;
  unint64_t *v6;
  unint64_t *v7;
  unint64_t v8;
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_BlastDoorLPVideoProperties;
  v5 = -[_BlastDoorLPVideoProperties isEqual:](&v10, sel_isEqual_, v4);
  if (!v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = (unint64_t *)v4;
      v7 = v6;
      if (*((unsigned __int8 *)v6 + 8) == self->_hasAudio)
      {
        v8 = v6[2];
        if (v8 | (unint64_t)self->_accessibilityText)
          objc_msgSend((id)v8, "isEqual:");
      }

    }
  }

  return v5;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_accessibilityText, "hash");
}

- (BOOL)hasAudio
{
  return self->_hasAudio;
}

- (void)setHasAudio:(BOOL)a3
{
  self->_hasAudio = a3;
}

- (NSString)accessibilityText
{
  return self->_accessibilityText;
}

- (void)setAccessibilityText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityText, 0);
}

@end
