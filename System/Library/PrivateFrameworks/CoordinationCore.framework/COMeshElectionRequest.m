@implementation COMeshElectionRequest

- (COMeshElectionRequest)initWithBallot:(id)a3 generation:(unint64_t)a4 listeningPort:(int)a5
{
  COMeshElectionRequest *result;

  result = -[COMeshBaseBallotRequest initWithBallot:generation:](self, "initWithBallot:generation:", a3, a4);
  if (result)
    result->_listeningPort = a5;
  return result;
}

- (COMeshElectionRequest)initWithCoder:(id)a3
{
  id v4;
  COMeshElectionRequest *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)COMeshElectionRequest;
  v5 = -[COMeshBaseBallotRequest initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("listeningPort"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_listeningPort = objc_msgSend(v6, "unsignedShortValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)COMeshElectionRequest;
  -[COMeshBaseBallotRequest encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  if (self->_listeningPort)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[COMeshElectionRequest listeningPort](self, "listeningPort"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("listeningPort"));

  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)acceptableResponses
{
  id v2;
  uint64_t v3;

  v2 = objc_alloc(MEMORY[0x24BDBCF20]);
  v3 = objc_opt_class();
  return (id)objc_msgSend(v2, "initWithObjects:", v3, objc_opt_class(), 0);
}

- (int)listeningPort
{
  return self->_listeningPort;
}

@end
