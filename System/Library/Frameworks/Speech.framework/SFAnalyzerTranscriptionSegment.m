@implementation SFAnalyzerTranscriptionSegment

- (SFAnalyzerTranscriptionSegment)initWithText:(id)a3 alternatives:(id)a4
{
  id v5;
  id v6;
  SFAnalyzerTranscriptionSegment *v7;
  uint64_t v8;
  NSArray *text;
  uint64_t v10;
  NSArray *alternatives;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SFAnalyzerTranscriptionSegment;
  v5 = a4;
  v6 = a3;
  v7 = -[SFAnalyzerTranscriptionSegment init](&v13, sel_init);
  v8 = objc_msgSend(v6, "copy", v13.receiver, v13.super_class);

  text = v7->_text;
  v7->_text = (NSArray *)v8;

  v10 = objc_msgSend(v5, "copy");
  alternatives = v7->_alternatives;
  v7->_alternatives = (NSArray *)v10;

  return v7;
}

- (NSArray)text
{
  return self->_text;
}

- (NSArray)alternatives
{
  return self->_alternatives;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternatives, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
