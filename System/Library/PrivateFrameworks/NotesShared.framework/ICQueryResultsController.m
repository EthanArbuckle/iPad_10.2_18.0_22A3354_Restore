@implementation ICQueryResultsController

- (ICQueryResultsController)initWithManagedObjectContext:(id)a3 query:(id)a4
{
  id v6;
  id v7;
  ICQueryResultsController *v8;
  ICQueryResultsControllerObjC *v9;
  ICQueryResultsControllerObjC *queryResultsControllerObjC;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICQueryResultsController;
  v8 = -[ICQueryResultsController init](&v12, sel_init);
  if (v8)
  {
    v9 = -[ICQueryResultsControllerObjC initWithManagedObjectContext:query:]([ICQueryResultsControllerObjC alloc], "initWithManagedObjectContext:query:", v6, v7);
    queryResultsControllerObjC = v8->_queryResultsControllerObjC;
    v8->_queryResultsControllerObjC = v9;

  }
  return v8;
}

- (id)performFetch
{
  void *v2;
  void *v3;

  -[ICQueryResultsController queryResultsControllerObjC](self, "queryResultsControllerObjC");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performFetch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSManagedObjectContext)managedObjectContext
{
  void *v2;
  void *v3;

  -[ICQueryResultsController queryResultsControllerObjC](self, "queryResultsControllerObjC");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSManagedObjectContext *)v3;
}

- (ICQuery)query
{
  void *v2;
  void *v3;

  -[ICQueryResultsController queryResultsControllerObjC](self, "queryResultsControllerObjC");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "query");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICQuery *)v3;
}

- (void)setQuery:(id)a3
{
  objc_storeStrong((id *)&self->_query, a3);
}

- (ICQueryResultsControllerObjC)queryResultsControllerObjC
{
  return self->_queryResultsControllerObjC;
}

- (void)setQueryResultsControllerObjC:(id)a3
{
  objc_storeStrong((id *)&self->_queryResultsControllerObjC, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryResultsControllerObjC, 0);
  objc_storeStrong((id *)&self->_query, 0);
}

@end
