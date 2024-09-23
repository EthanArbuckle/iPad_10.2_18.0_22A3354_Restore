@implementation HKQueryAnchor

+ (id)_anchorWithRowid:(int64_t)a3
{
  _QWORD *v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  v4[2] = a3;
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t rowid;
  id v5;

  rowid = self->_rowid;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", rowid, CFSTR("rowid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_clientToken, CFSTR("clientToken"));

}

- (int64_t)_rowid
{
  return self->_rowid;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKQueryAnchor)initWithCoder:(id)a3
{
  id v4;
  HKQueryAnchor *v5;
  uint64_t v6;
  NSString *clientToken;

  v4 = a3;
  v5 = (HKQueryAnchor *)objc_alloc_init((Class)objc_opt_class());

  if (v5)
  {
    v5->_rowid = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("rowid"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientToken"));
    v6 = objc_claimAutoreleasedReturnValue();
    clientToken = v5->_clientToken;
    v5->_clientToken = (NSString *)v6;

  }
  return v5;
}

+ (id)latestAnchor
{
  return (id)objc_msgSend(a1, "_anchorWithRowid:", 0x7FFFFFFFFFFFFFFFLL);
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  NSUInteger v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_rowid);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[NSString hash](self->_clientToken, "hash") ^ v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  HKQueryAnchor *v4;
  HKQueryAnchor *v5;
  NSString *clientToken;
  NSString *v7;
  char v8;

  v4 = (HKQueryAnchor *)a3;
  v5 = v4;
  if (v4 == self)
    goto LABEL_9;
  if (!v4)
    goto LABEL_8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || self->_rowid != v5->_rowid)
    goto LABEL_8;
  clientToken = self->_clientToken;
  v7 = v5->_clientToken;
  if (clientToken == v7)
  {
LABEL_9:
    v8 = 1;
    goto LABEL_10;
  }
  if (!v7)
  {
LABEL_8:
    v8 = 0;
    goto LABEL_10;
  }
  v8 = -[NSString isEqualToString:](clientToken, "isEqualToString:");
LABEL_10:

  return v8;
}

- (int64_t)compare:(id)a3
{
  int64_t rowid;
  int64_t v4;
  BOOL v5;
  int64_t v6;

  rowid = self->_rowid;
  v4 = *((_QWORD *)a3 + 2);
  v5 = rowid < v4;
  v6 = rowid > v4;
  if (v5)
    return -1;
  else
    return v6;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const char *v5;
  NSString *clientToken;
  const __CFString *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = " ";
  clientToken = self->_clientToken;
  if (!clientToken)
    v5 = "";
  v7 = &stru_1E37FD4C0;
  if (clientToken)
    v7 = (const __CFString *)self->_clientToken;
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %lld%s%@>"), v4, self->_rowid, v5, v7);
}

- (void)_setRowid:(int64_t)a3
{
  self->_rowid = a3;
}

- (NSString)_clientToken
{
  return self->_clientToken;
}

- (void)_setClientToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientToken, 0);
}

@end
