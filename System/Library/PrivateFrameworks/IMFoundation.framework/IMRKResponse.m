@implementation IMRKResponse

+ (Class)__class
{
  if (qword_1EE1DDDF0 != -1)
    dispatch_once(&qword_1EE1DDDF0, &unk_1E2C46248);
  return (Class)(id)qword_1EE1DDDE8;
}

+ (id)alloc
{
  uint64_t v2;
  uint64_t v3;

  return objc_alloc((Class)objc_msgSend___class(a1, a2, v2, v3));
}

- (NSString)string
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSDictionary)attributes
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)category
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

@end
