@implementation PHASEDefinition

- (PHASEDefinition)init
{
  -[PHASEDefinition doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

+ (PHASEDefinition)new
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)initInternal
{
  PHASEDefinition *v2;
  void *v3;
  uint64_t v4;
  NSString *identifier;
  PHASEDefinition *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PHASEDefinition;
  v2 = -[PHASEDefinition init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "UUIDString");
    v4 = objc_claimAutoreleasedReturnValue();
    identifier = v2->_identifier;
    v2->_identifier = (NSString *)v4;

    v6 = v2;
  }

  return v2;
}

- (NSString)uid
{
  return self->_identifier;
}

- (void)setUid:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void)setIdentifier:(id)a3
{
  id v5;

  v5 = a3;
  if (v5)
    objc_storeStrong((id *)&self->_identifier, a3);
  else
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("API Misuse"), CFSTR("Cannot set a UID of nil for a PHASEDefinition"));

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
