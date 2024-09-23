@implementation GTFaultingEncoder

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTFaultingEncoder)initWithCoder:(id)a3
{
  id v4;
  GTFaultingEncoder *v5;
  uint64_t v6;
  NSData *cpuCallstackData;
  uint64_t v8;
  NSString *metalLogMessage;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GTFaultingEncoder;
  v5 = -[GTFaultingEncoder init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cpuCallstackData"));
    v6 = objc_claimAutoreleasedReturnValue();
    cpuCallstackData = v5->_cpuCallstackData;
    v5->_cpuCallstackData = (NSData *)v6;

    v5->_cpuCallstackFramesNum = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("cpuCallstackFramesNum"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("metalLogMessage"));
    v8 = objc_claimAutoreleasedReturnValue();
    metalLogMessage = v5->_metalLogMessage;
    v5->_metalLogMessage = (NSString *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *cpuCallstackData;
  id v5;

  cpuCallstackData = self->_cpuCallstackData;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", cpuCallstackData, CFSTR("cpuCallstackData"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_cpuCallstackFramesNum, CFSTR("cpuCallstackFramesNum"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_metalLogMessage, CFSTR("metalLogMessage"));

}

- (NSData)cpuCallstackData
{
  return self->_cpuCallstackData;
}

- (void)setCpuCallstackData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unsigned)cpuCallstackFramesNum
{
  return self->_cpuCallstackFramesNum;
}

- (void)setCpuCallstackFramesNum:(unsigned int)a3
{
  self->_cpuCallstackFramesNum = a3;
}

- (NSString)metalLogMessage
{
  return self->_metalLogMessage;
}

- (void)setMetalLogMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metalLogMessage, 0);
  objc_storeStrong((id *)&self->_cpuCallstackData, 0);
}

@end
