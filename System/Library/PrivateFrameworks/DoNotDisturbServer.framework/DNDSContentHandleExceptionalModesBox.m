@implementation DNDSContentHandleExceptionalModesBox

- (DNDSContentHandleExceptionalModesBox)initWithContactHandle:(id)a3 allowed:(id)a4 silenced:(id)a5
{
  id v8;
  id v9;
  id v10;
  DNDSContentHandleExceptionalModesBox *v11;
  uint64_t v12;
  DNDContactHandle *contactHandle;
  uint64_t v14;
  NSArray *allowed;
  uint64_t v16;
  NSArray *silenced;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)DNDSContentHandleExceptionalModesBox;
  v11 = -[DNDSContentHandleExceptionalModesBox init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    contactHandle = v11->_contactHandle;
    v11->_contactHandle = (DNDContactHandle *)v12;

    v14 = objc_msgSend(v9, "copy");
    allowed = v11->_allowed;
    v11->_allowed = (NSArray *)v14;

    v16 = objc_msgSend(v10, "copy");
    silenced = v11->_silenced;
    v11->_silenced = (NSArray *)v16;

  }
  return v11;
}

- (DNDContactHandle)contactHandle
{
  return self->_contactHandle;
}

- (NSArray)allowed
{
  return self->_allowed;
}

- (NSArray)silenced
{
  return self->_silenced;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_silenced, 0);
  objc_storeStrong((id *)&self->_allowed, 0);
  objc_storeStrong((id *)&self->_contactHandle, 0);
}

@end
