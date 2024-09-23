@implementation AGXA10FamilyDynamicLibrary

- (AGXA10FamilyDynamicLibrary)initWithLibrary:(id)a3 binaryData:(id)a4 device:(id)a5 error:(id *)a6
{
  AGXA10FamilyDynamicLibrary *v6;
  AGXA10FamilyDynamicLibrary *v7;
  _QWORD *v8;
  std::__shared_weak_count *cntrl;
  unint64_t *p_shared_owners;
  unint64_t v11;
  NSString *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)AGXA10FamilyDynamicLibrary;
  v6 = -[_MTLDynamicLibrary initWithLibrary:binaryData:device:error:](&v14, sel_initWithLibrary_binaryData_device_error_, a3, a4, a5, a6);
  if (v6)
  {
    v7 = v6;
    v8 = operator new(0x20uLL);
    v8[1] = 0;
    v8[2] = 0;
    *v8 = &off_250401698;
    cntrl = (std::__shared_weak_count *)v7->_impl.__cntrl_;
    v7->_impl.__ptr_ = (DynamicLibrary *)(v8 + 3);
    v7->_impl.__cntrl_ = (__shared_weak_count *)v8;
    if (!cntrl)
      goto LABEL_16;
    p_shared_owners = (unint64_t *)&cntrl->__shared_owners_;
    do
      v11 = __ldaxr(p_shared_owners);
    while (__stlxr(v11 - 1, p_shared_owners));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
      std::__shared_weak_count::__release_weak(cntrl);
    }
    if (v7->_impl.__ptr_)
    {
LABEL_16:
      if (-[_MTLDynamicLibrary installName](v7, "installName"))
        v12 = -[_MTLDynamicLibrary installName](v7, "installName");
      else
        v12 = -[_MTLObjectWithLabel label](v7, "label");
      -[NSString UTF8String](v12, "UTF8String");
    }

  }
  return 0;
}

- (AGXA10FamilyDynamicLibrary)initWithURL:(id)a3 device:(id)a4 error:(id *)a5
{
  return -[AGXA10FamilyDynamicLibrary initWithURL:device:options:error:](self, "initWithURL:device:options:error:", a3, a4, 0, a5);
}

- (AGXA10FamilyDynamicLibrary)initWithURL:(id)a3 device:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  AGXA10FamilyDynamicLibrary *v6;
  AGXA10FamilyDynamicLibrary *v7;
  _QWORD *v8;
  std::__shared_weak_count *cntrl;
  unint64_t *p_shared_owners;
  unint64_t v11;
  NSString *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)AGXA10FamilyDynamicLibrary;
  v6 = -[_MTLDynamicLibrary initWithURL:device:options:error:](&v14, sel_initWithURL_device_options_error_, a3, a4, a5, a6);
  if (v6)
  {
    v7 = v6;
    v8 = operator new(0x20uLL);
    v8[1] = 0;
    v8[2] = 0;
    *v8 = &off_250401698;
    cntrl = (std::__shared_weak_count *)v7->_impl.__cntrl_;
    v7->_impl.__ptr_ = (DynamicLibrary *)(v8 + 3);
    v7->_impl.__cntrl_ = (__shared_weak_count *)v8;
    if (!cntrl)
      goto LABEL_8;
    p_shared_owners = (unint64_t *)&cntrl->__shared_owners_;
    do
      v11 = __ldaxr(p_shared_owners);
    while (__stlxr(v11 - 1, p_shared_owners));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
      std::__shared_weak_count::__release_weak(cntrl);
    }
    if (v7->_impl.__ptr_)
    {
LABEL_8:
      -[_MTLDynamicLibrary binaryData](v7, "binaryData");
      if (-[_MTLDynamicLibrary installName](v7, "installName"))
        v12 = -[_MTLDynamicLibrary installName](v7, "installName");
      else
        v12 = -[_MTLObjectWithLabel label](v7, "label");
      -[NSString UTF8String](v12, "UTF8String");
    }

  }
  return 0;
}

- (AGXA10FamilyDynamicLibrary)initWithBinaryData:(id)a3 name:(id)a4 device:(id)a5
{
  AGXA10FamilyDynamicLibrary *v6;
  AGXA10FamilyDynamicLibrary *v7;
  _QWORD *v8;
  std::__shared_weak_count *cntrl;
  unint64_t *p_shared_owners;
  unint64_t v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)AGXA10FamilyDynamicLibrary;
  v6 = -[_MTLObjectWithLabel init](&v13, sel_init, a3, a4, a5);
  if (v6)
  {
    v7 = v6;
    v8 = operator new(0x20uLL);
    v8[1] = 0;
    v8[2] = 0;
    *v8 = &off_250401698;
    cntrl = (std::__shared_weak_count *)v7->_impl.__cntrl_;
    v7->_impl.__ptr_ = (DynamicLibrary *)(v8 + 3);
    v7->_impl.__cntrl_ = (__shared_weak_count *)v8;
    if (!cntrl)
      goto LABEL_8;
    p_shared_owners = (unint64_t *)&cntrl->__shared_owners_;
    do
      v11 = __ldaxr(p_shared_owners);
    while (__stlxr(v11 - 1, p_shared_owners));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
      std::__shared_weak_count::__release_weak(cntrl);
    }
    if (v7->_impl.__ptr_)
LABEL_8:
      objc_msgSend(a4, "UTF8String");

  }
  return 0;
}

- (unint64_t)binaryUniqueId
{
  return 0;
}

- (void).cxx_destruct
{
  __shared_weak_count *cntrl;
  unint64_t *v3;
  unint64_t v4;

  cntrl = self->_impl.__cntrl_;
  if (cntrl)
  {
    v3 = (unint64_t *)((char *)cntrl + 8);
    do
      v4 = __ldaxr(v3);
    while (__stlxr(v4 - 1, v3));
    if (!v4)
    {
      (*(void (**)(__shared_weak_count *, SEL))(*(_QWORD *)cntrl + 16))(cntrl, a2);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 8) = 0;
  return self;
}

@end
