@implementation NSDocInfo

- (id)initFromInfo:(stat *)a3
{
  id result;
  mode_t st_mode;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)NSDocInfo;
  result = -[NSDocInfo init](&v6, sel_init);
  *((_QWORD *)result + 1) = a3->st_mtimespec.tv_sec;
  st_mode = a3->st_mode;
  *((_WORD *)result + 8) = st_mode;
  *((_WORD *)result + 9) = *((_WORD *)result + 9) & 0xFFFA | ((st_mode & 0xF000) == 0x4000) | (4
                                                                                             * ((st_mode & 0xF000) == 40960));
  return result;
}

- (void)setFileAttributes:(id)a3
{
  void *v5;
  double v6;
  int64_t v7;
  unsigned __int16 v8;
  void *v9;
  void *v10;
  __int16 v11;

  if (!a3)
  {
    self->time = 0;
    self->mode = 0;
    v8 = *(&self->mode + 1) & 0xFFF8;
LABEL_11:
    *(&self->mode + 1) = v8;
    return;
  }
  v5 = (void *)objc_msgSend(a3, "fileModificationDate");
  if (v5)
  {
    objc_msgSend(v5, "timeIntervalSince1970");
    v7 = (uint64_t)v6;
  }
  else
  {
    v7 = 0;
  }
  self->time = v7;
  self->mode = objc_msgSend(a3, "filePosixPermissions");
  v9 = (void *)objc_msgSend(a3, "fileType");
  if (v9)
  {
    v10 = v9;
    *(&self->mode + 1) = *(&self->mode + 1) & 0xFFFE | objc_msgSend(v9, "isEqualToString:", CFSTR("NSFileTypeDirectory"));
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("NSFileTypeSymbolicLink")))
      v11 = 4;
    else
      v11 = 0;
    v8 = *(&self->mode + 1) & 0xFFF9 | v11;
    goto LABEL_11;
  }
}

- (NSDocInfo)initWithFileAttributes:(id)a3
{
  NSDocInfo *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)NSDocInfo;
  v4 = -[NSDocInfo init](&v6, sel_init);
  -[NSDocInfo setFileAttributes:](v4, "setFileAttributes:", a3);
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return NSCopyObject(self, 0, a3);
}

- (id)copy
{
  return -[NSDocInfo copyWithZone:](self, "copyWithZone:", 0);
}

@end
