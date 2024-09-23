@implementation ICMentionCheckResults

- (ICMentionCheckResults)init
{
  ICMentionCheckResults *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICMentionCheckResults;
  result = -[ICMentionCheckResults init](&v3, sel_init);
  if (result)
    result->_rangeOfMention = (_NSRange)xmmword_1BDC15B20;
  return result;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  NSRange v13;

  -[ICMentionCheckResults matchingParticipants](self, "matchingParticipants");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ic_map:", &__block_literal_global_22);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3940];
  v13.location = -[ICMentionCheckResults rangeOfMention](self, "rangeOfMention");
  NSStringFromRange(v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ICMentionCheckResults isPartialMention](self, "isPartialMention");
  v9 = -[ICMentionCheckResults isExplicitMention](self, "isExplicitMention");
  if (-[ICMentionCheckResults isAllMention](self, "isAllMention"))
  {
    objc_msgSend(v6, "stringWithFormat:", CFSTR("Mention found at %@, partial: %d, explicit: %d, names: [%@]"), v7, v8, v9, CFSTR("all"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v5, "componentsJoinedByString:", CFSTR(","));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("Mention found at %@, partial: %d, explicit: %d, names: [%@]"), v7, v8, v9, v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

__CFString *__41__ICMentionCheckResults_debugDescription__block_invoke(uint64_t a1, void *a2)
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  objc_msgSend(a2, "ic_shortParticipantName");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = CFSTR("???");
  v4 = v2;

  return v4;
}

- (_NSRange)rangeOfMention
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_rangeOfMention.length;
  location = self->_rangeOfMention.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setRangeOfMention:(_NSRange)a3
{
  self->_rangeOfMention = a3;
}

- (BOOL)isPartialMention
{
  return self->_isPartialMention;
}

- (void)setIsPartialMention:(BOOL)a3
{
  self->_isPartialMention = a3;
}

- (BOOL)isExplicitMention
{
  return self->_isExplicitMention;
}

- (void)setIsExplicitMention:(BOOL)a3
{
  self->_isExplicitMention = a3;
}

- (BOOL)isAllMention
{
  return self->_isAllMention;
}

- (void)setIsAllMention:(BOOL)a3
{
  self->_isAllMention = a3;
}

- (NSSet)matchingParticipants
{
  return self->_matchingParticipants;
}

- (void)setMatchingParticipants:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)mentionString
{
  return self->_mentionString;
}

- (void)setMentionString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mentionString, 0);
  objc_storeStrong((id *)&self->_matchingParticipants, 0);
}

@end
