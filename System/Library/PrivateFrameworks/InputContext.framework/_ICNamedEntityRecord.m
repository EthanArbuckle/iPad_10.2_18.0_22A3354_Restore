@implementation _ICNamedEntityRecord

- (_ICNamedEntityRecord)initWithName:(id)a3 data:(unint64_t)a4
{
  id v6;
  _ICNamedEntityRecord *v7;
  uint64_t v8;
  NSString *name;
  _ICNamedEntityRecord *v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_ICNamedEntityRecord;
  v7 = -[_ICNamedEntityRecord init](&v12, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    name = v7->_name;
    v7->_name = (NSString *)v8;

    v7->_data = a4;
    v7->_timestamp = CFAbsoluteTimeGetCurrent();
    v7->_passesFilters = 1;
    v10 = v7;
  }

  return v7;
}

- (_ICNamedEntityRecord)initWithName:(id)a3
{
  id v4;
  _ICNamedEntityRecord *v5;
  uint64_t v6;
  NSString *name;
  _ICNamedEntityRecord *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_ICNamedEntityRecord;
  v5 = -[_ICNamedEntityRecord init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v5->_timestamp = CFAbsoluteTimeGetCurrent();
    v5->_passesFilters = 1;
    v8 = v5;
  }

  return v5;
}

- (_ICNamedEntityRecord)initWithName:(id)a3 timestamp:(double)a4 passesFilters:(BOOL)a5
{
  id v8;
  _ICNamedEntityRecord *v9;
  uint64_t v10;
  NSString *name;
  _ICNamedEntityRecord *v12;
  objc_super v14;

  v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_ICNamedEntityRecord;
  v9 = -[_ICNamedEntityRecord init](&v14, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    name = v9->_name;
    v9->_name = (NSString *)v10;

    v9->_timestamp = a4;
    v9->_passesFilters = a5;
    v12 = v9;
  }

  return v9;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: %p; name=\"%@\", data=%llu, passesFilters=%d>"),
               objc_opt_class(),
               self,
               self->_name,
               self->_data,
               self->_passesFilters);
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)data
{
  return self->_data;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (BOOL)passesFilters
{
  return self->_passesFilters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
