@implementation MOSubject

- (id)initSubject
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MOSubject;
  return -[MOPublisher initPublisher](&v3, sel_initPublisher);
}

- (void)sendCompletion:(id)a3
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3();
}

- (void)sendValue:(id)a3
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3();
}

@end
