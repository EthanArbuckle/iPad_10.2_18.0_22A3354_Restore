@implementation AUViewController

- (void)beginRequestWithExtensionContext:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AUViewController;
  v4 = a3;
  -[AUViewController beginRequestWithExtensionContext:](&v5, sel_beginRequestWithExtensionContext_, v4);
  -[AUViewController setContext:](self, "setContext:", v4, v5.receiver, v5.super_class);

}

- (NSExtensionContext)context
{
  return (NSExtensionContext *)objc_getProperty(self, a2, 968, 1);
}

- (void)setContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 968);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

@end
