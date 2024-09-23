@implementation _INPBSearchForNotebookItemsIntent

- (void)setContent:(id)a3
{
  NSString *v4;
  NSString *content;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  content = self->_content;
  self->_content = v4;

}

- (BOOL)hasContent
{
  return self->_content != 0;
}

- (void)setDateSearchType:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xFE;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 1;
    self->_dateSearchType = a3;
  }
}

- (BOOL)hasDateSearchType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasDateSearchType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)dateSearchTypeAsString:(int)a3
{
  __CFString *v3;

  if (a3 > 19)
  {
    if (a3 == 20)
      return CFSTR("BY_MODIFIED_DATE");
    if (a3 == 30)
      return CFSTR("BY_CREATED_DATE");
    goto LABEL_10;
  }
  if (!a3)
    return CFSTR("UNKNOWN_DATE_SEARCH_TYPE");
  if (a3 != 10)
  {
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v3;
  }
  v3 = CFSTR("BY_DUE_DATE");
  return v3;
}

- (int)StringAsDateSearchType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_DATE_SEARCH_TYPE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BY_DUE_DATE")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BY_MODIFIED_DATE")) & 1) != 0)
  {
    v4 = 20;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("BY_CREATED_DATE")))
  {
    v4 = 30;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setDateTime:(id)a3
{
  objc_storeStrong((id *)&self->_dateTime, a3);
}

- (BOOL)hasDateTime
{
  return self->_dateTime != 0;
}

- (void)setGroupName:(id)a3
{
  objc_storeStrong((id *)&self->_groupName, a3);
}

- (BOOL)hasGroupName
{
  return self->_groupName != 0;
}

- (void)setIncludeAllNoteContents:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_includeAllNoteContents = a3;
}

- (BOOL)hasIncludeAllNoteContents
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasIncludeAllNoteContents:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)setIntentMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_intentMetadata, a3);
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setItemType:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xFB;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 4;
    self->_itemType = a3;
  }
}

- (BOOL)hasItemType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasItemType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (id)itemTypeAsString:(int)a3
{
  __CFString *v3;

  if (a3 > 19)
  {
    if (a3 == 20)
      return CFSTR("TASK_LIST");
    if (a3 == 30)
      return CFSTR("TASK");
    goto LABEL_10;
  }
  if (!a3)
    return CFSTR("UNKNOWN_NOTE_TYPE");
  if (a3 != 10)
  {
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v3;
  }
  v3 = CFSTR("NOTE");
  return v3;
}

- (int)StringAsItemType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_NOTE_TYPE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOTE")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TASK_LIST")) & 1) != 0)
  {
    v4 = 20;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("TASK")))
  {
    v4 = 30;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (BOOL)hasLocation
{
  return self->_location != 0;
}

- (void)setLocationSearchType:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xF7;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 8;
    self->_locationSearchType = a3;
  }
}

- (BOOL)hasLocationSearchType
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasLocationSearchType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (id)locationSearchTypeAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("UNKNOWN_LOCATION_SEARCH_TYPE");
  if (a3 == 10)
  {
    v3 = CFSTR("BY_LOCATION_TRIGGER");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsLocationSearchType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_LOCATION_SEARCH_TYPE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("BY_LOCATION_TRIGGER")))
  {
    v4 = 10;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setNotebookItemIdentifier:(id)a3
{
  NSString *v4;
  NSString *notebookItemIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  notebookItemIdentifier = self->_notebookItemIdentifier;
  self->_notebookItemIdentifier = v4;

}

- (BOOL)hasNotebookItemIdentifier
{
  return self->_notebookItemIdentifier != 0;
}

- (void)setStatus:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xEF;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 0x10;
    self->_status = a3;
  }
}

- (BOOL)hasStatus
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasStatus:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (id)statusAsString:(int)a3
{
  __CFString *v3;

  switch(a3)
  {
    case 0:
      return CFSTR("UNKNOWN_STATUS");
    case 20:
      return CFSTR("COMPLETED");
    case 10:
      v3 = CFSTR("NOT_COMPLETED");
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v3;
}

- (int)StringAsStatus:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_STATUS")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOT_COMPLETED")) & 1) != 0)
  {
    v4 = 10;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("COMPLETED")))
  {
    v4 = 20;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setTaskPriority:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xDF;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 0x20;
    self->_taskPriority = a3;
  }
}

- (BOOL)hasTaskPriority
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setHasTaskPriority:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (id)taskPriorityAsString:(int)a3
{
  if (a3 < 3)
    return off_1E2290068[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsTaskPriority:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_PRIORITY")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOT_FLAGGED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("FLAGGED")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setTemporalEventTriggerTypes:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (int)temporalEventTriggerTypes
{
  return self->_temporalEventTriggerTypes.list;
}

- (void)clearTemporalEventTriggerTypes
{
  PBRepeatedInt32Clear();
}

- (void)addTemporalEventTriggerType:(int)a3
{
  if (a3 != 0x7FFFFFFF)
    PBRepeatedInt32Add();
}

- (unint64_t)temporalEventTriggerTypesCount
{
  return self->_temporalEventTriggerTypes.count;
}

- (int)temporalEventTriggerTypeAtIndex:(unint64_t)a3
{
  return self->_temporalEventTriggerTypes.list[a3];
}

- (id)temporalEventTriggerTypesAsString:(int)a3
{
  if (a3 < 4)
    return off_1E2290080[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsTemporalEventTriggerTypes:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_TEMPORAL_TRIGGER_TYPE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOT_SCHEDULED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SCHEDULED_NON_RECURRING")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SCHEDULED_RECURRING")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSearchForNotebookItemsIntentReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  -[_INPBSearchForNotebookItemsIntent content](self, "content");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  if (-[_INPBSearchForNotebookItemsIntent hasDateSearchType](self, "hasDateSearchType"))
    PBDataWriterWriteInt32Field();
  -[_INPBSearchForNotebookItemsIntent dateTime](self, "dateTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_INPBSearchForNotebookItemsIntent dateTime](self, "dateTime");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBSearchForNotebookItemsIntent groupName](self, "groupName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[_INPBSearchForNotebookItemsIntent groupName](self, "groupName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBSearchForNotebookItemsIntent hasIncludeAllNoteContents](self, "hasIncludeAllNoteContents"))
    PBDataWriterWriteBOOLField();
  -[_INPBSearchForNotebookItemsIntent intentMetadata](self, "intentMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[_INPBSearchForNotebookItemsIntent intentMetadata](self, "intentMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBSearchForNotebookItemsIntent hasItemType](self, "hasItemType"))
    PBDataWriterWriteInt32Field();
  -[_INPBSearchForNotebookItemsIntent location](self, "location");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[_INPBSearchForNotebookItemsIntent location](self, "location");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBSearchForNotebookItemsIntent hasLocationSearchType](self, "hasLocationSearchType"))
    PBDataWriterWriteInt32Field();
  -[_INPBSearchForNotebookItemsIntent notebookItemIdentifier](self, "notebookItemIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    PBDataWriterWriteStringField();
  if (-[_INPBSearchForNotebookItemsIntent hasStatus](self, "hasStatus"))
    PBDataWriterWriteInt32Field();
  if (-[_INPBSearchForNotebookItemsIntent hasTaskPriority](self, "hasTaskPriority"))
    PBDataWriterWriteInt32Field();
  if (self->_temporalEventTriggerTypes.count)
  {
    v14 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v14;
    }
    while (v14 < self->_temporalEventTriggerTypes.count);
  }
  -[_INPBSearchForNotebookItemsIntent title](self, "title");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[_INPBSearchForNotebookItemsIntent title](self, "title");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (void)dealloc
{
  objc_super v3;

  -[_INPBSearchForNotebookItemsIntent clearTemporalEventTriggerTypes](self, "clearTemporalEventTriggerTypes");
  v3.receiver = self;
  v3.super_class = (Class)_INPBSearchForNotebookItemsIntent;
  -[_INPBSearchForNotebookItemsIntent dealloc](&v3, sel_dealloc);
}

- (_INPBSearchForNotebookItemsIntent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBSearchForNotebookItemsIntent *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBSearchForNotebookItemsIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBSearchForNotebookItemsIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBSearchForNotebookItemsIntent initWithData:](self, "initWithData:", v6);

    v6 = self;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_INPBSearchForNotebookItemsIntent data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBSearchForNotebookItemsIntent *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v5 = -[_INPBSearchForNotebookItemsIntent init](+[_INPBSearchForNotebookItemsIntent allocWithZone:](_INPBSearchForNotebookItemsIntent, "allocWithZone:"), "init");
  v6 = (void *)-[NSString copyWithZone:](self->_content, "copyWithZone:", a3);
  -[_INPBSearchForNotebookItemsIntent setContent:](v5, "setContent:", v6);

  if (-[_INPBSearchForNotebookItemsIntent hasDateSearchType](self, "hasDateSearchType"))
    -[_INPBSearchForNotebookItemsIntent setDateSearchType:](v5, "setDateSearchType:", -[_INPBSearchForNotebookItemsIntent dateSearchType](self, "dateSearchType"));
  v7 = -[_INPBDateTimeRange copyWithZone:](self->_dateTime, "copyWithZone:", a3);
  -[_INPBSearchForNotebookItemsIntent setDateTime:](v5, "setDateTime:", v7);

  v8 = -[_INPBDataString copyWithZone:](self->_groupName, "copyWithZone:", a3);
  -[_INPBSearchForNotebookItemsIntent setGroupName:](v5, "setGroupName:", v8);

  if (-[_INPBSearchForNotebookItemsIntent hasIncludeAllNoteContents](self, "hasIncludeAllNoteContents"))
    -[_INPBSearchForNotebookItemsIntent setIncludeAllNoteContents:](v5, "setIncludeAllNoteContents:", -[_INPBSearchForNotebookItemsIntent includeAllNoteContents](self, "includeAllNoteContents"));
  v9 = -[_INPBIntentMetadata copyWithZone:](self->_intentMetadata, "copyWithZone:", a3);
  -[_INPBSearchForNotebookItemsIntent setIntentMetadata:](v5, "setIntentMetadata:", v9);

  if (-[_INPBSearchForNotebookItemsIntent hasItemType](self, "hasItemType"))
    -[_INPBSearchForNotebookItemsIntent setItemType:](v5, "setItemType:", -[_INPBSearchForNotebookItemsIntent itemType](self, "itemType"));
  v10 = -[_INPBLocation copyWithZone:](self->_location, "copyWithZone:", a3);
  -[_INPBSearchForNotebookItemsIntent setLocation:](v5, "setLocation:", v10);

  if (-[_INPBSearchForNotebookItemsIntent hasLocationSearchType](self, "hasLocationSearchType"))
    -[_INPBSearchForNotebookItemsIntent setLocationSearchType:](v5, "setLocationSearchType:", -[_INPBSearchForNotebookItemsIntent locationSearchType](self, "locationSearchType"));
  v11 = (void *)-[NSString copyWithZone:](self->_notebookItemIdentifier, "copyWithZone:", a3);
  -[_INPBSearchForNotebookItemsIntent setNotebookItemIdentifier:](v5, "setNotebookItemIdentifier:", v11);

  if (-[_INPBSearchForNotebookItemsIntent hasStatus](self, "hasStatus"))
    -[_INPBSearchForNotebookItemsIntent setStatus:](v5, "setStatus:", -[_INPBSearchForNotebookItemsIntent status](self, "status"));
  if (-[_INPBSearchForNotebookItemsIntent hasTaskPriority](self, "hasTaskPriority"))
    -[_INPBSearchForNotebookItemsIntent setTaskPriority:](v5, "setTaskPriority:", -[_INPBSearchForNotebookItemsIntent taskPriority](self, "taskPriority"));
  PBRepeatedInt32Copy();
  v12 = -[_INPBDataString copyWithZone:](self->_title, "copyWithZone:", a3);
  -[_INPBSearchForNotebookItemsIntent setTitle:](v5, "setTitle:", v12);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  int dateSearchType;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  int v24;
  int includeAllNoteContents;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  int v31;
  int itemType;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  int v38;
  int locationSearchType;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  int v45;
  int status;
  int v47;
  int taskPriority;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  char v53;
  BOOL v54;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_62;
  -[_INPBSearchForNotebookItemsIntent content](self, "content");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "content");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_61;
  -[_INPBSearchForNotebookItemsIntent content](self, "content");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBSearchForNotebookItemsIntent content](self, "content");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "content");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_62;
  }
  else
  {

  }
  v12 = -[_INPBSearchForNotebookItemsIntent hasDateSearchType](self, "hasDateSearchType");
  if (v12 != objc_msgSend(v4, "hasDateSearchType"))
    goto LABEL_62;
  if (-[_INPBSearchForNotebookItemsIntent hasDateSearchType](self, "hasDateSearchType"))
  {
    if (objc_msgSend(v4, "hasDateSearchType"))
    {
      dateSearchType = self->_dateSearchType;
      if (dateSearchType != objc_msgSend(v4, "dateSearchType"))
        goto LABEL_62;
    }
  }
  -[_INPBSearchForNotebookItemsIntent dateTime](self, "dateTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_61;
  -[_INPBSearchForNotebookItemsIntent dateTime](self, "dateTime");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    -[_INPBSearchForNotebookItemsIntent dateTime](self, "dateTime");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dateTime");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqual:", v17);

    if (!v18)
      goto LABEL_62;
  }
  else
  {

  }
  -[_INPBSearchForNotebookItemsIntent groupName](self, "groupName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "groupName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_61;
  -[_INPBSearchForNotebookItemsIntent groupName](self, "groupName");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    -[_INPBSearchForNotebookItemsIntent groupName](self, "groupName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "groupName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "isEqual:", v22);

    if (!v23)
      goto LABEL_62;
  }
  else
  {

  }
  v24 = -[_INPBSearchForNotebookItemsIntent hasIncludeAllNoteContents](self, "hasIncludeAllNoteContents");
  if (v24 != objc_msgSend(v4, "hasIncludeAllNoteContents"))
    goto LABEL_62;
  if (-[_INPBSearchForNotebookItemsIntent hasIncludeAllNoteContents](self, "hasIncludeAllNoteContents"))
  {
    if (objc_msgSend(v4, "hasIncludeAllNoteContents"))
    {
      includeAllNoteContents = self->_includeAllNoteContents;
      if (includeAllNoteContents != objc_msgSend(v4, "includeAllNoteContents"))
        goto LABEL_62;
    }
  }
  -[_INPBSearchForNotebookItemsIntent intentMetadata](self, "intentMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_61;
  -[_INPBSearchForNotebookItemsIntent intentMetadata](self, "intentMetadata");
  v26 = objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    v27 = (void *)v26;
    -[_INPBSearchForNotebookItemsIntent intentMetadata](self, "intentMetadata");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentMetadata");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v28, "isEqual:", v29);

    if (!v30)
      goto LABEL_62;
  }
  else
  {

  }
  v31 = -[_INPBSearchForNotebookItemsIntent hasItemType](self, "hasItemType");
  if (v31 != objc_msgSend(v4, "hasItemType"))
    goto LABEL_62;
  if (-[_INPBSearchForNotebookItemsIntent hasItemType](self, "hasItemType"))
  {
    if (objc_msgSend(v4, "hasItemType"))
    {
      itemType = self->_itemType;
      if (itemType != objc_msgSend(v4, "itemType"))
        goto LABEL_62;
    }
  }
  -[_INPBSearchForNotebookItemsIntent location](self, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "location");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_61;
  -[_INPBSearchForNotebookItemsIntent location](self, "location");
  v33 = objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    v34 = (void *)v33;
    -[_INPBSearchForNotebookItemsIntent location](self, "location");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "location");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v35, "isEqual:", v36);

    if (!v37)
      goto LABEL_62;
  }
  else
  {

  }
  v38 = -[_INPBSearchForNotebookItemsIntent hasLocationSearchType](self, "hasLocationSearchType");
  if (v38 != objc_msgSend(v4, "hasLocationSearchType"))
    goto LABEL_62;
  if (-[_INPBSearchForNotebookItemsIntent hasLocationSearchType](self, "hasLocationSearchType"))
  {
    if (objc_msgSend(v4, "hasLocationSearchType"))
    {
      locationSearchType = self->_locationSearchType;
      if (locationSearchType != objc_msgSend(v4, "locationSearchType"))
        goto LABEL_62;
    }
  }
  -[_INPBSearchForNotebookItemsIntent notebookItemIdentifier](self, "notebookItemIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notebookItemIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_61;
  -[_INPBSearchForNotebookItemsIntent notebookItemIdentifier](self, "notebookItemIdentifier");
  v40 = objc_claimAutoreleasedReturnValue();
  if (v40)
  {
    v41 = (void *)v40;
    -[_INPBSearchForNotebookItemsIntent notebookItemIdentifier](self, "notebookItemIdentifier");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "notebookItemIdentifier");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v42, "isEqual:", v43);

    if (!v44)
      goto LABEL_62;
  }
  else
  {

  }
  v45 = -[_INPBSearchForNotebookItemsIntent hasStatus](self, "hasStatus");
  if (v45 != objc_msgSend(v4, "hasStatus"))
    goto LABEL_62;
  if (-[_INPBSearchForNotebookItemsIntent hasStatus](self, "hasStatus"))
  {
    if (objc_msgSend(v4, "hasStatus"))
    {
      status = self->_status;
      if (status != objc_msgSend(v4, "status"))
        goto LABEL_62;
    }
  }
  v47 = -[_INPBSearchForNotebookItemsIntent hasTaskPriority](self, "hasTaskPriority");
  if (v47 != objc_msgSend(v4, "hasTaskPriority"))
    goto LABEL_62;
  if (-[_INPBSearchForNotebookItemsIntent hasTaskPriority](self, "hasTaskPriority"))
  {
    if (objc_msgSend(v4, "hasTaskPriority"))
    {
      taskPriority = self->_taskPriority;
      if (taskPriority != objc_msgSend(v4, "taskPriority"))
        goto LABEL_62;
    }
  }
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_62;
  -[_INPBSearchForNotebookItemsIntent title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBSearchForNotebookItemsIntent title](self, "title");
    v49 = objc_claimAutoreleasedReturnValue();
    if (!v49)
    {

LABEL_65:
      v54 = 1;
      goto LABEL_63;
    }
    v50 = (void *)v49;
    -[_INPBSearchForNotebookItemsIntent title](self, "title");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "title");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v51, "isEqual:", v52);

    if ((v53 & 1) != 0)
      goto LABEL_65;
  }
  else
  {
LABEL_61:

  }
LABEL_62:
  v54 = 0;
LABEL_63:

  return v54;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  NSUInteger v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v14;
  uint64_t v15;
  NSUInteger v16;

  v16 = -[NSString hash](self->_content, "hash");
  if (-[_INPBSearchForNotebookItemsIntent hasDateSearchType](self, "hasDateSearchType"))
    v15 = 2654435761 * self->_dateSearchType;
  else
    v15 = 0;
  v14 = -[_INPBDateTimeRange hash](self->_dateTime, "hash");
  v3 = -[_INPBDataString hash](self->_groupName, "hash");
  if (-[_INPBSearchForNotebookItemsIntent hasIncludeAllNoteContents](self, "hasIncludeAllNoteContents"))
    v4 = 2654435761 * self->_includeAllNoteContents;
  else
    v4 = 0;
  v5 = -[_INPBIntentMetadata hash](self->_intentMetadata, "hash");
  if (-[_INPBSearchForNotebookItemsIntent hasItemType](self, "hasItemType"))
    v6 = 2654435761 * self->_itemType;
  else
    v6 = 0;
  v7 = -[_INPBLocation hash](self->_location, "hash");
  if (-[_INPBSearchForNotebookItemsIntent hasLocationSearchType](self, "hasLocationSearchType"))
    v8 = 2654435761 * self->_locationSearchType;
  else
    v8 = 0;
  v9 = -[NSString hash](self->_notebookItemIdentifier, "hash");
  if (-[_INPBSearchForNotebookItemsIntent hasStatus](self, "hasStatus"))
    v10 = 2654435761 * self->_status;
  else
    v10 = 0;
  if (-[_INPBSearchForNotebookItemsIntent hasTaskPriority](self, "hasTaskPriority"))
    v11 = 2654435761 * self->_taskPriority;
  else
    v11 = 0;
  v12 = v11 ^ PBRepeatedInt32Hash();
  return v15 ^ v16 ^ v14 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v12 ^ -[_INPBDataString hash](self->_title, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  __CFString *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  __CFString *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  __CFString *v24;
  uint64_t v25;
  __CFString *v26;
  void *v27;
  unint64_t v28;
  uint64_t v29;
  __CFString *v30;
  void *v31;
  void *v32;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_content)
  {
    -[_INPBSearchForNotebookItemsIntent content](self, "content");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("content"));

  }
  if (-[_INPBSearchForNotebookItemsIntent hasDateSearchType](self, "hasDateSearchType"))
  {
    v6 = -[_INPBSearchForNotebookItemsIntent dateSearchType](self, "dateSearchType");
    if ((int)v6 > 19)
    {
      if ((_DWORD)v6 == 20)
      {
        v7 = CFSTR("BY_MODIFIED_DATE");
        goto LABEL_14;
      }
      if ((_DWORD)v6 == 30)
      {
        v7 = CFSTR("BY_CREATED_DATE");
        goto LABEL_14;
      }
    }
    else
    {
      if (!(_DWORD)v6)
      {
        v7 = CFSTR("UNKNOWN_DATE_SEARCH_TYPE");
        goto LABEL_14;
      }
      if ((_DWORD)v6 == 10)
      {
        v7 = CFSTR("BY_DUE_DATE");
LABEL_14:
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("dateSearchType"));

        goto LABEL_15;
      }
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v6);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
LABEL_15:
  -[_INPBSearchForNotebookItemsIntent dateTime](self, "dateTime");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("dateTime"));

  -[_INPBSearchForNotebookItemsIntent groupName](self, "groupName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("groupName"));

  if (-[_INPBSearchForNotebookItemsIntent hasIncludeAllNoteContents](self, "hasIncludeAllNoteContents"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBSearchForNotebookItemsIntent includeAllNoteContents](self, "includeAllNoteContents"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("includeAllNoteContents"));

  }
  -[_INPBSearchForNotebookItemsIntent intentMetadata](self, "intentMetadata");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dictionaryRepresentation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("intentMetadata"));

  if (-[_INPBSearchForNotebookItemsIntent hasItemType](self, "hasItemType"))
  {
    v15 = -[_INPBSearchForNotebookItemsIntent itemType](self, "itemType");
    if ((int)v15 > 19)
    {
      if ((_DWORD)v15 == 20)
      {
        v16 = CFSTR("TASK_LIST");
        goto LABEL_28;
      }
      if ((_DWORD)v15 == 30)
      {
        v16 = CFSTR("TASK");
        goto LABEL_28;
      }
    }
    else
    {
      if (!(_DWORD)v15)
      {
        v16 = CFSTR("UNKNOWN_NOTE_TYPE");
        goto LABEL_28;
      }
      if ((_DWORD)v15 == 10)
      {
        v16 = CFSTR("NOTE");
LABEL_28:
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("itemType"));

        goto LABEL_29;
      }
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v15);
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_28;
  }
LABEL_29:
  -[_INPBSearchForNotebookItemsIntent location](self, "location");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "dictionaryRepresentation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("location"));

  if (-[_INPBSearchForNotebookItemsIntent hasLocationSearchType](self, "hasLocationSearchType"))
  {
    v19 = -[_INPBSearchForNotebookItemsIntent locationSearchType](self, "locationSearchType");
    if ((_DWORD)v19)
    {
      if ((_DWORD)v19 == 10)
      {
        v20 = CFSTR("BY_LOCATION_TRIGGER");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v19);
        v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v20 = CFSTR("UNKNOWN_LOCATION_SEARCH_TYPE");
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("locationSearchType"));

  }
  if (self->_notebookItemIdentifier)
  {
    -[_INPBSearchForNotebookItemsIntent notebookItemIdentifier](self, "notebookItemIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v21, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("notebookItemIdentifier"));

  }
  if (-[_INPBSearchForNotebookItemsIntent hasStatus](self, "hasStatus"))
  {
    v23 = -[_INPBSearchForNotebookItemsIntent status](self, "status");
    if ((_DWORD)v23)
    {
      if ((_DWORD)v23 == 20)
      {
        v24 = CFSTR("COMPLETED");
      }
      else if ((_DWORD)v23 == 10)
      {
        v24 = CFSTR("NOT_COMPLETED");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v23);
        v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v24 = CFSTR("UNKNOWN_STATUS");
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("status"));

  }
  if (-[_INPBSearchForNotebookItemsIntent hasTaskPriority](self, "hasTaskPriority"))
  {
    v25 = -[_INPBSearchForNotebookItemsIntent taskPriority](self, "taskPriority");
    if (v25 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v25);
      v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v26 = off_1E2290068[v25];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("taskPriority"));

  }
  if (self->_temporalEventTriggerTypes.count)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[_INPBSearchForNotebookItemsIntent temporalEventTriggerTypesCount](self, "temporalEventTriggerTypesCount"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[_INPBSearchForNotebookItemsIntent temporalEventTriggerTypesCount](self, "temporalEventTriggerTypesCount"))
    {
      v28 = 0;
      do
      {
        v29 = self->_temporalEventTriggerTypes.list[v28];
        if (v29 >= 4)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_temporalEventTriggerTypes.list[v28]);
          v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v30 = off_1E2290080[v29];
        }
        objc_msgSend(v27, "addObject:", v30);

        ++v28;
      }
      while (v28 < -[_INPBSearchForNotebookItemsIntent temporalEventTriggerTypesCount](self, "temporalEventTriggerTypesCount"));
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("temporalEventTriggerType"));

  }
  -[_INPBSearchForNotebookItemsIntent title](self, "title");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "dictionaryRepresentation");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("title"));

  return v3;
}

- (NSString)content
{
  return self->_content;
}

- (int)dateSearchType
{
  return self->_dateSearchType;
}

- (_INPBDateTimeRange)dateTime
{
  return self->_dateTime;
}

- (_INPBDataString)groupName
{
  return self->_groupName;
}

- (BOOL)includeAllNoteContents
{
  return self->_includeAllNoteContents;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (int)itemType
{
  return self->_itemType;
}

- (_INPBLocation)location
{
  return self->_location;
}

- (int)locationSearchType
{
  return self->_locationSearchType;
}

- (NSString)notebookItemIdentifier
{
  return self->_notebookItemIdentifier;
}

- (int)status
{
  return self->_status;
}

- (int)taskPriority
{
  return self->_taskPriority;
}

- (_INPBDataString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_notebookItemIdentifier, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_dateTime, 0);
  objc_storeStrong((id *)&self->_content, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
