@implementation NMAPISectionResult

- (NMAPISectionResult)initWithSectionIdentifier:(id)a3 sectionDictionary:(id)a4 itemsArray:(id)a5
{
  id v9;
  id v10;
  id v11;
  NMAPISectionResult *v12;
  NMAPISectionResult *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)NMAPISectionResult;
  v12 = -[NMAPISectionResult init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_sectionIdentifier, a3);
    objc_storeStrong((id *)&v13->_sectionDictionary, a4);
    objc_storeStrong((id *)&v13->_itemsArray, a5);
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NMAPISectionResult *v4;
  id *p_isa;

  v4 = objc_alloc_init(NMAPISectionResult);
  p_isa = (id *)&v4->super.isa;
  if (v4)
  {
    objc_storeStrong((id *)&v4->_sectionIdentifier, self->_sectionIdentifier);
    objc_storeStrong(p_isa + 2, self->_sectionDictionary);
    objc_storeStrong(p_isa + 3, self->_itemsArray);
  }
  return p_isa;
}

- (NSString)sectionIdentifier
{
  return self->_sectionIdentifier;
}

- (NSDictionary)sectionDictionary
{
  return self->_sectionDictionary;
}

- (NSArray)itemsArray
{
  return self->_itemsArray;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemsArray, 0);
  objc_storeStrong((id *)&self->_sectionDictionary, 0);
  objc_storeStrong((id *)&self->_sectionIdentifier, 0);
}

@end
