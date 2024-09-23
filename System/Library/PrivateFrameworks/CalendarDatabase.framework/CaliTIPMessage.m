@implementation CaliTIPMessage

- (CaliTIPMessage)initWithData:(id)a3 filename:(id)a4
{
  return -[CaliTIPMessage initWithData:filename:scheduleChanges:](self, "initWithData:filename:scheduleChanges:", a3, a4, 0);
}

- (CaliTIPMessage)initWithData:(id)a3 filename:(id)a4 scheduleChanges:(id)a5
{
  return -[CaliTIPMessage initWithData:document:filename:scheduleChanges:](self, "initWithData:document:filename:scheduleChanges:", a3, 0, a4, a5);
}

- (CaliTIPMessage)initWithData:(id)a3 document:(id)a4 filename:(id)a5 scheduleChanges:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  CaliTIPMessage *v14;
  CaliTIPMessage *v15;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)CaliTIPMessage;
  v14 = -[CaliTIPMessage init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    -[CaliTIPMessage setData:](v14, "setData:", v10);
    objc_storeStrong((id *)&v15->_document, a4);
    -[CaliTIPMessage setFilename:](v15, "setFilename:", v12);
    -[CaliTIPMessage setScheduleChanges:](v15, "setScheduleChanges:", v13);
  }

  return v15;
}

- (ICSDocument)document
{
  ICSDocument *document;
  ICSDocument *v4;
  ICSDocument *v5;

  document = self->_document;
  if (!document)
  {
    v4 = (ICSDocument *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDB820]), "initWithData:options:error:", self->_data, 0, 0);
    v5 = self->_document;
    self->_document = v4;

    document = self->_document;
  }
  return document;
}

- (ICSCalendar)calendar
{
  void *v2;
  void *v3;

  -[CaliTIPMessage document](self, "document");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "calendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICSCalendar *)v3;
}

- (ICSEvent)event
{
  ICSEvent *event;
  ICSEvent *v3;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v24;
  ICSEvent *v25;
  void *v26;
  ICSEvent *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  event = self->_event;
  if (!event)
  {
    -[CaliTIPMessage calendar](self, "calendar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "componentKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v40;
        v33 = v6;
        v34 = v7;
        v31 = *(_QWORD *)v40;
        while (2)
        {
          v11 = 0;
          v32 = v9;
          do
          {
            if (*(_QWORD *)v40 != v10)
              objc_enumerationMutation(v7);
            v12 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v11);
            objc_msgSend(v5, "componentForKey:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (v13)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v28 = objc_opt_class();
                v29 = objc_opt_class();
                NSLog(CFSTR("%@: component not supported in iTIP message: %@"), v28, v29);
LABEL_24:

                v6 = v33;
                goto LABEL_26;
              }
            }
            objc_msgSend(v5, "componentOccurrencesForKey:", v12);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = 0u;
            v36 = 0u;
            v37 = 0u;
            v38 = 0u;
            v15 = v14;
            v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
            if (v16)
            {
              v17 = v16;
              v18 = *(_QWORD *)v36;
              while (2)
              {
                for (i = 0; i != v17; ++i)
                {
                  if (*(_QWORD *)v36 != v18)
                    objc_enumerationMutation(v15);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    v21 = objc_opt_class();
                    v22 = objc_opt_class();
                    NSLog(CFSTR("%@: component not supported in iTIP message: %@"), v21, v22);

                    v7 = v34;
                    goto LABEL_24;
                  }
                }
                v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
                if (v17)
                  continue;
                break;
              }
            }

            ++v11;
            v10 = v31;
            v7 = v34;
          }
          while (v11 != v32);
          v9 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
          v6 = v33;
          if (v9)
            continue;
          break;
        }
      }

      if ((unint64_t)objc_msgSend(v7, "count") < 2)
      {
        objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "componentForKey:", v24);
        v25 = (ICSEvent *)objc_claimAutoreleasedReturnValue();
        if (!v25)
        {
          objc_msgSend(v5, "componentOccurrencesForKey:", v24);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v26, "count"))
          {
            objc_msgSend(v26, "objectAtIndexedSubscript:", 0);
            v25 = (ICSEvent *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v25 = 0;
          }

        }
        v27 = self->_event;
        self->_event = v25;

        event = self->_event;
        goto LABEL_2;
      }
      v20 = objc_opt_class();
      NSLog(CFSTR("%@: more than one event in iTIP message: %lu"), v20, objc_msgSend(v7, "count"));
    }
    else
    {
      v30 = objc_opt_class();
      NSLog(CFSTR("%@: iTIP Message contained no events"), v30);
    }
LABEL_26:

    v3 = 0;
    return v3;
  }
LABEL_2:
  v3 = event;
  return v3;
}

- (ICSEvent)masterEvent
{
  void *v3;
  void *v4;
  void *v5;

  -[CaliTIPMessage event](self, "event");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recurrence_id");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = 0;
  }
  else
  {
    -[CaliTIPMessage event](self, "event");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (ICSEvent *)v5;
}

- (NSArray)allOccurrences
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[CaliTIPMessage event](self, "event");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v3, "recurrence_id");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      objc_msgSend(v4, "addObject:", v3);
    -[CaliTIPMessage calendar](self, "calendar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "uid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "componentOccurrencesForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v8);

  }
  return (NSArray *)v4;
}

- (NSArray)occurrences
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[CaliTIPMessage event](self, "event");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recurrence_id");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = 0;
  }
  else
  {
    -[CaliTIPMessage calendar](self, "calendar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "uid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "componentOccurrencesForKey:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSArray *)v5;
}

- (int64_t)compare:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  int64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[CaliTIPMessage event](self, "event");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "event");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "sequence");
  if (v7 >= objc_msgSend(v6, "sequence"))
  {
    v9 = objc_msgSend(v5, "sequence");
    if (v9 <= objc_msgSend(v6, "sequence"))
    {
      objc_msgSend(v5, "dtstamp");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "value");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dtstamp");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "value");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v11, "compare:", v13);

    }
    else
    {
      v8 = 1;
    }
  }
  else
  {
    v8 = -1;
  }

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;

  -[CaliTIPMessage calendar](self, "calendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CaliTIPMessage event](self, "event");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0CB3940];
  v5 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0DDB7D8], "ICSStringFromMethod:", objc_msgSend(v3, "method"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "sequence");
  objc_msgSend(v4, "dtstamp");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "value");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "summary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("%@ <%p> { %@ %@ %ld %@ \"%@\"}"), v5, self, v6, v7, v8, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (CalDAVScheduleChangesProperty)scheduleChanges
{
  return self->_scheduleChanges;
}

- (void)setScheduleChanges:(id)a3
{
  objc_storeStrong((id *)&self->_scheduleChanges, a3);
}

- (NSString)filename
{
  return self->_filename;
}

- (void)setFilename:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setDocument:(id)a3
{
  objc_storeStrong((id *)&self->_document, a3);
}

- (void)setEvent:(id)a3
{
  objc_storeStrong((id *)&self->_event, a3);
}

- (BOOL)iMIPImported
{
  return self->_iMIPImported;
}

- (void)setIMIPImported:(BOOL)a3
{
  self->_iMIPImported = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_document, 0);
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_scheduleChanges, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
