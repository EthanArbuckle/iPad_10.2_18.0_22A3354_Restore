@implementation DTLeaksServicePreservedGraphFile

- (void)dealloc
{
  objc_super v3;

  if (-[DTLeaksServicePreservedGraphFile fd](self, "fd") != -1)
  {
    close(-[DTLeaksServicePreservedGraphFile fd](self, "fd"));
    -[DTLeaksServicePreservedGraphFile setFd:](self, "setFd:", 0xFFFFFFFFLL);
  }
  v3.receiver = self;
  v3.super_class = (Class)DTLeaksServicePreservedGraphFile;
  -[DTLeaksServicePreservedGraphFile dealloc](&v3, sel_dealloc);
}

- (int)fd
{
  return self->_fd;
}

- (void)setFd:(int)a3
{
  self->_fd = a3;
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

- (unint64_t)token
{
  return self->_token;
}

- (void)setToken:(unint64_t)a3
{
  self->_token = a3;
}

- (NSDictionary)metaDict
{
  return self->_metaDict;
}

- (void)setMetaDict:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metaDict, 0);
}

@end
