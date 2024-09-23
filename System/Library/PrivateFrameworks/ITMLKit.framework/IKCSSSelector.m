@implementation IKCSSSelector

- (void)setName:(id)a3
{
  NSString *v4;
  NSString *name;

  objc_msgSend(a3, "ik_sharedInstance");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  self->_name = v4;

}

- (NSString)stringValue
{
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;

  switch(-[IKCSSSelector type](self, "type"))
  {
    case 0:
      v3 = (void *)MEMORY[0x1E0CB3940];
      -[IKCSSSelector name](self, "name");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "stringWithFormat:", CFSTR(".%@"), v4);
      goto LABEL_6;
    case 1:
      v6 = (void *)MEMORY[0x1E0CB3940];
      -[IKCSSSelector name](self, "name");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", CFSTR("#%@"), v4);
      goto LABEL_6;
    case 2:
      v7 = (void *)MEMORY[0x1E0CB3940];
      -[IKCSSSelector name](self, "name");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%@"), v4);
LABEL_6:
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

      break;
    case 3:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("*"));
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v5 = CFSTR("\"UNHANDLED_SELECTOR_TYPE\");
      break;
  }
  return (NSString *)v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;

  switch(-[IKCSSSelector type](self, "type"))
  {
    case 0:
      v3 = (void *)MEMORY[0x1E0CB3940];
      -[IKCSSSelector name](self, "name");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[IKCSSSelector name](self, "name");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "stringWithFormat:", CFSTR("{type:\"class\", name:\"%@\", value:\".%@\"}"), v4, v5);
      goto LABEL_6;
    case 1:
      v7 = (void *)MEMORY[0x1E0CB3940];
      -[IKCSSSelector name](self, "name");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[IKCSSSelector name](self, "name");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("{type:\"id\", name:\"%@\", value:\"#%@\"}"), v4, v5);
      goto LABEL_6;
    case 2:
      v8 = (void *)MEMORY[0x1E0CB3940];
      -[IKCSSSelector name](self, "name");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[IKCSSSelector name](self, "name");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("{type:\"type\", name:\"%@\", value:\"%@\"}"), v4, v5);
LABEL_6:
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

      break;
    case 3:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{type:\"universal\", value:\"*\"}"));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v6 = CFSTR("\"UNHANDLED_SELECTOR_TYPE\");
      break;
  }
  return v6;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSString)name
{
  return self->_name;
}

- (_NSRange)range
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_range.length;
  location = self->_range.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
