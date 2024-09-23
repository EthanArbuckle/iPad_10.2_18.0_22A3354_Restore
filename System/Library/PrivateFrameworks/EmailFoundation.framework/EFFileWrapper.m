@implementation EFFileWrapper

- (EFFileWrapper)init
{
  EFFileWrapper *v2;
  EFFileWrapper *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EFFileWrapper;
  v2 = -[EFFileWrapper init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[EFFileWrapper _initializePathComponents](v2);
  return v3;
}

- (void)_initializePathComponents
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v8;
  objc_super v9;

  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)EFFileWrapper;
    objc_msgSendSuper2(&v9, sel_filename);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    +[EFPathComponent pathComponentWithString:](EFPathComponent, "pathComponentWithString:", v2);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)a1[12];
    a1[12] = v3;

    v8.receiver = a1;
    v8.super_class = (Class)EFFileWrapper;
    objc_msgSendSuper2(&v8, sel_preferredFilename);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[EFPathComponent pathComponentWithString:](EFPathComponent, "pathComponentWithString:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)a1[11];
    a1[11] = v6;

  }
}

- (id)initRegularFileWithContents:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)EFFileWrapper;
  v5 = -[EFFileWrapper initRegularFileWithContents:](&v8, sel_initRegularFileWithContents_, v4);
  v6 = v5;
  if (v5)
    -[EFFileWrapper _initializePathComponents](v5);

  return v6;
}

- (EFFileWrapper)initWithURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8;
  EFFileWrapper *v9;
  EFFileWrapper *v10;
  objc_super v12;

  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)EFFileWrapper;
  v9 = -[EFFileWrapper initWithURL:options:error:](&v12, sel_initWithURL_options_error_, v8, a4, a5);
  v10 = v9;
  if (v9)
    -[EFFileWrapper _initializePathComponents](v9);

  return v10;
}

- (id)initDirectoryWithFileWrappers:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)EFFileWrapper;
  v5 = -[EFFileWrapper initDirectoryWithFileWrappers:](&v8, sel_initDirectoryWithFileWrappers_, v4);
  v6 = v5;
  if (v5)
    -[EFFileWrapper _initializePathComponents](v5);

  return v6;
}

- (EFFileWrapper)initWithSerializedRepresentation:(id)a3
{
  id v4;
  EFFileWrapper *v5;
  EFFileWrapper *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)EFFileWrapper;
  v5 = -[EFFileWrapper initWithSerializedRepresentation:](&v8, sel_initWithSerializedRepresentation_, v4);
  v6 = v5;
  if (v5)
    -[EFFileWrapper _initializePathComponents](v5);

  return v6;
}

- (void)setPreferredFilenamePathComponent:(id)a3
{
  id v5;
  void *v6;
  objc_super v7;

  v5 = a3;
  objc_storeStrong((id *)&self->_preferredFilenamePathComponent, a3);
  objc_msgSend(v5, "sanitizedString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7.receiver = self;
  v7.super_class = (Class)EFFileWrapper;
  -[EFFileWrapper setPreferredFilename:](&v7, sel_setPreferredFilename_, v6);

}

- (void)setFilenamePathComponent:(id)a3
{
  id v5;
  void *v6;
  objc_super v7;

  v5 = a3;
  objc_storeStrong((id *)&self->_filenamePathComponent, a3);
  objc_msgSend(v5, "sanitizedString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7.receiver = self;
  v7.super_class = (Class)EFFileWrapper;
  -[EFFileWrapper setFilename:](&v7, sel_setFilename_, v6);

}

- (id)preferredFilename
{
  return -[EFPathComponent sanitizedString](self->_preferredFilenamePathComponent, "sanitizedString");
}

- (void)setPreferredFilename:(id)a3
{
  id v4;

  +[EFPathComponent pathComponentWithString:](EFPathComponent, "pathComponentWithString:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EFFileWrapper setPreferredFilenamePathComponent:](self, "setPreferredFilenamePathComponent:");

}

- (id)filename
{
  return -[EFPathComponent sanitizedString](self->_filenamePathComponent, "sanitizedString");
}

- (void)setFilename:(id)a3
{
  id v4;

  +[EFPathComponent pathComponentWithString:](EFPathComponent, "pathComponentWithString:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EFFileWrapper setFilenamePathComponent:](self, "setFilenamePathComponent:");

}

- (EFPathComponent)preferredFilenamePathComponent
{
  return self->_preferredFilenamePathComponent;
}

- (EFPathComponent)filenamePathComponent
{
  return self->_filenamePathComponent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filenamePathComponent, 0);
  objc_storeStrong((id *)&self->_preferredFilenamePathComponent, 0);
}

@end
