@implementation ACCMediaLibraryUpdateLibraryInfo

- (ACCMediaLibraryUpdateLibraryInfo)initWithMediaLibrary:(id)a3 name:(id)a4 type:(int)a5
{
  id v9;
  id v10;
  ACCMediaLibraryUpdateLibraryInfo *v11;
  ACCMediaLibraryUpdateLibraryInfo *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ACCMediaLibraryUpdateLibraryInfo;
  v11 = -[ACCMediaLibraryUpdateLibraryInfo init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_mediaLibraryUID, a3);
    objc_storeStrong((id *)&v12->_name, a4);
    v12->_type = a5;
  }

  return v12;
}

- (ACCMediaLibraryUpdateLibraryInfo)initWithMediaLibrary:(id)a3 dict:(id)a4
{
  id v5;
  ACCMediaLibraryUpdateLibraryInfo *v6;
  uint64_t v7;
  NSString *mediaLibraryUID;
  uint64_t v9;
  NSString *name;
  void *v11;
  objc_super v13;

  v5 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ACCMediaLibraryUpdateLibraryInfo;
  v6 = -[ACCMediaLibraryUpdateLibraryInfo init](&v13, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("ACCMediaLibraryUIDKey"));
    v7 = objc_claimAutoreleasedReturnValue();
    mediaLibraryUID = v6->_mediaLibraryUID;
    v6->_mediaLibraryUID = (NSString *)v7;

    objc_msgSend(v5, "objectForKey:", CFSTR("ACCMediaLibraryNameKey"));
    v9 = objc_claimAutoreleasedReturnValue();
    name = v6->_name;
    v6->_name = (NSString *)v9;

    objc_msgSend(v5, "objectForKey:", CFSTR("ACCMediaLibraryTypeKey"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_type = objc_msgSend(v11, "unsignedCharValue");

  }
  return v6;
}

- (ACCMediaLibraryUpdateLibraryInfo)initWithDict:(id)a3
{
  id v4;
  ACCMediaLibraryUpdateLibraryInfo *v5;
  uint64_t v6;
  NSString *mediaLibraryUID;
  uint64_t v8;
  NSString *name;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ACCMediaLibraryUpdateLibraryInfo;
  v5 = -[ACCMediaLibraryUpdateLibraryInfo init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("ACCMediaLibraryUIDKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    mediaLibraryUID = v5->_mediaLibraryUID;
    v5->_mediaLibraryUID = (NSString *)v6;

    objc_msgSend(v4, "objectForKey:", CFSTR("ACCMediaLibraryNameKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v8;

    objc_msgSend(v4, "objectForKey:", CFSTR("ACCMediaLibraryTypeKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = objc_msgSend(v10, "unsignedCharValue");

  }
  return v5;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<ACCMediaLibraryUpdateLibraryInfo>[%@ '%@' type=%d]"), self->_mediaLibraryUID, self->_name, self->_type);
}

- (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyDict
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v3, "setObject:forKey:", self->_mediaLibraryUID, CFSTR("ACCMediaLibraryUIDKey"));
  objc_msgSend(v3, "setObject:forKey:", self->_name, CFSTR("ACCMediaLibraryNameKey"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", LOBYTE(self->_type));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("ACCMediaLibraryTypeKey"));

  return v3;
}

- (void)fillStruct:(id *)a3
{
  a3->var0 = 0;
  a3->var1 = 0;
  *(_QWORD *)&a3->var2 = 0;
  a3->var1 = (char *)-[NSString UTF8String](self->_mediaLibraryUID, "UTF8String");
  a3->var0 = (char *)-[NSString UTF8String](self->_name, "UTF8String");
  a3->var2 = self->_type;
}

- (void)setMediaLibraryUID:(id)a3
{
  objc_storeStrong((id *)&self->_mediaLibraryUID, a3);
}

- (NSString)mediaLibraryUID
{
  return self->_mediaLibraryUID;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_mediaLibraryUID, 0);
}

@end
