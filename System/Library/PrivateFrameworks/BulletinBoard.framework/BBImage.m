@implementation BBImage

+ (BBImage)imageWithData:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v5, "setData:", v4);

  return (BBImage *)v5;
}

+ (BBImage)imageWithName:(id)a3 inBundle:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  objc_msgSend(a4, "bundlePath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "imageWithName:inBundlePath:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (BBImage *)v8;
}

+ (BBImage)imageWithName:(id)a3 inBundlePath:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init((Class)a1);
  objc_msgSend(v8, "setName:", v7);

  objc_msgSend(v8, "setBundlePath:", v6);
  return (BBImage *)v8;
}

- (BBImage)initWithData:(id)a3 path:(id)a4 name:(id)a5 bundlePath:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  BBImage *v14;
  BBImage *v15;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = -[BBImage init](self, "init");
  v15 = v14;
  if (v14)
  {
    -[BBImage setData:](v14, "setData:", v10);
    -[BBImage setPath:](v15, "setPath:", v11);
    -[BBImage setName:](v15, "setName:", v12);
    -[BBImage setBundlePath:](v15, "setBundlePath:", v13);
  }

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  BBImage *v4;
  BBImage *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v15;

  v4 = (BBImage *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      -[BBImage name](self, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[BBImage name](v5, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (BSEqualObjects())
      {
        -[BBImage bundlePath](self, "bundlePath");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[BBImage bundlePath](v5, "bundlePath");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (BSEqualObjects())
        {
          -[BBImage path](self, "path");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[BBImage path](v5, "path");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (BSEqualObjects())
          {
            -[BBImage data](self, "data");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[BBImage data](v5, "data");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = BSEqualObjects();

          }
          else
          {
            v13 = 0;
          }

        }
        else
        {
          v13 = 0;
        }

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  -[BBImage data](self, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[BBImage path](self, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[BBImage name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[BBImage bundlePath](self, "bundlePath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BBImage)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BBImage *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imageData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imagePath"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imageName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundlePath"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[BBImage initWithData:path:name:bundlePath:](self, "initWithData:path:name:bundlePath:", v5, v6, v7, v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[BBImage data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("imageData"));

  -[BBImage path](self, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("imagePath"));

  -[BBImage name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("imageName"));

  -[BBImage bundlePath](self, "bundlePath");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("bundlePath"));

}

- (id)replacementObjectForCoder:(id)a3
{
  void *v4;
  void *v5;

  -[NSObject bb_objectCache](self, "bb_objectCache", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cacheObject:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)awakeAfterUsingCoder:(id)a3
{
  void *v4;
  void *v5;

  -[NSObject bb_objectCache](self, "bb_objectCache", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cacheObject:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)bundlePath
{
  return self->_bundlePath;
}

- (void)setBundlePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundlePath, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
