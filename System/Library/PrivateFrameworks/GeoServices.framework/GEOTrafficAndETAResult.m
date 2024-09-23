@implementation GEOTrafficAndETAResult

- (BOOL)isSuccess
{
  return self->_isSuccess;
}

- (void)setIsSuccess:(BOOL)a3
{
  self->_isSuccess = a3;
}

- (double)seconds
{
  return self->_seconds;
}

- (void)setSeconds:(double)a3
{
  self->_seconds = a3;
}

- (double)aggressiveTravelTime
{
  return self->_aggressiveTravelTime;
}

- (void)setAggressiveTravelTime:(double)a3
{
  self->_aggressiveTravelTime = a3;
}

- (double)conservativeTravelTime
{
  return self->_conservativeTravelTime;
}

- (void)setConservativeTravelTime:(double)a3
{
  self->_conservativeTravelTime = a3;
}

- (NSString)shortTrafficString
{
  return self->_shortTrafficString;
}

- (void)setShortTrafficString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)longTrafficString
{
  return self->_longTrafficString;
}

- (void)setLongTrafficString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)writtenRouteName
{
  return self->_writtenRouteName;
}

- (void)setWrittenRouteName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)spokenRouteName
{
  return self->_spokenRouteName;
}

- (void)setSpokenRouteName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spokenRouteName, 0);
  objc_storeStrong((id *)&self->_writtenRouteName, 0);
  objc_storeStrong((id *)&self->_longTrafficString, 0);
  objc_storeStrong((id *)&self->_shortTrafficString, 0);
}

@end
