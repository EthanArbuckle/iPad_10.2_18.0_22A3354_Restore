@implementation MPCSharedListeningEventParticipant

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<MPCSharedListeningEventParticipant: %p id=%@ externalID=%@>"), self, self->_sharedListeningIdentifier, self->_externalIdentifier);
}

- (NSUUID)sharedListeningIdentifier
{
  return self->_sharedListeningIdentifier;
}

- (NSString)externalIdentifier
{
  return self->_externalIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalIdentifier, 0);
  objc_storeStrong((id *)&self->_sharedListeningIdentifier, 0);
}

+ (MPCSharedListeningEventParticipant)participantWithSharedListeningIdentifier:(id)a3 externalIdentifier:(id)a4
{
  id v5;
  id v6;
  MPCSharedListeningEventParticipant *v7;
  uint64_t v8;
  NSUUID *sharedListeningIdentifier;
  uint64_t v10;
  NSString *externalIdentifier;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(MPCSharedListeningEventParticipant);
  v8 = objc_msgSend(v6, "copy");

  sharedListeningIdentifier = v7->_sharedListeningIdentifier;
  v7->_sharedListeningIdentifier = (NSUUID *)v8;

  v10 = objc_msgSend(v5, "copy");
  externalIdentifier = v7->_externalIdentifier;
  v7->_externalIdentifier = (NSString *)v10;

  return v7;
}

@end
