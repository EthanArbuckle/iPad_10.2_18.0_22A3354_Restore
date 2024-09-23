@implementation NLLexiconEntry

- (NLLexiconEntry)initWithString:(id)a3 tokenID:(unsigned int)a4 flags:(unint64_t)a5 probability:(double)a6
{
  id v10;
  NLLexiconEntry *v11;
  uint64_t v12;
  NSString *string;
  objc_super v15;

  v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NLLexiconEntry;
  v11 = -[NLLexiconEntry init](&v15, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v10, "copy");
    string = v11->_string;
    v11->_string = (NSString *)v12;

    v11->_tokenID = a4;
    v11->_flags = a5;
    v11->_probability = a6;
  }

  return v11;
}

+ (id)entryWithString:(id)a3 tokenID:(unsigned int)a4 flags:(unint64_t)a5 probability:(double)a6
{
  uint64_t v8;
  id v9;
  NLLexiconEntry *v10;

  v8 = *(_QWORD *)&a4;
  v9 = a3;
  v10 = -[NLLexiconEntry initWithString:tokenID:flags:probability:]([NLLexiconEntry alloc], "initWithString:tokenID:flags:probability:", v9, v8, a5, a6);

  return v10;
}

- (NSString)string
{
  return self->_string;
}

- (unsigned)tokenID
{
  return self->_tokenID;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (double)probability
{
  return self->_probability;
}

- (id)probabilityInfo
{
  NLProbabilityInfo *v3;

  v3 = [NLProbabilityInfo alloc];
  -[NLLexiconEntry probability](self, "probability");
  return -[NLProbabilityInfo initWithLog10Probability:flags:](v3, "initWithLog10Probability:flags:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_string, 0);
}

@end
