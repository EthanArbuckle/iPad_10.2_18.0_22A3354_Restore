@implementation FAScreentimeSettingsObjectCache

+ (Class)introductionModelClass
{
  return NSClassFromString(CFSTR("STIntroductionModel"));
}

- (FAScreentimeSettingsObjectCache)initWithIntroductionModel:(id)a3 date:(id)a4 dsid:(id)a5
{
  id v9;
  id v10;
  id v11;
  FAScreentimeSettingsObjectCache *v12;
  FAScreentimeSettingsObjectCache *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)FAScreentimeSettingsObjectCache;
  v12 = -[FAScreentimeSettingsObjectCache init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_memberDSID, a5);
    objc_storeStrong((id *)&v13->_date, a4);
    objc_storeStrong(&v13->_introductionModel, a3);
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *date;
  id v5;

  date = self->_date;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", date, CFSTR("_date"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_introductionModel, CFSTR("_introductionModel"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_memberDSID, CFSTR("_memberDSID"));

}

- (FAScreentimeSettingsObjectCache)initWithCoder:(id)a3
{
  id v4;
  FAScreentimeSettingsObjectCache *v5;
  uint64_t v6;
  NSDate *date;
  uint64_t v8;
  id introductionModel;
  uint64_t v10;
  NSNumber *memberDSID;

  v4 = a3;
  v5 = -[FAScreentimeSettingsObjectCache init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_date"));
    v6 = objc_claimAutoreleasedReturnValue();
    date = v5->_date;
    v5->_date = (NSDate *)v6;

    +[FAScreentimeSettingsObjectCache introductionModelClass](FAScreentimeSettingsObjectCache, "introductionModelClass");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_introductionModel"));
    v8 = objc_claimAutoreleasedReturnValue();
    introductionModel = v5->_introductionModel;
    v5->_introductionModel = (id)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_memberDSID"));
    v10 = objc_claimAutoreleasedReturnValue();
    memberDSID = v5->_memberDSID;
    v5->_memberDSID = (NSNumber *)v10;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)introductionModel
{
  return self->_introductionModel;
}

- (void)setIntroductionModel:(id)a3
{
  objc_storeStrong(&self->_introductionModel, a3);
}

- (NSNumber)memberDSID
{
  return self->_memberDSID;
}

- (void)setMemberDSID:(id)a3
{
  objc_storeStrong((id *)&self->_memberDSID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memberDSID, 0);
  objc_storeStrong(&self->_introductionModel, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

+ (id)objectWithData:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)MEMORY[0x1E0CB3710];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initForReadingFromData:error:", v4, 0);

  v6 = objc_opt_class();
  NSStringFromClass(+[FAScreentimeSettingsObjectCache introductionModelClass](FAScreentimeSettingsObjectCache, "introductionModelClass"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)dataRepresentation
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  NSStringFromClass(+[FAScreentimeSettingsObjectCache introductionModelClass](FAScreentimeSettingsObjectCache, "introductionModelClass"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "encodeObject:forKey:", self, v4);

  objc_msgSend(v3, "encodedData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
