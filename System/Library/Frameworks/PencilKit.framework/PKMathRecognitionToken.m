@implementation PKMathRecognitionToken

- (PKMathRecognitionToken)init
{
  PKMathRecognitionToken *v2;
  uint64_t v3;
  NSUUID *uuid;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKMathRecognitionToken;
  v2 = -[PKMathRecognitionToken init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v3 = objc_claimAutoreleasedReturnValue();
    uuid = v2->_uuid;
    v2->_uuid = (NSUUID *)v3;

    -[PKMathRecognitionToken setType:](v2, "setType:", 0);
    -[PKMathRecognitionToken setErrors:](v2, "setErrors:", MEMORY[0x1E0C9AA60]);
    -[PKMathRecognitionToken setCharacterRange:](v2, "setCharacterRange:", 0x7FFFFFFFFFFFFFFFLL, 0);
    -[PKMathRecognitionToken setColumnIndex:](v2, "setColumnIndex:", 0x7FFFFFFFFFFFFFFFLL);
  }
  return v2;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;
  NSRange v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)PKMathRecognitionToken;
  -[PKMathRecognitionToken description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKMathRecognitionToken text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11.location = -[PKMathRecognitionToken characterRange](self, "characterRange");
  NSStringFromRange(v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKMathRecognitionToken errors](self, "errors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - text: %@, range: %@, errors: %lu"), v4, v5, v6, objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (PKMathRecognitionItem)item
{
  return (PKMathRecognitionItem *)objc_loadWeakRetained((id *)&self->_item);
}

- (void)setItem:(id)a3
{
  objc_storeWeak((id *)&self->_item, a3);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (_NSRange)characterRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_characterRange.length;
  location = self->_characterRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setCharacterRange:(_NSRange)a3
{
  self->_characterRange = a3;
}

- (CGRect)bounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_bounds.origin.x;
  y = self->_bounds.origin.y;
  width = self->_bounds.size.width;
  height = self->_bounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  self->_bounds = a3;
}

- (int64_t)columnIndex
{
  return self->_columnIndex;
}

- (void)setColumnIndex:(int64_t)a3
{
  self->_columnIndex = a3;
}

- (NSArray)errors
{
  return self->_errors;
}

- (void)setErrors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)alternatives
{
  return self->_alternatives;
}

- (void)setAlternatives:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)renderableAlternatives
{
  return self->_renderableAlternatives;
}

- (void)setRenderableAlternatives:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderableAlternatives, 0);
  objc_storeStrong((id *)&self->_alternatives, 0);
  objc_storeStrong((id *)&self->_errors, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_destroyWeak((id *)&self->_item);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
