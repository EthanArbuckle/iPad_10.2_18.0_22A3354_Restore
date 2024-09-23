@implementation MCMError

- (id)description
{
  MCMLazyDescription *v3;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v3 = [MCMLazyDescription alloc];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __23__MCMError_description__block_invoke;
  v5[3] = &unk_1E8CB6800;
  v5[4] = self;
  return -[MCMLazyDescription initWithDescriber:](v3, "initWithDescriber:", v5);
}

id __23__MCMError_description__block_invoke(uint64_t a1, char a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = objc_msgSend(*(id *)(a1 + 32), "type");
  v6 = objc_msgSend(*(id *)(a1 + 32), "category");
  v7 = objc_msgSend(*(id *)(a1 + 32), "POSIXerrno");
  v8 = v7;
  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("(%llu|%llu|%d|[%@])"), v5, v6, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "stringWithFormat:", CFSTR("(%llu|%llu|%d|[%@])"), v5, v6, v7, CFSTR("~~"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v10;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)path
{
  return self->_path;
}

- (unint64_t)category
{
  return self->_category;
}

- (int)POSIXerrno
{
  return self->_POSIXerrno;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
}

- (MCMError)initWithErrorType:(unint64_t)a3 category:(unint64_t)a4
{
  return -[MCMError initWithErrorType:category:path:POSIXerrno:](self, "initWithErrorType:category:path:POSIXerrno:", a3, a4, 0, 0);
}

- (MCMError)initWithErrorType:(unint64_t)a3 category:(unint64_t)a4 path:(id)a5 POSIXerrno:(int)a6
{
  id v11;
  MCMError *v12;
  MCMError *v13;
  MCMError *v14;
  objc_super v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v11 = a5;
  if (a3 == 1)
  {
    v12 = 0;
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)MCMError;
    v13 = -[MCMError init](&v16, sel_init);
    v14 = v13;
    if (v13)
    {
      v13->_type = a3;
      v13->_category = a4;
      objc_storeStrong((id *)&v13->_path, a5);
      v14->_POSIXerrno = a6;
    }
    self = v14;
    v12 = self;
  }

  return v12;
}

- (MCMError)initWithErrorType:(unint64_t)a3
{
  return -[MCMError initWithErrorType:category:path:POSIXerrno:](self, "initWithErrorType:category:path:POSIXerrno:", a3, 0, 0, 0);
}

- (MCMError)initWithLibsystemError:(container_error_extended_s *)a3
{
  uint64_t type;
  uint64_t category;
  uint64_t posix_errno;
  uint64_t path;
  void *v8;
  MCMError *v9;

  if (a3)
  {
    type = container_error_get_type();
    category = container_error_get_category();
    posix_errno = container_error_get_posix_errno();
    path = container_error_get_path();
    if (path)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", path);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
    self = -[MCMError initWithErrorType:category:path:POSIXerrno:](self, "initWithErrorType:category:path:POSIXerrno:", type, category, v8, posix_errno);

    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (MCMError)init
{
  return -[MCMError initWithErrorType:category:path:POSIXerrno:](self, "initWithErrorType:category:path:POSIXerrno:", 1, 0, 0, 0);
}

- (MCMError)initWithNSError:(id)a3 url:(id)a4 defaultErrorType:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  MCMError *v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  MCMError *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  int v22;
  unint64_t v23;
  MCMError *v24;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    v18 = 0;
    goto LABEL_14;
  }
  objc_msgSend(v8, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqual:", *MEMORY[0x1E0CB2FE0]);

  if (v11)
  {
    objc_msgSend(v9, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v8, "code");
    v14 = self;
    v15 = a5;
    v16 = 1;
    v17 = v12;
LABEL_4:
    self = -[MCMError initWithErrorType:category:path:POSIXerrno:](v14, "initWithErrorType:category:path:POSIXerrno:", v15, v16, v17, v13);

    v18 = self;
    goto LABEL_14;
  }
  objc_msgSend(v8, "domain");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "isEqual:", *MEMORY[0x1E0CB28A8]))
  {
    v20 = objc_msgSend(v8, "code");

    if (v20 == 2048)
    {
      objc_msgSend(v9, "path");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = self;
      v15 = a5;
      v16 = 5;
      v17 = v12;
      v13 = 100;
      goto LABEL_4;
    }
  }
  else
  {

  }
  objc_msgSend(v8, "domain");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "isEqual:", CFSTR("MCMErrorDomain"));

  if (v22)
  {
    v23 = objc_msgSend(v8, "code");
    v24 = self;
  }
  else
  {
    v24 = self;
    v23 = a5;
  }
  self = -[MCMError initWithErrorType:](v24, "initWithErrorType:", v23);
  v18 = self;
LABEL_14:

  return v18;
}

- (container_error_extended_s)libsystemError
{
  id v3;
  container_error_extended_s *v4;

  -[MCMError category](self, "category");
  -[MCMError type](self, "type");
  -[MCMError path](self, "path");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "fileSystemRepresentation");
  -[MCMError POSIXerrno](self, "POSIXerrno");
  v4 = (container_error_extended_s *)container_error_create();

  return v4;
}

- (id)fullDescription
{
  MCMLazyDescription *v3;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v3 = [MCMLazyDescription alloc];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __27__MCMError_fullDescription__block_invoke;
  v5[3] = &unk_1E8CB6800;
  v5[4] = self;
  return -[MCMLazyDescription initWithDescriber:](v3, "initWithDescriber:", v5);
}

- (unint64_t)hash
{
  unint64_t type;
  unint64_t category;

  type = self->_type;
  category = self->_category;
  return category ^ type ^ -[NSString hash](self->_path, "hash");
}

- (BOOL)isEqualToMCMError:(id)a3
{
  _QWORD *v4;
  NSString *path;
  BOOL v6;
  char v7;
  BOOL v8;

  v4 = a3;
  path = self->_path;
  if (!path)
    goto LABEL_4;
  if (!v4[4])
  {
    LOBYTE(path) = 0;
    goto LABEL_6;
  }
  LOBYTE(path) = -[NSString isEqualToString:](path, "isEqualToString:");
  if (self->_path)
  {
LABEL_6:
    v6 = 0;
    goto LABEL_7;
  }
LABEL_4:
  v6 = v4[4] == 0;
LABEL_7:
  if (self->_type == v4[2] && self->_category == v4[3])
  {
    v7 = path | v6;
    if (self->_POSIXerrno == *((_DWORD *)v4 + 2))
      v8 = v7;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  MCMError *v4;
  BOOL v5;

  v4 = (MCMError *)a3;
  v5 = self == v4;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = -[MCMError isEqualToMCMError:](self, "isEqualToMCMError:", v4);
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if (v5)
  {
    *(_QWORD *)(v5 + 16) = self->_type;
    *(_QWORD *)(v5 + 24) = self->_category;
    v7 = -[NSString copyWithZone:](self->_path, "copyWithZone:", a3);
    v8 = *(void **)(v6 + 32);
    *(_QWORD *)(v6 + 32) = v7;

    *(_DWORD *)(v6 + 8) = self->_POSIXerrno;
  }
  return (id)v6;
}

id __27__MCMError_fullDescription__block_invoke(uint64_t a1, char a2)
{
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 32);
  v8 = objc_msgSend(v7, "type");
  v9 = objc_msgSend(*(id *)(a1 + 32), "category");
  v10 = objc_msgSend(*(id *)(a1 + 32), "POSIXerrno");
  v11 = v10;
  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p; type = %llu, category = %llu, POSIX errno = %d, path = [%@]>"),
      v6,
      v7,
      v8,
      v9,
      v11,
      v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p; type = %llu, category = %llu, POSIX errno = %d, path = [%@]>"),
      v6,
      v7,
      v8,
      v9,
      v10,
      CFSTR("~~"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

@end
