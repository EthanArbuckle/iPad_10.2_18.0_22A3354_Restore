@implementation _INPBSearchForMessagesIntent

- (void)setAttributes:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (int)attributes
{
  return self->_attributes.list;
}

- (void)clearAttributes
{
  PBRepeatedInt32Clear();
}

- (void)addAttribute:(int)a3
{
  if (a3 != 0x7FFFFFFF)
    PBRepeatedInt32Add();
}

- (unint64_t)attributesCount
{
  return self->_attributes.count;
}

- (int)attributeAtIndex:(unint64_t)a3
{
  return self->_attributes.list[a3];
}

- (id)attributesAsString:(int)a3
{
  if ((a3 - 1) < 5)
    return *(&off_1E228B9E0 + (a3 - 1));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsAttributes:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("READ")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNREAD")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FLAGGED")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNFLAGGED")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PLAYED")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)setContent:(id)a3
{
  objc_storeStrong((id *)&self->_content, a3);
}

- (BOOL)hasContent
{
  return self->_content != 0;
}

- (void)setConversationIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_conversationIdentifier, a3);
}

- (BOOL)hasConversationIdentifier
{
  return self->_conversationIdentifier != 0;
}

- (void)setDateTimeRange:(id)a3
{
  objc_storeStrong((id *)&self->_dateTimeRange, a3);
}

- (BOOL)hasDateTimeRange
{
  return self->_dateTimeRange != 0;
}

- (void)setGroupName:(id)a3
{
  objc_storeStrong((id *)&self->_groupName, a3);
}

- (BOOL)hasGroupName
{
  return self->_groupName != 0;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (void)setIntentMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_intentMetadata, a3);
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setNotificationIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_notificationIdentifier, a3);
}

- (BOOL)hasNotificationIdentifier
{
  return self->_notificationIdentifier != 0;
}

- (void)setRecipient:(id)a3
{
  objc_storeStrong((id *)&self->_recipient, a3);
}

- (BOOL)hasRecipient
{
  return self->_recipient != 0;
}

- (void)setSearchTerm:(id)a3
{
  objc_storeStrong((id *)&self->_searchTerm, a3);
}

- (BOOL)hasSearchTerm
{
  return self->_searchTerm != 0;
}

- (void)setSender:(id)a3
{
  objc_storeStrong((id *)&self->_sender, a3);
}

- (BOOL)hasSender
{
  return self->_sender != 0;
}

- (void)setSpeakableGroupName:(id)a3
{
  objc_storeStrong((id *)&self->_speakableGroupName, a3);
}

- (BOOL)hasSpeakableGroupName
{
  return self->_speakableGroupName != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSearchForMessagesIntentReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  unint64_t v4;
  void *v5;
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
  id v27;

  v27 = a3;
  if (self->_attributes.count)
  {
    v4 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v4;
    }
    while (v4 < self->_attributes.count);
  }
  -[_INPBSearchForMessagesIntent content](self, "content");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_INPBSearchForMessagesIntent content](self, "content");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBSearchForMessagesIntent conversationIdentifier](self, "conversationIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[_INPBSearchForMessagesIntent conversationIdentifier](self, "conversationIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBSearchForMessagesIntent dateTimeRange](self, "dateTimeRange");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[_INPBSearchForMessagesIntent dateTimeRange](self, "dateTimeRange");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBSearchForMessagesIntent groupName](self, "groupName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[_INPBSearchForMessagesIntent groupName](self, "groupName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBSearchForMessagesIntent identifier](self, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[_INPBSearchForMessagesIntent identifier](self, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBSearchForMessagesIntent intentMetadata](self, "intentMetadata");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[_INPBSearchForMessagesIntent intentMetadata](self, "intentMetadata");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBSearchForMessagesIntent notificationIdentifier](self, "notificationIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[_INPBSearchForMessagesIntent notificationIdentifier](self, "notificationIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBSearchForMessagesIntent recipient](self, "recipient");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[_INPBSearchForMessagesIntent recipient](self, "recipient");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBSearchForMessagesIntent searchTerm](self, "searchTerm");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[_INPBSearchForMessagesIntent searchTerm](self, "searchTerm");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBSearchForMessagesIntent sender](self, "sender");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[_INPBSearchForMessagesIntent sender](self, "sender");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBSearchForMessagesIntent speakableGroupName](self, "speakableGroupName");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    -[_INPBSearchForMessagesIntent speakableGroupName](self, "speakableGroupName");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (void)dealloc
{
  objc_super v3;

  -[_INPBSearchForMessagesIntent clearAttributes](self, "clearAttributes");
  v3.receiver = self;
  v3.super_class = (Class)_INPBSearchForMessagesIntent;
  -[_INPBSearchForMessagesIntent dealloc](&v3, sel_dealloc);
}

- (_INPBSearchForMessagesIntent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBSearchForMessagesIntent *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBSearchForMessagesIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBSearchForMessagesIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBSearchForMessagesIntent initWithData:](self, "initWithData:", v6);

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
  -[_INPBSearchForMessagesIntent data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBSearchForMessagesIntent *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v5 = -[_INPBSearchForMessagesIntent init](+[_INPBSearchForMessagesIntent allocWithZone:](_INPBSearchForMessagesIntent, "allocWithZone:"), "init");
  PBRepeatedInt32Copy();
  v6 = -[_INPBStringList copyWithZone:](self->_content, "copyWithZone:", a3);
  -[_INPBSearchForMessagesIntent setContent:](v5, "setContent:", v6);

  v7 = -[_INPBStringList copyWithZone:](self->_conversationIdentifier, "copyWithZone:", a3);
  -[_INPBSearchForMessagesIntent setConversationIdentifier:](v5, "setConversationIdentifier:", v7);

  v8 = -[_INPBDateTimeRange copyWithZone:](self->_dateTimeRange, "copyWithZone:", a3);
  -[_INPBSearchForMessagesIntent setDateTimeRange:](v5, "setDateTimeRange:", v8);

  v9 = -[_INPBStringList copyWithZone:](self->_groupName, "copyWithZone:", a3);
  -[_INPBSearchForMessagesIntent setGroupName:](v5, "setGroupName:", v9);

  v10 = -[_INPBStringList copyWithZone:](self->_identifier, "copyWithZone:", a3);
  -[_INPBSearchForMessagesIntent setIdentifier:](v5, "setIdentifier:", v10);

  v11 = -[_INPBIntentMetadata copyWithZone:](self->_intentMetadata, "copyWithZone:", a3);
  -[_INPBSearchForMessagesIntent setIntentMetadata:](v5, "setIntentMetadata:", v11);

  v12 = -[_INPBStringList copyWithZone:](self->_notificationIdentifier, "copyWithZone:", a3);
  -[_INPBSearchForMessagesIntent setNotificationIdentifier:](v5, "setNotificationIdentifier:", v12);

  v13 = -[_INPBContactList copyWithZone:](self->_recipient, "copyWithZone:", a3);
  -[_INPBSearchForMessagesIntent setRecipient:](v5, "setRecipient:", v13);

  v14 = -[_INPBStringList copyWithZone:](self->_searchTerm, "copyWithZone:", a3);
  -[_INPBSearchForMessagesIntent setSearchTerm:](v5, "setSearchTerm:", v14);

  v15 = -[_INPBContactList copyWithZone:](self->_sender, "copyWithZone:", a3);
  -[_INPBSearchForMessagesIntent setSender:](v5, "setSender:", v15);

  v16 = -[_INPBDataStringList copyWithZone:](self->_speakableGroupName, "copyWithZone:", a3);
  -[_INPBSearchForMessagesIntent setSpeakableGroupName:](v5, "setSpeakableGroupName:", v16);

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
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
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
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  char v61;
  BOOL v62;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()) || !PBRepeatedInt32IsEqual())
    goto LABEL_58;
  -[_INPBSearchForMessagesIntent content](self, "content");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "content");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_57;
  -[_INPBSearchForMessagesIntent content](self, "content");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBSearchForMessagesIntent content](self, "content");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "content");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_58;
  }
  else
  {

  }
  -[_INPBSearchForMessagesIntent conversationIdentifier](self, "conversationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "conversationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_57;
  -[_INPBSearchForMessagesIntent conversationIdentifier](self, "conversationIdentifier");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBSearchForMessagesIntent conversationIdentifier](self, "conversationIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "conversationIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_58;
  }
  else
  {

  }
  -[_INPBSearchForMessagesIntent dateTimeRange](self, "dateTimeRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateTimeRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_57;
  -[_INPBSearchForMessagesIntent dateTimeRange](self, "dateTimeRange");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_INPBSearchForMessagesIntent dateTimeRange](self, "dateTimeRange");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dateTimeRange");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_58;
  }
  else
  {

  }
  -[_INPBSearchForMessagesIntent groupName](self, "groupName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "groupName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_57;
  -[_INPBSearchForMessagesIntent groupName](self, "groupName");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_INPBSearchForMessagesIntent groupName](self, "groupName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "groupName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_58;
  }
  else
  {

  }
  -[_INPBSearchForMessagesIntent identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_57;
  -[_INPBSearchForMessagesIntent identifier](self, "identifier");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[_INPBSearchForMessagesIntent identifier](self, "identifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_58;
  }
  else
  {

  }
  -[_INPBSearchForMessagesIntent intentMetadata](self, "intentMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_57;
  -[_INPBSearchForMessagesIntent intentMetadata](self, "intentMetadata");
  v32 = objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = (void *)v32;
    -[_INPBSearchForMessagesIntent intentMetadata](self, "intentMetadata");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentMetadata");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqual:", v35);

    if (!v36)
      goto LABEL_58;
  }
  else
  {

  }
  -[_INPBSearchForMessagesIntent notificationIdentifier](self, "notificationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notificationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_57;
  -[_INPBSearchForMessagesIntent notificationIdentifier](self, "notificationIdentifier");
  v37 = objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    v38 = (void *)v37;
    -[_INPBSearchForMessagesIntent notificationIdentifier](self, "notificationIdentifier");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "notificationIdentifier");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v39, "isEqual:", v40);

    if (!v41)
      goto LABEL_58;
  }
  else
  {

  }
  -[_INPBSearchForMessagesIntent recipient](self, "recipient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recipient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_57;
  -[_INPBSearchForMessagesIntent recipient](self, "recipient");
  v42 = objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    v43 = (void *)v42;
    -[_INPBSearchForMessagesIntent recipient](self, "recipient");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "recipient");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v44, "isEqual:", v45);

    if (!v46)
      goto LABEL_58;
  }
  else
  {

  }
  -[_INPBSearchForMessagesIntent searchTerm](self, "searchTerm");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchTerm");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_57;
  -[_INPBSearchForMessagesIntent searchTerm](self, "searchTerm");
  v47 = objc_claimAutoreleasedReturnValue();
  if (v47)
  {
    v48 = (void *)v47;
    -[_INPBSearchForMessagesIntent searchTerm](self, "searchTerm");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "searchTerm");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v49, "isEqual:", v50);

    if (!v51)
      goto LABEL_58;
  }
  else
  {

  }
  -[_INPBSearchForMessagesIntent sender](self, "sender");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sender");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_57;
  -[_INPBSearchForMessagesIntent sender](self, "sender");
  v52 = objc_claimAutoreleasedReturnValue();
  if (v52)
  {
    v53 = (void *)v52;
    -[_INPBSearchForMessagesIntent sender](self, "sender");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sender");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v54, "isEqual:", v55);

    if (!v56)
      goto LABEL_58;
  }
  else
  {

  }
  -[_INPBSearchForMessagesIntent speakableGroupName](self, "speakableGroupName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "speakableGroupName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBSearchForMessagesIntent speakableGroupName](self, "speakableGroupName");
    v57 = objc_claimAutoreleasedReturnValue();
    if (!v57)
    {

LABEL_61:
      v62 = 1;
      goto LABEL_59;
    }
    v58 = (void *)v57;
    -[_INPBSearchForMessagesIntent speakableGroupName](self, "speakableGroupName");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "speakableGroupName");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(v59, "isEqual:", v60);

    if ((v61 & 1) != 0)
      goto LABEL_61;
  }
  else
  {
LABEL_57:

  }
LABEL_58:
  v62 = 0;
LABEL_59:

  return v62;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v3 = PBRepeatedInt32Hash();
  v4 = -[_INPBStringList hash](self->_content, "hash") ^ v3;
  v5 = -[_INPBStringList hash](self->_conversationIdentifier, "hash");
  v6 = v4 ^ v5 ^ -[_INPBDateTimeRange hash](self->_dateTimeRange, "hash");
  v7 = -[_INPBStringList hash](self->_groupName, "hash");
  v8 = v7 ^ -[_INPBStringList hash](self->_identifier, "hash");
  v9 = v6 ^ v8 ^ -[_INPBIntentMetadata hash](self->_intentMetadata, "hash");
  v10 = -[_INPBStringList hash](self->_notificationIdentifier, "hash");
  v11 = v10 ^ -[_INPBContactList hash](self->_recipient, "hash");
  v12 = v11 ^ -[_INPBStringList hash](self->_searchTerm, "hash");
  v13 = v9 ^ v12 ^ -[_INPBContactList hash](self->_sender, "hash");
  return v13 ^ -[_INPBDataStringList hash](self->_speakableGroupName, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  unint64_t v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_attributes.count)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[_INPBSearchForMessagesIntent attributesCount](self, "attributesCount"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[_INPBSearchForMessagesIntent attributesCount](self, "attributesCount"))
    {
      v5 = 0;
      do
      {
        v6 = self->_attributes.list[v5] - 1;
        if (v6 >= 5)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_attributes.list[v5]);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v7 = *(&off_1E228B9E0 + v6);
        }
        objc_msgSend(v4, "addObject:", v7);

        ++v5;
      }
      while (v5 < -[_INPBSearchForMessagesIntent attributesCount](self, "attributesCount"));
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("attribute"));

  }
  -[_INPBSearchForMessagesIntent content](self, "content");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("content"));

  -[_INPBSearchForMessagesIntent conversationIdentifier](self, "conversationIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("conversationIdentifier"));

  -[_INPBSearchForMessagesIntent dateTimeRange](self, "dateTimeRange");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dictionaryRepresentation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("dateTimeRange"));

  -[_INPBSearchForMessagesIntent groupName](self, "groupName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dictionaryRepresentation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("groupName"));

  -[_INPBSearchForMessagesIntent identifier](self, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "dictionaryRepresentation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("identifier"));

  -[_INPBSearchForMessagesIntent intentMetadata](self, "intentMetadata");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "dictionaryRepresentation");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("intentMetadata"));

  -[_INPBSearchForMessagesIntent notificationIdentifier](self, "notificationIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "dictionaryRepresentation");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("notificationIdentifier"));

  -[_INPBSearchForMessagesIntent recipient](self, "recipient");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "dictionaryRepresentation");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("recipient"));

  -[_INPBSearchForMessagesIntent searchTerm](self, "searchTerm");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "dictionaryRepresentation");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("searchTerm"));

  -[_INPBSearchForMessagesIntent sender](self, "sender");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "dictionaryRepresentation");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("sender"));

  -[_INPBSearchForMessagesIntent speakableGroupName](self, "speakableGroupName");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "dictionaryRepresentation");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("speakableGroupName"));

  return v3;
}

- (_INPBStringList)content
{
  return self->_content;
}

- (_INPBStringList)conversationIdentifier
{
  return self->_conversationIdentifier;
}

- (_INPBDateTimeRange)dateTimeRange
{
  return self->_dateTimeRange;
}

- (_INPBStringList)groupName
{
  return self->_groupName;
}

- (_INPBStringList)identifier
{
  return self->_identifier;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (_INPBStringList)notificationIdentifier
{
  return self->_notificationIdentifier;
}

- (_INPBContactList)recipient
{
  return self->_recipient;
}

- (_INPBStringList)searchTerm
{
  return self->_searchTerm;
}

- (_INPBContactList)sender
{
  return self->_sender;
}

- (_INPBDataStringList)speakableGroupName
{
  return self->_speakableGroupName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speakableGroupName, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_searchTerm, 0);
  objc_storeStrong((id *)&self->_recipient, 0);
  objc_storeStrong((id *)&self->_notificationIdentifier, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_dateTimeRange, 0);
  objc_storeStrong((id *)&self->_conversationIdentifier, 0);
  objc_storeStrong((id *)&self->_content, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
