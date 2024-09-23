@implementation IMReplySuggestion

- (IMReplySuggestion)initWithType:(int64_t)a3 text:(id)a4
{
  id v6;
  IMReplySuggestion *v7;
  IMReplySuggestion *v8;
  uint64_t v9;
  NSString *text;
  IMReplySuggestion *v11;
  objc_super v13;

  v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)IMReplySuggestion;
  v7 = -[IMReplySuggestion init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_type = a3;
    v9 = objc_msgSend(v6, "copy");
    text = v8->_text;
    v8->_text = (NSString *)v9;

    objc_storeStrong((id *)&v8->_stringRepresentation, v8->_text);
    v11 = v8;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  IMReplySuggestion *v4;
  void *v5;
  void *v6;

  v4 = -[IMReplySuggestion initWithType:text:]([IMReplySuggestion alloc], "initWithType:text:", self->_type, self->_text);
  v5 = (void *)-[NSString copy](self->_attribution, "copy");
  -[IMReplySuggestion setAttribution:](v4, "setAttribution:", v5);

  v6 = (void *)-[NSString copy](self->_stringRepresentation, "copy");
  -[IMReplySuggestion setStringRepresentation:](v4, "setStringRepresentation:", v6);

  -[IMReplySuggestion setTintColor:](v4, "setTintColor:", self->_tintColor);
  return v4;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)text
{
  return self->_text;
}

- (NSString)stringRepresentation
{
  return self->_stringRepresentation;
}

- (void)setStringRepresentation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)attribution
{
  return self->_attribution;
}

- (void)setAttribution:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int64_t)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(int64_t)a3
{
  self->_tintColor = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attribution, 0);
  objc_storeStrong((id *)&self->_stringRepresentation, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
