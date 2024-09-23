@implementation IKFolder

- (IKFolder)init
{
  return -[IKFolder initWithFolderID:](self, "initWithFolderID:", 0x7FFFFFFFFFFFFFFFLL);
}

- (IKFolder)initWithFolderID:(int64_t)a3
{
  IKFolder *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IKFolder;
  result = -[IKFolder init](&v5, sel_init);
  if (result)
  {
    result->_folderID = a3;
    result->_title = 0;
    result->_syncToMobile = 0;
    result->_position = 0;
  }
  return result;
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %@ (%ld)>"), NSStringFromClass(v4), -[IKFolder title](self, "title"), -[IKFolder folderID](self, "folderID"));
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IKFolder;
  -[IKFolder dealloc](&v3, sel_dealloc);
}

- (int64_t)folderID
{
  return self->_folderID;
}

- (void)setFolderID:(int64_t)a3
{
  self->_folderID = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)syncToMobile
{
  return self->_syncToMobile;
}

- (void)setSyncToMobile:(BOOL)a3
{
  self->_syncToMobile = a3;
}

- (unint64_t)position
{
  return self->_position;
}

- (void)setPosition:(unint64_t)a3
{
  self->_position = a3;
}

+ (id)unreadFolder
{
  return (id)objc_msgSend(a1, "folderWithFolderID:", -1);
}

+ (id)starredFolder
{
  return (id)objc_msgSend(a1, "folderWithFolderID:", -2);
}

+ (id)archiveFolder
{
  return (id)objc_msgSend(a1, "folderWithFolderID:", -3);
}

+ (id)folderWithFolderID:(int64_t)a3
{
  return -[IKFolder initWithFolderID:]([IKFolder alloc], "initWithFolderID:", a3);
}

@end
