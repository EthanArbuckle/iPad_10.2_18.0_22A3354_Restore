@implementation AttendeeListElement

- (NSMutableAttributedString)string
{
  return (NSMutableAttributedString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setString:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (BOOL)xMore
{
  return self->_xMore;
}

- (void)setXMore:(BOOL)a3
{
  self->_xMore = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_string, 0);
}

@end
