@implementation _HDEventsCollectionAssertion

- (void)setEventCollectors:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 80), a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventCollectors, 0);
}

@end
