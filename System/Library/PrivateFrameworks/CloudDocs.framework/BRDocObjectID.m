@implementation BRDocObjectID

- (BRDocObjectID)initWithDocIDNumber:(id)a3
{
  return -[BRDocObjectID initWithDocID:](self, "initWithDocID:", objc_msgSend(a3, "unsignedIntValue"));
}

- (BRDocObjectID)initWithDocID:(unsigned int)a3
{
  BRDocObjectID *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BRDocObjectID;
  result = -[BRDocObjectID init](&v5, sel_init);
  if (result)
    result->_docID = a3;
  return result;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<doc-id %x>"), self->_docID);
}

- (id)asString
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("d%x"), self->_docID);
}

- (unint64_t)rawID
{
  return self->_docID;
}

- (id)documentID
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_docID);
}

- (BOOL)isDocumentID
{
  return 1;
}

- (unsigned)type
{
  return 2;
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
  objc_msgSend(a3, "encodeInt32:forKey:", self->_docID, CFSTR("v"));
}

- (BRDocObjectID)initWithCoder:(id)a3
{
  id v4;
  BRDocObjectID *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)BRDocObjectID;
  v5 = -[BRDocObjectID init](&v7, sel_init);
  if (v5)
    v5->_docID = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("v"));

  return v5;
}

@end
