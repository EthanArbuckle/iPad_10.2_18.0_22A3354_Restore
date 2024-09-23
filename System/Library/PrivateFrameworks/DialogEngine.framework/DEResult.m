@implementation DEResult

- (id)initFromJson:(id)a3
{
  id v4;
  DEResult *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  DEResult *v22;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  objc_super v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)DEResult;
  v5 = -[DEResult init](&v31, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "dataUsingEncoding:", 4);
    v30 = 0;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    objc_msgSend(v6, "valueForKey:", CFSTR("status"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEResult setStatus:](v5, "setStatus:", v7);

    objc_msgSend(v6, "valueForKey:", CFSTR("error"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEResult setError:](v5, "setError:", v8);

    objc_msgSend(v6, "objectForKey:", CFSTR("response"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEResult setResponse:](v5, "setResponse:", v9);

    objc_msgSend(v6, "objectForKey:", CFSTR("visual_refs"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEResult setVisualRefs:](v5, "setVisualRefs:", v10);

    objc_msgSend(v6, "objectForKey:", CFSTR("meta"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEResult setMeta:](v5, "setMeta:", v11);

    objc_msgSend(v6, "objectForKey:", CFSTR("elapsed_ms"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEResult setElapsedTimeMs:](v5, "setElapsedTimeMs:", v12);

    objc_msgSend(v6, "objectForKey:", CFSTR("elapsed_thread_ms"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEResult setElapsedTimeThreadMs:](v5, "setElapsedTimeThreadMs:", v13);

    -[DEResult setJson:](v5, "setJson:", v4);
    -[DEResult response](v5, "response");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      objc_msgSend(v6, "objectForKey:", CFSTR("errors"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15 == 0;

      if (v16)
      {
LABEL_13:
        v22 = v5;

        goto LABEL_14;
      }
      v14 = (void *)objc_opt_new();
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      objc_msgSend(v6, "valueForKey:", CFSTR("errors"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
      if (v18)
      {
        v19 = *(_QWORD *)v27;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v27 != v19)
              objc_enumerationMutation(v17);
            objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "objectForKey:", CFSTR("textWithLineNumber"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "addObject:", v21);

          }
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
        }
        while (v18);
      }

      -[DEResult setResponse:](v5, "setResponse:", v14);
    }

    goto LABEL_13;
  }
LABEL_14:

  return v5;
}

- (NSString)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
  objc_storeStrong((id *)&self->_status, a3);
}

- (NSString)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (NSArray)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
  objc_storeStrong((id *)&self->_response, a3);
}

- (NSArray)visualRefs
{
  return self->_visualRefs;
}

- (void)setVisualRefs:(id)a3
{
  objc_storeStrong((id *)&self->_visualRefs, a3);
}

- (NSDictionary)meta
{
  return self->_meta;
}

- (void)setMeta:(id)a3
{
  objc_storeStrong((id *)&self->_meta, a3);
}

- (NSNumber)elapsedTimeMs
{
  return self->_elapsedTimeMs;
}

- (void)setElapsedTimeMs:(id)a3
{
  objc_storeStrong((id *)&self->_elapsedTimeMs, a3);
}

- (NSNumber)elapsedTimeThreadMs
{
  return self->_elapsedTimeThreadMs;
}

- (void)setElapsedTimeThreadMs:(id)a3
{
  objc_storeStrong((id *)&self->_elapsedTimeThreadMs, a3);
}

- (NSString)json
{
  return self->_json;
}

- (void)setJson:(id)a3
{
  objc_storeStrong((id *)&self->_json, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_json, 0);
  objc_storeStrong((id *)&self->_elapsedTimeThreadMs, 0);
  objc_storeStrong((id *)&self->_elapsedTimeMs, 0);
  objc_storeStrong((id *)&self->_meta, 0);
  objc_storeStrong((id *)&self->_visualRefs, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_status, 0);
}

@end
