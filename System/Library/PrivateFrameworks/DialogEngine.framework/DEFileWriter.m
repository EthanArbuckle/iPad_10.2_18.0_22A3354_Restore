@implementation DEFileWriter

- (DEFileWriter)initWithURL:(id)a3
{
  id v5;
  DEFileWriter *v6;
  DEFileWriter *v7;
  id *p_dest;
  NSFileHandle *file;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  uint64_t v15;
  DEFileWriter *v16;
  NSFileHandle *v17;
  id v19;
  objc_super v20;

  v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)DEFileWriter;
  v6 = -[DEFileWriter init](&v20, sel_init);
  v7 = v6;
  if (v6)
  {
    p_dest = (id *)&v6->_dest;
    objc_storeStrong((id *)&v6->_dest, a3);
    file = v7->_file;
    v7->_file = 0;

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*p_dest, "path");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "createFileAtPath:contents:attributes:", v12, 0, 0);

      v14 = *p_dest;
      if ((v13 & 1) != 0)
      {
        v19 = 0;
        objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForWritingToURL:error:", v14, &v19);
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = (DEFileWriter *)v19;
        v17 = v7->_file;
        v7->_file = (NSFileHandle *)v15;

        if (v16)
        {
          +[DELogging error:](DELogging, "error:", CFSTR("Failed to write to file at \"%@\": %@"), *p_dest, v16);

          v7 = v16;
        }
        else if (v7->_file)
        {
          goto LABEL_8;
        }
      }
      else
      {
        +[DELogging error:](DELogging, "error:", CFSTR("Failed to create file at \"%@\": %@"), *p_dest, 0);
      }
    }

    v7 = 0;
LABEL_8:

  }
  return v7;
}

- (DEFileWriter)init
{
  return -[DEFileWriter initWithURL:](self, "initWithURL:", 0);
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
  v5.super_class = (Class)DEFileWriter;
  -[DEFileWriter dealloc](&v5, sel_dealloc);
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

- (void)writeData:(id)a3
{
  -[NSFileHandle writeData:](self->_file, "writeData:", a3);
}

- (NSURL)dest
{
  return self->_dest;
}

- (void)setDest:(id)a3
{
  objc_storeStrong((id *)&self->_dest, a3);
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
  objc_storeStrong((id *)&self->_dest, 0);
}

@end
