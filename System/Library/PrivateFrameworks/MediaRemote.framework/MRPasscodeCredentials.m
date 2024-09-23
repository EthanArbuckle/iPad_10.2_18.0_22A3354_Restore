@implementation MRPasscodeCredentials

+ (id)standardCredentials
{
  MRPasscodeCredentials *v2;
  void *v3;

  v2 = objc_alloc_init(MRPasscodeCredentials);
  -[MRPasscodeCredentials setType:](v2, "setType:", 1);
  -[MRPasscodeCredentials setCharacterCount:](v2, "setCharacterCount:", 4);
  +[MRPasscodeCredentials _randomPasscode]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRPasscodeCredentials setPasscode:](v2, "setPasscode:", v3);

  return v2;
}

+ (id)_randomPasscode
{
  void *v0;
  uint64_t i;
  _BYTE bytes[32];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  SecRandomCopyBytes((SecRandomRef)*MEMORY[0x1E0CD7000], 0x20uLL, bytes);
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 4);
  for (i = 0; i != 32; i += 8)
    objc_msgSend(v0, "appendFormat:", CFSTR("%.1u"), *(_QWORD *)&bytes[i] % 0xAuLL);
  return v0;
}

- (unsigned)type
{
  return self->_type;
}

- (void)setType:(unsigned int)a3
{
  self->_type = a3;
}

- (unint64_t)characterCount
{
  return self->_characterCount;
}

- (void)setCharacterCount:(unint64_t)a3
{
  self->_characterCount = a3;
}

- (NSString)passcode
{
  return self->_passcode;
}

- (void)setPasscode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passcode, 0);
}

@end
