@implementation ENNoteRef

- (id)wfSerializedRepresentation
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v5 = CFSTR("link.contentkit.ennoteref");
  -[ENNoteRef asData](self, "asData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)objectWithWFSerializedRepresentation:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "objectForKey:", CFSTR("link.contentkit.ennoteref"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("link.contentkit.ennoteref"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[ENNoteRef noteRefFromData:](ENNoteRef, "noteRefFromData:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (ENNoteRef)initWithCoder:(id)a3
{
  id v4;
  ENNoteRef *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ENNoteRef;
  v5 = -[ENNoteRef init](&v9, sel_init);
  if (v5)
  {
    -[ENNoteRef setType:](v5, "setType:", (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("type")));
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("guid"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENNoteRef setGuid:](v5, "setGuid:", v6);

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("linkedNotebook"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENNoteRef setLinkedNotebook:](v5, "setLinkedNotebook:", v7);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "encodeInt32:forKey:", -[ENNoteRef type](self, "type"), CFSTR("type"));
  -[ENNoteRef guid](self, "guid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("guid"));

  -[ENNoteRef linkedNotebook](self, "linkedNotebook");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("linkedNotebook"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  ENNoteRef *v4;
  void *v5;
  void *v6;

  v4 = objc_alloc_init(ENNoteRef);
  -[ENNoteRef setType:](v4, "setType:", -[ENNoteRef type](self, "type"));
  -[ENNoteRef guid](self, "guid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENNoteRef setGuid:](v4, "setGuid:", v5);

  -[ENNoteRef linkedNotebook](self, "linkedNotebook");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENNoteRef setLinkedNotebook:](v4, "setLinkedNotebook:", v6);

  return v4;
}

- (id)asData
{
  return (id)objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:", self);
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  ENNoteRef *v5;
  ENNoteRef *v6;
  ENNoteRef *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;

  v5 = (ENNoteRef *)a3;
  v6 = v5;
  if (self == v5)
  {
    v12 = 1;
  }
  else
  {
    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = v6;
        v8 = -[ENNoteRef type](v7, "type");
        if (v8 != -[ENNoteRef type](self, "type"))
        {
          v12 = 0;
LABEL_18:

          goto LABEL_19;
        }
        -[ENNoteRef guid](self, "guid");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[ENNoteRef guid](v7, "guid");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9 != v10)
        {
          -[ENNoteRef guid](v7, "guid");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[ENNoteRef guid](self, "guid");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v11, "isEqualToString:", v3))
          {
            v12 = 0;
LABEL_16:

LABEL_17:
            goto LABEL_18;
          }
          v19 = v11;
        }
        -[ENNoteRef linkedNotebook](self, "linkedNotebook");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[ENNoteRef linkedNotebook](v7, "linkedNotebook");
        v14 = objc_claimAutoreleasedReturnValue();
        if (v13 == (void *)v14)
        {

          v12 = 1;
        }
        else
        {
          v15 = (void *)v14;
          -[ENNoteRef linkedNotebook](v7, "linkedNotebook");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[ENNoteRef linkedNotebook](self, "linkedNotebook");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v16, "isEqual:", v17);

        }
        v11 = v19;
        if (v9 == v10)
          goto LABEL_17;
        goto LABEL_16;
      }
    }
    v12 = 0;
  }
LABEL_19:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;

  v3 = (int)-[ENNoteRef type](self, "type");
  -[ENNoteRef guid](self, "guid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") - v3 + 32 * v3;

  -[ENNoteRef linkedNotebook](self, "linkedNotebook");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash") - v5 + 32 * v5 + 29791;

  return v7;
}

- (NSString)description
{
  id v3;
  unint64_t v4;
  __CFString *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v4 = -[ENNoteRef type](self, "type");
  if (v4 > 2)
    v5 = 0;
  else
    v5 = off_24F8B13A8[v4];
  v6 = objc_opt_class();
  -[ENNoteRef guid](self, "guid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p; guid = %@; type = %@"), v6, self, v7, v5);

  -[ENNoteRef linkedNotebook](self, "linkedNotebook");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[ENNoteRef linkedNotebook](self, "linkedNotebook");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "shardId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; link shard = %@"), v10);

  }
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return (NSString *)v3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSString)guid
{
  return self->_guid;
}

- (void)setGuid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (ENLinkedNotebookRef)linkedNotebook
{
  return self->_linkedNotebook;
}

- (void)setLinkedNotebook:(id)a3
{
  objc_storeStrong((id *)&self->_linkedNotebook, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkedNotebook, 0);
  objc_storeStrong((id *)&self->_guid, 0);
}

+ (id)noteRefFromData:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD1620], "unarchiveObjectWithData:", v3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v4 = v4;
      v5 = v4;
    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
