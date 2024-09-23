@implementation _MFCRRecentContactABContext

- (_MFCRRecentContactABContext)init
{
  _MFCRRecentContactABContext *v2;
  _MFCRRecentContactABContext *v3;
  _MFCRRecentContactABContext *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_MFCRRecentContactABContext;
  v2 = -[_MFCRRecentContactABContext init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_identifier = -1;
    v4 = v2;
  }

  return v3;
}

- (void)dealloc
{
  void *existingPerson;
  void *interimPerson;
  objc_super v5;

  existingPerson = self->_existingPerson;
  if (existingPerson)
    CFRelease(existingPerson);
  interimPerson = self->_interimPerson;
  if (interimPerson)
    CFRelease(interimPerson);
  v5.receiver = self;
  v5.super_class = (Class)_MFCRRecentContactABContext;
  -[_MFCRRecentContactABContext dealloc](&v5, sel_dealloc);
}

- (void)existingPerson
{
  return self->_existingPerson;
}

- (void)setExistingPerson:(void *)a3
{
  void *existingPerson;

  existingPerson = self->_existingPerson;
  if (existingPerson != a3)
  {
    if (existingPerson)
      CFRelease(existingPerson);
    self->_existingPerson = (void *)CFRetain(a3);
  }
}

- (void)interimPerson
{
  return self->_interimPerson;
}

- (void)setInterimPerson:(void *)a3
{
  void *interimPerson;

  interimPerson = self->_interimPerson;
  if (interimPerson != a3)
  {
    if (interimPerson)
      CFRelease(interimPerson);
    self->_interimPerson = (void *)CFRetain(a3);
  }
}

- (int)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(int)a3
{
  self->_identifier = a3;
}

@end
