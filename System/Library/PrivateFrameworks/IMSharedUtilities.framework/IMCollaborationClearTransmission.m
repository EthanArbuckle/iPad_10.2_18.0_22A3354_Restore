@implementation IMCollaborationClearTransmission

- (IMCollaborationClearTransmission)initWithCollaborationId:(id)a3 date:(id)a4 guidString:(id)a5
{
  id v9;
  id v10;
  id v11;
  IMCollaborationClearTransmission *v12;
  IMCollaborationClearTransmission *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)IMCollaborationClearTransmission;
  v12 = -[IMCollaborationClearTransmission init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_collaborationId, a3);
    objc_storeStrong((id *)&v13->_date, a4);
    objc_storeStrong((id *)&v13->_guidString, a5);
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[IMCollaborationClearTransmission collaborationId](self, "collaborationId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_collaborationId);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[IMCollaborationClearTransmission date](self, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_date);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  -[IMCollaborationClearTransmission guidString](self, "guidString");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_guidString);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, v9);

}

- (IMCollaborationClearTransmission)initWithCoder:(id)a3
{
  id v4;
  IMCollaborationClearTransmission *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSString *collaborationId;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSDate *date;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSString *guidString;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)IMCollaborationClearTransmission;
  v5 = -[IMCollaborationClearTransmission init](&v19, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_collaborationId);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    collaborationId = v5->_collaborationId;
    v5->_collaborationId = (NSString *)v8;

    v10 = objc_opt_class();
    NSStringFromSelector(sel_date);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    date = v5->_date;
    v5->_date = (NSDate *)v12;

    v14 = objc_opt_class();
    NSStringFromSelector(sel_guidString);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    guidString = v5->_guidString;
    v5->_guidString = (NSString *)v16;

  }
  return v5;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMCollaborationClearTransmission collaborationId](self, "collaborationId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p collaborationId = %@"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)collaborationId
{
  return self->_collaborationId;
}

- (NSDate)date
{
  return self->_date;
}

- (NSString)guidString
{
  return self->_guidString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guidString, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_collaborationId, 0);
}

@end
