@implementation DSFileOperation

+ (BOOL)dateIsBusyFolderDate:(double)a3
{
  return a3 == -3061152000.0 || a3 == -534528000.0;
}

- (DSFileOperation)init
{
  DSFileOperation *v2;
  DSFileOperationID *v3;
  DSFileOperationID *operationID;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DSFileOperation;
  v2 = -[DSFileOperation init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(DSFileOperationID);
    operationID = v2->_operationID;
    v2->_operationID = v3;

  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  DSFileOperationID *operationID;
  void *v5;
  NSDate *dateStarted;
  void *v7;
  UTType *utType;
  void *v9;
  id v10;

  v10 = a3;
  operationID = self->_operationID;
  NSStringFromSelector(sel_operationID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", operationID, v5);

  dateStarted = self->_dateStarted;
  NSStringFromSelector(sel_dateStarted);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", dateStarted, v7);

  utType = self->_utType;
  NSStringFromSelector(sel_utType);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", utType, v9);

}

- (DSFileOperation)initWithCoder:(id)a3
{
  id v4;
  DSFileOperation *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  DSFileOperationID *operationID;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSDate *dateStarted;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  UTType *utType;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)DSFileOperation;
  v5 = -[DSFileOperation init](&v19, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_operationID);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    operationID = v5->_operationID;
    v5->_operationID = (DSFileOperationID *)v8;

    v10 = objc_opt_class();
    NSStringFromSelector(sel_dateStarted);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    dateStarted = v5->_dateStarted;
    v5->_dateStarted = (NSDate *)v12;

    v14 = objc_opt_class();
    NSStringFromSelector(sel_utType);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    utType = v5->_utType;
    v5->_utType = (UTType *)v16;

  }
  return v5;
}

- (unint64_t)hash
{
  return -[DSFileOperationID hash](self->_operationID, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id *v4;
  char v5;

  v4 = (id *)a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v5 = objc_msgSend(v4[1], "isEqual:", self->_operationID);
  else
    v5 = 0;

  return v5;
}

- (DSFileOperationID)operationID
{
  return self->_operationID;
}

- (void)setOperationID:(id)a3
{
  objc_storeStrong((id *)&self->_operationID, a3);
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
  objc_storeStrong((id *)&self->_progress, a3);
}

- (NSDate)dateStarted
{
  return self->_dateStarted;
}

- (void)setDateStarted:(id)a3
{
  objc_storeStrong((id *)&self->_dateStarted, a3);
}

- (UTType)utType
{
  return self->_utType;
}

- (void)setUtType:(id)a3
{
  objc_storeStrong((id *)&self->_utType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utType, 0);
  objc_storeStrong((id *)&self->_dateStarted, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_operationID, 0);
}

@end
