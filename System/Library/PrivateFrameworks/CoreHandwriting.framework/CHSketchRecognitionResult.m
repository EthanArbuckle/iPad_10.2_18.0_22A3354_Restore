@implementation CHSketchRecognitionResult

- (CHSketchRecognitionResult)initWithString:(id)a3 score:(double)a4 rotation:(double)a5
{
  NSString *v8;
  CHSketchRecognitionResult *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  CHSketchRecognitionResult *v15;
  NSString *string;
  uint64_t v17;
  NSString *v18;
  objc_super v20;

  v8 = (NSString *)a3;
  v20.receiver = self;
  v20.super_class = (Class)CHSketchRecognitionResult;
  v9 = -[CHRecognitionResult initWithScore:](&v20, sel_initWithScore_, a4);
  v15 = v9;
  if (v9)
  {
    string = v9->_string;
    if (string != v8)
    {
      v9->_string = 0;

    }
    v17 = objc_msgSend_copy(v8, v10, v11, v12, v13, v14);
    v18 = v15->_string;
    v15->_string = (NSString *)v17;

    v15->_rotation = a5;
  }

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  CHSketchRecognitionResult *v4;
  CHSketchRecognitionResult *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int isEqualToString;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  double v41;
  double v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  double v48;
  BOOL v49;

  v4 = (CHSketchRecognitionResult *)a3;
  if (self == v4)
  {
    v49 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      objc_msgSend_score(self, v6, v7, v8, v9, v10);
      v12 = v11;
      objc_msgSend_score(v5, v13, v14, v15, v16, v17);
      if (v12 == v23
        && (objc_msgSend_string(self, v18, v19, v20, v21, v22),
            v24 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend_string(v5, v25, v26, v27, v28, v29),
            v30 = (void *)objc_claimAutoreleasedReturnValue(),
            isEqualToString = objc_msgSend_isEqualToString_(v24, v31, (uint64_t)v30, v32, v33, v34),
            v30,
            v24,
            isEqualToString))
      {
        objc_msgSend_rotation(self, v36, v37, v38, v39, v40);
        v42 = v41;
        objc_msgSend_rotation(v5, v43, v44, v45, v46, v47);
        v49 = v42 == v48;
      }
      else
      {
        v49 = 0;
      }

    }
    else
    {
      v49 = 0;
    }
  }

  return v49;
}

- (CHSketchRecognitionResult)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CHSketchRecognitionResult *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSString *string;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  float v20;
  objc_super v22;

  v4 = a3;
  objc_msgSend_decodeDoubleForKey_(v4, v5, (uint64_t)CFSTR("score"), v6, v7, v8);
  v22.receiver = self;
  v22.super_class = (Class)CHSketchRecognitionResult;
  v9 = -[CHRecognitionResult initWithScore:](&v22, sel_initWithScore_);
  if (v9)
  {
    v10 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, (uint64_t)CFSTR("string"), v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    string = v9->_string;
    v9->_string = (NSString *)v14;

    objc_msgSend_decodeFloatForKey_(v4, v16, (uint64_t)CFSTR("rotation"), v17, v18, v19);
    v9->_rotation = v20;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  double rotation;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;

  v21 = a3;
  objc_msgSend_score(self, v4, v5, v6, v7, v8);
  objc_msgSend_encodeDouble_forKey_(v21, v9, (uint64_t)CFSTR("score"), v10, v11, v12);
  objc_msgSend_encodeObject_forKey_(v21, v13, (uint64_t)self->_string, (uint64_t)CFSTR("string"), v14, v15);
  rotation = self->_rotation;
  *(float *)&rotation = rotation;
  objc_msgSend_encodeFloat_forKey_(v21, v17, (uint64_t)CFSTR("rotation"), v18, v19, v20, rotation);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)string
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (double)rotation
{
  return self->_rotation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_string, 0);
}

@end
