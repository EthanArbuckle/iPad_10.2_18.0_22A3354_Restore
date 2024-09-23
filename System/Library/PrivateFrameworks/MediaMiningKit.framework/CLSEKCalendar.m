@implementation CLSEKCalendar

- (CLSEKCalendar)initWithEKCalendar:(id)a3
{
  id v4;
  CLSEKCalendar *v5;
  uint64_t v6;
  NSString *calendarIdentifier;
  int v8;
  void *v9;
  NSSet *v10;
  NSSet *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  CLSEKSharee *v17;
  CLSEKSharee *v18;
  NSSet *shareesAndOwner;
  uint64_t v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)CLSEKCalendar;
  v5 = -[CLSEKCalendar init](&v26, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "calendarIdentifier");
    v6 = objc_claimAutoreleasedReturnValue();
    calendarIdentifier = v5->_calendarIdentifier;
    v5->_calendarIdentifier = (NSString *)v6;

    v8 = objc_msgSend(v4, "hasSharees");
    v5->_hasSharees = v8;
    if (v8)
    {
      objc_msgSend(v4, "shareesAndOwner");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v9, "count"));
      v10 = (NSSet *)objc_claimAutoreleasedReturnValue();
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v11 = v9;
      v12 = -[NSSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v23;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v23 != v14)
              objc_enumerationMutation(v11);
            v16 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v15);
            v17 = [CLSEKSharee alloc];
            v18 = -[CLSEKSharee initWithEKSharee:](v17, "initWithEKSharee:", v16, (_QWORD)v22);
            if (v18)
              -[NSSet addObject:](v10, "addObject:", v18);

            ++v15;
          }
          while (v13 != v15);
          v13 = -[NSSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        }
        while (v13);
      }

      shareesAndOwner = v5->_shareesAndOwner;
      v5->_shareesAndOwner = v10;

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v20 = objc_claimAutoreleasedReturnValue();
      v11 = v5->_shareesAndOwner;
      v5->_shareesAndOwner = (NSSet *)v20;
    }

  }
  return v5;
}

- (CLSEKCalendar)initWithCoder:(id)a3
{
  id v4;
  CLSEKCalendar *v5;
  uint64_t v6;
  NSString *calendarIdentifier;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSSet *shareesAndOwner;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CLSEKCalendar;
  v5 = -[CLSEKCalendar init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("calendarIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    calendarIdentifier = v5->_calendarIdentifier;
    v5->_calendarIdentifier = (NSString *)v6;

    v5->_hasSharees = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasSharees"));
    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("shareesAndOwner"));
    v11 = objc_claimAutoreleasedReturnValue();
    shareesAndOwner = v5->_shareesAndOwner;
    v5->_shareesAndOwner = (NSSet *)v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *calendarIdentifier;
  id v5;

  calendarIdentifier = self->_calendarIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", calendarIdentifier, CFSTR("calendarIdentifier"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasSharees, CFSTR("hasSharees"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_shareesAndOwner, CFSTR("shareesAndOwner"));

}

- (unint64_t)hash
{
  return -[NSString hash](self->_calendarIdentifier, "hash");
}

- (BOOL)isEqual:(id)a3
{
  CLSEKCalendar *v4;
  unint64_t v5;
  char v6;
  NSSet *shareesAndOwner;

  v4 = (CLSEKCalendar *)a3;
  if (self == v4)
    goto LABEL_4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_8;
  v5 = -[CLSEKCalendar hash](self, "hash");
  if (v5 == -[CLSEKCalendar hash](v4, "hash"))
    goto LABEL_4;
  if (self->_hasSharees != v4->_hasSharees)
  {
LABEL_8:
    v6 = 0;
    goto LABEL_9;
  }
  shareesAndOwner = self->_shareesAndOwner;
  if (shareesAndOwner != v4->_shareesAndOwner)
  {
    v6 = -[NSSet isEqualToSet:](shareesAndOwner, "isEqualToSet:");
    goto LABEL_9;
  }
LABEL_4:
  v6 = 1;
LABEL_9:

  return v6;
}

- (BOOL)hasSharees
{
  return self->_hasSharees;
}

- (NSSet)shareesAndOwner
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)calendarIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendarIdentifier, 0);
  objc_storeStrong((id *)&self->_shareesAndOwner, 0);
}

@end
