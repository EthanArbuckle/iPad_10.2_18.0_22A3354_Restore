@implementation MGOutstandingQuery

- (MGOutstandingQuery)initWithPredicate:(id)a3
{
  id v4;
  MGOutstandingQuery *v5;
  NSUUID *v6;
  NSUUID *identifier;
  uint64_t v8;
  NSPredicate *predicate;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MGOutstandingQuery;
  v5 = -[MGOutstandingQuery init](&v11, sel_init);
  if (v5)
  {
    v6 = (NSUUID *)objc_alloc_init(MEMORY[0x24BDD1880]);
    identifier = v5->_identifier;
    v5->_identifier = v6;

    v8 = objc_msgSend(v4, "copy");
    predicate = v5->_predicate;
    v5->_predicate = (NSPredicate *)v8;

    v5->_requiresTopology = !-[NSPredicate mg_requiresCurrentDevice](v5->_predicate, "mg_requiresCurrentDevice");
  }

  return v5;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (BOOL)requiresTopology
{
  return self->_requiresTopology;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
