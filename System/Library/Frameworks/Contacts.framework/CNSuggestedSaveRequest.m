@implementation CNSuggestedSaveRequest

- (id)storeIdentifier
{
  return +[CNSuggestedContactStore storeIdentifier](CNSuggestedContactStore, "storeIdentifier");
}

- (void)confirmSuggestion:(id)a3
{
  NSMutableSet *mutableConfirmedSuggestions;
  NSMutableSet *v5;
  NSMutableSet *v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "isSuggested"))
  {
    mutableConfirmedSuggestions = self->_mutableConfirmedSuggestions;
    if (!mutableConfirmedSuggestions)
    {
      v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      v6 = self->_mutableConfirmedSuggestions;
      self->_mutableConfirmedSuggestions = v5;

      mutableConfirmedSuggestions = self->_mutableConfirmedSuggestions;
    }
    -[NSMutableSet addObject:](mutableConfirmedSuggestions, "addObject:", v7);
  }

}

- (void)rejectSuggestion:(id)a3
{
  NSMutableSet *mutableRejectedSuggestions;
  NSMutableSet *v5;
  NSMutableSet *v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "isSuggested"))
  {
    mutableRejectedSuggestions = self->_mutableRejectedSuggestions;
    if (!mutableRejectedSuggestions)
    {
      v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      v6 = self->_mutableRejectedSuggestions;
      self->_mutableRejectedSuggestions = v5;

      mutableRejectedSuggestions = self->_mutableRejectedSuggestions;
    }
    -[NSMutableSet addObject:](mutableRejectedSuggestions, "addObject:", v7);
  }

}

- (NSSet)confirmedSuggestions
{
  return (NSSet *)(id)-[NSMutableSet copy](self->_mutableConfirmedSuggestions, "copy");
}

- (NSSet)rejectedSuggestions
{
  return (NSSet *)(id)-[NSMutableSet copy](self->_mutableRejectedSuggestions, "copy");
}

- (NSMutableSet)mutableConfirmedSuggestions
{
  return self->_mutableConfirmedSuggestions;
}

- (void)setMutableConfirmedSuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_mutableConfirmedSuggestions, a3);
}

- (NSMutableSet)mutableRejectedSuggestions
{
  return self->_mutableRejectedSuggestions;
}

- (void)setMutableRejectedSuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_mutableRejectedSuggestions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableRejectedSuggestions, 0);
  objc_storeStrong((id *)&self->_mutableConfirmedSuggestions, 0);
}

@end
