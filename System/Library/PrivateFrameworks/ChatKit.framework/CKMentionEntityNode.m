@implementation CKMentionEntityNode

- (void)addEntity:(id)a3
{
  id v4;
  NSMutableSet *entities;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v4 = a3;
  entities = self->_entities;
  v8 = v4;
  if (!entities)
  {
    v6 = (NSMutableSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 1);
    v7 = self->_entities;
    self->_entities = v6;

    v4 = v8;
    entities = self->_entities;
  }
  -[NSMutableSet addObject:](entities, "addObject:", v4);
  -[CKMentionEntityNode addPossibleEntity:](self, "addPossibleEntity:", v8);

}

- (void)addPossibleEntity:(id)a3
{
  id v4;
  NSMutableSet *possibleEntities;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v4 = a3;
  possibleEntities = self->_possibleEntities;
  v8 = v4;
  if (!possibleEntities)
  {
    v6 = (NSMutableSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 1);
    v7 = self->_possibleEntities;
    self->_possibleEntities = v6;

    v4 = v8;
    possibleEntities = self->_possibleEntities;
  }
  -[NSMutableSet addObject:](possibleEntities, "addObject:", v4);

}

- (void)addChild:(id)a3
{
  id v4;
  NSMutableDictionary *children;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  void *v8;
  id v9;

  v4 = a3;
  children = self->_children;
  v9 = v4;
  if (!children)
  {
    v6 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
    v7 = self->_children;
    self->_children = v6;

    v4 = v9;
    children = self->_children;
  }
  objc_msgSend(v4, "key");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](children, "setObject:forKey:", v9, v8);

}

- (id)childWithKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CKMentionEntityNode children](self, "children");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (NSMutableSet)entities
{
  return self->_entities;
}

- (void)setEntities:(id)a3
{
  objc_storeStrong((id *)&self->_entities, a3);
}

- (NSMutableSet)possibleEntities
{
  return self->_possibleEntities;
}

- (void)setPossibleEntities:(id)a3
{
  objc_storeStrong((id *)&self->_possibleEntities, a3);
}

- (NSMutableDictionary)children
{
  return self->_children;
}

- (void)setChildren:(id)a3
{
  objc_storeStrong((id *)&self->_children, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_possibleEntities, 0);
  objc_storeStrong((id *)&self->_entities, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
