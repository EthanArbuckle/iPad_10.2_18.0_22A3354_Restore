@implementation CHTextInputTarget

- (CHTextInputTarget)initWithIdentifier:(id)a3 frame:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  CHTextInputTarget *v15;
  uint64_t v16;
  NSNumber *inputTargetIdentifier;
  objc_super v19;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CHTextInputTarget;
  v15 = -[CHTextInputTarget init](&v19, sel_init);
  if (v15)
  {
    v16 = objc_msgSend_copy(v9, v10, v11, v12, v13, v14);
    inputTargetIdentifier = v15->_inputTargetIdentifier;
    v15->_inputTargetIdentifier = (NSNumber *)v16;

    v15->_frame.origin.x = x;
    v15->_frame.origin.y = y;
    v15->_frame.size.width = width;
    v15->_frame.size.height = height;
  }

  return v15;
}

- (id)description
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CHTextInputTarget;
  -[CHTextInputTarget description](&v10, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingFormat_(v3, v4, (uint64_t)CFSTR(" ID: %@, frame: {x: %0.1f, y: %0.1f, width: %0.1f, height: %0.1f}"), v5, v6, v7, self->_inputTargetIdentifier, *(_QWORD *)&self->_frame.origin.x, *(_QWORD *)&self->_frame.origin.y, *(_QWORD *)&self->_frame.size.width, *(_QWORD *)&self->_frame.size.height);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *inputTargetIdentifier;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  CGFloat x;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CGFloat y;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  CGFloat width;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  CGFloat height;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;

  inputTargetIdentifier = self->_inputTargetIdentifier;
  v28 = a3;
  objc_msgSend_encodeObject_forKey_(v28, v5, (uint64_t)inputTargetIdentifier, (uint64_t)CFSTR("inputTargetIdentifier"), v6, v7);
  x = self->_frame.origin.x;
  *(float *)&x = x;
  objc_msgSend_encodeFloat_forKey_(v28, v9, (uint64_t)CFSTR("frameXOrigin"), v10, v11, v12, x);
  y = self->_frame.origin.y;
  *(float *)&y = y;
  objc_msgSend_encodeFloat_forKey_(v28, v14, (uint64_t)CFSTR("frameYOrigin"), v15, v16, v17, y);
  width = self->_frame.size.width;
  *(float *)&width = width;
  objc_msgSend_encodeFloat_forKey_(v28, v19, (uint64_t)CFSTR("frameWidth"), v20, v21, v22, width);
  height = self->_frame.size.height;
  *(float *)&height = height;
  objc_msgSend_encodeFloat_forKey_(v28, v24, (uint64_t)CFSTR("frameHeight"), v25, v26, v27, height);

}

- (CHTextInputTarget)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  float v14;
  float v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  float v20;
  float v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  float v26;
  float v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  float v32;
  float v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, (uint64_t)CFSTR("inputTargetIdentifier"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeFloatForKey_(v4, v10, (uint64_t)CFSTR("frameXOrigin"), v11, v12, v13);
  v15 = v14;
  objc_msgSend_decodeFloatForKey_(v4, v16, (uint64_t)CFSTR("frameYOrigin"), v17, v18, v19);
  v21 = v20;
  objc_msgSend_decodeFloatForKey_(v4, v22, (uint64_t)CFSTR("frameWidth"), v23, v24, v25);
  v27 = v26;
  objc_msgSend_decodeFloatForKey_(v4, v28, (uint64_t)CFSTR("frameHeight"), v29, v30, v31);
  v33 = v32;

  if (v9)
    self = (CHTextInputTarget *)objc_msgSend_initWithIdentifier_frame_(self, v34, (uint64_t)v9, v35, v36, v37, v15, v21, v27, v33);

  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqualToInputTarget:(id)a3
{
  CHTextInputTarget *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CHTextInputTarget *v10;
  NSNumber *inputTargetIdentifier;
  NSNumber *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSNumber *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int isEqualToNumber;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  BOOL v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGRect v36;

  v4 = (CHTextInputTarget *)a3;
  v10 = v4;
  if (self == v4)
  {
    v30 = 1;
  }
  else
  {
    inputTargetIdentifier = self->_inputTargetIdentifier;
    objc_msgSend_inputTargetIdentifier(v4, v5, v6, v7, v8, v9);
    v12 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    if (inputTargetIdentifier == v12)
    {

    }
    else
    {
      v18 = v12;
      if (!self->_inputTargetIdentifier)
      {

LABEL_10:
        v30 = 0;
        goto LABEL_11;
      }
      objc_msgSend_inputTargetIdentifier(v10, v13, v14, v15, v16, v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToNumber = objc_msgSend_isEqualToNumber_(v19, v20, (uint64_t)self->_inputTargetIdentifier, v21, v22, v23);

      if (!isEqualToNumber)
        goto LABEL_10;
    }
    objc_msgSend_frame(v10, v25, v26, v27, v28, v29);
    v36.origin.x = v31;
    v36.origin.y = v32;
    v36.size.width = v33;
    v36.size.height = v34;
    v30 = CGRectEqualToRect(self->_frame, v36);
  }
LABEL_11:

  return v30;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char isEqualToInputTarget;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isEqualToInputTarget = objc_msgSend_isEqualToInputTarget_(self, v5, (uint64_t)v4, v6, v7, v8);

    return isEqualToInputTarget;
  }
  else
  {

    return 0;
  }
}

- (NSNumber)inputTargetIdentifier
{
  return self->_inputTargetIdentifier;
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
  objc_storeStrong((id *)&self->_inputTargetIdentifier, 0);
}

@end
