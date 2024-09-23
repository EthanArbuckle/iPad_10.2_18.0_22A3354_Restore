@implementation AVDateRangeMetadataGroup

- (AVDateRangeMetadataGroup)init
{
  uint64_t v3;

  v3 = objc_msgSend(MEMORY[0x1E0C99D20], "array");
  return -[AVDateRangeMetadataGroup initWithItems:startDate:endDate:](self, "initWithItems:startDate:endDate:", v3, objc_msgSend(MEMORY[0x1E0C99D68], "date"), 0);
}

- (AVDateRangeMetadataGroup)initWithItems:(NSArray *)items startDate:(NSDate *)startDate endDate:(NSDate *)endDate
{
  AVDateRangeMetadataGroup *v8;
  AVDateRangeMetadataGroupInternal *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AVDateRangeMetadataGroup;
  v8 = -[AVDateRangeMetadataGroup init](&v11, sel_init);
  if (v8)
  {
    v9 = objc_alloc_init(AVDateRangeMetadataGroupInternal);
    v8->_priv = v9;
    if (v9)
    {
      CFRetain(v9);
      v8->_priv->metadataItems = (NSArray *)-[NSArray copy](items, "copy");
      v8->_priv->startDate = (NSDate *)-[NSDate copy](startDate, "copy");
      v8->_priv->endDate = (NSDate *)-[NSDate copy](endDate, "copy");
    }
    else
    {

      return 0;
    }
  }
  return v8;
}

- (void)dealloc
{
  AVDateRangeMetadataGroupInternal *priv;
  objc_super v4;

  priv = self->_priv;
  if (priv)
  {

    CFRelease(self->_priv);
    priv = self->_priv;
  }

  v4.receiver = self;
  v4.super_class = (Class)AVDateRangeMetadataGroup;
  -[AVDateRangeMetadataGroup dealloc](&v4, sel_dealloc);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[AVMutableDateRangeMetadataGroup _initWithTaggedRangeMetadataDictionary:items:](+[AVMutableDateRangeMetadataGroup allocWithZone:](AVMutableDateRangeMetadataGroup, "allocWithZone:", a3), "_initWithTaggedRangeMetadataDictionary:items:", -[AVDateRangeMetadataGroup _taggedRangeMetadataDictionary](self, "_taggedRangeMetadataDictionary"), -[AVDateRangeMetadataGroup items](self, "items"));
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, startDate=%@, endDate=%@ classifyingLabel=%@ uniqueID=%@ items=%@>"), NSStringFromClass(v4), self, -[AVDateRangeMetadataGroup startDate](self, "startDate"), -[AVDateRangeMetadataGroup endDate](self, "endDate"), -[AVDateRangeMetadataGroup classifyingLabel](self, "classifyingLabel"), -[AVDateRangeMetadataGroup uniqueID](self, "uniqueID"), -[AVDateRangeMetadataGroup items](self, "items"));
}

- (BOOL)isEqual:(id)a3
{
  NSDate *v5;
  uint64_t v6;
  NSDate *v7;
  uint64_t v8;
  NSArray *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  NSString *v13;
  uint64_t v14;
  int v15;
  uint64_t v17;
  id v18;

  if (a3 == self)
    goto LABEL_17;
  if (!a3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    LOBYTE(v15) = 0;
    return v15;
  }
  v5 = -[AVDateRangeMetadataGroup startDate](self, "startDate");
  v6 = objc_msgSend(a3, "startDate");
  v7 = -[AVDateRangeMetadataGroup endDate](self, "endDate");
  v8 = objc_msgSend(a3, "endDate");
  v9 = -[AVDateRangeMetadataGroup items](self, "items");
  v10 = objc_msgSend(a3, "items");
  v11 = -[AVDateRangeMetadataGroup classifyingLabel](self, "classifyingLabel");
  v12 = objc_msgSend(a3, "classifyingLabel");
  v18 = -[AVDateRangeMetadataGroup uniqueID](self, "uniqueID");
  v17 = objc_msgSend(a3, "uniqueID");
  v13 = -[AVDateRangeMetadataGroup cueingOptions](self, "cueingOptions");
  v14 = objc_msgSend(a3, "cueingOptions");
  if ((v5 == (NSDate *)v6 || (v15 = -[NSDate isEqual:](v5, "isEqual:", v6)) != 0)
    && (v7 == (NSDate *)v8 || (v15 = -[NSDate isEqual:](v7, "isEqual:", v8)) != 0)
    && (v9 == (NSArray *)v10 || (v15 = -[NSArray isEqual:](v9, "isEqual:", v10)) != 0)
    && (v11 == (id)v12 || (v15 = objc_msgSend(v11, "isEqual:", v12)) != 0)
    && (v18 == (id)v17 || (v15 = objc_msgSend(v18, "isEqual:")) != 0))
  {
    if (v13 != (NSString *)v14)
    {
      LOBYTE(v15) = -[NSString isEqual:](v13, "isEqual:", v14);
      return v15;
    }
LABEL_17:
    LOBYTE(v15) = 1;
  }
  return v15;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[NSDate hash](-[AVDateRangeMetadataGroup startDate](self, "startDate"), "hash");
  v4 = -[NSDate hash](-[AVDateRangeMetadataGroup endDate](self, "endDate"), "hash") ^ v3;
  v5 = -[NSArray hash](-[AVDateRangeMetadataGroup items](self, "items"), "hash");
  v6 = v4 ^ v5 ^ objc_msgSend(-[AVDateRangeMetadataGroup classifyingLabel](self, "classifyingLabel"), "hash");
  return v6 ^ objc_msgSend(-[AVDateRangeMetadataGroup uniqueID](self, "uniqueID"), "hash");
}

- (NSDate)startDate
{
  return self->_priv->startDate;
}

- (NSDate)endDate
{
  return self->_priv->endDate;
}

- (NSArray)items
{
  return self->_priv->metadataItems;
}

- (id)classifyingLabel
{
  return self->_priv->classifyingLabel;
}

- (id)uniqueID
{
  return self->_priv->uniqueID;
}

- (AVDateRangeMetadataGroup)initWithPropertyList:(id)a3
{
  AVDateRangeMetadataGroup *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = self;
    v13 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v8, v9, v10, v11, v12, (uint64_t)"[propertyList isKindOfClass:[NSDictionary class]]"), 0);
    objc_exception_throw(v13);
  }
  return (AVDateRangeMetadataGroup *)-[AVDateRangeMetadataGroup _initWithTaggedRangeMetadataDictionary:items:](self, "_initWithTaggedRangeMetadataDictionary:items:", a3, 0);
}

- (NSString)cueingOptions
{
  return self->_priv->cueingOptions;
}

- (id)_initWithTaggedRangeMetadataDictionary:(id)a3 items:(id)a4
{
  AVDateRangeMetadataGroup *v6;
  AVDateRangeMetadataGroupInternal *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVDateRangeMetadataGroup;
  v6 = -[AVDateRangeMetadataGroup init](&v9, sel_init);
  if (v6)
  {
    v7 = objc_alloc_init(AVDateRangeMetadataGroupInternal);
    v6->_priv = v7;
    if (v7)
    {
      CFRetain(v7);
      if (a4)
        v6->_priv->metadataItems = (NSArray *)objc_msgSend(a4, "copy");
      -[AVDateRangeMetadataGroup _extractPropertiesFromTaggedRangeMetadataDictionary:](v6, "_extractPropertiesFromTaggedRangeMetadataDictionary:", a3);
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

- (NSDate)discoveryTimestamp
{
  return self->_priv->discoveryTimestamp;
}

- (NSDate)modificationTimestamp
{
  return self->_priv->modificationTimestamp;
}

- (AVDateRangeMetadataGroupInternal)_dateRangeMetadataGroupInternal
{
  return self->_priv;
}

+ (id)_figMetadataArrayForMetadataItems:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if (a3)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(a3);
          objc_msgSend(v4, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "_figMetadataDictionary"));
        }
        while (v6 != v8);
        v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }
  }
  return (id)objc_msgSend(v4, "copy");
}

+ (id)_metadataItemsForFigMetadataArray:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if (a3)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(a3);
          objc_msgSend(v4, "addObject:", +[AVMetadataItem _metadataItemWithFigMetadataDictionary:](AVMetadataItem, "_metadataItemWithFigMetadataDictionary:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++)));
        }
        while (v6 != v8);
        v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }
  }
  return (id)objc_msgSend(v4, "copy");
}

- (id)_taggedRangeMetadataDictionary
{
  void *v3;
  NSDate *v4;
  NSDate *v5;
  id v6;
  id v7;
  id v8;
  NSString *v9;
  NSDate *v10;
  NSDate *v11;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  if (-[AVDateRangeMetadataGroup startDate](self, "startDate"))
  {
    v4 = -[AVDateRangeMetadataGroup startDate](self, "startDate");
    objc_msgSend(v3, "setObject:forKey:", v4, *MEMORY[0x1E0CC54D8]);
  }
  if (-[AVDateRangeMetadataGroup endDate](self, "endDate"))
  {
    v5 = -[AVDateRangeMetadataGroup endDate](self, "endDate");
    objc_msgSend(v3, "setObject:forKey:", v5, *MEMORY[0x1E0CC54B8]);
  }
  if (-[AVDateRangeMetadataGroup items](self, "items"))
  {
    v6 = +[AVDateRangeMetadataGroup _figMetadataArrayForMetadataItems:](AVDateRangeMetadataGroup, "_figMetadataArrayForMetadataItems:", -[AVDateRangeMetadataGroup items](self, "items"));
    objc_msgSend(v3, "setObject:forKey:", v6, *MEMORY[0x1E0CC54C8]);
  }
  if (-[AVDateRangeMetadataGroup classifyingLabel](self, "classifyingLabel"))
  {
    v7 = -[AVDateRangeMetadataGroup classifyingLabel](self, "classifyingLabel");
    objc_msgSend(v3, "setObject:forKey:", v7, *MEMORY[0x1E0CC5498]);
  }
  if (-[AVDateRangeMetadataGroup uniqueID](self, "uniqueID"))
  {
    v8 = -[AVDateRangeMetadataGroup uniqueID](self, "uniqueID");
    objc_msgSend(v3, "setObject:forKey:", v8, *MEMORY[0x1E0CC54C0]);
  }
  if (-[AVDateRangeMetadataGroup cueingOptions](self, "cueingOptions"))
  {
    v9 = -[AVDateRangeMetadataGroup cueingOptions](self, "cueingOptions");
    objc_msgSend(v3, "setObject:forKey:", v9, *MEMORY[0x1E0CC54A0]);
  }
  if (-[AVDateRangeMetadataGroup discoveryTimestamp](self, "discoveryTimestamp"))
  {
    v10 = -[AVDateRangeMetadataGroup discoveryTimestamp](self, "discoveryTimestamp");
    objc_msgSend(v3, "setObject:forKey:", v10, *MEMORY[0x1E0CC54A8]);
  }
  if (-[AVDateRangeMetadataGroup modificationTimestamp](self, "modificationTimestamp"))
  {
    v11 = -[AVDateRangeMetadataGroup modificationTimestamp](self, "modificationTimestamp");
    objc_msgSend(v3, "setObject:forKey:", v11, *MEMORY[0x1E0CC54D0]);
  }
  if (self->_priv->extraFigProperties)
    objc_msgSend(v3, "addEntriesFromDictionary:");
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v3);
}

- (void)_extractPropertiesFromTaggedRangeMetadataDictionary:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSDate *v16;
  NSDate *startDate;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  if (!a3 || self->_priv->extraFigProperties)
    return;
  v29 = *MEMORY[0x1E0CC54D8];
  v5 = (void *)objc_msgSend(a3, "objectForKey:");
  v28 = *MEMORY[0x1E0CC54B8];
  v21 = (void *)objc_msgSend(a3, "objectForKey:");
  v27 = *MEMORY[0x1E0CC54B0];
  v6 = objc_msgSend(a3, "objectForKey:");
  v26 = *MEMORY[0x1E0CC54C8];
  v7 = objc_msgSend(a3, "objectForKey:");
  v25 = *MEMORY[0x1E0CC5498];
  v8 = (void *)objc_msgSend(a3, "objectForKey:");
  v24 = *MEMORY[0x1E0CC54C0];
  v9 = (void *)objc_msgSend(a3, "objectForKey:");
  v30 = objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CC54A0]);
  v23 = *MEMORY[0x1E0CC54A8];
  v10 = objc_msgSend(a3, "objectForKey:");
  v22 = *MEMORY[0x1E0CC54D0];
  v31 = objc_msgSend(a3, "objectForKey:");
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      v5 = 0;
  }
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = (void *)v6;
    else
      v11 = 0;
  }
  else
  {
    v11 = 0;
  }
  v19 = v11;
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v7;
    else
      v12 = 0;
    v20 = v12;
  }
  else
  {
    v20 = 0;
  }
  v13 = (void *)v10;
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      v8 = 0;
  }
  v14 = (void *)v30;
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      v9 = 0;
  }
  if (v30)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      v14 = 0;
  }
  if (v13)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      v13 = 0;
  }
  if (v31)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = (void *)v31;
    else
      v15 = 0;
  }
  else
  {
    v15 = 0;
  }
  self->_priv->startDate = (NSDate *)objc_msgSend(v5, "copy");
  if (v21)
  {
    v16 = (NSDate *)objc_msgSend(v21, "copy");
LABEL_39:
    self->_priv->endDate = v16;
    goto LABEL_40;
  }
  startDate = self->_priv->startDate;
  if (startDate && v19)
  {
    objc_msgSend(v19, "doubleValue");
    v16 = -[NSDate dateByAddingTimeInterval:](startDate, "dateByAddingTimeInterval:");
    goto LABEL_39;
  }
LABEL_40:
  if (!self->_priv->metadataItems)
    self->_priv->metadataItems = (NSArray *)+[AVDateRangeMetadataGroup _metadataItemsForFigMetadataArray:](AVDateRangeMetadataGroup, "_metadataItemsForFigMetadataArray:", v20);
  self->_priv->classifyingLabel = (NSString *)objc_msgSend(v8, "copy");
  self->_priv->uniqueID = (NSString *)objc_msgSend(v9, "copy");
  self->_priv->cueingOptions = (NSString *)objc_msgSend(v14, "copy");
  self->_priv->discoveryTimestamp = (NSDate *)objc_msgSend(v13, "copy");
  self->_priv->modificationTimestamp = (NSDate *)objc_msgSend(v15, "copy");
  v18 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", a3);
  objc_msgSend(v18, "removeObjectForKey:", v29);
  objc_msgSend(v18, "removeObjectForKey:", v28);
  objc_msgSend(v18, "removeObjectForKey:", v27);
  objc_msgSend(v18, "removeObjectForKey:", v26);
  objc_msgSend(v18, "removeObjectForKey:", v25);
  objc_msgSend(v18, "removeObjectForKey:", v24);
  objc_msgSend(v18, "removeObjectForKey:", v23);
  objc_msgSend(v18, "removeObjectForKey:", v22);
  self->_priv->extraFigProperties = (NSDictionary *)objc_msgSend(v18, "copy");
}

@end
