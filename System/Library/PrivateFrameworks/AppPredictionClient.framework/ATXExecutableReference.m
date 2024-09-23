@implementation ATXExecutableReference

- (unint64_t)hash
{
  return -[NSString hash](self->_clientModelId, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_clientModelId, 0);
}

- (NSString)clientModelId
{
  return self->_clientModelId;
}

- (BOOL)isEqual:(id)a3
{
  ATXExecutableReference *v4;
  NSString *v5;
  NSString *v6;
  char v7;

  v4 = (ATXExecutableReference *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = self->_clientModelId;
      v6 = v5;
      if (v5 == v4->_clientModelId)
        v7 = 1;
      else
        v7 = -[NSString isEqual:](v5, "isEqual:");

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (ATXExecutableReference)initWithClientModelId:(id)a3 date:(id)a4 shouldClearOnEngagement:(BOOL)a5 shouldPurge:(BOOL)a6 suggestionIsHidden:(BOOL)a7
{
  id v12;
  id v13;
  ATXExecutableReference *v14;
  uint64_t v15;
  NSString *clientModelId;
  ATXExecutableReference *v17;
  objc_super v19;

  v12 = a3;
  v13 = a4;
  v19.receiver = self;
  v19.super_class = (Class)ATXExecutableReference;
  v14 = -[ATXExecutableReference init](&v19, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v12, "copy");
    clientModelId = v14->_clientModelId;
    v14->_clientModelId = (NSString *)v15;

    objc_storeStrong((id *)&v14->_date, a4);
    v14->_shouldClearOnEngagement = a5;
    v14->_shouldPurge = a6;
    v14->_suggestionIsHidden = a7;
    v17 = v14;
  }

  return v14;
}

- (BOOL)shouldPurge
{
  return self->_shouldPurge;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXExecutableReference)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  ATXExecutableReference *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientModelId"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldClearOnEngagement"));
  v8 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldPurge"));
  v9 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("suggestionIsHidden"));

  v10 = -[ATXExecutableReference initWithClientModelId:date:shouldClearOnEngagement:shouldPurge:suggestionIsHidden:](self, "initWithClientModelId:date:shouldClearOnEngagement:shouldPurge:suggestionIsHidden:", v6, v5, v7, v8, v9);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *date;
  id v5;

  date = self->_date;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", date, CFSTR("date"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_clientModelId, CFSTR("clientModelId"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldClearOnEngagement, CFSTR("shouldClearOnEngagement"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldPurge, CFSTR("shouldPurge"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_suggestionIsHidden, CFSTR("suggestionIsHidden"));

}

- (ATXExecutableReference)initWithClientModelId:(id)a3 date:(id)a4 shouldClearOnEngagement:(BOOL)a5
{
  return -[ATXExecutableReference initWithClientModelId:date:shouldClearOnEngagement:shouldPurge:suggestionIsHidden:](self, "initWithClientModelId:date:shouldClearOnEngagement:shouldPurge:suggestionIsHidden:", a3, a4, a5, 0, 0);
}

- (id)jsonDict
{
  NSDate *date;
  NSString *clientModelId;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  _QWORD v12[6];

  v12[5] = *MEMORY[0x1E0C80C00];
  clientModelId = self->_clientModelId;
  date = self->_date;
  v12[0] = clientModelId;
  v11[0] = CFSTR("clientModelId");
  v11[1] = CFSTR("date");
  -[NSDate description](date, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v5;
  v11[2] = CFSTR("shouldClearOnEngagement");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_shouldClearOnEngagement);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v6;
  v11[3] = CFSTR("shouldPurge");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_shouldPurge);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v7;
  v11[4] = CFSTR("suggestionIsHidden");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_suggestionIsHidden);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[4] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[ATXExecutableReference initWithClientModelId:date:shouldClearOnEngagement:shouldPurge:suggestionIsHidden:]([ATXExecutableReference alloc], "initWithClientModelId:date:shouldClearOnEngagement:shouldPurge:suggestionIsHidden:", self->_clientModelId, self->_date, self->_shouldClearOnEngagement, self->_shouldPurge, self->_suggestionIsHidden);
}

- (void)updateDateTo:(id)a3
{
  id v5;
  id *p_date;
  NSDate *date;
  id v8;
  id v9;
  id v10;

  v5 = a3;
  date = self->_date;
  p_date = (id *)&self->_date;
  v10 = v5;
  objc_msgSend(v5, "earlierDate:", date);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = *p_date;

  if (v8 == v9)
    objc_storeStrong(p_date, a3);

}

- (NSDate)date
{
  return self->_date;
}

- (BOOL)shouldClearOnEngagement
{
  return self->_shouldClearOnEngagement;
}

- (void)setShouldPurge:(BOOL)a3
{
  self->_shouldPurge = a3;
}

- (BOOL)suggestionIsHidden
{
  return self->_suggestionIsHidden;
}

- (void)setSuggestionIsHidden:(BOOL)a3
{
  self->_suggestionIsHidden = a3;
}

@end
