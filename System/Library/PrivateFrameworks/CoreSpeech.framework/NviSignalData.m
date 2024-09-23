@implementation NviSignalData

- (NviSignalData)initWithSignalType:(unint64_t)a3 timestamp:(unint64_t)a4
{
  NviSignalData *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NviSignalData;
  result = -[NviSignalData init](&v7, sel_init);
  if (result)
  {
    result->_sigType = a3;
    result->_sigGenTs = a4;
  }
  return result;
}

- (NviSignalData)initWithCoder:(id)a3
{
  id v4;
  NviSignalData *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NviSignalData;
  v5 = -[NviSignalData init](&v7, sel_init);
  if (v5)
  {
    v5->_sigType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    v5->_sigGenTs = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("ts"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t sigType;
  id v5;

  sigType = self->_sigType;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", sigType, CFSTR("type"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_sigGenTs, CFSTR("ts"));

}

- (id)stringForLogging
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = NviLogContextFacility;
  if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[NviSignalData stringForLogging]";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Abstract Impl. Returning nil", (uint8_t *)&v4, 0xCu);
  }
  return 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  +[NviUtils strRepForNviSignalType:](NviUtils, "strRepForNviSignalType:", self->_sigType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("{%@:ts=%lld}"), v4, self->_sigGenTs);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)sigType
{
  return self->_sigType;
}

- (void)setSigType:(unint64_t)a3
{
  self->_sigType = a3;
}

- (unint64_t)sigGenTs
{
  return self->_sigGenTs;
}

- (void)setSigGenTs:(unint64_t)a3
{
  self->_sigGenTs = a3;
}

+ (id)headerString
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = NviLogContextFacility;
  if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "+[NviSignalData headerString]";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Abstract Impl. Returning nil", (uint8_t *)&v4, 0xCu);
  }
  return 0;
}

@end
