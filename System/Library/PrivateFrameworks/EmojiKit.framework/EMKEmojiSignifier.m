@implementation EMKEmojiSignifier

- (EMKEmojiSignifier)initWithString:(id)a3
{
  id v4;
  NSString *v5;
  NSString *string;
  objc_super v8;

  v4 = a3;
  if (v4)
  {
    v8.receiver = self;
    v8.super_class = (Class)EMKEmojiSignifier;
    self = -[EMKEmojiSignifier init](&v8, sel_init);
    if (self)
    {
      v5 = (NSString *)objc_msgSend(v4, "copy");
      string = self->_string;
      self->_string = v5;

    }
  }

  return self;
}

- (NSString)string
{
  return self->_string;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)EMKEmojiSignifier;
  -[EMKEmojiSignifier description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@%@"), v4, self->_string);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_string, 0);
}

@end
