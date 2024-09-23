@implementation GTReplayUpdateLibraryCache

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTReplayUpdateLibraryCache)initWithCoder:(id)a3
{
  id v4;
  GTReplayUpdateLibraryCache *v5;
  uint64_t v6;
  NSString *uuid;
  uint64_t v8;
  NSData *data;
  GTReplayUpdateLibraryCache *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GTReplayUpdateLibraryCache;
  v5 = -[GTReplayRequest initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuid"));
    v6 = objc_claimAutoreleasedReturnValue();
    uuid = v5->_uuid;
    v5->_uuid = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data"));
    v8 = objc_claimAutoreleasedReturnValue();
    data = v5->_data;
    v5->_data = (NSData *)v8;

    v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GTReplayUpdateLibraryCache;
  v4 = a3;
  -[GTReplayRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_uuid, CFSTR("uuid"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_data, CFSTR("data"));

}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
