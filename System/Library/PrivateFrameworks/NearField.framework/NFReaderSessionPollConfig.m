@implementation NFReaderSessionPollConfig

- (NFReaderSessionPollConfig)init
{
  NFReaderSessionPollConfig *v2;
  NFReaderSessionPollConfig *v3;
  NFReaderSessionPollConfig *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NFReaderSessionPollConfig;
  v2 = -[NFReaderSessionPollConfig init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_technology = 23;
    v2->_fieldDetect = 1;
    v4 = v2;
  }

  return v3;
}

+ (id)pollConfigWithTechnology:(unsigned int)a3
{
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)&a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setTechnology:", v3);
  return v4;
}

- (void)setEcp:(id)a3
{
  BOOL v4;

  v4 = a3 != 0;
  objc_storeStrong((id *)&self->_ecp, a3);
  self->_technology = self->_technology & 0xFFFFFFF7 | (8 * v4);
}

- (id)asDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[NFReaderSessionPollConfig technology](self, "technology"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("tech"));

  -[NFReaderSessionPollConfig ecp](self, "ecp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NFReaderSessionPollConfig ecp](self, "ecp");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("ecp"));

  }
  if (-[NFReaderSessionPollConfig pollDuration](self, "pollDuration"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[NFReaderSessionPollConfig pollDuration](self, "pollDuration"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("pollDuration"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[NFReaderSessionPollConfig skipMifareClassify](self, "skipMifareClassify"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("skipMifareClassify"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[NFReaderSessionPollConfig lpcd](self, "lpcd"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("lpcd"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[NFReaderSessionPollConfig fieldDetect](self, "fieldDetect"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("fd"));

  return v3;
}

- (unsigned)technology
{
  return self->_technology;
}

- (void)setTechnology:(unsigned int)a3
{
  self->_technology = a3;
}

- (NSData)ecp
{
  return self->_ecp;
}

- (unsigned)pollDuration
{
  return self->_pollDuration;
}

- (void)setPollDuration:(unsigned int)a3
{
  self->_pollDuration = a3;
}

- (BOOL)skipMifareClassify
{
  return self->_skipMifareClassify;
}

- (void)setSkipMifareClassify:(BOOL)a3
{
  self->_skipMifareClassify = a3;
}

- (BOOL)lpcd
{
  return self->_lpcd;
}

- (void)setLpcd:(BOOL)a3
{
  self->_lpcd = a3;
}

- (BOOL)fieldDetect
{
  return self->_fieldDetect;
}

- (void)setFieldDetect:(BOOL)a3
{
  self->_fieldDetect = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ecp, 0);
}

@end
