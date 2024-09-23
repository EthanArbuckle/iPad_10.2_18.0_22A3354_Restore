@implementation GDGraphSportsTeam

- (GDGraphSportsTeam)initWithEntityIdentifierField:(id)a3 nameField:(id)a4 identifiersField:(id)a5 qidField:(id)a6 umcIdentifierField:(id)a7 allNameField:(id)a8 allQidField:(id)a9 allUmcIdentifierField:(id)a10
{
  id v17;
  GDGraphSportsTeam *v18;
  GDGraphSportsTeam *v19;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  objc_super v28;

  v27 = a3;
  v26 = a4;
  v25 = a5;
  v24 = a6;
  v23 = a7;
  v22 = a8;
  v21 = a9;
  v17 = a10;
  v28.receiver = self;
  v28.super_class = (Class)GDGraphSportsTeam;
  v18 = -[GDGraphSportsTeam init](&v28, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_entityIdentifier, a3);
    objc_storeStrong((id *)&v19->_name, a4);
    objc_storeStrong((id *)&v19->_identifiers, a5);
    objc_storeStrong((id *)&v19->_qid, a6);
    objc_storeStrong((id *)&v19->_umcIdentifier, a7);
    objc_storeStrong((id *)&v19->_allName, a8);
    objc_storeStrong((id *)&v19->_allQid, a9);
    objc_storeStrong((id *)&v19->_allUmcIdentifier, a10);
  }

  return v19;
}

- (GDGraphSportsTeamEntityIdentifier)entityIdentifier
{
  return self->_entityIdentifier;
}

- (NSString)name
{
  return self->_name;
}

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (NSString)qid
{
  return self->_qid;
}

- (NSString)umcIdentifier
{
  return self->_umcIdentifier;
}

- (NSArray)allName
{
  return self->_allName;
}

- (NSArray)allQid
{
  return self->_allQid;
}

- (NSArray)allUmcIdentifier
{
  return self->_allUmcIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allUmcIdentifier, 0);
  objc_storeStrong((id *)&self->_allQid, 0);
  objc_storeStrong((id *)&self->_allName, 0);
  objc_storeStrong((id *)&self->_umcIdentifier, 0);
  objc_storeStrong((id *)&self->_qid, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_entityIdentifier, 0);
}

@end
