@implementation _BRSuffixToTypeMapping

- (BOOL)appliesToType:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  int v6;

  v4 = (__CFString *)a3;
  -[_BRSuffixToTypeMapping type](self, "type");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = UTTypeConformsTo(v4, v5);

  return v6 != 0;
}

- (NSString)suffix
{
  return self->_suffix;
}

- (void)setSuffix:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_suffix, 0);
}

@end
