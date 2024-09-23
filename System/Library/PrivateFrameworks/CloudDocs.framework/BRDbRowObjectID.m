@implementation BRDbRowObjectID

- (unsigned)type
{
  return self->_type;
}

- (unint64_t)rawID
{
  return self->_rowId;
}

- (BRDbRowObjectID)initWithRowID:(unint64_t)a3 type:(unsigned __int8)a4
{
  BRDbRowObjectID *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BRDbRowObjectID;
  result = -[BRDbRowObjectID init](&v7, sel_init);
  if (result)
  {
    result->_rowId = a3;
    result->_type = a4;
  }
  return result;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[BRDbRowObjectID asString](self, "asString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<%@>"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)asString
{
  id *v3;
  id v4;

  if (-[BRFileObjectID isRootContainerItem](self, "isRootContainerItem"))
  {
    v3 = (id *)MEMORY[0x1E0CAABA8];
  }
  else
  {
    if (!-[BRFileObjectID isCloudDocsRoot](self, "isCloudDocsRoot"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%c%llx"), +[BRFileObjectTypeConverter toChar:](BRFileObjectTypeConverter, "toChar:", self->_type), self->_rowId);
      v4 = (id)objc_claimAutoreleasedReturnValue();
      return v4;
    }
    v3 = (id *)MEMORY[0x1E0CAAB30];
  }
  v4 = *v3;
  return v4;
}

- (id)folderID
{
  void *v2;
  NSObject *v3;

  brc_bread_crumbs((uint64_t)"-[BRDbRowObjectID folderID]", 238);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    -[BRDbRowObjectID folderID].cold.1();

  return 0;
}

- (id)documentID
{
  void *v2;
  NSObject *v3;

  brc_bread_crumbs((uint64_t)"-[BRDbRowObjectID documentID]", 244);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    -[BRDbRowObjectID documentID].cold.1();

  return 0;
}

- (id)itemDBRowID
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_rowId);
}

- (BOOL)isFpfsItem
{
  if (self->_type == 1)
    return BRIsFPFSEnabled(self, a2);
  else
    return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t rowId;
  id v5;

  rowId = self->_rowId;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", rowId, CFSTR("r"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_type, CFSTR("t"));

}

- (BRDbRowObjectID)initWithCoder:(id)a3
{
  id v4;
  BRDbRowObjectID *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)BRDbRowObjectID;
  v5 = -[BRDbRowObjectID init](&v7, sel_init);
  if (v5)
  {
    v5->_rowId = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("r"));
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("t"));
  }

  return v5;
}

- (void)folderID
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] UNREACHABLE: asked the folderID of a BRDbRowObjectID item%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)documentID
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] UNREACHABLE: asked the documentID of a BRDbRowObjectID item%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
