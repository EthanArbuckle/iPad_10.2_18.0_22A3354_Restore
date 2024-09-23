@implementation CHRemoteSynthesisRequest

- (CHRemoteSynthesisRequest)initWithString:(id)a3 drawing:(id)a4 options:(id)a5 requestType:(int64_t)a6
{
  return (CHRemoteSynthesisRequest *)objc_msgSend_initWithString_drawing_options_requestType_priority_(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, a6, 0);
}

- (CHRemoteSynthesisRequest)initWithString:(id)a3 drawing:(id)a4 options:(id)a5 requestType:(int64_t)a6 priority:(int64_t)a7
{
  id v12;
  id v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  CHRemoteSynthesisRequest *v20;
  uint64_t v21;
  NSString *string;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  CHDrawing *drawing;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  CHSynthesisRequestOptions *options;
  objc_super v38;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v38.receiver = self;
  v38.super_class = (Class)CHRemoteSynthesisRequest;
  v20 = -[CHRemoteSynthesisRequest init](&v38, sel_init);
  if (v20)
  {
    v21 = objc_msgSend_copy(v12, v15, v16, v17, v18, v19);
    string = v20->_string;
    v20->_string = (NSString *)v21;

    v28 = objc_msgSend_copy(v13, v23, v24, v25, v26, v27);
    drawing = v20->_drawing;
    v20->_drawing = (CHDrawing *)v28;

    v35 = objc_msgSend_copy(v14, v30, v31, v32, v33, v34);
    options = v20->_options;
    v20->_options = (CHSynthesisRequestOptions *)v35;

    v20->_requestType = a6;
    v20->_priority = a7;
  }

  return v20;
}

- (CHRemoteSynthesisRequest)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  CHRemoteSynthesisRequest *v31;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, (uint64_t)CFSTR("string"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, (uint64_t)CFSTR("drawing"), v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v16, v15, (uint64_t)CFSTR("options"), v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend_decodeIntegerForKey_(v4, v20, (uint64_t)CFSTR("requestType"), v21, v22, v23);
  v29 = objc_msgSend_decodeIntegerForKey_(v4, v25, (uint64_t)CFSTR("priority"), v26, v27, v28);

  v31 = (CHRemoteSynthesisRequest *)objc_msgSend_initWithString_drawing_options_requestType_priority_(self, v30, (uint64_t)v9, (uint64_t)v14, (uint64_t)v19, v24, v29);
  return v31;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *string;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;

  string = self->_string;
  v20 = a3;
  objc_msgSend_encodeObject_forKey_(v20, v5, (uint64_t)string, (uint64_t)CFSTR("string"), v6, v7);
  objc_msgSend_encodeObject_forKey_(v20, v8, (uint64_t)self->_drawing, (uint64_t)CFSTR("drawing"), v9, v10);
  objc_msgSend_encodeObject_forKey_(v20, v11, (uint64_t)self->_options, (uint64_t)CFSTR("options"), v12, v13);
  objc_msgSend_encodeInteger_forKey_(v20, v14, self->_requestType, (uint64_t)CFSTR("requestType"), v15, v16);
  objc_msgSend_encodeInteger_forKey_(v20, v17, self->_priority, (uint64_t)CFSTR("priority"), v18, v19);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CHDrawing)drawing
{
  return self->_drawing;
}

- (CHSynthesisRequestOptions)options
{
  return self->_options;
}

- (NSString)string
{
  return self->_string;
}

- (int64_t)requestType
{
  return self->_requestType;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_string, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_drawing, 0);
}

@end
