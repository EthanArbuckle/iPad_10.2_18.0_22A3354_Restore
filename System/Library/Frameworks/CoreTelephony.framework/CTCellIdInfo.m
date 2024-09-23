@implementation CTCellIdInfo

+ (id)cellIdInfoFromCellId:(unint64_t)a3 baseId:(int)a4
{
  uint64_t v4;
  CTCellIdInfo *v6;
  uint64_t v7;
  NSNumber *cellId;
  uint64_t v9;
  NSNumber *baseId;

  v4 = *(_QWORD *)&a4;
  v6 = objc_alloc_init(CTCellIdInfo);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
    v7 = objc_claimAutoreleasedReturnValue();
    cellId = v6->_cellId;
    v6->_cellId = (NSNumber *)v7;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
    v9 = objc_claimAutoreleasedReturnValue();
    baseId = v6->_baseId;
    v6->_baseId = (NSNumber *)v9;

  }
  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTCellIdInfo cellId](self, "cellId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", cellId=%@"), v4);

  -[CTCellIdInfo baseId](self, "baseId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", baseId=%@"), v5);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[CTCellIdInfo cellId](self, "cellId");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v4[1];
  v4[1] = v5;

  -[CTCellIdInfo baseId](self, "baseId");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v4[2];
  v4[2] = v7;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CTCellIdInfo cellId](self, "cellId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("cellId"));

  -[CTCellIdInfo baseId](self, "baseId");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("baseId"));

}

- (CTCellIdInfo)initWithCoder:(id)a3
{
  id v4;
  CTCellIdInfo *v5;
  uint64_t v6;
  NSNumber *cellId;
  uint64_t v8;
  NSNumber *baseId;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTCellIdInfo;
  v5 = -[CTCellIdInfo init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cellId"));
    v6 = objc_claimAutoreleasedReturnValue();
    cellId = v5->_cellId;
    v5->_cellId = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("baseId"));
    v8 = objc_claimAutoreleasedReturnValue();
    baseId = v5->_baseId;
    v5->_baseId = (NSNumber *)v8;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSNumber)cellId
{
  return self->_cellId;
}

- (NSNumber)baseId
{
  return self->_baseId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseId, 0);
  objc_storeStrong((id *)&self->_cellId, 0);
}

@end
