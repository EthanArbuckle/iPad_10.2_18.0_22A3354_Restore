@implementation AXMVisionFeatureRecognizedText

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXMVisionFeatureRecognizedText)initWithRecognizedText:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  AXMVisionFeatureRecognizedText *v9;
  AXMVisionFeatureRecognizedText *v10;
  objc_super v12;

  length = a4.length;
  location = a4.location;
  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AXMVisionFeatureRecognizedText;
  v9 = -[AXMVisionFeatureRecognizedText init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_text, a3);
    v10->_textRange.location = location;
    v10->_textRange.length = length;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  VNRecognizedText *text;
  uint64_t v5;
  id v6;
  id v7;

  text = self->_text;
  v5 = AXMVisionFeatureCodingKeyTextRecognition;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", text, v5);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", self->_textRange.location, self->_textRange.length);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v7, AXMVisionFeatureCodingKeyRange);

}

- (AXMVisionFeatureRecognizedText)initWithCoder:(id)a3
{
  id v4;
  AXMVisionFeatureRecognizedText *v5;
  uint64_t v6;
  VNRecognizedText *text;
  void *v8;
  NSUInteger v9;

  v4 = a3;
  v5 = -[AXMVisionFeatureRecognizedText init](self, "init");
  if (v5 && getVNRecognizedTextClass())
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", getVNRecognizedTextClass(), AXMVisionFeatureCodingKeyTextRecognition);
    v6 = objc_claimAutoreleasedReturnValue();
    text = v5->_text;
    v5->_text = (VNRecognizedText *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), AXMVisionFeatureCodingKeyRange);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_textRange.location = objc_msgSend(v8, "rangeValue");
    v5->_textRange.length = v9;

  }
  return v5;
}

- (VNRecognizedText)text
{
  return self->_text;
}

- (_NSRange)textRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_textRange.length;
  location = self->_textRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
}

@end
