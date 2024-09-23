@implementation MPGreenTeaLoggerWrapper

- (void)logAccess
{
  -[ML3GreenTeaLogger logAccess](self->_logger, "logAccess");
}

- (MPGreenTeaLoggerWrapper)initWithAccessorName:(id)a3
{
  id v4;
  MPGreenTeaLoggerWrapper *v5;
  uint64_t v6;
  ML3GreenTeaLogger *logger;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPGreenTeaLoggerWrapper;
  v5 = -[MPGreenTeaLoggerWrapper init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0D51260]), "initWithAccessorName:", v4);
    logger = v5->_logger;
    v5->_logger = (ML3GreenTeaLogger *)v6;

  }
  return v5;
}

- (void)beginLogAccessInterval
{
  -[ML3GreenTeaLogger beginLogAccessInterval](self->_logger, "beginLogAccessInterval");
}

- (void)endLogAccessInterval
{
  -[ML3GreenTeaLogger endLogAccessInterval](self->_logger, "endLogAccessInterval");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
}

@end
