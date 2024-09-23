@implementation BKHIDEventProcessorCreationContext

- (BKHIDSystemInterfacing)systemInterface
{
  return self->_systemInterface;
}

- (void)setSystemInterface:(id)a3
{
  objc_storeStrong((id *)&self->_systemInterface, a3);
}

- (BKHIDEventDispatcher)eventDispatcher
{
  return self->_eventDispatcher;
}

- (void)setEventDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_eventDispatcher, a3);
}

- (BKIOHIDServiceMatcherDataProviding)serviceMatcherDataProvider
{
  return self->_serviceMatcherDataProvider;
}

- (void)setServiceMatcherDataProvider:(id)a3
{
  objc_storeStrong((id *)&self->_serviceMatcherDataProvider, a3);
}

- (BKHIDEventProcessorRegistering)eventProcessorRegistry
{
  return self->_eventProcessorRegistry;
}

- (void)setEventProcessorRegistry:(id)a3
{
  objc_storeStrong((id *)&self->_eventProcessorRegistry, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventProcessorRegistry, 0);
  objc_storeStrong((id *)&self->_serviceMatcherDataProvider, 0);
  objc_storeStrong((id *)&self->_eventDispatcher, 0);
  objc_storeStrong((id *)&self->_systemInterface, 0);
}

@end
