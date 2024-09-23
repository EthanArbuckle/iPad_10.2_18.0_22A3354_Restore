@implementation MADMultiModalInputTextSegment

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADMultiModalInputTextSegment)initWithText:(id)a3
{
  id v5;
  MADMultiModalInputTextSegment *v6;
  MADMultiModalInputTextSegment *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MADMultiModalInputTextSegment;
  v6 = -[MADMultiModalInputTextSegment init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_text, a3);

  return v7;
}

- (MADMultiModalInputTextSegment)initWithCoder:(id)a3
{
  id v4;
  MADMultiModalInputTextSegment *v5;
  uint64_t v6;
  NSString *text;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MADMultiModalInputTextSegment;
  v5 = -[MADMultiModalInputSegment initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Text"));
    v6 = objc_claimAutoreleasedReturnValue();
    text = v5->_text;
    v5->_text = (NSString *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MADMultiModalInputTextSegment;
  v4 = a3;
  -[MADMultiModalInputSegment encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_text, CFSTR("Text"), v5.receiver, v5.super_class);

}

- (int64_t)type
{
  return 1;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p, "), v5, self);

  objc_msgSend(v3, "appendFormat:", CFSTR("text: %@>"), self->_text);
  return v3;
}

- (NSString)text
{
  return self->_text;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
}

@end
