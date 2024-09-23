@implementation _CPLateSectionsAppendedFeedback

- (_CPLateSectionsAppendedFeedback)init
{
  _CPLateSectionsAppendedFeedback *v2;
  _CPLateSectionsAppendedFeedback *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_CPLateSectionsAppendedFeedback;
  v2 = -[_CPLateSectionsAppendedFeedback init](&v5, sel_init);
  if (v2)
  {
    -[_CPLateSectionsAppendedFeedback setTimestamp:](v2, "setTimestamp:", mach_absolute_time());
    v3 = v2;
  }

  return v2;
}

- (void)setSections:(id)a3
{
  NSArray *v4;
  NSArray *sections;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  sections = self->_sections;
  self->_sections = v4;

}

- (void)clearSections
{
  -[NSArray removeAllObjects](self->_sections, "removeAllObjects");
}

- (void)addSections:(id)a3
{
  id v4;
  NSArray *sections;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  sections = self->_sections;
  v8 = v4;
  if (!sections)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_sections;
    self->_sections = v6;

    v4 = v8;
    sections = self->_sections;
  }
  -[NSArray addObject:](sections, "addObject:", v4);

}

- (unint64_t)sectionsCount
{
  return -[NSArray count](self->_sections, "count");
}

- (id)sectionsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return _CPLateSectionsAppendedFeedbackReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[_CPLateSectionsAppendedFeedback timestamp](self, "timestamp"))
    PBDataWriterWriteUint64Field();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_sections;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t timestamp;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  BOOL v14;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    timestamp = self->_timestamp;
    if (timestamp == objc_msgSend(v4, "timestamp"))
    {
      -[_CPLateSectionsAppendedFeedback sections](self, "sections");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "sections");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if ((v6 == 0) != (v7 != 0))
      {
        -[_CPLateSectionsAppendedFeedback sections](self, "sections");
        v9 = objc_claimAutoreleasedReturnValue();
        if (!v9)
        {

LABEL_11:
          v14 = 1;
          goto LABEL_9;
        }
        v10 = (void *)v9;
        -[_CPLateSectionsAppendedFeedback sections](self, "sections");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "sections");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqual:", v12);

        if ((v13 & 1) != 0)
          goto LABEL_11;
      }
      else
      {

      }
    }
  }
  v14 = 0;
LABEL_9:

  return v14;
}

- (unint64_t)hash
{
  unint64_t v2;

  v2 = 2654435761u * self->_timestamp;
  return -[NSArray hash](self->_sections, "hash") ^ v2;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (NSArray)sections
{
  return self->_sections;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sections, 0);
}

- (_CPLateSectionsAppendedFeedback)initWithFacade:(id)a3
{
  id v4;
  _CPLateSectionsAppendedFeedback *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  _CPResultSectionForFeedback *v13;
  _CPLateSectionsAppendedFeedback *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)_CPLateSectionsAppendedFeedback;
  v5 = -[_CPLateSectionsAppendedFeedback init](&v20, sel_init);
  if (v5)
  {
    -[_CPLateSectionsAppendedFeedback setTimestamp:](v5, "setTimestamp:", objc_msgSend(v4, "timestamp"));
    objc_msgSend(v4, "sections");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v7 = 0;

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(v4, "sections", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          v13 = -[_CPResultSectionForFeedback initWithFacade:]([_CPResultSectionForFeedback alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i));
          objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      }
      while (v10);
    }

    -[_CPLateSectionsAppendedFeedback setSections:](v5, "setSections:", v7);
    v14 = v5;

  }
  return v5;
}

@end
