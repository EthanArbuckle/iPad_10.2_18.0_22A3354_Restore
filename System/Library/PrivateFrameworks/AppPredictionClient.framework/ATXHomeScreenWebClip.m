@implementation ATXHomeScreenWebClip

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXHomeScreenWebClip)initWithUUID:(id)a3 name:(id)a4 url:(id)a5
{
  id v8;
  id v9;
  id v10;
  ATXHomeScreenWebClip *v11;
  uint64_t v12;
  NSString *uuid;
  uint64_t v14;
  NSString *name;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)ATXHomeScreenWebClip;
  v11 = -[ATXHomeScreenWebClip init](&v17, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    uuid = v11->_uuid;
    v11->_uuid = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    name = v11->_name;
    v11->_name = (NSString *)v14;

    objc_storeStrong((id *)&v11->_url, a5);
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  id v5;

  name = self->_name;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", name, CFSTR("name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_url, CFSTR("url"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_uuid, CFSTR("uuid"));

}

- (ATXHomeScreenWebClip)initWithCoder:(id)a3
{
  id v4;
  ATXHomeScreenWebClip *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  NSURL *url;
  uint64_t v10;
  NSString *uuid;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ATXHomeScreenWebClip;
  v5 = -[ATXHomeScreenWebClip init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("url"));
    v8 = objc_claimAutoreleasedReturnValue();
    url = v5->_url;
    v5->_url = (NSURL *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuid"));
    v10 = objc_claimAutoreleasedReturnValue();
    uuid = v5->_uuid;
    v5->_uuid = (NSString *)v10;

  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSURL hash](self->_url, "hash");
  return -[NSString hash](self->_uuid, "hash") - v3 + 32 * v3;
}

- (BOOL)isEqual:(id)a3
{
  ATXHomeScreenWebClip *v4;
  ATXHomeScreenWebClip *v5;
  BOOL v6;

  v4 = (ATXHomeScreenWebClip *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXHomeScreenWebClip isEqualToATXHomeScreenWebClip:](self, "isEqualToATXHomeScreenWebClip:", v5);

  return v6;
}

- (BOOL)isEqualToATXHomeScreenWebClip:(id)a3
{
  id *v4;
  NSString *uuid;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  char v9;
  char v10;
  NSURL *v11;
  NSURL *v12;

  v4 = (id *)a3;
  uuid = self->_uuid;
  v6 = (NSString *)v4[1];
  if (uuid == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = uuid;
    v9 = -[NSString isEqual:](v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
    {
      v10 = 0;
      goto LABEL_9;
    }
  }
  v11 = self->_url;
  v12 = v11;
  if (v11 == v4[3])
    v10 = 1;
  else
    v10 = -[NSURL isEqual:](v11, "isEqual:");

LABEL_9:
  return v10;
}

- (id)dictionaryRepresentationForIntrospection
{
  NSURL *url;
  const __CFString *name;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  const __CFString *uuid;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  name = (const __CFString *)self->_name;
  url = self->_url;
  if (!name)
    name = CFSTR("<nil>");
  v12[0] = name;
  v11[0] = CFSTR("name");
  v11[1] = CFSTR("url");
  -[NSURL absoluteString](url, "absoluteString");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (const __CFString *)v5;
  else
    v7 = CFSTR("<nil>");
  v11[2] = CFSTR("uuid");
  uuid = (const __CFString *)self->_uuid;
  if (!uuid)
    uuid = CFSTR("<nil>");
  v12[1] = v7;
  v12[2] = uuid;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (NSString)name
{
  return self->_name;
}

- (NSURL)url
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
