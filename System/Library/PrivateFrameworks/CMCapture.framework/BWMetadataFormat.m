@implementation BWMetadataFormat

+ (id)formatWithMetadataFormatDescription:(opaqueCMFormatDescription *)a3
{
  if (!a3 || CMFormatDescriptionGetMediaType(a3) != 1835365473)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("must be passed a metadata format description"), 0));
  return -[BWMetadataFormat _initWithMetadataFormat:]([BWMetadataFormat alloc], a3);
}

- (_QWORD)_initWithMetadataFormat:(void *)a1
{
  _QWORD *v3;
  CFTypeRef v4;
  objc_super v6;

  if (!a1)
    return 0;
  v6.receiver = a1;
  v6.super_class = (Class)BWMetadataFormat;
  v3 = objc_msgSendSuper2(&v6, sel_init);
  if (v3)
  {
    if (a2)
      v4 = CFRetain(a2);
    else
      v4 = 0;
    v3[1] = v4;
  }
  return v3;
}

+ (void)initialize
{
  objc_opt_class();
}

- (void)dealloc
{
  opaqueCMFormatDescription *desc;
  objc_super v4;

  desc = self->_desc;
  if (desc)
    CFRelease(desc);
  v4.receiver = self;
  v4.super_class = (Class)BWMetadataFormat;
  -[BWMetadataFormat dealloc](&v4, sel_dealloc);
}

- (unsigned)mediaType
{
  return 1835365473;
}

- (id)description
{
  void *v3;
  FourCharCode MediaSubType;
  unsigned int v5;
  CFArrayRef Identifiers;
  unint64_t v7;
  unsigned int v9;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  MediaSubType = CMFormatDescriptionGetMediaSubType(self->_desc);
  v5 = bswap32(MediaSubType);
  if (!MediaSubType)
    v5 = 1061109567;
  v9 = v5;
  objc_msgSend(v3, "appendFormat:", CFSTR("meta, %.4s"), &v9);
  Identifiers = CMMetadataFormatDescriptionGetIdentifiers(self->_desc);
  if (-[__CFArray count](Identifiers, "count"))
  {
    v7 = 0;
    do
      objc_msgSend(v3, "appendFormat:", CFSTR(", %@"), -[__CFArray objectAtIndexedSubscript:](Identifiers, "objectAtIndexedSubscript:", v7++));
    while (v7 < -[__CFArray count](Identifiers, "count"));
  }
  return v3;
}

- (id)debugDescription
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> %@"), NSStringFromClass(v4), self, -[BWMetadataFormat description](self, "description"));
}

- (opaqueCMFormatDescription)formatDescription
{
  return self->_desc;
}

@end
