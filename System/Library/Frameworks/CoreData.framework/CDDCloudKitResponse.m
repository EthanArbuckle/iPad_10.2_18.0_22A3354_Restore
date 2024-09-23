@implementation CDDCloudKitResponse

- (_QWORD)initWithMessage:(char)a3 success:(void *)a4 error:
{
  _QWORD *v7;
  objc_super v9;

  if (!a1)
    return 0;
  v9.receiver = a1;
  v9.super_class = (Class)CDDCloudKitResponse;
  v7 = objc_msgSendSuper2(&v9, sel_init);
  if (v7)
  {
    v7[2] = a2;
    *((_BYTE *)v7 + 8) = a3;
    v7[3] = a4;
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  self->_error = 0;
  v3.receiver = self;
  v3.super_class = (Class)CDDCloudKitResponse;
  -[CDDCloudKitResponse dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CDDCloudKitResponse)initWithCoder:(id)a3
{
  void *v5;
  char v6;

  v5 = (void *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("message"));
  v6 = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("success"));
  objc_opt_self();
  if (qword_1ECD8DA98 != -1)
    dispatch_once(&qword_1ECD8DA98, &__block_literal_global_15);
  return (CDDCloudKitResponse *)-[CDDCloudKitResponse initWithMessage:success:error:](self, v5, v6, (void *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", _MergedGlobals_80, CFSTR("error")));
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_message, CFSTR("message"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_success, CFSTR("success"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_error, CFSTR("error"));
}

uint64_t __44__CDDCloudKitResponse_supportedErrorClasses__block_invoke()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  result = objc_msgSend(v0, "initWithObjects:", v1, v2, v3, v4, v5, objc_opt_class(), 0);
  _MergedGlobals_80 = result;
  return result;
}

@end
