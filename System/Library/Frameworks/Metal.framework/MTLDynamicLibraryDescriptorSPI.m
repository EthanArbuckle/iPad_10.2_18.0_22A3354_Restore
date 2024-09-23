@implementation MTLDynamicLibraryDescriptorSPI

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_class *Class;
  int v12;
  MTLLibrary *library;
  NSURL *url;
  unint64_t options;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  if (a3 == self)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    v17 = v5;
    v18 = v4;
    v19 = v3;
    Class = object_getClass(self);
    if (Class == object_getClass(a3))
    {
      library = self->_library;
      if (library == (MTLLibrary *)objc_msgSend(a3, "library")
        || (v12 = -[MTLLibrary isEqual:](self->_library, "isEqual:", objc_msgSend(a3, "library"))) != 0)
      {
        url = self->_url;
        if (url == (NSURL *)objc_msgSend(a3, "url", v6, v17, v18, v19, v7, v8)
          || (v12 = -[NSURL isEqual:](self->_url, "isEqual:", objc_msgSend(a3, "url"))) != 0)
        {
          options = self->_options;
          LOBYTE(v12) = options == objc_msgSend(a3, "options");
        }
      }
    }
    else
    {
      LOBYTE(v12) = 0;
    }
  }
  return v12;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLDynamicLibraryDescriptorSPI;
  -[MTLDynamicLibraryDescriptorSPI dealloc](&v3, sel_dealloc);
}

- (unint64_t)hash
{
  _QWORD v4[3];

  bzero(v4, 0x18uLL);
  v4[0] = -[MTLLibrary hash](-[MTLDynamicLibraryDescriptorSPI library](self, "library"), "hash");
  v4[1] = -[NSURL hash](-[MTLDynamicLibraryDescriptorSPI url](self, "url"), "hash");
  v4[2] = -[MTLDynamicLibraryDescriptorSPI options](self, "options");
  return _MTLHashState((int *)v4, 0x18uLL);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  _QWORD *v6;

  v5 = (_QWORD *)objc_opt_new();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "setLibrary:", self->_library);
    v6[1] = -[NSURL copyWithZone:](self->_url, "copyWithZone:", a3);
    v6[3] = self->_options;
  }
  return v6;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (MTLLibrary)library
{
  return self->_library;
}

- (void)setLibrary:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

@end
