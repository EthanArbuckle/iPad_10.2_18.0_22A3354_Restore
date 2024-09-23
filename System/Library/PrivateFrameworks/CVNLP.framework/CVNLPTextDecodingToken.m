@implementation CVNLPTextDecodingToken

- (CVNLPTextDecodingToken)initWithString:(id)a3 score:(id)a4 alignmentScore:(id)a5 activationRange:(_NSRange)a6 terminatingCharacter:(id)a7
{
  NSUInteger location;
  id v13;
  id v14;
  id v15;
  id v16;
  CVNLPTextDecodingToken *v17;
  CVNLPTextDecodingToken *v18;
  NSUInteger length;
  objc_super v21;

  length = a6.length;
  location = a6.location;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)CVNLPTextDecodingToken;
  v17 = -[CVNLPTextDecodingToken init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_string, a3);
    objc_storeStrong((id *)&v18->_score, a4);
    objc_storeStrong((id *)&v18->_alignmentScore, a5);
    v18->_activationRange.location = location;
    v18->_activationRange.length = length;
    objc_storeStrong((id *)&v18->_terminatingCharacter, a7);
  }

  return v18;
}

- (CVNLPTextDecodingToken)initWithString:(id)a3 score:(id)a4 activationRange:(_NSRange)a5 terminatingCharacter:(id)a6
{
  return (CVNLPTextDecodingToken *)objc_msgSend_initWithString_score_alignmentScore_activationRange_terminatingCharacter_(self, a2, (uint64_t)a3, (uint64_t)a4, &unk_1E60D49A8, a5.location, a5.length, a6);
}

- (CVNLPTextDecodingToken)initWithString:(id)a3 score:(id)a4 activationRange:(_NSRange)a5 hasPrecedingSpace:(BOOL)a6
{
  CVNLPTextDecodingToken *result;

  result = (CVNLPTextDecodingToken *)objc_msgSend_initWithString_score_alignmentScore_activationRange_terminatingCharacter_(self, a2, (uint64_t)a3, (uint64_t)a4, &unk_1E60D49A8, a5.location, a5.length, 0);
  if (result)
    result->_hasPrecedingSpace = a6;
  return result;
}

- (NSString)fullString
{
  const char *v3;
  uint64_t v4;
  NSString *v5;
  NSString *terminatingCharacter;
  uint64_t v7;
  uint64_t v8;

  v5 = self->_string;
  terminatingCharacter = self->_terminatingCharacter;
  if (terminatingCharacter)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v3, (uint64_t)CFSTR("%@%@"), v4, self->_string, terminatingCharacter);
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (NSString *)v7;
  }
  if (self->_hasPrecedingSpace)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v3, (uint64_t)CFSTR(" %@"), v4, v5);
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (NSString *)v8;
  }
  return v5;
}

- (NSString)string
{
  return self->_string;
}

- (BOOL)hasPrecedingSpace
{
  return self->_hasPrecedingSpace;
}

- (NSString)terminatingCharacter
{
  return self->_terminatingCharacter;
}

- (NSNumber)score
{
  return self->_score;
}

- (NSNumber)alignmentScore
{
  return self->_alignmentScore;
}

- (_NSRange)activationRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_activationRange.length;
  location = self->_activationRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alignmentScore, 0);
  objc_storeStrong((id *)&self->_score, 0);
  objc_storeStrong((id *)&self->_terminatingCharacter, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

@end
