@implementation BRInodeObjectID

- (BRInodeObjectID)initWithFileID:(unint64_t)a3
{
  BRInodeObjectID *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BRInodeObjectID;
  result = -[BRInodeObjectID init](&v5, sel_init);
  if (result)
    result->_ino = a3;
  return result;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<ino %llx>"), self->_ino);
}

- (id)asString
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("i%llx"), self->_ino);
}

- (unint64_t)rawID
{
  return self->_ino;
}

- (id)folderID
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_ino);
}

- (BOOL)isFolderOrAliasID
{
  return 1;
}

- (unsigned)type
{
  return 3;
}

- (BOOL)isFpfsItem
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInt64:forKey:", self->_ino, CFSTR("v"));
}

- (BRInodeObjectID)initWithCoder:(id)a3
{
  id v4;
  BRInodeObjectID *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)BRInodeObjectID;
  v5 = -[BRInodeObjectID init](&v7, sel_init);
  if (v5)
    v5->_ino = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("v"));

  return v5;
}

@end
