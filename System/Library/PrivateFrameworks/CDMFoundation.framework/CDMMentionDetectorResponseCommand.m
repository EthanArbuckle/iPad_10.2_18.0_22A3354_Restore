@implementation CDMMentionDetectorResponseCommand

- (CDMMentionDetectorResponseCommand)initWithResponse:(id)a3
{
  id v4;
  CDMMentionDetectorResponseCommand *v5;
  uint64_t v6;
  SIRINLUINTERNALMENTION_DETECTORMentionDetectorResponse *response;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDMMentionDetectorResponseCommand;
  v5 = -[CDMBaseCommand init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    response = v5->_response;
    v5->_response = (SIRINLUINTERNALMENTION_DETECTORMentionDetectorResponse *)v6;

  }
  return v5;
}

- (SIRINLUINTERNALMENTION_DETECTORMentionDetectorResponse)response
{
  return self->_response;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);
}

@end
