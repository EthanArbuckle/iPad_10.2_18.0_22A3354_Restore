@implementation KMDeltaContactCollector

- (KMDeltaContactCollector)init
{
  KMDeltaContactCollector *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)KMDeltaContactCollector;
  result = -[KMDeltaContactCollector init](&v3, sel_init);
  if (result)
    result->_deltaType = 0;
  return result;
}

- (void)visitDropEverythingEvent:(id)a3
{
  self->_dropEverything = 1;
}

- (void)visitAddContactEvent:(id)a3
{
  NSString *v4;
  NSString *contactIdentifier;
  id v6;

  self->_deltaType = 1;
  objc_msgSend(a3, "contact");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  contactIdentifier = self->_contactIdentifier;
  self->_contactIdentifier = v4;

}

- (void)visitUpdateContactEvent:(id)a3
{
  NSString *v4;
  NSString *contactIdentifier;
  id v6;

  self->_deltaType = 2;
  objc_msgSend(a3, "contact");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  contactIdentifier = self->_contactIdentifier;
  self->_contactIdentifier = v4;

}

- (void)visitDeleteContactEvent:(id)a3
{
  NSString *v4;
  NSString *contactIdentifier;

  self->_deltaType = 3;
  objc_msgSend(a3, "contactIdentifier");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  contactIdentifier = self->_contactIdentifier;
  self->_contactIdentifier = v4;

}

- (void)reset
{
  NSString *contactIdentifier;

  self->_deltaType = 0;
  contactIdentifier = self->_contactIdentifier;
  self->_contactIdentifier = 0;

}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (void)setContactIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_contactIdentifier, a3);
}

- (unsigned)deltaType
{
  return self->_deltaType;
}

- (void)setDeltaType:(unsigned __int8)a3
{
  self->_deltaType = a3;
}

- (BOOL)dropEverything
{
  return self->_dropEverything;
}

- (void)setDropEverything:(BOOL)a3
{
  self->_dropEverything = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
}

@end
