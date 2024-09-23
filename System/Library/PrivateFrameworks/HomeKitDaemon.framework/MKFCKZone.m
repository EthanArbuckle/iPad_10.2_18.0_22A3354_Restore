@implementation MKFCKZone

- (BOOL)importIntoLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  _BOOL4 v9;
  _BOOL4 v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v7 = a3;
  v8 = a5;
  v9 = -[MKFCKModel copyPropertiesIntoLocalModel:context:](self, "copyPropertiesIntoLocalModel:context:", v7, v8);
  if (self)
    v10 = v9;
  else
    v10 = 0;
  if (v10)
  {
    v11 = v8;
    v12 = v7;
    objc_msgSend(v12, "entity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "relationshipsByName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("rooms_"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[MKFCKModel relationshipForLocalName:localModel:](self, "relationshipForLocalName:localModel:", CFSTR("rooms_"), v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKFCKHomeObject _importSiblingRelationshipsIntoLocalModel:localRelationship:cloudRelationship:context:](self, v12, v15, v16, v11);

  }
  return v10;
}

- (BOOL)exportFromLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  _BOOL4 v9;
  _BOOL4 v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v7 = a3;
  v8 = a5;
  v9 = -[MKFCKModel copyPropertiesFromLocalModel:context:](self, "copyPropertiesFromLocalModel:context:", v7, v8);
  if (self)
    v10 = v9;
  else
    v10 = 0;
  if (v10)
  {
    v11 = v8;
    v12 = v7;
    objc_msgSend(v12, "entity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "relationshipsByName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("rooms_"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[MKFCKModel relationshipForLocalName:localModel:](self, "relationshipForLocalName:localModel:", CFSTR("rooms_"), v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKFCKHomeObject _exportSiblingRelationshipsFromLocalModel:localRelationship:cloudRelationship:context:](self, v12, v15, v16, v11);

  }
  return v10;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("MKFCKZone"));
}

@end
