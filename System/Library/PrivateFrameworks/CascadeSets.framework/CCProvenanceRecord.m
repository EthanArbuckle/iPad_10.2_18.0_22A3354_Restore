@implementation CCProvenanceRecord

- (CCProvenanceRecord)init
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("init unsupported"), MEMORY[0x24BDBD1B8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

+ (id)recordFromDatabaseValueRow:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDatabaseValueRow:", v3);

  return v4;
}

+ (id)genSQLCreateStatements
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v8[4] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("CREATE TABLE IF NOT EXISTS \"%@\" (\"%@\" integer PRIMARY KEY, \"%@\" integer NOT NULL, \"%@\" integer NULLABLE, \"%@\" integer NULLABLE, \"%@\" integer NOT NULL, \"%@\" integer NOT NULL, \"%@\" integer NULLABLE, \"%@\" integer NULLABLE, \"%@\" integer NULLABLE, \"%@\" integer NULLABLE, FOREIGN KEY (\"%@\") REFERENCES \"%@\" (\"%@\") ON UPDATE CASCADE ON DELETE CASCADE); "),
    CFSTR("provenance"),
    CFSTR("provenance_row_id"),
    CFSTR("device_row_id"),
    CFSTR("instance_hash"),
    CFSTR("content_hash"),
    CFSTR("content_sequence_number"),
    CFSTR("content_state"),
    CFSTR("metacontent_sequence_number"),
    CFSTR("metacontent_state"),
    CFSTR("content_sequence_number_end_of_run"),
    CFSTR("metacontent_sequence_number_end_of_run"),
    CFSTR("device_row_id"),
    CFSTR("device"),
    CFSTR("device_row_id"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("CREATE INDEX \"%@\" ON \"%@\" (\"%@\",\"%@\",\"%@\");"),
    CFSTR("idx_provenance_content_hash"),
    CFSTR("provenance"),
    CFSTR("content_hash"),
    CFSTR("content_state"),
    CFSTR("device_row_id"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v3;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("CREATE INDEX \"%@\" ON \"%@\" (\"%@\",\"%@\",\"%@\" DESC);"),
    CFSTR("idx_provenance_content_sequence_number"),
    CFSTR("provenance"),
    CFSTR("device_row_id"),
    CFSTR("content_state"),
    CFSTR("content_sequence_number"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v4;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("CREATE INDEX \"%@\" ON \"%@\" (\"%@\",\"%@\",\"%@\" DESC);"),
    CFSTR("idx_provenance_metacontent_sequence_number"),
    CFSTR("provenance"),
    CFSTR("device_row_id"),
    CFSTR("metacontent_state"),
    CFSTR("metacontent_sequence_number"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[3] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)tableName
{
  return CFSTR("provenance");
}

- (CCProvenanceRecord)initWithDatabaseValueRow:(id)a3
{
  id v4;
  CCProvenanceRecord *v5;
  uint64_t v6;
  NSNumber *provenanceRowId;
  uint64_t v8;
  NSNumber *deviceRowId;
  uint64_t v10;
  NSNumber *instanceHash;
  uint64_t v12;
  NSNumber *contentHash;
  uint64_t v14;
  NSNumber *contentSequenceNumber;
  uint64_t v16;
  NSNumber *contentState;
  uint64_t v18;
  NSNumber *metaContentSequenceNumber;
  uint64_t v20;
  NSNumber *metaContentState;
  uint64_t v22;
  NSNumber *contentSequenceNumberEndOfRun;
  uint64_t v24;
  NSNumber *metaContentSequenceNumberEndOfRun;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)CCProvenanceRecord;
  v5 = -[CCProvenanceRecord init](&v27, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "numberValueAtColumnIndex:", 0);
    v6 = objc_claimAutoreleasedReturnValue();
    provenanceRowId = v5->_provenanceRowId;
    v5->_provenanceRowId = (NSNumber *)v6;

    objc_msgSend(v4, "numberValueAtColumnIndex:", 1);
    v8 = objc_claimAutoreleasedReturnValue();
    deviceRowId = v5->_deviceRowId;
    v5->_deviceRowId = (NSNumber *)v8;

    objc_msgSend(v4, "numberValueAtColumnIndex:", 2);
    v10 = objc_claimAutoreleasedReturnValue();
    instanceHash = v5->_instanceHash;
    v5->_instanceHash = (NSNumber *)v10;

    objc_msgSend(v4, "numberValueAtColumnIndex:", 3);
    v12 = objc_claimAutoreleasedReturnValue();
    contentHash = v5->_contentHash;
    v5->_contentHash = (NSNumber *)v12;

    objc_msgSend(v4, "numberValueAtColumnIndex:", 4);
    v14 = objc_claimAutoreleasedReturnValue();
    contentSequenceNumber = v5->_contentSequenceNumber;
    v5->_contentSequenceNumber = (NSNumber *)v14;

    objc_msgSend(v4, "numberValueAtColumnIndex:", 5);
    v16 = objc_claimAutoreleasedReturnValue();
    contentState = v5->_contentState;
    v5->_contentState = (NSNumber *)v16;

    objc_msgSend(v4, "numberValueAtColumnIndex:", 6);
    v18 = objc_claimAutoreleasedReturnValue();
    metaContentSequenceNumber = v5->_metaContentSequenceNumber;
    v5->_metaContentSequenceNumber = (NSNumber *)v18;

    objc_msgSend(v4, "numberValueAtColumnIndex:", 7);
    v20 = objc_claimAutoreleasedReturnValue();
    metaContentState = v5->_metaContentState;
    v5->_metaContentState = (NSNumber *)v20;

    objc_msgSend(v4, "numberValueAtColumnIndex:", 8);
    v22 = objc_claimAutoreleasedReturnValue();
    contentSequenceNumberEndOfRun = v5->_contentSequenceNumberEndOfRun;
    v5->_contentSequenceNumberEndOfRun = (NSNumber *)v22;

    objc_msgSend(v4, "numberValueAtColumnIndex:", 9);
    v24 = objc_claimAutoreleasedReturnValue();
    metaContentSequenceNumberEndOfRun = v5->_metaContentSequenceNumberEndOfRun;
    v5->_metaContentSequenceNumberEndOfRun = (NSNumber *)v24;

  }
  return v5;
}

- (NSString)description
{
  void *v3;
  NSNumber *contentHash;
  NSNumber *contentSequenceNumber;
  NSNumber *contentSequenceNumberEndOfRun;
  unsigned __int8 v7;
  const __CFString *v8;
  void *v9;
  NSNumber *metaContentSequenceNumberEndOfRun;
  NSNumber *metaContentSequenceNumber;
  unsigned __int8 v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  NSNumber *instanceHash;
  NSNumber *deviceRowId;
  NSNumber *provenanceRowId;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)CCProvenanceRecord;
  -[CCProvenanceRecord description](&v20, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  contentHash = self->_contentHash;
  deviceRowId = self->_deviceRowId;
  provenanceRowId = self->_provenanceRowId;
  contentSequenceNumber = self->_contentSequenceNumber;
  instanceHash = self->_instanceHash;
  contentSequenceNumberEndOfRun = self->_contentSequenceNumberEndOfRun;
  v7 = -[NSNumber unsignedShortValue](self->_contentState, "unsignedShortValue");
  if (v7 > 2u)
    v8 = CFSTR("Undefined");
  else
    v8 = off_250990828[(char)v7];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ (%u)"), v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  metaContentSequenceNumber = self->_metaContentSequenceNumber;
  metaContentSequenceNumberEndOfRun = self->_metaContentSequenceNumberEndOfRun;
  v12 = -[NSNumber unsignedShortValue](self->_metaContentState, "unsignedShortValue");
  if (v12 > 2u)
    v13 = CFSTR("Undefined");
  else
    v13 = off_250990828[(char)v12];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ (%u)"), v13, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" provenanceRowId: %@, deviceRowId: %@, instanceHash: %@, contentHash: %@, contentSequenceNumber: %@, endOfRun: %@, contentState: %@, metaContentSequenceNumber: %@, endOfRun: %@, metaContentState: %@"), provenanceRowId, deviceRowId, instanceHash, contentHash, contentSequenceNumber, contentSequenceNumberEndOfRun, v9, metaContentSequenceNumber, metaContentSequenceNumberEndOfRun, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v15;
}

- (BOOL)isEqual:(id)a3
{
  CCProvenanceRecord *v4;
  CCProvenanceRecord *v5;
  BOOL v6;

  v4 = (CCProvenanceRecord *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CCProvenanceRecord isEqualToItemRecord:](self, "isEqualToItemRecord:", v5);

  return v6;
}

- (BOOL)isEqualToItemRecord:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v7;
  void *v8;
  NSNumber *provenanceRowId;
  NSNumber *v10;
  int v11;
  char v12;
  NSNumber *deviceRowId;
  NSNumber *v14;
  uint64_t v15;
  NSNumber *instanceHash;
  NSNumber *v17;
  uint64_t v18;
  NSNumber *contentHash;
  NSNumber *v20;
  uint64_t v21;
  NSNumber *contentSequenceNumber;
  uint64_t v23;
  NSNumber *contentSequenceNumberEndOfRun;
  uint64_t v25;
  NSNumber *contentState;
  uint64_t v27;
  NSNumber *metaContentSequenceNumber;
  uint64_t v29;
  NSNumber *metaContentSequenceNumberEndOfRun;
  uint64_t v31;
  NSNumber *metaContentState;
  NSNumber *v33;
  uint64_t v34;
  NSNumber *v35;
  void *v36;
  int v37;
  void *v39;
  void *v40;
  void *v41;
  NSNumber *v42;
  int v43;
  void *v44;
  void *v45;
  int v46;
  NSNumber *v47;
  void *v48;
  void *v49;
  NSNumber *v50;
  int v51;
  void *v52;
  void *v53;
  NSNumber *v54;
  int v55;
  void *v56;
  void *v57;
  NSNumber *v58;
  int v59;
  void *v60;
  void *v61;
  NSNumber *v62;
  int v63;
  void *v64;
  void *v65;
  int v66;
  int v67;
  void *v68;
  void *v69;
  int v70;

  v7 = a3;
  v8 = v7;
  if (!v7)
  {
    v12 = 0;
    goto LABEL_97;
  }
  provenanceRowId = self->_provenanceRowId;
  v10 = provenanceRowId;
  if (!provenanceRowId)
  {
    objc_msgSend(v7, "provenanceRowId");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v11 = 0;
      goto LABEL_10;
    }
    v10 = self->_provenanceRowId;
  }
  objc_msgSend(v8, "provenanceRowId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[NSNumber isEqual:](v10, "isEqual:", v4) & 1) == 0)
  {

    v12 = 0;
    goto LABEL_95;
  }
  v11 = 1;
LABEL_10:
  deviceRowId = self->_deviceRowId;
  v14 = deviceRowId;
  if (!deviceRowId)
  {
    objc_msgSend(v8, "deviceRowId");
    v15 = objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      v68 = 0;
      v70 = 0;
      goto LABEL_17;
    }
    v68 = (void *)v15;
    v14 = self->_deviceRowId;
  }
  objc_msgSend(v8, "deviceRowId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[NSNumber isEqual:](v14, "isEqual:", v5) & 1) == 0)
  {

    v12 = 0;
    goto LABEL_92;
  }
  v70 = 1;
LABEL_17:
  instanceHash = self->_instanceHash;
  v17 = instanceHash;
  if (!instanceHash)
  {
    objc_msgSend(v8, "instanceHash");
    v18 = objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      v66 = v11;
      v67 = 0;
      v64 = 0;
      goto LABEL_24;
    }
    v64 = (void *)v18;
    v17 = self->_instanceHash;
  }
  objc_msgSend(v8, "instanceHash");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[NSNumber isEqual:](v17, "isEqual:"))
  {
    v12 = 0;
    goto LABEL_89;
  }
  v66 = v11;
  v67 = 1;
LABEL_24:
  contentHash = self->_contentHash;
  v20 = contentHash;
  if (!contentHash)
  {
    objc_msgSend(v8, "contentHash");
    v21 = objc_claimAutoreleasedReturnValue();
    if (!v21)
    {
      v60 = 0;
      v63 = 0;
      goto LABEL_31;
    }
    v60 = (void *)v21;
    v20 = self->_contentHash;
  }
  objc_msgSend(v8, "contentHash");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[NSNumber isEqual:](v20, "isEqual:"))
  {
    v12 = 0;
    v11 = v66;
    goto LABEL_86;
  }
  v63 = 1;
LABEL_31:
  contentSequenceNumber = self->_contentSequenceNumber;
  v62 = contentSequenceNumber;
  if (!contentSequenceNumber)
  {
    objc_msgSend(v8, "contentSequenceNumber");
    v23 = objc_claimAutoreleasedReturnValue();
    if (!v23)
    {
      v56 = 0;
      v59 = 0;
      goto LABEL_38;
    }
    v56 = (void *)v23;
    contentSequenceNumber = self->_contentSequenceNumber;
  }
  objc_msgSend(v8, "contentSequenceNumber");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[NSNumber isEqual:](contentSequenceNumber, "isEqual:"))
  {
    v12 = 0;
    v11 = v66;
    goto LABEL_83;
  }
  v59 = 1;
LABEL_38:
  contentSequenceNumberEndOfRun = self->_contentSequenceNumberEndOfRun;
  v58 = contentSequenceNumberEndOfRun;
  if (!contentSequenceNumberEndOfRun)
  {
    objc_msgSend(v8, "contentSequenceNumberEndOfRun");
    v25 = objc_claimAutoreleasedReturnValue();
    if (!v25)
    {
      v52 = 0;
      v55 = 0;
      goto LABEL_45;
    }
    v52 = (void *)v25;
    contentSequenceNumberEndOfRun = self->_contentSequenceNumberEndOfRun;
  }
  objc_msgSend(v8, "contentSequenceNumberEndOfRun");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[NSNumber isEqual:](contentSequenceNumberEndOfRun, "isEqual:"))
  {
    v12 = 0;
    v11 = v66;
    goto LABEL_80;
  }
  v55 = 1;
LABEL_45:
  contentState = self->_contentState;
  v54 = contentState;
  if (!contentState)
  {
    objc_msgSend(v8, "contentState");
    v27 = objc_claimAutoreleasedReturnValue();
    if (!v27)
    {
      v48 = 0;
      v51 = 0;
      goto LABEL_52;
    }
    v48 = (void *)v27;
    contentState = self->_contentState;
  }
  objc_msgSend(v8, "contentState");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[NSNumber isEqual:](contentState, "isEqual:"))
  {
    v12 = 0;
    v11 = v66;
    goto LABEL_77;
  }
  v51 = 1;
LABEL_52:
  metaContentSequenceNumber = self->_metaContentSequenceNumber;
  v50 = metaContentSequenceNumber;
  if (!metaContentSequenceNumber)
  {
    objc_msgSend(v8, "metaContentSequenceNumber");
    v29 = objc_claimAutoreleasedReturnValue();
    if (!v29)
    {
      v44 = 0;
      v46 = 0;
      goto LABEL_59;
    }
    v44 = (void *)v29;
    metaContentSequenceNumber = self->_metaContentSequenceNumber;
  }
  objc_msgSend(v8, "metaContentSequenceNumber");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[NSNumber isEqual:](metaContentSequenceNumber, "isEqual:"))
  {
    v12 = 0;
    v11 = v66;
    goto LABEL_74;
  }
  v46 = 1;
LABEL_59:
  metaContentSequenceNumberEndOfRun = self->_metaContentSequenceNumberEndOfRun;
  v47 = metaContentSequenceNumberEndOfRun;
  if (!metaContentSequenceNumberEndOfRun)
  {
    objc_msgSend(v8, "metaContentSequenceNumberEndOfRun");
    v31 = objc_claimAutoreleasedReturnValue();
    if (!v31)
    {
      v41 = 0;
      v43 = 0;
      goto LABEL_66;
    }
    v41 = (void *)v31;
    metaContentSequenceNumberEndOfRun = self->_metaContentSequenceNumberEndOfRun;
  }
  objc_msgSend(v8, "metaContentSequenceNumberEndOfRun");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[NSNumber isEqual:](metaContentSequenceNumberEndOfRun, "isEqual:"))
  {
    v12 = 0;
    v11 = v66;
LABEL_71:

    goto LABEL_72;
  }
  v43 = 1;
LABEL_66:
  metaContentState = self->_metaContentState;
  v33 = metaContentState;
  if (!metaContentState)
  {
    objc_msgSend(v8, "metaContentState");
    v34 = objc_claimAutoreleasedReturnValue();
    if (!v34)
    {
      v39 = 0;
      v12 = 1;
      v11 = v66;
      goto LABEL_116;
    }
    v40 = (void *)v34;
    v33 = self->_metaContentState;
  }
  v35 = v33;
  objc_msgSend(v8, "metaContentState");
  v42 = metaContentState;
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[NSNumber isEqual:](v35, "isEqual:", v36);

  if (v42)
  {
    v11 = v66;
    if (!v43)
      goto LABEL_72;
    goto LABEL_71;
  }
  v11 = v66;
  v39 = v40;
LABEL_116:

  if ((v43 & 1) != 0)
    goto LABEL_71;
LABEL_72:
  if (v47)
  {
    if (!v46)
      goto LABEL_75;
    goto LABEL_74;
  }

  if ((v46 & 1) != 0)
LABEL_74:

LABEL_75:
  if (v50)
  {
    if (!v51)
      goto LABEL_78;
    goto LABEL_77;
  }

  if ((v51 & 1) != 0)
LABEL_77:

LABEL_78:
  if (v54)
  {
    if (!v55)
      goto LABEL_81;
    goto LABEL_80;
  }

  if ((v55 & 1) != 0)
LABEL_80:

LABEL_81:
  if (v58)
  {
    if (!v59)
      goto LABEL_84;
    goto LABEL_83;
  }

  if ((v59 & 1) != 0)
LABEL_83:

LABEL_84:
  if (v62)
  {
    if (!v63)
      goto LABEL_87;
    goto LABEL_86;
  }

  if ((v63 & 1) != 0)
LABEL_86:

LABEL_87:
  if (contentHash)
  {
    if (v67)
      goto LABEL_89;
  }
  else
  {

    if ((v67 & 1) != 0)
    {
LABEL_89:
      v37 = v70;

      if (instanceHash)
        goto LABEL_90;
      goto LABEL_102;
    }
  }
  v37 = v70;
  if (instanceHash)
  {
LABEL_90:
    if (!v37)
      goto LABEL_92;
    goto LABEL_91;
  }
LABEL_102:

  if ((v37 & 1) != 0)
LABEL_91:

LABEL_92:
  if (deviceRowId)
  {
    if (!v11)
      goto LABEL_95;
    goto LABEL_94;
  }

  if ((v11 & 1) != 0)
LABEL_94:

LABEL_95:
  if (!provenanceRowId)

LABEL_97:
  return v12;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = -[NSNumber hash](self->_provenanceRowId, "hash");
  v4 = -[NSNumber hash](self->_deviceRowId, "hash") ^ v3;
  v5 = -[NSNumber hash](self->_instanceHash, "hash");
  v6 = v4 ^ v5 ^ -[NSNumber hash](self->_contentHash, "hash");
  v7 = -[NSNumber hash](self->_contentSequenceNumber, "hash");
  v8 = v7 ^ -[NSNumber hash](self->_contentState, "hash");
  v9 = v6 ^ v8 ^ -[NSNumber hash](self->_metaContentSequenceNumber, "hash");
  v10 = -[NSNumber hash](self->_metaContentState, "hash");
  v11 = v10 ^ -[NSNumber hash](self->_contentSequenceNumberEndOfRun, "hash");
  return v9 ^ v11 ^ -[NSNumber hash](self->_metaContentSequenceNumberEndOfRun, "hash");
}

- (NSNumber)provenanceRowId
{
  return self->_provenanceRowId;
}

- (NSNumber)deviceRowId
{
  return self->_deviceRowId;
}

- (NSNumber)contentHash
{
  return self->_contentHash;
}

- (NSNumber)instanceHash
{
  return self->_instanceHash;
}

- (NSNumber)contentSequenceNumber
{
  return self->_contentSequenceNumber;
}

- (NSNumber)contentSequenceNumberEndOfRun
{
  return self->_contentSequenceNumberEndOfRun;
}

- (NSNumber)contentState
{
  return self->_contentState;
}

- (NSNumber)metaContentSequenceNumber
{
  return self->_metaContentSequenceNumber;
}

- (NSNumber)metaContentSequenceNumberEndOfRun
{
  return self->_metaContentSequenceNumberEndOfRun;
}

- (NSNumber)metaContentState
{
  return self->_metaContentState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metaContentState, 0);
  objc_storeStrong((id *)&self->_metaContentSequenceNumberEndOfRun, 0);
  objc_storeStrong((id *)&self->_metaContentSequenceNumber, 0);
  objc_storeStrong((id *)&self->_contentState, 0);
  objc_storeStrong((id *)&self->_contentSequenceNumberEndOfRun, 0);
  objc_storeStrong((id *)&self->_contentSequenceNumber, 0);
  objc_storeStrong((id *)&self->_instanceHash, 0);
  objc_storeStrong((id *)&self->_contentHash, 0);
  objc_storeStrong((id *)&self->_deviceRowId, 0);
  objc_storeStrong((id *)&self->_provenanceRowId, 0);
}

@end
