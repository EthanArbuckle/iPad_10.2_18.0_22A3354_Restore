@implementation _FPLocationAgnosticID

- (_FPLocationAgnosticID)initWithItemID:(id)a3
{
  id v5;
  _FPLocationAgnosticID *v6;
  _FPLocationAgnosticID *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_FPLocationAgnosticID;
  v6 = -[_FPLocationAgnosticID init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_itemID, a3);

  return v7;
}

- (_FPLocationAgnosticID)initWithItem:(id)a3
{
  id v4;
  _FPLocationAgnosticID *v5;
  uint64_t v6;
  FPItemID *itemID;
  uint64_t v8;
  FPItemID *alternateID;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_FPLocationAgnosticID;
  v5 = -[_FPLocationAgnosticID init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "itemID");
    v6 = objc_claimAutoreleasedReturnValue();
    itemID = v5->_itemID;
    v5->_itemID = (FPItemID *)v6;

    objc_msgSend(v4, "formerItemID");
    v8 = objc_claimAutoreleasedReturnValue();
    alternateID = v5->_alternateID;
    v5->_alternateID = (FPItemID *)v8;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _FPLocationAgnosticID *v4;
  _FPLocationAgnosticID *v5;
  BOOL v6;
  _FPLocationAgnosticID *v7;

  v4 = (_FPLocationAgnosticID *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_12;
  if (v4 == self)
  {
LABEL_5:
    v6 = 1;
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (!-[FPItemID isEqual:](self->_itemID, "isEqual:", v5))
    {
      v6 = -[FPItemID isEqual:](self->_alternateID, "isEqual:", v5);
      goto LABEL_13;
    }
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_12:
    v6 = 0;
    goto LABEL_13;
  }
  v7 = v5;
  v6 = -[FPItemID isEqual:](self->_itemID, "isEqual:", v7->_itemID)
    || -[FPItemID isEqual:](self->_itemID, "isEqual:", v7->_alternateID)
    || -[FPItemID isEqual:](self->_alternateID, "isEqual:", v7->_itemID)
    || -[FPItemID isEqual:](self->_alternateID, "isEqual:", v7->_alternateID);

LABEL_13:
  return v6;
}

- (unint64_t)hash
{
  void *v2;
  NSObject *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("This object is not hashable"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_fault_impl(&dword_1A0A34000, v3, OS_LOG_TYPE_FAULT, "[CRIT] %{public}@", (uint8_t *)&v4, 0xCu);
  }

  __assert_rtn("-[_FPLocationAgnosticID hash]", "/Library/Caches/com.apple.xbs/Sources/FileProvider/fileproviderd/action operation engine/FPActionOperationLocator.m", 365, (const char *)objc_msgSend(objc_retainAutorelease(v2), "UTF8String"));
}

- (id)description
{
  FPItemID *alternateID;

  alternateID = self->_alternateID;
  if (alternateID)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ alt:%@"), self->_itemID, alternateID);
  else
    -[FPItemID description](self->_itemID, "description");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateID, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
}

@end
