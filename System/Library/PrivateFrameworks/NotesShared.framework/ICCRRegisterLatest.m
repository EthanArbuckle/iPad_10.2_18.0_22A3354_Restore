@implementation ICCRRegisterLatest

- (ICCRRegisterLatest)initWithContents:(id)a3 document:(id)a4
{
  id v6;
  id v7;
  ICCRTimestamp *v8;
  void *v9;
  ICCRTimestamp *v10;
  ICCRRegisterLatest *v11;

  v6 = a3;
  v7 = a4;
  v8 = [ICCRTimestamp alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "CR_unserialized");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[ICCRTimestamp initWithReplica:andCounter:](v8, "initWithReplica:andCounter:", v9, 0);

  v11 = -[ICCRRegisterLatest initWithContents:timestamp:document:](self, "initWithContents:timestamp:document:", v6, v10, v7);
  return v11;
}

- (ICCRRegisterLatest)initWithContents:(id)a3 timestamp:(id)a4 document:(id)a5
{
  id v9;
  id v10;
  ICCRRegisterLatest *v11;
  ICCRRegisterLatest *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ICCRRegisterLatest;
  v11 = -[ICCRRegister initWithDocument:](&v14, sel_initWithDocument_, a5);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_timestamp, a4);
    objc_storeStrong((id *)&v12->_contents, a3);
  }

  return v12;
}

- (void)encodeWithICCRCoder:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  CRDT::RegisterLatest *v6;
  id v7;

  v7 = a3;
  v4 = objc_msgSend(v7, "currentDocumentObjectForEncoding");
  v5 = v4;
  if (*(_DWORD *)(v4 + 48) == 1)
  {
    v6 = *(CRDT::RegisterLatest **)(v4 + 40);
  }
  else
  {
    CRDT::Document_DocObject::clear_contents(v4);
    *(_DWORD *)(v5 + 48) = 1;
    v6 = (CRDT::RegisterLatest *)operator new();
    CRDT::RegisterLatest::RegisterLatest(v6);
    *(_QWORD *)(v5 + 40) = v6;
  }
  -[ICCRRegisterLatest encodeIntoProtobufRegisterLatest:coder:](self, "encodeIntoProtobufRegisterLatest:coder:", v6, v7);

}

- (ICCRRegisterLatest)initWithICCRCoder:(id)a3
{
  id v4;
  uint64_t v5;
  ICCRRegisterLatest *v6;
  void *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "currentDocumentObjectForDecoding");
  if (*(_DWORD *)(v5 + 48) == 1)
  {
    v6 = -[ICCRRegisterLatest initWithProtobufRegisterLatest:decoder:](self, "initWithProtobufRegisterLatest:decoder:", *(_QWORD *)(v5 + 40), v4);
  }
  else
  {
    objc_msgSend(v4, "document");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[ICCRRegisterLatest initWithContents:document:](self, "initWithContents:document:", 0, v7);

  }
  return v6;
}

- (ICCRRegisterLatest)initWithProtobufRegisterLatest:(const void *)a3 decoder:(id)a4
{
  CRDT::RegisterLatest *v6;
  CRDT::RegisterLatest *v7;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  ICCRTimestamp *v12;
  void *v13;
  void *v14;
  ICCRTimestamp *v15;
  ICCRTimestamp *v16;
  ICCRTimestamp *v17;
  uint64_t v18;
  void *v19;
  ICCRRegisterLatest *v20;

  v6 = (CRDT::RegisterLatest *)a4;
  v7 = v6;
  v8 = *((_DWORD *)a3 + 8);
  if ((v8 & 2) != 0)
  {
    v10 = *((_QWORD *)a3 + 6);
    if (!v10)
      v10 = *(_QWORD *)(CRDT::RegisterLatest::default_instance(v6) + 48);
    -[CRDT::RegisterLatest decodeObjectForProtobufObjectID:](v7, "decodeObjectForProtobufObjectID:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v8 = *((_DWORD *)a3 + 8);
    v9 = (void *)v11;
  }
  else
  {
    v9 = 0;
  }
  if ((v8 & 1) != 0)
  {
    v16 = [ICCRTimestamp alloc];
    v17 = v16;
    v18 = *((_QWORD *)a3 + 5);
    if (!v18)
      v18 = *(_QWORD *)(CRDT::RegisterLatest::default_instance((CRDT::RegisterLatest *)v16) + 40);
    v15 = -[ICCRTimestamp initWithProtobufTimestamp:decoder:](v17, "initWithProtobufTimestamp:decoder:", v18, v7);
  }
  else
  {
    v12 = [ICCRTimestamp alloc];
    -[CRDT::RegisterLatest document](v7, "document");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "replica");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[ICCRTimestamp initWithReplica:andCounter:](v12, "initWithReplica:andCounter:", v14, 0);

  }
  -[CRDT::RegisterLatest document](v7, "document");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[ICCRRegisterLatest initWithContents:timestamp:document:](self, "initWithContents:timestamp:document:", v9, v15, v19);

  return v20;
}

- (void)encodeIntoProtobufRegisterLatest:(void *)a3 coder:(id)a4
{
  void *v6;
  CRDT::Timestamp *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  CRDT::ObjectID *v12;
  id v13;

  v13 = a4;
  -[ICCRRegisterLatest timestamp](self, "timestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *((_DWORD *)a3 + 8) |= 1u;
  v7 = (CRDT::Timestamp *)*((_QWORD *)a3 + 5);
  if (!v7)
  {
    v7 = (CRDT::Timestamp *)operator new();
    CRDT::Timestamp::Timestamp(v7);
    *((_QWORD *)a3 + 5) = v7;
  }
  objc_msgSend(v6, "encodeIntoProtobufTimestamp:coder:", v7, v13);

  -[ICCRRegisterLatest contents](self, "contents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[ICCRRegisterLatest contents](self, "contents");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "conformsToProtocol:", &unk_1EF5316F8);

    if (v10)
    {
      -[ICCRRegisterLatest contents](self, "contents");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *((_DWORD *)a3 + 8) |= 2u;
      v12 = (CRDT::ObjectID *)*((_QWORD *)a3 + 6);
      if (!v12)
      {
        v12 = (CRDT::ObjectID *)operator new();
        CRDT::ObjectID::ObjectID(v12);
        *((_QWORD *)a3 + 6) = v12;
      }
      objc_msgSend(v13, "encodeObject:forObjectID:", v11, v12);

    }
  }

}

- (id)contents
{
  return self->_contents;
}

- (void)setContents:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  ICCRTimestamp *v12;
  void *v13;
  ICCRTimestamp *v14;
  void *v15;
  ICCRDataType *v16;

  v16 = (ICCRDataType *)a3;
  if (self->_contents != v16)
  {
    objc_storeStrong((id *)&self->_contents, a3);
    -[ICCRRegisterLatest timestamp](self, "timestamp");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "replica");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "CR_unserialized");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 != v7)
    {
      -[ICCRRegister document](self, "document");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "replicaClock");

      -[ICCRRegisterLatest timestamp](self, "timestamp");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "counter");

      if (v9 > v11)
        v11 = v9;
      v12 = [ICCRTimestamp alloc];
      objc_msgSend(MEMORY[0x1E0CB3A28], "CR_unserialized");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[ICCRTimestamp initWithReplica:andCounter:](v12, "initWithReplica:andCounter:", v13, v11 + 1);
      -[ICCRRegisterLatest setTimestamp:](self, "setTimestamp:", v14);

    }
    -[ICCRRegister document](self, "document");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setDocumentFor:", v16);

  }
}

- (void)_setContents:(id)a3
{
  objc_storeStrong((id *)&self->_contents, a3);
}

- (BOOL)isEqualContents:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[ICCRRegisterLatest contents](self, "contents");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contents");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqual:", v6))
    {
      -[ICCRRegisterLatest timestamp](self, "timestamp");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "timestamp");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqual:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)realizeLocalChangesIn:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  ICCRTimestamp *v10;
  void *v11;
  ICCRTimestamp *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v15 = a3;
  -[ICCRRegisterLatest timestamp](self, "timestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "replica");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "CR_unserialized");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
  {
    -[ICCRRegisterLatest timestamp](self, "timestamp");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "counter"))
    {
      -[ICCRRegisterLatest timestamp](self, "timestamp");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "counter");

    }
    else
    {
      v9 = objc_msgSend(v15, "replicaClock") + 1;
    }

    v10 = [ICCRTimestamp alloc];
    objc_msgSend(v15, "replica");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[ICCRTimestamp initWithReplica:andCounter:](v10, "initWithReplica:andCounter:", v11, v9);
    -[ICCRRegisterLatest setTimestamp:](self, "setTimestamp:", v12);

    v13 = objc_msgSend(v15, "unserializedReplicaClock");
    if (v9 <= v13)
      v14 = v13;
    else
      v14 = v9;
    objc_msgSend(v15, "setUnserializedReplicaClock:", v14);
  }

}

- (void)mergeWith:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Invalid ICCRRegisterLatest merge, classes must be equal for merge."), 0);
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v4);
    }
    -[ICCRRegisterLatest mergeWithRegisterLatest:](self, "mergeWithRegisterLatest:", v5);
  }

}

- (void)mergeWithRegisterLatest:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[ICCRRegisterLatest timestamp](self, "timestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "compare:", v5);

  if (v6 == -1)
  {
    objc_msgSend(v9, "contents");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCRRegisterLatest setContents:](self, "setContents:", v7);

    objc_msgSend(v9, "timestamp");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCRRegisterLatest setTimestamp:](self, "setTimestamp:", v8);

  }
}

- (void)setDocument:(id)a3
{
  id v4;
  void *v5;
  ICCRDataType *v6;
  ICCRDataType *contents;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICCRRegisterLatest;
  -[ICCRRegister setDocument:](&v8, sel_setDocument_, v4);
  -[ICCRRegisterLatest contents](self, "contents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localObject:", v5);
  v6 = (ICCRDataType *)objc_claimAutoreleasedReturnValue();
  contents = self->_contents;
  self->_contents = v6;

}

- (id)deltaSince:(id)a3 in:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  ICCRRegisterLatest *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  ICCRRegisterLatest *v18;
  void *v19;

  v6 = a3;
  v7 = a4;
  -[ICCRRegisterLatest timestamp](self, "timestamp");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "replica");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timestampForReplica:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCRRegisterLatest timestamp](self, "timestamp");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "compare:", v11);

  if (!v12)
  {
    -[ICCRRegisterLatest contents](self, "contents");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "deltaSince:in:", v6, v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v18 = [ICCRRegisterLatest alloc];
      -[ICCRRegisterLatest timestamp](self, "timestamp");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[ICCRRegisterLatest initWithContents:timestamp:document:](v18, "initWithContents:timestamp:document:", v14, v15, v7);
      goto LABEL_6;
    }
LABEL_7:
    v19 = 0;
    goto LABEL_8;
  }
  if (v12 != -1)
    goto LABEL_7;
  v13 = [ICCRRegisterLatest alloc];
  -[ICCRRegisterLatest contents](self, "contents");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCRRegisterLatest timestamp](self, "timestamp");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[ICCRRegisterLatest initWithContents:timestamp:document:](v13, "initWithContents:timestamp:document:", v14, v15, v7);
LABEL_6:
  v19 = (void *)v16;

LABEL_8:
  return v19;
}

- (void)walkGraph:(id)a3
{
  void *v4;
  void (**v5)(id, void *);

  v5 = (void (**)(id, void *))a3;
  -[ICCRRegisterLatest contents](self, "contents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v4);

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCRRegisterLatest timestamp](self, "timestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "shortDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCRRegisterLatest contents](self, "contents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p %@ %@>"), v5, self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (ICCRTimestamp)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_timestamp, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_contents, 0);
}

@end
