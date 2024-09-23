@implementation DATestQueueEntry

+ (id)queueEntryWithAttributes:(id)a3 parameters:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_msgSend(objc_alloc((Class)a1), "initWithAttributes:parameters:completion:", v10, v9, v8);

  return v11;
}

- (DATestQueueEntry)initWithAttributes:(id)a3 parameters:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  DATestQueueEntry *v12;
  DATestQueueEntry *v13;
  id v14;
  id completion;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)DATestQueueEntry;
  v12 = -[DATestQueueEntry init](&v17, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_attributes, a3);
    objc_storeStrong((id *)&v13->_parameters, a4);
    v14 = objc_retainBlock(v11);
    completion = v13->_completion;
    v13->_completion = v14;

  }
  return v13;
}

- (unint64_t)hash
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DATestQueueEntry attributes](self, "attributes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "identifier"));
  v4 = objc_msgSend(v3, "hash");

  return (unint64_t)v4;
}

- (BOOL)isEqualToTestQueueEntry:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DATestQueueEntry attributes](self, "attributes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "attributes"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
  v9 = objc_msgSend(v6, "isEqual:", v8);

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  DATestQueueEntry *v4;
  unsigned __int8 v5;
  uint64_t v6;

  v4 = (DATestQueueEntry *)a3;
  v5 = self == v4;
  v6 = objc_opt_class(DATestQueueEntry);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
    v5 = -[DATestQueueEntry isEqualToTestQueueEntry:](self, "isEqualToTestQueueEntry:", v4);

  return v5;
}

- (DKDiagnosticAttributes)attributes
{
  return self->_attributes;
}

- (id)completion
{
  return self->_completion;
}

- (DKDiagnosticParameters)parameters
{
  return self->_parameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
}

@end
