@implementation CHRemoteRecognitionSketchRequest

- (CHRemoteRecognitionSketchRequest)initWithDrawing:(id)a3 options:(id)a4 priority:(int64_t)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CHRemoteRecognitionSketchRequest;
  return -[CHRemoteRecognitionRequest initWithDrawing:options:priority:](&v6, sel_initWithDrawing_options_priority_, a3, a4, a5);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CHRemoteRecognitionSketchRequest)initWithCoder:(id)a3
{
  CHRemoteRecognitionSketchRequest *result;
  NSObject *v4;
  uint8_t v5[16];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CHRemoteRecognitionSketchRequest;
  result = -[CHRemoteRecognitionRequest initWithCoder:](&v6, sel_initWithCoder_, a3);
  if (!result)
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v4 = (id)qword_1EF568E38;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1BE607000, v4, OS_LOG_TYPE_ERROR, "CHRemoteRecognitionSketchRequest decoding failed. Locale is required to be non-null.", v5, 2u);
    }

    return 0;
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CHRemoteRecognitionSketchRequest;
  -[CHRemoteRecognitionRequest encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

+ (id)loadFromFile:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;

  objc_msgSend_dataWithContentsOfFile_(MEMORY[0x1E0C99D50], a2, (uint64_t)a3, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3710];
  v8 = objc_opt_class();
  objc_msgSend_unarchivedObjectOfClass_fromData_error_(v7, v9, v8, (uint64_t)v6, 0, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)isEqualToRemoteRecognitionSketchRequest:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  objc_super v6;
  uint64_t v7;
  uint64_t v8;

  if (self == a3)
    return 1;
  v7 = v3;
  v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)CHRemoteRecognitionSketchRequest;
  return -[CHRemoteRecognitionRequest isEqualToRemoteRecognitionRequest:](&v6, sel_isEqualToRemoteRecognitionRequest_);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char isEqualToRemoteRecognitionSketchRequest;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isEqualToRemoteRecognitionSketchRequest = objc_msgSend_isEqualToRemoteRecognitionSketchRequest_(self, v5, (uint64_t)v4, v6, v7, v8);

    return isEqualToRemoteRecognitionSketchRequest;
  }
  else
  {

    return 0;
  }
}

@end
