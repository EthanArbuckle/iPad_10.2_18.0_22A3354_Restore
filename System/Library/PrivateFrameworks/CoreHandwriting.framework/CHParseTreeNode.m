@implementation CHParseTreeNode

- (CHParseTreeNode)initWithName:(id)a3 inputRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  CHParseTreeNode *v15;

  length = a4.length;
  location = a4.location;
  v8 = a3;
  v14 = objc_msgSend_init(self, v9, v10, v11, v12, v13);
  v15 = (CHParseTreeNode *)v14;
  if (v14)
  {
    objc_storeStrong((id *)(v14 + 8), a3);
    v15->_inputRange.location = location;
    v15->_inputRange.length = length;
  }

  return v15;
}

- (NSString)name
{
  return self->_name;
}

- (_NSRange)inputRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_inputRange.length;
  location = self->_inputRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
