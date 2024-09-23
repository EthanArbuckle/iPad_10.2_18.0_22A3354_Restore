@implementation CNAutocompleteNetworkActivityThrottlingPolicy

- (CNAutocompleteNetworkActivityThrottlingPolicy)initWithString:(id)a3
{
  id v4;
  CNAutocompleteNetworkActivityThrottlingPolicy *v5;
  CNAutocompleteNetworkActivityThrottlingPolicy *v6;

  v4 = a3;
  v5 = -[CNAutocompleteNetworkActivityThrottlingPolicy init](self, "init");
  if (v5)
  {
    v5->_lengthOfString = objc_msgSend(v4, "length");
    v6 = v5;
  }

  return v5;
}

- (BOOL)shouldSearchServers
{
  return self->_lengthOfString > 1;
}

- (double)delayBeforeBeginningNetworkActivity
{
  unint64_t lengthOfString;
  double result;

  lengthOfString = self->_lengthOfString;
  result = (5.0 - (double)lengthOfString) * 0.1;
  if (lengthOfString > 5)
    return 0.0;
  return result;
}

@end
