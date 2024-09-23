@implementation _INBundleImage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageBundle, 0);
  objc_storeStrong((id *)&self->_imageName, 0);
}

- (void)setImageName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setImageBundle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)stringRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  unint64_t v10;
  __CFString *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;

  -[_INBundleImage imageBundle](self, "imageBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundlePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INBundleImage imageBundle](self, "imageBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundlePath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "URLPathAllowedCharacterSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAddingPercentEncodingWithAllowedCharacters:", v7);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = &stru_1E2295770;
  }
  -[_INBundleImage imageBundle](self, "imageBundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "bundleType");

  if (v10 > 2)
    v11 = 0;
  else
    v11 = off_1E2290620[v10];
  v12 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[_INBundleImage imageName](self, "imageName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INBundleImage imageBundle](self, "imageBundle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bundleIdentifier");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v15)
    v17 = (const __CFString *)v15;
  else
    v17 = &stru_1E2295770;
  v18 = (void *)objc_msgSend(v12, "initWithFormat:", CFSTR("%@://%@/?%@=%@&%@=%@&%@=%@"), CFSTR("siri-client-cache"), v8, CFSTR("bundleType"), v11, CFSTR("imageName"), v13, CFSTR("bundleIdentifier"), v17);

  return v18;
}

- (INImageBundle)imageBundle
{
  return self->_imageBundle;
}

- (NSString)imageName
{
  return self->_imageName;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_INBundleImage;
  v4 = a3;
  -[INImage encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_imageName, CFSTR("imageName"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_imageBundle, CFSTR("imageBundle"));

}

- (id)_initWithURLRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  INImageBundle *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  char v22;
  void *v23;
  int v24;
  uint64_t v25;
  void *v26;
  int v27;
  void *v28;
  int v29;
  void *v30;
  uint64_t v31;
  _INBundleImage *v32;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  objc_super v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v43.receiver = self;
    v43.super_class = (Class)_INBundleImage;
    self = -[INImage _initWithIdentifier:](&v43, sel__initWithIdentifier_, 0);
    if (!self)
    {
LABEL_31:
      self = self;
      v32 = self;
      goto LABEL_32;
    }
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scheme");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("siri-client-cache"));

    if (v7)
    {
      objc_msgSend(v5, "path");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_alloc_init(INImageBundle);
      if ((objc_msgSend(v8, "isEqualToString:", CFSTR("/")) & 1) == 0)
      {
        objc_msgSend(v8, "stringByRemovingPercentEncoding");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[INImageBundle setBundlePath:](v9, "setBundlePath:", v10);

      }
      v35 = v8;
      v37 = v4;
      v36 = v5;
      objc_msgSend(v5, "queryItems", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      v42 = 0u;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      if (v12)
      {
        v13 = v12;
        v14 = 0;
        v38 = 0;
        v15 = *(_QWORD *)v40;
        v16 = 1;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v40 != v15)
              objc_enumerationMutation(v11);
            v18 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
            objc_msgSend(v18, "name");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("bundleType"));

            if (v20)
            {
              objc_msgSend(v18, "value");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("a"));

              if ((v22 & 1) != 0)
              {
                v16 = 0;
              }
              else
              {
                objc_msgSend(v18, "value");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("s"));

                if (v27)
                  v16 = 2;
              }
            }
            else
            {
              objc_msgSend(v18, "name");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("imageName"));

              if (v24)
              {
                objc_msgSend(v18, "value");
                v25 = objc_claimAutoreleasedReturnValue();

                v14 = (void *)v25;
              }
              else
              {
                objc_msgSend(v18, "name");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                v29 = objc_msgSend(v28, "isEqualToString:", CFSTR("bundleIdentifier"));

                if (v29)
                {
                  objc_msgSend(v18, "value");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v30, "length"))
                  {
                    objc_msgSend(v18, "value");
                    v31 = objc_claimAutoreleasedReturnValue();
                  }
                  else
                  {
                    v31 = 0;
                  }

                  v38 = (void *)v31;
                }
              }
            }
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
        }
        while (v13);
      }
      else
      {
        v14 = 0;
        v38 = 0;
        v16 = 1;
      }
      objc_msgSend(v34, "setBundleType:", v16);
      objc_msgSend(v34, "setBundleIdentifier:", v38);
      -[_INBundleImage setImageBundle:](self, "setImageBundle:", v34);
      -[_INBundleImage setImageName:](self, "setImageName:", v14);

      v4 = v37;
      goto LABEL_31;
    }

  }
  v32 = 0;
LABEL_32:

  return v32;
}

- (void)_loadImageDataAndSizeWithHelper:(id)a3 accessSpecifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    if (v8 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v11 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v19 = "-[_INBundleImage(INPortableImageLoader) _loadImageDataAndSizeWithHelper:accessSpecifier:completion:]";
        v20 = 2112;
        v21 = v8;
        _os_log_impl(&dword_18BEBC000, v11, OS_LOG_TYPE_INFO, "%s Attempting bundle image loading strategy with helper: %@", buf, 0x16u);
      }
      -[_INBundleImage imageBundle](self, "imageBundle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[_INBundleImage imageName](self, "imageName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "loadImageDataFromBundle:withImageName:accessSpecifier:completion:", v12, v13, v9, v10);
    }
    else
    {
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v16 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No helper to use which can load image %@ from bundle"), self);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("IntentsErrorDomain"), 6003, v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, void *, double, double))v10 + 2))(v10, 0, 0, v15, 0.0, 0.0);

    }
  }

}

- (id)_URLRepresentation
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E98];
  -[_INBundleImage stringRepresentation](self, "stringRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (_INBundleImage)initWithStringRepresentation:(id)a3
{
  void *v4;
  _INBundleImage *v5;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_INBundleImage _initWithURLRepresentation:](self, "_initWithURLRepresentation:", v4);

  return v5;
}

- (BOOL)_requiresRetrieval
{
  return 1;
}

- (id)_dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *imageName;
  void *v6;
  void *v7;
  objc_super v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)_INBundleImage;
  -[INImage _dictionaryRepresentation](&v9, sel__dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v10 = CFSTR("imageName");
  imageName = self->_imageName;
  v6 = imageName;
  if (!imageName)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEntriesFromDictionary:", v7);

  if (!imageName)
  return v4;
}

- (id)_copyWithSubclass:(Class)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_INBundleImage;
  v4 = -[INImage _copyWithSubclass:](&v11, sel__copyWithSubclass_, a3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[_INBundleImage imageName](self, "imageName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setImageName:", v6);

    -[_INBundleImage imageBundle](self, "imageBundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setImageBundle:", v7);

  }
  else
  {
    v5 = 0;
  }
  if (v5)
    v8 = v5;
  else
    v8 = v4;
  v9 = v8;

  return v9;
}

- (id)_bundlePath
{
  void *v2;
  void *v3;

  -[_INBundleImage imageBundle](self, "imageBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundlePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_setBundlePath:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_INBundleImage imageBundle](self, "imageBundle");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBundlePath:", v4);

}

- (id)_bundleIdentifier
{
  void *v2;
  void *v3;

  -[_INBundleImage imageBundle](self, "imageBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_setBundleIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_INBundleImage imageBundle](self, "imageBundle");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBundleIdentifier:", v4);

}

- (BOOL)_isSystem
{
  void *v2;
  BOOL v3;

  -[_INBundleImage imageBundle](self, "imageBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "bundleType") == 2;

  return v3;
}

- (_INBundleImage)initWithCoder:(id)a3
{
  id v4;
  _INBundleImage *v5;
  uint64_t v6;
  NSString *imageName;
  uint64_t v8;
  INImageBundle *imageBundle;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_INBundleImage;
  v5 = -[INImage initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imageName"));
    v6 = objc_claimAutoreleasedReturnValue();
    imageName = v5->_imageName;
    v5->_imageName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imageBundle"));
    v8 = objc_claimAutoreleasedReturnValue();
    imageBundle = v5->_imageBundle;
    v5->_imageBundle = (INImageBundle *)v8;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
