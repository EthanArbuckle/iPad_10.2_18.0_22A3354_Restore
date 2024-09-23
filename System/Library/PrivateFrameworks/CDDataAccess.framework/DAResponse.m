@implementation DAResponse

- (DAResponse)initWithItemChangeType:(unint64_t)a3 changedItem:(id)a4 serverId:(id)a5 status:(int64_t)a6
{
  DAResponse *v7;
  DAResponse *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)DAResponse;
  v7 = -[DAAction initWithItemChangeType:changedItem:serverId:](&v10, sel_initWithItemChangeType_changedItem_serverId_, a3, a4, a5);
  v8 = v7;
  if (v7)
    -[DAResponse setStatus:](v7, "setStatus:", a6);
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DAResponse)initWithCoder:(id)a3
{
  id v5;
  DAResponse *v6;
  void *v8;
  objc_super v9;

  v5 = a3;
  if ((objc_msgSend(v5, "allowsKeyedCoding") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DAAction.m"), 193, CFSTR("Who does non-keyed coding nowadays?"));

  }
  v9.receiver = self;
  v9.super_class = (Class)DAResponse;
  v6 = -[DAAction initWithCoder:](&v9, sel_initWithCoder_, v5);
  if (v6)
    -[DAResponse setStatus:](v6, "setStatus:", (int)objc_msgSend(v5, "decodeIntForKey:", CFSTR("DARStatus")));

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v5;
  void *v6;
  objc_super v7;

  v5 = a3;
  if ((objc_msgSend(v5, "allowsKeyedCoding") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DAAction.m"), 202, CFSTR("Who does non-keyed coding nowadays?"));

  }
  v7.receiver = self;
  v7.super_class = (Class)DAResponse;
  -[DAAction encodeWithCoder:](&v7, sel_encodeWithCoder_, v5);
  objc_msgSend(v5, "encodeInt:forKey:", -[DAResponse status](self, "status"), CFSTR("DARStatus"));

}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

@end
