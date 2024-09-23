@implementation _ICProactiveTrigger

- (_ICProactiveTrigger)initWithSource:(unsigned __int8)a3 attributes:(id)a4
{
  id v7;
  _ICProactiveTrigger *v8;
  _ICProactiveTrigger *v9;
  void *v10;
  uint64_t v11;
  NSString *contentType;
  objc_super v14;

  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_ICProactiveTrigger;
  v8 = -[_ICProactiveTrigger init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_triggerSourceType = a3;
    objc_storeStrong((id *)&v8->_attributedString, a4);
    objc_msgSend(v7, "objectForKey:", CFSTR("textContentTypeTag"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v7, "objectForKey:", CFSTR("textContentTypeTag"));
      v11 = objc_claimAutoreleasedReturnValue();
      contentType = v9->_contentType;
      v9->_contentType = (NSString *)v11;

    }
  }

  return v9;
}

- (_ICProactiveTrigger)initWithContext:(id)a3 inputContextHistory:(id)a4 contentType:(id)a5
{
  id v9;
  id v10;
  id v11;
  _ICProactiveTrigger *v12;
  _ICProactiveTrigger *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_ICProactiveTrigger;
  v12 = -[_ICProactiveTrigger init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_triggerSourceType = 3;
    objc_storeStrong((id *)&v12->_contentType, a5);
    objc_storeStrong((id *)&v13->_context, a3);
    objc_storeStrong((id *)&v13->_inputContextHistory, a4);
  }

  return v13;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<_ICProactiveTrigger type:%lu attr: %@>"), self->_triggerSourceType, self->_attributedString);
}

- (unint64_t)hash
{
  uint64_t triggerSourceType;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;

  triggerSourceType = self->_triggerSourceType;
  v4 = -[NSDictionary count](self->_attributedString, "count") - triggerSourceType + 32 * triggerSourceType;
  v5 = -[NSString hash](self->_context, "hash") - v4 + 32 * v4;
  v6 = -[TIInputContextHistory hash](self->_inputContextHistory, "hash") - v5 + 32 * v5;
  return -[NSString hash](self->_contentType, "hash") - v6 + 32 * v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_ICProactiveTrigger)initWithCoder:(id)a3
{
  id v4;
  _ICProactiveTrigger *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSDictionary *attributedString;
  uint64_t v12;
  NSString *context;
  void *v14;
  id v15;
  uint64_t v16;
  TIInputContextHistory *inputContextHistory;
  uint64_t v18;
  NSString *contentType;
  objc_super v21;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)_ICProactiveTrigger;
  v5 = -[_ICProactiveTrigger init](&v21, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("attributedString"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    attributedString = v5->_attributedString;
    v5->_attributedString = (NSDictionary *)v10;

    v5->_triggerSourceType = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("triggerSourceType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("context"));
    v12 = objc_claimAutoreleasedReturnValue();
    context = v5->_context;
    v5->_context = (NSString *)v12;

    v23 = 0;
    v24 = &v23;
    v25 = 0x2050000000;
    v14 = (void *)getTIInputContextHistoryClass_softClass;
    v26 = getTIInputContextHistoryClass_softClass;
    if (!getTIInputContextHistoryClass_softClass)
    {
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __getTIInputContextHistoryClass_block_invoke;
      v22[3] = &unk_24EF71570;
      v22[4] = &v23;
      __getTIInputContextHistoryClass_block_invoke((uint64_t)v22);
      v14 = (void *)v24[3];
    }
    v15 = objc_retainAutorelease(v14);
    _Block_object_dispose(&v23, 8);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("inputContextHistory"));
    v16 = objc_claimAutoreleasedReturnValue();
    inputContextHistory = v5->_inputContextHistory;
    v5->_inputContextHistory = (TIInputContextHistory *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contentType"));
    v18 = objc_claimAutoreleasedReturnValue();
    contentType = v5->_contentType;
    v5->_contentType = (NSString *)v18;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDictionary *attributedString;
  id v5;

  attributedString = self->_attributedString;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", attributedString, CFSTR("attributedString"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_triggerSourceType, CFSTR("triggerSourceType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_context, CFSTR("context"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_inputContextHistory, CFSTR("inputContextHistory"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_contentType, CFSTR("contentType"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  uint64_t v6;
  void *v7;

  v5 = objc_alloc_init((Class)objc_opt_class());
  if (v5)
  {
    v6 = -[NSDictionary copyWithZone:](self->_attributedString, "copyWithZone:", a3);
    v7 = (void *)*((_QWORD *)v5 + 3);
    *((_QWORD *)v5 + 3) = v6;

    *((_BYTE *)v5 + 8) = self->_triggerSourceType;
    objc_storeStrong((id *)v5 + 4, self->_context);
    objc_storeStrong((id *)v5 + 5, self->_inputContextHistory);
    objc_storeStrong((id *)v5 + 6, self->_contentType);
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _ICProactiveTrigger *v4;
  _ICProactiveTrigger *v5;
  BOOL v6;

  v4 = (_ICProactiveTrigger *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[_ICProactiveTrigger isEqualToProactiveTrigger:](self, "isEqualToProactiveTrigger:", v5);

  return v6;
}

+ (BOOL)isEquivalentDictionary:(id)a3 second:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "count");
  if (v7 == objc_msgSend(v6, "count"))
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v8, "objectForKey:", v13, (_QWORD)v18);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "objectForKey:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0
              || !+[_ICProactiveTrigger isEquivalentDictionary:second:](_ICProactiveTrigger, "isEquivalentDictionary:second:", v14, v15))
            {
              goto LABEL_18;
            }
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0
              || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
              || !objc_msgSend(v14, "isEqualToString:", v15))
            {
LABEL_18:

              v16 = 0;
              goto LABEL_20;
            }
          }

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        v16 = 1;
        if (v10)
          continue;
        break;
      }
    }
    else
    {
      v16 = 1;
    }
LABEL_20:

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)isEqualToProactiveTrigger:(id)a3
{
  id v4;
  id v5;
  int v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  char v18;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_10;
  v6 = objc_msgSend(v4, "triggerSourceType");
  if (v6 != -[_ICProactiveTrigger triggerSourceType](self, "triggerSourceType"))
    goto LABEL_10;
  -[_ICProactiveTrigger attributedString](self, "attributedString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attributedString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[_ICProactiveTrigger isEquivalentDictionary:second:](_ICProactiveTrigger, "isEquivalentDictionary:second:", v7, v8);

  if (!v9)
    goto LABEL_10;
  if (self->_context != (NSString *)*((_QWORD *)v5 + 4))
  {
    -[_ICProactiveTrigger context](self, "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqualToString:", v11);

    if (!v12)
      goto LABEL_10;
  }
  if (self->_inputContextHistory == (TIInputContextHistory *)*((_QWORD *)v5 + 5)
    || (-[_ICProactiveTrigger inputContextHistory](self, "inputContextHistory"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "inputContextHistory"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_msgSend(v13, "isEqual:", v14),
        v14,
        v13,
        v15))
  {
    if (self->_contentType == (NSString *)*((_QWORD *)v5 + 6))
    {
      v18 = 1;
    }
    else
    {
      -[_ICProactiveTrigger contentType](self, "contentType");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "contentType");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqualToString:", v17);

    }
  }
  else
  {
LABEL_10:
    v18 = 0;
  }

  return v18;
}

- (unsigned)triggerSourceType
{
  return self->_triggerSourceType;
}

- (NSSet)availableApps
{
  return self->_availableApps;
}

- (void)setAvailableApps:(id)a3
{
  objc_storeStrong((id *)&self->_availableApps, a3);
}

- (NSDictionary)attributedString
{
  return self->_attributedString;
}

- (NSString)context
{
  return self->_context;
}

- (TIInputContextHistory)inputContextHistory
{
  return self->_inputContextHistory;
}

- (NSString)contentType
{
  return self->_contentType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_inputContextHistory, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_attributedString, 0);
  objc_storeStrong((id *)&self->_availableApps, 0);
}

@end
