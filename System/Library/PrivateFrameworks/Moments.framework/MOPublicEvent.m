@implementation MOPublicEvent

- (MOPublicEvent)initWithName:(id)a3 performers:(id)a4 venue:(id)a5
{
  id v8;
  id v9;
  id v10;
  MOPublicEvent *v11;
  uint64_t v12;
  NSString *name;
  uint64_t v14;
  NSArray *performers;
  uint64_t v16;
  NSString *venue;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)MOPublicEvent;
  v11 = -[MOPublicEvent init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    name = v11->_name;
    v11->_name = (NSString *)v12;

    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", v9, 1);
    performers = v11->_performers;
    v11->_performers = (NSArray *)v14;

    v16 = objc_msgSend(v10, "copy");
    venue = v11->_venue;
    v11->_venue = (NSString *)v16;

  }
  return v11;
}

- (MOPublicEvent)initWithEventDictionary:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  MOPublicEvent *v9;
  NSObject *v10;
  void *v11;

  v5 = a3;
  objc_msgSend(v5, "objectForKey:", CFSTR("name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("performers"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("venue"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    self = -[MOPublicEvent initWithName:performers:venue:](self, "initWithName:performers:venue:", v6, v7, v8);
    v9 = self;
  }
  else
  {
    _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[MOPublicEvent initWithEventDictionary:].cold.1(v10);

    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOEventExtendedAtrributes.m"), 47, CFSTR("Invalid parameter not satisfying: name"));

    v9 = 0;
  }

  return v9;
}

- (id)description
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[MOPublicEvent name](self, "name");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = objc_msgSend(v4, "UTF8String");
  -[MOPublicEvent performers](self, "performers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOPublicEvent venue](self, "venue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<MOPublicEvent name, %s, performers, %@, venue, %@, >"), v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  id v5;

  name = self->_name;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", name, CFSTR("name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_performers, CFSTR("performers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_venue, CFSTR("venue"));

}

- (MOPublicEvent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  MOPublicEvent *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("performers"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("venue"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[MOPublicEvent initWithName:performers:venue:](self, "initWithName:performers:venue:", v5, v9, v10);
  return v11;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSArray)performers
{
  return self->_performers;
}

- (void)setPerformers:(id)a3
{
  objc_storeStrong((id *)&self->_performers, a3);
}

- (NSString)venue
{
  return self->_venue;
}

- (void)setVenue:(id)a3
{
  objc_storeStrong((id *)&self->_venue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_venue, 0);
  objc_storeStrong((id *)&self->_performers, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)initWithEventDictionary:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1CAE42000, log, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: name", v1, 2u);
}

@end
