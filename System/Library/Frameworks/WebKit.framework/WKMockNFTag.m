@implementation WKMockNFTag

- (unsigned)type
{
  return self->_type;
}

- (NSData)tagID
{
  return (NSData *)self->_tagID.m_ptr;
}

- (WKMockNFTag)initWithNFTag:(id)a3
{
  WKMockNFTag *v4;
  void *v5;
  void *v6;
  void *m_ptr;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WKMockNFTag;
  v4 = -[WKMockNFTag init](&v9, sel_init);
  if (v4)
  {
    v4->_type = objc_msgSend(a3, "type");
    v5 = (void *)objc_msgSend(a3, "tagID");
    v6 = v5;
    if (v5)
      CFRetain(v5);
    m_ptr = v4->_tagID.m_ptr;
    v4->_tagID.m_ptr = v6;
    if (m_ptr)
      CFRelease(m_ptr);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  self->_AppData = 0;
  self->_UID = 0;
  v3.receiver = self;
  v3.super_class = (Class)WKMockNFTag;
  -[WKMockNFTag dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  return 0;
}

- (BOOL)isEqualToNFTag:(id)a3
{
  return 0;
}

- (WKMockNFTag)initWithType:(unsigned int)a3
{
  uint64_t v3;
  const void *v5;
  WKMockNFTag *v6;

  v3 = *(_QWORD *)&a3;
  v6 = -[WKMockNFTag initWithType:tagID:](self, "initWithType:tagID:", v3, v5);
  if (v5)
    CFRelease(v5);
  return v6;
}

- (WKMockNFTag)initWithType:(unsigned int)a3 tagID:(id)a4
{
  WKMockNFTag *v6;
  WKMockNFTag *v7;
  void *m_ptr;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WKMockNFTag;
  v6 = -[WKMockNFTag init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_type = a3;
    if (a4)
      CFRetain(a4);
    m_ptr = v7->_tagID.m_ptr;
    v7->_tagID.m_ptr = a4;
    if (m_ptr)
      CFRelease(m_ptr);
  }
  return v7;
}

- (unsigned)technology
{
  return self->_technology;
}

- (NSData)AppData
{
  return self->_AppData;
}

- (NSData)UID
{
  return self->_UID;
}

- (unsigned)ndefAvailability
{
  return self->_ndefAvailability;
}

- (unint64_t)ndefMessageSize
{
  return self->_ndefMessageSize;
}

- (unint64_t)ndefContainerSize
{
  return self->_ndefContainerSize;
}

- (NFTagA)tagA
{
  return self->_tagA;
}

- (NFTagB)tagB
{
  return self->_tagB;
}

- (NFTagF)tagF
{
  return self->_tagF;
}

- (void).cxx_destruct
{
  void *m_ptr;

  m_ptr = self->_tagID.m_ptr;
  self->_tagID.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
