@implementation MPCSharedListeningReactionEvent

- (MPCSharedListeningReactionEvent)initWithReaction:(id)a3 reactionIdentifier:(id)a4 item:(id)a5
{
  id v8;
  id v9;
  id v10;
  MPCSharedListeningReactionEvent *v11;
  uint64_t v12;
  NSString *reaction;
  uint64_t v14;
  NSString *reactionIdentifier;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)MPCSharedListeningReactionEvent;
  v11 = -[MPCSharedListeningReactionEvent init](&v17, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    reaction = v11->_reaction;
    v11->_reaction = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    reactionIdentifier = v11->_reactionIdentifier;
    v11->_reactionIdentifier = (NSString *)v14;

    objc_storeStrong((id *)&v11->_item, a5);
  }

  return v11;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<MPCSharedListeningReactionEvent: %p reaction=\"%@\" reactionID=%@ item=%@>"), self, self->_reaction, self->_reactionIdentifier, self->_item);
}

- (NSString)reactionIdentifier
{
  return self->_reactionIdentifier;
}

- (NSString)reaction
{
  return self->_reaction;
}

- (MPModelGenericObject)item
{
  return self->_item;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_reaction, 0);
  objc_storeStrong((id *)&self->_reactionIdentifier, 0);
}

@end
