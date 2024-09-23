@implementation PHPersonPLAdapter

- (id)newObjectWithPropertySets:(id)a3
{
  void *v4;
  unint64_t v5;
  PHPerson *v6;
  void *v7;
  PHPerson *v8;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[PHPerson propertyFetchHintsForPropertySets:](PHPerson, "propertyFetchHintsForPropertySets:", v4);

  v6 = [PHPerson alloc];
  -[PHObjectPLAdapter photoLibrary](self, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PHPerson initWithFetchDictionary:propertyHint:photoLibrary:](v6, "initWithFetchDictionary:propertyHint:photoLibrary:", self, v5, v7);

  return v8;
}

- (id)objectForKey:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(CFSTR("uuid"), "isEqual:", v4) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PHPersonPLAdapter;
    -[PHObjectPLAdapter objectForKey:](&v7, sel_objectForKey_, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

@end
