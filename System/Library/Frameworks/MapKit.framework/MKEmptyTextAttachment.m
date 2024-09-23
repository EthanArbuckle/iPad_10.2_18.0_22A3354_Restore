@implementation MKEmptyTextAttachment

- (MKEmptyTextAttachment)initWithWidth:(double)a3
{
  MKEmptyTextAttachment *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MKEmptyTextAttachment;
  result = -[MKEmptyTextAttachment initWithData:ofType:](&v5, sel_initWithData_ofType_, 0, 0);
  if (result)
    result->_width = a3;
  return result;
}

- (id)imageForBounds:(CGRect)a3 textContainer:(id)a4 characterIndex:(unint64_t)a5
{
  return 0;
}

- (CGRect)attachmentBoundsForTextContainer:(id)a3 proposedLineFragment:(CGRect)result glyphPosition:(CGPoint)a5 characterIndex:(unint64_t)a6
{
  double width;
  double v7;
  double v8;

  width = self->_width;
  v7 = 0.0;
  v8 = 0.0;
  result.size.width = width;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

@end
