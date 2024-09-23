@implementation ATXFaceSuggestionFocusMode

- (ATXFaceSuggestionFocusMode)initWithType:(int64_t)a3 uuid:(id)a4
{
  id v6;
  ATXFaceSuggestionFocusMode *v7;
  ATXFaceSuggestionFocusMode *v8;
  uint64_t v9;
  NSString *uuid;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXFaceSuggestionFocusMode;
  v7 = -[ATXFaceSuggestionFocusMode init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_type = a3;
    v9 = objc_msgSend(v6, "copy");
    uuid = v8->_uuid;
    v8->_uuid = (NSString *)v9;

  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXFaceSuggestionFocusMode)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  ATXFaceSuggestionFocusMode *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[ATXFaceSuggestionFocusMode initWithType:uuid:](self, "initWithType:uuid:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[ATXFaceSuggestionFocusMode type](self, "type"), CFSTR("type"));
  -[ATXFaceSuggestionFocusMode uuid](self, "uuid");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("uuid"));

}

- (int64_t)type
{
  return self->_type;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
