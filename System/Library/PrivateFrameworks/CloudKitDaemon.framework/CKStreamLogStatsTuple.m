@implementation CKStreamLogStatsTuple

- (NSString)fileAndLine
{
  return self->_fileAndLine;
}

- (void)setFileAndLine:(id)a3
{
  objc_storeStrong((id *)&self->_fileAndLine, a3);
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileAndLine, 0);
}

@end
