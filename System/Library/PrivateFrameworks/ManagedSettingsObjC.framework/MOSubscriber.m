@implementation MOSubscriber

- (id)initSubscriber
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MOSubscriber;
  return -[MOSubscriber init](&v3, sel_init);
}

- (void)receiveSubscription:(id)a3
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3();
}

- (unint64_t)receiveInput:(id)a3
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_1();
  NSRequestConcreteImplementation();
  return 0;
}

- (void)receiveCompletion:(id)a3
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3();
}

@end
