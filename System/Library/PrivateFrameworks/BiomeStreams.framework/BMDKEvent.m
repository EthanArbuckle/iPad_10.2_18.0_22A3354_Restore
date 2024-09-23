@implementation BMDKEvent

- (id)encodeAsProto
{
  void *v3;
  void *v4;

  +[BMDKEventCodec codecWithVersion:](BMDKEventCodec, "codecWithVersion:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "encodeAsProtoData:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (_DKEvent)dkEvent
{
  return self->_dkEvent;
}

- (unsigned)dataVersion
{
  return 2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dkEvent, 0);
}

- (BMDKEvent)initWithDKEvent:(id)a3
{
  id v6;
  BMDKEvent *v7;
  BMDKEvent *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMDKEvent.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dkEvent != nil"));

  }
  v11.receiver = self;
  v11.super_class = (Class)BMDKEvent;
  v7 = -[BMDKEvent init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_dkEvent, a3);

  return v8;
}

+ (id)eventWithDKEvent:(id)a3
{
  id v3;
  BMDKEvent *v4;

  v3 = a3;
  v4 = -[BMDKEvent initWithDKEvent:]([BMDKEvent alloc], "initWithDKEvent:", v3);

  return v4;
}

- (BMDKEvent)initWithData:(id)a3 dataVersion:(unsigned int)a4 decodeMetadata:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v6;
  id v8;
  void *v9;
  BMDKEvent *v10;

  v5 = a5;
  v6 = *(_QWORD *)&a4;
  v8 = a3;
  +[BMDKEventCodec codecWithVersion:](BMDKEventCodec, "codecWithVersion:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDecodeMetadata:", v5);
  objc_msgSend(v9, "decodeWithProtoData:", v8);
  v10 = (BMDKEvent *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  +[BMDKEventCodec codecWithVersion:](BMDKEventCodec, "codecWithVersion:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "decodeWithProtoData:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)jsonDict
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _QWORD v75[10];
  _QWORD v76[10];
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  -[_DKEvent metadata](self->_dkEvent, "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v71, v77, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v72;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v72 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
        -[_DKEvent metadata](self->_dkEvent, "metadata");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_msgSend(v11, "description");
            v12 = objc_claimAutoreleasedReturnValue();

            v11 = (void *)v12;
          }
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, v9);
        }
        else
        {
          objc_msgSend(v9, "description");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, v13);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v71, v77, 16);
    }
    while (v6);
  }

  v14 = (void *)objc_opt_new();
  -[_DKEvent source](self->_dkEvent, "source");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[_DKEvent source](self->_dkEvent, "source");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "sourceID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v17, CFSTR("sourceID"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v18, CFSTR("sourceID"));

    }
    -[_DKEvent source](self->_dkEvent, "source");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "bundleID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v20, CFSTR("bundleID"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v21, CFSTR("bundleID"));

    }
    -[_DKEvent source](self->_dkEvent, "source");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "itemID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v23, CFSTR("itemID"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v24, CFSTR("itemID"));

    }
    -[_DKEvent source](self->_dkEvent, "source");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "groupID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v26, CFSTR("groupID"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v27, CFSTR("groupID"));

    }
    -[_DKEvent source](self->_dkEvent, "source");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "deviceID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v29, CFSTR("deviceID"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v30, CFSTR("deviceID"));

    }
    -[_DKEvent source](self->_dkEvent, "source");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "userID");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v32, CFSTR("userID"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v33, CFSTR("userID"));

    }
  }
  -[_DKEvent value](self->_dkEvent, "value");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    -[_DKEvent value](self->_dkEvent, "value");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "stringValue");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v36;
    if (v36)
    {
      v38 = v36;
    }
    else
    {
      -[_DKEvent description](self->_dkEvent, "description");
      v38 = (id)objc_claimAutoreleasedReturnValue();
    }
    v39 = v38;

  }
  else
  {
    v39 = 0;
  }
  v75[0] = CFSTR("UUID");
  -[_DKEvent UUID](self->_dkEvent, "UUID");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "UUIDString");
  v40 = objc_claimAutoreleasedReturnValue();
  v41 = (void *)v40;
  if (!v40)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v40 = objc_claimAutoreleasedReturnValue();
  }
  v61 = (void *)v40;
  v76[0] = v40;
  v75[1] = CFSTR("startDate");
  -[_DKEvent startDate](self->_dkEvent, "startDate");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "description");
  v42 = objc_claimAutoreleasedReturnValue();
  v65 = (void *)v42;
  if (!v42)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v42 = objc_claimAutoreleasedReturnValue();
  }
  v60 = (void *)v42;
  v76[1] = v42;
  v75[2] = CFSTR("endDate");
  -[_DKEvent endDate](self->_dkEvent, "endDate");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "description");
  v43 = objc_claimAutoreleasedReturnValue();
  v44 = (void *)v43;
  if (!v43)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v43 = objc_claimAutoreleasedReturnValue();
  }
  v59 = (void *)v43;
  v76[2] = v43;
  v75[3] = CFSTR("timeZone");
  -[_DKEvent timeZone](self->_dkEvent, "timeZone");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "description");
  v45 = objc_claimAutoreleasedReturnValue();
  v46 = (void *)v45;
  if (!v45)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v45 = objc_claimAutoreleasedReturnValue();
  }
  v58 = (void *)v45;
  v76[3] = v45;
  v75[4] = CFSTR("value");
  v47 = (uint64_t)v39;
  v69 = v39;
  if (!v39)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v47 = objc_claimAutoreleasedReturnValue();
  }
  v67 = v41;
  v76[4] = v47;
  v76[5] = v3;
  v75[5] = CFSTR("metadata");
  v75[6] = CFSTR("confidence");
  v48 = (void *)MEMORY[0x1E0CB37E8];
  -[_DKEvent confidence](self->_dkEvent, "confidence", v47);
  objc_msgSend(v48, "numberWithDouble:");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v76[6] = v49;
  v76[7] = v14;
  v70 = v14;
  v75[7] = CFSTR("source");
  v75[8] = CFSTR("creationDate");
  -[_DKEvent creationDate](self->_dkEvent, "creationDate");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "description");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v51;
  if (!v51)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v76[8] = v52;
  v75[9] = CFSTR("localCreationDate");
  -[_DKEvent localCreationDate](self->_dkEvent, "localCreationDate");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "description");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v54;
  if (!v54)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v76[9] = v55;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v76, v75, 10);
  v62 = (id)objc_claimAutoreleasedReturnValue();
  if (!v54)

  if (!v51)
  if (!v69)

  if (!v46)
  if (!v44)

  if (!v65)
  if (!v67)

  return v62;
}

- (id)json
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v8;

  v2 = (void *)MEMORY[0x1E0CB36D8];
  -[BMDKEvent jsonDict](self, "jsonDict");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 3, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;

  if (!v4)
  {
    __biome_log_for_category();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[BMDKEvent json].cold.1((uint64_t)v5, v6);

  }
  return v4;
}

- (BMDKEvent)initWithProto:(id)a3
{
  id v4;
  void *v5;
  BMDKEvent *v6;

  v4 = a3;
  +[BMDKEventCodec codecWithVersion:](BMDKEventCodec, "codecWithVersion:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeWithProto:", v4);
  v6 = (BMDKEvent *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BMDKEvent)initWithProtoData:(id)a3
{
  id v4;
  void *v5;
  BMDKEvent *v6;

  v4 = a3;
  +[BMDKEventCodec codecWithVersion:](BMDKEventCodec, "codecWithVersion:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeWithProtoData:", v4);
  v6 = (BMDKEvent *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)proto
{
  void *v3;
  void *v4;

  +[BMDKEventCodec codecWithVersion:](BMDKEventCodec, "codecWithVersion:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "encodeAsProto:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[BMDKEvent encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("dat"));

}

- (BMDKEvent)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  BMDKEvent *v7;

  v4 = (void *)MEMORY[0x1E0D81610];
  v5 = a3;
  objc_msgSend(v4, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", objc_opt_class(), CFSTR("dat"), v5, 1, CFSTR("BMStreamErrorDomain"), 2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    self = -[BMDKEvent initWithProtoData:](self, "initWithProtoData:", v6);
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  return -[_DKEvent hash](self->_dkEvent, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMDKEvent proto](self, "proto");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "proto");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v6, "isEqual:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isCompleteWithContext:(id)a3 error:(id *)a4
{
  _DKEvent *dkEvent;

  dkEvent = self->_dkEvent;
  if (a4 && !dkEvent)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("BMStreamErrorDomain"), 3, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return dkEvent != 0;
}

- (void)json
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_18D810000, a2, OS_LOG_TYPE_ERROR, "BMDKEvent: Unable to create json from object: %@", (uint8_t *)&v2, 0xCu);
}

@end
