@implementation BMEventContext

- (NSObject)previousEvent
{
  return self->_previousEvent;
}

- (void)setPreviousEvent:(id)a3
{
  objc_storeStrong((id *)&self->_previousEvent, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousEvent, 0);
}

@end
