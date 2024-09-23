@implementation EDAMNoteLimits

+ (id)structName
{
  return CFSTR("NoteLimits");
}

+ (id)structFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[6];

  v11[5] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_1493;
  if (!structFields_structFields_1493)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 8, 1, CFSTR("noteResourceCountMax"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 10, 1, CFSTR("uploadLimit"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v4;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 10, 1, CFSTR("resourceSizeMax"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2] = v5;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 4, 10, 1, CFSTR("noteSizeMax"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[3] = v6;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 5, 10, 1, CFSTR("uploaded"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[4] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 5);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)structFields_structFields_1493;
    structFields_structFields_1493 = v8;

    v2 = (void *)structFields_structFields_1493;
  }
  return v2;
}

- (NSNumber)noteResourceCountMax
{
  return self->_noteResourceCountMax;
}

- (void)setNoteResourceCountMax:(id)a3
{
  objc_storeStrong((id *)&self->_noteResourceCountMax, a3);
}

- (NSNumber)uploadLimit
{
  return self->_uploadLimit;
}

- (void)setUploadLimit:(id)a3
{
  objc_storeStrong((id *)&self->_uploadLimit, a3);
}

- (NSNumber)resourceSizeMax
{
  return self->_resourceSizeMax;
}

- (void)setResourceSizeMax:(id)a3
{
  objc_storeStrong((id *)&self->_resourceSizeMax, a3);
}

- (NSNumber)noteSizeMax
{
  return self->_noteSizeMax;
}

- (void)setNoteSizeMax:(id)a3
{
  objc_storeStrong((id *)&self->_noteSizeMax, a3);
}

- (NSNumber)uploaded
{
  return self->_uploaded;
}

- (void)setUploaded:(id)a3
{
  objc_storeStrong((id *)&self->_uploaded, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uploaded, 0);
  objc_storeStrong((id *)&self->_noteSizeMax, 0);
  objc_storeStrong((id *)&self->_resourceSizeMax, 0);
  objc_storeStrong((id *)&self->_uploadLimit, 0);
  objc_storeStrong((id *)&self->_noteResourceCountMax, 0);
}

@end
