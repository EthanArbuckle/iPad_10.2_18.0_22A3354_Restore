@implementation BCSShardIdentifier

+ (BCSShardIdentifier)identifierWithType:(int64_t)a3 startIndex:(int64_t)a4 shardCount:
{
  BCSShardIdentifier *v7;
  objc_super v9;

  objc_opt_self();
  v7 = [BCSShardIdentifier alloc];
  if (v7)
  {
    v9.receiver = v7;
    v9.super_class = (Class)BCSShardIdentifier;
    v7 = (BCSShardIdentifier *)objc_msgSendSuper2(&v9, sel_init);
    if (v7)
    {
      v7->_type = a2;
      v7->_startIndex = a3;
      v7->_shardCount = a4;
    }
  }
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  int64_t v10;
  id v11;
  id v12;
  int64_t v13;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BE0BE20], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[BCSShardIdentifier startIndex](self, "startIndex");
  v7 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __30__BCSShardIdentifier_isEqual___block_invoke;
  v21[3] = &unk_24C39C008;
  v8 = v4;
  v22 = v8;
  v9 = (id)objc_msgSend(v5, "appendInteger:counterpart:", v6, v21);
  v10 = -[BCSShardIdentifier type](self, "type");
  v19[0] = v7;
  v19[1] = 3221225472;
  v19[2] = __30__BCSShardIdentifier_isEqual___block_invoke_2;
  v19[3] = &unk_24C39C008;
  v11 = v8;
  v20 = v11;
  v12 = (id)objc_msgSend(v5, "appendInteger:counterpart:", v10, v19);
  v13 = -[BCSShardIdentifier shardCount](self, "shardCount");
  v17[0] = v7;
  v17[1] = 3221225472;
  v17[2] = __30__BCSShardIdentifier_isEqual___block_invoke_3;
  v17[3] = &unk_24C39C008;
  v18 = v11;
  v14 = v11;
  v15 = (id)objc_msgSend(v5, "appendInteger:counterpart:", v13, v17);
  LOBYTE(v13) = objc_msgSend(v5, "isEqual");

  return v13;
}

uint64_t __30__BCSShardIdentifier_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startIndex");
}

uint64_t __30__BCSShardIdentifier_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "type");
}

uint64_t __30__BCSShardIdentifier_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "shardCount");
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x24BE0BE28], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendInteger:", -[BCSShardIdentifier startIndex](self, "startIndex"));
  v5 = (id)objc_msgSend(v3, "appendInteger:", -[BCSShardIdentifier type](self, "type"));
  v6 = (id)objc_msgSend(v3, "appendInteger:", -[BCSShardIdentifier shardCount](self, "shardCount"));
  v7 = objc_msgSend(v3, "hash");

  return v7;
}

- (NSString)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendInteger:withName:", -[BCSShardIdentifier type](self, "type"), CFSTR("type"));
  v5 = (id)objc_msgSend(v3, "appendInt64:withName:", -[BCSShardIdentifier startIndex](self, "startIndex"), CFSTR("startIndex"));
  v6 = (id)objc_msgSend(v3, "appendInt64:withName:", -[BCSShardIdentifier shardCount](self, "shardCount"), CFSTR("shardCount"));
  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BCSShardIdentifier *v4;
  int64_t v5;
  int64_t v6;
  int64_t v7;
  int64_t v8;
  id result;
  objc_super v10;

  v4 = +[BCSShardIdentifier allocWithZone:](BCSShardIdentifier, "allocWithZone:", a3);
  v5 = -[BCSShardIdentifier type](self, "type");
  v6 = -[BCSShardIdentifier startIndex](self, "startIndex");
  v7 = -[BCSShardIdentifier shardCount](self, "shardCount");
  if (!v4)
    return 0;
  v8 = v7;
  v10.receiver = v4;
  v10.super_class = (Class)BCSShardIdentifier;
  result = -[BCSShardIdentifier init](&v10, sel_init);
  if (result)
  {
    *((_QWORD *)result + 1) = v5;
    *((_QWORD *)result + 2) = v6;
    *((_QWORD *)result + 3) = v8;
  }
  return result;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)startIndex
{
  return self->_startIndex;
}

- (void)setStartIndex:(int64_t)a3
{
  self->_startIndex = a3;
}

- (int64_t)shardCount
{
  return self->_shardCount;
}

- (void)setShardCount:(int64_t)a3
{
  self->_shardCount = a3;
}

@end
