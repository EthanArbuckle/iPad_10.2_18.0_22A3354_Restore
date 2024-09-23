@implementation _CNContactMatchingFetchRequestInfos

- (NSPredicate)predicate
{
  return self->_predicate;
}

+ (id)fetchRequestInfoForPredicate:(id)a3 properties:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init((Class)a1);
  objc_msgSend(v8, "setPredicate:", v7);

  objc_msgSend(v8, "setProperties:", v6);
  return v8;
}

- (void)setProperties:(id)a3
{
  objc_storeStrong((id *)&self->_properties, a3);
}

- (void)setPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_predicate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
}

- (NSArray)properties
{
  return self->_properties;
}

@end
