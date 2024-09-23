@implementation AASetupAssistantCreateResponse

- (NSNumber)status
{
  void *v2;
  void *v3;

  -[AAResponse responseDictionary](self, "responseDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", AASetupAssistantCreateStatusKey);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (NSString)statusMessage
{
  void *v2;
  void *v3;

  -[AAResponse responseDictionary](self, "responseDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", AASetupAssistantCreateStatusMessageKey);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)personID
{
  void *v2;
  void *v3;

  -[AAResponse responseDictionary](self, "responseDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", AASetupAssistantDSIDKey);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)appleID
{
  void *v2;
  void *v3;

  -[AAResponse responseDictionary](self, "responseDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", AASetupAssistantCreateAppleIDKey);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)HSAAction
{
  return self->_HSAAction;
}

- (NSString)HSAData
{
  return self->_HSAData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_HSAData, 0);
  objc_storeStrong((id *)&self->_HSAAction, 0);
}

@end
