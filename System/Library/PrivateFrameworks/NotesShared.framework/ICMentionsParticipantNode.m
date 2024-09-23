@implementation ICMentionsParticipantNode

- (NSMutableSet)participants
{
  NSMutableSet *participants;
  NSMutableSet *v4;
  NSMutableSet *v5;

  participants = self->_participants;
  if (!participants)
  {
    v4 = (NSMutableSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 1);
    v5 = self->_participants;
    self->_participants = v4;

    participants = self->_participants;
  }
  return participants;
}

- (NSMutableSet)possibleParticipants
{
  NSMutableSet *possibleParticipants;
  NSMutableSet *v4;
  NSMutableSet *v5;

  possibleParticipants = self->_possibleParticipants;
  if (!possibleParticipants)
  {
    v4 = (NSMutableSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 1);
    v5 = self->_possibleParticipants;
    self->_possibleParticipants = v4;

    possibleParticipants = self->_possibleParticipants;
  }
  return possibleParticipants;
}

- (void)addParticipant:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[ICMentionsParticipantNode participants](self, "participants");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  -[ICMentionsParticipantNode addPossibleParticipant:](self, "addPossibleParticipant:", v5);
}

- (void)addPossibleParticipant:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ICMentionsParticipantNode possibleParticipants](self, "possibleParticipants");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

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

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSMutableDictionary)children
{
  return self->_children;
}

- (BOOL)isPossibleAll
{
  return self->_isPossibleAll;
}

- (void)setIsPossibleAll:(BOOL)a3
{
  self->_isPossibleAll = a3;
}

- (BOOL)isAll
{
  return self->_isAll;
}

- (void)setIsAll:(BOOL)a3
{
  self->_isAll = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_possibleParticipants, 0);
  objc_storeStrong((id *)&self->_participants, 0);
}

@end
