@implementation CHChatBubbleRecognitionResult

- (CHChatBubbleRecognitionResult)initWithString:(id)a3 score:(double)a4 rotation:(double)a5 center:(CGPoint)a6 size:(CGSize)a7 stemLocation:(CGPoint)a8 stemWidth:(double)a9
{
  CGFloat y;
  CGFloat x;
  CHChatBubbleRecognitionResult *result;
  objc_super v12;

  y = a8.y;
  x = a8.x;
  v12.receiver = self;
  v12.super_class = (Class)CHChatBubbleRecognitionResult;
  result = -[CHEllipseRecognitionResult initWithString:score:rotation:center:size:](&v12, sel_initWithString_score_rotation_center_size_, a3, a4, a5, a6.x, a6.y, a7.width, a7.height);
  if (result)
  {
    result->_stemLocation.x = x;
    result->_stemLocation.y = y;
    result->_stemWidth = a9;
  }
  return result;
}

- (CHChatBubbleRecognitionResult)initWithCoder:(id)a3
{
  id v4;
  CHChatBubbleRecognitionResult *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSString *v10;
  double v11;
  double v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  float v17;
  objc_super v19;
  float *v20;
  float *v21;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CHChatBubbleRecognitionResult;
  v5 = -[CHEllipseRecognitionResult initWithCoder:](&v19, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, (uint64_t)CFSTR("stemLocation"), v8, v9);
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    parseFloatsFromString(v10, (char **)&v20);
    if ((char *)v21 - (char *)v20 == 8)
    {
      v11 = *v20;
      v12 = v20[1];
    }
    else
    {
      v11 = *MEMORY[0x1E0C9D538];
      v12 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      if (!v20)
      {
LABEL_6:
        v5->_stemLocation.x = v11;
        v5->_stemLocation.y = v12;

        objc_msgSend_decodeFloatForKey_(v4, v13, (uint64_t)CFSTR("stemWidth"), v14, v15, v16);
        v5->_stemWidth = v17;
        goto LABEL_7;
      }
    }
    v21 = v20;
    operator delete(v20);
    goto LABEL_6;
  }
LABEL_7:

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  double stemWidth;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CHChatBubbleRecognitionResult;
  v5 = -[CHEllipseRecognitionResult encodeWithCoder:](&v20, sel_encodeWithCoder_, v4);
  pointToString(self->_stemLocation, (uint64_t)v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v12, (uint64_t)v11, (uint64_t)CFSTR("stemLocation"), v13, v14);

  stemWidth = self->_stemWidth;
  *(float *)&stemWidth = stemWidth;
  objc_msgSend_encodeFloat_forKey_(v4, v16, (uint64_t)CFSTR("stemWidth"), v17, v18, v19, stemWidth);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CGPoint)stemLocation
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->_stemLocation, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (double)stemWidth
{
  return self->_stemWidth;
}

@end
