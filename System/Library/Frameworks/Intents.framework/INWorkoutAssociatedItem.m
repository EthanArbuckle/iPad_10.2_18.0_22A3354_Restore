@implementation INWorkoutAssociatedItem

- (INWorkoutAssociatedItem)initWithItemLabel:(int64_t)a3 itemID:(id)a4 contentRating:(int64_t)a5 itemName:(id)a6
{
  id v10;
  id v11;
  INWorkoutAssociatedItem *v12;
  INWorkoutAssociatedItem *v13;
  uint64_t v14;
  NSString *itemID;
  uint64_t v16;
  INSpeakableString *itemName;
  objc_super v19;

  v10 = a4;
  v11 = a6;
  v19.receiver = self;
  v19.super_class = (Class)INWorkoutAssociatedItem;
  v12 = -[INWorkoutAssociatedItem init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_itemLabel = a3;
    v14 = objc_msgSend(v10, "copy");
    itemID = v13->_itemID;
    v13->_itemID = (NSString *)v14;

    v13->_contentRating = a5;
    v16 = objc_msgSend(v11, "copy");
    itemName = v13->_itemName;
    v13->_itemName = (INSpeakableString *)v16;

  }
  return v13;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  NSUInteger v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_itemLabel);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[NSString hash](self->_itemID, "hash") ^ v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_contentRating);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  v8 = v5 ^ v7 ^ -[INSpeakableString hash](self->_itemName, "hash");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  INWorkoutAssociatedItem *v4;
  INWorkoutAssociatedItem *v5;
  NSString *itemID;
  INSpeakableString *itemName;
  BOOL v8;

  v4 = (INWorkoutAssociatedItem *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v8 = 0;
      if (self->_itemLabel == v5->_itemLabel)
      {
        itemID = self->_itemID;
        if ((itemID == v5->_itemID || -[NSString isEqual:](itemID, "isEqual:"))
          && self->_contentRating == v5->_contentRating)
        {
          itemName = self->_itemName;
          if (itemName == v5->_itemName || -[INSpeakableString isEqual:](itemName, "isEqual:"))
            v8 = 1;
        }
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (INWorkoutAssociatedItem)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  INWorkoutAssociatedItem *v12;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("itemLabel"));
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("itemID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("contentRating"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("itemName"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[INWorkoutAssociatedItem initWithItemLabel:itemID:contentRating:itemName:](self, "initWithItemLabel:itemID:contentRating:itemName:", v5, v9, v10, v11);
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t itemLabel;
  id v5;

  itemLabel = self->_itemLabel;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", itemLabel, CFSTR("itemLabel"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_itemID, CFSTR("itemID"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_contentRating, CFSTR("contentRating"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_itemName, CFSTR("itemName"));

}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  unint64_t v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  int64_t contentRating;
  const __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a3;
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = self->_itemLabel - 1;
  if (v8 > 4)
    v9 = CFSTR("unknown");
  else
    v9 = off_1E2295218[v8];
  v10 = v9;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, CFSTR("itemLabel"));

  objc_msgSend(v6, "encodeObject:", self->_itemID);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v11, CFSTR("itemID"));

  contentRating = self->_contentRating;
  v13 = CFSTR("unknown");
  if (contentRating == 2)
    v13 = CFSTR("explicit");
  if (contentRating == 1)
    v14 = CFSTR("clean");
  else
    v14 = (__CFString *)v13;
  v15 = v14;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v15, CFSTR("contentRating"));

  objc_msgSend(v6, "encodeObject:", self->_itemName);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v16, CFSTR("itemName"));
  return v7;
}

- (NSString)description
{
  return (NSString *)-[INWorkoutAssociatedItem descriptionAtIndent:](self, "descriptionAtIndent:", 0);
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)INWorkoutAssociatedItem;
  -[INWorkoutAssociatedItem description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INWorkoutAssociatedItem _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  void *v3;
  NSString *itemID;
  void *v5;
  void *v6;
  INSpeakableString *itemName;
  void *v8;
  void *v9;
  _QWORD v11[4];
  _QWORD v12[5];

  v12[4] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("itemLabel");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_itemLabel);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  v11[1] = CFSTR("itemID");
  itemID = self->_itemID;
  v5 = itemID;
  if (!itemID)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[1] = v5;
  v11[2] = CFSTR("contentRating");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_contentRating);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v6;
  v11[3] = CFSTR("itemName");
  itemName = self->_itemName;
  v8 = itemName;
  if (!itemName)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[3] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!itemName)

  if (!itemID)
  return v9;
}

- (int64_t)itemLabel
{
  return self->_itemLabel;
}

- (NSString)itemID
{
  return self->_itemID;
}

- (int64_t)contentRating
{
  return self->_contentRating;
}

- (INSpeakableString)itemName
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

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;

  v7 = a3;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("itemLabel"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = INWorkoutAssociatedItemLabelWithString(v9);

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("itemID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("contentRating"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = INWorkoutContentRatingLabelWithString(v12);

    v14 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("itemName"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithItemLabel:itemID:contentRating:itemName:", v10, v11, v13, v16);
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

@end
