@implementation CLSCurationDebugItem

- (CLSCurationDebugItem)initWithItem:(id)a3
{
  id v5;
  CLSCurationDebugItem *v6;
  CLSCurationDebugItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CLSCurationDebugItem;
  v6 = -[CLSCurationDebugObject init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_item, a3);

  return v7;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CLSCurationDebugItem;
  -[CLSCurationDebugObject dictionaryRepresentation](&v15, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if ((-[CLSCurationItem clsIsInterestingSDOF](self->_item, "clsIsInterestingSDOF") & 1) != 0
    || -[CLSCurationItem clsIsInterestingHDR](self->_item, "clsIsInterestingHDR"))
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("isSDOFOrHDR"));
  }
  if (-[CLSCurationItem isFavorite](self->_item, "isFavorite"))
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("isFavorite"));
  if (-[CLSCurationItem clsIsUtility](self->_item, "clsIsUtility"))
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("isUtility"));
  if (-[CLSCurationItem clsIsBlurry](self->_item, "clsIsBlurry"))
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("isBlurry"));
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[CLSCurationItem clsAestheticScore](self->_item, "clsAestheticScore");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("aestheticScore"));

  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[CLSCurationItem clsContentScore](self->_item, "clsContentScore");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("contentScore"));

  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[CLSCurationItem clsIconicScore](self->_item, "clsIconicScore");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("iconicScore"));

  if (self->_dedupingType)
  {
    objc_msgSend((id)objc_opt_class(), "stringForDedupingType:", self->_dedupingType);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("dedupingType"));

    -[CLSCurationDebugItem item](self->_dedupedDebugItem, "item");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "clsIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("dedupedItemIdentifier"));

  }
  return v4;
}

- (id)timestamp
{
  return (id)-[CLSCurationItem cls_universalDate](self->_item, "cls_universalDate");
}

- (id)identifier
{
  return (id)-[CLSCurationItem clsIdentifier](self->_item, "clsIdentifier");
}

- (void)dupeToDebugItem:(id)a3 withDedupingType:(unint64_t)a4
{
  id v7;
  uint8_t v8[16];

  v7 = a3;
  if (-[CLSCurationDebugObject state](self, "state") == 2)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_error_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Item is already rejected, can't dupe it", v8, 2u);
    }
  }
  else
  {
    self->_dedupingType = a4;
    objc_storeStrong((id *)&self->_dedupedDebugItem, a3);
  }

}

- (CLSCurationItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->_item, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_dedupedDebugItem, 0);
}

+ (id)stringForDedupingType:(unint64_t)a3
{
  if (a3 > 5)
    return CFSTR("Invalid Type");
  else
    return off_1E84F92A0[a3];
}

@end
