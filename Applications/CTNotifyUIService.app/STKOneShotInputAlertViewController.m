@implementation STKOneShotInputAlertViewController

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  unsigned int v10;
  BOOL v11;
  void *v12;
  objc_super v14;

  length = a4.length;
  location = a4.location;
  v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)STKOneShotInputAlertViewController;
  v10 = -[STKBaseInputAlertViewController textField:shouldChangeCharactersInRange:replacementString:](&v14, "textField:shouldChangeCharactersInRange:replacementString:", a3, location, length, v9);
  v11 = v10;
  if (v9)
  {
    if (v10)
    {
      v11 = 1;
      if (!self->_sentResponse)
      {
        self->_sentResponse = 1;
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[STKBaseAlertViewController sessionAction](self, "sessionAction"));
        objc_msgSend(v12, "sendSuccessWithResponse:", v9);

        -[STKBaseAlertViewController dismiss](self, "dismiss");
        v11 = 0;
      }
    }
  }

  return v11;
}

@end
