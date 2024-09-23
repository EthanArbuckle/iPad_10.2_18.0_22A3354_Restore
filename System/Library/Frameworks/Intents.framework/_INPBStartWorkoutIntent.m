@implementation _INPBStartWorkoutIntent

- (void)setAssociatedItems:(id)a3
{
  NSArray *v4;
  NSArray *associatedItems;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  associatedItems = self->_associatedItems;
  self->_associatedItems = v4;

}

- (void)clearAssociatedItems
{
  -[NSArray removeAllObjects](self->_associatedItems, "removeAllObjects");
}

- (void)addAssociatedItems:(id)a3
{
  id v4;
  NSArray *associatedItems;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  associatedItems = self->_associatedItems;
  v8 = v4;
  if (!associatedItems)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_associatedItems;
    self->_associatedItems = v6;

    v4 = v8;
    associatedItems = self->_associatedItems;
  }
  -[NSArray addObject:](associatedItems, "addObject:", v4);

}

- (unint64_t)associatedItemsCount
{
  return -[NSArray count](self->_associatedItems, "count");
}

- (id)associatedItemsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_associatedItems, "objectAtIndexedSubscript:", a3);
}

- (void)setCustomization:(id)a3
{
  objc_storeStrong((id *)&self->_customization, a3);
}

- (BOOL)hasCustomization
{
  return self->_customization != 0;
}

- (void)setGoalValue:(id)a3
{
  objc_storeStrong((id *)&self->_goalValue, a3);
}

- (BOOL)hasGoalValue
{
  return self->_goalValue != 0;
}

- (void)setIntentMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_intentMetadata, a3);
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setIsBuiltInWorkoutType:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isBuiltInWorkoutType = a3;
}

- (BOOL)hasIsBuiltInWorkoutType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasIsBuiltInWorkoutType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)setIsOpenEnded:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_isOpenEnded = a3;
}

- (BOOL)hasIsOpenEnded
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasIsOpenEnded:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)setIsVoiceOnly:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_isVoiceOnly = a3;
}

- (BOOL)hasIsVoiceOnly
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasIsVoiceOnly:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)setSequenceLabel:(int)a3
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
    self->_sequenceLabel = a3;
  }
}

- (BOOL)hasSequenceLabel
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasSequenceLabel:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (id)sequenceLabelAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("last");
  if (a3 == 1)
  {
    v3 = CFSTR("next");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsSequenceLabel:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("last")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("next"));

  return v4;
}

- (void)setWorkoutGoalUnitType:(int)a3
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
    self->_workoutGoalUnitType = a3;
  }
}

- (BOOL)hasWorkoutGoalUnitType
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasWorkoutGoalUnitType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (id)workoutGoalUnitTypeAsString:(int)a3
{
  if (a3 < 0xA)
    return off_1E2290370[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsWorkoutGoalUnitType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Inch")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Meter")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Foot")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Mile")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Yard")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Second")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Minute")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Hour")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Joule")) & 1) != 0)
  {
    v4 = 8;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("KiloCalorie")))
  {
    v4 = 9;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setWorkoutLocationType:(int)a3
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
    self->_workoutLocationType = a3;
  }
}

- (BOOL)hasWorkoutLocationType
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setHasWorkoutLocationType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (id)workoutLocationTypeAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("OUTDOOR");
  if (a3 == 1)
  {
    v3 = CFSTR("INDOOR");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsWorkoutLocationType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OUTDOOR")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("INDOOR"));

  return v4;
}

- (void)setWorkoutName:(id)a3
{
  objc_storeStrong((id *)&self->_workoutName, a3);
}

- (BOOL)hasWorkoutName
{
  return self->_workoutName != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBStartWorkoutIntentReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
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
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = self->_associatedItems;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  -[_INPBStartWorkoutIntent customization](self, "customization", v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[_INPBStartWorkoutIntent customization](self, "customization");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBStartWorkoutIntent goalValue](self, "goalValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[_INPBStartWorkoutIntent goalValue](self, "goalValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBStartWorkoutIntent intentMetadata](self, "intentMetadata");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[_INPBStartWorkoutIntent intentMetadata](self, "intentMetadata");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBStartWorkoutIntent hasIsBuiltInWorkoutType](self, "hasIsBuiltInWorkoutType"))
    PBDataWriterWriteBOOLField();
  if (-[_INPBStartWorkoutIntent hasIsOpenEnded](self, "hasIsOpenEnded"))
    PBDataWriterWriteBOOLField();
  if (-[_INPBStartWorkoutIntent hasIsVoiceOnly](self, "hasIsVoiceOnly"))
    PBDataWriterWriteBOOLField();
  if (-[_INPBStartWorkoutIntent hasSequenceLabel](self, "hasSequenceLabel"))
    PBDataWriterWriteInt32Field();
  if (-[_INPBStartWorkoutIntent hasWorkoutGoalUnitType](self, "hasWorkoutGoalUnitType"))
    PBDataWriterWriteInt32Field();
  if (-[_INPBStartWorkoutIntent hasWorkoutLocationType](self, "hasWorkoutLocationType"))
    PBDataWriterWriteInt32Field();
  -[_INPBStartWorkoutIntent workoutName](self, "workoutName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[_INPBStartWorkoutIntent workoutName](self, "workoutName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (_INPBStartWorkoutIntent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBStartWorkoutIntent *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBStartWorkoutIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBStartWorkoutIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBStartWorkoutIntent initWithData:](self, "initWithData:", v6);

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
  -[_INPBStartWorkoutIntent data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBStartWorkoutIntent *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;

  v5 = -[_INPBStartWorkoutIntent init](+[_INPBStartWorkoutIntent allocWithZone:](_INPBStartWorkoutIntent, "allocWithZone:"), "init");
  v6 = (void *)-[NSArray copyWithZone:](self->_associatedItems, "copyWithZone:", a3);
  -[_INPBStartWorkoutIntent setAssociatedItems:](v5, "setAssociatedItems:", v6);

  v7 = -[_INPBWorkoutCustomization copyWithZone:](self->_customization, "copyWithZone:", a3);
  -[_INPBStartWorkoutIntent setCustomization:](v5, "setCustomization:", v7);

  v8 = -[_INPBDouble copyWithZone:](self->_goalValue, "copyWithZone:", a3);
  -[_INPBStartWorkoutIntent setGoalValue:](v5, "setGoalValue:", v8);

  v9 = -[_INPBIntentMetadata copyWithZone:](self->_intentMetadata, "copyWithZone:", a3);
  -[_INPBStartWorkoutIntent setIntentMetadata:](v5, "setIntentMetadata:", v9);

  if (-[_INPBStartWorkoutIntent hasIsBuiltInWorkoutType](self, "hasIsBuiltInWorkoutType"))
    -[_INPBStartWorkoutIntent setIsBuiltInWorkoutType:](v5, "setIsBuiltInWorkoutType:", -[_INPBStartWorkoutIntent isBuiltInWorkoutType](self, "isBuiltInWorkoutType"));
  if (-[_INPBStartWorkoutIntent hasIsOpenEnded](self, "hasIsOpenEnded"))
    -[_INPBStartWorkoutIntent setIsOpenEnded:](v5, "setIsOpenEnded:", -[_INPBStartWorkoutIntent isOpenEnded](self, "isOpenEnded"));
  if (-[_INPBStartWorkoutIntent hasIsVoiceOnly](self, "hasIsVoiceOnly"))
    -[_INPBStartWorkoutIntent setIsVoiceOnly:](v5, "setIsVoiceOnly:", -[_INPBStartWorkoutIntent isVoiceOnly](self, "isVoiceOnly"));
  if (-[_INPBStartWorkoutIntent hasSequenceLabel](self, "hasSequenceLabel"))
    -[_INPBStartWorkoutIntent setSequenceLabel:](v5, "setSequenceLabel:", -[_INPBStartWorkoutIntent sequenceLabel](self, "sequenceLabel"));
  if (-[_INPBStartWorkoutIntent hasWorkoutGoalUnitType](self, "hasWorkoutGoalUnitType"))
    -[_INPBStartWorkoutIntent setWorkoutGoalUnitType:](v5, "setWorkoutGoalUnitType:", -[_INPBStartWorkoutIntent workoutGoalUnitType](self, "workoutGoalUnitType"));
  if (-[_INPBStartWorkoutIntent hasWorkoutLocationType](self, "hasWorkoutLocationType"))
    -[_INPBStartWorkoutIntent setWorkoutLocationType:](v5, "setWorkoutLocationType:", -[_INPBStartWorkoutIntent workoutLocationType](self, "workoutLocationType"));
  v10 = -[_INPBDataString copyWithZone:](self->_workoutName, "copyWithZone:", a3);
  -[_INPBStartWorkoutIntent setWorkoutName:](v5, "setWorkoutName:", v10);

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
  int v27;
  int isBuiltInWorkoutType;
  int v29;
  int isOpenEnded;
  int v31;
  int isVoiceOnly;
  int v33;
  int sequenceLabel;
  int v35;
  int workoutGoalUnitType;
  int v37;
  int workoutLocationType;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  char v43;
  BOOL v44;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_51;
  -[_INPBStartWorkoutIntent associatedItems](self, "associatedItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "associatedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_50;
  -[_INPBStartWorkoutIntent associatedItems](self, "associatedItems");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBStartWorkoutIntent associatedItems](self, "associatedItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "associatedItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_51;
  }
  else
  {

  }
  -[_INPBStartWorkoutIntent customization](self, "customization");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "customization");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_50;
  -[_INPBStartWorkoutIntent customization](self, "customization");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBStartWorkoutIntent customization](self, "customization");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "customization");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_51;
  }
  else
  {

  }
  -[_INPBStartWorkoutIntent goalValue](self, "goalValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "goalValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_50;
  -[_INPBStartWorkoutIntent goalValue](self, "goalValue");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_INPBStartWorkoutIntent goalValue](self, "goalValue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "goalValue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_51;
  }
  else
  {

  }
  -[_INPBStartWorkoutIntent intentMetadata](self, "intentMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_50;
  -[_INPBStartWorkoutIntent intentMetadata](self, "intentMetadata");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_INPBStartWorkoutIntent intentMetadata](self, "intentMetadata");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentMetadata");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_51;
  }
  else
  {

  }
  v27 = -[_INPBStartWorkoutIntent hasIsBuiltInWorkoutType](self, "hasIsBuiltInWorkoutType");
  if (v27 != objc_msgSend(v4, "hasIsBuiltInWorkoutType"))
    goto LABEL_51;
  if (-[_INPBStartWorkoutIntent hasIsBuiltInWorkoutType](self, "hasIsBuiltInWorkoutType"))
  {
    if (objc_msgSend(v4, "hasIsBuiltInWorkoutType"))
    {
      isBuiltInWorkoutType = self->_isBuiltInWorkoutType;
      if (isBuiltInWorkoutType != objc_msgSend(v4, "isBuiltInWorkoutType"))
        goto LABEL_51;
    }
  }
  v29 = -[_INPBStartWorkoutIntent hasIsOpenEnded](self, "hasIsOpenEnded");
  if (v29 != objc_msgSend(v4, "hasIsOpenEnded"))
    goto LABEL_51;
  if (-[_INPBStartWorkoutIntent hasIsOpenEnded](self, "hasIsOpenEnded"))
  {
    if (objc_msgSend(v4, "hasIsOpenEnded"))
    {
      isOpenEnded = self->_isOpenEnded;
      if (isOpenEnded != objc_msgSend(v4, "isOpenEnded"))
        goto LABEL_51;
    }
  }
  v31 = -[_INPBStartWorkoutIntent hasIsVoiceOnly](self, "hasIsVoiceOnly");
  if (v31 != objc_msgSend(v4, "hasIsVoiceOnly"))
    goto LABEL_51;
  if (-[_INPBStartWorkoutIntent hasIsVoiceOnly](self, "hasIsVoiceOnly"))
  {
    if (objc_msgSend(v4, "hasIsVoiceOnly"))
    {
      isVoiceOnly = self->_isVoiceOnly;
      if (isVoiceOnly != objc_msgSend(v4, "isVoiceOnly"))
        goto LABEL_51;
    }
  }
  v33 = -[_INPBStartWorkoutIntent hasSequenceLabel](self, "hasSequenceLabel");
  if (v33 != objc_msgSend(v4, "hasSequenceLabel"))
    goto LABEL_51;
  if (-[_INPBStartWorkoutIntent hasSequenceLabel](self, "hasSequenceLabel"))
  {
    if (objc_msgSend(v4, "hasSequenceLabel"))
    {
      sequenceLabel = self->_sequenceLabel;
      if (sequenceLabel != objc_msgSend(v4, "sequenceLabel"))
        goto LABEL_51;
    }
  }
  v35 = -[_INPBStartWorkoutIntent hasWorkoutGoalUnitType](self, "hasWorkoutGoalUnitType");
  if (v35 != objc_msgSend(v4, "hasWorkoutGoalUnitType"))
    goto LABEL_51;
  if (-[_INPBStartWorkoutIntent hasWorkoutGoalUnitType](self, "hasWorkoutGoalUnitType"))
  {
    if (objc_msgSend(v4, "hasWorkoutGoalUnitType"))
    {
      workoutGoalUnitType = self->_workoutGoalUnitType;
      if (workoutGoalUnitType != objc_msgSend(v4, "workoutGoalUnitType"))
        goto LABEL_51;
    }
  }
  v37 = -[_INPBStartWorkoutIntent hasWorkoutLocationType](self, "hasWorkoutLocationType");
  if (v37 != objc_msgSend(v4, "hasWorkoutLocationType"))
    goto LABEL_51;
  if (-[_INPBStartWorkoutIntent hasWorkoutLocationType](self, "hasWorkoutLocationType"))
  {
    if (objc_msgSend(v4, "hasWorkoutLocationType"))
    {
      workoutLocationType = self->_workoutLocationType;
      if (workoutLocationType != objc_msgSend(v4, "workoutLocationType"))
        goto LABEL_51;
    }
  }
  -[_INPBStartWorkoutIntent workoutName](self, "workoutName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "workoutName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBStartWorkoutIntent workoutName](self, "workoutName");
    v39 = objc_claimAutoreleasedReturnValue();
    if (!v39)
    {

LABEL_54:
      v44 = 1;
      goto LABEL_52;
    }
    v40 = (void *)v39;
    -[_INPBStartWorkoutIntent workoutName](self, "workoutName");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "workoutName");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v41, "isEqual:", v42);

    if ((v43 & 1) != 0)
      goto LABEL_54;
  }
  else
  {
LABEL_50:

  }
LABEL_51:
  v44 = 0;
LABEL_52:

  return v44;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v13 = -[NSArray hash](self->_associatedItems, "hash");
  v3 = -[_INPBWorkoutCustomization hash](self->_customization, "hash");
  v4 = -[_INPBDouble hash](self->_goalValue, "hash");
  v5 = -[_INPBIntentMetadata hash](self->_intentMetadata, "hash");
  if (-[_INPBStartWorkoutIntent hasIsBuiltInWorkoutType](self, "hasIsBuiltInWorkoutType"))
    v6 = 2654435761 * self->_isBuiltInWorkoutType;
  else
    v6 = 0;
  if (-[_INPBStartWorkoutIntent hasIsOpenEnded](self, "hasIsOpenEnded"))
    v7 = 2654435761 * self->_isOpenEnded;
  else
    v7 = 0;
  if (-[_INPBStartWorkoutIntent hasIsVoiceOnly](self, "hasIsVoiceOnly"))
    v8 = 2654435761 * self->_isVoiceOnly;
  else
    v8 = 0;
  if (-[_INPBStartWorkoutIntent hasSequenceLabel](self, "hasSequenceLabel"))
    v9 = 2654435761 * self->_sequenceLabel;
  else
    v9 = 0;
  if (-[_INPBStartWorkoutIntent hasWorkoutGoalUnitType](self, "hasWorkoutGoalUnitType"))
    v10 = 2654435761 * self->_workoutGoalUnitType;
  else
    v10 = 0;
  if (-[_INPBStartWorkoutIntent hasWorkoutLocationType](self, "hasWorkoutLocationType"))
    v11 = 2654435761 * self->_workoutLocationType;
  else
    v11 = 0;
  return v3 ^ v13 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ -[_INPBDataString hash](self->_workoutName, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
  uint64_t v20;
  __CFString *v21;
  uint64_t v22;
  __CFString *v23;
  uint64_t v24;
  __CFString *v25;
  void *v26;
  void *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_associatedItems, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v5 = self->_associatedItems;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v30;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v30 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v9), "dictionaryRepresentation");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("associatedItems"));
  }
  -[_INPBStartWorkoutIntent customization](self, "customization");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dictionaryRepresentation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("customization"));

  -[_INPBStartWorkoutIntent goalValue](self, "goalValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dictionaryRepresentation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("goalValue"));

  -[_INPBStartWorkoutIntent intentMetadata](self, "intentMetadata");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dictionaryRepresentation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("intentMetadata"));

  if (-[_INPBStartWorkoutIntent hasIsBuiltInWorkoutType](self, "hasIsBuiltInWorkoutType"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBStartWorkoutIntent isBuiltInWorkoutType](self, "isBuiltInWorkoutType"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("isBuiltInWorkoutType"));

  }
  if (-[_INPBStartWorkoutIntent hasIsOpenEnded](self, "hasIsOpenEnded"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBStartWorkoutIntent isOpenEnded](self, "isOpenEnded"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("isOpenEnded"));

  }
  if (-[_INPBStartWorkoutIntent hasIsVoiceOnly](self, "hasIsVoiceOnly"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBStartWorkoutIntent isVoiceOnly](self, "isVoiceOnly"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("isVoiceOnly"));

  }
  if (-[_INPBStartWorkoutIntent hasSequenceLabel](self, "hasSequenceLabel"))
  {
    v20 = -[_INPBStartWorkoutIntent sequenceLabel](self, "sequenceLabel");
    if ((_DWORD)v20)
    {
      if ((_DWORD)v20 == 1)
      {
        v21 = CFSTR("next");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v20);
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v21 = CFSTR("last");
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("sequenceLabel"));

  }
  if (-[_INPBStartWorkoutIntent hasWorkoutGoalUnitType](self, "hasWorkoutGoalUnitType"))
  {
    v22 = -[_INPBStartWorkoutIntent workoutGoalUnitType](self, "workoutGoalUnitType");
    if (v22 >= 0xA)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v22);
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = off_1E2290370[v22];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("workoutGoalUnitType"));

  }
  if (-[_INPBStartWorkoutIntent hasWorkoutLocationType](self, "hasWorkoutLocationType"))
  {
    v24 = -[_INPBStartWorkoutIntent workoutLocationType](self, "workoutLocationType");
    if ((_DWORD)v24)
    {
      if ((_DWORD)v24 == 1)
      {
        v25 = CFSTR("INDOOR");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v24);
        v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v25 = CFSTR("OUTDOOR");
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("workoutLocationType"));

  }
  -[_INPBStartWorkoutIntent workoutName](self, "workoutName");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "dictionaryRepresentation");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("workoutName"));

  return v3;
}

- (NSArray)associatedItems
{
  return self->_associatedItems;
}

- (_INPBWorkoutCustomization)customization
{
  return self->_customization;
}

- (_INPBDouble)goalValue
{
  return self->_goalValue;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (BOOL)isBuiltInWorkoutType
{
  return self->_isBuiltInWorkoutType;
}

- (BOOL)isOpenEnded
{
  return self->_isOpenEnded;
}

- (BOOL)isVoiceOnly
{
  return self->_isVoiceOnly;
}

- (int)sequenceLabel
{
  return self->_sequenceLabel;
}

- (int)workoutGoalUnitType
{
  return self->_workoutGoalUnitType;
}

- (int)workoutLocationType
{
  return self->_workoutLocationType;
}

- (_INPBDataString)workoutName
{
  return self->_workoutName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workoutName, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);
  objc_storeStrong((id *)&self->_goalValue, 0);
  objc_storeStrong((id *)&self->_customization, 0);
  objc_storeStrong((id *)&self->_associatedItems, 0);
}

+ (Class)associatedItemsType
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
