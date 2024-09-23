@implementation CNMetricsReporterSpiedEntry

- (CNMetricsReporterSpiedEntry)initWithDictionary:(id)a3 event:(id)a4 logged:(BOOL)a5
{
  id v8;
  id v9;
  CNMetricsReporterSpiedEntry *v10;
  uint64_t v11;
  NSMutableDictionary *dictionary;
  uint64_t v13;
  NSString *event;
  CNMetricsReporterSpiedEntry *v15;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CNMetricsReporterSpiedEntry;
  v10 = -[CNMetricsReporterSpiedEntry init](&v17, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    dictionary = v10->_dictionary;
    v10->_dictionary = (NSMutableDictionary *)v11;

    v13 = objc_msgSend(v9, "copy");
    event = v10->_event;
    v10->_event = (NSString *)v13;

    v10->_logged = a5;
    v15 = v10;
  }

  return v10;
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("event"), self->_event);
  v5 = (id)objc_msgSend(v3, "appendName:BOOLValue:", CFSTR("logged"), self->_logged);
  v6 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("dictionary"), self->_dictionary);
  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  CNMetricsReporterSpiedEntry *v4;
  NSString *event;
  NSMutableDictionary *dictionary;
  BOOL v7;

  v4 = (CNMetricsReporterSpiedEntry *)a3;
  v7 = 1;
  if (self != v4)
  {
    if ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || !self->_logged == v4->_logged
      || (event = self->_event, (unint64_t)event | (unint64_t)v4->_event)
      && !-[NSString isEqual:](event, "isEqual:")
      || (dictionary = self->_dictionary, (unint64_t)dictionary | (unint64_t)v4->_dictionary)
      && !-[NSMutableDictionary isEqual:](dictionary, "isEqual:"))
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  _BOOL8 logged;
  uint64_t v4;

  logged = self->_logged;
  v4 = objc_msgSend(MEMORY[0x1E0D13A78], "objectHash:", self->_event) - logged + 32 * logged;
  return objc_msgSend(MEMORY[0x1E0D13A78], "objectHash:", self->_dictionary) - v4 + 32 * v4 + 506447;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNMetricsReporterSpiedEntry)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  CNMetricsReporterSpiedEntry *v11;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("dictionary"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("event"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("logged"));

  v11 = -[CNMetricsReporterSpiedEntry initWithDictionary:event:logged:](self, "initWithDictionary:event:logged:", v8, v9, v10);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  NSMutableDictionary *dictionary;
  id v5;

  dictionary = self->_dictionary;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", dictionary, CFSTR("dictionary"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_event, CFSTR("event"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_logged, CFSTR("logged"));

}

- (NSMutableDictionary)dictionary
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)event
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)isLogged
{
  return self->_logged;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end
