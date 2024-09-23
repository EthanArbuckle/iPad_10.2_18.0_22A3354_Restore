@implementation CalScheduledTaskCache_TimeZoneFetchContext

- (NSTimeZone)previousTimeZone
{
  return self->_previousTimeZone;
}

- (void)setPreviousTimeZone:(id)a3
{
  objc_storeStrong((id *)&self->_previousTimeZone, a3);
}

- (NSTimeZone)nextTimeZone
{
  return self->_nextTimeZone;
}

- (void)setNextTimeZone:(id)a3
{
  objc_storeStrong((id *)&self->_nextTimeZone, a3);
}

- (NSMutableDictionary)dict
{
  return self->_dict;
}

- (void)setDict:(id)a3
{
  objc_storeStrong((id *)&self->_dict, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dict, 0);
  objc_storeStrong((id *)&self->_nextTimeZone, 0);
  objc_storeStrong((id *)&self->_previousTimeZone, 0);
}

@end
