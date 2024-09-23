@implementation PHClientLinkedAgainst

- (PHClientLinkedAgainst)init
{
  PHClientLinkedAgainst *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PHClientLinkedAgainst;
  v2 = -[PHClientLinkedAgainst init](&v4, sel_init);
  if (v2)
    v2->_clientLinkedOnOrAfterFall2023OSVersions = dyld_program_sdk_at_least();
  return v2;
}

- (PHClientLinkedAgainst)initWithXPCDict:(id)a3
{
  id v4;
  PHClientLinkedAgainst *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PHClientLinkedAgainst;
  v5 = -[PHClientLinkedAgainst init](&v7, sel_init);
  if (v5)
    v5->_clientLinkedOnOrAfterFall2023OSVersions = xpc_dictionary_get_BOOL(v4, "PHLinkedOnOrAfterFall2023OSVersionsKey");

  return v5;
}

- (void)encodeToXPCDict:(id)a3
{
  xpc_object_t xdict;

  xdict = a3;
  xpc_dictionary_set_BOOL(xdict, "PHLinkedOnOrAfterFall2023OSVersionsKey", -[PHClientLinkedAgainst clientLinkedOnOrAfterFall2023OSVersions](self, "clientLinkedOnOrAfterFall2023OSVersions"));

}

- (BOOL)clientLinkedOnOrAfterFall2023OSVersions
{
  return self->_clientLinkedOnOrAfterFall2023OSVersions;
}

@end
