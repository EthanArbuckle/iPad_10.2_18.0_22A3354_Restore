@implementation _INPBWorkoutAssociatedItem

- (void)setContentRating:(int)a3
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
    self->_contentRating = a3;
  }
}

- (BOOL)hasContentRating
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasContentRating:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)contentRatingAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("clean");
  if (a3 == 1)
  {
    v3 = CFSTR("explicit");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsContentRating:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("clean")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("explicit"));

  return v4;
}

- (void)setItemID:(id)a3
{
  NSString *v4;
  NSString *itemID;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  itemID = self->_itemID;
  self->_itemID = v4;

}

- (BOOL)hasItemID
{
  return self->_itemID != 0;
}

- (void)setItemLabel:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xFD;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 2;
    self->_itemLabel = a3;
  }
}

- (BOOL)hasItemLabel
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasItemLabel:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (id)itemLabelAsString:(int)a3
{
  if (a3 < 5)
    return off_1E2295240[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsItemLabel:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("narrator")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("playlist")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("song")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("trainer")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("workout")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setItemName:(id)a3
{
  objc_storeStrong((id *)&self->_itemName, a3);
}

- (BOOL)hasItemName
{
  return self->_itemName != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBWorkoutAssociatedItemReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (-[_INPBWorkoutAssociatedItem hasContentRating](self, "hasContentRating"))
    PBDataWriterWriteInt32Field();
  -[_INPBWorkoutAssociatedItem itemID](self, "itemID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  if (-[_INPBWorkoutAssociatedItem hasItemLabel](self, "hasItemLabel"))
    PBDataWriterWriteInt32Field();
  -[_INPBWorkoutAssociatedItem itemName](self, "itemName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v8;
  if (v5)
  {
    -[_INPBWorkoutAssociatedItem itemName](self, "itemName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v6 = v8;
  }

}

- (_INPBWorkoutAssociatedItem)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBWorkoutAssociatedItem *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBWorkoutAssociatedItem *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBWorkoutAssociatedItem *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBWorkoutAssociatedItem initWithData:](self, "initWithData:", v6);

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
  -[_INPBWorkoutAssociatedItem data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBWorkoutAssociatedItem *v5;
  void *v6;
  id v7;

  v5 = -[_INPBWorkoutAssociatedItem init](+[_INPBWorkoutAssociatedItem allocWithZone:](_INPBWorkoutAssociatedItem, "allocWithZone:"), "init");
  if (-[_INPBWorkoutAssociatedItem hasContentRating](self, "hasContentRating"))
    -[_INPBWorkoutAssociatedItem setContentRating:](v5, "setContentRating:", -[_INPBWorkoutAssociatedItem contentRating](self, "contentRating"));
  v6 = (void *)-[NSString copyWithZone:](self->_itemID, "copyWithZone:", a3);
  -[_INPBWorkoutAssociatedItem setItemID:](v5, "setItemID:", v6);

  if (-[_INPBWorkoutAssociatedItem hasItemLabel](self, "hasItemLabel"))
    -[_INPBWorkoutAssociatedItem setItemLabel:](v5, "setItemLabel:", -[_INPBWorkoutAssociatedItem itemLabel](self, "itemLabel"));
  v7 = -[_INPBDataString copyWithZone:](self->_itemName, "copyWithZone:", a3);
  -[_INPBWorkoutAssociatedItem setItemName:](v5, "setItemName:", v7);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  int contentRating;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  int itemLabel;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  BOOL v21;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_20;
  v5 = -[_INPBWorkoutAssociatedItem hasContentRating](self, "hasContentRating");
  if (v5 != objc_msgSend(v4, "hasContentRating"))
    goto LABEL_20;
  if (-[_INPBWorkoutAssociatedItem hasContentRating](self, "hasContentRating"))
  {
    if (objc_msgSend(v4, "hasContentRating"))
    {
      contentRating = self->_contentRating;
      if (contentRating != objc_msgSend(v4, "contentRating"))
        goto LABEL_20;
    }
  }
  -[_INPBWorkoutAssociatedItem itemID](self, "itemID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "itemID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_19;
  -[_INPBWorkoutAssociatedItem itemID](self, "itemID");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[_INPBWorkoutAssociatedItem itemID](self, "itemID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "itemID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);

    if (!v13)
      goto LABEL_20;
  }
  else
  {

  }
  v14 = -[_INPBWorkoutAssociatedItem hasItemLabel](self, "hasItemLabel");
  if (v14 != objc_msgSend(v4, "hasItemLabel"))
    goto LABEL_20;
  if (-[_INPBWorkoutAssociatedItem hasItemLabel](self, "hasItemLabel"))
  {
    if (objc_msgSend(v4, "hasItemLabel"))
    {
      itemLabel = self->_itemLabel;
      if (itemLabel != objc_msgSend(v4, "itemLabel"))
        goto LABEL_20;
    }
  }
  -[_INPBWorkoutAssociatedItem itemName](self, "itemName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "itemName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) != (v8 != 0))
  {
    -[_INPBWorkoutAssociatedItem itemName](self, "itemName");
    v16 = objc_claimAutoreleasedReturnValue();
    if (!v16)
    {

LABEL_23:
      v21 = 1;
      goto LABEL_21;
    }
    v17 = (void *)v16;
    -[_INPBWorkoutAssociatedItem itemName](self, "itemName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "itemName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "isEqual:", v19);

    if ((v20 & 1) != 0)
      goto LABEL_23;
  }
  else
  {
LABEL_19:

  }
LABEL_20:
  v21 = 0;
LABEL_21:

  return v21;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  uint64_t v5;

  if (-[_INPBWorkoutAssociatedItem hasContentRating](self, "hasContentRating"))
    v3 = 2654435761 * self->_contentRating;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_itemID, "hash");
  if (-[_INPBWorkoutAssociatedItem hasItemLabel](self, "hasItemLabel"))
    v5 = 2654435761 * self->_itemLabel;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5 ^ -[_INPBDataString hash](self->_itemName, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_INPBWorkoutAssociatedItem hasContentRating](self, "hasContentRating"))
  {
    v4 = -[_INPBWorkoutAssociatedItem contentRating](self, "contentRating");
    if ((_DWORD)v4)
    {
      if ((_DWORD)v4 == 1)
      {
        v5 = CFSTR("explicit");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v4);
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v5 = CFSTR("clean");
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("contentRating"));

  }
  if (self->_itemID)
  {
    -[_INPBWorkoutAssociatedItem itemID](self, "itemID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("itemID"));

  }
  if (-[_INPBWorkoutAssociatedItem hasItemLabel](self, "hasItemLabel"))
  {
    v8 = -[_INPBWorkoutAssociatedItem itemLabel](self, "itemLabel");
    if (v8 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v8);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E2295240[v8];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("itemLabel"));

  }
  -[_INPBWorkoutAssociatedItem itemName](self, "itemName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("itemName"));

  return v3;
}

- (int)contentRating
{
  return self->_contentRating;
}

- (NSString)itemID
{
  return self->_itemID;
}

- (int)itemLabel
{
  return self->_itemLabel;
}

- (_INPBDataString)itemName
{
  return self->_itemName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemName, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
