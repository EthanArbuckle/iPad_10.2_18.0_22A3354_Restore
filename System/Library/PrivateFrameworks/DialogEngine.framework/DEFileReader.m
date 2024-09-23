@implementation DEFileReader

- (DEFileReader)initWithURL:(id)a3
{
  id v5;
  DEFileReader *v6;
  DEFileReader *v7;
  NSURL **p_src;
  NSFileHandle *file;
  NSURL *src;
  uint64_t v11;
  id v12;
  NSFileHandle *v13;
  id v15;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)DEFileReader;
  v6 = -[DEFileReader init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    p_src = &v6->_src;
    objc_storeStrong((id *)&v6->_src, a3);
    file = v7->_file;
    v7->_file = 0;

    src = v7->_src;
    v15 = 0;
    objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForReadingFromURL:error:", src, &v15);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v15;
    v13 = v7->_file;
    v7->_file = (NSFileHandle *)v11;

    if (v12)
    {
      +[DELogging error:](DELogging, "error:", CFSTR("Failed to read from file at \"%@\": %@"), *p_src, v12);
    }
    else if (v7->_file)
    {
      v7 = v7;
      goto LABEL_7;
    }

    v7 = 0;
LABEL_7:

  }
  return v7;
}

- (DEFileReader)init
{
  return -[DEFileReader initWithURL:](self, "initWithURL:", 0);
}

- (void)dealloc
{
  NSFileHandle *file;
  NSFileHandle *v4;
  objc_super v5;

  file = self->_file;
  if (file)
  {
    -[NSFileHandle closeFile](file, "closeFile");
    v4 = self->_file;
    self->_file = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)DEFileReader;
  -[DEFileReader dealloc](&v5, sel_dealloc);
}

- (void)close
{
  NSFileHandle *file;
  NSFileHandle *v4;

  file = self->_file;
  if (file)
  {
    -[NSFileHandle closeFile](file, "closeFile");
    v4 = self->_file;
    self->_file = 0;

  }
}

- (id)readDataOfLength:(unint64_t)a3
{
  return -[NSFileHandle readDataOfLength:](self->_file, "readDataOfLength:", a3);
}

- (id)readData
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  +[DEIO copyTo:from:](DEIO, "copyTo:from:", v3, self);
  objc_msgSend(v3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSURL)src
{
  return self->_src;
}

- (void)setSrc:(id)a3
{
  objc_storeStrong((id *)&self->_src, a3);
}

- (NSFileHandle)file
{
  return self->_file;
}

- (void)setFile:(id)a3
{
  objc_storeStrong((id *)&self->_file, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_file, 0);
  objc_storeStrong((id *)&self->_src, 0);
}

@end
