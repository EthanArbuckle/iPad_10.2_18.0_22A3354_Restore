@implementation ICDrawingCommand

- (ICDrawingCommand)initWithCommand:(id)a3 hidden:(BOOL)a4 timestamp:(TopoID)a5
{
  unsigned int clock;
  NSUUID *replicaID;
  id v10;
  ICDrawingCommand *v11;
  ICDrawingCommand *v12;
  objc_super v14;

  clock = a5.clock;
  replicaID = a5.replicaID;
  v10 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ICDrawingCommand;
  v11 = -[ICDrawingCommand init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_data, a3);
    v12->_hidden = a4;
    objc_storeStrong((id *)&v12->_timestamp.replicaID, replicaID);
    v12->_timestamp.clock = clock;
  }

  return v12;
}

- (BOOL)isEqualDrawingCommand:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[ICDrawingCommand data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[ICDrawingCommand isEqualDrawingCommand:](self, "isEqualDrawingCommand:", v4);

  return v5;
}

- (unint64_t)hash
{
  return -[ICDrawingCommandData hash](self->_data, "hash");
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  unsigned int v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL4 v10;
  const __CFString *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ICDrawingCommandData type](self->_data, "type");
  v7 = -[ICDrawingCommandData points](self->_data, "points");
  v9 = *v7;
  v8 = v7[1];
  v10 = -[ICDrawingCommand hidden](self, "hidden");
  v11 = &stru_1E76DB108;
  if (v10)
    v11 = CFSTR(" hidden");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p type=%ld points=%ld%@>"), v5, self, v6, (v8 - v9) >> 6, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (ICDrawingCommandData)data
{
  return self->_data;
}

- (BOOL)hidden
{
  return self->_hidden;
}

- (TopoID)timestamp
{
  NSUUID *v3;
  uint64_t clock;
  TopoID result;

  v3 = self->_timestamp.replicaID;
  clock = self->_timestamp.clock;
  result.clock = clock;
  result.replicaID = v3;
  return result;
}

- (void).cxx_destruct
{

  objc_storeStrong((id *)&self->_data, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  return self;
}

- (ICDrawingCommand)initWithArchive:(const void *)a3 version:(unsigned int)a4 sortedUUIDs:(id)a5
{
  uint64_t v5;
  drawing::Command *v8;
  drawing::Command *v9;
  uint64_t v10;
  unint64_t v11;
  drawing::Command *v12;
  ICDrawingCommand *v13;
  uint64_t v14;
  drawing::Command *v15;
  drawing::Command *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  ICDrawingCommandData *v20;
  drawing::Command *v21;
  drawing::Command *v22;
  ICDrawingCommand *v23;

  v5 = *(_QWORD *)&a4;
  v8 = (drawing::Command *)a5;
  v9 = v8;
  v10 = *((_QWORD *)a3 + 11);
  if (!v10)
    v10 = *(_QWORD *)(drawing::Command::default_instance(v8) + 88);
  v11 = *(unsigned int *)(v10 + 48);
  v12 = (drawing::Command *)-[drawing::Command count](v9, "count");
  if ((unint64_t)v12 >= v11)
  {
    v14 = *((_QWORD *)a3 + 11);
    if (!v14)
      v14 = *(_QWORD *)(drawing::Command::default_instance(v12) + 88);
    -[drawing::Command objectAtIndexedSubscript:](v9, "objectAtIndexedSubscript:", *(unsigned int *)(v14 + 48));
    v15 = (drawing::Command *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = *((_QWORD *)a3 + 11);
    if (!v17)
      v17 = *(_QWORD *)(drawing::Command::default_instance(v15) + 88);
    v18 = *(unsigned int *)(v17 + 40);
    v19 = *((_DWORD *)a3 + 8);
    v20 = -[ICDrawingCommandData initWithArchive:version:sortedUUIDs:]([ICDrawingCommandData alloc], "initWithArchive:version:sortedUUIDs:", a3, v5, v9);
    v21 = v16;
    v22 = v21;
    if (self)
    {
      v23 = -[ICDrawingCommand initWithCommand:hidden:timestamp:](self, "initWithCommand:hidden:timestamp:", v20, (v19 & 0x40) == 0, v21, v18);
    }
    else
    {

      v23 = 0;
    }
    self = v23;

    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (unsigned)saveToArchive:(void *)a3 sortedUUIDs:(id)a4 withPathData:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  drawing::CommandID *v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  drawing::CommandID *v14;
  void *v15;

  v5 = a5;
  v8 = a4;
  *((_DWORD *)a3 + 8) |= 0x20u;
  v9 = (drawing::CommandID *)*((_QWORD *)a3 + 11);
  if (!v9)
  {
    v9 = (drawing::CommandID *)operator new();
    drawing::CommandID::CommandID(v9);
    *((_QWORD *)a3 + 11) = v9;
  }
  v10 = (void *)-[ICDrawingCommand timestamp](self, "timestamp");
  *((_DWORD *)v9 + 8) |= 1u;
  *((_DWORD *)v9 + 10) = v11;

  v12 = (void *)-[ICDrawingCommand timestamp](self, "timestamp");
  v13 = objc_msgSend(v8, "indexOfObject:", v12);

  *((_DWORD *)a3 + 8) |= 0x20u;
  v14 = (drawing::CommandID *)*((_QWORD *)a3 + 11);
  if (!v14)
  {
    v14 = (drawing::CommandID *)operator new();
    drawing::CommandID::CommandID(v14);
    *((_QWORD *)a3 + 11) = v14;
  }
  *((_DWORD *)v14 + 8) |= 4u;
  *((_DWORD *)v14 + 12) = v13;
  -[ICDrawingCommand data](self, "data");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "saveToArchive:sortedUUIDs:withPathData:isHidden:", a3, v8, v5, -[ICDrawingCommand hidden](self, "hidden"));

  return 1;
}

@end
