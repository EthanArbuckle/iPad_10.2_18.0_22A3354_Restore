@implementation _CPStartNetworkSearchFeedback

- (_CPStartNetworkSearchFeedback)init
{
  _CPStartNetworkSearchFeedback *v2;
  _CPStartNetworkSearchFeedback *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_CPStartNetworkSearchFeedback;
  v2 = -[_CPStartNetworkSearchFeedback init](&v5, sel_init);
  if (v2)
  {
    -[_CPStartNetworkSearchFeedback setTimestamp:](v2, "setTimestamp:", mach_absolute_time());
    v3 = v2;
  }

  return v2;
}

- (void)clearTrigger
{
  self->_whichTrigger = 0;
  self->_triggerEvent = 0;
  self->_lookupSelectionType = 0;
}

- (void)setHeaders:(id)a3
{
  NSDictionary *v4;
  NSDictionary *headers;

  v4 = (NSDictionary *)objc_msgSend(a3, "mutableCopy");
  headers = self->_headers;
  self->_headers = v4;

}

- (BOOL)getHeaders:(id *)a3 forKey:(id)a4
{
  void *v5;
  void *v6;

  -[NSDictionary objectForKeyedSubscript:](self->_headers, "objectForKeyedSubscript:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a3 && v5)
    *a3 = objc_retainAutorelease(v5);

  return v6 != 0;
}

- (void)setHeaders:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NSDictionary *v8;
  NSDictionary *headers;
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  if (!self->_headers)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    headers = self->_headers;
    self->_headers = v8;

  }
  v10 = v7;
  v11 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NSDictionary setObject:forKey:](self->_headers, "setObject:forKey:", v11, v10);
  }

}

- (void)setTriggerEvent:(int)a3
{
  -[_CPStartNetworkSearchFeedback clearTrigger](self, "clearTrigger");
  self->_whichTrigger = 1;
  self->_triggerEvent = a3;
}

- (int)triggerEvent
{
  if (self->_whichTrigger == 1)
    return self->_triggerEvent;
  else
    return 0;
}

- (void)setLookupSelectionType:(int)a3
{
  -[_CPStartNetworkSearchFeedback clearTrigger](self, "clearTrigger");
  self->_whichTrigger = 2;
  self->_lookupSelectionType = a3;
}

- (int)lookupSelectionType
{
  if (self->_whichTrigger == 2)
    return self->_lookupSelectionType;
  else
    return 0;
}

- (BOOL)readFrom:(id)a3
{
  return _CPStartNetworkSearchFeedbackReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSDictionary *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[_CPStartNetworkSearchFeedback timestamp](self, "timestamp"))
    PBDataWriterWriteUint64Field();
  -[_CPStartNetworkSearchFeedback input](self, "input");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  -[_CPStartNetworkSearchFeedback uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  if (-[_CPStartNetworkSearchFeedback queryId](self, "queryId"))
    PBDataWriterWriteUint64Field();
  -[_CPStartNetworkSearchFeedback url](self, "url");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    PBDataWriterWriteStringField();
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = self->_headers;
  v9 = -[NSDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        PBDataWriterPlaceMark();
        PBDataWriterWriteStringField();
        -[NSDictionary objectForKeyedSubscript:](self->_headers, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        PBDataWriterWriteStringField();

        PBDataWriterRecallMark();
      }
      v10 = -[NSDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  if (-[_CPStartNetworkSearchFeedback endpoint](self, "endpoint"))
    PBDataWriterWriteInt32Field();
  if (-[_CPStartNetworkSearchFeedback triggerEvent](self, "triggerEvent"))
    PBDataWriterWriteInt32Field();
  if (-[_CPStartNetworkSearchFeedback lookupSelectionType](self, "lookupSelectionType"))
    PBDataWriterWriteInt32Field();
  -[_CPStartNetworkSearchFeedback bodyData](self, "bodyData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    PBDataWriterWriteDataField();
  -[_CPStartNetworkSearchFeedback experimentId](self, "experimentId");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    PBDataWriterWriteStringField();
  -[_CPStartNetworkSearchFeedback treatmentId](self, "treatmentId");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
    PBDataWriterWriteStringField();
  if (-[_CPStartNetworkSearchFeedback searchType](self, "searchType"))
    PBDataWriterWriteInt32Field();
  if (-[_CPStartNetworkSearchFeedback rawRequestSize](self, "rawRequestSize"))
    PBDataWriterWriteUint64Field();
  if (-[_CPStartNetworkSearchFeedback compressedRequestSize](self, "compressedRequestSize"))
    PBDataWriterWriteUint64Field();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t timestamp;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  unint64_t queryId;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  int endpoint;
  int triggerEvent;
  int lookupSelectionType;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  BOOL v47;
  int searchType;
  unint64_t rawRequestSize;
  unint64_t compressedRequestSize;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_42;
  timestamp = self->_timestamp;
  if (timestamp != objc_msgSend(v4, "timestamp"))
    goto LABEL_42;
  -[_CPStartNetworkSearchFeedback input](self, "input");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "input");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_41;
  -[_CPStartNetworkSearchFeedback input](self, "input");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[_CPStartNetworkSearchFeedback input](self, "input");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "input");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_42;
  }
  else
  {

  }
  -[_CPStartNetworkSearchFeedback uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_41;
  -[_CPStartNetworkSearchFeedback uuid](self, "uuid");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[_CPStartNetworkSearchFeedback uuid](self, "uuid");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uuid");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_42;
  }
  else
  {

  }
  queryId = self->_queryId;
  if (queryId != objc_msgSend(v4, "queryId"))
    goto LABEL_42;
  -[_CPStartNetworkSearchFeedback url](self, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "url");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_41;
  -[_CPStartNetworkSearchFeedback url](self, "url");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    -[_CPStartNetworkSearchFeedback url](self, "url");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "url");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "isEqual:", v22);

    if (!v23)
      goto LABEL_42;
  }
  else
  {

  }
  -[_CPStartNetworkSearchFeedback headers](self, "headers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "headers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_41;
  -[_CPStartNetworkSearchFeedback headers](self, "headers");
  v24 = objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v25 = (void *)v24;
    -[_CPStartNetworkSearchFeedback headers](self, "headers");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "headers");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v26, "isEqual:", v27);

    if (!v28)
      goto LABEL_42;
  }
  else
  {

  }
  endpoint = self->_endpoint;
  if (endpoint != objc_msgSend(v4, "endpoint"))
    goto LABEL_42;
  triggerEvent = self->_triggerEvent;
  if (triggerEvent != objc_msgSend(v4, "triggerEvent"))
    goto LABEL_42;
  lookupSelectionType = self->_lookupSelectionType;
  if (lookupSelectionType != objc_msgSend(v4, "lookupSelectionType"))
    goto LABEL_42;
  -[_CPStartNetworkSearchFeedback bodyData](self, "bodyData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bodyData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_41;
  -[_CPStartNetworkSearchFeedback bodyData](self, "bodyData");
  v32 = objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = (void *)v32;
    -[_CPStartNetworkSearchFeedback bodyData](self, "bodyData");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bodyData");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqual:", v35);

    if (!v36)
      goto LABEL_42;
  }
  else
  {

  }
  -[_CPStartNetworkSearchFeedback experimentId](self, "experimentId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "experimentId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_41;
  -[_CPStartNetworkSearchFeedback experimentId](self, "experimentId");
  v37 = objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    v38 = (void *)v37;
    -[_CPStartNetworkSearchFeedback experimentId](self, "experimentId");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "experimentId");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v39, "isEqual:", v40);

    if (!v41)
      goto LABEL_42;
  }
  else
  {

  }
  -[_CPStartNetworkSearchFeedback treatmentId](self, "treatmentId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "treatmentId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
  {
LABEL_41:

    goto LABEL_42;
  }
  -[_CPStartNetworkSearchFeedback treatmentId](self, "treatmentId");
  v42 = objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    v43 = (void *)v42;
    -[_CPStartNetworkSearchFeedback treatmentId](self, "treatmentId");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "treatmentId");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v44, "isEqual:", v45);

    if (!v46)
      goto LABEL_42;
  }
  else
  {

  }
  searchType = self->_searchType;
  if (searchType == objc_msgSend(v4, "searchType"))
  {
    rawRequestSize = self->_rawRequestSize;
    if (rawRequestSize == objc_msgSend(v4, "rawRequestSize"))
    {
      compressedRequestSize = self->_compressedRequestSize;
      v47 = compressedRequestSize == objc_msgSend(v4, "compressedRequestSize");
      goto LABEL_43;
    }
  }
LABEL_42:
  v47 = 0;
LABEL_43:

  return v47;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  unint64_t v6;
  NSUInteger v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSUInteger v11;

  v3 = 2654435761u * self->_timestamp;
  v4 = -[NSString hash](self->_input, "hash");
  v5 = v4 ^ -[NSString hash](self->_uuid, "hash") ^ v3;
  v6 = 2654435761u * self->_queryId;
  v7 = v5 ^ v6 ^ -[NSString hash](self->_url, "hash");
  v8 = v7 ^ -[NSDictionary hash](self->_headers, "hash") ^ (2654435761 * self->_endpoint) ^ (2654435761
                                                                                             * self->_triggerEvent);
  v9 = 2654435761 * self->_lookupSelectionType;
  v10 = v9 ^ -[NSData hash](self->_bodyData, "hash");
  v11 = v10 ^ -[NSString hash](self->_experimentId, "hash");
  return v8 ^ v11 ^ -[NSString hash](self->_treatmentId, "hash") ^ (2654435761 * self->_searchType) ^ (2654435761u * self->_rawRequestSize) ^ (2654435761u * self->_compressedRequestSize);
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (NSString)input
{
  return self->_input;
}

- (void)setInput:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (unint64_t)queryId
{
  return self->_queryId;
}

- (void)setQueryId:(unint64_t)a3
{
  self->_queryId = a3;
}

- (NSString)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDictionary)headers
{
  return self->_headers;
}

- (int)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(int)a3
{
  self->_endpoint = a3;
}

- (NSData)bodyData
{
  return self->_bodyData;
}

- (void)setBodyData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)experimentId
{
  return self->_experimentId;
}

- (void)setExperimentId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)treatmentId
{
  return self->_treatmentId;
}

- (void)setTreatmentId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (int)searchType
{
  return self->_searchType;
}

- (void)setSearchType:(int)a3
{
  self->_searchType = a3;
}

- (unint64_t)rawRequestSize
{
  return self->_rawRequestSize;
}

- (void)setRawRequestSize:(unint64_t)a3
{
  self->_rawRequestSize = a3;
}

- (unint64_t)compressedRequestSize
{
  return self->_compressedRequestSize;
}

- (void)setCompressedRequestSize:(unint64_t)a3
{
  self->_compressedRequestSize = a3;
}

- (unint64_t)whichTrigger
{
  return self->_whichTrigger;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_treatmentId, 0);
  objc_storeStrong((id *)&self->_experimentId, 0);
  objc_storeStrong((id *)&self->_bodyData, 0);
  objc_storeStrong((id *)&self->_headers, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_input, 0);
}

- (_CPStartNetworkSearchFeedback)initWithFacade:(id)a3
{
  id v4;
  _CPStartNetworkSearchFeedback *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _CPStartNetworkSearchFeedback *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)_CPStartNetworkSearchFeedback;
  v5 = -[_CPStartNetworkSearchFeedback init](&v32, sel_init);
  if (v5)
  {
    -[_CPStartNetworkSearchFeedback setTimestamp:](v5, "setTimestamp:", objc_msgSend(v4, "timestamp"));
    objc_msgSend(v4, "input");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "input");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CPStartNetworkSearchFeedback setInput:](v5, "setInput:", v7);

    }
    objc_msgSend(v4, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "uuid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CPStartNetworkSearchFeedback setUuid:](v5, "setUuid:", v9);

    }
    -[_CPStartNetworkSearchFeedback setQueryId:](v5, "setQueryId:", objc_msgSend(v4, "queryId"));
    objc_msgSend(v4, "url");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "url");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CPStartNetworkSearchFeedback setUrl:](v5, "setUrl:", v11);

    }
    objc_msgSend(v4, "headers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v15 = v13;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v29 != v18)
            objc_enumerationMutation(v15);
          v20 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v15, "objectForKey:", v20, (_QWORD)v28);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
            objc_msgSend(v14, "setObject:forKey:", v21, v20);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v17);
    }

    -[_CPStartNetworkSearchFeedback setHeaders:](v5, "setHeaders:", v14);
    -[_CPStartNetworkSearchFeedback setEndpoint:](v5, "setEndpoint:", objc_msgSend(v4, "endpoint"));
    -[_CPStartNetworkSearchFeedback setTriggerEvent:](v5, "setTriggerEvent:", objc_msgSend(v4, "triggerEvent"));
    objc_msgSend(v4, "experimentId");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v4, "experimentId");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CPStartNetworkSearchFeedback setExperimentId:](v5, "setExperimentId:", v23);

    }
    objc_msgSend(v4, "treatmentId", (_QWORD)v28);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v4, "treatmentId");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CPStartNetworkSearchFeedback setTreatmentId:](v5, "setTreatmentId:", v25);

    }
    -[_CPStartNetworkSearchFeedback setSearchType:](v5, "setSearchType:", objc_msgSend(v4, "searchType"));
    -[_CPStartNetworkSearchFeedback setRawRequestSize:](v5, "setRawRequestSize:", objc_msgSend(v4, "rawRequestSize"));
    -[_CPStartNetworkSearchFeedback setCompressedRequestSize:](v5, "setCompressedRequestSize:", objc_msgSend(v4, "compressedRequestSize"));
    v26 = v5;

  }
  return v5;
}

+ (id)startSearchFeedbackWithUUID
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init((Class)a1);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUuid:", v4);

  return v2;
}

@end
