@implementation _BlastDoorLPAudioProperties

- (id)copyWithZone:(_NSZone *)a3
{
  _BlastDoorLPAudioProperties *v4;
  void *v5;
  void *v6;
  _BlastDoorLPAudioProperties *v7;

  v4 = +[_BlastDoorLPAudioProperties allocWithZone:](_BlastDoorLPAudioProperties, "allocWithZone:", a3);
  if (v4)
  {
    -[_BlastDoorLPAudioProperties accessibilityText](self, "accessibilityText");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");
    -[_BlastDoorLPAudioProperties setAccessibilityText:](v4, "setAccessibilityText:", v6);

    v7 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  unint64_t v5;
  char v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_BlastDoorLPAudioProperties;
  if (-[_BlastDoorLPAudioProperties isEqual:](&v8, sel_isEqual_, v4))
    goto LABEL_5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = 0;
    goto LABEL_7;
  }
  v5 = v4[1];
  if (!(v5 | (unint64_t)self->_accessibilityText))
LABEL_5:
    v6 = 1;
  else
    v6 = objc_msgSend((id)v5, "isEqual:");
LABEL_7:

  return v6;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_accessibilityText, "hash");
}

- (NSString)accessibilityText
{
  return self->_accessibilityText;
}

- (void)setAccessibilityText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityText, 0);
}

@end
