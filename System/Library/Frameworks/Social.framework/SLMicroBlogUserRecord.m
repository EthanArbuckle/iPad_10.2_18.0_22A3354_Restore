@implementation SLMicroBlogUserRecord

+ (SLMicroBlogUserRecord)userRecordWithDictionaryRepresentation:(id)a3
{
  id v3;
  SLMicroBlogUserRecord *v4;
  SLMicroBlogUserRecord *v5;

  v3 = a3;
  v4 = objc_alloc_init(SLMicroBlogUserRecord);
  v5 = v4;
  if (v3)
    -[SLMicroBlogUserRecord setValuesWithUserDictionary:](v4, "setValuesWithUserDictionary:", v3);

  return v5;
}

- (void)setValuesWithUserDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLMicroBlogUserRecord setName:](self, "setName:", v5);

  objc_msgSend(v4, "objectForKey:", CFSTR("screen_name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLMicroBlogUserRecord setScreen_name:](self, "setScreen_name:", v6);

  objc_msgSend(v4, "objectForKey:", CFSTR("profile_image_url"));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[SLMicroBlogUserRecord setProfile_image_url:](self, "setProfile_image_url:", v7);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[SLMicroBlogUserRecord name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("name"));

  -[SLMicroBlogUserRecord screen_name](self, "screen_name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("screen_name"));

  -[SLMicroBlogUserRecord profile_image_url](self, "profile_image_url");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("profile_image_url"));

}

- (SLMicroBlogUserRecord)initWithCoder:(id)a3
{
  id v4;
  SLMicroBlogUserRecord *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SLMicroBlogUserRecord;
  v5 = -[SLMicroBlogUserRecord init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLMicroBlogUserRecord setName:](v5, "setName:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("screen_name"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLMicroBlogUserRecord setScreen_name:](v5, "setScreen_name:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("profile_image_url"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLMicroBlogUserRecord setProfile_image_url:](v5, "setProfile_image_url:", v8);

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)SLMicroBlogUserRecord;
  -[SLMicroBlogUserRecord description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLMicroBlogUserRecord screen_name](self, "screen_name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLMicroBlogUserRecord name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ screenName: %@ name: %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)screen_name
{
  return self->_screen_name;
}

- (void)setScreen_name:(id)a3
{
  objc_storeStrong((id *)&self->_screen_name, a3);
}

- (NSString)profile_image_url
{
  return self->_profile_image_url;
}

- (void)setProfile_image_url:(id)a3
{
  objc_storeStrong((id *)&self->_profile_image_url, a3);
}

- (UIImage)profileImageCache
{
  return (UIImage *)objc_getProperty(self, a2, 32, 1);
}

- (void)setProfileImageCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileImageCache, 0);
  objc_storeStrong((id *)&self->_profile_image_url, 0);
  objc_storeStrong((id *)&self->_screen_name, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
