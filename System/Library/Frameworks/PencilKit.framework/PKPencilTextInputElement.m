@implementation PKPencilTextInputElement

- (PKPencilTextInputElement)initWithIdentifier:(id)a3 frame:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v9;
  PKPencilTextInputElement *v10;
  uint64_t v11;
  NSObject *identifier;
  objc_super v14;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKPencilTextInputElement;
  v10 = -[PKPencilTextInputElement init](&v14, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v9, "copyWithZone:", 0);
    identifier = v10->_identifier;
    v10->_identifier = v11;

    v10->_frame.origin.x = x;
    v10->_frame.origin.y = y;
    v10->_frame.size.width = width;
    v10->_frame.size.height = height;
  }

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;
  CGRect v9;

  v8.receiver = self;
  v8.super_class = (Class)PKPencilTextInputElement;
  -[PKPencilTextInputElement description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPencilTextInputElement identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPencilTextInputElement frame](self, "frame");
  NSStringFromCGRect(v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" ID: %@, frame: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSObject)identifier
{
  return self->_identifier;
}

- (CGRect)frame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_frame.origin.x;
  y = self->_frame.origin.y;
  width = self->_frame.size.width;
  height = self->_frame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
