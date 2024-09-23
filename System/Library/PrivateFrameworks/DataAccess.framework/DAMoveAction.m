@implementation DAMoveAction

- (DAMoveAction)initWithItemChangeType:(unint64_t)a3 changedItem:(id)a4 sourceContainerId:(id)a5 sourceServerId:(id)a6 destinationContainerId:(id)a7
{
  id v12;
  id v13;
  id v14;
  DAMoveAction *v15;
  DAMoveAction *v16;
  objc_super v18;

  v12 = a5;
  v13 = a6;
  v14 = a7;
  v18.receiver = self;
  v18.super_class = (Class)DAMoveAction;
  v15 = -[DAAction initWithItemChangeType:changedItem:serverId:](&v18, sel_initWithItemChangeType_changedItem_serverId_, a3, a4, 0);
  v16 = v15;
  if (v15)
  {
    -[DAMoveAction setSourceContainerId:](v15, "setSourceContainerId:", v12);
    -[DAMoveAction setSourceServerId:](v16, "setSourceServerId:", v13);
    -[DAMoveAction setDestinationContainerId:](v16, "setDestinationContainerId:", v14);
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DAMoveAction)initWithCoder:(id)a3
{
  id v5;
  DAMoveAction *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  objc_super v12;

  v5 = a3;
  if ((objc_msgSend(v5, "allowsKeyedCoding") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DAAction.m"), 140, CFSTR("Who does non-keyed coding nowadays?"));

  }
  v12.receiver = self;
  v12.super_class = (Class)DAMoveAction;
  v6 = -[DAAction initWithCoder:](&v12, sel_initWithCoder_, v5);
  if (v6)
  {
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DAASourceContainerId"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAMoveAction setSourceContainerId:](v6, "setSourceContainerId:", v7);

    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DAASourceServerId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAMoveAction setSourceServerId:](v6, "setSourceServerId:", v8);

    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DAADestinationContainerId"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAMoveAction setDestinationContainerId:](v6, "setDestinationContainerId:", v9);

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v5 = a3;
  if ((objc_msgSend(v5, "allowsKeyedCoding") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DAAction.m"), 151, CFSTR("Who does non-keyed coding nowadays?"));

  }
  v10.receiver = self;
  v10.super_class = (Class)DAMoveAction;
  -[DAAction encodeWithCoder:](&v10, sel_encodeWithCoder_, v5);
  -[DAMoveAction sourceContainerId](self, "sourceContainerId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("DAASourceContainerId"));

  -[DAMoveAction sourceServerId](self, "sourceServerId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("DAASourceServerId"));

  -[DAMoveAction destinationContainerId](self, "destinationContainerId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("DAADestinationContainerId"));

}

- (NSString)sourceContainerId
{
  return self->_sourceContainerId;
}

- (void)setSourceContainerId:(id)a3
{
  objc_storeStrong((id *)&self->_sourceContainerId, a3);
}

- (NSString)sourceServerId
{
  return self->_sourceServerId;
}

- (void)setSourceServerId:(id)a3
{
  objc_storeStrong((id *)&self->_sourceServerId, a3);
}

- (NSString)destinationContainerId
{
  return self->_destinationContainerId;
}

- (void)setDestinationContainerId:(id)a3
{
  objc_storeStrong((id *)&self->_destinationContainerId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationContainerId, 0);
  objc_storeStrong((id *)&self->_sourceServerId, 0);
  objc_storeStrong((id *)&self->_sourceContainerId, 0);
}

@end
