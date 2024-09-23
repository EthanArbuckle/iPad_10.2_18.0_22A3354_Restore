@implementation FCAdStatusCondition

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (id)adStatusConditionsFromConditionsArray:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  const __CFString *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  unint64_t v15;
  id v16;
  uint64_t v17;
  FCAdStatusCondition *v18;
  void *v19;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = CFSTR("statusConditionType");
    v8 = *(_QWORD *)v23;
    v9 = 0x1E0C99000uLL;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v11, "objectForKey:", v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", CFSTR("identifier"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (v13)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v14 = v7;
                v15 = v9;
                v16 = v4;
                v17 = adStatusConditionTypeForType(v12);
                v18 = -[FCAdStatusCondition initWithStatusConditionType:identifier:]([FCAdStatusCondition alloc], "initWithStatusConditionType:identifier:", v17, v13);
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v17);
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "setObject:forKey:", v18, v19);

                v4 = v16;
                v9 = v15;
                v7 = v14;

              }
            }
          }
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v6);
  }

  return v21;
}

- (FCAdStatusCondition)initWithStatusConditionType:(unint64_t)a3 identifier:(id)a4
{
  id v7;
  FCAdStatusCondition *v8;
  FCAdStatusCondition *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)FCAdStatusCondition;
  v8 = -[FCAdStatusCondition init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_identifier, a4);
    v9->_type = a3;
  }

  return v9;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

@end
