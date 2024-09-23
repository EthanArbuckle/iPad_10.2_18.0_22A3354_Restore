@implementation ICTTTodo

- (ICTTTodo)init
{
  void *v3;
  ICTTTodo *v4;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ICTTTodo initWithIdentifier:done:](self, "initWithIdentifier:done:", v3, 0);

  return v4;
}

- (ICTTTodo)initWithIdentifier:(id)a3 done:(BOOL)a4
{
  id v7;
  ICTTTodo *v8;
  ICTTTodo *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICTTTodo;
  v8 = -[ICTTTodo init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_uuid, a3);
    v9->_done = a4;
  }

  return v9;
}

- (ICTTTodo)todoWithDone:(BOOL)a3
{
  _BOOL8 v3;
  ICTTTodo *v5;
  void *v6;
  ICTTTodo *v7;

  v3 = a3;
  if (-[ICTTTodo done](self, "done") == a3)
  {
    v7 = self;
  }
  else
  {
    v5 = [ICTTTodo alloc];
    -[ICTTTodo uuid](self, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[ICTTTodo initWithIdentifier:done:](v5, "initWithIdentifier:done:", v6, v3);

  }
  return v7;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTTTodo uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICTTTodo done](self, "done"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, uuid: %@, done: %@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  int v9;

  if (a3 == self)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    v4 = a3;
    objc_opt_class();
    ICDynamicCast();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICTTTodo uuid](self, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v7))
    {
      v8 = -[ICTTTodo done](self, "done");
      v9 = v8 ^ objc_msgSend(v5, "done") ^ 1;
    }
    else
    {
      LOBYTE(v9) = 0;
    }

  }
  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[ICTTTodo done](self, "done");
  -[ICTTTodo uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (BOOL)done
{
  return self->_done;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (ICTTTodo)initWithData:(id)a3
{
  id v4;
  id v5;
  char *v6;
  int v7;
  ICTTTodo *v8;
  NSObject *v9;
  _BYTE v11[56];

  v4 = a3;
  topotext::Todo::Todo((topotext::Todo *)v11);
  v5 = objc_retainAutorelease(v4);
  v6 = (char *)objc_msgSend(v5, "bytes");
  v7 = ICTTBoundedCheckedCastNSUIntegerToUInt32(objc_msgSend(v5, "length"));
  if (google::protobuf::MessageLite::ParseFromArray((google::protobuf::MessageLite *)v11, v6, v7))
  {
    self = -[ICTTTodo initWithArchive:](self, "initWithArchive:", v11);
    v8 = self;
  }
  else
  {
    v9 = os_log_create("com.apple.notes", "Topotext");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[ICTTTodo(ICTTTodoPersistenceAdditions) initWithData:].cold.1(v9);

    v8 = 0;
  }
  topotext::Todo::~Todo((topotext::Todo *)v11);

  return v8;
}

- (ICTTTodo)initWithArchive:(const void *)a3
{
  id v5;
  uint64_t *v6;
  void *v7;
  ICTTTodo *v8;

  if ((~*((_DWORD *)a3 + 8) & 3) != 0)
  {
    v8 = 0;
  }
  else
  {
    v5 = objc_alloc(MEMORY[0x1E0CB3A28]);
    v6 = (uint64_t *)*((_QWORD *)a3 + 5);
    if (*((char *)v6 + 23) < 0)
      v6 = (uint64_t *)*v6;
    v7 = (void *)objc_msgSend(v5, "initWithUUIDBytes:", v6);
    v8 = -[ICTTTodo initWithIdentifier:done:]([ICTTTodo alloc], "initWithIdentifier:done:", v7, *((unsigned __int8 *)a3 + 48));

  }
  return v8;
}

- (void)saveToArchive:(void *)a3
{
  BOOL v5;
  void *v6;
  _QWORD *v7;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v5 = -[ICTTTodo done](self, "done");
  *((_DWORD *)a3 + 8) |= 2u;
  *((_BYTE *)a3 + 48) = v5;
  v8[0] = 0;
  v8[1] = 0;
  -[ICTTTodo uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getUUIDBytes:", v8);

  *((_DWORD *)a3 + 8) |= 1u;
  if (!google::protobuf::internal::empty_string_)
    -[ICTTParagraphStyle(ICTTParagraphStylePersistenceAdditions) saveToArchive:].cold.1();
  if (*((_QWORD *)a3 + 5) == google::protobuf::internal::empty_string_)
  {
    v7 = (_QWORD *)operator new();
    *v7 = 0;
    v7[1] = 0;
    v7[2] = 0;
    *((_QWORD *)a3 + 5) = v7;
  }
  MEMORY[0x1C3B7A7E8]();
}

- (id)serialize
{
  id v3;
  void *v4;
  int v5;
  _BYTE v7[56];

  topotext::Todo::Todo((topotext::Todo *)v7);
  -[ICTTTodo saveToArchive:](self, "saveToArchive:", v7);
  v3 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", (int)topotext::Todo::ByteSize((topotext::Todo *)v7)));
  v4 = (void *)objc_msgSend(v3, "mutableBytes");
  v5 = ICTTBoundedCheckedCastNSUIntegerToUInt32(objc_msgSend(v3, "length"));
  google::protobuf::MessageLite::SerializeToArray((google::protobuf::MessageLite *)v7, v4, v5);
  topotext::Todo::~Todo((topotext::Todo *)v7);
  return v3;
}

@end
