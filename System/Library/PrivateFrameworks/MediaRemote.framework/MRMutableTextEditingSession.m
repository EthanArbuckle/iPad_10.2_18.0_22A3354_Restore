@implementation MRMutableTextEditingSession

- (void)setText:(id)a3
{
  NSString *v4;
  NSString *text;

  if (self->super._text != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    text = self->super._text;
    self->super._text = v4;

  }
}

- (void)setEditing:(BOOL)a3
{
  self->super._editing = a3;
}

- (void)setAttributes:(id)a3
{
  MRTextEditingAttributes *v5;
  MRTextEditingAttributes **p_attributes;
  MRTextEditingAttributes *attributes;
  MRTextEditingAttributes *v8;

  v5 = (MRTextEditingAttributes *)a3;
  attributes = self->super._attributes;
  p_attributes = &self->super._attributes;
  if (attributes != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_attributes, a3);
    v5 = v8;
  }

}

@end
